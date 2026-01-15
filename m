Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 28919D258E3
	for <lists+greybus-dev@lfdr.de>; Thu, 15 Jan 2026 16:59:52 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 27B33401BA
	for <lists+greybus-dev@lfdr.de>; Thu, 15 Jan 2026 15:59:51 +0000 (UTC)
Received: from mx0a-0024c301.pphosted.com (mx0a-0024c301.pphosted.com [148.163.149.154])
	by lists.linaro.org (Postfix) with ESMTPS id 48C8D401D3
	for <greybus-dev@lists.linaro.org>; Thu, 15 Jan 2026 15:58:52 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=silabs.com header.s=pps12202023 header.b=ZzCL3tob;
	dkim=pass header.d=silabs.com header.s=selector1 header.b=Lz+ln9ab;
	spf=pass (lists.linaro.org: domain of Damien.Riegel@silabs.com designates 148.163.149.154 as permitted sender) smtp.mailfrom=Damien.Riegel@silabs.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1");
	dmarc=pass (policy=reject) header.from=silabs.com
Received: from pps.filterd (m0101743.ppops.net [127.0.0.1])
	by mx0a-0024c301.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60FFjDIl816853;
	Thu, 15 Jan 2026 09:58:42 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps12202023;
	 bh=NF9Fix4akWYhRnKTew2dRhK//VMugnWNAlORiL4nc68=; b=ZzCL3tobpSpN
	FonShHOGfSmngFh9vuF39D5e/5oqTmobXyrZGaDXa1wIlt0JBIUO7Q4YYhTw2ro7
	MH+UCQhJrbOUYzMlJhShhLMltOH+z35ajx79xGjCoPUcMShwinmLGvJrvTAHL2UH
	c6la2jltD0sLaS+h62LcuwUC+HsjnJQYXJMcnp7tDlNBXnegpjftBCTpAiDpeEcX
	57bFoz/rpK9JH/F0kBX6JY7SVd0wMrEe8ajJ8KEJ/o8KUAcsJEBGSI2tFrTvMg4M
	kNtH3bsd8v9TFjCeyT154NfG6TW3f8lcDjTFCwPZ5Szln3B7X0QSa/+kL6+Sbhd+
	nEwaS0bupA==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11022104.outbound.protection.outlook.com [40.107.200.104])
	by mx0a-0024c301.pphosted.com (PPS) with ESMTPS id 4bq35hr13w-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 15 Jan 2026 09:58:42 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yGVq4ujB5pLzuB9qJWiyALPnSzVk9HNscZMz2QjomOaF7AdSPZDLwuRvYhETlIEIRMRoRW4UE8vr4k4mqOM6+B/9MiFr1HGGZmVaLxurVMW2yCivLPvENXWmPCZhVzZcv/J39gakZVBunmrDCrAam6wCg1Aptp85o3TQaHlDuoA4rPZbd5lncObcSMDVGz5OiFfrTQlORNslfBXlsfznQzBsolYJyTIPUzQ3VYjtPtXyr04zf4zZjazjxXZG23k1hCaYW11AbybhcjUaeQurkkdltRdmGbCi7QlCoHBKIS/zc/Cady+5++7DlQKjkxAamabQEiBQEltkQ/khbppjjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NF9Fix4akWYhRnKTew2dRhK//VMugnWNAlORiL4nc68=;
 b=RHoQS6Og9KA5VLUAEJ80o2NqsqzMwGrOnxvVPe9+X+AGmLlVoHAS+7MOu/jlLQ3jw65hqI2khox7O6z10hrbu5SBqjLPnnDepBpXJhSyAnY5HxCe1OS38iahGmb5QnTHIO9W2GFQr65Y8ILRMQ60uo7AmhrBaM0Lvxudh8ncT3fDLjJDPJgCQwalcmfE4t7DipH6AX3400nMigGbcK7J5q2SUs02Ot8DSNtMx/j1tNvur19PAg5uHfHnu6FV9Ju2iC4i2sigs09HZjj0iLCvHrh/SWR0HYyqwmToFi6b8wY9cWyR8QAc9AaIRK8LJitCKD99RT/Y0af1f69RJ8h3kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silabs.com; dmarc=pass action=none header.from=silabs.com;
 dkim=pass header.d=silabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NF9Fix4akWYhRnKTew2dRhK//VMugnWNAlORiL4nc68=;
 b=Lz+ln9ab7lVUhWMeVpcQkPob1GXi6gnL0ts/uMkl8YVoUZAr8a9h3dFNAOC1OXWlh5H06PuIdHJn+qGc9kJHaVcFHoPcrKhPSiopXw4Y/MN6SnImbayxb5jrqb59ixwJN57+vqYPXYvly4/6ZvHvZOOi37OyxxVPtGUwLetMFRo=
Received: from DS0PR11MB8205.namprd11.prod.outlook.com (2603:10b6:8:162::17)
 by BL3PR11MB6457.namprd11.prod.outlook.com (2603:10b6:208:3bc::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Thu, 15 Jan
 2026 15:58:38 +0000
Received: from DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::2de6:bc88:2af7:3583]) by DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::2de6:bc88:2af7:3583%3]) with mapi id 15.20.9520.005; Thu, 15 Jan 2026
 15:58:38 +0000
From: =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
To: greybus-dev@lists.linaro.org, Johan Hovold <johan@kernel.org>,
        Alex Elder <elder@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org
