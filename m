Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 132BDD258E0
	for <lists+greybus-dev@lfdr.de>; Thu, 15 Jan 2026 16:59:47 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 0B92F401BE
	for <lists+greybus-dev@lfdr.de>; Thu, 15 Jan 2026 15:59:46 +0000 (UTC)
Received: from mx0b-0024c301.pphosted.com (mx0b-0024c301.pphosted.com [148.163.153.153])
	by lists.linaro.org (Postfix) with ESMTPS id 877BE401AE
	for <greybus-dev@lists.linaro.org>; Thu, 15 Jan 2026 15:58:50 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=silabs.com header.s=pps12202023 header.b=eg8mkWkR;
	dkim=pass header.d=silabs.com header.s=selector1 header.b=C82pWYks;
	spf=pass (lists.linaro.org: domain of Damien.Riegel@silabs.com designates 148.163.153.153 as permitted sender) smtp.mailfrom=Damien.Riegel@silabs.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1");
	dmarc=pass (policy=reject) header.from=silabs.com
Received: from pps.filterd (m0101742.ppops.net [127.0.0.1])
	by mx0a-0024c301.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60FFldAa459480;
	Thu, 15 Jan 2026 09:58:39 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps12202023;
	 bh=p+IFkmAgCTaDx3ezLDcQLVxUi/ttpKzkvlJMJuYwyUY=; b=eg8mkWkRxWiz
	EukSiJE6+O65swbUhqgOGjROoGgUFrMVMrxt1KqE/bMgBo+Rm85NP1AmpGmhJsqK
	cj96xJUgdZMK1IBieaGXOzWyIAHap+SMFCQZOh9Rh5ij1J9wJYPVfSE6wHuH40Tf
	I42zv/I8uW+7aV9Xqnf+nBu40Qgyv76XfkvwRnph+vJmhi3BK5Odnpux4FXBn1B1
	6EXibzo4Mj69eduZwGYi1pwhpMwu+Zu4EqOoGjKXhX1w5kyqbPAvUDRcaJiLjIlN
	qo/Yfjo8F3Tm+rrxBLS0DzLovB5wqE++Q+9QnKqJacUxI6r0a0ziUkv3jnJlbdSn
	fkCFX6jyLg==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11020073.outbound.protection.outlook.com [40.93.198.73])
	by mx0a-0024c301.pphosted.com (PPS) with ESMTPS id 4bq36kr0uv-3
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 15 Jan 2026 09:58:38 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NtJClwFXxlXStQLdPUdPEY3EMOrwIK+kUXGOcjMrsqXlI6NomY9yF9mLXQZ3g3RpOXjGLBP3uzuA1kcFwUJGjdF6ZMxYkP9N7hixO/plCkA8GCzk1smAsNQt7XgQxTXoi0I5gFTG6EBIajv2mlf1MjK4AgVgCpsZfNayLTU9LBLeLqLDJNexl8qo5z1uiy/NywYK3BhFxM+kjJryOzNlbmIb6cJz0+nkqn44gowG1l66Ogmo251HZiqR6Bm7vYpzKvOFNEizYt2NT57xRlqrQPr0fcuMtuGT3N0WPksl3fo96AbxddUd2y1rh/M0hwW5imWHoZa3DAamA3It7AIHdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p+IFkmAgCTaDx3ezLDcQLVxUi/ttpKzkvlJMJuYwyUY=;
 b=thtiWVxTOq0q8jbSahUPaMh03xLcPQ//C5g/zMFDvnp6FIwbgM7hOm3PKQvLXyQV0XHodJk/j7JZW9gSNSIaTWJIp8JQJLW7REFDePNhroEDB1n4DfaF+CzswPBjynR5qh+rBqj/7YvpiLPufzjpceQLJPGXiMMOJQOxGV6NMpHiYdSWB9B6AJEwG48CXB5368n4Z4BocVF7T1eHuLWK4tLBlXXZu6xywK3k5bEGwU3OJ7heUz5/fwL74/sksoNa3HxcKMs80GQO5GmAYcujlRjQ5XxIwGQ1HQvq8Z2wK6feLn/smfItygO99c7xi3fqmfwF/ahCW7nSjK4eNpMebA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silabs.com; dmarc=pass action=none header.from=silabs.com;
 dkim=pass header.d=silabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p+IFkmAgCTaDx3ezLDcQLVxUi/ttpKzkvlJMJuYwyUY=;
 b=C82pWYkscGffrqNhI4QF7FYTUOWVe0IbiextkgLf+47K1D30J3MVPFsYw7CVOhIblIrKL455of0XyZ4Y2LlhaVn0sz6wHIQ7HVdaBp9pvflE93MAQACDKqP23f4oFV34PeUQj9G0k4AdPvTY3SXqDnwNyGZ7Oqs4ma2LVOIqC04=
