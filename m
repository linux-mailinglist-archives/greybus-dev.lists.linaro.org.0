Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yLLSEaT4jmnbGAEAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Fri, 13 Feb 2026 11:10:44 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id AAA77134E69
	for <lists+greybus-dev@lfdr.de>; Fri, 13 Feb 2026 11:10:43 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 5D2E73F9BA
	for <lists+greybus-dev@lfdr.de>; Fri, 13 Feb 2026 10:10:42 +0000 (UTC)
Received: from mx0a-0024c301.pphosted.com (mx0a-0024c301.pphosted.com [148.163.149.154])
	by lists.linaro.org (Postfix) with ESMTPS id 384DE3F7B2
	for <greybus-dev@lists.linaro.org>; Fri, 13 Feb 2026 09:36:13 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=silabs.com header.s=pps12202023 header.b=X07MDvL4;
	dkim=pass header.d=silabs.com header.s=selector1 header.b=QTp1nW4F;
	spf=pass (lists.linaro.org: domain of "prvs=05048d6178=jerome.pouiller@silabs.com" designates 148.163.149.154 as permitted sender) smtp.mailfrom="prvs=05048d6178=jerome.pouiller@silabs.com";
	arc=pass ("microsoft.com:s=arcselector10001:i=1");
	dmarc=pass (policy=reject) header.from=silabs.com
Received: from pps.filterd (m0101743.ppops.net [127.0.0.1])
	by mx0a-0024c301.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61D0Lufp929752;
	Fri, 13 Feb 2026 03:36:08 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps12202023;
	 bh=hW1xG8Ql2Pj/v8q+GDcmgaUROBSkUG5bcigJjQXUsLI=; b=X07MDvL4ZarA
	Ajen4QNrm4380jZUHwW2t1I4oul2nKSEuG9hHpkwsJzCjEp9p1+NvP/B0Tsap/Zk
	Gho145AChfwD8PrQvFnSuqPEeRLJvEirrEwz7KumDi34KEOuAfLV0+btmX8GpDMv
	Wdi9EeHN2Qm+cT5xGq/aEPoXpj5eirwfYz9sKD4yS/x+JYmTLGW5dDyiN1cMa7RF
	Q2gQ1OsCSnfS4sGd+15QMMIWszxub8Yl1MNLsXMG0VqCUoIFpnFJ3Yls4XBlA+23
	Lnvq4CFcvzWgB1dCbaLPYA7JB08iDynRij0bGCP/5OxMZb6wC2vY/0Mw6N19l9P9
	qVpoHfccFQ==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11022077.outbound.protection.outlook.com [52.101.43.77])
	by mx0a-0024c301.pphosted.com (PPS) with ESMTPS id 4c92uyv82q-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 13 Feb 2026 03:36:07 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DMkKI52GvdDy88pXwGCiO17hwG0FNxmNObstJYumTiz/WBqm9JxCqlen6AYGGEsS//t6rCVGjYRugysqS9lRJ1LaJ6CUFi+4hixvQ/9lXLhN5Kzu3UyOE22NIbI1nbOqL/z1ryMWyylXkS4E9kNPJyoewxFLuNC9k65/fzR5nVocWN874842RT3cQtJVzzlcGNyv6u3OGVIN8GEwUoFmF9DnBQYcnqLU9Ck9+/rg1iNSqGZQgTMDLu9ppnkClDCJOmizhWgvbaL3gei5SGhWQWPxTXXY8Wbdfb85Xz+08To+Er9yE6gjtHx5HKaBmQGVi7vlRf5P5SrGE/Vyvkfu+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hW1xG8Ql2Pj/v8q+GDcmgaUROBSkUG5bcigJjQXUsLI=;
 b=jcSTfEPONzMc72hyTdr+4Kkc32S9NabJMelG81XJ5AyBcB6rLymgPjzUfGP1XxEzFviiqAD45OPBjtmTlG2WmqHR/9qQxwZpGfMA6beuFuESy59eiWxJy//WzV/scP4Z4ryMV/Ea+s1bwPpprSBoFRFNicOeTepGJD6IuRuWSuaLrqtBd0kKtzl48lXsT8bLZpoOq409eALWhltp3ihQeBQdO4fb1+3iFLhnSyx+fEhJYS8CmrYgVOy/FMy6zkol2MosVsH4mW2UishAHrkU84VaRt+er9ENgVCrEnIyUviBiFQkUnvC7KTEc/HxaNDzGzEh+o3fwJ9xN6HwsL5OOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silabs.com; dmarc=pass action=none header.from=silabs.com;
 dkim=pass header.d=silabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hW1xG8Ql2Pj/v8q+GDcmgaUROBSkUG5bcigJjQXUsLI=;
 b=QTp1nW4FJcnJlJIspDlqwEfubrvVBAfe2Mj8Wj5fQCj2LaSGtKn2XyBUtwQsGIpvop5VBjy8hHolc+HxY6ObenpbbaqKI3Vui8CNfZu34ZGRucgz2upkGdfLaqCmop7kUVSciMz6n9/tHlSWy4xj1/GTcGtNe9sXIjGO3Dm53q0=
