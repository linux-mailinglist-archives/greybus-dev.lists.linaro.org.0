Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MPNULTf0pWkxIQAAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Mon, 02 Mar 2026 21:33:59 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AECB1DFB37
	for <lists+greybus-dev@lfdr.de>; Mon, 02 Mar 2026 21:33:59 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 8062F401BB
	for <lists+greybus-dev@lfdr.de>; Mon,  2 Mar 2026 20:27:08 +0000 (UTC)
Received: from mx0a-0024c301.pphosted.com (mx0a-0024c301.pphosted.com [148.163.149.154])
	by lists.linaro.org (Postfix) with ESMTPS id CB7304016D
	for <greybus-dev@lists.linaro.org>; Mon,  2 Mar 2026 20:27:05 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=silabs.com header.s=pps12202023 header.b=F9GGVsdq;
	dkim=pass header.d=silabs.com header.s=selector1 header.b=Zo9AalsA;
	dmarc=pass (policy=reject) header.from=silabs.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1");
	spf=pass (lists.linaro.org: domain of "prvs=1521e20967=damien.riegel@silabs.com" designates 148.163.149.154 as permitted sender) smtp.mailfrom="prvs=1521e20967=damien.riegel@silabs.com"
Received: from pps.filterd (m0101743.ppops.net [127.0.0.1])
	by mx0a-0024c301.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 622F62e34059130;
	Mon, 2 Mar 2026 14:26:55 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps12202023;
	 bh=wV7sGcxKH1lfvWTQZO0bG+DVrrTOULUSuk5CvmstbIk=; b=F9GGVsdqCmis
	0PwJJGm4KPbUoJmSdawSzvuQ+A7LeK6dDZbn1AGoVC2A3/3z7oRCW0gV5Oh2OYft
	yLQ25NETkfUtnqyng2CQqRrXQQxPQry6lyCPPKXd/Y3T2pj3YU8trV/IL5cDEw1K
	aqPldHjOFkcZxtqRPlOTuC6VDf3K5uuiSbRSM5z4fCMzgn7szBs+GMapFPlVADCM
	CXz2R39GWjiIRdfsZzUp8lU22seWz4zWFu/p5o7oHAf6utyFXlUbkfYbHjGOIx6I
	aMlRjZJem4OpD4MJdMlVW7NAZWvRk2dJiJzwqncsN7wNLJRYAPB8e/Vpl07aCqPT
	vaFWybCeag==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11021085.outbound.protection.outlook.com [52.101.52.85])
	by mx0a-0024c301.pphosted.com (PPS) with ESMTPS id 4ckwj940hy-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 02 Mar 2026 14:26:55 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Oit6EKXUUL93YLon74sPkJVp+Jml8PeIS57bjb+Bgbm6kQYpX1thLcIkOG5CWR4lK/OHavRQELcBJpS5S/5BzUsZJNm+DNy62bMH1QB0T/3XVOfliWxo1dmoK6huayHnU7TViLjsNOzxQS3NBamRta6a1YFOsVZ8hoYdXfIZ2qpOGzBKJQR2ijBMv69I4oKIo21zh7QxI9eWcZVGfcbl4RBtl8EFSPkVXL6WLuBl1MBcWp+if4d59YG4qC+YeZgfbjXmT5VaOJ9et1fzMQA2tD8gNiq3meSof6YA66IjHBXsudn9XAJOrdhEig4WwqCzB7pUf7DaCtXRfjGf7gBlXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wV7sGcxKH1lfvWTQZO0bG+DVrrTOULUSuk5CvmstbIk=;
 b=Z74miSTi8CSNangrVZYcDYkp54VV8DrBax5jVrNIqXyn7fcf69eR18NV13rj544CVpfLSL2PO5QdzBJcGCqaKW/DUhygaPG8aqAKViNlSN8q+1mrhNxyghEgvL34zxHl6DIki+XMetLK534nKQfliztjr9Yq62hTFsxE3FtHmidjeW2NFod6rV1/yFTxTHTZgknyB5Ncd8sD1kuFa4jTNzv6d26LlutHRi5rIUCcOlzx+a/CdQcqBoR1Vef2xqYMq7TVbPzU1EQNuXJoeeKXGx5ACl2ZNMzzrZJVuQjx11u1E5IRFpj6HKRWMiMZ7iHT2RYGgZEA2In4IKFeTg2RQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silabs.com; dmarc=pass action=none header.from=silabs.com;
 dkim=pass header.d=silabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wV7sGcxKH1lfvWTQZO0bG+DVrrTOULUSuk5CvmstbIk=;
 b=Zo9AalsAHlejIkBSQgNRZPbEYhsN5OUycC/B4tHED+HcD7rJB43stEQfPv6e90i7u2dexk9D1jlOZWdLrAyrr8E79jgIHj/lwFlaZC3j0sAPFpg5aHweYNcjm9y+sBxRu0U/uBjKEOj/gM0RBnlV3wC4VyXP1Ng42GOXI2tRNnc=
