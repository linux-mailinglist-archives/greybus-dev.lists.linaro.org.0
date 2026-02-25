Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eMSgCc1Cn2laZgQAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Wed, 25 Feb 2026 19:43:25 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C5519C646
	for <lists+greybus-dev@lfdr.de>; Wed, 25 Feb 2026 19:43:24 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 9DE7E402AB
	for <lists+greybus-dev@lfdr.de>; Wed, 25 Feb 2026 18:43:23 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by lists.linaro.org (Postfix) with ESMTPS id F34ED400F4
	for <greybus-dev@lists.linaro.org>; Wed, 25 Feb 2026 18:43:20 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=VgYr52uY;
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 172.234.252.31 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org;
	dmarc=pass (policy=none) header.from=linuxfoundation.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 63B0640BC4;
	Wed, 25 Feb 2026 18:43:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17441C116D0;
	Wed, 25 Feb 2026 18:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1772045000;
	bh=x3Y5ky6w6cm6G4P76BH63UhEp+MPovbDdAkNNr1ukpM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VgYr52uYeJzSMyvaaGx0TSV6m8dEugb9Xfj0hLa4ZAwkL5MuxBYp2qj3gBTSbsl9Q
	 n/uRXkCQXzUgs5jw//ou6RQDiH/S9ZTBI99tvh0AgdVJWE+53O5jxPqEhlx64bSvnh
	 nswr5Vlggk07f3d2QgUocGAAJSWDV9I7MzZfdz4A=
Date: Wed, 25 Feb 2026 10:43:12 -0800
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Message-ID: <2026022552-overbuilt-concert-4506@gregkh>
References: <20260225183836.20434-1-chakrabortyshubham66@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260225183836.20434-1-chakrabortyshubham66@gmail.com>
X-Spamd-Bar: /
Message-ID-Hash: LIMDAY5LDWRW6R2OEDK4ZUO3IJV5KAYY
X-Message-ID-Hash: LIMDAY5LDWRW6R2OEDK4ZUO3IJV5KAYY
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: David Lin <dtwlin@gmail.com>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 1/2] staging: greybus: uart: fix style issues
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/LIMDAY5LDWRW6R2OEDK4ZUO3IJV5KAYY/>
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
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	GREYLIST(0.00)[pass,meta];
	ARC_NA(0.00)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-0.765];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,greybus-dev-bounces@lists.linaro.org];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,lists.linaro.org,lists.linux.dev,vger.kernel.org];
	TAGGED_RCPT(0.00)[greybus-dev];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[checkpatch.pl:url,linaro.org:email,lists.linaro.org:helo,lists.linaro.org:rdns]
X-Rspamd-Queue-Id: A8C5519C646
X-Rspamd-Action: no action

On Thu, Feb 26, 2026 at 12:08:35AM +0530, Shubham Chakraborty wrote:
> Fix checkpatch.pl warnings by adding comments to mutex and spinlocks,
> and fixing alignment to match open parenthesis.
> 
> Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
> ---
>  drivers/staging/greybus/uart.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/greybus/uart.c b/drivers/staging/greybus/uart.c
> index 7d060b4cd33d..1d2c4ef70865 100644
> --- a/drivers/staging/greybus/uart.c
> +++ b/drivers/staging/greybus/uart.c
> @@ -50,12 +50,12 @@ struct gb_tty {
>  	unsigned int minor;
>  	unsigned char clocal;
>  	bool disconnected;
> -	spinlock_t read_lock;
> -	spinlock_t write_lock;
> +	spinlock_t read_lock;		/* protects read operations */
> +	spinlock_t write_lock;		/* protects write operations */
>  	struct async_icount iocount;
>  	struct async_icount oldcount;
>  	wait_queue_head_t wioctl;
> -	struct mutex mutex;
> +	struct mutex mutex;		/* serializes port operations */
>  	u8 ctrlin;	/* input control lines */
>  	u8 ctrlout;	/* output control lines */
>  	struct gb_uart_set_line_coding_request line_coding;
> @@ -318,7 +318,7 @@ static int gb_uart_wait_for_all_credits(struct gb_tty *gb_tty)
>  		return 0;
>  
>  	ret = wait_for_completion_timeout(&gb_tty->credits_complete,
> -			msecs_to_jiffies(GB_UART_CREDIT_WAIT_TIMEOUT_MSEC));
> +					  msecs_to_jiffies(GB_UART_CREDIT_WAIT_TIMEOUT_MSEC));
>  	if (!ret) {
>  		dev_err(&gb_tty->gbphy_dev->dev,
>  			"time out waiting for credits\n");
> -- 
> 2.53.0
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

- Your patch did many different things all at once, making it difficult
  to review.  All Linux kernel patches need to only do one thing at a
  time.  If you need to do multiple things (such as clean up all coding
  style issues in a file/driver), do it in a sequence of patches, each
  one doing only one thing.  This will make it easier to review the
  patches to ensure that they are correct, and to help alleviate any
  merge issues that larger patches can cause.

- You sent a patch that has been sent multiple times in the past few
  days, and is identical to ones that has been recently rejected.
  Please always look at the mailing list traffic to determine if you are
  duplicating other people's work.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
