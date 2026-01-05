Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 480DECF3BF3
	for <lists+greybus-dev@lfdr.de>; Mon, 05 Jan 2026 14:19:22 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 6B9224015C
	for <lists+greybus-dev@lfdr.de>; Mon,  5 Jan 2026 13:19:21 +0000 (UTC)
Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazolkn19013079.outbound.protection.outlook.com [52.103.43.79])
	by lists.linaro.org (Postfix) with ESMTPS id AD2903F835
	for <greybus-dev@lists.linaro.org>; Mon,  5 Jan 2026 09:38:12 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=outlook.com header.s=selector1 header.b=kAyv2w60;
	spf=pass (lists.linaro.org: domain of holden.hsu.linux@outlook.com designates 52.103.43.79 as permitted sender) smtp.mailfrom=holden.hsu.linux@outlook.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1");
	dmarc=pass (policy=none) header.from=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aaZg7tfHuV8lWplC/VCGNBnOrIqIshbdr5pY2/ifXNEM1W8MzZAM4WJezEza7vqwbqhD6Ikukj1OGRHLa59BEpS+/WiTSg0mBkzW6KnuKzMaI+rtxZoZjvwNXku7P48SwJRclYjI5AgOiypQIpuY2mErA5B7oSsEB/1EiYUILtjUE5qFXC8xo71GHP7EiZotlpm9orW3+Enc9HSJj3k0CtMRKvFSKrVQzjX3U7j4kZQbJGaTVOfGn10j0eSZEbSBV2/L1tkAsBNz2US7eWNa/hLSTwwKzDRZhjCqQbzIIIAHzCUuQvyiIPvH1q7PgyB1TWHOP8kk7wcFRT+zZq/00w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ie3FbeIKZhwtH3/k4ZHw+gHzmSRlIY5RzixLALX2RCw=;
 b=CkSjfuZr0be7/qtuUd+8DRU/TqfrZFRREWurX5VC4feUWuptusEFXiU+yapGyGotOYV5f53ahOThzYK1B++GJHF333vRbwkHzQE8Yxf+7rVmTHqbyfD+IZMqVUfQkF9GvOZyAHmKyYbhPe4rN0CrOgGbPlDkNZXRWnBJzzmsQez1a3KWtZt5krzKTKsplWeguDWWaqHkcBm9RLmL0n8HcbNCroh2T36PY3/XopTo8oLbHEgDXRnSjysh5nrUasADdmo2GoeE2T/Kw6rwAWdl9dCE0WWiV4uOJlDFkyx7ZQHM62DHVb3YpQ2d3/NQOFmJ/RnD7S/1o0F6KcIwD9AYPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ie3FbeIKZhwtH3/k4ZHw+gHzmSRlIY5RzixLALX2RCw=;
 b=kAyv2w60CHE0GK/QMltz1+YgfMAipsmxZ905u+9ze7q6seu7TNWYBAMEMLom35AsKU7nkiW+UoZfms/82TmsB7olbICvr3eemMy4zPAkUFqybU/52wr1psx+g6A+Bq9ZJQtsoWJy43UXIrmgfJiudrCs7SVokXiACetc7u6if3vcPrgr3y4kXeiZA+7N/G0Gt4l9WP3q+8YCgoEiCwVGa0bgdpYv8ndLCTDV+39EsGB7wJ/Uci2r3Zht6YSV5Os9UilDJtsrKUlzWw7tj1VJvfWoa2AFC/XlqTQ3X4PTTdynugJ55DWxSo69bz0Q0QDb6RqNARIVPwF+VOblT9JjcQ==
