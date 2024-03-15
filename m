Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id C537787D447
	for <lists+greybus-dev@lfdr.de>; Fri, 15 Mar 2024 20:04:12 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id C601344356
	for <lists+greybus-dev@lfdr.de>; Fri, 15 Mar 2024 19:04:11 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	by lists.linaro.org (Postfix) with ESMTPS id BCEE53F368
	for <greybus-dev@lists.linaro.org>; Fri, 15 Mar 2024 19:04:05 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=mB1iePyr;
	spf=pass (lists.linaro.org: domain of broonie@kernel.org designates 139.178.84.217 as permitted sender) smtp.mailfrom=broonie@kernel.org;
	dmarc=pass (policy=none) header.from=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 54A6861779;
	Fri, 15 Mar 2024 19:04:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53E3FC433C7;
	Fri, 15 Mar 2024 19:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710529444;
	bh=XdThChpVAKQYKHp6iMa8gsxf9YJQb5s6EJHGFTjOL5o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mB1iePyrjVuTzqvELe81dQyrjFCYKGo3tJe5uOlXC3FxoJc0pNfjGGBfemOAOZo8D
	 env5gYytUuoXICkOnz2vQX+fqmQQ/nIxSPXujAckBKQtsgUnaGQadWw2XjAFA0FiLq
	 loD5u6l/HiQDT52qAxYrH86dWm8bw0h2cwkr6MCXilmuSHTB3B3JFGcUd2eJCc86Z/
	 +Hz70rWIZz0mD4bDB58ozIySoCfe5wUESLgz6dvVPJF+pbjEmbleZBDv9wCZaDZotd
	 aiN7nH21rQ/zwhGwur72QEVNmfianVgVUzSwaX38Z7vKIk/bjptlrdkOMvmKK7JhUi
	 4ZWP0B5Y+dM3g==
Date: Fri, 15 Mar 2024 19:03:57 +0000
From: Mark Brown <broonie@kernel.org>
To: Ayush Singh <ayushdevel1325@gmail.com>
Message-ID: <ba2d158c-db0f-4037-b21b-82ee25208ea7@sirena.org.uk>
References: <20240315184908.500352-1-ayushdevel1325@gmail.com>
 <20240315184908.500352-8-ayushdevel1325@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20240315184908.500352-8-ayushdevel1325@gmail.com>
X-Cookie: A well-known friend is a treasure.
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: BCEE53F368
X-Spamd-Bar: --------
X-Spamd-Result: default: False [-8.60 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,none];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:139.178.84.217];
	ASN(0.00)[asn:54825, ipnet:139.178.80.0/21, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	TAGGED_RCPT(0.00)[dt];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,beagleboard.org,kernel.org,linaro.org,ti.com,amd.com,arndb.de,linuxfoundation.org,gmail.com,lists.infradead.org,lists.linaro.org];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[kernel.org:+]
Message-ID-Hash: YQPBNZEJDP2ZT2WCY4NXS4QD2GGBNYTZ
X-Message-ID-Hash: YQPBNZEJDP2ZT2WCY4NXS4QD2GGBNYTZ
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: linux-kernel@vger.kernel.org, robertcnelson@beagleboard.org, Vaishnav M A <vaishnav@beagleboard.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, Derek Kiernan <derek.kiernan@amd.com>, Dragan Cvetic <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>, Liam Girdwood <lgirdwood@gmail.com>, Jiri Slaby <jirislaby@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org, linux-serial@vger.kernel.org, greybus-dev@lists.linaro.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v3 7/8] mikrobus: Add mikrobus driver
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/YQPBNZEJDP2ZT2WCY4NXS4QD2GGBNYTZ/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: multipart/mixed; boundary="===============6492193961373265849=="


--===============6492193961373265849==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0C9fqa+uIcpzgFeK"
Content-Disposition: inline


--0C9fqa+uIcpzgFeK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Mar 16, 2024 at 12:19:05AM +0530, Ayush Singh wrote:

> +	if (dev->regulators) {
> +		if (dev->protocol == GREYBUS_PROTOCOL_SPI) {
> +			snprintf(devname, sizeof(devname), "%s.%u", dev_name(&port->spi_ctrl->dev),
> +				 port->chip_select[dev->reg]);
> +			regulator.dev_name = kmemdup(devname, MIKROBUS_NAME_SIZE, GFP_KERNEL);
> +		} else if (dev->protocol == GREYBUS_PROTOCOL_RAW) {

It looks like you're trying to write a switch statement here...

> +		for (i = 0; i < dev->num_regulators; i++) {
> +			val = dev->regulators[i].value.u64_data;
> +			regulator.supply =
> +				kmemdup(dev->regulators[i].name, MIKROBUS_NAME_SIZE, GFP_KERNEL);
> +			dev_info(&port->dev, "adding fixed regulator %llu uv, %s for %s", *val,
> +				 regulator.supply, regulator.dev_name);
> +			regulator_register_always_on(0, dev->regulators[i].name, &regulator, 1,
> +						     *val);
> +		}

The registered regualtor is ignored here which means you leak the
regualtors every time a device is unregistered...

> +static void mikrobus_device_unregister(struct mikrobus_port *port, struct board_device_info *dev,
> +				       char *board_name)

...an operation which does seem to be supported?

--0C9fqa+uIcpzgFeK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmX0m5wACgkQJNaLcl1U
h9Dg3Af9HDcsEVs7HgxyXgcr3FK1SHc5inY3iwQz3gw6LS5jvZ4BKzqDCrmVE7+j
mS+9j46N8GAEr7mdFFr87noquoTs9wAHf41j2b9Quc9wwLHnUoafkJlpkOBLd4MG
IC8Hzbom6tCjSckTvvjBPqMN17pBKMryd8UHpMc/YknZTdpQF8YZmnix3+R8VaxW
6o/yVeHTV3i2T6tz05vATBfZvj/oWJjd6pn0I9Nr+wMTmVWAE11dHVSXNR9wRMnN
lVbkHnB0y0yMJCNEkzdj1j3zfslzHFIE+VDuJoMrP/ZbXDeYliEZMsLzqLIhmdQV
M1kWAQAUlPF8mZDFrTQanPMEBZ89cw==
=0g9k
-----END PGP SIGNATURE-----

--0C9fqa+uIcpzgFeK--

--===============6492193961373265849==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

--===============6492193961373265849==--
