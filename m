Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EL5OFXgfeWkQvgEAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Tue, 27 Jan 2026 21:26:32 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B5A39A59A
	for <lists+greybus-dev@lfdr.de>; Tue, 27 Jan 2026 21:26:31 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 4C181401B1
	for <lists+greybus-dev@lfdr.de>; Tue, 27 Jan 2026 20:26:30 +0000 (UTC)
Received: from mx0a-0024c301.pphosted.com (mx0a-0024c301.pphosted.com [148.163.149.154])
	by lists.linaro.org (Postfix) with ESMTPS id 54E713F78D
	for <greybus-dev@lists.linaro.org>; Tue, 27 Jan 2026 20:23:59 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=silabs.com header.s=pps12202023 header.b=ahak4hpa;
	dkim=pass header.d=silabs.com header.s=selector1 header.b=Xc5oG2si;
	spf=pass (lists.linaro.org: domain of Damien.Riegel@silabs.com designates 148.163.149.154 as permitted sender) smtp.mailfrom=Damien.Riegel@silabs.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1");
	dmarc=pass (policy=reject) header.from=silabs.com
Received: from pps.filterd (m0101743.ppops.net [127.0.0.1])
	by mx0a-0024c301.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60RF672g3275050;
	Tue, 27 Jan 2026 14:23:49 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps12202023;
	 bh=ieEsT46dHmY4Gy3l6smY9rbGo45rBWUvl8u+nGc/lD4=; b=ahak4hpaUr00
	gR9+cQ/ntNr71RBtdac2N8C+TBnIr+PyjMdaRDdFaoLZldcoQs3XizH0R0Z88uM8
	GYX2oRtmQtRX5XcTCvc5Y//uYjub4XgATVLQyHmm5epXEdTYui9/ORjaJ7mwX6sK
	I73l9PUC45/Bc/YYM8qmlccn6lQQT6SFyPYbuMg61BjHU771gNhIzYWDJf4PMvN1
	pDPWBmlJe95LJIOaNdyOUdyzVvMGQ5U1kTy7fh9QoN/TYdR+rQ/gRgIw4SpVIflr
	iL11R/vrEl5gYkhX+SFB7L0sbFSaLfJaMIkmRj1r1hWQ0JY/yX3IBo9+pusnsr26
	OXPK5EvByw==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11021074.outbound.protection.outlook.com [52.101.62.74])
	by mx0a-0024c301.pphosted.com (PPS) with ESMTPS id 4bvu9c5xtn-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 27 Jan 2026 14:23:48 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AD2WM/OaYgwwOxCoeAiESus7pcGT8ZEQNDKTSLnNmgQbJJz3dib5nmf0Bfco9rVbiV8az7bU6rw6w3FaXvVwAPXYcevtlhxj9HgaZKLri0Q+g52tXMe4ygs/SnemHlbxhaydKBH5Q6MGY+v6hUGkc9uexe7wT9G9C52MIjFw+8DBSCEcykWAfRB9Y6YZJt73ajSArz8PkSlblGsJDcm8QiLDQnwGLHVPRXwWfZchKC4+eNW2A2mi1kRIPr9wlz51MMobYiU1Ymkymng4eRu75cy1YhxadmHcIMI4HVPIq1FBikzbm67nQD1P2GYwoeGJih4KQqWL1jpuhvuYSzTNEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ieEsT46dHmY4Gy3l6smY9rbGo45rBWUvl8u+nGc/lD4=;
 b=KJdf27kortMN4s43jvinb6n1xlSjochdelLIRm2LWTzOVOCruLsmdzQ5/xdW8czOrNu9q2MV/KegSKjhuQVefWAdNvsn8d0zpfX4WkjYdTwF/6zWxvr2LCLbJv2pXEYf4IjOhI9uRuQFz7W+MvYEPsXOpKswZJco1Mvbb4IB9xejNj49vKMp2fzB8uGPLBvD7vDPGZYv1j5Cr1CNzt0Q5ixLNiGeIgV2U15vCU27s7EJ9L1ffVR2Van/sBHXr3AqUmwGWameq6i86qWkdBd1nxqMKDohinX5NSxncDOqkmgWjP9fMnBXVdvJIME17EQBozJM2T/MKpUtqmonkTan/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silabs.com; dmarc=pass action=none header.from=silabs.com;
 dkim=pass header.d=silabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ieEsT46dHmY4Gy3l6smY9rbGo45rBWUvl8u+nGc/lD4=;
 b=Xc5oG2siRejMqR63+oz4xnFmD/K38jABVXeDgFpYIYuhzGVR1oy1A0RcsPHuqGy9VDITmUya9Y/I3b3xlV1ZFsb8EOayJQHr54PrPTpvICQORyW99+R6Y/OFfr2EaCwB65nw2l1tBhe0UXpvhxfw5tmoY4b80z+nbzsuv83Ld5Y=
