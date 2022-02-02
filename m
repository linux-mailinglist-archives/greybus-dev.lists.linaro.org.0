Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 432704A6EB0
	for <lists+greybus-dev@lfdr.de>; Wed,  2 Feb 2022 11:28:03 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 411173EE5C
	for <lists+greybus-dev@lfdr.de>; Wed,  2 Feb 2022 10:28:02 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	by lists.linaro.org (Postfix) with ESMTPS id 52FD33EE15
	for <greybus-dev@lists.linaro.org>; Wed,  2 Feb 2022 10:27:59 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D014761588;
	Wed,  2 Feb 2022 10:27:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E5D9C004E1;
	Wed,  2 Feb 2022 10:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1643797678;
	bh=9309zuAje4ZSMnel2PPjJY6oVpPYtw+wX81daTgIU2c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oUczvM4XVLV2xIieRd93WKRA/bDWHPu3bGZ1u8+QBmSTrYhSFHaxVMbBYJtCSLWlk
	 mdX5x+MpZ4Sv5+uIMHU+jLXER4S/FFWljsc4xjDHWvsS+VEcrhMQAtNCX18hdie3Tq
	 tvOKmwaVTMS6R5Evd+SWcetYCUDouNAsmsSEUG+69PZy9uHqXoXCViCNb6bZCVNAR4
	 TG1+f7hrbRy5HLTvf0bQpQ8+Wk9CiYxQVNT/kLeieirnakYBqyqiI5wNV+xTUDVxYg
	 9zVoNTWVEA73IoTzK4CT6l4aPLhXwxbfLd3PZNF2l3ePPcUJBCWqpoo5+OLV1VGdhV
	 quemPrBSKHD+w==
Received: from johan by xi.lan with local (Exim 4.94.2)
	(envelope-from <johan@kernel.org>)
	id 1nFCrU-0003Pl-Ed; Wed, 02 Feb 2022 11:27:41 +0100
Date: Wed, 2 Feb 2022 11:27:40 +0100
From: Johan Hovold <johan@kernel.org>
To: Dan Carpenter <dan.carpenter@oracle.com>
Message-ID: <YfpcnDRAyeyoxi10@hovoldconsulting.com>
References: <20220202072016.GA6748@kili>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220202072016.GA6748@kili>
Message-ID-Hash: 6UXL6PUCVSXNBN4VTTUEFKHHHALUF344
X-Message-ID-Hash: 6UXL6PUCVSXNBN4VTTUEFKHHHALUF344
X-MailFrom: johan@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: fix an error handling bug in gb_svc_hello()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/6UXL6PUCVSXNBN4VTTUEFKHHHALUF344/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Feb 02, 2022 at 10:20:16AM +0300, Dan Carpenter wrote:
> Cleanup if gb_svc_queue_deferred_request() fails.
> 
> Fixes: ee2f2074fdb2 ("greybus: svc: reconfig APBridgeA-Switch link to handle required load")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> From static analysis.  Not tested.

Look correct. Thanks, Dan.

This part of Greybus no longer lives in staging and the prefix should be

	greybus: svc:

I'd also prefer to see all error labels use an err_ prefix consistently.

When looking at this code I found another bug so I'll fix up the above
nits and send a series with both fixes as there will be a dependency.

>  drivers/greybus/svc.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/greybus/svc.c b/drivers/greybus/svc.c
> index ce7740ef449b..b19651048081 100644
> --- a/drivers/greybus/svc.c
> +++ b/drivers/greybus/svc.c
> @@ -866,8 +866,14 @@ static int gb_svc_hello(struct gb_operation *op)
>  
>  	gb_svc_debugfs_init(svc);
>  
> -	return gb_svc_queue_deferred_request(op);
> +	ret = gb_svc_queue_deferred_request(op);
> +	if (ret)
> +		goto remove_debugfs;
> +
> +	return 0;
>  
> +remove_debugfs:
> +	gb_svc_debugfs_exit(svc);
>  err_unregister_device:
>  	gb_svc_watchdog_destroy(svc);
>  	device_del(&svc->dev);

Johan
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
