Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id E5A83D258DC
	for <lists+greybus-dev@lfdr.de>; Thu, 15 Jan 2026 16:59:41 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id DE865401C9
	for <lists+greybus-dev@lfdr.de>; Thu, 15 Jan 2026 15:59:40 +0000 (UTC)
Received: from mx0b-0024c301.pphosted.com (mx0b-0024c301.pphosted.com [148.163.153.153])
	by lists.linaro.org (Postfix) with ESMTPS id 4CAF14015B
	for <greybus-dev@lists.linaro.org>; Thu, 15 Jan 2026 15:58:50 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=silabs.com header.s=pps12202023 header.b=HKnwJJj2;
	dkim=pass header.d=silabs.com header.s=selector1 header.b=G0BdeEdK;
	spf=pass (lists.linaro.org: domain of Damien.Riegel@silabs.com designates 148.163.153.153 as permitted sender) smtp.mailfrom=Damien.Riegel@silabs.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1");
	dmarc=pass (policy=reject) header.from=silabs.com
Received: from pps.filterd (m0101742.ppops.net [127.0.0.1])
	by mx0a-0024c301.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60FFldAc459480;
	Thu, 15 Jan 2026 09:58:40 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps12202023;
	 bh=Z3tYmmCE3e9kxqbBxw3F/IQQ49I9a8YWpBkKNDAvR2U=; b=HKnwJJj2f1MY
	KeGCgU19mGl0ofpNXyo7i05fU6GfDy3uzCOJMfnM2F7UP1g/KG8GGToGBkWart3T
	ph3S8BeBwmDkIOTVaoYwDVzHqI528ze8sh8xg9gbNEkuv1+kRnjRhudBQ9hrFmpM
	KV6dnBURA6t3OXq3QuXFmoIgZV9ZdCY78ONNSWnlL0qUj1YgQCuALzsN3/K7YdXF
	9SsCtzgbF0Kf9RKLhXD0zVgSKgT4y6GKY76ssHlR8FCzSWiuARr/buykVDZOi3Af
	Z/GXI7yzf2O+9jnjFxZOnIQcTpfZfPqr2h1qj9iiy13aCv9g+x4/pzbDpwbn8U0X
	zWCx9ewGiw==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11020073.outbound.protection.outlook.com [40.93.198.73])
	by mx0a-0024c301.pphosted.com (PPS) with ESMTPS id 4bq36kr0uv-5
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 15 Jan 2026 09:58:39 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ca+RzE4HgKa11IhHR5YRyzk0Q5oN54L/O3jvjEupoR+vkWxOY66RPGo02tlEW+mmJWl6FuEG+NABRHHzLR3eHJSPxwH0zsxT26LV4i4RkVryEyGO6ZcDoImhUTZXMInc42iz0TrLnu0jk3/pznytDePFBIBSeS8LzSMEKyIi2az5qhvWRqPjj1QhFyWC5MQUiye8OxzrZOAiZHUylN43xFG0GnQllWczmW6ZYr1ZbvoLooXRNdBMJER+fA62vxonLISRfjZrxBvzbKPNEZbPzD1wxqTIDWheGkbAIucDiTJY4fKHx+mO02FZTi6qs5r/Eur6BGG70MRCt/wnZtgeAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z3tYmmCE3e9kxqbBxw3F/IQQ49I9a8YWpBkKNDAvR2U=;
 b=N2QDRmdXBvyegz8AGEX+J8cp5cEsDhicQUr7932X4vtWZYV6ii8CgCBlYhQagu7ichvzoBzQyxHPo+svcy08FVh1JiRRDw0YDaX0fBfW99RQ7oGIUlvPLUsFGjbU9HIvTX7ppuYTrBtQCvNai1jevvJv/UikWSZB33sGD7tSfE3gZmzK2VS7jZRA+vas7sGrQ3KiQPbJh3SJGXmq9Xb+crt+baqyl3RP1ncQNyRdPr1UTDET/gNLwqOyHqOEuewMnGVJhbNZlUR4Vq+duS9yhRqPYjVY9fPH/ts5eWlE8piYtJiyB+NgQcSwpZtY/TQZG6+aXgs2rySnKa/XpfpLlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silabs.com; dmarc=pass action=none header.from=silabs.com;
 dkim=pass header.d=silabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z3tYmmCE3e9kxqbBxw3F/IQQ49I9a8YWpBkKNDAvR2U=;
 b=G0BdeEdKypNyUjDuVMQPYLun7rGQC6/MKKsgtP/vir/BGHGRBTjrQXIaeOBnecua9gUBHR1VKEp1o/vcOOZtvhlwinnADUU1JbJlQvTXZGPg96ezm615Z4tf2mdFmSwoq9bM86UKMpjvfHE9GLPNNkW6pMla2tjMsZA2X9e/Ox4=
Received: from DS0PR11MB8205.namprd11.prod.outlook.com (2603:10b6:8:162::17)
 by SA2PR11MB5097.namprd11.prod.outlook.com (2603:10b6:806:11a::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Thu, 15 Jan
 2026 15:58:37 +0000
Received: from DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::2de6:bc88:2af7:3583]) by DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::2de6:bc88:2af7:3583%3]) with mapi id 15.20.9520.005; Thu, 15 Jan 2026
 15:58:37 +0000
From: =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
To: greybus-dev@lists.linaro.org, Johan Hovold <johan@kernel.org>,
        Alex Elder <elder@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org
