Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 510F3AB7F37
	for <lists+greybus-dev@lfdr.de>; Thu, 15 May 2025 09:51:04 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 61DC3455D8
	for <lists+greybus-dev@lfdr.de>; Thu, 15 May 2025 07:51:03 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by lists.linaro.org (Postfix) with ESMTPS id 722AF40C6E
	for <greybus-dev@lists.linaro.org>; Thu, 15 May 2025 07:50:57 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=MRRE2jpO;
	dmarc=pass (policy=none) header.from=linuxfoundation.org;
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 172.105.4.254 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E6F44629CC;
	Thu, 15 May 2025 07:50:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E490DC4CEED;
	Thu, 15 May 2025 07:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1747295456;
	bh=tpCTD5xGme/qPS7vcmDRv0oeU5Y1eIoub1iwPCyoqhU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MRRE2jpO51015SkZlpUH3dWOOmZ4ntJR8HlDtRS/JqOFD8nOw3UUPf2yukSld8ns4
	 2ZCBTFaZ58lndbcxSgd+4XeTtMolz41FMjGHFB/OFyorz3NbHkWHYLNPV0bAO8gc4C
	 VszQq7SNr0gaR0zgZmCoMWXesIZW/ZRWdPYkO2Js=
Date: Thu, 15 May 2025 09:49:01 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Damien =?iso-8859-1?Q?Ri=E9gel?= <damien.riegel@silabs.com>
Message-ID: <2025051551-rinsing-accurate-1852@gregkh>
References: <20250512012748.79749-1-damien.riegel@silabs.com>
 <6fea7d17-8e08-42c7-a297-d4f5a3377661@lunn.ch>
 <D9VCEGBQWBW8.3MJCYYXOZHZNX@silabs.com>
 <f1a4ab5a-f2ce-4c94-91eb-ab81aea5b413@lunn.ch>
 <D9W93CSVNNM0.F14YDBPZP64O@silabs.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <D9W93CSVNNM0.F14YDBPZP64O@silabs.com>
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 722AF40C6E
X-Spamd-Bar: -
X-Spamd-Result: default: False [-2.00 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[99.97%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.4.254];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MIME_GOOD(-0.10)[text/plain];
	ASN(0.00)[asn:63949, ipnet:172.105.0.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TAGGED_RCPT(0.00)[netdev,dt];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	FROM_HAS_DN(0.00)[];
	DWL_DNSWL_NONE(0.00)[linuxfoundation.org:dkim];
	DKIM_TRACE(0.00)[linuxfoundation.org:+]
X-Rspamd-Action: no action
Message-ID-Hash: E7TRHEQ6OZPK4ULZIAUOJRYZDI2VH6EK
X-Message-ID-Hash: E7TRHEQ6OZPK4ULZIAUOJRYZDI2VH6EK
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Andrew Lunn <andrew@lunn.ch>, Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Silicon Labs Kernel Team <linux-devel@silabs.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [RFC net-next 00/15] Add support for Silicon Labs CPC
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/E7TRHEQ6OZPK4ULZIAUOJRYZDI2VH6EK/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Wed, May 14, 2025 at 06:52:27PM -0400, Damien Ri=E9gel wrote:
> On Tue May 13, 2025 at 5:53 PM EDT, Andrew Lunn wrote:
> > On Tue, May 13, 2025 at 05:15:20PM -0400, Damien Ri=E9gel wrote:
> >> On Mon May 12, 2025 at 1:07 PM EDT, Andrew Lunn wrote:
> >> > On Sun, May 11, 2025 at 09:27:33PM -0400, Damien Ri=E9gel wrote:
> >> >> Hi,
> >> >>
> >> >>
> >> >> This patchset brings initial support for Silicon Labs CPC protocol,
> >> >> standing for Co-Processor Communication. This protocol is used by t=
he
> >> >> EFR32 Series [1]. These devices offer a variety for radio protocols,
> >> >> such as Bluetooth, Z-Wave, Zigbee [2].
> >> >
> >> > Before we get too deep into the details of the patches, please could
> >> > you do a compare/contrast to Greybus.
> >>
> >> Thank you for the prompt feedback on the RFC. We took a look at Greybus
> >> in the past and it didn't seem to fit our needs. One of the main use
> >> case that drove the development of CPC was to support WiFi (in
> >> coexistence with other radio stacks) over SDIO, and get the maximum
> >> throughput possible. We concluded that to achieve this we would need
> >> packet aggregation, as sending one frame at a time over SDIO is
> >> wasteful, and managing Radio Co-Processor available buffers, as sending
> >> frames that the RCP is not able to process would degrade performance.
> >>
> >> Greybus don't seem to offer these capabilities. It seems to be more
> >> geared towards implementing RPC, where the host would send a command,
> >> and then wait for the device to execute it and to respond. For Greybus'
> >> protocols that implement some "streaming" features like audio or video
> >> capture, the data streams go to an I2S or CSI interface, but it doesn't
> >> seem to go through a CPort. So it seems to act as a backbone to connect
> >> CPorts together, but high-throughput transfers happen on other types of
> >> links. CPC is more about moving data over a physical link, guaranteeing
> >> ordered delivery and avoiding unnecessary transmissions if remote
> >> doesn't have the resources, it's much lower level than Greybus.
> >
> > As is said, i don't know Greybus too well. I hope its Maintainers can
> > comment on this.
> >
> >> > Also, this patch adds Bluetooth, you talk about Z-Wave and Zigbee. B=
ut
> >> > the EFR32 is a general purpose SoC, with I2C, SPI, PWM, UART. Greybus
> >> > has support for these, although the code is current in staging. But
> >> > for staging code, it is actually pretty good.
> >>
> >> I agree with you that the EFR32 is a general purpose SoC and exposing
> >> all available peripherals would be great, but most customers buy it as
> >> an RCP module with one or more radio stacks enabled, and that's the
> >> situation we're trying to address. Maybe I introduced a framework with
> >> custom bus, drivers and endpoints where it was unnecessary, the goal is
> >> not to be super generic but only to support coexistence of our radio
> >> stacks.
> >
> > This leads to my next problem.
> >
> > https://www.nordicsemi.com/-/media/Software-and-other-downloads/Product=
-Briefs/nRF5340-SoC-PB.pdf
> > Nordic Semiconductor has what appears to be a similar device.
> >
> > https://www.microchip.com/en-us/products/wireless-connectivity/bluetoot=
h-low-energy/microcontrollers
> > Microchip has a similar device as well.
> >
> > https://www.ti.com/product/CC2674R10
> > TI has a similar device.
> >
> > And maybe there are others?
> >
> > Are we going to get a Silabs CPC, a Nordic CPC, a Microchip CPC, a TI
> > CPC, and an ACME CPC?
> >
> > How do we end up with one implementation?
> >
> > Maybe Greybus does not currently support your streaming use case too
> > well, but it is at least vendor neutral. Can it be extended for
> > streaming?
>=20
> I get the sentiment that we don't want every single vendor to push their
> own protocols that are ever so slightly different. To be honest, I don't
> know if Greybus can be extended for that use case, or if it's something
> they are interested in supporting. I've subscribed to greybus-dev so
> hopefully my email will get through this time (previous one is pending
> approval).
>=20
> Unfortunately, we're deep down the CPC road, especially on the firmware
> side. Blame on me for not sending the RFC sooner and getting feedback
> earlier, but if we have to massively change our course of action we need
> some degree of confidence that this is a viable alternative for
> achieving high-throughput for WiFi over SDIO. I would really value any
> input from the Greybus folks on this.

So what you are looking for is a standard way to "tunnel" SDIO over some
other physical transport, right?  If so, then yes, please use Greybus as
that is exactly what it was designed for.

If there is a throughput issue with the sdio implementation on Greybus,
we can address it by fixing up the code to go faster, I don't recall
there ever being any real benchmarking happening for that protocol in
the past as the physical layer that we were using for Greybus at the
time (MIPI) was very fast, the bottleneck was usually either the host
controller we were using for Greybus, OR on the firmware side in the
device itself (i.e. turning Greybus packets into SDIO commands, as SDIO
was pretty slow.)

thanks,

greg k-h
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
