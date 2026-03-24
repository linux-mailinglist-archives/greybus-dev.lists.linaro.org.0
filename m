Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mL6sMzr4wWkmYgQAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Tue, 24 Mar 2026 03:34:34 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 4133A30134D
	for <lists+greybus-dev@lfdr.de>; Tue, 24 Mar 2026 03:34:34 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 471783F788
	for <lists+greybus-dev@lfdr.de>; Tue, 24 Mar 2026 02:25:48 +0000 (UTC)
Received: from mx0a-0024c301.pphosted.com (mx0a-0024c301.pphosted.com [148.163.149.154])
	by lists.linaro.org (Postfix) with ESMTPS id 7EEF23F788
	for <greybus-dev@lists.linaro.org>; Tue, 24 Mar 2026 02:25:41 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=silabs.com header.s=pps12202023 header.b=PSbv2uRA;
	dkim=pass header.d=silabs.com header.s=selector1 header.b=Kh5lY0Cd;
	arc=reject ("signature check failed: fail, {[1] = sig:microsoft.com:reject}");
	spf=pass (lists.linaro.org: domain of "prvs=1543d7b3bc=damien.riegel@silabs.com" designates 148.163.149.154 as permitted sender) smtp.mailfrom="prvs=1543d7b3bc=damien.riegel@silabs.com";
	dmarc=pass (policy=reject) header.from=silabs.com
Received: from pps.filterd (m0101743.ppops.net [127.0.0.1])
	by mx0a-0024c301.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O0Jg8o3800542;
	Mon, 23 Mar 2026 21:25:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pps12202023; bh=i8RbbZoa42RZfWQqPf+G
	Ob3leztUlo6Pbop6EcLmcNI=; b=PSbv2uRAok2XZQICryDZN5k85A6Or9TZo3dS
	tkNjGLkl8y1XxVgcvhrb1QVEtQmnNcdNXSo7+UtQdj1WyfFA+Ti/VrSbDpwUghyr
	rLopE+oVqdH95tPNdFvnakgbJIyx2EmaIMquROuSRhZ6FEJmfPGy5RJqBIxsyGbY
	4+dfz0JEto/QT9mA60kskMVXyz9cN7hvVMcZxAO2Acw/b8+uWr4K7yTlQq4Iivgi
	tctCzlMv+VdWysCyEq/KUouFoIad7QYBC7UY6enAzg8CMkPHssW7NSuji2HojGSK
	aRFDfZLCpzzd2u3pyouRl5mUxikywB+5biAdsnQF3aqWiaUAXA==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11021102.outbound.protection.outlook.com [40.107.208.102])
	by mx0a-0024c301.pphosted.com (PPS) with ESMTPS id 4d1qn5ckv9-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 23 Mar 2026 21:25:24 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L9zDUpyLMMb1tfRYiV3zsZO+hWMc5Oa9/tk7RD59jHX7NFW10Dk3vjdzOoiZoLX9L7krDoZtYWEfHkVISdEo+4zVURL1hWSemyY4YUk90sIiuKP0NWTjpRnLd6ZgnhXxPnliyuQ4SrIlzH/G+f/AVNeZpMINfGwTtyegitpqWH/g3eoYeJKdbwSIbC4DQxOERRvV1MiMzlFaHEJdTGAm8pyLiqVlPnx+wcl7m9JFn+11LmrwZFi8zOnGednDRbPzF7G9B7DCEt3T0+iNz6nrd+jKdTcwVAzMhJpUwS0mfjzgCovoi3KbXS9ndTlFcfswb0XXO1vlgYEJx92yZ3OLpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i8RbbZoa42RZfWQqPf+GOb3leztUlo6Pbop6EcLmcNI=;
 b=PhFwVlomkeErrDqp76K509HvDVVsvgJLwchxcipsLAowCowJzTxV0sBNb+nbeJzENtR/gAXHRD7AUozR9k7C3gt/fPmRm7qenAyis12pDZl2rF6uwWOpV6Qv4PCEcvQb7cidTCkYbh+1kV86cYN9M5H+IynlfEZHuZK8TpgQdRTs+5YuCXY52q1OGkVqE4BP3A9iN4wLl2wUUEOmVdbawEg97fiW9bhm9Q23ge6FR5FPW3W1ULahqMmEy+qpsxBcpYWwZVugtDHWQ98KPWXDAL+MakaSdcqIYmJZND+VDb2zu+ooSiA0alwTtX85nZwhL5tt+0DMixnxcSoI8bYi2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silabs.com; dmarc=pass action=none header.from=silabs.com;
 dkim=pass header.d=silabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i8RbbZoa42RZfWQqPf+GOb3leztUlo6Pbop6EcLmcNI=;
 b=Kh5lY0CdjCBLEol4d6ZabDfJpKZXF2vIYZSxYzv40DC+95Vw8k/wCR/glR+XxbGIIx3LFMB0Uw4J8habEXEKtZEybUlNOUC3RWFlrzvIs1OsOiVx871KAfPveqkzgc5rvnlBeSCETFCZ+TlVY0bSux1Iam5aZ/98VXW+xyxMUgQ=