Received: from DS0PR11MB8205.namprd11.prod.outlook.com (2603:10b6:8:162::17)
 by DS0PR11MB8719.namprd11.prod.outlook.com (2603:10b6:8:1a8::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.20; Mon, 2 Mar
 2026 20:26:52 +0000
Received: from DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::2de6:bc88:2af7:3583]) by DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::2de6:bc88:2af7:3583%3]) with mapi id 15.20.9654.020; Mon, 2 Mar 2026
 20:26:52 +0000
From: =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
To: greybus-dev@lists.linaro.org, Johan Hovold <johan@kernel.org>,
        Alex Elder <elder@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org
Date: Mon,  2 Mar 2026 15:26:38 -0500
Message-ID: <20260302202638.31303-2-damien.riegel@silabs.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260302202638.31303-1-damien.riegel@silabs.com>
References: <20260302202638.31303-1-damien.riegel@silabs.com>
X-ClientProxiedBy: YQZPR01CA0077.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:84::14) To DS0PR11MB8205.namprd11.prod.outlook.com
 (2603:10b6:8:162::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8205:EE_|DS0PR11MB8719:EE_
X-MS-Office365-Filtering-Correlation-Id: 49277009-31e8-4603-62b1-08de789a09f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	lzkONk9QHNwEPPtI7HwEcFO1kw8lBZ+oGd3uzWLPnfxlIhk6tjlMGba2cpM931xYTGxiN1In8UOqLVA2yNQAq/y1eWbGdwYZpg7i4NCMAJYgRV0JxVbinEh7JN35863cDSMKL5g6KFKsCRjXAsw4YdF9uakr5wa/NtUU4UGJTm/f5tyZ+AINAxduH9Wp8wMwzwA2tosf1fjTsPQ8OBWAiyxZASKEejIusqvkNMjg4lAoC8VBRKst/U+XYiIv6a6K4dZGPnr5ssMpZMdaAiXsUMLVtJtG4K6lcDmyjk9SMvT6R+ef+955VlFjaR1VlOO/lsUakK5lP9s+30CxLqB0D7GP80jTkoeOlFpAQ4o2S7r+W0tsA3yL3ue8tg+H/3wjaAAGU8PWs4mpS+ts0QNjOGoo6kRjEFG0Pu36KJLr2c57FKbJ0b9SpDhWVDg1GTcjaoyGSVBGlWnxzYj65SlwU2cxLUIdcrwAQX1j69H2fhvFTiKkbYBsjVsJEp1nadZq5TBFC5h4+9kto4hBCBp8e5j6diz1uNf43M5KsQv0oQk1Mz2VQbbVvsB4tXz6bEwxr9gQcmsbjxjgCjNL75alSLFaGB7sInekXuz1wcJj4BuTESIJlP9GCxIbA4t5ddmlt61qrU7I3svTOxWyfb06jEjyHl0vas6DAKAyEqMdzA191sAcYfbWKf/jqJMPQH+6fo+t3rsN6CJJqzKz000JoxCks6D2ndsmXKQOCyztBJ0iqUrMHl5LzW+KUqVmi0Kr2WbuVxOB8coNfUrRlA5Ax/jvnrLSE829dqdbVrvnuAA=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8205.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?OWR2d28xWU04UFBGRXVHK09FRDJxTXdhSHZJQWhweEticGlSWUtCUVhIeWZ3?=
 =?utf-8?B?ZWN5eng2WXE0RUN6QTBxOTJ1bnZQV3lDWnZvd1lQNTFUNDhUdGRONUszYzNi?=
 =?utf-8?B?ZUJIWHdLNWdpWmlOb0pieWc2M2xQM2w1dmMvUE1RUUJBSW9NM1BTN0Z5ODlh?=
 =?utf-8?B?NmxRbEJEZmIxajF2RnJTTzhTclhwcEhRUCtzdzRjN3hxRnY3VzFqMDE0VW5n?=
 =?utf-8?B?emlpUVVDTllINVJmcU04NE9IVjIzeFdoZ1RUbW9Hb0JHV04rRkgwVzJVdVJo?=
 =?utf-8?B?cWI1TWEzNkFTZlVJaTU3Q1VyZ0l2MkNSYi90YzYzOTBpZDJWYlRuUjIvZ0Rj?=
 =?utf-8?B?eE9ya1U4M1hhaFB0NmVBYlB0Y1dCNlpiRlNMaEZvL3hsNlY4V1dxQUQ0STBR?=
 =?utf-8?B?MEVQcVh6WklmL1RhSHViV3M0aWFpSXBzbmNUSkprWlZLL1NUOTlmL00wU09x?=
 =?utf-8?B?bSthOTIwWlYvOGxnUEtveHJOdzZoVTB5VG0yZTI3SWpyRU9xVXc4Y3QvaVBw?=
 =?utf-8?B?dE12cFFyakNtYXkweldhZjQxdURHRGxjbEsyV3JKNS9OYlFEYXVmYWNDYU1Y?=
 =?utf-8?B?OGVXdWFkZXRoVmN5RHkvVWJMa1JZR0RnWEZpR2VpRG15Nm9zL3prS3lLUk1Y?=
 =?utf-8?B?RlhOcDlDc0hxSmtjSWRlVGQ2SEIwamZJdGxVYnB1K0t3WlFqVHZYL2g5OXlj?=
 =?utf-8?B?UXpuOUpqYTNxbFNhYTBTUGpQb0JUaTRBUXhlRkYxRTFSSXllTnpEck5vY2pQ?=
 =?utf-8?B?bDFJSHBhS2dkWDZJeEtLeDJZMUVRWXZUeC9scjVHVGFGd2h3WUFrc2o4bllW?=
 =?utf-8?B?RE1Mc2dnS2E4dTE3K1VhV3A3RXJEVlZzMUMyYmgzMWs4VFZoMjNHaXQ4b3U5?=
 =?utf-8?B?RzZvL2Z3M2xGM2ZLM2tnbHFWS2FtOFdLQmFuUVlTUWJteUNMQ2hqUmpjM3NC?=
 =?utf-8?B?NHVPc0t5OW5EWDdIUW1CWTk2dk81bEJCRldHTHZSWEp4UFhpSmgveGZrZEg3?=
 =?utf-8?B?TGdoTDMwTFoxQTIySTB0WVBHZGUyWURaazVTa3dTcWt2OE05blZyWnhMZlZz?=
 =?utf-8?B?OWhHYXg2dWR6SlpJeGhGc0NLcmQ0OHlGUUNwZnZuaXhxWE0wamZndGVyVG4v?=
 =?utf-8?B?ZTc4Ulp0SUYrTjJYbDB0YVJla0pZOC9LL0t6ZVJSQitBdGNzbFN5SENqT2RD?=
 =?utf-8?B?MXc4VVdqYmxNOFArcTlJUXVyT2E2eGVhUjVMbFNMdUp5WUVueGg2and4Vms1?=
 =?utf-8?B?ZjFRT3BMcTU0eTJwZ1Z4ZUFPSDQ3djFwTk5iRXN1dXhlSlk4NDhqdkVKcjZN?=
 =?utf-8?B?YmYveXpwQzlHY0ZLQWRjWEQycFFuR1ZxTDBMcnkwRlh6VnRUV2JPaGF0VlYx?=
 =?utf-8?B?QjVGNk1nMlFBTEgrNWdqd2VmRndQWjNGa21GS3d2TXZpUXVOb2RSVk9ndW5u?=
 =?utf-8?B?blh5cDR4a2VxamUxR1ZWaUZXTExFNmVxTjJ5VFFud2R3QnVob1VDS3VXL3gy?=
 =?utf-8?B?bDNYd3FPM3c3UjNmNFJNOFNxKzl5UGtwaFBWY3hxMjB5Z0xuUllpbXZvNVpv?=
 =?utf-8?B?enJkN2dSQ1h2T3hTWUN1clRaOFNrNmdPaGdQV1B3SHdPT0NJeHUvOGpqbXNh?=
 =?utf-8?B?QkFvSGlQS2FROGExR1RGNFVqdjF3UEJMYWtYWThEY2NkYkpnSWxoc0xkSXBo?=
 =?utf-8?B?TWtvbW9qOHdaN1pJTnhzVUgweFIvTDdOKzN3cFRubS9QL0pqbTZMdHNuZjVM?=
 =?utf-8?B?aytodm5jL2dOdjRVaFgvNklIYkMzTnMzYUUvcjUwdUtLNlhVeUw4WHJ4R3Zy?=
 =?utf-8?B?RWFWWWx0eENRMW4zWVhuZ2Fsa08wbEgzWVA0NjFIRFRXQkp0cWRwU3pRS1VT?=
 =?utf-8?B?N29RdS9Za09BT0Y0ODdOZERJOVZCRWVHM2NmNkNpbUcyTTNnSkNyZHRBZEc2?=
 =?utf-8?B?U1RMbmJYaVc0eDJMTFV5NVdrVEEyWlgyMkhOc1kvODRSYmRjRTltS2JhS2Vq?=
 =?utf-8?B?eGpqOExIN1BqYk9lUXhOa1dmQlBhVnJ4VUlzL0kwaEdoUVFiL2xTS3JXdkRI?=
 =?utf-8?B?dzBUN09yaW5tY2pzeWNaa0ltSXY0NHdGT0dpOXhPZytEcXhwMTRLd2FGL1pn?=
 =?utf-8?B?N2ZXR1lKTnpoVEpTY3ZEN0s1WTBmdC9jbTlBWnBmdklpWkZML3QrbGR0SFRN?=
 =?utf-8?B?TVI5bFJRUVQ5MTNsbXI3d1Q2K0svK0pqQk50WXZrT1JWQlpOMkhxenZwdU1S?=
 =?utf-8?B?Ym4vMHRmdzdTODNhei9aY0RuMDhSNGtqWkFBNUlmSENOU1FRTFFBbld6cGkw?=
 =?utf-8?B?K2tVSW4xWnZXa3JiakpBVzhPMEhjeitGSWFpUFB0R1E2ZCtkUms0dz09?=
X-OriginatorOrg: silabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49277009-31e8-4603-62b1-08de789a09f8
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8205.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 20:26:52.2931
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 54dbd822-5231-4b20-944d-6f4abcd541fb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 94jqvpuK3fu24dvJHn94FmnBlQH3FJQwRtRDCzruo3ZNmBRLNVn52IKuWlRYj/xwqEIhbRbCxwpOiYH1dU3t4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8719
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDE1NiBTYWx0ZWRfX45QRqeyVarRB
 hMGUsy83gUAfQSBbKNe9bC3zi7jARUlffDHLxG/jiUH9SsoPwgrAHsUZ6y5XFjYQ89epy5Wxrfg
 9UhyULmIS5kCq01edJpWH6dmSXwnkMhi7fowvpltg47xwtPs6CJV98F7pfXws7tv+R+oZxZnDv+
 UVJ1kd/+2cQ686QMgu4BpGslzH/+rUx9W11jJnsP+zkSCejrMWjT7hUHCg346ULNjk0caKjPoDH
 bRJK55dvN0dc24L5EOFGqBR9XFS7CDrToX4CiWRkn9UqkTU1+uG3SzIqdTIkv5g6sJpS76DM+RJ
 0nyDcwd8dL8viU49/i3NV2unl2l76GMegFEvG9OxCji7RH9WMuUSvmSSDeFDwQ/fOqUaQg2Mocu
 CQ0zUKNMAHZJdj178g1Z7gFhp88eT1ZFRVC/9NG7P01AciTTDfofNei6RjgFVHCQ/Ju6FKiBADl
 1BXopyJ53SJS/Tn9UAA==
X-Authority-Analysis: v=2.4 cv=KshAGGWN c=1 sm=1 tr=0 ts=69a5f28f cx=c_pps
 a=GzbtWuAz25DTP0J0usuZ9g==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=M51BFTxLslgA:10
 a=i1IsUcr2s-wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=gIHJBl62Mt9vjvfn7G3b:22
 a=6KgOrB_2K63Cyhqxo4vW:22 a=ID6ng7r3AAAA:8 a=2AEO0YjSAAAA:8
 a=cuv1uKRaxINStOyNfHoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=AkheI1RvQwOzcTXhi5f4:22
X-Proofpoint-ORIG-GUID: bXuCIWU9SroGJoUatyqrkpB6jFtBKO_8
X-Proofpoint-GUID: bXuCIWU9SroGJoUatyqrkpB6jFtBKO_8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0 adultscore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020156
X-Spamd-Bar: ----
Message-ID-Hash: CLENQUHSCBJZR77UZZD5TEZCSYBLJRB5
X-Message-ID-Hash: CLENQUHSCBJZR77UZZD5TEZCSYBLJRB5
X-MailFrom: prvs=1521e20967=damien.riegel@silabs.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Silicon Labs Kernel Team <linux-devel@silabs.com>, =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH 2/2] greybus: raw: fix use-after-free if write is called after disconnect
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/CLENQUHSCBJZR77UZZD5TEZCSYBLJRB5/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Rspamd-Queue-Id: 1AECB1DFB37
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
	GREYLIST(0.00)[pass,body];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[damien.riegel@silabs.com,greybus-dev-bounces@lists.linaro.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[silabs.com:-];
	NEURAL_HAM(-0.00)[-0.979];
	TAGGED_RCPT(0.00)[greybus-dev];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,lists.linaro.org:rdns,lists.linaro.org:helo,silabs.com:mid,silabs.com:email,qemu.org:url]
