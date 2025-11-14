Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 26216C5E66F
	for <lists+greybus-dev@lfdr.de>; Fri, 14 Nov 2025 18:03:16 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 06A8F3F75F
	for <lists+greybus-dev@lfdr.de>; Fri, 14 Nov 2025 17:03:15 +0000 (UTC)
Received: from mx0b-0024c301.pphosted.com (mx0b-0024c301.pphosted.com [148.163.153.153])
	by lists.linaro.org (Postfix) with ESMTPS id DE0B23F75F
	for <greybus-dev@lists.linaro.org>; Fri, 14 Nov 2025 16:52:06 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=silabs.com header.s=pps12202023 header.b=DjbN0hjR;
	dkim=pass header.d=silabs.com header.s=selector1 header.b=Ov34k3Vu;
	dmarc=pass (policy=reject) header.from=silabs.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1");
	spf=pass (lists.linaro.org: domain of Yacin.Belmihoub-Martel@silabs.com designates 148.163.153.153 as permitted sender) smtp.mailfrom=Yacin.Belmihoub-Martel@silabs.com
Received: from pps.filterd (m0101742.ppops.net [127.0.0.1])
	by mx0a-0024c301.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AECeIZ92442647;
	Fri, 14 Nov 2025 10:52:04 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps12202023;
	 bh=WFsgy+Qswkl6/eviM9qHAa1a2GfyfK4znExz6h9Ignc=; b=DjbN0hjRHcrR
	UMX5XJy9me3SNpzo+3wrkADfxTpBxdherIvZ2FsWNsuPS4L0SPfzmlS4OfqLdAeP
	JtkP4wxW2hBwrBXiTjebyFu73o+RytSP4rkiikf3YH4+MIsmyOG7AAdCCXcYd9aE
	kFHQy0bfZpuwPd6V1oOiMlcc6rSjludyLLEKAnS29MkYtd0vJcYVp+ldVRWoPMrW
	UQywqgdb746oStxHWR/QSyhVmzO6H1qC21LxtcQK1tiPIjuqrzOiiuoj1mhb/0zx
	R1XxtyvIXgrzX6rHsJo43UvlXyRcxx6cuRABpS6T9mCerBlWCqde2nqRiH0J6E5C
	2ejBCdCDQA==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11020096.outbound.protection.outlook.com [52.101.56.96])
	by mx0a-0024c301.pphosted.com (PPS) with ESMTPS id 4adr8fsuq8-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 14 Nov 2025 10:52:03 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xLDov/tQ8SH1jQZxzltpj9/V7/jJtnhnW2+wXMPGVuuQ84f4D7MC7Vq8+o0Jq7P1d8/jd+ywplu/0iQpbAQSa005jt96pRytlQTAb3B4z5WrsrYJ3ezyCpLjqRmUH41sjVA62zymshNZzN7fO7LAiqRxUPv8jlf0/CozH8jIHz5zXaAwrlXVxltzajkgNAYms/VXhtYHF8bb2f0RjWn2F0O9TVe+F8a6ACjcPm16oCGnRtSy+2NiEms9KnweaXYF3CvrT9qnpZzuz8j1jxWgByAkuF8Il4yuWMbsACPOuZvZg2z/UunoJ9PZJfNJGrosoP3uEuHd7dMwzgWng6UBbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WFsgy+Qswkl6/eviM9qHAa1a2GfyfK4znExz6h9Ignc=;
 b=Lnp7K8zcf5U3pvwi++JYBGp41KoWaBrqHUqMrtvsI+wqZigOyjarLG+hEq3pPksbIJ1yTq939utvGzO489e4Jt3nhUPQ1+oRdWMfytDnJN99wGqtKNRE6RpGL1S+YCz9KX7aqhP4zwF3lSdYbIzzRyRNytrLx0CFzjnTkliSkhQTFhM8OV+DBktJGprGHUxxGLdf+sRdkykivD46VlHBsX6lAwMlTZGPsm/k8nXdzPKKa7XhgHmCX9pRPZYPShsxQPoBiAHvHzSl1Lyap7hr5SPYxkPfDRADAe5X5eD2Yql9elXsALW237Js6OCh52IxUFQhCKGOSYfH5hPVJN0voA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silabs.com; dmarc=pass action=none header.from=silabs.com;
 dkim=pass header.d=silabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WFsgy+Qswkl6/eviM9qHAa1a2GfyfK4znExz6h9Ignc=;
 b=Ov34k3VuexB6K1OyQY76/AL/4JnED8C9A6fVBe12/VG4oGv13y1A+LzplZrrSH3npxYt/uRnsWch3v9KYI6ZVqD8jEOANRsbJu+nGgXN5zJyyh6uJD/8YLCpnWXvI9iEQigfw1vxOKLptHaqggyQ4ZmCgOMKNe7xIe0T3eYAcyw=
