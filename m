Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E042CB993D
	for <lists+greybus-dev@lfdr.de>; Fri, 12 Dec 2025 19:34:59 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 17A0E3F9A6
	for <lists+greybus-dev@lfdr.de>; Fri, 12 Dec 2025 18:34:58 +0000 (UTC)
Received: from mx0b-0024c301.pphosted.com (mx0b-0024c301.pphosted.com [148.163.153.153])
	by lists.linaro.org (Postfix) with ESMTPS id 70A3C3F99A
	for <greybus-dev@lists.linaro.org>; Fri, 12 Dec 2025 18:34:51 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=silabs.com header.s=pps12202023 header.b=KKOj46Z7;
	dkim=pass header.d=silabs.com header.s=selector1 header.b=VPCx48s1;
	spf=pass (lists.linaro.org: domain of Yacin.Belmihoub-Martel@silabs.com designates 148.163.153.153 as permitted sender) smtp.mailfrom=Yacin.Belmihoub-Martel@silabs.com;
	dmarc=pass (policy=reject) header.from=silabs.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from pps.filterd (m0101742.ppops.net [127.0.0.1])
	by mx0a-0024c301.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BCHplsf4193677;
	Fri, 12 Dec 2025 12:34:48 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps12202023;
	 bh=oLgMiyRq6nmDJLHijnJQ37fttEnNhZJ4n6bM4ooTo20=; b=KKOj46Z7W/ij
	jf2hFFMQ2vDR7nEENu5ZdVJ/NyOdjUttMN9YteLMAznDFn/74Kuu3onbfWLdrb8O
	eZERMonWHd0qDLVMJte9lgtzGO7DvoaWBewh73mWDFwtkWZ4DBbs06sDwIyJe+T/
	Rqlp0WhywWnjLd8q3+dPp4WF0QZ22XNCbpHC8Cjfz8tinwnfPSmmlef1RzFdMFE3
	or3p4OTAgJJ2gPAqUlEGwjibjT4//7wM3cZD87fcX8Urjd6NPfVSsl/KqdUh5tGW
	iCHbRbuUNaFVwtV/FgAC9JgHY7RpMVrZ9PhI0MS5CrVA18zvfWLxVekH/7aLmn/D
	/Sncgx+JLA==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11020098.outbound.protection.outlook.com [40.93.198.98])
	by mx0a-0024c301.pphosted.com (PPS) with ESMTPS id 4b0qtj82eg-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 12 Dec 2025 12:34:48 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ncx3Jg+YiJ0Bv/dhleacux071pUUSlctACaSqzGocD8PBekWmqa1OxTiaynefVIAayeHX7wOTygHz7iQy4HB/R5YHpgu4W5OROCwzrkWJOy1WY04F9zFYI8C4ZEoEFk2FR0ZfZAYggvkcz8HrvfhIl9r72kmnvhjkf5CYHaibBWyExqeFb0cZbIkwqUT1TwoQVX5GkQgZqUlmVuLbPmpPi4RquoW/tktzsxs2LP6arcSi74Q5auJ/hhMJ/C0Vre/eH+IvddBJ/8FeMb4pUjbgaRG+8sqgWWxGLDoYZAwN4tYLThBFEsSjJEzpgMCX7bEZlEnGC2NsuEzfJF5Ms2gpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oLgMiyRq6nmDJLHijnJQ37fttEnNhZJ4n6bM4ooTo20=;
 b=r+gS/+biU4xYuhUkdq+clqlHHCr0UW4vn1oxrQ4WShkUBynNt/Tzxx3ojkJyU3aF0gp2I2XhiHZk1io4w8sGjea534z2GuLVV59w3TqdwbtqycwOuhe02JDyiEdhdeSA4JS/X7NIhpjO8CkYxpaTL084D3AGoRaDppRhAsW+P4jrvd6oftcaIdVYt1as37UEPb9aDcZKoxPq8RqSr+hxzfzXUEzehYwm3gdtBcS8at5wZIEsfEhtl9SrOMZes/inHdjFy/ZT6IjjYKysU4L1ZvWEQ/JkZGWJRsFO/3NdWFi09OqCVrxPIeZC3BO8mwSPY41LkBvUKJrdd5mv+NunAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silabs.com; dmarc=pass action=none header.from=silabs.com;
 dkim=pass header.d=silabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oLgMiyRq6nmDJLHijnJQ37fttEnNhZJ4n6bM4ooTo20=;
 b=VPCx48s1JCuiJA63PJatq0MZTBc3W37yIjmVq1VFhsAdWSGfHjFtDfX4L7UZVFT6vMQ1Oa6/IPL/3VNjhK0q2VdwlOpbdgGl7O7m9qzsf6PSPpuoC6JGAshwh6l8QmCuEsS0a1+TKh8GiEfH8B1N5J1xbsuhKrd1lAnTJjzgzkM=
