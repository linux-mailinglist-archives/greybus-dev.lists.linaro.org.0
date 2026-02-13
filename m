Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8I1bEjJNj2nnPgEAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Fri, 13 Feb 2026 17:11:30 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id A7AE9137D80
	for <lists+greybus-dev@lfdr.de>; Fri, 13 Feb 2026 17:11:29 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 367623F930
	for <lists+greybus-dev@lfdr.de>; Fri, 13 Feb 2026 16:11:28 +0000 (UTC)
Received: from mx0b-0024c301.pphosted.com (mx0b-0024c301.pphosted.com [148.163.153.153])
	by lists.linaro.org (Postfix) with ESMTPS id 3378E3F072
	for <greybus-dev@lists.linaro.org>; Fri, 13 Feb 2026 16:00:48 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=silabs.com header.s=pps12202023 header.b=M041XLmA;
	dkim=pass header.d=silabs.com header.s=selector1 header.b=HRZ1rGfy;
	spf=pass (lists.linaro.org: domain of "prvs=0504152215=damien.riegel@silabs.com" designates 148.163.153.153 as permitted sender) smtp.mailfrom="prvs=0504152215=damien.riegel@silabs.com";
	arc=pass ("microsoft.com:s=arcselector10001:i=1");
	dmarc=pass (policy=reject) header.from=silabs.com
Received: from pps.filterd (m0101742.ppops.net [127.0.0.1])
	by mx0a-0024c301.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61D8OA4c2161348;
	Fri, 13 Feb 2026 10:00:37 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps12202023;
	 bh=/NS0cvYMobtXvkC6oMU5aC+TD6VbnGqRlSLqp2Rth0k=; b=M041XLmAX67F
	iHHBMNB6+3VWDRDejPTIOOTAlyxVIIzpiTMhRMSoTex4yEoURzYjb2VzNv3lhWZB
	BSfpAf9DC5t314KWgj9Orqk9qFsjq+q9Fe6WWDR8GkP3KYtlsG7Xn3JF9aM+Vuvu
	4GTQrVoudmpCi/5DGT5GQE44nsURAM6WGzE/xN4+m9xUkL1wzCsPexx0jL3xu6fT
	CaetwDYGZ79aGCTpYbtHcAaFLnvnoVfGobDOgaimTUiUtBbeKHpfr15wX8zDLDO1
	T6q9MYpIOCl3GqjCmHtMJfG2T9q2PD5NGEnVBhfVj58wYHZ6fC5JhyEI4cT/gR8S
	rchxg+F9cQ==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11021142.outbound.protection.outlook.com [52.101.52.142])
	by mx0a-0024c301.pphosted.com (PPS) with ESMTPS id 4c92w8w6bc-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 13 Feb 2026 10:00:36 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MrNQ+/Ab7KcdgM/ASN1RWVZ8Fo5TpZ2CfCC9rfj+9ev16GQP+NdlH/QSZ0ItUeZJhqxeY37ARBA7Q1pNDjwcanvB25l1p/4gJSjfSOL+o0qaFIajo5YedCrsXUCwwKEBjo+QDKXE9bae5Iv4JNvMnF+plU2JFiliwTSyXjkZABpFrUUIHfsYs2ASuTi/oEQ2+iMIeBrlTPoK+TfWvdMOpj3C5rceKKiI9AcyLhLbedVpqu8gd2P+Hz27orLUErHLKlUo9SztsajgaaakGbO76x5eQrAK6XjxQXu/ykXVg4DXf3YPO4/vUwiAaumYswSXmaCFotS27dD+p5NZCWQTFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/NS0cvYMobtXvkC6oMU5aC+TD6VbnGqRlSLqp2Rth0k=;
 b=WLPyls/1V314tcLyo2XuO6rSvlmqfVRvieuPKyFD7dK1CXMvFlBVyO73PBefflIa/Wb34OMeEnGKrkd7MKya5NLolgcPEDXWR2ihC1kWHEXTgghiZO1kZXTUY2VvAvASzD17S8wokr6zSge3qVTeUU10BjuQMGFPbcoRA5ppGFZ1CspP7fpUPfDGq62Z/g1wuaDEo5apGvefWokCtJJOFrl/yLXc6aC/5GvbW5miRslZFALQWFWBA9pz/35tjW0bWeaJvmFb0koSxtBCUHNlJSy4qpTWHHx/6uyBB8H4u+gj8Wi6x64IlbsB/qWCSjEmsjWbzeJkKYDhL4d8Nc8IMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silabs.com; dmarc=pass action=none header.from=silabs.com;
 dkim=pass header.d=silabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/NS0cvYMobtXvkC6oMU5aC+TD6VbnGqRlSLqp2Rth0k=;
 b=HRZ1rGfyxlW4IZcSYf5/eJ0qKys+d3xvtblFRU+nM/EZGPY5whbaAXZAFVN8SM9r/3IiCRIZExXseZd2L8rebz7ClJOt7eZJi/xzvIQOzmgh8xyc6RyYS1wWbDcmxmmykNF3BXhESau8IOnLasvNKp2Pu0CPx84DXkpuPTWV3QM=
