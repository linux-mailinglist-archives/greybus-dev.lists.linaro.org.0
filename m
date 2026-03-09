Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MIpXJcjurmkWKQIAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Mon, 09 Mar 2026 17:01:12 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 5813B23C572
	for <lists+greybus-dev@lfdr.de>; Mon, 09 Mar 2026 17:01:10 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id E17413F809
	for <lists+greybus-dev@lfdr.de>; Mon,  9 Mar 2026 16:01:08 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by lists.linaro.org (Postfix) with ESMTPS id 472183F689
	for <greybus-dev@lists.linaro.org>; Mon,  9 Mar 2026 16:01:05 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=EljGov8W;
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 172.105.4.254 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org;
	dmarc=pass (policy=none) header.from=linuxfoundation.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CAD0A60054;
	Mon,  9 Mar 2026 16:01:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C396C2BCB0;
	Mon,  9 Mar 2026 16:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773072064;
	bh=IE9WebPwM0H2hsf0PtuLr6OKUQnwp8TSBClNFONnIm0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EljGov8Wf3cOf1rmSmip9QB0KfNGZWaG2nZ0cNnuOxsmUD3VOz5NBLI8dN8PWaEcr
	 uG/uMNEeBkUdmPRtrGrpbNPdLdPsjP9F8JXvuc5dDnXcTLx8g5HrjgFtu44KbBJQ4b
	 e92g4LYDwsaTMafmMXAt9PK0vnApqkWd38MGq5vg=
Date: Mon, 9 Mar 2026 17:01:02 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: sluisr <luistermc789@gmail.com>
Message-ID: <2026030950-brunette-dizzy-1b18@gregkh>
References: <20260309004444.20283-1-contact@sluisr.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260309004444.20283-1-contact@sluisr.com>
X-Spamd-Bar: /
Message-ID-Hash: KY226EEIVYJ4RPDEHZC54CECMCR3P2DE
X-Message-ID-Hash: KY226EEIVYJ4RPDEHZC54CECMCR3P2DE
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: pure.logic@nexus-software.ie, johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, sluisr <contact@sluisr.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: loopback: remove unused macro argument
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/KY226EEIVYJ4RPDEHZC54CECMCR3P2DE/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 5813B23C572
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
	RCPT_COUNT_SEVEN(0.00)[8];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,greybus-dev-bounces@lists.linaro.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:-];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	NEURAL_SPAM(0.00)[0.992];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,lists.linaro.org:rdns,lists.linaro.org:helo,sluisr.com:email,checkpatch.pl:url]
X-Rspamd-Action: no action

On Sun, Mar 08, 2026 at 06:44:44PM -0600, sluisr wrote:
> This patch fixes the checkpatch.pl warning:
> WARNING: Argument 'conn' is not used in function-like macro
> 
> The gb_dev_loopback_ro_attr macro accepted a 'conn' argument which was
> never used in its expansion. The argument was removed from the macro
> definition and its invocation.
> 
> Signed-off-by: sluisr <contact@sluisr.com>
> ---
>  drivers/staging/greybus/loopback.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/greybus/loopback.c b/drivers/staging/greybus/loopback.c
> index aa9c73cb0..855d5051c 100644
> --- a/drivers/staging/greybus/loopback.c
> +++ b/drivers/staging/greybus/loopback.c
> @@ -193,7 +193,7 @@ static ssize_t field##_store(struct device *dev,			\
>  }									\
>  static DEVICE_ATTR_RW(field)
>  
> -#define gb_dev_loopback_ro_attr(field, conn)				\
> +#define gb_dev_loopback_ro_attr(field)				\
>  static ssize_t field##_show(struct device *dev,		\
>  			    struct device_attribute *attr,		\
>  			    char *buf)					\
> @@ -305,7 +305,7 @@ gb_dev_loopback_rw_attr(us_wait, d);
>  /* Maximum iterations for a given operation: 1-(2^32-1), 0 implies infinite */
>  gb_dev_loopback_rw_attr(iteration_max, u);
>  /* The current index of the for (i = 0; i < iteration_max; i++) loop */
> -gb_dev_loopback_ro_attr(iteration_count, false);
> +gb_dev_loopback_ro_attr(iteration_count);
>  /* A flag to indicate synchronous or asynchronous operations */
>  gb_dev_loopback_rw_attr(async, u);
>  /* Timeout of an individual asynchronous request */
> -- 
> 2.53.0
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

- It looks like you did not use your "real" name for the patch on either
  the Signed-off-by: line, or the From: line (both of which have to
  match).  Please read the kernel file,
  Documentation/process/submitting-patches.rst for how to do this
  correctly.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
