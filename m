Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE94C98568
	for <lists+greybus-dev@lfdr.de>; Mon, 01 Dec 2025 17:43:59 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 4CE173F8EC
	for <lists+greybus-dev@lfdr.de>; Mon,  1 Dec 2025 16:43:58 +0000 (UTC)
Received: from mx0a-0024c301.pphosted.com (mx0a-0024c301.pphosted.com [148.163.149.154])
	by lists.linaro.org (Postfix) with ESMTPS id 644C53F72F
	for <greybus-dev@lists.linaro.org>; Mon,  1 Dec 2025 15:40:10 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=silabs.com header.s=pps12202023 header.b=wlgCTd+W;
	dkim=pass header.d=silabs.com header.s=selector1 header.b=eQuaotGv;
	spf=pass (lists.linaro.org: domain of Damien.Riegel@silabs.com designates 148.163.149.154 as permitted sender) smtp.mailfrom=Damien.Riegel@silabs.com;
	dmarc=pass (policy=reject) header.from=silabs.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from pps.filterd (m0101743.ppops.net [127.0.0.1])
	by mx0a-0024c301.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B1F4qBk2319288;
	Mon, 1 Dec 2025 09:40:00 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps12202023;
	 bh=j0+7pkUjLB6bIhvekcXJQT+gQzKAU30I+lJmnSFZv9I=; b=wlgCTd+WaEdo
	+uYpPFpQJmTgNlZeNkj7+nMxYaLsXFNndsxcDO71BVLKgfJCloWO249+x5MEsVcv
	Hbc6rnasEbQql4gBSb4xCk8Ql+tMbGTRmPPabXa82TSsBfsy9EktlZv+XcgoJAOf
	K4DNgyROjwtjFm0faTT8oRGbI/gJoSVniXm3yXLJ3bE+47DdjwRSKazE6km4nSyh
	g3322v7dmnCDp9MLJFY5n6m6rG8bpprgU2Jc9486McCDedxkDKTqbFwp5MJU84Zx
	wNGx2WXR+I7NSWkncsNav2i+aQvIgwhc4EBWQSt8yoG+h3NYQc5RYDqb5D4idtjB
	TX1EJWgGlw==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11021110.outbound.protection.outlook.com [40.93.194.110])
	by mx0a-0024c301.pphosted.com (PPS) with ESMTPS id 4aqx1ctr5j-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 01 Dec 2025 09:40:00 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l48SAQLJYG+MZXf8cwr3fg6Uc+chlRSqZs55ONw5cYsAYGgbFIH65QwvFaYjQsj/gD8D/FajDztk3HpbLW2QntTsYdzDUZwoxk6kjkfswaMzquhmpGWjV9qco8ei4VJQ/aakcc0by2n6LCmhKq6kfxdSooiZfv3NpGo62AkxCf/chhwzusn38tmevFMz7w7m+S6ubTRa1gzZhLa6PegFwrVxc4GxD06ED0m4eE3sfDwTb4gdMJvrWlN113H4avP/Y5+YoAZUbf+leKoRKujyi9iNy1/S+1hbzIlKBG2QnO0wnKtRL6hrmAHd1b2aydhhD7c9xHye+2wx2RjKS+aegA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j0+7pkUjLB6bIhvekcXJQT+gQzKAU30I+lJmnSFZv9I=;
 b=X4/yemM73CDbDsPdxnMZfcE1/wDaKU4aKlxkg6wk/RpKeL9oSjrRVdR3BiGf/lHBMauaD37jqB8JfqwH/pHyrejZnx1/QkUVXyWRk84DjL8NqqEDh6zyMqThZyNrLSTsJ/spHhj2Mr3BArgc4rXhzYU4oramU59wC8yUsESPvXwDtxKCQrYeCussyW8pBhwxTuACd1GziBTibtgg5O++4jkyf3P9MvJGMzwHrbqMZ6vAnBwDhXeAXQvfJuDkPNsYeZPZVJ4BTinrD/UCSRKIvs8HlLwd23nY9P2ToWLvlyfDMcRrkSfMRqkaOkcK3o+o67zGlS5Eywz5lGq0ciZRVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silabs.com; dmarc=pass action=none header.from=silabs.com;
 dkim=pass header.d=silabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j0+7pkUjLB6bIhvekcXJQT+gQzKAU30I+lJmnSFZv9I=;
 b=eQuaotGveoRZnRLQ5S486QjnEhOFZBJohnIJgB25yKoDYJGeFkwf65SvkJYpS4LN3iszb5vcizk3X+c1D4ZmRg/uDcubttg1mueLgp47XVq6n1XyeIO7wZp6FOrpIiDCfm/tZCYO65L17wqRanVdzyIzhJEYymLEQdWw+Y1Ak10=
