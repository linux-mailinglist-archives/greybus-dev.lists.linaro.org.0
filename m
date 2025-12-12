Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id D3284CB93DA
	for <lists+greybus-dev@lfdr.de>; Fri, 12 Dec 2025 17:14:17 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id CCB93400FE
	for <lists+greybus-dev@lfdr.de>; Fri, 12 Dec 2025 16:14:16 +0000 (UTC)
Received: from mx0b-0024c301.pphosted.com (mx0b-0024c301.pphosted.com [148.163.153.153])
	by lists.linaro.org (Postfix) with ESMTPS id 148E53F99A
	for <greybus-dev@lists.linaro.org>; Fri, 12 Dec 2025 16:13:37 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=silabs.com header.s=pps12202023 header.b=fk6OKU7F;
	dkim=pass header.d=silabs.com header.s=selector1 header.b=dvi7sxWQ;
	spf=pass (lists.linaro.org: domain of Damien.Riegel@silabs.com designates 148.163.153.153 as permitted sender) smtp.mailfrom=Damien.Riegel@silabs.com;
	dmarc=pass (policy=reject) header.from=silabs.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from pps.filterd (m0101742.ppops.net [127.0.0.1])
	by mx0a-0024c301.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BC2uEiB2563949;
	Fri, 12 Dec 2025 10:13:28 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps12202023;
	 bh=XCWpRqnSfKi71u+IlW5PChjFVPdCV9pnlfQe4i7zT3Y=; b=fk6OKU7FCGTi
	z28+0FV4O3CX8VImeKpaQveo1/W5mXue/lg7l/4PPZczO+qbTCIJMStl+gANd6uJ
	vDgxxs5kDyuYsnBjVoi900Dk5NtEG76oW4cAwP393eHIFbnGZASioSlAwFL6kWuB
	gMe171+pZnZ4ai5LYs+TPE39N4ODQRvYw/atin7FOpqY3zpbmUgu5htP7jU7+DuY
	eRwZ7tg9F6r+Om6zOz1yiyL6CWIsjbwQF0ak0oqC6SVZlKt3bKHyyX3D80kyiB19
	cZtrIVyXoy0jdfa8YJniR+YDH3+CcQtgllwCrHMxYXB9eLhNlP4WZDlAWy/tNfxP
	l+Dg4+NB+Q==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11022100.outbound.protection.outlook.com [52.101.43.100])
	by mx0a-0024c301.pphosted.com (PPS) with ESMTPS id 4aykqe47hk-4
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 12 Dec 2025 10:13:28 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wfXpaR2tb1G5m4Ht8OlZMrZkKUzC0SbcJc+UwT4kjvfjelgLcrp6zSX3RQsoyOwbJbY+6niDjxO6paP1UlJBiHNm9Ftu7CtpA6jdqF1RO6aD2GXzYx50a42TjSfnvRYCNriht5sZ2mNg5lePwaGQP18sqcLvNylwbGBHBPxl9O6IL2pJBM0pi2Z4DsUabt/t342+e/16q49xDBN6ZzyCfT77oz71fIAj/bLyhyw3hRhyssvAKiiP9bGTLk0ol7v0iw6kTys0qz0luVm50DApiH5SlOmzkFxxFthu/M7rUHCb5wHbNN/4jpRtFBK56nEloYPgs3i/yMr1ssqTpwzUrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XCWpRqnSfKi71u+IlW5PChjFVPdCV9pnlfQe4i7zT3Y=;
 b=kKHCxuCUx+EYoAWrigPAP2g6cwVal/rlDo5q39uYF2gVHo40ZvrtYSmyG8R0gUWInnn1THVf6+0cjKVondVgU2em7z6O3h58aWdvt5tDOM683Mexd3GH+GAZOU5oeRBWBI8GkFM5ePhubmEbwOPcecWiYJMHhGi3zqQzzZMwuSO3YfNp1pX86rE9dj7AUD3xVouWycnFKryuU4p8s9x4Hc46bHKEPnByvh9mjRB3YONPdjzp0ndwybGhcO/FX7yp4UwXddj/Ybu7IztIdD6I/v/a0hoH7oKp8bCG42rm1ay2rTIHs6F1ii4a+saDVOx+FtVaNlUBAfu7q9TW82RiHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silabs.com; dmarc=pass action=none header.from=silabs.com;
 dkim=pass header.d=silabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XCWpRqnSfKi71u+IlW5PChjFVPdCV9pnlfQe4i7zT3Y=;
 b=dvi7sxWQ9kDACA7b3bi22jdFg1auVcLVAx4N9R+x5lvgpbPaflaPXUQNJS/AVbfXZPNe6bSNMATy7qGw3Hg0pm/pkS+dqsJPydukurkyqug9byHBMyk1KqEc/kG3ssX904B1fFL8SD/TT7SJSmSH4aaNe/VH9Gv1LWQKixbNCPo=
