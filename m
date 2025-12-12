Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id D5C77CB93D4
	for <lists+greybus-dev@lfdr.de>; Fri, 12 Dec 2025 17:14:07 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 037E13F9BC
	for <lists+greybus-dev@lfdr.de>; Fri, 12 Dec 2025 16:14:07 +0000 (UTC)
Received: from mx0b-0024c301.pphosted.com (mx0b-0024c301.pphosted.com [148.163.153.153])
	by lists.linaro.org (Postfix) with ESMTPS id D8A8D3F99A
	for <greybus-dev@lists.linaro.org>; Fri, 12 Dec 2025 16:13:36 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=silabs.com header.s=pps12202023 header.b=XT9jxD28;
	dkim=pass header.d=silabs.com header.s=selector1 header.b="J3MDt/z/";
	spf=pass (lists.linaro.org: domain of Damien.Riegel@silabs.com designates 148.163.153.153 as permitted sender) smtp.mailfrom=Damien.Riegel@silabs.com;
	dmarc=pass (policy=reject) header.from=silabs.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from pps.filterd (m0101742.ppops.net [127.0.0.1])
	by mx0a-0024c301.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BC2uEi92563949;
	Fri, 12 Dec 2025 10:13:27 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps12202023;
	 bh=O20lJMFaHSFD+y67wMF6FBvgVaPOFijc7kbOs72PUYY=; b=XT9jxD28kf30
	5zd9Zk9LCTbDDyIcWfi/ukYMC57RV3pht2CbHoWq/tdDQK5M4I1cNWeH/MwVcQsh
	zfRQtBxinziCgrX86E8mYQ6XfDO2LW3xq/7THxHJOmrQpG/XxtE3Cwk/MtMNHBET
	2dCfqrZ2aoPuIiXCHiYzxLU5T8Y2dUbr8tDU0g/EclkKMjrDpxlOzWRhEGnhmSkP
	C/4r6ctY2nw4Bhf5vWW7ePtxi90iheM5nU86M/8cwPsoVtwSLMN6n34wRZSq0Ws4
	08FWdQmtA8JihOCveGyBFxyxbCOYV7r7daGI9RvH1iIF3jCFzitVEer9ltRsEaBp
	yAdOXKmiaw==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11022100.outbound.protection.outlook.com [52.101.43.100])
	by mx0a-0024c301.pphosted.com (PPS) with ESMTPS id 4aykqe47hk-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 12 Dec 2025 10:13:27 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F7/Nzr4yo+ZTQXZAd+nKpQiY/R1Q3tj7jELbCogCcS2RHxoB4kgG/RJC5gh+4xUFABZCY6LNPfeS5bsXGZGapXqS1OZIly0xLcDTMIA1aIVfaSD9G5I3DhkTUB6RlV+4GrrvQZw937+rP3eNFYfxz1+LJKCp44Q66E6JAX+El/JTRBh8e8ynBOVJ7c+gB9aeTLH8WL75zBR1FjLypSzPEB3WtaeHZywQK0hh/1khdFVkTxaXUnV4L/HGlZ+abKYTZVEtnJhfflP4yCyD5Eq64H9gkO0ti07zS1tOHtPT7dItPku/rRSzeI+EoNCsHLaYwk15vtX31YP10f5Z81jzkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O20lJMFaHSFD+y67wMF6FBvgVaPOFijc7kbOs72PUYY=;
 b=xpT4pfFsEx7H3XCumhhSN45rsxFVcU3agfbmGYP5kaltW9cT+V7jYfZtTAw6da1muau9D2FV95bMa4m6GxfVVl2czaC7Fi2nnpK6eLGt/8P35KNeVTryzCxxD6aCyLJQlKA+oSXUhOEeizzm1u5d07nEUzNd9LDR2tZZ25VuMx4tewuP9/yURM+3a+7aT5SviUx9uCq1zdBYedxFILGGoh+QyZp6jv587odj/XErpH9B3QreSljCcJXbjhniw5Lxd2joSXqVAwLsZ5+edLs9sRoxQuiHyD/mXHjulxXXm6WGnDAU2rvqdEMZCe1WMFGBn5x5amMl5GYe3poBPGVHXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silabs.com; dmarc=pass action=none header.from=silabs.com;
 dkim=pass header.d=silabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O20lJMFaHSFD+y67wMF6FBvgVaPOFijc7kbOs72PUYY=;
 b=J3MDt/z/OD0/B/uMKB/LCnTW8QsHfNJTwdJIz0cRnVkVkwWCj1x2AzgwToEPb+j9MykWa0alC677mpc8UdvUMSeTvakICzZb1jcw2bBfjTo+R2R4KfoYCFKewX98QFWhKZnoas29o4+Y01V2qGCoVgGBCXY5Th7WcBmAWKHxFfc=
