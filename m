Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 137A46813A8
	for <lists+greybus-dev@lfdr.de>; Mon, 30 Jan 2023 15:45:32 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 15B02409B1
	for <lists+greybus-dev@lfdr.de>; Mon, 30 Jan 2023 14:45:31 +0000 (UTC)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	by lists.linaro.org (Postfix) with ESMTPS id A30C33EC03
	for <greybus-dev@lists.linaro.org>; Wed, 25 Jan 2023 00:57:54 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=broadcom.com header.s=google header.b=RSAAnedJ;
	spf=pass (lists.linaro.org: domain of william.zhang@broadcom.com designates 209.85.217.46 as permitted sender) smtp.mailfrom=william.zhang@broadcom.com;
	dmarc=pass (policy=quarantine) header.from=broadcom.com
Received: by mail-vs1-f46.google.com with SMTP id i185so18326490vsc.6
        for <greybus-dev@lists.linaro.org>; Tue, 24 Jan 2023 16:57:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=cc:to:subject:message-id:date:thread-index:mime-version:in-reply-to
         :references:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7WNlndtSRP6NCcjROQpkfjOYD4bOOfTCPCKfxWXCeQ8=;
        b=RSAAnedJtGjWRkMD1dNQSMkpZvDGKGZsBSvuSXFyetUOXzYkQ/U8xh2p5V4nHfQZUs
         5nGSPYCwE4jc/091CzJb7u4gR59JvaLuAGBSALnm4u3mfPpvAFOLfbYWu2zq9r7y2sAp
         9H/7+P1i5hqHSh3XDb2Ku/9W7+KpYfathRMRI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:thread-index:mime-version:in-reply-to
         :references:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7WNlndtSRP6NCcjROQpkfjOYD4bOOfTCPCKfxWXCeQ8=;
        b=qKgKpMKSJaSBu0PU84bZFgBmxA5I3fbq1dlla25axJ1CuKoD791np5ddS/HV8sGfeH
         rFImwcLq9xyIWSMTkKGWzDabr74xkWjFI6XVE/46+P92Ik/r5cdUCW52mAE7AsPLd140
         zlmGwsTLCioOe/vRFrLBTWzvppbqzgZVg++TLrPezTnEK5lYD2PTmsq+E5AK3QAxCHox
         WANiZJ8l39EY9mgYxKqAAehYrmjHNFQc/dqsGl83d/7MN78uf7/iZwXKSjDPW4Hpfn6M
         8LgWAuJPgcmNeWcoZWJEky8WpdU5veoiJVke+zwhmKMSgRQSnyXAOXLamJL6UPZqiGJq
         6PfA==
X-Gm-Message-State: AFqh2ko78mx1o9IiS/cNbxQI7Tu/KuQHVS6YTdFicMDtFNRt/5vqMYdp
	vqI+RbYV3qbL4KSfmhMJ4txvyqorxnhxxukH1XSmLw==
X-Google-Smtp-Source: AMrXdXu0WEVAHtkl/7WrGp7gsGmIxeNAjZACQY1znOQilpBjqALn5uFkSCuep3Y6cqMY533KDesP8Mmq99uNyBp2hTA=
X-Received: by 2002:a67:f246:0:b0:3b1:5690:a240 with SMTP id
 y6-20020a67f246000000b003b15690a240mr3921552vsm.68.1674608274113; Tue, 24 Jan
 2023 16:57:54 -0800 (PST)
