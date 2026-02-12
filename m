Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oBokEsXnjWkm8gAAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Thu, 12 Feb 2026 15:46:29 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id E2BA112E76F
	for <lists+greybus-dev@lfdr.de>; Thu, 12 Feb 2026 15:46:28 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 02D293F74C
	for <lists+greybus-dev@lfdr.de>; Thu, 12 Feb 2026 14:46:28 +0000 (UTC)
Received: from mx0a-0024c301.pphosted.com (mx0a-0024c301.pphosted.com [148.163.149.154])
	by lists.linaro.org (Postfix) with ESMTPS id 70DF9402AB
	for <greybus-dev@lists.linaro.org>; Thu, 12 Feb 2026 14:44:30 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=silabs.com header.s=pps12202023 header.b=klcFTvmE;
	dkim=pass header.d=silabs.com header.s=selector1 header.b="MnSjvi3/";
	spf=pass (lists.linaro.org: domain of "prvs=050394110d=damien.riegel@silabs.com" designates 148.163.149.154 as permitted sender) smtp.mailfrom="prvs=050394110d=damien.riegel@silabs.com";
	arc=pass ("microsoft.com:s=arcselector10001:i=1");
	dmarc=pass (policy=reject) header.from=silabs.com
Received: from pps.filterd (m0101743.ppops.net [127.0.0.1])
	by mx0a-0024c301.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61C2Lwni2678544;
	Thu, 12 Feb 2026 08:44:15 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps12202023;
	 bh=9dY5mc9962yPz1bEk4Iw6Gm/GIuV4Wrrww4w84kU1LE=; b=klcFTvmEemhP
	MyydDiuCfTmMlQiO80cKC4ZXK43CGpfiIZuBLuKT65UifKyj95BS8KlQ+BSoxeFO
	0lULxtJX/XL2yNxgLzm7IcJtyYiTYSqGHup7E4FVe5Idm0ej2Hg4ln2jff44Ay0o
	h+L8QFvLT6iybusdTJSL8bv4Aii76ED7UOEB29wSwqUkDpKdpmHrautuqCXJVq3Q
	O0WmWq4FYfzkrfbj/Kl0D9eJ3a65n6oaX1QiCcdVmM73A+mLbvAbzFX+Cn5il/B8
	bKn4T/NN0fENEIWyBUPK2SzmDK2JHAh7if48Y+snxvgcfvAkPtiO8JgEcvmMXWAS
	XduPOremnw==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11020096.outbound.protection.outlook.com [52.101.61.96])
	by mx0a-0024c301.pphosted.com (PPS) with ESMTPS id 4c92uysn4e-6
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 12 Feb 2026 08:44:15 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AxbPIMgeMueFpgbdDjleo8Luz/+nX7i4JC0fXq5kDuWjaQKkMhMOxdDlae+8xPi0NGowfmxexGT4Qx4oWtkc5K3dGJov9tXhxQZS9r6UPUE5rxtLohZtlg/doGwPt7wmLgF0tRTwKsgKqLBXYQvEaOCaiGWZfMgeb110OqtMJNy3ab8uJVmeymU+ErE4bS8s+TfJ7zjRJD5jn9A28WzeetWhDKrzJ9Rne5ipKwrnYLgOvqWfjOKPnGmBEfYKciw69YDGJj5xjIqpTS+OYv7C97P0JQhZqCBQujplosOSQYOwuIy32MJx8rKoenW9zUa6CSEt0QfoKb0Tq2Jntcb3sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9dY5mc9962yPz1bEk4Iw6Gm/GIuV4Wrrww4w84kU1LE=;
 b=rM2Lc0fkWpIM5Ia9+y4qj/Q0sLNQUqZbKxKKqnGCIFPJboAaAFCvH2OL5euVeJ8wjChTbx9Mi4ZmBfBKOylCIO6y5KRYNf+Oe95FoLUZYYPF/BWr858WspvQ1Pc6R86Jy5+caYaFGJYktv4s32HZdqvZkjHhzOlM0elEeeEFxQms9odjKa14awxUJst7RcpU6DJs9+F/FtdSq0kAuWEk38ZFwCmFURyFQH7fcLqrYXnPp0PwqzKs7WxVoDVME+dUiWM2Jbpegu+D7+b4uwiv8YzZtv/1Yhb60qSxZkaQ5EEnlHxUjuLZrD4MVf9WkZhIF7qgHxqi2zkUeBBivuE1ZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silabs.com; dmarc=pass action=none header.from=silabs.com;
 dkim=pass header.d=silabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9dY5mc9962yPz1bEk4Iw6Gm/GIuV4Wrrww4w84kU1LE=;
 b=MnSjvi3/nwqWz/6xcrR/ZUvGxMEkOW0HtrexF5bktUDZ8mAVldoaZhXlOLX4fYpAYTpLgvGRgxlGDM/Cq9CK46uBb6mcRZEHACF1F9EE5le+Akh4qcXQ5Q4IOxRSkuU124LdoMZyxMGk+8lHMUYRIdgjG9e8PNJRu2mEcBdCWag=
Received: from DS0PR11MB8205.namprd11.prod.outlook.com (2603:10b6:8:162::17)
 by LV8PR11MB8486.namprd11.prod.outlook.com (2603:10b6:408:1e8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Thu, 12 Feb
 2026 14:44:11 +0000
Received: from DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::2de6:bc88:2af7:3583]) by DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::2de6:bc88:2af7:3583%3]) with mapi id 15.20.9611.008; Thu, 12 Feb 2026
 14:44:11 +0000
From: =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
To: greybus-dev@lists.linaro.org, Johan Hovold <johan@kernel.org>,
        Alex Elder <elder@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org
