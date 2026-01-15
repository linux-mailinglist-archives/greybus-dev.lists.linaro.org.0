Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ADB7D258D9
	for <lists+greybus-dev@lfdr.de>; Thu, 15 Jan 2026 16:59:37 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id B6800401BE
	for <lists+greybus-dev@lfdr.de>; Thu, 15 Jan 2026 15:59:36 +0000 (UTC)
Received: from mx0b-0024c301.pphosted.com (mx0b-0024c301.pphosted.com [148.163.153.153])
	by lists.linaro.org (Postfix) with ESMTPS id BBEB0401EB
	for <greybus-dev@lists.linaro.org>; Thu, 15 Jan 2026 15:58:49 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=silabs.com header.s=pps12202023 header.b=gpBmS9DJ;
	dkim=pass header.d=silabs.com header.s=selector1 header.b=KVKjG+z+;
	spf=pass (lists.linaro.org: domain of Damien.Riegel@silabs.com designates 148.163.153.153 as permitted sender) smtp.mailfrom=Damien.Riegel@silabs.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1");
	dmarc=pass (policy=reject) header.from=silabs.com
Received: from pps.filterd (m0101742.ppops.net [127.0.0.1])
	by mx0a-0024c301.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60FFldAZ459480;
	Thu, 15 Jan 2026 09:58:38 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps12202023;
	 bh=QtQ2w6J6+WzvUUqe72IB8cXHNEMd2DYmh6aaYN2FbGA=; b=gpBmS9DJpAlE
	tkJ7GwKVrL8YuqZsFE4wEXEUBUXqtoML8kQMrWIogxyhasePot8IJhR4/WXlMShu
	JQTLU6JDuV22/Wj9f6Ie+0Pfx06HG3SKkW9cHhnX5asIm9XweQ76aW6QDDlI0Q0K
	9cIt24Jfb6lM7Ukcr+b+qMA6EX7tS/9zUbfuqX0LVsZTVK7OBqWJGUOM6JD3uTGg
	j5w5RfYrLG/iNTjd8cjO/O/g+tdO0HVavqhjq5MKYKv5YPPH8m08Dgc0T9GiACLj
	K88Mqbn9gH5KWkXIX9gXbDHSxXxwd7NxtEWhtadBB0H8px45luUETqS1lL3h8S5K
	yK63hD0XyQ==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11020073.outbound.protection.outlook.com [40.93.198.73])
	by mx0a-0024c301.pphosted.com (PPS) with ESMTPS id 4bq36kr0uv-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 15 Jan 2026 09:58:38 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tFuUUoulkRlYrO/ceMLhCWZ/6o3+pmqDvnJaW3wHiccspu/DMGpRlYdXvGG4MxzLFfcE2+pC6aKUD4IoYNuU3cSHOhB+S2wlE8b1PbFNkQ7vF92+hEx6RYo7PDPqOZ8rhQ2Skk/yHvyz/oZDc1OhTA0PVKv3e0sxg6hVApDaahWNeriEzFJAZjovHwpwCdOs+/LrJLn/ppitQq8Bz8/j61uZz95uz9hUR4FK3coPje0iGHUlQd+MnQZ4v/r8QV89YjMPuKDJ6o5HeMWalyFqCEXEtNYDfoAHdVlcIL19vN2uVGScCxAGwjn0y/uj70rCtwndSxp6A1RT1bun0hHbyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QtQ2w6J6+WzvUUqe72IB8cXHNEMd2DYmh6aaYN2FbGA=;
 b=t63eFkeri76Ja5yzJz5N360+r3dANjqIGixjr/RFEwj3f3e4pOk9MUWtLv9s8PpsnHiz35KaZjtajNEfivg5o7mDsfxKSIcJDVM76YQLe/4ddFqnV/ey1uNGSyE0zwGpDAyLQV8N15XBxY/3fUJSBiTw19hNJko65XawjwLWS9osmxOfK+6Wm9s28OFSaXYTvJnCp4qykUj5oBNJj3AFkNOwFJzvLBU+SAwSGOkgrK8xjg2s19WClKtpRnM1ZlSHLMrFBOBOxXLdKJFe0EnQ94slHOUkvwyBOiHhfdf0eJlf2JJNf+jSfh96tXmSb7GsEkjxKvrTwxhbprgJyFNdUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silabs.com; dmarc=pass action=none header.from=silabs.com;
 dkim=pass header.d=silabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QtQ2w6J6+WzvUUqe72IB8cXHNEMd2DYmh6aaYN2FbGA=;
 b=KVKjG+z+BjEJk+cHcYyZGzAtQ8Yhw8tCO547busTo1p4vvSjBhP2hFIQrMhk9ImvRjiyGxfRne8qfcedggC+bJaDGUy82tDzKDweqGvVBUCQmrOaurk48USNPq2kKXnzLF+++NqyHSPvpiT5vYbnxsPC28WJwbIlEzJkD9Uegq8=
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
Date: Thu, 15 Jan 2026 10:57:57 -0500
Message-ID: <20260115155808.36102-5-damien.riegel@silabs.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260115155808.36102-1-damien.riegel@silabs.com>
References: <20260115155808.36102-1-damien.riegel@silabs.com>
X-ClientProxiedBy: YQZPR01CA0025.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:86::22) To DS0PR11MB8205.namprd11.prod.outlook.com
 (2603:10b6:8:162::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8205:EE_|SA2PR11MB5097:EE_
X-MS-Office365-Filtering-Correlation-Id: 2128d140-f16a-40b1-55a5-08de544ef00d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?bVJ2dnl5c1NyWXR3Y05VQUJjdXhmOVZqTlNaZjVsNDVEelFLVXh2WkVDL280?=
 =?utf-8?B?eEd1N216VmQzWjNQSSttK01CcU9OTHY5citnR2NPdXpUcXk0V0kwdWZ2Y0Jt?=
 =?utf-8?B?UGMwMHlOM1kyOG1OcWNwMllnbWJabkFPQkh5WGx3Rm9RQnZrNjRwcEFVUlEz?=
 =?utf-8?B?ZjZPSFNjMUVkQVFtYTVIeFM3SHpmS1BjeUNjWk1LUzJ5YURjQUh5N29Uek5Z?=
 =?utf-8?B?TXQvQkh1ODBkbWVlem53LzdablVPWUpDNDRaYzRvR2VPMkg0RWwyMHdEbTFk?=
 =?utf-8?B?TXl6TWwyR2RIOWNJS2VQaTFKbUtTVENvQk1KU3BGakZMazRhUnBMVE11a3lX?=
 =?utf-8?B?WGcvamVJcDEvTHg0cGZRcTJjMFloQ0lROWdKaXlqUjF3enlUdTNmMGVsTlJy?=
 =?utf-8?B?WE9YcCtGNXBqL1hwSTNDNjRVaDVHc2hlUHhCUWM5elB1d2Q0MXZCRlJkR2g2?=
 =?utf-8?B?ZVh6bHh0UU5YQ1VoajZ0QjJnZGtIS0hZRWxxZ0VBWTFqdUFLMzhtWmpUd2M5?=
 =?utf-8?B?a3ErV1MweDVlQUhYZitlbVQ0WGhVaGo5U01ubEo1NG8yTWdnTXJHcWRDakp4?=
 =?utf-8?B?cFFXazl2M0k3bmlDTm5FQ2h6dkVtOFFYQmxFODd1TjcwTlc4MVVNbjNWaE1q?=
 =?utf-8?B?amQ5K1VVUUIxeDR6Y21nSk5aWUJHQWpma00rV3FPZWczU2lzc3VFNlNMNzlL?=
 =?utf-8?B?THQrOGR3NkxSdEdGRXlkaVlZaTZHZEp5RTdFSElQYnF4VldveHFoWTFoODVK?=
 =?utf-8?B?Vm5wMWRkY2x0TURoZm0yRm82NFQ0TE4yVDdDQ2dkdyswelVlK0syODltUkUz?=
 =?utf-8?B?SEo4SkJWbk05OFVJM0plNjk1NmhXY2NtNStzTjhNc2pibHU5M0NocGRmdWM4?=
 =?utf-8?B?b2NOWkhHa2JzK09TQmFqQTF1TVVqYjBjaW1ZUjdUdFc3bVdXd2JuZzlRZ2dW?=
 =?utf-8?B?RFhBRUNNaGpYRXRDVllkeVh5ZVp6Uk5vODBUTGpyNDRyU2MvbjlSN25GcG01?=
 =?utf-8?B?U1FFT3RkNWYzeHVjdlo0czVLVnhWZk5EL0c5RWswbW41V3pzWkxBZ2llMVIz?=
 =?utf-8?B?WkJxV25ZckRzZHNZcEpwTDNZdEx6VnhTQm1tNU1TWG1xYmM2ODVzV21xN1NG?=
 =?utf-8?B?Rk9rcm1JdXlWTy80WlF3VERUTEd1bWFJb0RRM0tqMng0QzFSTzFXOENnMk5G?=
 =?utf-8?B?UkloS3RxR0tYM2pWTFRrd3pua1Faa1JlS2JoUFprVVM3RnZrVUxPY2loeFhz?=
 =?utf-8?B?M1FLUXQxWWtyTmNQRGxiem95K2N0M2JGQ3BTei8rR0VPTVJFZVhOejlFY2FE?=
 =?utf-8?B?Wjc4ckowb1lxU25yUmFRS29rYklWUXRHUXc4d3JvbmlOaHhFYlpxMEpJZGps?=
 =?utf-8?B?a3VQREt4R0Y0ekNjYkNQZTRGQ1A1ejNkc0laMThiRmpuMkIwQ09kVkQwazJD?=
 =?utf-8?B?SUFCMFpEQUkveGRkWnEyYVpWK05KcFA0MTQ3UnNvejFNS040aStvQVZiQk1R?=
 =?utf-8?B?MWFzbC9TMW9CZ3IzNkIrVHd4alVWVC9lOUdQL0lDTVp6Y1RtZGV2MWZBVFgz?=
 =?utf-8?B?emcvazljeVVwa3BlUHpRM2lZSUxNMU5MM1hLbnR2cW01S1FvVXJKeGdOOElq?=
 =?utf-8?B?N1NyY1Y0RS9HOFlHbXhYUGo3MCt4cHVJSWFWUUtzOWRoZVpjL0JzbGdUOUNa?=
 =?utf-8?B?VXhHVWxxNG56YUpkTjhWbUJVL3puL3ZZY09RNVVhMFZpNkdyWFJuUWd6OEdk?=
 =?utf-8?B?LzlId0pUSlh6UXd3K0NPSVFMaTNsYlB3bERhUTl6dGk0cjZnZGR3QWUzaXV3?=
 =?utf-8?B?R1NpUUI1NzMvZkg3LzgvYVgxbjZERkQyNW5HVGhvdG1IbnFVV0JHRVo2aXZz?=
 =?utf-8?B?TGNZd0w0eXZoOHlSbVRnaFZBeGZ5WmZURmp3VStydFFua2pqbTNxU0ZnZGpH?=
 =?utf-8?B?WDRxYTVYOGVVd1d4NDVFcTA3VDU0SjFudGFWdkdFYzQ1SVIyN29HRzI2TFVq?=
 =?utf-8?B?OHRpNS9TSEVOQitBQ0VhaW1QTGV4c0ZiMFpLMk0wMEZjUWxyVGZVMER2NXpm?=
 =?utf-8?B?T09NbitzYStyRDVMZnNpSktxZjhRd0FZOEc4NVg3KytwQ21nSk1rUU5iTXZQ?=
 =?utf-8?B?WFNkTWIvOXlvNFFMWExHVnduNThob2NuZ1c4UU9nY3NsMkRYcGwwdXlKWk9V?=
 =?utf-8?Q?Hc7MrA++9Bjzv1Ozr+EaYO4=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8205.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NEI5aUd0Z3lkSU5NSklSU1NPR2JXeGdVK2hYY1ZZK2hVeERjUGNWRXlOQ0VI?=
 =?utf-8?B?TWhob0hQQXZDQ1R0SGp4TjBsOHBQUUFJeEFLSTA2ZzBaREdNaVFTNFJ6QktG?=
 =?utf-8?B?NnBaZmYrOEVRYnJ4cHE2U21sQmRiZk1wS3EvcVNheWdSU3hOcCt5YVBySVI4?=
 =?utf-8?B?ZGd0SWlCVnBzOVBqU2NmVDVTeXd2aS9ySk1GcXlITjdxNE5QQk9mYjFhZEd3?=
 =?utf-8?B?YlBXWm9FRmJmSHJBYVRFelUwclY2ejhncW15YWxQYTZ5aHdjREJ4dVNDZG8x?=
 =?utf-8?B?cU5Ra3FlSTlsUmxYaVh5SnF0TkVWYmRWbytkTWNpbkg4cWtkTHArZXU5aDZs?=
 =?utf-8?B?b2hvd3QvM2RMR1hHaWhkQ05SaDdITlp2TnhGR1BUc1pPZVhiWUVhK3lycits?=
 =?utf-8?B?eDB2MHNVaVNkYVNXSm14VGdJZ2VYOTJOM3hMS0hVRjhaZkdUTy9JdkVhczJJ?=
 =?utf-8?B?NllXNjB2V2hhckhkNkY5SUhYb1dKRjlJRkVidTZpRVJSaiszeWJ5Z1BjNkJr?=
 =?utf-8?B?ZjNZcWhobnZnS2QwTWhqQ3dUcDR1dzVReTZ3K1EvSk54OTFVMDZkMVlhUEtt?=
 =?utf-8?B?bWZSejFTZmpCanNRMFZWSktxRkMxU3Z3ZkJvcXRSTXFUSFJGNkc3U09BRGlK?=
 =?utf-8?B?SSt0U1NmelVsTUtPc3RYQXNoYyt1UTdEVERYZkd1aEMyRTgyMktVU0ZCTmhP?=
 =?utf-8?B?alpBUGtBK1FtdUw3Y0FHbURhbXRyUmZrOEQxVXJ0ZnVReW51WWpaM1dSc0k4?=
 =?utf-8?B?Vi94M3ovZnI2SzVrZGxkWGt0K25SeHNBT3lZM3BlRFh5MnVwRkczdzN5ZHJh?=
 =?utf-8?B?b2JsUXhFems0UmNOUTBxTHpBM3E3amhySkNJdjFaZ0w5YVpid0I0VUduKzhT?=
 =?utf-8?B?amxDcTBGZ1JBZTc1S2Rsd2JnUGFObVhMdklGRDRrVGNRUkl6Q2svRDJNWGdu?=
 =?utf-8?B?UStUbjA3TnBFS095TE5jTjRlYm4zdDZCUXhvejZ1ZjlmYVNkTDlyUUcrSEZH?=
 =?utf-8?B?a1FZSURBNWFKY1FwMWxZa2N6MTJXcHJOMVRPSVFoSHRMZXpvRDJPZjRzelRp?=
 =?utf-8?B?c1R0dlZyT21zQWZ0aytoWnA4ZWh4djhRYmliRUttc09NSmNUaVZlQmRmZ3Zt?=
 =?utf-8?B?eXJYdmZMRkhGRTFxdHBqdVJnN1ZMWmJVQUNZZlJ3US9tc3FXbE51dGthaGM4?=
 =?utf-8?B?ZlQ3Z24vNlBuZ1RxZGlUS3ZWL3llTEVSeE1TU2F2KzJQcjF5VXE4R2tsRFp1?=
 =?utf-8?B?eWpHWHdpU0dJL1lqVCtjS2x4VTRtUW9EQ0FwSWVpRFRmS1pTcGxrSE5DenBR?=
 =?utf-8?B?dzgwaXVZWTF6OTdNYjJORUNUYmRaY0tqdnBqT1gyaVpEeUVRZy9JQlI0Znhm?=
 =?utf-8?B?SWFpcWtoM0o2cm9na2NHZW5oZ21QaW1CSFZEaXdXRXN5Slc5STB0V0pHTlZT?=
 =?utf-8?B?VzJTR05TdUZ5OVpmbCtmQThJaEFvN3QxSVRJWDNCUHJXOTJCT1FEdXJQN0VC?=
 =?utf-8?B?U3VhNTVab3dBM2lKekRpRlE3SlBjUy9iMFUvWWNNc0pzUmRFTDJJZVMrOXhW?=
 =?utf-8?B?VDJEckxFZC9ZNCtkT2l2S0piMmdtNDk3cnRlRzk4Qlo0NTdqbWhCRmhnUkJk?=
 =?utf-8?B?YXNHcmxxZGs0cnV5NWNPbUlycDBtb3M2djlOVzVVT3d5OGlPb00zZ0dzTGdD?=
 =?utf-8?B?UllsWTU5Qys3c0d0S3FSL3hyanVlZVRZek5pMjBOVUZpWkF3KytVR1dhMHJZ?=
 =?utf-8?B?ZUVEUmx4Y2N6M2s4SmU4elRxMkpBN3dkS0t6SXBHOEpuaG9ibUFmVXAvc2hW?=
 =?utf-8?B?bk4zdWdZVkUvZEhTbUJvaGN3MkYrOFR0bjEvVUNXZCs4YnNITDd1dUY2b2tm?=
 =?utf-8?B?ei9PVDFjM2lWWVpjdUdYZk5iNHBDdzdaem1iVlhlekNzN01URGp3ZnVtNDdF?=
 =?utf-8?B?OFN1dlJXd1hmSUUvdm5kcmNyWGJBaWszQ2YxNjVCSnRhaWwwSXU3eTUvQUNB?=
 =?utf-8?B?OGFkT1BXK0t4M0tFVndPZ0F1T01Hd1ZuUVAxeGZiUGVPV3RxWFI5RWJRL2RJ?=
 =?utf-8?B?cGJOUTlJa3FKTW9RTHlZWmVtNitUb1prRmpOVW9vbFNnbWMrcDVGYTRIajhD?=
 =?utf-8?B?SUdteENseDFMVkMwbUZycVVGS2p5TWJBMm1kREp3K3hIeElacWpTTi9kMW1U?=
 =?utf-8?B?cy8vaFF2T2NSK0prUWFoeEgwSFc5OXpVcTIyOGZYVmRJSDI1eTA3N3V5dUN3?=
 =?utf-8?B?cVpIU0huODN3cHJGMkJza0NJSms1L0FCYmV2bTUzdmhWeU5VcFJYbWNaeE5P?=
 =?utf-8?B?RllPTktqSkMybm0xNExwckdoeFZHbXdnd0FMZmtucW9yNkZxMG5sZz09?=
X-OriginatorOrg: silabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2128d140-f16a-40b1-55a5-08de544ef00d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8205.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 15:58:34.6487
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 54dbd822-5231-4b20-944d-6f4abcd541fb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 80nCSXXlIY/2oN79WE+8jLqxtV0Yf3XKzTfs9HPFknMcz15KzC+f/qKPDRd6lhDPGTK5mgpKUoMgkgkqHp5WZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5097
X-Proofpoint-GUID: V8dFd4jw9NfLAGlB8StkObi1rw188Zw-
X-Authority-Analysis: v=2.4 cv=M6BA6iws c=1 sm=1 tr=0 ts=69690eae cx=c_pps
 a=XGteBKPvimVCBgpwGHxg/w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=M51BFTxLslgA:10
 a=i1IsUcr2s-wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=2AEO0YjSAAAA:8
 a=bWPpxp-jgQ3ylSns5SMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDEyMSBTYWx0ZWRfX71bcovq6bcso
 kq7FIziA4wVqYxGoBaS6EMr6vwhigCpgAV/cDdiRfbibTQYocHCknPWs6C7qXrxNfkD36hUVBxU
 8MX4UMsSq51LdAqEpOSZmQKmCYE8yfQmKXLhJb2MQ4MeqxF26e+sB87/Nl36AYMPxuLVMEkD18W
 raf4CECGYVppPgSkrwVKB3I6W1bt/NRpTeodTq/bafrc90ipFNexEWAhrySZNV1ky6cZqKFhYf3
 Bc0FkomVy7S0Z3Wlbgm9SsDQ+B0DuhCSeIFNwctwjlZz7wn1NMCvVgGvM0AS4tAqbe4EVz6i8O8
 gzgBPVUr4llotfux1quVDSjae+PZHil5irgLb24nCHDEnE+Q5O70kiHy8I+zdN6hQRhVAUblPxj
 TqcgNj9GAmoZXzD/6YGcACEYjmNyk0Nwdp75HrgzpWu5xF3xyBglN+94A7VEii1MB7ogGxbmOEm
 mNiMai/NFxmmHbvlyeA==
X-Proofpoint-ORIG-GUID: V8dFd4jw9NfLAGlB8StkObi1rw188Zw-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_05,2026-01-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 spamscore=0 adultscore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601150121
X-Rspamd-Queue-Id: BBEB0401EB
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
Message-ID-Hash: UOZMSER7REXSWZD5JKPVQBYFSVHABVUT
X-Message-ID-Hash: UOZMSER7REXSWZD5JKPVQBYFSVHABVUT
X-MailFrom: Damien.Riegel@silabs.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Silicon Labs Kernel Team <linux-devel@silabs.com>, =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v2 04/14] greybus: cpc: pack cport ID in Greybus header
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/UOZMSER7REXSWZD5JKPVQBYFSVHABVUT/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

