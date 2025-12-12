Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A4BFCB93C5
	for <lists+greybus-dev@lfdr.de>; Fri, 12 Dec 2025 17:13:43 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 1F58D3F99A
	for <lists+greybus-dev@lfdr.de>; Fri, 12 Dec 2025 16:13:42 +0000 (UTC)
Received: from mx0a-0024c301.pphosted.com (mx0a-0024c301.pphosted.com [148.163.149.154])
	by lists.linaro.org (Postfix) with ESMTPS id 4018D3F900
	for <greybus-dev@lists.linaro.org>; Fri, 12 Dec 2025 16:13:35 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=silabs.com header.s=pps12202023 header.b=wObyBWCi;
	dkim=pass header.d=silabs.com header.s=selector1 header.b=bEnF5HiR;
	spf=pass (lists.linaro.org: domain of Damien.Riegel@silabs.com designates 148.163.149.154 as permitted sender) smtp.mailfrom=Damien.Riegel@silabs.com;
	dmarc=pass (policy=reject) header.from=silabs.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from pps.filterd (m0101743.ppops.net [127.0.0.1])
	by mx0a-0024c301.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BC8WO7P3748684;
	Fri, 12 Dec 2025 10:13:25 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps12202023;
	 bh=SL0HP6Mo0asnTZAcWqNUCzfE5V3mOAZkfIJdXjg3bLU=; b=wObyBWCi/jMp
	YdQpAzOj3Df5l6ic47PHkJdENVt7GGzEEW6YYmxxP5cAc2ipIM8bypJNOPCr2Esq
	Wm3xNivduteziXVmce+kV+hz6AKjtaGyw/cktp/KjfqYncjgEtK/Gr2aaNrA49RS
	2LoOYE2CU8gEdNXbFYMKZcg8kHPo2aJNJsaALFtKOi9CP1wtJkfZ6ydK65REQ7Pj
	Qq7YVqW8UVJL47nwy0cSCSZvGy5NgZoOGXF7tM2xCTT9YvPqlwoEzSXvc1HLNB/U
	mjxT39UV7jGrJ0kh8hGJaV5cupJp42IWAJhDq2/hwnMjETVjJ3PlR8uawYTaWI67
	7deEniPRAQ==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11021114.outbound.protection.outlook.com [52.101.52.114])
	by mx0a-0024c301.pphosted.com (PPS) with ESMTPS id 4ayht2mdee-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 12 Dec 2025 10:13:25 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vqtWynHPg/VaBm8dmTo1smB4ANfTqxUHCw8kvP4Le7g38I6IY65KmCVjRuvUszFL2i7lw5euWRJlLehzq/gpkRIIkOaQZ9+KzafXu0gPEGitOKvbePG6WWWQL57SuuaXvZvRZ6gaJYYQqeOnLtMtO0NKPHXj7dP9Qz23XlE3vGWNZfBU1YHsUVoA1944/4kPSfyVPR6Qjf1ASM0pKy9LaEXdXfuZTr0WiOlfzOdy2p3LvxuCK02MQprS9qzRTLmsguBpwRC56gej+rSDNSlbdIaQXx2FfN3Gm+DyIBr90HhVPsGYHW3p7DUVxSSvRm7cN8JrCljbFrH9oCRGe1keLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SL0HP6Mo0asnTZAcWqNUCzfE5V3mOAZkfIJdXjg3bLU=;
 b=FNqWMA35hGjUjQdxhWOdrQyRz3HuRk7LKlt1tznsVEH9De9D4Z7PyR0wP/06YjqoJhq/8mEdxaIQx2wuG/KyzARy8LxdTgLz0qTb064vvlyOwA/vdwTXJMfEc0qdiS/YTV273+gAYsNiqDNs6XIISkyizuK9/QEG+bXFQEw2WEc2Ha19/nF0fA0/DcAjS0jiNSWCGarKYgGp/xmzRG1ApFkIgdcuDRI2YtLoHDu7hQ9p/B9L4dVSdQ5/V9kvwm/j0fjz7E8yFW78aqvO8EyUK57DCnNUabY0LLDCmQWVq8P+JnUow2896gickiFI3iCC3lm2Oly6qlQ5bAeXkWkqiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silabs.com; dmarc=pass action=none header.from=silabs.com;
 dkim=pass header.d=silabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SL0HP6Mo0asnTZAcWqNUCzfE5V3mOAZkfIJdXjg3bLU=;
 b=bEnF5HiRnfO8+HeBiZUUYaYwL++4NDIBgznCj5LQVhvLAKilyQf84A1hOwGCIpiL84vjPH9ui4SaeLYAAgHaBNGwO3+pyG5TGcDVuUBgpyLh2eqYX2S+wLYPhUeVRNxs9HHlhWpWQnPmsCdzSQpyUzBstK00NSJmyEV+I53hZK8=
Received: from DS0PR11MB8205.namprd11.prod.outlook.com (2603:10b6:8:162::17)
 by MN0PR11MB6111.namprd11.prod.outlook.com (2603:10b6:208:3cd::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.9; Fri, 12 Dec
 2025 16:13:22 +0000
Received: from DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::2de6:bc88:2af7:3583]) by DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::2de6:bc88:2af7:3583%3]) with mapi id 15.20.9412.005; Fri, 12 Dec 2025
 16:13:22 +0000
