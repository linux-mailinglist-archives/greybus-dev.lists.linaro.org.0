Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UQDQNTr4wWlSYgQAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Tue, 24 Mar 2026 03:34:34 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 41D6E30134E
	for <lists+greybus-dev@lfdr.de>; Tue, 24 Mar 2026 03:34:34 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id D8DD33F9BB
	for <lists+greybus-dev@lfdr.de>; Tue, 24 Mar 2026 02:25:43 +0000 (UTC)
Received: from mx0a-0024c301.pphosted.com (mx0a-0024c301.pphosted.com [148.163.149.154])
	by lists.linaro.org (Postfix) with ESMTPS id 7E0433F76C
	for <greybus-dev@lists.linaro.org>; Tue, 24 Mar 2026 02:25:41 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=silabs.com header.s=pps12202023 header.b="lKcz6D/K";
	dkim=pass header.d=silabs.com header.s=selector1 header.b=Ik6ZuYbk;
	arc=reject ("signature check failed: fail, {[1] = sig:microsoft.com:reject}");
	spf=pass (lists.linaro.org: domain of "prvs=1543d7b3bc=damien.riegel@silabs.com" designates 148.163.149.154 as permitted sender) smtp.mailfrom="prvs=1543d7b3bc=damien.riegel@silabs.com";
	dmarc=pass (policy=reject) header.from=silabs.com
Received: from pps.filterd (m0101743.ppops.net [127.0.0.1])
	by mx0a-0024c301.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O0Jg8p3800542;
	Mon, 23 Mar 2026 21:25:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps12202023;
	 bh=qOilV5UKNKVuHtrsFv4nnXhkt5kiL3iGdMHHgPXaYNM=; b=lKcz6D/Krf4c
	Z1RER2cC/llkg7ENG6v92mOi6d/KnFef0gzlGijFM9xf0lqtgnnU2mNi5fiqgIpf
	WZqmSyCWCMSd+OHoFZ8EFTzh3B4RdtHa4+OGJkKSvwduIBGZGpB2GAfsz1Q8M2Zp
	jW18CW/DkxPGZMYDqCpMmZl9tKGLjPgAF+cvPhgJO5lCU+nerPHij45CB6kDLhxV
	5edAWuGM+PV3ihCgCDECbmshw6at1+qzG42YZ37vi8VkX8pCnRI7AR8f78ePrM6+
	JhIRKcg0CGlxlKglKMxlrDysFoKdjBX6+5+gfPhMrmO44I/bM4L5DyWNVq4xO4mn
	vf9CsVYWxA==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11021102.outbound.protection.outlook.com [40.107.208.102])
	by mx0a-0024c301.pphosted.com (PPS) with ESMTPS id 4d1qn5ckv9-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 23 Mar 2026 21:25:24 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TzZ5FcLMq1utohQ7bmw3gO++jv/0GmS1b44s+MQy3tYMsHlLBev7XTax8F40+O89tcSfs46UMaNdfed1SLP0OkHi1aGdOlysLJ5o7VrzLox8BtKGnujAmEknCc0AbpXpMKXo7gxZeWeXnIOZ26KsR6TkQoZ8DriFiEyJADpiI/WE2FxEGMOOsAfGUPdtf3mC1MUmC84GgezWbzFUrn+sI0tyjZWS5XTrzHYo+wBttzTSM3lK/3OwakecZGIfj1t7jdceet5FACTQ2orqlOqufQNM3Z9z/rLbVG/lYAuCIwJzXNFn8/NtZeB6XQ7uRxoRvidy7fugDRfjgzKb0pd56Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qOilV5UKNKVuHtrsFv4nnXhkt5kiL3iGdMHHgPXaYNM=;
 b=a5/s/ATziXbWPJElEzHK6zqum1MRPgxkRajhiq3ycL0lAGOZkTUiU0qLCl1lTrljq98QLUGqVzzbkInTDbqTZO8d1Hjn8oflrG56aefW8vWupfo0/6BT/E1CXll/6eqidaKHDnRk2erpUUDlDxQDudo6PUyFhj32pUis8umnbPPb2TUci00js2XJUdMmYyXQrk9HymELxA+8+7OKiUMhHqp6/ZJrSWPgiYbm/QZOB+Ohu1ZMGb8zYEeXu0YmtHvxCclL0vjGuPSEs9uiIaW8cIVcK4BS/dEBbRC7I/wt4aDm/jUxSGETxNf+xCuGi636on7BEOUllf+QcVCLixsr6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silabs.com; dmarc=pass action=none header.from=silabs.com;
 dkim=pass header.d=silabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qOilV5UKNKVuHtrsFv4nnXhkt5kiL3iGdMHHgPXaYNM=;
 b=Ik6ZuYbkBT/EKdZKGcSB2BUm5CRdf8M7WpR9IkcZut088Ze4RjVGjdwW+FkGvmfPvDgkm1Fsr0wAPYGYDwq1P2yviJMbEEjXnl5DlXO3dqMDCcqobCv1fgkee6+H27OMg1CULjD+KNt+zS6vhKepimkcb8Z/Z9jcAh7EgcnS7MQ=
