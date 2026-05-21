Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OPuXFpviDmrACwYAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Thu, 21 May 2026 12:46:51 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id E6AC65A38C5
	for <lists+greybus-dev@lfdr.de>; Thu, 21 May 2026 12:46:50 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id EB90C40976
	for <lists+greybus-dev@lfdr.de>; Thu, 21 May 2026 10:46:49 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by lists.linaro.org (Postfix) with ESMTPS id BD1604044C
	for <greybus-dev@lists.linaro.org>; Thu, 21 May 2026 10:46:44 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b="G2L/Ypuo";
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 172.234.252.31 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org;
	dmarc=pass (policy=none) header.from=linuxfoundation.org
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id EB7F341ABA;
	Thu, 21 May 2026 10:46:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 587921F000E9;
	Thu, 21 May 2026 10:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1779360402;
	bh=6WE6bk5JZw5U3qjwmp6dFTS8SWV73Z5LDTvT4mGrQX8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=G2L/YpuoiwD92NhUS2pL2fbHJfDy/FxzPT7uERw8CKp3X25QzcA5MHUOxOBKOcv+v
	 YA7YlHx6MRLYe5ws4EC09DzRfleyNwM2RO8dtqRSf6e8T9wml/ryAI/Q9jVmds/G/L
	 tGbaZG3OljCCdWcXZmVsoBjd46UQLA+EQXFwW2dQ=
Date: Thu, 21 May 2026 12:46:45 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Luiz Carlos <luizcarlosmdea@gmail.com>
Message-ID: <2026052125-bath-lapel-651d@gregkh>
References: <2026052154-spearmint-eleven-1121@gregkh>
 <20260521101245.5540-1-luizcarlosmdea@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260521101245.5540-1-luizcarlosmdea@gmail.com>
X-Spamd-Bar: /
Message-ID-Hash: P7C4LBJO5T73VXQLXGAVWAMLGLISKS6O
X-Message-ID-Hash: P7C4LBJO5T73VXQLXGAVWAMLGLISKS6O
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: David Lin <dtwlin@gmail.com>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v2] staging: greybus: uart: document locking and fix indentation
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/P7C4LBJO5T73VXQLXGAVWAMLGLISKS6O/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [5.09 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	R_DKIM_REJECT(1.00)[linuxfoundation.org:s=korg];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx:c];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[linuxfoundation.org : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	RCPT_COUNT_SEVEN(0.00)[7];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,greybus-dev-bounces@lists.linaro.org];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,lists.linaro.org,lists.linux.dev,vger.kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_SPAM(0.00)[0.031];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linaro.org:rdns,lists.linaro.org:helo,linaro.org:email]
X-Rspamd-Queue-Id: E6AC65A38C5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, May 21, 2026 at 07:12:45AM -0300, Luiz Carlos wrote:
> Add comments describing what the lock fields in struct gb_tty
> protect, and fix the indentation of the
> wait_for_completion_timeout() call.
> 
> Signed-off-by: Luiz Carlos <luizcarlosmdea@gmail.com>
> ---
>  drivers/staging/greybus/uart.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/greybus/uart.c b/drivers/staging/greybus/uart.c
> index 7d060b4cd33d..85586e9a4341 100644
> --- a/drivers/staging/greybus/uart.c
> +++ b/drivers/staging/greybus/uart.c
> @@ -50,12 +50,12 @@ struct gb_tty {
>  	unsigned int minor;
>  	unsigned char clocal;
>  	bool disconnected;
> -	spinlock_t read_lock;
> -	spinlock_t write_lock;
> +	spinlock_t read_lock; /* protects iocount and oldcount for TIOCMIWAIT */
> +	spinlock_t write_lock; /* protects write_fifo and credits */
>  	struct async_icount iocount;
>  	struct async_icount oldcount;
>  	wait_queue_head_t wioctl;
> -	struct mutex mutex;
> +	struct mutex mutex; /* protects disconnected during lookup and removal */
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

- Your patch did many different things all at once, making it difficult
  to review.  All Linux kernel patches need to only do one thing at a
  time.  If you need to do multiple things (such as clean up all coding
  style issues in a file/driver), do it in a sequence of patches, each
  one doing only one thing.  This will make it easier to review the
  patches to ensure that they are correct, and to help alleviate any
  merge issues that larger patches can cause.

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