Date: Thu, 12 Feb 2026 09:43:46 -0500
Message-ID: <20260212144352.93043-9-damien.riegel@silabs.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260212144352.93043-1-damien.riegel@silabs.com>
References: <20260212144352.93043-1-damien.riegel@silabs.com>
X-ClientProxiedBy: YQBPR0101CA0124.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:5::27) To DS0PR11MB8205.namprd11.prod.outlook.com
 (2603:10b6:8:162::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8205:EE_|LV8PR11MB8486:EE_
X-MS-Office365-Filtering-Correlation-Id: 10e480af-173d-4194-1be7-08de6a452f58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?TzdGajBScGhHb0xCdTZqYkJ5M2dzQmJ5NERkcW1ndWNaWG5wbGNCUUhpcWVH?=
 =?utf-8?B?NDlyeGdFZmNxWGo3Rk1BL01YUW5WOFBWeHo3eklLRWZwaTR4VTAvVkc3aDBa?=
 =?utf-8?B?L2R5WnlpWC9rWEdNaHlReFYzNXAxVlExWmxkMG9tcDV4UHVnZmNGa0w4SG9P?=
 =?utf-8?B?OG5tS1RLRmJ2RFNpc2hqWWRXK0thd1ZyNWJ0d1Btd1lCaUg4Vm1IbE5BV2dQ?=
 =?utf-8?B?d1lTZUNmb2ZkWHlxK2M0M2RESFFNRHhqUk1vcUFhOExuZGN4QW9zdGlHT05D?=
 =?utf-8?B?ZmswY2JuN2ViN0lxQXprT1NUTEtyb0ZTMGVKbTdFcDZpVlgzOHZUMm8vblRj?=
 =?utf-8?B?R1Z1eGhQTDJXN1RYMlFNM1cyVG9LaGVvZnYyajlRTmR5QU9BVjBRRTJFL3hN?=
 =?utf-8?B?UmVhRWE4OGp0Rk5XL2lzMk1RTStvbjJPaFFiaS9FdWhrSHFiNHE0aHVXc2d4?=
 =?utf-8?B?Tks2Q0R0ZlNCbzRQbFJIUnNYWHZOaHRPWEMzSlNnb3NUa0VqQ09FRGRnRkwz?=
 =?utf-8?B?RWRiSU9Ncm04eFFQTVJodFcvS0VzZ3gwcytkU0lONlhJcWxqR0MvYnFiWHlC?=
 =?utf-8?B?ZGI4SUxFelJjamdIcUtIV3Jha1RKdGZNeUNEV3VPOS9PMzk3ektHQ2tRekRG?=
 =?utf-8?B?SEkxV2FVTkgxQVI5ZVUxTEhIUjhNeFpMVDJLdVF3T1FKQUgrNHlzaXlralNt?=
 =?utf-8?B?bG5BWU44VExKNU94dUlxUm9jWTVyWld6UkdDUUM4cWJBd1dURjJ3Qnp5cWlv?=
 =?utf-8?B?VSs5ZnBYaHVJUGlFQnpPcG1tTzlFQmluOXVQQStaSHBkcnVPZDVjL21Uc2xy?=
 =?utf-8?B?WU1jNkNxVk5UWFZDV3RJcHFqTFRyNE1xaEQvL3ZmSWZ1NTZDcktna2JWM1Rw?=
 =?utf-8?B?MDN0S3JFeCt2dUs5U1A2VGpPYUN2elZNZGN3S2lieTBXM1ZCL3k2QTFFaWdN?=
 =?utf-8?B?NFR3cDRxcXNDVnBNZ09yM2QvcVFybUtBR2tBVWFhWFJmei91WTAzSnFDdFNq?=
 =?utf-8?B?VFgxWVY3R2RDcEZhKzVVUFJUM3dHSDhEeVN4Q1JzUUUxOU1vZGdnalpSSlFv?=
 =?utf-8?B?ZU9TMHRhM0NPYmxtZC92Mkc4dStpTCtTOEVJbkxaRnIwSzdJVDlGVHNSTE5q?=
 =?utf-8?B?NWwvb1o2Z0I5NVdudFBXOURGUDVsTmxwUVRMTDdKUEJXVE0reFJQUG4zU0pr?=
 =?utf-8?B?a1RGKzZqRGJqRllDejUzYmRPQmpOOXRvYWRIdWZXRnJlZ01wbzl0UlF3Q2hl?=
 =?utf-8?B?bGplSXBQWENqRVQ2YVRSUGdLc1NzRWhlYVJMZ3RCWXJzRXlSc043ZUtQbDNO?=
 =?utf-8?B?Zms3cWVMa284SkJzUWkxaW8xWHZPNDVsR2ZzOWVRb2RXRWRweXU4SFdYcTVk?=
 =?utf-8?B?TVc1OVdZMGkrUmtxWDF2bnIyYkhFNThEdXAwL3VMSFE3a2hsSGZJTlI2OFhW?=
 =?utf-8?B?aVY0UEtmcjhLKzI1SDJLazR1RkhDSUpia2NCdG5XbXNSc2pNS3QzelZxSnRn?=
 =?utf-8?B?UUxWSUZLZm5DNlB5VmF6YzE5eDVxeEdqTGpQdTVwWTYrQnBCcWV0dVM4Njl6?=
 =?utf-8?B?QU1mZUhpbDI4VzU5cW5hZXdzSW1kVzZEYzN3a09OOU1ZM0c0WEY2SFBFdEg5?=
 =?utf-8?B?STVkbS9LRzMyTEl3ZG9VUzQ1S1JVc25HTDFvc2o1TmVmUnBUNDNXcXRlTi9j?=
 =?utf-8?B?c1BIalljWmdHZTRsTkx3My8wb25vQk8xRFNEK2ErNE1taVpnUnBUZEt6N2Rr?=
 =?utf-8?B?TVFVb1NUUlRCbXM4Q0NWdE1TVWs2cS9ianpHalJXUzgrT3RDVUtOZjhiVE9Z?=
 =?utf-8?B?UUUrQVJGWkdBdjRwdTJqZEc5WWpNWEdOVzBraVUya3BpY2VOMFp5aTQ0YTdT?=
 =?utf-8?B?eGJHVHp2VFlqdUcyRzZvemlZRDdIQTdkdlpPVEpUU01lNjlCbS9LUXRqWGh1?=
 =?utf-8?B?UXdrNjNBQWFWZHdPTWVyWkVGdHorMUNiOFcrbTBYK2dEUnFjblBsaitFR2JE?=
 =?utf-8?B?Zy9NVUpYUzZ0a2JicTNzc204YitoQUdlL25oV0F2QklwSndacFEwZVdVNjlW?=
 =?utf-8?B?SGMxcWZpZStsaVdXR1ZJQnkzeWNndVpMTkx1RUMvYmVtU2d1TFlTRU14TU1U?=
 =?utf-8?B?NVIwV3hRQkhjdUZUbmhYbnFhSjNVMTFkR1FPd0hYNDY3UTZnZWd4QUwyZm1l?=
 =?utf-8?Q?cD7c/NR0cCBBSmcGK2/3vOE=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8205.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SjVvQkQ3Y2orQVdleWZiRXdDSG1hTDJ5bE10dFhoVmlHZ3psSjZEQXFjYzNk?=
 =?utf-8?B?c1FSeWNxTzdNVzd4d2ZvUXZPWDhQdThCVlFEaFJ3aXd6bk9ZVHBjQlkrUnRn?=
 =?utf-8?B?UlNLUkNmR0hyRlB0Q0FoQVczVDJQTnZobTZVNFhUcmFtWGVwdHJVMVVxNVhz?=
 =?utf-8?B?LzlhYXovMk96a3paVWZsU20vcXBDYVRkNFZ5bEZnR3BJNGtDTURkZjR4eFNR?=
 =?utf-8?B?dFRnb3psVER1cERJSFFoRlRpVWxzcFhLK0NTWlJWQ0pBeUtmN3ptd01DLzJk?=
 =?utf-8?B?NUtqL2FteUdpSGdObW9yZjdZUFdVakhQVnV6aytuaWpyUk1aWHZIOU1wb21D?=
 =?utf-8?B?NXM5OG1TcnVSNVI1Y2lmNnVMNi9YNlhIdU83WHcwV2lQeGNxM01qNHFHeE9S?=
 =?utf-8?B?TUdua1hYamRSWFF1ZHlYTUxFS1ZCYXUyaFNrcXlIaHdpWVNHMEpKYTlUTUEr?=
 =?utf-8?B?UUlTUHZUR1BkTFRPZElEQ3VVMWxpdE1jRElRSFFpQU1uU1dUR0s5QmlMcXIy?=
 =?utf-8?B?K3hkb0FGMS9sQ0lmYWZ0czVvRUNRWW1tMk94bS9BbllCRHBTWk16TTFKekRL?=
 =?utf-8?B?SW4zUDdLeFpLNnNvdEFTR0g1Qk5oTVp0RG9mL05IQ2dPL2lXLzZIRnpCL3pG?=
 =?utf-8?B?Mm1LOE5wNmFXNzJFcnRCUzJGL3czc2pLSFE2RDM3aHhPU0l4R1ZwV0MrbnVh?=
 =?utf-8?B?R1JsaVl4VlMxcUlPVmRNRHdLbmlYNldZY0FvRno3TVBOeWVzZUNlRVUwZC9Q?=
 =?utf-8?B?azVtM1JQdCtBWVpHYVAyeDArR1lPRHg5SDNLUzJ5QnNtMzJDeHJCWlJ6Y2RH?=
 =?utf-8?B?dzUydUtLeUdWNTdMd3hzdWN6QUowcStZcUVhQmVuaVdnZFJCRkxWWi9tSGFM?=
 =?utf-8?B?ZUhteUVLSjdvZHFqcXQ0YVBHUjhxUEczNWhmcE03ZmVDUlhxcHdicVlMWExt?=
 =?utf-8?B?WFRUdXM1NlF4QXViT1UwR3Nvb3FsSFF1Q1RLWjhSbThjdkpVdjF0VEVTZk0x?=
 =?utf-8?B?Wm5jVlBQQ3oxVFJRUWdqeGdtWEVGL0tBa2I5d3pwL1J3YitZbzZHREpvbmtv?=
 =?utf-8?B?MWgzZ045ZjBFL0pqSXoxYzQ0U0VjWjFnaWdvcjBIQlhPVHBIaXVKd3lsVkZW?=
 =?utf-8?B?dXlkM085dlI0YWdGV2JsWUFLZHcxK2V6L2x0SW80Y3JDT2dFT1hFQXViUEth?=
 =?utf-8?B?andTY2JZUXJ5NnlaT2E1clRUQURNNzhvN1IvSFRoOHlPVEtKR2ZMdkdyM0NF?=
 =?utf-8?B?Lzl4ZmNCVmFmcG9ZWEtyZXdCYVl1Tjl3YVpPeVNXdlJ1KzVDbW9JakdwVy90?=
 =?utf-8?B?anFwYWkvdnU2LzBQeWxZNnFDeHc5RE1zVDNHaWpvN05hNjJiS0twMVZmaXY0?=
 =?utf-8?B?T211YXBhUTUrVks0UXVkWVp3R3VLU284Z2pBdjhNbVA1SXdybE05U3Z3eEVC?=
 =?utf-8?B?ZWlaeWs1cGdxdUkrN0t1aXQ0c1Y3TFFoTEFuaEhmSGIrQzZEemRNV3ZiL2No?=
 =?utf-8?B?NG00VFk3TkNXOXZnYXRxZzdCZU5sMCticG12WUh1anZQenZPa3NIK09mUFBL?=
 =?utf-8?B?d200dnBhT0lUZHRnUURRU1U2ZmpPV2FEOXM3REN0cUhqZEM1dXU3UEQ5OEVa?=
 =?utf-8?B?MWtnTzBQZzNmTGFGbFJFOUVYZVE1di8zYzJOUzFsYmV1OTdOTFhPQkY3L3VH?=
 =?utf-8?B?NWNMTDBFRjlBYjZqUUNGOFhEdU9TZFJKQlRadTc2K2lWYnl0MFFOR1JLdlFh?=
 =?utf-8?B?NXYwS3U4bGJzYTBZRDFLZkwxRm1yRlQ0YWFzS3QyTkNWR3Q0ekp4ZjBuNkoy?=
 =?utf-8?B?S1l5VFROemdnYWo0MUg1MEs3SktOZ0dUNTR2My9kT1pjRmZIL24wRzAxVGcz?=
 =?utf-8?B?T3VKTytGa1hwcnVqOUNZRDkvb0RJTmxNVFk2WWZ6RzlkVE8yYTV5bGFoQTFz?=
 =?utf-8?B?ZlI3U25pbkx1TUZZUmR0T2ZET2t3dGtGZDE0aGQrNXJGZ0pjYTI3MXFTSlZ1?=
 =?utf-8?B?Qis2M0dyVGpPRnU4czBJeVF4QktsREprYzlrN2p6RjM0MEIyRzV3bjBrUGZ5?=
 =?utf-8?B?am9xYmFwUHhveFVTc3lNTXlkblZCQVpCQzdzczJKaWJMaXcybWJ2bFlpLzVD?=
 =?utf-8?B?NkxuTTVtSW5ITVRmZjJON0w0S2FuSk95clU1QVEzeDNhTlVCNFhYSDJjNFNm?=
 =?utf-8?B?Vm4rSVptWmcrU204dFQyWER3NEM1YjYveWphbktQbkdpd3RSaWRHaXNwbXRt?=
 =?utf-8?B?aFVCekJSOEswRTV4cWNvZnZ6M1dub2V5aHJtdTAyK1ZIeTRjRjlQMWxXRFB5?=
 =?utf-8?B?cG83U3grekFjRytITGhoc0VjL3VML0o3N0x2aUxxdjJ2UzFINlltUT09?=
X-OriginatorOrg: silabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10e480af-173d-4194-1be7-08de6a452f58
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8205.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 14:44:11.4434
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 54dbd822-5231-4b20-944d-6f4abcd541fb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GbcaZv9pCaah2XhOo2hXFi6XSAXyYU/eFm8rQr421vZHoaEoZvqbuBveGKJYL0v3XQxptSZUAJk0dAbOisYW/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8486
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEyMDExMSBTYWx0ZWRfX1TwMAJxd+qRF
 ES+W0YIRfs0uwfTW86oXvgZkeOAJI9AVSnZ/+LH2FDrMjrFjKqWYeQdW6d/mQpnSCRIlgyVqEKC
 Q1JI3eNKGOBbFkNTPeo+2sOEpmBAzee3ncLUN3GXG3BH7WzMun2I+kzL+XIdxfnwp4R65rOyJxq
 DHh5/KDpOsoIC3jII6L9ioMXECqNbLUjTen9p9GiECzNIYioUaqhM+0DxaRghB13yzlBG4YAtvt
 jVt+cdzdzGdrBvF+5DXK3qT4rBa3fpRD/IZ7sQqviJTr4ifzPo+IaP3i/skl7TvuVzchqBPkKUr
 aYfTp+T34y1ymSo9BwhDD3rUl21NUI9iDk7CfyfM4CR8qpXIYYoVjhcnDHJRtnopp9DHRfkonE/
 FzWHvG8BeaHr36M5LPHcrr5iBLq+zhViVoYd9BOeGczHZflJHilxsWbfABHey4XYSjtbD+DhUHJ
 jxDJL0Su3o78a94iBQg==
X-Authority-Analysis: v=2.4 cv=DtRbOW/+ c=1 sm=1 tr=0 ts=698de73f cx=c_pps
 a=TvliyZNEFSK35vtP2Nadqg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=M51BFTxLslgA:10
 a=i1IsUcr2s-wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=2AEO0YjSAAAA:8 a=vN7oVFPIg2LUC2IVNO8A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: AhChdjU5OQYgS1CwYvPOnpdxkCZxnAWE
X-Proofpoint-GUID: AhChdjU5OQYgS1CwYvPOnpdxkCZxnAWE
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
Message-ID-Hash: 2Q5PZRHTJOLWSPZR22BXF2AL6T42CBKC
X-Message-ID-Hash: 2Q5PZRHTJOLWSPZR22BXF2AL6T42CBKC
X-MailFrom: prvs=050394110d=damien.riegel@silabs.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Silicon Labs Kernel Team <linux-devel@silabs.com>, =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v3 08/14] greybus: cpc: add and validate sequence numbers
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/2Q5PZRHTJOLWSPZR22BXF2AL6T42CBKC/>
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
X-Rspamd-Queue-Id: E2BA112E76F
X-Rspamd-Action: no action

