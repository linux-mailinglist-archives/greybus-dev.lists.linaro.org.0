Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AMzYAF7njWkm8gAAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Thu, 12 Feb 2026 15:44:46 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id B0C6012E6B6
	for <lists+greybus-dev@lfdr.de>; Thu, 12 Feb 2026 15:44:45 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id BDD56401F2
	for <lists+greybus-dev@lfdr.de>; Thu, 12 Feb 2026 14:44:44 +0000 (UTC)
Received: from mx0b-0024c301.pphosted.com (mx0b-0024c301.pphosted.com [148.163.153.153])
	by lists.linaro.org (Postfix) with ESMTPS id 5C8D0401E1
	for <greybus-dev@lists.linaro.org>; Thu, 12 Feb 2026 14:44:21 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=silabs.com header.s=pps12202023 header.b=sBGGih6v;
	dkim=pass header.d=silabs.com header.s=selector1 header.b=IL85ijIh;
	spf=pass (lists.linaro.org: domain of "prvs=050394110d=damien.riegel@silabs.com" designates 148.163.153.153 as permitted sender) smtp.mailfrom="prvs=050394110d=damien.riegel@silabs.com";
	arc=pass ("microsoft.com:s=arcselector10001:i=1");
	dmarc=pass (policy=reject) header.from=silabs.com
Received: from pps.filterd (m0101742.ppops.net [127.0.0.1])
	by mx0a-0024c301.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61BMnYg3335638;
	Thu, 12 Feb 2026 08:44:10 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps12202023;
	 bh=n6cRjDG0wG/9MD2V8DTsdBh3FlQESn+NT8YGQ45bU4w=; b=sBGGih6vdq6k
	F8A0Che3mDNF5MezI3GlBqqq898QEoB+1I5z/8g3PVi0E6FsATsEgFlAwdhr+Ni8
	1S7Rq+3jy+o/J0Cm7FgZg+AXPKEYYpktulyz10tEt376s+nXLK5iT3LQk2/hOUyl
	xlvpPSxl4haxMh5NIUyLvgBALTnEibwkKWjKjMzeP4LNFd1XwQPc7K8hq85S5gAD
	cQByPyN0l940MxTsgn1Sv59Z4P+McEomQoqguu8BYn063IAIOb3/s/W8FJxKNARC
	Wh6OUOGYIS/tqcDCkkA6WlnU1Iq2ZfhSBxbikPdVWWRtTLFlsEBlrQ91xXqtYHoY
	mUBemUcljA==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11020136.outbound.protection.outlook.com [52.101.201.136])
	by mx0a-0024c301.pphosted.com (PPS) with ESMTPS id 4c92w8sk2e-3
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 12 Feb 2026 08:44:10 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gzaH2r/fnZPF5O0xgK7iPzbyGtNsbDxykyAJFH3RJU16jgYlzH5E7GqCb6GmDOTFr3anyFsdJUFsHlYSlRWy1CcMH0FxCp39GPU/94gT65lkScms4GehA7K950lXEZoo/+cUNbtjcecKtE8Zcb/e0kWXcmnBHvxDZgVtpeWCe8V3KNKkZVdHMYWH8vPWe0+sGhH9u/SMdO7JhtKvyw10QtUp4gpjCkEcbYwV7nU3RD9PuILdg4+5b/rFrLiP/UM8+59of3RX6OW4SN8bSl4UPsKashEdqocT5f3O0nauqc+RKfmZHJdtYPzlp1FD6cR5r7PAbLkO3YIchxf1w3Pq+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n6cRjDG0wG/9MD2V8DTsdBh3FlQESn+NT8YGQ45bU4w=;
 b=MMS8qBMY7F3b1G3+wcTIr0RmuXW7aw6v0e8ro2SUpiD/kS2mxxCHkBNxK9hPi+O+zbj3KRDBEm/13XQViH4UFGQrTffcz7jD0c1K3wY7r8pzQC/GnV3pLH6xYitPPtxQujEnL3ZHIK/ZJNpLBiOjMV9H7ZLraKi/0hpOI00AW8tU9L/2g6ozlU0pSY1wfOz0lo5/a1zV7GogP5wjvL9+N6NPzuzfAFGWwgPFYAoIwqkq+otdCKAToMskIwapdd7BpOLVJL511GhtWJdYFZ30Mo/h1cdFpJVGGXq3KEOdtpa0FKlDLH88OOuvtY7pFvJ/ojJh04I1EdJ/28wO4XdDEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silabs.com; dmarc=pass action=none header.from=silabs.com;
 dkim=pass header.d=silabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n6cRjDG0wG/9MD2V8DTsdBh3FlQESn+NT8YGQ45bU4w=;
 b=IL85ijIh/q0Pq+FnaYrtc7cFH4Sd6Zag27/LEpxVAZTH7Qc6IiUzca1UaK54Oo4Y6fIcbfl7Ws0T7zk3NH05D/mG6EXsgl8Ft9QgaEXXTlfckxgjS7HvJL9qN0hyl/Iix1nkhKKtdZNFyC6SkgjsU8aQmmoI5MYrNgxQQbgeVMU=
Received: from DS0PR11MB8205.namprd11.prod.outlook.com (2603:10b6:8:162::17)
 by CY8PR11MB7082.namprd11.prod.outlook.com (2603:10b6:930:52::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.13; Thu, 12 Feb
 2026 14:44:07 +0000
Received: from DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::2de6:bc88:2af7:3583]) by DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::2de6:bc88:2af7:3583%3]) with mapi id 15.20.9611.008; Thu, 12 Feb 2026
 14:44:07 +0000
From: =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
To: greybus-dev@lists.linaro.org, Johan Hovold <johan@kernel.org>,
        Alex Elder <elder@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org
