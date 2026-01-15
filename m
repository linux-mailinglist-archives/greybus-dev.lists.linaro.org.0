Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D1AD258AC
	for <lists+greybus-dev@lfdr.de>; Thu, 15 Jan 2026 16:58:58 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 89166401BA
	for <lists+greybus-dev@lfdr.de>; Thu, 15 Jan 2026 15:58:57 +0000 (UTC)
Received: from mx0b-0024c301.pphosted.com (mx0b-0024c301.pphosted.com [148.163.153.153])
	by lists.linaro.org (Postfix) with ESMTPS id 956A03F8F4
	for <greybus-dev@lists.linaro.org>; Thu, 15 Jan 2026 15:58:45 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=silabs.com header.s=pps12202023 header.b=VbyrzwkB;
	dkim=pass header.d=silabs.com header.s=selector1 header.b=AycGaYtM;
	spf=pass (lists.linaro.org: domain of Damien.Riegel@silabs.com designates 148.163.153.153 as permitted sender) smtp.mailfrom=Damien.Riegel@silabs.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1");
	dmarc=pass (policy=reject) header.from=silabs.com
Received: from pps.filterd (m0101742.ppops.net [127.0.0.1])
	by mx0a-0024c301.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60FFlYMr459372;
	Thu, 15 Jan 2026 09:58:36 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pps12202023; bh=SChXtk5XwyI4aSLQWfYa
	EwuKijiUm+NYtliz9Rg+liQ=; b=VbyrzwkBcIAZNkGaRxIf7kZ8X18i552Uostx
	wyKZ/DxejsGL4bFLhQoDL3daLQXQAZR6+71yHBzF++Zecppyk2KffM4F/HTQw+YQ
	mYLU/zdUBWhy+yhPc9QSeVlOg1JPWLqb+/FkqGuerQS9qLukGCqQjyE4EkpenLx/
	m0ysdNimqctgiqAWXqWQoSv0GmHzr1OkeZojtYUrztO6i9u7MLOl/TmbxZZkXcAz
	yMP9ZZ1mZYVbd7LAofqWIryMC6LKPeGyeU/4CiWhpvrMT7cfT+qr0vp9gzRyKGII
	Q1HjwAzrNUudh/QzUdAV9mVd9oVpfz9NRaDXN7XwZ01YvWsuLQ==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11021127.outbound.protection.outlook.com [52.101.52.127])
	by mx0a-0024c301.pphosted.com (PPS) with ESMTPS id 4bq36kr0ut-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 15 Jan 2026 09:58:35 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cRYAX+s2dwnrnKtF5kpzmuKr4OpvzYDepc+QWZvdaLYF2KU6fAiP4mZZaQ82QW2nVoayKhBL9QF52h/UDAtl+46WF28NP2dDO41I6vadAKwEH/EtYM1oL3LdspcSlZf0Hy4QBKFE5qCIvp4IEGl3bu2QJiV78v1PUJJBIR29O1M+d0BLTLkPYZJT0JJ/TgHHfihv8GKI662R0phmdr2CjQyE2RlLv136ahdbkVTvPt4APcWVu9D5E1sgZx1Usj8E+4nV7QlBkxnp5aCLP5wxhM+j2NaKx3sARe/vM5C5ZUtgVo3hy3C7bHcj57VgsOpbUQzL21gEe4BOWummgsEbWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SChXtk5XwyI4aSLQWfYaEwuKijiUm+NYtliz9Rg+liQ=;
 b=N3cMSpahQQF/FSbBSFQpxk8LkeuxBhZacRIvKdOKqyRDiCC34qfwlOVWDCKbr4VcDqDmkTy/h/bSqZwfJim/n9KLyORFWycsTiaVmo4k8X8WeLD0bWPLpsliE0kOLr2ySQ56lQeM8a8YWWh5YaVYro/QdnIHmKz99vTwDo+Wr2dgJO+WV5y0fLjX0CQhw4MEa4t3DofCwwyLmDoEeqKzniohWPTzCfSqoED3VAnQOfOCqkYF1193gWkHZeW6gezohp5qTF1+Aqv0ornHhrAFmQuM2pZxZm9qe4O1gGDCrjR/MsTc6hF7efIPhPIw4oK4Vg7O6mLMtxlEH6qHvW5DMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silabs.com; dmarc=pass action=none header.from=silabs.com;
 dkim=pass header.d=silabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SChXtk5XwyI4aSLQWfYaEwuKijiUm+NYtliz9Rg+liQ=;
 b=AycGaYtM0pAGgn+xsH/Xkzb5HiN+o0FVUqgw2cdZJX5GeDp3QPfB0VPn8B0Hy2RauLLQEkZiXre1J+IMXWs6ijUq20mj+DRpNxaC+y+e5CecZ/5Yhm6EqulSPh8fu+U7WEbnFaky6fZnXCku3eyV0pdo2orzsugPrko+SCxuuYo=
