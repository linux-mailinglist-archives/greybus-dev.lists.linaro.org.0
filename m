Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CBA3CF3BF6
	for <lists+greybus-dev@lfdr.de>; Mon, 05 Jan 2026 14:19:27 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 5887F40154
	for <lists+greybus-dev@lfdr.de>; Mon,  5 Jan 2026 13:19:26 +0000 (UTC)
Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazolkn19012051.outbound.protection.outlook.com [52.103.43.51])
	by lists.linaro.org (Postfix) with ESMTPS id 630E53F835
	for <greybus-dev@lists.linaro.org>; Mon,  5 Jan 2026 09:46:04 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=outlook.com header.s=selector1 header.b=PUsjbK+B;
	spf=pass (lists.linaro.org: domain of holden.hsu.linux@outlook.com designates 52.103.43.51 as permitted sender) smtp.mailfrom=holden.hsu.linux@outlook.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1");
	dmarc=pass (policy=none) header.from=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QvvAbowoEx4E9402YQRbLw9CZqG/Eqcm7usLy6IVQ5tEGC8XN/PDpsrbiyTjC0YvySXOuDXC1gDp7zSKmbTsmzA1bF/jMYMmyw+0MSTwobZMgthYE9DNavWlr2pmpRI6R9aBpoodpcvN/7I1XOjaYc2VmHDF1GEUCjoygZ0IL94PMAOIcx3j9T1CFfGC+9MFaOS8vUfUNQ91In6CujbBNO5RoPU35AmKppoj/joPsT4gmHMyTPIXhIjRbW635bTdWxA1OD8fqrojosbPB34t61zfZcwBzXyQP2q8S93NXi/0cGzNqEVmtH3ssvDH1zsOYc++UrzWO/7/xYJt6EJj/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oX8gHNXafn2buIi63+wigkOo8C7n7bXoOjHzk/+XTAM=;
 b=RHhCyq4GzYSqpIviD4OhTR/YVcsAlUGNWVeW5sy1AhALONZ/TWB0rZwXGTIqeX89pcn1eQ0GHLtZQ+gsGcXocyatRhcwVrZ7ro5X0tesmCsQhEK7irlBdoEI45Qwhyq6qPVOknLYBiNcz64G9qpEzfzmHVB732o4STseD6tuLPkKYU34zn/u/6FW+RRMPpgZle7NI5MT8szhQabIpxRt+lRcissvajLKVLQ4hec+MYHYKqn17xtxkdwFTxClOUV1+tZnM2B/U9oFF4gTp2I4Jsil38/cOPpjPzmC6itWyWDmH96bzuEY/cAhb+sDxy+TPhIuf5K5qEJ9wsMGPUZo/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oX8gHNXafn2buIi63+wigkOo8C7n7bXoOjHzk/+XTAM=;
 b=PUsjbK+B+rAVD8kvFfiN5EhBMMe2RW+kfiSw8qtqOdwwlyVzIgclEeY6APMYmIeZEtHvQVgcnW8umGvd2EM7iQL4sQgAdD/Y/QiPpXRUEhfuGAieBvP4kIJsyudbbT3/KvyIMGCMxmeg5gXYD8PnIEmb/nZGiscCVrtFGgFErnFdujzY6H6nZgU557RiYHoJfM3K52OwGcvwTUkEeU0e88BuTBPi1nHCj3xhFHSCwutfgPptobmoqI7bFiiB2bAtey81YrTatn+vbqXXk3rlLN5EX4nh7b5WfV1ZHmcLYHEiasja1PIOkKKHddEyMB/7MuqYJD0a1OYADYRjHr4qqg==
