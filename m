Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A036677FEE
	for <lists+greybus-dev@lfdr.de>; Mon, 23 Jan 2023 16:37:26 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 4C37A443D1
	for <lists+greybus-dev@lfdr.de>; Mon, 23 Jan 2023 15:37:25 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	by lists.linaro.org (Postfix) with ESMTPS id D651F3E8ED
	for <greybus-dev@lists.linaro.org>; Fri, 20 Jan 2023 09:49:24 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=none;
	spf=pass (lists.linaro.org: domain of heiko@sntech.de designates 185.11.138.130 as permitted sender) smtp.mailfrom=heiko@sntech.de;
	dmarc=pass (policy=none) header.from=sntech.de
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1pInzo-0002mL-W5; Fri, 20 Jan 2023 10:47:41 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: broonie@kernel.org, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, jic23@kernel.org, tudor.ambarus@microchip.com,
 pratyush@kernel.org, sanju.mehta@amd.com, chin-ting_kuo@aspeedtech.com,
 clg@kaod.org, kdasu.kdev@gmail.com, f.fainelli@gmail.com, rjui@broadcom.com,
 sbranden@broadcom.com, eajames@linux.ibm.com, olteanv@gmail.com,
 han.xu@nxp.com, john.garry@huawei.com, shawnguo@kernel.org,
 s.hauer@pengutronix.de, narmstrong@baylibre.com, khilman@baylibre.com,
 matthias.bgg@gmail.com, haibo.chen@nxp.com, linus.walleij@linaro.org,
 daniel@zonque.org, haojian.zhuang@gmail.com, robert.jarzmik@free.fr,
 agross@kernel.org, bjorn.andersson@linaro.org,
 krzysztof.kozlowski@linaro.org, andi@etezian.org, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, wens@csie.org, jernej.skrabec@gmail.com,
 samuel@sholland.org, masahisa.kojima@linaro.org, jaswinder.singh@linaro.org,
 rostedt@goodmis.org, mingo@redhat.com, l.stelmach@samsung.com,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 alex.aring@gmail.com, stefan@datenfreihafen.org, kvalo@kernel.org,
 thierry.reding@gmail.com, jonathanh@nvidia.com, skomatineni@nvidia.com,
 sumit.semwal@linaro.org, christian.koenig@amd.com, j.neuschaefer@gmx.net,
 vireshk@kernel.org, rmfrfs@gmail.com, johan@kernel.org, elder@kernel.org,
 gregkh@linuxfoundation.org,
 Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
Date: Fri, 20 Jan 2023 10:47:37 +0100
Message-ID: <3658396.MHq7AAxBmi@diego>
In-Reply-To: <20230119185342.2093323-3-amit.kumar-mahapatra@amd.com>
References: 
 <20230119185342.2093323-1-amit.kumar-mahapatra@amd.com>
 <20230119185342.2093323-3-amit.kumar-mahapatra@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
