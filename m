Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A8D1D258A4
	for <lists+greybus-dev@lfdr.de>; Thu, 15 Jan 2026 16:58:49 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 091CC4015F
	for <lists+greybus-dev@lfdr.de>; Thu, 15 Jan 2026 15:58:48 +0000 (UTC)
Received: from mx0b-0024c301.pphosted.com (mx0b-0024c301.pphosted.com [148.163.153.153])
	by lists.linaro.org (Postfix) with ESMTPS id D11AE3F8F4
	for <greybus-dev@lists.linaro.org>; Thu, 15 Jan 2026 15:58:44 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=silabs.com header.s=pps12202023 header.b=wXkkeWIX;
	dkim=pass header.d=silabs.com header.s=selector1 header.b=BIqCb9wK;
	spf=pass (lists.linaro.org: domain of Damien.Riegel@silabs.com designates 148.163.153.153 as permitted sender) smtp.mailfrom=Damien.Riegel@silabs.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1");
	dmarc=pass (policy=reject) header.from=silabs.com
Received: from pps.filterd (m0101742.ppops.net [127.0.0.1])
	by mx0a-0024c301.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60FFlYMq459372;
	Thu, 15 Jan 2026 09:58:35 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps12202023;
	 bh=WXimmYfHxBOk5LEDYhw5NGF1Mr5DqOA7bkYOOJ7DnKM=; b=wXkkeWIXW+J0
	1R44zO+KcrKfxMsKd6glE9YEhHC+pMf5hn854DjMbzHa+vRMZeWz9BupoVIG+beX
	+oLb+Btis//fT0e31TaSS7RZuqO9q0W9W9J/3ONq4Xfjxu5y0vn4ol7PHMAI3Rzc
	Jtoaa5MStAOrrUjk2fx3UnkogP4D46RMy5MiYBx1UnJWff0al4oaV5DsJcaloKYV
	qCxfrClE5CYPw7wY/urWpPdukNP7kvaLLhlf5VhSyRRkGVyEhbpsNzTXZZMLj81Z
	6ElsA6l/pd/6zbVU3ZYd63x9N51Qf0LivaFAWEgTeBlnDNoQUfU91PfSWSpuct/a
	YlecPWtk5w==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11021127.outbound.protection.outlook.com [52.101.52.127])
	by mx0a-0024c301.pphosted.com (PPS) with ESMTPS id 4bq36kr0ut-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 15 Jan 2026 09:58:35 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JT1L4xg26Ax2870sEZdV/XKuTjcrEIIF9j2qGNokikF3RVF0Z91m+nB+yIG/46ZMJ4Vfg+qNUqDs1+WyunCEeuG0FfkOlW1zrlyRbuYYPOJ9N83odzUUV4ieAz6EpnQu5YNV7iIUq2XAHYLcBFCJvBhT8kpq/BC0UelpaFhhGhDQMPWOnb8u4zmTCJr0MIl2z7tQcqrVChk3aiGIkYJdvKo82LLzGBb4X5NbNId3mMTCK5BPXQJDC+ijHhOanohKKBZ6BZ3qdg3kj8uV+cRIoP+s631PEfX247u4r8yOSQyDymJydk25Is0oAqOtWCW8gZUfez4CS+nfGDMRiDcmmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WXimmYfHxBOk5LEDYhw5NGF1Mr5DqOA7bkYOOJ7DnKM=;
 b=m7n+8PEMeWxpI0I5g4ZE8a33SDfNucv2yQU6115bvyG+pZy50y9hYtsKNyv6OeS3T1vespcJBXTaziye898oJxaCA6d5Cr8RgJffDiwKmaa8Y0+/at3rVmLuHMYGUt/Cop8BIO2AyDYxO0BNB2PA68ppbSY7BnJtyirrZ34QiW4M0ye2CzrVwkTpENi9vu4AbwK/B6EnS3dGEsMzLL2rrlkNKCYJzd3ltsAtyAH/5TUikOHPJnnrdAJcI4TElbKbXEVgqpoyEcSrfMKGk79mEW/g8NeHxft4Mx3bB/wkaDGsQa3j49DIsLjB0yU3NJKzYbk7RpEmJ4dyInGYowD5WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silabs.com; dmarc=pass action=none header.from=silabs.com;
 dkim=pass header.d=silabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WXimmYfHxBOk5LEDYhw5NGF1Mr5DqOA7bkYOOJ7DnKM=;
 b=BIqCb9wKyBbVYXrHCzTLBZ5tFpjp51XyBPVzWxC+qsm0wXbRzQ6PZEUr8mpE9amBBVCzNhq+5R4zGikNSUM7/4Eg2hClOW+zqxO9yq9SWTlXpXx3UvD+YRcjLZ3wTOfzBUURfOY2zJLBbjY7hbqt45LDAO3YtjmNTZkPuTQyZbQ=
Received: from DS0PR11MB8205.namprd11.prod.outlook.com (2603:10b6:8:162::17)
 by SA1PR11MB8811.namprd11.prod.outlook.com (2603:10b6:806:467::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Thu, 15 Jan
 2026 15:58:33 +0000
Received: from DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::2de6:bc88:2af7:3583]) by DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::2de6:bc88:2af7:3583%3]) with mapi id 15.20.9520.005; Thu, 15 Jan 2026
 15:58:33 +0000
From: =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
To: greybus-dev@lists.linaro.org, Johan Hovold <johan@kernel.org>,
        Alex Elder <elder@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org
