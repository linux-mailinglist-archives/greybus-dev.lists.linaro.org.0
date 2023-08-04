Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C540771D7A
	for <lists+greybus-dev@lfdr.de>; Mon,  7 Aug 2023 11:50:37 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 7FCAC43D20
	for <lists+greybus-dev@lfdr.de>; Mon,  7 Aug 2023 09:50:36 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	by lists.linaro.org (Postfix) with ESMTPS id 4302C3ED86
	for <greybus-dev@lists.linaro.org>; Fri,  4 Aug 2023 19:06:53 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20221208 header.b=pJXcyaij;
	spf=pass (lists.linaro.org: domain of jernej.skrabec@gmail.com designates 209.85.221.49 as permitted sender) smtp.mailfrom=jernej.skrabec@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3178dd771ceso2140538f8f.2
        for <greybus-dev@lists.linaro.org>; Fri, 04 Aug 2023 12:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691176012; x=1691780812;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c+mKs9GVqXrgLKiydu37dkxuWRwX9m6vUvXBGA4iGEQ=;
        b=pJXcyaij59wykiKOA9tCEB8S4gg3Z1GHrOT8L9w9quvTeK3CJwd93TcMmgeH9qsTmX
         jA5YMPXtem49OKIeZuBW/B7z7dS8WFJdH65DKww5XyYHLXhgTnbsAwscbEHTb6mbtrZZ
         BZa8BIBGOH4Q+SkpavEdH0otXnzRijACuCopeESvO+XHcmL3ZXNW9EGslJl77px9Boeb
         GqQnVqw0k6HMm2l7+XHIGKAPYRVqgCsnRSsJE1fnLs2Nj797U07C0NurMSGCn8/yNgCc
         lDyCVZnGxxnzNo6RW2GsgNpucmHIvVKiEjxprA51NTiam2O4cd25vg7MKR2tt8ini3Xu
         IdIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691176012; x=1691780812;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c+mKs9GVqXrgLKiydu37dkxuWRwX9m6vUvXBGA4iGEQ=;
        b=TH6kVSWPfOmMsQtbtlKxNUPWHHl5EDdvLsGIpoovPDHM1W1vj4kjKbYs3F+/JuyvTB
         lqndX09JCmuCJOOPrV7nU0EjlCgER5/zdq+G7AUi5NuDJMDTgDcECiDu9ZtElsVrfbjC
         gtIIG73AImohuazD1sL6AhAHNCuTzjwL4jIH246HPQcXCRXYgt7+N2IWprh2IRreGuIp
         iAIbAROjsj5EKi2uHyqksZvzfXYwRWeluqlvrp9IcgSZBPRkd8Rcx994hToP8GZtFVdV
         ziO+v/L6xQDQ6ZDLd+bIqJhSPsXlXA1W2JuMQWPslm2ThjjcwK+fqxZBaYHf1OGozF0G
         nekg==
X-Gm-Message-State: AOJu0YwvUnVs8e/LTCPiRAvRVDesc/x1qxZ0oxRtaLi7AXLM1XUT4NzL
	23QC7PDTAcExI5CAauOfrNU=
X-Google-Smtp-Source: AGHT+IHpybGIS5pubkiM9vt8iNkqlu2gS6LosaHfJR1MT91WNa9XG7Bef9hWZF/8p1yMJF9KzrDRaA==
X-Received: by 2002:a5d:4a4a:0:b0:317:6175:95fd with SMTP id v10-20020a5d4a4a000000b00317617595fdmr1855584wrs.43.1691176011920;
        Fri, 04 Aug 2023 12:06:51 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id x12-20020adfec0c000000b0031274a184d5sm3143402wrn.109.2023.08.04.12.06.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Aug 2023 12:06:51 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Uwe =?ISO-8859-1?Q?Kleine=2DK=F6nig?= <u.kleine-koenig@pengutronix.de>
Date: Fri, 04 Aug 2023 21:06:45 +0200
Message-ID: <4820522.GXAFRqVoOG@jernej-laptop>
In-Reply-To: <20230804142707.412137-2-u.kleine-koenig@pengutronix.de>
References: 
 <20230804142707.412137-1-u.kleine-koenig@pengutronix.de>
 <20230804142707.412137-2-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 4302C3ED86
