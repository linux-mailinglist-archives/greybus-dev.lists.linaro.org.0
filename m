Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id ADB75AC130D
	for <lists+greybus-dev@lfdr.de>; Thu, 22 May 2025 20:11:40 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id B2C104448C
	for <lists+greybus-dev@lfdr.de>; Thu, 22 May 2025 18:11:39 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	by lists.linaro.org (Postfix) with ESMTPS id 26BC94440A
	for <greybus-dev@lists.linaro.org>; Thu, 22 May 2025 18:11:36 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=lunn.ch header.s=20171124 header.b=xxYpn5fV;
	spf=pass (lists.linaro.org: domain of andrew@lunn.ch designates 156.67.10.101 as permitted sender) smtp.mailfrom=andrew@lunn.ch;
	dmarc=pass (policy=none) header.from=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=ZqB1LOv+8bmezfvZqkWc7UwmyeA3+lxJ+Fn8QWU2m8c=; b=xxYpn5fVDdwDNNANF8amQO4FIR
	G2W8EFlOndMpLEnvTTuMZTbBqlRgqycRaULlHvDebda3278xYjQvaNUlYHPpNg3qRzZhcWilIVZR3
	GQBEzFq5zsZIfFOspDknsa+ZdR8hHhmLg9Sta0wVLY2L47AJrurJkvEwiSzzgK9Q79Vc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uIAO1-00DWWL-La; Thu, 22 May 2025 20:11:21 +0200
Date: Thu, 22 May 2025 20:11:21 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Alex Elder <elder@ieee.org>
Message-ID: <d4f047f6-59ef-4f8c-b64f-ec958f0323ca@lunn.ch>
References: <6fea7d17-8e08-42c7-a297-d4f5a3377661@lunn.ch>
 <D9VCEGBQWBW8.3MJCYYXOZHZNX@silabs.com>
 <f1a4ab5a-f2ce-4c94-91eb-ab81aea5b413@lunn.ch>
 <D9W93CSVNNM0.F14YDBPZP64O@silabs.com>
 <2025051551-rinsing-accurate-1852@gregkh>
 <D9WTONSVOPJS.1DNQ703ATXIN1@silabs.com>
 <2025051612-stained-wasting-26d3@gregkh>
 <D9XQ42C56TUG.2VXDA4CVURNAM@silabs.com>
 <cbfc9422-9ba8-475b-9c8d-e6ab0e53856e@lunn.ch>
 <9a612b07-fe02-40d6-a1d4-7a6d1266ed18@ieee.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9a612b07-fe02-40d6-a1d4-7a6d1266ed18@ieee.org>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Spamd-Result: default: False [-5.96 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-2.66)[98.52%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[lunn.ch,none];
	ONCE_RECEIVED(0.20)[];
	R_DKIM_ALLOW(-0.20)[lunn.ch:s=20171124];
	R_SPF_ALLOW(-0.20)[+mx];
	MIME_GOOD(-0.10)[text/plain];
	ASN(0.00)[asn:58222, ipnet:156.67.8.0/22, country:CH];
	RCPT_COUNT_TWELVE(0.00)[18];
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
X-Rspamd-Queue-Id: 26BC94440A
X-Spamd-Bar: -----
Message-ID-Hash: PCBYJKPVVMNX6HSWWECB4HBX26BVM5ET
X-Message-ID-Hash: PCBYJKPVVMNX6HSWWECB4HBX26BVM5ET
X-MailFrom: andrew@lunn.ch
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Damien =?iso-8859-1?Q?Ri=E9gel?= <damien.riegel@silabs.com>, Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Silicon Labs Kernel Team <linux-devel@silabs.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [RFC net-next 00/15] Add support for Silicon Labs CPC
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/PCBYJKPVVMNX6HSWWECB4HBX26BVM5ET/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

> > You have listed how your implementation is similar to Greybus. You say
> > what is not so great is streaming, i.e. the bulk data transfer needed
> > to implement xmit_sync() and xmit_async() above. Greybus is too much
> > RPC based. RPCs are actually what you want for most of the operations
> > listed above, but i agree for data, in order to keep the transport
> > fully loaded, you want double buffering. However, that appears to be
> > possible with the current Greybus code.
> > 
> > gb_operation_unidirectional_timeout() says:
> 
> Yes, these are request messages that don't require a response.
> The acknowledgement is about when the host *sent it*, not when
> it got received.  They're rarely used but I could see them being
> used this way.  Still, you might be limited to 255 or so in-flight
> messages.

I don't actually see how you can have multiple messages in-flight, but
maybe i'm missing something. It appears that upper layers pass the
message down and then block on a completion. The signalling of that
completion only happens when the message is on the wire. So it is all
synchronous. In order to have multiple messages in-flight, the lower
layer would have to copy the message, signal the completion, and then
send the copy whenever the transport was free.

The network stack is however async by nature. The ndo_start_xmit call
passes an skbuf. The data in the skbuf is setup for DMA transfer, and
then ndo_start_xmit returns. Later, when the DMA has completed, the
driver calls dev_kfree_skb() to say it has finished with the skb.

Ideally we want a similar async mechanism, which is why i suggested
gb_operation_unidirectional_async(). Pass a message to Greybus, none
blocking, and have a callback for when the message has hit the wire
and the skb can be friend. The low level can then keep a list of skb's
so it can quickly do back to back transfers over the transport to keep
it busy.

	Andrew
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
