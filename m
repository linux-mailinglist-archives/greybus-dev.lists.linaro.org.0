Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id CC406C5DC16
	for <lists+greybus-dev@lfdr.de>; Fri, 14 Nov 2025 16:08:46 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id CDA383F852
	for <lists+greybus-dev@lfdr.de>; Fri, 14 Nov 2025 15:08:45 +0000 (UTC)
Received: from mx0a-0024c301.pphosted.com (mx0a-0024c301.pphosted.com [148.163.149.154])
	by lists.linaro.org (Postfix) with ESMTPS id 8F34A3F85B
	for <greybus-dev@lists.linaro.org>; Fri, 14 Nov 2025 15:08:36 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=silabs.com header.s=pps12202023 header.b=1aVqjcTS;
	dkim=pass header.d=silabs.com header.s=selector1 header.b=MlbXJP7x;
	dmarc=pass (policy=reject) header.from=silabs.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1");
	spf=pass (lists.linaro.org: domain of Damien.Riegel@silabs.com designates 148.163.149.154 as permitted sender) smtp.mailfrom=Damien.Riegel@silabs.com
Received: from pps.filterd (m0101743.ppops.net [127.0.0.1])
	by mx0a-0024c301.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AE9ueV92132744;
	Fri, 14 Nov 2025 09:08:33 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps12202023;
	 bh=jj1XBJ/ze3XAwf4BcKl1R9SQH5ptw5w0j8BKE0sFniQ=; b=1aVqjcTSk8J6
	mKduYJ9VQ7WtLI2a3GYS+l5YsaqogcCFjTpSpB3riCiFiEHr1WUM8jNspIKCmtT4
	ghincohuO5RQpXRCf0E6pdDTaYpkKBWFiBDLBPZw10TK0uprHD494F8rfUt/EsX5
	W6gYsc3VMCtDr/dkwNOczlaKukmL/90jO8+HY+4/x1fTVligXJvLmM8SIWIHYiJO
	xEzF2n6yp/8BYjutUFsExuQi4Pq5/jueunRbtjYQ1Ig/PT8Hc3XPBTRROI/d/UIy
	eJcdDSh4HbNx084Wa5jLOf+uGNziGJOMLwpXrY2bLDEWUBO6lxMc39B8TERs54ic
	LDUT/Ts+jQ==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11022081.outbound.protection.outlook.com [40.107.209.81])
	by mx0a-0024c301.pphosted.com (PPS) with ESMTPS id 4ae285rk1u-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 14 Nov 2025 09:08:32 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wmgslv+BFX8sE6Wbx/KB2JngG0A3dZBRHrdz8urQxsXWzIy2Gi8ZPq9mY3ldk2Sko6z9dYauuAUdCyqDchHMXEvp5Bi1CfAqmMr+5GlAYnznUvQACAC5GI6bQKFBRHm//BxW3FF9jOivHi6/V2GZXFO8gMVmbBnXaplK5Rc7xBKEHuE5aE2IVoLIo+NmFu3wFFjwS8v/Cb5v/58eAu3x5Kp4vLQ4YV5r8SuyPOeYDjwWGGEYKZq/qqTI0TGwg3BYVWI575QdxyyA0WI+AsbEEiLPjmy+vVutqhENURSUAtSAQqy/PhKy11WhkSMbuVvg9ph7Tv7ja9p6UruNGssEmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jj1XBJ/ze3XAwf4BcKl1R9SQH5ptw5w0j8BKE0sFniQ=;
 b=os+6TDR0BFuBD1WtHGC49nOEfWnNfzyBU8xdmmrrkRUoGZxoavEu2G2jYyluj/6RdnqSUh4oeJ8aUMNsWrZdz29T8QjvV7SXKEmLGxwa5cn8ukc3rNo/IiZAwFeYb6Q/LVYLmgrQjZ73jIzOcSoqqb1UEjxpOUIsFHNmpReaZJTgSqYVxyw9tcmL1/gixIa0kTXa6t4OJfZMVdcO3msBbUW0TpFG+H1y4f4Zov1+vC1jKChoXS8iLZtq7ahOnUiVGGJkUpHqUc+Hp2emk3+vNmfVURFpPYmIeQBoJRF3/DuB3R536JSiekLh+Cv7FQH2zojBMcmvTBIyUQARqZXunQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silabs.com; dmarc=pass action=none header.from=silabs.com;
 dkim=pass header.d=silabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jj1XBJ/ze3XAwf4BcKl1R9SQH5ptw5w0j8BKE0sFniQ=;
 b=MlbXJP7x8TkU+Cd0FJOZd9gAlM14wXladF8oSoe/oZx1BZfRJVt1h51DRIEGpRI6gdyxEmSU8/he++hhYE7wdZe+k5AKXxolnlwakstgFfVBUup1T1Eu8MjXVgJtTFKD6ehzcfCMIGdEJHSw6zW6i7B8c/jQw415x6ZTchF/n9k=