Date: Thu, 15 Jan 2026 10:58:02 -0500
Message-ID: <20260115155808.36102-10-damien.riegel@silabs.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260115155808.36102-1-damien.riegel@silabs.com>
References: <20260115155808.36102-1-damien.riegel@silabs.com>
X-ClientProxiedBy: YQZPR01CA0025.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:86::22) To DS0PR11MB8205.namprd11.prod.outlook.com
 (2603:10b6:8:162::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8205:EE_|BL3PR11MB6457:EE_
X-MS-Office365-Filtering-Correlation-Id: 505a6d24-4c6e-455d-2051-08de544ef279
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?YWxoSGZackE3amVtVHQ2a2ZRWWFJL2xheFRKODBuQ0NzQXBkc3ZrcDB4M2RT?=
 =?utf-8?B?S2FVZDBHSGlwcmRjUDllWk5aVzZ2QzRMWEp6UVkyWklRbUtzTW5mYktFNHgw?=
 =?utf-8?B?eU8zQmdkUDN3R29tWnRUcDhRaGRrbmhuWkxJaXRQa3g2bXQwSGZzU0xkbXFQ?=
 =?utf-8?B?Q3plT09od0pXVzY5bE5kUzBxR3doWTFPOFdxekZCd0hFRXBYWU5xOXdqRjNO?=
 =?utf-8?B?REVEeW5pazVSSWJCVTRyaE5EUHlWN01HeFZJNVErTFFoTUxsR2Y5Uk9UNGNC?=
 =?utf-8?B?eklhU09GN3NnQmNiTGlQT3dwZ0RoY1NqLzF2dy9hSDZoWFVJdko3aXFFZEJ0?=
 =?utf-8?B?UUExc2tldDFFMlE3UVpHUE9vdjVjTVIxVHBQNGZhcThJMmVBOWFudHVTNlZs?=
 =?utf-8?B?QS9kdzZnU292dXVpalR2dTBhTHlwNXpqbEd1N3M3enZiUXp3dTNXaXM2cW9Z?=
 =?utf-8?B?QUpsQ1pucVEvazFzTDRYRjlOMlhHd0cwb01mQXk0RW9LVGlYaVZPSkpCaWRN?=
 =?utf-8?B?cmhwL3pxTHcxamVvYmlWaHN2dXUrRFNXNEsxN3QvbE1OUURVWGRGL2xFZDVz?=
 =?utf-8?B?UGxXZjEyT2xXRzd2Z3JLWTdaTEFUajdqaVNCcThyVWhIUnZ3dkdYRHJaYVkz?=
 =?utf-8?B?dmtHYkVpTytPbE1KVlEyN1VkUHExT1h6c3hBTmVUNU0yU1Q4dE5OTExmVW5y?=
 =?utf-8?B?UWF4MURsK3kraFk5WFcvTDkzbCtHWmZySThXZmtXU1o2Wk9OSWNGZ0hjR2ZR?=
 =?utf-8?B?OU1WL3FZaFFvK3RWWnk1dUs5UTZnaGMwejMvTTR5UUZUNXhUeGxPOXJyQzBt?=
 =?utf-8?B?K3F0S0xmTWYxbFNrSTFkRmt0SWlYbTR5L1ZoN2VBV3lqUzFWUE5wbnUyWXBD?=
 =?utf-8?B?bEcxZ0ZFOEVnMTZxK1FxQ0VrekwvYmFSbmFxMUtDYk9jRGFONWVKanNtaHY0?=
 =?utf-8?B?NCtuTitxMjVlQXNlS0VNeFBUb25OdG9VRGdFNEhscExYaWRQaSthajVYODdK?=
 =?utf-8?B?WmdYSTYrbmhEcXRmZjU4ZmJTUDBNZkhMNmJEVVdBSDNoSHp4VU1uT25mSUZK?=
 =?utf-8?B?ZXJOTXplZGNVUllVSFc2UWk4UUNDRVR1OGJYQ2Y1K2hFZjVyWHZLdlRPRDBI?=
 =?utf-8?B?d014OHBjOTgvMUQyYUpPbTZmck1KejVoeTExRFRTVERTUGJTcXEyWTE1S1dP?=
 =?utf-8?B?TlNOZ1VhN0ZLZ0o2ZUovZEk5U1J1b2pNVk9qNVBSWDBicDZvQVg0YmVOMlpB?=
 =?utf-8?B?SEtmcWxvd1RvRno2OWFhc3V0SHdiZDAwNlNlTG5adHdLWGVyMVdtL01KSlQ0?=
 =?utf-8?B?KzBpMVlWZERFWmJtaU5XeTcwcTRXOEtDaW9LN0pJY0xKbGg1dEUzYmF0OGlT?=
 =?utf-8?B?NDNIK205ZTZkUVpJWWc3bFR3djVvb3FtcFhtUjFvWFQxZ2tuUW05a2lCZVhp?=
 =?utf-8?B?SDdVSEgxazNyMTdBaUk4MkNkWU11Zi8zdC90L2N6WG5HVUJsRzVTOFBicG1E?=
 =?utf-8?B?YTRxTTV5UXpqWDB6TGJIWklJSG0rRUdldU44VGRBeHkzZFVjQytQd2ZPaDRB?=
 =?utf-8?B?cUtjMG1ScldtNDVmMks0aGJVN2R1V2VsTnlwcXNyblFORThPQkcvZDhWZ0F3?=
 =?utf-8?B?KzdlcWFNeXpKTDlsOHVzU3BCaTM1TkZqaVdxNDBIN3J6RVJoeFVYL3RCalNO?=
 =?utf-8?B?eExURm4yMVN4K2g2bnE4azU2WkFncytSOFJqemZSdGVPWHdraDludWtPU1N3?=
 =?utf-8?B?S2JSU3NVY2NxOFpBQ1ZWRFlaZnowUFJTRndYVlM0RUFpdm90elgrcjdhcGNU?=
 =?utf-8?B?S3EzcFNZbFVUcDRZaWNXYkZObXZRSU9FRFBWQTlOczkwVzZsWjFhUGJ0TW0z?=
 =?utf-8?B?NGdTSU9oQjBtaWsxeUJuU0dpbkp2M0dJUDc5eURWcGNJREp2aFZoS1ExdlVS?=
 =?utf-8?B?cG9QQkl4akVPd2dNVWlLNDJMR25mR0s1MUZia0hEMVpLc1RkMHRocEZzSWNK?=
 =?utf-8?B?dUZraERsTXhQTXhxTUNza0hlclpZVGdiek10NHF6K1NTSUd2blErTERWd0Ru?=
 =?utf-8?B?UGE0VmpxVmhETHhsYUk1b3ZYOFNuZnV3OVBJNG1IcTM2RWxRSS8zaGQ5Qk9u?=
 =?utf-8?B?ZDU3UjdRWk5yMnZkMFcwaGc4elo2NjRLbHZtTDdqSk5mdWdmN25CaGppbkhx?=
 =?utf-8?Q?JfkXDlBpnPqfJtOfQaP2Oqk=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8205.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RnMwYkJUejBiOTRUSFdXd29kMjl1ZW9GVHlmd1Y5ODBIUUxsS0NKcU1TeEZ6?=
 =?utf-8?B?blMyYXlwVUFKakJxcWM5cTg3TWZOdDI4ckwvVlJvYWVWaVpkYmZKd3lPdHl4?=
 =?utf-8?B?TFZkNFhaNnhvS0ZxUG1PWDNuYkhpMjlpQkY4VHJ6Y1dWOXFnYXdUdVpXdlFm?=
 =?utf-8?B?RkVWZS9BN1F6UWZPN1J1NGRHbkZ6U1dMN1A5eWZJYVJuRUszR1ZsQ1YzZTdN?=
 =?utf-8?B?WUZlMEp4bVFRdUpKNmtGV2wrdWluRjZBTG9ubGpaaHhoOWpOeU80cEtkemRO?=
 =?utf-8?B?aWZ0a29FV0piUXE2eFlCbnN4QUlqMTdOZkNreC9OUktQNGdHVjg3eTNsUXEw?=
 =?utf-8?B?NUdBZzQ4YzRDb3orUzFJKzFTVUtJK0EyY1praUFMTDFWZ0lEeTc4Mll5c0Ix?=
 =?utf-8?B?bWNqUmpFOG1MTGc5Y1pWOHJKeWRGWGxSNmdIZU94bjd1N3I2V21KaTg0SlpN?=
 =?utf-8?B?bi90cW9jdm4ycFdXV09HRmlnNWxYU0NKeUkrTHM4WkVVRXRGUVVQRGxmZjA1?=
 =?utf-8?B?V0wvQmJJMERkSC8vVnlVeENlRUh2SU5YVUZPM3gxbFVIWTZBMW9DUUpaL3lj?=
 =?utf-8?B?YzM2WTJYYXYrbW8wUTdJUGZ2dFpsdE9DNkMwbWRHRTA1aGR2M3RNdE0xN2ZX?=
 =?utf-8?B?dndBanpVTmN1T0hZcTkwRmNieVV4YWhqWjZvbDR5cE52OGtuREZNc2R3ZEdO?=
 =?utf-8?B?aG4wcyt1V0RRM1YyNDBxM3I2M3I1eUNIN0ZSdnBvOExZMWNZMGJta1dOdUlL?=
 =?utf-8?B?aGNFNmd5QkRnbXNmSEtJVnYxL05OQUx2Qnh5cVhERFdMdDYvZ21aMW5DRjJo?=
 =?utf-8?B?Sit0aTkxYVFwSnZSc3U4UGxheWZMOElidmtvZENPYmxFVlNjRUtPNE11RHdZ?=
 =?utf-8?B?UkVzNVdSRXFkMmpLenpWRWhHMmxNWFRKcmJVQjlKbVBtZzBSOE9Xenk4YTll?=
 =?utf-8?B?eTlPMDl1Rm5FK0h6eFd2dlpaakliSmlYQnhSL1Z0SVJqUnVaNmdRR1IweDFY?=
 =?utf-8?B?b29MUkxFN0lvbDdwZTVUOTJGWTVOWDd0blJ6MWhtWXhkendUWDhJOWRmV1gw?=
 =?utf-8?B?OHFRVDdhcXdLWkE3ZERHS3p0TXdoSnZ1M3IyRU9YM3F6V0xGbzVPYjhpTEZy?=
 =?utf-8?B?M1Q1Zm9WL1JxdUVhMm5hU0IyYVA3SzM0eXZ1bEZaM05WdGZDN0twY3JUdGhU?=
 =?utf-8?B?VUJYdDFXVEsxM1cxem5HTTRtRTlDNU9lVVJzbzhTbDhnOVRHZWhDWitZaXRS?=
 =?utf-8?B?dkVxRlBGUGNhMmVCdG10M0ppTENUc20yQnZvNlJBRlNSWVN3UXFudGdrYm5M?=
 =?utf-8?B?WUlCZndYZGhMTEljaEZFdFdaSlkyYTVxMUg3MFp4SnExdDQ5QlQ2Y0pDNFhD?=
 =?utf-8?B?a0RkWGFiMGNSY1pXOXhaaDgrODhoRXV6UytkK05LOTNHM1dtbjlRN3lsb2pv?=
 =?utf-8?B?QTdtSVNtS3htYzhXd1V4SmltNEdnZUc3M0lsaFNBT0xmdVZhbjBLYjJaUys2?=
 =?utf-8?B?V2x2NkdXU05EMThNK09kSGhhQnlLWTdmVFJGT3Mzckl3dGRhM1lhWU43dE0x?=
 =?utf-8?B?ZzJCM0tvQldLZEhKWE1nZmR0VW9iN1J1eElQeWwzQmxxZjh5TGE5dWdNdUwr?=
 =?utf-8?B?SDc0eEFHTmZOSjdwRnAvTU13dzQ1cHBlK0tscGJ0ZVRWb1gvMzJ5T1NRMU5S?=
 =?utf-8?B?ZGNnOW1BcFRIblNQOXZvMVlleXRUMlo0YWFaOWVhdGhoLzdxbkRLb1M2a2Va?=
 =?utf-8?B?THQvUVhDdjhLMEY3OERJWmt0bzlLLzZ3SG5vVTVPQkoxYkdWMjJ2Q0VmcjRU?=
 =?utf-8?B?SUVQWlZDQ2RVdzdvV2RBMjA4bktnSzdtT0hoUzliMUhzNUI3UGYxOUZrUElp?=
 =?utf-8?B?a1U1cTB6a1hqbWRscEZjTTVmeTdFVzhmTlczbm9JSW9iYWJqYlc1RVFZSUVs?=
 =?utf-8?B?Wi9VQ3hKTXNTaFFPYUN3YmtVK3lQQk10RExuRGs5dkxvZnBDNzRHeExhdXRm?=
 =?utf-8?B?cU5TUmxFQ0lRaWcraUVzZXJRYi9uclcwUlVNZ1pLZnZ3VW12WjNSMkxJcVJH?=
 =?utf-8?B?czBYZnZxdU1VaWlIZElsMG0ySEJPb0pKcUFYaWlrT21FOHlNSksrYm9Yb3ls?=
 =?utf-8?B?b0hnWmpSL1NKc2pCN2gwd3l0Y1ZtYlZ5dUVYcllnNjZhNDJMTmhMUmh4UDVH?=
 =?utf-8?B?S1Fpam9ZVmxDZXZDOFZxQlFzNFRwcHJWVE9jSVVkTWdOUktZQksxdzhLSTRC?=
 =?utf-8?B?U0ZYTW8xSy91UUZFMU05aHpibjNla3lEUXF5UUhVaVFDY29FTDRoV0hIQm1p?=
 =?utf-8?B?V0Z0NERFa3dhd3ZaK1dhZVVQcmpBamFTVW5za05Qc2xBOG15aFhVQT09?=
X-OriginatorOrg: silabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 505a6d24-4c6e-455d-2051-08de544ef279
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8205.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 15:58:38.7087
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 54dbd822-5231-4b20-944d-6f4abcd541fb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R5Rd69dShatFcOq3N81Dc5aOZtnQaqD2mM902Odk8zxs2WnyoE/vD7ERFn0em8NX19Irvq+wYjTFCBZICc/owQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6457
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDEyMCBTYWx0ZWRfXwwqmhhwxA/iK
 hL3rfw1CbnkxouR3wr0voVmPVXlQxKPXx6iLx1GlSHyJABHqOwSJKTAUDgd6pp1GrpFpyWqP4Iu
 7PID1gRLAda10OCLOsOfEq/M0dsSP68lf8Vwdtqq4KCHHJ30YFnPTJ7l13Ly4vwnHpU4gsdRytl
 AMVD5Kn4NWlpTcNIWb0a7TS04mqP0c1mzhgs9Pz5X2GKPOyY+Uwm+Rq6RbzDo8nLHh6Rmfyh5VR
 sFqetFBGH7GieFQJfLlpUV0kHPbckCOe8+8MNOa61sG0vNgNeM3xPaHD4siZFmDCMNnYxfF+Rbz
 Quv0fdHz+9JRW33Tgm+pu6nIjCbCr9i3CtCBQAUjxc5sI8I35kkG5LpfPRIdDWIhfbFq4UeYP7m
 OXsr/2lVpQXXPcY0zpX25Tl+fVqDmEF+hxlPPfjtitg48tKJKzN4sygcFOKtU11VeCeLuyr7tU8
 EsbsqfomnUJR7iiNCsQ==
X-Proofpoint-ORIG-GUID: z8UJTBewIzuIuQKYq3qKeJcy3LURFfRe
X-Proofpoint-GUID: z8UJTBewIzuIuQKYq3qKeJcy3LURFfRe
X-Authority-Analysis: v=2.4 cv=PcXyRyhd c=1 sm=1 tr=0 ts=69690eb2 cx=c_pps
 a=Yy30xeOXBChOadhm8XbUsQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=M51BFTxLslgA:10
 a=i1IsUcr2s-wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=2AEO0YjSAAAA:8
 a=mhnTNJ_rBLr-BtWZq_0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_05,2026-01-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 phishscore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601150120
X-Rspamd-Queue-Id: 48C8D401D3
X-Spamd-Bar: ----
X-Spamd-Result: default: False [-4.00 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[silabs.com,reject];
	R_DKIM_ALLOW(-0.20)[silabs.com:s=pps12202023,silabs.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:148.163.149.154];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:26211, ipnet:148.163.148.0/22, country:US];
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
Message-ID-Hash: KCRENGBB5YYODZ6YW7OVQF3IODOZ7DPA
X-Message-ID-Hash: KCRENGBB5YYODZ6YW7OVQF3IODOZ7DPA
X-MailFrom: Damien.Riegel@silabs.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Silicon Labs Kernel Team <linux-devel@silabs.com>, =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v2 09/14] greybus: cpc: acknowledge all incoming messages
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/KCRENGBB5YYODZ6YW7OVQF3IODOZ7DPA/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

