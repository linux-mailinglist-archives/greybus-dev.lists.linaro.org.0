Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A94939116F
	for <lists+greybus-dev@lfdr.de>; Wed, 26 May 2021 09:36:58 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 9EE3761442
	for <lists+greybus-dev@lfdr.de>; Wed, 26 May 2021 07:36:56 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 3AB8261447; Wed, 26 May 2021 07:36:56 +0000 (UTC)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 8468261391;
	Wed, 26 May 2021 07:36:53 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 3C41A60AA0
 for <greybus-dev@lists.linaro.org>; Wed, 26 May 2021 07:36:52 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 382F96138C; Wed, 26 May 2021 07:36:52 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.linaro.org (Postfix) with ESMTPS id 1CB6760AA0
 for <greybus-dev@lists.linaro.org>; Wed, 26 May 2021 07:36:50 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 319AB61355;
 Wed, 26 May 2021 07:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622014609;
 bh=atrS0fSwL+Pb61QJJJ5QBXGFeefXwImWJOXSEljPADg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=T3J7X5rcXfIKceiDrYFjByLxo/m+Hny5Tk3vOTeVmrnMqlHFrBTCPZi4Bab6r8WMR
 qWMe9jQyM/2f0OlFMdPUYmwWpudvO0GJMvJ9xIeOwGwjhXxDQkif2D1sC0ajdFvViH
 Mmmh2bk53Q5aY45T5vlxlD92uF8414wVRGAvy/aSQlBKDBQ6bnRSK0KWsjNGKG/2bb
 XyqHnN3O0yWW3+8fikRYcYwd8oQQexLdtgw8OKREj6tXJ8l0qv8HxZ7cDKsPGU49Dp
 htgxYWK11PBvrZWmbBCJfGXhhC6QXeoIBPT7bcJROCQPu/wUsSufNeKvF35Yg+rn4L
 WPzrgnNIOdmpQ==
Received: from johan by xi.lan with local (Exim 4.94.2)
 (envelope-from <johan@kernel.org>)
 id 1llo5r-00036Z-I7; Wed, 26 May 2021 09:36:44 +0200
Date: Wed, 26 May 2021 09:36:43 +0200
From: Johan Hovold <johan@kernel.org>
To: Tian Tao <tiantao6@hisilicon.com>
Message-ID: <YK36iyUNqZBmZol0@hovoldconsulting.com>
References: <1621993855-64142-1-git-send-email-tiantao6@hisilicon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1621993855-64142-1-git-send-email-tiantao6@hisilicon.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Re: [greybus-dev] [PATCH] greybus: use pm_runtime_resume_and_get()
 to replace open coding
X-BeenThere: greybus-dev@lists.linaro.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
List-Unsubscribe: <https://lists.linaro.org/mailman/options/greybus-dev>,
 <mailto:greybus-dev-request@lists.linaro.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/greybus-dev/>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Subscribe: <https://lists.linaro.org/mailman/listinfo/greybus-dev>,
 <mailto:greybus-dev-request@lists.linaro.org?subject=subscribe>
Cc: elder@kernel.org, greybus-dev@lists.linaro.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: greybus-dev-bounces@lists.linaro.org
Sender: "greybus-dev" <greybus-dev-bounces@lists.linaro.org>
X-Virus-Scanned: ClamAV using ClamSMTP

On Wed, May 26, 2021 at 09:50:55AM +0800, Tian Tao wrote:
> use pm_runtime_resume_and_get() to replace pm_runtime_get_sync and
> pm_runtime_put_noidle. this change is just to simplify the code, no
> actual functional changes.
> 
> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
> ---
>  drivers/greybus/core.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/greybus/core.c b/drivers/greybus/core.c
> index e546c64..434aa5d 100644
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

This code is correct and does not need changing.

The current API is not deprecated in any way and is in arguably more
consistently named than this new helper.

Feel free to use the new helper in your own code or suggest using it
when fixing drivers that didn't use pm_runtime_get_sync() correctly.

>  
>  	retval = gb_control_bundle_activate(bundle->intf->control, bundle->id);
>  	if (retval) {

NAK.

Johan
_______________________________________________
greybus-dev mailing list
greybus-dev@lists.linaro.org
https://lists.linaro.org/mailman/listinfo/greybus-dev
