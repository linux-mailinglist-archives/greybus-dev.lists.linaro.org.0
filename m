Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A376CDA478
	for <lists+greybus-dev@lfdr.de>; Tue, 23 Dec 2025 19:32:43 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id B6B444014A
	for <lists+greybus-dev@lfdr.de>; Tue, 23 Dec 2025 18:32:42 +0000 (UTC)
Received: from mx0a-0024c301.pphosted.com (mx0a-0024c301.pphosted.com [148.163.149.154])
	by lists.linaro.org (Postfix) with ESMTPS id BAC0640144
	for <greybus-dev@lists.linaro.org>; Tue, 23 Dec 2025 18:32:09 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=silabs.com header.s=pps12202023 header.b=H2xrmccn;
	dkim=pass header.d=silabs.com header.s=selector1 header.b=YYaovFOZ;
	spf=pass (lists.linaro.org: domain of Damien.Riegel@silabs.com designates 148.163.149.154 as permitted sender) smtp.mailfrom=Damien.Riegel@silabs.com;
	dmarc=pass (policy=reject) header.from=silabs.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from pps.filterd (m0101743.ppops.net [127.0.0.1])
	by mx0a-0024c301.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNBlCKQ2900128;
	Tue, 23 Dec 2025 12:32:00 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps12202023;
	 bh=FamqqaSRTy1q0f/a3+bTNXnK7y0SrcH3qKMV7kDpRZM=; b=H2xrmccnox73
	qrPDv6+/kSfpHiKDYUcxd1jW5fcc1cwzTZXdsGW5Z1KsywLTvlac00aIgULoiJRn
	BN4HlvzSRzrmnFdkdAUCQPrwMJmL+LexpcvjuX7W9UGeQdLd8EC8SVuN6+TxUp9/
	DeVK26oBsVJc2HRB7vb+ZYMHy+BQWNJxrlMepoprytf1gkXaxLFfm3u62jdZ6w1F
	agk+1WxEbMvQDYV48KiAZPm1YODbhjFvyXzWT60hyipfKPFtT9sKGwgF80LSPlNT
	Gp4n7nyZ9qgBXUeYZPGyiZNoFlTM/+Tv2a7zZSk31PujcY51JM34UPxFvqbV8xoG
	LDNGhVSCWg==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11020105.outbound.protection.outlook.com [52.101.46.105])
	by mx0a-0024c301.pphosted.com (PPS) with ESMTPS id 4b7n7597gh-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 23 Dec 2025 12:32:00 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hOQFcp4UWVwIxAvnuyeY4cRewNkSNn1wwr0QQ+reaZDtEjH4yGni5p0LfCA3lyIZ1Ug7+itJiACgRDYpDgnROrRzdyXh3M9G7GiGMzAfU4C9g2KYvrah9mhPwlkmiQYV8YaubeqFOFgQ0vUpQWG04wVn7OFN8dc93CyNyY8nOwhVZ9tRBugpWeZK1DVxqeK5NVIlsqatLzc2Ezb6iKOp4a8UL6cBJgRvgDd66oNP2KKt5SNku7HMKMmILi5c6b8iScqtMh9iAaU+C0FzEh2h6h/tY4KPGy+UnJ/Jk9ts3VzxQeXSCfMY4Xy02q8HYxlKzPVRyUliG2OR8CyDDJI+1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FamqqaSRTy1q0f/a3+bTNXnK7y0SrcH3qKMV7kDpRZM=;
 b=rjwS3IyB/xut+lTf3sQ/nD1EHUsCDNdwVWMpSIKwXaxog11doK4pFrvetxd9Of543sUt2hGRwJlpiF44LaSIYawpGWji5tpZS3zxlE499E2OTE5Ric+eV4n2FbF1QJPhdFHGKR9vDGt95PybhS8Z44sIPP56not5bY0yPbk1V+eLki6VE4ovuIFlP3b9RRemOlkJ2/kKqgp4808NoV+XFXF72EDNtiya/aHhHPYa6PJWEY2ZvYW/bFZzWmgBJ0+IoZZZNrEeW7RGfriz19VoljsMWgOcKGgTtLW6ZBDKO79BTHZ3V+tdS3EjUcgQom3o7R8NTtxaqclN10XK45mC5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silabs.com; dmarc=pass action=none header.from=silabs.com;
 dkim=pass header.d=silabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FamqqaSRTy1q0f/a3+bTNXnK7y0SrcH3qKMV7kDpRZM=;
 b=YYaovFOZoDT6nEiOaPyZwwX3DwANlu4QBdMsYHUoDHxUhBFn1oFtSJ16peyb8Y8thdZxVn2ypXFwd2sczqCrH3dw4uibSwwMm/InAMgZLpf4YHTG7Tl/ucJdeb/Te3muye8Uxfsf/NW2zA+YqGl5u4mA1UnfvKFBZFlEN7HdMBw=
