Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id BFC9DD28F95
	for <lists+greybus-dev@lfdr.de>; Thu, 15 Jan 2026 23:17:43 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id DD461401BE
	for <lists+greybus-dev@lfdr.de>; Thu, 15 Jan 2026 22:17:42 +0000 (UTC)
Received: from mx0a-0024c301.pphosted.com (mx0a-0024c301.pphosted.com [148.163.149.154])
	by lists.linaro.org (Postfix) with ESMTPS id 8AB06401BE
	for <greybus-dev@lists.linaro.org>; Thu, 15 Jan 2026 21:46:43 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=silabs.com header.s=pps12202023 header.b=N+idasm8;
	dkim=pass header.d=silabs.com header.s=selector1 header.b=C7mZB33s;
	spf=pass (lists.linaro.org: domain of Jerome.Pouiller@silabs.com designates 148.163.149.154 as permitted sender) smtp.mailfrom=Jerome.Pouiller@silabs.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1");
	dmarc=pass (policy=reject) header.from=silabs.com
Received: from pps.filterd (m0101743.ppops.net [127.0.0.1])
	by mx0a-0024c301.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60FFjomo817691;
	Thu, 15 Jan 2026 15:46:39 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps12202023;
	 bh=CmbmH04kIVeiOgx6HOtFkJr8ThRhrDbM+HVkJyEDAFc=; b=N+idasm8ktBz
	TwqnSWYCKla+wosbbweIbppTmyqGxsmcVTba2I0Ynld6GO3J5kmfxZ1EfNssi2BT
	nTgVyrg+74W5xYHe+VRdgRtup3eViV9mHxyWdJcbwuRH1G0LuoWZk/m7wm321ksI
	C3ODqJWzumgrEfJEyueKA9DEKYNndS6+7E8yO1Gcm4ASJmeHiQ9wnh2zZgCp1KMb
	gMG/LyBBG6SKwBvyf79KJ6dG84ZYk3mi+a6aVdAsxanw5ar0w2rnOWW0NtTIbjDB
	aQXrZVO9OqLgc2EEC3aEoGMiEWKcOo+hY46iq09fTQHuHP2HT7WnCoo0mtR14p2+
	M3ZG365d1w==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11020113.outbound.protection.outlook.com [52.101.61.113])
	by mx0a-0024c301.pphosted.com (PPS) with ESMTPS id 4bq35hrrhr-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 15 Jan 2026 15:46:39 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b1T63RmnAMLpnxKpRxnmIAhDaMsLHXw/8pRbXOWatzrTOoTFEESdN7TXAB0YmqtWp9xphJzbCUpm0s92FB0w1qduLRgli0gJ5Ufzgmry48eQOzdcpbVApo09Pjm51ZAHaaLYZ78ZhBJQg+CUU3/Q5xYySswH8xFCDktRf/vvvyx57DLQUARarl11GlLXMWMrsWYuI7/qruD5U2MkGQMbdChNLExK03/QtBXE6Gq4pUX+FQ3rZf7fwnWcUyWrIAw1YVvfDylF2BMxxy9hdI+rClcVD84BgYguYymHy1QhyqZn6Labusn89t9q5cKs8SLAoPHQ8NXTPfpRSsw2XYhVww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CmbmH04kIVeiOgx6HOtFkJr8ThRhrDbM+HVkJyEDAFc=;
 b=unFNcPuGouJCWJW/NkQe9agJXw0yYcm8odjSRpBXkxEC7Y7bW/KZk5m3KgJ0TQsXdXGmGBHDoeOhO+qiI/6wCQUUgEtEvudQXcvRMF0ce3WzzVHfQW5rwZPCJWPNIh/UNGOYtuuJGVceHN1s3KxGb5RfBBvcagMbUFfT889SE7QPbafhv9ky/rQKB5JDQY8U+foGMTw2XYvSN3fgb09aID5zXIR9uASN07v7Bzr9GeVqwo2nfrXzLkdPGorbXh5bBrG9MZhLVjZvZci33tbeVNB30B65NRXXBmBubwiy1L9Ee7giJ0TyNkhn6u1qnLr0+XcRwyXiqzN/5OZ5pNFyyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silabs.com; dmarc=pass action=none header.from=silabs.com;
 dkim=pass header.d=silabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CmbmH04kIVeiOgx6HOtFkJr8ThRhrDbM+HVkJyEDAFc=;
 b=C7mZB33s3ZfnQ0BQuHtfiVM7eD1T81y/LclIcYFB2lHtV2EO/pAt3EjZjjIuHj1Mk17LPXDm4mRIQELq+s3yBw7twQqB2+npQeMY9U/r8oypPX9KlEiS4s/dxcvYzGoeB2++xCWACUoaggSIo5uINCXnFj8VJMu1j4sUdfCO/JQ=
