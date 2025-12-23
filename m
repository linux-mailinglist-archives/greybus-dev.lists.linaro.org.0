Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 6455FCDA469
	for <lists+greybus-dev@lfdr.de>; Tue, 23 Dec 2025 19:32:22 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 7FD143F9D9
	for <lists+greybus-dev@lfdr.de>; Tue, 23 Dec 2025 18:32:21 +0000 (UTC)
Received: from mx0a-0024c301.pphosted.com (mx0a-0024c301.pphosted.com [148.163.149.154])
	by lists.linaro.org (Postfix) with ESMTPS id F3FD63F9AD
	for <greybus-dev@lists.linaro.org>; Tue, 23 Dec 2025 18:32:05 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=silabs.com header.s=pps12202023 header.b=EzqKaUW4;
	dkim=pass header.d=silabs.com header.s=selector1 header.b=ZpgWcV2O;
	spf=pass (lists.linaro.org: domain of Damien.Riegel@silabs.com designates 148.163.149.154 as permitted sender) smtp.mailfrom=Damien.Riegel@silabs.com;
	dmarc=pass (policy=reject) header.from=silabs.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from pps.filterd (m0101743.ppops.net [127.0.0.1])
	by mx0a-0024c301.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNBlCKS2900128;
	Tue, 23 Dec 2025 12:32:01 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps12202023;
	 bh=ZeVD+la1YFTGIUrDGJy48L4pY7cxRaHK1aj+awI/04k=; b=EzqKaUW47OpS
	7NIRgrMiS40E6Su3oFzAnQhOWWlyg14Qqf9zMOYmdA8BS0gFoVDaGr4u2HLOHKKS
	Ry7MlI5RMydaC25n+BIXDguKOV9GzLxtC6eFpclaycofxM3GTeep4mfssh1iRbfJ
	aiw1Scwpv9+nitOiOvUZXqm2zVHDuYMevmJY/6zAZq/YrF14a7jAlqXrMQDF7pwk
	1oDMInipc140/U786pe5J+8FTPz8cX5T4Hb/l7C4YDuB1ue9QcxWt/TfcpaokqbE
	bUmdcC/uNEiW1u+Doi7nnHGe7PevuBI5wqYnaCc8gz3dE6Bf3qlPuJDOgCl+ARa5
	BsJBzK6LXg==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11020105.outbound.protection.outlook.com [52.101.46.105])
	by mx0a-0024c301.pphosted.com (PPS) with ESMTPS id 4b7n7597gh-3
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 23 Dec 2025 12:32:01 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GT+0WeMC7pHHr9PEXx3SOz/6JaIgzKWOXL86v87XmeUZt4JjTL4iH+6ed10mH4kGmCq3MddY5Mcx3eUPBLP0G4dBmKbUMTN3fp5II34DJI8IqLLhWI7FJTnVn5pMd5mzQb2hgUM3Pls3GQZlXamNk+YTnQ+EDL6UNQiPgzixvJEyMv/98PoNbyZBuT0OsqxTtQB8Y6EbPKdWNf4A4+RL/I5L1P7Z6zcmrlzMTA+NQSwsj+1SSLmdb/ZD4HR1lyl2sHG43FEqoHrFFFmKygvpeKO8xQr/bQ1oAxDVGkMoav4d1tUHgy8KHofyqcfEfasGbPV33pTQUMJemfoiVmRvyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZeVD+la1YFTGIUrDGJy48L4pY7cxRaHK1aj+awI/04k=;
 b=STLLybLxjsLMk1LaooU6wcGUzyrHnano0LlSdx4r8QCbItWipnuz1eKkcKu/CeDxAKAgAWkRVJk3Q8NlIAy+o2mbTMolkPeeNRwZelojRpflOVc5ol0lxnysElRpLGcygCqyAWhREId6sQeEEczdCj+I7nANREbnIDdNhi+3w30/UwfEUDeAO5w1BCGZT03Pe9WgrjpgMwxcu2JOT1ZGr92ewU2iWy4cjrSuXhIpMWCgmJgce3cfEgFlaKln5mz2n4TdosdqWSc+PuFgtsHc/YWSi2cPbirYdy3gihhceoH0RW7nsnorDC1+stPTU8F1cEnQhkazRhTN6MFeEQLCyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silabs.com; dmarc=pass action=none header.from=silabs.com;
 dkim=pass header.d=silabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZeVD+la1YFTGIUrDGJy48L4pY7cxRaHK1aj+awI/04k=;
 b=ZpgWcV2OXLycRbPf0zu8MAbB/sroi1JKYAcCg7rHOG5inqO0GAE/d5P4kkj1buZl75PUIeYZ6+bd6I0+V71xIMhZ9VT6mf/1hIsQVFmfE6HeYY7wtZRm2RUdyNLg363GzqHmKhYsYFDkigeHU8+YHW/w314pr3xLCsyjQU8tvDQ=
