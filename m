Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id A61FF885920
	for <lists+greybus-dev@lfdr.de>; Thu, 21 Mar 2024 13:31:54 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 92E3140C65
	for <lists+greybus-dev@lfdr.de>; Thu, 21 Mar 2024 12:31:53 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	by lists.linaro.org (Postfix) with ESMTPS id E010140B68
	for <greybus-dev@lists.linaro.org>; Thu, 21 Mar 2024 12:31:50 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=lunn.ch header.s=20171124 header.b=6Z0m1mDP;
	dmarc=pass (policy=none) header.from=lunn.ch;
	spf=pass (lists.linaro.org: domain of andrew@lunn.ch designates 156.67.10.101 as permitted sender) smtp.mailfrom=andrew@lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=7eF1fjFD8b1hoXdzkySVAu3zItwsB5Bim4j2q9JOIDA=; b=6Z0m1mDPyyueTqLxdWS6gUk+ES
	GTFeLVPKsY53YKsups+CmRMQakV68UDGufeLz0mUTEZe50FkEJN0bBfQFdnGqd79CeQ5qVeI4e2JA
	5rTjemYUk8noCTKti5XyMyP3wqFbjolD/BeBExKlafFONOx9APw/WNQKzULor7NJvWpg=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1rnHa1-00AsBh-67; Thu, 21 Mar 2024 13:31:33 +0100
Date: Thu, 21 Mar 2024 13:31:33 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Vaishnav Achath <vaishnav.a@ti.com>
Message-ID: <c63257c4-39f0-49b5-b5b7-0204d3462579@lunn.ch>
References: <5a9b1cd9-05ec-4606-92b6-eadbc7af6202@gmail.com>
 <CZXPQZY8PUGE.QZM8XSOUNMT4@kernel.org>
 <81ec4156-8758-406e-876b-5acf13951d09@gmail.com>
 <CZXSKOLK6S1S.N86E2AZG2V90@kernel.org>
 <2eec6437-dd11-408d-9bcb-92ba2bee4487@ti.com>
 <28c995cb-1660-435f-9ee4-1195439231f0@gmail.com>
 <f53cd006-5eb0-47f2-8f84-e7915154f12d@lunn.ch>
 <c3223f90-6e7c-4fdc-905a-770c474445e2@gmail.com>
 <c368ee3b-1b80-46b1-9aa7-b7fc0094e3a1@lunn.ch>
 <9ea69bd3-977d-442e-aacc-3c819b1a5630@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9ea69bd3-977d-442e-aacc-3c819b1a5630@ti.com>