Received: from PH0PR11MB4998.namprd11.prod.outlook.com (2603:10b6:510:32::8)
 by PH3PPF7708D4D9D.namprd11.prod.outlook.com (2603:10b6:518:1::d31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.8; Fri, 12 Dec
 2025 18:34:45 +0000
Received: from PH0PR11MB4998.namprd11.prod.outlook.com
 ([fe80::4d2a:d205:a1ec:b7a]) by PH0PR11MB4998.namprd11.prod.outlook.com
 ([fe80::4d2a:d205:a1ec:b7a%6]) with mapi id 15.20.9412.005; Fri, 12 Dec 2025
 18:34:45 +0000
Date: Fri, 12 Dec 2025 13:34:43 -0500
Message-Id: <DEWGDIH9C8LO.5T8EHIIMO6XL@silabs.com>
From: "Yacin Belmihoub-Martel" <yacin.belmihoub-martel@silabs.com>
To: =?utf-8?q?Damien_Ri=C3=A9gel?= <damien.riegel@silabs.com>,
        <greybus-dev@lists.linaro.org>
X-Mailer: aerc 0.20.1-25-g357c1bff1570
References: <20251212161308.25678-1-damien.riegel@silabs.com>
 <20251212161308.25678-9-damien.riegel@silabs.com>
In-Reply-To: <20251212161308.25678-9-damien.riegel@silabs.com>
X-ClientProxiedBy: YT3PR01CA0062.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:84::22) To PH0PR11MB4998.namprd11.prod.outlook.com
 (2603:10b6:510:32::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB4998:EE_|PH3PPF7708D4D9D:EE_
X-MS-Office365-Filtering-Correlation-Id: 5029af40-145d-4d2a-8d8d-08de39ad1f55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?UTc3NVhRSURucG9KTVFkRnJKcS9ZQ3BtMEpTWURvMFZWQlpESFBKWk10SWty?=
 =?utf-8?B?NzBlaS9lam5YZXZpendoYXBqRDMyRFpsSks2b0h4dUhsaXd6Y3A2cFFTNTVI?=
 =?utf-8?B?alhvYlF3UHoxNTIyd2VrekVSejZvUk1aRlNoM3NYSVZDZ0NmRk1RSitxdWdM?=
 =?utf-8?B?WEJ4eTN3aWJmZy85YVBjQk5RNlhKbG1VVFBKZHF2bDY2b1N2M2g3TG13Zzg1?=
 =?utf-8?B?aWlMSDBJU2xZZ3hzTTJkSW45M0dmRVpsSE5JdVBXREhWYlJSMDk1dnBpZW8r?=
 =?utf-8?B?bEM2NE5mMnp1WjdYdytYYWY4b2pwcHh0YnpEQ3pqdDNvVEFuMFU4M0hpMnhD?=
 =?utf-8?B?Y2prQWRXVmxVS2E5VnZxQVNGVEViTy9uTVVVMHowVW1mTXJqMXlTU0JOMGVO?=
 =?utf-8?B?UHl6aWwwc0ttRVVMMEUxQTFObElHT04vVWIzZ04yMnlMYVpKR2gyRmtSSzRw?=
 =?utf-8?B?clpjU2FqajB2c00xbG50UUdoT3lZL1JVTGJnWlRkeHpCcldQZjI0Y1BiNTN4?=
 =?utf-8?B?WlBqR1MvbC9SSVovZHlqampHTUJhUzZiazZmYzFZVDd1Nk5iVUlIM1BEQUky?=
 =?utf-8?B?QVF4OWFzelFVREpYbkwvcFpqZjVXUnZzWkFZcUU2OFN4RE44TmRONW1VMVdQ?=
 =?utf-8?B?cVBySlpad01veVdqMjJ4aXRCOGNUMGFOMXVYMnprU1pjTnlPNXE3a0plRHRX?=
 =?utf-8?B?eVU1aURTZkM5M250eG0wcCtmZXQ4VmhYSmZoMjhySHh0ZDhSV0RidENWKzh6?=
 =?utf-8?B?Y0RhV0VqeC9zM051MFI0c1RlaktCMWt1T0NLS296SUdVNFpvRjR5eUFOM3Fs?=
 =?utf-8?B?RUl5dkN5NGVyM2E5S2hTaHN2YmZEVjhWaHIrNk00bG5xTEVTVWxYdVFMNGVP?=
 =?utf-8?B?ejNTRkM5dmdWbkxwd3pmdmtINFFSbjBGNWNCM0FOYi83MzJrUmw2UCtscWxh?=
 =?utf-8?B?L1Y5dnlDRnQ0QmQwczUyQTFBWGJ2Rm9QRnUvY1FYNmJSdWU2czVzQ3hlT3Jk?=
 =?utf-8?B?VlB4SHVyc1kzbkJTUGFrZHdoeEI4WDhyNy8rWGVSaGZHdSttSzBkSW44ZGQ3?=
 =?utf-8?B?OFpVZURZV3U0eU5TUzFGNzRNSFZSTzB0MFMrclY0WEttN2xPeU5HNS9jYWZH?=
 =?utf-8?B?K012K2M3NWs4cy9KQnRtTnlHU1lENVV2TmREazFJOThoYm1ndDNoTFBMc0Nq?=
 =?utf-8?B?a2JQQ0tqQWJxZzBrazh4NGVvZDVXK2xwcTJ3eU5wT3p4dWV4SzJCME1CR3Jx?=
 =?utf-8?B?NkRMTFVndHlyUWdXS0U3MVJOMnZ6UnI0TG1la2hsM2F4ZE1Kd1V5eVNRc0hx?=
 =?utf-8?B?MHE5bUxwbDltQ1JRZEc5WnZsSENOWXVVd0NuclR3dFRjSDV6VVZCM3dPMzYv?=
 =?utf-8?B?eUxpT0ZPZ1pDeUV1MjN1dlo3dktHMGtKVDdDejdTcTFtbXk5V3pIZk4yTXdP?=
 =?utf-8?B?cXhFdE0xRWJqZzVRd3plOUdGVmYyQXJPM0R0ZndKcWdnSGhlcWFPbHpoMXV2?=
 =?utf-8?B?MUZDRVIxOVZvb21LeDBkdW9heDloRVNGYzJtZWJKR1RWK3o3SVhCMjZhbGYy?=
 =?utf-8?B?T1FuY2I2b3IyME9ZQ3g4QjdiOGQxTGdLZXBaQS8wVHMzVi9IZGpQZUpNRlpp?=
 =?utf-8?B?blc1S3V1WmV0bTUrYTFibzNCeWpRSGpNemtmYzl0VmpHdGMzQ3BrMi9Mc1Bk?=
 =?utf-8?B?OFYwbmtTRWtKNzhQTWZoWTFBeWVXTzF5cFNtWlExN0hUQlg4algxYm5yMi9v?=
 =?utf-8?B?OXJDeGdNLzQ2ZTRYNGZGZi9LUXJrenZWV1J4MUoycHFtWU83VEdEdmFNcUMr?=
 =?utf-8?B?TnpYMSs3bEt4cEhMVGw4Z3RoZjNVV0c1bVZrNjRJczlBOVhSVVhLNGR6V0Qz?=
 =?utf-8?B?Z3dZU3g5aDZFMlcrTjRLSWZzTDdlVzBiblJQbjEwclZ1ZUVpT3QrcWVDcUIr?=
 =?utf-8?Q?qwsNEYn2Z6Zjbc+hnmJD/VpGSK9YYJQ9?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB4998.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VXJBTVBxQlVXc2g3ckVHMW1jQmJwNTU5c2hpaWIvcVJNUTBwY3JtczUxZWp6?=
 =?utf-8?B?cjFoVWVjZkt0dHNlQTREVzJlWnJuZmhOcHRyaWQ1c0c2SHVnTVp0djBTQTFt?=
 =?utf-8?B?dXFXQkx1V1ovckFNS0VjWncyUEVpZlMwMXRaSFRVL1NjUEtKOVdPM3ZUVDZj?=
 =?utf-8?B?QTlhYU1iL1pyRXRvRWlxeXNQR1ViYXBYdFkzMFdURUlDTFZTNkVSem1sL1Jy?=
 =?utf-8?B?YU5nU3FNQktqcEx1cG5rRjZvV2RWL0t1bHZhMS9MNk9uSTZST00vdTF3MUVB?=
 =?utf-8?B?WkM5bHl6RldTditUa2J4STZFSEd5L1F5bGRDZkxZRzdDSGFNS1NFSUxQZHRL?=
 =?utf-8?B?RVJvMllBL0Z4T0xCTjdMZUJXcEx5WGg1MFRwUHRobXlRNWlyWWszaTRBQ3JE?=
 =?utf-8?B?dU9SVzF0TVJzVXVsOWtPeEFvTWtRNTF1b2tQTnlXSmd5QWw4Y2R6eVRwUHgy?=
 =?utf-8?B?YTRTd0t2N3JoSTkrNGpBV3RQYitoV1NXaks4V2J6S1QrblI0aHpOYVloTHpK?=
 =?utf-8?B?aTNHKzJsT1dEWWpyZ2pRRXpuT0JaaTNVdzlLY21Id0FvNUlkdEVVTVNhdDVw?=
 =?utf-8?B?LzhqUTQ3WUtseXBMU09TQjdEZFV5MDNtMllSV1J0QkUxejFUVHp5d3A3eVNh?=
 =?utf-8?B?NTVJVlp4RTFNMFRvdlNSazZ5VW43eDhEQmg5OFRPVnB1dGxFenZqbzZvSHNJ?=
 =?utf-8?B?RHoybGNERWVleUtkUzZ0aStHL05KSi84ZHdZUWZOeGlETmVPSDRSQ0RsOFBB?=
 =?utf-8?B?S1lRcEtlcmVoQWM0Rk9ONG9ZWCtXWThpOGVmbGdFdGUycFFpTmVkdG4yYW9W?=
 =?utf-8?B?N2cwa20vZkV3MVZSRWFORzZCNFlNU2VkaUhOWFcwOFhNSHBZUGdYeGxkbVd0?=
 =?utf-8?B?UVJWTUs0SnhKV3pvcnRQckVXaVM2bWdYNXg1c3c5Yyt1Wm11VVhGZ1AwMVA4?=
 =?utf-8?B?UGxqbG9OYnV3cEhndXM0QWIvWG9MWmR3dHI2Mk1IWm83TndlTlV2c2c3bFNx?=
 =?utf-8?B?c25sTEp0VkpPRmhXVEhIbnpFYVhNeWtNVm5zcnhNZ0krZFNYTldGVGxmaTFx?=
 =?utf-8?B?ZjVWbHNKMVMzTk9xSnNJS3NyUzlDbitLZjA1V1YyK0t4ZFVvMVF6MW04Q0cr?=
 =?utf-8?B?eGRQcFk3dStyV2hSand1THhKZlFYTUtoMDBhQnJwOHhrY3FXNnZuMnlDbmxn?=
 =?utf-8?B?dkp6N1BibFJFbUdOWG1qNXRKVEIrMlhzcmZmYVd3UFlUNzJkNUVVWi9VMVpS?=
 =?utf-8?B?b3pOTjVVNWRQMmxlKy9RNG9maHBjcElyRUxlK0VLN25hN0JUcm5iakVET3pK?=
 =?utf-8?B?cndpUEVYVXpUZW50Ulh3Y0kxcmI1eldJTlMvazBrNGJMV2hSaDA4Q3ZXYkVB?=
 =?utf-8?B?am55ajB2c2pQeVdiMDZGYi9SRm8xaWh0Y1hKRlJWeHVnVVJNMWpOVkJVSm9X?=
 =?utf-8?B?czlrK2dvcFJycXFCa2hzZnZ3VW1kdElyVDhja1V1aHVkZlUzcDJMUDZkZ0VV?=
 =?utf-8?B?TGpVaEZ4K21Pc2FMY0E3dE5sMUoyeWFicjh0WmVad1BSekU3aVRYVk1jVmtU?=
 =?utf-8?B?WGwrM0pHYlhjT2FOT2tDVzUwQkVzM1ZSV2o3K004UStZYXhXYmtxQ1lMZkI5?=
 =?utf-8?B?eCtDUEtXZitvNVo2Q2VsbjVKZGhlQ0duR05JVitkc1pXZzR2Wkh1Mnl3YWov?=
 =?utf-8?B?L1lFN1JOanBnb3VBUStnUGMrV1NPMW0wWVVZSW1WaGlXQ2w1d2hTdzFuMDJL?=
 =?utf-8?B?RzY2WmE4Y096bTlyWDNVVDFZRGtHR1lZNUNzRWsrcXdaN0hTY1BoZmppb3Jo?=
 =?utf-8?B?SWplamoyYTBjbERXeUlIQk5vL0ZsT2poTHFyMG9TSzkrUGJDeGxaYTJianhB?=
 =?utf-8?B?Ny9jcVNva0NWZGkvK2xiK1dxSDgxeER4a3ZBNXVaTXBkY0orVmZrMys1cmht?=
 =?utf-8?B?OWNMMHFpYXp4bkNEVDl6QWlSM2dKMUtSdW9WSUJLNWoxdmdNeHpQZkc3TnJa?=
 =?utf-8?B?MjRQN2E3Yml2VmtrdkhGZU1DaEI2QllnSzVzemI4SmRHOHVzb2xaLzFaYmdi?=
 =?utf-8?B?OU4zbVZydnFGdHJURHQ0cWNFenFkNTFTUnhBdmRPZzEyWXFVNzZoeExRTmk5?=
 =?utf-8?Q?waflKskRLDb7Y2C7lrGoOeM67?=
X-OriginatorOrg: silabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5029af40-145d-4d2a-8d8d-08de39ad1f55
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB4998.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 18:34:45.4825
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 54dbd822-5231-4b20-944d-6f4abcd541fb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5UkG9ZWd04ylnFpWtup3rPc6r+o3ibGdckv3NUd/SNm/Kmrh9ahwoXUL+GJXzS9RMK6Q4FNzMuv9bDyuSlwt4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF7708D4D9D
X-Proofpoint-ORIG-GUID: vRjGParfP0HzwOF6bg3Lc9F0NrcblBc4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEyMDE0OCBTYWx0ZWRfX03EKOhwcKXrK
 e4XUyQqa3CZNI93uIadXievs/2RVYuj1hPwidTadBe6owBcezjNasIniKUho5gokROoA/rmxoaO
 oBkj9ao+0scYYoaDEI0aAZ6sPVhvxOpzZ1LgzKQ3r+Zmq8WmXfaRyU3Ct398a4UZ0+Wbp2VTezB
 3IxNl8bGw9H4JmKTt7hjnlIrV5D7cAg+MZL+HpMjz3pHieKiUCSQDCszsMxhB9DP3ADaoN2S61F
 qLUUA64WVQ/PaOkh/4W4LS7wHarvFsBd8xcIIvbW/yp2BYIuAQtcnGQ2xuyFDTwfDk4Ow39gTCO
 Gab8bi2QNTch/4LmAcy0iwslosYleUftmZj5S5V5wpWFjamGV6mafEegO9/Np+xk9mmMQESSIkZ
 ocC7r5PFDOK3Yu1HCpy6tfDvnxNjcA==
X-Proofpoint-GUID: vRjGParfP0HzwOF6bg3Lc9F0NrcblBc4
X-Authority-Analysis: v=2.4 cv=M8JA6iws c=1 sm=1 tr=0 ts=693c6048 cx=c_pps
 a=5WG37Iiv9zZuKkK3l3Cj4Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=i1IsUcr2s-wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=lSz_L6Ji9TvEMfO8k5gA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-12_05,2025-12-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 lowpriorityscore=0
 malwarescore=0 phishscore=0 clxscore=1015 impostorscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512120148
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.10 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[silabs.com,reject];
	R_DKIM_ALLOW(-0.20)[silabs.com:s=pps12202023,silabs.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:148.163.153.153];
	RCVD_IN_DNSWL_LOW(-0.10)[148.163.153.153:from];
	MIME_GOOD(-0.10)[text/plain];
	BLOCKLISTDE_FAIL(0.00)[2603:10b6:510:32::8:server fail,148.163.153.153:server fail,40.93.198.98:server fail];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:22843, ipnet:148.163.152.0/22, country:US];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DNSWL_BLOCKED(0.00)[40.93.198.98:received,2603:10b6:510:32::8:received];
	DKIM_TRACE(0.00)[silabs.com:+]
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 70A3C3F99A
X-Spamd-Bar: -----
Message-ID-Hash: H6T2RLVJUUJNZQV5GM6DS6BVBMSVHLRY
X-Message-ID-Hash: H6T2RLVJUUJNZQV5GM6DS6BVBMSVHLRY
X-MailFrom: Yacin.Belmihoub-Martel@silabs.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, Silicon Labs Kernel Team <linux-devel@silabs.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 08/14] greybus: cpc: add and validate sequence numbers
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/H6T2RLVJUUJNZQV5GM6DS6BVBMSVHLRY/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gRnJpIERlYyAxMiwgMjAyNSBhdCAxMToxMyBBTSBFU1QsIERhbWllbiBSacOpZ2VsIHdyb3Rl
Og0KPiArdm9pZCBjcGNfcHJvdG9jb2xfb25fZGF0YShzdHJ1Y3QgY3BjX2Nwb3J0ICpjcG9ydCwg
c3RydWN0IHNrX2J1ZmYgKnNrYikNCj4gK3sNCj4gKwlbLi4uXQ0KPiArCWV4cGVjdGVkX3NlcSA9
IHNlcSA9PSBjcG9ydC0+dGNiLmFjazsNCj4gKwlpZiAoZXhwZWN0ZWRfc2VxKQ0KPiArCQljcG9y
dC0+dGNiLmFjaysrOw0KPiArCWVsc2UNCj4gKwkJZGV2X3dhcm4oY3BjX2hkX2RldihjcG9ydC0+
Y3BjX2hkKSwgInVuZXhwZWN0ZWQgc2VxOiAldSwgZXhwZWN0ZWQgc2VxOiAldVxuIiwgc2VxLA0K
PiArCQkJIGNwb3J0LT50Y2IuYWNrKTsNCj4gKwlbLi4uXQ0KPiArfQ0KDQpUaGlzIHdhcm5pbmcg
Y2FuIG9jY3VyIHNvbWV3aGF0IG9mdGVuIGR1ZSB0byByZXRyYW5zbWlzc2lvbnMuIFBlcmhhcHMg
d2UNCnNob3VsZCBjaGFuZ2UgaXQgdG8gYW4gYGRldl9pbmZvYC4NCg0KVGhhbmtzLA0KLS0gDQpZ
YWNpbiBCZWxtaWhvdWItTWFydGVsDQpTaWxpY29uIExhYm9yYXRvcmllcw0KDQpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpncmV5YnVzLWRldiBtYWlsaW5n
IGxpc3QgLS0gZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpUbyB1bnN1YnNjcmliZSBzZW5k
IGFuIGVtYWlsIHRvIGdyZXlidXMtZGV2LWxlYXZlQGxpc3RzLmxpbmFyby5vcmcK