Received: from DS0PR11MB8205.namprd11.prod.outlook.com (2603:10b6:8:162::17)
 by CYXPR11MB8689.namprd11.prod.outlook.com (2603:10b6:930:d8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Tue, 27 Jan
 2026 20:23:46 +0000
Received: from DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::2de6:bc88:2af7:3583]) by DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::2de6:bc88:2af7:3583%3]) with mapi id 15.20.9542.010; Tue, 27 Jan 2026
 20:23:46 +0000
Date: Tue, 27 Jan 2026 15:23:44 -0500
Message-Id: <DFZNI1DOAZDK.H9BJA23QFFSG@silabs.com>
From: =?utf-8?q?Damien_Ri=C3=A9gel?= <damien.riegel@silabs.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
        =?utf-8?q?Damien_Ri=C3=A9gel?= <damien.riegel@silabs.com>
X-Mailer: aerc 0.21.0
References: <20251223183142.31897-1-damien.riegel@silabs.com>
 <2026011606-qualified-dental-bef0@gregkh>
In-Reply-To: <2026011606-qualified-dental-bef0@gregkh>
X-ClientProxiedBy: YQBPR0101CA0046.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:1::23) To DS0PR11MB8205.namprd11.prod.outlook.com
 (2603:10b6:8:162::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8205:EE_|CYXPR11MB8689:EE_
X-MS-Office365-Filtering-Correlation-Id: bf86f8d3-2bcb-4b41-8daf-08de5de1f8b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?U2MxSFdtN2VFN0JoS1BqWmZPdGxRbXNoK3hCaWkyMlRFVGhMRHVEc2VMRDdV?=
 =?utf-8?B?bUlxcE9zMXJRMGRwbjlzV1kwK1BId05ibWMvUkFTbC9ESEgxaGh1QUUyOXA1?=
 =?utf-8?B?M0l0azQ4UER4eTAxQmJyRnk1VDY0bERLSFF2NEFPbVluMUVHMDczS3I4c1Q2?=
 =?utf-8?B?dmp4OUJ0U21pbFhscENZTy9TaGhQY1RnQ0U4Y0dSQkVMMnpIL1lob1Ewcy9z?=
 =?utf-8?B?em0wWHJaaXdaUC93UVpPd3RsTEFnMW9YOTJsQ3gzQW9VdW5jeEFCTFNpVnFF?=
 =?utf-8?B?RFROdnJMaVVaQ3Q0RVNQVFczcUZSTUd6bFNpeWpXY25GS3NRcFBiNld5WHRW?=
 =?utf-8?B?cm9ycVg4WnVaU1I5SzBkQTFlQmswQ3dCeWU3T0xWS3NMNE5FYXFCY05XRlJ2?=
 =?utf-8?B?SzdsWWJ5ekhIUFp5enRNVXBFeFlrcFV5eitob1ZFbERSbHl5OXFKTXNDT1Jk?=
 =?utf-8?B?Mk55MlRqUFA4UE5wNWlvV3dJYVNrVUdTTTZiVng1UGFLd0dRRG1vREhXdlkw?=
 =?utf-8?B?aHlxRU1jdURHYzhnOHFndVRmUm9YeXlFV093RFlCVGNOaGV0OEFKb2Vua1Zl?=
 =?utf-8?B?Y1JsdTVyRUZ3U1JlTlZYN0djc3lhbjFhaGNyWDZtV28xYWpKREV0T0EvaC8x?=
 =?utf-8?B?WVB3MWtTK3NHc1RZMDkrSzNFOXJZM1JGdU0valJaN0xBd1FXK2dkTVhsZUZX?=
 =?utf-8?B?eE9DMkJ2RVgyaGZMUXgwTktxaFAxWG9nOGNWaFVkM1I5MHRtcU9Bb3RMQnIw?=
 =?utf-8?B?cFY2Rzl0d0dpeStZQVYrRHFPU05kYno1c3VmT1VsbGU2MFZYTmU4aGpINHlE?=
 =?utf-8?B?bDl6SGZwMHpBSkk3c09FTkpHRFROZk9nZUVaMVBVTStpcms3WnFTQWpCL2d2?=
 =?utf-8?B?Rm1kWHMzTFlMYnBXd09XU3d2MnB4bVlLcWxlWmJNZkZ2bjIrcVM1dWtSMkEz?=
 =?utf-8?B?cE1za25BeGNQSkhCNllRK2psc2lVcE9wZzcyWVEyUzMzYVRDS2lBSVJkRUVi?=
 =?utf-8?B?ZC9qSFM1enV2YnM1VUxMNmdvb0ZlOWd6SXJzY2xrNXdKS2liOXI1YnNNK1dP?=
 =?utf-8?B?WnJQK2R1aXh3Q1RBQnFpQ3hmcitFWXBmS3lvVnluTS9pd1BDNXU4UXF2MzVE?=
 =?utf-8?B?TEllMDB0UjNTb0tIeWJDSmlLOE9yQSt2d1MvVDRxclR1L05KbXFicmg4WTQv?=
 =?utf-8?B?bU5ZUk1Ta3JDZ3RCZFpiak8xZ0U1ZDY3WXNudUJ0c0VlajNJZVhOT0hCQkNB?=
 =?utf-8?B?dkNndEVGVlg2UnJaR1YzWVlMT0l3VDY3dUtnZjRybUFsZmlYaTRtUk1DL2FV?=
 =?utf-8?B?R2kvZnlKMmlwem83bzF5U2NyRVJJYkZFNTNDK0J3aWcvdnNvMkdYWnZnNG5a?=
 =?utf-8?B?bVM1R25nSlQyTmlVQ0NEMEloMEg5VlBBYTNXWFRmVDUxdDVQVllNZFd2Qmti?=
 =?utf-8?B?UzlmRU1sYkc3ZkppV3VHM0RYN0FtMTgwZ1JRY2FkT2x3b09FTHV6SnFWdjNv?=
 =?utf-8?B?aFV6MXBYSEcxZGtac3FvN3lUeTk4WTQrbzkrOTZST3hvOSt0Yll0aTlHS0xy?=
 =?utf-8?B?b21LdGdhTHErUFNwUGFoR2ZrcUluQWRYR0xIYUE2blIrUzh4eGpsbEVPZ1VB?=
 =?utf-8?B?K1hVYXNzOUMrZjNDYjZWbnVyYWNpNVdrclAyZ3hLK3kyTldlRHZ6M1JqZ2dv?=
 =?utf-8?B?TFhBUmEzbDV4RGFQZ3NQNVRTb25JQkZ4eWlUQzczUkZaRi9DVTRqL0NzVHRG?=
 =?utf-8?B?RmNQVktFMFBhQWVaVzMxU0g4eG1CQjl3VmFzWi95Tk1Zb2lycXZ1QTFpVU1E?=
 =?utf-8?B?S2xuZkZPY0d0S2pWZEU1YjRyVWhPVWtBRlhwYzBESExSOXpIbEJwcVh5ZVlj?=
 =?utf-8?B?YndJbWYxZ3hSRkFndDdXWUlwUWc4S3pVQzVVdTlaQnNwTURnVlFENW5obUNQ?=
 =?utf-8?B?WWUxenFsTCszaHlmWEgrc0ZSeE5BUkRsSk93MytGaDl2dmNHL1h1NEhvbmNO?=
 =?utf-8?B?Mzl0SmNyMjdPb0psQ3J5S3NZa1FUY2M1Yy9SS1pKUElsWjMxVWgzRUZWNmFK?=
 =?utf-8?B?bld1UFpKcEg2eWRWdkJid3l2TVRwTkZDSVFCemozTzN2aFdsMkk0QW1xUk5U?=
 =?utf-8?Q?ohcn8M62qjCyM+sA3lN6kl1Mt?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8205.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NzN2Mk5KT21Ud3JRN29VMEgwUWdRZGpJRTQ3d2xJRnRYak5MTVg1alVBTzhn?=
 =?utf-8?B?QUVKN005Q0szZDRHRXJyeXJkZUFCRmhpc09tbG9NMUpRc25zY1NRTDhjbC9R?=
 =?utf-8?B?bnRnWDhWaXhIRlY1QWVjaEJNOTBuREdzUzY1MTY4dzRXWjdBVVM0NXBIR29a?=
 =?utf-8?B?WGtkMWluVWhDWnc0YVRlZGx6Q1BFRFZLUTcvY0xwTjdoVzBqU2Q5NDJML00w?=
 =?utf-8?B?Q21ETUxGUG0yRFVrSngySkdSeWJmbjBzZlp4M1pQYmEzV1FGN21hOFV5NXo1?=
 =?utf-8?B?dHNnVUlNRUtvb2hHMTRSYUloTjg0VDJZMmNRbG1HTjZnbFZXdkIrRU5zdkdT?=
 =?utf-8?B?YjhIR1drbk1VVi9OdzFjUmN3R2NrRDBQM3l6WHAxc2ovdTkvRTlzMWlnZVVu?=
 =?utf-8?B?Vzk4cmhkRklqL0E3Vkc3RnZTZ1ZRL1pjcER1bFA4anM0UDRHWXRweG5FMDVV?=
 =?utf-8?B?QUdjcndka1pra0t5eXdyY3ZCZlhVQWIzZ1VuZlJENkF5emV3a0t1T3lYVnpO?=
 =?utf-8?B?UDlwdk81WGRFLzlGSEdwSnJ0TCtpdnl0aWxPZExCYkxRcG9wMitWcW5iQXFy?=
 =?utf-8?B?a3oxdDJKdlhCLzdWVzYyN205Q202YlEyc0MwbEVqb1lhMHpKOVZwcXp0dnFS?=
 =?utf-8?B?ZDg0Y3hLYldURU9icmdYVHBZenhnajFRUnpEcWpaQTlvdjcyRTU4YVR3c3pM?=
 =?utf-8?B?R1JaTlRFY2FEUm8ySnFDZGRtZkx2TkV0YllBMUpXUUx3ZUJoNkY1WTh1UVVq?=
 =?utf-8?B?VEJrTjlBaU03WTAxUy9rNEtMNC8vTExxczk5bnVGc0QxcExuTm9ZeURZSUJX?=
 =?utf-8?B?cmdLZndtNXZtT3JKVHdBQjBSOE5RTndQZXFFd2llMmNJeEZqbVpveUFqZ2Nq?=
 =?utf-8?B?ZW5pek8wNG1DT1NTYnhHNGlQeWpRLzFxQ24reGViQ3JMbFBKQlZCUUFWLzJ1?=
 =?utf-8?B?WHV3TUhNc2VSVVV0emxHMStqNVhleTU3Uk96UmlrQkdGcmIvL0d0dUF1MkV2?=
 =?utf-8?B?M21vYUY5dmpwZHdmWVR6K2RqdFNrYzV6RFYybHQ0N2RHZFVRbUdqYzRoa2kz?=
 =?utf-8?B?TlE0RHdLNTBCak9zZDdCWXl4cTF4b2V4WnlPM05CTWQrbGNjb2JSVTJrTnNH?=
 =?utf-8?B?aEtYS0Y2bnBhaDVjY2RLSkFhd2ExNXpKd3BDaHdvSmJZNkVzM3BVMEM2cDdn?=
 =?utf-8?B?eDE2TitXeGVTQjk0dGh6a1J5dDVEQkg0Y2pJYTRXWXhCY1RkM1ZLd3kvc3h1?=
 =?utf-8?B?VEdyVzZtcW1XTkp5QVRRQ21Od1JoOWptU2l2QldtWWViUjdkbm9xTHU0bzRw?=
 =?utf-8?B?dnNIdDFIMkg2dnNtNlVnYWlVcENjbXFheVpLNERVK1daMmdsbFMvUmo1UkRE?=
 =?utf-8?B?aUtyM2NsMEZOSE1TQUdnVlZ3dExyeXNrWHFMK1ArUGY3R3ZsSVV5WFVTYkNG?=
 =?utf-8?B?TTF0ZmdvMlRrUFFPYzc3QVd3WEZlZnArT2s5WjVocWJ6S3FEMDBmTXV2L3Vj?=
 =?utf-8?B?WHRpSW9qcWJSbmJLblZQNlRHR2h1Y2w5ZXZjUHlxV2tJT2sxZ1cwOWZiQ2JZ?=
 =?utf-8?B?UE5HQWNzYVVtQi8xWm5yMUtpaVNZNVBYYjl3Z3JLN0FCeFVYd0RJK0p2Mnpj?=
 =?utf-8?B?d2F6dS9EQmJYM3VZd3plVVlkcWVRdExsemQ3emRhR0lZLzdNbjRacDV4WVh3?=
 =?utf-8?B?NVBtU3FaenllbWVsZXcrTkhRU2V1VG0rSlVYSG05bmphRmlFWEljR2RyZGRu?=
 =?utf-8?B?MElRcSt4bHJjUWlGSFBpYSthQjl4aEswNDY0NEQxZzUwQ2N2WVo4N0d3SVZp?=
 =?utf-8?B?VEpLaGpYMWFlUFk3aUtGSnhIcGJrN0toSTRDS05QS1E3OTJIelRYVHh1M0dx?=
 =?utf-8?B?RGpWc28zUTZDcDVIZFg5NDZDY3VQa2NXN1cxdjdkeVNtZ0NIM2grRkNvWTVm?=
 =?utf-8?B?bVR1MktOTVFmUk1NNVJMd3NlUi9PaDJrM05FUFU3ZFBXRTRvVldWL1NHTlc4?=
 =?utf-8?B?MTNHWUxYdjdOMzJWZGx1VWI2ejJySDJCclJlcVhlTWxWYzdYWHJCSGVsc2Yv?=
 =?utf-8?B?TEpaTnFtNlE5ZnlkVEpIUGNaMHpCYTRSU1FhRmhJbzA1N0EwL2JYMkNEZ2pE?=
 =?utf-8?B?LzRTai9WdGlnTnZxeHZ4R2k2cFhreFIwRWtyRVRocVByeTdCVmkzcEdycmtQ?=
 =?utf-8?B?QTZ1STZnaTNqbUF1OGtmN1hUeWZBc3dIT2hKZDVoaDBkOWdiSGFoWStIYVNK?=
 =?utf-8?B?WkVlMVg4dXpDLzVkb01OSng3Mm1jM3AvaHhSL2VJU2xUZy9mdVJIbnRkTlRp?=
 =?utf-8?B?cUMvTXo0eFI1a3VUZlg1eVp5a0szQW91WmdWYXhoS3VycXFFVVMrdz09?=
X-OriginatorOrg: silabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf86f8d3-2bcb-4b41-8daf-08de5de1f8b5
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8205.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 20:23:45.8165
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 54dbd822-5231-4b20-944d-6f4abcd541fb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +TklS7SZL5AahL5WApKA+bPedKZRVGBW5IxaA7NbGNCdl6XMn5o95T9uziSLMEWGOjwyhHASOwsccGOUL5YWVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8689
X-Authority-Analysis: v=2.4 cv=T/iBjvKQ c=1 sm=1 tr=0 ts=69791ed5 cx=c_pps
 a=GnodoI7vw6685P6KDJTVEw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=M51BFTxLslgA:10
 a=i1IsUcr2s-wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8
 a=1DyIMl0XAAAA:20 a=7XeSOfBemg_FT-Q3C28A:9 a=QEXdDO2ut3YA:10
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-ORIG-GUID: yhXGf8fbOKKjRpfJVXmhzaM0k3E-fzLN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDE2NSBTYWx0ZWRfX+BqrgrVmU6BU
 tmm2bCBxUDwaYZtUkJjUF/25SHeaNNg74YSSItELslmafr6ABfJ5KF+lworzk0mnQaFTpr18DRa
 Ue+6TFfAjG6zqq3HJIqGVNzqO9t/SO53gxJkwyzMyeyqxMTrQSGnnQJniO+oEjatGw+3eoHkv/x
 E+YR1ySXwklKCcR9nLCrZocl0Nf7ZcQB3h/lvvaYMIviDwHZTdaHAyoIVwlW9uS/zXt+zZ1LdU7
 nQsoEIa7ldJ+/tAuD+gqtYa1dGrW5qDNfpaLDkjegOqFhpdsbWEg1EGR64mp5WtOOg049fagaRm
 q7xRPwnhsVgvPCL5gvfGiZJXsOmY0dufZgm9YJ7Okwjc2ilY8HwkX3B3omNHhOjzqqd41UBIlCf
 m04IMVbWs7TGuJ8+cV2WwQjgIcouZoLUNH6IjBAgiI3lThLYh8iK1XbtWTnSis/TB9FIxxa6Fjl
 W/inrPPaYAFNiPyjmew==
X-Proofpoint-GUID: yhXGf8fbOKKjRpfJVXmhzaM0k3E-fzLN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_04,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 adultscore=0 bulkscore=0
 phishscore=0 suspectscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270165
X-Spamd-Bar: -----
X-MailFrom: Damien.Riegel@silabs.com
X-Mailman-Rule-Hits: implicit-dest
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
Message-ID-Hash: K33DW4N2BT7WRBTG574MRI24A2OBLKE7
X-Message-ID-Hash: K33DW4N2BT7WRBTG574MRI24A2OBLKE7
X-Mailman-Approved-At: Tue, 27 Jan 2026 20:26:26 +0000
CC: greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, linux-devel@silabs.com
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 0/8] greybus: support point-to-point topology
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/K33DW4N2BT7WRBTG574MRI24A2OBLKE7/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.49 / 15.00];
	DMARC_POLICY_REJECT(2.00)[silabs.com : SPF not aligned (relaxed),reject];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	R_DKIM_REJECT(1.00)[silabs.com:s=pps12202023,silabs.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+mx];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[damien.riegel@silabs.com,greybus-dev-bounces@lists.linaro.org];
	NEURAL_HAM(-0.00)[-0.996];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[silabs.com:-]
