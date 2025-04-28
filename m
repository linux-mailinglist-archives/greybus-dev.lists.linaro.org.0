Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id D6381A9F65C
	for <lists+greybus-dev@lfdr.de>; Mon, 28 Apr 2025 18:59:40 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id F12E545987
	for <lists+greybus-dev@lfdr.de>; Mon, 28 Apr 2025 16:59:39 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	by lists.linaro.org (Postfix) with ESMTPS id 69E2C453B5
	for <greybus-dev@lists.linaro.org>; Mon, 28 Apr 2025 16:59:34 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=PJMaom9K;
	dmarc=pass (policy=none) header.from=linuxfoundation.org;
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 139.178.84.217 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C0B7E5C5A52;
	Mon, 28 Apr 2025 16:57:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21811C4CEE4;
	Mon, 28 Apr 2025 16:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1745859573;
	bh=d8cyzXNFYXAQzduZRMl4KjypHV68mdn7yBogCCTQEZo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PJMaom9KFE2bw6RAamcAtXzeN+5GCNzgm6P+P7phVvQdCLdRptO5AONrhUcSU44FD
	 tLShdqKa/wkfq/WceCCW5Q9nNZYd06wHiKilhMBE0fTPY+LsiMHNvBTv+lfrXn/Hox
	 Ir2/xQQn/gNYPshwV6lFTM1+DH0Ujzi8vVLPVv9o=
Date: Mon, 28 Apr 2025 18:59:30 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Sridhar Arra <sridhar.arra@yahoo.com>
Message-ID: <2025042819-manlike-stratus-4c78@gregkh>
References: <20250428160837.664000-1-sridhar.arra.ref@yahoo.com>
 <20250428160837.664000-1-sridhar.arra@yahoo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250428160837.664000-1-sridhar.arra@yahoo.com>
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 69E2C453B5
X-Spamd-Bar: /
X-Spamd-Result: default: False [-1.00 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	BAYES_HAM(-3.00)[99.99%];
	RCVD_DKIM_ARC_DNSWL_HI(-1.00)[];
	RCVD_IN_DNSWL_HI(-0.50)[139.178.84.217:from];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip4:139.178.84.217];
	MIME_GOOD(-0.10)[text/plain];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:54825, ipnet:139.178.80.0/21, country:US];
	ARC_NA(0.00)[];
	DNSWL_BLOCKED(0.00)[100.75.92.58:received];
	RCPT_COUNT_SEVEN(0.00)[7];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[yahoo.com];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[linuxfoundation.org:+]
X-Rspamd-Action: no action
Message-ID-Hash: HZNH5S7VWY4MKZLDB6FBYK6IYWLLBW54
X-Message-ID-Hash: HZNH5S7VWY4MKZLDB6FBYK6IYWLLBW54
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: vireshk@kernel.org, johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v2 1/2] [PATCH v2 1/2] staging: greybus: fw-management: Add detailed mutex comment
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/HZNH5S7VWY4MKZLDB6FBYK6IYWLLBW54/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Apr 28, 2025 at 09:38:36PM +0530, Sridhar Arra wrote:
> Added a detailed comment explaining the role of the mutex
> in serializing firmware management ioctl() operations.
> The mutex prevents concurrent access to firmware operations
> and protects the 'disabled' state flag during disconnection.
> 
> Signed-off-by: Sridhar Arra <sridhar.arra@yahoo.com>
> ---
>  drivers/staging/greybus/fw-management.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/staging/greybus/fw-management.c b/drivers/staging/greybus/fw-management.c
> index a47385175582..56725b711a17 100644
> --- a/drivers/staging/greybus/fw-management.c
> +++ b/drivers/staging/greybus/fw-management.c
> @@ -28,6 +28,19 @@ struct fw_mgmt {
>  
>  	/* Common id-map for interface and backend firmware requests */
>  	struct ida		id_map;
> +	/*
> +	 * Mutex to serialize firmware management ioctl() operations and
> +	 * protect against concurrent access.
> +	 *
> +	 * Ensures that user-space cannot perform multiple firmware
> +	 * operations in parallel (e.g., updating interface firmware)
> +	 * for the same Interface, avoiding race conditions and reducing
> +	 * code complexity.
> +	 *
> +	 * Also protects the 'disabled' state flag, preventing new
> +	 * operations from starting when the firmware management
> +	 * connection is being disconnected.
> +	 */
>  	struct mutex		mutex;
>  	struct completion	completion;
>  	struct cdev		cdev;
> -- 
> 2.43.0
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
