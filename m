Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 0022AAF9CFE
	for <lists+greybus-dev@lfdr.de>; Sat,  5 Jul 2025 02:41:29 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 1FC1445700
	for <lists+greybus-dev@lfdr.de>; Sat,  5 Jul 2025 00:41:29 +0000 (UTC)
Received: from mx0a-0024c301.pphosted.com (mx0a-0024c301.pphosted.com [148.163.149.154])
	by lists.linaro.org (Postfix) with ESMTPS id CF47B456B9
	for <greybus-dev@lists.linaro.org>; Sat,  5 Jul 2025 00:41:06 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=silabs.com header.s=pps12202023 header.b=n0eNiGMq;
	dkim=pass header.d=silabs.com header.s=selector1 header.b=NfRlRfv4;
	arc=pass ("microsoft.com:s=arcselector10001:i=1");
	spf=pass (lists.linaro.org: domain of Damien.Riegel@silabs.com designates 148.163.149.154 as permitted sender) smtp.mailfrom=Damien.Riegel@silabs.com;
	dmarc=pass (policy=reject) header.from=silabs.com
Received: from pps.filterd (m0101743.ppops.net [127.0.0.1])
	by mx0a-0024c301.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 564No2mH017370;
	Fri, 4 Jul 2025 19:40:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps12202023;
	 bh=F4gKMnoonnzTBR9A1rN+QuOw6RPsoaVLkuTIs0CJlwQ=; b=n0eNiGMqy0/j
	jRVlHtgvfDfyqSI6KoHZjAi03NoOHcAYv8grKwmmBoNiRcP5Rb7AhDpiCc/Wz8/j
	0WdsLIk09ZrVYjYQfDhx5SoranK0cQLXJKkmK4X6Unl7ukDLN/GGDcdwHOpbWBWl
	PQlugzxAZWqcRY+2/PaihwSmk4FpCS/RRVyhzyhFyagRVMq1h5m9XHKxenSswFyI
	ZihGeglmiI/uZcw/JbV99HCVR8ScFL0hv354CMfyiwF1tv+/SMzNy5PEuyNF3puJ
	h9goEh2yuLRtwt9WvcG08JrQ03onVtUzHMLodW/9VRE+WS4pUUOy+jMaj4ngPL07
	cCbj7id9Kw==
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12on2109.outbound.protection.outlook.com [40.107.244.109])
	by mx0a-0024c301.pphosted.com (PPS) with ESMTPS id 47p8pvhb7y-5
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Jul 2025 19:40:55 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SI/PwOIZxsbg8OL8212rWup8pxCCOoHCs7jIp5cOG1kM0xmMHQlSXfNV41sGOl3dJGNlQaFpcB/UkGuVU3zlL2K+e5VjDF3+FhpF9MLq3z6nnQBz0Jh0auVF94qHeXqpc/xjQsZL6yT3Cjf1l3qIyiRGJtyJVRD1333Yc6/nxaeRLf0EB8PpUOUe+1bJEoXsOne0cvvpsTicwVujppZAluvaRQU4Xtl7OqXHaM7zpEihVZH+8iCmDHGnQM0MpTiZMDoEH25b+zcsUVZwh1qV1I0/hRvLkDwuI7Q+5gRejOZscbjr9eN2xsI/eZwoCnjAE1yvF+FpZz4j+UsjZx08zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F4gKMnoonnzTBR9A1rN+QuOw6RPsoaVLkuTIs0CJlwQ=;
 b=yJgQizAPEf81fqKKiSNXKjrgMK5ZOAt1fc+89UCe12oEx5LXCOuckKeRAlwgl2QfVg/JYcOUruUoNJG2ALKPQH7LOZcE9l9jGvXmgmf7hHiY5+SUHDlyXqj0YcAQzuHjAp2YGUb7uI6tSKWQCkictZiknw/NHqlN+UZ3I/2B2FLnBAlKQnOUwmnbYv5US88b06C9zcf5HvBGtdHJGZOTLRe3VqbD8X6ANB5Eu6ZFKOKyRmNjzpZVClu5S4ApO6SQT98MQnqusyaisOV8sWH9OtZD6KDGZ4t8rsjIK6pKao/UEeAtJDHJg7wdTAQqmTMZIGpsbIGJHlJEbaOnnDx1hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silabs.com; dmarc=pass action=none header.from=silabs.com;
 dkim=pass header.d=silabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F4gKMnoonnzTBR9A1rN+QuOw6RPsoaVLkuTIs0CJlwQ=;
 b=NfRlRfv4ahlaZyjDFeStyHzOyG0Gm7uJ8K6kLwnBxU7iYfjrzcpM0WFX6imupApEYqdqUIfwoO/nm9DIu7AD7gofi6ddo+DOnDRGQQh6VgMIkR/ZesfN7Dy7dn5iXpYlHyjj4OdzEViKfUAUf0xhfs+6N0s5miWctO/zswykEzY=
