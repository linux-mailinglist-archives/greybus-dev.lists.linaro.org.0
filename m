Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DB8618F0A6
	for <lists+greybus-dev@lfdr.de>; Mon, 23 Mar 2020 09:11:02 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 4922A60911
	for <lists+greybus-dev@lfdr.de>; Mon, 23 Mar 2020 08:11:01 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 3413C60B45; Mon, 23 Mar 2020 08:11:01 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,FORGED_SPF_HELO,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id C946B61697;
	Mon, 23 Mar 2020 08:10:34 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id C3AD16013A
 for <greybus-dev@lists.linaro.org>; Tue, 17 Mar 2020 12:32:45 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id A8D6E60820; Tue, 17 Mar 2020 12:32:45 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2105.outbound.protection.outlook.com [40.107.20.105])
 by lists.linaro.org (Postfix) with ESMTPS id D6C436013A
 for <greybus-dev@lists.linaro.org>; Tue, 17 Mar 2020 12:32:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ESHqWtOC3v9sz0JPkxqO79IZBKaoNM51srksC0wJGcsxZjkPiGYNLWQOxzNmnEj3U8IYC8jEGaeXwV8+1Qc4RigZ0XhE/3vqCg4iH192snDdyLuG6kg3v1dqBjam4NAdxjaN7GxNRNIYFc7Bv27+gfsnSpZw7M3gDFFhBGrnPz2qMyd53F7utzdEcYWZ6O+3dV21ap4I0zpUo9HAVytF47E8fRbA4Spco3nrYa3CqM6cN7a68G8f1W3Ygi5T5nM9gmA3GtIZu1vVzCvDcoD5vTmg2s7fClXFtsdZt5dnecd4nQ5WnO+Wqms5FSDuRkOOmjnviHOTN2ECbYhExA9Xsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X1kzIb4eTW5m19cXA3bGGxxlI19Ra1xshRUwlCjvXDI=;
 b=UXrQUOvRbZeXEw4JUIHXIPd5AfDQhTJbznX6sSq43KvLbVWwZbCC54aXH46nA2Eq8sG+2q4GCiSMyAUk1RLzCsFE4uRk6dHB8HgVrsPHHLdaNKVn0UwEcphB5UVxvGNR6GIwGJpWRzn31HCCupA14HSliflNcPQCEED63v+xl0dJ3iaNfsnHfRAXimNaG3abnC8+l91diDgB7PFtzNDQHpf3Tg+YM27MbyBnXsewQptiTkUQlSuOYWl46+4MH9AZ3yTnXGOvIdS7pot5PtUDb53gDtgsmHTVOorem3arAFZWgP43OZxSSe2j3345vDyToCG7KLtaKLNFTywNrx/aQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=toradex.com; dmarc=pass action=none header.from=toradex.com;
 dkim=pass header.d=toradex.com; arc=none
Received: from VI1PR05MB3279.eurprd05.prod.outlook.com (10.170.238.24) by
 VI1PR05MB4462.eurprd05.prod.outlook.com (10.171.182.156) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2814.13; Tue, 17 Mar 2020 12:32:40 +0000
Received: from VI1PR05MB3279.eurprd05.prod.outlook.com
 ([fe80::7cdd:4feb:a8b6:a6d2]) by VI1PR05MB3279.eurprd05.prod.outlook.com
 ([fe80::7cdd:4feb:a8b6:a6d2%7]) with mapi id 15.20.2814.021; Tue, 17 Mar 2020
 12:32:40 +0000
From: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
To: devicetree@vger.kernel.org,
	linux-pwm@vger.kernel.org
Date: Tue, 17 Mar 2020 14:32:24 +0200
Message-Id: <20200317123231.2843297-1-oleksandr.suvorov@toradex.com>
X-Mailer: git-send-email 2.24.1
X-ClientProxiedBy: PR0P264CA0058.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1d::22) To VI1PR05MB3279.eurprd05.prod.outlook.com
 (2603:10a6:802:1c::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (82.193.109.226) by
 PR0P264CA0058.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1d::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2814.16 via Frontend Transport; Tue, 17 Mar 2020 12:32:39 +0000
X-Mailer: git-send-email 2.24.1
X-Originating-IP: [82.193.109.226]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 92f24b8f-5335-4211-67f5-08d7ca6f484d
X-MS-TrafficTypeDiagnostic: VI1PR05MB4462:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR05MB44628731F18F14F7CEA38AA8F9F60@VI1PR05MB4462.eurprd05.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-Forefront-PRVS: 0345CFD558
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10019020)(4636009)(39850400004)(396003)(136003)(366004)(346002)(376002)(199004)(66946007)(6666004)(66476007)(66556008)(5660300002)(7406005)(36756003)(7416002)(7336002)(1076003)(4326008)(7366002)(26005)(6496006)(44832011)(52116002)(54906003)(81166006)(81156014)(2906002)(8676002)(55236004)(316002)(186003)(8936002)(956004)(478600001)(2616005)(6486002)(86362001)(16526019);
 DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR05MB4462;
 H:VI1PR05MB3279.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; 
