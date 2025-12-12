Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 44880CB93CE
	for <lists+greybus-dev@lfdr.de>; Fri, 12 Dec 2025 17:13:58 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 64D393F99A
	for <lists+greybus-dev@lfdr.de>; Fri, 12 Dec 2025 16:13:57 +0000 (UTC)
Received: from mx0b-0024c301.pphosted.com (mx0b-0024c301.pphosted.com [148.163.153.153])
	by lists.linaro.org (Postfix) with ESMTPS id 514CA3F900
	for <greybus-dev@lists.linaro.org>; Fri, 12 Dec 2025 16:13:36 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=silabs.com header.s=pps12202023 header.b=P8Ttji3p;
	dkim=pass header.d=silabs.com header.s=selector1 header.b=WfIO6XAw;
	spf=pass (lists.linaro.org: domain of Damien.Riegel@silabs.com designates 148.163.153.153 as permitted sender) smtp.mailfrom=Damien.Riegel@silabs.com;
	dmarc=pass (policy=reject) header.from=silabs.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from pps.filterd (m0101742.ppops.net [127.0.0.1])
	by mx0a-0024c301.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BC2uEi82563949;
	Fri, 12 Dec 2025 10:13:26 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps12202023;
	 bh=C0ZE1Lpao0VwLwi2WpVtPRRotAKEx9xhQpIwVpcxx84=; b=P8Ttji3p7nh8
	NwDpsNP/HRc+xjYGjRPnusFC8VANqo7Vhqf6pFhHMjquNjVI4jayVjWdDSgxmLfl
	q9Eg7Ka/4OUhYoUBYhnRDaC48VMz8iagNR38ATbv/xC1n+VvMaMLDWJxwVVVNSx1
	nJaMZFnyjhR2IyYNOl3W9bIQ6VKYXMICGlG6LP8MIIgXyueCSieeuyZuANVpcSSE
	7urXJU5j2RO1Rg6pPCsX8Jdk2CFAnt5oZHGWXoJmOhQtyk3DRDoAJ+cSEykxTrUP
	S/68KkFRWhhhRW+9ebIljuikPXd4cuBwQCdtWAx8p8Urh3zfsqJI5el8SMMEO/v1
	ekuN+twuFw==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11022100.outbound.protection.outlook.com [52.101.43.100])
	by mx0a-0024c301.pphosted.com (PPS) with ESMTPS id 4aykqe47hk-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 12 Dec 2025 10:13:26 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SncZRyca/E9Miv/kafun0dVmzSlliR+fyeq1svQzmn2S36mObdvIqkFhqYhqVPw/Rynju9W6Al/aKwPoKXlkHCrlF/STwOHtf2cfDDAF1U2MTRYvNMvDoV89WZo8mWOT6zKgFojJkJj5TEy7XFG9b1e42Izg1Jiq0pvIE/P/GqklWyqzZjS4e7UG4zM3NwQIx2SLX7FTktojfvK2Ky4AcCqGct60Wnm1xVOP71u79SiLbMSSQe288pHZBovKW26iNMDFfOgyTjwdHunP7V3tjcEiI0NMr+3uGoIQqwuuy+w6hHcbz3leoGpdbEX+YlJzDXs1GBz1Bdl7v96dImmr3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C0ZE1Lpao0VwLwi2WpVtPRRotAKEx9xhQpIwVpcxx84=;
 b=S6m+S0lduK52BlvEPPVg+1n47kKjd4+RPIreKmQnzJM/JUTWBBy8unQVEyNNEfUSP2a9l6uk/XC7quRKLtsj1Nfib6gjoAigOtoGY1hbAR+o+m5XCLGG6wBbWKxfv0km606MMpYDooIbfEGf5MfebQuqPQInG249Sx2TD0ptoxf8/nFegkdrgx7jh4z/sa8Tfu6n+z9ILnlxke00DcB2FpTyCkMn14WhZpfW2zcdU/wHjhGDWT/zrL2cuRPe3N3LvHMuOHfFxs7XzCfdnb3dvNPDJ+Ev9syd557dS8JO1suKurjl1qnOGJVX+E5Qx6UK5ac2Epy+bj0CyZyzdsMfFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silabs.com; dmarc=pass action=none header.from=silabs.com;
 dkim=pass header.d=silabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C0ZE1Lpao0VwLwi2WpVtPRRotAKEx9xhQpIwVpcxx84=;
 b=WfIO6XAwwP1DDVoM55nRIUQpkqPPJPZCqhRteIav9gsZKOAHt5YS7MGW1x48fWfEZtqvu8kC/dTTBFvyQz+HJFw8KEsny6fBp10Z9phhwd+elOP3nCy1ArNM6EcDIt+ib7QwUzF9VOiknb39WM0LrmXIQXO1qVxbqMWDHZb5hy0=