Received: from DS0PR11MB8205.namprd11.prod.outlook.com (2603:10b6:8:162::17)
 by BY1PR11MB8128.namprd11.prod.outlook.com (2603:10b6:a03:52c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Tue, 24 Mar
 2026 02:25:22 +0000
Received: from DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::2de6:bc88:2af7:3583]) by DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::2de6:bc88:2af7:3583%3]) with mapi id 15.20.9745.019; Tue, 24 Mar 2026
 02:25:22 +0000
From: =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
To: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org
Date: Mon, 23 Mar 2026 22:25:09 -0400
Message-ID: <20260324022510.28596-1-damien.riegel@silabs.com>
X-Mailer: git-send-email 2.52.0
X-ClientProxiedBy: YQBPR01CA0148.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:7e::10) To DS0PR11MB8205.namprd11.prod.outlook.com
 (2603:10b6:8:162::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8205:EE_|BY1PR11MB8128:EE_
X-MS-Office365-Filtering-Correlation-Id: 69c634b5-afe2-47f9-4bd1-08de894c9934
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014|7053199007|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	S6GRT759JfU5V/4mrl8dFEO20CivI+qTrTxEeMhzKEZLexbre8Jmj1LQABDJIurkx5mzk/QZ3zYcE1dwXCk2ECt6dLim2CZYmWyKFpohgV31TcFuqXB8h3cBNYLeSMJS3ZmhgayjMn4krru6kffxv8H+8Ys1ny9+Tj3pGQ3V7WO0TfF/4nFQPwC03+WxoOjy81ynHSVXwvHyt/p7/gxd0OGAMf+wNgAnpk7XKuDolO3/jVjFUifZEB6wH2gTmTMZ/dNfsXGlc5/7SNB/wFrCkHicoIIdiKZCZ396eJXCVEsLIjtI/hLRHDrUuRwDXfsZJ9K/AVrJra8IKDpPoyhQiO5xBCuQEmsJ7KGgTvrhE6bNocIjjnFqvGuNGRTORlKRnLykF9zwv7TQ36FUOr1tzfT9/RJPeMogkFWQavTSFiLAx06nXDXZeOJD911n7JutmfbqTH1ScFkGuxH8u1WPV9sYhN5z+kNlorRaZaIx4A77UaZvkNOUPnkQ84a6wWmpIkoNTVkzfqhxGA1NuX51L89TMupGGT7mwLUuulDmIowYLC4XsTM2IQ4Ylq/PyyvT6ROmriLgtIo1J8fuTWW/2VrncYnb8CFuSU9j/mL/YEBMuz271cedOwu4UNkTqmivQwF/jp/dYpmrJfSU/blhBvLsct94FG9JTNpAGIXBCFzHxlqOqmkKouAAqJtQf4ZZMKAjxK4zvfV62P63cvCVm+zbDiTzxUeT1bF1TqVhOQcG1s9zwixNZEbvRIcuWEA4Jp/K+cRzDIE9IZwemN8wvxrTWDMIOv1UojGXwNIotoo=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8205.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014)(7053199007)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WjVCSitjR2Q4MEVPOHB2eGlia1ZKM2t2UnhCbUgzOFVTenVsQjJpb2ZUVWhJ?=
 =?utf-8?B?MzlhWGFTQzF2Y2wrQXB6aUNDM2Y1bmxqRmZ5c012NGFEdWhpaStZNGxSc2Fl?=
 =?utf-8?B?enlyV3BTQU1iZlZpTVYxK2E5U1crMmJZb2FwWTM0Yk5mVjkxSmV5eC9Gak1w?=
 =?utf-8?B?L0RUS0ltZXMxcUpkOHJPLzNXaDVWOGxKcHNkS09Pd2lscVEveW5SWEdab0pp?=
 =?utf-8?B?RTBLblJhTlFMMmJkQmhheVZkVVV6YWN6QTU0TXhPRW9mMDc3b2FGNGxGenc2?=
 =?utf-8?B?QjB6VUdxQ0Vreno0WmNLSkN6VVdPWHo2VVVTb2kzVHluRTgwRUt6cnVLRGts?=
 =?utf-8?B?cWk5MVA4dXhIamVPRzdhU2QrOUlPTkNDOUhybzIvU1puL080TzNPRmFiN2Z3?=
 =?utf-8?B?MUNiV3ZvOGI2Mlg2WXhEaWI0dHQ0amZRbm1hUjNvSHpMWi9jUHkvSGtiZldj?=
 =?utf-8?B?T2s0VjFUcWcrYlhyU21ra3h2VTFwRldETGRaZWdsL1FJb2V3NXd4QXdTM1ZB?=
 =?utf-8?B?N2lRTmt1S3dQSTNRWSs4a2RiZ0RQQ1Z0VWpocFlBTE1PRHlhYm9xdXpyTVU5?=
 =?utf-8?B?TEhwblR5UjdMcTFmZ2ZBRmQ5Wkpud3lMVGxyRG95TmRFdEY2c09POStRZDc4?=
 =?utf-8?B?aHJuQTg2cDdaRzdDemNWb3ZUWFNMbkpEbEd4Znh0VGRaZklWY2NiUWF6RlFx?=
 =?utf-8?B?MHdtTE14UGNqNnpLVmhSOFhsQkE3SmdaUUJEVnRyUHNNdjRiYlNjRU1oeGR3?=
 =?utf-8?B?TmhQREs0TnJ0ZHdkQ3pqZlE4MEMrWDVRN3FRWHBZTWtXZUJSa3Y2RkQyTURW?=
 =?utf-8?B?OHFhN1BLYUVKVXpQRk5QQXZQZUlVdEFwWlFwbFQzK1FvcU54WWZ1eWpwM09v?=
 =?utf-8?B?SFhpUEtRb2RTK0s0OFkxTmxYeDN6WmthVENpT2U1aE1sNTFWd3o0bldjbWRO?=
 =?utf-8?B?TTBTY21mQ0ovVHJsWXJCQnZVc1RkRmRBZGxFM0dRN2UvWFc4MTBid2ZEbGE2?=
 =?utf-8?B?c2dKNklBUkVaSU5hVlVPUEdwK3lhVnRjUHdHY1lZb1QvajVxcXMzdUMwTFlr?=
 =?utf-8?B?dGdEVm9VRzVtNmU3N3FGYWN0M3R2amU2NUg1eGFtNUdFMHJvcERZbWtPcjJy?=
 =?utf-8?B?cVZpMWxXLzVPRlE1MUlJTkdhVGZmMlZ5VjIvTlpIdnQ1Q0w1S2ZKUCs5aVBz?=
 =?utf-8?B?a3IralhpbzFOZGZ0b242TS9uRE5Dc0lMQWpzMEIwbVgyMWlnTnc4WHZyUS9C?=
 =?utf-8?B?RUNZa2YrQ0NDb21XcXNnMVgxNEpwbnR3U1R4SjR5RGM4L0FIU2tZMmNDZHZ3?=
 =?utf-8?B?bk9EKzJWcDBSaUNMVGRlcWVnVytFSWJMRStNc1d1ejBSMFF5Rjl6bGJoc2ZB?=
 =?utf-8?B?NDBYVTBXay9uVy9Jb1RjNGtDa2oyVlFmNFBzTzk4R0ZraFJIcHl3WHp6RzZO?=
 =?utf-8?B?RFphdi9KeHlwK2dlTVgyS2JvcGhvTDgxQ3o1clF6N0J5NWxMRnVxcUhGVUQ5?=
 =?utf-8?B?dVd4V0FVRUw3YVRlSE85V1dYVW5zYklGaVVNNFpzd0YxTmcwVEVSd1N2OG1H?=
 =?utf-8?B?c0d1NTdXTjJ0cmE0TWlSNHBxd1lWWUxFbWQ0SDQyTWpOcU1LdXB6TWFVcUJW?=
 =?utf-8?B?akNoRnpnS1h6ZDNDQTlpMkdRVEtrQUhFZWVsemFFaW90ekk5QmtuREh3OGNI?=
 =?utf-8?B?TzFieEIrYmozVlNZRml5Z29JWDNsV21zR3NSZCt2TnVURlRJQ0Rod0ZHVzVo?=
 =?utf-8?B?VXUxaitOZzM4SUZlNmJKb05ITXdabXF5M2FrVUZwdHRLUmsyVW5HSWRMN0dN?=
 =?utf-8?B?dXhvZXhBTi93dFMvSWZLMU1vUFkvYlFtcWU2SlhmSkdWSEJSV1VjRmhhODNp?=
 =?utf-8?B?dmxWN3hiL3lyZ0ZrV0J3R0c1OTU5R2xGYWJNaitMVXBwYkFvS3RUeEhFSmlq?=
 =?utf-8?B?a3V1RnJZdURvTWZmM1Arc3VvNWtiQ2g0TG9jR0ZES2hucXZ5UEFOR1oybzRt?=
 =?utf-8?B?NFFjdXkxVDcyd0tvRlFvOWNGd0E1ZEs1ZjM2NFhqZHhsRHhlQWJjVG9OMXV3?=
 =?utf-8?B?WHlBSEtTZm5WTnV1MFRUYTQ2T2svZG9udnYrNXRYTjBpR3R3dlVoQ2o2Z1lz?=
 =?utf-8?B?QVg5dGpFU2toUlJmQ1FGNE1JTm5ZR3N3anJvNC9lbWNBWFFlMWtZcmw2MGZG?=
 =?utf-8?B?TnN6SXdaK29iaHFUYi9ZcFBnUVNmUk5udHJZM3hTem9vN3ZRcG9LNlc2d2dH?=
 =?utf-8?B?RG5xODR0bXdjaUtHcVZLeWplRHNuSXNjL2VpL25acEovbDNkUjRpTit0MzhP?=
 =?utf-8?B?YytabWJFVE5FUDN4ejlBQ2xJKzFUK0xhYmFlbGJLUjI0N1g0L210dz09?=
