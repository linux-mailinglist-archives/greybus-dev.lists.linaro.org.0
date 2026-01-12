Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 5793DD12754
	for <lists+greybus-dev@lfdr.de>; Mon, 12 Jan 2026 13:06:39 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 13EBD40153
	for <lists+greybus-dev@lfdr.de>; Mon, 12 Jan 2026 12:06:38 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by lists.linaro.org (Postfix) with ESMTPS id 5DE333F7E4
	for <greybus-dev@lists.linaro.org>; Mon, 12 Jan 2026 12:06:35 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=zvmIAfL8;
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 172.234.252.31 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org;
	dmarc=pass (policy=none) header.from=linuxfoundation.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A6F2544067;
	Mon, 12 Jan 2026 12:06:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33704C19421;
	Mon, 12 Jan 2026 12:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1768219594;
	bh=KoL6wLGvIN3bheovNrVrf6PCJ0OLgRaosPNzZmH8r4U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=zvmIAfL8nAETprF7UcHhIjPDIiTqoaRSCneJV4eIJ65TunTYE7Is/d+EIskdz6glS
	 stewL+mbacnbg/qqb+6kvWXqHIDIo0YUVxegobPkpiUvlJW0/mT63a5LXUkUo1139Y
	 +3Q4bg1FZ6JJk71yITIOee1V9LPTPmoejANcAHWk=
Date: Mon, 12 Jan 2026 13:06:31 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Message-ID: <2026011222-connector-cosigner-93c4@gregkh>
References: <20251210175943.590059-2-u.kleine-koenig@baylibre.com>
 <mgaxmjfozg4amxpiyv6vfhr6rd2hrafl2vppvij3febcn44nli@c3wedzb77xqv>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mgaxmjfozg4amxpiyv6vfhr6rd2hrafl2vppvij3febcn44nli@c3wedzb77xqv>
X-Rspamd-Queue-Id: 5DE333F7E4
X-Spamd-Bar: /
X-Spamd-Result: default: False [0.50 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	BAYES_HAM(-3.00)[99.99%];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.252.31];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	DWL_DNSWL_BLOCKED(0.00)[linuxfoundation.org:dkim];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DNSWL_BLOCKED(0.00)[100.75.92.58:received,172.234.252.31:from];
	RCPT_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[linuxfoundation.org:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: BRUVXZGMYIHYBDQJ2NAEGT5AX6T6KJ5E
X-Message-ID-Hash: BRUVXZGMYIHYBDQJ2NAEGT5AX6T6KJ5E
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] greybus: Use bus methods for .probe() and .remove()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/BRUVXZGMYIHYBDQJ2NAEGT5AX6T6KJ5E/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 12, 2026 at 12:58:02PM +0100, Uwe Kleine-K=F6nig wrote:
> Hello,
>=20
> On Wed, Dec 10, 2025 at 06:59:39PM +0100, Uwe Kleine-K=F6nig wrote:
> > These are nearly identical to the respective driver callbacks. The only
> > difference is that .remove() returns void instead of int.
> >=20
> > The objective is to get rid of users of struct device_driver callbacks
> > .probe() and .remove() to eventually remove these.
> >=20
> > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>
>=20
> gentle ping. Who is supposed to pick this patch up (or criticize it)?

That's me, my queue is huge, sorry...
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
