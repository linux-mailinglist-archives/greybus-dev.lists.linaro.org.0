Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 6509CAC2ACB
	for <lists+greybus-dev@lfdr.de>; Fri, 23 May 2025 22:23:49 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 7163444477
	for <lists+greybus-dev@lfdr.de>; Fri, 23 May 2025 20:23:48 +0000 (UTC)
Received: from mx0a-0024c301.pphosted.com (mx0a-0024c301.pphosted.com [148.163.149.154])
	by lists.linaro.org (Postfix) with ESMTPS id CA5E44432B
	for <greybus-dev@lists.linaro.org>; Fri, 23 May 2025 19:49:27 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=silabs.com header.s=pps12202023 header.b=oQ1lSSsU;
	dkim=pass header.d=silabs.com header.s=selector1 header.b=GWedFTN6;
	spf=pass (lists.linaro.org: domain of Damien.Riegel@silabs.com designates 148.163.149.154 as permitted sender) smtp.mailfrom=Damien.Riegel@silabs.com;
	dmarc=pass (policy=reject) header.from=silabs.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from pps.filterd (m0101743.ppops.net [127.0.0.1])
	by mx0a-0024c301.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54NDnIrA017241;
	Fri, 23 May 2025 14:49:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps12202023;
	 bh=UJtx8AZ5bILF/UCMYKXU6Qxm52SvQxavR7/2EfU1Hnw=; b=oQ1lSSsUXF8K
	MVeW2qJISxKWfv7Xl6w1nDJpfV8Y2yuE42guPcVwaNuphhTQ1DQtWIc3g4EY0kqT
	lAj2DLraqTUoQFTWVMfk/vWXi+0JJ0xvBLOgPfOrUKcqN8tcxaan01SO7QtdkHzb
	q5+Kx1JxId7OzhaDf2SYLCL0oVHVC1W5MS790XflMo72L9X8kRNxgimg4YrsX8kk
	dgcQ7k8mur2iecs8wdVPoV0Bmt/0u+i+nCiAOpz1B6/oSr/vwXd9rC1CiQqqe7nE
	xE5YW19I0AxVMg2uJopKqM1JcE1DA028RAI0NLJD0k4a5SrlMyNwXV6z1tmPohwG
	YvwqeauqBQ==
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10on2109.outbound.protection.outlook.com [40.107.94.109])
	by mx0a-0024c301.pphosted.com (PPS) with ESMTPS id 46sn66mvb7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 May 2025 14:49:13 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QbRuTWCRhnXrBDTPGZOJMFRU76zKGByT8j0J/W4ZUhGtSdGqetPVLQtDJKUA3XKHwIrmKZIYvYa928XaqnEeUUQzIO22hGNZ1bYt7NqkOzl5x+XzKPppDYLNTIloL9EGVur9zp0563yzjRDm8vLbqn/LMDjtQY78OaayEtk6m08Gb8jCVoRxnHnDbGokVWW/zB5ACSYyRc/y91aksPpHDDgNIzy6m6sgkLXGub6lFzzK3FRUxYhpdFa8kXLH7ezs6gV3jNmUPzUZqbtLp5ixzWrnnH0OAtk2jZAcmcO/RdCePRXY6xx0P2gLpFGN1gab3MI6MHjYjM3FsSkJtZmOtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UJtx8AZ5bILF/UCMYKXU6Qxm52SvQxavR7/2EfU1Hnw=;
 b=BlMd88gE8aS+b14xv4UE8cee8No4KzSfs0+bvfliAzizvU8gYcXUg9fY+By1jynJQQdxJLsuswvRnUfw1AzGDtfsNZdCrxBcCiwjsWM2oY6kQ2qJPCT124hHPSAEZYzGh3vYGl7reiS01hXduF01lyWlK1vAURaa5QRN9rpPnkkSWMyoujFiy7RpGiR+aaksUemBqIewbJxawxwlwPEqfotqhSNY2HCDFYaxFjFAjzZbt8978Nx2zMWXvxfB/zPMgGspVIEwFsZRfAQqBzKnS389stGRxTsbXT+vFEmPkCNlzR8HTtLwl5my+eS1eWLp70TKAVTbkmme/MwjFbVHvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silabs.com; dmarc=pass action=none header.from=silabs.com;
 dkim=pass header.d=silabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UJtx8AZ5bILF/UCMYKXU6Qxm52SvQxavR7/2EfU1Hnw=;
 b=GWedFTN6ahgfiV11JQ+sNleFl1no/8XohIan4tr7nC4UtY/63+Q6A165mbo+ary56pYy5gv7i9X1TOX+SRzzD9sfmDn9KRzFdT9b+iLTtgwSMxuc6adyZJx63sG1kL5pWxq3XSEyDSLO8znLbQTt11fFwOGgKwDQH+ytfeF6agI=
Received: from DS0PR11MB8205.namprd11.prod.outlook.com (2603:10b6:8:162::17)
 by SN7PR11MB7591.namprd11.prod.outlook.com (2603:10b6:806:32b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.22; Fri, 23 May
 2025 19:49:09 +0000
Received: from DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::c508:9b04:3351:524a]) by DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::c508:9b04:3351:524a%4]) with mapi id 15.20.8722.031; Fri, 23 May 2025
 19:49:09 +0000
