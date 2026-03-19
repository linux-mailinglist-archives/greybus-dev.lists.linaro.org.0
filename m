Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id VWvkGWUkvGkxtgIAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Thu, 19 Mar 2026 17:29:25 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id CD5B42CED16
	for <lists+greybus-dev@lfdr.de>; Thu, 19 Mar 2026 17:29:24 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id B57D23F8EF
	for <lists+greybus-dev@lfdr.de>; Thu, 19 Mar 2026 16:21:23 +0000 (UTC)
Received: from mx0b-0024c301.pphosted.com (mx0b-0024c301.pphosted.com [148.163.153.153])
	by lists.linaro.org (Postfix) with ESMTPS id 808C5401C7
	for <greybus-dev@lists.linaro.org>; Thu, 19 Mar 2026 16:21:17 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=silabs.com header.s=pps12202023 header.b=my4WexA7;
	dkim=pass header.d=silabs.com header.s=selector1 header.b=gLgwAPkg;
	arc=reject ("signature check failed: fail, {[1] = sig:microsoft.com:reject}");
	spf=pass (lists.linaro.org: domain of "prvs=1538e8639b=damien.riegel@silabs.com" designates 148.163.153.153 as permitted sender) smtp.mailfrom="prvs=1538e8639b=damien.riegel@silabs.com";
	dmarc=pass (policy=reject) header.from=silabs.com
Received: from pps.filterd (m0101742.ppops.net [127.0.0.1])
	by mx0a-0024c301.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62JFeSZq1622438;
	Thu, 19 Mar 2026 11:21:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps12202023;
	 bh=8tiUM3wGxcJHIdQiKc75+EXeMkxaDhYzRribTvfg90Q=; b=my4WexA7e5/g
	4lOd/obdxJ1onn/vcOkdRaaN86eu/e0T+cYKhbonV2D4W54APh0rba6EKCIkhYnG
	FyACaBx8zdbu8lre2Jhp+UF0lArzKaufAPh3HJFUNejd7E2Zf66uupDSjcoFBy5s
	F/i9NmXCzw0kFXt1JVoapSetDPcmvLbAojeyG93iYpGR9P+k1YOA9xDPS1JvxbhK
	m5Niza32Mo/S9/UNi/7bL6BaOhyzVFKPFeP3S6nLN1/4sK19fp1m9YrkegQg6UIk
	lASqIydaDzeul0a3U2DU1psoSN1ZmuqJMumfwOyCn4TNrPsTY7LRmGLZozlgQBJM
	3Id5/TvD0g==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11021132.outbound.protection.outlook.com [40.107.208.132])
	by mx0a-0024c301.pphosted.com (PPS) with ESMTPS id 4cw166uhpj-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 19 Mar 2026 11:21:07 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Umszi0BgKSF4uE89WSnFASZNUmVQi/7dXX5ah0azInv+6mBG+LIA47+c87oeA4EnfYhYEazjPkKRpVRTYSwDQvcMQbgqWtPYaMO8lGjs1MbVxR74+FzlBukcY0mZmhKLQ5WVcQ7F3tGAAOsMRk4GQ9Z/WefKzIhCz5YdHD6v3pE+IpqalA9Q8c7iBx+xm2Ihydq65MqKEkv2HCGbgJfQbz9aFSWwjm/Y7tzX0d+yFhTXp2IJX3qHSnK/g2kMOhjE9NlEaLbzsvBryoHsGztVhB1lJUpYnUsdHGmpb3/zc8vhUbfIG4PGj/WbdoG9wr+D1aKvvchNdKQBj1f0RrureA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8tiUM3wGxcJHIdQiKc75+EXeMkxaDhYzRribTvfg90Q=;
 b=kJ3meCxH8Ta6dIDdRt9TKFc/zgpdT8ZLDRnZGHarAHJb3ldbILYjZBdNUAhy4EuBSR4O8uVsKLKafnQCFH7FkUaadEnXwAT4bAkvA5cHWWcs/gUzSI/PzcIksOdIXW01YUr0z3Z6LyThPT5cc/prIpwHcsOrz879/d0kfLK2COa3CdrTCNQsFR8QnLOlhB+2cN0m7ckHVgdS/SDG27xHNUyGcLGqPDceC0ndFKgUqTAl3b+YCjyNglHYJDmDKkn9CYnz8v2lngLEUTWVU8PiWLs4asZxWY+0eT3zn8jR4r10x0KjW17j9T0V9vJ3CWlWfuylYERYMKdO/EUqzh9F/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silabs.com; dmarc=pass action=none header.from=silabs.com;
 dkim=pass header.d=silabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8tiUM3wGxcJHIdQiKc75+EXeMkxaDhYzRribTvfg90Q=;
 b=gLgwAPkgPeE7YkW4WjteNy4l1aI77mtFZS11YVOkMQ7ERsyiW4ncWHmPWVgPlgb1tSF1B9tCQFWYsmv6+7yhWkTDNfWLFfOMpO3OQuDAUUgLa1p66/jFUutjxWLLG3sNjmD3SnkLKfCv1cI1k3fcedT90jztfYzpPXN9sUgELh4=
