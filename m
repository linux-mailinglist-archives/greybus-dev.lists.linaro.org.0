Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mBA8DLPnjWkm8gAAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Thu, 12 Feb 2026 15:46:11 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A4C12E752
	for <lists+greybus-dev@lfdr.de>; Thu, 12 Feb 2026 15:46:10 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id F1AA2401F0
	for <lists+greybus-dev@lfdr.de>; Thu, 12 Feb 2026 14:46:09 +0000 (UTC)
Received: from mx0a-0024c301.pphosted.com (mx0a-0024c301.pphosted.com [148.163.149.154])
	by lists.linaro.org (Postfix) with ESMTPS id 381A3401F2
	for <greybus-dev@lists.linaro.org>; Thu, 12 Feb 2026 14:44:29 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=silabs.com header.s=pps12202023 header.b=BIX9YKrr;
	dkim=pass header.d=silabs.com header.s=selector1 header.b=A8iKnTAO;
	spf=pass (lists.linaro.org: domain of "prvs=050394110d=damien.riegel@silabs.com" designates 148.163.149.154 as permitted sender) smtp.mailfrom="prvs=050394110d=damien.riegel@silabs.com";
	arc=pass ("microsoft.com:s=arcselector10001:i=1");
	dmarc=pass (policy=reject) header.from=silabs.com
Received: from pps.filterd (m0101743.ppops.net [127.0.0.1])
	by mx0a-0024c301.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61C2Lwnf2678544;
	Thu, 12 Feb 2026 08:44:13 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps12202023;
	 bh=JyvIMniES/hEJp5c5OeabTiifgLp4ZH8+SGCNRnDIcI=; b=BIX9YKrrZljz
	4JGcQDLG2Bbftc4CKGBnyOm8M5SJu6cZ4n9tt6bmGJ3kB0Bhb7tDSneqv8cBIqZE
	sKP5C6K78Xfgzn+6ggFhPgbVNK3Ej0KRLAfJGzkXZSVhbqU467Gcvmuc+oLWDKAZ
	qWJBDwBn0MKxPeOPfiZuqF+j8b3UBhZpWMKMUDYnC6ic2dfEmN96cVg/a29RWWI5
	LMy5IsweuOIe6IB8kpd9sf2fGzsEiKRRSAjBI0ciwRsefA3hy1j7O+ZnXq1XJCxQ
	kC82Dmgf4L5UoHpak8Q7Hyrq32C9G7qgaS+bccqpQX+IU9NwgQUV1N3FH2lFb4lH
	wb6Ni9RXBg==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11020096.outbound.protection.outlook.com [52.101.61.96])
	by mx0a-0024c301.pphosted.com (PPS) with ESMTPS id 4c92uysn4e-4
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 12 Feb 2026 08:44:13 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KUrX28Im4/FvA9havanAEqJtjEcL++l5pwqmDLRXRwzMgv0mVGnb6jUok3bSbQvVIjtXxkXJtscVjU+cXnEU+rKDtYS1pKZkHOEt2RQ41r0QQnW6Ti3Hb9R625+cUXusboP5gBmIZqdeY7po9gaCxUNYZwmmZHx1eaA9o0uK+AFt5Puifn8Dq3OyfvsdfpvGInK9v8YEW0iLhl6T9oSQuK4LPIYApOoPG9b+WbV3SCSIOhUirmycjGDNEFwlEPYwk177XNB+yQHdZiZABmZ6gBfhP9wpq06XWBg7ASLWowZp17dycZht6ZEycGVHiH8+nKrB6/9xeeWM/t53mjZ4vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JyvIMniES/hEJp5c5OeabTiifgLp4ZH8+SGCNRnDIcI=;
 b=N1JUDQEwDt8zlXhSMOh93hUHLb7k5W5MUpzYuZUoijSErv3w6InEFWiapX79SXEmYnUTRm0y2zjEFdNNDOM3AKTs03QbfAYdWgkABntwN6RNaLUUb5jAUmvZQMWGSotxYyFKkexiVSDJIDRx5MWJQeX/2V4isKkbPI8HkvLbgTklYynv0RSsERGUSiB781ZYaXMz9cu5cjbCe45NDNu18uKbnQI2YQbMjGw50Z7oRIpdfZwDBU/t/3WweTNC4aVWKtoM0jxdNNloxGSulE8xIFm2t7VMOrxoPClOtAbjjn3Www49KJkwDCqXueB7KIq9n1pXxCqHrLpTSEETRgFg3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silabs.com; dmarc=pass action=none header.from=silabs.com;
 dkim=pass header.d=silabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JyvIMniES/hEJp5c5OeabTiifgLp4ZH8+SGCNRnDIcI=;
 b=A8iKnTAO7v9G07QAgTpFNH7cHDY89qgQ1672/YbFGA93b5UTr3YYD4jUGMobj+zALBOPZCiQHTK+HP2xhdmi/YXi0MKTpWif7bR7reG7GygyMJ0mmTBKi5JRDTNQM0WyoR0ljLcKoKBWqAr7/80ZQ9ljStv4FDi3UV7l8As4CAI=
