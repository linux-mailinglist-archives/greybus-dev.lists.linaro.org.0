Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F309ABA0CF
	for <lists+greybus-dev@lfdr.de>; Fri, 16 May 2025 18:33:28 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 9197644979
	for <lists+greybus-dev@lfdr.de>; Fri, 16 May 2025 16:33:26 +0000 (UTC)
Received: from mx0a-0024c301.pphosted.com (mx0a-0024c301.pphosted.com [148.163.149.154])
	by lists.linaro.org (Postfix) with ESMTPS id A12643F648
	for <greybus-dev@lists.linaro.org>; Fri, 16 May 2025 16:25:43 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=silabs.com header.s=pps12202023 header.b=V+IWWTqO;
	dkim=pass header.d=silabs.com header.s=selector1 header.b=gGd2yl5Q;
	dmarc=pass (policy=reject) header.from=silabs.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1");
	spf=pass (lists.linaro.org: domain of Damien.Riegel@silabs.com designates 148.163.149.154 as permitted sender) smtp.mailfrom=Damien.Riegel@silabs.com
Received: from pps.filterd (m0101743.ppops.net [127.0.0.1])
	by mx0a-0024c301.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54GDwJbr004254;
	Fri, 16 May 2025 11:25:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps12202023;
	 bh=oq2cJkmBl2erMItwHzjss1UbQikvY96/Ul2hU7h5i0U=; b=V+IWWTqOu2M6
	WoMBQQAbNmCzG4DMC401MKXNHsZYmvwflwJS5FSlhBvRSGJZLkE5c2/pqfrANLsL
	ejqYPpD1CGtd+aBVl2MubPDHZW0l3lI3O/kZ+yUvTPNb7q1CC96qOSe/4Una90yu
	P9m/iHiiy/RZjt17XIQozpu6lAkVs28rQHDi7rAXUQoX/CqzOkA2cKfcj8XXO8nq
	Qfjpi75FRTGq0d/U+Sk5aQEVZqJt9PlPvIy5rLCZCIOk2GyXFcfscOURYjPQ9NwA
	+kWkZ+sutrHrSFW4z9bHp4pIGymiusqbENNlaRNN/T6O/t35YyTcQzLTuSHvjQ2K
	88L0z4VxdA==
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2045.outbound.protection.outlook.com [104.47.73.45])
	by mx0a-0024c301.pphosted.com (PPS) with ESMTPS id 46mbcjh70r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 May 2025 11:25:29 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XpsyyIQgcMM0BSGuBIFSBrGfPktvpXP2QehZlMuTtE3w6HhN8pXGLm7rWsoNzfZLYWN4LdWPxaXXFA6lfrvwxQCcxwW+hHby/O5MQ+Am3S0BsNPuew5CNj8fba0Jdet0eD3PxFGwdFveSgWJ3BN4QqP3AQgT47LTL/VgWeHcmgjqht6HkxvVnmx4wAsItwB/hev7OyYRLEIK7oucQO6kwUk+u+32bJcFY702CvQxXDmiDobbekKvQD1Ux2Xlo7ueN3xGzc5fUy1zQXHb4VPa3EZlIyeiz4uni8lPKHza6xL8bkg0IGAZWnqVVi60GV8Dc4qlyxzEiZU3Nz+3b3Ot8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oq2cJkmBl2erMItwHzjss1UbQikvY96/Ul2hU7h5i0U=;
 b=LIa3bwmwYxdQLcEy7GpayDuoGxXy9dQQCS7hl1mj8THTjEM2NEaw2FG5UdpDr3w/w2lR940mGgVbU4YMZlsbOyLg5mLiMXmChfnCU4Fuhg1OZjoeQxaaRfh21a9HkOY+MNrCs0L9V5P0NFRDu5ry9XltDKzn6orxu+s2plqE8lQUh4AiWRsu4eRZKwilb6F2/LBfP+wGKFdECgKrAcr7tED1WWTYNRLkTQPPZWP+F4hHu7Ru3Am3IbnjleXZ3V7Cwry8FfOqLv2sYVBseXWMnXpoz2FJMpWKX6c6tbvB5vWVGPSNxUF80OQxsgvM2tPaZ1V8eXqJ+WLQZmfJ6AqNog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silabs.com; dmarc=pass action=none header.from=silabs.com;
 dkim=pass header.d=silabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oq2cJkmBl2erMItwHzjss1UbQikvY96/Ul2hU7h5i0U=;
 b=gGd2yl5Q32oGEEW3kNm8Yw8O3s8NFUHZHIvsQHE7lZmHGzZgkpdWkesh+SLt9cLlHA0gPFPMYoa+RG4YIBegM1CFRT+2LN4h3C+z+KAgrTFpFw/GMbWoYh4l1U7FUHMfjIxkGP0rUm6U85+kO+dcWAhJl2gN901tHHWOQXAwzQk=
Received: from DS0PR11MB8205.namprd11.prod.outlook.com (2603:10b6:8:162::17)
 by CO1PR11MB5091.namprd11.prod.outlook.com (2603:10b6:303:6c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Fri, 16 May
 2025 16:25:24 +0000
Received: from DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::c508:9b04:3351:524a]) by DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::c508:9b04:3351:524a%4]) with mapi id 15.20.8699.026; Fri, 16 May 2025
 16:25:24 +0000
Date: Fri, 16 May 2025 12:25:21 -0400
Message-Id: <D9XQ42C56TUG.2VXDA4CVURNAM@silabs.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
From: =?utf-8?q?Damien_Ri=C3=A9gel?= <damien.riegel@silabs.com>
X-Mailer: aerc 0.20.1
References: <20250512012748.79749-1-damien.riegel@silabs.com>
 <6fea7d17-8e08-42c7-a297-d4f5a3377661@lunn.ch>
 <D9VCEGBQWBW8.3MJCYYXOZHZNX@silabs.com>
 <f1a4ab5a-f2ce-4c94-91eb-ab81aea5b413@lunn.ch>
 <D9W93CSVNNM0.F14YDBPZP64O@silabs.com>
 <2025051551-rinsing-accurate-1852@gregkh>
 <D9WTONSVOPJS.1DNQ703ATXIN1@silabs.com>
 <2025051612-stained-wasting-26d3@gregkh>
