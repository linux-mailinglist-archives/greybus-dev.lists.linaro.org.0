Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 2250E881769
	for <lists+greybus-dev@lfdr.de>; Wed, 20 Mar 2024 19:44:35 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 1193640F2C
	for <lists+greybus-dev@lfdr.de>; Wed, 20 Mar 2024 18:44:34 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	by lists.linaro.org (Postfix) with ESMTPS id F016D3F3D7
	for <greybus-dev@lists.linaro.org>; Wed, 20 Mar 2024 18:44:30 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=lunn.ch header.s=20171124 header.b=J+vujSF5;
	dmarc=pass (policy=none) header.from=lunn.ch;
	spf=pass (lists.linaro.org: domain of andrew@lunn.ch designates 156.67.10.101 as permitted sender) smtp.mailfrom=andrew@lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=fEgErpl+wLpV80SuRfPGE67eSPI0zTuNiDl4KjehtmY=; b=J+vujSF5pSb6RzVvu6NEt28gQM
	wgIlw3qz/q/rm1P4Ngknf+9+CCm5jw7vboMtODYv7u9v0R/rD7vTnQNosUl/u8sQwTRQaEe8ZWV+D
	XNYDL39sv97jA6+xLw2WaXD5qhG5gUKyXwCt9IBs+tEgazof4DBoeQzTzjh/hLdcSWwE=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1rn0v4-00AoEN-42; Wed, 20 Mar 2024 19:44:10 +0100
Date: Wed, 20 Mar 2024 19:44:10 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Ayush Singh <ayushdevel1325@gmail.com>
Message-ID: <c368ee3b-1b80-46b1-9aa7-b7fc0094e3a1@lunn.ch>
References: <c8031e17-5ae8-4794-8b8c-1736be6452d3@gmail.com>
 <CZXMK3W52AFO.1APK080GVJESK@kernel.org>
 <5a9b1cd9-05ec-4606-92b6-eadbc7af6202@gmail.com>
 <CZXPQZY8PUGE.QZM8XSOUNMT4@kernel.org>
 <81ec4156-8758-406e-876b-5acf13951d09@gmail.com>
 <CZXSKOLK6S1S.N86E2AZG2V90@kernel.org>
 <2eec6437-dd11-408d-9bcb-92ba2bee4487@ti.com>
 <28c995cb-1660-435f-9ee4-1195439231f0@gmail.com>
 <f53cd006-5eb0-47f2-8f84-e7915154f12d@lunn.ch>
 <c3223f90-6e7c-4fdc-905a-770c474445e2@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c3223f90-6e7c-4fdc-905a-770c474445e2@gmail.com>
X-Rspamd-Queue-Id: F016D3F3D7
X-Spamd-Bar: ------
X-Spamd-Result: default: False [-6.40 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[lunn.ch,none];
	R_SPF_ALLOW(-0.20)[+mx];
	R_DKIM_ALLOW(-0.20)[lunn.ch:s=20171124];
	MIME_GOOD(-0.10)[text/plain];
	ONCE_RECEIVED(0.10)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:58222, ipnet:156.67.8.0/22, country:CH];
	RCVD_COUNT_ONE(0.00)[1];
	FREEMAIL_TO(0.00)[gmail.com];
	MISSING_XM_UA(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[dt];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[lunn.ch:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: CNMVEJFK4IOSZL5SOVJGSQ5GON7WPWRL
X-Message-ID-Hash: CNMVEJFK4IOSZL5SOVJGSQ5GON7WPWRL
X-MailFrom: andrew@lunn.ch
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Vaishnav Achath <vaishnav.a@ti.com>, Michael Walle <mwalle@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, open list <linux-kernel@vger.kernel.org>, robertcnelson@beagleboard.org, lorforlinux@beagleboard.org, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, Derek Kiernan <derek.kiernan@amd.com>, Dragan Cvetic <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated list:ARM/TEXAS INSTRUMENTS K3 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "open list:SPI SUBSYSTEM" <linux-spi@vger.kernel.org>, "moderated list:GREYBUS SUBSYSTEM" <greybus-dev@lists.linaro.org>, Vaishnav M A <vaishnav@beagl
 eboard.org>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v4 1/5] dt-bindings: misc: Add mikrobus-connector
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/CNMVEJFK4IOSZL5SOVJGSQ5GON7WPWRL/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Mar 20, 2024 at 10:09:05PM +0530, Ayush Singh wrote:
> On 3/20/24 01:02, Andrew Lunn wrote:
> 
> > > Yes, after discussion with Vaishnav and trying to brainstorm some way to do
> > > the same thing with dt overlays, it seems that trying to use dt overlays
> > > will mean need to have completely separate implementation of mikroBUS for
> > > local ports and mikroBUS over greybus.
> > Could you explain why please?
> > 
> > Are greybus I2C bus masters different from physical I2C bus masters?
> > Are greybus SPI bus masters different from physical SPI bus masters?
> 
> Well, they are virtual, so they are not declared in the device tree. I have
> linked the greybus i2c implementation. It basically allocates an i2c_adpater
> and then adds it using `i2c_add_adapter` method. This adapter can then be
> passed to say mikroBUS driver where it can be used as a normal i2c_adapter,
> and we can register the device to it.

Being virtual does not really stop it being added to the DT.

I'm making this all up, but i assume it will look something like this:

greybus@42 {
        compatible = "acme,greybus";
        reg = <0x42 0x100>;

This would represent the greybus host controller.

	module@0 {
		 reg = <0>;

This would represent a module discovered on the bus. I assume there is
some sort of addressing? The greybus core code dynamically creates the
node in DT to describe the modules it has discovered. This is not too
different to USB. You can already describe USB devices in DT, but the
assumption is you know they exists, e.g. because they are hard wired,
not hot-plugable. The USB core will associate the USB device with the
node in DT. But actually creating a node in DT is not too big a jump.

		interface@0 {
     			compatible = "greybus,i2c";
			reg = <0>;
		}
		interface@1 {
     			compatible = "greybus,spi";
			reg = <1>;
		}
		interface@10 {
     			compatible = "greybus,gpio";
			reg = <10>;
		}

It can then enumerate the interfaces on the module, and create the I2C
node, SPI bus node, the gpio controller etc. Again, the greybus core
can add nodes to DT to described the discovered hardware, and
associate them to the linux devices which are created.

That gives you what you need to load a DT overlay to make use of these
devices. That overlay would contain one of your virtual mikroBUS
controllers. This virtual controller is basically a phandle-proxy. The
virtual mikroBUS controllers is a consumer of phandles to an I2C bus,
an SPI bus, GPIO bus which makes up the pins routed to the mikroBUS
connector. The virtual mikroBUS controllers is also a provider of an
I2C bus, an SPI bus, GPIO controller. The mikroBUS device consumes
these I2C bus, SPI bus etc. The virtual mikroBUS controllers makes it
simpler for the device to find the resources it needs, since they are
all in one place. For a physical mikroBUS you have a DT node with
phandles to the physical devices. For greybus you create a virtual
device with phandles to the virtual devices added to the DT bus.

You then have everything you need to describe the mikroBUS
devices. For very simple devices you convert the manifest to a DT
overlay and load it. For complex devices you directly use a DT
overlay.

I also don't see any need to do the manifest to DT overlay conversion
on the fly. You have a database of manifests. They could be converted
to DT and then added to the linux-firmware repo, for example. If
device with an unknown manifest is found, it should be possible to
read the manifest in userspace via its eeprom in /sys/class/. An tool
could create DT blob and add it to /lib/firmware to get it working
locally, and provide suggestions how to contribute it to the linux
firmware project?

   Andrew
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