Received: from DS0PR11MB8205.namprd11.prod.outlook.com (2603:10b6:8:162::17)
 by SN7PR11MB6924.namprd11.prod.outlook.com (2603:10b6:806:2ab::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.11; Tue, 23 Dec
 2025 18:31:57 +0000
Received: from DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::2de6:bc88:2af7:3583]) by DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::2de6:bc88:2af7:3583%3]) with mapi id 15.20.9434.009; Tue, 23 Dec 2025
 18:31:57 +0000
From: =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
To: greybus-dev@lists.linaro.org
Date: Tue, 23 Dec 2025 13:31:40 -0500
Message-ID: <20251223183142.31897-7-damien.riegel@silabs.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251223183142.31897-1-damien.riegel@silabs.com>
References: <20251223183142.31897-1-damien.riegel@silabs.com>
X-ClientProxiedBy: YQZPR01CA0008.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:85::23) To DS0PR11MB8205.namprd11.prod.outlook.com
 (2603:10b6:8:162::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8205:EE_|SN7PR11MB6924:EE_
X-MS-Office365-Filtering-Correlation-Id: 04830d6f-f1ad-4d38-c76a-08de42518dea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|10070799003|376014|52116014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?dWpWVlkrZVBHZm5pMnNQNFJ0NWpQZnZXWERaTGUzenBUcTZSVDdlVkNrRXgv?=
 =?utf-8?B?QW9DRDRyQjlseTljb3I2WnJuMTY5dmJBMkkrdEEzQWduck9CRC9hbURqZ1Q0?=
 =?utf-8?B?UTNlb3lFZDI0cDR4S1pKMEtGblcrUmdjbGJjU2ZGSVpvNFZTTWxRNnJLM1lW?=
 =?utf-8?B?VFhHbUx2RnZ2cUMxbWQyTjA1RHI3WUdKUXE5d3VVZWc0N2RLTTNBQlUybVFW?=
 =?utf-8?B?Y3JQRllSV3I5NXBCbm1zaExCcG90UjVIL3dwVHpRcktpWnlFaWpENlc2WVNt?=
 =?utf-8?B?aWs3OHdGZStmcVZDcmNweFhVNERXU3Y2dlpLN0xWdnZJTWZEekRWR1gvclZT?=
 =?utf-8?B?ZHYwWVorUzlXWmk2VmFwZDRnK3BoVW1RdkVVWWZObXgxL3I3WDNSdnpKV2R6?=
 =?utf-8?B?YzdSZlV2TFRWTE5zaXE5R01uYU1hRmxYaTBFczdSRm50NUhBUFZ3cDBGdkZh?=
 =?utf-8?B?MWdSNEU5elZvb2NhRkl5N0x1M0VpQi93VVAyQ3QvaU0rYWVyZnlja3NCQW9q?=
 =?utf-8?B?dDM3dDVBSU1WbVpTc0NsM1NmSCtsKytTcTBZZFFPaTU2dnA1ODltSUNjVzdv?=
 =?utf-8?B?U1VVKzUvWlRkcVQ5ZkNSSUxjVmZRbktQN3lEM24rVWQ0TlhsY2ZZTzFxL3h0?=
 =?utf-8?B?MVYxUW1MQ2lqQm1zUVh1akpqMjJNditlZVJJeHJGc3lUYndwL25DeHNqWDNR?=
 =?utf-8?B?QUlPYnllRXVqY2FVSlA0VHlSVS93K0FaZktkWkhBclQwYmpEYmtWR3g5eVFy?=
 =?utf-8?B?L1owRVFGTUlEN0cxVzlBY3FNQlZwQjNKUG5hKzc0bThsUklRYTU3a3drTDNV?=
 =?utf-8?B?MkhsdXdqcU0ybk1scTFlbXF3K2hoYXBlNmpxc0pNdllMVVdJUUpSTkhhRXY3?=
 =?utf-8?B?T0RhNlEzTjlJNS9oWlJuY245SmdmRmxWL2FLWEljWHlnR2FIMnE5L1lLcnBI?=
 =?utf-8?B?eGJQdWt1QzNEbHVXMjJrUVFFU09QQ1VZTzVST01qTU5aNndCblJXMFVZcVdi?=
 =?utf-8?B?eTZEWkU0dHRMTElqYlNlcnZ6bFBJQUh3UkxaNzFsMjM3TFFFUGYxK1JneXJm?=
 =?utf-8?B?dGJHZ0VjMXN6dDcwei85QUVWYnBtNjh4ZEVSTkd4TC8rRHlrVXdFYlY3K3pD?=
 =?utf-8?B?MVBneHFxMFVEMGcwRUpqWDFPMjhkMXdxa1JXUlZqMkJCYUNnMEwxeVBxM2FS?=
 =?utf-8?B?ZS9UY1IrcEVKc2F6Rno0bUpWdy9odlkrbEM1UDczcHF2dzk5V2hJeS9hNzVO?=
 =?utf-8?B?RUlCbnIxck9YUzFzUkpjdnZGR0R2VFN0UHZhKzNtNVdqeVVNclYrYkpERi9L?=
 =?utf-8?B?VVhCSHFZbXB3UXY1dTZOK0V6cmE4d2tUbFNIQjVNTjVWKzFZbk0xdVl1emdS?=
 =?utf-8?B?V3p5bGFmS1QvV0VudDRnNHBLNmowbVptcVhhSVBTU0VaMFZTaHlPTUJtQXpZ?=
 =?utf-8?B?THFSejFqWmUwRndQTFcyMmpJNGV6bGhaNnlYRzBZNmYreFZYN3pWb3NLNElV?=
 =?utf-8?B?RmNKazdOZWZac1dpcm1ETmk0UXk5djIrRDhaa3AydDR3VUhUQk9wNkxOY24x?=
 =?utf-8?B?QnRuZ1hhQnEyQlhEWllKZnZiR2N3R3UxYVBWeHhHTzBYM3pDck92UUFFSmdk?=
 =?utf-8?B?dDZ1d043VEFSeDNUbkkxaTY3cEJyZS9DWmVvMHVobGhaKy94NFU3ZzJPOXU4?=
 =?utf-8?B?clNmNVdYZ1BXeUJVYzJwVUk0Ulk0ZzBqSFZFb2dMVmxhVC9zUG9XN2tGN3o1?=
 =?utf-8?B?L0lpTytXUTZBZyt4VnZqU2JhTnFNM0NWc2hROVpHelR0YmFZTDNDUnBuS2Vz?=
 =?utf-8?B?VVJwV25jeXk3T2pHY1dHMmg2T3I2K240MUtDazE2cXo0SVFVejBXd1I2ekVB?=
 =?utf-8?B?OU9udUVRUjByMndic1FLTmxYL0JmM2pPL1JZMFBGL0grV09wL0Nvb2FvMS9S?=
 =?utf-8?Q?ufYK0MJIROzEvT+I87moT4wzRWBJlPUG?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8205.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(52116014)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZkJIb0I0b1RVb3JENGdOSDFDY1JOU29VamhLcUNpV1MwRGFKNXA3SytoMUNp?=
 =?utf-8?B?T2xGNnhNOVd3TVZLMUFlSjJZcTBPdHFmYnp0Z1dwaitlSi9vRjlkN3F2WmNY?=
 =?utf-8?B?QWlBbWNES1NnVUhGekgxcTBibmlxUjZ2UTRIWit2Uk1WVDh3YnBzcmFJS1Nv?=
 =?utf-8?B?ODRiQUgyR2Zwc1RMTUFmWHltTWlnZ1BJVWxVQVpRWS96VklZeHlvUSswZlhU?=
 =?utf-8?B?c0grNFd3cEg5UHF2T1R6UlVBRTFsUlpaeWpyY3J3NEpOK210WFRXeHlRdzJp?=
 =?utf-8?B?ckdqL1BjZGxYNTlvbnVicjQxOG5YT0VtZmxycVE5cllLMUQ4SUJNbTNDYi9E?=
 =?utf-8?B?RmJUdmxtT0s2Y2RYSno5UFRkQzdyV08xKzIwbDRwYVgyem9ReW8wM3VzcEEw?=
 =?utf-8?B?QzF3TDFvVXNlSVJrNXZtMHRaZkI4dWlTWHplcVg5UzJHNEl6ZmdNemd4Y3BE?=
 =?utf-8?B?T0NkdmJEcks4bTMwTVdyTnRyUHBRNjR4ODFtRHBBc0RlN0NlUmJnaDM0UG9o?=
 =?utf-8?B?U0FWY2VyTkZlZGxXV0VkMHFxdWhrY016RGNGUFVKYVhqWWxFWUZleEErUnIx?=
 =?utf-8?B?aC9BUFAzRzNoV3ozZlBvVXZMK1RPTGhaR1Q0d3Y2YjJVT1R4blNPU2doVzhB?=
 =?utf-8?B?eWFYWXJONFlTN01NbjZ6VGVXRTRaeTVsUEloc2p2NDRyS0k0VDlSalFncVlM?=
 =?utf-8?B?Y3pMSkozMklidjlDazNCYk02S08wZGNmMWhyN1NhckZBWSt2SmxMNDcxWTly?=
 =?utf-8?B?ZmE5aCtuTTg1THp2WnY3NzlRYkUzOEQ1OFhWdVZWWEw4N3U0a2VCZE5GVHE2?=
 =?utf-8?B?TzhoS2Z6WDY0WXpjSzI3b3ZwVEM5QXZRai9ETHBjWTMrNlNhZWt2RjgxV25y?=
 =?utf-8?B?THdPbEs5Rm5JYkpoUDl6TUwvS0tZTmI2aDR4bVpSc2lJK0NuelRHVC9kOUZy?=
 =?utf-8?B?ZkxVbnhrZUJVdTV1aTZjdVlGT1hSNEVRMW5mcmZ4Snl3THlQNFJvT3FOc3Az?=
 =?utf-8?B?YXMvd1BuWCs5OWl0OHlId29MdnpuMU0vbGRFbGg0SGRxSlA1OUJTMTFmeW5w?=
 =?utf-8?B?d29jSFlNTjFyZWl0ZGYzbGw5NkFFZE9ibUZaTURyNmJZemJXdUNuMkdzZ3gv?=
 =?utf-8?B?bFh1V3dScDZaSkJnOWF1RnJpb3ZOaDhmRWZtUC8yL0RyZWpxNHowT0tybitv?=
 =?utf-8?B?WG5aNWdQRUNGb0d6RW9zVHQxUk5FWTZDMFhXeGkxOWllVGNkbXREOS9rZnNL?=
 =?utf-8?B?NjZOUHlFSUgzOUkwUTlqaUhibXdHa29uUVlEdm9KcmlGMEthRDU0bEQ4VkNN?=
 =?utf-8?B?K3ZRbVc2R3VsV2Y1amxTM2pnL2VvSVVaOE53WXRLUTJVR3VLdXpIMnhwcFpa?=
 =?utf-8?B?WlNxbmdIVWRBVjZTd3IwWnZ3QS9hdVE0Y2o0TndWWEkyNGFRR2luUHJuVk5q?=
 =?utf-8?B?NHVpSGhuRUdTaWF3TEorb3QraG5NK2ZtYXZtZmFLTGdyQk5zem0rRFNhdHhK?=
 =?utf-8?B?Mnd5NklrZXBoOXN3V3NnMVJqd3kzYzZ6WkVPYW1VK3MzUVN5UG5TZkcvY3Vh?=
 =?utf-8?B?b0owZnppVHBIQWhBTWFEbUh6ODFveU5zU0wrc3dqaXBib2trWG9YSG9LSy9P?=
 =?utf-8?B?L1drMkRFM0ZZVDgrVkJZYU1VSlhIbUJMOHBWOWh6dVFWQjBybXVwaXpyVWtD?=
 =?utf-8?B?U0J4N3R0eG9SMEticldjZU5JaXJSYjczdFY0UHdrSGdLT0M3ZUkyamZ4eEFz?=
 =?utf-8?B?cU9vL2doVEN1c2MzQ2lRU244VVBlZElSbEpWMXhFeENTSzJVazIyTlp6aFkv?=
 =?utf-8?B?elArUzZ1SUoxMXB4aUxDcXZudUYvSTdiMDNEK2w2Q3FMYnoyWmFGMlJmMlBs?=
 =?utf-8?B?NnU1QmVvbGduVTVBbTN0dUFHZFd0M2lKYzJiWVlxYmJUZ010a0VwVU80V2dt?=
 =?utf-8?B?c2NxOGE1d3FsNkY5WXppQXVmV3hSZWY0YWtsSHVES0tndVdLMG9kSmlSYzdp?=
 =?utf-8?B?d1M1dGxuMWo3b2dXUzVMQzV6RmVYVmExUXFSR0RoZXZPYzBXZC9KZWdJYjBQ?=
 =?utf-8?B?K3VLaGRrVjBncld2YmpBeWdrY0NsTDNhTkhlL1BmM2VqSjdIN1ZMVTFGdHZO?=
 =?utf-8?B?RjBoRExOdldlUHpPV1RTOVR2TVVUN0J0M2RncUV6ZlhJdVFJT2I3VlVkRHpj?=
 =?utf-8?B?TTk0d005d2pkMnhXTzRPeEJPd0hkanlZeUlPd3FLcHdHSlh0TmtZajRXOXg3?=
 =?utf-8?B?bGo3cDJSdnp0RXF0dE90clg0U2FkeGIvcGw0M25udjNsTDY0YU52UUorWTBa?=
 =?utf-8?B?RnhOdkcxb0w2WXRxb29JVGhsU2FCSGQxL1dNNVluNG9JdGRUYWlBSUduVTQw?=
 =?utf-8?Q?KpNAKRuaPmnUp0Az5Aa07MDFLy/ThGk2y55tDxnrqBzPd?=
X-MS-Exchange-AntiSpam-MessageData-1: zyR0PRzd14rHUg==
X-OriginatorOrg: silabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04830d6f-f1ad-4d38-c76a-08de42518dea
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8205.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2025 18:31:57.5692
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 54dbd822-5231-4b20-944d-6f4abcd541fb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mRXozY9VFH5wH+KGaNk76AgdbsOs8Wmh4xoRdk8GTkOvzqhO6LDR9i3BkIg04OWZw8o+iHCdr17Ks/hCF9kk6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6924
X-Authority-Analysis: v=2.4 cv=SsmdKfO0 c=1 sm=1 tr=0 ts=694ae020 cx=c_pps
 a=b2ykEmuCBAXBKoHv9pAjeQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=M51BFTxLslgA:10
 a=i1IsUcr2s-wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=2AEO0YjSAAAA:8
 a=7mErHIEjM_s6ZtgfZmEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: vX7YqzzP7m-ZEUP4JQV1shyaRUhiPtjs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDE1NCBTYWx0ZWRfXyh7n+z2RK0Oz
 ERJ7xxMtQ6VinKfJPAcNVypq5Kbo9VVa7ll6CY85jo09HRYrT2Pm8CExZBypR7migNhwY7rsB3g
 b/ma6vEUs1geUInBsb9Vg0TDTqhyXgwF45ExYoou2bN7zeta/Zd2Tadabi8w79q792/7M0u2KoV
 Qy3nG6Thb3KOLC09MF53aDaETv2nqKkPO/ZaziTYDpY3NwzUHhtzxffaMRP50l4ZjsbwfjHFWro
 mpQiz6iAlQgAkZFR1S6zyBj7qXWsll/FBkUDGpXdj2R3SSM4L4IU8KdMgbexX9v3GxPqWzcgYgb
 r12GmOAJ1nYMyCt7ZkVrcYA8AwGWH0Ol1zUGzXWBbaf6qukEZmiMOT3gS97UPtCBR0K6oyaZH5/
 PAI08qomSGLevX0iPbBFxIfPyXZx9Qs1irrRC+ZD6TLbayHudG/wOWUTMNfsxjnbLGjK7odKaK0
 Fil0OebqF+HO431FUaA==
X-Proofpoint-GUID: vX7YqzzP7m-ZEUP4JQV1shyaRUhiPtjs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_04,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230154
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.00 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[silabs.com,reject];
	R_DKIM_ALLOW(-0.20)[silabs.com:s=pps12202023,silabs.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:148.163.149.154];
	MIME_GOOD(-0.10)[text/plain];
	ASN(0.00)[asn:26211, ipnet:148.163.148.0/22, country:US];
	RCPT_COUNT_SEVEN(0.00)[7];
	MIME_TRACE(0.00)[0:+];
	BLOCKLISTDE_FAIL(0.00)[148.163.149.154:server fail];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_THREE(0.00)[4];
	URIBL_BLOCKED(0.00)[silabs.com:mid,silabs.com:email,silabs.com:dkim,silabs.com:from_smtp,silabs.com:from_mime,mx0a-0024c301.pphosted.com:rdns,mx0a-0024c301.pphosted.com:helo];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DNSWL_BLOCKED(0.00)[52.101.46.105:received,2603:10b6:8:162::17:received,148.163.149.154:from];
	DKIM_TRACE(0.00)[silabs.com:+]
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: BAC0640144
X-Spamd-Bar: ---
Message-ID-Hash: EZQZCIB33SVFHBQAGRGQ5XO2NTIL6B5L
X-Message-ID-Hash: EZQZCIB33SVFHBQAGRGQ5XO2NTIL6B5L
X-MailFrom: Damien.Riegel@silabs.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, linux-devel@silabs.com, =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH 6/8] greybus: make host API work without SVC
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/EZQZCIB33SVFHBQAGRGQ5XO2NTIL6B5L/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SW4gcHJlcGFyYXRpb24gZm9yIGFuIFNWQy1sZXNzIHRvcG9sb2d5LCBtYWtlIGhvc3QgZGV2aWNl
IEFQSSBiZWhhdmVzDQpuaWNlbHkgaWYgYW4gU1ZDIGlzIG5vdCBhbGxvY2F0ZWQuDQoNClNpZ25l
ZC1vZmYtYnk6IERhbWllbiBSacOpZ2VsIDxkYW1pZW4ucmllZ2VsQHNpbGFicy5jb20+DQotLS0N
CiBkcml2ZXJzL2dyZXlidXMvaGQuYyB8IDI3ICsrKysrKysrKysrKysrKysrKysrKy0tLS0tLQ0K
IDEgZmlsZSBjaGFuZ2VkLCAyMSBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQ0KDQpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncmV5YnVzL2hkLmMgYi9kcml2ZXJzL2dyZXlidXMvaGQuYw0KaW5k
ZXggNWRlOThkOTE3N2YuLjFlMmYxZjNhNjVmIDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncmV5YnVz
L2hkLmMNCisrKyBiL2RyaXZlcnMvZ3JleWJ1cy9oZC5jDQpAQCAtNDUsMTEgKzQ1LDE5IEBAIHN0
YXRpYyBzdHJ1Y3QgYXR0cmlidXRlICpidXNfYXR0cnNbXSA9IHsNCiB9Ow0KIEFUVFJJQlVURV9H
Uk9VUFMoYnVzKTsNCiANCitzdGF0aWMgYm9vbCBnYl9oZF9pc19wMnAoc3RydWN0IGdiX2hvc3Rf
ZGV2aWNlICpoZCkNCit7DQorCXJldHVybiAhaGQtPnN2YzsNCit9DQorDQogaW50IGdiX2hkX2Nw
b3J0X3Jlc2VydmUoc3RydWN0IGdiX2hvc3RfZGV2aWNlICpoZCwgdTE2IGNwb3J0X2lkKQ0KIHsN
CiAJc3RydWN0IGlkYSAqaWRfbWFwID0gJmhkLT5jcG9ydF9pZF9tYXA7DQogCWludCByZXQ7DQog
DQorCWlmIChnYl9oZF9pc19wMnAoaGQpKQ0KKwkJcmV0dXJuIC1FUEVSTTsNCisNCiAJcmV0ID0g
aWRhX2FsbG9jX3JhbmdlKGlkX21hcCwgY3BvcnRfaWQsIGNwb3J0X2lkLCBHRlBfS0VSTkVMKTsN
CiAJaWYgKHJldCA8IDApIHsNCiAJCWRldl9lcnIoJmhkLT5kZXYsICJmYWlsZWQgdG8gcmVzZXJ2
ZSBjcG9ydCAldVxuIiwgY3BvcnRfaWQpOw0KQEAgLTY0LDYgKzcyLDkgQEAgdm9pZCBnYl9oZF9j
cG9ydF9yZWxlYXNlX3Jlc2VydmVkKHN0cnVjdCBnYl9ob3N0X2RldmljZSAqaGQsIHUxNiBjcG9y
dF9pZCkNCiB7DQogCXN0cnVjdCBpZGEgKmlkX21hcCA9ICZoZC0+Y3BvcnRfaWRfbWFwOw0KIA0K
KwlpZiAoZ2JfaGRfaXNfcDJwKGhkKSkNCisJCXJldHVybjsNCisNCiAJaWRhX2ZyZWUoaWRfbWFw
LCBjcG9ydF9pZCk7DQogfQ0KIEVYUE9SVF9TWU1CT0xfR1BMKGdiX2hkX2Nwb3J0X3JlbGVhc2Vf
cmVzZXJ2ZWQpOw0KQEAgLTIwNSwxMCArMjE2LDEyIEBAIGludCBnYl9oZF9hZGQoc3RydWN0IGdi
X2hvc3RfZGV2aWNlICpoZCkNCiAJaWYgKHJldCkNCiAJCXJldHVybiByZXQ7DQogDQotCXJldCA9
IGdiX3N2Y19hZGQoaGQtPnN2Yyk7DQotCWlmIChyZXQpIHsNCi0JCWRldmljZV9kZWwoJmhkLT5k
ZXYpOw0KLQkJcmV0dXJuIHJldDsNCisJaWYgKCFnYl9oZF9pc19wMnAoaGQpKSB7DQorCQlyZXQg
PSBnYl9zdmNfYWRkKGhkLT5zdmMpOw0KKwkJaWYgKHJldCkgew0KKwkJCWRldmljZV9kZWwoJmhk
LT5kZXYpOw0KKwkJCXJldHVybiByZXQ7DQorCQl9DQogCX0NCiANCiAJdHJhY2VfZ2JfaGRfYWRk
KGhkKTsNCkBAIC0yMjUsNyArMjM4LDggQEAgdm9pZCBnYl9oZF9kZWwoc3RydWN0IGdiX2hvc3Rf
ZGV2aWNlICpoZCkNCiAJICogVGVhciBkb3duIHRoZSBzdmMgYW5kIGZsdXNoIGFueSBvbi1nb2lu
ZyBob3RwbHVnIHByb2Nlc3NpbmcgYmVmb3JlDQogCSAqIHJlbW92aW5nIHRoZSByZW1haW5pbmcg
aW50ZXJmYWNlcy4NCiAJICovDQotCWdiX3N2Y19kZWwoaGQtPnN2Yyk7DQorCWlmICghZ2JfaGRf
aXNfcDJwKGhkKSkNCisJCWdiX3N2Y19kZWwoaGQtPnN2Yyk7DQogDQogCWRldmljZV9kZWwoJmhk
LT5kZXYpOw0KIH0NCkBAIC0yMzMsNyArMjQ3LDggQEAgRVhQT1JUX1NZTUJPTF9HUEwoZ2JfaGRf
ZGVsKTsNCiANCiB2b2lkIGdiX2hkX3NodXRkb3duKHN0cnVjdCBnYl9ob3N0X2RldmljZSAqaGQp
DQogew0KLQlnYl9zdmNfZGVsKGhkLT5zdmMpOw0KKwlpZiAoIWdiX2hkX2lzX3AycChoZCkpDQor
CQlnYl9zdmNfZGVsKGhkLT5zdmMpOw0KIH0NCiBFWFBPUlRfU1lNQk9MX0dQTChnYl9oZF9zaHV0
ZG93bik7DQogDQotLSANCjIuNDkuMA0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpncmV5YnVzLWRldiBtYWlsaW5nIGxpc3QgLS0gZ3JleWJ1cy1kZXZA
bGlzdHMubGluYXJvLm9yZwpUbyB1bnN1YnNjcmliZSBzZW5kIGFuIGVtYWlsIHRvIGdyZXlidXMt
ZGV2LWxlYXZlQGxpc3RzLmxpbmFyby5vcmcK
