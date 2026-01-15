Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id CE057D258B9
	for <lists+greybus-dev@lfdr.de>; Thu, 15 Jan 2026 16:59:11 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 0153F401BE
	for <lists+greybus-dev@lfdr.de>; Thu, 15 Jan 2026 15:59:11 +0000 (UTC)
Received: from mx0b-0024c301.pphosted.com (mx0b-0024c301.pphosted.com [148.163.153.153])
	by lists.linaro.org (Postfix) with ESMTPS id 3CF553F8F4
	for <greybus-dev@lists.linaro.org>; Thu, 15 Jan 2026 15:58:47 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=silabs.com header.s=pps12202023 header.b=toAsRrJZ;
	dkim=pass header.d=silabs.com header.s=selector1 header.b=eHSJbUhs;
	spf=pass (lists.linaro.org: domain of Damien.Riegel@silabs.com designates 148.163.153.153 as permitted sender) smtp.mailfrom=Damien.Riegel@silabs.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1");
	dmarc=pass (policy=reject) header.from=silabs.com
Received: from pps.filterd (m0101742.ppops.net [127.0.0.1])
	by mx0a-0024c301.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60FFldAY459480;
	Thu, 15 Jan 2026 09:58:37 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps12202023;
	 bh=zKELo52QtGJ6C2nSmlBARgqTkzH8lU/8LI05rb+XfD4=; b=toAsRrJZ8mqZ
	aTZ0UL2+oJRsiw5Tf1tlLxE1mnXqZG8PptfAjS8pmfTzcaOvY8hIbivQkXEktCFP
	wnokKWbASIPjRGrpPbJYosDWmq2z1o652j6m20GgXOMaF3s+5b8/p3cF7Oyrk2g5
	WyiqvHvM6/vHG4cpb/RwseICao512xfSE+rVgJiu9r7V+PY3iWOyQFN7evvDIFpb
	iu+EpuF7Xc72wyCC/L/Cu1RIw/paUmLFvD7QYLHjCpTKxnE//QU3i1+qgTeCLpJd
	asTvudZAxudakpbcgeUxnrkvJe5IUhP8n/SiwfEkxXKZ1sjJ3xgTXbt1E3VFCKyo
	qeiYd9p4eg==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11020073.outbound.protection.outlook.com [40.93.198.73])
	by mx0a-0024c301.pphosted.com (PPS) with ESMTPS id 4bq36kr0uv-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 15 Jan 2026 09:58:37 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=chcJIv/en5vWP+qwYigMb/uzidG6cQxi2eE1cUA32BkETT0iY7eF4PV+nErYhi4olhu5ygSclQKspp0nAJuV6/IbxCd8m/EVWsirbcp6WlwvZVuNm3vR5/8uejUmHa/eyhKMId2HrKVjdIMEbwV6jlNmzNfcWjj6qQDL90Bp2YybMu3hkTQcozdjKDXt/UaFvokdA6oZ06CTfzO2u9zf5Xgke2MhDDU7zUHNoeQoLsENrDqrdHT4VDrTbawdXZF3otxNIHW8pIpnV/VKtne+4JhO0zZdkBsD8CBt0fEFLox8WaiO7jKU5sfaOBPrJY0+DxjghPPnxeHZWwVMe/Eecw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zKELo52QtGJ6C2nSmlBARgqTkzH8lU/8LI05rb+XfD4=;
 b=tSZeDmrXq3kGa6+btLh72sOCkaOmPN1ydvx+QZ4RNgkX9o6dKrBY+xMt8xUPwi1Cd2bwDZtj6yRT0CabYOO/0u1gtqTa6jxdMTeeBrqdFZqXABF+QSUQy/UYOZxnv04X2FDJlhdaEvNPuPGvlkpElmhNneNb/yI5MOv65k5f3ITs5TuvSAHtF7F1KQhPdkk0uOOnXr8W8rzBPGpYGNQrqNrwycujy8+z/XuuwfMniY19MjSoodiJlRnVNXGlfWNcow1nlmugM/u8bKBEAo102fxbD48kLv9M8q/QUJBaUz0NE/2ROx6Ej2dTFcf+nFhSJqnUb4bYqU5a4xNZNM2RXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silabs.com; dmarc=pass action=none header.from=silabs.com;
 dkim=pass header.d=silabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zKELo52QtGJ6C2nSmlBARgqTkzH8lU/8LI05rb+XfD4=;
 b=eHSJbUhs5o9GVQCh/g5yahPqRbc2A7BEvzwmeTBejyAAfXXv2DGamMbnsNdqosacXO2q6FonyMfuw/EEhB7tsMcvXrcIYmUOe8wUJf3le+syorCTJ9DMl8Sx6aSxcrUCrLcKui8YgYLCJS78oAYDbA38XkF3Nr6ToYsTe/uTzhI=
