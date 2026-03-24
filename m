Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YAveOD2Zwmm3fQQAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Tue, 24 Mar 2026 15:01:33 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 67AE1309D74
	for <lists+greybus-dev@lfdr.de>; Tue, 24 Mar 2026 15:01:25 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id D2FD03F7B6
	for <lists+greybus-dev@lfdr.de>; Tue, 24 Mar 2026 14:01:23 +0000 (UTC)
Received: from mx0a-0024c301.pphosted.com (mx0a-0024c301.pphosted.com [148.163.149.154])
	by lists.linaro.org (Postfix) with ESMTPS id 46D723F7AA
	for <greybus-dev@lists.linaro.org>; Tue, 24 Mar 2026 14:01:19 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=silabs.com header.s=pps12202023 header.b=LNreqS7+;
	dkim=pass header.d=silabs.com header.s=selector1 header.b=QzTGnNMw;
	arc=reject ("signature check failed: fail, {[1] = sig:microsoft.com:reject}");
	spf=pass (lists.linaro.org: domain of "prvs=1543d7b3bc=damien.riegel@silabs.com" designates 148.163.149.154 as permitted sender) smtp.mailfrom="prvs=1543d7b3bc=damien.riegel@silabs.com";
	dmarc=pass (policy=reject) header.from=silabs.com
Received: from pps.filterd (m0101743.ppops.net [127.0.0.1])
	by mx0a-0024c301.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O7ZFwi1409221;
	Tue, 24 Mar 2026 09:00:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps12202023;
	 bh=9VXrwkjg4ESeJeZgBeHMgHXCVi01/vCsk4cQXJSCjkk=; b=LNreqS7+peg2
	pSlv6DgWOuVx6+x0Qy+i6S9ayDdymdr3T6/yagpAReFrYBmn9Wdn68ty73xbMV/p
	0f7Xv8mmcEzVwxv31nZ6qe6J5IuokVQvq33es2SyHWkHlypz5pyBEUpz73VNyENd
	T4BOBYK4m685GhlfxOHFJqBbkTiF5QJg2MbauJWgYNMTprmzMp2g0lmmdCfbRHeO
	ErxViF9gW+pec/wVo5ohNXs9oq8k9d5tynl0yvZjArPJPcc8VJ9jlrTknNSRM2uL
	QfLw9VhtBJ20W3+YujF/ucQlKjgu+/CF+tvXDKDSOoF5dH4MYDQkqZtl2TQ9ZGpg
	Ll6mnOzNLQ==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11023105.outbound.protection.outlook.com [40.107.201.105])
	by mx0a-0024c301.pphosted.com (PPS) with ESMTPS id 4d1qn5dxka-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 24 Mar 2026 09:00:54 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KWUCy7CgJiy93n1oeAJn/WsWOxNc2Cv/UqHrQLxGO8ZBkk2i39TUDD/8zHsW+nYE7Pnb4lmSPyHF61mzhvRe65mSrYWdgau+2gAoi9P+4kKGExiSNYyQRM9H/zU4mJ2yCJLt0R6PKCadkx+ho0auOI+eljHhLI51BLZ6gR5oKrEWM+5mpJxJpYb7NZHBgPTTMbQ3wkMzdrpUHOFU0sFDwhdWwduwtzaxPGu80w9E66HkRR8guJOUieSHaScLF3mFlYLI7gwhHFrWTzKc4Y17esrbD9YenATaTuKWI6QdRUETM7shzmtEVj/56U9ouHTHaWMGzCgDzggdgxzROnrMhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9VXrwkjg4ESeJeZgBeHMgHXCVi01/vCsk4cQXJSCjkk=;
 b=kduZ1nv7xDLZ7Xy+We9CDrkc2hIHqJmOx4BG2XoDCausw7Eth1Le3mmA/Ydkaq/vhKgwUn2CHHgmLUNSvTc3Z0mDUgFFkkM5hGmx69MZGdEzudjcLZy+mCaqzRSuBVa6DpCJhtOxsXc1993i/ezRrgjupRPzPupDUwNHwHim1RwOL/psLZwEBcF3llfjkG0mkPMTku7VBfuSGUyj9vDZxwFYXX/gS2hci/tF9RBRkpo6IQO/Bh5LFKuqOdD0v026noFdY72HVEVw5UQnNrBgoE+a60/8I3k1+9KNFv62d4SF++454U1d6eKfEMzqJHuBwHyGjcygY4X5SJmFXtwThw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silabs.com; dmarc=pass action=none header.from=silabs.com;
 dkim=pass header.d=silabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9VXrwkjg4ESeJeZgBeHMgHXCVi01/vCsk4cQXJSCjkk=;
 b=QzTGnNMwt51+2kWM/X7SEYea02y1iVpIsxVVjf7xvotVppMrZ5a1eRKVxXFFiPz1x98vSTRu8rvLcFqiK7wVplMHWNaSKQj+tKifreyiZyEr4IJtWC0vsFt7bp0hcPXsbeVQGvlr/YUYsPLDUhHHvJLgYbYnp5zrDoMzJTMyQg8=
