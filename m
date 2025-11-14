Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id D57E1C5DC02
	for <lists+greybus-dev@lfdr.de>; Fri, 14 Nov 2025 16:08:37 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id B3E1E3F852
	for <lists+greybus-dev@lfdr.de>; Fri, 14 Nov 2025 15:08:36 +0000 (UTC)
Received: from mx0a-0024c301.pphosted.com (mx0a-0024c301.pphosted.com [148.163.149.154])
	by lists.linaro.org (Postfix) with ESMTPS id 3A29F3F845
	for <greybus-dev@lists.linaro.org>; Fri, 14 Nov 2025 15:08:22 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=silabs.com header.s=pps12202023 header.b=PCRupDPc;
	dkim=pass header.d=silabs.com header.s=selector1 header.b=Bj7JhESX;
	dmarc=pass (policy=reject) header.from=silabs.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1");
	spf=pass (lists.linaro.org: domain of Damien.Riegel@silabs.com designates 148.163.149.154 as permitted sender) smtp.mailfrom=Damien.Riegel@silabs.com
Received: from pps.filterd (m0101743.ppops.net [127.0.0.1])
	by mx0a-0024c301.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AE9uiJb2132830;
	Fri, 14 Nov 2025 09:08:12 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps12202023;
	 bh=LHgz/lFtijHK41pa6ALEsVJ/2xu953e1nb/ba2nB5uY=; b=PCRupDPcAEgU
	u7fLgWSyHOgmipu9RINRbRLj+hrZwjLzgKQI+vyJgHfgIkh8PdEJT0l4XrFezUo0
	UlCDNGs/jMtegeM6841pM00A/xx4OyomkhFDcYHB9E8iRZCxBfUg/0Daz4Kb3rkJ
	b8a3TeITSsWVmY4sFa52PkmzFIaXGp1PkQ5rgyOjal6IDf10SA3QZpVzr1EDoPri
	zuFyPnbZFdZhJ4ZOgkI5DAxEQMaiV3cThO6+3tV/ouENwunm3ju/1YOa7IaeBf78
	T9zXX+wEwfVDCkNF7r0L1iEjMiXz1orgcEw1gFyyQyfLG2TIKWpIVnXkAg2CKLON
	4msyq9OPlA==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11021143.outbound.protection.outlook.com [52.101.62.143])
	by mx0a-0024c301.pphosted.com (PPS) with ESMTPS id 4ae285rk08-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 14 Nov 2025 09:08:11 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xws322Aorcfa3lvS5jDNo+hMRiLjvhDYodfhWNvU5qoCMOSyydsp/sa0R2FWDmvGuMV7xfQuoVDc6FfBg59VUz3bgDUm98ONeNrOAOJ85LcrKlpYHZ/8hoLT9yWDLzYMj2xYqWgU43MCYNP4YxOT/p39uBjFodfk5jhZrzi59v/JoNVrl1XLhK3b6aGaoNnrS4pHpPH8kduVEe+UXpSm9Gx1FVa8ajSshgVJ3Mj1qWvPZ+TDrSm4zmjAsMV3V89S1ptGf4gp5+NQFM2yv3csVobTNRsrNJIDPJ3ur8LBjRofbuo1R1nnYp+TaHkYgvkPn2tNMje1MeoYpcm+eAC8RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LHgz/lFtijHK41pa6ALEsVJ/2xu953e1nb/ba2nB5uY=;
 b=mt+NEPdrKCI7GvV5VPObis8QyzDy6SsV0r+tayNSGOPtIvRXighhnRJQnxlB5KHI4UlwImBw56jD1Ztygr/IWItsIf3AqQWFTOTzXOsmR0+pjXmPYeBacTowgFaoKfCbc+py/UyGdfEOTuI6cHVJgomi8t7nKPz+hVjZLENagKsA+as+Pzt1PKozt1L4QEWN43tvfSlphXwEqpWF1cBIHZak2pOq3sntDvX5tve10sIDCwJxZS9X1hzYweB0pD0J/nfgeEWq/kKf1y/z9B8VIU7phq4CDOm2ZA/aIyNUWXExpPwb5HLvalqhV6cRJaz4t6gUNsQ3F95YyiUumgzJQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silabs.com; dmarc=pass action=none header.from=silabs.com;
 dkim=pass header.d=silabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LHgz/lFtijHK41pa6ALEsVJ/2xu953e1nb/ba2nB5uY=;
 b=Bj7JhESX8mXs3xrxNAluzyFfsc9t2O/jg6aAImTvyaYQwH91v6ru2pcizcOAWVftmag25IlW3YbsvQbm4zUjlyCQvGu+sVS9fW1zfzhzBSgMAc4Qg0hrWG2nkPPcXQlkX8clBhCGXGAZs7xZ2NVteQnueoKGv//GrxhKasdiqJ8=
Received: from DS0PR11MB8205.namprd11.prod.outlook.com (2603:10b6:8:162::17)
 by MW4PR11MB7005.namprd11.prod.outlook.com (2603:10b6:303:22e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.18; Fri, 14 Nov
 2025 15:08:09 +0000
Received: from DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::c508:9b04:3351:524a]) by DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::c508:9b04:3351:524a%5]) with mapi id 15.20.9320.018; Fri, 14 Nov 2025
 15:08:09 +0000
From: =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
To: greybus-dev@lists.linaro.org, Johan Hovold <johan@kernel.org>,
        Alex Elder <elder@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org
