Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WGQlHqBTemnk5AEAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Wed, 28 Jan 2026 19:21:20 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id E8B31A7B34
	for <lists+greybus-dev@lfdr.de>; Wed, 28 Jan 2026 19:21:19 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 84AA9401BE
	for <lists+greybus-dev@lfdr.de>; Wed, 28 Jan 2026 18:21:18 +0000 (UTC)
Received: from mx0b-0024c301.pphosted.com (mx0b-0024c301.pphosted.com [148.163.153.153])
	by lists.linaro.org (Postfix) with ESMTPS id ED6113F786
	for <greybus-dev@lists.linaro.org>; Wed, 28 Jan 2026 15:39:52 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=silabs.com header.s=pps12202023 header.b=1z42WLBW;
	dkim=pass header.d=silabs.com header.s=selector1 header.b=VqxUA0ei;
	spf=pass (lists.linaro.org: domain of Damien.Riegel@silabs.com designates 148.163.153.153 as permitted sender) smtp.mailfrom=Damien.Riegel@silabs.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1");
	dmarc=pass (policy=reject) header.from=silabs.com
Received: from pps.filterd (m0101742.ppops.net [127.0.0.1])
	by mx0a-0024c301.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60S8WfUF597696;
	Wed, 28 Jan 2026 09:39:43 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps12202023;
	 bh=cbFZPHJtwua+RamNz855Ujy3Zk4c8NdgSES3ovFSQP8=; b=1z42WLBWHnrn
	c/pEMdscWAqL1TjCNdIUYVWnp91+GhSYAzKJJU6j01G/Lhj8d+mowcFHu0yWBr9V
	pWq0uIuFXviAuF75EMLgKtpPwW70Ik56Br1rVKhpJmXb3OtJ3C814eZmVfKGXDdt
	5MgnlBPpQwqM/NfHmDAMY/377Zj5Rwy2gprTI2Wc60IERn7eI6kMVUdVBcley+Bv
	nU9o27kLVqp1DJ2Vux/xN6lRcKNlzgdU7K10anPfSI9womMVpRdOq1GnHa7uiCe4
	yTfcjdfvsyM7CJBYe9/yuiYDch9dfrhReEA9YiuX6kK6sapTm5KBNeEkZOCNlfmh
	hpIHm6EhIg==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11020102.outbound.protection.outlook.com [40.93.198.102])
	by mx0a-0024c301.pphosted.com (PPS) with ESMTPS id 4bvrfd0fmd-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 28 Jan 2026 09:39:43 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u+jgllR6Wti2QtD0LiawnN8lTbTR2UYOXpDbF2BhmuwjqXSh2fBxi0uKMtBupoRZ+rwaNQRiEe759APAvG3447UBnvksbZipErCtQI065AG0oLuGgcsMbhY+R08t05js9GFYnbw9Rc27UrUxOVtRhDvM0S5esdOiKrlgrGguhbvK3sLkD992MU2SAPFNICfuJQmChtx4HCPPg/xjz8OS5OhFgPjtj2guJ8H1Vz+CiBULg0/qzW4dp+z4FjrCqzg9dxj3vCkIetdt7xOjQSkSBdkwpRnfiJyGJ15nQc6666IRTIJyKYTNGdjqq6NMyBmuW/T3DZ+wd5YvxpIfqMllKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cbFZPHJtwua+RamNz855Ujy3Zk4c8NdgSES3ovFSQP8=;
 b=xuijlCg7Y/VvnFnrcT5QLG1fnRMziepiOXOnvQ8NexNk3fs/nKxjzQIG6MG22KxMNmbc5rFeLuOum2pCe11k99G9ClaMJvjNAmuttBEp3c0x/BOcwa5yu1fkGLq+g8wA/mdhHjVQUfWfEqAwWBQDbH3AMWc+lAkhKWbQAT4Y7JD5ZUOOLWqL/ksuSGQpG1rQ6KQXc1lNb5nswSH6MV5C1jyb8cgn6Dq7RsIr/aLBRklQR91fI591vJwKPLs5aT8WRbD/S7ra82nQnCwK8RyMhEN5j4e7UShcVEcBcffvcaqn5mLoxW7y2LYVPTSOTB90DynNEm5IC1B/CET6DSjT+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silabs.com; dmarc=pass action=none header.from=silabs.com;
 dkim=pass header.d=silabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cbFZPHJtwua+RamNz855Ujy3Zk4c8NdgSES3ovFSQP8=;
 b=VqxUA0eihtvLzIEWxETz3GXb9UbIc2+Kv9asfanNsnU5DjCi8BvoNjdXGvCfz0aYBtrzLnwWxU5TEE9wlJf8BInh75rCAkXNWzOtZzLvFrj/532qjjmP0cCOYLxT75fColjZ7fO5x4PY141RuUaYDPzaBxQapJWUsVU8rBynCXU=
