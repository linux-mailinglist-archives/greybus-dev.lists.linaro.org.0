Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id EE713AC476E
	for <lists+greybus-dev@lfdr.de>; Tue, 27 May 2025 07:15:32 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 6AE4444493
	for <lists+greybus-dev@lfdr.de>; Tue, 27 May 2025 05:15:31 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by lists.linaro.org (Postfix) with ESMTPS id 7E8D24403B
	for <greybus-dev@lists.linaro.org>; Tue, 27 May 2025 05:15:28 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=N6xdaNGv;
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 172.234.252.31 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org;
	dmarc=pass (policy=none) header.from=linuxfoundation.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CB3F9452D1;
	Tue, 27 May 2025 05:15:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C188C4CEEA;
	Tue, 27 May 2025 05:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1748322927;
	bh=xURgOK3pFJUXKZ6fAfxjAMKIOiAO6nzG5Owtv/6PTGo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N6xdaNGv/eqQmSAW8B3Nj3Dh5VzUj7UHdCMFlpO5QpNGmbSL+iFWNu7+5aGcyQMLC
	 jxW4UVP/zwIxClOomUa5xpOCnzzQPCR2MoktQw4/I1zS0kLlwskuxObiVzX2gyqWqQ
	 WVdvAUObTaNL16vx2UsG7Qk3shn+DzFfD/EhdSn8=
Date: Tue, 27 May 2025 07:15:19 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: clingfei <clf700383@gmail.com>
Message-ID: <2025052700-ungodly-vitality-d86d@gregkh>
References: <20250527050635.946553-1-clf700383@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250527050635.946553-1-clf700383@gmail.com>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Spamd-Result: default: False [0.50 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	BAYES_HAM(-3.00)[99.99%];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.252.31];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	URIBL_BLOCKED(0.00)[sea.source.kernel.org:rdns,sea.source.kernel.org:helo,linuxfoundation.org:dkim];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[linuxfoundation.org:+]
X-Rspamd-Queue-Id: 7E8D24403B
X-Spamd-Bar: /
Message-ID-Hash: 6QLTTGFGVLLPXK6KBKFJPHALLKKZKB7W
X-Message-ID-Hash: 6QLTTGFGVLLPXK6KBKFJPHALLKKZKB7W
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: elder@kernel.org, keescook@chromium.org, johan@kernel.org, vireshk@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v2] greybus: Avoid fake flexible array for response data
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/6QLTTGFGVLLPXK6KBKFJPHALLKKZKB7W/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, May 27, 2025 at 01:06:35PM +0800, clingfei wrote:
> We want to get rid of zero size arrays and use flexible arrays instead.
> However, in this case the struct is just one flexible array of u8 which
> adds no value. Just use a pointer instead.

Not true at all, sorry, it does "add value".  Please read the greybus
specification if you have questions about this.

> 
> v1: https://lore.kernel.org/all/202505262032.507AD8E0DC@keescook/

Please read our documentation for how to properly version kernel patches

> 
> Signed-off-by: clingfei <clf700383@gmail.com>

Also, we need a "full"name, not an email alias.

> ---
>  drivers/staging/greybus/i2c.c             | 12 ++++--------
>  include/linux/greybus/greybus_protocols.h |  3 ---
>  2 files changed, 4 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/staging/greybus/i2c.c b/drivers/staging/greybus/i2c.c
> index 14f1ff6d448c..b248d6717b71 100644
> --- a/drivers/staging/greybus/i2c.c
> +++ b/drivers/staging/greybus/i2c.c
> @@ -144,15 +144,14 @@ gb_i2c_operation_create(struct gb_connection *connection,
>  }
>  
>  static void gb_i2c_decode_response(struct i2c_msg *msgs, u32 msg_count,
> -				   struct gb_i2c_transfer_response *response)
> +				   u8 *data)
>  {
>  	struct i2c_msg *msg = msgs;
> -	u8 *data;
>  	u32 i;
>  
> -	if (!response)
> +	if (!data)
>  		return;
> -	data = response->data;
> +
>  	for (i = 0; i < msg_count; i++) {
>  		if (msg->flags & I2C_M_RD) {
>  			memcpy(msg->buf, data, msg->len);
> @@ -188,10 +187,7 @@ static int gb_i2c_transfer_operation(struct gb_i2c_device *gb_i2c_dev,
>  
>  	ret = gb_operation_request_send_sync(operation);
>  	if (!ret) {
> -		struct gb_i2c_transfer_response *response;
> -
> -		response = operation->response->payload;
> -		gb_i2c_decode_response(msgs, msg_count, response);
> +		gb_i2c_decode_response(msgs, msg_count, operation->response->payload);
>  		ret = msg_count;
>  	} else if (!gb_i2c_expected_transfer_error(ret)) {
>  		dev_err(dev, "transfer operation failed (%d)\n", ret);
> diff --git a/include/linux/greybus/greybus_protocols.h b/include/linux/greybus/greybus_protocols.h
> index 820134b0105c..6a35c78b967b 100644
> --- a/include/linux/greybus/greybus_protocols.h
> +++ b/include/linux/greybus/greybus_protocols.h
> @@ -678,9 +678,6 @@ struct gb_i2c_transfer_request {
>  	__le16				op_count;
>  	struct gb_i2c_transfer_op	ops[];		/* op_count of these */
>  } __packed;
> -struct gb_i2c_transfer_response {
> -	__u8				data[0];	/* inbound data */
> -} __packed;

As I said before, you can't just delete structures that are exported to
userspace without breaking things.  Why is this change acceptable to do
that?

And how was any of this tested?

greg k-h
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
