Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SH5xE1PnjWkm8gAAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Thu, 12 Feb 2026 15:44:35 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id B907A12E690
	for <lists+greybus-dev@lfdr.de>; Thu, 12 Feb 2026 15:44:34 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id C1326401E8
	for <lists+greybus-dev@lfdr.de>; Thu, 12 Feb 2026 14:44:33 +0000 (UTC)
Received: from mx0b-0024c301.pphosted.com (mx0b-0024c301.pphosted.com [148.163.153.153])
	by lists.linaro.org (Postfix) with ESMTPS id 70A3F401D9
	for <greybus-dev@lists.linaro.org>; Thu, 12 Feb 2026 14:44:20 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=silabs.com header.s=pps12202023 header.b=qf1RdvWP;
	dkim=pass header.d=silabs.com header.s=selector1 header.b=aY+MYgRd;
	spf=pass (lists.linaro.org: domain of "prvs=050394110d=damien.riegel@silabs.com" designates 148.163.153.153 as permitted sender) smtp.mailfrom="prvs=050394110d=damien.riegel@silabs.com";
	arc=pass ("microsoft.com:s=arcselector10001:i=1");
	dmarc=pass (policy=reject) header.from=silabs.com
Received: from pps.filterd (m0101742.ppops.net [127.0.0.1])
	by mx0a-0024c301.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61BMnYg2335638;
	Thu, 12 Feb 2026 08:44:10 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps12202023;
	 bh=L7+uT8wzOBTyTAxDy6uZQafjiGnecSFVP9VgFtsAYvw=; b=qf1RdvWP1yol
	3ceA1QlmMwIE7KNiUxIV7iaquQW7PffAWciDyBftEP3Rx8GHjAU3iJMXjtJhzMyC
	LVqn+BFgCQ0FXQK0ylXYGkOZftezqmvCs8QX9mqdnXbQxB8rQuvDiPmo3fap/eZg
	Yz3eRwQbjYMZ/dbBIoUYE6/Y6ML8AQRgh6o5vQw8YQ6bCLiF9H8Xd1mLLuMKAiMd
	MntOXRg2LBWd9rZmQ7DCrBPCkOtBGKuABECRnFknTlRrwScC6iuogTiS5tovGEun
	RBazDVAkCsPswIUO8sG2M+BX7yvrPd8RPmA7bH59yNfSob9iI5d1udUWPyd/Jh0v
	mxbk2tItHQ==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11020136.outbound.protection.outlook.com [52.101.201.136])
	by mx0a-0024c301.pphosted.com (PPS) with ESMTPS id 4c92w8sk2e-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 12 Feb 2026 08:44:09 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LDnts7vjS03XgluIPfmzAVmMXa0HLLx9Qr55IPf9Fi909eqWCKCUB0Wo0VOvPZlCQ9ZN7JeTfprcV9EhTiOOu64Ki7hJd27wnk6SU7Ghj4gHZVqcLutXCSevUiHlu/ZhM05xGOlL9oRnX44BDBJqyZFO6gCF1qUeCgAPa9eiZL6KSt8xOGhbAEbdI1xUSwRPmRcHOEp/wAVNmcgxSAAaOxWM460haYNd9dB9sbNNbGTP1FEVwj3Ki0lS9ogNBa2DEKX86H59LSCvppJACnekBO/wDepm7Ota8aALzEymupaGPc0dSTFlITm4qZ9+USFqlu1zgO49W+qt53B5jw9gRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L7+uT8wzOBTyTAxDy6uZQafjiGnecSFVP9VgFtsAYvw=;
 b=szxMQfD5pqfk3gx22Od5IihH/benFO2mxZuT5rVDzvcHqbHXoUsBuCkkt9BhgwPBGYJwlRaxtPEjFMK07nGQoSj3H0TD8zo0XYD+Nvkueepe10ADcM6cZxzKt2ajb8r8ysuPf6oY/t4dC1WOnr73w6PFVkege/sMpXAhnDit90kEycYvXb/r3e2oM49ELCszQ8Ks82Z8YpDRVWe4sbc/nWxlbHEk/l///qwYXAfzLQHM+V5EmmF/uq/73CdzGnAmi48EZb2eggwfUO0lwIZ3T4xeSNdd/ZKRCuBKvm8gaRaEWsEV1RqmV4XDSpBZgKxRnQZgVCS0J15OclQY2KU7hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silabs.com; dmarc=pass action=none header.from=silabs.com;
 dkim=pass header.d=silabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L7+uT8wzOBTyTAxDy6uZQafjiGnecSFVP9VgFtsAYvw=;
 b=aY+MYgRd+HQdWuvb30PB5EnUH8cnODxHb4vinS8bLH4dsijhPSyT7jqO/zNAbT1suCZ/ZJadgLuyeWnGfzd4XmOrUdTv5x5TfkCkG1lUlQF2MYbA0HskwGW1Jo2U0aU5l7WSaiDRjmDK0gyirUvEpNB700r2WZsky7HGrBvjAzE=
Received: from DS0PR11MB8205.namprd11.prod.outlook.com (2603:10b6:8:162::17)
 by CY8PR11MB7082.namprd11.prod.outlook.com (2603:10b6:930:52::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.13; Thu, 12 Feb
 2026 14:44:05 +0000
Received: from DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::2de6:bc88:2af7:3583]) by DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::2de6:bc88:2af7:3583%3]) with mapi id 15.20.9611.008; Thu, 12 Feb 2026
 14:44:05 +0000
From: =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
To: greybus-dev@lists.linaro.org, Johan Hovold <johan@kernel.org>,
        Alex Elder <elder@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org