Received: from DS0PR11MB8205.namprd11.prod.outlook.com (2603:10b6:8:162::17)
 by SA2PR11MB5097.namprd11.prod.outlook.com (2603:10b6:806:11a::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Thu, 15 Jan
 2026 15:58:35 +0000
Received: from DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::2de6:bc88:2af7:3583]) by DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::2de6:bc88:2af7:3583%3]) with mapi id 15.20.9520.005; Thu, 15 Jan 2026
 15:58:35 +0000
From: =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
To: greybus-dev@lists.linaro.org, Johan Hovold <johan@kernel.org>,
        Alex Elder <elder@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org
Date: Thu, 15 Jan 2026 10:57:58 -0500
Message-ID: <20260115155808.36102-6-damien.riegel@silabs.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260115155808.36102-1-damien.riegel@silabs.com>
References: <20260115155808.36102-1-damien.riegel@silabs.com>
X-ClientProxiedBy: YQZPR01CA0025.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:86::22) To DS0PR11MB8205.namprd11.prod.outlook.com
 (2603:10b6:8:162::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8205:EE_|SA2PR11MB5097:EE_
X-MS-Office365-Filtering-Correlation-Id: 942a5f97-1064-4497-1e56-08de544ef083
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?b0dTaE40S0RKMitObllualhmdm5GZ1ZZdGRJZVk4bVpSRUprNG9BUHV0WmJP?=
 =?utf-8?B?Kzg4RmYzZlBLQXdra0ZkcXlzcWJTcUpSNDAwNkFsTHRHbmlRWm9yTVpueG9a?=
 =?utf-8?B?UEdkV1pBYTJha0owUFpaNEdsb25IWWtibVBSU2s2M05jd1d3WUhZYkNqKzQv?=
 =?utf-8?B?emMrSzJuZmZUMlJvS2h5QzhYelAzL3lXRjlYRnFESmlmREtvWXpyd3ZNcWli?=
 =?utf-8?B?VlNzdE1WZlhqc1dkNkJMRWx5bis0NmtFMzNZdE9kWXJKdTBza2NwKzNLMC9L?=
 =?utf-8?B?NStkNTFwVHdKWGYwWGdaaGpBMWNlMUVsaGFlbTlpNmt5c1lFK2JsN0ZwcDZX?=
 =?utf-8?B?c2tmS2RlMFVCcmRQTTZZeUxwWHZxd2xRVmcyUEtGWSt3VDhzM0RPck1NTC9z?=
 =?utf-8?B?aUJUcHF3NkdHeG5vb2d6OWo5UnZqRWgxS3hhdXB4Q2kzNDNEanhsZEN3Znhi?=
 =?utf-8?B?SFQ1bHRyLzFIVHJpUURNU3dQbDNrL0dzTVYyZm5YMTBmZWQzNURVU1B4SzBC?=
 =?utf-8?B?aS9raDJ0ZnJvQTBrbVFodGpZcWIvdTFQYlpYaURkT3VxYzZZRHJ6ZmRIeEp5?=
 =?utf-8?B?ZWpDdW1hQURlT3d6QXY4YUpIdFNTQVRDNjZLdmxpTy9CU2ZGVzBud1RNMVFE?=
 =?utf-8?B?Z1FEcmVHOVBabWJjSlVjKzVZRkQ5SWZIYzNOYzZSZjR6Y2ZXdGtxQWZ0RGtG?=
 =?utf-8?B?REVaTUxOajM4YjhXTzIrR011VTM3d3lNa2laNWcxVWhwS3dOeklOZUtCSEw3?=
 =?utf-8?B?WkVsVmhtMFJ5SXlPWFNURmdPemVyRWNHclU2eGNrL0JDVDgvTW9yc2YxejZn?=
 =?utf-8?B?SGlrZ1kvS1JTTXVhZE1SN0xzbnJaNW8yeGI1RmFYTDRuV3YyUFZaNkZLY3Nn?=
 =?utf-8?B?Uk1GWVJNb01oUmxSUnpCWm4rN2Nra0FzZnlNakFlY1BraHJYOGpMakVqM01B?=
 =?utf-8?B?cTJNZUNaNXlVMTY4ZjlVOU9oSW9rQUZ0UDByRzAzMXJmQkoyUjZqQ01ldGRy?=
 =?utf-8?B?VWZHMmxDS3JCSHBlWmlKdjNtRFRtL04ybXhSeThTQVY0amdYenQ4SnVIODJj?=
 =?utf-8?B?cmZhdExZTzFKRlJsdnNDcllVc3ptMWF1TmJkS1QycnFHQWRSUWxPMmI2anFS?=
 =?utf-8?B?QlFoZWY2K3ZHUmsvM0w5Y1d0c29zSkVrR2NIempuVy90N1FxQUN2YWt4UElh?=
 =?utf-8?B?WVA5alJUK0hKMm1oRVovZ2tadFB0MWpyQmFxeTJEcFdqOTFXOVFNM1FyTjRq?=
 =?utf-8?B?QWdFWVJnVDlxd1orUFMzVWx6MDkyQnpieiszcjV5dUtkRmJkbEMwY3BoRjRr?=
 =?utf-8?B?bVcvUkdDLzd5Ty9MVVVpcGZZTnI4Zkd4WENiSytiNDh4QW5BYXNKc0RVM1dP?=
 =?utf-8?B?blNVd3E0Tnl1VHVkVlU0b051U2dRVi9sekhrWkZUVnR5b1F5TTBIOVVRWjRl?=
 =?utf-8?B?bUVVelRUd29GWDQzVnNDdW91UjdLTW1zWVI1a1VPam9RNHFyR3lDOXN4R2dC?=
 =?utf-8?B?RUhwNUJiYWJUNVloYWFGdkZtWlNVS0hYQjJUU3NJTm5jdjJBOUxQeWRnODJK?=
 =?utf-8?B?OHViem1nL25EVjN5anU1MDRyOFQ5eVd1aDV1eXVsVHkxSExxenpaSXB4Qk5q?=
 =?utf-8?B?MGFjMEZXT3o5T0taUDYzQ1gvVUdpL1JRWWJXcUEreXkxejJra3IzdTJ0dkdi?=
 =?utf-8?B?OTJHUHBGNit3S1J2VHBVS2hsNVM3RW8wYjNNdjZSM1QrVlU0bGJrV3ZtcUxi?=
 =?utf-8?B?Z3V0bUI2Ukc2Zm5hWWRkZ0k5bGZDZEx1eWJYWk1GbUJ1Qktib0V0aEhoSTRB?=
 =?utf-8?B?MDJhM1cyNlpzMTJUSWhTVVBNWUV0UmdwdS9iZWxsMDdpMXp1QUxxWFFPTFl1?=
 =?utf-8?B?eUcvdE9rbVFwWWVoNlp6K283by9wSENxRmUwdzZWTm1GSllqNmFMb0hKbk52?=
 =?utf-8?B?SG5FUVFTWEM1UEgyajlpNjFYc3BLYkNwcXpxRFh6SXoxY0NoK3dPdnlVcWk2?=
 =?utf-8?B?R09xcHF2M2tTTllFdU5ydkpZdVJYbTI4L3c5dVRuM0lrWFZ3dzJoRjFKZFJY?=
 =?utf-8?B?Vzd5UytReVkrVnJUdUExVmVGaGlEdXFEQXdWUmI0dlNDQ2s0Q1pTQXVJQllL?=
 =?utf-8?B?aDNTU0xmeDB4SS8zbUoyUWI4dHY1WlcrdTJZUjF1NFdGanFLM3dJcEFDSGVk?=
 =?utf-8?Q?IPMCuNfJJup5j2CV6tTcUIg=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8205.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?d1Y1YkM2aWNRaWR5dkdyVy9zUWpkV2pwQVBKS016WU5SWVUzd1RtbCtZa3Zy?=
 =?utf-8?B?RS92TWRXL1habnM1QSswcDJrUmswYmpubnlvY0hNOTE1MDRnc2lEVzkybkV1?=
 =?utf-8?B?V0l0OFMweks3L0RhbFJlZ280bVIwdDFtM2dBOUU5eGRKeUZkSmlZck1QV2t3?=
 =?utf-8?B?b1VoOEY3RTRvdGY5U0xoRktoZTlWbWRmZnZ6NWhUbHNRcjc5YnBkYWcwYlhn?=
 =?utf-8?B?RVFqRVowY01UUjBrRXpvVTVjSTg3dkR5Tm0wZmVFQ0VRNlRYN1FnbS94bFdP?=
 =?utf-8?B?cWF2MUczZ015SU9WTmNwNUs4YjlVRVlIY2hId0UyVU9kcTZodTE5YWpxZEdy?=
 =?utf-8?B?MHRQMWdOTWYzTS90OUxHb2hGd0dDWXZmV2x3UnRiMkFjNm5lb3RPK1JPYnpn?=
 =?utf-8?B?UmdZbHJ3c2IycEdmcEJSTUxTSUhScS9CVXRYU1pRNjQ2bk84K2JmcGNMak42?=
 =?utf-8?B?alFYSG95bG5xZk9qM3VnNFhZOExIZU5ramQvdk9vUUpneEppcU9CQVdSMEdM?=
 =?utf-8?B?bDVRMFlsTzZyMjhOQ3M2cmVia0VqSUVXWTh3MnhrTEowVklNODhEbzNhRzNj?=
 =?utf-8?B?YnRaMkY2bURYaHpkMmpIMHVxZHdubmczUFovcGl4L1Q4T1prWld0cU9NaUNs?=
 =?utf-8?B?OFhtN3kzMlBFT2UrWU9HTlpwYnMrZHBHbEE2RStHaklncERSL3VPV2Z5bkUz?=
 =?utf-8?B?Y3duL2RPUUFwYWFHZUdMRGY1aXVPcFBpK1dFYjFLZnZ3K2M2Y1pmU0ZYbU5T?=
 =?utf-8?B?ZU1qTU10MnptUXV2dnZOQ0ZYMEUzOENWOGNYbXdCdEkzdWt0cWtVSDV6aFNQ?=
 =?utf-8?B?Ry9qRUlaK1ZRYVF0UTlycFo3S244MkhGQlpWYUxQakJPU0VJMFoxd3hiSk05?=
 =?utf-8?B?VTArMDlCbFBhYk42d1RjY0JRRWJBZW5TUXNMeFk0UTRjaFZVWGU5Y05MZGlj?=
 =?utf-8?B?MUJXZTN3OVNHeXJLRlVFakMvT0RrM2k0UEEva1VpZ04yWjk0N0Z0YzVHRGYz?=
 =?utf-8?B?V0FNUTdZeW9jQ3h5L2pqVEJ2QVNmNEVQdTlkdXRxRzNCRmh5WTYyR3E0dWhY?=
 =?utf-8?B?RUZEZzlYWDJGeVMxcXBSSGFWWjZuUjZZS3R3aE1sekRqMnYxU2pqWVIwQkFH?=
 =?utf-8?B?S3BZclpvakxDQ3BaRkdhTGxxeTc1Sm1la1N0UERRVURsVGhVMDZyYk54SjU0?=
 =?utf-8?B?bWhIcG5rYS9EU1RFaENtbjYyWGZQMlZWcExvY0Q5Nk0wYW1wemFPZERLYXR3?=
 =?utf-8?B?UkV2dnowOGZRN2pkVDlHdFI1Z2hUVm1nWXBIM3ZmYkQ3ZFRlMm5YZXJJMkFw?=
 =?utf-8?B?RHFSWlV4TGkrdXVUc0lWQ0I2c2tSTmdVZExTMXoreTRFUHZmdEhQejd0YWN3?=
 =?utf-8?B?Z3pUM0JZMG9CVngvYWlaS0dSRVBpeWtiUk5iNDQwUkhSR1Bha015bFptQ0c0?=
 =?utf-8?B?UTVYUWlxaXpZY1ozY3owTFZuSmFHZE4rbmpMUTNvOXBwMG5XaEdORExiczdq?=
 =?utf-8?B?dXRvTUVaVGJYaTFpQWlkQUFQNFpSc1pUaVRJV2dJbGNUZGhueittZ1hyaFN6?=
 =?utf-8?B?MHMyV3BPSHlKMXdadm0xQkYxb01BYzdSTEh3MWxTR2hlU2VSUWNVdUhmREJC?=
 =?utf-8?B?N3VHaHFnQlkyUFp1TGhvNVRlV1NTY0ZIVHZiQXNrT3kwZTY0OE9VZm5oOXFa?=
 =?utf-8?B?WXA0QzFuZjA4STFDSXUxY2xyWC9NdDQvcGtuZWI3QkMwMWRiWlRCc2FML0J6?=
 =?utf-8?B?SFVwS3Y1bHM0TE56NnR2ZkNwMzIwV3hFRzFJZ1ZTOENwRHhkdmhYZzBVZkcv?=
 =?utf-8?B?QzRQT25oSFY1K0ZHL0xxeTNqeVd3RStJTU1hMFZ6d2xJQVFRWFp5K00yMHNP?=
 =?utf-8?B?Q0hPVDdqMGtiQ0hSYXBzUndVemlYRXlOTEJNaGNHeXZta2pqem1iR1FYWnhn?=
 =?utf-8?B?WWhNZ085SGh3eFRXL3VhVHhiNk1wUDZBVFVQTnd2MFBlbCtvWW8weTR3cVpO?=
 =?utf-8?B?eVNRczNzVm81dHlFc1JRQjVDWFJuNWhGdEZ6clZOcnhnSDBUR1ZPZXBabEhU?=
 =?utf-8?B?Ujl2bVlEd3dZWGcxR0tuVW52YWtmdC9mNlNieTNEVkQvUGR3bFQ3cnJtYkFL?=
 =?utf-8?B?OXNabWdSQUo1WGRqTVZ0c05aNGpMZ01yL3lSb3FlZFAxdE44TVdzN201bEtO?=
 =?utf-8?B?ZlZLOTM1cVlsZithcEZqdmRyUmRBQU5xRVZHbWc2c3FldG9McmxpbUREcWdn?=
 =?utf-8?B?YnNhUHpZRHdoK2U3VUQxQmEyNnhGZ0hOSTF3UW1PZHAyQlNJWFNkRUZJOHBo?=
 =?utf-8?B?cklTa2YvYlV4M0JrYVlUdUM4ZVdRTzhtcm14NjhldkF5THlmR1ZWUT09?=
X-OriginatorOrg: silabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 942a5f97-1064-4497-1e56-08de544ef083
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8205.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 15:58:35.4023
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 54dbd822-5231-4b20-944d-6f4abcd541fb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qHgjzjJZQr53BXmBk9aAxFLS5mK2sZEGKZVWNtX2lNMPK7I4pkWmSYt5mT+qruymchKouS+9pm9IBxYiIsCwYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5097
X-Proofpoint-GUID: AU_AsXBBYn6H6L6u9CVNSunM4dP5IxXE
X-Authority-Analysis: v=2.4 cv=M6BA6iws c=1 sm=1 tr=0 ts=69690ead cx=c_pps
 a=XGteBKPvimVCBgpwGHxg/w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=M51BFTxLslgA:10
 a=i1IsUcr2s-wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=2AEO0YjSAAAA:8
 a=9SkM2ZN-1AJx8s29AtcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDEyMSBTYWx0ZWRfXy3BZetgNjyg4
 2JslpBjzbsYNy1fk8qLFQ+qzmnwcgYzHDAlBiCC04YOXYKMq8SqRuN89jf0TNAmzh/Fb0aCHIFw
 grV7AAFeDnQDAO3EcuSP8hLEFnWJ4dLVujiez3LRR+u4YjV7FNcr2T/3cCkIneoGtm97+ipjiaf
 MPoBiqsvAtmPEXSIGvN1rKzWjxOIni90PPEIQdJgZohZcC/4XEh+ThM0X1RSy/dXYSsyFRHQ6d7
 jhJ1ujIIruYnmHNyWGe2EDnW1WuBJQCIVeHxYNShb/qotgsCK1ViqI/KbAkNTybj3ZQH7BTzI2f
 /+Rn1DnlBxS6plKwXqdLCC8vELlmjD8tb4a4+Hz2zIgoiRkZNQpk0jlDeb8Gla9ZCRBh0DJqdkh
 MVGl2gUKC1Zxsid75Cl7AP6AgFeOknhtjZRm9M2sc5VBzyxJePLGwFRP4wOeylqjgVR7jkDAc01
 yfPeqIfMoBhl8pBc8yg==
X-Proofpoint-ORIG-GUID: AU_AsXBBYn6H6L6u9CVNSunM4dP5IxXE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_05,2026-01-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 spamscore=0 adultscore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601150121
X-Rspamd-Queue-Id: 3CF553F8F4
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
Message-ID-Hash: XRSGF2P6J2DTDLFRVB3VDRFU37LYVV2F
X-Message-ID-Hash: XRSGF2P6J2DTDLFRVB3VDRFU37LYVV2F
X-MailFrom: Damien.Riegel@silabs.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Silicon Labs Kernel Team <linux-devel@silabs.com>, =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v2 05/14] greybus: cpc: switch RX path to socket buffers
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/XRSGF2P6J2DTDLFRVB3VDRFU37LYVV2F/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

