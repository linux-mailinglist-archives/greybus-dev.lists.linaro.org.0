Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 046B5C5DC33
	for <lists+greybus-dev@lfdr.de>; Fri, 14 Nov 2025 16:09:13 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id D3F283F826
	for <lists+greybus-dev@lfdr.de>; Fri, 14 Nov 2025 15:09:11 +0000 (UTC)
Received: from mx0b-0024c301.pphosted.com (mx0b-0024c301.pphosted.com [148.163.153.153])
	by lists.linaro.org (Postfix) with ESMTPS id 05F513F84E
	for <greybus-dev@lists.linaro.org>; Fri, 14 Nov 2025 15:08:50 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=silabs.com header.s=pps12202023 header.b=gTsphyoy;
	dkim=pass header.d=silabs.com header.s=selector1 header.b=EOzFDTRR;
	dmarc=pass (policy=reject) header.from=silabs.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1");
	spf=pass (lists.linaro.org: domain of Damien.Riegel@silabs.com designates 148.163.153.153 as permitted sender) smtp.mailfrom=Damien.Riegel@silabs.com
Received: from pps.filterd (m0101742.ppops.net [127.0.0.1])
	by mx0a-0024c301.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AECv2UN2440874;
	Fri, 14 Nov 2025 09:08:45 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps12202023;
	 bh=XCACTfOMwAu9AB/gCug6ljAeo/VFNyGXt2U0ui2Rlbs=; b=gTsphyoyE3Vv
	/i5rlGtkgBVZTc0yilDbrbae5CFNAEcXcTzmnSAqY1BfEVpnMXOj5bcIKhm9Oarr
	zPZEsFWa/+9tMmLtuaw1OnomDTk51ajrkO608lfwjOctDir9UqI6rpjTBct9gYql
	xsYMa75hpmqvWx71h9i3HWZ3Dfix656vGLe2ls+0/1SituaiMX94AplZSDpu6BP5
	OIy4emItyaomJlPV1Uj8UfeumE2ZtDZImfRvRpVJVqaFgdoZByBbkOPPYcHal38t
	QiWwUEJ9Hnr2v+wJ6bCrHi6OHFMPSh2nbUo5tJGBE7XKIcluPMUqV6eR0I5Jguzx
	y+iKokL3KA==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11021116.outbound.protection.outlook.com [40.93.194.116])
	by mx0a-0024c301.pphosted.com (PPS) with ESMTPS id 4adr8fsm5a-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 14 Nov 2025 09:08:45 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UjnCSAXqVcwUQBgNxsfmr0G2qI5LiwkmAASD1HPv2Vet/AnCm84EcEXh1+JdGSjiXucacwHdU+1Vi+l7IRum8OpN5euI4E5n77ec36VPh4bsyNG0QuHBOn+0nsDBPcBLLv9IRaPof1Qls/VYr6XK/DhpRsjjRsgHz6BavoMbauDxU82ayl99uCQiV6lVd26MQKEJNyi8KvDxdGc1VinFPoO4L1AaxFTvXDHC753U1pL7W0sCeKGADaJslabcrbqzPuaRdHAel/eZrHLvvX605dhPMBnCZD7DZL5vxq5YcKmmU7OaG8XrAtSplcXWBWumMhJyGIxQ0SXmIBHmnVUFBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XCACTfOMwAu9AB/gCug6ljAeo/VFNyGXt2U0ui2Rlbs=;
 b=SznDRPbqcALuK0cqoOvCgMDFsMkTrm1g30mlIDGfvrK3My4IWmpN2GimPbJJsWEtEZ/vWGdHPSMlG5HW34I0W91Ru7W2ur7GyA6Gim2g+fsWDwC+fbq3Y0+3haPnfvb2mIEGkPHOZ4M8dthJDCUCES8c/YLGPovmOUnsUHg9/gGtHB8Evvk9xoa47+SlTC445ofgRpnqZNnX48nR2wnQPnNiVQFkas3PR272QdEJQTH+MHmFn/Jsx5C+oZEROyTkLJYoksQm12zQrqXoeS+u28yyTFyNlzDUOj1qX9we4yxLkoz3nNnKLSCXcvFghTWRCCOb1+uHjTjbQKr7D9Fk5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silabs.com; dmarc=pass action=none header.from=silabs.com;
 dkim=pass header.d=silabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XCACTfOMwAu9AB/gCug6ljAeo/VFNyGXt2U0ui2Rlbs=;
 b=EOzFDTRRGhhfKf8Wb+Hj80HbgJwXe1zIWACXsBy/XUrGKy3PWHpKEIue3AOt7MEtjhD2JVgChb8kqHcFQnLh3V9IDrcmsrBOAbzXlqDQ3V+yTHf2kfVXa1uN2lETa9jKjps3+K2zpMWBXe7sQVV9dd0QTMo3RjpH+nww9YwcEHw=
