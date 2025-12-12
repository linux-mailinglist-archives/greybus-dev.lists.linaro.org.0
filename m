Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id E78BBCB93E6
	for <lists+greybus-dev@lfdr.de>; Fri, 12 Dec 2025 17:14:36 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 12C6B400FA
	for <lists+greybus-dev@lfdr.de>; Fri, 12 Dec 2025 16:14:36 +0000 (UTC)
Received: from mx0b-0024c301.pphosted.com (mx0b-0024c301.pphosted.com [148.163.153.153])
	by lists.linaro.org (Postfix) with ESMTPS id 2DEF5400F4
	for <greybus-dev@lists.linaro.org>; Fri, 12 Dec 2025 16:13:39 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=silabs.com header.s=pps12202023 header.b=IhYqpa5T;
	dkim=pass header.d=silabs.com header.s=selector1 header.b=bSaQD+2e;
	spf=pass (lists.linaro.org: domain of Damien.Riegel@silabs.com designates 148.163.153.153 as permitted sender) smtp.mailfrom=Damien.Riegel@silabs.com;
	dmarc=pass (policy=reject) header.from=silabs.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from pps.filterd (m0101742.ppops.net [127.0.0.1])
	by mx0a-0024c301.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BCFG5gJ2052805;
	Fri, 12 Dec 2025 10:13:30 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps12202023;
	 bh=LTtRpSTkZ0Z7ZtAuT9bBmc0kmx0K4Lz2Ox5KjlCE39Q=; b=IhYqpa5TKmlu
	sPHtVGmP8+OEZdWb33XvDLgjEd2APugtV0qA4Ea34ghPfQZsmG9cnakVOd0e9bV/
	9LMeq0w8OPqfHJ0RafztRWUWoVkd0/GlnsDrm/O7mcwTbGZDoNlNnfxSI8Yd9QCZ
	2XaQESkebW1QYFLiLz0ij4RfCWCXCg0+uqBpnJmwtxeH26puwKXaJ0D95/MUAq5Q
	D1s02osW+kNTrWrytTABkWPj3DYOnT3dbX3icePqSvILm/8HVGq1+YJtmPJmgJY8
	lZwxa3FCPSE7Cj5v2xk4fsIcda/fb43jQB0yP+3a7QYylB4h1tJsMmrJZACjnbtI
	STTaZZ4THg==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11022103.outbound.protection.outlook.com [52.101.43.103])
	by mx0a-0024c301.pphosted.com (PPS) with ESMTPS id 4aykqe47hr-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 12 Dec 2025 10:13:30 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aBoqEG/UnsC1o4knMtqulTetqziLUFuSrGJ2aovBT78gGOvhIl8fIlwE/U5zR7QDBEi4rdGwLH0Jwk9E1xakQTNMbo1OVLZ555wAYhZ3kc8RFLJRrgbhBFTnXvWBxoVGX/vMCVBvX0OT4a2weGG+gTZghV1VbLM77r+uUm68Vdo/7fdhtxSpiDGWAcFAwuQNFgpMRsl/UCWayazoSxbE5IUZUyX7TmqDlr2ziwH1ov3B42O7m47wuKWBxNq+tl/z7mYv8/CMHydVnDSByL3OKVO8Da8ru39shvbSRyM4+lWBSAHPddnWkHUZj/wx+t9H8ZITtSdRoQl469DNnFSEMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LTtRpSTkZ0Z7ZtAuT9bBmc0kmx0K4Lz2Ox5KjlCE39Q=;
 b=ARVgWKAKCjRhMYeJUqLc6+M10vCZM+5euyWc9Fno+orTl/LIugCZrSdiCVhswPhUoyzgPJG86hqJ7bUXgEJbyKg/ETDdTQuWbX4Qg6CWg4O8j1BSSDrVuZqa4CtILdGPfEmvh6XlXujeaG4y6h53y5ABE9RT7SoN9zA8SPI4jpLq+AQbDNjqGGhZX8cPKiKSjS9/iMOx5TnbVxdAjxtswpl+Ju72jEkhUMpo4XhCytkIfOlhBZA269dXre0Fr3+vzHht7rOaBlGyDeyBZhp3/eMAIcwercTDNzdv4Y4wFUruSmxzkdub4wDxn1s68D6jn9qGyGJkxpqcqsYhYITB3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silabs.com; dmarc=pass action=none header.from=silabs.com;
 dkim=pass header.d=silabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LTtRpSTkZ0Z7ZtAuT9bBmc0kmx0K4Lz2Ox5KjlCE39Q=;
 b=bSaQD+2e2p+WL9sqsNXQUlonpphQlrLKr+HXlxWSYnUdxpFoHj80jp8+hJ1rgHSoFL7d7sFmbniIZejkaQq/yxd4S+4mFGV0N5EeWtbZxCi3TZcGhcDJzlhT/7srfEUQiuyGtL3zoBIMiGuiX3eFnR266HBTK+m2i/MlZN1P0YQ=
Received: from DS0PR11MB8205.namprd11.prod.outlook.com (2603:10b6:8:162::17)
 by DM3PPF7468F7991.namprd11.prod.outlook.com (2603:10b6:f:fc00::f2d) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.9; Fri, 12 Dec
 2025 16:13:27 +0000
Received: from DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::2de6:bc88:2af7:3583]) by DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::2de6:bc88:2af7:3583%3]) with mapi id 15.20.9412.005; Fri, 12 Dec 2025
 16:13:27 +0000