Received: from PH0PR11MB4998.namprd11.prod.outlook.com (2603:10b6:510:32::8)
 by BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Fri, 14 Nov
 2025 16:52:00 +0000
Received: from PH0PR11MB4998.namprd11.prod.outlook.com
 ([fe80::e321:4da6:3811:2e16]) by PH0PR11MB4998.namprd11.prod.outlook.com
 ([fe80::e321:4da6:3811:2e16%5]) with mapi id 15.20.9320.013; Fri, 14 Nov 2025
 16:52:00 +0000
Date: Fri, 14 Nov 2025 11:51:58 -0500
Message-Id: <DE8KNL9N9N0X.27HS2TBNRO840@silabs.com>
To: =?utf-8?q?Damien_Ri=C3=A9gel?= <damien.riegel@silabs.com>,
        <greybus-dev@lists.linaro.org>, "Johan Hovold" <johan@kernel.org>,
        "Alex
 Elder" <elder@kernel.org>,
        "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>,
        <linux-kernel@vger.kernel.org>
From: "Yacin Belmihoub-Martel" <yacin.belmihoub-martel@silabs.com>
X-Mailer: aerc 0.20.1-25-g357c1bff1570
References: <20251114150738.32426-1-damien.riegel@silabs.com>
 <20251114150738.32426-2-damien.riegel@silabs.com>
In-Reply-To: <20251114150738.32426-2-damien.riegel@silabs.com>
X-ClientProxiedBy: YQBPR0101CA0335.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:6b::20) To PH0PR11MB4998.namprd11.prod.outlook.com
 (2603:10b6:510:32::8)
X-MS-TrafficTypeDiagnostic: 
	PH0PR11MB4998:EE_|CY5PR11MB6233:EE_|PH0PR11MB4998:EE_|BL3PR11MB6508:EE_
