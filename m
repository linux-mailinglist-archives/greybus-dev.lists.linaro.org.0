Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id DE684AB3EA7
	for <lists+greybus-dev@lfdr.de>; Mon, 12 May 2025 19:08:18 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 1D735459DA
	for <lists+greybus-dev@lfdr.de>; Mon, 12 May 2025 17:08:04 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	by lists.linaro.org (Postfix) with ESMTPS id 92D5240FBD
	for <greybus-dev@lists.linaro.org>; Mon, 12 May 2025 17:07:58 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=lunn.ch header.s=20171124 header.b="mk oks5c";
	dmarc=pass (policy=none) header.from=lunn.ch;
	spf=pass (lists.linaro.org: domain of andrew@lunn.ch designates 156.67.10.101 as permitted sender) smtp.mailfrom=andrew@lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=AIX9i9XOoogJsxM2MKGz+jWDm2A2YEEjwp/MY1BWXgM=; b=mk
	oks5cLithMxuvu28S06tNcTQiAzT/5r6o6bwui5XQdulLQr352SjyHoSJnO5cbfs9qO2h0SIGat5q
	sgW7QMmNRAsLza8+iTgsIcYO09hzsLjmQfBTmZyeQzYDm2FfDZxlBjOG1WXI9K7LwRUWsqpULe4av
	eqqrJLe6239WeTk=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uEWcr-00CMd6-AR; Mon, 12 May 2025 19:07:37 +0200
Date: Mon, 12 May 2025 19:07:37 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Damien =?iso-8859-1?Q?Ri=E9gel?= <damien.riegel@silabs.com>
Message-ID: <6fea7d17-8e08-42c7-a297-d4f5a3377661@lunn.ch>
References: <20250512012748.79749-1-damien.riegel@silabs.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250512012748.79749-1-damien.riegel@silabs.com>
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 92D5240FBD
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.25 / 15.00];
	BAYES_HAM(-2.95)[99.79%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[lunn.ch,none];
	R_DKIM_ALLOW(-0.20)[lunn.ch:s=20171124];
	R_SPF_ALLOW(-0.20)[+mx];
	ONCE_RECEIVED(0.20)[];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_ONE(0.00)[1];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:58222, ipnet:156.67.8.0/22, country:CH];
	DWL_DNSWL_BLOCKED(0.00)[lunn.ch:dkim];
	MISSING_XM_UA(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[netdev,dt];
	DNSWL_BLOCKED(0.00)[156.67.10.101:from];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_TLS_LAST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DKIM_TRACE(0.00)[lunn.ch:+]
X-Rspamd-Action: no action
Message-ID-Hash: ZQXRVWA6NCNA32O2A7F5UJMH4BCPZAEN
X-Message-ID-Hash: ZQXRVWA6NCNA32O2A7F5UJMH4BCPZAEN
X-MailFrom: andrew@lunn.ch
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Silicon Labs Kernel Team <linux-devel@silabs.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [RFC net-next 00/15] Add support for Silicon Labs CPC
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/ZQXRVWA6NCNA32O2A7F5UJMH4BCPZAEN/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Sun, May 11, 2025 at 09:27:33PM -0400, Damien Ri=E9gel wrote:
> Hi,
>=20
>=20
> This patchset brings initial support for Silicon Labs CPC protocol,
> standing for Co-Processor Communication. This protocol is used by the
> EFR32 Series [1]. These devices offer a variety for radio protocols,
> such as Bluetooth, Z-Wave, Zigbee [2].

Before we get too deep into the details of the patches, please could
you do a compare/contrast to Greybus.

The core of Greybus is already in the kernel, with some more bits
being in staging. I don't know it too well, but at first glance it
looks very similar. We should not duplicate that.

Also, this patch adds Bluetooth, you talk about Z-Wave and Zigbee. But
the EFR32 is a general purpose SoC, with I2C, SPI, PWM, UART. Greybus
has support for these, although the code is current in staging. But
for staging code, it is actually pretty good.

Why should we add a vendor implementation when we already appear to
have something which does most of what is needed?

	Andrew
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
