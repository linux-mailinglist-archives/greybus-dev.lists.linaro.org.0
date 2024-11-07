Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id E19E09C0006
	for <lists+greybus-dev@lfdr.de>; Thu,  7 Nov 2024 09:35:05 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 0C5D841241
	for <lists+greybus-dev@lfdr.de>; Thu,  7 Nov 2024 08:35:05 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	by lists.linaro.org (Postfix) with ESMTPS id 20A02401C4
	for <greybus-dev@lists.linaro.org>; Thu,  7 Nov 2024 08:34:54 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=BeT5t+YT;
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 147.75.193.91 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org;
	dmarc=pass (policy=none) header.from=linuxfoundation.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0F8E8A4295E;
	Thu,  7 Nov 2024 08:32:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA17FC4CECC;
	Thu,  7 Nov 2024 08:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1730968493;
	bh=zaSp5Zi/JERPJYX+Ul60OjcFfQieL/7nqYIMSUDALZs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BeT5t+YTDlFQPbLoZo0cUazDmigyYEovj7odtGCXTdeBmFcEgu69/QfvNbwl0YSg9
	 acteQYIv8vYnHqPTA/tyojAOJJdL+qQ808oMCdjDoKIQo7bjmqgfZ3wwDBZ9SRoQg5
	 4ZUsmX8T6ISm2hA01Eg6h2IbHsumrR9RoYsrvAmA=
Date: Thu, 7 Nov 2024 09:29:05 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Qiu-ji Chen <chenqiuji666@gmail.com>
Message-ID: <2024110754-rewind-relish-c476@gregkh>
References: <20241106095819.15194-1-chenqiuji666@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241106095819.15194-1-chenqiuji666@gmail.com>
X-Spamd-Result: default: False [-4.50 / 15.00];
	REPLY(-4.00)[];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	BAYES_HAM(-3.00)[99.99%];
	RBL_SENDERSCORE_REPUT_9(-1.00)[147.75.193.91:from];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:147.75.193.91];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MIME_GOOD(-0.10)[text/plain];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,lists.linaro.org,lists.linux.dev,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:54825, ipnet:147.75.192.0/21, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 20A02401C4
X-Spamd-Bar: ----
Message-ID-Hash: WFXE7IVB2JJAPYWXKAZI7DCDRVB5OASO
X-Message-ID-Hash: WFXE7IVB2JJAPYWXKAZI7DCDRVB5OASO
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: dtwlin@gmail.com, johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, baijiaju1990@gmail.com
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v2] greybus/uart: Fix atomicity violation in get_serial_info()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/WFXE7IVB2JJAPYWXKAZI7DCDRVB5OASO/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Nov 06, 2024 at 05:58:19PM +0800, Qiu-ji Chen wrote:
> Our static checker found a bug where set_serial_info() uses a mutex, but 
> get_serial_info() does not. Fortunately, the impact of this is relatively 
> minor. It doesn't cause a crash or any other serious issues. However, if a 
> race condition occurs between set_serial_info() and get_serial_info(), 
> there is a chance that the data returned by get_serial_info() will be 
> meaningless.
> 
> Signed-off-by: Qiu-ji Chen <chenqiuji666@gmail.com>
> Fixes: 0aad5ad563c8 ("greybus/uart: switch to ->[sg]et_serial()")
> ---
> V2:
> Modified the patch description to make it more concise and easier to understand.
> Changed the fix code to ensure the logic is correct.
> Thanks to Johan Hovold and Dan Carpenter for helpful suggestion.
> ---
>  drivers/staging/greybus/uart.c | 2 ++
>  1 file changed, 2 insertions(+)

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

- You have marked a patch with a "Fixes:" tag for a commit that is in an
  older released kernel, yet you do not have a cc: stable line in the
  signed-off-by area at all, which means that the patch will not be
  applied to any older kernel releases.  To properly fix this, please
  follow the documented rules in the
  Documentation/process/stable-kernel-rules.rst file for how to resolve
  this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