Received: from SEYPR04MB9077.apcprd04.prod.outlook.com (2603:1096:101:2f5::12)
 by SG2PR04MB5746.apcprd04.prod.outlook.com (2603:1096:4:1d3::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 09:46:00 +0000
Received: from SEYPR04MB9077.apcprd04.prod.outlook.com
 ([fe80::db68:ff09:6ee3:e6f3]) by SEYPR04MB9077.apcprd04.prod.outlook.com
 ([fe80::db68:ff09:6ee3:e6f3%5]) with mapi id 15.20.9478.004; Mon, 5 Jan 2026
 09:46:00 +0000
From: Hsu Holden <holden.hsu.linux@outlook.com>
To: "greybus-dev@lists.linaro.org" <greybus-dev@lists.linaro.org>
Thread-Topic: [PATCH 0/2] staging: greybus: arche-platform: minor fixes
Thread-Index: AQHcfigQKFsuKFdQ8U6z/W+vzpU+Xw==
Date: Mon, 5 Jan 2026 09:45:59 +0000
Message-ID: 
 <SEYPR04MB9077BA22243B0B371B778DD9BA86A@SEYPR04MB9077.apcprd04.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-reactions: allow
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR04MB9077:EE_|SG2PR04MB5746:EE_
x-ms-office365-filtering-correlation-id: 9c38b1bf-7f00-49ef-cdf1-08de4c3f3b76
x-microsoft-antispam: 
 BCL:0;ARA:14566002|9400799043|51005399006|12050799012|14030799003|15080799012|6092099016|8060799015|8062599012|19110799012|461199028|31061999003|1602099012|20055399003|40105399003|4302099013|3412199025|440099028|102099032|26115399003|3430499032|1710799026;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?Baub68BzLB+VJU6eIWPhFa34RHTEogUB2JTTBoW2gT2VEFcJJPWKD9YaQgKj?=
 =?us-ascii?Q?HLwyGO5p4+eYalvKHkXcaUTi6OCy2ypHY7Qj9Y/zoZ12NjFXzSL/Nc5g2AF/?=
 =?us-ascii?Q?0F98djDe3v7vzUE/S3CGtIYIo1GTKU+L69xmchdoRCTe7zYDRj22lC6v/EO4?=
 =?us-ascii?Q?3CHGEDAjDvy/3JaFyi+VEzP9ZVYU1HPK3R9ak711nEyi6iomF7RD0EiWnlXJ?=
 =?us-ascii?Q?pHkXCOO9TVNrveMExY9V5e+8TmJn4FsrJRX0XhK6iqxRTySoWBsBIoZqZGMD?=
 =?us-ascii?Q?rZvulucRcsp0lwhjn2QidqVT1OImwYI2iZBasFzfuKDZLdcgyuIGqVW0MVdo?=
 =?us-ascii?Q?I51uj5EbxczQ+36Ic0USbdyGVxgUNyUS0WRnsNgQ7feVHCFtur5IvSGSB+12?=
 =?us-ascii?Q?9KGigkKvSVfTNma4kXFQNaSp5d8CITcB9eTVemOFYvCAHgwyGpd9Oa0pI7jB?=
 =?us-ascii?Q?Gvlv+j89JFAoG4MdfVT7tedErRcqSIr3+iE8pwW5KmI8nVAehKxKNCCSmFn9?=
 =?us-ascii?Q?TZq0wQoIHkX6T2BKeOfxF5qciTC1ya8Av+3P3vzWrzm4myEHRmhL5/3AvQe2?=
 =?us-ascii?Q?lowjwQEMV88Qur60osxwIhouJbRH5KYuI3hnrAt3BxZzitHD6tIu3aLdm7rJ?=
 =?us-ascii?Q?mnzITCaiBhF91qtVN/guysTnSlbd/TuBoDOSPXc5qxv55S4J+MA5hNwYaZht?=
 =?us-ascii?Q?1T3SFou0MlomiYjpUoJstdau7GqASu9YNV49RZWiG7BaDW1RkY9jKX9CuAAl?=
 =?us-ascii?Q?yQXEmlRPj1OGm6EOwEmo/MxnNxCMtJQL+H2NkPZzvOPRkLjc3qIKRPiDHxYR?=
 =?us-ascii?Q?XAreSb7LWLZ/pbKshYxRk8f0CTUU6c48SD0wQtLwubrd3rjM0I/ULRLIj74w?=
 =?us-ascii?Q?CNXIs0OuIl7Dh4ZurfuvnAPqDXt+zrmWtQumaa9u3dk8r13ODAP7B5rUOuwq?=
 =?us-ascii?Q?X47zl0nZpha5vA9CKCW9/lpuTOO+xYo8aLa3Olv2NifGsRqJTeH+4ugw6ALq?=
 =?us-ascii?Q?MGXMqigCimfwISOUF6J8bL3ejj189mC67GzkpFWqZAmIPLtctpWWSfYWIB5Z?=
 =?us-ascii?Q?q9WBepNoGHZWHhzJ+I3B/n4fWxA7KskuPBoNtu29Jw0+wmLlMvWyBSsv22b6?=
 =?us-ascii?Q?FEPL/+HgncZdR63mrGpZAxgwD2kDwDgcsKLs+eYnRfTjm19bNOBIOiiZe1ee?=
 =?us-ascii?Q?hhuB43mLNUE9oMWy8+FKiCbNc9y94UhYvmQpKB4HNURGaMouhnpEjCq23+Lv?=
 =?us-ascii?Q?y6g689HD9rO5XZxf4hI+hcdx13Lsl75VOaqUgHLVzlkRWsI0/0qL06dIHICd?=
 =?us-ascii?Q?mtTV4klOToa6bu1h6qUHdYrgoCLJtmLIe5HUHyUoXfHeRweilJSwOFHKlZnQ?=
 =?us-ascii?Q?pPQxPFw9+obtqUfUbiBC6alda2yeNb/f2wXnwUUrGy0wXX70AkvOl2I2jf5I?=
 =?us-ascii?Q?bcJnN24ZPcdJ4jMD/qxXJoLIhQKUGe+E?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?NPXfQZ5jeq642mKpubYbPT4TAR896a1TyilBm67SI31MJObSewhQnTRfKINy?=
 =?us-ascii?Q?z2SaOfvMJKjTdNIlPaBRNIRj/sXablaVUXl8mWPwV2KC1pGjdcSoIatXXGzU?=
 =?us-ascii?Q?0WY/XDK4VkYo8NTtOSAT5OI2vxOnR9FSqLHZkbL9DXUxlQl6YqY08gjKybqF?=
 =?us-ascii?Q?RqOXhJr7BY7W5GisNHwFBcy8S0ahaYTvuL1FOWTTcOGJWkQdoMI6yDodqhKC?=
 =?us-ascii?Q?62VREKybj+dCymtB+uZdq+pGokMi4aH3jFIhR5btb1TRHwI2KH0kjJ06BjhA?=
 =?us-ascii?Q?ubCY7gXSy3d6C3mSSTAM3V0v7tDg7SKNpapMX2wEBekUXMVqqe6pd8cdPAyK?=
 =?us-ascii?Q?5523Dr2DjmRcH5kP0q2M69h7HvJQDhe0AKPi2TI9whKmM8veEu+15vxF/mSG?=
 =?us-ascii?Q?Z5/oGnIm04ETULMxTInq3/msZ7g5uciGv4m7h5T1f41yV3gBoP6NgrYF8tO2?=
 =?us-ascii?Q?pWMrOvRE+lXIX5SoMewpce/oL9pD9vL3yZMpbmYt9mvYsh0HF+97q/dV49DN?=
 =?us-ascii?Q?Zy0PPziS5nkrUKqPFDQ70uwz9mu75FBLm2E+auA/X0jvj9Uy978xZQB9xPUV?=
 =?us-ascii?Q?+WLI0SK5mWuSc91dIWNtmRe327Lk5emfjRaPA2KItimLcj1KbjUuEhaA1Vf4?=
 =?us-ascii?Q?g3aoV4ZfMKgcQFmVIbgj2XeKfXnUwudzfRbDlDOrfauygQ37/AplCSglmT6i?=
 =?us-ascii?Q?tKWdgmS+HQHI0CT6UQBCe5nLbv1uUl2dRzktw5JM7UscMZYReKl3EGm/5auK?=
 =?us-ascii?Q?Pb4MPAMg/1FysVLtVb9Z0mIs8DsKR94Y8WpUDI7IKYAlVSrejp/qEA1QoS7F?=
 =?us-ascii?Q?Wq5uhAShHKKV/XU0SnYIMLcvMO5ZJaxqK9lsucit4L3/l2Qhz0bWXY321Cz+?=
 =?us-ascii?Q?5+E4U5nQUxH6ruo4mXeWVfeWe813crexGnH2RqFI3qi5dd9Q/D7Fa+JeuzvT?=
 =?us-ascii?Q?tWpo416vrECngywvIb42oXyt0G8CYDl3AkEeGJboHxlAsqVQUXcZtC7WfJ2O?=
 =?us-ascii?Q?/V6dZRhHzhc86P8mzn1wbjU+0TCk6gmlceigY1rqvCSE0vCKH4GP3qUo+qgX?=
 =?us-ascii?Q?ZS8KipsGXsUtJqqkG9htfRlmMt34xesuCTfelur86+YshdA3GNhX+xxX047d?=
 =?us-ascii?Q?gXzAvANntnYpy9zQ5zQWlPV/BFeVHvRHN24aicu1Nsgh+OvprRAOq6z2jiug?=
 =?us-ascii?Q?aK8MGy/+R8T0EdVJFl3/nU54wN5uwvPi1SNHP5cLifVQrCYG8jDOCLAvB6As?=
 =?us-ascii?Q?KX66UbpIBEsDJK6GCgxo/GUSUqTDkn1BERM9sYne954he0PB9HJYEJxJMIlD?=
 =?us-ascii?Q?xCNGc0P638/oCCldJSm0XRvpWmqGx+UvIffMzk9ui+x2i1u1r68KAQSHT+ir?=
 =?us-ascii?Q?q9aeUhjH6CmfaVFZo4fOVImoNcgYMl7RkHdEbhpBUDZsztS3ckwgWEXxxQVV?=
 =?us-ascii?Q?iXblFj5n/e4z1LWa2IMtbGihM9xHaurU?=
Content-Type: multipart/mixed;
	boundary="_006_SEYPR04MB9077BA22243B0B371B778DD9BA86ASEYPR04MB9077apcp_"
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR04MB9077.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c38b1bf-7f00-49ef-cdf1-08de4c3f3b76
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jan 2026 09:45:59.7017
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR04MB5746
X-Rspamd-Queue-Id: 630E53F835
X-Spamd-Bar: ----
X-Spamd-Result: default: False [-4.99 / 15.00];
	BAYES_HAM(-2.99)[99.95%];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[outlook.com,none];
	R_DKIM_ALLOW(-0.20)[outlook.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:52.103.0.0/17];
	MIME_GOOD(-0.10)[multipart/mixed,multipart/alternative,text/plain];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	URIBL_BLOCKED(0.00)[outlook.com:dkim,outlook.com:from_smtp,outlook.com:from_mime,TYPPR03CU001.outbound.protection.outlook.com:helo,SEYPR04MB9077.apcprd04.prod.outlook.com:mid];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,driverdev.osuosl.org,outlook.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:~,4:~,5:~,6:~];
	HAS_ATTACHMENT(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FREEMAIL_FROM(0.00)[outlook.com];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_TRACE(0.00)[outlook.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	REDIRECTOR_URL(0.00)[aka.ms];
	RWL_MAILSPIKE_POSSIBLE(0.00)[52.103.43.51:from];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:8075, ipnet:52.96.0.0/12, country:US];
	FREEMAIL_ENVFROM(0.00)[outlook.com]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-MailFrom: holden.hsu.linux@outlook.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: Q5NDUPZYSBN3KDPMIUWLK7RPHBPD3E3B
X-Message-ID-Hash: Q5NDUPZYSBN3KDPMIUWLK7RPHBPD3E3B
X-Mailman-Approved-At: Mon, 05 Jan 2026 13:19:15 +0000
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>, Hsu Holden <holden.hsu.linux@outlook.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH 0/2] staging: greybus: arche-platform: minor fixes
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/YQUDRGCXCYJTUTAC42OFTEI67ZAHDVT5/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>

