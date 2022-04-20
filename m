Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 06844508315
	for <lists+greybus-dev@lfdr.de>; Wed, 20 Apr 2022 10:01:52 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 345DC3EF55
	for <lists+greybus-dev@lfdr.de>; Wed, 20 Apr 2022 08:01:51 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	by lists.linaro.org (Postfix) with ESMTPS id 824F13EF55
	for <greybus-dev@lists.linaro.org>; Wed, 20 Apr 2022 08:01:48 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0C4AF61755;
	Wed, 20 Apr 2022 08:01:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 477A7C385A0;
	Wed, 20 Apr 2022 08:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1650441707;
	bh=Ge7E9HICwWwQG131Jf3ckANSQzLOy8iKlQ7ubnvSwOE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JeS89kslXNeoe/14aNyZVhJNwoHZm7zO/0Qe4YxeS5ihEUYcUZBsaCF4mp/zu44jS
	 ndMvssJfmJ9NDK3dZYYBR2uHzoWQOOY3BQK2lHTPNY16I9OODhd0H9ueB77dYkYesM
	 vH1SrAc4BF/gJE0NjoJuulld6oUXfnmCDexHnc2NyK/Np+2O7Mw9mmbFFW2vrTNqVL
	 lgBKnwj46pTrvcJTRbGkt8VrN5Lkdr3a23ezVilfISqvfnZ0iVJG67QhRqXy7xw9Gj
	 iwr2og4EHlQ1GjqAQ6g/AAGaaM3zjh/K4yaaUtp7jZvSHD1tkoBYWccyyH7JWBwy0I
	 COxD2cbd1Qt4A==
Received: from johan by xi.lan with local (Exim 4.94.2)
	(envelope-from <johan@kernel.org>)
	id 1nh5HP-0006ca-HS; Wed, 20 Apr 2022 10:01:39 +0200
Date: Wed, 20 Apr 2022 10:01:39 +0200
From: Johan Hovold <johan@kernel.org>
To: cgel.zte@gmail.com
Message-ID: <Yl+948unOoDFdLe2@hovoldconsulting.com>
References: <20220420030658.2575942-1-chi.minghao@zte.com.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220420030658.2575942-1-chi.minghao@zte.com.cn>
Message-ID-Hash: PCH55WGPBOOE554XKTI2OO3NUJC45JLR
X-Message-ID-Hash: PCH55WGPBOOE554XKTI2OO3NUJC45JLR
X-MailFrom: johan@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: elder@kernel.org, greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org, Minghao Chi <chi.minghao@zte.com.cn>, Zeal Robot <zealci@zte.com.cn>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] greybus: using pm_runtime_resume_and_get to simplify the code
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/PCH55WGPBOOE554XKTI2OO3NUJC45JLR/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Apr 20, 2022 at 03:06:58AM +0000, cgel.zte@gmail.com wrote:
> From: Minghao Chi <chi.minghao@zte.com.cn>

Why are you sending patches from a random non-personal gmail address?

> Using pm_runtime_resume_and_get() to replace pm_runtime_get_sync and
> pm_runtime_put_noidle. This change is just to simplify the code, no
> actual functional changes.
> 
> Reported-by: Zeal Robot <zealci@zte.com.cn>

And why is this here?

> Signed-off-by: Minghao Chi <chi.minghao@zte.com.cn>
> ---
>  drivers/greybus/core.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/greybus/core.c b/drivers/greybus/core.c
> index e546c6431877..434aa5d9dd47 100644
> --- a/drivers/greybus/core.c
> +++ b/drivers/greybus/core.c
> @@ -174,11 +174,9 @@ static int greybus_probe(struct device *dev)
>  	if (!id)
>  		return -ENODEV;
>  
> -	retval = pm_runtime_get_sync(&bundle->intf->dev);
> -	if (retval < 0) {
> -		pm_runtime_put_noidle(&bundle->intf->dev);
> +	retval = pm_runtime_resume_and_get(&bundle->intf->dev);
> +	if (retval < 0)
>  		return retval;
> -	}

NAK.

Greybus is using the pm_runtime_get_sync() consistently and mixing it up
with the new helper that uses a different naming scheme is just
confusing.

Use the new helper for your own code if you prefer, but there's really
no need to go around submitting this automatic conversions for code
that's already in the tree.

>  	retval = gb_control_bundle_activate(bundle->intf->control, bundle->id);
>  	if (retval) {

Johan
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
