Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B63AB8AC2
	for <lists+greybus-dev@lfdr.de>; Thu, 15 May 2025 17:34:39 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id C43F545988
	for <lists+greybus-dev@lfdr.de>; Thu, 15 May 2025 15:34:38 +0000 (UTC)
Received: from mx0a-0024c301.pphosted.com (mx0a-0024c301.pphosted.com [148.163.149.154])
	by lists.linaro.org (Postfix) with ESMTPS id 07C073E8D3
	for <greybus-dev@lists.linaro.org>; Thu, 15 May 2025 15:01:27 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=silabs.com header.s=pps12202023 header.b=TTiwy4by;
	dkim=pass header.d=silabs.com header.s=selector1 header.b=GZthegSX;
	dmarc=pass (policy=reject) header.from=silabs.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1");
	spf=pass (lists.linaro.org: domain of Damien.Riegel@silabs.com designates 148.163.149.154 as permitted sender) smtp.mailfrom=Damien.Riegel@silabs.com
Received: from pps.filterd (m0101743.ppops.net [127.0.0.1])
	by mx0a-0024c301.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54FDsLOd023391;
	Thu, 15 May 2025 10:01:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps12202023;
	 bh=+FWZVRoZQrAz3znCmwbvBV7IEPBowASYZLiDOgikHQY=; b=TTiwy4bydJlo
	r4+9tq7szQbCc6SRccO8IK+iPY38VCxEUmr/WNWwkAWQmeLS9XLHmruWNxxnpU8y
	OX2XfCbqWzfRfHYUrcpHanYHVWS5+fBNkz0zT9GpgZGOo2gaYSEXE22NFOvyZGc+
	HmH688EnXj3IcpAO0FC2tlKcTjtbWHTjigreLHhR7rq3UZ6pbgkoFwCAQ0jUZPeZ
	QSPgcxYF4szxiF3TsUIP8yyxPodOtCH5lBJxyv/jMjWfxRSYcll9rs8z3S00BI8m
	//kyjjXyIGymAojurihQSRpnZK31W/Kwn/8m7bn71gmH55oh+U1BS/1e02JmT4DR
	MVZVljCTNA==
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2044.outbound.protection.outlook.com [104.47.66.44])
	by mx0a-0024c301.pphosted.com (PPS) with ESMTPS id 46mbcjdxr1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 May 2025 10:01:11 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MvXT9vyW/MeikjYt1o0qPHBYXgq/0OeQExyAOYcATCnjxGmD/TXrHMAUCgD3Q8mtetqijVNchNnkI5k1+X4KVC3rKvdnbJ4uOU+Xx9Px5KGX5kOD4XqXeIHRlMduKhlgLKolwCYtzEhT2qR+F3qKHzbZejqAOEegTIKaWCEPhVm9zdJR1+5zq5czxyCULANzOyV8j10vJ6H9vEr8AoC3XzB9ewJXlLj+LtPN/ENi/Y6tdCsOXsolw6q1ROtkLJxc0wUHFl2PavP4kRQV1h6s/CQz+4ls275ZcCouyeg0zAfg9Tjsx8dFPfacamQb9P9AwB+TG5HxIpL8G5OfvKDDDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+FWZVRoZQrAz3znCmwbvBV7IEPBowASYZLiDOgikHQY=;
 b=th9Za8fI+Nu0HbRxy0uv/IYhHu0xInN7Cjbo2DFjiFnKMjWHgSpfpDPam7klzBWIJV7/lw56SnWZHzwvKUahT531I4DpkyBtc6xFyRNwEJZ9367cvrbiTKthLfy0BxMdKFmHQQ98IRfcqZi1jSs64hVnID0nePgl/qvpVABkZaUgRzd+aJ/Ud3SbulUUhLnwpXSJVyrFMfo4i2mGXEPAUpaQMKwVes6NL9XuOEa5qU8ZAGw6fE4JLk/Ts9NcXd5u+wlEEKmhRSb5Kmc214HySMU3iKjqGpHOHDZKAzjd6muZnf6LonuYM+g8dXoZREB2Mpb+dmUaFQ7I27YDIumlhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silabs.com; dmarc=pass action=none header.from=silabs.com;
 dkim=pass header.d=silabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+FWZVRoZQrAz3znCmwbvBV7IEPBowASYZLiDOgikHQY=;
 b=GZthegSXKCJVqeFz2QHtPqG96aFiu4eDOYQSOw9ZG1yBGumKGht4bl4Ju7q+kPUeRXj7hOL55m9aaKBSPSBghEodHWA7qEaQ2QnoxkUwi3VTPg79Wwp/qf8kejw2cET+YnOCBS8wwAqCVdg0E1MDwOgzfletuHErakWaxZlUa40=
Received: from DS0PR11MB8205.namprd11.prod.outlook.com (2603:10b6:8:162::17)
 by SA1PR11MB8254.namprd11.prod.outlook.com (2603:10b6:806:251::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Thu, 15 May
 2025 15:00:42 +0000
Received: from DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::c508:9b04:3351:524a]) by DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::c508:9b04:3351:524a%4]) with mapi id 15.20.8699.026; Thu, 15 May 2025
 15:00:41 +0000
