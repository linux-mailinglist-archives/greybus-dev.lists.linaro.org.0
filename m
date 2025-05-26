Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 365CFAC3EAC
	for <lists+greybus-dev@lfdr.de>; Mon, 26 May 2025 13:37:22 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 1FC1B44AF4
	for <lists+greybus-dev@lfdr.de>; Mon, 26 May 2025 11:37:21 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	by lists.linaro.org (Postfix) with ESMTPS id EB6E844342
	for <greybus-dev@lists.linaro.org>; Mon, 26 May 2025 11:37:17 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linaro.org header.s=google header.b="ZY/fx4SO";
	spf=pass (lists.linaro.org: domain of dan.carpenter@linaro.org designates 209.85.221.53 as permitted sender) smtp.mailfrom=dan.carpenter@linaro.org;
	dmarc=pass (policy=none) header.from=linaro.org
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a374f727dbso67286f8f.0
        for <greybus-dev@lists.linaro.org>; Mon, 26 May 2025 04:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748259437; x=1748864237; darn=lists.linaro.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=q+rDiPz0qSiYsyHG9zqVRKjQE9VlYlwaE/0xL4WFAXE=;
        b=ZY/fx4SOEL0L6WAQkZkItCZv6PnaRHF4P5IKVh15TYBTGDgdl8t2FG6vd80kr9BKtG
         tvx/8ZUemOxPeOODbG7Yhyue9ex1KCOKkBmriUpWNSXjjiZTN0i4Z5pkWXWqvgfZxry9
         xdxi1mQxlcCPggknrZNhncVh2qXFEBAHYaI3GCTCOxyLA8XlrLo/a9wXe14sSOqrxm7k
         ehqBeTnNz6z5yUHp3sTUvLxhKdQDUkUCuWGg9h7r+15eLao47O9C1JK2eS1C2HSuWX8u
         WdM6bjmrgRyejecm9cJnG5rVFynMqmxjmO7Njnn/8wI/CTThZwQTvdBF03kWlL3gcdqe
         FwqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748259437; x=1748864237;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q+rDiPz0qSiYsyHG9zqVRKjQE9VlYlwaE/0xL4WFAXE=;
        b=JwkoHUUJ930QtzA5s4y/VL8lusqrKubYRucsZ7i9ZyvUxJbkJCZ8G0uZZCcvwmf8f0
         sKrjzFyR3M/9zkwgES416Srbm1j3ehfhu5IIhUVBX+Y7Tkm72ex+/TGx9ddzZ1PNlIYO
         gAWgOhVuzLDxhaWTL/srqCKVtO5PPeXcbI98e79P1O0docIyopB36HCyxxb16cmc6QD6
         J4WqOjfFgqE0rp8rM+9gYHKwaKZxQP8JS+KPqSxKxtxyk666PLbIKYjXgZLhIbOyId9t
         l9HUpAfP9VRcH90/8qOu2rMMg5ozpsXPh2YPa4APPW0+whoS1PTeWY3wm8DS94KlYXVo
         aoug==
X-Forwarded-Encrypted: i=1; AJvYcCXywdnDDCAQr0Nq2/WMjZKrCYjOxIWm7LYJenSJgxeljAn4Zl4nqALooTVUgFjhlNvgDzVVEUBLI0Luvg==@lists.linaro.org
X-Gm-Message-State: AOJu0YxCt3gfSRwC5cfkaHwUJxq1yDvsNxx7ql4SdNlo2u3epFhIPf22
	0WIwmYQTQKFxWmIw9WCG59xpv54eXw8AkK5mfaWRcn5BYs2K1aJOJgcm0PG8zA2Qy3v29w==
X-Gm-Gg: ASbGnctrAD6PWIwJwEiznb/eHK6y38TN2hlK1dDpWZtNhKH9Mw/RJ2enfrO0rXF482k
	BKjbXLaWyoqbavqyPafZVLlB490Vo6/aKhW6EymVtiLc+DVDFhmXJ7IVoeHQeXZ4iat+4ipCuLn
	hcT5+gcEZcsT7V147MWkUcJWBBP0yEBXCX5/sBlz7zT8Vb+IWcPIqNrGpCH0FOrrO0FhOnNkfkT
	zFO5aKhV7H3Ugur2DwZj6xDaAUGcdkY3YvtNETajCXrKSkXQ5PdinX4piuN5a26XYjUS7QS8Kxt
	d8ibvzsIK8W8XebkZ5zHMUKAs8ilsydlubO3XLD4Hz7117H0PbL9+OCn
