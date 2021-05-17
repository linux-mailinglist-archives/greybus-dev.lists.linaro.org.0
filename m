Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 7772E3823CF
	for <lists+greybus-dev@lfdr.de>; Mon, 17 May 2021 07:47:38 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id B4B7060BEB
	for <lists+greybus-dev@lfdr.de>; Mon, 17 May 2021 05:47:31 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 5D74E60AEC; Mon, 17 May 2021 05:47:31 +0000 (UTC)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id A2C4560AEC;
	Mon, 17 May 2021 05:47:28 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 7E35A60479
 for <greybus-dev@lists.linaro.org>; Mon, 17 May 2021 05:47:27 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 7616560752; Mon, 17 May 2021 05:47:27 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.linaro.org (Postfix) with ESMTPS id 51DDB60479
 for <greybus-dev@lists.linaro.org>; Mon, 17 May 2021 05:47:25 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8DBEE6024A;
 Mon, 17 May 2021 05:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1621230444;
 bh=w59UwCiSLOhbtdKqh3N/du4k7Gn1qTyxuGFJJ9mEekA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=zDSOf2NohZtP6vC4cj689FQ/Qc6i+/7rimCtlcmt1OikTw086tWMohZcgWPhuMuFu
 tD48UimkTepWRmNZkd7bNjULuQ9+rXoIz+q+5h6OHKUIpszeWaM0kuaONi74B+QjwJ
 Bj56CSW/aQTjjX2gz28E0VSgWloyKbM0U8R+pBiQ=
Date: Mon, 17 May 2021 07:47:19 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Yusup Badiev <ybadiev@gmail.com>
Message-ID: <YKIDZ+GIchvrFI3p@kroah.com>
References: <20210516173138.GA586734@yusupbadiev-17Z90N-R-AAC8U1>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210516173138.GA586734@yusupbadiev-17Z90N-R-AAC8U1>
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Re: [greybus-dev] [PATCH] Fix typo in commented code. Issue found
 by checkpatch
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
Cc: Alex Elder <elder@kernel.org>, linux-staging@lists.linux.dev,
 Vaibhav Hiremath <hvaibhav.linux@gmail.com>, Johan Hovold <johan@kernel.org>,
 linux-kernel@vger.kernel.org, greybus-dev@lists.linaro.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: greybus-dev-bounces@lists.linaro.org
Sender: "greybus-dev" <greybus-dev-bounces@lists.linaro.org>
X-Virus-Scanned: ClamAV using ClamSMTP

On Sun, May 16, 2021 at 01:31:38PM -0400, Yusup Badiev wrote:
> This patch changes the typo "Atleast" -> "At least" as checkpatch.pl warned
> 
> Signed-off-by: Yusup Badiev <ybadiev@gmail.com>
> ---
>  drivers/staging/greybus/arche-apb-ctrl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/greybus/arche-apb-ctrl.c b/drivers/staging/greybus/arche-apb-ctrl.c
> index bbf3ba744fc4..45afa208d004 100644
> --- a/drivers/staging/greybus/arche-apb-ctrl.c
> +++ b/drivers/staging/greybus/arche-apb-ctrl.c
> @@ -445,7 +445,7 @@ static int __maybe_unused arche_apb_ctrl_suspend(struct device *dev)
>  static int __maybe_unused arche_apb_ctrl_resume(struct device *dev)
>  {
>  	/*
> -	 * Atleast for ES2 we have to meet the delay requirement between
> +	 * At least for ES2 we have to meet the delay requirement between
>  	 * unipro switch and AP bridge init, depending on whether bridge is in
>  	 * OFF state or standby state.
>  	 *
> -- 
> 2.25.1
> 
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

- You did not specify a description of why the patch is needed, or
  possibly, any description at all, in the email body.  Please read the
  section entitled "The canonical patch format" in the kernel file,
  Documentation/SubmittingPatches for what is needed in order to
  properly describe the change.

- You did not write a descriptive Subject: for the patch, allowing Greg,
  and everyone else, to know what this patch is all about.  Please read
  the section entitled "The canonical patch format" in the kernel file,
  Documentation/SubmittingPatches for what a proper Subject: line should
  look like.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
_______________________________________________
greybus-dev mailing list
greybus-dev@lists.linaro.org
https://lists.linaro.org/mailman/listinfo/greybus-dev
