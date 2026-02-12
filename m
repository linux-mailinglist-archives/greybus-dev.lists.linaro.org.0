Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KOUVBX/njWkm8gAAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Thu, 12 Feb 2026 15:45:19 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 898FB12E6F1
	for <lists+greybus-dev@lfdr.de>; Thu, 12 Feb 2026 15:45:18 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 8BB41401DB
	for <lists+greybus-dev@lfdr.de>; Thu, 12 Feb 2026 14:45:17 +0000 (UTC)
Received: from mx0a-0024c301.pphosted.com (mx0a-0024c301.pphosted.com [148.163.149.154])
	by lists.linaro.org (Postfix) with ESMTPS id 70A48401F0
	for <greybus-dev@lists.linaro.org>; Thu, 12 Feb 2026 14:44:23 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=silabs.com header.s=pps12202023 header.b=nWaFPePF;
	dkim=pass header.d=silabs.com header.s=selector1 header.b="L7/xa1do";
	spf=pass (lists.linaro.org: domain of "prvs=050394110d=damien.riegel@silabs.com" designates 148.163.149.154 as permitted sender) smtp.mailfrom="prvs=050394110d=damien.riegel@silabs.com";
	arc=pass ("microsoft.com:s=arcselector10001:i=1");
	dmarc=pass (policy=reject) header.from=silabs.com
Received: from pps.filterd (m0101743.ppops.net [127.0.0.1])
	by mx0a-0024c301.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61C2Lwnd2678544;
	Thu, 12 Feb 2026 08:44:12 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps12202023;
	 bh=aPf7r0pvtLQO4j6vrxILj6YISgls6NkTAAtXLXqgDdE=; b=nWaFPePFH5yl
	Lo0nQCN9G+2zMyfJBsq7LGO9WQb4XH3QixNLy3SPkbtpIbQ4pDcRTYY5J2MhZJJv
	QO0yGDkZw29/pOh/NPTuU3MqAcpqoSlbxSdDcPfpdkGReG8rwF02qpvEFzuDYj9W
	jBQyqcUkuUYe5bbfztdoNo4TH3yc71+6Z2Jf3K+hvisvsFwUCOdrFBhqZeeSjJdI
	YiNqJWX0oRRggNp14BzIYfZaC1AXnpowxKpVMRr+KwI1UZns4faeLrYPgtPp3C/v
	05SvjLoqGCs9EnuYZu86Z+W16DC6aJ8eaxSvpRn9OiHTtin4kOyzPm+aRl6HaKRW
	3igr9JLNJQ==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11020096.outbound.protection.outlook.com [52.101.61.96])
	by mx0a-0024c301.pphosted.com (PPS) with ESMTPS id 4c92uysn4e-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 12 Feb 2026 08:44:11 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hvkK1Rm1T9/ILt2JMHtvHMYcB6uwJHAz8vXR6rwA051aLIwuVKT5YhwdD0qKlzLpflKFe4LGwWrZBqX0Cgzk3E3Hni+hZazdkQxD31sZJA1jz5oUrfODVciRPjfKiTKib9mJ7ZTnhlBYC6f1VzVwPQmKtNnjI0+w5WagFEp76TlLt8kpd3KC36xHiGQJhKjhVQgMRwDqlrbJNizH4ihb+zEpp5YXN3zg1JA2C5fMiksrq+r49Fk1jz/vXFNLpd9KQKr6IBFqTP91HXOmLB3/OK/LsxTn2bOwglHpbGWeQlJL4uKqHdoWNuIYCCT1g4LogeLfOBU/AbTwcHoIP3fzuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aPf7r0pvtLQO4j6vrxILj6YISgls6NkTAAtXLXqgDdE=;
 b=Q+7KRajSZSkIagHHZu8maLqYYxnY5ti1xK64eIW7dzS22P8JuzsQ1j1AESo7nKoIsiQoq1wL3AK0MJUrXjaTapOBG43+O8SLrcWxEIwMOxrNGTxQnXqyVJOn/3YK/UYz2XnYskeMRmGotRxqrRHK4XQ3WrzjmePL6jFJrFedgRkvLhRHwUS1MUO9pp9Ca6P8Uf0fC0SjnQFwyttCOFSARM8TBZm2b1p/sFD/mtmivH/wg0AZXdeA3jdiGKasL7lFNo6R1xIY9WVZv6qrB9Mk761H/uhPidKj7BgNZS0F+qvnl7l9dik3YUpu1c5+DIZQjWQC1aZULEnyZGe2YgQNQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silabs.com; dmarc=pass action=none header.from=silabs.com;
 dkim=pass header.d=silabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aPf7r0pvtLQO4j6vrxILj6YISgls6NkTAAtXLXqgDdE=;
 b=L7/xa1doB+yGw9MCpGosZn+/NqM6GJLZbQkHwmpS5K4pkAcMCMnUYq1Z1bfdGUrGVtIwaNMV52k58qpcMtQzr0RPPWwBg+qF0Zod6dVPVbxvy05lRC4qwVKuGkG88hIpyYzaMsn0YO3Kc0brl5i0NnsZbt1Ydro2W7bwKIyMsVU=
Received: from DS0PR11MB8205.namprd11.prod.outlook.com (2603:10b6:8:162::17)
 by LV8PR11MB8486.namprd11.prod.outlook.com (2603:10b6:408:1e8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Thu, 12 Feb
 2026 14:44:08 +0000
Received: from DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::2de6:bc88:2af7:3583]) by DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::2de6:bc88:2af7:3583%3]) with mapi id 15.20.9611.008; Thu, 12 Feb 2026
 14:44:08 +0000
