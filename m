Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mDI2E+vdsWmaGgAAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Wed, 11 Mar 2026 22:26:03 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id C277A26A645
	for <lists+greybus-dev@lfdr.de>; Wed, 11 Mar 2026 22:26:02 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id D6C15402CB
	for <lists+greybus-dev@lfdr.de>; Wed, 11 Mar 2026 21:26:01 +0000 (UTC)
Received: from mx0a-0024c301.pphosted.com (mx0a-0024c301.pphosted.com [148.163.149.154])
	by lists.linaro.org (Postfix) with ESMTPS id F234D402C9
	for <greybus-dev@lists.linaro.org>; Wed, 11 Mar 2026 21:25:36 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=silabs.com header.s=pps12202023 header.b=k4Cj6A8J;
	dkim=pass header.d=silabs.com header.s=selector1 header.b=YAeimABT;
	arc=pass ("microsoft.com:s=arcselector10001:i=1");
	spf=pass (lists.linaro.org: domain of "prvs=1530258cc6=damien.riegel@silabs.com" designates 148.163.149.154 as permitted sender) smtp.mailfrom="prvs=1530258cc6=damien.riegel@silabs.com";
	dmarc=pass (policy=reject) header.from=silabs.com
Received: from pps.filterd (m0101743.ppops.net [127.0.0.1])
	by mx0a-0024c301.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62BJG3VV1211720;
	Wed, 11 Mar 2026 16:25:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pps12202023; bh=2rgXVFDgbpU5QS4vt9dc
	4lNzhUYUrl5NQmXHBdtEtK4=; b=k4Cj6A8JiolXtuFXkoMdg/5F3fcpJuHp5Mhy
	eta+kHlrmDLaIrLg4h+kpGFYZsEF0SiYHRhFFVVewfikgoG6AgXg3a7EGMhU9moK
	gUEZ5lgU3X+uPlyNFfaDNfbmrqRHoKMqDUMuiiNLtUv3YntiUOAgNT8+JNDxSwPa
	S0BAUZVktPSblsPn7aA5DiCar2m4h7ehsSg66ujO/8tEGhuuA1PrQJHLg6ouLFGO
	LW30r4Pt1wK1BrDjmaa0qCM9sNs2WuxqfV5Mw6jD5UZdi8hPUsh05Vv6WyjxW3Yc
	ZXA6eM8YUBlnILaburU4AeefLHosWbEpsoTkn6v9wlawmm0BtQ==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11023079.outbound.protection.outlook.com [40.107.201.79])
	by mx0a-0024c301.pphosted.com (PPS) with ESMTPS id 4crh7c2015-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 11 Mar 2026 16:25:25 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gz+UbT/fd0CkqybTt0nZ5LEXtIjdE64dBWHxKROveWQx88FFiJ8+CyUgN+vvGaN+AN5X2vbmY87du9fSD1uu+lb+FIK+rPj19+ixR+a9e/xZZjt7MPIfyIRrczRs5nkzhpxh4YHxns0kSOYQ2yqu9OPEPWndisYESgxOfaMAhfffagNDqrgoh02JcVUKgLsmFtYdyVtJ7J0y4n7TjrHhwybjY20AeTx+nZSCCrx7/+eNJfNb/4EL8806dU73wVz8bjJuv988P67e2f6BbbpkoKsg1yea+jA0Jdxe2JjAhFqgaXcX0Cy+k37JQ6RA96TGRQWIT5luVJDobYRz8VwkTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2rgXVFDgbpU5QS4vt9dc4lNzhUYUrl5NQmXHBdtEtK4=;
 b=i/ziVNJnlLZquKRNVm0htFa62pU/g/1HrPAHjgItyqUdounttpjga/A2gWalGvzerw2EpIZBKBaXMK5Rq+ywFVBRJB+D+hjHhHbUmKhZyckNDozj2XRuZuKn8Ke4mabVdJKhMTfo6BpkR+D3kUQbPEsW+UGLigY1sigenYNXFEHVt05qhY9Ix7wUnJ5TmbSmukmkx3Gzwx0+2DjA72qOyiHT+eNu3PtP6rDOMpuoRJB1vocjf0CTJnJVLJCzA4s1iXbhivk/6wQL7E02FdNCRNbXOoaLkrQRgTC0eaQlgV95NONzLY9Dc9DHqUsziy++R9oH8LiDjDPJPM1FajXxxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silabs.com; dmarc=pass action=none header.from=silabs.com;
 dkim=pass header.d=silabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2rgXVFDgbpU5QS4vt9dc4lNzhUYUrl5NQmXHBdtEtK4=;
 b=YAeimABTLTurVoZ8ePz1lUItwNCNP4jsvRpt2AmMIaiuHceXw21AZWSOFLkJG0M+GgasSywGY2SqohD3Y2yO13sXpi7Xbf78l6dRIGLQRsoPmXT5MXBiYS16ASgO54+7L2xWCUkXiMIOZQfcvmpYzV2wDmlwXpSwrnWoCNOWKEo=
Received: from DS0PR11MB8205.namprd11.prod.outlook.com (2603:10b6:8:162::17)
 by DM4PR11MB5280.namprd11.prod.outlook.com (2603:10b6:5:38b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Wed, 11 Mar
 2026 21:25:22 +0000
Received: from DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::2de6:bc88:2af7:3583]) by DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::2de6:bc88:2af7:3583%3]) with mapi id 15.20.9723.000; Wed, 11 Mar 2026
 21:25:22 +0000