Received: from DS0PR11MB8205.namprd11.prod.outlook.com (2603:10b6:8:162::17)
 by DM3PPF7468F7991.namprd11.prod.outlook.com (2603:10b6:f:fc00::f2d) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.9; Fri, 12 Dec
 2025 16:13:24 +0000
Received: from DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::2de6:bc88:2af7:3583]) by DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::2de6:bc88:2af7:3583%3]) with mapi id 15.20.9412.005; Fri, 12 Dec 2025
 16:13:24 +0000
From: =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
To: greybus-dev@lists.linaro.org
Date: Fri, 12 Dec 2025 11:12:58 -0500
Message-ID: <20251212161308.25678-5-damien.riegel@silabs.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251212161308.25678-1-damien.riegel@silabs.com>
References: <20251212161308.25678-1-damien.riegel@silabs.com>
X-ClientProxiedBy: YQZPR01CA0176.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:8b::25) To DS0PR11MB8205.namprd11.prod.outlook.com
 (2603:10b6:8:162::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8205:EE_|DM3PPF7468F7991:EE_
X-MS-Office365-Filtering-Correlation-Id: db318f60-95ab-4e29-f5e4-08de3999605f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?czNMelU0eVJ5Y3U0N0tLa0g2WThwdW4yTy9DUjd0d0xLUFRhVTVPeXJPNmRN?=
 =?utf-8?B?MEdmYzNjNmxrZlB3d21pbDRIYXZxT0RxSy9BbXNBWjRmaXZVL2pmeG1Ca3VT?=
 =?utf-8?B?TDlnVjMyZHcxZndiL2J6dktYZm95OGlZS2RyWndsRTZxNjJBaytSdGNEb1hL?=
 =?utf-8?B?OVlSRkw1Tnp0TjdzWGt4ZmZ2TGFDNldMZ01zNzVIQk9TeTQwREVuclNKaVVs?=
 =?utf-8?B?aXRoUWlZNElQVm5MaStWMVR4aGpyMkNUOGRodktCT1pvWGUrSGNSVC9FMElX?=
 =?utf-8?B?OTM3OS9hZEVmNjdVUkQzVjNvODk5NnEraHgzMk5raUNtN1ZSaVBYa2E3QU4z?=
 =?utf-8?B?SG44cnArQmJzU0J4Wm0zcmM0NEozMTNHYUh6Z3BTZDFtQlJSZVN0OER2TjNy?=
 =?utf-8?B?TURRbWRMWXhpS2pFd2pReCtWZWZUQXFLNEJkdjNvMmFvd2tiMHJRRXJ0WStD?=
 =?utf-8?B?RFEwOWpyRHpTZVlhdjE0cjNTSDhLVUVZWUFRcjAvN1kwTjhlYnB5Q1lFb3pR?=
 =?utf-8?B?eG5VNmdYcEpJVHVHdHlySzN0T04yRjMvbU15TjdnTWtCNGh6OStET0tQMHRM?=
 =?utf-8?B?cjM1c0YrYmNTKzhNbFRZNXNIL0pHdDM2S1ZzN1lJaUM5am1WR1pPYWJpc2Rz?=
 =?utf-8?B?M0hLOEpENUx3cHVabytTZ2JqQkE5dlNVb1FZeVkrZURKYzF6Wk4zVWFCSXJj?=
 =?utf-8?B?cFJPbzErSmRYbWpCUjBuWWRuMGFoSnVoY1dBSSt5THpFdnkrT2pRYzU2T2lh?=
 =?utf-8?B?R05iN3pxd29yYjhzZ1F2ZDNYOHV6WjE1dnhuMEttMUszWlBveUdUZHNHSzRK?=
 =?utf-8?B?emhQRitZOVp0VDVKdW9NdkpKSzY3Z2ZUa3BuMnd0VkVHZzMwTTBwYzJrYUVG?=
 =?utf-8?B?QVBUWFlvTUpicVBpUHFMVlphZk94Mm5tTTFTUFZHNEJpaGUyT0VvS2swTjAy?=
 =?utf-8?B?dEFzRHJUQ2lkWU1FdTBuTGE5T0R1YW1nSm9xR00ycXlQRkJJVFh0citKUnY2?=
 =?utf-8?B?SFhmV2JtQmhOTkVHOHBCN2lZdE5xWE5maHBjOVdFdHlGZ1JjT1JqdmFuNHZE?=
 =?utf-8?B?cTgxaG1DcDZia3ZXSlFTTFNNeG1iNmNGb0pSM3RRQVY3N1VtTWlDL2NtblZh?=
 =?utf-8?B?eTVvcFZscW5MT1JlWHZwQlhkY01ZaHJseG5DSXpCVUZ0NzdOYStDaS9qb2NK?=
 =?utf-8?B?SENQUkxTZUFLNmZrQ3ZUdXR0cVFhUHZlQWRUcHM3cTVKVnptZzdJZGQ1KzQw?=
 =?utf-8?B?TzJKN2ZWNyt5Tm9zZ0krTzZtVS9uNEVQMUdpczNITTVla2w2R3ZoMTVRRFVo?=
 =?utf-8?B?RHc2Sk9nY2VoOUdNcHR6TENKK3Z6a0I0cEw3UVNsS0kzUnFzUmFseTBVZWtF?=
 =?utf-8?B?bWg4MzBKT0dha0Y0cDdSb0hUT0ljRU9TZ1N3dnEzNHZlSjdSTll2QWMzc3ll?=
 =?utf-8?B?UGs1d3dab29yVmIxNUJjVEpLMXhwbW53WTRWVGp5cUtlMUVVRnBZSXZONFU3?=
 =?utf-8?B?Um9NUGZRSHNsUVlwMXpEbjUwcnhQejZIbnFyN3VIZlkySWJlYks2Y1BRQ004?=
 =?utf-8?B?b3M2YUJScnpHdTduVUhKZEI4cUhQWlIxN3N1alMwR3VoSnFIR3oxMmQvbzlW?=
 =?utf-8?B?SlpsQVhJYXI0WmdzTWFPZGtLUGlyN3ZGUklDdWpJVENnN1F4RnV1T3o0TGpH?=
 =?utf-8?B?NHlscFU5cUlqb2hjWWZGY1lLcUlWRjgwdW1xYVY2dU5Ndmt1NG1BcGRPRVBG?=
 =?utf-8?B?WXlNWERiZVRhQmsxcUlZUG1FRWpxTlEvYkZZRDlrMlU1UnVWQUVqVG9UdTl4?=
 =?utf-8?B?aGV0UjZBdjBFMEJLZURVTnFBOFIwQ3RwS3NGRzZYaVlUTGl2a0FsZ09jMDFK?=
 =?utf-8?B?WFpvWGx2QlJwVzRBazQwMGptRlNSbVZud2FXMUJiMDM4S2R2Vkh1SDliamVG?=
 =?utf-8?B?T1FqSWpXVVhxU1BWcElmY2s5NmpmTmNuQ1ZoQUV1anpBWEZlNVhqeGQrV0RO?=
 =?utf-8?B?WWMxaVBVZVN2eTNEcWtrcFBGaUFaUHhtVGVLNHRUNXZLVW9aK1RISlQxaWZF?=
 =?utf-8?Q?EBTMqH?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8205.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cm9OY0xrVUZUNndEWXM3MGsvbWcweGU0U3FwQ1VVSkVqT1BXS2lQTi9NRkkw?=
 =?utf-8?B?TWJmbW1CR0NUNmdDc1BxamVsVUUvbUQrQWtLRXdGcUtKcXhTQWJYL2pIWE8r?=
 =?utf-8?B?VFFBNURhblRheWdMWnU3QndCKzhENkJKTXV2YUFyWVQ2cUdNOHNTMEM1TlJU?=
 =?utf-8?B?M1BlSFhBT0JYbzNBaEN1VzZxdFZDeER6QjQxcHRjRWluRjRqSmZsMHlTUHZy?=
 =?utf-8?B?VVErNVRVcHA0bWZmVWhUTk5YZnViVTZIY3ZNWEdnSFZKaEVkd0NnbGt4Mko5?=
 =?utf-8?B?NjFvamlMZHlqUWNhK1ROOXovRzFUcG44UkpmdzliZkxOKzBLM2JZMEhyOHYw?=
 =?utf-8?B?YjltOFR6SWhSNnhOWUVDb0UxVCtGNWNqZGlyeFkxN041bmQ0NTdUczRja2FT?=
 =?utf-8?B?cjFSSzFYWW5qNVp2UTdqaE5nRkFWTlpaRGFVVkh6c1Erbis0MytrVHZMck83?=
 =?utf-8?B?REp0WFJ2VGdpdUFiNlNseGpDWnMyS3NaeTRKNm9JNGhGbGlVNXJ2RjJJemg0?=
 =?utf-8?B?OXVWdjVEN21Td2UxNzVHdXVCTE1FUkpjZ2tZbnJpbDdPR3Vzdjc4bjA2MFBD?=
 =?utf-8?B?VmVzR2x3TUtiOTIwSDFXYUg3UUIrZkhBaC9vdmpKNUppQjQxWVhmb3Zhc1kw?=
 =?utf-8?B?aWlYSkYvTW5JTjVwYWRWeWhtUGRjWGRHU05IQkVmdERKTm5nKzkxWmJ5WVh5?=
 =?utf-8?B?dDNpdUNSSWFRc2F4N1F3ZTdwa29tU1BXVC9FUk9wMHd6WmRIREdLZ291Smtj?=
 =?utf-8?B?MTlWc2RXVHNBZk90RWF5Yml0RGFXdWtjM01rWmMrODVoeEp4SER6OTZwTTBY?=
 =?utf-8?B?ZjN1b3pXR2lyNjdZa0d1RnFVdmRHbmRwL3EyMlNycnJqMjRJNnB3U1NhclVo?=
 =?utf-8?B?czBkSFZuRUt0UmJuVTJ0S2FmenJCcjhCRXQyU0NjZHNqSmFHVEYwM1RYV1o2?=
 =?utf-8?B?dWtZWGhWSzhCRkx5WGdYTWgwKzhRSnZMa0twUEluWTlwL1JJVTdxV1FuN3J2?=
 =?utf-8?B?enFCTm53WC9xVG9pd1pxL0FZVGRnZTRTNnJZS1JvZ1lCK1BYbDR1aTJudE0z?=
 =?utf-8?B?aE5FQVJZdHBBc0l5SkJaaXpmNm5DOFhLa2NZRDFoZ0pmTnkzd3FYMkhtNjI2?=
 =?utf-8?B?QWxlUFlZd3ZBM2VKN1lqem0wREZTdFlMYS9ERmRpK0hZUGFacXNVYS9NWElN?=
 =?utf-8?B?L3JGZTAvZ3ArWmhML2t5VjZDdDlzNXZUWC9NQVBZazdsRk9zakI0STQ1S0hT?=
 =?utf-8?B?R3JNM1U1a1cxMjFHUUFVS01FYUlGQ3dMSFZuOEtNMjNGUi9UbmhnaW9YZWxY?=
 =?utf-8?B?OFJaUHk3bldBejF6NEpKeHJiOVl5WmZ0ZDNPekQxUW5xY21nZkVudENNZ3Ru?=
 =?utf-8?B?b3BPaGw1eDBEREVZTXlEVlowdkxxTmorTk1laldMZDhCQlJmVXVoVlcvQzdC?=
 =?utf-8?B?TGJneUVWUGpXbGVmV3VnTGlxbUFZelhuNmlUVUZPK0h4aVpwOUlHdWFTbWVs?=
 =?utf-8?B?b2dscVRJbzRJNE8wdStIV3g5NXF5dm5wUkM3TEJaaEZkaHFYNExHTVowd1FR?=
 =?utf-8?B?bGFoT1V2MHdWQTl2Z0F5Y2hkTkZRQUZOT0dQcFhydis3Uzk4SmRHUjRldS9B?=
 =?utf-8?B?ejRtYlpTUkRwWlE4bVJFQ2E1VWJBRFQ3cGwxYkUranJlZDFKbG9SWkZOTHpK?=
 =?utf-8?B?S09xMk1abEQreHRoQy9tT3hHQ1JBRlF1UTZIR2Qvd0ZVVjM5RFRRRllBQ0hL?=
 =?utf-8?B?RXMvS2J5dnZNdVprQWI2T0dqOGFvcDYrZmswRnJSL0lsbHRWSTFZQTN2S0dI?=
 =?utf-8?B?NVgwemVoM0hYMFVTdDluWTVmOGZ1WXZRYzFxNzJML1FMQ0tHbHh3UlZZY2hs?=
 =?utf-8?B?Ulk4NzFmS2lJTVM0S2xzbUw1TytxMkl5TFh6TjV0dTRHRURoZWxXQVVPOEdC?=
 =?utf-8?B?cWJpV3VxcVg3YUVSQnhYRExEQk9LdUVteDBuTVcyZWRyUmdzMlRNNEtBcndV?=
 =?utf-8?B?dVBSNnFpUlkzSW1yWmJoREhIRjhiZDZnUU1lZlA1RDZ5SlcyVmRqNmhVcDdH?=
 =?utf-8?B?djNlVWlDYWdwRGpKendSU1dRRW1WNUIvV1NrVmpJRm14L0VHa2Y2T0VMS2VK?=
 =?utf-8?Q?4hNLpu1YUAO4OB3jW6aFW1fqI?=
X-OriginatorOrg: silabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db318f60-95ab-4e29-f5e4-08de3999605f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8205.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 16:13:24.4673
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 54dbd822-5231-4b20-944d-6f4abcd541fb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tFCLXtD2K2AwknYh6WhnZY1Hk52s6C1XQVJ+t/Z8kf2Do8PIWoyLXF3d2iNFgJA0aK8rYTXyqfSfEh5tCn3kBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF7468F7991
X-Proofpoint-ORIG-GUID: qPTgd9BH3p4p6pMSLR4X2tu9JxAfNPvz
X-Authority-Analysis: v=2.4 cv=brxBxUai c=1 sm=1 tr=0 ts=693c3f26 cx=c_pps
 a=Us7513DS1gT4knu3Fiol7g==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=M51BFTxLslgA:10
 a=i1IsUcr2s-wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=2AEO0YjSAAAA:8
 a=bWPpxp-jgQ3ylSns5SMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEyMDEyOCBTYWx0ZWRfXwNXBN+OMJsX4
 F3CjxQ0PLBUX++tP9+wiuYblNgW/sxRb0NEa2mfyTRH0bGKebQ3Pz7Vb2iSqBPeWBtlx0RgvzdQ
 L55wrwYtmq3/ZXDfSzRuJ8NE0qKH4irwPo1L3Ch2OK1XIbmVMAWyRMdQCkkVU5yjVuJh0Dfbjr0
 bvZLWI7Lg3v+QLkCFyFSiaH7oDQXFamv1WYD38Qk9HkMS4L5YiGIW1kcxUx7d316jExSnoQhLV9
 I97W5tdWzZaagO+9T3b3bK0E95vCQNqgTEaajtdyEzimHFzD0NPrqWpTni30e6ujdwwFBW8jooL
 YGX3c7OKWYslxJ1nRsaawLogSzk1/8fVDJA+PlTLj14Ml++zSIaA8o2SompiAm0937L+XmoHcxn
 tZTN4rc3CJK9wZVA8tewM4ZGX6nY/w==
X-Proofpoint-GUID: qPTgd9BH3p4p6pMSLR4X2tu9JxAfNPvz
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
	BLOCKLISTDE_FAIL(0.00)[148.163.153.153:server fail,2603:10b6:8:162::17:server fail,52.101.43.100:server fail];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DNSWL_BLOCKED(0.00)[2603:10b6:8:162::17:received,52.101.43.100:received];
	DKIM_TRACE(0.00)[silabs.com:+]
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 514CA3F900
X-Spamd-Bar: ----
Message-ID-Hash: CODM7EN5DTLHMBCGECIXNCNUHBWO3LXA
X-Message-ID-Hash: CODM7EN5DTLHMBCGECIXNCNUHBWO3LXA
X-MailFrom: Damien.Riegel@silabs.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, Silicon Labs Kernel Team <linux-devel@silabs.com>, =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH 04/14] greybus: cpc: pack cport ID in Greybus header
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/CODM7EN5DTLHMBCGECIXNCNUHBWO3LXA/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