Received: from DS0PR11MB8205.namprd11.prod.outlook.com (2603:10b6:8:162::17)
 by SA1PR11MB8811.namprd11.prod.outlook.com (2603:10b6:806:467::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Thu, 15 Jan
 2026 15:58:31 +0000
Received: from DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::2de6:bc88:2af7:3583]) by DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::2de6:bc88:2af7:3583%3]) with mapi id 15.20.9520.005; Thu, 15 Jan 2026
 15:58:31 +0000
From: =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
To: greybus-dev@lists.linaro.org, Johan Hovold <johan@kernel.org>,
        Alex Elder <elder@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org
Date: Thu, 15 Jan 2026 10:57:53 -0500
Message-ID: <20260115155808.36102-1-damien.riegel@silabs.com>
X-Mailer: git-send-email 2.52.0
X-ClientProxiedBy: YQZPR01CA0025.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:86::22) To DS0PR11MB8205.namprd11.prod.outlook.com
 (2603:10b6:8:162::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8205:EE_|SA1PR11MB8811:EE_
X-MS-Office365-Filtering-Correlation-Id: 80236c37-7a92-4c55-f253-08de544eee1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ODdXNzZ5cVFQajJrQTNDOFQrLzVMRnFRVGdvWmZqdktNMktrZUhEbUZxR2Zh?=
 =?utf-8?B?aE1RTythU0F1VmpYRklSNXRWVXFONHBWaHJ6bDNlbklhYVUrbExMSE9xcTkv?=
 =?utf-8?B?UlFENWJubmxxR0lQZUlsRVVjT2ExUkgvT2ZhMW5rckpyV2w5TnZMQ0JYbE9C?=
 =?utf-8?B?U3NkWVlrTGY5bEgrZk1LNUxhUE1RMm1aSEdXYlJ4SW9qK0xEd1RUdEVvMm9j?=
 =?utf-8?B?OXhsOVduR1BiU0drZ3R2Qmp2WmRmWCtjMVpjaEIwQmRoOUcwZW1vSndkbzdY?=
 =?utf-8?B?eDB1ZXUzcTNicmUrbko4OEszQ3ZVcmJqc21RQy9oZzJTQ3hxV25sWEVoNnNP?=
 =?utf-8?B?OHIyd3dGVmw1V09GVkNNUFJndFNNUytoZHhML3AwVVJhSi84TWdCTUUzeFhY?=
 =?utf-8?B?VEVIOXU2Ly8yREoyRXg1c3FLVmREUk9yV1dBaG1RT0FhNDNmc3lpL2FTSTNy?=
 =?utf-8?B?UDRUR3VIKzRwaStya28rNXBHeHNKKzdZRXMrYWk0OFFwby9lUTdUR2NHUkFS?=
 =?utf-8?B?N09Db1J6S1NDalk4VU80NHhMRHhYRnc1VURtSGp1eG1wUmJ5Q3BoTld3QVVP?=
 =?utf-8?B?U2xBWXlWa2I2T3VJekYrNnBTNHVRemFMcDBiWlFLV0F5QnZpQ3FCa1RRRUVD?=
 =?utf-8?B?SThsRG9wUjNDUko2cUJldGlyRlE1cVVETEJFS25XQWUrZzZqTFZRM2QyRU5a?=
 =?utf-8?B?WlVzUm03c1daSXFFNGpXbjVMN1dUUVo0YTVPSUpPbDlDUlpVTENHcFAvY1pG?=
 =?utf-8?B?Wnk4dGVqOVFUQk4xSkIwOFBydUROM2gwbWZyV2NFWXN3NWNrODR5VE4rcnQ1?=
 =?utf-8?B?eW9uZ2kzNU5LUXpRVmxQVnJtOXk2RWFoV3RteUdHaWtZVGtUSWFTQWpRUEZR?=
 =?utf-8?B?b3dMc0ZIVVlnTi8yTXdLdFRhLzE1eDhIWWc4clhaS1k2QUVFZGxKYVFkd0Rw?=
 =?utf-8?B?MUtyRmJ6UTJWeE93eXR2Ui9uc0NGYTBsSVZnQXUrYWc2QnJEbUFYSGUydUFF?=
 =?utf-8?B?cm1ZYVlWMnVNcmh5TUpoR3RmOWxpbENNMlZHL2E0TnJDanlibWtuOGFTQTJ5?=
 =?utf-8?B?WUhTWk9DVXBvWGMwWU5TZGViTG1OOTFkcTFsRTZmYlZTQ2lPVlo1YkR1TzJZ?=
 =?utf-8?B?WDduTTg4TnZYaUR0KzdxeW83cWFUQW1FVWpnMDVsTFgyUjVwOVlXdXNMdVow?=
 =?utf-8?B?ZG14TEx6bWt6ZTBzS0hQcEsvRmo2OWpSd2NpQ21DVW5UL3FXUHI5SjdTdThw?=
 =?utf-8?B?N2RnQW9UNXU2UzNKQ2RzV1Q4eTBUN3NEQjduU0c1Q3dXa3NXZFYxeHhtTlJM?=
 =?utf-8?B?cnBVZlEwRFB1eGNuWm1wM1pYdVdLSlRxNU5DN3AyWHkvM1Rka090NjFtb2VG?=
 =?utf-8?B?dXVoVDhmVVYvWnZEVW9iaWtmeTNHdHlJbXRwN0tvYkdXaWpFU3J6ZEdTNTM1?=
 =?utf-8?B?RjRiSFd1dFJXZC9kUmtVQmlOc3JKdTRPWHJ1bWZRUWVLU2k0QTlUOVQ4Vjho?=
 =?utf-8?B?QldGQTBIbE0wTkpZQUtXSk1tdktxMUVNREFCZmYvdytCbDBnRCtleStKSzhU?=
 =?utf-8?B?UExVbmFTYy8xV21Vb1E1bGszR1Q3bzhUdzNLeWd0RFpqTldnTmc1QU1sQW5a?=
 =?utf-8?B?NFBGWDIzNDhPNWlWOHp6WCtyYy9GU1NUMW4wOHR1dndJdGNLbHBUeXVNUGRh?=
 =?utf-8?B?cDM2MWtYUm9ZdzJyamlTOHBSUzJoeU44cGJ1dW04eFJ1RFZiOHBPNUR1ZEdm?=
 =?utf-8?B?dWNKNTRsZ3lIMVBWMzN3N2pVNlNOR0xXdzg0MFB3VVp3RUNBaTZwbzk1RXdo?=
 =?utf-8?B?Y01LVWZuQTRrRmxXYnVuUkt3Kzc3TjgzNjZxSjFicG5sZWRIR3VpTUhaNlhI?=
 =?utf-8?B?Y1J1NzVRVkxuUWxwYm9SU1FHNU1Xb2xHM0ZYMVFodWE1TXFha1lkUXVQTFRI?=
 =?utf-8?B?UGcwWEJQcHF0aXBJbFgwR3lDdWFtc243UXNYUHlDN3dCaWl4WElSZkF0NXhy?=
 =?utf-8?B?V0NnMm5xYUpxbVlCZlhaNU1pVUJTRmhORlNNVHpXVUdocEtPYVdSMTNXbDV1?=
 =?utf-8?B?bmVURmJXSk1VYlhYOVNTOGxqV09CSStzTkI3T0ZXVlRJM3o5RHg4U0RDNGt0?=
 =?utf-8?B?Z2ZaQUdYNTFIVWlIWmpHTzlMNlprYnNsdk9veXJZMjFWRU5wZW16cDVTYjVK?=
 =?utf-8?Q?Kr9oicvMpeHf/Wg+TDwcvgI=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8205.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MHowQXBKLzZDMzZNZ1NqclBiWm04dk1JNHNrc20vZHVrU2FuRGN3UmdvMVlv?=
 =?utf-8?B?bGp4c1JybTJKUG05eXYxU3ZBeWNhbmtEK09FajBqd25zaTBlQjJUZU0vU2FH?=
 =?utf-8?B?aFdmcUxHVW5BcHBPeE5OVHA4S21Ma2Jrck4wRm5iS2lsRlA3d3BMM1Jwd3lB?=
 =?utf-8?B?U3EzSHR6NGV3S1FDNk4rdERMdEZuT1NMeEtBZlVEaWIycVgvQ0FsWFVHcmxr?=
 =?utf-8?B?NUVrWWt4cy9raDNyNzFmOTFjR2dLT3lqVW4xbThiR0lMLzQycll1YkwwVmJZ?=
 =?utf-8?B?ZUhGaE45YnVqS2R0aWFPN1dsNXZiUVBhMUorajZPQ2NEMnVCUHA1L1VIYXI0?=
 =?utf-8?B?YUMvcEdkaXVKSG1ROE1VM21USm05M1Ard2FmZWQ4djBQbVUySlpzOVUzOGl4?=
 =?utf-8?B?aGc1dHhFSUUrQlhwc2p6aHFTUWhUaW94Y29jVGVLbkJhRzNZZExXVVlQVmNm?=
 =?utf-8?B?NkRHZWJRYU53Q0pzVnpuNEtUbXlUa3h3RmJ2cUhuV1JyckJhbTlsRHR0Q0ZP?=
 =?utf-8?B?NEZJUmFIbURRVVp4VHk4OFJqaTl6Y3lEWU56RHpJTmRnOXZzR3FKbUE4aTZv?=
 =?utf-8?B?cnl5ZUpENVJXNVpSUVdzQm5KSW9zY1NNSFFCcElGczJJWTdXaW9KckdtZzBo?=
 =?utf-8?B?enpLZ1AyOXBPK25TS01GQnlNcDI2VEVzMUNKOThxN2hFeHoydXlmVGwrVWhq?=
 =?utf-8?B?Sk13M0tJUktYbitsUzAzZGVxNDhDdER4ZjNBNDJlZEJuMWZGZTBjalZIM1BK?=
 =?utf-8?B?RXVZbUJseUNxdmtUTVE1MXNrMDQ2cmJLTERPSk5SZzF3c3loQ29MS0JQRnlJ?=
 =?utf-8?B?VnF6M2k5aGN3RzZDczNjRmZ3bTMvVGNoaXBoczdweEVoT1pHUEZodytkY1dW?=
 =?utf-8?B?ZTJmTzFsMU0wdStqRVI2SzZuT1ovQy9oTWF4SVpwR2txQ3RkckFtQUF5RE5z?=
 =?utf-8?B?U2xEeU5IclVSTlFORlIxaHVLaHJZNXhNcGdkaVBsVkxJNklkcWZua25rYUVi?=
 =?utf-8?B?VjdvTjI1Nk94M0ZLWUl1U1NXMW42SHMxQm4zYVVxbHhWTFp6blBIN3ROenk3?=
 =?utf-8?B?VEc5c2FTRHE5bE1qQVhvVnhNc0xhTWs0VmEvVEQvSndCemYyKzNBRlR3TlAy?=
 =?utf-8?B?bWxnYmtONWN4L0VvbktVZXMxVEg5dnAvWUt1WGhqaWtyQ0N5djlySGtxalZm?=
 =?utf-8?B?WER2K2RsVTBiekdlc1pGejZHQm9nU2tQRzhFMktnNUtGc1oyU0c1YjBWS0pp?=
 =?utf-8?B?UUpXNGx1WWpBM3VvZUVQaXVSck9LYTRXc2l4OG9MVjNKcnZFZTVoMkFCdzBy?=
 =?utf-8?B?YWc4amhzUkJPYXBUT3hqakpWS0pVZ3VDK01iam9zdTR3UWg2bVJIcm1qblVv?=
 =?utf-8?B?VGxUNnNNZ0ZQeFgvQU8yZnYxWE5haUFlUDBpcllGb0I5R0EvdW50Y3h0ODJi?=
 =?utf-8?B?SWV2UXNUN1JjeTdzMC94RkFLVkZITU0ySzNTUXBxY04yT25Qd3gvMmc4WHd4?=
 =?utf-8?B?Ri9jUXVIWDJoOGRsTUNUV1lMWFRidlEzZmpFSUlTRExzR0RQeUFkNExHY0N6?=
 =?utf-8?B?clI2VlhYczBYUFpFaXlFTThOcWZ1bmZMclNJOWUveExIaEJob0trOXJsbDgz?=
 =?utf-8?B?MTdLZnhUMkM1eUtOS3E5NTRzSG1BSjBsQ1lJSUc2Q3RFdFBHZnVJbjVsR1Zh?=
 =?utf-8?B?Y2pFdXJPVUQ1bTg4M2xYWHdtWTdLK21YdFBNd1JJVzYwVVBOZlgxOWF4WXQ0?=
 =?utf-8?B?WExHazN2RW1NZXRxT0xSRVlMZkFIeDhjdXpuelJ2Qzh1TEtrTTJzZy8rWkwv?=
 =?utf-8?B?V0JGRDBxK1hKVjVodG1vZyswOExzRm1nUlFsa08zdlErb3NKaUNYQnlsdmxZ?=
 =?utf-8?B?SGw0QXlUdDd1c2dXTlNyUVVkcU80Z3FsYjJ5dnM2cVgvRlhTZko1RmJQQXhG?=
 =?utf-8?B?UVJHNHd0aUZtdVFzYzlqZFVtcFBJNUxPYjRrdlRKS1NURDZQc3dEQ2pjNURn?=
 =?utf-8?B?YUZKcXo0MHdoNWRXZ2ZWRUU1Uis1QjZ6SlZGa2Y0cURWWHlJcFNvUzRkU0pN?=
 =?utf-8?B?QWduZVlpeVd6QjNlU1ZOclpUei8rdUllT2ZIdFQrQlpZdXp0Q1lmUXM1THNE?=
 =?utf-8?B?UHo3Y1IyMktYUmg2ZVNhVUtPRnhIbFlQMHlnOTFEMVJFTTg3aTVYbmFRMVll?=
 =?utf-8?B?Znkxd3laMFczVGhxcWhPbEx6ZDd4MG40TnZTaC9GbGFVZkVQcWVrUitteHRh?=
 =?utf-8?B?WDV0ZUY0b1p5dzVIQW5GRUQ3YnlsTnhHdVNlYncrYS9GcVZURjBWbnhDMnlJ?=
 =?utf-8?B?d0FTV1B1OUNjSnJKc3pzd2NJckRweXRFeCtxb05TYkl0RmpUWHhsdz09?=
X-OriginatorOrg: silabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80236c37-7a92-4c55-f253-08de544eee1d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8205.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 15:58:31.4273
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 54dbd822-5231-4b20-944d-6f4abcd541fb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nlVg6foJEgAaG7NCxYNj89x+lQybGBwUfgeA5D/jcciAY9W9T4osTdqwQrlS+VlLb8KZRKaOyjhyj7Ttx2qpQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8811
X-Proofpoint-GUID: yTfjUiuIYdW7msaBVn7H33Mud0SiBwgp
X-Authority-Analysis: v=2.4 cv=M6BA6iws c=1 sm=1 tr=0 ts=69690eab cx=c_pps
 a=+Bba5nuaRI/XgWxKvljhhQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=M51BFTxLslgA:10
 a=i1IsUcr2s-wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=KYCMMmj913KhBj36ahEA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDEyMSBTYWx0ZWRfXxlXlW1Bi8iDX
 AW1poUhiQ5TQa7tTx9gftNq7UFqkffoikftxrqulF7O8ZIIpLRBicMsGaUZCueV5DVNJzcosEzC
 C5OaVxrLolna+URaj2p95wlv8xF0D/DP/Rxk4kHx3qRXATDeUId0M0ki2U+hZvCi/d37BDLaez0
 Pie3FgSB2YhYHx844qM9EUVbHOS7qNFKZtyrzH63GTzXVuHb8AbaonVNlX9tXlZVtOJRnSqelh8
 AQ8NR2jPBla2qKskS6Adi3x1eyrep+gUou9aMyKe+6FPsJZNqOk4lkuyXfCaVsf2EjRyLduPry4
 cI9etYjqmldZ3gnonokJ66g3ow66MQEB9ZvRisn4m87DNTbui6wd6/Towx7gv3zsi2I6dadpsAW
 7m47QLreav5k5bSqqavlmNL2ig9UfSyULYefdJdx3MQTQaJgzECNJAMOOPFqqClWgdBEPN2L/zI
 WL90zhv2ykIDkcHb2Gg==
X-Proofpoint-ORIG-GUID: yTfjUiuIYdW7msaBVn7H33Mud0SiBwgp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_05,2026-01-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 spamscore=0 adultscore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601150121
X-Rspamd-Queue-Id: 956A03F8F4
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
Message-ID-Hash: 52I4H7INHQIVIURS3ZY2ENYIZYAZWKK3
X-Message-ID-Hash: 52I4H7INHQIVIURS3ZY2ENYIZYAZWKK3
X-MailFrom: Damien.Riegel@silabs.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Silicon Labs Kernel Team <linux-devel@silabs.com>, =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v2 00/14] greybus: introduce CPC as transport layer
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/52I4H7INHQIVIURS3ZY2ENYIZYAZWKK3/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGksDQoNClRoaXMgcGF0Y2hzZXQgYnJpbmdzIHN1cHBvcnQgZm9yIFNpbGljb24gTGFicycgQ1BD
IHByb3RvY29sIGFzIHRyYW5zcG9ydA0KbGF5ZXIgZm9yIEdyZXlidXMuIFRoaXMgaXMgaW50cm9k
dWNlZCBhcyBhIG1vZHVsZSB0aGF0IHNpdHMgYmV0d2Vlbg0KR3JleWJ1cyBhbmQgQ1BDIEhvc3Qg
RGV2aWNlIERyaXZlcnMgaW1wbGVtZW50YXRpb25zLCBsaWtlIFNESU8gb3IgU1BJLg0KVGhpcyBw
YXRjaHNldCBpbmNsdWRlcyBTRElPIGFzIHBoeXNpY2FsIGxheWVyLg0KDQogICAgICAgICstLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tKw0KICAgICAg
ICB8ICAgICAgICAgICAgICAgICAgICAgIEdyZXlidXMgICAgICAgICAgICAgICAgICAgICAgIHwN
CiAgICAgICAgKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0rDQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAvfFwNCiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICB8DQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBcfC8NCiAgICAgICAgKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0rDQogICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICBDUEMgICAgICAg
ICAgICAgICAgICAgICAgICAgfA0KICAgICAgICArLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSsNCiAgICAgICAgICAgICAgL3xcICAgICAgICAgICAg
ICAgIC98XCAgICAgICAgICAgICAgICAvfFwNCiAgICAgICAgICAgICAgIHwgICAgICAgICAgICAg
ICAgICB8ICAgICAgICAgICAgICAgICAgfA0KICAgICAgICAgICAgICBcfC8gICAgICAgICAgICAg
ICAgXHwvICAgICAgICAgICAgICAgIFx8Lw0KICAgICAgICAgICstLS0tLS0tLS0tKyAgICAgICAr
LS0tLS0tLS0tKyAgICAgICArLS0tLS0tLS0tLS0rDQogICAgICAgICAgfCAgIFNESU8gICB8ICAg
ICAgIHwgICBTUEkgICB8ICAgICAgIHwgICBPdGhlcnMgIHwNCiAgICAgICAgICArLS0tLS0tLS0t
LSsgICAgICAgKy0tLS0tLS0tLSsgICAgICAgKy0tLS0tLS0tLS0tKw0KDQpDUEMgaW1wbGVtZW50
cyBzb21lIG9mIHRoZSBmZWF0dXJlcyBvZiBVbmlwcm8gdGhhdCBHcmV5YnVzIHJlbGllcyB1cG9u
LA0KbGlrZSByZWxpYWJsZSB0cmFuc21pc3Npb24uIENQQyB0YWtlcyBjYXJlIG9mIGRldGVjdGlu
ZyB0cmFuc21pc3Npb24NCmVycm9ycyBhbmQgcmV0cmFuc21pdCBmcmFtZXMgaWYgbmVjZXNzYXJ5
LCBidXQgdGhhdCBmZWF0dXJlIGlzIG5vdCBwYXJ0DQpvZiB0aGUgUkZDIHRvIGtlZXAgaXQgY29u
Y2lzZS4gVGhlcmUncyBhbHNvIGEgZmxvdy1jb250cm9sDQpmZWF0dXJlLCBwcmV2ZW50aW5nIHNl
bmRpbmcgbWVzc2FnZXMgdG8gYWxyZWFkeSBmdWxsIGNwb3J0cy4NCg0KSW4gb3JkZXIgdG8gaW1w
bGVtZW50IHRoZXNlIGZlYXR1cmVzLCBhIDQtYnl0ZSBoZWFkZXIgaXMgcHJlcGVuZGVkIHRvDQpH
cmV5YnVzIG1lc3NhZ2VzLCBtYWtpbmcgdGhlIHdob2xlIGhlYWRlciAxMiBieXRlcyAoR3JleWJ1
cyBoZWFkZXIgaXMgOA0KYnl0ZXMpLg0KDQpUaGlzIFJGQyBzdGFydHMgYnkgaW1wbGVtZW50aW5n
IGEgc2hpbSBsYXllciBiZXR3ZWVuIHBoeXNpY2FsIGJ1cw0KZHJpdmVycyAobGlrZSBTRElPIGFu
ZCBTUEkpIGFuZCBHcmV5YnVzLCBhbmQgcHJvZ3Jlc3NpdmVseSBhZGQgbW9yZQ0KZWxlbWVudHMg
dG8gaXQgdG8gbWFrZSBpdCB1c2VmdWwgaW4gaXRzIG93biByaWdodC4gRmluYWxseSwgYW4gU0RJ
Tw0KZHJpdmVyIGlzIGFkZGVkIHRvIGVuYWJsZSB0aGUgY29tbXVuaWNhdGlvbiB3aXRoIGEgcmVt
b3RlIGRldmljZS4NCg0KDQpDaGFuZ2VzIGluIHYyOg0KICAtIGFkZHJlc3NlZCByZXZpZXcgY29t
bWVudHMgYW5kIGVycm9ycyByZXBvcnRlZCBieSBrZXJuZWwgYm90DQogIC0gZm9yIFNESU8gZHJp
dmVyLCByZW1vdmUgcGFkZGluZyBiZXR3ZWVuIGhlYWRlcnMgYW5kIHBheWxvYWRzIHdoZW4NCiAg
ICBhZ2dyZWdhdGluZyBwYWNrZXRzIHRvZ2V0aGVyDQoNCkRhbWllbiBSacOpZ2VsICgxMyk6DQog
IGdyZXlidXM6IGNwYzogYWRkIG1pbmltYWwgQ1BDIEhvc3QgRGV2aWNlIGluZnJhc3RydWN0dXJl
DQogIGdyZXlidXM6IGNwYzogaW50cm9kdWNlIENQQyBjcG9ydCBzdHJ1Y3R1cmUNCiAgZ3JleWJ1
czogY3BjOiB1c2Ugc29ja2V0IGJ1ZmZlcnMgaW5zdGVhZCBvZiBnYl9tZXNzYWdlIGluIFRYIHBh
dGgNCiAgZ3JleWJ1czogY3BjOiBwYWNrIGNwb3J0IElEIGluIEdyZXlidXMgaGVhZGVyDQogIGdy
ZXlidXM6IGNwYzogc3dpdGNoIFJYIHBhdGggdG8gc29ja2V0IGJ1ZmZlcnMNCiAgZ3JleWJ1czog
Y3BjOiBpbnRyb2R1Y2UgQ1BDIGhlYWRlciBzdHJ1Y3R1cmUNCiAgZ3JleWJ1czogY3BjOiBhY2Nv
dW50IGZvciBDUEMgaGVhZGVyIHNpemUgaW4gUlggYW5kIFRYIHBhdGgNCiAgZ3JleWJ1czogY3Bj
OiBhZGQgYW5kIHZhbGlkYXRlIHNlcXVlbmNlIG51bWJlcnMNCiAgZ3JleWJ1czogY3BjOiBhY2tu
b3dsZWRnZSBhbGwgaW5jb21pbmcgbWVzc2FnZXMNCiAgZ3JleWJ1czogY3BjOiB1c2UgaG9sZGlu
ZyBxdWV1ZSBpbnN0ZWFkIG9mIHNlbmRpbmcgb3V0IGltbWVkaWF0ZWx5DQogIGdyZXlidXM6IGNw
YzogaG9ub3VyIHJlbW90ZSdzIFJYIHdpbmRvdw0KICBncmV5YnVzOiBjcGM6IGxldCBob3N0IGRl
dmljZSBkcml2ZXJzIGRlcXVldWUgVFggZnJhbWVzDQogIGdyZXlidXM6IGNwYzogYWRkIHByaXZh
dGUgZGF0YSBwb2ludGVyIGluIENQQyBIb3N0IERldmljZQ0KDQpHYWJyaWVsIEJlYXVsaWV1ICgx
KToNCiAgZ3JleWJ1czogY3BjOiBhZGQgQ1BDIFNESU8gaG9zdCBkcml2ZXINCg0KIE1BSU5UQUlO
RVJTICAgICAgICAgICAgICAgICAgICB8ICAgNiArDQogZHJpdmVycy9ncmV5YnVzL0tjb25maWcg
ICAgICAgIHwgICAyICsNCiBkcml2ZXJzL2dyZXlidXMvTWFrZWZpbGUgICAgICAgfCAgIDIgKw0K
IGRyaXZlcnMvZ3JleWJ1cy9jcGMvS2NvbmZpZyAgICB8ICAyMiArKw0KIGRyaXZlcnMvZ3JleWJ1
cy9jcGMvTWFrZWZpbGUgICB8ICAgOSArDQogZHJpdmVycy9ncmV5YnVzL2NwYy9jcGMuaCAgICAg
IHwgIDc1ICsrKysrDQogZHJpdmVycy9ncmV5YnVzL2NwYy9jcG9ydC5jICAgIHwgMTEyICsrKysr
KysNCiBkcml2ZXJzL2dyZXlidXMvY3BjL2hlYWRlci5jICAgfCAxMzYgKysrKysrKysrDQogZHJp
dmVycy9ncmV5YnVzL2NwYy9oZWFkZXIuaCAgIHwgIDU1ICsrKysNCiBkcml2ZXJzL2dyZXlidXMv
Y3BjL2hvc3QuYyAgICAgfCAzMTMgKysrKysrKysrKysrKysrKysrKw0KIGRyaXZlcnMvZ3JleWJ1
cy9jcGMvaG9zdC5oICAgICB8ICA2MyArKysrDQogZHJpdmVycy9ncmV5YnVzL2NwYy9wcm90b2Nv
bC5jIHwgMTY4ICsrKysrKysrKysrDQogZHJpdmVycy9ncmV5YnVzL2NwYy9zZGlvLmMgICAgIHwg
NTMzICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KIDEzIGZpbGVzIGNoYW5nZWQs
IDE0OTYgaW5zZXJ0aW9ucygrKQ0KIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dyZXlidXMv
Y3BjL0tjb25maWcNCiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncmV5YnVzL2NwYy9NYWtl
ZmlsZQ0KIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dyZXlidXMvY3BjL2NwYy5oDQogY3Jl
YXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3JleWJ1cy9jcGMvY3BvcnQuYw0KIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBkcml2ZXJzL2dyZXlidXMvY3BjL2hlYWRlci5jDQogY3JlYXRlIG1vZGUgMTAwNjQ0
IGRyaXZlcnMvZ3JleWJ1cy9jcGMvaGVhZGVyLmgNCiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVy
cy9ncmV5YnVzL2NwYy9ob3N0LmMNCiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncmV5YnVz
L2NwYy9ob3N0LmgNCiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncmV5YnVzL2NwYy9wcm90
b2NvbC5jDQogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3JleWJ1cy9jcGMvc2Rpby5jDQoN
Ci0tIA0KMi41Mi4wDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmdyZXlidXMtZGV2IG1haWxpbmcgbGlzdCAtLSBncmV5YnVzLWRldkBsaXN0cy5saW5h
cm8ub3JnClRvIHVuc3Vic2NyaWJlIHNlbmQgYW4gZW1haWwgdG8gZ3JleWJ1cy1kZXYtbGVhdmVA
bGlzdHMubGluYXJvLm9yZwo=
