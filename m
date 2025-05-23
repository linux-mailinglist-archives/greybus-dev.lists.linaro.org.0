Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id B46A4AC2AB6
	for <lists+greybus-dev@lfdr.de>; Fri, 23 May 2025 22:08:02 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id D07CD44477
	for <lists+greybus-dev@lfdr.de>; Fri, 23 May 2025 20:07:51 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	by lists.linaro.org (Postfix) with ESMTPS id 7271E441C0
	for <greybus-dev@lists.linaro.org>; Fri, 23 May 2025 20:07:47 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=lunn.ch header.s=20171124 header.b=0jjTD3NL;
	spf=pass (lists.linaro.org: domain of andrew@lunn.ch designates 156.67.10.101 as permitted sender) smtp.mailfrom=andrew@lunn.ch;
	dmarc=pass (policy=none) header.from=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=gAyIsHp9u9c/VEO2is/zAGA5jdT02MlM2owOkmGGNvU=; b=0jjTD3NL0TcmCPZnxEvUKOqa7w
	ycdSvlaL8MppjWbq75socO16PkXQwrcJ6QkPCIPTEvLR4mPrzy84t2O+Lzc61zHDA++zbQl8aaAS+
	i+Je8eLO6aa7GMBXcJ7HKb1xw5q+rhWLkzcYTEp6mGxCnjpeWeJNisnlBycr3dy7SjXk=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uIYfR-00De9m-9e; Fri, 23 May 2025 22:06:57 +0200
Date: Fri, 23 May 2025 22:06:57 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Damien =?iso-8859-1?Q?Ri=E9gel?= <damien.riegel@silabs.com>
Message-ID: <db54fe16-ae7d-410c-817b-edb4faa6656c@lunn.ch>
References: <20250512012748.79749-1-damien.riegel@silabs.com>
 <6fea7d17-8e08-42c7-a297-d4f5a3377661@lunn.ch>
 <D9VCEGBQWBW8.3MJCYYXOZHZNX@silabs.com>
 <f1a4ab5a-f2ce-4c94-91eb-ab81aea5b413@lunn.ch>
 <D9W93CSVNNM0.F14YDBPZP64O@silabs.com>
 <65cc6196-7ebe-453f-8148-ecb93e5b69fd@ieee.org>
 <DA3STV21NQE0.23SODSDP37DI7@silabs.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DA3STV21NQE0.23SODSDP37DI7@silabs.com>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Spamd-Result: default: False [-0.78 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	BAYES_HAM(-1.48)[91.53%];
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
X-Rspamd-Queue-Id: 7271E441C0
X-Spamd-Bar: /
Message-ID-Hash: W3H4VWC3OVCPVUUNNO75YDXM27ILPVY7
X-Message-ID-Hash: W3H4VWC3OVCPVUUNNO75YDXM27ILPVY7
X-MailFrom: andrew@lunn.ch
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Alex Elder <elder@ieee.org>, Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Silicon Labs Kernel Team <linux-devel@silabs.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [RFC net-next 00/15] Add support for Silicon Labs CPC
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/W3H4VWC3OVCPVUUNNO75YDXM27ILPVY7/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

> I don't really know about UniPro and I'm learning about it as the
> discussion goes, but one of the point listed on Wikipedia is
> "reliability - data errors detected and correctable via retransmission"
> 
> This is where CPC could come in, probably with a different name and a
> reduced scope, as a way to implement reliable transmission over UART,
> SPI, SDIO, by ensuring data errors are detected and packets
> retransmitted if necessary, and be limited to that.

You mentioned HDLC in the past. What is interesting is that HDLC is
actually used in Greybus:

https://elixir.bootlin.com/linux/v6.15-rc7/source/drivers/greybus/gb-beagleplay.c#L581

I've no idea if its just for framing, or if there is also retries on
errors, S-frames with flow and error control etc. There might be code
you can reuse here.

	Andrew
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
