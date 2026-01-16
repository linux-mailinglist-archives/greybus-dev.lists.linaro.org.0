Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B1D3D33112
	for <lists+greybus-dev@lfdr.de>; Fri, 16 Jan 2026 16:09:30 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 8243C401B2
	for <lists+greybus-dev@lfdr.de>; Fri, 16 Jan 2026 15:09:28 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by lists.linaro.org (Postfix) with ESMTPS id 164393F6DD
	for <greybus-dev@lists.linaro.org>; Fri, 16 Jan 2026 15:09:24 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=M3ibkHnq;
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 172.234.252.31 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org;
	dmarc=pass (policy=none) header.from=linuxfoundation.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7540E4352E;
	Fri, 16 Jan 2026 15:09:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9E01C116C6;
	Fri, 16 Jan 2026 15:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1768576163;
	bh=oNE2dKlFJ63ad7ginHJHCdoW6/HCrltr5Mq2vPCToqw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M3ibkHnqqkwbo4xLmmVrjULUYNlR+JeQDH0neDzX97ssE8vCAnDjaaGJKQLPXIQD+
	 k67ds9UMqlL7wAAttHu2e4w09CztZM+/3pYEGeAnvUukLl3VTBctbVq66dm7ljIVQy
	 mfQEY/z4hu0ilDx//rQ12dnPuOzGxS7xqCETgdWM=
Date: Fri, 16 Jan 2026 16:09:20 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Damien =?iso-8859-1?Q?Ri=E9gel?= <damien.riegel@silabs.com>
Message-ID: <2026011606-qualified-dental-bef0@gregkh>
References: <20251223183142.31897-1-damien.riegel@silabs.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251223183142.31897-1-damien.riegel@silabs.com>
X-Rspamd-Queue-Id: 164393F6DD
X-Spamd-Bar: /
X-Spamd-Result: default: False [0.50 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	BAYES_HAM(-3.00)[99.99%];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.252.31];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	URIBL_BLOCKED(0.00)[gregkh:mid,linuxfoundation.org:dkim,linuxfoundation.org:from_smtp,linuxfoundation.org:from_mime];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: AWQXJ55UQPB6DB7SFKBCVGHZD4F3CEXL
X-Message-ID-Hash: AWQXJ55UQPB6DB7SFKBCVGHZD4F3CEXL
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, linux-devel@silabs.com
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 0/8] greybus: support point-to-point topology
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/AWQXJ55UQPB6DB7SFKBCVGHZD4F3CEXL/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 23, 2025 at 01:31:34PM -0500, Damien Ri=E9gel wrote:
> In a classic Greybus topology, there is an application processor, an
> SVC, and one or more modules, all connected to a UniPro bus. Most of the
> time, as the application processor doesn't have a UniPro interface, it
> is actually connected to a device acting as a bridge with the bus, and
> this bridge also acts as the SVC.
>=20
> Sometimes, there is no UniPro bus at all, like for the BeaglePlay, which
> has the following topology:
>=20
>     +----+                +------------+                    +--------+
>     | AP | <--- UART ---> | SVC/Bridge | <--- 802.15.4 ---> | Module |
>     +----+                +------------+                    +--------+
>                                 |
>                                 |                           +--------+
>                                 `------------ 802.15.4 ---> | Module |
>                                                             +--------+
>=20
> There are two main interesting aspects with Greybus:
>   - the SVC protocol to monitor and configure the bus
>   - other protocols, to expose module peripherals to the host
>=20
> When the bus has a single module connected directly to the AP, then this
> module must also implement the SVC protocol:
>=20
>                  +----+               +------------+
>                  | AP | <--- bus ---> | SVC/Module |
>                  +----+               +------------+
>=20
> The SVC doesn' really serve a purpose here, as there is no bus to
> manage, and adding its support only increase the complexity and the code
> size needed on memory-constrained devices.

Exactly how much memory does a "single point" SVC driver take, vs.
adding new P2P functionality everywhere in the code like you just did?
Finding that out would be good first before worrying about adding
another type of "bus" here please.

> The goal of this patchset is to let a single module expose some Greybus
> protocols without requiring the module to also implement SVC protocol.
> We call this mode "Point-To-Point". There are three main notable facts
> with the implementation of this patchset:
>=20
>   - most of the time, what this patchet does is just skipping calls that
>     issue commands to the SVC, as they are not applicable without an SVC

Great, make a SVC that just ignores them :)

>   - CPort ID allocation is a bit different as there is no SVC/Bridge to
>     do translation between AP address space and interface address space,
>     so the patchset forces allocation of AP CPort IDs that matches the
>     ones found in interface's manifest

Again, a simple SCV would make this not needed.

>   - enumeration of a module is normally started by a "Module Inserted"
>     event issued by the SVC. As the SVC is absent, the host device
>     driver must manually call a function to start the enumeration

I'd prefer again, to have that in the SVC you are using.

> We tested this patchset with the gb-beagleplay driver, slightly tweaked
> to only keep the HLDC over UART part of the driver, connected over UART
> to an EFR32MG24 running BeagleBoard's implementation of Greybus-Zephyr [1=
].
>=20
> In the discussion to integrate this module into Zephyr [2] (it's
> currently as separate module not part of the main Zephyr code base),
> there seems to be interest in being able to have a single-node
> device on the bus without SVC [3]. If some features that were
> implemented by the SVC are missing, we can consider adding more
> callbacks to the gb_hd_driver structure at a later time, and let drivers
> decide how they want to support these features.

I can understand if you want to be a greybus host running zephyr that
this might make sense, as it lets you not even have to write any SVC
logic, but for Linux here, I think the simplicity makes more sense (i.e.
everything goes through the same data paths, no multiple test paths that
need to always be exercised.)

So I'd prefer not to do this, just try to make a simple svc module and
see if that works instead.

thanks,

greg k-h
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
