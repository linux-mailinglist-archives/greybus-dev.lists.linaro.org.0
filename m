Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GP5XFJk3l2lfvwIAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Thu, 19 Feb 2026 17:17:29 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id D8528160922
	for <lists+greybus-dev@lfdr.de>; Thu, 19 Feb 2026 17:17:28 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id ED5A63FDB1
	for <lists+greybus-dev@lfdr.de>; Thu, 19 Feb 2026 16:17:27 +0000 (UTC)
Received: from mx0b-0024c301.pphosted.com (mx0b-0024c301.pphosted.com [148.163.153.153])
	by lists.linaro.org (Postfix) with ESMTPS id F0A123F6F0
	for <greybus-dev@lists.linaro.org>; Thu, 19 Feb 2026 14:38:49 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=silabs.com header.s=pps12202023 header.b=141hHCNS;
	dkim=pass header.d=silabs.com header.s=selector1 header.b=MMNur2B6;
	spf=pass (lists.linaro.org: domain of "prvs=05106e7ebe=damien.riegel@silabs.com" designates 148.163.153.153 as permitted sender) smtp.mailfrom="prvs=05106e7ebe=damien.riegel@silabs.com";
	arc=pass ("microsoft.com:s=arcselector10001:i=1");
	dmarc=pass (policy=reject) header.from=silabs.com
Received: from pps.filterd (m0101742.ppops.net [127.0.0.1])
	by mx0a-0024c301.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61JA8Vpj3432499;
	Thu, 19 Feb 2026 08:38:41 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps12202023;
	 bh=Myofm1KuVtm4Kbzrrl4iBh+SDW4X6/MTY9FEn1rJIu8=; b=141hHCNSerrD
	V53cUiFNcDXlNtsydg/U/Gv/lHRRLolCDR+QxMrhC+bOyRTsv5qxYq5jjxuwwYmA
	imwznVM4EvRYeyyVIu4z2Z/QOJIEkXpOkwPxU6E8hfbjdCThzMAG8u9IVmSMSblU
	67LskyOFt4yiBjFUIIHQezCfpSLOZbd8af5Vudeiph7y4FunQLnauwQjY7wMlE2+
	Gr9GUenPe51dzZXgzfmcq1FZT6YkFz6SGIwweV+d3Vpp/gOrdzrx8BJjjUp9p77P
	NEY0tumn/8zx6uDMLyHtzozg+2M+O43AeG49F1FtOIRZYGD98KrF9zcpWg1nivJ8
	to01Vab7jQ==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11023099.outbound.protection.outlook.com [40.93.201.99])
	by mx0a-0024c301.pphosted.com (PPS) with ESMTPS id 4ce0ggrhnj-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 19 Feb 2026 08:38:41 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cCZAXOgk9cmh0/cGclF0jPekpAxhdz7hOUY/Na35wGMu03m7SsM5+SMLCPvyEhx0xyjkT3PnoHH9aW6sXpA1EjaTUf7vkSuL7e7kHckfecOh6VJqftovtBIyfvlFC28GEJtxthsnFHKngINm5LZODzBkchxr2PNmMB5jLXZ0ivC6mNW7iPb6BAOkEG/x17XcHPZIWBFZ2Ij/179WX8mDQRWwTHsOQFRBMgDJJt3LzvsyntBaElVZHbU8r8GLYUKBNlIPUUiJdUvlliAr4pLUo5MLzBMtJe3A6URv+5pSgQ5Aqb2ARzqGorj1NHfHWWR044NtI8LJPP3kBRRaTsYTqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Myofm1KuVtm4Kbzrrl4iBh+SDW4X6/MTY9FEn1rJIu8=;
 b=KTWcl1AaQhtfCDNAf1TYRWrmTtI9ZD4TNrJo48KV9G9b+a4bt1edhW9TsLROKjWfNKGcEjR6X/QRNxSA8HQxZNASXGtkcJnu5qy7zn+vtJODszoVlRME+N5PcerTxzLg4TAMCPTJ/NYwSp1Cj0WqQpNCro99R3/ajFTP4qlJKvmXT9uLC1zdjDMpJEMcgESTVyga044063dJLlBljGZxOHkiNwKV7qtp0FukjrmydRP6bd9Ro1P6q+UprNX3NspFSf76xCpvuM/yd7YfJ1t5uc8JaunOEkzkRXuJ7NuTxHgOAywnoxPnLtl5wl3nBKsPOZBkaSoXUmUX9aYQLgdNpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silabs.com; dmarc=pass action=none header.from=silabs.com;
 dkim=pass header.d=silabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Myofm1KuVtm4Kbzrrl4iBh+SDW4X6/MTY9FEn1rJIu8=;
 b=MMNur2B6YWDeiSLd3VybQ5UyssAuWBL+TFMx0JgY9nfDgjAOReDlIhXGowoOMpRNtgRLFYOcc3bLCM9CXGQQK/nd5N0fbOdZLdaT8/n1i5mfFiwasEmlR3BvWZuALsgQ1T7AQGSyO85J1x7irS1tUYCCLP6/UQcPzxMHeAvFwSg=