Date: Thu, 15 Jan 2026 10:57:54 -0500
Message-ID: <20260115155808.36102-2-damien.riegel@silabs.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260115155808.36102-1-damien.riegel@silabs.com>
References: <20260115155808.36102-1-damien.riegel@silabs.com>
X-ClientProxiedBy: YQZPR01CA0025.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:86::22) To DS0PR11MB8205.namprd11.prod.outlook.com
 (2603:10b6:8:162::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8205:EE_|SA1PR11MB8811:EE_
X-MS-Office365-Filtering-Correlation-Id: d81f8ba8-bca0-4aef-34f3-08de544eeea0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?RHIyMUh6alVZQ0FNckg0QkdySW94bjloUHBiVlZYN0p5cTJnYlJRR2RuTFFE?=
 =?utf-8?B?STU2SGRMUTJ6NHh4Szh5STlRUGFiVXZ6bWUzSTA0K3p0Y1JVMnlTT2VsTC9m?=
 =?utf-8?B?d1ZiU0xFQXM2aTZDNk5OeTBkYUFJSkhFTkUzTXU5RG9GWTZWazVzRXNwTnRU?=
 =?utf-8?B?cUx6eTJBdGZCK0RVZGgzU1FLdHNFa0FkeXI4S1AwYUlOZE1IYXFoT0F6cE5s?=
 =?utf-8?B?WnF4U2kyRzN5azA4LzhlcWtiK2Y2MVphU252ZExGeHFKb05vbEVWamdSRFF1?=
 =?utf-8?B?U3RnZFk2N003VkhQQys1d005UlRqRUVIQzdmb3N3QzBHRmlxM3ZjM0tSQmFt?=
 =?utf-8?B?N2E0Ty96bHlGcUUySllSVVVEb2wvV21oSkl3YkVvNGVrcVZwbmZ1NEJEdWFr?=
 =?utf-8?B?L1A3TlVuUVB6N3Y3VHRHclFydGdleStOZmlVMkc2VElndVJsOE5wUmhMZjZs?=
 =?utf-8?B?eWtHNWp2TEttTTJXTnFDY2x6R3VpS2h1VG1vSytYd283LzU1WXd3ZzNqN204?=
 =?utf-8?B?WVVoMm5YSnhRMlpDTXB6dlZQY2x6Y0RxS3FrRzV0MCtjNlNnYzB4NnZyeWVT?=
 =?utf-8?B?bzhFSFhZRnZieFpaREQ3VTA2ZnRJbmUrVXh3dEVLampYOWIwdGN6RnB0WHE2?=
 =?utf-8?B?NU8wbzRLZzZEb2paWVRadTJhY2JHWnNkV21rR01PdkVYTTZ2dVpFRUE2L2Ru?=
 =?utf-8?B?UkZwWm9iTU9JdzFRNHpDaWJGeVUwRGlrTkZZQ3U4STQvcVF0MmFTSVZEMnUv?=
 =?utf-8?B?SGp3TUg4aUR2MGUzRnFIdHoyWEhkWlgzaDVuSVZuc2xvd3JzSCtBZC9lVG1a?=
 =?utf-8?B?U1kyY0U2eC9QVlNBVUM1N2MrRFVTaVZuQWRpUUQzeTdYZVA0ZmJadlNYVkFM?=
 =?utf-8?B?WHZSZHZ0SXN5K2k2TmhoTmZWWlpPdUtaYU1DQnU5aXZhaTVOYTUxdzJNaW56?=
 =?utf-8?B?M1JVUlZCcFVndkllSW40L2hrL3k0Q2R3U0VpeXFLYWJJK3huR1Y0aVpLQlNB?=
 =?utf-8?B?V0l3ekE3L1dOU2VJNHJ0RW80ZE4vd3Y0aUNPVndseU4xd0twSTZuL3FYWkFB?=
 =?utf-8?B?Q3hIbDFHdDh5TnluaG01cXl3dXgvQTRmUkV1dGJ2RUZFRHVmV2ZTcXNtRWFH?=
 =?utf-8?B?aFJPeDl5V29BbWx5UCsvSVJUR091YWZoUHY4eXc3ZHBKYnovWHB5Tm9ucjZY?=
 =?utf-8?B?S2hMclc3Wm9FNFdvc3FQSjdKU0hNdTV4K1VIWU9IbHE5Y0lqRzVHQXczWXZW?=
 =?utf-8?B?M2M1amxkeUV1VXZQazZUY1lxRmZxR2dpdGpjS2JVKzF6TDZLMmpUZ0FuQ0tv?=
 =?utf-8?B?MVdBdGROZmdIaFFMT0M1aXNnQTcxeXVoVUMybEY2YzBJL0VxTHRuTGhnY3dE?=
 =?utf-8?B?RG1tVkNGTGNXZldVaUhaQXpjb29QSklvUkg3MkZxSmswTGxYeDRsWCtiWG9H?=
 =?utf-8?B?WitJT0VldzE1YUl3bThpWVczWGlpTDV6R3d3VFB1ekZXc2g3a3dtWFhKLzdB?=
 =?utf-8?B?c2dkUEJYK1BUcHZwMVMrbzJWT3dNYkhxN1hpQno3ZGZidmNUcGxyZUJSQ3lp?=
 =?utf-8?B?R3c0L1FGN0xiUFk3TmpvVlQ1VnJzSGpmeWtGMnR5WStyU255TmhCWjZEMWtt?=
 =?utf-8?B?THRlcUFoVmw1MTBlNkpEQUtvd2MzQXNLSGdoL2d1SkEvY080R05DbnNreUI4?=
 =?utf-8?B?RHFSVDE4ZUJIb2U0cTdBUkxoN3gxN1pQekRsKzJhVE5zM0R0ZGxNOEphWE5B?=
 =?utf-8?B?VklReDQ4YTBoOWhoVk56cU1RekQwdVhUcTN2ei90WlNNRWFmU3M5N1J5dnRN?=
 =?utf-8?B?NGNwb2YrQ0hMMzZEQXgxSEFJSDhrQk5oRTZXa0grU0tCaEkwQ3RnYkE3SmdJ?=
 =?utf-8?B?anZlQjhkNFc1U0RTSjdPY2J5dmRlSVc5Tk1ZTFdlem9lT0lBaGFiOHoyK2hZ?=
 =?utf-8?B?bnpjZlhkMnp0QnpUU1NBbE15amxoUVpRUEpHbnJ1MDVUdTRMREFsbCtWUk1a?=
 =?utf-8?B?UER5MDlDMWU5ZS9BREdGQnhyMGVSMnNWNmVLcTJKVnpYcmF0V3haMW1IZWlx?=
 =?utf-8?B?cTc4c0NyVllVQVFiY0k3M1RTcmNPTFVQTGFXMm1PYTVtTFN6SDF0ci9XakhK?=
 =?utf-8?B?RTZ5eGFhRVZlUmVhek9DZ0owa1ljajl0blpNMCthc240QSs1Yiszek1ETGxG?=
 =?utf-8?Q?UE2VJDgTYDleamxo7/1m1cM=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8205.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?c0NZeVdrUDlVR1N5bldyeXBjaThoSFdXeDFaVU4rczRoYUJVL3Q5NUZwNXVj?=
 =?utf-8?B?Tjl3L3g5amluVXFraGw5aTIwdTVHUVVPeXlGRXZNdUJlajhxVnpoeVpkYjQv?=
 =?utf-8?B?ZjVYVjU1S3phUC9BQmVlbjFEemlhUCswZWFaRWRYcWRqMFhvSWdtbml2T3ht?=
 =?utf-8?B?eUM4SndhdTdsTXV0aDlXMzJOUzk2cXIrMHFJOGlZNUx6YzlrRXJqMlZGS0hE?=
 =?utf-8?B?YUxTNWY2WHVuTmd1NUdURG9hcEYxMWpnY2dvR0ZQRFFZQTQwbkcyZmtIVXF2?=
 =?utf-8?B?bDd1eHdTbmpXVDc0aURaMnVqWHo0a0k0eDJnNk1vZUx1K01FZXE2RjNOUUtr?=
 =?utf-8?B?QkxRUEZJZjVkTmJ4SnVOa2tveStJZ2xuMERUUnhNY0ZxMitQVXpRb2cranc5?=
 =?utf-8?B?NDA2ejNlWWtaOVUya3RUVldERHZOakZNQ2h2MFhEOStnQW8rcytBS2pUdUxq?=
 =?utf-8?B?Z2RVY040eFBjcVRLQjM5dWJESlh4ZjdvQ3Bva2R4ek5MY1dGc0hsa2dyN3RN?=
 =?utf-8?B?cGZrYjJsM2pWUEdJSDVZbU9lNzZIaHhVVVIvb2tkL2RxL3cvc1c0Qi9HZXNz?=
 =?utf-8?B?OVgvVEhwVzdyclMzdy9pdXVyNkNFYXNLRlh0L2UyTlZUM1VkNXhQVm0wWjBF?=
 =?utf-8?B?aUp1eVc1d0xCa3A0Y2NrelcraGlCcVlnUDZpL3JzbHFGRE1IYkNkZmREV0ZW?=
 =?utf-8?B?K3dqbmg3dDc2YzdEdkJSNmJuM2Q0T1MzOFpKRFFNZ0ZXZURQTVoza1NyS3BT?=
 =?utf-8?B?VHBQbjVac0p0L2YwSnV0ajhON2NKMTkvTFNzckhrSldxUk8vMGxLVlc4VWpz?=
 =?utf-8?B?dTJ3T1BiSkhod09xV3FSR0trM0FqdUJtWmhCcEkyUnhKVlNRQWNTRW11MTN5?=
 =?utf-8?B?Z2d6dnJBYVVXeitXdDQ0NWdFYnhYV0JpRnVGemg0eU15QmJyYUJQcVB6OXBY?=
 =?utf-8?B?bEN2T2lKa1k2YlE4UkQvYXlZenVTYlE1VG5nNjllZGwwY2FRZDl0VFBnM1di?=
 =?utf-8?B?M1Z3YU43akVNZ0pBN21GZjJEZzIvZEhtUnNBR2YwYndmd3JpbUNoQ3RiOE9n?=
 =?utf-8?B?K2tnRm42eW44N0JvbmxzaGtnQTd0NTE3Y0NyRkovZWg1bG1DZUtrWGViL0E1?=
 =?utf-8?B?aVdWdXUvUGhYcnoySWgxemVCZkNSQS9FdE9TYVVYQTdaZ1Z6STN2aWtzejhG?=
 =?utf-8?B?YXBoTmoyOUp2akVMOFYwZHZ6LzFpSFFYWWgwMm5PQjM4WEh5SmtWOFpHWEw5?=
 =?utf-8?B?QVBjd0ZjTEdXNEdqMjVzOFFKaExTZ1RrRit0cm95alQ5QXdPUmswaXkwalUw?=
 =?utf-8?B?L0dGLzQrSENadEFacVdKeTFzMllFTDExVTEzUVNDclRxazB3RmhnT0N1VXlw?=
 =?utf-8?B?Sk9nQjltWU8wVjBzVU1NeXR4SmV6d29jMTFJZ1UzMG5qOGUrTG82b29pcSs2?=
 =?utf-8?B?RFlIMGRKWkZzU1FXeDlHZDZrOVBselk1U0tBY1FJR0dmeS9UNGlNNnZJZWxJ?=
 =?utf-8?B?SWVPd2ZEV0g3eUhjenBVbEJRZTRFamJIWXIyMjdqN2dYUWhRbDI3TVE3ak1r?=
 =?utf-8?B?anBwNFJPT3BRZis2Vk5NVEI3STdzOXNjaXV4Qi9RcVh4QlY3cmVseGZDN0h5?=
 =?utf-8?B?ZFdTRzlDcXArMGZqNEJxWEhJNy9ncmFkbVpLRFRYc012QVJtRjU2L3p1Y1Bp?=
 =?utf-8?B?NDNwUWVObXR1cmI2dVZzR0QzVU10UTd2RjlnRGlaTmRnWVF0eG54VmlnR0RZ?=
 =?utf-8?B?MEtOWFJBMkU3NXZxUmt4Zy9oTFczVDRQTWRLR3R2VWhPajlwRGxKcHV3NkJQ?=
 =?utf-8?B?UFhSZDBDQk1MQ1huWGhTTDd0V2ZyZURBUzFFdzRZK2pSZ1pOMzBVSkU1RlNt?=
 =?utf-8?B?cEg4Q001NEpiZFBsZzF4TzNNZVR2QVUrOGVHRkt0ejhyWWZXY3k4ZGMxVG1J?=
 =?utf-8?B?dTZ6VjFDazd3SFVXMFlQVUJtVElEOUFKcWl3eS9UN2FPSU5Mb0ppTjlNa2d5?=
 =?utf-8?B?VkRlSzVRRjQ1T0NrWWlzTURWK3BIbFNhdlE4WjZoZDMzSjQ2NEQ1cWNjNWFx?=
 =?utf-8?B?akxROVdlUnBNSWxaazQ1cFAramZLM0NvREl4ekh5ZytnREF1RjZtSjQxaXZX?=
 =?utf-8?B?Z3d0VnIyNGxrRkNmWW9iU20wdXBPbDA1VmhSd0xMNEFhUEY3RzFvdkN6eUxq?=
 =?utf-8?B?MUN5OEJQYk1CRjQyc3JLUDI2NEtaR2NLZFBrVndZRmR5OHk2dUJqQi9Wd3pu?=
 =?utf-8?B?SStQM2Ywc3dDMW9WenVrQm1WUHNqV2E1aEZPWGpYL2poV1Jibk1Fckt3ck8r?=
 =?utf-8?B?OG1lZmhzYTczSWcxdS9XTGxWYitGVm5QdWxncW1BNHVpcVd6S2c1dz09?=
X-OriginatorOrg: silabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d81f8ba8-bca0-4aef-34f3-08de544eeea0
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8205.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 15:58:32.2466
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 54dbd822-5231-4b20-944d-6f4abcd541fb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6nwIHPQDdYvEVlimkpc7mM83U2DvJEZE9Arf9CqR0OZH/FEcm9JGN4Spnh7fUZOTqza/+7VMNZclbA+POCkdQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8811
X-Proofpoint-GUID: tfXpgaT91aqdRptm0cUNnDXeTf6hE9cM
X-Authority-Analysis: v=2.4 cv=M6BA6iws c=1 sm=1 tr=0 ts=69690eab cx=c_pps
 a=+Bba5nuaRI/XgWxKvljhhQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=M51BFTxLslgA:10
 a=i1IsUcr2s-wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=2AEO0YjSAAAA:8 a=VwQbUJbxAAAA:8
 a=NifzlKhAlxbwiDc_K4AA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDEyMSBTYWx0ZWRfX757O2taVXnp2
 cM1N8AAGqvGU442jhRCLJsomPtNNDGl9jK8+PYo3yGbmnlJnhnQfWBIJSpxGKaRrc+YManY1az4
 PF3LM47IwslCcAELVszdpF4ZZ0OSgmgMG7wz+oBsh4WayHs9T5vPTWjLHesLdVjgbcw0lpF/hIr
 EDOSFco8XHxyZf2R59sFMRlrF2OjhiHRAOf3/vurEjNKzLOtdBS2FsHq7AcC1XzqepDqkKdX3fo
 BcetrK9ugUSw8q4GeQ/rnMLSTYzH7CClsh/21qJleli4O6NJOxB6TSiDrmM8eIIYh8ClL+IVs94
 YFgSq9NYV1oXwgyqGMfaZBUGr9Q+kg1hYOzk/XobA+/lVZMfBcZ2rbUL0N3seiYbQZKE+Io30Zi
 JYrGz1a++HdyI9/oVCd3FTBE07PKNwIVakdrkgxQ0R4ttY0BVqNhhn+9y+8kr6sm0c2qiTfz/Dw
 0pVjszIRbS9jDd3kHzw==
X-Proofpoint-ORIG-GUID: tfXpgaT91aqdRptm0cUNnDXeTf6hE9cM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_05,2026-01-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 spamscore=0 adultscore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601150121
X-Rspamd-Queue-Id: D11AE3F8F4
X-Spamd-Bar: ----
X-Spamd-Result: default: False [-4.00 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[silabs.com,reject];
	R_DKIM_ALLOW(-0.20)[silabs.com:s=pps12202023,silabs.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:148.163.153.153];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:22843, ipnet:148.163.152.0/22, country:US];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	DKIM_TRACE(0.00)[silabs.com:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: MGBQX5KBFVFRMTBGC57KID2UECBUW3J5
X-Message-ID-Hash: MGBQX5KBFVFRMTBGC57KID2UECBUW3J5
X-MailFrom: Damien.Riegel@silabs.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Silicon Labs Kernel Team <linux-devel@silabs.com>, =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v2 01/14] greybus: cpc: add minimal CPC Host Device infrastructure
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/MGBQX5KBFVFRMTBGC57KID2UECBUW3J5/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

QXMgdGhlIGZpcnN0IHN0ZXAgZm9yIGFkZGluZyBDUEMgc3VwcG9ydCB3aXRoIEdyZXlidXMsIGFk
ZCBhIHZlcnkNCm1pbmltYWwgbW9kdWxlIGZvciBDUEMgSG9zdCBEZXZpY2VzLiBGb3Igbm93LCB0
aGlzIG1vZHVsZSBvbmx5IHByb3hpZXMNCmNhbGxzIHRvIHRoZSBHcmV5YnVzIEhvc3QgRGV2aWNl
IEFQSSBhbmQgZG9lcyBub3RoaW5nIHVzZWZ1bCwgYnV0DQpmdXJ0aGVyIGNvbW1pdHMgd2lsbCB1
c2UgdGhpcyBiYXNlIHRvIGFkZCBmZWF0dXJlcy4NCg0KU2lnbmVkLW9mZi1ieTogRGFtaWVuIFJp
w6lnZWwgPGRhbWllbi5yaWVnZWxAc2lsYWJzLmNvbT4NCi0tLQ0KIE1BSU5UQUlORVJTICAgICAg
ICAgICAgICAgICAgfCAgNiArKysNCiBkcml2ZXJzL2dyZXlidXMvS2NvbmZpZyAgICAgIHwgIDIg
Kw0KIGRyaXZlcnMvZ3JleWJ1cy9NYWtlZmlsZSAgICAgfCAgMiArDQogZHJpdmVycy9ncmV5YnVz
L2NwYy9LY29uZmlnICB8IDEwICsrKysrDQogZHJpdmVycy9ncmV5YnVzL2NwYy9NYWtlZmlsZSB8
ICA2ICsrKw0KIGRyaXZlcnMvZ3JleWJ1cy9jcGMvaG9zdC5jICAgfCA4NCArKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysNCiBkcml2ZXJzL2dyZXlidXMvY3BjL2hvc3QuaCAgIHwg
NDAgKysrKysrKysrKysrKysrKysNCiA3IGZpbGVzIGNoYW5nZWQsIDE1MCBpbnNlcnRpb25zKCsp
DQogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3JleWJ1cy9jcGMvS2NvbmZpZw0KIGNyZWF0
ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dyZXlidXMvY3BjL01ha2VmaWxlDQogY3JlYXRlIG1vZGUg
MTAwNjQ0IGRyaXZlcnMvZ3JleWJ1cy9jcGMvaG9zdC5jDQogY3JlYXRlIG1vZGUgMTAwNjQ0IGRy
aXZlcnMvZ3JleWJ1cy9jcGMvaG9zdC5oDQoNCmRpZmYgLS1naXQgYS9NQUlOVEFJTkVSUyBiL01B
SU5UQUlORVJTDQppbmRleCA2ZDFkZTgyZTZkYy4uNTZkYWY5ZWMzMTAgMTAwNjQ0DQotLS0gYS9N
QUlOVEFJTkVSUw0KKysrIGIvTUFJTlRBSU5FUlMNCkBAIC0xMDc3NCw2ICsxMDc3NCwxMiBAQCBT
OglNYWludGFpbmVkDQogRjoJRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL25ldC90
aSxjYzEzNTJwNy55YW1sDQogRjoJZHJpdmVycy9ncmV5YnVzL2diLWJlYWdsZXBsYXkuYw0KIA0K
K0dSRVlCVVMgQ1BDIERSSVZFUlMNCitNOglEYW1pZW4gUmnDqWdlbCA8ZGFtaWVuLnJpZWdlbEBz
aWxhYnMuY29tPg0KK1I6CVNpbGljb24gTGFicyBLZXJuZWwgVGVhbSA8bGludXgtZGV2ZWxAc2ls
YWJzLmNvbT4NCitTOglTdXBwb3J0ZWQNCitGOglkcml2ZXJzL2dyZXlidXMvY3BjLyoNCisNCiBH
UkVZQlVTIFNVQlNZU1RFTQ0KIE06CUpvaGFuIEhvdm9sZCA8am9oYW5Aa2VybmVsLm9yZz4NCiBN
OglBbGV4IEVsZGVyIDxlbGRlckBrZXJuZWwub3JnPg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3Jl
eWJ1cy9LY29uZmlnIGIvZHJpdmVycy9ncmV5YnVzL0tjb25maWcNCmluZGV4IGMzZjA1NmQyOGIw
Li41NjVhMGZkY2IyYyAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3JleWJ1cy9LY29uZmlnDQorKysg
Yi9kcml2ZXJzL2dyZXlidXMvS2NvbmZpZw0KQEAgLTMwLDYgKzMwLDggQEAgY29uZmlnIEdSRVlC
VVNfQkVBR0xFUExBWQ0KIAkgIFRvIGNvbXBpbGUgdGhpcyBjb2RlIGFzIGEgbW9kdWxlLCBjaG9z
ZSBNIGhlcmU6IHRoZSBtb2R1bGUNCiAJICB3aWxsIGJlIGNhbGxlZCBnYi1iZWFnbGVwbGF5Lmtv
DQogDQorc291cmNlICJkcml2ZXJzL2dyZXlidXMvY3BjL0tjb25maWciDQorDQogY29uZmlnIEdS
RVlCVVNfRVMyDQogCXRyaXN0YXRlICJHcmV5YnVzIEVTMyBVU0IgaG9zdCBjb250cm9sbGVyIg0K
IAlkZXBlbmRzIG9uIFVTQg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3JleWJ1cy9NYWtlZmlsZSBi
L2RyaXZlcnMvZ3JleWJ1cy9NYWtlZmlsZQ0KaW5kZXggZDk4NmU5NGY4ODkuLjkyZmUxZDYyNjkx
IDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncmV5YnVzL01ha2VmaWxlDQorKysgYi9kcml2ZXJzL2dy
ZXlidXMvTWFrZWZpbGUNCkBAIC0yMSw2ICsyMSw4IEBAIGNjZmxhZ3MteSArPSAtSSQoc3JjKQ0K
IG9iai0kKENPTkZJR19HUkVZQlVTX0JFQUdMRVBMQVkpCSs9IGdiLWJlYWdsZXBsYXkubw0KIA0K
ICMgR3JleWJ1cyBIb3N0IGNvbnRyb2xsZXIgZHJpdmVycw0KK29iai0kKENPTkZJR19HUkVZQlVT
X0NQQykJKz0gY3BjLw0KKw0KIGdiLWVzMi15IDo9IGVzMi5vDQogDQogb2JqLSQoQ09ORklHX0dS
RVlCVVNfRVMyKQkrPSBnYi1lczIubw0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3JleWJ1cy9jcGMv
S2NvbmZpZyBiL2RyaXZlcnMvZ3JleWJ1cy9jcGMvS2NvbmZpZw0KbmV3IGZpbGUgbW9kZSAxMDA2
NDQNCmluZGV4IDAwMDAwMDAwMDAwLi5hYjk2ZmVkZDBkZQ0KLS0tIC9kZXYvbnVsbA0KKysrIGIv
ZHJpdmVycy9ncmV5YnVzL2NwYy9LY29uZmlnDQpAQCAtMCwwICsxLDEwIEBADQorIyBTUERYLUxp
Y2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMA0KKw0KK2NvbmZpZyBHUkVZQlVTX0NQQw0KKwl0cmlz
dGF0ZSAiR3JleWJ1cyBDUEMgZHJpdmVyIg0KKwloZWxwDQorCSAgU2VsZWN0IHRoaXMgb3B0aW9u
IGlmIHlvdSBoYXZlIGEgU2lsaWNvbiBMYWJzIGRldmljZSB0aGF0IGFjdHMgYXMgYQ0KKwkgIEdy
ZXlidXMgU1ZDLg0KKw0KKwkgIFRvIGNvbXBpbGUgdGhpcyBjb2RlIGFzIGEgbW9kdWxlLCBjaG9z
ZSBNIGhlcmU6IHRoZSBtb2R1bGUgd2lsbCBiZQ0KKwkgIGNhbGxlZCBnYi1jcGMua28NCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dyZXlidXMvY3BjL01ha2VmaWxlIGIvZHJpdmVycy9ncmV5YnVzL2Nw
Yy9NYWtlZmlsZQ0KbmV3IGZpbGUgbW9kZSAxMDA2NDQNCmluZGV4IDAwMDAwMDAwMDAwLi40OTA5
ODJhMGZmNQ0KLS0tIC9kZXYvbnVsbA0KKysrIGIvZHJpdmVycy9ncmV5YnVzL2NwYy9NYWtlZmls
ZQ0KQEAgLTAsMCArMSw2IEBADQorIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMA0K
Kw0KK2diLWNwYy15IDo9IGhvc3Qubw0KKw0KKyMgQ1BDIGNvcmUNCitvYmotJChDT05GSUdfR1JF
WUJVU19DUEMpCSs9IGdiLWNwYy5vDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncmV5YnVzL2NwYy9o
b3N0LmMgYi9kcml2ZXJzL2dyZXlidXMvY3BjL2hvc3QuYw0KbmV3IGZpbGUgbW9kZSAxMDA2NDQN
CmluZGV4IDAwMDAwMDAwMDAwLi44MDUxNjUxN2ZmNg0KLS0tIC9kZXYvbnVsbA0KKysrIGIvZHJp
dmVycy9ncmV5YnVzL2NwYy9ob3N0LmMNCkBAIC0wLDAgKzEsODQgQEANCisvLyBTUERYLUxpY2Vu
c2UtSWRlbnRpZmllcjogR1BMLTIuMA0KKy8qDQorICogQ29weXJpZ2h0IChjKSAyMDI1LCBTaWxp
Y29uIExhYm9yYXRvcmllcywgSW5jLg0KKyAqLw0KKw0KKyNpbmNsdWRlIDxsaW51eC9lcnIuaD4N
CisjaW5jbHVkZSA8bGludXgvZ3JleWJ1cy5oPg0KKyNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4N
CisNCisjaW5jbHVkZSAiaG9zdC5oIg0KKw0KK3N0YXRpYyBzdHJ1Y3QgY3BjX2hvc3RfZGV2aWNl
ICpnYl9oZF90b19jcGNfaGQoc3RydWN0IGdiX2hvc3RfZGV2aWNlICpoZCkNCit7DQorCXJldHVy
biAoc3RydWN0IGNwY19ob3N0X2RldmljZSAqKSZoZC0+aGRfcHJpdjsNCit9DQorDQorc3RhdGlj
IGludCBjcGNfZ2JfbWVzc2FnZV9zZW5kKHN0cnVjdCBnYl9ob3N0X2RldmljZSAqZ2JfaGQsIHUx
NiBjcG9ydF9pZCwNCisJCQkgICAgICAgc3RydWN0IGdiX21lc3NhZ2UgKm1lc3NhZ2UsIGdmcF90
IGdmcF9tYXNrKQ0KK3sNCisJc3RydWN0IGNwY19ob3N0X2RldmljZSAqY3BjX2hkID0gZ2JfaGRf
dG9fY3BjX2hkKGdiX2hkKTsNCisNCisJcmV0dXJuIGNwY19oZC0+ZHJpdmVyLT5tZXNzYWdlX3Nl
bmQoY3BjX2hkLCBjcG9ydF9pZCwgbWVzc2FnZSwgZ2ZwX21hc2spOw0KK30NCisNCitzdGF0aWMg
dm9pZCBjcGNfZ2JfbWVzc2FnZV9jYW5jZWwoc3RydWN0IGdiX21lc3NhZ2UgKm1lc3NhZ2UpDQor
ew0KKwkvKiBOb3QgaW1wbGVtZW50ZWQgKi8NCit9DQorDQorc3RhdGljIHN0cnVjdCBnYl9oZF9k
cml2ZXIgY3BjX2diX2RyaXZlciA9IHsNCisJLmhkX3ByaXZfc2l6ZSA9IHNpemVvZihzdHJ1Y3Qg
Y3BjX2hvc3RfZGV2aWNlKSwNCisJLm1lc3NhZ2Vfc2VuZCA9IGNwY19nYl9tZXNzYWdlX3NlbmQs
DQorCS5tZXNzYWdlX2NhbmNlbCA9IGNwY19nYl9tZXNzYWdlX2NhbmNlbCwNCit9Ow0KKw0KK3N0
cnVjdCBjcGNfaG9zdF9kZXZpY2UgKmNwY19oZF9jcmVhdGUoc3RydWN0IGNwY19oZF9kcml2ZXIg
KmRyaXZlciwgc3RydWN0IGRldmljZSAqcGFyZW50KQ0KK3sNCisJc3RydWN0IGNwY19ob3N0X2Rl
dmljZSAqY3BjX2hkOw0KKwlzdHJ1Y3QgZ2JfaG9zdF9kZXZpY2UgKmhkOw0KKw0KKwlpZiAoKCFk
cml2ZXItPm1lc3NhZ2Vfc2VuZCkgfHwgKCFkcml2ZXItPm1lc3NhZ2VfY2FuY2VsKSkgew0KKwkJ
ZGV2X2VycihwYXJlbnQsICJtaXNzaW5nIG1hbmRhdG9yeSBjYWxsYmFja3NcbiIpOw0KKwkJcmV0
dXJuIEVSUl9QVFIoLUVJTlZBTCk7DQorCX0NCisNCisJaGQgPSBnYl9oZF9jcmVhdGUoJmNwY19n
Yl9kcml2ZXIsIHBhcmVudCwgR0JfQ1BDX01TR19TSVpFX01BWCwgR0JfQ1BDX05VTV9DUE9SVFMp
Ow0KKwlpZiAoSVNfRVJSKGhkKSkNCisJCXJldHVybiAoc3RydWN0IGNwY19ob3N0X2RldmljZSAq
KWhkOw0KKw0KKwljcGNfaGQgPSBnYl9oZF90b19jcGNfaGQoaGQpOw0KKwljcGNfaGQtPmdiX2hk
ID0gaGQ7DQorCWNwY19oZC0+ZHJpdmVyID0gZHJpdmVyOw0KKw0KKwlyZXR1cm4gY3BjX2hkOw0K
K30NCitFWFBPUlRfU1lNQk9MX0dQTChjcGNfaGRfY3JlYXRlKTsNCisNCitpbnQgY3BjX2hkX2Fk
ZChzdHJ1Y3QgY3BjX2hvc3RfZGV2aWNlICpjcGNfaGQpDQorew0KKwlyZXR1cm4gZ2JfaGRfYWRk
KGNwY19oZC0+Z2JfaGQpOw0KK30NCitFWFBPUlRfU1lNQk9MX0dQTChjcGNfaGRfYWRkKTsNCisN
Cit2b2lkIGNwY19oZF9wdXQoc3RydWN0IGNwY19ob3N0X2RldmljZSAqY3BjX2hkKQ0KK3sNCisJ
cmV0dXJuIGdiX2hkX3B1dChjcGNfaGQtPmdiX2hkKTsNCit9DQorRVhQT1JUX1NZTUJPTF9HUEwo
Y3BjX2hkX3B1dCk7DQorDQordm9pZCBjcGNfaGRfZGVsKHN0cnVjdCBjcGNfaG9zdF9kZXZpY2Ug
KmNwY19oZCkNCit7DQorCXJldHVybiBnYl9oZF9kZWwoY3BjX2hkLT5nYl9oZCk7DQorfQ0KK0VY
UE9SVF9TWU1CT0xfR1BMKGNwY19oZF9kZWwpOw0KKw0KK3ZvaWQgY3BjX2hkX3JjdmQoc3RydWN0
IGNwY19ob3N0X2RldmljZSAqY3BjX2hkLCB1MTYgY3BvcnRfaWQsIHU4ICpkYXRhLCBzaXplX3Qg
bGVuZ3RoKQ0KK3sNCisJZ3JleWJ1c19kYXRhX3JjdmQoY3BjX2hkLT5nYl9oZCwgY3BvcnRfaWQs
IGRhdGEsIGxlbmd0aCk7DQorfQ0KK0VYUE9SVF9TWU1CT0xfR1BMKGNwY19oZF9yY3ZkKTsNCisN
CitNT0RVTEVfREVTQ1JJUFRJT04oIkdyZXlidXMgb3ZlciBDUEMiKTsNCitNT0RVTEVfTElDRU5T
RSgiR1BMIik7DQorTU9EVUxFX0FVVEhPUigiU2lsaWNvbiBMYWJvcmF0b3JpZXMsIEluYy4iKTsN
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dyZXlidXMvY3BjL2hvc3QuaCBiL2RyaXZlcnMvZ3JleWJ1
cy9jcGMvaG9zdC5oDQpuZXcgZmlsZSBtb2RlIDEwMDY0NA0KaW5kZXggMDAwMDAwMDAwMDAuLmY1
NWZlYjMwM2Y0DQotLS0gL2Rldi9udWxsDQorKysgYi9kcml2ZXJzL2dyZXlidXMvY3BjL2hvc3Qu
aA0KQEAgLTAsMCArMSw0MCBAQA0KKy8qIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4w
ICovDQorLyoNCisgKiBDb3B5cmlnaHQgKGMpIDIwMjUsIFNpbGljb24gTGFib3JhdG9yaWVzLCBJ
bmMuDQorICovDQorDQorI2lmbmRlZiBfX0NQQ19IT1NUX0gNCisjZGVmaW5lIF9fQ1BDX0hPU1Rf
SA0KKw0KKyNpbmNsdWRlIDxsaW51eC9kZXZpY2UuaD4NCisjaW5jbHVkZSA8bGludXgvZ3JleWJ1
cy5oPg0KKyNpbmNsdWRlIDxsaW51eC90eXBlcy5oPg0KKw0KKyNkZWZpbmUgR0JfQ1BDX01TR19T
SVpFX01BWCA0MDk2DQorI2RlZmluZSBHQl9DUENfTlVNX0NQT1JUUyA4DQorDQorc3RydWN0IGNw
Y19ob3N0X2RldmljZTsNCisNCitzdHJ1Y3QgY3BjX2hkX2RyaXZlciB7DQorCWludCAoKm1lc3Nh
Z2Vfc2VuZCkoc3RydWN0IGNwY19ob3N0X2RldmljZSAqaGQsIHUxNiBkZXN0X2Nwb3J0X2lkLA0K
KwkJCSAgICBzdHJ1Y3QgZ2JfbWVzc2FnZSAqbWVzc2FnZSwgZ2ZwX3QgZ2ZwX21hc2spOw0KKwl2
b2lkICgqbWVzc2FnZV9jYW5jZWwpKHN0cnVjdCBnYl9tZXNzYWdlICptZXNzYWdlKTsNCit9Ow0K
Kw0KKy8qKg0KKyAqIHN0cnVjdCBjcGNfaG9zdF9kZXZpY2UgLSBDUEMgaG9zdCBkZXZpY2UuDQor
ICogQGdiX2hkOiBwb2ludGVyIHRvIEdyZXlidXMgSG9zdCBEZXZpY2UgdGhpcyBkZXZpY2UgYmVs
b25ncyB0by4NCisgKiBAZHJpdmVyOiBkcml2ZXIgb3BlcmF0aW9ucy4NCisgKi8NCitzdHJ1Y3Qg
Y3BjX2hvc3RfZGV2aWNlIHsNCisJc3RydWN0IGdiX2hvc3RfZGV2aWNlICpnYl9oZDsNCisJY29u
c3Qgc3RydWN0IGNwY19oZF9kcml2ZXIgKmRyaXZlcjsNCit9Ow0KKw0KK3N0cnVjdCBjcGNfaG9z
dF9kZXZpY2UgKmNwY19oZF9jcmVhdGUoc3RydWN0IGNwY19oZF9kcml2ZXIgKmRyaXZlciwgc3Ry
dWN0IGRldmljZSAqcGFyZW50KTsNCitpbnQgY3BjX2hkX2FkZChzdHJ1Y3QgY3BjX2hvc3RfZGV2
aWNlICpjcGNfaGQpOw0KK3ZvaWQgY3BjX2hkX3B1dChzdHJ1Y3QgY3BjX2hvc3RfZGV2aWNlICpj
cGNfaGQpOw0KK3ZvaWQgY3BjX2hkX2RlbChzdHJ1Y3QgY3BjX2hvc3RfZGV2aWNlICpjcGNfaGQp
Ow0KK3ZvaWQgY3BjX2hkX3JjdmQoc3RydWN0IGNwY19ob3N0X2RldmljZSAqY3BjX2hkLCB1MTYg
Y3BvcnRfaWQsIHU4ICpkYXRhLCBzaXplX3QgbGVuZ3RoKTsNCisNCisjZW5kaWYNCi0tIA0KMi41
Mi4wDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmdy
ZXlidXMtZGV2IG1haWxpbmcgbGlzdCAtLSBncmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3JnClRv
IHVuc3Vic2NyaWJlIHNlbmQgYW4gZW1haWwgdG8gZ3JleWJ1cy1kZXYtbGVhdmVAbGlzdHMubGlu
YXJvLm9yZwo=