Date: Thu, 12 Feb 2026 09:43:40 -0500
Message-ID: <20260212144352.93043-3-damien.riegel@silabs.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260212144352.93043-1-damien.riegel@silabs.com>
References: <20260212144352.93043-1-damien.riegel@silabs.com>
X-ClientProxiedBy: YQBPR0101CA0124.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:5::27) To DS0PR11MB8205.namprd11.prod.outlook.com
 (2603:10b6:8:162::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8205:EE_|CY8PR11MB7082:EE_
X-MS-Office365-Filtering-Correlation-Id: 22b91da6-cfb7-44ea-e945-08de6a452c41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?aEFpY0NncllCN21Zd3FMSm1wMzE5UEZhbm9RYjNnR2ZDaGE2VmpGdmNSZi9I?=
 =?utf-8?B?RVUwZHozMzFGSy9Jdjl5eTJ0QzNvaFN1SStvK1hnNVhjTnVqZUc0WDlMVmpB?=
 =?utf-8?B?UUE0czAzeUZSS3JTL09CWTNTZmV0ckY3T0MrYmh0eWZTTE83aUpveXRLbnZn?=
 =?utf-8?B?UEVRQkZNbnhNbGVpTjl5U3JMZ1diWm1HSHduM0w2SDY2QzVpd0piaWc3STU1?=
 =?utf-8?B?SmlSRlFSZDZmby9GUnZQTFdkZkc4czAySTZqTUE5WFdPaGc4djk0UmZsOTA2?=
 =?utf-8?B?OGRhQm93V0FrWE9JU2h5S29wMEF4Z044RzBUTUNhamRqbHlKL1dwRHVzRXN0?=
 =?utf-8?B?ZFdDNkpwTTZndGNJVWVnbFRQeXlOWmcwTzBGMmlUbVIyTi94Q3dBR1VRaWVp?=
 =?utf-8?B?L3ZQR3RiNTgycUZ2V2xKdDFkdXpiT2YxaytTMCtvbGZuSE5CUXRPNDVJWWVo?=
 =?utf-8?B?eDBkUlFDcFJEOTNkRUx2RDRtSWhVZHNvdC9uT28xUGgySmVjOVk3Q2Y2OEps?=
 =?utf-8?B?WnBpT0JSRzUwVjdOZWEzMGg3Qzh1dGd4d1N0NThtTlBGVVAzVkVSbm5Zc3hL?=
 =?utf-8?B?NzJ0VHprOURJa3g2NFZZNGc0UldWL1BPaFhQSCtlYWcvQ2xVQTRPOUV1eGxn?=
 =?utf-8?B?RGg3T0g1aVN4TjEvd08xamFjTS9GazF3RXlFN2xqT1duWjBnNll6RFl6OGJ4?=
 =?utf-8?B?V1hjbGhOU09EUG1zTnhNNnRHSTJUbUtZSVRiOXQxaVc4dTVQRjkvbEtCTmEr?=
 =?utf-8?B?SkxsU291KzFYY3Z1LzZsV0VqYTRJaDk0Nk41Zy9JeFJNSkoyRWR2UnlqMksy?=
 =?utf-8?B?SHM3YWpTR0dUbXNpT0d2MC9WUjdFVTB4QnpDczZtRkcraktoQXZ0NVJmbTgv?=
 =?utf-8?B?bTZCV0FGVVgyZ25CZDRSanpXSVJtVk1aMkNxdlZRVm9SM2FxODl2Q3BUUDdY?=
 =?utf-8?B?UlVFdVh0MER4dVZibk5iK1U0NWZxZE91SkFCWjhlMDEzZ3BLZ0NDcW1pazR2?=
 =?utf-8?B?RHBsUDNiS2FMNnBjWDdIMjdUUmFLYkFyUmVwUE9lTUFYL0xZWHZkbmdXZG9v?=
 =?utf-8?B?K2JOSVVOTDVJdjhwaGdmTGNTY3VlVWEzOWs0SzlFRVZSZVpxekljSUUvUHlX?=
 =?utf-8?B?c1ZrMHNIRGtFYjUyS3Z0V1ZZZCt2T2RmREZsZkthMlkrOVJMR0pnZmtGellh?=
 =?utf-8?B?WTBPTmtQaEFZeG5YVk05V2xWNGRnWk1kcUdMVW5GdkY2WmtZc0M0b3hMUXo5?=
 =?utf-8?B?SDZrWGl2MlJQUzV3WFFYdDFpOUp2U1NKVklFSmRWS0dXZVZxZC9UTmpqSUZr?=
 =?utf-8?B?ZWpMcmFWTFdNcGxwdWRmbU05UUR6SzhkQldGT0pHY2J4cGZWaVF0dC82T2hn?=
 =?utf-8?B?NlJ4L2xMb1JTOXFZdlRsL0NtTEVJOElqcGY4VEVCLzJjZjIxTmFVNGdrdWU5?=
 =?utf-8?B?emw0VlZRcmgvcVNCS3ozZkNsbmxMWnhZeXBYbUIzRjc1dVNhbXVJdzZubFpZ?=
 =?utf-8?B?Uk45UXRHRGhIYmF6elhyZFJuSllzeUFDaUoxVFZuQmZuc1hncUd1anFnU3Bu?=
 =?utf-8?B?alpGQ0ZuaXJKSGRKeUp2eGlRTDJlRitZTENIQ29BaEJlOEtvRHpPQU1WckxG?=
 =?utf-8?B?L1UzbUhHR3F1MFF2aTZzcjVJczlaOEdtbVBEenovM24zbDZBcGsxYlN1bjg5?=
 =?utf-8?B?dStSWWhrWmFqbDNhZlRDWmNuN05oQWZNSVB0bVFwNFJkVGpSbzg2b3hLY3I2?=
 =?utf-8?B?ZjJRSjdHRktKMncrYXpYVUZQU3c0bmlqejVsWDFQRkVielhuZ1I0MlFhOXVI?=
 =?utf-8?B?ck9udTU5K0RqdlpKNk9kQzFwa09JVmJBdXdyZmNCRUc5czRrcWd2RzVjczUz?=
 =?utf-8?B?L1B5N0Znb1NVU3dZaWJDSVFzT0NqeVcwa2hEN2tpWmplQkRTb0pYaUJmeWNX?=
 =?utf-8?B?dDhJc3NuVytiR2FOdTY0OEh0TGV3NWtNZlU0djZFK1d4TFB3eklJWVI2a3dO?=
 =?utf-8?B?aHFxM0FhRGhNbWgzTTczc1Y3S0toV1BzbTZqSjByMEEyU0M3QzJyQW8xbk1n?=
 =?utf-8?B?NlZwQjFhY3Q4UC91Qng4VGN1dWlmcHFtZk1URnZZSWRRbnNoK08wdlRLWVJn?=
 =?utf-8?B?NklhSFVVN3VyaXFTYXplOWp1cjBRdmFTaFF3SmdMMGJ0bG1yb2swZVRtczlU?=
 =?utf-8?Q?tLvrgeXT0rkH/Vn6iauxAII=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8205.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RXNibkNjaGtCZmJ4c3RoUkJiUTMwczhDTzJrRWVVUmxkelpJb0lZY3BRRVZw?=
 =?utf-8?B?VzhrS2hSZ01jRWFiaDFFZ0FkSzlBT3NiNmtFNk8zSDk0cmk4dTV3Z3NNMVN5?=
 =?utf-8?B?UlpyeHF5M1ZYNDhNWnhZVTFkVDBmWHlSc0pqNDdETXVKRDFpb21zQ3FrdlRl?=
 =?utf-8?B?dGt3eVdPZVF6Q2VHLzBDTGNrN3VjMm9WMzM0WTBZbGtoM3pjdUIwSDNtRkk4?=
 =?utf-8?B?TEcybGI3ZXBiQkwxdlJRSFVzSkFsZHBlQ003NzBaRERKNjFabmw1QkJoK0p1?=
 =?utf-8?B?TFpSQXl0Y2FrMzhmRXZiUVZKNml3Um5oTkxzVGhxMHNkbnh6UVZXR1lWTW5E?=
 =?utf-8?B?NjBTUE1ybnVFZGw4RUF4SmJmMTRnNnZiK1p4b3I0L0phb0NRM1MwMmlEMGx3?=
 =?utf-8?B?VmxsSVhoOFFEZXUzcUJ4MjBmalNRSEJtV05ZVW9MWDR0VlJ4OUtzVzBoM2o1?=
 =?utf-8?B?cG5TeEcyR3ZXS01iU005Sm1WdlkyM2dVMmFEL1ZyRjY1WTBFOURHTWM0em43?=
 =?utf-8?B?VGJMb1UxTFA1bVpVVXZsWnFKZC9iRnR4ejRDL3o0NThReU85eW1Sb2VWTFVI?=
 =?utf-8?B?ZGhQTDlJdGRYT0lxUlRuZk1xT3BBOHhCeVhkcklrbjV4UTFISWFUUVd0TmVv?=
 =?utf-8?B?MkN3RkpPak1oeFU1VkROaDhkVmVpaTN0TnVZbkZsODNKdTBsSDc3alA5ckxG?=
 =?utf-8?B?VzV3NGhlWHE3c291czBNWjlxSFNZQTViZjZna3JCWUdBTW9BUHZUMEJJMTZD?=
 =?utf-8?B?MFpWR211ckRIN2Q2UEdLTC9jcjBjdVczbWtIOFdiSmhMOFlpTDYrR0pMajNs?=
 =?utf-8?B?dTBCSUJ3QTZHcmM4NjVyLzZUd0lWSjBqaGFmK0NFRTJ6SWxqZGNremNiWlpm?=
 =?utf-8?B?RjE4TjZMZFQ0ZEVqS2RwVERWVEVRYVl2OWFNRnhqdmdNeG9wUERINkJ2QlVt?=
 =?utf-8?B?eGlEdTRHWFBXQzBDL2dUaXBrVm5XaHlMZVJpMWgwd3Q4cTJDR3JuNWhhYzBO?=
 =?utf-8?B?czI3R01lTnlRZWFZaEFRcndyMVFIZnpWZENyTUtPZmJaaFZQTldVeWM1QVhP?=
 =?utf-8?B?bWhmUDZ0dDNzK2ZkZ3RpMUFZSWJVNE1pTHVPTlNNT0NWSDFESExFWnIwVkFE?=
 =?utf-8?B?QjAzVzZ5OVhzT2cxZGVrOWc0NFZKenJsdVQ4OVVMWGNiejFjdU15S04rOHpy?=
 =?utf-8?B?UFdzRExTaXZ3STdhMjJMZFptZkx2NzZPSGx0ZjBIOVlIaFNNWHBtcW16NlQ3?=
 =?utf-8?B?dEFrUkxscHV3MFF4UmdhV1ZrVHdKQXo0ZUVVVDJidkNTQWprTzlmMTdrNnV1?=
 =?utf-8?B?UVExanRINytGOVJRWktqdjFUMXFTbjFRcnlwWUlsVkxicU90VlFva2xWaGYw?=
 =?utf-8?B?RFA0dTRJUTk4UGVmOEo5UWg3cHVpZzRPSHRpSVRGcnhGTFAxV09MeUJRTEgy?=
 =?utf-8?B?Umc4SlAzK1p4dzVoVC9MdUZCeEVkTzBtekcrUGhMVzNFWTlSR043WldmVS9v?=
 =?utf-8?B?alQxNjFYVGlydXNoZmY5V0M3dUJMSW9VOWZwMUlOVllTekNhdHVvOUZIajEv?=
 =?utf-8?B?azFXaWdrZmVqa3pGbzhxdklrZUVWMkdUWnkwSzhOQ1p3bXM2ZlNzY0piSlJu?=
 =?utf-8?B?anBCUkNabitBamlMV1NpaUc1NEovOE02OGoxRWpRMmtmRmtRdUk4RTR1VkJ3?=
 =?utf-8?B?RHdsaVpiMFVRcnB5Qmlkc05sQjVZNEZrR3BOSGc4UGdhbzNWa2ZJQkI2c3gr?=
 =?utf-8?B?RDFid2MwR3dqR0Q0TUsxVkNadG9VTUxGYXlrNWJndWZHTm5NMFk3U2NocGRG?=
 =?utf-8?B?ZnNtK3lqb0MvSFRIOW8rQjREMUQwRndENEczR01UcFVGd1pNOUNvM1NhZFV0?=
 =?utf-8?B?OE5MajArbUprVkVXNmFjLy8xOGxHT3JwNTN4T2F3U1gxYWRLTTA5WDVJckNE?=
 =?utf-8?B?Z1lON1FOaERRSkVYU0hGenAvU2RJdkZta3FVcGRlY0k3UG1RU0c3ZjRLMXh0?=
 =?utf-8?B?YldDTXd4QkRMcG5zczBwNDlENGJNSXFneFRWUitVZDRDVFF2VVBoRUszeUpa?=
 =?utf-8?B?V3AxVUlGS1d2TGp1ejlySndLMmRZQzc4S0VCeVpWQjBFUjhrdXRXSncwVHRS?=
 =?utf-8?B?L21uRkxIL2h2YUR5OHlscDEwTDZvanNpb3hTNnQ4WGVBM0pBRERlZmxsejQx?=
 =?utf-8?B?ckUzait0TklaanhwRlFDcHhNeHFNQnBUZmpCWkU3RkNlUzdrM29CMTZYSDc2?=
 =?utf-8?B?L0dRS3g1Qy80NXpqUnpEWERYa1U5UU9jUHhuZkpsQkFIVzRwNWhSclhYM3R0?=
 =?utf-8?B?VEJod1dBTkx4S0pnR3dNcnN2WUNYNCtGN2pqYlFPL2dnUWY0VWFvUT09?=
X-OriginatorOrg: silabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22b91da6-cfb7-44ea-e945-08de6a452c41
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8205.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 14:44:06.3208
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 54dbd822-5231-4b20-944d-6f4abcd541fb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 367rQFuF44Na4m3N7CNLtczK1qjiflNAyRhrH26oxsHMEwes4flx44rMVA5W0WvvMuh6OtCBdQzayh7w8HlJOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7082
X-Authority-Analysis: v=2.4 cv=Ne3rFmD4 c=1 sm=1 tr=0 ts=698de73a cx=c_pps
 a=SjKxu3n00dGHhKqS4WZ18w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=M51BFTxLslgA:10
 a=i1IsUcr2s-wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=2AEO0YjSAAAA:8 a=iqUPcmWXN_vvxTOgPeMA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEyMDExMSBTYWx0ZWRfXy29Fm9xTx36Y
 wbCfGVwNgtLAsA+FMpprHb9LfRN3dwjja69BY/7sFxgPV9NDk4prWDsEOQiQ8+3ZAUrf6tReEEI
 mbI4jAmxpYuDpvbvqwPWbDooCDuWRV3X50Ct9lBO6FZLPRcDNp5j+LDTBeL7gWKtEhtuIvviRQU
 381ydTO4N0VwaGoRRVwnO4+d0dtrAAmXtQqYflVzvWw92lisJlRLbErRkRwuqTLDSc+LBDR3Dx9
 zn00nNaxQpR4tXP92yROzazawQIMk6GUdFNYhOXd0X5QtWhOLXYRirKDezutdAdVS3hwggXukmC
 uOKx4MIChySFoK1iBcQV0HFVumBFI/APIplEBo994+JJLel5e+pHivLBRqYixOU3GAs0xTY82fv
 zMDPISrrmRIAbWG3INX31ZV/tmDkrSydeJesAj56ry5i1nhqk0WYKUY1Z8Te/0SQv2gKlzzYpjn
 ktRWBj+LRDJMGqFrqXA==
X-Proofpoint-ORIG-GUID: GoEfKHp9Ow2qQRgacygDa2sVYt8kQj0w
X-Proofpoint-GUID: GoEfKHp9Ow2qQRgacygDa2sVYt8kQj0w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_04,2026-02-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 spamscore=0 phishscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602120111
X-Spamd-Bar: ----
Message-ID-Hash: X5GZVY5SALTEMEXM4DF7C2YI3H6KMTJR
X-Message-ID-Hash: X5GZVY5SALTEMEXM4DF7C2YI3H6KMTJR
X-MailFrom: prvs=050394110d=damien.riegel@silabs.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Silicon Labs Kernel Team <linux-devel@silabs.com>, =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v3 02/14] greybus: cpc: introduce CPC cport structure
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/X5GZVY5SALTEMEXM4DF7C2YI3H6KMTJR/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.59 / 15.00];
	DMARC_POLICY_REJECT(2.00)[silabs.com : SPF not aligned (relaxed),reject];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	R_DKIM_REJECT(1.00)[silabs.com:s=pps12202023,silabs.com:s=selector1];
	MID_CONTAINS_FROM(1.00)[];
	R_SPF_ALLOW(-0.20)[+mx:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	GREYLIST(0.00)[pass,meta];
	FROM_NEQ_ENVFROM(0.00)[damien.riegel@silabs.com,greybus-dev-bounces@lists.linaro.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[silabs.com:-]
X-Rspamd-Queue-Id: B0C6012E6B6
X-Rspamd-Action: no action

QSBudW1iZXIgb2YgQ1BDIGZlYXR1cmVzLCBsaWtlIHJldHJhbnNtaXNzaW9uIG9yIHJlbW90ZSdz
IHJlY2VpdmUNCndpbmRvdywgYXJlIGNwb3J0LWJhc2VkLiBJbiBvcmRlciB0byBwcmVwYXJlIGZv
ciB0aGVzZSBmZWF0dXJlcywNCmludHJvZHVjZSBhIENQQyBDUG9ydCBjb250ZXh0IHN0cnVjdHVy
ZS4NCg0KVGhlIENQQyBIb3N0IERldmljZSBtb2R1bGUgbm93IGltcGxlbWVudHMgY3BvcnRfYWxs
b2NhdGUgYW5kDQpjcG9ydF9yZWxlYXNlIGNhbGxiYWNrcyBpbiBvcmRlciB0byBhbGxvY2F0ZSBh
bmQgcmVsZWFzZSB0aGVzZQ0Kc3RydWN0dXJlcyB3aGVuIHJlcXVlc3RlZCBieSBHcmV5YnVzIG1v
ZHVsZS4NCg0KU2lnbmVkLW9mZi1ieTogRGFtaWVuIFJpw6lnZWwgPGRhbWllbi5yaWVnZWxAc2ls
YWJzLmNvbT4NCi0tLQ0KQ2hhbmdlcyBpbiB2MzoNCiAgLSBzaW1wbGlmeSBjcGNfaGRfY3BvcnRf
YWxsb2NhdGUgc28gdGhhdCBjcG9ydCB3aXRoIElEICJpImlzIGF0IG9mZnNldA0KICAgICJpIiBp
biBjcGNfaGQtPmNwb3J0cyBhcnJheQ0KDQogZHJpdmVycy9ncmV5YnVzL2NwYy9NYWtlZmlsZSB8
ICAgMiArLQ0KIGRyaXZlcnMvZ3JleWJ1cy9jcGMvY3BjLmggICAgfCAgMjkgKysrKysrKysrDQog
ZHJpdmVycy9ncmV5YnVzL2NwYy9jcG9ydC5jICB8ICAzNyArKysrKysrKysrKw0KIGRyaXZlcnMv
Z3JleWJ1cy9jcGMvaG9zdC5jICAgfCAxMTUgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKy0NCiBkcml2ZXJzL2dyZXlidXMvY3BjL2hvc3QuaCAgIHwgIDEyICsrKysNCiA1IGZpbGVz
IGNoYW5nZWQsIDE5MyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBkcml2ZXJzL2dyZXlidXMvY3BjL2NwYy5oDQogY3JlYXRlIG1vZGUgMTAwNjQ0IGRy
aXZlcnMvZ3JleWJ1cy9jcGMvY3BvcnQuYw0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncmV5YnVz
L2NwYy9NYWtlZmlsZSBiL2RyaXZlcnMvZ3JleWJ1cy9jcGMvTWFrZWZpbGUNCmluZGV4IDQ5MDk4
MmEwZmY1Li4zZDUwZjhjNTQ3MyAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3JleWJ1cy9jcGMvTWFr
ZWZpbGUNCisrKyBiL2RyaXZlcnMvZ3JleWJ1cy9jcGMvTWFrZWZpbGUNCkBAIC0xLDYgKzEsNiBA
QA0KICMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjANCiANCi1nYi1jcGMteSA6PSBo
b3N0Lm8NCitnYi1jcGMteSA6PSBjcG9ydC5vIGhvc3Qubw0KIA0KICMgQ1BDIGNvcmUNCiBvYmot
JChDT05GSUdfR1JFWUJVU19DUEMpCSs9IGdiLWNwYy5vDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cmV5YnVzL2NwYy9jcGMuaCBiL2RyaXZlcnMvZ3JleWJ1cy9jcGMvY3BjLmgNCm5ldyBmaWxlIG1v
ZGUgMTAwNjQ0DQppbmRleCAwMDAwMDAwMDAwMC4uMzkxNWE3ZmJjNGYNCi0tLSAvZGV2L251bGwN
CisrKyBiL2RyaXZlcnMvZ3JleWJ1cy9jcGMvY3BjLmgNCkBAIC0wLDAgKzEsMjkgQEANCisvKiBT
UERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMCAqLw0KKy8qDQorICogQ29weXJpZ2h0IChj
KSAyMDI1LCBTaWxpY29uIExhYm9yYXRvcmllcywgSW5jLg0KKyAqLw0KKw0KKyNpZm5kZWYgX19D
UENfSA0KKyNkZWZpbmUgX19DUENfSA0KKw0KKyNpbmNsdWRlIDxsaW51eC9kZXZpY2UuaD4NCisj
aW5jbHVkZSA8bGludXgvZ3JleWJ1cy5oPg0KKyNpbmNsdWRlIDxsaW51eC90eXBlcy5oPg0KKw0K
Ky8qKg0KKyAqIHN0cnVjdCBjcGNfY3BvcnQgLSBDUEMgY3BvcnQNCisgKiBAaWQ6IGNwb3J0IElE
DQorICogQGNwY19oZDogcG9pbnRlciB0byB0aGUgQ1BDIGhvc3QgZGV2aWNlIHRoaXMgY3BvcnQg
YmVsb25ncyB0bw0KKyAqLw0KK3N0cnVjdCBjcGNfY3BvcnQgew0KKwl1MTYgaWQ7DQorDQorCXN0
cnVjdCBjcGNfaG9zdF9kZXZpY2UgKmNwY19oZDsNCit9Ow0KKw0KK3N0cnVjdCBjcGNfY3BvcnQg
KmNwY19jcG9ydF9hbGxvYyh1MTYgY3BvcnRfaWQsIGdmcF90IGdmcF9tYXNrKTsNCit2b2lkIGNw
Y19jcG9ydF9yZWxlYXNlKHN0cnVjdCBjcGNfY3BvcnQgKmNwb3J0KTsNCisNCitpbnQgY3BjX2Nw
b3J0X21lc3NhZ2Vfc2VuZChzdHJ1Y3QgY3BjX2Nwb3J0ICpjcG9ydCwgc3RydWN0IGdiX21lc3Nh
Z2UgKm1lc3NhZ2UsIGdmcF90IGdmcF9tYXNrKTsNCisNCisjZW5kaWYNCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dyZXlidXMvY3BjL2Nwb3J0LmMgYi9kcml2ZXJzL2dyZXlidXMvY3BjL2Nwb3J0LmMN
Cm5ldyBmaWxlIG1vZGUgMTAwNjQ0DQppbmRleCAwMDAwMDAwMDAwMC4uODhiZGIyZjgxODINCi0t
LSAvZGV2L251bGwNCisrKyBiL2RyaXZlcnMvZ3JleWJ1cy9jcGMvY3BvcnQuYw0KQEAgLTAsMCAr
MSwzNyBAQA0KKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wDQorLyoNCisgKiBD
b3B5cmlnaHQgKGMpIDIwMjUsIFNpbGljb24gTGFib3JhdG9yaWVzLCBJbmMuDQorICovDQorDQor
I2luY2x1ZGUgImNwYy5oIg0KKyNpbmNsdWRlICJob3N0LmgiDQorDQorLyoqDQorICogY3BjX2Nw
b3J0X2FsbG9jKCkgLSBBbGxvY2F0ZSBhbmQgaW5pdGlhbGl6ZSBDUEMgY3BvcnQuDQorICogQGNw
b3J0X2lkOiBjcG9ydCBJRC4NCisgKiBAZ2ZwX21hc2s6IEdGUCBtYXNrIGZvciBhbGxvY2F0aW9u
Lg0KKyAqDQorICogUmV0dXJuOiBQb2ludGVyIHRvIGFsbG9jYXRlZCBhbmQgaW5pdGlhbGl6ZWQg
Y3BjX2Nwb3J0LCBvciBOVUxMIG9uIGZhaWx1cmUuDQorICovDQorc3RydWN0IGNwY19jcG9ydCAq
Y3BjX2Nwb3J0X2FsbG9jKHUxNiBjcG9ydF9pZCwgZ2ZwX3QgZ2ZwX21hc2spDQorew0KKwlzdHJ1
Y3QgY3BjX2Nwb3J0ICpjcG9ydDsNCisNCisJY3BvcnQgPSBremFsbG9jKHNpemVvZigqY3BvcnQp
LCBnZnBfbWFzayk7DQorCWlmICghY3BvcnQpDQorCQlyZXR1cm4gTlVMTDsNCisNCisJY3BvcnQt
PmlkID0gY3BvcnRfaWQ7DQorDQorCXJldHVybiBjcG9ydDsNCit9DQorDQordm9pZCBjcGNfY3Bv
cnRfcmVsZWFzZShzdHJ1Y3QgY3BjX2Nwb3J0ICpjcG9ydCkNCit7DQorCWtmcmVlKGNwb3J0KTsN
Cit9DQorDQoraW50IGNwY19jcG9ydF9tZXNzYWdlX3NlbmQoc3RydWN0IGNwY19jcG9ydCAqY3Bv
cnQsIHN0cnVjdCBnYl9tZXNzYWdlICptZXNzYWdlLCBnZnBfdCBnZnBfbWFzaykNCit7DQorCXJl
dHVybiBjcG9ydC0+Y3BjX2hkLT5kcml2ZXItPm1lc3NhZ2Vfc2VuZChjcG9ydC0+Y3BjX2hkLCBj
cG9ydC0+aWQsIG1lc3NhZ2UsIGdmcF9tYXNrKTsNCit9DQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cmV5YnVzL2NwYy9ob3N0LmMgYi9kcml2ZXJzL2dyZXlidXMvY3BjL2hvc3QuYw0KaW5kZXggODA1
MTY1MTdmZjYuLjNkZGE1YjA2NTkwIDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncmV5YnVzL2NwYy9o
b3N0LmMNCisrKyBiL2RyaXZlcnMvZ3JleWJ1cy9jcGMvaG9zdC5jDQpAQCAtNyw2ICs3LDcgQEAN
CiAjaW5jbHVkZSA8bGludXgvZ3JleWJ1cy5oPg0KICNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4N
CiANCisjaW5jbHVkZSAiY3BjLmgiDQogI2luY2x1ZGUgImhvc3QuaCINCiANCiBzdGF0aWMgc3Ry
dWN0IGNwY19ob3N0X2RldmljZSAqZ2JfaGRfdG9fY3BjX2hkKHN0cnVjdCBnYl9ob3N0X2Rldmlj
ZSAqaGQpDQpAQCAtMTQsMTIgKzE1LDEwMSBAQCBzdGF0aWMgc3RydWN0IGNwY19ob3N0X2Rldmlj
ZSAqZ2JfaGRfdG9fY3BjX2hkKHN0cnVjdCBnYl9ob3N0X2RldmljZSAqaGQpDQogCXJldHVybiAo
c3RydWN0IGNwY19ob3N0X2RldmljZSAqKSZoZC0+aGRfcHJpdjsNCiB9DQogDQorc3RhdGljIHN0
cnVjdCBjcGNfY3BvcnQgKmNwY19oZF9nZXRfY3BvcnRfdW5sb2NrZWQoc3RydWN0IGNwY19ob3N0
X2RldmljZSAqY3BjX2hkLCB1MTYgY3BvcnRfaWQpDQorew0KKwlpZiAoY3BvcnRfaWQgPj0gQVJS
QVlfU0laRShjcGNfaGQtPmNwb3J0cykpDQorCQlyZXR1cm4gTlVMTDsNCisNCisJcmV0dXJuIGNw
Y19oZC0+Y3BvcnRzW2Nwb3J0X2lkXTsNCit9DQorDQorc3RhdGljIHN0cnVjdCBjcGNfY3BvcnQg
KmNwY19oZF9nZXRfY3BvcnQoc3RydWN0IGNwY19ob3N0X2RldmljZSAqY3BjX2hkLCB1MTYgY3Bv
cnRfaWQpDQorew0KKwlzdHJ1Y3QgY3BjX2Nwb3J0ICpjcG9ydDsNCisNCisJbXV0ZXhfbG9jaygm
Y3BjX2hkLT5sb2NrKTsNCisJY3BvcnQgPSBjcGNfaGRfZ2V0X2Nwb3J0X3VubG9ja2VkKGNwY19o
ZCwgY3BvcnRfaWQpOw0KKwltdXRleF91bmxvY2soJmNwY19oZC0+bG9jayk7DQorDQorCXJldHVy
biBjcG9ydDsNCit9DQorDQorc3RhdGljIGludCBjcGNfaGRfbWVzc2FnZV9zZW5kKHN0cnVjdCBj
cGNfaG9zdF9kZXZpY2UgKmNwY19oZCwgdTE2IGNwb3J0X2lkLA0KKwkJCSAgICAgICBzdHJ1Y3Qg
Z2JfbWVzc2FnZSAqbWVzc2FnZSwgZ2ZwX3QgZ2ZwX21hc2spDQorew0KKwlzdHJ1Y3QgY3BjX2Nw
b3J0ICpjcG9ydDsNCisNCisJY3BvcnQgPSBjcGNfaGRfZ2V0X2Nwb3J0KGNwY19oZCwgY3BvcnRf
aWQpOw0KKwlpZiAoIWNwb3J0KSB7DQorCQlkZXZfZXJyKGNwY19oZF9kZXYoY3BjX2hkKSwgIm1l
c3NhZ2Vfc2VuZDogY3BvcnQgJXUgbm90IGZvdW5kXG4iLCBjcG9ydF9pZCk7DQorCQlyZXR1cm4g
LUVJTlZBTDsNCisJfQ0KKw0KKwlyZXR1cm4gY3BjX2Nwb3J0X21lc3NhZ2Vfc2VuZChjcG9ydCwg
bWVzc2FnZSwgZ2ZwX21hc2spOw0KK30NCisNCitzdGF0aWMgaW50IGNwY19oZF9jcG9ydF9hbGxv
Y2F0ZShzdHJ1Y3QgY3BjX2hvc3RfZGV2aWNlICpjcGNfaGQsIGludCBjcG9ydF9pZCwgdW5zaWdu
ZWQgbG9uZyBmbGFncykNCit7DQorCXN0cnVjdCBjcGNfY3BvcnQgKmNwb3J0Ow0KKwlpbnQgcmV0
Ow0KKw0KKwltdXRleF9sb2NrKCZjcGNfaGQtPmxvY2spOw0KKwlpZiAoY3BvcnRfaWQgPCAwKSB7
DQorCQlmb3IgKGNwb3J0X2lkID0gMDsgY3BvcnRfaWQgPCBBUlJBWV9TSVpFKGNwY19oZC0+Y3Bv
cnRzKTsgY3BvcnRfaWQrKykgew0KKwkJCWlmIChjcGNfaGQtPmNwb3J0c1tjcG9ydF9pZF0gPT0g
TlVMTCkNCisJCQkJYnJlYWs7DQorCQl9DQorCX0NCisNCisJaWYgKGNwb3J0X2lkID49IEFSUkFZ
X1NJWkUoY3BjX2hkLT5jcG9ydHMpKSB7DQorCQlyZXQgPSAtRU5PU1BDOw0KKwkJZ290byB1bmxv
Y2s7DQorCX0NCisNCisJY3BvcnQgPSBjcGNfaGRfZ2V0X2Nwb3J0X3VubG9ja2VkKGNwY19oZCwg
Y3BvcnRfaWQpOw0KKwlpZiAoY3BvcnQpIHsNCisJCXJldCA9IC1FQlVTWTsNCisJCWdvdG8gdW5s
b2NrOw0KKwl9DQorDQorCWNwb3J0ID0gY3BjX2Nwb3J0X2FsbG9jKGNwb3J0X2lkLCBHRlBfS0VS
TkVMKTsNCisJaWYgKCFjcG9ydCkgew0KKwkJcmV0ID0gLUVOT01FTTsNCisJCWdvdG8gdW5sb2Nr
Ow0KKwl9DQorDQorCWNwb3J0LT5jcGNfaGQgPSBjcGNfaGQ7DQorDQorCWNwY19oZC0+Y3BvcnRz
W2Nwb3J0X2lkXSA9IGNwb3J0Ow0KKwlyZXQgPSBjcG9ydF9pZDsNCisNCit1bmxvY2s6DQorCW11
dGV4X3VubG9jaygmY3BjX2hkLT5sb2NrKTsNCisNCisJcmV0dXJuIHJldDsNCit9DQorDQorc3Rh
dGljIHZvaWQgY3BjX2hkX2Nwb3J0X3JlbGVhc2Uoc3RydWN0IGNwY19ob3N0X2RldmljZSAqY3Bj
X2hkLCB1MTYgY3BvcnRfaWQpDQorew0KKwlzdHJ1Y3QgY3BjX2Nwb3J0ICpjcG9ydDsNCisNCisJ
bXV0ZXhfbG9jaygmY3BjX2hkLT5sb2NrKTsNCisNCisJY3BvcnQgPSBjcGNfaGQtPmNwb3J0c1tj
cG9ydF9pZF07DQorCWlmIChjcG9ydCkgew0KKwkJY3BjX2Nwb3J0X3JlbGVhc2UoY3BvcnQpOw0K
KwkJY3BjX2hkLT5jcG9ydHNbY3BvcnRfaWRdID0gTlVMTDsNCisJfQ0KKw0KKwltdXRleF91bmxv
Y2soJmNwY19oZC0+bG9jayk7DQorfQ0KKw0KIHN0YXRpYyBpbnQgY3BjX2diX21lc3NhZ2Vfc2Vu
ZChzdHJ1Y3QgZ2JfaG9zdF9kZXZpY2UgKmdiX2hkLCB1MTYgY3BvcnRfaWQsDQogCQkJICAgICAg
IHN0cnVjdCBnYl9tZXNzYWdlICptZXNzYWdlLCBnZnBfdCBnZnBfbWFzaykNCiB7DQogCXN0cnVj
dCBjcGNfaG9zdF9kZXZpY2UgKmNwY19oZCA9IGdiX2hkX3RvX2NwY19oZChnYl9oZCk7DQogDQot
CXJldHVybiBjcGNfaGQtPmRyaXZlci0+bWVzc2FnZV9zZW5kKGNwY19oZCwgY3BvcnRfaWQsIG1l
c3NhZ2UsIGdmcF9tYXNrKTsNCisJcmV0dXJuIGNwY19oZF9tZXNzYWdlX3NlbmQoY3BjX2hkLCBj
cG9ydF9pZCwgbWVzc2FnZSwgZ2ZwX21hc2spOw0KIH0NCiANCiBzdGF0aWMgdm9pZCBjcGNfZ2Jf
bWVzc2FnZV9jYW5jZWwoc3RydWN0IGdiX21lc3NhZ2UgKm1lc3NhZ2UpDQpAQCAtMjcsMTIgKzEx
NywzMyBAQCBzdGF0aWMgdm9pZCBjcGNfZ2JfbWVzc2FnZV9jYW5jZWwoc3RydWN0IGdiX21lc3Nh
Z2UgKm1lc3NhZ2UpDQogCS8qIE5vdCBpbXBsZW1lbnRlZCAqLw0KIH0NCiANCitzdGF0aWMgaW50
IGNwY19nYl9jcG9ydF9hbGxvY2F0ZShzdHJ1Y3QgZ2JfaG9zdF9kZXZpY2UgKmdiX2hkLCBpbnQg
Y3BvcnRfaWQsIHVuc2lnbmVkIGxvbmcgZmxhZ3MpDQorew0KKwlzdHJ1Y3QgY3BjX2hvc3RfZGV2
aWNlICpjcGNfaGQgPSBnYl9oZF90b19jcGNfaGQoZ2JfaGQpOw0KKw0KKwlyZXR1cm4gY3BjX2hk
X2Nwb3J0X2FsbG9jYXRlKGNwY19oZCwgY3BvcnRfaWQsIGZsYWdzKTsNCit9DQorDQorc3RhdGlj
IHZvaWQgY3BjX2diX2Nwb3J0X3JlbGVhc2Uoc3RydWN0IGdiX2hvc3RfZGV2aWNlICpnYl9oZCwg
dTE2IGNwb3J0X2lkKQ0KK3sNCisJc3RydWN0IGNwY19ob3N0X2RldmljZSAqY3BjX2hkID0gZ2Jf
aGRfdG9fY3BjX2hkKGdiX2hkKTsNCisNCisJcmV0dXJuIGNwY19oZF9jcG9ydF9yZWxlYXNlKGNw
Y19oZCwgY3BvcnRfaWQpOw0KK30NCisNCiBzdGF0aWMgc3RydWN0IGdiX2hkX2RyaXZlciBjcGNf
Z2JfZHJpdmVyID0gew0KIAkuaGRfcHJpdl9zaXplID0gc2l6ZW9mKHN0cnVjdCBjcGNfaG9zdF9k
ZXZpY2UpLA0KIAkubWVzc2FnZV9zZW5kID0gY3BjX2diX21lc3NhZ2Vfc2VuZCwNCiAJLm1lc3Nh
Z2VfY2FuY2VsID0gY3BjX2diX21lc3NhZ2VfY2FuY2VsLA0KKwkuY3BvcnRfYWxsb2NhdGUgPSBj
cGNfZ2JfY3BvcnRfYWxsb2NhdGUsDQorCS5jcG9ydF9yZWxlYXNlID0gY3BjX2diX2Nwb3J0X3Jl
bGVhc2UsDQogfTsNCiANCitzdGF0aWMgdm9pZCBjcGNfaGRfaW5pdChzdHJ1Y3QgY3BjX2hvc3Rf
ZGV2aWNlICpjcGNfaGQpDQorew0KKwltdXRleF9pbml0KCZjcGNfaGQtPmxvY2spOw0KK30NCisN
CiBzdHJ1Y3QgY3BjX2hvc3RfZGV2aWNlICpjcGNfaGRfY3JlYXRlKHN0cnVjdCBjcGNfaGRfZHJp
dmVyICpkcml2ZXIsIHN0cnVjdCBkZXZpY2UgKnBhcmVudCkNCiB7DQogCXN0cnVjdCBjcGNfaG9z
dF9kZXZpY2UgKmNwY19oZDsNCkBAIC01MSw2ICsxNjIsOCBAQCBzdHJ1Y3QgY3BjX2hvc3RfZGV2
aWNlICpjcGNfaGRfY3JlYXRlKHN0cnVjdCBjcGNfaGRfZHJpdmVyICpkcml2ZXIsIHN0cnVjdCBk
ZXZpYw0KIAljcGNfaGQtPmdiX2hkID0gaGQ7DQogCWNwY19oZC0+ZHJpdmVyID0gZHJpdmVyOw0K
IA0KKwljcGNfaGRfaW5pdChjcGNfaGQpOw0KKw0KIAlyZXR1cm4gY3BjX2hkOw0KIH0NCiBFWFBP
UlRfU1lNQk9MX0dQTChjcGNfaGRfY3JlYXRlKTsNCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dyZXli
dXMvY3BjL2hvc3QuaCBiL2RyaXZlcnMvZ3JleWJ1cy9jcGMvaG9zdC5oDQppbmRleCBmNTVmZWIz
MDNmNC4uYzNmMmY1NmE5MzkgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dyZXlidXMvY3BjL2hvc3Qu
aA0KKysrIGIvZHJpdmVycy9ncmV5YnVzL2NwYy9ob3N0LmgNCkBAIC04LDExICs4LDEzIEBADQog
DQogI2luY2x1ZGUgPGxpbnV4L2RldmljZS5oPg0KICNpbmNsdWRlIDxsaW51eC9ncmV5YnVzLmg+
DQorI2luY2x1ZGUgPGxpbnV4L211dGV4Lmg+DQogI2luY2x1ZGUgPGxpbnV4L3R5cGVzLmg+DQog
DQogI2RlZmluZSBHQl9DUENfTVNHX1NJWkVfTUFYIDQwOTYNCiAjZGVmaW5lIEdCX0NQQ19OVU1f
Q1BPUlRTIDgNCiANCitzdHJ1Y3QgY3BjX2Nwb3J0Ow0KIHN0cnVjdCBjcGNfaG9zdF9kZXZpY2U7
DQogDQogc3RydWN0IGNwY19oZF9kcml2ZXIgew0KQEAgLTI1LDEyICsyNywyMiBAQCBzdHJ1Y3Qg
Y3BjX2hkX2RyaXZlciB7DQogICogc3RydWN0IGNwY19ob3N0X2RldmljZSAtIENQQyBob3N0IGRl
dmljZS4NCiAgKiBAZ2JfaGQ6IHBvaW50ZXIgdG8gR3JleWJ1cyBIb3N0IERldmljZSB0aGlzIGRl
dmljZSBiZWxvbmdzIHRvLg0KICAqIEBkcml2ZXI6IGRyaXZlciBvcGVyYXRpb25zLg0KKyAqIEBs
b2NrOiBtdXRleCB0byBzeW5jaHJvbml6ZSBhY2Nlc3MgdG8gY3BvcnQgYXJyYXkuDQorICogQGNw
b3J0czogYXJyYXkgb2YgY3BvcnQgcG9pbnRlcnMgYWxsb2NhdGVkIGJ5IEdyZXlidXMgY29yZS4N
CiAgKi8NCiBzdHJ1Y3QgY3BjX2hvc3RfZGV2aWNlIHsNCiAJc3RydWN0IGdiX2hvc3RfZGV2aWNl
ICpnYl9oZDsNCiAJY29uc3Qgc3RydWN0IGNwY19oZF9kcml2ZXIgKmRyaXZlcjsNCisNCisJc3Ry
dWN0IG11dGV4IGxvY2s7IC8qIFN5bmNocm9uaXplIGFjY2VzcyB0byBjcG9ydHMgKi8NCisJc3Ry
dWN0IGNwY19jcG9ydCAqY3BvcnRzW0dCX0NQQ19OVU1fQ1BPUlRTXTsNCiB9Ow0KIA0KK3N0YXRp
YyBpbmxpbmUgc3RydWN0IGRldmljZSAqY3BjX2hkX2RldihzdHJ1Y3QgY3BjX2hvc3RfZGV2aWNl
ICpjcGNfaGQpDQorew0KKwlyZXR1cm4gJmNwY19oZC0+Z2JfaGQtPmRldjsNCit9DQorDQogc3Ry
dWN0IGNwY19ob3N0X2RldmljZSAqY3BjX2hkX2NyZWF0ZShzdHJ1Y3QgY3BjX2hkX2RyaXZlciAq
ZHJpdmVyLCBzdHJ1Y3QgZGV2aWNlICpwYXJlbnQpOw0KIGludCBjcGNfaGRfYWRkKHN0cnVjdCBj
cGNfaG9zdF9kZXZpY2UgKmNwY19oZCk7DQogdm9pZCBjcGNfaGRfcHV0KHN0cnVjdCBjcGNfaG9z
dF9kZXZpY2UgKmNwY19oZCk7DQotLSANCjIuNTIuMA0KDQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpncmV5YnVzLWRldiBtYWlsaW5nIGxpc3QgLS0gZ3Jl
eWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpUbyB1bnN1YnNjcmliZSBzZW5kIGFuIGVtYWlsIHRv
IGdyZXlidXMtZGV2LWxlYXZlQGxpc3RzLmxpbmFyby5vcmcK
