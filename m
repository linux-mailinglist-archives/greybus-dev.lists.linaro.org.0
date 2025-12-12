Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id C9789CB93CB
	for <lists+greybus-dev@lfdr.de>; Fri, 12 Dec 2025 17:13:51 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id E9FC13F9A5
	for <lists+greybus-dev@lfdr.de>; Fri, 12 Dec 2025 16:13:50 +0000 (UTC)
Received: from mx0a-0024c301.pphosted.com (mx0a-0024c301.pphosted.com [148.163.149.154])
	by lists.linaro.org (Postfix) with ESMTPS id 1CF733F992
	for <greybus-dev@lists.linaro.org>; Fri, 12 Dec 2025 16:13:36 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=silabs.com header.s=pps12202023 header.b=miDSzYDp;
	dkim=pass header.d=silabs.com header.s=selector1 header.b=Cz5pSvYT;
	spf=pass (lists.linaro.org: domain of Damien.Riegel@silabs.com designates 148.163.149.154 as permitted sender) smtp.mailfrom=Damien.Riegel@silabs.com;
	dmarc=pass (policy=reject) header.from=silabs.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from pps.filterd (m0101743.ppops.net [127.0.0.1])
	by mx0a-0024c301.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BC1HxRt2471899;
	Fri, 12 Dec 2025 10:13:33 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps12202023;
	 bh=IWbBfifONqTvzCqJnQ7uZMw5WqDNurfbsQIGBD9wYyY=; b=miDSzYDp8u3l
	NrpcGr0Q26n/AaDiqmoQY/PLUjUu+R0UdLw6lX3qLFEEUtwnMbOgESyQmCaOtSOV
	6RvxjA6xnT5U0LdCYUdMQj5vnirHdMuMJqFNUZIh7zkf1gN0TlMwBzIuEhxsEFmQ
	wEVMKTep1BiYooiDJcBGUd4c1xnRJo+rVSGP15NOTif5FtcI/XTtg17ouB0uk5UI
	PtDjTIyjwbzr7iz8LM+PIvh3FDhwmsy5WHymhosR4PO9TdBh/v0q/6BiwAYea1uV
	twjv6A56zW/pG3+WNaQ3nANJDogXPUrJ0GTdPmC6ddU9nZz4JP/cOSSSZc+L6qxb
	OXyn0hga6Q==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11020120.outbound.protection.outlook.com [40.93.198.120])
	by mx0a-0024c301.pphosted.com (PPS) with ESMTPS id 4ayht2mdet-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 12 Dec 2025 10:13:32 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=czL3CoTDYIXS1WAuOqlkhVVjygP4f9xyjx7Wi0ptf1uzQAnd1gA7GG8hBiTHEAK3/XVsEo0bIPESDVOHksTBzhMQ0Uma35ZtDoU79sRPzrLGurU76O1BozEaY0TRBLvyspwQ4v463+t7uYOaqsvdbjoxIjoDmcA+e+6mvMw4vDxSwgts31Itp7c07TrqatDzxcbvnJlLB9hC0H9QmFh+tN+UK9GsKcgicODfzL5C/0j7VbyhIJY8CvdnsXhB6GgwIfQi++c3Z9FUZ5YeaZ3uwGpkDFX4KiZj3oVBVa4hNsHvMkPOxGQAjwYaJ89z0Yknd12nbOZzgDV2RPWvpjKA1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IWbBfifONqTvzCqJnQ7uZMw5WqDNurfbsQIGBD9wYyY=;
 b=ITTpSEgo3Q/guN8aN5Z+vi+y1ARozDDUhtSLhIJt7QeTjQB0PPL7sueTy2bQOtQMMZBd6z3GA/J5OHIQo+RYP1wPO/e8ei4MXB5cKub2PWEALWMx0vEd4/FHqDjv2W+xkrqlT6f1VFpoht24ie5i8a+WNjiD7MKIRnw3Ko+5RP5QKDRow3c5L+ZhF9fvxUowpqjj3AErVsxq6TwpWfNZ0bfI56KDN+Zd+5ctkdybScJcUKFxjMeuKJpjcpPdnWKr3RCTNEbfDnOHKKjqyMbN2H3ngwGKxiZCEzmMVIvmJS5J3CZXI6eeqzCWXO1KSaRkhPW/zQzv2h5lD5u9xemPQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silabs.com; dmarc=pass action=none header.from=silabs.com;
 dkim=pass header.d=silabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IWbBfifONqTvzCqJnQ7uZMw5WqDNurfbsQIGBD9wYyY=;
 b=Cz5pSvYTTCMHJeW0n2g7jN6bjbbgtjHJYS/rRR97N3MNMp0Y+boHM48kfNU4lhnAgxkYVIUaYIg4yDx1RnXEG+byEBO6euLm30UYM7RQcbpa5LG+0IIvK918e1ZurJKna6vQVCp+lOHNx9mhUc15/UY1rGIIQ9hp6iMNXUrz4hY=
Received: from DS0PR11MB8205.namprd11.prod.outlook.com (2603:10b6:8:162::17)
 by DM3PPF7468F7991.namprd11.prod.outlook.com (2603:10b6:f:fc00::f2d) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.9; Fri, 12 Dec
 2025 16:13:29 +0000