In-Reply-To: <2025051612-stained-wasting-26d3@gregkh>
X-ClientProxiedBy: YQZPR01CA0065.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:88::20) To DS0PR11MB8205.namprd11.prod.outlook.com
 (2603:10b6:8:162::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8205:EE_|CO1PR11MB5091:EE_
X-MS-Office365-Filtering-Correlation-Id: 0bd71dc1-2d2d-402e-5d84-08dd94964296
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?dm43bjRXV0NBcTRXbUM0eXNUZmFoUDIyU3VVY0lMNlhIUlBaZUlUSVoxdnVE?=
 =?utf-8?B?L01zVVF1Z2sxditDM01wbU56R2F2eks5RTFpWXREU0YxWVFWbXZiNVRWM29q?=
 =?utf-8?B?U2pRZWYxSDlFVGpKNW9pNEE1NlFnandzRS95T2ZjV0xFT1hhZng0VFdHL0Vh?=
 =?utf-8?B?TjhrMmJJM2ZGVktzRndJWGlCVWhFMXlqU0QyL2hIKzlCK21oMkVqcjdlTCtC?=
 =?utf-8?B?SzhlTnQrK1JxYThUTjVacnZvcEJmM1ZWaFVpSjRoMTlYZ3ZuY294M3ZmdStS?=
 =?utf-8?B?RmFHY0laK2tqbkwwdDVaa0pIeTNaa3l3dWpxNFpmc2ZwanJXZ1p2clYxOWhD?=
 =?utf-8?B?Rkx4L1I3a2RHUmw0WkczU2wrY2UvTXpKRDFUZjNoZXYyS2dTTFFOUWdCNWFH?=
 =?utf-8?B?UFAvY2o3Y0J2Y0tqNjdvT3FpZllONzhDMHJSK2o5b1ZBVlo2ZHJsNVhzN0dG?=
 =?utf-8?B?NnlTSlZGUG9rSklqMVlxY2QxemV2V0hTWUsxdlY0bnRIeHBEUjJiM0xuaUFG?=
 =?utf-8?B?djlQT3NrazhVSVVDckNJamV6RU9DYmU3eUkwODgyazFpYVMxWDFLaERyOC9j?=
 =?utf-8?B?SUNlME9Ea2EwbUVwV2RJaUtLNVdtV1FqU3llS2F4dFlXMmNTQWhTQWRIby9J?=
 =?utf-8?B?ZnZWbHVZMkRpOHpFbitrM25JREtXT2FzS29VVUI0eHpPQXN6dU1BN2dwKzRI?=
 =?utf-8?B?RXpRNG41TVdxL2tSbHVQYVd0Y0NBSTNRK3FhZnlncURDVmplc2plRncvSFRl?=
 =?utf-8?B?LzVvUXBzRXRtQkxSSWlnei9zR3RUQk1UeVYzNkhKU0MvN0ZGNmU2SG9ZYmhw?=
 =?utf-8?B?RndGY2ttVEU2d1JMNmZPdkwwN0FpdGk4S0FCdU91OGc3ZFBYTnlOcnRXek15?=
 =?utf-8?B?TytQMFRVV2NTMFJsUG9mWnF6N2szT2dJM0NYUFhHQlNLejFyUzhrU25BMHo1?=
 =?utf-8?B?RDBkaFlBTFd5UFJTRUdaUzcxWHMwR0JLc3EyWGkwV25wbHI0RFJaMWpFdnN2?=
 =?utf-8?B?Ky9FR0NkUExoUEhnNlppRENidERFdkxSM3QyOHdLd2VMR0VXLy9lb3UvOGNN?=
 =?utf-8?B?cWt5WXh4OE42cUhPV2V5bDNHSUNCaGtqUHZwZEZ1ckdwZGtEVjBYMHArcHM3?=
 =?utf-8?B?dEFzMHJwazJyak11U0tlc0syZlF3UkR1c0gzS0tTVmM1OC9QeE9mNWFjRko2?=
 =?utf-8?B?RTIwakZLRWRaa2I4RC9Cc3hvYXBOUXB6bFRvK1hlRHRUMTd5c1pqOUwvV0sw?=
 =?utf-8?B?WW5JeDZYRjlYL2d4U2EyVk1VZ1hKa1REODk4MTArY0xQY0d4OUVaSm1iTFBS?=
 =?utf-8?B?VWN0aE9ISWR6VCs2dzV4ZFVyeGE2emFBV3JwZ0hmeWdIcEFEMFVoTndCUVNp?=
 =?utf-8?B?UWpucEE4MkdFWE5mN0ZwMTJCL2ZWVmRzT2VtWlBkUEJKajFlSUNKaVYxYlFl?=
 =?utf-8?B?UjMrdmtFWEFPOWl6UWdyVGxnYTBEZnlTSGhXVkxJai9nb0Vka0gvUmhBSURB?=
 =?utf-8?B?V3pDS1BGalE0WDNudjBWOVFzbTZpUXNkUFF6ZGJWaEcwKzhia0NTRGdaRGFk?=
 =?utf-8?B?bFNCOXAwZ3R0ZjNIN0JSejNjR2xnQXlSeDNmenJqQk9PUkxOVjdZeDBiOXRO?=
 =?utf-8?B?NWE5SnMwMjlUVURwTkdTZk5weVRRanBNWFlTdFczeWszTWxoaTRkQlpJMzVN?=
 =?utf-8?B?TkQwVkhmMHdySTByR0ZoUVVKejhMT0xOY2MxSUhiRGx3YXhZSThXdGxJNFNp?=
 =?utf-8?B?d0FMNllGc2MzYUhkYnB1VU03dWQvNFl6eElmSTVkSll1a0J3WnNybFV1UlVM?=
 =?utf-8?Q?yC7s12qiaOBWfZMQKdsIUbfPlnV7iTXYzvngE=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8205.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Q3IxcmFXd2JXTDRXbHdEcUFOM25FUjJkWlNsT3JKZGlMWUZFSVNucE1XMk12?=
 =?utf-8?B?b2Nab1p1MmlycEpWYlF2Z04yRXZqc2dXS2FMNzFKUEpDS0ZoaUk1bjA5SEZz?=
 =?utf-8?B?OE54Ull2L1JGcGJQNEcwOEhSZEpDTGRWbWxFNGszNEU0OXRCc3R1ajZBQUVa?=
 =?utf-8?B?dVpHeFV4V0hlWnJIUHdKa0lpOU45SjJrRFRUT3JYTlc5UVpkRzlWUlEvejN0?=
 =?utf-8?B?ZnRwZEVuYUN6cm5NRUpTTk1Dbm02VVNQUU15aURrakh2SFdZdURoOGMxaHVG?=
 =?utf-8?B?RlBVYlh1TnJzMlhGOHZqNjJCRlJPSXdPZWhuRUd1dC9SZWFVL1NNR3RtQXBJ?=
 =?utf-8?B?Rlp4Z1FjSDhHK1Y2NGpjM0pHdHdjMkUxZVRTZ1BTKy9GYmpRa0NoWjhBSmNL?=
 =?utf-8?B?YU5FYjFQa3VhTXZGelIxQWRNV0pZdW5sUldwdGY4czJmQlBjcHJJUmt0dC9V?=
 =?utf-8?B?V0tObW80czVKV0FtMmlxL1UrQWJmSnA5anVOWlJiNjRiWkpMZkN6WTVWMWRm?=
 =?utf-8?B?T1dTODNHQ3ZjRVNBTDU0elovQ1ZxZ2tBZ2lkd3Nnd2dTSHZJQ3cxMGRzdU5G?=
 =?utf-8?B?cG9waHYvZzVxTTBpYUpUSmpDQXJGN3VjbFBoUHF0QUNjL2w5Q2piK1JHTDFM?=
 =?utf-8?B?RHJOQk12aG1DNVpZRUMvSGxCbnd1Qmo2TW0wbXRtdlF1UmtRZWxvaTFNa2VY?=
 =?utf-8?B?VDNvckQ0SEFoeHdYbzZmQThlVDk4dXlOcTZETXNpaGNXLyszQlBucEI5NGp2?=
 =?utf-8?B?U09IZ29GaXhrdUpZdlI3MWoyVDcrdG44Mmd2c1pSc1Q2OGR4NzErQnlrWHJC?=
 =?utf-8?B?QmlXTzYvRkpwR1ZTZlQreGNzWmE1QXFjbEsvMnFNcXhvUWs3cUpmMWs1aGR5?=
 =?utf-8?B?YlZNQWtEVTVxeTc4WC9uV2RkMmpZVWZiVUFZT0RYTUdKTGZ4dzZrMHlybzRD?=
 =?utf-8?B?U0JVL2loYzcxWlJqcW1UTkNEYkFsblV2ZkVKQWE5RFJETWljTDdZTGFqRVBO?=
 =?utf-8?B?TmRaUEFpM0REaW56ZmZLNkZkTG1ramtFOHVaTmR2c3FpNnliTzVNRXV0NjJE?=
 =?utf-8?B?TnBmeC9kdWhSY3FheDRSVHVoSnlSR0pFZnI0eEFGaHBLemNudFRvdkM2Z1dI?=
 =?utf-8?B?VnNlN3M0c2ZQZ05BbEg2TEZMQlNlblI2QStxNEs5eTR0MklOZkVWemkxNVk5?=
 =?utf-8?B?K285MUFRWmdGOWdpWTd2UjNMTVZadlRxaUxQZU81clNXYmRab1RKQzdFMURr?=
 =?utf-8?B?eXlSVlV3dUJTM0VRTFM5YUh2akM0SitkZG1HdFJiS3NiVmh2ajhNb2pCNmFp?=
 =?utf-8?B?RVFEc09SKzUzR0JnTTlxVHhXRjE3cjBPa05QTVhlQzVCdEREcDNNOEtFVlpB?=
 =?utf-8?B?dUNOaVFLN3YvTUpJM2VwWjZkYWdQR2VOSzJCUkU5N2MrQTJNUG83LytOeGdR?=
 =?utf-8?B?dGpHVFBEbWVBdlNRck0xQzZFeEtGdy9BN1NDSXpuc1pnbG56emx3MlJCeERi?=
 =?utf-8?B?d3g4QnNRUCtpWUgwdXE0RERScDJOOXdTOGFyRkZzc0hZTGkwYXhsTG9MUGJY?=
 =?utf-8?B?d0FYSndQMy9sMndOa1dLWUh2cWZXbnpSWlcwOGpFeFE4K2FJbmwwWFU3RjBQ?=
 =?utf-8?B?L2ZMd1FmNkJpRXRhVWtFVXZnbFl4Zll0akQ1V0FsYmpBakdZamg5bXBGMzdJ?=
 =?utf-8?B?cnZ2TEcrSUJjYStEVUJZeGRGcDF1eHo4UitxRS95dzQvMElnN3BwY0VKU05L?=
 =?utf-8?B?eU9GWHRkZW1zRzZFN2U4VDRDRGMrbnlPY2RoaDFaOXE0c3Z0eG51MXlWMW5X?=
 =?utf-8?B?MElRMTJNUythUWRYbjczOFQ5SThSWUxJUjRYQ3NybFNoRFhsdGJaUllncDhy?=
 =?utf-8?B?YjFDbmlONFlHRlhGL3ZIQ25ieDVhK3psLzIwaWljZ1J0NFVaem56S3hMcndG?=
 =?utf-8?B?aGFzcXcwTWVpeVNHTCtsdU5udzhER1U1a1lJcTh3emNrak50M0RMaGNoaVFm?=
 =?utf-8?B?ZnFZdDh0Y1dIM01KZ0ZLQzVYdXVrbngyZHRBd1FLeEtvN000djBnSlN0dkhI?=
 =?utf-8?B?WkUxVXpEajN3NTNHc0l2QUtPVTV5eFc0NGl3WWFKNWtDVit6aExKUEJDbkNV?=
 =?utf-8?Q?2Il2yNfu44tMFJ1KkLS1qhxNm?=
X-OriginatorOrg: silabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bd71dc1-2d2d-402e-5d84-08dd94964296
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8205.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2025 16:25:24.2316
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 54dbd822-5231-4b20-944d-6f4abcd541fb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LYYrnx/1qD3X6Cfh5ZQzPcA7YLeGnWESVDYOD+Ht9nJW9okWIR2Myf6YLzN6r+hy2whVsSNoZ/dpjqfinEb4ZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5091
X-Authority-Analysis: v=2.4 cv=ItQecK/g c=1 sm=1 tr=0 ts=682766f9 cx=c_pps a=o99l/OlIsmxthp48M8gYaQ==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=M51BFTxLslgA:10 a=i1IsUcr2s-wA:10 a=2Fbpa9VpAAAA:8 a=XYAwZIGsAAAA:8 a=sozttTNsAAAA:8 a=VwQbUJbxAAAA:8 a=2AEO0YjSAAAA:8 a=UZifkUOPARptdXYptkgA:9 a=QEXdDO2ut3YA:10 a=AsRvB5IyE59LPD4syVNT:22 a=E8ToXWR_bxluHZ7gmE-Z:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE2MDE2MCBTYWx0ZWRfX1Dn5qMgHDm08 Hl+Uc7MgKxWJjsVjdZ2hPrmNd7vvSuGkvEDXtaiRn4uC3ARLPYJWwJ7N5x0e6urI9IT1v/v/8QY C/7Yb6fDra0S6JkAOZ2tkNnaS5HJ4t7jPpcaFMhu/TobuINA6HjuJTfxSkboosJXgMDCUMQOCSp
 PcKhkUIU2AWYfHpa8oSVWipVKWj6q3c0jqT8JBDnspQbEL+gcGDdTNqehVxqPX1+hnksdAgEnZg 2tydAizI4eM4G6DyStZYwH+8TfkbloQ2kL0cDkFBx+O2sYP8CO2jfrlOLtcYvZlCGSC8sBCaAA0 9dVDobYq2hrpI2WNLkbUVKT9SwMuuSabqV2fuasc6kNiU/3MFEUMIiN+t+Y3Hqv18YAE+7cqZ5l
 tixw+j4UGiKQ9BXv5eNcCHntjScB9WO6M6Ob/eIKoyfLI/JxzeiDkKYeBK9EKMQtLJJft+hW
X-Proofpoint-ORIG-GUID: DCkQc5Ljto0OF18XMcdZFWYsm6ux-IsU
X-Proofpoint-GUID: DCkQc5Ljto0OF18XMcdZFWYsm6ux-IsU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-16_05,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 clxscore=1015 impostorscore=0 mlxlogscore=999
 suspectscore=0 priorityscore=1501 phishscore=0 malwarescore=0 mlxscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2505070000
 definitions=main-2505160160
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: A12643F648
X-Spamd-Bar: -------
X-Spamd-Result: default: False [-7.50 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[silabs.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:148.163.149.154];
	R_DKIM_ALLOW(-0.20)[silabs.com:s=pps12202023,silabs.com:s=selector1];
	MIME_GOOD(-0.10)[text/plain];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:26211, ipnet:148.163.148.0/22, country:US];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[netdev,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DWL_DNSWL_BLOCKED(0.00)[silabs.com:dkim];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	DNSWL_BLOCKED(0.00)[148.163.149.154:from,2603:10b6:8:162::17:received,104.47.73.45:received];
	DKIM_TRACE(0.00)[silabs.com:+]
X-Rspamd-Action: no action
X-MailFrom: Damien.Riegel@silabs.com
X-Mailman-Rule-Hits: implicit-dest
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
Message-ID-Hash: AN2TMWPKD4A2VJ3Q62UCQHSFUZD4APIF
X-Message-ID-Hash: AN2TMWPKD4A2VJ3Q62UCQHSFUZD4APIF
X-Mailman-Approved-At: Fri, 16 May 2025 16:33:21 +0000
CC: Andrew Lunn <andrew@lunn.ch>, Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Silicon Labs Kernel Team <linux-devel@silabs.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [RFC net-next 00/15] Add support for Silicon Labs CPC
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/AN2TMWPKD4A2VJ3Q62UCQHSFUZD4APIF/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gRnJpIE1heSAxNiwgMjAyNSBhdCAzOjUxIEFNIEVEVCwgR3JlZyBLcm9haC1IYXJ0bWFuIHdy
b3RlOg0KPiBPbiBUaHUsIE1heSAxNSwgMjAyNSBhdCAxMTowMDozOUFNIC0wNDAwLCBEYW1pZW4g
UmnDqWdlbCB3cm90ZToNCj4+IE9uIFRodSBNYXkgMTUsIDIwMjUgYXQgMzo0OSBBTSBFRFQsIEdy
ZWcgS3JvYWgtSGFydG1hbiB3cm90ZToNCj4+ID4gT24gV2VkLCBNYXkgMTQsIDIwMjUgYXQgMDY6
NTI6MjdQTSAtMDQwMCwgRGFtaWVuIFJpw6lnZWwgd3JvdGU6DQo+PiA+PiBPbiBUdWUgTWF5IDEz
LCAyMDI1IGF0IDU6NTMgUE0gRURULCBBbmRyZXcgTHVubiB3cm90ZToNCj4+ID4+ID4gT24gVHVl
LCBNYXkgMTMsIDIwMjUgYXQgMDU6MTU6MjBQTSAtMDQwMCwgRGFtaWVuIFJpw6lnZWwgd3JvdGU6
DQo+PiA+PiA+PiBPbiBNb24gTWF5IDEyLCAyMDI1IGF0IDE6MDcgUE0gRURULCBBbmRyZXcgTHVu
biB3cm90ZToNCj4+ID4+ID4+ID4gT24gU3VuLCBNYXkgMTEsIDIwMjUgYXQgMDk6Mjc6MzNQTSAt
MDQwMCwgRGFtaWVuIFJpw6lnZWwgd3JvdGU6DQo+PiA+PiA+PiA+PiBIaSwNCj4+ID4+ID4+ID4+
DQo+PiA+PiA+PiA+Pg0KPj4gPj4gPj4gPj4gVGhpcyBwYXRjaHNldCBicmluZ3MgaW5pdGlhbCBz
dXBwb3J0IGZvciBTaWxpY29uIExhYnMgQ1BDIHByb3RvY29sLA0KPj4gPj4gPj4gPj4gc3RhbmRp
bmcgZm9yIENvLVByb2Nlc3NvciBDb21tdW5pY2F0aW9uLiBUaGlzIHByb3RvY29sIGlzIHVzZWQg
YnkgdGhlDQo+PiA+PiA+PiA+PiBFRlIzMiBTZXJpZXMgWzFdLiBUaGVzZSBkZXZpY2VzIG9mZmVy
IGEgdmFyaWV0eSBmb3IgcmFkaW8gcHJvdG9jb2xzLA0KPj4gPj4gPj4gPj4gc3VjaCBhcyBCbHVl
dG9vdGgsIFotV2F2ZSwgWmlnYmVlIFsyXS4NCj4+ID4+ID4+ID4NCj4+ID4+ID4+ID4gQmVmb3Jl
IHdlIGdldCB0b28gZGVlcCBpbnRvIHRoZSBkZXRhaWxzIG9mIHRoZSBwYXRjaGVzLCBwbGVhc2Ug
Y291bGQNCj4+ID4+ID4+ID4geW91IGRvIGEgY29tcGFyZS9jb250cmFzdCB0byBHcmV5YnVzLg0K
Pj4gPj4gPj4NCj4+ID4+ID4+IFRoYW5rIHlvdSBmb3IgdGhlIHByb21wdCBmZWVkYmFjayBvbiB0
aGUgUkZDLiBXZSB0b29rIGEgbG9vayBhdCBHcmV5YnVzDQo+PiA+PiA+PiBpbiB0aGUgcGFzdCBh
bmQgaXQgZGlkbid0IHNlZW0gdG8gZml0IG91ciBuZWVkcy4gT25lIG9mIHRoZSBtYWluIHVzZQ0K
Pj4gPj4gPj4gY2FzZSB0aGF0IGRyb3ZlIHRoZSBkZXZlbG9wbWVudCBvZiBDUEMgd2FzIHRvIHN1
cHBvcnQgV2lGaSAoaW4NCj4+ID4+ID4+IGNvZXhpc3RlbmNlIHdpdGggb3RoZXIgcmFkaW8gc3Rh
Y2tzKSBvdmVyIFNESU8sIGFuZCBnZXQgdGhlIG1heGltdW0NCj4+ID4+ID4+IHRocm91Z2hwdXQg
cG9zc2libGUuIFdlIGNvbmNsdWRlZCB0aGF0IHRvIGFjaGlldmUgdGhpcyB3ZSB3b3VsZCBuZWVk
DQo+PiA+PiA+PiBwYWNrZXQgYWdncmVnYXRpb24sIGFzIHNlbmRpbmcgb25lIGZyYW1lIGF0IGEg
dGltZSBvdmVyIFNESU8gaXMNCj4+ID4+ID4+IHdhc3RlZnVsLCBhbmQgbWFuYWdpbmcgUmFkaW8g
Q28tUHJvY2Vzc29yIGF2YWlsYWJsZSBidWZmZXJzLCBhcyBzZW5kaW5nDQo+PiA+PiA+PiBmcmFt
ZXMgdGhhdCB0aGUgUkNQIGlzIG5vdCBhYmxlIHRvIHByb2Nlc3Mgd291bGQgZGVncmFkZSBwZXJm
b3JtYW5jZS4NCj4+ID4+ID4+DQo+PiA+PiA+PiBHcmV5YnVzIGRvbid0IHNlZW0gdG8gb2ZmZXIg
dGhlc2UgY2FwYWJpbGl0aWVzLiBJdCBzZWVtcyB0byBiZSBtb3JlDQo+PiA+PiA+PiBnZWFyZWQg
dG93YXJkcyBpbXBsZW1lbnRpbmcgUlBDLCB3aGVyZSB0aGUgaG9zdCB3b3VsZCBzZW5kIGEgY29t
bWFuZCwNCj4+ID4+ID4+IGFuZCB0aGVuIHdhaXQgZm9yIHRoZSBkZXZpY2UgdG8gZXhlY3V0ZSBp
dCBhbmQgdG8gcmVzcG9uZC4gRm9yIEdyZXlidXMnDQo+PiA+PiA+PiBwcm90b2NvbHMgdGhhdCBp
bXBsZW1lbnQgc29tZSAic3RyZWFtaW5nIiBmZWF0dXJlcyBsaWtlIGF1ZGlvIG9yIHZpZGVvDQo+
PiA+PiA+PiBjYXB0dXJlLCB0aGUgZGF0YSBzdHJlYW1zIGdvIHRvIGFuIEkyUyBvciBDU0kgaW50
ZXJmYWNlLCBidXQgaXQgZG9lc24ndA0KPj4gPj4gPj4gc2VlbSB0byBnbyB0aHJvdWdoIGEgQ1Bv
cnQuIFNvIGl0IHNlZW1zIHRvIGFjdCBhcyBhIGJhY2tib25lIHRvIGNvbm5lY3QNCj4+ID4+ID4+
IENQb3J0cyB0b2dldGhlciwgYnV0IGhpZ2gtdGhyb3VnaHB1dCB0cmFuc2ZlcnMgaGFwcGVuIG9u
IG90aGVyIHR5cGVzIG9mDQo+PiA+PiA+PiBsaW5rcy4gQ1BDIGlzIG1vcmUgYWJvdXQgbW92aW5n
IGRhdGEgb3ZlciBhIHBoeXNpY2FsIGxpbmssIGd1YXJhbnRlZWluZw0KPj4gPj4gPj4gb3JkZXJl
ZCBkZWxpdmVyeSBhbmQgYXZvaWRpbmcgdW5uZWNlc3NhcnkgdHJhbnNtaXNzaW9ucyBpZiByZW1v
dGUNCj4+ID4+ID4+IGRvZXNuJ3QgaGF2ZSB0aGUgcmVzb3VyY2VzLCBpdCdzIG11Y2ggbG93ZXIg
bGV2ZWwgdGhhbiBHcmV5YnVzLg0KPj4gPj4gPg0KPj4gPj4gPiBBcyBpcyBzYWlkLCBpIGRvbid0
IGtub3cgR3JleWJ1cyB0b28gd2VsbC4gSSBob3BlIGl0cyBNYWludGFpbmVycyBjYW4NCj4+ID4+
ID4gY29tbWVudCBvbiB0aGlzLg0KPj4gPj4gPg0KPj4gPj4gPj4gPiBBbHNvLCB0aGlzIHBhdGNo
IGFkZHMgQmx1ZXRvb3RoLCB5b3UgdGFsayBhYm91dCBaLVdhdmUgYW5kIFppZ2JlZS4gQnV0DQo+
PiA+PiA+PiA+IHRoZSBFRlIzMiBpcyBhIGdlbmVyYWwgcHVycG9zZSBTb0MsIHdpdGggSTJDLCBT
UEksIFBXTSwgVUFSVC4gR3JleWJ1cw0KPj4gPj4gPj4gPiBoYXMgc3VwcG9ydCBmb3IgdGhlc2Us
IGFsdGhvdWdoIHRoZSBjb2RlIGlzIGN1cnJlbnQgaW4gc3RhZ2luZy4gQnV0DQo+PiA+PiA+PiA+
IGZvciBzdGFnaW5nIGNvZGUsIGl0IGlzIGFjdHVhbGx5IHByZXR0eSBnb29kLg0KPj4gPj4gPj4N
Cj4+ID4+ID4+IEkgYWdyZWUgd2l0aCB5b3UgdGhhdCB0aGUgRUZSMzIgaXMgYSBnZW5lcmFsIHB1
cnBvc2UgU29DIGFuZCBleHBvc2luZw0KPj4gPj4gPj4gYWxsIGF2YWlsYWJsZSBwZXJpcGhlcmFs
cyB3b3VsZCBiZSBncmVhdCwgYnV0IG1vc3QgY3VzdG9tZXJzIGJ1eSBpdCBhcw0KPj4gPj4gPj4g
YW4gUkNQIG1vZHVsZSB3aXRoIG9uZSBvciBtb3JlIHJhZGlvIHN0YWNrcyBlbmFibGVkLCBhbmQg
dGhhdCdzIHRoZQ0KPj4gPj4gPj4gc2l0dWF0aW9uIHdlJ3JlIHRyeWluZyB0byBhZGRyZXNzLiBN
YXliZSBJIGludHJvZHVjZWQgYSBmcmFtZXdvcmsgd2l0aA0KPj4gPj4gPj4gY3VzdG9tIGJ1cywg
ZHJpdmVycyBhbmQgZW5kcG9pbnRzIHdoZXJlIGl0IHdhcyB1bm5lY2Vzc2FyeSwgdGhlIGdvYWwg
aXMNCj4+ID4+ID4+IG5vdCB0byBiZSBzdXBlciBnZW5lcmljIGJ1dCBvbmx5IHRvIHN1cHBvcnQg
Y29leGlzdGVuY2Ugb2Ygb3VyIHJhZGlvDQo+PiA+PiA+PiBzdGFja3MuDQo+PiA+PiA+DQo+PiA+
PiA+IFRoaXMgbGVhZHMgdG8gbXkgbmV4dCBwcm9ibGVtLg0KPj4gPj4gPg0KPj4gPj4gPiBodHRw
czovL3d3dy5ub3JkaWNzZW1pLmNvbS8tL21lZGlhL1NvZnR3YXJlLWFuZC1vdGhlci1kb3dubG9h
ZHMvUHJvZHVjdC1CcmllZnMvblJGNTM0MC1Tb0MtUEIucGRmDQo+PiA+PiA+IE5vcmRpYyBTZW1p
Y29uZHVjdG9yIGhhcyB3aGF0IGFwcGVhcnMgdG8gYmUgYSBzaW1pbGFyIGRldmljZS4NCj4+ID4+
ID4NCj4+ID4+ID4gaHR0cHM6Ly93d3cubWljcm9jaGlwLmNvbS9lbi11cy9wcm9kdWN0cy93aXJl
bGVzcy1jb25uZWN0aXZpdHkvYmx1ZXRvb3RoLWxvdy1lbmVyZ3kvbWljcm9jb250cm9sbGVycw0K
Pj4gPj4gPiBNaWNyb2NoaXAgaGFzIGEgc2ltaWxhciBkZXZpY2UgYXMgd2VsbC4NCj4+ID4+ID4N
Cj4+ID4+ID4gaHR0cHM6Ly93d3cudGkuY29tL3Byb2R1Y3QvQ0MyNjc0UjEwDQo+PiA+PiA+IFRJ
IGhhcyBhIHNpbWlsYXIgZGV2aWNlLg0KPj4gPj4gPg0KPj4gPj4gPiBBbmQgbWF5YmUgdGhlcmUg
YXJlIG90aGVycz8NCj4+ID4+ID4NCj4+ID4+ID4gQXJlIHdlIGdvaW5nIHRvIGdldCBhIFNpbGFi
cyBDUEMsIGEgTm9yZGljIENQQywgYSBNaWNyb2NoaXAgQ1BDLCBhIFRJDQo+PiA+PiA+IENQQywg
YW5kIGFuIEFDTUUgQ1BDPw0KPj4gPj4gPg0KPj4gPj4gPiBIb3cgZG8gd2UgZW5kIHVwIHdpdGgg
b25lIGltcGxlbWVudGF0aW9uPw0KPj4gPj4gPg0KPj4gPj4gPiBNYXliZSBHcmV5YnVzIGRvZXMg
bm90IGN1cnJlbnRseSBzdXBwb3J0IHlvdXIgc3RyZWFtaW5nIHVzZSBjYXNlIHRvbw0KPj4gPj4g
PiB3ZWxsLCBidXQgaXQgaXMgYXQgbGVhc3QgdmVuZG9yIG5ldXRyYWwuIENhbiBpdCBiZSBleHRl
bmRlZCBmb3INCj4+ID4+ID4gc3RyZWFtaW5nPw0KPj4gPj4NCj4+ID4+IEkgZ2V0IHRoZSBzZW50
aW1lbnQgdGhhdCB3ZSBkb24ndCB3YW50IGV2ZXJ5IHNpbmdsZSB2ZW5kb3IgdG8gcHVzaCB0aGVp
cg0KPj4gPj4gb3duIHByb3RvY29scyB0aGF0IGFyZSBldmVyIHNvIHNsaWdodGx5IGRpZmZlcmVu
dC4gVG8gYmUgaG9uZXN0LCBJIGRvbid0DQo+PiA+PiBrbm93IGlmIEdyZXlidXMgY2FuIGJlIGV4
dGVuZGVkIGZvciB0aGF0IHVzZSBjYXNlLCBvciBpZiBpdCdzIHNvbWV0aGluZw0KPj4gPj4gdGhl
eSBhcmUgaW50ZXJlc3RlZCBpbiBzdXBwb3J0aW5nLiBJJ3ZlIHN1YnNjcmliZWQgdG8gZ3JleWJ1
cy1kZXYgc28NCj4+ID4+IGhvcGVmdWxseSBteSBlbWFpbCB3aWxsIGdldCB0aHJvdWdoIHRoaXMg
dGltZSAocHJldmlvdXMgb25lIGlzIHBlbmRpbmcNCj4+ID4+IGFwcHJvdmFsKS4NCj4+ID4+DQo+
PiA+PiBVbmZvcnR1bmF0ZWx5LCB3ZSdyZSBkZWVwIGRvd24gdGhlIENQQyByb2FkLCBlc3BlY2lh
bGx5IG9uIHRoZSBmaXJtd2FyZQ0KPj4gPj4gc2lkZS4gQmxhbWUgb24gbWUgZm9yIG5vdCBzZW5k
aW5nIHRoZSBSRkMgc29vbmVyIGFuZCBnZXR0aW5nIGZlZWRiYWNrDQo+PiA+PiBlYXJsaWVyLCBi
dXQgaWYgd2UgaGF2ZSB0byBtYXNzaXZlbHkgY2hhbmdlIG91ciBjb3Vyc2Ugb2YgYWN0aW9uIHdl
IG5lZWQNCj4+ID4+IHNvbWUgZGVncmVlIG9mIGNvbmZpZGVuY2UgdGhhdCB0aGlzIGlzIGEgdmlh
YmxlIGFsdGVybmF0aXZlIGZvcg0KPj4gPj4gYWNoaWV2aW5nIGhpZ2gtdGhyb3VnaHB1dCBmb3Ig
V2lGaSBvdmVyIFNESU8uIEkgd291bGQgcmVhbGx5IHZhbHVlIGFueQ0KPj4gPj4gaW5wdXQgZnJv
bSB0aGUgR3JleWJ1cyBmb2xrcyBvbiB0aGlzLg0KPj4gPg0KPj4gPiBTbyB3aGF0IHlvdSBhcmUg
bG9va2luZyBmb3IgaXMgYSBzdGFuZGFyZCB3YXkgdG8gInR1bm5lbCIgU0RJTyBvdmVyIHNvbWUN
Cj4+ID4gb3RoZXIgcGh5c2ljYWwgdHJhbnNwb3J0LCByaWdodD8gIElmIHNvLCB0aGVuIHllcywg
cGxlYXNlIHVzZSBHcmV5YnVzIGFzDQo+PiA+IHRoYXQgaXMgZXhhY3RseSB3aGF0IGl0IHdhcyBk
ZXNpZ25lZCBmb3IuDQo+Pg0KPj4gTm8sIHdlIHdhbnQgdG8gdXNlIFNESU8gYXMgcGh5c2ljYWwg
dHJhbnNwb3J0LiBUbyB1c2UgdGhlIEdyZXlidXMNCj4+IHRlcm1pbm9sb2d5LCBvdXIgTUNVcyB3
b3VsZCBhY3QgYXMgbW9kdWxlcyB3aXRoIGEgc2luZ2xlIGludGVyZmFjZSwgYW5kDQo+PiB0aGF0
IGludGVyZmFjZSB3b3VsZCBoYXZlICJyYWRpbyIgYnVuZGxlcyBmb3IgZWFjaCBvZiB0aGUgc3Vw
cG9ydGVkDQo+PiBzdGFjay4NCj4+DQo+PiBTbyB3ZSB3YW50IHRvIGV4cG9zZSBvdXIgcmFkaW8g
c3RhY2tzIGluIExpbnV4IGFuZCBHcmV5YnVzIGRvZXNuJ3QNCj4+IGRlZmluZSBwcm90b2NvbHMg
Zm9yIHRoYXQsIHNvIHRoYXQncyBraW5kIG9mIHVuY2hhcnRlZCB0ZXJyaXRvcmllcyBhbmQNCj4+
IHdlIHdlcmUgd29uZGVyaW5nIGlmIEdyZXlidXMgd291bGQgYmUgdGhlIHJpZ2h0IHRvb2wgZm9y
IHRoYXQuIEkgaG9wZQ0KPj4gdGhlIHNpdHVhdGlvbiBpcyBhIGJpdCBjbGVhcmVyIG5vdy4NCj4N
Cj4gWWVzLCBncmV5YnVzIGRvZXMgbm90IGV4cG9zZSBhICJ3aWZpIiBwcm90b2NvbCBhcyB0aGF0
IGlzIHdheSB0b28gZGV2aWNlDQo+IHNwZWNpZmljLCBzb3JyeS4NCj4NCj4gU28gdGhpcyBqdXN0
IHdvdWxkIGJlIGxpa2UgYW55IG90aGVyIG5vcm1hbCBTRElPIHdpZmkgZGV2aWNlIHRoZW4sDQo+
IHNob3VsZG4ndCBiZSBhbnl0aGluZyBzcGVjaWFsLCByaWdodD8NCg0KV2lmaSBpcyBqdXN0IG9u
ZSBvZiB0aGUgcmFkaW8gc3RhY2tzIHRoYXQgY2FuIGJlIHByZXNlbnQgYnV0IHRoZXJlIGNhbg0K
YmUgb3RoZXIgcmFkaW8gc3RhY2tzIHJ1bm5pbmcgb24gdGhlIHNhbWUgZGV2aWNlIGFuZCBzaGFy
aW5nIHRoZSBzYW1lDQpwaHlzaWNhbCB0cmFuc3BvcnQsIGxpa2UgQmx1ZXRvb3RoLCBaaWdiZWUs
IG9yIE9wZW5UaHJlYWQuIFRoZSBnb2FsIG9mDQpDUEMgKG91ciBjdXN0b20gcHJvdG9jb2wpIGlz
IHRvIG11bHRpcGxleCBhbGwgdGhlc2UgcHJvdG9jb2xzIG92ZXIgdGhlDQpzYW1lIHBoeXNpY2Fs
IGJ1cy4NCg0KSSB0aGluayBBbmRyZXcgcHVsbGVkIEdyZXlidXMgaW4gdGhlIGRpc2N1c3Npb24g
YmVjYXVzZSB0aGVyZSBpcyBzb21lDQpvdmVybGFwIGJldHdlZW4gR3JleWJ1cyBhbmQgQ1BDOg0K
ICAtIEdyZXlidXMgaGFzIGJ1bmRsZXMgYW5kIENQb3J0cywgQ1BDIG9ubHkgaGFzICJlbmRwb2lu
dHMiLCB3aGljaA0KICAgIHdvdWxkIGJlIHRoZSBlcXVpdmFsZW50IG9mIGEgYnVuZGxlIHdpdGgg
YSBzaW5nbGUgY3BvcnQNCiAgLSBkaXNjb3ZlcmFiaWxpdHkgb2YgR3JleWJ1cyBidW5kbGVzL0NQ
QyBlbmRwb2ludHMgYnkgdGhlIGhvc3QNCiAgLSBtdWx0aXBsZSBidW5kbGVzL2VuZHBvaW50cyBt
aWdodCBjb2V4aXN0IGluIHRoZSBzYW1lDQogICAgbW9kdWxlL0NQQy1lbmFibGVkIGRldmljZQ0K
ICAtIGJ1bmRsZXMvZW5kcG9pbnRzIGFyZSBpbmRlcGVuZGVudCBmcm9tIGVhY2ggb3RoZXIgYW5k
IGVhY2ggaGFzIGl0cw0KICAgIG93biBkZWRpY2F0ZWQgZHJpdmVyDQoNCkdyZXlidXMgZ29lcyBh
IHN0ZXAgZnVydGhlciBhbmQgc3BlY3Mgc29tZSBwcm90b2NvbHMgbGlrZSBHUElPIG9yIFVBUlQu
DQpDUEMgZG9lc24ndCBzcGVjIHdoYXQgZ29lcyBvdmVyIGVuZHBvaW50cyBiZWNhdXNlIGl0J3Mg
Z2VhcmVkIHRvd2FyZHMNCnJhZGlvIGFwcGxpY2F0aW9ucyBhbmQgYXMgeW91IHNhaWQsIGl0J3Mg
dmVyeSBkZXZpY2Uvc3RhY2sgc3BlY2lmaWMuDQpPbmNlIGFuIGVuZHBvaW50IGlzIGNvbm5lY3Rl
ZCwgQ1BDIGp1c3QgcGFzc2VzIGEgYmlkaXJlY3Rpb25uYWwgc3RyZWFtDQpvZiBkYXRhIGJldHdl
ZW4gdGhlIHR3byBlbmRzLCB3aGljaCBhcmUgZnJlZSB0byBkbyB3aGF0ZXZlciB0aGV5IHdhbnQN
CndpdGggaXQuIEEgZ29vZCBleGFtcGxlIG9mIHRoYXQgaXMgdGhlIGJsdWV0b290aCBkcml2ZXIg
dGhhdCdzIHBhcnQgb2YNCnRoaXMgUkZDIFsxXS4gSSBob3BlIG15IGV4cGxhbmF0aW9ucyBtYWtl
IHNlbnNlLg0KDQpbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbmV0ZGV2LzIwMjUwNTEyMDEy
NzQ4Ljc5NzQ5LTE2LWRhbWllbi5yaWVnZWxAc2lsYWJzLmNvbS9ULyN1DQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpncmV5YnVzLWRldiBtYWlsaW5nIGxp
c3QgLS0gZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpUbyB1bnN1YnNjcmliZSBzZW5kIGFu
IGVtYWlsIHRvIGdyZXlidXMtZGV2LWxlYXZlQGxpc3RzLmxpbmFyby5vcmcK
