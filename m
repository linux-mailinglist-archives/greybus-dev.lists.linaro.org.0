Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GOrFHvoqeWktvwEAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Tue, 27 Jan 2026 22:15:38 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id E75579AA6C
	for <lists+greybus-dev@lfdr.de>; Tue, 27 Jan 2026 22:15:37 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id DD427401B2
	for <lists+greybus-dev@lfdr.de>; Tue, 27 Jan 2026 21:15:36 +0000 (UTC)
Received: from mx0a-0024c301.pphosted.com (mx0a-0024c301.pphosted.com [148.163.149.154])
	by lists.linaro.org (Postfix) with ESMTPS id 6BACA3F732
	for <greybus-dev@lists.linaro.org>; Tue, 27 Jan 2026 21:12:02 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=silabs.com header.s=pps12202023 header.b=uEWLL7M9;
	dkim=pass header.d=silabs.com header.s=selector1 header.b=XXJysIX0;
	spf=pass (lists.linaro.org: domain of Damien.Riegel@silabs.com designates 148.163.149.154 as permitted sender) smtp.mailfrom=Damien.Riegel@silabs.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1");
	dmarc=pass (policy=reject) header.from=silabs.com
Received: from pps.filterd (m0101743.ppops.net [127.0.0.1])
	by mx0a-0024c301.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60RF675M3275050;
	Tue, 27 Jan 2026 15:11:58 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps12202023;
	 bh=bRIkUgjJQJeQej9Y8g0l6L19bcB2cqRDOtbJaWpGYOM=; b=uEWLL7M9ZXKN
	X7n7Gzhfphq9iWQ4nVhTTrC/biqLeljN4tOFr1DiPbV8aAgoMwTtkpE+XhgR90Am
	j0QqhacRNH3erQU1pIY1Pnq6B7odEDA3QibOJfwgp8gUxMG5T4IY7NKCboAcoe/0
	a0VfvxWnGxcBLVKSd2hVkahQ8JL8LAP/rkn1h/SEvJii13zIXMax/QCOl7PU/Gs2
	HGqx/IEs4atvkdwDuP7SF8pmiTMMSaVQnaz0lpadPRaGfcdFBcpcgbb/vxcRzPQv
	nAJFOvHhOR2ZItbilZaxks934ox5tApGH2TMws4shD9zOpyWR5YDkhSKyi7z/WPt
	0QFEAH/G6A==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11021119.outbound.protection.outlook.com [40.93.194.119])
	by mx0a-0024c301.pphosted.com (PPS) with ESMTPS id 4bvu9c623k-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 27 Jan 2026 15:11:58 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Axs2WHxyIqZ/Aj1ioOF24R4CSAq7xx19Xme2p0SVdjfeXcHCOpdKASUPhCjR8L4HVxBtEkmGrp6eneMJRzttmiw+N2sjbdueeJBg78TXw3d6eqBFBD9hefqL+haOi5iZVo/7HSN3bvEUz/XqkMDyt6jyEMzqvo5L+MHjEKaKQV9tQcC2lYQcx7XRRGf66ro+/2+XNjusCKX5x0p19uGSn4Ls9jCVzShPw1cXpvI9YEtwroEgxR3mb+56dfeHAO6uk6qeF+uxpTMf5RMaVEWMuLqvPyUdnwqkVgnUqPVHZkWEvDqR/i6zw+QvhVUtKopRdnSV9HpfZe5TMCXHiZkGhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bRIkUgjJQJeQej9Y8g0l6L19bcB2cqRDOtbJaWpGYOM=;
 b=Bftb5cETYh0EqpxY47i5U3Cfr3413/5z9UsmXY+LY5sHq7g0bUwVS3M76+uxRNsBMt2ELcT5ynarEu3LhX6DEROCYKpwFr5JpqW+nincuIEe9xW3EpJai9nKbuEWp9Rtpn74v4HW5ctI6FsEPTeQuz/PCvwe+eAgOfltboS4+VoR1kYpFSPWYYavNSRUdr2zcL3kgVE8o4G/AxdRxhjyAEmfQuATS7YGAVzxkENEgvfRn2B0nqDO6CfUiZcUFyhoy3++7FWzbivj/rScAaDI8Xi+1mJrRjHlJRD2NeLUVolwHsTCVuGoFy90/9o23xoXM/rE/f40e90wmTe9symN2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silabs.com; dmarc=pass action=none header.from=silabs.com;
 dkim=pass header.d=silabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bRIkUgjJQJeQej9Y8g0l6L19bcB2cqRDOtbJaWpGYOM=;
 b=XXJysIX07yLKSKrCEYrmE1jtPlpckFufTboGluKnfDV2gpMAqmKSlXfPmqQS7wQf8Ky2WLJJDlNQkWSlkCFQ02q74vVnHA2DF/ic50SLTkErvWW5rWphR4fPUhRIQAzLkbh7/UBFhkUJxGIoAKaAEvz/L5MulD6bYDzA908HY+M=