Received: from DS0PR11MB8205.namprd11.prod.outlook.com (2603:10b6:8:162::17)
 by SN7PR11MB7566.namprd11.prod.outlook.com (2603:10b6:806:34d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 15:39:53 +0000
Received: from DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::2de6:bc88:2af7:3583]) by DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::2de6:bc88:2af7:3583%3]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 15:39:52 +0000
Date: Mon, 01 Dec 2025 10:39:50 -0500
Message-Id: <DEMZRMIAGULC.3R4S53KVQRCH8@silabs.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
From: =?utf-8?q?Damien_Ri=C3=A9gel?= <damien.riegel@silabs.com>
X-Mailer: aerc 0.20.1
References: <20251114150738.32426-1-damien.riegel@silabs.com>
 <DEHVQ7YAUOG8.2TPWJBM6MTXLT@silabs.com>
 <2025112610-hankering-muscular-d120@gregkh>
In-Reply-To: <2025112610-hankering-muscular-d120@gregkh>
X-ClientProxiedBy: YQBP288CA0025.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:c01:9d::26) To DS0PR11MB8205.namprd11.prod.outlook.com
 (2603:10b6:8:162::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8205:EE_|SN7PR11MB7566:EE_
X-MS-Office365-Filtering-Correlation-Id: 25ce5afc-18f5-4be0-7447-08de30efde79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?OGdFVFR6SkRnc2NzVit3WXQwVjBwVkFUY3RRWGlqM2dXZmVNSU5VWWxGMWlw?=
 =?utf-8?B?QnJybk8yd1BqakwrTmJORkcrUkd1NjF2VlRadmtTejhmdVZ2NGFlbGtNZnZI?=
 =?utf-8?B?M1ZaMVpITUk2bkVJNHpENjRjNzBqWFVWTmFnUGVNUnViU1NnWEJpYjh6STB4?=
 =?utf-8?B?Q0tHYXczekQ5TkxJT0FoOTM1c0FiYm93QVZ2TjhXMXJzQ0w5TmZmWXNtd2dX?=
 =?utf-8?B?SGVITEpSL3pIRW1rMThsc25IcHlhb1JnN2JCVlRlZytXOStiVko2TElHb3pt?=
 =?utf-8?B?VVFpMm84RXc1UTVUbWRlVW9BcXlBTE9QdjRpaFV5dGhPWGl0Mjd4WVBXVTlK?=
 =?utf-8?B?allxQVpLNFM3V3ZuRDV0bzBhUHlQVkNFNTRFSlVkTHNLWnI3eFJlZVJMYkcx?=
 =?utf-8?B?L2luMmNqKzJ0c0dyM0JZOVhvLzd3Q093VmxWdlN5NGJ6a1VtNU9sS1lJMy8r?=
 =?utf-8?B?M0I5NEcxRFdWWlZ0SHJxRTVsazJxOHBwNm5YcDJ4T2VSeHduNXNjR2tlUmxk?=
 =?utf-8?B?M1VJQUZWNVh6Q1d3VmZGTlhCeVE3WFMxZTRYT2FGcnNlekxKS0IrNDNBZ0JS?=
 =?utf-8?B?eWFiQUt3NDhqMG9kcWFjdmorbTFFVEtLWmpNRGN2M0tqTm5GbTVDeWkvRGxB?=
 =?utf-8?B?MkZ1dldVVzBXR1E0cm1Ccmh1a3pORDVqTE0rWjB1L2hPRnhlKy9kc0hENFlG?=
 =?utf-8?B?MHVqVTFUVUhOb29ZdHhXYTg3MDVwa2xwNkg4dnNYdHdhaWxETmJ6bWthRzlm?=
 =?utf-8?B?NTdGK1NXMU91c055VzBTSjVlRlZNbGdtc1YxSmhzMFBFREl1WTVNcHJITkFP?=
 =?utf-8?B?VTJUbUVrS3JySTZiZHUrbXk4R042NEgwRWNvYjU3TzFKekVSdmxYY0lFSWxv?=
 =?utf-8?B?TXFZZ3ppaGp5THFqMzJ6WW9STHVzU3hRMmRsWGpJV3c1VGcrY0o4TzhhMnpx?=
 =?utf-8?B?VElPbm12dTVLNU5MNkloME9PVmZleGZ5M3NzVjRoZXNaNVluNnh0YXJpSTFi?=
 =?utf-8?B?TTZvK0I2SzBTUjlPUlBiTkpvcU4xN3B5K2Z6dkF2eHQvSjNSUFNBY2czWnJQ?=
 =?utf-8?B?OTdqbEZmSWdOaktyNHJjTnZiOEx3SmtES3Bla0o1b2VNMHFxZ1JoWTRiNUxS?=
 =?utf-8?B?ZkdXOHROOFJoc1UzVFo5QlN2c0l5a0pZcFpOTklSQzBlczNhazY4Q042VDFQ?=
 =?utf-8?B?VEN4Y2Y1U3ExRUhMWkFIK2hoNkZiVnZvamxBMzEySkZ3QzV3aWxHRm96ODE2?=
 =?utf-8?B?NmU5RnAwZThuWFhWOWNuK1dsbWRHRU14M1NYcjVhTUdyNXNIckZCMWRmWVZi?=
 =?utf-8?B?L21TdWJMSnB5NWVocDNnL0tGTTRGeCtXNURIRVdQWWdNM2Vlc3M5b2tQVnBH?=
 =?utf-8?B?K1BSeFlxYXNhQTJVM0ZBMGRjdjFKbm1vMFhxcWtXU3ZmaDBTN0VpMUlhYXlR?=
 =?utf-8?B?bXBTWTNyanpGb0hKQWtvUUEwVG1mR3NUTXhoMG1tenZINEJFQ3NDSUFhbVpl?=
 =?utf-8?B?V21ZaUxrR3o5Mk55N2ZaUU1wOWRpZU14am83dGNnelFDclo1R0NqNFRycXM5?=
 =?utf-8?B?ejBRejQraVVkT0RtN05NNzB5NHJyNnJUVlJ4NGNqZXNUQm4wVVptQUVKbDNY?=
 =?utf-8?B?eUJDMFRPMXF4WnFBQWJFWHpQaXZPT2wvdXhYNXVML2VHcW9OZHNhQklHQllv?=
 =?utf-8?B?WGN5S3FYQVZhY2xXc08vQTQ4MHBZaXRGdUdTK1FtMU1IeHk4a0JqZHBwYWU3?=
 =?utf-8?B?WER2ZUMvTmlPZ3NzYklBZld6VTgzWHpvRzF3UjhrVklPdThEWm9CZ2RXUFZ1?=
 =?utf-8?B?cUVJdGR1ZWdoMXJkYXZUV3VHMTFIa2tIODZESnF2Sy9YOHhmNTAzUk1VTFRK?=
 =?utf-8?B?S2lWT3htUVRETCthM3FoazhUMEVlcUl0U1JQaEQ3c0d3Y0hHeUVoakppU3do?=
 =?utf-8?Q?023qa3ap5tUkuB5CA4FdMXY/vZeeCgXU?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8205.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WlBRdG55S2Z2OUFYRU5kb2R6S2dmclA0Q0ZKb2hVZVNIdDQ1Nkh4bW8wbDBz?=
 =?utf-8?B?OTIvUXhKREtzeW5uVGF1cUo2N2Z0M2dERXNieDZPVlpGdDVVNjFrL1lLS1pV?=
 =?utf-8?B?U1VOaFA3bmpvd2VoVG5kZElMSGhsZlBkRDcxZzRCY0Z1SFNUV3U5NGVYdXpF?=
 =?utf-8?B?dWF0U2pvNjhhcDlyZU1nVlFrbGxGdVBZQWNQWEoxUXVXSjF6R3dOT3FGZ2hw?=
 =?utf-8?B?U01lVVJTZm15Y0F2eHMzbzJKSStxVHM2WG4zWWx3czNqRjFoMjYrV3RVam5v?=
 =?utf-8?B?cWRMbDN1YjVFU3ZoVTk5VXRONFBWa1J6VU1hQXl4S3Q2YXJ3VlljY3Rva2VQ?=
 =?utf-8?B?YnRHclVucnBoemlSeFB4Vk5NY0RnLzZtWDJMZWJCQ3RaMFBESE1MRUJZWk5X?=
 =?utf-8?B?M05wZk43b3N0TlUwOXlUbnd5elhpcUFkN2RpMHI1dU40VzRiWUNQaHo3dmFH?=
 =?utf-8?B?Uit4ZDk3SXlPYXdSWGh6NTNoVHNFT2NXSktsWkpjK0QxSllvcDJDZW1sNHB0?=
 =?utf-8?B?dk5UV2dKdlUxZG85MGh0MmsvQVNCREV6UmFYK09vSHNEWmY4NDR0WS95Nm9L?=
 =?utf-8?B?S21Pb2o2bHBJSmhKK0poQ2N1a0NUSk1DelhRcFF3bXEvTlJXa1hMaFVjdTha?=
 =?utf-8?B?b28rNlJhNHZiKzJ3dDhWZkdpQ05McE5BOExmRkZDT1lxTzIra3p0VDlFN3lD?=
 =?utf-8?B?ZnVpenA4SEYxaitiSWdGWFlqQVJQWlFFSzBKSk9qN3RNRVA1a0Y1UjNjRFMv?=
 =?utf-8?B?NUlZVkFaWVJxcmtSUTJSMW1GYjdTZzVYOWJRQm5lUWxSQi8yamloVHhJaEF3?=
 =?utf-8?B?dGVERmg4bTNZN2gwdG1sNEwxUmxwUzF4TDN2RlBzU0VlUUMwaGtMRVZNYmlN?=
 =?utf-8?B?S2JuSjdYVk40S09MU0RFTXo3N0dGL2pDSmpCaXhBMmlYekM1U0U2eE4zU3Vw?=
 =?utf-8?B?cnVtV3g3Tm5vVmIrS1BtRGYxaTZEd1FhZGNmVXFNNWQxSFFkbXlOTU4raWJ4?=
 =?utf-8?B?M2NtSTlYclhBMzRsTjdSM3RBL0gxQitMYW9INGZQcVk1WE80TjB2WTI2RVJR?=
 =?utf-8?B?NHhsdHdmRGJibnpqVFRMZC83aWczbmVwU3EyMW9aMkgxVUlCd0ExSXNGL0c4?=
 =?utf-8?B?T3dmUmNSell1VE1WSnFPVS9JN2YyZDRJcStzaXcwa2pudFh3OVdPOXdiTThz?=
 =?utf-8?B?cEczN29ZWW1XVDJZVll4UW5UV280dm5xL0phUVc5K0FXTUU0dElyM0x2N29s?=
 =?utf-8?B?RFhQNnpmeGVCZ2JlTkpCTzZVbkZHNjhzVWxUYVJKVDVSazRKaFpwSnkweU5u?=
 =?utf-8?B?czBBSFZjY0ZxZWRXM25KeVVCVmJ5STZQQzB3N0EyQzRTT1l5dlVQVzJDdzY3?=
 =?utf-8?B?V29iUm1aa2Uwazh6YXRtSThSbllxdmFDVU9paitsUnhVOG1Cd01XMVZ0Y296?=
 =?utf-8?B?UFBHbDl2ODFPeDdReTdhSjh4eVcvemNhNVhzOG14aWhEdjEwa0VQcG9PYXkz?=
 =?utf-8?B?NmRyaU5DK3U1Z3RKOFFBaEdqRWx6NG9FT0R1Zm0zNEs0SzRGOWNUSVorY1Rk?=
 =?utf-8?B?Qjk4V2YrZTRHa1JFKzA0Q0dmblBTNWpMWjdEbXB0MVVaK0NJdFJVL3Q3aXd1?=
 =?utf-8?B?b2M2ekowcjFjcnhrZWx3WXI1aVAxNmhBY010SmMvRVhxb0hLUGwrL0FTcXZD?=
 =?utf-8?B?MnlVaERkODhDTUJ6UWMwanNPRXFvS24xVDF3emxIQVlRUnpGaWpVaVByM21m?=
 =?utf-8?B?K1piNW9qOUtGc0NCUWozM2krMmp6bnpweFpFeEtaNnc3U09Ua0RRYWZwbzhH?=
 =?utf-8?B?UFBFNjBaZlFzeEhiODBXNjJMOU1sTWxvSjZvdndTQ3ByVSt0cjI0ZWpMS1p4?=
 =?utf-8?B?R09KYVlocUk0N0ZCa2lUajNISzJ0NlU1RG1QN1RtOHhHUTlJTjlvWEx6K0xM?=
 =?utf-8?B?SWExNXVLa1BDeGZidFRnaHNMQ3F3UElJMFV5RnVXRVdJck5YMDU0eVpPb2Yz?=
 =?utf-8?B?VDV2Nkd0UUFWRjlFZFhXZGZBd1o4NjBRZHZGOWVOVlF2Y3FJZkd2c2xxcnRt?=
 =?utf-8?B?c3IxcHc4REFBL082NTJMVlB5Si9xd2lBandHbU1LRGtkM2Z3enJ3N3VzYlRC?=
 =?utf-8?Q?5uwHnwe9Sa4jZbsNtgFusUY+0?=
X-OriginatorOrg: silabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25ce5afc-18f5-4be0-7447-08de30efde79
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8205.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 15:39:52.3275
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 54dbd822-5231-4b20-944d-6f4abcd541fb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nh+k6QNXHAURwUnHWd0vxl+AhfoMTQfGfFpYMlp3qHyFIzEoNZ8GurhsSmqbdtENWWLdos6cckCGNIVt5FHhQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7566
X-Proofpoint-ORIG-GUID: YfrwxFK-JS6svl7VzxA0UMBU-7fezdq9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAxMDEyNyBTYWx0ZWRfXxCG2RxChLsGX
 1trV3Qcai5c719zlozk72SRFQ7LyaIP0xiq/pVcpogxwCMQExUZYwIIG0q3oR7oRGI+isiZrobk
 XnY3qADiszYnxzyrp//eEWG1jIIsd9bk98bwpaFWx4/aqI/t4oCTAPyDpwowF5ovMiu6bCoOMRI
 iEuTZjZG0cIPjvXpnBRmZdVLwBtHF1ercz5vf6UZhYdPn0mujBYQFie9g1dvkhtMKrL+3NDqi5Y
 KPpdXPqRUVi7hRQIalOmuHTF/b+k8cQvUh2lGeD0k5kqmHoWuBnCXnu9odz3O0fZ9ZVSFFa/hqo
 Ll1/sXx5T0xTCQakY1Nj2XnlgCCit8o4Mte/fIbCVPxFq4uZqiVJ2VwK07FYJWj7iDzMqSEV4vm
 w/uscEPL+oNUC+CmOfEQnmKaiMpdOA==
X-Proofpoint-GUID: YfrwxFK-JS6svl7VzxA0UMBU-7fezdq9
X-Authority-Analysis: v=2.4 cv=e/ULiKp/ c=1 sm=1 tr=0 ts=692db6d0 cx=c_pps
 a=is1TPszdXRKtgCc8Qn4wPQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=M51BFTxLslgA:10
 a=i1IsUcr2s-wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=pESc8VKmGB1pkhOYktAA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512010127
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.00 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[silabs.com,reject];
	R_DKIM_ALLOW(-0.20)[silabs.com:s=pps12202023,silabs.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:148.163.149.154];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_POSSIBLE(0.00)[148.163.149.154:from];
	MIME_TRACE(0.00)[0:+];
	BLOCKLISTDE_FAIL(0.00)[2603:10b6:8:162::17:server fail,40.93.194.110:server fail];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	DKIM_TRACE(0.00)[silabs.com:+]
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 644C53F72F
X-Spamd-Bar: ----
X-MailFrom: Damien.Riegel@silabs.com
X-Mailman-Rule-Hits: implicit-dest
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
Message-ID-Hash: Z4GOY2JFPQ2PO3QB7WYOYIAANDJRPRTG
X-Message-ID-Hash: Z4GOY2JFPQ2PO3QB7WYOYIAANDJRPRTG
X-Mailman-Approved-At: Mon, 01 Dec 2025 16:43:52 +0000
CC: greybus-dev@lists.linaro.org, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, linux-kernel@vger.kernel.org, Silicon Labs Kernel Team <linux-devel@silabs.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [RFC PATCH v2 00/12] greybus: introduce CPC as transport layer
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/Z4GOY2JFPQ2PO3QB7WYOYIAANDJRPRTG/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gV2VkIE5vdiAyNiwgMjAyNSBhdCA3OjMzIEFNIEVTVCwgR3JlZyBLcm9haC1IYXJ0bWFuIHdy
b3RlOg0KPiBPbiBUdWUsIE5vdiAyNSwgMjAyNSBhdCAxMDoyNjozNkFNIC0wNTAwLCBEYW1pZW4g
UmnDqWdlbCB3cm90ZToNCj4+IEhpIEdyZWcsIEpvaGFuLCBhbmQgQWxleCwNCj4+DQo+PiBPbiBG
cmkgTm92IDE0LCAyMDI1IGF0IDEwOjA3IEFNIEVTVCwgRGFtaWVuIFJpw6lnZWwgd3JvdGU6DQo+
PiA+IEhpLA0KPj4gPg0KPj4gPiBUaGlzIHBhdGNoc2V0IGJyaW5ncyBzdXBwb3J0IGZvciBTaWxp
Y29uIExhYnMnIENQQyAoQ28tUHJvY2Vzc29yDQo+PiA+IENvbW11bmljYXRpb24pIHByb3RvY29s
IGFzIHRyYW5zcG9ydCBsYXllciBmb3IgR3JleWJ1cy4gVGhpcyBpcw0KPj4gPiBpbnRyb2R1Y2Vk
IGFzIGEgbW9kdWxlIHRoYXQgc2l0cyBiZXR3ZWVuIEdyZXlidXMgYW5kIENQQyBIb3N0IERldmlj
ZQ0KPj4gPiBEcml2ZXIgaW1wbGVtZW50YXRpb25zLCBsaWtlIFNESU8gb3IgU1BJLCB3aGljaCBh
cmUgbm90IHBhcnQgb2YgdGhpcw0KPj4gPiBSRkMuIElmIHRoZXJlJ3Mgbm8gcHVzaCBiYWNrIHdp
dGggdGhpcyBSRkMsIHRoZSBmaW5hbCBwYXRjaHNldCByZWFkeSBmb3INCj4+ID4gdXBzdHJlYW0g
d2lsbCBpbmNsdWRlIHRoZSBTRElPIGRyaXZlci4NCj4+DQo+PiBHZW50bGUgcG9rZSBhYm91dCB0
aGlzIFJGQywgSSB3b3VsZCByZWFsbHkgYXBwcmVjaWF0ZSBhbnkga2luZCBvZg0KPj4gZmVlZGJh
Y2sgb24gaXQuDQo+DQo+IEdpdmVuIG15IHdvcmtsb2FkLCBJIGRvbid0IHJlc3BvbmQgdG8gIlJG
QyIgYXMgb2J2aW91c2x5IGl0J3Mgbm90IHJlYWR5DQo+IGZvciB0aGUgc3VibWl0dGVyIHRvIGZl
ZWwgdGhhdCBpdCBzaG91bGQgYmUgYXBwbGllZCB5ZXQgOikNCg0KTm90ZWQsIEknbGwgc2VuZCBh
IG5vbi1SRkMgdmVyc2lvbiBvZiB0aGUgcGF0Y2hzZXQgdmVyeSBzb29uIQ0KDQo+PiBJZiBpdCdz
IHRvbyBiaWcgSSBjYW4gdHJ5IHRvIG1ha2UgaXQgc21hbGxlciB0byBtYWtlIHRoZSByZXZpZXcg
ZWFzaWVyLg0KPj4gQXMgd2UncmUgY29tbWl0dGluZyB0byBHcmV5YnVzIHRvIGVuYWJsZSB0aGUg
Y29leGlzdGVuY2Ugb2YgZGlmZmVyZW50DQo+PiByYWRpbyBzdGFja3MgaW4gb25lIGNoaXAsIHdl
IHdhbnQgdG8gbWFrZSBzdXJlIHdlJ3JlIGhlYWRpbmcgaW4gdGhlDQo+PiByaWdodCBkaXJlY3Rp
b24gYW5kIHRoYXQgb3VyIHdvcmsgaGFzIGEgY2hhbmNlIHRvIGdldCB1cHN0cmVhbWVkLg0KPg0K
PiBBbHdheXMgbWFrZSByZXZpZXcgZWFzaWVyIGZvciB1cywgc28geWVzLCBwbGVhc2UgbWFrZSBp
dCBzbWFsbGVyIQ0KDQpJIG1pZ2h0IGhhdmUgb3ZlcnByb21pc2VkIG9uIHRoaXMgb25lIDooIEkn
dmUgYWxyZWFkeSB0cmllZCB0byBsaW1pdCB0aGUNCnNjb3BlIG9mIHRoZSBwYXRjaHNldCB0byBi
ZSBhcyBzbWFsbCBhcyBwb3NzaWJsZSB3aGlsZSBzdGlsbCBiZWluZw0KbWVhbmluZ2Z1bCBhbmQg
bXkgZ29hbCB3YXMgdG8gYWRkIHRoZSBTRElPIGRyaXZlciB0byBnaXZlIHRoZSBmdWxsDQpwaWN0
dXJlIG9mIHdoYXQgd2UncmUgdHJ5aW5nIHRvIGFjaGlldmUuIEknbGwgc2VlIGlmIEkgY2FuIGN1
dCBpdCBkb3duDQpldmVuIGZ1cnRoZXIuDQoNCg0KU2lkZSBub3RlIGZvciBsaXN0IGFkbWluaXN0
cmF0b3JzOiBJIGNhbiBzZW5kIHBhdGNoc2V0IGp1c3QgZmluZSB3aXRoDQpnaXQtc2VuZC1lbWFp
bCBidXQgcG9zdGluZyB0byB0aGUgbGlzdCB3aXRoIG15IGVtYWlsIGNsaWVudCAoYWVyYykgZ2l2
ZXMNCm1lIGV2ZXJ5IHNpbmdsZSB0aW1lOg0KDQogICAgICAgIFRoZSBtZXNzYWdlIGlzIGJlaW5n
IGhlbGQgYmVjYXVzZToNCg0KICAgICAgICAgICAgTWVzc2FnZSBoYXMgaW1wbGljaXQgZGVzdGlu
YXRpb24NCg0KSSdtIHN1YnNjcmliZWQgdG8gdGhlIGxpc3QgYW5kIG15IGVtYWlscyBzZWVtIHRv
IG1ha2UgaXQgaW4gdGhlIGVuZCAoSQ0KZG9uJ3Qga25vdyBpZiB0aGV5IGFyZSBtYW51YWxseSBy
ZWxlYXNlZCBvciBub3QpLiBJIGxvb2tlZCB1cCB0aGF0IGVycm9yDQptZXNzYWdlIGFuZCBJIGRp
ZG4ndCBmaW5kIGFueXRoaW5nIHVzZWZ1bC4gQW0gSSB0aGUgb25seSBvbmUgaGF2aW5nIHRoYXQN
Cmlzc3VlPyBXb3VsZCBiZSBoYXBweSB0byBmaW5kIGEgc29sdXRpb24uDQoNCg0KVGhhbmsgeW91
LA0KLS0gDQpEYW1pZW4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmdyZXlidXMtZGV2IG1haWxpbmcgbGlzdCAtLSBncmV5YnVzLWRldkBsaXN0cy5saW5h
cm8ub3JnClRvIHVuc3Vic2NyaWJlIHNlbmQgYW4gZW1haWwgdG8gZ3JleWJ1cy1kZXYtbGVhdmVA
bGlzdHMubGluYXJvLm9yZwo=