Received: from DS0PR11MB8205.namprd11.prod.outlook.com (2603:10b6:8:162::17)
 by DM3PPF7468F7991.namprd11.prod.outlook.com (2603:10b6:f:fc00::f2d) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.9; Fri, 12 Dec
 2025 16:13:27 +0000
Received: from DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::2de6:bc88:2af7:3583]) by DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::2de6:bc88:2af7:3583%3]) with mapi id 15.20.9412.005; Fri, 12 Dec 2025
 16:13:27 +0000
From: =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
To: greybus-dev@lists.linaro.org
Date: Fri, 12 Dec 2025 11:13:01 -0500
Message-ID: <20251212161308.25678-8-damien.riegel@silabs.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251212161308.25678-1-damien.riegel@silabs.com>
References: <20251212161308.25678-1-damien.riegel@silabs.com>
X-ClientProxiedBy: YQZPR01CA0176.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:8b::25) To DS0PR11MB8205.namprd11.prod.outlook.com
 (2603:10b6:8:162::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8205:EE_|DM3PPF7468F7991:EE_
X-MS-Office365-Filtering-Correlation-Id: f2951601-2ef0-4fbf-6262-08de399961da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?U2I3ZDdHUWFaaGlFbHFaMjQwVFVhU01idUluVUpyTU10cnUvaDFTZlBJZVBy?=
 =?utf-8?B?NHBBQWFZWmFBMkxXTG5lQm15aXNQa0IwR05FM3MrTERqcFBjTUpPYVFWUThr?=
 =?utf-8?B?ZmxiR0tCWVNYY01yT0FDMGoyaDZiZEVjODlXc3dCUzIvczRZVnJLT3VjS2Jh?=
 =?utf-8?B?SWVXMlR6ZGlxaG5kZFNRR2hJRTBjS3BFbzFGOWZSay83dmIxcWZpdjF0eVNT?=
 =?utf-8?B?VVluUlBVZUYvSTdqWGUzTDdDRVlvVTRVMU15SnVzS1RjVHVUYnFvWFJSQjdM?=
 =?utf-8?B?YlNxT3pwZXN4a09BTDQrOTVpK2N1UC9FNk5taG8vVnJSYjFkTnB4L28zZ3hu?=
 =?utf-8?B?NHgwSmRZN0JSVGh6cUdKVCtObWRST0RDSlBhY29UbWVnaE1TUE5VTXlDYmZF?=
 =?utf-8?B?NnNkR2Vnd0pXajJ5cSt3RXg1M2I5ZGZmVzZrckUzU3pkUkJ3ZEJRVkY2TzV4?=
 =?utf-8?B?ajMxMEU2NTFQeVc4bUhGNVJMTjhoekdUS2xoZGZBTGI2Wjl0YU9RNytrZm1L?=
 =?utf-8?B?SjcwdWtlRlh3V0dGaUJXZ2kvdVhweTFsRzd5Qm5xWmxVWmFSVHlOYWlIdEpn?=
 =?utf-8?B?ZzRTaHErWmlQM0hBbHJQanpDR1ZzSVpkNHAvWjNpczBhSVFuS0tXbkdNTnhO?=
 =?utf-8?B?NTdsRWJCV3ZCaWEyUEpCTHU0WXppenZqYkZOb0hNaHV0R243aitvTUVoOHZE?=
 =?utf-8?B?MUdPZ0cyVnRZN0czaWx2eTFTTWZSVVAraGFhNmdVdnBZRTc1YWZNcTN0MUt6?=
 =?utf-8?B?Y1V5Q0Z3dlhBaVdaaFM2RkpaSlBlQkdpeHIwS1Z2OUc5WnlWNEhvOTBtSCt3?=
 =?utf-8?B?NUltV0JSdVlGSjJISTh3NldBbDREZWZZYTltbVB1UnFCSzVYWmd2eFNYbm03?=
 =?utf-8?B?WG1pWko3VjBIdlQ4V3Fnc3BwVTBBZitsN3JKRVJHL3dEajcvNHppWnFXSzY5?=
 =?utf-8?B?bDNlbHdPTW84dTlwRjZubElsS0c4MDN5WVVXTi90R3FXNVhVanNmaFNuTFVs?=
 =?utf-8?B?YTE2cVF0eWYyekpsa1VLazdGb3dyYjFLTTBLRmtQTlRqOFJSNlRiSS9BdFR0?=
 =?utf-8?B?bEN1OE9lVm90cXlXTkZGU0hRbmg4MWtYcjhnM0hmb3U3WjJuT1JLYXNWa3JR?=
 =?utf-8?B?amxrc0ovRDFlZkhOY3BRZ29VeVBjR29uMG1KK3NwbGJVOVZCampUR056RGwv?=
 =?utf-8?B?RlNlREJIT3lLVHcwR1A1Q1BRenVrV2xrY0NaSmRnc3l2S205TmN5SnRscGtO?=
 =?utf-8?B?aVVKVTlYaGJFQVZmemF1U0U2WHExSWp0bkNCK0JYampPS1A5RXFLQ0ptSmZy?=
 =?utf-8?B?MEExSmhmWndMTFh0QXFzeHlaSmhCNWh4aHpUdXdVMnhKVDJjN3hmT3E0Wjky?=
 =?utf-8?B?Z3luR0l3alcxcjRLRXUyc055Y2Z2VHE3L1BHRE91RVJGdHZCc1JKNFZwOTBS?=
 =?utf-8?B?ZzE4Zm45UlpqZ1VmQlh5OS9aSzJDZ2R6MG9ocnFYUjh6QTFEOGE2Qlc1dzdF?=
 =?utf-8?B?a05odjZDRDdVMHBGL2VaU1VMZkwyVGc0V2ozYTRkOWJaeUVqZTd5TlArc2hj?=
 =?utf-8?B?d3NSMWxxWDVhVmI0eW1SVnphSk1aSXhaYXM5N3E4UDc4TU5aajY0REhaQklP?=
 =?utf-8?B?QnZRaTFuWm81RzltS3ZkUU9sakpId3dDRGJxbmwya1ArWmt3aVNnb25aN3Fo?=
 =?utf-8?B?VDFIRkhFUk5JNWVpV1p6RG9jSHZ1QThCY0N6RnUrcVRZWm56YXhEVjhvQ2NR?=
 =?utf-8?B?cE8rVzZJbnFxV1duZGhrZlA5QzFzd1cwclJvOVRmVmowRkppbFlZOFhJMU0z?=
 =?utf-8?B?TExvM3RiQTRWNFFvdHVEZHIyNzlURER6SE90YWZLYnZzTk1JL082SVY5OTlY?=
 =?utf-8?B?VFBhaHdyTUw4WWdRQzdYQVBJRHRLck1UMytZYVBqUWRKM2h0ZXpLRGp4TE83?=
 =?utf-8?B?cHFtc2Q3NmltcXJFclJTellRN3ovb0JRUHZsd3N3bXMyM2RzRDRQOFdPTmF3?=
 =?utf-8?B?d2k0OEpISkhIb0N4TEZjU2tlSmVuNG04bTgvWTB2eG9zN3VFbTZIQkh1TVl2?=
 =?utf-8?Q?mao1bu?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8205.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?R2N5WFBodFNpb1E0dnR0bGQ2REwxc3hZVS94QzRtR2h4RHhLL3IyY0FzU1dN?=
 =?utf-8?B?YWxtZTNXWDN3RUxCSlhlZ3lBallsVStDcVBiOGx4UnJTQnJSbUxvd0swMUpW?=
 =?utf-8?B?N0JSblJCNXBiUTZORHUrYnh5L25yTm94K0plNVNEVWtEblB4dllReGZTa2Mw?=
 =?utf-8?B?aGNyWU1FZ2Z0azJzbTRVODExZVJkL016aisvYjBCaExjUWpsbVlmR0IvUkwz?=
 =?utf-8?B?b0pFd0ZkQUR4djJNQUJ4bEZPeG1CNlF1VTd6NUgwS1cvQmN1cTNhc2xROTVw?=
 =?utf-8?B?QStUR21aN040a2FsMnhlTVJBMVBwY3dUSXZrdldEemo0YWwxWUUzMDVYY3BL?=
 =?utf-8?B?ZEVIbzB4RmFGS25Bb3NJeWU5dWJocTRsdFRBajlST2xUeVdHN0FXd2VyVE0x?=
 =?utf-8?B?R1hDZFpyUXVoYktJOVRIM0pjZHFkK2VZRlJDa0dnWTBaa0VEQXBvaVBQQVFZ?=
 =?utf-8?B?Mm1DK3lpMG5FSGY2UTJ2MkEzY015SnFHcVZoMXJtbnB1aTRhVGgrZUtRTGRJ?=
 =?utf-8?B?eVlpWTlhZUdzRG9keG1iTWsrS0NSYjlod3VmQXJrK085QjFKaUN1bnBkTTE5?=
 =?utf-8?B?YzRScFpHMlVtckZaWHhoa3FMYU1sWjBjOGZnR2tyWnhpVkVtODVYS2xhUS9p?=
 =?utf-8?B?c21qYysrMXJhcktZMXA0RXZTYUk4SnQrSW91T1hvM29YUDdFK3psNmZLNElV?=
 =?utf-8?B?WkVDNUUrT1ArUDc5dXlOaFNOMG5LaUp4UUtHQXVRSGVacmlXSzVaWjN2c2hq?=
 =?utf-8?B?VFV5MHErVVB1UldxWGZuWXJkajcvM0tkY3BNNVR0UjdNekZlVEw1Uk41Y0Fl?=
 =?utf-8?B?WWNiQVJmc0NyMVJZcWhLYTVJK0x1SkFrOS9VSjlxRERMeVlHek9KVStLUVJN?=
 =?utf-8?B?SzBiaERMRWNqdkJ5eVhTcHRhRGVQa1RtSVZuRE0rMjBYQ0FWVUlWN1gzRnVn?=
 =?utf-8?B?ZlBGWFozQUZoZzlSWjNtOWJNb0VScmN0cStCTUdDZ2MvNXZNTmcyU29SN1kx?=
 =?utf-8?B?aVpWNGhHaUFwMmZPbm5GbjdtZ2h6Zzdwb0hsRHZyMlNZazNLNmV1MlBzYnJn?=
 =?utf-8?B?OVBlcjF2ZFdOYkNwdlZJSGNNbU1hckIzcEhhNlp0SXBycEpvZ1JtM2RJWHdP?=
 =?utf-8?B?RjlYa3pkc0VsYjdTRVpieXZ1TC9lS1EyZ3RZT2JKdXdXYVJZR3hMdTZTeTRw?=
 =?utf-8?B?MC9yTk9KdzlaVXc4RmtjKzVNbjEwMHVQclZLTC9JOXBBY3J5SW9odnlnZitT?=
 =?utf-8?B?Zmc4V3hPZXBkMjF6Nm1YbWoyVHJEMG9MT056SFBpQ05oenpjbDR5cndRNmFV?=
 =?utf-8?B?R05LVHNNWGdFSmdlSzBqTDQvYmNDRXdwRVhYb2h4YlFjOUFxZ29HTERLZ0Ey?=
 =?utf-8?B?aUpyUW4rNmlUOHFJcEFPVE1VS3Z0cGhzQ3RQVTdpdU8yVnRZM3VCR2tmSjYv?=
 =?utf-8?B?OG9qYkpLVUY4Vml1TDhtcjVoNW5rYW1wWk81bXc0SEowQXptQmJaRVFLN3Zs?=
 =?utf-8?B?ZWhubEc0NUtDS1NxUW5UdHB0Q3BkR2EzT1p1R2R5WFV2ZHlMMlowYnQ0TEFW?=
 =?utf-8?B?M3poeW9xZTB1SDdQVWFIdUh3UmtQSjJaMW4xV3I3K3l3UlRKTHUxSG1IRnMv?=
 =?utf-8?B?Nk1jYmxyZUtsdUZ1bXZnNzFzdWQ0dGVLd0x0ZzRUcUtuLzRNWG1UdEExc1ZE?=
 =?utf-8?B?MG9Ecjl6S2tYeTJQZW90QlVWbGJqR2taVnhlSGRhZnh6K2tGQ3Rod1l3LzdF?=
 =?utf-8?B?RXFSSlMza1RkZzBLM05IemJrdDNHTE5pMkxRUXBTZ1BRK0JlZ3BuRTYzZVFv?=
 =?utf-8?B?T1Y1QjBIeVNZeEpzemp3dzhIY1RmcFg3QTdJdm1LY0NnSlBPK2ZTWnJ3dXhX?=
 =?utf-8?B?NlZWU0tWNVYvMkRwcnpDMDA1QzdIMkJuamdhZm9ncHZDWDBobVpCTGFRc25T?=
 =?utf-8?B?KytKS1YvZWluRGoxUzRtVi9WV080Z3pQZk9ZbU53R1pGQ1BOWHpDOWdIRXlF?=
 =?utf-8?B?VzRLOTNhMi9UTzg5cU9ad0IxRjA3TGVhajJGRmNiWUgzRlIwUDlubXlsYTZs?=
 =?utf-8?B?WWtLZ3FpK0JnS2pyUXZ6S3lncGN6NFU3Q2dRb01HTWNHeDdISEFybk9pclp6?=
 =?utf-8?Q?Xm0JyIwRyZTvt7ZEgtRAneWFu?=
X-OriginatorOrg: silabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2951601-2ef0-4fbf-6262-08de399961da
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8205.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 16:13:26.9122
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 54dbd822-5231-4b20-944d-6f4abcd541fb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qa63zTQqeiA2v2TRw/KTIukg7P2ZyjU8xzY7Njoj+1Us47MjN3QV5nzGWdoqehiPpKIV38J5RkRvDzk+NqUmdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF7468F7991
X-Proofpoint-ORIG-GUID: 3gj-YUz3wkwzDBAmOhsfjqhoiKu7YjD4
X-Authority-Analysis: v=2.4 cv=brxBxUai c=1 sm=1 tr=0 ts=693c3f28 cx=c_pps
 a=Us7513DS1gT4knu3Fiol7g==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=M51BFTxLslgA:10
 a=i1IsUcr2s-wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=2AEO0YjSAAAA:8
 a=d28r9nv9ZyHOM8R9p0gA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEyMDEyOCBTYWx0ZWRfX58U5I2UgjP6i
 f34drx9N0aUD3408WccEMs1E4PfWjA/OQyD8UTaad3tQqYpOB4nt0go+vUqfO5eY35YXQnI/OLx
 Z5b/2ZGMOqQnqbn1tZYtWziT+rCU4j8CO8bMLgSQC+j8WVp1jMmFTbuK/PJa8LRiuCItbhx1qtn
 t6e62mO9PP166fQBtKXuPHoNg3+Gml9O6bQSCcCOKRlBl+LbYUsfShlk8TzsYZb4lkVCqS9+mSO
 kBXJf3AFS34v5h4AV43Ajdzht1ktD/bgBDVPATgLnei/0gvetaPZ8/9fvblNBV4jUfqJHIRZhX7
 MzSz0DYA6/Sn+T3wP6Ce42CobZIEc1e+klJwXt78X8i8+EHf1yN/shmcY0BenMIFWMtg5FkESgn
 vH6phMCDyGo/5nHFZP5OOQXuzoXG4w==
X-Proofpoint-GUID: 3gj-YUz3wkwzDBAmOhsfjqhoiKu7YjD4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-12_04,2025-12-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 phishscore=0 spamscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512120128
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.10 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[silabs.com,reject];
	R_DKIM_ALLOW(-0.20)[silabs.com:s=pps12202023,silabs.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:148.163.153.153];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_IN_DNSWL_LOW(-0.10)[148.163.153.153:from];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:22843, ipnet:148.163.152.0/22, country:US];
	MIME_TRACE(0.00)[0:+];
	BLOCKLISTDE_FAIL(0.00)[148.163.153.153:server fail,52.101.43.100:server fail,2603:10b6:8:162::17:server fail];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DNSWL_BLOCKED(0.00)[52.101.43.100:received,2603:10b6:8:162::17:received];
	DKIM_TRACE(0.00)[silabs.com:+]
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 148E53F99A
X-Spamd-Bar: ----
Message-ID-Hash: UR7LQB56KPAWBEARFPF6PWCHFPTHVYAY
X-Message-ID-Hash: UR7LQB56KPAWBEARFPF6PWCHFPTHVYAY
X-MailFrom: Damien.Riegel@silabs.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, Silicon Labs Kernel Team <linux-devel@silabs.com>, =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH 07/14] greybus: cpc: account for CPC header size in RX and TX path
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/UR7LQB56KPAWBEARFPF6PWCHFPTHVYAY/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