From: =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
To: greybus-dev@lists.linaro.org
Date: Fri, 12 Dec 2025 11:13:02 -0500
Message-ID: <20251212161308.25678-9-damien.riegel@silabs.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251212161308.25678-1-damien.riegel@silabs.com>
References: <20251212161308.25678-1-damien.riegel@silabs.com>
X-ClientProxiedBy: YQZPR01CA0176.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:8b::25) To DS0PR11MB8205.namprd11.prod.outlook.com
 (2603:10b6:8:162::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8205:EE_|DM3PPF7468F7991:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b1b28fd-e9e4-4365-d26d-08de3999624c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?dTJXTHRRNEdiTVJWRWxUMEtOSmpURFBDc1BDU04yVFpKc1JlRk1LbTlDdjUv?=
 =?utf-8?B?K3BvcXFjcEZEMEgrRzFrM0xlRzRDUXBScnJ2MFJVbGo2WnNvWFpVbG9seldr?=
 =?utf-8?B?UG5BQk85QjRhakY4R0ZPYjY3T2ZjSkliUnBNT0h3RDlpYU5OMytmMUU5UXlB?=
 =?utf-8?B?WE4rZW00R3RFeC9ueGZ4ckhoN3lobEZ5Z0VOeUlKa3ZrbjRsdUVIVnJwWno3?=
 =?utf-8?B?R2F1OUx0RGMwWlRFMjJyRmMxS3k5Nm9RTFRIWVpBTGR3MXlUVDd6ODZLY3Yv?=
 =?utf-8?B?UnBqSXFtUTJxUldjRzhuUlh4dHArdE5IL1NVVm1OY3VKYjBVcEozRCt5SkNh?=
 =?utf-8?B?aXozVm8rSURWVjB4Q3lsNm1reTBkeDQyc3l5WkJUZ0V2enpjd2JvS1I5eTI0?=
 =?utf-8?B?ZlVVM21TditVajFUTXgveWxOVXJITFFXNjFkUEV0VENwUTRXZFVpamlUeEdH?=
 =?utf-8?B?Q1JPeUZncHFZRGFKOUlyK25KbmU1ZHVpbWN1R3lKU1hZaitxWTAvMXNZY2Zt?=
 =?utf-8?B?R3RwRzQ1Wm9QN2ZlMTJlNFQ3MzFPVkxwZTFvNG5oUXJQdzRYNFQrWUZCZFQ1?=
 =?utf-8?B?YjJjM3dVVFg2Z1dZcUlxV2hXTGFRYis2dWJLcnBEaG1OZzVYVVhHY1FTV080?=
 =?utf-8?B?SklreEd4R0IvWnR4Yjl1NWtjWUh5b0NKaXQwTkpLaTl3M3JJYXN3WXRyS2pn?=
 =?utf-8?B?aHdBQkVNZ1ZrREJSOVNsUElYdDJjdWlzTFFFakQ2R2lLMkM5aCtKaTFNUzFC?=
 =?utf-8?B?VmNtakIzSm0rR1BBbExCd1NmQnlWSzF6bTlua2lIVUNEZTkrajZnVXAyUHlw?=
 =?utf-8?B?aVRiY0hsSy9DR0ZPVzlVMFY2Tk8zVVBnaG9HU1YzeXdZTVZLd3ZxL3oyODNS?=
 =?utf-8?B?ankwNklkYmNONGt5R280ZnpidWlyWTBHRWs1dzlMOG5xMGF4azhFQ3J5Nm12?=
 =?utf-8?B?WUxQSVRhQmliUHZtUFpLVkppWWhTTllzVjljSmhwalkvRzdmQjR2RUJHVXRI?=
 =?utf-8?B?OHRkOU83cHFvanc5cExDaEU4a0RSUDJ2cHlEdzV5Zlh3S1ppRHFnOEN1ZHl0?=
 =?utf-8?B?NGsxN3BtUVBTNG56SlQrV0JxUXJHb25EVlJ2SjBMZlYvK01FdTZ3Z1dJcVNZ?=
 =?utf-8?B?OGRPelhlbDJZSEh2Z3NMejQ4T3duSmVqL2p4WUFzZGtoYStSQURsZmUwSXJS?=
 =?utf-8?B?QzBDOXBPL3ppNGU3TVJSdjB6Uk40Z2p0UEpMZTBHVWplclpJWGZVWEpyTFcz?=
 =?utf-8?B?cVhtVHB5Y2NyU2dMaEJEQjRGMDR4QUtDY2VBUnEwN2phaG4xZTNDem0zbGdx?=
 =?utf-8?B?OUtwelNsSTREa1lWaTdlQjZrTmhGYzNvZTh2RTN1eGVNQjBWcXplMGFpTExs?=
 =?utf-8?B?c1F0OTNkc0x5aVF1RHVmVWdtYjRWbkpOYlJjNDQ3dWswYXJ2OXYvTU5NRkZM?=
 =?utf-8?B?VGtoMWFkWEYwTVJiN0Q5Y3g2ZEVweXhJMm1ZM284eWhZWTNIcHd0c2N0cjBz?=
 =?utf-8?B?VjBzUmNvSkVJMnJGS0VJT3lnZDhhdXhNNjArQmE4NUJkRDdpSGZSdHhBeUJZ?=
 =?utf-8?B?dGJUa0JaRXhHMmtxaDZMMCtiNW1LU2dtQWtpeXVhalR3MFMxRnJsMjd3bHQ3?=
 =?utf-8?B?ZWhkOEJLMUh4QUVJcWJWMkI5aXNYeTgzK01GT3gyUHVPOHRNRFhzejV4MWZO?=
 =?utf-8?B?a3VMVzNUTzFZMFYrbmVxY0FGOWRsR05IUkhpYllOVkxQeEZieUtjNmxsSE55?=
 =?utf-8?B?N1NkZ3VEUHNWeEV4Wksrc08yNzdnVHlQK2NYYzJxeEE0NW5nTDBDMGJnZUx2?=
 =?utf-8?B?RkZJRDg4Uk5YYjNmalVJWmVTMnQySjBGeTZpeDZ3SGk0TFUxN1pOQnRrVjRW?=
 =?utf-8?B?QkFaYXJNOTBid3U4VGtzQVVyWUI2amNPZi9jRVJjcUQyZFlGWFVvYndWU2pw?=
 =?utf-8?B?WXlxdktBczFZc3VYY2IxYUsvbTNYTGk0bnZ5bGUwOXlZR042NlpnWGhHYjNv?=
 =?utf-8?B?cDRycHNiMEppWVhnU0lhbG01M0FJT0h3ZlovcURtS2U5d2F0L1VjTGxoc2dL?=
 =?utf-8?Q?n6XROS?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8205.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bGNIMUtKbXdmcTJ5Q2NRY3F0Nk1aLzJvMndQZFVJUTUycWJLNzd2UkwvQzhs?=
 =?utf-8?B?S29LRnIzY0hKQ0prc3ZmYTV1d0o3SnFWNzMyYk9ldFFnbyt0SldFRDFOOWM0?=
 =?utf-8?B?R1JRVThqb2ZGeVdZZU9RZ29sREFneW5DdHh4SGlsdEk3WVlNcS9aalQ4VzZu?=
 =?utf-8?B?L285VndoaHU1N0pDdzkrY0d0bFpqV0hJWlNDcTBMLy9VcE96bGFPb3AwM3p2?=
 =?utf-8?B?R0M0d3BMT0w2Z1N1TlFEUCtjZytZai9xbFdpSW42RDlBMVQzczZwR2d3ZzNX?=
 =?utf-8?B?NEJvMXlzUm9pUGtjZ2RTclBGcllWZ1NTSjBmRUY5bG9QM0JobnJmYjlBMU5r?=
 =?utf-8?B?SVBjTytnR0dyM29XcmZnSFVzeDkyYkt4VnBlNWJ1RmRDL01uSC91QXRnN2Mw?=
 =?utf-8?B?WHhzSTNKdjFZQVhuSXlIdUJoazZGaUxVVlhSRnZLbVZYTDBoSHFldS9WS2RC?=
 =?utf-8?B?VlRQWHVxVkN4SzFyb0laTE00NnpkOUsvZHlXUDZDUGQxT2lyL08zS3Z0TU1k?=
 =?utf-8?B?Tk1Nem5UOWRDditYR2lvdmpnb3RFQnVRMlFwWUpVcGxRWDErdm5KQndiWWJM?=
 =?utf-8?B?dkZ4aVU1YkZnZVRlR1YyN1o5cFdTS3hzTGp0Z2FqMWtMMGRyRlYzRndRNE5W?=
 =?utf-8?B?NW5WTDhiQmJzaVhvUWVETmVPNGRDekMwM3V6ZHV0dzBaZzcxV2hBVW5RS0Z2?=
 =?utf-8?B?TXU1cklEcXVIOGJUREtjZE9CT0hMdjU2bkNESDZEeWxjM3doTENQczRhY0J3?=
 =?utf-8?B?amJKUm85MkJmbHlKdlBVNGZPZkdJMDl5aEJPM29DUS9JQno4L0xZOVkxSlJr?=
 =?utf-8?B?clVvQ01mSWtkTFZTZkFVMXB4NnUvQ3IwRzRSc0tKbHFDZHZjUlBQMWg1Uzh2?=
 =?utf-8?B?dnFXMUhzSmN6NENzUWZBanVDWXg3Q2pENTFyNE9IWGNtK2pxUHBLcDVGUEVn?=
 =?utf-8?B?UkozdjRrUmFuOU41VWsyNzAvQXFVT3RSV2lsZXNRREpnTVJWN0JoNDVqZnZR?=
 =?utf-8?B?MUk1QUpyZGhlTDJKS3FMQmVWT2xVdWdmMkpWcVlobVVkZk9qeWNRSU5UVGNi?=
 =?utf-8?B?cit1NVg3aiszVXVGYUJPOUJMVjQrTGJ1NDMzK0xoNlpLNGZoa2NIcUNsaENz?=
 =?utf-8?B?cnd0djljdzNublNPQUpjVGZROFc2TlVXeFkrWXpVazNLcWY0bG1IWHgxWTV4?=
 =?utf-8?B?RFNOdEYycjRMRzNoU2owT014OVQvdERYQ2JUY2VwdVZXTmRuRzlVMkVuN3hU?=
 =?utf-8?B?L1NuWDQ0eXFpM2N2R1ZmM3FLL2MxWTFvL2p3dXVyZlhyQjY2OGtsN0lsSzNM?=
 =?utf-8?B?bUVyd3RvaDZHTGZTaGVHam9Yb0RwaSs1T0xtekVZcmlmbnhRY2VPRkpGS1BX?=
 =?utf-8?B?cE50Q1c5dkJQVHh2YmZ2VVJJRnBvVTZ2SVZDbnFPNkVxRnRXZi9BZ3lnMjVv?=
 =?utf-8?B?OU5BaWdWSG01Umxhc2tMUGU4dHlYSlREbk0vSllZSDI0K3Z5UDF0KzJCU0dq?=
 =?utf-8?B?MzNJSEQvRmRxR3EybmpMMDdKSlhUL0hGQ2ZlMVZ5bVF1ZjhqUlYyUlRFYkF5?=
 =?utf-8?B?dUJBZ3BsK3JNN2JUaCt6aXRyQklFb0pPUHJpZmU5SzR2RWJ6ZUVJS1VSZm56?=
 =?utf-8?B?cWFNNU85bmxRelNSQWlnK1pmMGVjaU9nSjNwOEpkNGNPQ0NITjV3bjUvdjBS?=
 =?utf-8?B?RS8rVzQ0ZUlnNEdFOGNBTlJXYk16ZkZqazEyZ0hFUjRnQm5hN1E0SUpZalZ3?=
 =?utf-8?B?cmZJUEtFYVB6eWhpdjhMbTB5dEpuYVpMVlEvNG5EaWpsVHZCOUVkNEp0aDdz?=
 =?utf-8?B?QktWNktpWFFoN0ZaSmxUa0E3S1VJL0t0ZjVYWHRieEdMWVIwUDQ2c2doS2lp?=
 =?utf-8?B?UFFrTTRNTFA5LzRVUDE4YkZTcHBkYXhXUkpxamhhbHNGOW5UY0lNdDhrL3pN?=
 =?utf-8?B?VEcxZlZNZ2VEd1lJQ1p3alhIb0pqQjlBUGowL0tzRjgrK2hTSG9CbDFuUnpD?=
 =?utf-8?B?N1VnM2lvWFpkcmpGSFdJT3JjeUpkc1ZpTFFYNU9JMGNRZWNEKzZZM2paaVM5?=
 =?utf-8?B?SncwSG5ReHRkREliQWlISSttbDdhcGpQaGsxaXZUUFh3SzgyYjFUSTlaMUd1?=
 =?utf-8?Q?lxQGZrc+K8X3ghcw++oyKd8PC?=
X-OriginatorOrg: silabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b1b28fd-e9e4-4365-d26d-08de3999624c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8205.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 16:13:27.6903
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 54dbd822-5231-4b20-944d-6f4abcd541fb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WUJDMuuqpR0NhlvaRNWV5VDGCk5/Sh0lNH0EMjKx1aipXZbUGrSZRdFMGyoIdMqrfYTS391ux1J4+6EJUy5hpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF7468F7991
X-Proofpoint-ORIG-GUID: 2_rMyhrWC8CWO5uCXxGgPue0RCoWSY9i
X-Authority-Analysis: v=2.4 cv=brxBxUai c=1 sm=1 tr=0 ts=693c3f2a cx=c_pps
 a=poLntA6gJg8PyknBlaXY5w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=M51BFTxLslgA:10
 a=i1IsUcr2s-wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=2AEO0YjSAAAA:8
 a=vN7oVFPIg2LUC2IVNO8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEyMDEyOCBTYWx0ZWRfX4IMHebIVycLy
 G8ZdkFClRlFTM3iAX+z8oDY+29CoapZieH3cUdTjIH7hY5TqBeF5ki7SypiU2eWwKpRUFovp3ev
 /YYJb+RQExM+egzzeuogY9YuFRaSVdRLYh2XioVitVP1AFhvBnHrcyUpXlCeTljZfAFjm1qtn+p
 7QJp2Fe+6meAmAT09eQUBJ3QYVcAMzzFq6fv+S1B/wPjyfkkxXKj1pIHgsLgeIbcmJjksRXjY8b
 hwL1SIbSxR+FNLItixrjU2OLFrvILJba+ztBKUSS2wkqEhxeYft5gt0su4Z9hCb+95VA+t2G0+v
 3R+ZsiGsxN8JDqLZlRST8pSJEv3VROFG3E80VInUQ1eejOR8pWZLpeyXeM2qoEixwe1fj0c8DMX
 RF1k58ZCgKj/rpoGY2/zdZNoioGH9Q==
X-Proofpoint-GUID: 2_rMyhrWC8CWO5uCXxGgPue0RCoWSY9i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-12_04,2025-12-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 phishscore=0 spamscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512120128
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.10 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[silabs.com,reject];
	R_DKIM_ALLOW(-0.20)[silabs.com:s=pps12202023,silabs.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:148.163.153.153];
	RCVD_IN_DNSWL_LOW(-0.10)[148.163.153.153:from];
	MIME_GOOD(-0.10)[text/plain];
	ASN(0.00)[asn:22843, ipnet:148.163.152.0/22, country:US];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	BLOCKLISTDE_FAIL(0.00)[148.163.153.153:server fail,52.101.43.103:server fail,2603:10b6:8:162::17:server fail];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_IN_DNSWL_NONE(0.00)[52.101.43.103:received];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DNSWL_BLOCKED(0.00)[2603:10b6:8:162::17:received];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[silabs.com:+]
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 2DEF5400F4
X-Spamd-Bar: ----
Message-ID-Hash: RNCVMNLH3XLKXIHOSGMHJ2GNSXWOYFE3
X-Message-ID-Hash: RNCVMNLH3XLKXIHOSGMHJ2GNSXWOYFE3
X-MailFrom: Damien.Riegel@silabs.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, Silicon Labs Kernel Team <linux-devel@silabs.com>, =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH 08/14] greybus: cpc: add and validate sequence numbers
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/RNCVMNLH3XLKXIHOSGMHJ2GNSXWOYFE3/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

