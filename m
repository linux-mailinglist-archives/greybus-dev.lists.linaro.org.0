Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id BC5FED02442
	for <lists+greybus-dev@lfdr.de>; Thu, 08 Jan 2026 12:02:02 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id C3D8A40149
	for <lists+greybus-dev@lfdr.de>; Thu,  8 Jan 2026 11:02:01 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by lists.linaro.org (Postfix) with ESMTPS id 26CFE3F776
	for <greybus-dev@lists.linaro.org>; Thu,  8 Jan 2026 11:01:59 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=XD+I3PMF;
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 172.234.252.31 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org;
	dmarc=pass (policy=none) header.from=linuxfoundation.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8AC5A43719;
	Thu,  8 Jan 2026 11:01:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA006C116C6;
	Thu,  8 Jan 2026 11:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1767870118;
	bh=98AybA5x735gNEPlDPJLZLJcyS7t3JthzWn2wlLk7wo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XD+I3PMFWGNu3dPGQ77m9PZUOzR+zvbRproCO38zGfdJJ3qE6aabe/xhG3pM27hOT
	 5DSNKFZagZSOmLMP7rcLZH2qwd2ZZ46JCkxL45znlVqpXoyq8kQseibEqj4bjWzIL2
	 KiwhWTBCnbfB92HWb1C0dsG0QrQjCZN9r6i21b18=
Date: Thu, 8 Jan 2026 12:01:55 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Chaitanya Mishra <chaitanyamishra.ai@gmail.com>
Message-ID: <2026010842-disown-reminder-752d@gregkh>
References: <20260108103700.15384-1-chaitanyamishra.ai@gmail.com>
 <20260108104947.23767-1-chaitanyamishra.ai@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260108104947.23767-1-chaitanyamishra.ai@gmail.com>
X-Rspamd-Queue-Id: 26CFE3F776
X-Spamd-Bar: /
X-Spamd-Result: default: False [0.50 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	BAYES_HAM(-3.00)[99.99%];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.252.31];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,lists.linaro.org,lists.linux.dev,vger.kernel.org];
	URIBL_BLOCKED(0.00)[conf.name:url,gregkh:mid,sea.source.kernel.org:helo,sea.source.kernel.org:rdns,linuxfoundation.org:dkim,linuxfoundation.org:from_smtp,linuxfoundation.org:from_mime];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: XP24U646VG65ZMAQMQAH634NXMMDNOXW
X-Message-ID-Hash: XP24U646VG65ZMAQMQAH634NXMMDNOXW
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v2] staging: greybus: lights: avoid NULL deref
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/XP24U646VG65ZMAQMQAH634NXMMDNOXW/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Jan 08, 2026 at 04:19:47PM +0530, Chaitanya Mishra wrote:
> gb_lights_light_config() stores channel_count before allocating the
> channels array. If kcalloc() fails, gb_lights_release() iterates the
> non-zero count and dereferences light->channels, which is NULL.
> 
> Allocate channels first and only then publish channels_count so the
> cleanup path can't walk a NULL pointer.
> 
> Fixes: 2870b52bae4c ("greybus: lights: add lights implementation")
> Signed-off-by: Chaitanya Mishra <chaitanyamishra.ai@gmail.com>
> ---
>  drivers/staging/greybus/light.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/greybus/light.c b/drivers/staging/greybus/light.c
> index e509fdc715db..38c233a706c4 100644
> --- a/drivers/staging/greybus/light.c
> +++ b/drivers/staging/greybus/light.c
> @@ -1008,14 +1008,18 @@ static int gb_lights_light_config(struct gb_lights *glights, u8 id)
>  	if (!strlen(conf.name))
>  		return -EINVAL;
>  
> -	light->channels_count = conf.channel_count;
>  	light->name = kstrndup(conf.name, NAMES_MAX, GFP_KERNEL);
>  	if (!light->name)
>  		return -ENOMEM;
> -	light->channels = kcalloc(light->channels_count,
> +	light->channels = kcalloc(conf.channel_count,
>  				  sizeof(struct gb_channel), GFP_KERNEL);
>  	if (!light->channels)
>  		return -ENOMEM;
> +	/*
> +	 * Publish channels_count only after channels allocation so cleanup
> +	 * doesn't walk a NULL channels pointer on allocation failure.
> +	 */
> +	light->channels_count = conf.channel_count;
>  
>  	/* First we collect all the configurations for all channels */
>  	for (i = 0; i < light->channels_count; i++) {
> -- 
> 2.50.1 (Apple Git-155)
> 

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- This looks like a new version of a previously submitted patch, but you
  did not list below the --- line any changes from the previous version.
  Please read the section entitled "The canonical patch format" in the
  kernel file, Documentation/process/submitting-patches.rst for what
  needs to be done here to properly describe this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
