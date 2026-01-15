Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id BC570D290D5
	for <lists+greybus-dev@lfdr.de>; Thu, 15 Jan 2026 23:37:53 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id A8A1D401C1
	for <lists+greybus-dev@lfdr.de>; Thu, 15 Jan 2026 22:37:52 +0000 (UTC)
Received: from mx0a-0024c301.pphosted.com (mx0a-0024c301.pphosted.com [148.163.149.154])
	by lists.linaro.org (Postfix) with ESMTPS id BD7FB40160
	for <greybus-dev@lists.linaro.org>; Thu, 15 Jan 2026 22:34:45 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=silabs.com header.s=pps12202023 header.b="WAZEAfr/";
	dkim=pass header.d=silabs.com header.s=selector1 header.b=Op9p6sZD;
	spf=pass (lists.linaro.org: domain of Jerome.Pouiller@silabs.com designates 148.163.149.154 as permitted sender) smtp.mailfrom=Jerome.Pouiller@silabs.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1");
	dmarc=pass (policy=reject) header.from=silabs.com
Received: from pps.filterd (m0101743.ppops.net [127.0.0.1])
	by mx0a-0024c301.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60FFjDcH816850;
	Thu, 15 Jan 2026 16:34:42 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps12202023;
	 bh=1d9bJYSPbzNlR7WKnyxMAn7V5+xTafwWB+lgtPyfOaA=; b=WAZEAfr/SfJO
	277w34M+5p3OB10CI7+0V1360XvaSj0Fu7G/3qnedJ8OBMI/24TJ825c6KWaoh2C
	22fnok2Z5paSbWfSbUv6Ww32kZnMRDc7oe3Rg8GRxlPTYuEXmGpwwaqo067m3MOS
	Ml3J357iinXnOS3YKMC9+wE00FjiZMD6ignJrdX39NZcFxWd4l1y1/GVf/jnj8ZO
	qBpaQgNFDN0C7ZZWuXdSa+Is1KrttPur3SR810nljsSu9f2JT2Tn+Unt8lfc3IBc
	dli1x4meynw2IKUoZF43egCaUNA9B1Aew0gOzRSe7JJost75Eq1Bdww5Io6os4Ln
	XOZo3ifYiQ==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11022129.outbound.protection.outlook.com [40.107.209.129])
	by mx0a-0024c301.pphosted.com (PPS) with ESMTPS id 4bq35hrtyr-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 15 Jan 2026 16:34:41 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VewC1j8OooC8X1wkV8zNyRYK/jgRZmlgHukfPLH+F1xFHyoQggbOmz98OdSKMyUnVTzt1iHK+6V/5nVhBlEIK0SxiqDcgGthh7QUBttt/BFwjGtD9qTNexE5rLBGhyeQ1062q9JkqDCLqnGdmEeEyrP+7GhumrqKBiIP9hcDRdL8O8HJ7M6MIawPEU7FZQ/oYMm4/W1M0Tuor6b4FkigQTwJfEAw2Ip9deBWa8d0izaM7b2CTSBeBzTHXKsg/YDpphBP9CGQXJDpOzpfEQBe+mEQ91ZdsTnBL2XI/9V1fRCKccV8zwRHOzYHTGZsV65VQSbayMp4O6pileVbOvkn8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1d9bJYSPbzNlR7WKnyxMAn7V5+xTafwWB+lgtPyfOaA=;
 b=Crhb/DMPEXoPhAGhhTn0yGsLpWmEYQPp65GaOHJpQ8GZsJAjy/2Y9YoZTkUDaD4GOjBqp375/Lc28FRVnfFVP5uG3Vjs72lafw2N2UiEz/+hTRfsL4uLRMtToQNjNBXft71u2QYsCMte1KyTYLcvxR+QlY0PMkrftOrs8T5F+knSzzwdOW1lLs79enX42LfB57TEDtybuGPbsQrJTMV5QvHXCWfBlv0PXEBagYYvb3zU/aJiz2rASqjdVwSvFWeQ7WOvmRB5gIcs04cHP0Ap6itIWUJlD0t0+hVyshFrDd2pFDhXTl35WiTzMR4PcsZftsXlA3/38n2KQixfI5Bo5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silabs.com; dmarc=pass action=none header.from=silabs.com;
 dkim=pass header.d=silabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1d9bJYSPbzNlR7WKnyxMAn7V5+xTafwWB+lgtPyfOaA=;
 b=Op9p6sZDpYi+R7uSB1hGNbLLikV8xygW1m9xspktjJIwScHMSQaM7wYg1GPsGMYeupGoLj1IXTWpww79QeN7PbgvfL0tTAEdAimEpT6GYEe5dU0oHXeYCIwhpFlkMQpofMQITl5vdqSFXTuxo9gHgO7BggbessWAhxZcnbZ65c4=
