Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id C8A24C5E69B
	for <lists+greybus-dev@lfdr.de>; Fri, 14 Nov 2025 18:03:23 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 99DC03F75F
	for <lists+greybus-dev@lfdr.de>; Fri, 14 Nov 2025 17:03:22 +0000 (UTC)
Received: from mx0b-0024c301.pphosted.com (mx0b-0024c301.pphosted.com [148.163.153.153])
	by lists.linaro.org (Postfix) with ESMTPS id 629A73F75F
	for <greybus-dev@lists.linaro.org>; Fri, 14 Nov 2025 16:55:14 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=silabs.com header.s=pps12202023 header.b=v5+CcpcV;
	dkim=pass header.d=silabs.com header.s=selector1 header.b=C0h6i5cK;
	dmarc=pass (policy=reject) header.from=silabs.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1");
	spf=pass (lists.linaro.org: domain of Yacin.Belmihoub-Martel@silabs.com designates 148.163.153.153 as permitted sender) smtp.mailfrom=Yacin.Belmihoub-Martel@silabs.com
Received: from pps.filterd (m0101742.ppops.net [127.0.0.1])
	by mx0a-0024c301.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AECXOAT2440870;
	Fri, 14 Nov 2025 10:55:09 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps12202023;
	 bh=+0oF1p7D9RKStzRns/T0NJ1Gin9x4Z5Z6XZ/kb9xPcE=; b=v5+CcpcVZqOT
	8pCCVHdwgb3S32WeROVLH94sK9jUGdtv4iNJ1wSQdhUR/mlZVzxtfRu8HUzsDTly
	h587OPCg218DXg1BT1eb5/VF4LKn+GGF6Sl3cQV0GEq7nEkZGT98ugVEF0khvMIF
	ntsHeZX8s2/52flEXq6yYznp2Ah8onehtDxWxhgVgSnwhS+xLwZ67Cu2/1CLjWn6
	NHYPKWcNdyMwyOyLoNJZLqDQ9nbsDi/MD1qiJZUQ0DY5Eog4o80T6dKtY+4m1Ga/
	kxxF6FsI7GjHw1fJQHAUiyesx2EXKzVJMmUdcw4WDBSc9nT8Xs5QOH5NtHsoyzep
	mny3m5m3tg==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11022132.outbound.protection.outlook.com [52.101.53.132])
	by mx0a-0024c301.pphosted.com (PPS) with ESMTPS id 4adr8fsuts-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 14 Nov 2025 10:55:08 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ilk8rb5X00oLBssfI8UNn3sYbzvFAdhiRjuVJbGc6h5hb6RpqMnEyH/xbRtyls866SE4iVHM+BZjHnEJ2xG8jvsMqoZ0C/oidT5+0ihSh8AiL0X8hbNApaDwjBfsWQ58895a6Hx/gNshQcrz4J/HR/jIzMqFZgP07dXgE4LG7ZsTYP7wXtHQ83dDbuCZULaIqXMHUyB1E8gkaZnZIHRsBjjg6NkethfwzyateMIHZ2cw50BZ/09Yv7Kq7r9Tp/KBci8pY9AHLZalU2vv/mgNYGHENL4Nxq7R0y8XaLBNgc7bfuICC8Wqdctzn4YTmpOMMDgoMVmGxmSYT+nyiEYd/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+0oF1p7D9RKStzRns/T0NJ1Gin9x4Z5Z6XZ/kb9xPcE=;
 b=uaGkV80rov2Ie891soBhV/j+AIZubWVEoh5TngqfR6gtAhMk2wiMKDsJdsNkWRVy/jvaLlz/sEHRy2mBJ/qGxCTTUGhl3BSG3k7zqKjcRM/kEFzi1bR+1B2lKtwDve5mcoT3ScWjJ2W/LOYXN9Aq7j/FXONHPDcuf152ACBjI2xYZeZiDl1gX4y0rjUHdO2HkrdTKjwUczJlHSeWmudzFDpN2dvbUWwmtlmGTMxsWLaYe5J4/ILYjfiXtNsEmkQ4vyOBItksKskDlOVGHejHZPobBYeDeNhHfRkV24jrho3xk0droEWzX6rHw9JNlggtRwnDpfHrj7H4mBFci3ladg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silabs.com; dmarc=pass action=none header.from=silabs.com;
 dkim=pass header.d=silabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+0oF1p7D9RKStzRns/T0NJ1Gin9x4Z5Z6XZ/kb9xPcE=;
 b=C0h6i5cKHb8LrxphtMSt/msFhf5krwjS4XU7UmgbLaktiuKUR/+V4O6My0WXejJJ8TfBp91lKFohvW2LQWeB/MEJRswLzUy2kutayYnWj5ERBBz2gGfgkl7wnADjQFkCBT39wRqtCLeOcPb601CbljckI22pdbC78VWuC/XA2J8=
