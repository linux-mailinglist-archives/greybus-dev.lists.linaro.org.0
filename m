Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 7692CCB93D1
	for <lists+greybus-dev@lfdr.de>; Fri, 12 Dec 2025 17:14:03 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 94B6E400F9
	for <lists+greybus-dev@lfdr.de>; Fri, 12 Dec 2025 16:14:02 +0000 (UTC)
Received: from mx0a-0024c301.pphosted.com (mx0a-0024c301.pphosted.com [148.163.149.154])
	by lists.linaro.org (Postfix) with ESMTPS id B08983F900
	for <greybus-dev@lists.linaro.org>; Fri, 12 Dec 2025 16:13:36 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=silabs.com header.s=pps12202023 header.b=zOmZY6JL;
	dkim=pass header.d=silabs.com header.s=selector1 header.b=bJVddc29;
	spf=pass (lists.linaro.org: domain of Damien.Riegel@silabs.com designates 148.163.149.154 as permitted sender) smtp.mailfrom=Damien.Riegel@silabs.com;
	dmarc=pass (policy=reject) header.from=silabs.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from pps.filterd (m0101743.ppops.net [127.0.0.1])
	by mx0a-0024c301.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BC8WO7R3748684;
	Fri, 12 Dec 2025 10:13:27 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps12202023;
	 bh=/vu99iSv7WNg4c3o8KjzIRRINo/BhiWALOiKHQ8sV9M=; b=zOmZY6JLQdJt
	ItX5HsaVximwVnsOfY5/LqGv/l7d+hMS6fye02OzfK1vL8lXheeenitEHNZy1x6+
	7oSQ67WywL7MYbNHJqf+7/1TDK35WtqluDqUnN7EvxCfAHHqutj2RPb4bC0WOy7F
	It8grFkWmmNfe5NwAcSJDQ+dwAT1uo5pzT+aw42kICS1O711PSdESeaB4QmbWhTr
	0JZR8K2Dgws4s/gl9dXSkb3I6DGZBrCAHOTSkjXWtEW1HwuKyBNJFOkLOPQe/Y5D
	/fULuFJXFfzSI6NnDIWsMecIwOoiIa/a9ovw57dbz4Z3/0sI3eiMYYVt4xKqcqg+
	QGbpVZmcKg==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11021114.outbound.protection.outlook.com [52.101.52.114])
	by mx0a-0024c301.pphosted.com (PPS) with ESMTPS id 4ayht2mdee-3
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 12 Dec 2025 10:13:26 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B44WFTcPFjAJGiu1dyLIe64Yv3HRlqWjTNPwbv1CELpLex6H0rQSlKvEh1afKQdDgCBeIKeV+YlatOdSWX0lQt81CUXP+0x5JtDAoEaDYEXM/tPqWNF0USkuKKm7PDvrvTUnaQoDGfGeNGdq4dysaBsLHwW+YN9xq+9kGtQthmKC1XHcW6pQgFd/xN3V7kRSJl71pzD8HomUAmGF8gjYifXAJP7YJ9XkrPo5QKj8JFosIOuKzVgkPUkD/eAeGZ2SRuI8Q70BEiMcwY1d99xoWpzQIVE68dRPZR2y9nzFSjeeLaJ/0PxBjtABbCvYcNwhexjXOlclHLYteAGJHj/AqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/vu99iSv7WNg4c3o8KjzIRRINo/BhiWALOiKHQ8sV9M=;
 b=trFEsK6M5Fg0MFhS935XySaogrPO2rRDu4nwc5lCGhZyfmsH4qKZFnan0veJJZqoQQfR3RJeloCIjXvnaA/4/Xu684WVM3neVhUvW3dSwY6azyTylErIjNpH2QNY5Fpmgy2sslCTOpHPOgem2cuuuLqFJdQROdCUWAnYpMDPsD3qb53LzyH3LnVyAhkcj/VVq388wVQGHxXiw1PA4hKMINfnkyDFr1dLb+vCUfNhbCZJ48Z3xVSfmMAJWqO+XLjb7vm/SS9YLMait6Lp0YBEYM4Ydw2EfOgurF2DsYGR2BNDytjSa2csCAbEguGLrqo81R9ZwmSIwjCFXoEDPOTeLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silabs.com; dmarc=pass action=none header.from=silabs.com;
 dkim=pass header.d=silabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/vu99iSv7WNg4c3o8KjzIRRINo/BhiWALOiKHQ8sV9M=;
 b=bJVddc29gL/6aLHWSh3GzQ0wA/EcypTGNNJUUeJunGssk6Jctj6iUReFjJbeEP7kvHVw042vtGtl+ZoEta/+WtdvNU6BW8RoYLGHQ35ivElXhvsulXRrGlQxU1mQxdHEErjXOmpj+yhOlwoIMKv4uaY0uBhb1umNrRTWoQm8vBQ=
Received: from DS0PR11MB8205.namprd11.prod.outlook.com (2603:10b6:8:162::17)
 by MN0PR11MB6111.namprd11.prod.outlook.com (2603:10b6:208:3cd::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.9; Fri, 12 Dec
 2025 16:13:23 +0000
Received: from DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::2de6:bc88:2af7:3583]) by DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::2de6:bc88:2af7:3583%3]) with mapi id 15.20.9412.005; Fri, 12 Dec 2025
 16:13:23 +0000