X-MS-Office365-Filtering-Correlation-Id: 418f3f94-89d1-4331-f236-08de239e2180
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|14060799003|376014|1800799024|366016|35042699022;
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB4998.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(14060799003)(376014)(1800799024)(366016)(35042699022);DIR:OUT;SFP:1102;
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-MS-Exchange-CrossTenant-Network-Message-Id: f489b9fd-88e5-4ea3-1e60-08de239d0fdb
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB4998.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 16:44:21.7530
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 54dbd822-5231-4b20-944d-6f4abcd541fb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JLAvTlv4apjAbAolO4ts5YWPfs8oASCuUU1YXxyx+xqTvImOHE6dlNn9KrIl9nJ1WuVOe25WGKpFWHHC/SvJzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6233
X-MS-Exchange-Transport-EndToEndLatency: 00:00:04.1416354
X-MS-Exchange-Processed-By-BccFoldering: 15.20.9320.008
X-Microsoft-Antispam-Mailbox-Delivery: 
 ucf:0;jmr:0;auth:0;dest:I;ENG:(910005)(944506478)(944626604)(920097)(425001)(930097)(140003);
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?MWkrZHFxU3VEWEhqRG1kWVB4UFhYWGlxN3Q1anZ4TTVRRXhrU0l6bDN1cjJQ?=
 =?utf-8?B?VzFPV2FKWk5wdjRaOG9DME9QSldIREcwZkkyVHN2MWpkeWQwNFRVVGlsYU5j?=
 =?utf-8?B?NDYrNC90U01wOTllRm1kUXY3c2liQ3QwVGVLV2tUSHhWUnp2SGpoSVJkMXFJ?=
 =?utf-8?B?T05ZSU1zSU9DK2VNMnZ5SDM1S0RZRjBMYUxOTlpiUmFSWFVhZ2U4ZCsrQ2Fx?=
 =?utf-8?B?MHcweGVRVXZzTkRoUmM0aTNlUFZUWTl0V1ArdnBDUk5EV1phUG9vWXlPQWpn?=
 =?utf-8?B?LzhkMzhpaGIvSk1Xd25FeEhDQUZLdGVIeXBwRi9LUkR1NjhCTmJTWFpaNEll?=
 =?utf-8?B?WXBlVVdrN1docWlLZEhJcHM3WWRFN0RnUlZDbEFuRkV5Sk44VW1oZEhjdVNV?=
 =?utf-8?B?SkFLQ1BJYXYyc3dVeVJ4UWxsUVpnS3ZBbFVaVE54MVFJQmNrSnNmOTlHbDRR?=
 =?utf-8?B?MFZZS0prMGUrS0U5ZHhncUtKeWoxNmt6NTFmSGJwbnlQUThSclRJVzR0TUE5?=
 =?utf-8?B?WkhoTXpzWHFQUzJ0b3ZSZW5TbmNmUzhaME8vNTdUb0o2KzYyeCtHL0tIbUJP?=
 =?utf-8?B?bXhVV2ZiL1hpRW5OTnJjTUQ0SVU0UkFhbml3eTFJS1A5Nkk3S21RM3B3K05H?=
 =?utf-8?B?SzhCSWNzcDg4V2dDd1orNVNzSWY0b1RuVlc4YW5ZYUdwMnh5dnRsZWwrVkpG?=
 =?utf-8?B?TFZFVmpsWlB4Y2tiT3NXSWZDNzZhZDV3ZVBnYzBTZXRFaFljdjR2RTI1T3BD?=
 =?utf-8?B?cnRQdytLcGdySkp3WVBZSWhtQXNRdU9LSGp2N2crSGtobzdxUUVmS2o0TEJj?=
 =?utf-8?B?UEtlUWpPUGw4c1JadWRoR2R6ZlFSVEg4ZkRqOE1GbUdXTXRJeUJFVDB5aE10?=
 =?utf-8?B?TklBWm16b1poZ0RES0tRb3JFcUxoTVQwRG1sWjVNWVJFdTNzb3YwenNyUHJJ?=
 =?utf-8?B?WFZyREcwUkV0MmZ2WGpyc202YkxxU3R5aUQ2c1dDRk5HeGYyOHE2bnVQMUN0?=
 =?utf-8?B?dTdqM2c3ekpkYUc0OWpOalVsZlkyUzA0U1UyYmczeFJrb0Jaa1pXMTBBQzJY?=
 =?utf-8?B?UHFRam8wQmVJMFVTT3NmZXNBNUlxdCsyTU1Vc2oxcEhIcmhMV1FKUm1EMFpm?=
 =?utf-8?B?a0JEMTFpZU5oUHhjVGRzVmk4bDhvN1IyN1kwSnNQYitqWE5vcmROWXlMakJS?=
 =?utf-8?B?b3RrOXFrZ0g0SERRL3lJa1pxNlFaTDg2dWtUY0VBdjNRTjFQalVPVzhOT01z?=
 =?utf-8?B?SWFtYzRNS0t4NDc4a3FGd2IxZEtEbTlGOEpKM2g3d1BWZDRGSnJkRzBVV1g1?=
 =?utf-8?B?ZXBNWWRLNGJBdDBmSWd5OTFHREpoWFdBZzZZVlppNlJkaDk2VE5lYlB3UnRC?=
 =?utf-8?B?UHptRTYrOUVOQ2R5Z3QzQnkyM1ZHWkF2SmFrUEozaUdUbjNVTWQ1S2VRM0ds?=
 =?utf-8?B?R3pIT1c3NnlodWtrczlPSXVabE5iYXh1L3NxQnVZYXZLaFVHZnExbEg0THM3?=
 =?utf-8?B?M1J6N3ZlZUhCWUlxcmZkQndObHh6Y2xZM2dFRDBHOVRsc2JhaUJnUWs1M1JR?=
 =?utf-8?B?a2VxTDQ5Yk5FdkdDbzZra25xSHkyaXNpVDk1b2ZKR25FeTJ5TUlidk42em95?=
 =?utf-8?B?OGN0S21FOFN1MWhTWUF3c2tsS2dzRjNRVjZIM0EzQ0FpL2pJa2JOMkxralpB?=
 =?utf-8?B?RFhkempnRmorSk90Mnp2a0N5aEtFcmRCYXBtRnlrTHBoRWh4YWl1SjFKK1Ja?=
 =?utf-8?B?NnhmZWgxWmRtbm1kUWNVaURMQms4VjdTa05oNm1kVDEzNzg0bU9wcFQvcnJL?=
 =?utf-8?B?MEpwUXVhUDVMbmM2cE90d0ZXL3ZKL1hiTTlvSjF4NlpOUElpNUFPOTE2azhU?=
 =?utf-8?B?MVNBUnUrcXVEK0h5Wmo5a29OTEZpRGNLSHRJQ0RFVFpvTXlSOUFDT0pnYWdH?=
 =?utf-8?Q?JhPNDS0GgUasP+P/+YNNVR77Dd+yvr29?=
