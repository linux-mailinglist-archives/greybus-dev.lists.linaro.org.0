Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id D4FE487D4EC
	for <lists+greybus-dev@lfdr.de>; Fri, 15 Mar 2024 21:20:45 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id E7A4E3F387
	for <lists+greybus-dev@lfdr.de>; Fri, 15 Mar 2024 20:20:44 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	by lists.linaro.org (Postfix) with ESMTPS id 227943F387
	for <greybus-dev@lists.linaro.org>; Fri, 15 Mar 2024 20:20:37 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=armlinux.org.uk header.s=pandora-2019 header.b="D1Cuije/";
	spf=none (lists.linaro.org: domain of "linux+greybus-dev=lists.linaro.org@armlinux.org.uk" has no SPF policy when checking 78.32.30.218) smtp.mailfrom="linux+greybus-dev=lists.linaro.org@armlinux.org.uk";
	dmarc=pass (policy=none) header.from=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=iYsiZ6pFhsCSAUrF7Xqg/XRmMMh817rVgpmJKV43Zsg=; b=D1Cuije/TM/Mf0nsxWkGbeKxm4
	T2xVMtIzPPugb5wy0q6SMciM5Tz9ydTFryiaolfpkiCzXuzK/KCra+/7V7ptTOEzpNAKNl3D2L5ET
	9X6T+fjghDoAbg+2Ok67pnSUeYGXtyokfYCqvsiw58UJK6wiwGlWtwMxyiNz+Cspblk14SNFqsRGk
	DjQkZLZ0NnFdYRf5wURrufBTA4jHnQlGoQb3p8dr10k0r2D0joaa0ClQdsxX2T12WHwmBAETzE0wR
	Co6Z/1ttorFeVCQy4aMjEwmeIRZ6MiusgZHfQu9vwjRNoyZ9w0HukkRMB/KZ1uvOwYwciQvh++T69
	x1C7wgwA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:33688)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1rlE2E-0001xa-2p;
	Fri, 15 Mar 2024 20:20:10 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1rlE2C-0006f5-4Y; Fri, 15 Mar 2024 20:20:08 +0000
Date: Fri, 15 Mar 2024 20:20:08 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Message-ID: <ZfSteEmeQX5IUJnU@shell.armlinux.org.uk>
References: <20240315184908.500352-1-ayushdevel1325@gmail.com>
 <20240315184908.500352-2-ayushdevel1325@gmail.com>
 <314a88e0-19cd-4b95-9cf3-aef1c7579eec@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <314a88e0-19cd-4b95-9cf3-aef1c7579eec@linaro.org>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 227943F387
X-Spamd-Bar: -----
X-Spamd-Result: default: False [-5.90 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[armlinux.org.uk,none];
	HFILTER_FROMHOST_NORESOLVE_MX(0.50)[dead.armlinux.org.uk];
	R_DKIM_ALLOW(-0.20)[armlinux.org.uk:s=pandora-2019];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[78.32.30.218:from];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,beagleboard.org,kernel.org,linaro.org,ti.com,amd.com,arndb.de,linuxfoundation.org,lists.infradead.org,lists.linaro.org];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[greybus-dev=lists.linaro.org];
	R_SPF_NA(0.00)[no SPF record];
	DKIM_TRACE(0.00)[armlinux.org.uk:+];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:8468, ipnet:78.32.0.0/15, country:GB];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
Message-ID-Hash: TWTU4SD4WORBU2GAO64TQDAWUHNHEYTO
X-Message-ID-Hash: TWTU4SD4WORBU2GAO64TQDAWUHNHEYTO
X-MailFrom: linux+greybus-dev=lists.linaro.org@armlinux.org.uk
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Ayush Singh <ayushdevel1325@gmail.com>, linux-kernel@vger.kernel.org, robertcnelson@beagleboard.org, Vaishnav M A <vaishnav@beagleboard.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, Derek Kiernan <derek.kiernan@amd.com>, Dragan Cvetic <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jiri Slaby <jirislaby@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org, linux-serial@vger.kernel.org, greybus-dev@lists.linaro.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v3 1/8] dt-bindings: misc: Add mikrobus-connector
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/TWTU4SD4WORBU2GAO64TQDAWUHNHEYTO/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Mar 15, 2024 at 09:09:11PM +0100, Krzysztof Kozlowski wrote:
> > +properties:
> > +  compatible:
> > +    const: mikrobus-connector
> 
> Hm, why do you create binding for the connector, not for some sort of
> controller? Please provide some rationale for this in commit msg.

I think you have a distorted view. I refer you to the Mikroe mikroBUS
specification - it's _just_ a connector which provides a fairly
standardised purpose for each pin and the electrical specifications.
For example of the pins: power, UART, SPIs, I2C, PWM, and analogue
pins.

> > +  pinctrl-names:
> > +    items:
> > +      - const: default
> > +      - const: pwm_default
> > +      - const: pwm_gpio
> > +      - const: uart_default
> > +      - const: uart_gpio
> > +      - const: i2c_default
> > +      - const: i2c_gpio
> > +      - const: spi_default
> > +      - const: spi_gpio
> 
> I fail to see why such choice is related to the connector itself.

This isn't a choice at all. Here's the list of pins:

Analog - AN
Reset - RST
SPI Chip Select - CS
SPI Clock - SCK
SPI Master Input Slave Output - MISO
SPI Master Output Slave Input - MOSI
VCC-3.3V power - +3.3V
Reference Ground - GND
PWM - PWM output
INT - Hardware Interrupt
RX - UART Receive
TX - UART Transmit
SCL - I2C Clock
SDA - I2C Data
+5V - VCC-5V power
GND - Reference Ground

Any data pin can be a GPIO if e.g. a relay board is plugged in, even
if some of the other pins are used for e.g. UART purposes. For example,
a GPS board that provides the GPS data over the UART pins, and the
PPS signal through a different pin.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
