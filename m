Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D15FCDA475
	for <lists+greybus-dev@lfdr.de>; Tue, 23 Dec 2025 19:32:39 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id B944440148
	for <lists+greybus-dev@lfdr.de>; Tue, 23 Dec 2025 18:32:38 +0000 (UTC)
Received: from mx0a-0024c301.pphosted.com (mx0a-0024c301.pphosted.com [148.163.149.154])
	by lists.linaro.org (Postfix) with ESMTPS id 47B534013C
	for <greybus-dev@lists.linaro.org>; Tue, 23 Dec 2025 18:32:08 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=silabs.com header.s=pps12202023 header.b=RAea+YnL;
	dkim=pass header.d=silabs.com header.s=selector1 header.b="Xh2Du7/Q";
	spf=pass (lists.linaro.org: domain of Damien.Riegel@silabs.com designates 148.163.149.154 as permitted sender) smtp.mailfrom=Damien.Riegel@silabs.com;
	dmarc=pass (policy=reject) header.from=silabs.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from pps.filterd (m0101743.ppops.net [127.0.0.1])
	by mx0a-0024c301.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNBlCKP2900128;
	Tue, 23 Dec 2025 12:31:58 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps12202023;
	 bh=Ohoh2gYqj2N0htC2KLXdsolXxwtjsholbp3AUkt6CCg=; b=RAea+YnLHWav
	ojVfBM7JFpVt5BVFRMQFXQgA5b8LYMMJCzOn2ovLq54WAZP76RxvC05rd23xbra6
	5NQGT5sFN1TIGBiFhB/XuwjrQb5OTfnlE+muVNPbWlEFbDQWpAZeQKkYuigbxJ+R
	m59mixyiSPbUFIHyGztSSTlZK5hRhe2HuBvqfMvABMvDdmyKmVWiUOg3o3Br+BWe
	klW+mO5DY36OfOzAL5rsibXNCN7onoO02TTeJJuXBd9B9zDdSyNgcIzZjjtPFAwP
	p6oY+fZfDYxVc4moH5TM33lwfui8iWy47oYhgSwlalQdmggTccevCDpiYG24qwNB
	HPvEXAHuTA==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11020084.outbound.protection.outlook.com [52.101.46.84])
	by mx0a-0024c301.pphosted.com (PPS) with ESMTPS id 4b7n7597g2-6
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 23 Dec 2025 12:31:58 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kXGBPoxG+7YsCGuEMx3gd2Bdhl0IQIvXCHB+kd2uSv4G5A4klUg/UcdwA/FRDK5F+Z545mJXfcFczF3NSEdDKozxmGXDUfkjCG+YRCMUptp2xaD+d6Q4AL02RcVgiNF66b5VYUtUvPO/fq0N+OdAlkZc/LVftUCckQ65RdNU17dytNWldHO4hQoF1aWWS3Y9MQqC/yY0VhUS04K+i+13r75BWR1i3BlcDT7nEBr+j4MlPlh0sjnHXF4pM7VHZm/JPnen5T3dm/j9otPpksKIr1LdRyYhI/Rpjny2bfmIKXvBa3+XGouKte8zM/dDfmefIekGscdaKhQ/zis9m2qW+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ohoh2gYqj2N0htC2KLXdsolXxwtjsholbp3AUkt6CCg=;
 b=Lv0RorenOn/1sjnEJZiptZe/AtoFFAXQ4B3CUNxfLClS+UNCtX+zgvBRGB0NpTJDxFYjGBlL+jf6+xUejpvetatoH0HAlFptC3m7Akgz9vCwT610z/juEp24QGYuK1yS7T8iADSxYmMRFcZZ08Tlbubv+WYoHxPOtORbp852AkTPEhyMccmUV4tM7UZTb1kVv5RmyrjuLmaTPyDGocf/94X4L7WNNEESn73zHKDe0ISZZyIH3TRPeAPKYku4lExBEaWXr7kXoBgcZhqaEehK7rlQqzDdPZw89q8P10g1S6PGMJenEsdNacBLHJnlcmW8gng5pllbj9HBcRXDLCH45w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silabs.com; dmarc=pass action=none header.from=silabs.com;
 dkim=pass header.d=silabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ohoh2gYqj2N0htC2KLXdsolXxwtjsholbp3AUkt6CCg=;
 b=Xh2Du7/QahTNh7/fYycuPxEXGUJxpplD2F7o+OYN0EB4QfHkXLu0xgw45aESZ9jtLc1fVlDNM+Qg2jo8oho4E6I5aUN/LZ70YAOVexdMwkKpFwPI1kwDdvjW2YZoxXtUAkVoLJKW1KoeG9fovVIYmVMX6WYGfjhhMOezi0TCti8=
