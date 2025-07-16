Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FF51B076C1
	for <lists+greybus-dev@lfdr.de>; Wed, 16 Jul 2025 15:19:55 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 041DD459E7
	for <lists+greybus-dev@lfdr.de>; Wed, 16 Jul 2025 13:19:54 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	by lists.linaro.org (Postfix) with ESMTPS id 2FF1244AA2
	for <greybus-dev@lists.linaro.org>; Wed, 16 Jul 2025 13:19:50 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=GOUFVzcb;
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 139.178.84.217 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org;
	dmarc=pass (policy=none) header.from=linuxfoundation.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C09A75C5B28;
	Wed, 16 Jul 2025 13:19:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EF85C4CEF0;
	Wed, 16 Jul 2025 13:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1752671989;
	bh=zFgwgl6z4iyOtfyd7QnV7un+bH7wT3Xti6zFMCCCxns=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GOUFVzcbo/Z/44ILa9WU/ns7xqBvsHjN8g6tQ+4mjDOO1mqBRRmrIdkiQhZq3f6wK
	 oKJdIk+sjY76o2jNZJ0/V3lj1zSG3MJH5Cxh/R3EzRLCQ9L/Ag6cxaaialUs9vuOq6
	 uQrh+pO4iAMa4TS3JVf6PXoRv30qtbMrPUvQTB4I=
Date: Wed, 16 Jul 2025 15:19:47 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Damien =?iso-8859-1?Q?Ri=E9gel?= <damien.riegel@silabs.com>
Message-ID: <2025071642-saline-concave-4ec0@gregkh>
References: <20250705004036.3828-1-damien.riegel@silabs.com>
 <20250705004036.3828-6-damien.riegel@silabs.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250705004036.3828-6-damien.riegel@silabs.com>
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 2FF1244AA2
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
	URIBL_BLOCKED(0.00)[dfw.source.kernel.org:rdns,dfw.source.kernel.org:helo];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+]
X-Rspamd-Action: no action
Message-ID-Hash: MWRWJZHHKQW6I6EI7VMKGAFTL72DMNOM
X-Message-ID-Hash: MWRWJZHHKQW6I6EI7VMKGAFTL72DMNOM
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org, linux-devel@silabs.com, Alex Elder <elder@kernel.org>, Johan Hovold <johan@kernel.org>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [RFC 5/6] greybus: match device with bundle ID
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/MWRWJZHHKQW6I6EI7VMKGAFTL72DMNOM/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 04, 2025 at 08:40:35PM -0400, Damien Ri=E9gel wrote:
> When matching a device, only the vendor ID and product ID are used.

It shouldn't be that way.  That was not the intention.

> As
> all bundles in an interface share the same VID and PID, there is no way
> to differentiate between two bundles, and they are forced to use the
> same driver.
>=20
> To allow using several vendor bundles in the same device, include the
> bundle ID when matching. The assumption here is that bundle IDs are
> stable across the lifespan of a product and never change.
>=20
> The goal of this change is to open the discussion. Greybus standardizes
> a bunch of protocols like GPIO, SPI, etc. but also has provisioning for
> vendor bundle and protocol. There is only one ID reserved for vendor,
> 0xFF, so the question is did Greybus ever envision supporting several
> vendor bundles, or one vendor bundle with several vendor cports in it?
> Or the assumption always was that there could be at most only vendor
> cport?

The goal was to emulate what USB does here.  If you have a
vendor-specific protocol, then set the vendor protocol id (0xff) and
then trigger off of the VID and PID.  Then you can do whatever you want
here in your driver as it's a vendor-specific one.

So you are wanting multiple devices with the same vid/pid yet do
different things?  Why not just change the PID?

Like with USB, a bundle id is not guaranteed to be "static", BUT if you
want to make that distinction in your driver that is a vendor-specific
one, go ahead.  Again, that should be like USB interface numbers, right?

thanks,

greg k-h
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
