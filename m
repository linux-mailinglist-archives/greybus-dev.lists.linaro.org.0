Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E0C8CB93DD
	for <lists+greybus-dev@lfdr.de>; Fri, 12 Dec 2025 17:14:22 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 38C993F9BC
	for <lists+greybus-dev@lfdr.de>; Fri, 12 Dec 2025 16:14:21 +0000 (UTC)
Received: from mx0a-0024c301.pphosted.com (mx0a-0024c301.pphosted.com [148.163.149.154])
	by lists.linaro.org (Postfix) with ESMTPS id 43CCD3F99A
	for <greybus-dev@lists.linaro.org>; Fri, 12 Dec 2025 16:13:37 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=silabs.com header.s=pps12202023 header.b=EMt72od+;
	dkim=pass header.d=silabs.com header.s=selector1 header.b=FzfBgnDH;
	spf=pass (lists.linaro.org: domain of Damien.Riegel@silabs.com designates 148.163.149.154 as permitted sender) smtp.mailfrom=Damien.Riegel@silabs.com;
	dmarc=pass (policy=reject) header.from=silabs.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from pps.filterd (m0101743.ppops.net [127.0.0.1])
	by mx0a-0024c301.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BC8WO7Q3748684;
	Fri, 12 Dec 2025 10:13:26 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps12202023;
	 bh=dhxAU0ch0XPtQ590RjOqkh/Il+vBEamwneEDNjW9zhU=; b=EMt72od+lBGI
	/W8SuBPE0/TSy2jWoRiTkKHgmNWWtiot98dViVOiemOJLf71t84sPegFuu2/GtK9
	61hQ6d5nHip38XihyN6rUW81oii0QPMRMlHDQg42xs2RYO21t4PiwaIDUnAYWGq1
	4ZC+yiyEhaRis2z+441/M1U2Q70ZEYbBXy3ScgOvRDAdOjOf1kUv8obBc++IoDId
	F822Sx9+p7w5OTGWLFxWnC8kwCfliRJykLJE6YCsQWdnfjTBEzplJw9YTbAxjt1C
	OMtVxdYWXjIs3t/OVTV0OPESWOY5j1x+zBEHiLQ2WIOVJ1BQtX0wJKDtw7p2XumF
	gZe7dMsy1w==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11021114.outbound.protection.outlook.com [52.101.52.114])
	by mx0a-0024c301.pphosted.com (PPS) with ESMTPS id 4ayht2mdee-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 12 Dec 2025 10:13:26 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A+3/TsijtzG4Sh6gB0Bj1sO/1q2N7zi6vfRlWBQ2UWMZ8T0FJOYbnaDR6k0H0GnLm1ViKQNzOvkVMhzNyi+FAWxlWXdBAVVFwWkcxPXdhbpRzSxLQEye2eUudL1j1tTPfYj6XD/i3koFAwxzg7KH8dYJCSDUb5Nq/DsDJ7tLINr6qreESTwUFmaTBDTkbugOfvWrGw4y93ynHzFFNewE40RsxfcablYvOZDEGVKZjrRWgkgCbTaU3dnxNa8Xkej2jcp54gZd5xUauDAMZQRgfVgxkCqiEn64hW775gT8pB32ABF4Lzp3Koz7lltgyfihM3e4u+JlUJx/mKwQU4z9og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dhxAU0ch0XPtQ590RjOqkh/Il+vBEamwneEDNjW9zhU=;
 b=ph3fMt3FH1fL8p5ypc3eJ7TbGEnKYcf3PCmxosWj9fsq8bpNivL9RGmZkD+2oO/t3Dd1ueIPRk9kU5OTrrH6nN3KNaA/q1pKRVod9epsd2Hjlu+OY85w9GgDc3StBSOGg7Ip0GN/LiXG5wY0AHOU0h5/yB1izmxgc0PFgeSzwzsHNKHw+e/rN+8+XWaeoG6EP1AJnEEfLua3+QnMy97RIUMNYj3hV7PuOvNNYsLOHtnLqL56UaixyFyw5cFHWI9ejQegxOggxYGWXiyiam+P6d1xTydwYFqSfkpn8CaE7FIJuV5iq+8nq2TBsKGTKdqqxKy1PdRPUhYN5B//h79Jyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silabs.com; dmarc=pass action=none header.from=silabs.com;
 dkim=pass header.d=silabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dhxAU0ch0XPtQ590RjOqkh/Il+vBEamwneEDNjW9zhU=;
 b=FzfBgnDHI2JgMS+NPUzeAJ1AeS48Wg/qhXnRw1DXOLjVv6+h4iPSFKqc7or6bAFN0XaDscDmpvUmWh91ja/+gx7/GDhiL2bu5VrCpLnKMUvPaxyIFJJl2i/eHRKNJefHB2/pY52nZyhFExkw/wJyqUtebtetDqC3kva3j0ipFsw=
Received: from DS0PR11MB8205.namprd11.prod.outlook.com (2603:10b6:8:162::17)
 by MN0PR11MB6111.namprd11.prod.outlook.com (2603:10b6:208:3cd::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.9; Fri, 12 Dec
 2025 16:13:23 +0000
Received: from DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::2de6:bc88:2af7:3583]) by DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::2de6:bc88:2af7:3583%3]) with mapi id 15.20.9412.005; Fri, 12 Dec 2025
 16:13:23 +0000
