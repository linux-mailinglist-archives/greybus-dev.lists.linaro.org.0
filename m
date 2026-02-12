Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4IrLKKznjWkm8gAAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Thu, 12 Feb 2026 15:46:04 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 2760312E74A
	for <lists+greybus-dev@lfdr.de>; Thu, 12 Feb 2026 15:46:04 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 3ABAE401E1
	for <lists+greybus-dev@lfdr.de>; Thu, 12 Feb 2026 14:46:03 +0000 (UTC)
Received: from mx0a-0024c301.pphosted.com (mx0a-0024c301.pphosted.com [148.163.149.154])
	by lists.linaro.org (Postfix) with ESMTPS id BAF42401F7
	for <greybus-dev@lists.linaro.org>; Thu, 12 Feb 2026 14:44:28 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=silabs.com header.s=pps12202023 header.b=Mu8gW2iV;
	dkim=pass header.d=silabs.com header.s=selector1 header.b=GK4OOlVT;
	spf=pass (lists.linaro.org: domain of "prvs=050394110d=damien.riegel@silabs.com" designates 148.163.149.154 as permitted sender) smtp.mailfrom="prvs=050394110d=damien.riegel@silabs.com";
	arc=pass ("microsoft.com:s=arcselector10001:i=1");
	dmarc=pass (policy=reject) header.from=silabs.com
Received: from pps.filterd (m0101743.ppops.net [127.0.0.1])
	by mx0a-0024c301.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61C2Lwng2678544;
	Thu, 12 Feb 2026 08:44:14 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps12202023;
	 bh=aVfV3dLiXvPZcX9nPhBvQN0T7aBdDTRqVXIeIkYzwk4=; b=Mu8gW2iVu6sa
	ggo3bsELQ+BU/IUkSkgy3sehL6XDxgJT83+l+0etlnsyqs1ok/XFkYnCVvwvcdPk
	KEgG1YTBEuX6Hjw+Q9SIPd0LwBdtDE5D8gIEyAVKO+SqxsKkn3rP2qCTw52Nv1Ui
	FMLsXKQhNOzyL+Qf7jYFvjTX3qpRNLvtIJ70OewzqQ1H8+zOXwzxNXCQAarXN2R1
	glrp4Q4HHrb/9zicClsqOWI9re5G8bi5kxH+5j7bryqE/Ffj3ABS/50PfcpnBAUh
	7OIlj8mKT7ecU4pQ+QIhi5v7dAIwYJ0Tu1gfgl+Z8TCAkj2PyW2BqeN+5JXpARYr
	9LYUM5uQSw==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11020096.outbound.protection.outlook.com [52.101.61.96])
	by mx0a-0024c301.pphosted.com (PPS) with ESMTPS id 4c92uysn4e-5
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 12 Feb 2026 08:44:14 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jBGfzllQWCsfGtta9IafFzUcm4nQi9Wtl4MFprjuJtEuzTo0iJdO9DBRG+QpiSb/ZUc8t/xmQ2Y2HtYuogmlPPqQojPa+6reer5rVVU/9BZjOZhQ16HMBfts9F63yREfEjb9iigaORV0DS2M5Nsz/4ZW8rpoUkx/n9VJxyxzElFNZvmuWmB3b7c31zM7UDxqk/H/w6U/IMaWimTkOiZdHsDwAivXRtMr0W3M2glA3sZA6PLaqao8E9E44tVWRUe2QbjhLGynPO6VBVdUIg2tdMgjszSUmr7Uzk/kY6kN6qwn5R+HbUg56tmdCfuLmMyLlQVIvu7mXgy90eoJVPrsUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aVfV3dLiXvPZcX9nPhBvQN0T7aBdDTRqVXIeIkYzwk4=;
 b=k3Igl1ufEctUAyokjyoEKuS58OC4ll2gL+V2qlsu5dwG9vPvOb4+7OQDRPoEkUO5jzcMTR0w5vbsPDMfZn0QPAPfhtkl34WUClrWHP7LE0krqBIqvtqktSnH88pWBwig6SmzsaVNOwVxd8gFsbaT9s7GI6kmC/8txnaR/us3pYkxHPDCevNXd2S7EnAROSSFwUK6d3G2PmmLzsoRXY9HxiSH4MU98ymLU3dGUlPqzd1zEuiw20Zq77EWsZ3Imws/TMN6QraD3T2xLnVe+XoXQHSwUOdslnAo5/YB2e1mtBAG5i2PqpCuTsh1yhnPyR2qonom56g3c31sRu6gX46yow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silabs.com; dmarc=pass action=none header.from=silabs.com;
 dkim=pass header.d=silabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aVfV3dLiXvPZcX9nPhBvQN0T7aBdDTRqVXIeIkYzwk4=;
 b=GK4OOlVTiSQ9RaL7CwR9N8JXn3qK7FyBvDA2nff11dFzcNRPO5t2IxOmWHAkRvcmzWVct4cLuLtCKCgMLXbFCInnQxsmhgu/oYwMrt8w5vuHzZe3X6bYYm8HSgeTo5IYcY9jjhlycOEDadbu/LsMutY8p5KqeemnbjNIGIvK2AM=