Received: from DS0PR11MB8205.namprd11.prod.outlook.com (2603:10b6:8:162::17)
 by DM3PPF7468F7991.namprd11.prod.outlook.com (2603:10b6:f:fc00::f2d) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.9; Fri, 12 Dec
 2025 16:13:25 +0000
Received: from DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::2de6:bc88:2af7:3583]) by DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::2de6:bc88:2af7:3583%3]) with mapi id 15.20.9412.005; Fri, 12 Dec 2025
 16:13:25 +0000
From: =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
To: greybus-dev@lists.linaro.org
Date: Fri, 12 Dec 2025 11:12:59 -0500
Message-ID: <20251212161308.25678-6-damien.riegel@silabs.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251212161308.25678-1-damien.riegel@silabs.com>
References: <20251212161308.25678-1-damien.riegel@silabs.com>
X-ClientProxiedBy: YQZPR01CA0176.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:8b::25) To DS0PR11MB8205.namprd11.prod.outlook.com
 (2603:10b6:8:162::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8205:EE_|DM3PPF7468F7991:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f84a1a0-4907-46ae-7d0a-08de399960d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?VFg3cFUxcHBqV3pwdzVyNWsxUlh4VVE4MjY2cUtCTGs1VXlwWTR3eDh4aWdK?=
 =?utf-8?B?TUFTR29GYVpod1B4UGFlYmZOei9zdE5IQmZpYTdBaEVMZVV4b0ZnaFhTczhv?=
 =?utf-8?B?bkx2Vm13UjJiRm5pYzc2MjV3V0ZDSEIwUHZKUGJib1VyV0FXcHoxT1pZZ1pO?=
 =?utf-8?B?Rm05YUtNOXlXWnVPTjZ6WmhMNWV6WE45ditYVGZXSllHSzRiUVljVXlrY0hi?=
 =?utf-8?B?UHR4TkZheVJlTjFaanVVVEFWWEpFUGpyakJhamFjZ096V1RsQ1ZqTjliaWdQ?=
 =?utf-8?B?OW54a1h6OTRDUGZaOEJVSndzMUMvVUpCUjQ5WHJFTlVvMzNlT0RvcUJzbFZ4?=
 =?utf-8?B?OU80b2pOLzB6MWt2SE9neUc1R3dGQlFMNE9hM1cxMUtIcTVwUVBxZ3oweGZs?=
 =?utf-8?B?ek5WeksyMHZxVWs5MXhzUkVKcUg1NEh2Ty8xMlJRWFVyY2Q2aEFiV3ZLRjJq?=
 =?utf-8?B?OUN0d2Z0bDRIcUtQMlJhYUw1VzEwUGZJUERjaFFRVGFLVWUyemk4YnM0Y0N1?=
 =?utf-8?B?RGZRSVhCNEpmbGdZVy83VW9QSkNGVkJZQnJHU0ZHOWRUalcrMnluN3p6aVNa?=
 =?utf-8?B?c3RHSHBmZDNvREdwMVZUcUVvK0NYaFpDYmU3SWRhQ2ozYXlTdzI0ZitJVWk5?=
 =?utf-8?B?eDdWK0w0UXJJYzI1SDlTUTBIdFEwRk10anVpRnNsZjBrUHFBTG53THdra0Rp?=
 =?utf-8?B?MXBJTVJaWS90Q0pOaVBwUWpReWkybE1MSVdwQU1uMm5HcXhqZG1GVnV0UjVX?=
 =?utf-8?B?ZHpBdXV0dk1DZG9KUnFpVEpBRitYNWluZUpPcTJ0K3NKK2JtcHptZ25sbm4z?=
 =?utf-8?B?TEx3OXlMd25SaURHNEl0UXQ4bnhkVE9Kald2bFlsMjFkN3VtUWVOb01yV0ZM?=
 =?utf-8?B?dmdGM1luMWJObmxLeWxmVUROS3hLZ1RsSmM5ZjJFcy8vZTVvdms4Mkt3aDhp?=
 =?utf-8?B?Z2FObjZKYmZ1WmFBTUlRdFNxRW5JQ2JmSXc5bVRFVHh2M0hNcG9La2h3am1x?=
 =?utf-8?B?ODhzUHB1cmZpWDlNVGZldU56endhSVVaTlY1ZWFlN0xkN0h0UDZCV1FxdUxM?=
 =?utf-8?B?NmI3c0xqdy9PU0hnMXdMRmVJNmxsTXR2cjRtalVZbURUcS9QRmNqL2x0R0hs?=
 =?utf-8?B?ZkxaVHR4VUc5T0VQdTJZZDdqZUd6NWNSMnlGbU1jRWwyanFoQ0J6d3Z0bW54?=
 =?utf-8?B?MlIveEJZNnEwOGJNRTJHdTV0UWlJUzl3L2VwL2pwQXVJOFZDOTJ5dVlqUDc1?=
 =?utf-8?B?ZllnekhISmdwQjBFa28wYkdEeTMxbVc1UlZvaTJub29aeWlOeWNMWERjUFVr?=
 =?utf-8?B?WmlFTUV4aDB4QjEvTlo3WEFHeGVqR09hL1ppRlpQK0NpMVhUSkFpSUpMUjg5?=
 =?utf-8?B?L29yS0JRNFQ0bmR2ZElKU2RuQzNpYlpwTytqdHlSeC9RSUlGSHpNSHlyYUN5?=
 =?utf-8?B?RlBiZkJNT1NhTzhZaXpwQWlvaWFjWUVpSVFUVnRoTkUvSjRTOXF6dC8xdWJD?=
 =?utf-8?B?b3JianFYSnpqOHE1MzdnckRrdW5jMU9LZ2MxdWc0RWp6ZTIxTklsamVSbUZG?=
 =?utf-8?B?SkFKZXdCQU01Ym5yQ2pqeU9sWi9LdXNUcHpwMm5vVHlJeTZyOGhIVFRxVGVV?=
 =?utf-8?B?cUcvS0FldzJwVTlVN21VZ0d5TGwyZDFOOGp5V09zcmo1SFlnd092TGRVcTVG?=
 =?utf-8?B?MEw3cmpFSVNiNWtkSG9EeThJWlFPRjlvNmZZWlNvR09mYzZvY3dDdzNoZmJz?=
 =?utf-8?B?WjFEWVNSR2xPclN6alNCVXV6NGJTS3RHYXV3WnhESkY2NERSZWl0MHFuTVZo?=
 =?utf-8?B?bm9IYU9ZN1psakxBckI0ZjhiR0pmSHlISGNWdEdWZnZiNDd4TlNxNnpUL3JZ?=
 =?utf-8?B?MDlEVHo2cHprUEFvek5MSUM0R1BXOGh2eVR0Mnl4bjdPdlZvOXRYampNcGN1?=
 =?utf-8?B?SWllY2t4bTU0amhsRTVMcmlzdnFoR2k4ZjUyRWU3V0xyOTNsbittSmFweUVH?=
 =?utf-8?B?V013UmdWd2xDc0d4Wm5TOGVkaHpSQkZaSk5jc3FaOEZ0a3pyWGtUb3hYd0p2?=
 =?utf-8?Q?X4bJOX?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8205.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TGE4eVBFZk5oMG9pb3d5QW9LV3R0UlZ0dlZrZnFDYWRseUdhajNNejBKckJz?=
 =?utf-8?B?SytGbnJCekNJTWYzWWRaaWx6cjhXRGpTemY0OTVMNDdlSGo3anpXWnVVUG8z?=
 =?utf-8?B?N0MrZG9WNndvdVBPVlprcXM1MmY2Nm9ubUZucDZPMmorQ2pxbEZTRkhOQjg2?=
 =?utf-8?B?emtPUGtwUU9PYUNpSk9sQlhma3JXL2FjMWtwRTNNOXlzOG9CRkhBamQ5QkZO?=
 =?utf-8?B?eis5cnh1SnZVYVdwWTVZRFVybHBtcElSZENzSHMrQnUxTU9WUWZBRWxKekZr?=
 =?utf-8?B?YlFxdUtaczNzWlJSWEpLcUtJR1BkZWxwUlJTWk9iN3lMakk2bXpBQkw3ZUJP?=
 =?utf-8?B?RjZ1M3lQOUtjRG1Ock1EVlUzUGlxN0FwNnFDYmpEN2l5VGVzN0k5S2RLU0Jo?=
 =?utf-8?B?UWNoRW9wMVU5azRvZThDQUJkNllja2ZQNjVaNEx2dk9oakc1OHlWanUwZ2xn?=
 =?utf-8?B?S3RkT0pqOStlRHhEUnZvY0RZSlF3VTkwMFNra3pTMTZjNWxja3Y2V2J2d0Qx?=
 =?utf-8?B?OStSNktMVy9paUlMQXFRTGMvRmk5dWF1TjhnQ1VFSWdXbm5ibU9IMW1raWxT?=
 =?utf-8?B?YTRQZE52bU1TY1NDQ3RmcUxUMUJsRnFFV2RySVVaa3JYdElLVjN5cWtLZHNm?=
 =?utf-8?B?QTViWVR2RERTb3Q4NVovMjdESUVtNVBKa25NcXZKVlUwTXROK3NZTnkrekpq?=
 =?utf-8?B?eThLbm9SdktKcG9hVFhjL3ByM1doaTk4enZjM1U2TXgvZmxpZU9tQ2IyQWZo?=
 =?utf-8?B?Y2JpQWVFR2dHdTI5QU5WVjZ0ZGdHbUNKN0FTRWRzZW5rT1k0V3ZrS0ZOeGVl?=
 =?utf-8?B?LzNiUkg4YnZtc1RyR3MyOXRHbEhzRHdDb1ZoaHQ1YWV4VitaeDZ2bGhhYy9C?=
 =?utf-8?B?TUZYMTlxOUdya0RvQUZuRFl0QS94c0dqUXN5b0MwSVRxMGZTRVdrZksyV01U?=
 =?utf-8?B?WXBDMG9ibmZwRENkNmhCRngwYVlJZ2pPYTFUQi9SWWR2UEZtbzBxZklQZW51?=
 =?utf-8?B?N2VTMTZmTkM0dnQ1dWpqblVBdUxaRHFIY0tKQkkyRnJsUEcwQjV2SzhKQ0pl?=
 =?utf-8?B?aXBTS0tRL2prZm1SMTgyUlZVZHY4bFBqR2FBVXRDZzNVQmxxYlJFTW1iTUpv?=
 =?utf-8?B?aTJkWDJzTy96cTNFMFJGRG9NTno4U1YwUkp5aUNDTFZTVlN5L0dnTWxXMnFv?=
 =?utf-8?B?anRFYmc3YXRnbEV2K2szWnZjb2pWY04wdHZtMFlueW1GUVoyL1hUWmQ1MGZo?=
 =?utf-8?B?d09la0ZuQzlKOGNIMHIwQnU1SnJMekNYOENUSHlaVjE2dklCQ250RzlkOVcw?=
 =?utf-8?B?dzJXTUdYKzhOaFMrdEhtdjNsZXBUbVVLTFM0QW1PaVNDc3VGTTI2N282WGNi?=
 =?utf-8?B?LzE2eER5S0R5LzF6ZVpMME9HK2lpTFBza21sM2RSN1M5dG1xRlN3OWZVUVV5?=
 =?utf-8?B?eVBhOWhXUDM3Z3pjUlRDNGVFcjRGR3FsVmR2SllweWwreHdHVEMwUnZZWVRt?=
 =?utf-8?B?YWRJV0dpZTJiT25pN3VYOHdTbGttMEpBSXVRSWlaakxmclFXUnNRdkhGUmtO?=
 =?utf-8?B?Ylc0S0RpYzFlSVBvYk9GNnE1OEZJSy9JdmVkMTJJQSsra2N0Nk94ZjM2MVFa?=
 =?utf-8?B?RDM5MHhXRXFsUE9MR1BuNzVWVGhPRk9Pd3RUdVU5a3NoZURmT2R3RndHSHIz?=
 =?utf-8?B?RWxCQjFVaHR1NGdPdTNYejJ6d3R0TEtCcHBoNkJkT2dUbUtDUnF2ZVhrWWQ4?=
 =?utf-8?B?bEVpZTJOZ3hHZTdIRlRFV1pSRitGdlNHQXZPK2ZNbURaMko1MlMyRVlFNnp4?=
 =?utf-8?B?cENjMDVqRnJpREtRYk5WK24yZWNmUzJ0Y0pFR0IyOTFJWm02V1hVUjBxZFha?=
 =?utf-8?B?cGdnUnRxMVRaclplbW15UXM4V0lpQ0UvQjdUQjdCSFpyZTlpNGhYQ0JLMVcx?=
 =?utf-8?B?ZTVqd1JmRm4vMGNDUmZaeFJkc2VjTzYyd3FDQjdCUVlpZzAxVW1weW8yc0Iy?=
 =?utf-8?B?OVcrc2NYcWZnWGZzUHBlZ0lkS1BRc3FVQVZMZlY1RHhEOFpTQmJ4MldzVGNm?=
 =?utf-8?B?c01vZDdtL1Q4MFJSTjlRYm82R0d3dnpNVnJSMWtsQVhTZ2hvcDJnMUNDelhH?=
 =?utf-8?Q?IU8M2Y3m12LoPXg5UaPijAqlR?=
X-OriginatorOrg: silabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f84a1a0-4907-46ae-7d0a-08de399960d0
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8205.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 16:13:25.2188
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 54dbd822-5231-4b20-944d-6f4abcd541fb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yb75dqP8n06uDToSwIBz/hi6s0P7ANiSfFfLXdZSBJ+WjtIpHw2lryGAxDiounFBNHzFDBhyu3ZFjdPX5hHSXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF7468F7991
X-Proofpoint-ORIG-GUID: Wwu1M0cVBgf5s96t9XMmRti3tJqMXA4Y
X-Authority-Analysis: v=2.4 cv=brxBxUai c=1 sm=1 tr=0 ts=693c3f27 cx=c_pps
 a=Us7513DS1gT4knu3Fiol7g==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=M51BFTxLslgA:10
 a=i1IsUcr2s-wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=2AEO0YjSAAAA:8
 a=9SkM2ZN-1AJx8s29AtcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEyMDEyOCBTYWx0ZWRfX3Hg/eWrv9Uiq
 pP8JLtef1M/vtPWrfzbmSl5Qyzvkb4wE2/+qgbhYZAHw5rfd4M83UxYAthIleWTI6G415eoTXQL
 LoR/gfWvNV+UBIpkKKxneDTmm292BrsLkGx3uQNtPD3WaCP6Fi9+tP29Z1UAWBt7VqzAEkJ6Pxr
 7S3L+smt73bhmkM8hEnOnppITSlfrgv4U0mBe4LTuPv7Dp0Rh55kTB+m0tTuKLEAu1SPndQRAIJ
 AhmDu/0clFgVQ3yBWsxEiIQQd+T0I/FMn3oaCcFQpBcO5wBOQ+W2Xh1UKjobge9Yh7Crx6ExB0b
 LTsHVEedgvsFWa+eQO9cCcvmWiOZaj/hYMaCyel4RGDjzVWdRBSbGq/3NtA/NVynpM8N94sTPG1
 Rdvn0gfnEV+HL/OHRbg0BDGi+xa6vg==
X-Proofpoint-GUID: Wwu1M0cVBgf5s96t9XMmRti3tJqMXA4Y
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
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[silabs.com,reject];
	R_DKIM_ALLOW(-0.20)[silabs.com:s=pps12202023,silabs.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:148.163.153.153];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_IN_DNSWL_LOW(-0.10)[148.163.153.153:from];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:22843, ipnet:148.163.152.0/22, country:US];
	MIME_TRACE(0.00)[0:+];
	BLOCKLISTDE_FAIL(0.00)[148.163.153.153:server fail,52.101.43.100:server fail,2603:10b6:8:162::17:server fail];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DNSWL_BLOCKED(0.00)[52.101.43.100:received,2603:10b6:8:162::17:received];
	DKIM_TRACE(0.00)[silabs.com:+]
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: D8A8D3F99A
X-Spamd-Bar: ----
Message-ID-Hash: TZE2I3266HMDGGMO6QMENTOIPPYJS25J
X-Message-ID-Hash: TZE2I3266HMDGGMO6QMENTOIPPYJS25J
X-MailFrom: Damien.Riegel@silabs.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, Silicon Labs Kernel Team <linux-devel@silabs.com>, =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH 05/14] greybus: cpc: switch RX path to socket buffers
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/TZE2I3266HMDGGMO6QMENTOIPPYJS25J/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

