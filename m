Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sJUbJrnnjWkm8gAAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Thu, 12 Feb 2026 15:46:17 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 2617912E759
	for <lists+greybus-dev@lfdr.de>; Thu, 12 Feb 2026 15:46:17 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 28A1A401F0
	for <lists+greybus-dev@lfdr.de>; Thu, 12 Feb 2026 14:46:16 +0000 (UTC)
Received: from mx0a-0024c301.pphosted.com (mx0a-0024c301.pphosted.com [148.163.149.154])
	by lists.linaro.org (Postfix) with ESMTPS id CDE0C3F74C
	for <greybus-dev@lists.linaro.org>; Thu, 12 Feb 2026 14:44:29 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=silabs.com header.s=pps12202023 header.b=RpvIrWK9;
	dkim=pass header.d=silabs.com header.s=selector1 header.b=NxRSGBsJ;
	spf=pass (lists.linaro.org: domain of "prvs=050394110d=damien.riegel@silabs.com" designates 148.163.149.154 as permitted sender) smtp.mailfrom="prvs=050394110d=damien.riegel@silabs.com";
	arc=pass ("microsoft.com:s=arcselector10001:i=1");
	dmarc=pass (policy=reject) header.from=silabs.com
Received: from pps.filterd (m0101743.ppops.net [127.0.0.1])
	by mx0a-0024c301.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61C2Lwnj2678544;
	Thu, 12 Feb 2026 08:44:16 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps12202023;
	 bh=ZZ1TKMwgYjIr2jdQ/i2Vf/uw9HLlg2Mbuklc+DINhEc=; b=RpvIrWK9qb16
	pSVKOa5Ctlzurlkp2bKBqknzVp4yeMIbHFqS1v1VAsXwrgFyQvUIXRIGNObzptJL
	XIuwwQvQhN+jU5gjD3gAyeotZ6yxAkbFzgf5aRvWASS+mbKOGHyDa4NckYkJ79/F
	XeRxJxkpRf0XmhtQj9bD9kLwlFSsIF2Nao4mmn72qZ1xjncGXUR1M7TcJkfPkmxV
	bI9C+phz18qwwIEEkQsqKIZd2pte+DdqqykIENNixfkhqeKoyixabK1taBuemNSD
	MKwkIl54/cVZ9mfOguICsEyVzlPGu2KT2rqQSMBYOymAI3IBBIKuxde2eaqpTpwK
	R5LwxsziKA==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11020096.outbound.protection.outlook.com [52.101.61.96])
	by mx0a-0024c301.pphosted.com (PPS) with ESMTPS id 4c92uysn4e-7
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 12 Feb 2026 08:44:15 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rllk0uq57ZMJSY1SgBzck754Ci1BnBOQ+w//M4atC/uxy72aYCZvY29r4tA8g8vRz9YfneHAlUqJgfm8OhGpaesSssRW/s9aWSmDgNWbkd8ZOmdyj0+UfR7nyJ+To75XCBijRBjTnZkq+3klisWTsqpfVtyxz/dHnI9+uRdboyHKtg08t1czh7py9gSeZ5+juwZgbGW3Zf3hD5e0sVDYPaydOx8P8D3PmJh1F3esccZ/s7CgWJY/Jf/ewTmjZ6ogAadQ5KvQO0LJW4E2wW1XxmrwxxtHkhU1z4sNIm7kEZQN0Lxm7vOekF8CfxSLEorj/1zqvZBbh9mU5OtooXfcLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZZ1TKMwgYjIr2jdQ/i2Vf/uw9HLlg2Mbuklc+DINhEc=;
 b=V5lO3DCCDr93X465SccEoJWb4eL5L+ey72x5VtkKKWwjKaAjnJcg9txFk7jy6b2IplZ+Vz9CsIezhydKNsrXoigmWOO90JHC3R19wg4/yZb3uPs/CYLulXB57B4Gj6HmFYCxqOjmBV4Wg4QdhtujZfowNbN0JXTDSHU8LGA3yZeC2EUpwayq+ludJUhFR8Ltz0DAaT1mf3I1nFrZg7L8kphHerW7EmHIjWzYwkKOh/OcWOWZyTXL/GPBDh22tR+bkzXliWQAm0yFNk9D324ADkhv8p8cGx2UsxCBIY0E5tZ32Dv4vtAomwbSbX9doUp9Wr7W0/gdmyeOLTeVEZz4+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silabs.com; dmarc=pass action=none header.from=silabs.com;
 dkim=pass header.d=silabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZZ1TKMwgYjIr2jdQ/i2Vf/uw9HLlg2Mbuklc+DINhEc=;
 b=NxRSGBsJM7t/g2/qHeNLikDHr0eX609aHeZPuqdRnYsgcuRgjmIJyHZepLPEk/RGuLwkRMP2h0K6CL1aVviJMeoYKg7O6zMi2MFXS11ZtUhjW6rEYk/lyoJRFqivY9qLTm3WSCj7ZMvXX/HKx3GBBY4Wpb9pIZ1kkGQ+3evf6uM=
Received: from DS0PR11MB8205.namprd11.prod.outlook.com (2603:10b6:8:162::17)
 by LV8PR11MB8486.namprd11.prod.outlook.com (2603:10b6:408:1e8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Thu, 12 Feb
 2026 14:44:12 +0000
Received: from DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::2de6:bc88:2af7:3583]) by DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::2de6:bc88:2af7:3583%3]) with mapi id 15.20.9611.008; Thu, 12 Feb 2026
 14:44:12 +0000
From: =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
To: greybus-dev@lists.linaro.org, Johan Hovold <johan@kernel.org>,
        Alex Elder <elder@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org
