Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id C03C588735D
	for <lists+greybus-dev@lfdr.de>; Fri, 22 Mar 2024 19:51:34 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id BC98040B78
	for <lists+greybus-dev@lfdr.de>; Fri, 22 Mar 2024 18:51:33 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	by lists.linaro.org (Postfix) with ESMTPS id 6E3A83F3D7
	for <greybus-dev@lists.linaro.org>; Fri, 22 Mar 2024 18:51:31 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=lunn.ch header.s=20171124 header.b=KA7PtXeT;
	dmarc=pass (policy=none) header.from=lunn.ch;
	spf=pass (lists.linaro.org: domain of andrew@lunn.ch designates 156.67.10.101 as permitted sender) smtp.mailfrom=andrew@lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=UiMuCZuCE+GDbraTFgLjnezZYv3h2ixZi1ZXPtQOspI=; b=KA7PtXeTDDxMMDvhwcNlopN79C
	axGXt6HfyXpXMRQ6iSLvZBqBPY+Wgyzv70AlZ1kuUgGWwk1WcJcMhpilere+va8+jV+srPuBPtAIa
	40v4LkmOPmrYyWcwnJvuiR9BkwJiCfRl0PI5M2K6PyaD3gsda2FUioXdxyG08MirHMI8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1rnjz6-00Ayph-VK; Fri, 22 Mar 2024 19:51:20 +0100
Date: Fri, 22 Mar 2024 19:51:20 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Ayush Singh <ayushdevel1325@gmail.com>
Message-ID: <362aace1-2e6a-4b50-acf8-6dccafd44973@lunn.ch>
References: <20240317193714.403132-1-ayushdevel1325@gmail.com>
 <20240317193714.403132-2-ayushdevel1325@gmail.com>
 <711ff5ea-244d-4b64-a39c-3f2da63e30c0@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <711ff5ea-244d-4b64-a39c-3f2da63e30c0@gmail.com>
X-Rspamd-Queue-Id: 6E3A83F3D7
X-Spamd-Bar: ------
X-Spamd-Result: default: False [-6.40 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[lunn.ch,none];
	R_DKIM_ALLOW(-0.20)[lunn.ch:s=20171124];
	R_SPF_ALLOW(-0.20)[+mx];
	MIME_GOOD(-0.10)[text/plain];
	ONCE_RECEIVED(0.10)[];
	ARC_NA(0.00)[];
	ASN(0.00)[asn:58222, ipnet:156.67.8.0/22, country:CH];
	RCVD_COUNT_ONE(0.00)[1];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[dt];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.956];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DKIM_TRACE(0.00)[lunn.ch:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: FUAUSCZ2OVEDSHHXRGZ6NQKLEQEC4SA7
X-Message-ID-Hash: FUAUSCZ2OVEDSHHXRGZ6NQKLEQEC4SA7
X-MailFrom: andrew@lunn.ch
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: open list <linux-kernel@vger.kernel.org>, robertcnelson@beagleboard.org, lorforlinux@beagleboard.org, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, Derek Kiernan <derek.kiernan@amd.com>, Dragan Cvetic <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>, Vaishnav M A <vaishnav.a@ti.com>, Mark Brown <broonie@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated list:ARM/TEXAS INSTRUMENTS K3 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "open list:SPI SUBSYSTEM" <linux-spi@vger.kernel.org>, "moderated list:GREYBUS SUBSYSTEM" <greybus-dev@lists.linaro.org>, Vaishnav M A <vaishnav@beagleboard.org>, Michael Walle <mwalle@kernel.org>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v4 1/5] dt-bindings: misc: Add mikrobus-connector
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/FUAUSCZ2OVEDSHHXRGZ6NQKLEQEC4SA7/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

> After going through all the discussions here, I have a few questions:
> 
> 1. Is the old `*_register_device(controller, board_info)` style discouraged
> in favor of using device tree, at least for drivers using multiple
> fundamental buses (i2c, spi, etc)?

Historically, they were used in board files, where you needed to write
C code for every single board. That did not scale, which is why we
swapped to DT.

board_info is still useful, e.g. for platforms which don't have DT. I
support a few amd64 boards where i need to use a platform driver to
instantiate some I2C and MDIO devices. But in general DT is much
easier to use.

> 2. Is the preferred way to handle virtual devices (like those created by
> greybus subsystem) now device tree? Is that one of the blockers for greybus
> i2c, spi etc to still be in staging?

I would not say they are virtual. They do exist. They are just not
memory mapped like most devices, but in another address space, one
which you access via RPCs.

> 
> 3. How are virtual devices created in device tree? If I register an i2c
> adapter using `i2c_add_adapter`, is the device tree entry is dynamically
> created, which can then be used by a device tree overlay?

As far as i'm aware, there are no examples today. You are doing
something different, something new. Adding these dynamic devices to DT
is just a suggestion from me, as a good way to solve your problem. You
will need to look into the DT core and figure out how to do it.

     Andrew
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
