Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 002FBD258BC
	for <lists+greybus-dev@lfdr.de>; Thu, 15 Jan 2026 16:59:15 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 214CA401B8
	for <lists+greybus-dev@lfdr.de>; Thu, 15 Jan 2026 15:59:15 +0000 (UTC)
Received: from mx0b-0024c301.pphosted.com (mx0b-0024c301.pphosted.com [148.163.153.153])
	by lists.linaro.org (Postfix) with ESMTPS id 4C7FF401B8
	for <greybus-dev@lists.linaro.org>; Thu, 15 Jan 2026 15:58:47 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=silabs.com header.s=pps12202023 header.b=C2xHk8Fb;
	dkim=pass header.d=silabs.com header.s=selector1 header.b=LFwYb6NS;
	spf=pass (lists.linaro.org: domain of Damien.Riegel@silabs.com designates 148.163.153.153 as permitted sender) smtp.mailfrom=Damien.Riegel@silabs.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1");
	dmarc=pass (policy=reject) header.from=silabs.com
Received: from pps.filterd (m0101742.ppops.net [127.0.0.1])
	by mx0a-0024c301.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60FFlYMt459372;
	Thu, 15 Jan 2026 09:58:37 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps12202023;
	 bh=71upq2QYWAgfoSvhqwk+YTjDWSiFCFSS4hYMQNHQw2U=; b=C2xHk8FbyvIm
	FizaDyM34cVYPtkhAHWUGFWcbbkDuvRVEaelvzUDDbwNrx1TqjcQzTsU9+MeBd78
	D+e/vTH9WtHCHvuPtv7Qjh4IxfAhh+mZVW82VKBmZKOOv/hDd6OtYDkZ2D7kdtdl
	zRGTPCno8zeVQHbX4eHuktvz2blEYCq/T8Y70IUPfhexwUhl5cpMp0xO1OMMvThK
	Dkv+Lfkl9Grxm4raNsToR5HpC2BBeh1bEoCuPEU/GECy8snN63gtWj5DoRerEAvx
	Myfh0mTxeNBAp1zsSTZYwNiaCP9jBodBexjzC31Obgui+hHcAiPriGMQUAavIA/r
	GeHSOuuCvA==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11021127.outbound.protection.outlook.com [52.101.52.127])
	by mx0a-0024c301.pphosted.com (PPS) with ESMTPS id 4bq36kr0ut-4
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 15 Jan 2026 09:58:36 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f6dcihYBeMWMD/5LdptkOXCg+OdvdSsxLJCahNMopRFUmX4ByJTKENn29dNc8hA2af6RfJ3uaErah1ugXETU1pz0JCBhHsS8YhkKUG/OL1gTolh6eRSka0otFsROxz5y0Qn2ZwD9KEmA8D2/LOUUdOrcTabdcFj061SaJf6CAHvF4mslnlykSDTvq23x7E09QrHELd64uZtXiFXVxGnfaGEMg0Rs3oCxOqPT3cR+cz1SEwxtFJw9xAfcMq8RMlFaWL+iTwDexN3w3Ifbka292aFcA+fQ57Y+TP1lKLRCZbYDsLed1f1/84Vlqw4zsPDOx1UuGbMCZvJYevRJUiOPAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=71upq2QYWAgfoSvhqwk+YTjDWSiFCFSS4hYMQNHQw2U=;
 b=ZC5XFfK03CFZa+uK2IX3tD/tkryxWGRCp/j/sH0OyMTtx8xj9XABYSzYRBBsEo8WaDR+ff1gcECf6GFyEJ1tOqhDdTb376Bl1dpcEbjbtbT3Y2iB3bYPA1S/Qv0cL7k479JprIF0MZSMMTt0ZlVBzVPotkpo286MkQmoTJIHHwfiVMSBa4biYgc8adgaZXMCMUOvoJdEAw2lj7LuoZ6hMjIJrMybsm5k/NAM00xMHEmGSgLvEltO4SUVbllnMbZ8cZwFNds/CdBbmPktf5FCwjKDTVcEkhHn/yqkAzBW/zw9ZnJ2+M0Q25eiB/DR31m+iGJ+AG+hyU105NXmct3obw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silabs.com; dmarc=pass action=none header.from=silabs.com;
 dkim=pass header.d=silabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=71upq2QYWAgfoSvhqwk+YTjDWSiFCFSS4hYMQNHQw2U=;
 b=LFwYb6NSpEJxWCtfHEI8kE8eXFccDhMZ8K8UHp1iHA4ao6Yz/DQbeAVz9dT6vxcKpPuaJrAOtaKHYkD4u9Qn6CyYX6jOF1mRfOPcGFQPJQmijzg2U/XRuT8dQisnBmIBT9XaWJrSynCMT3DRQqU++PYplpypnh8Qk7dVDsZRc7U=
Received: from DS0PR11MB8205.namprd11.prod.outlook.com (2603:10b6:8:162::17)
 by SA1PR11MB8811.namprd11.prod.outlook.com (2603:10b6:806:467::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Thu, 15 Jan
 2026 15:58:34 +0000
Received: from DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::2de6:bc88:2af7:3583]) by DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::2de6:bc88:2af7:3583%3]) with mapi id 15.20.9520.005; Thu, 15 Jan 2026
 15:58:34 +0000