X-Exchange-RoutingPolicyChecked: 
	eBXteF0OX4Hh5UdxM9NQ181geFNHo0yX2BSrlJncQk2GiPH/m3zAWYcdqMqjKGUS89iZgOSCJ1N1xh7YD8T8ZpNGc/THlsWgQy1nRg34ApZqaV2wdhqRWDaOB7Wc0Y31hfkXACiHpCXjhakfe1BBIISsM6REiSWTAwSsPmER8Fj83dP80AYXVdAN7JvijpunIJLDlZ/QURGGD8c9KbEo6C0XSpEHvqXC9aeC4B/bf0G7F96NPKx/VPSUMgA4Ix5snmprEHU0sETGXPKwcydQVtvL4bEKwYk8e2WkEUjyESE2YrCBLw/bwVgh0TAU5Ib9Ksp0YIh/ecICFlsQTl44Jg==
X-OriginatorOrg: silabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69c634b5-afe2-47f9-4bd1-08de894c9934
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8205.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 02:25:21.9601
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 54dbd822-5231-4b20-944d-6f4abcd541fb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SIhveBGbYrerKvorJgMt2+UimTH2GSii3Sp/20oEjPzmCQ/3x3gnC36Ay4Es4Y/+YAxqiHbY/C5GdBqAcrTIwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8128
X-Authority-Analysis: v=2.4 cv=T5CBjvKQ c=1 sm=1 tr=0 ts=69c1f614 cx=c_pps
 a=77rI9ysV2qQyIatzbb/mKA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=M51BFTxLslgA:10
 a=i1IsUcr2s-wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=gIHJBl62Mt9vjvfn7G3b:22
 a=6KgOrB_2K63Cyhqxo4vW:22 a=VwQbUJbxAAAA:8 a=2AEO0YjSAAAA:8
 a=XeHHJQA7KXFy9l5GLh0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: jX34jFSl5sB50vGvKuK6gBaN6urcUrsK
