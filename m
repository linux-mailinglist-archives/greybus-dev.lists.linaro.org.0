Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A3F8C5DC04
	for <lists+greybus-dev@lfdr.de>; Fri, 14 Nov 2025 16:08:42 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 3C5883F854
	for <lists+greybus-dev@lfdr.de>; Fri, 14 Nov 2025 15:08:41 +0000 (UTC)
Received: from mx0a-0024c301.pphosted.com (mx0a-0024c301.pphosted.com [148.163.149.154])
	by lists.linaro.org (Postfix) with ESMTPS id 524193F806
	for <greybus-dev@lists.linaro.org>; Fri, 14 Nov 2025 15:08:35 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=silabs.com header.s=pps12202023 header.b=aRvam9DX;
	dkim=pass header.d=silabs.com header.s=selector1 header.b=PNzwEfPO;
	dmarc=pass (policy=reject) header.from=silabs.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1");
	spf=pass (lists.linaro.org: domain of Damien.Riegel@silabs.com designates 148.163.149.154 as permitted sender) smtp.mailfrom=Damien.Riegel@silabs.com
Received: from pps.filterd (m0101743.ppops.net [127.0.0.1])
	by mx0a-0024c301.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AE9ueV62132744;
	Fri, 14 Nov 2025 09:08:31 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps12202023;
	 bh=2JdiHNRSwF/ibSbQFZk0lXQvp4GL9vjzMvPd3MBv4k4=; b=aRvam9DXpHl3
	W3MY7AQGMu/OrV5+61L3zvNWswedX/54HgY9xM3CJSKiQ0OU3CD2xD/pbnZR/6ik
	Gj101ZFsSUqv5ZoaXkX4U5yFNob5WusUOxsfMMFMnDE6f4rNWfH2fQ+JYAhp34zK
	jimUgqtcHY4M4GJEkg9iMTUUu/dNAVLGgBMgeEhqC0HvN3+hoCtavYYbKogvja5n
	dG+XrxHPaNnK7lOb6qP5F3BP5ScsPRkk2JIMXSXPjWmWYY2ZbkOu54Ie96k44ohl
	AVWIg7ux+HS7QTuXc+42Zxg6ukQS2S0pKfl9LTeaxre3QLoLcxprYRa5DzgvwJN7
	gJiOMtgWQA==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11022081.outbound.protection.outlook.com [40.107.209.81])
	by mx0a-0024c301.pphosted.com (PPS) with ESMTPS id 4ae285rk1u-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 14 Nov 2025 09:08:29 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NXnMZ0Q66UTjloEuOTZRD6fDc0i1tRZzSh/G4mmlEKi/b4t60/Rg5ynUd2SlcT+25gaYmsqhV+yP5gh6yHZFHasIxCf/X3+6fDvDAoscwBwR3Wccc/cx8j6PyKw+oYspMSRZSQza9CAysRgJlMaKj6hzFlNkvkLTRigxp2jSGE+HtGK1GhVOql1PePEsIkM7sO9WWZCcbZvZ9kguImLDbxL3vmg3qznzh2cSD15tcK0HmuOTTLJN7yVn8wLHzblZKrDJXUdNT0cnu+YK2vtrjHGgPeggIbMbDWlS0YirVSUzyJssij3uLjohBM5MZv9+kBU8oy958mKnOsQaVLHixg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2JdiHNRSwF/ibSbQFZk0lXQvp4GL9vjzMvPd3MBv4k4=;
 b=QksoOovOQeiXF+gkNnpEJgH0FhjiPnqRXaDa5eIRHTIbgS1ZhVcYEr6CnyoiSyISG/RUgrgksdjamcZe1K3LN7dmP5IyS9+PtIsTYc1Pm78ffB3n5piW6LXUvPT2rxquTHelDnOoI23an0SIrnvIV2iv7NZMbg2mqESp1fF0hWm5rwsDpDfHcoe1hBrtkJ/0+nXkSvTIfDn7t1uZaUo1rviZbVgLy/YYSAP/czVyDvGy7ErSX2gTHeQOkV7gTN3qoH/mgE0/G+fvgyXP04camo37Atz1D4oqthSYBIAuoIOdYq+nbkqRFV6r0aUB6qOTuuux5UqG+hE+RLOVcuC9yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silabs.com; dmarc=pass action=none header.from=silabs.com;
 dkim=pass header.d=silabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2JdiHNRSwF/ibSbQFZk0lXQvp4GL9vjzMvPd3MBv4k4=;
 b=PNzwEfPOmvjh3t08DowdC+uUaUpklTWGZabWmGrUraZwseovxwrQetDF+bli3NWm9ofh5StdZKy8kT7AaSSV8r+jqJL4wQ2qbjx4tcQaJo+BwRmFfnHwPAkyNYqH/xka1zhzN3+eDVTfg6OfQSc8YN9gHK64eH88XhkhJZPfCyI=
