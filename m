Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 3498F68F8B3
	for <lists+greybus-dev@lfdr.de>; Wed,  8 Feb 2023 21:17:51 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id C816541427
	for <lists+greybus-dev@lfdr.de>; Wed,  8 Feb 2023 20:17:49 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	by lists.linaro.org (Postfix) with ESMTPS id BA2F13ED39
	for <greybus-dev@lists.linaro.org>; Wed,  1 Feb 2023 15:16:00 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=KU4ZzAZC;
	spf=pass (lists.linaro.org: domain of broonie@kernel.org designates 139.178.84.217 as permitted sender) smtp.mailfrom=broonie@kernel.org;
	dmarc=pass (policy=none) header.from=kernel.org
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 58CC5617E3;
	Wed,  1 Feb 2023 15:16:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52DF4C433D2;
	Wed,  1 Feb 2023 15:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675264559;
	bh=LRcOg2q+eDGVIXXY2nwx4erwH77a/aRq28NUs5IDyCc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KU4ZzAZCfEIFr0jm610wDLcfNDu1BT7alWBq4lCdAi8jxLcmCiG+N3M8pD98e92bq
	 jEveutD/LRtarHkLSi1VT+wkWbr0FiUwuP11kxiQ/FQ/0dLJS9f7wk4WIsY81RNwsT
	 zE2rXqGv+swsJ+x2navfQqq5XD8GmEgv0vJSNVcB+mloglAaqXwO0rFQl2XUbT1nWE
	 N9OHyols6boAqmJ12PCA7BF6t1yvrYW7Nw9tEb0eKdvPWGnJ5Rqf1wv3Ng4NK3ygNW
	 owxjCxS1tCFcCwRtOSIJKriVsuXGINVmjP3mb2jgXizk7d2Q0jSrHyCO8vF9Om7Gjt
	 MSXjxi7+9AcEg==
Date: Wed, 1 Feb 2023 15:15:35 +0000
From: Mark Brown <broonie@kernel.org>
To: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
Message-ID: <Y9qCF7DS+FQo1RYp@sirena.org.uk>
References: <20230119185342.2093323-1-amit.kumar-mahapatra@amd.com>
 <20230119185342.2093323-3-amit.kumar-mahapatra@amd.com>