QWNjb3VudCB0aGF0IGEgQ1BDIGhlYWRlciBpcyBwcmVwZW5kZWQgdG8gZXZlcnkgZnJhbWUgaW4g
dGhlIFJYIGFuZCBUWA0KcGF0aC4gRm9yIG5vdywgbm90aGluZyBpcyBkb25lIHdpdGggdGhhdCBo
ZWFkcm9vbSBidXQgYXQgbGVhc3QgYnl0ZXMgYXJlDQpyZXNlcnZlZCBmb3IgaXQuDQoNClNpZ25l
ZC1vZmYtYnk6IERhbWllbiBSacOpZ2VsIDxkYW1pZW4ucmllZ2VsQHNpbGFicy5jb20+DQotLS0N
CiBkcml2ZXJzL2dyZXlidXMvY3BjL2hvc3QuYyB8IDkgKysrKysrKy0tDQogMSBmaWxlIGNoYW5n
ZWQsIDcgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCg0KZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3JleWJ1cy9jcGMvaG9zdC5jIGIvZHJpdmVycy9ncmV5YnVzL2NwYy9ob3N0LmMNCmluZGV4
IDdmZmEzYmY0MDIxLi5jODk2MTc2MjNlOCAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3JleWJ1cy9j
cGMvaG9zdC5jDQorKysgYi9kcml2ZXJzL2dyZXlidXMvY3BjL2hvc3QuYw0KQEAgLTksNiArOSw3
IEBADQogI2luY2x1ZGUgPGxpbnV4L3NrYnVmZi5oPg0KIA0KICNpbmNsdWRlICJjcGMuaCINCisj
aW5jbHVkZSAiaGVhZGVyLmgiDQogI2luY2x1ZGUgImhvc3QuaCINCiANCiBzdGF0aWMgc3RydWN0
IGNwY19ob3N0X2RldmljZSAqZ2JfaGRfdG9fY3BjX2hkKHN0cnVjdCBnYl9ob3N0X2RldmljZSAq
aGQpDQpAQCAtNDgsMTEgKzQ5LDEzIEBAIHN0YXRpYyBpbnQgY3BjX2hkX21lc3NhZ2Vfc2VuZChz
dHJ1Y3QgY3BjX2hvc3RfZGV2aWNlICpjcGNfaGQsIHUxNiBjcG9ydF9pZCwNCiAJCXJldHVybiAt
RUlOVkFMOw0KIAl9DQogDQotCXNpemUgPSBzaXplb2YoKm1lc3NhZ2UtPmhlYWRlcikgKyBtZXNz
YWdlLT5wYXlsb2FkX3NpemU7DQorCXNpemUgPSBzaXplb2YoKm1lc3NhZ2UtPmhlYWRlcikgKyBt
ZXNzYWdlLT5wYXlsb2FkX3NpemUgKyBDUENfSEVBREVSX1NJWkU7DQogCXNrYiA9IGFsbG9jX3Nr
YihzaXplLCBnZnBfbWFzayk7DQogCWlmICghc2tiKQ0KIAkJcmV0dXJuIC1FTk9NRU07DQogDQor
CXNrYl9yZXNlcnZlKHNrYiwgQ1BDX0hFQURFUl9TSVpFKTsNCisNCiAJLyogSGVhZGVyIGFuZCBw
YXlsb2FkIGFyZSBhbHJlYWR5IGNvbnRpZ3VvdXMgaW4gR3JleWJ1cyBtZXNzYWdlICovDQogCXNr
Yl9wdXRfZGF0YShza2IsIG1lc3NhZ2UtPmJ1ZmZlciwgc2l6ZW9mKCptZXNzYWdlLT5oZWFkZXIp
ICsgbWVzc2FnZS0+cGF5bG9hZF9zaXplKTsNCiANCkBAIC0yMDksOSArMjEyLDExIEBAIHZvaWQg
Y3BjX2hkX3JjdmQoc3RydWN0IGNwY19ob3N0X2RldmljZSAqY3BjX2hkLCBzdHJ1Y3Qgc2tfYnVm
ZiAqc2tiKQ0KIAl1MTYgY3BvcnRfaWQ7DQogDQogCS8qIFByZXZlbnQgYW4gb3V0LW9mLWJvdW5k
IGFjY2VzcyBpZiBjYWxsZWQgd2l0aCBub24tc2Vuc2ljYWwgcGFyYW1ldGVycy4gKi8NCi0JaWYg
KHNrYi0+bGVuIDwgc2l6ZW9mKCpnYl9oZHIpKQ0KKwlpZiAoc2tiLT5sZW4gPCAoc2l6ZW9mKCpn
Yl9oZHIpICsgQ1BDX0hFQURFUl9TSVpFKSkNCiAJCWdvdG8gZnJlZV9za2I7DQogDQorCXNrYl9w
dWxsKHNrYiwgQ1BDX0hFQURFUl9TSVpFKTsNCisNCiAJLyogUmV0cmlldmUgY3BvcnQgSUQgdGhh
dCB3YXMgcGFja2VkIGluIEdyZXlidXMgaGVhZGVyICovDQogCWdiX2hkciA9IChzdHJ1Y3QgZ2Jf
b3BlcmF0aW9uX21zZ19oZHIgKilza2ItPmRhdGE7DQogCWNwb3J0X2lkID0gY3BjX2Nwb3J0X3Vu
cGFjayhnYl9oZHIpOw0KLS0gDQoyLjQ5LjANCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0IC0tIGdyZXlidXMt
ZGV2QGxpc3RzLmxpbmFyby5vcmcKVG8gdW5zdWJzY3JpYmUgc2VuZCBhbiBlbWFpbCB0byBncmV5
YnVzLWRldi1sZWF2ZUBsaXN0cy5saW5hcm8ub3JnCg==
