Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 91B5E885973
	for <lists+greybus-dev@lfdr.de>; Thu, 21 Mar 2024 13:56:26 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 91BFD40C49
	for <lists+greybus-dev@lfdr.de>; Thu, 21 Mar 2024 12:56:25 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	by lists.linaro.org (Postfix) with ESMTPS id 61E9640B68
	for <greybus-dev@lists.linaro.org>; Thu, 21 Mar 2024 12:56:23 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=lunn.ch header.s=20171124 header.b="KNYi/Ufs";
	dmarc=pass (policy=none) header.from=lunn.ch;
	spf=pass (lists.linaro.org: domain of andrew@lunn.ch designates 156.67.10.101 as permitted sender) smtp.mailfrom=andrew@lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=/VkiJjn/Ujsmq+U16JaWHWXV190NKV6cULGPu225XxU=; b=KNYi/UfsvbbcIhqHWGMXIBUscE
	0NUwAsju2opk5jzCII3uqEkHR38PO9RlU5fEkVlNiKk6G/xRsfJT95BBpVXuicO7xdAiJj2zANZVH
	b3cNy9k8i9zEFRfFL/mszQHX62S3jxZ+AaOcjMQvO2euRivm6dUzLycyLG+9z5r7rO+s=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1rnHxe-00AsKQ-Pb; Thu, 21 Mar 2024 13:55:58 +0100
Date: Thu, 21 Mar 2024 13:55:58 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Vaishnav Achath <vaishnav.a@ti.com>
Message-ID: <3904c7eb-c179-4596-ba42-d6b545a562a6@lunn.ch>
References: <20240317193714.403132-1-ayushdevel1325@gmail.com>
 <20240317193714.403132-2-ayushdevel1325@gmail.com>
 <CZWVF90JJO98.2M7ARQ9WMGC94@kernel.org>
 <d4dc4d94-d323-4158-8c08-b7d37d8750d3@gmail.com>
 <b62915ca-c151-4e37-bb03-c92c569c84ff@lunn.ch>
 <4b319264-bff7-48e5-85e8-201ca0bafec6@ti.com>
 <4c299d42-84c7-46fc-952f-292cef1bb4b4@lunn.ch>
 <ded6c350-4c70-4a26-8b18-6605dcc6e084@ti.com>
 <CZZBT3ZMDCVI.40UX5MB6LY4I@kernel.org>
 <ef6a1c28-70dc-4077-b644-2704ac3cf30f@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ef6a1c28-70dc-4077-b644-2704ac3cf30f@ti.com>
X-Rspamd-Queue-Id: 61E9640B68
X-Spamd-Bar: ------
X-Spamd-Result: default: False [-6.36 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-2.96)[99.82%];
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
	FREEMAIL_CC(0.00)[kernel.org,armlinux.org.uk,gmail.com,vger.kernel.org,beagleboard.org,linaro.org,ti.com,amd.com,arndb.de,linuxfoundation.org,lists.infradead.org,lists.linaro.org];
	TAGGED_RCPT(0.00)[dt];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	DKIM_TRACE(0.00)[lunn.ch:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: EKBYC64WF5N44HKCZA5F5HNV5XM4CA4Z
X-Message-ID-Hash: EKBYC64WF5N44HKCZA5F5HNV5XM4CA4Z
X-MailFrom: andrew@lunn.ch
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Michael Walle <mwalle@kernel.org>, "Russell King (Oracle)" <linux@armlinux.org.uk>, Ayush Singh <ayushdevel1325@gmail.com>, open list <linux-kernel@vger.kernel.org>, robertcnelson@beagleboard.org, lorforlinux@beagleboard.org, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, Derek Kiernan <derek.kiernan@amd.com>, Dragan Cvetic <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated list:ARM/TEXAS INSTRUMENTS K3 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "open list:SPI SUBSYSTEM" <linux-spi@vger.kernel.org>, "moderated list:GREYBUS SUBSYSTEM" <greybus-dev@lists.linaro.org>, Vaishnav M A <vaishnav@beagleb
 oard.org>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v4 1/5] dt-bindings: misc: Add mikrobus-connector
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/EKBYC64WF5N44HKCZA5F5HNV5XM4CA4Z/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

> > How will the ethernet boards ([1], [2]) work? Where do they get
> > their MAC address from, for example. The DT has some nice properties
> > for that, but I doubt that will be possible with the manifest files.
> > I've looked at the manifest file for the w5500 board [3] and to me
> > it looks like that board will come up with a random MAC address on
> > each start. Thus, even today, you have some boards which require
> > a more complex description.
> > 
> 
> Agreed, this is a limitation, unless the corresponding drivers/subsystems
> use device_property_read_* helper to fetch properties, it will not work and
> net/core/of_net.c only implements of_get_* helpers even though the
> underlying functions can be implemented with equivalent
> device_property_read_* equivalent as well.

I think this is a good example of the limitations. For an Ethernet
NIC, you often want to describe properties of both the MAC and the
PHY. What phy-mode should be used, what delays on the RGMII bus, what
LEDs are there etc. This is a pretty much solved problem with DT, we
have a well defined sub tree to represent the MAC, the MDIO bus and
the PHY on the bus.

But we do have two classes of properties here. The MAC address is
unique to a board. So that does need to be stored in the EEPROM, and
cannot be in a one time converted manifest to DT file stored in
/lib/firmware. However, to some extent, this is a solved problem. We
have a DT representation of how to look in an EEPROM to find the MAC
address. So the DT just needs to point to some bytes in the manifest
in the EEPROM.

	Andrew
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
