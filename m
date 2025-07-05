Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 02D93AF9CF8
	for <lists+greybus-dev@lfdr.de>; Sat,  5 Jul 2025 02:41:12 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 1BBF041406
	for <lists+greybus-dev@lfdr.de>; Sat,  5 Jul 2025 00:41:11 +0000 (UTC)
Received: from mx0a-0024c301.pphosted.com (mx0a-0024c301.pphosted.com [148.163.149.154])
	by lists.linaro.org (Postfix) with ESMTPS id B6D9741111
	for <greybus-dev@lists.linaro.org>; Sat,  5 Jul 2025 00:41:03 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=silabs.com header.s=pps12202023 header.b=a4kRd+Zn;
	dkim=pass header.d=silabs.com header.s=selector1 header.b=NddQBIsz;
	arc=pass ("microsoft.com:s=arcselector10001:i=1");
	spf=pass (lists.linaro.org: domain of Damien.Riegel@silabs.com designates 148.163.149.154 as permitted sender) smtp.mailfrom=Damien.Riegel@silabs.com;
	dmarc=pass (policy=reject) header.from=silabs.com
Received: from pps.filterd (m0101743.ppops.net [127.0.0.1])
	by mx0a-0024c301.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 564No2mE017370;
	Fri, 4 Jul 2025 19:40:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps12202023;
	 bh=8lkQYMjKFJTTwOabgxVKdF5ZbLzKKXaGvirVvcS2azQ=; b=a4kRd+Zn73V8
	7COwG9Uxkgdmo9Y+TGOIwbJc+LqXw85oPTUMeMSYTtuYNggGl59jTb3swzb+jcn6
	Pno4HEKwuxqAaal/VezRbh+oK1PSpm36FMTD/pkAXTdPowJouvby3hJwDj+afn3L
	QfvUA8eVm9KAz5L097KWYTwP9Q4XoHWqfLZsvVAUF5ruwjwJmmJzh24j0pQABXiz
	s21tWCMmmSzR48X23HSj6LeK0ROVgzddJLHycLs3N4YAzlaH9CjYnOpXkHSSWY8U
	wHZ3fIoZYsJmIICi2aA/OKs/DOCPq1HIZtf9K9bYRCbOJ7Ty2ipvuHNIJG7C84ub
	zfYxsUkaAw==
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12on2109.outbound.protection.outlook.com [40.107.244.109])
	by mx0a-0024c301.pphosted.com (PPS) with ESMTPS id 47p8pvhb7y-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Jul 2025 19:40:53 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G/EkKeqDAO5NldZ1mefstBKMpqAlC85ARfu9qMNtVJpaTbMSHbc337a381V+J2C34ZJFr4vmDmwsDvE78KMlgmNojQ1ojtcUIgpo74pgaTkCVh/QxOs8rAXaLARov1/btyhhsKJm9nevpkO6ScaQKZcw6FgXsGzMrviGEPYlOrECHI+mKRRettvnoxPmCWA4Q92cQsHeOR6WDZ1F+C2e4DwggD1xejXio48mb0VXO1w4FV8e7sUTzBaBPkcdRKoIorioWm0l8K+hE1u0lbWFoSC8b5uyWgUZvuivu6N4+M0a3geS7iIt8GY/Vmbrv93gLBV27Tu5jX6OvWWj6KCMUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8lkQYMjKFJTTwOabgxVKdF5ZbLzKKXaGvirVvcS2azQ=;
 b=SUd9RjCJAsJ995p4mh2F8HSYMOlhV//9BEAzT7mKvMxK14NYEw7007QZ7Ky6ce714KTrojouJlEEHnJsmW1CmAv2tOeEm+FMIw4aFwvRjoKlk70JhQNZcoGS2M8yZ7lJubqwod4XGTYn0TY432NQ924CjfJfR5OqtKi1wZbpeGJTZprVqlICxqTSi6BF8V8ckqOlu1UYRZjrQjLC4iOd+NEs07wYgM+0QfjZAfTnH5imw+CpyIbH5uGCE6lr7lOQduwpG5OEeMDtg9rtNewLfH+r/i4QyDMLNVj6/Mx1jvYqn/iM+YRewcb2/LcPj6kAdGY3qPLLOrJJzhgkfYApOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silabs.com; dmarc=pass action=none header.from=silabs.com;
 dkim=pass header.d=silabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8lkQYMjKFJTTwOabgxVKdF5ZbLzKKXaGvirVvcS2azQ=;
 b=NddQBIszwKUtITumxGrlpDPWZV0zkl5kX4oxgPbkO6VIVYegT6dZ91oaWDxxdkMiXX9RF2sS+yGQ12sWqojQFu+lkQCtThUoRsHg0tykHb6Y9BAgdnE4wTCsyR3BWz2Yg1UK6FGZTZHGcKwF1PSMNY1PXdKtt3Z79dmInwXZr5s=
