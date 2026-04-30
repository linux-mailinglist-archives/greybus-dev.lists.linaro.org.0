Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WLylItMI82lswwEAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Thu, 30 Apr 2026 09:46:27 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F22B49ECF9
	for <lists+greybus-dev@lfdr.de>; Thu, 30 Apr 2026 09:46:27 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id D6F62406EA
	for <lists+greybus-dev@lfdr.de>; Thu, 30 Apr 2026 07:40:41 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by lists.linaro.org (Postfix) with ESMTPS id BF991401D9
	for <greybus-dev@lists.linaro.org>; Thu, 30 Apr 2026 07:40:37 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=bwl2+D23;
	dmarc=pass (policy=none) header.from=linuxfoundation.org;
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 172.234.252.31 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4893940125;
	Thu, 30 Apr 2026 07:40:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4136C2BCB3;
	Thu, 30 Apr 2026 07:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1777534837;
	bh=Bqh6wwvM/uSrblB04mHM/qXj+llExjD0Nur/+NvNzQg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bwl2+D23yY9PVhGbV21m4iZpL6hUkRvjHzM0o8EZY8y9y0ZyaFBXR7kjl8yEjrsJI
	 P+NWRuBo/ugZQKsBnR0wZVZ/cKxrO7B5TXX/46QnCsm9GyBONTkM6JbUT4pFQDXLN2
	 GHZJqeOJ/W28+KthHxzWGqSD82jV6hIUf7AsvLqU=
Date: Thu, 30 Apr 2026 09:39:57 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: kernelcoredev <sonionwhat@gmail.com>
Message-ID: <2026043046-prelaunch-supermom-ecce@gregkh>
References: <20260430002220.3665-1-sonionwhat@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260430002220.3665-1-sonionwhat@gmail.com>
X-Spamd-Bar: /
Message-ID-Hash: VDQP4LFXJOKF5JLDROD5L4QC5UUNWYLA
X-Message-ID-Hash: VDQP4LFXJOKF5JLDROD5L4QC5UUNWYLA
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: vireshk@kernel.org, johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v2] staging: greybus: bootrom: replace dev_info with dev_dbg for firmware name
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/VDQP4LFXJOKF5JLDROD5L4QC5UUNWYLA/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 1F22B49ECF9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [5.09 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	R_DKIM_REJECT(1.00)[linuxfoundation.org:s=korg];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+mx];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[linuxfoundation.org : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	GREYLIST(0.00)[pass,meta];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	RCPT_COUNT_SEVEN(0.00)[7];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,greybus-dev-bounces@lists.linaro.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:-];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	NEURAL_SPAM(0.00)[0.623];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,lists.linaro.org:helo,lists.linaro.org:rdns]

On Wed, Apr 29, 2026 at 08:22:20PM -0400, kernelcoredev wrote:
> The original dev_info call was intentionally temporary, with a FIXME
> comment noting it should be downgraded to dev_dbg once modules with
> valid VID/PID values were common. Project Ara was cancelled in 2016,
> so that time has long passed.
> 
> Remove the FIXME comment and downgrade to dev_dbg as originally intended.
> 
> Tested via code inspection only, as Project Ara hardware is no longer
> available.
> 
> Signed-off-by: Bentley Blacketer  <sonionwhat@gmail.com>
> ---
>  drivers/staging/greybus/bootrom.c | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/staging/greybus/bootrom.c b/drivers/staging/greybus/bootrom.c
> index 83921d90c..058044ba7 100644
> --- a/drivers/staging/greybus/bootrom.c
> +++ b/drivers/staging/greybus/bootrom.c
> @@ -163,18 +163,13 @@ static int find_firmware(struct gb_bootrom *bootrom, u8 stage)
>  	 *
>  	 * XXX Name it properly..
>  	 */
> -	snprintf(firmware_name, sizeof(firmware_name),
> +snprintf(firmware_name, sizeof(firmware_name),
>  		 FW_NAME_PREFIX "%08x_%08x_%08x_%08x_s2l.tftf",
>  		 intf->ddbl1_manufacturer_id, intf->ddbl1_product_id,
>  		 intf->vendor_id, intf->product_id);
>  
> -	// FIXME:
> -	// Turn to dev_dbg later after everyone has valid bootloaders with good
> -	// ids, but leave this as dev_info for now to make it easier to track
> -	// down "empty" vid/pid modules.
> -	dev_info(&connection->bundle->dev, "Firmware file '%s' requested\n",
> +	dev_dbg(&connection->bundle->dev, "Firmware file '%s' requested\n",
>  		 firmware_name);
> -
>  	rc = request_firmware(&bootrom->fw, firmware_name,
>  			      &connection->bundle->dev);
>  	if (rc) {
> -- 
> 2.54.0
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
