Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B631AB795C
	for <lists+greybus-dev@lfdr.de>; Thu, 15 May 2025 01:16:53 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 85ABB459D8
	for <lists+greybus-dev@lfdr.de>; Wed, 14 May 2025 23:16:52 +0000 (UTC)
Received: from mx0b-0024c301.pphosted.com (mx0b-0024c301.pphosted.com [148.163.153.153])
	by lists.linaro.org (Postfix) with ESMTPS id C31AE44B07
	for <greybus-dev@lists.linaro.org>; Wed, 14 May 2025 22:52:47 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=silabs.com header.s=pps12202023 header.b=glk9J3Ne;
	dkim=pass header.d=silabs.com header.s=selector1 header.b=YQNikG3u;
	dmarc=pass (policy=reject) header.from=silabs.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1");
	spf=pass (lists.linaro.org: domain of Damien.Riegel@silabs.com designates 148.163.153.153 as permitted sender) smtp.mailfrom=Damien.Riegel@silabs.com
Received: from pps.filterd (m0101742.ppops.net [127.0.0.1])
	by mx0a-0024c301.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EKvqNB007794;
	Wed, 14 May 2025 17:52:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps12202023;
	 bh=Anj5x1rKe8AKvLbOdo02CsFqJOjawnN0mNbgK7FMPZQ=; b=glk9J3Ne5/7I
	YGTXq95I3NbOGQKj8dXpgMpb9MyhAb9+MEBEpkkAU4Y8dJJTQ9r3PEUKMI66Yc8t
	IANDzngLQj4phz1czVHrTpjMfeuScX28FjkgCVG19Nn0kDKLPNFndZZ7auuMG+fu
	UgqtkD5mKHko/MmkOtq7f9A9Yzc06ZewzwXtW48BE7WSjIP5fJRGpp5rewJfRgYj
	2Us0nuPbGLZwn0TKdKlahgWc1RXpPvpO8ef7dK3rsDN0odbNgZL2tc6MfzrLdN3V
	5i3o6BE/qdO1qq7eTbNJj9idshlbMUn/r+n8gBh2Jb3W42DCloVifpGmg/lImtML
	y+Q3hnToNw==
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2045.outbound.protection.outlook.com [104.47.56.45])
	by mx0a-0024c301.pphosted.com (PPS) with ESMTPS id 46mbchbdgc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 May 2025 17:52:33 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ltA7ckuJDx85uoelD7C8G/eYlSJZ0mtiBhkTEj8IyGjVZME1cvXVaRlVq9wv9z+WJ4OXtauyjxgmmaXs/A2dbiCDNU50HNppD9kaDbAHhChvwqCz+eZwTaN3Z7MAiiC7ADC0sHCVFSogqLfFvjBct6OryvEwgCVYbfiPbVf71izHEGUuealKa9TtivRh8htPsPEfeHBnjcLYjuvkLClSx1ZpKO9xqrezIeGkuBj0WBrLmys1W4KgF91KcJ6blrmZQzac4vo2BG0UIo7B90KZj6B7u30hmIHpdJZVOmYIyqYyjh3d5D7hLFfkILfwBBCaGdA5X5mrODiGSYomKS1+sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Anj5x1rKe8AKvLbOdo02CsFqJOjawnN0mNbgK7FMPZQ=;
 b=BQ5zYFQxZSoqP8AhvaTMlY/0Vw4ajkRUaZFkmT1tYeGUbeLw45zQvI2C66aN7YuKhTHBNR9x61yZXRGLo/uE1t57fHAuHTQysBvgXOtbgbb3+fe0/poUnv+jqv5JKXEKLbdx64eS1+TlUZIWh8/GO0avkWuoAK0kOCLCvzpJhHZ0dyBBlXDE/SwV6NQBU7uAX3h1g77q0o9FRVPNtWg/wuVeseowXDfTFsiGuzAjHT1IF9yy25tc4u+Zn2er66IlDN9wpBNjA+C6ubAiwslkwDndsDCyNvGSskWVQeUSbbynEQzyX6bMkmUMUeAEIQjTl4FQg9kfEVCDoukBv99WBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silabs.com; dmarc=pass action=none header.from=silabs.com;
 dkim=pass header.d=silabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Anj5x1rKe8AKvLbOdo02CsFqJOjawnN0mNbgK7FMPZQ=;
 b=YQNikG3uttIFe5ft7EWArIO8GOqTmYDCArsCcRIiv0T2cW+70YvgUn6bB5GXZt9qWiknBASrsXhCIPA2UY3lGu5tXa4pxt1HQXliox7Ctcfcro7qzU11OA91LQ3fSWp+7DklpsjNKr3yUckokuTxF4QCJiB3F6H8CR/TL4uCA3I=
Received: from DS0PR11MB8205.namprd11.prod.outlook.com (2603:10b6:8:162::17)
 by SN7PR11MB6798.namprd11.prod.outlook.com (2603:10b6:806:262::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Wed, 14 May
 2025 22:52:30 +0000
Received: from DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::c508:9b04:3351:524a]) by DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::c508:9b04:3351:524a%4]) with mapi id 15.20.8699.026; Wed, 14 May 2025
 22:52:29 +0000
