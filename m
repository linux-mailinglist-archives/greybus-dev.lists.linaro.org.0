Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id CCA87C5DC21
	for <lists+greybus-dev@lfdr.de>; Fri, 14 Nov 2025 16:08:55 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 822DA3F854
	for <lists+greybus-dev@lfdr.de>; Fri, 14 Nov 2025 15:08:54 +0000 (UTC)
Received: from mx0a-0024c301.pphosted.com (mx0a-0024c301.pphosted.com [148.163.149.154])
	by lists.linaro.org (Postfix) with ESMTPS id 31F213F82A
	for <greybus-dev@lists.linaro.org>; Fri, 14 Nov 2025 15:08:40 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=silabs.com header.s=pps12202023 header.b=CcEvAhNR;
	dkim=pass header.d=silabs.com header.s=selector1 header.b=AYONa4Nq;
	dmarc=pass (policy=reject) header.from=silabs.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1");
	spf=pass (lists.linaro.org: domain of Damien.Riegel@silabs.com designates 148.163.149.154 as permitted sender) smtp.mailfrom=Damien.Riegel@silabs.com
Received: from pps.filterd (m0101743.ppops.net [127.0.0.1])
	by mx0a-0024c301.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AE9ueVC2132744;
	Fri, 14 Nov 2025 09:08:35 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps12202023;
	 bh=m5LJmOcOUiXql38fAXQ7rcdZWIrDGbciklHNZBxnEHY=; b=CcEvAhNR6dbq
	xuA+6fm3H/Sz6jVEtw+260SnGPsStxdj21u8nTWMuA01LQ1oaWpD75MsaPHFNDAo
	KaMYLwOP/yEV+lmgNqPEH9h0D1ZV3IzN6o2ap3ANXyKCs1Xamp5pfzTexaKhu/w9
	Pr7Oe6jnDDxcrKUzfxKmAZqtFQ1WKf7K+mchBLoM9XFkrnpzrDRcNCUgkynMUI8p
	A5k6ffJ37sCVc1aU8mHwkWZq6a10KmVSMksXLIbVB29Od5jDSP/uI5wWRGuN0s03
	pqwPnnewJAiijqCp5KvtnnyhVMSnLAMtn7lErqUpQ+LmGr7AFTv9aykmZtMKWz9C
	Aevep1W/Sw==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11022081.outbound.protection.outlook.com [40.107.209.81])
	by mx0a-0024c301.pphosted.com (PPS) with ESMTPS id 4ae285rk1u-4
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 14 Nov 2025 09:08:35 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iWO+hTtcdaS8vvSj26jv5nVYUC4ZlI30nBCGbw/uiYTOX0EcOQi6xxG0t4d+zkG3XhhAw6iI2zSVL4bkJW+/NX6jzeZ3g5x0mtHMSb82Djn3eLuwP7eGubrlbjQv8W03ic0+t1GmByWv3T1Naw8fIAsZC93uPv7F0w+pxAixZtDjCNgb823fRH2PJGiwk3L2otC9mzq2/wj5u7H6Yf/KmY8RoPEIBO8pYKr0+knV/iHP6DUFTwTT/2rtTfbizjyK3DiiCprwmBiEt7SYs1rtpLDBihpgyKQ94gHbEoEMLbUVA3VfCTTTL/Sxxa3/4l2NHXoHMCW66SZKYRPZh3ixYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m5LJmOcOUiXql38fAXQ7rcdZWIrDGbciklHNZBxnEHY=;
 b=uiAj2znZ2Gu8RUH+hbQhmJkJPW9yHU4lgwlw4bmji9kt0EhZ0H5HUrBjblIcjkvWtGY4BsuNXGUCnRgxFjYtC95ENfqgurmW8ZexU5UtQX+OHwQu3Q7kz5WYy6YiJodeM5et0rjnKBzI1/H8yyRXB+8VbzXN769ntzMx7yhWT1OqjZeEJ2kvBjXtFflqfEWq/4Yu9aUo5wsKDEBf6QnKIpuWZ+IAcdKTDnwfWfEjdTU07FoDHXp5dT7T10mR0mv2ZdS7MGzOGFkY7Ln8C/e6k81iC9ydSARkAs4BsZJto/vSY010wXRbBJZwFObteLd2xxjBWTLIyU6/WZymrfv7UQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silabs.com; dmarc=pass action=none header.from=silabs.com;
 dkim=pass header.d=silabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m5LJmOcOUiXql38fAXQ7rcdZWIrDGbciklHNZBxnEHY=;
 b=AYONa4Nq0qodrV3U1bQLF0/lpALGkjRVb2SAhSI232OggMWad7d40q862Myfyy59Xk+sXW+6W9hblSFO2SRTHoHYUBkbBFxRQtB5KLR2ertWz3sxgQMI+VBQmYgq91y/l4VLNN4aAjXi8BhMlFPeS20zCdZ6Ithxt7GYSWGdago=
