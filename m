Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id E5E5CC5E65E
	for <lists+greybus-dev@lfdr.de>; Fri, 14 Nov 2025 18:03:08 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 8AE273F7F5
	for <lists+greybus-dev@lfdr.de>; Fri, 14 Nov 2025 17:03:07 +0000 (UTC)
Received: from mx0b-0024c301.pphosted.com (mx0b-0024c301.pphosted.com [148.163.153.153])
	by lists.linaro.org (Postfix) with ESMTPS id 73EE43F75F
	for <greybus-dev@lists.linaro.org>; Fri, 14 Nov 2025 16:44:31 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=silabs.com header.s=pps12202023 header.b=u4mErjXL;
	dkim=pass header.d=silabs.com header.s=selector1 header.b=HWmPdbtG;
	dmarc=pass (policy=reject) header.from=silabs.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1");
	spf=pass (lists.linaro.org: domain of Yacin.Belmihoub-Martel@silabs.com designates 148.163.153.153 as permitted sender) smtp.mailfrom=Yacin.Belmihoub-Martel@silabs.com
Received: from pps.filterd (m0101742.ppops.net [127.0.0.1])
	by mx0a-0024c301.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AECi1FP2442007;
	Fri, 14 Nov 2025 10:44:26 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps12202023;
	 bh=WFsgy+Qswkl6/eviM9qHAa1a2GfyfK4znExz6h9Ignc=; b=u4mErjXLpxQm
	jecp31kenXBaXiHXKR0TeV67KM3f41Se11iU7hd1hqb06YY7KcP7csCFy70O6+wd
	eNVow7ve/VIUjRxy4+Vpqj8JUKrurkktc+7gtlAnjP7t5Gx+tkiP0eifOFZYHh+g
	B/mnMZcW/q/cek+zBrLJ9lYCGzXBhgkA/xIL1FhzVqwGzQ7CSDJpRN3fOjO/JK9K
	CJrzkhClGaSDIZ0ziVTSQi8eVlzIz2irIVjHocR9N1UQHqmBr87aXHquEpDdjP1w
	kOzPOrSQjtqEuu1DNr1QBCERVR1w+ScYH0MCwWG0nMGs5eMFew0EPNJAEh4c8iNR
	aMG+W+6UPQ==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11020110.outbound.protection.outlook.com [52.101.193.110])
	by mx0a-0024c301.pphosted.com (PPS) with ESMTPS id 4adr8fsubm-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 14 Nov 2025 10:44:26 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h7PugopOCtzpXIe7+/BX8Lx5GCVAyIBcIDLiLMphFMszP2vJxdwqGxEBwZGR5pB6GQ5E5z1KleWsrLJXcnzsgCChy+t5EUeG0Al0S4i4SucEY51oD79x4d6Lu+Kyjk/2JBzzUaXNFQ9ozJtcVEMJcGpcm3ingbRH+OFkQl53WJQ0lHqKV68Dck5UvY9hnR6Qexm7G82XpGcM4HsizygrBO5L5f1RjNrTEED2faY/HoLtZe+SbQCcp8C0qeje0VdDaS4wnfo1O2KoNP0SCAjQGI/g/68iRKLY8/MoaQh++bYSuz+7U70Xd8Nzi9j5xl/bv4HYXKH+wyycbcK1B1tytw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WFsgy+Qswkl6/eviM9qHAa1a2GfyfK4znExz6h9Ignc=;
 b=EU5K0axX4BQ3JpVNfrxdIaWS9SOMCcgLYBsRhPV2NXx0OwaDVfx7RbVCCxbOsQvibScCCMJbn2MqsW3bYjaLBz9VOYQEUO9BStxVZE/QVQOUxJaLHeRiaGrQ1PZs4Rx55nsa6V3L9DYduS/tAtWsjlo+iAmQqy1+2AIdG4OGXEzXwvH689TpG97+u9wwaNTQo8xykKqRfyz1TH7TCfPb21A6l538CsYdF7Gm0wUCpibTJFZXfYJzNP21JxQFL6Y39fnNI/a5Y+FzSWuqqsdoWCN9wmCJqRTnAjXAsKMzv7+iM434oe9khTN7ydlJc1sTuc0u7HboT1HlNMrjpkQgTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silabs.com; dmarc=pass action=none header.from=silabs.com;
 dkim=pass header.d=silabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WFsgy+Qswkl6/eviM9qHAa1a2GfyfK4znExz6h9Ignc=;
 b=HWmPdbtGRiD35NjDbdhmNjAeRafWbmijd9oS7MZMCFhsMnH1BzfDsVQrZaOY8aP76B4Wka6wWFB8pmEhYQy9a3rhZ44wJzN5GF5XWi4glGpEnTWKqQkIra/3ZOFqkMhallE7RWxkWANAppy7XFBBxesC3ttI1KEykKyRlVzQ1IA=
