Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aLaGHquCoGkDkgQAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Thu, 26 Feb 2026 18:28:11 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id E1CBE1AC640
	for <lists+greybus-dev@lfdr.de>; Thu, 26 Feb 2026 18:28:10 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id A1F023F9B5
	for <lists+greybus-dev@lfdr.de>; Thu, 26 Feb 2026 17:28:09 +0000 (UTC)
Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazolkn19012048.outbound.protection.outlook.com [52.103.66.48])
	by lists.linaro.org (Postfix) with ESMTPS id 8C76D3F7E6
	for <greybus-dev@lists.linaro.org>; Thu, 26 Feb 2026 11:45:40 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=outlook.com header.s=selector1 header.b="PfL/X785";
	spf=pass (lists.linaro.org: domain of kunalkmr9717@outlook.com designates 52.103.66.48 as permitted sender) smtp.mailfrom=kunalkmr9717@outlook.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1");
	dmarc=pass (policy=none) header.from=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q/nsq94UmPY+oYLDauBS9Kq7R35ZRRF9ItT4eTlOSo1pZB1lOjgeb+FCdsFvZpMHqU7V67g2z+z/4vr2nSKHWTBOlNJtq+hBk8+clMt3x9vd+9MUqWiSmM0pbcnC+im6SRRVo17xwTRXcENjGvwpl/Ji9LJP3fo/m2X4uwYWH7cr8jGJaGi/HD/IVV1f2TJPqZj45BkDlZQwxoPIw2JYegHAOqeAobQv0TjIeeSOwyG4EbbZEl9TXdWHbRKOGN4G2fxY2DxR9Jy2YVcqexiEHUabxVWY0h0Mv877mlisdDBUjLQqnPUH8L+5n+cHLTUKzpv659VCVXL8Lt1gCMrAfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kTY6e7pWD+PZy1zjaXA5IQw6jEzYNSVH28NL0Aw4Z1A=;
 b=cjF4Q2wQx/bm4kCoEt3zrozeUXzeUVMPZO8ofDEDfQ2rRcnLAHFI3NdumL6E63yvHX9VtfEGDmtfFbY+b/9iuS8v/hyJkQ5kv4ZeNwFAMMZuTSQb1qSzWMlxB+5M/pHNhc0Gkmy5urGNEOMpdxwooC8+tI8RcrCEfmKpAn9pq0vuXK8m7RHY3G2pVwEiqCrT8kZIAULjxAJ45OvxnK55leTMJ2KGFlZR2bTBaHX72OXlKBGz+Hdd9eEVaAYZ/2utdDDEYEcEP5S8b5Ey9AMXOQ7JaIPejKheseIagHVhxZ4IullMNff/bimowiuS1tThDACOzYc1BqGHXuQcaJCQ8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kTY6e7pWD+PZy1zjaXA5IQw6jEzYNSVH28NL0Aw4Z1A=;
 b=PfL/X785kP8MBT58CTOieweV+y12NLoEP5hT9NVfGBVLhv9wNkwAASGLNVrHy8gHNhkMSaReRjJkBfo2EBfmYF66atNz1RJvdEhVLYJUDwycZC7gNZuOlNCH9kGIcjuYfJ96sQwohfsNrM8K6d5yK3vOp/JvE4RTXRG6EKp4NlusyxtLGFexdTl8WF0aJrQNJzKH3NFveCnUbNANYxEOu2F8hx9BKN3SXVQvh+WOkERMXOU23PHqyeV61XcG+685MRJ3u/NWq7MpHTPEsvlH+i0vyJ0Qh4sICanvl+8zCW5IhIZWn4Ak+IZ8YW2E901l9Rvh2PDNEjzJYN1z8lSpHA==
