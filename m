Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 5635FAC2B12
	for <lists+greybus-dev@lfdr.de>; Fri, 23 May 2025 22:44:27 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 4B8B944494
	for <lists+greybus-dev@lfdr.de>; Fri, 23 May 2025 20:44:26 +0000 (UTC)
Received: from mx0b-0024c301.pphosted.com (mx0b-0024c301.pphosted.com [148.163.153.153])
	by lists.linaro.org (Postfix) with ESMTPS id B215B441C0
	for <greybus-dev@lists.linaro.org>; Fri, 23 May 2025 20:38:40 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=silabs.com header.s=pps12202023 header.b=fJhU9IVT;
	dkim=pass header.d=silabs.com header.s=selector1 header.b=fb6tC34z;
	spf=pass (lists.linaro.org: domain of Damien.Riegel@silabs.com designates 148.163.153.153 as permitted sender) smtp.mailfrom=Damien.Riegel@silabs.com;
	dmarc=pass (policy=reject) header.from=silabs.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from pps.filterd (m0101742.ppops.net [127.0.0.1])
	by mx0a-0024c301.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54NHOxOq027605;
	Fri, 23 May 2025 15:38:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps12202023;
	 bh=JcByskGMrZ/9jNLPn7/tiqrvJD1tqSBOlBi5DmWma54=; b=fJhU9IVTepT8
	jZ8yL8CdpDMd8phwk5Nc8KCJmJVmuvb/ymZIceeyVid4gduovifjSlB1shpS2eQl
	opYo27AKsgWaj02nMOFyRquWZzCuWT+JKe3x9KJPm1m5laAxtlGKtffjPxJJ4WzR
	5BXbsnw896BntYh2XyIsUWdeg0Htxz9oPqs7MVzMzIiGeZoDAo9tB/V0fUvasuKb
	JYpQmX5s5Ma5AUpMdheftq7ANVgy5DTSxW4B4L4HQjes7io9YHk1ucJtwzwUnIBJ
	CIn2yBlHgLzCmQQmOpq733TrI72Gr2d1ogaANeIyHPM2XzhEVeMz33e807iM9dPX
	qMrtVeL3vg==
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02on2135.outbound.protection.outlook.com [40.107.95.135])
	by mx0a-0024c301.pphosted.com (PPS) with ESMTPS id 46t54wkamy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 May 2025 15:38:25 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WkBFqblzr8n35snpP+BCVPmqnMFlAI2C+PzXxB0YCmWKbF+dyl7IAiAaIA3SOF5KgajRdfKImvpf+vybP53LF7duVj5YcEfuZOg5eeShoMCsstCvhEYHO5llxvsNQEhVR2b5yRWdVQxkY3hV7Uzy5HyeingO47z/nQw+q3dn1N4+J5RitY/8X/mJI0+Th16aq0Peop7l9ys+BSb+EvQwMYTYeL4L2E7qjF7EhmV0V7uPdPs88l5IH05W/4Mmw0mHGM6+y/OXUhNIaPXkr/aL06ndT9WaqArlwxi4PtWQA8hqAqWJlzmBUd2A15YuIwtTsVxZAz3mmNUq8UD1dMayqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JcByskGMrZ/9jNLPn7/tiqrvJD1tqSBOlBi5DmWma54=;
 b=f0Gam5LNRLTPeQkHkeYugcNRa7brCYXkNxB0qzF0q9IuaSWSIokbyH7h0cOoRZGbzA5WW5oxc7MFWqQgengCnshgw9WXvQeXWsdSnOiyDZcup5TVEN5e1ll120lYg3/8mDs9/abE3MZQaNbpqG4zYY3WGtZ5+UkRVVpw/oEmK0ONkA0gGb+qgYQi8h+X0HS+Rkh4w4np5rGH9VlLdwP9vAoWiGCSKwUNdhxCY++8kSS4CmFS6tKVF7c74mXTqZvlyie79qpDBSS939sp0ViT3dgAFfZRthPJ4WWhoq+N0GJeCmNf7mJPjxM/Dm5xtpt7mkt90mAVwrl7lGEqHmzslw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silabs.com; dmarc=pass action=none header.from=silabs.com;
 dkim=pass header.d=silabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JcByskGMrZ/9jNLPn7/tiqrvJD1tqSBOlBi5DmWma54=;
 b=fb6tC34zv0kBh9kv0SnxgQAuGxbIQX794BAg0EOoBoag6KHZ0ur+r+mlzlcoUFGYeZfirnlLVJ/or1gYJKBKgbh55UPDwp/fq4BfIRPaRXvH1jKrkoCtlbZMEsyvQwtkgx764nNe8zUzyQ6r17xNlmpF0kTgj9TyYDL848ZMNm8=
