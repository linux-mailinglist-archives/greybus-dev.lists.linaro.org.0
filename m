Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id B84E4756572
	for <lists+greybus-dev@lfdr.de>; Mon, 17 Jul 2023 15:49:22 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 4551C43EA8
	for <lists+greybus-dev@lfdr.de>; Mon, 17 Jul 2023 13:49:21 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	by lists.linaro.org (Postfix) with ESMTPS id B32063EBCF
	for <greybus-dev@lists.linaro.org>; Mon, 17 Jul 2023 12:38:10 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=bootlin.com header.s=gm1 header.b=CJSdJUIa;
	spf=pass (lists.linaro.org: domain of luca.ceresoli@bootlin.com designates 217.70.183.198 as permitted sender) smtp.mailfrom=luca.ceresoli@bootlin.com;
	dmarc=pass (policy=reject) header.from=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 63003C0003;
	Mon, 17 Jul 2023 12:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1689597489;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MM/PEyd181tJuLy8r7nqOJOdJv9WHZixT7LUP2KhY9Q=;
	b=CJSdJUIaJOmzbN/Tj4KhsGBnpIzKmLKXw5kMnjexwbj9y7Ge/VVgXKfpiv6eq5W9wcF9dp
	sd/2U7mXflRPXLpVjusstuLTPt8N2SZlDeNsujy0iHcJE4iLv5gRuMhTwZ4mMmBMGjAF64
	qwHz/AKECHcd0xWxb2+V+Up/oxY2hWG0KeU8blU452HvKU9iMKB3HedvxklLcwyMVE+Zy+
	50B1rWMTI8ltBn0//4FfpRbnkzFIA2rEYf3Gj3lDjF+D+cJiPdTwvuCcfsiimP3e+v2LdY
	EDKN/bYZ9JBD3oCSej3UhQM4VknrSyUzHk4r49YevmLr/q96PziK3BkSVQTHhA==
Date: Mon, 17 Jul 2023 14:38:04 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Rob Herring <robh@kernel.org>
Message-ID: <20230717143804.4e82bcc1@booty>
In-Reply-To: <20230714175002.4064428-1-robh@kernel.org>
References: <20230714175002.4064428-1-robh@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: luca.ceresoli@bootlin.com
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: B32063EBCF
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.50 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[217.70.183.198:from];
	R_SPF_ALLOW(-0.20)[+ip4:217.70.183.192/28];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=gm1];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_IN_DNSWL_LOW(-0.10)[217.70.183.198:from];
	MIME_TRACE(0.00)[0:+];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,gmail.com,kernel.org,pengutronix.de,nxp.com,linaro.org,baylibre.com,googlemail.com,bootlin.com,csie.org,sholland.org,nvidia.com,microchip.com,vger.kernel.org,lists.linux.dev,lists.linaro.org,lists.infradead.org];
	RCVD_COUNT_ONE(0.00)[1];
	ASN(0.00)[asn:29169, ipnet:217.70.176.0/20, country:FR];
	RCPT_COUNT_TWELVE(0.00)[36];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[bootlin.com:+];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-MailFrom: luca.ceresoli@bootlin.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: WXC54FRILJHLFDONKFV6B67BJHHI422T
X-Message-ID-Hash: WXC54FRILJHLFDONKFV6B67BJHHI422T
X-Mailman-Approved-At: Mon, 17 Jul 2023 13:49:16 +0000
CC: Vaibhav Hiremath <hvaibhav.linux@gmail.com>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, Steve Longerbeam <slongerbeam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Maxime Ripard <mripard@kernel.org>, Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Sowjanya Komatineni <skomatineni@nvidia.com>, Parthiban Veerasooran <parthiban.veerasooran@microchip.com>, C
 hristian Gromm <christian.gromm@microchip.com>, devicetree@vger.kernel.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, greybus-dev@lists.linaro.org, linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: Explicitly include correct DT includes
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/WXC54FRILJHLFDONKFV6B67BJHHI422T/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, 14 Jul 2023 11:50:01 -0600
Rob Herring <robh@kernel.org> wrote:

>  drivers/staging/media/tegra-video/csi.c           | 1 -
>  drivers/staging/media/tegra-video/vi.c            | 2 +-
>  drivers/staging/media/tegra-video/vip.c           | 1 -

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com> # tegra-video

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
