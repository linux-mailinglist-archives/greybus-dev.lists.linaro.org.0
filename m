Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A2D6CB93E9
	for <lists+greybus-dev@lfdr.de>; Fri, 12 Dec 2025 17:14:42 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 42E5C3F900
	for <lists+greybus-dev@lfdr.de>; Fri, 12 Dec 2025 16:14:41 +0000 (UTC)
Received: from mx0a-0024c301.pphosted.com (mx0a-0024c301.pphosted.com [148.163.149.154])
	by lists.linaro.org (Postfix) with ESMTPS id 113553F99A
	for <greybus-dev@lists.linaro.org>; Fri, 12 Dec 2025 16:13:40 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=silabs.com header.s=pps12202023 header.b=bgNHPGL7;
	dkim=pass header.d=silabs.com header.s=selector1 header.b=Sz78Qjm9;
	spf=pass (lists.linaro.org: domain of Damien.Riegel@silabs.com designates 148.163.149.154 as permitted sender) smtp.mailfrom=Damien.Riegel@silabs.com;
	dmarc=pass (policy=reject) header.from=silabs.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from pps.filterd (m0101743.ppops.net [127.0.0.1])
	by mx0a-0024c301.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BC1HxS02471899;
	Fri, 12 Dec 2025 10:13:37 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps12202023;
	 bh=HEIJNVwA5aLG5LbLOYdeWvLIAHkyZ5Mi0DXjXMbvbtA=; b=bgNHPGL7hjMa
	SeRQv+p7IJfBmUPCm6/RbGj9PjMXGaRtwMO8cBq7xWCJ+jfUqWx5z0O9nkpHQdqP
	xGCNS5uZ/wuG4Ib0uO47nkCjrvh8gZwQ8BbNSG2MF/9q4JbkhwGd3qVYCYdWCrAK
	wxNwL0EFYutzeiIaJa6R+Poa0fO8vDgHcDXy/FlidB9q1eKYmdQhB6lbkAVCc0lY
	biqYthAf0hBpePR2mnSJ+MvuJPwbX1QflF4QEQY5QtlMszgiTtAzcxt0f+SkHP1+
	PaMwmUR0I7qcxsHAYeRx6+f++swkAYcclrXAj+gHW7rACbDSn4DKbb4yJd/5IDeX
	EwXjHB47hg==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11020120.outbound.protection.outlook.com [40.93.198.120])
	by mx0a-0024c301.pphosted.com (PPS) with ESMTPS id 4ayht2mdet-4
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 12 Dec 2025 10:13:37 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yAgEnHYJKFgbk0hvx4TFvgY9i6S04xn/XnHz0wRu5ogdkQ2xcEnnKS9p3q/UAPqVT7p2WDZMqG9yAjoRh+DwQLu1R08hFYIuF04+SWtY8bo4Q0YYMQxIRLkrS0mhQbvwq5r/yFa3ZnNrcZNREUj86NBIu1oTk6WKtTpPJZ2zIUXkuqAM9DSBhh6BV+5ha1XWhezaIG6OUAkPmddGbgqTmpZc/b2Ds668j2nVNIDiVnjlsMT/yJbo7Tj4l//LKdqmJHbRcmDcCdQiDgOHbb8XF3tGPXmkW6XS9/lSpxww6aZsyrMz/SeJiH53ccR9sm9xbtdOiFap2X+WPqZ+sHb+Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HEIJNVwA5aLG5LbLOYdeWvLIAHkyZ5Mi0DXjXMbvbtA=;
 b=pT+KCRFRvzL8Pp4slQ3WW4t4PEH5C1T3C87JJZwLPZYDBF9VhngQFtE4PdcehAbyBSjGX3texRwTJ2bkuLN2viA1R+N4fbs5DPNM+kBJdjCMlY6bDzst/jhutWkTCOlV2a+S4VEHJe1d4Ev+1dr1sLRkzUYj6co8z47xv7Jm/kyl7FEwbgaaGi1R+T6ILp1rOss2rBo492u5+l0fSHB0xH2PpGrBbBABAo+tzGdmNx6gVTByZpfv8hd/PZfsSFAzF2NWVTH7FQhIEJKbqv/sNTBsinc2AcWMZCyFDt8ASLKEGyefwvBGpbNnJTcSDHveBb7/jWKA67n0J1kVCamoHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silabs.com; dmarc=pass action=none header.from=silabs.com;
 dkim=pass header.d=silabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HEIJNVwA5aLG5LbLOYdeWvLIAHkyZ5Mi0DXjXMbvbtA=;
 b=Sz78Qjm9xPgZ9f3WBsDDhqOPgw75ivHv3fb8yU+Pn2MQm2bx+FhGPh0cHxdKCxrUoxP+xIp4ttIAin675Bdl4zkl3deEQHtpNRdhRXdIn3yny94TUrKFBSpGJsvcGlU5eRq+8JQ9KmchYVh4CdnMfYXgNOjyranAqwMF5TaryDM=