Received: from DS0PR11MB8205.namprd11.prod.outlook.com (2603:10b6:8:162::17)
 by LV8PR11MB8486.namprd11.prod.outlook.com (2603:10b6:408:1e8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Thu, 12 Feb
 2026 14:44:09 +0000
Received: from DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::2de6:bc88:2af7:3583]) by DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::2de6:bc88:2af7:3583%3]) with mapi id 15.20.9611.008; Thu, 12 Feb 2026
 14:44:09 +0000
From: =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
To: greybus-dev@lists.linaro.org, Johan Hovold <johan@kernel.org>,
        Alex Elder <elder@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org
Date: Thu, 12 Feb 2026 09:43:44 -0500
Message-ID: <20260212144352.93043-7-damien.riegel@silabs.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260212144352.93043-1-damien.riegel@silabs.com>
References: <20260212144352.93043-1-damien.riegel@silabs.com>
X-ClientProxiedBy: YQBPR0101CA0124.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:5::27) To DS0PR11MB8205.namprd11.prod.outlook.com
 (2603:10b6:8:162::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8205:EE_|LV8PR11MB8486:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ef3dd43-f9f5-4b6c-f861-08de6a452e41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ZTdzVFo4YnlEMlc2RHdXbk4rdEs2WWpSR2Q3VlZYNUZlaWpWZHBPVHllWXgx?=
 =?utf-8?B?MW9kaFlIeXM4ZVdkUzVEZmgvNkRNQ3VQZkNEeWoxM2NnYmsydEVwOHRlNW16?=
 =?utf-8?B?dHBWT1RSOUtRSTl3N3pHdlBFNDdaQ3k0cHprWHp5WHZ0K0x2S043NlBNWlpt?=
 =?utf-8?B?cko4eW56UmVMVUJFSTFPSCtEa1FMK1lMQThLSWNvb2UzNHV5RWN1RVlaZWk3?=
 =?utf-8?B?SlhHblUvdGMvNFl6dmYwd0FKbzU4RXhGU2VLcDFoTEJLWjRCdExaalZHNUN5?=
 =?utf-8?B?WkJYb1RLWlZzUk5qNHZ2ZVdST0R4Wm5tWGRBUC9wTDFkZmJxNmZWRjRyUUk3?=
 =?utf-8?B?cXNBanJ1dE5zOHZQTlk3OThTZDNOTmpFaTdwNmFEK2duNXh6ajR5WTZOMk9H?=
 =?utf-8?B?VXd6WWw1aHhSNEVQZFZCTlFYbzg4TlhwVmtFRkZ2MEhVQWh1NnNjcDJiZFVJ?=
 =?utf-8?B?MDhoUjdHSEM1aUxVV3duNXdyeUpnNTB6eFZyZW0reVZRM0R4Zzd2bHZoV09h?=
 =?utf-8?B?OGhsbzVQb3dqOWR5V1NYZmxWckFQN2RubGlJM1RiRU5pUVlKZWVRUlJuR1Y4?=
 =?utf-8?B?YnJPSFZ3YVIrLzdvbkNtaDAxZi9BZGs4MGpodEwvK09LQ0FDa1h0V0p4bHRr?=
 =?utf-8?B?aDdidnpVeG1ybUVaY1RaaFJXNEdNRlRnOTUzbVN0am16VlpQUTJucmpmRGFM?=
 =?utf-8?B?Zjg4VXBJckJyL05LeWkwUVJJT09kZlpUUU1nRlVESm9EWGR3ckZsMUFtam81?=
 =?utf-8?B?WGZDOWRVRWJaVXFuSmZocTFzVUhPRm9paVZlRG03bURjVEdpbS9zeW41QitX?=
 =?utf-8?B?TVk4bk1LcjFLNFFtZFNvcndwU1A0allFS3BLZEIwVUxEcGNWTjllUEhvNWRN?=
 =?utf-8?B?TDJ6U1JrcFFEeWRLVVg4a3R3ZDlUN2d1WUVDeHYxT3cxaDQ2a25BVUNrSDJj?=
 =?utf-8?B?MlJjWEV0VFNLN0dZVUxpUzN2U3EwRDViNUIrcEFmZkI4bmZxc0UrQlkycXpk?=
 =?utf-8?B?L0tNajY2cVZqYWNoUmtkS2ZyeUsrazdXNy8wVXFubUZaYmVoTmZRcXllVTdX?=
 =?utf-8?B?a09Qcy9tNWJPTG1KbDFrTytBU0Y5dDBrWTl2VzV1QWhQT1dnbGdCb0hhN0dm?=
 =?utf-8?B?MkVtV3hyOE8xZDZYZnNuRTFSN1U3bjhTN1Z1MTQ1RW53ZUs3TVlKMFhUbHZt?=
 =?utf-8?B?K2JMaERNSEZYNW9Oanp0dWhXd2Z2V0VtQ2h1TVJwTXViQVJWa2htRjRiMDd2?=
 =?utf-8?B?ajRjZld0SlhhRHowTnVRSDJ5Tm9PeXlUeVBSNVU0Y0lvWHYrZW5ua3hDcTZu?=
 =?utf-8?B?WmZ4Y3QvWWF2eTlPZ1NSN3lVaDRVMHp3dnBQanY1OGptUE1PR2tHR094eFho?=
 =?utf-8?B?Y2VhNXJpN1U1ajgwVWZIa2RSMUEvaTh5cDd1UlMvTnFLbkFyOWNVb2dEL293?=
 =?utf-8?B?bFA3Y2cwTk9sRjJPQnExVkJlVEQyVDNGU3J0MGpuK1JlN2JxRS9xbk5oWHIz?=
 =?utf-8?B?TE94TWh3cXJ0UTJZcHVwYzR2UHZldjBNTDllZXJScld2RlcyN1RLblVuWWVn?=
 =?utf-8?B?REdMR1dGaFZFRFVXYThBak9CekpBNGdvbXI3WVdwa3dFSVZRU3JDK0tSZmFF?=
 =?utf-8?B?U0pwRTI1c1VUUTNHeWQzVC9Qb0w2WXdmdXVtUm1Qb1NBY1pTMHpMYWNPTVJw?=
 =?utf-8?B?VERhbEdPQ2dFMXpWeUFiVWlWY2hZUjNmZGZoRVU1OVFwUnJQcXl0dC9vTFZh?=
 =?utf-8?B?T2ErL2ZKTUZBd0szVGZVNVpHcUtSdDBiemZZbVpvMDlZTWQwZlBNOEJ5OXM5?=
 =?utf-8?B?RkJZUEVjR2RRMGhlNlVNb1pzTEUxcTBadDFFNzRkZk1zUzBsNWxTY1M4WlEx?=
 =?utf-8?B?WjdDdVZ5SVprb3BodTBscG85bWczL2VWbVVJSm15SzdVVTA5Und3K09uQ0lL?=
 =?utf-8?B?eHJudUhvSkZFbFZhT0sxR3VVYWJXM01oMVdJRWRqU1ZrR2Z0bEZ5NmVkVEVn?=
 =?utf-8?B?ZHc1ZFZ1cnpLRnJwRzlqc29LSWZnOWhoejFaRHEydG5rN3RqTTdnNlUrZ1VB?=
 =?utf-8?B?UWpidHA1Ty9icXVLUnpta0ZHU2l5a29mZ2preWZvSjZsVk9EMkJzaEtGMklz?=
 =?utf-8?B?aG1rU1hnUytRYjBRYjJ6d2Q4TG04U1Bya2pydnFBOUdEV1VwZUlzdW9NQTZa?=
 =?utf-8?B?Ync9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8205.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cVdRTmtXVkxtMGM1WFkwU1duNGc5YTJWd01xWmxNY3I5b1JaZldpeXg5OEJL?=
 =?utf-8?B?dmUyWFg1NlpOVzkxa1FoMGNoaEFUQ2ZyUXUrb3kzMkZBT0M5VXMrQTBDVUxK?=
 =?utf-8?B?MmM1S2xtUklRTSt5T2tFTS9LbGVOUWk5cnpBUjFxTThPcGVJOG5td0NnaUho?=
 =?utf-8?B?Q05DbGtCSzlqYTJ1cmszSXJNVXFad0RLL3krMk55ZGxwQVUra1E4QlR1bkRz?=
 =?utf-8?B?MU1lbDBBSUw3ek5zamhJR2tLNzdJeGNFM2RrWTBTc3kvM2lBWGJBZ0Q5MzBW?=
 =?utf-8?B?ZzdBaG9saW9ieW0zaVk2UnA3N1lFdXFCQkROM1pSWFo0TTBnQnVWcHlNUllw?=
 =?utf-8?B?MXQ4WVhlRnZRU1lSYUMrNUI3NnJsalRKQnBTV1UzRW44Nzd6ZkM2V013MVRP?=
 =?utf-8?B?cUliTjZtNkU4V1FDclJPakVWSTk4U3VtcFhDa1QweWdPVHJpc3Q1MDJZZjdZ?=
 =?utf-8?B?bXIxdGIxMHBBL3h5Y1BaMnVDM1lRbElzMy9hTk1OT2NXY2xSZHBWTU1hTTdh?=
 =?utf-8?B?ajdDNU1kZmhWMGgwMC9sTURlNTJYZmVubVl1RHkzNFRnVVdrTEo3M2ZVZVNK?=
 =?utf-8?B?eXhKaUxtNk05UFE1K0pDUUxqZ3NreklueTFzaGFzekROcmpQQjVYS2NiSzR1?=
 =?utf-8?B?MFovTVlsTVVZNkc4OGtJekZ1ZDNqQmhlK2NINmRFellyWkN6TXJxQzNPbFFT?=
 =?utf-8?B?akV4N1F4aElzS0MweHV5RVExVHZKMU53eHNhVXEybFlKcFVOby9FV3FQM0tE?=
 =?utf-8?B?d0Via0llR1JuS1BmVklwb1MyWlJIVnF3bGRPaE4xcU5McEhGNnVRU2NFR0lI?=
 =?utf-8?B?UllFV3luZFZpc0dvYVVsV3IvNWdZWktoWHcyaDNXMGxuU3NOZjZPdkpwSHM4?=
 =?utf-8?B?N1NLR3RlL3p2WExjMHQ4QnIzNVhnKy82MFRkcTJHcXkxdFNxQW13Um1XbGhO?=
 =?utf-8?B?dHFjTWZtY2JSZDJQaTcrWFM3VkRmUGRIbjE3c2wrVWhENDVNWjErb2cxM1RT?=
 =?utf-8?B?bjdINERUV0QybWcvWjR6VFJ1QlU1QW5FSENxMk13RklsQ0FQdmxTQUFOSDc4?=
 =?utf-8?B?d0dpcEYrcjEvRVBBSmJuNGVPejJoTWdrdVVZUzNHN0JXQ3R1VHZHL2FZQndN?=
 =?utf-8?B?d0hsTVFaeUFJQm1XdkpiRWhtYXl0T3BoNmZ1ZFhlR3dkWkhiYmFLSUVGSXR5?=
 =?utf-8?B?ZVFwYzJhc1lXNDVlZTJxQmZnUmFVRGd3QTZUTEpjM2pzV3NCbDdRYVFnK1pj?=
 =?utf-8?B?anJldG52V0VIc1p2ZVNaOFAzWEFsWE8wV2d1RXhKOXAxL3U4RnQvV2JqSXpy?=
 =?utf-8?B?a2JXbGRuN09yQ2dYT2pzRk5vb2ZLNWMvYUErTnpXT0oyZ2Y1VlA1aE9KL25I?=
 =?utf-8?B?d29zbk9jcEt5ZWVHRXpBT0RUSlNyOEFYbm5qWGJNbm83MWJBanJmNFlObmpS?=
 =?utf-8?B?akJRTUZ0NklIWUZYNC94a01rUG5ITXlGVlpIZ091WHhJQ21RMTE5ZThVdTVB?=
 =?utf-8?B?NkJHNnNhRU1KYWFDUC9lcHBDbS94bXArR3lCREV1Zm1hUmM1Um96TmljT0FK?=
 =?utf-8?B?TFVXUkhVYm5Pby9xblg5SlFpNTRyV0NNWnlOZjllci9hUkFwcHVFenZ2OGcz?=
 =?utf-8?B?ZHIvNHBhRVFuaEp0UEd4RU0wRVBCSXdqYU0rM21JS3NEZHozL3A3TjVCaU9r?=
 =?utf-8?B?VzI2WGZDcWM3TjZXdU81S1pBdVBBeEcvZEE0aU43dkluVDU3cmVDTDRiRVVy?=
 =?utf-8?B?SEYyL2JoN2hPZW5uMlc5OGdaMUJiV0xUNi9EWlFPZEdNNFpmZW16eFc3aHIv?=
 =?utf-8?B?TUF0MVNUYnlZZFhoaWpZcVRCL2pxeGxUVlNiOFFJOU5yRHFvTVE3djFlQzl1?=
 =?utf-8?B?WTJDYnJZelJ1U2hneHpkSVZBZm1xblVJTXV6V3dFYUlsaW5jK0tHL2VCbTBF?=
 =?utf-8?B?WEdMc3ZkYmg1ZFpWak9MTUZEY0FCZEo2R1V2WDVkV1c0cWk4OFlseXgxZVpJ?=
 =?utf-8?B?WFBHY05WN2FtcWFqZlNVemZWMGlEZ1J4QnhGSlh4OUJESHMvbnB3Q1lvaTBw?=
 =?utf-8?B?VklEaExTaGNuVExEMWNpeUtZbWxybklzMGxYZ0w1UEtkUllKc2RzbTRuNmtS?=
 =?utf-8?B?UWZqZXlGV3ZTRjNYVlV0dE5LRmErMnMrenV4ZkpBOXQrKzZtMCs0ZG5FUXl5?=
 =?utf-8?B?Z3k5amVpUFlrZXA1dzNNME9vaXpiSHNackc4VWo0WXM1V3JJQ2VTcnlqbCtM?=
 =?utf-8?B?RVp0cEd1MEhZa1g2ODB6clpWMk1sZWRkN0ZWb0o4Z3l4Y3ZjbG16LzdYZFRN?=
 =?utf-8?B?RGU0aWZzUGdJcjcvMDMvRU04aG5sSHBZV0puVWxLUWY1Vmg2VC91UT09?=
X-OriginatorOrg: silabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ef3dd43-f9f5-4b6c-f861-08de6a452e41
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8205.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 14:44:09.6078
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 54dbd822-5231-4b20-944d-6f4abcd541fb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZKuiiWVmj2jx6zjdXhI6+Rv9o0BG2u90/9HXlage8lcJIOzhXxKCdHMVpEpuCcF/5iWKOxHwnkM2UnDizdivJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8486
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEyMDExMSBTYWx0ZWRfXz3CwU8z9aCe4
 IOg8bdMig3cQpteCyzQf3EvJVULiWb6AT9QG/e7VkkFkShcue5HSg7K+DkwX/tsNUD8YCLxxPZh
 NcMdTgvwnZdfRHUBR3rkeDdwyyA3SFbwpU3oEL4UDajTNrq5tUXQI2+Z/ePjNPuroS//A+WDiuk
 QIaeV74akQNgyu2K6Q4lG5uMH1BLdLa/EGMpocLcYgpg2TKByY0r+/95jg0LPJmZDFHMwDDUnel
 uTxfpYNckjjEhqZeChI7ChNmAC0EyR0TjNXrJocegMvmI8GzWS6cn7oFoqMIcDrzyu2xm3Khv08
 woXjX6WEGrAmKpxWsppEsLcaWN8GHkx4lDDxpcBigXuASkatLwMf626J5M+HJX68N/P4Mz6v0z5
 E/OFdmhHnTce2sJDNRvud0BJWqZ8lB9xYkmqqBPsjpd0DBaeiEma4rWZALtULLLZYBB6ZViwhHn
 Sn8RCYiO1+SbmYFxXhA==
X-Authority-Analysis: v=2.4 cv=DtRbOW/+ c=1 sm=1 tr=0 ts=698de73d cx=c_pps
 a=TvliyZNEFSK35vtP2Nadqg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=M51BFTxLslgA:10
 a=i1IsUcr2s-wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=2AEO0YjSAAAA:8 a=lqD4pFEZOuXrchdWF_wA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: 9pRyIPyq5txTqyWDw04DOzS05jk3spoA
X-Proofpoint-GUID: 9pRyIPyq5txTqyWDw04DOzS05jk3spoA
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
Message-ID-Hash: QWKPVHUF736E2MEHRR3NOL5CXXLBWUFO
X-Message-ID-Hash: QWKPVHUF736E2MEHRR3NOL5CXXLBWUFO
X-MailFrom: prvs=050394110d=damien.riegel@silabs.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Silicon Labs Kernel Team <linux-devel@silabs.com>, =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v3 06/14] greybus: cpc: introduce CPC header structure
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/QWKPVHUF736E2MEHRR3NOL5CXXLBWUFO/>
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
X-Rspamd-Queue-Id: E1A4C12E752
X-Rspamd-Action: no action

