Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id C0C136004A8
	for <lists+greybus-dev@lfdr.de>; Mon, 17 Oct 2022 03:03:29 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id BD9B43ECD4
	for <lists+greybus-dev@lfdr.de>; Mon, 17 Oct 2022 01:03:28 +0000 (UTC)
Received: from msg-4.mailo.com (msg-4.mailo.com [213.182.54.15])
	by lists.linaro.org (Postfix) with ESMTPS id D08FB3EEBC
	for <greybus-dev@lists.linaro.org>; Sun, 16 Oct 2022 15:03:03 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=mailo.com header.s=mailo header.b=owbrKLFc;
	spf=pass (lists.linaro.org: domain of drv@mailo.com designates 213.182.54.15 as permitted sender) smtp.mailfrom=drv@mailo.com;
	dmarc=pass (policy=none) header.from=mailo.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
	t=1665932561; bh=Wg6GtD2ZzWSQ6Z/hu/RF4EtKjefFvDhYKsRPqn3anp8=;
	h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:In-Reply-To;
	b=owbrKLFcrfJU1G2j85Nua7FP6V3CtoEzK7eF1zqSaJJYW/5am+6bfbO2b9x9tiXsu
	 5MMHc0NmzHGZm8PwiDcTCaYUAMYaXi29SxuwflrlniN24E8Lx98s469JSWmqJmZK4X
	 9qSjCB5IOHQH8FMpoKO5GgFkb6dj7DtdNRJLFeVE=
Received: by b-3.in.mailobj.net [192.168.90.13] with ESMTP
	via [213.182.55.206]
	Sun, 16 Oct 2022 17:02:41 +0200 (CEST)
X-EA-Auth: rqDcTQj11g/+I1KNqnWV0ELN5Jcrvy5Et74Xab4CYIiKU78hFJPEs2s2evli4I6kFMQfPGQEIwwtuOW6X69I1t0TYIa33UtB
Date: Sun, 16 Oct 2022 20:32:37 +0530
From: Deepak R Varma <drv@mailo.com>
To: Julia Lawall <julia.lawall@inria.fr>
Message-ID: <Y0wdDTUBrUT/cr9w@lion2204>
References: <Y0wS4HQo9m/W/TrQ@debian-BULLSEYE-live-builder-AMD64>
 <alpine.DEB.2.22.394.2210161649400.2876@hadrien>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2210161649400.2876@hadrien>
X-Rspamd-Server: lists.linaro.org
X-Spamd-Bar: -------
X-Rspamd-Queue-Id: D08FB3EEBC
X-Spamd-Result: default: False [-7.50 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	DMARC_POLICY_ALLOW(-0.50)[mailo.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[mailo.com:s=mailo];
	R_SPF_ALLOW(-0.20)[+ip4:213.182.54.0/24];
	MIME_GOOD(-0.10)[text/plain];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:8304, ipnet:213.182.32.0/19, country:FR];
	FROM_EQ_ENVFROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.950];
	RCPT_COUNT_SEVEN(0.00)[9];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[mailo.com:+]
X-MailFrom: drv@mailo.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: JAVMZMESVORMHABNLXTGD3GL7CBWWIBM
X-Message-ID-Hash: JAVMZMESVORMHABNLXTGD3GL7CBWWIBM
X-Mailman-Approved-At: Mon, 17 Oct 2022 01:03:17 +0000
CC: outreachy@lists.linux.dev, johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: loopback: enclose macro statements in do-while loop
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/JAVMZMESVORMHABNLXTGD3GL7CBWWIBM/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, Oct 16, 2022 at 04:51:09PM +0200, Julia Lawall wrote:
>
>
> On Sun, 16 Oct 2022, Deepak R Varma wrote:
>
> > Include multiple statements of macro definition inside do-while{0} loop
> > to avoid possible partial program execution. Issue reported by
> > checkpatch script:
> >
> > ERROR: Macros with multiple statements should be enclosed in a do - while loop
>
> I don't think this change will compile.  See if you can figure out why
> not.

It did compile. I built the greybus driver and loaded it as well with the
modinfo tool. Can you please tell why you think it won't compile?

./drv

>
> julia
>
> >
> > Signed-off-by: Deepak R Varma <drv@mailo.com>
> > ---
> >  drivers/staging/greybus/loopback.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/staging/greybus/loopback.c b/drivers/staging/greybus/loopback.c
> > index 1a61fce98056..37214cb43937 100644
> > --- a/drivers/staging/greybus/loopback.c
> > +++ b/drivers/staging/greybus/loopback.c
> > @@ -163,9 +163,11 @@ static ssize_t name##_avg_show(struct device *dev,		\
> >  static DEVICE_ATTR_RO(name##_avg)
> >
> >  #define gb_loopback_stats_attrs(field)				\
> > +do {								\
> >  	gb_loopback_ro_stats_attr(field, min, u);		\
> >  	gb_loopback_ro_stats_attr(field, max, u);		\
> > -	gb_loopback_ro_avg_attr(field)
> > +	gb_loopback_ro_avg_attr(field);				\
> > +} while (0)
> >
> >  #define gb_loopback_attr(field, type)					\
> >  static ssize_t field##_show(struct device *dev,				\
> > --
> > 2.30.2
> >
> >
> >
> >
> >


_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
