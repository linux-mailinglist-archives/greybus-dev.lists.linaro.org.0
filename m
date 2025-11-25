Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 8197CC85CEB
	for <lists+greybus-dev@lfdr.de>; Tue, 25 Nov 2025 16:40:28 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 95BF03F7A1
	for <lists+greybus-dev@lfdr.de>; Tue, 25 Nov 2025 15:40:27 +0000 (UTC)
Received: from mx0a-0024c301.pphosted.com (mx0a-0024c301.pphosted.com [148.163.149.154])
	by lists.linaro.org (Postfix) with ESMTPS id D9CDE3F73A
	for <greybus-dev@lists.linaro.org>; Tue, 25 Nov 2025 15:26:51 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=silabs.com header.s=pps12202023 header.b=RVMNlXpj;
	dkim=pass header.d=silabs.com header.s=selector1 header.b=Wj6+fErT;
	spf=pass (lists.linaro.org: domain of Damien.Riegel@silabs.com designates 148.163.149.154 as permitted sender) smtp.mailfrom=Damien.Riegel@silabs.com;
	dmarc=pass (policy=reject) header.from=silabs.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from pps.filterd (m0101743.ppops.net [127.0.0.1])
	by mx0a-0024c301.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5APCQacN180487;
	Tue, 25 Nov 2025 09:26:42 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps12202023;
	 bh=fiRagnSuRj6s9pv61nMZrl0MECn4MoqW4RjO5fbJ2Gk=; b=RVMNlXpjENmj
	eaRvZk5BFh7woNddPnvz9ky/WKLoIeayDdJLyBuCG06KRVK8bCTUbwIqn1nXOaFY
	GJx63bNalHZrDfVbTsutbKDTd/M2PWaRZdTNWPFNrCZw267P14MNl0vra6JNHdn+
	3B5fbPG3M7Oknsf3iI7Xz/bfSOnZNHStD2xePuLRvdP7bXpK1nlIXNSyAP5zB2Qe
	i679inV9787GKjfgUIUjFI2shQbDpXNFrNqUu+1AHbx/o2E9SxTbIPbcDMMG6pQj
	domXKqKZoY/TEMmhCVdVWVT7PU8Qb/gSAeidnv0nlmHyfIsnn74MGMryDBjUkHhG
	Kb0T6ySbEQ==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11021082.outbound.protection.outlook.com [52.101.52.82])
	by mx0a-0024c301.pphosted.com (PPS) with ESMTPS id 4ancf18d8x-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 25 Nov 2025 09:26:41 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V9ssWui4bvbDIgKwKb2zQdEZE+nd0hfnJGEUJKjFicJHGnu4yTI7lGKeXbeDwh9B0auKg5jrSobCBA5kf3/UuW5XghiWdEfJR4gfc3SaT+nNErn40qwLSbSanvViLW+UBqL3EZKAumyyPiFHVzeAfVN6Ru6n/mSHGIq8itH0rh+dAXrqahrxN2IfHKWX7M6twdY3LHPJ8ROcTE/UFsnN2LHrDK7PyTqqtLFfycGnVW+qn/ENL48gjdS9iTfEXcG9FGyhVS3q0KomRzoU0CDqQjjkFFkwsTb1HtHQN9eBscPlIOPddNpn+ESmSBX08vpVTXFPD5tnuwJgAATLn9MzKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fiRagnSuRj6s9pv61nMZrl0MECn4MoqW4RjO5fbJ2Gk=;
 b=P5mpy23pueCproi0iGiUkS5JpgZYnsBynSWMc8BzLvmh1yLjdil6Gsdp41V8Y686culAEhHM9En3j52hOyXqnbaDGow+95v4rCB/oXZMbXohugJL3l5XK+/KEZ3mXQDGdp/93p4NdsbG3A60ITAk8H/YhGmS7rwTtlcfj/2kCL3+gd4ae3vlhqk3pT+L4CTT4A0JLx8QMaIhAtOhulF9i1oNiFUDuH9/QrFcuSPV+IpwkX/FBJBYEGjMrwISa0y5Ydc401xclpMhhlGySysRSVnNDI0myZPXBvKiqwy7O/v5NFwNczeH8ENWJmEqH7Y3XvER5eoGY11ugpk9FWlU/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silabs.com; dmarc=pass action=none header.from=silabs.com;
 dkim=pass header.d=silabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fiRagnSuRj6s9pv61nMZrl0MECn4MoqW4RjO5fbJ2Gk=;
 b=Wj6+fErTRnUxvwJc0uTDG/PB1cuAJRkLN6SxaryvksqM7jae1Sy3QXFri0ohdB5gANf8mjQckBIqz8kL2EnyC15SyXsbFn3qhlRTLE1yeajiLV/xu24A8jBOq/7g4VwJe8H0pG4Tsb+R1+nIzZlCYx4kzfEVoVfQjYAgnDvJj6U=