Received: from DS0PR11MB8205.namprd11.prod.outlook.com (2603:10b6:8:162::17)
 by SA0PR11MB4703.namprd11.prod.outlook.com (2603:10b6:806:9f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.15; Thu, 19 Feb
 2026 14:38:38 +0000
Received: from DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::2de6:bc88:2af7:3583]) by DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::2de6:bc88:2af7:3583%3]) with mapi id 15.20.9632.010; Thu, 19 Feb 2026
 14:38:38 +0000
Date: Thu, 19 Feb 2026 09:38:36 -0500
Message-Id: <DGJ0KBIEA248.1JH2YZU2MCUPY@silabs.com>
To: =?utf-8?q?Damien_Ri=C3=A9gel?= <damien.riegel@silabs.com>,
        =?utf-8?q?J=C3=A9r=C3=B4me_Pouiller?= <jerome.pouiller@silabs.com>,
        <greybus-dev@lists.linaro.org>, "Johan Hovold" <johan@kernel.org>,
        "Alex
 Elder" <elder@kernel.org>,
        "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>,
        <linux-kernel@vger.kernel.org>
From: =?utf-8?q?Damien_Ri=C3=A9gel?= <damien.riegel@silabs.com>
X-Mailer: aerc 0.21.0
References: <20260212144352.93043-1-damien.riegel@silabs.com>
 <20260212144352.93043-15-damien.riegel@silabs.com>
 <15379358.uLZWGnKmhe@nb0018864> <DGDYJQU8IRVK.1WJLTV18VUFQQ@silabs.com>