From: =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
To: greybus-dev@lists.linaro.org
Date: Fri, 12 Dec 2025 11:12:57 -0500
Message-ID: <20251212161308.25678-4-damien.riegel@silabs.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251212161308.25678-1-damien.riegel@silabs.com>
References: <20251212161308.25678-1-damien.riegel@silabs.com>
X-ClientProxiedBy: YQZPR01CA0176.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:8b::25) To DS0PR11MB8205.namprd11.prod.outlook.com
 (2603:10b6:8:162::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8205:EE_|MN0PR11MB6111:EE_
X-MS-Office365-Filtering-Correlation-Id: 64452895-01cb-4952-6a32-08de39995fea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|366016|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?K2VKUitLNkg0VU9SVlAraWgzTVNqVFRvV1pMS2ZqTWZmUEZSUjloM0ZpN2VV?=
 =?utf-8?B?Y1NRdFlLMGhmblYxM2JKR1U5Zmh0UGJpeGN6NS9odDZVVjk0Y3prNTBhVnRa?=
 =?utf-8?B?d0V0dDhCdXRNaUZKVi9IVGtHWXJxRXprK1R2bU96Qm9iTkhlVU8wOHE1TTZ6?=
 =?utf-8?B?U3lVUUovc1BqUGpWaWR5SmF2ajRmdFZzdGxmb21ZQWVSZ3gzUGY3MUlaRVFq?=
 =?utf-8?B?RENwZGYwaUx6ajhYS0RHdXZXWEw1YUVSWndhbFVCQWJPazl3WWpkeDM2U2p3?=
 =?utf-8?B?MVozbGZQalJNYkQ0MEU0cmZOL1lVQmZnd1krZkdRM2xBSldZZUxJM1g2cWlV?=
 =?utf-8?B?VWNwMDlqMVlXcTlyMEFDU05HdGRDaUNhUzd1WXYwMHN3cjYzRzJLbjZVZlZ1?=
 =?utf-8?B?aGJmTVJtaTNkUUdxRCt3Q3UwUk9lbmRZSHVPRjR2Q3BaZm1Xa1ZlSkR2SHJR?=
 =?utf-8?B?SERtVU5wdFh4Wk9sUktHWmxPaENJRkNqeDgrWnZTcW5ackRqbjlOOVIvMU12?=
 =?utf-8?B?RTExcWFIei9pK05QL25nd3dsTk5jZnhnMzkxdGozdWt1VUROeXZKUlRiRXRy?=
 =?utf-8?B?K3BTL1VxNWxsZDhPNDZhNy90SW9mcXdWTG56QkR6YlBCQTQ4RnFQM1NXam1D?=
 =?utf-8?B?Sm5mcm5ubVFIWlpWVzhSNENlbzB0d1RtV1FHeEl6VDNsS0p6dGNPenRrMlhl?=
 =?utf-8?B?SmNlWWxzcjEyb2NwVkVGeDl2Yjcza1VwdjI5RGpUOGpwQVU0WkdwWU9CZi9Y?=
 =?utf-8?B?YThoUkV5b0lhQ3V5WHZyaGRLRGFLcnlJMXdFL01Nc2c3ZHlCTEFIRWZnQjB6?=
 =?utf-8?B?ODk2WGRjQ0E2Qk5jRFhBRFI2WnNhd0dJdHpOamlNWGFIcTBJNDJWZjBxMTNK?=
 =?utf-8?B?cmU0ZTRmTjh1dmpKUlY1WDdESHJmOE1IL01nWEdxb3BLUlFzTEQ5UmFYNU9H?=
 =?utf-8?B?WGlVaWNwb2NBUEt6QWV6N2s1NkJZNmcrbUdMTTh5b0Y1Ni94cEhLZ2lIc2FZ?=
 =?utf-8?B?OE8wWW56SUNKNDdDRlc1RkNCVGtQVlpBaS9ZWmxiS2ZDUk9DZmNaNjhpaVFN?=
 =?utf-8?B?YVRUUCtFSExyTVFUYk9iWVhvQWVhN1hwK1k3U2hwemVPaUhhdXVsMjdxQnJq?=
 =?utf-8?B?KzBjb2l0SXNISGlPczhKNGxMbTJPZUtYd3RkRGZWZE5RM002Y0RvNmxFR3BS?=
 =?utf-8?B?Mlh0cVlQSmhUWXFkalJIbHJNekZiMjdtbXdjN3lUQWVUdjBjdEpxa2JiMG4z?=
 =?utf-8?B?TmpVbU1CUzNWamhqNE9SdUpYdE9zZWpoKzNHdUZzNTZneHplckVFSWRYK0Uv?=
 =?utf-8?B?T3k4YXFhZnI0V3dRTnllSHVqR2MvbGtPaEZ2TmNnOTh1MUd3WEkzZEw3TEhv?=
 =?utf-8?B?V2RtdXRkUVdWMFdVNFZYQWhBVC9UeE1Qd0pzaFo5WkRFOVVUWWI4NFRjUlRD?=
 =?utf-8?B?SE1mRjJrbXZPa0ZwQTBKekphMG9IcXBGMi9CUStlOHZnTEpWU09Eek9mYlpv?=
 =?utf-8?B?WVNYWVVwQmp3LzVTdFJZNGlFZGgxMFJiL2pXSDVicGVOcktnRWtBb0JMTTRz?=
 =?utf-8?B?WE1Gd0ZyNXlXR2dFd1BCQzBHM1M2YjA5TUc0d29Sb2pPbDR5TGJINk1Mc3ZR?=
 =?utf-8?B?OW9SNjRVS3lQSmJCUldYVVgxQ0tYcUJ5eHNYNzY5SmJrdEh5U2tQb0g4Yk5t?=
 =?utf-8?B?R2czZE5lWlVpOThzNXhVKzhvcmljSDFGazNiSWdXMlgzakhTR1VsSEFrRFQv?=
 =?utf-8?B?a0xUYTNTeC9wRDBOcGgyeEV6S09RV0dZSGpZUUxYdTJmelBQUkpKS2NNazgr?=
 =?utf-8?B?b3M1a1l0ZVI0czZWQnc0L0JiWmx4K1VQN0ZydkZYNHduK0VjdGdjUitXTUlh?=
 =?utf-8?B?VWFtemtEajRHekhTeWR2QUtXM1dMMk5YMDZFZlFmSDV4R3hpRDgrUHkzMG1V?=
 =?utf-8?B?YmVLaGJmcU40N1NBWnhnMG1NM3hGYWhCdW40dkU3VzljWXVHV2M5cVNlTVhQ?=
 =?utf-8?B?dzdZRE5mR3NmZmJYelJWWFNOQnBhd21lZ3dIcmNaUWplVXRSS3o3NTZibExM?=
 =?utf-8?Q?FyvwfJ?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8205.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(366016)(376014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZUJwRWF4TytmOUtyUFd2UWV0ZE40MjV4WFA3RmdoZjZzWXBpcFhUbzlHaS9Q?=
 =?utf-8?B?aVlLdGJKNjE3azhxNGdvYys3a3ZjSHZGWFQzL29PUFd6VkhuMnRyRmNXeFFM?=
 =?utf-8?B?cE9NMDRJUlFxdEQ4c1BmZWRic1M3QVg0SitNV1RsaXJsMkRsZ3JNa2o5Qy91?=
 =?utf-8?B?QnRySjNWOE83TlRvNm1waWdSWEJCVUxFMGpoUjBBMGN5S0lWQVRvVUFGbjJT?=
 =?utf-8?B?dVdWeEJ1V2xMVUNSdzh6VDI2YUR2bTRpMnllL3phaFI2TkExNkQvcXgzQ1FO?=
 =?utf-8?B?OTZnRDM0ampJVUVZYnp4SkhyZHZPUUtid2NxTGFXWTgwTXliNGxJN3VTMTBO?=
 =?utf-8?B?Y3hEbk5nUU5udzV2M1BIOFVTWktUSVFIb09pS3RPcXJ2eTVET3ZzcFBUZDRW?=
 =?utf-8?B?V3ZLN2RNVVlrak11Z2p5ODFkM2lIL216dCtuRlRPYU9sSE5KdUUySlVWSmhk?=
 =?utf-8?B?R3ExK2poc0RJZjlNVm9oSGNqUEdIaHJiRlhVQTNoV2NCMk9zQ2F0SGFZQ3gy?=
 =?utf-8?B?VXo3M0RUTnJ3NkV5RmUwMGNERHVUdXFsb0M4MEo1M0FkN1NlMUhqa1ZHTHJK?=
 =?utf-8?B?YlpsRjNtR0NGblphT3VUR2paU3l5K0g0bXdhOHZUN2k1RGV6QWIxTlk4YVlP?=
 =?utf-8?B?MTBQT21HQ25zR3VTRjdZTnZsTXRJQTdoaGVOeVNVOW5YS3VUQ2FyS1dIangz?=
 =?utf-8?B?Y20wcDlCZHZXRmlZZmNPTE9lZG55MnZyYk5KUmpYMUNHa2RkalMzSHBVZlBr?=
 =?utf-8?B?UWZ1RkhwbnVHQWg5dmpxdXJnWVlGNnd1SlYwOHhwakJsWVQxOTdqT1FSSnZo?=
 =?utf-8?B?SFQ5NkZLaDh1QUUyZFFkQTlKc2FHVjhPdUN5ZEp2WExYTDlZRUJVUUxNd1hp?=
 =?utf-8?B?U2k5SElBSVNuOFZqQ3U5a0t2US9qWG03LzlVaGs0ZElORVdqYmNsN1BURU1P?=
 =?utf-8?B?MFh2ckYrek5wSkY4NlJ6TnJFQmdzTVFkN1pvYTdNNWV2dDBlZ1AwclJWd1lV?=
 =?utf-8?B?NlJCM05SUTJpYmZ3aVJZNm8rbkZSSjZPNGYzOW00R0tTYXZoMXdERGpqYXQ4?=
 =?utf-8?B?b01CTFlSQjVYR0p0ajF1bDUrTkZLcHRoZHVLSkw1TlMwN215blpkNXkzWGtU?=
 =?utf-8?B?OFREajYxRXJ3UVVtd3VENnlwWEQ0VE9wQ0RGdjd1RzM3UC8wQUhXeklPUHJC?=
 =?utf-8?B?UUpuR3hXYjViSWs5YWpWVGtsUVA4YU1QemcwbUkvSElVNENMVWxwTVZGNHdi?=
 =?utf-8?B?OEJxOEx1bkptU2xPMGhRMTJ6STlPRkRYcm1yWVQ4bzNXaWxtWGtuWld4ZENW?=
 =?utf-8?B?Zmt6RGRpKzczdFRUcnFSZlZHa1BqWDh4eVpqNXQ2ODFrNWcyRWNGQVgyUXBJ?=
 =?utf-8?B?K1I1NWIzb2Jvdkl2alBGdVlkU2Z2VXNlZUd6VjJKaW84aktrRnFYVVhrVkgw?=
 =?utf-8?B?cUZDa3FoN2h6SDVhdndjTjFkekRSOURsOU0wQ1lCbm9DK095YXFBaytETG1N?=
 =?utf-8?B?YjlnNjhYMGtqTGUrdzY5SzhXRDNnRUhkNnJTQUo5bDNPRFl6blg0ZDZRckF4?=
 =?utf-8?B?RGt6b005c2pJelJDMDdaRHAyTVpTSXdUa2xFWDJxdG9LbW9jOU1vVEZhKzRK?=
 =?utf-8?B?dG96dk52MEhGSzdWNGs0SzVPUFFIajZYSzFvVkM5TnB6dEdES0hYem1CaG1a?=
 =?utf-8?B?ZWFUUW4rMWR5WVhEUG5kcUxTU01xbThQMWdMK0t4cDdGSmNxekh2NzRkbXRT?=
 =?utf-8?B?ck5HbjZiUUIrdXY5bmFsbWFzbWhhOHhkdzloTS9YaFFXVXlWSWc5QzJ1bVZY?=
 =?utf-8?B?WEJzLyswRStxME9FWnk3N2lLUzJrbldKWW5QOVZPSmNaTFZ5Qy9OVXRJeFVN?=
 =?utf-8?B?V2xTTGZqMStEL0h0OUc3OGpyNEVFbHV1eGdvYzBEbEhQRlYwU21rNVJJeThx?=
 =?utf-8?B?VXFndDc2YStXUmduWXllZnU4eXlsMkpCaVRnRWtGZ2JnS1hGaWRQQW1SV3BG?=
 =?utf-8?B?blhnbDZwczZMb3F3ZTcrYTBlZmFxVklFa3Q1U1J2V0NtcEh2ZmtZVGY5SWlV?=
 =?utf-8?B?aDhueVYvaU9jYllTbVNTb1M1QWtOVGFWNm9PWVgvcFVLVWg3TUwyanVSL1N6?=
 =?utf-8?Q?mcZoYKenDKLjHS1cpqGV/R3JK?=
X-OriginatorOrg: silabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64452895-01cb-4952-6a32-08de39995fea
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8205.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 16:13:23.7151
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 54dbd822-5231-4b20-944d-6f4abcd541fb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PvGKiXDC1F9HLm7+RIT0Zn2c5/uYZ8jFogz5d0xDmy75wGK56W3/NiGFMLGt+v7wTISDtbrycuWpdomEfPT5cA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6111
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEyMDEyOCBTYWx0ZWRfX2I3xDbcX/lpw
 1FQZVG7abAjJD3u/Wd7Tup8i63/mdUW6MJDMlaBmfGsN1so/gZRZ2x83uzi5GtDXYLWRjoXMwxv
 ltawZ/efty3E++CzSQ2s2dJA5G6RQkQ7RWlGCm5kOF2squAY1YS+gp1NiuSEsnbYn4MhDj0lmbZ
 UrJr3QSlJNwdWw+IZq1Za7/HTtOLlD/3OJ0fOPLX6gHYkdYkvsF0+DMsSR/6g2JbSIGhj3Jq3xF
 fT0FwSHElbYA/tCRJRw0udrc4aZ96AMjWtdPObpx1hSRe5oBrIceik1lSZzCZ9GcSg9GVOyadMm
 CowWwtrzs25n12mM/h6/OE7rhgcxM0gaAWbsjTWX2RTfFvlFv3dlf5xPmwTyphlRVhTDzKFDS1i
 8ZE2yqLCtcOWB+yOVfVU0tf2GLrdZg==
X-Authority-Analysis: v=2.4 cv=BKy+bVQG c=1 sm=1 tr=0 ts=693c3f26 cx=c_pps
 a=iJ0/73tnBOJCmN8OdmQeBQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=M51BFTxLslgA:10
 a=i1IsUcr2s-wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=2AEO0YjSAAAA:8
 a=UI2V7ICqOKO9W4d5kokA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: OG5WVbA6YhbsciL3kmfzmBc9nZBmLC6P
X-Proofpoint-GUID: OG5WVbA6YhbsciL3kmfzmBc9nZBmLC6P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-12_04,2025-12-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 suspectscore=0 bulkscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512120128
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.10 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[silabs.com,reject];
	R_DKIM_ALLOW(-0.20)[silabs.com:s=pps12202023,silabs.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:148.163.149.154];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_IN_DNSWL_LOW(-0.10)[148.163.149.154:from];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:26211, ipnet:148.163.148.0/22, country:US];
	MIME_TRACE(0.00)[0:+];
	BLOCKLISTDE_FAIL(0.00)[52.101.52.114:server fail,148.163.149.154:server fail,2603:10b6:8:162::17:server fail];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DNSWL_BLOCKED(0.00)[2603:10b6:8:162::17:received,52.101.52.114:received];
	DKIM_TRACE(0.00)[silabs.com:+]
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: B08983F900
X-Spamd-Bar: ----
Message-ID-Hash: PILVGS2OMKZ5OZFMLQK5V4HQ73WLO4B4
X-Message-ID-Hash: PILVGS2OMKZ5OZFMLQK5V4HQ73WLO4B4
X-MailFrom: Damien.Riegel@silabs.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, Silicon Labs Kernel Team <linux-devel@silabs.com>, =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH 03/14] greybus: cpc: use socket buffers instead of gb_message in TX path
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/PILVGS2OMKZ5OZFMLQK5V4HQ73WLO4B4/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

