Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id B99BEAF9CFD
	for <lists+greybus-dev@lfdr.de>; Sat,  5 Jul 2025 02:41:25 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id D380345700
	for <lists+greybus-dev@lfdr.de>; Sat,  5 Jul 2025 00:41:24 +0000 (UTC)
Received: from mx0a-0024c301.pphosted.com (mx0a-0024c301.pphosted.com [148.163.149.154])
	by lists.linaro.org (Postfix) with ESMTPS id 891BC443DC
	for <greybus-dev@lists.linaro.org>; Sat,  5 Jul 2025 00:41:06 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=silabs.com header.s=pps12202023 header.b=gI0oLc9o;
	dkim=pass header.d=silabs.com header.s=selector1 header.b=VPjoFap6;
	arc=pass ("microsoft.com:s=arcselector10001:i=1");
	spf=pass (lists.linaro.org: domain of Damien.Riegel@silabs.com designates 148.163.149.154 as permitted sender) smtp.mailfrom=Damien.Riegel@silabs.com;
	dmarc=pass (policy=reject) header.from=silabs.com
Received: from pps.filterd (m0101743.ppops.net [127.0.0.1])
	by mx0a-0024c301.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 564No2mI017370;
	Fri, 4 Jul 2025 19:40:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps12202023;
	 bh=/suzptPQQhpdB33961Lc8ADWizMVaJZi9ivZd/di7AM=; b=gI0oLc9o10yk
	sQKfJ0SXQLzqmxuUOtYQXVxi5E3aXTEx3hQbtXztlpXqcdD5f4PCqZevk5FSniCp
	nU0D3MmQqkkgrm5o5R9ByXKKFGj73XCuodfNIqPALoEQiQ7jtGqfy88i/r8oPD2i
	fscItuDKGb531oUoacqMPyg25HfPS5y8tJ8i3JSzFZTHITYJnJyL0guC6XQk5Itd
	ARqKifZLJd9daFhoPH0bh2vd+Rs0lHnTIzgYinLklQXIlOgKc6W8MaLzIiOKiBzJ
	A5fP1Rd+R53jQyRx0wxFnnW5NXj2F0C+u/ECR5A4kFMSWv4H0jiuzT6/oi7pTFfD
	lz5SJAFMvA==
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12on2109.outbound.protection.outlook.com [40.107.244.109])
	by mx0a-0024c301.pphosted.com (PPS) with ESMTPS id 47p8pvhb7y-6
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Jul 2025 19:40:56 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eWbgRjHjuZNkDWU9ZlsdbsvgZrEdKvTAxETBh/RTwldD7roeneT04FIBJgRVQ6tpk+WU13dTNt+v7Jxb1CcMAcqSHAFGknXxGcpiiSiNJ5YFznHE9k7jgognhEWS0UKn5rCcCOoexyz/yuVrEf9jwOl0U7A4YEZ55MdZzgZk3EyrDdoi8moymKsX9i5zFbkwuLNY3IUlpZltNjzxbYOHhbTYlcbyDNT5DD4v7Zbrfkph+0GaEhp6VwKsTyh9RRAHRbP6idLKDjszlndU56c0Z0orVuOV6NOjzIy6Jfv1VOmD1MP3njLZzWfSogjIFLHbt2eEEBBvolctMwdqYCm0aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/suzptPQQhpdB33961Lc8ADWizMVaJZi9ivZd/di7AM=;
 b=QUHg0/n17wCIJnO0ASWtqxztDLM41txFitmglvvjRU/Vbx8aU4CtbkiBH3e7afC1zLN1ZEa65ai0R/vvD6hOojq6iI1oBI/Av4WPAjD8a2LSGqbegqjPLHKaIWPg1iyiE4dUQCPAWgcziyNND56X/YxOp5UqWzzXZhehDRFUKVdRaUw5iXnRLmVfJuKHi/X+UsD7ppAeQd9/zIILy6ya/2M/rtZUCNZjezGQ41qU/g59yiFZziRJNHUka1Xu3TcPg5t8TZSt/0KghxM3IPv4NqzVmQNdiLScC33LDwwnQl1l0gx3cKdgkO4QsINo2cNLX19R8LyC+E3ilPhjKqBA1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silabs.com; dmarc=pass action=none header.from=silabs.com;
 dkim=pass header.d=silabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/suzptPQQhpdB33961Lc8ADWizMVaJZi9ivZd/di7AM=;
 b=VPjoFap6eEnsjVyEL8P0b+KmWl8bogB+17AZEedLCFdgc/vy2tRmIQ1WB9Bx9UBqaNegDLXwzTNw3mRV3JFuOOJt8C5fz54qWxyjIALgGuSW37IuRxcUQIZy+7yHNoeyXv0NBIbMVUy1DlQlbw0NDdcDWTCeNSF0OZrtXD0oB5M=
