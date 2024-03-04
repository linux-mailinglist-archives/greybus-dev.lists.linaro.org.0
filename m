Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B6E786FCF5
	for <lists+greybus-dev@lfdr.de>; Mon,  4 Mar 2024 10:17:45 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 8BB0B3F6D8
	for <lists+greybus-dev@lfdr.de>; Mon,  4 Mar 2024 09:17:44 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	by lists.linaro.org (Postfix) with ESMTPS id 1D4313F654
	for <greybus-dev@lists.linaro.org>; Mon,  4 Mar 2024 09:17:39 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=ADEFFspC;
	spf=pass (lists.linaro.org: domain of rmfrfs@gmail.com designates 209.85.208.175 as permitted sender) smtp.mailfrom=rmfrfs@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2d2ab9c5e83so41402751fa.2
        for <greybus-dev@lists.linaro.org>; Mon, 04 Mar 2024 01:17:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709543858; x=1710148658; darn=lists.linaro.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=wxb84sArYHWCge17RqY2dnfS8pZorGfPXvmpeXBM+UE=;
        b=ADEFFspCBr+XUVbhaoiUZNghkx35KHN/ccdR1oxU84DuEUgf4j8kZoQbzMZaohoFb7
         jXfq59hCpZX2vt9qAbtxE6HDf/XvbV0CfsvGDPe5+osG87Cs5c/SFHnXzps9wLIMYI12
         jfewDrJlyLYpWMul70lT2HvHe29DACgvS0aKiE79m/Q7zXI9S0A0FTt0glNvQxvTYxJg
         XsN4R3H/RQ/J+BJUAMMUh8j9ln/PgW9iGpYPxs3qXHjKVlBzw60BbY/coH9t+8rrFuAO
         MbYHlz78Y8gkIhReJrrX5c7wYaXgTs8d2i97LGxG9yuctGgnxlxZbtvlyGf5z+1fxF4C
         nXCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709543858; x=1710148658;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wxb84sArYHWCge17RqY2dnfS8pZorGfPXvmpeXBM+UE=;
        b=WXjpIjwU02vV4SuIE4crzmT9VrT8kxHzQ5+xH8SMtYHve1niUxSuEtDT8xztZDoGWS
         D53mQHcrTSdaES+Qw5c6UIL5jQXyIDPvqC0CS5g7jhhBdiZ3wW1YPiKbNmw6KZkjry5O
         78d4TdKe2VhcHI7H+rqCmKyovOdpFQFFaNNoTIU35zJCtUqQRggaRvTfPtTMp9ZksE6U
         ofNs6UCynv+pmoSWUQvGWU68DcCcD8IIXo5urjht4dTUD1w7Iupecmh56zmV6V6CxrYg
         LF5r12/BD79I/J8vgtsyh+6zh2P44ylgrvpl1bPAMXbGxhPAk3YCL2CUfGbGiZIwUWWb
         2b7w==
X-Forwarded-Encrypted: i=1; AJvYcCUmBPf1I/QOVAbWE3mlj6bfavms+iZzDWIO9rloecfoRU/TTzetipfv+ikhyUIUlsMGfS887UHz5ogvNWhfTWJpMVfIO/qY1Us2iYCU
X-Gm-Message-State: AOJu0YylkdE3be5gEOcBdPzWUxlu8ZQEyG6YIEAbJ/NbzaYO1aIIZ/sV
	LhOQ6eBUTSUlaxD3yYREMEeg50b4qXQWJyDFOeUhUZq7ovO/oJZh
X-Google-Smtp-Source: AGHT+IHoWbhv0G7/RF1N1tx36guIvvx6OukW50GAMYLBOZmWqoYnRwfEqdFQ9lwVbVqHZlcw8HR+hQ==
X-Received: by 2002:a2e:9cd3:0:b0:2d2:b068:6d2a with SMTP id g19-20020a2e9cd3000000b002d2b0686d2amr5802516ljj.16.1709543857438;
        Mon, 04 Mar 2024 01:17:37 -0800 (PST)
Received: from localhost (a109-49-32-45.cpe.netcabo.pt. [109.49.32.45])
        by smtp.gmail.com with ESMTPSA id a10-20020a05600c348a00b00412e5060995sm1679557wmq.34.2024.03.04.01.17.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Mar 2024 01:17:36 -0800 (PST)
From: Rui Miguel Silva <rmfrfs@gmail.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
In-Reply-To: <379c0cb4-39e0-4293-8a18-c7b1298e5420@moroto.mountain>
References: <379c0cb4-39e0-4293-8a18-c7b1298e5420@moroto.mountain>
Date: Mon, 04 Mar 2024 09:17:36 +0000
Message-ID: <m3sf16tky7.fsf@gmail.com>
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 1D4313F654
X-Spamd-Bar: --------
X-Spamd-Result: default: False [-8.00 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.208.175:from];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	DKIM_TRACE(0.00)[gmail.com:+]
Message-ID-Hash: W5WIWLPJYTTFARNLI2IJIFUPHTBQRKOX
X-Message-ID-Hash: W5WIWLPJYTTFARNLI2IJIFUPHTBQRKOX
X-MailFrom: rmfrfs@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: fix get_channel_from_mode() failure path
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/W5WIWLPJYTTFARNLI2IJIFUPHTBQRKOX/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Dan,
once again thanks for the patch.

Dan Carpenter <dan.carpenter@linaro.org> writes:

> The get_channel_from_mode() function is supposed to return the channel
> which matches the mode.  But it has a bug where if it doesn't find a
> matching channel then it returns the last channel.  It should return
> NULL instead.
>
> Also remove an unnecessary NULL check on "channel".
>
> Fixes: 2870b52bae4c ("greybus: lights: add lights implementation")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Reviewed-by: Rui Miguel Silva <rmfrfs@gmail.com>

Cheers,
  Rui

> ---
>  drivers/staging/greybus/light.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/staging/greybus/light.c b/drivers/staging/greybus/light.c
> index d62f97249aca..a5c2fe963866 100644
> --- a/drivers/staging/greybus/light.c
> +++ b/drivers/staging/greybus/light.c
> @@ -95,15 +95,15 @@ static struct led_classdev *get_channel_cdev(struct gb_channel *channel)
>  static struct gb_channel *get_channel_from_mode(struct gb_light *light,
>  						u32 mode)
>  {
> -	struct gb_channel *channel = NULL;
> +	struct gb_channel *channel;
>  	int i;
>  
>  	for (i = 0; i < light->channels_count; i++) {
>  		channel = &light->channels[i];
> -		if (channel && channel->mode == mode)
> -			break;
> +		if (channel->mode == mode)
> +			return channel;
>  	}
> -	return channel;
> +	return NULL;
>  }
>  
>  static int __gb_lights_flash_intensity_set(struct gb_channel *channel,
> -- 
> 2.43.0
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