Rm9yIHN5bW1ldHJ5LCBhbHNvIGNvbnZlcnQgdGhlIFJYIHBhdGggdG8gdXNlIHNvY2tldCBidWZm
ZXJzIGluc3RlYWQgb2YNCnU4KiBidWZmZXJzLiBUaGUgbWFpbiBkaWZmZXJlbmNlIGlzIHRoYXQg
Q1BDIGhvc3QgZGV2aWNlIGRyaXZlcnMgd2VyZQ0KcmVzcG9uc2libGUgZm9yIGFsbG9jYXRpbmcg
YW5kIGZyZWVpbmcgdGhlIGJ1ZmZlcnMuIE5vdyB0aGV5IGFyZSBvbmx5DQpyZXNwb25zaWJsZSBm
b3IgYWxsb2NhdGluZyB0aGUgc2tiIGFuZCBwYXNzIGl0IHRvIHRoZSB1cHBlciBsYXllciwgdGhl
DQpDUEMgImNvcmUiIG1vZHVsZSB3aWxsIHRha2Ugb2YgcmVsZWFzaW5nIGl0IHdoZW4gaXQncyBk
b25lIHdpdGggaXQuDQoNClNpZ25lZC1vZmYtYnk6IERhbWllbiBSacOpZ2VsIDxkYW1pZW4ucmll
Z2VsQHNpbGFicy5jb20+DQotLS0NCiBkcml2ZXJzL2dyZXlidXMvY3BjL2hvc3QuYyB8IDEzICsr
KysrKysrLS0tLS0NCiBkcml2ZXJzL2dyZXlidXMvY3BjL2hvc3QuaCB8ICAyICstDQogMiBmaWxl
cyBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dyZXlidXMvY3BjL2hvc3QuYyBiL2RyaXZlcnMvZ3JleWJ1cy9jcGMvaG9zdC5j
DQppbmRleCBiMDk2YjYzOTE4Mi4uN2ZmYTNiZjQwMjEgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dy
ZXlidXMvY3BjL2hvc3QuYw0KKysrIGIvZHJpdmVycy9ncmV5YnVzL2NwYy9ob3N0LmMNCkBAIC0y
MDMsMjAgKzIwMywyMyBAQCB2b2lkIGNwY19oZF9tZXNzYWdlX3NlbnQoc3RydWN0IHNrX2J1ZmYg
KnNrYiwgaW50IHN0YXR1cykNCiB9DQogRVhQT1JUX1NZTUJPTF9HUEwoY3BjX2hkX21lc3NhZ2Vf
c2VudCk7DQogDQotdm9pZCBjcGNfaGRfcmN2ZChzdHJ1Y3QgY3BjX2hvc3RfZGV2aWNlICpjcGNf
aGQsIHU4ICpkYXRhLCBzaXplX3QgbGVuZ3RoKQ0KK3ZvaWQgY3BjX2hkX3JjdmQoc3RydWN0IGNw
Y19ob3N0X2RldmljZSAqY3BjX2hkLCBzdHJ1Y3Qgc2tfYnVmZiAqc2tiKQ0KIHsNCiAJc3RydWN0
IGdiX29wZXJhdGlvbl9tc2dfaGRyICpnYl9oZHI7DQogCXUxNiBjcG9ydF9pZDsNCiANCiAJLyog
UHJldmVudCBhbiBvdXQtb2YtYm91bmQgYWNjZXNzIGlmIGNhbGxlZCB3aXRoIG5vbi1zZW5zaWNh
bCBwYXJhbWV0ZXJzLiAqLw0KLQlpZiAoIWRhdGEgfHwgbGVuZ3RoIDwgc2l6ZW9mKCpnYl9oZHIp
KQ0KLQkJcmV0dXJuOw0KKwlpZiAoc2tiLT5sZW4gPCBzaXplb2YoKmdiX2hkcikpDQorCQlnb3Rv
IGZyZWVfc2tiOw0KIA0KIAkvKiBSZXRyaWV2ZSBjcG9ydCBJRCB0aGF0IHdhcyBwYWNrZWQgaW4g
R3JleWJ1cyBoZWFkZXIgKi8NCi0JZ2JfaGRyID0gKHN0cnVjdCBnYl9vcGVyYXRpb25fbXNnX2hk
ciAqKWRhdGE7DQorCWdiX2hkciA9IChzdHJ1Y3QgZ2Jfb3BlcmF0aW9uX21zZ19oZHIgKilza2It
PmRhdGE7DQogCWNwb3J0X2lkID0gY3BjX2Nwb3J0X3VucGFjayhnYl9oZHIpOw0KIA0KLQlncmV5
YnVzX2RhdGFfcmN2ZChjcGNfaGQtPmdiX2hkLCBjcG9ydF9pZCwgZGF0YSwgbGVuZ3RoKTsNCisJ
Z3JleWJ1c19kYXRhX3JjdmQoY3BjX2hkLT5nYl9oZCwgY3BvcnRfaWQsIHNrYi0+ZGF0YSwgc2ti
LT5sZW4pOw0KKw0KK2ZyZWVfc2tiOg0KKwlrZnJlZV9za2Ioc2tiKTsNCiB9DQogRVhQT1JUX1NZ
TUJPTF9HUEwoY3BjX2hkX3JjdmQpOw0KIA0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3JleWJ1cy9j
cGMvaG9zdC5oIGIvZHJpdmVycy9ncmV5YnVzL2NwYy9ob3N0LmgNCmluZGV4IDJlNTY4YmFjNDRl
Li5jYzgzNWY1Mjk4YiAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3JleWJ1cy9jcGMvaG9zdC5oDQor
KysgYi9kcml2ZXJzL2dyZXlidXMvY3BjL2hvc3QuaA0KQEAgLTQ1LDcgKzQ1LDcgQEAgc3RydWN0
IGNwY19ob3N0X2RldmljZSAqY3BjX2hkX2NyZWF0ZShzdHJ1Y3QgY3BjX2hkX2RyaXZlciAqZHJp
dmVyLCBzdHJ1Y3QgZGV2aWMNCiBpbnQgY3BjX2hkX2FkZChzdHJ1Y3QgY3BjX2hvc3RfZGV2aWNl
ICpjcGNfaGQpOw0KIHZvaWQgY3BjX2hkX3B1dChzdHJ1Y3QgY3BjX2hvc3RfZGV2aWNlICpjcGNf
aGQpOw0KIHZvaWQgY3BjX2hkX2RlbChzdHJ1Y3QgY3BjX2hvc3RfZGV2aWNlICpjcGNfaGQpOw0K
LXZvaWQgY3BjX2hkX3JjdmQoc3RydWN0IGNwY19ob3N0X2RldmljZSAqY3BjX2hkLCB1OCAqZGF0
YSwgc2l6ZV90IGxlbmd0aCk7DQordm9pZCBjcGNfaGRfcmN2ZChzdHJ1Y3QgY3BjX2hvc3RfZGV2
aWNlICpjcGNfaGQsIHN0cnVjdCBza19idWZmICpza2IpOw0KIHZvaWQgY3BjX2hkX21lc3NhZ2Vf
c2VudChzdHJ1Y3Qgc2tfYnVmZiAqc2tiLCBpbnQgc3RhdHVzKTsNCiANCiBpbnQgY3BjX2hkX3Nl
bmRfc2tiKHN0cnVjdCBjcGNfaG9zdF9kZXZpY2UgKmNwY19oZCwgc3RydWN0IHNrX2J1ZmYgKnNr
Yik7DQotLSANCjIuNDkuMA0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpncmV5YnVzLWRldiBtYWlsaW5nIGxpc3QgLS0gZ3JleWJ1cy1kZXZAbGlzdHMu
bGluYXJvLm9yZwpUbyB1bnN1YnNjcmliZSBzZW5kIGFuIGVtYWlsIHRvIGdyZXlidXMtZGV2LWxl
YXZlQGxpc3RzLmxpbmFyby5vcmcK