In-Reply-To: <DGDYJQU8IRVK.1WJLTV18VUFQQ@silabs.com>
X-ClientProxiedBy: YQZPR01CA0071.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:88::11) To DS0PR11MB8205.namprd11.prod.outlook.com
 (2603:10b6:8:162::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8205:EE_|SA0PR11MB4703:EE_
X-MS-Office365-Filtering-Correlation-Id: f2a3c939-a529-45fc-4b1f-08de6fc491b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Y1lYWEVINTlIWHZuU1krN3dualptQmlRYUZ4MUJGbTBES3BEZDRtWGpkakE2?=
 =?utf-8?B?MU5JeVo2MDg0QzVCcmYxb0tLUVB2QVpqelcrL3RETWRvNmM5eXpVdDlLK1lQ?=
 =?utf-8?B?Z2YreW5ubE4xMEtuUnVJOEtteXlWMVAwNXpZWVMyTXRyQVFYcElOTjhyMEFv?=
 =?utf-8?B?MWtwZDZYMGhEc3Y2T2dNbXZGeGJkWWdGSUZESnZwNnNEcldKbTBObCtMRXNR?=
 =?utf-8?B?QTF3eW13Q3JYRjRzVEZoQmNTMVRJS0tHYnNpbDYydVIxUVlyMUM1UnR5Ykdu?=
 =?utf-8?B?K3RUZ1hZUkJLRmR3UjUwZ2NmdEg1aFRSdzNPZ3NneUpmY2dWUmJJc0psVGdH?=
 =?utf-8?B?akVzZjRKa2VOc3c4WWN1M1JxOTRlTUhmcHZsRHhhRzhEZlRiM01OSXo1eXIr?=
 =?utf-8?B?WUJEaU9aVVRuYjR5VDRnLzBMQ1VFYjNRTGpTVlFhRlJraXNWMFNPU2FVUHhK?=
 =?utf-8?B?N1pPOVhHemNzdGJvVmpYNlN2RjhZQlFQTmltWTViMTQ2NVZ1L3lTaDltUVdh?=
 =?utf-8?B?bDlDTk1ubjB5ekhPeU9qM0pDdzZZRmMzSXNFTVVaUmxZYkFOeXJDWFhEYmgy?=
 =?utf-8?B?MkdCTGFEMWs4dE1RbTlPR0lhSnh1UHppeXFZRWI2c1U5T3IxQVRQT0pWdndH?=
 =?utf-8?B?NjhiUGpUSHlYVVErcTJqRURDUjZvTitnb2JvM09yZE5weWNuemU2OUFUTyt3?=
 =?utf-8?B?VjlvWE1VbDBMVnZxQUFvVnZtWVA1RzJUcldhNloxN3M5UzRHWk1TdE92MG52?=
 =?utf-8?B?TGtkL1MzL1AzY2pOcFkzOERKazhlbjJmSlAxUEJiUjBPYnhTMy81VUxUdVE5?=
 =?utf-8?B?SElDN3k3aG8rK29rSG9SNWpTamEyV2llZ0JGT0Y3ZkdPODNwbGR5ckJUS0l5?=
 =?utf-8?B?aGZPRTU4ZmZaUDlPN0hkT2Y2UjFZZ2grVkxHNlUyUmxSUnd1UDA5VkordVBx?=
 =?utf-8?B?bDZJR0w3MjMvc3VFTDI5bGh5c1BVaWJUYkw0N2hrL00wOEJFeFd4VkVrZSsv?=
 =?utf-8?B?b0NiRnpxcmw4T1JvZllhUXc2WlhZQzFTLzN0Z3EvVHNmM29mQ2ROTW8zTWcy?=
 =?utf-8?B?STNqSkFYZ3FpVWZTanpNOUxHSzJLc1liZmJSVVZYUGJNcDRyWkRmVW1mRVlC?=
 =?utf-8?B?eFZFYXhJUW40T3JmOWdJZDVFYS9EVE94U3NxYVgwd2JITHJUa2M1V3Bpb3pw?=
 =?utf-8?B?eFFBTWwwWnVkQWFYUHJZZEpUQTNnSGdic25tcmhuNXp3aHl5WWRTc1hNaWt0?=
 =?utf-8?B?bXhiZGdtZkFXa0FIWG5RNVd2aktkTmJpMXF4VEhsb1pWcUgzRzkzd0p1eitZ?=
 =?utf-8?B?MERvV1hjSVpLeG5IWTZ6ZGdzS0g1S2YrSEtQK1pERklkRUlzTTVhZUZvWFYw?=
 =?utf-8?B?a2p4T1BNZ0piM3E4a0RZb2lJckJYOTk0VFgySndsNzV2UnRrU1Y1TURObjhx?=
 =?utf-8?B?RXB4by8ySU5Za3ZkV2tRQjZJRlV4NHliWkM1Y3p2Y2dYZ3N0NTdDMlhCUUVx?=
 =?utf-8?B?RW5yREdDM25ya3ArV1RwUytNb1NtYjkyaXZUM3NPbXAzdHRVU1pGb2VIQzho?=
 =?utf-8?B?Q2VDbUZUVENLS2RQMHZCK0NzcElZVzVPazdsckU4ZlltZEd3aWVHN3RDbkFk?=
 =?utf-8?B?Ni9jMStjQ1VmZGFSZmlPMUh2TjZuM1kwcHVtZFpyeSs5UGtybUVvUW1YajBp?=
 =?utf-8?B?NU5qTm9CbUlvQWptaStlTWJrVmNYelIzNmoxdVJNWU5uMktIMm5BMTY4YXM1?=
 =?utf-8?B?NWI2TUZDaFp5RXhHWXlpWFJDZjlxUGpjNXNnbnBuWkN5eW9NVGRycU1SZW9p?=
 =?utf-8?B?NlI3MzduYXM2U1dXd0tUM05ZRjlNS2hlUUJJdFJuUXpEeHpjYTE0cDNUSkVV?=
 =?utf-8?B?S0hHak1Pd0RtYU1haldDY2JyU3MrL01OVGxVTTBYU0h3K092REREYUJwSFpC?=
 =?utf-8?B?QmR3eWtSTzBkZGZwU1Y3ZkJNaWRySGNYZ2JQUVcrYUpFdlpyL0dyTVh6d1kz?=
 =?utf-8?B?M0JTV1VINngzNjJvU2pZSWtGZjRYZTBMYURrZ0xUTTk4UTRZTWNLeDdxK2xq?=
 =?utf-8?B?UGFsUjhzd1pldFBBZ3RlZWk5aGRhK1RCM29vWEpLTlMvNlJ3cmRzM3N1ZzZL?=
 =?utf-8?Q?nyzc=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8205.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MllOL0Y0SE9RaUJmbm8wZkE4MjFyc21KNzlDNFNTRVRKMHZsdHRZY0NPRmdM?=
 =?utf-8?B?NnVxajI1RFZOaE44akQ3d055dDdCdUg3REhJVTR5c1Y0VEtDU05YWU05RWZW?=
 =?utf-8?B?UUxMRk56d0JXVVRnOFUvK1kySkM0ajhiK1ZnZ1lMNUwzeTdmeFhGYjBURCtN?=
 =?utf-8?B?U1JwbmIwbytTYjMvM0xidUlkNFQ0eEFYN3U0T0R2amc0emo3YWUwaDBPdEpI?=
 =?utf-8?B?ZGYxZ2JYT0VQclp0TGpLUHdJdzRid0ZYZk5sMkhWTlFaVkIwMVQ5RTk4Tmdu?=
 =?utf-8?B?eGV2WUZCSmVKY2tvRUlxUFJ6OEp1ZUhYZ3FrV2E4MVpJaHlIOVkxV05YdHFt?=
 =?utf-8?B?VWx6bFV4Skk5UGJtVmdNWkR5VkdGeDlxUGpmQ090dkpYckprVkFPUllUbmt3?=
 =?utf-8?B?NTJxTXRtWU1nUnM0dllpT1kzU0RDUiszN3c0QXczUlFsd0cxd2FlelR2aDlP?=
 =?utf-8?B?Sm52NnQvOVk2NTVOZUMzWWJIL2xhOG1icW1ETmVnSG5JVkVzdDZzZWk1Y2Qr?=
 =?utf-8?B?TXBaSXplNzNLNlBLSk9sVjZuYWVnTGZiSUdyajRPb3h3QXZnZ2k2SU1CZCs2?=
 =?utf-8?B?bGpEUmxtYy9rNFp2MEtSaWg3WDVibGd6OEZZTXBkS3E4ZGlHck84Q2swY3lJ?=
 =?utf-8?B?YS91ZU13S0J1VEhpOTJvNlIyTTFlV05EQ0tOM1lSeVM2MmVZL2tLNi9xMlVk?=
 =?utf-8?B?d3RUODRHbEtFZ2xrMGxrSFQ3NjBObDhxaWNSUXJiNGtDSzlVc2loU2tRdHow?=
 =?utf-8?B?WlRTVmNXUnJtY2RKdlloeU12NktiZXFKdXdLbEdoVkd4dE9Wb2RoM0RYL3l5?=
 =?utf-8?B?MFg2b0RNZ0R1YmF4MlpiTTBVUjZBTUZCL1NZSWJERldWeC80N3lYbEVUOS9k?=
 =?utf-8?B?UW1wR3hoRVZGMlBtdmhvWTlKWDJzaVJJZkRISWI4TllycUthYmJ5cDR5TU50?=
 =?utf-8?B?K3BQNk5DTktUSmJzLy9lNExpRFZIUXFENkVjZjZlTERubkJkampTdm9Tdnl4?=
 =?utf-8?B?YkEzWkRaZ25mUkpMd2ovdm1aaVlhWk9OcmJ0Z2FrbmVHMXZEYTNIenpQZzNM?=
 =?utf-8?B?ZmVYcUo3TUpyemlucUQyZkZTU0RHMTdJZ2FLNUo4NmVaSjhmTEJteVowa3Nl?=
 =?utf-8?B?Tzhiazd0QTlhU0x2NnlWNzBwM0poeHc5cmt6b3ZDam4rTHhMUXluTS9ML2FN?=
 =?utf-8?B?NUZKZGhkWkxUdVBzQlh6U0hxWXM3VnpIaVJxZHZrclVuVnFYNVFXK2ljck9z?=
 =?utf-8?B?WGRHSFVTUjVoRjJ4REFoZkZUTUxpbXJTUWk2ZitNekt3ZXFXa0VVZEVkUHJQ?=
 =?utf-8?B?L1NydFErcUF1OHpjQndhQm4vazR1UFFMMS9pWHZtYTNjOG5IUTRmRkVpL0s4?=
 =?utf-8?B?T3QwMkhNcGdwQzFWL3gyTHFCSmVXTXJkY2RNa2Y5K05DM2JaRW5Db0hiZThS?=
 =?utf-8?B?UFRZRjJlcGo3TWZ1dmVuUFVnMmQ2bG03eTVCUUhMNG9nNm5vU1BYVnZQUlln?=
 =?utf-8?B?RlNReTRhUGxwM05ZNy9vOUx5cGJ3SEIrNFZBNnJOUlUwMFhJSjBwSC9JcWts?=
 =?utf-8?B?dVNOWGVWV3ZlSG51QkZxQy9TaE5mWkdqT1B1TXdHZEh4RVdTUE9SUkRFT3NT?=
 =?utf-8?B?aDVVRDl5LzZmeWRYYWVQYmh4RXdVdHdoWXJyZTE3SmQrU01CMzdEOFQxTWJC?=
 =?utf-8?B?Y3FkQy9IQ2xRbkdldVBteTdPem12ZmJvT0ZjWDdvdUVjZFYxUkF0eE1Xa1d4?=
 =?utf-8?B?RG1Sb05LRjdDNmlDQmlaSVJsRjh3R09UV2xaWEpUUDc0M2lCQjh6cmlIYlVn?=
 =?utf-8?B?UzRBYlFUbTN3RlpsR0VELzhHdWk2Z0Z1YUZvanB6N2gvZUkvY3hpT28rR1JZ?=
 =?utf-8?B?ZGJBUXEyYkVVaER6dUZBS1duTzRWNnJXWm5PSExhQ0NnY0xicitUY2I2enpP?=
 =?utf-8?B?TUxabmx4aXNnSmNsSEVoZ2NxWDdCQzRHVFpMNEViak0wc0d4eDN6Zzg5Y1RY?=
 =?utf-8?B?ZnRBeTI2TDdXM0J1ai9XVjJ0dUZqYjdOYTk1N0ZIV05wSm9xMlVPS3I3MjRx?=
 =?utf-8?B?UWFiRHhyU1ZURTlnYjVnOGxWYkVJZUdkQXVvTEVBSkVqaU05MHowVER2NVZM?=
 =?utf-8?B?bEZ0WkU0UTh6cnVERlNKNzZaQ1lDK0lPczdMZ1ZRWnd1YWJIWUxKTU41UnVl?=
 =?utf-8?B?RWMrQm04Q0lvUWlOYTRwaXN1WEhtOUFyemZUSmR0Vk5xR3dLWGVleEJmaTZB?=
 =?utf-8?B?cnVpUTM1UzZHREZ1cjRTMEVRRnRFN3l2MEdRWXpIMG1rc1dWakZEZWlRRkZ0?=
 =?utf-8?B?LzRHSjBkOG9VbTltVUxKL0ZYeFZRd3NpWGdnMUxoeUI5L3pxVHFUQT09?=
X-OriginatorOrg: silabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2a3c939-a529-45fc-4b1f-08de6fc491b6
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8205.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 14:38:38.4811
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 54dbd822-5231-4b20-944d-6f4abcd541fb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rKYeTgOuT4wkjNVWtQT0maQ84vLKw95IQOjF9ntFraiRTTspzyjKfW7OhJabahs2imgtfs/mu9Xlp9PMDAb9/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4703
X-Proofpoint-GUID: HfsnAIOno69aHIMM4TrvUegh5_iQKDnh
X-Authority-Analysis: v=2.4 cv=C8/kCAP+ c=1 sm=1 tr=0 ts=69972071 cx=c_pps
 a=ajv5h6Eily4lkhfMD1AUMQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=M51BFTxLslgA:10
 a=i1IsUcr2s-wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=gIHJBl62Mt9vjvfn7G3b:22
 a=buQUfWhnF1OtDDk5FV7I:22 a=FaPoT5A1k7lRRQslOVEA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE5MDEzMyBTYWx0ZWRfX9DE1ZX7FA54Y
 OKbGwbrJj82X4RE7PbkzMPHioyJeZUZToxqbVhWjxWNxb+c+fZbHmNxkEgo5kHEg1zos3lxkHSX
 O6GfR64Jce1f0Y9FFwwAJ+7Z+nVqMGDRpWtpIoZDyTJM+MKc7LgLuhZRhZ9q2JmI83DeGlafWU3
 npDv1IASbb4rBvaN+/TXPdGi2KLzaksnK+iZhKKzVeBhSmxxkFfXyJsAh6s1LBKpP4ktuzJoF6n
 ldWUgI13AFZbR38aZcuDfWpeXq97CPyLJyOZ1V+tV+ooVhw3aydK2JBl5DUXF/haIsimFTLKVpr
 LbyISZDp8fcjmWpJdEzCkAjDO0kOXYNmwimWXxegCAHaX+wIci1zZDbZmdl74I41Vw4jJ+0vV/k
 we9zBJzpDi9I5AFwEg7aM8CSMxE6lOv0Qxu3viJ5wlv8HiEfZ0425tllHBl2nwT3cEwl+CQ4meH
 5qrM/OiAEAazkfaglPQ==
X-Proofpoint-ORIG-GUID: HfsnAIOno69aHIMM4TrvUegh5_iQKDnh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-19_04,2026-02-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 bulkscore=0 spamscore=0 clxscore=1015 phishscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602190133
X-Spamd-Bar: ----
X-MailFrom: prvs=05106e7ebe=damien.riegel@silabs.com
X-Mailman-Rule-Hits: implicit-dest
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
Message-ID-Hash: WV6NUOBA2OIVP76BJCKKC67SLY4YJH6Y
X-Message-ID-Hash: WV6NUOBA2OIVP76BJCKKC67SLY4YJH6Y
X-Mailman-Approved-At: Thu, 19 Feb 2026 16:17:22 +0000
CC: Silicon Labs Kernel Team <linux-devel@silabs.com>, Gabriel Beaulieu <gabriel.beaulieu@silabs.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v3 14/14] greybus: cpc: add CPC SDIO host driver
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/WV6NUOBA2OIVP76BJCKKC67SLY4YJH6Y/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.59 / 15.00];
	DMARC_POLICY_REJECT(2.00)[silabs.com : SPF not aligned (relaxed),reject];
	R_DKIM_REJECT(1.00)[silabs.com:s=pps12202023,silabs.com:s=selector1];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx:c];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[damien.riegel@silabs.com,greybus-dev-bounces@lists.linaro.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[silabs.com:-];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	NEURAL_HAM(-0.00)[-0.978];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linaro.org:helo,lists.linaro.org:rdns,linaro.org:email]
