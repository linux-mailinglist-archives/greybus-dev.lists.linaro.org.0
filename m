Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sMMrKf+oeWl/yQEAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Wed, 28 Jan 2026 07:13:19 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 298AE9D5BD
	for <lists+greybus-dev@lfdr.de>; Wed, 28 Jan 2026 07:13:19 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 3146340140
	for <lists+greybus-dev@lfdr.de>; Wed, 28 Jan 2026 06:04:48 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by lists.linaro.org (Postfix) with ESMTPS id A81303F722
	for <greybus-dev@lists.linaro.org>; Wed, 28 Jan 2026 06:04:44 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=hTNRGGAA;
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 172.105.4.254 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org;
	dmarc=pass (policy=none) header.from=linuxfoundation.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1A5F46001A;
	Wed, 28 Jan 2026 06:04:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41ADEC4CEF1;
	Wed, 28 Jan 2026 06:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1769580283;
	bh=1WSOXaTp3vSzGanQPvZAVSjeBc5Nczm4ReVDE1uCIzs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hTNRGGAAnPFOkmaPnEhb6GmnPzov4obSQRxDvLplsuac1YTZLdElO+Gmm2mKi6v53
	 6u067O3Ynsb4sYcJNSV2ax9rXRoWe3c6/mKh4qK+tzDkKkK5EAnS+rTbwnQhZThlPt
	 N1SF7+5PFqnD2Gb8LXKFgACJ9eGbg3KMGLpvE6Ao=
Date: Wed, 28 Jan 2026 07:04:40 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Damien =?iso-8859-1?Q?Ri=E9gel?= <damien.riegel@silabs.com>
Message-ID: <2026012834-parrot-schilling-d4b0@gregkh>
References: <20251223183142.31897-1-damien.riegel@silabs.com>
 <2026011606-qualified-dental-bef0@gregkh>
 <DFZNI1DOAZDK.H9BJA23QFFSG@silabs.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DFZNI1DOAZDK.H9BJA23QFFSG@silabs.com>
X-Spamd-Bar: /
Message-ID-Hash: YTXA7WAVB45U7PSXXHVHS44W6QHW7KCO
X-Message-ID-Hash: YTXA7WAVB45U7PSXXHVHS44W6QHW7KCO
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, linux-devel@silabs.com
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 0/8] greybus: support point-to-point topology
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/YTXA7WAVB45U7PSXXHVHS44W6QHW7KCO/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [5.09 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	R_DKIM_REJECT(1.00)[linuxfoundation.org:s=korg];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+mx];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[linuxfoundation.org : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	GREYLIST(0.00)[pass,body];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:-];
	RCPT_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-0.999];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,greybus-dev-bounces@lists.linaro.org];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	TAGGED_RCPT(0.00)[greybus-dev];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,lists.linaro.org:helo,lists.linaro.org:rdns]
X-Rspamd-Queue-Id: 298AE9D5BD
X-Rspamd-Action: no action

On Tue, Jan 27, 2026 at 03:23:44PM -0500, Damien Ri=E9gel wrote:
> On Fri Jan 16, 2026 at 10:09 AM EST, Greg Kroah-Hartman wrote:
> [...]
>=20
> >>
> >> The SVC doesn' really serve a purpose here, as there is no bus to
> >> manage, and adding its support only increase the complexity and the co=
de
> >> size needed on memory-constrained devices.
> >
> > Exactly how much memory does a "single point" SVC driver take, vs.
> > adding new P2P functionality everywhere in the code like you just did?
> > Finding that out would be good first before worrying about adding
> > another type of "bus" here please.
>=20
> Sorry for not giving numbers in the cover letter. We measured 10kB of
> code size difference (which may be on the higher end of the spectrum)
> and in Zephyr [1] they measured a 2kB difference (which is probably on
> the lower end considering the implementation is pretty barebone).

Please submit your "empty" SVC driver, 10kb seems too big to me, I think
we can slim it down, or at the very least, see what is making it "large"
and potentially work to reduce that.

For Zephyr, I thought it was 1kb in the github comments, but still 2kb
seems reasonable :)

thanks,

greg k-h
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