Received: from PH0PR11MB4998.namprd11.prod.outlook.com (2603:10b6:510:32::8)
 by SN7PR11MB6558.namprd11.prod.outlook.com (2603:10b6:806:26e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Fri, 14 Nov
 2025 16:55:06 +0000
Received: from PH0PR11MB4998.namprd11.prod.outlook.com
 ([fe80::e321:4da6:3811:2e16]) by PH0PR11MB4998.namprd11.prod.outlook.com
 ([fe80::e321:4da6:3811:2e16%5]) with mapi id 15.20.9320.013; Fri, 14 Nov 2025
 16:55:05 +0000
Date: Fri, 14 Nov 2025 11:55:03 -0500
Message-Id: <DE8KPYES5PKO.3BLIB2XITTSQL@silabs.com>
From: "Yacin Belmihoub-Martel" <yacin.belmihoub-martel@silabs.com>
To: =?utf-8?q?Damien_Ri=C3=A9gel?= <damien.riegel@silabs.com>,
        <greybus-dev@lists.linaro.org>, "Johan Hovold" <johan@kernel.org>,
        "Alex
 Elder" <elder@kernel.org>,
        "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>,
        <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.20.1-25-g357c1bff1570
References: <20251114150738.32426-1-damien.riegel@silabs.com>
 <20251114150738.32426-2-damien.riegel@silabs.com>
In-Reply-To: <20251114150738.32426-2-damien.riegel@silabs.com>
X-ClientProxiedBy: YQBP288CA0048.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:c01:9d::18) To PH0PR11MB4998.namprd11.prod.outlook.com
 (2603:10b6:510:32::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB4998:EE_|SN7PR11MB6558:EE_
X-MS-Office365-Filtering-Correlation-Id: 27fb3690-e722-4268-c6c0-08de239e8fd4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?SEM4eGtUVHo5eHpFMWJKWXdnM0RHckJXdVgvK3U3WkZyS0llYlR4RVgwMTcx?=
 =?utf-8?B?YnFoMVRWbERZNVdEckpNSlFqK3VlVFk3MG5OVGVWbC8wTGZXM3VXRnNJTXJn?=
 =?utf-8?B?OFdtME9ZeVZrYzNHUllvOXIyY1lFb0N5ZHM3bDRYdlFWMkRlNkhQbGMvT0R0?=
 =?utf-8?B?SUh1N1FIL3RpNWJDK3U4aXFVakRPUjJQOGx3azArNlgyVFpobDlEZlkyc2l3?=
 =?utf-8?B?TFU2Wm91M1hmQmNINE9mWDBKSmRBY0p1ZHpMd2VtRkp2RVlGSVl3S2V0cHE0?=
 =?utf-8?B?UUVROUtqRDM5VStXQ0t3Nm9Ba0xwMWFURnZQY3FENVpnZXFFWW8zcGprU05M?=
 =?utf-8?B?KzE5eEYzanpYQ2ZwRE5RZG9kUUdHMHpJaEZFakF1NUs0S2NFckxDaUJVaVg1?=
 =?utf-8?B?ZUJJdDNXYWwrWllGMHNVVmo4ZUpWRjJEbmNTdzMyN0tVUjdZTkpoK2grQnpR?=
 =?utf-8?B?Z1R6VDlhdFF4NTdOOEdheHgvWUxSTGlyVmZnZmJVYWs0UTR1NkFnWjJHN2dK?=
 =?utf-8?B?L0FEUVZqTWZaRDgrazV4cVgxaEI3TXhEcFdxOFY2TWtNb25nUk9VVmREallN?=
 =?utf-8?B?dktlYWQ2Z3ppaWdBaDNncy82K1B4R1ZGYmd6M2RnMnZrYU5yUk80Z2tyZGFT?=
 =?utf-8?B?MXlUQlR2cDlmY0FnNkpNY05zRmEvQ1ZPSFo2Q3hvYWtSYTVhYksvcXNiWFJJ?=
 =?utf-8?B?NCs5VHdpa2V2RGdNWHp0VWJFZWVlUjZqS2dUbkZLVUpNNHgyNmxFd3l2NlhS?=
 =?utf-8?B?aThTQlVIa3NoUTJxSWJXNTh2WEVsVFh2RzFUTzN0b3FjNjdoblhXaHhDTmRS?=
 =?utf-8?B?dUQzT3dBM25Xa3BaZnV3TXA5UzdvU3ZuL2szWkRQZk9zdEVsUEJ4YjFXemNS?=
 =?utf-8?B?MUZMYWdBb2lYZGdnYjllOXUrUUpqVkJCU1BldEQwaXVTRmZCQjNqRU1hMFFM?=
 =?utf-8?B?ZmxMSk9uT2hPM3FZOGRqNk4wWmFYUTdOWmF4UlBJbUcyL25EY2Naakt4U2gz?=
 =?utf-8?B?cS9kYUh3OHBPUHYyT0ZyYU4xcHFEUDVBU2RPYmZBU3JZVUYxc3B4UW51clNS?=
 =?utf-8?B?RmhXajdVWUk5eWhUVXRvRVVsZXhNUHdWL1lSZ3NnbE54eG9oRG9sUlAyMnl5?=
 =?utf-8?B?N1NQQXFmU2poR1Vxd0IxV2FRd1ZubjAxQTlwdTJ6aW94bzM1SStaZ3JId1Jk?=
 =?utf-8?B?NTR3TGRzVVkwZWlWWEFqQVBsOXM4NysxWWU0VG5YVCtQM3hQZXprL0IyaVFk?=
 =?utf-8?B?MW8vOVI1NUdEVWI1Qit3M0VXcmQ4WGYwdHBWMVFDeXNSNUY4UDhkblV0aG9p?=
 =?utf-8?B?UTh2MkFxeDljRWxaOXZ1Zjd1QWNhM1gyTXhRcGpEY3J0V282YzdkUjVFbmpr?=
 =?utf-8?B?N1Y1SjJZWEZoNTJRQlZJZlBkQmtzNEg3bTF6a25VcTFDQjJCSXMwQVVGUGtN?=
 =?utf-8?B?dXloay8rVWR5a3NBMlB0YW1hbWF0LzEwdmFMTUNqdmRFcUljb1J0b0VvaWxU?=
 =?utf-8?B?VTRTeTllOHk4SFZzWk1BQ2dOY1JjdVZnbHFSd0tQU1NIaEpra28rbVdUWlRJ?=
 =?utf-8?B?Nmkvdzc5OUJ5WnJFaTAyeUptR0dkc3ZwVGtzRVVxK3ljODkyQ0xNMkpNR3B0?=
 =?utf-8?B?UU9makdhaVNnV1FsN241eG1uOHJ1TzFpZVliOWNwaDdaRVVtNG5nS3lueUd4?=
 =?utf-8?B?NEFkaXNsZ2dOclJkZVhaTkRSNnNMSTNYcGpud1hOR2ZocmVEdlJGR3BuUXdt?=
 =?utf-8?B?YXk5Rjk2ZzY4RUduTCs1azFXMW9KMmlLZGNwcVVzeTN5UklZMHBQK1FYc0Qy?=
 =?utf-8?B?TEZOZXJKV1Q5T1c1azFtQlIxZFphUGI3YllWQ0YvNnBDQkI2Nlg4eEcyQU5H?=
 =?utf-8?B?SWhVditueVpKaG9xdmtRa3dNalRYM285OWlzVW9IeVY2eUNucER4d04vUlJT?=
 =?utf-8?Q?XTvLCwcMErlZ/4b5FwJh2cjiWsrARc+G?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB4998.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cW4vZkxJQ0ZJNWVMbGd4bWVuSkx6ZE80QWs1NjlBTDRkd2xXUFhablRORWlk?=
 =?utf-8?B?SkFWY3lhc3JQR0ZKQzNWUXJJdW9GL3pWWXg0eHdVVkFnK2RpcWZjTGtwZFFQ?=
 =?utf-8?B?OWVqZ21FY1FnYU5KSkhkRnZ2RXFzQjduem9jWnlXNForOUFQb2c3K0hCYWt1?=
 =?utf-8?B?NW53cUJzZ3ZkMTVZd2s2aVlaVnVMb2dpVFVqUURMN3JjSm1JZ0QwTDNJUXlB?=
 =?utf-8?B?TUlXRnM5Y1ZnZG5LelpKMXdtU0JMVGtCUGlIalJORTFpS2lRcWxnaW1XclFD?=
 =?utf-8?B?ZEg0QjE5RG1NN0hidjVNdUhCeWRIbElackE1OWlOWTBuQ3h6UHd3Z0I1c254?=
 =?utf-8?B?YWdlNVUvMENSZDllNU1IRkJLM2IwK3B2QVJTN1BCZmpjRjFVT2NCUFd4eGYw?=
 =?utf-8?B?emp3b2E4U2NNZ2hqUFJoamJGR3owRWJkaEVjQk5KV0FDMTZidWtlTHBBZmJh?=
 =?utf-8?B?WHZXTDI5SktPeG84RS95K0ZjRElEbFE1U2VpeSs0RjFMZ0l4ZWErMlQ2dlc4?=
 =?utf-8?B?SEE1QUxPakc5a2Q4bzZSWkpZcmpPY1pxNndKOGRyMEtZMWdxamxML3J3YlZw?=
 =?utf-8?B?dTdJbG1aOVpwSFlHZmVZRVhsTjJrTm85RytpV2NHZU5CQkN2ZkZxUXRuc1Rp?=
 =?utf-8?B?YVBkSFF2ZW55cVFJNlhOTkxNem54ZlRyNjR2ZlcwV1J4S1pWVnZtK05tQjJk?=
 =?utf-8?B?NmhXNE5lb2NPbkl2NzNEM1oveUEvK0dxZXBOMXlaVURtV1V3bkx1SFNEU3lR?=
 =?utf-8?B?UE00SXN3NmkvYTkrcmhzdDBKdGliMUU4amo5T3VuY0NFaDZmeWR0S0lyTkFh?=
 =?utf-8?B?L3h6STMralplaUVjYmpPbXNvTEFZYU00ZFhXeFBEVUdkL0R4QnR1aEY4VFpB?=
 =?utf-8?B?dlY2YTBSdVhKd2Y3SDNyYkNGOVptM1hsM0NsQzYwTE5jRXdHM2doSytvZ0lQ?=
 =?utf-8?B?RUJVWldHd1ltbHROMHh0ZFR3U1Vma3JTYkcyRlZNM3Mvdlp3TWFaYUlIamJa?=
 =?utf-8?B?d1FnYnppREZjSk00enRVbFVjZjM4RCtIUHZJZlNXK0g3ZytOa2ZjNmVYc1pp?=
 =?utf-8?B?ejV4MG9SSzlraGt1c21raHUrWFZpRWtRa1dkaXdqZGkyRTRzY2xIVEtnbVFh?=
 =?utf-8?B?dmM5ZlhwekZVOWhLTDdaTndERE56b3Zib2J2bVFLYkxBbXZHK2Z0eW5xeHJU?=
 =?utf-8?B?dnd5d2hhK2s4TTlIOXJQRklxZk5EUmxkNHNIQU83NDROVmxScmhwU2s1S2pw?=
 =?utf-8?B?R29ZbFV3UjB6VDdtQ0xITjBXaWQ3SFhCYktrRnlQeVJ3OGdIanh5Wms1SjhH?=
 =?utf-8?B?MFR4MjBLMnU2L2p6c2djb1h0b3ZzS0kzRDhkQXpONElEQlBhQ2lLZkNDNUVj?=
 =?utf-8?B?T1Z0TER3dDlNYU1CYWFOSWZYSVFGUE1iMVdQUlYrWGhFMjMyQ25oWlFWZGhs?=
 =?utf-8?B?aHcwVUF1K01BQmhjMm83bkl2RmZsK05PL2RqNWQ2YlpMaHcxUXpVUUJvYzB3?=
 =?utf-8?B?M2dSU0V0TFQ0TEZ3UnlNTnNtNU1kL05EemozWnJKMzNydzJEajRvd3hKa0g4?=
 =?utf-8?B?R2hVVTFtU2JIY1BPMmVRMW1YTDRGa3VNSGhPUmlScnJrY3FnYkRkSmM5NUpl?=
 =?utf-8?B?U3ducjFJekowazhOZnorTEg1WW1OWUxsK0p1dkNmMG1VMEhXdkJ6NVl2dUJX?=
 =?utf-8?B?UklKSSt2dFhPaENhQ05VK3FRT3lYNUU5Q0RFVXFTWWVQWTRpaEFSc3cyUW9Q?=
 =?utf-8?B?L2Z3bUZvdWsvWkFsYkVOQiszK2tRdHBSMURLTHZLYlJ0WW9NdE9aQXdqeFAz?=
 =?utf-8?B?ZFZsQUdmR0FMeGVwdlg2b3ZlN3U1bzZpc1BOWHNFN3BXQ0s0ajdVZ2U1akgy?=
 =?utf-8?B?RUZSbkZaakdMWjlIb0U1TUJ1NHFPRTh5T0FyTUdVUnJqeWljMjArSGdNNWMr?=
 =?utf-8?B?c0N6MTJzbDhaWmUrdXBhc1JoSjRTa1pSMFBDbit0MmxHKzFzTnNiLzJaZ1E4?=
 =?utf-8?B?YmtnT3U4U2h4WWcvVWdibFpDRFZtQ1BLRVVmdUhzcHB5ZGU5UVQwVjdnU1VX?=
 =?utf-8?B?ejlQaGNlTnpFd0I2TC80NWdNSUxFM013OXlpTkVlbVBXQ3FnakRFNlovME5w?=
 =?utf-8?Q?sUfR/ZY/Ynuae1fWLIAUUktRL?=
X-OriginatorOrg: silabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27fb3690-e722-4268-c6c0-08de239e8fd4
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB4998.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 16:55:05.9002
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 54dbd822-5231-4b20-944d-6f4abcd541fb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kj+FdDfvnKvIHblTyTDHWkzN1GNZYyEbqwQ75PPr+coUfZGwfbNQKj+xIFdJNaIqNts300EnqKPC9iFns75eaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6558
X-Proofpoint-ORIG-GUID: Kv2GULKmEWxhfTu3yED2HgJCzw9vzBLw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDEzNiBTYWx0ZWRfX4XgLzF1PnfZH
 T6wQUU2LkfBSjZ6jCEDxA/DGqngGWjAVUZdceSMef9dtRL73GgvzycTn9dD3DmmVMOKFLA1Uaq6
 EihLpWN6vNweDbI11kQX6YMywQK5RsvnqaYPlzDBpI+VkiCTlYgYM/MIZ9+OWJV/wd46qTiXK7x
 f8kwtW/lJVsr/yQ8acKUVlYEmjVoFafGQETshfG/xNWv3rfPbaigChQ+m79gicxk8XkVCLWTTiE
 HVzYOmVv5VYn5IYhcB5OJrF63c+p6sUxTgSMA2FNOuEoUXAi8oVhKZ4EPliLmIcBSt8RkDOPXvk
 ROMamuXHP2lVn43vsyPyYZR8lUa3zSnfHjBM3X6fTvjtD1jsIGnKtTQ2sByok1linVj7rdVzyFt
 zkSeDsr5GiybXxmX3eRZP7opScbsJA==
X-Authority-Analysis: v=2.4 cv=BYPVE7t2 c=1 sm=1 tr=0 ts=69175eed cx=c_pps
 a=6PZ0G0LshRjEn6jg1bA0Kg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=i1IsUcr2s-wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=6eluP_npNSjF-_p_d1wA:9 a=QEXdDO2ut3YA:10
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: Kv2GULKmEWxhfTu3yED2HgJCzw9vzBLw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_05,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511140136
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 629A73F75F
X-Spamd-Bar: ----
X-Spamd-Result: default: False [-4.99 / 15.00];
	BAYES_HAM(-2.99)[99.93%];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[silabs.com,reject];
	R_DKIM_ALLOW(-0.20)[silabs.com:s=pps12202023,silabs.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:148.163.153.153];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_POSSIBLE(0.00)[148.163.153.153:from];
	ASN(0.00)[asn:22843, ipnet:148.163.152.0/22, country:US];
	RCPT_COUNT_SEVEN(0.00)[7];
	MIME_TRACE(0.00)[0:+];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	DKIM_TRACE(0.00)[silabs.com:+]
X-Rspamd-Action: no action
X-MailFrom: Yacin.Belmihoub-Martel@silabs.com
X-Mailman-Rule-Hits: implicit-dest
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
Message-ID-Hash: YC4VRYYDUTNWJARIA7GBUHCEVKTYCMH3
X-Message-ID-Hash: YC4VRYYDUTNWJARIA7GBUHCEVKTYCMH3
X-Mailman-Approved-At: Fri, 14 Nov 2025 17:03:06 +0000
CC: Silicon Labs Kernel Team <linux-devel@silabs.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [RFC PATCH v2 01/12] greybus: cpc: add minimal CPC Host Device infrastructure
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/YC4VRYYDUTNWJARIA7GBUHCEVKTYCMH3/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gRnJpIE5vdiAxNCwgMjAyNSBhdCAxMDowNyBBTSBFU1QsIERhbWllbiBSacOpZ2VsIHdyb3Rl
Og0KPiAgIyBHcmV5YnVzIEhvc3QgY29udHJvbGxlciBkcml2ZXJzDQo+ICBvYmotJChDT05GSUdf
R1JFWUJVU19CRUFHTEVQTEFZKQkrPSBnYi1iZWFnbGVwbGF5Lm8gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgDQpUaGUgYWJvdmUgY29tbWVudCB3YXMgbW92ZWQgd2l0aG91
dCBhIHByb3BlciBjb21taXQgdG8gdGhlIHBhdGNoc2V0LCAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgDQptYWtpbmcgaXQgdW51c2FibGUgd2l0aCBgZ2l0IGFtYC4gUmV2aWV3ZXJzIHNob3Vs
ZCByZW1vdmUgdGhpcyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgDQptb2RpZmlj
YXRpb24uDQoNCg0KVGhhbmtzLA0KLS0gDQpZYWNpbiBCZWxtaWhvdWItTWFydGVsDQpTaWxpY29u
IExhYm9yYXRvcmllcw0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpncmV5YnVzLWRldiBtYWlsaW5nIGxpc3QgLS0gZ3JleWJ1cy1kZXZAbGlzdHMubGlu
YXJvLm9yZwpUbyB1bnN1YnNjcmliZSBzZW5kIGFuIGVtYWlsIHRvIGdyZXlidXMtZGV2LWxlYXZl
QGxpc3RzLmxpbmFyby5vcmcK