Received-SPF: None (protection.outlook.com: toradex.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ajbru8RbLQmgjKwD+95r2KCid79cKzjDo03netdLt+HAWjyngf9jw0cT51IHD8agmsUDBreJ48OzhG/PgghyhnuDmqqo0bg7m17hlhuUw9lDdeUlgdoL2nwzxrsTai0nDxktojNfKmImYoa8l1gGtJPkCt7BTyNIPqRMjFYsvGuljdurMwIVSVB0/z3c5DGSrIG0+/Wh0JyZghswX077mjVbbza7x3w/N+Zs+8y64d4lKxJhYgwBhehNxonij18bq6EdzWxNEpI3dupulYhX9PXr6zd8b/DhM0a3c8B7KSv1PUb5UThx0V708z6YmC4Z/FB4D90C7/KrtW7ZNem61ZRCVvtS0/lA22b/HHkPsD/0qeNNOTUtTwofLO+g96hiY+h17UPa/Sjis0uL+DDVe4qI1b/LGKhB8vDBtCGad8NVe4ZUlsZBOROxpes+fb4v
X-MS-Exchange-AntiSpam-MessageData: EGpmD3tLLdvnd4GrcyLclYhQyBBCFMZozHtqfPv08FPrjYoImY0rCyhXl9vJrzDuzQVqeLBY3PUx1gp6qYRGhtjlE181vtIV6NbaS9AaSM1ABLzDumIqvbvN7buNZzplJQk8/gANax6tTTT7LWlO5Q==
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92f24b8f-5335-4211-67f5-08d7ca6f484d
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2020 12:32:40.1226 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d9995866-0d9b-4251-8315-093f062abab4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zz/FEFsAObuiUoMoYiFwvs6Kups5z5Shlju/DdLCfKiNEjs2mBSiP8Jdf+YqLwOq8INbIuD82e6zXBWoCcfGWfkknYHoK8UuJGXlnD7L0ZM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB4462
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Mon, 23 Mar 2020 08:10:29 +0000
Cc: Heiko Stuebner <heiko@sntech.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>, Sekhar Nori <nsekhar@ti.com>,
 dri-devel@lists.freedesktop.org, Soeren Moch <smoch@web.de>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Hugh Cole-Baker <sigmaris@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-samsung-soc@vger.kernel.org,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Katsuhiro Suzuki <katsuhiro@katsuster.net>,
 Kevin Hilman <khilman@baylibre.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 NXP Linux Team <linux-imx@nxp.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-omap@vger.kernel.org,
 Alex Elder <elder@kernel.org>, Scott Branden <sbranden@broadcom.com>,
 linux-kernel@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Jingoo Han <jingoohan1@gmail.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Kever Yang <kever.yang@rock-chips.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Magnus Damm <magnus.damm@gmail.com>, linux-rockchip@lists.infradead.org,
 Kukjin Kim <kgene@kernel.org>, Jagan Teki <jagan@amarulasolutions.com>,
 Alexandre Torgue <alexandre.torgue@st.com>, Maxime Ripard <mripard@kernel.org>,
 greybus-dev@lists.linaro.org, linux-rpi-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, Johan Jonker <jbx6244@gmail.com>,
 Fabrice Gasnier <fabrice.gasnier@st.com>, linux-arm-kernel@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Andy Yan <andy.yan@rock-chips.com>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Christoph Muellner <christoph.muellner@theobroma-systems.com>,
 linux-fbdev@vger.kernel.org, Stefan Agner <stefan@agner.ch>,
 Philipp Tomsich <philipp.tomsich@theobroma-systems.com>,
 Fabio Estevam <festevam@gmail.com>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Florian Fainelli <f.fainelli@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, bcm-kernel-feedback-list@broadcom.com,
 Nick Xie <nick@khadas.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Ray Jui <rjui@broadcom.com>, Steven Rostedt <rostedt@goodmis.org>,
 Vladimir Zapolskiy <vz@mleia.com>, Paul Barker <pbarker@konsulko.com>,
 Paul Cercueil <paul@crapouillou.net>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Shawn Guo <shawnguo@kernel.org>, Peter Rosin <peda@axentia.se>,
 Milo Kim <milo.kim@ti.com>, Tony Lindgren <tony@atomide.com>,
 Oleksandr Suvorov <oleksandr.suvorov@toradex.com>,
 linux-riscv@lists.infradead.org, Lee Jones <lee.jones@linaro.org>,
 devel@driverdev.osuosl.org, Marc Zyngier <maz@kernel.org>,
 Markus Reichl <m.reichl@fivetechno.de>, Ingo Molnar <mingo@redhat.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 David Lechner <david@lechnology.com>, Johan Hovold <johan@kernel.org>,
 Philippe Schenker <philippe.schenker@toradex.com>,
 Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 =?UTF-8?q?Andrius=20=C5=A0tikonas?= <andrius@stikonas.eu>,
 Igor Opaniuk <igor.opaniuk@toradex.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Tony Prisk <linux@prisktech.co.nz>,
 Jisheng Zhang <Jisheng.Zhang@synaptics.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
 Robin Murphy <robin.murphy@arm.com>
Subject: [greybus-dev] [RFC PATCH 0/7] Rework PWM_POLARITY_* flags
X-BeenThere: greybus-dev@lists.linaro.org
X-Mailman-Version: 2.1.16
Precedence: list
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
List-Unsubscribe: <https://lists.linaro.org/mailman/options/greybus-dev>,
 <mailto:greybus-dev-request@lists.linaro.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/greybus-dev/>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Subscribe: <https://lists.linaro.org/mailman/listinfo/greybus-dev>,
 <mailto:greybus-dev-request@lists.linaro.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: greybus-dev-bounces@lists.linaro.org
Sender: "greybus-dev" <greybus-dev-bounces@lists.linaro.org>
X-Virus-Scanned: ClamAV using ClamSMTP

ClBXTV9QT0xBUklUWV8qIGZsYWdzIHdlcmUgZGVmaW5lZCBpbiBpbmNsdWRlL2xpbnV4L3B3bS5o
IGFzIGEgZW51bSBhbmQKaW4gaW5jbHVkZS9kdC1iaW5kaW5ncy9wd20vcHdtLmggYXMgbWFjcm9z
LgoKVGhpcyBwYXRjaHNldCBmaXhlcyBkdXBsaWNhdGlvbiBhbmQgaW50cm9kdWNlcyB1c2luZyBQ
V01fUE9MQVJJVFlfTk9STUFMCmZsYWcgaW5zdGVhZCBvZiAnMCcgY29uc3RhbnQgaW4gRFQgZmls
ZXMuCgoKT2xla3NhbmRyIFN1dm9yb3YgKDcpOgogIHB3bTogcmVuYW1lIHRoZSBQV01fUE9MQVJJ
VFlfSU5WRVJTRUQgZW51bQogIGR0LWJpbmRpbmdzOiBwd206IGRvY3VtZW50IHRoZSBQV00gcG9s
YXJpdHkgZmxhZwogIGR0LWJpbmRpbmdzOiBwd206IGFkZCBub3JtYWwgUFdNIHBvbGFyaXR5IGZs
YWcKICBkdC1iaW5kaW5nczogcHdtOiBhZGQgZGVzY3JpcHRpb24gb2YgUFdNIHBvbGFyaXR5CiAg
cHdtOiByZXBsYWNlIHBvbGFyaXR5IGVudW0gd2l0aCBtYWNyb3MKICBhcm02NDogZHRzOiBwd206
IHJlcGxhY2UgcG9sYXJpdHkgY29uc3RhbnQgd2l0aCBtYWNybwogIGFybTogZHRzOiBwd206IHJl
cGxhY2UgcG9sYXJpdHkgY29uc3RhbnQgd2l0aCBtYWNybwoKIERvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9wd20vcHdtLnR4dCB8ICAxICsKIGFyY2gvYXJtL2Jvb3QvZHRzL2FtMzM1
eC1jbS10MzM1LmR0cyAgICAgICAgICB8ICAyICstCiBhcmNoL2FybS9ib290L2R0cy9hbTMzNXgt
ZXZtLmR0cyAgICAgICAgICAgICAgfCAgMiArLQogYXJjaC9hcm0vYm9vdC9kdHMvYW0zNTE3LWV2
bS5kdHMgICAgICAgICAgICAgIHwgIDIgKy0KIGFyY2gvYXJtL2Jvb3QvZHRzL2F0OTEtZHZrX3N1
NjBfc29tY19sY20uZHRzaSB8ICAyICstCiBhcmNoL2FybS9ib290L2R0cy9hdDkxLWtpemJveDIt
Y29tbW9uLmR0c2kgICAgfCAgNiArKy0tCiBhcmNoL2FybS9ib290L2R0cy9hdDkxLWtpemJveDNf
Y29tbW9uLmR0c2kgICAgfCAgOCArKy0tLQogYXJjaC9hcm0vYm9vdC9kdHMvYXQ5MS1raXpib3ht
aW5pLWNvbW1vbi5kdHNpIHwgIDYgKystLQogYXJjaC9hcm0vYm9vdC9kdHMvYXQ5MS1uYXR0aXMt
Mi1uYXR0ZS0yLmR0cyAgIHwgIDIgKy0KIGFyY2gvYXJtL2Jvb3QvZHRzL2F0OTEtc2FtYTVkNF9t
YTVkNGV2ay5kdHMgICB8ICAyICstCiBhcmNoL2FybS9ib290L2R0cy9hdDkxc2FtOW4xMmVrLmR0
cyAgICAgICAgICAgfCAgMiArLQogYXJjaC9hcm0vYm9vdC9kdHMvYXQ5MXNhbTl4NWRtLmR0c2kg
ICAgICAgICAgIHwgIDIgKy0KIC4uLi9ib290L2R0cy9iZXJsaW4yY2QtZ29vZ2xlLWNocm9tZWNh
c3QuZHRzICB8ICA0ICstLQogYXJjaC9hcm0vYm9vdC9kdHMvZGE4NTAtZXZtLmR0cyAgICAgICAg
ICAgICAgIHwgIDIgKy0KIGFyY2gvYXJtL2Jvb3QvZHRzL2RhODUwLWxlZ28tZXYzLmR0cyAgICAg
ICAgICB8ICA0ICstLQogYXJjaC9hcm0vYm9vdC9kdHMvZXh5bm9zNDQxMi1taWRhcy5kdHNpICAg
ICAgIHwgIDIgKy0KIGFyY2gvYXJtL2Jvb3QvZHRzL2V4eW5vczQ0MTItb2Ryb2lkdTMuZHRzICAg
ICB8ICAyICstCiBhcmNoL2FybS9ib290L2R0cy9leHlub3M1MjUwLXNub3ctY29tbW9uLmR0c2kg
fCAgMiArLQogYXJjaC9hcm0vYm9vdC9kdHMvZXh5bm9zNTQxMC1vZHJvaWR4dS5kdHMgICAgIHwg
IDIgKy0KIGFyY2gvYXJtL2Jvb3QvZHRzL2V4eW5vczU0MjAtcGVhY2gtcGl0LmR0cyAgICB8ICAy
ICstCiBhcmNoL2FybS9ib290L2R0cy9leHlub3M1NDIyLW9kcm9pZGhjMS5kdHMgICAgfCAgMiAr
LQogLi4uL2Jvb3QvZHRzL2V4eW5vczU0MjItb2Ryb2lkeHUzLWNvbW1vbi5kdHNpIHwgIDIgKy0K
IGFyY2gvYXJtL2Jvb3QvZHRzL2V4eW5vczU0MjItb2Ryb2lkeHU0LmR0cyAgICB8ICAyICstCiAu
Li4vYm9vdC9kdHMvZXh5bm9zNTR4eC1vZHJvaWR4dS1sZWRzLmR0c2kgICAgfCAgNCArLS0KIGFy
Y2gvYXJtL2Jvb3QvZHRzL2V4eW5vczU4MDAtcGVhY2gtcGkuZHRzICAgICB8ICAyICstCiBhcmNo
L2FybS9ib290L2R0cy9pbXg1My10eDUzLXgxM3guZHRzICAgICAgICAgfCAgNSArKy0tCiBhcmNo
L2FybS9ib290L2R0cy9pbXg2ZGwtdHg2ZGwtY29tdGZ0LmR0cyAgICAgfCAgMiArLQogYXJjaC9h
cm0vYm9vdC9kdHMvaW14NnEtZGlzcGxheTUuZHRzaSAgICAgICAgIHwgIDIgKy0KIGFyY2gvYXJt
L2Jvb3QvZHRzL2lteDZxLXR4NnEtMTAxMC1jb210ZnQuZHRzICB8ICAyICstCiBhcmNoL2FybS9i
b290L2R0cy9pbXg2cS10eDZxLTEwMjAtY29tdGZ0LmR0cyAgfCAgMiArLQogYXJjaC9hcm0vYm9v
dC9kdHMvaW14NnFkbC10eDYtbHZkcy5kdHNpICAgICAgIHwgIDQgKy0tCiBhcmNoL2FybS9ib290
L2R0cy9pbXg3LWNvbGlicmkuZHRzaSAgICAgICAgICAgfCAgNCArKy0KIGFyY2gvYXJtL2Jvb3Qv
ZHRzL2lteDdkLW5pdHJvZ2VuNy5kdHMgICAgICAgICB8ICAzICstCiBhcmNoL2FybS9ib290L2R0
cy9pbXg3ZC1waWNvLmR0c2kgICAgICAgICAgICAgfCAgMyArLQogYXJjaC9hcm0vYm9vdC9kdHMv
aW14N2Qtc2RiLmR0cyAgICAgICAgICAgICAgIHwgIDMgKy0KIGFyY2gvYXJtL2Jvb3QvZHRzL2lt
eDd1bHAtZXZrLmR0cyAgICAgICAgICAgICB8ICAzICstCiBhcmNoL2FybS9ib290L2R0cy9pd2cy
MGQtcTctY29tbW9uLmR0c2kgICAgICAgfCAgMiArLQogLi4uL2Jvb3QvZHRzL2xvZ2ljcGQtdG9y
cGVkby1iYXNlYm9hcmQuZHRzaSAgIHwgIDIgKy0KIGFyY2gvYXJtL2Jvb3QvZHRzL21lc29uOGIt
ZWMxMDAuZHRzICAgICAgICAgICB8ICA0ICstLQogYXJjaC9hcm0vYm9vdC9kdHMvbWVzb244Yi1t
eHEuZHRzICAgICAgICAgICAgIHwgIDQgKy0tCiBhcmNoL2FybS9ib290L2R0cy9tZXNvbjhiLW9k
cm9pZGMxLmR0cyAgICAgICAgfCAgNCArLS0KIC4uLi9ib290L2R0cy9tb3Rvcm9sYS1tYXBwaG9u
ZS1jb21tb24uZHRzaSAgICB8ICAzICstCiBhcmNoL2FybS9ib290L2R0cy9vbWFwMy1ndGEwNC5k
dHNpICAgICAgICAgICAgfCAgMiArLQogYXJjaC9hcm0vYm9vdC9kdHMvb21hcDMtbjkwMC5kdHMg
ICAgICAgICAgICAgIHwgIDIgKy0KIGFyY2gvYXJtL2Jvb3QvZHRzL3JrMzI4OC12ZXlyb24tZWRw
LmR0c2kgICAgICB8ICAyICstCiBhcmNoL2FybS9ib290L2R0cy9yazMyODgtdmV5cm9uLmR0c2kg
ICAgICAgICAgfCAgMiArLQogYXJjaC9hcm0vYm9vdC9kdHMvcnYxMTA4LWV2Yi5kdHMgICAgICAg
ICAgICAgIHwgIDIgKy0KIGFyY2gvYXJtL2Jvb3QvZHRzL3MzYzY0MTAtbWluaTY0MTAuZHRzICAg
ICAgICB8ICAyICstCiBhcmNoL2FybS9ib290L2R0cy9zNXB2MjEwLWFyaWVzLmR0c2kgICAgICAg
ICAgfCAgMiArLQogYXJjaC9hcm0vYm9vdC9kdHMvczVwdjIxMC1zbWRrdjIxMC5kdHMgICAgICAg
IHwgIDIgKy0KIGFyY2gvYXJtL2Jvb3QvZHRzL3N1bjVpLWdyOC1ldmIuZHRzICAgICAgICAgICB8
ICAyICstCiBhcmNoL2FybS9ib290L2R0cy92Zi1jb2xpYnJpLmR0c2kgICAgICAgICAgICAgfCAg
NCArKy0KIC4uLi9kdHMvYWxsd2lubmVyL3N1bjUwaS1hNjQtcGluZWJvb2suZHRzICAgICB8ICAy
ICstCiAuLi4vYm9vdC9kdHMvYWxsd2lubmVyL3N1bjUwaS1hNjQtdGVyZXMtaS5kdHMgfCAgMiAr
LQogLi4uL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tYXhnLXM0MDAuZHRzIHwgIDMgKy0K
IGFyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1heGcuZHRzaSAgICB8ICAxICsKIC4u
Li9ib290L2R0cy9hbWxvZ2ljL21lc29uLWcxMi1jb21tb24uZHRzaSAgICB8ICAxICsKIC4uLi9i
b290L2R0cy9hbWxvZ2ljL21lc29uLWcxMmEtc2VpNTEwLmR0cyAgICB8ICA1ICsrLS0KIC4uLi9i
b290L2R0cy9hbWxvZ2ljL21lc29uLWcxMmEtdTIwMC5kdHMgICAgICB8ICAyICstCiAuLi4vYm9v
dC9kdHMvYW1sb2dpYy9tZXNvbi1nMTJhLXg5Ni1tYXguZHRzICAgfCAgNSArKy0tCiAuLi4vZHRz
L2FtbG9naWMvbWVzb24tZzEyYi1raGFkYXMtdmltMy5kdHNpICAgfCAgNCArLS0KIC4uLi9ib290
L2R0cy9hbWxvZ2ljL21lc29uLWcxMmItb2Ryb2lkLW4yLmR0cyB8ICA0ICstLQogLi4uL2Jvb3Qv
ZHRzL2FtbG9naWMvbWVzb24tZzEyYi11Z29vcy1hbTYuZHRzIHwgIDcgKysrLS0KIC4uLi9ib290
L2R0cy9hbWxvZ2ljL21lc29uLWd4LXAyM3gtcTIweC5kdHNpICB8ICAzICstCiBhcmNoL2FybTY0
L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tZ3guZHRzaSAgICAgfCAgMSArCiAuLi4vYm9vdC9kdHMv
YW1sb2dpYy9tZXNvbi1neGJiLW5hbm9waS1rMi5kdHMgfCAgMyArLQogLi4uL2R0cy9hbWxvZ2lj
L21lc29uLWd4YmItbmV4Ym94LWE5NXguZHRzICAgIHwgIDMgKy0KIC4uLi9ib290L2R0cy9hbWxv
Z2ljL21lc29uLWd4YmItcDIweC5kdHNpICAgICB8ICAzICstCiAuLi4vYm9vdC9kdHMvYW1sb2dp
Yy9tZXNvbi1neGJiLXZlZ2Etczk1LmR0c2kgfCAgMyArLQogLi4uL2Jvb3QvZHRzL2FtbG9naWMv
bWVzb24tZ3hiYi13ZXRlay5kdHNpICAgIHwgIDMgKy0KIC4uLi9ib290L2R0cy9hbWxvZ2ljL21l
c29uLWd4bC1zODA1eC1wMjQxLmR0cyB8ICAzICstCiAuLi4vbWVzb24tZ3hsLXM5MDV4LWh3YWNv
bS1hbWF6ZXR2LmR0cyAgICAgICAgfCAgMyArLQogLi4uL2FtbG9naWMvbWVzb24tZ3hsLXM5MDV4
LWtoYWRhcy12aW0uZHRzICAgIHwgIDIgKy0KIC4uLi9hbWxvZ2ljL21lc29uLWd4bC1zOTA1eC1u
ZXhib3gtYTk1eC5kdHMgICB8ICAzICstCiAuLi4vZHRzL2FtbG9naWMvbWVzb24tZ3hsLXM5MDV4
LXAyMTIuZHRzaSAgICAgfCAgMyArLQogLi4uL2R0cy9hbWxvZ2ljL21lc29uLWd4bS1raGFkYXMt
dmltMi5kdHMgICAgIHwgIDUgKystLQogLi4uL2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tZ3htLXJi
b3gtcHJvLmR0cyAgIHwgIDMgKy0KIC4uLi9ib290L2R0cy9hbWxvZ2ljL21lc29uLWtoYWRhcy12
aW0zLmR0c2kgICB8ICA0ICsrLQogLi4uL2R0cy9hbWxvZ2ljL21lc29uLXNtMS1raGFkYXMtdmlt
M2wuZHRzICAgIHwgIDIgKy0KIC4uLi9ib290L2R0cy9hbWxvZ2ljL21lc29uLXNtMS1zZWk2MTAu
ZHRzICAgICB8ICA3ICsrKy0tCiAuLi4vZHRzL2V4eW5vcy9leHlub3M1NDMzLXRtMi1jb21tb24u
ZHRzaSAgICAgfCAgMyArLQogYXJjaC9hcm02NC9ib290L2R0cy9yb2NrY2hpcC9weDMwLWV2Yi5k
dHMgICAgIHwgIDIgKy0KIGFyY2gvYXJtNjQvYm9vdC9kdHMvcm9ja2NoaXAvcHgzMC5kdHNpICAg
ICAgICB8ICAxICsKIC4uLi9hcm02NC9ib290L2R0cy9yb2NrY2hpcC9yazMzMDgtcm9jLWNjLmR0
cyB8ICAyICstCiBhcmNoL2FybTY0L2Jvb3QvZHRzL3JvY2tjaGlwL3JrMzMwOC5kdHNpICAgICAg
fCAgMSArCiBhcmNoL2FybTY0L2Jvb3QvZHRzL3JvY2tjaGlwL3JrMzM5OS1ldmIuZHRzICAgfCAg
NCArLS0KIC4uLi9ib290L2R0cy9yb2NrY2hpcC9yazMzOTktZmlyZWZseS5kdHMgICAgICB8ICAy
ICstCiAuLi4vZHRzL3JvY2tjaGlwL3JrMzM5OS1ncnUtY2hyb21lYm9vay5kdHNpICAgfCAgMiAr
LQogLi4uL2Jvb3QvZHRzL3JvY2tjaGlwL3JrMzM5OS1ncnUtc2NhcmxldC5kdHNpIHwgIDQgKy0t
CiBhcmNoL2FybTY0L2Jvb3QvZHRzL3JvY2tjaGlwL3JrMzM5OS1ncnUuZHRzaSAgfCAgNiArKy0t
CiAuLi4vYm9vdC9kdHMvcm9ja2NoaXAvcmszMzk5LWtoYWRhcy1lZGdlLmR0c2kgfCAgMiArLQog
Li4uL2Jvb3QvZHRzL3JvY2tjaGlwL3JrMzM5OS1uYW5vcGMtdDQuZHRzICAgIHwgIDIgKy0KIC4u
Li9ib290L2R0cy9yb2NrY2hpcC9yazMzOTktcm9jLXBjLmR0c2kgICAgICB8ICAyICstCiAuLi4v
Ym9vdC9kdHMvcm9ja2NoaXAvcmszMzk5LXJvY2twcm82NC5kdHNpICAgfCAgMiArLQogLi4uL3Jv
Y2tjaGlwL3JrMzM5OS1zYXBwaGlyZS1leGNhdmF0b3IuZHRzICAgIHwgIDIgKy0KIGFyY2gvYXJt
NjQvYm9vdC9kdHMvcm9ja2NoaXAvcmszMzk5LmR0c2kgICAgICB8ICAxICsKIGRyaXZlcnMvcHdt
L2NvcmUuYyAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICA2ICsrLS0KIGRyaXZlcnMvcHdt
L3B3bS1hdG1lbC1obGNkYy5jICAgICAgICAgICAgICAgICB8ICAyICstCiBkcml2ZXJzL3B3bS9w
d20tYXRtZWwtdGNiLmMgICAgICAgICAgICAgICAgICAgfCAyNCArKysrKysrLS0tLS0tLS0KIGRy
aXZlcnMvcHdtL3B3bS1hdG1lbC5jICAgICAgICAgICAgICAgICAgICAgICB8ICAyICstCiBkcml2
ZXJzL3B3bS9wd20tYmNtLWlwcm9jLmMgICAgICAgICAgICAgICAgICAgfCAgMiArLQogZHJpdmVy
cy9wd20vcHdtLWJjbS1rb25hLmMgICAgICAgICAgICAgICAgICAgIHwgIDQgKy0tCiBkcml2ZXJz
L3B3bS9wd20tYmNtMjgzNS5jICAgICAgICAgICAgICAgICAgICAgfCAgMiArLQogZHJpdmVycy9w
d20vcHdtLWJlcmxpbi5jICAgICAgICAgICAgICAgICAgICAgIHwgIDIgKy0KIGRyaXZlcnMvcHdt
L3B3bS1lcDkzeHguYyAgICAgICAgICAgICAgICAgICAgICB8ICA0ICstLQogZHJpdmVycy9wd20v
cHdtLWZzbC1mdG0uYyAgICAgICAgICAgICAgICAgICAgIHwgIDIgKy0KIGRyaXZlcnMvcHdtL3B3
bS1oaWJ2dC5jICAgICAgICAgICAgICAgICAgICAgICB8ICA0ICstLQogZHJpdmVycy9wd20vcHdt
LWlteC10cG0uYyAgICAgICAgICAgICAgICAgICAgIHwgIDIgKy0KIGRyaXZlcnMvcHdtL3B3bS1p
bXgyNy5jICAgICAgICAgICAgICAgICAgICAgICB8ICA0ICstLQogZHJpdmVycy9wd20vcHdtLWp6
NDc0MC5jICAgICAgICAgICAgICAgICAgICAgIHwgIDIgKy0KIGRyaXZlcnMvcHdtL3B3bS1scGMx
OHh4LXNjdC5jICAgICAgICAgICAgICAgICB8ICAyICstCiBkcml2ZXJzL3B3bS9wd20tbWVzb24u
YyAgICAgICAgICAgICAgICAgICAgICAgfCAgNiArKy0tCiBkcml2ZXJzL3B3bS9wd20tb21hcC1k
bXRpbWVyLmMgICAgICAgICAgICAgICAgfCAgNiArKy0tCiBkcml2ZXJzL3B3bS9wd20tcmVuZXNh
cy10cHUuYyAgICAgICAgICAgICAgICAgfCAxMCArKystLS0tCiBkcml2ZXJzL3B3bS9wd20tcm9j
a2NoaXAuYyAgICAgICAgICAgICAgICAgICAgfCAgNCArLS0KIGRyaXZlcnMvcHdtL3B3bS1zYW1z
dW5nLmMgICAgICAgICAgICAgICAgICAgICB8ICAyICstCiBkcml2ZXJzL3B3bS9wd20tc2lmaXZl
LmMgICAgICAgICAgICAgICAgICAgICAgfCAgNCArLS0KIGRyaXZlcnMvcHdtL3B3bS1zdG0zMi5j
ICAgICAgICAgICAgICAgICAgICAgICB8ICAyICstCiBkcml2ZXJzL3B3bS9wd20tc3VuNGkuYyAg
ICAgICAgICAgICAgICAgICAgICAgfCAgMiArLQogZHJpdmVycy9wd20vcHdtLXRpZWNhcC5jICAg
ICAgICAgICAgICAgICAgICAgIHwgIDQgKy0tCiBkcml2ZXJzL3B3bS9wd20tdGllaHJwd20uYyAg
ICAgICAgICAgICAgICAgICAgfCAgOCArKy0tLQogZHJpdmVycy9wd20vcHdtLXZ0ODUwMC5jICAg
ICAgICAgICAgICAgICAgICAgIHwgIDQgKy0tCiBkcml2ZXJzL3B3bS9wd20tenguYyAgICAgICAg
ICAgICAgICAgICAgICAgICAgfCAgNCArLS0KIGRyaXZlcnMvcHdtL3N5c2ZzLmMgICAgICAgICAg
ICAgICAgICAgICAgICAgICB8ICA2ICsrLS0KIGRyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL3B3bS5j
ICAgICAgICAgICAgICAgICB8ICAyICstCiBkcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9scDg3ODhf
YmwuYyAgICAgICAgICAgfCAgMiArLQogaW5jbHVkZS9kdC1iaW5kaW5ncy9wd20vcHdtLmggICAg
ICAgICAgICAgICAgIHwgMTAgKysrKysrKwogaW5jbHVkZS9saW51eC9tZmQvbHA4Nzg4LmggICAg
ICAgICAgICAgICAgICAgIHwgIDIgKy0KIGluY2x1ZGUvbGludXgvcHdtLmggICAgICAgICAgICAg
ICAgICAgICAgICAgICB8IDI5ICsrKysrLS0tLS0tLS0tLS0tLS0KIGluY2x1ZGUvdHJhY2UvZXZl
bnRzL3B3bS5oICAgICAgICAgICAgICAgICAgICB8ICAyICstCiAxMzAgZmlsZXMgY2hhbmdlZCwg
MjM5IGluc2VydGlvbnMoKyksIDIwNSBkZWxldGlvbnMoLSkKCi0tIAoyLjI0LjEKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmdyZXlidXMtZGV2IG1haWxp
bmcgbGlzdApncmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3JnCmh0dHBzOi8vbGlzdHMubGluYXJv
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2dyZXlidXMtZGV2Cg==
