Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FAAE588760
	for <lists+greybus-dev@lfdr.de>; Wed,  3 Aug 2022 08:30:40 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id EB446479A2
	for <lists+greybus-dev@lfdr.de>; Wed,  3 Aug 2022 06:30:38 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	by lists.linaro.org (Postfix) with ESMTPS id 01A2D3EF0D
	for <greybus-dev@lists.linaro.org>; Wed,  3 Aug 2022 06:30:37 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 92D16614C7;
	Wed,  3 Aug 2022 06:30:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E399C433D6;
	Wed,  3 Aug 2022 06:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1659508236;
	bh=uRiFD4YkF3E1o4CEeQJKWDz+kcz0iU4N40GXcvKkJec=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pVLnA6aVgSIxEDyB653YdR2hEn2+osHv2mIR9xkaPNhXk+Au8W4iuxA1fgukQlMwJ
	 G2s+8yWQXRtd7TmeMcRJvFFqxc4xc5OASyevz8Tu5XcHNfJRqM8iVmNgo93lJhhh1f
	 vmjYO7pOFv3+ejbQ9l7hNAIRFNdbLVGHmmVPKOCk=
Date: Wed, 3 Aug 2022 08:30:33 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: cgel.zte@gmail.com
Message-ID: <YuoWCSQCnNU3DrUL@kroah.com>
References: <20220803062258.1650792-1-ye.xingchen@zte.com.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220803062258.1650792-1-ye.xingchen@zte.com.cn>
Message-ID-Hash: T2KWL3PTPWKY6CM2RJUODSTA7ZTI2Y6X
X-Message-ID-Hash: T2KWL3PTPWKY6CM2RJUODSTA7ZTI2Y6X
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: linux-kernel@vger.kernel.org, greybus-dev@lists.linaro.org, ye xingchen <ye.xingchen@zte.com.cn>, Zeal Robot <zealci@zte.com.cn>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH linux-next] staging: greybus:using the
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/T2KWL3PTPWKY6CM2RJUODSTA7ZTI2Y6X/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Aug 03, 2022 at 06:22:58AM +0000, cgel.zte@gmail.com wrote:
> From: ye xingchen <ye.xingchen@zte.com.cn>
> 
> Using pm_runtime_resume_and_get() to instade of  pm_runtime_get_sync
> and pm_runtime_put_noidle.
> 
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: ye xingchen <ye.xingchen@zte.com.cn>
> ---
>  drivers/greybus/core.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/greybus/core.c b/drivers/greybus/core.c
> index e546c6431877..b9063e86534b 100644
> --- a/drivers/greybus/core.c
> +++ b/drivers/greybus/core.c
> @@ -174,9 +174,8 @@ static int greybus_probe(struct device *dev)
>  	if (!id)
>  		return -ENODEV;
>  
> -	retval = pm_runtime_get_sync(&bundle->intf->dev);
> +	retval = pm_runtime_resume_and_get(&bundle->intf->dev);
>  	if (retval < 0) {
> -		pm_runtime_put_noidle(&bundle->intf->dev);
>  		return retval;
>  	}
>  
> -- 
> 2.25.1

Now this is just being silly.  Consider all future emails also dropped.

greg k-h
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