Date: Thu, 15 Jan 2026 10:58:01 -0500
Message-ID: <20260115155808.36102-9-damien.riegel@silabs.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260115155808.36102-1-damien.riegel@silabs.com>
References: <20260115155808.36102-1-damien.riegel@silabs.com>
X-ClientProxiedBy: YQZPR01CA0025.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:86::22) To DS0PR11MB8205.namprd11.prod.outlook.com
 (2603:10b6:8:162::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8205:EE_|SA2PR11MB5097:EE_
X-MS-Office365-Filtering-Correlation-Id: 2383163a-08b5-4c0a-9b14-08de544ef1f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?U1lTN3BwUGh2UkNVZEpqRVd0aVM3VWt0T1BGdWlVL0F5Mm5MQ210OUw3ZFMz?=
 =?utf-8?B?cThWNkdmSjZyU0tPVjVrcU9VZ3J3OXIrdFlqbHpsRHlXMklWN1c5M25mTGNU?=
 =?utf-8?B?OWZqQVhkMDBobW0wSWxNNkxDRytvM0pJWEFhOVFFdW9pbW5YOEkvK0VzeFNn?=
 =?utf-8?B?SmNsbmdSeWlUTWtWNEpNbm9TL1BrdGFZZVN1NGZxSlQ4QVovTmJxaytJVndE?=
 =?utf-8?B?Y3NPNHNTWkl2amJJSDFrTThkSWdPNHVSbzNPUUNyR1dENk5ucEliN2FxUjZZ?=
 =?utf-8?B?YnFkZ29tUUNSNlpFR3p2U05mUnMwU2JXbnh0NDZ2Y2c2dzRIVzk3WmN3ZDVL?=
 =?utf-8?B?VlJXYTVlL1J2eWszcTV2MHU1TDBFK1Q0U2hKNG5CUitVWUZTV2RvTVNRQzli?=
 =?utf-8?B?V2VyTGt6NHgzQmd2N2Z3VExtUWN6Qmt6K09TM2dkcjNzbGthWkQyVWo3L3hN?=
 =?utf-8?B?VDU2NCtYKzdFZkRNcUpmUmhrTzljSlVjVi9MSi8rWUZsTzFqeHhXVkpsYW10?=
 =?utf-8?B?OFhXL0hNNDlDN3lkSysvZ1lJQW9iTjFnNzljSC9HNEJ1ZWRnY096aVBnTzR3?=
 =?utf-8?B?VC8rQ2pmTTNYUGt3WmlrbmRLaFhrY0ZUdUcrbVRwTTAyamRMM3B3WlRXaGVM?=
 =?utf-8?B?cHhoOFBIU0VyeTdiT0xTSGpkdlppdmJKektTeXVLdWhXSEVCOGlGMkhkeDVp?=
 =?utf-8?B?SjZHcVFDcXN2ZnNFUTJ3bFkwbS9Pa2l4WGZFUkk1UnZLSjVOT0JMMVMxbEpB?=
 =?utf-8?B?QXBoRFpaaVA5OE96Zy9xUDJMTENpWGgrb3pLclRtaEZxb0ZwR1ZhbXcvNUFh?=
 =?utf-8?B?RTBnSFFYaE81bjUrbis0c3E3bnFTRFkyV3VGeHhDK3VBclRITnhpMXdnQUor?=
 =?utf-8?B?UTFndmtxRFhjTk5RZnNVUnhXcUxReTNLSnp4elJ3bVhYbkNOYWxuME1jU2p2?=
 =?utf-8?B?THBGK3dMSmNmcjRhUVFhd3VyVldwVlBjbThXanJvelhYaHFYdmVvWmozWGNa?=
 =?utf-8?B?WWxzckw5MDM0Ujc5Sm8yNkJ4T0FGanBDbWZVR0dnMG41bGFmYW1pSHF0aC9u?=
 =?utf-8?B?dlE4R0ZQdFlINmR0SlpoNGw3dFkybncwRWJhQjlYTHpDMWZPVnJKMzJ6Z1Z6?=
 =?utf-8?B?TzY3aHltVW92YWxlWnUxQ2N1YlpmSW5sS0tlVjV6b3U5UU9rOTk4VmVqRWxJ?=
 =?utf-8?B?VGdCQ0g4YTNuNFRJaFIvdnErVTZIL0pDaFNoLzhUc2JZOXFmRWJIMGRsbmpv?=
 =?utf-8?B?cUYwaTUrZEFUdTdJWSs4VVJCWHo4ZkdSTXVqdlNGWVduVXVCTmZYSFVJeDdD?=
 =?utf-8?B?UXZrWlJLNG1hK3MyVU9SSmYxVnM2WVQ4Q1g1VWkrUDBPNFVES2RKamtLQjQw?=
 =?utf-8?B?RmorN1dBNDNjT20vWGp0b1ZlMFMrRE1CbTVVV3p4MndJNDltTUg2ZGxlMGV6?=
 =?utf-8?B?eDJCSVJvNXNKVm11MG5GeVVBR2Q1WkY0K2k1Q0NVR3dxLy9RT0lsMnhST3Va?=
 =?utf-8?B?ZjExelNDOE4wb0ZuK0h2M2FxTkwwb3ZMVDZGOXRWM2ZsdlpHNGVYcXE4TnJY?=
 =?utf-8?B?eVJQdlJVUFFmeGFxa1V1RHV3WUFPaTVzMXl6OVN1L3FoSEhEOXhYWW5VeDVV?=
 =?utf-8?B?akczaEUxUDcrcUxkRFdTdzVjWjdsMEVsMG91Z1J5cHRnYkZmSzhtZjFITDNS?=
 =?utf-8?B?dC8xVkdnd0VqKzJ6RWxXdXNmMlNyVmhPbHl6Y20yS1hQbzNPN0treXVDR2Q2?=
 =?utf-8?B?bzBuNWRaaEdTdmVqbGxqcE1ERDdxSmhqWjdJaGJOQXJhNWFhOVFJb0RxMjNW?=
 =?utf-8?B?amJqSGhoazBpTGlFVlFyTDFQQ3k2ekl5VEhFV25JZFBDTVpjMUNzSitLTGFH?=
 =?utf-8?B?S3Y3QnN1djR4RS9McnliVTdUWDRRSVplMFVJcnI4Z0NXcktTQkFMRll2WWhm?=
 =?utf-8?B?MWFZSENVL0YwZ1ZmazZJRDNoL1FBSVkrWVVwRTAycVkzQWJobnh3RjI4c0lD?=
 =?utf-8?B?cEpxM1dKYlA5NkxjRkxTcVovM29iUGFIdis2WDFzRHc2cjBaV2lteUhxSGFq?=
 =?utf-8?B?M3NHOThYSGRza1d6aFBKNk43c0didXIwcmQ5RWN2VDV4QXZ2Ukh2YnRsWFBl?=
 =?utf-8?B?c2h6RXA5R2YzeGtnSnZXaHpKOVFZQjR4TmJNRDk3bFlnZFNtTjFvNlBEbnBh?=
 =?utf-8?Q?RkPOBK8W1722bzkx6UEm7b4=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8205.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?YVM3U1JzWmJqbmhpM2h4Qmw3U0t2UlJiaGhPcXcyV3E5NlhmTXJBN0ZYcDJr?=
 =?utf-8?B?UVVNZ3pTemM0OGMrVGtXWFFaekc0TlhyNE00dkZ0OXpJOWxxQ1IzcWQ0dUZZ?=
 =?utf-8?B?Wmo4ZnI0ci91RnBEOFdSbjRTTXVQWDFjOGdpWnc0NUxBZ3U2NHZMWUtVNzM0?=
 =?utf-8?B?WnRtRkZKbEhTNFpmMTVqQTJWUUQ1OTVVZnRGVE52QU9MbjdjaVpueHpRRFZG?=
 =?utf-8?B?cmc4ZEt5Mm5qVnJnSHlqaUtDT0Y5ekU2RVZWOXBtTWtSUWJtZGxPb3dTUVdD?=
 =?utf-8?B?dElBM2FjZlVLM0NhQW85VHdJQVE0ZkxLaUZ6L0FWNDhTM3M5eVRvN1VCVnQ5?=
 =?utf-8?B?QkJsTUM2d2xQSDFPTVJyNlpmeXBDbkhFRG40RFRVUU9WOHhjTndoQ3ppTVVU?=
 =?utf-8?B?M240T0N6WWt1MWFmK0RtdXp6dkpqQVFNUHJXNzhYb1RVcWd6cUhLLzdtRUY5?=
 =?utf-8?B?RDVlci91QXhnMmg1TEU0dmgzOU9MKytpUGJPUXUzUmVOZS9CZitNNzNmVUhr?=
 =?utf-8?B?aDN1aFFEc09QMXQxWFdSVnlyYWJZZTVkT1cxcHhGZ2g1Q0MxV3hudmMyZ3FJ?=
 =?utf-8?B?VmRxYW16ZTUybkVDazhGZ0thQndCV3doT254WDRUTmlhUlRzVW1oLzkybGRB?=
 =?utf-8?B?Y1MrUXV3eTN1cVlGYldTdWVjdFhScUd6Zm9vc1lMU3FnbmZjaTlIaTVUbzY2?=
 =?utf-8?B?bGR2d0xZS0ZvWHZkZkFJYmg3TzZuSktzVXdLSExoRkU3RUtKcFA2UkI1eTlD?=
 =?utf-8?B?VG9iS0N4RnZMUmh0WnFWOHcwVVNvaTh5MXoxbkJWNDNqd0lrWkdaNkx5L2sy?=
 =?utf-8?B?VkFZVVgzaTBray8zaWU5eWkxdmFXdkZ0elJoQXBMNHdodE5mSFJicldiL0hS?=
 =?utf-8?B?VzNuTVBHV1pPSGxMbUgwN1VpaDFKYzNTTVJZZXQrbTFvRGlleXNSVmVnbTZ4?=
 =?utf-8?B?WW11NlUvVnVRMW1WTXhEM0JGNVpwSDNaOVB3eUhsVjNDMTEzbkNjOHUvMGhz?=
 =?utf-8?B?djA0L3o4UkdOdlRtc3cwekRHTHBMRThnbWxWNGxVTG5EaktGRlppbkxqZUZS?=
 =?utf-8?B?YW1tLzY4dVlvVWFZT0ovelovNEIwVUpnY29ZZlU4dGZ2c3ZKODl3dS9rUklp?=
 =?utf-8?B?dUVpVnl0Qk5JOElrTEptWmxhMVlyVDlZMTNIaGhRY1VsOTJ6bm9veVFNZExr?=
 =?utf-8?B?Nk82djFxNWhhbU50ZzFlWkYwMVFLUDJwU3d1Nnlxa0VpQXUzRW5ON2NKUTBJ?=
 =?utf-8?B?WHVKYTErU2UxeFFDaVFjZ2NjMTFjU1RiNExMdXlzVWRTOFpXT2RrUlJQQTZQ?=
 =?utf-8?B?TnZJSjhPcitFcmoyRytxVU5RWVhGbGZ4TzhSZVN3c1ovNUVNWnk4WUNVeTdS?=
 =?utf-8?B?S3Fkb2paT0dsSEpmQ1FuYU9RZ0dzOENlRlRWd20yZ0pxblhuQzlCWXZWc2lY?=
 =?utf-8?B?dUdGR1VjVVE3SGxrL1A4YStkbWowMzkycTVUMnNldUkvU1c0YVN0K0Jnc2Ft?=
 =?utf-8?B?a2swUHJmWDlXOUNkQ2FlbmUrMjMzcFF3QWNsVGJ5R0xUZ2VDOSs0QWZsYjRj?=
 =?utf-8?B?U0Z2SmxFSEVVd3Y3RDlENkVIYXpSc2ZPeDlGMkJwOGx6MzdxUzFaNkhKTnYx?=
 =?utf-8?B?dUxyOXE4YnhXdjdjcmhybVE5UmRjL3cvWUZ0UTNjS09HODBKRkpRMVRQUWM0?=
 =?utf-8?B?c01Ma1VwT3NlWlU1Qy80ZldobVBJRi8rUU1DVzQvangxSzV6bjFRdkJ0Nkpn?=
 =?utf-8?B?ZnNGWUo4YndqMVNSU01qU3R2bEhyNFpsdGFjTGhmSEdTYlNYSFVDZEVOazIy?=
 =?utf-8?B?K2ZHQjlWMGZMNE0zb2Z6V0ovR2pQUjkyL2I5YWhnUllxU05uQUVNUVR6Z0pW?=
 =?utf-8?B?MmhRWCtGUUpNTE9mY3hKNWk1VzVveGtVeEFYbTk1NmUvQnNoZ095ZFc0YVNv?=
 =?utf-8?B?L2V3UlppTkpzWmF3ZGlGNmNtb29IbTZPTTZtaTR3MzZwOEovVU15QnY0VFlB?=
 =?utf-8?B?aGxJRHk4VTd1M1ZYSlZJbFlUdU1kNVZYVXN1T2VtcjcrY0hNVnNmb1dKQVVP?=
 =?utf-8?B?V0hxUFJnc3BVQ1JxMUU4M1FVQlBGSjZtbE9BeTZQSGdBZVUvZm5TNjBseFBx?=
 =?utf-8?B?WmFRSlpVU1pncE1JL0YxcTRMYVVtcUY1cjFFdHZLOHZZMVI0cGhKNXljbTQ0?=
 =?utf-8?B?c09uNDNGTG5jTERUQjBRcmF6QXhIZ0NRR2o2L2lOUzY2NW5mcjh4VCs1ais2?=
 =?utf-8?B?dWx4UjYxRkdMTlNxL1ZOQTRKYkNsUnNRYXRsekxWdkdNV1k3THJPazNpTDJK?=
 =?utf-8?B?OERjb3pRUSsySzU3NzU1ZllXelNja0Q5UitMUUsyUXBCRGV0MzNHUT09?=
X-OriginatorOrg: silabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2383163a-08b5-4c0a-9b14-08de544ef1f6
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8205.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 15:58:37.8213
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 54dbd822-5231-4b20-944d-6f4abcd541fb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5yclJPWdHF2VauRyuiUwX/vUnL2NfDPP5Z6v1iw80iGptCpYBUCsKGtnMK1WauEJVSgEM1j/Gwh4k+ASZN1dwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5097
X-Proofpoint-GUID: ro6TqM9geIbvIvmNfzxvvilniB0rgO7N
X-Authority-Analysis: v=2.4 cv=M6BA6iws c=1 sm=1 tr=0 ts=69690eaf cx=c_pps
 a=XGteBKPvimVCBgpwGHxg/w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=M51BFTxLslgA:10
 a=i1IsUcr2s-wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=2AEO0YjSAAAA:8
 a=JVDttgvLIx4dm3Ewt8cA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDEyMSBTYWx0ZWRfX0jaD4cFPGd59
 uAPuSqwnjIgbMSCBcv8/uXQfdInQYPl0m2eRmHZwhSuYlweLsRfhxJ3C33qrvUiNgyJRfO1Aen+
 d0jhQdkSyiYFjXKqShxGXiYZkNJ25IZmD18t+6ezVGb+oOGriNQmws7XtxgvjyVvHqczZkfE6eA
 RPR4MKdFqL7lK6C8s6vZnoyWSWNZ+3RJss5HFaUU8RkmaEixPLFHv3VCNT2r/v5Ai3iCVy2g+WU
 8xqjPSXiuzN7Ax5xmCOBV7Q/GHwiDYMWsgGgRM5c1yIC3ntO1akXk56zcpvCnsCsAYXHiMlgv5t
 X+jBvN8qVpfcDtYijaQ9bq3gshVVKpHKLwp6uWhN1GW2OjPv9PYaFExpuT8GXhgY68Fz/Wia93N
 8ct3HqsiNGNPUI8CeT/AT3omDIteIPCjluQ2SpjmRgdXdeh+0AdkDVBnUpaYiiGgyDvoxElwZeJ
 IxsqRMjsHqt/cyY6H/Q==
X-Proofpoint-ORIG-GUID: ro6TqM9geIbvIvmNfzxvvilniB0rgO7N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_05,2026-01-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 spamscore=0 adultscore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601150121
X-Rspamd-Queue-Id: 4CAF14015B
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
Message-ID-Hash: FNFWBIAPUSI3AISGK7N6Z55CSTOPZYHZ
X-Message-ID-Hash: FNFWBIAPUSI3AISGK7N6Z55CSTOPZYHZ
X-MailFrom: Damien.Riegel@silabs.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Silicon Labs Kernel Team <linux-devel@silabs.com>, =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v2 08/14] greybus: cpc: add and validate sequence numbers
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/FNFWBIAPUSI3AISGK7N6Z55CSTOPZYHZ/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