Received: from IA1PR11MB7773.namprd11.prod.outlook.com (2603:10b6:208:3f0::21)
 by MW4PR11MB5870.namprd11.prod.outlook.com (2603:10b6:303:187::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Thu, 15 Jan
 2026 22:34:38 +0000
Received: from IA1PR11MB7773.namprd11.prod.outlook.com
 ([fe80::acd3:fd18:5809:64c4]) by IA1PR11MB7773.namprd11.prod.outlook.com
 ([fe80::acd3:fd18:5809:64c4%3]) with mapi id 15.20.9520.005; Thu, 15 Jan 2026
 22:34:38 +0000
From: =?UTF-8?B?SsOpcsO0bWU=?= Pouiller <jerome.pouiller@silabs.com>
To: greybus-dev@lists.linaro.org, Johan Hovold <johan@kernel.org>,
        Alex Elder <elder@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org,
        Damien =?UTF-8?B?UmnDqWdlbA==?= <damien.riegel@silabs.com>
Date: Thu, 15 Jan 2026 23:34:34 +0100
Message-ID: <7976899.0VBMTVartN@nb0018864>
Organization: Silicon Labs
In-Reply-To: <20260115155808.36102-15-damien.riegel@silabs.com>
References: 
 <20260115155808.36102-1-damien.riegel@silabs.com>
 <20260115155808.36102-15-damien.riegel@silabs.com>
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: PA7P264CA0532.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:3db::6) To IA1PR11MB7773.namprd11.prod.outlook.com
 (2603:10b6:208:3f0::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7773:EE_|MW4PR11MB5870:EE_
X-MS-Office365-Filtering-Correlation-Id: a510048d-9f8f-4f83-32ef-08de5486445f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|366016|10070799003|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?bGIyQ241eFFVZWdvQ0tTMEFvSDM5eVBIQVJoRXpHSkw0MFlibjgwL1hQWDBY?=
 =?utf-8?B?amhOZHdVSGtWL0c4bER4bk95Z3lCZHQ3LzkyajRZSEJqMkVhM1RwWThwYnNB?=
 =?utf-8?B?bCtJMU43ZjdYSHJFQVZHWjhPdkF1eEN1VHRFZ1pJb1IrY3A1SURwN1gyQXhx?=
 =?utf-8?B?bHZhang2SEVja29aOHF3L2kzZWJxeWRiLzJsbkxKMEVZRGxVTzJ1YTZ3UVdj?=
 =?utf-8?B?Sk81SkppV0phQWpETjhlcmxRUjg3blNSYlJHWmZuR3F5ckxGSDlFVjRBL01m?=
 =?utf-8?B?Q2VWRFVJSDVTRmgxUzZSaGxyNTk3QkhXZ2dLZUE3bXVDQmp5QzFOZkV4dG95?=
 =?utf-8?B?UktpSEVVTGVuTVR4UUJMOWI4UEI2MW9qV3JyRHpUODhNWktaajJQNG9FVmU2?=
 =?utf-8?B?RVdqQktKVkxQYU90bTBpaG53bThpOVV2b1dyL0xUSm9hNnRnK2RHbkxXT1ow?=
 =?utf-8?B?RElIRzdFVFBQZlpWc2o0OEpXcS93NlZjNXJSRExVOUd2Wjl6WHpEYWJtcDJV?=
 =?utf-8?B?REM1NmRPU0xRWXE4ZDU5bHJJUEo3c1N4L04wRno1V3BRRUdrVng5UTlzbGhS?=
 =?utf-8?B?WW9VNlVHUUZRQS84MmRtT2xWcVVEU3BDSS85TUlVN3NrWnNkR2dzUWNFZnh0?=
 =?utf-8?B?Ni9pK1FRaGNXUFVWcjJPaDUrTStmeXhKb1hIYTY1Q2VRTktIaDFpUnp2SUVS?=
 =?utf-8?B?NmJ6b3JLeCthaUFmaWs2V1gzb0VWZGY4a2dmU3NtWFlSOW9iTlpObytCT2lW?=
 =?utf-8?B?MVdXTi9HenBmR0k5cFJIb1JFaUJqcFpYTS85V3lEVENZaXQ2eit0bzcwaUhk?=
 =?utf-8?B?cUpSekswQkxDVko2WVB1Q0g1YWwwSGM5M3dKNXJPbXUyZ1lTWGgvalVrZWhY?=
 =?utf-8?B?U1FBS2NXY1JzbXNCeGRMZUdxTlZtbHRaQVorckV4QkY3YVN3K3ZmNlNQckNI?=
 =?utf-8?B?aHJMQVFtR2xOWXQvajdqbGVBYmxVcTE4MWVaWjNrN1hINjBwbGN4d0xFNWVE?=
 =?utf-8?B?bnd5S2VKenZORHVBNyt5Um8ybS92Q0VBQVRkdWpLemJSdUU5NVd0VDFiVE53?=
 =?utf-8?B?WjFrTFUrL0ozNGIrVDkxRk5SWEtTSjRNZ3dJWlBlbTgxMkxQaDR4OHFVM3lF?=
 =?utf-8?B?V2hyaDFLVVBRYTZ2V3czMWc2NFNYczIyTEd4WFBiYjBjc0NkSVIyR01oRzVp?=
 =?utf-8?B?WExpei9LeVVoRHNiYlFmQkNuSndsb0pycEJjL3lRQ3pxSmlJeWRrRzkwU2tu?=
 =?utf-8?B?OElvamRQUFNIUlRFd0NaaElYbGp6eENIU2RFYmF1UlVaOGFHNTRRMWRJM1Np?=
 =?utf-8?B?dy92L2lMSktOT2JNN2dZekROUWFzS04veFpxR3RacTlBeWhhU1k1cUVRNUFG?=
 =?utf-8?B?MTNpak5EdFppZWdtOGZQeVpsNXZ1OUJPbmFoeE1SNG80Mzh2TVdSRXNiMzFa?=
 =?utf-8?B?N2ZWaEpGeGtTUDluaXBMWW94MjdBTEZCQVV0Q3U4NStoTlNtekQxdytEYmtw?=
 =?utf-8?B?QTN4VlNhMmN2dE9ldVlHQXR6eFliWXVEMnMvbHhHQVo5Yjc0Q2RRWFNvQWtI?=
 =?utf-8?B?a3NHVWpBZHBZNzJnTCtZdVltRTloMERCbDcvM2NyRUdkYm5XR21GOGdPNEda?=
 =?utf-8?B?TFFYSGc0QzJNeU1HSllIMS9MWHdUVzFkUURQbmUvNUYzQ2FwL1dkY3BSay9u?=
 =?utf-8?B?Q3hiVE41bjFSMHF3eTJmVUQyY3J3K3V6bHhzZ2RUWERJclNIUVp2bndNUEFG?=
 =?utf-8?B?K1V6RjBxZVRqRi92S0M3ZXBmcElmWlpJdVVpN3JXNUxEWWRkalJaK0V4VExW?=
 =?utf-8?B?TW5LVTFOYVVtT3g4VkVZRzNMZnBKbE8zNGRLUEFBREN4akpHaDl0ZmhOUks2?=
 =?utf-8?B?cHIwaGlFdHpXZTl4b3ZDN0lTUkJtazE0WUlTaW5kS3ZWcnBhYWgzSEVHZTNr?=
 =?utf-8?B?NDNkTDc3dU96eW41TUFYYmVWRUJ5T0V5OUdjS1NoRkdxbStiVDR0UHAxdm5l?=
 =?utf-8?B?akVlbUo4Q0hINitlOXBsa0Q5dEpQejlDL2I0M3VYcWtzd1U5eGtMWFpIRVd2?=
 =?utf-8?B?azRWb0RjcFVwcVFtQW44Y0FhZnJJV1VzUm9kNWVJdVNxZ0YwUUVraFZTREx5?=
 =?utf-8?Q?kIAM=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7773.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(10070799003)(1800799024)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZEFMRWpITnhMemo1UGxnK0VpeEorWm41Q1hnN2Z6U3VQT2c4QzZZMXlxU2xJ?=
 =?utf-8?B?UzlJdERscmdqM1BkVUlCaEk1TWl2Z0JkN3FyNHowUjZIRmdNV2wzWW9oakht?=
 =?utf-8?B?VTlrVy9GeTk2bS9qMDYxV3ZoRndoT0NzN1hxK1pRYmxSbkxTbm1oQXIrSnJs?=
 =?utf-8?B?cE00eXhUUVlGOS82emJSZGxSdnk3Y2FwK1VWWVdIb1Q1eVRzSXZ1dTJjOXFB?=
 =?utf-8?B?V0VIcUNYdVdYR1UvZTNTRlpNR2RQK1lCOS8vei9mSXBQZXcrZVBpakkrdksz?=
 =?utf-8?B?MDBmSTBwVUtBZnYrWnZWRlUyWGlGNThqUmMyZ1RISFlLTWhoR2JLR3J6YmRk?=
 =?utf-8?B?TzRuQnh2UkcwZFlNQmdMVWFCNUxISWE5eDRXVmNNZkJCaW5Yc3N2eEpmbkRm?=
 =?utf-8?B?ZWtDSTBvYnFOOGtqZ0hSS29Ed1pZczV0a3hVTnFZTXJiaWtDNDNiVmlrVXBp?=
 =?utf-8?B?RlhndUNCa2NDTU1uRWp2NHNzaUFLUjY3bHpoVDlBUFdIUUFpOXYzbFk0cStS?=
 =?utf-8?B?YS9YcGt3VWhJbFcxU1Q4VThyTHQybVd4d0tST3dXa0dCTElHS1RsVXY3RUdD?=
 =?utf-8?B?ZlVLbkpBQU1tQzFkaUlVdWhCZjJpWXlKV1VRMHFTeDlad2VOYWZxRGlqYU9h?=
 =?utf-8?B?KzNIZ1VDT0R0L2xpcnlOUnBtcDBDK0FnRnJkUkJDWnlQNDI4SDE0MGtHMm04?=
 =?utf-8?B?YnZrYThBWWNRNHFPODd2N3BNSFhFMjNVbG4wUGZiMzFDRmI5ZUlKQ0JibWF0?=
 =?utf-8?B?UW15SUQ2M0tmNGJlc0padUNLTnNWMWhrcTJTUFJ0ZkNkSCtrSEh5YThiSmZD?=
 =?utf-8?B?cFRPVFFaUGRlbitOVE12YnZSQ1pidks3eEJLa2FtalpVTzVHZ2lwU1hCTnU4?=
 =?utf-8?B?SllyeDBFOXl5cWlubm5JQ0Z6b3d5cEVWaFpQMDBWRXd6WXBiSHhkZmI2VklD?=
 =?utf-8?B?aE9lWE53dkxheVR4SW80VWlPM0VXVEFUTkk1VlI5VERPbFU0VmgxYTV5TElm?=
 =?utf-8?B?cSs2dE5TYU5vSnBicWVxTnZvK1JHVWYvOWZUclV6cGhENlRYb0Mra01HSStN?=
 =?utf-8?B?NHJPdHBhK05YSHloWFJFL2FWWWFKWUxrdzhpUDNGbTlKUlpVMWpoRk1rTTVs?=
 =?utf-8?B?RWxRZGl6b29CNFJtYmtHalBDc2hNb2l5U0dZdkJ1YjVCTWs1czNDaVVkTFJT?=
 =?utf-8?B?d28zSlorc3N1MkpTeHJWWjlOVEd2bFRQaEdubUQ2T1JpOStkd01ZbGg0cHdw?=
 =?utf-8?B?VXhoaldBREhrRThSMEtmSC9YM1ZZVGd4a3FOTE9IcXVZcU1HWUdrc0ZaNkY1?=
 =?utf-8?B?dUN4S2xCRTYwYVpHN2FEN2xWU0IyVWNacjVzMDhFd1dwTWxPZkpqcEdNWFFr?=
 =?utf-8?B?SllWMjhpZTV2NTlYM2t2RHNqQjVhRDFhNWNQNUtSZ3B6aVEwNldOWGxaZHdm?=
 =?utf-8?B?VUlDamtaU3Zid1hTNllKOGVZbFJZMzBJRURtUWlWMXlqQ3JwaVVXU3hGY3V5?=
 =?utf-8?B?OS9tLzFycmh0UHNTbmVFVDZBaFBwZ0FjMCt0Q2Mydlk2Q2pzd09qMHdJU3BG?=
 =?utf-8?B?ZEdsWHlMWW5IWEc3bDNKVXFDb1kwM2MvUWRYZmpQdzZNcDRqR3Z3bW5HeHd0?=
 =?utf-8?B?NWJtMXdLeTdLVTVKVzBRTzl4NUlOd2ZNckd5ZmtzMmtvUkpwNCtXbitydUJy?=
 =?utf-8?B?eFdDSlVOK2lrbTI5VzFiSVBnaXBwRHNzYk9WZW5PRXZTajUzWHVUSmVGUjVu?=
 =?utf-8?B?N1RpbURYQ2lNZ2NFRjVaQlNvQzNBbzUzbXJuNzVBQWFpSHRUazVLTkdTbnh2?=
 =?utf-8?B?azVrbHU0NG1UNkZ1WGJtSlVvQ1FqSytzLzRoRis4TWdZTnpySHd4UVlBdFA0?=
 =?utf-8?B?aGNuT2lNQU5BQmtkTFZWWjJSbFZPUnFZdVRrU1M3K2FaWnY4WnZPa3pwcDc1?=
 =?utf-8?B?VCtibnVDRllZeFVDbHZyOE0rN1k4UFZSL1A3MkNxS0k5bitXVldWdUNIdUhp?=
 =?utf-8?B?cUZLcE1hbENzd09BR2hzTzY0andBc1lkSGk0aEtqekc3MUZEdncwS2NwSFpt?=
 =?utf-8?B?RmlnUWVzNUlNZG85YkttZ0xkY0YvU3p0VmlwRkhVa3NOVERMM2o4RGtTNkpE?=
 =?utf-8?B?ajBTZEFkSVBnSVFBMWROS1dQREtMQzduRno2SlFHeCs0T2pXTDJXK1hoZHZj?=
 =?utf-8?B?aVVUQUcwVjFSdnZhUDFyNFdmY2Qyc0g1OUdLdDFlWUtOTERhUmFLYVZpaEhm?=
 =?utf-8?B?SXFCSDhGZWlNT3d5K3ltT2xBVG5SNERqQ3c5SHpPWWY0b1R3bmF6czA2ay82?=
 =?utf-8?B?T01NcFRWV0QvaDYvRzVJTWRIUWl0MG5PdG0xbjBaN2VUU1hmUnIvNkpaQ1Zj?=
 =?utf-8?Q?9r7tF03InSio8sR2vDDvizbUSbfMPakfEdS2D19bSc4mI?=
X-MS-Exchange-AntiSpam-MessageData-1: a+cjf3NmSd1Q/A==
X-OriginatorOrg: silabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a510048d-9f8f-4f83-32ef-08de5486445f
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7773.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 22:34:38.4374
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 54dbd822-5231-4b20-944d-6f4abcd541fb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H5lpX8iLo4pkJKkssyK0RrVo7xKSXHBtTkznAiq2xfGjtuicmYkhQL47NemXdWXeLw/RGfLdQNzsUL8gHsY6SQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5870
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDE3NyBTYWx0ZWRfXwEZ9P4OmXxZo
 nn7WsXkfNdtunAq99NqlgpoTl4wj97DV29gFO1IBMqlqiKvZrwv3HpNP3Hc5/gYJKSr9NRhO40N
 Urqzdu2eRjaqWSenecr5ENbejMfkdI40YqYNY31DrAPhj0p49dwLoUscVAC/dN04EW3ZcSlzQBw
 qBUeMvlVSrrdCsjM+CYxT2+BV/Zv3eK22mgtTKtLXa5F5k4WmJ21UZnZERqytxp9R+GrgL64NC2
 s6Q4HmMeGiRHH9S5SFD1OQpVa0korb27EF57KuM6ZSAwIVfpphYTN98pYCcMz2uFCvnq9Oj/CZ1
 v0WP/E96fzDTQxR3iEECvTyoCFagSZslmPttW1VIteg/Gq7t5GCusRpY0it1M5tMc78xntVsVee
 rwIGA7zjfnfTlb9sb5cuRrIVSa3gAqi9zrr4nCNxmKFy1JTCjyQUkIjKYO4HLPFNf13BGcEwg9P
 CU2F1U3P47+C9cc0KRg==
X-Proofpoint-ORIG-GUID: IrvYmt0I_UoHkGSNjGIZLJWqm2pNNVUx
X-Proofpoint-GUID: IrvYmt0I_UoHkGSNjGIZLJWqm2pNNVUx
X-Authority-Analysis: v=2.4 cv=PcXyRyhd c=1 sm=1 tr=0 ts=69696b81 cx=c_pps
 a=6Bt0GI45FyvFQl6hnU1EVQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=M51BFTxLslgA:10
 a=i1IsUcr2s-wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=2AEO0YjSAAAA:8 a=VwQbUJbxAAAA:8
 a=jKHQODXA2kRhIKoQf8AA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_07,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 phishscore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601150177
X-Rspamd-Queue-Id: BD7FB40160
X-Spamd-Bar: ---
X-Spamd-Result: default: False [-3.83 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MIXED_CHARSET(0.67)[subject];
	DMARC_POLICY_ALLOW(-0.50)[silabs.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:148.163.149.154];
	R_DKIM_ALLOW(-0.20)[silabs.com:s=pps12202023,silabs.com:s=selector1];
	MIME_GOOD(-0.10)[text/plain];
	ASN(0.00)[asn:26211, ipnet:148.163.148.0/22, country:US];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DWL_DNSWL_BLOCKED(0.00)[silabs.com:dkim];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[silabs.com:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-MailFrom: Jerome.Pouiller@silabs.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: DWZTGTHA6D4UHLYHONGYDYRNCXZSPUB5
X-Message-ID-Hash: DWZTGTHA6D4UHLYHONGYDYRNCXZSPUB5
X-Mailman-Approved-At: Thu, 15 Jan 2026 22:37:51 +0000
CC: Silicon Labs Kernel Team <linux-devel@silabs.com>, Gabriel Beaulieu <gabriel.beaulieu@silabs.com>, Damien =?UTF-8?B?UmnDqWdlbA==?= <damien.riegel@silabs.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v2 14/14] greybus: cpc: add CPC SDIO host driver
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/DWZTGTHA6D4UHLYHONGYDYRNCXZSPUB5/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Transfer-Encoding: base64

T24gVGh1cnNkYXkgMTUgSmFudWFyeSAyMDI2IDE2OjU4OjA3IENlbnRyYWwgRXVyb3BlYW4gU3Rh
bmRhcmQgVGltZSBEYW1pZW4gUmnDqWdlbCB3cm90ZToNCj4gRnJvbTogR2FicmllbCBCZWF1bGll
dSA8Z2FicmllbC5iZWF1bGlldUBzaWxhYnMuY29tPg0KPiANCj4gVGhpcyBpbnRyb2R1Y2VzIGEg
bmV3IG1vZHVsZSBnYi1jcGMtc2RpbywgaW4gb3JkZXIgdG8gY29tbXVuaWNhdGUgd2l0aCBhDQo+
IEdyZXlidXMgQ1BDIGRldmljZSBvdmVyIFNESU8uDQo+IA0KPiBNb3N0IG9mIHRoZSBjb21wbGV4
aXR5IHN0ZW1zIGZyb20gYWdncmVnYXRpb246IHBhY2tldHMgYXJlIGFnZ3JlZ2F0ZWQgdG8NCj4g
bWluaW1pemUgdGhlIG51bWJlciBvZiBDTUQ1M3MuIEluIHRoZSBmaXJzdCBibG9jaywgdGhlIGZp
cnN0IGxlMzIgaXMgdGhlDQo+IG51bWJlciBvZiBwYWNrZXRzIGluIHRoaXMgdHJhbnNmZXIuIElt
bWVkaWF0ZWx5IGFmdGVyIHRoYXQgYXJlIGFsbCB0aGUNCj4gcGFja2V0IGhlYWRlcnMgKENQQyAr
IEdyZXlidXMpLiBUaGlzIGxldHMgdGhlIGRldmljZSBwcm9jZXNzIGFsbCB0aGUNCj4gaGVhZGVy
cyBpbiBhIHNpbmdsZSBpbnRlcnJ1cHQsIGFuZCBwcmVwYXJlIHRoZSBBRE1BIGRlc2NyaXB0b3Jz
IGZvciBhbGwNCj4gdGhlIHBheWxvYWRzIGluIG9uZSBnby4NCj4gDQo+IFBheWxvYWRzIHN0YXJ0
IGF0IHRoZSBiZWdpbm5pbmcgb2YgdGhlIHNlY29uZCBibG9jayBhbmQgYXJlIGNvbmNhdGFpbmVk
Lg0KPiBUaGVpciBsZW5ndGhzIG11c3QgYmUgMzItYml0IGFsaWduZWQsIHNvIHRoZSBkcml2ZXIg
dGFrZXMgY2FyZSBvZiBhZGRpbmcNCj4gYW5kIHJlbW92aW5nIHBhZGRpbmcgaWYgbmVjZXNzYXJ5
Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTogR2FicmllbCBCZWF1bGlldSA8Z2FicmllbC5iZWF1bGll
dUBzaWxhYnMuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBEYW1pZW4gUmnDqWdlbCA8ZGFtaWVuLnJp
ZWdlbEBzaWxhYnMuY29tPg0KPiAtLS0NCj4gQ2hhbmdlcyBpbiB2MjoNCj4gICAtIGNoYW5nZSBm
b3JtYXR0aW5nIGZyb20gJWx1IHRvICV6dSB3aGVuIHByaW50aW5nIHNpemVfdCdzDQo+ICAgLSBy
ZW1vdmUgIi8qKiIga2VybmVsLWRvYyBtYXJrZXIgZm9yIHN0YXRpYyBmdW5jdGlvbnMgbm90IGFj
dHVhbGx5DQo+ICAgICB1c2luZyB0aGUga2VybmVsLWRvYyBmb3JtYXQNCj4gICAtIHJlZHVjZSBo
ZWFkZXIgaW5jbHVzaW9uIGxpc3QNCj4gICAtIHVzZSByZXZlcnNlIGNocmlzdG1hcyB0cmVlIHZh
cmlhYmxlIGRlY2xhcmF0aW9ucyBjb25zaXN0ZW50bHkNCj4gICAtIHVwZGF0ZSBhZ2dyZWdhdGlv
biBmdW5jdGlvbnMgdG8gdHJ5IHRvIGJlIG1vcmUgbGVnaWJsZQ0KPiAgIC0gdXNlIGRlZmluZSBp
bnN0ZWFkIG9mIGNvbnN0YW50IHZhbHVlIDB4MEMgZm9yIHRoZSBhZGRyZXNzIHdoZXJlIHRvDQo+
ICAgICByZWFkIHRoZSBudW1iZXIgb2YgYnl0ZXMgdGhlIGRldmljZSB3YW50cyB0byBzZW5kDQo+
ICAgLSByZW1vdmUgcGFkZGluZyBiZXR3ZWVuIGhlYWRlcnMgYW5kIHBheWxvYWRzIHdoZW4gYWdn
cmVnYXRpbmcgcGFja2V0cw0KPiANCj4gIGRyaXZlcnMvZ3JleWJ1cy9jcGMvS2NvbmZpZyAgfCAg
MTIgKw0KPiAgZHJpdmVycy9ncmV5YnVzL2NwYy9NYWtlZmlsZSB8ICAgMyArDQo+ICBkcml2ZXJz
L2dyZXlidXMvY3BjL3NkaW8uYyAgIHwgNTMzICsrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrDQo+ICAzIGZpbGVzIGNoYW5nZWQsIDU0OCBpbnNlcnRpb25zKCspDQo+ICBjcmVhdGUg
bW9kZSAxMDA2NDQgZHJpdmVycy9ncmV5YnVzL2NwYy9zZGlvLmMNCj4gDQo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dyZXlidXMvY3BjL0tjb25maWcgYi9kcml2ZXJzL2dyZXlidXMvY3BjL0tjb25m
aWcNCj4gaW5kZXggYWI5NmZlZGQwZGUuLjgyMjNmNTY3OTVmIDEwMDY0NA0KPiAtLS0gYS9kcml2
ZXJzL2dyZXlidXMvY3BjL0tjb25maWcNCj4gKysrIGIvZHJpdmVycy9ncmV5YnVzL2NwYy9LY29u
ZmlnDQo+IEBAIC04LDMgKzgsMTUgQEAgY29uZmlnIEdSRVlCVVNfQ1BDDQo+ICANCj4gIAkgIFRv
IGNvbXBpbGUgdGhpcyBjb2RlIGFzIGEgbW9kdWxlLCBjaG9zZSBNIGhlcmU6IHRoZSBtb2R1bGUg
d2lsbCBiZQ0KPiAgCSAgY2FsbGVkIGdiLWNwYy5rbw0KPiArDQo+ICtjb25maWcgR1JFWUJVU19D
UENfU0RJTw0KPiArCXRyaXN0YXRlICJHcmV5YnVzIENQQyBvdmVyIFNESU8iDQo+ICsJZGVwZW5k
cyBvbiBHUkVZQlVTX0NQQyAmJiBNTUMNCg0KRG9uJ3QgeW91IHRoaW5rLCB0aGlzIFBSIHNob3Vs
ZCBhbHNvIGJlIHNlbnQgdG8gdGhlIFNESU8gbWFpbnRhaW5lcnMNCihsaW51eC1tbWNAdmdlci5r
ZXJuZWwub3JnKT8NCg0KPiArCWhlbHANCj4gKwkgIFRoaXMgZHJpdmVyIHByb3ZpZGVzIEdyZXli
dXMgQ1BDIGhvc3Qgc3VwcG9ydCBmb3IgZGV2aWNlcw0KPiArCSAgY29ubmVjdGVkIHZpYSBTRElP
IGludGVyZmFjZS4NCg0KRm9yIG5vdywgSSBiZWxpZXZlIG9ubHkgc29tZSBTaWxpY29uIExhYnMg
ZGV2aWNlIHByb3ZpZGUgdGhpcyBpbnRlcmZhY2UuDQpNYXliZSBpdCB3b3VsZCBoZWxwIHRoZSB1
c2VyIHRvIG1lbnRpb24gdGhhdC4NCg0KPiArDQo+ICsJICBUbyBjb21waWxlIHRoaXMgZHJpdmVy
IGFzIGEgbW9kdWxlLCBjaG9vc2UgTSBoZXJlOiB0aGUgbW9kdWxlDQo+ICsJICB3aWxsIGJlIGNh
bGxlZCBnYi1jcGMtc2Rpby4NCj4gKw0KPiArCSAgSWYgdW5zdXJlLCBzYXkgTi4NCg0KWy4uLl0N
Cg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncmV5YnVzL2NwYy9zZGlvLmMgYi9kcml2ZXJzL2dy
ZXlidXMvY3BjL3NkaW8uYw0KPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiBpbmRleCAwMDAwMDAw
MDAwMC4uYWVlYjgzNzhkZWENCj4gLS0tIC9kZXYvbnVsbA0KPiArKysgYi9kcml2ZXJzL2dyZXli
dXMvY3BjL3NkaW8uYw0KPiBAQCAtMCwwICsxLDUzMyBAQA0KPiArLy8gU1BEWC1MaWNlbnNlLUlk
ZW50aWZpZXI6IEdQTC0yLjANCj4gKy8qDQo+ICsgKiBDb3B5cmlnaHQgKGMpIDIwMjUsIFNpbGlj
b24gTGFib3JhdG9yaWVzLCBJbmMuDQo+ICsgKi8NCj4gKw0KPiArI2luY2x1ZGUgPGxpbnV4L2t0
aHJlYWQuaD4NCj4gKyNpbmNsdWRlIDxsaW51eC9tbWMvc2Rpb19mdW5jLmg+DQo+ICsjaW5jbHVk
ZSA8bGludXgvbW1jL3NkaW9faWRzLmg+DQo+ICsjaW5jbHVkZSA8bGludXgvc2tidWZmLmg+DQo+
ICsjaW5jbHVkZSA8bGludXgvd29ya3F1ZXVlLmg+DQo+ICsNCj4gKyNpbmNsdWRlICJjcGMuaCIN
Cj4gKyNpbmNsdWRlICJoZWFkZXIuaCINCj4gKyNpbmNsdWRlICJob3N0LmgiDQo+ICsNCj4gKyNk
ZWZpbmUgR0JfQ1BDX1NESU9fTVNHX1NJWkVfTUFYIDQwOTYNCj4gKyNkZWZpbmUgR0JfQ1BDX1NE
SU9fQkxPQ0tfU0laRSAyNTZVDQoNCldoYXQgaXMgdGhlIHB1cnBvc2Ugb2YgdGhlICJVIj8NCg0K
PiArI2RlZmluZSBHQl9DUENfU0RJT19GSUZPX0FERFIgMA0KPiArI2RlZmluZSBHQl9DUENfU0RJ
T19SWF9CWVRFU19DTlRfQUREUiAweDBDDQoNCkl0IHRvb2sgbWUgYSBiaXQgb2YgdGltZSB0byB1
bmRlcnN0YW5kIHRoZSBtZWFuaW5nIG9mIHRoZXNlIHR3bw0KZGVmaW5pdGlvbnMuIEkgc3VnZ2Vz
dCB0byBzZXBhcmF0ZSB0aGVtIGZyb20gdGhlIG90aGVyIGRlZmluZXMgYW5kDQp1c2UgYSBjb21t
b24gcHJlZml4Og0KDQogICNkZWZpbmUgR0JfQ1BDX1NESU9fQUREUl9GSUZPICAgICAgICAgMHgw
MA0KICAjZGVmaW5lIEdCX0NQQ19TRElPX0FERFJfUlhfQllURVNfQ05UIDB4MGMNCg0KDQo+ICsj
ZGVmaW5lIEdCX0NQQ19TRElPX0FMSUdOTUVOVCA0DQo+ICsjZGVmaW5lIEdCX0NQQ19TRElPX0RF
RkFVTFRfQUdHUkVHQVRJT04gMQ0KDQpUaGlzIG51bWJlciBzZWVtcyBhcmJpdHJhcnkgYW5kIGl0
IHVzZWQgb25seSBvbmNlLiBJIGZlZWwgaXQganVzdCBhZGQNCm9uZSBsYXllciBvZiBpbmRpcmVj
dGlvbiByYXRoZXIgdGhhbiBpbXByb3ZpbmcgdGhlIHJlYWRhYmlsaXR5Lg0KDQo+ICsjZGVmaW5l
IENQQ19GUkFNRV9IRUFERVJfU0laRSAoQ1BDX0hFQURFUl9TSVpFICsgR1JFWUJVU19IRUFERVJf
U0laRSkNCj4gKyNkZWZpbmUgR0JfQ1BDX1NESU9fTUFYX0FHR1JFR0FUSU9OICgoR0JfQ1BDX1NE
SU9fQkxPQ0tfU0laRSAtIHNpemVvZih1MzIpKSAvIENQQ19GUkFNRV9IRUFERVJfU0laRSkNCg0K
T3JwaGFuPw0KDQo+ICsNCg0KWy4uLl0NCg0KPiArc3RhdGljIGludCBnYl9jcGNfc2Rpb193YWtl
X3R4KHN0cnVjdCBjcGNfaG9zdF9kZXZpY2UgKmNwY19oZCkNCj4gK3sNCj4gKwlzdHJ1Y3QgY3Bj
X3NkaW8gKmN0eCA9IGNwY19oZF90b19jcGNfc2RpbyhjcGNfaGQpOw0KPiArDQo+ICsJaWYgKHRl
c3RfYml0KENQQ19TRElPX0ZMQUdfU0hVVERPV04sICZjdHgtPmZsYWdzKSkNCj4gKwkJcmV0dXJu
IDA7DQo+ICsNCj4gKwkvKiBVc2Ugc3lzdGVtIHdvcmtxdWV1ZSBmb3IgVFggcHJvY2Vzc2luZyAq
Lw0KDQpJIHdvbmRlciBpZiB0aGVzZSB0cml2aWFsIGNvbW1lbnRzIGFyZSB1c2VmdWwgb3IgcmF0
aGVyIHBvbGx1dGUgdGhlIGNvZGUuDQoNClsuLi5dDQoNCj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3Qg
c2Rpb19kZXZpY2VfaWQgc2Rpb19pZHNbXSA9IHsNCj4gKyAgICAgICB7DQo+ICsgICAgICAgICAg
ICAgICBTRElPX0RFVklDRSgweDAyOTYsIDB4NTM0NyksDQogICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBeXl5eXl4NCg0KWW91IGhhdmUgdG8gYWRkIGFuIGVudHJ5IGluIGluY2x1ZGUvbGlu
dXgvbW1jL3NkaW9faWRzLmguIEJ1dCwgaXQgc2VlbXMNCnRoZXJlIGlzIGEgY29uZmxpY3Qgd2l0
aCBTRElPX1ZFTkRPUl9JRF9NSUNST0NISVBfV0lMQy4NCg0KPiArICAgICAgIH0sDQo+ICsgICAg
ICAge30sDQo+ICt9Ow0KDQpbLi4uXQ0KDQotLSANCkrDqXLDtG1lIFBvdWlsbGVyDQoNCg0KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1kZXYg
bWFpbGluZyBsaXN0IC0tIGdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKVG8gdW5zdWJzY3Jp
YmUgc2VuZCBhbiBlbWFpbCB0byBncmV5YnVzLWRldi1sZWF2ZUBsaXN0cy5saW5hcm8ub3JnCg==
