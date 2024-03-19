Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id E8C8B880585
	for <lists+greybus-dev@lfdr.de>; Tue, 19 Mar 2024 20:38:04 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id E76AF40E13
	for <lists+greybus-dev@lfdr.de>; Tue, 19 Mar 2024 19:38:03 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	by lists.linaro.org (Postfix) with ESMTPS id 91CC03F326
	for <greybus-dev@lists.linaro.org>; Tue, 19 Mar 2024 19:38:00 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=p6j86hOI;
	dmarc=pass (policy=none) header.from=kernel.org;
	spf=pass (lists.linaro.org: domain of conor@kernel.org designates 145.40.73.55 as permitted sender) smtp.mailfrom=conor@kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id A4AD9CE0E7C;
	Tue, 19 Mar 2024 19:37:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BC67C433C7;
	Tue, 19 Mar 2024 19:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710877075;
	bh=BF4CDuK9QPoSPXKTFf0+VPHSKTN403RWHUnsbnBFAxw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p6j86hOII7uf85XVmvsdu1Z2RnVR0L9fayo9YvnpzjwgeeQb7g/T90myaZH7jnI1m
	 a8yyOlZ+Zskrj/gN+q9uQz66P5T4NA0Nk4ZUEdTern5WdBV1GSoxuWBbeH2Tkj0tEK
	 db3BgrpQLdQb4GDu8CbjPyY780rTlC+ezIc0iEGnnWwPvHKvpMjvifnLM3C0OZQ8Wn
	 QnkiaYxXRiVXrrG+0fpnlmkTyfoZdudGFn9w6ioxdSh0Hod4R/Kt12KsDyOjOKjKd5
	 /4Hl1a3H/8+8m16VHTTqaAv85eT/pVUvb/VAeQg1t6+E7H2tURtO1S2YvC8oz8h58U
	 FNh9r7/hjEgag==
Date: Tue, 19 Mar 2024 19:37:49 +0000
From: Conor Dooley <conor@kernel.org>
To: Ayush Singh <ayushdevel1325@gmail.com>
Message-ID: <20240319-quarters-eskimo-be8e7db01438@spud>
References: <20240317193714.403132-1-ayushdevel1325@gmail.com>
 <20240317193714.403132-2-ayushdevel1325@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20240317193714.403132-2-ayushdevel1325@gmail.com>
X-Rspamd-Queue-Id: 91CC03F326
X-Spamd-Bar: ----
X-Spamd-Result: default: False [-4.10 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:145.40.73.55];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	ARC_NA(0.00)[];
	ASN(0.00)[asn:54825, ipnet:145.40.73.0/24, country:US];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCPT_COUNT_TWELVE(0.00)[24];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TAGGED_RCPT(0.00)[dt];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: DUVXCSCUCN5ZF7TNSPOAMKUJDKVEHPEG
X-Message-ID-Hash: DUVXCSCUCN5ZF7TNSPOAMKUJDKVEHPEG
X-MailFrom: conor@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: open list <linux-kernel@vger.kernel.org>, robertcnelson@beagleboard.org, lorforlinux@beagleboard.org, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, Derek Kiernan <derek.kiernan@amd.com>, Dragan Cvetic <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>, Vaishnav M A <vaishnav.a@ti.com>, Mark Brown <broonie@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated list:ARM/TEXAS INSTRUMENTS K3 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "open list:SPI SUBSYSTEM" <linux-spi@vger.kernel.org>, "moderated list:GREYBUS SUBSYSTEM" <greybus-dev@lists.linaro.org>, Vaishnav M A <vaishnav@beagleboard.org>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v4 1/5] dt-bindings: misc: Add mikrobus-connector
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/DUVXCSCUCN5ZF7TNSPOAMKUJDKVEHPEG/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: multipart/mixed; boundary="===============2020386793886685691=="


--===============2020386793886685691==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="K05xHvEr6Oot9xht"
Content-Disposition: inline