VGhlIGZpcnN0IHN0ZXAgaW4gbWFraW5nIHRoZSBDUEMgaGVhZGVyIGFjdHVhbGx5IGRvIHNvbWV0
aGluZyBpcyB0byBhZGQNCnRoZSBzZXF1ZW5jZSBudW1iZXIgdG8gb3V0Z29pbmcgbWVzc2FnZXMg
YW5kIHZhbGlkYXRlIHRoYXQgaW5jb21pbmcNCmZyYW1lcyBhcmUgcmVjZWl2ZWQgaW4gb3JkZXIu
DQoNCkF0IHRoaXMgc3RhZ2UsIHRoZSBkcml2ZXIgZG9lc24ndCBzZW5kIHN0YW5kYWxvbmUgYWNr
cywgc28gaWYgYSBtZXNzYWdlDQp3aXRoIFNlcXVlbmNlIFggaXMgcmVjZWl2ZWQsIHRoZSByZW1v
dGUgd2lsbCBub3QgYmUgYWNrbm93bGVkZ2VkIHVudGlsIGENCm1lc3NhZ2UgdGFyZ2V0aW5nIHRo
YXQgQ1BvcnQgY29tZXMgZnJvbSB0aGUgR3JleWJ1cyBsYXllci4gT25seSB0aGVuIHRoZQ0KZHJp
dmVyIHdpbGwgYWNrIHdpdGggYWNrbm93bGVkZ2VkbWVudCBudW1iZXIgb2YgWCArIDEuDQoNClNp
Z25lZC1vZmYtYnk6IERhbWllbiBSacOpZ2VsIDxkYW1pZW4ucmllZ2VsQHNpbGFicy5jb20+DQot
LS0NCkNoYW5nZXMgaW4gdjI6DQogIC0gY2hhbmdlIGRldl93YXJuIHRvIHJhdGVsaW1pdGVkIHZl
cnNpb24gaW4gY3BjX3Byb3RvY29sX29uX2RhdGENCg0KIGRyaXZlcnMvZ3JleWJ1cy9jcGMvTWFr
ZWZpbGUgICB8ICAyICstDQogZHJpdmVycy9ncmV5YnVzL2NwYy9jcGMuaCAgICAgIHwgMjAgKysr
KysrKysrKysrKysrDQogZHJpdmVycy9ncmV5YnVzL2NwYy9jcG9ydC5jICAgIHwgMjUgKysrKysr
KysrKysrKysrKysrDQogZHJpdmVycy9ncmV5YnVzL2NwYy9oZWFkZXIuYyAgIHwgMTcgKysrKysr
KysrKysrDQogZHJpdmVycy9ncmV5YnVzL2NwYy9oZWFkZXIuaCAgIHwgIDIgKysNCiBkcml2ZXJz
L2dyZXlidXMvY3BjL2hvc3QuYyAgICAgfCAxMyArKysrKysrLS0tDQogZHJpdmVycy9ncmV5YnVz
L2NwYy9wcm90b2NvbC5jIHwgNDcgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0K
IDcgZmlsZXMgY2hhbmdlZCwgMTIxIGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pDQogY3Jl
YXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3JleWJ1cy9jcGMvaGVhZGVyLmMNCiBjcmVhdGUgbW9k
ZSAxMDA2NDQgZHJpdmVycy9ncmV5YnVzL2NwYy9wcm90b2NvbC5jDQoNCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dyZXlidXMvY3BjL01ha2VmaWxlIGIvZHJpdmVycy9ncmV5YnVzL2NwYy9NYWtlZmls
ZQ0KaW5kZXggM2Q1MGY4YzU0NzMuLmM0YjUzMGQyN2EzIDEwMDY0NA0KLS0tIGEvZHJpdmVycy9n
cmV5YnVzL2NwYy9NYWtlZmlsZQ0KKysrIGIvZHJpdmVycy9ncmV5YnVzL2NwYy9NYWtlZmlsZQ0K
QEAgLTEsNiArMSw2IEBADQogIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMA0KIA0K
LWdiLWNwYy15IDo9IGNwb3J0Lm8gaG9zdC5vDQorZ2ItY3BjLXkgOj0gY3BvcnQubyBoZWFkZXIu
byBob3N0Lm8gcHJvdG9jb2wubw0KIA0KICMgQ1BDIGNvcmUNCiBvYmotJChDT05GSUdfR1JFWUJV
U19DUEMpCSs9IGdiLWNwYy5vDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncmV5YnVzL2NwYy9jcGMu
aCBiL2RyaXZlcnMvZ3JleWJ1cy9jcGMvY3BjLmgNCmluZGV4IDYyNTk3OTU3ODE0Li44N2I1NGE0
ZmQzNCAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3JleWJ1cy9jcGMvY3BjLmgNCisrKyBiL2RyaXZl
cnMvZ3JleWJ1cy9jcGMvY3BjLmgNCkBAIC04LDE3ICs4LDMyIEBADQogDQogI2luY2x1ZGUgPGxp
bnV4L2RldmljZS5oPg0KICNpbmNsdWRlIDxsaW51eC9ncmV5YnVzLmg+DQorI2luY2x1ZGUgPGxp
bnV4L211dGV4Lmg+DQogI2luY2x1ZGUgPGxpbnV4L3R5cGVzLmg+DQogDQorc3RydWN0IHNrX2J1
ZmY7DQorDQogLyoqDQogICogc3RydWN0IGNwY19jcG9ydCAtIENQQyBjcG9ydA0KICAqIEBpZDog
Y3BvcnQgSUQNCiAgKiBAY3BjX2hkOiBwb2ludGVyIHRvIHRoZSBDUEMgaG9zdCBkZXZpY2UgdGhp
cyBjcG9ydCBiZWxvbmdzIHRvDQorICogQGxvY2s6IG11dGV4IHRvIHN5bmNocm9uaXplIGFjY2Vz
c2VzIHRvIHRjYiBhbmQgb3RoZXIgYXR0cmlidXRlcw0KKyAqIEB0Y2I6IFRyYW5zbWlzc2lvbiBD
b250cm9sIEJsb2NrDQogICovDQogc3RydWN0IGNwY19jcG9ydCB7DQogCXUxNiBpZDsNCiANCiAJ
c3RydWN0IGNwY19ob3N0X2RldmljZSAqY3BjX2hkOw0KKwlzdHJ1Y3QgbXV0ZXggbG9jazsgLyog
U3luY2hyb25pemUgYWNjZXNzIHRvIHN0YXRlIHZhcmlhYmxlcyAqLw0KKw0KKwkvKg0KKwkgKiBA
YWNrOiBjdXJyZW50IGFja25vd2xlZGdlIG51bWJlcg0KKwkgKiBAc2VxOiBjdXJyZW50IHNlcXVl
bmNlIG51bWJlcg0KKwkgKi8NCisJc3RydWN0IHsNCisJCXU4IGFjazsNCisJCXU4IHNlcTsNCisJ
fSB0Y2I7DQogfTsNCiANCiBzdHJ1Y3QgY3BjX2Nwb3J0ICpjcGNfY3BvcnRfYWxsb2ModTE2IGNw
b3J0X2lkLCBnZnBfdCBnZnBfbWFzayk7DQpAQCAtMzQsOCArNDksMTMgQEAgc3RydWN0IGNwY19z
a2JfY2Igew0KIA0KIAkvKiBLZWVwIHRyYWNrIG9mIHRoZSBHQiBtZXNzYWdlIHRoZSBza2Igb3Jp
Z2luYXRlcyBmcm9tICovDQogCXN0cnVjdCBnYl9tZXNzYWdlICpnYl9tZXNzYWdlOw0KKw0KKwl1
OCBzZXE7DQogfTsNCiANCiAjZGVmaW5lIENQQ19TS0JfQ0IoX19za2IpICgoc3RydWN0IGNwY19z
a2JfY2IgKikmKChfX3NrYiktPmNiWzBdKSkNCiANCit2b2lkIGNwY19wcm90b2NvbF9wcmVwYXJl
X2hlYWRlcihzdHJ1Y3Qgc2tfYnVmZiAqc2tiLCB1OCBhY2spOw0KK3ZvaWQgY3BjX3Byb3RvY29s
X29uX2RhdGEoc3RydWN0IGNwY19jcG9ydCAqY3BvcnQsIHN0cnVjdCBza19idWZmICpza2IpOw0K
Kw0KICNlbmRpZg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3JleWJ1cy9jcGMvY3BvcnQuYyBiL2Ry
aXZlcnMvZ3JleWJ1cy9jcGMvY3BvcnQuYw0KaW5kZXggMmM3M2Q4ZTcyNGUuLjcwNDFhNmE4YTM2
IDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncmV5YnVzL2NwYy9jcG9ydC5jDQorKysgYi9kcml2ZXJz
L2dyZXlidXMvY3BjL2Nwb3J0LmMNCkBAIC05LDYgKzksMTYgQEANCiAjaW5jbHVkZSAiY3BjLmgi
DQogI2luY2x1ZGUgImhvc3QuaCINCiANCisvKioNCisgKiBjcGNfY3BvcnRfdGNiX3Jlc2V0KCkg
LSBSZXNldCBjcG9ydCdzIFRDQiB0byBpbml0aWFsIHZhbHVlcy4NCisgKiBAY3BvcnQ6IGNwb3J0
IHBvaW50ZXINCisgKi8NCitzdGF0aWMgdm9pZCBjcGNfY3BvcnRfdGNiX3Jlc2V0KHN0cnVjdCBj
cGNfY3BvcnQgKmNwb3J0KQ0KK3sNCisJY3BvcnQtPnRjYi5hY2sgPSAwOw0KKwljcG9ydC0+dGNi
LnNlcSA9IDA7DQorfQ0KKw0KIC8qKg0KICAqIGNwY19jcG9ydF9hbGxvYygpIC0gQWxsb2NhdGUg
YW5kIGluaXRpYWxpemUgQ1BDIGNwb3J0Lg0KICAqIEBjcG9ydF9pZDogY3BvcnQgSUQuDQpAQCAt
MjUsNiArMzUsOSBAQCBzdHJ1Y3QgY3BjX2Nwb3J0ICpjcGNfY3BvcnRfYWxsb2ModTE2IGNwb3J0
X2lkLCBnZnBfdCBnZnBfbWFzaykNCiAJCXJldHVybiBOVUxMOw0KIA0KIAljcG9ydC0+aWQgPSBj
cG9ydF9pZDsNCisJY3BjX2Nwb3J0X3RjYl9yZXNldChjcG9ydCk7DQorDQorCW11dGV4X2luaXQo
JmNwb3J0LT5sb2NrKTsNCiANCiAJcmV0dXJuIGNwb3J0Ow0KIH0NCkBAIC02OSwxMCArODIsMjIg
QEAgaW50IGNwY19jcG9ydF90cmFuc21pdChzdHJ1Y3QgY3BjX2Nwb3J0ICpjcG9ydCwgc3RydWN0
IHNrX2J1ZmYgKnNrYikNCiB7DQogCXN0cnVjdCBjcGNfaG9zdF9kZXZpY2UgKmNwY19oZCA9IGNw
b3J0LT5jcGNfaGQ7DQogCXN0cnVjdCBnYl9vcGVyYXRpb25fbXNnX2hkciAqZ2JfaGRyOw0KKwl1
OCBhY2s7DQogDQogCS8qIEluamVjdCBjcG9ydCBJRCBpbiBHcmV5YnVzIGhlYWRlciAqLw0KIAln
Yl9oZHIgPSAoc3RydWN0IGdiX29wZXJhdGlvbl9tc2dfaGRyICopc2tiLT5kYXRhOw0KIAljcGNf
Y3BvcnRfcGFjayhnYl9oZHIsIGNwb3J0LT5pZCk7DQogDQorCW11dGV4X2xvY2soJmNwb3J0LT5s
b2NrKTsNCisNCisJQ1BDX1NLQl9DQihza2IpLT5zZXEgPSBjcG9ydC0+dGNiLnNlcTsNCisNCisJ
Y3BvcnQtPnRjYi5zZXErKzsNCisJYWNrID0gY3BvcnQtPnRjYi5hY2s7DQorDQorCW11dGV4X3Vu
bG9jaygmY3BvcnQtPmxvY2spOw0KKw0KKwljcGNfcHJvdG9jb2xfcHJlcGFyZV9oZWFkZXIoc2ti
LCBhY2spOw0KKw0KIAlyZXR1cm4gY3BjX2hkX3NlbmRfc2tiKGNwY19oZCwgc2tiKTsNCiB9DQpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncmV5YnVzL2NwYy9oZWFkZXIuYyBiL2RyaXZlcnMvZ3JleWJ1
cy9jcGMvaGVhZGVyLmMNCm5ldyBmaWxlIG1vZGUgMTAwNjQ0DQppbmRleCAwMDAwMDAwMDAwMC4u
NjI5NDZkNjA3N2UNCi0tLSAvZGV2L251bGwNCisrKyBiL2RyaXZlcnMvZ3JleWJ1cy9jcGMvaGVh
ZGVyLmMNCkBAIC0wLDAgKzEsMTcgQEANCisvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BM
LTIuMA0KKy8qDQorICogQ29weXJpZ2h0IChjKSAyMDI1LCBTaWxpY29uIExhYm9yYXRvcmllcywg
SW5jLg0KKyAqLw0KKw0KKyNpbmNsdWRlICJoZWFkZXIuaCINCisNCisvKioNCisgKiBjcGNfaGVh
ZGVyX2dldF9zZXEoKSAtIEdldCB0aGUgc2VxdWVuY2UgbnVtYmVyLg0KKyAqIEBoZHI6IENQQyBo
ZWFkZXIuDQorICoNCisgKiBSZXR1cm46IFNlcXVlbmNlIG51bWJlci4NCisgKi8NCit1OCBjcGNf
aGVhZGVyX2dldF9zZXEoY29uc3Qgc3RydWN0IGNwY19oZWFkZXIgKmhkcikNCit7DQorCXJldHVy
biBoZHItPnNlcTsNCit9DQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncmV5YnVzL2NwYy9oZWFkZXIu
aCBiL2RyaXZlcnMvZ3JleWJ1cy9jcGMvaGVhZGVyLmgNCmluZGV4IGFmMjgzZmVjNDkyLi5kM2Zh
MjZlOGEwNyAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3JleWJ1cy9jcGMvaGVhZGVyLmgNCisrKyBi
L2RyaXZlcnMvZ3JleWJ1cy9jcGMvaGVhZGVyLmgNCkBAIC00MSw0ICs0MSw2IEBAIHN0cnVjdCBj
cGNfaGVhZGVyIHsNCiAjZGVmaW5lIENQQ19IRUFERVJfU0laRSAoc2l6ZW9mKHN0cnVjdCBjcGNf
aGVhZGVyKSkNCiAjZGVmaW5lIEdSRVlCVVNfSEVBREVSX1NJWkUgKHNpemVvZihzdHJ1Y3QgZ2Jf
b3BlcmF0aW9uX21zZ19oZHIpKQ0KIA0KK3U4IGNwY19oZWFkZXJfZ2V0X3NlcShjb25zdCBzdHJ1
Y3QgY3BjX2hlYWRlciAqaGRyKTsNCisNCiAjZW5kaWYNCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dy
ZXlidXMvY3BjL2hvc3QuYyBiL2RyaXZlcnMvZ3JleWJ1cy9jcGMvaG9zdC5jDQppbmRleCBjODk2
MTc2MjNlOC4uN2YwNTc5ZmRlMjYgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dyZXlidXMvY3BjL2hv
c3QuYw0KKysrIGIvZHJpdmVycy9ncmV5YnVzL2NwYy9ob3N0LmMNCkBAIC0yMDksMTkgKzIwOSwy
NCBAQCBFWFBPUlRfU1lNQk9MX0dQTChjcGNfaGRfbWVzc2FnZV9zZW50KTsNCiB2b2lkIGNwY19o
ZF9yY3ZkKHN0cnVjdCBjcGNfaG9zdF9kZXZpY2UgKmNwY19oZCwgc3RydWN0IHNrX2J1ZmYgKnNr
YikNCiB7DQogCXN0cnVjdCBnYl9vcGVyYXRpb25fbXNnX2hkciAqZ2JfaGRyOw0KKwlzdHJ1Y3Qg
Y3BjX2Nwb3J0ICpjcG9ydDsNCiAJdTE2IGNwb3J0X2lkOw0KIA0KIAkvKiBQcmV2ZW50IGFuIG91
dC1vZi1ib3VuZCBhY2Nlc3MgaWYgY2FsbGVkIHdpdGggbm9uLXNlbnNpY2FsIHBhcmFtZXRlcnMu
ICovDQogCWlmIChza2ItPmxlbiA8IChzaXplb2YoKmdiX2hkcikgKyBDUENfSEVBREVSX1NJWkUp
KQ0KIAkJZ290byBmcmVlX3NrYjsNCiANCi0Jc2tiX3B1bGwoc2tiLCBDUENfSEVBREVSX1NJWkUp
Ow0KLQ0KIAkvKiBSZXRyaWV2ZSBjcG9ydCBJRCB0aGF0IHdhcyBwYWNrZWQgaW4gR3JleWJ1cyBo
ZWFkZXIgKi8NCi0JZ2JfaGRyID0gKHN0cnVjdCBnYl9vcGVyYXRpb25fbXNnX2hkciAqKXNrYi0+
ZGF0YTsNCisJZ2JfaGRyID0gKHN0cnVjdCBnYl9vcGVyYXRpb25fbXNnX2hkciAqKShza2ItPmRh
dGEgKyBDUENfSEVBREVSX1NJWkUpOw0KIAljcG9ydF9pZCA9IGNwY19jcG9ydF91bnBhY2soZ2Jf
aGRyKTsNCiANCi0JZ3JleWJ1c19kYXRhX3JjdmQoY3BjX2hkLT5nYl9oZCwgY3BvcnRfaWQsIHNr
Yi0+ZGF0YSwgc2tiLT5sZW4pOw0KKwljcG9ydCA9IGNwY19oZF9nZXRfY3BvcnQoY3BjX2hkLCBj
cG9ydF9pZCk7DQorCWlmICghY3BvcnQpIHsNCisJCWRldl93YXJuKGNwY19oZF9kZXYoY3BjX2hk
KSwgImNwb3J0ICV1IG5vdCBhbGxvY2F0ZWRcbiIsIGNwb3J0X2lkKTsNCisJCWdvdG8gZnJlZV9z
a2I7DQorCX0NCisNCisJY3BjX3Byb3RvY29sX29uX2RhdGEoY3BvcnQsIHNrYik7DQogDQogZnJl
ZV9za2I6DQogCWtmcmVlX3NrYihza2IpOw0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3JleWJ1cy9j
cGMvcHJvdG9jb2wuYyBiL2RyaXZlcnMvZ3JleWJ1cy9jcGMvcHJvdG9jb2wuYw0KbmV3IGZpbGUg
bW9kZSAxMDA2NDQNCmluZGV4IDAwMDAwMDAwMDAwLi5mZjY1NzU3YjQwZg0KLS0tIC9kZXYvbnVs
bA0KKysrIGIvZHJpdmVycy9ncmV5YnVzL2NwYy9wcm90b2NvbC5jDQpAQCAtMCwwICsxLDQ3IEBA
DQorLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjANCisvKg0KKyAqIENvcHlyaWdo
dCAoYykgMjAyNSwgU2lsaWNvbiBMYWJvcmF0b3JpZXMsIEluYy4NCisgKi8NCisNCisjaW5jbHVk
ZSA8bGludXgvc2tidWZmLmg+DQorDQorI2luY2x1ZGUgImNwYy5oIg0KKyNpbmNsdWRlICJoZWFk
ZXIuaCINCisjaW5jbHVkZSAiaG9zdC5oIg0KKw0KK3ZvaWQgY3BjX3Byb3RvY29sX3ByZXBhcmVf
aGVhZGVyKHN0cnVjdCBza19idWZmICpza2IsIHU4IGFjaykNCit7DQorCXN0cnVjdCBjcGNfaGVh
ZGVyICpoZHI7DQorDQorCXNrYl9wdXNoKHNrYiwgc2l6ZW9mKCpoZHIpKTsNCisNCisJaGRyID0g
KHN0cnVjdCBjcGNfaGVhZGVyICopc2tiLT5kYXRhOw0KKwloZHItPmFjayA9IGFjazsNCisJaGRy
LT5yZWN2X3duZCA9IDA7DQorCWhkci0+Y3RybF9mbGFncyA9IDA7DQorCWhkci0+c2VxID0gQ1BD
X1NLQl9DQihza2IpLT5zZXE7DQorfQ0KKw0KK3ZvaWQgY3BjX3Byb3RvY29sX29uX2RhdGEoc3Ry
dWN0IGNwY19jcG9ydCAqY3BvcnQsIHN0cnVjdCBza19idWZmICpza2IpDQorew0KKwlzdHJ1Y3Qg
Y3BjX2hlYWRlciAqY3BjX2hkciA9IChzdHJ1Y3QgY3BjX2hlYWRlciAqKXNrYi0+ZGF0YTsNCisJ
dTggc2VxID0gY3BjX2hlYWRlcl9nZXRfc2VxKGNwY19oZHIpOw0KKwlib29sIGV4cGVjdGVkX3Nl
cSA9IGZhbHNlOw0KKw0KKwltdXRleF9sb2NrKCZjcG9ydC0+bG9jayk7DQorDQorCWV4cGVjdGVk
X3NlcSA9IHNlcSA9PSBjcG9ydC0+dGNiLmFjazsNCisJaWYgKGV4cGVjdGVkX3NlcSkNCisJCWNw
b3J0LT50Y2IuYWNrKys7DQorCWVsc2UNCisJCWRldl93YXJuX3JhdGVsaW1pdGVkKGNwY19oZF9k
ZXYoY3BvcnQtPmNwY19oZCksDQorCQkJCSAgICAgInVuZXhwZWN0ZWQgc2VxOiAldSwgZXhwZWN0
ZWQgc2VxOiAldVxuIiwgc2VxLCBjcG9ydC0+dGNiLmFjayk7DQorDQorCW11dGV4X3VubG9jaygm
Y3BvcnQtPmxvY2spOw0KKw0KKwlpZiAoZXhwZWN0ZWRfc2VxKSB7DQorCQlza2JfcHVsbChza2Is
IENQQ19IRUFERVJfU0laRSk7DQorDQorCQlncmV5YnVzX2RhdGFfcmN2ZChjcG9ydC0+Y3BjX2hk
LT5nYl9oZCwgY3BvcnQtPmlkLCBza2ItPmRhdGEsIHNrYi0+bGVuKTsNCisJfQ0KK30NCi0tIA0K
Mi41Mi4wDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmdyZXlidXMtZGV2IG1haWxpbmcgbGlzdCAtLSBncmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3Jn
ClRvIHVuc3Vic2NyaWJlIHNlbmQgYW4gZW1haWwgdG8gZ3JleWJ1cy1kZXYtbGVhdmVAbGlzdHMu
bGluYXJvLm9yZwo=
