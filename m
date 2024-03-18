Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id D5E8B87EFB8
	for <lists+greybus-dev@lfdr.de>; Mon, 18 Mar 2024 19:29:04 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id E472743C39
	for <lists+greybus-dev@lfdr.de>; Mon, 18 Mar 2024 18:29:03 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	by lists.linaro.org (Postfix) with ESMTPS id DB3C13F387
	for <greybus-dev@lists.linaro.org>; Mon, 18 Mar 2024 12:22:50 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=Ln+WCaVd;
	dmarc=pass (policy=none) header.from=kernel.org;
	spf=pass (lists.linaro.org: domain of mwalle@kernel.org designates 145.40.73.55 as permitted sender) smtp.mailfrom=mwalle@kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 4E9B7CE0A3C;
	Mon, 18 Mar 2024 12:22:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D97ADC433F1;
	Mon, 18 Mar 2024 12:22:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710764567;
	bh=un1g+YfgVkYFs27YaapA86lET7/7qDXX/87foF3/4jQ=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To:From;
	b=Ln+WCaVdNRqXaJFEuNS5IoXa4rRybNMBmx+LnPLdoJtQJ4xqmpdcYJHtwq71mfprs
	 KdfRAPkcJDqETrkrxAeuexH4AwM/KC+fDT4tFJ1PjqK4U2H4DBxZ0uiqMMz0W8msIY
	 whR+8woYzhVQN24/90IGy2hWtUoWfHD+lN1hRiS84pO/zXHG1d3QVM9RfiXDkCY+hZ
	 pAPYFgNtweCNjG9uMaWNln7uobtZUG2Ul3pwmZdrbwpXYUnD77+NqPzfCKDPzwH+XJ
	 W6aQtPsJsnE2ii5mWbSlzK8eyDf1uj35iYzKLnJ8ZF4jsax2P7EOMNCfCIcwGtVwOr
	 5ETGK47CYH+pA==
Date: Mon, 18 Mar 2024 13:22:39 +0100
Message-Id: <CZWVF90JJO98.2M7ARQ9WMGC94@kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Ayush Singh" <ayushdevel1325@gmail.com>, "open list"
 <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.16.0
References: <20240317193714.403132-1-ayushdevel1325@gmail.com>
 <20240317193714.403132-2-ayushdevel1325@gmail.com>
In-Reply-To: <20240317193714.403132-2-ayushdevel1325@gmail.com>
X-Rspamd-Queue-Id: DB3C13F387
X-Spamd-Bar: ------
X-Spamd-Result: default: False [-6.58 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-2.98)[99.93%];
	SIGNED_PGP(-2.00)[];
	MISSING_MIME_VERSION(2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,none];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:145.40.73.55];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	RCVD_COUNT_TWO(0.00)[2];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:54825, ipnet:145.40.73.0/24, country:US];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	TAGGED_RCPT(0.00)[dt];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-MailFrom: mwalle@kernel.org
X-Mailman-Rule-Hits: implicit-dest
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
Message-ID-Hash: 6CFBC5O63H2CDGUADOIMY72PJN5UP6DC
X-Message-ID-Hash: 6CFBC5O63H2CDGUADOIMY72PJN5UP6DC
X-Mailman-Approved-At: Mon, 18 Mar 2024 18:28:57 +0000
CC: robertcnelson@beagleboard.org, lorforlinux@beagleboard.org, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, Derek Kiernan <derek.kiernan@amd.com>, Dragan Cvetic <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>, Vaishnav M A <vaishnav.a@ti.com>, Mark Brown <broonie@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated list:ARM/TEXAS INSTRUMENTS K3 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "open list:SPI SUBSYSTEM" <linux-spi@vger.kernel.org>, "moderated list:GREYBUS SUBSYSTEM" <greybus-dev@lists.linaro.org>, Vaishnav M A <vaishnav@beagleboard.org>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v4 1/5] dt-bindings: misc: Add mikrobus-connector
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/6CFBC5O63H2CDGUADOIMY72PJN5UP6DC/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: multipart/mixed; boundary="===============0859371561387472243=="

--===============0859371561387472243==
Content-Type: multipart/signed;
 boundary=5b1cdbb2bfff3981f7fa73881728b1e490b4ec8b8dbb9cc9a77399e55bd9;
 micalg=pgp-sha256; protocol="application/pgp-signature"

--5b1cdbb2bfff3981f7fa73881728b1e490b4ec8b8dbb9cc9a77399e55bd9
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Sun Mar 17, 2024 at 8:37 PM CET, Ayush Singh wrote:
> Add DT bindings for mikroBUS interface. MikroBUS is an open standard
> developed by MikroElektronika for connecting add-on boards to
> microcontrollers or microprocessors.
>
> mikroBUS is a connector and does not have a controller. Instead the
> software is responsible for identification of board and setting up /
> registering uart, spi, i2c, pwm and other buses. Thus it needs a way to
> get uart, spi, i2c, pwm and gpio controllers / adapters.
>
> A mikroBUS addon board is free to leave some of the pins unused which
> are marked as NC or Not Connected.
>
> Some of the pins might need to be configured as GPIOs deviating from thei=
r
> reserved purposes Eg: SHT15 Click where the SCL and SDA Pins need to be
> configured as GPIOs for the driver (drivers/hwmon/sht15.c) to work.
>
> For some add-on boards the driver may not take care of some additional
> signals like reset/wake-up/other. Eg: ENC28J60 click where the reset line
> (RST pin on the mikrobus port) needs to be pulled high.
>
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
>
> Additionally, some new mikroBUS boards contain 1-wire EEPROM that contain=
s
> a manifest to describe the addon board to provide plug and play
> capabilities.
>
> Link: https://www.mikroe.com/mikrobus
> Link:
> https://download.mikroe.com/documents/standards/mikrobus/mikrobus-standar=
d-specification-v200.pdf
> mikroBUS specification
> Link: https://www.mikroe.com/sht1x-click SHT15 Click
> Link: https://www.mikroe.com/eth-click ENC28J60 Click
> Link: https://www.mikroe.com/clickid ClickID
>
> Co-developed-by: Vaishnav M A <vaishnav@beagleboard.org>
> Signed-off-by: Vaishnav M A <vaishnav@beagleboard.org>
> Signed-off-by: Ayush Singh <ayushdevel1325@gmail.com>
> ---
>  .../connector/mikrobus-connector.yaml         | 113 ++++++++++++++++++

See also
https://lore.kernel.org/r/YmFo+EntwxIsco%2Ft@robh.at.kernel.org/

Looks like this proposal doesn't have the subnodes. How do you
attach a kernel driver to it's spi port for example? Only through
the manifest files?

-michael

--5b1cdbb2bfff3981f7fa73881728b1e490b4ec8b8dbb9cc9a77399e55bd9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iIgEABYIADAWIQQCnWSOYTtih6UXaxvNyh2jtWxG+wUCZfgyDxIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQzcodo7VsRvumDQD8CZkXa8J8MUqzwei97TL1VRyNWj2W9lIy
UvuoJENGh0oBAJxlj4QiS6iQAYFIzlfq+qxOHyAaZxYmbMrXfMzOEV0C
=Uh8v
-----END PGP SIGNATURE-----

--5b1cdbb2bfff3981f7fa73881728b1e490b4ec8b8dbb9cc9a77399e55bd9--

--===============0859371561387472243==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

--===============0859371561387472243==--
