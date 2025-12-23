Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 5049ECDA45A
	for <lists+greybus-dev@lfdr.de>; Tue, 23 Dec 2025 19:32:09 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id EEFDB3F9D9
	for <lists+greybus-dev@lfdr.de>; Tue, 23 Dec 2025 18:32:07 +0000 (UTC)
Received: from mx0a-0024c301.pphosted.com (mx0a-0024c301.pphosted.com [148.163.149.154])
	by lists.linaro.org (Postfix) with ESMTPS id 1E7AA3F9AD
	for <greybus-dev@lists.linaro.org>; Tue, 23 Dec 2025 18:32:04 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=silabs.com header.s=pps12202023 header.b=a6V0tbmc;
	dkim=pass header.d=silabs.com header.s=selector1 header.b=bqDtgNF0;
	spf=pass (lists.linaro.org: domain of Damien.Riegel@silabs.com designates 148.163.149.154 as permitted sender) smtp.mailfrom=Damien.Riegel@silabs.com;
	dmarc=pass (policy=reject) header.from=silabs.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from pps.filterd (m0101743.ppops.net [127.0.0.1])
	by mx0a-0024c301.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNBlCKR2900128;
	Tue, 23 Dec 2025 12:32:01 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps12202023;
	 bh=QfL0MZA8Wn8u7NuBSTspHKS4HWtkz26KYP9+PymgXqE=; b=a6V0tbmcwp8l
	VVx6qwCRvIGpeo1yoNEnFKCUTblxE2Q9d0y+41nc4vLm01s/yqHe3ryLY5JpfGAq
	gKQyMaNHydvSgDsvTQYVK4RPv0ZfcR6zzN2d5Qll3AJkA+3fDc6UX9nShXDqkiG/
	eE8AlHJDqB9rzHmKtTGoTX3Ofm2q5tM2gGJc2YUUWsgVY6mBN1ral7hMOvxHjuE0
	l8xSkRAlgXd+a3o00DMIMOtyTNICRqTpZgFVwYkrdSgUpOgVT59mbbDqsWf6expJ
	DCzcFsppw9Ho6Lff1MsCqIuKvNfKK0LFj8irpuUZYSYk/h7/hb1DDd6x+vWe1J37
	rEL+6CxQPw==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11020105.outbound.protection.outlook.com [52.101.46.105])
	by mx0a-0024c301.pphosted.com (PPS) with ESMTPS id 4b7n7597gh-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 23 Dec 2025 12:32:00 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HXMU6HcoCo39Npn8GefQInXobsK2SlpzNkoTY8KYLxR2cId5dGnx8kLYDquiblEMhkqLiJYg1AGCUF6hvhE0SNb2a3xnGtWZDf/ktmpyYq9boIQh03+5MhE5LfM6KgE7dTDE5jHoFkK8oyaI8efpc4EP1Q4GsLLOFg0+09rcEZh00IxE/y2aRQp5ybgMAjBTNSWKPreTn2WBZItT9Bw380xUEw6nEOnQJI/q7eaPp9/SvOGg0qt217IJayLwVtHm1fsxat2NNwVkg1J5DVVK5b/z1KdFR21MLpa5EdO+bdk9oyEIDCfxEM/I+R5qV0JHn2O7LaLm+ceTCtSUe67VFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QfL0MZA8Wn8u7NuBSTspHKS4HWtkz26KYP9+PymgXqE=;
 b=CZozJHv0Ue6j/mboVeAw+js36HMbOli6GSY3/a0pNbSqPjlDlwnB83lMlhHEqZWDgkhd3FhFNJiKP8KmHloevmEGyByoyydeShJcyeWFhyV89Z2jgo3kLRPX3Sv9Ip8Mrg6g+Fky+tHMrCF12U16bmENZU8DS1bJCT3/ZWOiJh6tZE7zSz+wCdXInsGMpjFV7+/bfV8vXaKeg86AK7Kx7v+LjdLpkhTLad8Ab4hJmUjxlK9Fr8TG2ncXBs1CeyIUa55yyPKDWFROFzTjZ6rUHDUg0bEu15q942Gi3U+/UyQMm92rzqRVbO8bQBC6D7yjaikJgLRUBz/iGQhipKtUVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silabs.com; dmarc=pass action=none header.from=silabs.com;
 dkim=pass header.d=silabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QfL0MZA8Wn8u7NuBSTspHKS4HWtkz26KYP9+PymgXqE=;
 b=bqDtgNF0/D4GooG9231DgVThEgShVjSA3INx0JzyISLIb4U0j1tupTi44wUuRcY2xkTZRrhiLKXZsx7kqoNA3MUWOCW1dqGEPLSGrj8kNtVLH6qtQzwyXEtyJNlAJptmT8YeF4/rT5anevKyVavsjR7v+6kvk9rCdG4q7unCG9Q=