Received: from DS0PR11MB8205.namprd11.prod.outlook.com (2603:10b6:8:162::17)
 by SN7PR11MB6971.namprd11.prod.outlook.com (2603:10b6:806:2ab::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.8; Wed, 28 Jan
 2026 15:39:40 +0000
Received: from DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::2de6:bc88:2af7:3583]) by DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::2de6:bc88:2af7:3583%3]) with mapi id 15.20.9542.010; Wed, 28 Jan 2026
 15:39:40 +0000
Date: Wed, 28 Jan 2026 10:39:38 -0500
Message-Id: <DG0C329Q24U8.2959NJ9J9KXV4@silabs.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
        =?utf-8?q?Damien_Ri=C3=A9gel?= <damien.riegel@silabs.com>
From: =?utf-8?q?Damien_Ri=C3=A9gel?= <damien.riegel@silabs.com>
X-Mailer: aerc 0.21.0
References: <20251223183142.31897-1-damien.riegel@silabs.com>
 <2026011606-qualified-dental-bef0@gregkh>
 <DFZNI1DOAZDK.H9BJA23QFFSG@silabs.com>
 <2026012834-parrot-schilling-d4b0@gregkh>
In-Reply-To: <2026012834-parrot-schilling-d4b0@gregkh>
X-ClientProxiedBy: YQBPR0101CA0229.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:66::35) To DS0PR11MB8205.namprd11.prod.outlook.com
 (2603:10b6:8:162::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8205:EE_|SN7PR11MB6971:EE_
X-MS-Office365-Filtering-Correlation-Id: 55580c25-673f-4dea-73b6-08de5e8372fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ZW5wVnoyTG5TTlpCOURTZVI3dDJZN2VheU1EWXl4US9ZSVhaclFEc3o5L2Jw?=
 =?utf-8?B?bExQWFNnZks5SXNRdG02TE5CVlhOT3RwK3pTSEtuM2l2OWNxaHl1a0hMNjYz?=
 =?utf-8?B?SjZFYmRhQ3h6M3h6YlF4dnFXNGxPTHFkSjMyZjRjNE5VQkJMOW1IYVBNT1Ur?=
 =?utf-8?B?YUw0SThFRE5NTXY0Sm9hL0JtMEIrTmhvZE1WeTdGckdnR1VjZE9nYk15UFJx?=
 =?utf-8?B?VzV4Z2pqMkRFYkNUN2RrY0xDR2F1dCtqRCtOSHhFanZ4aEVVUUloK3JSS01P?=
 =?utf-8?B?WldtL3pxaU1Bc3hONHc0R2ZVMUlOMHRzQ2JTR0dvUG1KR2hGYVQ1N1pRaGkz?=
 =?utf-8?B?d2ptaWVxYkNlNDd5NGtwWkNtcks3Vzg0dkJyM3U4Y1NQbHphVVcrWFNSdzZ1?=
 =?utf-8?B?eEFQNVRsT2IxV3RFaVVUdThSMG95cVRRLzdNck1nZ2VWYnhOZXgxRDN0Z2lB?=
 =?utf-8?B?WUdkMUpkYWxRT0RBbS92OTJrOEFSWmdSRCtHOWZPVW5nTnZPRVZmVDd6bG1n?=
 =?utf-8?B?bXlWTUJ2ampRMnFSVVh2VFZFMm1Fa21LaTBxUVJ6Wjg0YXpDWXkyQVdtc3hv?=
 =?utf-8?B?ZG1KRUVLcnZzQVNmTWQxWW5VdmUvY0t0UDhuYUtzeTVkMEcvU0ZueTVOTHgz?=
 =?utf-8?B?NjByT1ZzanpjWUZSTVBQWTBFVVJERmlNcHNNQkFrbUJlUlliSmhaK3p1d2hn?=
 =?utf-8?B?NHFDYW9kVkgxZzYrSzNhOHRiN2ROanFMUWhzOUhHUjhRUFRmRXpQcHFhb0U2?=
 =?utf-8?B?UE15TUF3VGNId1FpVks1K29nZnJUaUhoVENndEVoWXRwV1FLU3VGaTVFRy95?=
 =?utf-8?B?QkxyRU40blMvakN4S3ZtTFZuSFkzRDBxR2pLbC9hU1pnV0F5Y2M2eVE0a0lj?=
 =?utf-8?B?aU91MjRiM1VHbWFzbEZTdllGSEphWlI0cEpuVzhXY2hpcjAyMzc4TmJ6VU9M?=
 =?utf-8?B?Tk9sMzVuNDZsVlRMVHpwUUxsVjVYYVdxSGNZeU5kenlBMEovM1Nsa1V2WmZV?=
 =?utf-8?B?Mng3TDF3Z2Y3V1ptMEtzVEZ5dnk3RG9wSU9ySE0vYWdUVFJHN1JLQTRBNlc5?=
 =?utf-8?B?TkFSUlVTY0ZDZWlvQTgzUjc2cjBzaUFiZkRPdHJBdVkvUnVMODZySGk1YjVj?=
 =?utf-8?B?SGZDTXBqWVAwTnZhQkhXd0cwZU9odm5mT25RWE1NaHVHUVE0T2tCUUFHMmZk?=
 =?utf-8?B?UUN5S1lHOFJSYzIzcmZaL0pUeGNJaEFpRklPMDFGWDlCR0w1SmJzTS9MZEJK?=
 =?utf-8?B?YUN0OEtuWGxHRGo4WnpxaDIyeGZZeFc3UDdhei82Y3ZGV3VRMENCR0RObHF1?=
 =?utf-8?B?WFZyOFhoNUJ0eDlNdlAxUE5KN2RJVU1NYTZUL2pNWkw5QXVXVGZmb2ttOVVn?=
 =?utf-8?B?M0ZQUUNxQ2JmL3dWMWlOUnVQLzFFakFuY3RyY0tjNGxiZDkySnRFcVUyNk05?=
 =?utf-8?B?dTJ0MUtLVmx4MCtYNHg1NkplS05RYjFLeGw1VXloVFZKK0xra3Vkdk9tUEJR?=
 =?utf-8?B?WW80K0Y3OWJpdUQ4cHMzd25uMWRCYWR2bmJ4YkZTUVNvWlRWdWhwRkZBMkRt?=
 =?utf-8?B?cmJ0Wlk5L2JjelRxZnNYUWFJaCtEUEUzZm4xbWd3VHhDNWo0OXFVVUlCbXFh?=
 =?utf-8?B?VGFHOHZqTDJ1VG90LzJlWk95SWV2ZzFtSFkzb1hFN3pFSUxJTGtRbFJtaE1O?=
 =?utf-8?B?VS9RUjYxcFBhbjdEajRGQXdJYS9RSHFBaTNiQ2FkSkIzeTNWZVUwQXMxNEdD?=
 =?utf-8?B?UVpHOTVGWDdrMmNYM21pdzQvVDZwQjI1akdtLzVuQURDK09vMUdpbG56OEVM?=
 =?utf-8?B?OVplWlowOUE4VTRXaUg3RmVoWXlJYlhpQ2loSWhkcVhWT0NWYlVUZFpBUTlL?=
 =?utf-8?B?YXVFamd5UnVLUzNYSWhMK1E2bEdGMWQzZVBaZ2ZHMHhFWXpOVlRGdmkzcS9i?=
 =?utf-8?B?M1FEQ24rSWNHa0JzYXU1UUxnR3kwdmJBVXlacERrNEpqYVhkYU9NL00wRDcr?=
 =?utf-8?B?VUltT0pXeWtWMEJKbnFrNEw1R2cwWFRjRXJlN01pdk8rdjFsUEJ2ZlFoemdZ?=
 =?utf-8?B?ZENqSWx0b2RYR2R5TmU3eFdnL054cjliblJ4R2xNNWI5Ni8wN01tckJkQ0s3?=
 =?utf-8?Q?5gu8=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8205.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?S2JCYkJPTmE5NHhReHJ3ejZkd1RzTXZYVGx6eG5OaERjU1F6R0ZSSjh5SzJz?=
 =?utf-8?B?cWZ2bmNNenFmMlNuaVVmUW15YlRkbXowNGRPQ09RRWRHYmc5cWdJNU1XYU8v?=
 =?utf-8?B?MFFqdlFzRFFBUWJUWEppVHFhZVdnZE5GUGN6ZStsemRJUENFMUZqYUVLWWRp?=
 =?utf-8?B?NWYyRGV5TTl4YTBBelFNRWZhdXpub1FWUU5SR1VMYnJRVkxaMklDUFp0anlF?=
 =?utf-8?B?eUlISkFqczVPcXN2MzJFNVh2bFZsU3dSeFpxeWVBU3JxOFhPQWdWQ2hnK2g1?=
 =?utf-8?B?SHZOMGpNNk1hRU82RWxaWTRaR09pdmV5U081b012eDBnNTI3djhjNHRUVmlM?=
 =?utf-8?B?bmp2Y213UlpmSGc2NGNNeXR6dk11ZkMvYnVDKzZDMURwdVI2Y3dzSDhyOHVz?=
 =?utf-8?B?ZC9zak0wMHEyRmViWUxhSis2a2tMMFB1SzJXbWVuTHJ4bFVVMlRtZDhOWk5v?=
 =?utf-8?B?eWtMbmVwYXR1UDM4UC9WZ0FkY3NuWC9TS1E3akxtTkt0cnIzdFZpUEppcEdo?=
 =?utf-8?B?aUJIWm1ac253T0tlaUF4VzNpdjBsMm0rQkZrYjhvMEgvVitZb0MyNktCNi9p?=
 =?utf-8?B?Q09kWWdWMmJnQ2ZqSDg4TUlnRE5HSG1CTENGOXFvcnM1aTM0MUVxWFo5MXVa?=
 =?utf-8?B?eG92WldWZmEvK08xVERERGdKZGplOENkT2VJT1NDdGc0VkxlcFp6Vk9relE4?=
 =?utf-8?B?dWZzV0U5ZE44YjhpSm1GU1hPZVVQODBTS3JCdnFGVXhtUVlFNFRmRWZ6NWNB?=
 =?utf-8?B?dnVrQ1pPTUZ0ckxJU2N4NTZwVjZWMXY3OFhjY095c0Y0R3NZck9jRHJRcEdX?=
 =?utf-8?B?SjFBSU5MVTRkQU1zNWZsdTFSbXdlTDFna2tZN3ZzUHBKV0gzY3MvRnFjUVlo?=
 =?utf-8?B?QUF1VWI4MzFpWHNDV0poZzVMT1VVdnNJdVZaYTZsUWZld29EMjc3a3RRdjhz?=
 =?utf-8?B?SWZIbzBXWnNNamJkVkRNUGN4M3NLZDBWOENLcjdqOG1YTy8xeHNxK1BrcXJB?=
 =?utf-8?B?RUlpSUw2dGVaYmpOWVVOdWw2M2R6TFRzTG5DSUpXam1DL3FYdzlOcmp0QkVV?=
 =?utf-8?B?REptUUNJSU9OeDZXYlc1SHVjSHpaMFdkSUNNN3VMb1c3aExWc0lPajVqUHZo?=
 =?utf-8?B?b3VDamE2U3FCcWgxN3VKNU1CV0RwUld2MUpNR2hpWk16d3pHeDdGRzUrdHFl?=
 =?utf-8?B?QThhUmt0S0YvWjNRWkVhczUyRmRGdS9PWEhuM01YL2p3R2VEaVZYU205cis2?=
 =?utf-8?B?ak9PUXdBZStqbWxBQTNzaGtYNHQzbWw0SE54NCs2T1ZIU0tNRkxUSHpjdTk5?=
 =?utf-8?B?NTc0Nzl4SHNQK2h0NmZzb1JnbDlzQkNLOCtQdXNhOEY0NnVoSzJqQTNaNU1R?=
 =?utf-8?B?dzJVUk9uMk9VTGdpajVZRmJ0UWM4M29kN1BZR0pxb2lZT2QrbWMyeE0yYXNn?=
 =?utf-8?B?YnVnVnRPRWtlVTBRTW9kek96WEN0c1REWW5xZnMyeHdzeldrMkJXTjFFOEdB?=
 =?utf-8?B?bklWcW5VcVpwenp2UUM5TVNIb0VKYXd6U21CcG9qR1NqcEI2TGVTR3BlV1lB?=
 =?utf-8?B?S0hEOUM0YlFYMVZoSmg1SEdHTUdEcU5zaDdCM1pxbE1Ua3Rpb3RSMWRDbXdq?=
 =?utf-8?B?N050WTVkdXBOQ0hSTEFrNENjWG8zSXdYanVLZlhlYmhLdzBwQ0RrUndpZi9s?=
 =?utf-8?B?WmZ4TFhldldQbThkMllaWFZiOVVkdzBjYm9EV3NhMDdtYUVUckhjUlFRZ3g1?=
 =?utf-8?B?YmRUZWpjOXlGVzNJQU5FNStBUkpvZUZLMEt5cDJjSy9aVnZmN0ZtK3pCT1Fh?=
 =?utf-8?B?b1RySFVYdGhiZ0pFbDF0MXh6Qm5uUTZzbVpUUVZ3bHRTYTlzellhK0s4OXZQ?=
 =?utf-8?B?d0RBRVRRNURDelNLSTQreXlGQUFTNTJsL21sS1VVQkdjRDh5RE44MGdQSEk3?=
 =?utf-8?B?WitPbjlrUXF6QmRQalJPM085bHZld0xFYzBjWVRITFA0RkptbXFJcXBWa2dU?=
 =?utf-8?B?WDlFMnNqMC8wdUQwL29DbzJsTUN4Y2NMZ3NmUkJ6WTM5STZqKzYrSms2RCty?=
 =?utf-8?B?eXZSdFlPT3JleDYyYWVyMWQvUGRsdkVkTGJ2ZXJWanc3YzBzQkloUHFId2ph?=
 =?utf-8?B?blkrZFY0L1dQVitaczVMMmdXM0FHRDBLSU1LbEZyclYyRzMydmVKOEFNbVkz?=
 =?utf-8?B?WVBPTzZhNkJsYkxyeFJkb1d6eFJ5TkRmTWN2UlEvM1JReU1pMWNCMTRKQVpH?=
 =?utf-8?B?OStkOWJucEpLbkVDNDBRQjJjVjFENW9JZFU5VWROKzkyLzhKK3ZadXkyQkdw?=
 =?utf-8?B?Y3pFVUUwaGd6UTB2Vk9mNjBzWG9IZVpLZFhiQ3g1S21oYnZxMm1Wdz09?=
X-OriginatorOrg: silabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55580c25-673f-4dea-73b6-08de5e8372fb
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8205.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 15:39:39.8735
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 54dbd822-5231-4b20-944d-6f4abcd541fb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rc+ia5DVup0qp3OBZx5+fhmXdL5u9k/aTlNtvTbYBg6AmwlMM6m1q+vQCq0MRMnNu/YTIAxSwM6Swm3pCwRE7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6971
X-Proofpoint-GUID: g6u-vEiqolaI1HFtOFBTtfD8cADwVk4O
X-Authority-Analysis: v=2.4 cv=Criys34D c=1 sm=1 tr=0 ts=697a2dbf cx=c_pps
 a=cPJgcE//urRiG05FhKkhAw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=M51BFTxLslgA:10
 a=i1IsUcr2s-wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=-WxRDvNoGn6awa-bb8oA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: g6u-vEiqolaI1HFtOFBTtfD8cADwVk4O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDEyOSBTYWx0ZWRfX2BoviYajf9st
 aDcbmia6GVSrxzYz8S0nwQT8WeKPXGTouw/9QgzPiZ0pZ1emhWQFDw8EGXJ7q+wET6wS52EitcO
 M7WPtwgKotPhkCOMSQSrjfdtYHepOEwIOMvvady8s1nt+ONxqt7SVJLLJtrOVwEtGrnIBaaBpHD
 ktOFKXtYzrFOTfmMoiXq4rh40XVpWHUlgEyqUIbN3EDOQtbZf5q5dXzyHg698gnj6R5co+uwWuo
 H7FAcT4M0HtCQkEYctZyhe5oZE5fcMFyUkV04bTh0CnJ4Eiu3vNFyGcQLfytWniDYiLRaiS0nIK
 n0GAC8oqfgSFlH/90uBHbxHIsGOteS5/jHUmwfukMC7EXo9bN8Y+wM2PdGwqDxfkPvgoYfsEt+w
 dM4WKcikDWJs8pP1KT3zsTzc/RVw3Z050fuwJNHLvODY2f0m6TL+5XM1cDEDcW/wkTGBLpxejOA
 tnQvyBovRZockvF9zVQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_03,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601280129
X-Spamd-Bar: ----
X-MailFrom: Damien.Riegel@silabs.com
X-Mailman-Rule-Hits: implicit-dest
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
Message-ID-Hash: 7UVA7RSTPVJVBBVCQDW3IMBZFXCFOBPA
X-Message-ID-Hash: 7UVA7RSTPVJVBBVCQDW3IMBZFXCFOBPA
X-Mailman-Approved-At: Wed, 28 Jan 2026 18:21:17 +0000
CC: greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, linux-devel@silabs.com
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 0/8] greybus: support point-to-point topology
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/7UVA7RSTPVJVBBVCQDW3IMBZFXCFOBPA/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.59 / 15.00];
	DMARC_POLICY_REJECT(2.00)[silabs.com : SPF not aligned (relaxed),reject];
	R_DKIM_REJECT(1.00)[silabs.com:s=pps12202023,silabs.com:s=selector1];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[damien.riegel@silabs.com,greybus-dev-bounces@lists.linaro.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[silabs.com:-];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	NEURAL_HAM(-0.00)[-0.996];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email]
