Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id CD0CCCD7E25
	for <lists+greybus-dev@lfdr.de>; Tue, 23 Dec 2025 03:38:08 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 86A0F3F76D
	for <lists+greybus-dev@lfdr.de>; Tue, 23 Dec 2025 02:38:07 +0000 (UTC)
Received: from mx0b-0024c301.pphosted.com (mx0b-0024c301.pphosted.com [148.163.153.153])
	by lists.linaro.org (Postfix) with ESMTPS id 423BB3F76D
	for <greybus-dev@lists.linaro.org>; Tue, 23 Dec 2025 02:38:04 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=silabs.com header.s=pps12202023 header.b=yaZDDgK9;
	dkim=pass header.d=silabs.com header.s=selector1 header.b=AYqBu+Y9;
	spf=pass (lists.linaro.org: domain of Damien.Riegel@silabs.com designates 148.163.153.153 as permitted sender) smtp.mailfrom=Damien.Riegel@silabs.com;
	dmarc=pass (policy=reject) header.from=silabs.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from pps.filterd (m0101742.ppops.net [127.0.0.1])
	by mx0a-0024c301.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BMLXJoT1266135;
	Mon, 22 Dec 2025 20:37:53 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps12202023;
	 bh=evekN0/NeWhOZebyvs8qVgaIaj6W0SM/9n8XD/+zI8Y=; b=yaZDDgK97c83
	wtd8zkWJJe2WXjOYZ4E0Kq2SVRzGvzP6R8Ks7WxES2NikLHdmpzezNxCyghWcO/v
	KlOTRhZJcwxAR2831ElEEpEo3HiNvW28yZ0pHX0I/dp393S5DiboxgO4YI6nWwDJ
	iSKXYFkYEVw1koxdUF8+HPqdx1tYS7LPIwEJ+sq5T+gRIlbBylfrGB3psnPKIVls
	K5b1WP6Nnka2jeuA7yVnGsrdMqoiDy8+lDK2k0v9DH26AjH0h71p9OmjwEl1P8CC
	w8hedRKMczzF7BVeNjVNvL9oQCv9Yjj4mWpSwReLzvFE8bYkYoRupByxAH7fwG97
	pauJOZ+N8A==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11020136.outbound.protection.outlook.com [52.101.85.136])
	by mx0a-0024c301.pphosted.com (PPS) with ESMTPS id 4b5p6cc7cr-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 22 Dec 2025 20:37:53 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aA/SbuWeamU7FpZ3x3CX9U2sCUywIIeRZsuALOeriOq2E6qT8FhlTGjeYqH7RyR8F4fHqnKtaczcdJnlphWduM0lR7MBSIadvJw8iIc9qpg9gA18SSuKnqmNN9wFFPzM5Sp9OO/JQkSGLubpKF31vrowKqvI0my2VKYZDPvv0wDH8Tww8EzTt8qGvxir85JN7j+8JOlayOIFvkIa7SAMGrOvvVHShR/wsD5I6VPCl2MONvF+DjndpYR243Ex0XlDmcU6zhWxLgQzht/zwLp0VARyoWR7bVOENYt5aIGJKZJTKLIyn4OW0+E5stsi7kfOFOCubPBnFF6UkXKnkMUYyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=evekN0/NeWhOZebyvs8qVgaIaj6W0SM/9n8XD/+zI8Y=;
 b=cKkDREd3rJ4SfkH9CYQZ3ihuY3U+ACzXFbofrT8QAKD5SkMEs7cmmr8mJ9PppGVqKjHCkDka/zXZX7qQKve1qOL9jbEarT2J687qsjP2owj8EI0lsyQX3p8F3ccs0C51TK0FwNY9jHd+rpTrwa41f8ZqaNH0e5SRq4rtuaRtFwdCvHFfuL32qMIf8RZJnT+Dg5CQGTyKUtLI3j8+eDptxz7WjufyRCxOOrSYqEFkM7MwwCjUW0ByeZJoJwUtBrHmYixeuMKpwNOM/qIPT3H8n6axPdY5nYsFrX+eaiDpWqOxS/VjtJXPaondJVXsSEZec61oMAV0nRuR2kQY/wzvjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silabs.com; dmarc=pass action=none header.from=silabs.com;
 dkim=pass header.d=silabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=evekN0/NeWhOZebyvs8qVgaIaj6W0SM/9n8XD/+zI8Y=;
 b=AYqBu+Y9RXgZXPJ6Sx3dljospx3eT0KJ4dAq+uTZUQjbYUyixYa4AV+kpb5mkxWa6lCKXniR9YKjWHDA0vLvWdWV5qCK0lw7wugFirV0PwHZr/VeM7iBixA3TA/kolb05Ra/0oLj+27eL7y7OXzELK0NjKm27bRO4V+VyM+MSRM=
Received: from DS0PR11MB8205.namprd11.prod.outlook.com (2603:10b6:8:162::17)
 by SA1PR11MB8543.namprd11.prod.outlook.com (2603:10b6:806:3ac::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Tue, 23 Dec
 2025 02:37:51 +0000
Received: from DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::2de6:bc88:2af7:3583]) by DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::2de6:bc88:2af7:3583%3]) with mapi id 15.20.9434.009; Tue, 23 Dec 2025
 02:37:50 +0000
Date: Mon, 22 Dec 2025 21:37:49 -0500
Message-Id: <DF58WUG0NKOO.1ZRGT1H7HFMRO@silabs.com>
To: "Yacin Belmihoub-Martel" <yacin.belmihoub-martel@silabs.com>,
        <greybus-dev@lists.linaro.org>