Received: from DS0PR11MB8205.namprd11.prod.outlook.com (2603:10b6:8:162::17)
 by SN7PR11MB6924.namprd11.prod.outlook.com (2603:10b6:806:2ab::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.11; Tue, 23 Dec
 2025 18:32:00 +0000
Received: from DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::2de6:bc88:2af7:3583]) by DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::2de6:bc88:2af7:3583%3]) with mapi id 15.20.9434.009; Tue, 23 Dec 2025
 18:31:59 +0000
From: =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
To: greybus-dev@lists.linaro.org
Date: Tue, 23 Dec 2025 13:31:42 -0500
Message-ID: <20251223183142.31897-9-damien.riegel@silabs.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251223183142.31897-1-damien.riegel@silabs.com>
References: <20251223183142.31897-1-damien.riegel@silabs.com>
X-ClientProxiedBy: YQZPR01CA0008.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:85::23) To DS0PR11MB8205.namprd11.prod.outlook.com
 (2603:10b6:8:162::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8205:EE_|SN7PR11MB6924:EE_
X-MS-Office365-Filtering-Correlation-Id: 60ad4bf1-e955-4cb9-e7cb-08de42518ed2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|10070799003|376014|52116014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?SjRMRFRLM3Y0cEJiZWJKK2FFZU9UakZJL0tTUHNzYmFXOFRUL2dUYUVTT3hY?=
 =?utf-8?B?OUxxaUZydVluUHhRVFhtcS9hbVJqYnMwTmNtajZOVU8vV1lmTmc0NW0wc1ZQ?=
 =?utf-8?B?dy9QaVZHQld5YnB4TnN0cGRUd0hPdzVSWXpEUDhPWXN0dVc0TTY0dThoZUhp?=
 =?utf-8?B?L1dhaU5HRkpwc29FcmFoZlU3YVVrc3AvcElXQzlJd1EyRkg0c2h4c2FtY1Jx?=
 =?utf-8?B?ZVVMbnBnR3ZucjV5UkZES2Z0L0paS3pSV0NQSEJBZ3dtYTVDT2JjYjBzQXdy?=
 =?utf-8?B?S1RGZHU0YWM2SzQ4ZFpwaVRaSStCMWk1QmRTYXpnRTlkcFZTTGREd3RKMUc2?=
 =?utf-8?B?UnYvRGlqeUwvcHZOdnZ1bTZjeHRSUzdQbjVwYXJlNEFaZDJYL3ZubytmTGpQ?=
 =?utf-8?B?WVVxUmlTZ3F2ditiWU5EZVRsNFR2M25rTjNTd0ZJOXZuYnZJODRqQTdqOXFW?=
 =?utf-8?B?OHlveHVDc1hzNERnZVhJVEoxeVZPSmwzSTl5MTNBVEg0TUhIZEg3ZkVZaWNy?=
 =?utf-8?B?VG82bEMxbi9lZzZyQnU3eFk0bDZIOXF3cTRpbmkwOVdMeXVIWDNiL2U4WHNw?=
 =?utf-8?B?SUd2bXp2UUIxR3lrbU9veWRpM3BPMTA2MStFOG14RmRSUHdQTFdrUmtTSGxX?=
 =?utf-8?B?Z3ZyWEsyOWgza1JueEZVWXhSSGpJVnRZUjhpVmg0UEJCT3FNcnpDekk4bWRk?=
 =?utf-8?B?cjE0cFpoU1lNR3phcmloR002a1Z2bjJvMGw5Z3U1MnIxajdrZDZuZ3FUNitY?=
 =?utf-8?B?Z2ZUYXUydy8yaWRnQWJianBGOHRJbzk3d2hUeWNidVFPTUtQU0RtTGZ4enlw?=
 =?utf-8?B?V3ZRa2kwTGdCU0hBRlVMT0tYeVVIeFBYRHo5elVnWks0WTZESVJnNFRCRjNS?=
 =?utf-8?B?L0pHZVVuYnFVOUtLVVR6NVZMSVFpUzJ2Wm15U0luME1RdTNKRmlxVVlmR2Fq?=
 =?utf-8?B?eTM4aXZVT1dqREZXcU5QcGREV2dlWS9vamVQWWxyNTZRN2xnL1NlY3l4NDBD?=
 =?utf-8?B?UDNaejI0Z3RWcG5Jd2xhWkk0U1pIVEVlRlg0UVRSNEdhcWM4Z0o0OGhZRHRH?=
 =?utf-8?B?OE0rK2hSTmFuUGRBdXNZSHJ2YXBDYVRNWktSUThBb1JZRVlUU20venl3Q1p5?=
 =?utf-8?B?ZVBBN0lmaWQ1MHYrbE1US3RlVG1YazBpSnJ3dTdGSmhaOVBEWURxNVlETCtv?=
 =?utf-8?B?d0QvdVNEek02V3dWRGhTVGQ2QUE2T29Ib2NqaUN5UmVWL2VqdVYzS29PcklL?=
 =?utf-8?B?YTdrRVNnTEVXM0Mzc1dNVzJKRFQ5dHlyeng3TThhUG9CYWdBbndSTkllT0xk?=
 =?utf-8?B?cVNOaHhJWmNkL1FsbEU5eWxYS1o3aVo1bEs5OUpTMW5kaTA4ckcxK0FEdFlH?=
 =?utf-8?B?K3IwcllzbDUydlAvb2lRakJ6M0MrbllOT2RVVjBhK3JKYXZEWHZ2UUpCc25r?=
 =?utf-8?B?OUZzK1IrbHI0aytlT0ljdEM4aFpxakVPbXpYNlhvbjNMaHhJWE5RSzQ5Q05Y?=
 =?utf-8?B?blp2VUZqNmJrMTBvSXN6dm9LbktJWmFSNXQ2YlFUVkZwNm9YZlBndzZ2eWdI?=
 =?utf-8?B?WTcrM3RxQTFiQnBZLzgveW1aUGt6YUZ6MERONi9OWGl4VTRvNFZaTmVjdThk?=
 =?utf-8?B?aEVRRDdmdGs0by9QZGZlNHp6NXlhS3hoUVdJVmhmMlBpcmQ1aE5uRk1mc0ZX?=
 =?utf-8?B?N284SmdMemJjVDdQMVM0dEFGWHY1V1Q0NUpMNnhyRmNhdXRJbks0ZDVDZzM3?=
 =?utf-8?B?R09Xb1d1blFoZXBESE40N1lBWEJzdkRMd1gvNWJMYXhlK3BYUG1Rbjk1S05P?=
 =?utf-8?B?c0REcFFMWGZoRUIxd1hHQVg2WVdxRjlxZG1xc3hmbXo2cHp0clRsc2V5Mkx4?=
 =?utf-8?B?d0Q1Y0pyT0l4c3kxTGRGZnJmTWNHejhzQzdvR0FmU2FYUW5TcHFHYzJEQllk?=
 =?utf-8?Q?6gVjB0Pdto9KI8B4cJApOgCVW9UM0aRB?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8205.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(52116014)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VlRQdEtXZXdEa1ZvV0pBRU9HemMyWmxka0tlamR6cGVhL1FJdFU2VmNSN2p5?=
 =?utf-8?B?bFZoOWgzcG41TmFPTjExRG5UZFQ2VGRjeWxhUW9zV1U5cWR0TDcwQkN3WnAy?=
 =?utf-8?B?MWJZczl2ZStuVzVDZ2RWc2hweFAxQkY5dkJOSEduaXdJSHNuei8vTlpyZ2Er?=
 =?utf-8?B?dG1XMHowUDRZeVIxQk1HSnByeGJENTJITk5XSzhUSFBZR2VtYThkVFJlY1lp?=
 =?utf-8?B?OGtkL1lRb2pOdkxQK05yUC9UVU0rVjBjRFlCUk9pbjk4TjZSUUhHVll1b0ZV?=
 =?utf-8?B?TTNFb0duaGp1ZzNRSCtNVlJQSXMvN1JYS0hpUFNWUHk4Zmk1dkExREF6b0FT?=
 =?utf-8?B?TkRDdS9seC91blpITldXbDRRY3lMOXdkSW1PS0hoZWg1SmVPQUR4ZXA5enRz?=
 =?utf-8?B?eUtIYUlRNnRvL0U1aFNEWElwbEh3RzJEZjNmc1FoNFRQdXQ2c1hHd002enZJ?=
 =?utf-8?B?Ukd0UnkrSWdxc200czNENExoamV1TGl0WnNqem5IYk5zT3BnRDNUcmlHOXRG?=
 =?utf-8?B?T3dYMmVHaDdtSzdoVUJ6ZlZQN2x5di8velVhS0dsTmNqaHh3Q0xaOC9JWktR?=
 =?utf-8?B?MjZnM2ZRK3o1RGVBOXl4RTBNbm5tc3puaGVvV3JkUG5sYW4xQVNiaTlUSzEz?=
 =?utf-8?B?VEVFWGpzTFZZZkl1dmxOTENtMEROQ2NoRmxycmFla1ZJRE1pdVg0eEZrTmhI?=
 =?utf-8?B?Wm81Y2FXTUIzQ01JSFh5L2R1bXZCQXBTZVZjTVNjZUVZOWFFcDE0VUNxOUpu?=
 =?utf-8?B?K1RUTG9oSzZNbkE0ZHlSSTViWjRidlVCVWY4RE1OWE9TYW5wMHdmZGIvRFRL?=
 =?utf-8?B?WFZrZ3hoSTAzM1U2U08xTEl2Vk8xMTFJd2xCaUk0QndXQitNTm5QSm83KytH?=
 =?utf-8?B?aHU3a1Z1VEg4NTA0ZXpxb2xIT0JCbGRIdmJTOGJtNWhUTlM3RXdIRkhaRVA4?=
 =?utf-8?B?QW5XU0dycHNaN2xaMytzT2dxQk1vZmNzSTl5OURRZFhHOEdKYVZTOGIvaDAr?=
 =?utf-8?B?SWhEdmZpTmJNRTlQYmVicW56bnhmUUJnL25ibytXZUR3RDZLYWxVYXI0aWpw?=
 =?utf-8?B?Mk5iOTV2dEgyeUFNT3JTTVFCWk92WVFXeklES2FnOUUvN2lLOEE4c3gwYVZY?=
 =?utf-8?B?WFZhNWtoeVdBdGdETmtHTzE4bjlYb0g3Q1FPMzFIM21sRDJZangveHVvYWp5?=
 =?utf-8?B?OXIybFVOS2NRdTlNMk82T0ZrTUZmU1E0OG4rQWNSTWRXcE9QQWdLUzhmZzI1?=
 =?utf-8?B?UkEreHRwUGJyMmZSM0ljUWtCTEdqWkJiUU1rUWhFb2R1YlFYQXkvMnhEdk1G?=
 =?utf-8?B?ei92M2VibWo1c0lyU3RSWjcxOWNmSXB4a21RRTgrbFJvb1c3ZWlmZVo0THZC?=
 =?utf-8?B?U2pmajNvNU9ldVllWDlrN3V3V1NWMEN2eVBCbUNoUCtaZGdTTzZyNXV5UnJm?=
 =?utf-8?B?enVtaHB6cDh3VzZGa3ptRU93aE51bG42cHNDeWNOc1FlS2Z5Y1g4RWtPenl2?=
 =?utf-8?B?eDFwdVlrcy9tTGw1cWF2THpPbWczdnE0b3loa095NTFOeHdQc1ZhblQ5UkpP?=
 =?utf-8?B?OEY5VmdRQkh2UXJUWERTWm1ZQVQ1T0lwS3lyZEp3WUJzbFdzc3hNdEl0YnFa?=
 =?utf-8?B?WDgwV08wZXpQOHdPZU13N3RaZGxqQ1hINmxwOUdDN1E4ME5JRjNhdEVBTkM2?=
 =?utf-8?B?UnRSTWkwUVNLTWtnV1AvS09pblVhUFFkOFIwck1OSTFpWFZMeEoybGlmaWI1?=
 =?utf-8?B?NFVDNXorTkp4a2NaZHRGYUJsUXNuUzRLSE02UW0xMnVHYXgvaExrYURhRlpH?=
 =?utf-8?B?U29MNkUvS0xSbzQ4OHFxS0JuUDFJZ2ZjYVcrMDk1bytIN3kzamxlTHJoRVFx?=
 =?utf-8?B?NWdsVURUVWcrYVJsQlN0ZG1HVEJUeGJFZVNEZmVpbmhvQmpyeGFWcjhsNjNu?=
 =?utf-8?B?c2NiNnI4N1NVekUvM0lFWEViS2IyenU3RVB3YWFsQ054RXYwUyt1QkxyT2FM?=
 =?utf-8?B?a0h3N0djUUN0enZwbEF1RGZhTVFJc3IxeHZlbHJBcjRjMnhMQzl3QURGaVAy?=
 =?utf-8?B?d0VUdWNQQ3NEUHJ0aU1sd2RsbWxURitMQUw5RFVXWVBQQ3R4T2pBVXQ1Z0FR?=
 =?utf-8?B?a3luK05uUXpVakNuSTdFVjlTdVFNMTd0cy8wWEg2MDFRVzZYRlZBN3hIQ1hE?=
 =?utf-8?B?MGZveW9XQkJZbm1oT09uT3FyenlyV0pTYnE4N1BkRVQrZDd3UjNIbVB5SnJx?=
 =?utf-8?B?VWx4R2FFWjBoQVlWTm5Ick9sWTlxRDRkMHBubndUREQrTVJtTGYyNGpFc0ZG?=
 =?utf-8?B?eDZMa1RhMTVhNVpQdnhWTWh5b1lUUkV1VFpUSGZRZUFlS05yVmJDRDJBSC9E?=
 =?utf-8?Q?cNOTy1MlAne8/gd8fVblsZIiY7zXCqSaK/sSN0j/hdMrB?=
X-MS-Exchange-AntiSpam-MessageData-1: YGTcOIGO/gU1kA==
X-OriginatorOrg: silabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60ad4bf1-e955-4cb9-e7cb-08de42518ed2
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8205.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2025 18:31:59.0581
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 54dbd822-5231-4b20-944d-6f4abcd541fb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: INusacQWBZSirt+X0DOFjW8MbBiKVSm4O/9gHQ+K2pkLoxJN3VNQPKaVu3wp6aF64p1erZqa6b1RaoiuEp/XaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6924
X-Authority-Analysis: v=2.4 cv=SsmdKfO0 c=1 sm=1 tr=0 ts=694ae021 cx=c_pps
 a=b2ykEmuCBAXBKoHv9pAjeQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=M51BFTxLslgA:10
 a=i1IsUcr2s-wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=2AEO0YjSAAAA:8
 a=v6IrmJOh5dy-7aaZqgQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: 0rlFwDDA2k24d8uQb2PpZTyN5dl1a2k0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDE1NCBTYWx0ZWRfX8Kp67d9mFrZY
 Ja2U+KByLc0m3Y/rW9W7D4R6lJUlyQmRNV7FBUbhUarQiKjoBUKPu+QJhZNLTxjxpbgQefJVtbE
 Lrf3CpuG9LwLY0wtWWvXqBe84nMQVdhFIt/5iundPityfdXoaZMOQTWONSocGPG0fK5q4CNaSXF
 H8LL15Q07yQKJ7IkI/JRi05lTxw4ZfMPx9lm6EJRQ0jZWQJ72zPMyRJaNkJ7DibbrHjIou5paBE
 mrAr0nMnEJBF6sHkOhfP2mRkUdf46OJ/zPg0qV46MUCaBs5KYEPa4qOaKCwkdFKWKGtqIsO4CVN
 XhOIxdiztJ/ZEfLyfOO/1W9ml8fsNnO7SRezzIV79LbxKFnzrWwB1ZLS4FMQXl0VoyKcnUKxUsH
 ZAzaA6xlunSxdeYg2w1AH0UBqOL5cbvLa/UHOTcsgtBsgVw2/+VSeuj0TOxcIO5YiX7aGQAmfna
 8CnTLK6Ve8Hbs27pzsw==
X-Proofpoint-GUID: 0rlFwDDA2k24d8uQb2PpZTyN5dl1a2k0
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
	DNSWL_BLOCKED(0.00)[148.163.149.154:from,52.101.46.105:received,2603:10b6:8:162::17:received];
	DKIM_TRACE(0.00)[silabs.com:+]
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: F3FD63F9AD
X-Spamd-Bar: ----
Message-ID-Hash: 35FRSH7GSODSIX4LIXFF4QXMY6NFCDDU
X-Message-ID-Hash: 35FRSH7GSODSIX4LIXFF4QXMY6NFCDDU
X-MailFrom: Damien.Riegel@silabs.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, linux-devel@silabs.com, =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH 8/8] greybus: add function to probe p2p module
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/35FRSH7GSODSIX4LIXFF4QXMY6NFCDDU/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SW4gYSBub3JtYWwgR3JleWJ1cyB0b3BvbG9neSwgdGhlIGVudW1lcmF0aW9uIG9mIGFuIGludGVy
ZmFjZSB3b3VsZA0Kc3RhcnQgd2l0aCBhICJNb2R1bGUgSW5zZXJ0ZWQiIGV2ZW50LCBpc3N1ZWQg
YnkgdGhlIFNWQy4gSW4gYQ0KcG9pbnQtdG8tcG9pbnQgY29uZmlndXJhdGlvbiwgdGhlIFNWQyBp
cyBhYnNlbnQgYW5kIHRoZSBob3N0IGRldmljZSBtdXN0DQplbnVtZXJhdGUgdGhlIG1vZHVsZSBt
YW51YWxseS4NCg0KSW4gb3JkZXIgdG8gZG8gc28sIGV4cG9ydCBhIG5ldyBmdW5jdGlvbiB0aGF0
IGxldHMgdGhlIGhvc3QgZGV2aWNlDQpkcml2ZXIgc3RhcnQgdGhlIGVudW1lcmF0aW9uLiBOb3Rl
IHRoYXQgdGhpcyBmdW5jdGlvbiBpc3N1ZXMgY29tbWFuZHMgdG8NCnRoZSBtb2R1bGUgaW4gYSBi
bG9ja2luZyB3YXkgYW5kIHNob3VsZCBub3QgYmUgY2FsbGVkIGluIGEgcHJvYmUNCmZ1bmN0aW9u
LCBidXQgc2hvdWxkIHJhdGhlciBiZSBjYWxsZWQgZnJvbSBhIHdvcmtxdWV1ZS4NCg0KU2lnbmVk
LW9mZi1ieTogRGFtaWVuIFJpw6lnZWwgPGRhbWllbi5yaWVnZWxAc2lsYWJzLmNvbT4NCi0tLQ0K
IGRyaXZlcnMvZ3JleWJ1cy9oZC5jICAgICAgIHwgMzAgKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrDQogaW5jbHVkZS9saW51eC9ncmV5YnVzL2hkLmggfCAgMiArKw0KIDIgZmlsZXMgY2hh
bmdlZCwgMzIgaW5zZXJ0aW9ucygrKQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncmV5YnVzL2hk
LmMgYi9kcml2ZXJzL2dyZXlidXMvaGQuYw0KaW5kZXggMmZjOWZiZTk4N2YuLjE2NTc3NWI2Yjhi
IDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncmV5YnVzL2hkLmMNCisrKyBiL2RyaXZlcnMvZ3JleWJ1
cy9oZC5jDQpAQCAtMTMyLDYgKzEzMiwzNiBAQCBjb25zdCBzdHJ1Y3QgZGV2aWNlX3R5cGUgZ3Jl
eWJ1c19oZF90eXBlID0gew0KIAkucmVsZWFzZQk9IGdiX2hkX3JlbGVhc2UsDQogfTsNCiANCitp
bnQgZ2JfaGRfcDJwX3Byb2JlX21vZHVsZShzdHJ1Y3QgZ2JfaG9zdF9kZXZpY2UgKmhkKQ0KK3sN
CisJc3RydWN0IGdiX21vZHVsZSAqbW9kdWxlOw0KKwlpbnQgcmV0Ow0KKw0KKwlpZiAoIWdiX2hk
X2lzX3AycChoZCkpDQorCQlyZXR1cm4gLUVPUE5PVFNVUFA7DQorDQorCS8qIEluIFAyUCBtb2Rl
LCBvbmx5IG9uZSBtb2R1bGUgaXMgc3VwcG9ydGVkLiAqLw0KKwlpZiAoIWxpc3RfZW1wdHkoJmhk
LT5tb2R1bGVzKSkNCisJCXJldHVybiAtRUJVU1k7DQorDQorCW1vZHVsZSA9IGdiX21vZHVsZV9j
cmVhdGVfcDJwKGhkKTsNCisJaWYgKCFtb2R1bGUpIHsNCisJCWRldl9lcnIoJmhkLT5kZXYsICJm
YWlsZWQgdG8gY3JlYXRlIG1vZHVsZVxuIik7DQorCQlyZXR1cm4gLUVOT01FTTsNCisJfQ0KKw0K
KwlyZXQgPSBnYl9tb2R1bGVfYWRkKG1vZHVsZSk7DQorCWlmIChyZXQpIHsNCisJCWdiX21vZHVs
ZV9wdXQobW9kdWxlKTsNCisJCXJldHVybiByZXQ7DQorCX0NCisNCisJbGlzdF9hZGQoJm1vZHVs
ZS0+aGRfbm9kZSwgJmhkLT5tb2R1bGVzKTsNCisNCisJcmV0dXJuIDA7DQorfQ0KK0VYUE9SVF9T
WU1CT0xfR1BMKGdiX2hkX3AycF9wcm9iZV9tb2R1bGUpOw0KKw0KIHN0cnVjdCBnYl9ob3N0X2Rl
dmljZSAqZ2JfaGRfY3JlYXRlX3AycChzdHJ1Y3QgZ2JfaGRfZHJpdmVyICpkcml2ZXIsDQogCQkJ
CQlzdHJ1Y3QgZGV2aWNlICpwYXJlbnQsDQogCQkJCQlzaXplX3QgYnVmZmVyX3NpemVfbWF4LA0K
ZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvZ3JleWJ1cy9oZC5oIGIvaW5jbHVkZS9saW51eC9n
cmV5YnVzL2hkLmgNCmluZGV4IDI4ZWU3ZmNhMWQxLi4wOTZiOTY0MmQxMSAxMDA2NDQNCi0tLSBh
L2luY2x1ZGUvbGludXgvZ3JleWJ1cy9oZC5oDQorKysgYi9pbmNsdWRlL2xpbnV4L2dyZXlidXMv
aGQuaA0KQEAgLTgzLDYgKzgzLDggQEAgdm9pZCBnYl9oZF9wdXQoc3RydWN0IGdiX2hvc3RfZGV2
aWNlICpoZCk7DQogaW50IGdiX2hkX291dHB1dChzdHJ1Y3QgZ2JfaG9zdF9kZXZpY2UgKmhkLCB2
b2lkICpyZXEsIHUxNiBzaXplLCB1OCBjbWQsDQogCQkgYm9vbCBpbl9pcnEpOw0KIA0KK2ludCBn
Yl9oZF9wMnBfcHJvYmVfbW9kdWxlKHN0cnVjdCBnYl9ob3N0X2RldmljZSAqaGQpOw0KKw0KIGlu
dCBnYl9oZF9pbml0KHZvaWQpOw0KIHZvaWQgZ2JfaGRfZXhpdCh2b2lkKTsNCiANCi0tIA0KMi40
OS4wDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmdy
ZXlidXMtZGV2IG1haWxpbmcgbGlzdCAtLSBncmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3JnClRv
IHVuc3Vic2NyaWJlIHNlbmQgYW4gZW1haWwgdG8gZ3JleWJ1cy1kZXYtbGVhdmVAbGlzdHMubGlu
YXJvLm9yZwo=