Q1BDIG1haW4gZmVhdHVyZXMgYXJlIHJlbGlhYmxlIHRyYW5zbWlzc2lvbiBhbmQgcmVtb3RlJ3Mg
cmVjZWl2ZSB3aW5kb3cNCm1hbmFnZW1lbnQuIFRvIGltcGxlbWVudCB0aGVzZSBmZWF0dXJlcywg
YW4gYWRkaXRpb25hbCBoZWFkZXIgaXMgbmVlZGVkLg0KVGhpcyBoZWFkZXIgaXMgcHJlcGVuZGVk
IHRvIGFsbCBHcmV5YnVzIG1lc3NhZ2VzIGJlZm9yZSBnb2luZyBvbiB0aGUNCndpcmUuDQoNClJl
bGlhYmxlIHRyYW5zbWlzc2lvbjogdG8gbWFrZSB0cmFuc21pc3Npb24gcmVsaWFibGUsIG1lc3Nh
Z2VzIGFyZQ0Kc2VxdWVuY2VkIGFuZCBhY2tub3dsZWRnZWQuIFRoYXQgY29uc3RpdHV0ZXMgdHdv
IGJ5dGVzIG9mIHRoZSBoZWFkZXIsDQpvbmUgZm9yIHRoZSBzZXF1ZW5jZSBudW1iZXIsIG9uZSBm
b3IgdGhlIGFja25vd2xlZGdtZW50IG51bWJlci4gSWYgYQ0KbWVzc2FnZSBpcyBub3QgYWNrZWQg
aW4gYSB0aW1lbHkgbWFubmVyLCBhIHJldHJhbnNtaXNzaW9uIG1lY2hhbmlzbSB3aWxsDQphdHRl
bXB0IGFub3RoZXIgdHJhbnNtaXNzaW9uLiBUaGF0IG1lY2hhbmlzbSB3aWxsIGJlIGltcGxlbWVu
dGVkIGluIGENCmZ1dHVyZSBwYXRjaCBzZXQuDQoNClJlbW90ZSdzIHJlY2VpdmUgd2luZG93OiB0
aGUgcmVtb3RlIGFkdmVydGlzZXMgdGhlIG51bWJlciBvZiByZWNlcHRpb24NCmJ1ZmZlcnMgdGhh
dCBhcmUgYXZhaWxhYmxlIG9uIHRoaXMgY3BvcnQuIFRoZSBvdGhlciBwZWVyIG11c3QgdGFrZSBj
YXJlDQpvZiBub3Qgc2VuZGluZyBtb3JlIG1lc3NhZ2VzIHRoYW4gYWR2ZXJ0aXNlZCBieSB0aGUg
cmVtb3RlLiBUaGlzIGlzIGENCnNvcnQgb2YgZmxvdyBjb250cm9sLiBUaGF0IGFjY291bnRzIGZv
ciBvbmUgYnl0ZSBpbiB0aGUgaGVhZGVyLg0KDQpUaGUgcmVtYWluaW5nIGJ5dGUgY2FycmllcyBz
b21lIGZsYWdzLiBGb3IgaW5zdGFuY2UsIHRoZXJlIGlzIGEgZmxhZyB0bw0KaW5kaWNhdGUgaWYg
aXQncyBhIENQQyBtZXNzYWdlIG9yIGEgR3JleWJ1cyBtZXNzYWdlLg0KDQpTaWduZWQtb2ZmLWJ5
OiBEYW1pZW4gUmnDqWdlbCA8ZGFtaWVuLnJpZWdlbEBzaWxhYnMuY29tPg0KLS0tDQpDaGFuZ2Vz
IGluIHYzOg0KICAtIHJlbW92ZSBDUENfSEVBREVSX1NJWkUgYW5kIEdSRVlCVVNfSEVBREVSX1NJ
WkUgbWFjcm9zDQoNCkNoYW5nZXMgaW4gdjI6DQogIC0gTWlub3IgdHdlYWtzIHRvIHN0cnVjdHVy
ZSBkb2N1bWVudGF0aW9uDQoNCiBkcml2ZXJzL2dyZXlidXMvY3BjL2hlYWRlci5oIHwgNDEgKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQogMSBmaWxlIGNoYW5nZWQsIDQxIGlu
c2VydGlvbnMoKykNCiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncmV5YnVzL2NwYy9oZWFk
ZXIuaA0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncmV5YnVzL2NwYy9oZWFkZXIuaCBiL2RyaXZl
cnMvZ3JleWJ1cy9jcGMvaGVhZGVyLmgNCm5ldyBmaWxlIG1vZGUgMTAwNjQ0DQppbmRleCAwMDAw
MDAwMDAwMC4uZjY1YTYwOGE2NTANCi0tLSAvZGV2L251bGwNCisrKyBiL2RyaXZlcnMvZ3JleWJ1
cy9jcGMvaGVhZGVyLmgNCkBAIC0wLDAgKzEsNDEgQEANCisvKiBTUERYLUxpY2Vuc2UtSWRlbnRp
ZmllcjogR1BMLTIuMCAqLw0KKy8qDQorICogQ29weXJpZ2h0IChjKSAyMDI1LCBTaWxpY29uIExh
Ym9yYXRvcmllcywgSW5jLg0KKyAqLw0KKw0KKyNpZm5kZWYgX19DUENfSEVBREVSX0gNCisjZGVm
aW5lIF9fQ1BDX0hFQURFUl9IDQorDQorI2luY2x1ZGUgPGxpbnV4L2dyZXlidXMuaD4NCisjaW5j
bHVkZSA8bGludXgvdHlwZXMuaD4NCisNCisjZGVmaW5lIENQQ19IRUFERVJfTUFYX1JYX1dJTkRP
VyBVOF9NQVgNCisNCisvKioNCisgKiBzdHJ1Y3QgY3BjIGhlYWRlciAtIFJlcHJlc2VudGF0aW9u
IG9mIENQQyBoZWFkZXIuDQorICogQGN0cmxfZmxhZ3M6IGNvbnRhaW5zIHRoZSB0eXBlIG9mIGZy
YW1lIGFuZCBvdGhlciBjb250cm9sIGZsYWdzLg0KKyAqIEByZWN2X3duZDogbnVtYmVyIG9mIGJ1
ZmZlcnMgdGhhdCB0aGUgY3BvcnQgY2FuIHJlY2VpdmUgd2l0aG91dCBibG9ja2luZy4NCisgKiBA
c2VxOiBzZXF1ZW5jZSBudW1iZXIuDQorICogQGFjazogYWNrbm93bGVkZ2UgbnVtYmVyLCBpbmRp
Y2F0ZSB0byB0aGUgcmVtb3RlIHRoZSBuZXh0IHNlcXVlbmNlIG51bWJlcg0KKyAqCSB0aGlzIHBl
ZXIgZXhwZWN0cyB0byBzZWUuDQorICoNCisgKiBFYWNoIHBlZXIgY2FuIGNvbmZpcm0gcmVjZXB0
aW9uIG9mIGZyYW1lcyBieSBzZXR0aW5nIHRoZSBhY2tub3dsZWRnbWVudCBudW1iZXIgdG8gdGhl
IG5leHQgZnJhbWUNCisgKiBpdCBleHBlY3RzIHRvIHNlZSwgaS5lLiBzZXR0aW5nIHRoZSBhY2sg
bnVtYmVyIHRvIFggZWZmZWN0aXZlbHkgYWNrbm93bGVkZ2VzIGZyYW1lcyB3aXRoIHNlcXVlbmNl
DQorICogbnVtYmVyIHVwIHRvIFgtMS4NCisgKg0KKyAqIENQQyBpcyBkZXNpZ25lZCBhcm91bmQg
dGhlIGNvbmNlcHQgdGhhdCBlYWNoIGNwb3J0IGhhcyBpdHMgcG9vbCBvZiByZWNlcHRpb24gYnVm
ZmVycy4gVGhlIG51bWJlcg0KKyAqIG9mIGJ1ZmZlcnMgaW4gYSBwb29sIGlzIGFkdmVydGlzZWQg
dG8gdGhlIHJlbW90ZSB2aWEgdGhlIEByZWN2X3duZCBhdHRyaWJ1dGUuIFRoaXMgYWN0cyBhcw0K
KyAqIHNvZnR3YXJlIGZsb3ctY29udHJvbCwgYW5kIGEgcGVlciBzaGFsbCBub3Qgc2VuZCBmcmFt
ZXMgdG8gYSByZW1vdGUgaWYgdGhlIEByZWN2X3duZCBpcyB6ZXJvLg0KKyAqDQorICogVGhlIGVp
Z2h0aC1iaXQgKDB4ODApIG9mIHRoZSBjb250cm9sIGJ5dGUgaW5kaWNhdGVzIGlmIHRoZSBmcmFt
ZSB0YXJnZXRzIENQQyBvciBHcmV5YnVzLiBJZiB0aGUNCisgKiBiaXQgaXMgc2V0LCB0aGUgZnJh
bWUgc2hvdWxkIGJlIGludGVycHJldGVkIGFzIGEgQ1BDIGNvbnRyb2wgZnJhbWUuIEZvciBzaW1w
bGljaXR5LCBjb250cm9sDQorICogZnJhbWVzIGhhdmUgdGhlIHNhbWUgZW5jb2RpbmcgYXMgR3Jl
eWJ1cyBmcmFtZXMuDQorICovDQorc3RydWN0IGNwY19oZWFkZXIgew0KKwlfX3U4IGN0cmxfZmxh
Z3M7DQorCV9fdTggcmVjdl93bmQ7DQorCV9fdTggc2VxOw0KKwlfX3U4IGFjazsNCit9IF9fcGFj
a2VkOw0KKw0KKyNlbmRpZg0KLS0gDQoyLjUyLjANCg0KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0IC0tIGdyZXli
dXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKVG8gdW5zdWJzY3JpYmUgc2VuZCBhbiBlbWFpbCB0byBn
cmV5YnVzLWRldi1sZWF2ZUBsaXN0cy5saW5hcm8ub3JnCg==
