Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id A474887FD82
	for <lists+greybus-dev@lfdr.de>; Tue, 19 Mar 2024 13:26:00 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 9624543E91
	for <lists+greybus-dev@lfdr.de>; Tue, 19 Mar 2024 12:25:59 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	by lists.linaro.org (Postfix) with ESMTPS id 0655E411F6
	for <greybus-dev@lists.linaro.org>; Tue, 19 Mar 2024 12:25:57 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=lunn.ch header.s=20171124 header.b=ol0N8V5O;
	dmarc=pass (policy=none) header.from=lunn.ch;
	spf=pass (lists.linaro.org: domain of andrew@lunn.ch designates 156.67.10.101 as permitted sender) smtp.mailfrom=andrew@lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=oLvla2oyvXXJnH6StnpXdN8ZvKvla8sutF0A+RVM3SI=; b=ol0N8V5OvA2RhRy82GsC+gtUiA
	iWxQT13z+0a4GNIjKIrRvLJGv3xjGoqFCwB30c1fchr32JMByCSjbmtdVkshtAA4jAOwtMJzr6EL1
	9l7ZvozHYaJjy0C1a0CEWClJkSRY3LGvPKmB3dn3mZnmN3Km9wqf2SMMdK8ZPLmuuzas=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1rmYXF-00AhIs-Tv; Tue, 19 Mar 2024 13:25:41 +0100
Date: Tue, 19 Mar 2024 13:25:41 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Ayush Singh <ayushdevel1325@gmail.com>
Message-ID: <b62915ca-c151-4e37-bb03-c92c569c84ff@lunn.ch>
References: <20240317193714.403132-1-ayushdevel1325@gmail.com>
 <20240317193714.403132-2-ayushdevel1325@gmail.com>
 <CZWVF90JJO98.2M7ARQ9WMGC94@kernel.org>
 <d4dc4d94-d323-4158-8c08-b7d37d8750d3@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d4dc4d94-d323-4158-8c08-b7d37d8750d3@gmail.com>
X-Rspamd-Queue-Id: 0655E411F6
X-Spamd-Bar: ------
X-Spamd-Result: default: False [-6.28 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-2.88)[99.50%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[lunn.ch,none];
	R_SPF_ALLOW(-0.20)[+mx];
	R_DKIM_ALLOW(-0.20)[lunn.ch:s=20171124];
	MIME_GOOD(-0.10)[text/plain];
	ONCE_RECEIVED(0.10)[];
	RCPT_COUNT_TWELVE(0.00)[25];
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
Message-ID-Hash: NOVXAPFUV2B62BWXXG6NDOJDP3EUL5MQ
X-Message-ID-Hash: NOVXAPFUV2B62BWXXG6NDOJDP3EUL5MQ
X-MailFrom: andrew@lunn.ch
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Michael Walle <mwalle@kernel.org>, open list <linux-kernel@vger.kernel.org>, robertcnelson@beagleboard.org, lorforlinux@beagleboard.org, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, Derek Kiernan <derek.kiernan@amd.com>, Dragan Cvetic <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>, Vaishnav M A <vaishnav.a@ti.com>, Mark Brown <broonie@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated list:ARM/TEXAS INSTRUMENTS K3 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "open list:SPI SUBSYSTEM" <linux-spi@vger.kernel.org>, "moderated list:GREYBUS SUBSYSTEM" <greybus-dev@lists.linaro.org>, Vaishnav M A <vaishnav@beagleboard.org>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v4 1/5] dt-bindings: misc: Add mikrobus-connector
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/NOVXAPFUV2B62BWXXG6NDOJDP3EUL5MQ/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

> The device tree defines the SPI controller associated with mikroBUS SPI
> pins. The driver on match queries and takes a reference to the SPI
> controller but does nothing with it. Once a mikroBUS add-on board is
> detected (by passing manifest using sysfs or reading from 1-wire EEPROM),
> the driver parses the manifest, and if it detects an SPI device in manifest,
> it registers SPI device along with setting properties such as `chip_select`,
> `max_speed_hz`, `mode`, etc.,

How complex can the description of the hardware be in the manifest?

Could i describe an SPI to I2C converter? And then a few temperature
sensors, a fan controller, and a GPIO controller on that I2C bus? And
the GPIO controller is then used for LEDs and a push button? DT
overlays could describe that. Can the manifest?

	Andrew
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
