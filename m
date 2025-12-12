Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DDF7CB93D7
	for <lists+greybus-dev@lfdr.de>; Fri, 12 Dec 2025 17:14:13 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 7F9073FDB2
	for <lists+greybus-dev@lfdr.de>; Fri, 12 Dec 2025 16:14:12 +0000 (UTC)
Received: from mx0b-0024c301.pphosted.com (mx0b-0024c301.pphosted.com [148.163.153.153])
	by lists.linaro.org (Postfix) with ESMTPS id F09863FDB2
	for <greybus-dev@lists.linaro.org>; Fri, 12 Dec 2025 16:13:36 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=silabs.com header.s=pps12202023 header.b=IUUI66Py;
	dkim=pass header.d=silabs.com header.s=selector1 header.b=LqzyEYNf;
	spf=pass (lists.linaro.org: domain of Damien.Riegel@silabs.com designates 148.163.153.153 as permitted sender) smtp.mailfrom=Damien.Riegel@silabs.com;
	dmarc=pass (policy=reject) header.from=silabs.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from pps.filterd (m0101742.ppops.net [127.0.0.1])
	by mx0a-0024c301.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BCFG5gK2052805;
	Fri, 12 Dec 2025 10:13:31 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps12202023;
	 bh=w1/5YRaI4nuxJ64hjAemiWucIjxSy6Sf8roGm+BoCtE=; b=IUUI66PyOniD
	H9jNUAK2BIMIXXpwE+4LtWhEX4Yc3kKb+b44uih1z4a8TSsgnzLnzDQXHtickuu6
	81dnhy4SWz92EvPqgPKPrgSnz+ZlqBjatReTfTvrIhpqs/bOVj+wLbCoX5b233Ha
	gsR0HkxpC4Z+NxH7IXXqJxcOiPNlxFj/l0qbpx+meae1BneQNYD2P/WJALrwkEWM
	GBhLQIeNpCdOSkfdXmYjn3nJYzWlbKZ40UdrYsvQ1mdoLV9exq8pLG9e1zJ77toc
	43+cA3XUoBLEiXzv8kg1Jo+Pu6wZz9CBqKvLzV/flzCXvK1V49dDnLqy21n4/fOZ
	JEnoGaZlBg==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11022103.outbound.protection.outlook.com [52.101.43.103])
	by mx0a-0024c301.pphosted.com (PPS) with ESMTPS id 4aykqe47hr-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 12 Dec 2025 10:13:30 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QL+hO5wTQZaIoHvpIKRmXY1w+vv+8wp5N02GJcqA0fTHWM//9iisb6f0aNgt4ibKbH/SOeaM8wLqBcgqTz/VIGIVINWUxRLWyevXMGubtWP3ig9AUrB83dXSo3VlrPiD2TtK4recGdvqFVLtwM9/8Epr9HWpB+gjlcaBIxA1RnEWcddP3F1ULeSBxyHIpE9cYtgUDQCea11VvLqY9Ts6W7qEBePWKLecV28zTzcgLauUYtdBm0l3kK4aDMdkIL6RPeOhbHTSFAO++P7mwVv4Ua6oF2FSzrynnFgpEnq9E3TaXUKewOB85JFERiBKDIJqRcIo5432AeJ4szMosTa4Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w1/5YRaI4nuxJ64hjAemiWucIjxSy6Sf8roGm+BoCtE=;
 b=UkjbxsUEWJt3cpjEAcdu8dATvR2soWMADAtgHOOQ8vYaQrTwUH3477PjJ72VoiAAp5I+kbqyZu88viBKtW74lttHq+uOgVDUzZJ0XKXdoKvQ9updHDpIupqWio/MSXNJWwsJyHabXa9Yffv0zyXG+QntSBUGnnwI3mozujUmnIwwAKRanjuuSKLtUacxyhn8JRRbzpIrVjTY9uzOf6V5kpPPakJZLlSPDvJiiag3aGwgzULD3VvkG1aH87CGDH8HsNfbsXVnBRzDrvxB3AV2jHCUNCH9C4CdPrGC0OSy8KnxBfKJgyecdI29gT65bACyZyM9ILzk80YKUYup1LliXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silabs.com; dmarc=pass action=none header.from=silabs.com;
 dkim=pass header.d=silabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w1/5YRaI4nuxJ64hjAemiWucIjxSy6Sf8roGm+BoCtE=;
 b=LqzyEYNfopvlBdiagq2EkNt0PZQ7U1H9jdGhaCi1FgDFw+Eknulq37ErF5oWswi6DkXtwYh85Vfjt6e/nu1dNeKTgOPmJchgpcTiaF+CGgqjwOKk6Cd2+9ZwkkBfIJy4pGyW8eRG5eEixkheurUPMi+QODvojAqgltK+qP9ywK8=
Received: from DS0PR11MB8205.namprd11.prod.outlook.com (2603:10b6:8:162::17)
 by DM3PPF7468F7991.namprd11.prod.outlook.com (2603:10b6:f:fc00::f2d) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.9; Fri, 12 Dec
 2025 16:13:28 +0000
Received: from DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::2de6:bc88:2af7:3583]) by DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::2de6:bc88:2af7:3583%3]) with mapi id 15.20.9412.005; Fri, 12 Dec 2025
 16:13:28 +0000