From: =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
To: greybus-dev@lists.linaro.org, Johan Hovold <johan@kernel.org>,
        Alex Elder <elder@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org
Date: Thu, 15 Jan 2026 10:57:56 -0500
Message-ID: <20260115155808.36102-4-damien.riegel@silabs.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260115155808.36102-1-damien.riegel@silabs.com>
References: <20260115155808.36102-1-damien.riegel@silabs.com>
X-ClientProxiedBy: YQZPR01CA0025.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:86::22) To DS0PR11MB8205.namprd11.prod.outlook.com
 (2603:10b6:8:162::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8205:EE_|SA1PR11MB8811:EE_
X-MS-Office365-Filtering-Correlation-Id: b3535f02-1300-4e3a-4cc4-08de544eefa1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?MUF6MFNEY1o2OWY1T2x6NkNJNkpWamhHYUpid0grYkdScThURnlFTEVHSDh1?=
 =?utf-8?B?elpJZHFpWnJqMG00K2dYcGVScWdpV0VSOW1ERkxrQit5V2VMdGNHRWZqRnpk?=
 =?utf-8?B?VXl0a3NtbmpZS1h1NDYzVng5azR4WUd0a0hCSzlSL2pBWTBDejJtOXJ2QWtD?=
 =?utf-8?B?TzY3eEphbVMvcHRXYXFFdE1nREY1VHhOMUFudm1rSFN1T2R3RmdMOUZUREE3?=
 =?utf-8?B?NExkQ0ZzL3EwQnhObW1wa3k3MXdLb0NZelpHNDhSWEduVWVndVd1dDRaN2dP?=
 =?utf-8?B?SjF5RWZvWkxlVG5IdUdOclZka3ZMWmJnNW03UzAwQ3Q5bDN2Yk1tNnNFcGdJ?=
 =?utf-8?B?WU1lK3JjMG91ZGF2SmFPSisxWVEvNGtJc092V2Q5czlHOXBqY1BvYk5pelJy?=
 =?utf-8?B?NUc4QzA5Um9DS0ZPcFBTVDZHTWg1NlNCckp6b0NzU01tcEtYZDZ5eElYT29Q?=
 =?utf-8?B?d0tVVVNoZWc0OFZqY1hMdm5YUTgzZW0vYTdlT2dlNlRDY0tEeGM5TDNPZHdL?=
 =?utf-8?B?bklaM05vY0hLQ3c5RVd5ZDZ3bHRnbXl0YkR2MWtiY1gxTFN1R210N0pKTmpj?=
 =?utf-8?B?QU83YXovQjd0dmUxekFIdHAyaU15b3ZUVDRGem4xTEg5VS8xZkxyZ21LUkhV?=
 =?utf-8?B?MFV2cU4zWDNIS3pxaGVxRE82VVBLUG5wbEFyUktvRkEwUlJqZ3hQRm5aNW5P?=
 =?utf-8?B?TDBadyttZnhHMC81d0paQnFPRWNGdmlqZzVqTlZIbzhyQ3dsOGc3QmJDMXRB?=
 =?utf-8?B?T1hUeUQ2V1ZBekNOYWkvWEs5eGMxbjFLZGlUR0ZvRjEwZ2pQck5SUzlPSkFZ?=
 =?utf-8?B?clRjdFJFMEZYekFnMGNIa2IzK2NUbi9taGxLUnhBclEza3Y2RThvbERwRTBh?=
 =?utf-8?B?ZStxR2tvcW9GUlBLYVVWTGZXNnBBc2w0aGl5S1pud1dnT3ZOaTkxMzdORXo1?=
 =?utf-8?B?eks5M0o3bHhqdGYyZnFWaVUrMGxSUHBFVjIzOE90RERMa0hxUkhhOU8va05x?=
 =?utf-8?B?OUdibHMyL0I4KzJkTVpabWcrUU1tWno4QVpkM1MwVno2ZWkzK0l4QjZuY0Rx?=
 =?utf-8?B?YlNtSjc0TFlRczUwaTJib3NlV3hteTJmQitmcVdYS0VTT3hscUlMWDlZV05j?=
 =?utf-8?B?Y2RXYjFhZlkvaEZ1Z2RMOTJCMzkzL0VuZENkYWJ2VThob1F4NGF1TndXYWVQ?=
 =?utf-8?B?bnRrdW5aczBnT2ZXQ0xBL2dmb3RlTmtYWGcweDJMMVJOdFRUQi9nS3A4Z1lh?=
 =?utf-8?B?bGt5OHNtQ1RPSGxzOHNKaGFCZU9qdW1QNnpPdUI1cHc2elIxb1JxSzR2aWN1?=
 =?utf-8?B?S0VBdlZFM0wvbFpRK1R3dTdVUC93L0JEK3YrTm0wM2FYM3hmQXgxenNaQjlz?=
 =?utf-8?B?ZnJXODMvbDRyM0RXSzVqRUFkaG5xMkZrdzVJZkMyYTVXQ3hWeUpFc011Z1hT?=
 =?utf-8?B?UnBRQkUxblNacUxzL3BZNkczcmt4Vk4zVm1sd0tkeFhXOHpid3RnTTJGWU5o?=
 =?utf-8?B?UFRCaFFaUnN3LzgveThwTGZnM0hQYk9XSXczTm56eWxwOWlsLzJFQmlRRUp5?=
 =?utf-8?B?NktjalZqY1BCSDAya3hHNTVPVCtHU3FpUWM0RkltMEhIMGpuM3dTcEJwdlBX?=
 =?utf-8?B?QldzVHo2N1Vpb2NoWVBWYkIyWGRud1lGSXBvcEVpT1J3WHY3aWczcThJWUl2?=
 =?utf-8?B?RzA1QVNoZUEyYmlOVDgrTGI4TWtZRHJ6WVVPWU85R0hQWm5hdVV4dWt3QXE2?=
 =?utf-8?B?KzMrOTJvMnZBK2c4MTZ0SGNVamtHNjNyYmJIaUxyRFQ3NG5wNm4rR3lqZGRB?=
 =?utf-8?B?RmtCOE16L3M1bTd4UUE3bkl0VFVEY0Vpa1VLUTNLU1Bmcmx3cEc1WWFuR0VL?=
 =?utf-8?B?emZLK250azFOVjNnaXlxVzFEMjFSdnhTdElUWmQrcHdqajhXY254K29RUW9q?=
 =?utf-8?B?U3lnZEk2TW5UVW9IRGZidVdxYnZPK3k2a0lkMStWd0UxdUpWeEpGcXNTWWNi?=
 =?utf-8?B?WlZGSGRyTkdjOVptRG90OFhzbFdXUE5kdHB6SnJqSlZSckFkMDE3cTBTbEZ6?=
 =?utf-8?B?SHYwWllpaWJRODNJRWo0R1VFU3kzQVc4YXhwV3lhTW5YTWFvRmZqTGxaVXA5?=
 =?utf-8?B?bWp1b3pQejRvSFQ0eWFqbmRJZmpZK3diNHJjUkxEWHBjSm1vUFdSYzZvbkwz?=
 =?utf-8?Q?x+HvbTLOJuSAekoQDmJ6aQA=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8205.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?L3hNcmkxdTZSU3I1OTlZd3hBcXVHaEtaQkk4alZ4UkROM2UzNnZsYnp5S2NI?=
 =?utf-8?B?V3hZTTVJRGZQcU4xMXE3MFdvT2llajV1NERpOC9hY1pyVTBYeENRVS9zU0Ji?=
 =?utf-8?B?OEV5M0Z0RzE1WEloU3k4NXg2MkRmRmZPWjRiOHM3UHJTVCt5QWd5TCtScmdz?=
 =?utf-8?B?TzdJaHhQOGxkdFBoMTdXZFFTTXlmcDZhZXdXZlFJeWl5L2NoMmJGUE5VdmY4?=
 =?utf-8?B?N0VLYkNtcXlLZyttMHp5ZmV3UytoV2hLTUdmSFZaRm1yUWNsVVl6b003djZL?=
 =?utf-8?B?L09XWDFlYzIxSkdrcmRvNEdrNCszUlFUWjBXeG9LVkV0QUE3dU9QM0M1dGRP?=
 =?utf-8?B?MXRxWHl0MUpqK3h2NTVtQ1VtdDh0emFRaTlVb1BZeFZEK3NUamVBa2VqbDlO?=
 =?utf-8?B?OVNFRGJ2VUUvRlBvWWtzTkNuRENIQUw0OUsrRmMxSVRrU0FQZys2WU9iYndP?=
 =?utf-8?B?ZDlVY0N4VXVoSGVUWTNmTXBKRU41N2hURDk1VHpoT0s0T0hHdXVFYm5EcUpL?=
 =?utf-8?B?MlZyTFVzaCt4OStBMURCNkxBb0kvWmIxeFBUWWR6aEdMbVo1RXFrUFp5Mzls?=
 =?utf-8?B?OXlhTXhCUmJEclNOR1dnWVdaYmwrc0tiUldPRU5Vb0kwVVkwbGNHQktQR0Ir?=
 =?utf-8?B?YzAvQnM5SnpUTS9YTjFpSi9ueDliTGZqNWNiVWtoUXNIWEZjZjBWRTVMUVRI?=
 =?utf-8?B?Y1JYRkhpaDkrSlRUZDlRcDd1ZlRiRWYzSVBzbjFLYjlNRFQrcWMyMUNUdElv?=
 =?utf-8?B?NTA3bERBdGpySVBWY2tsOWVPNjZCdE9pd1htcU9GL0lrM29IUWFDcXEzWkJX?=
 =?utf-8?B?aWQxNmdocGY4YTVDOW5haXJ3ZjBvRjg2L3Y1REs0Nm0vS0RTZ0dRR0pFdld2?=
 =?utf-8?B?N3ladkdwbUhObXNmUGk5SXZrRzVvWHRvaUhNc2JkNndvS1lBc3ZsVWxEdlk4?=
 =?utf-8?B?aUFrRW12VGlLZFpBdkl6aklvV1pFeWlPdzIxS2FvdnVDU0o2Y1JEeEdtNWgx?=
 =?utf-8?B?WHdqaUlYMWtCMEtjMjFkNUcyYXFJY2Y1aHM2UnlRb01NeXFVM21lSWgxVE9J?=
 =?utf-8?B?dTFFK2h3dG55RjJFbS81NTlrSDZqSFRETEZLR0swK2ZSSHB1TnZic21zdk1T?=
 =?utf-8?B?QTV0dWhQNlo4ZzhsMDdnek1DQ0VyNnlRelowaEFiVmswa1FxT29hcVdCTEYy?=
 =?utf-8?B?bDhxV1VPY0ZtWEhVa0c2cVRNbkhmSnZxYnZvVHVkZUJlK2dzb2s0RDBmZ3kv?=
 =?utf-8?B?cXBWTHdOSVZ0R0tiRlNQQk55aHdIcEVzQnk3WHVYNGoyalhKcWIxRXkrZnc5?=
 =?utf-8?B?SGhDQWNPMEJBSS82WnRLYkYzRlB3VHZRMmc3V2k1d0E3VHZIQ3psMzNVdVF5?=
 =?utf-8?B?V01XT2hDbzBzaHZ1bjVXaVVVa0FJOXdwYXFMWFgyTVdYcjdNMGpnckpUbG1C?=
 =?utf-8?B?eHVvZ0RjRTdUR0dMSFhQM1RUZXl1SGJHNUhmZjV4RWZXMVY0ellNaVpmd2RS?=
 =?utf-8?B?V2k3UXVodzBNMjFvYk5IZW10ZkZXK2pyZWc2cHRWakJuK0hlYWUwLytSYkV0?=
 =?utf-8?B?Qy9qRm1NMHZGOXBPd2RRWU10NGZiQmw3VCtoYld0VHlIQ1lNamxQYXlFV1RT?=
 =?utf-8?B?L2xaamlqZXZ0RDNncy9XdHFxWXFiVFQ1aFNvZjNBRjVLTGRPM2ZKZENMdDVB?=
 =?utf-8?B?RE1MVHZWUTJodE9IZWRWbnFtelVOT3RKTzUwclpBb0MvQ2dMNkIrcS8zN1pQ?=
 =?utf-8?B?VGRnbC8waHpYU3hjbU9TZ0R5ZGV5ZXJCdW02MCtSYlUxby8xM1kwQS8xQ2lJ?=
 =?utf-8?B?emh4dnBpOGJyMUtUa29INzhqN3ZxZXVCamFka09MQXJyY3drOHJ0SlhHMmNQ?=
 =?utf-8?B?UXZtTG9JWnhvZE9TRTVjMmNKRE1pUFNhK2F3ZExLVkJBS2RSNkkwNndNNzht?=
 =?utf-8?B?R2sxNU5ZRmFnbWRaZ2ZvZnBJVzg3WmFoMnUyWEVZYy9HbXFTSDJHNzZBS3o2?=
 =?utf-8?B?YmdIMzNnUjNpNUszR2pVMDUyV1g2N2p2UisxaThCYmpncHc1NVRxaHVGa1NR?=
 =?utf-8?B?ZVRENVM1Zjl3UEx0dUhqdW5sckN6Z2JoVndLS2p2djNaWGR1VTM5TXg5b3hp?=
 =?utf-8?B?OCtYRXhLRklFdEcwWEhYRkp3QVZNVUVmZ3JyT1hCajhyTWtabGx2R1d4d3dw?=
 =?utf-8?B?bEplYUNJRWk1Wk5uZEUzUVZ0Y3FDSWRkWk5xVjRjTmZ3RUl1VC9sT1JIY0M5?=
 =?utf-8?B?ZHBUaElyWTBMUHNPcE1XOEFSTVphSkJLZGtBdmtoZDdBYnNqc0Ywa1FVbmRr?=
 =?utf-8?B?bU5COVZsMW9GblFCVXM5a0RYQmJWM2F6MWtiRG11UlZUdzhFV1RGdz09?=
X-OriginatorOrg: silabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3535f02-1300-4e3a-4cc4-08de544eefa1
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8205.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 15:58:33.9116
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 54dbd822-5231-4b20-944d-6f4abcd541fb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5Z50cYTs5QwsBR564MGXjbXn/oGeM8UQKPm/FaWrI0CIgDD+ScpoCPn3QofsT+pMp0/5/Gy9EEAE23CxlLysFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8811
X-Proofpoint-GUID: 6qTsQJFI1zE-TW7KYEYqXCMz7-z_hS6S
X-Authority-Analysis: v=2.4 cv=M6BA6iws c=1 sm=1 tr=0 ts=69690ead cx=c_pps
 a=+Bba5nuaRI/XgWxKvljhhQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=M51BFTxLslgA:10
 a=i1IsUcr2s-wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=2AEO0YjSAAAA:8
 a=UI2V7ICqOKO9W4d5kokA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDEyMSBTYWx0ZWRfX6pOSS9wv5qT6
 ZqwJeqbtRp9+FMbzTSDNSBkJkK1oSYmpAMd1QceR1vMRP3Ib8nCrh/kldCMOLhhWGTohqTqzAxI
 CdHi4+c9MHOgrNndw5E6N8FY/0K9YVA+CHVgR/XbeB6vfA+KI0ihsVGTMoREdRhV/yWQlvnDC0v
 9iwyAlul5ooKkgAk1++25VJ5RuGkg9TDSO2YHqeU2snIeRA9Vq7t3mMkV+z56agZ10ViOsgupUI
 kSYi9IiM96DbVpk1PtBVS/BhvAdaIlxExz2KkZlmRTl10XTiKaiQ8GV8jeB7dJVa9C9mV/8dW4z
 TUZBPgk2uPOG2PyljxWTirvfuBp0gJRbaEI0FThHGhn3Jy4CU/6/Yz2EG3HVfVuz9tzUfidhGqF
 BVYQ4bGzpCZt+jSdAwBU8GLKmjnwSNJHurZQOv7FR/iK9d6ST5RV8ZlN8jtxl1UOg3F6OQgKWjn
 UbQU3JLHRCtGLXYjWgg==
X-Proofpoint-ORIG-GUID: 6qTsQJFI1zE-TW7KYEYqXCMz7-z_hS6S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_05,2026-01-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 spamscore=0 adultscore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601150121
X-Rspamd-Queue-Id: 4C7FF401B8
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
Message-ID-Hash: JBZ3O6RMRW6KU5AQFMXPH73XRDZK5KJ3
X-Message-ID-Hash: JBZ3O6RMRW6KU5AQFMXPH73XRDZK5KJ3
X-MailFrom: Damien.Riegel@silabs.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Silicon Labs Kernel Team <linux-devel@silabs.com>, =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v2 03/14] greybus: cpc: use socket buffers instead of gb_message in TX path
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/JBZ3O6RMRW6KU5AQFMXPH73XRDZK5KJ3/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

