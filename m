Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QB7FNk+ZwmnbfQQAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Tue, 24 Mar 2026 15:01:51 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 53645309D8C
	for <lists+greybus-dev@lfdr.de>; Tue, 24 Mar 2026 15:01:45 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 62B9640140
	for <lists+greybus-dev@lfdr.de>; Tue, 24 Mar 2026 14:01:44 +0000 (UTC)
Received: from mx0a-0024c301.pphosted.com (mx0a-0024c301.pphosted.com [148.163.149.154])
	by lists.linaro.org (Postfix) with ESMTPS id 71EAA3F7B6
	for <greybus-dev@lists.linaro.org>; Tue, 24 Mar 2026 14:01:19 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=silabs.com header.s=pps12202023 header.b=g3pOnOkG;
	dkim=pass header.d=silabs.com header.s=selector1 header.b=IMSd39vr;
	arc=reject ("signature check failed: fail, {[1] = sig:microsoft.com:reject}");
	spf=pass (lists.linaro.org: domain of "prvs=1543d7b3bc=damien.riegel@silabs.com" designates 148.163.149.154 as permitted sender) smtp.mailfrom="prvs=1543d7b3bc=damien.riegel@silabs.com";
	dmarc=pass (policy=reject) header.from=silabs.com
Received: from pps.filterd (m0101743.ppops.net [127.0.0.1])
	by mx0a-0024c301.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O7ZFwh1409221;
	Tue, 24 Mar 2026 09:00:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pps12202023; bh=BVOW1Pnmsu1/zE95y6SJ
	OIPoc+I1/Co14ZfbBeaKnB0=; b=g3pOnOkGSXtSYneqVbNGVHzysUlyuqsPMCvJ
	uDgKnR/WGg5Aj17ySDcVfLsXaRD56HPv1ZGbIk0lcapzqV3mLQQRv7EWvejLosrl
	yWDywm1MZuVCkPlMSCkQxAoytFt3RdwHshH6yhmZuSHa2BEP3wesnYPUBPXfu8J5
	ohSliqAW2ka248nQ9uBNDu0oMJ45I9XjilayhWG0tg4zEcgPKAdOKZ/GT3167GHn
	D+mgodJOBm7mq2lIL+rzSnBkTQivo76IJfj+v1poMv1Z1gdUHju6KC8vJ7e5Rf0t
	29aVQiceAMOBrK1cVJWpd+PCe3qzh4lpBGRCKtpGq73xk4skmA==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11023105.outbound.protection.outlook.com [40.107.201.105])
	by mx0a-0024c301.pphosted.com (PPS) with ESMTPS id 4d1qn5dxka-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 24 Mar 2026 09:00:53 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Svh1q3nB+hK8nYVmIzu8kC/a4UrRNoLuJNLSKTEBySOy8I8F/TB21Je5LbG3T+EOImMogAFNNQrxhKSx4vP+5iIwk5DNwMX4aDA78xXsBNL/C6HqERJfxieXGr8PnqbYImjNkP9a/B/swvRK/hFgg//12AbLbqf5O87GAg8SLDGI2hVMrC2LH+yEmgJ0DGHRQsRUuWP6IRzJuwiguGsJst3+LccLvoyHpfe1ZaRh3dQq0FZyFg0ivPhcjwnkEbGsYwwG63xjoPDGaIDcys4fkpTZu8z3AsIDPInAV7R7ZWdHIuZdkUSSueOenUcxye0uGfXexP9rc7GqOvDv5rKwkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BVOW1Pnmsu1/zE95y6SJOIPoc+I1/Co14ZfbBeaKnB0=;
 b=LaYVXo8GB8uGCHwFBfERfJSHOu7ug5i0mGB7qQ9tsNs77gkmuuS45doeAGKAxC/By2dwjA1WdaD9sJiA1FzJWa1+WG2bHBPnY2jO89whvAoYT36T8B1nLKYvF20VPwKo5dchShk2dLoT76VKwwYeN5dHql5pb48lo65gxa2D5b7gnt6ZNVLTQUZut7gBQg0exz2dh3jL6JSETveh1CrvAHX1HJEazCagCZqS+E2bO0IS2WFUgL2+wqa+eNWjOji+MmLzSOh4SPfOrZHcxa6gIYbhp9VAn705nhPvWGN5DQ01PnFKSxU7N6ZjwNxdfrAkDlZ+aZ2r8eJRnwh4Ykda4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silabs.com; dmarc=pass action=none header.from=silabs.com;
 dkim=pass header.d=silabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BVOW1Pnmsu1/zE95y6SJOIPoc+I1/Co14ZfbBeaKnB0=;
 b=IMSd39vrXq/AAwJ91LdtF76jfzSbhbNT5DcHRwoZ+/RwLph1buUhxOETbSq1Tl8vnCwM91LxliQ4SbM9SdG0hyqNPzZ91RCPmSZGYceg0dhTitdACKWBmK7NRDjjQ9U5HdfWRC8mXBZg+xuwmObxno/ALzFoWsOZsdQAKsbXR10=