From: =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
To: greybus-dev@lists.linaro.org
Date: Fri, 12 Dec 2025 11:13:03 -0500
Message-ID: <20251212161308.25678-10-damien.riegel@silabs.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251212161308.25678-1-damien.riegel@silabs.com>
References: <20251212161308.25678-1-damien.riegel@silabs.com>
X-ClientProxiedBy: YQZPR01CA0176.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:8b::25) To DS0PR11MB8205.namprd11.prod.outlook.com
 (2603:10b6:8:162::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8205:EE_|DM3PPF7468F7991:EE_
X-MS-Office365-Filtering-Correlation-Id: dd6694e2-a64b-4bea-e919-08de399962cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Rk1SZmlaNlIwYWJmSGxwZnByMTFwbFkvOURyV254WDdhb1Bmc0VqdTFXR05P?=
 =?utf-8?B?M0RLSUlFSFJQQ1FvNmJIdElBaVZOQmVERlE0OGprQmlabU1OQzRMODNsWnN5?=
 =?utf-8?B?RUNEQ1BrQkdNL2ZrL2F4d1JQYXNoOE5xQjRPTEpBZ1lmQldHZjdXRndQVW1s?=
 =?utf-8?B?elhpMkcvQWpGaHJibnhjWGlyU2FNYmJrMUtVVG50QW9qNUZvYTVNWGtvcWdz?=
 =?utf-8?B?cTcyTkovOHJlM3Jpd2oyOWxmK0RjZ2pQNFBLUFRDWXNGOFI5T01BLzZaSXNk?=
 =?utf-8?B?M1d0eEMxS1NjVDNQNE9tdk95cDc2cTRKQUhQNW52bG1hOHZyS1htVzJ4T0kw?=
 =?utf-8?B?SEtXZTBPb1VldE83TzhmUSt0OGRDRk9mY0N2L29NQ0oyRjF0NlBqOE8reXV2?=
 =?utf-8?B?c0lORFhadnJvU05JdzArSFdZQi9uNCtLSHphZW83SkcyaENxcUhSWGZWT05i?=
 =?utf-8?B?eWdyTU04bU8wb3BqbWNwZDJPWG9pNWhrSFNTMC9uM1JMekZ4blVUYWhqNElr?=
 =?utf-8?B?bUtWVXU3Q3RxNXBRUnVCZk1oNkxHSGJYbzdwazlRKzlpYkFqMmNkT0ZDY0ZM?=
 =?utf-8?B?d3VoVE1mRy9BNUN2YXNDUDNRdStxOGhVVmNGT0VqWjArenlTd1hWRngyWHpj?=
 =?utf-8?B?aEs0U1phcTNLcWo5amFXeDAwZDEzdnJCZXJ5TFc2NzJHcjRobTJ5ZTJrNHBt?=
 =?utf-8?B?VUYwU016cHZIUTMyRi9BaDhHQlJtejB0U0NkcnB5eFEycGUydlNQeU5hWkd0?=
 =?utf-8?B?Z1hpb2pubkk2NTNMNWxnZ3FOM1lHanpMTWFzSzNvdE0yLzZ0dnpzZHhtdzZu?=
 =?utf-8?B?OUFkWTh4VWF0TFVoWHpEMzBGYkZaK1ppYzNqMVUzSS9QaElMSm9TSlgxcE1Q?=
 =?utf-8?B?MVhwcmlXZkMzV3c5eXVHeWxpNUtLdWIwODVNSUdwZGNpM0Nka3BiRG9rTHM2?=
 =?utf-8?B?c3BYYmRudUtVRkFBMjFISlplbmZYQlRDMlZMNC9wQ1RNUjA4ZHZyVmlRNUxo?=
 =?utf-8?B?TVNWN2ovWG9ZWjdnL0NuNi8yZndVS0Z4NjFCbHg4Kzd0UmxVcjNsS0JaSlRU?=
 =?utf-8?B?WkoyRmlpTFh2RCtzMEFEc0x6V3ZWM3AxUklzV0s2Y3VtUkhIY3RXd3diLzlB?=
 =?utf-8?B?ZS82YURqOHZXMGowUEwweXEzbWl3VlhiOUlyaml6SEwxTjBtbDRxOXB4Y1ZN?=
 =?utf-8?B?anNKRzFnY09oSjQ1b054bFkxdjhOLzE4ZmdMTFBZektNdXdtSXlPWWgvN0gy?=
 =?utf-8?B?bkI0QUgxNjBqcDQzS1pFanAxaDBrblhURHRpeURBZXY2aVNIMlE3WmlycEsx?=
 =?utf-8?B?YjJ6V2lKS252dkdEUjUyR3hRbkVPcnBUVWNLd042Wjd0cGVkNDRsU0FyUTBo?=
 =?utf-8?B?ZGN3cUd3SGtZaWpKNGNxRnREWWhSV1pEMWplaXNyY1l1bExNQk9yZ1dYN2s4?=
 =?utf-8?B?bmJDRFJSV2ZvMVZSWngyWEdzTEZ6SEplTExHZUx4VlFvY1NYOE1nMkpTbVdH?=
 =?utf-8?B?aDhTU25XWnEzOXhxbDdKQnpyclE0ZldEWkhxQWpid05kV2xMc3JhSU5sRXky?=
 =?utf-8?B?alhPMjBaMVQrSzArMGtYQ1loRCtIY0tTd0paOFFzRjFSWmhIY3h2UVJ2UGN1?=
 =?utf-8?B?b1RzZVdHbWt3VzloeW1sVVNFYkkvNWNhbHR5Vkh3OGdFb0NEaXhzT2FRYm11?=
 =?utf-8?B?VVZOMC9PYm5vS0pDQUU2VG8wQi8wL0dUT0RkTW5YQmx4WEY5K0NvbUNZZzZR?=
 =?utf-8?B?UElFYUxzZVdHZjJSeVVBb2NyREh2OFNzWlM3eGRMRzBldmE5aUxINkE5QWE1?=
 =?utf-8?B?dG5WRGR0RDIwRFJMdWkxZWpONlJ2Q1RKSGdJYlpObjFTZTQyL051MjUzbGxq?=
 =?utf-8?B?eDE2VnRHV3I0NFc3MWoxbjl2cHBqNk11UWpXd3VvZEFGUFE2YVdqQjZqQjQ2?=
 =?utf-8?B?d011MVQ5NmY5c0pFd0J4MEROSmxzZFVkZDMvR0ZUTzJUdGt5VjFMSEVDMkM3?=
 =?utf-8?B?YTJxMlR4R25HRmhLYm5EcDVON0xub0ZVZi84OTNpU2hpT1hON25haFZEeDVj?=
 =?utf-8?Q?iX71si?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8205.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?R1BnTG4yMFRRSW5YTE0yeXE3T3dPMlBUZXBlS3V3Y0ZsTmM2bGE1MUpsUGVt?=
 =?utf-8?B?bloyZkdUMXdBQjhNK2p3dnZ1L1QwdStKNWlKZ3IrV0QwaXVCTGE1OW5MNkZK?=
 =?utf-8?B?RFVIL01PQjlUbXBtRzBtc2FvYWN1cFM2SXYwZVVRcjJycExNeFRpNHZFblc1?=
 =?utf-8?B?UFAxeC96V2xTWTRrK0xHc0xEV2U5UkZaeGord1A3WDBVSEtSUnphM3ZQYWxp?=
 =?utf-8?B?aGR1bGpGc3FRSk0xYnB5R1dVMUhKbkhjRFFtZldLemZPNkNGRWZvOFh3RHNU?=
 =?utf-8?B?Z1ZjK1VScGF3dnpOcTRUbTBabEF6bURQU0VRR1F3SDlONmlGK1d3N1NjcXBw?=
 =?utf-8?B?aFFmVEdnZmZqT2o4QzUvR3J6SUNUZ2hienJLZTVLOU5KZS9ibzZ4SG1uMnYv?=
 =?utf-8?B?ZXM4Z1RYWTlhNVErQ3k4M2cvblZWWUY2YWo1MkZLSExqbTR3N2x1dU1WQ1FM?=
 =?utf-8?B?dnE4Snlqa3U0U3hEWjh6aHZ0U3hzT2dxa2c2dWNuTnVkY2kraU9iTFNJMnJF?=
 =?utf-8?B?NUl1QUF1UXkwV2tveWlIMHJOSzIwL2poOGIrbXBWWmNzVzFxOGlVRWRQU2gx?=
 =?utf-8?B?YmVIM2RucGZNRk5ncGRlN1lNYmllZklHWm52OUxxRkVUMGNrSmx1MStTNWxo?=
 =?utf-8?B?WXE0VGJxb0VGcTR0MkUycUowellIRnFSajhjQ3o2aEhHREtEMzdLWXVwWHE2?=
 =?utf-8?B?d3BGNW42NGsvSnlBQzBCeEdEa3p0UEg0WEM2RXArcXh5RXZ1Wk44Y1AwbURQ?=
 =?utf-8?B?aW80aWJLcytXT0REQXJOcjdwOVNEMDZOVTg0c3luam5ZY0ZjNDVJZUJtLzdJ?=
 =?utf-8?B?YkhISVpQWGQ4UGtpTkt4L0JhRG10czlBMEkyeUJIR0JHVXhYbTR4c21oZUR4?=
 =?utf-8?B?ZzNqYWtZQXFFV3FMZUNBNFdCcjVkaGZQSXdNSDFwWFRScmdHNVB1dE9zbHpR?=
 =?utf-8?B?ZHJFYjVab2JhN05CdDRueXhZWml5TE13TGJDdW1teTFKVzRpWGw5YWZhWDRu?=
 =?utf-8?B?MVd3eDNHM3E3SEhXTThEYkNKZFJhc1VwVkU0dFhEdGlLbUgycTlhaWU4NkFQ?=
 =?utf-8?B?YkN2WmZTVWhZb2s1c09FK0pRQkxmemdTWFJYRVVkcER4WFVPV3IvOEh1Nitp?=
 =?utf-8?B?WjZQY29sUUtWODdMMEIybmR5WVlJU1grdi9LVHNRN3RsRFhPR1g1QU9iZWxa?=
 =?utf-8?B?ZGdDSWFFOVJua2tTM3M0d3RwQ0d6YlMyWWlweDFuQUg2Qi9CTmJkdm96Tk05?=
 =?utf-8?B?ZjY0eFdjOFJJTnNkMXF0QUxZUVFwVzB3aEU1RzhVQ3NFZmQzSWw5QzRQOGpl?=
 =?utf-8?B?UWQzczlObUg1cDNuWUwvYVlONGFvZTFwRkt3cnFrcmtKK0F5MnZqZW5NSkhI?=
 =?utf-8?B?dkk1ckF5ZnhRM0tIaStFanlKMmtWS0FjeTZwNjRuanhDQURta2NHelVERE5p?=
 =?utf-8?B?c1hmS2lTaFlnVFBoVlh6MmprUVlFd0Z5ZGFkM3lNWnNjdjFFUTlBOGgxbDVT?=
 =?utf-8?B?V05hb016d0U4bElTRC9MbXZwK1hUaUxNRHROQ043VW5xaHVtR3dadHZYMXVP?=
 =?utf-8?B?WFlDMy9halNPMWpEWFhiaHZQMVFGTGFiWHhvVVVDemxSODZqRldHTkM0aTBj?=
 =?utf-8?B?Vk5yNVpMS3VCN09hcXlia2xVcDk2VU9INWlBOGZXNTJPcGhzL3diYXpUU1RT?=
 =?utf-8?B?cTkvT0p6anI5Wjh3VnIvT3NSYkRScm5xekh5YXRtc1dwSmEzNEViZE0zZCtj?=
 =?utf-8?B?STVkTEFDcGhZRjAvZHN0YWpQbjJJWHdnQXhzWTRLV3creWNlMEgyZnFjLzQx?=
 =?utf-8?B?ejdCMjRQRU84Tm5EUnFJVGEvNlYxY0xSbGc0dWtCZytkMG0zUzJrUXdhSDVq?=
 =?utf-8?B?Y2txMmNBaW9ibitMVVcyV1ZUS0NMd1ZNb1NTR2hzMVV6VkVDU0dDWlFqc3dw?=
 =?utf-8?B?V2QvSXJYdHZQNEcyU3pPRXJzTUVJbTBMQTUzN1hJV08zQjdVSEJuTDdTUHFl?=
 =?utf-8?B?ZkpFekxtWHNFYXNyNWxlYXBtQnVPbitvekRpT2ZRQ2F4M0xsNkxENDVlN1Y5?=
 =?utf-8?B?RDdXVDV4WG5sYUpKeWY1NnRObHlnSFVWQ2FsN0hNYnhaZVA5cUpmd1FIYUFv?=
 =?utf-8?Q?ce6589bia+nagAcGSq1MqBHwC?=
X-OriginatorOrg: silabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd6694e2-a64b-4bea-e919-08de399962cd
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8205.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 16:13:28.5876
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 54dbd822-5231-4b20-944d-6f4abcd541fb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aWk/lYEmDaoDy39kS5lCMwLL2Av0tZFqqWuxQX0jDuF++INo+5ScJsMp2JOIwXQAnz0AemmVgBnpOrHDE4ZIBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF7468F7991
X-Proofpoint-ORIG-GUID: Nbc1DBrfRCQWYo5-4tZqb1O9fyodRM6W
X-Authority-Analysis: v=2.4 cv=brxBxUai c=1 sm=1 tr=0 ts=693c3f2a cx=c_pps
 a=poLntA6gJg8PyknBlaXY5w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=M51BFTxLslgA:10
 a=i1IsUcr2s-wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=2AEO0YjSAAAA:8
 a=mhnTNJ_rBLr-BtWZq_0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEyMDEyOCBTYWx0ZWRfX9u9VqR7JgvyY
 iTUjfmnMuKoYB7KHrTnaGfnaYYKD1PSwuJIne6Va9y67n5te/KOflxh0GzOu2O0hxrRJM50Ss95
 t4NUiQPKuys7H2T0U51bqBpFR+nez4zoPMZ5RZ9iZy+mImigAAlepGY20BXZOi5sBUCLmb+7d78
 cRDja6ZnAM4Lbba2xpVGfZQ2XPvzyoab1MdlLOehaQTp4wLtFoxZV9sSOBpAwOE17UdPWqcmVoy
 eI8IL5nTSoVyS1CDML8/T3XU4wdeek5E32neRVkgfHLctU4lBOl52VF3of5uterggNPdGjcSIz6
 D9ZvhCppzyHk3+DYSBeb/zzcnybob9EVugMdh3rqvdsI/5ccIgk50Wjnj7nsrhVvwV6PL54Gsnu
 etV5aIC0wNcNnNgNWj7ewki3SvaXUQ==
X-Proofpoint-GUID: Nbc1DBrfRCQWYo5-4tZqb1O9fyodRM6W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-12_04,2025-12-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 phishscore=0 spamscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512120128
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.10 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[silabs.com,reject];
	R_DKIM_ALLOW(-0.20)[silabs.com:s=pps12202023,silabs.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:148.163.153.153];
	RCVD_IN_DNSWL_LOW(-0.10)[148.163.153.153:from];
	MIME_GOOD(-0.10)[text/plain];
	ASN(0.00)[asn:22843, ipnet:148.163.152.0/22, country:US];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	BLOCKLISTDE_FAIL(0.00)[148.163.153.153:server fail,52.101.43.103:server fail,2603:10b6:8:162::17:server fail];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_IN_DNSWL_NONE(0.00)[52.101.43.103:received];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DNSWL_BLOCKED(0.00)[2603:10b6:8:162::17:received];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[silabs.com:+]
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: F09863FDB2
X-Spamd-Bar: ----
Message-ID-Hash: YR3THJO22LKCWIVVK4WS3K2TPUTG35OQ
X-Message-ID-Hash: YR3THJO22LKCWIVVK4WS3K2TPUTG35OQ
X-MailFrom: Damien.Riegel@silabs.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, Silicon Labs Kernel Team <linux-devel@silabs.com>, =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH 09/14] greybus: cpc: acknowledge all incoming messages
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/YR3THJO22LKCWIVVK4WS3K2TPUTG35OQ/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