Date: Thu, 12 Feb 2026 09:43:39 -0500
Message-ID: <20260212144352.93043-2-damien.riegel@silabs.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260212144352.93043-1-damien.riegel@silabs.com>
References: <20260212144352.93043-1-damien.riegel@silabs.com>
X-ClientProxiedBy: YQBPR0101CA0124.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:5::27) To DS0PR11MB8205.namprd11.prod.outlook.com
 (2603:10b6:8:162::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8205:EE_|CY8PR11MB7082:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f918272-f5cb-4192-f1b9-08de6a452bbf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Qk96MG10OUErejQwVXkvSFc0dE52YTQyaU0wOG53NHVRVkc5RmVHNFhYUmVY?=
 =?utf-8?B?czYxOVZmNTBxRTJxNHh2NW52a2s2UkNTYksvMHdLUEZjaU1DWkx0UGZPZkkx?=
 =?utf-8?B?ZnJvdWhIV2dMbktxclZpSWRhaWN2dnU3TmdCY2lSVi83Z0cwT09wcEkyM25k?=
 =?utf-8?B?c29XaGplRUFyUVB6QzRjK2tROXFaVUN6YU5pTkFkdkc1RUFRMENxMmgrTmNE?=
 =?utf-8?B?MHZJeXQvYkcyWWZVVHZrUTVYL0d4ZW5WZVk5VVJsWGMwMlVVZ04yZzlGM2Jy?=
 =?utf-8?B?VE5nL3dNMnZJb2IvNnlZNjdXMElTZjNQeFdrU202WFVOalVWUGhPczVFUEVM?=
 =?utf-8?B?N3lHWUZZVjVnWlNOOWpONjEwT3FYWldBemx4T0N1cXExOStrNCtjeVdMSEhZ?=
 =?utf-8?B?RlN6N0lyN0NRN0pUb0VHZGxvOUdwckVzUEE4aEl1dWF4dXovOTRjeGErdmht?=
 =?utf-8?B?Wks4YnZqRUpCVS9BdHN5MXk1bHh5SWphZnluNk9iRVQ1TmJ4eTdqWWdDL3VR?=
 =?utf-8?B?cVRNdHYxMGdtVUp2bVlOMjV0TGNVN2dQK2pQalY1RjVqRHFMbGNDQlQ3ZkFT?=
 =?utf-8?B?YXZYT1RQRkU2amZSemk1TFhEckpZYTNTRzZhdEhHdzhMY3VVRis2V1RmeVFI?=
 =?utf-8?B?Qi9OUUM2MzFKUGlmLzFxbnVUeThuVlNrd0NadUl6Z00xOStqQldlV0tHSWt3?=
 =?utf-8?B?L1ZaMTMzblJ5eUc2aGd2OHBaR3QyVFpnWkl0anN1SDBFa1ZzMzNsWTVjNk5V?=
 =?utf-8?B?b1FCS2FQVm1ZMEdaUWFmZXdXMFhKM2ZxdzcxRDJPbXFiTkdjOFZrWlJhbFhM?=
 =?utf-8?B?UkRYWFZBaVdCRXBXcVhQczk3WDFXemhnMFlDd3J6dDBJbzlOQnNpZDRGK1JH?=
 =?utf-8?B?VnBLeGMzaWlMZ3l3TUtHUzh4bit6bnQ4UHZHSTNyR0NpTmpoblVuQjllS0lu?=
 =?utf-8?B?b0kxNTErQ0x4S0R2akJCc0xnYys1QTMrb05BQnNhS0dhazZCcklCSlBBMVdD?=
 =?utf-8?B?QkhjNThNRHJiN0JmVmg0aHJyQ3FxNy9HNjZiVzRDOHhtMWRucnhQRzl5RDBn?=
 =?utf-8?B?QTlaYUVPdTErVVh1ZHY3eTNkWjh2aEk0QVJ2MFNqSEdVbENoaWNmRkY0aVpB?=
 =?utf-8?B?dGRGVzk2OTMvOVdPTUkvN0ltMHRxNXNTQXRZMmYxN2lRUDFnbzRtblo1N3I1?=
 =?utf-8?B?SGxBNlFiWW9jQzFpdVp6US9DZ2JtYlc5Q0FxbmY2Wk0vNmphM3ZCK1o0cnNV?=
 =?utf-8?B?d1RRSEptT0poMlAvdGNyL3RtaUtTZjE5MCs1ZFUvcHl2WVVSY01oV0JsTjJX?=
 =?utf-8?B?cHQrR0ExdTBSeFBEQjBFSG9xVmhxN3hUVC9qVWN1bzY1WG9NQnlwODEyTXVT?=
 =?utf-8?B?V1h6aTZ6aGxaVXpnd2gvNnpYT0czdVpmTG5qcjdkKzkyZkFxSXNxUE9ZcHAy?=
 =?utf-8?B?UmNmR05sVWZKTnFDRTQrWlhaaGtJSldmeEJIYWRoOTc4SFYxYUdlZHFMNjlt?=
 =?utf-8?B?ZU5SdDd1clU1ampuZ1hnLzZXbmp1NWc5Q09oVkNZUDhsalpiNEJwTXUzZVEy?=
 =?utf-8?B?ZjBqU2hPZGdqWXpLeTdpdE51eVh5MnNnQm1WaHJSelZnaURPcGRmYlRlK3U5?=
 =?utf-8?B?MERNVG5GdWRoWkd1QVJxK1dyQk1kYmc1cGNOK1hNZTkvQjBLVW51Vjh3YWlW?=
 =?utf-8?B?cGtSVzdncmR1ZnBjVWE5ZWt6Y0loRUt2Tzc5Ym5sSHhPU3lsaXlEamVuYXZv?=
 =?utf-8?B?bVJ3YjQ3YjgzZ2ljTlZWMFNUcUtYQkN1SkpWRElzUzgxT2JMQ3hJWXJIb2lI?=
 =?utf-8?B?SWFsejJsQTZUbndEZFRlU2k4NWlNeTN1TkhnUHN3T25zeUFFY3ozdW1HTmI1?=
 =?utf-8?B?YmMramRCUEVHc2YrVy9xVU45V1NLYzM5TnVnNkJZa0FUdms5RncycnQyL3lQ?=
 =?utf-8?B?N1Z2cmJWNVZLWkdNRHNhRlhJM2t4VERLODBEdEFsYW5DVHJVeEd0NFlNT0FT?=
 =?utf-8?B?dldJbmp1aWtMNGtOUkd4emxJTmZsZ1VLSS85MElaSWE3ZzFWZnpid095YmRp?=
 =?utf-8?B?SkJhNFBQUkVsOElxN2xPMWdqWWtDM2xoWE9HL0VUYmRZSzNiMFFPeTNkT1Rt?=
 =?utf-8?B?WUVNNUQ2enViRHJjeHhkSitSU1JScGMyZnpPQTFtOTdrMHlPMWIwYTZ3TCtv?=
 =?utf-8?Q?eguNl31UAP3OEmufdAWR6PQ=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8205.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VXZWYmlLRjVySW5zd095NUV1YWVGRDlyTU8yc1NIZlBaMnNNWjBEdjhBajV0?=
 =?utf-8?B?NDNBdlJCaEFkNmdPbzFsWjMzeUpDVFFybkxoaHp3NnJhaEdCVFJqQmxsclFM?=
 =?utf-8?B?KzRqeGJZLzFWRFMxTlJoanNCOGNWWkJwOVhtMUdMOSswRy9ZUmhNKzdMdjJD?=
 =?utf-8?B?Yy90MTVTQVlMaU9OQzZYSGRYcWFVVEFFQ0VzUG1VZmFvMzFNVlJweG9meHp5?=
 =?utf-8?B?OVNka3E2YS9Ia3FyQTFybVdrbTVRY0ZiMHJqeklJZHdBTFZUWUNRSDFyQjZs?=
 =?utf-8?B?MHlXVjlJL0tHVkU0YjV1eDdLZ0p2aEtqNnVJRi9SMW15elQwWmdyMkQ1VnJP?=
 =?utf-8?B?MklES3B3ditPQnFNc3ZOM3VHM3ZwVEhnbWpiYmxRa2VTdXZ3OVFiVWgxeTdZ?=
 =?utf-8?B?WDlHcGMyVXNFSmw1em1pMXdsRzRPbGFVc1poR2x4ZEU4TE90NEUwOVlLWFRT?=
 =?utf-8?B?cy9YRmhUcHk3RDBmMUQ4RkMwcjBWNEdjMnpTMWoreFRna0pxdEI3VTdWRXV2?=
 =?utf-8?B?MWZHaS84aVlwRGNIMnM0dnN6WE9uVk5kNDhVbVBXTEtPODV4Nkdld3FyYk40?=
 =?utf-8?B?ay92cjJFVDFsL20ySnlqU2NVbUE0a1c4enlhNUpnMzlXQWJCdFk4NHVMNjZK?=
 =?utf-8?B?ZVZDdUo4QXNhazI4TFl4Qkx6REtnMkY0V1A4WG16SnBvc1h6OVFuc3hrWHRN?=
 =?utf-8?B?VVBxKy9iMmxYNENQck9rQmNyaFRpckJoSVQyYzB2a1hCcC9HNGN5RmZ3cWJB?=
 =?utf-8?B?ZndlQ3ZXT2U3YWY0aC9sczV4Nkpic29lT3ZOd0xlajlHcmo2M08vS0dtOGxT?=
 =?utf-8?B?LzR0VjJONkFnMUxieXkvMFVZYVQ5OVpqTmpkd2M4bFpqWVNOQ1hHRGFxSXc4?=
 =?utf-8?B?d2lObVIxUTV4VWtnVk9YemlldGZpNnp6eERkRTVNZ1ptc1VkS1lnbml1Q0ti?=
 =?utf-8?B?QlI0MHNDZlE2eEswbkNMTmJSckhRdmpmUmNIVStNQ3NzazN3c2NtVkh5b25O?=
 =?utf-8?B?OHU1L0R2Vjk4eForUC94V014djJzOEUxbnpTbGRWdnl1REU3K21JanlSdFVZ?=
 =?utf-8?B?eXR1VGxyaEc0dkpuQ0J5enNJWEtYWFhaTm9QMHBqSFJGUE10R1UzT1UyZ3BE?=
 =?utf-8?B?WmNlZXErb3pnOTNMaThNTWk0YkozUUM3RHp1cFdTZ0FXV2x3SDlpNzlrWTN6?=
 =?utf-8?B?NWV3bjE3VmI5ODA1MWpwWE9TbjNzWi9GWkl6RUpqeDNFRWMveUU5WDZPamFV?=
 =?utf-8?B?aXEyU1VGYWlURjlLbDZqOUttVWszbUNKcU0yT0ZEQUozK3R0dHQrZHVRNWVY?=
 =?utf-8?B?RW1nTnM3SlNreHd0RjQ4a2hZaUQySURxT214UzVNZnFrby9ldnc3bVNzQTIw?=
 =?utf-8?B?V2pCTVJHdTc5WE9WNnpjZjAwekRYaFVBMmcvd1M3RHpLeVpVMmw5bExVKzdh?=
 =?utf-8?B?S3N2S0wxWGJOZ3JabVBYdFhRNURtZTZQS2dXSmZhYnFjNEtjS1JNWmZ3VExH?=
 =?utf-8?B?bExINktIc21hTWtvUVRVRDk3Qk5TZ1hPS1RVV2JiNnpFSVBqTjVxVmZOVVBM?=
 =?utf-8?B?TFcwT2ZjeVdadWk0S1p0blVEaEowVFZnMUtTZDhqclVkZE9KTXJ0bEwyMWp5?=
 =?utf-8?B?cUlhVVovZUVUWHEveW1YSFNPcWxMMUFsZUVnVWJrUkduenk0QmNsZloyTndJ?=
 =?utf-8?B?RHdkbnNUM1lRK1UvNHVRek9UR0dDSDJsRlZIZEhRRDZycFpYMXBPVkFzNDhy?=
 =?utf-8?B?eCtZNjFJREVZVGMzQk44QmZ6eTltbWVWTTFzSHV1Q2puQktDc3ZMQk9heHNp?=
 =?utf-8?B?SGxOL1M1MzdGREgxSFRFRmhUd0FlZE0zSVB0Ylh6VjBCNk9iRFlHa2pxL2o3?=
 =?utf-8?B?eGtkRnhVNkhzaHg2MldDazZFMWJPTE9SQjZOZS9JNDBadkY5LzJLMUdadEVL?=
 =?utf-8?B?c21FT0h1SGhlSFIyY1hOWno5VEZqa3J0QU1adDBSbmxNZCtQVFY4QlVKRnc5?=
 =?utf-8?B?WG4xMUJCdnduaHIzWEFxV1ZmTjkzejQ5bHNHWURkRXluRzk0RHdyKzROQmd4?=
 =?utf-8?B?d2JFOHJQZG9wbmE1eEhSQ0hlTXVPcnk1emU0MXFiNWVYRmwzc2ZSbHV1c1VP?=
 =?utf-8?B?eXkzREVqN2s3UytKUHdPSUlqTDRJOFJKVG83QzJnYVFwNjFiWEFtQzhkbU5y?=
 =?utf-8?B?TUhrTy9DZDNXZmV4VVI1VWNtK3VNQzhDejFvQmZXSTd5azNwSzRiQ2k4eXNT?=
 =?utf-8?B?K3hYQUs2Zlc2NGhSMXJodFFXeUpobnpPSllJMVJkaGNZemVLR1E1NGFqUTg5?=
 =?utf-8?B?MUVWdnRKb1VydG4xaXFxMnlpS2xPdU85T0twaXZCZXZpSWxOcjhHUT09?=
X-OriginatorOrg: silabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f918272-f5cb-4192-f1b9-08de6a452bbf
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8205.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 14:44:05.4586
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 54dbd822-5231-4b20-944d-6f4abcd541fb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FcpxhJrRrhX+soSKAM3507PdkwE/eLpfzVJaAwUqMicD4T/9RsGc9FuecWeaJ2Tq5gdE3F0gGqxa1QtD8V5iBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7082
X-Authority-Analysis: v=2.4 cv=Ne3rFmD4 c=1 sm=1 tr=0 ts=698de739 cx=c_pps
 a=SjKxu3n00dGHhKqS4WZ18w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=M51BFTxLslgA:10
 a=i1IsUcr2s-wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=NEAV23lmAAAA:8 a=2AEO0YjSAAAA:8 a=VwQbUJbxAAAA:8
 a=XnNIu7v9ea53sXSEXX8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEyMDExMSBTYWx0ZWRfX8y06EKQDKe01
 F0MB0R5n9AOzpUiDuVi6DhOMdy7cMNyBAdnGR7tCw/ihOodwRNXiOxEDDUJnKVkM0gybZkvsclV
 QE400XXmisxOfK/ywc+1iS9ZxGwp0SvTRTI/VcLUiRtGSYsQ4zeYyT84jIKOU+FVuCN6g5jh11e
 6EQ7VcL0Pj1/dDJEyfzr+PVQdABRom44ZUdoBhFP2sZh5a2lde5MjX/BXnO5uYuJ9N0Z9NYja1u
 gCiyQWEVkTerwt/cJacDPau0Qr8Xz2bBYELpnfk6dBuLvKuNhc7FIv5kK6s3d5V6Sr0aXWh9ujs
 pV3gtiP3mJ5q4932m9Rf8NmqM7VsjqgDCiX2HTTyPW3p7WAVfrw3v7kLknIxrsyzlMX7edLzMut
 OzcFU5SxXH9H8HlGAONi/Igc6frpuHsVXwYlhR48K6CV6iE54JVX3mbeca3j2BAXQq5bEQgNzD/
 SdXetxWaPooRCs3P/Ow==
X-Proofpoint-ORIG-GUID: jO2WIsoMhvj-uyLC5IwMzbpzUdRtqr4G
X-Proofpoint-GUID: jO2WIsoMhvj-uyLC5IwMzbpzUdRtqr4G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_04,2026-02-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 spamscore=0 phishscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602120111
X-Spamd-Bar: ----
Message-ID-Hash: Z4NRKAV72BICD7VNNVCMN2QY33OYXEAS
X-Message-ID-Hash: Z4NRKAV72BICD7VNNVCMN2QY33OYXEAS
X-MailFrom: prvs=050394110d=damien.riegel@silabs.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Silicon Labs Kernel Team <linux-devel@silabs.com>, =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v3 01/14] greybus: cpc: add minimal CPC Host Device infrastructure
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/Z4NRKAV72BICD7VNNVCMN2QY33OYXEAS/>
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
X-Rspamd-Queue-Id: B907A12E690
X-Rspamd-Action: no action

