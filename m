Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D020B0540D
	for <lists+greybus-dev@lfdr.de>; Tue, 15 Jul 2025 10:05:38 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id CA3C6440EB
	for <lists+greybus-dev@lfdr.de>; Tue, 15 Jul 2025 08:05:36 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	by lists.linaro.org (Postfix) with ESMTPS id 1FB04440EB
	for <greybus-dev@lists.linaro.org>; Tue, 15 Jul 2025 08:05:34 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=AT1dOuif;
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 139.178.84.217 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org;
	dmarc=pass (policy=none) header.from=linuxfoundation.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 898005C58D2;
	Tue, 15 Jul 2025 08:05:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD68EC4CEE3;
	Tue, 15 Jul 2025 08:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1752566733;
	bh=KuLjHZFy6jp55nnqajTexY8+wReRQgnYu1xerCHVT3E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AT1dOuifk4hg+z8o7oX3gqmo0arWBWuUb4bAYCNSsO2LF+A508K6Kpo5r99YW7fX4
	 8d3BX4yqrJoGXEu+o+Nc5605ZnvlbVih6l0M7vrDejBtBL4363s5FoXAj1HNEZxdid
	 mQ7zVLUmtVg1wrLgytcZZE+5xLThoJ191ojcck9o=
Date: Tue, 15 Jul 2025 10:05:30 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Rui Miguel Silva <rmfrfs@gmail.com>
Message-ID: <2025071540-sepia-amuck-c757@gregkh>
References: <20250714135606.41671-1-akhilvarkey@disroot.org>
 <DBBXCAEMM5ZO.GTKVMMR2XDJ7@linaro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DBBXCAEMM5ZO.GTKVMMR2XDJ7@linaro.com>
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 1FB04440EB
X-Spamd-Bar: /
X-Spamd-Result: default: False [0.50 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	BAYES_HAM(-3.00)[99.99%];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip4:139.178.84.217];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DWL_DNSWL_BLOCKED(0.00)[linuxfoundation.org:dkim];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:15830, ipnet:139.178.80.0/21, country:NL];
	FREEMAIL_TO(0.00)[gmail.com];
	URIBL_BLOCKED(0.00)[linuxfoundation.org:dkim];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_TLS_LAST(0.00)[];
	DNSWL_BLOCKED(0.00)[139.178.84.217:from];
	DKIM_TRACE(0.00)[linuxfoundation.org:+]
X-Rspamd-Action: no action
Message-ID-Hash: H4Z7IY7EG7HFRKGU2AXVO46I3BAJL3QW
X-Message-ID-Hash: H4Z7IY7EG7HFRKGU2AXVO46I3BAJL3QW
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Akhil Varkey <akhilvarkey@disroot.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, johan@kernel.org, elder@kernel.org, ~lkcamp/patches@lists.sr.ht, koike@igalia.com
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: power_supply fix alignment
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/H4Z7IY7EG7HFRKGU2AXVO46I3BAJL3QW/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Jul 14, 2025 at 05:38:31PM +0100, Rui Miguel Silva wrote:
> Hey Akhil,
> Thanks for your patch.
> 
> All looks good with the exception of a small nit...
> 
> On Mon Jul 14, 2025 at 2:56 PM WEST, Akhil Varkey wrote:
> 
> > Fix checkpatch check "CHECK:Alignment should match open parenthesis"
> >
> > Signed-off-by: Akhil Varkey <akhilvarkey@disroot.org>
> > ---
> >
> > Hello, This is my first patch, I appreciate any feedbacks. Thanks!!
> 
> Welcome, and continue...
> 
> > ---
> >  drivers/staging/greybus/power_supply.c | 14 +++++++-------
> >  1 file changed, 7 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/staging/greybus/power_supply.c b/drivers/staging/greybus/power_supply.c
> > index 2ef46822f676..a484c0ca058d 100644
> > --- a/drivers/staging/greybus/power_supply.c
> > +++ b/drivers/staging/greybus/power_supply.c
> > @@ -324,7 +324,7 @@ static struct gb_power_supply_prop *get_psy_prop(struct gb_power_supply *gbpsy,
> >  }
> >  
> >  static int is_psy_prop_writeable(struct gb_power_supply *gbpsy,
> > -				     enum power_supply_property psp)
> > +				 enum power_supply_property psp)
> >  {
> >  	struct gb_power_supply_prop *prop;
> >  
> > @@ -493,7 +493,7 @@ static int gb_power_supply_description_get(struct gb_power_supply *gbpsy)
> >  	if (!gbpsy->model_name)
> >  		return -ENOMEM;
> >  	gbpsy->serial_number = kstrndup(resp.serial_number, PROP_MAX,
> > -				       GFP_KERNEL);
> > +					GFP_KERNEL);
> >  	if (!gbpsy->serial_number)
> >  		return -ENOMEM;
> >  
> > @@ -546,7 +546,7 @@ static int gb_power_supply_prop_descriptors_get(struct gb_power_supply *gbpsy)
> >  	}
> >  
> >  	gbpsy->props = kcalloc(gbpsy->properties_count, sizeof(*gbpsy->props),
> > -			      GFP_KERNEL);
> > +			       GFP_KERNEL);
> >  	if (!gbpsy->props) {
> >  		ret = -ENOMEM;
> >  		goto out_put_operation;
> > @@ -634,8 +634,8 @@ static int __gb_power_supply_property_get(struct gb_power_supply *gbpsy,
> >  }
> >  
> >  static int __gb_power_supply_property_strval_get(struct gb_power_supply *gbpsy,
> > -						enum power_supply_property psp,
> > -						union power_supply_propval *val)
> > +						 enum power_supply_property psp,
> > +						 union power_supply_propval *val)
> 
> Here you fix the alignment, but the last line goes over column 81, even
> though 80 is not really one hard requirement anymore, all code
> (strings is ok to go over to be easier to grep for messages) is on that
> register.
> 
> So, to be coherent, if you could please send a V2 without this specific change
> would be great, Or even better, if you could get rid of all the _ and __
> prefixes in functions names that would be great, and will give more
> space for function paramethers.
> Your call.

Nah, this is fine as-is, we can go over the limit to 100 for tiny stuff
like this.

And the __ prefixes should be there to show no locking, or "internal"
functions, right?  So changing the name needs to happen very carefully.

thanks,

greg k-h
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