Received: from DS0PR11MB8205.namprd11.prod.outlook.com (2603:10b6:8:162::17)
 by BY1PR11MB8128.namprd11.prod.outlook.com (2603:10b6:a03:52c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Tue, 24 Mar
 2026 02:25:23 +0000
Received: from DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::2de6:bc88:2af7:3583]) by DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::2de6:bc88:2af7:3583%3]) with mapi id 15.20.9745.019; Tue, 24 Mar 2026
 02:25:23 +0000
From: =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
To: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org
Date: Mon, 23 Mar 2026 22:25:10 -0400
Message-ID: <20260324022510.28596-2-damien.riegel@silabs.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260324022510.28596-1-damien.riegel@silabs.com>
References: <20260324022510.28596-1-damien.riegel@silabs.com>
X-ClientProxiedBy: YQBPR01CA0148.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:7e::10) To DS0PR11MB8205.namprd11.prod.outlook.com
 (2603:10b6:8:162::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8205:EE_|BY1PR11MB8128:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ec20a24-c313-4c84-cf4f-08de894c99eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	+JMpBWPNErsmhoLCJvEvDu56Uv10iEt9SPFTZ34eUOAIbvkJb98AEtnAdaCCOOQL/Y9gz7zR32JlgIrBe9G2fdHyuXiEK2vGK59FHkjm0IrSemqWFLavrVzQrEaXY+tLip3zEHtWK76qgC5aOgX5+J6GFPkIKjKpHGOWE8NHkn35AkUBq88oaLixwTG2yqp707+P3FScm3zyytcNnaVeS/bhay9YMcSTAOrUrbUUzjshRORu+3TlRyjBTITQWEHzfc3MhaIpwWt6lJXJzWH2ESFXdD+Mio6dj0NuX5N/BviFzxtO7eSVbGm/e2pMfFazMMhPdsTlJryAdEcV7uOlrqa47IuBfLaC+murLh9QQhe01JBP3g8ud97tC0JY5tLsmwZMZdevhzRmvji6HVtszCi6YcgDW+8dUZ4Vtbws730wRiUffcuIs8ohtjQvjHKQeGRRK1isKvZl1vx2DUJ78vtwrs/vwOFeKT5KeobFdlqbcRz6eIIjbeBGjf7gygVDiLK9QE0kQKkGrnmyxXKeMLxNfhQN0w/DmvqNUPpIy8AGDY+jJLwwnIKRYKbbK4UIyvUP8Uk7irFF/YLx0m4VLqkekrsDR2YRAZqZ8K3iGubFXnU0lOP1y2A27RCikjiMXskyJqdtfIMmfMsfEcdbJHVIg3rDe+oHg2Hl81DUepOslKEKDZB7Dq0zZ4kyDU0SCn4yX8AK062+hWQWub1XW98H8hgIE3c1agBxBJDIiKUTXjYWAWniAkI72IiMeTAbp2FmahHCdtHSW3ojOMuXLkLdrFGwE9Jf6gb9uOmPgnc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8205.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?K2s5akdFbTFwdzhsYTA3Z201VnkrcUk3UFJ1OW5USFo5RDhuSFdKRjl5RnRh?=
 =?utf-8?B?YVVQbUViS2tXWEVKaWdIcUtQOGgrRHBTZkJmSFZxZm5henpGS3RaZE5OSnVi?=
 =?utf-8?B?bGtSaWZTbHVlS0xPV3FFV3krem11TEQ3eFZxMysrWmQ4enhQNFQwUWJ2SXly?=
 =?utf-8?B?dWREV0Z6a00xam9Va3JsYTZFeGJsNjJJWTlmbGhROHovb3pvMTdhbXZCU1Jv?=
 =?utf-8?B?Vis4elRZR2JTQlJTanRBUHBOeWpsQ09QSjhVb1IzVXNMbVBOajBST3NZNHZq?=
 =?utf-8?B?enloT1o0Yll5aXhBZGxFaU5LYWZuMlhWTlNjR09ablBEci90bURrcUlJK1dR?=
 =?utf-8?B?TGxJKzltbFp0VUUwdjBzWXNTR01kRWwxbUdGTHlCVFNCVnFMRHN1a2pxWWox?=
 =?utf-8?B?UFQ3bkhYQ2RFK29YYjQzQ2d3YkV5THBIWTV0YUF6clovdkZmZjFqeXpJWlBm?=
 =?utf-8?B?WFliZ2gyZzNXamZnMjQyMjA2eHgxdlRtVE9XSUlLcXhGekhTcWZOMTloL0FK?=
 =?utf-8?B?aFJiNmZrSzlqWE5hUTZlZmh5TGJPQXRYdk9RSzlmc285K21OUUVNY1g4TFM3?=
 =?utf-8?B?SzVxcDAzdE5WY1M2ODY0QWFObkhtbEgyQjB4WUx2c2djL2lETWp3Y09ONXdC?=
 =?utf-8?B?V0xLelRyV2x2ek9EYXR3RG5YQTF1RWp6K09PQ0RRbTdweVZlcDJlRlg2Wldq?=
 =?utf-8?B?bWtLWCtsN3dwVW1TQjhaaVNFV2dJV2dONnFubFhJR3hyVWp3Tm15dXBLcTZM?=
 =?utf-8?B?cWZUdWtzcHpscWRvbXdwUDAxZEkxVFhwaFZIOUNCTnJQN1FaL200WnM1b1BH?=
 =?utf-8?B?M1hRMGhFekxmZkwzd0pJRDZjakI5TGk5UE5ZZ0lORmx5YStBTDlFMDZqbmE3?=
 =?utf-8?B?MEJ5b2dWWmRvaDUyYmZPcUhWM1JicDRwS1hlSnN2MVMvalJ6WEYycDBYMlh3?=
 =?utf-8?B?bTE2YVA0Rld1TUQybnVnajJsdHdOcEpRdU9icy9CQ2NjenZxRWwxRVRmNzhi?=
 =?utf-8?B?Z0FRbmM2YmtUUTZycmpUWG9IcGdEWTE2QmY2WjNUZitEYVV4c2tLYTZDMFg5?=
 =?utf-8?B?eEgrMnNmWjJ5R1o4TDQ0aXlNT2JxSlFpWDNWS2NYTE1rZ2N5UmlsckdrSmlU?=
 =?utf-8?B?Vzk4OFdOci9ycFFtaS91VDZyZGI3U3JYMDBlZnJvZVNzSE1YYWlsekRSVWVJ?=
 =?utf-8?B?aER1YnA1b0wyNTh0UGNZV1ZPKzIyeEs0akx4TXNwRStLdnF6dDZGVGRnSm9m?=
 =?utf-8?B?aDRhNlhCSUpYSTdYdFp3WHhjY0RMd1hjOXJHMTJWY2svL3Avd0ZDTm5jQ1Za?=
 =?utf-8?B?dnZVdHpqam1SL1FkSHNHUVJEZzFQeHdNQTJCQVBaSHFZYysyQkRWcnAxTy9n?=
 =?utf-8?B?eXFDMWNSOFMzQkVVSHdITXp4K1pMTzdHOVpiOTkycThHbEVvc01TWmZYYUE0?=
 =?utf-8?B?Y1Jhd2t6YnpyMjhNUytzeFV3WmlOb1lwL0tyMDdOTjVkZWRIc1d4UzVLSGJx?=
 =?utf-8?B?YlZLREY1UjRoM2F4Z0djajFLTzFjc2YvYmd2QWZVVTJjQWFRS3dPcHFTYVZz?=
 =?utf-8?B?SXhBWllNZUxnS0E0NXpicS9ORkdZRmRZWGxCbUI2bk81dW40OUdxV1dKdmUw?=
 =?utf-8?B?akxYMFZ6dm01eXJuQ0labzA0Ny9FK1pVMElKQy83Qmt4amc2eW9QRHNHYXls?=
 =?utf-8?B?VWhCUDRXa3pQa2s4ODB0ajluT1pObGtPQ0wvZTJjYVExN3hlVUk5ZTdtYVhK?=
 =?utf-8?B?TXlKcVpjdENtaUtJTGM4bzFBZzNXWHJISWRrTGdWQjZOWW1iV0xqNkc2aEVp?=
 =?utf-8?B?OGRnMFoyL09qQ3lxRTZVaUdYRGlVa2NiYlJIS29iZ2NaMm9BOXdlU0tOVTJp?=
 =?utf-8?B?VE9kOGRjYXJ4Z2xVb3B6U29tRHNhdmFqUFltMjZ2NGZOVzJGRk1UNVhUQ0E2?=
 =?utf-8?B?dytvSmgzUzBtTlAwOUNDWjlUSUcwa3NtYmJtL3ZTZXJCbDJhRUNhTVFla2dP?=
 =?utf-8?B?SnU4cmNUQlFXN211SFVDbFduWmI2YVFkTU0zK0FXU0ZHTUNqeHlodmZybncy?=
 =?utf-8?B?azZBYUo4ZEdtcVpUQTI5QTdpcWxGQ24ySlNIVFdiR0UzK3JPOXNqZUgxNFBn?=
 =?utf-8?B?OHF0SFRDOGk1QTZCc3NOVC8zaGZ5NDI4WWo3ZHNqVFZlVFdNM2E2aDZENFAz?=
 =?utf-8?B?NitaZi9Ic0JDL0Q5dnBaYTQ5RHlHU1g1MUROdDhhUWN3czdJTkE0L3JqcWxq?=
 =?utf-8?B?VHBGalpBbnljSXJ6WVMraWh6aEU5L1lnRTl3MEQ0cGdHMlBDYzRnZHR4UlM0?=
 =?utf-8?B?eFl1S2hPTm9rVko5eG9VbXByYzBINE5wSjl6RU5DbmdJYlB2S3FrQT09?=
X-Exchange-RoutingPolicyChecked: 
	kHuY4kXuukmYYF1/nWOUqoJS4Uj2yPXPlBVRiGujQ+APpw6xsRD9STAW4cVj6kzElGz6sT4aIGmZLUJCqYQ8uvlpIPs1DtyqT/JJeRQlUN5Eo1xKJAzWaM+Qi/P4YtcxxJNXpVtvMX/CL1ltK0PSU57tszMnoMJl2KwZ4mKlJRt1JESmnbUrolGHXsHZMWFzOEIJIa+yrUbAkXfsp7VJiiOOqEq1HVI3tyiCHX6Sb4Ox9Uh5GqAQd5qUOLc/FRYlkZvpM2h8iKrLYwGF463FqugMd9cu9wjGbXn9TRksgSFlFOL3wCITJ/enaoLBeQcaxn3D5D8aHJta1F7hGdHuuw==
X-OriginatorOrg: silabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ec20a24-c313-4c84-cf4f-08de894c99eb
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8205.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 02:25:22.8092
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 54dbd822-5231-4b20-944d-6f4abcd541fb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xeiHaZoy1vMVbaBG+t7REvZxNmIbQxDt7BTd0Mhm9+Jq5nglOH17722/AC9Qd/99Qsk42I257hR58VszM3ODFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8128
X-Authority-Analysis: v=2.4 cv=T5CBjvKQ c=1 sm=1 tr=0 ts=69c1f614 cx=c_pps
 a=77rI9ysV2qQyIatzbb/mKA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=M51BFTxLslgA:10
 a=i1IsUcr2s-wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=gIHJBl62Mt9vjvfn7G3b:22
 a=6KgOrB_2K63Cyhqxo4vW:22 a=2AEO0YjSAAAA:8 a=oNt1VjkYWJ0Z_SXrehYA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: 8JFF7HgqKUhrE78MTrot0Orkm1eJfZcJ
X-Proofpoint-GUID: 8JFF7HgqKUhrE78MTrot0Orkm1eJfZcJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDAxOCBTYWx0ZWRfX5nsF/xowScq4
 0h/nRAbbOXqbOm5RsSmtOqWQf7/48PfKZJS/Cq34Qy812Cxf7PUPqtQeaIqxU6haETZhhwq6fZd
 Z4+SHbwpROAVBn/GAWySSMNY/1jc5cWKmfxMl5rKgp86qiFTL1PmS8KMo0zWveBwGhlxdaKqpFX
 vkpmaXkoy7OJOUMt73iLLuviCYIs+QMbktfQWtJ4lfCX8TePnnhFAKvPtAL9QDoy9Y72mvhcA2X
 A2sEXdctGyCYYfTyZ8VhJEpIQyvrhIQbA/wEShGV4VSOSGibZMpWWWy5BEEaqVzVlBuaryUhdbo
 Iv0Oc6e45pvLCeBMtkgo+dBzUffsWg9Ua5CPuk82Y0iiTurPsd5VOrZ51k4EnJbpOPWWX9FUuqT
 WoFPFQfm4cUTYjg1HS96J1PVXZBocEofRxCB8dYYjROR08/EPv277Ol9toxsenFj0wZw8SQul3P
 LCO0QGpbW11dyKZJ7XQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_07,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240018
X-Spamd-Bar: --
Message-ID-Hash: NFJVO3ALTJTFAK4SGC5R2AGKDH6J2RV5
X-Message-ID-Hash: NFJVO3ALTJTFAK4SGC5R2AGKDH6J2RV5
X-MailFrom: prvs=1543d7b3bc=damien.riegel@silabs.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v3 2/2] greybus: raw: fix use-after-free if write is called after disconnect
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/NFJVO3ALTJTFAK4SGC5R2AGKDH6J2RV5/>
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
	GREYLIST(0.00)[pass,body];
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
	NEURAL_SPAM(0.00)[0.984];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linaro.org:helo,lists.linaro.org:rdns]
