Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E75BD258B3
	for <lists+greybus-dev@lfdr.de>; Thu, 15 Jan 2026 16:59:07 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id BFDE44015B
	for <lists+greybus-dev@lfdr.de>; Thu, 15 Jan 2026 15:59:06 +0000 (UTC)
Received: from mx0b-0024c301.pphosted.com (mx0b-0024c301.pphosted.com [148.163.153.153])
	by lists.linaro.org (Postfix) with ESMTPS id D541D4015F
	for <greybus-dev@lists.linaro.org>; Thu, 15 Jan 2026 15:58:45 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=silabs.com header.s=pps12202023 header.b=b7NbGWzC;
	dkim=pass header.d=silabs.com header.s=selector1 header.b=DPtwrKUS;
	spf=pass (lists.linaro.org: domain of Damien.Riegel@silabs.com designates 148.163.153.153 as permitted sender) smtp.mailfrom=Damien.Riegel@silabs.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1");
	dmarc=pass (policy=reject) header.from=silabs.com
Received: from pps.filterd (m0101742.ppops.net [127.0.0.1])
	by mx0a-0024c301.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60FFlYMs459372;
	Thu, 15 Jan 2026 09:58:36 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps12202023;
	 bh=dY2ZY38R7KDVfc/TYv+75hVhZJztufc6KKcH5xn7Lbs=; b=b7NbGWzCsvDe
	VJPzChv7pMnXgx29x/mJlVTB6O3al1QpRx5K9YLL54T6yKOYuC8xnCiETXKeURXe
	tw6MRUgaA40TceNikDiX7g+olhqC47RyFO3uor/mIGALnoTqT4uQlfrYHdyzVuXA
	iqZkSO4lkRTITgib2mM3tTfXVAkTBpqLB5YhrXwOnNV7HilS6wpesCnMAfTzWkUA
	Z5RO6vtFCZI/qwBwMwewIL4REDSVmMAaLA4tK4xJLGf3kNkgUvM7QBQHqBSCKa6A
	GuIgQWcI4mNVM/I7KLf0hk7HCTMaOwejfFATwUQKKd/WpL5V5gMuPH/FKSWCT5BP
	9HHNYNlHbQ==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11021127.outbound.protection.outlook.com [52.101.52.127])
	by mx0a-0024c301.pphosted.com (PPS) with ESMTPS id 4bq36kr0ut-3
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 15 Jan 2026 09:58:36 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nuGUs5I5aX3wPlNktxhG3SX7JLgiL6WWnE4BqI2rFryHbnxRdVaELstz03ToYKWPEVx2OkGkzDzuE87fD+oVwXZiqme0z+qs9ohrT8gp+WPnJGIb2yzCvJQsJkERX3WXYfOBhi7rWZsm6YE/ikSImEgvAR2Lqrn2qCYXufs6g8xNw3TNyX25XPK1y+yTvdkHK/y4lCy5im3GCTh16B1Fvzs3wFuvQfFoZh/OOs0epWtV4pPjOEQXiColjPP9NHotJWG/Ah2ArxIOrUO5VCSECls+R9nzBwgtgjUQup5KYJihEMYVdl8hCB4dFLvY6TGZwm5xdwvhiVrp/4XMkzLrpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dY2ZY38R7KDVfc/TYv+75hVhZJztufc6KKcH5xn7Lbs=;
 b=ovII41NY9pqL+l2/eb0RST/o7AgBu+vFiVALROoe7EYkiD+rLcwy4lYJCMdWMvu124mwvs1tGLVWmkgxlZunXJD1kgXwv/AcdZE2K0pWFX+UTROjAIeYNuI0A54d/Ds2s0131yZfQ17xSU0/xNCqsiBsZnsNHjsm6Jt4/PqsM9TDO/sizh0x14WU8g2Q1SYBb0hejwnduIo/m6gTqf2buxQHLGqr/GEp7sWGFGd4OX35SavtbHYXY/pKc1dB5oP6QB+1lSWAMXn9Pfws2cKXW02NSSzAZTUWSiVey8oQA03xv9XKjJyYog2Mlh9HkLth0Lz/rOxVjBmzjJhT4a8UPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silabs.com; dmarc=pass action=none header.from=silabs.com;
 dkim=pass header.d=silabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dY2ZY38R7KDVfc/TYv+75hVhZJztufc6KKcH5xn7Lbs=;
 b=DPtwrKUS8a8rxdfUBdsZaRKECX/BZ5zaH8J7X7PJ5K5lNqUXPqpKhs7tIVlvvPqMwE/tb4poFZ3pWRktEy1jm/C6G8eu1vomze2NMJU7kUJ8NGgR1gjHcVpu2Jv3MQsV0M8EU/7TKXQEWoHlAXbE4VApBPxcs9jYEC7NhweyznM=
Received: from DS0PR11MB8205.namprd11.prod.outlook.com (2603:10b6:8:162::17)
 by SA1PR11MB8811.namprd11.prod.outlook.com (2603:10b6:806:467::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Thu, 15 Jan
 2026 15:58:33 +0000
Received: from DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::2de6:bc88:2af7:3583]) by DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::2de6:bc88:2af7:3583%3]) with mapi id 15.20.9520.005; Thu, 15 Jan 2026
 15:58:33 +0000
From: =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
To: greybus-dev@lists.linaro.org, Johan Hovold <johan@kernel.org>,
        Alex Elder <elder@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org