Received: from DS0PR11MB8205.namprd11.prod.outlook.com (2603:10b6:8:162::17)
 by SN7PR11MB6924.namprd11.prod.outlook.com (2603:10b6:806:2ab::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.11; Tue, 23 Dec
 2025 18:31:59 +0000
Received: from DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::2de6:bc88:2af7:3583]) by DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::2de6:bc88:2af7:3583%3]) with mapi id 15.20.9434.009; Tue, 23 Dec 2025
 18:31:58 +0000
From: =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
To: greybus-dev@lists.linaro.org
Date: Tue, 23 Dec 2025 13:31:41 -0500
Message-ID: <20251223183142.31897-8-damien.riegel@silabs.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251223183142.31897-1-damien.riegel@silabs.com>
References: <20251223183142.31897-1-damien.riegel@silabs.com>
X-ClientProxiedBy: YQZPR01CA0008.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:85::23) To DS0PR11MB8205.namprd11.prod.outlook.com
 (2603:10b6:8:162::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8205:EE_|SN7PR11MB6924:EE_
X-MS-Office365-Filtering-Correlation-Id: 6fe173a6-fe70-491b-1b34-08de42518e64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|10070799003|376014|52116014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?aURsOExxd2ZGRjU2U0FpUVJqM1hKekxzNXM2RzJGcll0d1h4bTZFNHNjaFlH?=
 =?utf-8?B?ek1iNUFFMFA3WDB0Ykp6QVE2djU0N2xrWStRQiswV0RmZEoyL21Gd3VKWHdl?=
 =?utf-8?B?RHlHU3YvemVJU1JGTmgxRlVjNGs4d2VIRzkvK1RKckpnekx4VzJqUmhRcmtD?=
 =?utf-8?B?a3dHdlRZb1p6QTBnYzErSVh0SGo1dGFUZ2J3b21FS0FtdUdTc0ZxbDMyUStS?=
 =?utf-8?B?Z2pta3Z3RnAxSHdJRmRYNTdGU25HZjA1N1ptQU8vUmYvenlyWFBmZjAvNWI2?=
 =?utf-8?B?azZsYXk1R3F2Z0g1YXNLMVdmU0taakFHTWx6UzFSRWNoSTNobHljN3laMzVW?=
 =?utf-8?B?OFFGeWFmcE5aM2k4WnhTejhJZ0hGTWF2TnVtMGU4aG00NmYwZDJ4b0JaVjhs?=
 =?utf-8?B?VkxxSmVlSlQ4NGtyakZoYVdOcTgydEttV2t5aWxGc214WWM0akFPWFFsMWps?=
 =?utf-8?B?UGRoRDdHRmtndFA0aEhwbEF2L0dFYy9DWGQ1WXZRUDV1aFRKRmhlWXdpME5Q?=
 =?utf-8?B?NkNxREEzcjZDMG5oM3FqczVBVkxiMnRETS9vTWpSWG1icEoxZjJFbzVpdmNa?=
 =?utf-8?B?L1VNcjBWdzRwOG5SUDAwc3B3TVJOV1ZHVGc1dW1IZXJ5M1I2blRtYTB0a1o3?=
 =?utf-8?B?WkpWdnVEQzdYQjR0c0dSdmw3WW9yM1Z3eVhpVy85VThSa3dkVHVFa3RMNzdI?=
 =?utf-8?B?NDlSWGRqTjdwK2dkbzZzdGRVVEVnRitwdWNibUFEVWMvZ2U2bXdCVFVVbExF?=
 =?utf-8?B?NG1qeWxsYUNSbUxrMEQydnE1ZnJ3QmF3WWM4MnFFOFVLVU9NOFFET3pEYmdF?=
 =?utf-8?B?TXh0aHZvNHdBTVVMYjNDMis1UzFMWDZ5K1YxalhPRFpSV0ZnY1pTOXI4OEh5?=
 =?utf-8?B?clc2YjdidGV1dzUydXJCQ0hrRFZ5WEFhSGpmUzRpUE5uR2pvWW4zSzgrSG9P?=
 =?utf-8?B?VFF1OURHVGJzclEwTTJlTTEzbytidHB5VUdXZTZSdDZkNHB0WjNFWk1CU2pU?=
 =?utf-8?B?Um44ZTlWUC9nOU5FTFpCWWdiV1pLeHR1cWl0NVplSEorWjZ1SWliQ2FYcmFG?=
 =?utf-8?B?WUVXaFhkREQraEh6STVJN2lkRWsxUVozUXZQQzdoS2E4WUpqRFhsZmV0Q0lD?=
 =?utf-8?B?TFIyaXkvbEhhOTRIc3l1VW5RZTFDSmxaMVQ2Zlo0MFdYSUhsejVSRmhyMDdQ?=
 =?utf-8?B?MEg5V2dFZ256MGxyeW9uZFJRcnlJcGF3OGhPaFF2ZmZNSzhwUmMvNVFDSHdz?=
 =?utf-8?B?V1dpNk5oaGYxTGdkSjgrdlJ0TmNiWWpUckpwNVl0Vk9JcjJycDJjdlNSSGtI?=
 =?utf-8?B?emJvSzhOM2w1T250MTE5LzgxNUh0aDhOV3ZLVnQxeHE4SlE2clgwaEFLaEV1?=
 =?utf-8?B?ZitrQWVLOVpzeDN5TW02NDY1MDhEQzhSeEIvZk1DaUFEZkRWOWFvQkczUGha?=
 =?utf-8?B?Q3E0SGJLWUpXTlhOcG1RZ0lqaDhVUExTQml2VHVCSmJwVDlMN1RFTzJleWhp?=
 =?utf-8?B?alhVUUJuOUpab1RBUy9JMFZXZUVXbzU2aWhRbnVSY2Q2Y2lrMzEvNCtNTEwr?=
 =?utf-8?B?OTJZVHg0eUZKUCtDV3dhVlQ5TWpkZUdSQTRaRGNSMXh4YUFiN1J5anRTcWo5?=
 =?utf-8?B?cmtMdFkwcmN2RnBSR3hGSFFlczJqcTh1L3plTWs3WW9zeElCQk1nSjR2V0Nn?=
 =?utf-8?B?V09vazhMUUpkTytuWlU3VVdJNkRyOUZWT0NSV1hQODJObTNVZTVMWGxmNG12?=
 =?utf-8?B?ekg3SUlCWWpVYkNMclg0Y0RmRHAwamhHYk9pY2JyS3RyYmpZcXIzTzUrWkNV?=
 =?utf-8?B?NUwwVVh4Q3c5aDRrMzR4amFTQTNCTU0waHFqWEJYS08zR3JTM2NmTmFtb2ZE?=
 =?utf-8?B?M0ExVHFnR0VrZ2c1d0FpWjBkS3NXekxyQVlYUWtzczRxRUhIQzlIa2NlUFRO?=
 =?utf-8?Q?JaCYjySc6peYOeHh646X8yvOJn0jhhUE?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8205.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(52116014)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?YlNrTXluYnNFZDl1WEc5c1VlT21EVmIzUk9BOUtUUGgrWVNSYk9zeWZIYVQ5?=
 =?utf-8?B?VCtoeGpRMHZjdm9qSWc4OVJKc2pjbkVWNXNXakNaYWNGMEgwbHBXcnlKRGQw?=
 =?utf-8?B?aHFMeHY2QlVCRTVWY0xjaW1yeFBRa25CbnRITWQ5Zjg0VTdEZFJ5ZHBBTlZo?=
 =?utf-8?B?aGd2bmZNbkQ1VytZZ1AydFp0ZlMvbFRadzNLcjJRZlhrdmRmVHhjMVJmV0hO?=
 =?utf-8?B?a3c3Q3RVVlhkYWNqZml6N04vSTBseDJWWkt6TFFsdFY2Rjh4QWNCMHBKK1Qr?=
 =?utf-8?B?UG02RUJUK2dJK0R2NWdYLytiZWxpTFFNV294MVdwemdjb05pdkVjZ1NmdGEx?=
 =?utf-8?B?UWRxTWxrZzl4amxPK2w0SytTMVlud3dKN24vNWhmSnVDQlJ1WHhHb3lkRE8x?=
 =?utf-8?B?NG9WWDR1MWNNODF1dkRHYnVRbmh1cUhuWTQxNmZRUjNzMTQzZU9BWk9rajhG?=
 =?utf-8?B?cTBwNlB3eTRYeTFQbzBtU0VscnhYZFBYUmJ5b2I3Sjc5OWp4T2N0Yk4wQy9k?=
 =?utf-8?B?bndQY0hnS0tSOW1wWTJxQ2cySXgxZlcxbnpaVVRidVVkNkdtQ2d0b3M3MHVu?=
 =?utf-8?B?ZUZzd0VjbXl3T2hPTmlkRUoxOFBWcmVUelQrYzRMbzE1S0tiZzBxN1NpbXl1?=
 =?utf-8?B?akxFWHozSjVMVGprdVkvNFVEYVRDa252N01ZUFE4QnY5YkVUMnk4QUpQVmNk?=
 =?utf-8?B?NitiMXF1ZHJJblpKdE1wRVA1dUtuV1BqZllwOHJEOENYUS9QZ3c1MjBGK3k1?=
 =?utf-8?B?NmtGckQ2YjBqa25TMXRaUFFhY1QydzZKN1BpSHF4ZHBOcnl0Zy9HZGFSMDEr?=
 =?utf-8?B?Y0J4dHBjNjRVa3VWTEJrdnZMck8vMy94NlhvQk0wOGdYL3JpQXROaGhScHV0?=
 =?utf-8?B?NzkxNzEzWUo2SEUzMDFQeU5GM0ZiWStPRTk0R1RHaU5zTkxFY280bkZpMERk?=
 =?utf-8?B?Y3dWVzBzVnZxYVlwaXBwZFV2WTR3dGdpNnROcm1zcGhOMi8xYW00NU5KQmxy?=
 =?utf-8?B?Nk5EMFRMNEFRbm5hNEZ0QmRnbFBhMmNpV1R0cFJzd29sekJHdCtJY3RvVVRx?=
 =?utf-8?B?bkJnUnhIRm15bmYwSmNLN01SL0JpWEpUNjBkazhERS9pRmJSNUFGMXdlMEM4?=
 =?utf-8?B?T0QrMFlLZ05MenJzb3lGbFBYMXpvcHA0UzQyN2dvWU1UZWdkUUlFb1VNYm56?=
 =?utf-8?B?ZzJtTTlGMHppUUpVWk1rMzlyMUU5aTZkVlNhd1B0UGloUmlKaXBVaVpSanQ1?=
 =?utf-8?B?SEtQMzhhL0Q3V1h0QVZUOW9lT0FkdG1TbW1rTXpSSWJnSXg0QzNoVkg5Qlp1?=
 =?utf-8?B?R0tJUEcxbHJ0bC9pV2xmZlh5VUdHb3daQ0c5SnJ0czhqQlFhNFBnQ0NjUUh1?=
 =?utf-8?B?bkdjOElFbjBaUHVHc0V3aWNGLzJDZHpaU3IrREdtM0tKamhmSWZGdzErei81?=
 =?utf-8?B?bGZKZWFlcHZ4NEVRbkdrWGI5N2twKzliQ2ZEU2ZUaTR6TWVUNVFnQk05Qjho?=
 =?utf-8?B?Z0VlNm9kT0JYVXdhZElLM2xPUGxTRzdtTVBtYTB4eTdmOTRpRFdrZUNFMVRs?=
 =?utf-8?B?b3FTbHU5TmpIVXRXVGN5OG9oSHNLVVQvQ2NLYXFwSTU1c0pZQXZ4K1hKR1BO?=
 =?utf-8?B?Z21tUE5jZS9Cam43aGIvQzlMSDR3LzdzK3BuTFhhODJpMVlaakNXeFZSTGtN?=
 =?utf-8?B?ZnlLNFB4T08xSmIzOVcxVW5qVmpLUUxETHdsem1PZis1TVVLQmpJU2NrTWsz?=
 =?utf-8?B?V21LVHEwNnRYZkpxMExBOWR1TktVMUw5ZEZKQ05hSTUzZC9IdTB3eDFOZ1cv?=
 =?utf-8?B?QkNFNkNCNnpTcWV5ek5DdmN5dlcwaEF5RHlCbFF3Wi85Z0hCbzViQ3hwNmpp?=
 =?utf-8?B?a2ZydTQyZ2xhSG9Tc1E1OCtJZlM0OW12NG1wUmpKa1dQclNvN0VqZjJSZkJE?=
 =?utf-8?B?MkVnRnhBWHVCR3A1T1h0NklGU0JXMjgxUDhKRXlXTDRrazJsV3JXYldvbG9P?=
 =?utf-8?B?eUQ5NytLRThNeW5SY2tTbFBINDVMay8ySTlrNFRaUnBGYjNMWGFXdHlQV2oz?=
 =?utf-8?B?emk0dm9ZdE1RcUpmVUtyRDY0V1hyaEN4ektiQnNrSTFBaDhLTUM1R3QvQWdG?=
 =?utf-8?B?MzdYcW4rZmw3d0Z6S01ab0orYzNra1p0azNwcVhkU09DRTZKWDRvUjNJVWQ4?=
 =?utf-8?B?KzFMQzFhVmVzVEtqUFRDOFN0a3BvYXdtaGlOT2s4VnhwL0xDZjJodlhHKzE2?=
 =?utf-8?B?WkFPQ0h3eHFMOFo2UHY1Q01ucTFJaUFHZEhNQ29QWWkvYTFFa3lyN0wwdWJr?=
 =?utf-8?B?ejdUMjFFSUp6RlZzOUhLNXcwRjJ3SGFWNy9FT0g5Z3U2QW5kRmVWREQ0Yi9h?=
 =?utf-8?Q?vv9P30EY4M3IyobLGukQBKvfM6G58Rd6OF8ByZD1SQcjR?=
X-MS-Exchange-AntiSpam-MessageData-1: oTVrJ+J7mwCF+Q==
X-OriginatorOrg: silabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fe173a6-fe70-491b-1b34-08de42518e64
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8205.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2025 18:31:58.3644
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 54dbd822-5231-4b20-944d-6f4abcd541fb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fwlkSujege+CKhYCgoyAsPCfhAs9sczw5no0z0LLgcpfHfZT9VCRvWEDjK32ayYz+aFHKRQQClDyw59VQG5mog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6924
X-Authority-Analysis: v=2.4 cv=SsmdKfO0 c=1 sm=1 tr=0 ts=694ae020 cx=c_pps
 a=b2ykEmuCBAXBKoHv9pAjeQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=M51BFTxLslgA:10
 a=i1IsUcr2s-wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=2AEO0YjSAAAA:8
 a=yipGoZr1oNg93eHPyHoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: 9dw3xeWtykW6hkwzhz0TZmmQH3dWYu1R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDE1NCBTYWx0ZWRfX/2SSF7Jcs8XP
 diFXO8MmkYEUUqtgCXyBkDHlaa0trc8Cm27vKVhA5Dx6KN2bUGj2ctfrzCsj/0ThVseY94JJ9yh
 s0Hb/nGG2Z8NpET8tFyMNHekE57A/6jIVCA47IFzonjf18EWedmG8If4w6++QWlhABibyd28xds
 7jBp3jgdP/WCvSZ/39s1Le3SsYTz+mc2eKZ3/u68jU9/IMQ7ajau+tX+pL/0HDbGDyoWfoukDcG
 0J9hK0tctrz0GSbY3U332MglzA0lLwzN2IJXkyRo6Is7NR3X7fGk/Afd+3Ompmzavz6UtX4dqR7
 1ADB9rNpF6OQL6AwcQm4gFUm8b0JoBak4RsDqwO57TiEsQxn93k7+mURm/S131aQTXVjxelHU96
 uvchyrYOkmjler7BByX0bFL2C0b64rE0s1vinMSx75NwDbpQBxCPenciRj8AYYtx+oqLdBbuPTJ
 o6H7UXN2B87LFsCTN/A==
X-Proofpoint-GUID: 9dw3xeWtykW6hkwzhz0TZmmQH3dWYu1R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_04,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230154
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.00 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[silabs.com,reject];
	R_DKIM_ALLOW(-0.20)[silabs.com:s=pps12202023,silabs.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:148.163.149.154];
	MIME_GOOD(-0.10)[text/plain];
	ASN(0.00)[asn:26211, ipnet:148.163.148.0/22, country:US];
	RCPT_COUNT_SEVEN(0.00)[7];
	MIME_TRACE(0.00)[0:+];
	BLOCKLISTDE_FAIL(0.00)[148.163.149.154:server fail,52.101.46.105:server fail,2603:10b6:8:162::17:server fail];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_THREE(0.00)[4];
	URIBL_BLOCKED(0.00)[silabs.com:mid,silabs.com:email,silabs.com:dkim,silabs.com:from_smtp,silabs.com:from_mime];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DNSWL_BLOCKED(0.00)[52.101.46.105:received,148.163.149.154:from,2603:10b6:8:162::17:received];
	DKIM_TRACE(0.00)[silabs.com:+]
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 1E7AA3F9AD
X-Spamd-Bar: ----
Message-ID-Hash: VHGK5NS3HDETWOVLUD3VGORWAVCUFKX7
X-Message-ID-Hash: VHGK5NS3HDETWOVLUD3VGORWAVCUFKX7
X-MailFrom: Damien.Riegel@silabs.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, linux-devel@silabs.com, =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH 7/8] greybus: add function to create SVC-less host device
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/VHGK5NS3HDETWOVLUD3VGORWAVCUFKX7/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