Received: from PH0PR11MB4998.namprd11.prod.outlook.com (2603:10b6:510:32::8)
 by CY5PR11MB6233.namprd11.prod.outlook.com (2603:10b6:930:26::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.18; Fri, 14 Nov
 2025 16:44:21 +0000
Received: from PH0PR11MB4998.namprd11.prod.outlook.com
 ([fe80::e321:4da6:3811:2e16]) by PH0PR11MB4998.namprd11.prod.outlook.com
 ([fe80::e321:4da6:3811:2e16%5]) with mapi id 15.20.9320.013; Fri, 14 Nov 2025
 16:44:21 +0000
Date: Fri, 14 Nov 2025 11:44:19 -0500
Message-Id: <DE8KHQH20JCP.1GG6GV8EBNB6L@silabs.com>
From: "Yacin Belmihoub-Martel" <yacin.belmihoub-martel@silabs.com>
To: =?utf-8?q?Damien_Ri=C3=A9gel?= <damien.riegel@silabs.com>,
        <greybus-dev@lists.linaro.org>, "Johan Hovold" <johan@kernel.org>,
        "Alex
 Elder" <elder@kernel.org>,
        "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>,
        <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.20.1-25-g357c1bff1570
References: <20251114150738.32426-1-damien.riegel@silabs.com>
 <20251114150738.32426-2-damien.riegel@silabs.com>
In-Reply-To: <20251114150738.32426-2-damien.riegel@silabs.com>
X-ClientProxiedBy: YQBPR0101CA0335.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:6b::20) To PH0PR11MB4998.namprd11.prod.outlook.com
 (2603:10b6:510:32::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB4998:EE_|CY5PR11MB6233:EE_
X-MS-Office365-Filtering-Correlation-Id: f489b9fd-88e5-4ea3-1e60-08de239d0fdb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?RTg2ZkVBaFJPQTZ0UlVyamZHb2pvWEhOL2ZuWUw5TWRWRVhPb3FWTmpmc1o0?=
 =?utf-8?B?ZTFFY3Vra3JWbG1TQzUvOHhvcUprZFVoQk10THF1dGxvNVZIOUo4ZmJ0VW1k?=
 =?utf-8?B?K1dDemhVNVgxSThQODQ4MGwyRTI0d0pTTlhNbE1tZU9BZ0R5cGZIUURydHYr?=
 =?utf-8?B?SUlYM3lYWVkram5oaXk3djd4VS82NVdVSksxQTcxQnlISDJIM2tubC9zRy9w?=
 =?utf-8?B?WGV4SkR5anVkd2RNbGMwc0tVWkMyWUdYYXlwVytMM3hIb3REWlM4Q3RZY2s1?=
 =?utf-8?B?ODk5S0Q3WThYSEdoaTVCRjZXci8yMWNhc2pEYTkzMWR2dXFCcnFpMDNJRElF?=
 =?utf-8?B?ZXpJc0pxMDdERzNHYlJaNHlXQlowS1BPby9ZL0k1ZDcxbkxaakRBTUNCUzVq?=
 =?utf-8?B?KzNXbTN0bnowV2NGYml5OHZrM1d6YUJJZnErTWNFbXBPMWIyRk5jaitPZlF2?=
 =?utf-8?B?VlpBMmYwTk4xRWt1QlA3RHZJVU5lbk9tK3JIMm1LQzBKditmemZQTWlKUHZX?=
 =?utf-8?B?TTV0a3grOE01Q0Y4K1ZiN2xaWWRsMjVlVGhlV3F1U0IyYzFBeEpSTHQxd2FE?=
 =?utf-8?B?SjA3N0FFbEN1RmcvdlJCNU5LeFhOc2tUSGJGTWE1YjRzL1dlQmZlbit2cGRo?=
 =?utf-8?B?TStSK2ZYUzFhNUQ3MkU4VmJKS09mdkxXQVo5dUJBWlR5N2hVRG5sQVZ1YzhP?=
 =?utf-8?B?MUc4NjFzVkpHNGE3V29XalN3NFcvUUYxTVphSHRpcVkyY1dyQzhvUXNDeVU4?=
 =?utf-8?B?U3M4MkMrT1BRTmc5aHdoenVOZ016UUtZMyt5ai9WdFcyVUFVMDdyOHp4T3Yx?=
 =?utf-8?B?QytkZVUvSDh5dVZqTzRmckt1bnplRGVrV2swSU5QV1FQS3VGSFNObVhUdE02?=
 =?utf-8?B?Wm4wd24waEw3ZnNTd0o5dTYrV3BKcS9NYTBVaUFPSEM2b29DOUkrTVRJREhz?=
 =?utf-8?B?VEh6QU0wcFhlMGMybkpiSEhRbjZhRVNKcXZYUTBzQURhMGkvald1VGlXVU9p?=
 =?utf-8?B?WVVQeGpoTzkyMWdLZFZyMXlyRTlLWTJPSU9vM0NmUjBhMHhyS04vNmZpc0NE?=
 =?utf-8?B?V2R0Z2xUcnRObE5aajFPeWJoQzd5Qk5NcjRCRFhXWnErSTJCUXR6VW5nMEF4?=
 =?utf-8?B?VnVNM0ZJUjFwN1JSNVZnUDlXUlF4OUF0OFVKdUFmWHZ6V1hKVzlvQzdDY1FC?=
 =?utf-8?B?MmtIcVpuYWtzdUVHZE1JWFpNam5RQWlyb0J1a2hzMGN5L1hFTXZqcFVnRUUv?=
 =?utf-8?B?RS9USmEzSUhxS01qeHhYZ0dJS2l2SDBDTGI5UkZsNWpKN2hsQzBQcld1TUhH?=
 =?utf-8?B?SmRlM3JCSm5UNEgzbUs0UncxNHBGaG9kNzdUQ0NiZ25ZcVk1UStRTTZ2MC9r?=
 =?utf-8?B?c2Y3ZW9MaTZ5NG5RZHRZLzNoNmxWSVNrL2FpTHNManUrNEYwMUtXNUx2b3Jn?=
 =?utf-8?B?Mkt6aUNEeTlVbTFOMWVPbG5PU1VTT05Va0tXemp3Nm5ySy9iR05pYmV6Z01i?=
 =?utf-8?B?YldPNDNDNXNZK3VaZ3R5VHZ6VmJHRzFuQkxxaEpPYk0xVEFxczNXZzJwZkVH?=
 =?utf-8?B?SGVjR0tJK0lBa3ZmQmZuNHNqcHpWR2w4VEk4UGRwUG0xR3gvZmhNUE9tdUIw?=
 =?utf-8?B?RzNaVlkydmVNM1dXTXRyOFVkT0FJNWU5aDgyclJRaGt3NGtGZ3Y3QXdGSjhI?=
 =?utf-8?B?OEdEM3lhbmJvWXc4TjZ0elZ5aHlBOFJzTStqR2lUUUtqYnVlKy8rL1luNDZ5?=
 =?utf-8?B?bnB6T2VIODYwSG5mU1JoK05INGhYNkRVOWJNSFk1MnQrNVM1eHpxTjFOalJk?=
 =?utf-8?B?Sk4xa1JEUFFVeTZwa0I5NG9MWk4xeVREcTBnajVKcmdDUnF4dWVNUTBtd0Rn?=
 =?utf-8?B?cTZINW5lR0ovM2JKK3kwMCtZbnJWdlEyRnI1OXBhTTdsZFQyYjB1SjlQcEhQ?=
 =?utf-8?Q?8l0auFtZ2p/MJYAJ3Ns9h7J8agkCPwvb?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB4998.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?M1RDVmpLckV4Yk9BbVJHbVM2aVV2ang2UGJaU1B0ZEUwZmhxNzBFZnh0UVBm?=
 =?utf-8?B?di9KOS9aZkg4Kysyb1dLU0ZyRjVzOVdhcnBzTUxHYmZxWEQ4c09KWElJM3dl?=
 =?utf-8?B?ck0xbllxdVBsUlFpZWZoSTRYQUxQQURRNENxR3cxN3g4eFQraHVmeGJLa1Vx?=
 =?utf-8?B?clFzbk9KMGZxNndiZ09YNFlyV0J2SmI2MkRoQ094aVF2aFZoUmo1WXRhZi9B?=
 =?utf-8?B?TEpRbTB1MEZOcERvc3JNc3Z2eFRZNG9Ga0dMVkE4Q2pVVStsMHJLNDNWWWVJ?=
 =?utf-8?B?dElnekhDZFkzMFNRa3hkeWJGSlBQUTRwanJobStwV00vUkZGc3JrUmhvZ1J6?=
 =?utf-8?B?ZzNlRG5Cc0NxaEpnQTVpSXp5MDhmZ3I3SmFaekhvMXhnYVoxZjZRL25zTTFL?=
 =?utf-8?B?N3kxVTg5MEVXbG9ySzExOXA3UmxuM1VMQ2JHMlh5c21FTlMzd2ZueGNsRlVu?=
 =?utf-8?B?eWx4WW1xLzVrbUZWVWtYT0s0N1RIQVFab2JNVkJ3MGRoSWFTSkZ5L2g5UW1p?=
 =?utf-8?B?QXRzOC9RcGpYSW9JbGZrVEpPaVk2SmtBcmF5U1l1bXBoblYwUys1NXRjWUl6?=
 =?utf-8?B?dC9YaVN1N21RV2lsS1Y1SVFRQjlHSEdCZG1RZmM4VTBtcFNmRFJIY2tJcXNl?=
 =?utf-8?B?aWR3UTVZUm43aHdYRmN0L3hQcU1ZcmxVMjgyMVlyUGRLT0ZiODAzckdQeVFh?=
 =?utf-8?B?NzI3bFlrWjJiWWxPR0N4ZFFZckVsaHJQTWdFcENDSERqVzZBS0lCOVhmTFg0?=
 =?utf-8?B?L3hmaDlhU0FiRHc2NWd5QUhKRWdielBFejZ2UitzR0FpWXpmczNsd2JPZ0hQ?=
 =?utf-8?B?UXBPa0RRMjFtalA4OUtQdmR2MkIzTU1VaG5HK2NwTHpoMEFwbDJzWnFQR3Vk?=
 =?utf-8?B?QXhFaTRJOVFrWWg2SzV6Q2dqNDhXckFhcjBjUWl5VzFqZW1zRG84UHBPNEpO?=
 =?utf-8?B?Ni9vcUdrWVVkZ3pDc1FmM1dYSndzdkEybVhXNmlHcTJUZlpUTmpLQk5LKzg4?=
 =?utf-8?B?TnNyY0xuVWowSnJJbktYektackF5MjVlWEd0NzdUSGdoUWNFSlV3dHphSDhB?=
 =?utf-8?B?OExINW1WeDZuZHpWempsT1I3aEZSclBWaE1rRDNzWE8vSUhFbGZLT2tORlU5?=
 =?utf-8?B?dmJxUVV3a2QzNHYyNDJvVzU1ZFoweEt3T3ZkMGNCeS9aYnJ1WVJiSUdFVHBQ?=
 =?utf-8?B?TUhxZStLNDFkQmFkRnU0Ly95bU1BRDhVTWcySlMxMmZJcENjNFNzMnpHNjM4?=
 =?utf-8?B?ME1uVzY5dlZXVDJWcWJuejcvd0RlKys4ZXRSM0JEU2V1UGxZbmVrQkdNZVp3?=
 =?utf-8?B?aEFVOC8rTE5XU3MrTzJZZXdabFhpQkY4VXp1bzFkY1orSVErQnNwUUZQZ2tG?=
 =?utf-8?B?czVGb0FscitYVmxHc0FpczdEY1hOZk5FaUN1YXJ1WkpRMmZtU1FyeWlHNE9v?=
 =?utf-8?B?S3NCeE9WQWRnZzEvMVMrTGdodmhJY1BpVGVMaEhzaXNhZTJtWStNbnhDSXR5?=
 =?utf-8?B?WHVhbXlYb0hRRTltTjRNK2VDL0NBN3BwMWVtRHVqN29TOTdtcU1jYk1BMHUw?=
 =?utf-8?B?Rm05TDJTcHJkanZvWjluR2g4bVVRUW5ySnQ3QmtDWHRSOXRmTG80bkFtMWlF?=
 =?utf-8?B?VTdCd0Ira2NPOU5rekdTQ0VaK3lRdE9yWTZ3anl4dzMvUmdhb2VzRFd5aWVF?=
 =?utf-8?B?ZGM5NFdZRHp3NVN1eXZKd211bjluUXJUMG9QcmRSTU9zbThrUDYwU2JQZlRl?=
 =?utf-8?B?S1p6WDVreStoKy9EemJhejA1NmxiM0Rmd3pQN3U0OUtUa2ZPVTg3M3V1eGw5?=
 =?utf-8?B?ZEp4NCt5UW1YTkZtUFpuUGp6QjRlMTRBemx5UkZwVlBrSk5Fd0piaHN1UFdo?=
 =?utf-8?B?NW8rTm9uVGd0UUJWaTc4SVpxRkEzNUlxQjEwZk1UTUlFQTN5MWwyY2RDNk9B?=
 =?utf-8?B?alFWY3pPeFM3Vkoyc0RJZ2FYUFdRcVRXelZqVkdZK0p0WFA3Mm9vUDkzY0Zw?=
 =?utf-8?B?eVVFNVdLKzhSb1RrcDNXMjNPaHd5TE0waGFrU0tQNlVUZU0rRE4zaTBaa0Yv?=
 =?utf-8?B?aVEwbkhJZU9uSGVOZjdYaEluYnI2ZklyNnkvSVZleCtNU3E1MmhQRlR5aDVW?=
 =?utf-8?Q?gqfISDWG11RUWt32q2bSa61e/?=
X-OriginatorOrg: silabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f489b9fd-88e5-4ea3-1e60-08de239d0fdb
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB4998.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 16:44:21.7530
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 54dbd822-5231-4b20-944d-6f4abcd541fb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JLAvTlv4apjAbAolO4ts5YWPfs8oASCuUU1YXxyx+xqTvImOHE6dlNn9KrIl9nJ1WuVOe25WGKpFWHHC/SvJzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6233
X-Proofpoint-ORIG-GUID: q9bEuULhKYeQ6fJIjY-M3nQb9PrDGrhL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDEzNSBTYWx0ZWRfX3aJQAS829RI0
 qVIcbntBsXv/GiI6q7pGs1aBnrwFeb+d/mMwT93P4xGDvMkuQ+6iVGUXVFQEg1tzqYjAD3dEfrm
 jSxFKKHL+fTEWjg5P51nH0ZSOFpUntpHgNzNy33fb58puTf4gbE4/csyEUU++YcQbEtIb3TJrs7
 kjFZtWMI7yxwxHcfj3eW/4/f1Au0uIT2R6MK2evz0C7rNr58J/r667vLJRLIRzu/6goP7qvj7Xw
 WSAKXa7sYZyDDOsKq+oIgV80ErYIJFa4uwmbS6wu4Jp3xrbF3dCz0h3Ll91viEj6t1fnk72XL7r
 mAn0ySxgKlC2MRA1nL9B+WH7BjQ/A3rU/VGICeteDcDuLboqymzPFxu7+ZypFOm2dOsevzZewtt
 o/dvfXuCsJonUOtIi2pl/2+g7bg+tg==
X-Authority-Analysis: v=2.4 cv=BYPVE7t2 c=1 sm=1 tr=0 ts=69175c6a cx=c_pps
 a=pY+kOdcf8RAo0+yonGAjpg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=i1IsUcr2s-wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=F0weUSp5pyGIr-2fPg4A:9 a=QEXdDO2ut3YA:10
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: q9bEuULhKYeQ6fJIjY-M3nQb9PrDGrhL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_05,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 malwarescore=0 suspectscore=0 clxscore=1011
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511140135
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 73EE43F75F
X-Spamd-Bar: ----
X-Spamd-Result: default: False [-4.92 / 15.00];
	BAYES_HAM(-2.92)[99.67%];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[silabs.com,reject];
	R_DKIM_ALLOW(-0.20)[silabs.com:s=pps12202023,silabs.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:148.163.153.153];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_POSSIBLE(0.00)[148.163.153.153:from];
	ASN(0.00)[asn:22843, ipnet:148.163.152.0/22, country:US];
	RCPT_COUNT_SEVEN(0.00)[7];
	MIME_TRACE(0.00)[0:+];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	DKIM_TRACE(0.00)[silabs.com:+]
X-Rspamd-Action: no action
X-MailFrom: Yacin.Belmihoub-Martel@silabs.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: PRS7G5SM3IOZIW6KOTEB6UOPENT44I7X
X-Message-ID-Hash: PRS7G5SM3IOZIW6KOTEB6UOPENT44I7X
X-Mailman-Approved-At: Fri, 14 Nov 2025 17:03:04 +0000
CC: Silicon Labs Kernel Team <linux-devel@silabs.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [RFC PATCH v2 01/12] greybus: cpc: add minimal CPC Host Device infrastructure
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/PRS7G5SM3IOZIW6KOTEB6UOPENT44I7X/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gRnJpIE5vdiAxNCwgMjAyNSBhdCAxMDowNyBBTSBFU1QsIERhbWllbiBSacOpZ2VsIHdyb3Rl
Og0KPiAgIyBHcmV5YnVzIEhvc3QgY29udHJvbGxlciBkcml2ZXJzDQo+ICBvYmotJChDT05GSUdf
R1JFWUJVU19CRUFHTEVQTEFZKQkrPSBnYi1iZWFnbGVwbGF5Lm8NCg0KVGhlIGFib3ZlIGNvbW1l
bnQgd2FzIG1vdmVkIHdpdGhvdXQgYSBwcm9wZXIgY29tbWl0IHRvIHRoZSBwYXRjaHNldCwNCm1h
a2luZyBpdCB1bnVzYWJsZSB3aXRoIGBnaXQgYW1gLiBSZXZpZXdlcnMgc2hvdWxkIHJlbW92ZSB0
aGlzDQptb2RpZmljYXRpb24uIA0KDQpUaGFua3MsDQotLSANCllhY2luIEJlbG1paG91Yi1NYXJ0
ZWwNClNpbGljb24gTGFib3JhdG9yaWVzDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmdyZXlidXMtZGV2IG1haWxpbmcgbGlzdCAtLSBncmV5YnVzLWRl
dkBsaXN0cy5saW5hcm8ub3JnClRvIHVuc3Vic2NyaWJlIHNlbmQgYW4gZW1haWwgdG8gZ3JleWJ1
cy1kZXYtbGVhdmVAbGlzdHMubGluYXJvLm9yZwo=