--K05xHvEr6Oot9xht
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 18, 2024 at 01:07:09AM +0530, Ayush Singh wrote:
> Add DT bindings for mikroBUS interface. MikroBUS is an open standard
> developed by MikroElektronika for connecting add-on boards to
> microcontrollers or microprocessors.
>=20
> mikroBUS is a connector and does not have a controller. Instead the
> software is responsible for identification of board and setting up /
> registering uart, spi, i2c, pwm and other buses. Thus it needs a way to
> get uart, spi, i2c, pwm and gpio controllers / adapters.
>=20
> A mikroBUS addon board is free to leave some of the pins unused which
> are marked as NC or Not Connected.

But your binding makes everything required. Why would I need to
instantiate and connect an i2c controller to the mikroebus header if
I don't intend connecting any mikroebus devices that need one?

> Some of the pins might need to be configured as GPIOs deviating from their
> reserved purposes Eg: SHT15 Click where the SCL and SDA Pins need to be
> configured as GPIOs for the driver (drivers/hwmon/sht15.c) to work.

> For some add-on boards the driver may not take care of some additional
> signals like reset/wake-up/other. Eg: ENC28J60 click where the reset line
> (RST pin on the mikrobus port) needs to be pulled high.

What drivers do is not relevant to the binding. Describe the hardware.

> Here's the list of pins in mikroBUS connector:
> Analog - AN
> Reset - RST
> SPI Chip Select - CS
> SPI Clock - SCK
> SPI Master Input Slave Output - MISO
> SPI Master Output Slave Input - MOSI
> VCC-3.3V power - +3.3V
> Reference Ground - GND
> PWM - PWM output
> INT - Hardware Interrupt
> RX - UART Receive
> TX - UART Transmit
> SCL - I2C Clock
> SDA - I2C Data
> +5V - VCC-5V power
> GND - Reference Ground
>=20
> Additionally, some new mikroBUS boards contain 1-wire EEPROM that contains
> a manifest to describe the addon board to provide plug and play
> capabilities.

My problem with this is that it purports to be some generic description
of the connector but it appears to be very centred on a particular use
case (this beagle product) with simple add-on boards or those that
support the auto-detection eeprom. For other use cases I'm at a loss for
why I'd not omit this node from my DT and treat the mikroebus connector
like any other header on my boards, where I just apply an overlay that
hooks up the device to the relevant spi/pwm/i2c/etc controllers.

I'd almost go as far as to say that this binding is misleading, because
it's worded like a complete description of the port but actually only
seems to describe a (set of) use case(s). What am I missing?

> Link: https://www.mikroe.com/mikrobus
> Link:
> https://download.mikroe.com/documents/standards/mikrobus/mikrobus-standar=
d-specification-v200.pdf
> mikroBUS specification
> Link: https://www.mikroe.com/sht1x-click SHT15 Click
> Link: https://www.mikroe.com/eth-click ENC28J60 Click
> Link: https://www.mikroe.com/clickid ClickID
>=20
> Co-developed-by: Vaishnav M A <vaishnav@beagleboard.org>
> Signed-off-by: Vaishnav M A <vaishnav@beagleboard.org>
> Signed-off-by: Ayush Singh <ayushdevel1325@gmail.com>

> +required:
> +  - compatible
> +  - pinctrl-0
> +  - pinctrl-1
> +  - pinctrl-2
> +  - pinctrl-3
> +  - pinctrl-4
> +  - pinctrl-5
> +  - pinctrl-6
> +  - pinctrl-7
> +  - pinctrl-8
> +  - i2c-adapter
> +  - spi-controller
> +  - spi-cs
> +  - uart
> +  - pwms
> +  - mikrobus-gpios

Oh also, you're missing properties for the supplies.

--K05xHvEr6Oot9xht
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZfnpjQAKCRB4tDGHoIJi
0s0WAP4sxMj7iEDAzcYFuI2/TAZhf+4wpnV6zkAEPu/GrABU6QD+IzPHBYa013DG
+wV/fVKKJxKX1uzafwvK4rmAAt5pUgI=
=CeYU
-----END PGP SIGNATURE-----

--K05xHvEr6Oot9xht--

--===============2020386793886685691==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

--===============2020386793886685691==--
