Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 66934CDA460
	for <lists+greybus-dev@lfdr.de>; Tue, 23 Dec 2025 19:32:18 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 78A1E4013D
	for <lists+greybus-dev@lfdr.de>; Tue, 23 Dec 2025 18:32:17 +0000 (UTC)
Received: from mx0a-0024c301.pphosted.com (mx0a-0024c301.pphosted.com [148.163.149.154])
	by lists.linaro.org (Postfix) with ESMTPS id 842D63F9AD
	for <greybus-dev@lists.linaro.org>; Tue, 23 Dec 2025 18:32:05 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=silabs.com header.s=pps12202023 header.b=Tjzksx9Q;
	dkim=pass header.d=silabs.com header.s=selector1 header.b=Fi3Ss6ot;
	spf=pass (lists.linaro.org: domain of Damien.Riegel@silabs.com designates 148.163.149.154 as permitted sender) smtp.mailfrom=Damien.Riegel@silabs.com;
	dmarc=pass (policy=reject) header.from=silabs.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from pps.filterd (m0101743.ppops.net [127.0.0.1])
	by mx0a-0024c301.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNBlCKL2900128;
	Tue, 23 Dec 2025 12:31:56 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps12202023;
	 bh=UY6fv3XblXrJNVZSqP+gdF8qyuHcfDQrVCtZnHmyr5g=; b=Tjzksx9QzW+/
	6qAktL/OirKkjGBF2JwMgq4raQnKqdjHQO1a8MCH8fWn3YJ+p25r/L2/4a/hsBOi
	C9nWToPEgaLJDnih+l+bNiVgqUY4H3XYFIICkyo/SuM3p4Xq2Je04N07Kk+l3+xA
	swtRWxN8XtPXzqC7WtdO4Iz7ab/6Q2wypodLHfrhk7V1O81mPbCRJpsx43kSqfpf
	tSFF8N70ZezAhRXzPViAhaK4Zb/F7jCD00sryUTq81BITxvn5xNqSRbaiku65kyO
	0X7LKEKJx/CDRZ0UIUcEwhFZHV+f7flMcjTFgC800E5sNKbq86x+A5G8286a8h0e
	WcZpw2sJrw==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11020084.outbound.protection.outlook.com [52.101.46.84])
	by mx0a-0024c301.pphosted.com (PPS) with ESMTPS id 4b7n7597g2-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 23 Dec 2025 12:31:55 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vf5jnZsVOURYkCtzwASDczBaoQHPnNuXHgt9Szs/GQ+Tvft1KGiM4Vb+xFXqD5CPn9T/B73aSyOki5zp6xAeh6aizjn1bhjh3F4cF5rXdSBki7z8bgP0PoQOBExi0m4OjfUiDJiui4vWR4F+gf98QE3mS1cJBXRGNXICJaFr7DUW0K9SfLWeVpspl785ezu1l7YIv6muK/P1fPNOpU57HmSixAefVkw5Yflh14PfWcbggFLnesCVoK1t25AUbyj8GVfU+II6Ym8vOtRuwsQ7si6pDr6dtB+qlq3zihhPdrF2m9mDcFWJVyhPAds7gg5R6xvEP7SujkMjikAuwFNNKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UY6fv3XblXrJNVZSqP+gdF8qyuHcfDQrVCtZnHmyr5g=;
 b=fP4uUYxfg1f+KS5uNWsCCwQ/Nlpj+roLInR9j5BOxJ5TXUOrRIt5JKHzXzQJbWortgzfCgqhQ6w4mE8OcKBgTsH36zUDrZdiHJ0TLlN6xNn9SDw+eXgbVbjltI4vEssbzvOkHRpBYmddqESCZeybZLqWnvnrUv8QwYZa9B2QovXvoUeIiCGOq9HfH2L23PkUxr5cZ3Gh2Q0b1AOx4r069IDNmAAPtE8iyIFuimxrGPWb8yZCuPdAaFQPcOyDX4DUfeoVCOrABUXhdocQSfzOwsBuj+pBtsBXmtzRGC869hpKhbooqRhsBJtZAIqYITWS3XS3UWaOyqosMHs4q7CecA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silabs.com; dmarc=pass action=none header.from=silabs.com;
 dkim=pass header.d=silabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UY6fv3XblXrJNVZSqP+gdF8qyuHcfDQrVCtZnHmyr5g=;
 b=Fi3Ss6ot4djCMSMsnTHkcHYrynECelEANq8c0ZhH9gS2QxyLo4YY6/j+W7H185Wqkayu2d8bxtJua7vmXH0OaHMpeoLdUhQdZ01iunAqUD+pJ3bz20Fqfjs4QWlv5bMM8Yhkfs2HadSYEjd+mmA148V4nnB/JnjHeSXjzHBsW4c=