Date: Wed, 14 May 2025 18:52:27 -0400
Message-Id: <D9W93CSVNNM0.F14YDBPZP64O@silabs.com>
From: =?utf-8?q?Damien_Ri=C3=A9gel?= <damien.riegel@silabs.com>
To: "Andrew Lunn" <andrew@lunn.ch>
X-Mailer: aerc 0.20.1
References: <20250512012748.79749-1-damien.riegel@silabs.com>
 <6fea7d17-8e08-42c7-a297-d4f5a3377661@lunn.ch>
 <D9VCEGBQWBW8.3MJCYYXOZHZNX@silabs.com>
 <f1a4ab5a-f2ce-4c94-91eb-ab81aea5b413@lunn.ch>
In-Reply-To: <f1a4ab5a-f2ce-4c94-91eb-ab81aea5b413@lunn.ch>
X-ClientProxiedBy: YT4PR01CA0090.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:ff::16) To DS0PR11MB8205.namprd11.prod.outlook.com
 (2603:10b6:8:162::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8205:EE_|SN7PR11MB6798:EE_
X-MS-Office365-Filtering-Correlation-Id: 663e57d3-eb44-422a-f467-08dd933a0158
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7416014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?SlFDbXF4andleGRYWEVsL1J1TXVocUVHTEpxTUZsMitmMVI5YTJhS0lvc09D?=
 =?utf-8?B?WTVLNFpIYzZsdkRkbHJycjd2ak9GZjZtWXVzcWE5L1dGR3d2cmtHS2IyMjll?=
 =?utf-8?B?Z25TY0VPVzg1dHJ3MkpGRE0xRFAyNDVucnd1V0ovWngwcTcrMjkxQk50WW5T?=
 =?utf-8?B?cmpud2FRRGVSRzR1eThYWFNhTXlSV0MxZTVtZEl0Q2FMMkFXaEw5Q1MvcGNv?=
 =?utf-8?B?MHJCMkxjdlRmNWZGTXpBUEE0Z2wvNDNHeDZtR2p2QnRmTk42dWxwRmlTTVNl?=
 =?utf-8?B?Yjdjc1NIRzR1UnN1aWdvcFZMVUVlalIvNFI3VFowTDdBeFNsTUtUb0Z5Y3hx?=
 =?utf-8?B?aTVtODBjakhXUVZQRlcyenpQYUMzQll1ZHpyZDNGdUczQUc2Njl2STFNMjYv?=
 =?utf-8?B?emJvSVdwQ1lzVEFtUkx6V3dMeDZSc1B2T2lac1Nqamp6VFFyQ1h5cTdCR3pO?=
 =?utf-8?B?dDl6RGFjWHM1SG5ITlByeERldWpxMEMzRGRmWjFoSXFGNVNQeWkvOVdkTTBL?=
 =?utf-8?B?bERLU1pmUFNIYm5iclBtVFgrSFpjVCtSUUw4Qjl1WG9hT1FvTmZqTlUwa1BH?=
 =?utf-8?B?ZGN4SURCTTNQTjVhekNRbWpSUUk5d21mNkxOOHprVG1GVEJacytGaEFiWG5p?=
 =?utf-8?B?ZDArbXorNngrYmVha284a3FsMm1ZYkVLeVAyQkxzcjE2b3Z0clU2YUszemx3?=
 =?utf-8?B?eFB0K1NjKzQzUXkvSER6SFYyR3FoZ0NTYVdvWWxla2RvNmllbzdKMzBSZnQ2?=
 =?utf-8?B?eTNmZVlMcTNrV3prNEUzbTkzdkdOVnVKdC84UkNjZWFkdGgwUmkxNUVlclgx?=
 =?utf-8?B?QWtwVUNyQy84ekVwUDVjVFhoeC90aUlPYjgrUCtKY2ZDYVQxTUpxODd1bmtT?=
 =?utf-8?B?c0F6RktQVWsrVkpHWEFaMkh6RDZWaHgzS0w3L3ZZS2o0UTcxZ2pFNk04WjRr?=
 =?utf-8?B?T3FMVVBlUFM3aFdrRzQxdEFENnprS2Q1bFM2UGY1ZE9CYTFTN08xMDRSdGRK?=
 =?utf-8?B?NzkvLzA2RVVhSXBTOXp4QjdyY001d3NFRDZhNzRZbUh3b2tsWFVqTzNpYnJq?=
 =?utf-8?B?TVRwWFRQSGtYd000bVhKNzZ4cEp1Q3JBQVAyYXljR29aelBncjl5UU4wYTJE?=
 =?utf-8?B?aDNuOUlnSFdBUUgvV21KYUk2K2R3ZUxqcHZhcXhPUkNYcllPVmVISmcycDRh?=
 =?utf-8?B?bzlyZTN4QmhmOVA2TzF3T3p1eHR2c1hCMUUzMGd5NUdiNzdCNG9xOEl4VzNa?=
 =?utf-8?B?Nmp2WGhBdVBUVjMzc0tZWWZ0WWNXcDM1MXd3S1lWQlpobmtYWkVoNFg3S2hi?=
 =?utf-8?B?Q0RnZ0tJcm9jaTV1cEp2UWxtcWt6UDNXOU5PTW00bmhTaEY0L1gvbytmOTZJ?=
 =?utf-8?B?b0RpZ0pKczNGLzlaSGw2TC9hV0FUS0ZLSEhHY1NSUEpNUGUya203dUhRaHNZ?=
 =?utf-8?B?TklHSDlnT0VFQUcvRnJVZ2czRkVRN29xNWhIL1NWbUtvZ1h6NTZYWTBrSHUz?=
 =?utf-8?B?Y0VwaVByb2ZDMDNmUnRxU1Nub1Uzdk1zcmdZNGNwNGF0elBkSzYxMTB2U042?=
 =?utf-8?B?ZE8zVTZkOElnakZHQk8veUZFVEdkRWwyMThzYllQd0FDZVI4U1RWZVRUQmpI?=
 =?utf-8?B?ZXZyRGh0UFl1aXp6TUF1UlNXQzYzdzcwQTFTMVk2V3VOQnArTzhTWThTU3Fu?=
 =?utf-8?B?aVZBT0pNdkdFa0dmdUZXWXdiN1FoVkJiNkRQc2xYN2xoUEVUR1liaHprYW1H?=
 =?utf-8?B?ZmhVVlE0RisxSlU1aW90VThhLzBXNFR1emcrbEcwRVlUaDJqVnpmWjFyWnNP?=
 =?utf-8?Q?7kRZftkXYiE6Y0wlwBqGDA7/wUGbPe/Y/wWEs=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8205.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7416014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?QllXN1N6NVZzc28wQ2JUTlJKaW1QMThjNXdGenkzMjM3TWkyc3JlV1NPdUdB?=
 =?utf-8?B?eHhCYlBDVnhkcUxMSmI2NUlvSStEUHpZOUZKMUhYazJwdFVuQ0xWcHRHUEZP?=
 =?utf-8?B?Qmp6UmgzOXN5eU1hU0RvVnB0UFgwMk9TT2ZUWWJhU25KZ0R1UVV4MHJPYUh2?=
 =?utf-8?B?bnNGSTRpKzlyMEtMcXdTT1BFRDJlV210ZXMvT0lmTTNtREpCQzJhZmYxL2la?=
 =?utf-8?B?VVhsTWl3Z1VqNWc1bDFXVzgzT3RveXY5K0dWL0gzNVNaQmZncHNYdjlxbnhy?=
 =?utf-8?B?Wjk2UnNkVm1wNzlXZjFqZzZmVGVpRGxac1VYUVpoTUlBL1B3eVBKejBjVEFM?=
 =?utf-8?B?UGoraXBqVFp4V3J0M2NOZkpWS29LMWdXSzhvNVJFclhnbEdRYzZOU0syUnBl?=
 =?utf-8?B?dUN1MWV2RWptWkR5TGh4QlVTRGhhdVlLcnZBU3NnM2FQL0tpYS9OVkNaKzBx?=
 =?utf-8?B?Qk5FZEV6QTdCTW9zUEtyWnNMekI5S2x4cE9MWHVPMWZVMFVOQ0hNd3huWmFw?=
 =?utf-8?B?ODVUN0txQ2xUS050K1cyc1JoZVo5MDVWOXlUNmZ6aDN4dmRnakllKzZSWVRq?=
 =?utf-8?B?aUxZa09UTkd6TGx6WkFPWHF3S3BiVzhDblNranAwc1JwWElXS1h5OVlHZzIy?=
 =?utf-8?B?dnh2TGhza3lWdlVqQ3YxdGh3R3J5WnpWTTNFbVFFQnZWZE9tcHFsWjRBMGV2?=
 =?utf-8?B?ZjZnOW1pTHhXQUtKVHVGSXdvczQwcURqRjcrNWM2UFRhUElrSHRSZGZKMmc1?=
 =?utf-8?B?OGh4VFRTZFJUVDBkc1Z4ZHBubDdyajBURUZ5S1prcXUwNkVOeGVHRmlnWGJ6?=
 =?utf-8?B?NE9RMm1XQVJuWXp2dWNCNzIxSS9vV2ZZZU9oNmJ0TXpRdzIrTTR3MTcxWENW?=
 =?utf-8?B?T1lLbzA5RWk5eUl3eS92Q2tPRFJsQXF3NklJYXV2RzFzcVMwVCtzRkNKQWIv?=
 =?utf-8?B?UVl5UnFFZS9MSU1WcXVxenNxWm84SSsvTWlUb2FNYkxrS0c4dzA1bVlTQ1g4?=
 =?utf-8?B?WGZMSlc5eU4wWHVmdFRqNlBpRWZScHcwVXY0NURoemEyTzYyS25lcHRkblFG?=
 =?utf-8?B?alIzcWhzMnROVWFqdU1KUjJUUmVHcy8yOGV0N0gybjByRjNTL1o5T0hZV2hP?=
 =?utf-8?B?WGxhWmJEK2lNVzUvcVNmYVpLVnFpMmlWb0t2dnBmM0o0ZlFyWVV5cW9qQzhz?=
 =?utf-8?B?ZXdMeU1ma2U5TmlrdU40YWZRVTQwa0w1REo4VlNpQUhlNmxaQ1RiZzlYQ3pk?=
 =?utf-8?B?TG12aUtqSk4rdWQyTUxBaHM4OXVDeVNTOURZaWVlaFZsdzVMbk4rSlgvMnNo?=
 =?utf-8?B?SC8xK0xYcVAxS2xBUUY5TGc5eUNOcEZnUnZLcXRvTFZ1MWJ4MnFxc2s2dHlP?=
 =?utf-8?B?dkdYZUxrT0J6N2RoREZ0MnFWRXRweGVhYWw4ZlVsbWVZYko0VlRQbFdCQkUr?=
 =?utf-8?B?azduczJIUHF5MWUvdDdMdWFidWR2bm5oSlJpOWJ5cHlZd0s3RlZFbWRGZFB3?=
 =?utf-8?B?UHBwSG8xa0cyYUI4aGMyQTl4VnY3ckd5M0ZKOEl6NGJHZXFPQ2FaVGdWbGl1?=
 =?utf-8?B?bHpvRkF5VTBQcVpybjZjK1NtY2dXUm5iOVdqK0RPUEowQlJSVjV1cWlTVUJ4?=
 =?utf-8?B?WUhXS0pJR2dacDM1M3N1ei91UlRVMkpGcjV1TE1PdFNJeG5LbkJvd25xVXN0?=
 =?utf-8?B?c0RJcXBCQ0JTMXFXTUFsVm9rSDhrcW5HcEpKZWdqQlNvbDhnVDNRRURVWnk5?=
 =?utf-8?B?QlZsbjNZbHMwTXdwOTVtVU5sTXMwUUZnRm5RUjlleC8zU3doQzF3aU5Ccks3?=
 =?utf-8?B?WDEwaGdaTS85NkhISWp6ZGZqWkdiRTJYQ3ppY0d3VEU2b1hxNTg2OVNUc1Vo?=
 =?utf-8?B?TDVlSDdoOTd0eUQ4UGpnRG10b1JCdklUTUtDNHdud3dzRlhUcEdOUXFrTHZH?=
 =?utf-8?B?WTlwZUxpR21GTy8rT1lQRXp6L0Q2WElxNHNjWWdWWjlBclg1dXlkS3pJRzc3?=
 =?utf-8?B?K2U1bzNNRlJDQUJnNXJ3bTcwWGRiOW9UbVhUK2pSL01wNDkxSmx1RUhKVXNH?=
 =?utf-8?B?VjZjQU02cU9iL2FreWt6ek9MczJ6RFBrdVMzUnczUFk1VFMxVkh4NHBZTjha?=
 =?utf-8?Q?s9druGhhJSD9fvqfYflK3JiH5?=
X-OriginatorOrg: silabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 663e57d3-eb44-422a-f467-08dd933a0158
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8205.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2025 22:52:29.8587
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 54dbd822-5231-4b20-944d-6f4abcd541fb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7172PnRCd9hQ0EVtxlQSm8SVl4K4sY9Gwh38/97BIDPFtKxhELQVVSGFc0RLt+IL3sMagepoxjT80n9Wpm/dRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6798
X-Authority-Analysis: v=2.4 cv=F/NXdrhN c=1 sm=1 tr=0 ts=68251eb1 cx=c_pps a=fpyyTn7Kx2iM0+fj1eipXw==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=M51BFTxLslgA:10 a=i1IsUcr2s-wA:10 a=2Fbpa9VpAAAA:8 a=XYAwZIGsAAAA:8 a=sozttTNsAAAA:8 a=he6HX9ZFAAAA:8 a=yDwlCua-91CjlK4RLRkA:9 a=QEXdDO2ut3YA:10 a=AsRvB5IyE59LPD4syVNT:22 a=E8ToXWR_bxluHZ7gmE-Z:22 a=eoD0SFdJP40gRqS9aQkZ:22
X-Proofpoint-ORIG-GUID: Rl4bIL7Lz3PMcve-_cXbg8WORq1ECv5J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDIxMiBTYWx0ZWRfXyHzhVFbkT63m +RX5VpcUDHlNXX6lgpadyijmbeIFQNBuS64eS02DuUFU2dvlwT7iSLI+fV5Rpo7ftcX7oni5sWo KO1Syhz979YWfeqUB6jT8r0ugOx6PMkb9f4+HPzyGVjYIpk92g5IWVD5Oziw1eYoKa7cIZnVxEk
 2SxWIKNP48vM/DHX/BzvIq40IBW4yNMX+Hu4CUWk0DAinDlj/RTN8oYJviq9G/c2clmoj9wjEzi ERVD+Khm/yzz0I+WF4xOhOD4LniEidFVhAuKU+4+COfrrRC7Nz4hBatBmPXQP5qJgMUW6qx6qll FKaTarzWX+u7cpTgropzCZHjC6A6h2oihvsi6NnBFFJvMzGmGd/cYsxEmtG21oHwquagTqZEql/
 6ZVplCBwV6TUG0+Rb9NMPxta5f4huyfxSGqkikWBtuBJn6u4p6Q0CbmcjXWzhxuOzoC1BR4+
X-Proofpoint-GUID: Rl4bIL7Lz3PMcve-_cXbg8WORq1ECv5J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_04,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 mlxlogscore=999 bulkscore=0 spamscore=0
 mlxscore=0 suspectscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2505070000
 definitions=main-2505140212
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: C31AE44B07
X-Spamd-Bar: ---
X-Spamd-Result: default: False [-3.59 / 15.00];
	BAYES_HAM(-2.99)[99.96%];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[silabs.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:148.163.153.153];
	R_DKIM_ALLOW(-0.20)[silabs.com:s=pps12202023,silabs.com:s=selector1];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_IN_DNSWL_LOW(-0.10)[148.163.153.153:from];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:22843, ipnet:148.163.152.0/22, country:US];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	TAGGED_RCPT(0.00)[netdev,dt];
	HAS_WP_URI(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_IN_DNSWL_NONE(0.00)[104.47.56.45:received];
	MID_RHS_MATCH_FROM(0.00)[];
	DKIM_TRACE(0.00)[silabs.com:+]
X-Rspamd-Action: no action
X-MailFrom: Damien.Riegel@silabs.com
X-Mailman-Rule-Hits: implicit-dest
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
Message-ID-Hash: W4YTME2GMFQ3I3EJVWW7366CQPJT2XB2
X-Message-ID-Hash: W4YTME2GMFQ3I3EJVWW7366CQPJT2XB2
X-Mailman-Approved-At: Wed, 14 May 2025 23:16:47 +0000
CC: Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Silicon Labs Kernel Team <linux-devel@silabs.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [RFC net-next 00/15] Add support for Silicon Labs CPC
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/W4YTME2GMFQ3I3EJVWW7366CQPJT2XB2/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gVHVlIE1heSAxMywgMjAyNSBhdCA1OjUzIFBNIEVEVCwgQW5kcmV3IEx1bm4gd3JvdGU6DQo+
IE9uIFR1ZSwgTWF5IDEzLCAyMDI1IGF0IDA1OjE1OjIwUE0gLTA0MDAsIERhbWllbiBSacOpZ2Vs
IHdyb3RlOg0KPj4gT24gTW9uIE1heSAxMiwgMjAyNSBhdCAxOjA3IFBNIEVEVCwgQW5kcmV3IEx1
bm4gd3JvdGU6DQo+PiA+IE9uIFN1biwgTWF5IDExLCAyMDI1IGF0IDA5OjI3OjMzUE0gLTA0MDAs
IERhbWllbiBSacOpZ2VsIHdyb3RlOg0KPj4gPj4gSGksDQo+PiA+Pg0KPj4gPj4NCj4+ID4+IFRo
aXMgcGF0Y2hzZXQgYnJpbmdzIGluaXRpYWwgc3VwcG9ydCBmb3IgU2lsaWNvbiBMYWJzIENQQyBw
cm90b2NvbCwNCj4+ID4+IHN0YW5kaW5nIGZvciBDby1Qcm9jZXNzb3IgQ29tbXVuaWNhdGlvbi4g
VGhpcyBwcm90b2NvbCBpcyB1c2VkIGJ5IHRoZQ0KPj4gPj4gRUZSMzIgU2VyaWVzIFsxXS4gVGhl
c2UgZGV2aWNlcyBvZmZlciBhIHZhcmlldHkgZm9yIHJhZGlvIHByb3RvY29scywNCj4+ID4+IHN1
Y2ggYXMgQmx1ZXRvb3RoLCBaLVdhdmUsIFppZ2JlZSBbMl0uDQo+PiA+DQo+PiA+IEJlZm9yZSB3
ZSBnZXQgdG9vIGRlZXAgaW50byB0aGUgZGV0YWlscyBvZiB0aGUgcGF0Y2hlcywgcGxlYXNlIGNv
dWxkDQo+PiA+IHlvdSBkbyBhIGNvbXBhcmUvY29udHJhc3QgdG8gR3JleWJ1cy4NCj4+DQo+PiBU
aGFuayB5b3UgZm9yIHRoZSBwcm9tcHQgZmVlZGJhY2sgb24gdGhlIFJGQy4gV2UgdG9vayBhIGxv
b2sgYXQgR3JleWJ1cw0KPj4gaW4gdGhlIHBhc3QgYW5kIGl0IGRpZG4ndCBzZWVtIHRvIGZpdCBv
dXIgbmVlZHMuIE9uZSBvZiB0aGUgbWFpbiB1c2UNCj4+IGNhc2UgdGhhdCBkcm92ZSB0aGUgZGV2
ZWxvcG1lbnQgb2YgQ1BDIHdhcyB0byBzdXBwb3J0IFdpRmkgKGluDQo+PiBjb2V4aXN0ZW5jZSB3
aXRoIG90aGVyIHJhZGlvIHN0YWNrcykgb3ZlciBTRElPLCBhbmQgZ2V0IHRoZSBtYXhpbXVtDQo+
PiB0aHJvdWdocHV0IHBvc3NpYmxlLiBXZSBjb25jbHVkZWQgdGhhdCB0byBhY2hpZXZlIHRoaXMg
d2Ugd291bGQgbmVlZA0KPj4gcGFja2V0IGFnZ3JlZ2F0aW9uLCBhcyBzZW5kaW5nIG9uZSBmcmFt
ZSBhdCBhIHRpbWUgb3ZlciBTRElPIGlzDQo+PiB3YXN0ZWZ1bCwgYW5kIG1hbmFnaW5nIFJhZGlv
IENvLVByb2Nlc3NvciBhdmFpbGFibGUgYnVmZmVycywgYXMgc2VuZGluZw0KPj4gZnJhbWVzIHRo
YXQgdGhlIFJDUCBpcyBub3QgYWJsZSB0byBwcm9jZXNzIHdvdWxkIGRlZ3JhZGUgcGVyZm9ybWFu
Y2UuDQo+Pg0KPj4gR3JleWJ1cyBkb24ndCBzZWVtIHRvIG9mZmVyIHRoZXNlIGNhcGFiaWxpdGll
cy4gSXQgc2VlbXMgdG8gYmUgbW9yZQ0KPj4gZ2VhcmVkIHRvd2FyZHMgaW1wbGVtZW50aW5nIFJQ
Qywgd2hlcmUgdGhlIGhvc3Qgd291bGQgc2VuZCBhIGNvbW1hbmQsDQo+PiBhbmQgdGhlbiB3YWl0
IGZvciB0aGUgZGV2aWNlIHRvIGV4ZWN1dGUgaXQgYW5kIHRvIHJlc3BvbmQuIEZvciBHcmV5YnVz
Jw0KPj4gcHJvdG9jb2xzIHRoYXQgaW1wbGVtZW50IHNvbWUgInN0cmVhbWluZyIgZmVhdHVyZXMg
bGlrZSBhdWRpbyBvciB2aWRlbw0KPj4gY2FwdHVyZSwgdGhlIGRhdGEgc3RyZWFtcyBnbyB0byBh
biBJMlMgb3IgQ1NJIGludGVyZmFjZSwgYnV0IGl0IGRvZXNuJ3QNCj4+IHNlZW0gdG8gZ28gdGhy
b3VnaCBhIENQb3J0LiBTbyBpdCBzZWVtcyB0byBhY3QgYXMgYSBiYWNrYm9uZSB0byBjb25uZWN0
DQo+PiBDUG9ydHMgdG9nZXRoZXIsIGJ1dCBoaWdoLXRocm91Z2hwdXQgdHJhbnNmZXJzIGhhcHBl
biBvbiBvdGhlciB0eXBlcyBvZg0KPj4gbGlua3MuIENQQyBpcyBtb3JlIGFib3V0IG1vdmluZyBk
YXRhIG92ZXIgYSBwaHlzaWNhbCBsaW5rLCBndWFyYW50ZWVpbmcNCj4+IG9yZGVyZWQgZGVsaXZl
cnkgYW5kIGF2b2lkaW5nIHVubmVjZXNzYXJ5IHRyYW5zbWlzc2lvbnMgaWYgcmVtb3RlDQo+PiBk
b2Vzbid0IGhhdmUgdGhlIHJlc291cmNlcywgaXQncyBtdWNoIGxvd2VyIGxldmVsIHRoYW4gR3Jl
eWJ1cy4NCj4NCj4gQXMgaXMgc2FpZCwgaSBkb24ndCBrbm93IEdyZXlidXMgdG9vIHdlbGwuIEkg
aG9wZSBpdHMgTWFpbnRhaW5lcnMgY2FuDQo+IGNvbW1lbnQgb24gdGhpcy4NCj4NCj4+ID4gQWxz
bywgdGhpcyBwYXRjaCBhZGRzIEJsdWV0b290aCwgeW91IHRhbGsgYWJvdXQgWi1XYXZlIGFuZCBa
aWdiZWUuIEJ1dA0KPj4gPiB0aGUgRUZSMzIgaXMgYSBnZW5lcmFsIHB1cnBvc2UgU29DLCB3aXRo
IEkyQywgU1BJLCBQV00sIFVBUlQuIEdyZXlidXMNCj4+ID4gaGFzIHN1cHBvcnQgZm9yIHRoZXNl
LCBhbHRob3VnaCB0aGUgY29kZSBpcyBjdXJyZW50IGluIHN0YWdpbmcuIEJ1dA0KPj4gPiBmb3Ig
c3RhZ2luZyBjb2RlLCBpdCBpcyBhY3R1YWxseSBwcmV0dHkgZ29vZC4NCj4+DQo+PiBJIGFncmVl
IHdpdGggeW91IHRoYXQgdGhlIEVGUjMyIGlzIGEgZ2VuZXJhbCBwdXJwb3NlIFNvQyBhbmQgZXhw
b3NpbmcNCj4+IGFsbCBhdmFpbGFibGUgcGVyaXBoZXJhbHMgd291bGQgYmUgZ3JlYXQsIGJ1dCBt
b3N0IGN1c3RvbWVycyBidXkgaXQgYXMNCj4+IGFuIFJDUCBtb2R1bGUgd2l0aCBvbmUgb3IgbW9y
ZSByYWRpbyBzdGFja3MgZW5hYmxlZCwgYW5kIHRoYXQncyB0aGUNCj4+IHNpdHVhdGlvbiB3ZSdy
ZSB0cnlpbmcgdG8gYWRkcmVzcy4gTWF5YmUgSSBpbnRyb2R1Y2VkIGEgZnJhbWV3b3JrIHdpdGgN
Cj4+IGN1c3RvbSBidXMsIGRyaXZlcnMgYW5kIGVuZHBvaW50cyB3aGVyZSBpdCB3YXMgdW5uZWNl
c3NhcnksIHRoZSBnb2FsIGlzDQo+PiBub3QgdG8gYmUgc3VwZXIgZ2VuZXJpYyBidXQgb25seSB0
byBzdXBwb3J0IGNvZXhpc3RlbmNlIG9mIG91ciByYWRpbw0KPj4gc3RhY2tzLg0KPg0KPiBUaGlz
IGxlYWRzIHRvIG15IG5leHQgcHJvYmxlbS4NCj4NCj4gaHR0cHM6Ly93d3cubm9yZGljc2VtaS5j
b20vLS9tZWRpYS9Tb2Z0d2FyZS1hbmQtb3RoZXItZG93bmxvYWRzL1Byb2R1Y3QtQnJpZWZzL25S
RjUzNDAtU29DLVBCLnBkZg0KPiBOb3JkaWMgU2VtaWNvbmR1Y3RvciBoYXMgd2hhdCBhcHBlYXJz
IHRvIGJlIGEgc2ltaWxhciBkZXZpY2UuDQo+DQo+IGh0dHBzOi8vd3d3Lm1pY3JvY2hpcC5jb20v
ZW4tdXMvcHJvZHVjdHMvd2lyZWxlc3MtY29ubmVjdGl2aXR5L2JsdWV0b290aC1sb3ctZW5lcmd5
L21pY3JvY29udHJvbGxlcnMNCj4gTWljcm9jaGlwIGhhcyBhIHNpbWlsYXIgZGV2aWNlIGFzIHdl
bGwuDQo+DQo+IGh0dHBzOi8vd3d3LnRpLmNvbS9wcm9kdWN0L0NDMjY3NFIxMA0KPiBUSSBoYXMg
YSBzaW1pbGFyIGRldmljZS4NCj4NCj4gQW5kIG1heWJlIHRoZXJlIGFyZSBvdGhlcnM/DQo+DQo+
IEFyZSB3ZSBnb2luZyB0byBnZXQgYSBTaWxhYnMgQ1BDLCBhIE5vcmRpYyBDUEMsIGEgTWljcm9j
aGlwIENQQywgYSBUSQ0KPiBDUEMsIGFuZCBhbiBBQ01FIENQQz8NCj4NCj4gSG93IGRvIHdlIGVu
ZCB1cCB3aXRoIG9uZSBpbXBsZW1lbnRhdGlvbj8NCj4NCj4gTWF5YmUgR3JleWJ1cyBkb2VzIG5v
dCBjdXJyZW50bHkgc3VwcG9ydCB5b3VyIHN0cmVhbWluZyB1c2UgY2FzZSB0b28NCj4gd2VsbCwg
YnV0IGl0IGlzIGF0IGxlYXN0IHZlbmRvciBuZXV0cmFsLiBDYW4gaXQgYmUgZXh0ZW5kZWQgZm9y
DQo+IHN0cmVhbWluZz8NCg0KSSBnZXQgdGhlIHNlbnRpbWVudCB0aGF0IHdlIGRvbid0IHdhbnQg
ZXZlcnkgc2luZ2xlIHZlbmRvciB0byBwdXNoIHRoZWlyDQpvd24gcHJvdG9jb2xzIHRoYXQgYXJl
IGV2ZXIgc28gc2xpZ2h0bHkgZGlmZmVyZW50LiBUbyBiZSBob25lc3QsIEkgZG9uJ3QNCmtub3cg
aWYgR3JleWJ1cyBjYW4gYmUgZXh0ZW5kZWQgZm9yIHRoYXQgdXNlIGNhc2UsIG9yIGlmIGl0J3Mg
c29tZXRoaW5nDQp0aGV5IGFyZSBpbnRlcmVzdGVkIGluIHN1cHBvcnRpbmcuIEkndmUgc3Vic2Ny
aWJlZCB0byBncmV5YnVzLWRldiBzbw0KaG9wZWZ1bGx5IG15IGVtYWlsIHdpbGwgZ2V0IHRocm91
Z2ggdGhpcyB0aW1lIChwcmV2aW91cyBvbmUgaXMgcGVuZGluZw0KYXBwcm92YWwpLg0KDQpVbmZv
cnR1bmF0ZWx5LCB3ZSdyZSBkZWVwIGRvd24gdGhlIENQQyByb2FkLCBlc3BlY2lhbGx5IG9uIHRo
ZSBmaXJtd2FyZQ0Kc2lkZS4gQmxhbWUgb24gbWUgZm9yIG5vdCBzZW5kaW5nIHRoZSBSRkMgc29v
bmVyIGFuZCBnZXR0aW5nIGZlZWRiYWNrDQplYXJsaWVyLCBidXQgaWYgd2UgaGF2ZSB0byBtYXNz
aXZlbHkgY2hhbmdlIG91ciBjb3Vyc2Ugb2YgYWN0aW9uIHdlIG5lZWQNCnNvbWUgZGVncmVlIG9m
IGNvbmZpZGVuY2UgdGhhdCB0aGlzIGlzIGEgdmlhYmxlIGFsdGVybmF0aXZlIGZvcg0KYWNoaWV2
aW5nIGhpZ2gtdGhyb3VnaHB1dCBmb3IgV2lGaSBvdmVyIFNESU8uIEkgd291bGQgcmVhbGx5IHZh
bHVlIGFueQ0KaW5wdXQgZnJvbSB0aGUgR3JleWJ1cyBmb2xrcyBvbiB0aGlzLg0KDQo+IEFuZCBt
YXliZSBhIGR1bWIgcXVlc3Rpb24uLi4gSG93IGRvIHRyYW5zZmVycyBnZXQgb3V0IG9mIG9yZGVy
IG92ZXINCj4gU1BJIGFuZCBTRElPPyBJZiB5b3UgbG9vayBhdCB0aGUgT3BlbiBBbGxpYW5jZSBU
QzYgc3BlY2lmaWNhdGlvbiBmb3INCj4gRXRoZXJuZXQgb3ZlciBTUEksIGl0IGRvZXMgbm90IGhh
dmUgYW55IGlzc3VlcyB3aXRoIG9yZGVyaW5nLg0KDQpTb3JyeSBJIHdhc24ndCB2ZXJ5IGNsZWFy
IGFib3V0IHRoYXQuIE9mIGNvdXJzZSBwYWNrZXRzIGFyZSBzZW50IGluDQpvcmRlciBidXQgc2V2
ZXJhbCBwYWNrZXRzIGNhbiBiZSBzZW50IGF0IG9uY2UgYmVmb3JlIGJlaW5nIGFja25vd2xlZGdl
ZA0KYW5kIHdlIG1pZ2h0IGRldGVjdCBDUkMgZXJyb3JzIG9uIG9uZSBvZiB0aGVzZSBwYWNrZXRz
LiBDUEMgdGFrZXMgY2FyZQ0Kb2Ygb25seSBkZWxpdmVyaW5nIHZhbGlkIHBhY2tldHMsIGFuZCBw
YWNrZXRzIHRoYXQgY29tZSBhZnRlciB0aGUgb25lDQp3aXRoIENSQyBlcnJvciB3b24ndCBiZSBk
ZWxpdmVyZWQgdG8gdXBwZXIgbGF5ZXIgdW50aWwgdGhlIGZhdWx0eSBvbmUgaXMNCnJldHJhbnNt
aXR0ZWQuDQoNCkkgdG9vayBhIGxvb2sgYXQgdGhlIHNwZWNpZmljYXRpb24geW91IG1lbnRpb25l
ZCBhbmQgdGhleSBjb21wbGV0ZWx5DQpkZWxlZ2F0ZSB0aGF0IHRvIHVwcGVyIGxheWVyczoNCg0K
ICAgIFdoZW4gdHJhbnNtaXQgb3IgcmVjZWl2ZSBmcmFtZSBiaXQgZXJyb3JzIGFyZSBkZXRlY3Rl
ZCBvbiB0aGUgU1BJLA0KICAgIHRoZSByZXRyeSBvZiBmcmFtZXMgaXMgcGVyZm9ybWVkIGJ5IGhp
Z2hlciBwcm90b2NvbCBsYXllcnMgdGhhdCBhcmUNCiAgICBiZXlvbmQgdGhlIHNjb3BlIG9mIHRo
aXMgc3BlY2lmaWNhdGlvbi4gWzFdDQoNCk91ciBnb2FsIHdhcyB0byBiZSBhZ25vc3RpYyBvZiBz
dGFja3Mgb24gdG9wIG9mIENQQyBhbmQgcmVsaWFibHkNCnRyYW5zbWl0IGZyYW1lcy4gVG8gZ2l2
ZSBhIGJpdCBvZiBjb250ZXh0LCBDUEMgd2FzIG9yaWdpbmFsbHkgZGVyaXZlZA0KZnJvbSBIRExD
LCB3aGljaCBmZWF0dXJlcyBkZXRlY3Rpbmcgc2VxdWVuY2UgZ2FwcyBhbmQgcmV0cmFuc21pc3Np
b24uIE9uDQp0b3Agb2YgdGhhdCwgd2UndmUgbm93IGFkZGVkIHRoZSBtZWNoYW5pc20gSSBtZW50
aW9uZWQgaW4gcHJldmlvdXMNCmVtYWlscyB0aGF0IHRocm90dGxlIHRoZSBob3N0IHdoZW4gdGhl
IFJDUCBpcyBub3QgcmVhZHkgdG8gcmVjZWl2ZSBhbmQNCnByb2Nlc3MgZnJhbWVzIG9uIGFuIGVu
ZHBvaW50Lg0KDQpbMV0gaHR0cHM6Ly9vcGVuc2lnLm9yZy93cC1jb250ZW50L3VwbG9hZHMvMjAy
My8xMi9PUEVOX0FsbGlhbmNlXzEwQkFTRVQxeF9NQUMtUEhZX1NlcmlhbF9JbnRlcmZhY2VfVjEu
MS5wZGYgKFNlY3Rpb24gNy4zLjEpDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpncmV5YnVzLWRldiBtYWlsaW5nIGxpc3QgLS0gZ3JleWJ1cy1kZXZAbGlz
dHMubGluYXJvLm9yZwpUbyB1bnN1YnNjcmliZSBzZW5kIGFuIGVtYWlsIHRvIGdyZXlidXMtZGV2
LWxlYXZlQGxpc3RzLmxpbmFyby5vcmcK