From: =?utf-8?q?Damien_Ri=C3=A9gel?= <damien.riegel@silabs.com>
X-Mailer: aerc 0.20.1
References: <20251212161308.25678-1-damien.riegel@silabs.com>
 <20251212161308.25678-15-damien.riegel@silabs.com>
 <DEWKRO6FJ1EQ.NRB7PY1TENQY@silabs.com>
In-Reply-To: <DEWKRO6FJ1EQ.NRB7PY1TENQY@silabs.com>
X-ClientProxiedBy: YQBPR0101CA0351.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:6b::10) To DS0PR11MB8205.namprd11.prod.outlook.com
 (2603:10b6:8:162::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8205:EE_|SA1PR11MB8543:EE_
X-MS-Office365-Filtering-Correlation-Id: b2c79a8c-9532-4ea0-331f-08de41cc4413
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?a0FEd01hZitjZGRDSnYvTlNwSTVWeG0yT0gzUGlhTk5HQVd4MWE1NDRGNmdD?=
 =?utf-8?B?dkx3WDBhTkpzTUpSR283a0JEQUtXMWY4TXJCZ0Z5enMwMDI0SkUzY3d0Vmpm?=
 =?utf-8?B?WHBIUFNtcS9YTTdoOThNMk11T09Ec0Jqa2luT1Y4Y1N1dTJyVWFLR2ZHV3pw?=
 =?utf-8?B?bHlDOWh0bVFiUk9mMXR6Y21XZ29ydFY0b2haN05jOExKbUtWR3lPZUhkMm92?=
 =?utf-8?B?VFJtRndQdEJ3bUQ3TW9mWXl3UDNaN0gyOHZ2Q0ZrMkJGUlVnSWhtSEdKaFRD?=
 =?utf-8?B?RkxGTXpGeEJmOHVXUmV5MmpWWE5CL2VjaTlHQjlqQTdvVTgxUW55SGNVNjB0?=
 =?utf-8?B?SjFOKzN5am1EKzFnY29YejhEbHc3TzNBa1BTNEJqOGdXYWtjdWJxcU1saUox?=
 =?utf-8?B?dVh6NzRqOTdNd1lPR0ZUQXlYOCswdlR2T3ZrallEbHZBdWxPaFZjVWZqLzdi?=
 =?utf-8?B?VW1LaFppdlhXWXlKam5mRGhUQWtOTEQzTWVlbmswclVmSmZ2VW04Vy85R1N3?=
 =?utf-8?B?bHRjWXd5VnU2N0VYdmN1cUZWRDJwMlBlYnJvT2lSN3JZMDd6K29iSzBWSjNn?=
 =?utf-8?B?NnVuZEtrWEZqWlllUlVRbkZad1BKZmVsSVFOdFlTZSt6OFhNUFZFREhYOUhZ?=
 =?utf-8?B?RGV4T3B6bkJuTGV1Z21wcUdoR1Y1bitiN01kcm82emJTeldMTzRFNEV3aTNX?=
 =?utf-8?B?Q0FXZnpjT2hqdmpQd1U3MXN0RllZMm5TcnhzNTdUaVJCcVQzL05uMlFNSlpF?=
 =?utf-8?B?ZHdYT3RaQ3JMZmdSR3FZTE82c0M1Q1F5THlZU1N6YUpUc2d2RmNzc1A5T294?=
 =?utf-8?B?RUlMYXJUZXNyQnh1R0phaTMzbEJMcjhLUFNhd2J3UVlRNUUydEhUV09HcTRa?=
 =?utf-8?B?dGlvWW5HUjhYL0w2aUltMVJya3ZRVms3bnVycnU0b2MzS3p3MVNoNHJncEc3?=
 =?utf-8?B?MmQ2bzFkajUxT00yMmJTWDA2YTVhZUJlUkJPdXVJYVFxelo1WTF5bWFJS25a?=
 =?utf-8?B?WVZBaDUxZ2EreXlzbkFaMDJiaTM4SHp1MmpUaDA1bEd5bkZ4aEtVY3hxVWRn?=
 =?utf-8?B?elhxS3ZjK3pGK255SnIrdEtpMStldVNVV1NJUzUzbTYrUzZuSFNwWnJQNExU?=
 =?utf-8?B?NHFkcEdocHFwakI0VTQ2MkdkMm9IQlpCbWJZN1JqcnVvTWpWM3NHcmZvZngv?=
 =?utf-8?B?TlJFNnhGUU1GRVRZdnVVcHpTY24ydldPdmNyM0preGtOT1FiREhHREF1akZq?=
 =?utf-8?B?OFBrT1FUdjJvREp4ODRCckw5akF1WWpiVHI4Q25NT1pBOVhUNFFUcWZWa0VV?=
 =?utf-8?B?ZkFmTTRUN28xZ0I2V1V0SVJSWlZiRmpTdkVweHFwejlHMjZ0RUtaUmlMQW9P?=
 =?utf-8?B?dDVmeUo2OFlkYVU4Nlcvcm5KVkQ1UXVjNHlkUmpjbXNFbU9qNVdCTWt2alpB?=
 =?utf-8?B?a0l5djFhazdBR3ROVDlucDJ2UUJDaWdTd0s1WWtWSEFBMVd5TGFKcFZ2NHp5?=
 =?utf-8?B?eE1OMmY4NkdzRlZHdFd6NG96VzVaeldmeStCbVl3WVRvTzhxTmFxb01zNDg2?=
 =?utf-8?B?a01MM3RCM29SNm51UWw5Y1N2UEtqb1BHNGtPSnFOcmZCZnYxdFJTczB5NWVs?=
 =?utf-8?B?N3VjUEdNNXc0TDZHY0NuTEJOTnZWbFpBdGN1RTV6TjFsQzhDZVJucCtseThr?=
 =?utf-8?B?aGxIU05WZmVRQWNxVFNuaXVnNUNYY0lBa1pNMjhrM2xjLzIveGNObkh0Z0FX?=
 =?utf-8?B?UlhFaTBDN24xZnRvV0R4L0o2UDZSNCtHczZObTVHeHhFeFlBaDZIakJzSG5J?=
 =?utf-8?B?ZDlrSlRmNi93bFFRY2RCNTBSZlBUc1h2M2JMK285TzQybE8yb3lsYWwxM2xh?=
 =?utf-8?B?bHRLOFRhUWZ6NzA3Z3E4eFIrbmJ1UmFjR01JRWRKaGNPOWxrTzNOVW1wSCtl?=
 =?utf-8?Q?xvcPq98Gt5kg7VeXCciwaGMuNvV1y9YP?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8205.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(10070799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Q2FCeGdHQnFCeWdDbTJuc2ZaN1ljRHpZR1BzcHZVdDQrUWFNL0JYWVU5VFdU?=
 =?utf-8?B?WDhBb1EwOUZrWVJHaW9WRnFUSnZsem91b1BZYU5jbVd4bWpPcTJneXp4YitY?=
 =?utf-8?B?dWYzeXFwRUtJSXpjRVJVL3E2Z25jcm9yNGlMWHZwZ0VyRUxEK2kvTGdNelNS?=
 =?utf-8?B?K0JRWnljZkhMalVtdnZSRlIrdzNXYkM1bGhwZklnWkJqZStjSDRvdmg3SENi?=
 =?utf-8?B?SlhRRTV6bHN0NFFpS090S0ovdjVHRWFGbDcwbS9KN1ZyUnRiQXg0WmoxcjA2?=
 =?utf-8?B?S3FiR1BVYTJBRkNSRGJjYytuV1dkLzh0TjZYcjhtWm94L05kN0UvajhvMWJy?=
 =?utf-8?B?QVJDeXhGREorUlZmekt5T0RoSzlpTCtENHJHcUU2KzJaMlpjRzZ3WDQyVVlB?=
 =?utf-8?B?QkRuSmlKWmlmTHNnVW9MYy8xQ09YV1B2R21zbkNieHFBdmxTb2VmTi8yWFkx?=
 =?utf-8?B?REwrdzZXc2U4Um44SkthM3Arenc2RklaYnpiVkRuWGQ4YmZMUXlmZjI3Z2tl?=
 =?utf-8?B?VjJDUzQwWGU3RUJiU3lKM0tVTkpVRnVKSXBMMm9HMU9RSm5xMzhvdnExYjBk?=
 =?utf-8?B?ejZlS0M0K0ZVS0pCY0xGb29iSEMwRTgzM3FTQTFjS0thUkl4M2pjYUx0SWF5?=
 =?utf-8?B?YjZoVUYycXFSaGlHc2p6Nndmemc5WHY4OGpuTjUrN091STkzbmc4WVZHUlJY?=
 =?utf-8?B?WjVKTjZXRmk3ZGpLZEN4dG5mK1JkOHNTRHJzWHVvSEV2YmVES3plWHlCcjFQ?=
 =?utf-8?B?MGxoZ1lkUEFSVzJHRFpBWW1WVHlJcndLNzJKN0h5MkxyQmgyTjRMZHZudE03?=
 =?utf-8?B?aGE3dTNuczFXMkQ4eGNTVlh3S2c5T3ZyLytFL2JZMkhRS2hsaDNmK0g4STZC?=
 =?utf-8?B?ejFQckkrbFdOZkQ3VHNTM1BpRUNKSzVDNURqTzJ3WnkzZHA3eGZVUG9ZaW8v?=
 =?utf-8?B?WTQyQUYxaGNRdlRTTXJvU3NZQkpLcm8rZUdVai9ISXpzbnFabExPN3JuckE3?=
 =?utf-8?B?ZmM2VE1iNVBRU0JHLyt6bGtqdWJxTSsvZGdBMTZqRmloRnZjWUwwUGFKKysv?=
 =?utf-8?B?QU1TS2x3alhXVENmYVBHMGlJRVZjYjVMUW5xZ1A0VXlGZEtzQzc5UkpCdzhH?=
 =?utf-8?B?UXpJMUE2aUswSG8yalh5blNXcGtkb0VvNGNtcVpYVVltdVUwZUd2SW9pTUdr?=
 =?utf-8?B?Vkx6OC9YanpZcCtPV3BnMXFOazNHYkR6aEtvem9SbjN4alBrNVI0b2ZmR2Rr?=
 =?utf-8?B?N2ZxOHhDUncyOFpEMkxlRFhuV0Q3NXRsSndSRnQ1eU5EbVkwbG5oNTI0U3lt?=
 =?utf-8?B?LzFvS2JMT09pTFJCTXlmNmlUSFlhK2FHQUdWS1FPMzJEZVQ2NXR3UkYzaU9R?=
 =?utf-8?B?RTBySjUyNWxTWUgrWDdVUG5mSmgraFJ4R0xoZUwvbFVxUzFadTAvNitvWCtS?=
 =?utf-8?B?cXVDVUYvVGpBRUtIN0dpTFpUcmdGMFlZbGQ3WEFPSzJ5OVR6NzVWUk1HbTl4?=
 =?utf-8?B?R0toOUpkQ2xnc0ZTcDRyb3ZZVG50Tis2K1piaDloWlBkMlMrQlhrQzkrMmp0?=
 =?utf-8?B?cDhOVjMwMGR3U1ZHL1Fub2MxSGU4S3JlZXdRbGFWQTdnOFd3QnJnUENTY2tT?=
 =?utf-8?B?dkN1Znkzd2xWRmx4TVAzT01WQjhEVVlQTzhCUW1MRDM5SzBFRjR5a0pPVERZ?=
 =?utf-8?B?bE9oai9HUlBMWUpRQmlpZ1l1cVIzanVUdzV0RnZFVVU4dzBmMzR4bEVYend3?=
 =?utf-8?B?azNUbllCZzZ2OFF3NGY4aGIreXRseWpIWHpHUW94M01lMTc4anR1VDB0UitV?=
 =?utf-8?B?MjRndHlNK2xwVEIxL2ZoWlg4Qnk2a0dZUXNXRWVVbnN1S1h5QVFXMnFMUjZh?=
 =?utf-8?B?SUtZN1pobjlxM0FJWGgwOC9pQ01VeGJLVGt2cnplM0loTzVsS3NRYUh5Q1dq?=
 =?utf-8?B?Rjk3OUtuVTZ3UzNpUDFsSncrSnQya1d6NlRjcm0xOVpETzlVN1Q2Y01qN2VX?=
 =?utf-8?B?WmhrcCttejJHQ0l5YURBRURPNlFQL3NGNENjbEFFVHlObU5Sb2JWc2hmNkh3?=
 =?utf-8?B?U3M4azhZUWtjazFvU2hnZDA1cEFiaDE5NWpPUHJFaXNIZ2JxcWNEejVWcFVU?=
 =?utf-8?B?cXlvRHJWV2hKaUZJZTNvS3cwYlZWbVZiM3RFbG5CYzlwYjlHMzJYV2ZRa0xk?=
 =?utf-8?B?MmxBM0ZKNlZrbzZTaXc1OFE2azBPU0dmbTQ2am8zZExuT2VVb2c3REtTT1Vq?=
 =?utf-8?B?TFJseTlFMThlamRCUDRyVmR1cDNmUi9LTGV1amJZUVdhdU54SkxWUjIzUnJh?=
 =?utf-8?B?dTAxUUJxcnBrbWhIcmkrVS90R0x0TjArS3ZnMllDRnZRRGZuQmU5bU1YRnAw?=
 =?utf-8?Q?3JEexFOXdcgh5d5EVYoWamoERJutG6i0ELDordQWnIhzg?=
X-MS-Exchange-AntiSpam-MessageData-1: I1qlA+Sb91iQlw==
X-OriginatorOrg: silabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2c79a8c-9532-4ea0-331f-08de41cc4413
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8205.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2025 02:37:50.7893
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 54dbd822-5231-4b20-944d-6f4abcd541fb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 62gTRqlqJDrFcn8oWe7+9RuVM0/179TU+gY4NEhBJ0roaHG9y7jQyOGmqIpeOnYmUxn2SPdnefkZdmWP9tuFPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8543
X-Proofpoint-ORIG-GUID: 3_q8ZAAgmUZ0ggaBMe3NeJmCSCf8zefP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDAyMCBTYWx0ZWRfX+Q9KEWb+Nv9m
 6i4W7WdwHe80/wiwgtv579LX5/W7+PkMb7aT/f0D1tvbyRKexFVGb2GW3xBgV4HYWGFz+ulZjPR
 K7d8py6xcu8sxpErEG3zd5HOeSsmsNVaBvHG88kUGm3saKXT8ZDoRg4CiE63EbaDxCBcD7tdjif
 SIcxqzIjTubRNrYfHFRvMtpkBI+Q9BeLx12RiM0YkVt2maSTUDshpio2DgGvCcd8nY8spdNAVpB
 bW+tnJTfj1Aq06yM4m1KRiB15AMzmLQ4Ycprsz0vxMso5qjQy4UBZWg+mDzRk5YO8nGvo99ugPu
 BtT6cqZZrBCk9XPmMKeLImRuQ+gT2CZU/RFLAKt/9RNlysXh2dg1yRm4pYgPUksD8NlfBW2nqnd
 Zvs8KFXDqXQRB+W5eXSokK4JYT6axDHGdd9MkSQTwQM1Fmgv+6XzLfnv+YX/XfSMmTr62acfyO5
 ZLRiBE8lrtFo11pev2A==
X-Proofpoint-GUID: 3_q8ZAAgmUZ0ggaBMe3NeJmCSCf8zefP
X-Authority-Analysis: v=2.4 cv=Z4Lh3XRA c=1 sm=1 tr=0 ts=694a0081 cx=c_pps
 a=ZiNoB/MLSX3+I0Tp4uZUxg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=M51BFTxLslgA:10
 a=i1IsUcr2s-wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=eSEQp4nYg6waMJpvQ14A:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-22_04,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 adultscore=0 impostorscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512230020
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.00 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[silabs.com,reject];
	R_DKIM_ALLOW(-0.20)[silabs.com:s=pps12202023,silabs.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:148.163.153.153];
	MIME_GOOD(-0.10)[text/plain];
	BLOCKLISTDE_FAIL(0.00)[52.101.85.136:server fail,2603:10b6:8:162::17:server fail,148.163.153.153:server fail];
	ASN(0.00)[asn:22843, ipnet:148.163.152.0/22, country:US];
	RCPT_COUNT_SEVEN(0.00)[8];
	DWL_DNSWL_BLOCKED(0.00)[silabs.com:dkim];
	MIME_TRACE(0.00)[0:+];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	URIBL_BLOCKED(0.00)[mx0b-0024c301.pphosted.com:rdns,mx0b-0024c301.pphosted.com:helo];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[silabs.com:+]
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 423BB3F76D
X-Spamd-Bar: -----
Message-ID-Hash: EY5YUUEC6UT2VIFVTMNJLBT2P4FD67LH
X-Message-ID-Hash: EY5YUUEC6UT2VIFVTMNJLBT2P4FD67LH
X-MailFrom: Damien.Riegel@silabs.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, Silicon Labs Kernel Team <linux-devel@silabs.com>, Gabriel Beaulieu <gabriel.beaulieu@silabs.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 14/14] greybus: cpc: add CPC SDIO host driver
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/EY5YUUEC6UT2VIFVTMNJLBT2P4FD67LH/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gRnJpIERlYyAxMiwgMjAyNSBhdCA1OjAxIFBNIEVTVCwgWWFjaW4gQmVsbWlob3ViLU1hcnRl
bCB3cm90ZToNCj4gT24gRnJpIERlYyAxMiwgMjAyNSBhdCAxMToxMyBBTSBFU1QsIERhbWllbiBS
acOpZ2VsIHdyb3RlOg0KPj4gKyNpbmNsdWRlIDxsaW51eC9hdG9taWMuaD4NCj4+ICsjaW5jbHVk
ZSA8bGludXgvYml0b3BzLmg+DQo+PiArI2luY2x1ZGUgPGxpbnV4L2NvbnRhaW5lcl9vZi5oPg0K
Pj4gKyNpbmNsdWRlIDxsaW51eC9kZWxheS5oPg0KPj4gKyNpbmNsdWRlIDxsaW51eC9kZXZpY2Uu
aD4NCj4+ICsjaW5jbHVkZSA8bGludXgva3RocmVhZC5oPg0KPj4gKyNpbmNsdWRlIDxsaW51eC9t
aW5tYXguaD4NCj4+ICsjaW5jbHVkZSA8bGludXgvbW1jL3NkaW9fZnVuYy5oPg0KPj4gKyNpbmNs
dWRlIDxsaW51eC9tbWMvc2Rpb19pZHMuaD4NCj4+ICsjaW5jbHVkZSA8bGludXgvc2tidWZmLmg+
DQo+PiArI2luY2x1ZGUgPGxpbnV4L3NsYWIuaD4NCj4+ICsjaW5jbHVkZSA8bGludXgvd2FpdC5o
Pg0KPj4gKyNpbmNsdWRlIDxsaW51eC93b3JrcXVldWUuaD4NCj4NCj4gSSB0aGluayB0aGVyZSBh
cmUgYSBmZXcgaW5jbHVkZXMgdGhhdCBhcmUgbm90IHVzZWQgaGVyZSAoYGF0b21pYy5oYCwNCj4g
YGRlbGF5LmhgLCBgbWlubWF4LmhgLCBgc2xhYi5oYCkuDQoNClRoYW5rcywgSSdsbCBjaGVjayB0
aGF0LiBJIHdvbnQgcmVwbHkgdG8gYWxsIHlvdXIgcmV2aWV3cyB0byBhdm9pZA0KdW5uZWNlc3Nh
cnkgbm9pc2UsIGJ1dCBJIHdpbGwgYXBwbHkgdGhlIHN1Z2dlc3Rpb25zIHlvdSBtYWRlIGFuZCBm
aXggdGhlDQplcnJvcnMgcmVwb3J0ZWQgYnkga2VybmVsIHRlc3Qgcm9ib3QgYmVmb3JlIHNwaW5u
aW5nIGEgbmV3IHZlcnNpb24uDQoNCj4+ICsvKioNCj4+ICsgKiBSZXR1cm4gdGhlIG1lbW9yeSBy
ZXF1aXJlbWVudCBpbiBieXRlcyBmb3IgdGhlIGFnZ3JlZ2F0ZWQgZnJhbWUgYWxpZ25lZCB0byB0
aGUgYmxvY2sgc2l6ZQ0KPj4gKyAqLw0KPj4gK3N0YXRpYyBzaXplX3QgY3BjX3NkaW9fZ2V0X2Fs
aWduZWRfc2l6ZShzdHJ1Y3QgY3BjX3NkaW8gKmN0eCwgc3RydWN0IHNrX2J1ZmZfaGVhZCAqZnJh
bWVfbGlzdCkNCj4+ICt7DQo+PiArCXNpemVfdCBzaXplID0gMDsNCj4+ICsJc3RydWN0IHNrX2J1
ZmYgKmZyYW1lOw0KPg0KPiBDaGVjayBmb3IgcmV2ZXJzZSB4bWFzcyB0cmVlIG5vdGF0aW9uLCB0
aGVyZSBhcmUgYSBmZXcgb2NjdXJlbmNlcyBpbg0KPiB0aGlzIHNvdXJjZSBmaWxlIHdoZXJlIHRo
aXMgaXMgbm90IGVuZm9yY2VkLg0KDQpJIHJlbmFtZWQgc29tZSB2YXJpYWJsZXMgbGFzdCBtaW51
dGUgYW5kIEkgaGF2ZSBtaXNzZWQgc29tZSBzdHlsaW5nDQppc3N1ZXMgbGlrZSB0aGlzLCB3aWxs
IHRha2UgY2FyZSBvZiB0aGF0Lg0KDQo+DQo+PiArc3RhdGljIHVuc2lnbmVkIGNoYXIgKmNwY19z
ZGlvX2J1aWxkX2FnZ3JlZ2F0ZWRfZnJhbWUoc3RydWN0IGNwY19zZGlvICpjdHgsDQo+PiArCQkJ
CQkJICAgICAgc3RydWN0IHNrX2J1ZmZfaGVhZCAqZnJhbWVfbGlzdCwNCj4+ICsJCQkJCQkgICAg
ICBzaXplX3QgKnhmZXJfbGVuKQ0KPj4gK3sNCj4+ICsgCVsuLi5dDQo+PiArCWZyYW1lX2NvdW50
ID0gKF9fbGUzMiAqKXR4X2J1ZmY7DQo+PiArCSpmcmFtZV9jb3VudCA9IGNwdV90b19sZTMyKHNr
Yl9xdWV1ZV9sZW4oZnJhbWVfbGlzdCkpOw0KPj4gKwlpICs9IDQ7DQo+DQo+IGBpICs9IHNpemVv
ZigqZnJhbWVfY291bnQpO2AgdG8gYXZvaWQgbWFnaWMgdmFsdWUuIEFsc28sIGl0IGlzIG1vcmUN
Cj4gY29tbW9uIHRvIHJldHVybiB0aGUgc2l6ZSBvZiB0aGUgYnVpbHQgYXJyYXkgaW5zdGVhZCBv
ZiB0aGUgYXJyYXkNCj4gaXRzZWxmLCBzbyBJIHdvdWxkIGluc3RlYWQgcGFzcyBgY2hhciAqKnR4
X2J1ZmZgIGFzIGFuIGFyZ3VtZW50IGFuZA0KPiByZXR1cm4gYHhmZXJfbGVuYC4NCg0KU3VyZSBJ
IGNhbiBzd2FwIHRoZSBsZW5ndGggYW5kIHRoZSBwb2ludGVyLg0KDQo+PiArDQo+PiArCS8qIENv
cHkgZnJhbWUgaGVhZGVycyB0byBhZ2dyZWdhdGUgYnVmZmVyICovDQo+PiArCXNrYl9xdWV1ZV93
YWxrKGZyYW1lX2xpc3QsIGZyYW1lKSB7DQo+PiArCQltZW1jcHkoJnR4X2J1ZmZbaV0sIGZyYW1l
LT5kYXRhLCBDUENfRlJBTUVfSEVBREVSX1NJWkUpOw0KPj4gKwkJaSArPSBDUENfRlJBTUVfSEVB
REVSX1NJWkU7DQo+PiArCX0NCj4NCj4gRGVjbGFyaW5nIGEgbG9jYWwgYHN0cnVjdCBmcmFtZV9o
ZWFkZXIqYCB3b3VsZCBiZSBtb3JlIGV4cGxpY2l0Lg0KPg0KPj4gKwkvKiBaZXJvLXBhZCByZW1h
aW5kZXIgb2YgaGVhZGVyIGJsb2NrIHRvIGZpbGwgY29tcGxldGUgU0RJTyBibG9jayAqLw0KPj4g
KwlpZiAoaSA8IEdCX0NQQ19TRElPX0JMT0NLX1NJWkUpDQo+PiArCQltZW1zZXQoJnR4X2J1ZmZb
aV0sIDAsIEdCX0NQQ19TRElPX0JMT0NLX1NJWkUgLSBpKTsNCj4NCj4gUmVtb3ZlIHVubmVjZXNz
YXJ5IGBpZmAuDQo+DQo+PiArLyoqDQo+PiArICogUHJvY2VzcyBhZ2dyZWdhdGVkIGZyYW1lDQo+
PiArICogUmVjb25zdHJ1Y3RlZCBmcmFtZSBsYXlvdXQ6DQo+PiArICogKy0tLS0tKy0tLS0tKy0t
LS0tKy0tLS0tLSstLS0tLS0rLS0tLS0tKy0tLS0tLSstLS0tLS0tKy0tLS0tLS0tLSsNCj4+ICsg
KiB8IENQQyBIZWFkZXIgKDRCKSB8IFNpemUgfCBPcElEIHwgVHlwZSB8IFN0YXQgfCBDUG9ydCB8
IFBheWxvYWQgfA0KPj4gKyAqICstLS0tLSstLS0tLSstLS0tLSstLS0tLS0rLS0tLS0tKy0tLS0t
LSstLS0tLS0rLS0tLS0tLSstLS0tLS0tLS0rDQo+PiArICovDQo+PiArc3RhdGljIGludCBjcGNf
c2Rpb19wcm9jZXNzX2FnZ3JlZ2F0ZWRfZnJhbWUoc3RydWN0IGNwY19zZGlvICpjdHgsIHVuc2ln
bmVkIGNoYXIgKmFnZ3JlZ2F0ZWRfZnJhbWUsDQo+PiArCQkJCQkgICAgIHVuc2lnbmVkIGludCBm
cmFtZV9sZW4pDQo+PiArew0KPj4gKwlbLi4uXQ0KPj4gKwkvKiBFbnN1cmUgZnJhbWUgY291bnQg
ZG9lc24ndCBleGNlZWQgb3VyIG5lZ290aWF0ZWQgbWF4aW11bSAqLw0KPj4gKwlpZiAoZnJhbWVf
Y291bnQgPiBjdHgtPm1heF9hZ2dyZWdhdGlvbikgew0KPj4gKwkJZGV2X3dhcm4oY3R4LT5kZXYs
DQo+PiArCQkJICJQcm9jZXNzIGFnZ3JlZ2F0ZWQgZnJhbWU6IGZyYW1lIGNvdW50ICV1IGV4Y2Vl
ZHMgbmVnb3RpYXRlZCBtYXhpbXVtICV1XG4iLA0KPj4gKwkJCSBmcmFtZV9jb3VudCwgY3R4LT5t
YXhfYWdncmVnYXRpb24pOw0KPj4gKwkJLy9mcmFtZV9jb3VudCA9IGN0eC0+ZWZmZWN0aXZlX21h
eF9hZ2dyZWdhdGlvbjsNCj4+ICsJfQ0KPg0KPiBGaXJzdCBvZmYsIHJlbW92ZSBpbmxpbmUgY29t
bWVudC4gQWxzbywgdGhpcyBmdW5jdGlvbiByZXR1cm5zIGFuIGludGVnZXINCj4gdGhhdCBpcyBu
ZXZlciBjaGVja2VkIGJ5IHRoZSBjYWxsZXIsIHNvIGNoYW5nZSB0aGUgcmV1cm4gdHlwZSB0byBg
dm9pZGAuDQo+IEkgdGhpbmsgdGhlIHNvbHV0aW9uIHRvIGhhbmRsaW5nIHRoaXMgZXJyb3IgaXMg
dG8gc2ltcGx5IHJldHVybi4NCg0KQWdyZWVkLCBhbnl3YXkgSSBwbGFuIHRvIHJldmlzaXQgYWdn
cmVnYXRpb24sIHRoZSB3YXkgaXQncyBkb25lDQpjdXJyZW50bHkgaXMga2luZCBvZiBhIHdhc3Rl
IG9mIHNwYWNlLCBhbmQgcmVhZGluZyBhbiBpbnZhbGlkIHZhbHVlIGhlcmUNCmJhc2ljYWxseSBt
ZWFucyB0aGUgZGV2aWNlIHNlbnQgdXMgZ2FyYmFnZSwgc28gSSBhZ3JlZSB0aGF0IHRoZSByaWdo
dA0KY291cnNlIG9mIGFjdGlvbiB3b3VsZCBiZSB0byBqdXN0IHJldHVybiBhbmQgZHJvcCBnYXJi
YWdlIGRhdGEuDQoNCldpdGggdGhlIG5ldyBhZ2dyZWdhdGlvbiBzY2hlbWUsIHRoZSBkZXZpY2Ug
d291bGQgYmUgYmFzaWNhbGx5IGZyZWUgdG8NCmFnZ3JlZ2F0ZSBhcyBtYW55IGZyYW1lcyBhcyBp
dCB3YW50cyB3aXRob3V0IGJyZWFraW5nIHRoZSBwcm90b2NvbA0KDQoNCj4+ICsNCj4+ICsJLyog
SGVhZGVyIHN0YXJ0cyBhdCBibG9jayAwIGFmdGVyIGZyYW1lIGNvdW50ICovDQo+PiArCWhlYWRl
ciA9IChzdHJ1Y3QgZnJhbWVfaGVhZGVyICopJmFnZ3JlZ2F0ZWRfZnJhbWVbc2l6ZW9mKF9fbGUz
MildOw0KPg0KPiBVc2UgYHNpemVvZihmcmFtZV9jb3VudClgIHRvIG1ha2UgdGhpcyBtb3JlIGV4
cGxpY2l0LCBhbmQgbWFrZSBpdCBlYXNpZXINCj4gdG8gbWFpbnRhaW4gaWYgYGZyYW1lX2NvdW50
YCBldmVyIGNoYW5nZXMgdHlwZS4NCj4NCj4+ICsJZm9yICh1bnNpZ25lZCBpbnQgaSA9IDA7IGkg
PCBmcmFtZV9jb3VudDsgaSsrKSB7DQo+DQo+IE5vIG5lZWQgZm9yIGBpYCB0byBiZSB1bnNpZ25l
ZCwganVzdCB1c2UgYW4gYGludGAgdG8gYWxsZXZpYXRlIHRoZSBjb2RlLg0KPg0KPj4gKwkJLyog
QWxsb2NhdGUgc2tfYnVmZiBmb3IgcmVjb25zdHJ1Y3RlZCBmcmFtZSAqLw0KPj4gKwkJcnhfc2ti
ID0gYWxsb2Nfc2tiKGZyYW1lX3NpemUsIEdGUF9LRVJORUwpOw0KPj4gKwkJaWYgKHJ4X3NrYikg
ew0KPj4gKwkJCS8qIENvcHkgaGVhZGVyICovDQo+PiArCQkJbWVtY3B5KHNrYl9wdXQocnhfc2ti
LCBDUENfRlJBTUVfSEVBREVSX1NJWkUpLCBoZWFkZXIsDQo+PiArCQkJICAgICAgIENQQ19GUkFN
RV9IRUFERVJfU0laRSk7DQo+PiArDQo+PiArCQkJLyogQ29weSBwYXlsb2FkICovDQo+PiArCQkJ
aWYgKHBheWxvYWRfc2l6ZSA+IDApDQo+PiArCQkJCW1lbWNweShza2JfcHV0KHJ4X3NrYiwgcGF5
bG9hZF9zaXplKSwgcGF5bG9hZF9zdGFydCwgcGF5bG9hZF9zaXplKTsNCj4+ICsNCj4+ICsJCQkv
KiBTZW5kIHJlY29uc3RydWN0ZWQgZnJhbWUgdG8gQ1BDIGNvcmUgKi8NCj4+ICsJCQljcGNfaGRf
cmN2ZChjdHgtPmNwY19oZCwgcnhfc2tiKTsNCj4+ICsJCX0NCj4+ICsJCS8qIGVsc2U6IGFsbG9j
YXRpb24gZmFpbGVkLCBza2lwIHRoaXMgZnJhbWUgYnV0IGNvbnRpbnVlIHByb2Nlc3NpbmcgKi8N
Cj4NCj4gTm8/IElmIHdlJ3JlIG5vdCBhYmxlIHRvIGFsbG9jYXRlLCB3ZSBzaG91bGQganVzdCBy
ZXR1cm4uIENoYW5nZSB0aGUNCj4gYGlmYCB0byBjaGVjayBmb3IgYSBmYWlsZWQgYWxsb2NhdGlv
biBhbmQgcmV0dXJuLiBUaGlzIGhhcyB0aGUgYWRkZWQNCj4gYmVuZWZpdCBvZiBrZWVwaW5nIHRo
ZSBub21pbmFsIHBhdGggdW5pbmRlbnRlZC4NCg0KU3VyZQ0KDQo+PiArc3RhdGljIHUzMiBjcGNf
c2Rpb19nZXRfcnhfbnVtX2J5dGVzKHN0cnVjdCBzZGlvX2Z1bmMgKmZ1bmMsIGludCAqZXJyKQ0K
Pj4gK3sNCj4+ICsJdW5zaWduZWQgaW50IHJ4X251bV9ibG9ja19hZGRyID0gMHgwQzsNCj4+ICsN
Cj4+ICsJcmV0dXJuIHNkaW9fcmVhZGwoZnVuYywgcnhfbnVtX2Jsb2NrX2FkZHIsIGVycik7DQo+
PiArfQ0KPg0KPiBIYXZlIGAweDBDYCBpbiBhIGBHQl9DUENfU0RJT19SWF9CTE9DS19DTlRfQURE
UmAgZGVmaW5lIGZvciBiZXR0ZXINCj4gcmVhZGFiaWxpdHkuDQo+DQo+PiArc3RhdGljIHZvaWQg
Z2JfY3BjX3NkaW9fdHgoc3RydWN0IGNwY19zZGlvICpjdHgpDQo+PiArew0KPj4gK2NsZWFudXBf
ZnJhbWVzOg0KPj4gKwkvKiBDbGVhbiB1cCBhbnkgcmVtYWluaW5nIGZyYW1lcyBpbiB0aGUgbGlz
dCAqLw0KPj4gKwlza2JfcXVldWVfcHVyZ2UoJmZyYW1lX2xpc3QpOw0KPg0KPiBNaXNsZWFkaW5n
IGNvbW1lbnQsIHNpbmNlIGBmcmFtZV9saXN0YCB3aWxsIGFsd2F5cyBoYXZlIGZyYW1lcyBsZWZ0
IGluDQo+IGl0LCBhcyB0aGV5IGFyZSBuZXZlciByZW1vdmVkIGR1cmluZyBUWC4NCj4NCj4+ICtz
dGF0aWMgdm9pZCBnYl9jcGNfc2Rpb19yeF90eChzdHJ1Y3QgY3BjX3NkaW8gKmN0eCkNCj4+ICt7
DQo+PiArCWdiX2NwY19zZGlvX3J4KGN0eCk7DQo+PiArDQo+PiArCXNldF9iaXQoQ1BDX1NESU9f
RkxBR19JUlFfUlVOTklORywgJmN0eC0+ZmxhZ3MpOw0KPj4gKwlnYl9jcGNfc2Rpb190eChjdHgp
Ow0KPj4gKwljbGVhcl9iaXQoQ1BDX1NESU9fRkxBR19JUlFfUlVOTklORywgJmN0eC0+ZmxhZ3Mp
Ow0KPj4gK30NCj4NCj4gVGhpcyBpcyB2ZXJ5IHN1cnByaXNpbmcgdG8gbWUsIHdoeSBhcmUgd2Ug
cHJvY2Vzc2luZyBvdXIgVFggaW4gdGhlIFJYDQo+IElSUT8gVGhpcyBzZWVtcyBlbnRpcmVseSB1
bm5lY2Vzc2FyeS4gSXQgZmVlbHMgbGlrZSB3ZSBjb3VsZCByZXdvcmsgdGhpcw0KPiBhbmQgcmVt
b3ZlIGBDUENfU0RJT19GTEFHX0lSUV9SVU5OSU5HYC4NCg0KVGhpcyBpcyBhIHBhdHRlcm4gSSBw
aWNrZWQgdXAgZnJvbSBTRElPIFdpRmkgZHJpdmVycy4gQXQgbGVhc3QgYSBmZXcgb2YNCnRoZW0g
ZG8gdGhhdCwgSSB0aGluayB0byBnaXZlIHNvbWUgY2hhbmNlIHRvIHRoZSBUWCBwYXRoIHRvIGJl
IGV4ZXJjaXNlZA0Kd2hlbiB0aGUgcmFkaW8gaXMgY29uc2lzdGVudGx5IHRyeWluZyB0byBzZW5k
IHBhY2tldHMgdG8gdGhlIGhvc3QuDQpPdGhlcndpc2UsIHRoZSBUWCBwYXRoIG1pZ2h0IGJlIHN0
dWNrIG1vc3Qgb2YgdGhlIHRpbWUgb24NCnNkaW9fY2xhaW1faG9zdCgpIGFzIHRoZXkgd2lsbCBm
aWdodCBmb3IgYWNjZXNzIHRvIHRoZSBidXMuDQoNCkkgd2lsbCBsZWF2ZSBpdCBhcyBpcyBmb3Ig
bm93LiBUaGlzIGlzIHNvbWV0aGluZyB3ZSBjYW4gcmV2aXNpdCBsYXRlciBpZg0Kd2UncmUgc3Rp
bGwgbm90IGhhcHB5IHdpdGggaXQuDQoNCkNoZWVycywNCi0tIA0KRGFtaWVuDQpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpncmV5YnVzLWRldiBtYWlsaW5n
IGxpc3QgLS0gZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpUbyB1bnN1YnNjcmliZSBzZW5k
IGFuIGVtYWlsIHRvIGdyZXlidXMtZGV2LWxlYXZlQGxpc3RzLmxpbmFyby5vcmcK
