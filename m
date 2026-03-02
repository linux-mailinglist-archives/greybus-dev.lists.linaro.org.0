Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id FfozMTf0pWleIQAAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Mon, 02 Mar 2026 21:33:59 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B8041DFB38
	for <lists+greybus-dev@lfdr.de>; Mon, 02 Mar 2026 21:33:59 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 10A4E40171
	for <lists+greybus-dev@lfdr.de>; Mon,  2 Mar 2026 20:27:13 +0000 (UTC)
Received: from mx0a-0024c301.pphosted.com (mx0a-0024c301.pphosted.com [148.163.149.154])
	by lists.linaro.org (Postfix) with ESMTPS id CDD9F4016D
	for <greybus-dev@lists.linaro.org>; Mon,  2 Mar 2026 20:27:06 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=silabs.com header.s=pps12202023 header.b=qpfmNKnd;
	dkim=pass header.d=silabs.com header.s=selector1 header.b=aJb+erI4;
	dmarc=pass (policy=reject) header.from=silabs.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1");
	spf=pass (lists.linaro.org: domain of "prvs=1521e20967=damien.riegel@silabs.com" designates 148.163.149.154 as permitted sender) smtp.mailfrom="prvs=1521e20967=damien.riegel@silabs.com"
Received: from pps.filterd (m0101743.ppops.net [127.0.0.1])
	by mx0a-0024c301.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 622F62e24059130;
	Mon, 2 Mar 2026 14:26:54 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pps12202023; bh=N9cTGDfPae7moAF3mBTu
	P0aAsZvCr8atCWWrb6vNWd0=; b=qpfmNKndIO6xHpuTdRe1zalbGfHYZWcRqpuD
	Zcz/e68c+x76rC6Sz1xvWNbhiPP1bih2q+/9QIHo/4jE6xO58m5ihdO7sA4aIk3t
	23b0tVqBA5XZCrY0g3jTMqU6EQ98dKPCMy7E126XwR7JTXmR09pmzeqbMD48nnPU
	M83Vy7pH1f/GOo1TuVCI/xJpVNNMFQuCwU2xZNaef0G/f6ph16SF2aGLwWdxWekx
	m7Z/dot164IIs5bsC/hG66zieu4loWAA1hXxNghqZk/QVcqGuIY5ZsvwLO67CvYy
	5Qx/D7g0C2o/keWbyQEXvZgh8Wp1SA8lmpmBU24UkIketUXNbg==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11021085.outbound.protection.outlook.com [52.101.52.85])
	by mx0a-0024c301.pphosted.com (PPS) with ESMTPS id 4ckwj940hy-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 02 Mar 2026 14:26:54 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nopMOVA1HtII55sfacgvOgQdxgBN11PvpJsCSTq119dJIt1GNJFWSfh6uTtsC/exr6Rq3QKdHt+xCBtzK4PLeCEoRCcGYvUh1SBHyC0yft+SX0b7oyWX+fGFog19znM6fC9OzPyJp1qzTcBRtTmsaadfM7RUTCGTRplY/0KxQClTkdd00J09yGdjhK9RsH4PvLDF7e/ogmo0Jy8hp8givw/CsdD3czSiLdjN+OdepGqqFExnkMpRuKSMSmipt7ibsB0UNowMOgBt/1hrp01hrPeKjwfm9gUmVYFyiMiPujc7tzn0YIFRhubcXaJoxuqmbSP3/9Zb1MNqgq6foU/oHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N9cTGDfPae7moAF3mBTuP0aAsZvCr8atCWWrb6vNWd0=;
 b=tXAdLsrMkCcqhuvUk/egWXJ5z5urQvELd2q2j6Cjgfj98C0FCC8eG9Hi6JrOLcjT/6Jz1svCJs+K/jaOehPSJYcAQLwp0N/zOM+5klhXtPagWJ+2/4HOWKyJT87nVEjMpvPeYFKVZWuXpXF/bUnd55HaOlsGyLhzwbJPdR4t5DCKw+yPfJK8vu6z9qDM6DXbFytyvshVo76oAj0dG+mAxH+LY/AG27RXDQqhBlS8M4B9j1NvstDarJY2Escm9HkrMwXXmreITUbHhzGBN39duoSY67sE3u8gr6+idKkBMH2OR5DjsJdcSJm6Qg/UpNvizPbyIQbFgdOCbu2cQqwwkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silabs.com; dmarc=pass action=none header.from=silabs.com;
 dkim=pass header.d=silabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N9cTGDfPae7moAF3mBTuP0aAsZvCr8atCWWrb6vNWd0=;
 b=aJb+erI4d8kbY/fN1+3MrJg8AeS7+WEyWkS5mtJLVo3QXOUjFFEWdvOMMcH3QNnk1mQWTZ4FjKr3K2Iyam+0CWjNNE5NsFWyrGXjbEZkyiNC4aOzbuWrDDPx6UWdmF4u/k46Y+pPqsOm69rBsxNcd+Wzg4LbfvBnwNQTmigQyzs=