Received: from DS0PR11MB8205.namprd11.prod.outlook.com (2603:10b6:8:162::17)
 by CH3PR11MB8774.namprd11.prod.outlook.com (2603:10b6:610:1cd::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Fri, 14 Nov
 2025 15:08:19 +0000
Received: from DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::c508:9b04:3351:524a]) by DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::c508:9b04:3351:524a%5]) with mapi id 15.20.9320.018; Fri, 14 Nov 2025
 15:08:19 +0000
From: =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
To: greybus-dev@lists.linaro.org, Johan Hovold <johan@kernel.org>,
        Alex Elder <elder@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org
Date: Fri, 14 Nov 2025 10:07:31 -0500
Message-ID: <20251114150738.32426-6-damien.riegel@silabs.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251114150738.32426-1-damien.riegel@silabs.com>
References: <20251114150738.32426-1-damien.riegel@silabs.com>
X-ClientProxiedBy: MA5P287CA0046.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:175::12) To DS0PR11MB8205.namprd11.prod.outlook.com
 (2603:10b6:8:162::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8205:EE_|CH3PR11MB8774:EE_
X-MS-Office365-Filtering-Correlation-Id: fd76708f-2dc5-435b-c1eb-08de238fa4f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?dzA4emxoL0h0Z3ZuSEFHbTB3cDIvVHNlUnVNeEdsUGtiWjNIRWxZQTdwVy8r?=
 =?utf-8?B?N09VOFNKZU9QY3FuRE9lQnhmK21Yc3VtRncxMFhFcU9IMDk5YzVNdk94bnk2?=
 =?utf-8?B?Ym9wMlJiR2tHYkRUMDN2SUNKQUlCR2ljMkdGbHY3cS8wTVJqTEhPUzkwWS8w?=
 =?utf-8?B?U0FtS2pWdjNNMVVIS0FEb0ZyV1FjejBsZ0c2a3hMK3lod1E1ZkdlL3hudm9T?=
 =?utf-8?B?LzJqR1l0dndEY1dFSC9ZUE1QekRyekxwSWNlN041WGYzSHpKZGNDK2w3MmlS?=
 =?utf-8?B?L1M4dE4rcW1rUEFUcFM2TDdwdVJ2dkI5V01SNENsYWR1MG9xcGp0UnZ4cndo?=
 =?utf-8?B?dFlWbm9wWUpXaHJkVEpOUEpLSHRjWFp3RVlIY0xoWmpTK2Rqb082aXFVbzg1?=
 =?utf-8?B?UDhvcVJFWnN1WkJlbUtpNm11NTlvVGZDUTIzVW5RUXZ3dFVIQ2xkdWd4RlRn?=
 =?utf-8?B?S0toR0JPdStOaW5hVDQ1MC92TGdiTlk1Q0k4elJXcWtyRkp6c2w3czB3Q0ta?=
 =?utf-8?B?TkhzU0lyb0pWZjBmQW5HWVVpYUplMWQyTFhUM3BjaDNyMEs1T1lrWml0T1N5?=
 =?utf-8?B?WEN0a1VUTVRXSUttcmduS3VJZitBQmFoK0RORzJBc0I4SkRpREFMNGFQMk1S?=
 =?utf-8?B?NFE0NjlyNDZKZ3BXcmFnMXl4bEJVbTYwSkswR3VNYlh3UUFwSm50REM2VU8w?=
 =?utf-8?B?cVUzbUxIUW5kVnpNNk9XZ2lPSnliTmkwTmorNDVMZ0hUS3BKL2lrMG5pcGE2?=
 =?utf-8?B?V0h6cHB5L3g0ekZoeG4wWkFPMnFnWkxnRVhvRTB6RCtCeXl5WDhZRCtSR1FS?=
 =?utf-8?B?RlNLVVVBMnRBMmYyRW5SSjVwYmw5ZkpNbVVkbFVCUzB6VmRKSC8vM255bkRo?=
 =?utf-8?B?YnJjblY4NHZvRCs0dTBNeVh6bks2QzFSY2VuRUg3S0lKZWRtSUt2V1lUNUFZ?=
 =?utf-8?B?UVQ1V0NGQ3ZYbXRNdExpSVFEbFJpdEpZM08yaXlEY1hXSGxMWWdVRWdwVU9M?=
 =?utf-8?B?REVhY0liSlBrQ2xVWHo2SStFdmtWamlxRW9kaCtXUnRwTWF3NmpGbTh6M1hZ?=
 =?utf-8?B?ci9Pbk4wdnJhQmQvbW1JTC9XTUZrL0oxcldKdFR0YlQ0Yy91a3IzcVkyVmkz?=
 =?utf-8?B?T3R2ODVKb2ZPU2JPWXFUUHpyNEE3ak5lOGhxc3huVW9Sa0N1RWt1MzROQ1oz?=
 =?utf-8?B?WEFPUlNVU3JXYkZ1Ry9XNm5GUFZ6OXluUnJzVWVOUVFWVVJ5aEdOcTVtWGc1?=
 =?utf-8?B?YllDKzZZNUhwWDQwczJuZStheVhQRDBOQy9EZEMvcGl5aWNJUm1MYXBTaTMv?=
 =?utf-8?B?VjViK2pjbUZYZHBuc3JTbW9WajMvakVGbjV1UzdPTFZNQ1ErL2R1QzJsZGNu?=
 =?utf-8?B?NVp3TU5QRmk2L3U2Sjh3VFQ3OXRDeCszMGdmRzNQU0I1aWhMMHBVbW9wS3hu?=
 =?utf-8?B?Z1NGc3FWeEFTV3k5QTAzdEdaZUxYN205M1pTTitqQm5TTUFvWUJTRjV0NU5l?=
 =?utf-8?B?OW14Y2dRY3ArbE41bGt6Wk0yMmJjVDFWTUJjUlhkd0RxK3RWMGNCVzBmZlRR?=
 =?utf-8?B?czUyQm9SWm9YQzdTQmVOT1lDSXVJTVIrOWxBUjRQMTJYRG5Hc0pYQzVCR2Ix?=
 =?utf-8?B?cHdkMTBhaXlUdVlFaXIxKzRkNkwxcGNmbHlVaVIwRXg3dkpzOWNXMW1kQVlx?=
 =?utf-8?B?Wnd0ZURsY3RhSmFyUWQxQVd4VkZLNEJZTkRuWjhSU0ZoNE5SdW1qWk9hSDFp?=
 =?utf-8?B?bGhxbGZFOTFjajVYOEtyZWpycjdUM3VobGt0M0RMMU1SRG1mSUUyTVR5U0d0?=
 =?utf-8?B?UlpvYXNWUWwrdW4wdzI4eUJHekx3dG9IbEhVZ2N2N1ZDY2F3aWJsdzA2NnhF?=
 =?utf-8?B?dEJoKzZnNElDMWhEZTU5Qlk4Nlp6Y2lwQzRWYnZSeDZiSDduSFR0YXdLQTk2?=
 =?utf-8?B?dlJYVnB0MnNnUEhHdmhzQTBETFR1TCtyVHN5bG1wVVRIc2REclcvdjFjQ1hV?=
 =?utf-8?B?WnF5a09MOGdUcDJjbWhYUzJ3d09ac0dFbXlOTHdQcXVzY2ZINkc5NFZ0em9F?=
 =?utf-8?Q?+rbCvY?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8205.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cmlIRHl5NUxHZXkvdklIcFdoNm50Z00vS1QxUDZONEhXNkFweTd1NmYyeFB0?=
 =?utf-8?B?cGIra3JROWZ1cWFDTGNPeFo1d1dHMzZVUGEwV2J3OHdsei9QQThyenRxM2Q5?=
 =?utf-8?B?aFoyUk9rNTc2VExRSlhuVzBmMEZmVVFLc3J0VHpzOFExS0pPSmZhMlpCZkV6?=
 =?utf-8?B?K2d4OEx4ZVIxa1ZOdGo1U3pnT2l1TW5FMDhhUzIxUWdvWGd1WVIxcEQ4ejZH?=
 =?utf-8?B?K3k0UmFDYkNkRWRLckJHSGZMVjFwZnlHeGVWcTlVejRGSGVjNzlqZW9raHJF?=
 =?utf-8?B?RktTV2x1ODNqSU84YzdPUng0WkpNWnhVeEU4dTB0SXVDMTV5SktrdXNQT3R6?=
 =?utf-8?B?akx4WmNOY0ZZa2lNbkVEQloxTnNmSEM5YXc2K1luZUk2V3lsUW5RVUpYN2Vz?=
 =?utf-8?B?ajFNVk45Z2N2M2ltS1B6dlM5eFBDYVladC94dWZBN0tIdnFQY0luQlZQSWVz?=
 =?utf-8?B?bWZOYWgvWjRaaCsxNmZFNHhCdXc4a0t5cnRtYnBOajRHdWtGRUdLV1JKUDRO?=
 =?utf-8?B?QUtPeVBZcmhDWjN3ME5jS3F3NFlFTmVkZHBTdVd5SWpkL0dtTFN3MGkwdmFI?=
 =?utf-8?B?TUF3ejh3TXN2d3BGT1UxcGxianVsaDN0RHdNbDFKcCs4MUt6d2tDcmo1OUsy?=
 =?utf-8?B?UnFvMkd6TWlicVJEbzhaU3BHK0tzendYVTkxTnJuakQxQndqcVc0Zm4rYkxa?=
 =?utf-8?B?NHpaUnJYK2JpcURHeXN6QXZRcVBRNFB1N3NIOHA5T1VVWXJ5S2RoUVhxZ1Av?=
 =?utf-8?B?MTg3YTFiMWU3b2JhRFlLZ05pd3RpSVZMaUMxcFVSakZKSUZxYnZWYk9uZXZk?=
 =?utf-8?B?cEhCaDJYamtSWjl0ZjFjM3E2TVpkMjFlZ1FKelhhS25NTTNOcVZsTXI0d21E?=
 =?utf-8?B?QzJlVy8vSXUweG9CT2J2UHRnalZPMGVlVkxEVllqSmozcXRRaUlma1l2T3Rz?=
 =?utf-8?B?QVBORlJLQkhNZm9XRDZIMlRpTzRiRWxTNGdhb3NjaHBlRzF4eXJLTUNXVFpq?=
 =?utf-8?B?UnVmZ3V2eUNnZFZKQWU1VjNJc25nT29ieFg0Uk83clNDb0VNZ3pDTXc1SWlq?=
 =?utf-8?B?MzB1L1pWTWkxRHpTNllyUEh2aFlRcm81aWJkQU9EeHpCUndkQmN0a1RXa0xp?=
 =?utf-8?B?SzQrSFJtdUt0QTVKQjNHVnNML1AzbEdwS1BXaU12eHB3WWorTzg4a1F0dWdi?=
 =?utf-8?B?ektiR2NXY1UwbDByclVaM0NmcnJzbS9aZ0E2OUZ4eUg2RXVEeDRxYTBMSWtC?=
 =?utf-8?B?OFM3bjAwYWsvZmwrUW1aYVYvRFJhcVRVOXZGc2VpVGJ0QkdZN1FRZjlaRndh?=
 =?utf-8?B?RzRoWDVlL2lNWTc5NHpNVXp6NERQRUtPQWZhU1czMWJGdFZ5MER6ZTlVbG8w?=
 =?utf-8?B?RS9Kcng4aW94cFRLWjJnQlEyS2R0a3lxR2x4cWFLaXgxeHRBMnJOYWJHbTlU?=
 =?utf-8?B?cXNOUjZyT2d5N2hZM3RsUEtadVFjQ1habU1QUGhGRVNOT1M1bys1d3FHcW5v?=
 =?utf-8?B?ZHZLR3daVE5rZzltcjNrbC9nTS9QaEErUlpnWFR5SlZjL1R4TEdOMHlxa2c3?=
 =?utf-8?B?NVpjNk5aYStTNFk1M3dzdSttY0JXb0o3TjFjSUNuWUlYa3NGZUVHMUFkZGdW?=
 =?utf-8?B?SE56Qk9MbVNXVVE4V3Z2QlpITUhYWDRseUJ1Z2MwQWhJYkpPZDN0cUw3Z3VK?=
 =?utf-8?B?c1BDV2RpSWltRGp1eTN0UmpBQTlJTWM4UEYwTEl1ZFptNWFpTVRKRXFHYTRO?=
 =?utf-8?B?U3NiRVdSZ2ZycnlXYSt5NW50ck1uYnl3NVBoZmlPREdqeCszaTNyblFBd09T?=
 =?utf-8?B?a3lSNVRtWG1ydWZnS05WMjdSTEFRRHRNUjhpQ0M1YXhhbnZOK3VFWEFxTmRV?=
 =?utf-8?B?SWJBWVhaWW9HV1pKTjlBVVpTUDdjK1BlK2tkQmloT0RQNmFYZFNtcXZaMm1J?=
 =?utf-8?B?NUk1d3BiRzVqeEtvNEgyWU9sTjhoZ3k1QTRMYnRtR0ZGa2M4R3N5K0pOV0Jv?=
 =?utf-8?B?ZUEvR21MT3pnczc5djZBRUhHQUw1MXI0VEhSdkdHTUMwY3lsZy9URUROcy9T?=
 =?utf-8?B?WUx6YWd4WUJYRFQwQnlsaERneDd4cWZPVjQxd1lZTkIvMTlVUnAzU0hPaXVY?=
 =?utf-8?Q?Ii2n9wQ1gVG4eaorBZga7z1FI?=
X-OriginatorOrg: silabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd76708f-2dc5-435b-c1eb-08de238fa4f5
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8205.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 15:08:19.2360
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 54dbd822-5231-4b20-944d-6f4abcd541fb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2S20c7wDgk+28CERFCgoNNabvTN8uWG8p9plZ78tgTR86u3IZFjTkbZajA1BhY0dDeGFNRtw40PjBujPA3JO4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8774
X-Proofpoint-ORIG-GUID: NqzOFcAhv_l5wx9bry3gXkHXjZ_cZmXl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDEyMSBTYWx0ZWRfX7CYLuqBM9RA8
 e21/RABUjxRMxZQuJiFSShveS6F3Wk72UuaEzpwllm/LXDXbOWPc3Engt4S0LCymOTqcIKn4pFp
 gbIzLEqK5tfzDW2Pr0/PnZmX2jHPDtapMqUkDEpWOXl4JlIEhifCCXeck/jA/ShyuAwxd9Z55Qc
 hCVe8M3clAT/3t1kmhI8M7FqOyP+6n2oh/qIuIuIiNLovsFA3M5EomsytZp22Lmz+gmBvUhR47M
 QoCNryHWEardlpOEzBynFzPoFDIbFfgF4FLYy9ZqZxnaitiaBSy3hgQKsQxZclU3RbZuRhh2DSJ
 d+Kylz81ESuiO7g2h+F4kyab0UmPYIS9xW4l8+hlaLhx+E8nB9payrCHhuEVbuIXAYdEBHldUTU
 C4iV0CAHABfvPQOVhCPV8Ew5i0U7ew==
X-Proofpoint-GUID: NqzOFcAhv_l5wx9bry3gXkHXjZ_cZmXl
X-Authority-Analysis: v=2.4 cv=LfAxKzfi c=1 sm=1 tr=0 ts=691745ed cx=c_pps
 a=XJoAL0HPiv6B0cYJlRTKVw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=M51BFTxLslgA:10
 a=i1IsUcr2s-wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=2AEO0YjSAAAA:8
 a=9SkM2ZN-1AJx8s29AtcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 spamscore=0 clxscore=1015 phishscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140121
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 524193F806
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
	DNSWL_BLOCKED(0.00)[2603:10b6:8:162::17:received,148.163.149.154:from,40.107.209.81:received];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	DKIM_TRACE(0.00)[silabs.com:+]
X-Rspamd-Action: no action
Message-ID-Hash: LZMU2GVSLVSFNFUSQQEA2I3A3OJJIFE4
X-Message-ID-Hash: LZMU2GVSLVSFNFUSQQEA2I3A3OJJIFE4
X-MailFrom: Damien.Riegel@silabs.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Silicon Labs Kernel Team <linux-devel@silabs.com>, =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [RFC PATCH v2 05/12] greybus: cpc: switch RX path to socket buffers
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/LZMU2GVSLVSFNFUSQQEA2I3A3OJJIFE4/>
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
DQppbmRleCAxZDgxYzYyNGRkNi4uZDc5Nzg0NTQ5N2EgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dy
ZXlidXMvY3BjL2hvc3QuYw0KKysrIGIvZHJpdmVycy9ncmV5YnVzL2NwYy9ob3N0LmMNCkBAIC0y
MDQsMjAgKzIwNCwyMyBAQCB2b2lkIGNwY19oZF9tZXNzYWdlX3NlbnQoc3RydWN0IHNrX2J1ZmYg
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
cGMvaG9zdC5oIGIvZHJpdmVycy9ncmV5YnVzL2NwYy9ob3N0LmgNCmluZGV4IDg2ZDIwNWZjYjU5
Li5hM2Q2ZGRiNjQ4ZSAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3JleWJ1cy9jcGMvaG9zdC5oDQor
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