--_006_SEYPR04MB9077BA22243B0B371B778DD9BA86ASEYPR04MB9077apcp_
Content-Type: multipart/alternative;
	boundary="_000_SEYPR04MB9077BA22243B0B371B778DD9BA86ASEYPR04MB9077apcp_"

--_000_SEYPR04MB9077BA22243B0B371B778DD9BA86ASEYPR04MB9077apcp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

This patch series contains two minor cleanups for the arche-platform driver=
:

Patch 1: Clarifies an unclear TODO comment to make the intent more obvious
         to future developers.

Patch 2: Fixes a simple spelling mistake in a comment.

These are low-risk changes that improve code readability.

Get Outlook for Android<https://aka.ms/AAb9ysg>

--_000_SEYPR04MB9077BA22243B0B371B778DD9BA86ASEYPR04MB9077apcp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
</head>
<body>
<div dir=3D"auto" style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MS=
FontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0,=
 0, 0);">
This patch series contains two minor cleanups for the arche-platform driver=
:</div>
<div class=3D"elementToProof" dir=3D"auto" style=3D"font-family: Aptos, Apt=
os_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-=
size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" dir=3D"auto" style=3D"font-family: Aptos, Apt=
os_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-=
size: 12pt; color: rgb(0, 0, 0);">
Patch 1: Clarifies an unclear TODO comment to make the intent more obvious<=
/div>
<div class=3D"elementToProof" dir=3D"auto" style=3D"font-family: Aptos, Apt=
os_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-=
size: 12pt; color: rgb(0, 0, 0);">
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;to future developers.</div>
<div class=3D"elementToProof" dir=3D"auto" style=3D"font-family: Aptos, Apt=
os_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-=
size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" dir=3D"auto" style=3D"font-family: Aptos, Apt=
os_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-=
size: 12pt; color: rgb(0, 0, 0);">
Patch 2: Fixes a simple spelling mistake in a comment.</div>
<div class=3D"elementToProof" dir=3D"auto" style=3D"font-family: Aptos, Apt=
os_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-=
size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div dir=3D"auto" style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MS=
FontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0,=
 0, 0);">
