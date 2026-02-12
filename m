Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +ATzHp/njWkm8gAAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Thu, 12 Feb 2026 15:45:51 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 3658B12E735
	for <lists+greybus-dev@lfdr.de>; Thu, 12 Feb 2026 15:45:51 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 3AFA7401F0
	for <lists+greybus-dev@lfdr.de>; Thu, 12 Feb 2026 14:45:50 +0000 (UTC)
Received: from mx0a-0024c301.pphosted.com (mx0a-0024c301.pphosted.com [148.163.149.154])
	by lists.linaro.org (Postfix) with ESMTPS id 87AE4401E2
	for <greybus-dev@lists.linaro.org>; Thu, 12 Feb 2026 14:44:25 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=silabs.com header.s=pps12202023 header.b=OKda5B0M;
	dkim=pass header.d=silabs.com header.s=selector1 header.b=LB88Ifu2;
	spf=pass (lists.linaro.org: domain of "prvs=050394110d=damien.riegel@silabs.com" designates 148.163.149.154 as permitted sender) smtp.mailfrom="prvs=050394110d=damien.riegel@silabs.com";
	arc=pass ("microsoft.com:s=arcselector10001:i=1");
	dmarc=pass (policy=reject) header.from=silabs.com
Received: from pps.filterd (m0101743.ppops.net [127.0.0.1])
	by mx0a-0024c301.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61C2Lwne2678544;
	Thu, 12 Feb 2026 08:44:13 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps12202023;
	 bh=EenD0vtlm5f+lRBQE1UDgnHsf9//KsrS1rNHMUvdBjE=; b=OKda5B0Mfkq2
	204xswCtzRZbDv6Mzuen+Ue2KFryyz75dKl9SJgyIbj+d6X73bTJRR+7EOx2L/d5
	tYlfQft8o75UkfmaGFub/FzJObhR1efF1bEwKpNMcMkLcmahtzU3nHutyd5F973O
	I4/DVEYqA85NGPT8hy4zdiDtkNdJ1JGnRMadysu4K0YvxVsLiS7mr9n2n2fQwS+4
	YojwmGZSsnqWONu8mp4FwY9OIe9Wajdv8ykGmOtQOJ/YcuQCw4z50OztHW+QvWMf
	mQX4/Vhfh+x2aw543PGVtNMorunnhx4hYS2zn1AuUUVPq+ypoasQ14YlBBjX7Yea
	tPdpX0EacA==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11020096.outbound.protection.outlook.com [52.101.61.96])
	by mx0a-0024c301.pphosted.com (PPS) with ESMTPS id 4c92uysn4e-3
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 12 Feb 2026 08:44:12 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z/ZvJaRZSiMQ6Fhk+sYp5Ij7k/bsL3/UHSm2F27XtgFmCPzs6TulN/UicoOAI5NkIUeHKEQpSm16FIbEY2SU1q5RKWOuec5ppo7v3EW1Jzc237pNTtdnGGqQpDpgJd+CiId3JPJ3Nn0DeNyub82Tn6Cr3CfuHpwMxhiZSC8FLzeQe/o0CKfDJdPluPk3mAPZ08iq2a5u0iNL5AArYVJlmEJ/usbu7gIYzVvkNil7MJ7nZaOfLxgVkdIB2U8Z9v0qI0CMdzx152Pr3XVGm69/sfxnpb+QzRk6NuvSRBUTESGfsgUCTeAtpkyPysfUBTsrclxXdZ0ZHt2nUBO3ZJbiDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EenD0vtlm5f+lRBQE1UDgnHsf9//KsrS1rNHMUvdBjE=;
 b=p9jrQqV8UzRR4jeNNYZMa2BaM50m44ovsIPwKZMqwT2WjqTHt+uRKbIZEYpJ1bZH7lY7iaX2PLweth9D8XmJMdZJVrUg10s6N8hlp/PvnR8hXKgGa6d9igm0IDBvZvfcBulpQIpXZeOXblCaLyf4DaKNl3gGB5QhCwkIKj970XylIeXIq1hakKbhBmuVS13z4YRGnWUfvnDV3pD0uYCQ3T33/30ivNyYU+Y0+64mEs4ptpT0Ew3OeDu/xvPe3cz/pgvPVuCRX34MS3v7v8vlsoZ5rppPdVFKxh0/wbLEw25WIo/JdEngd5Ls0LguKGLpGv38fgC7LeNfzOhPXEXULQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silabs.com; dmarc=pass action=none header.from=silabs.com;
 dkim=pass header.d=silabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EenD0vtlm5f+lRBQE1UDgnHsf9//KsrS1rNHMUvdBjE=;
 b=LB88Ifu2p5NK8UqkvQPgmSD8vY7CUZIa/JoiDGOsZAov0tGHL3SE+x1XNk+t/XcNIimoNkDq2jvL2dc4QMxt3JvLul/lSdXoRkRkgXz+HZheWBXO9caafcLD3MpG8qrpmrf7neRWyzAShoq/ZAV0x4fBmgu6pSBqidxh4wDE9FM=
