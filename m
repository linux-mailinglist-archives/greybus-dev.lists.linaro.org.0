Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 516ED8856A0
	for <lists+greybus-dev@lfdr.de>; Thu, 21 Mar 2024 10:38:30 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 2614240C68
	for <lists+greybus-dev@lfdr.de>; Thu, 21 Mar 2024 09:38:28 +0000 (UTC)
Received: from mail.3ffe.de (0001.3ffe.de [159.69.201.130])
	by lists.linaro.org (Postfix) with ESMTPS id EBA623F3D7
	for <greybus-dev@lists.linaro.org>; Thu, 21 Mar 2024 09:38:25 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=none;
	dmarc=fail reason="SPF not aligned (relaxed), No valid DKIM" header.from=kernel.org (policy=none);
	spf=pass (lists.linaro.org: domain of michael@walle.cc designates 159.69.201.130 as permitted sender) smtp.mailfrom=michael@walle.cc
Received: from localhost (unknown [IPv6:2a02:810b:4340:6430:4685:ff:fe12:5967])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id CA427959;
	Thu, 21 Mar 2024 10:38:23 +0100 (CET)
Mime-Version: 1.0
Date: Thu, 21 Mar 2024 10:38:23 +0100
Message-Id: <CZZBT3ZMDCVI.40UX5MB6LY4I@kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Vaishnav Achath" <vaishnav.a@ti.com>, "Andrew Lunn" <andrew@lunn.ch>
X-Mailer: aerc 0.16.0
References: <20240317193714.403132-1-ayushdevel1325@gmail.com>
 <20240317193714.403132-2-ayushdevel1325@gmail.com>
 <CZWVF90JJO98.2M7ARQ9WMGC94@kernel.org>
 <d4dc4d94-d323-4158-8c08-b7d37d8750d3@gmail.com>
 <b62915ca-c151-4e37-bb03-c92c569c84ff@lunn.ch>
 <4b319264-bff7-48e5-85e8-201ca0bafec6@ti.com>
 <4c299d42-84c7-46fc-952f-292cef1bb4b4@lunn.ch>
 <ded6c350-4c70-4a26-8b18-6605dcc6e084@ti.com>
In-Reply-To: <ded6c350-4c70-4a26-8b18-6605dcc6e084@ti.com>
X-Rspamd-Queue-Id: EBA623F3D7
X-Spamd-Bar: ----
X-Spamd-Result: default: False [-4.80 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	MV_CASE(0.50)[];
	FORGED_SENDER(0.30)[mwalle@kernel.org,michael@walle.cc];
	R_SPF_ALLOW(-0.20)[+mx];
	DMARC_POLICY_SOFTFAIL(0.10)[kernel.org : SPF not aligned (relaxed), No valid DKIM,none];
	ONCE_RECEIVED(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:24940, ipnet:159.69.0.0/16, country:DE];
	RCPT_COUNT_TWELVE(0.00)[26];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_ONE(0.00)[1];
	TAGGED_RCPT(0.00)[dt];
	NEURAL_SPAM(0.00)[0.371];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[armlinux.org.uk,gmail.com,vger.kernel.org,beagleboard.org,kernel.org,linaro.org,ti.com,amd.com,arndb.de,linuxfoundation.org,lists.infradead.org,lists.linaro.org];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	R_DKIM_NA(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mwalle@kernel.org,michael@walle.cc];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: 3MKV37ZNXYGX6TPA5MI4QHZNGZJVUZ4L
X-Message-ID-Hash: 3MKV37ZNXYGX6TPA5MI4QHZNGZJVUZ4L
X-MailFrom: michael@walle.cc
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: "Russell King (Oracle)" <linux@armlinux.org.uk>, Ayush Singh <ayushdevel1325@gmail.com>, open list <linux-kernel@vger.kernel.org>, robertcnelson@beagleboard.org, lorforlinux@beagleboard.org, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, Derek Kiernan <derek.kiernan@amd.com>, Dragan Cvetic <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated list:ARM/TEXAS INSTRUMENTS K3 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "open list:SPI SUBSYSTEM" <linux-spi@vger.kernel.org>, "moderated list:GREYBUS SUBSYSTEM" <greybus-dev@lists.linaro.org>, Vaishnav M A <vaishnav@beagleboard.org>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v4 1/5] dt-bindings: misc: Add mikrobus-connector
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/3MKV37ZNXYGX6TPA5MI4QHZNGZJVUZ4L/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

> > Is that because the current software support is too limited? Are there
> > manufactures who want to create more complex designed, but are limited
> > by what can be described in the manifest?
> > 
>
> most mikroBUS add-on boards in production lies in the category of 
> sensors, displays, connectivity, mixed signal (ADC/DAC .etc) and if you 
> look at the existing bindings under bindings/iio/ , most devices need 
> only simple descriptions and the properties are mainly standard bus 
> properties (SPI/I2C properties), IRQ, named-gpios, named properties, 
> regulators, clocks the extension to manifest was made taking this into 
> account and the named property description interface just maps the 
> manifest entries to the unified device property interface under 
> include/linux/property.h

How will the ethernet boards ([1], [2]) work? Where do they get
their MAC address from, for example. The DT has some nice properties
for that, but I doubt that will be possible with the manifest files.
I've looked at the manifest file for the w5500 board [3] and to me
it looks like that board will come up with a random MAC address on
each start. Thus, even today, you have some boards which require
a more complex description.

Apart from the discussion whether the manifest is a suitable or
sufficient mechanism to describe the hardware, I think the main
problem with the proposed binding, is that it doesn't follow the
binding Rob was proposing for a socket. If I want to use DT
overlays, how would you describe an add-on board?

The proposal was that the base board has something like

mikrobus: socket {
	compatible = "mikrobus-socket";
	i2c-parent = <&i2c0>;
	spi-parent = <&spi0>;

	i2c {};
	spi {};
};

an add-on board can then have a DT snippet/overlay like the
following:

&mikrobus {
	i2c {
		eeprom@52: {
			reg = <52>;
			compatible = <atmel,at24..>;
		}
	};

	spi {
		sensor@0: {
			reg = <0>;
			compatible = <foobar>;
		};
	};
};

That should be possible with a binding for the mikrobus, which
in fact it is just a pin header with a standard pinout. Also as
Russell pointed out in v3, the EEPROM/manifest is not part of the
mikrobus standard. So maybe that deserves an own compatible, like

   compatible = "mikroe,click", "mikrobus-socket";

Or maybe click-eeprom? Although click seems to be the brand name of
MikroElektronika.

-michael

[1] https://www.mikroe.com/eth-3-click
[2] https://www.mikroe.com/eth-wiz-click
[3] https://github.com/MikroElektronika/click_id/blob/main/manifests/ETH-WIZ-CLICK.mnfs
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