From: =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
To: greybus-dev@lists.linaro.org
Date: Fri, 12 Dec 2025 11:12:56 -0500
Message-ID: <20251212161308.25678-3-damien.riegel@silabs.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251212161308.25678-1-damien.riegel@silabs.com>
References: <20251212161308.25678-1-damien.riegel@silabs.com>
X-ClientProxiedBy: YQZPR01CA0176.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:8b::25) To DS0PR11MB8205.namprd11.prod.outlook.com
 (2603:10b6:8:162::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8205:EE_|MN0PR11MB6111:EE_
X-MS-Office365-Filtering-Correlation-Id: 2acf8c4f-a69a-4ef5-eb1b-08de39995f78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|366016|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?amoxdmFkYUNTY25NSjBpZUlraytVWWo2dUFFMW1oY1NNZEdUMlRJODVnY3Mz?=
 =?utf-8?B?NDgzOUhpaDB6R0xZODJWOHRYK0k5OWFzWEN5QnhZV3lSYUpHUjhEK2E1S3Zp?=
 =?utf-8?B?L0h0T0psSEhrNDhqazFXS21HUG1Ic0wwTVlUWDVGTGlYMTBjb1J3Q1lpZmhL?=
 =?utf-8?B?YWlDaldwMCtBK0IwbnRyT2RZcU1xTzFaWjk3N0xiYUxNdVg2QzQzd1Y5ODhC?=
 =?utf-8?B?T1pUM3hsd1ROeFRvVVh1enJXR3RMaFZGY25sS1owNEhYWkR5MktTaUt6ZUg3?=
 =?utf-8?B?NitVY09zUERPdXhMbTU4UnpMcHozUjdvb1VWTlFoaGI2aXJPeWtoMTZ6d0g2?=
 =?utf-8?B?eHhxZ2VqZkk2NXh3ZmV6cUNrMGxnWUpNVTlLZE5uNk9tRmJuZUVHYTdVK2F4?=
 =?utf-8?B?a2JjcGZOOHpVbjgxRU5vVzVZZ3loR3BUckhoRkc2VVE4ZVhsQ0V0Q2xlaXdK?=
 =?utf-8?B?T1FJWEwvbG5RQjIwMVBSbHRUenhocm5vb2xpQXdJWCtzcnByLys2NEVGU2Z4?=
 =?utf-8?B?dEQrcU4rblRlNXQ2MVl4VnZDc2hlWUg5aTVSb2lLb2UzMGNkd2NYL3lJTTJP?=
 =?utf-8?B?UE9tMDFmeVZ0a2FTQi9zNG9STFJhZVVSRzQvdFJRK0NWQmdtdEZNcWwvZmJ4?=
 =?utf-8?B?cCt6NXFJL1hERGs0M2ZZc2lhNUNhNWxaMmxSWlhtWEZTVjlhalBVTEFBR3c4?=
 =?utf-8?B?WEJGTWFWTm1CV3lWRW4raUNlQ2VnVmwwUWJDZUFtenJUajNLbXF6WUxwQVpk?=
 =?utf-8?B?amNybjhWd0NYaHNNK3p5UXRmNkJabm1idHFPVVB4QVZ6S3hXOVl1UlhDYm1Y?=
 =?utf-8?B?Z1ZSN1hQenBhcUIza3B5VEpwNy9SYThLNGk1RGtvL2FVaXhtbFRTQ0FyUG5y?=
 =?utf-8?B?dnk1TnFuRmx0bDJOc1MvR25hTWU1eTN2Lzc1eWxJeU9tS0ExajAzem9ZeVFH?=
 =?utf-8?B?ZHBNVzh1VGhOVHNJaTJ6VGFHeUFYL25iVko2dXBSdzVzRzBaaWRpZGlNaGRK?=
 =?utf-8?B?UldlMGtCN3YvZDVxZDBaWFVNL3hDVHR4ZzFMQnpHY0QyaHBabktYZS9zY09G?=
 =?utf-8?B?aENhdGlORWtOUVMwVzhweW5BVDY2M3NzblVOM2tLcUcxS3E1OFdMREpFK1ZQ?=
 =?utf-8?B?b1FvNDEwUDVGeG45eHV1NkVEdkV6WFloNGtVSkxMd0QrQTd1UUdJMnhvb2Js?=
 =?utf-8?B?L01SV1JPNC81ZDlLRFIxc2NIUjg0Z0tWd3pSamNmQldsRmp3c0JkY2RFTmlZ?=
 =?utf-8?B?STl3cmRlZTYyVVRlTkV2SGVMcmtWS3h1bVdncDlGcE84UEFwWWtLNHJGem9U?=
 =?utf-8?B?ejVBRUV0M29raWliTjgrQklQM1FrTzg5cnJuUi9QamVwVUJYRzhVdjVkNG15?=
 =?utf-8?B?OFRzeWRjZllsMW8vL21rTzVZeUIxZWVLTkR4MVpTY1RUZml2YTdsckZuQmc0?=
 =?utf-8?B?M3Jhdk92SW5MYXluQlI5dWtVbVhqeVhjbWpKRkJGWkd3STdwelVTcHNoQ3cv?=
 =?utf-8?B?Yi9Ka2tyMGRkUkNFQ0kvMGtjTTNtZnN1VUlldmt0OE5mQnJyeVBrUUhhMU9h?=
 =?utf-8?B?c1dTQyszaXhXKzJycDZJVW5yWmNsUkVReU1ESzU5VkVqd0tzNXFWaDFaRjhj?=
 =?utf-8?B?RzRMcHJpZzRzNXZQNXN0eUo5citaQVN1Wmt4TmZON1ZLSldxcGJINXhKeUgy?=
 =?utf-8?B?cUlFbU5HblZTcTFqbGEzTHVYaDIwSEp3NUNreTRISDdTWWRWazlkdTBlaVF3?=
 =?utf-8?B?SFFtZWM5WFFHNjMrakhqbERjeFF0S3Fpd213ckFUVmRqZ2RsaDF6NlkwTWVu?=
 =?utf-8?B?NzdUTzk1UkpBemhIcTNqL1d2WjZHdjN1K3BzMVFpTUluWTNRamxkZ3psNTRx?=
 =?utf-8?B?Mko4aUplVWhuV1pMQjJaSG5XV2pwM3BUbExXejhPQk1CWHVQNjI2R0krV1l3?=
 =?utf-8?B?NDNBbHJPQmRRa0UybHlVSHZqeWI3NSs0bktaQkxLY0dSaWpZOHRsK3djb0Zh?=
 =?utf-8?B?ellHM2szKzRqNnIrR0pOb3ZxTkdRLzJNU1V6aWp4aTA2bUZSMjhGeVBTd1JW?=
 =?utf-8?Q?t61BXl?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8205.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(366016)(376014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RllzTE5wUVJvRzFpUEVHWU44ckp4dVpjT0hrWndHZlZTM3FjY2l0L2RlRkwx?=
 =?utf-8?B?U0FDTHNNWHFnVmJPOEJZbW56WmZkN1hLRFB2MmRxZHpSbnMwWFFETTNaVEts?=
 =?utf-8?B?MmdHVFU0RHkyZmM2d1htdXFLRlkzOFlubkFmTnlveHl6VFRtOHlOdW9kelVY?=
 =?utf-8?B?UTJDV25mcWljMHA3c3hhNnZFd09xaWRRaUFnYlJWTUtGVTBXdlJOU3lCdVZE?=
 =?utf-8?B?RXBCWW52MGNERGFrTEdIOWpxZFgyU002cWZncnpRUFFxNFAzMTRnL2FnK1k5?=
 =?utf-8?B?Q1ZPMGpwb2xrbVllc3NRWHk0dFlNaVNnbzZyMjhUK280R2RjTjJzZnpDZU9F?=
 =?utf-8?B?YTREZ0NTdGFOZzlVMzd2eHcvdWF2bUp0ZFJYR0Z0OHBuQ1JPN2R4Q25FU1lt?=
 =?utf-8?B?bUd0cGVQSTUreWpUakxJR1U2K2d6eDltcFFoMTIvTnlUdmpWdXlXNnRZM1Q4?=
 =?utf-8?B?aWtxSmYyUW1LYVdRZDFES1lCdTI1bktrcXA5aGRSTjNGNDNONkJycjhiejJM?=
 =?utf-8?B?aXM2ME9ZUmdUQ0VpSkNuV1BJTFVOcWxmUzN2ZFVwcnBiZThyRitDNTgvY1N3?=
 =?utf-8?B?SFVpSzZ3VFFhQmVORTloV00zclp0VHJ2MitTYlpDNDBoZ3g2S3YrN01odE9H?=
 =?utf-8?B?Q0FMdkREK3lEYUpVSnh0clQrdlQ1MS9SQmY3YU5FSjRZNHFqRXY4Nm45SGVk?=
 =?utf-8?B?ZFRiUGx2VjVKNzF1UktJc2dmUW5TT25NZVI1ZEo3VFJtMEI5UGkyc0Y2Q00x?=
 =?utf-8?B?dFI3WkdabXNnQjVXV3gxaTJwZzJZcnZDWUpkL2FSYlpac3ZnSXRuellwQ3FO?=
 =?utf-8?B?Z3ZDWURSSFlMaHQwRFhONmJWMTJDWmNIV21ZM01GNExCL1BrOUxVdmltSjdN?=
 =?utf-8?B?NjdMZko5K1JIb1FibThKbVMvMFA2MUVYZzdZRnhkdk90bHI2ZG9RTWpjN1Nx?=
 =?utf-8?B?Rm9YRUhJUGtBSUt6M2J1SXp1ZVc4ek5aNmRJQnhMN0VhekJjMmNPajFxZFlN?=
 =?utf-8?B?MkZQeVlyS0dPRzlES2NzYXpnNXoybmp4N1NkSDFpOGhBWUE4U29QN1dqZ002?=
 =?utf-8?B?cFRKUXJ2ekxwVXZySklNUXRPUnNEVVVoS1lTWmdDZlFMb2FYZk5iclhGdmRM?=
 =?utf-8?B?a2dLa2hBL1RWdm5GSnBDTWJBN091bS9BL3YvazkwVWY2SHVETjlEMEMwNE9q?=
 =?utf-8?B?VjdnYXBha1lMYUd1ajdjZjJQSkFZM0dNU3JYU0M4Zm5pRUk5K0lOSHUvWGhW?=
 =?utf-8?B?RHg3S05WVjZnSXh2clp5M2ZNb3ZTSG03UGszL1YzbXNTQ2pvMS9iblJRMTVl?=
 =?utf-8?B?M05rYWxCRkRpNGtUamR1NWM2YktDWmZCTEIwVXhkejVGNnl0cXcrbTI1RHZU?=
 =?utf-8?B?a0I0SlZ0ZXhEN2xSQjIwc291ZFlxMFVaR0Nzbzc2ZzhkRzlCL29KWE83TlFN?=
 =?utf-8?B?dE9aeWJBYkVxUUdVd2RxcERMSDZ6RGJKZzFQU2NFdGhyTmd3ZmVuM21JVTJs?=
 =?utf-8?B?WlFzZHFrR2pwdGwrVzRSQURuQnZkblc5WlNTRlFCUVpUMUxNSlEyd1pHN0Zp?=
 =?utf-8?B?anRCSU9zZlRtR3RDSnZzUkNBNEo0MkFqc29BMC8yQnYydGRlSndDYlB0U0Iv?=
 =?utf-8?B?eGoxWFQ5VEJsMmJvS2w0Yk9rR1k0RlhQZHlna1JKUkFyTk9NMDRLMnF5Q3ox?=
 =?utf-8?B?OXhuZzFMYVVuREZlT3hPUWhkRXA0M0FwbE01QnFOOWlUS3BmVGdaYzRReWJh?=
 =?utf-8?B?djN1K0gxaG1FU3JJdUcrOCtLL2pvQ25jSDBBTS81MW4rWldJSGpBd0F3aWh2?=
 =?utf-8?B?RkxuemEvMTlQSTc5S2p0d3VZay9FRCs2cmUxcmVSVjQ2QU56Mm9vS2k5VzF5?=
 =?utf-8?B?ekpIVFhNdDhnZk1jcVhEZXhZUFpIOFFGb1lFRXd6WTRZVGFsMGJGZWRQZzdB?=
 =?utf-8?B?VDhXSlh4MVNtMVhxdTRUeU52RzdMaW5DNC9hN0daS0ZSbGhYZi9zd2dkSXdQ?=
 =?utf-8?B?ejZVOTJNRktxSUZsVFpucmFXWXFLN3JZeHBkaWpPaTNRbDhUdmVWajRMd3dZ?=
 =?utf-8?B?N3dtc3EzcHBXdzVvRUxTM2RIbW5PRi94aFBXdUttM1FrYVFhekpETEpwY0dj?=
 =?utf-8?Q?izo/ZsCr11fLLSuGAj4w/m3rV?=
X-OriginatorOrg: silabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2acf8c4f-a69a-4ef5-eb1b-08de39995f78
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8205.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 16:13:22.9560
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 54dbd822-5231-4b20-944d-6f4abcd541fb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IZz8lnyxwcoNj3vJVBLjrK3mXvwKSEki3DyuS+xR4d9dXLrqL9ujo4nJSofueopGHroUDlQNlKftX+tvPMl1NA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6111
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEyMDEyOCBTYWx0ZWRfX/w3j6oxnCjuK
 jP7IKoV3UzAkSxSq0XsxJFyo4ImZsHfYWwTi3znhfIhghZT7gy9OCJI31nSjJ3YFXef2lA1YYOy
 IxaZWjJkdtnObv1zvpcrcCcYu//kd5KHL1adqiXlrvSQwI+0hyiHglzN/ZfQwYD/QsGCNC+QIA5
 WZOiRy+4PkWNv+uc2tWJq0MwWkhjPJKF7DRNF6qNIyY9H/j2Wi165tyrL2rVdZFJDgOsTHHeFd7
 VGghlbdqLY2Z3f9PIIeos+TLZU6QmWV/tGvJkKJuRkUUhF4VEvQjgqlqHV4/UhiDr5ZzFXNfMKu
 weNw48EmRXdG79Jxn1zYw7Ll0amtSix4mGeMSHhHlYgzW7ynbSCrKwYSzP+ZVnCS0L8TdPtyHv5
 cc+nkxQjUNpFfAcW9QJZtEaTxhUx6A==
X-Authority-Analysis: v=2.4 cv=BKy+bVQG c=1 sm=1 tr=0 ts=693c3f26 cx=c_pps
 a=iJ0/73tnBOJCmN8OdmQeBQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=M51BFTxLslgA:10
 a=i1IsUcr2s-wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=2AEO0YjSAAAA:8
 a=iqUPcmWXN_vvxTOgPeMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: WaWrtXISp0wT4NwjDn6E21csZKqWNA1g
X-Proofpoint-GUID: WaWrtXISp0wT4NwjDn6E21csZKqWNA1g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-12_04,2025-12-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 suspectscore=0 bulkscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512120128
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.10 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[silabs.com,reject];
	R_DKIM_ALLOW(-0.20)[silabs.com:s=pps12202023,silabs.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:148.163.149.154];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_IN_DNSWL_LOW(-0.10)[148.163.149.154:from];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:26211, ipnet:148.163.148.0/22, country:US];
	MIME_TRACE(0.00)[0:+];
	BLOCKLISTDE_FAIL(0.00)[52.101.52.114:server fail,2603:10b6:8:162::17:server fail,148.163.149.154:server fail];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DNSWL_BLOCKED(0.00)[2603:10b6:8:162::17:received,52.101.52.114:received];
	DKIM_TRACE(0.00)[silabs.com:+]
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 43CCD3F99A
X-Spamd-Bar: ----
Message-ID-Hash: WTQOOD5LBNWU5KSBJWQTE4V2T2QWMAH5
X-Message-ID-Hash: WTQOOD5LBNWU5KSBJWQTE4V2T2QWMAH5
X-MailFrom: Damien.Riegel@silabs.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, Silicon Labs Kernel Team <linux-devel@silabs.com>, =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH 02/14] greybus: cpc: introduce CPC cport structure
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/WTQOOD5LBNWU5KSBJWQTE4V2T2QWMAH5/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