X-Spamd-Result: default: False [-3.80 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	FORGED_RECIPIENTS(2.00)[m:broonie@kernel.org,m:miquel.raynal@bootlin.com,m:richard@nod.at,m:vigneshr@ti.com,m:jic23@kernel.org,m:tudor.ambarus@microchip.com,m:pratyush@kernel.org,m:sanju.mehta@amd.com,m:chin-ting_kuo@aspeedtech.com,m:clg@kaod.org,m:kdasu.kdev@gmail.com,m:f.fainelli@gmail.com,m:rjui@broadcom.com,m:sbranden@broadcom.com,m:eajames@linux.ibm.com,m:olteanv@gmail.com,m:han.xu@nxp.com,m:john.garry@huawei.com,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:narmstrong@baylibre.com,m:khilman@baylibre.com,m:matthias.bgg@gmail.com,m:haibo.chen@nxp.com,m:linus.walleij@linaro.org,m:daniel@zonque.org,m:haojian.zhuang@gmail.com,m:robert.jarzmik@free.fr,m:agross@kernel.org,m:bjorn.andersson@linaro.org,m:krzysztof.kozlowski@linaro.org,m:andi@etezian.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:wens@csie.org,m:jernej.skrabec@gmail.com,m:samuel@sholland.org,m:masahisa.kojima@linaro.org,m:jaswinder.singh@linaro.org,m:rostedt@goodmis.org,m:mingo@redhat.com,m:l.stelma
 ch@samsung.com,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:alex.aring@gmail.com,m:stefan@datenfreihafen.org,m:kvalo@kernel.org,m:thierry.reding@gmail.com,m:jonathanh@nvidia.com,m:skomatineni@nvidia.com,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:j.neuschaefer@gmx.net,m:vireshk@kernel.org,m:rmfrfs@gmail.com,m:johan@kernel.org,m:elder@kernel.org,m:gregkh@linuxfoundation.org,m:amit.kumar-mahapatra@amd.com,m:git@amd.com,m:linux-spi@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:joel@jms.id.au,m:andrew@aj.id.au,m:radu_nicolae.pirea@upb.ro,m:nicolas.ferre@microchip.com,m:alexandre.belloni@bootlin.com,m:claudiu.beznea@microchip.com,m:bcm-kernel-feedback-list@broadcom.com,m:fancer.lancer@gmail.com,m:kernel@pengutronix.de,m:festevam@gmail.com,m:linux-imx@nxp.com,m:jbrunet@baylibre.com,m:martin.blumenstingl@googlemail.com,m:avifishman70@gmail.com,m:tmaimon77@gmail.com,m:tali.perry1@gmail.com,m:venture@google.com,m:yuenn@google.com,m:benjami
 nfair@google.com,m:yogeshgaur.83@gmail.com,m:konrad.dybcio@somainline.org,m:alim.akhtar@samsung.com,m:ldewangan@nvidia.com,m:michal.simek@amd.com,m:linux-aspeed@lists.ozlabs.org,m:openbmc@lists.ozlabs.org,m:linux-arm-kernel@lists.infradead.org,m:linux-rpi-kernel@lists.infradead.org,m:linux-amlogic@lists.infradead.org,m:linux-mediatek@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:linux-samsung-soc@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-sunxi@lists.linux.dev,s:greybus-dev@lists.linaro.org];
	SUSPICIOUS_RECIPS(1.50)[];
	CTE_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[sntech.de,none];
	MID_RHS_NOT_FQDN(0.50)[];
	RCVD_IN_DNSWL_HI(-0.50)[91.65.34.88:received];
	R_SPF_ALLOW(-0.20)[+ip4:185.11.138.130];
	MIME_GOOD(-0.10)[text/plain];
	TAGGED_RCPT(0.00)[];
	FREEMAIL_CC(0.00)[amd.com,vger.kernel.org,jms.id.au,aj.id.au,upb.ro,microchip.com,bootlin.com,broadcom.com,gmail.com,pengutronix.de,nxp.com,baylibre.com,googlemail.com,google.com,somainline.org,samsung.com,nvidia.com,lists.ozlabs.org,lists.infradead.org,st-md-mailman.stormreply.com,lists.linux.dev,metafoo.de,analog.com,walle.cc,dabbelt.com,lists.freedesktop.org,lists.linaro.org];
	RCVD_COUNT_TWO(0.00)[2];
	NEURAL_HAM(-0.00)[-1.000];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:48823, ipnet:185.11.136.0/22, country:DE];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_GT_50(0.00)[116];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,bootlin.com,nod.at,ti.com,microchip.com,amd.com,aspeedtech.com,kaod.org,gmail.com,broadcom.com,linux.ibm.com,nxp.com,huawei.com,pengutronix.de,baylibre.com,linaro.org,zonque.org,free.fr,etezian.org,foss.st.com,csie.org,sholland.org,goodmis.org,redhat.com,samsung.com,davemloft.net,google.com,datenfreihafen.org,nvidia.com,gmx.net,linuxfoundation.org];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: D651F3E8ED
