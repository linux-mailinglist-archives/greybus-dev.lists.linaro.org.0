Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qEIUAW3njWkm8gAAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Thu, 12 Feb 2026 15:45:01 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ABFA12E6C5
	for <lists+greybus-dev@lfdr.de>; Thu, 12 Feb 2026 15:45:00 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id AF6C5401E3
	for <lists+greybus-dev@lfdr.de>; Thu, 12 Feb 2026 14:44:59 +0000 (UTC)
Received: from mx0a-0024c301.pphosted.com (mx0a-0024c301.pphosted.com [148.163.149.154])
	by lists.linaro.org (Postfix) with ESMTPS id 143E0401DA
	for <greybus-dev@lists.linaro.org>; Thu, 12 Feb 2026 14:44:20 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=silabs.com header.s=pps12202023 header.b="h/GoF+ai";
	dkim=pass header.d=silabs.com header.s=selector1 header.b=A105n2Gw;
	spf=pass (lists.linaro.org: domain of "prvs=050394110d=damien.riegel@silabs.com" designates 148.163.149.154 as permitted sender) smtp.mailfrom="prvs=050394110d=damien.riegel@silabs.com";
	arc=pass ("microsoft.com:s=arcselector10001:i=1");
	dmarc=pass (policy=reject) header.from=silabs.com