X-Spamd-Bar: -------
X-Spamd-Result: default: False [-7.50 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	RCVD_DKIM_ARC_DNSWL_HI(-1.00)[];
	RCVD_IN_DNSWL_HI(-0.50)[209.85.221.49:from];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20221208];
	MIME_GOOD(-0.10)[text/plain];
	TAGGED_RCPT(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	NEURAL_HAM(-0.00)[-1.000];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.221.49:from];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FREEMAIL_CC(0.00)[linaro.org,bgdev.pl,kernel.org,chromium.org,intel.com,kwiboo.se,gmail.com,ffwll.ch,ucw.cz,marcan.st,svenpeter.dev,rosenzweig.io,microchip.com,bootlin.com,broadcom.com,mail.ru,pengutronix.de,nxp.com,crapouillou.net,mleia.com,baylibre.com,googlemail.com,collabora.com,gmx.net,sntech.de,samsung.com,dabbelt.com,sifive.com,walle.cc,linux.alibaba.com,foss.st.com,csie.org,sholland.org,nvidia.com,toshiba.co.jp,seco.com,amd.com,linuxfoundation.org,quicinc.com,z3ntu.xyz,vger.kernel.org,lists.freedesktop.org,lists.linux.dev,lists.infradead.org,st-md-mailman.stormreply.com,lists.linaro.org];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	TAGGED_FROM(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_GT_50(0.00)[88];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	URIBL_BLOCKED(0.00)[pengutronix.de:email,mail-wr1-f49.google.com:helo,mail-wr1-f49.google.com:rdns];
	FREEMAIL_TO(0.00)[gmail.com,ideasonboard.com,pengutronix.de];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[]
X-MailFrom: jernej.skrabec@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: 7QP3OHN54SU2BQ64MABG4ADDCOLYOQZG
X-Message-ID-Hash: 7QP3OHN54SU2BQ64MABG4ADDCOLYOQZG
X-Mailman-Approved-At: Mon, 07 Aug 2023 09:50:19 +0000
CC: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>, Douglas Anderson <dianders@chromium.org>, Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@microchip.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Florian Fainelli <florian.fainelli@broadcom.com>, Alexander Shiyan <shc_work@mail.ru>, Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, Shawn 
 Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Paul Cercueil <paul@crapouillou.net>, Vladimir Zapolskiy <vz@mleia.com>, Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Conor Dooley <conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Jonathan =?ISO-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>, Heiko Stuebner <heiko@sntech.de>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Michael Walle <michael@walle.cc>, Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zha
 ng.lyra@gmail.com>, Fabrice Gasnier <fabrice.gasnier@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>, Hammer Hsieh <hammerh0314@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>, Sean Anderson <sean.anderson@seco.com>, Michal Simek <michal.simek@amd.com>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, Anjelique Melendez <quic_amelende@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Luca Weiss <luca@z3ntu.xyz>, Bjorn Andersson <quic_bjorande@quicinc.com>, linux-pwm@vger.kernel.org, linux-gpio@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, chrome-platform@lists.linux.dev, linux-mips@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-riscv@li
 sts.infradead.org, linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v2 1/2] pwm: Manage owner assignment implicitly for drivers
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/7QP3OHN54SU2BQ64MABG4ADDCOLYOQZG/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Transfer-Encoding: quoted-printable