VGhpcyBleHBvcnRzIGEgbmV3IHN5bWJvbCwgZ2JfaGRfY3JlYXRlX3AycCwgd2hpY2ggbGV0IHVz
ZXJzIGNyZWF0ZSBhDQpob3N0IGRldmljZSB0aGF0IGRvZXNuJ3QgaGF2ZSBhbiBTVkMuIEFzIG90
aGVyIGdiX2hkXyogZnVuY3Rpb25zIGFscmVhZHkNCnN1cHBvcnQgaGFuZGxpbmcgYSBob3N0IGRl
dmljZSB3aXRoIGEgTlVMTCAnc3ZjJyBwb2ludGVyLCB0aGlzIGlzIHNhZmUNCnRvIGV4cG9zZS4N
Cg0KU2lnbmVkLW9mZi1ieTogRGFtaWVuIFJpw6lnZWwgPGRhbWllbi5yaWVnZWxAc2lsYWJzLmNv
bT4NCi0tLQ0KIGRyaXZlcnMvZ3JleWJ1cy9oZC5jICAgICAgIHwgMjMgKysrKysrKysrKysrKysr
KysrKy0tLS0NCiBpbmNsdWRlL2xpbnV4L2dyZXlidXMvaGQuaCB8ICA0ICsrKysNCiAyIGZpbGVz
IGNoYW5nZWQsIDIzIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dyZXlidXMvaGQuYyBiL2RyaXZlcnMvZ3JleWJ1cy9oZC5jDQppbmRleCAxZTJm
MWYzYTY1Zi4uMmZjOWZiZTk4N2YgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dyZXlidXMvaGQuYw0K
KysrIGIvZHJpdmVycy9ncmV5YnVzL2hkLmMNCkBAIC0xMzIsMTAgKzEzMiwxMCBAQCBjb25zdCBz
dHJ1Y3QgZGV2aWNlX3R5cGUgZ3JleWJ1c19oZF90eXBlID0gew0KIAkucmVsZWFzZQk9IGdiX2hk
X3JlbGVhc2UsDQogfTsNCiANCi1zdHJ1Y3QgZ2JfaG9zdF9kZXZpY2UgKmdiX2hkX2NyZWF0ZShz
dHJ1Y3QgZ2JfaGRfZHJpdmVyICpkcml2ZXIsDQotCQkJCSAgICBzdHJ1Y3QgZGV2aWNlICpwYXJl
bnQsDQotCQkJCSAgICBzaXplX3QgYnVmZmVyX3NpemVfbWF4LA0KLQkJCQkgICAgc2l6ZV90IG51
bV9jcG9ydHMpDQorc3RydWN0IGdiX2hvc3RfZGV2aWNlICpnYl9oZF9jcmVhdGVfcDJwKHN0cnVj
dCBnYl9oZF9kcml2ZXIgKmRyaXZlciwNCisJCQkJCXN0cnVjdCBkZXZpY2UgKnBhcmVudCwNCisJ
CQkJCXNpemVfdCBidWZmZXJfc2l6ZV9tYXgsDQorCQkJCQlzaXplX3QgbnVtX2Nwb3J0cykNCiB7
DQogCXN0cnVjdCBnYl9ob3N0X2RldmljZSAqaGQ7DQogCWludCByZXQ7DQpAQCAtMTk3LDYgKzE5
NywyMSBAQCBzdHJ1Y3QgZ2JfaG9zdF9kZXZpY2UgKmdiX2hkX2NyZWF0ZShzdHJ1Y3QgZ2JfaGRf
ZHJpdmVyICpkcml2ZXIsDQogDQogCXRyYWNlX2diX2hkX2NyZWF0ZShoZCk7DQogDQorCXJldHVy
biBoZDsNCit9DQorRVhQT1JUX1NZTUJPTF9HUEwoZ2JfaGRfY3JlYXRlX3AycCk7DQorDQorc3Ry
dWN0IGdiX2hvc3RfZGV2aWNlICpnYl9oZF9jcmVhdGUoc3RydWN0IGdiX2hkX2RyaXZlciAqZHJp
dmVyLA0KKwkJCQkgICAgc3RydWN0IGRldmljZSAqcGFyZW50LA0KKwkJCQkgICAgc2l6ZV90IGJ1
ZmZlcl9zaXplX21heCwNCisJCQkJICAgIHNpemVfdCBudW1fY3BvcnRzKQ0KK3sNCisJc3RydWN0
IGdiX2hvc3RfZGV2aWNlICpoZDsNCisNCisJaGQgPSBnYl9oZF9jcmVhdGVfcDJwKGRyaXZlciwg
cGFyZW50LCBidWZmZXJfc2l6ZV9tYXgsIG51bV9jcG9ydHMpOw0KKwlpZiAoSVNfRVJSKGhkKSkN
CisJCXJldHVybiBoZDsNCisNCiAJaGQtPnN2YyA9IGdiX3N2Y19jcmVhdGUoaGQpOw0KIAlpZiAo
IWhkLT5zdmMpIHsNCiAJCWRldl9lcnIoJmhkLT5kZXYsICJmYWlsZWQgdG8gY3JlYXRlIHN2Y1xu
Iik7DQpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9ncmV5YnVzL2hkLmggYi9pbmNsdWRlL2xp
bnV4L2dyZXlidXMvaGQuaA0KaW5kZXggNzE4ZTI4NTcwNTQuLjI4ZWU3ZmNhMWQxIDEwMDY0NA0K
LS0tIGEvaW5jbHVkZS9saW51eC9ncmV5YnVzL2hkLmgNCisrKyBiL2luY2x1ZGUvbGludXgvZ3Jl
eWJ1cy9oZC5oDQpAQCAtNzIsNiArNzIsMTAgQEAgc3RydWN0IGdiX2hvc3RfZGV2aWNlICpnYl9o
ZF9jcmVhdGUoc3RydWN0IGdiX2hkX2RyaXZlciAqZHJpdmVyLA0KIAkJCQkJc3RydWN0IGRldmlj
ZSAqcGFyZW50LA0KIAkJCQkJc2l6ZV90IGJ1ZmZlcl9zaXplX21heCwNCiAJCQkJCXNpemVfdCBu
dW1fY3BvcnRzKTsNCitzdHJ1Y3QgZ2JfaG9zdF9kZXZpY2UgKmdiX2hkX2NyZWF0ZV9wMnAoc3Ry
dWN0IGdiX2hkX2RyaXZlciAqZHJpdmVyLA0KKwkJCQkJc3RydWN0IGRldmljZSAqcGFyZW50LA0K
KwkJCQkJc2l6ZV90IGJ1ZmZlcl9zaXplX21heCwNCisJCQkJCXNpemVfdCBudW1fY3BvcnRzKTsN
CiBpbnQgZ2JfaGRfYWRkKHN0cnVjdCBnYl9ob3N0X2RldmljZSAqaGQpOw0KIHZvaWQgZ2JfaGRf
ZGVsKHN0cnVjdCBnYl9ob3N0X2RldmljZSAqaGQpOw0KIHZvaWQgZ2JfaGRfc2h1dGRvd24oc3Ry
dWN0IGdiX2hvc3RfZGV2aWNlICpoZCk7DQotLSANCjIuNDkuMA0KDQpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpncmV5YnVzLWRldiBtYWlsaW5nIGxpc3Qg
LS0gZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpUbyB1bnN1YnNjcmliZSBzZW5kIGFuIGVt
YWlsIHRvIGdyZXlidXMtZGV2LWxlYXZlQGxpc3RzLmxpbmFyby5vcmcK