X-Rspamd-Queue-Id: E8B31A7B34
X-Rspamd-Action: no action

T24gV2VkIEphbiAyOCwgMjAyNiBhdCAxOjA0IEFNIEVTVCwgR3JlZyBLcm9haC1IYXJ0bWFuIHdy
b3RlOg0KPiBPbiBUdWUsIEphbiAyNywgMjAyNiBhdCAwMzoyMzo0NFBNIC0wNTAwLCBEYW1pZW4g
UmnDqWdlbCB3cm90ZToNCj4+IE9uIEZyaSBKYW4gMTYsIDIwMjYgYXQgMTA6MDkgQU0gRVNULCBH
cmVnIEtyb2FoLUhhcnRtYW4gd3JvdGU6DQo+PiBbLi4uXQ0KPj4NCj4+ID4+DQo+PiA+PiBUaGUg
U1ZDIGRvZXNuJyByZWFsbHkgc2VydmUgYSBwdXJwb3NlIGhlcmUsIGFzIHRoZXJlIGlzIG5vIGJ1
cyB0bw0KPj4gPj4gbWFuYWdlLCBhbmQgYWRkaW5nIGl0cyBzdXBwb3J0IG9ubHkgaW5jcmVhc2Ug
dGhlIGNvbXBsZXhpdHkgYW5kIHRoZSBjb2RlDQo+PiA+PiBzaXplIG5lZWRlZCBvbiBtZW1vcnkt
Y29uc3RyYWluZWQgZGV2aWNlcy4NCj4+ID4NCj4+ID4gRXhhY3RseSBob3cgbXVjaCBtZW1vcnkg
ZG9lcyBhICJzaW5nbGUgcG9pbnQiIFNWQyBkcml2ZXIgdGFrZSwgdnMuDQo+PiA+IGFkZGluZyBu
ZXcgUDJQIGZ1bmN0aW9uYWxpdHkgZXZlcnl3aGVyZSBpbiB0aGUgY29kZSBsaWtlIHlvdSBqdXN0
IGRpZD8NCj4+ID4gRmluZGluZyB0aGF0IG91dCB3b3VsZCBiZSBnb29kIGZpcnN0IGJlZm9yZSB3
b3JyeWluZyBhYm91dCBhZGRpbmcNCj4+ID4gYW5vdGhlciB0eXBlIG9mICJidXMiIGhlcmUgcGxl
YXNlLg0KPj4NCj4+IFNvcnJ5IGZvciBub3QgZ2l2aW5nIG51bWJlcnMgaW4gdGhlIGNvdmVyIGxl
dHRlci4gV2UgbWVhc3VyZWQgMTBrQiBvZg0KPj4gY29kZSBzaXplIGRpZmZlcmVuY2UgKHdoaWNo
IG1heSBiZSBvbiB0aGUgaGlnaGVyIGVuZCBvZiB0aGUgc3BlY3RydW0pDQo+PiBhbmQgaW4gWmVw
aHlyIFsxXSB0aGV5IG1lYXN1cmVkIGEgMmtCIGRpZmZlcmVuY2UgKHdoaWNoIGlzIHByb2JhYmx5
IG9uDQo+PiB0aGUgbG93ZXIgZW5kIGNvbnNpZGVyaW5nIHRoZSBpbXBsZW1lbnRhdGlvbiBpcyBw
cmV0dHkgYmFyZWJvbmUpLg0KPg0KPiBQbGVhc2Ugc3VibWl0IHlvdXIgImVtcHR5IiBTVkMgZHJp
dmVyLCAxMGtiIHNlZW1zIHRvbyBiaWcgdG8gbWUsIEkgdGhpbmsNCj4gd2UgY2FuIHNsaW0gaXQg
ZG93biwgb3IgYXQgdGhlIHZlcnkgbGVhc3QsIHNlZSB3aGF0IGlzIG1ha2luZyBpdCAibGFyZ2Ui
DQo+IGFuZCBwb3RlbnRpYWxseSB3b3JrIHRvIHJlZHVjZSB0aGF0Lg0KDQpUaGUgY29tcGFyaXNv
biBJIGRpZCBvcmlnaW5hbGx5IHdhcyBwcmV0dHkgbmFpdmUuIFdoZW4gSSB0ZXN0ZWQgd2l0aG91
dA0KdGhlIFNWQywgdGhlIEMgZmlsZXMgd2VyZSBub3QgZXZlbiBjb21waWxlZC4gV2hhdCBJIGRp
ZG4ndCBhY2NvdW50IGZvcg0KaXMgdGhhdCBvdXIgU1ZDIGN1cnJlbnRseSBsb2dzIHByZXR0eSBl
eHRlbnNpdmVseSwgYW5kIGd1ZXNzIHdoZXJlIHRoZXNlDQpsb2cgc3RyaW5ncyBhcmUgc3RvcmVk
Li4uDQoNCkFmdGVyIHJlbW92aW5nIHRoZSBsb2dzLCBJIGNvdWxkIGNvbXBhcmUgYXBwbGVzIHRv
IGFwcGxlczoNCiAtIHdpdGggU1ZDOiA1OSwyNzIgQg0KIC0gd2l0aG91dCBTVkM6IDU3LDU1NiBC
DQoNClNvIG5vdCBldmVuIDJrQiBkaWZmZXJlbmNlLg0KDQo+IEZvciBaZXBoeXIsIEkgdGhvdWdo
dCBpdCB3YXMgMWtiIGluIHRoZSBnaXRodWIgY29tbWVudHMsIGJ1dCBzdGlsbCAya2INCj4gc2Vl
bXMgcmVhc29uYWJsZSA6KQ0KDQpUaGUgbGFzdCBjb21tZW50IGluIHRoZSB0aHJlYWQgc2F5cyAy
a0IsIGJ1dCBpdCdzIGluIHRoZSBzYW1lIGJhbGxwYXJrLg0KDQpTbyBJIHRoaW5rIHdlIGhhdmUg
b3VyIG51bWJlciwgYW4gZW1wdHkgU1ZDIHdvdWxkIGJlIGluIHRoZSAxa0IgdG8gMmtCDQpyYW5n
ZS4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmdyZXli
dXMtZGV2IG1haWxpbmcgbGlzdCAtLSBncmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3JnClRvIHVu
c3Vic2NyaWJlIHNlbmQgYW4gZW1haWwgdG8gZ3JleWJ1cy1kZXYtbGVhdmVAbGlzdHMubGluYXJv
Lm9yZwo=