Date: Thu, 15 May 2025 11:00:39 -0400
Message-Id: <D9WTONSVOPJS.1DNQ703ATXIN1@silabs.com>
From: =?utf-8?q?Damien_Ri=C3=A9gel?= <damien.riegel@silabs.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
X-Mailer: aerc 0.20.1
References: <20250512012748.79749-1-damien.riegel@silabs.com>
 <6fea7d17-8e08-42c7-a297-d4f5a3377661@lunn.ch>
 <D9VCEGBQWBW8.3MJCYYXOZHZNX@silabs.com>
 <f1a4ab5a-f2ce-4c94-91eb-ab81aea5b413@lunn.ch>
 <D9W93CSVNNM0.F14YDBPZP64O@silabs.com>
 <2025051551-rinsing-accurate-1852@gregkh>
In-Reply-To: <2025051551-rinsing-accurate-1852@gregkh>
X-ClientProxiedBy: YQBPR0101CA0121.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:5::24) To DS0PR11MB8205.namprd11.prod.outlook.com
 (2603:10b6:8:162::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8205:EE_|SA1PR11MB8254:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ace0014-0252-46b9-25f1-08dd93c142b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ekswWnN1eEUwWW1FM1drZForeGtmaTdhVlBGTC81QmpDTll0N3NzMTBxS1R1?=
 =?utf-8?B?VThmSGIwQWsxQ2E5Vi9jUkFISGVJVGFlRFEzRkRNeXRXNWdNa09hUFNpaTVL?=
 =?utf-8?B?L2lnTVM1Kys3OThacXQyMjFiY0dIT2pDc20xekxxbTliZFZIWE1ZblZ6dGFQ?=
 =?utf-8?B?SFJCeldDWk1PL1BKclBLbndmQUNCalF5STgxK3J6WThuUGNFVGhvK1pxMkxl?=
 =?utf-8?B?SWZyTXhRd0hWbjJWRDZ5ekNROUc1Um5Ic3J0cDIwMklPL1JWK3I2ajN6cTg4?=
 =?utf-8?B?a1VPUVhYUVVvRmhtNjl2SUNQbkRNbzFFVTRNTFhod0lia29ISWJZQzF5V05o?=
 =?utf-8?B?b2xhKzI2cFNEdFN1L2lPKzFyZmNaaGRwNVNDaERvd25qSXlSdjlHMzk0bGtv?=
 =?utf-8?B?bWtyQkhJa2hMQ1pYLzdFOHdYRm10SVJ6V2QzRTluendrNUNJQllITWZzQmto?=
 =?utf-8?B?YUtMYXY3TlR5S1dyc1hlWi9jMGs0SUxkdUtOU3F0THJWL1pENWtoSm5NZjhY?=
 =?utf-8?B?TC9oeHArQnc5SGEwYnYyL2h2TlI1bzhaYTJ5OVZXVFA1MU53ZHZJWXdEYkhl?=
 =?utf-8?B?dHNXSVhTMHZoYXd4VTc2Tm1yMG9RZ2wvRUljOGxCUk9meUkwd3hObjB5bEpk?=
 =?utf-8?B?NGQ4WTNKYTVtQ3c4dUs2ek9KRHd5SjREVEtURG5IdkpMVFkxcTd2WHlvaERk?=
 =?utf-8?B?VDBaZXlMRmNrRStuanNkSWwxWTN0ellVc0FJdmtQejY2YjZhRW5TNWFjRVhl?=
 =?utf-8?B?OWlWTldTTXVCanYwWndNOEJWWnRTME96bVlCSEgvRWNJVHhzUUlMZVdGOU96?=
 =?utf-8?B?QXhKcFpOekZsQ3VlZzlhUEJXaWhpeEhkZEtFRXBwNlRaNVZlUFZxemNUVlh6?=
 =?utf-8?B?K0Z2NlVqMXJwSXYyV094bzhIOWd1ZERSSmh6Zjl0Qm1JTG5RMTFwRTEwL2pF?=
 =?utf-8?B?cWpvM2IydG5DdFJaLzdwMEI5TERLcDNUdHFuK3FDb1dxazYzQlVtVzBtZjZP?=
 =?utf-8?B?RkI0L3hsYkwyUStSZzA4RlR4MDRsa00xZzFnSVlKc2F5b1FxM3Y5U1ZYNm82?=
 =?utf-8?B?RFdkWmNFWnBBSkhDRE43Wmlhbitjdk54cW5DaUtVK1Jpekh4MC9reGNzTHFV?=
 =?utf-8?B?R0laN3hkUWExSzBleWYweU12SkszeUErRnp0Tmk2VXc2WjV5VG5Ic0lFU2Q1?=
 =?utf-8?B?V0FYN3ZWSFEwYUs4U0dGSWlnV1IrOE5janFvMXcyd3o5cUxBTHViUHNHcHVY?=
 =?utf-8?B?bWVMVHo0QkRUS3ArVFNuV3M0NERPa1pia0pWWjBrcm03L09FYkFKaE1NbFJY?=
 =?utf-8?B?ZEcxSWZwaW5FRk9sUGc2OTd1dXgyVTh2VUVwQWZNenJNUk1QMGZtTGFDZlZ6?=
 =?utf-8?B?VjVNbkw4Y0hxb0NWVWw5dUZZVFRHaHYvQ0p3YWNib1BHWGkvQkhZMWVSZ2tp?=
 =?utf-8?B?YUdnZ1AzVHV2SHlvQ0xocy9iQVhJNUtUajdFaUhhL1FYT0RjYXlyeXVVaGFt?=
 =?utf-8?B?aWtldjRkRHlCZVlLVjRGSUZLYVhnMkUvbkNUU1ZETUZkOTRsa3A3aThyaDdm?=
 =?utf-8?B?QzNPdVExaEoyRzNxeGVXdjNpbkdnRjBmZmRaQy9yNmJQbU04MTVlR3daQzdH?=
 =?utf-8?B?WE14RUtzVlMybk1YVHlrNGltZ25rckdpL1lZalMwUW5UWG9vaXhqc1NUTi8x?=
 =?utf-8?B?TnRzMEN5Uys3V0RIdmRtcHA2dFh3SXNENFFhN2ZQQ2hueDM5MVhJQTZVRDhk?=
 =?utf-8?B?NWoyV0pibi81QnE1ZWdtZHNCNUlpS09iRElLcmFwNnliSnEwVE1rTUlscWVw?=
 =?utf-8?Q?ljbuY2+v0xxLvujmmnjA3jYiF6MPkQumhAlKs=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8205.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cWxJKysvc2xzOGZ4WU9ZSGV5d3oxRWxsblNyTjVDeDhUUkRab042dmFEcDY5?=
 =?utf-8?B?aFJ1WkF5YTlFZFF6WTJIZ2VJV2R4eUpMUG5mbEYwd1NWdUQ3cVFIVU1wV3dR?=
 =?utf-8?B?UnByVndjOUhSdDFsRGtqQ1JGb28xazZDV3BlenA0dFY4Y0JmczhqNDZRRTcw?=
 =?utf-8?B?bEFuSTh0eVpBN3ZEZk9YN3BHWkNCNFFxMGxPcHcwVXV4VTZOdEtXNTZxdmp4?=
 =?utf-8?B?RFB3QTExSHRWSjhMSXA5N1pSZUZGSU1CQkcyTkk5UE5MaEFsZE4zSmlhTmg4?=
 =?utf-8?B?bkVHaWkxaDdkdGtxQS9nOHQ1dEwvTHg4ZlRpdGJSamJaZ3JEZHRVUkJlUlBt?=
 =?utf-8?B?VFZyTzNBejFoUGJrRHdYVnhwTHNvMm1HaTJKUjNiQ2JEVXhJRHlqK2RjRXFR?=
 =?utf-8?B?dVVPMDNtb1BhQXp0MSthTWw1c3FWand4bmdQSC9ONG1ta1pWTTJZczFQdjln?=
 =?utf-8?B?K2pHSnNoWHZTajVGSitKSTVVV01PUmJEajZQQUNqWmZMZ3RGcSt1dEwzYSty?=
 =?utf-8?B?WmtMQVRnQ2lQTlhHdGpneVZyd21sZWdhWm52NzFnZWhlWkRjdTl5VHFjcGdZ?=
 =?utf-8?B?S0s0TVJjNXFzTktZa2E2R1lQK2pmdkU0SGpydnZXVWxUNTNJYTgzRmxjNjhy?=
 =?utf-8?B?QUdLTnVZNFVqUWo1TmFUTHBhbDhYNklGaStzZUh6RkZ4Y2J6M0UxK1BkVHZh?=
 =?utf-8?B?SlREZGI5Q1JrNnNra2dvRUtDenRGT0dueW1nd1gwcXkxWGpocFdqZVpOVFd1?=
 =?utf-8?B?a0V2L1htbDBGZXJtd1VOL0ZMQ25VblZBeE5aR08yYVUvZ3NNYTB1amZLNjBz?=
 =?utf-8?B?N0IrcnEyRDdwQlI3OFowcmx6dXB6d2N0V0tuY1YvRThRaDVLWUQ3YlFQNEE4?=
 =?utf-8?B?TmR2MCtnMXhLbFg5VnoyMnVDVWVtVlZrSEcwNTJ1TWUzZzB3UjkwRTdXZXVI?=
 =?utf-8?B?a2kxczNFZ1lXeiswVkwrZGd6ZE1jY081TktTUXoyK1FUMm5BK3dzU1cwNUh2?=
 =?utf-8?B?d1lqckRQYzlYVVA0ZGhydkowL3c0TGFyYTBrNGNSb0Q2YVVxUk1XMVROcmFo?=
 =?utf-8?B?SFJMa1ExcUI5QTBpT3ZmR1NlbnhKbEZWQ0ExMkwyQmNZV1B4MWorNEpOZlo4?=
 =?utf-8?B?NGp0UzJIZzd2TWE5SjhRL2FkVEI1bFN0N3lLZ3V0bWJWNS9qdnd0Unl6aUFX?=
 =?utf-8?B?c2xTU1dteEdYM3VKZVNjcThOb1JmREVjaUFKWmV1ZHZ0LzRWZmdDZjhrWWhv?=
 =?utf-8?B?cW44dkNpOExlc3FrdUpmdGFpUlBCUjBjYms3RVg4V01vWFF0YjZrNDZqM25Z?=
 =?utf-8?B?MUQvTk8rZTN6a1oxYk9UNTR4SkowMFJZR0RoNUVSVHBkQ054NVY3ZUVaSlJj?=
 =?utf-8?B?a0hWTGVJV0JJMklOZlJMNDR2VjVjeEJDVDhVejRLaHFVNHpSTFcycUVCbk9Q?=
 =?utf-8?B?bE4yeG9Ic3ZWNlUvcVR4dzdlVEcxbTFaZGdhOEMzRDZSRXMxZUJSemtUZFF2?=
 =?utf-8?B?eUtJbGx3d1VTQWpNMDJYNk03T05PRVRDWExsR1NUNHN6a0dqckdtY2dwekUy?=
 =?utf-8?B?VElSUFBRSjYvb0E0RmdnaVphWjk2M05kU0NKTjF0VkJmc1hIcFRhY3lueE55?=
 =?utf-8?B?cks1eWNQNzNSaGtwM0lEbWFKTUJNS3REQ0hIRmRLNkpIWDlsS2tHUzh6ZVVV?=
 =?utf-8?B?Wnk5Y1hSakRZMzRNeFgveUp0ZDV1NDlqaDlEaTFaYVdjQkpTek43VU8xaGxu?=
 =?utf-8?B?dlZUWVhMWUcxT05RMlVRQ0VKTUtENHZ1UWh3c1NMTGJwU1plRDZDSnNZYU1T?=
 =?utf-8?B?VWF6VWdlNGpjaTIwTWtrSWticDdYT1cvVFdxVWhoSjA0dTBuQWV2SU1sUmg4?=
 =?utf-8?B?amt5bVUwZTI2Z3doUXltVEk0RFlidGhPMTV4Vnp1d0ZnYlVkSW9mVHl1a1Nm?=
 =?utf-8?B?cmFpRVVMeTdQQUphUitYOVNlcnF5QWdBV1Q3Nk1mTHEwVU1OOTNGVTNIWTl0?=
 =?utf-8?B?UXRHcng5WjFDQ0owMlh6NlExeFFFTENTLzZ1L3phbUQ5cnJoNllvK2tHV1dS?=
 =?utf-8?B?QVZNTkVaS3J3UGRjd29UTnVPaWppQ0JPR0QwQStoc2RSUFNyZDBGQmFpbDlz?=
 =?utf-8?Q?Q9lid0H+jbBh1nCxqhqTsDg8h?=
X-OriginatorOrg: silabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ace0014-0252-46b9-25f1-08dd93c142b4
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8205.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 15:00:41.6610
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 54dbd822-5231-4b20-944d-6f4abcd541fb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H4NGQY7eYHM+ejNs7Y9WFpo2s0jcPM0EI3fdLpRSECv6UNLt6A024Nav16XUwI2D1c4RKM4xmavM35FpsdkocA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8254
X-Authority-Analysis: v=2.4 cv=ItQecK/g c=1 sm=1 tr=0 ts=682601b7 cx=c_pps a=+tN8zt48bv3aY6W8EltW8A==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=M51BFTxLslgA:10 a=i1IsUcr2s-wA:10 a=2Fbpa9VpAAAA:8 a=XYAwZIGsAAAA:8 a=sozttTNsAAAA:8 a=m7XD2D8YMnL-FmNz2MwA:9 a=QEXdDO2ut3YA:10 a=AsRvB5IyE59LPD4syVNT:22 a=E8ToXWR_bxluHZ7gmE-Z:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDE0OCBTYWx0ZWRfX00UxSzP3KEx2 8qR8/YKm32AaOdQWTHIVQKQM2l9fTyMsa47UaEF6qbjPI22MNM2qlyzdOq6xKkPWU+vvJ39qjK3 e7zIzB2t9+VgxB4LCu64GqgbW5BznvZz5HpLG81Jlvw18PvU9g6hVXeshd5L73fCBzhVpjD8gLT
 AVew2/fKN/sJk/QK76PCqkSjPqFzk+lRk4Ot0VolRVZ6rIOCCYi+aEB2aupD4iBoQVcJUtJkVdk XyDagXKklrms5r6oafic+CK8V2pXuiaR3XubaIs8aEWd3asiNzqucpZg0QbwTfOXMr0v55k/uBB MWaL//ebKSw/rI4uFDZSf+mbJAowQWH/IKzP4kJvMebA+f4WDWS3dP1ie2pI9stvu/HZB3tZpiE
 /EpCb7SgUW+ugKKf4A5o2mEv+zcNnCkFeJ2BUsu02hp7SQTYPmKU/L6JXl09JOEfUm90ZZoI
X-Proofpoint-ORIG-GUID: v9gSJuG8AyuMEPcKRXpPN9mgpXiXXFXc
X-Proofpoint-GUID: v9gSJuG8AyuMEPcKRXpPN9mgpXiXXFXc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-15_06,2025-05-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 clxscore=1015 impostorscore=0 mlxlogscore=999
 suspectscore=0 priorityscore=1501 phishscore=0 malwarescore=0 mlxscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2505070000
 definitions=main-2505150148
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 07C073E8D3
X-Spamd-Bar: -------
X-Spamd-Result: default: False [-7.60 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[silabs.com,reject];
	R_DKIM_ALLOW(-0.20)[silabs.com:s=pps12202023,silabs.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:148.163.149.154];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_IN_DNSWL_LOW(-0.10)[148.163.149.154:from];
	ASN(0.00)[asn:26211, ipnet:148.163.148.0/22, country:US];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	TAGGED_RCPT(0.00)[netdev,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_IN_DNSWL_NONE(0.00)[104.47.66.44:received];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[silabs.com:+]
X-Rspamd-Action: no action
X-MailFrom: Damien.Riegel@silabs.com
X-Mailman-Rule-Hits: implicit-dest
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
Message-ID-Hash: CZFZICTO6V6YVOQF2VDQPSUMRGMEJFPD
X-Message-ID-Hash: CZFZICTO6V6YVOQF2VDQPSUMRGMEJFPD
X-Mailman-Approved-At: Thu, 15 May 2025 15:34:33 +0000
CC: Andrew Lunn <andrew@lunn.ch>, Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Silicon Labs Kernel Team <linux-devel@silabs.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [RFC net-next 00/15] Add support for Silicon Labs CPC
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/CZFZICTO6V6YVOQF2VDQPSUMRGMEJFPD/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gVGh1IE1heSAxNSwgMjAyNSBhdCAzOjQ5IEFNIEVEVCwgR3JlZyBLcm9haC1IYXJ0bWFuIHdy
b3RlOg0KPiBPbiBXZWQsIE1heSAxNCwgMjAyNSBhdCAwNjo1MjoyN1BNIC0wNDAwLCBEYW1pZW4g
UmnDqWdlbCB3cm90ZToNCj4+IE9uIFR1ZSBNYXkgMTMsIDIwMjUgYXQgNTo1MyBQTSBFRFQsIEFu
ZHJldyBMdW5uIHdyb3RlOg0KPj4gPiBPbiBUdWUsIE1heSAxMywgMjAyNSBhdCAwNToxNToyMFBN
IC0wNDAwLCBEYW1pZW4gUmnDqWdlbCB3cm90ZToNCj4+ID4+IE9uIE1vbiBNYXkgMTIsIDIwMjUg
YXQgMTowNyBQTSBFRFQsIEFuZHJldyBMdW5uIHdyb3RlOg0KPj4gPj4gPiBPbiBTdW4sIE1heSAx
MSwgMjAyNSBhdCAwOToyNzozM1BNIC0wNDAwLCBEYW1pZW4gUmnDqWdlbCB3cm90ZToNCj4+ID4+
ID4+IEhpLA0KPj4gPj4gPj4NCj4+ID4+ID4+DQo+PiA+PiA+PiBUaGlzIHBhdGNoc2V0IGJyaW5n
cyBpbml0aWFsIHN1cHBvcnQgZm9yIFNpbGljb24gTGFicyBDUEMgcHJvdG9jb2wsDQo+PiA+PiA+
PiBzdGFuZGluZyBmb3IgQ28tUHJvY2Vzc29yIENvbW11bmljYXRpb24uIFRoaXMgcHJvdG9jb2wg
aXMgdXNlZCBieSB0aGUNCj4+ID4+ID4+IEVGUjMyIFNlcmllcyBbMV0uIFRoZXNlIGRldmljZXMg
b2ZmZXIgYSB2YXJpZXR5IGZvciByYWRpbyBwcm90b2NvbHMsDQo+PiA+PiA+PiBzdWNoIGFzIEJs
dWV0b290aCwgWi1XYXZlLCBaaWdiZWUgWzJdLg0KPj4gPj4gPg0KPj4gPj4gPiBCZWZvcmUgd2Ug
Z2V0IHRvbyBkZWVwIGludG8gdGhlIGRldGFpbHMgb2YgdGhlIHBhdGNoZXMsIHBsZWFzZSBjb3Vs
ZA0KPj4gPj4gPiB5b3UgZG8gYSBjb21wYXJlL2NvbnRyYXN0IHRvIEdyZXlidXMuDQo+PiA+Pg0K
Pj4gPj4gVGhhbmsgeW91IGZvciB0aGUgcHJvbXB0IGZlZWRiYWNrIG9uIHRoZSBSRkMuIFdlIHRv
b2sgYSBsb29rIGF0IEdyZXlidXMNCj4+ID4+IGluIHRoZSBwYXN0IGFuZCBpdCBkaWRuJ3Qgc2Vl
bSB0byBmaXQgb3VyIG5lZWRzLiBPbmUgb2YgdGhlIG1haW4gdXNlDQo+PiA+PiBjYXNlIHRoYXQg
ZHJvdmUgdGhlIGRldmVsb3BtZW50IG9mIENQQyB3YXMgdG8gc3VwcG9ydCBXaUZpIChpbg0KPj4g
Pj4gY29leGlzdGVuY2Ugd2l0aCBvdGhlciByYWRpbyBzdGFja3MpIG92ZXIgU0RJTywgYW5kIGdl
dCB0aGUgbWF4aW11bQ0KPj4gPj4gdGhyb3VnaHB1dCBwb3NzaWJsZS4gV2UgY29uY2x1ZGVkIHRo
YXQgdG8gYWNoaWV2ZSB0aGlzIHdlIHdvdWxkIG5lZWQNCj4+ID4+IHBhY2tldCBhZ2dyZWdhdGlv
biwgYXMgc2VuZGluZyBvbmUgZnJhbWUgYXQgYSB0aW1lIG92ZXIgU0RJTyBpcw0KPj4gPj4gd2Fz
dGVmdWwsIGFuZCBtYW5hZ2luZyBSYWRpbyBDby1Qcm9jZXNzb3IgYXZhaWxhYmxlIGJ1ZmZlcnMs
IGFzIHNlbmRpbmcNCj4+ID4+IGZyYW1lcyB0aGF0IHRoZSBSQ1AgaXMgbm90IGFibGUgdG8gcHJv
Y2VzcyB3b3VsZCBkZWdyYWRlIHBlcmZvcm1hbmNlLg0KPj4gPj4NCj4+ID4+IEdyZXlidXMgZG9u
J3Qgc2VlbSB0byBvZmZlciB0aGVzZSBjYXBhYmlsaXRpZXMuIEl0IHNlZW1zIHRvIGJlIG1vcmUN
Cj4+ID4+IGdlYXJlZCB0b3dhcmRzIGltcGxlbWVudGluZyBSUEMsIHdoZXJlIHRoZSBob3N0IHdv
dWxkIHNlbmQgYSBjb21tYW5kLA0KPj4gPj4gYW5kIHRoZW4gd2FpdCBmb3IgdGhlIGRldmljZSB0
byBleGVjdXRlIGl0IGFuZCB0byByZXNwb25kLiBGb3IgR3JleWJ1cycNCj4+ID4+IHByb3RvY29s
cyB0aGF0IGltcGxlbWVudCBzb21lICJzdHJlYW1pbmciIGZlYXR1cmVzIGxpa2UgYXVkaW8gb3Ig
dmlkZW8NCj4+ID4+IGNhcHR1cmUsIHRoZSBkYXRhIHN0cmVhbXMgZ28gdG8gYW4gSTJTIG9yIENT
SSBpbnRlcmZhY2UsIGJ1dCBpdCBkb2Vzbid0DQo+PiA+PiBzZWVtIHRvIGdvIHRocm91Z2ggYSBD
UG9ydC4gU28gaXQgc2VlbXMgdG8gYWN0IGFzIGEgYmFja2JvbmUgdG8gY29ubmVjdA0KPj4gPj4g
Q1BvcnRzIHRvZ2V0aGVyLCBidXQgaGlnaC10aHJvdWdocHV0IHRyYW5zZmVycyBoYXBwZW4gb24g
b3RoZXIgdHlwZXMgb2YNCj4+ID4+IGxpbmtzLiBDUEMgaXMgbW9yZSBhYm91dCBtb3ZpbmcgZGF0
YSBvdmVyIGEgcGh5c2ljYWwgbGluaywgZ3VhcmFudGVlaW5nDQo+PiA+PiBvcmRlcmVkIGRlbGl2
ZXJ5IGFuZCBhdm9pZGluZyB1bm5lY2Vzc2FyeSB0cmFuc21pc3Npb25zIGlmIHJlbW90ZQ0KPj4g
Pj4gZG9lc24ndCBoYXZlIHRoZSByZXNvdXJjZXMsIGl0J3MgbXVjaCBsb3dlciBsZXZlbCB0aGFu
IEdyZXlidXMuDQo+PiA+DQo+PiA+IEFzIGlzIHNhaWQsIGkgZG9uJ3Qga25vdyBHcmV5YnVzIHRv
byB3ZWxsLiBJIGhvcGUgaXRzIE1haW50YWluZXJzIGNhbg0KPj4gPiBjb21tZW50IG9uIHRoaXMu
DQo+PiA+DQo+PiA+PiA+IEFsc28sIHRoaXMgcGF0Y2ggYWRkcyBCbHVldG9vdGgsIHlvdSB0YWxr
IGFib3V0IFotV2F2ZSBhbmQgWmlnYmVlLiBCdXQNCj4+ID4+ID4gdGhlIEVGUjMyIGlzIGEgZ2Vu
ZXJhbCBwdXJwb3NlIFNvQywgd2l0aCBJMkMsIFNQSSwgUFdNLCBVQVJULiBHcmV5YnVzDQo+PiA+
PiA+IGhhcyBzdXBwb3J0IGZvciB0aGVzZSwgYWx0aG91Z2ggdGhlIGNvZGUgaXMgY3VycmVudCBp
biBzdGFnaW5nLiBCdXQNCj4+ID4+ID4gZm9yIHN0YWdpbmcgY29kZSwgaXQgaXMgYWN0dWFsbHkg
cHJldHR5IGdvb2QuDQo+PiA+Pg0KPj4gPj4gSSBhZ3JlZSB3aXRoIHlvdSB0aGF0IHRoZSBFRlIz
MiBpcyBhIGdlbmVyYWwgcHVycG9zZSBTb0MgYW5kIGV4cG9zaW5nDQo+PiA+PiBhbGwgYXZhaWxh
YmxlIHBlcmlwaGVyYWxzIHdvdWxkIGJlIGdyZWF0LCBidXQgbW9zdCBjdXN0b21lcnMgYnV5IGl0
IGFzDQo+PiA+PiBhbiBSQ1AgbW9kdWxlIHdpdGggb25lIG9yIG1vcmUgcmFkaW8gc3RhY2tzIGVu
YWJsZWQsIGFuZCB0aGF0J3MgdGhlDQo+PiA+PiBzaXR1YXRpb24gd2UncmUgdHJ5aW5nIHRvIGFk
ZHJlc3MuIE1heWJlIEkgaW50cm9kdWNlZCBhIGZyYW1ld29yayB3aXRoDQo+PiA+PiBjdXN0b20g
YnVzLCBkcml2ZXJzIGFuZCBlbmRwb2ludHMgd2hlcmUgaXQgd2FzIHVubmVjZXNzYXJ5LCB0aGUg
Z29hbCBpcw0KPj4gPj4gbm90IHRvIGJlIHN1cGVyIGdlbmVyaWMgYnV0IG9ubHkgdG8gc3VwcG9y
dCBjb2V4aXN0ZW5jZSBvZiBvdXIgcmFkaW8NCj4+ID4+IHN0YWNrcy4NCj4+ID4NCj4+ID4gVGhp
cyBsZWFkcyB0byBteSBuZXh0IHByb2JsZW0uDQo+PiA+DQo+PiA+IGh0dHBzOi8vd3d3Lm5vcmRp
Y3NlbWkuY29tLy0vbWVkaWEvU29mdHdhcmUtYW5kLW90aGVyLWRvd25sb2Fkcy9Qcm9kdWN0LUJy
aWVmcy9uUkY1MzQwLVNvQy1QQi5wZGYNCj4+ID4gTm9yZGljIFNlbWljb25kdWN0b3IgaGFzIHdo
YXQgYXBwZWFycyB0byBiZSBhIHNpbWlsYXIgZGV2aWNlLg0KPj4gPg0KPj4gPiBodHRwczovL3d3
dy5taWNyb2NoaXAuY29tL2VuLXVzL3Byb2R1Y3RzL3dpcmVsZXNzLWNvbm5lY3Rpdml0eS9ibHVl
dG9vdGgtbG93LWVuZXJneS9taWNyb2NvbnRyb2xsZXJzDQo+PiA+IE1pY3JvY2hpcCBoYXMgYSBz
aW1pbGFyIGRldmljZSBhcyB3ZWxsLg0KPj4gPg0KPj4gPiBodHRwczovL3d3dy50aS5jb20vcHJv
ZHVjdC9DQzI2NzRSMTANCj4+ID4gVEkgaGFzIGEgc2ltaWxhciBkZXZpY2UuDQo+PiA+DQo+PiA+
IEFuZCBtYXliZSB0aGVyZSBhcmUgb3RoZXJzPw0KPj4gPg0KPj4gPiBBcmUgd2UgZ29pbmcgdG8g
Z2V0IGEgU2lsYWJzIENQQywgYSBOb3JkaWMgQ1BDLCBhIE1pY3JvY2hpcCBDUEMsIGEgVEkNCj4+
ID4gQ1BDLCBhbmQgYW4gQUNNRSBDUEM/DQo+PiA+DQo+PiA+IEhvdyBkbyB3ZSBlbmQgdXAgd2l0
aCBvbmUgaW1wbGVtZW50YXRpb24/DQo+PiA+DQo+PiA+IE1heWJlIEdyZXlidXMgZG9lcyBub3Qg
Y3VycmVudGx5IHN1cHBvcnQgeW91ciBzdHJlYW1pbmcgdXNlIGNhc2UgdG9vDQo+PiA+IHdlbGws
IGJ1dCBpdCBpcyBhdCBsZWFzdCB2ZW5kb3IgbmV1dHJhbC4gQ2FuIGl0IGJlIGV4dGVuZGVkIGZv
cg0KPj4gPiBzdHJlYW1pbmc/DQo+Pg0KPj4gSSBnZXQgdGhlIHNlbnRpbWVudCB0aGF0IHdlIGRv
bid0IHdhbnQgZXZlcnkgc2luZ2xlIHZlbmRvciB0byBwdXNoIHRoZWlyDQo+PiBvd24gcHJvdG9j
b2xzIHRoYXQgYXJlIGV2ZXIgc28gc2xpZ2h0bHkgZGlmZmVyZW50LiBUbyBiZSBob25lc3QsIEkg
ZG9uJ3QNCj4+IGtub3cgaWYgR3JleWJ1cyBjYW4gYmUgZXh0ZW5kZWQgZm9yIHRoYXQgdXNlIGNh
c2UsIG9yIGlmIGl0J3Mgc29tZXRoaW5nDQo+PiB0aGV5IGFyZSBpbnRlcmVzdGVkIGluIHN1cHBv
cnRpbmcuIEkndmUgc3Vic2NyaWJlZCB0byBncmV5YnVzLWRldiBzbw0KPj4gaG9wZWZ1bGx5IG15
IGVtYWlsIHdpbGwgZ2V0IHRocm91Z2ggdGhpcyB0aW1lIChwcmV2aW91cyBvbmUgaXMgcGVuZGlu
Zw0KPj4gYXBwcm92YWwpLg0KPj4NCj4+IFVuZm9ydHVuYXRlbHksIHdlJ3JlIGRlZXAgZG93biB0
aGUgQ1BDIHJvYWQsIGVzcGVjaWFsbHkgb24gdGhlIGZpcm13YXJlDQo+PiBzaWRlLiBCbGFtZSBv
biBtZSBmb3Igbm90IHNlbmRpbmcgdGhlIFJGQyBzb29uZXIgYW5kIGdldHRpbmcgZmVlZGJhY2sN
Cj4+IGVhcmxpZXIsIGJ1dCBpZiB3ZSBoYXZlIHRvIG1hc3NpdmVseSBjaGFuZ2Ugb3VyIGNvdXJz
ZSBvZiBhY3Rpb24gd2UgbmVlZA0KPj4gc29tZSBkZWdyZWUgb2YgY29uZmlkZW5jZSB0aGF0IHRo
aXMgaXMgYSB2aWFibGUgYWx0ZXJuYXRpdmUgZm9yDQo+PiBhY2hpZXZpbmcgaGlnaC10aHJvdWdo
cHV0IGZvciBXaUZpIG92ZXIgU0RJTy4gSSB3b3VsZCByZWFsbHkgdmFsdWUgYW55DQo+PiBpbnB1
dCBmcm9tIHRoZSBHcmV5YnVzIGZvbGtzIG9uIHRoaXMuDQo+DQo+IFNvIHdoYXQgeW91IGFyZSBs
b29raW5nIGZvciBpcyBhIHN0YW5kYXJkIHdheSB0byAidHVubmVsIiBTRElPIG92ZXIgc29tZQ0K
PiBvdGhlciBwaHlzaWNhbCB0cmFuc3BvcnQsIHJpZ2h0PyAgSWYgc28sIHRoZW4geWVzLCBwbGVh
c2UgdXNlIEdyZXlidXMgYXMNCj4gdGhhdCBpcyBleGFjdGx5IHdoYXQgaXQgd2FzIGRlc2lnbmVk
IGZvci4NCg0KTm8sIHdlIHdhbnQgdG8gdXNlIFNESU8gYXMgcGh5c2ljYWwgdHJhbnNwb3J0LiBU
byB1c2UgdGhlIEdyZXlidXMNCnRlcm1pbm9sb2d5LCBvdXIgTUNVcyB3b3VsZCBhY3QgYXMgbW9k
dWxlcyB3aXRoIGEgc2luZ2xlIGludGVyZmFjZSwgYW5kDQp0aGF0IGludGVyZmFjZSB3b3VsZCBo
YXZlICJyYWRpbyIgYnVuZGxlcyBmb3IgZWFjaCBvZiB0aGUgc3VwcG9ydGVkDQpzdGFjay4NCg0K
U28gd2Ugd2FudCB0byBleHBvc2Ugb3VyIHJhZGlvIHN0YWNrcyBpbiBMaW51eCBhbmQgR3JleWJ1
cyBkb2Vzbid0DQpkZWZpbmUgcHJvdG9jb2xzIGZvciB0aGF0LCBzbyB0aGF0J3Mga2luZCBvZiB1
bmNoYXJ0ZWQgdGVycml0b3JpZXMgYW5kDQp3ZSB3ZXJlIHdvbmRlcmluZyBpZiBHcmV5YnVzIHdv
dWxkIGJlIHRoZSByaWdodCB0b29sIGZvciB0aGF0LiBJIGhvcGUNCnRoZSBzaXR1YXRpb24gaXMg
YSBiaXQgY2xlYXJlciBub3cuDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpncmV5YnVzLWRldiBtYWlsaW5nIGxpc3QgLS0gZ3JleWJ1cy1kZXZAbGlzdHMu
bGluYXJvLm9yZwpUbyB1bnN1YnNjcmliZSBzZW5kIGFuIGVtYWlsIHRvIGdyZXlidXMtZGV2LWxl
YXZlQGxpc3RzLmxpbmFyby5vcmcK