X-Rspamd-Action: no action

SWYgYSB1c2VyIHdyaXRlcyB0byB0aGUgY2hhcmRldiBhZnRlciBkaXNjb25uZWN0IGhhcyBiZWVu
IGNhbGxlZCwgdGhlDQprZXJuZWwgcGFuaWNzIHdpdGggdGhlIGZvbGxvd2luZyB0cmFjZSAod2l0
aA0KQ09ORklHX0lOSVRfT05fRlJFRV9ERUZBVUxUX09OPXkpOg0KDQogICAgWyAgIDgzLjgyODcy
Nl0gQlVHOiBrZXJuZWwgTlVMTCBwb2ludGVyIGRlcmVmZXJlbmNlLCBhZGRyZXNzOiAwMDAwMDAw
MDAwMDAwMjE4DQogICAgWyAgIDgzLjgyOTI4OF0gI1BGOiBzdXBlcnZpc29yIHJlYWQgYWNjZXNz
IGluIGtlcm5lbCBtb2RlDQogICAgWyAgIDgzLjgyOTUyOF0gI1BGOiBlcnJvcl9jb2RlKDB4MDAw
MCkgLSBub3QtcHJlc2VudCBwYWdlDQogICAgWyAgIDgzLjgyOTgyOF0gUEdEIDAgUDREIDANCiAg
ICBbICAgODMuODMwMTI2XSBPb3BzOiBPb3BzOiAwMDAwIFsjMV0gU01QIE5PUFRJDQogICAgWyAg
IDgzLjgzMDc1M10gQ1BVOiAwIFVJRDogMCBQSUQ6IDE0MCBDb21tOiByYXdfY2hhcmRldl90ZXMg
VGFpbnRlZDogRyAgICAgICAgIEMgICAgICAgICAgNi4xOC4wLXJjNCAjMjEyIFBSRUVNUFQodm9s
dW50YXJ5KQ0KICAgIFsgICA4My44MzEyNjBdIFRhaW50ZWQ6IFtDXT1DUkFQDQogICAgWyAgIDgz
LjgzMTQyNl0gSGFyZHdhcmUgbmFtZTogUUVNVSBTdGFuZGFyZCBQQyAoaTQ0MEZYICsgUElJWCwg
MTk5NiksIEJJT1MgcmVsLTEuMTcuMC0wLWdiNTJjYTg2ZTA5NGQtcHJlYnVpbHQucWVtdS5vcmcg
MDQvMDEvMjAxNA0KICAgIFsgICA4My44MzE5MTJdIFJJUDogMDAxMDpnYl9vcGVyYXRpb25fbWVz
c2FnZV9hbGxvYysweDE0LzB4YzANCiAgICBbICAgODMuODMyMzY2XSBDb2RlOiAwMCAwMCAwMCAw
MCA2NiA5MCA5MCA5MCA5MCA5MCA5MCA5MCA5MCA5MCA5MCA5MCA5MCA5MCA5MCA5MCA5MCA5MCAw
ZiAxZiA0NCAwMCAwMCA0MSA1NiA0YyA4ZCA3MiAwOCA0MSA1NSA0MSA4OSBjZDENCiAgICBbICAg
ODMuODMyOTc5XSBSU1A6IDAwMTg6ZmZmZmI3M2YwMDI3YmQ1OCBFRkxBR1M6IDAwMDEwMjg2DQog
ICAgWyAgIDgzLjgzMzI0N10gUkFYOiBmZmZmYTQ0NzQxZjcyMzAwIFJCWDogZmZmZmE0NDc0MWY3
MjMwMCBSQ1g6IDAwMDAwMDAwMDAwMDBjYzANCiAgICBbICAgODMuODMzNTEzXSBSRFg6IDAwMDAw
MDAwMDAwMDAwMGEgUlNJOiAwMDAwMDAwMDAwMDAwMDAyIFJESTogMDAwMDAwMDAwMDAwMDAwMA0K
ICAgIFsgICA4My44MzM3MzJdIFJCUDogMDAwMDAwMDAwMDAwMGNjMCBSMDg6IDAwMDAwMDAwMDAw
MDAwMDAgUjA5OiAwMDAwMDAwMDAwMDAwMDAwDQogICAgWyAgIDgzLjgzNDA0NF0gUjEwOiBmZmZm
YTQ0NzQxZjcyMzAwIFIxMTogMDAwMDAwMDAwMDAwMDAwMCBSMTI6IDAwMDAwMDAwMDAwMDAwMDIN
CiAgICBbICAgODMuODM0MjY3XSBSMTM6IDAwMDAwMDAwMDAwMDBjYzAgUjE0OiAwMDAwMDAwMDAw
MDAwMDEyIFIxNTogMDAwMDAwMDAwMDAwMDAwMA0KICAgIFsgICA4My44MzQ1MzNdIEZTOiAgMDAw
MDdmZWFkNzg1OTc0MCgwMDAwKSBHUzpmZmZmYTQ0N2EzMWJjMDAwKDAwMDApIGtubEdTOjAwMDAw
MDAwMDAwMDAwMDANCiAgICBbICAgODMuODM0Nzc2XSBDUzogIDAwMTAgRFM6IDAwMDAgRVM6IDAw
MDAgQ1IwOiAwMDAwMDAwMDgwMDUwMDMzDQogICAgWyAgIDgzLjgzNDk3NF0gQ1IyOiAwMDAwMDAw
MDAwMDAwMjE4IENSMzogMDAwMDAwMDAwMjE2YjAwMCBDUjQ6IDAwMDAwMDAwMDAwMDA2ZjANCiAg
ICBbICAgODMuODM1MjU5XSBDYWxsIFRyYWNlOg0KICAgIFsgICA4My44MzU5ODNdICA8VEFTSz4N
CiAgICBbICAgODMuODM2MzYyXSAgZ2Jfb3BlcmF0aW9uX2NyZWF0ZV9jb21tb24rMHg2MS8weDE4
MA0KICAgIFsgICA4My44MzY2NTNdICBnYl9vcGVyYXRpb25fY3JlYXRlX2ZsYWdzKzB4MjgvMHhh
MA0KICAgIFsgICA4My44MzY5MTJdICBnYl9vcGVyYXRpb25fc3luY190aW1lb3V0KzB4NmYvMHgx
MDANCiAgICBbICAgODMuODM3MTYyXSAgcmF3X3dyaXRlKzB4N2IvMHhjNyBbZ2JfcmF3XQ0KICAg
IFsgICA4My44Mzc0NjBdICB2ZnNfd3JpdGUrMHhjZi8weDQyMA0KICAgIFsgICA4My44Mzc2MTVd
ICA/IHRhc2tfbW1fY2lkX3dvcmsrMHgxMzYvMHgyMjANCiAgICBbICAgODMuODM3Nzg0XSAga3N5
c193cml0ZSsweDYzLzB4ZTANCiAgICBbICAgODMuODM3OTQ2XSAgZG9fc3lzY2FsbF82NCsweGE0
LzB4MjkwDQogICAgWyAgIDgzLjgzODA5N10gIGVudHJ5X1NZU0NBTExfNjRfYWZ0ZXJfaHdmcmFt
ZSsweDc3LzB4N2YNCiAgICBbICAgODMuODM4MzU5XSBSSVA6IDAwMzM6MHg3ZmVhZDc4ZTljYzcN
CiAgICBbICAgODMuODM4NzEyXSBDb2RlOiA0OCA4OSBmYSA0YyA4OSBkZiBlOCAwOCBhZSAwMCAw
MCA4YiA5MyAwOCAwMyAwMCAwMCA1OSA1ZSA0OCA4MyBmOCBmYyA3NCAxYSA1YiBjMyAwZiAxZiA4
NCAwMCAwMCAwMCAwMCAwMCA0OCA4YiA0NGYNCiAgICBbICAgODMuODM5MTkwXSBSU1A6IDAwMmI6
MDAwMDdmZmVjZTVjM2RlMCBFRkxBR1M6IDAwMDAwMjAyIE9SSUdfUkFYOiAwMDAwMDAwMDAwMDAw
MDAxDQogICAgWyAgIDgzLjgzOTQ4OV0gUkFYOiBmZmZmZmZmZmZmZmZmZmRhIFJCWDogMDAwMDdm
ZWFkNzg1OTc0MCBSQ1g6IDAwMDA3ZmVhZDc4ZTljYzcNCiAgICBbICAgODMuODM5Njc1XSBSRFg6
IDAwMDAwMDAwMDAwMDAwMDYgUlNJOiAwMDAwNTYzZDEzZjk2MzI2IFJESTogMDAwMDAwMDAwMDAw
MDAwMw0KICAgIFsgICA4My44Mzk4OTJdIFJCUDogMDAwMDdmZmVjZTVjM2UzOCBSMDg6IDAwMDAw
MDAwMDAwMDAwMDAgUjA5OiAwMDAwMDAwMDAwMDAwMDAwDQogICAgWyAgIDgzLjg0MDExMl0gUjEw
OiAwMDAwMDAwMDAwMDAwMDAwIFIxMTogMDAwMDAwMDAwMDAwMDIwMiBSMTI6IDAwMDA1NjNjZjg5
MjUxMjgNCiAgICBbICAgODMuODQwMzUwXSBSMTM6IDAwMDA3ZmVhZDc4NTk2ZDAgUjE0OiAwMDAw
NTYzZDEzZjk2MzIwIFIxNTogMDAwMDU2M2QxM2Y5NjMyNg0KICAgIFsgICA4My44NDA2MzVdICA8
L1RBU0s+DQogICAgWyAgIDgzLjg0MDgyNF0gTW9kdWxlcyBsaW5rZWQgaW46IGdiX3JhdyhDKQ0K
ICAgIFsgICA4My44NDEzMTFdIENSMjogMDAwMDAwMDAwMDAwMDIxOA0KICAgIFsgICA4My44NDIw
MDldIC0tLVsgZW5kIHRyYWNlIDAwMDAwMDAwMDAwMDAwMDAgXS0tLQ0KDQpEaXNjb25uZWN0IGNh
bGxzIGdiX2Nvbm5lY3Rpb25fZGVzdHJveSwgd2hpY2ggZW5kcyB1cCBmcmVlaW5nIHRoZQ0KY29u
bmVjdGlvbiBvYmplY3QuIFdoZW4gZ2Jfb3BlcmF0aW9uX3N5bmMgaXMgY2FsbGVkIGluIHRoZSB3
cml0ZSBmaWxlDQpvcGVyYXRpb25zLCBpdHMgZ2V0cyBhIGZyZWVkIGNvbm5lY3Rpb24gYXMgcGFy
YW1ldGVyIGFuZCB0aGUga2VybmVsDQpwYW5pY3MuDQoNClRoZSBnYl9jb25uZWN0aW9uX2Rlc3Ry
b3kgY2Fubm90IGJlIG1vdmVkIG91dCBvZiB0aGUgZGlzY29ubmVjdA0KZnVuY3Rpb24sIGFzIHRo
ZSBHcmV5YnVzIHN1YnN5c3RlbSBleHBlY3QgYWxsIGNvbm5lY3Rpb25zIGJlbG9uZ2luZyB0byBh
DQpidW5kbGUgdG8gYmUgZGVzdHJveWVkIHdoZW4gZGlzY29ubmVjdCByZXR1cm5zLg0KDQpUbyBw
cmV2ZW50IHRoaXMgYnVnLCB1c2UgYSBsb2NrIHRvIHN5bmNocm9uaXplIGFjY2VzcyBiZXR3ZWVu
IHdyaXRlIGFuZA0KZGlzY29ubmVjdC4gVGhpcyBndWFyYW50ZWVzIHRoYXQgaW4gdGhlIHdyaXRl
IGZ1bmN0aW9uIHJhdy0+Y29ubmVjdGlvbg0KaXMgZWl0aGVyIGEgdmFsaWQgb2JqZWN0IG9yIGEg
TlVMTCBwb2ludGVyLg0KDQpGaXhlczogZTgwNmM3ZmI4ZTliICgiZ3JleWJ1czogcmF3OiBhZGQg
cmF3IGdyZXlidXMga2VybmVsIGRyaXZlciIpDQpTaWduZWQtb2ZmLWJ5OiBEYW1pZW4gUmnDqWdl
bCA8ZGFtaWVuLnJpZWdlbEBzaWxhYnMuY29tPg0KLS0tDQogZHJpdmVycy9zdGFnaW5nL2dyZXli
dXMvcmF3LmMgfCAyNiArKysrKysrKysrKysrKysrKysrKy0tLS0tLQ0KIDEgZmlsZSBjaGFuZ2Vk
LCAyMCBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9zdGFnaW5nL2dyZXlidXMvcmF3LmMgYi9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9yYXcuYw0K
aW5kZXggYjkyMjE0Zjk3ZTMuLmFhNDA4NmZmMzk3IDEwMDY0NA0KLS0tIGEvZHJpdmVycy9zdGFn
aW5nL2dyZXlidXMvcmF3LmMNCisrKyBiL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL3Jhdy5jDQpA
QCAtMjEsNiArMjEsNyBAQCBzdHJ1Y3QgZ2JfcmF3IHsNCiAJc3RydWN0IGxpc3RfaGVhZCBsaXN0
Ow0KIAlpbnQgbGlzdF9kYXRhOw0KIAlzdHJ1Y3QgbXV0ZXggbGlzdF9sb2NrOw0KKwlzdHJ1Y3Qg
bXV0ZXggd3JpdGVfbG9jazsJLyogU3luY2hyb25pemUgYWNjZXNzIHRvIGNvbm5lY3Rpb24gKi8N
CiAJc3RydWN0IGNkZXYgY2RldjsNCiAJc3RydWN0IGRldmljZSBkZXY7DQogfTsNCkBAIC0xMjQs
OCArMTI1LDggQEAgc3RhdGljIGludCBnYl9yYXdfcmVxdWVzdF9oYW5kbGVyKHN0cnVjdCBnYl9v
cGVyYXRpb24gKm9wKQ0KIA0KIHN0YXRpYyBpbnQgZ2JfcmF3X3NlbmQoc3RydWN0IGdiX3JhdyAq
cmF3LCB1MzIgbGVuLCBjb25zdCBjaGFyIF9fdXNlciAqZGF0YSkNCiB7DQotCXN0cnVjdCBnYl9j
b25uZWN0aW9uICpjb25uZWN0aW9uID0gcmF3LT5jb25uZWN0aW9uOw0KIAlzdHJ1Y3QgZ2JfcmF3
X3NlbmRfcmVxdWVzdCAqcmVxdWVzdDsNCisJc3RydWN0IGdiX2Nvbm5lY3Rpb24gKmNvbm5lY3Rp
b247DQogCWludCByZXR2YWw7DQogDQogCXJlcXVlc3QgPSBrbWFsbG9jKGxlbiArIHNpemVvZigq
cmVxdWVzdCksIEdGUF9LRVJORUwpOw0KQEAgLTEzOSw5ICsxNDAsMTUgQEAgc3RhdGljIGludCBn
Yl9yYXdfc2VuZChzdHJ1Y3QgZ2JfcmF3ICpyYXcsIHUzMiBsZW4sIGNvbnN0IGNoYXIgX191c2Vy
ICpkYXRhKQ0KIA0KIAlyZXF1ZXN0LT5sZW4gPSBjcHVfdG9fbGUzMihsZW4pOw0KIA0KLQlyZXR2
YWwgPSBnYl9vcGVyYXRpb25fc3luYyhjb25uZWN0aW9uLCBHQl9SQVdfVFlQRV9TRU5ELA0KLQkJ
CQkgICByZXF1ZXN0LCBsZW4gKyBzaXplb2YoKnJlcXVlc3QpLA0KLQkJCQkgICBOVUxMLCAwKTsN
CisJbXV0ZXhfbG9jaygmcmF3LT53cml0ZV9sb2NrKTsNCisJcmV0dmFsID0gLUVOT0RFVjsNCisN
CisJY29ubmVjdGlvbiA9IHJhdy0+Y29ubmVjdGlvbjsNCisJaWYgKGNvbm5lY3Rpb24pDQorCQly
ZXR2YWwgPSBnYl9vcGVyYXRpb25fc3luYyhjb25uZWN0aW9uLCBHQl9SQVdfVFlQRV9TRU5ELA0K
KwkJCQkJICAgcmVxdWVzdCwgbGVuICsgc2l6ZW9mKCpyZXF1ZXN0KSwNCisJCQkJCSAgIE5VTEws
IDApOw0KKwltdXRleF91bmxvY2soJnJhdy0+d3JpdGVfbG9jayk7DQogDQogCWtmcmVlKHJlcXVl
c3QpOw0KIAlyZXR1cm4gcmV0dmFsOw0KQEAgLTE4Niw2ICsxOTMsNyBAQCBzdGF0aWMgaW50IGdi
X3Jhd19wcm9iZShzdHJ1Y3QgZ2JfYnVuZGxlICpidW5kbGUsDQogDQogCUlOSVRfTElTVF9IRUFE
KCZyYXctPmxpc3QpOw0KIAltdXRleF9pbml0KCZyYXctPmxpc3RfbG9jayk7DQorCW11dGV4X2lu
aXQoJnJhdy0+d3JpdGVfbG9jayk7DQogDQogCXJhdy0+Y29ubmVjdGlvbiA9IGNvbm5lY3Rpb247
DQogCWdyZXlidXNfc2V0X2RydmRhdGEoYnVuZGxlLCByYXcpOw0KQEAgLTIzOCw5ICsyNDYsOSBA
QCBzdGF0aWMgdm9pZCBnYl9yYXdfZGlzY29ubmVjdChzdHJ1Y3QgZ2JfYnVuZGxlICpidW5kbGUp
DQogCXN0cnVjdCByYXdfZGF0YSAqdGVtcDsNCiANCiAJY2Rldl9kZXZpY2VfZGVsKCZyYXctPmNk
ZXYsICZyYXctPmRldik7DQotCWdiX2Nvbm5lY3Rpb25fZGlzYWJsZShjb25uZWN0aW9uKTsNCiAJ
aWRhX2ZyZWUoJm1pbm9ycywgTUlOT1IocmF3LT5kZXYuZGV2dCkpOw0KLQlnYl9jb25uZWN0aW9u
X2Rlc3Ryb3koY29ubmVjdGlvbik7DQorDQorCWdiX2Nvbm5lY3Rpb25fZGlzYWJsZShjb25uZWN0
aW9uKTsNCiANCiAJbXV0ZXhfbG9jaygmcmF3LT5saXN0X2xvY2spOw0KIAlsaXN0X2Zvcl9lYWNo
X2VudHJ5X3NhZmUocmF3X2RhdGEsIHRlbXAsICZyYXctPmxpc3QsIGVudHJ5KSB7DQpAQCAtMjQ4
LDYgKzI1NiwxMiBAQCBzdGF0aWMgdm9pZCBnYl9yYXdfZGlzY29ubmVjdChzdHJ1Y3QgZ2JfYnVu
ZGxlICpidW5kbGUpDQogCQlrZnJlZShyYXdfZGF0YSk7DQogCX0NCiAJbXV0ZXhfdW5sb2NrKCZy
YXctPmxpc3RfbG9jayk7DQorDQorCW11dGV4X2xvY2soJnJhdy0+d3JpdGVfbG9jayk7DQorCXJh
dy0+Y29ubmVjdGlvbiA9IE5VTEw7DQorCWdiX2Nvbm5lY3Rpb25fZGVzdHJveShjb25uZWN0aW9u
KTsNCisJbXV0ZXhfdW5sb2NrKCZyYXctPndyaXRlX2xvY2spOw0KKw0KIAlwdXRfZGV2aWNlKCZy
YXctPmRldik7DQogfQ0KIA0KLS0gDQoyLjUyLjANCg0KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0IC0tIGdyZXli
dXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKVG8gdW5zdWJzY3JpYmUgc2VuZCBhbiBlbWFpbCB0byBn
cmV5YnVzLWRldi1sZWF2ZUBsaXN0cy5saW5hcm8ub3JnCg==
