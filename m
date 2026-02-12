Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0KeiJpbnjWkm8gAAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Thu, 12 Feb 2026 15:45:42 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 5886112E71D
	for <lists+greybus-dev@lfdr.de>; Thu, 12 Feb 2026 15:45:42 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 3DAD9401F0
	for <lists+greybus-dev@lfdr.de>; Thu, 12 Feb 2026 14:45:41 +0000 (UTC)
Received: from mx0a-0024c301.pphosted.com (mx0a-0024c301.pphosted.com [148.163.149.154])
	by lists.linaro.org (Postfix) with ESMTPS id D5777401F0
	for <greybus-dev@lists.linaro.org>; Thu, 12 Feb 2026 14:44:23 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=silabs.com header.s=pps12202023 header.b=smV7PDWW;
	dkim=pass header.d=silabs.com header.s=selector1 header.b=EJaAzScp;
	spf=pass (lists.linaro.org: domain of "prvs=050394110d=damien.riegel@silabs.com" designates 148.163.149.154 as permitted sender) smtp.mailfrom="prvs=050394110d=damien.riegel@silabs.com";
	arc=pass ("microsoft.com:s=arcselector10001:i=1");
	dmarc=pass (policy=reject) header.from=silabs.com
Received: from pps.filterd (m0101743.ppops.net [127.0.0.1])
	by mx0a-0024c301.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61C2Lwnn2678544;
	Thu, 12 Feb 2026 08:44:18 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps12202023;
	 bh=AWun+BxGj2leuJgVTMj5ykllYm8LFMqZmPe7Wu6eoAc=; b=smV7PDWWSFcd
	Cyff5Q4Zo/l78rpffS6yIaPap7M+PcOoY6kbfW1DgyRdcQPn5JsV04ANFT70JXZa
	p3MLTAk7EvgJg8Q5ASOW2sSeHrhyg+A1ROkKWD2bs0B+a0MgmnWUoOykPBormirE
	dsfS4ombOOw+0QdyHGkiZMBEOoaiE2GShHVRB1iWMXM0+W6INS3sdg+UcQR7G8Bh
	9Aq73/CNbLv13YuJDghRCVLne91cSKShkNNo39loiW7W7Kk3aouqvQnuHEtKK29Y
	eT8VEu4stQ25hx26MRluKB6sb+aFLQ1UlKK8QIknQwiHVq6Uhzu78qu2xuMFtwMV
	w0lR07RVzA==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11020096.outbound.protection.outlook.com [52.101.61.96])
	by mx0a-0024c301.pphosted.com (PPS) with ESMTPS id 4c92uysn4e-11
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 12 Feb 2026 08:44:18 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BYvO0fLVFF50Iy5k589EPBq3ALzSEC1cuQy9hGSPISn9L3ExfwXxURCAO8wMpwGzjBLlLWOBdmKpqS4yQpPfXIahGPPddTwsPDo1TDYyLFtliUVNbYfqGKvuBmhN4JqHOp+g+oRIheKhBWVzYXMZXO4YDKmchotORA0+jStJpFCVhiEQosba9xEYmxubyWDLnnFb8cq2r3Y5tUPag1OLvpMygAayCg+uNMk70Xkk3SOuUu74BZ+Udfq1ydeJqkSZnD2n0xs7JCkCMmhcMiWel/kwqguCbV2jzdCpVozOa8YZmeVf5C5QxXGlZeiz4i77q6n1jc51KHvCgm/8mFxdLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AWun+BxGj2leuJgVTMj5ykllYm8LFMqZmPe7Wu6eoAc=;
 b=c5DWutEaBEmBzphWepP0u6ldcbn0asyKwaw6/3K+c06IZ82kDx0pGVbCdVcRr8rFl2e6H/KGqQd03R+rIsDJLZR1Mall+eS/nG7mSiX6UmE5a5qixNUhxL85fy5BiBgph6dP7uf1gY/YDDeNzpoGNZguQwoBsFkJ1t1PkHw+USqM2oWXsh3r5/Lm59TBekahWu3PzozM87Qpjc+9ZbtQlOHHrmIuJcWf6Xvd9OC/imQsbRBaC93vYGAxt0/X14nbVPmJeYX3hr3+kG2iobyzwws8aCrphaVvkxPkCfym6JtRqj7b5mxaQy87Oe63aY2jL/zlHUagb/dbLcWnyBlIHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silabs.com; dmarc=pass action=none header.from=silabs.com;
 dkim=pass header.d=silabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AWun+BxGj2leuJgVTMj5ykllYm8LFMqZmPe7Wu6eoAc=;
 b=EJaAzScpGlLC+k7P7PhLg/v8wAP7kTzvsfxv9VazJQM0Sw3SArTGc9eH/5xF0SxB0jherTCegvQjLsrJgIXvnjfPfDVqZSwDuzjmOwEpqJ6rWXT1naEJJi/4Y4qyM3yNLzoRxBP4NL5NXJZP1IvSnqCf3eElnyWJ70Miy8+7x/c=