Received: from DS0PR11MB8205.namprd11.prod.outlook.com (2603:10b6:8:162::17)
 by CH3PR11MB8774.namprd11.prod.outlook.com (2603:10b6:610:1cd::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Fri, 14 Nov
 2025 15:08:43 +0000
Received: from DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::c508:9b04:3351:524a]) by DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::c508:9b04:3351:524a%5]) with mapi id 15.20.9320.018; Fri, 14 Nov 2025
 15:08:43 +0000
From: =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
To: greybus-dev@lists.linaro.org, Johan Hovold <johan@kernel.org>,
        Alex Elder <elder@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org
Date: Fri, 14 Nov 2025 10:07:38 -0500
Message-ID: <20251114150738.32426-13-damien.riegel@silabs.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251114150738.32426-1-damien.riegel@silabs.com>
References: <20251114150738.32426-1-damien.riegel@silabs.com>
X-ClientProxiedBy: MA5P287CA0046.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:175::12) To DS0PR11MB8205.namprd11.prod.outlook.com
 (2603:10b6:8:162::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8205:EE_|CH3PR11MB8774:EE_
X-MS-Office365-Filtering-Correlation-Id: d2d35ce9-2249-40ea-f909-08de238fb33a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?NEN4UHBHN3NydnNublNrMml2cUs3VVhpQXN6OFAzM1MvSHFFeW1HSGpONkV2?=
 =?utf-8?B?Y3ExbHZmR3JtS0VyeGtxKzE5MlBQbm1hNVUxMUhLRDRpT21RWk0zSUgyNVZQ?=
 =?utf-8?B?eTVUakRYZG9sdmc0L25GQzI2SGwwVXl2TXEvemlvamYxSExCRFE1Y0c1ZzRY?=
 =?utf-8?B?OTNyUG5mNVBlNS9hZkJRWGdPQ1kzWE9CV1JteHpSMzJmRU5KS2NqNUJEa1py?=
 =?utf-8?B?Z1U2d2wxWXpmOWdxYmdrc0FHNmFKeXJvQS9waTBNaEtwMW1rSmVkUzBoMFpr?=
 =?utf-8?B?Ti9FNnhlaE9mNDFMTVRrQ1ZDTWRVK0QyczQ4YllneHl2SjlqRTVjUHBRUFNY?=
 =?utf-8?B?TXM4ekZvTzI5VzdyOVlZR0haSHlGQVRjVEt0VFp4bmlFVCtKblM4MExLOVlD?=
 =?utf-8?B?Qm16TkJOQmwrdEJZNkZjeHlNbjFJRFlvMU9HellxVFZHVTJtcmo5dTBsYWE3?=
 =?utf-8?B?aFlmNTJrSFJvcGFjV0E2Y3hXbkVhTXlXbjhSWTljckNQcndJYlU5TldxcjNr?=
 =?utf-8?B?WXhsL3lzSlhwa0R6SzlpVk52Z25TWllIZE1PRitobGpkZXJ5d0hMamo1OHZk?=
 =?utf-8?B?T1g0MzJWdXRMSDI5THJkVGpvNUpwSUJHUGVPeXp1N1UzVjNjUWp0aC9PZ1Ru?=
 =?utf-8?B?QWJtekZic1NKK1QyT0NZck1vYURzTE4xK3dKQnFNcnZlM1FvU3I3bkozdC9P?=
 =?utf-8?B?aWw4VEJma1VIUHZMY2FXa1pEallTR0dVK2h3YWRWSU9rdml6MjFhTkJNRXBT?=
 =?utf-8?B?Rk1YZkFPcFE4WnNpWXB4RStFaGNmUlgvZDd0WDJDdTh2MEpJcUY0Y3Vmc0dO?=
 =?utf-8?B?VDZ3bW5KdnRoTDhUbzNycXQxNW00SkdaT1VzWGdoMWxjTzR3UHZkYnE3NkdM?=
 =?utf-8?B?Z0I0VTlubVBJenRVRkdpQ3FETVpwVHJkcXV3aWxmVHYwakptOXNsRHM5VjND?=
 =?utf-8?B?T2lSdG9sRzFON0hrRWFFSUc3eEpENUJzOXVFemtDVHVpd1JFMktzOW1VSlNQ?=
 =?utf-8?B?WVhnY1ZUangzS1AxSi9aS3RldW9HZ3YvNkw3Z28wTlUrYWxXUW1Ma1RZdmRq?=
 =?utf-8?B?bHRjcExQaGQ0ZEpuQnFKNmFuNFZyUjMyQ3Zza3ZkZmlZdnhzQU1Iclc5bU9M?=
 =?utf-8?B?djRUdXIydXl5djFqMEsvalZYT3AwL0RRNGMvWkwvR0lEYSt0dTRSM05iS0Qw?=
 =?utf-8?B?TmNvTDJVSVV0R3I5U0VpQ05tWjc5YnhaWEhIMWw0aGlUa2VENHA1K2NTb2xa?=
 =?utf-8?B?NHFyYUJIV09OZ0MwcS9hdFczdEY4SDgvL0hGT2gwRjVMSnp5ZkdqY01Ob2hO?=
 =?utf-8?B?WWlwQzhvbnNoRGlvWXBNaTd2K09TSld1QllJSXVFRDdJL0EwaW5ibHN6ajRD?=
 =?utf-8?B?dGtlOExvTHQ4R0w0UWo0Nms2Z1dUUkxqb1EvaXdlTEJOUVQvOWFOUlFqQWZP?=
 =?utf-8?B?WWFtOHpsT081WFZlVWs2NEtTcUxUNC9zOFMyNDhxVTZlUGNuZXlxbnN6WDRS?=
 =?utf-8?B?cUZRU0o5SW4vNk96L0kyb09KQW5QbFVSNHlOUE1jSzB4QnJ1Nm56UWFFSE9X?=
 =?utf-8?B?V0dwaEg4VStrMlNLTjgrL3lmZ1g2RytnbGtOM21RZy9tRHAyRmFFZTFpbnUw?=
 =?utf-8?B?cHV3ZWIxOGFNNFpnVnBEUHRJRzhab2RBYlB6U0VUbjVWUU0wWVV4Mm4rRHZw?=
 =?utf-8?B?ODJFaFZEYjE1TTJCQTQ5eHg5SXdrdDdGd2dkQkVMOEpkMy9BdU45Y1ZUVkp0?=
 =?utf-8?B?czJGd2xtNi9IV29QdHlNdW5CcjNTWEMvaHFweWlOOFliZlN5TlZXemZ0NG5w?=
 =?utf-8?B?czA0NzlUNDVZN1cwZzBvTVpPaTdaU1pSWkpzSlhpdWxWRFpYRzRXRGh4cjli?=
 =?utf-8?B?b201ZzYwMDFFQXlHMHFjN0xQTmVGd0V6aXIrVjI0d2t4MHNsL0JBYUNGN0Ro?=
 =?utf-8?B?SDlkSzkzZ2txZWVZR2FGSFA1dFhsc3lJUFp2Y3N2anBkNGU5MGZvYnk2cnJw?=
 =?utf-8?B?ZUd5MVI3aWRoZS9pUEpldGR2VjZReDlCeUVQK0RWNUNDUW4zcFVlaG5RM1Jj?=
 =?utf-8?Q?1N1qHQ?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8205.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TU5pOEd0TUwxRytVdnpEeXZGdU9idEY5KzFrTzBEZFZyNHlWdm1jQ2d4Y2NU?=
 =?utf-8?B?VzFaTXNDamFNSWxOSUtCVndGRGMyU0ttZlFwRUpkWG1qT2VGOXQwN0lrOHps?=
 =?utf-8?B?UCtvVFdLMTRRZnJOeFhERmdZSEhxK2NqK2RZM09RV1FjY2xtYXozbkkxendE?=
 =?utf-8?B?S2hGd2JaWlZIcjZyREVvZUIwTWdETFVKTDFqeC8vQzNYWXlDSDkzNTh6TWdh?=
 =?utf-8?B?QmhNdW4vZm5NK0lSMVNqTUw0VGhiNFdsejZvWU1RYkhCWFVjYkpsYWV3TXZp?=
 =?utf-8?B?US8wVnRIeGk0YnVvNkxUQWIrQ0VRTzROSlZqQzkwNDFrdkhJeFRpMU9oTkU4?=
 =?utf-8?B?RXBrRk1uUm1ZSEZ4UENiVFQ3MmZYMkx1b1JrVkZQc0JRQkFPSEYvUVVOenpn?=
 =?utf-8?B?Q0NMaUJhZlY0NFdsSDZJZm41UXJLMG5oL013ak51M08xR2ZWTUV3TW11NUhZ?=
 =?utf-8?B?eXFSeklTcDNKWmc0cXVabFFGeWQ1bGFrVTdNSzUvWHFydnBWMWZYaHFLRXpz?=
 =?utf-8?B?REROck9LUGRhNi9ydVNTRG40TFhFN0xTNm8vdXlWcXp2YlRPZ0VzOGkva2Jx?=
 =?utf-8?B?WkVnYnZjRHVpTGdkRDUrVVV4OFRna2NwU0htVnhqRXVrTVZsVkxZK1NyQ05D?=
 =?utf-8?B?eVQvYUdEVDBFdFZyYldqT1g4NFp5MUVSN2ZFaHgzMzR3bjA3TnZTdjZMUldN?=
 =?utf-8?B?d1ZzbHFqTTEzdkZMV1RHUjZuT2FaT2RjR1JQMWFmcEg3Vi9yaEdwSlJrb3Rm?=
 =?utf-8?B?amYrUzhtVFNzNzBCNkU0L0gxNnZ2azl0a1o0ZzMzSFVDUTM0QkpEWStldFpz?=
 =?utf-8?B?THlkTEdLYWU4MFRJUWhhSVVJYUFWWmdIenozeEcyTGxJSlhRc241YUZWR3Yx?=
 =?utf-8?B?ajhCWUc2WGNLSVdMWEpwZksvaHN1UG9TVDVKUThpZVR5ZjVRdyswNlNyK1o3?=
 =?utf-8?B?eGhuUURYM2NmMVYyZk1uQmZCZWNrdXZSYjBPSWVsOHFJR1BGSFBMNjV2UWRi?=
 =?utf-8?B?Qzl0V1ZZakwvREpwVlc1L2xYUHY3U3E1bzk3VW1zK203bTJHWXM0WS9YZ2dZ?=
 =?utf-8?B?QXV1dEpFQk1MNnJQeXRUZ2VjZ0pkR2VMMWY1WUVCSjI4Z3E0MzlnUkc4aFBs?=
 =?utf-8?B?cmRCMjRVdzh5OVNIQ3pmWlhRL2QzT2psVlk4b0RnMjdYUUdHQ2tyWTZGVjFI?=
 =?utf-8?B?WFRYaE4xK2pDbkFGWGJvSVgyR3RMeTN1Qi9VV2h4c2ZEMmdMVnkwcHJ2dnVG?=
 =?utf-8?B?bjhDT3g1czVTeXBaemlXV2ZMMEYyQnErM2FRMzlCZnhxd3BrbWFLZWMwYk9J?=
 =?utf-8?B?NEJhNk9iZHpxbkpjaDBJR041azY5WEZsYTQraEp3ay93Y0UzMUtxMGh6SFcz?=
 =?utf-8?B?OEFTZFplVnVMaG9oQ3BXKzhHRHY2dENNZndTYlQ0MTFJNkxocjZYVkhVUTBG?=
 =?utf-8?B?bjhDaWZVeU80QW9tZHZuM213dDZRYWNxT2N3NkhmUy9xL2RTbVpNbDNVWGdh?=
 =?utf-8?B?RDN4Rmo1akd0TnJodmk4U0s3c1BFM1hwOWNiUkZ2aUloQUxhQ25yT0RVT0tu?=
 =?utf-8?B?ekMzNm05UzUwR1V3UnhPMkdYcll0NGV1dDhSSys0WDYxMCtBV0pBVWN0NjVX?=
 =?utf-8?B?SlJ4elBwMVUvWVNiUHhydUtWQm9OaVNvVFR0VFBIVjVZQStpeG5KajZ5dEx6?=
 =?utf-8?B?ZG9UNFFLakQzVkF3MEZ5a0xSSnZMTjI0RCtDT2dNOXFKVEJFcnc3bnlUcmp2?=
 =?utf-8?B?WTd3MWp1K0RCNkdEYmNXbCt6WFJMQ0hpczZKTklDNHhSVEppVERtZE9HK2E5?=
 =?utf-8?B?Zk40K0ZPdzhETThCUlZvRFVGNzRkbzdOYjUwdDMyd3dXaEtKSGhQSFMrT0E2?=
 =?utf-8?B?RjZmTGkzM1Ivb2VSRVhVSFBUNjFFekVtRENxeHlCYWMwMmkzc3JYY3NxZ2Ux?=
 =?utf-8?B?YmI1aTBwclJ6N24yaXlKUWNUWTgwQ0NZekNvOXhlaGo0aUdGb0lrNHdwa3BL?=
 =?utf-8?B?RnlhOGFncENZdjNvL1hIemNMRTlEYmF2bzV0U091QU1tR0N0WWdGN1JPdEc5?=
 =?utf-8?B?Mk02SGN6M0J4dHMyS1d5ZTJkWTJ1ODVyZU9md2ZyWE8wWHV1eVdKaEx1dVcw?=
 =?utf-8?Q?QcshGEHpRTrCqcUP3RHruf8AF?=
X-OriginatorOrg: silabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2d35ce9-2249-40ea-f909-08de238fb33a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8205.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 15:08:43.1321
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 54dbd822-5231-4b20-944d-6f4abcd541fb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CZx4Ir+KUME3WBMraOK73g7BckhQhq3iibAFjiZqR5uC6WfnW0DElY1oGkWOh6NHdCt/r1agVYCVnkvkcW0Y7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8774
X-Proofpoint-ORIG-GUID: 1odenvpescTjmXwkvzawVmqDwtaOLIrz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDEyMSBTYWx0ZWRfXztks6EOmuM7k
 ZXhMYa6mgg9H2XtrsTi+TCqP1h+nouCGzJFtoNR8ZJSh/pZ06dhLt4UqG1/uLrc565AU5LtPZEf
 XDk1OiIIUV46V8sTQ+QCT6AlEwcqCUWVkysmHTWMByMvaegt+qHd+UbHaylFjXJFwyVgSrbJnUW
 JpUQUvNOfgMMyb7KgTJ5WUtYrDE+2pDq4uAvOmFSb83oBPsbXXOa3Yj7xwF3jn21zaTbEbiUTgF
 w3vuaEI3ktTJG02BtOcTzO1ckqR5DDaHV28im5rFO85nu+am/sTtrKMrIUUXNM8il5DC5ABpRdo
 OMxs8HStYcElNldUfQH1BIrD7Y+J26uh3TQ0VlTS1xG3oJG+UJZgf81ufrS2WeDm1acmiFzLoiu
 RBSNG1wTJXmJRPxkSvkZWY9CqYGARQ==
X-Authority-Analysis: v=2.4 cv=BYPVE7t2 c=1 sm=1 tr=0 ts=691745fd cx=c_pps
 a=U/cWNT7cGANcmDM7K3LxiQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=M51BFTxLslgA:10
 a=i1IsUcr2s-wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=2AEO0YjSAAAA:8
 a=0-yszGi1pw2bLUArnyYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: 1odenvpescTjmXwkvzawVmqDwtaOLIrz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511140121
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 05F513F84E
X-Spamd-Bar: ----
X-Spamd-Result: default: False [-4.00 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[silabs.com,reject];
	R_DKIM_ALLOW(-0.20)[silabs.com:s=pps12202023,silabs.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:148.163.153.153];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_POSSIBLE(0.00)[148.163.153.153:from];
	ASN(0.00)[asn:22843, ipnet:148.163.152.0/22, country:US];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DNSWL_BLOCKED(0.00)[148.163.153.153:from,2603:10b6:8:162::17:received,40.93.194.116:received];
	DKIM_TRACE(0.00)[silabs.com:+]
X-Rspamd-Action: no action
Message-ID-Hash: 7LSXFFI2B73BHKU6Z5AJSARWGIATGMRH
X-Message-ID-Hash: 7LSXFFI2B73BHKU6Z5AJSARWGIATGMRH
X-MailFrom: Damien.Riegel@silabs.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Silicon Labs Kernel Team <linux-devel@silabs.com>, =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [RFC PATCH v2 12/12] greybus: cpc: let host device drivers dequeue TX frames
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/7LSXFFI2B73BHKU6Z5AJSARWGIATGMRH/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

VGhpcyBsZXRzIHRoZSBDUEMgaG9zdCBkZXZpY2UgZHJpdmVycyBkZXF1ZXVlIGZyYW1lcyB3aGVu
IGl0J3MNCmNvbnZlbmllbnQgZm9yIHRoZW0gdG8gZG8gc28sIGluc3RlYWQgb2YgZm9yY2luZyBl
YWNoIHRvIHRoZW0gdG8NCmltcGxlbWVudCBhIHF1ZXVlIHRvIHN0b3JlIHBlbmRpbmcgc2ticy4N
Cg0KVGhlIGNhbGxiYWNrIGlzIGNoYW5nZWQgZnJvbSBgdHJhbnNtaXRgIHRvIGB3YWtlX3R4YCBh
bmQgbGV0IENQQyBjb3JlDQpub3RpZnkgdGhlc2UgZHJpdmVycyB3aGVuIHRoZXJlIGlzIHNvbWV0
aGluZyB0byB0cmFuc21pdC4NCg0KU2lnbmVkLW9mZi1ieTogRGFtaWVuIFJpw6lnZWwgPGRhbWll
bi5yaWVnZWxAc2lsYWJzLmNvbT4NCi0tLQ0KIGRyaXZlcnMvZ3JleWJ1cy9jcGMvaG9zdC5jIHwg
NDkgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0NCiBkcml2ZXJzL2dyZXli
dXMvY3BjL2hvc3QuaCB8IDEwICsrKysrKy0tDQogMiBmaWxlcyBjaGFuZ2VkLCA1NCBpbnNlcnRp
b25zKCspLCA1IGRlbGV0aW9ucygtKQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncmV5YnVzL2Nw
Yy9ob3N0LmMgYi9kcml2ZXJzL2dyZXlidXMvY3BjL2hvc3QuYw0KaW5kZXggMGY5YWEzOTQ2OTAu
LjdhZTViYjA2NjZmIDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncmV5YnVzL2NwYy9ob3N0LmMNCisr
KyBiL2RyaXZlcnMvZ3JleWJ1cy9jcGMvaG9zdC5jDQpAQCAtMTU2LDYgKzE1Niw3IEBAIHN0YXRp
YyBzdHJ1Y3QgZ2JfaGRfZHJpdmVyIGNwY19nYl9kcml2ZXIgPSB7DQogc3RhdGljIHZvaWQgY3Bj
X2hkX2luaXQoc3RydWN0IGNwY19ob3N0X2RldmljZSAqY3BjX2hkKQ0KIHsNCiAJbXV0ZXhfaW5p
dCgmY3BjX2hkLT5sb2NrKTsNCisJc2tiX3F1ZXVlX2hlYWRfaW5pdCgmY3BjX2hkLT50eF9xdWV1
ZSk7DQogfQ0KIA0KIHN0cnVjdCBjcGNfaG9zdF9kZXZpY2UgKmNwY19oZF9jcmVhdGUoc3RydWN0
IGNwY19oZF9kcml2ZXIgKmRyaXZlciwgc3RydWN0IGRldmljZSAqcGFyZW50KQ0KQEAgLTE2Myw3
ICsxNjQsNyBAQCBzdHJ1Y3QgY3BjX2hvc3RfZGV2aWNlICpjcGNfaGRfY3JlYXRlKHN0cnVjdCBj
cGNfaGRfZHJpdmVyICpkcml2ZXIsIHN0cnVjdCBkZXZpYw0KIAlzdHJ1Y3QgY3BjX2hvc3RfZGV2
aWNlICpjcGNfaGQ7DQogCXN0cnVjdCBnYl9ob3N0X2RldmljZSAqaGQ7DQogDQotCWlmICghZHJp
dmVyLT50cmFuc21pdCkgew0KKwlpZiAoIWRyaXZlci0+d2FrZV90eCkgew0KIAkJZGV2X2Vycihw
YXJlbnQsICJtaXNzaW5nIG1hbmRhdG9yeSBjYWxsYmFja1xuIik7DQogCQlyZXR1cm4gRVJSX1BU
UigtRUlOVkFMKTsNCiAJfQ0KQEAgLTIzMiwxMyArMjMzLDU1IEBAIEVYUE9SVF9TWU1CT0xfR1BM
KGNwY19oZF9yY3ZkKTsNCiAgKiBAY3BjX2hkOiBIb3N0IGRldmljZSB0byBzZW5kIFNLQiBvdmVy
Lg0KICAqIEBza2I6IFNLQiB0byBzZW5kLg0KICAqLw0KLWludCBjcGNfaGRfc2VuZF9za2Ioc3Ry
dWN0IGNwY19ob3N0X2RldmljZSAqY3BjX2hkLCBzdHJ1Y3Qgc2tfYnVmZiAqc2tiKQ0KK3ZvaWQg
Y3BjX2hkX3NlbmRfc2tiKHN0cnVjdCBjcGNfaG9zdF9kZXZpY2UgKmNwY19oZCwgc3RydWN0IHNr
X2J1ZmYgKnNrYikNCiB7DQogCWNvbnN0IHN0cnVjdCBjcGNfaGRfZHJpdmVyICpkcnYgPSBjcGNf
aGQtPmRyaXZlcjsNCiANCi0JcmV0dXJuIGRydi0+dHJhbnNtaXQoY3BjX2hkLCBza2IpOw0KKwlt
dXRleF9sb2NrKCZjcGNfaGQtPmxvY2spOw0KKwlza2JfcXVldWVfdGFpbCgmY3BjX2hkLT50eF9x
dWV1ZSwgc2tiKTsNCisJbXV0ZXhfdW5sb2NrKCZjcGNfaGQtPmxvY2spOw0KKw0KKwlkcnYtPndh
a2VfdHgoY3BjX2hkKTsNCiB9DQogDQorLyoqDQorICogY3BjX2hkX3R4X3F1ZXVlX2VtcHR5KCkg
LSBDaGVjayBpZiB0cmFuc21pdCBxdWV1ZSBpcyBlbXB0eS4NCisgKiBAY3BjX2hkOiBDUEMgSG9z
dCBEZXZpY2UuDQorICoNCisgKiBSZXR1cm46IFRydWUgaWYgdHJhbnNtaXQgcXVldWUgaXMgZW1w
dHksIGZhbHNlIG90aGVyd2lzZS4NCisgKi8NCitib29sIGNwY19oZF90eF9xdWV1ZV9lbXB0eShz
dHJ1Y3QgY3BjX2hvc3RfZGV2aWNlICpjcGNfaGQpDQorew0KKwlib29sIGVtcHR5Ow0KKw0KKwlt
dXRleF9sb2NrKCZjcGNfaGQtPmxvY2spOw0KKwllbXB0eSA9IHNrYl9xdWV1ZV9lbXB0eSgmY3Bj
X2hkLT50eF9xdWV1ZSk7DQorCW11dGV4X3VubG9jaygmY3BjX2hkLT5sb2NrKTsNCisNCisJcmV0
dXJuIGVtcHR5Ow0KK30NCitFWFBPUlRfU1lNQk9MX0dQTChjcGNfaGRfdHhfcXVldWVfZW1wdHkp
Ow0KKw0KKy8qKg0KKyAqIGNwY19oZF9kZXF1ZXVlKCkgLSBHZXQgdGhlIG5leHQgU0tCIHRoYXQg
d2FzIHF1ZXVlZCBmb3IgdHJhbnNtaXNzaW9uLg0KKyAqIEBjcGNfaGQ6IENQQyBIb3N0IERldmlj
ZS4NCisgKg0KKyAqIEdldCBhbiBTS0IgdGhhdCB3YXMgcHJldmlvdXNseSBxdWV1ZWQgYnkgY3Bj
X2hkX3NlbmRfc2tiKCkuDQorICoNCisgKiBSZXR1cm46IEFuIFNLQiwgb3IgJU5VTEwgaWYgcXVl
dWUgd2FzIGVtcHR5Lg0KKyAqLw0KK3N0cnVjdCBza19idWZmICpjcGNfaGRfZGVxdWV1ZShzdHJ1
Y3QgY3BjX2hvc3RfZGV2aWNlICpjcGNfaGQpDQorew0KKwlzdHJ1Y3Qgc2tfYnVmZiAqc2tiOw0K
Kw0KKwltdXRleF9sb2NrKCZjcGNfaGQtPmxvY2spOw0KKwlza2IgPSBza2JfZGVxdWV1ZSgmY3Bj
X2hkLT50eF9xdWV1ZSk7DQorCW11dGV4X3VubG9jaygmY3BjX2hkLT5sb2NrKTsNCisNCisJcmV0
dXJuIHNrYjsNCit9DQorRVhQT1JUX1NZTUJPTF9HUEwoY3BjX2hkX2RlcXVldWUpOw0KKw0KIE1P
RFVMRV9ERVNDUklQVElPTigiR3JleWJ1cyBvdmVyIENQQyIpOw0KIE1PRFVMRV9MSUNFTlNFKCJH
UEwiKTsNCiBNT0RVTEVfQVVUSE9SKCJTaWxpY29uIExhYm9yYXRvcmllcywgSW5jLiIpOw0KZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3JleWJ1cy9jcGMvaG9zdC5oIGIvZHJpdmVycy9ncmV5YnVzL2Nw
Yy9ob3N0LmgNCmluZGV4IDA3YmI0ZWI1ZmI4Li4yYzQ3ZTE2N2FjMSAxMDA2NDQNCi0tLSBhL2Ry
aXZlcnMvZ3JleWJ1cy9jcGMvaG9zdC5oDQorKysgYi9kcml2ZXJzL2dyZXlidXMvY3BjL2hvc3Qu
aA0KQEAgLTksNiArOSw3IEBADQogI2luY2x1ZGUgPGxpbnV4L2RldmljZS5oPg0KICNpbmNsdWRl
IDxsaW51eC9ncmV5YnVzLmg+DQogI2luY2x1ZGUgPGxpbnV4L211dGV4Lmg+DQorI2luY2x1ZGUg
PGxpbnV4L3NrYnVmZi5oPg0KICNpbmNsdWRlIDxsaW51eC90eXBlcy5oPg0KIA0KICNkZWZpbmUg
R0JfQ1BDX01TR19TSVpFX01BWAkJCTIwNDgNCkBAIC0xOCw3ICsxOSw3IEBAIHN0cnVjdCBjcGNf
Y3BvcnQ7DQogc3RydWN0IGNwY19ob3N0X2RldmljZTsNCiANCiBzdHJ1Y3QgY3BjX2hkX2RyaXZl
ciB7DQotCWludCAoKnRyYW5zbWl0KShzdHJ1Y3QgY3BjX2hvc3RfZGV2aWNlICpoZCwgc3RydWN0
IHNrX2J1ZmYgKnNrYik7DQorCWludCAoKndha2VfdHgpKHN0cnVjdCBjcGNfaG9zdF9kZXZpY2Ug
KmNwY19oZCk7DQogfTsNCiANCiAvKioNCkBAIC0zMyw2ICszNCw4IEBAIHN0cnVjdCBjcGNfaG9z
dF9kZXZpY2Ugew0KIAljb25zdCBzdHJ1Y3QgY3BjX2hkX2RyaXZlcgkqZHJpdmVyOw0KIA0KIAlz
dHJ1Y3QgbXV0ZXgJCQlsb2NrOyAvKiBTeW5jaHJvbml6ZSBhY2Nlc3MgdG8gY3BvcnRzICovDQor
CXN0cnVjdCBza19idWZmX2hlYWQJCXR4X3F1ZXVlOw0KKw0KIAlzdHJ1Y3QgY3BjX2Nwb3J0CQkq
Y3BvcnRzW0dCX0NQQ19OVU1fQ1BPUlRTXTsNCiB9Ow0KIA0KQEAgLTQ3LDYgKzUwLDkgQEAgdm9p
ZCBjcGNfaGRfcHV0KHN0cnVjdCBjcGNfaG9zdF9kZXZpY2UgKmNwY19oZCk7DQogdm9pZCBjcGNf
aGRfZGVsKHN0cnVjdCBjcGNfaG9zdF9kZXZpY2UgKmNwY19oZCk7DQogdm9pZCBjcGNfaGRfcmN2
ZChzdHJ1Y3QgY3BjX2hvc3RfZGV2aWNlICpjcGNfaGQsIHN0cnVjdCBza19idWZmICpza2IpOw0K
IA0KLWludCBjcGNfaGRfc2VuZF9za2Ioc3RydWN0IGNwY19ob3N0X2RldmljZSAqY3BjX2hkLCBz
dHJ1Y3Qgc2tfYnVmZiAqc2tiKTsNCit2b2lkIGNwY19oZF9zZW5kX3NrYihzdHJ1Y3QgY3BjX2hv
c3RfZGV2aWNlICpjcGNfaGQsIHN0cnVjdCBza19idWZmICpza2IpOw0KKw0KK2Jvb2wgY3BjX2hk
X3R4X3F1ZXVlX2VtcHR5KHN0cnVjdCBjcGNfaG9zdF9kZXZpY2UgKmNwY19oZCk7DQorc3RydWN0
IHNrX2J1ZmYgKmNwY19oZF9kZXF1ZXVlKHN0cnVjdCBjcGNfaG9zdF9kZXZpY2UgKmNwY19oZCk7
DQogDQogI2VuZGlmDQotLSANCjIuNDkuMA0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpncmV5YnVzLWRldiBtYWlsaW5nIGxpc3QgLS0gZ3JleWJ1cy1k
ZXZAbGlzdHMubGluYXJvLm9yZwpUbyB1bnN1YnNjcmliZSBzZW5kIGFuIGVtYWlsIHRvIGdyZXli
dXMtZGV2LWxlYXZlQGxpc3RzLmxpbmFyby5vcmcK