Received: from DS0PR11MB8205.namprd11.prod.outlook.com (2603:10b6:8:162::17)
 by IA1PR11MB6395.namprd11.prod.outlook.com (2603:10b6:208:3ac::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Tue, 27 Jan
 2026 21:11:54 +0000
Received: from DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::2de6:bc88:2af7:3583]) by DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::2de6:bc88:2af7:3583%3]) with mapi id 15.20.9542.010; Tue, 27 Jan 2026
 21:11:54 +0000
Date: Tue, 27 Jan 2026 16:11:52 -0500
Message-Id: <DFZOIW5D4MG8.VPP4RYISK8L3@silabs.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
        =?utf-8?q?Damien_Ri=C3=A9gel?= <damien.riegel@silabs.com>
From: =?utf-8?q?Damien_Ri=C3=A9gel?= <damien.riegel@silabs.com>
X-Mailer: aerc 0.21.0
References: <20260115155808.36102-1-damien.riegel@silabs.com>
 <20260115155808.36102-2-damien.riegel@silabs.com>
 <2026011639-prewar-drilling-9bc9@gregkh>
In-Reply-To: <2026011639-prewar-drilling-9bc9@gregkh>
X-ClientProxiedBy: YQBPR0101CA0037.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:1::14) To DS0PR11MB8205.namprd11.prod.outlook.com
 (2603:10b6:8:162::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8205:EE_|IA1PR11MB6395:EE_
X-MS-Office365-Filtering-Correlation-Id: b65ced30-5ef3-48f3-ca65-08de5de8b25a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?cmJHamFYaWZFU05CdGlyd1IrNDRsSm5OV1ZoeEdmUGthVGtoQ0JISy9UWmRY?=
 =?utf-8?B?Mm9lNG9hWU9JakZ2UTFoOTdrSGVJVjBwWDkrVHlWT2YvOVBQeFRFYTMxM2Vp?=
 =?utf-8?B?R3lFaEhBWUN5WU93U0xKVkdMbjN5TWtBR2ZQTlVsOXFXbHdQdllEejIxM3hC?=
 =?utf-8?B?cTRheDFadGUxWFhOb2RrTWZyRWpiK0MxMWl2S21aVkk1UjFWUENIMTVUUGs0?=
 =?utf-8?B?ZU1EcVhCemI1K2h4bEN4MGI5ZHU0bzVjWi84SXJXZVNOS3UxVDdtT1Z2SE1s?=
 =?utf-8?B?dlBuRHZ1QndWKzNUV2lqcGUrM0ZWSVlVOFd4cFNmUEdHNFdwWXlPcmN4bStq?=
 =?utf-8?B?NmpkUEtLdTJSNUUrS0dMc2o4Q3hTZ1BMNDE0UGZpUEFHRWJLd3pYV2hFVnIx?=
 =?utf-8?B?OGdaTlpTbU10VGNxdU94d2oxcVFRQ3ZnWGNpLzFOOGZKVnA3MFZUUDFSaEx0?=
 =?utf-8?B?dTRhWXVYWE1oWk5NblQyWG93bFVVMUoxSktsOHhaeWJ1TkRBdmhsMWRZMi9w?=
 =?utf-8?B?MDFwM0labzEwNFQ0QWJndTZCcUY3bHN3VmZkc0JHZWVpRFZtM2tuNVNHbURo?=
 =?utf-8?B?VzdGVjl5MGxtaUlyNFNVcGJSZ3lDMWZEQWxpYU1VU3RmdXNZU2RwQXZBQmw1?=
 =?utf-8?B?UnNUTmlNRys0Rm1WaS9UMVIwYTRZcHdUUzN1OHo0a1NVWkttS2hWOWJ0b1Za?=
 =?utf-8?B?cVlsOE5walRNSXVjc1Z0WENCWWhpUkRMeHN5d05YLzdvWlk0aGZqYm4rdE10?=
 =?utf-8?B?SDd5SFU2bm5yaEQvT0pkcm4zM1phOGhTWnM2ODRDcEtUTXJ0UEorSXp5VWhx?=
 =?utf-8?B?aE5RN1VYSkVPUldQRWNOZGFxOUJHMUJ2MUtUbE9mMFBzdWxha0NacFhURE0w?=
 =?utf-8?B?RSt4RFJ6RXNTN3h1RDdhK015SmY3WFNQdVprYUdqOUlFTWNRVEp6c1Z2VXQv?=
 =?utf-8?B?WWh3YUNOTTJMNzFBYnpsSlh3ZU0vQkZzbWEyMUhRTUZsWVhiR1JJU3ovazA5?=
 =?utf-8?B?dkZYcnplM21OeGVDa1hvM1Bkei9HTjcxQ2pNNDlKOENsMkhyN1FTSEhjc2tQ?=
 =?utf-8?B?Tyt0QzNnVCs3TVloY2dsTUQvbEpReHF0SnkxckpCc282QWx5bHVuNTJTWmVh?=
 =?utf-8?B?MU9iQlNlWEQ4Zmc4Q1p2dXMwWnVDTTJ5MXVpWVhsb05LOGI1T2NuOGVUdmJD?=
 =?utf-8?B?cVJPa1NidGVFZ09ycjdRT1doSHo2YUhVeFRtbTdvNlJnbGRTZGpsZzFlTmlz?=
 =?utf-8?B?a21pYmYxY2ZzWkVoTlBqZ0FaT1d1eE1hZjZWUzhhdXdMNmxtUDIxY3lZMWVR?=
 =?utf-8?B?WE82U2syVjdPbHNBdXh6cWdjS3ZUWjJ0dFRmREdTSmtka2pYVWNEd0laTDVU?=
 =?utf-8?B?NDk0NWNEMy91R20zbS80YTROY0dCQzlsdGd4bzQwSDJLRXllRHVsUnNkVUUz?=
 =?utf-8?B?WXBvVUg3NnA5ZGZtbTNrRXBxSFRqbkltZWpTT0d4Qmk3NWVmOFp0QnhTcExH?=
 =?utf-8?B?VXZ4eWdvYnJoUllNQlVHSVFxVFF4VWozZlp5dnFkbHNQa2N0ZmtSMjFEOXpm?=
 =?utf-8?B?NnBDTGswcHd2Z1ZHRG1aRGExUVdxVUdha1huRFlZUk9ETXhKNTlEcTR1MFdx?=
 =?utf-8?B?YlR6anN5TFVpY2xNdnZYT2F0OGYzanRRZDdpYzFMMy9ONE5Ib09BWXVLVnNl?=
 =?utf-8?B?ZUZrcERCRURrRWs3Z29yLzNTeU9vU0k5R3Q2allWSVdrS0lvdG5EWjBSa1pt?=
 =?utf-8?B?REtvQXVVS0JFZGEyZTgvaHp2RDgzMVNFNms0TEtOMUVvY0pVRVdWZGJxa0RK?=
 =?utf-8?B?ZlNhTC85Yk1QQU9vMUsvQVRZODk4enY3MEQwVDk3QWZMU0FJbStya1UrMGN0?=
 =?utf-8?B?RmZ2Y1NZb3ZTRDdHM0ljQWdrcWV1R0hGQXZsV01HcE1iV2hmL29ZaSsyZnZn?=
 =?utf-8?B?Q1ZFSjBZZ3VxNGgvWWQyR3FNYnBSQ2NXb3JOb05YMGZBUW5VdWdweFVsNXN1?=
 =?utf-8?B?NGQ5L21qMXpWTWU4MlA4SVpadjJETTdhb3dybVlLMFBlZlVld2lFWS9QR1hG?=
 =?utf-8?B?bUl6bWlLSnBVVmt4M3dCRlZhN2pjeHhKWHg5V1h3bWdMRFFoL2RZeHhTc1pR?=
 =?utf-8?Q?QAlE=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8205.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Y3hxQmJtamxFWC8xejJ4eU1Nd0g0dG1FcEsvVTJyUUE0K1ZIbG9lenFkb1dI?=
 =?utf-8?B?cTFNdlljWm41TTZaSUZ4ZWhDMFo2R3FQQkk5dGZVeCs3eE81Z1hDUEhkN2pp?=
 =?utf-8?B?bFNsa2U4MmFyRUkzcWNtTDM4QSs2ajRYa1IrSFpPZ3BsRktWd0VoWFhxczhi?=
 =?utf-8?B?QmMraUpKR2FVTzlXTldtcTlZMGtqNk9ieWVvZWthVDBWU1dxOXp0dzlvcWpt?=
 =?utf-8?B?TXl4NzJiMXVvR2hOTnplSUxmallwaEhycFY0RnQ5RUNVb1M2ZHMwdDdOTSto?=
 =?utf-8?B?ZjNvRnNOeTM4enRGMXZHb1hZQmY5SUdvd0tnWHN0aHR2TjEwR1lmMWcyaGVo?=
 =?utf-8?B?ZzBrY2orODdQM3EyN0M3dnQ2VzVpdjdqaGZTTURQaHRVTmhJUnJNYTNCUVA3?=
 =?utf-8?B?TyswQXBFLy9td3BVa1AzUnlvQlJFZjdhOHZrWEJHN0dScnRsN2F1THl4QWVK?=
 =?utf-8?B?QmR3SlR4Q1g0VnRRYXhTMFkyNG5RU1hmN29QUlRpZmpxajNVZzNiLzhSdFg1?=
 =?utf-8?B?bUx0THZKM2VvY0lIRlJhdDZRNWVqK3RZQWhsMmtsdnBMQnFoQndCYnpPWG9y?=
 =?utf-8?B?UGE5d2pjZThJZEg4YXA4bzEvMnBndHdXVjBnV0NPUjUwMGNzRnI4QWt0MlY1?=
 =?utf-8?B?VGFrQlNlS2dtTU9CMC9hRFF4eDVHbGlSYU55MC9Sb3VGS2JkZVZEQ0xjTXpO?=
 =?utf-8?B?OWxEaEZKNTZ5NG9Ob2JJTkwyTWt1V0orK2tGQXhNNVl2TnpHazMra083Smhh?=
 =?utf-8?B?RWRwYnVSK1BzTElzUzNXa1MzNVZtc3BjRi9BYkp0bG1BT0Jrdmx1czd2eitx?=
 =?utf-8?B?NHp6Z3I0MGJjaVRwRzhLYzVObzlmdTM3SUJTN3o2TCsycitCZ0R5bEFYN1JJ?=
 =?utf-8?B?aWp4YzAxTzFpdHlmSVpYcDk1NzZlT0Rlc1V6YVI1SEs4V2dMOCthL0tMMEQx?=
 =?utf-8?B?dUVxU0VxemgrOUlNQlpuTUVxK1NaQzNaMjVVanVKb2RHMzU4Z0F4L1ppaFls?=
 =?utf-8?B?dmFLSFFCb3poQ282VWlwRWlBOWh4TFV6ZUZvRzE3U1RVYjFGUEluSWJhV285?=
 =?utf-8?B?Yyt1RU9aVmROT0hqWTVIcEtNUit0eGNiMituR1ZWTm50SDVIK1pWVkFEZzVO?=
 =?utf-8?B?RkgzcTRPZ2VJdmZJTFk0aWMwb1d5Z2ZiZ1hjQmx1TmR6NXNlVnJ6Z1M4RWlt?=
 =?utf-8?B?MUh6L1E2TFBIeS9RYm9IQ0N5OW1Vdk5NeUcveTZkREwwbE1OeEozZVNPT0J3?=
 =?utf-8?B?bGl1L3VjZ1QrNDliN0tNRU10aWZRNzk2QWhiaWQ3bWRaT09WMVdiMlM4aUV3?=
 =?utf-8?B?a2xmbDJLWUpTcmpaWUpBYkVtWUpUb2pya2liV3Avc05wMnFlM2lGR2xHUnc1?=
 =?utf-8?B?b1ZQOERWcTNnNG55bjN0bzl6M0dRcmxVOStaQ0NGa1loRWFweUxSSGRrL1hU?=
 =?utf-8?B?bFdjMnprMGlwWHdQRDJ4b0tuQzJFSzdGc3NBUFQ1OWw2UWVzVHQxSVFkUmdm?=
 =?utf-8?B?KzQ0Njdjdkgyd1Q0SXRkQW1ZdHlDMnF6NG0zWXRnNGp4bEpvRWw2SGRyM2pj?=
 =?utf-8?B?ZHFsVnFNekw5TG5ydjlMejVKZHo4S1NXcHlPRUtLNm16UlpSdWlXNHJUMnVy?=
 =?utf-8?B?R0pnUWFUNjRNNU93UFp2Sjlrd0E2SllJVG13ejBIM3MzRjJIaTlwcWdlc243?=
 =?utf-8?B?WFN5YXF3N2FnVFZiQ081Y2psM2dWL0hjQk5UMTRxbFB0dWhPWHlYNkFXYlIr?=
 =?utf-8?B?S29hdzVpTmJqUnhIcGZLWWttcE1WTURvaVBhYjZaSzUxOUNSdVRJU2gzYWNG?=
 =?utf-8?B?eEh3dGlHdVB1NU91blVJWk1YMXk4bXRZWHlUU3o4b0dtQzRBeVR0TmlJbmth?=
 =?utf-8?B?U1FvTHVtYjRtWElnRnF5RDJ2VW1kcXcwWVNwR2hTdzB6RHE5WUNaTzVTTTJK?=
 =?utf-8?B?TTc0M3BKcTFwY05KY3ozNS9ZZmUwczRIc2lrdHZ0N2F3MitBQ1JMTlJEZHZJ?=
 =?utf-8?B?b2QzSGZNYSs3aW82VkFLWlovdWpsdExsYUZ4UDlMS1lLcnVkOEp2ei82NThI?=
 =?utf-8?B?V0YyZDBvdFYvRlk1U2hpVEpMbEU1WXVRdU15WHVkTTBsWkI1ZldKRm1mU2VT?=
 =?utf-8?B?WEw4UHRudUthWVZ5UEpOQjlsV1I0MGcvb1NqWkZTditCdS9KbExyNCtscTky?=
 =?utf-8?B?SVJoOGlUSS9pcW9wK1RncjRqTExPK1Fld1k2aUR3M3FqNmU5NXVrZWUyVkwx?=
 =?utf-8?B?K1NTaGxCaWplR2xCTzdsOXRVbEVVbExtRkV4UnFUWWdPbmNxTVFZc0Z6WVZQ?=
 =?utf-8?B?Uy96UTJnMnBFS1BzQW5TS2xzTEZsWDFoWXg0anF3K2t3SjgyM2Y4dz09?=
X-OriginatorOrg: silabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b65ced30-5ef3-48f3-ca65-08de5de8b25a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8205.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 21:11:54.2123
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 54dbd822-5231-4b20-944d-6f4abcd541fb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2EVkkbUgQTKjnr/M434rQfJS3vZzScsSXH1a8E2xGQbI9Cml5kwQLlrcyG3OGV45lZAbKykkEoYEB3A+5mLVkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6395
X-Authority-Analysis: v=2.4 cv=T/iBjvKQ c=1 sm=1 tr=0 ts=69792a1e cx=c_pps
 a=GdOSod5Hi6qnJTGfnwF89g==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=M51BFTxLslgA:10
 a=i1IsUcr2s-wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=W4DJfO9HYRPrAOMoRiUA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: -oey6xZMdw2oQwWXxrDf6z2G-HLFYO19
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDE3MiBTYWx0ZWRfX5id413bFgXXI
 RLpsY7ybfJ042q31Q+lxG3/FBlZb7OMMOfWEy1zePt/nuck930F9B5I2E2xjG9rjv7qe7TxM7c/
 kPYgknuyrdRoEjEpW9fTB3Tpqh8iHZhRlXAq9lS66UsNWsaTRP8ND9QdOJdtO2tu2OJ35+OuCo2
 Qj8eKrH1QiwQVe+fjg6xlh/n60cK2vyjsxb+RhHDeZ4o/+Jxaoe5TfsLMNLeRIt1KBsU8k3FDpk
 Y1BwAIoH7HwX5TzYw28t9At2wQ5Yhlv1wxp5RLQqaCmPZeNkw7rV2AOUtFR2+H0E6zw1qfbva4c
 Sew6Rv67WlhCpVuvnaFvIIxo/zy7iqH0sYuyYXgkRjJ+R/9LdH1LD6b7mNebIs1iTcexc2bikKS
 CGVpq04SsaEgZE4B2C3FpwVVIMqZlI6hz25QGjlatgmx9FJtH8NDUo7eKH5yoz2dlWZPRhfYoeg
 yW/vgKuDhgePMLjQdFw==
X-Proofpoint-GUID: -oey6xZMdw2oQwWXxrDf6z2G-HLFYO19
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_04,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 adultscore=0 bulkscore=0
 phishscore=0 suspectscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270172
X-Spamd-Bar: -----
X-MailFrom: Damien.Riegel@silabs.com
X-Mailman-Rule-Hits: implicit-dest
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
Message-ID-Hash: MVBL2ZMSQG2BM6DCIRA7HB574VYUHNQ2
X-Message-ID-Hash: MVBL2ZMSQG2BM6DCIRA7HB574VYUHNQ2
X-Mailman-Approved-At: Tue, 27 Jan 2026 21:15:35 +0000
CC: greybus-dev@lists.linaro.org, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, linux-kernel@vger.kernel.org, Silicon Labs Kernel Team <linux-devel@silabs.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v2 01/14] greybus: cpc: add minimal CPC Host Device infrastructure
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/MVBL2ZMSQG2BM6DCIRA7HB574VYUHNQ2/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.59 / 15.00];
	DMARC_POLICY_REJECT(2.00)[silabs.com : SPF not aligned (relaxed),reject];
	R_DKIM_REJECT(1.00)[silabs.com:s=pps12202023,silabs.com:s=selector1];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[damien.riegel@silabs.com,greybus-dev-bounces@lists.linaro.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[silabs.com:-];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	NEURAL_HAM(-0.00)[-0.996];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,silabs.com:mid]