Received: from DS0PR11MB8205.namprd11.prod.outlook.com (2603:10b6:8:162::17)
 by LV8PR11MB8486.namprd11.prod.outlook.com (2603:10b6:408:1e8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Thu, 12 Feb
 2026 14:44:15 +0000
Received: from DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::2de6:bc88:2af7:3583]) by DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::2de6:bc88:2af7:3583%3]) with mapi id 15.20.9611.008; Thu, 12 Feb 2026
 14:44:15 +0000
From: =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
To: greybus-dev@lists.linaro.org, Johan Hovold <johan@kernel.org>,
        Alex Elder <elder@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org
Date: Thu, 12 Feb 2026 09:43:51 -0500
Message-ID: <20260212144352.93043-14-damien.riegel@silabs.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260212144352.93043-1-damien.riegel@silabs.com>
References: <20260212144352.93043-1-damien.riegel@silabs.com>
X-ClientProxiedBy: YQBPR0101CA0124.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:5::27) To DS0PR11MB8205.namprd11.prod.outlook.com
 (2603:10b6:8:162::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8205:EE_|LV8PR11MB8486:EE_
X-MS-Office365-Filtering-Correlation-Id: cd66d5d9-a093-404e-8a93-08de6a4531d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?R003NmtuYkFvSnphS001Nmpqc1RtUitQQTdoZnVnYjBTc3VSQ0xhekU1a04r?=
 =?utf-8?B?NUhnOXdIeng5U2EzMTBhM0tvSXQxckxKZ2ZEMjR6NTNmbFo5NVI4eGxMWW1M?=
 =?utf-8?B?L0pZMlZ4WHVGYUtjYTRyL3h4cFZmd1RVbGZBUXppaGRZRUxHdnBoSmd2QlJ6?=
 =?utf-8?B?alVLRmZiRFhsRTBXd2ZYekEzOVdRWmVEbVphZU1HWi9uZW9pWDRpRGJ6UFZP?=
 =?utf-8?B?b1hUOElhMGlmR1pDY1Q0Uno3MlREcDM1QlM1eFI1TEF2Yk1ZeGJKSy90bGF1?=
 =?utf-8?B?R1RTcTdVTnN4WmJ6N000MHd4N3M1cm5nU3pBdm5HMUFhK3o1Zm5kd2NTYVk3?=
 =?utf-8?B?aVBHL3Yzc0Q0Ykcxd1JCcG9uWVN3M2ZYUXJDU2NNeHM4S3pJTE9oSEIwRFgr?=
 =?utf-8?B?cmJTc2NIM0RCRGF5UlRCQ3FWN1JEWGozUGRnMjloMzRaaExvb2ZqbldWSUdk?=
 =?utf-8?B?ZWY0ZVBieGtEWDVRRXkrZlhCa0JXeHE3eDA5TjA2V3gzdTRGWm8yZGw1MDdu?=
 =?utf-8?B?VmJzUHJuTFVYSXRwMjZOa0dGaTFScmloVjhGVExwTkxSK3hFTWgyY04yRE44?=
 =?utf-8?B?VVBjUGJvRjFNeUw2d0V4TUVvMjU4cVQzL3hMYlZudklHejVBb3VIRjJaQldH?=
 =?utf-8?B?M3EwNnJtcy82dWt0VG5uVHY1RlFmeUl1eFpYQzViSFhtdzZGbGxCaEZ1Zmwr?=
 =?utf-8?B?M2ZqR0FJZjQ1YVlabDYvdDhZRm1oVElXQVNlc0RTL3AxMCtrLzN6K1dlSk5O?=
 =?utf-8?B?UFdheDRNOW1wbDgvc1J4amxBVUs2VFhaWlVLb2d5em1FOUp2NlpxVVdOaC8v?=
 =?utf-8?B?UkIzZ3JlazArbm8rblh3TUwraHpVSWZONTUwSWVMcCtydmdYQy94ZE01SUNM?=
 =?utf-8?B?R2Rnc0JSU3J2UkpLM2VDazUvTjg3ckp0R0V0dFhvTTZMOG5tM1Q1S3pZT3h3?=
 =?utf-8?B?aHc4SHBjTkdWUXBSUTJtZ1hyYjFyVVFTZ0krL0RRUnpkTXh2ZVJuTTdQeldp?=
 =?utf-8?B?RStRVm5ieFZyUFdzYldieE9XeitMOExEWnZUZ2cyWVpVYy9DWCtjcGQ3Vk9z?=
 =?utf-8?B?ZzIzejkwVTVLc3lPaWhReEJHczYvai9nTGJsd0h6d0VZOW15cUZwclZubVhS?=
 =?utf-8?B?VWdWbEloa25ZNnVHbG00WGFING5oQVRkcERwelNFdXp6QVhuSjkweGxGWW1o?=
 =?utf-8?B?bFBKN1h4ZU1WMU1VMCt6eERTcEJ1UDBKSmRTeFc4QzlsZkFtMkN1aVVwTUw4?=
 =?utf-8?B?a2VHaVJ3ZERsVXZoY1E5d2M1a1FqSFR4WE5SVjczSko4UkpSNGltWU5BMnMw?=
 =?utf-8?B?U0w0TDYxMTZjV1FaQUNiWTI3cXFvaXdwUms0TnJMdzBLT2lMR2R0dEtVVzIw?=
 =?utf-8?B?RDJOZ1NQMnd3d1Buc09HU0FmTkhFVlVnUUtZWFIzNUw1RUh4RnVUYjVuSTlq?=
 =?utf-8?B?RDNWSThUSE94dGMrT2l3d3Fzbjd6eU9oczIrNVJIOFh0bmhSTit4cWVzVmVj?=
 =?utf-8?B?R3NNUmRMSUpQVnhWTFlQSGZ0emZsQ0o5c1hoMkJoRlN0YkJIZDI5NGNCbGxX?=
 =?utf-8?B?ZGtuUnFPMlV5SDdJRVFlbmZWNHMrWVMwcVdkN053ZTc1RW1GY3RvK2pOSzBK?=
 =?utf-8?B?NXFlRWZoYklEc1NYNGdYZG1VUEFtVHljcDR3dFRLZTMvWnZJNEZmQ3FyZW5H?=
 =?utf-8?B?eXNYSFF4S2NnWU41aHNEMFdZRC9FV2I2QlNWRkJNZWwrQkhwcW5kWjhuMjdO?=
 =?utf-8?B?UU1CUWhMZjh4amgzdm85cXRPZzFPMTVNUzBjMHNHUllIT2pQL1duTHJIaXlj?=
 =?utf-8?B?KzRjKzFCRHlMM0FKQnVqRDRMSGdjMDlMMVU3QWhaQll6M2p4SXp1NGd3UkJj?=
 =?utf-8?B?Z2NkdVl6aUFDckNFd1FjNU9XczRtVXYzOCsvYkJYVHFNcUZadzM5RjlaRVBI?=
 =?utf-8?B?YXQ0c3lDbVJsQkhrVmhMeTNvUzdLeTZDL3NxRFo3S0l5T0xZY2dlekhDRTdp?=
 =?utf-8?B?Ym8rMUtPUmkvY3l3ZnZnYm9BZHc5S1dySmdMa3VtSVBTYndGS2tYZThhYU9H?=
 =?utf-8?B?WUlPa25hcndmN3l6bFBwSGhETTBibEhTUWxyQjJqY3BOZnlKWkE5UW5HTCtQ?=
 =?utf-8?B?eGtzRXVESW5Oa25zRlA1OVFiaFd2b24xakpTSkdTOWhnRU9QcTBLSExRUVRC?=
 =?utf-8?Q?kspswGDxpihdBvC4+8RBMNg=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8205.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZmtMSVB5dE1wNEZFdmxKODdQcnVDM1NteUcwcmxzRjdHZVd5eHdGcnRLQ2ZW?=
 =?utf-8?B?anRTanhNcjBoRlVhSHU5UFEwVE1WL0lUN1VoSlBKU2NUQjRqM0RNL2RxQ2R3?=
 =?utf-8?B?SE5pRnJFZUd6cHNNK1hWTmw3TjQvOXRJRkJGVGhkU1k0QjBHeXhtaDBFdlJr?=
 =?utf-8?B?N1NGQ1JwUjV2SUlBekgxMUpBbmhQWURsZUY1VDYxc01pWGpxRHBSbmlkUUNY?=
 =?utf-8?B?alRmSjJTSWJiN1hURm14NGhIeU9lWi9Hcjd0YS9ZWmdVejcva2NjSkZPMWQv?=
 =?utf-8?B?cE0wMksvTkRYUlh6Kyt2M2Z5eU5wQUIzbjRicktvb08rdHdzd1N0aW02eXg4?=
 =?utf-8?B?NkZBL1k1R25jQlhkdFpVZUVGdmFzUUxROUJxZ0NsVG56UXhadUtuQWNabHRR?=
 =?utf-8?B?ZmhNZjdicUQwUFlxK2tTVlJ2SGRYenVrRWdyS1drMTVUNmpxdTNKbFpNOThZ?=
 =?utf-8?B?WDZWZkR2U3R2aTRkZk1ISlZwRG9pTUM4OTE1Y2FSZEV1STl1Wk4rZHNWS2xB?=
 =?utf-8?B?WHpjRXVXcUJFOGJ4U0dKSjFlRWNIYlBnYWFDckkyTGV4YjhOK0c2VlhtbEhU?=
 =?utf-8?B?Q2NhWDc4RVBJZWFSOVlza1d3Q3JnY3FvcDlTZ04wNFRoZjlkTjlEM3VkeGpp?=
 =?utf-8?B?S0phd2ZqeGpLQjMzcUpqdnhXUzVEQm42c1ArZ1BKSWlIMFBMRnV1QXRFYWV4?=
 =?utf-8?B?VzVMQTU0clU1UEN5MCtIRTlYSWNUbldBSXpHb0l3ek1vZHE2b3dPT0FhRzZ6?=
 =?utf-8?B?WjZaZ2lsc1NqR283MXlZblFJSk1FOW5FeVI4QmJiSXd5WjJMZkNSQm95cFlX?=
 =?utf-8?B?dHdqRW1LQVR3MlNyejdNRXBYT2xKNEI5aVc5NElNUmpGSkREYXl4UzQvY0JW?=
 =?utf-8?B?VDYwOHdiejFVQnRhdWsyNWxuT1I2clJaNXNJZWcwRXFiSHpPRmpMM015REdU?=
 =?utf-8?B?UWozR2tBdkRnRDQ4Vm5PVGFQcHdDbnFBTmJNcG1NcFpNOTlPZURlNVBqc1dX?=
 =?utf-8?B?Z3NYUG5zenpucE5yV2JhUnNOS09kYzRJM0tmQmU0SWhsY1B2TWJ2dlN6cEsv?=
 =?utf-8?B?NlkrMTZwVkhKS2FFb2x5NWI4OW1GaHlUUVE0WEtaNGlYR3ZBVWJNa0NxTGtk?=
 =?utf-8?B?aXBpeUZ4TzkzdC9VajhTWlR0bjlYeHRINE9iTk9CbEFrWFV1ZjlMVk5rWlp1?=
 =?utf-8?B?b2ZIRUVQUnVJNHdHNkJWRDFTUkprM1JFNWdrTDcvUEZCOTZVTTZLSnhqV2xH?=
 =?utf-8?B?S3VLaFFhWHB5Y3c1b1ZTcFMzZHhHMy9YMWk1TXJCUXBKNmUrMG9XQ0dSTDBu?=
 =?utf-8?B?ZXVPZWM3bHJmM3paZVJpbjRlWjk5dlcrSjlZSVJXM0tLZ0ZGRis1YnRRQnBz?=
 =?utf-8?B?NGRBRUpnaHVQQ0ZyVFo1bGNWN1VRbGxOTXduNEFEYWJlWlI5eDQ2MERLRUMy?=
 =?utf-8?B?eTJoTDBOR0RGMGVnT3U1TGdSVTQ4Vkh5WW93N2ZoN1RFUGhZd21QZlNxdW5l?=
 =?utf-8?B?N3J1TDhUR3Z3R0dlZUozOGI2WXk1SEx4MVhRTGhuYXZWRk5sd2Rjd04zS3No?=
 =?utf-8?B?Q2xxMHgxT25ONDFGUUZhb2lEM3o2dXA0WkZYTDRXVE5EeG9UWkdOTHJOQU8w?=
 =?utf-8?B?ZDVzS083cG5TQjVvNTFmbDBESkFVdk1ici9nZmFmZ2xZTkhTQkt0dkFCZHM2?=
 =?utf-8?B?dGNjdVRNUm1YVVRRRlZ2dENtZjBWRUdvbm9WVFdFczdWamxjUkdKYmxHNGRj?=
 =?utf-8?B?TzZYRDZiZVNPaWcwNTNpdE5hTVVZWVYrSkZJL2N1SEI3c2EvM2ZqZWFQVWE2?=
 =?utf-8?B?U1ZIbW1vQkwwenBPcDVzV08wWFl3ck5wRm1yUjdKNzVtZWw5S3J3YldJaC84?=
 =?utf-8?B?YkVnQlRqamtCY0VhdFN6YjA3UnBnQ2lTNXFKcy9NS2VRRzFaZ0RSMkcxcTNl?=
 =?utf-8?B?RkRwMkFRNmRUSjRCcWcydUwzbC9kdUcxbDZwOSt5bU9BdVAvZGd5Y3k5V0sr?=
 =?utf-8?B?NCtaUmtmRDl3Zy9TVGlSdnpDNkVFVDVoR3Y4Vm5mUGxCcmI2NThFTFNVdlVL?=
 =?utf-8?B?dDcvS3F0dk5wMVNIemdRNzhxQlhxQTZveGpoMmNNUndaMlNCdVhYNWJ6VmhN?=
 =?utf-8?B?dmFNcGV1cDh3TXdaZjlEWWl5L1Y1T21MZXo1Q2ZQZmxGNnVlM1FCdmlZTTZ6?=
 =?utf-8?B?Mk91V2NUaU9YOHpPUlFOYlVIY08ySDgwbVZjYU9aOGdkUXBad2NZNmpqN1o3?=
 =?utf-8?B?anBtQldOUDZscTRFRkVaWjk2YXo2cUZsOVhmZWkrYVZyQkhLQ1plNXZvbVBQ?=
 =?utf-8?B?K0FHV3N5RkxENVVhMlFaNWhrT0EwcE5LSjRlVmE4VGZJQ0YyQURmdz09?=
X-OriginatorOrg: silabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd66d5d9-a093-404e-8a93-08de6a4531d8
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8205.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 14:44:15.6598
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 54dbd822-5231-4b20-944d-6f4abcd541fb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VR8RTWUKiw6vNYIJxwVI1Wgr8qb0p7dhcEerD7qcHgmRwzZjebFgZhIk7mMTsp5T8oEYY23DPnfJeJIMFwAP8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8486
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEyMDExMSBTYWx0ZWRfXyH8W1iXd+Es1
 X4dt312Egi3OfQozhXEKjJVLgIcqfJ9BhAv0+3FDhTeNDN52EgEEzVItmhg8V4stvJDtvvv3NYY
 Z26NxodQnVZGXUXmFjTdHX6/qtVENt/Grz1AIodnbhLklTd3mNAh2mm/zgwyH0NvqAhmNrXAVmi
 Dx8m70L8Xsuyh2WljYiDrY9rtis3gMZXYGsiMf5wft0VALykOuu6Y1AeDJoR1lqJUDoCIoWt3Ye
 f0bxJfOoPDt6qhVWgXbGUVX3C817Pq/HQk73P8rYbBuVccTJYihEsT9hpLZx9LLA1iPusA5jJ3D
 oYMe3Mr8PwzO65S5Da5BD2QAeSSm+3vWfh9SsYQa+m8Wpq/HIQ9zyq/Xs8Sjm+YcKf8HmUkk0LU
 hDcGIKFEur9cZTXkoLljTWUWvi5w+xAVk7THXtyDiaacXYy7No9cmPd2e7Z+/xO58FYPwESEeX5
 5c+VH3YEIoTWvk6kcTA==
X-Authority-Analysis: v=2.4 cv=DtRbOW/+ c=1 sm=1 tr=0 ts=698de742 cx=c_pps
 a=TvliyZNEFSK35vtP2Nadqg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=M51BFTxLslgA:10
 a=i1IsUcr2s-wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=2AEO0YjSAAAA:8 a=8szWe6Y7soD9Pg2qZbAA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: phbMnKACmKXMmTAEdGfI9griT1p3fsOI
X-Proofpoint-GUID: phbMnKACmKXMmTAEdGfI9griT1p3fsOI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_04,2026-02-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602120111
X-Spamd-Bar: ----
Message-ID-Hash: GPVNOO6OZH3VZXLJUMN56OACZXKDCIRS
X-Message-ID-Hash: GPVNOO6OZH3VZXLJUMN56OACZXKDCIRS
X-MailFrom: prvs=050394110d=damien.riegel@silabs.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Silicon Labs Kernel Team <linux-devel@silabs.com>, =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v3 13/14] greybus: cpc: add private data pointer in CPC Host Device
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/GPVNOO6OZH3VZXLJUMN56OACZXKDCIRS/>
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
X-Rspamd-Queue-Id: 5886112E71D
X-Rspamd-Action: no action

