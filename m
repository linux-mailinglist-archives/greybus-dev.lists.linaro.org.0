Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id CF8BFC5DBFD
	for <lists+greybus-dev@lfdr.de>; Fri, 14 Nov 2025 16:08:23 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id AA4A23F842
	for <lists+greybus-dev@lfdr.de>; Fri, 14 Nov 2025 15:08:22 +0000 (UTC)
Received: from mx0b-0024c301.pphosted.com (mx0b-0024c301.pphosted.com [148.163.153.153])
	by lists.linaro.org (Postfix) with ESMTPS id 6878E3F806
	for <greybus-dev@lists.linaro.org>; Fri, 14 Nov 2025 15:08:18 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=silabs.com header.s=pps12202023 header.b=IoWOU+iM;
	dkim=pass header.d=silabs.com header.s=selector1 header.b=AgK1v6k9;
	dmarc=pass (policy=reject) header.from=silabs.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1");
	spf=pass (lists.linaro.org: domain of Damien.Riegel@silabs.com designates 148.163.153.153 as permitted sender) smtp.mailfrom=Damien.Riegel@silabs.com
Received: from pps.filterd (m0101742.ppops.net [127.0.0.1])
	by mx0a-0024c301.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AECXOfD2440870;
	Fri, 14 Nov 2025 09:08:15 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps12202023;
	 bh=jx65y8uNXwM6wrvnwtFMVQfh6aglACWZTYQL7z7qeLE=; b=IoWOU+iMoQZF
	TMYyN+mhHhA6XTJr/oHKi50hhJI8RUBbCEvRDNBHfi+LkPjS2uZXIktW+v8D2dS0
	0FmYzVVZzePFuAc7gxnsoBdNJErWcP4c13es+RTbSePtAhcRJJimtCQIQsNiV9rQ
	7IBiYMZ3ru4I3qWOr6L2KuPuEYn0WohWACqihRJDRKMoF1BbsrCMzRVQmDxeJmBQ
	o6FS5UULFvwZP2fGGs3gX8iIUmAFG7NUMOGayAi1BE+M6jr3R89IU7rRFbuGICpt
	6+UI28j4ldaWiM67jY8qcP3lc5m0TDhX761sOfVFSZ67F5RLN/AsuNaSMftmVZmM
	KnKaXum+dQ==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11021081.outbound.protection.outlook.com [52.101.62.81])
	by mx0a-0024c301.pphosted.com (PPS) with ESMTPS id 4adr8fsm46-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 14 Nov 2025 09:08:15 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZxospTj8zemikGNMm4TGDi3wOVuXcXBm7VonVtxV5q6b1QlmfrvOlNlCUETLOq+DgLfUADsEtZieMQFYHPzIyjBUNpvUzxgVA3zPfZdki4Zwu4v9y21RhfgvRO6hJQEaAG7f8ozlqIEANDKISUpHD40kAu0hlYejR7oUOQxJJARACz/w7YkhE6k/JJbFxIOqvD8SgKRsp+9S94dYxF/ssYcltvKBrGdtl6MtUB7737fUyM/OBb94jPxDZCSXP0lGmIS4/+Tv6OERgJMQdx/m51kDEr28/oTAWfRGlngB76f5FKIuFqca8wydcwHRtwzI9IeWorbLkAbhzdgVsA/3hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jx65y8uNXwM6wrvnwtFMVQfh6aglACWZTYQL7z7qeLE=;
 b=mgIJoAToSY0XKpUyhK/rFTwWJAolQ9VYUlyLFCsMY/w9dndAByuyTHNBKr7IOcQMuz+Yy43QZZa32k2dwm6fNnGtMc5ey34MVQOYtdhxlNIuPl+DDGBLKhurPsZyLxg/R41SCTh5+5+qmoOS3wRWU4v1qNYjMa+1Txt5Pz2RZyNcrg6LBVTluSfQuYIszrxJUVjKTT4r8FiJ6pjC24Ibu12tRbZ5Urybu+FA6KC9A4089KQwjSfdry7dkCIic3lcBrenLoy7CsanRZ0p95eVNj63ecOqp7cbTHi7fUZZGwr5ScgiuV2J8IyJFYC8G0WJG1r+GHQL4HxAGt8sRBC7yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silabs.com; dmarc=pass action=none header.from=silabs.com;
 dkim=pass header.d=silabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jx65y8uNXwM6wrvnwtFMVQfh6aglACWZTYQL7z7qeLE=;
 b=AgK1v6k9mAa2LpZNpZHL8RcsgRJ5IlcTkI5ZqMi4RW4p1o/yetxmOlFYaincvMO/Niq0LZTqAg0nqxg+TNp/3cKE1RmpUH+ojSm3326XeYxX0dCFaI5UYSdMsJaT7RJLPRBnhOAPirYetqoTf32HnmIlpdocXpdp8tb97XNsFvw=