Received: from DS0PR11MB8205.namprd11.prod.outlook.com (2603:10b6:8:162::17)
 by SN7PR11MB6924.namprd11.prod.outlook.com (2603:10b6:806:2ab::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.11; Tue, 23 Dec
 2025 18:31:56 +0000
Received: from DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::2de6:bc88:2af7:3583]) by DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::2de6:bc88:2af7:3583%3]) with mapi id 15.20.9434.009; Tue, 23 Dec 2025
 18:31:56 +0000
From: =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
To: greybus-dev@lists.linaro.org
Date: Tue, 23 Dec 2025 13:31:39 -0500
Message-ID: <20251223183142.31897-6-damien.riegel@silabs.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251223183142.31897-1-damien.riegel@silabs.com>
References: <20251223183142.31897-1-damien.riegel@silabs.com>
X-ClientProxiedBy: YQZPR01CA0008.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:85::23) To DS0PR11MB8205.namprd11.prod.outlook.com
 (2603:10b6:8:162::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8205:EE_|SN7PR11MB6924:EE_
X-MS-Office365-Filtering-Correlation-Id: 984b01de-7084-4d20-2095-08de42518d7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|10070799003|376014|52116014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?bmNlV1JiQ085ajZ0blhrcjUzSDFqeitFQnl6Q040ZmJJVFN3OVhRc2lEZklM?=
 =?utf-8?B?NzBpR2FGbWRmMmZvR0RZUjZmVVJaalR3WHFWbXNxREpxamFqZG4zbFZacjh6?=
 =?utf-8?B?RnFPUkJZZ2N1d0JMcmZPeGNMUUVzQ0crdE42c2tXQ0QzTlFZeW1hWlczc0da?=
 =?utf-8?B?MHBCcDZ6a00xV0doS3NIZytYV0lLdmJnSVRmWkZCblZrVGdVcG9BUGpzYUpi?=
 =?utf-8?B?L2pWeHZpRElUVGFyczNWVEx4RWV3eFJrRXdFNGpzL0J0ZG8wOG12N1FPRU5K?=
 =?utf-8?B?bXllb3hsMUJaZlZ0aDZrT1I4RXpna3pwelJnSXF2UVpMc0kwTEh5NWh3ZklN?=
 =?utf-8?B?NGpSN3NEMkxFN0lqLzV5clFLWnh6alNRdy9qRW5Fc0xJQ2MzTDRLc000dzVF?=
 =?utf-8?B?UWhwZ3NmaEVScVVyd292QzFGckhBMEVFRzNyV2Q2cmkxSVJyNU55T0JlUldr?=
 =?utf-8?B?OHVVMTdYeklrVlRwZGhHdTlvblBGWHRYcDk2QjJjWFp3K2QxR1VoY0lmTzZn?=
 =?utf-8?B?NGtHaUI0czA3RlFmbDdMS1BrbVNCSFBlYlMyQlhqdStLc2ViQWVhb09UUjBV?=
 =?utf-8?B?SDRTeUlzZUxLM3RnSEltYjZmaGRST2w5ZXdOUTRTaytzbDJuL0p2OFJvWTJa?=
 =?utf-8?B?VUc2NUIzVGM5REE0V3BkS2t3WVAxTlNsaW44UU5xM205Z08vbHBhVlhLUmNL?=
 =?utf-8?B?RGJYd2R3Y0lCRTZucU5NbC9vUmZBSEdVb2RNNTVCNVZ1TkF6YnpwdGN0Sk5a?=
 =?utf-8?B?K0kwR2RWOW1BN2VnMXJTVlE3RW5NamU1SjdYc211WGszYnB2WmMyMHJXMm5B?=
 =?utf-8?B?anN0cm9LZjdmdkVmbGNjNjQxSWphaVE5cXZJbGozUytKZVhLU0QzZnkvNzV5?=
 =?utf-8?B?QkVIMGxWcGV3cjhLbG5nTUVUWjMycmJUWXNjQ0xjaTRzaGhMN1F1dFo2R0Fz?=
 =?utf-8?B?K01qMlRSK3JzakNJNkozWWRFYmpHSE13RHlhaGo0WS9GNG5pR3o5cW5TUitp?=
 =?utf-8?B?Tmg3cDFjaVUxS1NueTdoOUJTdlpBMmYvcE1MeVdvZnUxRnFqanBXbitqenFL?=
 =?utf-8?B?YjVYd3VzTHE4b0NOTUJNN2tGbWJoVG9FblM2MWFlanBKbUZQM0VuU1ZwNFZ2?=
 =?utf-8?B?T2ZVWDdQSG5NQk5oSTBraTFCUmcyaGh0Tno0TWFRaEJGVEtVdWVKOFVKZDVv?=
 =?utf-8?B?QTVnWHY0QjVtOC8zVUJCUC93eWNZc1lWZnd0Um15TFo3Nkc0clFJY1JRS3lO?=
 =?utf-8?B?VVRkMVFIeVJHZ3REUW9RNlkxUmlyMVgzNWZvWnZFN2xPd1JRTVg1ZHA1Y2Jj?=
 =?utf-8?B?SkdwRnlPWTdFMmdoTUJnS3BKeVVYOW5uWFIwZklTSXRVNjAxV2hRV2Foemlq?=
 =?utf-8?B?VmF0dnVKZGk5THcvSHFKWTQwQU9nQXBOOU54YnVvRjZjNjMwd1ZDQkp2T0ky?=
 =?utf-8?B?SW53K1dpVGtIamJVeXpDTG1mOUxaWmhod1B5V3FndnFMRkR1WjlzUGpmNGRW?=
 =?utf-8?B?RG5aMXdDdURFSXVrTi9jenBoakhlVytGZ3pGYmJTTmV6R1ZqeVZWQzZyR3h1?=
 =?utf-8?B?Vkt5S1JXL2syc0N1cEZXTUh1MG1oT3pVZit1RFFUd0d1eHp5V25wOXRDbURj?=
 =?utf-8?B?dEsxK2NSdzlPeGNhSWRLVE8vcnpGc1F3YkltTEl5R04xMmVMQktFVE96OUxp?=
 =?utf-8?B?WlI5TDVCb1ZvZkhrbFN1Q1h3dDFOOXIrbVN0cEt5RUt3dzBBUUtzRDY2d0x0?=
 =?utf-8?B?MWcvZThvVkhKUEg0c05PU0pxdkhqWGJvNXlFcllqZmkxYjlZNEZpSEcvdThS?=
 =?utf-8?B?ck52dG5kUlM4ZG1LbHcySStCalBKNldzWXpQQ2U4aCtrUkpjUjFpTWlRYVFu?=
 =?utf-8?B?cENISEVoWkJwcVloZjNHb1JZTnBiQmJvR0s2VUpRUGxzMi9CYzU1bUlpZVNl?=
 =?utf-8?Q?S92Xp/c4E85GrJm0luLLjqddi2QgPgSu?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8205.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(52116014)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VXZOcFYvb0FLVmFjZVl5aStDNUM5M3Q2OTB5YnVkQ1k0NkJJbWdlN2lFY3Ra?=
 =?utf-8?B?WVM3Z25YZlRDSGR0Z1ZXazFsVGlpZXgwWXA0M0tFdzlnT1NDQXRlSHZaMjJ2?=
 =?utf-8?B?VklTQTAyNkJINmh4c0lWaTdBU1Q0dVFNSThYTkFoVVFmSm1heitGSlhQWDI4?=
 =?utf-8?B?NFBDOTZZKzlNU0JUdlZoQ0IrR0RxQXFVQ0tJNmpldXhGcUppZWl1ZEJNTGtJ?=
 =?utf-8?B?U2ZaVXJpSTRFaTVvWWp5ckFLbElLK3dOMGtOb3VSNjJRbEp4SUo0MVhPaVBS?=
 =?utf-8?B?QnZpdU1hSHROcGxvRmFtd1BRb2RpTUUxbnZXZmhRSmY4MlNaYlF1WTYwTHFT?=
 =?utf-8?B?YllHU3UyZHZtNGxndmNtNldaRjNGSTdPaUs0UEV5QjR2RlpXclNQanM3SGZZ?=
 =?utf-8?B?N2o0NXg1clNXckovakYxQUtYWUxMWjQzMnNMditxZ1NIYWhtNnVOV1RIS284?=
 =?utf-8?B?TEQwK2ova3NrZDduVHpTSHhzc1pxL0trZFNPQVcvcy9xdXk4aklmaEdNOVpy?=
 =?utf-8?B?cktuRFdzZzlRY1B0bFJ2NWFBVjIrWWFCdTM3ODRYUldsTXFScTdjQVdubVNr?=
 =?utf-8?B?WWlTWDRrejdFcVZOODhWNG51Rk5ZN3FmU3Q1Y0UzSXJ6U1hmTEJtQmJTdXZt?=
 =?utf-8?B?b2tQRFl1OHNTaXl1THJDNjRTR01XYWNXdnd1RGc4SVRNZ0FPOHRpNEN4WWFX?=
 =?utf-8?B?bGpNeE4rc1g5d0l5bGtMcUlybkthN2pUYXQ5R2trQTVUYTF6UFIvNUJRU3Vu?=
 =?utf-8?B?ZDlHaEN6emtsaW5zdkRvUmI3RDNFRHRQdnhvTnJ2OCtlcnJqWjZMcjN1NWlB?=
 =?utf-8?B?aGFnc0kvQmt1cXZrazZZam5XeHQwdSt6aHlpT1hCRlR1MmdwYTFKQzVFcU95?=
 =?utf-8?B?Um91aGRKcXZ2dFAxSmR0V0VraHBETlNtbTNZZU9iMUd1K3hUdzhQNjRLMzJl?=
 =?utf-8?B?RjBrcDJrYnp0cWR3Mk9iY1hNNDZWMjlEWlNtUXRmWnlGMGx1UFpZeS9TSE1k?=
 =?utf-8?B?Z1lzVHdzUnBNYnRhOWVkRjJxSXRQcUlqN0c0LzgrTkJHWUxGWlpPYzM3Ni9a?=
 =?utf-8?B?N3JDcDNEaXlNQVVLa1lSZDBRaTZaK2ZvZXVGT250QlVDMUVPdDFkaC94QU1J?=
 =?utf-8?B?ZHdONlVjZi9XcWsxVFpzVUp2ek4zZEhiY05TcnBYZUM1eEtGSldKTzZxN1hh?=
 =?utf-8?B?bjhHOCtXMGN0Nmw0WllQTzcrdnNCTHpIcC8wUlpGOU05YmhWdSs2M05mbGdM?=
 =?utf-8?B?OERndzc3OEZuQkZWVGNsb3hDRTZsemh6bUVJM1MrN2VYVHNaTWhtUHZmakNi?=
 =?utf-8?B?MmMrU2NCTi9FRkdpRjMweW9aOUF5bkd3dU5iRFdiaUQzdEJZaHMycElWMGlC?=
 =?utf-8?B?QVovdjRZMWpEanFjQ0oweHpvVTNCWStYNFk0MW9rUkNhRDA3ZGNmT1M3R1Jn?=
 =?utf-8?B?bVZBZDRGT2lKemJGRkZweE1HTzhDUk9jTDZiaGREbUxnaEJnclJkRVhLVDZR?=
 =?utf-8?B?a2ZzenhlUHlvc0I3QTUxM3hYekc1Z1lUM2xaODV6VkNUL1IxYzNxUlVTM21E?=
 =?utf-8?B?cG1hU3ZZMU81Q1owSDBqSnEzRjkwMDI3WE85eDRaSXNiR3hkdGREZkZKdUJL?=
 =?utf-8?B?eUFxY0tHQjRrZGZ6cWFmcGxXOElzV21xMkxJSmNSN0NyVXRCUGpvd2l6bElv?=
 =?utf-8?B?eFh5OTZzMmtpN2hOd2orS201a2hhK0hJcTBpY051Zm84UGhnWnplc0x0Nk9q?=
 =?utf-8?B?d3NsWjFRdzgxNUNVbmtNcE1PSkxSblVSRXY0MkErWVZLdnJmTm5GbGFYUEpF?=
 =?utf-8?B?MnJ0OXZDSDUwQUpkRzVKRkpTTWlzUDFBcVY0emllL0FKUGN2U1VvSTR3RW9S?=
 =?utf-8?B?MGVySGVPV2pQMTM3UHI5M2lneC9PK0k4Q041aHBhWTlqak1WSjRBYWRLQno1?=
 =?utf-8?B?WU5LQkw1UFpjeW9laTBCV1lucVBXUVh3b0NRd1hIMnVxYTZMSWVEM2ZPK29z?=
 =?utf-8?B?WFNyVjBuLzdjQTBpS1IxaXFRY2NRM1ZjSElOK1FkaDBIbUlwZ0FtMUNqZDlE?=
 =?utf-8?B?Y253Y3ZMbTg4cVFKeTZ1cVlTZzB0UVRoM011OE1OWU5FWlJORlMzWUJMNFpR?=
 =?utf-8?B?UmhPTFE4R3haT1Y3T0xhaTN6RFNxVDk5ZXdhTHFRaUdoeW5ILzlSVUVRMDNz?=
 =?utf-8?B?YnJ4WHY2ZTU5YjBFQmZQazNhWjBoZHFIV1pWOW4wSlpRZVJXS2FUNmxBRWdF?=
 =?utf-8?B?WTY5SXkrTzFFVGxyd0pZZUxqOUVkcVVvSWtuWisyVzE5NWtkNnJlOElRdmFi?=
 =?utf-8?B?djlXTTh1bStrNGl3aXU4UXdMNkxrNmtZV0NJQ2tJamVXZ3hwTHU5RnNiVmJF?=
 =?utf-8?Q?+RkeaiDIrACe+iShyjzOSxrHw2VELnBdZ5t60st5Wm0Rl?=
X-MS-Exchange-AntiSpam-MessageData-1: y4rNkTU2xTSzLQ==
X-OriginatorOrg: silabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 984b01de-7084-4d20-2095-08de42518d7d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8205.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2025 18:31:56.8179
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 54dbd822-5231-4b20-944d-6f4abcd541fb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MD5dF8rjH/rmABq8jjbwD+touvP3KU1vygToZS1zBZ/HXTwmy+L39Jih03UwCDsOMuQcszimm27bS8PiQQIiUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6924
X-Authority-Analysis: v=2.4 cv=SsmdKfO0 c=1 sm=1 tr=0 ts=694ae01e cx=c_pps
 a=5Kc8oJJEAov4kh6pc/+VPg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=M51BFTxLslgA:10
 a=i1IsUcr2s-wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=2AEO0YjSAAAA:8
 a=3DkLzSUBmtm8-xRApzMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: ln13e6apxoQvSmIVRYITyzKZhHwYPXG5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDE1NCBTYWx0ZWRfX/gWD8EXQDuym
 oiynM2dZT/VIaRjCi2/WCl2QeWcRyhU8svZfWRsQB+vgQvq9CaMjmWG8+/xecDk0YWPG4WLkw3+
 sDp4utZ6S480MwDfs42WUrVyUDjqUJe0iAT47n0yXBqh6maBwn2WU1Da6Weoyoa+80u1AigQCEx
 fKudTQkNm6EzJb1cET8xlS13SBgbnkzzx8b17XwuFlvUiZsjMjvFNczNl/y0PfYbsfzDKVcsLh7
 qNijS3ifZjtEAS0DBwg+Nd9jx57742JUuyHqBuM0jLnHg/zg0Mh9cm5UGS5+ZBYaZdGA1VcIQoZ
 wXmhVMw5jghEKG/DkO2w0g0nkOQ5conXciFkNpG2zVmBZRa/SI4XLGqJDKq3G8zm/G/N5FVXC+O
 hLhm5OBaNKbud0dY43LkQly9+cDM14Po4+m+I8TelBBZea+nYAZze/oUijNrCNClVkxIA46EaGM
 p9WzLDeWdyd/5RXo83A==
X-Proofpoint-GUID: ln13e6apxoQvSmIVRYITyzKZhHwYPXG5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_04,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230154
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.00 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[silabs.com,reject];
	R_DKIM_ALLOW(-0.20)[silabs.com:s=pps12202023,silabs.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:148.163.149.154];
	MIME_GOOD(-0.10)[text/plain];
	ASN(0.00)[asn:26211, ipnet:148.163.148.0/22, country:US];
	RCPT_COUNT_SEVEN(0.00)[7];
	MIME_TRACE(0.00)[0:+];
	BLOCKLISTDE_FAIL(0.00)[148.163.149.154:server fail];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_THREE(0.00)[4];
	URIBL_BLOCKED(0.00)[silabs.com:mid,silabs.com:email,silabs.com:dkim,silabs.com:from_smtp,silabs.com:from_mime];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DNSWL_BLOCKED(0.00)[52.101.46.84:received,2603:10b6:8:162::17:received,148.163.149.154:from];
	DKIM_TRACE(0.00)[silabs.com:+]
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 47B534013C
X-Spamd-Bar: ----
Message-ID-Hash: E4PN6LO566SK45O3YN7UPPQLHEQQM5RC
X-Message-ID-Hash: E4PN6LO566SK45O3YN7UPPQLHEQQM5RC
X-MailFrom: Damien.Riegel@silabs.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, linux-devel@silabs.com, =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH 5/8] greybus: add function create module in P2P mode
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/E4PN6LO566SK45O3YN7UPPQLHEQQM5RC/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