Received: from DS0PR11MB8205.namprd11.prod.outlook.com (2603:10b6:8:162::17)
 by SN7PR11MB6924.namprd11.prod.outlook.com (2603:10b6:806:2ab::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.11; Tue, 23 Dec
 2025 18:31:53 +0000
Received: from DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::2de6:bc88:2af7:3583]) by DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::2de6:bc88:2af7:3583%3]) with mapi id 15.20.9434.009; Tue, 23 Dec 2025
 18:31:53 +0000
From: =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
To: greybus-dev@lists.linaro.org
Date: Tue, 23 Dec 2025 13:31:35 -0500
Message-ID: <20251223183142.31897-2-damien.riegel@silabs.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251223183142.31897-1-damien.riegel@silabs.com>
References: <20251223183142.31897-1-damien.riegel@silabs.com>
X-ClientProxiedBy: YQZPR01CA0008.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:85::23) To DS0PR11MB8205.namprd11.prod.outlook.com
 (2603:10b6:8:162::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8205:EE_|SN7PR11MB6924:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a8ab114-b2c8-4d4a-45d5-08de42518b9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|10070799003|376014|52116014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Vmd6QThMbTlWd1Jkei9MYWV6bTZOMXNSc2E4eElXLzJxVEQ1dkF6SzFWZW9Y?=
 =?utf-8?B?YlN5cUhQN0k2dUZSM21XTWpEb05wTDdiZjg3YmJXQTRSVWJZUWJVRkQwQmNS?=
 =?utf-8?B?em02TElKeCtJaC9lTEtkampZRjR1K2x5b3QrMVI0Z0tGYURDajRyUGFaZGhw?=
 =?utf-8?B?YUdyNjZrNVBCd0tNS0NtREFmWmh3RDN3d2RNUDJtdmNRcjZaUlZjaHNJdjNj?=
 =?utf-8?B?S01IQ2dNWWNnck9BL01aMlhMREFlU05xRnJtNGgyT3BEcXdyZzArZEFEZFk1?=
 =?utf-8?B?WjJNcmc3NWZuWEU0TEN6aWJHNTVqb0tKb0NrZGpPWm5aTjhDTVVud1pKR2RR?=
 =?utf-8?B?OVJObDN3ZTVaQVkyelFZOEN6ays1NVRTK1N5dFpPZHBkN1BwN2FWcUdCNWp3?=
 =?utf-8?B?MkxjbzkyVU9XN0NMRzgvMDdZVDgwWExkQmxVS3NhU3RFNlNIMDNzR1NqQ2FH?=
 =?utf-8?B?OGVoSzFwa3NtbnFCWmJ2akFld2M3MUxZTFVYZG9PbDhyUzI2QTJzRGpTUmJ0?=
 =?utf-8?B?RzE1TDMvY2NnNkFRWW5Md3Z2T0Y3RTNLS1ZlUVNiYUVWSCtPdlNCaHJRclc0?=
 =?utf-8?B?SlFyRmM1RDEvK2RaWDZZc1RWclQ2T1U1V1BNZ0xGWjVnMWpDVUg1Y01KcUd0?=
 =?utf-8?B?Nk0wUXBuS3lNdE9aYWxpdjVKZXZpZXM0dGdPMmZOUUYxOHpJUE1Va3NlYytX?=
 =?utf-8?B?aGFwdkhrcGZsZWdybGQ4U1pjNU5ob0xiTExyeEwwQXVzcjNkamNNQ1liZFdT?=
 =?utf-8?B?Mzlna1BCeCtmcEc2WFR1Q0JTT3RLbExZSGxRWHFGOTJBTFhQZ29nQjNZSys0?=
 =?utf-8?B?bFRnYnB2STNmY0RzUFVIMHpuSDZYa0h0VHovM3BXNis4MzZBcUJMV3FEYnhF?=
 =?utf-8?B?MEZXWkh2V3pmdFdFa0lOSzNXUEN6YmVyUU10S0U1Q2lUbGp5aFNmYVd6dVV5?=
 =?utf-8?B?RmtLWHpnMDlkaFg1NGwvUFg4b1ZPMGl6R3hBcWNsbGtLL1QySHpqSXErb3Qy?=
 =?utf-8?B?YWlTeDFHWmdHM1dQaUZmZmdhOU5vaDN0dmVJSU1uRWt0Q3pyaHNhcDc1WmdT?=
 =?utf-8?B?TUx0cVN3U3JMbkhPWjQ5QTcxbDZKVGhaMXlWQ3Zvd2Q3c05PR0Fkb1RqNHpv?=
 =?utf-8?B?dVRQTTBlVHhFYXJjY0d6cVVXMGVLTkVuUXZSVDJ1ZmFsakMrMEsyeWxtU3Uv?=
 =?utf-8?B?M05QNGV6R242YnhoTmhWMWpZWTBQNmFOay85TkVoVC9sMDlQMnB4M05nQklo?=
 =?utf-8?B?NkpzSGlhYmlRMXE1bFcxMWRtNnBIRjdHbXZkL1B6c05nbDdFMWtxQkNUUDhZ?=
 =?utf-8?B?aDRSSnBpVzhYbmpJTEhpdFlpcG5sYjZVbGRQSFk2eDVhOFRwZnlqdUdPMSt6?=
 =?utf-8?B?NnlyUXh0NmlJbkpRaCtxVjdPdGxxbnJoMmt2Q2tHMXl2WWR2NktGK3lPN2Vy?=
 =?utf-8?B?QXNNMDU1a283S1F0NWFIZzNTa0I3amVWaGRZQUFmTWpoeFNwOXl5dS9ianpZ?=
 =?utf-8?B?RWVDSjNSM2tQNVE2eFU4S3BaNTRtZlpqZ3JQMDRHSDdNSHRXcWVaTW5BN0tl?=
 =?utf-8?B?c25KSzFIdVFQRUtzNkc3NndxRGRwL0Q0NVBwNXRHTWF5WFNiVzJCTHFVUUwy?=
 =?utf-8?B?UXdoQkNxT0RYcEVwQkU5bHd3MUlFcjBxY013ZW9XN1lpTEtMdjVtVzdLMDds?=
 =?utf-8?B?L1dYaXBMSTFNWVkvVGVCZVpJODNMTnFkeFhpYWxUK2puaTFtRlkraUx4UzVD?=
 =?utf-8?B?czdENXZrQ2JHcjRmbkh6SVg1UFlpQlZJc3F1WEFhdDZJVlRCbDRiMW5WNnpW?=
 =?utf-8?B?SmkxaWVUL2UxRW1UL3RTc0VTaEczQmZzR1ZzbHd6d0JBVVQzUVpwY2wvSU82?=
 =?utf-8?B?MEVXVm54eGp6Ym01TmNtR3JEYWpNSEpUTkhydGNlRHRXMmEwM3NzcnNxNUVu?=
 =?utf-8?Q?b6sWHAm8988L2sr4GcLRspYR91qvMosa?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8205.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(52116014)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WUdnOHpUQXhUQVQ0ZlVaUGdrUFlrTTg0TFhZa2xVOGtMSUVLVFVNeGgyc1hH?=
 =?utf-8?B?QzhmUXVRUFBaaDQ1dHNLcURjU29NVzlDSWlJMjNWWnhyRHZEeHFmR0ZWV0Fi?=
 =?utf-8?B?VldWTFlraFJSUkJrRGJYVVgyZm5tTkNBZGRjdzlRNWhLckk3QzhsaGZsTjEw?=
 =?utf-8?B?S2YxaEVHL1VSTzc1T1JsR3MreWI1VWhGbDJDQkRRZDZiZ2M3OEx5OEpRbWdu?=
 =?utf-8?B?WUdJdDVPSit6MG1MaUFVaWxBalJFTTR0VGpQZVcwd1l6R2M1Uzgwc0xoTlNI?=
 =?utf-8?B?REZmTVJNeGpMcjhqbTYyOTNoRG1NTStrZ093QnkvTTliNWxtUHpEL0lMU0JP?=
 =?utf-8?B?dDlkR2puTDYxR0VOTEozeldOSmcyekVTbENCWHk0bmk2cjh1eHBOTXdwektI?=
 =?utf-8?B?bGQvVlU3VWdweTYyVjN1NFlBallOTjZMc3NIOFdIUm9JZWpKK1lYWDgvNWlN?=
 =?utf-8?B?ZGpYNnllNk9ZY3pVcGJ0dEtybG9tcmdMcVhjOXFWUzNqR0w2Y0wxb0JMVW10?=
 =?utf-8?B?cDFQdUhFSUJyMFhBeTR2WVpoa01zcmtUWWlNdk1IMHIrb2ZqSHpIc0pRQ2Ju?=
 =?utf-8?B?N0dwWGFTblZhK2FFdlZQMjR3SXdoaUZLaUM1bGZ0NmxQcXM5YnhJM0hMUk5J?=
 =?utf-8?B?QjM0V21INjh3Ymh2WUp5UTRuM2RwTlUrbEU0ZDFUK3Q1RmRtOTJRSXZjWDV6?=
 =?utf-8?B?czhwTnRxbFlpSHRVTFhMRnZHSzlUWDdYelkzZzFtQlJvYnU3Yk91QUlKdWVI?=
 =?utf-8?B?M0pUR1Flcm5IcUJ1cUZGbEE3amYyTTZSNndQUWVSUVVFUENMdlU3VTR3VTZL?=
 =?utf-8?B?cHZJK0J0Z3lwTlhpWlVyU2Uxck5aZE82ZVdQOEtoTytNSExBRU1YSGI2SE5i?=
 =?utf-8?B?U0FIQXV6UWRIYWlQT2pxanlaQ1h6Tm5NQjNnMEc4SFUzMUI1SVR6Uzk2Q01w?=
 =?utf-8?B?Z3JzUzlWdVFmb1Ard1JuTG90VE1CTXFoZlBuZDc5MkNML3JVZHB2RHlvU1Rh?=
 =?utf-8?B?NGxxSVk0c0g4dk5XajJrQjBkQ0hkYmZwSUJJZW42STZiRjI1SGUwMDRtRWlU?=
 =?utf-8?B?cFZqZzROc2xmeDBhWHNvM3lmbzNkaTRPYmRCZXhXMFhXY1BXUXoxK3ZFVGNF?=
 =?utf-8?B?T0Y0ZHdWSDlTd3JJWE83cUJEYyt5bEc1NUJxOUh1TzJNQmNtTnRwVVVTV3ZT?=
 =?utf-8?B?b0c3TlVpRUh4VkFpd3pEY2pqaThxU0dydXhibVlscVVBMnFBZE1oWnRsZkp6?=
 =?utf-8?B?K2Zpb3plRmVLKytTTHVvMXFJcVJGVUVwbDlnUVVackN1RjBRTmRuSW5aWXdp?=
 =?utf-8?B?SklTMER6QTFEeGdobXFacUxBOVR4VzkxRG4vM05RM3Q0MS9hU1lSTE1SUmx4?=
 =?utf-8?B?YnNUZGFxZ1FkMDlPRlo1cGU3cG9Uc2xwMlI1blRGU0pqQVVqaEZoMFkxWG5M?=
 =?utf-8?B?UzlZNHpPNVV6aHp1Sk5UajQ3ZUtxUjdOejRLVGRXWERwTFJnWGtMbE1TZ0Iw?=
 =?utf-8?B?R2wwV2JCS3FkRHN1ZkljR29BTit3YWNCbWw2c3JoN05jVVZVUGlIbUNGYVlk?=
 =?utf-8?B?eEZKSEpCMFRudDlQcXJPejdEY1pIMVNvZXh6dmxJbEx1S2dzRTNndXkwTjN0?=
 =?utf-8?B?d3JVOEhBNTZ0cG9YMTVzRDBjQmVyU1J5d05PaWgvRVAvSG1IWjFNOHlZN3l2?=
 =?utf-8?B?c0lUdUJjWnc2djh0VU4xSDQyQUdTZzF5N3JlVDlOblB6dVJaKzhVSVhVczRa?=
 =?utf-8?B?MkE3Y2g1a3BVcER0TzduRlhXbTVSb3FaSGRjTVhPUWlpRElSMXNQVUdhNTZu?=
 =?utf-8?B?RmIwMWdFR05XcXY0WDBickVpbklhMEoveHdKaTNtbHZDMVhtQ3BuNWhCbG1s?=
 =?utf-8?B?d3RNSm9lMTU4bDRZV0l1dmx2c3dqT1NtNEdMUS9qSnQ3bUJHUVpJYXJDaU96?=
 =?utf-8?B?SWpPSW5QTGxiWkdFdlJVclNNQUtTOVVFNmlRbmdKeDZTczhKNm9MTGEyYWd3?=
 =?utf-8?B?WUEyeFU1RFI4MlpDbjd2ak5uQmtFZUZTeC9WR3ZscDRTdXFSNjI0S2NPYzZn?=
 =?utf-8?B?bE9kbHYwN2l2YlNKckRhZ3IzSEpyS1ovQ1RmRnZCUVFMN2kzc1BKOW8rYlgr?=
 =?utf-8?B?c2pjaEhMUXNHTzA2dk5WNnNIbjQzdDZ0dE9iY0lXa1NPVnlmcUZnNXJQR2R0?=
 =?utf-8?B?RkcybFhYMHRVcVh0a0l0R28ydnUyenFtb3BINmZDWDFrSFlDbDQzZnpCYklS?=
 =?utf-8?B?VGY1Q3cyZWYzMjd4SHRBVnN3LzlMTmhlSlNCQ0FoUkhmUkFHRzZwNE9lNmRl?=
 =?utf-8?B?cWRTdml2R0ttakNaTWViR2dQV3hMOHJzVmJramJ4Vy9sYnhOcldtVTAvWW9R?=
 =?utf-8?Q?4h0DxqVLB4sLq8Od3FPKLJfFyXXxvUdwzp4r4heHL0t6N?=
X-MS-Exchange-AntiSpam-MessageData-1: PeyIT/itAnMssQ==
X-OriginatorOrg: silabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a8ab114-b2c8-4d4a-45d5-08de42518b9c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8205.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2025 18:31:53.8458
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 54dbd822-5231-4b20-944d-6f4abcd541fb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: we2SjeBZ9pgPQ5PfYqYdf/TbuJYlh//+DaGbwfouSRKh1whNWsrqyy7oeOelMfTet7qInm1xe4Fu7Wq1bvVMgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6924
X-Authority-Analysis: v=2.4 cv=SsmdKfO0 c=1 sm=1 tr=0 ts=694ae01b cx=c_pps
 a=5Kc8oJJEAov4kh6pc/+VPg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=M51BFTxLslgA:10
 a=i1IsUcr2s-wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=2AEO0YjSAAAA:8
 a=oOlevtK9oMdiqDF3cBcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: AdSAcNm5kcWcIU9B3NXIZlQn_Zew2nbi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDE1NCBTYWx0ZWRfX5v6iSyB2t7n3
 bh+JWPURKNCRTHu9aHNttdmzgGo8QCer7c0JiX8ZC7JNlAmPLDmsqtwWqWuKCM22gQQ4UhsLiw+
 wwPrpIFrRcyxV0fbQq3Ri0jb8FjUdF0wlAuooztJMtzHRGTLY+9sS8j0Dtcpy2OIDnm2L7cIeO3
 bxkXpbSKgMsV3rF2+Naf+IkLOYCWqZ889v1vAF8SWspU2sGYj6g0DpZN+p9HmYqpFfkDbwnRRjJ
 g/abz3Qu8bFgMG418WfVKFcGS4bJWAJJk15a8dSH2tFoBNXq1/xuI3BGHHQbHTjY57YzwWtf94I
 FV0yKDEKmVT3Lj+i2IWh5EDJuQkT9To1+AqiISZGMw6AmPn1hNZ4cXRlTI+6DEgocCQc5GzKRFE
 Yg0QkcQDa+kDPVbfDepErrnf4qpgXfV4guciOuZjNgoxNd5xbOJXVNqGIj0Pg16j1lifW0j40FL
 EzYU+Mbxv7O9ln2ZKjQ==
X-Proofpoint-GUID: AdSAcNm5kcWcIU9B3NXIZlQn_Zew2nbi
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
	DNSWL_BLOCKED(0.00)[2603:10b6:8:162::17:received,148.163.149.154:from,52.101.46.84:received];
	DKIM_TRACE(0.00)[silabs.com:+]
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 842D63F9AD
X-Spamd-Bar: ----
Message-ID-Hash: RZX2KGL6NIOGGKBU6TSRCQDQ56VC4K4S
X-Message-ID-Hash: RZX2KGL6NIOGGKBU6TSRCQDQ56VC4K4S
X-MailFrom: Damien.Riegel@silabs.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, linux-devel@silabs.com, =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH 1/8] greybus: add P2P interface type
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/RZX2KGL6NIOGGKBU6TSRCQDQ56VC4K4S/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SW50cm9kdWNlIGEgbmV3IFBvaW50LVRvLVBvaW50IGludGVyZmFjZSB0eXBlLiBUaGlzIHR5cGUg
b2YgaW50ZXJmYWNlIGlzDQp1c2VkIHRvIGluZGljYXRlIHRoYXQgdGhpcyBpbnRlcmZhY2UgYmVs
b25ncyB0byBhIG1vZHVsZSB0aGF0J3MNCmNvbm5lY3RlZCBpbiBhIHBvaW50LXRvLXBvaW50IHNl
dHVwIHdpdGggYSBob3N0IGRldmljZS4NCg0KSW4gdGhpcyBjb25maWd1cmF0aW9uLCB0aGVyZSBp
cyBubyBTVkMgaW4gdGhlIGJ1cywgc28gYWxsIGNvZGUgcGF0aHMNCnRoYXQgdXNlIHRoZSBTVkMg
YXJlIHNraXBwZWQgd2hlbiBkZWFsaW5nIHdpdGggdGhpcyBraW5kIG9mIGludGVyZmFjZS4NCg0K
U2lnbmVkLW9mZi1ieTogRGFtaWVuIFJpw6lnZWwgPGRhbWllbi5yaWVnZWxAc2lsYWJzLmNvbT4N
Ci0tLQ0KIGRyaXZlcnMvZ3JleWJ1cy9jb25uZWN0aW9uLmMgICAgICB8ICA1ICsrKw0KIGRyaXZl
cnMvZ3JleWJ1cy9pbnRlcmZhY2UuYyAgICAgICB8IDUyICsrKysrKysrKysrKysrKysrKysrKy0t
LS0tLS0tLS0NCiBpbmNsdWRlL2xpbnV4L2dyZXlidXMvaW50ZXJmYWNlLmggfCAgMSArDQogMyBm
aWxlcyBjaGFuZ2VkLCA0MiBpbnNlcnRpb25zKCspLCAxNiBkZWxldGlvbnMoLSkNCg0KZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3JleWJ1cy9jb25uZWN0aW9uLmMgYi9kcml2ZXJzL2dyZXlidXMvY29u
bmVjdGlvbi5jDQppbmRleCA5Yzg4ODYxOTg2Yy4uZjkyODdmMmY0YzkgMTAwNjQ0DQotLS0gYS9k
cml2ZXJzL2dyZXlidXMvY29ubmVjdGlvbi5jDQorKysgYi9kcml2ZXJzL2dyZXlidXMvY29ubmVj
dGlvbi5jDQpAQCAtNDA3LDYgKzQwNyw4IEBAIGdiX2Nvbm5lY3Rpb25fc3ZjX2Nvbm5lY3Rpb25f
Y3JlYXRlKHN0cnVjdCBnYl9jb25uZWN0aW9uICpjb25uZWN0aW9uKQ0KIAkJcmV0dXJuIDA7DQog
DQogCWludGYgPSBjb25uZWN0aW9uLT5pbnRmOw0KKwlpZiAoaW50Zi0+dHlwZSA9PSBHQl9JTlRF
UkZBQ0VfVFlQRV9QMlApDQorCQlyZXR1cm4gMDsNCiANCiAJLyoNCiAJICogRW5hYmxlIGVpdGhl
ciBFMkVGQyBvciBDU0QsIHVubGVzcyBubyBmbG93IGNvbnRyb2wgaXMgcmVxdWVzdGVkLg0KQEAg
LTQ0MSw2ICs0NDMsOSBAQCBnYl9jb25uZWN0aW9uX3N2Y19jb25uZWN0aW9uX2Rlc3Ryb3koc3Ry
dWN0IGdiX2Nvbm5lY3Rpb24gKmNvbm5lY3Rpb24pDQogCWlmIChnYl9jb25uZWN0aW9uX2lzX3N0
YXRpYyhjb25uZWN0aW9uKSkNCiAJCXJldHVybjsNCiANCisJaWYgKGNvbm5lY3Rpb24tPmludGYt
PnR5cGUgPT0gR0JfSU5URVJGQUNFX1RZUEVfUDJQKQ0KKwkJcmV0dXJuOw0KKw0KIAlnYl9zdmNf
Y29ubmVjdGlvbl9kZXN0cm95KGNvbm5lY3Rpb24tPmhkLT5zdmMsDQogCQkJCSAgY29ubmVjdGlv
bi0+aGQtPnN2Yy0+YXBfaW50Zl9pZCwNCiAJCQkJICBjb25uZWN0aW9uLT5oZF9jcG9ydF9pZCwN
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dyZXlidXMvaW50ZXJmYWNlLmMgYi9kcml2ZXJzL2dyZXli
dXMvaW50ZXJmYWNlLmMNCmluZGV4IGEwZjNlOTQyMjcyLi5lOTZiNThiMjExYiAxMDA2NDQNCi0t
LSBhL2RyaXZlcnMvZ3JleWJ1cy9pbnRlcmZhY2UuYw0KKysrIGIvZHJpdmVycy9ncmV5YnVzL2lu
dGVyZmFjZS5jDQpAQCAtNzExLDYgKzcxMSw5IEBAIHN0YXRpYyBpbnQgZ2JfaW50ZXJmYWNlX3N1
c3BlbmQoc3RydWN0IGRldmljZSAqZGV2KQ0KIAlpZiAocmV0KQ0KIAkJZ290byBlcnJfaGliZXJu
YXRlX2Fib3J0Ow0KIA0KKwlpZiAoaW50Zi0+dHlwZSA9PSBHQl9JTlRFUkZBQ0VfVFlQRV9QMlAp
DQorCQlyZXR1cm4gMDsNCisNCiAJcmV0ID0gZ2JfaW50ZXJmYWNlX2hpYmVybmF0ZV9saW5rKGlu
dGYpOw0KIAlpZiAocmV0KQ0KIAkJcmV0dXJuIHJldDsNCkBAIC03MzMsMTYgKzczNiwxOSBAQCBz
dGF0aWMgaW50IGdiX2ludGVyZmFjZV9zdXNwZW5kKHN0cnVjdCBkZXZpY2UgKmRldikNCiBzdGF0
aWMgaW50IGdiX2ludGVyZmFjZV9yZXN1bWUoc3RydWN0IGRldmljZSAqZGV2KQ0KIHsNCiAJc3Ry
dWN0IGdiX2ludGVyZmFjZSAqaW50ZiA9IHRvX2diX2ludGVyZmFjZShkZXYpOw0KLQlzdHJ1Y3Qg
Z2Jfc3ZjICpzdmMgPSBpbnRmLT5oZC0+c3ZjOw0KIAlpbnQgcmV0Ow0KIA0KLQlyZXQgPSBnYl9p
bnRlcmZhY2VfcmVmY2xrX3NldChpbnRmLCB0cnVlKTsNCi0JaWYgKHJldCkNCi0JCXJldHVybiBy
ZXQ7DQorCWlmIChpbnRmLT50eXBlICE9IEdCX0lOVEVSRkFDRV9UWVBFX1AyUCkgew0KKwkJc3Ry
dWN0IGdiX3N2YyAqc3ZjID0gaW50Zi0+aGQtPnN2YzsNCiANCi0JcmV0ID0gZ2Jfc3ZjX2ludGZf
cmVzdW1lKHN2YywgaW50Zi0+aW50ZXJmYWNlX2lkKTsNCi0JaWYgKHJldCkNCi0JCXJldHVybiBy
ZXQ7DQorCQlyZXQgPSBnYl9pbnRlcmZhY2VfcmVmY2xrX3NldChpbnRmLCB0cnVlKTsNCisJCWlm
IChyZXQpDQorCQkJcmV0dXJuIHJldDsNCisNCisJCXJldCA9IGdiX3N2Y19pbnRmX3Jlc3VtZShz
dmMsIGludGYtPmludGVyZmFjZV9pZCk7DQorCQlpZiAocmV0KQ0KKwkJCXJldHVybiByZXQ7DQor
CX0NCiANCiAJcmV0ID0gZ2JfY29udHJvbF9yZXN1bWUoaW50Zi0+Y29udHJvbCk7DQogCWlmIChy
ZXQpDQpAQCAtOTI0LDYgKzkzMCwxMSBAQCBzdGF0aWMgaW50IF9nYl9pbnRlcmZhY2VfYWN0aXZh
dGUoc3RydWN0IGdiX2ludGVyZmFjZSAqaW50ZiwNCiAJaWYgKGludGYtPmVqZWN0ZWQgfHwgaW50
Zi0+cmVtb3ZlZCkNCiAJCXJldHVybiAtRU5PREVWOw0KIA0KKwlpZiAoaW50Zi0+dHlwZSA9PSBH
Ql9JTlRFUkZBQ0VfVFlQRV9QMlApIHsNCisJCSp0eXBlID0gR0JfSU5URVJGQUNFX1RZUEVfUDJQ
Ow0KKwkJZ290byBtYWtlX2FjdGl2ZTsNCisJfQ0KKw0KIAlyZXQgPSBnYl9pbnRlcmZhY2VfdnN5
c19zZXQoaW50ZiwgdHJ1ZSk7DQogCWlmIChyZXQpDQogCQlyZXR1cm4gcmV0Ow0KQEAgLTk1NSw2
ICs5NjYsNyBAQCBzdGF0aWMgaW50IF9nYl9pbnRlcmZhY2VfYWN0aXZhdGUoc3RydWN0IGdiX2lu
dGVyZmFjZSAqaW50ZiwNCiAJaWYgKHJldCkNCiAJCWdvdG8gZXJyX2hpYmVybmF0ZV9saW5rOw0K
IA0KK21ha2VfYWN0aXZlOg0KIAlpbnRmLT5hY3RpdmUgPSB0cnVlOw0KIA0KIAl0cmFjZV9nYl9p
bnRlcmZhY2VfYWN0aXZhdGUoaW50Zik7DQpAQCAtMTAxMiw2ICsxMDI0LDcgQEAgaW50IGdiX2lu
dGVyZmFjZV9hY3RpdmF0ZShzdHJ1Y3QgZ2JfaW50ZXJmYWNlICppbnRmKQ0KIAljYXNlIEdCX0lO
VEVSRkFDRV9UWVBFX0dSRVlCVVM6DQogCQlyZXQgPSBfZ2JfaW50ZXJmYWNlX2FjdGl2YXRlX2Vz
M19oYWNrKGludGYsICZ0eXBlKTsNCiAJCWJyZWFrOw0KKwljYXNlIEdCX0lOVEVSRkFDRV9UWVBF
X1AyUDoNCiAJZGVmYXVsdDoNCiAJCXJldCA9IF9nYl9pbnRlcmZhY2VfYWN0aXZhdGUoaW50Ziwg
JnR5cGUpOw0KIAl9DQpAQCAtMTA0OSwxMSArMTA2MiwxMyBAQCB2b2lkIGdiX2ludGVyZmFjZV9k
ZWFjdGl2YXRlKHN0cnVjdCBnYl9pbnRlcmZhY2UgKmludGYpDQogCWlmIChpbnRmLT5tb2RlX3N3
aXRjaCkNCiAJCWNvbXBsZXRlKCZpbnRmLT5tb2RlX3N3aXRjaF9jb21wbGV0aW9uKTsNCiANCi0J
Z2JfaW50ZXJmYWNlX3JvdXRlX2Rlc3Ryb3koaW50Zik7DQotCWdiX2ludGVyZmFjZV9oaWJlcm5h
dGVfbGluayhpbnRmKTsNCi0JZ2JfaW50ZXJmYWNlX3VuaXByb19zZXQoaW50ZiwgZmFsc2UpOw0K
LQlnYl9pbnRlcmZhY2VfcmVmY2xrX3NldChpbnRmLCBmYWxzZSk7DQotCWdiX2ludGVyZmFjZV92
c3lzX3NldChpbnRmLCBmYWxzZSk7DQorCWlmIChpbnRmLT50eXBlICE9IEdCX0lOVEVSRkFDRV9U
WVBFX1AyUCkgew0KKwkJZ2JfaW50ZXJmYWNlX3JvdXRlX2Rlc3Ryb3koaW50Zik7DQorCQlnYl9p
bnRlcmZhY2VfaGliZXJuYXRlX2xpbmsoaW50Zik7DQorCQlnYl9pbnRlcmZhY2VfdW5pcHJvX3Nl
dChpbnRmLCBmYWxzZSk7DQorCQlnYl9pbnRlcmZhY2VfcmVmY2xrX3NldChpbnRmLCBmYWxzZSk7
DQorCQlnYl9pbnRlcmZhY2VfdnN5c19zZXQoaW50ZiwgZmFsc2UpOw0KKwl9DQogDQogCWludGYt
PmFjdGl2ZSA9IGZhbHNlOw0KIH0NCkBAIC0xMDcyLDEwICsxMDg3LDEyIEBAIGludCBnYl9pbnRl
cmZhY2VfZW5hYmxlKHN0cnVjdCBnYl9pbnRlcmZhY2UgKmludGYpDQogCWludCByZXQsIHNpemU7
DQogCXZvaWQgKm1hbmlmZXN0Ow0KIA0KLQlyZXQgPSBnYl9pbnRlcmZhY2VfcmVhZF9hbmRfY2xl
YXJfaW5pdF9zdGF0dXMoaW50Zik7DQotCWlmIChyZXQpIHsNCi0JCWRldl9lcnIoJmludGYtPmRl
diwgImZhaWxlZCB0byBjbGVhciBpbml0IHN0YXR1czogJWRcbiIsIHJldCk7DQotCQlyZXR1cm4g
cmV0Ow0KKwlpZiAoaW50Zi0+dHlwZSAhPSBHQl9JTlRFUkZBQ0VfVFlQRV9QMlApIHsNCisJCXJl
dCA9IGdiX2ludGVyZmFjZV9yZWFkX2FuZF9jbGVhcl9pbml0X3N0YXR1cyhpbnRmKTsNCisJCWlm
IChyZXQpIHsNCisJCQlkZXZfZXJyKCZpbnRmLT5kZXYsICJmYWlsZWQgdG8gY2xlYXIgaW5pdCBz
dGF0dXM6ICVkXG4iLCByZXQpOw0KKwkJCXJldHVybiByZXQ7DQorCQl9DQogCX0NCiANCiAJLyog
RXN0YWJsaXNoIGNvbnRyb2wgY29ubmVjdGlvbiAqLw0KQEAgLTEyMzAsNiArMTI0Nyw5IEBAIGlu
dCBnYl9pbnRlcmZhY2VfYWRkKHN0cnVjdCBnYl9pbnRlcmZhY2UgKmludGYpDQogCQkgZ2JfaW50
ZXJmYWNlX3R5cGVfc3RyaW5nKGludGYpKTsNCiANCiAJc3dpdGNoIChpbnRmLT50eXBlKSB7DQor
CWNhc2UgR0JfSU5URVJGQUNFX1RZUEVfUDJQOg0KKwkJZGV2X2luZm8oJmludGYtPmRldiwgIkFk
ZGVkIFAyUCBpbnRlcmZhY2VcbiIpOw0KKwkJYnJlYWs7DQogCWNhc2UgR0JfSU5URVJGQUNFX1RZ
UEVfR1JFWUJVUzoNCiAJCWRldl9pbmZvKCZpbnRmLT5kZXYsICJHTVAgVklEPTB4JTA4eCwgUElE
PTB4JTA4eFxuIiwNCiAJCQkgaW50Zi0+dmVuZG9yX2lkLCBpbnRmLT5wcm9kdWN0X2lkKTsNCmRp
ZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L2dyZXlidXMvaW50ZXJmYWNlLmggYi9pbmNsdWRlL2xp
bnV4L2dyZXlidXMvaW50ZXJmYWNlLmgNCmluZGV4IGNlNGRlZjg4MWU2Li5mZWQ2MzU2ZWIxMyAx
MDA2NDQNCi0tLSBhL2luY2x1ZGUvbGludXgvZ3JleWJ1cy9pbnRlcmZhY2UuaA0KKysrIGIvaW5j
bHVkZS9saW51eC9ncmV5YnVzL2ludGVyZmFjZS5oDQpAQCAtMTgsNiArMTgsNyBAQCBlbnVtIGdi
X2ludGVyZmFjZV90eXBlIHsNCiAJR0JfSU5URVJGQUNFX1RZUEVfRFVNTVksDQogCUdCX0lOVEVS
RkFDRV9UWVBFX1VOSVBSTywNCiAJR0JfSU5URVJGQUNFX1RZUEVfR1JFWUJVUywNCisJR0JfSU5U
RVJGQUNFX1RZUEVfUDJQLA0KIH07DQogDQogI2RlZmluZSBHQl9JTlRFUkZBQ0VfUVVJUktfTk9f
Q1BPUlRfRkVBVFVSRVMJCUJJVCgwKQ0KLS0gDQoyLjQ5LjANCg0KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0IC0t
IGdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKVG8gdW5zdWJzY3JpYmUgc2VuZCBhbiBlbWFp
bCB0byBncmV5YnVzLWRldi1sZWF2ZUBsaXN0cy5saW5hcm8ub3JnCg==