Received: from DS0PR11MB8205.namprd11.prod.outlook.com (2603:10b6:8:162::17)
 by SJ2PR11MB7619.namprd11.prod.outlook.com (2603:10b6:a03:4d1::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Tue, 24 Mar
 2026 14:00:51 +0000
Received: from DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::2de6:bc88:2af7:3583]) by DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::2de6:bc88:2af7:3583%3]) with mapi id 15.20.9745.019; Tue, 24 Mar 2026
 14:00:51 +0000
From: =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
To: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>,
        Alex Elder <elder@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dan Carpenter <dan.carpenter@linaro.org>
Date: Tue, 24 Mar 2026 10:00:39 -0400
Message-ID: <20260324140039.40001-2-damien.riegel@silabs.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260324140039.40001-1-damien.riegel@silabs.com>
References: <20260324140039.40001-1-damien.riegel@silabs.com>
X-ClientProxiedBy: YQZPR01CA0088.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:84::16) To DS0PR11MB8205.namprd11.prod.outlook.com
 (2603:10b6:8:162::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8205:EE_|SJ2PR11MB7619:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ec3e979-479c-4fce-3a19-08de89adc1a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	okMb8POdpJNluqujr05Nxonu65fryYktqnUjSH+ggL08QmJIBV+VEHd+nruzdFKBhzy4xekc3VFneG39Zc1X/xHTLA0m2tOc8Tpxao6BoE1tEiWExXq530hDy0q/LW4ddPO9qnhq/s6E66PrcaBgZJMMKstfvTFC1ZSmjZsbZYIXYJHHsHHHlO9JfNNOxy8lkuDrF7IO98JPbJmzWg8kwFQxZfDoa9/TTToedhBho+6+ZSzoyxEMWf5R8tRbpbr/f0olkaMySWjJT1iNIwgFUfceUDXIMqR8iXXrnJrmPBy2d4eP54I4aPBXKaECnuzIzTnThu5FYTKtxBOx3xNUMV2uVo8ZsyxOspouNSy4QmuAiJp3zrrcLCDbLfGvY5y7FPwZdPCz/04M9uJCE8W69tpj2NOAA9l5vSo2XxMSxWqZpNFjSz3bXkx2l4SJzgAxjrHTUtpZuwecDneHmJMoP1kres3Wr3vtPzxP4PP8zCJBSdJB5fc8t4a3a0UfJWtLgSlD+g3KSP1kT6e+jWksQ+7CtVglkGoaX8Kl3jn1JkG1MrhN/ytZrb5B8NfFmi1XNnHzuov11Rej8LEhmir5iajr0o1kM2yl4M8qMxpynedjLzwl83aytXz+vOdLzF+0415YGpwGrRbxCoAyvjUQ4o9qzgr+W/MHg8JReFfPfHvaonSiEUBKJB6xGRuVxj6QeZWtr6Tg572dR9byynOeW3+SP8hWgm4wTCxnGDlElhBJS4zBJ6TEV0LEBToHoe0optNFaleUKbb2kmrE0UINQo7RsAwf5fIUu8zgKhK76yI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8205.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RHpjNThHOEd0c3V1bEcvWGh4NlNWeXdrYURwQnl0TmM3emVJaTRpNEh0bzlu?=
 =?utf-8?B?V0doMk9Kb0c5Q0hpNzVHcUIyUjdzWDdCaFNMU2J4LzNsdFN0aXJVTUdTbmZy?=
 =?utf-8?B?cnhOOGtyU2tkQnJZbHZXK1VmenFsbW56alV0djIwZHlsUEJOaEVZZHRrWFRO?=
 =?utf-8?B?UHQwQ0p0YnY4U3ZpOFFEQUlqYnd2M2M1THRmbjEyU0l1cVFCcytvL04xZHVK?=
 =?utf-8?B?Wlc3ZktiWXZ6ZGpuTVZDVU00cHBNMjdYQllVRVMzUGtVQXlUL0N1YlFLK1Bi?=
 =?utf-8?B?UCsrRUwzZ3UwVjZqMC9jQ0g2YVlSWkcySUZ2TmtyNzlBYThMeEtVb1lVRXVU?=
 =?utf-8?B?NWZ3dXRpdUxKQXRMUzAwdTVJa3dwQlUya3FkSFk0dnVweWtzOHFWa2pESlVx?=
 =?utf-8?B?OGRITGIxOUxoY2dwZFhRNHdxanlJK2RURzBqcEFrbkR6bGQ0bGxTdE1ocjly?=
 =?utf-8?B?eVVyOW5oTklIK0lua2Z2VGlTWmxEUFBzWlhyNDhyYnZNbitGYjFzUDRweG53?=
 =?utf-8?B?S3JPNXM0TVBoVDlqSXVQem03cmpqRkliNFpnUzZuc3RqL2VuTW1TSDZZaXdk?=
 =?utf-8?B?SG5QUkdyMkN5UVBTVlZWUTlGMGRSbGo3SUpkc0VlRk56VjJmTVZEelNzQUNw?=
 =?utf-8?B?MTlKM0ZuamVIQWQrMTJHSTlyaGZ5NmlYYjRXVldzS3N6YU1POXBFamFRV3NJ?=
 =?utf-8?B?aU9sTTNjQkQvUERZVHppN3pkY0paeFJJbkdHZHpJbS80NEYrR3MxNU9Yd1pW?=
 =?utf-8?B?V0gybmhMUVYyL25uUkNoQjFyTEJSQ01JbzkyaEkyZU9UNlMwcTI3TkZLbEt5?=
 =?utf-8?B?bFZGMVBQWkY2RzNwSmx6d1VPY0NReXlkU2k5V2xpWHJ6SytqamVjYmQ0akYw?=
 =?utf-8?B?eGNaTkQ3UzlSdFN6ek43MFI2VDFlRVNBbEVkVVN1L3VqU2ZYc3ZGTTEwUHlH?=
 =?utf-8?B?N2VwTnJCYmN4U3hHUlpnTjFaQkxpaWNYUFZDejRQMFNaUk04MnNvbXl0Ukly?=
 =?utf-8?B?VkVsUmk3bDlmK2RZZXNudExudDZMLzd4RUJ2czFhMDlEeldCMXVtOHNoK1h0?=
 =?utf-8?B?Z1BMK2U1OWlYQ0hXdEdvYnUvdTFvM0NCUmRTbXEzeDZTaHYwYVpObmtDNEhN?=
 =?utf-8?B?QUtWZFlsYnhBNEFMRUZ2QUZxV2hYUUtOaEFoSW95Q2hUVEVtU0haam5aUk9v?=
 =?utf-8?B?T0JkOXF4SW1xQWowQjFnemZGUTNveHI2Q2hxZndhLzBLVmlVbWZZODZPMGZI?=
 =?utf-8?B?R00ydTFkN2dqWHZhSUxTUlcwSytpclo2YVhYdlgzSk1oVzA1d29pSXAwNExq?=
 =?utf-8?B?UkxBRmlMNEdMUjlOeW5qRGUxWWdzNzNweDhCckI5eTcxa3VWVElDSEljMjNH?=
 =?utf-8?B?d3R6ejZLUmtjNFdQRTJGSXYwSGtEa0lVNzF3YnVRcVlISm1Nak1vY2xTbEsv?=
 =?utf-8?B?TStoNW9ZaUFVMktYVmQxY3NEelRQRHJza2JJY0ZueTZOV3VRM3Q3eXViMU9H?=
 =?utf-8?B?QlZvYVorQXlOcHNUK1ZxeEpRZUVMQnpyZEZ1THVLL1RtVEx1cFZUOHlIUjBn?=
 =?utf-8?B?MnNXanptdFEwREh4RzVxOWprakx4dG9NRWl0N2ZGcllpTUx3OGhHVHAyVG5k?=
 =?utf-8?B?WDd5VUZJWkdJOXcxQkhTdVhBdGNiZkwvVXlzcm02Q2hrT0pkNXNFcnhERU9H?=
 =?utf-8?B?UGlnTWRSQWNMUGJLSklBNmFvZ2Z3NVpJODl0OCtFeUJ0d0J2WGxmcEJNc3hZ?=
 =?utf-8?B?ZEJwMThIN2kycTMxYWdyVGRLTk96SW54RG5aMHNnbTB5bG91ZWlQc0hLbmtS?=
 =?utf-8?B?L0kvek5DbVdNblB4R3dMcVBhU3hJVXhIa2Z2Yjl5djdoeE1FL3U0SG5CYXh6?=
 =?utf-8?B?aktPQXc3bE5TQ0NOK0ZRcHVFcUxaQ2pMSjl3UE5qc2NMVmIxK1ZwcWEva2d2?=
 =?utf-8?B?Z2c3Yy9wMVJVSm5CMjNEbUZUbVZza3VMRjh1NGtja3dqdVJoc294Si9OMzhV?=
 =?utf-8?B?S2xKa3B4cTcyeGo1UnFXTGkyWFgvQ2prT1grUGJ6T2ZJbDZtZS9UUzBVbEJ4?=
 =?utf-8?B?NS85R1VjdU5qRE9TWWJNL2ZiaUx6a1ZyUndTcXRhMElVSFNLTEJwckhQM3d0?=
 =?utf-8?B?WG5zNVJUTysvZjRUOUhsVUozNlhTaTN3STQxWVRaMHV1ekVLVTdFOGVVVnNo?=
 =?utf-8?B?bVhUdVRteGlEZWtBYkpBVE1HclRTdmJ4WUY4V2tnbFlFYlhMU0I4ZURCQ0Nu?=
 =?utf-8?B?cWRHTGlyOWh1Z0VUMWRaaXI2Wk0zMU50d2w1WThLajJlTGsxUVBpcDZzdmNt?=
 =?utf-8?B?c09oTExIUzY2OUYwbXhhb05zV1ppcFRyTXJLMVp4MFFZTzI0MlhpZz09?=
X-Exchange-RoutingPolicyChecked: 
	PRMawV7RplyfwciWc88RYTXsoYgVNLS6v9w6zWH3eJ6iq9F64HHNtD4JXzjJ7xDWvYLnPvnLtCtIVhPDlMvIHTotPOhXfU1sCOBL63MxJoyHoqRe6RyDOif/cLbc/b42YbvNRjJdWDRk/k0A7j/oxwb6pGQjU8oDe+uv4JiYPVRB+Mo9wRrm8lFl3x+ZwKPIOpfeUvq082hliquuOkw06bAbn4JqL5WG8Z/DmPX48y5yXscKK8HvCjDDMJZqzi95gRVKl//b74ikgvs230FqZAHRsR8HvbQEr7ENS44QQxZ5BC2G2cTHCVqiDHlDAboVmKwOg+X5v9BRlCcd4uLhgw==
X-OriginatorOrg: silabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ec3e979-479c-4fce-3a19-08de89adc1a5
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8205.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 14:00:50.6817
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 54dbd822-5231-4b20-944d-6f4abcd541fb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OrPV4DWuYltaFRlGB8DB8q5g7ovmyRyDK7bXX82p62uAkaz9ccaYlHyO12nFWHCNeHeMH9qs7c4c7p73U7jQXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7619
X-Authority-Analysis: v=2.4 cv=T5CBjvKQ c=1 sm=1 tr=0 ts=69c29916 cx=c_pps
 a=mXWPUgXNGD4LDRIkHGcDmw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=M51BFTxLslgA:10
 a=i1IsUcr2s-wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=gIHJBl62Mt9vjvfn7G3b:22
 a=6KgOrB_2K63Cyhqxo4vW:22 a=VwQbUJbxAAAA:8 a=2AEO0YjSAAAA:8
 a=g3cNx9zKZhjWjZNNIMcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: iTBY7Jd0-Lk5w7fWaSmTf11PiknxSoxp
X-Proofpoint-GUID: iTBY7Jd0-Lk5w7fWaSmTf11PiknxSoxp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDExMCBTYWx0ZWRfXzMgQAeiY3t6W
 gZbQWuNNKAkQN9xk/h1UXwo5YU7Wfx6+6mIqDFAtE0x6hxLCjYGvyOgqN0rAm0ibuw+MrAU6soM
 S1/R3OTTbldQ4uZ6qrV+lOc5pwFZbboDlbv7Aiyreixbpkv+nTRDVqRjofZF+13aihQy5i7aRh/
 H8CUSxQ/+7eA8AxuXynpiexVxYz8LKK+e489hMvVqgLdptJuh/ov+8PaU3F0ec6PL+FNcqJnWe4
 fus2l/+G0bIgbWIDco11cjttCAbwZUO1YBiqcpnq5QpKQUuEf6yPLDYEOEgqVXL7jyJGAJhES5n
 +0DJNYuSTJ6/Eul5byh3bacdOTfZG07vUKcJ8BMRM0kroUrUyqsJjEJ310HkK5OoxYqc6UScTvN
 brHq/oP0V9E5QGLb7nmNtc3dsaPbHKm1kKXCANTsfoMNIM+9tEqEMwgCUybEXI2sTVkZt4coKvg
 WVZwZXlcySRlYvkWP/A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240110
X-Spamd-Bar: --
Message-ID-Hash: VQ27H3BNURRCG3CTISJJL4V43YW3SJK5
X-Message-ID-Hash: VQ27H3BNURRCG3CTISJJL4V43YW3SJK5
X-MailFrom: prvs=1543d7b3bc=damien.riegel@silabs.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v4 2/2] greybus: raw: fix use-after-free if write is called after disconnect
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/VQ27H3BNURRCG3CTISJJL4V43YW3SJK5/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Spamd-Result: default: False [4.59 / 15.00];
	DMARC_POLICY_REJECT(2.00)[silabs.com : SPF not aligned (relaxed),reject];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	R_DKIM_REJECT(1.00)[silabs.com:s=pps12202023,silabs.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+mx];
	MAILLIST(-0.20)[mailman];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	DKIM_TRACE(0.00)[silabs.com:-];
	NEURAL_SPAM(0.00)[0.981];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[damien.riegel@silabs.com,greybus-dev-bounces@lists.linaro.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	TAGGED_RCPT(0.00)[greybus-dev];
	RSPAMD_EMAILBL_FAIL(0.00)[damien.riegel.silabs.com:query timed out,greybus-dev.lists.linaro.org:query timed out];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linaro.org:helo,lists.linaro.org:rdns,silabs.com:email,silabs.com:mid]