Date: Thu, 15 Jan 2026 10:57:55 -0500
Message-ID: <20260115155808.36102-3-damien.riegel@silabs.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260115155808.36102-1-damien.riegel@silabs.com>
References: <20260115155808.36102-1-damien.riegel@silabs.com>
X-ClientProxiedBy: YQZPR01CA0025.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:86::22) To DS0PR11MB8205.namprd11.prod.outlook.com
 (2603:10b6:8:162::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8205:EE_|SA1PR11MB8811:EE_
X-MS-Office365-Filtering-Correlation-Id: 59468919-dbaf-41aa-46f4-08de544eef14
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?VURsc0JIWTkvakN3aCtMNXFITXZ1cnM0aDljOUpRTlpIR3RkOFJ4bUp6SmdO?=
 =?utf-8?B?ZWR0TmlOQzlpZU5nc0tzYXVRYWZMN20wRThWZFNtMHQ1RWtOcnVtMklKL1VC?=
 =?utf-8?B?YmFTY284dkgwR3RNYm5aU2NsNWwrSEp2b0c4alpuTnhBaDZZRXBrYURuc3ZO?=
 =?utf-8?B?UnNMMC9QZGFjQWxJYTlRS0VncHE5SjV2amE1SHVhRmpCdTYwenpUczZtcXZZ?=
 =?utf-8?B?UXcxdWtYNjgxelllWWd0am0wZjhUSlR0bFIxY2RTZGtqb3RYd2M0T1RHcDFZ?=
 =?utf-8?B?K1VZTUVkTUY4TUlmMVFyVElaUzhGekp1V1d2UEVPYUFuc3Z5OVVNZkpWVkc4?=
 =?utf-8?B?V0lNMGlXN3BOeGZKSXhtbHdwdnNVN0E5dmRXSHlaZ3oxM2h0MU9qQXFtWS9v?=
 =?utf-8?B?MUFIN2NUU0JkTHJQeFgxeUk5Y0FlM0YwNDZ2NU1OUmc3cXNQNWtjVkppVE5S?=
 =?utf-8?B?NEE0RERIODlZNGtxQjZoSmEzTVRCMzdxVUJqb2tZblpSb3B4KzJuL1R1Z1VC?=
 =?utf-8?B?UHpPc1BlZ2Nhb2tqc3Q5YWZWc1NaK1cwaVl5S3d3bTlDWGxlT1E4eE0rQjZ5?=
 =?utf-8?B?VzJSSmVVeFNHWDNaY2VEakk4RnpmVTg5T09RNE5KcDF0VFRWL3dvajFMaU1G?=
 =?utf-8?B?Sm9wYnM0SVovUW40WmxkK1NuYWJFZlhuVHQweW9yL1l3SzBHNFdadEhUa1FM?=
 =?utf-8?B?NXpBU29xMjcvR3JVTWVaa1RTdUtZZ0N4NDFCTCtIWWl3UERKYXlBUVJIVVFM?=
 =?utf-8?B?b1VvTjhHQ1lWMk9FS0pSVERzYWNEOXFTV0p6dDFUd21JYVIwVjdsZWpYV3kx?=
 =?utf-8?B?ZmFDSk1yV1FRQWlrVElGbzVHcEVHSlpkZzdPeFU2ckJlcHpoc1R0VHBiQmU3?=
 =?utf-8?B?Y2hWVWVFVTRiMmhwWGhOS2FzdStCQlhhTVFDY1V4bG8xRHFTTUNycXdBRlpa?=
 =?utf-8?B?MXpPOW5SMVhZWSsxcHNoaTY1b3lpRVdROHJCY1JtUllybGhLTEE5MUxybnFj?=
 =?utf-8?B?Z3dBT1B1Q1lnN3JEc1h3M0ZLWW9yK3MyUHdHVVlWWVNxaXVXZ2ppMVJEQkxu?=
 =?utf-8?B?cngxaFVodWt4MGpVdTdJaWltYXNCU1EwYkNpOTdXbzg5Q0duOVk5aENVR0VN?=
 =?utf-8?B?T01tREc0TzN5OXVOUFJMYnZJaWRtSDZsTElNWCtnYVVoTUd2cDBhMUE5UUtq?=
 =?utf-8?B?TVBJTi9HTjdHTVo5RHNOZmROd2VWU1BLYjZoNzFlS0lMam05bXluN2J3WTkz?=
 =?utf-8?B?RlJqZ084dlQyeFo5L1l1dGZySW9ETUFxMXNyNndMR2FrTWJjeXdlT3Yyd0FI?=
 =?utf-8?B?cnBOVllvUFQrNEtLK1BpMzJmU3VRMVM3eWNpb3llUDR4cmRQOVFEUnVvU3cv?=
 =?utf-8?B?eWVGM0FmSGl6VnZoTGNyUW1nSXk1SWxMeTlRMmEyc0RaNHZBR05JbU9vR2cz?=
 =?utf-8?B?WVpsR2ZQOC9nY3YvZkc0Y0RIMDluU0V5VEh4eEl3K1FJTHdub3NZUHZaRUlt?=
 =?utf-8?B?S3RlTCtTeVFvZys1WVRBUzVDNE1SWHpGLy9uNTdQb2dnd0EwSGxYN2k4b0sz?=
 =?utf-8?B?eGhQZDdHcWhtS3hUVkhpTnZ1dTNOdzNBanF5enFLaXMxVDNpeUx4cDcxbDln?=
 =?utf-8?B?Tis4NlByL2ZlendVNmFpMVNlUFd3ZlZjajVhcmlJVjlxMnFjUmZMVlAzaExM?=
 =?utf-8?B?cE0zaG5OTUQwLzNjN2lTZmx6YTNNVUZIWnBIeEw5MngwMUZEVWlrSWV0cGNw?=
 =?utf-8?B?Z3h1bjBsbFFlWXl4ckg5aUhQK2lVL3lsb2FlU21pTTBRbHdWSThHYTc0STB3?=
 =?utf-8?B?TUxMclZWTHRvVEIyTXV5M1NDb0d1dWZ3YkxmTXBCVis2YU95c2xJOW1DNTBm?=
 =?utf-8?B?WXpaTTJiKzhrb1lnODJlbUt3Wkswc0huaTRxZUVPWExNa2F4UjQ3OTZ2dFJG?=
 =?utf-8?B?bTZHNjI1ODRJMFdXNUltNFpET2JLTHNzRTBza3YyZFBoWkttUDRIVVp0VnAr?=
 =?utf-8?B?OXJOMHFUejl5ZFdJblpmSTM4bERjZ0ROR0o0cXhnRDNpTlFPUmZ2VnhCNTFz?=
 =?utf-8?B?czltQWdmL24zOHl1S0dyTmpzZVVyZE8rejd2SXRXSmxGemJZb2djVzVoaGpw?=
 =?utf-8?B?LzJEL3laYmE3dkliV1hjV2NKdDBkSk1kcjBKMEQwTVpCaGlRYlZSSEtIOXYw?=
 =?utf-8?Q?DycZsVqnt4PvxBvn28wPcJ0=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8205.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RmlibGhRN0NEZ3VCRjZvZmpPSzhSbExZR0xwSWZ6bTFJbFIreEZYZnJyZm10?=
 =?utf-8?B?TjFBWEEzL2JFWHpGck1FcVJ5MU4zWnFNUENsanoxWTEraTF1bTBBKzF4ZWVw?=
 =?utf-8?B?VnhkQU91STgrRnRwUExmeTdHQ0tGZVREbnY5YUVJSzZkcHBmSWhHV0tkNXd2?=
 =?utf-8?B?cUl6eUd4Uk85cW8yNWJoY1BkenlhcWsvMEYvZFEzL203NVE4Q0lqajRmVFAz?=
 =?utf-8?B?WmQvR2pob3NvaHBSZnlBcXozNzNudDUwOGdVdTB1NEdlUnUwZ2lvZmdwdXYy?=
 =?utf-8?B?OHdjbmQybkpDeDlsSXNhclVscFc3RDlrdDgvck51cTYwZXpyMkhlVjdDSk05?=
 =?utf-8?B?QXJ1U25nWWFudFBVWXpscXBFTGJJVnU1V09aWUdQNkVFcDRvQnBTcitkWnNm?=
 =?utf-8?B?M3Z1dVNpTE1TMjE2SExKU3dUMlZ1UU4zWjFvTWZpK1dER2RrNzd4R2dKL2pX?=
 =?utf-8?B?VXNDNDFZQnVJellaUjgyOGdqRmtHUDdpWEs3a29uOS9Rb2djRHdaMTVNbk51?=
 =?utf-8?B?blZ2cjA3eVplNlcyRUhnNG9hd092YVJDb0NzUzh5eXg3dTVnbzNDaDQ1QkVr?=
 =?utf-8?B?SytSVzdUOU5NMmRGRVlKdlNnUnB2S2d4ZisxTDBRYldlR3ZlRENvWjhNWjFS?=
 =?utf-8?B?OTZaeTUwTDBTc3VwTEhRUjJIc3FTdU40dGNnUklGekFDbU1MWGRLMTc5ZDdY?=
 =?utf-8?B?dmVxWkJyNEhjQUtMMk4zSlkzdUNPUStmY0JhN2V0Y3BOcFNHa0lQRHJWazlD?=
 =?utf-8?B?NWtBUDBVdmpudnJqYkZ3cGtaOFdzRjBTZzkrSTFOWTB0TWZwUVNSNlE3LzNU?=
 =?utf-8?B?VHhoVlNLQm5aWHg4RC8wUTRMTTlLaFp0TFhQM1FGYWRMZVAyQm5FajN6azZ0?=
 =?utf-8?B?bDVVRDI0Y3J3d3V0QTJ5NDh2NlZIL2dwb0Y5UC9rRGxORFMwNS9oRHpOTHor?=
 =?utf-8?B?bytMMUM1dzdTak16eVFtb0ZiSElkNUt5RjBaT1pIS2hJSS9WemhkVyt4eTEy?=
 =?utf-8?B?REJaOTFCdkRMZ0wvQU13cEt3bXpvSm90TThsMXNFNTdaWnJ4eFkwdUFhdDVS?=
 =?utf-8?B?eTZIMmRHNlZwdXlvYVR6SWlZQnJFZ3VtRm5JK1dnbWNSU2oxNmszdXNFZ1Zk?=
 =?utf-8?B?ZG5RRnlaSThxQmpTZ1doaURyd0hsNG12c3ZEWmltcjd0R1lQUVJTbkhMaDE3?=
 =?utf-8?B?T2hZYjczYXdIS3dlblgwcjQ2cUM2dkhJT3J5TUxTOERqdkZPS3QvNEkvSWhq?=
 =?utf-8?B?MHpQaVBXT0FlRXhTcTA3cFJSVG1KV1BvUngwMWp0azVxZ3lieVVZbWcyVnZ6?=
 =?utf-8?B?S2JnQU1tMmZObU9qQU9kUTVkaWE1WkJ3d3d4T291WEZndXFhR2xTSG5PWkZN?=
 =?utf-8?B?VFo0Q05CbDZqNGovdzJuYm5iRmY5Q09yZ1ZxT1k0UXFZb3dESlRWZmY1Z2pw?=
 =?utf-8?B?TStiR2t3cG81SEwzbU85Z0NpTE9FTm16elJJUGx3eWk4STBMM1FtVjRZYTVR?=
 =?utf-8?B?N1FUYlZtb29xRVBpa09MRG1pSG11cVI0V1B4VnVxS0ZXWGVxd0JCOFRQN2xG?=
 =?utf-8?B?Vm50ZEZVR3pab0xDZUVwWVNkdWNkNXE0VSt4SjJHTlo0UEtwakZTblNSZEc5?=
 =?utf-8?B?ZlNFTUdaaVhMeENveWF5Rnp1cjVldE5BQjB3eFBsU0w0R3pRYWdCMkF6M1BZ?=
 =?utf-8?B?cENsTC9YWWg4U1Y4T2Zpazl6Y1FNUlZQNGkyQ1pjZHpBYmFaRXRISy80V1dZ?=
 =?utf-8?B?RHZZUFhhU2ZZWlFmUVdrZ0k3Q3J2TXFFODhwTWZ3eVhybGhHZ3ZKU0JRQVNQ?=
 =?utf-8?B?N1ZudERaWnZmVEhNeTEwb2dnLzZDcUx2WHNpK3h0a3VpVVZGWTZValJINk9a?=
 =?utf-8?B?T3lNYWs4ZEhtUnRhTXlBU0djbmlUblZpczBjTUt0YmRPRTNzbWFZT0d4L3Aw?=
 =?utf-8?B?MVVBait4OXh4NlB4RzZZYnQxVHE1Z2tGcVVFSDBnaUJtL2Jwd1ZNZUVONHVU?=
 =?utf-8?B?djBnN0hzbkxyazFaa2NML1RWQUJuYVZYdEROZS85dFlrd3FIeG1ZbDlmZ3lB?=
 =?utf-8?B?UXpsL2lyTWNpZUhoZTBOMWJEZ0JzSndoK3lsbzJIRnJYNFNhVFh4Y29XTVpR?=
 =?utf-8?B?Q2l5WnV5K2cvVFBUYXkwY3NSdENVVmFqcExoODNrT0VUc1Z3Z0RTdTNiQVZC?=
 =?utf-8?B?SlFYdThMdUhJQWpLMzlzejlyQU5YSFNESkphcldmK2s3QTZWYkpMcm5zbzlQ?=
 =?utf-8?B?MlFtQ0czM2lGdGpQa045eGI5SElEWHFMalBTRVNnQUNrN0lpRUVMQWZVa25j?=
 =?utf-8?B?bCtzQkFtZXlHNTlTbGYwQXpDNTk4SzliSHVIRmg4c0UyaCsxTWlWdz09?=
X-OriginatorOrg: silabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59468919-dbaf-41aa-46f4-08de544eef14
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8205.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 15:58:33.1150
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 54dbd822-5231-4b20-944d-6f4abcd541fb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lo3vLNhspIGwoa4W7vwYwdpX9DeWI6Rh+Koinu7lh4hsbFWFpJZitvmB3kFMesYBOGqYGV3R5fCZhZRDupaX4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8811
X-Proofpoint-GUID: qWPXatxaSCtsH7SvEWFlCAIzNM_3dJ4-
X-Authority-Analysis: v=2.4 cv=M6BA6iws c=1 sm=1 tr=0 ts=69690eac cx=c_pps
 a=+Bba5nuaRI/XgWxKvljhhQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=M51BFTxLslgA:10
 a=i1IsUcr2s-wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=2AEO0YjSAAAA:8
 a=iqUPcmWXN_vvxTOgPeMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDEyMSBTYWx0ZWRfX3bCpJsOPjA4w
 8NRugQceLrkqHClYT3RyAraQhUpMiv3QXjCGpDTCHq0r5jLQwwgEAL+85Qwl6fx1s3iBxqqKxbC
 w+nKZSnfhTG7UTa54+qXX/iKL20+yYVOYMekC2Exriw3EIRu+g0gRb8igLShOujVDaqItaxmTAW
 kPIfgYYfNULQZTLwwnRqhap5NrTtoVwIbO/5QdQw4JMZRIiELg0D8tneKqRiR41qovlWvGdernk
 hSDoybJrfIWgmw3Qa8Ykt2T83m9CIxTBZzdjF73tNkWDBdPPMyDwrz+2ZqYmEtHXLd0ooyfrkuV
 KYsIBukN7+ZEus/mh9vcuD51IFZ9/7RCvazgluwZWjc/u7Jerygzyw3QuWMJcGV8MYmsoyrPvfo
 Y4CxxjKIE31wlsy9nl22wvGMBoze6+W2uNweQODrv43YWBEr5hFBmiOiIo2AXV32TN9FnDlb3me
 Wmxz97TlOhEAfzMC8Fg==
X-Proofpoint-ORIG-GUID: qWPXatxaSCtsH7SvEWFlCAIzNM_3dJ4-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_05,2026-01-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 spamscore=0 adultscore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601150121
X-Rspamd-Queue-Id: D541D4015F
X-Spamd-Bar: ----
X-Spamd-Result: default: False [-4.00 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[silabs.com,reject];
	R_DKIM_ALLOW(-0.20)[silabs.com:s=pps12202023,silabs.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:148.163.153.153];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:22843, ipnet:148.163.152.0/22, country:US];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	DKIM_TRACE(0.00)[silabs.com:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: NNSWZIAL4RK6LGQA7UJLTRBCGSSTRQ6K
X-Message-ID-Hash: NNSWZIAL4RK6LGQA7UJLTRBCGSSTRQ6K
X-MailFrom: Damien.Riegel@silabs.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Silicon Labs Kernel Team <linux-devel@silabs.com>, =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v2 02/14] greybus: cpc: introduce CPC cport structure
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/NNSWZIAL4RK6LGQA7UJLTRBCGSSTRQ6K/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

QSBudW1iZXIgb2YgQ1BDIGZlYXR1cmVzLCBsaWtlIHJldHJhbnNtaXNzaW9uIG9yIHJlbW90ZSdz
IHJlY2VpdmUNCndpbmRvdywgYXJlIGNwb3J0LWJhc2VkLiBJbiBvcmRlciB0byBwcmVwYXJlIGZv
ciB0aGVzZSBmZWF0dXJlcywNCmludHJvZHVjZSBhIENQQyBDUG9ydCBjb250ZXh0IHN0cnVjdHVy
ZS4NCg0KVGhlIENQQyBIb3N0IERldmljZSBtb2R1bGUgbm93IGltcGxlbWVudHMgY3BvcnRfYWxs
b2NhdGUgYW5kDQpjcG9ydF9yZWxlYXNlIGNhbGxiYWNrcyBpbiBvcmRlciB0byBhbGxvY2F0ZSBh
bmQgcmVsZWFzZSB0aGVzZQ0Kc3RydWN0dXJlcyB3aGVuIHJlcXVlc3RlZCBieSBHcmV5YnVzIG1v
ZHVsZS4NCg0KU2lnbmVkLW9mZi1ieTogRGFtaWVuIFJpw6lnZWwgPGRhbWllbi5yaWVnZWxAc2ls
YWJzLmNvbT4NCi0tLQ0KIGRyaXZlcnMvZ3JleWJ1cy9jcGMvTWFrZWZpbGUgfCAgIDIgKy0NCiBk
cml2ZXJzL2dyZXlidXMvY3BjL2NwYy5oICAgIHwgIDI5ICsrKysrKysrKysNCiBkcml2ZXJzL2dy
ZXlidXMvY3BjL2Nwb3J0LmMgIHwgIDM3ICsrKysrKysrKysrKw0KIGRyaXZlcnMvZ3JleWJ1cy9j
cGMvaG9zdC5jICAgfCAxMDkgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0NCiBk
cml2ZXJzL2dyZXlidXMvY3BjL2hvc3QuaCAgIHwgIDEyICsrKysNCiA1IGZpbGVzIGNoYW5nZWQs
IDE4NyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KIGNyZWF0ZSBtb2RlIDEwMDY0NCBk
cml2ZXJzL2dyZXlidXMvY3BjL2NwYy5oDQogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3Jl
eWJ1cy9jcGMvY3BvcnQuYw0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncmV5YnVzL2NwYy9NYWtl
ZmlsZSBiL2RyaXZlcnMvZ3JleWJ1cy9jcGMvTWFrZWZpbGUNCmluZGV4IDQ5MDk4MmEwZmY1Li4z
ZDUwZjhjNTQ3MyAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3JleWJ1cy9jcGMvTWFrZWZpbGUNCisr
KyBiL2RyaXZlcnMvZ3JleWJ1cy9jcGMvTWFrZWZpbGUNCkBAIC0xLDYgKzEsNiBAQA0KICMgU1BE
WC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjANCiANCi1nYi1jcGMteSA6PSBob3N0Lm8NCitn
Yi1jcGMteSA6PSBjcG9ydC5vIGhvc3Qubw0KIA0KICMgQ1BDIGNvcmUNCiBvYmotJChDT05GSUdf
R1JFWUJVU19DUEMpCSs9IGdiLWNwYy5vDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncmV5YnVzL2Nw
Yy9jcGMuaCBiL2RyaXZlcnMvZ3JleWJ1cy9jcGMvY3BjLmgNCm5ldyBmaWxlIG1vZGUgMTAwNjQ0
DQppbmRleCAwMDAwMDAwMDAwMC4uMzkxNWE3ZmJjNGYNCi0tLSAvZGV2L251bGwNCisrKyBiL2Ry
aXZlcnMvZ3JleWJ1cy9jcGMvY3BjLmgNCkBAIC0wLDAgKzEsMjkgQEANCisvKiBTUERYLUxpY2Vu
c2UtSWRlbnRpZmllcjogR1BMLTIuMCAqLw0KKy8qDQorICogQ29weXJpZ2h0IChjKSAyMDI1LCBT
aWxpY29uIExhYm9yYXRvcmllcywgSW5jLg0KKyAqLw0KKw0KKyNpZm5kZWYgX19DUENfSA0KKyNk
ZWZpbmUgX19DUENfSA0KKw0KKyNpbmNsdWRlIDxsaW51eC9kZXZpY2UuaD4NCisjaW5jbHVkZSA8
bGludXgvZ3JleWJ1cy5oPg0KKyNpbmNsdWRlIDxsaW51eC90eXBlcy5oPg0KKw0KKy8qKg0KKyAq
IHN0cnVjdCBjcGNfY3BvcnQgLSBDUEMgY3BvcnQNCisgKiBAaWQ6IGNwb3J0IElEDQorICogQGNw
Y19oZDogcG9pbnRlciB0byB0aGUgQ1BDIGhvc3QgZGV2aWNlIHRoaXMgY3BvcnQgYmVsb25ncyB0
bw0KKyAqLw0KK3N0cnVjdCBjcGNfY3BvcnQgew0KKwl1MTYgaWQ7DQorDQorCXN0cnVjdCBjcGNf
aG9zdF9kZXZpY2UgKmNwY19oZDsNCit9Ow0KKw0KK3N0cnVjdCBjcGNfY3BvcnQgKmNwY19jcG9y
dF9hbGxvYyh1MTYgY3BvcnRfaWQsIGdmcF90IGdmcF9tYXNrKTsNCit2b2lkIGNwY19jcG9ydF9y
ZWxlYXNlKHN0cnVjdCBjcGNfY3BvcnQgKmNwb3J0KTsNCisNCitpbnQgY3BjX2Nwb3J0X21lc3Nh
Z2Vfc2VuZChzdHJ1Y3QgY3BjX2Nwb3J0ICpjcG9ydCwgc3RydWN0IGdiX21lc3NhZ2UgKm1lc3Nh
Z2UsIGdmcF90IGdmcF9tYXNrKTsNCisNCisjZW5kaWYNCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dy
ZXlidXMvY3BjL2Nwb3J0LmMgYi9kcml2ZXJzL2dyZXlidXMvY3BjL2Nwb3J0LmMNCm5ldyBmaWxl
IG1vZGUgMTAwNjQ0DQppbmRleCAwMDAwMDAwMDAwMC4uODhiZGIyZjgxODINCi0tLSAvZGV2L251
bGwNCisrKyBiL2RyaXZlcnMvZ3JleWJ1cy9jcGMvY3BvcnQuYw0KQEAgLTAsMCArMSwzNyBAQA0K
Ky8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wDQorLyoNCisgKiBDb3B5cmlnaHQg
KGMpIDIwMjUsIFNpbGljb24gTGFib3JhdG9yaWVzLCBJbmMuDQorICovDQorDQorI2luY2x1ZGUg
ImNwYy5oIg0KKyNpbmNsdWRlICJob3N0LmgiDQorDQorLyoqDQorICogY3BjX2Nwb3J0X2FsbG9j
KCkgLSBBbGxvY2F0ZSBhbmQgaW5pdGlhbGl6ZSBDUEMgY3BvcnQuDQorICogQGNwb3J0X2lkOiBj
cG9ydCBJRC4NCisgKiBAZ2ZwX21hc2s6IEdGUCBtYXNrIGZvciBhbGxvY2F0aW9uLg0KKyAqDQor
ICogUmV0dXJuOiBQb2ludGVyIHRvIGFsbG9jYXRlZCBhbmQgaW5pdGlhbGl6ZWQgY3BjX2Nwb3J0
LCBvciBOVUxMIG9uIGZhaWx1cmUuDQorICovDQorc3RydWN0IGNwY19jcG9ydCAqY3BjX2Nwb3J0
X2FsbG9jKHUxNiBjcG9ydF9pZCwgZ2ZwX3QgZ2ZwX21hc2spDQorew0KKwlzdHJ1Y3QgY3BjX2Nw
b3J0ICpjcG9ydDsNCisNCisJY3BvcnQgPSBremFsbG9jKHNpemVvZigqY3BvcnQpLCBnZnBfbWFz
ayk7DQorCWlmICghY3BvcnQpDQorCQlyZXR1cm4gTlVMTDsNCisNCisJY3BvcnQtPmlkID0gY3Bv
cnRfaWQ7DQorDQorCXJldHVybiBjcG9ydDsNCit9DQorDQordm9pZCBjcGNfY3BvcnRfcmVsZWFz
ZShzdHJ1Y3QgY3BjX2Nwb3J0ICpjcG9ydCkNCit7DQorCWtmcmVlKGNwb3J0KTsNCit9DQorDQor
aW50IGNwY19jcG9ydF9tZXNzYWdlX3NlbmQoc3RydWN0IGNwY19jcG9ydCAqY3BvcnQsIHN0cnVj
dCBnYl9tZXNzYWdlICptZXNzYWdlLCBnZnBfdCBnZnBfbWFzaykNCit7DQorCXJldHVybiBjcG9y
dC0+Y3BjX2hkLT5kcml2ZXItPm1lc3NhZ2Vfc2VuZChjcG9ydC0+Y3BjX2hkLCBjcG9ydC0+aWQs
IG1lc3NhZ2UsIGdmcF9tYXNrKTsNCit9DQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncmV5YnVzL2Nw
Yy9ob3N0LmMgYi9kcml2ZXJzL2dyZXlidXMvY3BjL2hvc3QuYw0KaW5kZXggODA1MTY1MTdmZjYu
Ljk4NTY2Y2U3NzU1IDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncmV5YnVzL2NwYy9ob3N0LmMNCisr
KyBiL2RyaXZlcnMvZ3JleWJ1cy9jcGMvaG9zdC5jDQpAQCAtNyw2ICs3LDcgQEANCiAjaW5jbHVk
ZSA8bGludXgvZ3JleWJ1cy5oPg0KICNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4NCiANCisjaW5j
bHVkZSAiY3BjLmgiDQogI2luY2x1ZGUgImhvc3QuaCINCiANCiBzdGF0aWMgc3RydWN0IGNwY19o
b3N0X2RldmljZSAqZ2JfaGRfdG9fY3BjX2hkKHN0cnVjdCBnYl9ob3N0X2RldmljZSAqaGQpDQpA
QCAtMTQsMTIgKzE1LDk1IEBAIHN0YXRpYyBzdHJ1Y3QgY3BjX2hvc3RfZGV2aWNlICpnYl9oZF90
b19jcGNfaGQoc3RydWN0IGdiX2hvc3RfZGV2aWNlICpoZCkNCiAJcmV0dXJuIChzdHJ1Y3QgY3Bj
X2hvc3RfZGV2aWNlICopJmhkLT5oZF9wcml2Ow0KIH0NCiANCitzdGF0aWMgc3RydWN0IGNwY19j
cG9ydCAqY3BjX2hkX2dldF9jcG9ydChzdHJ1Y3QgY3BjX2hvc3RfZGV2aWNlICpjcGNfaGQsIHUx
NiBjcG9ydF9pZCkNCit7DQorCXN0cnVjdCBjcGNfY3BvcnQgKmNwb3J0Ow0KKw0KKwltdXRleF9s
b2NrKCZjcGNfaGQtPmxvY2spOw0KKwlmb3IgKGludCBpID0gMDsgaSA8IEFSUkFZX1NJWkUoY3Bj
X2hkLT5jcG9ydHMpOyBpKyspIHsNCisJCWNwb3J0ID0gY3BjX2hkLT5jcG9ydHNbaV07DQorCQlp
ZiAoY3BvcnQgJiYgY3BvcnQtPmlkID09IGNwb3J0X2lkKQ0KKwkJCWdvdG8gdW5sb2NrOw0KKwl9
DQorDQorCWNwb3J0ID0gTlVMTDsNCisNCit1bmxvY2s6DQorCW11dGV4X3VubG9jaygmY3BjX2hk
LT5sb2NrKTsNCisNCisJcmV0dXJuIGNwb3J0Ow0KK30NCisNCitzdGF0aWMgaW50IGNwY19oZF9t
ZXNzYWdlX3NlbmQoc3RydWN0IGNwY19ob3N0X2RldmljZSAqY3BjX2hkLCB1MTYgY3BvcnRfaWQs
DQorCQkJICAgICAgIHN0cnVjdCBnYl9tZXNzYWdlICptZXNzYWdlLCBnZnBfdCBnZnBfbWFzaykN
Cit7DQorCXN0cnVjdCBjcGNfY3BvcnQgKmNwb3J0Ow0KKw0KKwljcG9ydCA9IGNwY19oZF9nZXRf
Y3BvcnQoY3BjX2hkLCBjcG9ydF9pZCk7DQorCWlmICghY3BvcnQpIHsNCisJCWRldl9lcnIoY3Bj
X2hkX2RldihjcGNfaGQpLCAibWVzc2FnZV9zZW5kOiBjcG9ydCAldSBub3QgZm91bmRcbiIsIGNw
b3J0X2lkKTsNCisJCXJldHVybiAtRUlOVkFMOw0KKwl9DQorDQorCXJldHVybiBjcGNfY3BvcnRf
bWVzc2FnZV9zZW5kKGNwb3J0LCBtZXNzYWdlLCBnZnBfbWFzayk7DQorfQ0KKw0KK3N0YXRpYyBp
bnQgY3BjX2hkX2Nwb3J0X2FsbG9jYXRlKHN0cnVjdCBjcGNfaG9zdF9kZXZpY2UgKmNwY19oZCwg
aW50IGNwb3J0X2lkLCB1bnNpZ25lZCBsb25nIGZsYWdzKQ0KK3sNCisJc3RydWN0IGNwY19jcG9y
dCAqY3BvcnQ7DQorCWludCByZXQ7DQorDQorCW11dGV4X2xvY2soJmNwY19oZC0+bG9jayk7DQor
CWZvciAoaW50IGkgPSAwOyBpIDwgQVJSQVlfU0laRShjcGNfaGQtPmNwb3J0cyk7IGkrKykgew0K
KwkJaWYgKGNwY19oZC0+Y3BvcnRzW2ldICE9IE5VTEwpDQorCQkJY29udGludWU7DQorDQorCQlp
ZiAoY3BvcnRfaWQgPCAwKQ0KKwkJCWNwb3J0X2lkID0gaTsNCisNCisJCWNwb3J0ID0gY3BjX2Nw
b3J0X2FsbG9jKGNwb3J0X2lkLCBHRlBfS0VSTkVMKTsNCisJCWlmICghY3BvcnQpIHsNCisJCQly
ZXQgPSAtRU5PTUVNOw0KKwkJCWdvdG8gdW5sb2NrOw0KKwkJfQ0KKw0KKwkJY3BvcnQtPmNwY19o
ZCA9IGNwY19oZDsNCisNCisJCWNwY19oZC0+Y3BvcnRzW2ldID0gY3BvcnQ7DQorCQlyZXQgPSBj
cG9ydF9pZDsNCisJCWdvdG8gdW5sb2NrOw0KKwl9DQorDQorCXJldCA9IC1FTk9TUEM7DQordW5s
b2NrOg0KKwltdXRleF91bmxvY2soJmNwY19oZC0+bG9jayk7DQorDQorCXJldHVybiByZXQ7DQor
fQ0KKw0KK3N0YXRpYyB2b2lkIGNwY19oZF9jcG9ydF9yZWxlYXNlKHN0cnVjdCBjcGNfaG9zdF9k
ZXZpY2UgKmNwY19oZCwgdTE2IGNwb3J0X2lkKQ0KK3sNCisJc3RydWN0IGNwY19jcG9ydCAqY3Bv
cnQ7DQorDQorCW11dGV4X2xvY2soJmNwY19oZC0+bG9jayk7DQorCWZvciAoaW50IGkgPSAwOyBp
IDwgQVJSQVlfU0laRShjcGNfaGQtPmNwb3J0cyk7IGkrKykgew0KKwkJY3BvcnQgPSBjcGNfaGQt
PmNwb3J0c1tpXTsNCisNCisJCWlmIChjcG9ydCAmJiBjcG9ydC0+aWQgPT0gY3BvcnRfaWQpIHsN
CisJCQljcGNfY3BvcnRfcmVsZWFzZShjcG9ydCk7DQorCQkJY3BjX2hkLT5jcG9ydHNbaV0gPSBO
VUxMOw0KKwkJCWJyZWFrOw0KKwkJfQ0KKwl9DQorCW11dGV4X3VubG9jaygmY3BjX2hkLT5sb2Nr
KTsNCit9DQorDQogc3RhdGljIGludCBjcGNfZ2JfbWVzc2FnZV9zZW5kKHN0cnVjdCBnYl9ob3N0
X2RldmljZSAqZ2JfaGQsIHUxNiBjcG9ydF9pZCwNCiAJCQkgICAgICAgc3RydWN0IGdiX21lc3Nh
Z2UgKm1lc3NhZ2UsIGdmcF90IGdmcF9tYXNrKQ0KIHsNCiAJc3RydWN0IGNwY19ob3N0X2Rldmlj
ZSAqY3BjX2hkID0gZ2JfaGRfdG9fY3BjX2hkKGdiX2hkKTsNCiANCi0JcmV0dXJuIGNwY19oZC0+
ZHJpdmVyLT5tZXNzYWdlX3NlbmQoY3BjX2hkLCBjcG9ydF9pZCwgbWVzc2FnZSwgZ2ZwX21hc2sp
Ow0KKwlyZXR1cm4gY3BjX2hkX21lc3NhZ2Vfc2VuZChjcGNfaGQsIGNwb3J0X2lkLCBtZXNzYWdl
LCBnZnBfbWFzayk7DQogfQ0KIA0KIHN0YXRpYyB2b2lkIGNwY19nYl9tZXNzYWdlX2NhbmNlbChz
dHJ1Y3QgZ2JfbWVzc2FnZSAqbWVzc2FnZSkNCkBAIC0yNywxMiArMTExLDMzIEBAIHN0YXRpYyB2
b2lkIGNwY19nYl9tZXNzYWdlX2NhbmNlbChzdHJ1Y3QgZ2JfbWVzc2FnZSAqbWVzc2FnZSkNCiAJ
LyogTm90IGltcGxlbWVudGVkICovDQogfQ0KIA0KK3N0YXRpYyBpbnQgY3BjX2diX2Nwb3J0X2Fs
bG9jYXRlKHN0cnVjdCBnYl9ob3N0X2RldmljZSAqZ2JfaGQsIGludCBjcG9ydF9pZCwgdW5zaWdu
ZWQgbG9uZyBmbGFncykNCit7DQorCXN0cnVjdCBjcGNfaG9zdF9kZXZpY2UgKmNwY19oZCA9IGdi
X2hkX3RvX2NwY19oZChnYl9oZCk7DQorDQorCXJldHVybiBjcGNfaGRfY3BvcnRfYWxsb2NhdGUo
Y3BjX2hkLCBjcG9ydF9pZCwgZmxhZ3MpOw0KK30NCisNCitzdGF0aWMgdm9pZCBjcGNfZ2JfY3Bv
cnRfcmVsZWFzZShzdHJ1Y3QgZ2JfaG9zdF9kZXZpY2UgKmdiX2hkLCB1MTYgY3BvcnRfaWQpDQor
ew0KKwlzdHJ1Y3QgY3BjX2hvc3RfZGV2aWNlICpjcGNfaGQgPSBnYl9oZF90b19jcGNfaGQoZ2Jf
aGQpOw0KKw0KKwlyZXR1cm4gY3BjX2hkX2Nwb3J0X3JlbGVhc2UoY3BjX2hkLCBjcG9ydF9pZCk7
DQorfQ0KKw0KIHN0YXRpYyBzdHJ1Y3QgZ2JfaGRfZHJpdmVyIGNwY19nYl9kcml2ZXIgPSB7DQog
CS5oZF9wcml2X3NpemUgPSBzaXplb2Yoc3RydWN0IGNwY19ob3N0X2RldmljZSksDQogCS5tZXNz
YWdlX3NlbmQgPSBjcGNfZ2JfbWVzc2FnZV9zZW5kLA0KIAkubWVzc2FnZV9jYW5jZWwgPSBjcGNf
Z2JfbWVzc2FnZV9jYW5jZWwsDQorCS5jcG9ydF9hbGxvY2F0ZSA9IGNwY19nYl9jcG9ydF9hbGxv
Y2F0ZSwNCisJLmNwb3J0X3JlbGVhc2UgPSBjcGNfZ2JfY3BvcnRfcmVsZWFzZSwNCiB9Ow0KIA0K
K3N0YXRpYyB2b2lkIGNwY19oZF9pbml0KHN0cnVjdCBjcGNfaG9zdF9kZXZpY2UgKmNwY19oZCkN
Cit7DQorCW11dGV4X2luaXQoJmNwY19oZC0+bG9jayk7DQorfQ0KKw0KIHN0cnVjdCBjcGNfaG9z
dF9kZXZpY2UgKmNwY19oZF9jcmVhdGUoc3RydWN0IGNwY19oZF9kcml2ZXIgKmRyaXZlciwgc3Ry
dWN0IGRldmljZSAqcGFyZW50KQ0KIHsNCiAJc3RydWN0IGNwY19ob3N0X2RldmljZSAqY3BjX2hk
Ow0KQEAgLTUxLDYgKzE1Niw4IEBAIHN0cnVjdCBjcGNfaG9zdF9kZXZpY2UgKmNwY19oZF9jcmVh
dGUoc3RydWN0IGNwY19oZF9kcml2ZXIgKmRyaXZlciwgc3RydWN0IGRldmljDQogCWNwY19oZC0+
Z2JfaGQgPSBoZDsNCiAJY3BjX2hkLT5kcml2ZXIgPSBkcml2ZXI7DQogDQorCWNwY19oZF9pbml0
KGNwY19oZCk7DQorDQogCXJldHVybiBjcGNfaGQ7DQogfQ0KIEVYUE9SVF9TWU1CT0xfR1BMKGNw
Y19oZF9jcmVhdGUpOw0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3JleWJ1cy9jcGMvaG9zdC5oIGIv
ZHJpdmVycy9ncmV5YnVzL2NwYy9ob3N0LmgNCmluZGV4IGY1NWZlYjMwM2Y0Li5jM2YyZjU2YTkz
OSAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3JleWJ1cy9jcGMvaG9zdC5oDQorKysgYi9kcml2ZXJz
L2dyZXlidXMvY3BjL2hvc3QuaA0KQEAgLTgsMTEgKzgsMTMgQEANCiANCiAjaW5jbHVkZSA8bGlu
dXgvZGV2aWNlLmg+DQogI2luY2x1ZGUgPGxpbnV4L2dyZXlidXMuaD4NCisjaW5jbHVkZSA8bGlu
dXgvbXV0ZXguaD4NCiAjaW5jbHVkZSA8bGludXgvdHlwZXMuaD4NCiANCiAjZGVmaW5lIEdCX0NQ
Q19NU0dfU0laRV9NQVggNDA5Ng0KICNkZWZpbmUgR0JfQ1BDX05VTV9DUE9SVFMgOA0KIA0KK3N0
cnVjdCBjcGNfY3BvcnQ7DQogc3RydWN0IGNwY19ob3N0X2RldmljZTsNCiANCiBzdHJ1Y3QgY3Bj
X2hkX2RyaXZlciB7DQpAQCAtMjUsMTIgKzI3LDIyIEBAIHN0cnVjdCBjcGNfaGRfZHJpdmVyIHsN
CiAgKiBzdHJ1Y3QgY3BjX2hvc3RfZGV2aWNlIC0gQ1BDIGhvc3QgZGV2aWNlLg0KICAqIEBnYl9o
ZDogcG9pbnRlciB0byBHcmV5YnVzIEhvc3QgRGV2aWNlIHRoaXMgZGV2aWNlIGJlbG9uZ3MgdG8u
DQogICogQGRyaXZlcjogZHJpdmVyIG9wZXJhdGlvbnMuDQorICogQGxvY2s6IG11dGV4IHRvIHN5
bmNocm9uaXplIGFjY2VzcyB0byBjcG9ydCBhcnJheS4NCisgKiBAY3BvcnRzOiBhcnJheSBvZiBj
cG9ydCBwb2ludGVycyBhbGxvY2F0ZWQgYnkgR3JleWJ1cyBjb3JlLg0KICAqLw0KIHN0cnVjdCBj
cGNfaG9zdF9kZXZpY2Ugew0KIAlzdHJ1Y3QgZ2JfaG9zdF9kZXZpY2UgKmdiX2hkOw0KIAljb25z
dCBzdHJ1Y3QgY3BjX2hkX2RyaXZlciAqZHJpdmVyOw0KKw0KKwlzdHJ1Y3QgbXV0ZXggbG9jazsg
LyogU3luY2hyb25pemUgYWNjZXNzIHRvIGNwb3J0cyAqLw0KKwlzdHJ1Y3QgY3BjX2Nwb3J0ICpj
cG9ydHNbR0JfQ1BDX05VTV9DUE9SVFNdOw0KIH07DQogDQorc3RhdGljIGlubGluZSBzdHJ1Y3Qg
ZGV2aWNlICpjcGNfaGRfZGV2KHN0cnVjdCBjcGNfaG9zdF9kZXZpY2UgKmNwY19oZCkNCit7DQor
CXJldHVybiAmY3BjX2hkLT5nYl9oZC0+ZGV2Ow0KK30NCisNCiBzdHJ1Y3QgY3BjX2hvc3RfZGV2
aWNlICpjcGNfaGRfY3JlYXRlKHN0cnVjdCBjcGNfaGRfZHJpdmVyICpkcml2ZXIsIHN0cnVjdCBk
ZXZpY2UgKnBhcmVudCk7DQogaW50IGNwY19oZF9hZGQoc3RydWN0IGNwY19ob3N0X2RldmljZSAq
Y3BjX2hkKTsNCiB2b2lkIGNwY19oZF9wdXQoc3RydWN0IGNwY19ob3N0X2RldmljZSAqY3BjX2hk
KTsNCi0tIA0KMi41Mi4wDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmdyZXlidXMtZGV2IG1haWxpbmcgbGlzdCAtLSBncmV5YnVzLWRldkBsaXN0cy5s
aW5hcm8ub3JnClRvIHVuc3Vic2NyaWJlIHNlbmQgYW4gZW1haWwgdG8gZ3JleWJ1cy1kZXYtbGVh
dmVAbGlzdHMubGluYXJvLm9yZwo=
