Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C31933959
	for <lists+greybus-dev@lfdr.de>; Wed, 17 Jul 2024 10:46:10 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 1C66841117
	for <lists+greybus-dev@lfdr.de>; Wed, 17 Jul 2024 08:46:09 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	by lists.linaro.org (Postfix) with ESMTPS id 3B7F540D2C
	for <greybus-dev@lists.linaro.org>; Wed, 17 Jul 2024 08:46:05 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=EySruW8V;
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 145.40.73.55 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org;
	dmarc=pass (policy=none) header.from=linuxfoundation.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 404A8CE1685;
	Wed, 17 Jul 2024 08:46:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29322C32782;
	Wed, 17 Jul 2024 08:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1721205962;
	bh=CStO0mAdtwSErjeQnIFlbAPVyqbaLcPPt6Dyz9jjnBc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EySruW8VpxdzuTjivdsB2C6ch2FDE/+amFGWGARBRPx+XmbtOou93BSqt3OtdgvBO
	 DUlaepuTq6YuBGBzBbL91ivornqAPoaHHysUkxBMtP55LVHcV7bLKI7YqZimsJlohR
	 cAIQMhdIs6Xe/aRlUzIZne0KE/N6DyQ+EXyq6KRs=
Date: Wed, 17 Jul 2024 10:45:59 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Juan =?iso-8859-1?Q?Jos=E9?= Arboleda <soyjuanarbol@gmail.com>
Message-ID: <2024071723-nurture-magical-7817@gregkh>
References: <ZpdrmuzGgYDJ-Bb0@fedora>
 <2024071739-mollusk-uneaten-8dec@gregkh>
 <ZpeAsakTE0ZL90kt@fedora>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZpeAsakTE0ZL90kt@fedora>
X-Rspamd-Queue-Id: 3B7F540D2C
X-Spamd-Bar: /
X-Spamd-Result: default: False [0.50 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip4:145.40.73.55];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:54825, ipnet:145.40.73.0/24, country:US];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: MLNHS2H4SY6NTDL2OUNZ5DCHZZIGJGCT
X-Message-ID-Hash: MLNHS2H4SY6NTDL2OUNZ5DCHZZIGJGCT
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: johan@kernel.org, linux-staging@lists.linux.dev, trivial@kernel.org, greybus-dev@lists.linaro.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: Enclose multi-statement macro in do-while loop
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/MLNHS2H4SY6NTDL2OUNZ5DCHZZIGJGCT/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 17, 2024 at 03:28:33AM -0500, Juan Jos=E9 Arboleda wrote:
> On Wed, Jul 17, 2024 at 09:50:52AM +0200, Greg KH wrote:
> > On Wed, Jul 17, 2024 at 01:58:34AM -0500, Juan Jos=E9 Arboleda wrote:
> > > The macro `gb_loopback_stats_attrs` in the Greybus loopback driver
> > > contains multiple statements, which should be enclosed in a do-while
> > > loop to ensure proper execution and adhere to coding standards.
> > >=20
> > > This patch modifies the `gb_loopback_stats_attrs` macro to enclose
> > > its statements in a do-while loop, addressing the style error flagged
> > > by checkpatch.pl.
> > >=20
> > > Signed-off-by: Juan Jos=E9 Arboleda <soyjuanarbol@gmail.com>
> > > ---
> > >  drivers/staging/greybus/loopback.c | 8 +++++---
> > >  1 file changed, 5 insertions(+), 3 deletions(-)
> > >=20
> > > diff --git a/drivers/staging/greybus/loopback.c b/drivers/staging/gre=
ybus/loopback.c
> > > index 4313d3bbc23a..a97de86c67a5 100644
> > > --- a/drivers/staging/greybus/loopback.c
> > > +++ b/drivers/staging/greybus/loopback.c
> > > @@ -163,9 +163,11 @@ static ssize_t name##_avg_show(struct device *de=
v,		\
> > >  static DEVICE_ATTR_RO(name##_avg)
> > > =20
> > >  #define gb_loopback_stats_attrs(field)				\
> > > -	gb_loopback_ro_stats_attr(field, min, u);		\
> > > -	gb_loopback_ro_stats_attr(field, max, u);		\
> > > -	gb_loopback_ro_avg_attr(field)
> > > +	do {							\
> > > +		gb_loopback_ro_stats_attr(field, min, u);	\
> > > +		gb_loopback_ro_stats_attr(field, max, u);	\
> > > +		gb_loopback_ro_avg_attr(field);			\
> > > +	} while (0)
> > > =20
> > >  #define gb_loopback_attr(field, type)					\
> > >  static ssize_t field##_show(struct device *dev,				\
> >=20
> > Are you sure you test-built this change?
> >=20
> > thanks,
> >=20
> > greg k-h
>=20
> Yes! I build and clean and build and clean and build again, everything se=
ems
> fine from the compiler side and posttest task as well. Everything seems o=
k.

You did not actually build this file that you modified :(

Always test-build your changes.

thanks,

greg k-h
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