Received: from DS0PR11MB8205.namprd11.prod.outlook.com (2603:10b6:8:162::17)
 by SA0PR11MB4671.namprd11.prod.outlook.com (2603:10b6:806:9f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.9; Thu, 19 Mar
 2026 16:21:05 +0000
Received: from DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::2de6:bc88:2af7:3583]) by DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::2de6:bc88:2af7:3583%3]) with mapi id 15.20.9745.007; Thu, 19 Mar 2026
 16:21:05 +0000
From: =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
To: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>,
        Alex Elder <elder@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dan Carpenter <dan.carpenter@linaro.org>
Date: Thu, 19 Mar 2026 12:20:49 -0400
Message-ID: <20260319162049.42269-2-damien.riegel@silabs.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260319162049.42269-1-damien.riegel@silabs.com>
References: <20260319162049.42269-1-damien.riegel@silabs.com>
X-ClientProxiedBy: YQZPR01CA0140.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:87::18) To DS0PR11MB8205.namprd11.prod.outlook.com
 (2603:10b6:8:162::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8205:EE_|SA0PR11MB4671:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ab1a76c-84eb-426a-f788-08de85d3857c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|56012099003|18002099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	IB69nPjNrV5fX9CyhGG14dX2y5DZ10znkrKjj+tLZaVtGiKoa+b4g0iGFabvtjxpWevn7velpTECWy2rFWVhpjcEQq5Czr8vjiy5MhiNVUx9OXLslKIKLnhZ0CDrd8JqDyC4tC7p6DXpYS6rWJCVGf1Fozt33GgCI0mx7bfSF3dMVaP4cDOAg1aEXpdRPM7qKZFI0+UxmjF50SyOIg/uzmff1c2kfyWT2WfM0J0j3ZFLN4AtmWR+47YIRuSLhivGXQVoItCz0BvoFRWMga3eMXmyO3STZQTrYeZ4l/8ZXrTpJZs1+x5LH5svGFghgFsbEKad4+qtTIjordu5SJAYG92bXg/TmaptaM8LmGZ9/kliK/lSRxWttvTMPzbN59qdcIubmq4H0X5mJ5iN98OtrFO3ztrIHAnQ2dWb2/uWuH9IGRVK2cYyOGCMLcIWVeaMIoZA+6bKO3ackuKFuVdxF8J5lxsEoPieANHJCDFc8SS1p7ac9KdQ95tO/lK2aYXJ/6G4dVVU7g5rvhj65z9rn1GFwQ8ScL7eBEfaPzE21YJzznnY0PEtYFU+l6fXcoKouOkZHz7QbZjLly87Pf1Xe7Y97ZIZD0LOz7Cw+Kuqo/IfRavNiOL8wRfElMRU6OCfc8TZlJ4NMZHe7RiBfx/xnO0LWi3Akjsn09DMfK5WW+W1fg9Gns1pP3ELGPyU8Pm0ZJjXPBMiyyJgks1F8qaEeFtBXHR8oJPAI4UXtDO1AJNBo1cAPswSROzCo5bCf3F5Qj1J0M1sRy9s09irQDznk4Hlboc3/7xq37nIPQ/XKCA=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8205.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(56012099003)(18002099003)(22082099003)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TnRGdXdHM1V5R0FneUlvZVVEMlV6VktiaU9ITGxPMkpwMGJhWnQvempZUDRs?=
 =?utf-8?B?NU1OTE9ySHQ5YzZOWjZlQndvUjEybTFReDFKOXV3OVRzbzVVcUsyNDJQTm5j?=
 =?utf-8?B?eHZqOXA4eUdRZC9FOTA0ancwK0dZSERmOE0xdnFFdzk5dEVOTU1IaHp4djRa?=
 =?utf-8?B?NmpFTnFVZjdYZDNTUlJ6cXJtODNDRzIrMzB1WDNSZ21Sd2x5S0ZSckltLzVa?=
 =?utf-8?B?cHEva2ZwWEt0OWVxN3ZPcGk2MGhxUzdmRHV3Zy9pNEtNSmFiTHhhM0xKRE1R?=
 =?utf-8?B?d1c2cEZwSzVWbDVwQTNjTjYvTnFvVWlaeE1hWlhzWDU3aEVId2t3RjYrU2Fq?=
 =?utf-8?B?aHgvVWdPV0xPM2xhamdWendSQ1JMTmFPZy9OMFNINzdIZnZTbUhUOWxMRVZW?=
 =?utf-8?B?Qys3SzlSa3MwanBNSENwZ2dGU0J6ME16QkUzRFNwanhRdlRuR0o4Zi9lbFRT?=
 =?utf-8?B?OHI3UlZFNVU3a0o2cGpDZWJBSm1EZkVyRzdMSHlZRkVGeW01dWREVFI2am5Q?=
 =?utf-8?B?U1E0aHE0ZzRON0taYmpQZFE4RGk3ajRISjh4R1pkQ1dLRGhrQ3BzR2JHOWxw?=
 =?utf-8?B?UHVTaDVGYUZQZ2NudWhGanFCbEhOTStqY2JiM3dVaHEzV3hjMnJDR01XMm8x?=
 =?utf-8?B?bDBSU3JnUFp1dy9KbTR2U0xqV21kOWVhNGdVTndTaXMwVXl3TWc0WitZSWRm?=
 =?utf-8?B?RkwrbXlEc0VsOHpQSU56MERhSmN0V0FZa1BpOW1XbmZFSDFWbEluN2RiUDNk?=
 =?utf-8?B?b2ZCd25OS3UrMG5LM2REK2VSUldxM25OTTZSaVhNUkYxRzBwSm1yNGxoNXV4?=
 =?utf-8?B?VW5WT3EwdU9zaHVpOGJYWTdnVitXdkYyenEreVZiMW8vUzJiRnMrdE5NN045?=
 =?utf-8?B?Skphckg0ak9ENmppUE9iZW5CTit2ek9pV2hMS3QyRUptNkQvWGR0OHdvVEdK?=
 =?utf-8?B?eE1oTmJMQ1R3ZDhnYTI3dURSZGsrM29IYmNEbjZkVHRJWVJjVllMSzJ5N1Vx?=
 =?utf-8?B?N2NsTTF5R2VJTHhicG8yeUhGcGcxbjZrYm50WTlVL21oMjhvSWR5N1pPOUEx?=
 =?utf-8?B?VW1IR2sxYk9rcVZvVnB5bUFHK2lPZFZMMDJIYUsxNVVaNGhoVHdRYkkvcFpy?=
 =?utf-8?B?TkVlQUR4eDZ4TFlxWjRRTFJTMS9LZlBsZXhoeDlDblErcGhENlcrdG03alJn?=
 =?utf-8?B?KzZrTDFZMVRTRC9OYm9vM3A4Z01TblZsZm9ZSEhHN3JGM0RhTW5QY0pGTWVP?=
 =?utf-8?B?dzJ5Snpta3FGcmV1UzNmUDJBanFSYUd0amlEa2t1VnYxdzZjL25GaC9BYmQx?=
 =?utf-8?B?aFVrcktURktrN3FhTjBPUUw0MEljR2dZalNjLzgzWlZ1VzhheGVIN3dyV3Qx?=
 =?utf-8?B?aUJqWWh6TUJXNzhJMndCV1UraTRzN1dHdjZQQzV4WFZjR3ozVU9paHNNWVdl?=
 =?utf-8?B?dlMwNWVUdFozbTJLRHZZZWVRM1VESWRDeDFDU2ZyUkN6RXRoZlI4bkQrS1JW?=
 =?utf-8?B?R29GZ3FVNDkyL01DMUQvVGdxSDZVeEtlcVF5SEZyV21pOEpHNC8xTy8wSU8w?=
 =?utf-8?B?V2pab1krdEpHdDczeWhKMXFRMFFsTnlGSThhbHdnaVVxVlM3T21YcXlLVWtJ?=
 =?utf-8?B?RTRXeWtPb2FSdXFsMzh2N1BuN3Z4NGdDaTZUd1R5VGxBTDhhb3lNVnQxWXJK?=
 =?utf-8?B?VkZVZU1jbnFrNS9UQ3c0ZlptK2tWcXNnUWJQVXhmdjZaNDM1Z0FVQ2pUZVVR?=
 =?utf-8?B?RnJvRHlHVUhhankrQXhnVFdCbWFlN3BOdEJpbXlMRzJDVjRrMnA5WFFMM2ha?=
 =?utf-8?B?YjNHQjU4OGtaWGFFcW9ueFpCZW9lQ2traXR1aE5pclUybms1OVpWS1lwZXpl?=
 =?utf-8?B?QUxJM1hzRlVoNVROUWFKVi9HaURqTlpMWndUQ1RXSHFEVTFQUTF3bmpsOUJN?=
 =?utf-8?B?WXVNci9vWW12S1Evc1ZBVzNmeUw5bno1NjY5LzA2L1hQRDhyVTR6M0ZUU1Y3?=
 =?utf-8?B?NkVnZUpZRGNvbGR6WVFpM1RVeTRBWFlMNmw5bzBmYmJpL1FPb0RzejY4dCt5?=
 =?utf-8?B?aytWdXBoeHZRRmd6UVpnVC8yM1RiRFZIUkJNbStDWmxOS281amswTmdtdHZw?=
 =?utf-8?B?UHdpRUc3S2RpeDlaRnVxaS9OS2J6NGFUK3h5TTNaTW01UXNLWEhlZlNmeEV5?=
 =?utf-8?B?OFZ5bWVvTU9IMnY4L3Myc045Y3hmUmZUVEl6WDB0OFZEaWlGMjM3WjV4cmpP?=
 =?utf-8?B?OW5yY1Vjd21yLzdIU1pnTElLUlVJTlg2UFVGeWxILzhUNTZwTUZRSysrQmpT?=
 =?utf-8?B?anFLRDlaaGxxSnJKbldlZ1B5RlV5bElnakU4VXRjeW9hajJkeHdWdz09?=
X-Exchange-RoutingPolicyChecked: 
	CXc7Sc1QWK9il9PiIxkR0elXIyLbtAumgDDFCz1sGREUGIgRwuBm9w0Pz+qppaf6i/sfapNFDFn9bCbMM2pOC+wu/Z8sAoQtS1TNWvZRqoLzexMiiLf7FEDkyaNAsJGU8BwLeCoiWGz4PHLNxLg7NGDVGqgpD8SbLVVSjtP2/KeQ3ML6rca2c0HMWNW6HV2vojRo4zi6Zf9rJ8WnHTWryQ6gZKH8fJ5eDFZv3tMsSXdSgobsxUFOBzcKTuMcX7FLkLiF+RnTU/VaIdQm6UWYYm5dqat29as7FCYQedhEtb7h+62rNILT6QCrxd5r5joOprrQv1Df1of4elWveZLMlg==
X-OriginatorOrg: silabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ab1a76c-84eb-426a-f788-08de85d3857c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8205.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 16:21:05.8922
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 54dbd822-5231-4b20-944d-6f4abcd541fb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4mrByUYOWXs+BXO2RDRZiLPvTh3HuRrtfybeNgAAgLzLIiM9erguQ9KFdu4oBNIM4M9V7m7RWy3z+WoHhX3zpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4671
X-Authority-Analysis: v=2.4 cv=apK/yCZV c=1 sm=1 tr=0 ts=69bc2273 cx=c_pps
 a=Gq0v4fqhBDE/9EfA5tRQ9A==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=M51BFTxLslgA:10
 a=i1IsUcr2s-wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=gIHJBl62Mt9vjvfn7G3b:22
 a=buQUfWhnF1OtDDk5FV7I:22 a=2AEO0YjSAAAA:8 a=It-tUInn0qGn2yKBwLMA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDEzMCBTYWx0ZWRfX0fGPMitoyP98
 hYw/IKhwUZa63H4n4/+FLxFUP+6n8sunE/oUNXYdkqNnjd3QJuSM/9gj3YJLdoW/sdXz04bkKIk
 8jM4GTssyiW0lmUNBq7vlelGQNOpGRZukvUmofgbQJqnM4RnA6bRQl1w73uZ2y+7gLuSq/ilkdN
 D9Bg17FBGm9gi/ls7LQOSHrBrwaeIHQAX2MiMe72Bv6LDUQ3ooq8rOR+cnslYsjWXQD0TGp3ORU
 j8WhALTwWnWcXAzCMTOt9EZgxYeArcC+zY/nRSPIndZTddKJOmLbzuhuCGBw0LV5ZICy+8c1PE6
 M+81f+za/Lqx4ED3Al4dOzWPkhtiyopD62oud+Ln9a6E/0orpzSC+oYrB4f3RfBgGTRi1FzdlBb
 c0Syk7O6teQWWg/95KzuU+RRg5+/UihAhITNt42iyRHarhbnhQSvGm4E0f+9/L/gIyakwcJwNJa
 5JUQ4cGPn3qkPnP5CZg==
X-Proofpoint-GUID: 1Dtt_X3Es2DMNQTsnRm5LAzbC3pMKUpq
X-Proofpoint-ORIG-GUID: 1Dtt_X3Es2DMNQTsnRm5LAzbC3pMKUpq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_02,2026-03-19_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603190130
X-Spamd-Bar: -
Message-ID-Hash: KK73GXM56WKVVAF5AGMSNQQ2U2FT2FSB
X-Message-ID-Hash: KK73GXM56WKVVAF5AGMSNQQ2U2FT2FSB
X-MailFrom: prvs=1538e8639b=damien.riegel@silabs.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v2 2/2] greybus: raw: fix use-after-free if write is called after disconnect
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/KK73GXM56WKVVAF5AGMSNQQ2U2FT2FSB/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Spamd-Result: default: False [4.59 / 15.00];
	DMARC_POLICY_REJECT(2.00)[silabs.com : SPF not aligned (relaxed),reject];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	R_DKIM_REJECT(1.00)[silabs.com:s=pps12202023,silabs.com:s=selector1];
	MID_CONTAINS_FROM(1.00)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[damien.riegel@silabs.com,greybus-dev-bounces@lists.linaro.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[silabs.com:-];
	NEURAL_HAM(-0.00)[-0.647];
	TAGGED_RCPT(0.00)[greybus-dev];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email]