Received: from DS0PR11MB8205.namprd11.prod.outlook.com (2603:10b6:8:162::17)
 by SA2PR11MB5068.namprd11.prod.outlook.com (2603:10b6:806:116::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.23; Sat, 5 Jul
 2025 00:40:54 +0000
Received: from DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::c508:9b04:3351:524a]) by DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::c508:9b04:3351:524a%4]) with mapi id 15.20.8880.034; Sat, 5 Jul 2025
 00:40:53 +0000
From: =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
To: greybus-dev@lists.linaro.org
Date: Fri,  4 Jul 2025 20:40:35 -0400
Message-ID: <20250705004036.3828-6-damien.riegel@silabs.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250705004036.3828-1-damien.riegel@silabs.com>
References: <20250705004036.3828-1-damien.riegel@silabs.com>
X-ClientProxiedBy: YQZPR01CA0029.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:86::26) To DS0PR11MB8205.namprd11.prod.outlook.com
 (2603:10b6:8:162::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8205:EE_|SA2PR11MB5068:EE_
X-MS-Office365-Filtering-Correlation-Id: e38fca8d-0152-4650-2f9b-08ddbb5c992a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?OUhNTVFxZUYyeUJRV1RVcU93VENBaU5xcVlnalZEQjIxb3NjdUZTTlVCNGI3?=
 =?utf-8?B?ekx5anFHTmJ1UTkyb3hLeGpUZ2Q0dWlHN29maE1DRHFrU0NLeG5WZFdrQ0VF?=
 =?utf-8?B?ZXJTRGRXMUkxWndnUVBIUlVLU2l3SEozZlBPend4VHRGZ3RGbFNSbU8zUlJR?=
 =?utf-8?B?UTdINGJ3azYwanF0bEhFejA3aXpJdEtVZkpDWkhxcCtXQjQ3NXZQRERrR0Jt?=
 =?utf-8?B?YWZIVHBIcmxMbFAxZk9IRUpzU1REckRzZ2VsMWl1SVI3K0hVWnNqSk1oV1ZM?=
 =?utf-8?B?ckhHNmhTTmd6ejVYdUZ0Y0hrbVl6VlR5VGtYMkk5WnZBY3RoUjdGQTU2bHZY?=
 =?utf-8?B?WjZrQkN1UG5PMCtyTzgvRyt4c2Naa0c4RFFnZEk5T2Iyc0R6bmZoMEltSzN5?=
 =?utf-8?B?a3dJS09wai9rNzhETHNTWnRFSXB1TW9Yd1pKZDRwWHBYcHBnZG1CTVM3R1dE?=
 =?utf-8?B?ZW9OZDgrSnYxS0xJMS8zUDdQTS9UVkFXNkZsZTYxUFdlWnRxTExKMjUwQlRK?=
 =?utf-8?B?SGdmUjhFYXphU3ZvbjQ1T1hDV0ZHT2V6b2JtTFBXQU1OM0JmeTRYdmNFdEF1?=
 =?utf-8?B?cUZtM1oxT3J5Q0FtamVieTlPd1BTU1g5NDBYNjk5a1dmSDJFbndseEVMNlNm?=
 =?utf-8?B?VjBoc2V0djFvejdValZMdC90eGNyeGtzTzZpTEhxbUdNVi9mZ1NEaHJyRzNG?=
 =?utf-8?B?d3lsRXNzWmNENnNVUkF6YXUzcG5NOHJGVU9Lc3czdXp5ZGVKSk9yWEhMS3NV?=
 =?utf-8?B?ekNWOWxFdkdKZW1veEZpdkkyTEtpeTcxWnNDVGVaeXM1eFN0cmdmY1pQTUIz?=
 =?utf-8?B?bFFXZ1dNSDJBRzZFMVh0WXIyS2lnTEpJRnlYNkt4OWRqVXVZTGkzTHFrT1ls?=
 =?utf-8?B?dmtzNkNQSUdNRDBiUXZ5eHdlYU52b3E3WUk3QXE1bjErU0JXenA3bTZvLzhr?=
 =?utf-8?B?N3ZteUpBUkcxdHMrVUN2aTcxWFordnovbU9kMjFrUDNmSE96T0tVRUcvOWU2?=
 =?utf-8?B?QVVlam9DUERxT29pbnZMQmpWeTBQK0Q0K3RFQzVacHozcnJPOVZCT25VeUtq?=
 =?utf-8?B?SzUxeFU3MWpaaEx1Unk4N2hmbDdUa3RMOStDbm1kSTZSRzVBSVFoOHJpT0ZE?=
 =?utf-8?B?alBVemJlUytpVlllaEloZGVoQUtJcTNYVUZCTjFramZENWRPTWloZzlqTlFV?=
 =?utf-8?B?dE1TRmFtVzJlWnpCU28zTHdoRmZKMVc2cW1pbytOZFBDRU1UU0pSNGkrRHEz?=
 =?utf-8?B?Qi9pVkdMVEZSSDdlUVhWYitSc0JTQTQ4aGNtQkxFUTJPbWQyNTNhZVVzT29C?=
 =?utf-8?B?Zm5Oayt2aU8vVFYrQ29seHZGRU03MDl5eXlhNVZJc2QrcDJXd0ttcklNZE12?=
 =?utf-8?B?VUZZaDJ0eG9HSGFxYWE0bjRBWmJKdHBXVXBmdXBHVENBK0tvc0pZWHNjbXdj?=
 =?utf-8?B?U2RBYXBCUFZDVTBsT3ptQXJ0dWVGOEdSZ1o3TVpnYnNwdzdRR1AvT2VOeGJt?=
 =?utf-8?B?VmtESFR6WDF1ckMrUlYwUHVGNFQyMUYwQWxNQ3JZSldQNjVyQnUrL0trZ2xX?=
 =?utf-8?B?VDJ2dE8ybEpnK29aNTI5NUFKWDAzaldwbWZ2VmVERHFJMWhZYTZ3TS95Ymln?=
 =?utf-8?B?Z1o5bEdEY0FFcnM3bGUyREFoS2RrNkNzSndYdXMzSjVqd0JuR3hCQ3laSjc2?=
 =?utf-8?B?c2tNbGpHeTBnWkpidTFENkt0Z05VTmRzeGdTVDhBUzRmcE1wUE1aSnZiVE81?=
 =?utf-8?B?WWFtQ0Q4NFV6a3R5T0RmUTRXVm5ZbEplREk4WjhTc3cyRElkTTFma05jUmx6?=
 =?utf-8?B?aTV3dEorUloxRkhEcWp2MTVwN0RWMC9FSFlNYnNKUG9xc2tmWC9hTnQ2ZFk1?=
 =?utf-8?B?b0ZnUnZiUkc5cTlwTmRZanpKQWcvTmdTd1JoNWRWMVh3eVg1RHlXUkRUYWpw?=
 =?utf-8?B?SDl2azVTRmt3d2NHQkE5RGdMcmczN3Jxbk93SzlWK3lWTnhjVHNSaUc4QVFM?=
 =?utf-8?B?aVZML2Y5dWlnPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8205.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SVhEZGN0WnFRSUJ4Y3J5STR4bjA3Znc1NTdzTkFlTHZrRDhOVzdjbzl5L2px?=
 =?utf-8?B?NjhXQmtza1FWMUJTcVdoMkt4VGsxVXlvVHcvblNrbUVMNUpsanU2OHBEZFN1?=
 =?utf-8?B?azlyLzNOUFIyQWhSVzJaTEIvNUJNZC9JQlUxYVMvcnNueHRZdXhrQytUZUJ3?=
 =?utf-8?B?WGJILzZBekNjQ0c4K3RldXBnRVBUdW1rajU3NDFoR1pwZTgxWm5OS2s3WFJu?=
 =?utf-8?B?KzZ5dWRSczJSNnp3U0pTS3VMRmNUbFo3L1RPSUY5R2s5cFp1K1BmN2ZScnV4?=
 =?utf-8?B?THJYTDdxNEV2V21XMFZqOTdubVJvdHdRUks2TElZNC82d1lkZllmak1CZks5?=
 =?utf-8?B?N21FR1RMWnNWc0VBdmhVN1lIQ1gwQnpMNnJiY3kyMXpDd0tUNi8xR1JBZ25w?=
 =?utf-8?B?Tm50STBNMDYzMExHdldJL1pQTzdPTVJIeHRMcnpHR2lEZmxvS2duWjF4eVVq?=
 =?utf-8?B?emNtdk1kNkpabzdHa0RRU2oxVmtCenkyK0JlVFJRWEE1K09ZS1RwU1NabDNx?=
 =?utf-8?B?Vy9zd0FGelI5VkJsREprUjRLMGsxZGxaRktuOUswZ2w2d05WbHpKS0ZNUjBV?=
 =?utf-8?B?MGRPYW9uYkhWMzFXNmk1US9nQkxVc1VsSS8vckdGUVRiMk5BdkJ3Uk1rTnRS?=
 =?utf-8?B?cmNDWkI4RFZvSEhVQUlQRS9KdFh4TC9XbllleWkrUjBZY1BCWEcvSDBwWFRN?=
 =?utf-8?B?UVlQSllPMTFjTUhzWnk3RTUvRUdGY21aV3gxNU5lY2ozMVZ4R0U3K1ZHY3NP?=
 =?utf-8?B?S2NmM3pZOVJJa0hONnhabVI0dk16VmFPYnd5OEpuQ3FtdEk5Mjc5VTNPYkg1?=
 =?utf-8?B?UmpmUXRNVFhwb2NBTmhFRHNwTlJNV2dROUZpVEx0a1lYNnBlRDJjbDFHYml2?=
 =?utf-8?B?VWN6WDM4dytxWGhXWjdwUENMZ3hqYTdnQUMwU3VSblBLS2VFaXJTc3Y3dVUv?=
 =?utf-8?B?TThqN1FKSFNmUEJXaE9vWkN1aERjU0hXeVNRZHVmZ1R0RGlkR0o3RmtPVHQv?=
 =?utf-8?B?VklETlprb3RZU1JIV29lWmhMN1RBUmp5dkJhR3ZYNEl1VEorVTJqbkk4RGNr?=
 =?utf-8?B?MGpvRlV0QWJSSGo5NTh4U2YyRWRYWUFFbm55T0hhOEhCYmJhc0pjUHgyNzJj?=
 =?utf-8?B?SWtrU2JxNUhTalZ3S25MMmFUUmtzaXhoQS9TNVpxZ1k0SVl5SlNVY0czSEY4?=
 =?utf-8?B?andmUWdrRGFCZ094UGp3eFZPQ3ZCVUlRZzB5cllCNkRPdjVMMmMwOVNHVlpr?=
 =?utf-8?B?Wko3TTcyRDk4czVnMTlFMFRyQ21CaEVkTXhGb2lRanViZFdGQTBRY1FQWDRL?=
 =?utf-8?B?MFB0ZFVudDF3Wm5vVkFSa0ZnSDE1S1NRZGFVQlFGMEk2R3Fzb1dBbzFtWWVo?=
 =?utf-8?B?YmMvWXRnU3I3ZGR6ZG4rSmlvNUZ6SVBtMDVsN0pEN085YWlFQ2NaOHp0RDVs?=
 =?utf-8?B?UDNmMnJleHR1WDc2eDU4eWVYUTdwWkhuYUgvK3ZxS3F5bXh1S0xDNGNiRC9U?=
 =?utf-8?B?WnpzaVRxblR6NlpoNXFsY0kwVTRRUDRlOS9IakF4bXhYK213SVMwZVpYdVk1?=
 =?utf-8?B?b2hocVJLLzVCdkF3ajlZUHFTQThqSDZka2xTbFFscjhpQUI2eHpHYTJ4dXVo?=
 =?utf-8?B?ZU1TZWJYYU5ZT1ozajIzUlY4U2VWV1BzY2JST25PWFNJRG93a2t1L0dNTHVt?=
 =?utf-8?B?dGpvcG8yTkYzaHBSaDgxT1FJWGJwM29zQThRT2kvUW1Pby8rNWprSUk0SzRB?=
 =?utf-8?B?bTNUWHRiQ1BDeHNsMFFKUyt5TjU4Szk4R2hHcEJBYmlNbTZ6UnFTYVlTVDFR?=
 =?utf-8?B?TlVMamYzT2pVSDBERzdQUVZ0cmROYlVxM1BPclFiREd1N21QK2IyNFZFRzBV?=
 =?utf-8?B?NXE5M0lzZ3QyclZsWUFDSDVUa0F6Q3hEUzMzVVZWbVBDN3R0Q1VZTVJGRnp0?=
 =?utf-8?B?QzczQmd2bW1pS2NxUFM5OHAwWFdvTlo2dC9YL0h5TW83emUxN25TTkFoYzVF?=
 =?utf-8?B?b3JwQ1ViaE9GaHVHUTBsSFpadC9KT2Z3anMwSnNDMTA0MWovRzJqU3c0SG9v?=
 =?utf-8?B?aEk5QjJjTS9uZ0NXNU5ZY1VwNW1pdUY3Z1liblRQeC9mcHZRb2tWa1Y4OHhN?=
 =?utf-8?Q?rBVxtZBffBSTP+8/u7q7oimgZ?=
X-OriginatorOrg: silabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e38fca8d-0152-4650-2f9b-08ddbb5c992a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8205.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2025 00:40:53.8911
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 54dbd822-5231-4b20-944d-6f4abcd541fb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kVLNQulh0FyoI+PHN9StiB73+e4vGEtdo1G/0glIFtz8P8RrkzAJFTm+92yobBG+6R12Zzz+Y7MewQ82UM+Wbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5068
X-Authority-Analysis: v=2.4 cv=L4EdQ/T8 c=1 sm=1 tr=0 ts=68687498 cx=c_pps a=U259+el5m5zn0mdk/7qTUw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=M51BFTxLslgA:10 a=i1IsUcr2s-wA:10 a=2AEO0YjSAAAA:8 a=QR_wBcAtP5jTkrNFJ_gA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: ppPbQp_q168DV6yismbYyiArQIWc2mkg
X-Proofpoint-ORIG-GUID: ppPbQp_q168DV6yismbYyiArQIWc2mkg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA1MDAwMSBTYWx0ZWRfX1/DCVKF7r0ve u/kzg1DnJyWwlh8/OsGgjQiBG8dYp8J7NHJ5v9MqT3nMZAqv0A0KTptoqLk3KrehzNKo2blFgZZ aCO9524iy1IFJNQk7MN2cN0YWK0hxAXPaWTZsiRMo03FXOU+a4VpcDFBdL+RXTNwAmdi8Ii2mJ2
 wSg3IqnL010OiZFy2OLdl44OLKThqdF5DkdJucTzvzNGIDQsUplX0ERNCNMmjkGOpUjAja2IoBv S+pqfBhPDO+EH6uAE1lssA+mkD6+KviLoLUj5vF/8PjGvh9ne6tdHYPgai/1k92yjlHGYPZqte2 kxGURIBSVpq4DIjzfqRV9xPC2htBwFrrfv5vCPAfuoWEUVDUiK66UZYBAZe1VfnY/uzWJ/cBhUt
 gTTKAY0LoC6kV3kPFBxTwyyHWYeKt9RyEdwb31jHLAyKr5487VuIaSpqgsKb5n1rQT15CM/j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=999 priorityscore=1501 adultscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 mlxscore=0 clxscore=1015 suspectscore=0
 spamscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2507050001
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 891BC443DC
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
Message-ID-Hash: 672WCQ3UM5KVTDDGO574SJVJPVWEENIX
X-Message-ID-Hash: 672WCQ3UM5KVTDDGO574SJVJPVWEENIX
X-MailFrom: Damien.Riegel@silabs.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: linux-kernel@vger.kernel.org, linux-devel@silabs.com, Alex Elder <elder@kernel.org>, Johan Hovold <johan@kernel.org>, =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [RFC 5/6] greybus: match device with bundle ID
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/672WCQ3UM5KVTDDGO574SJVJPVWEENIX/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

V2hlbiBtYXRjaGluZyBhIGRldmljZSwgb25seSB0aGUgdmVuZG9yIElEIGFuZCBwcm9kdWN0IElE
IGFyZSB1c2VkLiBBcw0KYWxsIGJ1bmRsZXMgaW4gYW4gaW50ZXJmYWNlIHNoYXJlIHRoZSBzYW1l
IFZJRCBhbmQgUElELCB0aGVyZSBpcyBubyB3YXkNCnRvIGRpZmZlcmVudGlhdGUgYmV0d2VlbiB0
d28gYnVuZGxlcywgYW5kIHRoZXkgYXJlIGZvcmNlZCB0byB1c2UgdGhlDQpzYW1lIGRyaXZlci4N
Cg0KVG8gYWxsb3cgdXNpbmcgc2V2ZXJhbCB2ZW5kb3IgYnVuZGxlcyBpbiB0aGUgc2FtZSBkZXZp
Y2UsIGluY2x1ZGUgdGhlDQpidW5kbGUgSUQgd2hlbiBtYXRjaGluZy4gVGhlIGFzc3VtcHRpb24g
aGVyZSBpcyB0aGF0IGJ1bmRsZSBJRHMgYXJlDQpzdGFibGUgYWNyb3NzIHRoZSBsaWZlc3BhbiBv
ZiBhIHByb2R1Y3QgYW5kIG5ldmVyIGNoYW5nZS4NCg0KVGhlIGdvYWwgb2YgdGhpcyBjaGFuZ2Ug
aXMgdG8gb3BlbiB0aGUgZGlzY3Vzc2lvbi4gR3JleWJ1cyBzdGFuZGFyZGl6ZXMNCmEgYnVuY2gg
b2YgcHJvdG9jb2xzIGxpa2UgR1BJTywgU1BJLCBldGMuIGJ1dCBhbHNvIGhhcyBwcm92aXNpb25p
bmcgZm9yDQp2ZW5kb3IgYnVuZGxlIGFuZCBwcm90b2NvbC4gVGhlcmUgaXMgb25seSBvbmUgSUQg
cmVzZXJ2ZWQgZm9yIHZlbmRvciwNCjB4RkYsIHNvIHRoZSBxdWVzdGlvbiBpcyBkaWQgR3JleWJ1
cyBldmVyIGVudmlzaW9uIHN1cHBvcnRpbmcgc2V2ZXJhbA0KdmVuZG9yIGJ1bmRsZXMsIG9yIG9u
ZSB2ZW5kb3IgYnVuZGxlIHdpdGggc2V2ZXJhbCB2ZW5kb3IgY3BvcnRzIGluIGl0Pw0KT3IgdGhl
IGFzc3VtcHRpb24gYWx3YXlzIHdhcyB0aGF0IHRoZXJlIGNvdWxkIGJlIGF0IG1vc3Qgb25seSB2
ZW5kb3INCmNwb3J0Pw0KDQpTaWduZWQtb2ZmLWJ5OiBEYW1pZW4gUmnDqWdlbCA8ZGFtaWVuLnJp
ZWdlbEBzaWxhYnMuY29tPg0KLS0tDQogZHJpdmVycy9ncmV5YnVzL2NvcmUuYyAgICAgICAgICAg
ICB8IDQgKysrKw0KIGluY2x1ZGUvbGludXgvZ3JleWJ1cy5oICAgICAgICAgICAgfCA3ICsrKyst
LS0NCiBpbmNsdWRlL2xpbnV4L2dyZXlidXMvZ3JleWJ1c19pZC5oIHwgMiArKw0KIDMgZmlsZXMg
Y2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkNCg0KZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3JleWJ1cy9jb3JlLmMgYi9kcml2ZXJzL2dyZXlidXMvY29yZS5jDQppbmRleCAz
MTNlYjY1Y2Y3MC4uYTQ5NjhhMjRhMDggMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dyZXlidXMvY29y
ZS5jDQorKysgYi9kcml2ZXJzL2dyZXlidXMvY29yZS5jDQpAQCAtNjgsNiArNjgsMTAgQEAgc3Rh
dGljIGJvb2wgZ3JleWJ1c19tYXRjaF9vbmVfaWQoc3RydWN0IGdiX2J1bmRsZSAqYnVuZGxlLA0K
IAkgICAgKGlkLT5wcm9kdWN0ICE9IGJ1bmRsZS0+aW50Zi0+cHJvZHVjdF9pZCkpDQogCQlyZXR1
cm4gZmFsc2U7DQogDQorCWlmICgoaWQtPm1hdGNoX2ZsYWdzICYgR1JFWUJVU19JRF9NQVRDSF9C
VU5ETEVfSUQpICYmDQorCSAgICAoaWQtPmJ1bmRsZV9pZCAhPSBidW5kbGUtPmlkKSkNCisJCXJl
dHVybiBmYWxzZTsNCisNCiAJaWYgKChpZC0+bWF0Y2hfZmxhZ3MgJiBHUkVZQlVTX0lEX01BVENI
X0NMQVNTKSAmJg0KIAkgICAgKGlkLT5jbGFzcyAhPSBidW5kbGUtPmNsYXNzKSkNCiAJCXJldHVy
biBmYWxzZTsNCmRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L2dyZXlidXMuaCBiL2luY2x1ZGUv
bGludXgvZ3JleWJ1cy5oDQppbmRleCA0ZDU4ZTI3Y2VhZi4uOWMyOWExMDk5YTQgMTAwNjQ0DQot
LS0gYS9pbmNsdWRlL2xpbnV4L2dyZXlidXMuaA0KKysrIGIvaW5jbHVkZS9saW51eC9ncmV5YnVz
LmgNCkBAIC0zOCwxMiArMzgsMTMgQEANCiAjZGVmaW5lIEdSRVlCVVNfVkVSU0lPTl9NSU5PUgkw
eDAxDQogDQogI2RlZmluZSBHUkVZQlVTX0lEX01BVENIX0RFVklDRSBcDQotCShHUkVZQlVTX0lE
X01BVENIX1ZFTkRPUiB8IEdSRVlCVVNfSURfTUFUQ0hfUFJPRFVDVCkNCisJKEdSRVlCVVNfSURf
TUFUQ0hfVkVORE9SIHwgR1JFWUJVU19JRF9NQVRDSF9QUk9EVUNUIHwgR1JFWUJVU19JRF9NQVRD
SF9CVU5ETEVfSUQpDQogDQotI2RlZmluZSBHUkVZQlVTX0RFVklDRSh2LCBwKQkJCQkJXA0KKyNk
ZWZpbmUgR1JFWUJVU19ERVZJQ0UodiwgcCwgaWQpCQkJCVwNCiAJLm1hdGNoX2ZsYWdzCT0gR1JF
WUJVU19JRF9NQVRDSF9ERVZJQ0UsCQlcDQogCS52ZW5kb3IJCT0gKHYpLAkJCQkJXA0KLQkucHJv
ZHVjdAk9IChwKSwNCisJLnByb2R1Y3QJPSAocCksCQkJCQlcDQorCS5idW5kbGVfaWQJPSAoaWQp
LA0KIA0KICNkZWZpbmUgR1JFWUJVU19ERVZJQ0VfQ0xBU1MoYykJCQkJCVwNCiAJLm1hdGNoX2Zs
YWdzCT0gR1JFWUJVU19JRF9NQVRDSF9DTEFTUywJCVwNCmRpZmYgLS1naXQgYS9pbmNsdWRlL2xp
bnV4L2dyZXlidXMvZ3JleWJ1c19pZC5oIGIvaW5jbHVkZS9saW51eC9ncmV5YnVzL2dyZXlidXNf
aWQuaA0KaW5kZXggZjRjODQ0MDA5M2UuLjNlMDcyOGUxZjQ0IDEwMDY0NA0KLS0tIGEvaW5jbHVk
ZS9saW51eC9ncmV5YnVzL2dyZXlidXNfaWQuaA0KKysrIGIvaW5jbHVkZS9saW51eC9ncmV5YnVz
L2dyZXlidXNfaWQuaA0KQEAgLTE1LDYgKzE1LDcgQEAgc3RydWN0IGdyZXlidXNfYnVuZGxlX2lk
IHsNCiAJX191MzIJdmVuZG9yOw0KIAlfX3UzMglwcm9kdWN0Ow0KIAlfX3U4CWNsYXNzOw0KKwlf
X3U4CWJ1bmRsZV9pZDsNCiANCiAJa2VybmVsX3Vsb25nX3QJZHJpdmVyX2luZm8gX19hbGlnbmVk
KHNpemVvZihrZXJuZWxfdWxvbmdfdCkpOw0KIH07DQpAQCAtMjMsNSArMjQsNiBAQCBzdHJ1Y3Qg
Z3JleWJ1c19idW5kbGVfaWQgew0KICNkZWZpbmUgR1JFWUJVU19JRF9NQVRDSF9WRU5ET1IJCUJJ
VCgwKQ0KICNkZWZpbmUgR1JFWUJVU19JRF9NQVRDSF9QUk9EVUNUCUJJVCgxKQ0KICNkZWZpbmUg
R1JFWUJVU19JRF9NQVRDSF9DTEFTUwkJQklUKDIpDQorI2RlZmluZSBHUkVZQlVTX0lEX01BVENI
X0JVTkRMRV9JRAlCSVQoMykNCiANCiAjZW5kaWYgLyogX19MSU5VWF9HUkVZQlVTX0lEX0ggKi8N
Ci0tIA0KMi40OS4wDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmdyZXlidXMtZGV2IG1haWxpbmcgbGlzdCAtLSBncmV5YnVzLWRldkBsaXN0cy5saW5h
cm8ub3JnClRvIHVuc3Vic2NyaWJlIHNlbmQgYW4gZW1haWwgdG8gZ3JleWJ1cy1kZXYtbGVhdmVA
bGlzdHMubGluYXJvLm9yZwo=