QSBudW1iZXIgb2YgQ1BDIGZlYXR1cmVzLCBsaWtlIHJldHJhbnNtaXNzaW9uIG9yIHJlbW90ZSdz
IHJlY2VpdmUNCndpbmRvdywgYXJlIGNwb3J0LWJhc2VkLiBJbiBvcmRlciB0byBwcmVwYXJlIGZv
ciB0aGVzZSBmZWF0dXJlcywNCmludHJvZHVjZSBhIENQQyBDUG9ydCBjb250ZXh0IHN0cnVjdHVy
ZS4NCg0KVGhlIENQQyBIb3N0IERldmljZSBtb2R1bGUgbm93IGltcGxlbWVudHMgY3BvcnRfYWxs
b2NhdGUgYW5kDQpjcG9ydF9yZWxlYXNlIGNhbGxiYWNrcyBpbiBvcmRlciB0byBhbGxvY2F0ZSBh
bmQgcmVsZWFzZSB0aGVzZQ0Kc3RydWN0dXJlcyB3aGVuIHJlcXVlc3RlZCBieSBHcmV5YnVzIG1v
ZHVsZS4NCg0KU2lnbmVkLW9mZi1ieTogRGFtaWVuIFJpw6lnZWwgPGRhbWllbi5yaWVnZWxAc2ls
YWJzLmNvbT4NCi0tLQ0KIGRyaXZlcnMvZ3JleWJ1cy9jcGMvTWFrZWZpbGUgfCAgIDIgKy0NCiBk
cml2ZXJzL2dyZXlidXMvY3BjL2NwYy5oICAgIHwgIDI5ICsrKysrKysrKysNCiBkcml2ZXJzL2dy
ZXlidXMvY3BjL2Nwb3J0LmMgIHwgIDM3ICsrKysrKysrKysrKw0KIGRyaXZlcnMvZ3JleWJ1cy9j
cGMvaG9zdC5jICAgfCAxMDkgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0NCiBk
cml2ZXJzL2dyZXlidXMvY3BjL2hvc3QuaCAgIHwgIDEyICsrKysNCiA1IGZpbGVzIGNoYW5nZWQs
IDE4NyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KIGNyZWF0ZSBtb2RlIDEwMDY0NCBk
cml2ZXJzL2dyZXlidXMvY3BjL2NwYy5oDQogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3Jl
eWJ1cy9jcGMvY3BvcnQuYw0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncmV5YnVzL2NwYy9NYWtl
ZmlsZSBiL2RyaXZlcnMvZ3JleWJ1cy9jcGMvTWFrZWZpbGUNCmluZGV4IDQ5MDk4MmEwZmY1Li4z
ZDUwZjhjNTQ3MyAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3JleWJ1cy9jcGMvTWFrZWZpbGUNCisr
KyBiL2RyaXZlcnMvZ3JleWJ1cy9jcGMvTWFrZWZpbGUNCkBAIC0xLDYgKzEsNiBAQA0KICMgU1BE
WC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjANCiANCi1nYi1jcGMteSA6PSBob3N0Lm8NCitn
Yi1jcGMteSA6PSBjcG9ydC5vIGhvc3Qubw0KIA0KICMgQ1BDIGNvcmUNCiBvYmotJChDT05GSUdf
R1JFWUJVU19DUEMpCSs9IGdiLWNwYy5vDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncmV5YnVzL2Nw
Yy9jcGMuaCBiL2RyaXZlcnMvZ3JleWJ1cy9jcGMvY3BjLmgNCm5ldyBmaWxlIG1vZGUgMTAwNjQ0
DQppbmRleCAwMDAwMDAwMDAwMC4uMzkxNWE3ZmJjNGYNCi0tLSAvZGV2L251bGwNCisrKyBiL2Ry
aXZlcnMvZ3JleWJ1cy9jcGMvY3BjLmgNCkBAIC0wLDAgKzEsMjkgQEANCisvKiBTUERYLUxpY2Vu
c2UtSWRlbnRpZmllcjogR1BMLTIuMCAqLw0KKy8qDQorICogQ29weXJpZ2h0IChjKSAyMDI1LCBT
aWxpY29uIExhYm9yYXRvcmllcywgSW5jLg0KKyAqLw0KKw0KKyNpZm5kZWYgX19DUENfSA0KKyNk
ZWZpbmUgX19DUENfSA0KKw0KKyNpbmNsdWRlIDxsaW51eC9kZXZpY2UuaD4NCisjaW5jbHVkZSA8
bGludXgvZ3JleWJ1cy5oPg0KKyNpbmNsdWRlIDxsaW51eC90eXBlcy5oPg0KKw0KKy8qKg0KKyAq
IHN0cnVjdCBjcGNfY3BvcnQgLSBDUEMgY3BvcnQNCisgKiBAaWQ6IGNwb3J0IElEDQorICogQGNw
Y19oZDogcG9pbnRlciB0byB0aGUgQ1BDIGhvc3QgZGV2aWNlIHRoaXMgY3BvcnQgYmVsb25ncyB0
bw0KKyAqLw0KK3N0cnVjdCBjcGNfY3BvcnQgew0KKwl1MTYgaWQ7DQorDQorCXN0cnVjdCBjcGNf
aG9zdF9kZXZpY2UgKmNwY19oZDsNCit9Ow0KKw0KK3N0cnVjdCBjcGNfY3BvcnQgKmNwY19jcG9y
dF9hbGxvYyh1MTYgY3BvcnRfaWQsIGdmcF90IGdmcF9tYXNrKTsNCit2b2lkIGNwY19jcG9ydF9y
ZWxlYXNlKHN0cnVjdCBjcGNfY3BvcnQgKmNwb3J0KTsNCisNCitpbnQgY3BjX2Nwb3J0X21lc3Nh
Z2Vfc2VuZChzdHJ1Y3QgY3BjX2Nwb3J0ICpjcG9ydCwgc3RydWN0IGdiX21lc3NhZ2UgKm1lc3Nh
Z2UsIGdmcF90IGdmcF9tYXNrKTsNCisNCisjZW5kaWYNCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dy
ZXlidXMvY3BjL2Nwb3J0LmMgYi9kcml2ZXJzL2dyZXlidXMvY3BjL2Nwb3J0LmMNCm5ldyBmaWxl
IG1vZGUgMTAwNjQ0DQppbmRleCAwMDAwMDAwMDAwMC4uODhiZGIyZjgxODINCi0tLSAvZGV2L251
bGwNCisrKyBiL2RyaXZlcnMvZ3JleWJ1cy9jcGMvY3BvcnQuYw0KQEAgLTAsMCArMSwzNyBAQA0K
Ky8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wDQorLyoNCisgKiBDb3B5cmlnaHQg
KGMpIDIwMjUsIFNpbGljb24gTGFib3JhdG9yaWVzLCBJbmMuDQorICovDQorDQorI2luY2x1ZGUg
ImNwYy5oIg0KKyNpbmNsdWRlICJob3N0LmgiDQorDQorLyoqDQorICogY3BjX2Nwb3J0X2FsbG9j
KCkgLSBBbGxvY2F0ZSBhbmQgaW5pdGlhbGl6ZSBDUEMgY3BvcnQuDQorICogQGNwb3J0X2lkOiBj
cG9ydCBJRC4NCisgKiBAZ2ZwX21hc2s6IEdGUCBtYXNrIGZvciBhbGxvY2F0aW9uLg0KKyAqDQor
ICogUmV0dXJuOiBQb2ludGVyIHRvIGFsbG9jYXRlZCBhbmQgaW5pdGlhbGl6ZWQgY3BjX2Nwb3J0
LCBvciBOVUxMIG9uIGZhaWx1cmUuDQorICovDQorc3RydWN0IGNwY19jcG9ydCAqY3BjX2Nwb3J0
X2FsbG9jKHUxNiBjcG9ydF9pZCwgZ2ZwX3QgZ2ZwX21hc2spDQorew0KKwlzdHJ1Y3QgY3BjX2Nw
b3J0ICpjcG9ydDsNCisNCisJY3BvcnQgPSBremFsbG9jKHNpemVvZigqY3BvcnQpLCBnZnBfbWFz
ayk7DQorCWlmICghY3BvcnQpDQorCQlyZXR1cm4gTlVMTDsNCisNCisJY3BvcnQtPmlkID0gY3Bv
cnRfaWQ7DQorDQorCXJldHVybiBjcG9ydDsNCit9DQorDQordm9pZCBjcGNfY3BvcnRfcmVsZWFz
ZShzdHJ1Y3QgY3BjX2Nwb3J0ICpjcG9ydCkNCit7DQorCWtmcmVlKGNwb3J0KTsNCit9DQorDQor
aW50IGNwY19jcG9ydF9tZXNzYWdlX3NlbmQoc3RydWN0IGNwY19jcG9ydCAqY3BvcnQsIHN0cnVj
dCBnYl9tZXNzYWdlICptZXNzYWdlLCBnZnBfdCBnZnBfbWFzaykNCit7DQorCXJldHVybiBjcG9y
dC0+Y3BjX2hkLT5kcml2ZXItPm1lc3NhZ2Vfc2VuZChjcG9ydC0+Y3BjX2hkLCBjcG9ydC0+aWQs
IG1lc3NhZ2UsIGdmcF9tYXNrKTsNCit9DQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncmV5YnVzL2Nw
Yy9ob3N0LmMgYi9kcml2ZXJzL2dyZXlidXMvY3BjL2hvc3QuYw0KaW5kZXggODA1MTY1MTdmZjYu
Ljk4NTY2Y2U3NzU1IDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncmV5YnVzL2NwYy9ob3N0LmMNCisr
KyBiL2RyaXZlcnMvZ3JleWJ1cy9jcGMvaG9zdC5jDQpAQCAtNyw2ICs3LDcgQEANCiAjaW5jbHVk
ZSA8bGludXgvZ3JleWJ1cy5oPg0KICNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4NCiANCisjaW5j
bHVkZSAiY3BjLmgiDQogI2luY2x1ZGUgImhvc3QuaCINCiANCiBzdGF0aWMgc3RydWN0IGNwY19o
b3N0X2RldmljZSAqZ2JfaGRfdG9fY3BjX2hkKHN0cnVjdCBnYl9ob3N0X2RldmljZSAqaGQpDQpA
QCAtMTQsMTIgKzE1LDk1IEBAIHN0YXRpYyBzdHJ1Y3QgY3BjX2hvc3RfZGV2aWNlICpnYl9oZF90
b19jcGNfaGQoc3RydWN0IGdiX2hvc3RfZGV2aWNlICpoZCkNCiAJcmV0dXJuIChzdHJ1Y3QgY3Bj
X2hvc3RfZGV2aWNlICopJmhkLT5oZF9wcml2Ow0KIH0NCiANCitzdGF0aWMgc3RydWN0IGNwY19j
cG9ydCAqY3BjX2hkX2dldF9jcG9ydChzdHJ1Y3QgY3BjX2hvc3RfZGV2aWNlICpjcGNfaGQsIHUx
NiBjcG9ydF9pZCkNCit7DQorCXN0cnVjdCBjcGNfY3BvcnQgKmNwb3J0Ow0KKw0KKwltdXRleF9s
b2NrKCZjcGNfaGQtPmxvY2spOw0KKwlmb3IgKGludCBpID0gMDsgaSA8IEFSUkFZX1NJWkUoY3Bj
X2hkLT5jcG9ydHMpOyBpKyspIHsNCisJCWNwb3J0ID0gY3BjX2hkLT5jcG9ydHNbaV07DQorCQlp
ZiAoY3BvcnQgJiYgY3BvcnQtPmlkID09IGNwb3J0X2lkKQ0KKwkJCWdvdG8gdW5sb2NrOw0KKwl9
DQorDQorCWNwb3J0ID0gTlVMTDsNCisNCit1bmxvY2s6DQorCW11dGV4X3VubG9jaygmY3BjX2hk
LT5sb2NrKTsNCisNCisJcmV0dXJuIGNwb3J0Ow0KK30NCisNCitzdGF0aWMgaW50IGNwY19oZF9t
ZXNzYWdlX3NlbmQoc3RydWN0IGNwY19ob3N0X2RldmljZSAqY3BjX2hkLCB1MTYgY3BvcnRfaWQs
DQorCQkJICAgICAgIHN0cnVjdCBnYl9tZXNzYWdlICptZXNzYWdlLCBnZnBfdCBnZnBfbWFzaykN
Cit7DQorCXN0cnVjdCBjcGNfY3BvcnQgKmNwb3J0Ow0KKw0KKwljcG9ydCA9IGNwY19oZF9nZXRf
Y3BvcnQoY3BjX2hkLCBjcG9ydF9pZCk7DQorCWlmICghY3BvcnQpIHsNCisJCWRldl9lcnIoY3Bj
X2hkX2RldihjcGNfaGQpLCAibWVzc2FnZV9zZW5kOiBjcG9ydCAldSBub3QgZm91bmRcbiIsIGNw
b3J0X2lkKTsNCisJCXJldHVybiAtRUlOVkFMOw0KKwl9DQorDQorCXJldHVybiBjcGNfY3BvcnRf
bWVzc2FnZV9zZW5kKGNwb3J0LCBtZXNzYWdlLCBnZnBfbWFzayk7DQorfQ0KKw0KK3N0YXRpYyBp
bnQgY3BjX2hkX2Nwb3J0X2FsbG9jYXRlKHN0cnVjdCBjcGNfaG9zdF9kZXZpY2UgKmNwY19oZCwg
aW50IGNwb3J0X2lkLCB1bnNpZ25lZCBsb25nIGZsYWdzKQ0KK3sNCisJc3RydWN0IGNwY19jcG9y
dCAqY3BvcnQ7DQorCWludCByZXQ7DQorDQorCW11dGV4X2xvY2soJmNwY19oZC0+bG9jayk7DQor
CWZvciAoaW50IGkgPSAwOyBpIDwgQVJSQVlfU0laRShjcGNfaGQtPmNwb3J0cyk7IGkrKykgew0K
KwkJaWYgKGNwY19oZC0+Y3BvcnRzW2ldICE9IE5VTEwpDQorCQkJY29udGludWU7DQorDQorCQlp
ZiAoY3BvcnRfaWQgPCAwKQ0KKwkJCWNwb3J0X2lkID0gaTsNCisNCisJCWNwb3J0ID0gY3BjX2Nw
b3J0X2FsbG9jKGNwb3J0X2lkLCBHRlBfS0VSTkVMKTsNCisJCWlmICghY3BvcnQpIHsNCisJCQly
ZXQgPSAtRU5PTUVNOw0KKwkJCWdvdG8gdW5sb2NrOw0KKwkJfQ0KKw0KKwkJY3BvcnQtPmNwY19o
ZCA9IGNwY19oZDsNCisNCisJCWNwY19oZC0+Y3BvcnRzW2ldID0gY3BvcnQ7DQorCQlyZXQgPSBj
cG9ydF9pZDsNCisJCWdvdG8gdW5sb2NrOw0KKwl9DQorDQorCXJldCA9IC1FTk9TUEM7DQordW5s
b2NrOg0KKwltdXRleF91bmxvY2soJmNwY19oZC0+bG9jayk7DQorDQorCXJldHVybiByZXQ7DQor
fQ0KKw0KK3N0YXRpYyB2b2lkIGNwY19oZF9jcG9ydF9yZWxlYXNlKHN0cnVjdCBjcGNfaG9zdF9k
ZXZpY2UgKmNwY19oZCwgdTE2IGNwb3J0X2lkKQ0KK3sNCisJc3RydWN0IGNwY19jcG9ydCAqY3Bv
cnQ7DQorDQorCW11dGV4X2xvY2soJmNwY19oZC0+bG9jayk7DQorCWZvciAoaW50IGkgPSAwOyBp
IDwgQVJSQVlfU0laRShjcGNfaGQtPmNwb3J0cyk7IGkrKykgew0KKwkJY3BvcnQgPSBjcGNfaGQt
PmNwb3J0c1tpXTsNCisNCisJCWlmIChjcG9ydCAmJiBjcG9ydC0+aWQgPT0gY3BvcnRfaWQpIHsN
CisJCQljcGNfY3BvcnRfcmVsZWFzZShjcG9ydCk7DQorCQkJY3BjX2hkLT5jcG9ydHNbaV0gPSBO
VUxMOw0KKwkJCWJyZWFrOw0KKwkJfQ0KKwl9DQorCW11dGV4X3VubG9jaygmY3BjX2hkLT5sb2Nr
KTsNCit9DQorDQogc3RhdGljIGludCBjcGNfZ2JfbWVzc2FnZV9zZW5kKHN0cnVjdCBnYl9ob3N0
X2RldmljZSAqZ2JfaGQsIHUxNiBjcG9ydF9pZCwNCiAJCQkgICAgICAgc3RydWN0IGdiX21lc3Nh
Z2UgKm1lc3NhZ2UsIGdmcF90IGdmcF9tYXNrKQ0KIHsNCiAJc3RydWN0IGNwY19ob3N0X2Rldmlj
ZSAqY3BjX2hkID0gZ2JfaGRfdG9fY3BjX2hkKGdiX2hkKTsNCiANCi0JcmV0dXJuIGNwY19oZC0+
ZHJpdmVyLT5tZXNzYWdlX3NlbmQoY3BjX2hkLCBjcG9ydF9pZCwgbWVzc2FnZSwgZ2ZwX21hc2sp
Ow0KKwlyZXR1cm4gY3BjX2hkX21lc3NhZ2Vfc2VuZChjcGNfaGQsIGNwb3J0X2lkLCBtZXNzYWdl
LCBnZnBfbWFzayk7DQogfQ0KIA0KIHN0YXRpYyB2b2lkIGNwY19nYl9tZXNzYWdlX2NhbmNlbChz
dHJ1Y3QgZ2JfbWVzc2FnZSAqbWVzc2FnZSkNCkBAIC0yNywxMiArMTExLDMzIEBAIHN0YXRpYyB2
b2lkIGNwY19nYl9tZXNzYWdlX2NhbmNlbChzdHJ1Y3QgZ2JfbWVzc2FnZSAqbWVzc2FnZSkNCiAJ
LyogTm90IGltcGxlbWVudGVkICovDQogfQ0KIA0KK3N0YXRpYyBpbnQgY3BjX2diX2Nwb3J0X2Fs
bG9jYXRlKHN0cnVjdCBnYl9ob3N0X2RldmljZSAqZ2JfaGQsIGludCBjcG9ydF9pZCwgdW5zaWdu
ZWQgbG9uZyBmbGFncykNCit7DQorCXN0cnVjdCBjcGNfaG9zdF9kZXZpY2UgKmNwY19oZCA9IGdi
X2hkX3RvX2NwY19oZChnYl9oZCk7DQorDQorCXJldHVybiBjcGNfaGRfY3BvcnRfYWxsb2NhdGUo
Y3BjX2hkLCBjcG9ydF9pZCwgZmxhZ3MpOw0KK30NCisNCitzdGF0aWMgdm9pZCBjcGNfZ2JfY3Bv
cnRfcmVsZWFzZShzdHJ1Y3QgZ2JfaG9zdF9kZXZpY2UgKmdiX2hkLCB1MTYgY3BvcnRfaWQpDQor
ew0KKwlzdHJ1Y3QgY3BjX2hvc3RfZGV2aWNlICpjcGNfaGQgPSBnYl9oZF90b19jcGNfaGQoZ2Jf
aGQpOw0KKw0KKwlyZXR1cm4gY3BjX2hkX2Nwb3J0X3JlbGVhc2UoY3BjX2hkLCBjcG9ydF9pZCk7
DQorfQ0KKw0KIHN0YXRpYyBzdHJ1Y3QgZ2JfaGRfZHJpdmVyIGNwY19nYl9kcml2ZXIgPSB7DQog
CS5oZF9wcml2X3NpemUgPSBzaXplb2Yoc3RydWN0IGNwY19ob3N0X2RldmljZSksDQogCS5tZXNz
YWdlX3NlbmQgPSBjcGNfZ2JfbWVzc2FnZV9zZW5kLA0KIAkubWVzc2FnZV9jYW5jZWwgPSBjcGNf
Z2JfbWVzc2FnZV9jYW5jZWwsDQorCS5jcG9ydF9hbGxvY2F0ZSA9IGNwY19nYl9jcG9ydF9hbGxv
Y2F0ZSwNCisJLmNwb3J0X3JlbGVhc2UgPSBjcGNfZ2JfY3BvcnRfcmVsZWFzZSwNCiB9Ow0KIA0K
K3N0YXRpYyB2b2lkIGNwY19oZF9pbml0KHN0cnVjdCBjcGNfaG9zdF9kZXZpY2UgKmNwY19oZCkN
Cit7DQorCW11dGV4X2luaXQoJmNwY19oZC0+bG9jayk7DQorfQ0KKw0KIHN0cnVjdCBjcGNfaG9z
dF9kZXZpY2UgKmNwY19oZF9jcmVhdGUoc3RydWN0IGNwY19oZF9kcml2ZXIgKmRyaXZlciwgc3Ry
dWN0IGRldmljZSAqcGFyZW50KQ0KIHsNCiAJc3RydWN0IGNwY19ob3N0X2RldmljZSAqY3BjX2hk
Ow0KQEAgLTUxLDYgKzE1Niw4IEBAIHN0cnVjdCBjcGNfaG9zdF9kZXZpY2UgKmNwY19oZF9jcmVh
dGUoc3RydWN0IGNwY19oZF9kcml2ZXIgKmRyaXZlciwgc3RydWN0IGRldmljDQogCWNwY19oZC0+
Z2JfaGQgPSBoZDsNCiAJY3BjX2hkLT5kcml2ZXIgPSBkcml2ZXI7DQogDQorCWNwY19oZF9pbml0
KGNwY19oZCk7DQorDQogCXJldHVybiBjcGNfaGQ7DQogfQ0KIEVYUE9SVF9TWU1CT0xfR1BMKGNw
Y19oZF9jcmVhdGUpOw0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3JleWJ1cy9jcGMvaG9zdC5oIGIv
ZHJpdmVycy9ncmV5YnVzL2NwYy9ob3N0LmgNCmluZGV4IGY1NWZlYjMwM2Y0Li5jM2YyZjU2YTkz
OSAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3JleWJ1cy9jcGMvaG9zdC5oDQorKysgYi9kcml2ZXJz
L2dyZXlidXMvY3BjL2hvc3QuaA0KQEAgLTgsMTEgKzgsMTMgQEANCiANCiAjaW5jbHVkZSA8bGlu
dXgvZGV2aWNlLmg+DQogI2luY2x1ZGUgPGxpbnV4L2dyZXlidXMuaD4NCisjaW5jbHVkZSA8bGlu
dXgvbXV0ZXguaD4NCiAjaW5jbHVkZSA8bGludXgvdHlwZXMuaD4NCiANCiAjZGVmaW5lIEdCX0NQ
Q19NU0dfU0laRV9NQVggNDA5Ng0KICNkZWZpbmUgR0JfQ1BDX05VTV9DUE9SVFMgOA0KIA0KK3N0
cnVjdCBjcGNfY3BvcnQ7DQogc3RydWN0IGNwY19ob3N0X2RldmljZTsNCiANCiBzdHJ1Y3QgY3Bj
X2hkX2RyaXZlciB7DQpAQCAtMjUsMTIgKzI3LDIyIEBAIHN0cnVjdCBjcGNfaGRfZHJpdmVyIHsN
CiAgKiBzdHJ1Y3QgY3BjX2hvc3RfZGV2aWNlIC0gQ1BDIGhvc3QgZGV2aWNlLg0KICAqIEBnYl9o
ZDogcG9pbnRlciB0byBHcmV5YnVzIEhvc3QgRGV2aWNlIHRoaXMgZGV2aWNlIGJlbG9uZ3MgdG8u
DQogICogQGRyaXZlcjogZHJpdmVyIG9wZXJhdGlvbnMuDQorICogQGxvY2s6IG11dGV4IHRvIHN5
bmNocm9uaXplIGFjY2VzcyB0byBjcG9ydCBhcnJheS4NCisgKiBAY3BvcnRzOiBhcnJheSBvZiBj
cG9ydCBwb2ludGVycyBhbGxvY2F0ZWQgYnkgR3JleWJ1cyBjb3JlLg0KICAqLw0KIHN0cnVjdCBj
cGNfaG9zdF9kZXZpY2Ugew0KIAlzdHJ1Y3QgZ2JfaG9zdF9kZXZpY2UgKmdiX2hkOw0KIAljb25z
dCBzdHJ1Y3QgY3BjX2hkX2RyaXZlciAqZHJpdmVyOw0KKw0KKwlzdHJ1Y3QgbXV0ZXggbG9jazsg
LyogU3luY2hyb25pemUgYWNjZXNzIHRvIGNwb3J0cyAqLw0KKwlzdHJ1Y3QgY3BjX2Nwb3J0ICpj
cG9ydHNbR0JfQ1BDX05VTV9DUE9SVFNdOw0KIH07DQogDQorc3RhdGljIGlubGluZSBzdHJ1Y3Qg
ZGV2aWNlICpjcGNfaGRfZGV2KHN0cnVjdCBjcGNfaG9zdF9kZXZpY2UgKmNwY19oZCkNCit7DQor
CXJldHVybiAmY3BjX2hkLT5nYl9oZC0+ZGV2Ow0KK30NCisNCiBzdHJ1Y3QgY3BjX2hvc3RfZGV2
aWNlICpjcGNfaGRfY3JlYXRlKHN0cnVjdCBjcGNfaGRfZHJpdmVyICpkcml2ZXIsIHN0cnVjdCBk
ZXZpY2UgKnBhcmVudCk7DQogaW50IGNwY19oZF9hZGQoc3RydWN0IGNwY19ob3N0X2RldmljZSAq
Y3BjX2hkKTsNCiB2b2lkIGNwY19oZF9wdXQoc3RydWN0IGNwY19ob3N0X2RldmljZSAqY3BjX2hk
KTsNCi0tIA0KMi40OS4wDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmdyZXlidXMtZGV2IG1haWxpbmcgbGlzdCAtLSBncmV5YnVzLWRldkBsaXN0cy5s
aW5hcm8ub3JnClRvIHVuc3Vic2NyaWJlIHNlbmQgYW4gZW1haWwgdG8gZ3JleWJ1cy1kZXYtbGVh
dmVAbGlzdHMubGluYXJvLm9yZwo=