Received: from DS0PR11MB8205.namprd11.prod.outlook.com (2603:10b6:8:162::17)
 by PH7PR11MB6673.namprd11.prod.outlook.com (2603:10b6:510:1ab::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Tue, 25 Nov
 2025 15:26:38 +0000
Received: from DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::2de6:bc88:2af7:3583]) by DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::2de6:bc88:2af7:3583%3]) with mapi id 15.20.9343.016; Tue, 25 Nov 2025
 15:26:38 +0000
Date: Tue, 25 Nov 2025 10:26:36 -0500
Message-Id: <DEHVQ7YAUOG8.2TPWJBM6MTXLT@silabs.com>
To: =?utf-8?q?Damien_Ri=C3=A9gel?= <damien.riegel@silabs.com>,
        <greybus-dev@lists.linaro.org>, "Johan Hovold" <johan@kernel.org>,
        "Alex
 Elder" <elder@kernel.org>,
        "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>,
        <linux-kernel@vger.kernel.org>
From: =?utf-8?q?Damien_Ri=C3=A9gel?= <damien.riegel@silabs.com>
X-Mailer: aerc 0.20.1
References: <20251114150738.32426-1-damien.riegel@silabs.com>
In-Reply-To: <20251114150738.32426-1-damien.riegel@silabs.com>
X-ClientProxiedBy: YQBPR0101CA0003.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00::16) To DS0PR11MB8205.namprd11.prod.outlook.com
 (2603:10b6:8:162::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8205:EE_|PH7PR11MB6673:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e8d4ae6-b7e7-47ec-4be0-08de2c3706c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?RGFUVk1LK2JydGxmVzEzN1VBSkZVdGFNWHlXZWZKS3lEZkFWQU9EUVhVSlJ4?=
 =?utf-8?B?eGxhNitpZlkyUHNWS2N5RG1PaCtmcGpWeXZ6K0RGS21pbHFTWXRYTkYvSHRz?=
 =?utf-8?B?YUlEd3plQlRaNEJHcUJQS2pSQVNaNUtDOXoxVTlVQXpvOVk0U3lmSU95Y2x3?=
 =?utf-8?B?a1pLMjNWRzBMVVdSVzJhQWw1ck5MOXFVRGgyUzJyWDNuYnkzV2lMdUpvWWY2?=
 =?utf-8?B?NFIydSt6c3RveklyeitNSVR4aFMxR3ZmMENMQkZoNGk0RHVscDNka3FkZjJG?=
 =?utf-8?B?QnlBNmN0OHBzNUpKbWlPTWtKQ3ZncUdzQUFUU1prUEE1c2J0S0h4c3p0RFFo?=
 =?utf-8?B?WUNUMjl2akZQSDBjRXNsR3MrTmdYY2hTT3ZyOUt4Y2kzRmJzNjFlektzSlFO?=
 =?utf-8?B?eWNrMlUzdndHUTJEelhPK1dFZGpsWkNienFFUHV3VzdUb1M3TVVOM0k3VVZa?=
 =?utf-8?B?VncrZkdtRDdqSnR5TUNzODV1UlB2UDZnT1dlS3o1Q2EvSE9kd0thaENac1ZU?=
 =?utf-8?B?UGRpeHNrL2srZTJHRzQ3dTZLYjlHa3dNUkwrWUNLT2FUSC9WTmJYL2Joekhq?=
 =?utf-8?B?SFNyb3RlZktmc2RyQjZhVXF4ODRHbkhYRzgrdVR2MXVaY1hRMTVrWWFlRHlS?=
 =?utf-8?B?aTliVndmZTF4bnJoNTcwaVBtV2hWZ21rNXZiWTUwVXVvNTdYazY4N0hDYk1Q?=
 =?utf-8?B?QnhPM0FIdE5kcFNHb2FYWlFpR3ZCYkppRXRvOXpPL1FmS1o2SmRzV3dpVXlO?=
 =?utf-8?B?MC82WERVZmhnYThhQkRib0pBMEZwWVdCaXlyZkRReVZadytmc1ZLWFBnblR2?=
 =?utf-8?B?UUEvMVI3SXh6UzcvM2IxaitTbkVqVnY5K2wwaTUweExwMVgyay9PeGVVSkZ4?=
 =?utf-8?B?ZmFXNEFJSXp4V1hLQU4vNEJsaXc1SVdMSVZTQzRCVWsrQ0FjTGIrME9kb0xW?=
 =?utf-8?B?WnZocFAraDJlS3hGb2k2aTBZVzVBN09LcHBIRlZ3TFFTWEhaMFRCVE54V2hJ?=
 =?utf-8?B?bWdkTEJBSTZudlZFT3ZQZEJXV2wxa280R1o4RFE1Z0F0c1RBSXpuTHRtMnMz?=
 =?utf-8?B?Z2lUaVZ1NnVyQVFFRGV5ZFdJVHgwWURMNWZaazAvclZHNGdxTUdrUGlnUFBj?=
 =?utf-8?B?Rk1nMkpjUUM4Qzcyek53c1Bpa3JJaWFiU3Nqa3haWENIUzN4MWM5Lzd4NnEv?=
 =?utf-8?B?OXhiaWk1RlpiZmFPeEFtd0pCUVpmcW1rQlg5eFNlNWYwSVVjMnpndjN4YXJJ?=
 =?utf-8?B?dUNtYVltY0lSUmFuM25lVUx3WWdxblJFZUdrWGhjQ0lvQVRtYXJRNlRSTzNn?=
 =?utf-8?B?L1pBSDVBVXhYU1ZRSlFhMHM2emtyaXRvNHB0SVBPQk03UWJxbVM5R3VjODZC?=
 =?utf-8?B?RnZXdHRkNzM3MTVuTU9GMnpwd0E1c0YvSzI3NWNMZEVKMUp6SFYxazZ2b0xE?=
 =?utf-8?B?Wll6dW5XK3Y1Q1NqbWM4U2dRNEFqaTFrbWRLUUdOT2owczlrVUFyZEtNNHRa?=
 =?utf-8?B?ZDlDSlhLZk9UNjlrM0dLTWVFdzBtbDFNREJzemd6ZmR3eHVjbEVMZlV2bHI5?=
 =?utf-8?B?N2xNU1pmQkxhWW5obHlYS0NkVGpKMHRYQW04QXNQb2tFMktpcUtieVNkWkxJ?=
 =?utf-8?B?VEJwUVl5TjlXcW5kQnMvTHZqOGhFV0lQQnZrRDAyMjFHcHBJSFBlSkVFb3Rr?=
 =?utf-8?B?WlZMVWd1bE9wZjV1ZEI3ZStvRGtyVUdJL2I2S0ViT25HNFcxTHB3amd1TkFl?=
 =?utf-8?B?Zk5WY1pmMTVqNmZiWldtZnlIZW04YUtTZFN0V2Y2cFNET2tHQzE1TkhGZEV0?=
 =?utf-8?B?UVd4dDdMT0ZQWmJvdVoyK3lJUUhGVm44NzZDblIwT29yL2Y5Ykh0Wk5veGR1?=
 =?utf-8?B?cG9kNHI5WjJiTVBnNTh1OCtkcTN5ZFNwR3pDczJqd2kvVFdXVEgrSndNdjhS?=
 =?utf-8?Q?x2q88+9FQ1PyTKdta2DcDaqVUhTcgSZn?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8205.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RlhVY09nKzdNYWZHT2lXajVDb0FueS9lS1NUREpxUnNKMXBnM29FYlY5Uks5?=
 =?utf-8?B?OXJZQmFadFQyMFlIbWZ1Syt2Skc4b3AzdGMzSkNLSEdHMkdxcURPdHBnVjN2?=
 =?utf-8?B?MGl4ZmFVNkJlMTFkaXVlZnRheWovOEZJbDdFMWRMaEdnZnVSSm0zUTZtWWJz?=
 =?utf-8?B?UUdUS29EbXlXbEJ3dFUvalZZL0xvK1FTU0czOEtLTitWaEwxbVh5Q3ZPSDNW?=
 =?utf-8?B?aS85VUJLYWplVi8xcUhCemEyTWhhYmlFT2o5N3MyeGxOTWlSUjd1bXVMcWxi?=
 =?utf-8?B?dGVNaXFURy9JMStYckFBb3dXZ1ZESm41Vm5xSDU1T2wvVEtER1NpbzRLR0FQ?=
 =?utf-8?B?Nk94SHhzNVloQjgvUmUwNFVneHduMHBzYnBiRHpxSEZxS1FMNFY4TmVBd3pz?=
 =?utf-8?B?bjdUZ0hJdXdRM0N0VTQ0N0c5cVcxUkt6ck9ZNjlSUUFrb1BNRXU4eXJhTnBK?=
 =?utf-8?B?OHJwK01UVU9XemluZnRtV0NndUN2Z01lT1Y2WlVOUzgxVWV6aTl2djdMaWI2?=
 =?utf-8?B?Z2tYK3pKMXU2WG9TV21kckgwaWFXQSsyY3hGK3BSaFFEOTJPekFEMytDWVIz?=
 =?utf-8?B?eXgzSHNnZk5ReDFrN1R0bnBFM0RMb1RROVVPaCtiL3BpK2JsMGI1QjhzY0Yw?=
 =?utf-8?B?Zkl0L0VmTkxoMnVKbDNDUjIyNFFVSEVqOERkOVVsNHgrZmtQZ25nbkliSzBC?=
 =?utf-8?B?cTM0VDRSNzZvYTR2bSszNGdBOUJGRWZ4aGE0T3J6M2FLd0xiKzYzR2llVFlO?=
 =?utf-8?B?T0pJN2hiZGhjSDhZNXlxRnhJVnRsQXNGMXk0TDRqK2NHZlFWNjZPeGQvUTNq?=
 =?utf-8?B?K0Q1UVVPYUxnVDd6Ym1DckZhVE5vVTdseWUxVnpmMzFwc0R3dVl6aEt6NGVa?=
 =?utf-8?B?dEJ4VVN1aksvU1ZIbG44a3A4MFhadGV3dGZDd0tsUXNPbUJTbFhucFZObmsv?=
 =?utf-8?B?ZTJSNDFmdllYbDBEMVVMd0Q1NzBKV01OdW1VOVk2WTBQU2dBSzJIbWpsV3Iy?=
 =?utf-8?B?MXAya3IwbWRwZXcwSFpETlN1MjlQZkNJUFVaazFjRTQwVjJyVzFFK2hMRVc3?=
 =?utf-8?B?OHV3S3IvbEo5Q2FoTnBSS0ZkcDBlemlJUndiN1V5bXk2NkVpdTZDMUw2V3RE?=
 =?utf-8?B?WmdIei9wSko1NU1Pd25tRFJsNUdicDlZaFJwSEJ3eUV5ODhkMzJWY2wwZ1R0?=
 =?utf-8?B?bi9MK21MNURFdmhTV3k0TWFQUnJWUm1mY1YwdTBlRXU3d1QwUU10MkQrRzUy?=
 =?utf-8?B?YzRuOGM3SHA3YTRsd3RyL1B4aFBvb0o2TEZTdjcwZm9Vd0pWczdVK0EvS3NF?=
 =?utf-8?B?TFZETDJlMmRPbGVmckJ4cnN6Qno4RFlKTDNtNXY1TmM5MjlVNHpkbFR5SGd5?=
 =?utf-8?B?UCtNSkZCZnlsYmcvUENxalNhZnIrMkZHenNNTDc3Zzc2Y2ZtSVROVkp3dnZs?=
 =?utf-8?B?eCtkdmorcFlhWW91TTNJODVtNFlFZFlwL2Z6YW1HaEZxOWZWaitGSjdydXp1?=
 =?utf-8?B?SjQybXorWDJsVUhZREErUzI3akg5cjlyTU8xWGtWeEprK0NmSURjL0JmSm5w?=
 =?utf-8?B?VVZGQXBSTXVYaEVxRkpmWEJyVHV3NFJvU3NKWFAyeFRNaEU3OEJLdHRvQkV2?=
 =?utf-8?B?NUFhUS83UE1GV2hzMUQ1NGlFNTNCdVgwcVZaQS9oaXo4cDc5MTdDb3dTMGVD?=
 =?utf-8?B?aFRhRGhtbFFyWFE0SzVpZnE4R1kwOXIwak5VSExLUUdSNjlPOC95WGJXYXZl?=
 =?utf-8?B?N2o2Rzg1a1RIRHZ0WVZOU1lGMHhRcThMR2VlUS85VW9KbTBjRGNoSkRTeVlM?=
 =?utf-8?B?QWFWb05KNWlUaE43dHBycStISHFRM3NXOFdhYnBwakZ3L1h3Y3paYW9acXVL?=
 =?utf-8?B?SDV6OVEwdkZQQm5ya01pYUtrUzZSN1hwT3RyZE12NFJITURHRVdaaUFxR1FM?=
 =?utf-8?B?b2JLZS9jbTAycXVBLzU2QVd3T3Z2MXVpYlhIVTRJV290d0NIbjR4WkducVRq?=
 =?utf-8?B?VldCcUJuQUZXU2xJL0VzMlJ0TWVLZThEc1U3akF1SXRBNUxBdDk5RHIwYlcw?=
 =?utf-8?B?TjdHcm5JZTYwU2hvajVQOWNkeWwvUVlGS1VkR2dFdFVhQ1kvUXIxNndXSjQ5?=
 =?utf-8?Q?AXdV66hT6J24vBXer+UvaUqcJ?=
X-OriginatorOrg: silabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e8d4ae6-b7e7-47ec-4be0-08de2c3706c7
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8205.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2025 15:26:38.4153
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 54dbd822-5231-4b20-944d-6f4abcd541fb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T4CTO1RCqkkAT5PtESDro3+9lbzbyUJ+gp7JjyU1fmNdVhXRB9VNeNsqydIGP+xuuXNDgk2XEY5m0GQBiHYZcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6673
X-Proofpoint-GUID: mqyuquhFqK4an-YXD5bQw8iyKVi0HIQp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDEyOCBTYWx0ZWRfX3tIT/TDFkuL3
 0LxaTeMdjJmzLFdE04P/K272MjmbcCI1+NpGVP5dcnIbCgN7tX74vJBnxCRyu8T1Ot2Ay7L4n+K
 Dwn9dFusvQlUt3Vke+dDkXokGbJYBnX61UbwAFbZaw1dyvSFo8s33L1OaPm8Wy2RqMHkduAH2c6
 zrviUEqowrZSZeppYJ5JnIsSICOFQ2slMqDvmrzgXJbr0FUjNzD3qd/l8SLvgqzY36kdva+WUYq
 sXv/6eUWHt7iqd2LYX3fWoG5HNeMyZ6WtkFNzdX2exUga6IYvjzLnp/sVuQa9+yFQHtmwXeHwB/
 JseNF7HxnSYbj0SEM11TJ+03HS3IMGdxefNiEmoWlcAeTeodvWSYG5kHjFjyR/tZjI2AVxmGCeE
 MABPBqmqc3fB3Po0o6/YceTDpArChw==
X-Authority-Analysis: v=2.4 cv=WfQBqkhX c=1 sm=1 tr=0 ts=6925cab1 cx=c_pps
 a=+c9WoxDyotZMqfRYVVLQHg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=M51BFTxLslgA:10
 a=i1IsUcr2s-wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=icODjTcNI1fdPw75iZ4A:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: mqyuquhFqK4an-YXD5bQw8iyKVi0HIQp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 suspectscore=0 spamscore=0 clxscore=1015
 malwarescore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511250128
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.80 / 15.00];
	BAYES_HAM(-2.80)[99.13%];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[silabs.com,reject];
	R_DKIM_ALLOW(-0.20)[silabs.com:s=pps12202023,silabs.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:148.163.149.154];
	MIME_GOOD(-0.10)[text/plain];
	ASN(0.00)[asn:26211, ipnet:148.163.148.0/22, country:US];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	DKIM_TRACE(0.00)[silabs.com:+]
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: D9CDE3F73A
X-Spamd-Bar: ----
X-MailFrom: Damien.Riegel@silabs.com
X-Mailman-Rule-Hits: implicit-dest
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
Message-ID-Hash: W7AXU2J6SJSNU2XIYOJQM54Y4QPFAO5W
X-Message-ID-Hash: W7AXU2J6SJSNU2XIYOJQM54Y4QPFAO5W
X-Mailman-Approved-At: Tue, 25 Nov 2025 15:40:21 +0000
CC: Silicon Labs Kernel Team <linux-devel@silabs.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [RFC PATCH v2 00/12] greybus: introduce CPC as transport layer
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/W7AXU2J6SJSNU2XIYOJQM54Y4QPFAO5W/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgR3JlZywgSm9oYW4sIGFuZCBBbGV4LA0KDQpPbiBGcmkgTm92IDE0LCAyMDI1IGF0IDEwOjA3
IEFNIEVTVCwgRGFtaWVuIFJpw6lnZWwgd3JvdGU6DQo+IEhpLA0KPg0KPiBUaGlzIHBhdGNoc2V0
IGJyaW5ncyBzdXBwb3J0IGZvciBTaWxpY29uIExhYnMnIENQQyAoQ28tUHJvY2Vzc29yDQo+IENv
bW11bmljYXRpb24pIHByb3RvY29sIGFzIHRyYW5zcG9ydCBsYXllciBmb3IgR3JleWJ1cy4gVGhp
cyBpcw0KPiBpbnRyb2R1Y2VkIGFzIGEgbW9kdWxlIHRoYXQgc2l0cyBiZXR3ZWVuIEdyZXlidXMg
YW5kIENQQyBIb3N0IERldmljZQ0KPiBEcml2ZXIgaW1wbGVtZW50YXRpb25zLCBsaWtlIFNESU8g
b3IgU1BJLCB3aGljaCBhcmUgbm90IHBhcnQgb2YgdGhpcw0KPiBSRkMuIElmIHRoZXJlJ3Mgbm8g
cHVzaCBiYWNrIHdpdGggdGhpcyBSRkMsIHRoZSBmaW5hbCBwYXRjaHNldCByZWFkeSBmb3INCj4g
dXBzdHJlYW0gd2lsbCBpbmNsdWRlIHRoZSBTRElPIGRyaXZlci4NCg0KR2VudGxlIHBva2UgYWJv
dXQgdGhpcyBSRkMsIEkgd291bGQgcmVhbGx5IGFwcHJlY2lhdGUgYW55IGtpbmQgb2YNCmZlZWRi
YWNrIG9uIGl0Lg0KDQpJZiBpdCdzIHRvbyBiaWcgSSBjYW4gdHJ5IHRvIG1ha2UgaXQgc21hbGxl
ciB0byBtYWtlIHRoZSByZXZpZXcgZWFzaWVyLg0KQXMgd2UncmUgY29tbWl0dGluZyB0byBHcmV5
YnVzIHRvIGVuYWJsZSB0aGUgY29leGlzdGVuY2Ugb2YgZGlmZmVyZW50DQpyYWRpbyBzdGFja3Mg
aW4gb25lIGNoaXAsIHdlIHdhbnQgdG8gbWFrZSBzdXJlIHdlJ3JlIGhlYWRpbmcgaW4gdGhlDQpy
aWdodCBkaXJlY3Rpb24gYW5kIHRoYXQgb3VyIHdvcmsgaGFzIGEgY2hhbmNlIHRvIGdldCB1cHN0
cmVhbWVkLg0KDQoNClRoYW5rIHlvdSENCi0tIA0KRGFtaWVuDQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpncmV5YnVzLWRldiBtYWlsaW5nIGxpc3QgLS0g
Z3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpUbyB1bnN1YnNjcmliZSBzZW5kIGFuIGVtYWls
IHRvIGdyZXlidXMtZGV2LWxlYXZlQGxpc3RzLmxpbmFyby5vcmcK