MIME-Version: 1.0
In-Reply-To: <20230119185342.2093323-3-amit.kumar-mahapatra@amd.com>
X-Cookie: Oh no, not again.
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: BA2F13ED39
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.60 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
	SIGNED_PGP(-2.00)[];
	FORGED_RECIPIENTS(2.00)[m:amit.kumar-mahapatra@amd.com,m:miquel.raynal@bootlin.com,m:richard@nod.at,m:vigneshr@ti.com,m:jic23@kernel.org,m:tudor.ambarus@microchip.com,m:pratyush@kernel.org,m:sanju.mehta@amd.com,m:chin-ting_kuo@aspeedtech.com,m:clg@kaod.org,m:kdasu.kdev@gmail.com,m:f.fainelli@gmail.com,m:rjui@broadcom.com,m:sbranden@broadcom.com,m:eajames@linux.ibm.com,m:olteanv@gmail.com,m:han.xu@nxp.com,m:john.garry@huawei.com,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:narmstrong@baylibre.com,m:khilman@baylibre.com,m:matthias.bgg@gmail.com,m:haibo.chen@nxp.com,m:linus.walleij@linaro.org,m:daniel@zonque.org,m:haojian.zhuang@gmail.com,m:robert.jarzmik@free.fr,m:agross@kernel.org,m:bjorn.andersson@linaro.org,m:heiko@sntech.de,m:krzysztof.kozlowski@linaro.org,m:andi@etezian.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:wens@csie.org,m:jernej.skrabec@gmail.com,m:samuel@sholland.org,m:masahisa.kojima@linaro.org,m:jaswinder.singh@linaro.org,m:rostedt@goodmis.org,m
 :mingo@redhat.com,m:l.stelmach@samsung.com,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:alex.aring@gmail.com,m:stefan@datenfreihafen.org,m:kvalo@kernel.org,m:thierry.reding@gmail.com,m:jonathanh@nvidia.com,m:skomatineni@nvidia.com,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:j.neuschaefer@gmx.net,m:vireshk@kernel.org,m:rmfrfs@gmail.com,m:johan@kernel.org,m:elder@kernel.org,m:gregkh@linuxfoundation.org,m:git@amd.com,m:linux-spi@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:joel@jms.id.au,m:andrew@aj.id.au,m:radu_nicolae.pirea@upb.ro,m:nicolas.ferre@microchip.com,m:alexandre.belloni@bootlin.com,m:claudiu.beznea@microchip.com,m:bcm-kernel-feedback-list@broadcom.com,m:fancer.lancer@gmail.com,m:kernel@pengutronix.de,m:festevam@gmail.com,m:linux-imx@nxp.com,m:jbrunet@baylibre.com,m:martin.blumenstingl@googlemail.com,m:avifishman70@gmail.com,m:tmaimon77@gmail.com,m:tali.perry1@gmail.com,m:venture@google.com,m:yuenn@google.com,m:benjaminfa
 ir@google.com,m:yogeshgaur.83@gmail.com,m:konrad.dybcio@somainline.org,m:alim.akhtar@samsung.com,m:ldewangan@nvidia.com,m:michal.simek@amd.com,m:linux-aspeed@lists.ozlabs.org,m:openbmc@lists.ozlabs.org,m:linux-arm-kernel@lists.infradead.org,m:linux-rpi-kernel@lists.infradead.org,m:linux-amlogic@lists.infradead.org,m:linux-mediatek@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:linux-samsung-soc@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-sunxi@lists.linux.dev,s:greybus-dev@lists.linaro.org];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,none];
	R_SPF_ALLOW(-0.20)[+a:dfw.source.kernel.org];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	RCPT_COUNT_GT_50(0.00)[116];
	FREEMAIL_CC(0.00)[bootlin.com,nod.at,ti.com,kernel.org,microchip.com,amd.com,aspeedtech.com,kaod.org,gmail.com,broadcom.com,linux.ibm.com,nxp.com,huawei.com,pengutronix.de,baylibre.com,linaro.org,zonque.org,free.fr,sntech.de,etezian.org,foss.st.com,csie.org,sholland.org,goodmis.org,redhat.com,samsung.com,davemloft.net,google.com,datenfreihafen.org,nvidia.com,gmx.net,linuxfoundation.org,vger.kernel.org,jms.id.au,aj.id.au,upb.ro,googlemail.com,somainline.org,lists.ozlabs.org,lists.infradead.org,st-md-mailman.stormreply.com,lists.linux.dev,metafoo.de,analog.com,walle.cc,dabbelt.com,lists.freedesktop.org,lists.linaro.org];
	ASN(0.00)[asn:54825, ipnet:139.178.80.0/21, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Rspamd-Action: no action
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Hits: max-recipients
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-size; news-moderation; no-subject; digests; suspicious-header
Message-ID-Hash: MEV73ANCL76EUELX734W5BFOLLFQJQSZ
X-Message-ID-Hash: MEV73ANCL76EUELX734W5BFOLLFQJQSZ
X-Mailman-Approved-At: Wed, 08 Feb 2023 20:17:45 +0000
CC: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com, jic23@kernel.org, tudor.ambarus@microchip.com, pratyush@kernel.org, sanju.mehta@amd.com, chin-ting_kuo@aspeedtech.com, clg@kaod.org, kdasu.kdev@gmail.com, f.fainelli@gmail.com, rjui@broadcom.com, sbranden@broadcom.com, eajames@linux.ibm.com, olteanv@gmail.com, han.xu@nxp.com, john.garry@huawei.com, shawnguo@kernel.org, s.hauer@pengutronix.de, narmstrong@baylibre.com, khilman@baylibre.com, matthias.bgg@gmail.com, haibo.chen@nxp.com, linus.walleij@linaro.org, daniel@zonque.org, haojian.zhuang@gmail.com, robert.jarzmik@free.fr, agross@kernel.org, bjorn.andersson@linaro.org, heiko@sntech.de, krzysztof.kozlowski@linaro.org, andi@etezian.org, mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, wens@csie.org, jernej.skrabec@gmail.com, samuel@sholland.org, masahisa.kojima@linaro.org, jaswinder.singh@linaro.org, rostedt@goodmis.org, mingo@redhat.com, l.stelmach@samsung.com, davem@davemloft.net, edumazet@google.com, kuba@kern
 el.org, pabeni@redhat.com, alex.aring@gmail.com, stefan@datenfreihafen.org, kvalo@kernel.org, thierry.reding@gmail.com, jonathanh@nvidia.com, skomatineni@nvidia.com, sumit.semwal@linaro.org, christian.koenig@amd.com, j.neuschaefer@gmx.net, vireshk@kernel.org, johan@kernel.org, elder@kernel.org, git@amd.com, linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, joel@jms.id.au, andrew@aj.id.au, radu_nicolae.pirea@upb.ro, nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, claudiu.beznea@microchip.com, bcm-kernel-feedback-list@broadcom.com, fancer.lancer@gmail.com, kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com, jbrunet@baylibre.com, martin.blumenstingl@googlemail.com, avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com, venture@google.com, yuenn@google.com, benjaminfair@google.com, yogeshgaur.83@gmail.com, konrad.dybcio@somainline.org, alim.akhtar@samsung.com, ldewangan@nvidia.com, michal.simek@amd.com, linux-aspeed@lists.ozlabs.org, openbmc@lis
 ts.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, netdev@vger.kernel.org, linux-wpan@vger.kernel.org, libertas-dev@lists.infradead.org, linux-wireless@vger.kernel.org, linux-mtd@lists.infradead.org, lars@metafoo.de, Michael.Hennerich@analog.com, linux-iio@vger.kernel.org, michael@walle.cc, palmer@dabbelt.com, linux-riscv@lists.infradead.org, linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, amitrkcian2002@gmail.com
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v2 02/13] spi: Replace all spi->chip_select and spi->cs_gpiod references with function call
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/MEV73ANCL76EUELX734W5BFOLLFQJQSZ/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: multipart/mixed; boundary="===============3281496052453831408=="