Received: from DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::2de6:bc88:2af7:3583]) by DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::2de6:bc88:2af7:3583%3]) with mapi id 15.20.9412.005; Fri, 12 Dec 2025
 16:13:29 +0000
From: =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
To: greybus-dev@lists.linaro.org
Date: Fri, 12 Dec 2025 11:13:04 -0500
Message-ID: <20251212161308.25678-11-damien.riegel@silabs.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251212161308.25678-1-damien.riegel@silabs.com>
References: <20251212161308.25678-1-damien.riegel@silabs.com>
X-ClientProxiedBy: YQZPR01CA0176.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:8b::25) To DS0PR11MB8205.namprd11.prod.outlook.com
 (2603:10b6:8:162::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8205:EE_|DM3PPF7468F7991:EE_
X-MS-Office365-Filtering-Correlation-Id: c5ba8579-69bb-4010-b89b-08de39996352
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?RXRnM1UzUFM2Tm1HN0kvNExadE9oWE95MzhNZTNleUtPb01lMkNhUWVuL0Mx?=
 =?utf-8?B?Q0Fza1dCQVY1UkRzd2JLdmJ1dkU1SmhaZUo2aEFzdzR6RzFoc25KbU1qQk1x?=
 =?utf-8?B?TU5HVDJ4NGFBTGJaVXRkU2UrNTFwV0xveXpwMjY4eFlsdVYzN3RoRCt1SHJ4?=
 =?utf-8?B?aGxlWlNUZ3J5TlhzY3VvOHByNmlCWkJBa1FHTjhTN2ZpbmR5dHpXT0dXR2NI?=
 =?utf-8?B?Yi83UWl3dEdyckhDZVlGbEc1T2g5L1YwM1B6Z3ZCKzdqZlIrbkk0YWJHeTg1?=
 =?utf-8?B?ZHhUR1llajU1RnRLYXA1Q3FKMGZxUTFwM0pucURaNHA4SFJPdjRvblo2Rk03?=
 =?utf-8?B?bDJ4QW1UakVpUG5lNUUvQW5LdWFQMUozMm1zaVJhczdNSUU5ZFFqVXN5SXlp?=
 =?utf-8?B?UFpTYXZmc2Q2UU91STFqVHFpZkp4TVM2K0lqSXdLbGJENE10RUdzZ1QvOW45?=
 =?utf-8?B?RkMvcVo5Qi9vaFd6blpqRUpFMEVhOGIyYitVeEx5R0pEMVJyV3NnSEVIWUQ3?=
 =?utf-8?B?T09Gb0dFY2g1RG91eGpDWlNIcUtybkEreVh1UklGTzBtVjBscWcyR1F3STNu?=
 =?utf-8?B?bEp3SFMrMDRqK0lZa1RUanhQc3h6RndCRFZKNWNqZnE3alo3WWw1VlFJWmFh?=
 =?utf-8?B?T3c4aEgzckFUZDJDUWRhN05IdHB0djBHaGlYTGNLSk5PQm1oKzFNZGFsc0gy?=
 =?utf-8?B?UFVMVzZxN0llUkhRbFplalg1YU5RSnd6M2VBMTRlby9uMURoOVdCQmRTRTZV?=
 =?utf-8?B?MGRTVUJXYzlkeklaTVdkN2tydUJQV1hVZVNDcmR2WFNVVk0rckJCSGtHSzdt?=
 =?utf-8?B?Nmk1NzhvelRyWDllem52SU5PTTU5eXU0eEVYUXQvM3loN3MwZ0crZ3RBWEds?=
 =?utf-8?B?SWV6NHR5cEhRd0h4Z01KVUlDQzdpemRqcWNnZ1JlWE5LOXlNOWc4RERoVkpU?=
 =?utf-8?B?ckF1U1Zkb01YSXNjOEt5SHBtdElGOVZvN0x1a1BXSUdQYkhQZENYVXhIU2FG?=
 =?utf-8?B?dFdwZGs1dEp5SUtMazNpV1VwcER1emk2cjFsUFNSaTFmUnN6dzhCWmRVSXdm?=
 =?utf-8?B?eXhVbzV5QkZjbW1UUWcwL0twTi90L3dIZG50SEliWGZiRmowSWRMT0FoU3Mv?=
 =?utf-8?B?bzVKRmN0MHA1S3l1NEVaZkNXQXhsQmFva1RadmpnNW5XSElEeHBlbXZLYkFU?=
 =?utf-8?B?a3RWWE44eWhGNWFSMXU1Vkh3Mnl1SERSRmVUbUtXWUJrMjVrOUNYRTZzM3pj?=
 =?utf-8?B?U3RqQ0EzV05DMXRPbmhDb2l3blBQTCt5aXo2Q3BLQ0d2TlBNVTdldVo1VHZE?=
 =?utf-8?B?Rm1aNGxIY0pIcEJxcWNFbDBuOWhCTTIvLzZFUW9TQktST0R2RGR2QmtvMFRC?=
 =?utf-8?B?WHJOSW9ZZlY0NXhRVzRhWkxtOGR0Mi9MRVZ1V2JvUDlaNkZHQkpzMGhOODB4?=
 =?utf-8?B?QjJWcVJqN1F1dzNqWjBuQWpZcTk4d2FScFFGK0sxeWVUb3YyTUxQalRnQWd1?=
 =?utf-8?B?dkJ6R3pvVTVCZ3BJa0hOY3h5TlhzS2tHdm9GcnJZY3YyOHA5d0RlUy9YazNG?=
 =?utf-8?B?RUF1SDV4b3M3SlE5cFNZRzZXb1pwQWt6L0RwYmJHeUM4a0RnUno5d3Z0VHJu?=
 =?utf-8?B?OXhQOGVXT1JmL2JmWWJmQ3ZNVWlqUmFOL25MM1dkaEVteUU4L0x4SVdJVjVR?=
 =?utf-8?B?TENBcW9vQUFHOGRDcStUb0VybmxBYlF3TWNHL3FDWDNuOEgzOG9na2tNVmcz?=
 =?utf-8?B?Qm55aWtmU2NJbWE4bUJFS2hUdHhqZ29nZFJIa25DSXdEZ3hGYVJZOWlrUXhH?=
 =?utf-8?B?MWQyOEh6ZFEyc0NBYkxOVXI0aGJYa0c2c0RMNlZaQW5YS2tQa1gzdFBhM2RF?=
 =?utf-8?B?VXJNcWNtMUR4dk53RFo0YlVtR3lnaVhJaGlFNTA4SDZyVlovbG5vSm9keTJu?=
 =?utf-8?B?bmwwQU5RMnBDUVJLYk53ZHBvb3cwZlZ5YlQ3OXZyTUxwK2tEcmdQUys2Z3pM?=
 =?utf-8?B?dk9rOGRscFRNd1l5Yy9hTUhkb21keTJXUUVsQzFORnl5RGV1aVU3UkhRUnpP?=
 =?utf-8?Q?NufqFd?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8205.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?eUxpK0pBWlVJV3ZKSW5aMTBUWWt6U0RpMEFsa3RRd1BwaE04RXdSWlp0Z3lk?=
 =?utf-8?B?THZNeWFybTJmaHg0SCtxMGt2Yms0RFZ0dCsvM1VXOExNVDUrN1RnTEIzUGFE?=
 =?utf-8?B?QXh2Z3ByZU44anhRN3BNZkN1Z1BXbTdMMjc1c21PQ0RWRTRxaUo0bFdISXFq?=
 =?utf-8?B?TFMzdHBjdXFsTWxnek5sajJtY3FUaDh5WlJPb3gwaDdpSWMzRDhjYitoNmVZ?=
 =?utf-8?B?SlRQb20xTzdUNk1ncWJsTGRzR0kwZVdiZW94MEJWaDVWT3hEelN3algxa3ZJ?=
 =?utf-8?B?NnQzUGhJOXFXOVAzQlN3a0luejVyVmxXb2s3NklEMHZlUXZBeU9FSDVUYit5?=
 =?utf-8?B?dmNTZlBMbUFjMUtkd05yY2Z2V0FqTWpKdmdycjg4UGl6MVZKTjFSa2RkUzVU?=
 =?utf-8?B?ak1YdGp6a3drNWVYVWo0K01MUUhZTFBlblNFTFhTajZPekh2SDd4bnRpZU5h?=
 =?utf-8?B?bi9UeXRTUDZxeXM3azRSb1Nsb2hwMFlEVDNGNEZEOXpOUDZoZGw3K1hnV2FQ?=
 =?utf-8?B?ZjlOSUR5RVZlT0ZqRnlkdER6eGRSTGtjSEF4R1p5TGpMSlp5NGdjVld5OWha?=
 =?utf-8?B?S0tnSjFRQ3Q0UEVTSXhiSjZGMWxucURGbjkyUmtyWnJzbXJnS24vT2UydXBO?=
 =?utf-8?B?ZGRFMTJqYnp5MjV4SUlSUGNuRzZRUURJNFdZRHBwbEZYcWZDMEpiTVJFdlQx?=
 =?utf-8?B?dk9zOE15WktwYlFyellzRkxBekl0SlRJUk9uSkVWcytGdGtpUjZoaDVpWktP?=
 =?utf-8?B?bUliV1pNYVdEemZiMSsrMjhBWnRQbzkwMU5FTFNGUEwxMzlTMHFWWHRsdFMy?=
 =?utf-8?B?NmVPRmVTV1ZYZUtmTEpqWGtRSUQyREJmK3prZ1lndFo1UWRweW0rNW1PQWFS?=
 =?utf-8?B?VHBoak0vSUVVamd0YmFYSU5RQzFwcUNhbFJXL3owblNTNU5NWC9NY2pOQ3Zm?=
 =?utf-8?B?NWhGLzA2bWQ3aTJRbnRFdmNiQXNYWlhUejZPc1JFWDJJNjlHTWd6S0ZNQ2xB?=
 =?utf-8?B?VzZGQW84SktDcUw4cUVxT1RqWjdZM0JTNE5YSU55QVJ0SkZhRXFBZDk3ZkJK?=
 =?utf-8?B?SnV2V3lqb0hsVVczRGJKYm93RFRQUHFaUEh2TVZqTDdUVGxURUNTWkRpa0pG?=
 =?utf-8?B?MXVxRlBNQVhpcTNaSnNnTXh0cDFpMzU1VG94K1oxTVhzaWxnNTFGRkducEls?=
 =?utf-8?B?QU1tZVZrU0FxVTZ6WHFkemxRS0RMcmErYWVWSUd2VXJhK2JoT3dNd2RZNWpS?=
 =?utf-8?B?VEdFWDdCR1FlUDBIbzdHSDQwZm8vVWtSMW82VlpVWm5LdGlpSXJiM3oxQ2F2?=
 =?utf-8?B?TFhCSnJQcVN4MnZGQnNLYzdyOWF0bjY4WFlkRUxuWkR0a0pHOHh2Y0htcGpp?=
 =?utf-8?B?ZEVDYnBQd0RScjc4WURhUjZGSzhhSzRLU0wvRVg0VldIS2RIcmtEd0dQVGNl?=
 =?utf-8?B?SzVWQTIzLzBBZHdnSjJyTGthYWEveHN6SHd2MDBDT2E4bVJBeXlhaWk4S09p?=
 =?utf-8?B?SjE0Lys1czhBeE90WEdDQUZ4NmV2bHkwdklJL0ZibDlqM0dnWkR6bnRqU08z?=
 =?utf-8?B?TlBaWHV1RGtWMjQ4TVNYeUJ2UEZDQ2FkWFl0VkczUU1LQmlHTXB1cGNPOE50?=
 =?utf-8?B?c0ozajhtWXMvUEptLzNFbStBMGhpY2o3Q0VtSEVodlBjUkJUYlNMMDRISGM5?=
 =?utf-8?B?MndocTRabkdDTkRGekEyUFAwSDEwSEpxcFYxQWZDZmJVMFdJdE00TjJzTkky?=
 =?utf-8?B?bzJiZHB0N1piYnZ3Uk4rSVJHRDlIa2dJNXRMczJtZHlTWHB6aGZxYVdUSlIr?=
 =?utf-8?B?K0FUcVVTRlJCOUZxN1NXOUREbWtpNmRwL3FBOG1GekdLNmo3d2pYYit2MFlq?=
 =?utf-8?B?bzQweWVmOGoyQU5vUHJLMTJoS0xkOExxSkJtOFplSTUyT1daKzFMcWtBZHJN?=
 =?utf-8?B?aWhVSEgxY2lYQkFHNHp5c1o1cXc3MlFDUElIMFpLL24wUVFYTzJOb05NVHNz?=
 =?utf-8?B?WjFpVmNWVHgrT3J5bGhsYU03WnQvTjBmRytTakxqOXA5OXRpdVhLVlM2OCtR?=
 =?utf-8?B?aitsWnRQM0RRR3cxa0pYMFFSeXQxYXhjU2x2b0cwUXZFVTJHTHRlODRDRW9u?=
 =?utf-8?Q?am2UH3apub/BfM2fw2wW9D2Ym?=
X-OriginatorOrg: silabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5ba8579-69bb-4010-b89b-08de39996352
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8205.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 16:13:29.4492
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 54dbd822-5231-4b20-944d-6f4abcd541fb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jrGvtbVUVGBvSxSRIKIAja0dWLw6HPiZPZR4BXqcyWO0pqlP4vaSOpwtPD+BJaQ+SpyQhZZzIYRBeyBqarRwsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF7468F7991
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEyMDEyOSBTYWx0ZWRfX99hDAJrFfAE+
 LsX0AzUj7zicXf8duUUBpbtOH5R4H0JN7whTO66fBsCPKG/IOv7R7glpw5ZEfiaQ9RGPZvCDUHO
 r46xR86K1INmtC/lbFmcZO1ph1ieCVjDWNiLipc8+Wxah6LdjxjTTllLuNtUL0QX8mKV1jxiRYp
 MHyy4tW1qyk7F2r4XSLNKuR1v1o4LaLiMZoImorhTRKeOZB5u8StgqXxhpuZWS3JwLhGxL8nJAw
 u9++8cvouS9AN/JABACJDM5QGudaWaL3Y764aryvgX/78niD1XCejJGUnAGnvswxGVIzkgHjoGe
 A4UCeJpfsSjTGOpk6ylp6Q+SLxSlGKo5QQcv80bzHiIKuVC8Pt3vwMURZp9dWrjFS/J+Ja5U4i1
 WPBn8kbLP9O0Mnn3yEsrLzbHOM/YfQ==
X-Authority-Analysis: v=2.4 cv=BKy+bVQG c=1 sm=1 tr=0 ts=693c3f2c cx=c_pps
 a=OsHIvx7z5txkqQhXuj38dg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=M51BFTxLslgA:10
 a=i1IsUcr2s-wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=2AEO0YjSAAAA:8
 a=4ZPe5lWXlvbldCu1ft8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: SBDU9jBKtgJopJuTEydYA8WSSyUEsOXX
X-Proofpoint-GUID: SBDU9jBKtgJopJuTEydYA8WSSyUEsOXX
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
	BAYES_HAM(-3.00)[100.00%];
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
	BLOCKLISTDE_FAIL(0.00)[148.163.149.154:server fail,2603:10b6:8:162::17:server fail,40.93.198.120:server fail];
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
X-Rspamd-Queue-Id: 1CF733F992
X-Spamd-Bar: ----
Message-ID-Hash: OTQCKIYV6FS2IGKWM4QGPEQZ5UJUKSHZ
X-Message-ID-Hash: OTQCKIYV6FS2IGKWM4QGPEQZ5UJUKSHZ
X-MailFrom: Damien.Riegel@silabs.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, Silicon Labs Kernel Team <linux-devel@silabs.com>, =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH 10/14] greybus: cpc: use holding queue instead of sending out immediately
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/OTQCKIYV6FS2IGKWM4QGPEQZ5UJUKSHZ/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

