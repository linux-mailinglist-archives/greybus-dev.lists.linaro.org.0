Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 91ECB6D3E03
	for <lists+greybus-dev@lfdr.de>; Mon,  3 Apr 2023 09:21:57 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 69C4D3ED7B
	for <lists+greybus-dev@lfdr.de>; Mon,  3 Apr 2023 07:21:56 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	by lists.linaro.org (Postfix) with ESMTPS id DF5573EA49
	for <greybus-dev@lists.linaro.org>; Mon,  3 Apr 2023 07:21:51 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=caWhFVlx;
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 139.178.84.217 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org;
	dmarc=pass (policy=none) header.from=linuxfoundation.org
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8684060472;
	Mon,  3 Apr 2023 07:21:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EBAAC433EF;
	Mon,  3 Apr 2023 07:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1680506510;
	bh=jYYQrfyfwF4ldZBvYJGRWqLHFtgAgWU3/+bwdD3kqFc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=caWhFVlxmWNdQ+ehy3O/F3pmSuUCMvdKU0utT4GFdZr+4GMnUuhO2MHzqXTHEnNmx
	 lfVeFe9z8gGs1B9N44zRgZIZ7xyO+CAPxgR+9qW0qeBxva4TreNP7ObhME6JemTd8i
	 zK1CI7NAQFk2fAyE4HV2I3U++OpE8uUJO18uPVRE=
Date: Mon, 3 Apr 2023 09:21:48 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Dan Carpenter <error27@gmail.com>
Message-ID: <2023040301-tapping-umbilical-f7b4@gregkh>
References: <20230402122550.70682-1-angelalbertoc.r@gmail.com>
 <2023040252-racoon-daintily-3589@gregkh>
 <0af15115-9641-a1c8-f398-c4e8e77379a3@gmail.com>
 <2cb170e2-3551-4f2a-9cd3-065d9bd4504b@kili.mountain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2cb170e2-3551-4f2a-9cd3-065d9bd4504b@kili.mountain>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: DF5573EA49
X-Spamd-Bar: /
X-Spamd-Result: default: False [0.00 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	RCVD_DKIM_ARC_DNSWL_HI(-1.00)[];
	RCVD_IN_DNSWL_HI(-1.00)[139.178.84.217:from,52.25.139.140:received];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:139.178.84.217];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MIME_GOOD(-0.10)[text/plain];
	TAGGED_RCPT(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,nexus-software.ie,kernel.org,lists.linaro.org,lists.linux.dev,vger.kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_TLS_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	ASN(0.00)[asn:54825, ipnet:139.178.80.0/21, country:US];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[8];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[]
Message-ID-Hash: H6HN5YVJEWHWRPSVMUW3BJH7ORVI4SZD
X-Message-ID-Hash: H6HN5YVJEWHWRPSVMUW3BJH7ORVI4SZD
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: =?iso-8859-1?Q?=C1ngel?= Alberto Carretero <angelalbertoc.r@gmail.com>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: loopback: fix up checkpath macro do while error.
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/H6HN5YVJEWHWRPSVMUW3BJH7ORVI4SZD/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 03, 2023 at 09:23:55AM +0300, Dan Carpenter wrote:
> On Sun, Apr 02, 2023 at 08:22:35PM +0200, =C1ngel Alberto Carretero wrote:
> >=20
> >=20
> > On 02/04/2023 15:16, Greg Kroah-Hartman wrote:
> > > On Sun, Apr 02, 2023 at 02:25:51PM +0200, Angel Alberto Carretero wro=
te:
> > > > Wrap macro in a do-while statement.
> > > >=20
> > > > Signed-off-by: Angel Alberto Carretero <angelalbertoc.r@gmail.com>
> > > > ---
> > > >   drivers/staging/greybus/loopback.c | 8 +++++---
> > > >   1 file changed, 5 insertions(+), 3 deletions(-)
> > > >=20
> > > > diff --git a/drivers/staging/greybus/loopback.c b/drivers/staging/g=
reybus/loopback.c
> > > > index d7b39f3bb652..371809770ed0 100644
> > > > --- a/drivers/staging/greybus/loopback.c
> > > > +++ b/drivers/staging/greybus/loopback.c
> > > > @@ -162,9 +162,11 @@ static ssize_t name##_avg_show(struct device *=
dev,		\
> > > >   static DEVICE_ATTR_RO(name##_avg)
> > > >   #define gb_loopback_stats_attrs(field)				\
> > > > -	gb_loopback_ro_stats_attr(field, min, u);		\
> > > > -	gb_loopback_ro_stats_attr(field, max, u);		\
> > > > -	gb_loopback_ro_avg_attr(field)
> > > > +	do {		\
> > > > +		gb_loopback_ro_stats_attr(field, min, u);		\
> > > > +		gb_loopback_ro_stats_attr(field, max, u);		\
> > > > +		gb_loopback_ro_avg_attr(field);		\
> > > > +	} while (0)
> > > >   #define gb_loopback_attr(field, type)					\
> > > >   static ssize_t field##_show(struct device *dev,				\
> > > > --=20
> > > > 2.40.0
> > > >=20
> > > >=20
> > >=20
> > > Any specific reason why you did not test build your change before
> > > submitting it?
> > >=20
> > > thanks,
> > >=20
> > > greg k-h
> >=20
> > Apologies, we can drop the patch. I was trying to find an error as part
> > of the eudyptula challenge and thought I was compiling the driver
> > correctly. Upon further examination, the macro cannot be written with a
> > do-while because it is defining functions.
>=20
> The "eudyptula challenge" and other first patch guides should be updated
> to tell people to search for their code on lore.kernel.org before
> sending a patch.

The "eudyptula challenge" is not currently running and has not been for
many years now so I do not know where the original poster got their
information from.

thanks,

greg k-h
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