Q1BDIGNvbWVzIHdpdGggaXRzIG93biBoZWFkZXIsIHRoYXQgaXMgbm90IHlldCBpbXBsZW1lbnRl
ZC4gV2l0aG91dCBza2IsDQp0aGUgQ1BDIGhvc3QgZGV2aWNlIGRyaXZlcnMgaGF2ZSB0byBnZXQg
dHdvIHBvaW50ZXJzIHRvIGdldCBhIGZ1bGwNCnBhY2tldDogb25lIHBvaW50ZXIgdG8gdGhlIENQ
QyBoZWFkZXIgYW5kIG9uZSBwb2ludGVyIHRvIHRoZSBHQiBtZXNzYWdlLg0KSW4gb3JkZXIgdG8g
bWFrZSB0aGVpciBpbXBsZW1lbnRhdGlvbnMgc2ltcGxlciwgY29udmVydCB0aGUgR0IgbWVzc2Fn
ZQ0KaW50byBhbiBTS0IuDQoNClNpZ25lZC1vZmYtYnk6IERhbWllbiBSacOpZ2VsIDxkYW1pZW4u
cmllZ2VsQHNpbGFicy5jb20+DQotLS0NCiBkcml2ZXJzL2dyZXlidXMvY3BjL2NwYy5oICAgfCAx
MSArKysrKysrKystDQogZHJpdmVycy9ncmV5YnVzL2NwYy9jcG9ydC5jIHwgMTEgKysrKysrKyst
LQ0KIGRyaXZlcnMvZ3JleWJ1cy9jcGMvaG9zdC5jICB8IDQxICsrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKystLS0NCiBkcml2ZXJzL2dyZXlidXMvY3BjL2hvc3QuaCAgfCAgNyArKysr
LS0tDQogNCBmaWxlcyBjaGFuZ2VkLCA2MSBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQ0K
DQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncmV5YnVzL2NwYy9jcGMuaCBiL2RyaXZlcnMvZ3JleWJ1
cy9jcGMvY3BjLmgNCmluZGV4IDM5MTVhN2ZiYzRmLi5kOWY4ZjYwOTEzYSAxMDA2NDQNCi0tLSBh
L2RyaXZlcnMvZ3JleWJ1cy9jcGMvY3BjLmgNCisrKyBiL2RyaXZlcnMvZ3JleWJ1cy9jcGMvY3Bj
LmgNCkBAIC0yNCw2ICsyNCwxNSBAQCBzdHJ1Y3QgY3BjX2Nwb3J0IHsNCiBzdHJ1Y3QgY3BjX2Nw
b3J0ICpjcGNfY3BvcnRfYWxsb2ModTE2IGNwb3J0X2lkLCBnZnBfdCBnZnBfbWFzayk7DQogdm9p
ZCBjcGNfY3BvcnRfcmVsZWFzZShzdHJ1Y3QgY3BjX2Nwb3J0ICpjcG9ydCk7DQogDQotaW50IGNw
Y19jcG9ydF9tZXNzYWdlX3NlbmQoc3RydWN0IGNwY19jcG9ydCAqY3BvcnQsIHN0cnVjdCBnYl9t
ZXNzYWdlICptZXNzYWdlLCBnZnBfdCBnZnBfbWFzayk7DQoraW50IGNwY19jcG9ydF90cmFuc21p
dChzdHJ1Y3QgY3BjX2Nwb3J0ICpjcG9ydCwgc3RydWN0IHNrX2J1ZmYgKnNrYik7DQorDQorc3Ry
dWN0IGNwY19za2JfY2Igew0KKwlzdHJ1Y3QgY3BjX2Nwb3J0ICpjcG9ydDsNCisNCisJLyogS2Vl
cCB0cmFjayBvZiB0aGUgR0IgbWVzc2FnZSB0aGUgc2tiIG9yaWdpbmF0ZXMgZnJvbSAqLw0KKwlz
dHJ1Y3QgZ2JfbWVzc2FnZSAqZ2JfbWVzc2FnZTsNCit9Ow0KKw0KKyNkZWZpbmUgQ1BDX1NLQl9D
QihfX3NrYikgKChzdHJ1Y3QgY3BjX3NrYl9jYiAqKSYoKF9fc2tiKS0+Y2JbMF0pKQ0KIA0KICNl
bmRpZg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3JleWJ1cy9jcGMvY3BvcnQuYyBiL2RyaXZlcnMv
Z3JleWJ1cy9jcGMvY3BvcnQuYw0KaW5kZXggODhiZGIyZjgxODIuLmVkMGI4ZThiMGQ3IDEwMDY0
NA0KLS0tIGEvZHJpdmVycy9ncmV5YnVzL2NwYy9jcG9ydC5jDQorKysgYi9kcml2ZXJzL2dyZXli
dXMvY3BjL2Nwb3J0LmMNCkBAIC0zMSw3ICszMSwxNCBAQCB2b2lkIGNwY19jcG9ydF9yZWxlYXNl
KHN0cnVjdCBjcGNfY3BvcnQgKmNwb3J0KQ0KIAlrZnJlZShjcG9ydCk7DQogfQ0KIA0KLWludCBj
cGNfY3BvcnRfbWVzc2FnZV9zZW5kKHN0cnVjdCBjcGNfY3BvcnQgKmNwb3J0LCBzdHJ1Y3QgZ2Jf
bWVzc2FnZSAqbWVzc2FnZSwgZ2ZwX3QgZ2ZwX21hc2spDQorLyoqDQorICogY3BjX2Nwb3J0X3Ry
YW5zbWl0KCkgLSBUcmFuc21pdCBza2Igb3ZlciBjcG9ydC4NCisgKiBAY3BvcnQ6IGNwb3J0Lg0K
KyAqIEBza2I6IHNrYiB0byBiZSB0cmFuc21pdHRlZC4NCisgKi8NCitpbnQgY3BjX2Nwb3J0X3Ry
YW5zbWl0KHN0cnVjdCBjcGNfY3BvcnQgKmNwb3J0LCBzdHJ1Y3Qgc2tfYnVmZiAqc2tiKQ0KIHsN
Ci0JcmV0dXJuIGNwb3J0LT5jcGNfaGQtPmRyaXZlci0+bWVzc2FnZV9zZW5kKGNwb3J0LT5jcGNf
aGQsIGNwb3J0LT5pZCwgbWVzc2FnZSwgZ2ZwX21hc2spOw0KKwlzdHJ1Y3QgY3BjX2hvc3RfZGV2
aWNlICpjcGNfaGQgPSBjcG9ydC0+Y3BjX2hkOw0KKw0KKwlyZXR1cm4gY3BjX2hkX3NlbmRfc2ti
KGNwY19oZCwgc2tiKTsNCiB9DQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncmV5YnVzL2NwYy9ob3N0
LmMgYi9kcml2ZXJzL2dyZXlidXMvY3BjL2hvc3QuYw0KaW5kZXggOTg1NjZjZTc3NTUuLmVlMDkw
ZGQzMDk3IDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncmV5YnVzL2NwYy9ob3N0LmMNCisrKyBiL2Ry
aXZlcnMvZ3JleWJ1cy9jcGMvaG9zdC5jDQpAQCAtNiw2ICs2LDcgQEANCiAjaW5jbHVkZSA8bGlu
dXgvZXJyLmg+DQogI2luY2x1ZGUgPGxpbnV4L2dyZXlidXMuaD4NCiAjaW5jbHVkZSA8bGludXgv
bW9kdWxlLmg+DQorI2luY2x1ZGUgPGxpbnV4L3NrYnVmZi5oPg0KIA0KICNpbmNsdWRlICJjcGMu
aCINCiAjaW5jbHVkZSAiaG9zdC5oIg0KQEAgLTM4LDYgKzM5LDggQEAgc3RhdGljIGludCBjcGNf
aGRfbWVzc2FnZV9zZW5kKHN0cnVjdCBjcGNfaG9zdF9kZXZpY2UgKmNwY19oZCwgdTE2IGNwb3J0
X2lkLA0KIAkJCSAgICAgICBzdHJ1Y3QgZ2JfbWVzc2FnZSAqbWVzc2FnZSwgZ2ZwX3QgZ2ZwX21h
c2spDQogew0KIAlzdHJ1Y3QgY3BjX2Nwb3J0ICpjcG9ydDsNCisJc3RydWN0IHNrX2J1ZmYgKnNr
YjsNCisJdW5zaWduZWQgaW50IHNpemU7DQogDQogCWNwb3J0ID0gY3BjX2hkX2dldF9jcG9ydChj
cGNfaGQsIGNwb3J0X2lkKTsNCiAJaWYgKCFjcG9ydCkgew0KQEAgLTQ1LDcgKzQ4LDE4IEBAIHN0
YXRpYyBpbnQgY3BjX2hkX21lc3NhZ2Vfc2VuZChzdHJ1Y3QgY3BjX2hvc3RfZGV2aWNlICpjcGNf
aGQsIHUxNiBjcG9ydF9pZCwNCiAJCXJldHVybiAtRUlOVkFMOw0KIAl9DQogDQotCXJldHVybiBj
cGNfY3BvcnRfbWVzc2FnZV9zZW5kKGNwb3J0LCBtZXNzYWdlLCBnZnBfbWFzayk7DQorCXNpemUg
PSBzaXplb2YoKm1lc3NhZ2UtPmhlYWRlcikgKyBtZXNzYWdlLT5wYXlsb2FkX3NpemU7DQorCXNr
YiA9IGFsbG9jX3NrYihzaXplLCBnZnBfbWFzayk7DQorCWlmICghc2tiKQ0KKwkJcmV0dXJuIC1F
Tk9NRU07DQorDQorCS8qIEhlYWRlciBhbmQgcGF5bG9hZCBhcmUgYWxyZWFkeSBjb250aWd1b3Vz
IGluIEdyZXlidXMgbWVzc2FnZSAqLw0KKwlza2JfcHV0X2RhdGEoc2tiLCBtZXNzYWdlLT5idWZm
ZXIsIHNpemVvZigqbWVzc2FnZS0+aGVhZGVyKSArIG1lc3NhZ2UtPnBheWxvYWRfc2l6ZSk7DQor
DQorCUNQQ19TS0JfQ0Ioc2tiKS0+Y3BvcnQgPSBjcG9ydDsNCisJQ1BDX1NLQl9DQihza2IpLT5n
Yl9tZXNzYWdlID0gbWVzc2FnZTsNCisNCisJcmV0dXJuIGNwY19jcG9ydF90cmFuc21pdChjcG9y
dCwgc2tiKTsNCiB9DQogDQogc3RhdGljIGludCBjcGNfaGRfY3BvcnRfYWxsb2NhdGUoc3RydWN0
IGNwY19ob3N0X2RldmljZSAqY3BjX2hkLCBpbnQgY3BvcnRfaWQsIHVuc2lnbmVkIGxvbmcgZmxh
Z3MpDQpAQCAtMTQzLDggKzE1Nyw4IEBAIHN0cnVjdCBjcGNfaG9zdF9kZXZpY2UgKmNwY19oZF9j
cmVhdGUoc3RydWN0IGNwY19oZF9kcml2ZXIgKmRyaXZlciwgc3RydWN0IGRldmljDQogCXN0cnVj
dCBjcGNfaG9zdF9kZXZpY2UgKmNwY19oZDsNCiAJc3RydWN0IGdiX2hvc3RfZGV2aWNlICpoZDsN
CiANCi0JaWYgKCghZHJpdmVyLT5tZXNzYWdlX3NlbmQpIHx8ICghZHJpdmVyLT5tZXNzYWdlX2Nh
bmNlbCkpIHsNCi0JCWRldl9lcnIocGFyZW50LCAibWlzc2luZyBtYW5kYXRvcnkgY2FsbGJhY2tz
XG4iKTsNCisJaWYgKCFkcml2ZXItPnRyYW5zbWl0KSB7DQorCQlkZXZfZXJyKHBhcmVudCwgIm1p
c3NpbmcgbWFuZGF0b3J5IGNhbGxiYWNrXG4iKTsNCiAJCXJldHVybiBFUlJfUFRSKC1FSU5WQUwp
Ow0KIAl9DQogDQpAQCAtMTgwLDEyICsxOTQsMzMgQEAgdm9pZCBjcGNfaGRfZGVsKHN0cnVjdCBj
cGNfaG9zdF9kZXZpY2UgKmNwY19oZCkNCiB9DQogRVhQT1JUX1NZTUJPTF9HUEwoY3BjX2hkX2Rl
bCk7DQogDQordm9pZCBjcGNfaGRfbWVzc2FnZV9zZW50KHN0cnVjdCBza19idWZmICpza2IsIGlu
dCBzdGF0dXMpDQorew0KKwlzdHJ1Y3QgY3BjX2hvc3RfZGV2aWNlICpjcGNfaGQgPSBDUENfU0tC
X0NCKHNrYiktPmNwb3J0LT5jcGNfaGQ7DQorCXN0cnVjdCBnYl9ob3N0X2RldmljZSAqaGQgPSBj
cGNfaGQtPmdiX2hkOw0KKw0KKwlncmV5YnVzX21lc3NhZ2Vfc2VudChoZCwgQ1BDX1NLQl9DQihz
a2IpLT5nYl9tZXNzYWdlLCBzdGF0dXMpOw0KK30NCitFWFBPUlRfU1lNQk9MX0dQTChjcGNfaGRf
bWVzc2FnZV9zZW50KTsNCisNCiB2b2lkIGNwY19oZF9yY3ZkKHN0cnVjdCBjcGNfaG9zdF9kZXZp
Y2UgKmNwY19oZCwgdTE2IGNwb3J0X2lkLCB1OCAqZGF0YSwgc2l6ZV90IGxlbmd0aCkNCiB7DQog
CWdyZXlidXNfZGF0YV9yY3ZkKGNwY19oZC0+Z2JfaGQsIGNwb3J0X2lkLCBkYXRhLCBsZW5ndGgp
Ow0KIH0NCiBFWFBPUlRfU1lNQk9MX0dQTChjcGNfaGRfcmN2ZCk7DQogDQorLyoqDQorICogY3Bj
X2hkX3NlbmRfc2tiKCkgLSBRdWV1ZSBhIHNvY2tldCBidWZmZXIgZm9yIHRyYW5zbWlzc2lvbi4N
CisgKiBAY3BjX2hkOiBIb3N0IGRldmljZSB0byBzZW5kIFNLQiBvdmVyLg0KKyAqIEBza2I6IFNL
QiB0byBzZW5kLg0KKyAqLw0KK2ludCBjcGNfaGRfc2VuZF9za2Ioc3RydWN0IGNwY19ob3N0X2Rl
dmljZSAqY3BjX2hkLCBzdHJ1Y3Qgc2tfYnVmZiAqc2tiKQ0KK3sNCisJY29uc3Qgc3RydWN0IGNw
Y19oZF9kcml2ZXIgKmRydiA9IGNwY19oZC0+ZHJpdmVyOw0KKw0KKwlyZXR1cm4gZHJ2LT50cmFu
c21pdChjcGNfaGQsIHNrYik7DQorfQ0KKw0KIE1PRFVMRV9ERVNDUklQVElPTigiR3JleWJ1cyBv
dmVyIENQQyIpOw0KIE1PRFVMRV9MSUNFTlNFKCJHUEwiKTsNCiBNT0RVTEVfQVVUSE9SKCJTaWxp
Y29uIExhYm9yYXRvcmllcywgSW5jLiIpOw0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3JleWJ1cy9j
cGMvaG9zdC5oIGIvZHJpdmVycy9ncmV5YnVzL2NwYy9ob3N0LmgNCmluZGV4IGMzZjJmNTZhOTM5
Li4xOTFiNWUzOTRhNiAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3JleWJ1cy9jcGMvaG9zdC5oDQor
KysgYi9kcml2ZXJzL2dyZXlidXMvY3BjL2hvc3QuaA0KQEAgLTE4LDkgKzE4LDcgQEAgc3RydWN0
IGNwY19jcG9ydDsNCiBzdHJ1Y3QgY3BjX2hvc3RfZGV2aWNlOw0KIA0KIHN0cnVjdCBjcGNfaGRf
ZHJpdmVyIHsNCi0JaW50ICgqbWVzc2FnZV9zZW5kKShzdHJ1Y3QgY3BjX2hvc3RfZGV2aWNlICpo
ZCwgdTE2IGRlc3RfY3BvcnRfaWQsDQotCQkJICAgIHN0cnVjdCBnYl9tZXNzYWdlICptZXNzYWdl
LCBnZnBfdCBnZnBfbWFzayk7DQotCXZvaWQgKCptZXNzYWdlX2NhbmNlbCkoc3RydWN0IGdiX21l
c3NhZ2UgKm1lc3NhZ2UpOw0KKwlpbnQgKCp0cmFuc21pdCkoc3RydWN0IGNwY19ob3N0X2Rldmlj
ZSAqaGQsIHN0cnVjdCBza19idWZmICpza2IpOw0KIH07DQogDQogLyoqDQpAQCAtNDgsNSArNDYs
OCBAQCBpbnQgY3BjX2hkX2FkZChzdHJ1Y3QgY3BjX2hvc3RfZGV2aWNlICpjcGNfaGQpOw0KIHZv
aWQgY3BjX2hkX3B1dChzdHJ1Y3QgY3BjX2hvc3RfZGV2aWNlICpjcGNfaGQpOw0KIHZvaWQgY3Bj
X2hkX2RlbChzdHJ1Y3QgY3BjX2hvc3RfZGV2aWNlICpjcGNfaGQpOw0KIHZvaWQgY3BjX2hkX3Jj
dmQoc3RydWN0IGNwY19ob3N0X2RldmljZSAqY3BjX2hkLCB1MTYgY3BvcnRfaWQsIHU4ICpkYXRh
LCBzaXplX3QgbGVuZ3RoKTsNCit2b2lkIGNwY19oZF9tZXNzYWdlX3NlbnQoc3RydWN0IHNrX2J1
ZmYgKnNrYiwgaW50IHN0YXR1cyk7DQorDQoraW50IGNwY19oZF9zZW5kX3NrYihzdHJ1Y3QgY3Bj
X2hvc3RfZGV2aWNlICpjcGNfaGQsIHN0cnVjdCBza19idWZmICpza2IpOw0KIA0KICNlbmRpZg0K
LS0gDQoyLjQ5LjANCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZ3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0IC0tIGdyZXlidXMtZGV2QGxpc3RzLmxpbmFy
by5vcmcKVG8gdW5zdWJzY3JpYmUgc2VuZCBhbiBlbWFpbCB0byBncmV5YnVzLWRldi1sZWF2ZUBs
aXN0cy5saW5hcm8ub3JnCg==