X-Rspamd-Queue-Id: E010140B68
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
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:58222, ipnet:156.67.8.0/22, country:CH];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	RCVD_COUNT_ONE(0.00)[1];
	MID_RHS_MATCH_FROM(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,linaro.org,vger.kernel.org,beagleboard.org,ti.com,amd.com,arndb.de,linuxfoundation.org,lists.infradead.org,lists.linaro.org];
	TAGGED_RCPT(0.00)[dt];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[lunn.ch:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: FLQHFQENP3GGP7UGFRURUDRYITMPC732
X-Message-ID-Hash: FLQHFQENP3GGP7UGFRURUDRYITMPC732
X-MailFrom: andrew@lunn.ch
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Ayush Singh <ayushdevel1325@gmail.com>, Michael Walle <mwalle@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, open list <linux-kernel@vger.kernel.org>, robertcnelson@beagleboard.org, lorforlinux@beagleboard.org, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, Derek Kiernan <derek.kiernan@amd.com>, Dragan Cvetic <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated list:ARM/TEXAS INSTRUMENTS K3 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "open list:SPI SUBSYSTEM" <linux-spi@vger.kernel.org>, "moderated list:GREYBUS SUBSYSTEM" <greybus-dev@lists.linaro.org>, Vaishnav M A <vaishnav@be
 agleboard.org>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v4 1/5] dt-bindings: misc: Add mikrobus-connector
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/FLQHFQENP3GGP7UGFRURUDRYITMPC732/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Mar 21, 2024 at 01:05:14PM +0530, Vaishnav Achath wrote:
> Hi Andrew,
> 
> On 21/03/24 00:14, Andrew Lunn wrote:
> > On Wed, Mar 20, 2024 at 10:09:05PM +0530, Ayush Singh wrote:
> > > On 3/20/24 01:02, Andrew Lunn wrote:
> > > 
> > > > > Yes, after discussion with Vaishnav and trying to brainstorm some way to do
> > > > > the same thing with dt overlays, it seems that trying to use dt overlays
> > > > > will mean need to have completely separate implementation of mikroBUS for
> > > > > local ports and mikroBUS over greybus.
> > > > Could you explain why please?
> > > > 
> > > > Are greybus I2C bus masters different from physical I2C bus masters?
> > > > Are greybus SPI bus masters different from physical SPI bus masters?
> > > 
> > > Well, they are virtual, so they are not declared in the device tree. I have
> > > linked the greybus i2c implementation. It basically allocates an i2c_adpater
> > > and then adds it using `i2c_add_adapter` method. This adapter can then be
> > > passed to say mikroBUS driver where it can be used as a normal i2c_adapter,
> > > and we can register the device to it.
> > 
> > Being virtual does not really stop it being added to the DT.
> > 
> > I'm making this all up, but i assume it will look something like this:
> > 
> > greybus@42 {
> >          compatible = "acme,greybus";
> >          reg = <0x42 0x100>;
> > 
> > This would represent the greybus host controller.
> > 
> > 	module@0 {
> > 		 reg = <0>;
> > 
> > This would represent a module discovered on the bus. I assume there is
> > some sort of addressing? The greybus core code dynamically creates the
> > node in DT to describe the modules it has discovered. This is not too
> > different to USB. You can already describe USB devices in DT, but the
> > assumption is you know they exists, e.g. because they are hard wired,
> > not hot-plugable. The USB core will associate the USB device with the
> > node in DT. But actually creating a node in DT is not too big a jump.
> > 
> > 		interface@0 {
> >       			compatible = "greybus,i2c";
> > 			reg = <0>;
> > 		}
> > 		interface@1 {
> >       			compatible = "greybus,spi";
> > 			reg = <1>;
> > 		}
> > 		interface@10 {
> >       			compatible = "greybus,gpio";
> > 			reg = <10>;
> > 		}
> > 
> > It can then enumerate the interfaces on the module, and create the I2C
> > node, SPI bus node, the gpio controller etc. Again, the greybus core
> > can add nodes to DT to described the discovered hardware, and
> > associate them to the linux devices which are created.
> > 
> 
> This proposal looks great and would be the ideal solution, but we met with
> few challenges when initially trying to implement something like this and
> had to drop and take the route with minimal development effort to just
> instantiate mikroBUS devices.
> 
> From what we understand, you are recommending to change the manifest
> description format used by greybus to device tree and also add of_bus
> support for greybus - now this will not only solve instantiating mikrobus
> devices on greybus but even complex devices on greybus making it a robust
> solution and using standard tools and support DT offers.

I would not discard the manifest. It exists, it appears to be used by
a lot of devices. So use it. But consider it an 'intermediate
representation'. Take it and transform it to DT.

Looking at:

https://libstock.mikroe.com/projects/view/5435/clickid

there appears to be a name, and hardware revision in the
manifest. Convert that to a string. Run a checksum over the rest of
the manifest, and append that to the string. You can then look in
/lib/firmware for a DT representation which matches.

> However we have a few doubts:
> * For USB or PCIe, to add OF device tree support the parent devices are
> physically present, for example USB device is a child node of USB controller
> (physically description available in a SoC DT) and USB interfaces are child
> of USB devices, how would that hierarchy look for greybus devices?

So DT support for USB, serial and PCIe devices already exists. When
the core enumerates a PCIe or USB bus, it looks in the DT blob for the
vendor:product ID, and associates any node it finds with the
device. It is not used very often, but if you search the .dts files,
you can find examples.

> Would it be
> USB/UART/transport controller -> AP Bridge host controller -> Module ->
> interface -> bundle -> CPort ?

That is for you to decide. I don't know the architecture well enough.

It is rather old, but:

https://lwn.net/Articles/715955/

There is a diagram of the sysfs tree, which looks pretty similar to
what you say above. What is however missing from the diagram is the
Linux devices themselves. Where do the I2C bus, the SPI bus, the GPIO
controller etc appear in the tree?

Maybe look at PCI and USB. Does the device tree representation include
all the bridges and hubs etc. Or does it simply the representation?

You need something to represent the controller. You need modules. Do
you need the details of interface & bundle and cport? Could you
represent them as an address tuple, and just have the devices under
module?

> When this mikrobus driver was initially implemented we could not think of
> such an approach as the SVC and Control functionality were implemented in
> userspace with gbridge ( https://github.com/anobli/gbridge ) with a netlink
> interface to kernel greybus, but today there are references to do it
> completely in kernel ( drivers/greybus/gb-beagleplay.c) and your proposal is
> implementable.

Does gb-beagleplay.c work together with the code in staging? It looks
like the GPIO controller, I2C controller, SPI controller, etc are
still in GregKH "Tree of crap". I don't think it is wise to build on
top of something in staging. So you probably need to spend time to
cleanup that code and moving it into the mainline proper. As you do
that, you could add the code needed to dynamically add nodes to device
tree.

	Andrew
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