These are low-risk changes that improve code readability.</div>
<div id=3D"ms-outlook-mobile-body-separator-line" data-applydefaultfontstyl=
es=3D"true" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-system=
, Roboto, Arial, Helvetica, sans-serif; font-size: 12pt;" dir=3D"auto">
<div dir=3D"auto" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-=
system, Roboto, Arial, Helvetica, sans-serif; font-size: 12pt;">
<br>
</div>
</div>
<div style=3D"font-family: Aptos, Aptos_MSFontService, -apple-system, Robot=
o, Arial, Helvetica, sans-serif; font-size: 12pt;" id=3D"ms-outlook-mobile-=
signature" dir=3D"auto">
<span style=3D"font-family: Aptos, Aptos_MSFontService, -apple-system, Robo=
to, Arial, Helvetica, sans-serif; font-size: 12pt;">Get
<a href=3D"https://aka.ms/AAb9ysg">Outlook for Android</a></span></div>
</body>
</html>

--_000_SEYPR04MB9077BA22243B0B371B778DD9BA86ASEYPR04MB9077apcp_--

--_006_SEYPR04MB9077BA22243B0B371B778DD9BA86ASEYPR04MB9077apcp_
Content-Type: application/octet-stream; name="0000-cover-letter.patch"
Content-Description: 0000-cover-letter.patch
Content-Disposition: attachment; filename="0000-cover-letter.patch"; size=766;
	creation-date="Mon, 05 Jan 2026 09:45:46 GMT";
	modification-date="Mon, 05 Jan 2026 09:45:46 GMT"
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

