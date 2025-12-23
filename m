Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E194CDA46F
	for <lists+greybus-dev@lfdr.de>; Tue, 23 Dec 2025 19:32:31 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 3A4A84013C
	for <lists+greybus-dev@lfdr.de>; Tue, 23 Dec 2025 18:32:30 +0000 (UTC)
Received: from mx0a-0024c301.pphosted.com (mx0a-0024c301.pphosted.com [148.163.149.154])
	by lists.linaro.org (Postfix) with ESMTPS id E33E74013F
	for <greybus-dev@lists.linaro.org>; Tue, 23 Dec 2025 18:32:06 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=silabs.com header.s=pps12202023 header.b=a4fQ3DZE;
	dkim=pass header.d=silabs.com header.s=selector1 header.b="IlGNnJ/+";
	spf=pass (lists.linaro.org: domain of Damien.Riegel@silabs.com designates 148.163.149.154 as permitted sender) smtp.mailfrom=Damien.Riegel@silabs.com;
	dmarc=pass (policy=reject) header.from=silabs.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from pps.filterd (m0101743.ppops.net [127.0.0.1])
	by mx0a-0024c301.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNBlCKM2900128;
	Tue, 23 Dec 2025 12:31:56 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps12202023;
	 bh=ahkSi1G3IzSLUPIyI6FkEo3PBYf2WRzLe4770vECMHI=; b=a4fQ3DZEOwyq
	l6zFW1Qw6XiFisvtQRqP5hGyGvhKm75dsX74UxN9tJHKZ0VxMbboya4QWZxz9mzz
	4tL9WgiZJ4zOS+YUKWhe89ZPYCrZeq6KJETRsWEh79v5UhSF55ISHXe4HXBEqeEH
	QcGXe4O5nTcFBVD9lzzLdC29Z2Clc9TxtphpeSy9uD45pPx7fhf8dGepsgvPaR2/
	htPEnGcq0KAoucuv6oMMmfRDIqTD2/QqngNmEdRN0aNQnOdUcreSHYkwbyCyHlK9
	9ewr1JZjB3/r5XSLYwoqb3jYX9lsLOWDKhOpD79GoeZQ35yTSdWJkLWwlES53DRe
	+FDg86jeiA==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11020084.outbound.protection.outlook.com [52.101.46.84])
	by mx0a-0024c301.pphosted.com (PPS) with ESMTPS id 4b7n7597g2-3
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 23 Dec 2025 12:31:56 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P9fyB4CaKGQmKvtyTQv/3iXEJwl2v8QjuO2lM0VeXib6B44rKwmDGfafFbz2vCcIlwSmiFH/pNsTjkNOZSaRokGyhn58m+sXgX4eCIsfVK7xtSDJBFHzsyI5g0wabafpuk3i9HRU6oPlQ8OAknHN2XwBdspE/Dr711Rrcp8N/TgHV4ALF3ndiCmvsgSKBx/BPQpYbD0sCsWBaZ2XvBXCDwyyJuvK61kjzYoSh+qeTXt/WKz4+mjCB8Ne/muamUvxE9D+ellMyHHCu+HsS0JE3kWPdGtgfbo9Zy9V5ryYsf7VSsQk8KErbwm2Qsc4GugqZkyXDJUhbWAtUmRCaF1dDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ahkSi1G3IzSLUPIyI6FkEo3PBYf2WRzLe4770vECMHI=;
 b=r69oMJvLAilalobBaLLxk1jbtYppFG3+za6a/L3iHW9Q2PfoWafZJ3dppLz7WVDVzV+JWqIpO4tI922RoBNytGKBBAZohICgqoNK0c9cdOyh1u0ba+FtHFTHvjileN5bTV67zrzwSOLE7PxB3DrUBzob4t2PWecZMDgWAIiQqEicBQLxaXD75lrWbxSi2x/5jOPhHsCbUx9T6w5PSAhihfB1NKYZY9zfL7C17hJKL3HWBcTwOiJgufpSaJBk/PN0qwolF7c36amFMZGg5RXV5tPHwhwMpvrWy0mCfBSOWLSE0bA4Six472dEI+ok1r4qcOW+DTLY7scPulH7hGURjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silabs.com; dmarc=pass action=none header.from=silabs.com;
 dkim=pass header.d=silabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ahkSi1G3IzSLUPIyI6FkEo3PBYf2WRzLe4770vECMHI=;
 b=IlGNnJ/+ILdmBDVLWTWp24Qh6SHR8q3mqGfZ1aPD4KJfGriAf7FqNPpY3cHUCXgAFrE1JBZP5JV9/qJCVswpGCPh2Clmw13kISlloZq0DIoBA6jk090exy07tMGSJ5YuCdnKAtkzQ2ndBP8hIfcvFv2oC/y/rwMHcBCT+UlA33k=