Received: from DS0PR11MB8205.namprd11.prod.outlook.com (2603:10b6:8:162::17)
 by LV8PR11MB8486.namprd11.prod.outlook.com (2603:10b6:408:1e8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Thu, 12 Feb
 2026 14:44:10 +0000
Received: from DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::2de6:bc88:2af7:3583]) by DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::2de6:bc88:2af7:3583%3]) with mapi id 15.20.9611.008; Thu, 12 Feb 2026
 14:44:10 +0000
From: =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
To: greybus-dev@lists.linaro.org, Johan Hovold <johan@kernel.org>,
        Alex Elder <elder@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org
Date: Thu, 12 Feb 2026 09:43:45 -0500
Message-ID: <20260212144352.93043-8-damien.riegel@silabs.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260212144352.93043-1-damien.riegel@silabs.com>
References: <20260212144352.93043-1-damien.riegel@silabs.com>
X-ClientProxiedBy: YQBPR0101CA0124.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:5::27) To DS0PR11MB8205.namprd11.prod.outlook.com
 (2603:10b6:8:162::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8205:EE_|LV8PR11MB8486:EE_
X-MS-Office365-Filtering-Correlation-Id: ac5d181c-9420-40a8-cad1-08de6a452edf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?MWZNaFNXVGtVZGhwcWlCL0lKam1VZk43MEMwSkd0ZDVYZG0vVDJ4RWhRcXJD?=
 =?utf-8?B?RzlRalhUMUFmTlpvSldNc2VEZ00zTmY0UXRPQVZRN00vK0Y0dVJiWlk5Z0tG?=
 =?utf-8?B?Z2N4cjFjaFhMUG1SRWoyQ1BGUVBZZnVqdkZNTkUzVVk2UFRQQzNRZ0ZyaER4?=
 =?utf-8?B?N1duQkFSdE9KZE55ZGlnWVMwNGpsd21QOFJKMkdYTks5L0x5ZVlUR0ZPK3E0?=
 =?utf-8?B?N1BTbjh6dWVlVlpwUDlpUmtWc2t5Yk1QNDZwbVo1aEI2Mzh0NzZ4SmJHMkt0?=
 =?utf-8?B?bmM4bHJiMTY4TWgvR21mUXZDQmh6dUs5ZDY3N2kvaXhiQkgrcmxaMXAzM29y?=
 =?utf-8?B?OWFnMWFzT0wrMXliVkNvTGpVaisxcmNKSUZlYklrWlhVdTQ1dXRKUnBzNmhS?=
 =?utf-8?B?K3ZwVksyQk13VTcwL3A3dWlXaG9TNjNDKzJuZ1lHZHgxWjRRK3ZXYnFIQ2sr?=
 =?utf-8?B?V2lzcWw1QkVLYkZ1Ri9TZHI1QUhqYy8yUnROYTcwKzZLK1Baczl4L0tVbENZ?=
 =?utf-8?B?VHVXZllFVHB0UHVLZ3BZaFdMYjN3UkFoQXYvSDBabFNrejd0YThlNVhLZEM1?=
 =?utf-8?B?UEhkNWo0ZVNZcWZXQVpWUkhobmNwc1YzVlkvOWE4YTluLzROOTlUWVJWMXZY?=
 =?utf-8?B?ZUdwc3JKQ0xIZEhoZ25aaWJvZU5JNHphdmh1QTk1d1FOZEdVelAranAvWC93?=
 =?utf-8?B?eDVWb25EdlMvWVA4SkZQc0hTMTRZQ3RvN2FQWVBaVTFwa0JBUTdIYmhlcERa?=
 =?utf-8?B?b0x0SWd1dmFISXFCUmNuY3h5M1RyS1MxRVZZVVRweUhyeS8wWk8ybzlGM0s3?=
 =?utf-8?B?M1k1SkdrOXJFTGYwSlZjZlRndTM0VldhaFQ4ak1FVWY1UVZDZ2tJYzlDUWgz?=
 =?utf-8?B?RXRGWi96TDhkZStydGJKQXVJU29hMHJmd2c1Q0RWSW1GYWU2aUplSUV5VzB0?=
 =?utf-8?B?cm1BU2daVXd1STZ6ZGZGcEU5ZjRSNm45b1hhcDFsbUNqTTVXczg1MHVGZVkr?=
 =?utf-8?B?cEdzVjNETFRreHAvZkFKL0RvejJ1ejh5d0xHUVI0VDA3T05BOWhZYUlNSkFP?=
 =?utf-8?B?K1dYdk5FU3JlcFlvVzZBQzJaWTVDbExvSzcxYkYvN3RreUlvS0U3ZEp0RHE1?=
 =?utf-8?B?bmpTUzRkY3Ixb0xJWEZ6aWlOUWEyblEwNU55dXNsaXhZcDJHcXBmdnNLM2NS?=
 =?utf-8?B?ZzdSVzNSZ3ArRC82MWd2cmR4dWIrWGp5aDJBTzNHeEx6UFZmNENGYXdUUTND?=
 =?utf-8?B?QnpjNGNBV2ozb3ZDaFhJNGo4cEdzWVhqbDlEcDBEYnIwODNpeUhVako2WlFu?=
 =?utf-8?B?VkhxV2dORWhHMFZPVWdrNDR6Z3RJZ1p1aUZFUVJmcGpDTWdpNDNSVWQyc1RG?=
 =?utf-8?B?aHZrMEVDeklJYkxqcVk0cWRtUXczNEVCbCtHbXFjcFY0b2FrUmVwVGl0NVhW?=
 =?utf-8?B?Wk83c3FzdS9xNm50MER5ZzVrNUFGbTljM2wxd0Z4WEFtcnh1SnBPUGpBZ1B2?=
 =?utf-8?B?SDlMMzJaSW1LRHRqR2pSaHZxVFVSbFJIMFlZZWFaK3dZaVhzbVZ4VWpDL29n?=
 =?utf-8?B?dzN6OXg5M0t4MGtrWWNDVTdqUXUvK3pNMVZVdm5OOE5mWkhRSExETEpuN3Iy?=
 =?utf-8?B?T1hZU0tQTktqemprZGtUVlN3a2I5UjI3ajlHODA0Y3VrZTVvYWd5Ri9mVlZ4?=
 =?utf-8?B?QmwyTzZQWW1DQll4VVA5Yk5ZdW9LYndGSlMrVnBqTDVrdzMxS09LdXE0d2Qy?=
 =?utf-8?B?ZE10NnZsVE9wMkowUkp2QnBrMm5ueG1BTmJ3L3JnU29Hcjh6UENSOWlwbkRO?=
 =?utf-8?B?dElCdUJ3NVlBWFRzOW1lbWpLaGRaWUdsdDc0bDlBR0dJVHQwcDVZakFYYW9z?=
 =?utf-8?B?MTdmbTdqYnU5N1pDZ0c3YVYyWHVwRmhqNE5acEVocE5UVTlIekJrUEFhMThU?=
 =?utf-8?B?TkpjUEVmV25GQTkrbWZOUjU4MEZTTTlyVnlGaGFHczFHRjM3SUw0NWlBcTFM?=
 =?utf-8?B?L0Y4Z0VoNHE3ZWZQQnVDRFZDeG53Ylp0RE1Rb0orU3JLbjgwZjUyUHVUWjRl?=
 =?utf-8?B?U0FlbXNxeTVRR2xnREQ0SjAxSFlOWmNIM21BekUyTU5TQmdxeGYxT0ptV05C?=
 =?utf-8?B?enBHVVgveW1nQzRHM1VhOEFGaHIwNVdVdXJGeHdEMVIyMlFEVno1V21LT3M3?=
 =?utf-8?Q?W19xvi4CeWEFALPz3wlEozI=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8205.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TnZhYmszY216SkxHNUw1bWRtWGozbUlHVGpwVk1lS3hkeFFjQmJRdEhKREtV?=
 =?utf-8?B?c21XeXozRTZpLzlkQkpzMUNGY2VaakdTaUxyZDdGd1FHSDNZckVFVytjMVNG?=
 =?utf-8?B?U0kxYkRMSGhKOGVNZk1Ld1k4SFBLQjlvbmlzM3F5VnlCTnliazFoait1MFlq?=
 =?utf-8?B?MEhIQk1OSEFtMEtMdVJSTWJHUGhMWEdLQzk4SHBxQ0ZsNW9YMm9yODA5L29x?=
 =?utf-8?B?VnBSR0tabTdQNmk0NWl2TzhCM2FOUXB5Q0ltME1PZ0dIck84dXd2aW82Q1A5?=
 =?utf-8?B?VkN5Zkc1cHRQc1h2ZzBrL2VNRVhpdnRXUTYvcnRSVXZGQnZ2MzMvQjNnTndO?=
 =?utf-8?B?d2pCdU1oYk5ueUxJQTBzNU1iY2FPRzNDS29BUHJXQUpaWFk2ZjBDUzJjU2NB?=
 =?utf-8?B?Vk9qVWJGdElOUzhTb0lxNTVSNVFDUEFEL3BFT0tMeFEvY3JZSW9rNXJaR1JL?=
 =?utf-8?B?TUIyUWpLTEhGUjNYYUxrdmFaTU5tRHJ0ZzFVMGM3NWN2WGJYOXNONjhha1l1?=
 =?utf-8?B?UExGdzk4TUdXQkdnRzV6QXZBMFE1OHpUa3IwclBSUml6bHBqZ0lUM1grUFZa?=
 =?utf-8?B?S0dxeUQ4N28rWmJrQzFVL0xyQU1xMXlxcEdXK2VrSHlJQ3RjVk5EWkRSTW5j?=
 =?utf-8?B?NTM4Z2R6aTBFS3M3aVdoMTc3L2J0TElzTis2S1FaNXZ0WUY5T0lISWErWXVG?=
 =?utf-8?B?WGJkekZZVURsalNUM2hsZjdUNldQbFJrTXltZG1hM0VranIyU2hWUlc3bjhE?=
 =?utf-8?B?UkQyRVYrTTRkeG9OOVVWVnljQ1grdmUyRzNHWjQ2L3p0bnJRanlQYnl6Z3U0?=
 =?utf-8?B?SUxlYUtscmhDTGw1L25DL2VIR2dRT29pUkMzcEFXaGdFSXBmSzhWYzRLNHVI?=
 =?utf-8?B?dGl1SzNwR1RyM2o0cmY3cXNsOU5UOTVZMjlnNUsyMUJTZTlxcDN4Yks3YXpu?=
 =?utf-8?B?ZW9sdW9zaFdWd3M2amM2N01TNDFLcTZhMUtZZVF1SnUxRHpJSGR6Sjh6Tnpu?=
 =?utf-8?B?dGViNFRDRGY1Mlg5QWdaQUtidGhTR1N6elpzL1g1TzdnbUtyY2pTb2diRU5k?=
 =?utf-8?B?eEc1dkh6S0ZPaVltRXZENlF6cnVJVnVqRVpaOWMvUUhLQk9aN1MxL0pML2Fx?=
 =?utf-8?B?ZUYySEMxRXRkSU5tL1FYSmxsNXNoQ2lCRXhITzBCS25YMEQ0U28xdzNBUDZG?=
 =?utf-8?B?RUE1Z3lUell0RGduK3V3ZUxBZ2tiYVFzZE1JTlhXN3N0aGZaaWZVSXhQcUcr?=
 =?utf-8?B?a0lZZExITkJ4Qk92dS8waWRIcVZEVzFBWGJwVitsTVA1dGVKanIrV1RseFQ2?=
 =?utf-8?B?R0o0ejlXSjFkMUxsekVKOW0weDl2L0s1L0x2QnZxanZCZGtFeThkYVVFVmFO?=
 =?utf-8?B?VkQzSVgxSTcrSTFiL3F1VXJ3KzZIejNkWVUwM0NNMkNySXl2QVZvNUUwSG1S?=
 =?utf-8?B?TG1uK1VuNHhBR2hNUzdFd3lHbHBmQUJtV1JFTjhKZVU0dTFsMDhIL0s1djhn?=
 =?utf-8?B?NHl2MFUxWS9kdERWWEVXOFFpN1gyMXdmQll6YkxweFpLRW50bHkrY2RlWkd4?=
 =?utf-8?B?YmFFNmk4SGZ6YnFvVEtSQmpzM1FTdVlUWWZwdGdxT0hSN0lML2Y1K0NzQyt6?=
 =?utf-8?B?blFvaXBtUDVkQXpxbmhNK05jdlNrcWR2ai9keTBZbSthRUY0MHFFSnZWeTdR?=
 =?utf-8?B?UEFnSGFvUSsrU3B0b3RRREFJU1ZvejVBSWQveUZSZWhMYlQvZzNtcWZ6Mmp3?=
 =?utf-8?B?ZGszK0hwWnc5M0orTzhZOU5rcmJ5Qm4zTzZxa29iWnFBdE4wSzRLblkrc0xJ?=
 =?utf-8?B?T3BTZjNMaU5HMEQ1Q0ZtSnRvZU1GZjQ5VXgzb1dMQXMxZ0lKd005bTkxSmgv?=
 =?utf-8?B?a3hzb0hCVmgxNXRWUVNRcGo4YkJxcjdoSzJFVldLVUl4ZFNEVXRubTRvMFcy?=
 =?utf-8?B?VnN4NXBWSjZrTUhLQ1pENGpKNVFxUjBGNVlSdEpNWXlPRmpiNXliekRreTVQ?=
 =?utf-8?B?WGZBa3NwUU9lVEhIeGNUQU02Q2hxQ3hFbU5oaXBUSWt5ZmtzZUZlS25tZ0ZE?=
 =?utf-8?B?b3IzQ2xzYkNxSzkzTE53dEdzWkcrd3FlS0g1V2xYUi9obHltSVlaVC9FRWNN?=
 =?utf-8?B?aERTMG14TFFJMVM2Z2MzbjZKdW1ac2Y1Skh5QVM2NzhoSzFzaXJMZ08wNERo?=
 =?utf-8?B?LzBlSGpZdWRXcDZIMXZLTjBqQXF4OC9PcmJHY1hHZlc4VVprT0ovMSt5RVFv?=
 =?utf-8?B?Yk9RbEh4aXprUlNIbGViMkhVbTJ5VEs0VlFmdXB2VEVOWTc1NCt0N0lWVjVh?=
 =?utf-8?B?MXBRUzJFZzdoZ25EK3BXcVFnUEZzS2lReEtBeFhGWS9maUJBUUdWUT09?=
X-OriginatorOrg: silabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac5d181c-9420-40a8-cad1-08de6a452edf
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8205.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 14:44:10.6574
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 54dbd822-5231-4b20-944d-6f4abcd541fb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZZjvggWki0E7HYuC9ZNFnPiHrjzbOtjlgqVoImIsMphcQDPf+S9S9g+2rJM8lUJeVV/dtAz5pwiHa7SzWaWd2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8486
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEyMDExMSBTYWx0ZWRfX1xlxN37uhetO
 QFRsEPlqzqenRT0qiJ9lJ9DTjylaftQJ8JMzlUcpEX083EGZAAYrPjkB0uNucfOiUBIsZzqMZ5x
 QLbNnsH1vhTyekUjADouSw6DK1AxGiZe/iRATbMeIumt8Slm06FXyePW6vEflR//vDvnUdtM9S7
 eezKAV4yxvcw2NM5w8A0qEEZV58NcHmRd4sjjEc+q/oUtqUQXRaUuGN/VIxm/mGaPRmDj5Huu+N
 FCOUMnUhfFB8vJOVCgPwiFsBpn/RxNc3XzK3+DqhnNvWJ+UbMRHoBn69bsjq5rsItw/SS5hSPOJ
 HETSiDinbsQPiMjz7XvFd5SCh8G6c5NdevRVaw2WRnsGssZOin00LkackvtumW4K4H/l+kwv2nV
 G83a63N6We4dYlAaJZuxvaOAfNehSYPDqKFqESACGu1rmBVcBaTqe9Ys5oOacCF+lwspIQDuYjP
 zjMt7szqolI1c+Q9wlA==
X-Authority-Analysis: v=2.4 cv=DtRbOW/+ c=1 sm=1 tr=0 ts=698de73e cx=c_pps
 a=TvliyZNEFSK35vtP2Nadqg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=M51BFTxLslgA:10
 a=i1IsUcr2s-wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=2AEO0YjSAAAA:8 a=7se7LFRQG06n2pVS12EA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: mxc0Pw3I5raKfsZUMJ3gJDpJU2e6ACNV
X-Proofpoint-GUID: mxc0Pw3I5raKfsZUMJ3gJDpJU2e6ACNV
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
Message-ID-Hash: 52M5XGEGYFCC2XUEE5L2Z5OBFDL637DR
X-Message-ID-Hash: 52M5XGEGYFCC2XUEE5L2Z5OBFDL637DR
X-MailFrom: prvs=050394110d=damien.riegel@silabs.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Silicon Labs Kernel Team <linux-devel@silabs.com>, =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v3 07/14] greybus: cpc: account for CPC header size in RX and TX path
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/52M5XGEGYFCC2XUEE5L2Z5OBFDL637DR/>
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
X-Rspamd-Queue-Id: 2760312E74A
X-Rspamd-Action: no action