Received: from IA1PR11MB7773.namprd11.prod.outlook.com (2603:10b6:208:3f0::21)
 by SA1PR11MB9525.namprd11.prod.outlook.com (2603:10b6:806:4c5::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Thu, 15 Jan
 2026 21:46:38 +0000
Received: from IA1PR11MB7773.namprd11.prod.outlook.com
 ([fe80::acd3:fd18:5809:64c4]) by IA1PR11MB7773.namprd11.prod.outlook.com
 ([fe80::acd3:fd18:5809:64c4%3]) with mapi id 15.20.9520.005; Thu, 15 Jan 2026
 21:46:38 +0000
From: =?UTF-8?B?SsOpcsO0bWU=?= Pouiller <jerome.pouiller@silabs.com>
To: greybus-dev@lists.linaro.org, Johan Hovold <johan@kernel.org>,
        Alex Elder <elder@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org,
        Damien =?UTF-8?B?UmnDqWdlbA==?= <damien.riegel@silabs.com>
Date: Thu, 15 Jan 2026 22:46:21 +0100
Message-ID: <5094501.Icojqenx9y@nb0018864>
Organization: Silicon Labs
In-Reply-To: <20260115155808.36102-9-damien.riegel@silabs.com>
References: 
 <20260115155808.36102-1-damien.riegel@silabs.com>
 <20260115155808.36102-9-damien.riegel@silabs.com>
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: PR3P192CA0004.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:102:56::9) To IA1PR11MB7773.namprd11.prod.outlook.com
 (2603:10b6:208:3f0::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7773:EE_|SA1PR11MB9525:EE_
X-MS-Office365-Filtering-Correlation-Id: 690acfe4-0448-4df4-800c-08de547f8f8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?MjVSZnlZQ0tBUjRaNVdKZFVQK2ZydkIyNXFzeWptUmpnSFNCczB4Mzd5Rm1k?=
 =?utf-8?B?c3ZlSGZFdDd0Um5Ba3NqSGtCRCttdU9MZGFOeThNNHczdWd2VEVVL2dLMFYy?=
 =?utf-8?B?NnEwMkJYeTJYeElHVmlTVWQzbEhleVNDKzM0Mmo2Sy9PMnZhK2VwdGZQLzh4?=
 =?utf-8?B?dG52ZjNKZVRtelFpUjMwbzNyOHZBaGFObjlZaEZOdTNXNkRsbldRdnpVaGNm?=
 =?utf-8?B?SVZpbkptR1VHSzB5dHcyZEtFMXpVRVF5aElIZHpYUmR1MUxPL3ppK1RlYzR1?=
 =?utf-8?B?ZWxqM1RXVmsyS1dSYTRienNOY2kwNzhhNWd0NGhQUk1pNk5UZm5TT0dYaUtQ?=
 =?utf-8?B?MWVLdlZ4ZjIxVVpOemlYRjFudCs1VVNRaTZqVGhteUUzSWVXM2RPaXpDeFRv?=
 =?utf-8?B?aHR2eFRkYkQwTnFIenBxS2dISnMyYUE3TEdUU0JXT0VGRFdBTVhZeXdRZjhy?=
 =?utf-8?B?bkpLOXBZdVJtTXFjaUhzbTl2OVpwWnJUQ1loVDNNcWVrc2pvS21aWHJKNmdt?=
 =?utf-8?B?SDZSeElIcStXandnS1NzTE9kMlZhOGdpaVZFbjladDhPdTFkWTFRRE1qbUM3?=
 =?utf-8?B?YzRQYk5TNEZLMjBkZHgzbUhJQldzS1loZU5Pd0xqL2dwbW9mRzIyazdpOUdh?=
 =?utf-8?B?T0NrMko3cW1YUWFyRERPNGpma01Eb3RTWWxOa2tDd1AxMmVCK2x2T09iTG12?=
 =?utf-8?B?bnRVdWw5YTJJQXVPWldwZWJGeTMwM2ZLRTZmTy93UzlraldZc0svQ05uaWJU?=
 =?utf-8?B?aWRkc1NLZUJobzhjWEF4WUdvSFYrN2JUdUpqK0p0bXhaUlpaenRYYWd6UEsv?=
 =?utf-8?B?V3hiTjVKSUQvMG1acThyMTZWWGl3ZGI0TkJkenladEJTbFpxMHlRT0VzMTZ1?=
 =?utf-8?B?YW8xQ2VtZVhCNFJ4bXl2Rm5VSk1BajZOZXpKeDFDaWZZdDdxZ3c2dmM4VGJs?=
 =?utf-8?B?ZnNKSjBnTTU0K0srM1R2N2JoRzQzekQ2UDNybFllMVhTYVBERDluUklPRWlZ?=
 =?utf-8?B?Y3Y4Ly9xQ1lmNmdERnNua2xUa0xDYWlpd3d4UGZjdXhTOUowbmNpVlQyWU5y?=
 =?utf-8?B?L0prV1JQeEg1S0Rhby9NUFlmbjRKYU15cmRSQW5xZXppd0p1NVpNMHo1UkNl?=
 =?utf-8?B?UzdtMytLekxvUmVta2VtZnBITm55ZG9vc2ZBQjVaYjRMeS9qVUNYcHA0UGR3?=
 =?utf-8?B?b09wUE1vK1oyV1haTHRtaHh0cEl0cHEwVWVxZmI3aDcvL3FuS1FDbm5xbzgy?=
 =?utf-8?B?d05kYllUNG9lVzZvb3NTcVh6OUpzemxLM2F4dFdXRXJwRC8zdFY5Ry83YXcz?=
 =?utf-8?B?azRXcElHdWxUOVU2aG0rZGw3NGZzTGt2OGtQL1graDZ4OERoejZnVDhET2l2?=
 =?utf-8?B?U3JqQXZXekh2R1ZCT2c5NE5GazRyeTFodHJOWFpEbzhRbEt3L2lXWElSUU1k?=
 =?utf-8?B?SDFqQ2MwQXcvajkwclNlWHNIZVdaU0kwTmFlYi9vRHRzbUpCakt6SFhCa2NL?=
 =?utf-8?B?WGk0TW1CTDJiOFgxcVh3SzcxbU5CMHZpYTlGb09LM3gwc1N3S1RZUWdQS0pS?=
 =?utf-8?B?QW9yd3U2N2pneWxXUXhpRFpnZ01KTVJ3NTRXVmVkcDZQa1JsMEFxU3JrQS9F?=
 =?utf-8?B?TW90Sm1aMktmeUhiNmY5cGpsMWxhdFZtKytjUEpBLzdHY0FBeGFNTlVnYXdV?=
 =?utf-8?B?dlZIOWNQMlZBN2JzR2dJUFZFeEF6RWpmZ1RTSmJHSVpEOGYvM3VGV1czTTZs?=
 =?utf-8?B?dERWdFpVVkQzNklaWjlWVmZuL1VyUVZDOUVrd0tFQThkMFVRUHpVVlJ0Vklu?=
 =?utf-8?B?STZHdTNocys3OHBueWd0RmFiODVZTGkrZG1TM1Fhc2t4amFVYzVnWG9LeTkr?=
 =?utf-8?B?WVB1VEU5U21rRVUzZjBuaWlLeDBXZVdiRkRaOUdabVI0VDlyRllydUhlSCs0?=
 =?utf-8?B?ZURqbTJIMlByNVQ4ZUFEZEZLOUJtMzI5M3FZbWp6b3BKY25CWUMwbE5WTmtM?=
 =?utf-8?B?YXJqVzZBdXZvU0FsUE5CU2FVY2NVbmlTb3V5K1JBQUs0NmdFRFpVZ1NFSWI0?=
 =?utf-8?B?TUwyR2dRS0NyV0Q4WFd4d1FJU1FtTzVhTnRxNEx6L3BmdExvSHNQRXd1WWRD?=
 =?utf-8?Q?+PpI=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7773.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(10070799003)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TCtXSmZraW5xc0RRUXdOakRqcE42R1ljRkIzek1ESkJ6U3ZJQ29obHlzbnBn?=
 =?utf-8?B?a2tiTGxlZk5teVZObXY5cFNjaCtTYlRLQ2ZneEpDUGYzRU5MUzZZb05zZktM?=
 =?utf-8?B?dUpSZHNBWGpMeVM2dXkrbC9OQW9vbFBuMlE5QTNpdFNTTVh3T3VpbWFOd3hK?=
 =?utf-8?B?Um9oZXg0QzF3cS9iLzBHZzFDSzc4MXlQQVc0YXFXUUtUZWVFamk3d3Y3Y09S?=
 =?utf-8?B?cWF4NDJyZzQ5RXUyS3NOWGlKQW9UanBlclBmaGtsaDVjWEFGVFc2ekhKcGpK?=
 =?utf-8?B?eDFKVnV4TzkrSjg2dmptRldZU0orek9qQW5pVDlKbHpacTJhbmh0c1VMYng0?=
 =?utf-8?B?WHVXc1Q5Z01OaEZJenA1dHhiVGJXU01xdS9JSVB1c0tRZHg4anI5anNFMGRo?=
 =?utf-8?B?MUtiU2YrZHhSVzZBWnpIclhUYnlqZWpuWFhrcjBpSEFZYzFreFZIUnV0Z0xa?=
 =?utf-8?B?bzhSM1JxSDBWNm9JY3dNaE40MCs0OTRTOFVld0JmQ1g0WjVabU84TFlLMnpj?=
 =?utf-8?B?SWE4YWJhYU5BTmgyUngrRzM0R3RFZkk0bk5BNXdRQ3dwUll0S3NNWG4yZ0Qv?=
 =?utf-8?B?OVRsTWpIb1FMSTlQdHIvMk1iNm1rZlNqczBnNnozanhTdEZET2NQOHJRYkRp?=
 =?utf-8?B?Wk1RSlU4a1hFTUpPZC9jSUV0WkVFRy9NbUNhZ3BCYkpQd3lOVk9ZMFdyZ2oz?=
 =?utf-8?B?dkxuK2s3TW1rdzM3QmpHbEJ2UnNWTXErSnpnaFRjaXF2dVlGUEhVRnU5ZjJK?=
 =?utf-8?B?Y2I1dHphUmVRV0tBREJRVXRsWjVaUlNJS1oycnlnS0MxZWhCaWdWYW5ncmk5?=
 =?utf-8?B?WWtkVGFtOXU3dkNmYTNOaUltdElwZkJkZkZxUjZNa282WTF0M1l6Tm8vaTVy?=
 =?utf-8?B?Z0pEdkpDRXNhdWgvWlVibTJrWnEzZHo5bit4TERMZTVVSkVuVkpVTFdzZGlo?=
 =?utf-8?B?TWlVMEJzbHRFdXFlN0w2MjBmTWtWbTFkWGFTMmZ2WFNRK2hKSTNZdCtEV25y?=
 =?utf-8?B?QlNpZE5YbmRjRFgwcW92eUlsUGhITjkwOVUweHczMWd6R0dyY2xEaDIwbFJk?=
 =?utf-8?B?SWFoUUJEcm5iVURLUE9uRXRrT0pQdU0rdUlEMDhURVdSS1BoSzM2TjZ4cnRY?=
 =?utf-8?B?dlJ0bnozZjZPV2hsYWRKcDdqaWJ2SjRrOVhaaTdIbDR5ay9TSGNJRmQ2M2xt?=
 =?utf-8?B?QXVCVS9NUHptZzhOTkpISlZKNzhRUGthUDB0S0cxTTA0dUdJMlp0a0EvZG85?=
 =?utf-8?B?TVF5RVpyUTMzdEliYW1zOVZRMDVFSExKdm0zZ2VhNU1ydE1vdTFhYUJBVXhw?=
 =?utf-8?B?SDlBT2VOR1RhWTVNQTg4OVNoeXI1NUc0dXM5NUFiRXk5SXRIUlpubUpkWFpD?=
 =?utf-8?B?Mnk5YkRsV2pmWGZFVTVMUmMvQ2VzdmRkcElGOWFwbUNxY0s1NkFHWmNVWDA4?=
 =?utf-8?B?N0h5OG9ycENLcjl1aUhiSlBWZUh4L0J3MHc1dGhXbUxob0ROZHlBYVFHNTJq?=
 =?utf-8?B?WkhPOWthWXJUOTc3cDR3Z2pqeXo2OVUyS2pmN2FUWGNsSTlRZWVSbWN2TGdM?=
 =?utf-8?B?Z1dFSnh2c1NSa0lCTXBWZUxNWHQ3clJzcldVUEJGUnJvemJUTHA3NGQ2a1V5?=
 =?utf-8?B?Mm5wUEhtaCtlZTd3ODVGc1oyN0UwMGxlTDhZQmJDR3QrSHFQc2gzbTVUaEk5?=
 =?utf-8?B?TEpWNTRhZ1BoSTA5SWJ5SjB0VGRZR1Jscjc1emdGak8wTXVPWERHdFFiWFdH?=
 =?utf-8?B?MWFObVd3d3lsZVlEbDRMbGhTY1pyeEVqRDhRZFdwTjEycHlPeU1CbFI2dDhY?=
 =?utf-8?B?V1U3cXpQNHFFREhwMVorbUF1c1ExTWF0NG4rV1dkeG9DZUdKTHFLK3JXbjY1?=
 =?utf-8?B?eHIxdVZYd0lic3Y3cjJPSlJnNmk5WUhYcEViT25EcGcwYzQ1N1ZiejZScjlj?=
 =?utf-8?B?eEJBcnFoWFVGMG1yYkhtUFVGRXAwaUJ5cWszRWxCTXMyMnM0M1NPdlRwTnhu?=
 =?utf-8?B?UDA3dG5kUTFJYk85UU5pbXYrUGQvZitPYnhNWmJhWUNHbUplMmlyN2FGWFNY?=
 =?utf-8?B?SzBDSlNKZndmck8rWVNySlB6ZFZPbGJ0VmFvVzhPcnI2ZWRsbUdUN2dnVlBO?=
 =?utf-8?B?L1lXaDJESThPOGVCcmxIU2Iwc09uUE9kVVZEK3U3VnJRLzIrOXluQjJXV1JX?=
 =?utf-8?B?UDlxcjVSMGwxUmM1V1NHbEJPQ2xuQnp4MmRhbTRSMjNvR0NDdzNyM1ZEVjNw?=
 =?utf-8?B?WmxWZW1lU0VZd2s0aitMUytTVzk2NWxTNGoyMzlSLzAvcUxmUGgxQXo2R0c1?=
 =?utf-8?B?MDdmTXFkQURkeU1GZ0dmdlBwQTMzaXV3TG5DTnpGTTA5OXNJRURQSzlPamlI?=
 =?utf-8?Q?lh/zenW+kpGZW65zD6x9zPxjBTU2ttUj0DOoZnwp2uqZy?=
X-MS-Exchange-AntiSpam-MessageData-1: TP+Qn4T/MNn5vw==
X-OriginatorOrg: silabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 690acfe4-0448-4df4-800c-08de547f8f8e
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7773.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 21:46:38.0747
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 54dbd822-5231-4b20-944d-6f4abcd541fb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6kdQbyOikbQIXWZVLjV5Vxkld058qv7YgcqxjqFQGvTA7Nm2adl7dZtl5tqfRPCXkrGkmDSgiII4GofyxdV/jA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB9525
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDE3MSBTYWx0ZWRfXydkZppJmn4Y9
 /yQk2UptZ1YNoqAhVY2nTOXIhDIJWBhWsT6K/W3QkNhdmWO5lKjmqxai7OYxssgZUw47Ur+1BfV
 YXLJxeRnxAp1qT7qVtOSrqtja+jAYfKJbpCqzK9sSHGV8fJGRsOIG96ULZWpKhQT274VaTdFbwG
 NCC4bP6xUc2FZ3WidQBRSmMyll8j3qo6PfYSJp/QKgp93NeDhJWf8IoJyG4//NS50EZiYG2ATcF
 GU3HT0pHfUCFvpwav0dKfWB5LkA1DmAocoMfjUk37a6QaIcZmHX1hS4LaMS6OrFRYCwXIHkQZbz
 nTw8sPdSihsqWexilJb9TbFWYh14zSJ9rusbPNNZ7iHSywob9sQX62eU/jOq4G5phLgj7Jm5mcl
 ghSmGMo0MD45Yv2itCkR8yE7u4b0s0CTfsee+cz11Sm0us6RlnJSMAZ6anTwnpb0eliUkFBxCPY
 yawK3sULL6zb+6/5OIw==
X-Proofpoint-ORIG-GUID: iydtPcE8CQ55SgtqOEwjLyuzCNH2y8zD
X-Proofpoint-GUID: iydtPcE8CQ55SgtqOEwjLyuzCNH2y8zD
X-Authority-Analysis: v=2.4 cv=PcXyRyhd c=1 sm=1 tr=0 ts=6969603f cx=c_pps
 a=CAOigU3XQIFPQhMveDrRuQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=M51BFTxLslgA:10
 a=i1IsUcr2s-wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=2AEO0YjSAAAA:8
 a=SYmZXYErZiKjZOxOIpQA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_06,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 phishscore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601150171
X-Rspamd-Queue-Id: 8AB06401BE
X-Spamd-Bar: ---
X-Spamd-Result: default: False [-3.83 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MIXED_CHARSET(0.67)[subject];
	DMARC_POLICY_ALLOW(-0.50)[silabs.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:148.163.149.154];
	R_DKIM_ALLOW(-0.20)[silabs.com:s=pps12202023,silabs.com:s=selector1];
	MIME_GOOD(-0.10)[text/plain];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:26211, ipnet:148.163.148.0/22, country:US];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DWL_DNSWL_BLOCKED(0.00)[silabs.com:dkim];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DNSWL_BLOCKED(0.00)[2603:10b6:208:3f0::21:received,148.163.149.154:from];
	RCVD_IN_DNSWL_NONE(0.00)[52.101.61.113:received];
	DKIM_TRACE(0.00)[silabs.com:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-MailFrom: Jerome.Pouiller@silabs.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: CAYHZFZ2SNXK4OYKRH2JK3KEAMQHZIKK
X-Message-ID-Hash: CAYHZFZ2SNXK4OYKRH2JK3KEAMQHZIKK
X-Mailman-Approved-At: Thu, 15 Jan 2026 22:17:36 +0000
CC: Silicon Labs Kernel Team <linux-devel@silabs.com>, Damien =?UTF-8?B?UmnDqWdlbA==?= <damien.riegel@silabs.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v2 08/14] greybus: cpc: add and validate sequence numbers
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/CAYHZFZ2SNXK4OYKRH2JK3KEAMQHZIKK/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Transfer-Encoding: base64

T24gVGh1cnNkYXkgMTUgSmFudWFyeSAyMDI2IDE2OjU4OjAxIENlbnRyYWwgRXVyb3BlYW4gU3Rh
bmRhcmQgVGltZSBEYW1pZW4gUmnDqWdlbCB3cm90ZToNCj4gVGhlIGZpcnN0IHN0ZXAgaW4gbWFr
aW5nIHRoZSBDUEMgaGVhZGVyIGFjdHVhbGx5IGRvIHNvbWV0aGluZyBpcyB0byBhZGQNCj4gdGhl
IHNlcXVlbmNlIG51bWJlciB0byBvdXRnb2luZyBtZXNzYWdlcyBhbmQgdmFsaWRhdGUgdGhhdCBp
bmNvbWluZw0KPiBmcmFtZXMgYXJlIHJlY2VpdmVkIGluIG9yZGVyLg0KPiANCj4gQXQgdGhpcyBz
dGFnZSwgdGhlIGRyaXZlciBkb2Vzbid0IHNlbmQgc3RhbmRhbG9uZSBhY2tzLCBzbyBpZiBhIG1l
c3NhZ2UNCj4gd2l0aCBTZXF1ZW5jZSBYIGlzIHJlY2VpdmVkLCB0aGUgcmVtb3RlIHdpbGwgbm90
IGJlIGFja25vd2xlZGdlZCB1bnRpbCBhDQo+IG1lc3NhZ2UgdGFyZ2V0aW5nIHRoYXQgQ1BvcnQg
Y29tZXMgZnJvbSB0aGUgR3JleWJ1cyBsYXllci4gT25seSB0aGVuIHRoZQ0KPiBkcml2ZXIgd2ls
bCBhY2sgd2l0aCBhY2tub3dsZWRnZWRtZW50IG51bWJlciBvZiBYICsgMS4NCj4gDQo+IFNpZ25l
ZC1vZmYtYnk6IERhbWllbiBSacOpZ2VsIDxkYW1pZW4ucmllZ2VsQHNpbGFicy5jb20+DQo+IC0t
LQ0KPiBDaGFuZ2VzIGluIHYyOg0KPiAgIC0gY2hhbmdlIGRldl93YXJuIHRvIHJhdGVsaW1pdGVk
IHZlcnNpb24gaW4gY3BjX3Byb3RvY29sX29uX2RhdGENCj4gDQo+ICBkcml2ZXJzL2dyZXlidXMv
Y3BjL01ha2VmaWxlICAgfCAgMiArLQ0KPiAgZHJpdmVycy9ncmV5YnVzL2NwYy9jcGMuaCAgICAg
IHwgMjAgKysrKysrKysrKysrKysrDQo+ICBkcml2ZXJzL2dyZXlidXMvY3BjL2Nwb3J0LmMgICAg
fCAyNSArKysrKysrKysrKysrKysrKysNCj4gIGRyaXZlcnMvZ3JleWJ1cy9jcGMvaGVhZGVyLmMg
ICB8IDE3ICsrKysrKysrKysrKw0KPiAgZHJpdmVycy9ncmV5YnVzL2NwYy9oZWFkZXIuaCAgIHwg
IDIgKysNCj4gIGRyaXZlcnMvZ3JleWJ1cy9jcGMvaG9zdC5jICAgICB8IDEzICsrKysrKystLS0N
Cj4gIGRyaXZlcnMvZ3JleWJ1cy9jcGMvcHJvdG9jb2wuYyB8IDQ3ICsrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysNCj4gIDcgZmlsZXMgY2hhbmdlZCwgMTIxIGluc2VydGlvbnMoKyks
IDUgZGVsZXRpb25zKC0pDQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncmV5YnVzL2Nw
Yy9oZWFkZXIuYw0KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3JleWJ1cy9jcGMvcHJv
dG9jb2wuYw0KPiANClsuLi5dDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dyZXlidXMvY3BjL3By
b3RvY29sLmMgYi9kcml2ZXJzL2dyZXlidXMvY3BjL3Byb3RvY29sLmMNCj4gbmV3IGZpbGUgbW9k
ZSAxMDA2NDQNCj4gaW5kZXggMDAwMDAwMDAwMDAuLmZmNjU3NTdiNDBmDQo+IC0tLSAvZGV2L251
bGwNCj4gKysrIGIvZHJpdmVycy9ncmV5YnVzL2NwYy9wcm90b2NvbC5jDQo+IEBAIC0wLDAgKzEs
NDcgQEANCj4gKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wDQo+ICsvKg0KPiAr
ICogQ29weXJpZ2h0IChjKSAyMDI1LCBTaWxpY29uIExhYm9yYXRvcmllcywgSW5jLg0KPiArICov
DQo+ICsNCj4gKyNpbmNsdWRlIDxsaW51eC9za2J1ZmYuaD4NCj4gKw0KPiArI2luY2x1ZGUgImNw
Yy5oIg0KPiArI2luY2x1ZGUgImhlYWRlci5oIg0KPiArI2luY2x1ZGUgImhvc3QuaCINCj4gKw0K
PiArdm9pZCBjcGNfcHJvdG9jb2xfcHJlcGFyZV9oZWFkZXIoc3RydWN0IHNrX2J1ZmYgKnNrYiwg
dTggYWNrKQ0KPiArew0KPiArCXN0cnVjdCBjcGNfaGVhZGVyICpoZHI7DQo+ICsNCj4gKwlza2Jf
cHVzaChza2IsIHNpemVvZigqaGRyKSk7DQo+ICsNCj4gKwloZHIgPSAoc3RydWN0IGNwY19oZWFk
ZXIgKilza2ItPmRhdGE7DQo+ICsJaGRyLT5hY2sgPSBhY2s7DQo+ICsJaGRyLT5yZWN2X3duZCA9
IDA7DQo+ICsJaGRyLT5jdHJsX2ZsYWdzID0gMDsNCj4gKwloZHItPnNlcSA9IENQQ19TS0JfQ0Io
c2tiKS0+c2VxOw0KDQpJIHN1Z2dlc3QgIm1lbXNldChoZHIsIDAsIHNpemVvZigqaGRyKSkiLCBz
byB0aGVyZSBpcyBubyBkb3VidHMgYWxsIHRoZQ0KbWVtYmVycyBhcmUgc2V0Lg0KDQpbLi4uXQ0K
DQotLSANCkrDqXLDtG1lIFBvdWlsbGVyDQoNCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0IC0tIGdyZXlidXMt
ZGV2QGxpc3RzLmxpbmFyby5vcmcKVG8gdW5zdWJzY3JpYmUgc2VuZCBhbiBlbWFpbCB0byBncmV5
YnVzLWRldi1sZWF2ZUBsaXN0cy5saW5hcm8ub3JnCg==