Received: from DS0PR11MB8205.namprd11.prod.outlook.com (2603:10b6:8:162::17)
 by SA2PR11MB5068.namprd11.prod.outlook.com (2603:10b6:806:116::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.23; Sat, 5 Jul
 2025 00:40:53 +0000
Received: from DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::c508:9b04:3351:524a]) by DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::c508:9b04:3351:524a%4]) with mapi id 15.20.8880.034; Sat, 5 Jul 2025
 00:40:53 +0000
From: =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
To: greybus-dev@lists.linaro.org
Date: Fri,  4 Jul 2025 20:40:34 -0400
Message-ID: <20250705004036.3828-5-damien.riegel@silabs.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250705004036.3828-1-damien.riegel@silabs.com>
References: <20250705004036.3828-1-damien.riegel@silabs.com>
X-ClientProxiedBy: YQZPR01CA0029.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:86::26) To DS0PR11MB8205.namprd11.prod.outlook.com
 (2603:10b6:8:162::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8205:EE_|SA2PR11MB5068:EE_
X-MS-Office365-Filtering-Correlation-Id: affabde7-26f9-4efc-d624-08ddbb5c98b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?RmhVU2NvVFBxSW0yN3ZtYnBaUEkxTXBiaGVQMzVFWUZON25XU2VPeHoxa1hn?=
 =?utf-8?B?Y0dVcnhGVmZqRjFBSk5lZ0pTUlp3ajB0cWdmcG5QenUrTWMxS3EyS25ycWlM?=
 =?utf-8?B?OTNJVjRlMjY4OFBJZ3hzRGdQc1UyNFdlQWs5alFSb3M2N3R1dkpxa00wQUVI?=
 =?utf-8?B?RjV4L3dxLzNsbUNjWVZMQndDUWVObVdmZ1VNYitmTlZWS1hkc1FWRHhFNUNM?=
 =?utf-8?B?S2kxeXZ3WUpaSlVxa1lJaWd4M3Q1QzkwY1NCVExmVTZWZHV0bHZja09YSDE4?=
 =?utf-8?B?MzJ2VnNRdHJpZm9uZURhUGtOZEk2UVE5LzBFODI0TVh0ZURPelhEWGd1ZjBp?=
 =?utf-8?B?blM0bFJVbU1JZVZDLzU3bWdSdHFzOUd2SlZRcVVjd2YrQndiVStRQXc3VEtQ?=
 =?utf-8?B?bjBRbnlZTXNNM1Z6RkxEdTIrUUJ5ZGRsRlE3ZnAySGlOTk10d3ZRM0NNUjJV?=
 =?utf-8?B?YjNMcW9WN2VFQW14OHZHRTg2aS9ackszUXBWbXlIRFVYSTZuSWVGNkxFSUF1?=
 =?utf-8?B?c1p3T1ZoTDgwOWtuSWtGTy9jVmlNVTBSTWpUU0RKcUZFSEYyWkVua0gxNDA5?=
 =?utf-8?B?eWNReHd4WnFYOHhWQXZVN2FpMW5IWGV1UXR3MlVZNGFsRXd3TnRVb1NIeGk2?=
 =?utf-8?B?TGZwRUs0NnpSYmowN0FiQXZsd25XSndnbjA5dHoySTNZNHdZV0pGQkZCUVRB?=
 =?utf-8?B?U2xXQWZnZ2tqb3NqeFFnSklPL3J1YXRGOTdNemhVcWg4cW9NNVl0NEoxLytx?=
 =?utf-8?B?d0xDYlJVUUZIU2ROcENlbE5PRGJzSjFqMnRBQytpQ28vV2V5VVdKNU9yQ0lE?=
 =?utf-8?B?SVczb2RlWVVIeTNldk5FZkRwMmNJd1JvMjBmNFNKWUNWbjFzaW92dzhpSzUr?=
 =?utf-8?B?dmhCMGZLbkozdFJIYTRveU5WQXFTYWs0ajl6Qk9CY3R6TlAvYlpnNzZBb2Ru?=
 =?utf-8?B?Q0dWVDhSWndpN2cxMWxackVQV3BUaHRKRTlTRXRjTEhZbFRSRElUcEVyU25o?=
 =?utf-8?B?UStYVTNrL1p3YkY4cGRkYUYrY0tXbnByQVZkQWFtREtzZm5uTmYwUnpxVDRM?=
 =?utf-8?B?SGRxY2dIaXVpOXBFL3RDUmpaSUUzMDkvZXBydUVzUmFMb29jTm12eTRwQW5L?=
 =?utf-8?B?Y3dUYjVtK2w5eC9vWk00bGFmNDBBZEhvKzBYVFJtZXFWN3U1T3BLdVhKbVcv?=
 =?utf-8?B?MGVFZUVQTnI0bXIwMUJmcDdhQmhGZE1WWnZyMTV4RzB5WnowOGFVVXRQZEJG?=
 =?utf-8?B?MlNhZjRFZUgyUlpIRnVsVXA5aVd1QzlNV2ZzSDZLOWwzQWUrc2NkbVo3ZzBB?=
 =?utf-8?B?ZFFuQzFHaVh1SXljWnorYWtJZjBBOExGSk5jem1nTDhQN2duVVkvTytxcWF0?=
 =?utf-8?B?Vi9XOXIwV1FwOVp4SENmc3kvNkovY1JtTWVXWjZ6aDVuU2ZqNnc3eXR2SkVC?=
 =?utf-8?B?ZDJHWVZITnJ2R1lNTEZaeWY0V0RUZDRsNDdtV2wybzN3Vm9TeUV4Nk14MDZR?=
 =?utf-8?B?NUdORjkzbXk3cDFwbHg1VXl0ZEd5a05GVHUvZVdHdnAvYkdJUjB4WUJsclpx?=
 =?utf-8?B?WTlwQThjMlUwYk0vMUt4NlhtNFJhdC9HTWRyMXVUYVBINm44TE53UVY4ZUIv?=
 =?utf-8?B?MG51cmFxU1V6TXFrOG8yd3YyV0xwQkJUUDlvMSs4aExvZ0tuMkRwOVNjL2tN?=
 =?utf-8?B?ajFtaFJFWlFONSs5MkJrR2pWNmY4RzFJUDdLVDFvTzNUN0o0TDQwczVqa0RB?=
 =?utf-8?B?UWlZSmVoQ2tvOGFDT1hBRnFqNFRTTC96REdTenIva1lJVXNFdlQ1YUFNV0tW?=
 =?utf-8?B?S2Q3RzNaQlUwVVNJd0ZIOWUrUllnM3BnbEJFeUJ0QjV2cmt2ZXZCWUd0ektF?=
 =?utf-8?B?amplZXNJRlVFazFpKzJ6WHBMdXk1aUZiM0NxWEh2ajRSL3dvemwwOGo5YmxX?=
 =?utf-8?B?OXA3YWhiOVZRZXM4TlQ0UDQzZU44UktXc0xWUU9qcVc4bkhFYjd1NHZOVEtE?=
 =?utf-8?B?dThWekZYS053PT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8205.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?aFQwRDlybGFpUHVObEtLZEJGckJoUUVHMHdtNnkyRTNicWptbnVPMS92YzJZ?=
 =?utf-8?B?MmhFZEI3MTdZMm51UENoZFY5TW9EalJYOTN1OURXOWdBQi81cGc1SXN1Q1Br?=
 =?utf-8?B?NkZkUCt6N1VkcEJUNXdKQjM0Q0hRMkxrcEVWMWNvMU0wSU5zcjFWSEFJYmVN?=
 =?utf-8?B?alQ5OWZvdm4yTnA4L3R3cDU3ZEhIb0VKRCtZaU1VZW8xVEhNN3JVTGxKZmNR?=
 =?utf-8?B?SVU5ak4wbGJCTCs2VkZOUWlqSlByQnF1TjN5bWJWcVhEL3R4UVU4RVZvOWJ3?=
 =?utf-8?B?Y0FlTUl4cGV0TFczTzFWYTVUZmFFaXVPQUI3RzF1Z1hnTnF4d2xwdVJmRHM0?=
 =?utf-8?B?L1E0U0k3NFlOcW5XYk1pdE0rV3MvV2g1VzF1M292UCtwM2Fjem9XZk9odHNu?=
 =?utf-8?B?a1YvcmM4K08xSUZhZjdsdGFLQjQ5aEdxU3dVL3BDK3l0WC8rWnE4dXlTd0Yv?=
 =?utf-8?B?cWhzMzBBRkNBZW5QdlRzRTk4MTRvREtFdVRzY096amdNc1g1bm56ZVBmNHBr?=
 =?utf-8?B?aDF6QXQ1Q2h1cmNiZExEUE1rekd0QlJyc0NOMXpxMkdweHQ0aW9zRURKQWNs?=
 =?utf-8?B?MjczRC9yVml6Ym5qT3NrbEs0dW84ZkloNjYxTXQ4Y1poVlZHdmVsaUJqR2J3?=
 =?utf-8?B?KzdnUGpkUmV6WHFNUnFNZWkwMlB0bU94ZDBGU1BqQnczYzRON3NkcndZVDB2?=
 =?utf-8?B?SDN6UkVwZW5QZk5YbW1odlEyWU9NWDFXNTFqazRoUHFZMm11L1NEc3RJNmtT?=
 =?utf-8?B?N2puZFlTY0ZhcEc2SDl2UFhuQ2p2Wm5CUXNtN0lneFg5QUFneXJyWktEMmJw?=
 =?utf-8?B?K2hKTUpJdk9qUFZwOHFlTitmVDRrZ2xLMFYvVXoyUStXWXFGVTZNcG5oQi9Z?=
 =?utf-8?B?ZEx1c1F5YWZUb1VueGQ4SXgrbnVNT1hVTUtXWmV1S2FpeGt4WmJ3M1d1cFZU?=
 =?utf-8?B?em1GWWNRUXNNNHhXZUZVVmtVMlphRE1ZUGxkVTZMR2RidGQxcEpka2NxdW0w?=
 =?utf-8?B?RGRuVllWYXB2VFd1QVhlcnhseXR1c3RzdXpQRDZ4SVY4UTlCR1VZVW5hOWNY?=
 =?utf-8?B?S2tmV1pGMXhsaFY0Kzk0OHRkSkpJY0RkTCt1NDlRRFpzd0t4NnBRTzFQWVlu?=
 =?utf-8?B?czJXQlpkTXRhWHlVQ1Vla0ZuUlpseS9wWWt1cDVIbzVWSTVNcFB5ZlZRZ1FM?=
 =?utf-8?B?dmsxWEErc2QwVG02TGdPaUVZWFBJdEljZ01vNjRxUTIvajBQY2pidVBPaDZh?=
 =?utf-8?B?YUZCdi9hTjh4VnJnQVVaSkNaYTk0Uzdaa3BzQUFUS21LWUMyMWpjZE1PVGVi?=
 =?utf-8?B?aHRXd01kazE4MTZMYjR3UGtaSjBPM0d4Z0I5YzRVRWdOaXlwN292R1FpMktp?=
 =?utf-8?B?Z1VLa0lBKzVVdHlWOWt0T2lsQUtMYko5YWpOblIzR2xqaEIyc0s2UGRHeEQ2?=
 =?utf-8?B?VEROOTMzRkVhcXUwYXZ0NXBKRzN4WnFWa3hyZU5hRHkxMGRybDljNDlzVGI3?=
 =?utf-8?B?Tk1UUkVCYzUyUzJnUVk4ajU3UXZpVXlWRzA1WFpMaEMzV1BxbVJlTk84Y0Jm?=
 =?utf-8?B?eVNrWWlvamxaMkwwS0lsY20rSjFNV2xNMVllQ0lOVktzTUxESXJlYWpJWGVQ?=
 =?utf-8?B?TkVCeERIMXU5N2N3VjF5M0RNanFMay9IQi92WGs5OUJwbzluN0JNRlZmUlJx?=
 =?utf-8?B?clpwVDlpSENNdnl6YzFwZDdWNm0zek94T2UrelZmMlkvcVRVeE5pL240Y25y?=
 =?utf-8?B?RHNxOVdiNEliQU53V1dib0JaSTVsTk04YlpWendpTWxwSW8xSTVSU24yaUNY?=
 =?utf-8?B?WUVMMC83Ym1LdGkwT0VRdCs1c3dRSm15cVdtU2xQa0ZXNHBiTGdERVdFS3lH?=
 =?utf-8?B?cHE0ZHpGdTd4S3lmTlJha0VhRDc3amZIU2U4MUovLzZ3eGxGOGRsbktXN2RZ?=
 =?utf-8?B?MUw2UzREOS9nSEJYMFN5QkhBbGd4L0tJNkRhYmNWcFJxQnJiRmhwU1YzRGpO?=
 =?utf-8?B?aHFTQU9lc3pCei93eHZXNHl4ZGt3WG0yU2xiWWphNzlYWnhWOTg4UDdMMURG?=
 =?utf-8?B?M2tWelRaZnFtNUNrM0NpRDRRdFJiaWFDQkQrT2lSSDNZdlh1aVRDenljeFMv?=
 =?utf-8?Q?+1DkpW/VrT1ViauzTD8NvChfy?=
X-OriginatorOrg: silabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: affabde7-26f9-4efc-d624-08ddbb5c98b2
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8205.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2025 00:40:53.1399
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 54dbd822-5231-4b20-944d-6f4abcd541fb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0k3WtOJLWt8kY09NuSlVBcJSYFHbPyE9Ni8q4viM5MnLq4KQimjBcODPwwBNRpNDelylnayrMlf+fVaDt3en7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5068
X-Authority-Analysis: v=2.4 cv=L4EdQ/T8 c=1 sm=1 tr=0 ts=68687497 cx=c_pps a=U259+el5m5zn0mdk/7qTUw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=M51BFTxLslgA:10 a=i1IsUcr2s-wA:10 a=2AEO0YjSAAAA:8 a=GVRe3fU0mJIiiMqSPh0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: 1E8GbldkeTYWMrcebihJHIOufjPBmYO_
X-Proofpoint-ORIG-GUID: 1E8GbldkeTYWMrcebihJHIOufjPBmYO_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA1MDAwMSBTYWx0ZWRfX20jrGRq4Z4Zn FNoY2ZgynX+hz+ERk9LvA3Afv+c7RfmEJa0MLQ28P5KUkZoDH9CRbokIVs4WVncypT0OHjj16OV 06SZQZVlmcRwB3m4vTn7cirwt3mCj9J8A4CYg6+hSPj78mMG4/H10pe7xjXh/VKhD11YPn0QK4W
 If32mtjxlK8U5i+T+zS1ao63du7wNg4VK5GhyPYCizvt3r3ptVC7ioZOQEKGmmY8D5QOAULdjFL GouseZTOXAC/5XiYkijkCntLl2QMN1FcIjwuv6ldHcaP8XN0Si70UuEY0mzhAKQAGChI96lVfdK vMHJBNn7fGhgA9oyshNk3Z+HPoLETy02xW27wO1k1UKWLP/jhcso8TAuO7wAYEfxF+XHrH4mKTj
 MoWHXl+w+4J/WeuiZnVt1glRnRGF1Ri0EVKpmyA7zQu86/s9QKkguwEShE3ngi7j12O9uV3a
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
X-Rspamd-Queue-Id: CF47B456B9
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
Message-ID-Hash: CMJVBMQCP3HWVI6DH37W76IGOVKDCPWI
X-Message-ID-Hash: CMJVBMQCP3HWVI6DH37W76IGOVKDCPWI
X-MailFrom: Damien.Riegel@silabs.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: linux-kernel@vger.kernel.org, linux-devel@silabs.com, Alex Elder <elder@kernel.org>, Johan Hovold <johan@kernel.org>, =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [RFC 4/6] greybus: add API for async unidirectional transfer
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/CMJVBMQCP3HWVI6DH37W76IGOVKDCPWI/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

VGhpcyBhZGRzIGEgaGVscGVyIGZ1bmN0aW9uIGZvciB1bmlkaXJlY3Rpb25hbCBhc3luY2hyb25v
dXMgdHJhbnNmZXIuDQpUaGlzIGlzIGp1c3QgZm9yIGNvbnZlbmllbmNlIGFzIHNvbWUgZHJpdmVy
cyBkbyB0aGVzZSBzdGVwcyBtYW51YWxseSwNCmxpa2UgdGhlIGxvb3BiYWNrIGRyaXZlciBpbiBn
Yl9sb29wYmFja19hc3luY19vcGVyYXRpb24oKS4NCg0KU2lnbmVkLW9mZi1ieTogRGFtaWVuIFJp
w6lnZWwgPGRhbWllbi5yaWVnZWxAc2lsYWJzLmNvbT4NCi0tLQ0KIGRyaXZlcnMvZ3JleWJ1cy9v
cGVyYXRpb24uYyAgICAgICB8IDUyICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCiBp
bmNsdWRlL2xpbnV4L2dyZXlidXMvb3BlcmF0aW9uLmggfCAgNCArKysNCiAyIGZpbGVzIGNoYW5n
ZWQsIDU2IGluc2VydGlvbnMoKykNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3JleWJ1cy9vcGVy
YXRpb24uYyBiL2RyaXZlcnMvZ3JleWJ1cy9vcGVyYXRpb24uYw0KaW5kZXggODQ1OWU5YmMwNzQu
LmE1OTliOWQzNmNmIDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncmV5YnVzL29wZXJhdGlvbi5jDQor
KysgYi9kcml2ZXJzL2dyZXlidXMvb3BlcmF0aW9uLmMNCkBAIC0xMTc0LDYgKzExNzQsNTggQEAg
aW50IGdiX29wZXJhdGlvbl9zeW5jX3RpbWVvdXQoc3RydWN0IGdiX2Nvbm5lY3Rpb24gKmNvbm5l
Y3Rpb24sIGludCB0eXBlLA0KIH0NCiBFWFBPUlRfU1lNQk9MX0dQTChnYl9vcGVyYXRpb25fc3lu
Y190aW1lb3V0KTsNCiANCisvKioNCisgKiBnYl9vcGVyYXRpb25fdW5pZGlyZWN0aW9uYWxfYXN5
bmNfdGltZW91dCgpIC0gaW5pdGlhdGUgYW4gYXN5bmNocm9ub3VzIHVuaWRpcmVjdGlvbmFsIG9w
ZXJhdGlvbg0KKyAqIEBjb25uZWN0aW9uOgkJY29ubmVjdGlvbiB0byB1c2UNCisgKiBAY2FsbGJh
Y2s6CQlmdW5jdGlvbiBjYWxsZWQgd2hlbiBvcGVyYXRpb24gY29tcGxldGVzDQorICogQGRhdGE6
CQl1c2VyLWRhdGEsIHJldHJpZXZlZCB3aXRoIGdiX29wZXJhdGlvbl9nZXRfZGF0YSgpDQorICog
QHR5cGU6CQl0eXBlIG9mIG9wZXJhdGlvbiB0byBzZW5kDQorICogQHJlcXVlc3Q6CQltZW1vcnkg
YnVmZmVyIHRvIGNvcHkgdGhlIHJlcXVlc3QgZnJvbQ0KKyAqIEByZXF1ZXN0X3NpemU6CXNpemUg
b2YgQHJlcXVlc3QNCisgKiBAdGltZW91dDoJCXNlbmQgdGltZW91dCBpbiBtaWxsaXNlY29uZHMN
CisgKg0KKyAqIEluaXRpYXRlIGEgdW5pZGlyZWN0aW9uYWwgb3BlcmF0aW9uIGJ5IHNlbmRpbmcg
YSByZXF1ZXN0IG1lc3NhZ2UuIENvbXBsZXRpb24gaXMgbm90aWZpZWQgYnkgdGhlDQorICogdXNl
ci1wcm92aWRlZCBjYWxsYmFjay4gVXNlciBjYW4gZGV0ZXJtaW5lIG9wZXJhdGlvbiBzdGF0dXMg
d2l0aCBnYl9vcGVyYXRpb25fcmVzdWx0KCkuDQorICogb3BlcmF0aW9uIG11c3QgYmUgcmVsZWFz
ZWQgd2l0aCBnYl9vcGVyYXRpb25fcHV0KCkuDQorICoNCisgKiBOb3RlIHRoYXQgc3VjY2Vzc2Z1
bCBzZW5kIG9mIGEgdW5pZGlyZWN0aW9uYWwgb3BlcmF0aW9uIGRvZXMgbm90IGltcGx5IHRoYXQN
CisgKiB0aGUgcmVxdWVzdCBhcyBhY3R1YWxseSByZWFjaGVkIHRoZSByZW1vdGUgZW5kIG9mIHRo
ZSBjb25uZWN0aW9uLg0KKyAqLw0KK2ludCBnYl9vcGVyYXRpb25fdW5pZGlyZWN0aW9uYWxfYXN5
bmNfdGltZW91dChzdHJ1Y3QgZ2JfY29ubmVjdGlvbiAqY29ubmVjdGlvbiwNCisJCQkJCSAgICAg
IGdiX29wZXJhdGlvbl9jYWxsYmFjayBjYWxsYmFjaywgdm9pZCAqZGF0YSwNCisJCQkJCSAgICAg
IGludCB0eXBlLCB2b2lkICpyZXF1ZXN0LCBpbnQgcmVxdWVzdF9zaXplLA0KKwkJCQkJICAgICAg
dW5zaWduZWQgaW50IHRpbWVvdXQpDQorew0KKwlzdHJ1Y3QgZ2Jfb3BlcmF0aW9uICpvcGVyYXRp
b247DQorCWludCByZXQ7DQorDQorCWlmIChyZXF1ZXN0X3NpemUgJiYgIXJlcXVlc3QpDQorCQly
ZXR1cm4gLUVJTlZBTDsNCisNCisJb3BlcmF0aW9uID0gZ2Jfb3BlcmF0aW9uX2NyZWF0ZV9mbGFn
cyhjb25uZWN0aW9uLCB0eXBlLA0KKwkJCQkJICAgICAgcmVxdWVzdF9zaXplLCAwLA0KKwkJCQkJ
ICAgICAgR0JfT1BFUkFUSU9OX0ZMQUdfVU5JRElSRUNUSU9OQUwsDQorCQkJCQkgICAgICBHRlBf
S0VSTkVMKTsNCisJaWYgKCFvcGVyYXRpb24pDQorCQlyZXR1cm4gLUVOT01FTTsNCisNCisJZ2Jf
b3BlcmF0aW9uX3NldF9kYXRhKG9wZXJhdGlvbiwgZGF0YSk7DQorDQorCWlmIChyZXF1ZXN0X3Np
emUpDQorCQltZW1jcHkob3BlcmF0aW9uLT5yZXF1ZXN0LT5wYXlsb2FkLCByZXF1ZXN0LCByZXF1
ZXN0X3NpemUpOw0KKw0KKwlyZXQgPSBnYl9vcGVyYXRpb25fcmVxdWVzdF9zZW5kKG9wZXJhdGlv
biwgY2FsbGJhY2ssIHRpbWVvdXQsIEdGUF9LRVJORUwpOw0KKwlpZiAocmV0KSB7DQorCQlkZXZf
ZXJyKCZjb25uZWN0aW9uLT5oZC0+ZGV2LA0KKwkJCSIlczogYXN5bmNocm9ub3VzIG9wZXJhdGlv
biBpZCAweCUwNHggb2YgdHlwZSAweCUwMnggZmFpbGVkOiAlZFxuIiwNCisJCQljb25uZWN0aW9u
LT5uYW1lLCBvcGVyYXRpb24tPmlkLCB0eXBlLCByZXQpOw0KKwkJZ2Jfb3BlcmF0aW9uX3B1dChv
cGVyYXRpb24pOw0KKwl9DQorDQorCXJldHVybiByZXQ7DQorfQ0KK0VYUE9SVF9TWU1CT0xfR1BM
KGdiX29wZXJhdGlvbl91bmlkaXJlY3Rpb25hbF9hc3luY190aW1lb3V0KTsNCisNCiAvKioNCiAg
KiBnYl9vcGVyYXRpb25fdW5pZGlyZWN0aW9uYWxfdGltZW91dCgpIC0gaW5pdGlhdGUgYSB1bmlk
aXJlY3Rpb25hbCBvcGVyYXRpb24NCiAgKiBAY29ubmVjdGlvbjoJCWNvbm5lY3Rpb24gdG8gdXNl
DQpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9ncmV5YnVzL29wZXJhdGlvbi5oIGIvaW5jbHVk
ZS9saW51eC9ncmV5YnVzL29wZXJhdGlvbi5oDQppbmRleCBjYjhlNGVmNDUyMi4uMDFkZDFkODlk
ODkgMTAwNjQ0DQotLS0gYS9pbmNsdWRlL2xpbnV4L2dyZXlidXMvb3BlcmF0aW9uLmgNCisrKyBi
L2luY2x1ZGUvbGludXgvZ3JleWJ1cy9vcGVyYXRpb24uaA0KQEAgLTE5Miw2ICsxOTIsMTAgQEAg
aW50IGdiX29wZXJhdGlvbl9zeW5jX3RpbWVvdXQoc3RydWN0IGdiX2Nvbm5lY3Rpb24gKmNvbm5l
Y3Rpb24sIGludCB0eXBlLA0KIAkJCQl2b2lkICpyZXF1ZXN0LCBpbnQgcmVxdWVzdF9zaXplLA0K
IAkJCQl2b2lkICpyZXNwb25zZSwgaW50IHJlc3BvbnNlX3NpemUsDQogCQkJCXVuc2lnbmVkIGlu
dCB0aW1lb3V0KTsNCitpbnQgZ2Jfb3BlcmF0aW9uX3VuaWRpcmVjdGlvbmFsX2FzeW5jX3RpbWVv
dXQoc3RydWN0IGdiX2Nvbm5lY3Rpb24gKmNvbm5lY3Rpb24sDQorCQkJCQkgICAgICBnYl9vcGVy
YXRpb25fY2FsbGJhY2sgY2FsbGJhY2ssIHZvaWQgKmRhdGEsDQorCQkJCQkgICAgICBpbnQgdHlw
ZSwgdm9pZCAqcmVxdWVzdCwgaW50IHJlcXVlc3Rfc2l6ZSwNCisJCQkJCSAgICAgIHVuc2lnbmVk
IGludCB0aW1lb3V0KTsNCiBpbnQgZ2Jfb3BlcmF0aW9uX3VuaWRpcmVjdGlvbmFsX3RpbWVvdXQo
c3RydWN0IGdiX2Nvbm5lY3Rpb24gKmNvbm5lY3Rpb24sDQogCQkJCWludCB0eXBlLCB2b2lkICpy
ZXF1ZXN0LCBpbnQgcmVxdWVzdF9zaXplLA0KIAkJCQl1bnNpZ25lZCBpbnQgdGltZW91dCk7DQot
LSANCjIuNDkuMA0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpncmV5YnVzLWRldiBtYWlsaW5nIGxpc3QgLS0gZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJv
Lm9yZwpUbyB1bnN1YnNjcmliZSBzZW5kIGFuIGVtYWlsIHRvIGdyZXlidXMtZGV2LWxlYXZlQGxp
c3RzLmxpbmFyby5vcmcK