Received: from DS0PR11MB8205.namprd11.prod.outlook.com (2603:10b6:8:162::17)
 by SN7PR11MB6924.namprd11.prod.outlook.com (2603:10b6:806:2ab::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.11; Tue, 23 Dec
 2025 18:31:54 +0000
Received: from DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::2de6:bc88:2af7:3583]) by DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::2de6:bc88:2af7:3583%3]) with mapi id 15.20.9434.009; Tue, 23 Dec 2025
 18:31:54 +0000
From: =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
To: greybus-dev@lists.linaro.org
Date: Tue, 23 Dec 2025 13:31:36 -0500
Message-ID: <20251223183142.31897-3-damien.riegel@silabs.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251223183142.31897-1-damien.riegel@silabs.com>
References: <20251223183142.31897-1-damien.riegel@silabs.com>
X-ClientProxiedBy: YQZPR01CA0008.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:85::23) To DS0PR11MB8205.namprd11.prod.outlook.com
 (2603:10b6:8:162::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8205:EE_|SN7PR11MB6924:EE_
X-MS-Office365-Filtering-Correlation-Id: b8785dd7-58f5-457b-51ab-08de42518c1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|10070799003|376014|52116014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?dTl2T2N4Vk5sdkRlWFpVR1FFTkdnRDVzVjRjSUtjSVFaTjREaGxTRU9tdEZm?=
 =?utf-8?B?QzhGZ1dBS2lxT2FrNThLR0U5citEYVB6ZlQxb1d6aVEwU25WdDBIQzlmelpL?=
 =?utf-8?B?VStEL3MrQVBuVlQxWVFLTlAzZm53Y0toOTRRWDA1TmpNZU1oQzNyUmFidFgr?=
 =?utf-8?B?eFBBQmlLcmF1bUhkUlpWczdDZ0tSZm4zc0FOaVQyZ1hGZ3F5WUxMT3NEL2V4?=
 =?utf-8?B?STZ3bXluRGEyVnFYSE1teVJNdlhMei9hSlJUL1ZMazgyWDk3cnlqSzZIVkMw?=
 =?utf-8?B?bVIxL0JxUGFMT09LM0Uva0hqd29wM3VJc01MNVczZW1NRG9LL3VOb0tCMnJ4?=
 =?utf-8?B?RTVTbkljNENzb0o1elBqT0lnZENHYjRZV3FvcGU0YXB0VncrWmhocExhakwz?=
 =?utf-8?B?L0psUmtMdG5DdkdtUWt2dlpSdlhFMkxFVG9MV1NlTFhVZEpmZDl4UjFSYlJm?=
 =?utf-8?B?Q1FJRzkwcmExYThPZEZRRndvbVlteGxqck1aZ3QzNVFsSnk0djJOb2JiYW1Y?=
 =?utf-8?B?YktNQXdqOGhPQ2JZRW5RSDFESE9nZE5PWkVDV2FPUXhXSXk2NDFCS1RBdnFR?=
 =?utf-8?B?TkZUVzZrOXYra2RNYVFTMldQT0NKWkVDWnNER2ZBa04xMlZrRnlrMG82azVU?=
 =?utf-8?B?U25GMFplSGZPQTJvNFJidTRuRjNpYkJhL3lRamk4WWNoUDRSamdpZnZaOVpW?=
 =?utf-8?B?L2RxS3FHL1pvK3Yyb2RTdVM5alNaemNRVkgwMG9ReUpwdmlmVGpQMmpySStr?=
 =?utf-8?B?SzBRWHE1NEs5WXkyRGtUNURWRnhHZ3o5TzZnRkd3a29GZnpJZm1ZdXc5Z2F1?=
 =?utf-8?B?bEwxczNpcFNEcFJYVElBdHczaDhlU2VGS1lYS2ZCMm0wTlIrdFVxTytvd21H?=
 =?utf-8?B?b3VEVUNYYUg4bXRIUU01MHJtRER3NXFXZHpHTU1FaFhNSk1EOHJNK2psdUxh?=
 =?utf-8?B?TEpSMUFPYmtUcWl1Ykc3dEExUXo4RTJscXdRRG1YT2d4VEg5VFVIZzczYjh2?=
 =?utf-8?B?QWl4RU5VaU0rNzVTMFZvbGxJL3Q0dk5Pc01iRnFjMVBlWVFWRW5ubHptaFFJ?=
 =?utf-8?B?N0RhVFFMcllBU3BVN293bVVpNmdnOTFiS21heUQwSU11Nk5VOWtkYjcvcGE0?=
 =?utf-8?B?M0s2bS9MajBnd1dBWjNHQ0NpbkVBZDZYbXZFcVQyRndDazRQS2JXd2U0L0ph?=
 =?utf-8?B?ckk4eGhKK2JvZlRvaVgyUlhQRjhNK09LcWlpM3A3Ly9IcjJsbUE4SEFjYVph?=
 =?utf-8?B?WDBQZzcram1UY0U0RnY1UDRJOEdiR2xkQWYvQlRpZm1yOWFsU095eW1UU3Bq?=
 =?utf-8?B?N0h0WVYwdEt3WHF0RUQ0MzhjNFJzSHNCSWtNWmZ4WWpIbXdkOGJsaGxkc21l?=
 =?utf-8?B?bk1hZXVwcHlvKzNadkpqVEdISUhzakh2WGZuL09mZnlYYnBualRnUHNFUkxB?=
 =?utf-8?B?dmhLWEpmbTBWRC90ZnYzYTRGVTBRb3JjWE9vK2MrcHBORUZ4Z29Bdnhsd05K?=
 =?utf-8?B?YkVieWNsNHZkQnhVZkVHM1R2OUErdDVFSFJoNVpvd1ZTRGYzTm40QjE2SS9z?=
 =?utf-8?B?ZTNndjM3cXFMcXZGdkJFaDFjeGN0TjJzRVRrTjBxUERBeFd1SWlzdmxJNkpM?=
 =?utf-8?B?UUlHUGxwYi9ybFFwOW02KzVRdk5Pbklzd2I3cjY1dGpaUitwRFpQVFFpc3Fa?=
 =?utf-8?B?YXJQd2RneDdVNW5pZEd3ZkkwZkUwalVPSDlRWHlSejhBdlN6R3lJcXdHWDhD?=
 =?utf-8?B?TWViNHZYeUVKYk5zNnl4V0pLakRFaU85bmNKQ1c3MDV3S2s2N3dBNEozblQ4?=
 =?utf-8?B?Y2ErMUFGaWZla3hCNlovcVhwU2ZSZGtmRFcyTHE3NWR6OElSMS8zbWsxTDlh?=
 =?utf-8?B?VDN0Q0JCRXV4cGhoem83KzJ4VUhRZUkrS3Q0K2Z2S1IvM1VMR3pidGQ1amp0?=
 =?utf-8?Q?NtyOf4e+ITzYiQhd8vU1yjo19rdejWn5?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8205.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(52116014)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?d0VoWlhnMVhyMkFNa2kzY3NrT2xaREJYdmc0OGRjM1U0b2VRT3o0K2lKVU1t?=
 =?utf-8?B?ZU9zT3NmTWxyaVUzKzVQUHVaUWExcTFtWFVBY2l1QlhCam05QzM5QUhOeGUz?=
 =?utf-8?B?M1dmWXp4UWczWGxvV20vN0laVHQ0Qk9YMUlYL1pwbXNyUm81ZzZkVmlkTTJR?=
 =?utf-8?B?by9JU01PMnhNeU5uZURBZlF2TjZJRGdONjVhcjNwYzJMQSs5c3ZIZlpmNVhN?=
 =?utf-8?B?YUhTSkhGanVZTm5rNEdmTkRmTkNaaW1BTUZ3YkxRUjhCWFZ2SmNqQWdRZ05p?=
 =?utf-8?B?RDh3OFFDMDd1d0RmTzA2Nkpyb3BzOVFOVUZoSGtPYXBySDdaaCtuaVFKZ2Rl?=
 =?utf-8?B?TU5ScUZ1U1lUU2xYM3NaZzFUTGJsd3JmNmVVWjgvNVVwS1hyWU56dVVaaEpG?=
 =?utf-8?B?VjU3Q2dlM0ROa1Q3M2hTK09mQ1M2MzhaVzBQaDltY2E3c3AzaVU4czZnNG1S?=
 =?utf-8?B?OUxlTlNUQnZyaTR0KzJQMHZMWm00czBLVXFidm44SCt2bTdzRmExajNQQkVB?=
 =?utf-8?B?VXRHNzRwTXVHNjJhNDJTbE5YUVBwRTgyckVsNXdiTm0veHQyNVJDVy9UOWpY?=
 =?utf-8?B?OG4zamE4WWFnbmZRbDkvdjlqbDBhTExiZ1BlYi9qcUZpUklRLzBmVTVyMWRn?=
 =?utf-8?B?RXZkNUVuY0drQlc5YWtXR3RjVkI4aUlJL3QvTmxYRk9wNjErbC9CM1kzNkQx?=
 =?utf-8?B?bTFRN0RmbjBLakJqM292ZmhMcXNSZzNTTHVReUo4d0tFTmFMVnpxZmlQMDVU?=
 =?utf-8?B?MVBxbk02cmg3RWtWV2V2dHo4WVhxZEZMTFZzMlEva29wdk56b2xsQUx1RUQ4?=
 =?utf-8?B?aWM5bU9YTm5HenhCQ2ErMHVvc0xYMzR4WnFtQVVKWUx0L0lBQTlESU5wS1RB?=
 =?utf-8?B?U1dFeHNZNkdZcTREL3huUUtnVjRkamJmNVZzNlArUHI3WmpwUGZqd0Nzc2JP?=
 =?utf-8?B?dllTc09Jd0tzWVBnL2VSeUFGTkxab2FWTVUvWC95N2hsYWxWaGNJUnF6WHJV?=
 =?utf-8?B?cC9ITlJPTGJvZ1VmQVdSVXJmOWo5U2RSZlExUkxRazROM0g1UjB2dlhiL3cx?=
 =?utf-8?B?NFA4NU5SNXBucStpbTFwZVZYSDB5YnRkNEVRSHpqYXNqN1dieVBKRlB1aXJp?=
 =?utf-8?B?NUJ1RVJRWTVqeXJBeC9ZRm04RzNiMWVTTUJkdUpuR2I4TG9CcnJBNDY1ckJQ?=
 =?utf-8?B?SUw0SGVWR21ERTYxalNLR2M1QklzeFhiLzBHdmRQVUtTSmp6ekN1QmJIemNS?=
 =?utf-8?B?OUxJSkx4YUxYUGpXKzQrZUZFQUdPaWZvNFNFZXZ5ZnppUlc4eG54eGt3RExC?=
 =?utf-8?B?UkllenZyOTNSTWlXVlVWelVmdkpCL29TL2l4eC8xQmordXBCdWlzU1dIVFM1?=
 =?utf-8?B?WHJ0RElJSGJXeTZiUm9EVGlydWJtZWpoa29ucTZDd2RMM2ZnS3MwTm9UWDY0?=
 =?utf-8?B?SXFqV2ZISGpQM2tHWkpoMmIzSU5Ock9CbVFZTVk4VWZvTCtXUmIyeVR3NWo4?=
 =?utf-8?B?SThUVkxaT01iZk1pTWV6YVNYalphQUNDb3I0Tk1VZXZHZFdiejhKNmRnZDJm?=
 =?utf-8?B?TDRNVW5GUW5kWGpIbWF6c0pBRDErbDd3dEgvWFhybFUzckc4YWdjVkRCQjhR?=
 =?utf-8?B?MmZua3ZnRXdoUUgxL2R5Q1pjOHd1UWNCMUdhR0JjOC9tWFN3dWloSFdnMk40?=
 =?utf-8?B?T0Y3U0dKekZaZ1FLaDdXZ1VFNVdBbGdMVWRSS2JLWFd6QW1qL280Q2w3NFFE?=
 =?utf-8?B?a2lQbjcrMmNXckNUM3k0M0VpQ01BT1dob1NTVnZaQ2ZEQm1GR0szOWprZXk5?=
 =?utf-8?B?dTVMMHh0bUlqUUk0VzlTUmZTaVlHV245cWR6NDRPNitQcndwLzRaR0EyQXNM?=
 =?utf-8?B?NU9vdHFqcUZ4WVI0UzdLWWtVYlFDT01nS2NEMnEySUZYY3RzVzdhNDc5bzI3?=
 =?utf-8?B?MDErVzNGZUFSV2VadnpvUklUR2xWSm5jREtubGgzZjIreWdCNnBGWHdkbTkr?=
 =?utf-8?B?d0hROGNiVFhzV2xGV3lCdlY3KzFOMERCV0VlOVF1eDJzR2ZWMTNhSVl4R2Rr?=
 =?utf-8?B?UE13OVRDeXZXdHk1SUExSk5QNHU4R2tycldnZjlJdkl2RjVVVElTVkM5Ryta?=
 =?utf-8?B?SzFFMVpkTENsTjhWZWNVOVBHY0FuR3F4NWtpSkhmdUl5SExKRFArUHRsSnZZ?=
 =?utf-8?B?U2cwQnVHdGdWTTJkN2hoUTNsQ2duanpuYkZyem1mZFc4cWlYT2hJeE1EU0xp?=
 =?utf-8?B?SGF4ZHpvVyt3bzZ2anB0VmdRRVhab0FPODBGbWE1dlltcFViZkVsUjhJMUdv?=
 =?utf-8?B?cndZMStYMWVsdnI5V0MyYzI1WUJXcFRYK2RRYis0clVqT2VRdTJuS01jcllH?=
 =?utf-8?Q?9GVhOe435JcjojZWJBunpeGfEvjSUi1zGTFYElKfEFupX?=
X-MS-Exchange-AntiSpam-MessageData-1: Q2N4raAqfoLVMw==
X-OriginatorOrg: silabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8785dd7-58f5-457b-51ab-08de42518c1d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8205.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2025 18:31:54.5442
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 54dbd822-5231-4b20-944d-6f4abcd541fb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KjdUN1toCbGV0HI5vnkBdplDQ59xVvK0XbfmHogR00DLQe8iIdhb7uZuQOt8vtuLeCsLmK7EvfVMsAzUw+8rMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6924
X-Authority-Analysis: v=2.4 cv=SsmdKfO0 c=1 sm=1 tr=0 ts=694ae01c cx=c_pps
 a=5Kc8oJJEAov4kh6pc/+VPg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=M51BFTxLslgA:10
 a=i1IsUcr2s-wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=2AEO0YjSAAAA:8
 a=5kEGWTPCpmEATIAMNQoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: Fa_lDmqo0MZVcd_yNuBF0E8A8M56ZILK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDE1NCBTYWx0ZWRfX4EIPDzei7fek
 buVTs6X7ykjHnZMgd+FOHVtP/on+oOJHdECGcZTDgx9tbBzztpKH6Zt5itrIK2IL5mrCT4xMf/s
 U6YDZWczTrS/wc0Nt9O9J00OAJeWlsW387hDXuhSasUM8JjrsLGTyWjxbgpbBemL5oTC44h41Mw
 vRJKTnO7gp+fr8iojzeud5vnPvk1lnhA5NgjAQWrA8tFEmiaaFxy1nZEMUt3CKXlIkZLjvSKekv
 /xKl9mKcPHj8E33uIP8esd8tIBRCTeD591bIrq5WtAzQbkCFrwjuuddAvox6af1etDvDT2B7EEv
 6G6lsZ0sCoIxNhNnY2lCVnsskuQ0wM8hLXI/3NYP7omgFxuV36Wrwpu9vWLP4M194FzGY7Ac9Yb
 Wx9iQYfhxBZ6JCx9O0bEuS9CQ6Cixln1B4tBgJ656sBOy9Qad8M+yErygT1k24Oygw7UsdZjwbU
 jNhy1CaOp4tYgi3j33w==
X-Proofpoint-GUID: Fa_lDmqo0MZVcd_yNuBF0E8A8M56ZILK
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
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[silabs.com,reject];
	R_DKIM_ALLOW(-0.20)[silabs.com:s=pps12202023,silabs.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:148.163.149.154];
	MIME_GOOD(-0.10)[text/plain];
	ASN(0.00)[asn:26211, ipnet:148.163.148.0/22, country:US];
	RCPT_COUNT_SEVEN(0.00)[7];
	MIME_TRACE(0.00)[0:+];
	BLOCKLISTDE_FAIL(0.00)[148.163.149.154:server fail,2603:10b6:8:162::17:server fail];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_THREE(0.00)[4];
	URIBL_BLOCKED(0.00)[silabs.com:mid,silabs.com:email,silabs.com:dkim,silabs.com:from_smtp,silabs.com:from_mime];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DNSWL_BLOCKED(0.00)[2603:10b6:8:162::17:received,52.101.46.84:received,148.163.149.154:from];
	DKIM_TRACE(0.00)[silabs.com:+]
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: E33E74013F
X-Spamd-Bar: ----
Message-ID-Hash: AKC6S5WD43BP3KRNRSPV64CENEENLBS3
X-Message-ID-Hash: AKC6S5WD43BP3KRNRSPV64CENEENLBS3
X-MailFrom: Damien.Riegel@silabs.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, linux-devel@silabs.com, =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH 2/8] greybus: let gb_interface_create take additional p2p argument
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/AKC6S5WD43BP3KRNRSPV64CENEENLBS3/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