Q1BDIGNvbWVzIHdpdGggaXRzIG93biBoZWFkZXIsIHRoYXQgaXMgbm90IHlldCBpbXBsZW1lbnRl
ZC4gV2l0aG91dCBza2IsDQp0aGUgQ1BDIGhvc3QgZGV2aWNlIGRyaXZlcnMgaGF2ZSB0byBnZXQg
dHdvIHBvaW50ZXJzIHRvIGdldCBhIGZ1bGwNCnBhY2tldDogb25lIHBvaW50ZXIgdG8gdGhlIENQ
QyBoZWFkZXIgYW5kIG9uZSBwb2ludGVyIHRvIHRoZSBHQiBtZXNzYWdlLg0KSW4gb3JkZXIgdG8g
bWFrZSB0aGVpciBpbXBsZW1lbnRhdGlvbnMgc2ltcGxlciwgY29udmVydCB0aGUgR0IgbWVzc2Fn
ZQ0KaW50byBhbiBTS0IuDQoNClNpZ25lZC1vZmYtYnk6IERhbWllbiBSacOpZ2VsIDxkYW1pZW4u
cmllZ2VsQHNpbGFicy5jb20+DQotLS0NCiBkcml2ZXJzL2dyZXlidXMvY3BjL2NwYy5oICAgfCAx
MSArKysrKysrKystDQogZHJpdmVycy9ncmV5YnVzL2NwYy9jcG9ydC5jIHwgMTEgKysrKysrKyst
LQ0KIGRyaXZlcnMvZ3JleWJ1cy9jcGMvaG9zdC5jICB8IDQxICsrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKystLS0NCiBkcml2ZXJzL2dyZXlidXMvY3BjL2hvc3QuaCAgfCAgNyArKysr
LS0tDQogNCBmaWxlcyBjaGFuZ2VkLCA2MSBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQ0K
DQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncmV5YnVzL2NwYy9jcGMuaCBiL2RyaXZlcnMvZ3JleWJ1
cy9jcGMvY3BjLmgNCmluZGV4IDM5MTVhN2ZiYzRmLi5kOWY4ZjYwOTEzYSAxMDA2NDQNCi0tLSBh
L2RyaXZlcnMvZ3JleWJ1cy9jcGMvY3BjLmgNCisrKyBiL2RyaXZlcnMvZ3JleWJ1cy9jcGMvY3Bj
LmgNCkBAIC0yNCw2ICsyNCwxNSBAQCBzdHJ1Y3QgY3BjX2Nwb3J0IHsNCiBzdHJ1Y3QgY3BjX2Nw
b3J0ICpjcGNfY3BvcnRfYWxsb2ModTE2IGNwb3J0X2lkLCBnZnBfdCBnZnBfbWFzayk7DQogdm9p
ZCBjcGNfY3BvcnRfcmVsZWFzZShzdHJ1Y3QgY3BjX2Nwb3J0ICpjcG9ydCk7DQogDQotaW50IGNw
Y19jcG9ydF9tZXNzYWdlX3NlbmQoc3RydWN0IGNwY19jcG9ydCAqY3BvcnQsIHN0cnVjdCBnYl9t
ZXNzYWdlICptZXNzYWdlLCBnZnBfdCBnZnBfbWFzayk7DQoraW50IGNwY19jcG9ydF90cmFuc21p
dChzdHJ1Y3QgY3BjX2Nwb3J0ICpjcG9ydCwgc3RydWN0IHNrX2J1ZmYgKnNrYik7DQorDQorc3Ry
dWN0IGNwY19za2JfY2Igew0KKwlzdHJ1Y3QgY3BjX2Nwb3J0ICpjcG9ydDsNCisNCisJLyogS2Vl
cCB0cmFjayBvZiB0aGUgR0IgbWVzc2FnZSB0aGUgc2tiIG9yaWdpbmF0ZXMgZnJvbSAqLw0KKwlz
dHJ1Y3QgZ2JfbWVzc2FnZSAqZ2JfbWVzc2FnZTsNCit9Ow0KKw0KKyNkZWZpbmUgQ1BDX1NLQl9D
QihfX3NrYikgKChzdHJ1Y3QgY3BjX3NrYl9jYiAqKSYoKF9fc2tiKS0+Y2JbMF0pKQ0KIA0KICNl
bmRpZg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3JleWJ1cy9jcGMvY3BvcnQuYyBiL2RyaXZlcnMv
Z3JleWJ1cy9jcGMvY3BvcnQuYw0KaW5kZXggODhiZGIyZjgxODIuLmVkMGI4ZThiMGQ3IDEwMDY0
NA0KLS0tIGEvZHJpdmVycy9ncmV5YnVzL2NwYy9jcG9ydC5jDQorKysgYi9kcml2ZXJzL2dyZXli
dXMvY3BjL2Nwb3J0LmMNCkBAIC0zMSw3ICszMSwxNCBAQCB2b2lkIGNwY19jcG9ydF9yZWxlYXNl
KHN0cnVjdCBjcGNfY3BvcnQgKmNwb3J0KQ0KIAlrZnJlZShjcG9ydCk7DQogfQ0KIA0KLWludCBj
cGNfY3BvcnRfbWVzc2FnZV9zZW5kKHN0cnVjdCBjcGNfY3BvcnQgKmNwb3J0LCBzdHJ1Y3QgZ2Jf
bWVzc2FnZSAqbWVzc2FnZSwgZ2ZwX3QgZ2ZwX21hc2spDQorLyoqDQorICogY3BjX2Nwb3J0X3Ry
YW5zbWl0KCkgLSBUcmFuc21pdCBza2Igb3ZlciBjcG9ydC4NCisgKiBAY3BvcnQ6IGNwb3J0Lg0K
KyAqIEBza2I6IHNrYiB0byBiZSB0cmFuc21pdHRlZC4NCisgKi8NCitpbnQgY3BjX2Nwb3J0X3Ry
YW5zbWl0KHN0cnVjdCBjcGNfY3BvcnQgKmNwb3J0LCBzdHJ1Y3Qgc2tfYnVmZiAqc2tiKQ0KIHsN
Ci0JcmV0dXJuIGNwb3J0LT5jcGNfaGQtPmRyaXZlci0+bWVzc2FnZV9zZW5kKGNwb3J0LT5jcGNf
aGQsIGNwb3J0LT5pZCwgbWVzc2FnZSwgZ2ZwX21hc2spOw0KKwlzdHJ1Y3QgY3BjX2hvc3RfZGV2
aWNlICpjcGNfaGQgPSBjcG9ydC0+Y3BjX2hkOw0KKw0KKwlyZXR1cm4gY3BjX2hkX3NlbmRfc2ti
KGNwY19oZCwgc2tiKTsNCiB9DQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncmV5YnVzL2NwYy9ob3N0
LmMgYi9kcml2ZXJzL2dyZXlidXMvY3BjL2hvc3QuYw0KaW5kZXggOTg1NjZjZTc3NTUuLmVlMDkw
ZGQzMDk3IDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncmV5YnVzL2NwYy9ob3N0LmMNCisrKyBiL2Ry
aXZlcnMvZ3JleWJ1cy9jcGMvaG9zdC5jDQpAQCAtNiw2ICs2LDcgQEANCiAjaW5jbHVkZSA8bGlu
dXgvZXJyLmg+DQogI2luY2x1ZGUgPGxpbnV4L2dyZXlidXMuaD4NCiAjaW5jbHVkZSA8bGludXgv
bW9kdWxlLmg+DQorI2luY2x1ZGUgPGxpbnV4L3NrYnVmZi5oPg0KIA0KICNpbmNsdWRlICJjcGMu
aCINCiAjaW5jbHVkZSAiaG9zdC5oIg0KQEAgLTM4LDYgKzM5LDggQEAgc3RhdGljIGludCBjcGNf
aGRfbWVzc2FnZV9zZW5kKHN0cnVjdCBjcGNfaG9zdF9kZXZpY2UgKmNwY19oZCwgdTE2IGNwb3J0
X2lkLA0KIAkJCSAgICAgICBzdHJ1Y3QgZ2JfbWVzc2FnZSAqbWVzc2FnZSwgZ2ZwX3QgZ2ZwX21h
c2spDQogew0KIAlzdHJ1Y3QgY3BjX2Nwb3J0ICpjcG9ydDsNCisJc3RydWN0IHNrX2J1ZmYgKnNr
YjsNCisJdW5zaWduZWQgaW50IHNpemU7DQogDQogCWNwb3J0ID0gY3BjX2hkX2dldF9jcG9ydChj
cGNfaGQsIGNwb3J0X2lkKTsNCiAJaWYgKCFjcG9ydCkgew0KQEAgLTQ1LDcgKzQ4LDE4IEBAIHN0
YXRpYyBpbnQgY3BjX2hkX21lc3NhZ2Vfc2VuZChzdHJ1Y3QgY3BjX2hvc3RfZGV2aWNlICpjcGNf
aGQsIHUxNiBjcG9ydF9pZCwNCiAJCXJldHVybiAtRUlOVkFMOw0KIAl9DQogDQotCXJldHVybiBj
cGNfY3BvcnRfbWVzc2FnZV9zZW5kKGNwb3J0LCBtZXNzYWdlLCBnZnBfbWFzayk7DQorCXNpemUg
PSBzaXplb2YoKm1lc3NhZ2UtPmhlYWRlcikgKyBtZXNzYWdlLT5wYXlsb2FkX3NpemU7DQorCXNr
YiA9IGFsbG9jX3NrYihzaXplLCBnZnBfbWFzayk7DQorCWlmICghc2tiKQ0KKwkJcmV0dXJuIC1F
Tk9NRU07DQorDQorCS8qIEhlYWRlciBhbmQgcGF5bG9hZCBhcmUgYWxyZWFkeSBjb250aWd1b3Vz
IGluIEdyZXlidXMgbWVzc2FnZSAqLw0KKwlza2JfcHV0X2RhdGEoc2tiLCBtZXNzYWdlLT5idWZm
ZXIsIHNpemVvZigqbWVzc2FnZS0+aGVhZGVyKSArIG1lc3NhZ2UtPnBheWxvYWRfc2l6ZSk7DQor
DQorCUNQQ19TS0JfQ0Ioc2tiKS0+Y3BvcnQgPSBjcG9ydDsNCisJQ1BDX1NLQl9DQihza2IpLT5n
Yl9tZXNzYWdlID0gbWVzc2FnZTsNCisNCisJcmV0dXJuIGNwY19jcG9ydF90cmFuc21pdChjcG9y
dCwgc2tiKTsNCiB9DQogDQogc3RhdGljIGludCBjcGNfaGRfY3BvcnRfYWxsb2NhdGUoc3RydWN0
IGNwY19ob3N0X2RldmljZSAqY3BjX2hkLCBpbnQgY3BvcnRfaWQsIHVuc2lnbmVkIGxvbmcgZmxh
Z3MpDQpAQCAtMTQzLDggKzE1Nyw4IEBAIHN0cnVjdCBjcGNfaG9zdF9kZXZpY2UgKmNwY19oZF9j
cmVhdGUoc3RydWN0IGNwY19oZF9kcml2ZXIgKmRyaXZlciwgc3RydWN0IGRldmljDQogCXN0cnVj
dCBjcGNfaG9zdF9kZXZpY2UgKmNwY19oZDsNCiAJc3RydWN0IGdiX2hvc3RfZGV2aWNlICpoZDsN
CiANCi0JaWYgKCghZHJpdmVyLT5tZXNzYWdlX3NlbmQpIHx8ICghZHJpdmVyLT5tZXNzYWdlX2Nh
bmNlbCkpIHsNCi0JCWRldl9lcnIocGFyZW50LCAibWlzc2luZyBtYW5kYXRvcnkgY2FsbGJhY2tz
XG4iKTsNCisJaWYgKCFkcml2ZXItPnRyYW5zbWl0KSB7DQorCQlkZXZfZXJyKHBhcmVudCwgIm1p
c3NpbmcgbWFuZGF0b3J5IGNhbGxiYWNrXG4iKTsNCiAJCXJldHVybiBFUlJfUFRSKC1FSU5WQUwp
Ow0KIAl9DQogDQpAQCAtMTgwLDEyICsxOTQsMzMgQEAgdm9pZCBjcGNfaGRfZGVsKHN0cnVjdCBj
cGNfaG9zdF9kZXZpY2UgKmNwY19oZCkNCiB9DQogRVhQT1JUX1NZTUJPTF9HUEwoY3BjX2hkX2Rl
bCk7DQogDQordm9pZCBjcGNfaGRfbWVzc2FnZV9zZW50KHN0cnVjdCBza19idWZmICpza2IsIGlu
dCBzdGF0dXMpDQorew0KKwlzdHJ1Y3QgY3BjX2hvc3RfZGV2aWNlICpjcGNfaGQgPSBDUENfU0tC
X0NCKHNrYiktPmNwb3J0LT5jcGNfaGQ7DQorCXN0cnVjdCBnYl9ob3N0X2RldmljZSAqaGQgPSBj
cGNfaGQtPmdiX2hkOw0KKw0KKwlncmV5YnVzX21lc3NhZ2Vfc2VudChoZCwgQ1BDX1NLQl9DQihz
a2IpLT5nYl9tZXNzYWdlLCBzdGF0dXMpOw0KK30NCitFWFBPUlRfU1lNQk9MX0dQTChjcGNfaGRf
bWVzc2FnZV9zZW50KTsNCisNCiB2b2lkIGNwY19oZF9yY3ZkKHN0cnVjdCBjcGNfaG9zdF9kZXZp
Y2UgKmNwY19oZCwgdTE2IGNwb3J0X2lkLCB1OCAqZGF0YSwgc2l6ZV90IGxlbmd0aCkNCiB7DQog
CWdyZXlidXNfZGF0YV9yY3ZkKGNwY19oZC0+Z2JfaGQsIGNwb3J0X2lkLCBkYXRhLCBsZW5ndGgp
Ow0KIH0NCiBFWFBPUlRfU1lNQk9MX0dQTChjcGNfaGRfcmN2ZCk7DQogDQorLyoqDQorICogY3Bj
X2hkX3NlbmRfc2tiKCkgLSBRdWV1ZSBhIHNvY2tldCBidWZmZXIgZm9yIHRyYW5zbWlzc2lvbi4N
CisgKiBAY3BjX2hkOiBIb3N0IGRldmljZSB0byBzZW5kIFNLQiBvdmVyLg0KKyAqIEBza2I6IFNL
QiB0byBzZW5kLg0KKyAqLw0KK2ludCBjcGNfaGRfc2VuZF9za2Ioc3RydWN0IGNwY19ob3N0X2Rl
dmljZSAqY3BjX2hkLCBzdHJ1Y3Qgc2tfYnVmZiAqc2tiKQ0KK3sNCisJY29uc3Qgc3RydWN0IGNw
Y19oZF9kcml2ZXIgKmRydiA9IGNwY19oZC0+ZHJpdmVyOw0KKw0KKwlyZXR1cm4gZHJ2LT50cmFu
c21pdChjcGNfaGQsIHNrYik7DQorfQ0KKw0KIE1PRFVMRV9ERVNDUklQVElPTigiR3JleWJ1cyBv
dmVyIENQQyIpOw0KIE1PRFVMRV9MSUNFTlNFKCJHUEwiKTsNCiBNT0RVTEVfQVVUSE9SKCJTaWxp
Y29uIExhYm9yYXRvcmllcywgSW5jLiIpOw0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3JleWJ1cy9j
cGMvaG9zdC5oIGIvZHJpdmVycy9ncmV5YnVzL2NwYy9ob3N0LmgNCmluZGV4IGMzZjJmNTZhOTM5
Li4xOTFiNWUzOTRhNiAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3JleWJ1cy9jcGMvaG9zdC5oDQor
KysgYi9kcml2ZXJzL2dyZXlidXMvY3BjL2hvc3QuaA0KQEAgLTE4LDkgKzE4LDcgQEAgc3RydWN0
IGNwY19jcG9ydDsNCiBzdHJ1Y3QgY3BjX2hvc3RfZGV2aWNlOw0KIA0KIHN0cnVjdCBjcGNfaGRf
ZHJpdmVyIHsNCi0JaW50ICgqbWVzc2FnZV9zZW5kKShzdHJ1Y3QgY3BjX2hvc3RfZGV2aWNlICpo
ZCwgdTE2IGRlc3RfY3BvcnRfaWQsDQotCQkJICAgIHN0cnVjdCBnYl9tZXNzYWdlICptZXNzYWdl
LCBnZnBfdCBnZnBfbWFzayk7DQotCXZvaWQgKCptZXNzYWdlX2NhbmNlbCkoc3RydWN0IGdiX21l
c3NhZ2UgKm1lc3NhZ2UpOw0KKwlpbnQgKCp0cmFuc21pdCkoc3RydWN0IGNwY19ob3N0X2Rldmlj
ZSAqaGQsIHN0cnVjdCBza19idWZmICpza2IpOw0KIH07DQogDQogLyoqDQpAQCAtNDgsNSArNDYs
OCBAQCBpbnQgY3BjX2hkX2FkZChzdHJ1Y3QgY3BjX2hvc3RfZGV2aWNlICpjcGNfaGQpOw0KIHZv
aWQgY3BjX2hkX3B1dChzdHJ1Y3QgY3BjX2hvc3RfZGV2aWNlICpjcGNfaGQpOw0KIHZvaWQgY3Bj
X2hkX2RlbChzdHJ1Y3QgY3BjX2hvc3RfZGV2aWNlICpjcGNfaGQpOw0KIHZvaWQgY3BjX2hkX3Jj
dmQoc3RydWN0IGNwY19ob3N0X2RldmljZSAqY3BjX2hkLCB1MTYgY3BvcnRfaWQsIHU4ICpkYXRh
LCBzaXplX3QgbGVuZ3RoKTsNCit2b2lkIGNwY19oZF9tZXNzYWdlX3NlbnQoc3RydWN0IHNrX2J1
ZmYgKnNrYiwgaW50IHN0YXR1cyk7DQorDQoraW50IGNwY19oZF9zZW5kX3NrYihzdHJ1Y3QgY3Bj
X2hvc3RfZGV2aWNlICpjcGNfaGQsIHN0cnVjdCBza19idWZmICpza2IpOw0KIA0KICNlbmRpZg0K
LS0gDQoyLjUyLjANCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZ3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0IC0tIGdyZXlidXMtZGV2QGxpc3RzLmxpbmFy
by5vcmcKVG8gdW5zdWJzY3JpYmUgc2VuZCBhbiBlbWFpbCB0byBncmV5YnVzLWRldi1sZWF2ZUBs
aXN0cy5saW5hcm8ub3JnCg==