Received: from DS0PR11MB8205.namprd11.prod.outlook.com (2603:10b6:8:162::17)
 by IA4PR11MB9347.namprd11.prod.outlook.com (2603:10b6:208:565::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.11; Fri, 13 Feb
 2026 16:00:32 +0000
Received: from DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::2de6:bc88:2af7:3583]) by DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::2de6:bc88:2af7:3583%3]) with mapi id 15.20.9611.012; Fri, 13 Feb 2026
 16:00:32 +0000
Date: Fri, 13 Feb 2026 11:00:29 -0500
Message-Id: <DGDYJQU8IRVK.1WJLTV18VUFQQ@silabs.com>
To: =?utf-8?q?J=C3=A9r=C3=B4me_Pouiller?= <jerome.pouiller@silabs.com>,
        <greybus-dev@lists.linaro.org>, "Johan Hovold" <johan@kernel.org>,
        "Alex
 Elder" <elder@kernel.org>,
        "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>,
        <linux-kernel@vger.kernel.org>,
        =?utf-8?q?Damien_Ri=C3=A9gel?= <damien.riegel@silabs.com>
From: =?utf-8?q?Damien_Ri=C3=A9gel?= <damien.riegel@silabs.com>
X-Mailer: aerc 0.21.0
References: <20260212144352.93043-1-damien.riegel@silabs.com>
 <20260212144352.93043-15-damien.riegel@silabs.com>
 <15379358.uLZWGnKmhe@nb0018864>