X-Proofpoint-GUID: jX34jFSl5sB50vGvKuK6gBaN6urcUrsK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDAxOCBTYWx0ZWRfX0nreqpuNFWA8
 FJRPKet6qVnZZrzKlC8ae9A8DfG6JnPWNiBEZG2j1zXoTy/igV7PKMmEExATvKHGwRiZxMqVplq
 KeJSORv+y4DiKS4152iNBnl5lON4du7YLrNxPH5a7NEbdEnZNGUBbpKv5oLy6A7V4Zke5grLuUD
 Q+lakUmWh3d6B/OA1zLxz3B/QARGgAzZgI5AyyWG4hzk2gWsFlvPxpKBJfdYLvPd9nKze8hMvwd
 F0QYo+fLYEFJVSqPjI6qtQB6RC+DUoh6/HczL4dtKS1jQcJh3AKdfYcxFlAVTGt3OP6D0h+YCp0
 bBTD8xJDuo+2id5obDH4AGVFh+Cub4o+3oF1qwAXZVza9Mz4jEa5F9pQ0aSsB3KjHIponJSUdB2
 sZHS3+2H/xSVpDHsEwdkhbugldm7jYVetdomQzJMApKrSuP53Rb8ramHb+VrKsgByplExtz+jYs
 RXd/iQCqrRekddkmnpQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_07,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240018