X-Spamd-Bar: ---
X-MailFrom: heiko@sntech.de
X-Mailman-Rule-Hits: max-recipients
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-size; news-moderation; no-subject; digests; suspicious-header
Message-ID-Hash: F6BZ77CNJEAU2OB4PY3E3PFU4NHGFF2U
X-Message-ID-Hash: F6BZ77CNJEAU2OB4PY3E3PFU4NHGFF2U
X-Mailman-Approved-At: Mon, 23 Jan 2023 15:37:21 +0000
CC: git@amd.com, linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, joel@jms.id.au, andrew@aj.id.au, radu_nicolae.pirea@upb.ro, nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, claudiu.beznea@microchip.com, bcm-kernel-feedback-list@broadcom.com, fancer.lancer@gmail.com, kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com, jbrunet@baylibre.com, martin.blumenstingl@googlemail.com, avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com, venture@google.com, yuenn@google.com, benjaminfair@google.com, yogeshgaur.83@gmail.com, konrad.dybcio@somainline.org, alim.akhtar@samsung.com, ldewangan@nvidia.com, michal.simek@amd.com, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-stm32@st-md-mailman.sto
 rmreply.com, linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, netdev@vger.kernel.org, linux-wpan@vger.kernel.org, libertas-dev@lists.infradead.org, linux-wireless@vger.kernel.org, linux-mtd@lists.infradead.org, lars@metafoo.de, Michael.Hennerich@analog.com, linux-iio@vger.kernel.org, michael@walle.cc, palmer@dabbelt.com, linux-riscv@lists.infradead.org, linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, amitrkcian2002@gmail.com
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v2 02/13] spi: Replace all spi->chip_select and spi->cs_gpiod references with function call
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/F6BZ77CNJEAU2OB4PY3E3PFU4NHGFF2U/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Transfer-Encoding: 7bit

Am Donnerstag, 19. Januar 2023, 19:53:31 CET schrieb Amit Kumar Mahapatra:
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
> 
> Signed-off-by: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
> ---

