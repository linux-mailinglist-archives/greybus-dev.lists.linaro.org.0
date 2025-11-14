Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id ADB50C5DC01
	for <lists+greybus-dev@lfdr.de>; Fri, 14 Nov 2025 16:08:33 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id A17823F84A
	for <lists+greybus-dev@lfdr.de>; Fri, 14 Nov 2025 15:08:32 +0000 (UTC)
Received: from mx0a-0024c301.pphosted.com (mx0a-0024c301.pphosted.com [148.163.149.154])
	by lists.linaro.org (Postfix) with ESMTPS id 9A0783F845
	for <greybus-dev@lists.linaro.org>; Fri, 14 Nov 2025 15:08:21 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=silabs.com header.s=pps12202023 header.b=VIclOvS5;
	dkim=pass header.d=silabs.com header.s=selector1 header.b=MAFKaDpy;
	dmarc=pass (policy=reject) header.from=silabs.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1");
	spf=pass (lists.linaro.org: domain of Damien.Riegel@silabs.com designates 148.163.149.154 as permitted sender) smtp.mailfrom=Damien.Riegel@silabs.com
Received: from pps.filterd (m0101743.ppops.net [127.0.0.1])
	by mx0a-0024c301.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AE9uiJY2132830;
	Fri, 14 Nov 2025 09:08:10 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps12202023;
	 bh=rcD16d09g6Ybw8axric/7jOIu/Wn3wWxsvgHlW/Ii2A=; b=VIclOvS5xFUX
	tgLBZED4zy50/gmIhXrsTpiE0H4sFYiC9qkksKc1pRwZ05Uu5PHqYwWkK9/Mz2/w
	KqXuzfezD0LxK/f4gNus2582bpb9qKltPpvwy4WDZRlrdfq3FwJBn23oL4Cg7bhC
	wIfxRkz9o5ie+gjFgbx+VUwP/9Uu2QHBK3SDVXhND+dVT10r/WmEXKf4xkgedfIE
	uYu0xG05Juk4tTCL/9HP+usSOYAfz084UCf67eLT+5NiYOilKLUtTzaFTEfCB5XO
	fn/zNTt9x9CqBqI3yPP0aMDz6YxWEpJGCpsEI7V2YkDeUPDto3+bzPaGD4KQu/lG
	PXXrHmZnYg==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11021143.outbound.protection.outlook.com [52.101.62.143])
	by mx0a-0024c301.pphosted.com (PPS) with ESMTPS id 4ae285rk08-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 14 Nov 2025 09:08:10 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MEMgryjAXwYFJVACjDW4vfWMDPFrv5IvFLXSEppOwGXdI9dIATvtWWGSLUn6UyXzZp2FD5ceuMjWRACHwjCWKKEr15FgOkaSlC358/NBLsRkbBRRPn394vHac+VpYkeDm0AdYBd2HWlV5Q5kPbgNpTEvsv0TANsVkJzIVtpgRJTtDM1EFdxG8T44evFnRwB22xEa1Hzgzzb2JAwpFez3sOEjSyZDqyuLkbEZu4EuurPr1/xJFUXjQjoW9N9K0ULLZMvNzBRI30nga2f5ishCi8LNkyuO0cAn9Q/1qUDo63a+a1MUJgc2yk/yQr2KQK+BQed7jQ2bgzO3af1kLzgpGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rcD16d09g6Ybw8axric/7jOIu/Wn3wWxsvgHlW/Ii2A=;
 b=VLes3k7KjgM1h3A1d9HjbPp/cnhRFVC3HoUn92zC0ND3hp3g5s5EI/qS3BmHyhthYKy/y76SV8u0nF1U6VHNJN29Tzk/JH3xvncSgB1Iisom9F4kEbWW3Fd2TaNzsOCdL+x2s9VBKrsdbxGsb8VrOwgMUA+WpBzztOtFy7jvCIxXF5EnkV/eM7CLfCtGcgUOKMKRSFU2QJs/6zxo6k90RR37Ak0kpS6CHwRdwp5tw1jGPSGIcFYRtg2l20nIFEVTzV3rDxbkQj/8LrjISpVkx9kEF23G9XlXEFlN1nQHBbka5/6Vs4LqtXoOp5rAhzED3dDhlXXb3RawksmwuppZWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silabs.com; dmarc=pass action=none header.from=silabs.com;
 dkim=pass header.d=silabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rcD16d09g6Ybw8axric/7jOIu/Wn3wWxsvgHlW/Ii2A=;
 b=MAFKaDpyQVBkyKmkF+kINTDD23b/3TNcfEcOkJT7SEy8qBxdMN1/Qpjca/TeDzPTa3tmxFqn5N8J+Ip5M5pk6eRUofKCuruMbeOB5q6avmqVOhXhinmkqS+IeUwwf2VZT7zonOYnbUuI3T40s86ntFrC5zVMm9HK7LazfGu7bFY=