Received: from DS0PR11MB8205.namprd11.prod.outlook.com (2603:10b6:8:162::17)
 by CH3PR11MB8774.namprd11.prod.outlook.com (2603:10b6:610:1cd::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Fri, 14 Nov
 2025 15:08:30 +0000
Received: from DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::c508:9b04:3351:524a]) by DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::c508:9b04:3351:524a%5]) with mapi id 15.20.9320.018; Fri, 14 Nov 2025
 15:08:29 +0000
From: =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
To: greybus-dev@lists.linaro.org, Johan Hovold <johan@kernel.org>,
        Alex Elder <elder@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org
Date: Fri, 14 Nov 2025 10:07:34 -0500
Message-ID: <20251114150738.32426-9-damien.riegel@silabs.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251114150738.32426-1-damien.riegel@silabs.com>
References: <20251114150738.32426-1-damien.riegel@silabs.com>
X-ClientProxiedBy: MA5P287CA0046.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:175::12) To DS0PR11MB8205.namprd11.prod.outlook.com
 (2603:10b6:8:162::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8205:EE_|CH3PR11MB8774:EE_
X-MS-Office365-Filtering-Correlation-Id: b92d1b93-220e-4b3a-916c-08de238fab5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?QU9lMS95ZVY5ekFqazNLNzJock9GbStpUDBBUmU4SG1neSsyZ01YdHpacTdL?=
 =?utf-8?B?WktwbTBna29YdktlK2dYYzlBN3JaVHJjelJITTRYL2laeGpzOU1RcTBPSjVi?=
 =?utf-8?B?VXN1YXZJK2xEbHlmVTVGYm1weC9PZVhZN21TcUJrUVBGMk1FdERhS3gxVDlZ?=
 =?utf-8?B?dGJ0NWVjcTdKanJiYWh0RERzQVZmbEhrbFdvUzZSVXJxV3U5UCtLSEtlOE1Z?=
 =?utf-8?B?UGNwZkgvYlZ3Q2hDRDZkWEFKNDFYUnJWWllLbDJDQlkzYVFEYkQ4cldnZU4y?=
 =?utf-8?B?THFSVXVSYlVSOEp6Ry9kUTNPZ2lXVWw5S09jbHQyUjFObi9palZLbjlzTnNk?=
 =?utf-8?B?NmRGM09KNzhaZ3ZSUWltWGRjeDVxZDM3YVZIcXVTNUFUUXBzTnZ4TTVCNXFI?=
 =?utf-8?B?b2Q5d3NiSk1iL0h6YjM1Zk9peWEzL0ZoMEQ0MTBoa2VzZkh4cWJuV25lemdZ?=
 =?utf-8?B?Q2tXSHR5L3BJK0FHUWdpaTN4ZEZpc2U5ZFRvZWdGUmVRUlNBQVFlc2JsZWY3?=
 =?utf-8?B?Nm5QVnZhd1dPd29VTjAyMmVrNm9WcGVybkg3TVk5QVZXVVp3dFpwanJUbkpO?=
 =?utf-8?B?NE9IdkdaeDFENXZwYUtZbkdLNmlTalFFdkY4UTF5MkhZRFN1SDJtVHlNaWhE?=
 =?utf-8?B?SHJVTlh3K1B3c1RFR1k3TUwzeW5XWXF0aWttTUdoOWEwd2ZTUnJwZjNBWXdP?=
 =?utf-8?B?bTE2UkxvMTI5OGtGemRzNWhyOGY4KzdBSVBrRFlaMmNIZk1IQTJCdytQU0ZJ?=
 =?utf-8?B?RFdZTWxIeFJrMkU2MjNnRk1tTFlkZXRwNEdqZEhtM3lJUHdjank4YjVLUU8v?=
 =?utf-8?B?MzF0VERoTVM2ZVkrYW9wa0pXcHQ2ODBTY2FPWFlwbXEvdzg1OFRvNGVDWitD?=
 =?utf-8?B?WkxWRlg2YXhvYTJKWlI1dDBtTTR1cTJRYW5OU204VGQ5UDlSaUZIOEQ1UGw1?=
 =?utf-8?B?Sms2US9FanJSUTFPNDZ5SE9zTVRRcVpNVFdDYXBnODdwM3pLazlDYko3dFlU?=
 =?utf-8?B?SElMM0dxQURIS29wY2lIZjBzWHJUV243anRPcWE1ZnF0SjhicFJhMkkzOXhw?=
 =?utf-8?B?RVppdmZrOEp3U1ZjRHhPTElMeTFycGlIWTZTTnJIT05sV2kzbFVwYXc2YUs4?=
 =?utf-8?B?MlFEWk9ESmFPS3JaRGZPNVc2enNyRjFnOTZ6UUt3RTNERTZUN0dFcEtpcStY?=
 =?utf-8?B?YzA0allxSTV1ZnQ4c0JJWjRmMXVXT0Y0Uzk5ZFM4N0RBcFNjUHJYajhnbVhv?=
 =?utf-8?B?ZkNlazl1djFzYjlFTDg5R2kzN3c4dWtDVUgzQjkyb21NUXM1b010WDREa1hk?=
 =?utf-8?B?VUp2OHYvK3crTEJMTVp4dG5xdkNXSnA3VVZpTHNBK082THFVdEk3UVF5Yk1E?=
 =?utf-8?B?TlZCYTFmVWUvbjJ3dHlaUzh3LzZPcnc1cTVYSEl4cDErOVVFeWVGUEFlRkcv?=
 =?utf-8?B?TTJzb1o4Z1c3VDBTeElVWmlPRVM5NlVuMjk1MkMyUU1SRkxrOVRyaURTWU1O?=
 =?utf-8?B?YXQvNmZkbkdTY0tVdVdOTHFVVnpvUlI2M1ZkMGt1cVlHQ1FUa2sxQnBQRlBn?=
 =?utf-8?B?Zm0rSU5DWE5aR3M0UHRXMmNHM1hDVkN0ckxsVFU0aDhQU0F3WUNxbk5VNnNQ?=
 =?utf-8?B?VzFhMUhnMDZWdGlPSkFielZaeEs1dDc5czB0ampEaXloMmNYSkpoZjYvNEFB?=
 =?utf-8?B?aE1zZ0o0L1B4WVJuM1J2RStLVjVNNnZWR2tadWIxQXNMcUhyM3lTQ2FvODVh?=
 =?utf-8?B?by9qaXlQSTJYWXVra0JsNXBKYklndlJndFpSK256Y3ZSSkZJeC8wcmE1M1Jj?=
 =?utf-8?B?M3FaTi9SN0FQMDRZOVdMcHlNbWpNSXp3dFc2YTdoSTUvd3VRdHFXNHZvSHZI?=
 =?utf-8?B?N3Y3bHppK0MwNzhXbnlZSGRYcGpER21CTi81a3lmM3M0UTV3M0ZQNGd5L2N4?=
 =?utf-8?B?b0tqNTZOU2hiT0FxRVkreXNlamNtQ1dhSlBDVDRvc1pIWmZCeWNlVUFNVFc0?=
 =?utf-8?B?WVVaM21RU1dmaTFiTWdKT3JFdXRwWEo5c1E4ZFV2elJncGlIK0RPWWZOOGZl?=
 =?utf-8?Q?XO3GeX?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8205.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?eHdhWmZyRlVqTDFZOGVjZTNiWHZlYi9jN3dtSVF1elNTQzBreFhoajNQQyta?=
 =?utf-8?B?T0cxekE5aXhhNml0bWFlSE5Qa2hpRlhKREhHcSt2bG5nNEw2SWE5RkVGVENj?=
 =?utf-8?B?Ykk1a3lUQnRQbS9WN1Q4TlFtRVdXblZEVHdnSEUwbjlDZUJEMG02ZDV6OVpz?=
 =?utf-8?B?QVl4aWRJTGVDZFFPb0hCbDlqYUF4czBWdTJvdkNvVXExaitQUExncUwreHI3?=
 =?utf-8?B?dGVSNHFyNG5yRzUrRlJkVHg1dzhENDNHZzhiWkprT1p5VURQQVNjUHlYRG84?=
 =?utf-8?B?bElFNktEd3dqNjdYaFczM3NxY2ZVZU5DQS9rSjlzRm5YaTc5eERETTRhOVRw?=
 =?utf-8?B?bCs0cC9TcFpkanI5ZEtXTFQ5YStPN25zMTJyYUJaNjFnL3FrY0xXTEJPajVL?=
 =?utf-8?B?RlRDOUdXZXNud09lSGd4V3NYT1p1UTRWSVBaZjhWZnByNHI0UFAxcTN2YlZp?=
 =?utf-8?B?ZGdnZ3JmbWpZczltVEpBcmtlS2RKLzIvV215TmhocWRib0RoM0lTVjREUzEz?=
 =?utf-8?B?Wk5pR1YyZXlYN3hLU094NHpndkU2M0hpMXo2RVF2UjhWNlRxeXIydFlMd3hM?=
 =?utf-8?B?bXU0Zng5L0JzUDlSMC9MN0hDOGVVbkdOL0ZoTWNtYWJoVjJWNzRveDZrVDhK?=
 =?utf-8?B?Z1dIeVhzbVcwZHhZMW9ncnA0NjFyOVYrbU0rYi9Kd2UyVFNxNTZ2aWJsa0Nk?=
 =?utf-8?B?OGRMNWh5QzBmYXJiN1NhOGxWL1RYRmZMaTcweFNGRis1VEhwYWhlNW1RYWlq?=
 =?utf-8?B?MHVHNzFRallRMVNTQjNiZ3RmUHZ4NW8vTXdJQU9RWVpjWE81eDlDT2tKZENl?=
 =?utf-8?B?NEExZG5qcWQ5cHdpOG02MVNRUVpoWnNIbGY0TDdDVVJ4TWh6c3A1dWNZWDFa?=
 =?utf-8?B?akkvV1BaNUt1QnZKRlRpdjVOdVJPZXh3amxVVERrVE9PdHFEL2orUjVGakZj?=
 =?utf-8?B?ejgyUGFUcWs5Y1FxUTVKUW5tVzNRWHdWbEZWMWwxQ2htWnlwZDdIME8vSDBV?=
 =?utf-8?B?M0lzYzVPb1hmakFwMDA3RTlmT3F4TG9mOEEwSTJBdEsyWXR6eHdZNzJWUy9u?=
 =?utf-8?B?RnI1VTBFKzF6RkNWcVcvSGVodjFYWEt6b3Y5SEdMZUFodXRtdUU2L2IzVEZj?=
 =?utf-8?B?Y29DOHp3Y0tiRmFNMW1nZnJxb1g0cjdRNm5zM2NQY3FnQUVpb05xMTJHNTcz?=
 =?utf-8?B?NDhJUldubTRxNnZ6WjltazBxLzJXK2h4cFlHamR0Z1QwQnlFT1MxMjh0T1RT?=
 =?utf-8?B?bHNWbnZmUStDNzlQT3c2QmIrSi8rM210bTRZa3FIeUZ0a2dJdVFuTXFBV0Qw?=
 =?utf-8?B?TG4vMGt2c0JoZWFZRENhSVVXZ3YrRlNLQUJ4TVVCdkEvTG5mc0UxSDd1RW9s?=
 =?utf-8?B?ZjJvWGFSa3AwWnlERTNQZTFuUDBQdkpBdHZXUUZUV09jQ0JJdDMvcERKaWVa?=
 =?utf-8?B?MjJyQTA3d2dtUkZSeUVacG5UcGVDMXB3dHNRZ09YU0EwNWw2U2JVamUrZUNU?=
 =?utf-8?B?YXdCVzQxU2VRbUhDOC9tRGo1L0lLU0dobGtSSGI3QWliWEVSSzEzWGJBOE1s?=
 =?utf-8?B?NEwwVDNldXBCSy85bU9icGwvbE9iamFNVGJZRWlDcDFydXdCOVIrNDNWZnFa?=
 =?utf-8?B?N090dzhaV3NwcFgxWUJpWEFZd21JTFVxQXFuczRacjVjSkhVaUhybnNLQmJS?=
 =?utf-8?B?aytaTS8wc0ZwZiswY3VIeksyN2hoTXh6RCtNU1gvYU5pM1pZeWlQcmN1SXdr?=
 =?utf-8?B?emNNSDQ1R2k5RnNaY3V4czBTc0NyVk9pYWljT2Z5RmY0UVhqT29CUmdCWTNw?=
 =?utf-8?B?S0w0L3VFOVFPUyt4SFg5a0lkclFmMFUvV2dKaFZhcEdJM3U0WGJ6bytpUm9F?=
 =?utf-8?B?d1dkR00vU0pUOHhvUzBmVGJCM2RPbHpXRnlPT1VHM1hENnl5cnlrdS9jNGtL?=
 =?utf-8?B?Q0FtTGV4K2NRd1hmWHFVaVNtTDNLR2VLMzdDa2NpVGdvR2I0N0FRclNYWHh1?=
 =?utf-8?B?c3F2RStCSjlkc3YvNU5mVmowbmUwWW9YaTNnWkVpSEM2ci94bG10T21VWFFx?=
 =?utf-8?B?SnJLYUtNdEJCVHp0UDd2bGxhU1k0THcxdnBNZWtQNjJ0V09CSGZSK0RES3BN?=
 =?utf-8?Q?rbkQ6f6iVEPWJToLH3rRkEM2Q?=
X-OriginatorOrg: silabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b92d1b93-220e-4b3a-916c-08de238fab5d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8205.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 15:08:29.9013
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 54dbd822-5231-4b20-944d-6f4abcd541fb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sBo4wbkvdQUaduh7/RCNHKubJh5jR2qB6caTJz0RQc6S/91B8GnizBozkywRK3ansahpAIcm/gyC5QM3N0etWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8774
X-Proofpoint-ORIG-GUID: HczfZy4Bys5ZVSchNWhXZaSImxUfciRb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDEyMSBTYWx0ZWRfXx2KtgkeivCHe
 V1cb63Sl/MoHva/a4YdcLsz8N6Di830B3YK95p2JFRiFjOLY2z69BJ45nFWakC1EVTii2ithBLR
 D5zrByICn+ZXPXnfFvQUhOjCmp2HdHtlsQ10D/2814maTYv5ajWQcsxsyW83LgiRMESxRxuQNAg
 ZQkP9dFPozu5f2sZzd9B0tQbGBiHFBJ5h1DM638pJC0QJXEZPh+DahGE2a3+hixzedoaf8Cj5Qb
 cGFMBrqUaiJJT0wAglCBHdaddcolahPVwYZ/WXUm51xUx+GfhqJphaU0vIf7wX5Bwge6JOTcC+B
 Z5uOu8BIJaNx+9aQSeK86P9xdw9nIrKjsdBZVwLIOFsMnf9xZFmWTb5F9j00jq+52ZmI+SIt4AF
 ycViZRKb5ebfm18KJw6DnK2Xgp6+bA==
X-Proofpoint-GUID: HczfZy4Bys5ZVSchNWhXZaSImxUfciRb
X-Authority-Analysis: v=2.4 cv=LfAxKzfi c=1 sm=1 tr=0 ts=691745f3 cx=c_pps
 a=XJoAL0HPiv6B0cYJlRTKVw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=M51BFTxLslgA:10
 a=i1IsUcr2s-wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=2AEO0YjSAAAA:8
 a=lANphnh8oco7uUUTl1QA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 spamscore=0 clxscore=1015 phishscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140121
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 31F213F82A
X-Spamd-Bar: ----
X-Spamd-Result: default: False [-4.00 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[silabs.com,reject];
	R_DKIM_ALLOW(-0.20)[silabs.com:s=pps12202023,silabs.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:148.163.149.154];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:26211, ipnet:148.163.148.0/22, country:US];
	MIME_TRACE(0.00)[0:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DNSWL_BLOCKED(0.00)[148.163.149.154:from,40.107.209.81:received,2603:10b6:8:162::17:received];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	DKIM_TRACE(0.00)[silabs.com:+]
X-Rspamd-Action: no action
Message-ID-Hash: K23PJ7YYZBKZL2GODTD3HJ5BD4DV2C73
X-Message-ID-Hash: K23PJ7YYZBKZL2GODTD3HJ5BD4DV2C73
X-MailFrom: Damien.Riegel@silabs.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Silicon Labs Kernel Team <linux-devel@silabs.com>, =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [RFC PATCH v2 08/12] greybus: cpc: add and validate sequence numbers
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/K23PJ7YYZBKZL2GODTD3HJ5BD4DV2C73/>
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
eWJ1cy9jcGMvY3BjLmggICAgICB8IDIwICsrKysrKysrKysrKysrDQogZHJpdmVycy9ncmV5YnVz
L2NwYy9jcG9ydC5jICAgIHwgMjUgKysrKysrKysrKysrKysrKysNCiBkcml2ZXJzL2dyZXlidXMv
Y3BjL2hlYWRlci5jICAgfCAxNyArKysrKysrKysrKysNCiBkcml2ZXJzL2dyZXlidXMvY3BjL2hl
YWRlci5oICAgfCAgMiArKw0KIGRyaXZlcnMvZ3JleWJ1cy9jcGMvaG9zdC5jICAgICB8IDEzICsr
KysrKy0tLQ0KIGRyaXZlcnMvZ3JleWJ1cy9jcGMvcHJvdG9jb2wuYyB8IDQ5ICsrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysNCiA3IGZpbGVzIGNoYW5nZWQsIDEyMyBpbnNlcnRpb25z
KCspLCA1IGRlbGV0aW9ucygtKQ0KIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dyZXlidXMv
Y3BjL2hlYWRlci5jDQogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3JleWJ1cy9jcGMvcHJv
dG9jb2wuYw0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncmV5YnVzL2NwYy9NYWtlZmlsZSBiL2Ry
aXZlcnMvZ3JleWJ1cy9jcGMvTWFrZWZpbGUNCmluZGV4IDNkNTBmOGM1NDczLi5jNGI1MzBkMjdh
MyAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3JleWJ1cy9jcGMvTWFrZWZpbGUNCisrKyBiL2RyaXZl
cnMvZ3JleWJ1cy9jcGMvTWFrZWZpbGUNCkBAIC0xLDYgKzEsNiBAQA0KICMgU1BEWC1MaWNlbnNl
LUlkZW50aWZpZXI6IEdQTC0yLjANCiANCi1nYi1jcGMteSA6PSBjcG9ydC5vIGhvc3Qubw0KK2di
LWNwYy15IDo9IGNwb3J0Lm8gaGVhZGVyLm8gaG9zdC5vIHByb3RvY29sLm8NCiANCiAjIENQQyBj
b3JlDQogb2JqLSQoQ09ORklHX0dSRVlCVVNfQ1BDKQkrPSBnYi1jcGMubw0KZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3JleWJ1cy9jcGMvY3BjLmggYi9kcml2ZXJzL2dyZXlidXMvY3BjL2NwYy5oDQpp
bmRleCAwZjJkMjA0ZDg2ZC4uZGI3NjBjZjhiMzIgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dyZXli
dXMvY3BjL2NwYy5oDQorKysgYi9kcml2ZXJzL2dyZXlidXMvY3BjL2NwYy5oDQpAQCAtOCwxNyAr
OCwzMiBAQA0KIA0KICNpbmNsdWRlIDxsaW51eC9kZXZpY2UuaD4NCiAjaW5jbHVkZSA8bGludXgv
Z3JleWJ1cy5oPg0KKyNpbmNsdWRlIDxsaW51eC9tdXRleC5oPg0KICNpbmNsdWRlIDxsaW51eC90
eXBlcy5oPg0KIA0KK3N0cnVjdCBza19idWZmOw0KKw0KIC8qKg0KICAqIHN0cnVjdCBjcGNfY3Bv
cnQgLSBDUEMgY3BvcnQNCiAgKiBAaWQ6IGNwb3J0IElEDQogICogQGNwY19oZDogcG9pbnRlciB0
byB0aGUgQ1BDIGhvc3QgZGV2aWNlIHRoaXMgY3BvcnQgYmVsb25ncyB0bw0KKyAqIEBsb2NrOiBt
dXRleCB0byBzeW5jaHJvbml6ZSBhY2Nlc3NlcyB0byB0Y2IgYW5kIG90aGVyIGF0dHJpYnV0ZXMN
CisgKiBAdGNiOiBUcmFuc21pc3Npb24gQ29udHJvbCBCbG9jaw0KICAqLw0KIHN0cnVjdCBjcGNf
Y3BvcnQgew0KIAl1MTYJCQlpZDsNCiANCiAJc3RydWN0IGNwY19ob3N0X2RldmljZQkqY3BjX2hk
Ow0KKwlzdHJ1Y3QgbXV0ZXgJCWxvY2s7CS8qIFN5bmNocm9uaXplIGFjY2VzcyB0byBzdGF0ZSB2
YXJpYWJsZXMgKi8NCisNCisJLyoNCisJICogQGFjazogY3VycmVudCBhY2tub3dsZWRnZSBudW1i
ZXINCisJICogQHNlcTogY3VycmVudCBzZXF1ZW5jZSBudW1iZXINCisJICovDQorCXN0cnVjdCB7
DQorCQl1OCBhY2s7DQorCQl1OCBzZXE7DQorCX0gdGNiOw0KIH07DQogDQogc3RydWN0IGNwY19j
cG9ydCAqY3BjX2Nwb3J0X2FsbG9jKHUxNiBjcG9ydF9pZCwgZ2ZwX3QgZ2ZwX21hc2spOw0KQEAg
LTM0LDggKzQ5LDEzIEBAIHN0cnVjdCBjcGNfc2tiX2NiIHsNCiANCiAJLyogS2VlcCB0cmFjayBv
ZiB0aGUgR0IgbWVzc2FnZSB0aGUgc2tiIG9yaWdpbmF0ZXMgZnJvbSAqLw0KIAlzdHJ1Y3QgZ2Jf
bWVzc2FnZSAqZ2JfbWVzc2FnZTsNCisNCisJdTggc2VxOw0KIH07DQogDQogI2RlZmluZSBDUENf
U0tCX0NCKF9fc2tiKQkoKHN0cnVjdCBjcGNfc2tiX2NiICopJigoX19za2IpLT5jYlswXSkpDQog
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
ci5oDQppbmRleCA4NGM0N2YxMDViMy4uZDQ2YWQ4ZTUzZmUgMTAwNjQ0DQotLS0gYS9kcml2ZXJz
L2dyZXlidXMvY3BjL2hlYWRlci5oDQorKysgYi9kcml2ZXJzL2dyZXlidXMvY3BjL2hlYWRlci5o
DQpAQCAtNDAsNCArNDAsNiBAQCBzdHJ1Y3QgY3BjX2hlYWRlciB7DQogDQogI2RlZmluZSBDUENf
SEVBREVSX1NJWkUJCQkoc2l6ZW9mKHN0cnVjdCBjcGNfaGVhZGVyKSkNCiANCit1OCBjcGNfaGVh
ZGVyX2dldF9zZXEoY29uc3Qgc3RydWN0IGNwY19oZWFkZXIgKmhkcik7DQorDQogI2VuZGlmDQpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncmV5YnVzL2NwYy9ob3N0LmMgYi9kcml2ZXJzL2dyZXlidXMv
Y3BjL2hvc3QuYw0KaW5kZXggMWNjZTRmOTg3ZTMuLjkxNzNkNWFiNWExIDEwMDY0NA0KLS0tIGEv
ZHJpdmVycy9ncmV5YnVzL2NwYy9ob3N0LmMNCisrKyBiL2RyaXZlcnMvZ3JleWJ1cy9jcGMvaG9z
dC5jDQpAQCAtMjEwLDE5ICsyMTAsMjQgQEAgRVhQT1JUX1NZTUJPTF9HUEwoY3BjX2hkX21lc3Nh
Z2Vfc2VudCk7DQogdm9pZCBjcGNfaGRfcmN2ZChzdHJ1Y3QgY3BjX2hvc3RfZGV2aWNlICpjcGNf
aGQsIHN0cnVjdCBza19idWZmICpza2IpDQogew0KIAlzdHJ1Y3QgZ2Jfb3BlcmF0aW9uX21zZ19o
ZHIgKmdiX2hkcjsNCisJc3RydWN0IGNwY19jcG9ydCAqY3BvcnQ7DQogCXUxNiBjcG9ydF9pZDsN
CiANCiAJLyogUHJldmVudCBhbiBvdXQtb2YtYm91bmQgYWNjZXNzIGlmIGNhbGxlZCB3aXRoIG5v
bi1zZW5zaWNhbCBwYXJhbWV0ZXJzLiAqLw0KIAlpZiAoc2tiLT5sZW4gPCAoc2l6ZW9mKCpnYl9o
ZHIpICsgQ1BDX0hFQURFUl9TSVpFKSkNCiAJCWdvdG8gZnJlZV9za2I7DQogDQotCXNrYl9wdWxs
KHNrYiwgQ1BDX0hFQURFUl9TSVpFKTsNCi0NCiAJLyogUmV0cmlldmUgY3BvcnQgSUQgdGhhdCB3
YXMgcGFja2VkIGluIEdyZXlidXMgaGVhZGVyICovDQotCWdiX2hkciA9IChzdHJ1Y3QgZ2Jfb3Bl
cmF0aW9uX21zZ19oZHIgKilza2ItPmRhdGE7DQorCWdiX2hkciA9IChzdHJ1Y3QgZ2Jfb3BlcmF0
aW9uX21zZ19oZHIgKikoc2tiLT5kYXRhICsgQ1BDX0hFQURFUl9TSVpFKTsNCiAJY3BvcnRfaWQg
PSBjcGNfY3BvcnRfdW5wYWNrKGdiX2hkcik7DQogDQotCWdyZXlidXNfZGF0YV9yY3ZkKGNwY19o
ZC0+Z2JfaGQsIGNwb3J0X2lkLCBza2ItPmRhdGEsIHNrYi0+bGVuKTsNCisJY3BvcnQgPSBjcGNf
aGRfZ2V0X2Nwb3J0KGNwY19oZCwgY3BvcnRfaWQpOw0KKwlpZiAoIWNwb3J0KSB7DQorCQlkZXZf
d2FybihjcGNfaGRfZGV2KGNwY19oZCksICJjcG9ydCAldSBub3QgYWxsb2NhdGVkXG4iLCBjcG9y
dF9pZCk7DQorCQlnb3RvIGZyZWVfc2tiOw0KKwl9DQorDQorCWNwY19wcm90b2NvbF9vbl9kYXRh
KGNwb3J0LCBza2IpOw0KIA0KIGZyZWVfc2tiOg0KIAlrZnJlZV9za2Ioc2tiKTsNCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dyZXlidXMvY3BjL3Byb3RvY29sLmMgYi9kcml2ZXJzL2dyZXlidXMvY3Bj
L3Byb3RvY29sLmMNCm5ldyBmaWxlIG1vZGUgMTAwNjQ0DQppbmRleCAwMDAwMDAwMDAwMC4uNTY4
NDU1N2RmNjQNCi0tLSAvZGV2L251bGwNCisrKyBiL2RyaXZlcnMvZ3JleWJ1cy9jcGMvcHJvdG9j
b2wuYw0KQEAgLTAsMCArMSw0OSBAQA0KKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwt
Mi4wDQorLyoNCisgKiBDb3B5cmlnaHQgKGMpIDIwMjUsIFNpbGljb24gTGFib3JhdG9yaWVzLCBJ
bmMuDQorICovDQorDQorI2luY2x1ZGUgPGxpbnV4L3NrYnVmZi5oPg0KKw0KKyNpbmNsdWRlICJj
cGMuaCINCisjaW5jbHVkZSAiaGVhZGVyLmgiDQorI2luY2x1ZGUgImhvc3QuaCINCisNCisNCit2
b2lkIGNwY19wcm90b2NvbF9wcmVwYXJlX2hlYWRlcihzdHJ1Y3Qgc2tfYnVmZiAqc2tiLCB1OCBh
Y2spDQorew0KKwlzdHJ1Y3QgY3BjX2hlYWRlciAqaGRyOw0KKw0KKwlza2JfcHVzaChza2IsIHNp
emVvZigqaGRyKSk7DQorDQorCWhkciA9IChzdHJ1Y3QgY3BjX2hlYWRlciAqKXNrYi0+ZGF0YTsN
CisJaGRyLT5hY2sgPSBhY2s7DQorCWhkci0+cmVjdl93bmQgPSAwOw0KKwloZHItPmN0cmxfZmxh
Z3MgPSAwOw0KKwloZHItPnNlcSA9IENQQ19TS0JfQ0Ioc2tiKS0+c2VxOw0KK30NCisNCit2b2lk
IGNwY19wcm90b2NvbF9vbl9kYXRhKHN0cnVjdCBjcGNfY3BvcnQgKmNwb3J0LCBzdHJ1Y3Qgc2tf
YnVmZiAqc2tiKQ0KK3sNCisJc3RydWN0IGNwY19oZWFkZXIgKmNwY19oZHIgPSAoc3RydWN0IGNw
Y19oZWFkZXIgKilza2ItPmRhdGE7DQorCXU4IHNlcSA9IGNwY19oZWFkZXJfZ2V0X3NlcShjcGNf
aGRyKTsNCisJYm9vbCBleHBlY3RlZF9zZXEgPSBmYWxzZTsNCisNCisJbXV0ZXhfbG9jaygmY3Bv
cnQtPmxvY2spOw0KKw0KKwlleHBlY3RlZF9zZXEgPSBzZXEgPT0gY3BvcnQtPnRjYi5hY2s7DQor
CWlmIChleHBlY3RlZF9zZXEpDQorCQljcG9ydC0+dGNiLmFjaysrOw0KKwllbHNlDQorCQlkZXZf
d2FybihjcGNfaGRfZGV2KGNwb3J0LT5jcGNfaGQpLA0KKwkJCSAidW5leHBlY3RlZCBzZXE6ICV1
LCBleHBlY3RlZCBzZXE6ICV1XG4iLA0KKwkJCSBzZXEsIGNwb3J0LT50Y2IuYWNrKTsNCisNCisJ
bXV0ZXhfdW5sb2NrKCZjcG9ydC0+bG9jayk7DQorDQorCWlmIChleHBlY3RlZF9zZXEpIHsNCisJ
CXNrYl9wdWxsKHNrYiwgQ1BDX0hFQURFUl9TSVpFKTsNCisNCisJCWdyZXlidXNfZGF0YV9yY3Zk
KGNwb3J0LT5jcGNfaGQtPmdiX2hkLCBjcG9ydC0+aWQsIHNrYi0+ZGF0YSwgc2tiLT5sZW4pOw0K
Kwl9DQorfQ0KLS0gDQoyLjQ5LjANCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZ3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0IC0tIGdyZXlidXMtZGV2QGxp
c3RzLmxpbmFyby5vcmcKVG8gdW5zdWJzY3JpYmUgc2VuZCBhbiBlbWFpbCB0byBncmV5YnVzLWRl
di1sZWF2ZUBsaXN0cy5saW5hcm8ub3JnCg==