VXBkYXRlIHRoZSBmdW5jdGlvbiB0aGF0IGNyZWF0ZXMgYW4gaW50ZXJmYWNlIHRvIHRha2UgYW4g
YWRkaXRpb25hbA0KYm9vbGVhbiBhcmd1bWVudCB0byBpbmRpY2F0ZSBpZiB0aGUgaW50ZXJmYWNl
IGlzIHBvaW50IHRvIHBvaW50IG9yIG5vdC4NCg0KSWYgdGhpcyBhcmd1bWVudCBpcyB0cnVlLCBp
bnRlcmZhY2UncyB0eXBlIGFuZCBJRCBhcmUgaW1tZWRpYXRlbHkgc2V0LA0KYW5kIGEgZGlmZmVy
ZW50IGdyb3VwIG9mIGF0dHJpYnV0ZXMgaXMgc2V0IG9uIHRoZSBpbnRlcmZhY2UgZGV2aWNlLCBh
cw0KdGhlcmUgaXMgbm8gd2F5IHRvIGZldGNoIGdyZXlidXMgYXR0cmlidXRlcyAodmVuZG9yIElE
LCBwcm9kdWN0IElELA0Kc2VyaWFsIG51bWJlcikgb3IgVW5pcHJvIGF0dHJpYnV0ZXMgKGRkYmwx
IG1hbnVmYWN0dXJlciBhbmQgcHJvZHVjdCBJRCkNCndoZW4gU1ZDIGlzIGFic2VudCwgYW5kIHNv
IGl0IGRvZXNuJ3QgbWFrZSBzZW5zZSB0byBleHBvc2UgdGhlbS4NCg0KU2lnbmVkLW9mZi1ieTog
RGFtaWVuIFJpw6lnZWwgPGRhbWllbi5yaWVnZWxAc2lsYWJzLmNvbT4NCi0tLQ0KIGRyaXZlcnMv
Z3JleWJ1cy9pbnRlcmZhY2UuYyAgICAgICB8IDIwICsrKysrKysrKysrKysrKystLS0tDQogZHJp
dmVycy9ncmV5YnVzL21vZHVsZS5jICAgICAgICAgIHwgIDIgKy0NCiBpbmNsdWRlL2xpbnV4L2dy
ZXlidXMvaW50ZXJmYWNlLmggfCAgMyArKy0NCiAzIGZpbGVzIGNoYW5nZWQsIDE5IGluc2VydGlv
bnMoKyksIDYgZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dyZXlidXMvaW50
ZXJmYWNlLmMgYi9kcml2ZXJzL2dyZXlidXMvaW50ZXJmYWNlLmMNCmluZGV4IGU5NmI1OGIyMTFi
Li5hYTJiZDg0MTk3NyAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3JleWJ1cy9pbnRlcmZhY2UuYw0K
KysrIGIvZHJpdmVycy9ncmV5YnVzL2ludGVyZmFjZS5jDQpAQCAtNjg3LDYgKzY4NywxMiBAQCBz
dGF0aWMgY29uc3Qgc3RydWN0IGF0dHJpYnV0ZV9ncm91cCAqaW50ZXJmYWNlX2dyb3Vwc1tdID0g
ew0KIAlOVUxMDQogfTsNCiANCitzdGF0aWMgY29uc3Qgc3RydWN0IGF0dHJpYnV0ZV9ncm91cCAq
aW50ZXJmYWNlX2dyb3Vwc19wMnBbXSA9IHsNCisJJmludGVyZmFjZV9ncmV5YnVzX2dyb3VwLA0K
KwkmaW50ZXJmYWNlX2NvbW1vbl9ncm91cCwNCisJTlVMTA0KK307DQorDQogc3RhdGljIHZvaWQg
Z2JfaW50ZXJmYWNlX3JlbGVhc2Uoc3RydWN0IGRldmljZSAqZGV2KQ0KIHsNCiAJc3RydWN0IGdi
X2ludGVyZmFjZSAqaW50ZiA9IHRvX2diX2ludGVyZmFjZShkZXYpOw0KQEAgLTc5MCw3ICs3OTYs
OCBAQCBjb25zdCBzdHJ1Y3QgZGV2aWNlX3R5cGUgZ3JleWJ1c19pbnRlcmZhY2VfdHlwZSA9IHsN
CiAgKiBmYWlsdXJlIG9jY3VycyBkdWUgdG8gbWVtb3J5IGV4aGF1c3Rpb24uDQogICovDQogc3Ry
dWN0IGdiX2ludGVyZmFjZSAqZ2JfaW50ZXJmYWNlX2NyZWF0ZShzdHJ1Y3QgZ2JfbW9kdWxlICpt
b2R1bGUsDQotCQkJCQkgdTggaW50ZXJmYWNlX2lkKQ0KKwkJCQkJIHU4IGludGVyZmFjZV9pZCwN
CisJCQkJCSBib29sIHAycCkNCiB7DQogCXN0cnVjdCBnYl9ob3N0X2RldmljZSAqaGQgPSBtb2R1
bGUtPmhkOw0KIAlzdHJ1Y3QgZ2JfaW50ZXJmYWNlICppbnRmOw0KQEAgLTgwOCwxMyArODE1LDE4
IEBAIHN0cnVjdCBnYl9pbnRlcmZhY2UgKmdiX2ludGVyZmFjZV9jcmVhdGUoc3RydWN0IGdiX21v
ZHVsZSAqbW9kdWxlLA0KIAlJTklUX1dPUksoJmludGYtPm1vZGVfc3dpdGNoX3dvcmssIGdiX2lu
dGVyZmFjZV9tb2RlX3N3aXRjaF93b3JrKTsNCiAJaW5pdF9jb21wbGV0aW9uKCZpbnRmLT5tb2Rl
X3N3aXRjaF9jb21wbGV0aW9uKTsNCiANCi0JLyogSW52YWxpZCBkZXZpY2UgaWQgdG8gc3RhcnQg
d2l0aCAqLw0KLQlpbnRmLT5kZXZpY2VfaWQgPSBHQl9JTlRFUkZBQ0VfREVWSUNFX0lEX0JBRDsN
CisJaWYgKHAycCkgew0KKwkJaW50Zi0+ZGV2aWNlX2lkID0gR0JfU1ZDX0RFVklDRV9JRF9NSU47
DQorCQlpbnRmLT50eXBlID0gR0JfSU5URVJGQUNFX1RZUEVfUDJQOw0KKwl9IGVsc2Ugew0KKwkJ
LyogSW52YWxpZCBkZXZpY2UgaWQgdG8gc3RhcnQgd2l0aCAqLw0KKwkJaW50Zi0+ZGV2aWNlX2lk
ID0gR0JfSU5URVJGQUNFX0RFVklDRV9JRF9CQUQ7DQorCX0NCiANCiAJaW50Zi0+ZGV2LnBhcmVu
dCA9ICZtb2R1bGUtPmRldjsNCiAJaW50Zi0+ZGV2LmJ1cyA9ICZncmV5YnVzX2J1c190eXBlOw0K
IAlpbnRmLT5kZXYudHlwZSA9ICZncmV5YnVzX2ludGVyZmFjZV90eXBlOw0KLQlpbnRmLT5kZXYu
Z3JvdXBzID0gaW50ZXJmYWNlX2dyb3VwczsNCisJaW50Zi0+ZGV2Lmdyb3VwcyA9IHAycCA/IGlu
dGVyZmFjZV9ncm91cHNfcDJwIDogaW50ZXJmYWNlX2dyb3VwczsNCiAJaW50Zi0+ZGV2LmRtYV9t
YXNrID0gbW9kdWxlLT5kZXYuZG1hX21hc2s7DQogCWRldmljZV9pbml0aWFsaXplKCZpbnRmLT5k
ZXYpOw0KIAlkZXZfc2V0X25hbWUoJmludGYtPmRldiwgIiVzLiV1IiwgZGV2X25hbWUoJm1vZHVs
ZS0+ZGV2KSwNCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dyZXlidXMvbW9kdWxlLmMgYi9kcml2ZXJz
L2dyZXlidXMvbW9kdWxlLmMNCmluZGV4IDdmNzE1M2ExZGQ2Li40ZWQ2ODU1MGQzMiAxMDA2NDQN
Ci0tLSBhL2RyaXZlcnMvZ3JleWJ1cy9tb2R1bGUuYw0KKysrIGIvZHJpdmVycy9ncmV5YnVzL21v
ZHVsZS5jDQpAQCAtMTEzLDcgKzExMyw3IEBAIHN0cnVjdCBnYl9tb2R1bGUgKmdiX21vZHVsZV9j
cmVhdGUoc3RydWN0IGdiX2hvc3RfZGV2aWNlICpoZCwgdTggbW9kdWxlX2lkLA0KIAl0cmFjZV9n
Yl9tb2R1bGVfY3JlYXRlKG1vZHVsZSk7DQogDQogCWZvciAoaSA9IDA7IGkgPCBudW1faW50ZXJm
YWNlczsgKytpKSB7DQotCQlpbnRmID0gZ2JfaW50ZXJmYWNlX2NyZWF0ZShtb2R1bGUsIG1vZHVs
ZV9pZCArIGkpOw0KKwkJaW50ZiA9IGdiX2ludGVyZmFjZV9jcmVhdGUobW9kdWxlLCBtb2R1bGVf
aWQgKyBpLCBmYWxzZSk7DQogCQlpZiAoIWludGYpIHsNCiAJCQlkZXZfZXJyKCZtb2R1bGUtPmRl
diwgImZhaWxlZCB0byBjcmVhdGUgaW50ZXJmYWNlICV1XG4iLA0KIAkJCQltb2R1bGVfaWQgKyBp
KTsNCmRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L2dyZXlidXMvaW50ZXJmYWNlLmggYi9pbmNs
dWRlL2xpbnV4L2dyZXlidXMvaW50ZXJmYWNlLmgNCmluZGV4IGZlZDYzNTZlYjEzLi5kZWU0Mjg1
OWViZSAxMDA2NDQNCi0tLSBhL2luY2x1ZGUvbGludXgvZ3JleWJ1cy9pbnRlcmZhY2UuaA0KKysr
IGIvaW5jbHVkZS9saW51eC9ncmV5YnVzL2ludGVyZmFjZS5oDQpAQCAtNzAsNyArNzAsOCBAQCBz
dHJ1Y3QgZ2JfaW50ZXJmYWNlIHsNCiAjZGVmaW5lIHRvX2diX2ludGVyZmFjZShkKSBjb250YWlu
ZXJfb2YoZCwgc3RydWN0IGdiX2ludGVyZmFjZSwgZGV2KQ0KIA0KIHN0cnVjdCBnYl9pbnRlcmZh
Y2UgKmdiX2ludGVyZmFjZV9jcmVhdGUoc3RydWN0IGdiX21vZHVsZSAqbW9kdWxlLA0KLQkJCQkJ
IHU4IGludGVyZmFjZV9pZCk7DQorCQkJCQkgdTggaW50ZXJmYWNlX2lkLA0KKwkJCQkJIGJvb2wg
cDJwKTsNCiBpbnQgZ2JfaW50ZXJmYWNlX2FjdGl2YXRlKHN0cnVjdCBnYl9pbnRlcmZhY2UgKmlu
dGYpOw0KIHZvaWQgZ2JfaW50ZXJmYWNlX2RlYWN0aXZhdGUoc3RydWN0IGdiX2ludGVyZmFjZSAq
aW50Zik7DQogaW50IGdiX2ludGVyZmFjZV9lbmFibGUoc3RydWN0IGdiX2ludGVyZmFjZSAqaW50
Zik7DQotLSANCjIuNDkuMA0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpncmV5YnVzLWRldiBtYWlsaW5nIGxpc3QgLS0gZ3JleWJ1cy1kZXZAbGlzdHMu
bGluYXJvLm9yZwpUbyB1bnN1YnNjcmliZSBzZW5kIGFuIGVtYWlsIHRvIGdyZXlidXMtZGV2LWxl
YXZlQGxpc3RzLmxpbmFyby5vcmcK