Received: from DS0PR11MB8205.namprd11.prod.outlook.com (2603:10b6:8:162::17)
 by DS0PR11MB8719.namprd11.prod.outlook.com (2603:10b6:8:1a8::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.20; Mon, 2 Mar
 2026 20:26:51 +0000
Received: from DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::2de6:bc88:2af7:3583]) by DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::2de6:bc88:2af7:3583%3]) with mapi id 15.20.9654.020; Mon, 2 Mar 2026
 20:26:51 +0000
From: =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
To: greybus-dev@lists.linaro.org, Johan Hovold <johan@kernel.org>,
        Alex Elder <elder@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org
Date: Mon,  2 Mar 2026 15:26:37 -0500
Message-ID: <20260302202638.31303-1-damien.riegel@silabs.com>
X-Mailer: git-send-email 2.52.0
X-ClientProxiedBy: YQZPR01CA0077.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:84::14) To DS0PR11MB8205.namprd11.prod.outlook.com
 (2603:10b6:8:162::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8205:EE_|DS0PR11MB8719:EE_
X-MS-Office365-Filtering-Correlation-Id: 264992c1-f6c6-4e3c-b108-08de789a091c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	uit91/V9Y0G+U83A+JG9IcuKRfLtGEPx/jLDFRVi+oipVYvqoTk4WWqa6flaI0PeMF19tW2kI5Cdtt2iIxKkM3SO58GhU7jehVfLQ+f7kKIbtoNpsmV6c7SGUEvCK5ypzN39ehgslMQxvjeD8vYFvV2p88rIJYukZxn/AiTZAIXl0z8HrzzAIwZ+g6/kv5LCyCbrWhpwzggq9w28H2/kbp6L6eYDldhUOzxsQxwbfjmbXhaNCLVlzJLdQ/wPKuMGq974jsEATicpK8XNiRMjaUn1tTXfKT9Wp34YLtMrqzkfTk8zyZqz5aNCLIoBpmqqKYvUveKMx1youi2mzCnrTo6qxOJZtHoUgp9XrL/JDBhtaoI89zhV1MhoC8vqoNAvvm2pnZqn7kvxpkH6eDIsGvn6b4uR0FjL9VdyqsytQGVpRgrT+Uo5XNTNqYHrnIzIZMoNDSVIkldbCVdJ3zyhvMr9Dj16gENtEoQuN5TDlqVt+SalWNAh7BuGamIkFAkQhVxdIzitDvrdD02p1RMcJy2opIcaSud//TsnCqxFR5se9nopoq7KdXiJp5cU4Phe+QfenrP3TDj6GZUkgkhGHs0EoKkYsD7BWitC/+tS9jmtZT/kUq9nnbpMQjE4dfdyMoQOszwoM2XpOOluiyPPZ38j3dxXoS5yCsiI4PyXhiX04ZkOQ7/fazmrN7dUZ+l2vSqzAHiMyQgA0uBoeyAkMFYq8bdFHYxN9RG+K29hDx2s7zpYatpM9pIPlsIsNlIKt6OPGvZr9fCFXu3idCO7jWfCL/pHfoj98boUqBaHQXQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8205.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?eXVnNmdsTmtEbFhuc0h5YjJad2NNT2IzMVNyRkJTOGpGaVBHWDcvQVpLVG44?=
 =?utf-8?B?Rnh3aGxlcW1VTHRXc3ZMcGxBZWZ4UjhwaXovVVg2ZEplNVpZS20vUWxicS9h?=
 =?utf-8?B?czlpRzg1MFVTMi9HNUhTeTM0K0dlTFIxMFFSRFdLNXNqcC9pQVZzVWtHWUVH?=
 =?utf-8?B?REcyU3lISWJpMFVWNnlveUlPbFFYUVFYY0FkQTJPUWJLL1JJQ2Y3MGdmQnhh?=
 =?utf-8?B?R2o5cVh5ZHJ0SWJsbGlhcDZOTUlXRDRZMnYwNTJYK0VUZk90REM2Vm43MmhP?=
 =?utf-8?B?aE9CbHVCQ1lmT3NlUy9Ua0U2aVc4SE9RSzJnNEZtVThLby9zREZqNUc1STNw?=
 =?utf-8?B?c0tWRHFTTWFUUEtJUXFyTEdVbGpGWlZ4L2lIbGR1LzNGWjZlVmVwc0w3SG1U?=
 =?utf-8?B?cFVtNFdWZHB0YW11K05lRDhKVnVqNGpVVUlVTGk3TkZ3dFlFeWJ2NXJEZ1o0?=
 =?utf-8?B?L3dtVkFmR3RGYkU0RUlwaWc1S0liUGFUb2w5VlQ0dlRUYkE4LzYzVC8rSWRr?=
 =?utf-8?B?VkdFeG5HN2gvQW42VGx5N3JiSm1jY3o0S3ZONFJTbUJDTkliYmhkVTkwYk0r?=
 =?utf-8?B?SmxXSmdCODRGdExGdkVnS2w4S09vdVlGV1hzalVRbHBnWG5tcE4yVkFpYzZ6?=
 =?utf-8?B?TWN2UnZjQTZib1JiRUUxOFcvUENOcEpyWm5CMTY3S0pCSC9IVWptRFNESnow?=
 =?utf-8?B?YzI2UE84bFYvSUY0YzUwbFNpLytVeHhoV0VtMEdOK0VVN2ZBWXo2Uk4remlp?=
 =?utf-8?B?N0kzbitSQzZCaGVoRXhpb25NM3VrWXJKUzh6Ny9NZk16OExaKzlpYmZ5MWZF?=
 =?utf-8?B?MjhGN2VGWktxb3hBM0MyWmQzcXZCQzRWWVlTQitYM2RCcG05eVNjdklncTN5?=
 =?utf-8?B?Rmt6RDBVSEE3T1FLS0F6Nm45c29hckJrZSttcmg5eHVwdmd4eTU1cVRIYUVM?=
 =?utf-8?B?UTZRWVg1QlpJM3R3VHo3NTJvNWVVSmVoVWtRUWVHR1dicWN4NjVmZFJ6d05S?=
 =?utf-8?B?WWZkclNpRjdxQUJ0b1lwUGNycld4c2VmVFVzaE1mNVQ4S0ZtRFNCemlPVHk2?=
 =?utf-8?B?NjBaVVNNdkhsdDNjdCtUUlBkM0MyUGxybzc3Y1lUN2Q0VXV2ME5jdFFDZnZx?=
 =?utf-8?B?QVhOQ1MzTDdPbUhmOFhHM2F3Q3NicG9xd2p3SlI5TEEvaVZodXAzNzdJMFJF?=
 =?utf-8?B?dUtoc1RpUFVMQk5aN1pKdzRpaEdYYXo1Snczd21OQkcvdlpIWEhoOGlkNjlR?=
 =?utf-8?B?bUNXd3E3a2NNWHZnYUx1WGMwdEcyVDExT3lsMitmTWJBMTAvekpFdC8xS1hm?=
 =?utf-8?B?MldLUFBnTldYUDNpMjJpOWxEUXkxbUxidENMYk1VdEpqZURxQituQWh1SXMz?=
 =?utf-8?B?cjVaM3hsRHZneDJxdWlRd0NSL2ppdnVtdXY4UTVMR0Npd0FMa0hoMm41VnAy?=
 =?utf-8?B?SXc4RjV6R01xd24zeG55U3pZWFNqSFdVRXdTODVJOW5yYXBXV0hxbTBvVGdL?=
 =?utf-8?B?c0RwSHhKSWVtUlRZSytSVjVSMWFwZmNhTy9IaEMyNHFKdkVMYThtU01uY1Yw?=
 =?utf-8?B?VG1qeEtoUnJvM1hJU1JEdUtTTUhyRjRzMVNnRlV3K3ZjOXpxdWY1UEg3STIy?=
 =?utf-8?B?NXVGWDBXRjVBMlE4QkM0eXFGb0hNL1daajlQVllMUUx5b25uUDVWLzFRYTgx?=
 =?utf-8?B?UmNEb2hqMVErSlZ6UWJwc2FpZVAvRGhGTHQ2QTFBc1B5Y1YydnUvR3pkVjB2?=
 =?utf-8?B?SmNMb1FMVUl4eEhxTU1UN1JHZmcxMHlOZzEzb3NWQndCb2hJZVJlcHBIVWxi?=
 =?utf-8?B?clpyNGlFZ1dLUmxFRjN5eEhwVitsQzRsSTRUZXh3dDhBRGdEMGNIZ2RLYkpx?=
 =?utf-8?B?NnJRVjJGNzBkTDJONS9LQitSdlhTQVY5dUR5YnZiZU9pbTE1OTByclpDTTZG?=
 =?utf-8?B?TUNxcHlvWmoraFZSUWhLS29iWEVFdC9uWm9oY1F6S2ZvU2tBZE1TL2ErOTUy?=
 =?utf-8?B?Y2VVOEFoWUtNdjBBbEJNY2JYeHd2WFpKcGd1ZE1EZ1ZxRWhha2hsZ2ZUc05p?=
 =?utf-8?B?MExQZlNhcXd6MGxaZkFBQ1ROamwxeW9DTTU1bEY3YW10ZHdkNERVdEM3TFdw?=
 =?utf-8?B?anNvaXRCZXFjaDNzM3p5cGFHdUl0SVUrenQvSVdrN0JzZ0NtUk4vNk5SOHNS?=
 =?utf-8?B?citTRU93cjVINEpYbTBYaHhKakV4R29LT25jUVZSMXNZNWFnbkRPaXNicGcy?=
 =?utf-8?B?bmhqejR5ekEyd2hEQzRUZUpuY2NJVW9pQ0YyQkFac0ZELzBIYXkzb05uM0tE?=
 =?utf-8?B?QXlqS2JUUkhVVlFsbW5HYVN5em1hWUljbElmSTAzYXYwbno3bXJXUT09?=
X-OriginatorOrg: silabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 264992c1-f6c6-4e3c-b108-08de789a091c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8205.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 20:26:51.0485
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 54dbd822-5231-4b20-944d-6f4abcd541fb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EO4wUKKhSImK8VhxOhGThawDrEfdBwuYLs6ZLgp6uEslkTwdKWc0rpTmOqnAg6wrAeNsaX6dSpCcYbucFxKIxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8719
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDE1NiBTYWx0ZWRfXzuF7zsTIxZk5
 J45XG/fuhbZ9bIZyM+DYR+DfXQvAvOKtE4qKU3WpYlpa0As8R5B2XQDce40owslBFVSWKVN3aD9
 kULEUltZDIOIo9rlqPdwhfUm1sRIBfK5dHDuxqYUnJTZ6V9Eycdyk0rh88v34fLmTKsEuXCbi2E
 B5dFlUSTMno9UMNdun5DfJiP9VHSAXcD9wrJXbG8cnNaFnHXCErP1LWez5cB/kt+KUbBJk8FLgf
 9Y8wSsfTixYZ3VjbGpKWHSzoEB0QvzHHL8xykBkKqwxArarnvRLef5Txv8xMbVKB0Zd+i69FjML
 iCXXWBRkAAB4vIg8rhUEUUfptf1CrYv7/K5diHWdqR7z5WRAfr5Hja1UdbspUJNs5K//i6q2hwT
 LF7EtaLXOSmbV0XEkNvAotiMQhwtVRyq/o8Vc/rjI05ial6Qh/TZRHlT+KSGW7vdpbdR/vYEE+J
 dIC+L4xP9bicpUyFO9Q==
X-Authority-Analysis: v=2.4 cv=KshAGGWN c=1 sm=1 tr=0 ts=69a5f28e cx=c_pps
 a=GzbtWuAz25DTP0J0usuZ9g==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=M51BFTxLslgA:10
 a=i1IsUcr2s-wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=gIHJBl62Mt9vjvfn7G3b:22
 a=6KgOrB_2K63Cyhqxo4vW:22 a=ID6ng7r3AAAA:8 a=2AEO0YjSAAAA:8
 a=1XDySn5Ug4fX2v82s3MA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=AkheI1RvQwOzcTXhi5f4:22
X-Proofpoint-ORIG-GUID: xWBgNgX3_aVNLkEX4ldb0Bn6fLO6z1QU
X-Proofpoint-GUID: xWBgNgX3_aVNLkEX4ldb0Bn6fLO6z1QU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0 adultscore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020156
X-Spamd-Bar: ----
Message-ID-Hash: RWLS5IEX5JWJHSNXZ7QIC23SCFOYULOX
X-Message-ID-Hash: RWLS5IEX5JWJHSNXZ7QIC23SCFOYULOX
X-MailFrom: prvs=1521e20967=damien.riegel@silabs.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Silicon Labs Kernel Team <linux-devel@silabs.com>, =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH 1/2] greybus: raw: fix use-after-free on cdev close
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/RWLS5IEX5JWJHSNXZ7QIC23SCFOYULOX/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Rspamd-Queue-Id: 1B8041DFB38
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.59 / 15.00];
	DMARC_POLICY_REJECT(2.00)[silabs.com : SPF not aligned (relaxed),reject];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	R_DKIM_REJECT(1.00)[silabs.com:s=pps12202023,silabs.com:s=selector1];
	MID_CONTAINS_FROM(1.00)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[damien.riegel@silabs.com,greybus-dev-bounces@lists.linaro.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[silabs.com:-];
	NEURAL_HAM(-0.00)[-0.977];
	TAGGED_RCPT(0.00)[greybus-dev];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,lists.linaro.org:rdns,lists.linaro.org:helo,silabs.com:mid,silabs.com:email,qemu.org:url]
