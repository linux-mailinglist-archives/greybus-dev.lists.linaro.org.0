Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 544E285474E
	for <lists+greybus-dev@lfdr.de>; Wed, 14 Feb 2024 11:39:38 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 459EC442FC
	for <lists+greybus-dev@lfdr.de>; Wed, 14 Feb 2024 10:39:37 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	by lists.linaro.org (Postfix) with ESMTPS id EEE983F363
	for <greybus-dev@lists.linaro.org>; Wed, 14 Feb 2024 10:39:31 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=mMG2JxTY;
	dmarc=pass (policy=none) header.from=linuxfoundation.org;
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 139.178.84.217 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6E2BF618CD;
	Wed, 14 Feb 2024 10:39:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD63EC433C7;
	Wed, 14 Feb 2024 10:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1707907171;
	bh=ve+usHpPiLeGFo9qGaUdJEB8rWWmsI433I+8nLrtPWA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mMG2JxTY5r0JtemuhnLGxIkBv2vs9oCD8JbPETLCQD3yg2qQ4VKFDBUVSU7yIge4J
	 4MrcD29ANaG2BIMVo3oS8op8fUmcTulSdxbxdcVYhZbgkqyOak9zrqsfNKhV+krgza
	 xLBeJ68UbUTpFQO+ditMDCSTVbcpZujlhg7+2k6g=
Date: Wed, 14 Feb 2024 11:39:25 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Message-ID: <2024021414-sedan-banking-f6b5@gregkh>
References: <cover.1707900770.git.u.kleine-koenig@pengutronix.de>
 <cc30090d2f9762bed9854a55612144bccc910781.1707900770.git.u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cc30090d2f9762bed9854a55612144bccc910781.1707900770.git.u.kleine-koenig@pengutronix.de>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: EEE983F363
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.00 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:139.178.84.217];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MIME_GOOD(-0.10)[text/plain];
	ASN(0.00)[asn:54825, ipnet:139.178.80.0/21, country:US];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[48];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	FREEMAIL_CC(0.00)[vger.kernel.org,tuxon.dev,microchip.com,bootlin.com,broadcom.com,chromium.org,kernel.org,pengutronix.de,crapouillou.net,mleia.com,gmail.com,collabora.com,linaro.org,baylibre.com,dabbelt.com,sifive.com,foss.st.com,csie.org,sholland.org,lists.infradead.org,lists.linux.dev,nxp.com,googlemail.com,samsung.com,st-md-mailman.stormreply.com,lists.linaro.org];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	TAGGED_RCPT(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+]
Message-ID-Hash: EOWYADK7HPPB5RWGFFUZFWCPF6QGCVBA
X-Message-ID-Hash: EOWYADK7HPPB5RWGFFUZFWCPF6QGCVBA
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: linux-pwm@vger.kernel.org, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Benson Leung <bleung@chromium.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Paul Cercueil <paul@crapouillou.net>, Vladimir Zapolskiy <vz@mleia.com>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Fabrice Gasnier <fabrice.gasnier@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@
 gmail.com>, Samuel Holland <samuel@sholland.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Guenter Roeck <groeck@chromium.org>, chrome-platform@lists.linux.dev, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, linux-mips@vger.kernel.org, linux-mediatek@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-amlogic@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, Alim Akhtar <alim.akhtar@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v6 001/164] pwm: Provide an inline function to get the parent device of a given chip
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/EOWYADK7HPPB5RWGFFUZFWCPF6QGCVBA/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 14, 2024 at 10:30:48AM +0100, Uwe Kleine-K=F6nig wrote:
> Currently a pwm_chip stores in its struct device *dev member a pointer
> to the parent device. Preparing a change that embeds a full struct
> device in struct pwm_chip, this accessor function should be used in all
> drivers directly accessing chip->dev now. This way struct pwm_chip and
> this new function can be changed without having to touch all drivers in
> the same change set.
>=20
> Make use of this function in the framework's core sources.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
