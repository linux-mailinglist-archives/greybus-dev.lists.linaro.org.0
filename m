Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id B0DAACA5019
	for <lists+greybus-dev@lfdr.de>; Thu, 04 Dec 2025 19:54:48 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id C5F583F962
	for <lists+greybus-dev@lfdr.de>; Thu,  4 Dec 2025 18:54:47 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by lists.linaro.org (Postfix) with ESMTPS id C6DB43F702
	for <greybus-dev@lists.linaro.org>; Thu,  4 Dec 2025 18:54:40 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=iYbK1SbM;
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 172.234.252.31 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org;
	dmarc=pass (policy=none) header.from=linuxfoundation.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3AB9B402A7;
	Thu,  4 Dec 2025 18:54:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B12CDC4CEFB;
	Thu,  4 Dec 2025 18:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1764874480;
	bh=0/b/KxLNkPPpFDtLWvD/HAhudnjCckydnqbgeKYI50o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iYbK1SbM3wp/FszxWTUt0hP3RcMadSWXUnpg254+ZcNHRS4rxYaltLM9OAd65KsUC
	 LMGkmYhPBLnzCsNbB6pJaFUK+HMTFToFlmwHC++186NPT+4NBhLXSoUyohMEnf44Mx
	 yyd1n6IpSPDm1rXsaWfVH5/YVgblwiK3zCOzxpkM=
Date: Thu, 4 Dec 2025 19:54:35 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Julioccps <julio191096@gmail.com>
Message-ID: <2025120422-atypical-manliness-3be1@gregkh>
References: <20251204162906.45005-1-julio191096@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251204162906.45005-1-julio191096@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.50 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	BAYES_HAM(-3.00)[100.00%];
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
	URIBL_BLOCKED(0.00)[linuxfoundation.org:dkim,linuxfoundation.org:from_smtp,linuxfoundation.org:from_mime];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+]
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: C6DB43F702
X-Spamd-Bar: /
Message-ID-Hash: PDAEGNGOQ3I43AF2Z6KDW7N2ZIP7CGBS
X-Message-ID-Hash: PDAEGNGOQ3I43AF2Z6KDW7N2ZIP7CGBS
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: hvaibhav.linux@gmail.com, johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v2] staging: greybus: arche-apb-ctrl: switch to device_property_read_bool
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/PDAEGNGOQ3I43AF2Z6KDW7N2ZIP7CGBS/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Dec 04, 2025 at 01:29:06PM -0300, Julioccps wrote:
> Switch from the deprecated of_property_read_bool() to the common
> device_property_read_bool() API. This makes the driver agnostic to
> the underlying firmware interface (DT or ACPI) and simplifies the
> logic.
> 
> Since the driver is no longer strictly dependent on Device Tree,
> include <linux/mod_devicetable.h> directly for the struct
> of_device_id definition, instead of relying on implicit inclusion
> via <linux/of_irq.h>, which has been removed as it is unused.
> 
> Also rename apb_ctrl_get_devtree_data() to apb_ctrl_get_fw_data()
> to better reflect the agnostic nature of the new implementation.
> 
> Signed-off-by: Julio Cesar Carvalho de Paula Souza <julio191096@gmail.com>
> ---
>  drivers/staging/greybus/arche-apb-ctrl.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/staging/greybus/arche-apb-ctrl.c b/drivers/staging/greybus/arche-apb-ctrl.c
> index 90ab32638d3f..eea9648a461c 100644
> --- a/drivers/staging/greybus/arche-apb-ctrl.c
> +++ b/drivers/staging/greybus/arche-apb-ctrl.c
> @@ -10,13 +10,14 @@
>  #include <linux/delay.h>
>  #include <linux/gpio/consumer.h>
>  #include <linux/interrupt.h>
> -#include <linux/of_irq.h>
>  #include <linux/module.h>
>  #include <linux/pinctrl/consumer.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm.h>
> +#include <linux/property.h>
>  #include <linux/regulator/consumer.h>
>  #include <linux/spinlock.h>
> +#include <linux/mod_devicetable.h>
>  #include "arche_platform.h"
>  
>  static void apb_bootret_deassert(struct device *dev);
> @@ -314,7 +315,7 @@ static ssize_t state_show(struct device *dev,
>  
>  static DEVICE_ATTR_RW(state);
>  
> -static int apb_ctrl_get_devtree_data(struct platform_device *pdev,
> +static int apb_ctrl_get_fw_data(struct platform_device *pdev,
>  				     struct arche_apb_ctrl_drvdata *apb)
>  {
>  	struct device *dev = &pdev->dev;
> @@ -378,7 +379,7 @@ static int apb_ctrl_get_devtree_data(struct platform_device *pdev,
>  	}
>  
>  	/* Only applicable for platform >= V2 */
> -	if (of_property_read_bool(pdev->dev.of_node, "gb,spi-en-active-high"))
> +	if (device_property_read_bool(&pdev->dev, "gb,spi-en-active-high"))
>  		apb->spi_en_polarity_high = true;
>  
>  	return 0;
> @@ -394,7 +395,7 @@ static int arche_apb_ctrl_probe(struct platform_device *pdev)
>  	if (!apb)
>  		return -ENOMEM;
>  
> -	ret = apb_ctrl_get_devtree_data(pdev, apb);
> +	ret = apb_ctrl_get_fw_data(pdev, apb);
>  	if (ret) {
>  		dev_err(dev, "failed to get apb devicetree data %d\n", ret);
>  		return ret;
> @@ -403,7 +404,7 @@ static int arche_apb_ctrl_probe(struct platform_device *pdev)
>  	/* Initially set APB to OFF state */
>  	apb->state = ARCHE_PLATFORM_STATE_OFF;
>  	/* Check whether device needs to be enabled on boot */
> -	if (of_property_read_bool(pdev->dev.of_node, "arche,init-disable"))
> +	if (device_property_read_bool(&pdev->dev, "arche,init-disable"))
>  		apb->init_disabled = true;
>  
>  	platform_set_drvdata(pdev, apb);
> -- 
> 2.52.0
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