X-Rspamd-Action: no action

VGhpcyBhZGRyZXNzZXMgYSB1c2UtYWZ0ZXItZnJlZSBidWcgd2hlbiBhIHJhdyBidW5kbGUgaXMg
ZGlzY29ubmVjdGVkDQpidXQgaXRzIGNoYXJkZXYgaXMgc3RpbGwgb3BlbmVkIGJ5IGFuIGFwcGxp
Y2F0aW9uLiBXaGVuIHRoZSBhcHBsaWNhdGlvbg0KcmVsZWFzZXMgdGhlIGNkZXYsIGl0IGNhdXNl
cyB0aGUgZm9sbG93aW5nIHBhbmljIHdoZW4gaW5pdCBvbiBmcmVlIGlzDQplbmFibGVkIChDT05G
SUdfSU5JVF9PTl9GUkVFX0RFRkFVTFRfT049eSk6DQoNCiAgICBbICAgNzguNDUxMDYyXSByZWZj
b3VudF90OiB1bmRlcmZsb3c7IHVzZS1hZnRlci1mcmVlLg0KICAgIFsgICA3OC40NTEzNTJdIFdB
Uk5JTkc6IENQVTogMCBQSUQ6IDEzOSBhdCBsaWIvcmVmY291bnQuYzoyOCByZWZjb3VudF93YXJu
X3NhdHVyYXRlKzB4ZDAvMHgxMzANCiAgICBbICAgNzguNDUxNjk4XSBNb2R1bGVzIGxpbmtlZCBp
bjogZ2JfcmF3KEMpDQogICAgWyAgIDc4LjQ1MTg4MV0gQ1BVOiAwIFVJRDogMCBQSUQ6IDEzOSBD
b21tOiByYXdfY2hhcmRldl90ZXMgVGFpbnRlZDogRyAgICAgICAgV0MgICAgICAgICAgNi4xOC4w
LXJjNCAjMjEyIFBSRUVNUFQodm9sdW50YXJ5KQ0KICAgIFsgICA3OC40NTIzODZdIFRhaW50ZWQ6
IFtXXT1XQVJOLCBbQ109Q1JBUA0KICAgIFsgICA3OC40NTI1NjBdIEhhcmR3YXJlIG5hbWU6IFFF
TVUgU3RhbmRhcmQgUEMgKGk0NDBGWCArIFBJSVgsIDE5OTYpLCBCSU9TIHJlbC0xLjE3LjAtMC1n
YjUyY2E4NmUwOTRkLXByZWJ1aWx0LnFlbXUub3JnIDA0LzAxLzIwMTQNCiAgICBbICAgNzguNDUz
MDQ5XSBSSVA6IDAwMTA6cmVmY291bnRfd2Fybl9zYXR1cmF0ZSsweGQwLzB4MTMwDQogICAgWyAg
IDc4LjQ1MzMxMV0gQ29kZTogMGIgOTAgOTAgYzMgY2MgY2MgY2MgY2MgODAgM2QgNGYgZWMgMWQg
MDEgMDAgMGYgODUgNzUgZmYgZmYgZmYgYzYgMDUgNDIgZWMgMWQgMDEgMDEgOTAgNDggYzcgYzcg
ZTggNWIgY2IgYjQgZTggMzFmDQogICAgWyAgIDc4LjQ1Mzk1M10gUlNQOiAwMDE4OmZmZmZhYTBm
ODAyMDNlZDAgRUZMQUdTOiAwMDAxMDI4Mg0KICAgIFsgICA3OC40NTQyNTFdIFJBWDogMDAwMDAw
MDAwMDAwMDAwMCBSQlg6IDAwMDAwMDAwMDAwMDAwMDAgUkNYOiAwMDAwMDAwMDAwMDAwMDAwDQog
ICAgWyAgIDc4LjQ1NDQ3Ml0gUkRYOiAwMDAwMDAwMDAwMDAwMDAwIFJTSTogZmZmZmFhMGY4MDIw
M2Q2OCBSREk6IDAwMDAwMDAwZmZmZmRmZmYNCiAgICBbICAgNzguNDU0NjkwXSBSQlA6IDAwMDAw
MDAwMDQwZTAwMWYgUjA4OiAwMDAwMDAwMGZmZmZkZmZmIFIwOTogZmZmZmZmZmZiNTEwYzAwOA0K
ICAgIFsgICA3OC40NTQ4OTldIFIxMDogZmZmZmZmZmZiNTA1YzA2MCBSMTE6IDAwMDAwMDAwNjM2
NjY1NzIgUjEyOiBmZmZmOTM4ZGMyMTBiNDY4DQogICAgWyAgIDc4LjQ1NTI3OV0gUjEzOiBmZmZm
OTM4ZGMxZjVlMWEwIFIxNDogZmZmZjkzOGRjMTQ3MTBjMCBSMTU6IDAwMDAwMDAwMDAwMDAwMDAN
CiAgICBbICAgNzguNDU1NTQ5XSBGUzogIDAwMDA3ZjJmMjI3NDE3NDAoMDAwMCkgR1M6ZmZmZjkz
OGUxMWZiYzAwMCgwMDAwKSBrbmxHUzowMDAwMDAwMDAwMDAwMDAwDQogICAgWyAgIDc4LjQ1NTgw
Nl0gQ1M6ICAwMDEwIERTOiAwMDAwIEVTOiAwMDAwIENSMDogMDAwMDAwMDA4MDA1MDAzMw0KICAg
IFsgICA3OC40NTYxMjldIENSMjogMDAwMDdmMmYyMjhjODljMyBDUjM6IDAwMDAwMDAwMDIwZDAw
MDAgQ1I0OiAwMDAwMDAwMDAwMDAwNmYwDQogICAgWyAgIDc4LjQ1Njc4Nl0gQ2FsbCBUcmFjZToN
CiAgICBbICAgNzguNDU2OTM2XSAgPFRBU0s+DQogICAgWyAgIDc4LjQ1NzA2OV0gIGNkZXZfcHV0
KzB4MTgvMHgzMA0KICAgIFsgICA3OC40NTcyMzBdICBfX2ZwdXQrMHgyNTUvMHgyYTANCiAgICBb
ICAgNzguNDU3MzcyXSAgX194NjRfc3lzX2Nsb3NlKzB4M2QvMHg4MA0KICAgIFsgICA3OC40NTc1
NDRdICBkb19zeXNjYWxsXzY0KzB4YTQvMHgyOTANCiAgICBbICAgNzguNDU3Njk3XSAgZW50cnlf
U1lTQ0FMTF82NF9hZnRlcl9od2ZyYW1lKzB4NzcvMHg3Zg0KICAgIFsgICA3OC40NTc4ODNdIFJJ
UDogMDAzMzoweDdmMmYyMjdkMWNjNw0KICAgIFsgICA3OC40NTgwOTddIENvZGU6IDQ4IDg5IGZh
IDRjIDg5IGRmIGU4IDA4IGFlIDAwIDAwIDhiIDkzIDA4IDAzIDAwIDAwIDU5IDVlIDQ4IDgzIGY4
IGZjIDc0IDFhIDViIGMzIDBmIDFmIDg0IDAwIDAwIDAwIDAwIDAwIDQ4IDhiIDQ0Zg0KICAgIFsg
ICA3OC40NTg2OTJdIFJTUDogMDAyYjowMDAwN2ZmZmFiMzZmYjUwIEVGTEFHUzogMDAwMDAyMDIg
T1JJR19SQVg6IDAwMDAwMDAwMDAwMDAwMDMNCiAgICBbICAgNzguNDU5MTU1XSBSQVg6IGZmZmZm
ZmZmZmZmZmZmZGEgUkJYOiAwMDAwN2YyZjIyNzQxNzQwIFJDWDogMDAwMDdmMmYyMjdkMWNjNw0K
ICAgIFsgICA3OC40NTk0MDBdIFJEWDogMDAwMDAwMDAwMDAwMDAwMCBSU0k6IDAwMDAwMDAwMDAw
MDAwMDAgUkRJOiAwMDAwMDAwMDAwMDAwMDAzDQogICAgWyAgIDc4LjQ1OTY0OF0gUkJQOiAwMDAw
N2ZmZmFiMzZmYmE4IFIwODogMDAwMDAwMDAwMDAwMDAwMCBSMDk6IDAwMDAwMDAwMDAwMDAwMDAN
CiAgICBbICAgNzguNDU5ODk5XSBSMTA6IDAwMDAwMDAwMDAwMDAwMDAgUjExOiAwMDAwMDAwMDAw
MDAwMjAyIFIxMjogMDAwMDU1ODI5ODQyNzEyOA0KICAgIFsgICA3OC40NjAyMTJdIFIxMzogMDAw
MDdmMmYyMjc0MTZkMCBSMTQ6IDAwMDA1NTgyYzcyY2YzMjAgUjE1OiAwMDAwNTU4MmM3MmNmMzIw
DQogICAgWyAgIDc4LjQ2MDQ3MF0gIDwvVEFTSz4NCiAgICBbICAgNzguNDYwNTcxXSAtLS1bIGVu
ZCB0cmFjZSAwMDAwMDAwMDAwMDAwMDAwIF0tLS0NCg0KVGhlIGNkZXYgaXMgY29udGFpbmVkIGlu
IHRoZSAiZ2JfcmF3IiBzdHJ1Y3R1cmUsIHdoaWNoIGlzIGZyZWVkIGluIHRoZQ0KZGlzY29ubmVj
dCBvcGVyYXRpb24uIFdoZW4gdGhlIGNkZXYgaXMgcmVsZWFzZWQgYXQgYSBsYXRlciB0aW1lLA0K
Y2Rldl9wdXQgZ2V0cyBhbiBhZGRyZXNzIHRoYXQgcG9pbnRzIHRvIGZyZWVkIG1lbW9yeS4NCg0K
VG8gZml4IHRoaXMgdXNlLWFmdGVyLWZyZWUsIGNvbnZlcnQgdGhlIHN0cnVjdCBkZXZpY2UgZnJv
bSBhIHBvaW50ZXIgdG8NCmJlaW5nIGVtYmVkZGVkLCB0aGF0IG1ha2VzIHRoZSBsaWZldGltZSBv
ZiB0aGUgY2RldiBhbmQgb2YgdGhpcyBkZXZpY2UNCnRoZSBzYW1lLiBUaGVuLCB1c2UgY2Rldl9k
ZXZpY2VfYWRkLCB3aGljaCBndWFyYW50ZWVzIHRoYXQgdGhlIGRldmljZQ0Kd29uJ3QgYmUgcmVs
ZWFzZWQgdW50aWwgYWxsIHJlZmVyZW5jZXMgdG8gdGhlIGNkZXYgYXJlIG5vdCByZWxlYXNlZC4N
CkZpbmFsbHksIGRlbGVnYXRlIHRoZSBmcmVlaW5nIG9mIHRoZSBzdHJ1Y3R1cmUgdG8gdGhlIGRl
dmljZSByZWxlYXNlDQpmdW5jdGlvbiwgaW5zdGVhZCBvZiBmcmVlaW5nIGltbWVkaWF0ZWx5IGlu
IHRoZSBkaXNjb25uZWN0IGNhbGxiYWNrLg0KDQpGaXhlczogZTgwNmM3ZmI4ZTliICgiZ3JleWJ1
czogcmF3OiBhZGQgcmF3IGdyZXlidXMga2VybmVsIGRyaXZlciIpDQpTaWduZWQtb2ZmLWJ5OiBE
YW1pZW4gUmnDqWdlbCA8ZGFtaWVuLnJpZWdlbEBzaWxhYnMuY29tPg0KLS0tDQogZHJpdmVycy9z
dGFnaW5nL2dyZXlidXMvcmF3LmMgfCA0OSArKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0t
LS0tLQ0KIDEgZmlsZSBjaGFuZ2VkLCAyNiBpbnNlcnRpb25zKCspLCAyMyBkZWxldGlvbnMoLSkN
Cg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL3Jhdy5jIGIvZHJpdmVycy9z
dGFnaW5nL2dyZXlidXMvcmF3LmMNCmluZGV4IDcxZGU2Nzc2NzM5Li5iOTIyMTRmOTdlMyAxMDA2
NDQNCi0tLSBhL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL3Jhdy5jDQorKysgYi9kcml2ZXJzL3N0
YWdpbmcvZ3JleWJ1cy9yYXcuYw0KQEAgLTIxLDkgKzIxLDggQEAgc3RydWN0IGdiX3JhdyB7DQog
CXN0cnVjdCBsaXN0X2hlYWQgbGlzdDsNCiAJaW50IGxpc3RfZGF0YTsNCiAJc3RydWN0IG11dGV4
IGxpc3RfbG9jazsNCi0JZGV2X3QgZGV2Ow0KIAlzdHJ1Y3QgY2RldiBjZGV2Ow0KLQlzdHJ1Y3Qg
ZGV2aWNlICpkZXZpY2U7DQorCXN0cnVjdCBkZXZpY2UgZGV2Ow0KIH07DQogDQogc3RydWN0IHJh
d19kYXRhIHsNCkBAIC0xNDgsNiArMTQ3LDEzIEBAIHN0YXRpYyBpbnQgZ2JfcmF3X3NlbmQoc3Ry
dWN0IGdiX3JhdyAqcmF3LCB1MzIgbGVuLCBjb25zdCBjaGFyIF9fdXNlciAqZGF0YSkNCiAJcmV0
dXJuIHJldHZhbDsNCiB9DQogDQorc3RhdGljIHZvaWQgcmF3X2Rldl9yZWxlYXNlKHN0cnVjdCBk
ZXZpY2UgKmRldikNCit7DQorCXN0cnVjdCBnYl9yYXcgKnJhdyA9IGRldl9nZXRfZHJ2ZGF0YShk
ZXYpOw0KKw0KKwlrZnJlZShyYXcpOw0KK30NCisNCiBzdGF0aWMgaW50IGdiX3Jhd19wcm9iZShz
dHJ1Y3QgZ2JfYnVuZGxlICpidW5kbGUsDQogCQkJY29uc3Qgc3RydWN0IGdyZXlidXNfYnVuZGxl
X2lkICppZCkNCiB7DQpAQCAtMTY4LDExICsxNzQsMTQgQEAgc3RhdGljIGludCBnYl9yYXdfcHJv
YmUoc3RydWN0IGdiX2J1bmRsZSAqYnVuZGxlLA0KIAlpZiAoIXJhdykNCiAJCXJldHVybiAtRU5P
TUVNOw0KIA0KKwlkZXZpY2VfaW5pdGlhbGl6ZSgmcmF3LT5kZXYpOw0KKwlkZXZfc2V0X2RydmRh
dGEoJnJhdy0+ZGV2LCByYXcpOw0KKw0KIAljb25uZWN0aW9uID0gZ2JfY29ubmVjdGlvbl9jcmVh
dGUoYnVuZGxlLCBsZTE2X3RvX2NwdShjcG9ydF9kZXNjLT5pZCksDQogCQkJCQkgIGdiX3Jhd19y
ZXF1ZXN0X2hhbmRsZXIpOw0KIAlpZiAoSVNfRVJSKGNvbm5lY3Rpb24pKSB7DQogCQlyZXR2YWwg
PSBQVFJfRVJSKGNvbm5lY3Rpb24pOw0KLQkJZ290byBlcnJvcl9mcmVlOw0KKwkJZ290byBlcnJv
cl9wdXRfZGV2aWNlOw0KIAl9DQogDQogCUlOSVRfTElTVF9IRUFEKCZyYXctPmxpc3QpOw0KQEAg
LTE4NywyOSArMTk2LDI2IEBAIHN0YXRpYyBpbnQgZ2JfcmF3X3Byb2JlKHN0cnVjdCBnYl9idW5k
bGUgKmJ1bmRsZSwNCiAJCWdvdG8gZXJyb3JfY29ubmVjdGlvbl9kZXN0cm95Ow0KIAl9DQogDQot
CXJhdy0+ZGV2ID0gTUtERVYocmF3X21ham9yLCBtaW5vcik7DQorCXJhdy0+ZGV2LmRldnQgPSBN
S0RFVihyYXdfbWFqb3IsIG1pbm9yKTsNCisJcmF3LT5kZXYuY2xhc3MgPSAmcmF3X2NsYXNzOw0K
KwlyYXctPmRldi5wYXJlbnQgPSAmY29ubmVjdGlvbi0+YnVuZGxlLT5kZXY7DQorCXJhdy0+ZGV2
LnJlbGVhc2UgPSByYXdfZGV2X3JlbGVhc2U7DQorCXJldHZhbCA9IGRldl9zZXRfbmFtZSgmcmF3
LT5kZXYsICJnYiFyYXclZCIsIG1pbm9yKTsNCisJaWYgKHJldHZhbCkNCisJCWdvdG8gZXJyb3Jf
cmVtb3ZlX2lkYTsNCisNCiAJY2Rldl9pbml0KCZyYXctPmNkZXYsICZyYXdfZm9wcyk7DQogDQog
CXJldHZhbCA9IGdiX2Nvbm5lY3Rpb25fZW5hYmxlKGNvbm5lY3Rpb24pOw0KIAlpZiAocmV0dmFs
KQ0KIAkJZ290byBlcnJvcl9yZW1vdmVfaWRhOw0KIA0KLQlyZXR2YWwgPSBjZGV2X2FkZCgmcmF3
LT5jZGV2LCByYXctPmRldiwgMSk7DQorCXJldHZhbCA9IGNkZXZfZGV2aWNlX2FkZCgmcmF3LT5j
ZGV2LCAmcmF3LT5kZXYpOw0KIAlpZiAocmV0dmFsKQ0KIAkJZ290byBlcnJvcl9jb25uZWN0aW9u
X2Rpc2FibGU7DQogDQotCXJhdy0+ZGV2aWNlID0gZGV2aWNlX2NyZWF0ZSgmcmF3X2NsYXNzLCAm
Y29ubmVjdGlvbi0+YnVuZGxlLT5kZXYsDQotCQkJCSAgICByYXctPmRldiwgcmF3LCAiZ2IhcmF3
JWQiLCBtaW5vcik7DQotCWlmIChJU19FUlIocmF3LT5kZXZpY2UpKSB7DQotCQlyZXR2YWwgPSBQ
VFJfRVJSKHJhdy0+ZGV2aWNlKTsNCi0JCWdvdG8gZXJyb3JfZGVsX2NkZXY7DQotCX0NCi0NCiAJ
cmV0dXJuIDA7DQogDQotZXJyb3JfZGVsX2NkZXY6DQotCWNkZXZfZGVsKCZyYXctPmNkZXYpOw0K
LQ0KIGVycm9yX2Nvbm5lY3Rpb25fZGlzYWJsZToNCiAJZ2JfY29ubmVjdGlvbl9kaXNhYmxlKGNv
bm5lY3Rpb24pOw0KIA0KQEAgLTIxOSw4ICsyMjUsOCBAQCBzdGF0aWMgaW50IGdiX3Jhd19wcm9i
ZShzdHJ1Y3QgZ2JfYnVuZGxlICpidW5kbGUsDQogZXJyb3JfY29ubmVjdGlvbl9kZXN0cm95Og0K
IAlnYl9jb25uZWN0aW9uX2Rlc3Ryb3koY29ubmVjdGlvbik7DQogDQotZXJyb3JfZnJlZToNCi0J
a2ZyZWUocmF3KTsNCitlcnJvcl9wdXRfZGV2aWNlOg0KKwlwdXRfZGV2aWNlKCZyYXctPmRldik7
DQogCXJldHVybiByZXR2YWw7DQogfQ0KIA0KQEAgLTIzMSwxMSArMjM3LDkgQEAgc3RhdGljIHZv
aWQgZ2JfcmF3X2Rpc2Nvbm5lY3Qoc3RydWN0IGdiX2J1bmRsZSAqYnVuZGxlKQ0KIAlzdHJ1Y3Qg
cmF3X2RhdGEgKnJhd19kYXRhOw0KIAlzdHJ1Y3QgcmF3X2RhdGEgKnRlbXA7DQogDQotCS8vIEZJ
WE1FIC0gaGFuZGxlIHJlbW92aW5nIGEgY29ubmVjdGlvbiB3aGVuIHRoZSBjaGFyIGRldmljZSBu
b2RlIGlzIG9wZW4uDQotCWRldmljZV9kZXN0cm95KCZyYXdfY2xhc3MsIHJhdy0+ZGV2KTsNCi0J
Y2Rldl9kZWwoJnJhdy0+Y2Rldik7DQorCWNkZXZfZGV2aWNlX2RlbCgmcmF3LT5jZGV2LCAmcmF3
LT5kZXYpOw0KIAlnYl9jb25uZWN0aW9uX2Rpc2FibGUoY29ubmVjdGlvbik7DQotCWlkYV9mcmVl
KCZtaW5vcnMsIE1JTk9SKHJhdy0+ZGV2KSk7DQorCWlkYV9mcmVlKCZtaW5vcnMsIE1JTk9SKHJh
dy0+ZGV2LmRldnQpKTsNCiAJZ2JfY29ubmVjdGlvbl9kZXN0cm95KGNvbm5lY3Rpb24pOw0KIA0K
IAltdXRleF9sb2NrKCZyYXctPmxpc3RfbG9jayk7DQpAQCAtMjQ0LDggKzI0OCw3IEBAIHN0YXRp
YyB2b2lkIGdiX3Jhd19kaXNjb25uZWN0KHN0cnVjdCBnYl9idW5kbGUgKmJ1bmRsZSkNCiAJCWtm
cmVlKHJhd19kYXRhKTsNCiAJfQ0KIAltdXRleF91bmxvY2soJnJhdy0+bGlzdF9sb2NrKTsNCi0N
Ci0Ja2ZyZWUocmF3KTsNCisJcHV0X2RldmljZSgmcmF3LT5kZXYpOw0KIH0NCiANCiAvKg0KLS0g
DQoyLjUyLjANCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZ3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0IC0tIGdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5v
cmcKVG8gdW5zdWJzY3JpYmUgc2VuZCBhbiBlbWFpbCB0byBncmV5YnVzLWRldi1sZWF2ZUBsaXN0
cy5saW5hcm8ub3JnCg==