Received: from DS0PR11MB8205.namprd11.prod.outlook.com (2603:10b6:8:162::17)
 by CH3PR11MB8774.namprd11.prod.outlook.com (2603:10b6:610:1cd::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Fri, 14 Nov
 2025 15:08:12 +0000
Received: from DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::c508:9b04:3351:524a]) by DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::c508:9b04:3351:524a%5]) with mapi id 15.20.9320.018; Fri, 14 Nov 2025
 15:08:12 +0000
From: =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
To: greybus-dev@lists.linaro.org, Johan Hovold <johan@kernel.org>,
        Alex Elder <elder@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org
Date: Fri, 14 Nov 2025 10:07:29 -0500
Message-ID: <20251114150738.32426-4-damien.riegel@silabs.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251114150738.32426-1-damien.riegel@silabs.com>
References: <20251114150738.32426-1-damien.riegel@silabs.com>
X-ClientProxiedBy: MA5P287CA0046.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:175::12) To DS0PR11MB8205.namprd11.prod.outlook.com
 (2603:10b6:8:162::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8205:EE_|CH3PR11MB8774:EE_
X-MS-Office365-Filtering-Correlation-Id: b495c8e0-1e52-42c3-870c-08de238fa0ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?OUFQSUZlMXBMY2l6b3hnejlUcmIrZXNPMzBNYzRwQlpxR2MvRzUrZWk3WVpO?=
 =?utf-8?B?MVAzSHJOTGovTklFWm9HajJHZC93UFBWa3hlUVFqbm5FcXhLMVFoK2JMVEIx?=
 =?utf-8?B?anA3S0JzRkFuOFhqcmhxZ25vRlBNajZ6TXJPbktXMXZTSVhFRzRybDBvendz?=
 =?utf-8?B?L0dwdlN5QVA5K0VZWTNNOWpLNythZkpLYUlaNHdxNFhnVnlFekJxdzcwVTRE?=
 =?utf-8?B?NnhtTEVwM1IrSE04eWpYN21CN0RRN0VoVUFsYzNReEk0OEdnK0VTSVZrUDFV?=
 =?utf-8?B?MFNZR1luZHZKSzFibXNxWXBaRVNtRGk4VnpFSU9TdFRTaVFuc1phMVNIa2hB?=
 =?utf-8?B?UElGTW9qQ0FiMmp6bjYrNjFPTmFST1dYa3RWWlZvUG9pNXVlUXBqY3Y5MUZQ?=
 =?utf-8?B?SSsvMC9zRXliZHRIcVFuQ29IMjZKUzdKTFcyYnZzNXhzazVmY0l2V3laU3lz?=
 =?utf-8?B?bUpGaW91c0ZyRWRySXg2SWNQbzNuTjZTY1djYnNTaVFYRHNOOWFwNlZyT04v?=
 =?utf-8?B?blEvNzBGZUZPZ0NUSVh3RS9oZ0l3bStINzFXRERXVVhWRVVjSFlqR2hXbUNK?=
 =?utf-8?B?NFRleGc1TkduV2IxcVlhU2xZUDJLVU1VL1dzVnN0STF5SkE4SFBNMHVmTDg3?=
 =?utf-8?B?eHFSQ2Rwdis0TllKbFRyeXRzL1RxWXY0ZlZaaFlrYk5VNDZKRlFXSjQ3UDM1?=
 =?utf-8?B?U1ZPWHBGL2x0OW9yK0ZaZlFBbkNGM0lON3o5OHNmSHd5VUFTSmpnN3dvUk5w?=
 =?utf-8?B?UmVZKzJoTFE0UFVDSEYxc2gvenkxOElRcTB3MEl5N1lTTTZJeXcrdXZYUm95?=
 =?utf-8?B?VjRSdUJiL2NXL3lFcnMrcFFxNSs5Y3owZDRUWXhybkRlUHNHQkYrL3FVQVJw?=
 =?utf-8?B?V1NIWmc3OTdoeEx0bjAxV1hWR1JueTIrazZweGx5WTIvd1BoekdnSklGNFFS?=
 =?utf-8?B?QWQ5cjZWd2pOUkVISGY3SWkvQmw2R1J5RGszVUR4MER2NUt2NUdiQlE5TjRt?=
 =?utf-8?B?WnlEalp6M3RFdWhuUUY5TC8xZ3Y3MWRVaFdabGc1VW9MN0RsaSs5bmpwcjFZ?=
 =?utf-8?B?VHNRZFlmcTkwdjdFNllCSXVyRThKYUo0R0hpV0ZZRWd6THpRQzM4L1BOTko4?=
 =?utf-8?B?bFRmU2F4RytKS3JFWGduSEFqZVVlRHA4R1ZXTTRSMkdNVGI4Mm5hbkJwZUtq?=
 =?utf-8?B?bXhjanZWcEd6enM3UUZZS0J1Q3NQclprdXpMdm1wMStCcnJaMGNSTUwzVzlp?=
 =?utf-8?B?Z3Q5WVpFcmhzZXpSeWpZRnpmQUdJb1lKZHpBZUtzTyt0Z2JMQXR2UzZQSGww?=
 =?utf-8?B?YXdIODM4UXhZYjZSVTIwUnQ1RGg2dzJjV203VUwyM0QvbzBveTNSTzJFbnp1?=
 =?utf-8?B?dHpTaFg2Mk9EVGNSR3BVbGlIdS84S2UxWmtjVStnam5wb2psSHJNbmhCMEIw?=
 =?utf-8?B?UUtUcE95eWxPZmVoUDFjaHRQbXNkeXRtZXhxcmRrQTRvWnYrNjRyVU9HaCt3?=
 =?utf-8?B?UHQyZkRiNms0eHh0MXpXRi9pTXZHWDQrWFhjOFZEWEVCS2lDNlpud3Yvai8z?=
 =?utf-8?B?QWdaRGtVMVpDMUg3aXp0Zk5mSCtVODdXcEJneUw5czBPQ0JRaXpvQlJSZ0Jy?=
 =?utf-8?B?WlRYcmliTTdVUXQwTmFzUUhpZU0xbGdRK3FjMjI1NFhOZFgrMXdrd3RuMkND?=
 =?utf-8?B?NkhNN2tlR3RIOWY3UlVhSmtReW4wa1JiMFl5VWRTUUl3UGR5MUxIZEJBOFZX?=
 =?utf-8?B?QmxWMDNZSTBmM0dxaUVvczduUlFOWVIxSEtFUHBQS2djUUtIRWZNSk9kdG0v?=
 =?utf-8?B?WjR5djFucThuRU5Gc2RKQ3NIelJlUGVzdjlMOFBOOFhqTFArSDVtK0owNzdp?=
 =?utf-8?B?dnpyRE1lc2Fqc1F0VTkyOG40UTdpeEZqQ2tKOFhKcm1qcEpHbUYyWlJjelcv?=
 =?utf-8?B?bEp1RHRBQ2NIN2YxMmVTVVoxS0o3aVRIZXZGZlAxZXlnZlEzY2syeXM4MTYr?=
 =?utf-8?B?VTBzUjh1U01YZDBCTVc3NnRBOXhBUExJcytFOVRaQmFmMHplNDBER1lOYjdS?=
 =?utf-8?Q?y/1a6s?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8205.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TjRWdlZ5dHV5K0JzZ05BQU5qSzNpTXYzRE1KS01QTVIzTjB3MkxTRElUUERj?=
 =?utf-8?B?d3NvckdTRWRKVGd1RlQyNWZrbGdDVEg3WGR3d204eVFIY1I1eWNqcTZWNG00?=
 =?utf-8?B?VzVOOGpqUFE4Z1JIUG5maWFLQ3NraVVzbGVsandUc2dJVmxzdVlmeG10MkxR?=
 =?utf-8?B?aitGN0pZaVp6NnQyVGZOdENIdVBNQnQxcDMwR1l1SjZWcmg3Wm10eHJoMEI3?=
 =?utf-8?B?emwyVk9POUduWTRIQ2hMZThpb1pBZVgzc1dpVDdyMHBlTHZlaUFnZnorUzZO?=
 =?utf-8?B?eDlMV3duNUdDNk5xUm15SzkrZmFiTUxSNk9rM1MwZDk0YlMxQ2hNQVNVTFdq?=
 =?utf-8?B?UVVaMndlTnNIOUVxQVRIRlBHYy9YSnk2bncxRExuTm1oN1lVMjlzTEwrZEEz?=
 =?utf-8?B?U0dQUU5kNFB3Kzh1VFdCNXd4NEozSWIxOTZNVWZhNkhaamxkRGdWK0t3VHNi?=
 =?utf-8?B?ZUNzN0RJTVQyOEFXeEVXR1pTb0hmbC9aTFBTU0FUYlJ3a0ZiUG5vYzl0ekM2?=
 =?utf-8?B?N0NlTDlyOUhIZkVXL3ZjdEtjamdQYVZuL1E4anpXYnRudmxOZE5CSTFrRk0x?=
 =?utf-8?B?K2JrVVpsRlpOY09CdlFpSEZQUzkxUjlFZ2VwVzY3YnNjdkdoY2tOcmRnaGI2?=
 =?utf-8?B?bldLZVRCdHVzSHh4VmNEYXFXRXN5aXR2TFgxV2tLUklWL0Y5SGZyUTVZWkRU?=
 =?utf-8?B?QW54WkpaTVBzZldlS3YrMXR0QVZ4eStDdWNqdUhHZGdnV0k3dUlwaUxIZlhB?=
 =?utf-8?B?eUk5citFWFRPTU9JbGhiSGtVYnUrM0xLa2tRTEQ1cGZBNHU4eElGYmREcE1s?=
 =?utf-8?B?QzJJYTd5VU1QMVdTcExPY3JBUVZXRWgxd0swOWFHLzlqbW5jMUYydHg1SWo2?=
 =?utf-8?B?LysxV1lybXkyUXBkdk1qcUtHMy9URGRpWUk2eU11MEhOZXk4ME12cTB2emlq?=
 =?utf-8?B?azVodFQ4ditGcStQa2RaTzNRYUlQc0hoTTZDRlpDNDFJMHpXRXQ4cTdFR0Mz?=
 =?utf-8?B?NENYTWV1Mm00ZDViQXVTTW8zKzhIL1daWjJnVDRtN0RnRElEMGtDa0haZzZV?=
 =?utf-8?B?ckpFMUQzdXlnVGRLMEpxTTlVOEFBL3RlMHd2MHd3NWVaRjF3bGl6REYrbHgz?=
 =?utf-8?B?dGg4WWtsU0pqWHdSU3M3ZENHazIxcEJFK0NOQ0g1SzZ0d2RmT3MwT1ZtWDdr?=
 =?utf-8?B?ak80QUVkemx5RDNjSGtaK290N0djNkhFeHM2UXZ1OTlNVGwwQW1UdkNWNzQ4?=
 =?utf-8?B?ZVlnTVh5N0dXNlhZa2xFcWpKM2prR3FCQVhTdTltd2dvbGpkdFppdzVqSEdq?=
 =?utf-8?B?TkxvaVp2UW0xL3N4RkpieXV4bFpGOGVlZWY5VWNhTXR1dXJmL1hmNitHNVRP?=
 =?utf-8?B?ZjlLWUR0NjZtSmlQSFlsSFUrOE5UaEc0WnJCbW9hZmRSTE96THFsYjJwQkt6?=
 =?utf-8?B?cjBJU2orWVg3aHdlTlFWYXlaaldTb0dKKzRnNmx3cEFWV3kyRU5KdkR0NjVV?=
 =?utf-8?B?bjJkaCtEeW1uV3krdit4bUFuQmx3dFVaMnVpTXh3SkNrdDZoQ0ZqY2pWZzVv?=
 =?utf-8?B?SzJRY1ZTcWhFbjYxRHAxU3AwZTNDT0UxbEMxcGtlSjhOT3pwTi9xUUZERlpl?=
 =?utf-8?B?aWhEOWN0dUZCLzBjbkRyOTdYQ0FUcERmc0xDWDdFODcwMDNzcjZRLzQ2U0J0?=
 =?utf-8?B?bTBaS09FZjZMV3FEQjgzQ2RyUEtvVkJQdUNLYy9JR2RWZTdTZ1gzNFFzOFk1?=
 =?utf-8?B?REZqYU4xUjhVd1UvQ25QaHdyUDBCd1FvZHJVN2JvTUdaS1h1UDRqUVdXNWZP?=
 =?utf-8?B?NHJ6bG9uWTBsdThTc3RxMzNyNE1zV25YT012N3ZTMUJlK0F4VzRqY24veUVE?=
 =?utf-8?B?RmxUVFVrLzlLUWZKVkdLZjk0ZkI5ZnhGdmtlTGdSWktRS1FYaS9BdERHVGVV?=
 =?utf-8?B?UXN4MlIxRktFbFVZYlM3b3hGK2dLZXhKdFVONDJseHYxVEY0QlBZOWVaY3dK?=
 =?utf-8?B?emRhMVUrbkY4MUlKS1V5b1pWWklMU2JTZzdoSnd3dXFSZXNsUnphbk91QWxC?=
 =?utf-8?B?TDZOVEczbGtyS0x5ZDZHdEFZQnpROFVUK01ZYUlVYlptRnZrRHpQZ1NOcFBj?=
 =?utf-8?Q?mlk4LTulQYv++sxLtmcQMZgv1?=
X-OriginatorOrg: silabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b495c8e0-1e52-42c3-870c-08de238fa0ff
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8205.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 15:08:12.5002
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 54dbd822-5231-4b20-944d-6f4abcd541fb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RcM/eklVFRteZX49NiurP3+QUYTY1aDZiYS49+fJomKqkqUOGLgKWZmHCXvmlQ6ua+WTDufAHK3U2JjIsIKIOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8774
X-Proofpoint-ORIG-GUID: y8L6t2eTFt1ID7RsFFx7bGOsKzW8NpY4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDEyMSBTYWx0ZWRfX+L2bo9VxnBva
 QT/L4pTkWBA7vk+FZTMRK3mE1RoutFCt8324vDZ9FXWW9f7rysjKSeMdO0DwdtdvT4si8V7URPy
 GhKlGqfNYW4krzvksG2QtJ7EwHC3xQLiZAQspKE64GqLMfEUz/CMxglJsqrTTs7HqYi2DWrpGi9
 xHb1Ik3hrZiapa8sY7Gf6glRgxtareC2mZn+ko+N4UuzTgQw3iYQu1/qDqM7atqejyqtjD9mhvM
 wfgVy9IVtM+nsmm/of9vbQirPqKrsFUw7pIlr2OziC1Ipb2h5lNmuiqbfdZQlbYEfqFXgD0OT4V
 pii1CyF0VWXScR8Kec5OZqcivb9eX6m90bHxzqrvsAG27jgkz13OIkMJ0lIO4tKAoXE5PdL5qMg
 gAi2eYh1ArRKbIyD+p9oFN0Z3vp6lw==
X-Authority-Analysis: v=2.4 cv=BYPVE7t2 c=1 sm=1 tr=0 ts=691745df cx=c_pps
 a=7ywGlyDdJUFJDTdbuALIzQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=M51BFTxLslgA:10
 a=i1IsUcr2s-wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=2AEO0YjSAAAA:8
 a=UI2V7ICqOKO9W4d5kokA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: y8L6t2eTFt1ID7RsFFx7bGOsKzW8NpY4
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
X-Rspamd-Queue-Id: 6878E3F806
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
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_IN_DNSWL_NONE(0.00)[52.101.62.81:received];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DNSWL_BLOCKED(0.00)[2603:10b6:8:162::17:received,148.163.153.153:from];
	DKIM_TRACE(0.00)[silabs.com:+]
X-Rspamd-Action: no action
Message-ID-Hash: EL2HSEN2ZRGITZDAS3WJW5JKGB4R2A23
X-Message-ID-Hash: EL2HSEN2ZRGITZDAS3WJW5JKGB4R2A23
X-MailFrom: Damien.Riegel@silabs.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Silicon Labs Kernel Team <linux-devel@silabs.com>, =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [RFC PATCH v2 03/12] greybus: cpc: use socket buffers instead of gb_message in TX path
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/EL2HSEN2ZRGITZDAS3WJW5JKGB4R2A23/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

Q1BDIGNvbWVzIHdpdGggaXRzIG93biBoZWFkZXIsIHRoYXQgaXMgbm90IHlldCBpbXBsZW1lbnRl
ZC4gV2l0aG91dCBza2IsDQp0aGUgQ1BDIGhvc3QgZGV2aWNlIGRyaXZlcnMgaGF2ZSB0byBnZXQg
dHdvIHBvaW50ZXJzIHRvIGdldCBhIGZ1bGwNCnBhY2tldDogb25lIHBvaW50ZXIgdG8gdGhlIENQ
QyBoZWFkZXIgYW5kIG9uZSBwb2ludGVyIHRvIHRoZSBHQiBtZXNzYWdlLg0KSW4gb3JkZXIgdG8g
bWFrZSB0aGVpciBpbXBsZW1lbnRhdGlvbnMgc2ltcGxlciwgY29udmVydCB0aGUgR0IgbWVzc2Fn
ZQ0KaW50byBhbiBTS0IuDQoNClNpZ25lZC1vZmYtYnk6IERhbWllbiBSacOpZ2VsIDxkYW1pZW4u
cmllZ2VsQHNpbGFicy5jb20+DQotLS0NCiBkcml2ZXJzL2dyZXlidXMvY3BjL2NwYy5oICAgfCAx
MSArKysrKysrKystDQogZHJpdmVycy9ncmV5YnVzL2NwYy9jcG9ydC5jIHwgMTEgKysrKysrKyst
LQ0KIGRyaXZlcnMvZ3JleWJ1cy9jcGMvaG9zdC5jICB8IDQxICsrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKystLS0NCiBkcml2ZXJzL2dyZXlidXMvY3BjL2hvc3QuaCAgfCAgNyArKysr
LS0tDQogNCBmaWxlcyBjaGFuZ2VkLCA2MSBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQ0K
DQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncmV5YnVzL2NwYy9jcGMuaCBiL2RyaXZlcnMvZ3JleWJ1
cy9jcGMvY3BjLmgNCmluZGV4IDg1ZDAyOTU0MzA3Li43ZTAzMmY2Y2Y1MCAxMDA2NDQNCi0tLSBh
L2RyaXZlcnMvZ3JleWJ1cy9jcGMvY3BjLmgNCisrKyBiL2RyaXZlcnMvZ3JleWJ1cy9jcGMvY3Bj
LmgNCkBAIC0yNCw2ICsyNCwxNSBAQCBzdHJ1Y3QgY3BjX2Nwb3J0IHsNCiBzdHJ1Y3QgY3BjX2Nw
b3J0ICpjcGNfY3BvcnRfYWxsb2ModTE2IGNwb3J0X2lkLCBnZnBfdCBnZnBfbWFzayk7DQogdm9p
ZCBjcGNfY3BvcnRfcmVsZWFzZShzdHJ1Y3QgY3BjX2Nwb3J0ICpjcG9ydCk7DQogDQotaW50IGNw
Y19jcG9ydF9tZXNzYWdlX3NlbmQoc3RydWN0IGNwY19jcG9ydCAqY3BvcnQsIHN0cnVjdCBnYl9t
ZXNzYWdlICptZXNzYWdlLCBnZnBfdCBnZnBfbWFzayk7DQoraW50IGNwY19jcG9ydF90cmFuc21p
dChzdHJ1Y3QgY3BjX2Nwb3J0ICpjcG9ydCwgc3RydWN0IHNrX2J1ZmYgKnNrYik7DQorDQorc3Ry
dWN0IGNwY19za2JfY2Igew0KKwlzdHJ1Y3QgY3BjX2Nwb3J0ICpjcG9ydDsNCisNCisJLyogS2Vl
cCB0cmFjayBvZiB0aGUgR0IgbWVzc2FnZSB0aGUgc2tiIG9yaWdpbmF0ZXMgZnJvbSAqLw0KKwlz
dHJ1Y3QgZ2JfbWVzc2FnZSAqZ2JfbWVzc2FnZTsNCit9Ow0KKw0KKyNkZWZpbmUgQ1BDX1NLQl9D
QihfX3NrYikJKChzdHJ1Y3QgY3BjX3NrYl9jYiAqKSYoKF9fc2tiKS0+Y2JbMF0pKQ0KIA0KICNl
bmRpZg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3JleWJ1cy9jcGMvY3BvcnQuYyBiL2RyaXZlcnMv
Z3JleWJ1cy9jcGMvY3BvcnQuYw0KaW5kZXggODhiZGIyZjgxODIuLmVkMGI4ZThiMGQ3IDEwMDY0
NA0KLS0tIGEvZHJpdmVycy9ncmV5YnVzL2NwYy9jcG9ydC5jDQorKysgYi9kcml2ZXJzL2dyZXli
dXMvY3BjL2Nwb3J0LmMNCkBAIC0zMSw3ICszMSwxNCBAQCB2b2lkIGNwY19jcG9ydF9yZWxlYXNl
KHN0cnVjdCBjcGNfY3BvcnQgKmNwb3J0KQ0KIAlrZnJlZShjcG9ydCk7DQogfQ0KIA0KLWludCBj
cGNfY3BvcnRfbWVzc2FnZV9zZW5kKHN0cnVjdCBjcGNfY3BvcnQgKmNwb3J0LCBzdHJ1Y3QgZ2Jf
bWVzc2FnZSAqbWVzc2FnZSwgZ2ZwX3QgZ2ZwX21hc2spDQorLyoqDQorICogY3BjX2Nwb3J0X3Ry
YW5zbWl0KCkgLSBUcmFuc21pdCBza2Igb3ZlciBjcG9ydC4NCisgKiBAY3BvcnQ6IGNwb3J0Lg0K
KyAqIEBza2I6IHNrYiB0byBiZSB0cmFuc21pdHRlZC4NCisgKi8NCitpbnQgY3BjX2Nwb3J0X3Ry
YW5zbWl0KHN0cnVjdCBjcGNfY3BvcnQgKmNwb3J0LCBzdHJ1Y3Qgc2tfYnVmZiAqc2tiKQ0KIHsN
Ci0JcmV0dXJuIGNwb3J0LT5jcGNfaGQtPmRyaXZlci0+bWVzc2FnZV9zZW5kKGNwb3J0LT5jcGNf
aGQsIGNwb3J0LT5pZCwgbWVzc2FnZSwgZ2ZwX21hc2spOw0KKwlzdHJ1Y3QgY3BjX2hvc3RfZGV2
aWNlICpjcGNfaGQgPSBjcG9ydC0+Y3BjX2hkOw0KKw0KKwlyZXR1cm4gY3BjX2hkX3NlbmRfc2ti
KGNwY19oZCwgc2tiKTsNCiB9DQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncmV5YnVzL2NwYy9ob3N0
LmMgYi9kcml2ZXJzL2dyZXlidXMvY3BjL2hvc3QuYw0KaW5kZXggMDMzZmY3ZjAxODQuLjJjYTkz
OGMyYjQ4IDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncmV5YnVzL2NwYy9ob3N0LmMNCisrKyBiL2Ry
aXZlcnMvZ3JleWJ1cy9jcGMvaG9zdC5jDQpAQCAtNiw2ICs2LDcgQEANCiAjaW5jbHVkZSA8bGlu
dXgvZXJyLmg+DQogI2luY2x1ZGUgPGxpbnV4L2dyZXlidXMuaD4NCiAjaW5jbHVkZSA8bGludXgv
bW9kdWxlLmg+DQorI2luY2x1ZGUgPGxpbnV4L3NrYnVmZi5oPg0KIA0KICNpbmNsdWRlICJjcGMu
aCINCiAjaW5jbHVkZSAiaG9zdC5oIg0KQEAgLTM5LDYgKzQwLDggQEAgc3RhdGljIGludCBjcGNf
aGRfbWVzc2FnZV9zZW5kKHN0cnVjdCBjcGNfaG9zdF9kZXZpY2UgKmNwY19oZCwgdTE2IGNwb3J0
X2lkLA0KIAkJCSAgICAgICBzdHJ1Y3QgZ2JfbWVzc2FnZSAqbWVzc2FnZSwgZ2ZwX3QgZ2ZwX21h
c2spDQogew0KIAlzdHJ1Y3QgY3BjX2Nwb3J0ICpjcG9ydDsNCisJc3RydWN0IHNrX2J1ZmYgKnNr
YjsNCisJdW5zaWduZWQgaW50IHNpemU7DQogDQogCWNwb3J0ID0gY3BjX2hkX2dldF9jcG9ydChj
cGNfaGQsIGNwb3J0X2lkKTsNCiAJaWYgKCFjcG9ydCkgew0KQEAgLTQ2LDcgKzQ5LDE4IEBAIHN0
YXRpYyBpbnQgY3BjX2hkX21lc3NhZ2Vfc2VuZChzdHJ1Y3QgY3BjX2hvc3RfZGV2aWNlICpjcGNf
aGQsIHUxNiBjcG9ydF9pZCwNCiAJCXJldHVybiAtRUlOVkFMOw0KIAl9DQogDQotCXJldHVybiBj
cGNfY3BvcnRfbWVzc2FnZV9zZW5kKGNwb3J0LCBtZXNzYWdlLCBnZnBfbWFzayk7DQorCXNpemUg
PSBzaXplb2YoKm1lc3NhZ2UtPmhlYWRlcikgKyBtZXNzYWdlLT5wYXlsb2FkX3NpemU7DQorCXNr
YiA9IGFsbG9jX3NrYihzaXplLCBnZnBfbWFzayk7DQorCWlmICghc2tiKQ0KKwkJcmV0dXJuIC1F
Tk9NRU07DQorDQorCS8qIEhlYWRlciBhbmQgcGF5bG9hZCBhcmUgYWxyZWFkeSBjb250aWd1b3Vz
IGluIEdyZXlidXMgbWVzc2FnZSAqLw0KKwlza2JfcHV0X2RhdGEoc2tiLCBtZXNzYWdlLT5idWZm
ZXIsIHNpemVvZigqbWVzc2FnZS0+aGVhZGVyKSArIG1lc3NhZ2UtPnBheWxvYWRfc2l6ZSk7DQor
DQorCUNQQ19TS0JfQ0Ioc2tiKS0+Y3BvcnQgPSBjcG9ydDsNCisJQ1BDX1NLQl9DQihza2IpLT5n
Yl9tZXNzYWdlID0gbWVzc2FnZTsNCisNCisJcmV0dXJuIGNwY19jcG9ydF90cmFuc21pdChjcG9y
dCwgc2tiKTsNCiB9DQogDQogc3RhdGljIGludCBjcGNfaGRfY3BvcnRfYWxsb2NhdGUoc3RydWN0
IGNwY19ob3N0X2RldmljZSAqY3BjX2hkLCBpbnQgY3BvcnRfaWQsIHVuc2lnbmVkIGxvbmcgZmxh
Z3MpDQpAQCAtMTQ0LDggKzE1OCw4IEBAIHN0cnVjdCBjcGNfaG9zdF9kZXZpY2UgKmNwY19oZF9j
cmVhdGUoc3RydWN0IGNwY19oZF9kcml2ZXIgKmRyaXZlciwgc3RydWN0IGRldmljDQogCXN0cnVj
dCBjcGNfaG9zdF9kZXZpY2UgKmNwY19oZDsNCiAJc3RydWN0IGdiX2hvc3RfZGV2aWNlICpoZDsN
CiANCi0JaWYgKCghZHJpdmVyLT5tZXNzYWdlX3NlbmQpIHx8ICghZHJpdmVyLT5tZXNzYWdlX2Nh
bmNlbCkpIHsNCi0JCWRldl9lcnIocGFyZW50LCAibWlzc2luZyBtYW5kYXRvcnkgY2FsbGJhY2tz
XG4iKTsNCisJaWYgKCFkcml2ZXItPnRyYW5zbWl0KSB7DQorCQlkZXZfZXJyKHBhcmVudCwgIm1p
c3NpbmcgbWFuZGF0b3J5IGNhbGxiYWNrXG4iKTsNCiAJCXJldHVybiBFUlJfUFRSKC1FSU5WQUwp
Ow0KIAl9DQogDQpAQCAtMTgxLDEyICsxOTUsMzMgQEAgdm9pZCBjcGNfaGRfZGVsKHN0cnVjdCBj
cGNfaG9zdF9kZXZpY2UgKmNwY19oZCkNCiB9DQogRVhQT1JUX1NZTUJPTF9HUEwoY3BjX2hkX2Rl
bCk7DQogDQordm9pZCBjcGNfaGRfbWVzc2FnZV9zZW50KHN0cnVjdCBza19idWZmICpza2IsIGlu
dCBzdGF0dXMpDQorew0KKwlzdHJ1Y3QgY3BjX2hvc3RfZGV2aWNlICpjcGNfaGQgPSBDUENfU0tC
X0NCKHNrYiktPmNwb3J0LT5jcGNfaGQ7DQorCXN0cnVjdCBnYl9ob3N0X2RldmljZSAqaGQgPSBj
cGNfaGQtPmdiX2hkOw0KKw0KKwlncmV5YnVzX21lc3NhZ2Vfc2VudChoZCwgQ1BDX1NLQl9DQihz
a2IpLT5nYl9tZXNzYWdlLCBzdGF0dXMpOw0KK30NCitFWFBPUlRfU1lNQk9MX0dQTChjcGNfaGRf
bWVzc2FnZV9zZW50KTsNCisNCiB2b2lkIGNwY19oZF9yY3ZkKHN0cnVjdCBjcGNfaG9zdF9kZXZp
Y2UgKmNwY19oZCwgdTE2IGNwb3J0X2lkLCB1OCAqZGF0YSwgc2l6ZV90IGxlbmd0aCkNCiB7DQog
CWdyZXlidXNfZGF0YV9yY3ZkKGNwY19oZC0+Z2JfaGQsIGNwb3J0X2lkLCBkYXRhLCBsZW5ndGgp
Ow0KIH0NCiBFWFBPUlRfU1lNQk9MX0dQTChjcGNfaGRfcmN2ZCk7DQogDQorLyoqDQorICogY3Bj
X2hkX3NlbmRfc2tiKCkgLSBRdWV1ZSBhIHNvY2tldCBidWZmZXIgZm9yIHRyYW5zbWlzc2lvbi4N
CisgKiBAY3BjX2hkOiBIb3N0IGRldmljZSB0byBzZW5kIFNLQiBvdmVyLg0KKyAqIEBza2I6IFNL
QiB0byBzZW5kLg0KKyAqLw0KK2ludCBjcGNfaGRfc2VuZF9za2Ioc3RydWN0IGNwY19ob3N0X2Rl
dmljZSAqY3BjX2hkLCBzdHJ1Y3Qgc2tfYnVmZiAqc2tiKQ0KK3sNCisJY29uc3Qgc3RydWN0IGNw
Y19oZF9kcml2ZXIgKmRydiA9IGNwY19oZC0+ZHJpdmVyOw0KKw0KKwlyZXR1cm4gZHJ2LT50cmFu
c21pdChjcGNfaGQsIHNrYik7DQorfQ0KKw0KIE1PRFVMRV9ERVNDUklQVElPTigiR3JleWJ1cyBv
dmVyIENQQyIpOw0KIE1PRFVMRV9MSUNFTlNFKCJHUEwiKTsNCiBNT0RVTEVfQVVUSE9SKCJTaWxp
Y29uIExhYm9yYXRvcmllcywgSW5jLiIpOw0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3JleWJ1cy9j
cGMvaG9zdC5oIGIvZHJpdmVycy9ncmV5YnVzL2NwYy9ob3N0LmgNCmluZGV4IDFjMTY4Y2RkMmJm
Li4xMDRkNjFlM2JjNSAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3JleWJ1cy9jcGMvaG9zdC5oDQor
KysgYi9kcml2ZXJzL2dyZXlidXMvY3BjL2hvc3QuaA0KQEAgLTE4LDkgKzE4LDcgQEAgc3RydWN0
IGNwY19jcG9ydDsNCiBzdHJ1Y3QgY3BjX2hvc3RfZGV2aWNlOw0KIA0KIHN0cnVjdCBjcGNfaGRf
ZHJpdmVyIHsNCi0JaW50ICgqbWVzc2FnZV9zZW5kKShzdHJ1Y3QgY3BjX2hvc3RfZGV2aWNlICpo
ZCwgdTE2IGRlc3RfY3BvcnRfaWQsDQotCQkJc3RydWN0IGdiX21lc3NhZ2UgKm1lc3NhZ2UsIGdm
cF90IGdmcF9tYXNrKTsNCi0Jdm9pZCAoKm1lc3NhZ2VfY2FuY2VsKShzdHJ1Y3QgZ2JfbWVzc2Fn
ZSAqbWVzc2FnZSk7DQorCWludCAoKnRyYW5zbWl0KShzdHJ1Y3QgY3BjX2hvc3RfZGV2aWNlICpo
ZCwgc3RydWN0IHNrX2J1ZmYgKnNrYik7DQogfTsNCiANCiAvKioNCkBAIC00OCw1ICs0Niw4IEBA
IGludCBjcGNfaGRfYWRkKHN0cnVjdCBjcGNfaG9zdF9kZXZpY2UgKmNwY19oZCk7DQogdm9pZCBj
cGNfaGRfcHV0KHN0cnVjdCBjcGNfaG9zdF9kZXZpY2UgKmNwY19oZCk7DQogdm9pZCBjcGNfaGRf
ZGVsKHN0cnVjdCBjcGNfaG9zdF9kZXZpY2UgKmNwY19oZCk7DQogdm9pZCBjcGNfaGRfcmN2ZChz
dHJ1Y3QgY3BjX2hvc3RfZGV2aWNlICpjcGNfaGQsIHUxNiBjcG9ydF9pZCwgdTggKmRhdGEsIHNp
emVfdCBsZW5ndGgpOw0KK3ZvaWQgY3BjX2hkX21lc3NhZ2Vfc2VudChzdHJ1Y3Qgc2tfYnVmZiAq
c2tiLCBpbnQgc3RhdHVzKTsNCisNCitpbnQgY3BjX2hkX3NlbmRfc2tiKHN0cnVjdCBjcGNfaG9z
dF9kZXZpY2UgKmNwY19oZCwgc3RydWN0IHNrX2J1ZmYgKnNrYik7DQogDQogI2VuZGlmDQotLSAN
CjIuNDkuMA0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpncmV5YnVzLWRldiBtYWlsaW5nIGxpc3QgLS0gZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9y
ZwpUbyB1bnN1YnNjcmliZSBzZW5kIGFuIGVtYWlsIHRvIGdyZXlidXMtZGV2LWxlYXZlQGxpc3Rz
LmxpbmFyby5vcmcK
