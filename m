Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8OegBIQ3g2kwjAMAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Wed, 04 Feb 2026 13:11:48 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id A3708E59E9
	for <lists+greybus-dev@lfdr.de>; Wed, 04 Feb 2026 13:11:47 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 961713F952
	for <lists+greybus-dev@lfdr.de>; Wed,  4 Feb 2026 12:11:46 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by lists.linaro.org (Postfix) with ESMTPS id 1447F3F756
	for <greybus-dev@lists.linaro.org>; Wed,  4 Feb 2026 12:11:43 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b="rXoaN/N6";
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 172.234.252.31 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org;
	dmarc=pass (policy=none) header.from=linuxfoundation.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7570F419BC;
	Wed,  4 Feb 2026 12:11:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2F39C4CEF7;
	Wed,  4 Feb 2026 12:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1770207102;
	bh=DjY1VdukoE56ICyhAPoSRJQKp5tZ1gz2AYOHTJvX69s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rXoaN/N6QjNsW2nmQfx0EYGSDOTaX9jbmcZFOuNUZ0jJMnydPfx/O74F2JEsY4JBB
	 f57ujNGTUFyCyo2OXhoK6s5hcaX+K1wzxpU5YWL2M305OrSaUU8JgnHo20eMevz027
	 P2cbQ0XoKO7peXoY7pYhPzjhXNE9Lu4+KPBDaG4I=
Date: Wed, 4 Feb 2026 13:11:38 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Neel Bullywon <neelb2403@gmail.com>
Message-ID: <2026020424-reporter-essential-a96f@gregkh>
References: <20260204101342.71267-1-neelb2403@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260204101342.71267-1-neelb2403@gmail.com>
X-Spamd-Bar: /
Message-ID-Hash: OT4AHPHVOCKPIKVM3BCFXP6V6X6KQZQJ
X-Message-ID-Hash: OT4AHPHVOCKPIKVM3BCFXP6V6X6KQZQJ
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v2] staging: greybus: gbphy: replace sprintf() with sysfs_emit()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/OT4AHPHVOCKPIKVM3BCFXP6V6X6KQZQJ/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
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
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	GREYLIST(0.00)[pass,meta];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	NEURAL_HAM(-0.00)[-0.993];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,greybus-dev-bounces@lists.linaro.org];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6]
X-Rspamd-Queue-Id: A3708E59E9
X-Rspamd-Action: no action

On Wed, Feb 04, 2026 at 05:13:42AM -0500, Neel Bullywon wrote:
> Replaced sprintf() with sysfs_emit() in the protocol_id_show() sysfs
> attribute function. This code is safe, as replacing sprintf() with
> sysfs_emit() gets rid of calls to sprintf()
> as part of kernel hardening and sysfs_emit() is more appropriate in
> this context.
> 
> Signed-off-by: Neel Bullywon <neelb2403@gmail.com>
> ---
> This was compile-tested only (no VM/hardware used)
> ---
>  drivers/staging/greybus/gbphy.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/greybus/gbphy.c b/drivers/staging/greybus/gbphy.c
> index 60cf09a302a7..55f132b09cee 100644
> --- a/drivers/staging/greybus/gbphy.c
> +++ b/drivers/staging/greybus/gbphy.c
> @@ -31,7 +31,7 @@ static ssize_t protocol_id_show(struct device *dev,
>  {
>  	struct gbphy_device *gbphy_dev = to_gbphy_dev(dev);
>  
> -	return sprintf(buf, "0x%02x\n", gbphy_dev->cport_desc->protocol_id);
> +	return sysfs_emit(buf, "0x%02x\n", gbphy_dev->cport_desc->protocol_id);
>  }
>  static DEVICE_ATTR_RO(protocol_id);
>  
> -- 
> 2.44.0
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