From: William Zhang <william.zhang@broadcom.com>
References: <20230119185342.2093323-1-amit.kumar-mahapatra@amd.com> <20230119185342.2093323-3-amit.kumar-mahapatra@amd.com>
In-Reply-To: <20230119185342.2093323-3-amit.kumar-mahapatra@amd.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQGsd40KKMSPSaowQedOCmq8Q0lhhQIBWekOAbfQgXk=
Date: Tue, 24 Jan 2023 16:57:49 -0800
Message-ID: <36840e0caeca5f53eef4fab615fc7976@mail.gmail.com>
To: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>, broonie@kernel.org,
	miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com, jic23@kernel.org,
	tudor.ambarus@microchip.com, pratyush@kernel.org, sanju.mehta@amd.com,
	chin-ting_kuo@aspeedtech.com, clg@kaod.org, kdasu.kdev@gmail.com,
	f.fainelli@gmail.com, rjui@broadcom.com, sbranden@broadcom.com,
	eajames@linux.ibm.com, olteanv@gmail.com, han.xu@nxp.com,
	john.garry@huawei.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
	narmstrong@baylibre.com, khilman@baylibre.com, matthias.bgg@gmail.com,
	haibo.chen@nxp.com, linus.walleij@linaro.org, daniel@zonque.org,
	haojian.zhuang@gmail.com, robert.jarzmik@free.fr, agross@kernel.org,
	bjorn.andersson@linaro.org, heiko@sntech.de, krzysztof.kozlowski@linaro.org,
	andi@etezian.org, mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
	wens@csie.org, jernej.skrabec@gmail.com, samuel@sholland.org,
	masahisa.kojima@linaro.org, jaswinder.singh@linaro.org, rostedt@goodmis.org,
	mingo@redhat.com, l.stelmach@samsung.com, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, alex.aring@gmail.com,
	stefan@datenfreihafen.org, kvalo@kernel.org, thierry.reding@gmail.com,
	jonathanh@nvidia.com, skomatineni@nvidia.com, sumit.semwal@linaro.org,
	christian.koenig@amd.com, j.neuschaefer@gmx.net, vireshk@kernel.org,
	rmfrfs@gmail.com, johan@kernel.org, elder@kernel.org,
	gregkh@linuxfoundation.org
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: A30C33EC03
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.60 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	SIGNED_SMIME(-2.00)[];
	FORGED_RECIPIENTS(2.00)[m:amit.kumar-mahapatra@amd.com,m:broonie@kernel.org,m:miquel.raynal@bootlin.com,m:richard@nod.at,m:vigneshr@ti.com,m:jic23@kernel.org,m:tudor.ambarus@microchip.com,m:pratyush@kernel.org,m:sanju.mehta@amd.com,m:chin-ting_kuo@aspeedtech.com,m:clg@kaod.org,m:kdasu.kdev@gmail.com,m:f.fainelli@gmail.com,m:rjui@broadcom.com,m:sbranden@broadcom.com,m:eajames@linux.ibm.com,m:olteanv@gmail.com,m:han.xu@nxp.com,m:john.garry@huawei.com,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:narmstrong@baylibre.com,m:khilman@baylibre.com,m:matthias.bgg@gmail.com,m:haibo.chen@nxp.com,m:linus.walleij@linaro.org,m:daniel@zonque.org,m:haojian.zhuang@gmail.com,m:robert.jarzmik@free.fr,m:agross@kernel.org,m:bjorn.andersson@linaro.org,m:heiko@sntech.de,m:krzysztof.kozlowski@linaro.org,m:andi@etezian.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:wens@csie.org,m:jernej.skrabec@gmail.com,m:samuel@sholland.org,m:masahisa.kojima@linaro.org,m:jaswinder.singh@linaro.org,m:
 rostedt@goodmis.org,m:mingo@redhat.com,m:l.stelmach@samsung.com,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:alex.aring@gmail.com,m:stefan@datenfreihafen.org,m:kvalo@kernel.org,m:thierry.reding@gmail.com,m:jonathanh@nvidia.com,m:skomatineni@nvidia.com,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:j.neuschaefer@gmx.net,m:vireshk@kernel.org,m:rmfrfs@gmail.com,m:johan@kernel.org,m:elder@kernel.org,m:gregkh@linuxfoundation.org,m:git@amd.com,m:linux-spi@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:joel@jms.id.au,m:andrew@aj.id.au,m:radu_nicolae.pirea@upb.ro,m:nicolas.ferre@microchip.com,m:alexandre.belloni@bootlin.com,m:claudiu.beznea@microchip.com,m:bcm-kernel-feedback-list@broadcom.com,m:fancer.lancer@gmail.com,m:kernel@pengutronix.de,m:festevam@gmail.com,m:linux-imx@nxp.com,m:jbrunet@baylibre.com,m:martin.blumenstingl@googlemail.com,m:avifishman70@gmail.com,m:tmaimon77@gmail.com,m:tali.perry1@gmail.com,m:venture@google.com,m:yuenn@go
 ogle.com,m:benjaminfair@google.com,m:yogeshgaur.83@gmail.com,m:konrad.dybcio@somainline.org,m:alim.akhtar@samsung.com,m:ldewangan@nvidia.com,m:michal.simek@amd.com,m:linux-aspeed@lists.ozlabs.org,m:openbmc@lists.ozlabs.org,m:linux-arm-kernel@lists.infradead.org,m:linux-rpi-kernel@lists.infradead.org,m:linux-amlogic@lists.infradead.org,m:linux-mediatek@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:linux-samsung-soc@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,s:greybus-dev@lists.linaro.org];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[broadcom.com,quarantine];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[broadcom.com:s=google];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCPT_COUNT_GT_50(0.00)[117];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	TAGGED_RCPT(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.217.46:from];
	NEURAL_HAM(-0.00)[-1.000];
	FREEMAIL_CC(0.00)[amd.com,vger.kernel.org,jms.id.au,aj.id.au,upb.ro,microchip.com,bootlin.com,broadcom.com,gmail.com,pengutronix.de,nxp.com,baylibre.com,googlemail.com,google.com,somainline.org,samsung.com,nvidia.com,lists.ozlabs.org,lists.infradead.org,st-md-mailman.stormreply.com,lists.linux.dev,metafoo.de,analog.com,walle.cc,dabbelt.com,lists.freedesktop.org,lists.linaro.org];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_TO(0.00)[amd.com,kernel.org,bootlin.com,nod.at,ti.com,microchip.com,aspeedtech.com,kaod.org,gmail.com,broadcom.com,linux.ibm.com,nxp.com,huawei.com,pengutronix.de,baylibre.com,linaro.org,zonque.org,free.fr,sntech.de,etezian.org,foss.st.com,csie.org,sholland.org,goodmis.org,redhat.com,samsung.com,davemloft.net,google.com,datenfreihafen.org,nvidia.com,gmx.net,linuxfoundation.org];
	DKIM_TRACE(0.00)[broadcom.com:+];
	HAS_ATTACHMENT(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	ARC_NA(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action
X-MailFrom: william.zhang@broadcom.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: UJP3OGYLCPMOGDWATQSZZ5RFQBKNWNQI
X-Message-ID-Hash: UJP3OGYLCPMOGDWATQSZZ5RFQBKNWNQI
X-Mailman-Approved-At: Mon, 30 Jan 2023 14:45:26 +0000
CC: git@amd.com, linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, joel@jms.id.au, andrew@aj.id.au, radu_nicolae.pirea@upb.ro, nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, claudiu.beznea@microchip.com, bcm-kernel-feedback-list@broadcom.com, fancer.lancer@gmail.com, kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com, jbrunet@baylibre.com, martin.blumenstingl@googlemail.com, avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com, venture@google.com, yuenn@google.com, benjaminfair@google.com, yogeshgaur.83@gmail.com, konrad.dybcio@somainline.org, alim.akhtar@samsung.com, ldewangan@nvidia.com, michal.simek@amd.com, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-stm32@st-md-mailman.sto
 rmreply.com, linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, netdev@vger.kernel.org, linux-wpan@vger.kernel.org, libertas-dev@lists.infradead.org, linux-wireless@vger.kernel.org, linux-mtd@lists.infradead.org, lars@metafoo.de, Michael.Hennerich@analog.com, linux-iio@vger.kernel.org, michael@walle.cc, palmer@dabbelt.com, linux-riscv@lists.infradead.org, linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, amitrkcian2002@gmail.com
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v2 02/13] spi: Replace all spi->chip_select and spi->cs_gpiod references with function call
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/UJP3OGYLCPMOGDWATQSZZ5RFQBKNWNQI/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: multipart/mixed; boundary="===============4574372307935300212=="

--===============4574372307935300212==
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="000000000000566d0305f30c1f7e"

--000000000000566d0305f30c1f7e
Content-Type: text/plain; charset="UTF-8"

On 01/19/2023 10:53 AM, 'Amit Kumar Mahapatra' via
BCM-KERNEL-FEEDBACK-LIST,PDL wrote:
> diff --git a/drivers/spi/spi-bcm63xx-hsspi.c
> b/drivers/spi/spi-bcm63xx-hsspi.c
> index b871fd810d80..dc179c4677d4 100644
> --- a/drivers/spi/spi-bcm63xx-hsspi.c
> +++ b/drivers/spi/spi-bcm63xx-hsspi.c
> @@ -130,7 +130,7 @@ static void bcm63xx_hsspi_set_cs(struct bcm63xx_hsspi
> *bs, unsigned int cs,
>   static void bcm63xx_hsspi_set_clk(struct bcm63xx_hsspi *bs,
>   				  struct spi_device *spi, int hz)
>   {
> -	unsigned int profile = spi->chip_select;
> +	unsigned int profile = spi_get_chipselect(spi, 0);
>   	u32 reg;
>
>   	reg = DIV_ROUND_UP(2048, DIV_ROUND_UP(bs->speed_hz, hz));
> @@ -157,7 +157,7 @@ static void bcm63xx_hsspi_set_clk(struct bcm63xx_hsspi
> *bs,
>   static int bcm63xx_hsspi_do_txrx(struct spi_device *spi, struct
> spi_transfer *t)
>   {
>   	struct bcm63xx_hsspi *bs = spi_master_get_devdata(spi->master);
> -	unsigned int chip_select = spi->chip_select;
> +	unsigned int chip_select = spi_get_chipselect(spi, 0);
>   	u16 opcode = 0;
>   	int pending = t->len;
>   	int step_size = HSSPI_BUFFER_LEN;
> @@ -165,7 +165,7 @@ static int bcm63xx_hsspi_do_txrx(struct spi_device
> *spi, struct spi_transfer *t)
>   	u8 *rx = t->rx_buf;
>
>   	bcm63xx_hsspi_set_clk(bs, spi, t->speed_hz);
> -	bcm63xx_hsspi_set_cs(bs, spi->chip_select, true);
> +	bcm63xx_hsspi_set_cs(bs, spi_get_chipselect(spi, 0), true);
>
>   	if (tx && rx)
>   		opcode = HSSPI_OP_READ_WRITE;
> @@ -228,14 +228,14 @@ static int bcm63xx_hsspi_setup(struct spi_device
> *spi)
>   	u32 reg;
>
>   	reg = __raw_readl(bs->regs +
> -			  HSSPI_PROFILE_SIGNAL_CTRL_REG(spi->chip_select));
> +			  HSSPI_PROFILE_SIGNAL_CTRL_REG(spi_get_chipselect(spi, 0)));
>   	reg &= ~(SIGNAL_CTRL_LAUNCH_RISING | SIGNAL_CTRL_LATCH_RISING);
>   	if (spi->mode & SPI_CPHA)
>   		reg |= SIGNAL_CTRL_LAUNCH_RISING;
>   	else
>   		reg |= SIGNAL_CTRL_LATCH_RISING;
>   	__raw_writel(reg, bs->regs +
> -		     HSSPI_PROFILE_SIGNAL_CTRL_REG(spi->chip_select));
> +		     HSSPI_PROFILE_SIGNAL_CTRL_REG(spi_get_chipselect(spi, 0)));
>
>   	mutex_lock(&bs->bus_mutex);
>   	reg = __raw_readl(bs->regs + HSSPI_GLOBAL_CTRL_REG);
> @@ -243,16 +243,16 @@ static int bcm63xx_hsspi_setup(struct spi_device
> *spi)
>   	/* only change actual polarities if there is no transfer */
>   	if ((reg & GLOBAL_CTRL_CS_POLARITY_MASK) == bs->cs_polarity) {
>   		if (spi->mode & SPI_CS_HIGH)
> -			reg |= BIT(spi->chip_select);
> +			reg |= BIT(spi_get_chipselect(spi, 0));
>   		else
> -			reg &= ~BIT(spi->chip_select);
> +			reg &= ~BIT(spi_get_chipselect(spi, 0));
>   		__raw_writel(reg, bs->regs + HSSPI_GLOBAL_CTRL_REG);
>   	}
>
>   	if (spi->mode & SPI_CS_HIGH)
> -		bs->cs_polarity |= BIT(spi->chip_select);
> +		bs->cs_polarity |= BIT(spi_get_chipselect(spi, 0));
>   	else
> -		bs->cs_polarity &= ~BIT(spi->chip_select);
> +		bs->cs_polarity &= ~BIT(spi_get_chipselect(spi, 0));
>
>   	mutex_unlock(&bs->bus_mutex);
>
> @@ -283,7 +283,7 @@ static int bcm63xx_hsspi_transfer_one(struct
> spi_master *master,
>   	 * e. At the end restore the polarities again to their default values.
>   	 */
>
> -	dummy_cs = !spi->chip_select;
> +	dummy_cs = !spi_get_chipselect(spi, 0);
>   	bcm63xx_hsspi_set_cs(bs, dummy_cs, true);
>
>   	list_for_each_entry(t, &msg->transfers, transfer_list) {
> @@ -296,7 +296,7 @@ static int bcm63xx_hsspi_transfer_one(struct
> spi_master *master,
>   		spi_transfer_delay_exec(t);
>
>   		if (t->cs_change)
> -			bcm63xx_hsspi_set_cs(bs, spi->chip_select, false);
> +			bcm63xx_hsspi_set_cs(bs, spi_get_chipselect(spi, 0), false);
>   	}
>
>   	mutex_lock(&bs->bus_mutex);

For bcm63xx-hsspi driver,

Acked-by: William Zhang <william.zhang@broadcom.com>

--000000000000566d0305f30c1f7e
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
YDZuuBJwnyCzevMoPtVYPharioL5H3BRnQi8YoTXH7/uRo33dewYFm474yFjwwnt82TFtveVZkVq
6h4WIQ4wTcwFfET8zMkELnGzS5SHCl8sPD+lNxxJ1JDZYwIDAQABo4IB2zCCAdcwDgYDVR0PAQH/
BAQDAgWgMIGjBggrBgEFBQcBAQSBljCBkzBOBggrBgEFBQcwAoZCaHR0cDovL3NlY3VyZS5nbG9i
YWxzaWduLmNvbS9jYWNlcnQvZ3NnY2NyM3BlcnNvbmFsc2lnbjJjYTIwMjAuY3J0MEEGCCsGAQUF
BzABhjVodHRwOi8vb2NzcC5nbG9iYWxzaWduLmNvbS9nc2djY3IzcGVyc29uYWxzaWduMmNhMjAy
MDBNBgNVHSAERjBEMEIGCisGAQQBoDIBKAowNDAyBggrBgEFBQcCARYmaHR0cHM6Ly93d3cuZ2xv
YmFsc2lnbi5jb20vcmVwb3NpdG9yeS8wCQYDVR0TBAIwADBJBgNVHR8EQjBAMD6gPKA6hjhodHRw
Oi8vY3JsLmdsb2JhbHNpZ24uY29tL2dzZ2NjcjNwZXJzb25hbHNpZ24yY2EyMDIwLmNybDAlBgNV
HREEHjAcgRp3aWxsaWFtLnpoYW5nQGJyb2FkY29tLmNvbTATBgNVHSUEDDAKBggrBgEFBQcDBDAf
BgNVHSMEGDAWgBSWM9HmWBdbNHWKgVZk1b5I3qGPzzAdBgNVHQ4EFgQUq65GzwZxydFHjjYEU/9h
xHhPWlwwDQYJKoZIhvcNAQELBQADggEBAA2hGG3JPAdGPH0ZdohGUCIVjKz+U+EFuIDbS6A/5jqX
VhYAxZlzj7tSjUIM7G7IhyfqPC46GKJ/4x+Amz1Z6YxNGy71L68kYD6hIbBcA5AM42QBUufly6Oa
/ppSz3WoflVyFFQ5YXniZ+eU+2/cdnYZg4aVUnFjimOF5o3NfMLzOkhQNxbaDjFUfUYD8hKmU6v4
0vUBj8KZ9Gi1LIagLKUREn8jku0lcLsRbnJ5Ey5ScajC/FESPyYWasOW8j8/1EoJksmhbYGKNS6C
urb/KlmDGfVrIRYDbL0ckhGQIP5c6L+kSQZ2sHnQK0e0WgIaZYxaPYeY5u0GLCOze+3vyRMxggJt
MIICaQIBATBrMFsxCzAJBgNVBAYTAkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMTEwLwYD
VQQDEyhHbG9iYWxTaWduIEdDQyBSMyBQZXJzb25hbFNpZ24gMiBDQSAyMDIwAgwxuh2XG3FXRL1W
JOEwDQYJYIZIAWUDBAIBBQCggdQwLwYJKoZIhvcNAQkEMSIEIPV0GPci7PjhkOLQr5YYlwfjp9bZ
8n4Nhqy3DqNgqzROMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTIz
MDEyNTAwNTc1NFowaQYJKoZIhvcNAQkPMVwwWjALBglghkgBZQMEASowCwYJYIZIAWUDBAEWMAsG
CWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQowCwYJKoZIhvcNAQEHMAsGCWCGSAFl
AwQCATANBgkqhkiG9w0BAQEFAASCAQCDeRwW7sqpu5MnOyyvjxmJvRUbfI/L5CP1JkPtuA2BZ0WX
P6pe/eXLFP9A//7IMZwRnMYubkHF2KOwoW3nTAZfFZU1MJtjpUcUMyAey4sODSCw78wnDub+b0R4
rbtgWN26AOILOF9V7rUdA5hd4ZZZWrSVlZOxQOnkEnrrXwRMTZ6H4LILkENVRytDPX6WcNSzofVt
bTZisKrK4TQRGwagjsH1XbjDJQy3in8wE53Bemw/woVR/U5dKkgH5bIc7O+yvfRkg3Dze87oKtUn
0jlTOX7lGBKRqMHxDVl2SRBQXJ+ytWpT1WR9l3AFCBIp4QCo4isjywLpWTF5YramMP+j
--000000000000566d0305f30c1f7e--

--===============4574372307935300212==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

--===============4574372307935300212==--
