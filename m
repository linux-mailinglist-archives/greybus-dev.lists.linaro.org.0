Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id F12F260006D
	for <lists+greybus-dev@lfdr.de>; Sun, 16 Oct 2022 17:10:25 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 09EA63EF69
	for <lists+greybus-dev@lfdr.de>; Sun, 16 Oct 2022 15:10:25 +0000 (UTC)
Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	by lists.linaro.org (Postfix) with ESMTPS id 30C453EEBC
	for <greybus-dev@lists.linaro.org>; Sun, 16 Oct 2022 15:10:19 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=inria.fr header.s=dc header.b=UmI8wDEH;
	spf=pass (lists.linaro.org: domain of julia.lawall@inria.fr designates 192.134.164.104 as permitted sender) smtp.mailfrom=julia.lawall@inria.fr;
	dmarc=pass (policy=none) header.from=inria.fr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=XPhph1rFmRrdCiz77L1yEGfSbOW/K5zr5aPjTTaVh9Q=;
  b=UmI8wDEHtXxMe8bPZKCUaYwlYmIG4/TIXOt7IOieQvYOTh3D3gTt7EJe
   Ob8ETA8jE3UlWDSjMhnZvuOrCyTQ5HPDlV4TWs0JjkDI1MaUcFDp+qkeC
   v4RLaBsn2M2AdaRW6vPy0ksxul6jKJ7xZhAigGUHS9egioBabk4ktR60A
   w=;
X-IronPort-AV: E=Sophos;i="5.95,189,1661810400";
   d="scan'208";a="31574597"
Received: from 51.123.68.85.rev.sfr.net (HELO hadrien) ([85.68.123.51])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2022 17:10:17 +0200
Date: Sun, 16 Oct 2022 17:10:17 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Deepak R Varma <drv@mailo.com>
In-Reply-To: <Y0wdDTUBrUT/cr9w@lion2204>
Message-ID: <alpine.DEB.2.22.394.2210161709440.2876@hadrien>
References: <Y0wS4HQo9m/W/TrQ@debian-BULLSEYE-live-builder-AMD64> <alpine.DEB.2.22.394.2210161649400.2876@hadrien> <Y0wdDTUBrUT/cr9w@lion2204>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
X-Rspamd-Server: lists.linaro.org
X-Spamd-Bar: ---
X-Rspamd-Queue-Id: 30C453EEBC
X-Spamd-Result: default: False [-3.60 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	DMARC_POLICY_ALLOW(-0.50)[inria.fr,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:192.134.164.0/24];
	R_DKIM_ALLOW(-0.20)[inria.fr:s=dc];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[192.134.164.104:from];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:2200, ipnet:192.134.164.0/24, country:FR];
	FROM_EQ_ENVFROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.950];
	ARC_NA(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	DKIM_TRACE(0.00)[inria.fr:+]
Message-ID-Hash: RR5MQIUALDMV5YNQHJ5ZDMEIG4OYXASI
X-Message-ID-Hash: RR5MQIUALDMV5YNQHJ5ZDMEIG4OYXASI
X-MailFrom: julia.lawall@inria.fr
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: outreachy@lists.linux.dev, johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: loopback: enclose macro statements in do-while loop
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/RR5MQIUALDMV5YNQHJ5ZDMEIG4OYXASI/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On Sun, 16 Oct 2022, Deepak R Varma wrote:

> On Sun, Oct 16, 2022 at 04:51:09PM +0200, Julia Lawall wrote:
> >
> >
> > On Sun, 16 Oct 2022, Deepak R Varma wrote:
> >
> > > Include multiple statements of macro definition inside do-while{0} loop
> > > to avoid possible partial program execution. Issue reported by
> > > checkpatch script:
> > >
> > > ERROR: Macros with multiple statements should be enclosed in a do - while loop
> >
> > I don't think this change will compile.  See if you can figure out why
> > not.
>
> It did compile. I built the greybus driver and loaded it as well with the
> modinfo tool. Can you please tell why you think it won't compile?

Do you have a .o file for the .c file that you changed?

julia

>
> ./drv
>
> >
> > julia
> >
> > >
> > > Signed-off-by: Deepak R Varma <drv@mailo.com>
> > > ---
> > >  drivers/staging/greybus/loopback.c | 4 +++-
> > >  1 file changed, 3 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/staging/greybus/loopback.c b/drivers/staging/greybus/loopback.c
> > > index 1a61fce98056..37214cb43937 100644
> > > --- a/drivers/staging/greybus/loopback.c
> > > +++ b/drivers/staging/greybus/loopback.c
> > > @@ -163,9 +163,11 @@ static ssize_t name##_avg_show(struct device *dev,		\
> > >  static DEVICE_ATTR_RO(name##_avg)
> > >
> > >  #define gb_loopback_stats_attrs(field)				\
> > > +do {								\
> > >  	gb_loopback_ro_stats_attr(field, min, u);		\
> > >  	gb_loopback_ro_stats_attr(field, max, u);		\
> > > -	gb_loopback_ro_avg_attr(field)
> > > +	gb_loopback_ro_avg_attr(field);				\
> > > +} while (0)
> > >
> > >  #define gb_loopback_attr(field, type)					\
> > >  static ssize_t field##_show(struct device *dev,				\
> > > --
> > > 2.30.2
> > >
> > >
> > >
> > >
> > >
>
>
>
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