VGFrZSBhZHZhbnRhZ2Ugb2YgdGhlIHBhZGRpbmcgYnl0ZXMgcHJlc2VudCBpbiB0aGUgR3JleWJ1
cyBoZWFkZXIgdG8NCnN0b3JlIHRoZSBDUG9ydCBJRCBhbmQgbWluaXplIG92ZXJoZWFkLiBUaGlz
IHRlY2huaXF1ZSBpcyBhbHJlYWR5IHVzZWQNCmJ5IHRoZSBlczIgZHJpdmVyLg0KDQpTaWduZWQt
b2ZmLWJ5OiBEYW1pZW4gUmnDqWdlbCA8ZGFtaWVuLnJpZWdlbEBzaWxhYnMuY29tPg0KLS0tDQog
ZHJpdmVycy9ncmV5YnVzL2NwYy9jcGMuaCAgIHwgIDMgKysrDQogZHJpdmVycy9ncmV5YnVzL2Nw
Yy9jcG9ydC5jIHwgMjkgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCiBkcml2ZXJzL2dy
ZXlidXMvY3BjL2hvc3QuYyAgfCAxMyArKysrKysrKysrKystDQogZHJpdmVycy9ncmV5YnVzL2Nw
Yy9ob3N0LmggIHwgIDIgKy0NCiA0IGZpbGVzIGNoYW5nZWQsIDQ1IGluc2VydGlvbnMoKyksIDIg
ZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dyZXlidXMvY3BjL2NwYy5oIGIv
ZHJpdmVycy9ncmV5YnVzL2NwYy9jcGMuaA0KaW5kZXggZDlmOGY2MDkxM2EuLjYyNTk3OTU3ODE0
IDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncmV5YnVzL2NwYy9jcGMuaA0KKysrIGIvZHJpdmVycy9n
cmV5YnVzL2NwYy9jcGMuaA0KQEAgLTI0LDYgKzI0LDkgQEAgc3RydWN0IGNwY19jcG9ydCB7DQog
c3RydWN0IGNwY19jcG9ydCAqY3BjX2Nwb3J0X2FsbG9jKHUxNiBjcG9ydF9pZCwgZ2ZwX3QgZ2Zw
X21hc2spOw0KIHZvaWQgY3BjX2Nwb3J0X3JlbGVhc2Uoc3RydWN0IGNwY19jcG9ydCAqY3BvcnQp
Ow0KIA0KK3ZvaWQgY3BjX2Nwb3J0X3BhY2soc3RydWN0IGdiX29wZXJhdGlvbl9tc2dfaGRyICpn
Yl9oZHIsIHUxNiBjcG9ydF9pZCk7DQordTE2IGNwY19jcG9ydF91bnBhY2soc3RydWN0IGdiX29w
ZXJhdGlvbl9tc2dfaGRyICpnYl9oZHIpOw0KKw0KIGludCBjcGNfY3BvcnRfdHJhbnNtaXQoc3Ry
dWN0IGNwY19jcG9ydCAqY3BvcnQsIHN0cnVjdCBza19idWZmICpza2IpOw0KIA0KIHN0cnVjdCBj
cGNfc2tiX2NiIHsNCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dyZXlidXMvY3BjL2Nwb3J0LmMgYi9k
cml2ZXJzL2dyZXlidXMvY3BjL2Nwb3J0LmMNCmluZGV4IGVkMGI4ZThiMGQ3Li4wZmM0ZmYwYzVi
YiAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3JleWJ1cy9jcGMvY3BvcnQuYw0KKysrIGIvZHJpdmVy
cy9ncmV5YnVzL2NwYy9jcG9ydC5jDQpAQCAtMyw2ICszLDkgQEANCiAgKiBDb3B5cmlnaHQgKGMp
IDIwMjUsIFNpbGljb24gTGFib3JhdG9yaWVzLCBJbmMuDQogICovDQogDQorI2luY2x1ZGUgPGxp
bnV4L3VuYWxpZ25lZC5oPg0KKyNpbmNsdWRlIDxsaW51eC9za2J1ZmYuaD4NCisNCiAjaW5jbHVk
ZSAiY3BjLmgiDQogI2luY2x1ZGUgImhvc3QuaCINCiANCkBAIC0zMSw2ICszNCwyNyBAQCB2b2lk
IGNwY19jcG9ydF9yZWxlYXNlKHN0cnVjdCBjcGNfY3BvcnQgKmNwb3J0KQ0KIAlrZnJlZShjcG9y
dCk7DQogfQ0KIA0KKy8qKg0KKyAqIGNwY19jcG9ydF9wYWNrKCkgLSBQYWNrIENQb3J0IElEIGlu
dG8gR3JleWJ1cyBPcGVyYXRpb24gTWVzc2FnZSBoZWFkZXIuDQorICogQGdiX2hkcjogR3JleWJ1
cyBvcGVyYXRpb24gbWVzc2FnZSBoZWFkZXIuDQorICogQGNwb3J0X2lkOiBDUG9ydCBJRCB0byBw
YWNrLg0KKyAqLw0KK3ZvaWQgY3BjX2Nwb3J0X3BhY2soc3RydWN0IGdiX29wZXJhdGlvbl9tc2df
aGRyICpnYl9oZHIsIHUxNiBjcG9ydF9pZCkNCit7DQorCXB1dF91bmFsaWduZWRfbGUxNihjcG9y
dF9pZCwgZ2JfaGRyLT5wYWQpOw0KK30NCisNCisvKioNCisgKiBjcGNfY3BvcnRfdW5wYWNrKCkg
LSBVbnBhY2sgQ1BvcnQgSUQgZnJvbSBHcmV5YnVzIE9wZXJhdGlvbiBNZXNzYWdlIGhlYWRlci4N
CisgKiBAZ2JfaGRyOiBHcmV5YnVzIG9wZXJhdGlvbiBtZXNzYWdlIGhlYWRlci4NCisgKg0KKyAq
IFJldHVybjogQ1BvcnQgSUQgcGFja2VkIGluIHRoZSBoZWFkZXIuDQorICovDQordTE2IGNwY19j
cG9ydF91bnBhY2soc3RydWN0IGdiX29wZXJhdGlvbl9tc2dfaGRyICpnYl9oZHIpDQorew0KKwly
ZXR1cm4gZ2V0X3VuYWxpZ25lZF9sZTE2KGdiX2hkci0+cGFkKTsNCit9DQorDQogLyoqDQogICog
Y3BjX2Nwb3J0X3RyYW5zbWl0KCkgLSBUcmFuc21pdCBza2Igb3ZlciBjcG9ydC4NCiAgKiBAY3Bv
cnQ6IGNwb3J0Lg0KQEAgLTM5LDYgKzYzLDExIEBAIHZvaWQgY3BjX2Nwb3J0X3JlbGVhc2Uoc3Ry
dWN0IGNwY19jcG9ydCAqY3BvcnQpDQogaW50IGNwY19jcG9ydF90cmFuc21pdChzdHJ1Y3QgY3Bj
X2Nwb3J0ICpjcG9ydCwgc3RydWN0IHNrX2J1ZmYgKnNrYikNCiB7DQogCXN0cnVjdCBjcGNfaG9z
dF9kZXZpY2UgKmNwY19oZCA9IGNwb3J0LT5jcGNfaGQ7DQorCXN0cnVjdCBnYl9vcGVyYXRpb25f
bXNnX2hkciAqZ2JfaGRyOw0KKw0KKwkvKiBJbmplY3QgY3BvcnQgSUQgaW4gR3JleWJ1cyBoZWFk
ZXIgKi8NCisJZ2JfaGRyID0gKHN0cnVjdCBnYl9vcGVyYXRpb25fbXNnX2hkciAqKXNrYi0+ZGF0
YTsNCisJY3BjX2Nwb3J0X3BhY2soZ2JfaGRyLCBjcG9ydC0+aWQpOw0KIA0KIAlyZXR1cm4gY3Bj
X2hkX3NlbmRfc2tiKGNwY19oZCwgc2tiKTsNCiB9DQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncmV5
YnVzL2NwYy9ob3N0LmMgYi9kcml2ZXJzL2dyZXlidXMvY3BjL2hvc3QuYw0KaW5kZXggZWUwOTBk
ZDMwOTcuLmIwOTZiNjM5MTgyIDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncmV5YnVzL2NwYy9ob3N0
LmMNCisrKyBiL2RyaXZlcnMvZ3JleWJ1cy9jcGMvaG9zdC5jDQpAQCAtMjAzLDggKzIwMywxOSBA
QCB2b2lkIGNwY19oZF9tZXNzYWdlX3NlbnQoc3RydWN0IHNrX2J1ZmYgKnNrYiwgaW50IHN0YXR1
cykNCiB9DQogRVhQT1JUX1NZTUJPTF9HUEwoY3BjX2hkX21lc3NhZ2Vfc2VudCk7DQogDQotdm9p
ZCBjcGNfaGRfcmN2ZChzdHJ1Y3QgY3BjX2hvc3RfZGV2aWNlICpjcGNfaGQsIHUxNiBjcG9ydF9p
ZCwgdTggKmRhdGEsIHNpemVfdCBsZW5ndGgpDQordm9pZCBjcGNfaGRfcmN2ZChzdHJ1Y3QgY3Bj
X2hvc3RfZGV2aWNlICpjcGNfaGQsIHU4ICpkYXRhLCBzaXplX3QgbGVuZ3RoKQ0KIHsNCisJc3Ry
dWN0IGdiX29wZXJhdGlvbl9tc2dfaGRyICpnYl9oZHI7DQorCXUxNiBjcG9ydF9pZDsNCisNCisJ
LyogUHJldmVudCBhbiBvdXQtb2YtYm91bmQgYWNjZXNzIGlmIGNhbGxlZCB3aXRoIG5vbi1zZW5z
aWNhbCBwYXJhbWV0ZXJzLiAqLw0KKwlpZiAoIWRhdGEgfHwgbGVuZ3RoIDwgc2l6ZW9mKCpnYl9o
ZHIpKQ0KKwkJcmV0dXJuOw0KKw0KKwkvKiBSZXRyaWV2ZSBjcG9ydCBJRCB0aGF0IHdhcyBwYWNr
ZWQgaW4gR3JleWJ1cyBoZWFkZXIgKi8NCisJZ2JfaGRyID0gKHN0cnVjdCBnYl9vcGVyYXRpb25f
bXNnX2hkciAqKWRhdGE7DQorCWNwb3J0X2lkID0gY3BjX2Nwb3J0X3VucGFjayhnYl9oZHIpOw0K
Kw0KIAlncmV5YnVzX2RhdGFfcmN2ZChjcGNfaGQtPmdiX2hkLCBjcG9ydF9pZCwgZGF0YSwgbGVu
Z3RoKTsNCiB9DQogRVhQT1JUX1NZTUJPTF9HUEwoY3BjX2hkX3JjdmQpOw0KZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3JleWJ1cy9jcGMvaG9zdC5oIGIvZHJpdmVycy9ncmV5YnVzL2NwYy9ob3N0LmgN
CmluZGV4IDE5MWI1ZTM5NGE2Li4yZTU2OGJhYzQ0ZSAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3Jl
eWJ1cy9jcGMvaG9zdC5oDQorKysgYi9kcml2ZXJzL2dyZXlidXMvY3BjL2hvc3QuaA0KQEAgLTQ1
LDcgKzQ1LDcgQEAgc3RydWN0IGNwY19ob3N0X2RldmljZSAqY3BjX2hkX2NyZWF0ZShzdHJ1Y3Qg
Y3BjX2hkX2RyaXZlciAqZHJpdmVyLCBzdHJ1Y3QgZGV2aWMNCiBpbnQgY3BjX2hkX2FkZChzdHJ1
Y3QgY3BjX2hvc3RfZGV2aWNlICpjcGNfaGQpOw0KIHZvaWQgY3BjX2hkX3B1dChzdHJ1Y3QgY3Bj
X2hvc3RfZGV2aWNlICpjcGNfaGQpOw0KIHZvaWQgY3BjX2hkX2RlbChzdHJ1Y3QgY3BjX2hvc3Rf
ZGV2aWNlICpjcGNfaGQpOw0KLXZvaWQgY3BjX2hkX3JjdmQoc3RydWN0IGNwY19ob3N0X2Rldmlj
ZSAqY3BjX2hkLCB1MTYgY3BvcnRfaWQsIHU4ICpkYXRhLCBzaXplX3QgbGVuZ3RoKTsNCit2b2lk
IGNwY19oZF9yY3ZkKHN0cnVjdCBjcGNfaG9zdF9kZXZpY2UgKmNwY19oZCwgdTggKmRhdGEsIHNp
emVfdCBsZW5ndGgpOw0KIHZvaWQgY3BjX2hkX21lc3NhZ2Vfc2VudChzdHJ1Y3Qgc2tfYnVmZiAq
c2tiLCBpbnQgc3RhdHVzKTsNCiANCiBpbnQgY3BjX2hkX3NlbmRfc2tiKHN0cnVjdCBjcGNfaG9z
dF9kZXZpY2UgKmNwY19oZCwgc3RydWN0IHNrX2J1ZmYgKnNrYik7DQotLSANCjIuNDkuMA0KDQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpncmV5YnVzLWRl
diBtYWlsaW5nIGxpc3QgLS0gZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpUbyB1bnN1YnNj
cmliZSBzZW5kIGFuIGVtYWlsIHRvIGdyZXlidXMtZGV2LWxlYXZlQGxpc3RzLmxpbmFyby5vcmcK