X-Spamd-Bar: --
Message-ID-Hash: R2DFARDEJB3L3GIED3EHV754WDCQ7ICV
X-Message-ID-Hash: R2DFARDEJB3L3GIED3EHV754WDCQ7ICV
X-MailFrom: prvs=1543d7b3bc=damien.riegel@silabs.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v3 1/2] greybus: raw: fix use-after-free on cdev close
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/R2DFARDEJB3L3GIED3EHV754WDCQ7ICV/>
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
	FORGED_SENDER_MAILLIST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[damien.riegel@silabs.com,greybus-dev-bounces@lists.linaro.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[silabs.com:-];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	TAGGED_RCPT(0.00)[greybus-dev];
	NEURAL_SPAM(0.00)[0.987];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linaro.org:helo,lists.linaro.org:rdns]
X-Rspamd-Queue-Id: 4133A30134D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

VGhpcyBhZGRyZXNzZXMgYSB1c2UtYWZ0ZXItZnJlZSBidWcgd2hlbiBhIHJhdyBidW5kbGUgaXMg
ZGlzY29ubmVjdGVkDQpidXQgaXRzIGNoYXJkZXYgaXMgc3RpbGwgb3BlbmVkIGJ5IGFuIGFwcGxp
Y2F0aW9uLiBXaGVuIHRoZSBhcHBsaWNhdGlvbg0KcmVsZWFzZXMgdGhlIGNkZXYsIGl0IGNhdXNl
cyB0aGUgZm9sbG93aW5nIHBhbmljIHdoZW4gaW5pdCBvbiBmcmVlIGlzDQplbmFibGVkIChDT05G
SUdfSU5JVF9PTl9GUkVFX0RFRkFVTFRfT049eSk6DQoNCiAgICAgICAgcmVmY291bnRfdDogdW5k
ZXJmbG93OyB1c2UtYWZ0ZXItZnJlZS4NCiAgICAgICAgV0FSTklORzogQ1BVOiAwIFBJRDogMTM5
IGF0IGxpYi9yZWZjb3VudC5jOjI4IHJlZmNvdW50X3dhcm5fc2F0dXJhdGUrMHhkMC8weDEzMA0K
ICAgICAgICAgLi4uDQogICAgICAgIENhbGwgVHJhY2U6DQogICAgICAgICA8VEFTSz4NCiAgICAg
ICAgIGNkZXZfcHV0KzB4MTgvMHgzMA0KICAgICAgICAgX19mcHV0KzB4MjU1LzB4MmEwDQogICAg
ICAgICBfX3g2NF9zeXNfY2xvc2UrMHgzZC8weDgwDQogICAgICAgICBkb19zeXNjYWxsXzY0KzB4
YTQvMHgyOTANCiAgICAgICAgIGVudHJ5X1NZU0NBTExfNjRfYWZ0ZXJfaHdmcmFtZSsweDc3LzB4
N2YNCg0KVGhlIGNkZXYgaXMgY29udGFpbmVkIGluIHRoZSAiZ2JfcmF3IiBzdHJ1Y3R1cmUsIHdo
aWNoIGlzIGZyZWVkIGluIHRoZQ0KZGlzY29ubmVjdCBvcGVyYXRpb24uIFdoZW4gdGhlIGNkZXYg
aXMgcmVsZWFzZWQgYXQgYSBsYXRlciB0aW1lLA0KY2Rldl9wdXQgZ2V0cyBhbiBhZGRyZXNzIHRo
YXQgcG9pbnRzIHRvIGZyZWVkIG1lbW9yeS4NCg0KVG8gZml4IHRoaXMgdXNlLWFmdGVyLWZyZWUs
IGNvbnZlcnQgdGhlIHN0cnVjdCBkZXZpY2UgZnJvbSBhIHBvaW50ZXIgdG8NCmJlaW5nIGVtYmVk
ZGVkLCB0aGF0IG1ha2VzIHRoZSBsaWZldGltZSBvZiB0aGUgY2RldiBhbmQgb2YgdGhpcyBkZXZp
Y2UNCnRoZSBzYW1lLiBUaGVuLCB1c2UgY2Rldl9kZXZpY2VfYWRkLCB3aGljaCBndWFyYW50ZWVz
IHRoYXQgdGhlIGRldmljZQ0Kd29uJ3QgYmUgcmVsZWFzZWQgdW50aWwgYWxsIHJlZmVyZW5jZXMg
dG8gdGhlIGNkZXYgaGF2ZSBiZWVuIHJlbGVhc2VkLg0KRmluYWxseSwgZGVsZWdhdGUgdGhlIGZy
ZWVpbmcgb2YgdGhlIHN0cnVjdHVyZSB0byB0aGUgZGV2aWNlIHJlbGVhc2UNCmZ1bmN0aW9uLCBp
bnN0ZWFkIG9mIGZyZWVpbmcgaW1tZWRpYXRlbHkgaW4gdGhlIGRpc2Nvbm5lY3QgY2FsbGJhY2su
DQoNCkZpeGVzOiBlODA2YzdmYjhlOWIgKCJncmV5YnVzOiByYXc6IGFkZCByYXcgZ3JleWJ1cyBr
ZXJuZWwgZHJpdmVyIikNClJldmlld2VkLWJ5OiBKb2hhbiBIb3ZvbGQgPGpvaGFuQGtlcm5lbC5v
cmc+DQpTaWduZWQtb2ZmLWJ5OiBEYW1pZW4gUmnDqWdlbCA8ZGFtaWVuLnJpZWdlbEBzaWxhYnMu
Y29tPg0KLS0tDQpDaGFuZ2VzIGluIHYzOg0KICAtIG1vdmUgYXNzaWdubWVudCBvZiByYXctPmRl
di5wYXJlbnQNCiAgLSBhZGQgUmV2aWV3ZWQtQnk6IEpvaGFuIEhvdm9sZA0KDQpDaGFuZ2VzIGlu
IHYyOg0KICAtIHRyaW0gZG93biB0cmFjZSBpbiBjb21taXQgbWVzc2FnZSB0byBrZWVwIG9ubHkg
dGhlIGVzc2VudGlhbCBwYXJ0DQogIC0gcmV3b3JrIGVycm9yIHBhdGhzIGluIHByb2JlIGZ1bmN0
aW9uIHRvIGVuc3VyZSBkZXZpY2UgaXMgYWx3YXlzIGZyZWVkDQogICAgKHNldCBkZXZpY2UgcmVs
ZWFzZSBjYWxsYmFjayBiZWZvcmUgYW55IGNhbGwgdG8gcHV0X2RldmljZSkNCiAgLSBtb3ZlIGlk
YV9mcmVlIHRvIHJlbGVhc2UgY2FsbGJhY2sNCg0KIGRyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL3Jh
dy5jIHwgNjcgKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0NCiAxIGZpbGUgY2hh
bmdlZCwgMzMgaW5zZXJ0aW9ucygrKSwgMzQgZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1naXQgYS9k
cml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9yYXcuYyBiL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL3Jh
dy5jDQppbmRleCA3MWRlNjc3NjczOS4uZTY2ODQzOGUxYTIgMTAwNjQ0DQotLS0gYS9kcml2ZXJz
L3N0YWdpbmcvZ3JleWJ1cy9yYXcuYw0KKysrIGIvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvcmF3
LmMNCkBAIC0yMSw5ICsyMSw4IEBAIHN0cnVjdCBnYl9yYXcgew0KIAlzdHJ1Y3QgbGlzdF9oZWFk
IGxpc3Q7DQogCWludCBsaXN0X2RhdGE7DQogCXN0cnVjdCBtdXRleCBsaXN0X2xvY2s7DQotCWRl
dl90IGRldjsNCiAJc3RydWN0IGNkZXYgY2RldjsNCi0Jc3RydWN0IGRldmljZSAqZGV2aWNlOw0K
KwlzdHJ1Y3QgZGV2aWNlIGRldjsNCiB9Ow0KIA0KIHN0cnVjdCByYXdfZGF0YSB7DQpAQCAtMTQ4
LDYgKzE0NywxNSBAQCBzdGF0aWMgaW50IGdiX3Jhd19zZW5kKHN0cnVjdCBnYl9yYXcgKnJhdywg
dTMyIGxlbiwgY29uc3QgY2hhciBfX3VzZXIgKmRhdGEpDQogCXJldHVybiByZXR2YWw7DQogfQ0K
IA0KK3N0YXRpYyB2b2lkIHJhd19kZXZfcmVsZWFzZShzdHJ1Y3QgZGV2aWNlICpkZXYpDQorew0K
KwlzdHJ1Y3QgZ2JfcmF3ICpyYXcgPSBjb250YWluZXJfb2YoZGV2LCBzdHJ1Y3QgZ2JfcmF3LCBk
ZXYpOw0KKw0KKwlpZGFfZnJlZSgmbWlub3JzLCBNSU5PUihyYXctPmRldi5kZXZ0KSk7DQorDQor
CWtmcmVlKHJhdyk7DQorfQ0KKw0KIHN0YXRpYyBpbnQgZ2JfcmF3X3Byb2JlKHN0cnVjdCBnYl9i
dW5kbGUgKmJ1bmRsZSwNCiAJCQljb25zdCBzdHJ1Y3QgZ3JleWJ1c19idW5kbGVfaWQgKmlkKQ0K
IHsNCkBAIC0xNjQsMTUgKzE3MiwzMCBAQCBzdGF0aWMgaW50IGdiX3Jhd19wcm9iZShzdHJ1Y3Qg
Z2JfYnVuZGxlICpidW5kbGUsDQogCWlmIChjcG9ydF9kZXNjLT5wcm90b2NvbF9pZCAhPSBHUkVZ
QlVTX1BST1RPQ09MX1JBVykNCiAJCXJldHVybiAtRU5PREVWOw0KIA0KKwltaW5vciA9IGlkYV9h
bGxvYygmbWlub3JzLCBHRlBfS0VSTkVMKTsNCisJaWYgKG1pbm9yIDwgMCkNCisJCXJldHVybiBt
aW5vcjsNCisNCiAJcmF3ID0ga3phbGxvYyhzaXplb2YoKnJhdyksIEdGUF9LRVJORUwpOw0KLQlp
ZiAoIXJhdykNCisJaWYgKCFyYXcpIHsNCisJCWlkYV9mcmVlKCZtaW5vcnMsIG1pbm9yKTsNCiAJ
CXJldHVybiAtRU5PTUVNOw0KKwl9DQorDQorCWRldmljZV9pbml0aWFsaXplKCZyYXctPmRldik7
DQorCXJhdy0+ZGV2LmRldnQgPSBNS0RFVihyYXdfbWFqb3IsIG1pbm9yKTsNCisJcmF3LT5kZXYu
Y2xhc3MgPSAmcmF3X2NsYXNzOw0KKwlyYXctPmRldi5wYXJlbnQgPSAmYnVuZGxlLT5kZXY7DQor
CXJhdy0+ZGV2LnJlbGVhc2UgPSByYXdfZGV2X3JlbGVhc2U7DQorCXJldHZhbCA9IGRldl9zZXRf
bmFtZSgmcmF3LT5kZXYsICJnYiFyYXclZCIsIG1pbm9yKTsNCisJaWYgKHJldHZhbCkNCisJCWdv
dG8gZXJyb3JfcHV0X2RldmljZTsNCiANCiAJY29ubmVjdGlvbiA9IGdiX2Nvbm5lY3Rpb25fY3Jl
YXRlKGJ1bmRsZSwgbGUxNl90b19jcHUoY3BvcnRfZGVzYy0+aWQpLA0KIAkJCQkJICBnYl9yYXdf
cmVxdWVzdF9oYW5kbGVyKTsNCiAJaWYgKElTX0VSUihjb25uZWN0aW9uKSkgew0KIAkJcmV0dmFs
ID0gUFRSX0VSUihjb25uZWN0aW9uKTsNCi0JCWdvdG8gZXJyb3JfZnJlZTsNCisJCWdvdG8gZXJy
b3JfcHV0X2RldmljZTsNCiAJfQ0KIA0KIAlJTklUX0xJU1RfSEVBRCgmcmF3LT5saXN0KTsNCkBA
IC0xODEsNDYgKzIwNCwyNiBAQCBzdGF0aWMgaW50IGdiX3Jhd19wcm9iZShzdHJ1Y3QgZ2JfYnVu
ZGxlICpidW5kbGUsDQogCXJhdy0+Y29ubmVjdGlvbiA9IGNvbm5lY3Rpb247DQogCWdyZXlidXNf
c2V0X2RydmRhdGEoYnVuZGxlLCByYXcpOw0KIA0KLQltaW5vciA9IGlkYV9hbGxvYygmbWlub3Jz
LCBHRlBfS0VSTkVMKTsNCi0JaWYgKG1pbm9yIDwgMCkgew0KLQkJcmV0dmFsID0gbWlub3I7DQot
CQlnb3RvIGVycm9yX2Nvbm5lY3Rpb25fZGVzdHJveTsNCi0JfQ0KLQ0KLQlyYXctPmRldiA9IE1L
REVWKHJhd19tYWpvciwgbWlub3IpOw0KIAljZGV2X2luaXQoJnJhdy0+Y2RldiwgJnJhd19mb3Bz
KTsNCiANCiAJcmV0dmFsID0gZ2JfY29ubmVjdGlvbl9lbmFibGUoY29ubmVjdGlvbik7DQogCWlm
IChyZXR2YWwpDQotCQlnb3RvIGVycm9yX3JlbW92ZV9pZGE7DQorCQlnb3RvIGVycm9yX2Nvbm5l
Y3Rpb25fZGVzdHJveTsNCiANCi0JcmV0dmFsID0gY2Rldl9hZGQoJnJhdy0+Y2RldiwgcmF3LT5k
ZXYsIDEpOw0KKwlyZXR2YWwgPSBjZGV2X2RldmljZV9hZGQoJnJhdy0+Y2RldiwgJnJhdy0+ZGV2
KTsNCiAJaWYgKHJldHZhbCkNCiAJCWdvdG8gZXJyb3JfY29ubmVjdGlvbl9kaXNhYmxlOw0KIA0K
LQlyYXctPmRldmljZSA9IGRldmljZV9jcmVhdGUoJnJhd19jbGFzcywgJmNvbm5lY3Rpb24tPmJ1
bmRsZS0+ZGV2LA0KLQkJCQkgICAgcmF3LT5kZXYsIHJhdywgImdiIXJhdyVkIiwgbWlub3IpOw0K
LQlpZiAoSVNfRVJSKHJhdy0+ZGV2aWNlKSkgew0KLQkJcmV0dmFsID0gUFRSX0VSUihyYXctPmRl
dmljZSk7DQotCQlnb3RvIGVycm9yX2RlbF9jZGV2Ow0KLQl9DQotDQogCXJldHVybiAwOw0KIA0K
LWVycm9yX2RlbF9jZGV2Og0KLQljZGV2X2RlbCgmcmF3LT5jZGV2KTsNCi0NCiBlcnJvcl9jb25u
ZWN0aW9uX2Rpc2FibGU6DQogCWdiX2Nvbm5lY3Rpb25fZGlzYWJsZShjb25uZWN0aW9uKTsNCiAN
Ci1lcnJvcl9yZW1vdmVfaWRhOg0KLQlpZGFfZnJlZSgmbWlub3JzLCBtaW5vcik7DQotDQogZXJy
b3JfY29ubmVjdGlvbl9kZXN0cm95Og0KIAlnYl9jb25uZWN0aW9uX2Rlc3Ryb3koY29ubmVjdGlv
bik7DQogDQotZXJyb3JfZnJlZToNCi0Ja2ZyZWUocmF3KTsNCitlcnJvcl9wdXRfZGV2aWNlOg0K
KwlwdXRfZGV2aWNlKCZyYXctPmRldik7DQogCXJldHVybiByZXR2YWw7DQogfQ0KIA0KQEAgLTIz
MSwxMSArMjM0LDggQEAgc3RhdGljIHZvaWQgZ2JfcmF3X2Rpc2Nvbm5lY3Qoc3RydWN0IGdiX2J1
bmRsZSAqYnVuZGxlKQ0KIAlzdHJ1Y3QgcmF3X2RhdGEgKnJhd19kYXRhOw0KIAlzdHJ1Y3QgcmF3
X2RhdGEgKnRlbXA7DQogDQotCS8vIEZJWE1FIC0gaGFuZGxlIHJlbW92aW5nIGEgY29ubmVjdGlv
biB3aGVuIHRoZSBjaGFyIGRldmljZSBub2RlIGlzIG9wZW4uDQotCWRldmljZV9kZXN0cm95KCZy
YXdfY2xhc3MsIHJhdy0+ZGV2KTsNCi0JY2Rldl9kZWwoJnJhdy0+Y2Rldik7DQorCWNkZXZfZGV2
aWNlX2RlbCgmcmF3LT5jZGV2LCAmcmF3LT5kZXYpOw0KIAlnYl9jb25uZWN0aW9uX2Rpc2FibGUo
Y29ubmVjdGlvbik7DQotCWlkYV9mcmVlKCZtaW5vcnMsIE1JTk9SKHJhdy0+ZGV2KSk7DQogCWdi
X2Nvbm5lY3Rpb25fZGVzdHJveShjb25uZWN0aW9uKTsNCiANCiAJbXV0ZXhfbG9jaygmcmF3LT5s
aXN0X2xvY2spOw0KQEAgLTI0NCw4ICsyNDQsNyBAQCBzdGF0aWMgdm9pZCBnYl9yYXdfZGlzY29u
bmVjdChzdHJ1Y3QgZ2JfYnVuZGxlICpidW5kbGUpDQogCQlrZnJlZShyYXdfZGF0YSk7DQogCX0N
CiAJbXV0ZXhfdW5sb2NrKCZyYXctPmxpc3RfbG9jayk7DQotDQotCWtmcmVlKHJhdyk7DQorCXB1
dF9kZXZpY2UoJnJhdy0+ZGV2KTsNCiB9DQogDQogLyoNCi0tIA0KMi41Mi4wDQoNCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmdyZXlidXMtZGV2IG1haWxp
bmcgbGlzdCAtLSBncmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3JnClRvIHVuc3Vic2NyaWJlIHNl
bmQgYW4gZW1haWwgdG8gZ3JleWJ1cy1kZXYtbGVhdmVAbGlzdHMubGluYXJvLm9yZwo=