VGFrZSBhZHZhbnRhZ2Ugb2YgdGhlIHBhZGRpbmcgYnl0ZXMgcHJlc2VudCBpbiB0aGUgR3JleWJ1
cyBoZWFkZXIgdG8NCnN0b3JlIHRoZSBDUG9ydCBJRCBhbmQgbWluaXplIG92ZXJoZWFkLiBUaGlz
IHRlY2huaXF1ZSBpcyBhbHJlYWR5IHVzZWQNCmJ5IHRoZSBlczIgZHJpdmVyLg0KDQpTaWduZWQt
b2ZmLWJ5OiBEYW1pZW4gUmnDqWdlbCA8ZGFtaWVuLnJpZWdlbEBzaWxhYnMuY29tPg0KLS0tDQpD
aGFuZ2VzIGluIHYyOg0KICAtIGNsZWFyIHBhZCBieXRlcyB3aGVuIHVucGFja2luZyBDUG9ydCBJ
RA0KDQogZHJpdmVycy9ncmV5YnVzL2NwYy9jcGMuaCAgIHwgIDMgKysrDQogZHJpdmVycy9ncmV5
YnVzL2NwYy9jcG9ydC5jIHwgMzQgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0K
IGRyaXZlcnMvZ3JleWJ1cy9jcGMvaG9zdC5jICB8IDEzICsrKysrKysrKysrKy0NCiBkcml2ZXJz
L2dyZXlidXMvY3BjL2hvc3QuaCAgfCAgMiArLQ0KIDQgZmlsZXMgY2hhbmdlZCwgNTAgaW5zZXJ0
aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3JleWJ1cy9j
cGMvY3BjLmggYi9kcml2ZXJzL2dyZXlidXMvY3BjL2NwYy5oDQppbmRleCBkOWY4ZjYwOTEzYS4u
NjI1OTc5NTc4MTQgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dyZXlidXMvY3BjL2NwYy5oDQorKysg
Yi9kcml2ZXJzL2dyZXlidXMvY3BjL2NwYy5oDQpAQCAtMjQsNiArMjQsOSBAQCBzdHJ1Y3QgY3Bj
X2Nwb3J0IHsNCiBzdHJ1Y3QgY3BjX2Nwb3J0ICpjcGNfY3BvcnRfYWxsb2ModTE2IGNwb3J0X2lk
LCBnZnBfdCBnZnBfbWFzayk7DQogdm9pZCBjcGNfY3BvcnRfcmVsZWFzZShzdHJ1Y3QgY3BjX2Nw
b3J0ICpjcG9ydCk7DQogDQordm9pZCBjcGNfY3BvcnRfcGFjayhzdHJ1Y3QgZ2Jfb3BlcmF0aW9u
X21zZ19oZHIgKmdiX2hkciwgdTE2IGNwb3J0X2lkKTsNCit1MTYgY3BjX2Nwb3J0X3VucGFjayhz
dHJ1Y3QgZ2Jfb3BlcmF0aW9uX21zZ19oZHIgKmdiX2hkcik7DQorDQogaW50IGNwY19jcG9ydF90
cmFuc21pdChzdHJ1Y3QgY3BjX2Nwb3J0ICpjcG9ydCwgc3RydWN0IHNrX2J1ZmYgKnNrYik7DQog
DQogc3RydWN0IGNwY19za2JfY2Igew0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3JleWJ1cy9jcGMv
Y3BvcnQuYyBiL2RyaXZlcnMvZ3JleWJ1cy9jcGMvY3BvcnQuYw0KaW5kZXggZWQwYjhlOGIwZDcu
LjJjNzNkOGU3MjRlIDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncmV5YnVzL2NwYy9jcG9ydC5jDQor
KysgYi9kcml2ZXJzL2dyZXlidXMvY3BjL2Nwb3J0LmMNCkBAIC0zLDYgKzMsOSBAQA0KICAqIENv
cHlyaWdodCAoYykgMjAyNSwgU2lsaWNvbiBMYWJvcmF0b3JpZXMsIEluYy4NCiAgKi8NCiANCisj
aW5jbHVkZSA8bGludXgvdW5hbGlnbmVkLmg+DQorI2luY2x1ZGUgPGxpbnV4L3NrYnVmZi5oPg0K
Kw0KICNpbmNsdWRlICJjcGMuaCINCiAjaW5jbHVkZSAiaG9zdC5oIg0KIA0KQEAgLTMxLDYgKzM0
LDMyIEBAIHZvaWQgY3BjX2Nwb3J0X3JlbGVhc2Uoc3RydWN0IGNwY19jcG9ydCAqY3BvcnQpDQog
CWtmcmVlKGNwb3J0KTsNCiB9DQogDQorLyoqDQorICogY3BjX2Nwb3J0X3BhY2soKSAtIFBhY2sg
Q1BvcnQgSUQgaW50byBHcmV5YnVzIE9wZXJhdGlvbiBNZXNzYWdlIGhlYWRlci4NCisgKiBAZ2Jf
aGRyOiBHcmV5YnVzIG9wZXJhdGlvbiBtZXNzYWdlIGhlYWRlci4NCisgKiBAY3BvcnRfaWQ6IENQ
b3J0IElEIHRvIHBhY2suDQorICovDQordm9pZCBjcGNfY3BvcnRfcGFjayhzdHJ1Y3QgZ2Jfb3Bl
cmF0aW9uX21zZ19oZHIgKmdiX2hkciwgdTE2IGNwb3J0X2lkKQ0KK3sNCisJcHV0X3VuYWxpZ25l
ZF9sZTE2KGNwb3J0X2lkLCBnYl9oZHItPnBhZCk7DQorfQ0KKw0KKy8qKg0KKyAqIGNwY19jcG9y
dF91bnBhY2soKSAtIFVucGFjayBDUG9ydCBJRCBmcm9tIEdyZXlidXMgT3BlcmF0aW9uIE1lc3Nh
Z2UgaGVhZGVyLg0KKyAqIEBnYl9oZHI6IEdyZXlidXMgb3BlcmF0aW9uIG1lc3NhZ2UgaGVhZGVy
Lg0KKyAqDQorICogUmV0dXJuOiBDUG9ydCBJRCBwYWNrZWQgaW4gdGhlIGhlYWRlci4NCisgKi8N
Cit1MTYgY3BjX2Nwb3J0X3VucGFjayhzdHJ1Y3QgZ2Jfb3BlcmF0aW9uX21zZ19oZHIgKmdiX2hk
cikNCit7DQorCXUxNiBjcG9ydF9pZCA9IGdldF91bmFsaWduZWRfbGUxNihnYl9oZHItPnBhZCk7
DQorDQorCS8vIENsZWFyIHBhZGRpbmcgYnl0ZXMNCisJcHV0X3VuYWxpZ25lZF9sZTE2KDAsIGdi
X2hkci0+cGFkKTsNCisNCisJcmV0dXJuIGNwb3J0X2lkOw0KK30NCisNCiAvKioNCiAgKiBjcGNf
Y3BvcnRfdHJhbnNtaXQoKSAtIFRyYW5zbWl0IHNrYiBvdmVyIGNwb3J0Lg0KICAqIEBjcG9ydDog
Y3BvcnQuDQpAQCAtMzksNiArNjgsMTEgQEAgdm9pZCBjcGNfY3BvcnRfcmVsZWFzZShzdHJ1Y3Qg
Y3BjX2Nwb3J0ICpjcG9ydCkNCiBpbnQgY3BjX2Nwb3J0X3RyYW5zbWl0KHN0cnVjdCBjcGNfY3Bv
cnQgKmNwb3J0LCBzdHJ1Y3Qgc2tfYnVmZiAqc2tiKQ0KIHsNCiAJc3RydWN0IGNwY19ob3N0X2Rl
dmljZSAqY3BjX2hkID0gY3BvcnQtPmNwY19oZDsNCisJc3RydWN0IGdiX29wZXJhdGlvbl9tc2df
aGRyICpnYl9oZHI7DQorDQorCS8qIEluamVjdCBjcG9ydCBJRCBpbiBHcmV5YnVzIGhlYWRlciAq
Lw0KKwlnYl9oZHIgPSAoc3RydWN0IGdiX29wZXJhdGlvbl9tc2dfaGRyICopc2tiLT5kYXRhOw0K
KwljcGNfY3BvcnRfcGFjayhnYl9oZHIsIGNwb3J0LT5pZCk7DQogDQogCXJldHVybiBjcGNfaGRf
c2VuZF9za2IoY3BjX2hkLCBza2IpOw0KIH0NCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dyZXlidXMv
Y3BjL2hvc3QuYyBiL2RyaXZlcnMvZ3JleWJ1cy9jcGMvaG9zdC5jDQppbmRleCBlZTA5MGRkMzA5
Ny4uYjA5NmI2MzkxODIgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dyZXlidXMvY3BjL2hvc3QuYw0K
KysrIGIvZHJpdmVycy9ncmV5YnVzL2NwYy9ob3N0LmMNCkBAIC0yMDMsOCArMjAzLDE5IEBAIHZv
aWQgY3BjX2hkX21lc3NhZ2Vfc2VudChzdHJ1Y3Qgc2tfYnVmZiAqc2tiLCBpbnQgc3RhdHVzKQ0K
IH0NCiBFWFBPUlRfU1lNQk9MX0dQTChjcGNfaGRfbWVzc2FnZV9zZW50KTsNCiANCi12b2lkIGNw
Y19oZF9yY3ZkKHN0cnVjdCBjcGNfaG9zdF9kZXZpY2UgKmNwY19oZCwgdTE2IGNwb3J0X2lkLCB1
OCAqZGF0YSwgc2l6ZV90IGxlbmd0aCkNCit2b2lkIGNwY19oZF9yY3ZkKHN0cnVjdCBjcGNfaG9z
dF9kZXZpY2UgKmNwY19oZCwgdTggKmRhdGEsIHNpemVfdCBsZW5ndGgpDQogew0KKwlzdHJ1Y3Qg
Z2Jfb3BlcmF0aW9uX21zZ19oZHIgKmdiX2hkcjsNCisJdTE2IGNwb3J0X2lkOw0KKw0KKwkvKiBQ
cmV2ZW50IGFuIG91dC1vZi1ib3VuZCBhY2Nlc3MgaWYgY2FsbGVkIHdpdGggbm9uLXNlbnNpY2Fs
IHBhcmFtZXRlcnMuICovDQorCWlmICghZGF0YSB8fCBsZW5ndGggPCBzaXplb2YoKmdiX2hkcikp
DQorCQlyZXR1cm47DQorDQorCS8qIFJldHJpZXZlIGNwb3J0IElEIHRoYXQgd2FzIHBhY2tlZCBp
biBHcmV5YnVzIGhlYWRlciAqLw0KKwlnYl9oZHIgPSAoc3RydWN0IGdiX29wZXJhdGlvbl9tc2df
aGRyICopZGF0YTsNCisJY3BvcnRfaWQgPSBjcGNfY3BvcnRfdW5wYWNrKGdiX2hkcik7DQorDQog
CWdyZXlidXNfZGF0YV9yY3ZkKGNwY19oZC0+Z2JfaGQsIGNwb3J0X2lkLCBkYXRhLCBsZW5ndGgp
Ow0KIH0NCiBFWFBPUlRfU1lNQk9MX0dQTChjcGNfaGRfcmN2ZCk7DQpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncmV5YnVzL2NwYy9ob3N0LmggYi9kcml2ZXJzL2dyZXlidXMvY3BjL2hvc3QuaA0KaW5k
ZXggMTkxYjVlMzk0YTYuLjJlNTY4YmFjNDRlIDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncmV5YnVz
L2NwYy9ob3N0LmgNCisrKyBiL2RyaXZlcnMvZ3JleWJ1cy9jcGMvaG9zdC5oDQpAQCAtNDUsNyAr
NDUsNyBAQCBzdHJ1Y3QgY3BjX2hvc3RfZGV2aWNlICpjcGNfaGRfY3JlYXRlKHN0cnVjdCBjcGNf
aGRfZHJpdmVyICpkcml2ZXIsIHN0cnVjdCBkZXZpYw0KIGludCBjcGNfaGRfYWRkKHN0cnVjdCBj
cGNfaG9zdF9kZXZpY2UgKmNwY19oZCk7DQogdm9pZCBjcGNfaGRfcHV0KHN0cnVjdCBjcGNfaG9z
dF9kZXZpY2UgKmNwY19oZCk7DQogdm9pZCBjcGNfaGRfZGVsKHN0cnVjdCBjcGNfaG9zdF9kZXZp
Y2UgKmNwY19oZCk7DQotdm9pZCBjcGNfaGRfcmN2ZChzdHJ1Y3QgY3BjX2hvc3RfZGV2aWNlICpj
cGNfaGQsIHUxNiBjcG9ydF9pZCwgdTggKmRhdGEsIHNpemVfdCBsZW5ndGgpOw0KK3ZvaWQgY3Bj
X2hkX3JjdmQoc3RydWN0IGNwY19ob3N0X2RldmljZSAqY3BjX2hkLCB1OCAqZGF0YSwgc2l6ZV90
IGxlbmd0aCk7DQogdm9pZCBjcGNfaGRfbWVzc2FnZV9zZW50KHN0cnVjdCBza19idWZmICpza2Is
IGludCBzdGF0dXMpOw0KIA0KIGludCBjcGNfaGRfc2VuZF9za2Ioc3RydWN0IGNwY19ob3N0X2Rl
dmljZSAqY3BjX2hkLCBzdHJ1Y3Qgc2tfYnVmZiAqc2tiKTsNCi0tIA0KMi41Mi4wDQoNCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmdyZXlidXMtZGV2IG1h
aWxpbmcgbGlzdCAtLSBncmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3JnClRvIHVuc3Vic2NyaWJl
IHNlbmQgYW4gZW1haWwgdG8gZ3JleWJ1cy1kZXYtbGVhdmVAbGlzdHMubGluYXJvLm9yZwo=