--===============3281496052453831408==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="RnOekfr0Q/w96KQx"
Content-Disposition: inline


--RnOekfr0Q/w96KQx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jan 20, 2023 at 12:23:31AM +0530, Amit Kumar Mahapatra wrote:
> Supporting multi-cs in spi drivers would require the chip_select & cs_gpiod
> members of struct spi_device to be an array. But changing the type of these
> members to array would break the spi driver functionality. To make the
> transition smoother introduced four new APIs to get/set the
> spi->chip_select & spi->cs_gpiod and replaced all spi->chip_select and
> spi->cs_gpiod references with get or set API calls.
> While adding multi-cs support in further patches the chip_select & cs_gpiod
> members of the spi_device structure would be converted to arrays & the
> "idx" parameter of the APIs would be used as array index i.e.,
> spi->chip_select[idx] & spi->cs_gpiod[idx] respectively.

This doesn't apply against current code, please check and resend.

--RnOekfr0Q/w96KQx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmPaghYACgkQJNaLcl1U
h9Cmcgf7BtQa6jVrXNU71IJVO9/XKJzR22YYvwnRLJqC4Pd6uUnIG4DAhyw1qQyf
fucGeAY9Y8jlqFuw1RM+0pFy53EabmhZAQjypGnDXk/YJ0fTV2VJuT7bSfXC+JJe
0Qs8nYPpVfn9TmLvBxiPjnsghneRyWbx+V7MzflSFTsVl/fM5ypTH92qZ3S6rTDh
ExXE6oTe7hNyto8+VoMfi0qvdqTKMyPciO0DnOeUsbPG3FpAiNiHN1lD5yhI6QEM
jA8R67+KRGUoFZsozgB5N3NN8BH9FWq5Hrl/ToTuWP1AT9C8prAEa2uwlU3YVDmA
SztMxe2B+kl+AF4gZ5yyL6EOiMGk6g==
=zhKL
-----END PGP SIGNATURE-----

--RnOekfr0Q/w96KQx--

--===============3281496052453831408==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

--===============3281496052453831408==--