Q3VycmVudGx5LCBDUEMgZG9lc24ndCBzZW5kIG1lc3NhZ2VzIG9uIGl0cyBvd24sIGl0IG9ubHkg
cHJlcGVuZHMgaXRzDQpoZWFkZXIgdG8gb3V0Z29pbmcgbWVzc2FnZXMuIFRoaXMgY2FuIGxlYWQg
dG8gbWVzc2FnZXMgbm90IGJlaW5nDQphY2tub3dsZWRnZWQsIGZvciBpbnN0YW5jZSBpbiB0aGUg
Y2FzZSBvZiBhbiBTVkMgUGluZw0KDQoJSG9zdAkJCQlEZXZpY2UNCg0KICBTVkMgUGluZyAoc2Vx
PVgsIGFjaz1ZKQ0KCQkJCSAgU1ZDIFBpbmcgUmVwbHkgKHNlcT1ZLCBhY2s9WCsxKQ0KDQpUaGUg
IlBpbmcgUmVwbHkiIGlzIG5ldmVyIGFja25vd2xlZGdlZCBhdCB0aGUgQ1BDIGxldmVsLCB3aGlj
aCBjYW4gbGVhZA0KdG8gcmV0cmFuc21pc3Npb25zLCBvciB3b3JzdCB0aGUgZGV2aWNlIG1pZ2h0
IHRoaW5rIHRoZSBsaW5rIGlzIGJyb2tlbg0KYW5kIGRvIHNvbWV0aGluZyB0byByZWNvdmVyLg0K
DQpUbyBwcmV2ZW50IHRoYXQgc2NlbmFyaW8sIGFuIGFjayBtZWNoYW5pc20gaXMgaW1wbGVtZW50
ZWQgaW4gdGhlIG1vc3QNCnN0cmFpZ2h0Zm9yd2FyZCBtYW5uZXI6IHNlbmQgYW4gQUNLIHRvIGFs
bCBpbmNvbWluZyBtZXNzYWdlcy4gSGVyZSwgdHdvDQpmbGFncyBuZWVkIHRvIGJlIGFkZGVkOg0K
IC0gRmlyc3QsIGFuIEFDSyBmcmFtZSBzaG91bGQgbm90IGJlIHBhc3NlZCB0byB0aGUgR3JleWJ1
cyBsYXllciwgc28gYQ0KICAgIkNPTlRST0wiIGZsYWcgaXMgYWRkZWQuIElmIHRoaXMgZmxhZyBp
cyBzZXQsIGl0IG1lYW5zIGl0J3MgYSBjb250cm9sDQogICBtZXNzYWdlcyBhbmQgc2hvdWxkIHN0
YXkgYXQgdGhlIENQQyBsZXZlbC4gQ3VycmVudGx5IHRoZXJlIGlzIG9ubHkNCiAgIG9uZSB0eXBl
IG9mIGNvbnRyb2wgZnJhbWUsIHRoZSBzdGFuZGFsb25lIGFjay4gQ29udHJvbCBtZXNzYWdlcyBo
YXZlDQogICB0aGUgc2FtZSBmb3JtYXQgYXMgR3JleWJ1cyBvcGVyYXRpb25zLg0KIC0gU2Vjb25k
LCBhY2sgdGhlbXNlbHZlcyBzaG91bGQgbm90IGJlIGFja2VkLCBzbyB0byBkZXRlcm1pbmUgaWYg
YQ0KICAgbWVzc2FnZSBzaG91bGQgYmUgYWNrZWQgb3Igbm90LCBhIFJFUVVFU1RfQUNLIGZsYWcg
aXMgYWRkZWQuDQoNClNpZ25lZC1vZmYtYnk6IERhbWllbiBSacOpZ2VsIDxkYW1pZW4ucmllZ2Vs
QHNpbGFicy5jb20+DQotLS0NCkNoYW5nZXMgaW4gdjI6DQogIC0gYWRkIG1pc3NpbmcgY3B1X3Rv
X2xlMTYgY29udmVyc2lvbiB3aGVuIHNldHRpbmcgbWVzc2FnZSBzaXplDQoNCiBkcml2ZXJzL2dy
ZXlidXMvY3BjL2NwYy5oICAgICAgfCAgMyArKw0KIGRyaXZlcnMvZ3JleWJ1cy9jcGMvY3BvcnQu
YyAgICB8ICAxICsNCiBkcml2ZXJzL2dyZXlidXMvY3BjL2hlYWRlci5jICAgfCA0MSArKysrKysr
KysrKysrKysrKysrKysrKysrDQogZHJpdmVycy9ncmV5YnVzL2NwYy9oZWFkZXIuaCAgIHwgIDMg
KysNCiBkcml2ZXJzL2dyZXlidXMvY3BjL3Byb3RvY29sLmMgfCA1NiArKysrKysrKysrKysrKysr
KysrKysrKysrKysrKy0tLS0tDQogNSBmaWxlcyBjaGFuZ2VkLCA5NiBpbnNlcnRpb25zKCspLCA4
IGRlbGV0aW9ucygtKQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncmV5YnVzL2NwYy9jcGMuaCBi
L2RyaXZlcnMvZ3JleWJ1cy9jcGMvY3BjLmgNCmluZGV4IDg3YjU0YTRmZDM0Li43MjVmZDdmNGFm
YyAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3JleWJ1cy9jcGMvY3BjLmgNCisrKyBiL2RyaXZlcnMv
Z3JleWJ1cy9jcGMvY3BjLmgNCkBAIC01MSw2ICs1MSw5IEBAIHN0cnVjdCBjcGNfc2tiX2NiIHsN
CiAJc3RydWN0IGdiX21lc3NhZ2UgKmdiX21lc3NhZ2U7DQogDQogCXU4IHNlcTsNCisNCisjZGVm
aW5lIENQQ19TS0JfRkxBR19SRVFfQUNLICgxIDw8IDApDQorCXU4IGNwY19mbGFnczsNCiB9Ow0K
IA0KICNkZWZpbmUgQ1BDX1NLQl9DQihfX3NrYikgKChzdHJ1Y3QgY3BjX3NrYl9jYiAqKSYoKF9f
c2tiKS0+Y2JbMF0pKQ0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3JleWJ1cy9jcGMvY3BvcnQuYyBi
L2RyaXZlcnMvZ3JleWJ1cy9jcGMvY3BvcnQuYw0KaW5kZXggNzA0MWE2YThhMzYuLjg0N2NjOGVi
ZTQxIDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncmV5YnVzL2NwYy9jcG9ydC5jDQorKysgYi9kcml2
ZXJzL2dyZXlidXMvY3BjL2Nwb3J0LmMNCkBAIC05MSw2ICs5MSw3IEBAIGludCBjcGNfY3BvcnRf
dHJhbnNtaXQoc3RydWN0IGNwY19jcG9ydCAqY3BvcnQsIHN0cnVjdCBza19idWZmICpza2IpDQog
CW11dGV4X2xvY2soJmNwb3J0LT5sb2NrKTsNCiANCiAJQ1BDX1NLQl9DQihza2IpLT5zZXEgPSBj
cG9ydC0+dGNiLnNlcTsNCisJQ1BDX1NLQl9DQihza2IpLT5jcGNfZmxhZ3MgPSBDUENfU0tCX0ZM
QUdfUkVRX0FDSzsNCiANCiAJY3BvcnQtPnRjYi5zZXErKzsNCiAJYWNrID0gY3BvcnQtPnRjYi5h
Y2s7DQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncmV5YnVzL2NwYy9oZWFkZXIuYyBiL2RyaXZlcnMv
Z3JleWJ1cy9jcGMvaGVhZGVyLmMNCmluZGV4IDYyOTQ2ZDYwNzdlLi44ODc1YTZmZWQyNiAxMDA2
NDQNCi0tLSBhL2RyaXZlcnMvZ3JleWJ1cy9jcGMvaGVhZGVyLmMNCisrKyBiL2RyaXZlcnMvZ3Jl
eWJ1cy9jcGMvaGVhZGVyLmMNCkBAIC0zLDggKzMsMjUgQEANCiAgKiBDb3B5cmlnaHQgKGMpIDIw
MjUsIFNpbGljb24gTGFib3JhdG9yaWVzLCBJbmMuDQogICovDQogDQorI2luY2x1ZGUgPGxpbnV4
L2JpdGZpZWxkLmg+DQorI2luY2x1ZGUgPGxpbnV4L2JpdHMuaD4NCisNCiAjaW5jbHVkZSAiaGVh
ZGVyLmgiDQogDQorI2RlZmluZSBDUENfSEVBREVSX0NPTlRST0xfSVNfQ09OVFJPTF9NQVNLIEJJ
VCg3KQ0KKyNkZWZpbmUgQ1BDX0hFQURFUl9DT05UUk9MX1JFUV9BQ0tfTUFTSyBCSVQoNikNCisN
CisvKioNCisgKiBjcGNfaGVhZGVyX2lzX2NvbnRyb2woKSAtIElkZW50aWZ5IGlmIHRoaXMgaXMg
YSBjb250cm9sIGZyYW1lLg0KKyAqIEBoZHI6IENQQyBoZWFkZXIuDQorICoNCisgKiBSZXR1cm46
IFRydWUgaWYgdGhpcyBpcyBhIGNvbnRyb2wgZnJhbWUsIGZhbHNlIGlmIHRoaXMgYSBHcmV5YnVz
IGZyYW1lLg0KKyAqLw0KK2Jvb2wgY3BjX2hlYWRlcl9pc19jb250cm9sKGNvbnN0IHN0cnVjdCBj
cGNfaGVhZGVyICpoZHIpDQorew0KKwlyZXR1cm4gaGRyLT5jdHJsX2ZsYWdzICYgQ1BDX0hFQURF
Ul9DT05UUk9MX0lTX0NPTlRST0xfTUFTSzsNCit9DQorDQogLyoqDQogICogY3BjX2hlYWRlcl9n
ZXRfc2VxKCkgLSBHZXQgdGhlIHNlcXVlbmNlIG51bWJlci4NCiAgKiBAaGRyOiBDUEMgaGVhZGVy
Lg0KQEAgLTE1LDMgKzMyLDI3IEBAIHU4IGNwY19oZWFkZXJfZ2V0X3NlcShjb25zdCBzdHJ1Y3Qg
Y3BjX2hlYWRlciAqaGRyKQ0KIHsNCiAJcmV0dXJuIGhkci0+c2VxOw0KIH0NCisNCisvKioNCisg
KiBjcGNfaGVhZGVyX2dldF9yZXFfYWNrKCkgLSBHZXQgdGhlIHJlcXVlc3QgYWNrbm93bGVkZ2Ug
ZnJhbWUgZmxhZy4NCisgKiBAaGRyOiBDUEMgaGVhZGVyLg0KKyAqDQorICogUmV0dXJuOiBSZXF1
ZXN0IGFja25vd2xlZGdlIGZyYW1lIGZsYWcuDQorICovDQorYm9vbCBjcGNfaGVhZGVyX2dldF9y
ZXFfYWNrKGNvbnN0IHN0cnVjdCBjcGNfaGVhZGVyICpoZHIpDQorew0KKwlyZXR1cm4gRklFTERf
R0VUKENQQ19IRUFERVJfQ09OVFJPTF9SRVFfQUNLX01BU0ssIGhkci0+Y3RybF9mbGFncyk7DQor
fQ0KKw0KKy8qKg0KKyAqIGNwY19oZWFkZXJfZW5jb2RlX2N0cmxfZmxhZ3MoKSAtIEVuY29kZSBw
YXJhbWV0ZXJzIGludG8gdGhlIGNvbnRyb2wgYnl0ZS4NCisgKiBAY29udHJvbDogVHJ1ZSBpZiBD
UEMgY29udHJvbCBmcmFtZSwgZmFsc2UgaWYgR3JleWJ1cyBmcmFtZS4NCisgKiBAcmVxX2Fjazog
RnJhbWUgZmxhZyBpbmRpY2F0aW5nIGEgcmVxdWVzdCB0byBiZSBhY2tub3dsZWRnZWQuDQorICoN
CisgKiBSZXR1cm46IEVuY29kZWQgY29udHJvbCBieXRlLg0KKyAqLw0KK3U4IGNwY19oZWFkZXJf
ZW5jb2RlX2N0cmxfZmxhZ3MoYm9vbCBjb250cm9sLCBib29sIHJlcV9hY2spDQorew0KKwlyZXR1
cm4gRklFTERfUFJFUChDUENfSEVBREVSX0NPTlRST0xfSVNfQ09OVFJPTF9NQVNLLCBjb250cm9s
KSB8DQorCSAgICAgICBGSUVMRF9QUkVQKENQQ19IRUFERVJfQ09OVFJPTF9SRVFfQUNLX01BU0ss
IHJlcV9hY2spOw0KK30NCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dyZXlidXMvY3BjL2hlYWRlci5o
IGIvZHJpdmVycy9ncmV5YnVzL2NwYy9oZWFkZXIuaA0KaW5kZXggZDNmYTI2ZThhMDcuLmJmMmVm
NDFkNDRkIDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncmV5YnVzL2NwYy9oZWFkZXIuaA0KKysrIGIv
ZHJpdmVycy9ncmV5YnVzL2NwYy9oZWFkZXIuaA0KQEAgLTQxLDYgKzQxLDkgQEAgc3RydWN0IGNw
Y19oZWFkZXIgew0KICNkZWZpbmUgQ1BDX0hFQURFUl9TSVpFIChzaXplb2Yoc3RydWN0IGNwY19o
ZWFkZXIpKQ0KICNkZWZpbmUgR1JFWUJVU19IRUFERVJfU0laRSAoc2l6ZW9mKHN0cnVjdCBnYl9v
cGVyYXRpb25fbXNnX2hkcikpDQogDQorYm9vbCBjcGNfaGVhZGVyX2lzX2NvbnRyb2woY29uc3Qg
c3RydWN0IGNwY19oZWFkZXIgKmhkcik7DQogdTggY3BjX2hlYWRlcl9nZXRfc2VxKGNvbnN0IHN0
cnVjdCBjcGNfaGVhZGVyICpoZHIpOw0KK2Jvb2wgY3BjX2hlYWRlcl9nZXRfcmVxX2Fjayhjb25z
dCBzdHJ1Y3QgY3BjX2hlYWRlciAqaGRyKTsNCit1OCBjcGNfaGVhZGVyX2VuY29kZV9jdHJsX2Zs
YWdzKGJvb2wgY29udHJvbCwgYm9vbCByZXFfYWNrKTsNCiANCiAjZW5kaWYNCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dyZXlidXMvY3BjL3Byb3RvY29sLmMgYi9kcml2ZXJzL2dyZXlidXMvY3BjL3By
b3RvY29sLmMNCmluZGV4IGZmNjU3NTdiNDBmLi5hZDk3ZTkwM2I5MiAxMDA2NDQNCi0tLSBhL2Ry
aXZlcnMvZ3JleWJ1cy9jcGMvcHJvdG9jb2wuYw0KKysrIGIvZHJpdmVycy9ncmV5YnVzL2NwYy9w
cm90b2NvbC5jDQpAQCAtOSw2ICs5LDExIEBADQogI2luY2x1ZGUgImhlYWRlci5oIg0KICNpbmNs
dWRlICJob3N0LmgiDQogDQorc3RhdGljIGJvb2wgY3BjX3NrYl9pc19zZXF1ZW5jZWQoc3RydWN0
IHNrX2J1ZmYgKnNrYikNCit7DQorCXJldHVybiBDUENfU0tCX0NCKHNrYiktPmNwY19mbGFncyAm
IENQQ19TS0JfRkxBR19SRVFfQUNLOw0KK30NCisNCiB2b2lkIGNwY19wcm90b2NvbF9wcmVwYXJl
X2hlYWRlcihzdHJ1Y3Qgc2tfYnVmZiAqc2tiLCB1OCBhY2spDQogew0KIAlzdHJ1Y3QgY3BjX2hl
YWRlciAqaGRyOw0KQEAgLTE4LDI4ICsyMyw2MyBAQCB2b2lkIGNwY19wcm90b2NvbF9wcmVwYXJl
X2hlYWRlcihzdHJ1Y3Qgc2tfYnVmZiAqc2tiLCB1OCBhY2spDQogCWhkciA9IChzdHJ1Y3QgY3Bj
X2hlYWRlciAqKXNrYi0+ZGF0YTsNCiAJaGRyLT5hY2sgPSBhY2s7DQogCWhkci0+cmVjdl93bmQg
PSAwOw0KLQloZHItPmN0cmxfZmxhZ3MgPSAwOw0KIAloZHItPnNlcSA9IENQQ19TS0JfQ0Ioc2ti
KS0+c2VxOw0KKwloZHItPmN0cmxfZmxhZ3MgPSBjcGNfaGVhZGVyX2VuY29kZV9jdHJsX2ZsYWdz
KCFDUENfU0tCX0NCKHNrYiktPmdiX21lc3NhZ2UsDQorCQkJCQkJICAgICAgIGNwY19za2JfaXNf
c2VxdWVuY2VkKHNrYikpOw0KK30NCisNCitzdGF0aWMgdm9pZCBjcGNfcHJvdG9jb2xfcXVldWVf
YWNrKHN0cnVjdCBjcGNfY3BvcnQgKmNwb3J0LCB1OCBhY2spDQorew0KKwlzdHJ1Y3QgZ2Jfb3Bl
cmF0aW9uX21zZ19oZHIgKmdiX2hkcjsNCisJc3RydWN0IHNrX2J1ZmYgKnNrYjsNCisNCisJc2ti
ID0gYWxsb2Nfc2tiKENQQ19IRUFERVJfU0laRSArIHNpemVvZigqZ2JfaGRyKSwgR0ZQX0tFUk5F
TCk7DQorCWlmICghc2tiKQ0KKwkJcmV0dXJuOw0KKw0KKwlza2JfcmVzZXJ2ZShza2IsIENQQ19I
RUFERVJfU0laRSk7DQorDQorCWdiX2hkciA9IHNrYl9wdXQoc2tiLCBzaXplb2YoKmdiX2hkcikp
Ow0KKwltZW1zZXQoZ2JfaGRyLCAwLCBzaXplb2YoKmdiX2hkcikpOw0KKw0KKwkvKiBJbiB0aGUg
Q1BDIE9wZXJhdGlvbiBIZWFkZXIsIG9ubHkgdGhlIHNpemUgYW5kIGNwb3J0X2lkIG1hdHRlciBm
b3IgQUNLcy4gKi8NCisJZ2JfaGRyLT5zaXplID0gY3B1X3RvX2xlMTYoc2l6ZW9mKCpnYl9oZHIp
KTsNCisJY3BjX2Nwb3J0X3BhY2soZ2JfaGRyLCBjcG9ydC0+aWQpOw0KKw0KKwljcGNfcHJvdG9j
b2xfcHJlcGFyZV9oZWFkZXIoc2tiLCBhY2spOw0KKw0KKwljcGNfaGRfc2VuZF9za2IoY3BvcnQt
PmNwY19oZCwgc2tiKTsNCiB9DQogDQogdm9pZCBjcGNfcHJvdG9jb2xfb25fZGF0YShzdHJ1Y3Qg
Y3BjX2Nwb3J0ICpjcG9ydCwgc3RydWN0IHNrX2J1ZmYgKnNrYikNCiB7DQogCXN0cnVjdCBjcGNf
aGVhZGVyICpjcGNfaGRyID0gKHN0cnVjdCBjcGNfaGVhZGVyICopc2tiLT5kYXRhOw0KKwlib29s
IHJlcXVpcmVfYWNrID0gY3BjX2hlYWRlcl9nZXRfcmVxX2FjayhjcGNfaGRyKTsNCiAJdTggc2Vx
ID0gY3BjX2hlYWRlcl9nZXRfc2VxKGNwY19oZHIpOw0KIAlib29sIGV4cGVjdGVkX3NlcSA9IGZh
bHNlOw0KKwl1OCBhY2s7DQogDQogCW11dGV4X2xvY2soJmNwb3J0LT5sb2NrKTsNCiANCi0JZXhw
ZWN0ZWRfc2VxID0gc2VxID09IGNwb3J0LT50Y2IuYWNrOw0KLQlpZiAoZXhwZWN0ZWRfc2VxKQ0K
LQkJY3BvcnQtPnRjYi5hY2srKzsNCi0JZWxzZQ0KLQkJZGV2X3dhcm5fcmF0ZWxpbWl0ZWQoY3Bj
X2hkX2RldihjcG9ydC0+Y3BjX2hkKSwNCi0JCQkJICAgICAidW5leHBlY3RlZCBzZXE6ICV1LCBl
eHBlY3RlZCBzZXE6ICV1XG4iLCBzZXEsIGNwb3J0LT50Y2IuYWNrKTsNCisJaWYgKHJlcXVpcmVf
YWNrKSB7DQorCQlleHBlY3RlZF9zZXEgPSBzZXEgPT0gY3BvcnQtPnRjYi5hY2s7DQorCQlpZiAo
ZXhwZWN0ZWRfc2VxKQ0KKwkJCWNwb3J0LT50Y2IuYWNrKys7DQorCQllbHNlDQorCQkJZGV2X3dh
cm5fcmF0ZWxpbWl0ZWQoY3BjX2hkX2RldihjcG9ydC0+Y3BjX2hkKSwNCisJCQkJCSAgICAgInVu
ZXhwZWN0ZWQgc2VxOiAldSwgZXhwZWN0ZWQgc2VxOiAldVxuIiwNCisJCQkJCSAgICAgc2VxLCBj
cG9ydC0+dGNiLmFjayk7DQorCX0NCisNCisJYWNrID0gY3BvcnQtPnRjYi5hY2s7DQogDQogCW11
dGV4X3VubG9jaygmY3BvcnQtPmxvY2spOw0KIA0KLQlpZiAoZXhwZWN0ZWRfc2VxKSB7DQorCS8q
IEFjayBubyBtYXR0ZXIgaWYgdGhlIHNlcXVlbmNlIHdhcyB2YWxpZCBvciBub3QsIHRvIHJlc3lu
YyB3aXRoIHJlbW90ZSAqLw0KKwlpZiAocmVxdWlyZV9hY2spDQorCQljcGNfcHJvdG9jb2xfcXVl
dWVfYWNrKGNwb3J0LCBhY2spOw0KKw0KKwlpZiAoZXhwZWN0ZWRfc2VxICYmICFjcGNfaGVhZGVy
X2lzX2NvbnRyb2woY3BjX2hkcikpIHsNCiAJCXNrYl9wdWxsKHNrYiwgQ1BDX0hFQURFUl9TSVpF
KTsNCiANCiAJCWdyZXlidXNfZGF0YV9yY3ZkKGNwb3J0LT5jcGNfaGQtPmdiX2hkLCBjcG9ydC0+
aWQsIHNrYi0+ZGF0YSwgc2tiLT5sZW4pOw0KLS0gDQoyLjUyLjANCg0KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0
IC0tIGdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKVG8gdW5zdWJzY3JpYmUgc2VuZCBhbiBl
bWFpbCB0byBncmV5YnVzLWRldi1sZWF2ZUBsaXN0cy5saW5hcm8ub3JnCg==