X-Rspamd-Queue-Id: 41D6E30134E
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
bm5lY3QuIFRoaXMgZ3VhcmFudGVlcyB0aGF0IHRoZSB3cml0ZSBmdW5jdGlvbiBkb2Vzbid0IHRy
eQ0KdG8gdXNlIGEgZGlzY29ubmVjdGVkIGNvbm5lY3Rpb24uDQoNCkZpeGVzOiBlODA2YzdmYjhl
OWIgKCJncmV5YnVzOiByYXc6IGFkZCByYXcgZ3JleWJ1cyBrZXJuZWwgZHJpdmVyIikNClNpZ25l
ZC1vZmYtYnk6IERhbWllbiBSacOpZ2VsIDxkYW1pZW4ucmllZ2VsQHNpbGFicy5jb20+DQotLS0N
CkNoYW5nZXMgaW4gdjM6DQogIC0gcmVuYW1lICJjb25uZWN0ZWQiIGZsYWcgdG8gImRpc2Nvbm5l
Y3RlZCINCiAgLSBhY3F1aXJlL3JlbGVhc2Ugb2Ygd3JpdGUgc2VtYXBob3JlIGFjcXVpcmUvcmVs
ZWFzZSB3ZXJlIGluDQogICAgZ2JfcmF3X3NlbmQsIG1vdmUgdGhlbSB0byB0aGUgY2FsbGVyIGlu
c3RlYWQgKHJhd193cml0ZSkNCg0KQ2hhbmdlcyBpbiB2MjoNCiAgLSB0cmltIGRvd24gdHJhY2Ug
aW4gY29tbWl0IG1lc3NhZ2UgdG8ga2VlcCBvbmx5IHRoZSBlc3NlbnRpYWwgcGFydA0KICAtIGNv
bnZlcnQgdGhlIG11dGV4IHRoYXQgcHJvdGVjdGVkIHRoZSBjb25uZWN0aW9uIHRvIGEgcndfc2Vt
YXBob3JlDQogIC0gdXNlIGEgImNvbm5lY3RlZCIgZmxhZyBpbnN0ZWFkIG9mIHJlbHlpbmcgb24g
dGhlIGNvbm5lY3Rpb24gcG9pbnRlcg0KICAgIGJlaW5nIE5VTEwgb3Igbm90DQoNCiBkcml2ZXJz
L3N0YWdpbmcvZ3JleWJ1cy9yYXcuYyB8IDI1ICsrKysrKysrKysrKysrKysrKysrKy0tLS0NCiAx
IGZpbGUgY2hhbmdlZCwgMjEgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkNCg0KZGlmZiAt
LWdpdCBhL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL3Jhdy5jIGIvZHJpdmVycy9zdGFnaW5nL2dy
ZXlidXMvcmF3LmMNCmluZGV4IGU2Njg0MzhlMWEyLi4xZTdmZmExMGE1MCAxMDA2NDQNCi0tLSBh
L2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL3Jhdy5jDQorKysgYi9kcml2ZXJzL3N0YWdpbmcvZ3Jl
eWJ1cy9yYXcuYw0KQEAgLTIxLDYgKzIxLDggQEAgc3RydWN0IGdiX3JhdyB7DQogCXN0cnVjdCBs
aXN0X2hlYWQgbGlzdDsNCiAJaW50IGxpc3RfZGF0YTsNCiAJc3RydWN0IG11dGV4IGxpc3RfbG9j
azsNCisJc3RydWN0IHJ3X3NlbWFwaG9yZSBkaXNjb25uZWN0X2xvY2s7DQorCWJvb2wgZGlzY29u
bmVjdGVkOw0KIAlzdHJ1Y3QgY2RldiBjZGV2Ow0KIAlzdHJ1Y3QgZGV2aWNlIGRldjsNCiB9Ow0K
QEAgLTIwMCw2ICsyMDIsNyBAQCBzdGF0aWMgaW50IGdiX3Jhd19wcm9iZShzdHJ1Y3QgZ2JfYnVu
ZGxlICpidW5kbGUsDQogDQogCUlOSVRfTElTVF9IRUFEKCZyYXctPmxpc3QpOw0KIAltdXRleF9p
bml0KCZyYXctPmxpc3RfbG9jayk7DQorCWluaXRfcndzZW0oJnJhdy0+ZGlzY29ubmVjdF9sb2Nr
KTsNCiANCiAJcmF3LT5jb25uZWN0aW9uID0gY29ubmVjdGlvbjsNCiAJZ3JleWJ1c19zZXRfZHJ2
ZGF0YShidW5kbGUsIHJhdyk7DQpAQCAtMjM1LDYgKzIzOCwxMSBAQCBzdGF0aWMgdm9pZCBnYl9y
YXdfZGlzY29ubmVjdChzdHJ1Y3QgZ2JfYnVuZGxlICpidW5kbGUpDQogCXN0cnVjdCByYXdfZGF0
YSAqdGVtcDsNCiANCiAJY2Rldl9kZXZpY2VfZGVsKCZyYXctPmNkZXYsICZyYXctPmRldik7DQor
DQorCWRvd25fd3JpdGUoJnJhdy0+ZGlzY29ubmVjdF9sb2NrKTsNCisJcmF3LT5kaXNjb25uZWN0
ZWQgPSB0cnVlOw0KKwl1cF93cml0ZSgmcmF3LT5kaXNjb25uZWN0X2xvY2spOw0KKw0KIAlnYl9j
b25uZWN0aW9uX2Rpc2FibGUoY29ubmVjdGlvbik7DQogCWdiX2Nvbm5lY3Rpb25fZGVzdHJveShj
b25uZWN0aW9uKTsNCiANCkBAIC0yNzcsMTEgKzI4NSwyMCBAQCBzdGF0aWMgc3NpemVfdCByYXdf
d3JpdGUoc3RydWN0IGZpbGUgKmZpbGUsIGNvbnN0IGNoYXIgX191c2VyICpidWYsDQogCWlmIChj
b3VudCA+IE1BWF9QQUNLRVRfU0laRSkNCiAJCXJldHVybiAtRTJCSUc7DQogDQotCXJldHZhbCA9
IGdiX3Jhd19zZW5kKHJhdywgY291bnQsIGJ1Zik7DQotCWlmIChyZXR2YWwpDQotCQlyZXR1cm4g
cmV0dmFsOw0KKwlkb3duX3JlYWQoJnJhdy0+ZGlzY29ubmVjdF9sb2NrKTsNCiANCi0JcmV0dXJu
IGNvdW50Ow0KKwlpZiAocmF3LT5kaXNjb25uZWN0ZWQpIHsNCisJCXJldHZhbCA9IC1FTk9ERVY7
DQorCQlnb3RvIGV4aXQ7DQorCX0NCisNCisJcmV0dmFsID0gZ2JfcmF3X3NlbmQocmF3LCBjb3Vu
dCwgYnVmKTsNCisJaWYgKCFyZXR2YWwpDQorCQlyZXR2YWwgPSBjb3VudDsNCitleGl0Og0KKwl1
cF9yZWFkKCZyYXctPmRpc2Nvbm5lY3RfbG9jayk7DQorDQorCXJldHVybiByZXR2YWw7DQogfQ0K
IA0KIHN0YXRpYyBzc2l6ZV90IHJhd19yZWFkKHN0cnVjdCBmaWxlICpmaWxlLCBjaGFyIF9fdXNl
ciAqYnVmLCBzaXplX3QgY291bnQsDQotLSANCjIuNTIuMA0KDQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpncmV5YnVzLWRldiBtYWlsaW5nIGxpc3QgLS0g
Z3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpUbyB1bnN1YnNjcmliZSBzZW5kIGFuIGVtYWls
IHRvIGdyZXlidXMtZGV2LWxlYXZlQGxpc3RzLmxpbmFyby5vcmcK