Received: from DS0PR11MB8205.namprd11.prod.outlook.com (2603:10b6:8:162::17)
 by DM3PPF7468F7991.namprd11.prod.outlook.com (2603:10b6:f:fc00::f2d) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.9; Fri, 12 Dec
 2025 16:13:31 +0000
Received: from DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::2de6:bc88:2af7:3583]) by DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::2de6:bc88:2af7:3583%3]) with mapi id 15.20.9412.005; Fri, 12 Dec 2025
 16:13:31 +0000
From: =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
To: greybus-dev@lists.linaro.org
Date: Fri, 12 Dec 2025 11:13:07 -0500
Message-ID: <20251212161308.25678-14-damien.riegel@silabs.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251212161308.25678-1-damien.riegel@silabs.com>
References: <20251212161308.25678-1-damien.riegel@silabs.com>
X-ClientProxiedBy: YQZPR01CA0176.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:8b::25) To DS0PR11MB8205.namprd11.prod.outlook.com
 (2603:10b6:8:162::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8205:EE_|DM3PPF7468F7991:EE_
X-MS-Office365-Filtering-Correlation-Id: 766f8f21-ddda-42fd-e027-08de399964bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?MnpXVGp1VUZCOHB2TUlVSllyeFlPYzJYTXVQN0cvVVM4QndFUDVnQ0FjYXZq?=
 =?utf-8?B?TVlmZE5EWW1MSzhmeHo1UHlrazBDUUVJNkhmU2RrRHJ6MFJLRnBUYkxyNmV2?=
 =?utf-8?B?NEpFT3pXRHVaK2FidXhvcm91Tk10VFdwbC9VcTY4NVdRc2RpUjY5ZVJjL1NB?=
 =?utf-8?B?Vm1MNGxlSkl0bE42VlhqOFE4R3FGNzZKMy93ME1OMW03OTJ6bWl1S2hyUWZw?=
 =?utf-8?B?M05sdTlCVzViSnkwQTZqcnZwZzVpWDBIU2lpb3p3emRCc1huY0VwemlpcjRS?=
 =?utf-8?B?Z3MrS2lkL0lrbTgveU9jRVhKT1NjTGhPL1EzOWpRRG5zd0JqN1NMVk9ienhl?=
 =?utf-8?B?eVh2WHFuek5xdERrSFNwQ2hpNDM4b05qbkw1dFJjS2U1MUh5bUJvTkF1RnF1?=
 =?utf-8?B?UXJobDV0dzlwbG5rTXJEL3Q3alFSQ1RuWEcrdUNRVE93bUpjUUxDUUdYVUY0?=
 =?utf-8?B?Q2V0RzRhelNyVDNSZHczNDlUbGNubkt3dlhTU05sUXY4Rkx4YS94aXVPTUpG?=
 =?utf-8?B?UUlhRUVleWdaYi94UVc1T055NGRYN21rM29TRTFWT0ZpSmxTaGZhMFpQL2t1?=
 =?utf-8?B?NEJDK2c3YVg2bmZnV2IwU3RDUktQT3oxc0EwcW1OcmNLVzlxWkxUZUVhcUNl?=
 =?utf-8?B?TjVKdHdtVG9VQzZvczJ1YTJuc2xkc1EyVUlhUTBWdGdTUHVDWTB2Vm5rU0tn?=
 =?utf-8?B?QTA4VkNtQUJKb25BVm1rNGcxemdwYzQ4cUFXNWZObDVoSCs5MDVGdGVlSXlF?=
 =?utf-8?B?WEhoNVhVY0UvYUtMckdWeENXdDI5eTNDcEo3VUNlVzMzRVVzcWs1ak1hWUJW?=
 =?utf-8?B?K3FpMXNjVkg2WTJOQ3B4VTdSTGJuRUJIWEtMeGZpUE5EVlRZYXo2UUtNOTJC?=
 =?utf-8?B?N01ucmRjOTNaMUlNLy84dGd0dTFleXdJK1htcUpTUU1VM2Vud1djSWR0WE1m?=
 =?utf-8?B?TDl6R1hRSFRhOStFMjEvTmdHVGV2WUoySmpGQkZnRzl0YWRHbUQ1K3lPZW4y?=
 =?utf-8?B?aUwxVTFpSUhPSlk2Q1d2REthQkp4NCtmZFBqeUhneW9hZ3B5N2NEc3pSSkNr?=
 =?utf-8?B?TmdBSXA4MFY4cno2c3pMWnJLN3ZYR3hqNzFuMzlveUNkNVEyTWhwc0RpK0tS?=
 =?utf-8?B?ZkY3cnR6ditLbXpDYlliUVB4TW9oQWpEZXlTcDFTaDdWSnd0ek5WSVRQSkJt?=
 =?utf-8?B?c2JPSktjL2hqcitFdHNlSDNZamhwVG9KNm5HUjQxUm55TmNYaytHQjJYTEhM?=
 =?utf-8?B?RTljQlNGNkRxRmkrVUxqZjM0SjVBUmN5alUybUxoS3dWOTZ6V01vbERNbzRp?=
 =?utf-8?B?dE9SdVNIQ1lrUlJGWURaSzBMTmJzaGNUTWZqa0ZGR2dmbGVuN25iYnJ1VGhr?=
 =?utf-8?B?ZmdYVmM5OGlwb1JZTWUwd0hTZjh2QjB6K2RiTGkwVEkyWVBGYUV2RUVXQmc5?=
 =?utf-8?B?ckFNcWNQaC8xUjRFWlhneDNVNm5IS1NpbXp1SHkxNnJxMUlzTndCWkljL0hO?=
 =?utf-8?B?M1VCU3I1dDlRYUhMSlZrWXc2cHRvc0J0alVROTRGemxDN3RIRlFvZHpTN1Jt?=
 =?utf-8?B?dFdIaWJvK3grVytJdmptelJaYkorNCtvOE81bTQ5cEM1MEVNc0I4TmxvcjhJ?=
 =?utf-8?B?aS9QVEV4VDFVWWR5OEppeml1bjF5ZE9EcXMrOUJUdWxGSTFTc0pEQUl1MGtO?=
 =?utf-8?B?OEMrU3ZRRmE0UXVNTStvUEZUTEo2UXpnVUEwRUw5anFVVHFSdHhHN1dITmtU?=
 =?utf-8?B?bXh6VlJvQ0o1bzQ4b1pnSC9MT1NZWDhENTZheFRJS2R5VXMxSzRqUWlRZ2d2?=
 =?utf-8?B?WGVtMGZQZ1ZzOWp4VllwVGsxTW4yYjVycHI1RFEwanVpZEFSY1pybUJ6MFZt?=
 =?utf-8?B?Qm9NQmpRMFMwd05jOXFUak1PK3diVld6Q2xlZm4veXVaYVBWMG9ESDhLRm04?=
 =?utf-8?B?T0ZoY1pQNElXZkE4cFp5SE0yUWJtOXFBOXVFMUVxM0VLNDh3bVJuMThmTnFL?=
 =?utf-8?B?Yy9DeTFKbEhlWEY0eFN0VVp0UkVVVEp4b2FDbnRwSXlWQlNNL2dLNjVUYy93?=
 =?utf-8?Q?P72agQ?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8205.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?b01rRjA1YS9LQTJ3TlBtRDBLYkh0SUtnejNKQnJqRWlTM0VrQThmUnVXQ0pV?=
 =?utf-8?B?Z1FqUlFKSWVKVXF4bVhxc3BiTXlsTlE4Ti93ekRNaHg1UGRzdk16YVd0Y2ZP?=
 =?utf-8?B?b1FrZ3NIOVZ3TTJ2RjVsS3RFejh5UDRHUVpVTHk3ajlia1VGd1VXWFhEQURw?=
 =?utf-8?B?VjdzS2o2cURhYU15ZXpXRXNFTVZKVk9CVlFGeGRRRFFEWDR0RkF1U3hpUzNK?=
 =?utf-8?B?SXRWeHRhR2xzV291M1FwNUhGeUNDaUd2WWNjbE9TcjBuVmxoMEdnb2xFbWgw?=
 =?utf-8?B?TkNEd2FDR0pWSjdrRmtTcjBzSzVFZXRpWVZTZjkwWUVhbWRmQWlaeWx3b1A2?=
 =?utf-8?B?SXhrUndhYnA5RXRFTWNYT0Rlem11L0FkQUdLK3ZmbGgxZVo2MHFpYnVBVkRI?=
 =?utf-8?B?R0dhcmlmYWlGb0ROQ3ZhY094NVFaQXVXR0IxOGR0NDMyNXZGbCs2VCtxQXhv?=
 =?utf-8?B?bDlxcjBXcjNiUlRwNVVqNjJjTG14MGNmRjFTT1g2NXdvVGpBQ245VkdNM3BG?=
 =?utf-8?B?Zks2ZHpXdDNOME1QNUkxc0dEeHFNcnhQbFNkQXdnSzFJSDU5Mm9NQVV5M1FY?=
 =?utf-8?B?bUFzdlplWTRHeGpRTk5sYkJkZVgvS2s4VVlWN0MrM2grRTNqNVZ4am1wQU04?=
 =?utf-8?B?SzhEc2lsTzh5clh3Q2padCt1RnpQbFZNeFJhbnJqUGxLSWdHOFd4T3RvSjk4?=
 =?utf-8?B?SWZOalhHc2Rlem1UVWwxQUlJSlhoSUhRSEhhanpJYmxSdldsL3ZrbGhkUzk3?=
 =?utf-8?B?c1ZrQ2Y0Y29IakJuZXQrbGJGTGs4TlhhYlF2Um1TQldQMGdSZU01TU5PbTNo?=
 =?utf-8?B?ajFSWXRBQjhxYkw5RzgyU0lMUUlhQXR1WlozSHNMOUQ3UjdVaEwyQ3Fsdm9K?=
 =?utf-8?B?QTBDU3RLMFBJeHY3RFA3N1NiS0RQNHJUTk5tTGJDd3BWT2RvV3I2OG5PMjdC?=
 =?utf-8?B?QlhtZk1qNVdjbFFwbmVWRzhvSGVxZFAvKzdGK3ZyUkNZaXB3QkNaWm1QS1Zp?=
 =?utf-8?B?dWVxdFlmRDYwdjRGdnBGSXR1bzY2dFl6TldNSmJESk9OMXhHdlRlV1MrOFBN?=
 =?utf-8?B?ajJ6QzhWMmhqTmphbmhwb0xQT3pUQW1oc0ZQZ2ZJZTJudldhN1ptMXlWMWhE?=
 =?utf-8?B?Y1lEMnFBeEJZbW8vWXQ5QllZNWJCR0s0YS9QRlJCbCtPSGRjZGkvd25XN01C?=
 =?utf-8?B?b0hGYm9VNms4a1JaN0MrUTZDTTZ5N0Y4NHpEUU55cDZkdEdjeis4L2txTlVp?=
 =?utf-8?B?cUZKVjFvNk1Yd3FIM00xL2ZWQVRpbS9zL2FkbnA4Ni9yd2p5MDlpbDBKOTJk?=
 =?utf-8?B?aElXZ20zdFZiMFAzRUxHemQvSDNjQXl0WjhpK2FSUUMwVnlja1RpaTNPY2h0?=
 =?utf-8?B?eDNUaFNyQk04K0lRQ2Q2U1JFSHFrMm9TRUlNME9RUEc5TU12c1h3ck9qdGV0?=
 =?utf-8?B?UmpMUTN2YzhZUkNpRDBPSXgzc0xlRXFtSDd5cGtSR2pqTXhCUEpxQ2haQTZE?=
 =?utf-8?B?SXUxQ1FxNWJTSDdEQ3pqSk5rR3pGUGxGRUtpLzNrblB6YUY3Y0xTckZFL3Zy?=
 =?utf-8?B?ZG9TbGlIcG5iT3p3RjI1aHFNMDZ1OWcvZkdkbzJaSEJPUFg3Y0FOaEVRSUp2?=
 =?utf-8?B?ZXdSNHo4cmZxQ2RvOWhPVE9FUjZBd01NOGQ1dG9ySXpWMDRPTmdrZVQ5TjV4?=
 =?utf-8?B?YzRlZi8zc1Zvamd1d0ZDdTlqVGI1ZVdHR3lrSllCRnE5RUhPMUxabk81RlVa?=
 =?utf-8?B?b0YrcDJQN1NKSitaN2VIN0grK01abUdCRmhYWmVPNVlsNmFleU9SRFl2Nm0x?=
 =?utf-8?B?Z3ZaakVHOWZnM2NQU25PWEFwNGtLVmM1WVNPeUJzNWJnWUZmSGQzQ2pWczZN?=
 =?utf-8?B?WVdJSVFDUkNTL1BJWkFrUkp1UmhvQ0Qvclg4VGdTSzYvV0w1MnhUdXFqL1lx?=
 =?utf-8?B?Rk1LQkJ5cWdLdzRnR0xNemlGOHFJUHVIeEFTd1htZmsrdWJwK041N1dhM3J6?=
 =?utf-8?B?ZzBtSTE0aXVRMGZHT0ZsMTEyMCtsZGkydzlwK1FkVVc3cUNYV05YQ1VDb3pm?=
 =?utf-8?B?Q2swN1dGTmFEUWZCcGlmdWkrUXhVU01odEd2RTN0Z3AvVkllU1JNNFRKblNB?=
 =?utf-8?Q?4qX65R6lXzXWh0R5uuh3ALxCE?=
X-OriginatorOrg: silabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 766f8f21-ddda-42fd-e027-08de399964bc
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8205.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 16:13:31.7817
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 54dbd822-5231-4b20-944d-6f4abcd541fb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: osClpiEbGoq26TdJx2vhdI3clCZ0henaVzmRkef2TY7jtTmIZ0BGofEZIFALA9834F4bC5YSxQj29Upi0cpd3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF7468F7991
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEyMDEyOSBTYWx0ZWRfXyYQxvgq+6aMt
 /8dxzoJd2XZKT+vKpXxUCoc94nUr8ACEI8mGOSckYVLbyM0UoZWj4OdtpD+NBZl8cUo8XR91MUB
 OenLeWQnCh1azn3apVz/3sFCjFC+Yl+lh9474hfkod64w+zcRCsg3uCQR51EywSOgELmEFrT2Yk
 6acLWYtcTMxnH18MV5pcaFHpnGpjgIHR6Sny1qabvL88QMXeoY/frUrUXbz1665amXuZvTv3nSO
 ODFrrWlpS1C/82ekBrCwx3J6826i6yCHVZQrs4lU2qFVUvbzpE2G05puisOYf6Rjn7IbPgyvD5e
 z3GDilthOyeJdC23irLpVglURWnV8s2X1UP4wZS+ZQZi8d/DKDH34ePBVFNaG8tZXThs6ghLaNY
 obUZ4GRpD8bLc54IkAM3dcKTlUtkbg==
X-Authority-Analysis: v=2.4 cv=BKy+bVQG c=1 sm=1 tr=0 ts=693c3f31 cx=c_pps
 a=OsHIvx7z5txkqQhXuj38dg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=M51BFTxLslgA:10
 a=i1IsUcr2s-wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=2AEO0YjSAAAA:8
 a=8szWe6Y7soD9Pg2qZbAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: osTCjdY3T0C8zk5y9mfBRyFRYsIS4a7G
X-Proofpoint-GUID: osTCjdY3T0C8zk5y9mfBRyFRYsIS4a7G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-12_04,2025-12-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 suspectscore=0 bulkscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512120129
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.10 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[silabs.com,reject];
	R_DKIM_ALLOW(-0.20)[silabs.com:s=pps12202023,silabs.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:148.163.149.154];
	RCVD_IN_DNSWL_LOW(-0.10)[148.163.149.154:from];
	MIME_GOOD(-0.10)[text/plain];
	ASN(0.00)[asn:26211, ipnet:148.163.148.0/22, country:US];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	BLOCKLISTDE_FAIL(0.00)[40.93.198.120:server fail,148.163.149.154:server fail,2603:10b6:8:162::17:server fail];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_IN_DNSWL_NONE(0.00)[40.93.198.120:received];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DNSWL_BLOCKED(0.00)[2603:10b6:8:162::17:received];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[silabs.com:+]
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 113553F99A
X-Spamd-Bar: ----
Message-ID-Hash: PTTDUAHGO6FMIPBFM3MPTHNJJ222EBHU
X-Message-ID-Hash: PTTDUAHGO6FMIPBFM3MPTHNJJ222EBHU
X-MailFrom: Damien.Riegel@silabs.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, Silicon Labs Kernel Team <linux-devel@silabs.com>, =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH 13/14] greybus: cpc: add private data pointer in CPC Host Device
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/PTTDUAHGO6FMIPBFM3MPTHNJJ222EBHU/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