Received: from pps.filterd (m0101743.ppops.net [127.0.0.1])
	by mx0a-0024c301.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61C2Lwnc2678544;
	Thu, 12 Feb 2026 08:44:11 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps12202023;
	 bh=cdchD7Q2dNRnianSssDhwbWh041iL9CRGaxRW0yIxOs=; b=h/GoF+aiOHxY
	8WrNv0VWnXNbXUBScnPLO9comC/TbRmgq+4zInh5VHkBSdKZpCGp+tmzT4ILLo/C
	21TGsEKZTU4m52l2LUZcZklSd1mKjmRfMaSO9i1du//xy3C19Y4ihfehHgpwweQB
	OgT9wpdbPLK+7nJ8eph1XlNg1kWAEBe2gJ2XZtZU/mPLCJI0gU7tdyT7wkcJG0OF
	DofJVXXmax63yHryrY7hj/k2yOiDB15NiA6z7RGhovj3Mv/b93fA7FD4U+FJ+zq3
	PZ5Bakb3ZsCcM/i3qWFFDaEPeHhMAccwfYJtZfO24eUvsvu4fViViCjwY78bsjxC
	DTxpUC1hGg==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11020096.outbound.protection.outlook.com [52.101.61.96])
	by mx0a-0024c301.pphosted.com (PPS) with ESMTPS id 4c92uysn4e-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 12 Feb 2026 08:44:11 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qNG2q5tenEae7IRZx1utv75rH9s3DyIlCL9x6SmNS2XDX2Ds2WDMLS8GBTbd98DcOLX1vNkfAALBuLiKC55k7zEy15sEBECFScP4q8p8FCfvs+0YRVyqQBh+/OGJKUHAf9HjWtwjr4DIz83/9nlpaQhobl+o7np4LYmSsUwC/C0o9SOLmfL8yHkqiXWyHgPYpc4ecdd81Nmh6qjieVZwClsuabOneTJA81TX13qWOVG2oYTdqeXy/b6WRn8m79U6TXRvRmunYePRuPstLvaErPLuSUhxxZTDDTR0fjeAKD05OsvrwIYFkq9zLBBvJppi5fk496MrCC+A81/70flrUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cdchD7Q2dNRnianSssDhwbWh041iL9CRGaxRW0yIxOs=;
 b=HSE1T5rmYUBToCy5MPexwDGlTMNmKM5C8c5DKhViHwjILF5z/9WuySKbb/vjGnDl0wBCHRkIeHjQJFT7at4YzrGoe5/ZjB5L2ESsbmaHAqn1t/UIQmABnFVloa3JN1jHLmoeuYCue6WOISNbrtHJsQCWtNmC7gVVxXHDX4hhhiKbZ0uwvEGEt31LMmP2EgkB9dglYbmHZuSuJqMXLXVExuqsX6owWICvWVg+igDKRp5W0DE7x9QuDnuqN4bTxRQEwH8yJSzlceAFIx3mkeA1elYSsg8ajRQPl4bixifRzFepj2BUCrgBu5Yc7A2MzIHUg3ueE1W/h7Jz2dG9wpo9lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silabs.com; dmarc=pass action=none header.from=silabs.com;
 dkim=pass header.d=silabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cdchD7Q2dNRnianSssDhwbWh041iL9CRGaxRW0yIxOs=;
 b=A105n2GwuyxNzbzQvwYjHvG8keLD9iIGRbCdn6nb5X4+ae9BsfRfzK2ST9WKMFZ5cZC8A9WNhc/K/0rIf/RWiL+qtT/N4VIBbEWzSIpuwFfc2pKeM2tndJijk5nUPo0hZXyGDsO0D3kJTsbPl78qk+cTfEnOUzWMK31DY+h9MAE=
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
Date: Thu, 12 Feb 2026 09:43:42 -0500
Message-ID: <20260212144352.93043-5-damien.riegel@silabs.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260212144352.93043-1-damien.riegel@silabs.com>
References: <20260212144352.93043-1-damien.riegel@silabs.com>
X-ClientProxiedBy: YQBPR0101CA0124.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:5::27) To DS0PR11MB8205.namprd11.prod.outlook.com
 (2603:10b6:8:162::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8205:EE_|LV8PR11MB8486:EE_
X-MS-Office365-Filtering-Correlation-Id: faf14620-eb8d-4aae-a483-08de6a452d55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?S1B5RDJBdkYwWXF6WWtaQmk3RFBoVVJyQThxSERyK2c5SkJQQW1wR3gzY1NQ?=
 =?utf-8?B?RVJ6aVY4a042N2RvaXVxRmNzZVNrOFkvUWoveHBEQ0prQTRPaDJNVkpMZzJ1?=
 =?utf-8?B?dWJ0THZTWlljN3pjNE9raVpOOG9wRHJnVmh4RHJLQ1dsdjcyYm1NNXdBcjlX?=
 =?utf-8?B?U0d0OWdKSE4vTjVyTk1SUkZseTYvcTdkQ0FtTlAvY2NoSkJldkFBblJnWWFW?=
 =?utf-8?B?R09tK0xTQ1c0K2ZoNElDNmFHcHVWSDlhMUg1akJZVHl0cUtpSi83UjBaaWZN?=
 =?utf-8?B?N1pFMU91ckU4TDEvUCtsVWkrVWFhOGhwbEhLSGFCSXU3TnB0Nktnd0ZsVnNk?=
 =?utf-8?B?RFdkMGZlTzJMNEZFaTd3YTZLUXlYcS9jNzFZbGcxU2toM1h1UHFYWDVtYktI?=
 =?utf-8?B?RHNlSUx4SGVSa0hmM1BzaURNTVFEWjc0aDhCRFlFbms5WU91MGNBVnpUZDJk?=
 =?utf-8?B?QUkxZ1JkM1NoajFpTTRlM2gzd1hGTWlud1oxQTBaakg4bjBWTlg3U2xMbnZm?=
 =?utf-8?B?WnJBM3N5czZVUC9sNDJXUEN6djNZelFLWk4yb2M0ODlValdFZzVNVkRxZ0lN?=
 =?utf-8?B?UFkvZWFoZ0NzNHFqUVZkQUl2Q2RlU2NlcnJhdGdBc25QeUc1c1JsN21tSDFB?=
 =?utf-8?B?RUpsVkN2QkVGeWVxWUNXdEx2QUcyZ21Kb0ZPNlk5Y2ZxcERqRWZBVlhZWGxF?=
 =?utf-8?B?Y0xQU1RWZkppZ3JwMENIZjQ0MVdhbWx0MTY0ZDFydHl6NG1WWGN4TmcwOVYy?=
 =?utf-8?B?Syt2Q0pudWU3OVhVR2s3UzRrL1dRQmQrZUdPVlFFQkEwYlB3aHloTnVPWm5z?=
 =?utf-8?B?RlJ1MXB1RWUvNXE0cnBxYjNDTUwwd2xMaHV6dG91bW5JMmZkck5uNkFteTBh?=
 =?utf-8?B?ZDJwV0FoU0VVZ01tUkxwSW9kS01qalQyWDZrSUFtVlBwQ0NYOVhKRjRIcTVo?=
 =?utf-8?B?U1cvY1NZKzd4cU9CRUZLSHZSMFRDbENZK0tDSnZvc253QjE3clVSeWxHWURu?=
 =?utf-8?B?emgzSEZ0Z3FrWm9tZDYwU0V3eHp0U2dUNWRjSU1BeSthYXdOQUQzNkw1ZDli?=
 =?utf-8?B?QVNZNFp3WDVYZE1RUGVQL3NRa1ozUHFPVkJpTWN0MkhnU2tPSG95UlYybHh4?=
 =?utf-8?B?VSttbUVzQlVQczNBeTFRZ2F0L1JBeitnMEVtaVYwS0JDWDMrek1oeXNpME5m?=
 =?utf-8?B?SXRDU05Dd05URS9Wc1VpZ0JHVjArbk50UUpxNXljTXhTd3VIMTM2ZG9wMC9O?=
 =?utf-8?B?cjZkOTdsbHp2S3cwK2o3N1dHTDVqQmd2L1FpbDBaWWE5TkhBSU1lQksyWUp0?=
 =?utf-8?B?aHBWeC9Mbk5wQmF6Nlk2ZHVPbUxnZFJFRVFNZ21oSllVOVlweERwRVhGMHV1?=
 =?utf-8?B?Yk9COW02cEVLVE9oSGFReHJpQUpQOUlKTCtmSkQ4bzNuQS9KSVRvNCs2RUNF?=
 =?utf-8?B?a3ZjeEFYMUlWZlNhdzZMbkJWRzlwaklJTG1vMUtwdTcvVGhKdVljMm1LYmZG?=
 =?utf-8?B?WHBISGR3MU5US05meXZxOEREOEUrbG5VT3BhbG9wWXNHOGxTbS9pcEhTWUw4?=
 =?utf-8?B?NENVMUpCaUt3K3lsV3Y2Q2VqQlZ6a0RCcjFTb0hINzY4OEhkRHQrUDY1b3Ux?=
 =?utf-8?B?RjdzOG0wL0VTbjZySGo3eFhXQTFkaGpXUThDQ0pPbWRRSzdDWHhjQ3VnZjht?=
 =?utf-8?B?N29xeGFpVjJRRGNodnZ0SzBkbmU0RTk1dXd6dDlaaTROM014Qkh1alRkQVlT?=
 =?utf-8?B?dzZ2V0NVdkFRdlJMVVVOcGxHN2l3SWdlMnRjazZnUVQ5eTNwd3Z5L2swd1Av?=
 =?utf-8?B?aWxNMElEZVNOWUhydThIQUU0V3RLK2VPUkNhQ3ZKWUN5M1FlS3BaeTVZRWZF?=
 =?utf-8?B?endLV2V4MGFhcXNsVnVxT29LU0VHKzlXK2M4clA5elh1WFNJdmNBeGpOa0Zq?=
 =?utf-8?B?OGdFYVN0QWlpajloZnVXamt6UU5obDR0enRVaFN5QU80RE00MVZMVHE2Rjl4?=
 =?utf-8?B?cE9VcEpDeEhFRUVqQzBNc0ZITi9Ka3ZWa3A0S3FJUllmbTU2bDh4VDAwRjJl?=
 =?utf-8?B?amUxMTVXRTZveDMrQUM5WjRzY3NidUo2a0k4aEJaZmNYR3JnY0ZXYU1hZHRa?=
 =?utf-8?B?YjMxMnNuQW5BZUlPRmRscVR3S3htWWo3NmlreGQzK2Uwb0hjRHBjYlI3SGhn?=
 =?utf-8?Q?/+RGjmd/col/mlDDdGx+wGY=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8205.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?OGtra3Z2Q1ExT1MrUGJWL0FzM0F6czZHTVVYdjdLK1VmYkhTQ3JkMHdjd3Fv?=
 =?utf-8?B?UUtQYU4rUkkwalVFVzZ5aFV5SzRGNHoydWVMdWVjR3dNN0pXRjJKYVBkL3pv?=
 =?utf-8?B?UEF6UWcyUnpSK3ZmR3lrVXV3ZnNVM25CYmMwZzFHYVpDU3RMM3hjcWk0Rnpk?=
 =?utf-8?B?bTNBZTB3MkthZ3ZOd2h5WmtzTENzQ28yZG9LU1pxNmorQUNPekZ5TndKa29n?=
 =?utf-8?B?alM0S2NkTktIdWNiNFA2WFRUQzRFV21XenFuNUtzTTVqMHpGMFVQNjB4K29E?=
 =?utf-8?B?OHdPaVRxcGlqK3NheGVSNjFCMFMrVWtFcGVaRlhoUGJpQ0hCYzdQMUs2Vldk?=
 =?utf-8?B?TkV3bXlaS0ozMTUzMnkrTEwyZGRSb1RiVGhIMXJidlkvdlUyeHVFWnRta1VV?=
 =?utf-8?B?N0h0UjRabHQzVWtDTmJsUndLL2hPaXJXWGo4Yi9KL0VhelVpYWJtS1dRWGV5?=
 =?utf-8?B?TmY4cDFBL0cxcG5pN0ZZRCtrLzc5a0x6aXkxNUtGOWVyQjBVL2xjQ1YyMUli?=
 =?utf-8?B?MU9qazNyZW50eWJSNXdxdUsvTjJ2RnRhcEFUb2t4bzdpZThleDVIRHlSN0xr?=
 =?utf-8?B?bmxzSDk3YkhoSzFYL1czWXI2Z1RYaHFTZXN5MTRJSnhCNUxyZzl3c2RGcHBN?=
 =?utf-8?B?TGJiWHdSLzZYYnpLYVgzMUpaUnlMSkFhSmR5T1JYSDNSUnNJTGdWSzY3dkN4?=
 =?utf-8?B?d0J4cmdKdExEeUdVMmoxM0pwaThzbEdBUnNCanB3OHBObVJjQTBESHdPRlRi?=
 =?utf-8?B?ai9vTSs0SXBOUGwxa0tUcU9iZ3VkT29nTTdZY2JlUWJSK0JrUlp3Q1JZOGpG?=
 =?utf-8?B?UlZTVGVFREF4QzFBTXZRRWdxRkFYTmJONFVmZkZJbllhbVR5Ykw5Zjc2MXg3?=
 =?utf-8?B?WFIrMU1GdVg4b2FoSWt0bXQwYnpLbm52VWlWZ1pjRTIvK1U5Q3dIUWwxRHht?=
 =?utf-8?B?WVlWdU81VzZrdEZGZ2lnaFdLY3BhREV2UGIzOG8wd2NOOVlxSjV0S01jSGZN?=
 =?utf-8?B?ZHRGOVYwdTk3V3pQeHBpK3dQYTNJNWlvRmRLOGUrbjhQcVErUVFVS0ZKTzFR?=
 =?utf-8?B?NUcwRlBWajJvV0xCc20xQVJGeVRrVSsybStwMWJSUDlPZzN1Zi82Mk4vajlE?=
 =?utf-8?B?RjFpL28xZDcyaElXZmtnRG11ZlQzT09HZTlyTFVMNWMrSjdPUmh1VDc3MzNO?=
 =?utf-8?B?WHdQNmJqdW0yaVlIVnZhbzI0M0hSZUd4bGdkYVpGTkV2dmVRaFdjNmE3U2pD?=
 =?utf-8?B?TmJNQXhPT2ZaZmJFQUd1MXNjOS9uWjZFUEI4d1JGZHZKbmdWdVZ6bGFTSURP?=
 =?utf-8?B?N2h0eFNLV2czT3FNZ0gzZEVnZXRZSkRyWlQ0ZzREUHdhR1ovakRwZEtyd0lv?=
 =?utf-8?B?QzQ0d0l0NCtZSnhOek1JZVJ2VkVvUUNNeFZKVTdYYVRLNXdsbm5GZG56Vkp6?=
 =?utf-8?B?c0dZemx6ZlA5bFJkT2t1UUlYUGZwaGkrazh4KytVQXh5S1ZodFNOSUFUZnJt?=
 =?utf-8?B?L0xlUElDV1FDc3cwSFZzQ3lSRk80QW1nV1E2SEpZRHl0WkF6Y3d5T2dBOExV?=
 =?utf-8?B?TXUzTFNyeitSelB3ZDBtRHFBOEdET1NuazFQRHhXdkR3eEl2MDlZV2dMNEE3?=
 =?utf-8?B?cVpoeksxaE9pNlU1VXpFMytxVXB3cTBlTE1Kblg0d3A2QnJndDFNWjBsWmhu?=
 =?utf-8?B?eFowTCt4eVRNeHFmRWFtWEpxcW84WWpTa25YZDM0S3YrYW1LTVhnK1AvdHkz?=
 =?utf-8?B?L1c1SzdBTmxXOURHdCttR3VSaG5RSEVHZVh1cXg0Rm1XREowVUlCMzVVd3hW?=
 =?utf-8?B?b2ZOR2xJZjNEVkFJM00vSW5xQXZiNVI2M3hiS3IwbkQ5bHR4QkIwOWFpS0hD?=
 =?utf-8?B?a1NLUExqRlg2OVhtM0lSbUZJaEtxd2VUa0xXcWNYN29nTVVPYjY5dTFTdGNu?=
 =?utf-8?B?dGRwM1F1Q0p1ZUlRMzlPZXlwWHZ0YVhlc3NaU0M2N2Qxajh6U1dhamdZSkRM?=
 =?utf-8?B?NjZnY2NvYzAwNFdiV0Zxd1JIV2xtQitqNkRHNjNJaFZianp2bmNXWTBUYW9m?=
 =?utf-8?B?d29Bb0RCSXRlKzhXaHNRTTZESE5lWXpHVXUxdVl3MUwrYmRmek9hYWZjYk02?=
 =?utf-8?B?NS95TXB5d3BmRHF1YXVWNEZ6d0xZWmdZWldUUzEwYTYwTk9CTGRGWlE3L2Z4?=
 =?utf-8?B?S2k3MHFjNHp6UG9PdFdaQ3J1ZXdkZVNIVmdxVktEcC9CS0ZrMzVvSC9zSkVB?=
 =?utf-8?B?bndCUjFOTXlTMWhnNHpEWW1jV0wwV0cyNkVWZ1NsMlhKR2g1T2hTSDVJb3dB?=
 =?utf-8?B?bGhVMEFDOUo5VzFjWnIzd2dDbHpjL0JBcEZVWURzUWV0V0ZxQm8zQT09?=
X-OriginatorOrg: silabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: faf14620-eb8d-4aae-a483-08de6a452d55
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8205.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 14:44:08.0373
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 54dbd822-5231-4b20-944d-6f4abcd541fb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JGybtq7kHO9qPCIuSxHoSVdTPWRDsiXlgzcQompZEMaCNN3cvEhNu1gsdLBhAfAZz6RlCz7Bm7b6kUgop0Yo2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8486
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEyMDExMSBTYWx0ZWRfX9SNJcX5Jc/Cs
 AjL4XvPKanDZZXaIVPTK6/8emBgxFPFF2WDFe7V31Yz4JSH1orn/1SWEy4OlzwCoG1o6ne52w2W
 WqGZJVpD16AGD08dFTgl4lDf/z3HGg7XKmcacCQEQt7lS5lOkmMZWf60sXbHr/pzCCl0SAOra4v
 ucxD2FitvqwfWS3sFh5yEXuweLVjJGlwJwenoxPI4siZhuDhDHza/aq90UYZQL5xuNekBAwXYRn
 53NM6LHJKy/3+cgJwcVWDKXG1bXVZjeRoZuKDsTMC7odJCfVv7b82PXCkQZAYuGrNxrxsezEHhO
 wxv9kTD+dYN33CIhuUOJqmpCG8qHzC6Ld357CqgNf1T4xnqcs4jIuuJHj7dEO0IqQI1dn0zz23S
 ZgTXg+aFXljZZ1b78V0+hMyxqHWfFal8tuaCVUwOfG4C55FxPePtyMVgxqVWSeaIZWqZpYdn/He
 jMdRuRl7F3XEtgQdYbw==
X-Authority-Analysis: v=2.4 cv=DtRbOW/+ c=1 sm=1 tr=0 ts=698de73b cx=c_pps
 a=TvliyZNEFSK35vtP2Nadqg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=M51BFTxLslgA:10
 a=i1IsUcr2s-wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=2AEO0YjSAAAA:8 a=bWPpxp-jgQ3ylSns5SMA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: Ks7WpJDEbqcxPJR1QkFEs1oSfbjPIfX7
X-Proofpoint-GUID: Ks7WpJDEbqcxPJR1QkFEs1oSfbjPIfX7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_04,2026-02-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602120111
X-Spamd-Bar: ----
Message-ID-Hash: B7LBD5RXBOA2QZURVBE5IFZ7FJ45MWUC
X-Message-ID-Hash: B7LBD5RXBOA2QZURVBE5IFZ7FJ45MWUC
X-MailFrom: prvs=050394110d=damien.riegel@silabs.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Silicon Labs Kernel Team <linux-devel@silabs.com>, =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v3 04/14] greybus: cpc: pack cport ID in Greybus header
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/B7LBD5RXBOA2QZURVBE5IFZ7FJ45MWUC/>
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
X-Rspamd-Queue-Id: 9ABFA12E6C5
X-Rspamd-Action: no action