X-Rspamd-Queue-Id: E75579AA6C
X-Rspamd-Action: no action

T24gRnJpIEphbiAxNiwgMjAyNiBhdCAxMDoxMSBBTSBFU1QsIEdyZWcgS3JvYWgtSGFydG1hbiB3
cm90ZToNCj4gT24gVGh1LCBKYW4gMTUsIDIwMjYgYXQgMTA6NTc6NTRBTSAtMDUwMCwgRGFtaWVu
IFJpw6lnZWwgd3JvdGU6DQo+PiBBcyB0aGUgZmlyc3Qgc3RlcCBmb3IgYWRkaW5nIENQQyBzdXBw
b3J0IHdpdGggR3JleWJ1cywgYWRkIGEgdmVyeQ0KPj4gbWluaW1hbCBtb2R1bGUgZm9yIENQQyBI
b3N0IERldmljZXMuIEZvciBub3csIHRoaXMgbW9kdWxlIG9ubHkgcHJveGllcw0KPj4gY2FsbHMg
dG8gdGhlIEdyZXlidXMgSG9zdCBEZXZpY2UgQVBJIGFuZCBkb2VzIG5vdGhpbmcgdXNlZnVsLCBi
dXQNCj4+IGZ1cnRoZXIgY29tbWl0cyB3aWxsIHVzZSB0aGlzIGJhc2UgdG8gYWRkIGZlYXR1cmVz
Lg0KPg0KPiBXaGF0IGlzICJDUEMiPyAgSSBkb24ndCBzZWUgYSBkZXNjcmlwdGlvbiBvZiB0aGF0
IGFueXdoZXJlIGhlcmUsIHNvcnJ5Lg0KDQpZZWFoLCBpdCBzZWVtcyBJIGZvcmdvdCB0byBpbnRy
b2R1Y2UgdGhlIHRlcm0gaGVyZSwgYW5kIGluIHRoZSBjb3Zlcg0KbGV0dGVyIGFzIHdlbGwuIEkn
bGwgcmVzZW5kIGEgdmVyc2lvbiB0aGF0IGV4cGxhaW5zIHdoYXQgQ1BDIGlzIGFuZCB0aGF0DQph
bHNvIGFkZHJlc3NlcyBKZXJvbWUncyBjb21tZW50cy4NCg0KdGhhbmtzLA0KZGFtaWVuDQpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpncmV5YnVzLWRldiBt
YWlsaW5nIGxpc3QgLS0gZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpUbyB1bnN1YnNjcmli
ZSBzZW5kIGFuIGVtYWlsIHRvIGdyZXlidXMtZGV2LWxlYXZlQGxpc3RzLmxpbmFyby5vcmcK