From: =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
To: greybus-dev@lists.linaro.org
Date: Fri, 12 Dec 2025 11:12:55 -0500
Message-ID: <20251212161308.25678-2-damien.riegel@silabs.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251212161308.25678-1-damien.riegel@silabs.com>
References: <20251212161308.25678-1-damien.riegel@silabs.com>
X-ClientProxiedBy: YQZPR01CA0176.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:8b::25) To DS0PR11MB8205.namprd11.prod.outlook.com
 (2603:10b6:8:162::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8205:EE_|MN0PR11MB6111:EE_
X-MS-Office365-Filtering-Correlation-Id: 93b23c64-170b-4b6d-ee02-08de39995ee5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|366016|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?cVBmcWlCY2M4ajdMRklGbFBqQ0F5TC9QSmF2L3Vzd2VSUmd4UkFBODZNRitm?=
 =?utf-8?B?a3VEY3VEUlNHOHk5RlNwazlxc0VNNVlxWnQzUzVRdDU4ckJCSmRWL3gvUmNY?=
 =?utf-8?B?YTVIUEZDYU1XT2w4TjhzMWY1KzFTUVJlMUsramxvY2N2WEh3aVYxTkUza0hN?=
 =?utf-8?B?UGxhZFZod1daN3l1MlZ6RFNIWVpxNzl5SVhJWXBZb0ZaTWJzTEt0ekk0eGhM?=
 =?utf-8?B?T0xHZkI2b3dZQzNjRWd6ZHZMdVZkd05ka1FXcmZZUWdUZDhSa3VXNjBiVTU5?=
 =?utf-8?B?b1FhTlR5R1Y0RWJ4VjlDRVU0ejJQS3ROcll5K1k4MEtBU1BTeUxMWTlMZzY1?=
 =?utf-8?B?cmtxTERuVWMxOVg1ZFVxQ1ZDTS90U0lBTUYzTnZEdHAydjFDdWo3dUdUMW91?=
 =?utf-8?B?VkhEZ3Y5TDFUK2ZBa011YStoYWJRdDlQV2VNUEFsWXZxazcwN3lqSHFTcmpJ?=
 =?utf-8?B?WmtubzJzVnFVT3dqRE9uQzVzeGVxV3JvWFpSWmY3R25ROW5CUy9YVnUxTTg3?=
 =?utf-8?B?ejNQV1pTWU9yTU93QTFlenFBMWVyc3d1UHZNQ0poeWpwRUVjQXRUeFZhb3Av?=
 =?utf-8?B?bVpHakFRdlRsa3BEaS9GcEJscUtsdnVPNEpmdWhRTnU1RjQ3NmRCejdHNThR?=
 =?utf-8?B?VFBaZ0h5UEIxdkVrVFZrZGwxbXhLVmVYZHNHbGxwZFFxNzljZTFRMlpGUU9J?=
 =?utf-8?B?WUoxTWkyZ1AxY3hFVEJMR25CYUVzUDZHKy9xay95bm1hRnBDcDFobzg4TFRR?=
 =?utf-8?B?UnBVcVp3dnhQaEptcnVHa3IzNkpXQkV6Nk1QdklxSEtMNjBPRXhTWHpiZkd4?=
 =?utf-8?B?SnFyd1kxLy9iQlRUY2Uxc3FvbWtkYjQrN2JQZkY3V2VrVVRBZ2pjK0pvMm1F?=
 =?utf-8?B?dFNzd0h4SS9WN3k0YUZ0UWdqWityQ3dKWmkzMXJYbTVPM2xjbUJXOG9GeTdv?=
 =?utf-8?B?d0NaOE94bXF5L0RON0J5SGFYbGNrbVg3bmlYMnkva2xoeVpWVFFoWGxIUlp2?=
 =?utf-8?B?MVZvZE1COUFUeXRsdDcwTVp0WHVCL0xpUjN5N3M1eFM4Z3dzQWVpQm16NXly?=
 =?utf-8?B?MVZrYTVlV1ZoNWJ6cTZNcW1SZ1RBYW1HYVNtS1pYTWsxREV3Tjd5R3hZdDlB?=
 =?utf-8?B?K3lzUVpVc1dLeER5b1YzNmxQWGJJR3JCM2gzdGRWMTdxbVVPWlZSczFtSVd5?=
 =?utf-8?B?cm0ram9qMHlFRjViN3RVakhsU3pRM1YrTVhNODl1WjliaDhtVEpKZlI1a3BR?=
 =?utf-8?B?TDZrVlU3MVRLZVE2QWV0QytjMmt0S1J3OWQ0ZHY0dHRsV2x1VzN1V1lOcmZ1?=
 =?utf-8?B?MUtOd2JHQnJ6c2Y2TExycTZ2aFhodUFQZEgyelBQdFBTUU1tZm5zTEVYeTZ3?=
 =?utf-8?B?aEkrekJsL08xNG9vMmRiU1VZdjZVRVkxeDFIWkhDWUpLSTM3ZlFuN3M1ZVdr?=
 =?utf-8?B?Q0kxUDd0V2wvdFpaOXJQdm4rTzFzVkg4SjZETTRHS2paaHpVWG5JUnd2RS9u?=
 =?utf-8?B?c0Z3d1FTY3AyUHVxZG85Q05nejdNZ0Z0dC8yTVIwYk02WnQrYm9LbU1GU25y?=
 =?utf-8?B?TVhsbWZoQjJWOUxMQTcrMlE2OWI0MWlDS1BZYUlCdTJURGNzamhzS2JrNXZo?=
 =?utf-8?B?dWUzZU5HK21VT3JVb2FYN2JFOVlKbThqKy91VnJlcndNaGFNLzRxWFdFZGg5?=
 =?utf-8?B?cFlSWER6N3NvZzloWWlGN3dFbmpZaDRabWM2UWJEZElrRE9zRndyOUFHeW1n?=
 =?utf-8?B?TWtLcTFCcGxCWmE3Sko0R1B6akduN2M3NlJDT2x0em9MYUNZSzNhaWZqNXU0?=
 =?utf-8?B?WnhnTktNRWdUa1lRVU84dm1HNmtjL05sSlZsRTdCaEVLS3llSGx5T1FTeWlQ?=
 =?utf-8?B?YTBjRGl6STZLbWhqY3ZZY2ljUVgwMnl3QWVncUg2OFVpaEEwTHN5T2tvbzRL?=
 =?utf-8?B?bzVxaE9peHRyTzRrZi81aFJ3bGhxSHpwNFZiYm03OFpCZVdQR0w5eGIydzFM?=
 =?utf-8?B?QVNHTE55Q1duVExZTUJ1Z2lwNnVsRUVBWWFPekZkVFQwYmR1L2I3MXQ5YkZ6?=
 =?utf-8?Q?Gp7f63?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8205.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(366016)(376014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TFBrTDlVYTVSNlRDWkdEcnBRMmtlbUVYMUhkTVI4WWI3cmo1RmVDMHBpdDMz?=
 =?utf-8?B?Z1EzRkZLYm1QSlI4QVBVTng2WmVsMGZVbXlQQW1oVlE5aXdlTWo2emZFV256?=
 =?utf-8?B?NlJFaWhsb1NmVGVKaGdhUWNlSFJWdDdFclV3RGU1U0xsZ1VkNFhBYTdSSGts?=
 =?utf-8?B?YVQ3d0tsWXBFZWM4bEJVdnQxMitsaDJOV3krTFVLdGUwRm1xSHkvWlhnWkpT?=
 =?utf-8?B?c1hteCtNWmR2ME83K1A5NisxVU5RVHR5WENPcTFoRlVZQlM2MjBHV2h2Uld4?=
 =?utf-8?B?aE1MTGVmZzBma1dYcG5zc1JTOWRDRk5SSlN1eXErdllFc1FMZHdXYjRZanAw?=
 =?utf-8?B?ZWM4K3ZHUmU1c09iNUNBc1dJdE9abndoMXlBMVlFYnk4QnZzRURhbUdaRytu?=
 =?utf-8?B?blBhYk9MWk5DRUVWTjlKNk5aZDNNMUl4ZEdGbk5hNXU0TzZDUzJ5ZDJYczAx?=
 =?utf-8?B?dWd1K1Q5dUtKR09uOVoybE13MG9ENmZUcHArSm1tWnVhSEpMVkYwaSttYkI1?=
 =?utf-8?B?TXVHTlNCYWRSN2Z3YWtRVmU1TmkvaWM0MUw1MEJua1M2Q1A1QXIrM2IzcC9K?=
 =?utf-8?B?OURHRmpxWDg0YkNYSURmM0djYkVJa29xajNiOTFmQUlIVmZzQjNlSWVhRFVP?=
 =?utf-8?B?UldFZmVQOTlyb3VqSEg0c1lqdHRXTExKeU9DM0R4MlB3R3p4QTdjMmdvZXhr?=
 =?utf-8?B?TElCZ2crQ08rdVF6eEIwWkw1d2NGZzU3VGt0UVoyRXZFMzViRkJjVHljTUw0?=
 =?utf-8?B?dFIxODJSNGtDcHQ3VGJHRGluZS9JUkRCeVdoclVhL2JrYTVSWlFkUGI1NmVi?=
 =?utf-8?B?N2J4RnEyeURZZjFhaGJULzlrVE1TYS9xQXVZL2pIanQ0bHc1ejJla3lmQWxQ?=
 =?utf-8?B?K2hjN2VpOGFITVFDNnNsK3Z3THlOQlo3VG45cXMyeW1FS0VjWnZwTy9LRG5v?=
 =?utf-8?B?OGpXdDdYVjFhaWFFa2tGQm4zOERKU1NhbDcrNnNVQVcxdndTdG5wbk5ybFp3?=
 =?utf-8?B?LytGZXc1VExVemt2dnY2ajNuK0YrR1VMWGlvNEpEd1JpWXVxbkhuVXdSaUx0?=
 =?utf-8?B?NGlyK0hFSDRUMUlDWFRURnlHRStOVFVyeFpmMU80b1hiNE5VU3M0VUV6aEEz?=
 =?utf-8?B?RmoyMUlpZVIxUUwwM2JYZU9nVmlHKzhUVkdXWEdCeDV4ZlN6NnZIZ1JTMHBT?=
 =?utf-8?B?MENDazRLc20yTzJOczR5aXh3TUZ0c3RBOHBIWEdMKy80RU4zZW9pSE9nNU5H?=
 =?utf-8?B?MmV4NGhVbXpYS3pNQS95R2FXaHlBWE5rMWRHU3NGZFVnZzcxbEt4Q243YmlE?=
 =?utf-8?B?UmRJUGZ5VnVQVFdCRitFZ1NoRGk4ZkV2RUlQTXVxbjB1U0V0MkJWb2NrT1lJ?=
 =?utf-8?B?dE91NU8vS0JiSUltcTJtRFJvSjRZUEJaeGRKU1FSZ0NnS2trdnZyN1hvaGln?=
 =?utf-8?B?eUNZcVB3TGJQNGxkazBkaDR2eVNHL3hXekx3MzRwUmZoRDg5RlBnMXpCYy9p?=
 =?utf-8?B?VGcyMzQ1UklCMmdZRmZzK09RTjQ1dlQyaG1IbE45VTBnSkNIUE9vaFAvS1Jz?=
 =?utf-8?B?aGNRWGVVNGxvZ1dvS2RON0QycEZCWkM3eTYvVG50Q1hEMGp4ZldRc25wamsy?=
 =?utf-8?B?UEpLaTN3MjI5eXFleW9sVXVFc0JtZi9BbWZ5MjcxNVBZU2ZReUtCOHNEZ3Vo?=
 =?utf-8?B?d2I1SmFRcnZhaXF1SmZJSDdQL1daMEhaSSs5bHE1ZDI0SXdpNDN0MnFtc1ZP?=
 =?utf-8?B?V1VpODdzTndmSGxNNVFlb29QcktaRnR6U2VENzRudTF4SW1WQkFwRVJGenhB?=
 =?utf-8?B?UXIwTHFsOUVleUR1NHhGTXptSnQzRk4rcDRlN200OGJFYmthYWFjTE5mRkdX?=
 =?utf-8?B?Tjc0N3N2b1BaTElxMFUzaUcvVHpSTnJXREgyVXZ3b2daRW9uV3hVbVZUYld2?=
 =?utf-8?B?bHdubzgyNEpsVmNwZHBQeU5PM1puWmpsd04yWjFxeUs4dVRoSUpVYWhucVFG?=
 =?utf-8?B?aENJNWNpUm1DK2pjMnhqVmk1Rnp6RFYrWkp5d3Q1bXhQUzByY0ZSZ3grei9j?=
 =?utf-8?B?UGVtTHU4NWI0R1h4aENici9jSUFsK0Q3bnRZUXljcWRaL2ZGNFB3MU5Ycnc2?=
 =?utf-8?Q?hVp/B7FP8xLOGUzbAAjlqQTc5?=
X-OriginatorOrg: silabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93b23c64-170b-4b6d-ee02-08de39995ee5
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8205.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 16:13:22.2304
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 54dbd822-5231-4b20-944d-6f4abcd541fb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sXpHp2xFJ/bQGdZF36FSCawtcYFd0nUIwhN70wS3YKVJCU5h7EDlxjrW4OBtLVb+/mQmHnKg4+uPSL3pxOcUkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6111
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEyMDEyOCBTYWx0ZWRfX2VJjUgEDz7Ev
 P4gLG2Ds0lKh4ho4xS5SQ6zZfcWvcKB5lN6bJJ3zTIki+WZJobWYWwVIMWl1tc3XXpDRGLGmkhu
 B8Dv0v8kn7XknAG/jaub+wsOVVBXUGDleirJUHf+NuzEsVYK2BGi3VN+uwI07ihXI/VjJmX0rub
 zdlwl+IYxF77kwA+UgspxJj4vMl9XMHgDzi/wJ4vZ1OQdKllS156HlVnFnI7pJhkoa+TdPjdwII
 utUdb5sFXDZ+6t+14T0pxnqc6ltYic8rs/DGbOhuAtrd1N9jhco/fkh7KflGYzq2zUFEdozBDpH
 ZzWRFK9WINUf+y6J4AYGTQUA17T8c2sw925zg3eaeoANBSF/dKky5M2qGTmXAW1+M3VEB709oKC
 V1K3YiLA+7OHsjJ6nXZ6YlC+5vzRxA==
X-Authority-Analysis: v=2.4 cv=BKy+bVQG c=1 sm=1 tr=0 ts=693c3f25 cx=c_pps
 a=iJ0/73tnBOJCmN8OdmQeBQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=M51BFTxLslgA:10
 a=i1IsUcr2s-wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=2AEO0YjSAAAA:8 a=VwQbUJbxAAAA:8
 a=NifzlKhAlxbwiDc_K4AA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: 3LUKxFw4kXlmlD1SQYocjgt2OSh4yWvY
X-Proofpoint-GUID: 3LUKxFw4kXlmlD1SQYocjgt2OSh4yWvY
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
	BLOCKLISTDE_FAIL(0.00)[2603:10b6:8:162::17:server fail,52.101.52.114:server fail,148.163.149.154:server fail];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DNSWL_BLOCKED(0.00)[52.101.52.114:received,2603:10b6:8:162::17:received];
	DKIM_TRACE(0.00)[silabs.com:+]
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 4018D3F900
X-Spamd-Bar: ----
Message-ID-Hash: QBK4Q2CQAQINNDQBBGY2S4UMDLP2TIWK
X-Message-ID-Hash: QBK4Q2CQAQINNDQBBGY2S4UMDLP2TIWK
X-MailFrom: Damien.Riegel@silabs.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, Silicon Labs Kernel Team <linux-devel@silabs.com>, =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH 01/14] greybus: cpc: add minimal CPC Host Device infrastructure
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/QBK4Q2CQAQINNDQBBGY2S4UMDLP2TIWK/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

QXMgdGhlIGZpcnN0IHN0ZXAgZm9yIGFkZGluZyBDUEMgc3VwcG9ydCB3aXRoIEdyZXlidXMsIGFk
ZCBhIHZlcnkNCm1pbmltYWwgbW9kdWxlIGZvciBDUEMgSG9zdCBEZXZpY2VzLiBGb3Igbm93LCB0
aGlzIG1vZHVsZSBvbmx5IHByb3hpZXMNCmNhbGxzIHRvIHRoZSBHcmV5YnVzIEhvc3QgRGV2aWNl
IEFQSSBhbmQgZG9lcyBub3RoaW5nIHVzZWZ1bCwgYnV0DQpmdXJ0aGVyIGNvbW1pdHMgd2lsbCB1
c2UgdGhpcyBiYXNlIHRvIGFkZCBmZWF0dXJlcy4NCg0KU2lnbmVkLW9mZi1ieTogRGFtaWVuIFJp
w6lnZWwgPGRhbWllbi5yaWVnZWxAc2lsYWJzLmNvbT4NCi0tLQ0KIE1BSU5UQUlORVJTICAgICAg
ICAgICAgICAgICAgfCAgNiArKysNCiBkcml2ZXJzL2dyZXlidXMvS2NvbmZpZyAgICAgIHwgIDIg
Kw0KIGRyaXZlcnMvZ3JleWJ1cy9NYWtlZmlsZSAgICAgfCAgMiArDQogZHJpdmVycy9ncmV5YnVz
L2NwYy9LY29uZmlnICB8IDEwICsrKysrDQogZHJpdmVycy9ncmV5YnVzL2NwYy9NYWtlZmlsZSB8
ICA2ICsrKw0KIGRyaXZlcnMvZ3JleWJ1cy9jcGMvaG9zdC5jICAgfCA4NCArKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysNCiBkcml2ZXJzL2dyZXlidXMvY3BjL2hvc3QuaCAgIHwg
NDAgKysrKysrKysrKysrKysrKysNCiA3IGZpbGVzIGNoYW5nZWQsIDE1MCBpbnNlcnRpb25zKCsp
DQogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3JleWJ1cy9jcGMvS2NvbmZpZw0KIGNyZWF0
ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dyZXlidXMvY3BjL01ha2VmaWxlDQogY3JlYXRlIG1vZGUg
MTAwNjQ0IGRyaXZlcnMvZ3JleWJ1cy9jcGMvaG9zdC5jDQogY3JlYXRlIG1vZGUgMTAwNjQ0IGRy
aXZlcnMvZ3JleWJ1cy9jcGMvaG9zdC5oDQoNCmRpZmYgLS1naXQgYS9NQUlOVEFJTkVSUyBiL01B
SU5UQUlORVJTDQppbmRleCA2ZDFkZTgyZTZkYy4uNTZkYWY5ZWMzMTAgMTAwNjQ0DQotLS0gYS9N
QUlOVEFJTkVSUw0KKysrIGIvTUFJTlRBSU5FUlMNCkBAIC0xMDc3NCw2ICsxMDc3NCwxMiBAQCBT
OglNYWludGFpbmVkDQogRjoJRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL25ldC90
aSxjYzEzNTJwNy55YW1sDQogRjoJZHJpdmVycy9ncmV5YnVzL2diLWJlYWdsZXBsYXkuYw0KIA0K
K0dSRVlCVVMgQ1BDIERSSVZFUlMNCitNOglEYW1pZW4gUmnDqWdlbCA8ZGFtaWVuLnJpZWdlbEBz
aWxhYnMuY29tPg0KK1I6CVNpbGljb24gTGFicyBLZXJuZWwgVGVhbSA8bGludXgtZGV2ZWxAc2ls
YWJzLmNvbT4NCitTOglTdXBwb3J0ZWQNCitGOglkcml2ZXJzL2dyZXlidXMvY3BjLyoNCisNCiBH
UkVZQlVTIFNVQlNZU1RFTQ0KIE06CUpvaGFuIEhvdm9sZCA8am9oYW5Aa2VybmVsLm9yZz4NCiBN
OglBbGV4IEVsZGVyIDxlbGRlckBrZXJuZWwub3JnPg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3Jl
eWJ1cy9LY29uZmlnIGIvZHJpdmVycy9ncmV5YnVzL0tjb25maWcNCmluZGV4IGMzZjA1NmQyOGIw
Li41NjVhMGZkY2IyYyAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3JleWJ1cy9LY29uZmlnDQorKysg
Yi9kcml2ZXJzL2dyZXlidXMvS2NvbmZpZw0KQEAgLTMwLDYgKzMwLDggQEAgY29uZmlnIEdSRVlC
VVNfQkVBR0xFUExBWQ0KIAkgIFRvIGNvbXBpbGUgdGhpcyBjb2RlIGFzIGEgbW9kdWxlLCBjaG9z
ZSBNIGhlcmU6IHRoZSBtb2R1bGUNCiAJICB3aWxsIGJlIGNhbGxlZCBnYi1iZWFnbGVwbGF5Lmtv
DQogDQorc291cmNlICJkcml2ZXJzL2dyZXlidXMvY3BjL0tjb25maWciDQorDQogY29uZmlnIEdS
RVlCVVNfRVMyDQogCXRyaXN0YXRlICJHcmV5YnVzIEVTMyBVU0IgaG9zdCBjb250cm9sbGVyIg0K
IAlkZXBlbmRzIG9uIFVTQg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3JleWJ1cy9NYWtlZmlsZSBi
L2RyaXZlcnMvZ3JleWJ1cy9NYWtlZmlsZQ0KaW5kZXggZDk4NmU5NGY4ODkuLjkyZmUxZDYyNjkx
IDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncmV5YnVzL01ha2VmaWxlDQorKysgYi9kcml2ZXJzL2dy
ZXlidXMvTWFrZWZpbGUNCkBAIC0yMSw2ICsyMSw4IEBAIGNjZmxhZ3MteSArPSAtSSQoc3JjKQ0K
IG9iai0kKENPTkZJR19HUkVZQlVTX0JFQUdMRVBMQVkpCSs9IGdiLWJlYWdsZXBsYXkubw0KIA0K
ICMgR3JleWJ1cyBIb3N0IGNvbnRyb2xsZXIgZHJpdmVycw0KK29iai0kKENPTkZJR19HUkVZQlVT
X0NQQykJKz0gY3BjLw0KKw0KIGdiLWVzMi15IDo9IGVzMi5vDQogDQogb2JqLSQoQ09ORklHX0dS
RVlCVVNfRVMyKQkrPSBnYi1lczIubw0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3JleWJ1cy9jcGMv
S2NvbmZpZyBiL2RyaXZlcnMvZ3JleWJ1cy9jcGMvS2NvbmZpZw0KbmV3IGZpbGUgbW9kZSAxMDA2
NDQNCmluZGV4IDAwMDAwMDAwMDAwLi5hYjk2ZmVkZDBkZQ0KLS0tIC9kZXYvbnVsbA0KKysrIGIv
ZHJpdmVycy9ncmV5YnVzL2NwYy9LY29uZmlnDQpAQCAtMCwwICsxLDEwIEBADQorIyBTUERYLUxp
Y2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMA0KKw0KK2NvbmZpZyBHUkVZQlVTX0NQQw0KKwl0cmlz
dGF0ZSAiR3JleWJ1cyBDUEMgZHJpdmVyIg0KKwloZWxwDQorCSAgU2VsZWN0IHRoaXMgb3B0aW9u
IGlmIHlvdSBoYXZlIGEgU2lsaWNvbiBMYWJzIGRldmljZSB0aGF0IGFjdHMgYXMgYQ0KKwkgIEdy
ZXlidXMgU1ZDLg0KKw0KKwkgIFRvIGNvbXBpbGUgdGhpcyBjb2RlIGFzIGEgbW9kdWxlLCBjaG9z
ZSBNIGhlcmU6IHRoZSBtb2R1bGUgd2lsbCBiZQ0KKwkgIGNhbGxlZCBnYi1jcGMua28NCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dyZXlidXMvY3BjL01ha2VmaWxlIGIvZHJpdmVycy9ncmV5YnVzL2Nw
Yy9NYWtlZmlsZQ0KbmV3IGZpbGUgbW9kZSAxMDA2NDQNCmluZGV4IDAwMDAwMDAwMDAwLi40OTA5
ODJhMGZmNQ0KLS0tIC9kZXYvbnVsbA0KKysrIGIvZHJpdmVycy9ncmV5YnVzL2NwYy9NYWtlZmls
ZQ0KQEAgLTAsMCArMSw2IEBADQorIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMA0K
Kw0KK2diLWNwYy15IDo9IGhvc3Qubw0KKw0KKyMgQ1BDIGNvcmUNCitvYmotJChDT05GSUdfR1JF
WUJVU19DUEMpCSs9IGdiLWNwYy5vDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncmV5YnVzL2NwYy9o
b3N0LmMgYi9kcml2ZXJzL2dyZXlidXMvY3BjL2hvc3QuYw0KbmV3IGZpbGUgbW9kZSAxMDA2NDQN
CmluZGV4IDAwMDAwMDAwMDAwLi44MDUxNjUxN2ZmNg0KLS0tIC9kZXYvbnVsbA0KKysrIGIvZHJp
dmVycy9ncmV5YnVzL2NwYy9ob3N0LmMNCkBAIC0wLDAgKzEsODQgQEANCisvLyBTUERYLUxpY2Vu
c2UtSWRlbnRpZmllcjogR1BMLTIuMA0KKy8qDQorICogQ29weXJpZ2h0IChjKSAyMDI1LCBTaWxp
Y29uIExhYm9yYXRvcmllcywgSW5jLg0KKyAqLw0KKw0KKyNpbmNsdWRlIDxsaW51eC9lcnIuaD4N
CisjaW5jbHVkZSA8bGludXgvZ3JleWJ1cy5oPg0KKyNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4N
CisNCisjaW5jbHVkZSAiaG9zdC5oIg0KKw0KK3N0YXRpYyBzdHJ1Y3QgY3BjX2hvc3RfZGV2aWNl
ICpnYl9oZF90b19jcGNfaGQoc3RydWN0IGdiX2hvc3RfZGV2aWNlICpoZCkNCit7DQorCXJldHVy
biAoc3RydWN0IGNwY19ob3N0X2RldmljZSAqKSZoZC0+aGRfcHJpdjsNCit9DQorDQorc3RhdGlj
IGludCBjcGNfZ2JfbWVzc2FnZV9zZW5kKHN0cnVjdCBnYl9ob3N0X2RldmljZSAqZ2JfaGQsIHUx
NiBjcG9ydF9pZCwNCisJCQkgICAgICAgc3RydWN0IGdiX21lc3NhZ2UgKm1lc3NhZ2UsIGdmcF90
IGdmcF9tYXNrKQ0KK3sNCisJc3RydWN0IGNwY19ob3N0X2RldmljZSAqY3BjX2hkID0gZ2JfaGRf
dG9fY3BjX2hkKGdiX2hkKTsNCisNCisJcmV0dXJuIGNwY19oZC0+ZHJpdmVyLT5tZXNzYWdlX3Nl
bmQoY3BjX2hkLCBjcG9ydF9pZCwgbWVzc2FnZSwgZ2ZwX21hc2spOw0KK30NCisNCitzdGF0aWMg
dm9pZCBjcGNfZ2JfbWVzc2FnZV9jYW5jZWwoc3RydWN0IGdiX21lc3NhZ2UgKm1lc3NhZ2UpDQor
ew0KKwkvKiBOb3QgaW1wbGVtZW50ZWQgKi8NCit9DQorDQorc3RhdGljIHN0cnVjdCBnYl9oZF9k
cml2ZXIgY3BjX2diX2RyaXZlciA9IHsNCisJLmhkX3ByaXZfc2l6ZSA9IHNpemVvZihzdHJ1Y3Qg
Y3BjX2hvc3RfZGV2aWNlKSwNCisJLm1lc3NhZ2Vfc2VuZCA9IGNwY19nYl9tZXNzYWdlX3NlbmQs
DQorCS5tZXNzYWdlX2NhbmNlbCA9IGNwY19nYl9tZXNzYWdlX2NhbmNlbCwNCit9Ow0KKw0KK3N0
cnVjdCBjcGNfaG9zdF9kZXZpY2UgKmNwY19oZF9jcmVhdGUoc3RydWN0IGNwY19oZF9kcml2ZXIg
KmRyaXZlciwgc3RydWN0IGRldmljZSAqcGFyZW50KQ0KK3sNCisJc3RydWN0IGNwY19ob3N0X2Rl
dmljZSAqY3BjX2hkOw0KKwlzdHJ1Y3QgZ2JfaG9zdF9kZXZpY2UgKmhkOw0KKw0KKwlpZiAoKCFk
cml2ZXItPm1lc3NhZ2Vfc2VuZCkgfHwgKCFkcml2ZXItPm1lc3NhZ2VfY2FuY2VsKSkgew0KKwkJ
ZGV2X2VycihwYXJlbnQsICJtaXNzaW5nIG1hbmRhdG9yeSBjYWxsYmFja3NcbiIpOw0KKwkJcmV0
dXJuIEVSUl9QVFIoLUVJTlZBTCk7DQorCX0NCisNCisJaGQgPSBnYl9oZF9jcmVhdGUoJmNwY19n
Yl9kcml2ZXIsIHBhcmVudCwgR0JfQ1BDX01TR19TSVpFX01BWCwgR0JfQ1BDX05VTV9DUE9SVFMp
Ow0KKwlpZiAoSVNfRVJSKGhkKSkNCisJCXJldHVybiAoc3RydWN0IGNwY19ob3N0X2RldmljZSAq
KWhkOw0KKw0KKwljcGNfaGQgPSBnYl9oZF90b19jcGNfaGQoaGQpOw0KKwljcGNfaGQtPmdiX2hk
ID0gaGQ7DQorCWNwY19oZC0+ZHJpdmVyID0gZHJpdmVyOw0KKw0KKwlyZXR1cm4gY3BjX2hkOw0K
K30NCitFWFBPUlRfU1lNQk9MX0dQTChjcGNfaGRfY3JlYXRlKTsNCisNCitpbnQgY3BjX2hkX2Fk
ZChzdHJ1Y3QgY3BjX2hvc3RfZGV2aWNlICpjcGNfaGQpDQorew0KKwlyZXR1cm4gZ2JfaGRfYWRk
KGNwY19oZC0+Z2JfaGQpOw0KK30NCitFWFBPUlRfU1lNQk9MX0dQTChjcGNfaGRfYWRkKTsNCisN
Cit2b2lkIGNwY19oZF9wdXQoc3RydWN0IGNwY19ob3N0X2RldmljZSAqY3BjX2hkKQ0KK3sNCisJ
cmV0dXJuIGdiX2hkX3B1dChjcGNfaGQtPmdiX2hkKTsNCit9DQorRVhQT1JUX1NZTUJPTF9HUEwo
Y3BjX2hkX3B1dCk7DQorDQordm9pZCBjcGNfaGRfZGVsKHN0cnVjdCBjcGNfaG9zdF9kZXZpY2Ug
KmNwY19oZCkNCit7DQorCXJldHVybiBnYl9oZF9kZWwoY3BjX2hkLT5nYl9oZCk7DQorfQ0KK0VY
UE9SVF9TWU1CT0xfR1BMKGNwY19oZF9kZWwpOw0KKw0KK3ZvaWQgY3BjX2hkX3JjdmQoc3RydWN0
IGNwY19ob3N0X2RldmljZSAqY3BjX2hkLCB1MTYgY3BvcnRfaWQsIHU4ICpkYXRhLCBzaXplX3Qg
bGVuZ3RoKQ0KK3sNCisJZ3JleWJ1c19kYXRhX3JjdmQoY3BjX2hkLT5nYl9oZCwgY3BvcnRfaWQs
IGRhdGEsIGxlbmd0aCk7DQorfQ0KK0VYUE9SVF9TWU1CT0xfR1BMKGNwY19oZF9yY3ZkKTsNCisN
CitNT0RVTEVfREVTQ1JJUFRJT04oIkdyZXlidXMgb3ZlciBDUEMiKTsNCitNT0RVTEVfTElDRU5T
RSgiR1BMIik7DQorTU9EVUxFX0FVVEhPUigiU2lsaWNvbiBMYWJvcmF0b3JpZXMsIEluYy4iKTsN
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dyZXlidXMvY3BjL2hvc3QuaCBiL2RyaXZlcnMvZ3JleWJ1
cy9jcGMvaG9zdC5oDQpuZXcgZmlsZSBtb2RlIDEwMDY0NA0KaW5kZXggMDAwMDAwMDAwMDAuLmY1
NWZlYjMwM2Y0DQotLS0gL2Rldi9udWxsDQorKysgYi9kcml2ZXJzL2dyZXlidXMvY3BjL2hvc3Qu
aA0KQEAgLTAsMCArMSw0MCBAQA0KKy8qIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4w
ICovDQorLyoNCisgKiBDb3B5cmlnaHQgKGMpIDIwMjUsIFNpbGljb24gTGFib3JhdG9yaWVzLCBJ
bmMuDQorICovDQorDQorI2lmbmRlZiBfX0NQQ19IT1NUX0gNCisjZGVmaW5lIF9fQ1BDX0hPU1Rf
SA0KKw0KKyNpbmNsdWRlIDxsaW51eC9kZXZpY2UuaD4NCisjaW5jbHVkZSA8bGludXgvZ3JleWJ1
cy5oPg0KKyNpbmNsdWRlIDxsaW51eC90eXBlcy5oPg0KKw0KKyNkZWZpbmUgR0JfQ1BDX01TR19T
SVpFX01BWCA0MDk2DQorI2RlZmluZSBHQl9DUENfTlVNX0NQT1JUUyA4DQorDQorc3RydWN0IGNw
Y19ob3N0X2RldmljZTsNCisNCitzdHJ1Y3QgY3BjX2hkX2RyaXZlciB7DQorCWludCAoKm1lc3Nh
Z2Vfc2VuZCkoc3RydWN0IGNwY19ob3N0X2RldmljZSAqaGQsIHUxNiBkZXN0X2Nwb3J0X2lkLA0K
KwkJCSAgICBzdHJ1Y3QgZ2JfbWVzc2FnZSAqbWVzc2FnZSwgZ2ZwX3QgZ2ZwX21hc2spOw0KKwl2
b2lkICgqbWVzc2FnZV9jYW5jZWwpKHN0cnVjdCBnYl9tZXNzYWdlICptZXNzYWdlKTsNCit9Ow0K
Kw0KKy8qKg0KKyAqIHN0cnVjdCBjcGNfaG9zdF9kZXZpY2UgLSBDUEMgaG9zdCBkZXZpY2UuDQor
ICogQGdiX2hkOiBwb2ludGVyIHRvIEdyZXlidXMgSG9zdCBEZXZpY2UgdGhpcyBkZXZpY2UgYmVs
b25ncyB0by4NCisgKiBAZHJpdmVyOiBkcml2ZXIgb3BlcmF0aW9ucy4NCisgKi8NCitzdHJ1Y3Qg
Y3BjX2hvc3RfZGV2aWNlIHsNCisJc3RydWN0IGdiX2hvc3RfZGV2aWNlICpnYl9oZDsNCisJY29u
c3Qgc3RydWN0IGNwY19oZF9kcml2ZXIgKmRyaXZlcjsNCit9Ow0KKw0KK3N0cnVjdCBjcGNfaG9z
dF9kZXZpY2UgKmNwY19oZF9jcmVhdGUoc3RydWN0IGNwY19oZF9kcml2ZXIgKmRyaXZlciwgc3Ry
dWN0IGRldmljZSAqcGFyZW50KTsNCitpbnQgY3BjX2hkX2FkZChzdHJ1Y3QgY3BjX2hvc3RfZGV2
aWNlICpjcGNfaGQpOw0KK3ZvaWQgY3BjX2hkX3B1dChzdHJ1Y3QgY3BjX2hvc3RfZGV2aWNlICpj
cGNfaGQpOw0KK3ZvaWQgY3BjX2hkX2RlbChzdHJ1Y3QgY3BjX2hvc3RfZGV2aWNlICpjcGNfaGQp
Ow0KK3ZvaWQgY3BjX2hkX3JjdmQoc3RydWN0IGNwY19ob3N0X2RldmljZSAqY3BjX2hkLCB1MTYg
Y3BvcnRfaWQsIHU4ICpkYXRhLCBzaXplX3QgbGVuZ3RoKTsNCisNCisjZW5kaWYNCi0tIA0KMi40
OS4wDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmdy
ZXlidXMtZGV2IG1haWxpbmcgbGlzdCAtLSBncmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3JnClRv
IHVuc3Vic2NyaWJlIHNlbmQgYW4gZW1haWwgdG8gZ3JleWJ1cy1kZXYtbGVhdmVAbGlzdHMubGlu
YXJvLm9yZwo=