X-Rspamd-Queue-Id: 7B5A39A59A
X-Rspamd-Action: no action

On Fri Jan 16, 2026 at 10:09 AM EST, Greg Kroah-Hartman wrote:
[...]

>>
>> The SVC doesn' really serve a purpose here, as there is no bus to
>> manage, and adding its support only increase the complexity and the code
>> size needed on memory-constrained devices.
>
> Exactly how much memory does a "single point" SVC driver take, vs.
> adding new P2P functionality everywhere in the code like you just did?
> Finding that out would be good first before worrying about adding
> another type of "bus" here please.

Sorry for not giving numbers in the cover letter. We measured 10kB of
code size difference (which may be on the higher end of the spectrum)
and in Zephyr [1] they measured a 2kB difference (which is probably on
the lower end considering the implementation is pretty barebone).

>> The goal of this patchset is to let a single module expose some Greybus
>> protocols without requiring the module to also implement SVC protocol.
>> We call this mode "Point-To-Point". There are three main notable facts
>> with the implementation of this patchset:
>>
>>   - most of the time, what this patchet does is just skipping calls that
>>     issue commands to the SVC, as they are not applicable without an SVC
>
> Great, make a SVC that just ignores them :)

We can't really *completely* ignore them, we need to respond in a way
that lets Linux think this is a legit SVC, or it will stop probing. But
that's mostly what we already do and what they do in Zephyr [2], only
connection create/destroy really matters to map CPort ID between AP and
Interface.