Received: from SEYPR04MB9077.apcprd04.prod.outlook.com (2603:1096:101:2f5::12)
 by KL1PR04MB7365.apcprd04.prod.outlook.com (2603:1096:820:10f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 09:38:08 +0000
Received: from SEYPR04MB9077.apcprd04.prod.outlook.com
 ([fe80::db68:ff09:6ee3:e6f3]) by SEYPR04MB9077.apcprd04.prod.outlook.com
 ([fe80::db68:ff09:6ee3:e6f3%5]) with mapi id 15.20.9478.004; Mon, 5 Jan 2026
 09:38:08 +0000
From: Hsu Holden <holden.hsu.linux@outlook.com>
To: "greybus-dev@lists.linaro.org" <greybus-dev@lists.linaro.org>
Thread-Topic: [PATCH 0/2] staging: greybus: arche-platform: minor fixes
Thread-Index: AQHcfiTNs3qGrWXqOUm61IvZk9d9V7VDUR1h
Date: Mon, 5 Jan 2026 09:38:08 +0000
Message-ID: 
 <SEYPR04MB90773EFB2E676CEB5DE856B1BA86A@SEYPR04MB9077.apcprd04.prod.outlook.com>
References: 
 <SEYPR04MB907708908DA405D261BFC170BA86A@SEYPR04MB9077.apcprd04.prod.outlook.com>
In-Reply-To: 
 <SEYPR04MB907708908DA405D261BFC170BA86A@SEYPR04MB9077.apcprd04.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR04MB9077:EE_|KL1PR04MB7365:EE_
x-ms-office365-filtering-correlation-id: 3566db0d-04dd-4d96-bcb7-08de4c3e2274
x-microsoft-antispam: 
 BCL:0;ARA:14566002|31061999003|6092099016|461199028|8062599012|19110799012|51005399006|8060799015|15080799012|15030799006|440099028|3412199025|40105399003|102099032|3430499032|1710799026;
x-microsoft-antispam-message-info: 
 =?gb2312?B?ZmVBV1BvRWVRZ0lGMVNsclZCMWxUNlJ0UzI5VitxUkRzaVVRaU1pM2J3dkd0?=
 =?gb2312?B?S0lzdDhFTjZVZXBhUExzUnFWTmVBM2k0THF6Y0pJcDRINnpRWWdxbWkyR3Yy?=
 =?gb2312?B?ZldhUTBOSFJNOGFkSERGRzBidm5kUWhHTUdiWUpqQ0h6Tm0waVpreCs5RlRj?=
 =?gb2312?B?c2dtNnZPdVdoMVhaNzlmTEJud3JodXh4dVpkUlJNRXhMR0x3THhweGt4UStD?=
 =?gb2312?B?NUNZVGwzT0wyN3JtL0Yydm01TDJRVHJlZnBnKzZJeThmWTRVNmt4ODlTQk5Y?=
 =?gb2312?B?RGRzUHh1eU8yVDZraXYrOEQvaDVEQXgvL2hoWk9UTmEwREJsdmdLcDNBSkox?=
 =?gb2312?B?OE01bFJ0YXpHRTl6M21aRjE3V2U0T1hJWmdtNjFWbTlQY2VhYkdFSlV4Z0hj?=
 =?gb2312?B?L01YWWhIZTdOQndHVnh0M2NXS0lMeElPanFuR0dxVG83NlVseWlCMlRFaTBy?=
 =?gb2312?B?eU84WXltSnlCWkZJbWZTd0ovYmVLdURrOGNpT3NtSG9pR0J2dWFLbnA5ekdh?=
 =?gb2312?B?SmlxR050WjFsYUtBSVlLektXZWJ1NTVkdVpGeXRxUFBFdXFjbVNGZXRtRnI2?=
 =?gb2312?B?dEx5cnNTeDVxNzZYb284UDhmT3ZLREpuTnQvaGM4T0wxVDF4TStzZjRrSnVj?=
 =?gb2312?B?U2cxTktUWGJ0YXJ6UGVSWHBsdGJYdko5L2Nqa0p2SXcyRlNCRXc2V1VCVE9W?=
 =?gb2312?B?NEo1enQrYU9zRUZQNW1YeHQ1c1lHcDhWNWRQMU1oRTlUQmltNEZVaTY1NDBp?=
 =?gb2312?B?YmRFRGxLTVRnSGwzT1RnaGRyV3V1TWh2ZXdFVlJWdlhUS3NvSGl6Wm5mOGd6?=
 =?gb2312?B?d0hJd2oxVmVDU29oZjc0L0wrR3JJbkVNWFkwQnhUZnhoWXFnOXBoUXduZ3pB?=
 =?gb2312?B?SzFpZmNOMHI4bmFJZnpPdWhnUU1LTkM2bkNnUEN5T24rTkVXTFhKTWkrVm9l?=
 =?gb2312?B?TS9sSk9RZGliaHJ6aXNmR2RwU1FoME0zNFBJazZjM01sUURzaFUvZmNsNXBF?=
 =?gb2312?B?TjhtakYrTHlyeks4QkhlTlRmY0FlMHBsdyt2VkU2SG1rRHhpMVEvUS9wSEsr?=
 =?gb2312?B?L0hKdVpRZy9oNDVGUVkwVEtyUW5JMEVucG8rTVIyM1ZXd0N4Zjc2ZlhyVnM4?=
 =?gb2312?B?dzN5OVRTU3R4aG9FUGxkM1dUK0Q5OG5FSEFVS1dwTnhFRVlyMHJ3TmRPU2hI?=
 =?gb2312?B?S2trL3h0WFR2azJ2c1J4Rlk4bi9XalZBUVVLaXJydCtUYmNjUmFma3NGcWJ1?=
 =?gb2312?B?M1R4QlpXTjlJb2wwMVdEN2NwdkFtUUUrcW5IdWcvVHVQS3EwSTV4STNXYkdu?=
 =?gb2312?B?S1djY1RKMnZsTGdWNktkYlZDaERWRDJTNlpQci9QUnNOT3l5cXArTldVUnM0?=
 =?gb2312?B?ZHEya0YyZ1NpdktnVFp1ZFJhd3pBM05jczRCdjI4cmpzVFRSSFNnMm1wVC9i?=
 =?gb2312?B?TTFpYkVHd3R3WEVwakl1ZnhxRW1sbFlJRVd3U2taTFZPYTlJU3ZPRlZnUXNm?=
 =?gb2312?B?NHhxVEdIdkZRcG42U0JtQnVUTTAxOVBOTTFQSngwWEtMQ2p2SEZmNWtxVS8v?=
 =?gb2312?B?WUdCeG4xdndUM016dEI1OXRsbk1PZWd1SWZ6Y1NBN3I1dTFTbWxZTk02VVpN?=
 =?gb2312?B?dzd6TEFIeC9iZlJwcFZMOXptbTdOMTNxTElTZGVCVVdpdGVGL0VGVzFPMUI3?=
 =?gb2312?B?L0Z2RDlrRXJMazRUZVE5aXkweU9ZaHdUSHh6QTdjc05WanhFT3kvZEhnPT0=?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?gb2312?B?MUZHajZ6NmxxVHU2L1pOVU9nK1hiMkg1bXY5NXZpc0dsY210WkJKL3N6OHpU?=
 =?gb2312?B?aHVNdkp4Q2tDSzJtZlBBZlFKSFNNeVlOZ1ZUdVE2RjdkdFNmd3dzZk5HNWZN?=
 =?gb2312?B?ZXdpVVJRQW9kOFZVUFVxYjNsRUl6U2NRN2psSENJS0VNaHZyOExXT0ZVKzA2?=
 =?gb2312?B?cVRiQU1pMG1WVGZySHNWNkRhZm5xR3EyUlcwa1J1NjlTeTJvZ3I1VGRDcE85?=
 =?gb2312?B?SmFxbUoyYnNFbGNiSGpkNzlSbEplQ1BrbE1ZZ2xoTEJRNmRMajZLZXdNdWlQ?=
 =?gb2312?B?Tk1LbGF0aGszYmE5THdCdG1LU0NpZWU3L0gyd2NFT3k2d1ZVRnVldVVGRWVB?=
 =?gb2312?B?TGlQQ3FBM1NvSEZBUWgzSnN3TmZyekxEblJ2N0R2UlA0TktmVW8wTlhleElT?=
 =?gb2312?B?MEI1aWZSMlZheGlVc2VhN0FsNFRYQkw3cUFxNjBBcGNXR01XY0Z6Q0U2QkN5?=
 =?gb2312?B?QXFTWGlHNm9vVFFMelJGTEVISXdWd29QODNKWWpZcnRRZHlGQXNsYTJTT2tN?=
 =?gb2312?B?QS9PbkNuN0JXeWdRZGVFcU94Z0Izdjc3b21BRUszQkZtMkJRRXlkTEFLdTF0?=
 =?gb2312?B?eW0vVUVreDlQaGJrUU1EMS9kTVc4QVMvcXUzdEVsN2VMWFltWGYrTGdxYThV?=
 =?gb2312?B?dTU4Zzh1VUxNSHFBb0dvYmNnOWpXT3FoZ2ZPb0w4Z3FrOUJoUTlWcW9WOUhu?=
 =?gb2312?B?Y2FUOWRjVExKQnJ3cTE3NjNZNWUxYVlaSnl1M1ppa2ZVY3ZacWdXMjNTaHdj?=
 =?gb2312?B?b0dCQlpINXBncURSL3lUMmhXOUxFYlg1aVJ1VnBCWHA3TUYzTVV2a0RWM1Zi?=
 =?gb2312?B?SVl4a0pHdUw5U0xHdUIzcGhJRGtLT0R4ak9ta3dOYXloU05mYlpScWNNTWpu?=
 =?gb2312?B?N1NPSTZXVTZ5V0txU3paY0IyNVhqVEhodHBDNkRINDJVN3h1Wnp2NWljN3c1?=
 =?gb2312?B?emVWdWRuTXJ1UjhobHgvM0RUdWFpZjlxMUN3RzVqcHVoMHJWT3k3c1hrUml4?=
 =?gb2312?B?NnJBcFZQSkc2MEN2Y2EzRXlZOWRYUkc5VklPbXlvb1ZxUTJtaEZBam5haEgw?=
 =?gb2312?B?ZDlLeHdhdEFhQ1ZKN2hMTyt0NzhUbm1DeHB1V3BEZk96R1dsL0x2MGQvdHc5?=
 =?gb2312?B?ZnNWQndlNUx3eWF1SXNiUDJ5clB4eWpYUkk3a0htbW1yczZUUHlmMFRZc0F6?=
 =?gb2312?B?c1ZOUjZJL3JzWlo5YnpnSFFRaUN0S3hCRkp1ajJnREpIY2d2YjYzS0tHRXJ4?=
 =?gb2312?B?SS9WbDNZakZYMDJYM0ZmOW0yM21YNkRBTXBNaFZTM1Bmalk4Wit0VktzTHBz?=
 =?gb2312?B?Zy8yby9PZnZJNHg2Rk5XRmVsTCs0U204K2RzN0dXUS9FSnR4WC91RzB5d01P?=
 =?gb2312?B?VlZ2TlczZ0kwZ2l6U1BWTkx5cUNWaldPcVJmU2lQVjZwc1MxY0lnZmdqRjJa?=
 =?gb2312?B?eWcxOUd6TjlNdE13N21ZdUtlWFFObGRxZk80Vm5NN2dIbGdEdnhzbFRFNjlU?=
 =?gb2312?B?ZEtOdDk4enJRMjQydGlDQ1kvTzBKQjJzMVJZT0d2MzJtZVlDRWltUjZrVndZ?=
 =?gb2312?B?a0N1Tm9nb2FVQ3RSL0dhOWRLdFVtWkxRZDRPUzNIWW1LeVdyeFRKZWY1b2o4?=
 =?gb2312?B?bkE0MzkwQm55OE5NcmFDcVovdUpHL1dnSUJndUxxZnNza3BCOXJiODJXRmd4?=
 =?gb2312?B?RWpHcEJqTTNZNUhVWWpqVzY1NDIrSUFTWS9ET0pIOEtydHh0eFRPUysva1k2?=
 =?gb2312?B?M2ZYSEtTT0h5RkhZa01rVHZvRUMzNDVSRkpjMXNCNjlqL2FkU3lvMmdXV3U4?=
 =?gb2312?B?b3pUa2VxNGpKcDB5T3NieVJoSUtzZ3Q4L01QY2c4cVVtVGlWYlBjTk5pU3BG?=
 =?gb2312?B?ZnZHaEpldFdMZzdESVFHbUF3WlhvaFN0VEVLR2MxS3EzNlM3UThtZW9JaWRV?=
 =?gb2312?B?TUszRFNIdThIaC8yV0R4b3pxRUJ4a0txa3ptNncxSVhoTHlqd0RpbDBMM0M2?=
 =?gb2312?B?SXNJZWRJb3F3PT0=?=
Content-Type: multipart/mixed;
	boundary="_006_SEYPR04MB90773EFB2E676CEB5DE856B1BA86ASEYPR04MB9077apcp_"
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR04MB9077.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 3566db0d-04dd-4d96-bcb7-08de4c3e2274
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jan 2026 09:38:08.2492
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR04MB7365
X-Rspamd-Queue-Id: AD2903F835
X-Spamd-Bar: ---
X-Spamd-Result: default: False [-3.90 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[outlook.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:52.103.0.0/17];
	R_DKIM_ALLOW(-0.20)[outlook.com:s=selector1];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[multipart/mixed,multipart/alternative,text/plain,text/x-patch];
	RCVD_TLS_LAST(0.00)[];
	URIBL_BLOCKED(0.00)[linaro.org:email,mail-japaneastazolkn19013079.outbound.protection.outlook.com:rdns,SEYPR04MB9077.apcprd04.prod.outlook.com:mid];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:~,4:+,5:+,6:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,outlook.com];
	DKIM_TRACE(0.00)[outlook.com:+];
	FREEMAIL_FROM(0.00)[outlook.com];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	DNSWL_BLOCKED(0.00)[52.103.43.79:from];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	HAS_ATTACHMENT(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:8075, ipnet:52.96.0.0/12, country:US];
	RWL_MAILSPIKE_POSSIBLE(0.00)[52.103.43.79:from];
	RCPT_COUNT_THREE(0.00)[4];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_ENVFROM(0.00)[outlook.com]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-MailFrom: holden.hsu.linux@outlook.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: B552ENWY2Z5M43RTGBDIFSPGCHLHKNZI
X-Message-ID-Hash: B552ENWY2Z5M43RTGBDIFSPGCHLHKNZI
X-Mailman-Approved-At: Mon, 05 Jan 2026 13:19:14 +0000
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-staging@vger.kernel.org" <linux-staging@vger.kernel.org>, Hsu Holden <holden.hsu.linux@outlook.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH 0/2] staging: greybus: arche-platform: minor fixes
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/EUPNH7FSDKNP7APV3SHB36OG3SQOTI2X/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>

--_006_SEYPR04MB90773EFB2E676CEB5DE856B1BA86ASEYPR04MB9077apcp_
Content-Type: multipart/alternative;
	boundary="_000_SEYPR04MB90773EFB2E676CEB5DE856B1BA86ASEYPR04MB9077apcp_"

--_000_SEYPR04MB90773EFB2E676CEB5DE856B1BA86ASEYPR04MB9077apcp_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0Kt6K8/sjLOiBIc3UgSG9sZGVuIDxo
b2xkZW4uaHN1LmxpbnV4QG91dGxvb2suY29tPg0Kt6LLzcqxvOQ6IDIwMjbE6jHUwjXI1SAxNzoy
Nw0KytW8/sjLOiBncmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3JnIDxncmV5YnVzLWRldkBsaXN0
cy5saW5hcm8ub3JnPg0Ks63LzTogbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZyA8bGludXgt
a2VybmVsQHZnZXIua2VybmVsLm9yZz47IGRldmVsQGRyaXZlcmRldi5vc3Vvc2wub3JnIDxkZXZl
bEBkcml2ZXJkZXYub3N1b3NsLm9yZz47IEhzdSBIb2xkZW4gPGhvbGRlbi5oc3UubGludXhAb3V0
bG9vay5jb20+DQrW98ziOiBbUEFUQ0ggMC8yXSBzdGFnaW5nOiBncmV5YnVzOiBhcmNoZS1wbGF0
Zm9ybTogbWlub3IgZml4ZXMNCg0KVGhpcyBwYXRjaCBzZXJpZXMgY29udGFpbnMgdHdvIG1pbm9y
IGNsZWFudXBzIGZvciB0aGUgYXJjaGUtcGxhdGZvcm0gZHJpdmVyOg0KDQpQYXRjaCAxOiBDbGFy
aWZpZXMgYW4gdW5jbGVhciBUT0RPIGNvbW1lbnQgdG8gbWFrZSB0aGUgaW50ZW50IG1vcmUgb2J2
aW91cw0KICAgICAgICAgdG8gZnV0dXJlIGRldmVsb3BlcnMuDQoNClBhdGNoIDI6IEZpeGVzIGEg
c2ltcGxlIHNwZWxsaW5nIG1pc3Rha2UgaW4gYSBjb21tZW50Lg0KDQpUaGVzZSBhcmUgbG93LXJp
c2sgY2hhbmdlcyB0aGF0IGltcHJvdmUgY29kZSByZWFkYWJpbGl0eS4NCg==

--_000_SEYPR04MB90773EFB2E676CEB5DE856B1BA86ASEYPR04MB9077apcp_
Content-Type: text/html; charset="gb2312"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dgb2312">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>=B7=A2=BC=FE=C8=CB:</b> Hsu Hol=
den &lt;holden.hsu.linux@outlook.com&gt;<br>
<b>=B7=A2=CB=CD=CA=B1=BC=E4:</b> 2026=C4=EA1=D4=C25=C8=D5 17:27<br>
<b>=CA=D5=BC=FE=C8=CB:</b> greybus-dev@lists.linaro.org &lt;greybus-dev@lis=
ts.linaro.org&gt;<br>
<b>=B3=AD=CB=CD:</b> linux-kernel@vger.kernel.org &lt;linux-kernel@vger.ker=
nel.org&gt;; devel@driverdev.osuosl.org &lt;devel@driverdev.osuosl.org&gt;;=
 Hsu Holden &lt;holden.hsu.linux@outlook.com&gt;<br>
<b>=D6=F7=CC=E2:</b> [PATCH 0/2] staging: greybus: arche-platform: minor fi=
xes</font>
<div>&nbsp;</div>
</div>
<style type=3D"text/css" style=3D"display:none">
<!--
p
	{margin-top:0;
	margin-bottom:0}
-->
</style>
<div dir=3D"ltr">
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif; font-size:12pt; color:rgb(0,0,0)">
This patch series contains two minor cleanups for the arche-platform driver=
:</div>
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,Aptos_EmbeddedFo=
nt,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font-size:12pt; color:=
rgb(0,0,0)">
<br>
</div>
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,Aptos_EmbeddedFo=
nt,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font-size:12pt; color:=
rgb(0,0,0)">
Patch 1: Clarifies an unclear TODO comment to make the intent more obvious<=
/div>
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,Aptos_EmbeddedFo=
nt,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font-size:12pt; color:=
rgb(0,0,0)">
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;to future developers.</div>
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,Aptos_EmbeddedFo=
nt,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font-size:12pt; color:=
rgb(0,0,0)">
<br>
</div>
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,Aptos_EmbeddedFo=
nt,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font-size:12pt; color:=
rgb(0,0,0)">
Patch 2: Fixes a simple spelling mistake in a comment.</div>
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,Aptos_EmbeddedFo=
nt,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font-size:12pt; color:=
rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif; font-size:12pt; color:rgb(0,0,0)">
These are low-risk changes that improve code readability.</div>
</div>
</body>
</html>

--_000_SEYPR04MB90773EFB2E676CEB5DE856B1BA86ASEYPR04MB9077apcp_--

--_006_SEYPR04MB90773EFB2E676CEB5DE856B1BA86ASEYPR04MB9077apcp_
Content-Type: text/x-patch; name="0000-cover-letter.patch"
Content-Description: 0000-cover-letter.patch
Content-Disposition: attachment; filename="0000-cover-letter.patch"; size=766;
	creation-date="Mon, 05 Jan 2026 09:26:16 GMT";
	modification-date="Mon, 05 Jan 2026 09:36:00 GMT"
Content-ID: <4759849F5F9982418B938331F49C8531@apcprd04.prod.outlook.com>
Content-Transfer-Encoding: base64

RnJvbSA4YTA0NTg2OGUyNDBkNGZiMDc4ODRhNDE1MjQzM2U2NDEwNTEyMTk2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBIb2xkZW4gSHN1IDxob2xkZW4uaHN1LmxpbnV4QG91dGxvb2su
Y29tPgpEYXRlOiBNb24sIDUgSmFuIDIwMjYgMDA6Mjg6NDYgLTA4MDAKU3ViamVjdDogW1BBVENI
IDAvMl0gc3RhZ2luZzogZ3JleWJ1czogYXJjaGUtcGxhdGZvcm06IG1pbm9yIGZpeGVzCgpUaGlz
IHBhdGNoIHNlcmllcyBjb250YWlucyB0d28gbWlub3IgY2xlYW51cHMgZm9yIHRoZSBhcmNoZS1w
bGF0Zm9ybSBkcml2ZXI6CgpQYXRjaCAxOiBDbGFyaWZpZXMgYW4gdW5jbGVhciBUT0RPIGNvbW1l
bnQgdG8gbWFrZSB0aGUgaW50ZW50IG1vcmUgb2J2aW91cwogICAgICAgICB0byBmdXR1cmUgZGV2
ZWxvcGVycy4KClBhdGNoIDI6IEZpeGVzIGEgc2ltcGxlIHNwZWxsaW5nIG1pc3Rha2UgaW4gYSBj
b21tZW50LgoKVGhlc2UgYXJlIGxvdy1yaXNrIGNoYW5nZXMgdGhhdCBpbXByb3ZlIGNvZGUgcmVh
ZGFiaWxpdHkuCgpIb2xkZW4gSHN1ICgyKToKCXN0YWdpbmc6IGdyZXlidXM6IGFyY2hlLXBsYXRm
b3JtOiBjbGFyaWZ5IFRPRE8gY29tbWVudAoJc3RhZ2luZzogZ3JleWJ1czogYXJjaGUtcGxhdGZv
cm06IGZpeCBzcGVsbGluZyBtaXN0YWtlCgogZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvYXJjaGUt
cGxhdGZvcm0uYyB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBk
ZWxldGlvbnMoLSkKCi0tIAoyLjQzLjAKCg==

--_006_SEYPR04MB90773EFB2E676CEB5DE856B1BA86ASEYPR04MB9077apcp_
Content-Type: text/x-patch;
	name="0001-staging-greybus-arche-platform-clarify-TODO-comment.patch"
Content-Description: 
 0001-staging-greybus-arche-platform-clarify-TODO-comment.patch
Content-Disposition: attachment;
	filename="0001-staging-greybus-arche-platform-clarify-TODO-comment.patch";
	size=1166; creation-date="Mon, 05 Jan 2026 09:26:16 GMT";
	modification-date="Mon, 05 Jan 2026 09:36:00 GMT"
Content-ID: <A2BAD5F601C434408E2B53B3A03E9095@apcprd04.prod.outlook.com>
Content-Transfer-Encoding: base64

RnJvbSBjYjNiYmU1N2U3MTliM2I1NTU4OTBlZWE0MjFiZGFhYjJiYmVkOTMwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBIb2xkZW4gSHN1IDxob2xkZW4uaHN1LmxpbnV4QG91dGxvb2su
Y29tPgpEYXRlOiBNb24sIDUgSmFuIDIwMjYgMDA6MTc6NDUgLTA4MDAKU3ViamVjdDogW1BBVENI
IDEvMl0gc3RhZ2luZzogZ3JleWJ1czogYXJjaGUtcGxhdGZvcm06IGNsYXJpZnkgVE9ETyBjb21t
ZW50CiBUaGUgVE9ETyBjb21tZW50ICdzZXF1ZW5jZSA/PycgaXMgdW5jbGVhciBhbmQgcHJvdmlk
ZXMgbGl0dGxlIGNvbnRleHQgYWJvdXQKIHdoYXQgbmVlZHMgdG8gYmUgaW1wbGVtZW50ZWQuIFJl
cGxhY2UgaXQgd2l0aCAnVE9ETzogZGVmaW5lIHNodXRkb3duCiBzZXF1ZW5jZScgdG8gYmV0dGVy
IGRlc2NyaWJlIHRoZSByZXF1aXJlZCBpbXBsZW1lbnRhdGlvbi4KClNpZ25lZC1vZmYtYnk6IEhv
bGRlbiBIc3UgPGhvbGRlbi5oc3UubGludXhAb3V0bG9vay5jb20+Ci0tLQogZHJpdmVycy9zdGFn
aW5nL2dyZXlidXMvYXJjaGUtcGxhdGZvcm0uYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3RhZ2luZy9n
cmV5YnVzL2FyY2hlLXBsYXRmb3JtLmMgYi9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9hcmNoZS1w
bGF0Zm9ybS5jCmluZGV4IDhhYWZmNGU0NS4uZGUzOGNkNGIzIDEwMDY0NAotLS0gYS9kcml2ZXJz
L3N0YWdpbmcvZ3JleWJ1cy9hcmNoZS1wbGF0Zm9ybS5jCisrKyBiL2RyaXZlcnMvc3RhZ2luZy9n
cmV5YnVzL2FyY2hlLXBsYXRmb3JtLmMKQEAgLTU3Miw3ICs1NzIsNyBAQCBzdGF0aWMgX19tYXli
ZV91bnVzZWQgaW50IGFyY2hlX3BsYXRmb3JtX3N1c3BlbmQoc3RydWN0IGRldmljZSAqZGV2KQog
CSAqIElmIHRpbWluZyBwcm9maWxlIHByZW1pdHMsIHdlIG1heSBzaHV0ZG93biBicmlkZ2UKIAkg
KiBjb21wbGV0ZWx5CiAJICoKLQkgKiBUT0RPOiBzZXF1ZW5jZSA/PworCSAqIFRPRE86IGRlZmlu
ZSBzaHV0ZG93biBzZXF1ZW5jZQogCSAqCiAJICogQWxzbywgbmVlZCB0byBtYWtlIHN1cmUgd2Ug
bWVldCBwcmVjb25kaXRpb24gZm9yIHVuaXBybyBzdXNwZW5kCiAJICogUHJlY29uZGl0aW9uOiBE
ZWZpbml0aW9uID8/PwotLSAKMi40My4wCgo=

--_006_SEYPR04MB90773EFB2E676CEB5DE856B1BA86ASEYPR04MB9077apcp_
Content-Type: text/x-patch;
	name="0002-staging-greybus-arche-platform-fix-spelling-mistake.patch"
Content-Description: 
 0002-staging-greybus-arche-platform-fix-spelling-mistake.patch
Content-Disposition: attachment;
	filename="0002-staging-greybus-arche-platform-fix-spelling-mistake.patch";
	size=997; creation-date="Mon, 05 Jan 2026 09:26:17 GMT";
	modification-date="Mon, 05 Jan 2026 09:36:00 GMT"
Content-ID: <93A63F7377CF5A4A93E0EA0788CF4EFC@apcprd04.prod.outlook.com>
Content-Transfer-Encoding: base64

RnJvbSA4YTA0NTg2OGUyNDBkNGZiMDc4ODRhNDE1MjQzM2U2NDEwNTEyMTk2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBIb2xkZW4gSHN1IDxob2xkZW4uaHN1LmxpbnV4QG91dGxvb2su
Y29tPgpEYXRlOiBNb24sIDUgSmFuIDIwMjYgMDA6MjQ6NTEgLTA4MDAKU3ViamVjdDogW1BBVENI
IDIvMl0gc3RhZ2luZzogZ3JleWJ1czogYXJjaGUtcGxhdGZvcm06IGZpeCBzcGVsbGluZyBtaXN0
YWtlCiBGaXggJ3ByZW1pdHMnIC0+ICdwZXJtaXRzJyBpbiBjb21tZW50LgoKU2lnbmVkLW9mZi1i
eTogSG9sZGVuIEhzdSA8aG9sZGVuLmhzdS5saW51eEBvdXRsb29rLmNvbT4KLS0tCiBkcml2ZXJz
L3N0YWdpbmcvZ3JleWJ1cy9hcmNoZS1wbGF0Zm9ybS5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9zdGFn
aW5nL2dyZXlidXMvYXJjaGUtcGxhdGZvcm0uYyBiL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2Fy
Y2hlLXBsYXRmb3JtLmMKaW5kZXggZGUzOGNkNGIzLi5mNjY5YTdlMmUgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvc3RhZ2luZy9ncmV5YnVzL2FyY2hlLXBsYXRmb3JtLmMKKysrIGIvZHJpdmVycy9zdGFn
aW5nL2dyZXlidXMvYXJjaGUtcGxhdGZvcm0uYwpAQCAtNTY5LDcgKzU2OSw3IEBAIHN0YXRpYyB2
b2lkIGFyY2hlX3BsYXRmb3JtX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQog
c3RhdGljIF9fbWF5YmVfdW51c2VkIGludCBhcmNoZV9wbGF0Zm9ybV9zdXNwZW5kKHN0cnVjdCBk
ZXZpY2UgKmRldikKIHsKIAkvKgotCSAqIElmIHRpbWluZyBwcm9maWxlIHByZW1pdHMsIHdlIG1h
eSBzaHV0ZG93biBicmlkZ2UKKwkgKiBJZiB0aW1pbmcgcHJvZmlsZSBwZXJtaXRzLCB3ZSBtYXkg
c2h1dGRvd24gYnJpZGdlCiAJICogY29tcGxldGVseQogCSAqCiAJICogVE9ETzogZGVmaW5lIHNo
dXRkb3duIHNlcXVlbmNlCi0tIAoyLjQzLjAKCg==

--_006_SEYPR04MB90773EFB2E676CEB5DE856B1BA86ASEYPR04MB9077apcp_
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

--_006_SEYPR04MB90773EFB2E676CEB5DE856B1BA86ASEYPR04MB9077apcp_--