QWRkIGEgcHJpdmF0ZSBkYXRhIHBvaW50ZXIgd2hlbiBjcmVhdGluZyBhIENQQyBIb3N0IERldmlj
ZS4gVGhpcyBsZXRzDQp0aGUgaG9zdCBkZXZpY2UgZHJpdmVycyBnZXQgYmFjayB0aGVpciBjb250
ZXh0IG1vcmUgZWFzaWx5IGluIHRoZQ0KY2FsbGJhY2tzLg0KDQpTaWduZWQtb2ZmLWJ5OiBEYW1p
ZW4gUmnDqWdlbCA8ZGFtaWVuLnJpZWdlbEBzaWxhYnMuY29tPg0KLS0tDQogZHJpdmVycy9ncmV5
YnVzL2NwYy9ob3N0LmMgfCA0ICsrKy0NCiBkcml2ZXJzL2dyZXlidXMvY3BjL2hvc3QuaCB8IDUg
KysrKy0NCiAyIGZpbGVzIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkN
Cg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3JleWJ1cy9jcGMvaG9zdC5jIGIvZHJpdmVycy9ncmV5
YnVzL2NwYy9ob3N0LmMNCmluZGV4IDU0ZjBiMDdlZmVjLi4yNzg0MjA3Mjc5ZSAxMDA2NDQNCi0t
LSBhL2RyaXZlcnMvZ3JleWJ1cy9jcGMvaG9zdC5jDQorKysgYi9kcml2ZXJzL2dyZXlidXMvY3Bj
L2hvc3QuYw0KQEAgLTE1OCw3ICsxNTgsOCBAQCBzdGF0aWMgdm9pZCBjcGNfaGRfaW5pdChzdHJ1
Y3QgY3BjX2hvc3RfZGV2aWNlICpjcGNfaGQpDQogCXNrYl9xdWV1ZV9oZWFkX2luaXQoJmNwY19o
ZC0+dHhfcXVldWUpOw0KIH0NCiANCi1zdHJ1Y3QgY3BjX2hvc3RfZGV2aWNlICpjcGNfaGRfY3Jl
YXRlKHN0cnVjdCBjcGNfaGRfZHJpdmVyICpkcml2ZXIsIHN0cnVjdCBkZXZpY2UgKnBhcmVudCkN
CitzdHJ1Y3QgY3BjX2hvc3RfZGV2aWNlICpjcGNfaGRfY3JlYXRlKHN0cnVjdCBjcGNfaGRfZHJp
dmVyICpkcml2ZXIsIHN0cnVjdCBkZXZpY2UgKnBhcmVudCwNCisJCQkJICAgICAgdm9pZCAqcHJp
dikNCiB7DQogCXN0cnVjdCBjcGNfaG9zdF9kZXZpY2UgKmNwY19oZDsNCiAJc3RydWN0IGdiX2hv
c3RfZGV2aWNlICpoZDsNCkBAIC0xNzUsNiArMTc2LDcgQEAgc3RydWN0IGNwY19ob3N0X2Rldmlj
ZSAqY3BjX2hkX2NyZWF0ZShzdHJ1Y3QgY3BjX2hkX2RyaXZlciAqZHJpdmVyLCBzdHJ1Y3QgZGV2
aWMNCiAJY3BjX2hkID0gZ2JfaGRfdG9fY3BjX2hkKGhkKTsNCiAJY3BjX2hkLT5nYl9oZCA9IGhk
Ow0KIAljcGNfaGQtPmRyaXZlciA9IGRyaXZlcjsNCisJY3BjX2hkLT5wcml2ID0gcHJpdjsNCiAN
CiAJY3BjX2hkX2luaXQoY3BjX2hkKTsNCiANCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dyZXlidXMv
Y3BjL2hvc3QuaCBiL2RyaXZlcnMvZ3JleWJ1cy9jcGMvaG9zdC5oDQppbmRleCBlZTZhODZkZTMw
OS4uNGJiNzMzOWIzOTQgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dyZXlidXMvY3BjL2hvc3QuaA0K
KysrIGIvZHJpdmVycy9ncmV5YnVzL2NwYy9ob3N0LmgNCkBAIC0zNyw2ICszNyw4IEBAIHN0cnVj
dCBjcGNfaG9zdF9kZXZpY2Ugew0KIAlzdHJ1Y3QgY3BjX2Nwb3J0ICpjcG9ydHNbR0JfQ1BDX05V
TV9DUE9SVFNdOw0KIA0KIAlzdHJ1Y3Qgc2tfYnVmZl9oZWFkIHR4X3F1ZXVlOw0KKw0KKwl2b2lk
ICpwcml2Ow0KIH07DQogDQogc3RhdGljIGlubGluZSBzdHJ1Y3QgZGV2aWNlICpjcGNfaGRfZGV2
KHN0cnVjdCBjcGNfaG9zdF9kZXZpY2UgKmNwY19oZCkNCkBAIC00NCw3ICs0Niw4IEBAIHN0YXRp
YyBpbmxpbmUgc3RydWN0IGRldmljZSAqY3BjX2hkX2RldihzdHJ1Y3QgY3BjX2hvc3RfZGV2aWNl
ICpjcGNfaGQpDQogCXJldHVybiAmY3BjX2hkLT5nYl9oZC0+ZGV2Ow0KIH0NCiANCi1zdHJ1Y3Qg
Y3BjX2hvc3RfZGV2aWNlICpjcGNfaGRfY3JlYXRlKHN0cnVjdCBjcGNfaGRfZHJpdmVyICpkcml2
ZXIsIHN0cnVjdCBkZXZpY2UgKnBhcmVudCk7DQorc3RydWN0IGNwY19ob3N0X2RldmljZSAqY3Bj
X2hkX2NyZWF0ZShzdHJ1Y3QgY3BjX2hkX2RyaXZlciAqZHJpdmVyLCBzdHJ1Y3QgZGV2aWNlICpw
YXJlbnQsDQorCQkJCSAgICAgIHZvaWQgKnByaXYpOw0KIGludCBjcGNfaGRfYWRkKHN0cnVjdCBj
cGNfaG9zdF9kZXZpY2UgKmNwY19oZCk7DQogdm9pZCBjcGNfaGRfcHV0KHN0cnVjdCBjcGNfaG9z
dF9kZXZpY2UgKmNwY19oZCk7DQogdm9pZCBjcGNfaGRfZGVsKHN0cnVjdCBjcGNfaG9zdF9kZXZp
Y2UgKmNwY19oZCk7DQotLSANCjIuNDkuMA0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpncmV5YnVzLWRldiBtYWlsaW5nIGxpc3QgLS0gZ3JleWJ1cy1k
ZXZAbGlzdHMubGluYXJvLm9yZwpUbyB1bnN1YnNjcmliZSBzZW5kIGFuIGVtYWlsIHRvIGdyZXli
dXMtZGV2LWxlYXZlQGxpc3RzLmxpbmFyby5vcmcK