>>   - CPort ID allocation is a bit different as there is no SVC/Bridge to
>>     do translation between AP address space and interface address space,
>>     so the patchset forces allocation of AP CPort IDs that matches the
>>     ones found in interface's manifest
>
> Again, a simple SCV would make this not needed.
>
>>   - enumeration of a module is normally started by a "Module Inserted"
>>     event issued by the SVC. As the SVC is absent, the host device
>>     driver must manually call a function to start the enumeration
>
> I'd prefer again, to have that in the SVC you are using.
>
>> We tested this patchset with the gb-beagleplay driver, slightly tweaked
>> to only keep the HLDC over UART part of the driver, connected over UART
>> to an EFR32MG24 running BeagleBoard's implementation of Greybus-Zephyr [1].
>>
>> In the discussion to integrate this module into Zephyr [2] (it's
>> currently as separate module not part of the main Zephyr code base),
>> there seems to be interest in being able to have a single-node
>> device on the bus without SVC [3]. If some features that were
>> implemented by the SVC are missing, we can consider adding more
>> callbacks to the gb_hd_driver structure at a later time, and let drivers
>> decide how they want to support these features.
>
> I can understand if you want to be a greybus host running zephyr that
> this might make sense, as it lets you not even have to write any SVC
> logic, but for Linux here, I think the simplicity makes more sense (i.e.
> everything goes through the same data paths, no multiple test paths that
> need to always be exercised.)
>
> So I'd prefer not to do this, just try to make a simple svc module and
> see if that works instead.

That's what we currently have and it works, but it comes at the cost of
more flash usage. That being said, I understand the concern of wanting
to keep the current implementation simple and have only one data path. I
think the benefits are not big enough in terms of code size savings to
justify pushing this patchset further, so I will just leave it as is.
It's out there if someone wants to try and improve it to be less
intrusive :)

thanks,
damien

[1] https://github.com/zephyrproject-rtos/zephyr/issues/98259#issuecomment-3774577266
[2] https://github.com/beagleboard/greybus-zephyr/blob/main/subsys/greybus/svc.c
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