X-Rspamd-Queue-Id: D8528160922
X-Rspamd-Action: no action

T24gRnJpIEZlYiAxMywgMjAyNiBhdCAxMTowMCBBTSBFU1QsIERhbWllbiBSacOpZ2VsIHdyb3Rl
Og0KPiBPbiBGcmkgRmViIDEzLCAyMDI2IGF0IDQ6MzUgQU0gRVNULCBKw6lyw7RtZSBQb3VpbGxl
ciB3cm90ZToNCj4+IEluIGFueSBjYXNlLCBJIGJlbGlldmUgd2UgY2FuJ3QgcHVibGlzaCBhIGRy
aXZlciB3aXRoIFZJRCA9IDAuDQo+DQo+IE5vdGVkLCB0aGUgcGF0Y2hzZXQgY2FuJ3QgYmUgYXBw
bGllZCBhcyBpcy4gSSdsbCBjaGVjayB3aGF0IHRoZSBwcm9jZXNzDQo+IGlzIHRvIGFzc2lnbiBh
IFZJRC9QSUQuDQoNCkknbSBzdGlsbCB0cnlpbmcgdG8gZmlndXJlIG91dCBpbnRlcm5hbGx5IGhv
dyBJIGNhbiBnZXQgYSBWSUQvUElEIGZvcg0KdGhpcyBkcml2ZXIuIFdlIHRob3VnaHQgd2UgaGFk
IGEgdmFsaWQgdmVuZG9yIElEIHdlIGNvdWxkIHVzZSwgYmFzZWQgb24NCmEgSkVERUMgSUQgdGhh
dCB3ZSBhbHJlYWR5IGhhdmUgYXNzaWduZWQsIGJ1dCB1cG9uIGZ1cnRoZXIgaW52ZXN0aWdhdGlv
bg0KSSBkb24ndCB0aGluayB3ZSBoYXZlIHRoZSByaWdodCB0byBkZXJpdmUgYW4gU0RJTyBWSUQg
ZnJvbSB0aGF0IEpFREVDDQpJRCwgc28gdGhlIHdob2xlIHByb2Nlc3MgbWlnaHQgdGFrZSBhIGJp
dCBvZiB0aW1lLg0KDQpJbiB0aGUgbWVhbnRpbWUsIG1heSBJIHN1Z2dlc3QgdGhhdCB3ZSBjb250
aW51ZSB0aGUgcmV2aWV3IGFzIGlmIGEgdmFsaWQNClZJRC9QSUQgd2FzIGFzc2lnbmVkPyBZb3Ug
Y2FuIGtlZXAgeW91ciAiUmV2aWV3ZWQtYnkiIHVudGlsIHdlIGFjdHVhbGx5DQpoYXZlIHZhbGlk
IElEcy4gSWYgd2UgaGF2ZSB0byBnZXQgaW4gdG91Y2ggd2l0aCBleHRlcm5hbCBvcmdhbml6YXRp
b25zLA0KaXQgbWlnaHQgdGFrZSBhIGZldyB3ZWVrcyBvciBldmVuIG1vbnRocyB0byBnZXQgc29y
dGVkLCBJIGhhdmUgbm8gaWRlYQ0KaG93IGxvbmcgdGhhdCBwcm9jZXNzIHdpbGwgYmUuDQoNCkFs
dGVybmF0aXZlbHksIEkgY291bGQganVzdCBkcm9wIHRoZSBTRElPIFZJRC9QSUQgYW5kIGp1c3Qg
cmVseSBvbiBkZXZpY2UNCnRyZWUgaW5zdGVhZD8gVGhhdCBsZWF2ZXMgdGhlIHF1ZXN0aW9uIG9m
IHdoYXQgdGhlIGNvbXBhdGlibGUgc3RyaW5nDQpzaG91bGQgYmUuIFJvYiBIZXJyaW5nIGRvZXNu
J3Qgd2FudCBhIGdlbmVyaWMgInNpbGFicyxncmV5YnVzIiBzdHJpbmcsDQppdCBtdXN0IGJlIGEg
cmVhbCBwcm9kdWN0IGFuZCB3ZSBkb24ndCBoYXZlIHRoYXQgeWV0Lg0KDQpJJ2QgYmUgaGFwcHkg
dG8gdGFrZSBhbnkgaW5wdXQgdGhhdCBoZWxwcyBtYWtlIHByb2dyZXNzIDopDQoNCg0KdGhhbmtz
LA0KZGFtaWVuDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpncmV5YnVzLWRldiBtYWlsaW5nIGxpc3QgLS0gZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9y
ZwpUbyB1bnN1YnNjcmliZSBzZW5kIGFuIGVtYWlsIHRvIGdyZXlidXMtZGV2LWxlYXZlQGxpc3Rz
LmxpbmFyby5vcmcK