Date: Thu, 12 Feb 2026 09:43:47 -0500
Message-ID: <20260212144352.93043-10-damien.riegel@silabs.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260212144352.93043-1-damien.riegel@silabs.com>
References: <20260212144352.93043-1-damien.riegel@silabs.com>
X-ClientProxiedBy: YQBPR0101CA0124.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:5::27) To DS0PR11MB8205.namprd11.prod.outlook.com
 (2603:10b6:8:162::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8205:EE_|LV8PR11MB8486:EE_
X-MS-Office365-Filtering-Correlation-Id: 2158a851-e3bb-49f1-c34e-08de6a452fd7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?R3E2OEFxbTJUZ0JScnJFbmhiMnczT1ErTHZEY1gzWTNwZTBzOFZGdVRLcGIr?=
 =?utf-8?B?STZFSUJOSEplVEdFNGRMZ2U1WVRLSnpkSnM4Vk9rWVZpSVdnOFJKNU9XR0Rz?=
 =?utf-8?B?ZVZlMlFWWE5tbHl3QXFVc1Z3WXpXR2Y3UlJRSnVoTTVIelhIRVV1d1VpdWY3?=
 =?utf-8?B?ZUUzS0FsWVVUTUF1WmQxY3lGRGZkaVRUUEtTNzBJV1VBc2N5NDFzL0dSQ29t?=
 =?utf-8?B?a054RnFMMWZwZWV1VGZxbnZZSDdpWmFlOU1jR0tNUXVKOGwwQUNXRzdWeVR5?=
 =?utf-8?B?VDFVQUdBbTJ4aDVCVnZERXBrVzc5TUtQSmZhSUFSVGF0ZnpPamdDR3BJWE1C?=
 =?utf-8?B?U09EUFlHSWZMR2dzdHlON0ZOM3dtWm9qRitTQXVjbDIzTWZBTFNlbWtFbk4y?=
 =?utf-8?B?c28wWFI1NGorb0NiZ1Jud3AzdmNQK3UwUEJIVTl4OGtiaXZYV2p6MVZWeERo?=
 =?utf-8?B?Q1pqeUZZblVvVHVpbGljSHVmRFg2YWs5QW9BT2pKK29raGU4TGRaZU5qY1Bz?=
 =?utf-8?B?Snpicm1MTTJNZExFc3ZldEI5dlhXb1Z5YUZSU1pWR0MyczBMb0ErN2czNC95?=
 =?utf-8?B?MDdna3orVkVmbFhWK2pTQ0VOS1RoOGFyOGl6M2t2MGw3Zm9hcVFSN1ArWG1V?=
 =?utf-8?B?dUx5LzVrUGdxY0k5YWtFZTRyWlpoMGt4Z2VjYTZWTEZxanZVSTRObnVjUkl5?=
 =?utf-8?B?dnE1ZUg4MStOMGZsLzJibEhpQUFUazE0OEt6WGwxNXdHYWNkYnR2M2dEdjZv?=
 =?utf-8?B?YkhDb0RSQWJaVlB3MUdlU0NZb1Zobm9UbGRQeUkwbm83OGhLbzN5T1orY0dO?=
 =?utf-8?B?Y2lHRmwxQnI5YWxwenJNV0Q3ejYyS0dPNEFtRFFFYkdGZGRoelBFUzkraG1Q?=
 =?utf-8?B?TXVKMWxpT1ZWMFFmVGd3OFE5b1RKVEM5MWJDb3RNN1ZZNnZJUnJUMFdKbW5R?=
 =?utf-8?B?cURmVmt0V2FLL1hiTUE2TTkzV2JCblMyL0ZmdFg4T25WeFZBQkdWdWhKbXN6?=
 =?utf-8?B?WEIrRWp6UFBEMFJ6MFBnYmZEUHEvd3Z0d3FJNWpOVk95MDRCMVlWalFxTTFD?=
 =?utf-8?B?d2M2eTViWXVzN2h6VGFTeGJDaUdNcC8wOFJ3Z0YrMUR6TmhtTWZJMDQ5bFc5?=
 =?utf-8?B?dWFBalE3OFh1NCtqcEVob3RiWTJjQkY5Z0U0aVNKMWh6cFRTMU8rYlpiQzZD?=
 =?utf-8?B?WldZaUZRbjVaTG5uSm5ucE5uck1ldFMyeGt2RHpOK01TTGZ1U0R5VnJnRk4y?=
 =?utf-8?B?dWt4cEhyaWpHbEk0ejJjb1FHZUJPNVU0Z2hQa2llN3NXUlplWlc4bUhkdHBT?=
 =?utf-8?B?a3RKcmxvSmQ1WDJITyt0czU5cVQ1QkNqREVKMktLc01DMklLRUVFZTJuTGRG?=
 =?utf-8?B?b01HMVphVnJCTFZmMjI3MWE2N3hqUE5vNC9qcSs5WXlUU3FKdlVaWE8wcDJp?=
 =?utf-8?B?SVFnRXNrNFNZR3EwbTFLRFVEODlIM05pUEpoVUY1Tlg5bEZKSnVNVEtiM2ZU?=
 =?utf-8?B?UHB6dzY0T1pwZ2tJb21BZWs2b0o5SmdpRFFhVWdSSkttQlpuekhIdGRvSDZ5?=
 =?utf-8?B?bUpkeldkZkY2YTBSaENzKy9lZ2Y2dUxucEtRMkIrSFV0QTlLdmh0WTRwYmRL?=
 =?utf-8?B?a0N4SHI4ajhxR1NZb2xRblJIWDFYeDdHanFHcUlWUTRrQ0M4cTBmOUR5ckdV?=
 =?utf-8?B?MHBHaEtRdjM0b3p0MVFWRGk5UldBaVdMM3JBR01adnZxeitmQU05R1VIMDRS?=
 =?utf-8?B?N1BPQm9VTXRZKzNRUkxqNjFxTU45TnhjUlg0SXFFbyt3WmR0OGpkbTRBNDBX?=
 =?utf-8?B?dGZ0ZERBakJvcnQvUmwyUGlvVkdKQzJiVHFyZHAwOGtlNzZjMC90ekM4OWM4?=
 =?utf-8?B?TVdwRWtJK2ZWK2I1Qi9LWTJ6VkVPWEVFTENJNU9RQmpPcWF3TEFXRndVREU2?=
 =?utf-8?B?QmY0em5VSHdVT2pNQVY2c0ZDM1Jhd0VwWVYzMmY4aTE3SnppU1RZYnU5USsw?=
 =?utf-8?B?MUwwZGFYcjNkY1lscHUyLzlXN084dE5ESlE1V2ZBeHRDTEpSeGJILzdrYm1z?=
 =?utf-8?B?T01lYjdvclZ0QlJPVjNXbVE0NnhtWWRkVlhoN2w4WTl1NGpsY052dmhSWmMv?=
 =?utf-8?B?WVEvWXRxdnBUS3hDQjkrb2J4TTNCckdxQ2VuM0tPY2lEcjFpQVdtcmxwOXQx?=
 =?utf-8?Q?Ei0B9AwuY5OBm6hW0FDvIBc=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8205.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?STRPU2tWZTBzeHZyRFhnOW5DbzgxVU9hbXltdXl1ejVUejViRm9Rajk0WU1Q?=
 =?utf-8?B?UUs4UmFscVhtUWptSWFmUW1WRVR4L05mZDhPSmF2T24yUjJrQ2RmUTBNZkFM?=
 =?utf-8?B?cGR5WjhtQnByQ0tUenFBaVFBUGcyM0xMUGpmdkNZcklJaHJ3clRlQy9VdXFU?=
 =?utf-8?B?QUV3QTJGZ2d4THJ4ZHVCTHVqZjdKbGZGeUEydHV2ZGlhWnp2bWFldUZUZmUx?=
 =?utf-8?B?YWtIbVphZW5HaVRGQlB6UWt3V1hKM3FpUm5MbHRHeHk3NGg3N21GSEUwTGlF?=
 =?utf-8?B?T1NXaldxQ0VJaHRsM08rWmZqZmRGZTJ3MjUzanhmekJiOGczM2F5Q09BaXBu?=
 =?utf-8?B?Zms2RTRkeUhOTk9Ock9GZ1dhRHV5TUhwbjVkaFhpUkpnYkpnbllWVzZidnpW?=
 =?utf-8?B?TnpHdnFNRkR0dnd3SWIrRjVkTHVNZVlIN0sxeEFndUM2blhBMm9oWDVxL1Rt?=
 =?utf-8?B?WkRSLzVNbGtYK1hIc0VBYzlpZ1QrcTlZYXphUGdtaTZnVjZ6bWtwVDVmV1Vh?=
 =?utf-8?B?ajlnK0RTWjk2YXUxaGQxVXBhZ2xuK2FRYUVNUHlKZlJOWDdGY1AvYzNxdDRC?=
 =?utf-8?B?RnRETnBPYUwvbFgzNFZBb0piejFTVWJrS3VMSWdHUjNWYnhQalBxdkVxVW4w?=
 =?utf-8?B?a2E0ZDliVEU2YmhlZnhnT1JzUTNxQjJxbGNhdVNLbHl1SnFHK044bG9jbHl2?=
 =?utf-8?B?VDFiOVM5MENnSVFPdGF4UENRWXdNUnJHNHN1bzRYL0hmeWp6REE1WVNWN092?=
 =?utf-8?B?YU5DenAzS3pzdGNGTmNlTHRVUEdQWTJEYUVlVkFLNFpKdDd2bTFQUCtmRU80?=
 =?utf-8?B?NjM0K0NyNDZsV3Uxa2RxeXNXM0xsYlF6bnlDSlFuK00xODRpMldGcTBXZFdt?=
 =?utf-8?B?NkdZR3Rxbyt0R1A1MS9MSExSV2MzMzl1bFR6R0V0dHhqVlZ4L24xcmlrRXE2?=
 =?utf-8?B?ZlFtajQraDBnZCtWVldqWEQxSkVTZS8zRWlZaG9FekF4ZWk4U1NROC8yMmd3?=
 =?utf-8?B?RVQzNUZHbjNweVVySGNDdENxODNNdWtyZlJDU0Z1L3lEbHY0NDJ2MVM5UU1I?=
 =?utf-8?B?U2NmOCtjTXBqc1Z1UmdDa2U2UllIUVByRWtCTjEzZGRQZG9aK0VOdG5ZcG9R?=
 =?utf-8?B?OWNZdW1DSVdaNEZRS0lrRkVtbm1aZ2ZPaFd2dGRUWC9jL0ZwU2taaGMrY084?=
 =?utf-8?B?SEJtNTJQVkxuWXhjTm1sRENYNlBJRmh5dm1hSmtySFRmYjJoNFVtdnNGbGxU?=
 =?utf-8?B?QUhoalhUMWphSmRLdDQydVhodTMwOTFBaUNwUEJiYThlVHUweElCVlQvSUlh?=
 =?utf-8?B?YTRVWThobGpXMjVYQnl3UzR0anRXTUdWMFVldjNROFBVMUcxdVRMY3gvcDZx?=
 =?utf-8?B?WVE2L1lzVkN4SHRaZTMxZHo2Tk9VVjdIa1Z4eFFQYU9vMVFSVGxXbkdIYUhh?=
 =?utf-8?B?Z1QyeTRVVkcyb3IrR0I1UGErRUpHbENIWmh2blcxSThPampKellkU3JDZjc0?=
 =?utf-8?B?OTJuWmdKczdZN2h5RHp2TDJVRnlFOSs5MkFvajZ6L080eVc5UEVoYUptUi9y?=
 =?utf-8?B?NFNWd01WcTAzUVZtVzVRUlpDYTFCWmxuSFdteXdXOEhhTEJBajBFdnlMYWI5?=
 =?utf-8?B?c05ad0tuK0xnTGExNjFmMFJwcy9iYmJiVmg0Z0VnbHI4T09TTlcrVDFXci9h?=
 =?utf-8?B?VnJ3UWFZOW1ib2FMVHlBa1pjM3V5K0NHajJCaDdZbm5lKzcyalJSYU81VTR2?=
 =?utf-8?B?YS9JcHhXTXVJeXcvOVBCMEJPS1lOeWEwWStDbDlKNXllQ3lFaGpaa1ZTVTVs?=
 =?utf-8?B?N3NjVFk2dFBPdjRLSnE3VTRqMzludE5rTTYxNTRvWDRTdGtndUJEVldCMFVt?=
 =?utf-8?B?cFA3d3BMcUVacHBDRWl0U3pCREgwcEhUbytSNWpBZTVzZndURjBMTk0yS1Zm?=
 =?utf-8?B?dnFNY0I3TVhKbDE1UlRQTFpsb1dTdmxkc0haUmx0dE11eGpPVWZzdko4RWlP?=
 =?utf-8?B?SDJHZ3R2WjVsaFlDb0wySWRQQklzcjBCQzlPMzYwcEd1Y2JjQmRyaEdEbk5F?=
 =?utf-8?B?ZW41akJkZEwxT3pnU3V1dnJNc0JDS1lFUDg4ZUUySDRhM1VXZ1h2ZGpOVlZG?=
 =?utf-8?B?dHB0eXcvWGtmbitXR3NuYTQ5NTg2NHpEU0QySWNmcXlhVWVXU2xaTVErd3JL?=
 =?utf-8?B?NW1tTk1vRGFkMFlPR2VPZ294RmdHN1B4amVVWDN6TmtIVzB1dWU1TU5VaXJs?=
 =?utf-8?B?RWNvWGVMNHlKSXVyNlBrbjY5OHhzaUpHem5RanRWRFZ2ZHBFUmc2UENCQ2Vh?=
 =?utf-8?B?dUlVdGxWbTVhazVxSmtWSFJDVFZ2bjhxcHdRV0xEKytJL1p3MVI4Zz09?=
X-OriginatorOrg: silabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2158a851-e3bb-49f1-c34e-08de6a452fd7
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8205.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 14:44:12.2762
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 54dbd822-5231-4b20-944d-6f4abcd541fb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VcDdOF45wWjzYPTMrgCywgUERRpquhNSI8Cy2V8sje/R2okwhSkD6Cu1EW7ZAlnydBxGgui7QkCQK+rmKCytLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8486
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEyMDExMSBTYWx0ZWRfXyWbc4HDqwEP/
 aVmbl9G3ylqGnt9BgLM96kuP6GlzpaA2n5G321xtovCPyEcUyf9PGS62whrcLkaFc94kFwEnFg2
 zPM+sCe5MBfMllvJt7Bkwe8afUxIwzDARfpuv68f2n59ZuLL/UuLYTBYWHDkjdBsAWqoEdKrM/U
 3CrA7TFGGNl2GT4HJ44DEB/kBNf9U/sL8qvSJ+kI8BqvHO6C6Ax/M7tiHKIj+roNe9DDRqIpSce
 3ijxvv5NvH9lfVBAZfS9FXanUpfJB0DwVdr1TtDcWO/1kJDgf5v/3hKqDD/nGv6TASwogRZxVXc
 o1F+SUpJTEUkkz9/NLrftjesGKvkgKj8GSRbxFwBy2kRYAh+vdhaUathkALxStku/HM6YzoKOQP
 Puppi7WL1C80h2Y+OnA55glK8newE6LzsaxkmeWkhYFjCInraQ0CxVMgCngZTjP86eXDDcbSJSt
 k2roMfkF4aCxJR0SIBA==
X-Authority-Analysis: v=2.4 cv=DtRbOW/+ c=1 sm=1 tr=0 ts=698de73f cx=c_pps
 a=TvliyZNEFSK35vtP2Nadqg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=M51BFTxLslgA:10
 a=i1IsUcr2s-wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=2AEO0YjSAAAA:8 a=bNjmmVRrHTbCwxPNuCQA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: 1gSHnUDTLKDj8MJ4WxXJwEHy6syeG3Jb
X-Proofpoint-GUID: 1gSHnUDTLKDj8MJ4WxXJwEHy6syeG3Jb
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
Message-ID-Hash: WCEGLQSKXE6PH7HGCERKWP6OSX4PWU4A
X-Message-ID-Hash: WCEGLQSKXE6PH7HGCERKWP6OSX4PWU4A
X-MailFrom: prvs=050394110d=damien.riegel@silabs.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Silicon Labs Kernel Team <linux-devel@silabs.com>, =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v3 09/14] greybus: cpc: acknowledge all incoming messages
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/WCEGLQSKXE6PH7HGCERKWP6OSX4PWU4A/>
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
X-Rspamd-Queue-Id: 2617912E759
X-Rspamd-Action: no action