Received: from DS0PR11MB8205.namprd11.prod.outlook.com (2603:10b6:8:162::17)
 by CH3PR11MB8774.namprd11.prod.outlook.com (2603:10b6:610:1cd::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Fri, 14 Nov
 2025 15:08:22 +0000
Received: from DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::c508:9b04:3351:524a]) by DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::c508:9b04:3351:524a%5]) with mapi id 15.20.9320.018; Fri, 14 Nov 2025
 15:08:22 +0000
From: =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
To: greybus-dev@lists.linaro.org, Johan Hovold <johan@kernel.org>,
        Alex Elder <elder@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org
Date: Fri, 14 Nov 2025 10:07:32 -0500
Message-ID: <20251114150738.32426-7-damien.riegel@silabs.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251114150738.32426-1-damien.riegel@silabs.com>
References: <20251114150738.32426-1-damien.riegel@silabs.com>
X-ClientProxiedBy: MA5P287CA0046.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:175::12) To DS0PR11MB8205.namprd11.prod.outlook.com
 (2603:10b6:8:162::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8205:EE_|CH3PR11MB8774:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ae29eea-8163-421f-43d6-08de238fa6f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?U2J0OHNDeGxqdkNjUVFSNllvbjFQNlN0T3RZT0VhcWZkY2pLU2ZHc2ZxYzE0?=
 =?utf-8?B?SStUby9RNjB3YlJFWjlEK1BYUCtNWmFyMjROOTR2VXF1MDFqb1VpV1o1TUVD?=
 =?utf-8?B?M01xTVovMzY1b21saW85RC9wV0gwQStwUi9maFZYcXM5dGdaUjVxZkZpemc2?=
 =?utf-8?B?U0tiRnJScHl4a1dtM2RveEw3QnVmMkU2UXVkNzNqbE1ORktodUcyVWR5VFRx?=
 =?utf-8?B?VTlNNmJmUzYrU1hLOWVTMkY4aDNGWGM4QlhCN2FCYkNNekFhM3FCRFNXTk9o?=
 =?utf-8?B?ckExTlhLSDIrUUQwSmxnY2c0NkoxNjg4WTJDSi9PbGF0S3VZUzNCMy9VWnFp?=
 =?utf-8?B?UU9tZmoyWVhnVU9jaDdGY05ERFU4MnJWeVFYd3l5RXUrNGM2bGhjbGZHanlk?=
 =?utf-8?B?VE54cU5tQWNrMk54MSsra0pGUXVjV3JaMHJGNDNOeXpmMDBIS1RKVS94UG83?=
 =?utf-8?B?aitKY3cwOW5ZeCtnVW9VcVB2VXBadDIyOU1hREhaRENhR3RjTVlBZE0wcWRv?=
 =?utf-8?B?MUk3WWN1eHJTMjEwcEFhZ2FvMVJVUTlkLzhGZmZGR1VyLzhpY1pUZmx0OUNN?=
 =?utf-8?B?dmlGWnJSSDJrRUQ3YW45VURTb1R4cVVRQzZPanlNUTdyei9Cdm5yamFGVlZD?=
 =?utf-8?B?SXF5ODRiQUVVUFlBNkJ3dW1TejdkU2ZRUUNVNTErR1lmK2NoWkRxY1NUUWJp?=
 =?utf-8?B?NjBSRTVpa2VxLy9IU01QOG11M1FYMFVXWmhGbkxlbytkN2NtVEdXVm5UWVU3?=
 =?utf-8?B?S3Bzdk5hQ2sxOEVaUjM0bHJ4VTZzVUIxa3BubE13MEV5TGhiaGx6RmY1bm5t?=
 =?utf-8?B?Ry9aeG9RaTRueFlZb3pCb2pxaGxmQ0tJanVlSng5RlFmQktYZUhGaVgwQTRo?=
 =?utf-8?B?Q0Q4UGZGcjFOWWVpdWxWSVU1TDhMVWFXSHVsU0hJRzNPQjN6Vmc5bzM3MnJo?=
 =?utf-8?B?NGtRODBCcVZGVkl6RjVDeEdSelZHaDB3Nk1CSER2Z3NhNG1TN3Y4Z0kzQy9p?=
 =?utf-8?B?dGd4c3RUZVpsN1NVdzhmN0JvbGpMTEN1NERIOUo5STFQMHdJVlFxUmE2ZlFT?=
 =?utf-8?B?eFFIWkdWZnVWQjhTSjFlb3p0ZmcxOWlSV3RBM1NaUmUvcGZRcHoyeU4zaGYv?=
 =?utf-8?B?RmhHQXJLdWpTZzR4Q0JMYzBGME9iM29lS2wrUHB5a2xsR2hXdlBiZ2FLKzVS?=
 =?utf-8?B?ZjhxY2NEak9uZUNKT1V0amd2aHZ2cTFnaWN3a09hMVc2OFlsZ05PM2ExTmFi?=
 =?utf-8?B?ZGIvU2MvcUVtWWZ3eUlxc0NTdEY3ZGdWeEdKVWVxZW90V1lnWFNLclFRc1Uv?=
 =?utf-8?B?N0g4NGx1OWFhcHEvVDJKVzU2a050K3phU2FGU2hmSjY0UVR2enBFQUk4bTJK?=
 =?utf-8?B?UFJvSE0rODBJRFBrZlpkNmlZb3NrVENGN1JObU04Z2Y3RXJEcUltS2FWdUhS?=
 =?utf-8?B?MUE1bGhvTEtidWRBZ3Y3ZWJtZVF1bVJJMXd1UXU0TG1ySUVHMlR4MzUvUXdC?=
 =?utf-8?B?TUxvY0VvSDRPeEZEQ0g1QzdYRVplOHczQUE1c3NJbmJuaEJzdkNTUG4rRjhz?=
 =?utf-8?B?NmdFTWdXdlJDU3BsSXNnWjJaR3BRR04yOG5pbE4zajY5bXppQ1JtdzVwekVr?=
 =?utf-8?B?VUkzNklHNnZxZ0VUVXl3NkN4cXd4aWhDUWJQbnFxdndEK2ZnWk9MblFXZHp0?=
 =?utf-8?B?UFh3SzhDR083N0phVkdxV29EQW5pYjZJUS9vSmdKRjZ0c2JIQ2hhNWd1bUph?=
 =?utf-8?B?dWUrbFBBUjZCRzBWL1NrRVB0RVA2THY5RmlFM25VMTNDU2RRazFHT1hSMHZ5?=
 =?utf-8?B?VXJsS3FDUFpBYUNYREFKRUxDSUFPRmxKN0dZQWcxU0xRTzE4MTJrZ3Fwc1hx?=
 =?utf-8?B?VTFoMktKcmhuWEVvMjRVVlQ0aGpqNUZ5MUEyTmllWk9uUEg0clVzSC8zYjFB?=
 =?utf-8?B?QzBJVm9BUCtkR2lzWEp3RmRpRW5vYTUyL0x4RUxLVkRBaER0bnYxQmRsYXhB?=
 =?utf-8?B?aDc2NWRYdjZLUmRlWW0xOXhieFo0YnBNbEwralNOWUpLUWdBY1lhTWdXYThx?=
 =?utf-8?Q?2jFlws?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8205.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ckY4QUdBMDlFSUVuKzlyQm16K09JcW1jL25iWGhWU012WFhGUGtJby9FQkI3?=
 =?utf-8?B?MjhPRms4SXVNQ0tmZE9oWnV4bVVScEZ5YnJreExXN0xvTjVmT2VheENQeWxz?=
 =?utf-8?B?b0dzTS9jZ0dLWVJvU2tlcG45UmwvTXRDbW83bVRDUTJZZTJZSjczLzl0Tmcv?=
 =?utf-8?B?QURITXNFWERpeFZoeVJWME4vVnZWZUI3d0gvNEJzcSs0Q2JFWEZpeHBlM25t?=
 =?utf-8?B?YUVBTllsa0dwQjdhWHAyV2VtUUVaV0dlZkZvbnluY29OL0s0L0RIeG1RNDgy?=
 =?utf-8?B?cllZakQ1TE92VjRMYVU4UnRsKzB3L2N4VmpEYVBVVVVucWFac1lrclVyUzdm?=
 =?utf-8?B?Y25WU21yN1Jrc0hYRXVqR3IwNVpQMUQ3RlpFQmU4VHBOeHlQM0JDK01jTVFI?=
 =?utf-8?B?d2pncGFyQUVTdXY5T3AycTYrZ2pEaEQ4WldNbGRPcnRJeWM1ODMyU1dZc1Ar?=
 =?utf-8?B?N2FlcTBQVnQ0cCtRTzNzYWYzK1psaDk2aEhZMjY5UHRNZlhqVGs2NENTYlE3?=
 =?utf-8?B?ZUlSVnB0NDR5RjRGcWw1eHJTQi9vTXBPa1FJaUlVTTV2VHFsUjllMEg5Vlk0?=
 =?utf-8?B?aU50OXFXcDduTnlSWndwNCtZS0k2c0hYNjR6VHRRTFQ2R1luRitIb3lNd1lQ?=
 =?utf-8?B?b2VFZ1czVE9FTUhKbTJCcVlldnkwck5qRlovWllsaXlwa1VQTnNTT1MwWGVq?=
 =?utf-8?B?dklZZVJNWEx1TGVyRW4rTkFvVzd4bTlVWDBmQjdIOTlmL2dJVTFRR2VSTTN6?=
 =?utf-8?B?THh6a0krODBjbENzM0RUc3pjYjFzUFdiRGJCWk5UT1Z0NFl5TitBTnpkTkVr?=
 =?utf-8?B?WVNBVVgzQkprTS9jWm1yOW8xdEJWUnZ2ZWM0aHdFeHRDZDFWNFlPTnJaL1RU?=
 =?utf-8?B?REZVRVllRmRZeFZDblJtbG8rWnduYXZZZ3dhazlMTUpTeW1ISUVMVkdaR0d3?=
 =?utf-8?B?MkdpMUF6TU9HdW01QmZuTitiRUZLUDBzMFNKYmtkanhLcE1INmg2bDdYM20z?=
 =?utf-8?B?aWVsdTNuUWhiQTRJd3loM1BMZjZTZVVEbnlWZDkyV2dPd1FQVlFIQS8yamxx?=
 =?utf-8?B?V2xJMUpOZDhwVWRLdVZ5Mm9INnVVdkJjTUYveE95MGFyMCsrd1VQN1l5R1VE?=
 =?utf-8?B?UTZ0Ujc1K0xVU3RWVFB0dTN0NkM4aE9RVWdJTXgvMnh3c21YRmsyUm0xRnZM?=
 =?utf-8?B?bnFkQWMyaXp1cTI1bVVxZ0F2MVMvSUJlWkZUMFBYVEl6VkM0ZlpibTlISDIr?=
 =?utf-8?B?OWVNKzlxWDFvMkhWQUlHTHVWM2Vvbzc3NjNJVEsvWlBXQlZ5ejNJTEp1c2Np?=
 =?utf-8?B?NHM4aGx1R3JlRGNZMUI4cXRqTTN1OFhJYkJEVGEyYmdaSlNZbVIyNVlhKzFq?=
 =?utf-8?B?M1dRQ3NQZUpycVJHWjE0b0ZTRzZLV3kwU1htdWhPWVdoZThYSXBLMHJJTjBM?=
 =?utf-8?B?RUNlTG50dEJ4eEpKZU0wbWlWVTFybWl6OW1RSkcxT1BYWHVJOE9CU1dDTUxm?=
 =?utf-8?B?OHo3Sk00eHVvSlMzL0FiWmpkczFvNmdkNFlTVldBSEs3N2xwUjM4dmlqZzB4?=
 =?utf-8?B?NWg4alpLTExnR3EwNHA0YjZ6a2xwS0dKblBMLzNJZ1BuRzQ5bGZYNDBJNUdP?=
 =?utf-8?B?Z1Nucm1SWC9iWEsyWFgwY3VaN0svdVRtaFBjbEpuczE2ZGNtYVFWM09udVVn?=
 =?utf-8?B?VmNZbWxSenNFQy92QkdFa212aUFiRmlESWlyWWMxUWtWaHZFZzBuNlZIMXBn?=
 =?utf-8?B?eE83bFRYQmF5dEdzeURmL2JRZDR2TjJTamRNL0dpRUkxSEcrYWJnbnYrWGE3?=
 =?utf-8?B?bHNic1ZrZmNtVFRiMHBpUEMrYUdmYXRUL2Z2bTY0K3YzRXcrZFJQWEY1WWll?=
 =?utf-8?B?OXVoZVdLdHdXSFFuczZ1cjh4WFg0ZTh5SUdmSHdFem5mbFNFdGRWdytUeHBQ?=
 =?utf-8?B?SXZjMTg3NGdNVW0wWGJJWm80WGh3WVI3WlR3UFpnQWdHejRxRisrbGVTZmJ6?=
 =?utf-8?B?ZFJ4M1dlY0pSL0xlMzVJK2hLSUR3T2VtVzZ1cHdQRFJoOVY2WDVBNjFhOGdB?=
 =?utf-8?B?VUErcVFlbjE0NzdTMGt4czRFSHB4QytTY0ZiMEk0d0NYd0RMWEdRMkV0SGpF?=
 =?utf-8?Q?R8SVB7KGXN8MK4vOMiJSPa3qF?=
X-OriginatorOrg: silabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ae29eea-8163-421f-43d6-08de238fa6f4
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8205.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 15:08:22.5137
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 54dbd822-5231-4b20-944d-6f4abcd541fb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BGJGepKX7vFB+vy7Oy6wji897mew5sdCY2qkJLpsse/UdJS8DaOgEJzlAzTMq+QiMhMPJBK4NpMNgrf/BFxUHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8774
X-Proofpoint-ORIG-GUID: 5df9V4nrOCbV75xZIMj8di536O0szhcy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDEyMSBTYWx0ZWRfX4+mAPdxn6zcC
 x5zXKszUqqwK+s4YBbjasNtMu3Tebt3EGi4zH3uBLDiTqtohAxFk2pqo0Mn2k/DdPd6McUdR2ca
 rJXVq49uv1PqVNeTubQMVuxcDeEI71CJcgeP4qhIFz6Q6D3QFCU+d2IbvQMhelOVPl4zSdSPlsx
 xMz45PXA1495GLoBofQlWUffkf6FD54tLvc0sfITVlnmVsfWgMYriLLqjtgwTxh2RO9s74lJopy
 DDH2dOtC70Mb1oE96sTHCEljGgGLMPE5anGtwIk+FNWAjG7sjrDFfhyJgwrTnLsW6kSD0QmaKTC
 5NgObG8Phv/NETxgDhrTE5a96EABLjYJX/3LzUuCkZb6xpv5Dfn54wl3FAgApIG+XglTfpjXeMR
 0i3HsK2vX+Pvc8WruwrtPe6MThSLRQ==
X-Proofpoint-GUID: 5df9V4nrOCbV75xZIMj8di536O0szhcy
X-Authority-Analysis: v=2.4 cv=LfAxKzfi c=1 sm=1 tr=0 ts=691745f0 cx=c_pps
 a=XJoAL0HPiv6B0cYJlRTKVw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=M51BFTxLslgA:10
 a=i1IsUcr2s-wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=2AEO0YjSAAAA:8
 a=YpAaIpsKrikDV0a6NQsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 spamscore=0 clxscore=1011 phishscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140121
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 8F34A3F85B
X-Spamd-Bar: ---
X-Spamd-Result: default: False [-4.00 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[silabs.com,reject];
	R_DKIM_ALLOW(-0.20)[silabs.com:s=pps12202023,silabs.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:148.163.149.154];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:26211, ipnet:148.163.148.0/22, country:US];
	MIME_TRACE(0.00)[0:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DNSWL_BLOCKED(0.00)[40.107.209.81:received,148.163.149.154:from,2603:10b6:8:162::17:received];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	DKIM_TRACE(0.00)[silabs.com:+]
X-Rspamd-Action: no action
Message-ID-Hash: LSK4HVO5LJAXWWZV2DO2PKCHDPBQYDWB
X-Message-ID-Hash: LSK4HVO5LJAXWWZV2DO2PKCHDPBQYDWB
X-MailFrom: Damien.Riegel@silabs.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Silicon Labs Kernel Team <linux-devel@silabs.com>, =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [RFC PATCH v2 06/12] greybus: cpc: introduce CPC header structure
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/LSK4HVO5LJAXWWZV2DO2PKCHDPBQYDWB/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

Q1BDIG1haW4gZmVhdHVyZXMgYXJlIHJlbGlhYmxlIHRyYW5zbWlzc2lvbiBhbmQgcmVtb3RlJ3Mg
cmVjZWl2ZSB3aW5kb3cNCm1hbmFnZW1lbnQuIFRvIGltcGxlbWVudCB0aGVzZSBmZWF0dXJlcywg
YW4gYWRkaXRpb25hbCBoZWFkZXIgaXMgbmVlZGVkLg0KVGhpcyBoZWFkZXIgaXMgcHJlcGVuZGVk
IHRvIGFsbCBHcmV5YnVzIG1lc3NhZ2VzLg0KDQpSZWxpYWJsZSB0cmFuc21pc3Npb246IHRvIG1h
a2UgdHJhbnNtaXNzaW9uIHJlbGlhYmxlLCBtZXNzYWdlcyBhcmUNCnNlcXVlbmNlZCBhbmQgYWNr
bm93bGVkZ2VkLiBUaGF0IGNvbnN0aXR1dGVzIHR3byBieXRlcyBvZiB0aGUgaGVhZGVyLA0Kb25l
IGZvciB0aGUgc2VxdWVuY2UgbnVtYmVyLCBvbmUgZm9yIHRoZSBhY2tub3dsZWRnbWVudCBudW1i
ZXIuIElmIGENCm1lc3NhZ2UgaXMgbm90IGFja2VkIGluIGEgdGltZWx5IG1hbm5lciwgYSByZXRy
YW5zbWlzc2lvbiBtZWNoYW5pc20gd2lsbA0KYXR0ZW1wdCBhbm90aGVyIHRyYW5zbWlzc2lvbi4g
VGhhdCBtZWNoYW5pc20gd2lsbCBiZSBpbXBsZW1lbnRlZCBpbiBhDQpmdXR1cmUgcGF0Y2ggc2V0
Lg0KDQpSZW1vdGUncyByZWNlaXZlIHdpbmRvdzogdGhlIHJlbW90ZSBhZHZlcnRpc2VzIHRoZSBu
dW1iZXIgb2YgcmVjZXB0aW9uDQpidWZmZXJzIHRoYXQgYXJlIGF2YWlsYWJsZSBvbiB0aGlzIGNw
b3J0LiBUaGUgb3RoZXIgcGVlciBtdXN0IHRha2UgY2FyZQ0Kb2Ygbm90IHNlbmRpbmcgbW9yZSBt
ZXNzYWdlcyB0aGFuIGFkdmVydGlzZWQgYnkgdGhlIHJlbW90ZS4gVGhpcyBpcyBhDQpzb3J0IG9m
IGZsb3cgY29udHJvbC4gVGhhdCBhY2NvdW50cyBmb3Igb25lIGJ5dGUgaW4gdGhlIGhlYWRlci4N
Cg0KVGhlIHJlbWFpbmluZyBieXRlIGNhcnJpZXMgc29tZSBmbGFncy4gRm9yIGluc3RhbmNlLCB0
aGVyZSBpcyBhIGZsYWcgdG8NCmluZGljYXRlIGlmIGl0J3MgYSBDUEMgbWVzc2FnZSBvciBhIEdy
ZXlidXMgbWVzc2FnZS4NCg0KU2lnbmVkLW9mZi1ieTogRGFtaWVuIFJpw6lnZWwgPGRhbWllbi5y
aWVnZWxAc2lsYWJzLmNvbT4NCi0tLQ0KIGRyaXZlcnMvZ3JleWJ1cy9jcGMvaGVhZGVyLmggfCA0
MyArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCiAxIGZpbGUgY2hhbmdlZCwg
NDMgaW5zZXJ0aW9ucygrKQ0KIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dyZXlidXMvY3Bj
L2hlYWRlci5oDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dyZXlidXMvY3BjL2hlYWRlci5oIGIv
ZHJpdmVycy9ncmV5YnVzL2NwYy9oZWFkZXIuaA0KbmV3IGZpbGUgbW9kZSAxMDA2NDQNCmluZGV4
IDAwMDAwMDAwMDAwLi44NGM0N2YxMDViMw0KLS0tIC9kZXYvbnVsbA0KKysrIGIvZHJpdmVycy9n
cmV5YnVzL2NwYy9oZWFkZXIuaA0KQEAgLTAsMCArMSw0MyBAQA0KKy8qIFNQRFgtTGljZW5zZS1J
ZGVudGlmaWVyOiBHUEwtMi4wICovDQorLyoNCisgKiBDb3B5cmlnaHQgKGMpIDIwMjUsIFNpbGlj
b24gTGFib3JhdG9yaWVzLCBJbmMuDQorICovDQorDQorI2lmbmRlZiBfX0NQQ19IRUFERVJfSA0K
KyNkZWZpbmUgX19DUENfSEVBREVSX0gNCisNCisjaW5jbHVkZSA8bGludXgvZ3JleWJ1cy5oPg0K
KyNpbmNsdWRlIDxsaW51eC90eXBlcy5oPg0KKw0KKyNkZWZpbmUgQ1BDX0hFQURFUl9NQVhfUlhf
V0lORE9XCVU4X01BWA0KKw0KKy8qKg0KKyAqIHN0cnVjdCBjcGMgaGVhZGVyIC0gUmVwcmVzZW50
YXRpb24gb2YgQ1BDIGhlYWRlci4NCisgKiBAY3RybF9mbGFnczogY29udGFpbnMgdGhlIHR5cGUg
b2YgZnJhbWUgYW5kIG90aGVyIGNvbnRyb2wgZmxhZ3MuDQorICogQHJlY3Zfd25kOiBudW1iZXIg
b2YgYnVmZmVycyB0aGF0IHRoZSBjcG9ydCBjYW4gcmVjZWl2ZSB3aXRob3V0IGJsb2NraW5nLg0K
KyAqIEBzZXE6IHNlcXVlbmNlIG51bWJlci4NCisgKiBAYWNrOiBhY2tub3dsZWRnZSBudW1iZXIs
IGluZGljYXRlIHRvIHRoZSByZW1vdGUgdGhlIG5leHQgc2VxdWVuY2UgbnVtYmVyDQorICoJIHRo
aXMgcGVlciBleHBlY3RzIHRvIHNlZS4NCisgKg0KKyAqIEVhY2ggcGVlciBjYW4gY29uZmlybSBy
ZWNlcHRpb24gb2YgZnJhbWVzIGJ5IHNldHRpbmcgdGhlIGFja25vd2xlZGdtZW50IG51bWJlciB0
byB0aGUgbmV4dCBmcmFtZQ0KKyAqIGl0IGV4cGVjdHMgdG8gc2VlLCBpLmUuIHNldHRpbmcgdGhl
IGFjayBudW1iZXIgdG8gWCBlZmZlY3RpdmVseSBhY2tub3dsZWRnZXMgZnJhbWVzIHdpdGggc2Vx
dWVuY2UNCisgKiBudW1iZXIgdXAgdG8gWC0xLg0KKyAqDQorICogQ1BDIGlzIGRlc2lnbmVkIGFy
b3VuZCB0aGUgY29uY2VwdCB0aGF0IGVhY2ggY3BvcnQgaGFzIGl0cyBwb29sIG9mIHJlY2VwdGlv
biBidWZmZXJzLiBUaGUgbnVtYmVyDQorICogb2YgYnVmZmVycyBpbiBhIHBvb2wgaXMgYWR2ZXJ0
aXNlZCB0byB0aGUgcmVtb3RlIHZpYSB0aGUgQHJlY3Zfd25kIGF0dHJpYnV0ZS4gVGhpcyBhY3Rz
IGFzDQorICogc29mdHdhcmUgZmxvdy1jb250cm9sLCBhbmQgYSBwZWVyIHNoYWxsIG5vdCBzZW5k
IGZyYW1lcyB0byBhIHJlbW90ZSBpZiB0aGUgQHJlY3Zfd25kIGlzIHplcm8uDQorICoNCisgKiBU
aGUgaGlnaHQtYml0ICgweDgwKSBvZiB0aGUgY29udHJvbCBieXRlIGluZGljYXRlcyBpZiB0aGUg
ZnJhbWUgdGFyZ2V0cyBDUEMgb3IgR3JleWJ1cy4gSWYgdGhlDQorICogYml0IGlzIHNldCwgdGhl
IGZyYW1lIHNob3VsZCBiZSBpbnRlcnByZXRlZCBhcyBDUEMgY29udHJvbCBmcmFtZXMuIEZvciBz
aW1wbGljaXR5LCBjb250cm9sIGZyYW1lcw0KKyAqIGhhdmUgdGhlIHNhbWUgZW5jb2RpbmcgYXMg
R3JleWJ1cyBmcmFtZXMuDQorICovDQorc3RydWN0IGNwY19oZWFkZXIgew0KKwlfX3U4CWN0cmxf
ZmxhZ3M7DQorCV9fdTgJcmVjdl93bmQ7DQorCV9fdTgJc2VxOw0KKwlfX3U4CWFjazsNCit9IF9f
cGFja2VkOw0KKw0KKyNkZWZpbmUgQ1BDX0hFQURFUl9TSVpFCQkJKHNpemVvZihzdHJ1Y3QgY3Bj
X2hlYWRlcikpDQorDQorI2VuZGlmDQotLSANCjIuNDkuMA0KDQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpncmV5YnVzLWRldiBtYWlsaW5nIGxpc3QgLS0g
Z3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpUbyB1bnN1YnNjcmliZSBzZW5kIGFuIGVtYWls
IHRvIGdyZXlidXMtZGV2LWxlYXZlQGxpc3RzLmxpbmFyby5vcmcK