X-Rspamd-Queue-Id: CD5B42CED16
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SWYgYSB1c2VyIHdyaXRlcyB0byB0aGUgY2hhcmRldiBhZnRlciBkaXNjb25uZWN0IGhhcyBiZWVu
IGNhbGxlZCwgdGhlDQprZXJuZWwgcGFuaWNzIHdpdGggdGhlIGZvbGxvd2luZyB0cmFjZSAod2l0
aA0KQ09ORklHX0lOSVRfT05fRlJFRV9ERUZBVUxUX09OPXkpOg0KDQogICAgICAgIEJVRzoga2Vy
bmVsIE5VTEwgcG9pbnRlciBkZXJlZmVyZW5jZSwgYWRkcmVzczogMDAwMDAwMDAwMDAwMDIxOA0K
ICAgICAgICAgLi4uDQogICAgICAgIENhbGwgVHJhY2U6DQogICAgICAgICA8VEFTSz4NCiAgICAg
ICAgIGdiX29wZXJhdGlvbl9jcmVhdGVfY29tbW9uKzB4NjEvMHgxODANCiAgICAgICAgIGdiX29w
ZXJhdGlvbl9jcmVhdGVfZmxhZ3MrMHgyOC8weGEwDQogICAgICAgICBnYl9vcGVyYXRpb25fc3lu
Y190aW1lb3V0KzB4NmYvMHgxMDANCiAgICAgICAgIHJhd193cml0ZSsweDdiLzB4YzcgW2diX3Jh
d10NCiAgICAgICAgIHZmc193cml0ZSsweGNmLzB4NDIwDQogICAgICAgICA/IHRhc2tfbW1fY2lk
X3dvcmsrMHgxMzYvMHgyMjANCiAgICAgICAgIGtzeXNfd3JpdGUrMHg2My8weGUwDQogICAgICAg
ICBkb19zeXNjYWxsXzY0KzB4YTQvMHgyOTANCiAgICAgICAgIGVudHJ5X1NZU0NBTExfNjRfYWZ0
ZXJfaHdmcmFtZSsweDc3LzB4N2YNCg0KRGlzY29ubmVjdCBjYWxscyBnYl9jb25uZWN0aW9uX2Rl
c3Ryb3ksIHdoaWNoIGVuZHMgdXAgZnJlZWluZyB0aGUNCmNvbm5lY3Rpb24gb2JqZWN0LiBXaGVu
IGdiX29wZXJhdGlvbl9zeW5jIGlzIGNhbGxlZCBpbiB0aGUgd3JpdGUgZmlsZQ0Kb3BlcmF0aW9u
cywgaXRzIGdldHMgYSBmcmVlZCBjb25uZWN0aW9uIGFzIHBhcmFtZXRlciBhbmQgdGhlIGtlcm5l
bA0KcGFuaWNzLg0KDQpUaGUgZ2JfY29ubmVjdGlvbl9kZXN0cm95IGNhbm5vdCBiZSBtb3ZlZCBv
dXQgb2YgdGhlIGRpc2Nvbm5lY3QNCmZ1bmN0aW9uLCBhcyB0aGUgR3JleWJ1cyBzdWJzeXN0ZW0g
ZXhwZWN0IGFsbCBjb25uZWN0aW9ucyBiZWxvbmdpbmcgdG8gYQ0KYnVuZGxlIHRvIGJlIGRlc3Ry
b3llZCB3aGVuIGRpc2Nvbm5lY3QgcmV0dXJucy4NCg0KVG8gcHJldmVudCB0aGlzIGJ1ZywgdXNl
IGEgcncgbG9jayB0byBzeW5jaHJvbml6ZSBhY2Nlc3MgYmV0d2VlbiB3cml0ZQ0KYW5kIGRpc2Nv
bm5lY3QuIFRoaXMgZ3VhcmFudGVlcyB0aGF0IGluIHRoZSB3cml0ZSBmdW5jdGlvbg0KcmF3LT5j
b25uZWN0aW9uIGlzIGVpdGhlciBhIHZhbGlkIG9iamVjdCBvciBhIE5VTEwgcG9pbnRlci4NCg0K
Rml4ZXM6IGU4MDZjN2ZiOGU5YiAoImdyZXlidXM6IHJhdzogYWRkIHJhdyBncmV5YnVzIGtlcm5l
bCBkcml2ZXIiKQ0KU2lnbmVkLW9mZi1ieTogRGFtaWVuIFJpw6lnZWwgPGRhbWllbi5yaWVnZWxA
c2lsYWJzLmNvbT4NCi0tLQ0KQ2hhbmdlcyBpbiB2MjoNCiAgLSB0cmltIGRvd24gdHJhY2UgaW4g
Y29tbWl0IG1lc3NhZ2UgdG8ga2VlcCBvbmx5IHRoZSBlc3NlbnRpYWwgcGFydA0KICAtIGNvbnZl
cnQgdGhlIG11dGV4IHRoYXQgcHJvdGVjdGVkIHRoZSBjb25uZWN0aW9uIHRvIGEgcndfc2VtYXBo
b3JlDQogIC0gdXNlIGEgImNvbm5lY3RlZCIgZmxhZyBpbnN0ZWFkIG9mIHJlbHlpbmcgb24gdGhl
IGNvbm5lY3Rpb24gcG9pbnRlcg0KICAgIGJlaW5nIE5VTEwgb3Igbm90DQoNCiBkcml2ZXJzL3N0
YWdpbmcvZ3JleWJ1cy9yYXcuYyB8IDIyICsrKysrKysrKysrKysrKysrKysrLS0NCiAxIGZpbGUg
Y2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCg0KZGlmZiAtLWdpdCBh
L2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL3Jhdy5jIGIvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMv
cmF3LmMNCmluZGV4IDZkYTg3OGU0MzM5Li41N2JmNTAzMjI4MCAxMDA2NDQNCi0tLSBhL2RyaXZl
cnMvc3RhZ2luZy9ncmV5YnVzL3Jhdy5jDQorKysgYi9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9y
YXcuYw0KQEAgLTIxLDYgKzIxLDggQEAgc3RydWN0IGdiX3JhdyB7DQogCXN0cnVjdCBsaXN0X2hl
YWQgbGlzdDsNCiAJaW50IGxpc3RfZGF0YTsNCiAJc3RydWN0IG11dGV4IGxpc3RfbG9jazsNCisJ
c3RydWN0IHJ3X3NlbWFwaG9yZSBkaXNjb25uZWN0X2xvY2s7CS8qIFN5bmNocm9uaXplIGFjY2Vz
cyB0byBjb25uZWN0aW9uICovDQorCWJvb2wgY29ubmVjdGVkOw0KIAlzdHJ1Y3QgY2RldiBjZGV2
Ow0KIAlzdHJ1Y3QgZGV2aWNlIGRldjsNCiB9Ow0KQEAgLTEyNCw3ICsxMjYsNiBAQCBzdGF0aWMg
aW50IGdiX3Jhd19yZXF1ZXN0X2hhbmRsZXIoc3RydWN0IGdiX29wZXJhdGlvbiAqb3ApDQogDQog
c3RhdGljIGludCBnYl9yYXdfc2VuZChzdHJ1Y3QgZ2JfcmF3ICpyYXcsIHUzMiBsZW4sIGNvbnN0
IGNoYXIgX191c2VyICpkYXRhKQ0KIHsNCi0Jc3RydWN0IGdiX2Nvbm5lY3Rpb24gKmNvbm5lY3Rp
b24gPSByYXctPmNvbm5lY3Rpb247DQogCXN0cnVjdCBnYl9yYXdfc2VuZF9yZXF1ZXN0ICpyZXF1
ZXN0Ow0KIAlpbnQgcmV0dmFsOw0KIA0KQEAgLTEzOSw5ICsxNDAsMTggQEAgc3RhdGljIGludCBn
Yl9yYXdfc2VuZChzdHJ1Y3QgZ2JfcmF3ICpyYXcsIHUzMiBsZW4sIGNvbnN0IGNoYXIgX191c2Vy
ICpkYXRhKQ0KIA0KIAlyZXF1ZXN0LT5sZW4gPSBjcHVfdG9fbGUzMihsZW4pOw0KIA0KLQlyZXR2
YWwgPSBnYl9vcGVyYXRpb25fc3luYyhjb25uZWN0aW9uLCBHQl9SQVdfVFlQRV9TRU5ELA0KKwlk
b3duX3JlYWQoJnJhdy0+ZGlzY29ubmVjdF9sb2NrKTsNCisNCisJaWYgKCFyYXctPmNvbm5lY3Rl
ZCkgew0KKwkJcmV0dmFsID0gLUVOT0RFVjsNCisJCWdvdG8gZXhpdDsNCisJfQ0KKw0KKwlyZXR2
YWwgPSBnYl9vcGVyYXRpb25fc3luYyhyYXctPmNvbm5lY3Rpb24sIEdCX1JBV19UWVBFX1NFTkQs
DQogCQkJCSAgIHJlcXVlc3QsIGxlbiArIHNpemVvZigqcmVxdWVzdCksDQogCQkJCSAgIE5VTEws
IDApOw0KK2V4aXQ6DQorCXVwX3JlYWQoJnJhdy0+ZGlzY29ubmVjdF9sb2NrKTsNCiANCiAJa2Zy
ZWUocmVxdWVzdCk7DQogCXJldHVybiByZXR2YWw7DQpAQCAtMTk5LDYgKzIwOSw3IEBAIHN0YXRp
YyBpbnQgZ2JfcmF3X3Byb2JlKHN0cnVjdCBnYl9idW5kbGUgKmJ1bmRsZSwNCiANCiAJSU5JVF9M
SVNUX0hFQUQoJnJhdy0+bGlzdCk7DQogCW11dGV4X2luaXQoJnJhdy0+bGlzdF9sb2NrKTsNCisJ
aW5pdF9yd3NlbSgmcmF3LT5kaXNjb25uZWN0X2xvY2spOw0KIA0KIAlyYXctPmNvbm5lY3Rpb24g
PSBjb25uZWN0aW9uOw0KIAlyYXctPmRldi5wYXJlbnQgPSAmY29ubmVjdGlvbi0+YnVuZGxlLT5k
ZXY7DQpAQCAtMjEwLDYgKzIyMSw4IEBAIHN0YXRpYyBpbnQgZ2JfcmF3X3Byb2JlKHN0cnVjdCBn
Yl9idW5kbGUgKmJ1bmRsZSwNCiAJaWYgKHJldHZhbCkNCiAJCWdvdG8gZXJyb3JfY29ubmVjdGlv
bl9kZXN0cm95Ow0KIA0KKwlyYXctPmNvbm5lY3RlZCA9IHRydWU7DQorDQogCXJldHZhbCA9IGNk
ZXZfZGV2aWNlX2FkZCgmcmF3LT5jZGV2LCAmcmF3LT5kZXYpOw0KIAlpZiAocmV0dmFsKQ0KIAkJ
Z290byBlcnJvcl9jb25uZWN0aW9uX2Rpc2FibGU7DQpAQCAtMjM1LDYgKzI0OCwxMSBAQCBzdGF0
aWMgdm9pZCBnYl9yYXdfZGlzY29ubmVjdChzdHJ1Y3QgZ2JfYnVuZGxlICpidW5kbGUpDQogCXN0
cnVjdCByYXdfZGF0YSAqdGVtcDsNCiANCiAJY2Rldl9kZXZpY2VfZGVsKCZyYXctPmNkZXYsICZy
YXctPmRldik7DQorDQorCWRvd25fd3JpdGUoJnJhdy0+ZGlzY29ubmVjdF9sb2NrKTsNCisJcmF3
LT5jb25uZWN0ZWQgPSBmYWxzZTsNCisJdXBfd3JpdGUoJnJhdy0+ZGlzY29ubmVjdF9sb2NrKTsN
CisNCiAJZ2JfY29ubmVjdGlvbl9kaXNhYmxlKGNvbm5lY3Rpb24pOw0KIAlnYl9jb25uZWN0aW9u
X2Rlc3Ryb3koY29ubmVjdGlvbik7DQogDQotLSANCjIuNTIuMA0KDQpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpncmV5YnVzLWRldiBtYWlsaW5nIGxpc3Qg
LS0gZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpUbyB1bnN1YnNjcmliZSBzZW5kIGFuIGVt
YWlsIHRvIGdyZXlidXMtZGV2LWxlYXZlQGxpc3RzLmxpbmFyby5vcmcK