X-Google-Smtp-Source: AGHT+IEv5PUqkz+rdGK7cMHOMrelnch8JlHVRcoDJFXgNKq4OweFef3f63o86S/y+HO8Dwb3Au7C2g==
X-Received: by 2002:a05:6000:40ca:b0:3a4:d8f8:fba7 with SMTP id ffacd0b85a97d-3a4d8f8fd9dmr2806239f8f.2.1748259436914;
        Mon, 26 May 2025 04:37:16 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a4cce08411sm7388745f8f.51.2025.05.26.04.37.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 04:37:16 -0700 (PDT)
Date: Mon, 26 May 2025 14:37:13 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: clingfei <clf700383@gmail.com>, Kees Cook <keescook@chromium.org>
Message-ID: <aDRSaZ4Rq47hjMuY@stanley.mountain>
References: <20250526110654.3916536-1-clf700383@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250526110654.3916536-1-clf700383@gmail.com>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Spamd-Result: default: False [-4.00 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	MIME_TRACE(0.00)[0:+];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.221.53:from];
	FREEMAIL_TO(0.00)[gmail.com,chromium.org];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_TLS_LAST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RCVD_COUNT_TWO(0.00)[2];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[linaro.org:+]
X-Rspamd-Queue-Id: EB6E844342
X-Spamd-Bar: ---
Message-ID-Hash: J6OHTOO7LYVB4S26AQTMSQEX6IXHT4KM
X-Message-ID-Hash: J6OHTOO7LYVB4S26AQTMSQEX6IXHT4KM
X-MailFrom: dan.carpenter@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: elder@kernel.org, johan@kernel.org, vireshk@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] greybus: Avoid fake flexible array for response data
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/J6OHTOO7LYVB4S26AQTMSQEX6IXHT4KM/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, May 26, 2025 at 07:06:54PM +0800, clingfei wrote:
> As https://lore.kernel.org/all/20240304211940.it.083-kees@kernel.org/

I don't want to have to read a link to understand the commit message.

Does this change really affect anything in terms of "enforce the 0-sized
destinations" rule?  I don't think this is a destination.  I think Kees
enabled the checking he wanted.  You should probably CC him since we're
refering to his email.

> pointed out, to enforce the 0-sized destinations, the remaining 0-sized
> destinations need to be handled. Thus the struct
> gb_control_get_manifest_response and struct gb_i2c_transfer_response
> are removed.

Here is a better commit message;

"We want to get rid of zero size arrays and use flexible arrays instead.
However, in this case the struct is just one flexible array of u8 which
adds no value.  Just use a char pointer instead."

I would have ignored it, probably but actually the
gb_control_get_manifest_response struct is not used so put that in a
separate commit.  That's a simpler commit to review.

"The gb_control_get_manifest_response struct is not used.  Delete it."

> 
> Signed-off-by: clingfei <clf700383@gmail.com>
> ---
>  drivers/staging/greybus/i2c.c             | 9 ++++-----
>  include/linux/greybus/greybus_protocols.h | 9 ---------
>  2 files changed, 4 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/staging/greybus/i2c.c b/drivers/staging/greybus/i2c.c
> index 14f1ff6d448c..2857c2834206 100644
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
> @@ -188,7 +187,7 @@ static int gb_i2c_transfer_operation(struct gb_i2c_device *gb_i2c_dev,
>  
>  	ret = gb_operation_request_send_sync(operation);
>  	if (!ret) {
> -		struct gb_i2c_transfer_response *response;
> +		u8 *response;
>  
>  		response = operation->response->payload;
>  		gb_i2c_decode_response(msgs, msg_count, response);

I like when parameters are called the same thing on both sides.  The
name "response" adds no value.  Instead get rid of that variable and
pass operation->response->payload directly.

		gb_i2c_decode_response(msgs, msg_count,
				       operation->response->payload);

regards,
dan carpenter

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