Q1BDIHN0YW5kcyBmb3IgQ28tUHJvY2Vzc29yIENvbW11bmljYXRpb24gYW5kIGN1cnJlbnRseSBl
eGlzdHMgYXMgYQ0KdXNlcnNwYWNlIGRhZW1vbiBbMV0uIEl0IGVuYWJsZXMgbXVsdGlwbGUgYXBw
bGljYXRpb25zIHJ1bm5pbmcgb24gYQ0KY29wcm9jZXNzb3IgdG8gc2hhcmUgYSBzaW5nbGUgcGh5
c2ljYWwgbGluayB0byBhIExpbnV4IGhvc3QuDQoNCkNQQyB1c2Vyc3BhY2UgYW5kIGtlcm5lbCBp
bXBsZW1lbnRhdGlvbnMgZGlmZmVyLCBhcyB0aGUga2VybmVsDQppbXBsZW1lbnRhdGlvbiByZWxp
ZXMgb24gR3JleWJ1cy4gU28gZXZlbiB0aG91Z2ggYm90aCBzaGFyZSB0aGUgIkNQQyINCm5hbWUs
IHRoZXkgYXJlIG5vdCB0aGUgc2FtZSBwcm90b2NvbCBhbmQgYXJlIG5vdCBpbnRlbmRlZCB0byBi
ZQ0KY29tcGF0aWJsZSB3aXRoIGVhY2ggb3RoZXIuIEtlcm5lbCBpbnRlZ3JhdGlvbiBpcyBpbnRl
bmRlZCB0byBzdXBlcnNlZWQNCnRoZSB1c2Vyc3BhY2UgZGFlbW9uLg0KDQpUaGUgcG9pbnQgb2Yg
dGhlIGtlcm5lbCBpbnRlZ3JhdGlvbiBpcyBnYWluIGFjY2VzcyB0byBtb3JlIHBoeXNpY2FsDQps
aW5rcywgbGlrZSBTRElPLCBhbmQgZXZlbnR1YWxseSBhZGQgR3JleWJ1cyBkcml2ZXJzIHRoYXQg
aW50ZWdyYXRlIGludG8NCmtlcm5lbCBzdGFja3MgbGlrZSBXaS1GaSBhbmQgQmx1ZXRvb3RoLg0K
DQpUaGUgZmlyc3Qgc3RlcCB0byBhZGQgQ1BDIHN1cHBvcnQgd2l0aCBHcmV5YnVzIGlzIHRvIGFk
ZCBhIHZlcnkgbWluaW1hbA0KbW9kdWxlIGZvciBDUEMgSG9zdCBEZXZpY2VzLiBGb3Igbm93LCB0
aGlzIG1vZHVsZSBvbmx5IHByb3hpZXMgY2FsbHMgdG8NCnRoZSBHcmV5YnVzIEhvc3QgRGV2aWNl
IEFQSSBhbmQgZG9lcyBub3RoaW5nIHVzZWZ1bCwgYnV0IGZ1cnRoZXIgY29tbWl0cw0Kd2lsbCB1
c2UgdGhpcyBiYXNlIHRvIGJ1aWxkIHVwb24uDQoNClsxXSBodHRwczovL2dpdGh1Yi5jb20vU2ls
aWNvbkxhYnMvY3BjLWRhZW1vbg0KDQpTaWduZWQtb2ZmLWJ5OiBEYW1pZW4gUmnDqWdlbCA8ZGFt
aWVuLnJpZWdlbEBzaWxhYnMuY29tPg0KLS0tDQpDaGFuZ2VzIGluIHYzOg0KICAtIHJld3JpdGUg
Y29tbWl0IG1lc3NhZ2UgYW5kIEtjb25maWcgaGVscCBtZXNzYWdlIHRvIGJldHRlciBleHBsYWlu
DQogICAgd2hhdCBDUEMgaXMNCg0KIE1BSU5UQUlORVJTICAgICAgICAgICAgICAgICAgfCAgNiAr
KysNCiBkcml2ZXJzL2dyZXlidXMvS2NvbmZpZyAgICAgIHwgIDIgKw0KIGRyaXZlcnMvZ3JleWJ1
cy9NYWtlZmlsZSAgICAgfCAgMiArDQogZHJpdmVycy9ncmV5YnVzL2NwYy9LY29uZmlnICB8IDEy
ICsrKysrKw0KIGRyaXZlcnMvZ3JleWJ1cy9jcGMvTWFrZWZpbGUgfCAgNiArKysNCiBkcml2ZXJz
L2dyZXlidXMvY3BjL2hvc3QuYyAgIHwgODQgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrDQogZHJpdmVycy9ncmV5YnVzL2NwYy9ob3N0LmggICB8IDQwICsrKysrKysrKysrKysr
KysrDQogNyBmaWxlcyBjaGFuZ2VkLCAxNTIgaW5zZXJ0aW9ucygrKQ0KIGNyZWF0ZSBtb2RlIDEw
MDY0NCBkcml2ZXJzL2dyZXlidXMvY3BjL0tjb25maWcNCiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJp
dmVycy9ncmV5YnVzL2NwYy9NYWtlZmlsZQ0KIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dy
ZXlidXMvY3BjL2hvc3QuYw0KIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dyZXlidXMvY3Bj
L2hvc3QuaA0KDQpkaWZmIC0tZ2l0IGEvTUFJTlRBSU5FUlMgYi9NQUlOVEFJTkVSUw0KaW5kZXgg
NmQxZGU4MmU2ZGMuLjU2ZGFmOWVjMzEwIDEwMDY0NA0KLS0tIGEvTUFJTlRBSU5FUlMNCisrKyBi
L01BSU5UQUlORVJTDQpAQCAtMTA3NzQsNiArMTA3NzQsMTIgQEAgUzoJTWFpbnRhaW5lZA0KIEY6
CURvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9uZXQvdGksY2MxMzUycDcueWFtbA0K
IEY6CWRyaXZlcnMvZ3JleWJ1cy9nYi1iZWFnbGVwbGF5LmMNCiANCitHUkVZQlVTIENQQyBEUklW
RVJTDQorTToJRGFtaWVuIFJpw6lnZWwgPGRhbWllbi5yaWVnZWxAc2lsYWJzLmNvbT4NCitSOglT
aWxpY29uIExhYnMgS2VybmVsIFRlYW0gPGxpbnV4LWRldmVsQHNpbGFicy5jb20+DQorUzoJU3Vw
cG9ydGVkDQorRjoJZHJpdmVycy9ncmV5YnVzL2NwYy8qDQorDQogR1JFWUJVUyBTVUJTWVNURU0N
CiBNOglKb2hhbiBIb3ZvbGQgPGpvaGFuQGtlcm5lbC5vcmc+DQogTToJQWxleCBFbGRlciA8ZWxk
ZXJAa2VybmVsLm9yZz4NCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dyZXlidXMvS2NvbmZpZyBiL2Ry
aXZlcnMvZ3JleWJ1cy9LY29uZmlnDQppbmRleCBjM2YwNTZkMjhiMC4uNTY1YTBmZGNiMmMgMTAw
NjQ0DQotLS0gYS9kcml2ZXJzL2dyZXlidXMvS2NvbmZpZw0KKysrIGIvZHJpdmVycy9ncmV5YnVz
L0tjb25maWcNCkBAIC0zMCw2ICszMCw4IEBAIGNvbmZpZyBHUkVZQlVTX0JFQUdMRVBMQVkNCiAJ
ICBUbyBjb21waWxlIHRoaXMgY29kZSBhcyBhIG1vZHVsZSwgY2hvc2UgTSBoZXJlOiB0aGUgbW9k
dWxlDQogCSAgd2lsbCBiZSBjYWxsZWQgZ2ItYmVhZ2xlcGxheS5rbw0KIA0KK3NvdXJjZSAiZHJp
dmVycy9ncmV5YnVzL2NwYy9LY29uZmlnIg0KKw0KIGNvbmZpZyBHUkVZQlVTX0VTMg0KIAl0cmlz
dGF0ZSAiR3JleWJ1cyBFUzMgVVNCIGhvc3QgY29udHJvbGxlciINCiAJZGVwZW5kcyBvbiBVU0IN
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dyZXlidXMvTWFrZWZpbGUgYi9kcml2ZXJzL2dyZXlidXMv
TWFrZWZpbGUNCmluZGV4IGQ5ODZlOTRmODg5Li45MmZlMWQ2MjY5MSAxMDA2NDQNCi0tLSBhL2Ry
aXZlcnMvZ3JleWJ1cy9NYWtlZmlsZQ0KKysrIGIvZHJpdmVycy9ncmV5YnVzL01ha2VmaWxlDQpA
QCAtMjEsNiArMjEsOCBAQCBjY2ZsYWdzLXkgKz0gLUkkKHNyYykNCiBvYmotJChDT05GSUdfR1JF
WUJVU19CRUFHTEVQTEFZKQkrPSBnYi1iZWFnbGVwbGF5Lm8NCiANCiAjIEdyZXlidXMgSG9zdCBj
b250cm9sbGVyIGRyaXZlcnMNCitvYmotJChDT05GSUdfR1JFWUJVU19DUEMpCSs9IGNwYy8NCisN
CiBnYi1lczIteSA6PSBlczIubw0KIA0KIG9iai0kKENPTkZJR19HUkVZQlVTX0VTMikJKz0gZ2It
ZXMyLm8NCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dyZXlidXMvY3BjL0tjb25maWcgYi9kcml2ZXJz
L2dyZXlidXMvY3BjL0tjb25maWcNCm5ldyBmaWxlIG1vZGUgMTAwNjQ0DQppbmRleCAwMDAwMDAw
MDAwMC4uMGU3MjM4MzM4MWENCi0tLSAvZGV2L251bGwNCisrKyBiL2RyaXZlcnMvZ3JleWJ1cy9j
cGMvS2NvbmZpZw0KQEAgLTAsMCArMSwxMiBAQA0KKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6
IEdQTC0yLjANCisNCitjb25maWcgR1JFWUJVU19DUEMNCisJdHJpc3RhdGUgIkdyZXlidXMgQ1BD
IGRyaXZlciINCisJaGVscA0KKwkgIENQQyAoQ28tUHJvY2Vzc29yIENvbW11bmljYXRpb24pIGlz
IGEgcHJvdG9jb2wgZm9yIHNoYXJpbmcgYSBzaW5nbGUNCisJICBwaHlzaWNhbCBsaW5rIHRvIGEg
Y29wcm9jZXNzb3IgYmV0d2VlbiBtdWx0aXBsZSB1c2Vycy4gQ1BDIGFkZHMNCisJICBjaGVja3N1
bW1pbmcsIHJldHJhbnNtaXNzaW9ucyBhbmQgZmxvdyBjb250cm9sIHRvIEdyZXlidXMgdG8gdHJh
bnNtaXQNCisJICBtZXNzYWdlcyBhcyByZWxpYWJseSBhcyBwb3NzaWJsZS4NCisNCisJICBUbyBj
b21waWxlIHRoaXMgY29kZSBhcyBhIG1vZHVsZSwgY2hvc2UgTSBoZXJlOiB0aGUgbW9kdWxlIHdp
bGwgYmUNCisJICBjYWxsZWQgZ2ItY3BjLmtvDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncmV5YnVz
L2NwYy9NYWtlZmlsZSBiL2RyaXZlcnMvZ3JleWJ1cy9jcGMvTWFrZWZpbGUNCm5ldyBmaWxlIG1v
ZGUgMTAwNjQ0DQppbmRleCAwMDAwMDAwMDAwMC4uNDkwOTgyYTBmZjUNCi0tLSAvZGV2L251bGwN
CisrKyBiL2RyaXZlcnMvZ3JleWJ1cy9jcGMvTWFrZWZpbGUNCkBAIC0wLDAgKzEsNiBAQA0KKyMg
U1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjANCisNCitnYi1jcGMteSA6PSBob3N0Lm8N
CisNCisjIENQQyBjb3JlDQorb2JqLSQoQ09ORklHX0dSRVlCVVNfQ1BDKQkrPSBnYi1jcGMubw0K
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3JleWJ1cy9jcGMvaG9zdC5jIGIvZHJpdmVycy9ncmV5YnVz
L2NwYy9ob3N0LmMNCm5ldyBmaWxlIG1vZGUgMTAwNjQ0DQppbmRleCAwMDAwMDAwMDAwMC4uODA1
MTY1MTdmZjYNCi0tLSAvZGV2L251bGwNCisrKyBiL2RyaXZlcnMvZ3JleWJ1cy9jcGMvaG9zdC5j
DQpAQCAtMCwwICsxLDg0IEBADQorLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAN
CisvKg0KKyAqIENvcHlyaWdodCAoYykgMjAyNSwgU2lsaWNvbiBMYWJvcmF0b3JpZXMsIEluYy4N
CisgKi8NCisNCisjaW5jbHVkZSA8bGludXgvZXJyLmg+DQorI2luY2x1ZGUgPGxpbnV4L2dyZXli
dXMuaD4NCisjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+DQorDQorI2luY2x1ZGUgImhvc3QuaCIN
CisNCitzdGF0aWMgc3RydWN0IGNwY19ob3N0X2RldmljZSAqZ2JfaGRfdG9fY3BjX2hkKHN0cnVj
dCBnYl9ob3N0X2RldmljZSAqaGQpDQorew0KKwlyZXR1cm4gKHN0cnVjdCBjcGNfaG9zdF9kZXZp
Y2UgKikmaGQtPmhkX3ByaXY7DQorfQ0KKw0KK3N0YXRpYyBpbnQgY3BjX2diX21lc3NhZ2Vfc2Vu
ZChzdHJ1Y3QgZ2JfaG9zdF9kZXZpY2UgKmdiX2hkLCB1MTYgY3BvcnRfaWQsDQorCQkJICAgICAg
IHN0cnVjdCBnYl9tZXNzYWdlICptZXNzYWdlLCBnZnBfdCBnZnBfbWFzaykNCit7DQorCXN0cnVj
dCBjcGNfaG9zdF9kZXZpY2UgKmNwY19oZCA9IGdiX2hkX3RvX2NwY19oZChnYl9oZCk7DQorDQor
CXJldHVybiBjcGNfaGQtPmRyaXZlci0+bWVzc2FnZV9zZW5kKGNwY19oZCwgY3BvcnRfaWQsIG1l
c3NhZ2UsIGdmcF9tYXNrKTsNCit9DQorDQorc3RhdGljIHZvaWQgY3BjX2diX21lc3NhZ2VfY2Fu
Y2VsKHN0cnVjdCBnYl9tZXNzYWdlICptZXNzYWdlKQ0KK3sNCisJLyogTm90IGltcGxlbWVudGVk
ICovDQorfQ0KKw0KK3N0YXRpYyBzdHJ1Y3QgZ2JfaGRfZHJpdmVyIGNwY19nYl9kcml2ZXIgPSB7
DQorCS5oZF9wcml2X3NpemUgPSBzaXplb2Yoc3RydWN0IGNwY19ob3N0X2RldmljZSksDQorCS5t
ZXNzYWdlX3NlbmQgPSBjcGNfZ2JfbWVzc2FnZV9zZW5kLA0KKwkubWVzc2FnZV9jYW5jZWwgPSBj
cGNfZ2JfbWVzc2FnZV9jYW5jZWwsDQorfTsNCisNCitzdHJ1Y3QgY3BjX2hvc3RfZGV2aWNlICpj
cGNfaGRfY3JlYXRlKHN0cnVjdCBjcGNfaGRfZHJpdmVyICpkcml2ZXIsIHN0cnVjdCBkZXZpY2Ug
KnBhcmVudCkNCit7DQorCXN0cnVjdCBjcGNfaG9zdF9kZXZpY2UgKmNwY19oZDsNCisJc3RydWN0
IGdiX2hvc3RfZGV2aWNlICpoZDsNCisNCisJaWYgKCghZHJpdmVyLT5tZXNzYWdlX3NlbmQpIHx8
ICghZHJpdmVyLT5tZXNzYWdlX2NhbmNlbCkpIHsNCisJCWRldl9lcnIocGFyZW50LCAibWlzc2lu
ZyBtYW5kYXRvcnkgY2FsbGJhY2tzXG4iKTsNCisJCXJldHVybiBFUlJfUFRSKC1FSU5WQUwpOw0K
Kwl9DQorDQorCWhkID0gZ2JfaGRfY3JlYXRlKCZjcGNfZ2JfZHJpdmVyLCBwYXJlbnQsIEdCX0NQ
Q19NU0dfU0laRV9NQVgsIEdCX0NQQ19OVU1fQ1BPUlRTKTsNCisJaWYgKElTX0VSUihoZCkpDQor
CQlyZXR1cm4gKHN0cnVjdCBjcGNfaG9zdF9kZXZpY2UgKiloZDsNCisNCisJY3BjX2hkID0gZ2Jf
aGRfdG9fY3BjX2hkKGhkKTsNCisJY3BjX2hkLT5nYl9oZCA9IGhkOw0KKwljcGNfaGQtPmRyaXZl
ciA9IGRyaXZlcjsNCisNCisJcmV0dXJuIGNwY19oZDsNCit9DQorRVhQT1JUX1NZTUJPTF9HUEwo
Y3BjX2hkX2NyZWF0ZSk7DQorDQoraW50IGNwY19oZF9hZGQoc3RydWN0IGNwY19ob3N0X2Rldmlj
ZSAqY3BjX2hkKQ0KK3sNCisJcmV0dXJuIGdiX2hkX2FkZChjcGNfaGQtPmdiX2hkKTsNCit9DQor
RVhQT1JUX1NZTUJPTF9HUEwoY3BjX2hkX2FkZCk7DQorDQordm9pZCBjcGNfaGRfcHV0KHN0cnVj
dCBjcGNfaG9zdF9kZXZpY2UgKmNwY19oZCkNCit7DQorCXJldHVybiBnYl9oZF9wdXQoY3BjX2hk
LT5nYl9oZCk7DQorfQ0KK0VYUE9SVF9TWU1CT0xfR1BMKGNwY19oZF9wdXQpOw0KKw0KK3ZvaWQg
Y3BjX2hkX2RlbChzdHJ1Y3QgY3BjX2hvc3RfZGV2aWNlICpjcGNfaGQpDQorew0KKwlyZXR1cm4g
Z2JfaGRfZGVsKGNwY19oZC0+Z2JfaGQpOw0KK30NCitFWFBPUlRfU1lNQk9MX0dQTChjcGNfaGRf
ZGVsKTsNCisNCit2b2lkIGNwY19oZF9yY3ZkKHN0cnVjdCBjcGNfaG9zdF9kZXZpY2UgKmNwY19o
ZCwgdTE2IGNwb3J0X2lkLCB1OCAqZGF0YSwgc2l6ZV90IGxlbmd0aCkNCit7DQorCWdyZXlidXNf
ZGF0YV9yY3ZkKGNwY19oZC0+Z2JfaGQsIGNwb3J0X2lkLCBkYXRhLCBsZW5ndGgpOw0KK30NCitF
WFBPUlRfU1lNQk9MX0dQTChjcGNfaGRfcmN2ZCk7DQorDQorTU9EVUxFX0RFU0NSSVBUSU9OKCJH
cmV5YnVzIG92ZXIgQ1BDIik7DQorTU9EVUxFX0xJQ0VOU0UoIkdQTCIpOw0KK01PRFVMRV9BVVRI
T1IoIlNpbGljb24gTGFib3JhdG9yaWVzLCBJbmMuIik7DQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cmV5YnVzL2NwYy9ob3N0LmggYi9kcml2ZXJzL2dyZXlidXMvY3BjL2hvc3QuaA0KbmV3IGZpbGUg
bW9kZSAxMDA2NDQNCmluZGV4IDAwMDAwMDAwMDAwLi5mNTVmZWIzMDNmNA0KLS0tIC9kZXYvbnVs
bA0KKysrIGIvZHJpdmVycy9ncmV5YnVzL2NwYy9ob3N0LmgNCkBAIC0wLDAgKzEsNDAgQEANCisv
KiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMCAqLw0KKy8qDQorICogQ29weXJpZ2h0
IChjKSAyMDI1LCBTaWxpY29uIExhYm9yYXRvcmllcywgSW5jLg0KKyAqLw0KKw0KKyNpZm5kZWYg
X19DUENfSE9TVF9IDQorI2RlZmluZSBfX0NQQ19IT1NUX0gNCisNCisjaW5jbHVkZSA8bGludXgv
ZGV2aWNlLmg+DQorI2luY2x1ZGUgPGxpbnV4L2dyZXlidXMuaD4NCisjaW5jbHVkZSA8bGludXgv
dHlwZXMuaD4NCisNCisjZGVmaW5lIEdCX0NQQ19NU0dfU0laRV9NQVggNDA5Ng0KKyNkZWZpbmUg
R0JfQ1BDX05VTV9DUE9SVFMgOA0KKw0KK3N0cnVjdCBjcGNfaG9zdF9kZXZpY2U7DQorDQorc3Ry
dWN0IGNwY19oZF9kcml2ZXIgew0KKwlpbnQgKCptZXNzYWdlX3NlbmQpKHN0cnVjdCBjcGNfaG9z
dF9kZXZpY2UgKmhkLCB1MTYgZGVzdF9jcG9ydF9pZCwNCisJCQkgICAgc3RydWN0IGdiX21lc3Nh
Z2UgKm1lc3NhZ2UsIGdmcF90IGdmcF9tYXNrKTsNCisJdm9pZCAoKm1lc3NhZ2VfY2FuY2VsKShz
dHJ1Y3QgZ2JfbWVzc2FnZSAqbWVzc2FnZSk7DQorfTsNCisNCisvKioNCisgKiBzdHJ1Y3QgY3Bj
X2hvc3RfZGV2aWNlIC0gQ1BDIGhvc3QgZGV2aWNlLg0KKyAqIEBnYl9oZDogcG9pbnRlciB0byBH
cmV5YnVzIEhvc3QgRGV2aWNlIHRoaXMgZGV2aWNlIGJlbG9uZ3MgdG8uDQorICogQGRyaXZlcjog
ZHJpdmVyIG9wZXJhdGlvbnMuDQorICovDQorc3RydWN0IGNwY19ob3N0X2RldmljZSB7DQorCXN0
cnVjdCBnYl9ob3N0X2RldmljZSAqZ2JfaGQ7DQorCWNvbnN0IHN0cnVjdCBjcGNfaGRfZHJpdmVy
ICpkcml2ZXI7DQorfTsNCisNCitzdHJ1Y3QgY3BjX2hvc3RfZGV2aWNlICpjcGNfaGRfY3JlYXRl
KHN0cnVjdCBjcGNfaGRfZHJpdmVyICpkcml2ZXIsIHN0cnVjdCBkZXZpY2UgKnBhcmVudCk7DQor
aW50IGNwY19oZF9hZGQoc3RydWN0IGNwY19ob3N0X2RldmljZSAqY3BjX2hkKTsNCit2b2lkIGNw
Y19oZF9wdXQoc3RydWN0IGNwY19ob3N0X2RldmljZSAqY3BjX2hkKTsNCit2b2lkIGNwY19oZF9k
ZWwoc3RydWN0IGNwY19ob3N0X2RldmljZSAqY3BjX2hkKTsNCit2b2lkIGNwY19oZF9yY3ZkKHN0
cnVjdCBjcGNfaG9zdF9kZXZpY2UgKmNwY19oZCwgdTE2IGNwb3J0X2lkLCB1OCAqZGF0YSwgc2l6
ZV90IGxlbmd0aCk7DQorDQorI2VuZGlmDQotLSANCjIuNTIuMA0KDQpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpncmV5YnVzLWRldiBtYWlsaW5nIGxpc3Qg
LS0gZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpUbyB1bnN1YnNjcmliZSBzZW5kIGFuIGVt
YWlsIHRvIGdyZXlidXMtZGV2LWxlYXZlQGxpc3RzLmxpbmFyby5vcmcK