QWRkIGEgbmV3IGZ1bmN0aW9uIHRvIGEgY3JlYXRlIGEgbW9kdWxlIGluIHBvaW50LXRvLXBvaW50
IG1vZGUuICBUaGUNCm51bWJlciBvZiBpbnRlcmZhY2VzIGlzIG5vcm1hbGx5IHJlcG9ydGVkIGJ5
IHRoZSBTVkMgaW4gYSAiTW9kdWxlDQpJbnNlcnRlZCIuDQoNCkFzIHRoZXJlJ3Mgbm8gU1ZDIGlu
IHBvaW50LXRvLXBvaW50IG1vZGUsIHRoaXMgZnVuY3Rpb24gaGFyZGNvZGVzIHRoZQ0KbnVtYmVy
IG9mIGludGVyZmFjZSB0byAxLiBUaGUgImVqZWN0IiBhdHRyaWJ1dGUgaXMgYWxzbyBoaWRkZW4s
IGFzDQoiTW9kdWxlIEVqZWN0IiBpcyBhbiBvcGVyYXRpb24gaXNzdWVkIGJ5IHRoZSBBUCB0byB0
aGUgU1ZDIHRvIGVqZWN0DQptb2R1bGUgd2l0aCB0aGUgZ2l2ZW4gcHJpbWFyeSBpbnRlcmZhY2Ug
YW5kIGRvZXNuJ3QgbWFrZSBzZW5zZSBpZiBTVkMgaXMNCmFic2VudC4NCg0KU2lnbmVkLW9mZi1i
eTogRGFtaWVuIFJpw6lnZWwgPGRhbWllbi5yaWVnZWxAc2lsYWJzLmNvbT4NCi0tLQ0KIGRyaXZl
cnMvZ3JleWJ1cy9tb2R1bGUuYyAgICAgICB8IDMwICsrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKw0KIGluY2x1ZGUvbGludXgvZ3JleWJ1cy9tb2R1bGUuaCB8ICAxICsNCiAyIGZpbGVzIGNo
YW5nZWQsIDMxIGluc2VydGlvbnMoKykNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3JleWJ1cy9t
b2R1bGUuYyBiL2RyaXZlcnMvZ3JleWJ1cy9tb2R1bGUuYw0KaW5kZXggMzM0YWVmYjQ2YjUuLmU2
MjhkYzgxYjlhIDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncmV5YnVzL21vZHVsZS5jDQorKysgYi9k
cml2ZXJzL2dyZXlidXMvbW9kdWxlLmMNCkBAIC03Miw2ICs3MiwxMyBAQCBzdGF0aWMgc3RydWN0
IGF0dHJpYnV0ZSAqbW9kdWxlX2F0dHJzW10gPSB7DQogfTsNCiBBVFRSSUJVVEVfR1JPVVBTKG1v
ZHVsZSk7DQogDQorc3RhdGljIHN0cnVjdCBhdHRyaWJ1dGUgKm1vZHVsZV9wMnBfYXR0cnNbXSA9
IHsNCisJJmRldl9hdHRyX21vZHVsZV9pZC5hdHRyLA0KKwkmZGV2X2F0dHJfbnVtX2ludGVyZmFj
ZXMuYXR0ciwNCisJTlVMTCwNCit9Ow0KK0FUVFJJQlVURV9HUk9VUFMobW9kdWxlX3AycCk7DQor
DQogc3RhdGljIHZvaWQgZ2JfbW9kdWxlX3JlbGVhc2Uoc3RydWN0IGRldmljZSAqZGV2KQ0KIHsN
CiAJc3RydWN0IGdiX21vZHVsZSAqbW9kdWxlID0gdG9fZ2JfbW9kdWxlKGRldik7DQpAQCAtMTE1
LDYgKzEyMiwyOSBAQCBzdGF0aWMgc3RydWN0IGdiX21vZHVsZSAqX19nYl9tb2R1bGVfY3JlYXRl
KHN0cnVjdCBnYl9ob3N0X2RldmljZSAqaGQsDQogCXJldHVybiBtb2R1bGU7DQogfQ0KIA0KK3N0
cnVjdCBnYl9tb2R1bGUgKmdiX21vZHVsZV9jcmVhdGVfcDJwKHN0cnVjdCBnYl9ob3N0X2Rldmlj
ZSAqaGQpDQorew0KKwlzdHJ1Y3QgZ2JfbW9kdWxlICptb2R1bGUgPSBfX2diX21vZHVsZV9jcmVh
dGUoaGQsIG1vZHVsZV9wMnBfZ3JvdXBzLCAwLCAxKTsNCisJc3RydWN0IGdiX2ludGVyZmFjZSAq
aW50ZjsNCisNCisJaWYgKCFtb2R1bGUpDQorCQlyZXR1cm4gTlVMTDsNCisNCisJaW50ZiA9IGdi
X2ludGVyZmFjZV9jcmVhdGUobW9kdWxlLCAwLCB0cnVlKTsNCisJaWYgKCFpbnRmKSB7DQorCQlk
ZXZfZXJyKCZtb2R1bGUtPmRldiwgImZhaWxlZCB0byBjcmVhdGUgUDJQIGludGVyZmFjZVxuIik7
DQorCQlwdXRfZGV2aWNlKCZtb2R1bGUtPmRldik7DQorDQorCQltb2R1bGUgPSBOVUxMOw0KKwkJ
Z290byBleGl0Ow0KKwl9DQorDQorCW1vZHVsZS0+aW50ZXJmYWNlc1swXSA9IGludGY7DQorDQor
ZXhpdDoNCisJcmV0dXJuIG1vZHVsZTsNCit9DQorDQogc3RydWN0IGdiX21vZHVsZSAqZ2JfbW9k
dWxlX2NyZWF0ZShzdHJ1Y3QgZ2JfaG9zdF9kZXZpY2UgKmhkLCB1OCBtb2R1bGVfaWQsDQogCQkJ
CSAgIHNpemVfdCBudW1faW50ZXJmYWNlcykNCiB7DQpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51
eC9ncmV5YnVzL21vZHVsZS5oIGIvaW5jbHVkZS9saW51eC9ncmV5YnVzL21vZHVsZS5oDQppbmRl
eCAzZWZlMjEzM2FjZi4uOGZlYzIxZDZhYmYgMTAwNjQ0DQotLS0gYS9pbmNsdWRlL2xpbnV4L2dy
ZXlidXMvbW9kdWxlLmgNCisrKyBiL2luY2x1ZGUvbGludXgvZ3JleWJ1cy9tb2R1bGUuaA0KQEAg
LTI3LDYgKzI3LDcgQEAgc3RydWN0IGdiX21vZHVsZSB7DQogfTsNCiAjZGVmaW5lIHRvX2diX21v
ZHVsZShkKSBjb250YWluZXJfb2YoZCwgc3RydWN0IGdiX21vZHVsZSwgZGV2KQ0KIA0KK3N0cnVj
dCBnYl9tb2R1bGUgKmdiX21vZHVsZV9jcmVhdGVfcDJwKHN0cnVjdCBnYl9ob3N0X2RldmljZSAq
aGQpOw0KIHN0cnVjdCBnYl9tb2R1bGUgKmdiX21vZHVsZV9jcmVhdGUoc3RydWN0IGdiX2hvc3Rf
ZGV2aWNlICpoZCwgdTggbW9kdWxlX2lkLA0KIAkJCQkgICBzaXplX3QgbnVtX2ludGVyZmFjZXMp
Ow0KIGludCBnYl9tb2R1bGVfYWRkKHN0cnVjdCBnYl9tb2R1bGUgKm1vZHVsZSk7DQotLSANCjIu
NDkuMA0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpn
cmV5YnVzLWRldiBtYWlsaW5nIGxpc3QgLS0gZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpU
byB1bnN1YnNjcmliZSBzZW5kIGFuIGVtYWlsIHRvIGdyZXlidXMtZGV2LWxlYXZlQGxpc3RzLmxp
bmFyby5vcmcK
