Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C768C5DC1B
	for <lists+greybus-dev@lfdr.de>; Fri, 14 Nov 2025 16:08:51 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id EEAEA3F83B
	for <lists+greybus-dev@lfdr.de>; Fri, 14 Nov 2025 15:08:49 +0000 (UTC)
Received: from mx0a-0024c301.pphosted.com (mx0a-0024c301.pphosted.com [148.163.149.154])
	by lists.linaro.org (Postfix) with ESMTPS id 20BEE3F855
	for <greybus-dev@lists.linaro.org>; Fri, 14 Nov 2025 15:08:37 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=silabs.com header.s=pps12202023 header.b=clN2Rh4T;
	dkim=pass header.d=silabs.com header.s=selector1 header.b="BFBl/U7k";
	dmarc=pass (policy=reject) header.from=silabs.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1");
	spf=pass (lists.linaro.org: domain of Damien.Riegel@silabs.com designates 148.163.149.154 as permitted sender) smtp.mailfrom=Damien.Riegel@silabs.com
Received: from pps.filterd (m0101743.ppops.net [127.0.0.1])
	by mx0a-0024c301.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AE9ueVB2132744;
	Fri, 14 Nov 2025 09:08:34 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps12202023;
	 bh=iu4qiL8ZvAKJHdjb3gY4F4pS7vyMJcwYD/BVd0q8BdM=; b=clN2Rh4TbPk+
	lTH04CALgNyX6iR0xOgCABzqKPE8jKWxaSsMMGGMSoyPe56Bv1XPGTQsjeAwFTZJ
	pwHor5Rd+VU85nYy3ufVtlZuReacpUM5yDzuJk5d/VAk4Vu62EFVneUgsWkkrpN/
	YmxXGI7UTxgjVJTF50HaCf0iClwrF9t4cF5fQWur3N0vH8xUAFK05ssCPdCKb3MW
	fdGJzufD+IV9+tJfAYWwaQs4VAyYPVg6BNJMxLAcNIC88A/yvD0Y59PiTi/h3FpU
	SLPaMGMQgyet6nF9oM73UkMWQunlk6ZeW7KUO5OPXgdKnYFQeye21QHJ9foJlXmV
	qO+QGyLNSw==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11022081.outbound.protection.outlook.com [40.107.209.81])
	by mx0a-0024c301.pphosted.com (PPS) with ESMTPS id 4ae285rk1u-3
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 14 Nov 2025 09:08:33 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kAit8/STjidb8H898WzEYNAWat5lFs5yk/iul2B/CZF1W5x5R1S+6MIOChOKg1iOAr+yiKemgWMjChkOMnmE+vTV5zNPD5vJGA0H65wDy2MKafaxvireEyPJAt70KgvG1/NLdeHQuL0rzJvSzekcWejIEawIn+ovR636KWYT3EphK+SIG9OZpPiZEfif+DXm640lEUnpMG+NedilCI/32hSHeYdAuElVnLyy7GHz3dBrXohcoFE4eL/+bMpoBW7ZMY2UP8a+CWKwHmD/NxEgfo9A9i7A5CxDOAT2RrC8CwbiSHp5IizU+p/mrdxMjq6m8zCDITnIz949b9JLsQYVEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iu4qiL8ZvAKJHdjb3gY4F4pS7vyMJcwYD/BVd0q8BdM=;
 b=ppJuQetcP2F/bYn/sVEwFTU25zhD7z8PQl7bRh2QuqeiC0cfzBUvEP2DoA72poqG7H6Fi68jiil0W2GVls7kcDqTVtJ0ANpKlpvpvfNIu5rmsw0ZKcMD/outIVDmMCwfP1uiNeE24r0tWa/j0qAwM/6yFsuITASE3U3A4GoMgjZ9HLQMQqqw0tg0LKdRzlHmfXTVRM891kNIYPEhnmHl5a6vHvdZnjRkvBaZ0hR9xacAFejMT1mRf3yRByyVN58jyubxZ1DEL5KKJfa66pwZ7xeNhAA/jSLpwoLX8EhNepTuYM5JXeqQG8LUsCkNKuX38oI+mSTeYNi5ESYD8n45tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silabs.com; dmarc=pass action=none header.from=silabs.com;
 dkim=pass header.d=silabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iu4qiL8ZvAKJHdjb3gY4F4pS7vyMJcwYD/BVd0q8BdM=;
 b=BFBl/U7kDA05dxCCHkAW5iJF0N5Asy+OksUJ6DHRQJ5E+E7AdOF54Xx6XLCdbRFQDQORj0pWKXJ+iJd2b9/KjvsHj6Q9uR+xPNpUqV/ZdYGQq9HQ+uTGRm5GbCQKBIE9nfiQhAP06G89yP+fP0CffslGobI1a/N3X3f31uKS8TU=