Received: from DS0PR11MB8205.namprd11.prod.outlook.com (2603:10b6:8:162::17)
 by SA2PR11MB5097.namprd11.prod.outlook.com (2603:10b6:806:11a::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Thu, 15 Jan
 2026 15:58:36 +0000
Received: from DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::2de6:bc88:2af7:3583]) by DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::2de6:bc88:2af7:3583%3]) with mapi id 15.20.9520.005; Thu, 15 Jan 2026
 15:58:36 +0000
From: =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
To: greybus-dev@lists.linaro.org, Johan Hovold <johan@kernel.org>,
        Alex Elder <elder@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org
Date: Thu, 15 Jan 2026 10:57:59 -0500
Message-ID: <20260115155808.36102-7-damien.riegel@silabs.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260115155808.36102-1-damien.riegel@silabs.com>
References: <20260115155808.36102-1-damien.riegel@silabs.com>
X-ClientProxiedBy: YQZPR01CA0025.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:86::22) To DS0PR11MB8205.namprd11.prod.outlook.com
 (2603:10b6:8:162::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8205:EE_|SA2PR11MB5097:EE_
X-MS-Office365-Filtering-Correlation-Id: aa58974c-6a10-4805-521a-08de544ef10f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?R3FSVVgxcWhDcU50M0dMblNabVpFd21XMFJFbGRSbjQwSjY0Zk9IbW13OExn?=
 =?utf-8?B?UzdXcDRHeXBYYXRHMDQ3V1NlM1FZTk5YS0NvQlBxcXVMRUxSbFpYZEJobVR2?=
 =?utf-8?B?V2d5TERTSEF2SzRGMWdNRGlGVlloUVI5TVoxYSt2d1FMNGhCMlBLTnZBb1Fj?=
 =?utf-8?B?ajlLU1B1RG8yQm9tcmRtcG1wRWU2WWoxdDRacEFZL3AxRm1ScUxJZVhld2N1?=
 =?utf-8?B?MTVMcDhSS2plVkwwcytZVGhRWmozQUZEa3gydzB5Y3FLdVNoZkx1d2JJUTdR?=
 =?utf-8?B?WG1WMWlzKzZpNDNTUFM3azdITEJBaDdlZHdMMzV2S0YrZ0QzeGFmTGRmOG1l?=
 =?utf-8?B?Qyt0MWlhSGttaHRUM2ZERVNNeWNZUGZsZVpYV3A0ZHlGTmxvRXpaTEVaZWxH?=
 =?utf-8?B?TTUzeVo1aWo2NCs2aDZFNERwTmZCcml5RXhmRVNXd1lRVzBpMFhUV2plcFhZ?=
 =?utf-8?B?aXdkai9FaTJNZE0vWlR2MGdNejV4cmd4Yk83Ymt2dU05S0lyN0VKZmVVR1Bu?=
 =?utf-8?B?cTVRTC80VHBNOFRxajc4am5kZTIwRzRnTGx6TVNVQzVBeWkwQzJNWTlUYzdk?=
 =?utf-8?B?aVVENElQMnFMSnZKTUJqalAxemU4cEpqbndOUEVYbm9Nc2dXK1dzOFVvQ0E5?=
 =?utf-8?B?QmswLzdDeFljdWp1bno5VGtoT1FZVlozeDU5SmljTlhtcGQ4QTJSK3dGOU1K?=
 =?utf-8?B?Yml4YjVJdXB6ZzBuQlNjQmZ3SkQrc1dYZkJlMi90NnAwOW1CV25RdTYrZHZ1?=
 =?utf-8?B?ZmhtRFFQK25lOEJ2V1UxdVVKZVlkSWFsNVdSbjFySkE5R3FWd1VOcFhiM2I1?=
 =?utf-8?B?NnNJZDhjUERHYWo1dVJFRWw1dXlOa21NaC9yNnQzNkRJL0JFTFBlRVRFYWxk?=
 =?utf-8?B?dEFyblpoYnNRMkhKOUJkcEQrNTloaWcyaHViSFlia0k2Y3dSMnYwUGVPMVd6?=
 =?utf-8?B?ZTNRaU1XM044ODJBeWI4MEtHd3p4V0lkWEgzTGc3aitoUER4dzJNSXM0Qzhr?=
 =?utf-8?B?RkUvbUdKeGwyMEpzcDNud1ZSOFMxL2tkNmVpcFVZU2FvalVkWDVVQk51eXQ0?=
 =?utf-8?B?MVhZVmJ4bHdTNDkzdnlaZHYyQThoZE8rd05rODQ3RE5VYUR6eFFKc09wWlVn?=
 =?utf-8?B?d2FoSHFycUJnVXRzSmRJczJKblFGeGptRVhtcWpLSllHWndoSkNIM2FsNEVp?=
 =?utf-8?B?WTgwemNqN3QrQmM4ZE1xUUI0OUZURHlWRGtXM2NGZ2pROEJoZ3g3aTVKcmNS?=
 =?utf-8?B?MmUyZFpQYXFwOHRFZXR4Q0RxK3NxRWRYczZaOUlSZVRxOWNwWGVMUTYwMTBD?=
 =?utf-8?B?dnhkUXlwOWp4MHdVSjlUNTA5RExpNEJWeEMxT1JVV0FUYjB5NkdlSDQxajNv?=
 =?utf-8?B?QkZFUlJJcVBoMUM2UDlYQk03OVNGckhOMTlrSUR0Y3JYMUxEcG9VTEdxY00r?=
 =?utf-8?B?Y09zTlIxc2lla0NNL3d1RklINitxQyt3WHpsR2JUTlloZ2g5Nm9KcGVRbkNw?=
 =?utf-8?B?cERialpROTkvNlBGd3c5aEtMaUdYeTNLdGYzSW5pK2pTaVRBN0JoNjFISnlU?=
 =?utf-8?B?SkVPRC9LZllHT1JkTm8zWGo4K0NHSlJvcTdPSWhyTVE4elVpMzh6VDNMWWpR?=
 =?utf-8?B?UVMzQ3FMUlpWa0wzZE5MenNrSG43azNDV1VkS1hVeUhXRXdFWTI3L2F5SmhD?=
 =?utf-8?B?aGhXNnRiS3NPbWMwR0h1Vm8vRDRndGxOaW9uSTMyemFEclZ6ZXptbTQyOWJH?=
 =?utf-8?B?ZTcreGNXSjFaWW9ONDVSK256N0w4WC9rSnI0UkdlOHBQUnF4Y1JsZTMwZ1Zv?=
 =?utf-8?B?d2RrSVZpckJ4S0pxRUhGMnFOOVpncEZaSjF3V0xwNXVBbTdDekgxTWV4ajAw?=
 =?utf-8?B?aWFuWWttNUhXSUd0NUJVdk9Pb09TOVI1ckQ3Q1dTOU1WbFU1dkFJWXNnVXIx?=
 =?utf-8?B?RythLzVjTVpWWUQwUVUvZ0l6TERlV0YzNVNaUUlMNXFTRTZUSnZJUVhNZHp2?=
 =?utf-8?B?YjdrWTJVRlB6bE1MUFh4L2tEQzFaL0FUR2hpUTRFTTZJcGJrMXZsYmZmVGtY?=
 =?utf-8?B?N2pPVWZVQTYyM3dhNXQzYUgrVEUzd2NITEZwaEJ6bWM5M25KYytBMkRUVEls?=
 =?utf-8?B?UE9yVWcvOVM0dU1RUGZSeW9sRHVobHV2ZjQ3c1o4UW1hKytYTW9hdHdsQzA5?=
 =?utf-8?Q?a50ZvhCW7AF66Jj5r2XqNiY=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8205.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?R1dERXRQWEVhMkZsWXFtNHlTTWQxcDhFbnQ2S1VXcjZSZXlUK2VtWDVydnhw?=
 =?utf-8?B?Ymt4YUllZXgrRVBFT3hnYVZEWnBJVCtmUUQzS3M4cGkweVRxbm1iRERDcXdV?=
 =?utf-8?B?b1dFaXFnaFBhYnJGaDFGNitsNTg4SUZLRm5ORUNrbEFsYUgrTmpDdjhBeWdG?=
 =?utf-8?B?VkEzS29ObnZBTEhkNmNlYU9RMDZIUXliMWxueFhJZGFCSjRGZU5INU90Qk01?=
 =?utf-8?B?NHgxY1V6V3lZY01RdE5aYmJYWU5wZTJQOWFaUE14YzRqclpaMlZySllIOEJq?=
 =?utf-8?B?eG01WkFvSDQ3RVRCSTNjWVhXeHkxNXFycHRHMmVPWmxUTncrYXI5eUdyVmRY?=
 =?utf-8?B?NlhzNWVpSjAzSkhiOThKUmhzRXVXc0krL3dLRGVTZUFURGVhbDVEbzMrK2dl?=
 =?utf-8?B?OEJ5eVBqanU0ZCtxT1Fqb2JWczdCcmhQM00rRlZNQnRQcGNpNFU4ZEMrVVRp?=
 =?utf-8?B?NnI1V1NUZHdFbjNQdmVwTGs2RDJuMFZLRVVWU0dua09GWW5xZVZMUEg4T1Z6?=
 =?utf-8?B?aURpU0VpOUZ5U2FwZWM1a2Y2QmlyUWtsSEIxeElMdUdxRStuSWNJRkxNUVZZ?=
 =?utf-8?B?U0lwT3BXYXdnMGdjOGlqb1p6T0JvbFVLdmtqRVVublFOMlRZbkllOGdGVEdQ?=
 =?utf-8?B?WWhPY2NjVUVjRlU3NURFbnUrMmpsOURKMTBXYVhuVkx4Mlk1YUR5bFdwa25m?=
 =?utf-8?B?bFBoQ2xvZUNhMGFBUG0zRVREczlob0hxOWdUdDBkNXRaNWlBZE9mcFlQZS8y?=
 =?utf-8?B?ck00T1Zkc0h6dFZpVDErT1ZrRlUrYXNGRlF2YmRMV0dxaXB1blJQSDJiUEF0?=
 =?utf-8?B?ZmM5MXlQbjJBYkxETzhlUnhxallWRG82d3k4OW1EZWY0ZVI1QURkNWZzUVph?=
 =?utf-8?B?aUNGU2dYMWxHQVlESGZCQVVRMzhjendCSWVIRFE2MmVLVWVwMFFaTDlVQ2sv?=
 =?utf-8?B?dWtKTzBlUDlCa0JhUk83T0Z5WEdUYVMzam5yT3dWZitORkZGNlZ0QjJWNUJy?=
 =?utf-8?B?ZW5nOUtWUytOK09ZSGhkRGJZNXBWTzEvbnpQZ1UrYkxGOHE2a2FZMEdsMlJY?=
 =?utf-8?B?UWI2OTc2Skh2NkJ1b25BTEYrTk9RaTlCdFZWdUF2V1Iwak5WaG1MelVuMUE1?=
 =?utf-8?B?NVN0VmtVaEdlS3B2R1VvQjRPR2NXOUF0czJqRzJ4TGtrd0VsS1JscE1IdEFi?=
 =?utf-8?B?SVBMQzh6bFA1WG5sK0RydFdXbU11Tzg2RDlSR0JjRks1ZlVCaFpOMXVQMnVL?=
 =?utf-8?B?alBtU3dvcFgxeGVnY3RWRmo3T2lXZWt6eUhWT1c1L2xZQXJyMGdBQVRHUlh0?=
 =?utf-8?B?cG5NNS81NXZiUjBEa1NZRGZKcmJXMU9jd1RZc2NaWEx4MmlyaWFWNjBSQ3BQ?=
 =?utf-8?B?ODFBRE1YalZ0dDFldnlTMFREQlJYZkF5emliUzJmMGFDVFZwUjZkL2VEK1l1?=
 =?utf-8?B?RDkxUHRuQkRUczNsRStxREVxNENzQ1QrSWZGa1RYNjllUE1QQXpKaTZtNEZD?=
 =?utf-8?B?Ym9UZWhTQ3JDZ0o3RmxtU3FYRkdUbkFWcFNrcnBMVVRRM1ZnbVEybkJLTFZ0?=
 =?utf-8?B?YnlNOUlRSG9nVG94OUIxNUtlV1pzano2Qm1JUFJZTDkrR3VkMStDN0Y0QWdk?=
 =?utf-8?B?QjBBL0VxQ05uakhTZlZaVnZ3NUorMmtrMjZ1TTUzV1R4Q20zNjlVR0dhL2ln?=
 =?utf-8?B?NiszRTB1K2NFWDZTemlMN1VEQ3g3aUFkMnQ0bmw3bVFrVkFYQzBHSXoyMGto?=
 =?utf-8?B?TGtJQzJrQjBCdFM2TWh4ellXWHVVQmYyN1Y5Uyt1blcwSytaSThOVGxyQkU5?=
 =?utf-8?B?c004N0w1NUt4bjlISktWeHBBSUlvNTV2TFNUbXk1eHZ0Q1ZoR3JsSEZDUG1h?=
 =?utf-8?B?bTlNYnhXYmJvUjJhRlIwQ29VZm9tZ3BlUlltc1JXbDZDQlRmcW43UTZ3MW1r?=
 =?utf-8?B?ckhwcFhTakNFb3hjdzQ0ZXdKd3pFdVB6OXFraDdrUEJVbmRwenBxTGhHelZp?=
 =?utf-8?B?eXlFUEM2RUMrVFdqY1JOalh4UnBETTJobzF4NGNsVmIxYmUyeEJ6UVBPOERu?=
 =?utf-8?B?ekV2cDhudGlScm0ySDBKTlZCMmVKNTIyUDl4NkYzWE55L0phWVR1QWZ0WGdO?=
 =?utf-8?B?dmkyWEs5TWFMTlkyWm1Xd0RRUHBpcUVSRUFheEdBd2ZpUUhRdWNIOUMvWUF5?=
 =?utf-8?B?SjFTdnF3UTVLekJOV1Y0dmtCekRqWlp5aTEwVWRlcGkvZUZmeHd0OE1zVGg0?=
 =?utf-8?B?OVZuR0YwbitiQVhldUQ3WFR1dnJSdzJUb0VNTHAzcTNWWlZFaFFUblNvcWhS?=
 =?utf-8?B?T3FEWDFFNHdTV3hKR0pPQ3lMVFlPaFp0cHhySklaaHExa21VODRqQT09?=
X-OriginatorOrg: silabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa58974c-6a10-4805-521a-08de544ef10f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8205.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 15:58:36.3026
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 54dbd822-5231-4b20-944d-6f4abcd541fb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y0oKt5IaY+tfKjQhH29E+Lr5XZ4RzmRHntMx/1y66ZPzICPBPcf0eiIx0d0R7W3JnmkvX6Gkoz7M9H5hHn6JxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5097
X-Proofpoint-GUID: ifYb2unUUwlDCKpHJT8bprw1ktf7OTJk
X-Authority-Analysis: v=2.4 cv=M6BA6iws c=1 sm=1 tr=0 ts=69690eae cx=c_pps
 a=XGteBKPvimVCBgpwGHxg/w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=M51BFTxLslgA:10
 a=i1IsUcr2s-wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=2AEO0YjSAAAA:8
 a=lqD4pFEZOuXrchdWF_wA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDEyMSBTYWx0ZWRfX4ubrQYIUKXBu
 i9RC8QwC4K6DNcFgyXCl/2F9n8g1WPC9TfCH2nV1ecUkRQm/8mk2BSrb6PHYvcoHzDYfrapF8hr
 5mTP5D/UcjDvEj7n6bc1rzxBJqj7QVSRSrzL0xiWEXNeYpyzNQF85kvwkErFzBP3WvWsQG5dhh+
 baycEdlSR5h9/KepxObN3BnlK0b8VbKJVBL+NbNdxK2EfotGBilm0kWAd80l9Ux8Xc/5KgRueLh
 ugW911iFYKcj6R2BCUTxdKpMRWIQH2sYW3cY4HWdxWxdtf7IThX2yRF2VnW6Luz/sDP6+Wt7ADu
 aLObgLC5NjBdRT7lqZE8MqDmmt+ja/P3Igb+rSO6dZqcoLwB/JL5KrF39sPkIweql9/0cUiJ7o8
 vJ9BhoC6omHAsUAA5Ax7kW9aotl5nkB6EVltKvdmQMxub0wMaKd/1Xi/X6MWxl3gI/cFORD+77X
 YYE1YZb2Znk/pTiqo+A==
X-Proofpoint-ORIG-GUID: ifYb2unUUwlDCKpHJT8bprw1ktf7OTJk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_05,2026-01-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 spamscore=0 adultscore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601150121
X-Rspamd-Queue-Id: 877BE401AE
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
Message-ID-Hash: ZJ2L2IHLN3U7SB63XV3SL6GNHJ32XCND
X-Message-ID-Hash: ZJ2L2IHLN3U7SB63XV3SL6GNHJ32XCND
X-MailFrom: Damien.Riegel@silabs.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Silicon Labs Kernel Team <linux-devel@silabs.com>, =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v2 06/14] greybus: cpc: introduce CPC header structure
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/ZJ2L2IHLN3U7SB63XV3SL6GNHJ32XCND/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

