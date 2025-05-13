Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E607AB5EA0
	for <lists+greybus-dev@lfdr.de>; Tue, 13 May 2025 23:53:40 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 1C62745986
	for <lists+greybus-dev@lfdr.de>; Tue, 13 May 2025 21:53:39 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	by lists.linaro.org (Postfix) with ESMTPS id AA0CA444C8
	for <greybus-dev@lists.linaro.org>; Tue, 13 May 2025 21:53:34 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=lunn.ch header.s=20171124 header.b="Gw leEq6";
	dmarc=pass (policy=none) header.from=lunn.ch;
	spf=pass (lists.linaro.org: domain of andrew@lunn.ch designates 156.67.10.101 as permitted sender) smtp.mailfrom=andrew@lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=fbMajz8w3X/FLDkTx5Qc3ESHcp1c0CTxTYL/fxwaRn4=; b=Gw
	leEq6MF+u8X6Hy8d2Uzp48BSKqc2Bu4Ntfo3CNuoT3hYDHSE3h/PSY7dB//ZYaVtkgi8Z2D7ypidA
	4MISDxhk5X1e7b33HrhsN6uL3nyjEoWtrNTRY7qYi+MfARWlf2kvHgO3eTDkABnK3wUnP4uEkyL+c
	R0UfmvjMF7d7TQc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uExYs-00CV9F-U9; Tue, 13 May 2025 23:53:18 +0200
Date: Tue, 13 May 2025 23:53:18 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Damien =?iso-8859-1?Q?Ri=E9gel?= <damien.riegel@silabs.com>
Message-ID: <f1a4ab5a-f2ce-4c94-91eb-ab81aea5b413@lunn.ch>
References: <20250512012748.79749-1-damien.riegel@silabs.com>
 <6fea7d17-8e08-42c7-a297-d4f5a3377661@lunn.ch>
 <D9VCEGBQWBW8.3MJCYYXOZHZNX@silabs.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <D9VCEGBQWBW8.3MJCYYXOZHZNX@silabs.com>
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: AA0CA444C8
X-Spamd-Bar: ------
X-Spamd-Result: default: False [-6.09 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-2.79)[99.10%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[lunn.ch,none];
	ONCE_RECEIVED(0.20)[];
	R_DKIM_ALLOW(-0.20)[lunn.ch:s=20171124];
	R_SPF_ALLOW(-0.20)[+mx];
	MIME_GOOD(-0.10)[text/plain];
	ASN(0.00)[asn:58222, ipnet:156.67.8.0/22, country:CH];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[netdev,dt];
	RCVD_TLS_LAST(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DKIM_TRACE(0.00)[lunn.ch:+]
X-Rspamd-Action: no action
Message-ID-Hash: BNJT5ECW4LDO623ZMJOBKGUCGXEWVFYC
X-Message-ID-Hash: BNJT5ECW4LDO623ZMJOBKGUCGXEWVFYC
X-MailFrom: andrew@lunn.ch
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Silicon Labs Kernel Team <linux-devel@silabs.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [RFC net-next 00/15] Add support for Silicon Labs CPC
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/BNJT5ECW4LDO623ZMJOBKGUCGXEWVFYC/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Tue, May 13, 2025 at 05:15:20PM -0400, Damien Ri=E9gel wrote:
> On Mon May 12, 2025 at 1:07 PM EDT, Andrew Lunn wrote:
> > On Sun, May 11, 2025 at 09:27:33PM -0400, Damien Ri=E9gel wrote:
> >> Hi,
> >>
> >>
> >> This patchset brings initial support for Silicon Labs CPC protocol,
> >> standing for Co-Processor Communication. This protocol is used by the
> >> EFR32 Series [1]. These devices offer a variety for radio protocols,
> >> such as Bluetooth, Z-Wave, Zigbee [2].
> >
> > Before we get too deep into the details of the patches, please could
> > you do a compare/contrast to Greybus.
>=20
> Thank you for the prompt feedback on the RFC. We took a look at Greybus
> in the past and it didn't seem to fit our needs. One of the main use
> case that drove the development of CPC was to support WiFi (in
> coexistence with other radio stacks) over SDIO, and get the maximum
> throughput possible. We concluded that to achieve this we would need
> packet aggregation, as sending one frame at a time over SDIO is
> wasteful, and managing Radio Co-Processor available buffers, as sending
> frames that the RCP is not able to process would degrade performance.
>=20
> Greybus don't seem to offer these capabilities. It seems to be more
> geared towards implementing RPC, where the host would send a command,
> and then wait for the device to execute it and to respond. For Greybus'
> protocols that implement some "streaming" features like audio or video
> capture, the data streams go to an I2S or CSI interface, but it doesn't
> seem to go through a CPort. So it seems to act as a backbone to connect
> CPorts together, but high-throughput transfers happen on other types of
> links. CPC is more about moving data over a physical link, guaranteeing
> ordered delivery and avoiding unnecessary transmissions if remote
> doesn't have the resources, it's much lower level than Greybus.

As is said, i don't know Greybus too well. I hope its Maintainers can
comment on this.

> > Also, this patch adds Bluetooth, you talk about Z-Wave and Zigbee. But
> > the EFR32 is a general purpose SoC, with I2C, SPI, PWM, UART. Greybus
> > has support for these, although the code is current in staging. But
> > for staging code, it is actually pretty good.
>=20
> I agree with you that the EFR32 is a general purpose SoC and exposing
> all available peripherals would be great, but most customers buy it as
> an RCP module with one or more radio stacks enabled, and that's the
> situation we're trying to address. Maybe I introduced a framework with
> custom bus, drivers and endpoints where it was unnecessary, the goal is
> not to be super generic but only to support coexistence of our radio
> stacks.

This leads to my next problem.

https://www.nordicsemi.com/-/media/Software-and-other-downloads/Product-Bri=
efs/nRF5340-SoC-PB.pdf
Nordic Semiconductor has what appears to be a similar device.

https://www.microchip.com/en-us/products/wireless-connectivity/bluetooth-lo=
w-energy/microcontrollers
Microchip has a similar device as well.

https://www.ti.com/product/CC2674R10
TI has a similar device.

And maybe there are others?

Are we going to get a Silabs CPC, a Nordic CPC, a Microchip CPC, a TI
CPC, and an ACME CPC?

How do we end up with one implementation?

Maybe Greybus does not currently support your streaming use case too
well, but it is at least vendor neutral. Can it be extended for
streaming?

And maybe a dumb question... How do transfers get out of order over
SPI and SDIO? If you look at the Open Alliance TC6 specification for
Ethernet over SPI, it does not have any issues with ordering.

	 Andrew

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