Date: Fri, 23 May 2025 15:49:05 -0400
Message-Id: <DA3STV21NQE0.23SODSDP37DI7@silabs.com>
From: =?utf-8?q?Damien_Ri=C3=A9gel?= <damien.riegel@silabs.com>
To: "Alex Elder" <elder@ieee.org>, "Andrew Lunn" <andrew@lunn.ch>
X-Mailer: aerc 0.20.1
References: <20250512012748.79749-1-damien.riegel@silabs.com>
 <6fea7d17-8e08-42c7-a297-d4f5a3377661@lunn.ch>
 <D9VCEGBQWBW8.3MJCYYXOZHZNX@silabs.com>
 <f1a4ab5a-f2ce-4c94-91eb-ab81aea5b413@lunn.ch>
 <D9W93CSVNNM0.F14YDBPZP64O@silabs.com>
 <65cc6196-7ebe-453f-8148-ecb93e5b69fd@ieee.org>
In-Reply-To: <65cc6196-7ebe-453f-8148-ecb93e5b69fd@ieee.org>
X-ClientProxiedBy: YQBPR0101CA0324.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:6c::28) To DS0PR11MB8205.namprd11.prod.outlook.com
 (2603:10b6:8:162::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8205:EE_|SN7PR11MB7591:EE_
X-MS-Office365-Filtering-Correlation-Id: 33926442-3635-40e7-e49f-08dd9a32e267
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?QUNNMk5IandiMi83TVlSWWdRVXZ3ZEFNb3dFNUE2RGYwaXZMV3ZWNjVSb1Jj?=
 =?utf-8?B?YU0yZ1BPVXdnZnFmejZETTQzU2Z6TkpMK2Z1enAwaE1OUzZwamoyY29Wdkcy?=
 =?utf-8?B?OURZZzFwT1RJL1l3WjhtMTFEZHFZVGR0c3g3WTRjTnJKcTNEV0pvaDlVU0Rm?=
 =?utf-8?B?VUxucWZXNDYzbloyb3hOUlk4N1JqQnRXVnlGNG9vbjExVW04SkxkaEo4M1A0?=
 =?utf-8?B?Tm5waEE1Z0dDY2lhWmV0WVc3OXhjMzM5ZVpjOHplNlg4UnBoM2FPZUxSMGh6?=
 =?utf-8?B?U0dnME9qTmZHMnNKczZKWW4ycFozbHhaYjltK2NBMWhySFlTalVRZjB5SFAx?=
 =?utf-8?B?QzhOS05nSVRUaWoxQ2VYc1lJNkVDVGgzZDVxWkM3TC9EL29kMHJJOElIcXVD?=
 =?utf-8?B?ek5UUVNNRThaWEp0K08zVmh5RjI1bkRDazR6QjdIRDZXVnhuK1lGcWVCc2pL?=
 =?utf-8?B?MzBGK0VlTjlCNWJqNldZSkxHYlg5VUJjeXE2V3ZNQTIyRHBCYjByQlQ5Uk5V?=
 =?utf-8?B?bGFncEVMNG9mQUF0OGpsQ3Y5dXllaDErcHk2ME45ckEwd09EcFZDd0FPVkRD?=
 =?utf-8?B?ZUluVzg5a2lzaHVFTDVmaFZ0UWxIN1RJSERjQXRYUWo1L0drMjEwbkhSb1VC?=
 =?utf-8?B?VlR5ZDM5a1QxK0hDZEZMb1htdWdHcVFUZWFXRmc0cEJHWjk4NXZqUkxWSDFM?=
 =?utf-8?B?aVlrQVV5Y0Iwbjc4dDFiU0l1ak55cXFML2IyVUlaa0NCSVliS2dIWXo1OW1J?=
 =?utf-8?B?KzFtamNqODd3OFIxZjVRQU1EYlJwTkhrYmVDeXhNMExqZzlTNFY0MkhsU1Nm?=
 =?utf-8?B?ZHNYa2YzeFQ3RWhoV0VzcTBieDNKNGtrOWkvV2ZoRVJOLzI1eWFrMVpMOGp3?=
 =?utf-8?B?NldPV0w0b0VScGU5TkdKRisxK3JGRXVKS2xzU0dVdWYxUUhCRG5EUmhHbFJs?=
 =?utf-8?B?aEM0UThRZHpwc2hCZVJ6ZnIwZ0tBc2hvQ1p1ZlVtbXVwYno4NzM0NlBULzAz?=
 =?utf-8?B?RUUzSWpHeW1CZng1TVVySDN5RUtZemdlcFM1cEhCbSs1K2pLTWJOcmdTeFB2?=
 =?utf-8?B?SzBEc0ZlNURoOVUxWGhnODl6QkxrWC9kQjF6bzlFNEFzc2FYaFpNNTg0S1Ba?=
 =?utf-8?B?a3VPYXNTWFJ5Y2ErMEIyRUo2VjFvMjl1K1hkQkZ5OElDZXhmeUZNcWlTMFZw?=
 =?utf-8?B?dFpPd1ZFQVMxcTJrbERodVcwcDlEWVJENXZBc1Q3eGlwcGRkemo4RkVJZllX?=
 =?utf-8?B?bXhQWDJHc0pKemxhT0MvODlESCtRS1pKM1VYRXBpNVd6OXJYZ2tMZE5XVGkv?=
 =?utf-8?B?UCtVSDFsSzZTT2t3Zk5sT1lueDl1VVVic2VrbHhXekR6ZXZrWmk5ZVcxTGhu?=
 =?utf-8?B?L01SMm82UGttUVF2eXNYVUJtVlRUd2kzeXVVQjlLamNtdlBwQ2laTXJUUW1Z?=
 =?utf-8?B?SmozUTRkczNnbXdYNWpWQnA4eDNHK2xLNkhscm5keWtsNmNzS0drZmFROGVF?=
 =?utf-8?B?YW1lOVhuUHg2WjVBZitDcUxmZkg1bzh0aWQ5cjV5SWxTWkhucTZvUUQ4SzJB?=
 =?utf-8?B?U3BVd2lHbm5rNTByd0dkajVEK0ZtdFhnM044dzJzVFgvd1JQVjZRR1FKdU5F?=
 =?utf-8?B?L1U2VHNsMGtESThQc0RCU0E3UXZvakE0WUI2d1pyRHdRRWpkN0VjckI5dkRP?=
 =?utf-8?B?V1pBRktuamMrUWZIQlFVOVREUTd4SUQzZFA1ZFloc0pnT0RSSFozZ2pmd1pZ?=
 =?utf-8?B?Y04vanVqYURJZVZSaDJHbno4ODhmUjRHNHBqU1l6alU0Q3BxcUNQRkZjR25t?=
 =?utf-8?Q?9/m14o7TAAwdQVLVVeGj0HYXzdF1kAy0yG1v8=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8205.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Z0V0VWdpcDJFNGFtT3JsMEVyMDRtWGJOL2ZsdUh3Ti9IQ1piRjdXMzQzVVNK?=
 =?utf-8?B?ajZERkRwQjdQS0RiZDQwNUlra2xEM3JXRS93RkpkcU53QWx2MGJEZm43a2ZB?=
 =?utf-8?B?M1B2UWs2ZFVTbnRWRjY3bG0xRWtiUmsyZEVYdGNSeGFlVVFmM3BtOEQyallH?=
 =?utf-8?B?Q1JwWHhpWWg4Nk9RK2NoZk5UN051a25QaklNMmo3UXhlK0ZJOC9KbS93Ujds?=
 =?utf-8?B?TWxwQ0dFWDdvYUhoOGVDNjRiY0o0cUx2d0VZZ0RwT3dCNUE4emxrU1lJUjVK?=
 =?utf-8?B?VHZ6QkVXRFRLM1psMEc5NEdqd1FKaWYxQ2JIcmRCRGxqbXVYNE1UZkt0cWlh?=
 =?utf-8?B?SVFheEdaNjNqTmh6SzFzWGdaNS9NUWFqMU4xaEFQTTIwZjVPVER3Q05ZRHdQ?=
 =?utf-8?B?elQ4R3NJTGxJY1N0ZWhIOGdhVXRTSTc2bGtVMG5ZdGVMSWNROGVldjBXaVFZ?=
 =?utf-8?B?SXJCK0x4eDZ3b3Z6N251MUt1OC9nU00yS2FIdWdmdm5IQytGOHJpYUo0VmYz?=
 =?utf-8?B?cEtpVStnaERIOEJIdkduc2c2a3NjbVdIQUREOWZlZDNueWV4SjFwVTVMNVNo?=
 =?utf-8?B?UjdqL09QSW8rN0xKSzNqUjZsME4vZEZrck5xRmtKcmZIcDl2aEJMelRqSGx0?=
 =?utf-8?B?UExQN2srMDdhWnlleXk5R2k1ZkRHdmlzbWRjenlvcFczdWtwMUkxZEtvRE5p?=
 =?utf-8?B?eU9Zc2hHd3lXNHBJaCsyQmtHdy9vSThlR1BrbXZ2QVlpbGY4MWQ5NzBMb0Ex?=
 =?utf-8?B?MHQxZ2hSRlowQ0N1Sm8reXpQM25ncjRMSEFXVElHWFhRd1FXZHZiNUpmem80?=
 =?utf-8?B?TXpwd01QU3lHOWZJUnhSazRpZ1l2aHVqbmYwSEdCWU1MOStJOXRyZU5PeG9Y?=
 =?utf-8?B?KzhlVmJMVXpIZVh2cERNeElSVVFBNlZ4UEtsZE5rTG9XcEMrYzdaMHNmUTM3?=
 =?utf-8?B?VnhIMHBSQThqck9LenMrMHJzRGtkY1JKMzZoS1lFblc1YnNsVy9LMGx3eW1C?=
 =?utf-8?B?cGpjeU4xTm4wb3VJYlF3WjNaYVJ6NysvV1RPRVJlclBIN054aDZoVjlDYVpj?=
 =?utf-8?B?aWswSVk2Skp3Z1NKRHYxeHhtWkxTVFRQOEFITlNZY3ZyYmt2NFNubmtzdGFU?=
 =?utf-8?B?Zm0xQ1BkS1VTVHRQclZjOGZudmJNRW9LbHJQV3ZaU0c2TStEdFFHbFdYM1Ar?=
 =?utf-8?B?UktMTFV0aTZDb2pSMW1VQVJDMm5jdVgyOWFveUhmRkNuMXNMR0lJdDk5L0Ja?=
 =?utf-8?B?dHRCMncyTEl3allnblRyb2JaekpRdGcvQzMwdFk3VmJnSUpRdVI2OE5xdkR5?=
 =?utf-8?B?b1QzRmYrTHRKcGVDcnUvbWpnQW9SS3hqMnVBbUFzbkNqUkZXcmI2clI5L2tJ?=
 =?utf-8?B?RmpBWmhXczZURWsxQ3h2b2UwTFRCUlJHM3NmZ21Mem43RVVoR0ZLQkJNSm0w?=
 =?utf-8?B?QW5LbnpoaGlEQ2g1VThEb3lOaHdtZWUvcG93cXpwTHNFUlhEQ3FoRy9NZCt4?=
 =?utf-8?B?ZENoRDdZbU8wWGxtclRYUWo3QWNmVXY5TzliMWtVQzZwYU5zR2dHck42MUpD?=
 =?utf-8?B?M3UvVnlMTHFXS0ZhYXN2S1ozNGt6Y1FjeVMwY1ZZRFJ6anZpZFgvbkQxZWVt?=
 =?utf-8?B?Z2h5Z21aMmVUSUt0TmNMRzdvKzlWejg1Ri9Mb0w4MFZqWnc5SVdORXlqZ09a?=
 =?utf-8?B?SFlGSDR3eUFwRUU0RW92OHlRSHkrTmhqUVpUd04wMTBQSzFGbE9iY1Y0K2V0?=
 =?utf-8?B?cmdYbmlhakY1NnZBT29EVGY2WDFBSExqbjZwZFc0bnpaT1hWTjFrUTUzVGtI?=
 =?utf-8?B?SDJRbmZyRjR1YkNKVnZoWTJBeS9STzRPVE5RRVpsMklReFpRRnhhNGNBZGtC?=
 =?utf-8?B?ek5vTS9YdHVrMzVwS3YvcXZxY2o2b245bEJMa0FvRDgvK3F0WExucmxTRUhm?=
 =?utf-8?B?aCs0TkVnZHA2aHJ0TFVFWFZnVWVqMVVvYlZ4R3NJZXZoUlRtbGdVVitUOGFY?=
 =?utf-8?B?OUV1aTJTU2pFOFBkQktZM2lTQnZZYVVEY01pRHNBd25zSVRzRE9IQU05ODBO?=
 =?utf-8?B?OHFBazZJd0tWaE55THRQUFpWSVUzL3ZMV0cwNU1Gd3BMS1NmZVVPckljZmdz?=
 =?utf-8?Q?Ps13lwVW5y4T1xXN5eWFfdz5z?=
X-OriginatorOrg: silabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33926442-3635-40e7-e49f-08dd9a32e267
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8205.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2025 19:49:09.5404
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 54dbd822-5231-4b20-944d-6f4abcd541fb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1ZhKmhgK18d9vN78+WE4Za3bmkmYu4lLd58RLWYONbLqd1yo+j+mOm4VQiMBBv0YiPJ6eWOY5kgbMK9g3I1PZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7591
X-Proofpoint-ORIG-GUID: Y_MCLbZtEKemD-zcsH_gRb0NoHoqAnX8
X-Authority-Analysis: v=2.4 cv=JI07s9Kb c=1 sm=1 tr=0 ts=6830d139 cx=c_pps a=Aw7NL8YgY1wPWxdbGT6CAQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=M51BFTxLslgA:10 a=i1IsUcr2s-wA:10 a=2Fbpa9VpAAAA:8 a=XYAwZIGsAAAA:8 a=sozttTNsAAAA:8 a=Af58r-0oYm23b-L28WEA:9 a=QEXdDO2ut3YA:10 a=AsRvB5IyE59LPD4syVNT:22 a=E8ToXWR_bxluHZ7gmE-Z:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIzMDE4MSBTYWx0ZWRfX/msHtV5ZpqMU YbTqrKlcJ+E7+PiJYXowtq/O9TSzc/Mc6tFkIfpRFW7qrrhQg2npzPlNjdvNQkVuw6Jha5phtXR 1Ocp2Wzd3zkj+sV1L+UmrQJ2dqLQVP4hkIXS0EM+E1MILXea4T6h43+5J6zX6HMZFlGoxxRV8FV
 OpOurvpc1JNutJ5pLE3GX95+nUtoYTjpL85F/ECRUoybRwEXTUCA3lL/jAhlhh6tAWFPgC0tzH8 vR8FQnhsg932v8quM1K8QlaXXCZb5GwojGLYf7uVk/ZK9txLsKqYNH9ptR+rsvrx4Syq2n6YWxA nzsAHN4fwShyajXB1CFhecs+8nQ7SP10KrNifUpk+2al/ue7ikGJPbMV4SopMh4wvV7/NbiVLYM
 n8BJ2/tATQ+E8yLoxqasHJ/7ZpLnDSuvNswnvaFrLVSZW8lIEzY0gflX6P2Zxfidj2JeyuUr
X-Proofpoint-GUID: Y_MCLbZtEKemD-zcsH_gRb0NoHoqAnX8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_06,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 mlxscore=0 adultscore=0 phishscore=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 mlxlogscore=999 clxscore=1015
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2505160000
 definitions=main-2505230181
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Spamd-Result: default: False [-3.27 / 15.00];
	BAYES_HAM(-2.77)[99.02%];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[silabs.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:148.163.149.154];
	R_DKIM_ALLOW(-0.20)[silabs.com:s=pps12202023,silabs.com:s=selector1];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[netdev,dt];
	ASN(0.00)[asn:26211, ipnet:148.163.148.0/22, country:US];
	RCPT_COUNT_TWELVE(0.00)[18];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[silabs.com:+]
X-Rspamd-Queue-Id: CA5E44432B
X-Spamd-Bar: ---
X-MailFrom: Damien.Riegel@silabs.com
X-Mailman-Rule-Hits: implicit-dest
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
Message-ID-Hash: QLRBLBA5FUZPBUBVRA56MS4FLFRC53C7
X-Message-ID-Hash: QLRBLBA5FUZPBUBVRA56MS4FLFRC53C7
X-Mailman-Approved-At: Fri, 23 May 2025 20:23:46 +0000
CC: Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Silicon Labs Kernel Team <linux-devel@silabs.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [RFC net-next 00/15] Add support for Silicon Labs CPC
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/QLRBLBA5FUZPBUBVRA56MS4FLFRC53C7/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gV2VkIE1heSAyMSwgMjAyNSBhdCAxMDo0NiBQTSBFRFQsIEFsZXggRWxkZXIgd3JvdGU6DQo+
IE9uIDUvMTQvMjUgNTo1MiBQTSwgRGFtaWVuIFJpw6lnZWwgd3JvdGU6DQo+PiBPbiBUdWUgTWF5
IDEzLCAyMDI1IGF0IDU6NTMgUE0gRURULCBBbmRyZXcgTHVubiB3cm90ZToNCj4+PiBPbiBUdWUs
IE1heSAxMywgMjAyNSBhdCAwNToxNToyMFBNIC0wNDAwLCBEYW1pZW4gUmnDqWdlbCB3cm90ZToN
Cj4+Pj4gT24gTW9uIE1heSAxMiwgMjAyNSBhdCAxOjA3IFBNIEVEVCwgQW5kcmV3IEx1bm4gd3Jv
dGU6DQo+Pj4+PiBPbiBTdW4sIE1heSAxMSwgMjAyNSBhdCAwOToyNzozM1BNIC0wNDAwLCBEYW1p
ZW4gUmnDqWdlbCB3cm90ZToNCj4+Pj4+PiBIaSwNCj4+Pj4+Pg0KPj4+Pj4+DQo+Pj4+Pj4gVGhp
cyBwYXRjaHNldCBicmluZ3MgaW5pdGlhbCBzdXBwb3J0IGZvciBTaWxpY29uIExhYnMgQ1BDIHBy
b3RvY29sLA0KPj4+Pj4+IHN0YW5kaW5nIGZvciBDby1Qcm9jZXNzb3IgQ29tbXVuaWNhdGlvbi4g
VGhpcyBwcm90b2NvbCBpcyB1c2VkIGJ5IHRoZQ0KPj4+Pj4+IEVGUjMyIFNlcmllcyBbMV0uIFRo
ZXNlIGRldmljZXMgb2ZmZXIgYSB2YXJpZXR5IGZvciByYWRpbyBwcm90b2NvbHMsDQo+Pj4+Pj4g
c3VjaCBhcyBCbHVldG9vdGgsIFotV2F2ZSwgWmlnYmVlIFsyXS4NCj4+Pj4+DQo+Pj4+PiBCZWZv
cmUgd2UgZ2V0IHRvbyBkZWVwIGludG8gdGhlIGRldGFpbHMgb2YgdGhlIHBhdGNoZXMsIHBsZWFz
ZSBjb3VsZA0KPj4+Pj4geW91IGRvIGEgY29tcGFyZS9jb250cmFzdCB0byBHcmV5YnVzLg0KPj4+
Pg0KPj4+PiBUaGFuayB5b3UgZm9yIHRoZSBwcm9tcHQgZmVlZGJhY2sgb24gdGhlIFJGQy4gV2Ug
dG9vayBhIGxvb2sgYXQgR3JleWJ1cw0KPj4+PiBpbiB0aGUgcGFzdCBhbmQgaXQgZGlkbid0IHNl
ZW0gdG8gZml0IG91ciBuZWVkcy4gT25lIG9mIHRoZSBtYWluIHVzZQ0KPj4+PiBjYXNlIHRoYXQg
ZHJvdmUgdGhlIGRldmVsb3BtZW50IG9mIENQQyB3YXMgdG8gc3VwcG9ydCBXaUZpIChpbg0KPj4+
PiBjb2V4aXN0ZW5jZSB3aXRoIG90aGVyIHJhZGlvIHN0YWNrcykgb3ZlciBTRElPLCBhbmQgZ2V0
IHRoZSBtYXhpbXVtDQo+Pj4+IHRocm91Z2hwdXQgcG9zc2libGUuIFdlIGNvbmNsdWRlZCB0aGF0
IHRvIGFjaGlldmUgdGhpcyB3ZSB3b3VsZCBuZWVkDQo+Pj4+IHBhY2tldCBhZ2dyZWdhdGlvbiwg
YXMgc2VuZGluZyBvbmUgZnJhbWUgYXQgYSB0aW1lIG92ZXIgU0RJTyBpcw0KPj4+PiB3YXN0ZWZ1
bCwgYW5kIG1hbmFnaW5nIFJhZGlvIENvLVByb2Nlc3NvciBhdmFpbGFibGUgYnVmZmVycywgYXMg
c2VuZGluZw0KPj4+PiBmcmFtZXMgdGhhdCB0aGUgUkNQIGlzIG5vdCBhYmxlIHRvIHByb2Nlc3Mg
d291bGQgZGVncmFkZSBwZXJmb3JtYW5jZS4NCj4+Pj4NCj4+Pj4gR3JleWJ1cyBkb24ndCBzZWVt
IHRvIG9mZmVyIHRoZXNlIGNhcGFiaWxpdGllcy4gSXQgc2VlbXMgdG8gYmUgbW9yZQ0KPj4+PiBn
ZWFyZWQgdG93YXJkcyBpbXBsZW1lbnRpbmcgUlBDLCB3aGVyZSB0aGUgaG9zdCB3b3VsZCBzZW5k
IGEgY29tbWFuZCwNCj4+Pj4gYW5kIHRoZW4gd2FpdCBmb3IgdGhlIGRldmljZSB0byBleGVjdXRl
IGl0IGFuZCB0byByZXNwb25kLiBGb3IgR3JleWJ1cycNCj4+Pj4gcHJvdG9jb2xzIHRoYXQgaW1w
bGVtZW50IHNvbWUgInN0cmVhbWluZyIgZmVhdHVyZXMgbGlrZSBhdWRpbyBvciB2aWRlbw0KPj4+
PiBjYXB0dXJlLCB0aGUgZGF0YSBzdHJlYW1zIGdvIHRvIGFuIEkyUyBvciBDU0kgaW50ZXJmYWNl
LCBidXQgaXQgZG9lc24ndA0KPj4+PiBzZWVtIHRvIGdvIHRocm91Z2ggYSBDUG9ydC4gU28gaXQg
c2VlbXMgdG8gYWN0IGFzIGEgYmFja2JvbmUgdG8gY29ubmVjdA0KPj4+PiBDUG9ydHMgdG9nZXRo
ZXIsIGJ1dCBoaWdoLXRocm91Z2hwdXQgdHJhbnNmZXJzIGhhcHBlbiBvbiBvdGhlciB0eXBlcyBv
Zg0KPj4+PiBsaW5rcy4gQ1BDIGlzIG1vcmUgYWJvdXQgbW92aW5nIGRhdGEgb3ZlciBhIHBoeXNp
Y2FsIGxpbmssIGd1YXJhbnRlZWluZw0KPj4+PiBvcmRlcmVkIGRlbGl2ZXJ5IGFuZCBhdm9pZGlu
ZyB1bm5lY2Vzc2FyeSB0cmFuc21pc3Npb25zIGlmIHJlbW90ZQ0KPj4+PiBkb2Vzbid0IGhhdmUg
dGhlIHJlc291cmNlcywgaXQncyBtdWNoIGxvd2VyIGxldmVsIHRoYW4gR3JleWJ1cy4NCj4+Pg0K
Pj4+IEFzIGlzIHNhaWQsIGkgZG9uJ3Qga25vdyBHcmV5YnVzIHRvbyB3ZWxsLiBJIGhvcGUgaXRz
IE1haW50YWluZXJzIGNhbg0KPj4+IGNvbW1lbnQgb24gdGhpcy4NCj4+Pg0KPj4+Pj4gQWxzbywg
dGhpcyBwYXRjaCBhZGRzIEJsdWV0b290aCwgeW91IHRhbGsgYWJvdXQgWi1XYXZlIGFuZCBaaWdi
ZWUuIEJ1dA0KPj4+Pj4gdGhlIEVGUjMyIGlzIGEgZ2VuZXJhbCBwdXJwb3NlIFNvQywgd2l0aCBJ
MkMsIFNQSSwgUFdNLCBVQVJULiBHcmV5YnVzDQo+Pj4+PiBoYXMgc3VwcG9ydCBmb3IgdGhlc2Us
IGFsdGhvdWdoIHRoZSBjb2RlIGlzIGN1cnJlbnQgaW4gc3RhZ2luZy4gQnV0DQo+Pj4+PiBmb3Ig
c3RhZ2luZyBjb2RlLCBpdCBpcyBhY3R1YWxseSBwcmV0dHkgZ29vZC4NCj4+Pj4NCj4+Pj4gSSBh
Z3JlZSB3aXRoIHlvdSB0aGF0IHRoZSBFRlIzMiBpcyBhIGdlbmVyYWwgcHVycG9zZSBTb0MgYW5k
IGV4cG9zaW5nDQo+Pj4+IGFsbCBhdmFpbGFibGUgcGVyaXBoZXJhbHMgd291bGQgYmUgZ3JlYXQs
IGJ1dCBtb3N0IGN1c3RvbWVycyBidXkgaXQgYXMNCj4+Pj4gYW4gUkNQIG1vZHVsZSB3aXRoIG9u
ZSBvciBtb3JlIHJhZGlvIHN0YWNrcyBlbmFibGVkLCBhbmQgdGhhdCdzIHRoZQ0KPj4+PiBzaXR1
YXRpb24gd2UncmUgdHJ5aW5nIHRvIGFkZHJlc3MuIE1heWJlIEkgaW50cm9kdWNlZCBhIGZyYW1l
d29yayB3aXRoDQo+Pj4+IGN1c3RvbSBidXMsIGRyaXZlcnMgYW5kIGVuZHBvaW50cyB3aGVyZSBp
dCB3YXMgdW5uZWNlc3NhcnksIHRoZSBnb2FsIGlzDQo+Pj4+IG5vdCB0byBiZSBzdXBlciBnZW5l
cmljIGJ1dCBvbmx5IHRvIHN1cHBvcnQgY29leGlzdGVuY2Ugb2Ygb3VyIHJhZGlvDQo+Pj4+IHN0
YWNrcy4NCj4+Pg0KPj4+IFRoaXMgbGVhZHMgdG8gbXkgbmV4dCBwcm9ibGVtLg0KPj4+DQo+Pj4g
aHR0cHM6Ly93d3cubm9yZGljc2VtaS5jb20vLS9tZWRpYS9Tb2Z0d2FyZS1hbmQtb3RoZXItZG93
bmxvYWRzL1Byb2R1Y3QtQnJpZWZzL25SRjUzNDAtU29DLVBCLnBkZg0KPj4+IE5vcmRpYyBTZW1p
Y29uZHVjdG9yIGhhcyB3aGF0IGFwcGVhcnMgdG8gYmUgYSBzaW1pbGFyIGRldmljZS4NCj4+Pg0K
Pj4+IGh0dHBzOi8vd3d3Lm1pY3JvY2hpcC5jb20vZW4tdXMvcHJvZHVjdHMvd2lyZWxlc3MtY29u
bmVjdGl2aXR5L2JsdWV0b290aC1sb3ctZW5lcmd5L21pY3JvY29udHJvbGxlcnMNCj4+PiBNaWNy
b2NoaXAgaGFzIGEgc2ltaWxhciBkZXZpY2UgYXMgd2VsbC4NCj4+Pg0KPj4+IGh0dHBzOi8vd3d3
LnRpLmNvbS9wcm9kdWN0L0NDMjY3NFIxMA0KPj4+IFRJIGhhcyBhIHNpbWlsYXIgZGV2aWNlLg0K
Pj4+DQo+Pj4gQW5kIG1heWJlIHRoZXJlIGFyZSBvdGhlcnM/DQo+Pj4NCj4+PiBBcmUgd2UgZ29p
bmcgdG8gZ2V0IGEgU2lsYWJzIENQQywgYSBOb3JkaWMgQ1BDLCBhIE1pY3JvY2hpcCBDUEMsIGEg
VEkNCj4+PiBDUEMsIGFuZCBhbiBBQ01FIENQQz8NCj4+Pg0KPj4+IEhvdyBkbyB3ZSBlbmQgdXAg
d2l0aCBvbmUgaW1wbGVtZW50YXRpb24/DQo+Pj4NCj4+PiBNYXliZSBHcmV5YnVzIGRvZXMgbm90
IGN1cnJlbnRseSBzdXBwb3J0IHlvdXIgc3RyZWFtaW5nIHVzZSBjYXNlIHRvbw0KPj4+IHdlbGws
IGJ1dCBpdCBpcyBhdCBsZWFzdCB2ZW5kb3IgbmV1dHJhbC4gQ2FuIGl0IGJlIGV4dGVuZGVkIGZv
cg0KPj4+IHN0cmVhbWluZz8NCj4+DQo+PiBJIGdldCB0aGUgc2VudGltZW50IHRoYXQgd2UgZG9u
J3Qgd2FudCBldmVyeSBzaW5nbGUgdmVuZG9yIHRvIHB1c2ggdGhlaXINCj4+IG93biBwcm90b2Nv
bHMgdGhhdCBhcmUgZXZlciBzbyBzbGlnaHRseSBkaWZmZXJlbnQuIFRvIGJlIGhvbmVzdCwgSSBk
b24ndA0KPj4ga25vdyBpZiBHcmV5YnVzIGNhbiBiZSBleHRlbmRlZCBmb3IgdGhhdCB1c2UgY2Fz
ZSwgb3IgaWYgaXQncyBzb21ldGhpbmcNCj4+IHRoZXkgYXJlIGludGVyZXN0ZWQgaW4gc3VwcG9y
dGluZy4gSSd2ZSBzdWJzY3JpYmVkIHRvIGdyZXlidXMtZGV2IHNvDQo+PiBob3BlZnVsbHkgbXkg
ZW1haWwgd2lsbCBnZXQgdGhyb3VnaCB0aGlzIHRpbWUgKHByZXZpb3VzIG9uZSBpcyBwZW5kaW5n
DQo+PiBhcHByb3ZhbCkuDQo+DQo+IEdyZXlidXMgd2FzIGRlc2lnbmVkIGZvciBhIHBhcnRpY3Vs
YXIgcGxhdGZvcm0sIGJ1dCB0aGUgaW50ZW50aW9uDQo+IHdhcyB0byBtYWtlIGl0IGV4dGVuc2li
bGUuICBJdCBjYW4gYmUgZXh0ZW5kZWQgd2l0aCBuZXcgcHJvdG9jb2xzLA0KPiBhbmQgSSBkb24n
dCB0aGluayBhbnlvbmUgaXMgb3Bwb3NlZCB0byB0aGF0Lg0KPg0KPj4gVW5mb3J0dW5hdGVseSwg
d2UncmUgZGVlcCBkb3duIHRoZSBDUEMgcm9hZCwgZXNwZWNpYWxseSBvbiB0aGUgZmlybXdhcmUN
Cj4+IHNpZGUuIEJsYW1lIG9uIG1lIGZvciBub3Qgc2VuZGluZyB0aGUgUkZDIHNvb25lciBhbmQg
Z2V0dGluZyBmZWVkYmFjaw0KPj4gZWFybGllciwgYnV0IGlmIHdlIGhhdmUgdG8gbWFzc2l2ZWx5
IGNoYW5nZSBvdXIgY291cnNlIG9mIGFjdGlvbiB3ZSBuZWVkDQo+PiBzb21lIGRlZ3JlZSBvZiBj
b25maWRlbmNlIHRoYXQgdGhpcyBpcyBhIHZpYWJsZSBhbHRlcm5hdGl2ZSBmb3INCj4+IGFjaGll
dmluZyBoaWdoLXRocm91Z2hwdXQgZm9yIFdpRmkgb3ZlciBTRElPLiBJIHdvdWxkIHJlYWxseSB2
YWx1ZSBhbnkNCj4+IGlucHV0IGZyb20gdGhlIEdyZXlidXMgZm9sa3Mgb24gdGhpcy4NCj4NCj4g
SSBraW5kIG9mIGFzc3VtZWQgdGhpcy4gIEknbSBzdXJlIEFuZHJldydzIG1lc3NhZ2Ugd2FzIG5v
dCB0aGF0DQo+IHdlbGNvbWUgZm9yIHRoYXQgcmVhc29uLCBidXQgaGUncyByaWdodCBhYm91dCB0
cnlpbmcgdG8gYWdyZWUgb24NCj4gc29tZXRoaW5nIGluIGNvbW1vbiBpZiBwb3NzaWJsZS4gIElm
IEdyZXlidXMgY2FuIHNvbHZlIGFsbCB5b3VyDQo+IHByb2JsZW1zLCB0aGUgbWFpbnRhaW5lcnMg
d2lsbCBzdXBwb3J0IHRoZSBjb2RlIGJlaW5nIG1vZGlmaWVkDQo+IHRvIHN1cHBvcnQgd2hhdCdz
IG5lZWRlZC4NCj4NCj4gKFRvIGJlIGNsZWFyLCBJIGRvbid0IGFzc3VtZSBHcmV5YnVzIHdpbGwg
c29sdmUgYWxsIHlvdXIgcHJvYmxlbXMuDQo+IEZvciBleGFtcGxlLCBVbmlQcm8gcHJvdmlkZXMg
YSByZWxpYWJsZSB0cmFuc3BvcnQsIHNvIHRoYXQncyB3aGF0DQo+IEdyZXlidXMgY3VycmVudGx5
IGV4cGVjdHMuKQ0KDQpJIGRvbid0IHJlYWxseSBrbm93IGFib3V0IFVuaVBybyBhbmQgSSdtIGxl
YXJuaW5nIGFib3V0IGl0IGFzIHRoZQ0KZGlzY3Vzc2lvbiBnb2VzLCBidXQgb25lIG9mIHRoZSBw
b2ludCBsaXN0ZWQgb24gV2lraXBlZGlhIGlzDQoicmVsaWFiaWxpdHkgLSBkYXRhIGVycm9ycyBk
ZXRlY3RlZCBhbmQgY29ycmVjdGFibGUgdmlhIHJldHJhbnNtaXNzaW9uIg0KDQpUaGlzIGlzIHdo
ZXJlIENQQyBjb3VsZCBjb21lIGluLCBwcm9iYWJseSB3aXRoIGEgZGlmZmVyZW50IG5hbWUgYW5k
IGENCnJlZHVjZWQgc2NvcGUsIGFzIGEgd2F5IHRvIGltcGxlbWVudCByZWxpYWJsZSB0cmFuc21p
c3Npb24gb3ZlciBVQVJULA0KU1BJLCBTRElPLCBieSBlbnN1cmluZyBkYXRhIGVycm9ycyBhcmUg
ZGV0ZWN0ZWQgYW5kIHBhY2tldHMNCnJldHJhbnNtaXR0ZWQgaWYgbmVjZXNzYXJ5LCBhbmQgYmUg
bGltaXRlZCB0byB0aGF0Lg0KDQpXaGF0J3MgbWlzc2luZyBmb3IgdXMgaW4gR3JleWJ1cywgYXMg
ZGlzY3Vzc2VkIGluIGEgc3VidGhyZWFkLCBpcw0KYXN5bmNocm9ub3VzIG9wZXJhdGlvbnMgdG8g
Zml0IGJldHRlciB3aXRoIHRoZSBuZXR3b3JrIHN0YWNrLCBidXQgSQ0KdGhpbmsgdGhhdCBjb3Vs
ZCBlYXNpbHkgYmUgYWRkZWQuDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpncmV5YnVzLWRldiBtYWlsaW5nIGxpc3QgLS0gZ3JleWJ1cy1kZXZAbGlzdHMu
bGluYXJvLm9yZwpUbyB1bnN1YnNjcmliZSBzZW5kIGFuIGVtYWlsIHRvIGdyZXlidXMtZGV2LWxl
YXZlQGxpc3RzLmxpbmFyby5vcmcK