Received: from DS0PR11MB8205.namprd11.prod.outlook.com (2603:10b6:8:162::17)
 by PH8PR11MB6829.namprd11.prod.outlook.com (2603:10b6:510:22f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Fri, 23 May
 2025 20:38:20 +0000
Received: from DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::c508:9b04:3351:524a]) by DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::c508:9b04:3351:524a%4]) with mapi id 15.20.8722.031; Fri, 23 May 2025
 20:38:20 +0000
Date: Fri, 23 May 2025 16:38:17 -0400
Message-Id: <DA3TVJDZ81YO.1NHRVPOHH9YJU@silabs.com>
To: "Andrew Lunn" <andrew@lunn.ch>
From: =?utf-8?q?Damien_Ri=C3=A9gel?= <damien.riegel@silabs.com>
X-Mailer: aerc 0.20.1
References: <20250512012748.79749-1-damien.riegel@silabs.com>
 <6fea7d17-8e08-42c7-a297-d4f5a3377661@lunn.ch>
 <D9VCEGBQWBW8.3MJCYYXOZHZNX@silabs.com>
 <f1a4ab5a-f2ce-4c94-91eb-ab81aea5b413@lunn.ch>
 <D9W93CSVNNM0.F14YDBPZP64O@silabs.com>
 <65cc6196-7ebe-453f-8148-ecb93e5b69fd@ieee.org>
 <DA3STV21NQE0.23SODSDP37DI7@silabs.com>
 <db54fe16-ae7d-410c-817b-edb4faa6656c@lunn.ch>
