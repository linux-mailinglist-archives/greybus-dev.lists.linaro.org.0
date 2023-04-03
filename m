Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id A50116D5190
	for <lists+greybus-dev@lfdr.de>; Mon,  3 Apr 2023 21:50:51 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 833383EC33
	for <lists+greybus-dev@lfdr.de>; Mon,  3 Apr 2023 19:50:50 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	by lists.linaro.org (Postfix) with ESMTPS id A24BE3EC33
	for <greybus-dev@lists.linaro.org>; Mon,  3 Apr 2023 19:50:46 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=nEBMvaSD;
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 139.178.84.217 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org;
	dmarc=pass (policy=none) header.from=linuxfoundation.org
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3E30762944;
	Mon,  3 Apr 2023 19:50:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B83EEC4339B;
	Mon,  3 Apr 2023 19:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1680551445;
	bh=lOZoZur0dlMwg23s/E6ookGvEsUZzxEjsaf7n78uxD0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nEBMvaSDo6Kx3uTTuk0gcIjpmL+QxmtvplsE3iV+Yad8oVUuYckRsG32R0nXIl7RF
	 df7SulQgWa+RfGcINl7HL+vcKeBJS6LuhRgnjoJDfbS2hMh3ZIjZ5Daw8Yc0FSZbkY
	 koEdBw32GguOTg412wDd6ymUfsqZp5iBNOEaSJDk=
Date: Mon, 3 Apr 2023 21:50:42 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Message-ID: <2023040305-drudge-scorer-b59c@gregkh>
References: <20230403154014.2564054-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230403154014.2564054-1-u.kleine-koenig@pengutronix.de>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: A24BE3EC33
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.00 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip4:139.178.84.217];
	MIME_GOOD(-0.10)[text/plain];
	NEURAL_HAM(-0.00)[-1.000];
	FREEMAIL_CC(0.00)[mailo.com,huawei.com,verge.net.au,gmail.com,kernel.org,collabora.com,microchip.com,bootlin.com,pengutronix.de,linaro.org,baylibre.com,ideasonboard.com,vanguardiasur.com.ar,csie.org,sholland.org,stgolabs.net,gmx.de,broadcom.com,linux.intel.com,redhat.com,i2se.com,raspberrypi.com,lists.linux.dev,lists.linaro.org,vger.kernel.org,lists.infradead.org,nxp.com,googlemail.com,lists.launchpad.net];
	FROM_EQ_ENVFROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_GT_50(0.00)[56];
	ASN(0.00)[asn:54825, ipnet:139.178.80.0/21, country:US];
	RCVD_TLS_ALL(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2]
Message-ID-Hash: J74E774IYJPSXRDQGNFSPQFWBJ43ISTQ
X-Message-ID-Hash: J74E774IYJPSXRDQGNFSPQFWBJ43ISTQ
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Deepak R Varma <drv@mailo.com>, Yuan Can <yuancan@huawei.com>, Simon Horman <horms@verge.net.au>, Sven Van Asbroeck <TheSven73@gmail.com>, Vaibhav Hiremath <hvaibhav.linux@gmail.com>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, Eugen Hristev <eugen.hristev@collabora.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@microchip.com>, Steve Longerbeam <slongerbeam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Maxime Ripard <mripard@kernel.org>, Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <
 samuel@sholland.org>, Parthiban Veerasooran <parthiban.veerasooran@microchip.com>, Christian Gromm <christian.gromm@microchip.com>, Davidlohr Bueso <dave@stgolabs.net>, Marc Dietrich <marvin24@gmx.de>, Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Umang Jain <umang.jain@ideasonboard.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Adrien Thierry <athierry@redhat.com>, Stefan Wahren <stefan.wahren@i2se.com>, "Fabio M. De Francesco" <fmdefrancesco@gmail.com>, Phil Elwell <phil@raspberrypi.com>, Jakob Koschel <jakobkoschel@gmail.com>, linux-staging@lists.linux.dev, kernel@pengutronix.de, greybus-dev@lists.linaro.org, linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-amlogic@lists.infradead.org, linux-rockchip@lists.infradead.o
 rg, linux-sunxi@lists.linux.dev, ac100@lists.launchpad.net, linux-tegra@vger.kernel.org, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, linux-rpi-kernel@lists.infradead.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 00/24] staging: Convert to platform remove callback returning void
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/J74E774IYJPSXRDQGNFSPQFWBJ43ISTQ/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 03, 2023 at 05:39:50PM +0200, Uwe Kleine-K=F6nig wrote:
> Hello,
>=20
> this series adapts the platform drivers below drivers/staging to use the
> .remove_new() callback. Compared to the traditional .remove() callback
> .remove_new() returns no value. This is a good thing because the driver
> core doesn't (and cannot) cope for errors during remove. The only effect
> of a non-zero return value in .remove() is that the driver core emits a
> warning. The device is removed anyhow and an early return from .remove()
> usually yields a resource leak.
>=20
> By changing the remove callback to return void driver authors cannot
> reasonably assume any more that there is some kind of cleanup later.
>=20
> All drivers in staging already return zero in their remove callback, so
> they can be trivially converted.
>=20
> The changes to the individual drivers are all orthogonal. If I need to
> resend some patches because of some review feedback, I'd like to only
> send the patches that actually needed changes, so please pick up the
> remaining patches that don't need changing to reduce the amount of mail.

Note, I can't take drivers/staging/media/ patches, those go through the
v4l maintainer's tree.  So I've taken the non-media patches from this
series now.

thanks,

greg k-h
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