Received: from KL1PR0401MB6563.apcprd04.prod.outlook.com (2603:1096:820:b2::6)
 by SEZPR04MB7674.apcprd04.prod.outlook.com (2603:1096:101:1f2::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.13; Thu, 26 Feb
 2026 11:45:36 +0000
Received: from KL1PR0401MB6563.apcprd04.prod.outlook.com
 ([fe80::6edc:a0f0:e62:2e66]) by KL1PR0401MB6563.apcprd04.prod.outlook.com
 ([fe80::6edc:a0f0:e62:2e66%6]) with mapi id 15.20.9632.017; Thu, 26 Feb 2026
 11:45:35 +0000
From: kunal km <kunalkmr9717@outlook.com>
To: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
Thread-Topic: [PATCH] staging: greybus: audio_manager_module: make envp array
 const
Thread-Index: AQHcpxTfTDV4JEn3KEeQe0tQqdSeWQ==
Date: Thu, 26 Feb 2026 11:45:35 +0000
Message-ID: 
 <KL1PR0401MB6563219414B87B4EE2C2CC77DD72A@KL1PR0401MB6563.apcprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KL1PR0401MB6563:EE_|SEZPR04MB7674:EE_
x-ms-office365-filtering-correlation-id: a94f5667-c3b3-46c0-03f5-08de752c8e09
x-ms-exchange-slblob-mailprops: 
 WaIXnCbdHrPy8Gg0T1tV+ubdyTLMpos/6j5iMMp8S8ObMlpJI2jZcIP1b+62vHpy7P15X85mtrmPwsQaxxcx0JOcEqTIqhfHekhakS9TdPEVWtjZvLnX7IgI6EGweJyVgiZ1IVH5RsnZnaGh7uWCUunAUtRyEYTEtU3uOQf/i0LY75udxhec763Qr08gE/1TYBuRYzyks1czAiq8GTGyE3IGPWwGjpBUfML0RCtdFsnh3R4/pIeCS4GQcb8stYSVAsD7R6l4jQsYM2tNpPFr7ilSWlgSzNX8m7ozhDfz/4sT2Bq02B6l2/zW5pSx+9iXe7JgEGF/4vNzYxdnADPW3j5OxjRsXtH5WLpDHTLIhtdPyrHGQwphJn2PhuhC8D6oxKN6FOrTZa4LArF8bx3hdj0dTr52l02V+zuu1LkrfHp8WTjpjAmwfG9+Nm9c6PjuY63bvbQtXuWVIc70fNMZuR2vvbIVw5Ry5Ul9uBjM1ke7tHJ1bjBCU/kBWX3ELPEQkHDaG2BFrT3W37AppF5GJWNqS5592sQjj/XaySDtNwQ8yjoSDkm6/G+oRoQJ+ZQMBTBNE+Rat/yK7wCaMGpTPYIHaOVdVcSEuNsT+jeR2O53FcxxgKtlJIOROLf1MEUrsN58+AxZsPd36W2sl8gYN0d43/FvnQl8jchJU0FrUVIje7G4Id+z0VwE37i8KZpeG7keZyb6EMJHkbPqiKse2bU9FgBIQkX9sR0YNV5bpMJJ2DXIiuAWXNuFAlp16qwuVn6BjD56pFI=
x-microsoft-antispam: 
 BCL:0;ARA:14566002|8060799015|8062599012|31061999003|461199028|7071999006|5062599005|20031999003|55001999003|19110799012|15080799012|39105399006|15030799006|3412199025|440099028|26104999006|102099032|40105399003;
x-microsoft-antispam-message-info: 
 =?iso-8859-1?Q?i0bDdbbv8tPfhdZBhkmyLi8y0yNLRzoekRiqKUS6Vu/6dFEsz5LUYWVDhB?=
 =?iso-8859-1?Q?Xd8bF0RQymRvWuLcoFBYwilQU1hXmD+8gBss8qMFwVtk2kWgguubBUvyXf?=
 =?iso-8859-1?Q?eW+4hQOZ4Lfs03lNb8j6kVsSLPNnUVknDsAtxjggtngHEb6Qohjym4C4N4?=
 =?iso-8859-1?Q?ghs++Mgxhddwsg5VHufJLiwYlux6y4pCCQmzpUTBcMGQeFIDS/KXXgR4ZJ?=
 =?iso-8859-1?Q?SpExl0WWZyYWfarruqRo+C0V0ZcXZT7/jPnnKS7PnXFEGUiNo+Qugf19JF?=
 =?iso-8859-1?Q?Toa/mbzbikmIBhmYctQsi0ShjZm0kSt9eNTO1+O74c/fjWp4St8wxO+RMy?=
 =?iso-8859-1?Q?Xct/xXmaYj6riJc3TR9SdNRE3M46Xh3yi1+Dd9iJHQFEH8oyi907oVovwa?=
 =?iso-8859-1?Q?0uEdSWZ6YiSv0MEpLKZozEo/o/EOOxIJgbyEVTqDwribr+c+xPPR1ctLV4?=
 =?iso-8859-1?Q?x2mgde3EbQhPfeYeXhpMB9O4/hNwGwQ9Dh7siIj7JdLc+GvtxN3fafc4fQ?=
 =?iso-8859-1?Q?gdJoSdHNoiT62WS2NmO9L0bUro5TPxLY/77b27r0eFZzhazGcYo4/LABnt?=
 =?iso-8859-1?Q?zNPnQXJrcaSAmujkbSR5LIYB+nEumC9ct1RDr0tVIYDQtvvkFmF5QVXZAa?=
 =?iso-8859-1?Q?bsMQicS5FQv5dPZsWqZdAwLD9VPHzm7qtJytsCqoxGmotzipCGzrjCkbN0?=
 =?iso-8859-1?Q?7hx0kC2nsTu5LA0kYiO4OcLYLzf/XB+Z4pxwSc3nUbyNnXyofaCyHlYfi4?=
 =?iso-8859-1?Q?KQ6uXBOHZSCGkKXuKVq6cQG2BRWlh8Z6pCrXwmiYK8pigQYt079gkQtqTi?=
 =?iso-8859-1?Q?k85T+NKtnQ7iVzC3Guc1GUQnHtEU6Wq3lOUz2HqKFtANJtH2LH7qaJFZnF?=
 =?iso-8859-1?Q?f9N1q414Rms65hEZMJ3r7BGWMImovH5UPkcFOV6YZ6MTl96ljNzJZD4ER4?=
 =?iso-8859-1?Q?EBLNC/GD6N7tfNShDnJUtfqOHA6O376qOn9ArcaGZ3ZXwFeRu0xbbANIXI?=
 =?iso-8859-1?Q?4xTu58Hf6vY63xT9kKO4rP+S2CAsqsV0lCpgmsLEJOf7Vc891C6I4LVmqi?=
 =?iso-8859-1?Q?MvhvUQ9NHUzbHN+ZQoMRygIQYe4jpDO2TuwwrbLBEkeabBwfUojkMoWU3z?=
 =?iso-8859-1?Q?oOP01+SA=3D=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?yMDO5uKO1yMp3OdKARh7CoaiSRLsvyi+uC/vSbx4fH8S+3yazT85AKRmv/?=
 =?iso-8859-1?Q?miWQrfRDoQnjTmISqY8hAbbk7jhYHvg/W1aCJSHN+pWtzoT6nhFHBAXQsG?=
 =?iso-8859-1?Q?Qhu24M7dB7VAxpP0VTRAuG4U9YTU1il3sCwU3G6XzaNWzAWx4aV3Dk0/+j?=
 =?iso-8859-1?Q?jNSEbmFjKxJksV9mUdlx5TQj8OFsOYoNRa/EbIbCoOS+gZDADr5EkrvEI/?=
 =?iso-8859-1?Q?aInYDh+3qEqzj0JlhjviDZfbnwJEyPKn3Eboz5xckyJ1FokzUJXo9Rc6P5?=
 =?iso-8859-1?Q?0KoId0o4OMgeQY8Sb/ymkG6mreaD9YzhHRX3Ga3HMekfMrQhPtoyw0rCbo?=
 =?iso-8859-1?Q?7HQv/HcVLPkUvIkZ2ZJcrX/YUoHtoEaLXjW6SlqK5uNDrIFT5ofApp+RPV?=
 =?iso-8859-1?Q?h6s9mF5keLj5V7frZQaGIMuS2fH7a8ZtTJNRXxveJY+QyAgrLtgXq9sbt1?=
 =?iso-8859-1?Q?HwXN3jEgbZmvXjMevUICUGat1VZV4OCKKKVguyuvA/S75D5kdy3E8Xz4A0?=
 =?iso-8859-1?Q?19k+c6zk7/jPVyR1ylh5evm1ccSbtPNMi0vdDH65Q07PXsenKClf9fGGop?=
 =?iso-8859-1?Q?A8WzOFlxTk9/UsZH22s7lnauWZUtrR/mFeEgbtS3J9dMmEchrri/wXa/7s?=
 =?iso-8859-1?Q?i0GbPDEG5NQOe6nfqtot9rkYYy1XWLVBT+KYRB6sCCrZzlqe0Y8ssDCUqh?=
 =?iso-8859-1?Q?1sIY426UIEDZPR0J8KNla8mrtKGnCuNqPMmPYk5K5eSTfzx7mTCVyoqvnN?=
 =?iso-8859-1?Q?Kgc4OJ7I6cIOKvX13QOwSt33Mjbg73eM25OucNDZSIQI8p2pwlBgs8pDI6?=
 =?iso-8859-1?Q?G8PAyU/TmAdq3KeUIYZzfpZj58wK/2anc2QPeBMAmTN/wUV+7thxmow8Yg?=
 =?iso-8859-1?Q?6rr/LPp6r9feEP0zRlcA/vtJEp8entNNnMCLdAYXadd5cZcKvQyggU6/Kl?=
 =?iso-8859-1?Q?NVQ6zZRe+fAnfg1P8WdhgJroB0GRAVjcEjTzy7AsIZmai64+amAjpa9hdr?=
 =?iso-8859-1?Q?XnGLdGr9r/zGntjDj/om+LSCGVAF9BHVbL+1msXsEBr3jm79Vtj7Z+iiPM?=
 =?iso-8859-1?Q?1dRzXGPoD6B5GPblZ9Uh1DDFhvRW1kOUV46MHys20qo+S/db1sHLSaNilk?=
 =?iso-8859-1?Q?gvYH+m7QWe0iruKIKV1nvTxD6z04Zaz0YCyvgvsnQFV3j3nj8ko0ZukaMX?=
 =?iso-8859-1?Q?FVZ+Y3OmFisLZSFwVYDHhh9INL9ObGjNrLK+XyREC2is1VAx5SODF/g9gT?=
 =?iso-8859-1?Q?J043GmRzBsDys0fn2s66zPG9oe7GfRrPtNQfIQskGJA8qf4zPioPwroCmt?=
 =?iso-8859-1?Q?WncnlSqDta6p/8emwLoDznscMONojR1Fr/tMhzlR4T8kXgNlaYhJAFYbJo?=
 =?iso-8859-1?Q?e5+2s5Jv1na33d+Ra2lP7OTxH1fM29bl3kCXquPsMqQ18nTsnAOLmukNFK?=
 =?iso-8859-1?Q?BnQBmxvGw5fWM08p?=
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0401MB6563.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: a94f5667-c3b3-46c0-03f5-08de752c8e09
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Feb 2026 11:45:35.5062
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR04MB7674
X-Spamd-Bar: ----
X-MailFrom: kunalkmr9717@outlook.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: HYSTSNKMICOGJZ3WW2OU3XHWBMJAZZUS
X-Message-ID-Hash: HYSTSNKMICOGJZ3WW2OU3XHWBMJAZZUS
X-Mailman-Approved-At: Thu, 26 Feb 2026 17:28:08 +0000
CC: "johan@kernel.org" <johan@kernel.org>, "elder@kernel.org" <elder@kernel.org>, "greybus-dev@lists.linaro.org" <greybus-dev@lists.linaro.org>, "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] staging: greybus: audio_manager_module: make envp array const
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/YSUREBYAVYTXVXS3M2R5YNZHJU2IQYO3/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: multipart/mixed; boundary="===============2980202893904007901=="
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.59 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	R_DKIM_REJECT(1.00)[outlook.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx];
	DMARC_POLICY_SOFTFAIL(0.10)[outlook.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[multipart/mixed,multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:~,4:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[outlook.com];
	TO_DN_EQ_ADDR_ALL(0.00)[];
	DKIM_TRACE(0.00)[outlook.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	FROM_NEQ_ENVFROM(0.00)[kunalkmr9717@outlook.com,greybus-dev-bounces@lists.linaro.org];
	RCPT_COUNT_FIVE(0.00)[6];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	TAGGED_RCPT(0.00)[greybus-dev];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[outlook.com:email,lists.linaro.org:helo,lists.linaro.org:rdns,linaro.org:email,KL1PR0401MB6563.apcprd04.prod.outlook.com:mid]
X-Rspamd-Queue-Id: E1CBE1AC640
X-Rspamd-Action: no action

--===============2980202893904007901==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_KL1PR0401MB6563219414B87B4EE2C2CC77DD72AKL1PR0401MB6563_"

--_000_KL1PR0401MB6563219414B87B4EE2C2CC77DD72AKL1PR0401MB6563_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

From 630a0c3367818fa30032b85df71fbb03eaefb1b4 Mon Sep 17 00:00:00 2001
From: Kunal <kunalkmr9717@outlook.com>
Date: Thu, 26 Feb 2026 11:31:47 +0000
Subject: [PATCH] staging: greybus: audio_manager_module: make envp array co=
nst
Signed-off-by: Kunal <kunalkmr9717@outlook.com>
---
 drivers/staging/greybus/audio_manager_module.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
diff --git a/drivers/staging/greybus/audio_manager_module.c b/drivers/stagi=
ng/greybus/audio_manager_module.c
index e87b82ca6d8a..7a25af3421d8 100644
--- a/drivers/staging/greybus/audio_manager_module.c
+++ b/drivers/staging/greybus/audio_manager_module.c
@@ -159,7 +159,7 @@ static void send_add_uevent(struct gb_audio_manager_mod=
ule *module)
        char ip_devices_string[64];
        char op_devices_string[64];
-       char *envp[] =3D {
+       char * const envp[] =3D {
                name_string,
                vid_string,
                pid_string,
--
2.43.0

--_000_KL1PR0401MB6563219414B87B4EE2C2CC77DD72AKL1PR0401MB6563_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<span class=3D"elementToProof">From 630a0c3367818fa30032b85df71fbb03eaefb1b=
4 Mon Sep 17 00:00:00 2001</span></div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<span class=3D"elementToProof">From: Kunal &lt;kunalkmr9717@outlook.com&gt;=
</span></div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<span class=3D"elementToProof">Date: Thu, 26 Feb 2026 11:31:47 +0000</span>=
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<span class=3D"elementToProof">Subject: [PATCH] staging: greybus: audio_man=
ager_module: make envp array const</span></div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<span class=3D"elementToProof">Signed-off-by: Kunal &lt;kunalkmr9717@outloo=
k.com&gt;</span></div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<span class=3D"elementToProof">---</span></div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<span class=3D"elementToProof">&nbsp;drivers/staging/greybus/audio_manager_=
module.c | 2 +-</span></div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<span class=3D"elementToProof">&nbsp;1 file changed, 1 insertion(+), 1 dele=
tion(-)</span></div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<span class=3D"elementToProof">diff --git a/drivers/staging/greybus/audio_m=
anager_module.c b/drivers/staging/greybus/audio_manager_module.c</span></di=
v>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<span class=3D"elementToProof">index e87b82ca6d8a..7a25af3421d8 100644</spa=
n></div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<span class=3D"elementToProof">--- a/drivers/staging/greybus/audio_manager_=
module.c</span></div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<span class=3D"elementToProof">+++ b/drivers/staging/greybus/audio_manager_=
module.c</span></div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<span class=3D"elementToProof">@@ -159,7 +159,7 @@ static void send_add_uev=
ent(struct gb_audio_manager_module *module)</span></div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<span class=3D"elementToProof">&nbsp; &nbsp; &nbsp; &nbsp; char ip_devices_=
string[64];</span></div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<span class=3D"elementToProof">&nbsp; &nbsp; &nbsp; &nbsp; char op_devices_=
string[64];</span></div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<span class=3D"elementToProof">- &nbsp; &nbsp; &nbsp; char *envp[] =3D {</s=
pan></div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<span class=3D"elementToProof">+ &nbsp; &nbsp; &nbsp; char * const envp[] =
=3D {</span></div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<span class=3D"elementToProof">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; name_string,</span></div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<span class=3D"elementToProof">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; vid_string,</span></div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<span class=3D"elementToProof">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; pid_string,</span></div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<span class=3D"elementToProof">--</span></div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<span class=3D"elementToProof">2.43.0</span></div>
</body>
</html>

--_000_KL1PR0401MB6563219414B87B4EE2C2CC77DD72AKL1PR0401MB6563_--

--===============2980202893904007901==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

--===============2980202893904007901==--