Received: from DS0PR11MB8205.namprd11.prod.outlook.com (2603:10b6:8:162::17)
 by MW4PR11MB7005.namprd11.prod.outlook.com (2603:10b6:303:22e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.18; Fri, 14 Nov
 2025 15:08:05 +0000
Received: from DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::c508:9b04:3351:524a]) by DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::c508:9b04:3351:524a%5]) with mapi id 15.20.9320.018; Fri, 14 Nov 2025
 15:08:05 +0000
From: =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
To: greybus-dev@lists.linaro.org, Johan Hovold <johan@kernel.org>,
        Alex Elder <elder@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org
Date: Fri, 14 Nov 2025 10:07:27 -0500
Message-ID: <20251114150738.32426-2-damien.riegel@silabs.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251114150738.32426-1-damien.riegel@silabs.com>
References: <20251114150738.32426-1-damien.riegel@silabs.com>
X-ClientProxiedBy: MA5P287CA0046.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:175::12) To DS0PR11MB8205.namprd11.prod.outlook.com
 (2603:10b6:8:162::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8205:EE_|MW4PR11MB7005:EE_
X-MS-Office365-Filtering-Correlation-Id: a02ad09d-4981-41b3-9f0a-08de238f9cfb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|366016|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Wi9Bamh1NVYyUk1jaFpDem42K3RzMStFT0sxaCs2ODc2MFlEL2R4T1ZpQUZ3?=
 =?utf-8?B?aTVOWFU2dEhjbytXWFFHNTJYL0dIOEptRStBWmRORzl0dGpkRzFLMjEyVXlz?=
 =?utf-8?B?VHNqNjRDWVlreDM1bFM5OFFreWZXaFY1eVlERjUvWXFqQmVPK0hhaG9xVjcw?=
 =?utf-8?B?VGd2ZXBEQ0c0NW1FY3NhaGFPYXlIR0tnNGV6dTVYOFU2c0NKWXQzTG1qVUU1?=
 =?utf-8?B?RldqUnBtMGNSVVhEMUltSDVodnRjVmFzWlhRVTcySUtWcVRiM1dDcXFxQ0Vi?=
 =?utf-8?B?TGZnZVM2U3VqZGY5MC82U2oxU1RpTThmRlpyN3ZERS9YQmpuZU5SM2hzY3JI?=
 =?utf-8?B?RlYzQjZPSEVXempLejdkeFk2akQrUHNiVEhoeVVQeDRSU1ZUSHloR296NDQ1?=
 =?utf-8?B?dlpnRXJNS1I2Z3VBdkhhendvSERvUm1CL1R1MUNrdzB1SnZDRFNXSTRBU1Vz?=
 =?utf-8?B?b283TTEzeThOTDJidXIvSkRWWndXRkx1bmFwdGZkajBzdG4rc0NNWTB6QU9o?=
 =?utf-8?B?UXhicWU1R0tnckJ2Zlo4RXAvdVVqWkhKM1dKNU1Scnl0U1BYaE9HVHRrZlNW?=
 =?utf-8?B?R3FpSXYrRkJtbVQ0UDlPOXpPbFZiZWhGOWtyOGliRHFEZmF5dmdmeVVmWEFC?=
 =?utf-8?B?WnRKTTJqRzhXYmNQUEVCazhzd0s2WGsxc3BnMDFCTGFkNkp3ckQ3RUo4b2V6?=
 =?utf-8?B?YlcvQzlVRVRVaXNaR3dac081azRsbE11aHlwdUlreU9kVUNMVXA3WCtnY2ZD?=
 =?utf-8?B?M0dleVNESHlSb2hxV1FGVmVzQVg5MXNWVVpLNDNsVkU5NHV5QlUycVlQaVZP?=
 =?utf-8?B?cmVhNTBRekFVYXZMMlRqKzR2OHZTdDRDQ3JwcndqbTQ4clp3Q25aelhnRzZo?=
 =?utf-8?B?Z1NWT2pDLzVVaHZIbDB1ait2MjJqb3N2Mzh5TW9VTyt2c3cvZG9CaXI1KzFE?=
 =?utf-8?B?OEhQMklkUk1IUGRhZXZmdjNrOCtIWEJ1Q2JlbDZ2aml1eCsrRGJiSXRFeXRT?=
 =?utf-8?B?VlRXOFBsSjdaN0I4aTF4K2pBRHpYL3dxZmh5aHhPZUFtNUkyWm1oMFo3dVhB?=
 =?utf-8?B?ZjBjcFVNY2p3RnhDNVA0VWIxS29hdXdTZC9WZlk4MDRsMktQZjJwcDRkTkRv?=
 =?utf-8?B?MERYRGl4VTRib1FRUXcxM2tjVzc0YXBRU3pTOVJWNkFrSCsySjNod2NLUncx?=
 =?utf-8?B?SEFpdFRxQk5qZlI2T25XRE11RzJLWFJ3RitUcG41YmRBcnVOSk02ZWNPeDhI?=
 =?utf-8?B?bU5rakFrNlNuU0JEUURJSlJZOHdJRmpaYWhYQ0pxcGxBWDM0eDFDclQ1MU9M?=
 =?utf-8?B?M2ovWmVTY1RjRFUxY2FlenFKWDFmVk5qWTlndlc5M3dHeFpncUxLcmxBZDdU?=
 =?utf-8?B?dks0R2N5anJId1JRWVFTK0dvbURMcjU2d3lueVkxM0NPUytBWTA4amdXSkNu?=
 =?utf-8?B?am5IZFZOV1VXSjZEamlmNVJkMjlKZmZqa2ZWbnBOK2Z0Rk1GcFN3TVhzMmN4?=
 =?utf-8?B?SjlGMFFpTWx1Q0t1c3ZHRE8yVTYyQTBEUTM4M2JMcHFReUtJUWY1U0d4cURK?=
 =?utf-8?B?V2VqTlRRVGhGejcvZzZmY3dZZVhIZ2JobE9zc3czTVY4L0Y0R043aGcvQlEx?=
 =?utf-8?B?WUd2cytyM1FaazM5cWZodnRmaEZkOWFVSzFyYVpSZ2o5K3JqK2tCTDlDWi9V?=
 =?utf-8?B?dnBtS3dydnB4djA3WTlpSWJYZnRLNmZGR25YOGlDS2EzakRGQ0lvYWRJNllQ?=
 =?utf-8?B?NXBvTE9BNERVWktDTXozcVQxa3V6Y3VQNWc4dWFIbDBWZThPRmpPWTNQMGw0?=
 =?utf-8?B?Vmw4TE9zelFLbnRRTVZtdFcrTFljcG5GUGZSRFYrMEIva2pwSDJGaUwzWG9m?=
 =?utf-8?B?QmRianorMVg3QkpqNXE4NWNYUUJYOEN6YTNvV0tUUGp6N0EyRGVSSm1CK0NM?=
 =?utf-8?B?TTQ3NDVzdjF5aGRjelpneUh2M28rNzVuYUNobklsdmd0bXNocUpHMnNKLzNH?=
 =?utf-8?B?NWFOYlM0WERBa0hHWW9SMHhqSHJYK2M3ZkVqQ0lJL0ZPaUxMOTBIeWJicGQ4?=
 =?utf-8?Q?rhjgwa?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8205.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(366016)(376014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Y1MzOHNPSmxIT05LNmxSR24xbjFJbXpUUnNDa25ZNW04c0VHTXFaVkF0T2hD?=
 =?utf-8?B?MjJDZTFIOHVXcUYzeTQxajEvZ2hVSEt3bG01M3k0ZkRFN2daMEc0OS9KTUtp?=
 =?utf-8?B?MG5xKzVaZFBqZDdibG9CYytmTExRcEFIaytva1RDNE9oSEJuRE1pVzJ1VnQv?=
 =?utf-8?B?S3JvZWJRSERTcGhFTGVtWEFQUUdveSt3bi8rczNnL3h1dnFldVZ2aCtRQ3FQ?=
 =?utf-8?B?VWV6eFlHcDBWZkhjSG9SRkJGU2xBSWJ3WjlyN3o0Q05WdWNEdUkyVjEyTldv?=
 =?utf-8?B?TmpXRmtlRjIxTWZ6akg0V3hlayt2anVOejhjNkpIQkZwc0JiQlZGQnZ3d3Fh?=
 =?utf-8?B?SlBza2R5Y0gyS2NmMklYbzMra1krcTgzeVRsMHdNUktNb2lqdjdzSS9pTTcx?=
 =?utf-8?B?eGx1WXJQZ1F3QkVkLzNLZSt3bFJtK0tSWm1PNHVSMmcwbDB5d1liQmh4dGZX?=
 =?utf-8?B?ankzWUM3OVpwQmRIWHh4aXI0Q3Rlc1JqeUNqZnZWV0hXdGpNMU1XcWFpWFVJ?=
 =?utf-8?B?VWlDN1M1RUsrWkNvU1RlSE52M1lUQWsrckQzWUVYMTR3UlB6OU9YNmg4SlJK?=
 =?utf-8?B?RktsUzZ0Y0FNYlEzY2JWcDZoSU1SdDNkREhFMnFFK1JOcGhzMGgzWFBEdm8r?=
 =?utf-8?B?TnRSc0xzMDdraG1NbEZ0Qy8zbHpxZFZEcEhTN00renhnbnl4eW5nRm9yYTBH?=
 =?utf-8?B?aUtNZ3Z2emVlUS9wT1hRNk9RejdnU3NNZm4yMzZuTWo4TWJjTjhtT3hydzVr?=
 =?utf-8?B?cHUwaDBIdTJWTGgvTVEzQTk0MWc2N1VPL3BzZ0tRaFRxeWJLNENGT2VYRWNr?=
 =?utf-8?B?QjNBOE95ZlFzbmx3dGxZenp1cnplVUw2VTAyQlc4YUp1TkVYb3lRV1AvTHBY?=
 =?utf-8?B?bTJsQlYwSXVSbzRTY0RCS3VUVUhpNnlRYzNlY0lqMERsYkt5b1lVRE50TEov?=
 =?utf-8?B?VE9WNWd1WFhSUmI4RzNvdkNLUXJ6OU81a1JRZkZ5eXVOSjU5cW1MRjJQdk13?=
 =?utf-8?B?UHVuajFoVkhYb2k5NDBsRjBhLzhzUEtoT3VzbXdxM1Y4OEs3SVlFSkFpNHFL?=
 =?utf-8?B?SFdkZktXVXhFZ3psT0lqdG1aWmQ0dmdocm55cWtIS3pZWm8xL2dlRnZseWJs?=
 =?utf-8?B?aXA2elZGbHBTK3N2Lzc4LzllbGV0cnBJbE94OE8vU2sxOWhGQ2ZYRGJMTWJI?=
 =?utf-8?B?d0hkbkdnRVZrTXpuTzNvUUoxZDR0VitFTGhsRjJlb3ZoS3JrSDNtQllzcTBC?=
 =?utf-8?B?V3A2bEZCdFJhUDhhUXo2ZU5VTmZUbnliaWtpcGhLWENvUHM4TEVpUzgxd2hO?=
 =?utf-8?B?M1RLVGp0bFVWUG9pKzArVER0RnFpSy9iQ0lPQ2lDRy84VDJXelFPSGFvbXEz?=
 =?utf-8?B?c3JMZXhCejI1Q2lNTVdUbVJYR1N5MlRFN0Fsb1ppSE9idFpON3gyK2hrbURl?=
 =?utf-8?B?eGdjUExMSGhEN3ZUczB4Q1lRUE9EaVFoZGt5U0VjMmVBL2pyVy81Sk5uRHJu?=
 =?utf-8?B?eWVMRnhnMDBGU1NXRTVxMGRXbjZZcjQyRDNSeGNyZ3NJdVNYdVRVU3NCMmE1?=
 =?utf-8?B?Sm5WR01DYXFrdE1WQ3ptZGRtYmtwaXpyRDc0UC93T0l1TW1waXVvazVoNTBT?=
 =?utf-8?B?Rjc4SlNCZWhWS3VRdnNjcEJBdDM4RnFkdWlNajBjdWJvY3ZUdzg4MW40NDNJ?=
 =?utf-8?B?b3pyWkhHTGd4TWJFYXRscmlNMytjZWNrSlRrRlpxa1RRelNXMXV5dEZoUlk0?=
 =?utf-8?B?NHljeHlhbXQyRHRpT3U3cGxmWEtPdTdIaGtnbmlrd09TRG1sTUdVMVJwMmdV?=
 =?utf-8?B?K21EL0xUWEZKKzlZVlk3T093TjNxdXg0aE4vRGlxQzRxV2xQZ0lVTHB0K3NH?=
 =?utf-8?B?OENhMllCdlY4VVJ3Y2YvM2JkTVpTd2I3RkwvdndhZSsraFNVc21mQXdsemRW?=
 =?utf-8?B?MnhsN3NtNTF2SHF5amtiWHNNQ2FFV2p3aWw4SmdEVkRqOFcva3Z1UlMxc0ZP?=
 =?utf-8?B?TjRUL0VjRzRPdk9jVFJVUk5yUVExZlJySzcyamQ1VTcweDRmQWViSU4zV2xR?=
 =?utf-8?B?K3J4NUhmbnBMcXJYdWV6ckc3Vk1pNUQ5YVdCcUw3UEVtMUpXdUwvU09WVEE1?=
 =?utf-8?Q?blEgzgSJeyml9B2fg6NeVKpTS?=
X-OriginatorOrg: silabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a02ad09d-4981-41b3-9f0a-08de238f9cfb
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8205.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 15:08:05.8017
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 54dbd822-5231-4b20-944d-6f4abcd541fb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +tO1SFtoLLKI3hC8mAmGCuEwDjhmshBJv3aWVRs7oA5Th6n852PCEqlt0B9HQs3u+WfLaHHxGhBSdMskWHZMdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7005
X-Proofpoint-ORIG-GUID: 8QOKzugb4UX0kMC5RityP4coYLrD6oHI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDEyMSBTYWx0ZWRfX808ybGT92Nfn
 3MjVS7Dkgkv+pzXUdEwQ+HfO/iKQbd80Hyne68K1RLK1A9qJCrWQ1h8ddwITknxmri1+i++u67a
 bWotDbK/+1c3n3LGwpyg22pdUhG6P822fkyG2WzNC3P5o1VbRFZPl8l4kooySvHWO6xoKkEcWQ4
 Ip93ZdwYcUrjeERQi4SYbeKBlabcC5dy4PS1AHIA37e4ryKWRTd1KyfOTeGEOCH3k+b2XrHIAQ6
 qOTYu6BcuoXZRzCB52Jmt1rata7R1tyTtRG31SVzbyg3oaRb9NeuJ6BTFqWCmZpN4oHLkU9xmxT
 x9lTeY1quyGwZeuUdfFAP0n+2d3ImmYaU98qixPe9V9/PQ8kMxuyUAPwcE9qepVEZ3Inxxn4Hwi
 Lt02AiSRN2h5usTqXIWVZkNqgNhjFw==
X-Proofpoint-GUID: 8QOKzugb4UX0kMC5RityP4coYLrD6oHI
X-Authority-Analysis: v=2.4 cv=LfAxKzfi c=1 sm=1 tr=0 ts=691745da cx=c_pps
 a=zUXba1i+DNHe9EVMNcbDHw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=M51BFTxLslgA:10
 a=i1IsUcr2s-wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=2AEO0YjSAAAA:8 a=VwQbUJbxAAAA:8
 a=NifzlKhAlxbwiDc_K4AA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 spamscore=0 clxscore=1015 phishscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140121
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 9A0783F845
X-Spamd-Bar: ----
X-Spamd-Result: default: False [-4.00 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[silabs.com,reject];
	R_DKIM_ALLOW(-0.20)[silabs.com:s=pps12202023,silabs.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:148.163.149.154];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:26211, ipnet:148.163.148.0/22, country:US];
	MIME_TRACE(0.00)[0:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DNSWL_BLOCKED(0.00)[2603:10b6:8:162::17:received,52.101.62.143:received,148.163.149.154:from];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	DKIM_TRACE(0.00)[silabs.com:+]
X-Rspamd-Action: no action
Message-ID-Hash: IOMJLCGPJR73PLJBVOBSNB3SJKVUQF7K
X-Message-ID-Hash: IOMJLCGPJR73PLJBVOBSNB3SJKVUQF7K
X-MailFrom: Damien.Riegel@silabs.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Silicon Labs Kernel Team <linux-devel@silabs.com>, =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [RFC PATCH v2 01/12] greybus: cpc: add minimal CPC Host Device infrastructure
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/IOMJLCGPJR73PLJBVOBSNB3SJKVUQF7K/>
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
ICA2ICsrKw0KIGRyaXZlcnMvZ3JleWJ1cy9jcGMvaG9zdC5jICAgfCA4NSArKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysNCiBkcml2ZXJzL2dyZXlidXMvY3BjL2hvc3QuaCAgIHwg
NDAgKysrKysrKysrKysrKysrKysNCiA3IGZpbGVzIGNoYW5nZWQsIDE1MSBpbnNlcnRpb25zKCsp
DQogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3JleWJ1cy9jcGMvS2NvbmZpZw0KIGNyZWF0
ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dyZXlidXMvY3BjL01ha2VmaWxlDQogY3JlYXRlIG1vZGUg
MTAwNjQ0IGRyaXZlcnMvZ3JleWJ1cy9jcGMvaG9zdC5jDQogY3JlYXRlIG1vZGUgMTAwNjQ0IGRy
aXZlcnMvZ3JleWJ1cy9jcGMvaG9zdC5oDQoNCmRpZmYgLS1naXQgYS9NQUlOVEFJTkVSUyBiL01B
SU5UQUlORVJTDQppbmRleCBmN2FmMGE1Y2YxZS4uOTkyYzc0YjlmNmMgMTAwNjQ0DQotLS0gYS9N
QUlOVEFJTkVSUw0KKysrIGIvTUFJTlRBSU5FUlMNCkBAIC0xMDAyOSw2ICsxMDAyOSwxMiBAQCBT
OglNYWludGFpbmVkDQogRjoJRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL25ldC90
aSxjYzEzNTJwNy55YW1sDQogRjoJZHJpdmVycy9ncmV5YnVzL2diLWJlYWdsZXBsYXkuYw0KIA0K
K0dSRVlCVVMgQ1BDIERSSVZFUlMNCitNOglEYW1pZW4gUmnDqWdlbCA8ZGFtaWVuLnJpZWdlbEBz
aWxhYnMuY29tPg0KK1I6CVNpbGljb24gTGFicyBLZXJuZWwgVGVhbSA8bGludXgtZGV2ZWxAc2ls
YWJzLmNvbT4NCitTOglTdXBwb3J0ZWQNCitGOglkcml2ZXJzL2dyZXlidXMvY3BjLyoNCisNCiBH
UkVZQlVTIFNVQlNZU1RFTQ0KIE06CUpvaGFuIEhvdm9sZCA8am9oYW5Aa2VybmVsLm9yZz4NCiBN
OglBbGV4IEVsZGVyIDxlbGRlckBrZXJuZWwub3JnPg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3Jl
eWJ1cy9LY29uZmlnIGIvZHJpdmVycy9ncmV5YnVzL0tjb25maWcNCmluZGV4IDc5N2YzMmE5YzVl
Li41OWRjZmMxMjZlNSAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3JleWJ1cy9LY29uZmlnDQorKysg
Yi9kcml2ZXJzL2dyZXlidXMvS2NvbmZpZw0KQEAgLTMwLDYgKzMwLDggQEAgY29uZmlnIEdSRVlC
VVNfQkVBR0xFUExBWQ0KIAkgIFRvIGNvbXBpbGUgdGhpcyBjb2RlIGFzIGEgbW9kdWxlLCBjaG9z
ZSBNIGhlcmU6IHRoZSBtb2R1bGUNCiAJICB3aWxsIGJlIGNhbGxlZCBnYi1iZWFnbGVwbGF5Lmtv
DQogDQorc291cmNlICJkcml2ZXJzL2dyZXlidXMvY3BjL0tjb25maWciDQorDQogY29uZmlnIEdS
RVlCVVNfRVMyDQogCXRyaXN0YXRlICJHcmV5YnVzIEVTMyBVU0IgaG9zdCBjb250cm9sbGVyIg0K
IAlkZXBlbmRzIG9uIFVTQg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3JleWJ1cy9NYWtlZmlsZSBi
L2RyaXZlcnMvZ3JleWJ1cy9NYWtlZmlsZQ0KaW5kZXggN2MxNzljYzYwZTUuLmZjNzdlODZiZmZi
IDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncmV5YnVzL01ha2VmaWxlDQorKysgYi9kcml2ZXJzL2dy
ZXlidXMvTWFrZWZpbGUNCkBAIC0yMSw2ICsyMSw4IEBAIGNjZmxhZ3MteSArPSAtSSQoc3JjKQ0K
ICMgR3JleWJ1cyBIb3N0IGNvbnRyb2xsZXIgZHJpdmVycw0KIG9iai0kKENPTkZJR19HUkVZQlVT
X0JFQUdMRVBMQVkpCSs9IGdiLWJlYWdsZXBsYXkubw0KIA0KK29iai0kKENPTkZJR19HUkVZQlVT
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
CmluZGV4IDAwMDAwMDAwMDAwLi4xZWI2Yzg3ZTI1Zg0KLS0tIC9kZXYvbnVsbA0KKysrIGIvZHJp
dmVycy9ncmV5YnVzL2NwYy9ob3N0LmMNCkBAIC0wLDAgKzEsODUgQEANCisvLyBTUERYLUxpY2Vu
c2UtSWRlbnRpZmllcjogR1BMLTIuMA0KKy8qDQorICogQ29weXJpZ2h0IChjKSAyMDI1LCBTaWxp
Y29uIExhYm9yYXRvcmllcywgSW5jLg0KKyAqLw0KKw0KKyNpbmNsdWRlIDxsaW51eC9lcnIuaD4N
CisjaW5jbHVkZSA8bGludXgvZ3JleWJ1cy5oPg0KKyNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4N
CisNCisjaW5jbHVkZSAiaG9zdC5oIg0KKw0KKw0KK3N0YXRpYyBzdHJ1Y3QgY3BjX2hvc3RfZGV2
aWNlICpnYl9oZF90b19jcGNfaGQoc3RydWN0IGdiX2hvc3RfZGV2aWNlICpoZCkNCit7DQorCXJl
dHVybiAoc3RydWN0IGNwY19ob3N0X2RldmljZSAqKSZoZC0+aGRfcHJpdjsNCit9DQorDQorc3Rh
dGljIGludCBjcGNfZ2JfbWVzc2FnZV9zZW5kKHN0cnVjdCBnYl9ob3N0X2RldmljZSAqZ2JfaGQs
IHUxNiBjcG9ydF9pZCwNCisJCQkgICAgICAgc3RydWN0IGdiX21lc3NhZ2UgKm1lc3NhZ2UsIGdm
cF90IGdmcF9tYXNrKQ0KK3sNCisJc3RydWN0IGNwY19ob3N0X2RldmljZSAqY3BjX2hkID0gZ2Jf
aGRfdG9fY3BjX2hkKGdiX2hkKTsNCisNCisJcmV0dXJuIGNwY19oZC0+ZHJpdmVyLT5tZXNzYWdl
X3NlbmQoY3BjX2hkLCBjcG9ydF9pZCwgbWVzc2FnZSwgZ2ZwX21hc2spOw0KK30NCisNCitzdGF0
aWMgdm9pZCBjcGNfZ2JfbWVzc2FnZV9jYW5jZWwoc3RydWN0IGdiX21lc3NhZ2UgKm1lc3NhZ2Up
DQorew0KKwkvKiBOb3QgaW1wbGVtZW50ZWQgKi8NCit9DQorDQorc3RhdGljIHN0cnVjdCBnYl9o
ZF9kcml2ZXIgY3BjX2diX2RyaXZlciA9IHsNCisJLmhkX3ByaXZfc2l6ZQkJPSBzaXplb2Yoc3Ry
dWN0IGNwY19ob3N0X2RldmljZSksDQorCS5tZXNzYWdlX3NlbmQJCT0gY3BjX2diX21lc3NhZ2Vf
c2VuZCwNCisJLm1lc3NhZ2VfY2FuY2VsCQk9IGNwY19nYl9tZXNzYWdlX2NhbmNlbCwNCit9Ow0K
Kw0KK3N0cnVjdCBjcGNfaG9zdF9kZXZpY2UgKmNwY19oZF9jcmVhdGUoc3RydWN0IGNwY19oZF9k
cml2ZXIgKmRyaXZlciwgc3RydWN0IGRldmljZSAqcGFyZW50KQ0KK3sNCisJc3RydWN0IGNwY19o
b3N0X2RldmljZSAqY3BjX2hkOw0KKwlzdHJ1Y3QgZ2JfaG9zdF9kZXZpY2UgKmhkOw0KKw0KKwlp
ZiAoKCFkcml2ZXItPm1lc3NhZ2Vfc2VuZCkgfHwgKCFkcml2ZXItPm1lc3NhZ2VfY2FuY2VsKSkg
ew0KKwkJZGV2X2VycihwYXJlbnQsICJtaXNzaW5nIG1hbmRhdG9yeSBjYWxsYmFja3NcbiIpOw0K
KwkJcmV0dXJuIEVSUl9QVFIoLUVJTlZBTCk7DQorCX0NCisNCisJaGQgPSBnYl9oZF9jcmVhdGUo
JmNwY19nYl9kcml2ZXIsIHBhcmVudCwgR0JfQ1BDX01TR19TSVpFX01BWCwgR0JfQ1BDX05VTV9D
UE9SVFMpOw0KKwlpZiAoSVNfRVJSKGhkKSkNCisJCXJldHVybiAoc3RydWN0IGNwY19ob3N0X2Rl
dmljZSAqKWhkOw0KKw0KKwljcGNfaGQgPSBnYl9oZF90b19jcGNfaGQoaGQpOw0KKwljcGNfaGQt
PmdiX2hkID0gaGQ7DQorCWNwY19oZC0+ZHJpdmVyID0gZHJpdmVyOw0KKw0KKwlyZXR1cm4gY3Bj
X2hkOw0KK30NCitFWFBPUlRfU1lNQk9MX0dQTChjcGNfaGRfY3JlYXRlKTsNCisNCitpbnQgY3Bj
X2hkX2FkZChzdHJ1Y3QgY3BjX2hvc3RfZGV2aWNlICpjcGNfaGQpDQorew0KKwlyZXR1cm4gZ2Jf
aGRfYWRkKGNwY19oZC0+Z2JfaGQpOw0KK30NCitFWFBPUlRfU1lNQk9MX0dQTChjcGNfaGRfYWRk
KTsNCisNCit2b2lkIGNwY19oZF9wdXQoc3RydWN0IGNwY19ob3N0X2RldmljZSAqY3BjX2hkKQ0K
K3sNCisJcmV0dXJuIGdiX2hkX3B1dChjcGNfaGQtPmdiX2hkKTsNCit9DQorRVhQT1JUX1NZTUJP
TF9HUEwoY3BjX2hkX3B1dCk7DQorDQordm9pZCBjcGNfaGRfZGVsKHN0cnVjdCBjcGNfaG9zdF9k
ZXZpY2UgKmNwY19oZCkNCit7DQorCXJldHVybiBnYl9oZF9kZWwoY3BjX2hkLT5nYl9oZCk7DQor
fQ0KK0VYUE9SVF9TWU1CT0xfR1BMKGNwY19oZF9kZWwpOw0KKw0KK3ZvaWQgY3BjX2hkX3JjdmQo
c3RydWN0IGNwY19ob3N0X2RldmljZSAqY3BjX2hkLCB1MTYgY3BvcnRfaWQsIHU4ICpkYXRhLCBz
aXplX3QgbGVuZ3RoKQ0KK3sNCisJZ3JleWJ1c19kYXRhX3JjdmQoY3BjX2hkLT5nYl9oZCwgY3Bv
cnRfaWQsIGRhdGEsIGxlbmd0aCk7DQorfQ0KK0VYUE9SVF9TWU1CT0xfR1BMKGNwY19oZF9yY3Zk
KTsNCisNCitNT0RVTEVfREVTQ1JJUFRJT04oIkdyZXlidXMgb3ZlciBDUEMiKTsNCitNT0RVTEVf
TElDRU5TRSgiR1BMIik7DQorTU9EVUxFX0FVVEhPUigiU2lsaWNvbiBMYWJvcmF0b3JpZXMsIElu
Yy4iKTsNCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dyZXlidXMvY3BjL2hvc3QuaCBiL2RyaXZlcnMv
Z3JleWJ1cy9jcGMvaG9zdC5oDQpuZXcgZmlsZSBtb2RlIDEwMDY0NA0KaW5kZXggMDAwMDAwMDAw
MDAuLmZlMDc4MjZiNzY1DQotLS0gL2Rldi9udWxsDQorKysgYi9kcml2ZXJzL2dyZXlidXMvY3Bj
L2hvc3QuaA0KQEAgLTAsMCArMSw0MCBAQA0KKy8qIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBH
UEwtMi4wICovDQorLyoNCisgKiBDb3B5cmlnaHQgKGMpIDIwMjUsIFNpbGljb24gTGFib3JhdG9y
aWVzLCBJbmMuDQorICovDQorDQorI2lmbmRlZiBfX0NQQ19IT1NUX0gNCisjZGVmaW5lIF9fQ1BD
X0hPU1RfSA0KKw0KKyNpbmNsdWRlIDxsaW51eC9kZXZpY2UuaD4NCisjaW5jbHVkZSA8bGludXgv
Z3JleWJ1cy5oPg0KKyNpbmNsdWRlIDxsaW51eC90eXBlcy5oPg0KKw0KKyNkZWZpbmUgR0JfQ1BD
X01TR19TSVpFX01BWAkJCTIwNDgNCisjZGVmaW5lIEdCX0NQQ19OVU1fQ1BPUlRTCQkJOA0KKw0K
K3N0cnVjdCBjcGNfaG9zdF9kZXZpY2U7DQorDQorc3RydWN0IGNwY19oZF9kcml2ZXIgew0KKwlp
bnQgKCptZXNzYWdlX3NlbmQpKHN0cnVjdCBjcGNfaG9zdF9kZXZpY2UgKmhkLCB1MTYgZGVzdF9j
cG9ydF9pZCwNCisJCQlzdHJ1Y3QgZ2JfbWVzc2FnZSAqbWVzc2FnZSwgZ2ZwX3QgZ2ZwX21hc2sp
Ow0KKwl2b2lkICgqbWVzc2FnZV9jYW5jZWwpKHN0cnVjdCBnYl9tZXNzYWdlICptZXNzYWdlKTsN
Cit9Ow0KKw0KKy8qKg0KKyAqIHN0cnVjdCBjcGNfaG9zdF9kZXZpY2UgLSBDUEMgaG9zdCBkZXZp
Y2UuDQorICogQGdiX2hkOiBwb2ludGVyIHRvIEdyZXlidXMgSG9zdCBEZXZpY2UgdGhpcyBkZXZp
Y2UgYmVsb25ncyB0by4NCisgKiBAZHJpdmVyOiBkcml2ZXIgb3BlcmF0aW9ucy4NCisgKi8NCitz
dHJ1Y3QgY3BjX2hvc3RfZGV2aWNlIHsNCisJc3RydWN0IGdiX2hvc3RfZGV2aWNlCQkqZ2JfaGQ7
DQorCWNvbnN0IHN0cnVjdCBjcGNfaGRfZHJpdmVyCSpkcml2ZXI7DQorfTsNCisNCitzdHJ1Y3Qg
Y3BjX2hvc3RfZGV2aWNlICpjcGNfaGRfY3JlYXRlKHN0cnVjdCBjcGNfaGRfZHJpdmVyICpkcml2
ZXIsIHN0cnVjdCBkZXZpY2UgKnBhcmVudCk7DQoraW50IGNwY19oZF9hZGQoc3RydWN0IGNwY19o
b3N0X2RldmljZSAqY3BjX2hkKTsNCit2b2lkIGNwY19oZF9wdXQoc3RydWN0IGNwY19ob3N0X2Rl
dmljZSAqY3BjX2hkKTsNCit2b2lkIGNwY19oZF9kZWwoc3RydWN0IGNwY19ob3N0X2RldmljZSAq
Y3BjX2hkKTsNCit2b2lkIGNwY19oZF9yY3ZkKHN0cnVjdCBjcGNfaG9zdF9kZXZpY2UgKmNwY19o
ZCwgdTE2IGNwb3J0X2lkLCB1OCAqZGF0YSwgc2l6ZV90IGxlbmd0aCk7DQorDQorI2VuZGlmDQot
LSANCjIuNDkuMA0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpncmV5YnVzLWRldiBtYWlsaW5nIGxpc3QgLS0gZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJv
Lm9yZwpUbyB1bnN1YnNjcmliZSBzZW5kIGFuIGVtYWlsIHRvIGdyZXlidXMtZGV2LWxlYXZlQGxp
c3RzLmxpbmFyby5vcmcK
