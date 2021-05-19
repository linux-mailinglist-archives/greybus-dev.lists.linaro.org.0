Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id D98AB38931E
	for <lists+greybus-dev@lfdr.de>; Wed, 19 May 2021 17:58:00 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id C11946115E
	for <lists+greybus-dev@lfdr.de>; Wed, 19 May 2021 15:57:59 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id A58546116D; Wed, 19 May 2021 15:57:58 +0000 (UTC)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 405B66114E;
	Wed, 19 May 2021 15:57:56 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id D387761149
 for <greybus-dev@lists.linaro.org>; Wed, 19 May 2021 15:57:54 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id C72846114C; Wed, 19 May 2021 15:57:54 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.linaro.org (Postfix) with ESMTPS id AD09561149
 for <greybus-dev@lists.linaro.org>; Wed, 19 May 2021 15:57:52 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6AF4A611BF;
 Wed, 19 May 2021 15:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1621439871;
 bh=CvWgn1TOhKyllL0rp25eLv8GWJAa4SUZ0xSNVCnhHXo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aQbhPO6fh3q+C+P15r2OQnMBA7xmMTrT+lqIyoBuFEqEf/xDj8CDLj22xKvZY2k6S
 0jQI0+AAyVTWe62kNXqTI6ZxVuLUvIzuS8aqRdjODhXlf63eBa1s0CZyiefwHEGKdH
 ZZFQOsOzEwqe+CSiRPJF4mQGfpywGus3ysXFsQvk=
Date: Wed, 19 May 2021 17:57:49 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: "F.A.Sulaiman" <asha.16@itfac.mrt.ac.lk>
Message-ID: <YKU1fdzyKuwY/IER@kroah.com>
References: <20210519151851.26006-1-asha.16@itfac.mrt.ac.lk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210519151851.26006-1-asha.16@itfac.mrt.ac.lk>
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Re: [greybus-dev] [PATCH] Staging: greybus: fix open parenthesis
 issue in gbphy.c
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
Cc: greybus-dev@lists.linaro.org, elder@kernel.org,
 linux-staging@lists.linux.dev, johan@kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: greybus-dev-bounces@lists.linaro.org
Sender: "greybus-dev" <greybus-dev-bounces@lists.linaro.org>
X-Virus-Scanned: ClamAV using ClamSMTP

On Wed, May 19, 2021 at 08:48:51PM +0530, F.A.Sulaiman wrote:
> This fix "Alignment should match open parenthesis" checkpatch error.
> 
> Signed-off-by: "F.A.Sulaiman" <asha.16@itfac.mrt.ac.lk>
> ---
>  drivers/staging/greybus/gbphy.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/greybus/gbphy.c b/drivers/staging/greybus/gbphy.c
> index 9fc5c47be9bd..13d319860da5 100644
> --- a/drivers/staging/greybus/gbphy.c
> +++ b/drivers/staging/greybus/gbphy.c
> @@ -27,7 +27,7 @@ struct gbphy_host {
>  static DEFINE_IDA(gbphy_id);
>  
>  static ssize_t protocol_id_show(struct device *dev,
> -				 struct device_attribute *attr, char *buf)
> +				struct device_attribute *attr, char *buf)
>  {
>  	struct gbphy_device *gbphy_dev = to_gbphy_dev(dev);
>  
> @@ -221,7 +221,7 @@ void gb_gbphy_deregister_driver(struct gbphy_driver *driver)
>  EXPORT_SYMBOL_GPL(gb_gbphy_deregister_driver);
>  
>  static struct gbphy_device *gb_gbphy_create_dev(struct gb_bundle *bundle,
> -				struct greybus_descriptor_cport *cport_desc)
> +						struct greybus_descriptor_cport *cport_desc)
>  {
>  	struct gbphy_device *gbphy_dev;
>  	int retval;
> -- 
> 2.17.1
> 
> 

You sent this 3 different times, why?

Please send a new version, a v2, and say what changed from the previous
one.

thanks,

greg k-h
_______________________________________________
greybus-dev mailing list
greybus-dev@lists.linaro.org
https://lists.linaro.org/mailman/listinfo/greybus-dev