Rm9yIHN5bW1ldHJ5LCBhbHNvIGNvbnZlcnQgdGhlIFJYIHBhdGggdG8gdXNlIHNvY2tldCBidWZm
ZXJzIGluc3RlYWQgb2YNCnU4KiBidWZmZXJzLiBUaGUgbWFpbiBkaWZmZXJlbmNlIGlzIHRoYXQg
Q1BDIGhvc3QgZGV2aWNlIGRyaXZlcnMgd2VyZQ0KcmVzcG9uc2libGUgZm9yIGFsbG9jYXRpbmcg
YW5kIGZyZWVpbmcgdGhlIGJ1ZmZlcnMuIE5vdyB0aGV5IGFyZSBvbmx5DQpyZXNwb25zaWJsZSBm
b3IgYWxsb2NhdGluZyB0aGUgc2tiIGFuZCBwYXNzIGl0IHRvIHRoZSB1cHBlciBsYXllciwgdGhl
DQpDUEMgImNvcmUiIG1vZHVsZSB3aWxsIHRha2Ugb2YgcmVsZWFzaW5nIGl0IHdoZW4gaXQncyBk
b25lIHdpdGggaXQuDQoNClNpZ25lZC1vZmYtYnk6IERhbWllbiBSacOpZ2VsIDxkYW1pZW4ucmll
Z2VsQHNpbGFicy5jb20+DQotLS0NCiBkcml2ZXJzL2dyZXlidXMvY3BjL2hvc3QuYyB8IDEzICsr
KysrKysrLS0tLS0NCiBkcml2ZXJzL2dyZXlidXMvY3BjL2hvc3QuaCB8ICAyICstDQogMiBmaWxl
cyBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dyZXlidXMvY3BjL2hvc3QuYyBiL2RyaXZlcnMvZ3JleWJ1cy9jcGMvaG9zdC5j
DQppbmRleCBiMDk2YjYzOTE4Mi4uN2ZmYTNiZjQwMjEgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dy
ZXlidXMvY3BjL2hvc3QuYw0KKysrIGIvZHJpdmVycy9ncmV5YnVzL2NwYy9ob3N0LmMNCkBAIC0y
MDMsMjAgKzIwMywyMyBAQCB2b2lkIGNwY19oZF9tZXNzYWdlX3NlbnQoc3RydWN0IHNrX2J1ZmYg
KnNrYiwgaW50IHN0YXR1cykNCiB9DQogRVhQT1JUX1NZTUJPTF9HUEwoY3BjX2hkX21lc3NhZ2Vf
c2VudCk7DQogDQotdm9pZCBjcGNfaGRfcmN2ZChzdHJ1Y3QgY3BjX2hvc3RfZGV2aWNlICpjcGNf
aGQsIHU4ICpkYXRhLCBzaXplX3QgbGVuZ3RoKQ0KK3ZvaWQgY3BjX2hkX3JjdmQoc3RydWN0IGNw
Y19ob3N0X2RldmljZSAqY3BjX2hkLCBzdHJ1Y3Qgc2tfYnVmZiAqc2tiKQ0KIHsNCiAJc3RydWN0
IGdiX29wZXJhdGlvbl9tc2dfaGRyICpnYl9oZHI7DQogCXUxNiBjcG9ydF9pZDsNCiANCiAJLyog
UHJldmVudCBhbiBvdXQtb2YtYm91bmQgYWNjZXNzIGlmIGNhbGxlZCB3aXRoIG5vbi1zZW5zaWNh
bCBwYXJhbWV0ZXJzLiAqLw0KLQlpZiAoIWRhdGEgfHwgbGVuZ3RoIDwgc2l6ZW9mKCpnYl9oZHIp
KQ0KLQkJcmV0dXJuOw0KKwlpZiAoc2tiLT5sZW4gPCBzaXplb2YoKmdiX2hkcikpDQorCQlnb3Rv
IGZyZWVfc2tiOw0KIA0KIAkvKiBSZXRyaWV2ZSBjcG9ydCBJRCB0aGF0IHdhcyBwYWNrZWQgaW4g
R3JleWJ1cyBoZWFkZXIgKi8NCi0JZ2JfaGRyID0gKHN0cnVjdCBnYl9vcGVyYXRpb25fbXNnX2hk
ciAqKWRhdGE7DQorCWdiX2hkciA9IChzdHJ1Y3QgZ2Jfb3BlcmF0aW9uX21zZ19oZHIgKilza2It
PmRhdGE7DQogCWNwb3J0X2lkID0gY3BjX2Nwb3J0X3VucGFjayhnYl9oZHIpOw0KIA0KLQlncmV5
YnVzX2RhdGFfcmN2ZChjcGNfaGQtPmdiX2hkLCBjcG9ydF9pZCwgZGF0YSwgbGVuZ3RoKTsNCisJ
Z3JleWJ1c19kYXRhX3JjdmQoY3BjX2hkLT5nYl9oZCwgY3BvcnRfaWQsIHNrYi0+ZGF0YSwgc2ti
LT5sZW4pOw0KKw0KK2ZyZWVfc2tiOg0KKwlrZnJlZV9za2Ioc2tiKTsNCiB9DQogRVhQT1JUX1NZ
TUJPTF9HUEwoY3BjX2hkX3JjdmQpOw0KIA0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3JleWJ1cy9j
cGMvaG9zdC5oIGIvZHJpdmVycy9ncmV5YnVzL2NwYy9ob3N0LmgNCmluZGV4IDJlNTY4YmFjNDRl
Li5jYzgzNWY1Mjk4YiAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3JleWJ1cy9jcGMvaG9zdC5oDQor
KysgYi9kcml2ZXJzL2dyZXlidXMvY3BjL2hvc3QuaA0KQEAgLTQ1LDcgKzQ1LDcgQEAgc3RydWN0
IGNwY19ob3N0X2RldmljZSAqY3BjX2hkX2NyZWF0ZShzdHJ1Y3QgY3BjX2hkX2RyaXZlciAqZHJp
dmVyLCBzdHJ1Y3QgZGV2aWMNCiBpbnQgY3BjX2hkX2FkZChzdHJ1Y3QgY3BjX2hvc3RfZGV2aWNl
ICpjcGNfaGQpOw0KIHZvaWQgY3BjX2hkX3B1dChzdHJ1Y3QgY3BjX2hvc3RfZGV2aWNlICpjcGNf
aGQpOw0KIHZvaWQgY3BjX2hkX2RlbChzdHJ1Y3QgY3BjX2hvc3RfZGV2aWNlICpjcGNfaGQpOw0K
LXZvaWQgY3BjX2hkX3JjdmQoc3RydWN0IGNwY19ob3N0X2RldmljZSAqY3BjX2hkLCB1OCAqZGF0
YSwgc2l6ZV90IGxlbmd0aCk7DQordm9pZCBjcGNfaGRfcmN2ZChzdHJ1Y3QgY3BjX2hvc3RfZGV2
aWNlICpjcGNfaGQsIHN0cnVjdCBza19idWZmICpza2IpOw0KIHZvaWQgY3BjX2hkX21lc3NhZ2Vf
c2VudChzdHJ1Y3Qgc2tfYnVmZiAqc2tiLCBpbnQgc3RhdHVzKTsNCiANCiBpbnQgY3BjX2hkX3Nl
bmRfc2tiKHN0cnVjdCBjcGNfaG9zdF9kZXZpY2UgKmNwY19oZCwgc3RydWN0IHNrX2J1ZmYgKnNr
Yik7DQotLSANCjIuNTIuMA0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpncmV5YnVzLWRldiBtYWlsaW5nIGxpc3QgLS0gZ3JleWJ1cy1kZXZAbGlzdHMu
bGluYXJvLm9yZwpUbyB1bnN1YnNjcmliZSBzZW5kIGFuIGVtYWlsIHRvIGdyZXlidXMtZGV2LWxl
YXZlQGxpc3RzLmxpbmFyby5vcmcK