Q1BDIG1haW4gZmVhdHVyZXMgYXJlIHJlbGlhYmxlIHRyYW5zbWlzc2lvbiBhbmQgcmVtb3RlJ3Mg
cmVjZWl2ZSB3aW5kb3cNCm1hbmFnZW1lbnQuIFRvIGltcGxlbWVudCB0aGVzZSBmZWF0dXJlcywg
YW4gYWRkaXRpb25hbCBoZWFkZXIgaXMgbmVlZGVkLg0KVGhpcyBoZWFkZXIgaXMgcHJlcGVuZGVk
IHRvIGFsbCBHcmV5YnVzIG1lc3NhZ2VzLg0KDQpSZWxpYWJsZSB0cmFuc21pc3Npb246IHRvIG1h
a2UgdHJhbnNtaXNzaW9uIHJlbGlhYmxlLCBtZXNzYWdlcyBhcmUNCnNlcXVlbmNlZCBhbmQgYWNr
bm93bGVkZ2VkLiBUaGF0IGNvbnN0aXR1dGVzIHR3byBieXRlcyBvZiB0aGUgaGVhZGVyLA0Kb25l
IGZvciB0aGUgc2VxdWVuY2UgbnVtYmVyLCBvbmUgZm9yIHRoZSBhY2tub3dsZWRnbWVudCBudW1i
ZXIuIElmIGENCm1lc3NhZ2UgaXMgbm90IGFja2VkIGluIGEgdGltZWx5IG1hbm5lciwgYSByZXRy
YW5zbWlzc2lvbiBtZWNoYW5pc20gd2lsbA0KYXR0ZW1wdCBhbm90aGVyIHRyYW5zbWlzc2lvbi4g
VGhhdCBtZWNoYW5pc20gd2lsbCBiZSBpbXBsZW1lbnRlZCBpbiBhDQpmdXR1cmUgcGF0Y2ggc2V0
Lg0KDQpSZW1vdGUncyByZWNlaXZlIHdpbmRvdzogdGhlIHJlbW90ZSBhZHZlcnRpc2VzIHRoZSBu
dW1iZXIgb2YgcmVjZXB0aW9uDQpidWZmZXJzIHRoYXQgYXJlIGF2YWlsYWJsZSBvbiB0aGlzIGNw
b3J0LiBUaGUgb3RoZXIgcGVlciBtdXN0IHRha2UgY2FyZQ0Kb2Ygbm90IHNlbmRpbmcgbW9yZSBt
ZXNzYWdlcyB0aGFuIGFkdmVydGlzZWQgYnkgdGhlIHJlbW90ZS4gVGhpcyBpcyBhDQpzb3J0IG9m
IGZsb3cgY29udHJvbC4gVGhhdCBhY2NvdW50cyBmb3Igb25lIGJ5dGUgaW4gdGhlIGhlYWRlci4N
Cg0KVGhlIHJlbWFpbmluZyBieXRlIGNhcnJpZXMgc29tZSBmbGFncy4gRm9yIGluc3RhbmNlLCB0
aGVyZSBpcyBhIGZsYWcgdG8NCmluZGljYXRlIGlmIGl0J3MgYSBDUEMgbWVzc2FnZSBvciBhIEdy
ZXlidXMgbWVzc2FnZS4NCg0KU2lnbmVkLW9mZi1ieTogRGFtaWVuIFJpw6lnZWwgPGRhbWllbi5y
aWVnZWxAc2lsYWJzLmNvbT4NCi0tLQ0KQ2hhbmdlcyBpbiB2MjoNCiAgLSBNaW5vciB0d2Vha3Mg
dG8gc3RydWN0dXJlIGRvY3VtZW50YXRpb24NCg0KIGRyaXZlcnMvZ3JleWJ1cy9jcGMvaGVhZGVy
LmggfCA0NCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCiAxIGZpbGUgY2hh
bmdlZCwgNDQgaW5zZXJ0aW9ucygrKQ0KIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dyZXli
dXMvY3BjL2hlYWRlci5oDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dyZXlidXMvY3BjL2hlYWRl
ci5oIGIvZHJpdmVycy9ncmV5YnVzL2NwYy9oZWFkZXIuaA0KbmV3IGZpbGUgbW9kZSAxMDA2NDQN
CmluZGV4IDAwMDAwMDAwMDAwLi5hZjI4M2ZlYzQ5Mg0KLS0tIC9kZXYvbnVsbA0KKysrIGIvZHJp
dmVycy9ncmV5YnVzL2NwYy9oZWFkZXIuaA0KQEAgLTAsMCArMSw0NCBAQA0KKy8qIFNQRFgtTGlj
ZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wICovDQorLyoNCisgKiBDb3B5cmlnaHQgKGMpIDIwMjUs
IFNpbGljb24gTGFib3JhdG9yaWVzLCBJbmMuDQorICovDQorDQorI2lmbmRlZiBfX0NQQ19IRUFE
RVJfSA0KKyNkZWZpbmUgX19DUENfSEVBREVSX0gNCisNCisjaW5jbHVkZSA8bGludXgvZ3JleWJ1
cy5oPg0KKyNpbmNsdWRlIDxsaW51eC90eXBlcy5oPg0KKw0KKyNkZWZpbmUgQ1BDX0hFQURFUl9N
QVhfUlhfV0lORE9XIFU4X01BWA0KKw0KKy8qKg0KKyAqIHN0cnVjdCBjcGMgaGVhZGVyIC0gUmVw
cmVzZW50YXRpb24gb2YgQ1BDIGhlYWRlci4NCisgKiBAY3RybF9mbGFnczogY29udGFpbnMgdGhl
IHR5cGUgb2YgZnJhbWUgYW5kIG90aGVyIGNvbnRyb2wgZmxhZ3MuDQorICogQHJlY3Zfd25kOiBu
dW1iZXIgb2YgYnVmZmVycyB0aGF0IHRoZSBjcG9ydCBjYW4gcmVjZWl2ZSB3aXRob3V0IGJsb2Nr
aW5nLg0KKyAqIEBzZXE6IHNlcXVlbmNlIG51bWJlci4NCisgKiBAYWNrOiBhY2tub3dsZWRnZSBu
dW1iZXIsIGluZGljYXRlIHRvIHRoZSByZW1vdGUgdGhlIG5leHQgc2VxdWVuY2UgbnVtYmVyDQor
ICoJIHRoaXMgcGVlciBleHBlY3RzIHRvIHNlZS4NCisgKg0KKyAqIEVhY2ggcGVlciBjYW4gY29u
ZmlybSByZWNlcHRpb24gb2YgZnJhbWVzIGJ5IHNldHRpbmcgdGhlIGFja25vd2xlZGdtZW50IG51
bWJlciB0byB0aGUgbmV4dCBmcmFtZQ0KKyAqIGl0IGV4cGVjdHMgdG8gc2VlLCBpLmUuIHNldHRp
bmcgdGhlIGFjayBudW1iZXIgdG8gWCBlZmZlY3RpdmVseSBhY2tub3dsZWRnZXMgZnJhbWVzIHdp
dGggc2VxdWVuY2UNCisgKiBudW1iZXIgdXAgdG8gWC0xLg0KKyAqDQorICogQ1BDIGlzIGRlc2ln
bmVkIGFyb3VuZCB0aGUgY29uY2VwdCB0aGF0IGVhY2ggY3BvcnQgaGFzIGl0cyBwb29sIG9mIHJl
Y2VwdGlvbiBidWZmZXJzLiBUaGUgbnVtYmVyDQorICogb2YgYnVmZmVycyBpbiBhIHBvb2wgaXMg
YWR2ZXJ0aXNlZCB0byB0aGUgcmVtb3RlIHZpYSB0aGUgQHJlY3Zfd25kIGF0dHJpYnV0ZS4gVGhp
cyBhY3RzIGFzDQorICogc29mdHdhcmUgZmxvdy1jb250cm9sLCBhbmQgYSBwZWVyIHNoYWxsIG5v
dCBzZW5kIGZyYW1lcyB0byBhIHJlbW90ZSBpZiB0aGUgQHJlY3Zfd25kIGlzIHplcm8uDQorICoN
CisgKiBUaGUgZWlnaHRoLWJpdCAoMHg4MCkgb2YgdGhlIGNvbnRyb2wgYnl0ZSBpbmRpY2F0ZXMg
aWYgdGhlIGZyYW1lIHRhcmdldHMgQ1BDIG9yIEdyZXlidXMuIElmIHRoZQ0KKyAqIGJpdCBpcyBz
ZXQsIHRoZSBmcmFtZSBzaG91bGQgYmUgaW50ZXJwcmV0ZWQgYXMgYSBDUEMgY29udHJvbCBmcmFt
ZS4gRm9yIHNpbXBsaWNpdHksIGNvbnRyb2wNCisgKiBmcmFtZXMgaGF2ZSB0aGUgc2FtZSBlbmNv
ZGluZyBhcyBHcmV5YnVzIGZyYW1lcy4NCisgKi8NCitzdHJ1Y3QgY3BjX2hlYWRlciB7DQorCV9f
dTggY3RybF9mbGFnczsNCisJX191OCByZWN2X3duZDsNCisJX191OCBzZXE7DQorCV9fdTggYWNr
Ow0KK30gX19wYWNrZWQ7DQorDQorI2RlZmluZSBDUENfSEVBREVSX1NJWkUgKHNpemVvZihzdHJ1
Y3QgY3BjX2hlYWRlcikpDQorI2RlZmluZSBHUkVZQlVTX0hFQURFUl9TSVpFIChzaXplb2Yoc3Ry
dWN0IGdiX29wZXJhdGlvbl9tc2dfaGRyKSkNCisNCisjZW5kaWYNCi0tIA0KMi41Mi4wDQoNCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmdyZXlidXMtZGV2
IG1haWxpbmcgbGlzdCAtLSBncmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3JnClRvIHVuc3Vic2Ny
aWJlIHNlbmQgYW4gZW1haWwgdG8gZ3JleWJ1cy1kZXYtbGVhdmVAbGlzdHMubGluYXJvLm9yZwo=