From: =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
To: greybus-dev@lists.linaro.org, Johan Hovold <johan@kernel.org>,
        Alex Elder <elder@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org
Date: Thu, 12 Feb 2026 09:43:41 -0500
Message-ID: <20260212144352.93043-4-damien.riegel@silabs.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260212144352.93043-1-damien.riegel@silabs.com>
References: <20260212144352.93043-1-damien.riegel@silabs.com>
X-ClientProxiedBy: YQBPR0101CA0124.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:5::27) To DS0PR11MB8205.namprd11.prod.outlook.com
 (2603:10b6:8:162::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8205:EE_|LV8PR11MB8486:EE_
X-MS-Office365-Filtering-Correlation-Id: a129b1ed-30a2-4675-f6da-08de6a452cca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?S0ZITEpYcjVSMEI1N2p3Y0Y2dXNJYnlJaWhhSTJsQUFoeXhlellrQVdzNllM?=
 =?utf-8?B?V0JoSUxWdFI4RVJQMnBDVzYyejdiR0JFb3F1RlY1VHArT2R5ei9ka2U2WkVX?=
 =?utf-8?B?UXNNbktwVjBMYlFjYVBIY0srYjBSaERiT2FyYW90TWsvRHBFWlFXcW5Lb1N0?=
 =?utf-8?B?c3hlNTBRRDhXazZKWlc3L1BoajlsNCt2cEl1Tkh2Qk9UQlFaZFdEWEJmMjli?=
 =?utf-8?B?eGZUdnJZdzUwTUVSM29iM2t5ejQyaEZYZTdDVGNSajV4VzUyUFYxMEFsZ3Fi?=
 =?utf-8?B?dE16L21RSzBCZ2w2ZVhKS2hEZkJlaHhjWU90SURIRlJCRGRNTk1FdjdEc1c3?=
 =?utf-8?B?NGRKNUNsT0hhcmxWNUh5di9QUHBxd2k5WkR0L1kzMjBLaVd1TC9iK3lyN0lK?=
 =?utf-8?B?M1VLbTVYdWIxNlBsRE9PR1F2YUhibDVvVTV2TG1NNnJYQkY2L0FqcjhnM1dJ?=
 =?utf-8?B?eDBLWGlITWloMzFBbzdYWUhGbGQxUDdSTDZiNUN5emFRMWNGbUtLcGFIdzZ2?=
 =?utf-8?B?dkhQdDZlRTJWVUtMWEZIeUpVVis4V0pWSlNaVFVxenEzd2VHVTVTMkVqelhI?=
 =?utf-8?B?QjZYenU2S3BRSDFkRFZSQ01FSnM4WDk5SUpWSjRWWnpITTN5RGxVcFAvL1o2?=
 =?utf-8?B?c0NKVnh2OTV6bTFxeHVpU1l4WnphWjlKdjFKOTE1ai9ad1BLTTBGSEU5REcw?=
 =?utf-8?B?TmRoNnNmOGJyOGM0aXd3RG5LYWc5YTNtMTgyaGpnK3hmcGRCNmNJYVBPU0xt?=
 =?utf-8?B?aUhWMWMxNWlZN2g2eWFuMGVlMVVLVW5LMkIwYkx3Mkp6cUxZakRyVHgyenZL?=
 =?utf-8?B?emVBL0xraGJQVHVNb25uWDZVUGxDNHp2ejBDdjVweGdMNlIwaWliSVMrZjk0?=
 =?utf-8?B?SXRHbi9CcWtvRWl0SFlqK3hDdzZzN0JMTFBxay9sUk9sbTNWOGlqbkdNM3RY?=
 =?utf-8?B?ZllXT2FYQTlXRnYyZEdhZ3E4WjZkdHowdThpRGc0M1l1amswM2NBbm15alJ2?=
 =?utf-8?B?VDFadVdXZlk0bzlpblhlc2Y3NDNxODdJbkRIS05zV0FJSVUwb3c3blVwOWhG?=
 =?utf-8?B?MG9ONVAzalF6UTJDVVpwUVZLVnB5Ri82ckJzcWZMNUZWczRnd3laU2YzUkZB?=
 =?utf-8?B?L2R5YldPWG5vREYxLzE1TDM3ellEeURHSjQ0RVNmUjU0MXhSM1dNN0xVdkFt?=
 =?utf-8?B?U0pEZW1OVkxKVXdIWnByUE5rcWhhdGdNL0JET1QxQmVYTDY5TVVxSzhHTFc4?=
 =?utf-8?B?M0dLcUhjNCtGRWJKOGpoaTdWSmFuTXR6cFpDelE4bk1sNHhVa0dyV24zYmRS?=
 =?utf-8?B?R1paS1B1Rm1hWWJFSWFzMENqRlZXRHl4dDFDenJuNjl2bjd3T2JibXRjVUxS?=
 =?utf-8?B?YThEU0FMdzNja2Z0a0o2YkRDM1JmQ2o4SDF1SEcwaHBDU3ptazhjMFpGa3NG?=
 =?utf-8?B?TUQ2TnBoVzBrcUEzbmIxNmhLMmJZdUlpTUFLV05sRDV3ZmFqZWRycmRMRjBt?=
 =?utf-8?B?eHl4WlRsY0FzSTZ6YjVMT1ZWZlZYTG9Vc21RWnNpQkNrY1ZrQjd3ZHZXeWVl?=
 =?utf-8?B?M0F6STE0Snpya2Z2MzVtbU8zSktvOFF5VHdqSWxJQ0xtL2FjQVJQV3JPeERV?=
 =?utf-8?B?ZFhJQXN0enMzcWlBaUo1a3FVYndFSFloajhGR2VMZDhmaHBoMUEvNEhMRk8r?=
 =?utf-8?B?d0UyRXB0VUJrWHNMU01CYnFSM2RaOTBlUC9pdGFmRElLNDZMOFVEWlFZcmVn?=
 =?utf-8?B?SzJObkJXRWQzZWxuTzdXdVJmK216SVVVdzVvK0dWOXNhRmtNMVVhUHd4TXRF?=
 =?utf-8?B?NkIvYWdYb2ZqVDNzYjRWWHpLRkJpK1V2Rk1nbUlTKzltM0pScEc5U2hEd3VJ?=
 =?utf-8?B?bFhPOEREMWpianFkcGlmYzhjK3JuS1pUQTV6QkJnK2N1UVVtTWFaOUVRaWhw?=
 =?utf-8?B?bHY0WnlXaWhmbGRRTFYvVjJ0QktRYnE5VlZIMTR2NVhjeFJkbzdOUUJwRXlY?=
 =?utf-8?B?V3FpeWVsS05TcjBFTVhDcENRdjJIVzhNWW00TjQzZ1AyWFZjWUxLeTQ5ZFlN?=
 =?utf-8?B?eXg2VStJSndvN2E0Z0lPSEE1ZlorR0dTalRkbWgvMkhUSXR6ZEIyY0lEWlM1?=
 =?utf-8?B?M3BmT3F6MnBnVW90NHQ3QXV5ald3aWRTa2FTcmQydFVYVU5qbVBJRTV2UFpI?=
 =?utf-8?Q?ecpS4HMHCDc6kcFmLWJ1XxU=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8205.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dC9NcjE5L0lEeWJzNEJ1Rm9vSUFOaFJRcE9XZEVVZG5IbVVvR2Yyd09VZkhB?=
 =?utf-8?B?blBNQUdUcGdTR29uUXFLTHAzYlRDc3JMc3J4OVdmZnpXOVVoZTREWENPRDVE?=
 =?utf-8?B?bWpUd0NIZTlraXJHOGpXaTl0aDdoeUR1QWNid2dhN1RueEFvM2ZMNkNRY1NQ?=
 =?utf-8?B?bXE3MjA3V2I3RitvTXdKWUNGbUU2YXNsbitqakxkWCszLzlLa0VlWVo5S0Mx?=
 =?utf-8?B?a0JLWk1uQllxS2hlRU9oMWtmeDJJbVdnMmdsMkI1TDgwaEI0SU84MTZLRXYy?=
 =?utf-8?B?anRRdmhUMUhpUkNhbDNTYTYvVk5ZQzRiMnBrcjdWbGtnV1AvYTVuZDVjdysv?=
 =?utf-8?B?eGExdmZIaURvbElzRTJUV2l0RVRmYmtzYnlscU5LZ0hiT2tsV1d3aDV5MEVJ?=
 =?utf-8?B?RGV1OThpZVI2bi84L2RPd3gzbXZtZCtIeGFySk8vZU5nbDh1UXU0TGhOZTRT?=
 =?utf-8?B?V3d6aStzbVN2bEJnanVaZUw5M1hsdWlNdUl5b1lYbm40MkZINkZtK2syOGtQ?=
 =?utf-8?B?QVFxdDZ3Ui82ZnZTeXVuSTlnU092TnEvMDhicms0OWgydGJnZ3JSOCtlOU1C?=
 =?utf-8?B?QzF4K0VjQ0JSejZsT3RlMno1ZlVZYWZYMENJelF5dk9BbU1ibEVrekZtMzd5?=
 =?utf-8?B?bjRkek5VUDExRTEyZm53WjdydC82WGhoL1RKUUd3SkNzbmUzdHRCdnNXeGxL?=
 =?utf-8?B?TkpxMlBuZG1jQ1FQMDE2Z0dPaWsxUkdJYkp4SVpTdUpYcC83UzdKNnczbnZU?=
 =?utf-8?B?K25XenV3YXFOU1pEeDVrdXowVnc3T1ozaDZucmNKdW9rNFVzaFdESW93V2lE?=
 =?utf-8?B?U2psVTluS3lHZmdLNFlQdkplV3doNE90bFZ1SzdRYng4OE1EdEdjalAwdnpN?=
 =?utf-8?B?Wk5yRnF5YjA3STVjTmZnS2RoUG91a1QzcURBaFpGTFlXMXNkZ1hLL0hwSFpP?=
 =?utf-8?B?aS8rQnArY1JmTmZJeHF2aVQ2TDF1U3kxbnFHZzFOYWs4VmtTeTBtZzFJa01M?=
 =?utf-8?B?S3hPT3BvYWQraElNTDdnVmdSWTVCaEdDVlNBV3RTNWdjOUdRZTNMN0pmRi9r?=
 =?utf-8?B?dEQyNVpiNmw2NTFrZ0wyTXR6NHFsQjdLNWJzRitqQk1RN1BMS3JTLzczMnQw?=
 =?utf-8?B?TkJBWXNhbWJkQkhxeTYvTGowNHBibzhoa3JPOERVdmoyQnE3YU9hYzFyajdl?=
 =?utf-8?B?SXhqbkNkWDZCNUFaaW9TWEplb2lJb3ByaHRaaU45RG85cHYyYmlSNG05WUQr?=
 =?utf-8?B?RDd0eVdPeEp0TFRTMXc4OWF5R2JOZlFVWjN3UHFRMlliYzFSMDdYb2QwMDIw?=
 =?utf-8?B?UkFxRHBxeXBoeGhNZHJVT2VmT0w5Zkhna25HenNmVTR4NENLVUVhY0MycEsr?=
 =?utf-8?B?d2lNTzRaU3RTT2FlQTVhZStkVlkzKzRxRGNGV0JiSmdrYnlYV1dhcTJUb0to?=
 =?utf-8?B?aHlPdkY0Nm00UHpqUkRVKzd1QU95RGJPMDI5Wno0eXREZmdiYi8yRksrWSs3?=
 =?utf-8?B?cXVuMjZRVnRhUUNnVDF6RXpmWUdwSit2SjJhdUx6OFI5YlFKZGljNTFLeXVQ?=
 =?utf-8?B?UVl5NnBhRWJoTExDL2xJWnBPNldyaVBNVEdEbzE1OUJLYkQxTUhxc2UyamMz?=
 =?utf-8?B?U1VtbGJ4N2RHWlMwdWszdDdjMHNLaGpGT1hpUXJyYjJ6NjBUNWhDS29UdTh0?=
 =?utf-8?B?Q1lET1AwT2ZXNmRZNTFIa0phcTJ6SWdzazhHUWc0ZjgzRFZxdmdzSVNMOHJW?=
 =?utf-8?B?QUh4V3h0TnozSGFuOXgzTURYTFBHaUIvSHBIMy9hTkVjR2t2NlNHckFIV29U?=
 =?utf-8?B?R1JHR1VGNklBK21xOVNmTFhUbHR1K0p2bDhVMXBacHRIaUFlZUVFNDVLcktV?=
 =?utf-8?B?dTJnQkYvYnFnZlM4cXR4L2pORmtLYjF6SVFWOTNVaFZIZVJ4OW1UYzFrQzBU?=
 =?utf-8?B?WjNsRTVONHNXVlc2NlZSMEhPV21rSVdxOEoyLzhPRUdBZHBDMmVYdHVrb1VW?=
 =?utf-8?B?S1gzbkdXOWVwdllkNXRXWUphQ0U4clI5aHdEYjArSmRtWFhmZWc1cHVzNUV1?=
 =?utf-8?B?WXQ1QUk4S3dGK2tTUEZNT1hnamI2anZMWk9sMnVZaHE2eVJJOWNjYmEvbkls?=
 =?utf-8?B?eWdnd2FibmN6RWxya0wvUkxKb0dlTGI0eUdhR1NCZUhxdncyNGFoTTJuOTJa?=
 =?utf-8?B?TzEwV0tVMllBRWxvdGxtU0h4TjF2TkY0MHJveFphY0UxdS9YV0NhZk1MMkJV?=
 =?utf-8?B?STZBcGdwSmhVY2puaFFxQXhGZmlxV0JZN0Nvam5DaHo4WjFEbHZoOGlReTU0?=
 =?utf-8?B?NDg2WG13cGRjVjc5OWlKSEY0S1JoWWN3bkNLQ2lvRmYzUVJTTWg1Zz09?=
X-OriginatorOrg: silabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a129b1ed-30a2-4675-f6da-08de6a452cca
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8205.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 14:44:07.1115
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 54dbd822-5231-4b20-944d-6f4abcd541fb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 05y13U2cn0wZC/D5ml4qc9Dyf6P8jTA/fjmLf72+/MsGRZgQGWZxRG6U78BEeyJQA5zcTLk8+F1HQMuTDxwTKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8486
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEyMDExMSBTYWx0ZWRfX6hnA65rMgK0O
 9gU6/kccLIBE2ISfzSGrZEhv7NvEOhNQisEzZrzZpGoFQRkH7oaqXz4MPV/kEo3D5BUv+dc4fwk
 hngV4I4FX/9Nb8rEtBSzju1mnCx+AjSAasmwl2fZ0shlNJ/TWBnbc/jkIXTpPfmqG8fNHAXsKR9
 66lj3gqCL4tSd/XWgRXIDObhgObW2h/E3iGV8YtKFkbTAFd4gDWVMDfWPenmtwN2/DQTxatfUtb
 VTouEQaswhFwabY3WNRGzmgJx8SAD7w7LI7AU/bbz/YJckmvNX6drZ1GbkKTc1sAQ56wE+/Fu5x
 VZgvLtFs8XVWHfGBnSHZrLkVBvULanjlnhEzFHDVSW5eG6JL+rrtk8ADZEVk9ihE3mh9QWxS8I+
 u2mETFjX6rV0i5lc1QT+fF8mh2b5h5hM1pMjUsBYpBe9wZOncUhfVsmm18QMdQ27vw3YVBiwVdR
 PGvged2B6d4ig9OQ3og==
X-Authority-Analysis: v=2.4 cv=DtRbOW/+ c=1 sm=1 tr=0 ts=698de73c cx=c_pps
 a=TvliyZNEFSK35vtP2Nadqg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=M51BFTxLslgA:10
 a=i1IsUcr2s-wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=2AEO0YjSAAAA:8 a=UI2V7ICqOKO9W4d5kokA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: bwWeoJVdo_77apd-QIEqZHrVgG5GEkPr
X-Proofpoint-GUID: bwWeoJVdo_77apd-QIEqZHrVgG5GEkPr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_04,2026-02-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602120111
X-Spamd-Bar: ----
Message-ID-Hash: 5EAKF3CBB7HRNFZN6RR66T5IJNVNA6H3
X-Message-ID-Hash: 5EAKF3CBB7HRNFZN6RR66T5IJNVNA6H3
X-MailFrom: prvs=050394110d=damien.riegel@silabs.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Silicon Labs Kernel Team <linux-devel@silabs.com>, =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v3 03/14] greybus: cpc: use socket buffers instead of gb_message in TX path
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/5EAKF3CBB7HRNFZN6RR66T5IJNVNA6H3/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.59 / 15.00];
	DMARC_POLICY_REJECT(2.00)[silabs.com : SPF not aligned (relaxed),reject];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	R_DKIM_REJECT(1.00)[silabs.com:s=pps12202023,silabs.com:s=selector1];
	MID_CONTAINS_FROM(1.00)[];
	R_SPF_ALLOW(-0.20)[+mx:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	GREYLIST(0.00)[pass,meta];
	FROM_NEQ_ENVFROM(0.00)[damien.riegel@silabs.com,greybus-dev-bounces@lists.linaro.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[silabs.com:-]
X-Rspamd-Queue-Id: 898FB12E6F1
X-Rspamd-Action: no action

Q1BDIGNvbWVzIHdpdGggaXRzIG93biBoZWFkZXIsIHdob3NlIHN1cHBvcnQgaXMgYWRkZWQgaW4g
YSBmdXR1cmUgY29tbWl0DQpvZiB0aGlzIHNlcmllcy4gV2l0aG91dCBza2IsIHRoZSBDUEMgaG9z
dCBkZXZpY2UgZHJpdmVycyBoYXZlIHRvIGdldCB0d28NCnBvaW50ZXJzIHRvIGdldCBhIGZ1bGwg
cGFja2V0OiBvbmUgcG9pbnRlciB0byB0aGUgQ1BDIGhlYWRlciBhbmQgb25lDQpwb2ludGVyIHRv
IHRoZSBHQiBtZXNzYWdlLg0KDQpJbiBvcmRlciB0byBtYWtlIGltcGxlbWVudGF0aW9ucyBzaW1w
bGVyLCBjb252ZXJ0IHRoZSBHQiBtZXNzYWdlIGludG8gYW4NClNLQiBpbiB0aGUgYG1lc3NhZ2Vf
c2VuZCgpYCBvcGVyYXRpb24uIFRoYXQgd2F5LCBDUEMgaW50ZXJuYWxseSB3b3Jrcw0Kb25seSB3
aXRoIFNLQnMsIGFuZCBvbmx5IGNvbnZlcnQgYmFjayB0byBHQiBtZXNzYWdlcyB3aGVuIG5vdGlm
eWluZw0KR3JleWJ1cyBjb3JlIHRoYXQgYSBtZXNzYWdlIGhhcyBiZWVuIHRyYW5zbWl0dGVkIG9y
IHJlY2VpdmVkLg0KDQpTaWduZWQtb2ZmLWJ5OiBEYW1pZW4gUmnDqWdlbCA8ZGFtaWVuLnJpZWdl
bEBzaWxhYnMuY29tPg0KLS0tDQogZHJpdmVycy9ncmV5YnVzL2NwYy9jcGMuaCAgIHwgMTEgKysr
KysrKysrLQ0KIGRyaXZlcnMvZ3JleWJ1cy9jcGMvY3BvcnQuYyB8IDExICsrKysrKysrLS0NCiBk
cml2ZXJzL2dyZXlidXMvY3BjL2hvc3QuYyAgfCA0MSArKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrLS0tDQogZHJpdmVycy9ncmV5YnVzL2NwYy9ob3N0LmggIHwgIDcgKysrKy0tLQ0K
IDQgZmlsZXMgY2hhbmdlZCwgNjEgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkNCg0KZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3JleWJ1cy9jcGMvY3BjLmggYi9kcml2ZXJzL2dyZXlidXMvY3Bj
L2NwYy5oDQppbmRleCAzOTE1YTdmYmM0Zi4uZDlmOGY2MDkxM2EgMTAwNjQ0DQotLS0gYS9kcml2
ZXJzL2dyZXlidXMvY3BjL2NwYy5oDQorKysgYi9kcml2ZXJzL2dyZXlidXMvY3BjL2NwYy5oDQpA
QCAtMjQsNiArMjQsMTUgQEAgc3RydWN0IGNwY19jcG9ydCB7DQogc3RydWN0IGNwY19jcG9ydCAq
Y3BjX2Nwb3J0X2FsbG9jKHUxNiBjcG9ydF9pZCwgZ2ZwX3QgZ2ZwX21hc2spOw0KIHZvaWQgY3Bj
X2Nwb3J0X3JlbGVhc2Uoc3RydWN0IGNwY19jcG9ydCAqY3BvcnQpOw0KIA0KLWludCBjcGNfY3Bv
cnRfbWVzc2FnZV9zZW5kKHN0cnVjdCBjcGNfY3BvcnQgKmNwb3J0LCBzdHJ1Y3QgZ2JfbWVzc2Fn
ZSAqbWVzc2FnZSwgZ2ZwX3QgZ2ZwX21hc2spOw0KK2ludCBjcGNfY3BvcnRfdHJhbnNtaXQoc3Ry
dWN0IGNwY19jcG9ydCAqY3BvcnQsIHN0cnVjdCBza19idWZmICpza2IpOw0KKw0KK3N0cnVjdCBj
cGNfc2tiX2NiIHsNCisJc3RydWN0IGNwY19jcG9ydCAqY3BvcnQ7DQorDQorCS8qIEtlZXAgdHJh
Y2sgb2YgdGhlIEdCIG1lc3NhZ2UgdGhlIHNrYiBvcmlnaW5hdGVzIGZyb20gKi8NCisJc3RydWN0
IGdiX21lc3NhZ2UgKmdiX21lc3NhZ2U7DQorfTsNCisNCisjZGVmaW5lIENQQ19TS0JfQ0IoX19z
a2IpICgoc3RydWN0IGNwY19za2JfY2IgKikmKChfX3NrYiktPmNiWzBdKSkNCiANCiAjZW5kaWYN
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dyZXlidXMvY3BjL2Nwb3J0LmMgYi9kcml2ZXJzL2dyZXli
dXMvY3BjL2Nwb3J0LmMNCmluZGV4IDg4YmRiMmY4MTgyLi5lZDBiOGU4YjBkNyAxMDA2NDQNCi0t
LSBhL2RyaXZlcnMvZ3JleWJ1cy9jcGMvY3BvcnQuYw0KKysrIGIvZHJpdmVycy9ncmV5YnVzL2Nw
Yy9jcG9ydC5jDQpAQCAtMzEsNyArMzEsMTQgQEAgdm9pZCBjcGNfY3BvcnRfcmVsZWFzZShzdHJ1
Y3QgY3BjX2Nwb3J0ICpjcG9ydCkNCiAJa2ZyZWUoY3BvcnQpOw0KIH0NCiANCi1pbnQgY3BjX2Nw
b3J0X21lc3NhZ2Vfc2VuZChzdHJ1Y3QgY3BjX2Nwb3J0ICpjcG9ydCwgc3RydWN0IGdiX21lc3Nh
Z2UgKm1lc3NhZ2UsIGdmcF90IGdmcF9tYXNrKQ0KKy8qKg0KKyAqIGNwY19jcG9ydF90cmFuc21p
dCgpIC0gVHJhbnNtaXQgc2tiIG92ZXIgY3BvcnQuDQorICogQGNwb3J0OiBjcG9ydC4NCisgKiBA
c2tiOiBza2IgdG8gYmUgdHJhbnNtaXR0ZWQuDQorICovDQoraW50IGNwY19jcG9ydF90cmFuc21p
dChzdHJ1Y3QgY3BjX2Nwb3J0ICpjcG9ydCwgc3RydWN0IHNrX2J1ZmYgKnNrYikNCiB7DQotCXJl
dHVybiBjcG9ydC0+Y3BjX2hkLT5kcml2ZXItPm1lc3NhZ2Vfc2VuZChjcG9ydC0+Y3BjX2hkLCBj
cG9ydC0+aWQsIG1lc3NhZ2UsIGdmcF9tYXNrKTsNCisJc3RydWN0IGNwY19ob3N0X2RldmljZSAq
Y3BjX2hkID0gY3BvcnQtPmNwY19oZDsNCisNCisJcmV0dXJuIGNwY19oZF9zZW5kX3NrYihjcGNf
aGQsIHNrYik7DQogfQ0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3JleWJ1cy9jcGMvaG9zdC5jIGIv
ZHJpdmVycy9ncmV5YnVzL2NwYy9ob3N0LmMNCmluZGV4IDNkZGE1YjA2NTkwLi5hM2FjZmM5YmZj
YSAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3JleWJ1cy9jcGMvaG9zdC5jDQorKysgYi9kcml2ZXJz
L2dyZXlidXMvY3BjL2hvc3QuYw0KQEAgLTYsNiArNiw3IEBADQogI2luY2x1ZGUgPGxpbnV4L2Vy
ci5oPg0KICNpbmNsdWRlIDxsaW51eC9ncmV5YnVzLmg+DQogI2luY2x1ZGUgPGxpbnV4L21vZHVs
ZS5oPg0KKyNpbmNsdWRlIDxsaW51eC9za2J1ZmYuaD4NCiANCiAjaW5jbHVkZSAiY3BjLmgiDQog
I2luY2x1ZGUgImhvc3QuaCINCkBAIC0zOCw2ICszOSw4IEBAIHN0YXRpYyBpbnQgY3BjX2hkX21l
c3NhZ2Vfc2VuZChzdHJ1Y3QgY3BjX2hvc3RfZGV2aWNlICpjcGNfaGQsIHUxNiBjcG9ydF9pZCwN
CiAJCQkgICAgICAgc3RydWN0IGdiX21lc3NhZ2UgKm1lc3NhZ2UsIGdmcF90IGdmcF9tYXNrKQ0K
IHsNCiAJc3RydWN0IGNwY19jcG9ydCAqY3BvcnQ7DQorCXN0cnVjdCBza19idWZmICpza2I7DQor
CXVuc2lnbmVkIGludCBzaXplOw0KIA0KIAljcG9ydCA9IGNwY19oZF9nZXRfY3BvcnQoY3BjX2hk
LCBjcG9ydF9pZCk7DQogCWlmICghY3BvcnQpIHsNCkBAIC00NSw3ICs0OCwxOCBAQCBzdGF0aWMg
aW50IGNwY19oZF9tZXNzYWdlX3NlbmQoc3RydWN0IGNwY19ob3N0X2RldmljZSAqY3BjX2hkLCB1
MTYgY3BvcnRfaWQsDQogCQlyZXR1cm4gLUVJTlZBTDsNCiAJfQ0KIA0KLQlyZXR1cm4gY3BjX2Nw
b3J0X21lc3NhZ2Vfc2VuZChjcG9ydCwgbWVzc2FnZSwgZ2ZwX21hc2spOw0KKwlzaXplID0gc2l6
ZW9mKCptZXNzYWdlLT5oZWFkZXIpICsgbWVzc2FnZS0+cGF5bG9hZF9zaXplOw0KKwlza2IgPSBh
bGxvY19za2Ioc2l6ZSwgZ2ZwX21hc2spOw0KKwlpZiAoIXNrYikNCisJCXJldHVybiAtRU5PTUVN
Ow0KKw0KKwkvKiBIZWFkZXIgYW5kIHBheWxvYWQgYXJlIGFscmVhZHkgY29udGlndW91cyBpbiBH
cmV5YnVzIG1lc3NhZ2UgKi8NCisJc2tiX3B1dF9kYXRhKHNrYiwgbWVzc2FnZS0+YnVmZmVyLCBz
aXplb2YoKm1lc3NhZ2UtPmhlYWRlcikgKyBtZXNzYWdlLT5wYXlsb2FkX3NpemUpOw0KKw0KKwlD
UENfU0tCX0NCKHNrYiktPmNwb3J0ID0gY3BvcnQ7DQorCUNQQ19TS0JfQ0Ioc2tiKS0+Z2JfbWVz
c2FnZSA9IG1lc3NhZ2U7DQorDQorCXJldHVybiBjcGNfY3BvcnRfdHJhbnNtaXQoY3BvcnQsIHNr
Yik7DQogfQ0KIA0KIHN0YXRpYyBpbnQgY3BjX2hkX2Nwb3J0X2FsbG9jYXRlKHN0cnVjdCBjcGNf
aG9zdF9kZXZpY2UgKmNwY19oZCwgaW50IGNwb3J0X2lkLCB1bnNpZ25lZCBsb25nIGZsYWdzKQ0K
QEAgLTE0OSw4ICsxNjMsOCBAQCBzdHJ1Y3QgY3BjX2hvc3RfZGV2aWNlICpjcGNfaGRfY3JlYXRl
KHN0cnVjdCBjcGNfaGRfZHJpdmVyICpkcml2ZXIsIHN0cnVjdCBkZXZpYw0KIAlzdHJ1Y3QgY3Bj
X2hvc3RfZGV2aWNlICpjcGNfaGQ7DQogCXN0cnVjdCBnYl9ob3N0X2RldmljZSAqaGQ7DQogDQot
CWlmICgoIWRyaXZlci0+bWVzc2FnZV9zZW5kKSB8fCAoIWRyaXZlci0+bWVzc2FnZV9jYW5jZWwp
KSB7DQotCQlkZXZfZXJyKHBhcmVudCwgIm1pc3NpbmcgbWFuZGF0b3J5IGNhbGxiYWNrc1xuIik7
DQorCWlmICghZHJpdmVyLT50cmFuc21pdCkgew0KKwkJZGV2X2VycihwYXJlbnQsICJtaXNzaW5n
IG1hbmRhdG9yeSBjYWxsYmFja1xuIik7DQogCQlyZXR1cm4gRVJSX1BUUigtRUlOVkFMKTsNCiAJ
fQ0KIA0KQEAgLTE4NiwxMiArMjAwLDMzIEBAIHZvaWQgY3BjX2hkX2RlbChzdHJ1Y3QgY3BjX2hv
c3RfZGV2aWNlICpjcGNfaGQpDQogfQ0KIEVYUE9SVF9TWU1CT0xfR1BMKGNwY19oZF9kZWwpOw0K
IA0KK3ZvaWQgY3BjX2hkX21lc3NhZ2Vfc2VudChzdHJ1Y3Qgc2tfYnVmZiAqc2tiLCBpbnQgc3Rh
dHVzKQ0KK3sNCisJc3RydWN0IGNwY19ob3N0X2RldmljZSAqY3BjX2hkID0gQ1BDX1NLQl9DQihz
a2IpLT5jcG9ydC0+Y3BjX2hkOw0KKwlzdHJ1Y3QgZ2JfaG9zdF9kZXZpY2UgKmhkID0gY3BjX2hk
LT5nYl9oZDsNCisNCisJZ3JleWJ1c19tZXNzYWdlX3NlbnQoaGQsIENQQ19TS0JfQ0Ioc2tiKS0+
Z2JfbWVzc2FnZSwgc3RhdHVzKTsNCit9DQorRVhQT1JUX1NZTUJPTF9HUEwoY3BjX2hkX21lc3Nh
Z2Vfc2VudCk7DQorDQogdm9pZCBjcGNfaGRfcmN2ZChzdHJ1Y3QgY3BjX2hvc3RfZGV2aWNlICpj
cGNfaGQsIHUxNiBjcG9ydF9pZCwgdTggKmRhdGEsIHNpemVfdCBsZW5ndGgpDQogew0KIAlncmV5
YnVzX2RhdGFfcmN2ZChjcGNfaGQtPmdiX2hkLCBjcG9ydF9pZCwgZGF0YSwgbGVuZ3RoKTsNCiB9
DQogRVhQT1JUX1NZTUJPTF9HUEwoY3BjX2hkX3JjdmQpOw0KIA0KKy8qKg0KKyAqIGNwY19oZF9z
ZW5kX3NrYigpIC0gUXVldWUgYSBzb2NrZXQgYnVmZmVyIGZvciB0cmFuc21pc3Npb24uDQorICog
QGNwY19oZDogSG9zdCBkZXZpY2UgdG8gc2VuZCBTS0Igb3Zlci4NCisgKiBAc2tiOiBTS0IgdG8g
c2VuZC4NCisgKi8NCitpbnQgY3BjX2hkX3NlbmRfc2tiKHN0cnVjdCBjcGNfaG9zdF9kZXZpY2Ug
KmNwY19oZCwgc3RydWN0IHNrX2J1ZmYgKnNrYikNCit7DQorCWNvbnN0IHN0cnVjdCBjcGNfaGRf
ZHJpdmVyICpkcnYgPSBjcGNfaGQtPmRyaXZlcjsNCisNCisJcmV0dXJuIGRydi0+dHJhbnNtaXQo
Y3BjX2hkLCBza2IpOw0KK30NCisNCiBNT0RVTEVfREVTQ1JJUFRJT04oIkdyZXlidXMgb3ZlciBD
UEMiKTsNCiBNT0RVTEVfTElDRU5TRSgiR1BMIik7DQogTU9EVUxFX0FVVEhPUigiU2lsaWNvbiBM
YWJvcmF0b3JpZXMsIEluYy4iKTsNCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dyZXlidXMvY3BjL2hv
c3QuaCBiL2RyaXZlcnMvZ3JleWJ1cy9jcGMvaG9zdC5oDQppbmRleCBjM2YyZjU2YTkzOS4uMTkx
YjVlMzk0YTYgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dyZXlidXMvY3BjL2hvc3QuaA0KKysrIGIv
ZHJpdmVycy9ncmV5YnVzL2NwYy9ob3N0LmgNCkBAIC0xOCw5ICsxOCw3IEBAIHN0cnVjdCBjcGNf
Y3BvcnQ7DQogc3RydWN0IGNwY19ob3N0X2RldmljZTsNCiANCiBzdHJ1Y3QgY3BjX2hkX2RyaXZl
ciB7DQotCWludCAoKm1lc3NhZ2Vfc2VuZCkoc3RydWN0IGNwY19ob3N0X2RldmljZSAqaGQsIHUx
NiBkZXN0X2Nwb3J0X2lkLA0KLQkJCSAgICBzdHJ1Y3QgZ2JfbWVzc2FnZSAqbWVzc2FnZSwgZ2Zw
X3QgZ2ZwX21hc2spOw0KLQl2b2lkICgqbWVzc2FnZV9jYW5jZWwpKHN0cnVjdCBnYl9tZXNzYWdl
ICptZXNzYWdlKTsNCisJaW50ICgqdHJhbnNtaXQpKHN0cnVjdCBjcGNfaG9zdF9kZXZpY2UgKmhk
LCBzdHJ1Y3Qgc2tfYnVmZiAqc2tiKTsNCiB9Ow0KIA0KIC8qKg0KQEAgLTQ4LDUgKzQ2LDggQEAg
aW50IGNwY19oZF9hZGQoc3RydWN0IGNwY19ob3N0X2RldmljZSAqY3BjX2hkKTsNCiB2b2lkIGNw
Y19oZF9wdXQoc3RydWN0IGNwY19ob3N0X2RldmljZSAqY3BjX2hkKTsNCiB2b2lkIGNwY19oZF9k
ZWwoc3RydWN0IGNwY19ob3N0X2RldmljZSAqY3BjX2hkKTsNCiB2b2lkIGNwY19oZF9yY3ZkKHN0
cnVjdCBjcGNfaG9zdF9kZXZpY2UgKmNwY19oZCwgdTE2IGNwb3J0X2lkLCB1OCAqZGF0YSwgc2l6
ZV90IGxlbmd0aCk7DQordm9pZCBjcGNfaGRfbWVzc2FnZV9zZW50KHN0cnVjdCBza19idWZmICpz
a2IsIGludCBzdGF0dXMpOw0KKw0KK2ludCBjcGNfaGRfc2VuZF9za2Ioc3RydWN0IGNwY19ob3N0
X2RldmljZSAqY3BjX2hkLCBzdHJ1Y3Qgc2tfYnVmZiAqc2tiKTsNCiANCiAjZW5kaWYNCi0tIA0K
Mi41Mi4wDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmdyZXlidXMtZGV2IG1haWxpbmcgbGlzdCAtLSBncmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3Jn
ClRvIHVuc3Vic2NyaWJlIHNlbmQgYW4gZW1haWwgdG8gZ3JleWJ1cy1kZXYtbGVhdmVAbGlzdHMu
bGluYXJvLm9yZwo=
