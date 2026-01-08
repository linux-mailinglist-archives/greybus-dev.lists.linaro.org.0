Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F9FCD022FC
	for <lists+greybus-dev@lfdr.de>; Thu, 08 Jan 2026 11:46:34 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 608E240149
	for <lists+greybus-dev@lfdr.de>; Thu,  8 Jan 2026 10:46:33 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by lists.linaro.org (Postfix) with ESMTPS id F13FD3F779
	for <greybus-dev@lists.linaro.org>; Thu,  8 Jan 2026 10:46:29 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=1U9pnynJ;
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 172.234.252.31 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org;
	dmarc=pass (policy=none) header.from=linuxfoundation.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 59A6344397;
	Thu,  8 Jan 2026 10:46:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0AC9C116C6;
	Thu,  8 Jan 2026 10:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1767869189;
	bh=ffL7OckPnkAqROe4W0fLxVBdeQh1mt1C5mLWdRdw/js=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=1U9pnynJC9/un5w03XZGq7nj7/Fstw+xP4W5hoQqMBhVkvM2g6Q+rBRFj/EaaO+lP
	 MlRrAaLpf9nMbO79QGsh/k73UjUPlfRbrK86dT7ApNgCRAnAWZjTlqejXbmbyelHFZ
	 V5CQN+XNROkCFbJAaYZcijMtu19PCXvfxNhSvGY4=
Date: Thu, 8 Jan 2026 11:46:26 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Chaitanya Mishra <chaitanyamishra.ai@gmail.com>
Message-ID: <2026010814-displease-jawed-688e@gregkh>
References: <20260108103700.15384-1-chaitanyamishra.ai@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260108103700.15384-1-chaitanyamishra.ai@gmail.com>
X-Rspamd-Queue-Id: F13FD3F779
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
	DNSWL_BLOCKED(0.00)[172.234.252.31:from,100.75.92.58:received];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,lists.linaro.org,lists.linux.dev,vger.kernel.org];
	DWL_DNSWL_BLOCKED(0.00)[linuxfoundation.org:dkim];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[linuxfoundation.org:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: XZWZ362EUZ4YVXT4BN7LML7KOBWJ6YC2
X-Message-ID-Hash: XZWZ362EUZ4YVXT4BN7LML7KOBWJ6YC2
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: lights: avoid NULL deref
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/XZWZ362EUZ4YVXT4BN7LML7KOBWJ6YC2/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Jan 08, 2026 at 04:07:00PM +0530, Chaitanya Mishra wrote:
> gb_lights_light_config() stores channel_count before allocating the
> channels array. If kcalloc() fails, gb_lights_release() iterates the
> non-zero count and dereferences light->channels, which is NULL.
> 
> Allocate channels first and only then publish channels_count so the
> cleanup path can't walk a NULL pointer.

How was this issue found?  How was the fix generated?  How was it
tested?

> 
> Fixes: 2870b52bae4c ("greybus: lights: add lights implementation")
> Signed-off-by: Chaitanya Mishra <chaitanyamishra.ai@gmail.com>
> ---
>  drivers/staging/greybus/light.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/greybus/light.c b/drivers/staging/greybus/light.c
> index e509fdc715db..4c9ad9ea8827 100644
> --- a/drivers/staging/greybus/light.c
> +++ b/drivers/staging/greybus/light.c
> @@ -1008,14 +1008,14 @@ static int gb_lights_light_config(struct gb_lights *glights, u8 id)
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
> +	light->channels_count = conf.channel_count;

This is "tricky", perhaps add a comment here as to why you are only
assigning this now and not before?

thanks,

greg k-h
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
