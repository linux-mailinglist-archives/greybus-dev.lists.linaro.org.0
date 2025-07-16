Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id C15F4B076C7
	for <lists+greybus-dev@lfdr.de>; Wed, 16 Jul 2025 15:21:15 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id D45A545759
	for <lists+greybus-dev@lfdr.de>; Wed, 16 Jul 2025 13:21:14 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	by lists.linaro.org (Postfix) with ESMTPS id C157F44AA2
	for <greybus-dev@lists.linaro.org>; Wed, 16 Jul 2025 13:21:11 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b="vKHBQ/bY";
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 139.178.84.217 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org;
	dmarc=pass (policy=none) header.from=linuxfoundation.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 60C245C4CEF;
	Wed, 16 Jul 2025 13:21:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B48B6C4CEF0;
	Wed, 16 Jul 2025 13:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1752672071;
	bh=TzH+a8qh72uAAsJFx+foN/9TXpBpMhGJGuaV/QalWz8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vKHBQ/bYf4IPxwarE1Ii22wy5O2/6163/XP3QaweEUfmVempcv27UWGUJWKwPqff+
	 LjZETITLi6p9Cya4Mp0FDAyPvV8sthC6Ly/a9uamj1KANJ1R8WiIARCMt417PThtPt
	 F7eMoI0caHsEoIKsdBY+z6HY0dTf4nPjx0Nt4MAE=
Date: Wed, 16 Jul 2025 15:21:08 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Damien =?iso-8859-1?Q?Ri=E9gel?= <damien.riegel@silabs.com>
Message-ID: <2025071645-awkward-spotted-9d25@gregkh>
References: <20250705004036.3828-1-damien.riegel@silabs.com>
 <20250705004036.3828-3-damien.riegel@silabs.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250705004036.3828-3-damien.riegel@silabs.com>
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: C157F44AA2
X-Spamd-Bar: /
X-Spamd-Result: default: False [-1.00 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	BAYES_HAM(-3.00)[99.99%];
	RCVD_DKIM_ARC_DNSWL_HI(-1.00)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	RCVD_IN_DNSWL_HI(-0.50)[139.178.84.217:from];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip4:139.178.84.217];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	ASN(0.00)[asn:15830, ipnet:139.178.80.0/21, country:NL];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DWL_DNSWL_NONE(0.00)[linuxfoundation.org:dkim];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	URIBL_BLOCKED(0.00)[dfw.source.kernel.org:rdns,dfw.source.kernel.org:helo,linuxfoundation.org:dkim,silabs.com:email];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+]
X-Rspamd-Action: no action
Message-ID-Hash: WBAS46WABQSYIWWNNLIXX2HYZLYMACRZ
X-Message-ID-Hash: WBAS46WABQSYIWWNNLIXX2HYZLYMACRZ
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org, linux-devel@silabs.com, Alex Elder <elder@kernel.org>, Johan Hovold <johan@kernel.org>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [RFC 2/6] greybus: cpc: add core logic
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/WBAS46WABQSYIWWNNLIXX2HYZLYMACRZ/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 04, 2025 at 08:40:32PM -0400, Damien Ri=E9gel wrote:
> This step adds the basic infrastructure in order to use CPC as backend
> in Greybus. The goal of CPC is to add reliablity, by implementing error
> detection and retransmission for links that don't have that capability
> by default.
>=20
> When Greybus establishes the connection between two CPorts, CPC will
> create an endpoint for this connection. Greybus messages will then be
> encapsulated in CPC frames, which basically are a custom header +
> Greybus header + Greybus payload.
>=20
> As this is still evolving and not the main point of the RFC, the whole
> core is squashed in one big commit, but it will definitely be split into
> more digestible commits as we refine it.
>=20
> Signed-off-by: Damien Ri=E9gel <damien.riegel@silabs.com>
> ---
>  MAINTAINERS                    |   6 +
>  drivers/greybus/Kconfig        |   2 +
>  drivers/greybus/Makefile       |   2 +
>  drivers/greybus/cpc/Kconfig    |  12 ++
>  drivers/greybus/cpc/Makefile   |   6 +
>  drivers/greybus/cpc/cpc.h      | 135 ++++++++++++++++
>  drivers/greybus/cpc/endpoint.c | 158 +++++++++++++++++++
>  drivers/greybus/cpc/header.c   | 212 +++++++++++++++++++++++++
>  drivers/greybus/cpc/header.h   |  81 ++++++++++
>  drivers/greybus/cpc/host.c     | 113 ++++++++++++++
>  drivers/greybus/cpc/protocol.c | 274 +++++++++++++++++++++++++++++++++
>  11 files changed, 1001 insertions(+)

I like the idea, but you are going to have to break this up into smaller
pieces in order to get us to be able to review it well, sorry.

thanks

greg k-h
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
