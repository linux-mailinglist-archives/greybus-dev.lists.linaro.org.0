Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EHerBMGNAWpyeAEAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Mon, 11 May 2026 10:05:21 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 79145509C9D
	for <lists+greybus-dev@lfdr.de>; Mon, 11 May 2026 10:05:19 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 66A413F79E
	for <lists+greybus-dev@lfdr.de>; Mon, 11 May 2026 07:59:23 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by lists.linaro.org (Postfix) with ESMTPS id 1BADC3F6C2
	for <greybus-dev@lists.linaro.org>; Mon, 11 May 2026 07:59:18 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=OiP2BfdL;
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 172.234.252.31 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org;
	dmarc=pass (policy=none) header.from=linuxfoundation.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BC5724097C;
	Mon, 11 May 2026 07:52:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52439C2BCF6;
	Mon, 11 May 2026 07:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1778485934;
	bh=oNVvykfZedGYg9BkuI3U3BYL+aLgP1HD/D4U/64+O/A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OiP2BfdL9O5dSYuvFESPz6pN4eqhoSWIA+b6CLRtXtZiTBCS8AO4q2ca87SDPz6ZX
	 sNcMK7Zmy0X2M4cnXrXPj1ajG8aVdCsnNn/Kfzb23BSS3LpSZifuTPJUok6snEmkIt
	 myqKiDR1TpbrpHGDwg05yR5HLA7U6dp17AcN2XsE=
Date: Mon, 11 May 2026 09:52:12 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Khaled Saleh <khaled.saleh.req@gmail.com>
Message-ID: <2026051140-frozen-tried-7799@gregkh>
References: <20260504171330.83727-1-khaled.saleh.req@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260504171330.83727-1-khaled.saleh.req@gmail.com>
X-Spamd-Bar: /
Message-ID-Hash: RT7CKAXK3QCEX5WFRWMXAHMEYN6NM2PT
X-Message-ID-Hash: RT7CKAXK3QCEX5WFRWMXAHMEYN6NM2PT
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: split gb_audio_gb_get_topology()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/RT7CKAXK3QCEX5WFRWMXAHMEYN6NM2PT/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 79145509C9D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [6.59 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[linuxfoundation.org:s=korg];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx:c];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[linuxfoundation.org : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	GREYLIST(0.00)[pass,body];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[greybus-dev];
	NEURAL_HAM(-0.00)[-0.849];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,greybus-dev-bounces@lists.linaro.org];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	DKIM_TRACE(0.00)[linuxfoundation.org:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linaro.org:helo,lists.linaro.org:rdns]
X-Rspamd-Action: add header
X-Spam: Yes

On Mon, May 04, 2026 at 07:13:30PM +0200, Khaled Saleh wrote:
> Split gb_audio_gb_get_topology() into smaller helper functions
> to improve readability and maintainability.
> 
> No functional change intended.
> 
> Signed-off-by: Khaled Saleh <khaled.saleh.req@gmail.com>
> ---
>  drivers/staging/greybus/audio_gb.c | 25 ++++++++++++++++++-------
>  1 file changed, 18 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/staging/greybus/audio_gb.c b/drivers/staging/greybus/audio_gb.c
> index 9d8994fdb41a..b5ead09532c8 100644
> --- a/drivers/staging/greybus/audio_gb.c
> +++ b/drivers/staging/greybus/audio_gb.c
> @@ -8,13 +8,10 @@
>  #include <linux/greybus.h>
>  #include "audio_codec.h"
>  
> -/* TODO: Split into separate calls */
> -int gb_audio_gb_get_topology(struct gb_connection *connection,
> -			     struct gb_audio_topology **topology)
> +static int gb_audio_gb_get_topology_size(struct gb_connection *connection,
> +					 u16 *size)
>  {
>  	struct gb_audio_get_topology_size_response size_resp;
> -	struct gb_audio_topology *topo;
> -	u16 size;
>  	int ret;
>  
>  	ret = gb_operation_sync(connection, GB_AUDIO_TYPE_GET_TOPOLOGY_SIZE,
> @@ -22,10 +19,24 @@ int gb_audio_gb_get_topology(struct gb_connection *connection,
>  	if (ret)
>  		return ret;
>  
> -	size = le16_to_cpu(size_resp.size);
> -	if (size < sizeof(*topo))
> +	*size = le16_to_cpu(size_resp.size);
> +	if (*size < sizeof(struct gb_audio_topology))
>  		return -ENODATA;
>  
> +	return 0;
> +}
> +
> +int gb_audio_gb_get_topology(struct gb_connection *connection,
> +			     struct gb_audio_topology **topology)
> +{
> +	struct gb_audio_topology *topo;
> +	u16 size;
> +	int ret;
> +
> +	ret = gb_audio_gb_get_topology_size(connection, &size);
> +	if (ret)
> +		return ret;
> +
>  	topo = kzalloc(size, GFP_KERNEL);
>  	if (!topo)
>  		return -ENOMEM;
> -- 
> 2.34.1
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

- You sent a patch that has been sent multiple times in the past and is
  identical to ones that have been rejected.  Please always look at the
  mailing list traffic to determine if you are duplicating other
  people's work.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