> diff --git a/drivers/spi/spi-rockchip-sfc.c b/drivers/spi/spi-rockchip-sfc.c
> index bd87d3c92dd3..246e81453ec3 100644
> --- a/drivers/spi/spi-rockchip-sfc.c
> +++ b/drivers/spi/spi-rockchip-sfc.c
> @@ -346,7 +346,7 @@ static int rockchip_sfc_xfer_setup(struct rockchip_sfc *sfc,
>  
>  	/* set the Controller */
>  	ctrl |= SFC_CTRL_PHASE_SEL_NEGETIVE;
> -	cmd |= mem->spi->chip_select << SFC_CMD_CS_SHIFT;
> +	cmd |= spi_get_chipselect(mem->spi, 0) << SFC_CMD_CS_SHIFT;
>  
>  	dev_dbg(sfc->dev, "sfc addr.nbytes=%x(x%d) dummy.nbytes=%x(x%d)\n",
>  		op->addr.nbytes, op->addr.buswidth,
> diff --git a/drivers/spi/spi-rockchip.c b/drivers/spi/spi-rockchip.c
> index 79242dc5272d..adc5638eff4b 100644
> --- a/drivers/spi/spi-rockchip.c
> +++ b/drivers/spi/spi-rockchip.c
> @@ -246,28 +246,30 @@ static void rockchip_spi_set_cs(struct spi_device *spi, bool enable)
>  	bool cs_asserted = spi->mode & SPI_CS_HIGH ? enable : !enable;
>  
>  	/* Return immediately for no-op */
> -	if (cs_asserted == rs->cs_asserted[spi->chip_select])
> +	if (cs_asserted == rs->cs_asserted[spi_get_chipselect(spi, 0)])
>  		return;
>  
>  	if (cs_asserted) {
>  		/* Keep things powered as long as CS is asserted */
>  		pm_runtime_get_sync(rs->dev);
>  
> -		if (spi->cs_gpiod)
> +		if (spi_get_csgpiod(spi, 0))
>  			ROCKCHIP_SPI_SET_BITS(rs->regs + ROCKCHIP_SPI_SER, 1);
>  		else
> -			ROCKCHIP_SPI_SET_BITS(rs->regs + ROCKCHIP_SPI_SER, BIT(spi->chip_select));
> +			ROCKCHIP_SPI_SET_BITS(rs->regs + ROCKCHIP_SPI_SER,
> +					      BIT(spi_get_chipselect(spi, 0)));
>  	} else {
> -		if (spi->cs_gpiod)
> +		if (spi_get_csgpiod(spi, 0))
>  			ROCKCHIP_SPI_CLR_BITS(rs->regs + ROCKCHIP_SPI_SER, 1);
>  		else
> -			ROCKCHIP_SPI_CLR_BITS(rs->regs + ROCKCHIP_SPI_SER, BIT(spi->chip_select));
> +			ROCKCHIP_SPI_CLR_BITS(rs->regs + ROCKCHIP_SPI_SER,
> +					      BIT(spi_get_chipselect(spi, 0)));
>  
>  		/* Drop reference from when we first asserted CS */
>  		pm_runtime_put(rs->dev);
>  	}
>  
> -	rs->cs_asserted[spi->chip_select] = cs_asserted;
> +	rs->cs_asserted[spi_get_chipselect(spi, 0)] = cs_asserted;
>  }
>  
>  static void rockchip_spi_handle_err(struct spi_controller *ctlr,
> @@ -541,7 +543,7 @@ static int rockchip_spi_config(struct rockchip_spi *rs,
>  	if (spi->mode & SPI_LSB_FIRST)
>  		cr0 |= CR0_FBM_LSB << CR0_FBM_OFFSET;
>  	if (spi->mode & SPI_CS_HIGH)
> -		cr0 |= BIT(spi->chip_select) << CR0_SOI_OFFSET;
> +		cr0 |= BIT(spi_get_chipselect(spi, 0)) << CR0_SOI_OFFSET;
>  
>  	if (xfer->rx_buf && xfer->tx_buf)
>  		cr0 |= CR0_XFM_TR << CR0_XFM_OFFSET;
> @@ -724,7 +726,7 @@ static int rockchip_spi_setup(struct spi_device *spi)
>  	struct rockchip_spi *rs = spi_controller_get_devdata(spi->controller);
>  	u32 cr0;
>  
> -	if (!spi->cs_gpiod && (spi->mode & SPI_CS_HIGH) && !rs->cs_high_supported) {
> +	if (!spi_get_csgpiod(spi, 0) && (spi->mode & SPI_CS_HIGH) && !rs->cs_high_supported) {
>  		dev_warn(&spi->dev, "setup: non GPIO CS can't be active-high\n");
>  		return -EINVAL;
>  	}
> @@ -735,10 +737,10 @@ static int rockchip_spi_setup(struct spi_device *spi)
>  
>  	cr0 &= ~(0x3 << CR0_SCPH_OFFSET);
>  	cr0 |= ((spi->mode & 0x3) << CR0_SCPH_OFFSET);
> -	if (spi->mode & SPI_CS_HIGH && spi->chip_select <= 1)
> -		cr0 |= BIT(spi->chip_select) << CR0_SOI_OFFSET;
> -	else if (spi->chip_select <= 1)
> -		cr0 &= ~(BIT(spi->chip_select) << CR0_SOI_OFFSET);
> +	if (spi->mode & SPI_CS_HIGH && spi_get_chipselect(spi, 0) <= 1)
> +		cr0 |= BIT(spi_get_chipselect(spi, 0)) << CR0_SOI_OFFSET;
> +	else if (spi_get_chipselect(spi, 0) <= 1)
> +		cr0 &= ~(BIT(spi_get_chipselect(spi, 0)) << CR0_SOI_OFFSET);
>  
>  	writel_relaxed(cr0, rs->regs + ROCKCHIP_SPI_CTRLR0);

for the two Rockchip drivers
Acked-by: Heiko Stuebner <heiko@sntech.de>


_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
