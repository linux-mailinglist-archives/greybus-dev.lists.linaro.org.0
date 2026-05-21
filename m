Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id c8e4DEPGDmrfCAYAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Thu, 21 May 2026 10:45:55 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A8C5A15A5
	for <lists+greybus-dev@lfdr.de>; Thu, 21 May 2026 10:45:54 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 9D2FC40983
	for <lists+greybus-dev@lfdr.de>; Thu, 21 May 2026 08:37:22 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by lists.linaro.org (Postfix) with ESMTPS id DBB4E4097E
	for <greybus-dev@lists.linaro.org>; Thu, 21 May 2026 08:37:16 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=Q9VCGQEN;
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 172.234.252.31 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org;
	dmarc=pass (policy=none) header.from=linuxfoundation.org
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4253644354;
	Thu, 21 May 2026 08:37:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96F141F01573;
	Thu, 21 May 2026 08:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1779352636;
	bh=AxbXbaT2RN7htR7N/HykoVNH9+lxb1aO0SEo0OY6GDY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Q9VCGQENyTnkDmHeMD981Qi+QgDzqZZ0aGx55pKIvFh/5wDrMoqtJUpFrw4OkDYcL
	 RopXyP+7vaMLoD8opZp0V//wy8xqU77i/iVxl024cheW4+/ZLEUXAPox2Y8ZD/6fzJ
	 9m1tRF7/UnhsqldxGOI+FQeHpZK00M1T0bAhsFuQ=
Date: Thu, 21 May 2026 10:37:19 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: AkaLuiz <luizcarlosmdea@gmail.com>
Message-ID: <2026052154-spearmint-eleven-1121@gregkh>
References: <20260520024128.68942-1-luizcarlosmdea@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260520024128.68942-1-luizcarlosmdea@gmail.com>
X-Spamd-Bar: /
Message-ID-Hash: YVTY6JHX6ER5CGZWHMN7SQC62N2TIAKO
X-Message-ID-Hash: YVTY6JHX6ER5CGZWHMN7SQC62N2TIAKO
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: David Lin <dtwlin@gmail.com>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: uart: document locking and fix indentation
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/YVTY6JHX6ER5CGZWHMN7SQC62N2TIAKO/>
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
	R_SPF_ALLOW(-0.20)[+mx];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[linuxfoundation.org : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	GREYLIST(0.00)[pass,body];
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
	NEURAL_SPAM(0.00)[0.055];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linaro.org:rdns,lists.linaro.org:helo]
X-Rspamd-Queue-Id: B0A8C5A15A5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, May 19, 2026 at 11:41:28PM -0300, AkaLuiz wrote:
> Add comments describing what the lock fields in struct gb_tty
> protect, and fix the indentation of the
> wait_for_completion_timeout() call.
> 
> Signed-off-by: AkaLuiz <luizcarlosmdea@gmail.com>
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