Received: from DS0PR11MB8205.namprd11.prod.outlook.com (2603:10b6:8:162::17)
 by SJ2PR11MB7619.namprd11.prod.outlook.com (2603:10b6:a03:4d1::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Tue, 24 Mar
 2026 14:00:50 +0000
Received: from DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::2de6:bc88:2af7:3583]) by DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::2de6:bc88:2af7:3583%3]) with mapi id 15.20.9745.019; Tue, 24 Mar 2026
 14:00:49 +0000
From: =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
To: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>,
        Alex Elder <elder@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dan Carpenter <dan.carpenter@linaro.org>
Date: Tue, 24 Mar 2026 10:00:38 -0400
Message-ID: <20260324140039.40001-1-damien.riegel@silabs.com>
X-Mailer: git-send-email 2.52.0
X-ClientProxiedBy: YQZPR01CA0088.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:84::16) To DS0PR11MB8205.namprd11.prod.outlook.com
 (2603:10b6:8:162::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8205:EE_|SJ2PR11MB7619:EE_
X-MS-Office365-Filtering-Correlation-Id: d8150ed0-c681-43f4-867a-08de89adc0bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	scDXDIY/+v74xhwteukzH6jMnyBAMpnJqnMgGrdvWxJ/4SP2xiEbsQQhxTbypwxW+VE1UCy3oVQ5HO8pe1twv/xJrkiqSYnQOUN/nUqn4aXKCsS21QFF2s6scXU8Go8aDfBVa5fRRXOds6dsHEdCNRME6m8wijZ5OX1Xs66qX03SjlmOSDu7ccIwNYxSZQiJh1TRGMeZqE7MafaPoLZbPaw9VOapSneO2SazQ4l7V28aEoUyPM5+2YDWuRAoBlmyDHFv10tBoNJOfIKXVSAHcEtxDqgyk7lLOTgpBuzfu+tdVqjmpRoTfq29Wkl6UN/rKBQRkcwvjSjWqAdnu+IiY136Fju/VD87nvhSKMplUzxlsjEGUlrAKem6MI5hjFUHb69Bl5Nveb5dZG5VN0jMHg4DdvY9ufG16hjpxjBlQftsVJk/ejdaEwyyeQ1O75aaln6RHOrrB056Xh6HgAV4hyCcoDipnJ8AasKsbDcy0vAYPFhi1lGzv/CvWKrDWlC19L+buqUSffmgXRhsk5EgxD/o6rzQTDtBPqlq+M9fbfddmrPNyowtH7MZ2VZ7bHyHKSgteMBapd8aqdeHjP1LZlht7R68FzQvGK3wLe/0VJf++F79KpHAm5t8jqR656OvGmrVuPNfd2z6Ms4pqc4lRrNRSFusf9Pjvz3qyVJgwNZFFHBBLo6U+uQvR4wGZwYaYoCfYJlyq3rn+OciRldvPAByxBVFml3H87UxdJPy0x76k3aKjyzjjacfcfsi0gSXzAcZZTlPhAH8khSnFltd/gMTRaUrz4ik0Y21tR8Ln+0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8205.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RGpxc3hEY3JBNHVnSmxESUEyMXphSzJ2eWwzdVNFWEloWG0xS2wzcWRVOVJt?=
 =?utf-8?B?dVhmTVZRRjlxc1hFMnpSSC96aXdqT2ozNmVHWS9EWG9sMmRTaU5XRmxkcnVK?=
 =?utf-8?B?ajkxaWI4K3lPakRkV2l6Zi9WVHNtQSszbGlQVk1sdEYxOS93RTZoUG00ZXQv?=
 =?utf-8?B?Q1lUaVR3aHpsZEFXbHhSMU9GRWRMQVdDRnVvZ1ZsSHVndE5OdElaN2xYNytw?=
 =?utf-8?B?Vi9zYTNvQngzR1M0YWNTTnU3TkFJbm9FWU5WT2IvbzhCOFRMRGwrMDRUUjNp?=
 =?utf-8?B?bGE1b1VnNmVPeXF4K1RHamJPSFBaMGtVcTFEc3B0akRrdHJpY2x2YUduSzJt?=
 =?utf-8?B?Q2lVL2hWblZEY1BvZVMrYklkQm5Handxd01qZXNuVDFPbkZqZUh5QTJHU0tF?=
 =?utf-8?B?a0d0K3pacHArNFdiLzJZU2NBaDZHaW5CWWs2eXJUUEE5N2F3dS9IVDRMSFY5?=
 =?utf-8?B?NWRDa3NhQjNuVjFrVXdyZ2dmMG0zd2x2Skx0QnRwNlF6VEdsMHh6WDJNd2Rn?=
 =?utf-8?B?aERhTUZnT2lqRW4ycFFTZFR3ZVRxVnJjNXBYK3NPOEpZanNLZmQ2OFhocjhV?=
 =?utf-8?B?OHZHT3pQYWhKRlNWaFNxRm5wNGdhaU5hYjd5OG9SeHhNSjM2VjFUakZOL1l3?=
 =?utf-8?B?T3ZWOE1qUnRtTlJQYmJpN2RSWjJVWXdlY01NNlRiQmhWSVI4OVBWMDJvSi95?=
 =?utf-8?B?azc2OEJjd0NYbXBDZUlUdlptYnlIY1RYcWU5V1pDc2JCOGFnMGtubk9pa0FD?=
 =?utf-8?B?VDE4RFdML1RVYUw0MDBrZFhCcWw4UHhDMlhMd2NhR1liYUJhMDMwR3Bvc1Bi?=
 =?utf-8?B?V3pQdCtzSEZqcVhzQXUwNWUxSXVEZkJ3d2c1Rld6V0w5VUt0REJPUkZhcVgx?=
 =?utf-8?B?T1UvOFlYYk1UOXFTRU41elovLzE2ODZPS21kcTgzeHNxWG8yd2IrVWo3TWJW?=
 =?utf-8?B?djlhUk8wU2dCeWhPRlNROHNNMDlSRjVOUXBsd0xOY3I5V1lpZVNjWFpMUWlM?=
 =?utf-8?B?QTJTQmNOeDVVNkVkRE9PVUdIdk8xYmtySFF4WVVkV3dlUFVvNDcxT2xQOURJ?=
 =?utf-8?B?bk56ZFFuY3ZWekduU0I4eXhUVWJKL1I3QUh1VUhNNUxZeFNmZ2hnTDF2Mnc0?=
 =?utf-8?B?ellMRGNzVEEyVXBxb1dMQlB5SHhBU2s3M2RDM0N1RnlVeGxCQ2JJMGoxby9N?=
 =?utf-8?B?MW1mY1FoL3ZuOFVHYnR3WVFGdUJjQTNVUk4wSlhUQTZEeks3d1FvT2tySmVa?=
 =?utf-8?B?N0IyTTQraGRiUmYzNTJsK08rK2c2U05yMGlicUJBb0NtNG9hNzdhMUY3RkhT?=
 =?utf-8?B?eFhEa3F6SEhZLzhZZTJYdTlMaUZQZGV4WGdSZVpXbDRza2x5eFVnNzNQZVFC?=
 =?utf-8?B?Y0FxVmtSeWdmMG1Nd2pRZjBXY0lKZWh4ZGRSVEZPRTBxbFUwMWp5Tmt4aW1H?=
 =?utf-8?B?TFZ5c1JWdjVhZFJTRUpvUjh3dHprUmllU3FwcnpLeUk5UDZ0U1VWcXBLZklB?=
 =?utf-8?B?L1NDK1pqVHJseDFNSEdBQzNtYWZIeWY0bDlrc3RzRmQ2Qk5kYzVNaVZVblZi?=
 =?utf-8?B?WERsMXdLaTE2eUdZc2VRaW5USE1KSndJSWwxQ0FuK0pNRUw1eXN4Wk0wNmlR?=
 =?utf-8?B?bmhEbEhCaGFpREtvRlM3SEtnRi84YTltNWNmNnpnVXNLb3g0dzhyTnhFNkNy?=
 =?utf-8?B?U1Z4Y0RUVHhoSjRxNFhFUUV5QVpIYnRGYnZkMzBrT2YyeHgxTW1tdjg2NTlu?=
 =?utf-8?B?M0lIL083NUcxYU1oTlhTYSszY3JtWXVJbWVHLzVjQkYydCtDM3JzMDFoUCtE?=
 =?utf-8?B?b1RTaVNDZFJXN2hXa1RSR3ZnSjRhYTFSRUhRbk9OMVFGMlN1VXVFQ0ZqWHZu?=
 =?utf-8?B?bGNEU0tnZSt0WWdaeHhqOWtRYTRwYUtVTElHZnNVek9KOU5IQzNTdXhhT1Fx?=
 =?utf-8?B?cEMycExaRHpEL29aWXhjMi9lUi93L2trVkVxZndvZlVYVlhLUjA5elczSnhM?=
 =?utf-8?B?TjZMTmc1V3k3TFEweVYxSThmbXpSNTVFcnhVaE5qL1hKWURGQTJzUzQxbDhh?=
 =?utf-8?B?SkV0c0lUM2hIZ3B3NUQ5YVpSSEVtdHRGWkR4TnQyb1VwakdDQkFDYlNMZG1S?=
 =?utf-8?B?VTIrUEdqNEgwWis2Z3dzWis0TGNSV1E5cXhHWk96OU5HY21EUGhYOWdNU1VU?=
 =?utf-8?B?cy9UQit5MWhIZnh2aFF5bFRwTE85TGl0c3FvenFKMmg1YnhUai93WlVLYVJD?=
 =?utf-8?B?SGJXK1QyK0FrcW1NMnFOZ25XVnMwdHROdGZJSGkxcm5MeTE3NzVjMGliVzBr?=
 =?utf-8?B?N0YvV2NQbGhmS3kwK292bUN1TGdNRStBL0hZYnVTNExEZTdrM1FJdz09?=
X-Exchange-RoutingPolicyChecked: 
	WX5c9h2sNpUc6HqktuZC5esfFW9T4Qb7lPmKd4JxRfKCLan9NF8R3vr9bm6498cTnkzUrX6GbhfUib2sguVsvLBMJlbEe6rFL1S3OcWvxKLLOgaI0vbyCektJFJedn9cfPIOATx/Re/VLClZXoD2Tae74zGTnl9t6RaTAyzPqCdegr8Y0G0qFtY/axy3DK+Kg22vZeQsxFHBMKHkHASb1JtvxMjptQM4cHJ7zDQk8vIqrAvrlDAby8X9Zaaf4hmSNMh/00saJnIdjZENSBnQsFera92lJ57Q5FN5eFVO4h1rz7Q2FWqX9oAKLbkdGflQQYF989zgniJNlyrXBOPZTA==
X-OriginatorOrg: silabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8150ed0-c681-43f4-867a-08de89adc0bd
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8205.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 14:00:49.4330
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 54dbd822-5231-4b20-944d-6f4abcd541fb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7MgQeqZTOwg1hNUr3UMvrz5w6jhr3lnXZp+ftzqWh3JbqvlHUU377EiLxqYYubi9E0EdfsFTJo2AThDZhxTbjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7619
X-Authority-Analysis: v=2.4 cv=T5CBjvKQ c=1 sm=1 tr=0 ts=69c29915 cx=c_pps
 a=mXWPUgXNGD4LDRIkHGcDmw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=M51BFTxLslgA:10
 a=i1IsUcr2s-wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=gIHJBl62Mt9vjvfn7G3b:22
 a=6KgOrB_2K63Cyhqxo4vW:22 a=VwQbUJbxAAAA:8 a=2AEO0YjSAAAA:8
 a=XeHHJQA7KXFy9l5GLh0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: aap54gkHInHtneiCvfaBYqORs5RzkkeV
X-Proofpoint-GUID: aap54gkHInHtneiCvfaBYqORs5RzkkeV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDExMCBTYWx0ZWRfX8MkCaCL9U/U0
 CcvGCoIHeApn6P8/tb2bmeleUOskvPhlT2Sw26CcJG9FUtiJqTBDwJh9ojceEHfkiM9gjpFE7Py
 15F9lmIUrzw4o8+XKuy2RQkrp3N1deOgW5P8oPnWs/gUpsIuF5ZjMaDSxfQGy3jSGnBuziiMBt6
 0ILoHxH7auSh5om4tlBWjRY4fw98lMzbH7IS2MDYn9bh4QJTfKkCB079A4Zw4Ol8UfDEtv1dDmm
 Tk/xXiijQuCcQHCDTqW8PyciSyAZvFdQ3JPxwXlZx9DqeqoXPznRVgIf/0HKze/nyNYdnjSAlAG
 5xJdNnN/zqUnqL8NYxTXEfgQnEXAnc8oa8Zo6AzC5WwwinxP30o+pZSQcnMlhM9YWnTZ5r6LNmA
 qodnQ+dY7d7XV2z5Ae2yPNjftAaH1evuHufUYooWxpNpoOzWpHIrfNjfhmme/k7lUm999fvvJjt
 YTNjWei30tgg1RSDMyw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240110
X-Spamd-Bar: --
Message-ID-Hash: GJU4ZII4Y44423GYQQZY7LS4TURKB2UE
X-Message-ID-Hash: GJU4ZII4Y44423GYQQZY7LS4TURKB2UE
X-MailFrom: prvs=1543d7b3bc=damien.riegel@silabs.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v4 1/2] greybus: raw: fix use-after-free on cdev close
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/GJU4ZII4Y44423GYQQZY7LS4TURKB2UE/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Spamd-Result: default: False [4.59 / 15.00];
	DMARC_POLICY_REJECT(2.00)[silabs.com : SPF not aligned (relaxed),reject];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[silabs.com:s=pps12202023,silabs.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+mx:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN_FAIL(0.00)[118.186.210.44.asn.rspamd.com:query timed out];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	DKIM_TRACE(0.00)[silabs.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[damien.riegel@silabs.com,greybus-dev-bounces@lists.linaro.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[greybus-dev];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_SPAM(0.00)[0.985];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linaro.org:helo,lists.linaro.org:rdns,silabs.com:email,silabs.com:mid,linaro.org:email]
X-Rspamd-Queue-Id: 53645309D8C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

VGhpcyBhZGRyZXNzZXMgYSB1c2UtYWZ0ZXItZnJlZSBidWcgd2hlbiBhIHJhdyBidW5kbGUgaXMg
ZGlzY29ubmVjdGVkDQpidXQgaXRzIGNoYXJkZXYgaXMgc3RpbGwgb3BlbmVkIGJ5IGFuIGFwcGxp
Y2F0aW9uLiBXaGVuIHRoZSBhcHBsaWNhdGlvbg0KcmVsZWFzZXMgdGhlIGNkZXYsIGl0IGNhdXNl
cyB0aGUgZm9sbG93aW5nIHBhbmljIHdoZW4gaW5pdCBvbiBmcmVlIGlzDQplbmFibGVkIChDT05G
SUdfSU5JVF9PTl9GUkVFX0RFRkFVTFRfT049eSk6DQoNCiAgICAgICAgcmVmY291bnRfdDogdW5k
ZXJmbG93OyB1c2UtYWZ0ZXItZnJlZS4NCiAgICAgICAgV0FSTklORzogQ1BVOiAwIFBJRDogMTM5
IGF0IGxpYi9yZWZjb3VudC5jOjI4IHJlZmNvdW50X3dhcm5fc2F0dXJhdGUrMHhkMC8weDEzMA0K
ICAgICAgICAgLi4uDQogICAgICAgIENhbGwgVHJhY2U6DQogICAgICAgICA8VEFTSz4NCiAgICAg
ICAgIGNkZXZfcHV0KzB4MTgvMHgzMA0KICAgICAgICAgX19mcHV0KzB4MjU1LzB4MmEwDQogICAg
ICAgICBfX3g2NF9zeXNfY2xvc2UrMHgzZC8weDgwDQogICAgICAgICBkb19zeXNjYWxsXzY0KzB4
YTQvMHgyOTANCiAgICAgICAgIGVudHJ5X1NZU0NBTExfNjRfYWZ0ZXJfaHdmcmFtZSsweDc3LzB4
N2YNCg0KVGhlIGNkZXYgaXMgY29udGFpbmVkIGluIHRoZSAiZ2JfcmF3IiBzdHJ1Y3R1cmUsIHdo
aWNoIGlzIGZyZWVkIGluIHRoZQ0KZGlzY29ubmVjdCBvcGVyYXRpb24uIFdoZW4gdGhlIGNkZXYg
aXMgcmVsZWFzZWQgYXQgYSBsYXRlciB0aW1lLA0KY2Rldl9wdXQgZ2V0cyBhbiBhZGRyZXNzIHRo
YXQgcG9pbnRzIHRvIGZyZWVkIG1lbW9yeS4NCg0KVG8gZml4IHRoaXMgdXNlLWFmdGVyLWZyZWUs
IGNvbnZlcnQgdGhlIHN0cnVjdCBkZXZpY2UgZnJvbSBhIHBvaW50ZXIgdG8NCmJlaW5nIGVtYmVk
ZGVkLCB0aGF0IG1ha2VzIHRoZSBsaWZldGltZSBvZiB0aGUgY2RldiBhbmQgb2YgdGhpcyBkZXZp
Y2UNCnRoZSBzYW1lLiBUaGVuLCB1c2UgY2Rldl9kZXZpY2VfYWRkLCB3aGljaCBndWFyYW50ZWVz
IHRoYXQgdGhlIGRldmljZQ0Kd29uJ3QgYmUgcmVsZWFzZWQgdW50aWwgYWxsIHJlZmVyZW5jZXMg
dG8gdGhlIGNkZXYgaGF2ZSBiZWVuIHJlbGVhc2VkLg0KRmluYWxseSwgZGVsZWdhdGUgdGhlIGZy
ZWVpbmcgb2YgdGhlIHN0cnVjdHVyZSB0byB0aGUgZGV2aWNlIHJlbGVhc2UNCmZ1bmN0aW9uLCBp
bnN0ZWFkIG9mIGZyZWVpbmcgaW1tZWRpYXRlbHkgaW4gdGhlIGRpc2Nvbm5lY3QgY2FsbGJhY2su
DQoNCkZpeGVzOiBlODA2YzdmYjhlOWIgKCJncmV5YnVzOiByYXc6IGFkZCByYXcgZ3JleWJ1cyBr
ZXJuZWwgZHJpdmVyIikNClJldmlld2VkLWJ5OiBKb2hhbiBIb3ZvbGQgPGpvaGFuQGtlcm5lbC5v
cmc+DQpTaWduZWQtb2ZmLWJ5OiBEYW1pZW4gUmnDqWdlbCA8ZGFtaWVuLnJpZWdlbEBzaWxhYnMu
Y29tPg0KLS0tDQpDaGFuZ2VzIGluIHY0Og0KICAtIHJlYmFzZSBvbiB2Ny4wLXJjNCAtPiBjaGFu
Z2Uga3phbGxvYyBpbnRvIGt6YWxsb2Nfb2JqDQoNCkNoYW5nZXMgaW4gdjM6DQogIC0gbW92ZSBh
c3NpZ25tZW50IG9mIHJhdy0+ZGV2LnBhcmVudA0KICAtIGFkZCBSZXZpZXdlZC1CeTogSm9oYW4g
SG92b2xkDQoNCkNoYW5nZXMgaW4gdjI6DQogIC0gdHJpbSBkb3duIHRyYWNlIGluIGNvbW1pdCBt
ZXNzYWdlIHRvIGtlZXAgb25seSB0aGUgZXNzZW50aWFsIHBhcnQNCiAgLSByZXdvcmsgZXJyb3Ig
cGF0aHMgaW4gcHJvYmUgZnVuY3Rpb24gdG8gZW5zdXJlIGRldmljZSBpcyBhbHdheXMgZnJlZWQN
CiAgICAoc2V0IGRldmljZSByZWxlYXNlIGNhbGxiYWNrIGJlZm9yZSBhbnkgY2FsbCB0byBwdXRf
ZGV2aWNlKQ0KICAtIG1vdmUgaWRhX2ZyZWUgdG8gcmVsZWFzZSBjYWxsYmFjaw0KDQogZHJpdmVy
cy9zdGFnaW5nL2dyZXlidXMvcmF3LmMgfCA2OSArKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0t
LS0tLS0tLQ0KIDEgZmlsZSBjaGFuZ2VkLCAzNCBpbnNlcnRpb25zKCspLCAzNSBkZWxldGlvbnMo
LSkNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL3Jhdy5jIGIvZHJpdmVy
cy9zdGFnaW5nL2dyZXlidXMvcmF3LmMNCmluZGV4IDMwMjdhMmMyNWJjZC4uNDdhOTg0NTU0Njgx
IDEwMDY0NA0KLS0tIGEvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvcmF3LmMNCisrKyBiL2RyaXZl
cnMvc3RhZ2luZy9ncmV5YnVzL3Jhdy5jDQpAQCAtMjEsOSArMjEsOCBAQCBzdHJ1Y3QgZ2JfcmF3
IHsNCiAJc3RydWN0IGxpc3RfaGVhZCBsaXN0Ow0KIAlpbnQgbGlzdF9kYXRhOw0KIAlzdHJ1Y3Qg
bXV0ZXggbGlzdF9sb2NrOw0KLQlkZXZfdCBkZXY7DQogCXN0cnVjdCBjZGV2IGNkZXY7DQotCXN0
cnVjdCBkZXZpY2UgKmRldmljZTsNCisJc3RydWN0IGRldmljZSBkZXY7DQogfTsNCiANCiBzdHJ1
Y3QgcmF3X2RhdGEgew0KQEAgLTE0OCw2ICsxNDcsMTUgQEAgc3RhdGljIGludCBnYl9yYXdfc2Vu
ZChzdHJ1Y3QgZ2JfcmF3ICpyYXcsIHUzMiBsZW4sIGNvbnN0IGNoYXIgX191c2VyICpkYXRhKQ0K
IAlyZXR1cm4gcmV0dmFsOw0KIH0NCiANCitzdGF0aWMgdm9pZCByYXdfZGV2X3JlbGVhc2Uoc3Ry
dWN0IGRldmljZSAqZGV2KQ0KK3sNCisJc3RydWN0IGdiX3JhdyAqcmF3ID0gY29udGFpbmVyX29m
KGRldiwgc3RydWN0IGdiX3JhdywgZGV2KTsNCisNCisJaWRhX2ZyZWUoJm1pbm9ycywgTUlOT1Io
cmF3LT5kZXYuZGV2dCkpOw0KKw0KKwlrZnJlZShyYXcpOw0KK30NCisNCiBzdGF0aWMgaW50IGdi
X3Jhd19wcm9iZShzdHJ1Y3QgZ2JfYnVuZGxlICpidW5kbGUsDQogCQkJY29uc3Qgc3RydWN0IGdy
ZXlidXNfYnVuZGxlX2lkICppZCkNCiB7DQpAQCAtMTY0LDE1ICsxNzIsMzAgQEAgc3RhdGljIGlu
dCBnYl9yYXdfcHJvYmUoc3RydWN0IGdiX2J1bmRsZSAqYnVuZGxlLA0KIAlpZiAoY3BvcnRfZGVz
Yy0+cHJvdG9jb2xfaWQgIT0gR1JFWUJVU19QUk9UT0NPTF9SQVcpDQogCQlyZXR1cm4gLUVOT0RF
VjsNCiANCi0JcmF3ID0ga3phbGxvY19vYmooKnJhdyk7DQotCWlmICghcmF3KQ0KKwltaW5vciA9
IGlkYV9hbGxvYygmbWlub3JzLCBHRlBfS0VSTkVMKTsNCisJaWYgKG1pbm9yIDwgMCkNCisJCXJl
dHVybiBtaW5vcjsNCisNCisJcmF3ID0ga3phbGxvY19vYmooKnJhdywgR0ZQX0tFUk5FTCk7DQor
CWlmICghcmF3KSB7DQorCQlpZGFfZnJlZSgmbWlub3JzLCBtaW5vcik7DQogCQlyZXR1cm4gLUVO
T01FTTsNCisJfQ0KKw0KKwlkZXZpY2VfaW5pdGlhbGl6ZSgmcmF3LT5kZXYpOw0KKwlyYXctPmRl
di5kZXZ0ID0gTUtERVYocmF3X21ham9yLCBtaW5vcik7DQorCXJhdy0+ZGV2LmNsYXNzID0gJnJh
d19jbGFzczsNCisJcmF3LT5kZXYucGFyZW50ID0gJmJ1bmRsZS0+ZGV2Ow0KKwlyYXctPmRldi5y
ZWxlYXNlID0gcmF3X2Rldl9yZWxlYXNlOw0KKwlyZXR2YWwgPSBkZXZfc2V0X25hbWUoJnJhdy0+
ZGV2LCAiZ2IhcmF3JWQiLCBtaW5vcik7DQorCWlmIChyZXR2YWwpDQorCQlnb3RvIGVycm9yX3B1
dF9kZXZpY2U7DQogDQogCWNvbm5lY3Rpb24gPSBnYl9jb25uZWN0aW9uX2NyZWF0ZShidW5kbGUs
IGxlMTZfdG9fY3B1KGNwb3J0X2Rlc2MtPmlkKSwNCiAJCQkJCSAgZ2JfcmF3X3JlcXVlc3RfaGFu
ZGxlcik7DQogCWlmIChJU19FUlIoY29ubmVjdGlvbikpIHsNCiAJCXJldHZhbCA9IFBUUl9FUlIo
Y29ubmVjdGlvbik7DQotCQlnb3RvIGVycm9yX2ZyZWU7DQorCQlnb3RvIGVycm9yX3B1dF9kZXZp
Y2U7DQogCX0NCiANCiAJSU5JVF9MSVNUX0hFQUQoJnJhdy0+bGlzdCk7DQpAQCAtMTgxLDQ2ICsy
MDQsMjYgQEAgc3RhdGljIGludCBnYl9yYXdfcHJvYmUoc3RydWN0IGdiX2J1bmRsZSAqYnVuZGxl
LA0KIAlyYXctPmNvbm5lY3Rpb24gPSBjb25uZWN0aW9uOw0KIAlncmV5YnVzX3NldF9kcnZkYXRh
KGJ1bmRsZSwgcmF3KTsNCiANCi0JbWlub3IgPSBpZGFfYWxsb2MoJm1pbm9ycywgR0ZQX0tFUk5F
TCk7DQotCWlmIChtaW5vciA8IDApIHsNCi0JCXJldHZhbCA9IG1pbm9yOw0KLQkJZ290byBlcnJv
cl9jb25uZWN0aW9uX2Rlc3Ryb3k7DQotCX0NCi0NCi0JcmF3LT5kZXYgPSBNS0RFVihyYXdfbWFq
b3IsIG1pbm9yKTsNCiAJY2Rldl9pbml0KCZyYXctPmNkZXYsICZyYXdfZm9wcyk7DQogDQogCXJl
dHZhbCA9IGdiX2Nvbm5lY3Rpb25fZW5hYmxlKGNvbm5lY3Rpb24pOw0KIAlpZiAocmV0dmFsKQ0K
LQkJZ290byBlcnJvcl9yZW1vdmVfaWRhOw0KKwkJZ290byBlcnJvcl9jb25uZWN0aW9uX2Rlc3Ry
b3k7DQogDQotCXJldHZhbCA9IGNkZXZfYWRkKCZyYXctPmNkZXYsIHJhdy0+ZGV2LCAxKTsNCisJ
cmV0dmFsID0gY2Rldl9kZXZpY2VfYWRkKCZyYXctPmNkZXYsICZyYXctPmRldik7DQogCWlmIChy
ZXR2YWwpDQogCQlnb3RvIGVycm9yX2Nvbm5lY3Rpb25fZGlzYWJsZTsNCiANCi0JcmF3LT5kZXZp
Y2UgPSBkZXZpY2VfY3JlYXRlKCZyYXdfY2xhc3MsICZjb25uZWN0aW9uLT5idW5kbGUtPmRldiwN
Ci0JCQkJICAgIHJhdy0+ZGV2LCByYXcsICJnYiFyYXclZCIsIG1pbm9yKTsNCi0JaWYgKElTX0VS
UihyYXctPmRldmljZSkpIHsNCi0JCXJldHZhbCA9IFBUUl9FUlIocmF3LT5kZXZpY2UpOw0KLQkJ
Z290byBlcnJvcl9kZWxfY2RldjsNCi0JfQ0KLQ0KIAlyZXR1cm4gMDsNCiANCi1lcnJvcl9kZWxf
Y2RldjoNCi0JY2Rldl9kZWwoJnJhdy0+Y2Rldik7DQotDQogZXJyb3JfY29ubmVjdGlvbl9kaXNh
YmxlOg0KIAlnYl9jb25uZWN0aW9uX2Rpc2FibGUoY29ubmVjdGlvbik7DQogDQotZXJyb3JfcmVt
b3ZlX2lkYToNCi0JaWRhX2ZyZWUoJm1pbm9ycywgbWlub3IpOw0KLQ0KIGVycm9yX2Nvbm5lY3Rp
b25fZGVzdHJveToNCiAJZ2JfY29ubmVjdGlvbl9kZXN0cm95KGNvbm5lY3Rpb24pOw0KIA0KLWVy
cm9yX2ZyZWU6DQotCWtmcmVlKHJhdyk7DQorZXJyb3JfcHV0X2RldmljZToNCisJcHV0X2Rldmlj
ZSgmcmF3LT5kZXYpOw0KIAlyZXR1cm4gcmV0dmFsOw0KIH0NCiANCkBAIC0yMzEsMTEgKzIzNCw4
IEBAIHN0YXRpYyB2b2lkIGdiX3Jhd19kaXNjb25uZWN0KHN0cnVjdCBnYl9idW5kbGUgKmJ1bmRs
ZSkNCiAJc3RydWN0IHJhd19kYXRhICpyYXdfZGF0YTsNCiAJc3RydWN0IHJhd19kYXRhICp0ZW1w
Ow0KIA0KLQkvLyBGSVhNRSAtIGhhbmRsZSByZW1vdmluZyBhIGNvbm5lY3Rpb24gd2hlbiB0aGUg
Y2hhciBkZXZpY2Ugbm9kZSBpcyBvcGVuLg0KLQlkZXZpY2VfZGVzdHJveSgmcmF3X2NsYXNzLCBy
YXctPmRldik7DQotCWNkZXZfZGVsKCZyYXctPmNkZXYpOw0KKwljZGV2X2RldmljZV9kZWwoJnJh
dy0+Y2RldiwgJnJhdy0+ZGV2KTsNCiAJZ2JfY29ubmVjdGlvbl9kaXNhYmxlKGNvbm5lY3Rpb24p
Ow0KLQlpZGFfZnJlZSgmbWlub3JzLCBNSU5PUihyYXctPmRldikpOw0KIAlnYl9jb25uZWN0aW9u
X2Rlc3Ryb3koY29ubmVjdGlvbik7DQogDQogCW11dGV4X2xvY2soJnJhdy0+bGlzdF9sb2NrKTsN
CkBAIC0yNDQsOCArMjQ0LDcgQEAgc3RhdGljIHZvaWQgZ2JfcmF3X2Rpc2Nvbm5lY3Qoc3RydWN0
IGdiX2J1bmRsZSAqYnVuZGxlKQ0KIAkJa2ZyZWUocmF3X2RhdGEpOw0KIAl9DQogCW11dGV4X3Vu
bG9jaygmcmF3LT5saXN0X2xvY2spOw0KLQ0KLQlrZnJlZShyYXcpOw0KKwlwdXRfZGV2aWNlKCZy
YXctPmRldik7DQogfQ0KIA0KIC8qDQotLSANCjIuNTIuMA0KDQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpncmV5YnVzLWRldiBtYWlsaW5nIGxpc3QgLS0g
Z3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpUbyB1bnN1YnNjcmliZSBzZW5kIGFuIGVtYWls
IHRvIGdyZXlidXMtZGV2LWxlYXZlQGxpc3RzLmxpbmFyby5vcmcK