VGFrZSBhZHZhbnRhZ2Ugb2YgdGhlIHBhZGRpbmcgYnl0ZXMgcHJlc2VudCBpbiB0aGUgR3JleWJ1
cyBoZWFkZXIgdG8NCnN0b3JlIHRoZSBDUG9ydCBJRCBhbmQgbWluaW1pemUgb3ZlcmhlYWQuIFRo
aXMgdGVjaG5pcXVlIGlzIGFscmVhZHkgdXNlZA0KYnkgdGhlIGVzMiBkcml2ZXIuDQoNClNpZ25l
ZC1vZmYtYnk6IERhbWllbiBSacOpZ2VsIDxkYW1pZW4ucmllZ2VsQHNpbGFicy5jb20+DQotLS0N
CkNoYW5nZXMgaW4gdjI6DQogIC0gY2xlYXIgcGFkIGJ5dGVzIHdoZW4gdW5wYWNraW5nIENQb3J0
IElEDQoNCiBkcml2ZXJzL2dyZXlidXMvY3BjL2NwYy5oICAgfCAgMyArKysNCiBkcml2ZXJzL2dy
ZXlidXMvY3BjL2Nwb3J0LmMgfCAzNCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
DQogZHJpdmVycy9ncmV5YnVzL2NwYy9ob3N0LmMgIHwgMTMgKysrKysrKysrKysrLQ0KIGRyaXZl
cnMvZ3JleWJ1cy9jcGMvaG9zdC5oICB8ICAyICstDQogNCBmaWxlcyBjaGFuZ2VkLCA1MCBpbnNl
cnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncmV5YnVz
L2NwYy9jcGMuaCBiL2RyaXZlcnMvZ3JleWJ1cy9jcGMvY3BjLmgNCmluZGV4IGQ5ZjhmNjA5MTNh
Li42MjU5Nzk1NzgxNCAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3JleWJ1cy9jcGMvY3BjLmgNCisr
KyBiL2RyaXZlcnMvZ3JleWJ1cy9jcGMvY3BjLmgNCkBAIC0yNCw2ICsyNCw5IEBAIHN0cnVjdCBj
cGNfY3BvcnQgew0KIHN0cnVjdCBjcGNfY3BvcnQgKmNwY19jcG9ydF9hbGxvYyh1MTYgY3BvcnRf
aWQsIGdmcF90IGdmcF9tYXNrKTsNCiB2b2lkIGNwY19jcG9ydF9yZWxlYXNlKHN0cnVjdCBjcGNf
Y3BvcnQgKmNwb3J0KTsNCiANCit2b2lkIGNwY19jcG9ydF9wYWNrKHN0cnVjdCBnYl9vcGVyYXRp
b25fbXNnX2hkciAqZ2JfaGRyLCB1MTYgY3BvcnRfaWQpOw0KK3UxNiBjcGNfY3BvcnRfdW5wYWNr
KHN0cnVjdCBnYl9vcGVyYXRpb25fbXNnX2hkciAqZ2JfaGRyKTsNCisNCiBpbnQgY3BjX2Nwb3J0
X3RyYW5zbWl0KHN0cnVjdCBjcGNfY3BvcnQgKmNwb3J0LCBzdHJ1Y3Qgc2tfYnVmZiAqc2tiKTsN
CiANCiBzdHJ1Y3QgY3BjX3NrYl9jYiB7DQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncmV5YnVzL2Nw
Yy9jcG9ydC5jIGIvZHJpdmVycy9ncmV5YnVzL2NwYy9jcG9ydC5jDQppbmRleCBlZDBiOGU4YjBk
Ny4uMmM3M2Q4ZTcyNGUgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dyZXlidXMvY3BjL2Nwb3J0LmMN
CisrKyBiL2RyaXZlcnMvZ3JleWJ1cy9jcGMvY3BvcnQuYw0KQEAgLTMsNiArMyw5IEBADQogICog
Q29weXJpZ2h0IChjKSAyMDI1LCBTaWxpY29uIExhYm9yYXRvcmllcywgSW5jLg0KICAqLw0KIA0K
KyNpbmNsdWRlIDxsaW51eC91bmFsaWduZWQuaD4NCisjaW5jbHVkZSA8bGludXgvc2tidWZmLmg+
DQorDQogI2luY2x1ZGUgImNwYy5oIg0KICNpbmNsdWRlICJob3N0LmgiDQogDQpAQCAtMzEsNiAr
MzQsMzIgQEAgdm9pZCBjcGNfY3BvcnRfcmVsZWFzZShzdHJ1Y3QgY3BjX2Nwb3J0ICpjcG9ydCkN
CiAJa2ZyZWUoY3BvcnQpOw0KIH0NCiANCisvKioNCisgKiBjcGNfY3BvcnRfcGFjaygpIC0gUGFj
ayBDUG9ydCBJRCBpbnRvIEdyZXlidXMgT3BlcmF0aW9uIE1lc3NhZ2UgaGVhZGVyLg0KKyAqIEBn
Yl9oZHI6IEdyZXlidXMgb3BlcmF0aW9uIG1lc3NhZ2UgaGVhZGVyLg0KKyAqIEBjcG9ydF9pZDog
Q1BvcnQgSUQgdG8gcGFjay4NCisgKi8NCit2b2lkIGNwY19jcG9ydF9wYWNrKHN0cnVjdCBnYl9v
cGVyYXRpb25fbXNnX2hkciAqZ2JfaGRyLCB1MTYgY3BvcnRfaWQpDQorew0KKwlwdXRfdW5hbGln
bmVkX2xlMTYoY3BvcnRfaWQsIGdiX2hkci0+cGFkKTsNCit9DQorDQorLyoqDQorICogY3BjX2Nw
b3J0X3VucGFjaygpIC0gVW5wYWNrIENQb3J0IElEIGZyb20gR3JleWJ1cyBPcGVyYXRpb24gTWVz
c2FnZSBoZWFkZXIuDQorICogQGdiX2hkcjogR3JleWJ1cyBvcGVyYXRpb24gbWVzc2FnZSBoZWFk
ZXIuDQorICoNCisgKiBSZXR1cm46IENQb3J0IElEIHBhY2tlZCBpbiB0aGUgaGVhZGVyLg0KKyAq
Lw0KK3UxNiBjcGNfY3BvcnRfdW5wYWNrKHN0cnVjdCBnYl9vcGVyYXRpb25fbXNnX2hkciAqZ2Jf
aGRyKQ0KK3sNCisJdTE2IGNwb3J0X2lkID0gZ2V0X3VuYWxpZ25lZF9sZTE2KGdiX2hkci0+cGFk
KTsNCisNCisJLy8gQ2xlYXIgcGFkZGluZyBieXRlcw0KKwlwdXRfdW5hbGlnbmVkX2xlMTYoMCwg
Z2JfaGRyLT5wYWQpOw0KKw0KKwlyZXR1cm4gY3BvcnRfaWQ7DQorfQ0KKw0KIC8qKg0KICAqIGNw
Y19jcG9ydF90cmFuc21pdCgpIC0gVHJhbnNtaXQgc2tiIG92ZXIgY3BvcnQuDQogICogQGNwb3J0
OiBjcG9ydC4NCkBAIC0zOSw2ICs2OCwxMSBAQCB2b2lkIGNwY19jcG9ydF9yZWxlYXNlKHN0cnVj
dCBjcGNfY3BvcnQgKmNwb3J0KQ0KIGludCBjcGNfY3BvcnRfdHJhbnNtaXQoc3RydWN0IGNwY19j
cG9ydCAqY3BvcnQsIHN0cnVjdCBza19idWZmICpza2IpDQogew0KIAlzdHJ1Y3QgY3BjX2hvc3Rf
ZGV2aWNlICpjcGNfaGQgPSBjcG9ydC0+Y3BjX2hkOw0KKwlzdHJ1Y3QgZ2Jfb3BlcmF0aW9uX21z
Z19oZHIgKmdiX2hkcjsNCisNCisJLyogSW5qZWN0IGNwb3J0IElEIGluIEdyZXlidXMgaGVhZGVy
ICovDQorCWdiX2hkciA9IChzdHJ1Y3QgZ2Jfb3BlcmF0aW9uX21zZ19oZHIgKilza2ItPmRhdGE7
DQorCWNwY19jcG9ydF9wYWNrKGdiX2hkciwgY3BvcnQtPmlkKTsNCiANCiAJcmV0dXJuIGNwY19o
ZF9zZW5kX3NrYihjcGNfaGQsIHNrYik7DQogfQ0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3JleWJ1
cy9jcGMvaG9zdC5jIGIvZHJpdmVycy9ncmV5YnVzL2NwYy9ob3N0LmMNCmluZGV4IGEzYWNmYzli
ZmNhLi4xMGIwNTI5ZGM0ZSAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3JleWJ1cy9jcGMvaG9zdC5j
DQorKysgYi9kcml2ZXJzL2dyZXlidXMvY3BjL2hvc3QuYw0KQEAgLTIwOSw4ICsyMDksMTkgQEAg
dm9pZCBjcGNfaGRfbWVzc2FnZV9zZW50KHN0cnVjdCBza19idWZmICpza2IsIGludCBzdGF0dXMp
DQogfQ0KIEVYUE9SVF9TWU1CT0xfR1BMKGNwY19oZF9tZXNzYWdlX3NlbnQpOw0KIA0KLXZvaWQg
Y3BjX2hkX3JjdmQoc3RydWN0IGNwY19ob3N0X2RldmljZSAqY3BjX2hkLCB1MTYgY3BvcnRfaWQs
IHU4ICpkYXRhLCBzaXplX3QgbGVuZ3RoKQ0KK3ZvaWQgY3BjX2hkX3JjdmQoc3RydWN0IGNwY19o
b3N0X2RldmljZSAqY3BjX2hkLCB1OCAqZGF0YSwgc2l6ZV90IGxlbmd0aCkNCiB7DQorCXN0cnVj
dCBnYl9vcGVyYXRpb25fbXNnX2hkciAqZ2JfaGRyOw0KKwl1MTYgY3BvcnRfaWQ7DQorDQorCS8q
IFByZXZlbnQgYW4gb3V0LW9mLWJvdW5kIGFjY2VzcyBpZiBjYWxsZWQgd2l0aCBub24tc2Vuc2lj
YWwgcGFyYW1ldGVycy4gKi8NCisJaWYgKCFkYXRhIHx8IGxlbmd0aCA8IHNpemVvZigqZ2JfaGRy
KSkNCisJCXJldHVybjsNCisNCisJLyogUmV0cmlldmUgY3BvcnQgSUQgdGhhdCB3YXMgcGFja2Vk
IGluIEdyZXlidXMgaGVhZGVyICovDQorCWdiX2hkciA9IChzdHJ1Y3QgZ2Jfb3BlcmF0aW9uX21z
Z19oZHIgKilkYXRhOw0KKwljcG9ydF9pZCA9IGNwY19jcG9ydF91bnBhY2soZ2JfaGRyKTsNCisN
CiAJZ3JleWJ1c19kYXRhX3JjdmQoY3BjX2hkLT5nYl9oZCwgY3BvcnRfaWQsIGRhdGEsIGxlbmd0
aCk7DQogfQ0KIEVYUE9SVF9TWU1CT0xfR1BMKGNwY19oZF9yY3ZkKTsNCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dyZXlidXMvY3BjL2hvc3QuaCBiL2RyaXZlcnMvZ3JleWJ1cy9jcGMvaG9zdC5oDQpp
bmRleCAxOTFiNWUzOTRhNi4uMmU1NjhiYWM0NGUgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dyZXli
dXMvY3BjL2hvc3QuaA0KKysrIGIvZHJpdmVycy9ncmV5YnVzL2NwYy9ob3N0LmgNCkBAIC00NSw3
ICs0NSw3IEBAIHN0cnVjdCBjcGNfaG9zdF9kZXZpY2UgKmNwY19oZF9jcmVhdGUoc3RydWN0IGNw
Y19oZF9kcml2ZXIgKmRyaXZlciwgc3RydWN0IGRldmljDQogaW50IGNwY19oZF9hZGQoc3RydWN0
IGNwY19ob3N0X2RldmljZSAqY3BjX2hkKTsNCiB2b2lkIGNwY19oZF9wdXQoc3RydWN0IGNwY19o
b3N0X2RldmljZSAqY3BjX2hkKTsNCiB2b2lkIGNwY19oZF9kZWwoc3RydWN0IGNwY19ob3N0X2Rl
dmljZSAqY3BjX2hkKTsNCi12b2lkIGNwY19oZF9yY3ZkKHN0cnVjdCBjcGNfaG9zdF9kZXZpY2Ug
KmNwY19oZCwgdTE2IGNwb3J0X2lkLCB1OCAqZGF0YSwgc2l6ZV90IGxlbmd0aCk7DQordm9pZCBj
cGNfaGRfcmN2ZChzdHJ1Y3QgY3BjX2hvc3RfZGV2aWNlICpjcGNfaGQsIHU4ICpkYXRhLCBzaXpl
X3QgbGVuZ3RoKTsNCiB2b2lkIGNwY19oZF9tZXNzYWdlX3NlbnQoc3RydWN0IHNrX2J1ZmYgKnNr
YiwgaW50IHN0YXR1cyk7DQogDQogaW50IGNwY19oZF9zZW5kX3NrYihzdHJ1Y3QgY3BjX2hvc3Rf
ZGV2aWNlICpjcGNfaGQsIHN0cnVjdCBza19idWZmICpza2IpOw0KLS0gDQoyLjUyLjANCg0KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1kZXYg
bWFpbGluZyBsaXN0IC0tIGdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKVG8gdW5zdWJzY3Jp
YmUgc2VuZCBhbiBlbWFpbCB0byBncmV5YnVzLWRldi1sZWF2ZUBsaXN0cy5saW5hcm8ub3JnCg==