Q3VycmVudGx5LCBDUEMgZG9lc24ndCBzZW5kIG1lc3NhZ2VzIG9uIGl0cyBvd24sIGl0IG9ubHkg
cHJlcGVuZHMgaXRzDQpoZWFkZXIgdG8gb3V0Z29pbmcgbWVzc2FnZXMuIFRoaXMgY2FuIGxlYWQg
dG8gbWVzc2FnZXMgbm90IGJlaW5nDQphY2tub3dsZWRnZWQsIGZvciBpbnN0YW5jZSBpbiB0aGUg
Y2FzZSBvZiBhbiBTVkMgUGluZw0KDQoJSG9zdAkJCQlEZXZpY2UNCg0KICBTVkMgUGluZyAoc2Vx
PVgsIGFjaz1ZKQ0KCQkJCSAgU1ZDIFBpbmcgUmVwbHkgKHNlcT1ZLCBhY2s9WCsxKQ0KDQpUaGUg
IlBpbmcgUmVwbHkiIGlzIG5ldmVyIGFja25vd2xlZGdlZCBhdCB0aGUgQ1BDIGxldmVsLCB3aGlj
aCBjYW4gbGVhZA0KdG8gcmV0cmFuc21pc3Npb25zLCBvciB3b3JzdCB0aGUgZGV2aWNlIG1pZ2h0
IHRoaW5rIHRoZSBsaW5rIGlzIGJyb2tlbg0KYW5kIGRvIHNvbWV0aGluZyB0byByZWNvdmVyLg0K
DQpUbyBwcmV2ZW50IHRoYXQgc2NlbmFyaW8sIGFuIGFjayBtZWNoYW5pc20gaXMgaW1wbGVtZW50
ZWQgaW4gdGhlIG1vc3QNCnN0cmFpZ2h0Zm9yd2FyZCBtYW5uZXI6IHNlbmQgYW4gQUNLIHRvIGFs
bCBpbmNvbWluZyBtZXNzYWdlcy4gSGVyZSwgdHdvDQpmbGFncyBuZWVkIHRvIGJlIGFkZGVkOg0K
IC0gRmlyc3QsIGFuIEFDSyBmcmFtZSBzaG91bGQgbm90IGJlIHBhc3NlZCB0byB0aGUgR3JleWJ1
cyBsYXllciwgc28gYQ0KICAgIkNPTlRST0wiIGZsYWcgaXMgYWRkZWQuIElmIHRoaXMgZmxhZyBp
cyBzZXQsIGl0IG1lYW5zIGl0J3MgYSBjb250cm9sDQogICBtZXNzYWdlcyBhbmQgc2hvdWxkIHN0
YXkgYXQgdGhlIENQQyBsZXZlbC4gQ3VycmVudGx5IHRoZXJlIGlzIG9ubHkNCiAgIG9uZSB0eXBl
IG9mIGNvbnRyb2wgZnJhbWUsIHRoZSBzdGFuZGFsb25lIGFjay4gQ29udHJvbCBtZXNzYWdlcyBo
YXZlDQogICB0aGUgc2FtZSBmb3JtYXQgYXMgR3JleWJ1cyBvcGVyYXRpb25zLg0KIC0gU2Vjb25k
LCBhY2sgdGhlbXNlbHZlcyBzaG91bGQgbm90IGJlIGFja2VkLCBzbyB0byBkZXRlcm1pbmUgaWYg
YQ0KICAgbWVzc2FnZSBzaG91bGQgYmUgYWNrZWQgb3Igbm90LCBhIFJFUVVFU1RfQUNLIGZsYWcg
aXMgYWRkZWQuDQoNClNpZ25lZC1vZmYtYnk6IERhbWllbiBSacOpZ2VsIDxkYW1pZW4ucmllZ2Vs
QHNpbGFicy5jb20+DQotLS0NCiBkcml2ZXJzL2dyZXlidXMvY3BjL2NwYy5oICAgICAgfCAgMyAr
Kw0KIGRyaXZlcnMvZ3JleWJ1cy9jcGMvY3BvcnQuYyAgICB8ICAxICsNCiBkcml2ZXJzL2dyZXli
dXMvY3BjL2hlYWRlci5jICAgfCA0MSArKysrKysrKysrKysrKysrKysrKysrKysrDQogZHJpdmVy
cy9ncmV5YnVzL2NwYy9oZWFkZXIuaCAgIHwgIDMgKysNCiBkcml2ZXJzL2dyZXlidXMvY3BjL3By
b3RvY29sLmMgfCA1NSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tDQogNSBmaWxl
cyBjaGFuZ2VkLCA5NSBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQ0KDQpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncmV5YnVzL2NwYy9jcGMuaCBiL2RyaXZlcnMvZ3JleWJ1cy9jcGMvY3BjLmgN
CmluZGV4IDg3YjU0YTRmZDM0Li43MjVmZDdmNGFmYyAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3Jl
eWJ1cy9jcGMvY3BjLmgNCisrKyBiL2RyaXZlcnMvZ3JleWJ1cy9jcGMvY3BjLmgNCkBAIC01MSw2
ICs1MSw5IEBAIHN0cnVjdCBjcGNfc2tiX2NiIHsNCiAJc3RydWN0IGdiX21lc3NhZ2UgKmdiX21l
c3NhZ2U7DQogDQogCXU4IHNlcTsNCisNCisjZGVmaW5lIENQQ19TS0JfRkxBR19SRVFfQUNLICgx
IDw8IDApDQorCXU4IGNwY19mbGFnczsNCiB9Ow0KIA0KICNkZWZpbmUgQ1BDX1NLQl9DQihfX3Nr
YikgKChzdHJ1Y3QgY3BjX3NrYl9jYiAqKSYoKF9fc2tiKS0+Y2JbMF0pKQ0KZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3JleWJ1cy9jcGMvY3BvcnQuYyBiL2RyaXZlcnMvZ3JleWJ1cy9jcGMvY3BvcnQu
Yw0KaW5kZXggMmVlMGIxMjk5OTYuLjM1YTE0OGFiYmVkIDEwMDY0NA0KLS0tIGEvZHJpdmVycy9n
cmV5YnVzL2NwYy9jcG9ydC5jDQorKysgYi9kcml2ZXJzL2dyZXlidXMvY3BjL2Nwb3J0LmMNCkBA
IC04Niw2ICs4Niw3IEBAIGludCBjcGNfY3BvcnRfdHJhbnNtaXQoc3RydWN0IGNwY19jcG9ydCAq
Y3BvcnQsIHN0cnVjdCBza19idWZmICpza2IpDQogCW11dGV4X2xvY2soJmNwb3J0LT5sb2NrKTsN
CiANCiAJQ1BDX1NLQl9DQihza2IpLT5zZXEgPSBjcG9ydC0+dGNiLnNlcTsNCisJQ1BDX1NLQl9D
Qihza2IpLT5jcGNfZmxhZ3MgPSBDUENfU0tCX0ZMQUdfUkVRX0FDSzsNCiANCiAJY3BvcnQtPnRj
Yi5zZXErKzsNCiAJYWNrID0gY3BvcnQtPnRjYi5hY2s7DQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cmV5YnVzL2NwYy9oZWFkZXIuYyBiL2RyaXZlcnMvZ3JleWJ1cy9jcGMvaGVhZGVyLmMNCmluZGV4
IDYyOTQ2ZDYwNzdlLi44ODc1YTZmZWQyNiAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3JleWJ1cy9j
cGMvaGVhZGVyLmMNCisrKyBiL2RyaXZlcnMvZ3JleWJ1cy9jcGMvaGVhZGVyLmMNCkBAIC0zLDgg
KzMsMjUgQEANCiAgKiBDb3B5cmlnaHQgKGMpIDIwMjUsIFNpbGljb24gTGFib3JhdG9yaWVzLCBJ
bmMuDQogICovDQogDQorI2luY2x1ZGUgPGxpbnV4L2JpdGZpZWxkLmg+DQorI2luY2x1ZGUgPGxp
bnV4L2JpdHMuaD4NCisNCiAjaW5jbHVkZSAiaGVhZGVyLmgiDQogDQorI2RlZmluZSBDUENfSEVB
REVSX0NPTlRST0xfSVNfQ09OVFJPTF9NQVNLIEJJVCg3KQ0KKyNkZWZpbmUgQ1BDX0hFQURFUl9D
T05UUk9MX1JFUV9BQ0tfTUFTSyBCSVQoNikNCisNCisvKioNCisgKiBjcGNfaGVhZGVyX2lzX2Nv
bnRyb2woKSAtIElkZW50aWZ5IGlmIHRoaXMgaXMgYSBjb250cm9sIGZyYW1lLg0KKyAqIEBoZHI6
IENQQyBoZWFkZXIuDQorICoNCisgKiBSZXR1cm46IFRydWUgaWYgdGhpcyBpcyBhIGNvbnRyb2wg
ZnJhbWUsIGZhbHNlIGlmIHRoaXMgYSBHcmV5YnVzIGZyYW1lLg0KKyAqLw0KK2Jvb2wgY3BjX2hl
YWRlcl9pc19jb250cm9sKGNvbnN0IHN0cnVjdCBjcGNfaGVhZGVyICpoZHIpDQorew0KKwlyZXR1
cm4gaGRyLT5jdHJsX2ZsYWdzICYgQ1BDX0hFQURFUl9DT05UUk9MX0lTX0NPTlRST0xfTUFTSzsN
Cit9DQorDQogLyoqDQogICogY3BjX2hlYWRlcl9nZXRfc2VxKCkgLSBHZXQgdGhlIHNlcXVlbmNl
IG51bWJlci4NCiAgKiBAaGRyOiBDUEMgaGVhZGVyLg0KQEAgLTE1LDMgKzMyLDI3IEBAIHU4IGNw
Y19oZWFkZXJfZ2V0X3NlcShjb25zdCBzdHJ1Y3QgY3BjX2hlYWRlciAqaGRyKQ0KIHsNCiAJcmV0
dXJuIGhkci0+c2VxOw0KIH0NCisNCisvKioNCisgKiBjcGNfaGVhZGVyX2dldF9yZXFfYWNrKCkg
LSBHZXQgdGhlIHJlcXVlc3QgYWNrbm93bGVkZ2UgZnJhbWUgZmxhZy4NCisgKiBAaGRyOiBDUEMg
aGVhZGVyLg0KKyAqDQorICogUmV0dXJuOiBSZXF1ZXN0IGFja25vd2xlZGdlIGZyYW1lIGZsYWcu
DQorICovDQorYm9vbCBjcGNfaGVhZGVyX2dldF9yZXFfYWNrKGNvbnN0IHN0cnVjdCBjcGNfaGVh
ZGVyICpoZHIpDQorew0KKwlyZXR1cm4gRklFTERfR0VUKENQQ19IRUFERVJfQ09OVFJPTF9SRVFf
QUNLX01BU0ssIGhkci0+Y3RybF9mbGFncyk7DQorfQ0KKw0KKy8qKg0KKyAqIGNwY19oZWFkZXJf
ZW5jb2RlX2N0cmxfZmxhZ3MoKSAtIEVuY29kZSBwYXJhbWV0ZXJzIGludG8gdGhlIGNvbnRyb2wg
Ynl0ZS4NCisgKiBAY29udHJvbDogVHJ1ZSBpZiBDUEMgY29udHJvbCBmcmFtZSwgZmFsc2UgaWYg
R3JleWJ1cyBmcmFtZS4NCisgKiBAcmVxX2FjazogRnJhbWUgZmxhZyBpbmRpY2F0aW5nIGEgcmVx
dWVzdCB0byBiZSBhY2tub3dsZWRnZWQuDQorICoNCisgKiBSZXR1cm46IEVuY29kZWQgY29udHJv
bCBieXRlLg0KKyAqLw0KK3U4IGNwY19oZWFkZXJfZW5jb2RlX2N0cmxfZmxhZ3MoYm9vbCBjb250
cm9sLCBib29sIHJlcV9hY2spDQorew0KKwlyZXR1cm4gRklFTERfUFJFUChDUENfSEVBREVSX0NP
TlRST0xfSVNfQ09OVFJPTF9NQVNLLCBjb250cm9sKSB8DQorCSAgICAgICBGSUVMRF9QUkVQKENQ
Q19IRUFERVJfQ09OVFJPTF9SRVFfQUNLX01BU0ssIHJlcV9hY2spOw0KK30NCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dyZXlidXMvY3BjL2hlYWRlci5oIGIvZHJpdmVycy9ncmV5YnVzL2NwYy9oZWFk
ZXIuaA0KaW5kZXggMmE2NGFhOGQyNzguLjBjOWY2ZTU2NTI0IDEwMDY0NA0KLS0tIGEvZHJpdmVy
cy9ncmV5YnVzL2NwYy9oZWFkZXIuaA0KKysrIGIvZHJpdmVycy9ncmV5YnVzL2NwYy9oZWFkZXIu
aA0KQEAgLTQxLDYgKzQxLDkgQEAgc3RydWN0IGNwY19oZWFkZXIgew0KICNkZWZpbmUgQ1BDX0hF
QURFUl9TSVpFIChzaXplb2Yoc3RydWN0IGNwY19oZWFkZXIpKQ0KICNkZWZpbmUgR1JFWUJVU19I
RUFERVJfU0laRSAoc2l6ZW9mKHN0cnVjdCBnYl9vcGVyYXRpb25fbXNnX2hkcikpDQogDQorYm9v
bCBjcGNfaGVhZGVyX2lzX2NvbnRyb2woY29uc3Qgc3RydWN0IGNwY19oZWFkZXIgKmhkcik7DQog
dTggY3BjX2hlYWRlcl9nZXRfc2VxKGNvbnN0IHN0cnVjdCBjcGNfaGVhZGVyICpoZHIpOw0KK2Jv
b2wgY3BjX2hlYWRlcl9nZXRfcmVxX2Fjayhjb25zdCBzdHJ1Y3QgY3BjX2hlYWRlciAqaGRyKTsN
Cit1OCBjcGNfaGVhZGVyX2VuY29kZV9jdHJsX2ZsYWdzKGJvb2wgY29udHJvbCwgYm9vbCByZXFf
YWNrKTsNCiANCiAjZW5kaWYNCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dyZXlidXMvY3BjL3Byb3Rv
Y29sLmMgYi9kcml2ZXJzL2dyZXlidXMvY3BjL3Byb3RvY29sLmMNCmluZGV4IDAzNzkxMGU4OTlm
Li5iNGRkNGUxNzNhMSAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3JleWJ1cy9jcGMvcHJvdG9jb2wu
Yw0KKysrIGIvZHJpdmVycy9ncmV5YnVzL2NwYy9wcm90b2NvbC5jDQpAQCAtOSw2ICs5LDExIEBA
DQogI2luY2x1ZGUgImhlYWRlci5oIg0KICNpbmNsdWRlICJob3N0LmgiDQogDQorc3RhdGljIGJv
b2wgY3BjX3NrYl9pc19zZXF1ZW5jZWQoc3RydWN0IHNrX2J1ZmYgKnNrYikNCit7DQorCXJldHVy
biBDUENfU0tCX0NCKHNrYiktPmNwY19mbGFncyAmIENQQ19TS0JfRkxBR19SRVFfQUNLOw0KK30N
CisNCiB2b2lkIGNwY19wcm90b2NvbF9wcmVwYXJlX2hlYWRlcihzdHJ1Y3Qgc2tfYnVmZiAqc2ti
LCB1OCBhY2spDQogew0KIAlzdHJ1Y3QgY3BjX2hlYWRlciAqaGRyOw0KQEAgLTE4LDI4ICsyMyw2
MiBAQCB2b2lkIGNwY19wcm90b2NvbF9wcmVwYXJlX2hlYWRlcihzdHJ1Y3Qgc2tfYnVmZiAqc2ti
LCB1OCBhY2spDQogCWhkciA9IChzdHJ1Y3QgY3BjX2hlYWRlciAqKXNrYi0+ZGF0YTsNCiAJaGRy
LT5hY2sgPSBhY2s7DQogCWhkci0+cmVjdl93bmQgPSAwOw0KLQloZHItPmN0cmxfZmxhZ3MgPSAw
Ow0KIAloZHItPnNlcSA9IENQQ19TS0JfQ0Ioc2tiKS0+c2VxOw0KKwloZHItPmN0cmxfZmxhZ3Mg
PSBjcGNfaGVhZGVyX2VuY29kZV9jdHJsX2ZsYWdzKCFDUENfU0tCX0NCKHNrYiktPmdiX21lc3Nh
Z2UsDQorCQkJCQkJICAgICAgIGNwY19za2JfaXNfc2VxdWVuY2VkKHNrYikpOw0KK30NCisNCitz
dGF0aWMgdm9pZCBjcGNfcHJvdG9jb2xfcXVldWVfYWNrKHN0cnVjdCBjcGNfY3BvcnQgKmNwb3J0
LCB1OCBhY2spDQorew0KKwlzdHJ1Y3QgZ2Jfb3BlcmF0aW9uX21zZ19oZHIgKmdiX2hkcjsNCisJ
c3RydWN0IHNrX2J1ZmYgKnNrYjsNCisNCisJc2tiID0gYWxsb2Nfc2tiKENQQ19IRUFERVJfU0la
RSArIHNpemVvZigqZ2JfaGRyKSwgR0ZQX0tFUk5FTCk7DQorCWlmICghc2tiKQ0KKwkJcmV0dXJu
Ow0KKw0KKwlza2JfcmVzZXJ2ZShza2IsIENQQ19IRUFERVJfU0laRSk7DQorDQorCWdiX2hkciA9
IHNrYl9wdXQoc2tiLCBzaXplb2YoKmdiX2hkcikpOw0KKwltZW1zZXQoZ2JfaGRyLCAwLCBzaXpl
b2YoKmdiX2hkcikpOw0KKw0KKwkvKiBJbiB0aGUgQ1BDIE9wZXJhdGlvbiBIZWFkZXIsIG9ubHkg
dGhlIHNpemUgYW5kIGNwb3J0X2lkIG1hdHRlciBmb3IgQUNLcy4gKi8NCisJZ2JfaGRyLT5zaXpl
ID0gc2l6ZW9mKCpnYl9oZHIpOw0KKwljcGNfY3BvcnRfcGFjayhnYl9oZHIsIGNwb3J0LT5pZCk7
DQorDQorCWNwY19wcm90b2NvbF9wcmVwYXJlX2hlYWRlcihza2IsIGFjayk7DQorDQorCWNwY19o
ZF9zZW5kX3NrYihjcG9ydC0+Y3BjX2hkLCBza2IpOw0KIH0NCiANCiB2b2lkIGNwY19wcm90b2Nv
bF9vbl9kYXRhKHN0cnVjdCBjcGNfY3BvcnQgKmNwb3J0LCBzdHJ1Y3Qgc2tfYnVmZiAqc2tiKQ0K
IHsNCiAJc3RydWN0IGNwY19oZWFkZXIgKmNwY19oZHIgPSAoc3RydWN0IGNwY19oZWFkZXIgKilz
a2ItPmRhdGE7DQorCWJvb2wgcmVxdWlyZV9hY2sgPSBjcGNfaGVhZGVyX2dldF9yZXFfYWNrKGNw
Y19oZHIpOw0KIAl1OCBzZXEgPSBjcGNfaGVhZGVyX2dldF9zZXEoY3BjX2hkcik7DQogCWJvb2wg
ZXhwZWN0ZWRfc2VxID0gZmFsc2U7DQorCXU4IGFjazsNCiANCiAJbXV0ZXhfbG9jaygmY3BvcnQt
PmxvY2spOw0KIA0KLQlleHBlY3RlZF9zZXEgPSBzZXEgPT0gY3BvcnQtPnRjYi5hY2s7DQotCWlm
IChleHBlY3RlZF9zZXEpDQotCQljcG9ydC0+dGNiLmFjaysrOw0KLQllbHNlDQotCQlkZXZfd2Fy
bihjcGNfaGRfZGV2KGNwb3J0LT5jcGNfaGQpLCAidW5leHBlY3RlZCBzZXE6ICV1LCBleHBlY3Rl
ZCBzZXE6ICV1XG4iLCBzZXEsDQotCQkJIGNwb3J0LT50Y2IuYWNrKTsNCisJaWYgKHJlcXVpcmVf
YWNrKSB7DQorCQlleHBlY3RlZF9zZXEgPSBzZXEgPT0gY3BvcnQtPnRjYi5hY2s7DQorCQlpZiAo
ZXhwZWN0ZWRfc2VxKQ0KKwkJCWNwb3J0LT50Y2IuYWNrKys7DQorCQllbHNlDQorCQkJZGV2X3dh
cm4oY3BjX2hkX2RldihjcG9ydC0+Y3BjX2hkKSwNCisJCQkJICJ1bmV4cGVjdGVkIHNlcTogJXUs
IGV4cGVjdGVkIHNlcTogJXVcbiIsIHNlcSwgY3BvcnQtPnRjYi5hY2spOw0KKwl9DQorDQorCWFj
ayA9IGNwb3J0LT50Y2IuYWNrOw0KIA0KIAltdXRleF91bmxvY2soJmNwb3J0LT5sb2NrKTsNCiAN
Ci0JaWYgKGV4cGVjdGVkX3NlcSkgew0KKwkvKiBBY2sgbm8gbWF0dGVyIGlmIHRoZSBzZXF1ZW5j
ZSB3YXMgdmFsaWQgb3Igbm90LCB0byByZXN5bmMgd2l0aCByZW1vdGUgKi8NCisJaWYgKHJlcXVp
cmVfYWNrKQ0KKwkJY3BjX3Byb3RvY29sX3F1ZXVlX2FjayhjcG9ydCwgYWNrKTsNCisNCisJaWYg
KGV4cGVjdGVkX3NlcSAmJiAhY3BjX2hlYWRlcl9pc19jb250cm9sKGNwY19oZHIpKSB7DQogCQlz
a2JfcHVsbChza2IsIENQQ19IRUFERVJfU0laRSk7DQogDQogCQlncmV5YnVzX2RhdGFfcmN2ZChj
cG9ydC0+Y3BjX2hkLT5nYl9oZCwgY3BvcnQtPmlkLCBza2ItPmRhdGEsIHNrYi0+bGVuKTsNCi0t
IA0KMi40OS4wDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmdyZXlidXMtZGV2IG1haWxpbmcgbGlzdCAtLSBncmV5YnVzLWRldkBsaXN0cy5saW5hcm8u
b3JnClRvIHVuc3Vic2NyaWJlIHNlbmQgYW4gZW1haWwgdG8gZ3JleWJ1cy1kZXYtbGVhdmVAbGlz
dHMubGluYXJvLm9yZwo=