Received: from DS0PR11MB8205.namprd11.prod.outlook.com (2603:10b6:8:162::17)
 by LV8PR11MB8486.namprd11.prod.outlook.com (2603:10b6:408:1e8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Thu, 12 Feb
 2026 14:44:08 +0000
Received: from DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::2de6:bc88:2af7:3583]) by DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::2de6:bc88:2af7:3583%3]) with mapi id 15.20.9611.008; Thu, 12 Feb 2026
 14:44:08 +0000
From: =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
To: greybus-dev@lists.linaro.org, Johan Hovold <johan@kernel.org>,
        Alex Elder <elder@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org
Date: Thu, 12 Feb 2026 09:43:43 -0500
Message-ID: <20260212144352.93043-6-damien.riegel@silabs.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260212144352.93043-1-damien.riegel@silabs.com>
References: <20260212144352.93043-1-damien.riegel@silabs.com>
X-ClientProxiedBy: YQBPR0101CA0124.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:5::27) To DS0PR11MB8205.namprd11.prod.outlook.com
 (2603:10b6:8:162::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8205:EE_|LV8PR11MB8486:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ad05212-ac26-435f-0858-08de6a452dc5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?UC9icHowYUZwRXF5SVM5SjJ6N2l0US8rVm5xVWUyK1JERVNUMnZ4Ukc4K0Vm?=
 =?utf-8?B?dE9VNTBmbkRpOUZraUhpQmFFektldlUyYVI2Yk1BVk5oV3djcE8vRkhFVURr?=
 =?utf-8?B?WlM0RTd4allTbndRc3V2bkZiK1Yvb2l3YlNsSFJrWTdJckRFVXpueXZXQkxs?=
 =?utf-8?B?Y2szOHVTVmRTQUxPMzdVNjVwQzU5eUlQVis0a2VkVHAwNE1EcU9VSEl6eWNE?=
 =?utf-8?B?Y1BvRzBiV0luTndhZjdDRzVVajZQd2dycGFzL0xodXUrZTZpZ2pVdEZpaTBS?=
 =?utf-8?B?U1RPNmNPNmhwS1FjZTdZeHc5VjVTY0FUK1QvUjNkYXQrayt0S0V4Sk9HR2R1?=
 =?utf-8?B?TVg2c3UyMWFUOWl0STZURVhSVFg2TDdxcTBySms2Qk9KOWNTd2hFV05Ba2pZ?=
 =?utf-8?B?VzhGbGN3bjZVOUFzbTlVZk44TklFR2J3eGF4cjh4N01vQWgvdW1GUWZrcXo2?=
 =?utf-8?B?aHZPaEtkRWphU0RjUDNhWDF0SGZmSlNXRTdkcDN6YTBHWUlEWlBmVHhtNTZU?=
 =?utf-8?B?dTdCVXVFYXZzYnc2ZXNpUVNRNnVhZU5ONElYeS9FMGRPSFViMWlTVjdpczU4?=
 =?utf-8?B?dXMydjUwY0dkdm5EcWxQTkhqVW5xQ2hoMEJydlJkWXUwZ1p3TWJoTWQrbzkv?=
 =?utf-8?B?Tzl3Ym4xNkdhOUNhUG1xNXhvZjdKYWlQWEVVaW5aY0Vad0MyRVYyTGNiQlBG?=
 =?utf-8?B?VGZ5YUt2OGI4elFWQ3R2WUh0Z3FScUpkZkljdmtJY3VHcjhoLzFnVjdxcWJn?=
 =?utf-8?B?Q0xxQXZaYmlYWldzeGJCWE1KT1UvSnpkMGt2VDJSdDRwRUFzeC9wQytNdU5W?=
 =?utf-8?B?L2QvaGhNcjY2OHF0dTIwRVl0a1ptcjBzSmZnd1JKQndqOHRWcThhREVucThF?=
 =?utf-8?B?Rm01bE9KOHJYVWwyeXpWanZ5c0E3WHJGaW55QUFkc2g5M1ZqYmFCNnR3Ym81?=
 =?utf-8?B?T3VnOFYvQytSQU9NczFaQTFUcUJXQjVQU0ExS201T21iTy8zNmpHeWdFaHAw?=
 =?utf-8?B?dlk3enRUdVVVSnQ5R2dPWi9vN2FpWnVhSDUwczcwV0MrUGNyTkg1Mytqazc5?=
 =?utf-8?B?QkNrT3pMTkJXZHdSWGxURG52UzFQMDRXN1cvTXloaTI3ZmlwNlhDUGhjYytY?=
 =?utf-8?B?R2ZJeXM3MXB4NjIzRGUwTnBlRkpnQ1o3bldVb3E3NDd2UlF3SHNab3hlMWxp?=
 =?utf-8?B?cS9LSFNIVW9IbXFPdVB4cXpFOU1uUmEyeVpHRFlFUFNyc0lpT1pObjlaZkpn?=
 =?utf-8?B?VHZ5aWwxa1F0WVJPSnRpblVMUWRHNnFPaHY4Y0kxVUVpZFNEaVJ2Nk1FNEEv?=
 =?utf-8?B?ZGhyRGhBOG5wcDcyVzdYK3BiMndJR3ZLUUEvZVYvREhGMk1FMDFYV0R1dHM3?=
 =?utf-8?B?WlRtR2tNTEtaTkFCaWRzVy83WTQ1S3FCVEtwM2ZQa2NSUEkzWk1uV1QvWXJw?=
 =?utf-8?B?ZStUaWhFR0psZFJwRGJQaTgzYUNnQzhiNU5sUnR1ZUFTZnYyYklXbjJCMm5j?=
 =?utf-8?B?K0hvZ0RKelorWVBiM2tnQVNLMXJGS0NMVFVKL3dYN2lEa3ZWMUtYem9VOVVV?=
 =?utf-8?B?WnBGWXd0TmVZOTk4R0hoTkxRaTZOd3BDOUVVbVJvNEk1RnB1VTJTRXFacU5i?=
 =?utf-8?B?b09OQlFhNXJXbFYxTlZPclVZd29VM0p6M3pRc0JmUnluYjZPeWJkb3J1aWNl?=
 =?utf-8?B?ZE5tb2I3aThkaFQ1UENzdXlrWXVmMzlJMzBLOWpVQXdPQVlZaGtXVnpsOG9W?=
 =?utf-8?B?ekU5aGIreTM1Mkk2S1hWd29GYm9FczNIbk1RWU4xd3dtUTZWK2Rnek5RclRS?=
 =?utf-8?B?RnpOT1JjZUx0QUtFUzE2NGFoK25WSnZ3MSsvOUhNZVlGV1M5K2FSL3A5YVA4?=
 =?utf-8?B?WnRhT09nUml3NzhqbUxieW1wL0RBekFkOERTNXlJQThtVjNZcktMU2VMS3V1?=
 =?utf-8?B?THMvNG4zbllRT3VIeVZnVVVmdjUwN094bFJOS08rdXJjaDJmOUdGblJtcFRL?=
 =?utf-8?B?ZkdlMisveXN2OWdCNUdORFloMXdhZXAyRUU5d25oYitSZDAxYTYrMEV0bkFh?=
 =?utf-8?B?SmRydFQycm5jc21KWlBrYW1Jei9tZFQ0aDlGbHg1ci9UR0RCQWFOSGllUlF1?=
 =?utf-8?B?cjY3WUhMSHF6bm5RS3FZaC9lcnNtd2pMYWVIN2Y3Q1ErMDI2eXpyajRQSjVu?=
 =?utf-8?Q?sKd8b+drBqrseMG9VC4pfAE=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8205.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dVU4dkJVQ2xzWXAzZUs3UHd6SDZJelRaWVV3WVdkUUoyZ1VoSXIyMzlvNWdN?=
 =?utf-8?B?MmZHZ29MN05mZ2ttaG9IM0FXWHJGUndzSTBFK3MwUVJtVnUwTGVNSHVRNEpl?=
 =?utf-8?B?NkU1ME94L2RPUzVOZGMvR1pMQzErbTFNUXV2ZG9CTG5wVDNaRWwvcEVFb2wr?=
 =?utf-8?B?UnJiWVNMaFFqK3FEYmxLSEZyVG93RCtQaC80K084aFY4aUVUT0ord0Y5SERQ?=
 =?utf-8?B?dXZlN2o3bkFGTnIvMXhISFY4bllHby82OFc4L3ZtcFV6UzFGb1JQWlFpS0Nz?=
 =?utf-8?B?Mng4RVAvbUJ6Nm9pSi8rbDhYdkdIeWNvSnJtR0tyanIrU0xCZXdsdmJmSFVL?=
 =?utf-8?B?UHZKaFpEZFJWZWV6ZXg3aGpmbzhwckNzMmkwb24rOFlBTzl2R0pXQkdwZUll?=
 =?utf-8?B?MXBhVlY1SDVyeGpYVkdKKzYrTmFUOStKQ2hOdGhXNVZIQzRNSDBTZ1V1bndV?=
 =?utf-8?B?aVdmR28vZ2hGNXA1dTYzYTlOcjduK08vcXMwTC94Z1hjQytzck5zWVJOY3lN?=
 =?utf-8?B?bjZWcUdrSnJ5YjNvVDdqVjBSY1lIZHRjSVo1SUUwcXRnUjUxNDJVUVNPendR?=
 =?utf-8?B?TG5kVzl3YnJXcCtXb1Z2MzkrcGhwNUNTTG93OHBjZEhuNVJtdDloYVVZc1BZ?=
 =?utf-8?B?SEVubUc0d0JJT3VJR2FYc2hndWkxZm8zYzNBaTR0aGZFYnNiRGNKb1NDMDk0?=
 =?utf-8?B?K0RuUVlJT0FZak9MQUFMam1hYVJKWFdkRTlMampScjBIbVdLYzlGYm1JT05K?=
 =?utf-8?B?alhLVlc0dHlPMmRpNDFXcldaSHRZYnM0b2lYWk1ZNHJiMGduNzVKUUp1alhC?=
 =?utf-8?B?NGVvMTRncDRZNlJEREtRTXR4bURBLzNvQ0RUZ2NTYWN3UjRXQjVMb0VtM3lD?=
 =?utf-8?B?cmRSZ21WdDl0cUM1NHk4TnZ5eXg0cDRxVXl2TnZiVHlHRnQ5eUxhb21wdlJz?=
 =?utf-8?B?eWFnV1ZDU3RIWU1QbExOUjVNeU1RakR4bGtHdk9DbHVSblFTM3ZYWXF3bWpv?=
 =?utf-8?B?eTZwemVOSzk0dDJGbUI4cU5jcTB6bFRKNm1uOXcxNnRXWkp3OXAvcWZrWktZ?=
 =?utf-8?B?Tlk4dFUyYyt1a1NuY2lKR3lOZi9FcUozVEZkRFJYci9UQTNxWVZCN1ljYkhG?=
 =?utf-8?B?Zi9ITXdWVmxHajBhQ1V2N2k3RUxBT1QrNnlhUXoweFVJMkd1d2k2cWtiRG9O?=
 =?utf-8?B?NXV1WlBFRmpJV1pHWS96NHFOS0dSUDlJZWcyWWJyUFlpSkdXci9FcFFGdXNE?=
 =?utf-8?B?bkVidHhvR1hFdHJ2R2R5Q3poVzlkMURxUlFNSjlKTkRzNVhRT0QvdDFTU0xS?=
 =?utf-8?B?NWJzUGdhOWRuYzJudGF0bWxiWjRjTUlXcHQyclJnYlhTMjF2bU5kcFM5dW0v?=
 =?utf-8?B?L3BCSzgrVjlMbTg4Tk43K0FFOVdLNnBrY2xXQ2Z5MCtyL0pOa0NhSUZtWW05?=
 =?utf-8?B?OFVGN0VqTXpxOW13aStOMXUwNG1rL1hucStEWjlxRDh5MHVPRTlVYk85WVV2?=
 =?utf-8?B?anBzREVURzZjcWF0NFFJNzZ3NVhKS0JlakJ3TWN3bjN2SVVDVU0xT3ExZjRR?=
 =?utf-8?B?WTEyd1BIYjRyWW9nek15ZFR0eHVJQVN6aDdVbHZ0Q3FybUJCNTM0SjFvb2tM?=
 =?utf-8?B?b1NFWmlEUWNxRzdHV0p4TzVQcXJ3SnVWUTRhRTlyNnBNZTlUSXFDcWFyUmsw?=
 =?utf-8?B?aE5nOWd5OGM3ZjVpWndVYnV1bDFTeTN6M2haYkc1dFh3Wk4yNk9hVkFWVm9X?=
 =?utf-8?B?dGc4YlhrNWpTbnByNVUzWHNWR0FYYVZyalBXUFZKaHM3bCtGN1dSV25wRUR5?=
 =?utf-8?B?MUVWTmZMQ3hMMk5EQzVhWDZDREJSTlJldUtDWVY3QTJqeVhYN0lzRUZTSkIy?=
 =?utf-8?B?YW5ldTBqcnZzeVZ0Z1liMktwNWlMZkxIdG1tZVkvaElOMUdsdjZjRks2bWlZ?=
 =?utf-8?B?OUJOK2h1UEN2YTFRUzRDamVXdFpQaWNINlF5TzBKNTE0a1QraGhvV1RGU1BR?=
 =?utf-8?B?NkRxd2wwVUV4emFBS245UXdhRHU4amhTcm93Q0gyVVlZUkIxVUEwMUt0M29i?=
 =?utf-8?B?VVJnbzFMUXpLaGdGcktta25GeEhBUVI2ZGJ1cmU2M0pFNHpTSldaYlRZOG5P?=
 =?utf-8?B?YVd5Qi9qeUloaUFPMzF6NCtIWHFaNm10SVNuNGpwdFpiWUcrYlhXcjFxM3pS?=
 =?utf-8?B?NHF4cW81ODhCbldHL0RoL1RPWWU4dzYyQ3hMMklZcDFjMVh6TTd0OTR1UHpW?=
 =?utf-8?B?RHVGSklta09SNnJkUEpFRGszamxqK1ZIczJnblU0MU5zMmNTMDRDaGgzZkM4?=
 =?utf-8?B?YnRYbHBldVcwYnB1OERqcU9kMnhpNUVtZXFmam43a0dKaW95bFlDdz09?=
X-OriginatorOrg: silabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ad05212-ac26-435f-0858-08de6a452dc5
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8205.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 14:44:08.7679
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 54dbd822-5231-4b20-944d-6f4abcd541fb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vIml8u1+W65odGbeDM1sza/O1ShYpB7vnEeiKjIHMoNY+HEXLaflD60EQXzke3jXM6xaWG+y+YsveIqzEPw9WQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8486
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEyMDExMSBTYWx0ZWRfX4xM0GxT7oYd2
 D/SU59hmlPG+F9JY62aMyHKbMmmtq1Nctv7mavVhpLbXRDKSExjQQ33FNH+OLQYVV9QTN7aAe8y
 a/pr8Rw006r41fXEnbL40XGK9DPY/02bkoJAP6XJYlW3978oCLgZ/PLLqqlZ4bgXKNdkZ3za/3k
 dUmH6Wt2brZRq85UYkwmD2n1pzIluxVtVWHf4tHX//mq4q1lsqhC4ACUrUFxkBvvPx9Np8h5/oW
 d/Y0rZDajXc8+o9i2UzSpLUvHgnln+7ke0LZt+Zi/HVy8+NIXojxVx5KKMfdgpVPiGBOy1+m+dS
 MkuSqdJUyntlC28VE+IHRpxU3iFgAJGwbbUzOls5aZkEUoUTlOswTczbjHDyLjAlyqMPHUoQRVt
 GnQUyE622vhvIWz0CuTLTkDF/tExnmRwin4JuuNSx0gV1UikBxAvpkn73KE/o/p5+/Fk7N+cp7F
 aMW/NqccEMfAy1CMX1A==
X-Authority-Analysis: v=2.4 cv=DtRbOW/+ c=1 sm=1 tr=0 ts=698de73c cx=c_pps
 a=TvliyZNEFSK35vtP2Nadqg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=M51BFTxLslgA:10
 a=i1IsUcr2s-wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=2AEO0YjSAAAA:8 a=9SkM2ZN-1AJx8s29AtcA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: xxEEKALBSLpQO2oL3m05149bjHhrEP8Z
X-Proofpoint-GUID: xxEEKALBSLpQO2oL3m05149bjHhrEP8Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_04,2026-02-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602120111
X-Spamd-Bar: ---
Message-ID-Hash: LY3DUMRG5UKTTLRXOKTDTOHX3QBQAVHY
X-Message-ID-Hash: LY3DUMRG5UKTTLRXOKTDTOHX3QBQAVHY
X-MailFrom: prvs=050394110d=damien.riegel@silabs.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Silicon Labs Kernel Team <linux-devel@silabs.com>, =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v3 05/14] greybus: cpc: switch RX path to socket buffers
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/LY3DUMRG5UKTTLRXOKTDTOHX3QBQAVHY/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.59 / 15.00];
	DMARC_POLICY_REJECT(2.00)[silabs.com : SPF not aligned (relaxed),reject];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	R_DKIM_REJECT(1.00)[silabs.com:s=pps12202023,silabs.com:s=selector1];
	MID_CONTAINS_FROM(1.00)[];
	R_SPF_ALLOW(-0.20)[+mx:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	GREYLIST(0.00)[pass,meta];
	FROM_NEQ_ENVFROM(0.00)[damien.riegel@silabs.com,greybus-dev-bounces@lists.linaro.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[silabs.com:-]
X-Rspamd-Queue-Id: 3658B12E735
X-Rspamd-Action: no action

Rm9yIHN5bW1ldHJ5LCBhbHNvIGNvbnZlcnQgdGhlIFJYIHBhdGggdG8gdXNlIHNvY2tldCBidWZm
ZXJzIGluc3RlYWQgb2YNCnU4KiBidWZmZXJzLiBCZWZvcmUgdGhpcyBjb21taXQgQ1BDIGhvc3Qg
ZGV2aWNlIGRyaXZlcnMgd2VyZSByZXNwb25zaWJsZQ0KZm9yIGFsbG9jYXRpbmcgYW5kIGZyZWVp
bmcgdGhlIGJ1ZmZlcnMuDQoNCk5vdyB0aGV5IGFyZSBvbmx5IHJlc3BvbnNpYmxlIGZvciBhbGxv
Y2F0aW5nIHRoZSBTS0JzIGFuZCBwYXNzIGl0IHRvIHRoZQ0KdXBwZXIgbGF5ZXIsIHRoZSBDUEMg
ImNvcmUiIG1vZHVsZSB3aWxsIHRha2Ugb2YgY29udmVydGluZyB0aGUgU0tCcyBpbnRvDQphIGJ1
ZmZlciB0aGF0IGNhbiBiZSBjb25zdW1lZCBieSBHcmV5YnVzJyBjb3JlIGFuZCByZWxlYXNpbmcg
dGhlIFNLQnMuDQoNClNpZ25lZC1vZmYtYnk6IERhbWllbiBSacOpZ2VsIDxkYW1pZW4ucmllZ2Vs
QHNpbGFicy5jb20+DQotLS0NCiBkcml2ZXJzL2dyZXlidXMvY3BjL2hvc3QuYyB8IDEzICsrKysr
KysrLS0tLS0NCiBkcml2ZXJzL2dyZXlidXMvY3BjL2hvc3QuaCB8ICAyICstDQogMiBmaWxlcyBj
aGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dyZXlidXMvY3BjL2hvc3QuYyBiL2RyaXZlcnMvZ3JleWJ1cy9jcGMvaG9zdC5jDQpp
bmRleCAxMGIwNTI5ZGM0ZS4uNjZjNGQ3ZmQwYjggMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dyZXli
dXMvY3BjL2hvc3QuYw0KKysrIGIvZHJpdmVycy9ncmV5YnVzL2NwYy9ob3N0LmMNCkBAIC0yMDks
MjAgKzIwOSwyMyBAQCB2b2lkIGNwY19oZF9tZXNzYWdlX3NlbnQoc3RydWN0IHNrX2J1ZmYgKnNr
YiwgaW50IHN0YXR1cykNCiB9DQogRVhQT1JUX1NZTUJPTF9HUEwoY3BjX2hkX21lc3NhZ2Vfc2Vu
dCk7DQogDQotdm9pZCBjcGNfaGRfcmN2ZChzdHJ1Y3QgY3BjX2hvc3RfZGV2aWNlICpjcGNfaGQs
IHU4ICpkYXRhLCBzaXplX3QgbGVuZ3RoKQ0KK3ZvaWQgY3BjX2hkX3JjdmQoc3RydWN0IGNwY19o
b3N0X2RldmljZSAqY3BjX2hkLCBzdHJ1Y3Qgc2tfYnVmZiAqc2tiKQ0KIHsNCiAJc3RydWN0IGdi
X29wZXJhdGlvbl9tc2dfaGRyICpnYl9oZHI7DQogCXUxNiBjcG9ydF9pZDsNCiANCiAJLyogUHJl
dmVudCBhbiBvdXQtb2YtYm91bmQgYWNjZXNzIGlmIGNhbGxlZCB3aXRoIG5vbi1zZW5zaWNhbCBw
YXJhbWV0ZXJzLiAqLw0KLQlpZiAoIWRhdGEgfHwgbGVuZ3RoIDwgc2l6ZW9mKCpnYl9oZHIpKQ0K
LQkJcmV0dXJuOw0KKwlpZiAoc2tiLT5sZW4gPCBzaXplb2YoKmdiX2hkcikpDQorCQlnb3RvIGZy
ZWVfc2tiOw0KIA0KIAkvKiBSZXRyaWV2ZSBjcG9ydCBJRCB0aGF0IHdhcyBwYWNrZWQgaW4gR3Jl
eWJ1cyBoZWFkZXIgKi8NCi0JZ2JfaGRyID0gKHN0cnVjdCBnYl9vcGVyYXRpb25fbXNnX2hkciAq
KWRhdGE7DQorCWdiX2hkciA9IChzdHJ1Y3QgZ2Jfb3BlcmF0aW9uX21zZ19oZHIgKilza2ItPmRh
dGE7DQogCWNwb3J0X2lkID0gY3BjX2Nwb3J0X3VucGFjayhnYl9oZHIpOw0KIA0KLQlncmV5YnVz
X2RhdGFfcmN2ZChjcGNfaGQtPmdiX2hkLCBjcG9ydF9pZCwgZGF0YSwgbGVuZ3RoKTsNCisJZ3Jl
eWJ1c19kYXRhX3JjdmQoY3BjX2hkLT5nYl9oZCwgY3BvcnRfaWQsIHNrYi0+ZGF0YSwgc2tiLT5s
ZW4pOw0KKw0KK2ZyZWVfc2tiOg0KKwlrZnJlZV9za2Ioc2tiKTsNCiB9DQogRVhQT1JUX1NZTUJP
TF9HUEwoY3BjX2hkX3JjdmQpOw0KIA0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3JleWJ1cy9jcGMv
aG9zdC5oIGIvZHJpdmVycy9ncmV5YnVzL2NwYy9ob3N0LmgNCmluZGV4IDJlNTY4YmFjNDRlLi5j
YzgzNWY1Mjk4YiAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3JleWJ1cy9jcGMvaG9zdC5oDQorKysg
Yi9kcml2ZXJzL2dyZXlidXMvY3BjL2hvc3QuaA0KQEAgLTQ1LDcgKzQ1LDcgQEAgc3RydWN0IGNw
Y19ob3N0X2RldmljZSAqY3BjX2hkX2NyZWF0ZShzdHJ1Y3QgY3BjX2hkX2RyaXZlciAqZHJpdmVy
LCBzdHJ1Y3QgZGV2aWMNCiBpbnQgY3BjX2hkX2FkZChzdHJ1Y3QgY3BjX2hvc3RfZGV2aWNlICpj
cGNfaGQpOw0KIHZvaWQgY3BjX2hkX3B1dChzdHJ1Y3QgY3BjX2hvc3RfZGV2aWNlICpjcGNfaGQp
Ow0KIHZvaWQgY3BjX2hkX2RlbChzdHJ1Y3QgY3BjX2hvc3RfZGV2aWNlICpjcGNfaGQpOw0KLXZv
aWQgY3BjX2hkX3JjdmQoc3RydWN0IGNwY19ob3N0X2RldmljZSAqY3BjX2hkLCB1OCAqZGF0YSwg
c2l6ZV90IGxlbmd0aCk7DQordm9pZCBjcGNfaGRfcmN2ZChzdHJ1Y3QgY3BjX2hvc3RfZGV2aWNl
ICpjcGNfaGQsIHN0cnVjdCBza19idWZmICpza2IpOw0KIHZvaWQgY3BjX2hkX21lc3NhZ2Vfc2Vu
dChzdHJ1Y3Qgc2tfYnVmZiAqc2tiLCBpbnQgc3RhdHVzKTsNCiANCiBpbnQgY3BjX2hkX3NlbmRf
c2tiKHN0cnVjdCBjcGNfaG9zdF9kZXZpY2UgKmNwY19oZCwgc3RydWN0IHNrX2J1ZmYgKnNrYik7
DQotLSANCjIuNTIuMA0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpncmV5YnVzLWRldiBtYWlsaW5nIGxpc3QgLS0gZ3JleWJ1cy1kZXZAbGlzdHMubGlu
YXJvLm9yZwpUbyB1bnN1YnNjcmliZSBzZW5kIGFuIGVtYWlsIHRvIGdyZXlidXMtZGV2LWxlYXZl
QGxpc3RzLmxpbmFyby5vcmcK