In-Reply-To: <15379358.uLZWGnKmhe@nb0018864>
X-ClientProxiedBy: YQZPR01CA0043.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:86::21) To DS0PR11MB8205.namprd11.prod.outlook.com
 (2603:10b6:8:162::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8205:EE_|IA4PR11MB9347:EE_
X-MS-Office365-Filtering-Correlation-Id: b13b426b-6909-42aa-7cd4-08de6b1903ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ZnFPL1NPSHJEZXdnZVRSZEhaSHlCbEJkQnR4Vlp3bDlVeTdmWDZSL0kreGN0?=
 =?utf-8?B?M0J3Ui9aWC9DdWNSa3hSaWlnU2lxeU9TUWdOc1RRRkxCSGw0eVRkQkp3ajVT?=
 =?utf-8?B?SmZpSDlDNmxJOUtJcmpwYkFVdm9oaHRNcHdlWlNLMjZTUkZVcHhFZFVIcUtG?=
 =?utf-8?B?Wm1BaEZNWmdrekd2UFQ1Q3VDa2hPck5OaGdmM1RydlZLRXF1SzExUHJwc0pD?=
 =?utf-8?B?RW40RWltaE1MOXRxWmxEOGJFaHZ6ME9DOGZLRGxtZ0VkY01IaGgraGZHNnlX?=
 =?utf-8?B?d3ZCT0NOS1RQMnRKUE04VTlXUjJvMVBuRzIvd3daMzFOejhKWTZKN2VESlFy?=
 =?utf-8?B?VGNpSDE1M05ZRm1TakFhK2E2Ym1YcGlVd1VBaHFlME16VlI3c29rWDhTWGJF?=
 =?utf-8?B?OVgyejdiOVJ0aXQyN0RsZU4rTHJqMW1ja001R0o1UTN5bnFRM3JYWEFJUkcv?=
 =?utf-8?B?TmdJd0xQRHB2MGlLM1ZBTTBEUU9Bd21OcWxYTW1yRVdDcGtYMzNxZ2lWaVYz?=
 =?utf-8?B?dnNJYSsyNTk0aFlBWmE0NmZqQ21YNmZuSTZNMTJqZHNHM3NKNnR2VjVqOEUr?=
 =?utf-8?B?VVZHUDhjdVJwYU4yY2dDSDVTSzJnbm9RRGtINllmS0hVSFJHM2ozRk5ZT1BV?=
 =?utf-8?B?ME1ZSnc0ek5wYy9KTFUrODZRdklZZDRqSEt0RE9tWHcwRSs1WUZIU016WVFi?=
 =?utf-8?B?emxmcmhWb0V0eGVoK3JDRXQreTRhNjNpM1pLdFR6UW1OYVhJTFRlbkluRHhj?=
 =?utf-8?B?RWJNbHlVdkNObjNwNkx2NmJNM1NxNG9MdnlwRGFrSmZyVklHZFBQclBGZFd6?=
 =?utf-8?B?OEhSc1NZYnVweU1wdm5wTVRwRTZWMktHWXd2TTBvUTBuUHZncmNHb1FqQXRM?=
 =?utf-8?B?czFEMDVPSzArNFlaRzBWdEtmWEYxRTR2UURlOWNnRzd0c3FVNjFGNXp4RlFp?=
 =?utf-8?B?bTVEKzJwU25SVm53WnRQdE41RHNsMzJNNDhVNjRTQi9ZUWUyM2d6WUwwOHdp?=
 =?utf-8?B?VUNiWjFyZHl1S3hVOXBxZ3JBV2NSWTBPa1hyeEJHRTFSRGVIQ1AvczZLZTlt?=
 =?utf-8?B?Nm4wdk0wbkZWWmlMUEZ5SzJtTThmalNCOFYvR3E2UFl2aHZNUjZkOUYzMEpT?=
 =?utf-8?B?eTZxZUZZS0ErdHJmZjdMcURET0xQSTBiNjc2cGc1N1NOeVhkQXd1c3QrdzlL?=
 =?utf-8?B?akxkancraVhJSTBKaWlVbElpQS84NjZQNU0rTEQ4b09MNFJ0Z1lBNk10T2Q1?=
 =?utf-8?B?eHhVNHBEMjFuNTBLVVJxbjlFQ1I3ZEdSajU5dmh6VENzSUcydC9Ha3Bjd3ly?=
 =?utf-8?B?blR2dk1VcjNSSHNjU0FhVktpTCtMbFpadW5UNzd4Y1JoQUZYdkM4SHc1VERo?=
 =?utf-8?B?MkR2aWpyMG03Q251bzdXd2ljZnRwTUlxbGdRUTFFb3QzeC9WQXcvWUNXcTBP?=
 =?utf-8?B?RnNROFdveURIdEpISGlsalZvVFhFMFVRU2ttQ045dlk5dVpobFkxaWhrRXNJ?=
 =?utf-8?B?UmpDVWRmdXRjOG9aZ2hhL3ViMWFNaUQ2eGlzYWhRYzd5cndJemFtSEFma3dR?=
 =?utf-8?B?bHRubTZpc2tYSk9GdGFlTTlDVk50SXpXVFAzSGNqV3BoeWt6VWNjU2ZFR2pv?=
 =?utf-8?B?ZjVCMHhhUlRKb2VkVHVXTVF4K0lQeXB6a0I2aEVLS1hrS1BXTkFHaGhMNUEx?=
 =?utf-8?B?bXJNc01pQ29uS3NFSGtFeURpRGRhK0l2YnhtYXFJZGZQck04KzBpYzdJQ2Vm?=
 =?utf-8?B?TVlFRVVjdFlaZU94SzF2L3pXZGVRYyszZHRmRElmcHRRZTBCaFp4eEtGQUpW?=
 =?utf-8?B?bktzaGNjT1JKek1aSU9jbFZjdGljMmpmanZvVzRrb0JQTzI5ZmN1dmNnYXow?=
 =?utf-8?B?QVhzNmpGWjMzL0JUTWZleWVVeEhxa1FqWExZUXFTTmVWMWdqQlR2amFrYUNT?=
 =?utf-8?B?WkxlVHhxUk85WWZNaVE2OHR6QWx0STJvR1dFRUNDUHgxREdrRXhnMGZKSXFI?=
 =?utf-8?B?Mmgvb1dTNWxXVnM4K0FiZ0NDWCtpNnlwdUlPTmUwREltVGdSTVNKT2hsSmFx?=
 =?utf-8?B?QVF5d09ZdS9NR3BPOFJ2YW9WSGJSSS83ZGc5YnhrbWxGSEpBK2p4bnFhczFQ?=
 =?utf-8?Q?CjIM=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8205.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dHN3TmNwQ2FrQ1g4Y3pObHZsQ1ZSNzFHbi9BNWVjMGQyS0YxV0hrOUZLbmxR?=
 =?utf-8?B?NXV5TmpiNGlsNUhlTmJaMWlFOXZIVityQ3BZdzYwc0RoUm12U1B4REc0bG5i?=
 =?utf-8?B?Z2RSS0doWDRIa2p1OWQ1d0tqM1lZVjd6bEtXY1dMZ0s3aDZCMWZLYmdFbXZk?=
 =?utf-8?B?UkFqSUIzTEp1NVdqc2syNi95dXg1VDRjc1ExMjVmWkRUQlpnVlpyNkdUMk5p?=
 =?utf-8?B?ZjlteWxDNUU5dThBY29UazBZR3ErZkdTMEtGTTJyM0dIaG9wZ1pneG5oQnlx?=
 =?utf-8?B?Q2FxZ3FFK2FpaElSMEZHWThZOGp1bzVCaXg2VjZOQXFEVXBpU0xSeVdGVXdM?=
 =?utf-8?B?SjJqZEVSdDZ4dzc5WTliRUxVZXFnRGZRY2tKclVhS1BoOXlsSkY2Z0V0bk1n?=
 =?utf-8?B?UGRTTWo2UXdqMm9neElZbEs0N3ZBWkg4ZDJhaTdOaDJINnRSTWNXVXA1OHB5?=
 =?utf-8?B?Q1NvWjZsOGRZc2lTbHA4ZzdRWW1DY0ZITjRlaVdjaU5uZGlBWjF2RmN4UTlG?=
 =?utf-8?B?and2YnlQMGJ1eGUzaS9xaG1pZ3FDcHA0eW1pTU1Xc2JQQ1cwU0hLdWlMaGR3?=
 =?utf-8?B?RGNYRFU5ck5NV1dzQmIyT1o4QStaS2xNZ2hiOU00RHBQYmZrRjMwZFVSaytX?=
 =?utf-8?B?UXF0T1ZibGFhdWRacUNiMWJURUJ6S2lhYlZQNWlIY0xlUmJ5UDhGY1lDd0NK?=
 =?utf-8?B?RTNjZ3hLMGJmTFJBTHhEelhjb20zcVpTVlhlYUVCcENTekw3Q2FLL3h5Tksx?=
 =?utf-8?B?RDNkTjcva0RJQnpoa1MzL3hkQUxTUmhjNVZOVUpCYk51WUxqcGphSkN5TFo3?=
 =?utf-8?B?SDAraS8zNUQvUnZuNEF6VDZuc3IvSFE0bUNLbk5wN0lkQ2xxYUNRNVVLdWp5?=
 =?utf-8?B?cHlZZlF0Q2tIVk02VUNwa3R4VzZMbWdTaDF0c0hjRmNSb2ExWHhDcVc0Ylkr?=
 =?utf-8?B?d05PQmdvUHE3WTd2bkpOVjRwWVg5cUx6c1lPbTlCM1NXQTRKNjdDalZCRVJZ?=
 =?utf-8?B?R0VRNUpMV3VRNzJyWXZTVVJWbFhhZFFOeCt3OHpjdDRjSGxmcFZCVVhmUlhk?=
 =?utf-8?B?SEpXRjdHM1c1RklJQ1hGdlpzK3pocFdIZStrNnBXb2lkS0NwV29sYU5wY3Jq?=
 =?utf-8?B?MmErcFp6QlFxbCs1TWN2NVRmVlhmb3N6aEpRZWhHc3pvWkdZU1k1a2Fxclg3?=
 =?utf-8?B?aFBHZWJFeUExcldwRmdtTlZieCtkR21mcXY3UFQwQUFUb1hkNnhqWUgyTStH?=
 =?utf-8?B?SkErcDgwWlQxZVBCdy9mMHBraC9vSmxPd2pDY2l5RmVka0kyNmR0SSsvU3Zs?=
 =?utf-8?B?MUQ1ZVhvcVJmT2p6eWJTN1NKa2hMQlp3UFVhQ3RYdXdpdWhPRU9FVzFqbHlL?=
 =?utf-8?B?L0Mxdk9wQXVQSlcrcThFcDlQQnJHcFhUOHhrb2JNRlhiRTNjNmw4RWRNVGxl?=
 =?utf-8?B?bjdRRk52RWIxQVBqbWtDc2xrcWcwUTVPc2NFK0JxMk5Ib2NHdW9jd21INE5u?=
 =?utf-8?B?ZTRvUUEzN1NqOFp6K0NtbWtiT2JzTDJsY0tqTmNNTVN5YXVXVWIzb1p3aHV6?=
 =?utf-8?B?aXZ1T0MrbUZaY2liRHpCN1dnRlVtU2lDZFZiZ2lIM1h1NWt5eW5UbHVrRGFm?=
 =?utf-8?B?d2J0OThnajlYWHBWWWlTRWhnTTdRZW5Belc5S2NLUGZpTXRQMk5PSnNpSFdB?=
 =?utf-8?B?UVlQVkhYWnBmemIrTkVMNlhBVXhnL2N6MXRXZCt0cTdOVzlmSDRGM3R6NEI3?=
 =?utf-8?B?Mmp0VUhCS3JuZHlCMTNYN0d0WVdKSEVCVG9zY2ZPdkU1dG5LVjRFcFRabStE?=
 =?utf-8?B?N0ZFYnVwV0hjM1N6TUVQVEZQczgzNWdyT0VFUE1BN2JkelpjdFJsVGdkSW9P?=
 =?utf-8?B?MFFDdDhsS2wxbkt6ZWZ1SEZWMVZYSjBscUhtb0xBTktuSlpkVnZ3SGRDczI2?=
 =?utf-8?B?VlI1UThKdkc2YnpqYWZYb0ZTNmczYkpNUklDWnJCK2p4TkY2ckNTWURVcysw?=
 =?utf-8?B?QyszQVNZWFRZVGoxOHZaQXBFemxRTk5rTEFybmlxL2RPVmhMNDR4VEcwSTBs?=
 =?utf-8?B?VWRJYTg5RS93S2dlUGw2MnYzRGt4dU5uckRyVW05UzdqRE5LeDdmZWhrNDY1?=
 =?utf-8?B?Vis2WEs3MHQ1SWpEdDVGdklRblFtY1AvcUYzeVEwNjl1QzVJRDJOWmtzNWdm?=
 =?utf-8?B?MHVVaWNONk5KU3o2U1pCVlhhTmoxckdieGhzaXA5a0tkbHJwbVl5YmVMYnBm?=
 =?utf-8?B?NnNwMlZnVGtkbllSMm51Z3krQkN0RlhqcE8yRFg4WjFwTlE0d0FyZnF2NHpT?=
 =?utf-8?B?ckg0dnZDRFR4UG5tc0xoRmJvaTRhQ3kyMDNFRFZaWWpQM3l5d2FHQT09?=
X-OriginatorOrg: silabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b13b426b-6909-42aa-7cd4-08de6b1903ea
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8205.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 16:00:32.0561
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 54dbd822-5231-4b20-944d-6f4abcd541fb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wmoJ7yWaXwaS5XHvNHDui1XoS9Wi0+9YPLUdpT5nOxpPIzsWbXe41vaYgKXyuCEFvM0djlAUvHQd5k3nq1prQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9347
X-Authority-Analysis: v=2.4 cv=Ne3rFmD4 c=1 sm=1 tr=0 ts=698f4aa4 cx=c_pps
 a=QL+v0huyu2hsXc0KYGjVrw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=M51BFTxLslgA:10
 a=i1IsUcr2s-wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=2AEO0YjSAAAA:8 a=VwQbUJbxAAAA:8
 a=0zQeUxxE-09590BCCAoA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEzMDEyMyBTYWx0ZWRfX/BvCvRDUleqf
 GbxfSuPOaHcX0m1NM9gjkXWNKKNiJmufsENek0Iqq8/GPij4jnWhxzTCjnW/jamT93hOg/oX+6u
 oJo9qS3szX2q+1tDllLOYxovAlNImGikW39O+dfdzc7Wc16uPkokorW7O6YyH+eZZfawzAIoo+S
 PIGnIsqTOdsRyWzjz5VW1PmQVCi5OfkEkz/LESvOn75Igo48VQTI3+VNNDmwvyQ9CwCA/ElMQ7r
 5xSaA/uBu0wsXq2K7ZjombHcmdxLGQun+3zLdBCRRAZpAG3GLrT697CNpt6Gm+8lKCJy6G+2qXp
 IqsjqkfhCSQzv0vrFlAsFxHvYcywlzNjltJtdHy7NIhw9LTUGsnWu3CLiJnZzoZxA5wmpXWVqdu
 4+kgqsyXFxbzjt9nw6JWJxPwwTCm0Ruwb+3pC55NKEP+715UvuJGDY0NUhAfr/N9nBuSucy6XPe
 UxiPQgpiiILVgFtnEzg==
X-Proofpoint-ORIG-GUID: tuI3PuXYmbNLk_6tKabyFdNN8dMCbWP0
X-Proofpoint-GUID: tuI3PuXYmbNLk_6tKabyFdNN8dMCbWP0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-13_03,2026-02-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 spamscore=0 phishscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602130123
X-Spamd-Bar: ----
X-MailFrom: prvs=0504152215=damien.riegel@silabs.com
X-Mailman-Rule-Hits: implicit-dest
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
Message-ID-Hash: 345RPX64GYV7UMOMICRD4CGA2UPUAZBH
X-Message-ID-Hash: 345RPX64GYV7UMOMICRD4CGA2UPUAZBH
X-Mailman-Approved-At: Fri, 13 Feb 2026 16:11:26 +0000
CC: Silicon Labs Kernel Team <linux-devel@silabs.com>, Gabriel Beaulieu <gabriel.beaulieu@silabs.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v3 14/14] greybus: cpc: add CPC SDIO host driver
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/345RPX64GYV7UMOMICRD4CGA2UPUAZBH/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.59 / 15.00];
	DMARC_POLICY_REJECT(2.00)[silabs.com : SPF not aligned (relaxed),reject];
	R_DKIM_REJECT(1.00)[silabs.com:s=pps12202023,silabs.com:s=selector1];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	R_SPF_ALLOW(-0.20)[+mx];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,lists.linaro.org:helo,lists.linaro.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_FIVE(0.00)[6];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[damien.riegel@silabs.com,greybus-dev-bounces@lists.linaro.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[silabs.com:-]
X-Rspamd-Queue-Id: A7AE9137D80
X-Rspamd-Action: no action

T24gRnJpIEZlYiAxMywgMjAyNiBhdCA0OjM1IEFNIEVTVCwgSsOpcsO0bWUgUG91aWxsZXIgd3Jv
dGU6DQo+IEhlbGxvIERhbWllbiwNCj4NCj4gT24gVGh1cnNkYXkgMTIgRmVicnVhcnkgMjAyNiAx
NTo0Mzo1MiBDZW50cmFsIEV1cm9wZWFuIFN0YW5kYXJkIFRpbWUgRGFtaWVuIFJpw6lnZWwgd3Jv
dGU6DQo+PiBGcm9tOiBHYWJyaWVsIEJlYXVsaWV1IDxnYWJyaWVsLmJlYXVsaWV1QHNpbGFicy5j
b20+DQo+PiANCj4+IFRoaXMgaW50cm9kdWNlcyBhIG5ldyBtb2R1bGUgZ2ItY3BjLXNkaW8sIGlu
IG9yZGVyIHRvIGNvbW11bmljYXRlIHdpdGggYQ0KPj4gR3JleWJ1cyBDUEMgZGV2aWNlIG92ZXIg
U0RJTy4NCj4+IA0KPj4gTW9zdCBvZiB0aGUgY29tcGxleGl0eSBzdGVtcyBmcm9tIGFnZ3JlZ2F0
aW9uOiBwYWNrZXRzIGFyZSBhZ2dyZWdhdGVkIHRvDQo+PiBtaW5pbWl6ZSB0aGUgbnVtYmVyIG9m
IENNRDUzcy4gSW4gdGhlIGZpcnN0IGJsb2NrLCB0aGUgZmlyc3QgbGUzMiBpcyB0aGUNCj4+IG51
bWJlciBvZiBwYWNrZXRzIGluIHRoaXMgdHJhbnNmZXIuIEltbWVkaWF0ZWx5IGFmdGVyIHRoYXQg
YXJlIGFsbCB0aGUNCj4+IHBhY2tldCBoZWFkZXJzIChDUEMgKyBHcmV5YnVzKS4gVGhpcyBsZXRz
IHRoZSBkZXZpY2UgcHJvY2VzcyBhbGwgdGhlDQo+PiBoZWFkZXJzIGluIGEgc2luZ2xlIGludGVy
cnVwdCwgYW5kIHByZXBhcmUgdGhlIEFETUEgZGVzY3JpcHRvcnMgZm9yIGFsbA0KPj4gdGhlIHBh
eWxvYWRzIGluIG9uZSBnby4NCj4+IA0KPj4gUGF5bG9hZHMgc3RhcnQgYXQgdGhlIGJlZ2lubmlu
ZyBvZiB0aGUgc2Vjb25kIGJsb2NrIGFuZCBhcmUgY29uY2F0YWluZWQuDQo+PiBUaGVpciBsZW5n
dGhzIG11c3QgYmUgMzItYml0IGFsaWduZWQsIHNvIHRoZSBkcml2ZXIgdGFrZXMgY2FyZSBvZiBh
ZGRpbmcNCj4+IGFuZCByZW1vdmluZyBwYWRkaW5nIGlmIG5lY2Vzc2FyeS4NCj4+IA0KPj4gU2ln
bmVkLW9mZi1ieTogR2FicmllbCBCZWF1bGlldSA8Z2FicmllbC5iZWF1bGlldUBzaWxhYnMuY29t
Pg0KPj4gU2lnbmVkLW9mZi1ieTogRGFtaWVuIFJpw6lnZWwgPGRhbWllbi5yaWVnZWxAc2lsYWJz
LmNvbT4NCj4+IC0tLQ0KPj4gQ2hhbmdlcyBpbiB2MzoNCj4+ICAgLSByZXdvcmsgZGVmaW5lcyB0
byBncm91cCB0b2dldGhlciBhZGRyZXNzLXJlbGF0ZWQgZGVmaW5lcyBhbmQgcmVtb3ZlDQo+PiAg
ICAgb3JwaGFuZWQgdmFsdWUNCj4+ICAgLSByZW1vdmUgdHJpdmlhbCBjb21tZW50cw0KPj4gICAt
IGFsbCBSWCBhbmQgVFggYXJlIG5vdyBkb25lIGZyb20gdGhlIHdvcmtxdWV1ZS4gSW4gcHJldmlv
dXMNCj4+ICAgICBpdGVyYXRpb25zLCB0cmFuc2ZlcnMgY291bGQgZWl0aGVyIGJlIGRvbmUgZnJv
bSB0aGUgdGhyZWFkZWQgSVJRIG9yDQo+PiAgICAgZnJvbSB0aGUgd29ya3F1ZXVlLg0KPj4gICAt
IHJlbW92ZSBlcnJvbmVvdXMgU0RJTyBWSUQvUElEDQo+PiAgIC0gcmVtb3ZlIHBhZGRpbmcgYmV0
d2VlbiBoZWFkZXJzIGFuZCBwYXlsb2FkcyB3aGVuIGFnZ3JlZ2F0aW5nDQo+PiANCj4+IENoYW5n
ZXMgaW4gdjI6DQo+PiAgIC0gY2hhbmdlIGZvcm1hdHRpbmcgZnJvbSAlbHUgdG8gJXp1IHdoZW4g
cHJpbnRpbmcgc2l6ZV90J3MNCj4+ICAgLSByZW1vdmUgIi8qKiIga2VybmVsLWRvYyBtYXJrZXIg
Zm9yIHN0YXRpYyBmdW5jdGlvbnMgbm90IGFjdHVhbGx5DQo+PiAgICAgdXNpbmcgdGhlIGtlcm5l
bC1kb2MgZm9ybWF0DQo+PiAgIC0gcmVkdWNlIGhlYWRlciBpbmNsdXNpb24gbGlzdA0KPj4gICAt
IHVzZSByZXZlcnNlIGNocmlzdG1hcyB0cmVlIHZhcmlhYmxlIGRlY2xhcmF0aW9ucyBjb25zaXN0
ZW50bHkNCj4+ICAgLSB1cGRhdGUgYWdncmVnYXRpb24gZnVuY3Rpb25zIHRvIHRyeSB0byBiZSBt
b3JlIGxlZ2libGUNCj4+ICAgLSB1c2UgZGVmaW5lIGluc3RlYWQgb2YgY29uc3RhbnQgdmFsdWUg
MHgwQyBmb3IgdGhlIGFkZHJlc3Mgd2hlcmUgdG8NCj4+ICAgICByZWFkIHRoZSBudW1iZXIgb2Yg
Ynl0ZXMgdGhlIGRldmljZSB3YW50cyB0byBzZW5kDQo+PiANCj4+ICBkcml2ZXJzL2dyZXlidXMv
Y3BjL0tjb25maWcgIHwgIDEyICsNCj4+ICBkcml2ZXJzL2dyZXlidXMvY3BjL01ha2VmaWxlIHwg
ICAzICsNCj4+ICBkcml2ZXJzL2dyZXlidXMvY3BjL3NkaW8uYyAgIHwgNDgwICsrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrDQo+PiAgMyBmaWxlcyBjaGFuZ2VkLCA0OTUgaW5zZXJ0
aW9ucygrKQ0KPj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dyZXlidXMvY3BjL3NkaW8u
Yw0KPj4gDQo+IFsuLi5dDQo+PiArc3RhdGljIGNvbnN0IHN0cnVjdCBzZGlvX2RldmljZV9pZCBz
ZGlvX2lkc1tdID0gew0KPj4gKwkvKiBObyBvZmZpY2lhbCBJRCAqLw0KPj4gKwl7IFNESU9fREVW
SUNFKDB4MDAwMCwgMHgxMDAwKSwgfSwNCj4NCj4gQ2FuIHlvdSBwcm92aWRlIHNvbWUgZGV0YWls
cyBhYm91dCBob3cgaXQncyB3b3JrPyBJIGFzc3VtZSBTaWxhYnMgc2VsbHMNCj4gT0VNIHByb2R1
Y3RzIGFuZCBlYWNoIHZlbmRvciBoYXMgdG8gc2V0IHRoZWlyIG93biBWSUQvUElELCB0aGF0J3Mg
aXQ/DQo+DQo+IEkgYXNzdW1lIFNpbGFicyBhbHNvIGhhcyBzYW1wbGVzIHByb2R1Y3RzLiBIb3cg
aXQgd29ya3MgZm9yIHRoZW0/IElzDQo+IHRoZXJlIGEgZGVmYXVsdCBWSUQvUElEIG9yIHRoZSBz
YW1wbGUgZmlybXdhcmUgd29uJ3QgY29tcGlsZSB1bnRpbCB0aGUNCj4gdXNlciBjaGFuZ2VzIHRo
ZSBWSUQvUElEPw0KDQpUaGF0J3Mgbm90IHNvbWV0aGluZyB3ZSBoYXZlIGRlZmluZWQgeWV0LCBi
dXQgSSB0aGluayB3ZSBjb3VsZCBhdCBsZWFzdA0KZGVmaW5lIG9uZSBWSUQvUElEIGZvciAiR3Jl
eWJ1cy9DUEMgY29tcGF0aWJsZSBkZXZpY2VzIiwgdGhhdCBldmVyeQ0KdmVuZG9yIGNvdWxkIHVz
ZSBpZiB0aGV5IGRvbid0IG1ha2UgYW55IGNoYW5nZXMgdG8gdGhlIHByb3RvY29sLiBFYWNoDQp2
ZW5kb3Igd291bGQgaGF2ZSB0byBjcmVhdGUgdGhlIG1hbmlmZXN0IGJhc2VkIG9uIHRoZWlyIHBy
b2R1Y3RzIChsaWtlDQplbmFibGUgV2lGaSBmb3IgcHJvZHVjdCBYLCBlbmFibGUgV2lGaSAmIEJs
dWV0b290aCBmb3IgcHJvZHVjdCBZKS4NCg0KPiBJbiBhbnkgY2FzZSwgSSBiZWxpZXZlIHdlIGNh
bid0IHB1Ymxpc2ggYSBkcml2ZXIgd2l0aCBWSUQgPSAwLg0KDQpOb3RlZCwgdGhlIHBhdGNoc2V0
IGNhbid0IGJlIGFwcGxpZWQgYXMgaXMuIEknbGwgY2hlY2sgd2hhdCB0aGUgcHJvY2Vzcw0KaXMg
dG8gYXNzaWduIGEgVklEL1BJRC4NCg0KPiAoQlRXLCBJIHN1Z2dlc3QgdG8gaW5jbHVkZSBsaW51
eC1tbWNAdmdlci5rZXJuZWwub3JnIGFzIHJlY2lwaWVudCBvZg0KPiB0aGlzIFBSKS4NCg0KSSBk
ZWNpZGVkIHRvIHdhaXQgYSBiaXQgdG8gYXZvaWQgY3JlYXRpbmcgbm9pc2Ugb24gbGludXgtbW1j
LA0KY29uc2lkZXJpbmcgdGhpcyBwYXRjaHNldCBpcyBzdGlsbCBpbiBlYXJseSByZXZpZXcgcGhh
c2UsIGJ1dCBJJ2xsIGFkZA0KdGhhdCBsaXN0IGZvciBmdXR1cmUgdmVyc2lvbnMuDQoNCnRoYW5r
cywNCmRhbWllbg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZ3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0IC0tIGdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5v
cmcKVG8gdW5zdWJzY3JpYmUgc2VuZCBhbiBlbWFpbCB0byBncmV5YnVzLWRldi1sZWF2ZUBsaXN0
cy5saW5hcm8ub3JnCg==