QWRkIGEgcHJpdmF0ZSBkYXRhIHBvaW50ZXIgd2hlbiBjcmVhdGluZyBhIENQQyBIb3N0IERldmlj
ZS4gVGhpcyBsZXRzDQp0aGUgaG9zdCBkZXZpY2UgZHJpdmVycyBnZXQgYmFjayB0aGVpciBjb250
ZXh0IG1vcmUgZWFzaWx5IGluIHRoZQ0KY2FsbGJhY2tzLg0KDQpTaWduZWQtb2ZmLWJ5OiBEYW1p
ZW4gUmnDqWdlbCA8ZGFtaWVuLnJpZWdlbEBzaWxhYnMuY29tPg0KLS0tDQogZHJpdmVycy9ncmV5
YnVzL2NwYy9ob3N0LmMgfCA0ICsrKy0NCiBkcml2ZXJzL2dyZXlidXMvY3BjL2hvc3QuaCB8IDUg
KysrKy0NCiAyIGZpbGVzIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkN
Cg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3JleWJ1cy9jcGMvaG9zdC5jIGIvZHJpdmVycy9ncmV5
YnVzL2NwYy9ob3N0LmMNCmluZGV4IGQ1Y2ViNjU3ZmE5Li41YzExZjljNmJkNSAxMDA2NDQNCi0t
LSBhL2RyaXZlcnMvZ3JleWJ1cy9jcGMvaG9zdC5jDQorKysgYi9kcml2ZXJzL2dyZXlidXMvY3Bj
L2hvc3QuYw0KQEAgLTE2NCw3ICsxNjQsOCBAQCBzdGF0aWMgdm9pZCBjcGNfaGRfaW5pdChzdHJ1
Y3QgY3BjX2hvc3RfZGV2aWNlICpjcGNfaGQpDQogCXNrYl9xdWV1ZV9oZWFkX2luaXQoJmNwY19o
ZC0+dHhfcXVldWUpOw0KIH0NCiANCi1zdHJ1Y3QgY3BjX2hvc3RfZGV2aWNlICpjcGNfaGRfY3Jl
YXRlKHN0cnVjdCBjcGNfaGRfZHJpdmVyICpkcml2ZXIsIHN0cnVjdCBkZXZpY2UgKnBhcmVudCkN
CitzdHJ1Y3QgY3BjX2hvc3RfZGV2aWNlICpjcGNfaGRfY3JlYXRlKHN0cnVjdCBjcGNfaGRfZHJp
dmVyICpkcml2ZXIsIHN0cnVjdCBkZXZpY2UgKnBhcmVudCwNCisJCQkJICAgICAgdm9pZCAqcHJp
dikNCiB7DQogCXN0cnVjdCBjcGNfaG9zdF9kZXZpY2UgKmNwY19oZDsNCiAJc3RydWN0IGdiX2hv
c3RfZGV2aWNlICpoZDsNCkBAIC0xODEsNiArMTgyLDcgQEAgc3RydWN0IGNwY19ob3N0X2Rldmlj
ZSAqY3BjX2hkX2NyZWF0ZShzdHJ1Y3QgY3BjX2hkX2RyaXZlciAqZHJpdmVyLCBzdHJ1Y3QgZGV2
aWMNCiAJY3BjX2hkID0gZ2JfaGRfdG9fY3BjX2hkKGhkKTsNCiAJY3BjX2hkLT5nYl9oZCA9IGhk
Ow0KIAljcGNfaGQtPmRyaXZlciA9IGRyaXZlcjsNCisJY3BjX2hkLT5wcml2ID0gcHJpdjsNCiAN
CiAJY3BjX2hkX2luaXQoY3BjX2hkKTsNCiANCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dyZXlidXMv
Y3BjL2hvc3QuaCBiL2RyaXZlcnMvZ3JleWJ1cy9jcGMvaG9zdC5oDQppbmRleCBlZTZhODZkZTMw
OS4uNGJiNzMzOWIzOTQgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dyZXlidXMvY3BjL2hvc3QuaA0K
KysrIGIvZHJpdmVycy9ncmV5YnVzL2NwYy9ob3N0LmgNCkBAIC0zNyw2ICszNyw4IEBAIHN0cnVj
dCBjcGNfaG9zdF9kZXZpY2Ugew0KIAlzdHJ1Y3QgY3BjX2Nwb3J0ICpjcG9ydHNbR0JfQ1BDX05V
TV9DUE9SVFNdOw0KIA0KIAlzdHJ1Y3Qgc2tfYnVmZl9oZWFkIHR4X3F1ZXVlOw0KKw0KKwl2b2lk
ICpwcml2Ow0KIH07DQogDQogc3RhdGljIGlubGluZSBzdHJ1Y3QgZGV2aWNlICpjcGNfaGRfZGV2
KHN0cnVjdCBjcGNfaG9zdF9kZXZpY2UgKmNwY19oZCkNCkBAIC00NCw3ICs0Niw4IEBAIHN0YXRp
YyBpbmxpbmUgc3RydWN0IGRldmljZSAqY3BjX2hkX2RldihzdHJ1Y3QgY3BjX2hvc3RfZGV2aWNl
ICpjcGNfaGQpDQogCXJldHVybiAmY3BjX2hkLT5nYl9oZC0+ZGV2Ow0KIH0NCiANCi1zdHJ1Y3Qg
Y3BjX2hvc3RfZGV2aWNlICpjcGNfaGRfY3JlYXRlKHN0cnVjdCBjcGNfaGRfZHJpdmVyICpkcml2
ZXIsIHN0cnVjdCBkZXZpY2UgKnBhcmVudCk7DQorc3RydWN0IGNwY19ob3N0X2RldmljZSAqY3Bj
X2hkX2NyZWF0ZShzdHJ1Y3QgY3BjX2hkX2RyaXZlciAqZHJpdmVyLCBzdHJ1Y3QgZGV2aWNlICpw
YXJlbnQsDQorCQkJCSAgICAgIHZvaWQgKnByaXYpOw0KIGludCBjcGNfaGRfYWRkKHN0cnVjdCBj
cGNfaG9zdF9kZXZpY2UgKmNwY19oZCk7DQogdm9pZCBjcGNfaGRfcHV0KHN0cnVjdCBjcGNfaG9z
dF9kZXZpY2UgKmNwY19oZCk7DQogdm9pZCBjcGNfaGRfZGVsKHN0cnVjdCBjcGNfaG9zdF9kZXZp
Y2UgKmNwY19oZCk7DQotLSANCjIuNTIuMA0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpncmV5YnVzLWRldiBtYWlsaW5nIGxpc3QgLS0gZ3JleWJ1cy1k
ZXZAbGlzdHMubGluYXJvLm9yZwpUbyB1bnN1YnNjcmliZSBzZW5kIGFuIGVtYWlsIHRvIGdyZXli
dXMtZGV2LWxlYXZlQGxpc3RzLmxpbmFyby5vcmcK