VGhlIGZpcnN0IHN0ZXAgaW4gbWFraW5nIHRoZSBDUEMgaGVhZGVyIGFjdHVhbGx5IGRvIHNvbWV0
aGluZyBpcyB0byBhZGQNCnRoZSBzZXF1ZW5jZSBudW1iZXIgdG8gb3V0Z29pbmcgbWVzc2FnZXMg
YW5kIHZhbGlkYXRlIHRoYXQgaW5jb21pbmcNCmZyYW1lcyBhcmUgcmVjZWl2ZWQgaW4gb3JkZXIu
DQoNCkF0IHRoaXMgc3RhZ2UsIHRoZSBkcml2ZXIgZG9lc24ndCBzZW5kIHN0YW5kYWxvbmUgYWNr
cywgc28gaWYgYSBtZXNzYWdlDQp3aXRoIFNlcXVlbmNlIFggaXMgcmVjZWl2ZWQsIHRoZSByZW1v
dGUgd2lsbCBub3QgYmUgYWNrbm93bGVkZ2VkIHVudGlsIGENCm1lc3NhZ2UgdGFyZ2V0aW5nIHRo
YXQgQ1BvcnQgY29tZXMgZnJvbSB0aGUgR3JleWJ1cyBsYXllci4gT25seSB0aGVuIHRoZQ0KZHJp
dmVyIHdpbGwgYWNrIHdpdGggYWNrbm93bGVkZ2VkbWVudCBudW1iZXIgb2YgWCArIDEuDQoNClNp
Z25lZC1vZmYtYnk6IERhbWllbiBSacOpZ2VsIDxkYW1pZW4ucmllZ2VsQHNpbGFicy5jb20+DQot
LS0NCiBkcml2ZXJzL2dyZXlidXMvY3BjL01ha2VmaWxlICAgfCAgMiArLQ0KIGRyaXZlcnMvZ3Jl
eWJ1cy9jcGMvY3BjLmggICAgICB8IDIwICsrKysrKysrKysrKysrKw0KIGRyaXZlcnMvZ3JleWJ1
cy9jcGMvY3BvcnQuYyAgICB8IDI1ICsrKysrKysrKysrKysrKysrKw0KIGRyaXZlcnMvZ3JleWJ1
cy9jcGMvaGVhZGVyLmMgICB8IDE3ICsrKysrKysrKysrKw0KIGRyaXZlcnMvZ3JleWJ1cy9jcGMv
aGVhZGVyLmggICB8ICAyICsrDQogZHJpdmVycy9ncmV5YnVzL2NwYy9ob3N0LmMgICAgIHwgMTMg
KysrKysrKy0tLQ0KIGRyaXZlcnMvZ3JleWJ1cy9jcGMvcHJvdG9jb2wuYyB8IDQ3ICsrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysNCiA3IGZpbGVzIGNoYW5nZWQsIDEyMSBpbnNlcnRp
b25zKCspLCA1IGRlbGV0aW9ucygtKQ0KIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dyZXli
dXMvY3BjL2hlYWRlci5jDQogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3JleWJ1cy9jcGMv
cHJvdG9jb2wuYw0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncmV5YnVzL2NwYy9NYWtlZmlsZSBi
L2RyaXZlcnMvZ3JleWJ1cy9jcGMvTWFrZWZpbGUNCmluZGV4IDNkNTBmOGM1NDczLi5jNGI1MzBk
MjdhMyAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3JleWJ1cy9jcGMvTWFrZWZpbGUNCisrKyBiL2Ry
aXZlcnMvZ3JleWJ1cy9jcGMvTWFrZWZpbGUNCkBAIC0xLDYgKzEsNiBAQA0KICMgU1BEWC1MaWNl
bnNlLUlkZW50aWZpZXI6IEdQTC0yLjANCiANCi1nYi1jcGMteSA6PSBjcG9ydC5vIGhvc3Qubw0K
K2diLWNwYy15IDo9IGNwb3J0Lm8gaGVhZGVyLm8gaG9zdC5vIHByb3RvY29sLm8NCiANCiAjIENQ
QyBjb3JlDQogb2JqLSQoQ09ORklHX0dSRVlCVVNfQ1BDKQkrPSBnYi1jcGMubw0KZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3JleWJ1cy9jcGMvY3BjLmggYi9kcml2ZXJzL2dyZXlidXMvY3BjL2NwYy5o
DQppbmRleCA2MjU5Nzk1NzgxNC4uODdiNTRhNGZkMzQgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dy
ZXlidXMvY3BjL2NwYy5oDQorKysgYi9kcml2ZXJzL2dyZXlidXMvY3BjL2NwYy5oDQpAQCAtOCwx
NyArOCwzMiBAQA0KIA0KICNpbmNsdWRlIDxsaW51eC9kZXZpY2UuaD4NCiAjaW5jbHVkZSA8bGlu
dXgvZ3JleWJ1cy5oPg0KKyNpbmNsdWRlIDxsaW51eC9tdXRleC5oPg0KICNpbmNsdWRlIDxsaW51
eC90eXBlcy5oPg0KIA0KK3N0cnVjdCBza19idWZmOw0KKw0KIC8qKg0KICAqIHN0cnVjdCBjcGNf
Y3BvcnQgLSBDUEMgY3BvcnQNCiAgKiBAaWQ6IGNwb3J0IElEDQogICogQGNwY19oZDogcG9pbnRl
ciB0byB0aGUgQ1BDIGhvc3QgZGV2aWNlIHRoaXMgY3BvcnQgYmVsb25ncyB0bw0KKyAqIEBsb2Nr
OiBtdXRleCB0byBzeW5jaHJvbml6ZSBhY2Nlc3NlcyB0byB0Y2IgYW5kIG90aGVyIGF0dHJpYnV0
ZXMNCisgKiBAdGNiOiBUcmFuc21pc3Npb24gQ29udHJvbCBCbG9jaw0KICAqLw0KIHN0cnVjdCBj
cGNfY3BvcnQgew0KIAl1MTYgaWQ7DQogDQogCXN0cnVjdCBjcGNfaG9zdF9kZXZpY2UgKmNwY19o
ZDsNCisJc3RydWN0IG11dGV4IGxvY2s7IC8qIFN5bmNocm9uaXplIGFjY2VzcyB0byBzdGF0ZSB2
YXJpYWJsZXMgKi8NCisNCisJLyoNCisJICogQGFjazogY3VycmVudCBhY2tub3dsZWRnZSBudW1i
ZXINCisJICogQHNlcTogY3VycmVudCBzZXF1ZW5jZSBudW1iZXINCisJICovDQorCXN0cnVjdCB7
DQorCQl1OCBhY2s7DQorCQl1OCBzZXE7DQorCX0gdGNiOw0KIH07DQogDQogc3RydWN0IGNwY19j
cG9ydCAqY3BjX2Nwb3J0X2FsbG9jKHUxNiBjcG9ydF9pZCwgZ2ZwX3QgZ2ZwX21hc2spOw0KQEAg
LTM0LDggKzQ5LDEzIEBAIHN0cnVjdCBjcGNfc2tiX2NiIHsNCiANCiAJLyogS2VlcCB0cmFjayBv
ZiB0aGUgR0IgbWVzc2FnZSB0aGUgc2tiIG9yaWdpbmF0ZXMgZnJvbSAqLw0KIAlzdHJ1Y3QgZ2Jf
bWVzc2FnZSAqZ2JfbWVzc2FnZTsNCisNCisJdTggc2VxOw0KIH07DQogDQogI2RlZmluZSBDUENf
U0tCX0NCKF9fc2tiKSAoKHN0cnVjdCBjcGNfc2tiX2NiICopJigoX19za2IpLT5jYlswXSkpDQog
DQordm9pZCBjcGNfcHJvdG9jb2xfcHJlcGFyZV9oZWFkZXIoc3RydWN0IHNrX2J1ZmYgKnNrYiwg
dTggYWNrKTsNCit2b2lkIGNwY19wcm90b2NvbF9vbl9kYXRhKHN0cnVjdCBjcGNfY3BvcnQgKmNw
b3J0LCBzdHJ1Y3Qgc2tfYnVmZiAqc2tiKTsNCisNCiAjZW5kaWYNCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dyZXlidXMvY3BjL2Nwb3J0LmMgYi9kcml2ZXJzL2dyZXlidXMvY3BjL2Nwb3J0LmMNCmlu
ZGV4IDBmYzRmZjBjNWJiLi4yZWUwYjEyOTk5NiAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3JleWJ1
cy9jcGMvY3BvcnQuYw0KKysrIGIvZHJpdmVycy9ncmV5YnVzL2NwYy9jcG9ydC5jDQpAQCAtOSw2
ICs5LDE2IEBADQogI2luY2x1ZGUgImNwYy5oIg0KICNpbmNsdWRlICJob3N0LmgiDQogDQorLyoq
DQorICogY3BjX2Nwb3J0X3RjYl9yZXNldCgpIC0gUmVzZXQgY3BvcnQncyBUQ0IgdG8gaW5pdGlh
bCB2YWx1ZXMuDQorICogQGNwb3J0OiBjcG9ydCBwb2ludGVyDQorICovDQorc3RhdGljIHZvaWQg
Y3BjX2Nwb3J0X3RjYl9yZXNldChzdHJ1Y3QgY3BjX2Nwb3J0ICpjcG9ydCkNCit7DQorCWNwb3J0
LT50Y2IuYWNrID0gMDsNCisJY3BvcnQtPnRjYi5zZXEgPSAwOw0KK30NCisNCiAvKioNCiAgKiBj
cGNfY3BvcnRfYWxsb2MoKSAtIEFsbG9jYXRlIGFuZCBpbml0aWFsaXplIENQQyBjcG9ydC4NCiAg
KiBAY3BvcnRfaWQ6IGNwb3J0IElELg0KQEAgLTI1LDYgKzM1LDkgQEAgc3RydWN0IGNwY19jcG9y
dCAqY3BjX2Nwb3J0X2FsbG9jKHUxNiBjcG9ydF9pZCwgZ2ZwX3QgZ2ZwX21hc2spDQogCQlyZXR1
cm4gTlVMTDsNCiANCiAJY3BvcnQtPmlkID0gY3BvcnRfaWQ7DQorCWNwY19jcG9ydF90Y2JfcmVz
ZXQoY3BvcnQpOw0KKw0KKwltdXRleF9pbml0KCZjcG9ydC0+bG9jayk7DQogDQogCXJldHVybiBj
cG9ydDsNCiB9DQpAQCAtNjQsMTAgKzc3LDIyIEBAIGludCBjcGNfY3BvcnRfdHJhbnNtaXQoc3Ry
dWN0IGNwY19jcG9ydCAqY3BvcnQsIHN0cnVjdCBza19idWZmICpza2IpDQogew0KIAlzdHJ1Y3Qg
Y3BjX2hvc3RfZGV2aWNlICpjcGNfaGQgPSBjcG9ydC0+Y3BjX2hkOw0KIAlzdHJ1Y3QgZ2Jfb3Bl
cmF0aW9uX21zZ19oZHIgKmdiX2hkcjsNCisJdTggYWNrOw0KIA0KIAkvKiBJbmplY3QgY3BvcnQg
SUQgaW4gR3JleWJ1cyBoZWFkZXIgKi8NCiAJZ2JfaGRyID0gKHN0cnVjdCBnYl9vcGVyYXRpb25f
bXNnX2hkciAqKXNrYi0+ZGF0YTsNCiAJY3BjX2Nwb3J0X3BhY2soZ2JfaGRyLCBjcG9ydC0+aWQp
Ow0KIA0KKwltdXRleF9sb2NrKCZjcG9ydC0+bG9jayk7DQorDQorCUNQQ19TS0JfQ0Ioc2tiKS0+
c2VxID0gY3BvcnQtPnRjYi5zZXE7DQorDQorCWNwb3J0LT50Y2Iuc2VxKys7DQorCWFjayA9IGNw
b3J0LT50Y2IuYWNrOw0KKw0KKwltdXRleF91bmxvY2soJmNwb3J0LT5sb2NrKTsNCisNCisJY3Bj
X3Byb3RvY29sX3ByZXBhcmVfaGVhZGVyKHNrYiwgYWNrKTsNCisNCiAJcmV0dXJuIGNwY19oZF9z
ZW5kX3NrYihjcGNfaGQsIHNrYik7DQogfQ0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3JleWJ1cy9j
cGMvaGVhZGVyLmMgYi9kcml2ZXJzL2dyZXlidXMvY3BjL2hlYWRlci5jDQpuZXcgZmlsZSBtb2Rl
IDEwMDY0NA0KaW5kZXggMDAwMDAwMDAwMDAuLjYyOTQ2ZDYwNzdlDQotLS0gL2Rldi9udWxsDQor
KysgYi9kcml2ZXJzL2dyZXlidXMvY3BjL2hlYWRlci5jDQpAQCAtMCwwICsxLDE3IEBADQorLy8g
U1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjANCisvKg0KKyAqIENvcHlyaWdodCAoYykg
MjAyNSwgU2lsaWNvbiBMYWJvcmF0b3JpZXMsIEluYy4NCisgKi8NCisNCisjaW5jbHVkZSAiaGVh
ZGVyLmgiDQorDQorLyoqDQorICogY3BjX2hlYWRlcl9nZXRfc2VxKCkgLSBHZXQgdGhlIHNlcXVl
bmNlIG51bWJlci4NCisgKiBAaGRyOiBDUEMgaGVhZGVyLg0KKyAqDQorICogUmV0dXJuOiBTZXF1
ZW5jZSBudW1iZXIuDQorICovDQordTggY3BjX2hlYWRlcl9nZXRfc2VxKGNvbnN0IHN0cnVjdCBj
cGNfaGVhZGVyICpoZHIpDQorew0KKwlyZXR1cm4gaGRyLT5zZXE7DQorfQ0KZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3JleWJ1cy9jcGMvaGVhZGVyLmggYi9kcml2ZXJzL2dyZXlidXMvY3BjL2hlYWRl
ci5oDQppbmRleCBhZmNjYzk0MTcyNi4uMmE2NGFhOGQyNzggMTAwNjQ0DQotLS0gYS9kcml2ZXJz
L2dyZXlidXMvY3BjL2hlYWRlci5oDQorKysgYi9kcml2ZXJzL2dyZXlidXMvY3BjL2hlYWRlci5o
DQpAQCAtNDEsNCArNDEsNiBAQCBzdHJ1Y3QgY3BjX2hlYWRlciB7DQogI2RlZmluZSBDUENfSEVB
REVSX1NJWkUgKHNpemVvZihzdHJ1Y3QgY3BjX2hlYWRlcikpDQogI2RlZmluZSBHUkVZQlVTX0hF
QURFUl9TSVpFIChzaXplb2Yoc3RydWN0IGdiX29wZXJhdGlvbl9tc2dfaGRyKSkNCiANCit1OCBj
cGNfaGVhZGVyX2dldF9zZXEoY29uc3Qgc3RydWN0IGNwY19oZWFkZXIgKmhkcik7DQorDQogI2Vu
ZGlmDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncmV5YnVzL2NwYy9ob3N0LmMgYi9kcml2ZXJzL2dy
ZXlidXMvY3BjL2hvc3QuYw0KaW5kZXggYzg5NjE3NjIzZTguLjdmMDU3OWZkZTI2IDEwMDY0NA0K
LS0tIGEvZHJpdmVycy9ncmV5YnVzL2NwYy9ob3N0LmMNCisrKyBiL2RyaXZlcnMvZ3JleWJ1cy9j
cGMvaG9zdC5jDQpAQCAtMjA5LDE5ICsyMDksMjQgQEAgRVhQT1JUX1NZTUJPTF9HUEwoY3BjX2hk
X21lc3NhZ2Vfc2VudCk7DQogdm9pZCBjcGNfaGRfcmN2ZChzdHJ1Y3QgY3BjX2hvc3RfZGV2aWNl
ICpjcGNfaGQsIHN0cnVjdCBza19idWZmICpza2IpDQogew0KIAlzdHJ1Y3QgZ2Jfb3BlcmF0aW9u
X21zZ19oZHIgKmdiX2hkcjsNCisJc3RydWN0IGNwY19jcG9ydCAqY3BvcnQ7DQogCXUxNiBjcG9y
dF9pZDsNCiANCiAJLyogUHJldmVudCBhbiBvdXQtb2YtYm91bmQgYWNjZXNzIGlmIGNhbGxlZCB3
aXRoIG5vbi1zZW5zaWNhbCBwYXJhbWV0ZXJzLiAqLw0KIAlpZiAoc2tiLT5sZW4gPCAoc2l6ZW9m
KCpnYl9oZHIpICsgQ1BDX0hFQURFUl9TSVpFKSkNCiAJCWdvdG8gZnJlZV9za2I7DQogDQotCXNr
Yl9wdWxsKHNrYiwgQ1BDX0hFQURFUl9TSVpFKTsNCi0NCiAJLyogUmV0cmlldmUgY3BvcnQgSUQg
dGhhdCB3YXMgcGFja2VkIGluIEdyZXlidXMgaGVhZGVyICovDQotCWdiX2hkciA9IChzdHJ1Y3Qg
Z2Jfb3BlcmF0aW9uX21zZ19oZHIgKilza2ItPmRhdGE7DQorCWdiX2hkciA9IChzdHJ1Y3QgZ2Jf
b3BlcmF0aW9uX21zZ19oZHIgKikoc2tiLT5kYXRhICsgQ1BDX0hFQURFUl9TSVpFKTsNCiAJY3Bv
cnRfaWQgPSBjcGNfY3BvcnRfdW5wYWNrKGdiX2hkcik7DQogDQotCWdyZXlidXNfZGF0YV9yY3Zk
KGNwY19oZC0+Z2JfaGQsIGNwb3J0X2lkLCBza2ItPmRhdGEsIHNrYi0+bGVuKTsNCisJY3BvcnQg
PSBjcGNfaGRfZ2V0X2Nwb3J0KGNwY19oZCwgY3BvcnRfaWQpOw0KKwlpZiAoIWNwb3J0KSB7DQor
CQlkZXZfd2FybihjcGNfaGRfZGV2KGNwY19oZCksICJjcG9ydCAldSBub3QgYWxsb2NhdGVkXG4i
LCBjcG9ydF9pZCk7DQorCQlnb3RvIGZyZWVfc2tiOw0KKwl9DQorDQorCWNwY19wcm90b2NvbF9v
bl9kYXRhKGNwb3J0LCBza2IpOw0KIA0KIGZyZWVfc2tiOg0KIAlrZnJlZV9za2Ioc2tiKTsNCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dyZXlidXMvY3BjL3Byb3RvY29sLmMgYi9kcml2ZXJzL2dyZXli
dXMvY3BjL3Byb3RvY29sLmMNCm5ldyBmaWxlIG1vZGUgMTAwNjQ0DQppbmRleCAwMDAwMDAwMDAw
MC4uMDM3OTEwZTg5OWYNCi0tLSAvZGV2L251bGwNCisrKyBiL2RyaXZlcnMvZ3JleWJ1cy9jcGMv
cHJvdG9jb2wuYw0KQEAgLTAsMCArMSw0NyBAQA0KKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVy
OiBHUEwtMi4wDQorLyoNCisgKiBDb3B5cmlnaHQgKGMpIDIwMjUsIFNpbGljb24gTGFib3JhdG9y
aWVzLCBJbmMuDQorICovDQorDQorI2luY2x1ZGUgPGxpbnV4L3NrYnVmZi5oPg0KKw0KKyNpbmNs
dWRlICJjcGMuaCINCisjaW5jbHVkZSAiaGVhZGVyLmgiDQorI2luY2x1ZGUgImhvc3QuaCINCisN
Cit2b2lkIGNwY19wcm90b2NvbF9wcmVwYXJlX2hlYWRlcihzdHJ1Y3Qgc2tfYnVmZiAqc2tiLCB1
OCBhY2spDQorew0KKwlzdHJ1Y3QgY3BjX2hlYWRlciAqaGRyOw0KKw0KKwlza2JfcHVzaChza2Is
IHNpemVvZigqaGRyKSk7DQorDQorCWhkciA9IChzdHJ1Y3QgY3BjX2hlYWRlciAqKXNrYi0+ZGF0
YTsNCisJaGRyLT5hY2sgPSBhY2s7DQorCWhkci0+cmVjdl93bmQgPSAwOw0KKwloZHItPmN0cmxf
ZmxhZ3MgPSAwOw0KKwloZHItPnNlcSA9IENQQ19TS0JfQ0Ioc2tiKS0+c2VxOw0KK30NCisNCit2
b2lkIGNwY19wcm90b2NvbF9vbl9kYXRhKHN0cnVjdCBjcGNfY3BvcnQgKmNwb3J0LCBzdHJ1Y3Qg
c2tfYnVmZiAqc2tiKQ0KK3sNCisJc3RydWN0IGNwY19oZWFkZXIgKmNwY19oZHIgPSAoc3RydWN0
IGNwY19oZWFkZXIgKilza2ItPmRhdGE7DQorCXU4IHNlcSA9IGNwY19oZWFkZXJfZ2V0X3NlcShj
cGNfaGRyKTsNCisJYm9vbCBleHBlY3RlZF9zZXEgPSBmYWxzZTsNCisNCisJbXV0ZXhfbG9jaygm
Y3BvcnQtPmxvY2spOw0KKw0KKwlleHBlY3RlZF9zZXEgPSBzZXEgPT0gY3BvcnQtPnRjYi5hY2s7
DQorCWlmIChleHBlY3RlZF9zZXEpDQorCQljcG9ydC0+dGNiLmFjaysrOw0KKwllbHNlDQorCQlk
ZXZfd2FybihjcGNfaGRfZGV2KGNwb3J0LT5jcGNfaGQpLCAidW5leHBlY3RlZCBzZXE6ICV1LCBl
eHBlY3RlZCBzZXE6ICV1XG4iLCBzZXEsDQorCQkJIGNwb3J0LT50Y2IuYWNrKTsNCisNCisJbXV0
ZXhfdW5sb2NrKCZjcG9ydC0+bG9jayk7DQorDQorCWlmIChleHBlY3RlZF9zZXEpIHsNCisJCXNr
Yl9wdWxsKHNrYiwgQ1BDX0hFQURFUl9TSVpFKTsNCisNCisJCWdyZXlidXNfZGF0YV9yY3ZkKGNw
b3J0LT5jcGNfaGQtPmdiX2hkLCBjcG9ydC0+aWQsIHNrYi0+ZGF0YSwgc2tiLT5sZW4pOw0KKwl9
DQorfQ0KLS0gDQoyLjQ5LjANCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZ3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0IC0tIGdyZXlidXMtZGV2QGxpc3Rz
LmxpbmFyby5vcmcKVG8gdW5zdWJzY3JpYmUgc2VuZCBhbiBlbWFpbCB0byBncmV5YnVzLWRldi1s
ZWF2ZUBsaXN0cy5saW5hcm8ub3JnCg==