In-Reply-To: <db54fe16-ae7d-410c-817b-edb4faa6656c@lunn.ch>
X-ClientProxiedBy: YQBPR0101CA0177.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:f::20) To DS0PR11MB8205.namprd11.prod.outlook.com
 (2603:10b6:8:162::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8205:EE_|PH8PR11MB6829:EE_
X-MS-Office365-Filtering-Correlation-Id: 8954abae-fdc1-4eb4-3a11-08dd9a39c0f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?S3hFUFpwZXZXMjlLR1FvM2RPUGlwN25vM2Y5VXRnSWE2N3pEdndob05zTHU5?=
 =?utf-8?B?NHVyeHdZRkxXWkRBdFg5MCtjS0JoT1k3Zi80TkJBbUcrdjljMktsakdtSm52?=
 =?utf-8?B?SkVFKy9KSkhJQ1lvMDlVT1kwOGtZSUJnRGNGUEJocFBIL244RzliT1FtU08y?=
 =?utf-8?B?Vjk0NTBqZDBUY3B6TmVHaDNRVGJXZ2sxN0l1dDdya2hPd1ZyNUR5MWtlOVZm?=
 =?utf-8?B?Smd5N2YxV2hBVVB5aG1wbzdJbEc4dnFPQ1Y4eFc2M2hCUEtZbjUrZGxRTHV5?=
 =?utf-8?B?dzhuWG0vYkdrbHJJdlkyazZtd1VPYXBuNVozRkprR0NObFVLNklwaXk1dTI4?=
 =?utf-8?B?TU9hTlc0bnlQL1hEejR3M0c0YTJ0VEl1RldZQXhFalBIeHpOK3h5NGU1aUxM?=
 =?utf-8?B?QmxyVmRGTUpQWUo0a0FjV0hPcEtrTHZSKzBLUXRuQW4zNjc5UHdaandYdG1u?=
 =?utf-8?B?UlZsS2NZcWdGTUI2UkQ1bUFFMC9vUnVzdTFURG9mMFlKMkxva3VuMjMxaUlr?=
 =?utf-8?B?SmJGcHozZ0huQXFHUUU5VmUyUUw0WHEzWE1GckwrK21WeWZPakYyeXplU1Nt?=
 =?utf-8?B?ZmRQcmpaQjFRd2Fac2xVRkhZNytucDZRSno3T1JxNGUzeUNGcFlkQTEraUh4?=
 =?utf-8?B?MjByL1ViVDdjQXhZRlFqODBCWm5PUzZiWGdqQ0xjQ2ZGb2pCMndITDc0Y2Nt?=
 =?utf-8?B?RGVQU1lSelJvQWFOcVNoMmZDTUhLZVZCVXBDT0FZczZoTGlCNGNwT3pkVTBV?=
 =?utf-8?B?T09Wa0E1Z1hTSDdpeisvdUV0bDFuZTRsQktqd2cvNXdzOEpaRFY0ZS9QdHI3?=
 =?utf-8?B?TlVnVGs1QW02SnpGQUFkT3huU1hKTmI5NnZxOS9qbFFyMkF4eW90eHE5c29m?=
 =?utf-8?B?RnlGb0lOclY2aitLanVEaTM2empBVXo3SFpNZ0VKbDdwOWV1WExnUXE2QjNF?=
 =?utf-8?B?dHRVTTh0N1NlZXFJYTZ5OGgwWElwRjZXWEdzQ2tOeStUZkZSL2p3cUo1blFt?=
 =?utf-8?B?T1pDaDl6T0xyL3lTMHVkdEh2YTh0d2cvNENISlFaQTR5V0plR0pKaTQ3bjhw?=
 =?utf-8?B?QWdxNk1NVjAzT1RTc3g4dXhhVUVkTTFOUGdMS3Z6V1IrdUhEMG9lYUZCUys2?=
 =?utf-8?B?TE8yWmZURVZ5WWp5QjYzbzFpbmhKVDErZDA2Vm9HeWd2ZnJJeW5CaVY5L2t2?=
 =?utf-8?B?cDR4dXp5b3creG84WWRYa0tDc3I2MHNXdFQxMzhIVk9GTndwd0dpTFpDT1Zz?=
 =?utf-8?B?di9EL3N5V1NZcWF5QXFmdjNXc0plclYydzdWT094YmNBRnMybEYxdCt2UFRJ?=
 =?utf-8?B?Y0FUQ3JsNlFQZHkvL0VkUmdNei8ycm92WUlya1Q1N1dGMGFrcG4wWHBML2JV?=
 =?utf-8?B?VkxiWWZiYlYwUFVadE55TDlyQ3dBL0hWRm9CVnNKb1FJMCtnV2JXNlpUeUFB?=
 =?utf-8?B?STQ0R2Z2VHFNYWZRNHRYUEkwSHVjQUxaT094RDd3aTZlYnBwV2M2SDZrR3FB?=
 =?utf-8?B?UVF2ZTNmejVQSWdkM1RhRTY0OWF3ZkRvejgvbXhvS1RiTm5hWFhQbE9kNnJM?=
 =?utf-8?B?NzFiL0YrMmJVVDM0VFdneVpETnNoVm0wU3AwU3VoY1FMMk1RQ0Mxd3BHY3Rz?=
 =?utf-8?B?RTFXZDdYeDVxeFBzNlhyM0V3dmd1Z0xnYmpuYXNuNzNtY0F3UWM2b0dnVEhV?=
 =?utf-8?B?NUplTitwOVhoVzZjUjB3S2NGNldEbG5PT3RHL0JUZ3Npb3M1bjlyNVhtWndN?=
 =?utf-8?B?WmRITzkvaVZmYy9kblhOeEdaRmFCOG0xL0hYV1hwazFuLzFSWGprNTFKbFg2?=
 =?utf-8?Q?p51sXHNi3ncl+jHyf3cZUomjzoOt0OUMUUNv8=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8205.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cVVSNVc0em9YWENjdFFKakpqdTRvamhrTTJDMzhDRGdzSEZnNTNDQjlPQm5v?=
 =?utf-8?B?VVIxWWRxV3pLKzFOY2NGOXVuSVg4V0pQRVBabnlkK0NGc2RDbVJxK0JaSzc5?=
 =?utf-8?B?WFUrWFVyWlphN3VWRDN1TVV3UkpucGhwWE5FSGJjY3J1MndWYTBnY3FOYmJl?=
 =?utf-8?B?T1BZWjEreVUyaERlRUtmcGkxQmt1c01IYThWbzVLT2JmcmxWbUVCS0dyZS9X?=
 =?utf-8?B?WDZrdDJ1clRXMTdhWHRSbHo0L2tPb2l2Zm8zSE14UUl6Mk1mbGg3TnlVR3J0?=
 =?utf-8?B?YTZQN3NQekhkZjZVM1Q0dENheUM2VHdWSUkzYjkxdHk1THNTZjhIT3FJT2FO?=
 =?utf-8?B?QW53VVlFc3lwUmtCbWttNTIvbkl1Smt3TXNaSjh6UnNkb243R2Y1TnI3NkJK?=
 =?utf-8?B?Z2xhQ2JMWXg5Zjc5RlJPcWpKOXc2b0hoY3VMaTFFT1NqdEZRSXFaNVBneG1D?=
 =?utf-8?B?U01jcWxXR3JvazZKVzhFTkg2T2QyMzN0blhLR2tUT1R3Ky9mR3NqZm90TThZ?=
 =?utf-8?B?cmFERDc0TzhIYjNuWk1QdGVSVUxyUTVDMzJhN1RiYTJoamFYYlpqeWFPRDc5?=
 =?utf-8?B?WVFXaC9ZdnJuMkRFKy9QSlBpT3IySTRCb3FURzA2UVlPNHhzQlo1ZlBLOEU4?=
 =?utf-8?B?VFFDVDZvbS83SHhYK3ZvaFc5WmUvTDFIYlZEa1p3UEZKKzRraHpld2Y5V0NB?=
 =?utf-8?B?Q0RYNi9DM1pKQkV1akZvYVB0ai9lMXBabjhtaWh2TCtZWlcxS2RoTW5XNkpl?=
 =?utf-8?B?QUZRTU8zRklQNXhyOFZQeEFvTUJmejc2Y2dQOU5mVjNHdHBWTE9QcEZtVlNL?=
 =?utf-8?B?SEVWNnBmaFBScHJTekkzdjdnWS80Q1plajNWWkp4cmJvQUxVY0V2eFY1dVVV?=
 =?utf-8?B?ZzlSNllxR3JSMWZRSHpERWd6WjJ1RjYvQ3dtRmNwdElpRmcxcFNiQk9zRDFR?=
 =?utf-8?B?TDRoYXNSOS9GUno2ajdQK1dvRm5DanhqdjVEa3RiL3ZHaFZac1BGOE5naGxE?=
 =?utf-8?B?b2ZuS012VDhkNzJyL2VPVnFpT25CRnBOeFBqVmRIYnE1SkZHamhTODdnaFFP?=
 =?utf-8?B?RzdjMEVhR1BadWZCclp0RjFTbjNDUWVHUFNKYWMzNjlWeEE4c2xhZ29BWFNV?=
 =?utf-8?B?UTB6Rm04WEF6YXpqaWVZZmFheDgzcVV0VnZRWHRYSm5SdTZubXIvVE9JZXFp?=
 =?utf-8?B?eFY0KzdlclpROHVSemNmZTdqcU5qSUtYUTJPck5hRkVkUktnWE9QQ2Frenlm?=
 =?utf-8?B?UHgrMVFNTUdsUzZhQk9hSjFpeEE3MzE3OHg4ZzEzSSs4YlNGWWhDZE9LVWkx?=
 =?utf-8?B?YkNubityWnhIdzY1WUgrYmFLVnpWMTJqMjJZdnRqV3FIbGZCQ2ZDVFA4aUpp?=
 =?utf-8?B?Y3VoQ0NHOWM0S1psai9BN01jNkM5ekJ2OU45RTlRaTVNVVVkNVFISGM2c3hQ?=
 =?utf-8?B?NDBLS0Y2MVN6RlZYckpWVlo2ODgzaXFNTjFFZjR1dzBCWUhubVBvcUs3ajlR?=
 =?utf-8?B?VWM1Mkk5UnVFYWlPRjNFdVcvOC9jc0VPNlNYOFluVG4yQ0NMMVdjZTdGTUpn?=
 =?utf-8?B?TXk1ODFvU1Zsdmp3T1RsY1dpM0cyZGZ2NUtBYWRubm13ZWkyUm9jUHJ1S2Ft?=
 =?utf-8?B?T1d0dk9EL2wvQnB0Q1NXNWtxQkVXYXlGU0VpS3d2ZWo5ZE9OWUZGcUNYa3VL?=
 =?utf-8?B?aUIrTnJnYzcwYm1YSmF3a3JYSnFyd1c5TXVGKzBNRnRpRURrUENxUk95dk42?=
 =?utf-8?B?WXZNNmxYTVJzZkF3RmI1N0Q4R3huRGxLR0trTjN5VURMdkV2ZUh5OGZISXM5?=
 =?utf-8?B?eUszQVJubFF0Q3ZYajhUb013MURBMlU4YVliSnMxWXlYL2hVTW1ackJYUjVH?=
 =?utf-8?B?YStwVXYyS2NOS1VsbWxRbERjclViemx4S2F2VjByVlhCUGl4MHlsRlkwOVF5?=
 =?utf-8?B?TFRGdUF3em41NmZqTzZPc2pUQ085cEpTKzVvaEptVVF6RHNKWUFBWi9pYS80?=
 =?utf-8?B?NzQ4bEdGSWdtQWhrQTN4WTllSEdob0VVWWZnTFZpSXJUd2MxR00rWEVIMHVp?=
 =?utf-8?B?WEkvTkozSVdwdFRGMHdRVEpiRHZydW9OUDhHYU1qbXRYZHJNSysyRVI1VjBy?=
 =?utf-8?Q?XtIifcyNrb+NY5a5KZmsgq6yc?=
X-OriginatorOrg: silabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8954abae-fdc1-4eb4-3a11-08dd9a39c0f9
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8205.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2025 20:38:19.9233
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 54dbd822-5231-4b20-944d-6f4abcd541fb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YOF2ktF3KuZpQz8n7NJzWIzwCPlq9MlX1EXWVyrxONa4Yw9FGPk8gK6eTfHTSxMykBqjMcPzA4o989ngaEUMbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6829
X-Authority-Analysis: v=2.4 cv=JOc7s9Kb c=1 sm=1 tr=0 ts=6830dcc1 cx=c_pps a=73ZZgQctQage88DP8+znzA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=M51BFTxLslgA:10 a=i1IsUcr2s-wA:10 a=P-IC7800AAAA:8 a=5Bv2-q0KtQimkH2IRR4A:9 a=QEXdDO2ut3YA:10 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-ORIG-GUID: XG-szbRTsgfmSVAPuA_ml9SiyKy0CpmP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIzMDE4OCBTYWx0ZWRfX64mb/z4WQNdV WAz+nq73lFTb6jNxw0cuVf+DzhUn3Plf9uk+QdXnXFucVNuy+yqJAhD1gsv6GD8SE2GaHa9wDWY RIMPkJ3XPkgukGmzkXrOXLpySZ4nP6TrpgcjalRnGwrnb96EZwrmCzzTteyTOzKKuQxVRR6PNfQ
 LAlhK2evVnnuG6sMZHgH+J7Wk+7Mtcll7DLaxUrMHonOud2pDEw5bVI7b3zrBjvbH1NtRPyQMI5 VsU5aBxT8qexGhFElhEOzcKUuG7hmYgzLrlB6xtgzevLaJMmGJSB6toAk/xcw+mv0tYzdZRifw4 1KNpHNdBILOuNDCDhJiKFN6vG75faK3Q1tfLi22AbdsOyLU9lvVIzBw725/Pj1HHJ8WK6PQNY6j
 pPLBK5woIaxESLktUdn95yuFp77g7fL2UIL/Cg5aQmgiqOa2ZbV8Vra7xYk9OtN6r65KeiY2
X-Proofpoint-GUID: XG-szbRTsgfmSVAPuA_ml9SiyKy0CpmP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_06,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 clxscore=1015 phishscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 bulkscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 mlxlogscore=999
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2505160000
 definitions=main-2505230188
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Spamd-Result: default: False [-7.15 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-2.65)[98.47%];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[silabs.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:148.163.153.153];
	R_DKIM_ALLOW(-0.20)[silabs.com:s=pps12202023,silabs.com:s=selector1];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[netdev,dt];
	RCPT_COUNT_TWELVE(0.00)[18];
	ASN(0.00)[asn:22843, ipnet:148.163.152.0/22, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[silabs.com:+]
X-Rspamd-Queue-Id: B215B441C0
X-Spamd-Bar: -------
X-MailFrom: Damien.Riegel@silabs.com
X-Mailman-Rule-Hits: implicit-dest
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
Message-ID-Hash: L7EPMTS464OTGBW57EWRRC6MUXKK3TFK
X-Message-ID-Hash: L7EPMTS464OTGBW57EWRRC6MUXKK3TFK
X-Mailman-Approved-At: Fri, 23 May 2025 20:44:24 +0000
CC: Alex Elder <elder@ieee.org>, Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Silicon Labs Kernel Team <linux-devel@silabs.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [RFC net-next 00/15] Add support for Silicon Labs CPC
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/L7EPMTS464OTGBW57EWRRC6MUXKK3TFK/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri May 23, 2025 at 4:06 PM EDT, Andrew Lunn wrote:
>> I don't really know about UniPro and I'm learning about it as the
>> discussion goes, but one of the point listed on Wikipedia is
>> "reliability - data errors detected and correctable via retransmission"
>>
>> This is where CPC could come in, probably with a different name and a
>> reduced scope, as a way to implement reliable transmission over UART,
>> SPI, SDIO, by ensuring data errors are detected and packets
>> retransmitted if necessary, and be limited to that.
>
> You mentioned HDLC in the past. What is interesting is that HDLC is
> actually used in Greybus:
>
> https://elixir.bootlin.com/linux/v6.15-rc7/source/drivers/greybus/gb-beagleplay.c*L581
>
> I've no idea if its just for framing, or if there is also retries on
> errors, S-frames with flow and error control etc. There might be code
> you can reuse here.

Yeah I've seen it when looking at Greybus, from what I could see it's
only framing. There is a CRC check though, frames received that don't
pass that check are not passed to Greybus layer.

Another aspect we would like to support is buffer management. In our
implementation, each endpoint has its dedicated pool of RX buffers and
the number of available buffers is advertised to the remote, so the
Linux driver can delay transmission of packets if endpoints are out of
RX buffers.

We decide to implement that mostly because that would get us the best
throughtput possible. Sending a packet to an endpoint that doesn't have
room for it means the packet will be dropped and we have to wait for a
retransmission to occur, which degrades performance.
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
