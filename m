Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CBB5ABD8C0
	for <lists+greybus-dev@lfdr.de>; Tue, 20 May 2025 15:04:36 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 1C51545FFD
	for <lists+greybus-dev@lfdr.de>; Tue, 20 May 2025 13:04:35 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	by lists.linaro.org (Postfix) with ESMTPS id 8938944654
	for <greybus-dev@lists.linaro.org>; Tue, 20 May 2025 13:04:32 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=lunn.ch header.s=20171124 header.b="a8 7PczH";
	spf=pass (lists.linaro.org: domain of andrew@lunn.ch designates 156.67.10.101 as permitted sender) smtp.mailfrom=andrew@lunn.ch;
	dmarc=pass (policy=none) header.from=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=gNSBAq32hdbFYRJbB0m60tJ7sQQnB7sJQkTEYNeP4ZA=; b=a8
	7PczHph3oG3H9MgQswqUZHb8PQ88CXvloqzqtPS84IJRHWgkTlJSiFUp3yqQZOnkfWrSYSnN2od4F
	x6qL1aJm0M7RSVr0wCISBT3N9nwnYatEU/nF0oix+UESyoA/25X/gYa9iOivEiYTVAHc/B1/VaeUk
	NmuaptLxDItuRlk=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uHMdk-00D7jz-DO; Tue, 20 May 2025 15:04:16 +0200
Date: Tue, 20 May 2025 15:04:16 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Damien =?iso-8859-1?Q?Ri=E9gel?= <damien.riegel@silabs.com>
Message-ID: <5bc03f50-498e-42c8-9a14-ca15243213bd@lunn.ch>
References: <6fea7d17-8e08-42c7-a297-d4f5a3377661@lunn.ch>
 <D9VCEGBQWBW8.3MJCYYXOZHZNX@silabs.com>
 <f1a4ab5a-f2ce-4c94-91eb-ab81aea5b413@lunn.ch>
 <D9W93CSVNNM0.F14YDBPZP64O@silabs.com>
 <2025051551-rinsing-accurate-1852@gregkh>
 <D9WTONSVOPJS.1DNQ703ATXIN1@silabs.com>
 <2025051612-stained-wasting-26d3@gregkh>
 <D9XQ42C56TUG.2VXDA4CVURNAM@silabs.com>
 <cbfc9422-9ba8-475b-9c8d-e6ab0e53856e@lunn.ch>
 <DA0LEHFCVRDC.2NXIZKLBP7QCJ@silabs.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DA0LEHFCVRDC.2NXIZKLBP7QCJ@silabs.com>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Spamd-Result: default: False [-6.18 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-2.88)[99.48%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[lunn.ch,none];
	ONCE_RECEIVED(0.20)[];
	R_DKIM_ALLOW(-0.20)[lunn.ch:s=20171124];
	R_SPF_ALLOW(-0.20)[+mx];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	ASN(0.00)[asn:58222, ipnet:156.67.8.0/22, country:CH];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_ONE(0.00)[1];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[netdev,dt];
	RCVD_TLS_LAST(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	URIBL_BLOCKED(0.00)[vps0.lunn.ch:rdns,vps0.lunn.ch:helo,lunn.ch:mid,lunn.ch:dkim];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DKIM_TRACE(0.00)[lunn.ch:+]
X-Rspamd-Queue-Id: 8938944654
X-Spamd-Bar: ------
Message-ID-Hash: BKEPGVWXLTNMN37VWSRWW2RPIW74RRVG
X-Message-ID-Hash: BKEPGVWXLTNMN37VWSRWW2RPIW74RRVG
X-MailFrom: andrew@lunn.ch
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Silicon Labs Kernel Team <linux-devel@silabs.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [RFC net-next 00/15] Add support for Silicon Labs CPC
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/BKEPGVWXLTNMN37VWSRWW2RPIW74RRVG/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Mon, May 19, 2025 at 09:21:52PM -0400, Damien Ri=E9gel wrote:
> On Sun May 18, 2025 at 11:23 AM EDT, Andrew Lunn wrote:
> > This also comes back to my point of there being at least four vendors
> > of devices like yours. Linux does not want four or more
> > implementations of this, each 90% the same, just a different way of
> > converting this structure of operations into messages over a transport
> > bus.
> >
> > You have to define the protocol. Mainline needs that so when the next
> > vendor comes along, we can point at your protocol and say that is how
> > it has to be implemented in Mainline. Make your firmware on the SoC
> > understand it.  You have the advantage that you are here first, you
> > get to define that protocol, but you do need to clearly define it.
>=20
> I understand that this is the preferred way and I'll push internally for
> going that direction. That being said, Greybus seems to offer the
> capability to have a custom driver for a given PID/VID, if a module
> doesn't implement a Greybus-standardized protocol. Would a custom
> Greybus driver for, just as an example, our Wifi stack be an acceptable
> option?

It is not clear to me why a custom driver would be needed. You need to
implement a Linux WiFi driver. That API is well defined, although you
might only need a subset. What do you need in addition to that?

> > So long as you are doing your memory management correctly, i don't see
> > why you cannot implement double buffering in the transport driver.
> >
> > I also don't see why you cannot extend the Greybus upper API and add a
> > true gb_operation_unidirectional_async() call.
>=20
> Just because touching a well established subsystem is scary, but I
> understand that we're allowed to make changes that make sense.

There are developers here to help review such changes. And extending
existing Linux subsystems is how Linux has become the dominant OS. You
are getting it for free, building on the work of others, so it is not
too unreasonable to contribute a little bit back by making it even
better.

>=20
> > You also said that lots of small transfers are inefficient, and you
> > wanted to combine small high level messages into one big transport
> > layer message. This is something you frequently see with USB Ethernet
> > dongles. The Ethernet driver puts a number of small Ethernet packets
> > into one USB URB. The USB layer itself has no idea this is going on. I
> > don't see why the same cannot be done here, greybus itself does not
> > need to be aware of the packet consolidation.
>=20
> Yeah, so in this design, CPC would really be limited to the transport
> bus (SPI for now), to do packet consolidation and managing RCP available
> buffers. I think at this point, the next step is to come up with a proof
> of concept of Greybus over CPC and see if that works or not.

You need to keep the lower level generic. I would not expect anything
Silabs specific in how you transport Greybus over SPI or SDIO. As part
of gb_operation_unidirectional_async() you need to think about flow
control, you need some generic mechanism to indicate receive buffer
availability in the device, and when to pause a while to let the
device catch up, but there is no reason TI, Microchip, Nordic, etc
should not be able to use the same encapsulation scheme.

	Andrew
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