Received: from CY8PR11MB7779.namprd11.prod.outlook.com (2603:10b6:930:77::22)
 by IA0PR11MB7377.namprd11.prod.outlook.com (2603:10b6:208:433::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.14; Fri, 13 Feb
 2026 09:36:05 +0000
Received: from CY8PR11MB7779.namprd11.prod.outlook.com
 ([fe80::4d6f:dfa:6fd4:2714]) by CY8PR11MB7779.namprd11.prod.outlook.com
 ([fe80::4d6f:dfa:6fd4:2714%5]) with mapi id 15.20.9611.012; Fri, 13 Feb 2026
 09:36:05 +0000
From: =?UTF-8?B?SsOpcsO0bWU=?= Pouiller <jerome.pouiller@silabs.com>
To: greybus-dev@lists.linaro.org, Johan Hovold <johan@kernel.org>,
        Alex Elder <elder@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org,
        Damien =?UTF-8?B?UmnDqWdlbA==?= <damien.riegel@silabs.com>
Date: Fri, 13 Feb 2026 10:35:16 +0100
Message-ID: <15379358.uLZWGnKmhe@nb0018864>
Organization: Silicon Labs
In-Reply-To: <20260212144352.93043-15-damien.riegel@silabs.com>
References: 
 <20260212144352.93043-1-damien.riegel@silabs.com>
 <20260212144352.93043-15-damien.riegel@silabs.com>
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: PAZP264CA0056.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:1fd::9) To IA1PR11MB7773.namprd11.prod.outlook.com
 (2603:10b6:208:3f0::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7779:EE_|IA0PR11MB7377:EE_
X-MS-Office365-Filtering-Correlation-Id: 33ed3c15-ccac-4c72-9200-08de6ae344fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?MEVHME9Ba1pCT3FZeVM1MzU4aGhwL1ZSZ2plUDdKQmhBK3ZzYXBmZERzT3JO?=
 =?utf-8?B?UzB1UGYrdHhiMDE5RDNJZW1YVVVYSzBXbnVlSStNRGp6V3owVTR1Y2I1aHZu?=
 =?utf-8?B?N0RpdzdiYVp2MGJoa1UvVTlFTFhYcERsQTRROFFwdXJ0dlVnYVZ4MmhpdnJC?=
 =?utf-8?B?M3NVa0ZaUWlWVGo0b3RrVldCdFJHREJHTkNzK1lkeWZMM2x1bXd6a1hzR3p1?=
 =?utf-8?B?bFVEVkkrdXJXNnRHZ0pWcjJQdERIanRieGlrbkVobzNUSEwxMC91QVJaU3Rq?=
 =?utf-8?B?NndOMGNGdHJ1aURYSnh4WHp4RktSSVBjY29mL0pZdDl3V3IyQTJKWDFRaTd3?=
 =?utf-8?B?TjBKWlc3dWdVQVpsb25LemhjU2VJSWRqRHZodEJReWFBdE91Nks5N2gyZ1lT?=
 =?utf-8?B?VG9DUk5uYXFmK3IyY0VvUitRK1Z5R1FDcVpNb3Y0dHNHa1BSUC9DV29NbE0y?=
 =?utf-8?B?YzBMSDNsQ2xEd0NPMEhrUTdld05lNUFlK1hQNnVmQURCNTAzbEc1dnNVMlBP?=
 =?utf-8?B?aFVvbDdmbjFkNHFHTUYxdHEwTUVkMTZ4UjVvK0xIYm5KYjVuOWQzVFY1aW91?=
 =?utf-8?B?a0h2WXJGWnlYMXZyeC9Jc3RUUlg3dVhQNlJRaEdtMkhqRCt1dVVFUzVodlVp?=
 =?utf-8?B?VzZ4WC9NRm5wWkQvSjJzdUZaN3lDekZMRjlWbStmWEZ4VkRGZ2Jhbmh5VXJK?=
 =?utf-8?B?V1VZZFdvOUIxM3dwT0MwazBYMGVhVkxDNzRZb3g4bTdlNUpTL2tONTZ2Znlq?=
 =?utf-8?B?QVVpU2RjeGhpTFVQRk8wV1lZNGNEZGx0ZFFPeUMwR2I3b3luUno2OXR4RDJM?=
 =?utf-8?B?MWFXOVNoMHRNenIxYkJwaUZ2MFBwWDJrSjE3N25CMVpsMUhoVjZ0RGNjUFpM?=
 =?utf-8?B?dEFrTy9hKzladENmTnc1V2d5Z2lsei9lYmVIc2M3NWlSMzRWZ0F5T3BwaER6?=
 =?utf-8?B?QnpFcTBqRERkR3B0cENOVzFiZkRCc2MxOXNtaHkwNTFvRG1QZzZha2VRNWxp?=
 =?utf-8?B?a1RENGdvSElEdjdpcFQxZDhVK0QzWmIyTTdRR2I5alI3NHVTU3J0UnRSdVhM?=
 =?utf-8?B?TzdJaGNjWjdoejJrME8zalBUZVhWQWRDNUszRGplZjF2bU4xVGhhS29OUU81?=
 =?utf-8?B?c3B1OVVGYzljSUhjeFhCUzdOVWpEbmhZWi9Ia0k5VEVacmMrUlJpZVFFKzhM?=
 =?utf-8?B?VlA5Ykhpd21TOURLak5LL3RITGVkNmYrSjdpZ0lqUjkySlF1MGpqUlNTL0c1?=
 =?utf-8?B?cXlGdTJ6REVXSjJkYUFVbGhsaHJnZFFkcUdQTnBROE5sTllQWmVsRWRFRVZK?=
 =?utf-8?B?Tng1b3o3VVhGNlFDclg4eGVvakp5Zm9LYmlNbW5pK3pSWURpTE1mYU5tYkF5?=
 =?utf-8?B?RmVUc0EvQldwNkNsa2YrUHl2REl3VGp6OU1NNlQ0Qk9ZUWlyY0lUbEsrTk9J?=
 =?utf-8?B?ZVNBU2xVc1pPS0Y5YkNSRHcyVUZPekpnYlhHOEVyMDRpZlIwd0Vtbi9zdTBo?=
 =?utf-8?B?UE11TmVTcW0wbDFYU1FqMUlMUGZxYlh1TXhjTmY1cllmQ2tlTEVhUlZ0aStm?=
 =?utf-8?B?KzZRWWwzT1NYVFUyWW9MbTFsK203T3ROV0JGWFVWMTR4bmp4YlRieGtKNFlB?=
 =?utf-8?B?TktVZnR4dTZxOVlpcnNhZXlSVXB5emxuZ0xzR0wvbnc5Tm8ya3R5Nm1SSU5s?=
 =?utf-8?B?TmlSMkZxRjc5UURabll0SitVZExTU1pFZkpNcnNMUkllb2JrYVJ5NVpyRW92?=
 =?utf-8?B?OU0xanpJL20wY0RpSDNiTEFRZzg0RmZjbzhKZjdtZldVU0M1WGVXd0tiU1pG?=
 =?utf-8?B?Wlk5dWt1Z1VjNWhjazlDS3k1eThBSUZxcFFyS1RzTVJBSEx0amtkVzhrMEcv?=
 =?utf-8?B?SHJTcWgvQkdrbzZQUGZGZ1ZMUThIT1dQM05zQ1p6eDJwUC94WVNGalBTOUdI?=
 =?utf-8?B?SlpCYndDZURzNEI2djVwalFhb3ZnNkZRcWFjdlQ2N3FZMHFUUTNsMGhGTEpP?=
 =?utf-8?B?YzJQQjNEZGZ2U25mVzM3TjdPcVk2QnhEL1h3UU1laHhxeWhEaEtaSVgwbFY5?=
 =?utf-8?B?UE5MbUs3Z2lpNm1MTkdmWERDNVJGVVJRT3VPLyt1dGdXV0loN3d6NFdNeFpH?=
 =?utf-8?B?Sm1CYUtZdVIyVGtTTGhaOVdhc1h0dTM1dGlGcG12YWxQREt6eUdSdWlNMy8x?=
 =?utf-8?Q?e0C2XH1Y0Buyw3z32wwFyII=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR11MB7779.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?QURZbE5iY1FMREF5OGVpRkVCeFFBZDBRV0VSSTFtRWNmS3d6RE5xZjJjSUVG?=
 =?utf-8?B?OFFKUW5mWVp1RFprdnViZG94dzhzazB5dDAza0tVVkZzdTVCdWU2TjlMbzQv?=
 =?utf-8?B?QU93TlNCaXZQY3ViR3luRng5TVlQT0tqMk1JK0Fmd1djUWhXZCtOY3dTdzZo?=
 =?utf-8?B?UVVxb044NTdFcU1MVEtxWWkvVnBzdWl4VHQ1ZlVDQ1NvcHFNd0s5UUtFUFFl?=
 =?utf-8?B?VHJ5WG5QNWtIU3l5dmRoaUYrOGNpK3JHYmh6SW1lcThReEx2RHNyS0JkbTky?=
 =?utf-8?B?OW9maWpPZ2szU0U4L0dTd0xyOVdKODdwLzZJOU04OGVoeTNQMEpQSTltMHNl?=
 =?utf-8?B?L2ZrcHR0Sjdzb0VzREVmYXo3bFNnS2FRSDcvRHVycGNkVlk2ZGk4SkRleDFp?=
 =?utf-8?B?QlBCTGJ6K2pVK3VGblA3QjhOZVk5NzNhN1ZuVzBjSE1qeHNVcjN0NWQzM0tI?=
 =?utf-8?B?MHNSd0QxUnd0ZzhVbnBYam5uaW5ERVBPQ2Y5Z2hBVzlOYXBKSXFqenJpZThH?=
 =?utf-8?B?dEhUK1dLZytzRWVEdTNqL09NLzl6TFFLeCtlNGhJMk1jelR4RzNNbld2aDhk?=
 =?utf-8?B?c3huRlZwTHViTG5xcDV4SXA1akZUaGY4d2ZHbGRScTZldXVQTGh3TzBraUZX?=
 =?utf-8?B?RjFST1lNRFh4UW82TUpNN0NERzdubVdZaUNja1lGbzZva1JLNFZYR0w5L1RD?=
 =?utf-8?B?UC92SkhUb2R1ZVJqVkNXQm8yUWg1UDgzeXVOdGNudEpGUnd0dG9MSng2QzdS?=
 =?utf-8?B?MkN0UDBIWWd1Q0psQXl2RzRRQmlnQ0JMcHVWSUlmS0tpRlN3ZWJ3UW55bko1?=
 =?utf-8?B?TEpOU252Q3FBTVk4YVFtQWp1UHlrZXNmTWVLUHhHNWcvTHNIWGRna2RSTVpG?=
 =?utf-8?B?dFVmMCsxdmp3OThKSUNuZzgxYW9HVXFhMHZvWWxjbUtuN0JTYkRBZW9pOHYx?=
 =?utf-8?B?TVEvYmpJNW42Nmw4d2JJUytDNVE2bnNRN1UyQXRWY1ZIalZOVXRKNTVpR3ZS?=
 =?utf-8?B?MFpXZzZDN0hYMG8yNHhsTWNBcHkyUG5UdkNuQW9rcWd3N2Z3Nmo0MUtDaUVm?=
 =?utf-8?B?OWd2aTVBdG85cWVJTU5RUXZLd0VlOVN6ZE1CL2gzQ3VJcE4ybFM5NU8wZ1do?=
 =?utf-8?B?S0ZIOVZVYVdRL2VBamlEQXNXaG52aFVQVUVSK2VPeG1qcXBjWHdpU3FhaERF?=
 =?utf-8?B?SVZCWDdnaDYyQ2VBYnQ2M0JuWFJhRGRPSm0rcko3eVRySVNCbWpsQm1lM1FP?=
 =?utf-8?B?REdoV2x2M0NMeGhSS1VoMHFnYlV6U2J1eC95RU5jWm56cGFWa1pyT1F0dlhW?=
 =?utf-8?B?cVZvYS9sZ1MvTi90bTJMMy90encxZ2hTTUVTbk9hUUlWR2tIekVZMlZaY0Fm?=
 =?utf-8?B?bEc2MnpMQTV6Tzh1bkFaYTljWDFuVU95aUxBSUlhZEJoUmM1YTdYeEY0Z0V6?=
 =?utf-8?B?aUp1ZzNvRm9sT0lyKzhpcjVJMmszZlY2S0s2aU5tL1EvYkp3S2VYVDNISU1Q?=
 =?utf-8?B?bkZZSHR1Qk1pKzI3UERRUlovL2JUTTVHeTdET2VMbGMrOXNNd3hUOVdZOXd0?=
 =?utf-8?B?dm5QMjVFSEp0b0didDVsOEZ3YzhIeWU0c3pwU1ZLRHFyc1hQUEVHOEIrRjFS?=
 =?utf-8?B?dUZmbmg5VkZnTENzWURNUmZJeXYxei9zN3M0Y3N5RTFoRnJQMStvRlk5ZCti?=
 =?utf-8?B?WWM5TCt5VUdSZkU1OE9IZDBiMUkzUUJ5VjR4Q3NsTWRnVUFDYUtabTVpRTE2?=
 =?utf-8?B?SGk1dytXWmw1Q1RzMzZJdnRGbHVNeEptYTFjNDRkYzUzdE15TzBENVZmdGZF?=
 =?utf-8?B?RDFvMmlSZk10bE94TTYrOXUvU1NsVEhYSVB5c0FaK1VLVjZ2UVdBbHBERCtr?=
 =?utf-8?B?WEZwRmtNQnF2RkM3T2FLWHduVXJBc09jQ25OSGN4ZG10TzVpRHFJM1pXcWh2?=
 =?utf-8?B?TGw0dVUwK0tCYUZtVkN1dHFtZmZVUTBtdjhob25kR1RaT1dkLzhvQUpFU2Fo?=
 =?utf-8?B?YWRmK3hLMG5UTnZvVEQ3NjdFWVlQQlZSRHlKSUc1T2xRYThZN1k4NDhHZ0pC?=
 =?utf-8?B?WUpRK3d1ZVZLUHRpOHh0OHo5eVlmcllSUGk2bWJvd2dxZ1M0V1ZXcVdDL1pH?=
 =?utf-8?B?b1RhWFlEeXFmQWdRTkw2K1g0QzlNaG5MT1ZoM0tLcUVtQTBmOHRyQ3V5bU5q?=
 =?utf-8?B?K0tGRG50MkRoVktkcGpkbXQyV3RUMnpUaTBwdjBMODFZQ1llbEdEWHB0R1g4?=
 =?utf-8?B?MkNzOVZuRUFSR2JSdDBsZGpXS2t6QitpZjFoMlpUYWY0TDBkN2NIN3NmWmR2?=
 =?utf-8?B?RUQzTHovMGFsMWtFeURNcXdFZmhFRXVsZFFkc3R1RkxhOWphWWlJQT09?=
X-OriginatorOrg: silabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33ed3c15-ccac-4c72-9200-08de6ae344fe
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7773.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 09:36:04.9849
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 54dbd822-5231-4b20-944d-6f4abcd541fb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IXZ4IS6Ze98MLAlJfdUVXBnmyb1Id5h81KrBLFnakz0y6wCB5kwenFXRYSKPIN8rNbEDAGaUS/Xc3tLK3wh/zA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7377
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEzMDA3MyBTYWx0ZWRfX7Q/qQPqPP6g9
 4q8MCL3eyYvjHnHoII+3WwmcR6kIBm2m7qjrBB4loaVjCfSk+iU4HFualzOo2UjNdEvadyatGKl
 wEs2zTudXcu2mf8mJbqtDF+HhbmABuhdLdcNt5hIYN4k4nig8+3Ujzcpd4DLNUrOCgkauMRvi3o
 WRBQV63nRSETzm08ZiXfrNCXZjFiDPZAulAMP/Ajqp+Tu+j3ZlNW4aQ+SMLNz5NV5ecXjeIUaeJ
 Fmf3Jo2XWpf3mpIY8ew5bB9/9JGh9vjhYF/Rsot/K7pFqCDgHe8Ohd2jH9CZzNkcuAXF3QJTgux
 u2fI4Z9BZhx202k6i4sJAJFxsHxUnanWFl1mYPNBKiN0HhGvQLvJCthMbqo2yVXv+56m5tWjgTw
 CEOq+RobZWbHrBK7g+n+Sat1PSxqmSI+XhkuJ3nQZZ2ILseMV/vCzLdgmxjg89rx11okiUcvFmI
 dz6j8dsFQVD5yNcYzeQ==
X-Authority-Analysis: v=2.4 cv=DtRbOW/+ c=1 sm=1 tr=0 ts=698ef087 cx=c_pps
 a=7Kp79o39qosEjZWU4lqIzQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=M51BFTxLslgA:10
 a=i1IsUcr2s-wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=2AEO0YjSAAAA:8 a=VwQbUJbxAAAA:8
 a=mc-KWKTqUpuMZe8AUEsA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: lXnKO8P-_VDxWyX95U2M9UJRa_DaYAi-
X-Proofpoint-GUID: lXnKO8P-_VDxWyX95U2M9UJRa_DaYAi-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-13_01,2026-02-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602130073
X-Spamd-Bar: ---
X-MailFrom: prvs=05048d6178=jerome.pouiller@silabs.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: SAQXVBZBNEJORYOKA5ALYAFDHNX3D5HK
X-Message-ID-Hash: SAQXVBZBNEJORYOKA5ALYAFDHNX3D5HK
X-Mailman-Approved-At: Fri, 13 Feb 2026 10:10:39 +0000
CC: Silicon Labs Kernel Team <linux-devel@silabs.com>, Gabriel Beaulieu <gabriel.beaulieu@silabs.com>, Damien =?UTF-8?B?UmnDqWdlbA==?= <damien.riegel@silabs.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v3 14/14] greybus: cpc: add CPC SDIO host driver
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/SAQXVBZBNEJORYOKA5ALYAFDHNX3D5HK/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Transfer-Encoding: base64
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.68 / 15.00];
	DMARC_POLICY_REJECT(2.00)[silabs.com : SPF not aligned (relaxed),reject];
	R_DKIM_REJECT(1.00)[silabs.com:s=pps12202023,silabs.com:s=selector1];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	R_MIXED_CHARSET(0.59)[subject];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	GREYLIST(0.00)[pass,meta];
	HAS_ORG_HEADER(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[jerome.pouiller@silabs.com,greybus-dev-bounces@lists.linaro.org];
	DKIM_TRACE(0.00)[silabs.com:-];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	TAGGED_RCPT(0.00)[greybus-dev];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: AAA77134E69
X-Rspamd-Action: no action

SGVsbG8gRGFtaWVuLA0KDQpPbiBUaHVyc2RheSAxMiBGZWJydWFyeSAyMDI2IDE1OjQzOjUyIENl
bnRyYWwgRXVyb3BlYW4gU3RhbmRhcmQgVGltZSBEYW1pZW4gUmnDqWdlbCB3cm90ZToNCj4gRnJv
bTogR2FicmllbCBCZWF1bGlldSA8Z2FicmllbC5iZWF1bGlldUBzaWxhYnMuY29tPg0KPiANCj4g
VGhpcyBpbnRyb2R1Y2VzIGEgbmV3IG1vZHVsZSBnYi1jcGMtc2RpbywgaW4gb3JkZXIgdG8gY29t
bXVuaWNhdGUgd2l0aCBhDQo+IEdyZXlidXMgQ1BDIGRldmljZSBvdmVyIFNESU8uDQo+IA0KPiBN
b3N0IG9mIHRoZSBjb21wbGV4aXR5IHN0ZW1zIGZyb20gYWdncmVnYXRpb246IHBhY2tldHMgYXJl
IGFnZ3JlZ2F0ZWQgdG8NCj4gbWluaW1pemUgdGhlIG51bWJlciBvZiBDTUQ1M3MuIEluIHRoZSBm
aXJzdCBibG9jaywgdGhlIGZpcnN0IGxlMzIgaXMgdGhlDQo+IG51bWJlciBvZiBwYWNrZXRzIGlu
IHRoaXMgdHJhbnNmZXIuIEltbWVkaWF0ZWx5IGFmdGVyIHRoYXQgYXJlIGFsbCB0aGUNCj4gcGFj
a2V0IGhlYWRlcnMgKENQQyArIEdyZXlidXMpLiBUaGlzIGxldHMgdGhlIGRldmljZSBwcm9jZXNz
IGFsbCB0aGUNCj4gaGVhZGVycyBpbiBhIHNpbmdsZSBpbnRlcnJ1cHQsIGFuZCBwcmVwYXJlIHRo
ZSBBRE1BIGRlc2NyaXB0b3JzIGZvciBhbGwNCj4gdGhlIHBheWxvYWRzIGluIG9uZSBnby4NCj4g
DQo+IFBheWxvYWRzIHN0YXJ0IGF0IHRoZSBiZWdpbm5pbmcgb2YgdGhlIHNlY29uZCBibG9jayBh
bmQgYXJlIGNvbmNhdGFpbmVkLg0KPiBUaGVpciBsZW5ndGhzIG11c3QgYmUgMzItYml0IGFsaWdu
ZWQsIHNvIHRoZSBkcml2ZXIgdGFrZXMgY2FyZSBvZiBhZGRpbmcNCj4gYW5kIHJlbW92aW5nIHBh
ZGRpbmcgaWYgbmVjZXNzYXJ5Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTogR2FicmllbCBCZWF1bGll
dSA8Z2FicmllbC5iZWF1bGlldUBzaWxhYnMuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBEYW1pZW4g
UmnDqWdlbCA8ZGFtaWVuLnJpZWdlbEBzaWxhYnMuY29tPg0KPiAtLS0NCj4gQ2hhbmdlcyBpbiB2
MzoNCj4gICAtIHJld29yayBkZWZpbmVzIHRvIGdyb3VwIHRvZ2V0aGVyIGFkZHJlc3MtcmVsYXRl
ZCBkZWZpbmVzIGFuZCByZW1vdmUNCj4gICAgIG9ycGhhbmVkIHZhbHVlDQo+ICAgLSByZW1vdmUg
dHJpdmlhbCBjb21tZW50cw0KPiAgIC0gYWxsIFJYIGFuZCBUWCBhcmUgbm93IGRvbmUgZnJvbSB0
aGUgd29ya3F1ZXVlLiBJbiBwcmV2aW91cw0KPiAgICAgaXRlcmF0aW9ucywgdHJhbnNmZXJzIGNv
dWxkIGVpdGhlciBiZSBkb25lIGZyb20gdGhlIHRocmVhZGVkIElSUSBvcg0KPiAgICAgZnJvbSB0
aGUgd29ya3F1ZXVlLg0KPiAgIC0gcmVtb3ZlIGVycm9uZW91cyBTRElPIFZJRC9QSUQNCj4gICAt
IHJlbW92ZSBwYWRkaW5nIGJldHdlZW4gaGVhZGVycyBhbmQgcGF5bG9hZHMgd2hlbiBhZ2dyZWdh
dGluZw0KPiANCj4gQ2hhbmdlcyBpbiB2MjoNCj4gICAtIGNoYW5nZSBmb3JtYXR0aW5nIGZyb20g
JWx1IHRvICV6dSB3aGVuIHByaW50aW5nIHNpemVfdCdzDQo+ICAgLSByZW1vdmUgIi8qKiIga2Vy
bmVsLWRvYyBtYXJrZXIgZm9yIHN0YXRpYyBmdW5jdGlvbnMgbm90IGFjdHVhbGx5DQo+ICAgICB1
c2luZyB0aGUga2VybmVsLWRvYyBmb3JtYXQNCj4gICAtIHJlZHVjZSBoZWFkZXIgaW5jbHVzaW9u
IGxpc3QNCj4gICAtIHVzZSByZXZlcnNlIGNocmlzdG1hcyB0cmVlIHZhcmlhYmxlIGRlY2xhcmF0
aW9ucyBjb25zaXN0ZW50bHkNCj4gICAtIHVwZGF0ZSBhZ2dyZWdhdGlvbiBmdW5jdGlvbnMgdG8g
dHJ5IHRvIGJlIG1vcmUgbGVnaWJsZQ0KPiAgIC0gdXNlIGRlZmluZSBpbnN0ZWFkIG9mIGNvbnN0
YW50IHZhbHVlIDB4MEMgZm9yIHRoZSBhZGRyZXNzIHdoZXJlIHRvDQo+ICAgICByZWFkIHRoZSBu
dW1iZXIgb2YgYnl0ZXMgdGhlIGRldmljZSB3YW50cyB0byBzZW5kDQo+IA0KPiAgZHJpdmVycy9n
cmV5YnVzL2NwYy9LY29uZmlnICB8ICAxMiArDQo+ICBkcml2ZXJzL2dyZXlidXMvY3BjL01ha2Vm
aWxlIHwgICAzICsNCj4gIGRyaXZlcnMvZ3JleWJ1cy9jcGMvc2Rpby5jICAgfCA0ODAgKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4gIDMgZmlsZXMgY2hhbmdlZCwgNDk1IGlu
c2VydGlvbnMoKykNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dyZXlidXMvY3BjL3Nk
aW8uYw0KPiANClsuLi5dDQo+ICtzdGF0aWMgY29uc3Qgc3RydWN0IHNkaW9fZGV2aWNlX2lkIHNk
aW9faWRzW10gPSB7DQo+ICsJLyogTm8gb2ZmaWNpYWwgSUQgKi8NCj4gKwl7IFNESU9fREVWSUNF
KDB4MDAwMCwgMHgxMDAwKSwgfSwNCg0KQ2FuIHlvdSBwcm92aWRlIHNvbWUgZGV0YWlscyBhYm91
dCBob3cgaXQncyB3b3JrPyBJIGFzc3VtZSBTaWxhYnMgc2VsbHMNCk9FTSBwcm9kdWN0cyBhbmQg
ZWFjaCB2ZW5kb3IgaGFzIHRvIHNldCB0aGVpciBvd24gVklEL1BJRCwgdGhhdCdzIGl0Pw0KDQpJ
IGFzc3VtZSBTaWxhYnMgYWxzbyBoYXMgc2FtcGxlcyBwcm9kdWN0cy4gSG93IGl0IHdvcmtzIGZv
ciB0aGVtPyBJcw0KdGhlcmUgYSBkZWZhdWx0IFZJRC9QSUQgb3IgdGhlIHNhbXBsZSBmaXJtd2Fy
ZSB3b24ndCBjb21waWxlIHVudGlsIHRoZQ0KdXNlciBjaGFuZ2VzIHRoZSBWSUQvUElEPw0KDQpJ
biBhbnkgY2FzZSwgSSBiZWxpZXZlIHdlIGNhbid0IHB1Ymxpc2ggYSBkcml2ZXIgd2l0aCBWSUQg
PSAwLg0KDQooQlRXLCBJIHN1Z2dlc3QgdG8gaW5jbHVkZSBsaW51eC1tbWNAdmdlci5rZXJuZWwu
b3JnIGFzIHJlY2lwaWVudCBvZg0KdGhpcyBQUikuDQoNCi0tIA0KSsOpcsO0bWUgUG91aWxsZXIN
Cg0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpncmV5
YnVzLWRldiBtYWlsaW5nIGxpc3QgLS0gZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpUbyB1
bnN1YnNjcmliZSBzZW5kIGFuIGVtYWlsIHRvIGdyZXlidXMtZGV2LWxlYXZlQGxpc3RzLmxpbmFy
by5vcmcK