--_006_SEYPR04MB9077BA22243B0B371B778DD9BA86ASEYPR04MB9077apcp_
Content-Type: application/octet-stream;
	name="0001-staging-greybus-arche-platform-clarify-TODO-comment.patch"
Content-Description: 
 0001-staging-greybus-arche-platform-clarify-TODO-comment.patch
Content-Disposition: attachment;
	filename="0001-staging-greybus-arche-platform-clarify-TODO-comment.patch";
	size=1166; creation-date="Mon, 05 Jan 2026 09:45:46 GMT";
	modification-date="Mon, 05 Jan 2026 09:45:46 GMT"
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

--_006_SEYPR04MB9077BA22243B0B371B778DD9BA86ASEYPR04MB9077apcp_
Content-Type: application/octet-stream;
	name="0002-staging-greybus-arche-platform-fix-spelling-mistake.patch"
Content-Description: 
 0002-staging-greybus-arche-platform-fix-spelling-mistake.patch
Content-Disposition: attachment;
	filename="0002-staging-greybus-arche-platform-fix-spelling-mistake.patch";
	size=997; creation-date="Mon, 05 Jan 2026 09:45:47 GMT";
	modification-date="Mon, 05 Jan 2026 09:45:47 GMT"
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

--_006_SEYPR04MB9077BA22243B0B371B778DD9BA86ASEYPR04MB9077apcp_
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

--_006_SEYPR04MB9077BA22243B0B371B778DD9BA86ASEYPR04MB9077apcp_--