X-ClientProxiedBy: YQBPR0101CA0233.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:66::21) To PH0PR11MB4998.namprd11.prod.outlook.com
 (2603:10b6:510:32::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	f489b9fd-88e5-4ea3-1e60-08de239d0fdb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?YllveWFHT1NoaE1JRzNnR212alRoWG12NmxWMFhyZmpDM1YvNGVMRkc1UllT?=
 =?utf-8?B?MUNON0pCWitONlc3SzNtM2VhMlN5TVNnQUNUa3RVbzhDc1FzOUNTaDJNaTFG?=
 =?utf-8?B?c1RFRkxMV3Q2OWcrd29XUE1zUkdJNVMrbmpRZ2xWMWFjWThrQS9Ra0VXZVFo?=
 =?utf-8?B?dlVJMXl3V0djL2I0SDZBbGxOZWwrdmdXTS84aHVOTDJuTzhjMlhGQVBWUmZK?=
 =?utf-8?B?dGVWbHFpZktrTk13NGIxL2FXZUZ2K1JXTmpWK2hKNENaaWpUaHhUNFlYSUhO?=
 =?utf-8?B?Wktvd2kzTFNlL0svWDVMck14TVl6eUhTcENuUDRFdUxTVVc5Kzk5bGl3Q3dQ?=
 =?utf-8?B?NldhcUpIVERwSGhndHBOSEhkNHRFUERSNlllM0pGMkF3ZVpEQldOK291cjFx?=
 =?utf-8?B?UVU1QjdGL1BWOVcybnVVRnJOc3Z1RHFmWjNBY2drL1J4Rm9jdjRCc0w0Slcy?=
 =?utf-8?B?R3JvbDVJcXVwMEhQblhyTnNVK3JKVmNLTlF0OHNSZFpUTVFoU2RNL294NWhH?=
 =?utf-8?B?TFJGUGFHNEw3cHpXTllrOUI2ZzVtc2ZZMm80MENrbHdwcysxU2RwRmE3bE1I?=
 =?utf-8?B?Q2VzcXpPSDU4UnhaVUZsZ3QyK3RpNmVLditLdW1wQ1BqUHZhOXgxOEU3RVc1?=
 =?utf-8?B?V216dldBckFQcnhZSzV5UmNsQWZXVWJvR2k0N0JXTWNxc2U0TmU2VUVRc0xw?=
 =?utf-8?B?M3FHLzZieHBPdmQ1dXVUdlc1OEp4cDlza25Vc2M2ZUExTldkSy9pbExBVzkr?=
 =?utf-8?B?VEZkbG1WZDUrOFdpbHZmUmdZSmt0TndvMXhTaGdQTEJFRnNpUkR1RXVQOWJt?=
 =?utf-8?B?aGRvZWRWajBNcXQ4aEF5TmZHV0l1aURHMnVJYnI4dXVsTU5BalFSWERubERJ?=
 =?utf-8?B?YUU5SE5ORTlLR0NWMWpQbGdKREpoODYvSzkrYTZ1eEJsTDV1OHZtZ05jeTdt?=
 =?utf-8?B?OXduVHRndHFheEUvaEx6UWk4ekhrUzFqOUhHY0ZWT0RRYU5XQkJZWitRWHZo?=
 =?utf-8?B?eUtkeHZkRlpnR1ZYcDhQblMwMzRVdUs1TnF0aWw2Q1FLWERtUFVEZ0JGZEFE?=
 =?utf-8?B?dXJPTktkd0NPQSsxMGIrRE5kUTl5aGF1UTIwcUI3K1pieXY2NmtQSmRKQUJn?=
 =?utf-8?B?MGRLZlYyVkhFTGlqajdzS0h2NEprU0o2RVJTMmt4ZEdEMjJjSkdXZ0NpcG0y?=
 =?utf-8?B?NkNIdnMwTWphWks2N2ZuTmZWdDFPQTJxM083MWVNTndQUEpiUk04Q29IV3Y5?=
 =?utf-8?B?NGhtR1FLQXpjdGFxZmZzZGQvalF4ejFPVmtNUURycE9yQTFybmNEZ0oxUm1I?=
 =?utf-8?B?cVJmRjhmWFBTaHpmSXF2b2ZwTEdIUFQ2ODhiVXBzS1VCZXQwWm04SWo0c2tw?=
 =?utf-8?B?ODN0Mm84dVF2eW1xUWE2Y3FGQm1Ba3RsRUxLZTNtY0pkdTFUdjdvV3R6UzVr?=
 =?utf-8?B?cmQxM2ZHVmNrcDY2VVcxQlk3ZEFGeVFXbE9RZExDeUx4QklFMmROT0hUa2J5?=
 =?utf-8?B?KzlEL3JuSldsRTY5cjJ1WXgyWEx3VHJpZ1A1VUpZcm1VNUU2QVZvZzVURnZy?=
 =?utf-8?B?UzVOa0F2VU90YW5wK3loUkFyWG9qMjJpU0FXUWptRTFjQ2JTR1pVb0M4V1A0?=
 =?utf-8?B?UXZmT3pyelZrU2pCRzJVak5peEFXc05XR293b2RxeHJuM3NENTJpcFJvMTBz?=
 =?utf-8?B?MXdFZDdEQWRIaG10YlEybGNYazlKb0xBOS9FZHhWTnBadWRBaGNHeCtrVTBZ?=
 =?utf-8?B?VXp1bkJNM0swYjFldFRNeVAwRzhkQ2c0azV2THVROHAzZHI0SUZ4STdBUU1k?=
 =?utf-8?B?cG9vRUYvc1ZQTnZ1MW94OStxdkx5eUc0N2RQemdMdnRGeXVNNW5sWVc3bWE4?=
 =?utf-8?B?UEI4TzRvNXBIMjZYWVkrY1RoeFAxalJ6bWowM3hMNTZWWnlzQWZjWjNMWmp2?=
 =?utf-8?B?aEdYbFF5OVBrTG8yeVRUNHBEbkpaVVNrVFZnZ0NNMVBqa1cxYU9rZ2o0Y1Fp?=
 =?utf-8?B?N094V2dvSWxENEZCSmk1anI5bTFNcnFsS3FhQWZ6d01PQ1ZmQzhMdFdlMHI1?=
 =?utf-8?B?MG5MbVpqcTdGb2V2dHQzb2VEOTIxZWhKVGpxeW9oYWpkaC94L0hENDBMWnhM?=
 =?utf-8?Q?f9oLXmZPEdwPfJ45jJk2tMVZT?=
X-OriginatorOrg: silabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 418f3f94-89d1-4331-f236-08de239e2180
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB4998.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 16:52:00.8003
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 54dbd822-5231-4b20-944d-6f4abcd541fb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ANG7wCzk9hZCpDda6kigEVRE6Olwy7nXeEx09+zAROg0lPhmzutU+G6/3twHwMo0JIQgP1FWUsJjKwtslN9m3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6508
X-Proofpoint-ORIG-GUID: mlDRA1p54aUv-g3x2TRr3ROGMsxWRE9W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDEzNSBTYWx0ZWRfX9uRpNKwGMn1v
 24QhcBmjVZ+2lB+60OKMisNlGHrvw7rO3J2tXge+gCuP2l+VofG+e1CPBSkCLQqxEnKJ5FfjapI
 ydxI+oS89tpN3ISOX+eHmHDd3d0sNOajtmIqZH/j6KMLLldThAFmkzR10aGDYxmgiq1NsiEQzMD
 zNE7gWmQ5jTFPZliW/bRanF7K4ZFBft8NfhEF6NmfiLm7QEBkQuZYs3CVCYZBuZiHlRp6mFD9cG
 Y0IHL0ZZet5mRzGWw8jAzw9un6Lhvh7/tEdWYvHCsDYpmfTWbfd95yyX8AHjQkiuIWa6rglfW1v
 j7CMA84C688MXoLN84z00vRDO7nFNzwqhVUsHYqJUrZhUfzmWS5nTk7hUUJ5zauUP21L3jKAy0/
 2hv18rDXWJtw9pYi6Fn9qN2SZtppDA==
X-Authority-Analysis: v=2.4 cv=BYPVE7t2 c=1 sm=1 tr=0 ts=69175e34 cx=c_pps
 a=NO5CczpcTQW1gtzKHD9VpQ==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=i1IsUcr2s-wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=F0weUSp5pyGIr-2fPg4A:9 a=QEXdDO2ut3YA:10
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: mlDRA1p54aUv-g3x2TRr3ROGMsxWRE9W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_05,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511140135
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: DE0B23F75F
X-Spamd-Bar: ----
X-Spamd-Result: default: False [-4.99 / 15.00];
	BAYES_HAM(-2.99)[99.93%];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[silabs.com,reject];
	R_DKIM_ALLOW(-0.20)[silabs.com:s=pps12202023,silabs.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:148.163.153.153];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_POSSIBLE(0.00)[148.163.153.153:from];
	ASN(0.00)[asn:22843, ipnet:148.163.152.0/22, country:US];
	RCPT_COUNT_SEVEN(0.00)[7];
	MIME_TRACE(0.00)[0:+];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	DKIM_TRACE(0.00)[silabs.com:+]
X-Rspamd-Action: no action
X-MailFrom: Yacin.Belmihoub-Martel@silabs.com
X-Mailman-Rule-Hits: implicit-dest
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
Message-ID-Hash: 4FOPTGOWXSEUBYCGYHSB3ZV3CJS3AQTZ
X-Message-ID-Hash: 4FOPTGOWXSEUBYCGYHSB3ZV3CJS3AQTZ
X-Mailman-Approved-At: Fri, 14 Nov 2025 17:03:05 +0000
CC: Silicon Labs Kernel Team <linux-devel@silabs.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [RFC PATCH v2 01/12] greybus: cpc: add minimal CPC Host Device infrastructure
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/4FOPTGOWXSEUBYCGYHSB3ZV3CJS3AQTZ/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gRnJpIE5vdiAxNCwgMjAyNSBhdCAxMDowNyBBTSBFU1QsIERhbWllbiBSacOpZ2VsIHdyb3Rl
Og0KPiAgIyBHcmV5YnVzIEhvc3QgY29udHJvbGxlciBkcml2ZXJzDQo+ICBvYmotJChDT05GSUdf
R1JFWUJVU19CRUFHTEVQTEFZKQkrPSBnYi1iZWFnbGVwbGF5Lm8NCg0KVGhlIGFib3ZlIGNvbW1l
bnQgd2FzIG1vdmVkIHdpdGhvdXQgYSBwcm9wZXIgY29tbWl0IHRvIHRoZSBwYXRjaHNldCwNCm1h
a2luZyBpdCB1bnVzYWJsZSB3aXRoIGBnaXQgYW1gLiBSZXZpZXdlcnMgc2hvdWxkIHJlbW92ZSB0
aGlzDQptb2RpZmljYXRpb24uIA0KDQpUaGFua3MsDQotLSANCllhY2luIEJlbG1paG91Yi1NYXJ0
ZWwNClNpbGljb24gTGFib3JhdG9yaWVzDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmdyZXlidXMtZGV2IG1haWxpbmcgbGlzdCAtLSBncmV5YnVzLWRl
dkBsaXN0cy5saW5hcm8ub3JnClRvIHVuc3Vic2NyaWJlIHNlbmQgYW4gZW1haWwgdG8gZ3JleWJ1
cy1kZXYtbGVhdmVAbGlzdHMubGluYXJvLm9yZwo=