Q3VycmVudGx5LCBDUEMgZG9lc24ndCBzZW5kIG1lc3NhZ2VzIG9uIGl0cyBvd24sIGl0IG9ubHkg
cHJlcGVuZHMgaXRzDQpoZWFkZXIgdG8gb3V0Z29pbmcgbWVzc2FnZXMuIFRoaXMgY2FuIGxlYWQg
dG8gbWVzc2FnZXMgbm90IGJlaW5nDQphY2tub3dsZWRnZWQsIGZvciBpbnN0YW5jZSBpbiB0aGUg
Y2FzZSBvZiBhbiBTVkMgUGluZw0KDQoJSG9zdAkJCQlEZXZpY2UNCg0KICBTVkMgUGluZyAoc2Vx
PVgsIGFjaz1ZKQ0KCQkJCSAgU1ZDIFBpbmcgUmVwbHkgKHNlcT1ZLCBhY2s9WCsxKQ0KDQpUaGUg
IlBpbmcgUmVwbHkiIGlzIG5ldmVyIGFja25vd2xlZGdlZCBhdCB0aGUgQ1BDIGxldmVsLCB3aGlj
aCBjYW4gbGVhZA0KdG8gcmV0cmFuc21pc3Npb25zLCBvciB3b3JzdCB0aGUgZGV2aWNlIG1pZ2h0
IHRoaW5rIHRoZSBsaW5rIGlzIGJyb2tlbg0KYW5kIGF0dGVtcHQgdG8gcmVjb3Zlci4NCg0KVG8g
cHJldmVudCB0aGF0IHNjZW5hcmlvLCBhbiBhY2sgbWVjaGFuaXNtIGlzIGltcGxlbWVudGVkIGlu
IHRoZSBtb3N0DQpzdHJhaWdodGZvcndhcmQgbWFubmVyOiBzZW5kIGFuIEFDSyB0byBhbGwgaW5j
b21pbmcgbWVzc2FnZXMuIEhlcmUsIHR3bw0KZmxhZ3MgbmVlZCB0byBiZSBhZGRlZDoNCiAtIEZp
cnN0LCBhIGZsYWcgaXMgbmVlZGVkIHRvIGRpZmZlcmVudGlhdGUgYmV0d2VlbiBwdXJlIENQQyBm
cmFtZXMsDQogICB0aGF0IGFyZSBvbmx5IG1lYW5pbmdmdWwgYXQgdGhlIENQQyBsZXZlbCwgYW5k
IHJlZ3VsYXIgR3JleWJ1cw0KICAgb3BlcmF0aW9ucy4gVGhpcyBmbGFnIGlzIGNhbGxlZCAiQ09O
VFJPTCIuIEN1cnJlbnRseSB0aGVyZSBpcyBvbmx5DQogICBvbmUgdHlwZSBvZiBjb250cm9sIGZy
YW1lLCB0aGUgc3RhbmRhbG9uZSBhY2suIENvbnRyb2wgbWVzc2FnZXMgaGF2ZQ0KICAgdGhlIHNh
bWUgZm9ybWF0IGFzIEdyZXlidXMgb3BlcmF0aW9ucy4NCiAtIFNlY29uZCwgYWNrIHRoZW1zZWx2
ZXMgc2hvdWxkIG5vdCBiZSBhY2tlZCwgc28gdG8gZGV0ZXJtaW5lIGlmIGENCiAgIG1lc3NhZ2Ug
c2hvdWxkIGJlIGFja2VkIG9yIG5vdCwgYSBSRVFVRVNUX0FDSyBmbGFnIGlzIGFkZGVkLg0KDQpT
aWduZWQtb2ZmLWJ5OiBEYW1pZW4gUmnDqWdlbCA8ZGFtaWVuLnJpZWdlbEBzaWxhYnMuY29tPg0K
LS0tDQpDaGFuZ2VzIGluIHYyOg0KICAtIGFkZCBtaXNzaW5nIGNwdV90b19sZTE2IGNvbnZlcnNp
b24gd2hlbiBzZXR0aW5nIG1lc3NhZ2Ugc2l6ZQ0KDQogZHJpdmVycy9ncmV5YnVzL2NwYy9jcGMu
aCAgICAgIHwgIDMgKysNCiBkcml2ZXJzL2dyZXlidXMvY3BjL2Nwb3J0LmMgICAgfCAgMSArDQog
ZHJpdmVycy9ncmV5YnVzL2NwYy9oZWFkZXIuYyAgIHwgNDEgKysrKysrKysrKysrKysrKysrKysr
KysrKw0KIGRyaXZlcnMvZ3JleWJ1cy9jcGMvaGVhZGVyLmggICB8ICAzICsrDQogZHJpdmVycy9n
cmV5YnVzL2NwYy9wcm90b2NvbC5jIHwgNTUgKysrKysrKysrKysrKysrKysrKysrKysrKysrKyst
LS0tLQ0KIDUgZmlsZXMgY2hhbmdlZCwgOTYgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkN
Cg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3JleWJ1cy9jcGMvY3BjLmggYi9kcml2ZXJzL2dyZXli
dXMvY3BjL2NwYy5oDQppbmRleCA4N2I1NGE0ZmQzNC4uNzI1ZmQ3ZjRhZmMgMTAwNjQ0DQotLS0g
YS9kcml2ZXJzL2dyZXlidXMvY3BjL2NwYy5oDQorKysgYi9kcml2ZXJzL2dyZXlidXMvY3BjL2Nw
Yy5oDQpAQCAtNTEsNiArNTEsOSBAQCBzdHJ1Y3QgY3BjX3NrYl9jYiB7DQogCXN0cnVjdCBnYl9t
ZXNzYWdlICpnYl9tZXNzYWdlOw0KIA0KIAl1OCBzZXE7DQorDQorI2RlZmluZSBDUENfU0tCX0ZM
QUdfUkVRX0FDSyAoMSA8PCAwKQ0KKwl1OCBjcGNfZmxhZ3M7DQogfTsNCiANCiAjZGVmaW5lIENQ
Q19TS0JfQ0IoX19za2IpICgoc3RydWN0IGNwY19za2JfY2IgKikmKChfX3NrYiktPmNiWzBdKSkN
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dyZXlidXMvY3BjL2Nwb3J0LmMgYi9kcml2ZXJzL2dyZXli
dXMvY3BjL2Nwb3J0LmMNCmluZGV4IDcwNDFhNmE4YTM2Li44NDdjYzhlYmU0MSAxMDA2NDQNCi0t
LSBhL2RyaXZlcnMvZ3JleWJ1cy9jcGMvY3BvcnQuYw0KKysrIGIvZHJpdmVycy9ncmV5YnVzL2Nw
Yy9jcG9ydC5jDQpAQCAtOTEsNiArOTEsNyBAQCBpbnQgY3BjX2Nwb3J0X3RyYW5zbWl0KHN0cnVj
dCBjcGNfY3BvcnQgKmNwb3J0LCBzdHJ1Y3Qgc2tfYnVmZiAqc2tiKQ0KIAltdXRleF9sb2NrKCZj
cG9ydC0+bG9jayk7DQogDQogCUNQQ19TS0JfQ0Ioc2tiKS0+c2VxID0gY3BvcnQtPnRjYi5zZXE7
DQorCUNQQ19TS0JfQ0Ioc2tiKS0+Y3BjX2ZsYWdzID0gQ1BDX1NLQl9GTEFHX1JFUV9BQ0s7DQog
DQogCWNwb3J0LT50Y2Iuc2VxKys7DQogCWFjayA9IGNwb3J0LT50Y2IuYWNrOw0KZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3JleWJ1cy9jcGMvaGVhZGVyLmMgYi9kcml2ZXJzL2dyZXlidXMvY3BjL2hl
YWRlci5jDQppbmRleCA2Mjk0NmQ2MDc3ZS4uODg3NWE2ZmVkMjYgMTAwNjQ0DQotLS0gYS9kcml2
ZXJzL2dyZXlidXMvY3BjL2hlYWRlci5jDQorKysgYi9kcml2ZXJzL2dyZXlidXMvY3BjL2hlYWRl
ci5jDQpAQCAtMyw4ICszLDI1IEBADQogICogQ29weXJpZ2h0IChjKSAyMDI1LCBTaWxpY29uIExh
Ym9yYXRvcmllcywgSW5jLg0KICAqLw0KIA0KKyNpbmNsdWRlIDxsaW51eC9iaXRmaWVsZC5oPg0K
KyNpbmNsdWRlIDxsaW51eC9iaXRzLmg+DQorDQogI2luY2x1ZGUgImhlYWRlci5oIg0KIA0KKyNk
ZWZpbmUgQ1BDX0hFQURFUl9DT05UUk9MX0lTX0NPTlRST0xfTUFTSyBCSVQoNykNCisjZGVmaW5l
IENQQ19IRUFERVJfQ09OVFJPTF9SRVFfQUNLX01BU0sgQklUKDYpDQorDQorLyoqDQorICogY3Bj
X2hlYWRlcl9pc19jb250cm9sKCkgLSBJZGVudGlmeSBpZiB0aGlzIGlzIGEgY29udHJvbCBmcmFt
ZS4NCisgKiBAaGRyOiBDUEMgaGVhZGVyLg0KKyAqDQorICogUmV0dXJuOiBUcnVlIGlmIHRoaXMg
aXMgYSBjb250cm9sIGZyYW1lLCBmYWxzZSBpZiB0aGlzIGEgR3JleWJ1cyBmcmFtZS4NCisgKi8N
Citib29sIGNwY19oZWFkZXJfaXNfY29udHJvbChjb25zdCBzdHJ1Y3QgY3BjX2hlYWRlciAqaGRy
KQ0KK3sNCisJcmV0dXJuIGhkci0+Y3RybF9mbGFncyAmIENQQ19IRUFERVJfQ09OVFJPTF9JU19D
T05UUk9MX01BU0s7DQorfQ0KKw0KIC8qKg0KICAqIGNwY19oZWFkZXJfZ2V0X3NlcSgpIC0gR2V0
IHRoZSBzZXF1ZW5jZSBudW1iZXIuDQogICogQGhkcjogQ1BDIGhlYWRlci4NCkBAIC0xNSwzICsz
MiwyNyBAQCB1OCBjcGNfaGVhZGVyX2dldF9zZXEoY29uc3Qgc3RydWN0IGNwY19oZWFkZXIgKmhk
cikNCiB7DQogCXJldHVybiBoZHItPnNlcTsNCiB9DQorDQorLyoqDQorICogY3BjX2hlYWRlcl9n
ZXRfcmVxX2FjaygpIC0gR2V0IHRoZSByZXF1ZXN0IGFja25vd2xlZGdlIGZyYW1lIGZsYWcuDQor
ICogQGhkcjogQ1BDIGhlYWRlci4NCisgKg0KKyAqIFJldHVybjogUmVxdWVzdCBhY2tub3dsZWRn
ZSBmcmFtZSBmbGFnLg0KKyAqLw0KK2Jvb2wgY3BjX2hlYWRlcl9nZXRfcmVxX2Fjayhjb25zdCBz
dHJ1Y3QgY3BjX2hlYWRlciAqaGRyKQ0KK3sNCisJcmV0dXJuIEZJRUxEX0dFVChDUENfSEVBREVS
X0NPTlRST0xfUkVRX0FDS19NQVNLLCBoZHItPmN0cmxfZmxhZ3MpOw0KK30NCisNCisvKioNCisg
KiBjcGNfaGVhZGVyX2VuY29kZV9jdHJsX2ZsYWdzKCkgLSBFbmNvZGUgcGFyYW1ldGVycyBpbnRv
IHRoZSBjb250cm9sIGJ5dGUuDQorICogQGNvbnRyb2w6IFRydWUgaWYgQ1BDIGNvbnRyb2wgZnJh
bWUsIGZhbHNlIGlmIEdyZXlidXMgZnJhbWUuDQorICogQHJlcV9hY2s6IEZyYW1lIGZsYWcgaW5k
aWNhdGluZyBhIHJlcXVlc3QgdG8gYmUgYWNrbm93bGVkZ2VkLg0KKyAqDQorICogUmV0dXJuOiBF
bmNvZGVkIGNvbnRyb2wgYnl0ZS4NCisgKi8NCit1OCBjcGNfaGVhZGVyX2VuY29kZV9jdHJsX2Zs
YWdzKGJvb2wgY29udHJvbCwgYm9vbCByZXFfYWNrKQ0KK3sNCisJcmV0dXJuIEZJRUxEX1BSRVAo
Q1BDX0hFQURFUl9DT05UUk9MX0lTX0NPTlRST0xfTUFTSywgY29udHJvbCkgfA0KKwkgICAgICAg
RklFTERfUFJFUChDUENfSEVBREVSX0NPTlRST0xfUkVRX0FDS19NQVNLLCByZXFfYWNrKTsNCit9
DQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncmV5YnVzL2NwYy9oZWFkZXIuaCBiL2RyaXZlcnMvZ3Jl
eWJ1cy9jcGMvaGVhZGVyLmgNCmluZGV4IDUxOTY0MjIzODBlLi4xOTYxMjAxMmIxOSAxMDA2NDQN
Ci0tLSBhL2RyaXZlcnMvZ3JleWJ1cy9jcGMvaGVhZGVyLmgNCisrKyBiL2RyaXZlcnMvZ3JleWJ1
cy9jcGMvaGVhZGVyLmgNCkBAIC0zOCw2ICszOCw5IEBAIHN0cnVjdCBjcGNfaGVhZGVyIHsNCiAJ
X191OCBhY2s7DQogfSBfX3BhY2tlZDsNCiANCitib29sIGNwY19oZWFkZXJfaXNfY29udHJvbChj
b25zdCBzdHJ1Y3QgY3BjX2hlYWRlciAqaGRyKTsNCiB1OCBjcGNfaGVhZGVyX2dldF9zZXEoY29u
c3Qgc3RydWN0IGNwY19oZWFkZXIgKmhkcik7DQorYm9vbCBjcGNfaGVhZGVyX2dldF9yZXFfYWNr
KGNvbnN0IHN0cnVjdCBjcGNfaGVhZGVyICpoZHIpOw0KK3U4IGNwY19oZWFkZXJfZW5jb2RlX2N0
cmxfZmxhZ3MoYm9vbCBjb250cm9sLCBib29sIHJlcV9hY2spOw0KIA0KICNlbmRpZg0KZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3JleWJ1cy9jcGMvcHJvdG9jb2wuYyBiL2RyaXZlcnMvZ3JleWJ1cy9j
cGMvcHJvdG9jb2wuYw0KaW5kZXggOGYwYWM2ZGZhMTEuLjk3ZGI3MGE1M2IwIDEwMDY0NA0KLS0t
IGEvZHJpdmVycy9ncmV5YnVzL2NwYy9wcm90b2NvbC5jDQorKysgYi9kcml2ZXJzL2dyZXlidXMv
Y3BjL3Byb3RvY29sLmMNCkBAIC05LDYgKzksMTEgQEANCiAjaW5jbHVkZSAiaGVhZGVyLmgiDQog
I2luY2x1ZGUgImhvc3QuaCINCiANCitzdGF0aWMgYm9vbCBjcGNfc2tiX2lzX3NlcXVlbmNlZChz
dHJ1Y3Qgc2tfYnVmZiAqc2tiKQ0KK3sNCisJcmV0dXJuIENQQ19TS0JfQ0Ioc2tiKS0+Y3BjX2Zs
YWdzICYgQ1BDX1NLQl9GTEFHX1JFUV9BQ0s7DQorfQ0KKw0KIHZvaWQgY3BjX3Byb3RvY29sX3By
ZXBhcmVfaGVhZGVyKHN0cnVjdCBza19idWZmICpza2IsIHU4IGFjaykNCiB7DQogCXN0cnVjdCBj
cGNfaGVhZGVyICpoZHI7DQpAQCAtMjAsMjYgKzI1LDYyIEBAIHZvaWQgY3BjX3Byb3RvY29sX3By
ZXBhcmVfaGVhZGVyKHN0cnVjdCBza19idWZmICpza2IsIHU4IGFjaykNCiANCiAJaGRyLT5hY2sg
PSBhY2s7DQogCWhkci0+c2VxID0gQ1BDX1NLQl9DQihza2IpLT5zZXE7DQorCWhkci0+Y3RybF9m
bGFncyA9IGNwY19oZWFkZXJfZW5jb2RlX2N0cmxfZmxhZ3MoIUNQQ19TS0JfQ0Ioc2tiKS0+Z2Jf
bWVzc2FnZSwNCisJCQkJCQkgICAgICAgY3BjX3NrYl9pc19zZXF1ZW5jZWQoc2tiKSk7DQorfQ0K
Kw0KK3N0YXRpYyB2b2lkIGNwY19wcm90b2NvbF9xdWV1ZV9hY2soc3RydWN0IGNwY19jcG9ydCAq
Y3BvcnQsIHU4IGFjaykNCit7DQorCXN0cnVjdCBnYl9vcGVyYXRpb25fbXNnX2hkciAqZ2JfaGRy
Ow0KKwlzdHJ1Y3Qgc2tfYnVmZiAqc2tiOw0KKw0KKwlza2IgPSBhbGxvY19za2Ioc2l6ZW9mKHN0
cnVjdCBjcGNfaGVhZGVyKSArIHNpemVvZigqZ2JfaGRyKSwgR0ZQX0tFUk5FTCk7DQorCWlmICgh
c2tiKQ0KKwkJcmV0dXJuOw0KKw0KKwlza2JfcmVzZXJ2ZShza2IsIHNpemVvZihzdHJ1Y3QgY3Bj
X2hlYWRlcikpOw0KKw0KKwlnYl9oZHIgPSBza2JfcHV0KHNrYiwgc2l6ZW9mKCpnYl9oZHIpKTsN
CisJbWVtc2V0KGdiX2hkciwgMCwgc2l6ZW9mKCpnYl9oZHIpKTsNCisNCisJLyogSW4gdGhlIENQ
QyBPcGVyYXRpb24gSGVhZGVyLCBvbmx5IHRoZSBzaXplIGFuZCBjcG9ydF9pZCBtYXR0ZXIgZm9y
IEFDS3MuICovDQorCWdiX2hkci0+c2l6ZSA9IGNwdV90b19sZTE2KHNpemVvZigqZ2JfaGRyKSk7
DQorCWNwY19jcG9ydF9wYWNrKGdiX2hkciwgY3BvcnQtPmlkKTsNCisNCisJY3BjX3Byb3RvY29s
X3ByZXBhcmVfaGVhZGVyKHNrYiwgYWNrKTsNCisNCisJY3BjX2hkX3NlbmRfc2tiKGNwb3J0LT5j
cGNfaGQsIHNrYik7DQogfQ0KIA0KIHZvaWQgY3BjX3Byb3RvY29sX29uX2RhdGEoc3RydWN0IGNw
Y19jcG9ydCAqY3BvcnQsIHN0cnVjdCBza19idWZmICpza2IpDQogew0KIAlzdHJ1Y3QgY3BjX2hl
YWRlciAqY3BjX2hkciA9IChzdHJ1Y3QgY3BjX2hlYWRlciAqKXNrYi0+ZGF0YTsNCisJYm9vbCBy
ZXF1aXJlX2FjayA9IGNwY19oZWFkZXJfZ2V0X3JlcV9hY2soY3BjX2hkcik7DQogCXU4IHNlcSA9
IGNwY19oZWFkZXJfZ2V0X3NlcShjcGNfaGRyKTsNCiAJYm9vbCBleHBlY3RlZF9zZXEgPSBmYWxz
ZTsNCisJdTggYWNrOw0KIA0KIAltdXRleF9sb2NrKCZjcG9ydC0+bG9jayk7DQogDQotCWV4cGVj
dGVkX3NlcSA9IHNlcSA9PSBjcG9ydC0+dGNiLmFjazsNCi0JaWYgKGV4cGVjdGVkX3NlcSkNCi0J
CWNwb3J0LT50Y2IuYWNrKys7DQotCWVsc2UNCi0JCWRldl93YXJuX3JhdGVsaW1pdGVkKGNwY19o
ZF9kZXYoY3BvcnQtPmNwY19oZCksDQotCQkJCSAgICAgInVuZXhwZWN0ZWQgc2VxOiAldSwgZXhw
ZWN0ZWQgc2VxOiAldVxuIiwgc2VxLCBjcG9ydC0+dGNiLmFjayk7DQorCWlmIChyZXF1aXJlX2Fj
aykgew0KKwkJZXhwZWN0ZWRfc2VxID0gc2VxID09IGNwb3J0LT50Y2IuYWNrOw0KKwkJaWYgKGV4
cGVjdGVkX3NlcSkNCisJCQljcG9ydC0+dGNiLmFjaysrOw0KKwkJZWxzZQ0KKwkJCWRldl93YXJu
X3JhdGVsaW1pdGVkKGNwY19oZF9kZXYoY3BvcnQtPmNwY19oZCksDQorCQkJCQkgICAgICJ1bmV4
cGVjdGVkIHNlcTogJXUsIGV4cGVjdGVkIHNlcTogJXVcbiIsDQorCQkJCQkgICAgIHNlcSwgY3Bv
cnQtPnRjYi5hY2spOw0KKwl9DQorDQorCWFjayA9IGNwb3J0LT50Y2IuYWNrOw0KIA0KIAltdXRl
eF91bmxvY2soJmNwb3J0LT5sb2NrKTsNCiANCi0JaWYgKGV4cGVjdGVkX3NlcSkgew0KKwkvKiBB
Y2sgbm8gbWF0dGVyIGlmIHRoZSBzZXF1ZW5jZSB3YXMgdmFsaWQgb3Igbm90LCB0byByZXN5bmMg
d2l0aCByZW1vdGUgKi8NCisJaWYgKHJlcXVpcmVfYWNrKQ0KKwkJY3BjX3Byb3RvY29sX3F1ZXVl
X2FjayhjcG9ydCwgYWNrKTsNCisNCisJaWYgKGV4cGVjdGVkX3NlcSAmJiAhY3BjX2hlYWRlcl9p
c19jb250cm9sKGNwY19oZHIpKSB7DQogCQlza2JfcHVsbChza2IsIHNpemVvZigqY3BjX2hkcikp
Ow0KIA0KIAkJZ3JleWJ1c19kYXRhX3JjdmQoY3BvcnQtPmNwY19oZC0+Z2JfaGQsIGNwb3J0LT5p
ZCwgc2tiLT5kYXRhLCBza2ItPmxlbik7DQotLSANCjIuNTIuMA0KDQpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpncmV5YnVzLWRldiBtYWlsaW5nIGxpc3Qg
LS0gZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpUbyB1bnN1YnNjcmliZSBzZW5kIGFuIGVt
YWlsIHRvIGdyZXlidXMtZGV2LWxlYXZlQGxpc3RzLmxpbmFyby5vcmcK