VGhlIGZpcnN0IHN0ZXAgaW4gbWFraW5nIHRoZSBDUEMgaGVhZGVyIGFjdHVhbGx5IGRvIHNvbWV0
aGluZyBpcyB0byBhZGQNCnRoZSBzZXF1ZW5jZSBudW1iZXIgdG8gb3V0Z29pbmcgbWVzc2FnZXMg
YW5kIHZhbGlkYXRlIHRoYXQgaW5jb21pbmcNCmZyYW1lcyBhcmUgcmVjZWl2ZWQgaW4gb3JkZXIu
DQoNCkF0IHRoaXMgc3RhZ2UsIHRoZSBkcml2ZXIgZG9lc24ndCBzZW5kIHN0YW5kYWxvbmUgYWNr
cywgc28gaWYgYSBtZXNzYWdlDQp3aXRoIFNlcXVlbmNlIFggaXMgcmVjZWl2ZWQsIHRoZSByZW1v
dGUgd2lsbCBub3QgYmUgYWNrbm93bGVkZ2VkIHVudGlsIGENCm1lc3NhZ2UgdGFyZ2V0aW5nIHRo
YXQgQ1BvcnQgY29tZXMgZnJvbSB0aGUgR3JleWJ1cyBsYXllci4gT25seSB0aGVuIHRoZQ0KZHJp
dmVyIHdpbGwgYWNrIHdpdGggYWNrbm93bGVkZ2VkbWVudCBudW1iZXIgb2YgWCArIDEuDQoNClNp
Z25lZC1vZmYtYnk6IERhbWllbiBSacOpZ2VsIDxkYW1pZW4ucmllZ2VsQHNpbGFicy5jb20+DQot
LS0NCiBkcml2ZXJzL2dyZXlidXMvY3BjL01ha2VmaWxlICAgfCAgMiArLQ0KIGRyaXZlcnMvZ3Jl
eWJ1cy9jcGMvY3BjLmggICAgICB8IDIwICsrKysrKysrKysrKysrKw0KIGRyaXZlcnMvZ3JleWJ1
cy9jcGMvY3BvcnQuYyAgICB8IDI1ICsrKysrKysrKysrKysrKysrKw0KIGRyaXZlcnMvZ3JleWJ1
cy9jcGMvaGVhZGVyLmMgICB8IDE3ICsrKysrKysrKysrKw0KIGRyaXZlcnMvZ3JleWJ1cy9jcGMv
aGVhZGVyLmggICB8ICAyICsrDQogZHJpdmVycy9ncmV5YnVzL2NwYy9ob3N0LmMgICAgIHwgMTMg
KysrKysrKy0tLQ0KIGRyaXZlcnMvZ3JleWJ1cy9jcGMvcHJvdG9jb2wuYyB8IDQ3ICsrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysNCiA3IGZpbGVzIGNoYW5nZWQsIDEyMSBpbnNlcnRp
b25zKCspLCA1IGRlbGV0aW9ucygtKQ0KIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dyZXli
dXMvY3BjL2hlYWRlci5jDQogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3JleWJ1cy9jcGMv
cHJvdG9jb2wuYw0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncmV5YnVzL2NwYy9NYWtlZmlsZSBi
L2RyaXZlcnMvZ3JleWJ1cy9jcGMvTWFrZWZpbGUNCmluZGV4IDNkNTBmOGM1NDczLi5jNGI1MzBk
MjdhMyAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3JleWJ1cy9jcGMvTWFrZWZpbGUNCisrKyBiL2Ry
aXZlcnMvZ3JleWJ1cy9jcGMvTWFrZWZpbGUNCkBAIC0xLDYgKzEsNiBAQA0KICMgU1BEWC1MaWNl
bnNlLUlkZW50aWZpZXI6IEdQTC0yLjANCiANCi1nYi1jcGMteSA6PSBjcG9ydC5vIGhvc3Qubw0K
K2diLWNwYy15IDo9IGNwb3J0Lm8gaGVhZGVyLm8gaG9zdC5vIHByb3RvY29sLm8NCiANCiAjIENQ
QyBjb3JlDQogb2JqLSQoQ09ORklHX0dSRVlCVVNfQ1BDKQkrPSBnYi1jcGMubw0KZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3JleWJ1cy9jcGMvY3BjLmggYi9kcml2ZXJzL2dyZXlidXMvY3BjL2NwYy5o
DQppbmRleCA2MjU5Nzk1NzgxNC4uODdiNTRhNGZkMzQgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dy
ZXlidXMvY3BjL2NwYy5oDQorKysgYi9kcml2ZXJzL2dyZXlidXMvY3BjL2NwYy5oDQpAQCAtOCwx
NyArOCwzMiBAQA0KIA0KICNpbmNsdWRlIDxsaW51eC9kZXZpY2UuaD4NCiAjaW5jbHVkZSA8bGlu
dXgvZ3JleWJ1cy5oPg0KKyNpbmNsdWRlIDxsaW51eC9tdXRleC5oPg0KICNpbmNsdWRlIDxsaW51
eC90eXBlcy5oPg0KIA0KK3N0cnVjdCBza19idWZmOw0KKw0KIC8qKg0KICAqIHN0cnVjdCBjcGNf
Y3BvcnQgLSBDUEMgY3BvcnQNCiAgKiBAaWQ6IGNwb3J0IElEDQogICogQGNwY19oZDogcG9pbnRl
ciB0byB0aGUgQ1BDIGhvc3QgZGV2aWNlIHRoaXMgY3BvcnQgYmVsb25ncyB0bw0KKyAqIEBsb2Nr
OiBtdXRleCB0byBzeW5jaHJvbml6ZSBhY2Nlc3NlcyB0byB0Y2IgYW5kIG90aGVyIGF0dHJpYnV0
ZXMNCisgKiBAdGNiOiBUcmFuc21pc3Npb24gQ29udHJvbCBCbG9jaw0KICAqLw0KIHN0cnVjdCBj
cGNfY3BvcnQgew0KIAl1MTYgaWQ7DQogDQogCXN0cnVjdCBjcGNfaG9zdF9kZXZpY2UgKmNwY19o
ZDsNCisJc3RydWN0IG11dGV4IGxvY2s7IC8qIFN5bmNocm9uaXplIGFjY2VzcyB0byBzdGF0ZSB2
YXJpYWJsZXMgKi8NCisNCisJLyoNCisJICogQGFjazogY3VycmVudCBhY2tub3dsZWRnZSBudW1i
ZXINCisJICogQHNlcTogY3VycmVudCBzZXF1ZW5jZSBudW1iZXINCisJICovDQorCXN0cnVjdCB7
DQorCQl1OCBhY2s7DQorCQl1OCBzZXE7DQorCX0gdGNiOw0KIH07DQogDQogc3RydWN0IGNwY19j
cG9ydCAqY3BjX2Nwb3J0X2FsbG9jKHUxNiBjcG9ydF9pZCwgZ2ZwX3QgZ2ZwX21hc2spOw0KQEAg
LTM0LDggKzQ5LDEzIEBAIHN0cnVjdCBjcGNfc2tiX2NiIHsNCiANCiAJLyogS2VlcCB0cmFjayBv
ZiB0aGUgR0IgbWVzc2FnZSB0aGUgc2tiIG9yaWdpbmF0ZXMgZnJvbSAqLw0KIAlzdHJ1Y3QgZ2Jf
bWVzc2FnZSAqZ2JfbWVzc2FnZTsNCisNCisJdTggc2VxOw0KIH07DQogDQogI2RlZmluZSBDUENf
U0tCX0NCKF9fc2tiKSAoKHN0cnVjdCBjcGNfc2tiX2NiICopJigoX19za2IpLT5jYlswXSkpDQog
DQordm9pZCBjcGNfcHJvdG9jb2xfcHJlcGFyZV9oZWFkZXIoc3RydWN0IHNrX2J1ZmYgKnNrYiwg
dTggYWNrKTsNCit2b2lkIGNwY19wcm90b2NvbF9vbl9kYXRhKHN0cnVjdCBjcGNfY3BvcnQgKmNw
b3J0LCBzdHJ1Y3Qgc2tfYnVmZiAqc2tiKTsNCisNCiAjZW5kaWYNCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dyZXlidXMvY3BjL2Nwb3J0LmMgYi9kcml2ZXJzL2dyZXlidXMvY3BjL2Nwb3J0LmMNCmlu
ZGV4IDJjNzNkOGU3MjRlLi43MDQxYTZhOGEzNiAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3JleWJ1
cy9jcGMvY3BvcnQuYw0KKysrIGIvZHJpdmVycy9ncmV5YnVzL2NwYy9jcG9ydC5jDQpAQCAtOSw2
ICs5LDE2IEBADQogI2luY2x1ZGUgImNwYy5oIg0KICNpbmNsdWRlICJob3N0LmgiDQogDQorLyoq
DQorICogY3BjX2Nwb3J0X3RjYl9yZXNldCgpIC0gUmVzZXQgY3BvcnQncyBUQ0IgdG8gaW5pdGlh
bCB2YWx1ZXMuDQorICogQGNwb3J0OiBjcG9ydCBwb2ludGVyDQorICovDQorc3RhdGljIHZvaWQg
Y3BjX2Nwb3J0X3RjYl9yZXNldChzdHJ1Y3QgY3BjX2Nwb3J0ICpjcG9ydCkNCit7DQorCWNwb3J0
LT50Y2IuYWNrID0gMDsNCisJY3BvcnQtPnRjYi5zZXEgPSAwOw0KK30NCisNCiAvKioNCiAgKiBj
cGNfY3BvcnRfYWxsb2MoKSAtIEFsbG9jYXRlIGFuZCBpbml0aWFsaXplIENQQyBjcG9ydC4NCiAg
KiBAY3BvcnRfaWQ6IGNwb3J0IElELg0KQEAgLTI1LDYgKzM1LDkgQEAgc3RydWN0IGNwY19jcG9y
dCAqY3BjX2Nwb3J0X2FsbG9jKHUxNiBjcG9ydF9pZCwgZ2ZwX3QgZ2ZwX21hc2spDQogCQlyZXR1
cm4gTlVMTDsNCiANCiAJY3BvcnQtPmlkID0gY3BvcnRfaWQ7DQorCWNwY19jcG9ydF90Y2JfcmVz
ZXQoY3BvcnQpOw0KKw0KKwltdXRleF9pbml0KCZjcG9ydC0+bG9jayk7DQogDQogCXJldHVybiBj
cG9ydDsNCiB9DQpAQCAtNjksMTAgKzgyLDIyIEBAIGludCBjcGNfY3BvcnRfdHJhbnNtaXQoc3Ry
dWN0IGNwY19jcG9ydCAqY3BvcnQsIHN0cnVjdCBza19idWZmICpza2IpDQogew0KIAlzdHJ1Y3Qg
Y3BjX2hvc3RfZGV2aWNlICpjcGNfaGQgPSBjcG9ydC0+Y3BjX2hkOw0KIAlzdHJ1Y3QgZ2Jfb3Bl
cmF0aW9uX21zZ19oZHIgKmdiX2hkcjsNCisJdTggYWNrOw0KIA0KIAkvKiBJbmplY3QgY3BvcnQg
SUQgaW4gR3JleWJ1cyBoZWFkZXIgKi8NCiAJZ2JfaGRyID0gKHN0cnVjdCBnYl9vcGVyYXRpb25f
bXNnX2hkciAqKXNrYi0+ZGF0YTsNCiAJY3BjX2Nwb3J0X3BhY2soZ2JfaGRyLCBjcG9ydC0+aWQp
Ow0KIA0KKwltdXRleF9sb2NrKCZjcG9ydC0+bG9jayk7DQorDQorCUNQQ19TS0JfQ0Ioc2tiKS0+
c2VxID0gY3BvcnQtPnRjYi5zZXE7DQorDQorCWNwb3J0LT50Y2Iuc2VxKys7DQorCWFjayA9IGNw
b3J0LT50Y2IuYWNrOw0KKw0KKwltdXRleF91bmxvY2soJmNwb3J0LT5sb2NrKTsNCisNCisJY3Bj
X3Byb3RvY29sX3ByZXBhcmVfaGVhZGVyKHNrYiwgYWNrKTsNCisNCiAJcmV0dXJuIGNwY19oZF9z
ZW5kX3NrYihjcGNfaGQsIHNrYik7DQogfQ0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3JleWJ1cy9j
cGMvaGVhZGVyLmMgYi9kcml2ZXJzL2dyZXlidXMvY3BjL2hlYWRlci5jDQpuZXcgZmlsZSBtb2Rl
IDEwMDY0NA0KaW5kZXggMDAwMDAwMDAwMDAuLjYyOTQ2ZDYwNzdlDQotLS0gL2Rldi9udWxsDQor
KysgYi9kcml2ZXJzL2dyZXlidXMvY3BjL2hlYWRlci5jDQpAQCAtMCwwICsxLDE3IEBADQorLy8g
U1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjANCisvKg0KKyAqIENvcHlyaWdodCAoYykg
MjAyNSwgU2lsaWNvbiBMYWJvcmF0b3JpZXMsIEluYy4NCisgKi8NCisNCisjaW5jbHVkZSAiaGVh
ZGVyLmgiDQorDQorLyoqDQorICogY3BjX2hlYWRlcl9nZXRfc2VxKCkgLSBHZXQgdGhlIHNlcXVl
bmNlIG51bWJlci4NCisgKiBAaGRyOiBDUEMgaGVhZGVyLg0KKyAqDQorICogUmV0dXJuOiBTZXF1
ZW5jZSBudW1iZXIuDQorICovDQordTggY3BjX2hlYWRlcl9nZXRfc2VxKGNvbnN0IHN0cnVjdCBj
cGNfaGVhZGVyICpoZHIpDQorew0KKwlyZXR1cm4gaGRyLT5zZXE7DQorfQ0KZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3JleWJ1cy9jcGMvaGVhZGVyLmggYi9kcml2ZXJzL2dyZXlidXMvY3BjL2hlYWRl
ci5oDQppbmRleCBmNjVhNjA4YTY1MC4uNTE5NjQyMjM4MGUgMTAwNjQ0DQotLS0gYS9kcml2ZXJz
L2dyZXlidXMvY3BjL2hlYWRlci5oDQorKysgYi9kcml2ZXJzL2dyZXlidXMvY3BjL2hlYWRlci5o
DQpAQCAtMzgsNCArMzgsNiBAQCBzdHJ1Y3QgY3BjX2hlYWRlciB7DQogCV9fdTggYWNrOw0KIH0g
X19wYWNrZWQ7DQogDQordTggY3BjX2hlYWRlcl9nZXRfc2VxKGNvbnN0IHN0cnVjdCBjcGNfaGVh
ZGVyICpoZHIpOw0KKw0KICNlbmRpZg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3JleWJ1cy9jcGMv
aG9zdC5jIGIvZHJpdmVycy9ncmV5YnVzL2NwYy9ob3N0LmMNCmluZGV4IDc1OTMyMjc1OWJkLi4y
YzFiNWQwMmVjMiAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3JleWJ1cy9jcGMvaG9zdC5jDQorKysg
Yi9kcml2ZXJzL2dyZXlidXMvY3BjL2hvc3QuYw0KQEAgLTIxNSwxOSArMjE1LDI0IEBAIEVYUE9S
VF9TWU1CT0xfR1BMKGNwY19oZF9tZXNzYWdlX3NlbnQpOw0KIHZvaWQgY3BjX2hkX3JjdmQoc3Ry
dWN0IGNwY19ob3N0X2RldmljZSAqY3BjX2hkLCBzdHJ1Y3Qgc2tfYnVmZiAqc2tiKQ0KIHsNCiAJ
c3RydWN0IGdiX29wZXJhdGlvbl9tc2dfaGRyICpnYl9oZHI7DQorCXN0cnVjdCBjcGNfY3BvcnQg
KmNwb3J0Ow0KIAl1MTYgY3BvcnRfaWQ7DQogDQogCS8qIFByZXZlbnQgYW4gb3V0LW9mLWJvdW5k
IGFjY2VzcyBpZiBjYWxsZWQgd2l0aCBub24tc2Vuc2ljYWwgcGFyYW1ldGVycy4gKi8NCiAJaWYg
KHNrYi0+bGVuIDwgKHNpemVvZigqZ2JfaGRyKSArIHNpemVvZihzdHJ1Y3QgY3BjX2hlYWRlcikp
KQ0KIAkJZ290byBmcmVlX3NrYjsNCiANCi0Jc2tiX3B1bGwoc2tiLCBzaXplb2Yoc3RydWN0IGNw
Y19oZWFkZXIpKTsNCi0NCiAJLyogUmV0cmlldmUgY3BvcnQgSUQgdGhhdCB3YXMgcGFja2VkIGlu
IEdyZXlidXMgaGVhZGVyICovDQotCWdiX2hkciA9IChzdHJ1Y3QgZ2Jfb3BlcmF0aW9uX21zZ19o
ZHIgKilza2ItPmRhdGE7DQorCWdiX2hkciA9IChzdHJ1Y3QgZ2Jfb3BlcmF0aW9uX21zZ19oZHIg
Kikoc2tiLT5kYXRhICsgc2l6ZW9mKHN0cnVjdCBjcGNfaGVhZGVyKSk7DQogCWNwb3J0X2lkID0g
Y3BjX2Nwb3J0X3VucGFjayhnYl9oZHIpOw0KIA0KLQlncmV5YnVzX2RhdGFfcmN2ZChjcGNfaGQt
PmdiX2hkLCBjcG9ydF9pZCwgc2tiLT5kYXRhLCBza2ItPmxlbik7DQorCWNwb3J0ID0gY3BjX2hk
X2dldF9jcG9ydChjcGNfaGQsIGNwb3J0X2lkKTsNCisJaWYgKCFjcG9ydCkgew0KKwkJZGV2X3dh
cm4oY3BjX2hkX2RldihjcGNfaGQpLCAiY3BvcnQgJXUgbm90IGFsbG9jYXRlZFxuIiwgY3BvcnRf
aWQpOw0KKwkJZ290byBmcmVlX3NrYjsNCisJfQ0KKw0KKwljcGNfcHJvdG9jb2xfb25fZGF0YShj
cG9ydCwgc2tiKTsNCiANCiBmcmVlX3NrYjoNCiAJa2ZyZWVfc2tiKHNrYik7DQpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncmV5YnVzL2NwYy9wcm90b2NvbC5jIGIvZHJpdmVycy9ncmV5YnVzL2NwYy9w
cm90b2NvbC5jDQpuZXcgZmlsZSBtb2RlIDEwMDY0NA0KaW5kZXggMDAwMDAwMDAwMDAuLjhmMGFj
NmRmYTExDQotLS0gL2Rldi9udWxsDQorKysgYi9kcml2ZXJzL2dyZXlidXMvY3BjL3Byb3RvY29s
LmMNCkBAIC0wLDAgKzEsNDcgQEANCisvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIu
MA0KKy8qDQorICogQ29weXJpZ2h0IChjKSAyMDI1LCBTaWxpY29uIExhYm9yYXRvcmllcywgSW5j
Lg0KKyAqLw0KKw0KKyNpbmNsdWRlIDxsaW51eC9za2J1ZmYuaD4NCisNCisjaW5jbHVkZSAiY3Bj
LmgiDQorI2luY2x1ZGUgImhlYWRlci5oIg0KKyNpbmNsdWRlICJob3N0LmgiDQorDQordm9pZCBj
cGNfcHJvdG9jb2xfcHJlcGFyZV9oZWFkZXIoc3RydWN0IHNrX2J1ZmYgKnNrYiwgdTggYWNrKQ0K
K3sNCisJc3RydWN0IGNwY19oZWFkZXIgKmhkcjsNCisNCisJc2tiX3B1c2goc2tiLCBzaXplb2Yo
KmhkcikpOw0KKw0KKwloZHIgPSAoc3RydWN0IGNwY19oZWFkZXIgKilza2ItPmRhdGE7DQorCW1l
bXNldChoZHIsIDAsIHNpemVvZigqaGRyKSk7DQorDQorCWhkci0+YWNrID0gYWNrOw0KKwloZHIt
PnNlcSA9IENQQ19TS0JfQ0Ioc2tiKS0+c2VxOw0KK30NCisNCit2b2lkIGNwY19wcm90b2NvbF9v
bl9kYXRhKHN0cnVjdCBjcGNfY3BvcnQgKmNwb3J0LCBzdHJ1Y3Qgc2tfYnVmZiAqc2tiKQ0KK3sN
CisJc3RydWN0IGNwY19oZWFkZXIgKmNwY19oZHIgPSAoc3RydWN0IGNwY19oZWFkZXIgKilza2It
PmRhdGE7DQorCXU4IHNlcSA9IGNwY19oZWFkZXJfZ2V0X3NlcShjcGNfaGRyKTsNCisJYm9vbCBl
eHBlY3RlZF9zZXEgPSBmYWxzZTsNCisNCisJbXV0ZXhfbG9jaygmY3BvcnQtPmxvY2spOw0KKw0K
KwlleHBlY3RlZF9zZXEgPSBzZXEgPT0gY3BvcnQtPnRjYi5hY2s7DQorCWlmIChleHBlY3RlZF9z
ZXEpDQorCQljcG9ydC0+dGNiLmFjaysrOw0KKwllbHNlDQorCQlkZXZfd2Fybl9yYXRlbGltaXRl
ZChjcGNfaGRfZGV2KGNwb3J0LT5jcGNfaGQpLA0KKwkJCQkgICAgICJ1bmV4cGVjdGVkIHNlcTog
JXUsIGV4cGVjdGVkIHNlcTogJXVcbiIsIHNlcSwgY3BvcnQtPnRjYi5hY2spOw0KKw0KKwltdXRl
eF91bmxvY2soJmNwb3J0LT5sb2NrKTsNCisNCisJaWYgKGV4cGVjdGVkX3NlcSkgew0KKwkJc2ti
X3B1bGwoc2tiLCBzaXplb2YoKmNwY19oZHIpKTsNCisNCisJCWdyZXlidXNfZGF0YV9yY3ZkKGNw
b3J0LT5jcGNfaGQtPmdiX2hkLCBjcG9ydC0+aWQsIHNrYi0+ZGF0YSwgc2tiLT5sZW4pOw0KKwl9
DQorfQ0KLS0gDQoyLjUyLjANCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZ3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0IC0tIGdyZXlidXMtZGV2QGxpc3Rz
LmxpbmFyby5vcmcKVG8gdW5zdWJzY3JpYmUgc2VuZCBhbiBlbWFpbCB0byBncmV5YnVzLWRldi1s
ZWF2ZUBsaXN0cy5saW5hcm8ub3JnCg==