Dne petek, 04. avgust 2023 ob 16:27:06 CEST je Uwe Kleine-K=F6nig napisal(a=
):
> Instead of requiring each driver to care for assigning the owner member
> of struct pwm_ops, handle that implicitly using a macro. Note that the
> owner member has to be moved to struct pwm_chip, as the ops structure
> usually lives in read-only memory and so cannot be modified.
>=20
> The upside is that new lowlevel drivers cannot forget the assignment and
> save one line each. The pwm-crc driver didn't assign .owner, that's not
> a problem in practise though as the driver cannot be compiled as a
> module.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/gpio/gpio-mvebu.c             |  1 -
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c |  1 -
>  drivers/leds/rgb/leds-qcom-lpg.c      |  1 -
>  drivers/pwm/core.c                    | 24 ++++++++++++++----------
>  drivers/pwm/pwm-ab8500.c              |  1 -
>  drivers/pwm/pwm-apple.c               |  1 -
>  drivers/pwm/pwm-atmel-hlcdc.c         |  1 -
>  drivers/pwm/pwm-atmel-tcb.c           |  1 -
>  drivers/pwm/pwm-atmel.c               |  1 -
>  drivers/pwm/pwm-bcm-iproc.c           |  1 -
>  drivers/pwm/pwm-bcm-kona.c            |  1 -
>  drivers/pwm/pwm-bcm2835.c             |  1 -
>  drivers/pwm/pwm-berlin.c              |  1 -
>  drivers/pwm/pwm-brcmstb.c             |  1 -
>  drivers/pwm/pwm-clk.c                 |  1 -
>  drivers/pwm/pwm-clps711x.c            |  1 -
>  drivers/pwm/pwm-cros-ec.c             |  1 -
>  drivers/pwm/pwm-dwc.c                 |  1 -
>  drivers/pwm/pwm-ep93xx.c              |  1 -
>  drivers/pwm/pwm-fsl-ftm.c             |  1 -
>  drivers/pwm/pwm-hibvt.c               |  1 -
>  drivers/pwm/pwm-img.c                 |  1 -
>  drivers/pwm/pwm-imx-tpm.c             |  1 -
>  drivers/pwm/pwm-imx1.c                |  1 -
>  drivers/pwm/pwm-imx27.c               |  1 -
>  drivers/pwm/pwm-intel-lgm.c           |  1 -
>  drivers/pwm/pwm-iqs620a.c             |  1 -
>  drivers/pwm/pwm-jz4740.c              |  1 -
>  drivers/pwm/pwm-keembay.c             |  1 -
>  drivers/pwm/pwm-lp3943.c              |  1 -
>  drivers/pwm/pwm-lpc18xx-sct.c         |  1 -
>  drivers/pwm/pwm-lpc32xx.c             |  1 -
>  drivers/pwm/pwm-lpss.c                |  1 -
>  drivers/pwm/pwm-mediatek.c            |  1 -
>  drivers/pwm/pwm-meson.c               |  1 -
>  drivers/pwm/pwm-microchip-core.c      |  1 -
>  drivers/pwm/pwm-mtk-disp.c            |  1 -
>  drivers/pwm/pwm-mxs.c                 |  1 -
>  drivers/pwm/pwm-ntxec.c               |  1 -
>  drivers/pwm/pwm-omap-dmtimer.c        |  1 -
>  drivers/pwm/pwm-pca9685.c             |  1 -
>  drivers/pwm/pwm-pxa.c                 |  1 -
>  drivers/pwm/pwm-raspberrypi-poe.c     |  1 -
>  drivers/pwm/pwm-rcar.c                |  1 -
>  drivers/pwm/pwm-renesas-tpu.c         |  1 -
>  drivers/pwm/pwm-rockchip.c            |  1 -
>  drivers/pwm/pwm-rz-mtu3.c             |  1 -
>  drivers/pwm/pwm-samsung.c             |  1 -
>  drivers/pwm/pwm-sifive.c              |  1 -
>  drivers/pwm/pwm-sl28cpld.c            |  1 -
>  drivers/pwm/pwm-spear.c               |  1 -
>  drivers/pwm/pwm-sprd.c                |  1 -
>  drivers/pwm/pwm-sti.c                 |  1 -
>  drivers/pwm/pwm-stm32-lp.c            |  1 -
>  drivers/pwm/pwm-stm32.c               |  1 -
>  drivers/pwm/pwm-stmpe.c               |  1 -
>  drivers/pwm/pwm-sun4i.c               |  1 -

For sun4i:
Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

>  drivers/pwm/pwm-sunplus.c             |  1 -
>  drivers/pwm/pwm-tegra.c               |  1 -
>  drivers/pwm/pwm-tiecap.c              |  1 -
>  drivers/pwm/pwm-tiehrpwm.c            |  1 -
>  drivers/pwm/pwm-twl-led.c             |  2 --
>  drivers/pwm/pwm-twl.c                 |  2 --
>  drivers/pwm/pwm-visconti.c            |  1 -
>  drivers/pwm/pwm-vt8500.c              |  1 -
>  drivers/pwm/pwm-xilinx.c              |  1 -
>  drivers/staging/greybus/pwm.c         |  1 -
>  include/linux/pwm.h                   | 10 ++++++----



_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