QWNjb3VudCB0aGF0IGEgQ1BDIGhlYWRlciBpcyBwcmVwZW5kZWQgdG8gZXZlcnkgZnJhbWUgaW4g
dGhlIFJYIGFuZCBUWA0KcGF0aC4gRm9yIG5vdywgbm90aGluZyBpcyBkb25lIHdpdGggdGhhdCBo
ZWFkcm9vbSBidXQgYXQgbGVhc3QgYnl0ZXMgYXJlDQpyZXNlcnZlZCBmb3IgaXQuDQoNClNpZ25l
ZC1vZmYtYnk6IERhbWllbiBSacOpZ2VsIDxkYW1pZW4ucmllZ2VsQHNpbGFicy5jb20+DQotLS0N
CiBkcml2ZXJzL2dyZXlidXMvY3BjL2hvc3QuYyB8IDkgKysrKysrKy0tDQogMSBmaWxlIGNoYW5n
ZWQsIDcgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCg0KZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3JleWJ1cy9jcGMvaG9zdC5jIGIvZHJpdmVycy9ncmV5YnVzL2NwYy9ob3N0LmMNCmluZGV4
IDY2YzRkN2ZkMGI4Li43NTkzMjI3NTliZCAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3JleWJ1cy9j
cGMvaG9zdC5jDQorKysgYi9kcml2ZXJzL2dyZXlidXMvY3BjL2hvc3QuYw0KQEAgLTksNiArOSw3
IEBADQogI2luY2x1ZGUgPGxpbnV4L3NrYnVmZi5oPg0KIA0KICNpbmNsdWRlICJjcGMuaCINCisj
aW5jbHVkZSAiaGVhZGVyLmgiDQogI2luY2x1ZGUgImhvc3QuaCINCiANCiBzdGF0aWMgc3RydWN0
IGNwY19ob3N0X2RldmljZSAqZ2JfaGRfdG9fY3BjX2hkKHN0cnVjdCBnYl9ob3N0X2RldmljZSAq
aGQpDQpAQCAtNDgsMTEgKzQ5LDEzIEBAIHN0YXRpYyBpbnQgY3BjX2hkX21lc3NhZ2Vfc2VuZChz
dHJ1Y3QgY3BjX2hvc3RfZGV2aWNlICpjcGNfaGQsIHUxNiBjcG9ydF9pZCwNCiAJCXJldHVybiAt
RUlOVkFMOw0KIAl9DQogDQotCXNpemUgPSBzaXplb2YoKm1lc3NhZ2UtPmhlYWRlcikgKyBtZXNz
YWdlLT5wYXlsb2FkX3NpemU7DQorCXNpemUgPSBzaXplb2Yoc3RydWN0IGNwY19oZWFkZXIpICsg
c2l6ZW9mKCptZXNzYWdlLT5oZWFkZXIpICsgbWVzc2FnZS0+cGF5bG9hZF9zaXplOw0KIAlza2Ig
PSBhbGxvY19za2Ioc2l6ZSwgZ2ZwX21hc2spOw0KIAlpZiAoIXNrYikNCiAJCXJldHVybiAtRU5P
TUVNOw0KIA0KKwlza2JfcmVzZXJ2ZShza2IsIHNpemVvZihzdHJ1Y3QgY3BjX2hlYWRlcikpOw0K
Kw0KIAkvKiBIZWFkZXIgYW5kIHBheWxvYWQgYXJlIGFscmVhZHkgY29udGlndW91cyBpbiBHcmV5
YnVzIG1lc3NhZ2UgKi8NCiAJc2tiX3B1dF9kYXRhKHNrYiwgbWVzc2FnZS0+YnVmZmVyLCBzaXpl
b2YoKm1lc3NhZ2UtPmhlYWRlcikgKyBtZXNzYWdlLT5wYXlsb2FkX3NpemUpOw0KIA0KQEAgLTIx
NSw5ICsyMTgsMTEgQEAgdm9pZCBjcGNfaGRfcmN2ZChzdHJ1Y3QgY3BjX2hvc3RfZGV2aWNlICpj
cGNfaGQsIHN0cnVjdCBza19idWZmICpza2IpDQogCXUxNiBjcG9ydF9pZDsNCiANCiAJLyogUHJl
dmVudCBhbiBvdXQtb2YtYm91bmQgYWNjZXNzIGlmIGNhbGxlZCB3aXRoIG5vbi1zZW5zaWNhbCBw
YXJhbWV0ZXJzLiAqLw0KLQlpZiAoc2tiLT5sZW4gPCBzaXplb2YoKmdiX2hkcikpDQorCWlmIChz
a2ItPmxlbiA8IChzaXplb2YoKmdiX2hkcikgKyBzaXplb2Yoc3RydWN0IGNwY19oZWFkZXIpKSkN
CiAJCWdvdG8gZnJlZV9za2I7DQogDQorCXNrYl9wdWxsKHNrYiwgc2l6ZW9mKHN0cnVjdCBjcGNf
aGVhZGVyKSk7DQorDQogCS8qIFJldHJpZXZlIGNwb3J0IElEIHRoYXQgd2FzIHBhY2tlZCBpbiBH
cmV5YnVzIGhlYWRlciAqLw0KIAlnYl9oZHIgPSAoc3RydWN0IGdiX29wZXJhdGlvbl9tc2dfaGRy
ICopc2tiLT5kYXRhOw0KIAljcG9ydF9pZCA9IGNwY19jcG9ydF91bnBhY2soZ2JfaGRyKTsNCi0t
IA0KMi41Mi4wDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmdyZXlidXMtZGV2IG1haWxpbmcgbGlzdCAtLSBncmV5YnVzLWRldkBsaXN0cy5saW5hcm8u
b3JnClRvIHVuc3Vic2NyaWJlIHNlbmQgYW4gZW1haWwgdG8gZ3JleWJ1cy1kZXYtbGVhdmVAbGlz
dHMubGluYXJvLm9yZwo=