From: =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
To: linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
        greybus-dev@lists.linaro.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alex Elder <elder@kernel.org>, Johan Hovold <johan@kernel.org>
Date: Wed, 11 Mar 2026 17:25:10 -0400
Message-ID: <20260311212511.82563-1-damien.riegel@silabs.com>
X-Mailer: git-send-email 2.52.0
X-ClientProxiedBy: YQBPR0101CA0261.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:68::28) To DS0PR11MB8205.namprd11.prod.outlook.com
 (2603:10b6:8:162::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8205:EE_|DM4PR11MB5280:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b5066b7-bd8b-434e-427a-08de7fb4b3e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	eSTzX1TBIA9wbjF1Tj+DA421bFcp9kFuuCsqHkCS0MBfFbmYRjNoyHz6bKPNC4Tjh9x833HyecfGuGi1uvoShUfeHtP4TKGIUNSRI7cdPBZU7sF7k87HJW6QmPKBwgH0pMMoZryyjQGz1TWpGyDCGAkdHsCPb+d6c2AVMfBnhAkbj4JmapquwMPNtUdmBE37gSVeXqoYsJSTYn73wW4+0EVt5VEo/A+hnx5rjN6vzIT32RV0oqSQL0Jav0G9H56Q+0/IVixMWxYKfn1XXGDBqOEQ9hf815CnRrrcrVnvb5EXmLogeDm9NHQdTRL+9hW22/oemSols0FQWklrhtTcs73AVh5/NHRg2IxAxBh4+paKuiSQgHBKFmUDmc18qqz2RcUsZhNW5fN4ZibzQMhTmHQ7cs5IaI5bNXImQFte1HFxMMcbjGwrb4T5WULjwPsTQq/8RLixeM0mv02ojcgZ0uq5x0NZ7J1jSDJVn3u9W1eqhZfK33U+CFb8xrCPNNo1lmrhCXoa6bYZ1VyV8TfoQosumd9DYelOl4LuDP2QFPXL06eXOGg7hd6HjOC86HvC3kvUbczqQZzy50Cv0H/S8nYZkhouHR0c2esDxu/ME6pR3AEs2Wb9UIguM0fUV/z58CosA+ZxlwZsNaj/gfxden4LMe4+ZlWBq0KZMP6emUGN/o3g0rD6m9KzeOsEAyEvGRDd+7Lq7cWicWDZe+9HlLmj/ERXW9X0oHLA5kHmMS5QYALTcTmF9nlPquWE6Evq9QNH3LpS4T7pU4OCIZ1SZuuwN5c7GDEDSjtCpbf+yZ0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8205.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZkhQcmd2VmdTdHNmaXhSdS9kM0FXaVphRzV1Q3pvbklkNk9LR1B0Q2lpRVAw?=
 =?utf-8?B?dXgrTnBDYUN1SVdHMnBGU2NMakMvU3ZQU1lSWjZveXZWMnBDK3pIbWFNN2h0?=
 =?utf-8?B?OUFiRGYrczd4WkpCTTlTaEVxbU9UVlhJS2l6SUcyNi9MZDJWL1BhTjdjTkdn?=
 =?utf-8?B?WWhDSUdCRWRxc1FXb1JxaUE3NkRwT1ZPcnkvSzhWeU01dFY0dUFzZGJNT2hz?=
 =?utf-8?B?cVlEK3ZNZkwva1I5cFN3MGo0MVVNU2VKTi8rVDhmM2ZMdjdUNGxEaURZRVRG?=
 =?utf-8?B?VU9pMUphV1ZGZGFlM2lZeW9GNk55dWVHbDIrOFBSUkJOdi9xRHZRUG1BbjBj?=
 =?utf-8?B?RGJGblYzajdDL2hDQmZpVGFJK3hSbHh5aEplem55SWtJVk8xSjhhMW4wajRs?=
 =?utf-8?B?d0tibFdtNFQ1enVzMlAvMWx3clVSMWN0UUlmZ3N4K202dU1QK2RhNjRPN3RW?=
 =?utf-8?B?WlVFa0NLYXdPQm8rMjZ2SkhhbVdHTE8vRUJwSlpuZS9KTHZtYU9BSWN0bGc5?=
 =?utf-8?B?VS8veUlLMEpnK0dYUjdubDAxN0M1YTZkQkk3Syt0ODAwdzlrcFpwdERIMkxs?=
 =?utf-8?B?R2pEVzR1TWpmdUl5VldUeVNtM05KRitKZm1tMEhHd01UR0NHbUtxZ3pzbWNZ?=
 =?utf-8?B?YjBMTG1raWFtTUJnUTNKc2srY2E4RnYzaTNUZW5DbFpCV29Na0huSFZYK1Rj?=
 =?utf-8?B?NGQ5TDBmMWozRXlvYUdUNnVlNi9NVTcxZ2ZmQ1hLekZ0MmRQWm55cFlLWXNY?=
 =?utf-8?B?alpXaGF3WGttZjVzekN1Yi94c3p3RGVQTTZTTUlDOG9mcjZiRDAvUlRINUdI?=
 =?utf-8?B?M1lHenE2M2xNaUJXVStIcDViOTVSdEM1QWtnb2FMa012SWwvMFNzald4KzBq?=
 =?utf-8?B?Um5PRnRNb0llTWhCRUsxeWlzR2tMQ0lETnhPNGtlbys3QW1yY2lyeVNrUHJM?=
 =?utf-8?B?cm1Ud2FaRnk2RjRzM205MFVKNVlyeVhHSWl4UzNNZDVOM20zTlEvTStaN05x?=
 =?utf-8?B?RXBqME04RGtxNEovb1ZCMmNlRjc1cFJ5Q0RPQzVHRjFvWXh3NTU3S0hrWGFH?=
 =?utf-8?B?eG5yZ2R2a0NqZW9DM2F5K093eGxwdnBvTG9HWCsyUkJSYmo4cCtVK2hRaWkx?=
 =?utf-8?B?R1NEZlRrektYNkNJUXJxVk5uekxXOE1LKy9rdUNkVTlqTkQ3YUhkTTE0YzNK?=
 =?utf-8?B?ZWhZbHFaVit6M3Z6bzdMRng5R0FRNzJ4VHh3U1F1blBSMHhSdWF1RGRZc1Zu?=
 =?utf-8?B?eExtUlcySVMzcTJJY25zb05OeitTTDZDZ1p2bDZZaXUwVVoxQno5SHVmTG5U?=
 =?utf-8?B?T212OGM2YlVMb3VVRzlwVlZhZ29ETXNCUC95eDZLS04yek05QzBleWZPd1lo?=
 =?utf-8?B?cit6dGtzcHlZVGE5cC9KaURlYnAvaldzcTVOOU9HNCtmVE5yaTR6dVpLNWlX?=
 =?utf-8?B?cXcxZGYvWHMwV0FtdmJ0R21QcVBWNHRzOTZUeERhMFR4TW1hS1JscUZrd0tJ?=
 =?utf-8?B?NENJdXo0eW5yQWltNVVhVzFoaGNPS1Nkc2ZkS1VuK3NNWHFPbEY4MTZWWDlV?=
 =?utf-8?B?Q0VoeTZRUWR0dFNxV05vNUtST0hLdmNnWlBpM21JK1VzQTZyaGhmeGNHKy9t?=
 =?utf-8?B?SkZycWIzRWJCelVDWUJxY0tvTnFOMXd1VktvbFp5Z2xGZStpTm56OUk0V0lB?=
 =?utf-8?B?NVAxdTZ5SjFrNHNmaEVvQmFQMjVuUGFEcWJ4WTBGaEJlK293VUtqR3pWMjJp?=
 =?utf-8?B?ZEUvS25OV01LS3FzWFNFekZQVG0wS3QyVmY0UFd1REpGcnE4SnpCSkV2QStD?=
 =?utf-8?B?Mm1BQmI3bGhXV3JIN1BWYTFHalR1ajNpNEpJM3BmS0hnR1VxcG1QVW80NmdO?=
 =?utf-8?B?LzA0QnFPRldXb1ppdEYvMXdyOTFwdVpzNU9QNStaY0Zuanl2MXk4T0JTU1pR?=
 =?utf-8?B?b2lKK2llbzB0TUxTb0Fkdkp0dmVuNzIxdXVRY01LeEhCUWZKWi9VUSttck1v?=
 =?utf-8?B?RWhPbjNFdFBUS2tlZHBSS1JtUm9NRXd6cE5JWnduRld3aXpjMklwLzZnVkll?=
 =?utf-8?B?dUozYVBqWFFDaVJJcUtTQm41UU5UMUhzakRyZENCdlN6ZHY3QkxSREtkYjBt?=
 =?utf-8?B?NnozeUZLUDNvaVdRY2VpcExwZ2FYRFBacTJzUXBNZlpDWVEvRmU5dkRsZHlP?=
 =?utf-8?B?WjNKMkdTZzNQcGtNVkhLWjlRRXhOcHd4RnQ4OXBGaFFEOTk4b1orWEp0VDEw?=
 =?utf-8?B?VUY2MHQ2UUdlejJDWnJIQmY3dlR0WXNLajc0ZkZrVkZYdldGTjZ2OXlXZDBP?=
 =?utf-8?B?QmlUUkFwT0ZObjRRZzhOMGlhSHdQYU5vejd0SnhvNmFDMC9kbGZxZz09?=
X-Exchange-RoutingPolicyChecked: 
	vkyD53DVy5sjz565FxCx34c9z2cckbc4IUGM1SVSHNIU/KGrg73Df6Lj40Mps/TsYlKpcq0eeTjyzsC5bHuV37lNiMbrlCnTZcTkSCR+HqGNTy8SpJQKkUmA3oUB8lz/sa/F5eH6iqXx/xLhxyF3Gws/Gux8WgZh2GtCtmYipOfp/rzfJy352tfHp9a6otkp1bz4oEG4JRYqCGVmRG3zP6JIvJrl900O78ZjNTvbtBDinQDtHFTlh/bcbpoM1rDf06kppj8rDDEajzeqdLrgC47ElSLefj95c4pNp1RorXv4hH8TDz3IKEK+hLJNfgYM5Jd+N1Fb1Dbt+vEPhOWvPA==
X-OriginatorOrg: silabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b5066b7-bd8b-434e-427a-08de7fb4b3e0
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8205.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 21:25:22.6130
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 54dbd822-5231-4b20-944d-6f4abcd541fb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FXVtaWYp3IlFn1afKIjwpHHn4S6fBSfpx4Wkk0FIOACAJ+nzeKD1BCbjuumO8KKAkOnkMpUPhnHeHwAO+T/5EA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5280
X-Proofpoint-GUID: klw4-EEfzgSV2V4igK9E8Wum8T2BcbXs
X-Proofpoint-ORIG-GUID: klw4-EEfzgSV2V4igK9E8Wum8T2BcbXs
X-Authority-Analysis: v=2.4 cv=FpAIPmrq c=1 sm=1 tr=0 ts=69b1ddc5 cx=c_pps
 a=QpQIPgq430LJFJp+cclIig==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=M51BFTxLslgA:10
 a=i1IsUcr2s-wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=gIHJBl62Mt9vjvfn7G3b:22
 a=6KgOrB_2K63Cyhqxo4vW:22 a=ID6ng7r3AAAA:8 a=2AEO0YjSAAAA:8
 a=1XDySn5Ug4fX2v82s3MA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=AkheI1RvQwOzcTXhi5f4:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDE4MiBTYWx0ZWRfX06IIFHf13jcU
 M+OKMwvvONFR9qis/HYA1gx9d0+JxTvVJCNRGiv20QLqWMAqZbco3A6JTVahGoucqLqmAEeLveZ
 YBzj083iFoY5msh8tXRBBjXB7hUkz/JsjKP01MyTqJ0Ar0WlU/8VsQ7W5Y/h6bV8RQjdRPtpnlj
 XU5yU1xNQQzHyjiNr19hyf9gh/xYMYUMonwpe00NBpZzKtwIPgvwzqRSRTeIloAC6OaJgyK/G6U
 wOUEhw0dYgBspKkjiZTpLUwwn4yewM4psNUuomrjvC65pxsnIR55GNfI2l7eFlbDHpMybE1JUNp
 nuX39bNoeTAPk059ZDkOrW7Dsan+EEYDjcAPZDoIFylNTRWI88Vo6s8+PxCwplZBWkbSwDRm50l
 +U73ifkS1gZnWMiWYSR1z+Dm80qyagJ49mnd40DtqrhoIAHtmo33RcZIpH55Fpe+WxfAPSmeGaB
 TrZWBBBVJB6hX1TcZQQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 malwarescore=0 bulkscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110182
X-Spamd-Bar: ----
Message-ID-Hash: N4EV6FG2HJKQHIBDSAKHWCKOGWFOBJUH
X-Message-ID-Hash: N4EV6FG2HJKQHIBDSAKHWCKOGWFOBJUH
X-MailFrom: prvs=1530258cc6=damien.riegel@silabs.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH 1/2 RESEND] greybus: raw: fix use-after-free on cdev close
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/N4EV6FG2HJKQHIBDSAKHWCKOGWFOBJUH/>
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
	R_SPF_ALLOW(-0.20)[+mx:c];
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
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	TAGGED_RCPT(0.00)[greybus-dev];
	NEURAL_SPAM(0.00)[0.848];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qemu.org:url,linaro.org:email,lists.linaro.org:helo,lists.linaro.org:rdns,silabs.com:email,silabs.com:mid]