X-Rspamd-Queue-Id: 67AE1309D74
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SWYgYSB1c2VyIHdyaXRlcyB0byB0aGUgY2hhcmRldiBhZnRlciBkaXNjb25uZWN0IGhhcyBiZWVu
IGNhbGxlZCwgdGhlDQprZXJuZWwgcGFuaWNzIHdpdGggdGhlIGZvbGxvd2luZyB0cmFjZSAod2l0
aA0KQ09ORklHX0lOSVRfT05fRlJFRV9ERUZBVUxUX09OPXkpOg0KDQogICAgICAgIEJVRzoga2Vy
bmVsIE5VTEwgcG9pbnRlciBkZXJlZmVyZW5jZSwgYWRkcmVzczogMDAwMDAwMDAwMDAwMDIxOA0K
ICAgICAgICAgLi4uDQogICAgICAgIENhbGwgVHJhY2U6DQogICAgICAgICA8VEFTSz4NCiAgICAg
ICAgIGdiX29wZXJhdGlvbl9jcmVhdGVfY29tbW9uKzB4NjEvMHgxODANCiAgICAgICAgIGdiX29w
ZXJhdGlvbl9jcmVhdGVfZmxhZ3MrMHgyOC8weGEwDQogICAgICAgICBnYl9vcGVyYXRpb25fc3lu
Y190aW1lb3V0KzB4NmYvMHgxMDANCiAgICAgICAgIHJhd193cml0ZSsweDdiLzB4YzcgW2diX3Jh
d10NCiAgICAgICAgIHZmc193cml0ZSsweGNmLzB4NDIwDQogICAgICAgICA/IHRhc2tfbW1fY2lk
X3dvcmsrMHgxMzYvMHgyMjANCiAgICAgICAgIGtzeXNfd3JpdGUrMHg2My8weGUwDQogICAgICAg
ICBkb19zeXNjYWxsXzY0KzB4YTQvMHgyOTANCiAgICAgICAgIGVudHJ5X1NZU0NBTExfNjRfYWZ0
ZXJfaHdmcmFtZSsweDc3LzB4N2YNCg0KRGlzY29ubmVjdCBjYWxscyBnYl9jb25uZWN0aW9uX2Rl
c3Ryb3ksIHdoaWNoIGVuZHMgdXAgZnJlZWluZyB0aGUNCmNvbm5lY3Rpb24gb2JqZWN0LiBXaGVu
IGdiX29wZXJhdGlvbl9zeW5jIGlzIGNhbGxlZCBpbiB0aGUgd3JpdGUgZmlsZQ0Kb3BlcmF0aW9u
cywgaXRzIGdldHMgYSBmcmVlZCBjb25uZWN0aW9uIGFzIHBhcmFtZXRlciBhbmQgdGhlIGtlcm5l
bA0KcGFuaWNzLg0KDQpUaGUgZ2JfY29ubmVjdGlvbl9kZXN0cm95IGNhbm5vdCBiZSBtb3ZlZCBv
dXQgb2YgdGhlIGRpc2Nvbm5lY3QNCmZ1bmN0aW9uLCBhcyB0aGUgR3JleWJ1cyBzdWJzeXN0ZW0g
ZXhwZWN0IGFsbCBjb25uZWN0aW9ucyBiZWxvbmdpbmcgdG8gYQ0KYnVuZGxlIHRvIGJlIGRlc3Ry
b3llZCB3aGVuIGRpc2Nvbm5lY3QgcmV0dXJucy4NCg0KVG8gcHJldmVudCB0aGlzIGJ1ZywgdXNl
IGEgcncgbG9jayB0byBzeW5jaHJvbml6ZSBhY2Nlc3MgYmV0d2VlbiB3cml0ZQ0KYW5kIGRpc2Nv
bm5lY3QuIFRoaXMgZ3VhcmFudGVlcyB0aGF0IHRoZSB3cml0ZSBmdW5jdGlvbiBkb2Vzbid0IHRy
eQ0KdG8gdXNlIGEgZGlzY29ubmVjdGVkIGNvbm5lY3Rpb24uDQoNCkZpeGVzOiBlODA2YzdmYjhl
OWIgKCJncmV5YnVzOiByYXc6IGFkZCByYXcgZ3JleWJ1cyBrZXJuZWwgZHJpdmVyIikNClJldmll
d2VkLWJ5OiBKb2hhbiBIb3ZvbGQgPGpvaGFuQGtlcm5lbC5vcmc+DQpTaWduZWQtb2ZmLWJ5OiBE
YW1pZW4gUmnDqWdlbCA8ZGFtaWVuLnJpZWdlbEBzaWxhYnMuY29tPg0KLS0tDQpDaGFuZ2VzIGlu
IHY0Og0KICAtIHJlYmFzZSBvbiB2Ny4wLXJjNCAobm8gY2hhbmdlcykNCiAgLSB0aGUgcmV0dXJu
IHZhbHVlIG9mIGdiX3Jhd19zZW5kIG5vdyBnb2VzIHRvICJleGl0IiBsYWJlbCBpbiBjYXNlIG9m
DQogICAgZXJyb3INCiAgLSBhZGQgUmV2aWV3ZWQtQnk6IEpvaGFuIEhvdm9sZA0KDQpDaGFuZ2Vz
IGluIHYzOg0KICAtIHJlbmFtZSAiY29ubmVjdGVkIiBmbGFnIHRvICJkaXNjb25uZWN0ZWQiDQog
IC0gYWNxdWlyZS9yZWxlYXNlIG9mIHdyaXRlIHNlbWFwaG9yZSBhY3F1aXJlL3JlbGVhc2Ugd2Vy
ZSBpbg0KICAgIGdiX3Jhd19zZW5kLCBtb3ZlIHRoZW0gdG8gdGhlIGNhbGxlciBpbnN0ZWFkIChy
YXdfd3JpdGUpDQoNCkNoYW5nZXMgaW4gdjI6DQogIC0gdHJpbSBkb3duIHRyYWNlIGluIGNvbW1p
dCBtZXNzYWdlIHRvIGtlZXAgb25seSB0aGUgZXNzZW50aWFsIHBhcnQNCiAgLSBjb252ZXJ0IHRo
ZSBtdXRleCB0aGF0IHByb3RlY3RlZCB0aGUgY29ubmVjdGlvbiB0byBhIHJ3X3NlbWFwaG9yZQ0K
ICAtIHVzZSBhICJjb25uZWN0ZWQiIGZsYWcgaW5zdGVhZCBvZiByZWx5aW5nIG9uIHRoZSBjb25u
ZWN0aW9uIHBvaW50ZXINCiAgICBiZWluZyBOVUxMIG9yIG5vdA0KDQogZHJpdmVycy9zdGFnaW5n
L2dyZXlidXMvcmF3LmMgfCAyMyArKysrKysrKysrKysrKysrKysrKystLQ0KIDEgZmlsZSBjaGFu
Z2VkLCAyMSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KDQpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9zdGFnaW5nL2dyZXlidXMvcmF3LmMgYi9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9yYXcu
Yw0KaW5kZXggNDdhOTg0NTU0NjgxLi40NTlhZWQwZjEyNDAgMTAwNjQ0DQotLS0gYS9kcml2ZXJz
L3N0YWdpbmcvZ3JleWJ1cy9yYXcuYw0KKysrIGIvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvcmF3
LmMNCkBAIC0yMSw2ICsyMSw4IEBAIHN0cnVjdCBnYl9yYXcgew0KIAlzdHJ1Y3QgbGlzdF9oZWFk
IGxpc3Q7DQogCWludCBsaXN0X2RhdGE7DQogCXN0cnVjdCBtdXRleCBsaXN0X2xvY2s7DQorCXN0
cnVjdCByd19zZW1hcGhvcmUgZGlzY29ubmVjdF9sb2NrOw0KKwlib29sIGRpc2Nvbm5lY3RlZDsN
CiAJc3RydWN0IGNkZXYgY2RldjsNCiAJc3RydWN0IGRldmljZSBkZXY7DQogfTsNCkBAIC0yMDAs
NiArMjAyLDcgQEAgc3RhdGljIGludCBnYl9yYXdfcHJvYmUoc3RydWN0IGdiX2J1bmRsZSAqYnVu
ZGxlLA0KIA0KIAlJTklUX0xJU1RfSEVBRCgmcmF3LT5saXN0KTsNCiAJbXV0ZXhfaW5pdCgmcmF3
LT5saXN0X2xvY2spOw0KKwlpbml0X3J3c2VtKCZyYXctPmRpc2Nvbm5lY3RfbG9jayk7DQogDQog
CXJhdy0+Y29ubmVjdGlvbiA9IGNvbm5lY3Rpb247DQogCWdyZXlidXNfc2V0X2RydmRhdGEoYnVu
ZGxlLCByYXcpOw0KQEAgLTIzNSw2ICsyMzgsMTEgQEAgc3RhdGljIHZvaWQgZ2JfcmF3X2Rpc2Nv
bm5lY3Qoc3RydWN0IGdiX2J1bmRsZSAqYnVuZGxlKQ0KIAlzdHJ1Y3QgcmF3X2RhdGEgKnRlbXA7
DQogDQogCWNkZXZfZGV2aWNlX2RlbCgmcmF3LT5jZGV2LCAmcmF3LT5kZXYpOw0KKw0KKwlkb3du
X3dyaXRlKCZyYXctPmRpc2Nvbm5lY3RfbG9jayk7DQorCXJhdy0+ZGlzY29ubmVjdGVkID0gdHJ1
ZTsNCisJdXBfd3JpdGUoJnJhdy0+ZGlzY29ubmVjdF9sb2NrKTsNCisNCiAJZ2JfY29ubmVjdGlv
bl9kaXNhYmxlKGNvbm5lY3Rpb24pOw0KIAlnYl9jb25uZWN0aW9uX2Rlc3Ryb3koY29ubmVjdGlv
bik7DQogDQpAQCAtMjc3LDExICsyODUsMjIgQEAgc3RhdGljIHNzaXplX3QgcmF3X3dyaXRlKHN0
cnVjdCBmaWxlICpmaWxlLCBjb25zdCBjaGFyIF9fdXNlciAqYnVmLA0KIAlpZiAoY291bnQgPiBN
QVhfUEFDS0VUX1NJWkUpDQogCQlyZXR1cm4gLUUyQklHOw0KIA0KKwlkb3duX3JlYWQoJnJhdy0+
ZGlzY29ubmVjdF9sb2NrKTsNCisNCisJaWYgKHJhdy0+ZGlzY29ubmVjdGVkKSB7DQorCQlyZXR2
YWwgPSAtRU5PREVWOw0KKwkJZ290byBleGl0Ow0KKwl9DQorDQogCXJldHZhbCA9IGdiX3Jhd19z
ZW5kKHJhdywgY291bnQsIGJ1Zik7DQogCWlmIChyZXR2YWwpDQotCQlyZXR1cm4gcmV0dmFsOw0K
KwkJZ290byBleGl0Ow0KIA0KLQlyZXR1cm4gY291bnQ7DQorCXJldHZhbCA9IGNvdW50Ow0KK2V4
aXQ6DQorCXVwX3JlYWQoJnJhdy0+ZGlzY29ubmVjdF9sb2NrKTsNCisNCisJcmV0dXJuIHJldHZh
bDsNCiB9DQogDQogc3RhdGljIHNzaXplX3QgcmF3X3JlYWQoc3RydWN0IGZpbGUgKmZpbGUsIGNo
YXIgX191c2VyICpidWYsIHNpemVfdCBjb3VudCwNCi0tIA0KMi41Mi4wDQoNCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmdyZXlidXMtZGV2IG1haWxpbmcg
bGlzdCAtLSBncmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3JnClRvIHVuc3Vic2NyaWJlIHNlbmQg
YW4gZW1haWwgdG8gZ3JleWJ1cy1kZXYtbGVhdmVAbGlzdHMubGluYXJvLm9yZwo=