Date: Fri, 14 Nov 2025 10:07:28 -0500
Message-ID: <20251114150738.32426-3-damien.riegel@silabs.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251114150738.32426-1-damien.riegel@silabs.com>
References: <20251114150738.32426-1-damien.riegel@silabs.com>
X-ClientProxiedBy: MA5P287CA0046.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:175::12) To DS0PR11MB8205.namprd11.prod.outlook.com
 (2603:10b6:8:162::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8205:EE_|MW4PR11MB7005:EE_
X-MS-Office365-Filtering-Correlation-Id: 8faabfea-14ec-4d41-5a5a-08de238f9f0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|366016|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?WmkrUVdRd0NxbUMrdlA0SDZWbzVzSWVCUFhmOEFFM3A3Zk5hTWpmZmFvYytK?=
 =?utf-8?B?eC9VL3ZzTyt5aHlUQmRWRGk3UXJEMngzbmFvd1RUNnc1UkhmVmdSNXo3eVhh?=
 =?utf-8?B?cWtlbUpaQXFhdUhndHhDK28zRlFwTWRXM25TQy9hc1ZyaFRjNVhGS3I0SFlH?=
 =?utf-8?B?Rmc0azdaNmM3ZHBnTFpvblg5TmhVQW5ReGd3QkQzSlRUVzRuT202cHMxbzZr?=
 =?utf-8?B?aE5QZ1drRWJXZ3ZobCs4dVZJbE4zbGl6OE5wYVVlcjNEOXkzTlpqQ2VUVWpK?=
 =?utf-8?B?OE9Lem92VFUzWVNmNjM1VzJvNUJ1Y2U1RGxWVlFLSi9ZcWhxSkFpR0MwMTdR?=
 =?utf-8?B?Uy96eWdsSFUybUZ2Z2VJU2xyMzBTRWcvbzc4eXVCUXg0TVlPaVlkS0VUR3Vm?=
 =?utf-8?B?bHNNSFhlUEZaSEcrTnVFMGtsbEs3TEk5VzBJenMrZGEzU0JseVd1c1ErbnBY?=
 =?utf-8?B?QUxlZ0JYYkpObWhjdWordTNWRDlDRXpDSkRGdlJYTWZXbm9lOFFoaTY2cUN5?=
 =?utf-8?B?K2pSblJkdGdCVW5md1ZMVmtDWm82UDFWRjdMYmhwQW9ib2lRNDEzNDJmdVNP?=
 =?utf-8?B?TDQzcGt6TzlXUktSV0pxTnV6RDRNSjNKZksrQmtxbTJhcTI4bEt0MmRBWGp3?=
 =?utf-8?B?Y3RlWG4zRUJPWDZOTWhxanowdlNlU0NKUUZPdDEzVDdEU0NVUWZseXFEVVpG?=
 =?utf-8?B?M3dQdFo4bXNTMmtqbEl4d04rY1B2NWlSQ3F2bVdRbHZEVEFaRERIMDFVQkJJ?=
 =?utf-8?B?d1lIakdpeEl2cnNNMSsyQXkwcHk1NzFEcnJuWGk1cVhvODd6Y2RkeXdrRE8y?=
 =?utf-8?B?dzJManVwcEhtMlhYejJDcHlmamtDQmVPSTJYTTNPOXk3bVR6c0VwZ05kclBi?=
 =?utf-8?B?ZlIvT1lFWkFWMXljQmJFT01WVHZBY3Rna29yZmh3U0JkWFJqcUJJemFNODNv?=
 =?utf-8?B?bi9PRlVrUDV3R3JIdWRDcFdGeU54RW9NTTFOUTVpOVB2cFh1N0VScTUvbXQ0?=
 =?utf-8?B?VDZDT2REYjAwZVQyRy9tTlg1ZGlUaW5wTTEyZVZaWlNtR0JQSG80ZUNMZHRW?=
 =?utf-8?B?QWoxSmIvWkI2M1dydzZ5YTdINFl6WDlGeWw0K0hRams0bms1M05tMXdQd1lD?=
 =?utf-8?B?eG9icjJ3ZFlTQjV3WkI0L1huWU5iRExwVThiam0yWGZkK21KSmdQbEd2REVC?=
 =?utf-8?B?QWZSaCswd212YXBJTDZTNEkxeFU5bnViVW81MHNaaWhCZzlia3JOQUIxZlhs?=
 =?utf-8?B?VEVGVU1lLzVVRGpzaG5YMUVCV1crdFpyMFpnZVVSU0dHb0tGdzVYS0JrdXpm?=
 =?utf-8?B?QkNiYXgvbWJUUzBEQTlYSTZxZUlWUldZdHBTSUZZeHl2NzkxWXVPWDlmTEZs?=
 =?utf-8?B?TlFoMlBvYmI2bVhtd3I2enlHaU1wT1ZQQkE1d1hsa040NTU2Ulo0NlVjbVFU?=
 =?utf-8?B?c3pRL3FzRjVJRnp1MEFBbU4yc3N4c1dzdFpsQlBVeHYvN3MzSU56Z3VCQlFo?=
 =?utf-8?B?TEk4TVpCdU9IUnZwUjQrZlBJMVRrR3pZeTZnVUo3WFNSUWRmK2lteXRCRkhm?=
 =?utf-8?B?VkxLSlVZRzZoUFQvT0FkZW96bFVidENKRDREckJqbGpZSkZTRzV4QTQ1QVdh?=
 =?utf-8?B?Q0JBamhRQTVrNkZldUplQlZOdUFwYXBTZHJBd3VRQ3czUzZzaExyWlNPbWtt?=
 =?utf-8?B?b3ZZSGdVdlZHajVjTzJQbXFlQWVLN3FmaEJwZ2FhUnY5T0NwN1lPUk5LZnF2?=
 =?utf-8?B?K3VXWXprV1FrazRPSzE5czRrVjRMelpVWTZQWjZoaW5CeXlkYlZPNDA4UHF4?=
 =?utf-8?B?Vmh5bWMwMWNnb29IVmNLQ2RINmdKTmRaaTJ4eXd1QXJIZkswRzlGRytqOEox?=
 =?utf-8?B?UWVtUjBDRnR6SjdoZk9mdXE5V2xTRmp5aVhvV1ZrdFVXbS9odTBmanVoS1px?=
 =?utf-8?B?SmlWakw2VVdVQmQyNXFJK29OZzRSZlB3S1dSZkk5ZGVMbGlxV2Z3T3NCTmU0?=
 =?utf-8?B?a0QxMGQ5TzV2Vm81R0FoRHE4MlZCd25SYnQyOHY1eTBhVWRiNmlZOXZ5ZElp?=
 =?utf-8?Q?oQEJDC?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8205.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(366016)(376014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cFNFMDdXMGVaeHFkZ256WWpnYllnM0U1M1hoeFRMbERsVTNST3BjcGtnczY3?=
 =?utf-8?B?blo2MzlBUmJYS3lQY3lINm5ubDZwYVd1QzArVDhLZGNwcDJKUDJZQ0srRkUx?=
 =?utf-8?B?Q04vZ3o0V1orNmxzbFFMdkd6MG1RQzNKOWJnTjRRbXdNeG1KbzM2dExuNUt4?=
 =?utf-8?B?Ynhmcld2bHpHcDFXMHE2OW4yZjFQQWlWcGRPNFdMZFRvT1gvRm5GMWZ0UTRJ?=
 =?utf-8?B?MHRia2lHMmppRWpOR1M5d09tT0lHSUE5UW9DL2thYUt6blMvWEVjc2VrWTJy?=
 =?utf-8?B?TElMRWVUWjFOZjRPN1ZjL0ZuN2V0WDhtbXUraGNVbm0rdkJRKzVHUkRyUGNH?=
 =?utf-8?B?dm1SN3NPRXYydE5iY2pyeTR5UElqYk1Xb0x6UXViKy9lZExQN0NIb2FBNHls?=
 =?utf-8?B?R1I4STdIdWc0bi8vOVlHTEtLaldDNGI0ZVhDR1R2cEhRc3NUc1o1OUhBdUdV?=
 =?utf-8?B?Y3ZMeGN2T3JCQkJFUkxnOTB6QkJoYjlyZm1SSndGMGhxZGc0dHV6Y1JldEJ3?=
 =?utf-8?B?SEdCcGpPakdkT3BYeUJnQjdmcmI3WTZLdzZSLzArWUVyN3Jua2NhZ3BVaTFP?=
 =?utf-8?B?UDc4ZUMxL2Q3U0RGc3lFM1lmUW1SV1pLcVIrZUJ4VHIxd2haaVhIdjJvQVVB?=
 =?utf-8?B?Q3NMdVRqMXpwcnArOFROditQNXlwN0h1L2gvMWJBUlVOc3pSNUFDSkFOTS9D?=
 =?utf-8?B?dmxlKzNzSjIxR1pWYTM0ZGJ1RCt1dEFiT2l1WFRiVkx6d3dhZGJLNTlwZk1F?=
 =?utf-8?B?Z2luWWlOeWlkY21nVXNrYTRaNHlUZE03a2hqaVdORWFaUmxPYXRjQTB0VHha?=
 =?utf-8?B?RXZmTzJ3M0JaeG1DTG9XaVhMMGdxMFhlLzl5c2FhSzhVbVpZZloyd1NZdHFE?=
 =?utf-8?B?NlhWZllXUytjemZIanJjM0xiT1gzRkJCUU01NVJrSjBQZ2tnd0JmNlFwL1U4?=
 =?utf-8?B?Z1pZN0NEUW1ZZThCUEZaZGh0TFBlS200UFNoem9UeEkveDQ4Szk4TFo1TlB1?=
 =?utf-8?B?eEw3MEV4WEVTMkkvNTR5VlV6SzluaVdhTXczNjNRRkFNd3lPcUI3YjEvbnFl?=
 =?utf-8?B?NnZVT0d2WXJ2WmFreU5HZmhSR2xPU0Y3M2xHY0hoZ3EzSnBpZVVTdWZkRHlG?=
 =?utf-8?B?bzU1bWUzZWRjMFV2aFVCQVNRaVFCRGU3VnMwbkVZR01HT1g4TUpDMFBKamI1?=
 =?utf-8?B?L1c5SCt2d2t2ZW9KKzhmTmx4MExDbDlQOWhKM3Z0SjUyMklBa0E5cGorWmJ0?=
 =?utf-8?B?YWYvT3JlMGhxWnB4QTl2Q1VIY3M4RHdqZHR5UGxmN0VuRVhHVExXZGZJTjBp?=
 =?utf-8?B?MHFOZ2pyTnpKUmtySndHekw1RXZzUW9sUkhHWUlXWDR6QWpwUnJWd0ZkVVpy?=
 =?utf-8?B?cWlLay9HRDRUK2x3VHZ5UFNQMFFmcy9iYVJqOW13OVU4NGQ0NFpBU1pzQVU0?=
 =?utf-8?B?SWpuZGxDWHNWc3VJRzlaUTN0TEJVVUJYeEl5WTRZM2hzVkdhT3hWYUR0WkNq?=
 =?utf-8?B?MG1SWDNwMjhlbjg2Y2V0M2Fwd3FuQTdNbVF3a1J3eUN6aElDay9QdTMrNlZM?=
 =?utf-8?B?enc0cmlKdFhtT2RUZHplSW11TGlHakpWQXZUSzJNZkZRWWtqZFM0dFUwU1I1?=
 =?utf-8?B?bElPN3lPWitqa3BvaDBhSmdUY09qcXM0M3Bmd3hyQzdHbkpaRDJVSTJ2YTJx?=
 =?utf-8?B?UVhVc0FiSU5hNUMvbVNDVUhRTnhmeVFCNkE5cnZTVzY1NWUvUmkwWXRsUkxK?=
 =?utf-8?B?NHV6ZXV0WHRoYzRzb2FlaWpkdzdLazBjUVN6RmZ6NzJja3hvbjFFWlRKTzRo?=
 =?utf-8?B?WkVPS3dMSWM4MnJxa3lvSnU5MFl6YThEUkxVSmJRZi9oaVZxK1lPN044WVZ4?=
 =?utf-8?B?WTU1MTdFT2g0SWJReUk3SkFZSitQQWEyMHZpT056OStmYkhlSWVwQ2lFV0FO?=
 =?utf-8?B?WGlRYzQ4RFNVaEJhT1VROWZXSnR1empveDVGWUxTcEZYOVZkMGp2WkxmTXlK?=
 =?utf-8?B?dzVqeUtJVHdlem51dTFZbTBOZkEyVmxjdE5MSHBma0pBTC9BM0d4N09Sd2d3?=
 =?utf-8?B?c2pacE1LR1pkM2l6VWFKTG05QkwrbkNobmdpZGwvdnhSclMwUVVNNXlFS3dH?=
 =?utf-8?Q?Txui5GwbuKZCy1zXGOQcG+ePx?=
X-OriginatorOrg: silabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8faabfea-14ec-4d41-5a5a-08de238f9f0e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8205.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 15:08:09.2587
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 54dbd822-5231-4b20-944d-6f4abcd541fb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b/uVyT2trol1AuCmCSy734D/f978lDklLPn8ZUGvCH13iyHjH3ODf0OPpU3/0rgKJjE7iRp34nZ4zMJ30A8VIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7005
X-Proofpoint-ORIG-GUID: 6jNEiEn7_1Kc-ZEVPm3ffQV9MoUCk99r
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDEyMSBTYWx0ZWRfXyrm29uKpkmyB
 2uyMoQA6pa2+cTwRmoSZvi9fWqQ2kwLuf0+jpWfwQnGY6wMql5ZkrOsRozEfdebSc2VX2PlRi0G
 iPhW0LI8OUWKhESxuZ4PJ9Ehul95gEi6HnDjV5ue5vejt8/jEkodIv/YYQDwxhxBku7ZUKdeYyF
 KJ+U4JI6DXRO0nuR/ksakZVNb7jUxz9FdUXyWty4nme65zRajnlKS5iJUJA4Axkz4C7DTbHsxG8
 Tg0cT/7uhXjitc4fcRts7COVsFQBDZuzq+lI9FFVaO62TOYfImSeL3HkkbD9wcV4zmk4xHqqMNL
 TaTSL0Pug8Ta9yDRrswsowELFhBLC66Duhe7JQcmp75vEhMA3WfqdMsmluSiBEtU8dp/PcVtkd5
 3JM62Q1DlVLDWnbm1tA2Q8I28iiffg==
X-Proofpoint-GUID: 6jNEiEn7_1Kc-ZEVPm3ffQV9MoUCk99r
X-Authority-Analysis: v=2.4 cv=LfAxKzfi c=1 sm=1 tr=0 ts=691745db cx=c_pps
 a=zUXba1i+DNHe9EVMNcbDHw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=M51BFTxLslgA:10
 a=i1IsUcr2s-wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=2AEO0YjSAAAA:8
 a=iqUPcmWXN_vvxTOgPeMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
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
X-Rspamd-Queue-Id: 3A29F3F845
X-Spamd-Bar: ----
X-Spamd-Result: default: False [-4.00 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
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
	DNSWL_BLOCKED(0.00)[148.163.149.154:from,52.101.62.143:received,2603:10b6:8:162::17:received];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	DKIM_TRACE(0.00)[silabs.com:+]
X-Rspamd-Action: no action
Message-ID-Hash: D5W7Q4TPMZT7YCTZENKCIHYJ5A6AGW62
X-Message-ID-Hash: D5W7Q4TPMZT7YCTZENKCIHYJ5A6AGW62
X-MailFrom: Damien.Riegel@silabs.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Silicon Labs Kernel Team <linux-devel@silabs.com>, =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [RFC PATCH v2 02/12] greybus: cpc: introduce CPC cport structure
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/D5W7Q4TPMZT7YCTZENKCIHYJ5A6AGW62/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

QSBudW1iZXIgb2YgQ1BDIGZlYXR1cmVzLCBsaWtlIHJldHJhbnNtaXNzaW9uIG9yIHJlbW90ZSdz
IHJlY2VpdmUNCndpbmRvdywgYXJlIGNwb3J0LWJhc2VkLiBJbiBvcmRlciB0byBwcmVwYXJlIGZv
ciB0aGVzZSBmZWF0dXJlcywNCmludHJvZHVjZSBhIENQQyBDUG9ydCBjb250ZXh0IHN0cnVjdHVy
ZS4NCg0KVGhlIENQQyBIb3N0IERldmljZSBtb2R1bGUgbm93IGltcGxlbWVudHMgY3BvcnRfYWxs
b2NhdGUgYW5kDQpjcG9ydF9yZWxlYXNlIGNhbGxiYWNrcyBpbiBvcmRlciB0byBhbGxvY2F0ZSBh
bmQgcmVsZWFzZSB0aGVzZQ0Kc3RydWN0dXJlcyB3aGVuIHJlcXVlc3RlZCBieSBHcmV5YnVzIG1v
ZHVsZS4NCg0KU2lnbmVkLW9mZi1ieTogRGFtaWVuIFJpw6lnZWwgPGRhbWllbi5yaWVnZWxAc2ls
YWJzLmNvbT4NCi0tLQ0KIGRyaXZlcnMvZ3JleWJ1cy9jcGMvTWFrZWZpbGUgfCAgIDIgKy0NCiBk
cml2ZXJzL2dyZXlidXMvY3BjL2NwYy5oICAgIHwgIDI5ICsrKysrKysrKysNCiBkcml2ZXJzL2dy
ZXlidXMvY3BjL2Nwb3J0LmMgIHwgIDM3ICsrKysrKysrKysrKw0KIGRyaXZlcnMvZ3JleWJ1cy9j
cGMvaG9zdC5jICAgfCAxMDkgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0NCiBk
cml2ZXJzL2dyZXlidXMvY3BjL2hvc3QuaCAgIHwgIDEyICsrKysNCiA1IGZpbGVzIGNoYW5nZWQs
IDE4NyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KIGNyZWF0ZSBtb2RlIDEwMDY0NCBk
cml2ZXJzL2dyZXlidXMvY3BjL2NwYy5oDQogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3Jl
eWJ1cy9jcGMvY3BvcnQuYw0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncmV5YnVzL2NwYy9NYWtl
ZmlsZSBiL2RyaXZlcnMvZ3JleWJ1cy9jcGMvTWFrZWZpbGUNCmluZGV4IDQ5MDk4MmEwZmY1Li4z
ZDUwZjhjNTQ3MyAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3JleWJ1cy9jcGMvTWFrZWZpbGUNCisr
KyBiL2RyaXZlcnMvZ3JleWJ1cy9jcGMvTWFrZWZpbGUNCkBAIC0xLDYgKzEsNiBAQA0KICMgU1BE
WC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjANCiANCi1nYi1jcGMteSA6PSBob3N0Lm8NCitn
Yi1jcGMteSA6PSBjcG9ydC5vIGhvc3Qubw0KIA0KICMgQ1BDIGNvcmUNCiBvYmotJChDT05GSUdf
R1JFWUJVU19DUEMpCSs9IGdiLWNwYy5vDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncmV5YnVzL2Nw
Yy9jcGMuaCBiL2RyaXZlcnMvZ3JleWJ1cy9jcGMvY3BjLmgNCm5ldyBmaWxlIG1vZGUgMTAwNjQ0
DQppbmRleCAwMDAwMDAwMDAwMC4uODVkMDI5NTQzMDcNCi0tLSAvZGV2L251bGwNCisrKyBiL2Ry
aXZlcnMvZ3JleWJ1cy9jcGMvY3BjLmgNCkBAIC0wLDAgKzEsMjkgQEANCisvKiBTUERYLUxpY2Vu
c2UtSWRlbnRpZmllcjogR1BMLTIuMCAqLw0KKy8qDQorICogQ29weXJpZ2h0IChjKSAyMDI1LCBT
aWxpY29uIExhYm9yYXRvcmllcywgSW5jLg0KKyAqLw0KKw0KKyNpZm5kZWYgX19DUENfSA0KKyNk
ZWZpbmUgX19DUENfSA0KKw0KKyNpbmNsdWRlIDxsaW51eC9kZXZpY2UuaD4NCisjaW5jbHVkZSA8
bGludXgvZ3JleWJ1cy5oPg0KKyNpbmNsdWRlIDxsaW51eC90eXBlcy5oPg0KKw0KKy8qKg0KKyAq
IHN0cnVjdCBjcGNfY3BvcnQgLSBDUEMgY3BvcnQNCisgKiBAaWQ6IGNwb3J0IElEDQorICogQGNw
Y19oZDogcG9pbnRlciB0byB0aGUgQ1BDIGhvc3QgZGV2aWNlIHRoaXMgY3BvcnQgYmVsb25ncyB0
bw0KKyAqLw0KK3N0cnVjdCBjcGNfY3BvcnQgew0KKwl1MTYJCQlpZDsNCisNCisJc3RydWN0IGNw
Y19ob3N0X2RldmljZQkqY3BjX2hkOw0KK307DQorDQorc3RydWN0IGNwY19jcG9ydCAqY3BjX2Nw
b3J0X2FsbG9jKHUxNiBjcG9ydF9pZCwgZ2ZwX3QgZ2ZwX21hc2spOw0KK3ZvaWQgY3BjX2Nwb3J0
X3JlbGVhc2Uoc3RydWN0IGNwY19jcG9ydCAqY3BvcnQpOw0KKw0KK2ludCBjcGNfY3BvcnRfbWVz
c2FnZV9zZW5kKHN0cnVjdCBjcGNfY3BvcnQgKmNwb3J0LCBzdHJ1Y3QgZ2JfbWVzc2FnZSAqbWVz
c2FnZSwgZ2ZwX3QgZ2ZwX21hc2spOw0KKw0KKyNlbmRpZg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3JleWJ1cy9jcGMvY3BvcnQuYyBiL2RyaXZlcnMvZ3JleWJ1cy9jcGMvY3BvcnQuYw0KbmV3IGZp
bGUgbW9kZSAxMDA2NDQNCmluZGV4IDAwMDAwMDAwMDAwLi44OGJkYjJmODE4Mg0KLS0tIC9kZXYv
bnVsbA0KKysrIGIvZHJpdmVycy9ncmV5YnVzL2NwYy9jcG9ydC5jDQpAQCAtMCwwICsxLDM3IEBA
DQorLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjANCisvKg0KKyAqIENvcHlyaWdo
dCAoYykgMjAyNSwgU2lsaWNvbiBMYWJvcmF0b3JpZXMsIEluYy4NCisgKi8NCisNCisjaW5jbHVk
ZSAiY3BjLmgiDQorI2luY2x1ZGUgImhvc3QuaCINCisNCisvKioNCisgKiBjcGNfY3BvcnRfYWxs
b2MoKSAtIEFsbG9jYXRlIGFuZCBpbml0aWFsaXplIENQQyBjcG9ydC4NCisgKiBAY3BvcnRfaWQ6
IGNwb3J0IElELg0KKyAqIEBnZnBfbWFzazogR0ZQIG1hc2sgZm9yIGFsbG9jYXRpb24uDQorICoN
CisgKiBSZXR1cm46IFBvaW50ZXIgdG8gYWxsb2NhdGVkIGFuZCBpbml0aWFsaXplZCBjcGNfY3Bv
cnQsIG9yIE5VTEwgb24gZmFpbHVyZS4NCisgKi8NCitzdHJ1Y3QgY3BjX2Nwb3J0ICpjcGNfY3Bv
cnRfYWxsb2ModTE2IGNwb3J0X2lkLCBnZnBfdCBnZnBfbWFzaykNCit7DQorCXN0cnVjdCBjcGNf
Y3BvcnQgKmNwb3J0Ow0KKw0KKwljcG9ydCA9IGt6YWxsb2Moc2l6ZW9mKCpjcG9ydCksIGdmcF9t
YXNrKTsNCisJaWYgKCFjcG9ydCkNCisJCXJldHVybiBOVUxMOw0KKw0KKwljcG9ydC0+aWQgPSBj
cG9ydF9pZDsNCisNCisJcmV0dXJuIGNwb3J0Ow0KK30NCisNCit2b2lkIGNwY19jcG9ydF9yZWxl
YXNlKHN0cnVjdCBjcGNfY3BvcnQgKmNwb3J0KQ0KK3sNCisJa2ZyZWUoY3BvcnQpOw0KK30NCisN
CitpbnQgY3BjX2Nwb3J0X21lc3NhZ2Vfc2VuZChzdHJ1Y3QgY3BjX2Nwb3J0ICpjcG9ydCwgc3Ry
dWN0IGdiX21lc3NhZ2UgKm1lc3NhZ2UsIGdmcF90IGdmcF9tYXNrKQ0KK3sNCisJcmV0dXJuIGNw
b3J0LT5jcGNfaGQtPmRyaXZlci0+bWVzc2FnZV9zZW5kKGNwb3J0LT5jcGNfaGQsIGNwb3J0LT5p
ZCwgbWVzc2FnZSwgZ2ZwX21hc2spOw0KK30NCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dyZXlidXMv
Y3BjL2hvc3QuYyBiL2RyaXZlcnMvZ3JleWJ1cy9jcGMvaG9zdC5jDQppbmRleCAxZWI2Yzg3ZTI1
Zi4uMDMzZmY3ZjAxODQgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dyZXlidXMvY3BjL2hvc3QuYw0K
KysrIGIvZHJpdmVycy9ncmV5YnVzL2NwYy9ob3N0LmMNCkBAIC03LDYgKzcsNyBAQA0KICNpbmNs
dWRlIDxsaW51eC9ncmV5YnVzLmg+DQogI2luY2x1ZGUgPGxpbnV4L21vZHVsZS5oPg0KIA0KKyNp
bmNsdWRlICJjcGMuaCINCiAjaW5jbHVkZSAiaG9zdC5oIg0KIA0KIA0KQEAgLTE1LDEyICsxNiw5
NSBAQCBzdGF0aWMgc3RydWN0IGNwY19ob3N0X2RldmljZSAqZ2JfaGRfdG9fY3BjX2hkKHN0cnVj
dCBnYl9ob3N0X2RldmljZSAqaGQpDQogCXJldHVybiAoc3RydWN0IGNwY19ob3N0X2RldmljZSAq
KSZoZC0+aGRfcHJpdjsNCiB9DQogDQorc3RhdGljIHN0cnVjdCBjcGNfY3BvcnQgKmNwY19oZF9n
ZXRfY3BvcnQoc3RydWN0IGNwY19ob3N0X2RldmljZSAqY3BjX2hkLCB1MTYgY3BvcnRfaWQpDQor
ew0KKwlzdHJ1Y3QgY3BjX2Nwb3J0ICpjcG9ydDsNCisNCisJbXV0ZXhfbG9jaygmY3BjX2hkLT5s
b2NrKTsNCisJZm9yIChpbnQgaSA9IDA7IGkgPCBBUlJBWV9TSVpFKGNwY19oZC0+Y3BvcnRzKTsg
aSsrKSB7DQorCQljcG9ydCA9IGNwY19oZC0+Y3BvcnRzW2ldOw0KKwkJaWYgKGNwb3J0ICYmIGNw
b3J0LT5pZCA9PSBjcG9ydF9pZCkNCisJCQlnb3RvIHVubG9jazsNCisJfQ0KKw0KKwljcG9ydCA9
IE5VTEw7DQorDQordW5sb2NrOg0KKwltdXRleF91bmxvY2soJmNwY19oZC0+bG9jayk7DQorDQor
CXJldHVybiBjcG9ydDsNCit9DQorDQorc3RhdGljIGludCBjcGNfaGRfbWVzc2FnZV9zZW5kKHN0
cnVjdCBjcGNfaG9zdF9kZXZpY2UgKmNwY19oZCwgdTE2IGNwb3J0X2lkLA0KKwkJCSAgICAgICBz
dHJ1Y3QgZ2JfbWVzc2FnZSAqbWVzc2FnZSwgZ2ZwX3QgZ2ZwX21hc2spDQorew0KKwlzdHJ1Y3Qg
Y3BjX2Nwb3J0ICpjcG9ydDsNCisNCisJY3BvcnQgPSBjcGNfaGRfZ2V0X2Nwb3J0KGNwY19oZCwg
Y3BvcnRfaWQpOw0KKwlpZiAoIWNwb3J0KSB7DQorCQlkZXZfZXJyKGNwY19oZF9kZXYoY3BjX2hk
KSwgIm1lc3NhZ2Vfc2VuZDogY3BvcnQgJXUgbm90IGZvdW5kXG4iLCBjcG9ydF9pZCk7DQorCQly
ZXR1cm4gLUVJTlZBTDsNCisJfQ0KKw0KKwlyZXR1cm4gY3BjX2Nwb3J0X21lc3NhZ2Vfc2VuZChj
cG9ydCwgbWVzc2FnZSwgZ2ZwX21hc2spOw0KK30NCisNCitzdGF0aWMgaW50IGNwY19oZF9jcG9y
dF9hbGxvY2F0ZShzdHJ1Y3QgY3BjX2hvc3RfZGV2aWNlICpjcGNfaGQsIGludCBjcG9ydF9pZCwg
dW5zaWduZWQgbG9uZyBmbGFncykNCit7DQorCXN0cnVjdCBjcGNfY3BvcnQgKmNwb3J0Ow0KKwlp
bnQgcmV0Ow0KKw0KKwltdXRleF9sb2NrKCZjcGNfaGQtPmxvY2spOw0KKwlmb3IgKGludCBpID0g
MDsgaSA8IEFSUkFZX1NJWkUoY3BjX2hkLT5jcG9ydHMpOyBpKyspIHsNCisJCWlmIChjcGNfaGQt
PmNwb3J0c1tpXSAhPSBOVUxMKQ0KKwkJCWNvbnRpbnVlOw0KKw0KKwkJaWYgKGNwb3J0X2lkIDwg
MCkNCisJCQljcG9ydF9pZCA9IGk7DQorDQorCQljcG9ydCA9IGNwY19jcG9ydF9hbGxvYyhjcG9y
dF9pZCwgR0ZQX0tFUk5FTCk7DQorCQlpZiAoIWNwb3J0KSB7DQorCQkJcmV0ID0gLUVOT01FTTsN
CisJCQlnb3RvIHVubG9jazsNCisJCX0NCisNCisJCWNwb3J0LT5jcGNfaGQgPSBjcGNfaGQ7DQor
DQorCQljcGNfaGQtPmNwb3J0c1tpXSA9IGNwb3J0Ow0KKwkJcmV0ID0gY3BvcnRfaWQ7DQorCQln
b3RvIHVubG9jazsNCisJfQ0KKw0KKwlyZXQgPSAtRU5PU1BDOw0KK3VubG9jazoNCisJbXV0ZXhf
dW5sb2NrKCZjcGNfaGQtPmxvY2spOw0KKw0KKwlyZXR1cm4gcmV0Ow0KK30NCisNCitzdGF0aWMg
dm9pZCBjcGNfaGRfY3BvcnRfcmVsZWFzZShzdHJ1Y3QgY3BjX2hvc3RfZGV2aWNlICpjcGNfaGQs
IHUxNiBjcG9ydF9pZCkNCit7DQorCXN0cnVjdCBjcGNfY3BvcnQgKmNwb3J0Ow0KKw0KKwltdXRl
eF9sb2NrKCZjcGNfaGQtPmxvY2spOw0KKwlmb3IgKGludCBpID0gMDsgaSA8IEFSUkFZX1NJWkUo
Y3BjX2hkLT5jcG9ydHMpOyBpKyspIHsNCisJCWNwb3J0ID0gY3BjX2hkLT5jcG9ydHNbaV07DQor
DQorCQlpZiAoY3BvcnQgJiYgY3BvcnQtPmlkID09IGNwb3J0X2lkKSB7DQorCQkJY3BjX2Nwb3J0
X3JlbGVhc2UoY3BvcnQpOw0KKwkJCWNwY19oZC0+Y3BvcnRzW2ldID0gTlVMTDsNCisJCQlicmVh
azsNCisJCX0NCisJfQ0KKwltdXRleF91bmxvY2soJmNwY19oZC0+bG9jayk7DQorfQ0KKw0KIHN0
YXRpYyBpbnQgY3BjX2diX21lc3NhZ2Vfc2VuZChzdHJ1Y3QgZ2JfaG9zdF9kZXZpY2UgKmdiX2hk
LCB1MTYgY3BvcnRfaWQsDQogCQkJICAgICAgIHN0cnVjdCBnYl9tZXNzYWdlICptZXNzYWdlLCBn
ZnBfdCBnZnBfbWFzaykNCiB7DQogCXN0cnVjdCBjcGNfaG9zdF9kZXZpY2UgKmNwY19oZCA9IGdi
X2hkX3RvX2NwY19oZChnYl9oZCk7DQogDQotCXJldHVybiBjcGNfaGQtPmRyaXZlci0+bWVzc2Fn
ZV9zZW5kKGNwY19oZCwgY3BvcnRfaWQsIG1lc3NhZ2UsIGdmcF9tYXNrKTsNCisJcmV0dXJuIGNw
Y19oZF9tZXNzYWdlX3NlbmQoY3BjX2hkLCBjcG9ydF9pZCwgbWVzc2FnZSwgZ2ZwX21hc2spOw0K
IH0NCiANCiBzdGF0aWMgdm9pZCBjcGNfZ2JfbWVzc2FnZV9jYW5jZWwoc3RydWN0IGdiX21lc3Nh
Z2UgKm1lc3NhZ2UpDQpAQCAtMjgsMTIgKzExMiwzMyBAQCBzdGF0aWMgdm9pZCBjcGNfZ2JfbWVz
c2FnZV9jYW5jZWwoc3RydWN0IGdiX21lc3NhZ2UgKm1lc3NhZ2UpDQogCS8qIE5vdCBpbXBsZW1l
bnRlZCAqLw0KIH0NCiANCitzdGF0aWMgaW50IGNwY19nYl9jcG9ydF9hbGxvY2F0ZShzdHJ1Y3Qg
Z2JfaG9zdF9kZXZpY2UgKmdiX2hkLCBpbnQgY3BvcnRfaWQsIHVuc2lnbmVkIGxvbmcgZmxhZ3Mp
DQorew0KKwlzdHJ1Y3QgY3BjX2hvc3RfZGV2aWNlICpjcGNfaGQgPSBnYl9oZF90b19jcGNfaGQo
Z2JfaGQpOw0KKw0KKwlyZXR1cm4gY3BjX2hkX2Nwb3J0X2FsbG9jYXRlKGNwY19oZCwgY3BvcnRf
aWQsIGZsYWdzKTsNCit9DQorDQorc3RhdGljIHZvaWQgY3BjX2diX2Nwb3J0X3JlbGVhc2Uoc3Ry
dWN0IGdiX2hvc3RfZGV2aWNlICpnYl9oZCwgdTE2IGNwb3J0X2lkKQ0KK3sNCisJc3RydWN0IGNw
Y19ob3N0X2RldmljZSAqY3BjX2hkID0gZ2JfaGRfdG9fY3BjX2hkKGdiX2hkKTsNCisNCisJcmV0
dXJuIGNwY19oZF9jcG9ydF9yZWxlYXNlKGNwY19oZCwgY3BvcnRfaWQpOw0KK30NCisNCiBzdGF0
aWMgc3RydWN0IGdiX2hkX2RyaXZlciBjcGNfZ2JfZHJpdmVyID0gew0KIAkuaGRfcHJpdl9zaXpl
CQk9IHNpemVvZihzdHJ1Y3QgY3BjX2hvc3RfZGV2aWNlKSwNCiAJLm1lc3NhZ2Vfc2VuZAkJPSBj
cGNfZ2JfbWVzc2FnZV9zZW5kLA0KIAkubWVzc2FnZV9jYW5jZWwJCT0gY3BjX2diX21lc3NhZ2Vf
Y2FuY2VsLA0KKwkuY3BvcnRfYWxsb2NhdGUJCT0gY3BjX2diX2Nwb3J0X2FsbG9jYXRlLA0KKwku
Y3BvcnRfcmVsZWFzZQkJPSBjcGNfZ2JfY3BvcnRfcmVsZWFzZSwNCiB9Ow0KIA0KK3N0YXRpYyB2
b2lkIGNwY19oZF9pbml0KHN0cnVjdCBjcGNfaG9zdF9kZXZpY2UgKmNwY19oZCkNCit7DQorCW11
dGV4X2luaXQoJmNwY19oZC0+bG9jayk7DQorfQ0KKw0KIHN0cnVjdCBjcGNfaG9zdF9kZXZpY2Ug
KmNwY19oZF9jcmVhdGUoc3RydWN0IGNwY19oZF9kcml2ZXIgKmRyaXZlciwgc3RydWN0IGRldmlj
ZSAqcGFyZW50KQ0KIHsNCiAJc3RydWN0IGNwY19ob3N0X2RldmljZSAqY3BjX2hkOw0KQEAgLTUy
LDYgKzE1Nyw4IEBAIHN0cnVjdCBjcGNfaG9zdF9kZXZpY2UgKmNwY19oZF9jcmVhdGUoc3RydWN0
IGNwY19oZF9kcml2ZXIgKmRyaXZlciwgc3RydWN0IGRldmljDQogCWNwY19oZC0+Z2JfaGQgPSBo
ZDsNCiAJY3BjX2hkLT5kcml2ZXIgPSBkcml2ZXI7DQogDQorCWNwY19oZF9pbml0KGNwY19oZCk7
DQorDQogCXJldHVybiBjcGNfaGQ7DQogfQ0KIEVYUE9SVF9TWU1CT0xfR1BMKGNwY19oZF9jcmVh
dGUpOw0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3JleWJ1cy9jcGMvaG9zdC5oIGIvZHJpdmVycy9n
cmV5YnVzL2NwYy9ob3N0LmgNCmluZGV4IGZlMDc4MjZiNzY1Li4xYzE2OGNkZDJiZiAxMDA2NDQN
Ci0tLSBhL2RyaXZlcnMvZ3JleWJ1cy9jcGMvaG9zdC5oDQorKysgYi9kcml2ZXJzL2dyZXlidXMv
Y3BjL2hvc3QuaA0KQEAgLTgsMTEgKzgsMTMgQEANCiANCiAjaW5jbHVkZSA8bGludXgvZGV2aWNl
Lmg+DQogI2luY2x1ZGUgPGxpbnV4L2dyZXlidXMuaD4NCisjaW5jbHVkZSA8bGludXgvbXV0ZXgu
aD4NCiAjaW5jbHVkZSA8bGludXgvdHlwZXMuaD4NCiANCiAjZGVmaW5lIEdCX0NQQ19NU0dfU0la
RV9NQVgJCQkyMDQ4DQogI2RlZmluZSBHQl9DUENfTlVNX0NQT1JUUwkJCTgNCiANCitzdHJ1Y3Qg
Y3BjX2Nwb3J0Ow0KIHN0cnVjdCBjcGNfaG9zdF9kZXZpY2U7DQogDQogc3RydWN0IGNwY19oZF9k
cml2ZXIgew0KQEAgLTI1LDEyICsyNywyMiBAQCBzdHJ1Y3QgY3BjX2hkX2RyaXZlciB7DQogICog
c3RydWN0IGNwY19ob3N0X2RldmljZSAtIENQQyBob3N0IGRldmljZS4NCiAgKiBAZ2JfaGQ6IHBv
aW50ZXIgdG8gR3JleWJ1cyBIb3N0IERldmljZSB0aGlzIGRldmljZSBiZWxvbmdzIHRvLg0KICAq
IEBkcml2ZXI6IGRyaXZlciBvcGVyYXRpb25zLg0KKyAqIEBsb2NrOiBtdXRleCB0byBzeW5jaHJv
bml6ZSBhY2Nlc3MgdG8gY3BvcnQgYXJyYXkuDQorICogQGNwb3J0czogYXJyYXkgb2YgY3BvcnQg
cG9pbnRlcnMgYWxsb2NhdGVkIGJ5IEdyZXlidXMgY29yZS4NCiAgKi8NCiBzdHJ1Y3QgY3BjX2hv
c3RfZGV2aWNlIHsNCiAJc3RydWN0IGdiX2hvc3RfZGV2aWNlCQkqZ2JfaGQ7DQogCWNvbnN0IHN0
cnVjdCBjcGNfaGRfZHJpdmVyCSpkcml2ZXI7DQorDQorCXN0cnVjdCBtdXRleAkJCWxvY2s7IC8q
IFN5bmNocm9uaXplIGFjY2VzcyB0byBjcG9ydHMgKi8NCisJc3RydWN0IGNwY19jcG9ydAkJKmNw
b3J0c1tHQl9DUENfTlVNX0NQT1JUU107DQogfTsNCiANCitzdGF0aWMgaW5saW5lIHN0cnVjdCBk
ZXZpY2UgKmNwY19oZF9kZXYoc3RydWN0IGNwY19ob3N0X2RldmljZSAqY3BjX2hkKQ0KK3sNCisJ
cmV0dXJuICZjcGNfaGQtPmdiX2hkLT5kZXY7DQorfQ0KKw0KIHN0cnVjdCBjcGNfaG9zdF9kZXZp
Y2UgKmNwY19oZF9jcmVhdGUoc3RydWN0IGNwY19oZF9kcml2ZXIgKmRyaXZlciwgc3RydWN0IGRl
dmljZSAqcGFyZW50KTsNCiBpbnQgY3BjX2hkX2FkZChzdHJ1Y3QgY3BjX2hvc3RfZGV2aWNlICpj
cGNfaGQpOw0KIHZvaWQgY3BjX2hkX3B1dChzdHJ1Y3QgY3BjX2hvc3RfZGV2aWNlICpjcGNfaGQp
Ow0KLS0gDQoyLjQ5LjANCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZ3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0IC0tIGdyZXlidXMtZGV2QGxpc3RzLmxp
bmFyby5vcmcKVG8gdW5zdWJzY3JpYmUgc2VuZCBhbiBlbWFpbCB0byBncmV5YnVzLWRldi1sZWF2
ZUBsaXN0cy5saW5hcm8ub3JnCg==