QXMgdGhlIGZpcnN0IHN0ZXAgdG8gaGFuZGxlIHJlbW90ZSdzIFJYIHdpbmRvdywgc3RvcmUgdGhl
IHNrYiBpbiBhDQpza19idWZmX2hlYWQgbGlzdCwgaW5zdGVhZCBvZiBzZW5kaW5nIGEgbWVzc2Fn
ZSBpbW1lZGlhdGVseSB3aGVuIHB1c2hlZA0KYnkgR3JleWJ1cy4NCg0Kc2ticyBhcmUgc3RpbGwg
c2VudCBvdXQgc3RyYWlnaHQgYXdheSwgYnV0IG5vdyB0aGVyZSBpcyBhIHBsYWNlIHRvIHN0b3Jl
DQphd2F5IGlmIHRoZSByZW1vdGUncyBSWCB3aW5kb3cgaXMgdG9vIHNtYWxsLg0KDQpTaWduZWQt
b2ZmLWJ5OiBEYW1pZW4gUmnDqWdlbCA8ZGFtaWVuLnJpZWdlbEBzaWxhYnMuY29tPg0KLS0tDQog
ZHJpdmVycy9ncmV5YnVzL2NwYy9jcGMuaCAgICAgIHwgMTAgKysrKysrLS0tLQ0KIGRyaXZlcnMv
Z3JleWJ1cy9jcGMvY3BvcnQuYyAgICB8IDIxICsrKysrKysrKysrKy0tLS0tLS0tLQ0KIGRyaXZl
cnMvZ3JleWJ1cy9jcGMvaG9zdC5jICAgICB8ICA0ICsrKy0NCiBkcml2ZXJzL2dyZXlidXMvY3Bj
L3Byb3RvY29sLmMgfCAyNSArKysrKysrKysrKysrKysrKysrKysrKystDQogNCBmaWxlcyBjaGFu
Z2VkLCA0NSBpbnNlcnRpb25zKCspLCAxNSBkZWxldGlvbnMoLSkNCg0KZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3JleWJ1cy9jcGMvY3BjLmggYi9kcml2ZXJzL2dyZXlidXMvY3BjL2NwYy5oDQppbmRl
eCA3MjVmZDdmNGFmYy4uZjE2Njk1ODVjNDUgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dyZXlidXMv
Y3BjL2NwYy5oDQorKysgYi9kcml2ZXJzL2dyZXlidXMvY3BjL2NwYy5oDQpAQCAtOSwxNSArOSwx
NSBAQA0KICNpbmNsdWRlIDxsaW51eC9kZXZpY2UuaD4NCiAjaW5jbHVkZSA8bGludXgvZ3JleWJ1
cy5oPg0KICNpbmNsdWRlIDxsaW51eC9tdXRleC5oPg0KKyNpbmNsdWRlIDxsaW51eC9za2J1ZmYu
aD4NCiAjaW5jbHVkZSA8bGludXgvdHlwZXMuaD4NCiANCi1zdHJ1Y3Qgc2tfYnVmZjsNCi0NCiAv
KioNCiAgKiBzdHJ1Y3QgY3BjX2Nwb3J0IC0gQ1BDIGNwb3J0DQogICogQGlkOiBjcG9ydCBJRA0K
ICAqIEBjcGNfaGQ6IHBvaW50ZXIgdG8gdGhlIENQQyBob3N0IGRldmljZSB0aGlzIGNwb3J0IGJl
bG9uZ3MgdG8NCiAgKiBAbG9jazogbXV0ZXggdG8gc3luY2hyb25pemUgYWNjZXNzZXMgdG8gdGNi
IGFuZCBvdGhlciBhdHRyaWJ1dGVzDQorICogQGhvbGRpbmdfcXVldWU6IGxpc3Qgb2YgZnJhbWVz
IHF1ZXVlZCB0byBiZSBzZW50DQogICogQHRjYjogVHJhbnNtaXNzaW9uIENvbnRyb2wgQmxvY2sN
CiAgKi8NCiBzdHJ1Y3QgY3BjX2Nwb3J0IHsNCkBAIC0yNiw2ICsyNiw4IEBAIHN0cnVjdCBjcGNf
Y3BvcnQgew0KIAlzdHJ1Y3QgY3BjX2hvc3RfZGV2aWNlICpjcGNfaGQ7DQogCXN0cnVjdCBtdXRl
eCBsb2NrOyAvKiBTeW5jaHJvbml6ZSBhY2Nlc3MgdG8gc3RhdGUgdmFyaWFibGVzICovDQogDQor
CXN0cnVjdCBza19idWZmX2hlYWQgaG9sZGluZ19xdWV1ZTsNCisNCiAJLyoNCiAJICogQGFjazog
Y3VycmVudCBhY2tub3dsZWRnZSBudW1iZXINCiAJICogQHNlcTogY3VycmVudCBzZXF1ZW5jZSBu
dW1iZXINCkBAIC00Miw3ICs0NCw3IEBAIHZvaWQgY3BjX2Nwb3J0X3JlbGVhc2Uoc3RydWN0IGNw
Y19jcG9ydCAqY3BvcnQpOw0KIHZvaWQgY3BjX2Nwb3J0X3BhY2soc3RydWN0IGdiX29wZXJhdGlv
bl9tc2dfaGRyICpnYl9oZHIsIHUxNiBjcG9ydF9pZCk7DQogdTE2IGNwY19jcG9ydF91bnBhY2so
c3RydWN0IGdiX29wZXJhdGlvbl9tc2dfaGRyICpnYl9oZHIpOw0KIA0KLWludCBjcGNfY3BvcnRf
dHJhbnNtaXQoc3RydWN0IGNwY19jcG9ydCAqY3BvcnQsIHN0cnVjdCBza19idWZmICpza2IpOw0K
K3ZvaWQgY3BjX2Nwb3J0X3RyYW5zbWl0KHN0cnVjdCBjcGNfY3BvcnQgKmNwb3J0LCBzdHJ1Y3Qg
c2tfYnVmZiAqc2tiKTsNCiANCiBzdHJ1Y3QgY3BjX3NrYl9jYiB7DQogCXN0cnVjdCBjcGNfY3Bv
cnQgKmNwb3J0Ow0KQEAgLTU4LDcgKzYwLDcgQEAgc3RydWN0IGNwY19za2JfY2Igew0KIA0KICNk
ZWZpbmUgQ1BDX1NLQl9DQihfX3NrYikgKChzdHJ1Y3QgY3BjX3NrYl9jYiAqKSYoKF9fc2tiKS0+
Y2JbMF0pKQ0KIA0KLXZvaWQgY3BjX3Byb3RvY29sX3ByZXBhcmVfaGVhZGVyKHN0cnVjdCBza19i
dWZmICpza2IsIHU4IGFjayk7DQogdm9pZCBjcGNfcHJvdG9jb2xfb25fZGF0YShzdHJ1Y3QgY3Bj
X2Nwb3J0ICpjcG9ydCwgc3RydWN0IHNrX2J1ZmYgKnNrYik7DQordm9pZCBfX2NwY19wcm90b2Nv
bF93cml0ZV9oZWFkKHN0cnVjdCBjcGNfY3BvcnQgKmNwb3J0KTsNCiANCiAjZW5kaWYNCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dyZXlidXMvY3BjL2Nwb3J0LmMgYi9kcml2ZXJzL2dyZXlidXMvY3Bj
L2Nwb3J0LmMNCmluZGV4IDM1YTE0OGFiYmVkLi5mODUwZGE3YWNmYiAxMDA2NDQNCi0tLSBhL2Ry
aXZlcnMvZ3JleWJ1cy9jcGMvY3BvcnQuYw0KKysrIGIvZHJpdmVycy9ncmV5YnVzL2NwYy9jcG9y
dC5jDQpAQCAtNyw3ICs3LDYgQEANCiAjaW5jbHVkZSA8bGludXgvc2tidWZmLmg+DQogDQogI2lu
Y2x1ZGUgImNwYy5oIg0KLSNpbmNsdWRlICJob3N0LmgiDQogDQogLyoqDQogICogY3BjX2Nwb3J0
X3RjYl9yZXNldCgpIC0gUmVzZXQgY3BvcnQncyBUQ0IgdG8gaW5pdGlhbCB2YWx1ZXMuDQpAQCAt
MzgsMTUgKzM3LDIzIEBAIHN0cnVjdCBjcGNfY3BvcnQgKmNwY19jcG9ydF9hbGxvYyh1MTYgY3Bv
cnRfaWQsIGdmcF90IGdmcF9tYXNrKQ0KIAljcGNfY3BvcnRfdGNiX3Jlc2V0KGNwb3J0KTsNCiAN
CiAJbXV0ZXhfaW5pdCgmY3BvcnQtPmxvY2spOw0KKwlza2JfcXVldWVfaGVhZF9pbml0KCZjcG9y
dC0+aG9sZGluZ19xdWV1ZSk7DQogDQogCXJldHVybiBjcG9ydDsNCiB9DQogDQogdm9pZCBjcGNf
Y3BvcnRfcmVsZWFzZShzdHJ1Y3QgY3BjX2Nwb3J0ICpjcG9ydCkNCiB7DQorCXNrYl9xdWV1ZV9w
dXJnZSgmY3BvcnQtPmhvbGRpbmdfcXVldWUpOw0KIAlrZnJlZShjcG9ydCk7DQogfQ0KIA0KK3N0
YXRpYyB2b2lkIGNwY19jcG9ydF9xdWV1ZV9za2Ioc3RydWN0IGNwY19jcG9ydCAqY3BvcnQsIHN0
cnVjdCBza19idWZmICpza2IpDQorew0KKwlfX3NrYl9oZWFkZXJfcmVsZWFzZShza2IpOw0KKwlf
X3NrYl9xdWV1ZV90YWlsKCZjcG9ydC0+aG9sZGluZ19xdWV1ZSwgc2tiKTsNCit9DQorDQogLyoq
DQogICogY3BjX2Nwb3J0X3BhY2soKSAtIFBhY2sgQ1BvcnQgSUQgaW50byBHcmV5YnVzIE9wZXJh
dGlvbiBNZXNzYWdlIGhlYWRlci4NCiAgKiBAZ2JfaGRyOiBHcmV5YnVzIG9wZXJhdGlvbiBtZXNz
YWdlIGhlYWRlci4NCkBAIC03MywxMSArODAsOSBAQCB1MTYgY3BjX2Nwb3J0X3VucGFjayhzdHJ1
Y3QgZ2Jfb3BlcmF0aW9uX21zZ19oZHIgKmdiX2hkcikNCiAgKiBAY3BvcnQ6IGNwb3J0Lg0KICAq
IEBza2I6IHNrYiB0byBiZSB0cmFuc21pdHRlZC4NCiAgKi8NCi1pbnQgY3BjX2Nwb3J0X3RyYW5z
bWl0KHN0cnVjdCBjcGNfY3BvcnQgKmNwb3J0LCBzdHJ1Y3Qgc2tfYnVmZiAqc2tiKQ0KK3ZvaWQg
Y3BjX2Nwb3J0X3RyYW5zbWl0KHN0cnVjdCBjcGNfY3BvcnQgKmNwb3J0LCBzdHJ1Y3Qgc2tfYnVm
ZiAqc2tiKQ0KIHsNCi0Jc3RydWN0IGNwY19ob3N0X2RldmljZSAqY3BjX2hkID0gY3BvcnQtPmNw
Y19oZDsNCiAJc3RydWN0IGdiX29wZXJhdGlvbl9tc2dfaGRyICpnYl9oZHI7DQotCXU4IGFjazsN
CiANCiAJLyogSW5qZWN0IGNwb3J0IElEIGluIEdyZXlidXMgaGVhZGVyICovDQogCWdiX2hkciA9
IChzdHJ1Y3QgZ2Jfb3BlcmF0aW9uX21zZ19oZHIgKilza2ItPmRhdGE7DQpAQCAtODksMTEgKzk0
LDkgQEAgaW50IGNwY19jcG9ydF90cmFuc21pdChzdHJ1Y3QgY3BjX2Nwb3J0ICpjcG9ydCwgc3Ry
dWN0IHNrX2J1ZmYgKnNrYikNCiAJQ1BDX1NLQl9DQihza2IpLT5jcGNfZmxhZ3MgPSBDUENfU0tC
X0ZMQUdfUkVRX0FDSzsNCiANCiAJY3BvcnQtPnRjYi5zZXErKzsNCi0JYWNrID0gY3BvcnQtPnRj
Yi5hY2s7DQorDQorCWNwY19jcG9ydF9xdWV1ZV9za2IoY3BvcnQsIHNrYik7DQorCV9fY3BjX3By
b3RvY29sX3dyaXRlX2hlYWQoY3BvcnQpOw0KIA0KIAltdXRleF91bmxvY2soJmNwb3J0LT5sb2Nr
KTsNCi0NCi0JY3BjX3Byb3RvY29sX3ByZXBhcmVfaGVhZGVyKHNrYiwgYWNrKTsNCi0NCi0JcmV0
dXJuIGNwY19oZF9zZW5kX3NrYihjcGNfaGQsIHNrYik7DQogfQ0KZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3JleWJ1cy9jcGMvaG9zdC5jIGIvZHJpdmVycy9ncmV5YnVzL2NwYy9ob3N0LmMNCmluZGV4
IDdmMDU3OWZkZTI2Li5lYzQzZDMzZGZjNiAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3JleWJ1cy9j
cGMvaG9zdC5jDQorKysgYi9kcml2ZXJzL2dyZXlidXMvY3BjL2hvc3QuYw0KQEAgLTYyLDcgKzYy
LDkgQEAgc3RhdGljIGludCBjcGNfaGRfbWVzc2FnZV9zZW5kKHN0cnVjdCBjcGNfaG9zdF9kZXZp
Y2UgKmNwY19oZCwgdTE2IGNwb3J0X2lkLA0KIAlDUENfU0tCX0NCKHNrYiktPmNwb3J0ID0gY3Bv
cnQ7DQogCUNQQ19TS0JfQ0Ioc2tiKS0+Z2JfbWVzc2FnZSA9IG1lc3NhZ2U7DQogDQotCXJldHVy
biBjcGNfY3BvcnRfdHJhbnNtaXQoY3BvcnQsIHNrYik7DQorCWNwY19jcG9ydF90cmFuc21pdChj
cG9ydCwgc2tiKTsNCisNCisJcmV0dXJuIDA7DQogfQ0KIA0KIHN0YXRpYyBpbnQgY3BjX2hkX2Nw
b3J0X2FsbG9jYXRlKHN0cnVjdCBjcGNfaG9zdF9kZXZpY2UgKmNwY19oZCwgaW50IGNwb3J0X2lk
LCB1bnNpZ25lZCBsb25nIGZsYWdzKQ0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3JleWJ1cy9jcGMv
cHJvdG9jb2wuYyBiL2RyaXZlcnMvZ3JleWJ1cy9jcGMvcHJvdG9jb2wuYw0KaW5kZXggYjRkZDRl
MTczYTEuLmVmOGZmMGNhYzI0IDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncmV5YnVzL2NwYy9wcm90
b2NvbC5jDQorKysgYi9kcml2ZXJzL2dyZXlidXMvY3BjL3Byb3RvY29sLmMNCkBAIC0xNCw3ICsx
NCw3IEBAIHN0YXRpYyBib29sIGNwY19za2JfaXNfc2VxdWVuY2VkKHN0cnVjdCBza19idWZmICpz
a2IpDQogCXJldHVybiBDUENfU0tCX0NCKHNrYiktPmNwY19mbGFncyAmIENQQ19TS0JfRkxBR19S
RVFfQUNLOw0KIH0NCiANCi12b2lkIGNwY19wcm90b2NvbF9wcmVwYXJlX2hlYWRlcihzdHJ1Y3Qg
c2tfYnVmZiAqc2tiLCB1OCBhY2spDQorc3RhdGljIHZvaWQgY3BjX3Byb3RvY29sX3ByZXBhcmVf
aGVhZGVyKHN0cnVjdCBza19idWZmICpza2IsIHU4IGFjaykNCiB7DQogCXN0cnVjdCBjcGNfaGVh
ZGVyICpoZHI7DQogDQpAQCAtODQsMyArODQsMjYgQEAgdm9pZCBjcGNfcHJvdG9jb2xfb25fZGF0
YShzdHJ1Y3QgY3BjX2Nwb3J0ICpjcG9ydCwgc3RydWN0IHNrX2J1ZmYgKnNrYikNCiAJCWdyZXli
dXNfZGF0YV9yY3ZkKGNwb3J0LT5jcGNfaGQtPmdiX2hkLCBjcG9ydC0+aWQsIHNrYi0+ZGF0YSwg
c2tiLT5sZW4pOw0KIAl9DQogfQ0KKw0KK3N0YXRpYyB2b2lkIF9fY3BjX3Byb3RvY29sX3dyaXRl
X3NrYihzdHJ1Y3QgY3BjX2Nwb3J0ICpjcG9ydCwgc3RydWN0IHNrX2J1ZmYgKnNrYiwgdTggYWNr
KQ0KK3sNCisJY3BjX3Byb3RvY29sX3ByZXBhcmVfaGVhZGVyKHNrYiwgYWNrKTsNCisNCisJY3Bj
X2hkX3NlbmRfc2tiKGNwb3J0LT5jcGNfaGQsIHNrYik7DQorfQ0KKw0KKy8qIFdyaXRlIHNrYnMg
YXQgdGhlIGhlYWQgb2YgaG9sZGluZyBxdWV1ZSAqLw0KK3ZvaWQgX19jcGNfcHJvdG9jb2xfd3Jp
dGVfaGVhZChzdHJ1Y3QgY3BjX2Nwb3J0ICpjcG9ydCkNCit7DQorCXN0cnVjdCBza19idWZmICpz
a2I7DQorCXU4IGFjazsNCisNCisJYWNrID0gY3BvcnQtPnRjYi5hY2s7DQorDQorCS8qIEZvciBl
YWNoIFNLQiBpbiB0aGUgaG9sZGluZyBxdWV1ZSwgY2xvbmUgaXQgYW5kIHBhc3MgaXQgdG8gbG93
ZXIgbGF5ZXIgKi8NCisJd2hpbGUgKChza2IgPSBza2JfcGVlaygmY3BvcnQtPmhvbGRpbmdfcXVl
dWUpKSkgew0KKwkJc2tiX3VubGluayhza2IsICZjcG9ydC0+aG9sZGluZ19xdWV1ZSk7DQorDQor
CQlfX2NwY19wcm90b2NvbF93cml0ZV9za2IoY3BvcnQsIHNrYiwgYWNrKTsNCisJfQ0KK30NCi0t
IA0KMi40OS4wDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmdyZXlidXMtZGV2IG1haWxpbmcgbGlzdCAtLSBncmV5YnVzLWRldkBsaXN0cy5saW5hcm8u
b3JnClRvIHVuc3Vic2NyaWJlIHNlbmQgYW4gZW1haWwgdG8gZ3JleWJ1cy1kZXYtbGVhdmVAbGlz
dHMubGluYXJvLm9yZwo=