X-Rspamd-Queue-Id: C277A26A645
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

VGhpcyBhZGRyZXNzZXMgYSB1c2UtYWZ0ZXItZnJlZSBidWcgd2hlbiBhIHJhdyBidW5kbGUgaXMg
ZGlzY29ubmVjdGVkDQpidXQgaXRzIGNoYXJkZXYgaXMgc3RpbGwgb3BlbmVkIGJ5IGFuIGFwcGxp
Y2F0aW9uLiBXaGVuIHRoZSBhcHBsaWNhdGlvbg0KcmVsZWFzZXMgdGhlIGNkZXYsIGl0IGNhdXNl
cyB0aGUgZm9sbG93aW5nIHBhbmljIHdoZW4gaW5pdCBvbiBmcmVlIGlzDQplbmFibGVkIChDT05G
SUdfSU5JVF9PTl9GUkVFX0RFRkFVTFRfT049eSk6DQoNCiAgICBbICAgNzguNDUxMDYyXSByZWZj
b3VudF90OiB1bmRlcmZsb3c7IHVzZS1hZnRlci1mcmVlLg0KICAgIFsgICA3OC40NTEzNTJdIFdB
Uk5JTkc6IENQVTogMCBQSUQ6IDEzOSBhdCBsaWIvcmVmY291bnQuYzoyOCByZWZjb3VudF93YXJu
X3NhdHVyYXRlKzB4ZDAvMHgxMzANCiAgICBbICAgNzguNDUxNjk4XSBNb2R1bGVzIGxpbmtlZCBp
bjogZ2JfcmF3KEMpDQogICAgWyAgIDc4LjQ1MTg4MV0gQ1BVOiAwIFVJRDogMCBQSUQ6IDEzOSBD
b21tOiByYXdfY2hhcmRldl90ZXMgVGFpbnRlZDogRyAgICAgICAgV0MgICAgICAgICAgNi4xOC4w
LXJjNCAjMjEyIFBSRUVNUFQodm9sdW50YXJ5KQ0KICAgIFsgICA3OC40NTIzODZdIFRhaW50ZWQ6
IFtXXT1XQVJOLCBbQ109Q1JBUA0KICAgIFsgICA3OC40NTI1NjBdIEhhcmR3YXJlIG5hbWU6IFFF
TVUgU3RhbmRhcmQgUEMgKGk0NDBGWCArIFBJSVgsIDE5OTYpLCBCSU9TIHJlbC0xLjE3LjAtMC1n
YjUyY2E4NmUwOTRkLXByZWJ1aWx0LnFlbXUub3JnIDA0LzAxLzIwMTQNCiAgICBbICAgNzguNDUz
MDQ5XSBSSVA6IDAwMTA6cmVmY291bnRfd2Fybl9zYXR1cmF0ZSsweGQwLzB4MTMwDQogICAgWyAg
IDc4LjQ1MzMxMV0gQ29kZTogMGIgOTAgOTAgYzMgY2MgY2MgY2MgY2MgODAgM2QgNGYgZWMgMWQg
MDEgMDAgMGYgODUgNzUgZmYgZmYgZmYgYzYgMDUgNDIgZWMgMWQgMDEgMDEgOTAgNDggYzcgYzcg
ZTggNWIgY2IgYjQgZTggMzFmDQogICAgWyAgIDc4LjQ1Mzk1M10gUlNQOiAwMDE4OmZmZmZhYTBm
ODAyMDNlZDAgRUZMQUdTOiAwMDAxMDI4Mg0KICAgIFsgICA3OC40NTQyNTFdIFJBWDogMDAwMDAw
MDAwMDAwMDAwMCBSQlg6IDAwMDAwMDAwMDAwMDAwMDAgUkNYOiAwMDAwMDAwMDAwMDAwMDAwDQog
ICAgWyAgIDc4LjQ1NDQ3Ml0gUkRYOiAwMDAwMDAwMDAwMDAwMDAwIFJTSTogZmZmZmFhMGY4MDIw
M2Q2OCBSREk6IDAwMDAwMDAwZmZmZmRmZmYNCiAgICBbICAgNzguNDU0NjkwXSBSQlA6IDAwMDAw
MDAwMDQwZTAwMWYgUjA4OiAwMDAwMDAwMGZmZmZkZmZmIFIwOTogZmZmZmZmZmZiNTEwYzAwOA0K
ICAgIFsgICA3OC40NTQ4OTldIFIxMDogZmZmZmZmZmZiNTA1YzA2MCBSMTE6IDAwMDAwMDAwNjM2
NjY1NzIgUjEyOiBmZmZmOTM4ZGMyMTBiNDY4DQogICAgWyAgIDc4LjQ1NTI3OV0gUjEzOiBmZmZm
OTM4ZGMxZjVlMWEwIFIxNDogZmZmZjkzOGRjMTQ3MTBjMCBSMTU6IDAwMDAwMDAwMDAwMDAwMDAN
CiAgICBbICAgNzguNDU1NTQ5XSBGUzogIDAwMDA3ZjJmMjI3NDE3NDAoMDAwMCkgR1M6ZmZmZjkz
OGUxMWZiYzAwMCgwMDAwKSBrbmxHUzowMDAwMDAwMDAwMDAwMDAwDQogICAgWyAgIDc4LjQ1NTgw
Nl0gQ1M6ICAwMDEwIERTOiAwMDAwIEVTOiAwMDAwIENSMDogMDAwMDAwMDA4MDA1MDAzMw0KICAg
IFsgICA3OC40NTYxMjldIENSMjogMDAwMDdmMmYyMjhjODljMyBDUjM6IDAwMDAwMDAwMDIwZDAw
MDAgQ1I0OiAwMDAwMDAwMDAwMDAwNmYwDQogICAgWyAgIDc4LjQ1Njc4Nl0gQ2FsbCBUcmFjZToN
CiAgICBbICAgNzguNDU2OTM2XSAgPFRBU0s+DQogICAgWyAgIDc4LjQ1NzA2OV0gIGNkZXZfcHV0
KzB4MTgvMHgzMA0KICAgIFsgICA3OC40NTcyMzBdICBfX2ZwdXQrMHgyNTUvMHgyYTANCiAgICBb
ICAgNzguNDU3MzcyXSAgX194NjRfc3lzX2Nsb3NlKzB4M2QvMHg4MA0KICAgIFsgICA3OC40NTc1
NDRdICBkb19zeXNjYWxsXzY0KzB4YTQvMHgyOTANCiAgICBbICAgNzguNDU3Njk3XSAgZW50cnlf
U1lTQ0FMTF82NF9hZnRlcl9od2ZyYW1lKzB4NzcvMHg3Zg0KICAgIFsgICA3OC40NTc4ODNdIFJJ
UDogMDAzMzoweDdmMmYyMjdkMWNjNw0KICAgIFsgICA3OC40NTgwOTddIENvZGU6IDQ4IDg5IGZh
IDRjIDg5IGRmIGU4IDA4IGFlIDAwIDAwIDhiIDkzIDA4IDAzIDAwIDAwIDU5IDVlIDQ4IDgzIGY4
IGZjIDc0IDFhIDViIGMzIDBmIDFmIDg0IDAwIDAwIDAwIDAwIDAwIDQ4IDhiIDQ0Zg0KICAgIFsg
ICA3OC40NTg2OTJdIFJTUDogMDAyYjowMDAwN2ZmZmFiMzZmYjUwIEVGTEFHUzogMDAwMDAyMDIg
T1JJR19SQVg6IDAwMDAwMDAwMDAwMDAwMDMNCiAgICBbICAgNzguNDU5MTU1XSBSQVg6IGZmZmZm
ZmZmZmZmZmZmZGEgUkJYOiAwMDAwN2YyZjIyNzQxNzQwIFJDWDogMDAwMDdmMmYyMjdkMWNjNw0K
ICAgIFsgICA3OC40NTk0MDBdIFJEWDogMDAwMDAwMDAwMDAwMDAwMCBSU0k6IDAwMDAwMDAwMDAw
MDAwMDAgUkRJOiAwMDAwMDAwMDAwMDAwMDAzDQogICAgWyAgIDc4LjQ1OTY0OF0gUkJQOiAwMDAw
N2ZmZmFiMzZmYmE4IFIwODogMDAwMDAwMDAwMDAwMDAwMCBSMDk6IDAwMDAwMDAwMDAwMDAwMDAN
CiAgICBbICAgNzguNDU5ODk5XSBSMTA6IDAwMDAwMDAwMDAwMDAwMDAgUjExOiAwMDAwMDAwMDAw
MDAwMjAyIFIxMjogMDAwMDU1ODI5ODQyNzEyOA0KICAgIFsgICA3OC40NjAyMTJdIFIxMzogMDAw
MDdmMmYyMjc0MTZkMCBSMTQ6IDAwMDA1NTgyYzcyY2YzMjAgUjE1OiAwMDAwNTU4MmM3MmNmMzIw
DQogICAgWyAgIDc4LjQ2MDQ3MF0gIDwvVEFTSz4NCiAgICBbICAgNzguNDYwNTcxXSAtLS1bIGVu
ZCB0cmFjZSAwMDAwMDAwMDAwMDAwMDAwIF0tLS0NCg0KVGhlIGNkZXYgaXMgY29udGFpbmVkIGlu
IHRoZSAiZ2JfcmF3IiBzdHJ1Y3R1cmUsIHdoaWNoIGlzIGZyZWVkIGluIHRoZQ0KZGlzY29ubmVj
dCBvcGVyYXRpb24uIFdoZW4gdGhlIGNkZXYgaXMgcmVsZWFzZWQgYXQgYSBsYXRlciB0aW1lLA0K
Y2Rldl9wdXQgZ2V0cyBhbiBhZGRyZXNzIHRoYXQgcG9pbnRzIHRvIGZyZWVkIG1lbW9yeS4NCg0K
VG8gZml4IHRoaXMgdXNlLWFmdGVyLWZyZWUsIGNvbnZlcnQgdGhlIHN0cnVjdCBkZXZpY2UgZnJv
bSBhIHBvaW50ZXIgdG8NCmJlaW5nIGVtYmVkZGVkLCB0aGF0IG1ha2VzIHRoZSBsaWZldGltZSBv
ZiB0aGUgY2RldiBhbmQgb2YgdGhpcyBkZXZpY2UNCnRoZSBzYW1lLiBUaGVuLCB1c2UgY2Rldl9k
ZXZpY2VfYWRkLCB3aGljaCBndWFyYW50ZWVzIHRoYXQgdGhlIGRldmljZQ0Kd29uJ3QgYmUgcmVs
ZWFzZWQgdW50aWwgYWxsIHJlZmVyZW5jZXMgdG8gdGhlIGNkZXYgYXJlIG5vdCByZWxlYXNlZC4N
CkZpbmFsbHksIGRlbGVnYXRlIHRoZSBmcmVlaW5nIG9mIHRoZSBzdHJ1Y3R1cmUgdG8gdGhlIGRl
dmljZSByZWxlYXNlDQpmdW5jdGlvbiwgaW5zdGVhZCBvZiBmcmVlaW5nIGltbWVkaWF0ZWx5IGlu
IHRoZSBkaXNjb25uZWN0IGNhbGxiYWNrLg0KDQpGaXhlczogZTgwNmM3ZmI4ZTliICgiZ3JleWJ1
czogcmF3OiBhZGQgcmF3IGdyZXlidXMga2VybmVsIGRyaXZlciIpDQpTaWduZWQtb2ZmLWJ5OiBE
YW1pZW4gUmnDqWdlbCA8ZGFtaWVuLnJpZWdlbEBzaWxhYnMuY29tPg0KLS0tDQpyZXNlbmQ6IGFk
ZGVkIGxpbnV4LXN0YWdpbmcgYXMgQ2MsIHRoaXMgbGlzdCB3YXMgbm90IHBhcnQgb2YgdGhlIGZp
cnN0DQpzdWJtaXNzaW9uLg0KDQogZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvcmF3LmMgfCA0OSAr
KysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLQ0KIDEgZmlsZSBjaGFuZ2VkLCAyNiBp
bnNlcnRpb25zKCspLCAyMyBkZWxldGlvbnMoLSkNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3Rh
Z2luZy9ncmV5YnVzL3Jhdy5jIGIvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvcmF3LmMNCmluZGV4
IDcxZGU2Nzc2NzM5Li5iOTIyMTRmOTdlMyAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvc3RhZ2luZy9n
cmV5YnVzL3Jhdy5jDQorKysgYi9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9yYXcuYw0KQEAgLTIx
LDkgKzIxLDggQEAgc3RydWN0IGdiX3JhdyB7DQogCXN0cnVjdCBsaXN0X2hlYWQgbGlzdDsNCiAJ
aW50IGxpc3RfZGF0YTsNCiAJc3RydWN0IG11dGV4IGxpc3RfbG9jazsNCi0JZGV2X3QgZGV2Ow0K
IAlzdHJ1Y3QgY2RldiBjZGV2Ow0KLQlzdHJ1Y3QgZGV2aWNlICpkZXZpY2U7DQorCXN0cnVjdCBk
ZXZpY2UgZGV2Ow0KIH07DQogDQogc3RydWN0IHJhd19kYXRhIHsNCkBAIC0xNDgsNiArMTQ3LDEz
IEBAIHN0YXRpYyBpbnQgZ2JfcmF3X3NlbmQoc3RydWN0IGdiX3JhdyAqcmF3LCB1MzIgbGVuLCBj
b25zdCBjaGFyIF9fdXNlciAqZGF0YSkNCiAJcmV0dXJuIHJldHZhbDsNCiB9DQogDQorc3RhdGlj
IHZvaWQgcmF3X2Rldl9yZWxlYXNlKHN0cnVjdCBkZXZpY2UgKmRldikNCit7DQorCXN0cnVjdCBn
Yl9yYXcgKnJhdyA9IGRldl9nZXRfZHJ2ZGF0YShkZXYpOw0KKw0KKwlrZnJlZShyYXcpOw0KK30N
CisNCiBzdGF0aWMgaW50IGdiX3Jhd19wcm9iZShzdHJ1Y3QgZ2JfYnVuZGxlICpidW5kbGUsDQog
CQkJY29uc3Qgc3RydWN0IGdyZXlidXNfYnVuZGxlX2lkICppZCkNCiB7DQpAQCAtMTY4LDExICsx
NzQsMTQgQEAgc3RhdGljIGludCBnYl9yYXdfcHJvYmUoc3RydWN0IGdiX2J1bmRsZSAqYnVuZGxl
LA0KIAlpZiAoIXJhdykNCiAJCXJldHVybiAtRU5PTUVNOw0KIA0KKwlkZXZpY2VfaW5pdGlhbGl6
ZSgmcmF3LT5kZXYpOw0KKwlkZXZfc2V0X2RydmRhdGEoJnJhdy0+ZGV2LCByYXcpOw0KKw0KIAlj
b25uZWN0aW9uID0gZ2JfY29ubmVjdGlvbl9jcmVhdGUoYnVuZGxlLCBsZTE2X3RvX2NwdShjcG9y
dF9kZXNjLT5pZCksDQogCQkJCQkgIGdiX3Jhd19yZXF1ZXN0X2hhbmRsZXIpOw0KIAlpZiAoSVNf
RVJSKGNvbm5lY3Rpb24pKSB7DQogCQlyZXR2YWwgPSBQVFJfRVJSKGNvbm5lY3Rpb24pOw0KLQkJ
Z290byBlcnJvcl9mcmVlOw0KKwkJZ290byBlcnJvcl9wdXRfZGV2aWNlOw0KIAl9DQogDQogCUlO
SVRfTElTVF9IRUFEKCZyYXctPmxpc3QpOw0KQEAgLTE4NywyOSArMTk2LDI2IEBAIHN0YXRpYyBp
bnQgZ2JfcmF3X3Byb2JlKHN0cnVjdCBnYl9idW5kbGUgKmJ1bmRsZSwNCiAJCWdvdG8gZXJyb3Jf
Y29ubmVjdGlvbl9kZXN0cm95Ow0KIAl9DQogDQotCXJhdy0+ZGV2ID0gTUtERVYocmF3X21ham9y
LCBtaW5vcik7DQorCXJhdy0+ZGV2LmRldnQgPSBNS0RFVihyYXdfbWFqb3IsIG1pbm9yKTsNCisJ
cmF3LT5kZXYuY2xhc3MgPSAmcmF3X2NsYXNzOw0KKwlyYXctPmRldi5wYXJlbnQgPSAmY29ubmVj
dGlvbi0+YnVuZGxlLT5kZXY7DQorCXJhdy0+ZGV2LnJlbGVhc2UgPSByYXdfZGV2X3JlbGVhc2U7
DQorCXJldHZhbCA9IGRldl9zZXRfbmFtZSgmcmF3LT5kZXYsICJnYiFyYXclZCIsIG1pbm9yKTsN
CisJaWYgKHJldHZhbCkNCisJCWdvdG8gZXJyb3JfcmVtb3ZlX2lkYTsNCisNCiAJY2Rldl9pbml0
KCZyYXctPmNkZXYsICZyYXdfZm9wcyk7DQogDQogCXJldHZhbCA9IGdiX2Nvbm5lY3Rpb25fZW5h
YmxlKGNvbm5lY3Rpb24pOw0KIAlpZiAocmV0dmFsKQ0KIAkJZ290byBlcnJvcl9yZW1vdmVfaWRh
Ow0KIA0KLQlyZXR2YWwgPSBjZGV2X2FkZCgmcmF3LT5jZGV2LCByYXctPmRldiwgMSk7DQorCXJl
dHZhbCA9IGNkZXZfZGV2aWNlX2FkZCgmcmF3LT5jZGV2LCAmcmF3LT5kZXYpOw0KIAlpZiAocmV0
dmFsKQ0KIAkJZ290byBlcnJvcl9jb25uZWN0aW9uX2Rpc2FibGU7DQogDQotCXJhdy0+ZGV2aWNl
ID0gZGV2aWNlX2NyZWF0ZSgmcmF3X2NsYXNzLCAmY29ubmVjdGlvbi0+YnVuZGxlLT5kZXYsDQot
CQkJCSAgICByYXctPmRldiwgcmF3LCAiZ2IhcmF3JWQiLCBtaW5vcik7DQotCWlmIChJU19FUlIo
cmF3LT5kZXZpY2UpKSB7DQotCQlyZXR2YWwgPSBQVFJfRVJSKHJhdy0+ZGV2aWNlKTsNCi0JCWdv
dG8gZXJyb3JfZGVsX2NkZXY7DQotCX0NCi0NCiAJcmV0dXJuIDA7DQogDQotZXJyb3JfZGVsX2Nk
ZXY6DQotCWNkZXZfZGVsKCZyYXctPmNkZXYpOw0KLQ0KIGVycm9yX2Nvbm5lY3Rpb25fZGlzYWJs
ZToNCiAJZ2JfY29ubmVjdGlvbl9kaXNhYmxlKGNvbm5lY3Rpb24pOw0KIA0KQEAgLTIxOSw4ICsy
MjUsOCBAQCBzdGF0aWMgaW50IGdiX3Jhd19wcm9iZShzdHJ1Y3QgZ2JfYnVuZGxlICpidW5kbGUs
DQogZXJyb3JfY29ubmVjdGlvbl9kZXN0cm95Og0KIAlnYl9jb25uZWN0aW9uX2Rlc3Ryb3koY29u
bmVjdGlvbik7DQogDQotZXJyb3JfZnJlZToNCi0Ja2ZyZWUocmF3KTsNCitlcnJvcl9wdXRfZGV2
aWNlOg0KKwlwdXRfZGV2aWNlKCZyYXctPmRldik7DQogCXJldHVybiByZXR2YWw7DQogfQ0KIA0K
QEAgLTIzMSwxMSArMjM3LDkgQEAgc3RhdGljIHZvaWQgZ2JfcmF3X2Rpc2Nvbm5lY3Qoc3RydWN0
IGdiX2J1bmRsZSAqYnVuZGxlKQ0KIAlzdHJ1Y3QgcmF3X2RhdGEgKnJhd19kYXRhOw0KIAlzdHJ1
Y3QgcmF3X2RhdGEgKnRlbXA7DQogDQotCS8vIEZJWE1FIC0gaGFuZGxlIHJlbW92aW5nIGEgY29u
bmVjdGlvbiB3aGVuIHRoZSBjaGFyIGRldmljZSBub2RlIGlzIG9wZW4uDQotCWRldmljZV9kZXN0
cm95KCZyYXdfY2xhc3MsIHJhdy0+ZGV2KTsNCi0JY2Rldl9kZWwoJnJhdy0+Y2Rldik7DQorCWNk
ZXZfZGV2aWNlX2RlbCgmcmF3LT5jZGV2LCAmcmF3LT5kZXYpOw0KIAlnYl9jb25uZWN0aW9uX2Rp
c2FibGUoY29ubmVjdGlvbik7DQotCWlkYV9mcmVlKCZtaW5vcnMsIE1JTk9SKHJhdy0+ZGV2KSk7
DQorCWlkYV9mcmVlKCZtaW5vcnMsIE1JTk9SKHJhdy0+ZGV2LmRldnQpKTsNCiAJZ2JfY29ubmVj
dGlvbl9kZXN0cm95KGNvbm5lY3Rpb24pOw0KIA0KIAltdXRleF9sb2NrKCZyYXctPmxpc3RfbG9j
ayk7DQpAQCAtMjQ0LDggKzI0OCw3IEBAIHN0YXRpYyB2b2lkIGdiX3Jhd19kaXNjb25uZWN0KHN0
cnVjdCBnYl9idW5kbGUgKmJ1bmRsZSkNCiAJCWtmcmVlKHJhd19kYXRhKTsNCiAJfQ0KIAltdXRl
eF91bmxvY2soJnJhdy0+bGlzdF9sb2NrKTsNCi0NCi0Ja2ZyZWUocmF3KTsNCisJcHV0X2Rldmlj
ZSgmcmF3LT5kZXYpOw0KIH0NCiANCiAvKg0KLS0gDQoyLjUyLjANCg0KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0
IC0tIGdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKVG8gdW5zdWJzY3JpYmUgc2VuZCBhbiBl
bWFpbCB0byBncmV5YnVzLWRldi1sZWF2ZUBsaXN0cy5saW5hcm8ub3JnCg==