Received: from DS0PR11MB8205.namprd11.prod.outlook.com (2603:10b6:8:162::17)
 by CH3PR11MB8774.namprd11.prod.outlook.com (2603:10b6:610:1cd::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Fri, 14 Nov
 2025 15:08:26 +0000
Received: from DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::c508:9b04:3351:524a]) by DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::c508:9b04:3351:524a%5]) with mapi id 15.20.9320.018; Fri, 14 Nov 2025
 15:08:26 +0000
From: =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
To: greybus-dev@lists.linaro.org, Johan Hovold <johan@kernel.org>,
        Alex Elder <elder@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org
Date: Fri, 14 Nov 2025 10:07:33 -0500
Message-ID: <20251114150738.32426-8-damien.riegel@silabs.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251114150738.32426-1-damien.riegel@silabs.com>
References: <20251114150738.32426-1-damien.riegel@silabs.com>
X-ClientProxiedBy: MA5P287CA0046.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:175::12) To DS0PR11MB8205.namprd11.prod.outlook.com
 (2603:10b6:8:162::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8205:EE_|CH3PR11MB8774:EE_
X-MS-Office365-Filtering-Correlation-Id: 7395a03b-273b-44e9-d125-08de238fa8e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?TEpycDNtUWZ5dnZjaENZMkVTSmNkTkpEdURWK3NuN0VtTTQyN3Y1clZJNEE0?=
 =?utf-8?B?cnZIbFB4UTZvQWhZR21XZGZSVnovSDE3ZjhTTkIxL1FTMUZISEpzU2hlcE9a?=
 =?utf-8?B?U2w2Q2Rtdm9JTWN5ZUtrWTVrSG1rNzFKeGRINXJheUJEWnpsK2NjRUlYQ2JZ?=
 =?utf-8?B?MlFSSG9hdU8xZ1NyT1FFa0NPc0l2V2JQYnpBQ1JRMmpuMmVPdjZQay9sdFJt?=
 =?utf-8?B?bGRBVC9DL091WDIwYkd5a1IxQnovTW5DWXljTHY4R3RLKzZsclZXNjZBcVhE?=
 =?utf-8?B?dElkR2Y0MXVIcjd5emRVOVN4a3NvbHRZMXY2b2owRG9lWk81czB4ODU1YnZo?=
 =?utf-8?B?V0xKSTlIN2xzMXVVRkZXRVhJeHVrdW5Ic3c4UysxcFlJeDRnd2xTMm9YVXB4?=
 =?utf-8?B?YnFFUmQ3L2t3aDV3OURST2R5bzVaSC91QTFSbUxaMmJtKzZmM2tKUkFMakc2?=
 =?utf-8?B?cHZ2aVczY1NMRlR6NFlaVHdMMHcvWE1NNXJNTGFURVpaUFZxWERNNWdlUzI2?=
 =?utf-8?B?UWhWa3lRTHNmVFg3bTFRYjdtdll1U2MrRWczQ2p6SS95ZTMySXI5V1IzWmtL?=
 =?utf-8?B?ZEwzMUpnbkE3WmtTSDhaRWU5N1ZnZlhoZTBJWFV2YVl3RVhacENPcm5HUlAw?=
 =?utf-8?B?c0QreTloWjM3Z204Mng3R0pJVHluTCtScytUR0dxYkkwZE83aW1VcGV1Nm1N?=
 =?utf-8?B?OFpIdDQ2UFBmR3dCbnRYd0VrM2VOOUZIMGVuc0Y5K0VlSjEwZUNRQlhUa1BM?=
 =?utf-8?B?c3FYMURsUGkxMXZ5OUlSU2s4MHFtVU93VHhtcEZZbXZEWGRkSkVzVTEvRDFv?=
 =?utf-8?B?ZnhVem1MSzhiSzJ1NUovc0FacUFmWGdSN1VORndRb0V0STFIcG5kaGE0RUtV?=
 =?utf-8?B?cmNXYXVhSjhnVGJJSlJEcjM4UHYxMlo3dUhCVkVIdS9nbXh6Nm9PMVFtU0s3?=
 =?utf-8?B?aE1vb1VCY3k5MUlWRlFxbmtIdDFPaStvTzFSZnhiTnBLR052VWZMWklTNnY3?=
 =?utf-8?B?TGNzQXRFT0o1SE1zK1dIaEVPUnZPeFFrV0RzdGxhL0tWamlkT0ErYWp6dENZ?=
 =?utf-8?B?S2FPaWRzb3c2SHQ5UjltOW9Wc21NTmlHRVpsTkR1ZTR0cFpLdk1lYXN0Q21y?=
 =?utf-8?B?d05PcTdPd1I1S21QNU5ObWp4UVR3R3M1ODhsUmdTTUNvdnNFaG1tY2EyU3dJ?=
 =?utf-8?B?NS9Lem1qaGg1emsvb1kxVDdCNmgvd01TYVVRbDhZbXpYN2h5K3Uzem00SUp6?=
 =?utf-8?B?Y3p1WDJ6ejUxck5GWU1Fc2hhZnRHdEdJR0FrdEZmeG82dksxaFhXQytsV3Uy?=
 =?utf-8?B?WmREVWUwYVd4TGZQMjlrNlRiME5JWThKMms3ZVJmalNxbEJiWkNpd1piRXBw?=
 =?utf-8?B?ODZrTUNVZFpxYnRVQUNHeDZjazNsck1vSG5HK052SUNIZHMrSGxacWtUdFNJ?=
 =?utf-8?B?TWFaU3p1OGVDdm9yZnBQZ3gwL2NFSVBlY1BSaS9UWmRGNjRaaWYzancvd1hK?=
 =?utf-8?B?YUJJdlA1UXN2ZFliMjc1N01GUnNmR2dISk0yUVViNFJZWUh5OStwM1NoaFhP?=
 =?utf-8?B?blhZUW41ZzIzSU9Nenp4WkVFaDlwVU0zTk1uUkFjcU8zc1p0WkQ5TTZFVG9R?=
 =?utf-8?B?d05kSUtaaklpM25JV29UY3picWpncllLQzU1OFBLZkNZMWxtNEVITXdZRnV0?=
 =?utf-8?B?Uk11WUszNU54YlI2RzI5c3BRU2JTd0FoVWlnb0VtbWl4Z29QMjNvRjNEUjRU?=
 =?utf-8?B?SWZSRjVvejVxenVQcEhISDNTcXFaOFQyaVRQc0RkOWVaVG4zbThtMjU2RGY1?=
 =?utf-8?B?elJIcnVPZ0dtdlZCN3lJbk5WUkdIQTI2YmtpMjJ3eTVNVW9Za04wNzlzbGtW?=
 =?utf-8?B?cWpLY1owSTN3S3ZKQ1RVK2JKcUNDalRKYW9jU0NmVFBLQTY5TTdLbmgwa2Zv?=
 =?utf-8?B?RlZmbGtBOEVucFRmL1JmZFRwMXhaaC8yRXJBTmRWU1p5bGd3T1VjdHpFZmM0?=
 =?utf-8?B?MGJwc2h4ejNoNWxuRDhjMklNYUpnVzU2OTkxcyt5NUh5Wk43bkdCRE8wc3Yz?=
 =?utf-8?Q?MDKkvV?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8205.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?S09mekloUWw1NGRHU0QyQjBGYWErNitTNG1nc1RZbldPYXNnb3B4NFdrT2dO?=
 =?utf-8?B?UmN4L0ZDcGIzYkZldHdqQlp5c3FPUkMxVDJudFNpVXdqZTU0SmtOeE4yYXFu?=
 =?utf-8?B?bGVKTXo1ZHVJdW9QNkJyZXhpdDByZnZqYnVPd2NDWXVLMTBqS2EzcFdXbU1T?=
 =?utf-8?B?cEVpckpyekUvS1NMbk90TE9CT2JjVW1xYUx1NjNXdVUvemhyRTJ2Nm1pM3E0?=
 =?utf-8?B?cmxJZThPdFZVd0FDOWNtcnRHTTE0UWpJS05CSFJlZ011K3IzRUFhTHNTdXA1?=
 =?utf-8?B?ZXdNZGNPZUIrUElUbDhxM3A1WUgzeDlZY0JtQ2NuMDBTeDJBWDh2NE56TGNB?=
 =?utf-8?B?N2ZEMjNXb3dMQjNhckhFcVMxNm02Y3c4VmVTWk8xdVdGKzdLR055RDhROUFu?=
 =?utf-8?B?bmZWUStkWmErT0RrL0djSU9NMzJmdTRtODhoTlVaUGh4YjVGc1IwaVo0Tngy?=
 =?utf-8?B?QjNvRG50WnBWV25tK3NBMTRsNTdnWm94TjVmNTM5TVY0cnlwSTJQZmxzaEJT?=
 =?utf-8?B?TDR5Q0lPS1k2a3o3dHBZS0lJNzNWK2J1ZE43bUhiMWVNdlIwakZ5NVN4cEda?=
 =?utf-8?B?R01wbnY5OVRvSnVKUVFCb1Nacmc2cHRqRVNzTER4aC9zMEI4OFpyTDNLSW83?=
 =?utf-8?B?TWMyYTFMOGs4VGpBaFBjNzBJTjJxRGdrUzk0UnkxQVhMK3Vab3ZKV0xNcEZh?=
 =?utf-8?B?TC9sT0s4TnpoSUp6YUFzRWo3emhna29ZbnY2Um5QbEFRM3Zyd3MwWjFjbjVn?=
 =?utf-8?B?alRIUmNvNW5RTU1DYWRsWFREQUNXVXQxV0FpMjFzT3N3NGFrak5taEhPWlB6?=
 =?utf-8?B?S0JMbDRITURjcmlxMW1XVUd1a3hCTUFrb090YU1uUUJMWDBVdjI4emZlVWIx?=
 =?utf-8?B?blk4LzZCa25JVklsYzhzVlFsc3NEWEgwZEtBelVaRHY4RS9RNU9GdTZyWXlB?=
 =?utf-8?B?RndiT21YaFlKN0VaU2pJa0w4TGZweGpubEdXY2J0RWxsczFDbnpRWHdqT0ho?=
 =?utf-8?B?OXo0MXRGT1BQVjNvWHZRbHRGTmFkQ3NQcDlVc1pDRUtjOU16bVBrYTJrclBV?=
 =?utf-8?B?RjR4Mkw5aWROaENQa09NNWwvSEk0RFRwRnV0dDhIMEwvR3orNmxFZU5EdHNr?=
 =?utf-8?B?WjE2Zk1jZGdLdU5ncXFZMEJOWjgxMFdOajFlNEY3cFJtdlJtTzduR1BjY0ow?=
 =?utf-8?B?OU5xWUY1TVo2ZUlidGE4Qy9qNTJHTGx6OTJGOERsbkxPc3VzVm9MWlRLR3ZX?=
 =?utf-8?B?TjBZWUVMdm5oellRZElwMjBLSXFBUDJOK2JZaEFDY0dMVXd6dkVCd0tlcmg1?=
 =?utf-8?B?YnBYNThZcllaSGJnc3dEcWR3Rk1ZYXZPWUVaVE12UUQ3eU5xRTNCbVdGWnJO?=
 =?utf-8?B?M001M0VCaDdieGdBZFNMc2FtY2xDT3FQVEVtY1lyWEpHOXJ5alBFcG00OVpr?=
 =?utf-8?B?U3YzRUZTTmVGcXJrb1hScnYzS2F4ZDg2S1BYSGZzbHFKZjAzQXgveUhaVDFD?=
 =?utf-8?B?YWlzNXAyNXBTcVVhL2NRbEhLcDg4dDNqaE9QZ2NrMlNZZnZRLytBWmhsb0l1?=
 =?utf-8?B?MWM4ak9OeHd0N01VRURzWjZVYVEzSHdyWFBMRWd1a0Q3MDd6bGxDTElQNHh6?=
 =?utf-8?B?SkFuQ25YeW5pT1duSTgrWHpFQXBlMU02MTFkZThpNWJIYUJwQjV1TEJBZWpl?=
 =?utf-8?B?Ty9oQ3V4VDV6Nml0WlhFRXA4bTcvYjZIZmhlaStUZmgyNGtmOWgxOE9ZeFAx?=
 =?utf-8?B?WUdaQ0RSdFpIUWlGcnlCUkpCVHpkZmdoTlZXYS82TmVwUlZMRlYvSTQ0SU0r?=
 =?utf-8?B?cTd2K1h6SFNydVFMdTNWZE1Tc0pSSDZCM2hvZkUxWW9oSXVnZnJEL0dZREZj?=
 =?utf-8?B?R2crZEMyZ0JiRnRXUDQvdDBROGhIS2dqcUtPd1Fod1RSU1pnaFhEOUJodG56?=
 =?utf-8?B?dUtKRUhoL3NlVnVSYlFscDNUdWVUcnpzMHFLS2ZVaUVicjJCUXFOSUV6ZHdX?=
 =?utf-8?B?WUpmbE8rQVdkb3RoTXN6TVc1endoY096eWpBaUY1YXZvTzB1dis0dWlOOXYz?=
 =?utf-8?B?QkhvV1dCTE9JZXVUY3dGczRBWmo0ZWJiejJvOG1CcGpUU1lHd045cTFkNzRi?=
 =?utf-8?Q?MKj7Iae81SyHXLCmwBV1adI+j?=
X-OriginatorOrg: silabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7395a03b-273b-44e9-d125-08de238fa8e3
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8205.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 15:08:26.1105
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 54dbd822-5231-4b20-944d-6f4abcd541fb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /aR+N9NHvnvEz887idVuQKgGd8g8u8W6NQvJqfBg9H0YqZRokjAmsDmZb+fgVtPrHa+3P59XlPzZDq5cBn30Hg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8774
X-Proofpoint-ORIG-GUID: mEkb6J7b_evTCx-VwZCRXU5BcPVP0Eme
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDEyMSBTYWx0ZWRfX/x6xX584U/0l
 F5C/LB5jRz6SbPSIq5THktzbCoFAvzwHkKJbQHiV6xoGBU3rj6Z5SauWYerAJlSYoRvnZIGR1P3
 9pAfIfzrxD9LhSIHuTO19UNi5dwkCFO6mT94g+igW3ZIPZJ3ncwWgYUUlFNPnNAUzrfLxN1H7/s
 SSj4KZAagL/MOiEFE7b8NISjLGkdcG69oE19D6cUHfEJVTfBnP5rVfh+U52nDtitOAZaapZ1o1q
 KhPzTVge8V4kkwnJbqzOoJl8KbOyzMYJkIB/IA7hSQKM30Q6CvYOuDgdk+JWMbZsXlJCPf2Y1W4
 cKN+n7cUk5gDoNQRmk/KfeOg25oWCXwsDH/crTzARVErayBDgEjavSbp5uMiQxOj3EQ4XqezJ4T
 WFkj1TSrFBXar3cBpYWJODQ4LXssRQ==
X-Proofpoint-GUID: mEkb6J7b_evTCx-VwZCRXU5BcPVP0Eme
X-Authority-Analysis: v=2.4 cv=LfAxKzfi c=1 sm=1 tr=0 ts=691745f2 cx=c_pps
 a=XJoAL0HPiv6B0cYJlRTKVw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=M51BFTxLslgA:10
 a=i1IsUcr2s-wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=2AEO0YjSAAAA:8
 a=d28r9nv9ZyHOM8R9p0gA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 spamscore=0 clxscore=1011 phishscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140121
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 20BEE3F855
X-Spamd-Bar: ---
X-Spamd-Result: default: False [-4.00 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[silabs.com,reject];
	R_DKIM_ALLOW(-0.20)[silabs.com:s=pps12202023,silabs.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:148.163.149.154];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:26211, ipnet:148.163.148.0/22, country:US];
	MIME_TRACE(0.00)[0:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DNSWL_BLOCKED(0.00)[2603:10b6:8:162::17:received,40.107.209.81:received,148.163.149.154:from];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	DKIM_TRACE(0.00)[silabs.com:+]
X-Rspamd-Action: no action
Message-ID-Hash: 2NHCUF5PUHGS7GOTDDEY77AJUTIUE2G3
X-Message-ID-Hash: 2NHCUF5PUHGS7GOTDDEY77AJUTIUE2G3
X-MailFrom: Damien.Riegel@silabs.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Silicon Labs Kernel Team <linux-devel@silabs.com>, =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [RFC PATCH v2 07/12] greybus: cpc: account for CPC header size in RX and TX path
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/2NHCUF5PUHGS7GOTDDEY77AJUTIUE2G3/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

QWNjb3VudCB0aGF0IGEgQ1BDIGhlYWRlciBpcyBwcmVwZW5kZWQgdG8gZXZlcnkgZnJhbWUgaW4g
dGhlIFJYIGFuZCBUWA0KcGF0aC4gRm9yIG5vdywgbm90aGluZyBpcyBkb25lIHdpdGggdGhhdCBo
ZWFkcm9vbSBidXQgYXQgbGVhc3QgYnl0ZXMgYXJlDQpyZXNlcnZlZCBmb3IgaXQuDQoNClNpZ25l
ZC1vZmYtYnk6IERhbWllbiBSacOpZ2VsIDxkYW1pZW4ucmllZ2VsQHNpbGFicy5jb20+DQotLS0N
CiBkcml2ZXJzL2dyZXlidXMvY3BjL2hvc3QuYyB8IDkgKysrKysrKy0tDQogMSBmaWxlIGNoYW5n
ZWQsIDcgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCg0KZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3JleWJ1cy9jcGMvaG9zdC5jIGIvZHJpdmVycy9ncmV5YnVzL2NwYy9ob3N0LmMNCmluZGV4
IGQ3OTc4NDU0OTdhLi4xY2NlNGY5ODdlMyAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3JleWJ1cy9j
cGMvaG9zdC5jDQorKysgYi9kcml2ZXJzL2dyZXlidXMvY3BjL2hvc3QuYw0KQEAgLTksNiArOSw3
IEBADQogI2luY2x1ZGUgPGxpbnV4L3NrYnVmZi5oPg0KIA0KICNpbmNsdWRlICJjcGMuaCINCisj
aW5jbHVkZSAiaGVhZGVyLmgiDQogI2luY2x1ZGUgImhvc3QuaCINCiANCiANCkBAIC00OSwxMSAr
NTAsMTMgQEAgc3RhdGljIGludCBjcGNfaGRfbWVzc2FnZV9zZW5kKHN0cnVjdCBjcGNfaG9zdF9k
ZXZpY2UgKmNwY19oZCwgdTE2IGNwb3J0X2lkLA0KIAkJcmV0dXJuIC1FSU5WQUw7DQogCX0NCiAN
Ci0Jc2l6ZSA9IHNpemVvZigqbWVzc2FnZS0+aGVhZGVyKSArIG1lc3NhZ2UtPnBheWxvYWRfc2l6
ZTsNCisJc2l6ZSA9IHNpemVvZigqbWVzc2FnZS0+aGVhZGVyKSArIG1lc3NhZ2UtPnBheWxvYWRf
c2l6ZSArIENQQ19IRUFERVJfU0laRTsNCiAJc2tiID0gYWxsb2Nfc2tiKHNpemUsIGdmcF9tYXNr
KTsNCiAJaWYgKCFza2IpDQogCQlyZXR1cm4gLUVOT01FTTsNCiANCisJc2tiX3Jlc2VydmUoc2ti
LCBDUENfSEVBREVSX1NJWkUpOw0KKw0KIAkvKiBIZWFkZXIgYW5kIHBheWxvYWQgYXJlIGFscmVh
ZHkgY29udGlndW91cyBpbiBHcmV5YnVzIG1lc3NhZ2UgKi8NCiAJc2tiX3B1dF9kYXRhKHNrYiwg
bWVzc2FnZS0+YnVmZmVyLCBzaXplb2YoKm1lc3NhZ2UtPmhlYWRlcikgKyBtZXNzYWdlLT5wYXls
b2FkX3NpemUpOw0KIA0KQEAgLTIxMCw5ICsyMTMsMTEgQEAgdm9pZCBjcGNfaGRfcmN2ZChzdHJ1
Y3QgY3BjX2hvc3RfZGV2aWNlICpjcGNfaGQsIHN0cnVjdCBza19idWZmICpza2IpDQogCXUxNiBj
cG9ydF9pZDsNCiANCiAJLyogUHJldmVudCBhbiBvdXQtb2YtYm91bmQgYWNjZXNzIGlmIGNhbGxl
ZCB3aXRoIG5vbi1zZW5zaWNhbCBwYXJhbWV0ZXJzLiAqLw0KLQlpZiAoc2tiLT5sZW4gPCBzaXpl
b2YoKmdiX2hkcikpDQorCWlmIChza2ItPmxlbiA8IChzaXplb2YoKmdiX2hkcikgKyBDUENfSEVB
REVSX1NJWkUpKQ0KIAkJZ290byBmcmVlX3NrYjsNCiANCisJc2tiX3B1bGwoc2tiLCBDUENfSEVB
REVSX1NJWkUpOw0KKw0KIAkvKiBSZXRyaWV2ZSBjcG9ydCBJRCB0aGF0IHdhcyBwYWNrZWQgaW4g
R3JleWJ1cyBoZWFkZXIgKi8NCiAJZ2JfaGRyID0gKHN0cnVjdCBnYl9vcGVyYXRpb25fbXNnX2hk
ciAqKXNrYi0+ZGF0YTsNCiAJY3BvcnRfaWQgPSBjcGNfY3BvcnRfdW5wYWNrKGdiX2hkcik7DQot
LSANCjIuNDkuMA0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpncmV5YnVzLWRldiBtYWlsaW5nIGxpc3QgLS0gZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJv
Lm9yZwpUbyB1bnN1YnNjcmliZSBzZW5kIGFuIGVtYWlsIHRvIGdyZXlidXMtZGV2LWxlYXZlQGxp
c3RzLmxpbmFyby5vcmcK