Received: from DS0PR11MB8205.namprd11.prod.outlook.com (2603:10b6:8:162::17)
 by SA2PR11MB5068.namprd11.prod.outlook.com (2603:10b6:806:116::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.23; Sat, 5 Jul
 2025 00:40:51 +0000
Received: from DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::c508:9b04:3351:524a]) by DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::c508:9b04:3351:524a%4]) with mapi id 15.20.8880.034; Sat, 5 Jul 2025
 00:40:50 +0000
From: =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
To: greybus-dev@lists.linaro.org
Date: Fri,  4 Jul 2025 20:40:31 -0400
Message-ID: <20250705004036.3828-2-damien.riegel@silabs.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250705004036.3828-1-damien.riegel@silabs.com>
References: <20250705004036.3828-1-damien.riegel@silabs.com>
X-ClientProxiedBy: YQZPR01CA0029.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:86::26) To DS0PR11MB8205.namprd11.prod.outlook.com
 (2603:10b6:8:162::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8205:EE_|SA2PR11MB5068:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a5319e9-2be3-4b1e-8744-08ddbb5c973e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?a3JBc2U4OUMzSDlsNllrYmczakp2aGR5WVEyS0pic3E1UitER09pK3N5b01U?=
 =?utf-8?B?ZkhBL3gyNGR2NUlaRUIxVUZaSEErc2dvc3BTREt3d3cyVkJFL1RIOGdIYUhL?=
 =?utf-8?B?aklGUElsMCtjdWQ1QWl5dllRMXFmWnRvRmRoaFFuelJkWnQrajFUZzB4K3ZQ?=
 =?utf-8?B?NEVJV0pjK1FLMFU5LytJL3AySmJtR0FaNGRDSGE4dHFvTFdBQVRNNFAxUlNn?=
 =?utf-8?B?ZXhad2wrVnYzTTZ3ZlYwME5RSDh6MW5MSlpZa2Y2SnZ6bk41ZUY1U2xKK2Fm?=
 =?utf-8?B?WTc4bVk3YlAvbWFHZGpZYzFNTkwxZWtBTlFhMFhKbVZ0ZitSazhtei9QWUpx?=
 =?utf-8?B?Qit2Si9FVmxRRVpWM0tDUnBZMjlHbTRLVWNBWnk5amc0NkU3UlpFaUFad2RM?=
 =?utf-8?B?REhkTU9aVmc4UHdqRnhqWWhiNldqTGRNek9BQ2U3eFF1RzFwVHNyTjA0REFN?=
 =?utf-8?B?T1k5ZG1KR3dmNDNYL280bTVPVFdlL0VvUExQMTc4MFJjRzJ1UG1HRmxobk1y?=
 =?utf-8?B?QkE5d25aU3planRHbGh0U2NuVVlPMEwxZ1EzN1NPMnFQV1VWSndtbFFIczds?=
 =?utf-8?B?QXhDMDk0ZWcyRFdvSXVscHovTktzUGRCL2pjb3JvQzZPamFMU2FqanhEbzZV?=
 =?utf-8?B?Z1FaWkgyaUJHdWNHc1pNK1ZBWTlSTTV1MXowUXBwdEFaOTgxY1AwZXZlSmtO?=
 =?utf-8?B?bnYydUNyZjFhK1N3cFZaNVpBWEprTFh3MkRmSnZ2a0RCcHBZL3BhS3pvZUtv?=
 =?utf-8?B?bkt1RGlkMmliZDhJMFJKWXYwVHprQUMzNGJFakcxMUdJallDbVdNajExMUFY?=
 =?utf-8?B?dm9uU2FhQVBCam15WFZ3dllFWFYzSEtrcC9vNFZpQWd4N1ZaQ3FMYlE5eWw1?=
 =?utf-8?B?cUloL1prd24yTkFldFFxWVMySVZNVzBGS24yMEVzVkVmK2FxMHByU01KUkMz?=
 =?utf-8?B?dXZDaWVZY2IwNUNobmRoSUVVeFBhMGRvT3FYc1c0NytKeVpmalFDSEtLeWlL?=
 =?utf-8?B?cEpTTTFBaGJxRm5XcmZycFluR1JlRWJpM0tQUnY1Nm1Eb2tTdTVuOHgrRTVC?=
 =?utf-8?B?ZWFRbUphVE0vc0RnZ2JhY2ZUZUZkbnFjR25mbzM3Q1Zmb1VqdUtRRVhYNkhv?=
 =?utf-8?B?dmdhVk9jYmVGaTlqaGpLdXJoYnl0NFBwT2NPSkVMdmtMbkZ1Zzk1bHg2aFhw?=
 =?utf-8?B?Z3VKYS9wUXI4aXJMQ2JuejdVYmI1MzdiYWhIdFJ4MEQvM2k5MnErSUN0WTVJ?=
 =?utf-8?B?NDJlYllNVitRUncyN1JvcHhKcUc4NGU5M210TE9jSXM5THZDZC9mdDdJT05W?=
 =?utf-8?B?Z1NtUlJYMmFhZHArZ2tmbWdVeGxhOUpzZm5Pay9TU2c4RWJuNXlZSGdxN053?=
 =?utf-8?B?aEQ5K0RaYkJadEczL2R2d1FGVXRHQmpZN0FaRmtpUks5S1pMUGVxeXNmcWhI?=
 =?utf-8?B?K05LV1pqbjJTazV6NnZKT0pOWno2SW4rdHVNRHJOY0lNdEt5UlBBeXZxRk1n?=
 =?utf-8?B?SDhEazVRZDJWVFlJSnpwdFZUd0NwUlVCMWxpNGlOSFlTR0poUzJQOTdaNjds?=
 =?utf-8?B?MjQwdjZlVHp5MFFZMng3UGl6ZjROYTMwQkJidEtxUk1sVTBmbXdSdkpKS3or?=
 =?utf-8?B?WkliREw2VStWWGdhVU8yV25vOWVDcHJQelpGc2g2WXU0bWREUTlWemp3NzMy?=
 =?utf-8?B?TXdKWnIxS28zenRZVlBWTHh5TVZ2M3REYVBoMyt2YU42Y29qdEJLNXlnL1h4?=
 =?utf-8?B?eUpYMTFjS0tSTlFzWTcxdVRSbm9jcjNpRmFod2FRYUhpeFNOSktCK3FVakdh?=
 =?utf-8?B?NHlTZkhuek1UcUMwODhpOEhiSVc3ZHo0VnVMU2ZLUlZZNlBZcEU3elVNVDV1?=
 =?utf-8?B?RnNJNmJjNUYwbzA0TUtURHZ5Qmd6dHhxMGFEdWlLY3FWbzhnRGhKTS8ydExv?=
 =?utf-8?B?VWE1WkhURWlEUmlabkViL1FpcVZ2QVBLK0NWV1VIR2tmWi9kUi9ETnNYa1V2?=
 =?utf-8?B?MVNidEVteTJ3PT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8205.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZWdwVDdRUWZDb3dFWkpBcDBXUnkyOU1uYTJ6b2lKYVNNRml2eTQ3NEhobGNQ?=
 =?utf-8?B?Q2E1VnhScDI3K3lUdENPckd5ajlrbGVnUXdtb0VEY3pjaFljbXcyYUVZOWRx?=
 =?utf-8?B?clBWbkVlVnEzcGRFSFJYZFl2Yk1GNkxCYUM0NDdiL2ZCc2NvVUE1UFVNRmUv?=
 =?utf-8?B?TTVTVXU1cjVLdVVNMDNIbzhPQVVldHhmM2ZySmxScThiWlVvUkdFRTlBUXlQ?=
 =?utf-8?B?WkZqNDhCeHBoemMzUmg0TWpDanVkcHdZVUlDdHlnVnoyclQ4UWgrRGZKUlpJ?=
 =?utf-8?B?YUpXYXYxR0MwTHhOSldrb2t1N09QOFpvbzZveXBrS0pQbmY3L1BjRmtHaXAy?=
 =?utf-8?B?NTRSYmVLRnpYSUZkcmo3QXJSZVRJN3pWaEc1c3YzQmhNODVYM09iVUtyWWRY?=
 =?utf-8?B?STloUkNvQjNFSnJScjBsSjBLR0cvUGJlUTlsR3JoQlQ3ak1hTm9oalhIV2NY?=
 =?utf-8?B?WUE1MU1adXFGOGl2MkJLV1FiZFpQVkNrRG5rODZxcVkvTGwxbitzYU93ZXFR?=
 =?utf-8?B?bW1NYzhSZDFCMjgyS2MyaktRNTcrVDlNMVlBUnpEdzZFM2w5UElvdXRwZ2xT?=
 =?utf-8?B?eHJuNFgzVldEaFo2RDViQUdPdUp6a0loWGpQRFYwTFJkNEVPWmRoN3h2UTQr?=
 =?utf-8?B?OHE1QmNrTzMwZDdLaExPZVVmNkpNTWZpd1hBNk5ha0RjWDJYKzVUSUZkL2Zw?=
 =?utf-8?B?eGtnUk9vZm9sOURMNENRWGFVTU5odzRnOHVEZzFrS282K1I2Yk5hd0NuVEkw?=
 =?utf-8?B?eXE2U1lEaXljdDRYSGs1QUFrdFNkR0lncEFmOVl0QVBOcnQwQ2VjUEJsdmo1?=
 =?utf-8?B?MFlmbTNyUU1PMkg2ejd3UFpZRXBIWU5SQ2tpK0lCMUtEZVRPYlp3QlFOZHlz?=
 =?utf-8?B?RSs0dU9vVE82Sm0yaU5ueGRuTFlyUkN2RVN5NUZDbHBzNE1MY3ZUazdOQTFq?=
 =?utf-8?B?andPMURPcHlpckg4N2JidSt4RFJRanNyd2pYdUNOU0o0elFNWWMwMmtHcUUz?=
 =?utf-8?B?NCtwaXduaEVFSGZ1V04relhUdFpTMmxGWmlrNm45OUtyQzNKck9LN0Q1MHM2?=
 =?utf-8?B?Qk82RzUyeE9NTGdHcTVOckFRRzdtcVpuMEtPZ2pGQkpLTmVyUjRKMXNHbEli?=
 =?utf-8?B?enZYQmNkcXBSaHVvb2xHLzFqdXMzdkM0ci9Ud0ZEb1pxVnFWejRDTlc2dTVz?=
 =?utf-8?B?Vk5aeWhIMmRZc0xZWFhLenFjSkVvdWRaNnoxOERhT0xPT1Y2RklncGFraHpp?=
 =?utf-8?B?WlJVeHcvd2kvK2NkZWxTNXAwYWVlMlR6MktJYUw5OUdXdGxvTVBCak10VWZv?=
 =?utf-8?B?UzRySkRQSXdVVnNyUERpaGlsa0Y4aHVYOGxLRkRIRlgzUXk1M01uQTg2cVAv?=
 =?utf-8?B?c1BMQ1FSU1hiZTRiSHBTZlE2disvODhremVqTGtPOE4wWnZWL2VsYWROcU9Q?=
 =?utf-8?B?OFJHTTZxcFU0ZWtIOEYybWdiVHBONTlzUnpkckM4aGxwbnZZM3luZ053dzBY?=
 =?utf-8?B?YmlnNmFYZ3lLckgzMVdleFFEQzRZckRnTjl1cWsvWkhqZVV1MHVqSlk1Rmgz?=
 =?utf-8?B?YndMZ21qU2JqMlJsejdpZkl2WmhrTTdWYzlKOFdwbTZIYVpUaUxzMG5ndkRV?=
 =?utf-8?B?cmJwYndNcnVtb1haM09JQ01GamNUSHZZU3NReVJLaDhPQ1p2c3JKMUNZcFBT?=
 =?utf-8?B?T0Q4MWZqWVdhbTVtRHVISk9KVFNWb0J6ZXN5MmgxVEhxQmY5U0dPeDNLMW9P?=
 =?utf-8?B?VlJhdWxGeDgyRlZETmFBTGFEV0RyVzI2b1h4MDViSSt4WDBJZC9jYXJ4OG4w?=
 =?utf-8?B?STYxYTUvenZ2V3k1bU5lZkowQzZyaGFOb3htMVdvTGFSaXdnRHdnbi83c1Z1?=
 =?utf-8?B?Tkd3eHYreTByU0Z2UVVRYnlhUzBKSjZCUW51NXpwNTJacml3UTNJM3FiNTdO?=
 =?utf-8?B?WHpLWDdWMHBEdFJmOFI0ZHN6UTFDUUs1UCtRcHlQTmpHcGdmMDBjS3crOEl0?=
 =?utf-8?B?M3dDOGlSOEt4bWp2elBoODQ3T1J6VlpTamt1YnR3UVZTYmhsN0J4UVJMT24r?=
 =?utf-8?B?NTNFQWl2WDVRTFVvMUdJWitjQ2N4cjNFNUozM2xnWitqQUlGcWJpUU1scHAz?=
 =?utf-8?Q?QyjdP2YTFimVfhmc7TkW60oSk?=
X-OriginatorOrg: silabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a5319e9-2be3-4b1e-8744-08ddbb5c973e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8205.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2025 00:40:50.8754
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 54dbd822-5231-4b20-944d-6f4abcd541fb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lp5LKaAD6Kw87HAXEKALZlbkCa2+WaxroFAuKRNFI4c2lI5cj0pSXU6afjCqguTeJIbobAY/r2GQgwBCx5quUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5068
X-Authority-Analysis: v=2.4 cv=L4EdQ/T8 c=1 sm=1 tr=0 ts=68687495 cx=c_pps a=U259+el5m5zn0mdk/7qTUw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=M51BFTxLslgA:10 a=i1IsUcr2s-wA:10 a=2AEO0YjSAAAA:8 a=3t064-VAD3PcOXc-tpYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: n42ZsI1gXBQjpLqPVXk3z-KCaOq0Uk8h
X-Proofpoint-ORIG-GUID: n42ZsI1gXBQjpLqPVXk3z-KCaOq0Uk8h
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA1MDAwMSBTYWx0ZWRfX1Abci9alUv3g 02HvgxYdshtRct6vgNKRr/J9pzRihUIddBleNr3fnSU1fnmgAnFXbIC85k0vdFx6G5PEHUzsFCL sKOIFFKnCPt4nWFxAoGip5Cz11ypbs6sGYCgplhYpmLYs53QQHxxMaJdY3aWmQkJkUaiZY8doul
 E+NfCDX8s7iEzUBAJcRX35NbE9y4IvhUxEQ2JTiaIVMB55koHmYHpYEDg/TEuoZiFp2IoqUuQ3W 2SRw/qyzFe6zDvoqWalTZQ2ae3RtqgCp1BaOa5jb9DN0tEF8kuXZSysMd6Hm1vB+UNbiYVG/JAu 6oQ1ADyst3m3cRFSlABnReZnPK2+j54LRV5eQkWI5E/Pv5bBYoMJtTx6OC1mSDbT0QbJDgakg/3
 GhSM6BeKultH+Iw9fMqc0uglOetf3tFdz2t2bYOH2Nh/7gMJYq+K+U91s/+3nFn8CfLqHivD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=911 priorityscore=1501 adultscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 mlxscore=0 clxscore=1015 suspectscore=0
 spamscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2507050001
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: B6D9741111
X-Spamd-Bar: ----
X-Spamd-Result: default: False [-4.10 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[silabs.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:148.163.149.154];
	R_DKIM_ALLOW(-0.20)[silabs.com:s=pps12202023,silabs.com:s=selector1];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_IN_DNSWL_LOW(-0.10)[148.163.149.154:from];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:26211, ipnet:148.163.148.0/22, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_IN_DNSWL_NONE(0.00)[40.107.244.109:received];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[silabs.com:+]
X-Rspamd-Action: no action
Message-ID-Hash: IMBXQL2MAW5IPUIBSBQRAYEIJTRPX6BA
X-Message-ID-Hash: IMBXQL2MAW5IPUIBSBQRAYEIJTRPX6BA
X-MailFrom: Damien.Riegel@silabs.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: linux-kernel@vger.kernel.org, linux-devel@silabs.com, Alex Elder <elder@kernel.org>, Johan Hovold <johan@kernel.org>, =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [RFC 1/6] greybus: move host controller drivers comment in Makefile
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/IMBXQL2MAW5IPUIBSBQRAYEIJTRPX6BA/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

Z2ItYmVhZ2xlcGxheSBpcyBhbHNvIGEgR3JleWJ1cyBob3N0IGNvbnRyb2xsZXIgZHJpdmVyLCBz
byBtb3ZlIGNvbW1lbnQNCmFjY29yZGluZ2x5Lg0KDQpTaWduZWQtb2ZmLWJ5OiBEYW1pZW4gUmnD
qWdlbCA8ZGFtaWVuLnJpZWdlbEBzaWxhYnMuY29tPg0KLS0tDQogZHJpdmVycy9ncmV5YnVzL01h
a2VmaWxlIHwgMiArLQ0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlv
bigtKQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncmV5YnVzL01ha2VmaWxlIGIvZHJpdmVycy9n
cmV5YnVzL01ha2VmaWxlDQppbmRleCBkOTg2ZTk0Zjg4OS4uYzM1NjRhZDE1MWYgMTAwNjQ0DQot
LS0gYS9kcml2ZXJzL2dyZXlidXMvTWFrZWZpbGUNCisrKyBiL2RyaXZlcnMvZ3JleWJ1cy9NYWtl
ZmlsZQ0KQEAgLTE4LDkgKzE4LDkgQEAgb2JqLSQoQ09ORklHX0dSRVlCVVMpCQkrPSBncmV5YnVz
Lm8NCiAjIG5lZWRlZCBmb3IgdHJhY2UgZXZlbnRzDQogY2NmbGFncy15ICs9IC1JJChzcmMpDQog
DQorIyBHcmV5YnVzIEhvc3QgY29udHJvbGxlciBkcml2ZXJzDQogb2JqLSQoQ09ORklHX0dSRVlC
VVNfQkVBR0xFUExBWSkJKz0gZ2ItYmVhZ2xlcGxheS5vDQogDQotIyBHcmV5YnVzIEhvc3QgY29u
dHJvbGxlciBkcml2ZXJzDQogZ2ItZXMyLXkgOj0gZXMyLm8NCiANCiBvYmotJChDT05GSUdfR1JF
WUJVU19FUzIpCSs9IGdiLWVzMi5vDQotLSANCjIuNDkuMA0KDQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpncmV5YnVzLWRldiBtYWlsaW5nIGxpc3QgLS0g
Z3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpUbyB1bnN1YnNjcmliZSBzZW5kIGFuIGVtYWls
IHRvIGdyZXlidXMtZGV2LWxlYXZlQGxpc3RzLmxpbmFyby5vcmcK
