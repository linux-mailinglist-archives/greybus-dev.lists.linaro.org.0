Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BF4EA7DFFF
	for <lists+greybus-dev@lfdr.de>; Mon,  7 Apr 2025 15:51:33 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 59D554427F
	for <lists+greybus-dev@lfdr.de>; Mon,  7 Apr 2025 13:51:32 +0000 (UTC)
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	by lists.linaro.org (Postfix) with ESMTPS id BC5B13E80D
	for <greybus-dev@lists.linaro.org>; Mon,  7 Apr 2025 13:49:36 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=riscstar-com.20230601.gappssmtp.com header.s=20230601 header.b=m5oIOgAp;
	spf=pass (lists.linaro.org: domain of elder@riscstar.com designates 209.85.167.177 as permitted sender) smtp.mailfrom=elder@riscstar.com;
	dmarc=pass (policy=none) header.from=riscstar.com
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-3f7f7b70aebso2700237b6e.2
        for <greybus-dev@lists.linaro.org>; Mon, 07 Apr 2025 06:49:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744033776; x=1744638576; darn=lists.linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dIXA1CtYmOM8PewjK/ZzArTuI36AiEw8n/KPp8qCjcQ=;
        b=m5oIOgApNV2PAqVsDI7r9ePh5Hot1rqFGDYtbktfThA8YRw7g3gNQAH8Edc5JTlfig
         QtUXVWE9gwCiS+I4+7jnWb3DcmROgG0O5vcppKyYVcwjrztPYZJ0lbHlCsPzXvv5f02I
         8NRYsrD57oRglPLy53Ihiznr1Rtuj3TUVBicmQo0S37JbmKR/57CZXfDOotmnzAWa7xC
         pzE8BGUi+Vot+RUu2M2DCtMdwl0feLzTsXSxZ5GU3gC+XqV/twooRqXVLFPicofDYzsC
         gXyxj7J6rvfZ3AwUPwnMZ31dmzG++R8bWTafo3zuNWF2FHNvXYaoLgUKDWlXu4lQIQK2
         0dKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744033776; x=1744638576;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dIXA1CtYmOM8PewjK/ZzArTuI36AiEw8n/KPp8qCjcQ=;
        b=Lt6RaUW+61LFHpNF0afu4+0eAgu9gD+SpV4GsDK/cmgK7lhiSnKnNaajVPTeH9Lo1m
         b1Tbjt53z2JKdO1pY9UD8CJpNqlRqyhkULfKGPBH34/7Z9hJua5w31CdtGEGL5ASRBqg
         raBAHGssMe8CLg7AlFSMqfJ6kzCc2OGZYrdLmOrIm1uiFKh85BSdBg8N2L4cimfdutOi
         HsqSniziTck14vphe/75WkFrvc0VrQ/liI5gHHuBnINZ+zqKcLFr7MYrDoNPPNJ8SUp9
         1C+s53ZJLH4sRIgj8Ku0dDzTMEgzpohT2wFXvBUTGXIT8HgJZ80Rna7fIERo9ig2Oq0U
         uF4Q==
X-Gm-Message-State: AOJu0YyXlbHQXbcNIhADaAN2sCJzE45U/w5yIL572ENE02fZpvrgEVkN
	1VKtlPnJHSPBnpw+ecQvX0IqjASca0FC8ygZs4vwWjBMGng80K2FlAUak+6DOFM=
X-Gm-Gg: ASbGncu40CO4p1sfwK88VgePS9sM6RprykoEd7hWW7kH3yigBsQZRd9pxLx/4/QXA06
	a45h8GFETllFoMuliRhrVU2IeaLA4hpoP7b4lMpP58uCx43PADVsAUmVPCq+dAmEwHEYaaIPDrW
	YA0YuAdeRYnAe+9n6dCKBjNFRTkRDX2xIbr0AapNJep3/+KzuLElR1hBEjMJNzRWJRGytye28a0
	1IbX/koxkVXTpytU2IkWxicTOEGUm2JS+Oz6Z7Pa8LVcocs8O75Ke1noJHtQuC6G6Z9OsQieYwX
	bS2LA+cYoNiL1l7QhTDDB0BnLl1VKeuy/j+rkT3MPqrmHZenIjXcawSyofi0a8i/F8a29efLXQR
	P52xp8VDrug==
X-Google-Smtp-Source: AGHT+IG/WeJOsYTJug2WwIegYoFPtqQ1kYLmD+mN7tixYlfHeBiAMs6zs8YlU4OTlrzTKkroXpuE/Q==
X-Received: by 2002:a05:6808:229e:b0:3fb:57ca:1ea7 with SMTP id 5614622812f47-4004668c4a6mr7559744b6e.36.1744033776048;
        Mon, 07 Apr 2025 06:49:36 -0700 (PDT)
Received: from [172.22.22.234] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40040099665sm1725950b6e.43.2025.04.07.06.49.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Apr 2025 06:49:35 -0700 (PDT)
Message-ID: <184ecf87-823a-42ef-9903-a21c787e0c5d@riscstar.com>
Date: Mon, 7 Apr 2025 08:49:34 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bartosz Golaszewski <brgl@bgdev.pl>, Rui Miguel Silva <rmfrfs@gmail.com>,
 Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linus Walleij <linus.walleij@linaro.org>
References: <20250407-gpiochip-set-rv-greybus-v1-1-9d4f721db7ca@linaro.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250407-gpiochip-set-rv-greybus-v1-1-9d4f721db7ca@linaro.org>
X-Rspamd-Queue-Id: BC5B13E80D
X-Spamd-Bar: ---------
X-Spamd-Result: default: False [-9.00 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	RBL_SENDERSCORE_REPUT_9(-1.00)[209.85.167.177:from];
	DMARC_POLICY_ALLOW(-0.50)[riscstar.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[riscstar-com.20230601.gappssmtp.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.167.177:from];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DWL_DNSWL_BLOCKED(0.00)[gappssmtp.com:dkim];
	FREEMAIL_TO(0.00)[bgdev.pl,gmail.com,kernel.org,linuxfoundation.org,linaro.org];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_IN_DNSWL_NONE(0.00)[209.85.167.177:from];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DKIM_TRACE(0.00)[riscstar-com.20230601.gappssmtp.com:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-MailFrom: elder@riscstar.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: 6XB443VRV4NVZOK74TEDJYXS645EQJZ2
X-Message-ID-Hash: 6XB443VRV4NVZOK74TEDJYXS645EQJZ2
X-Mailman-Approved-At: Mon, 07 Apr 2025 13:51:27 +0000
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: use new GPIO line value setter callbacks
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/6XB443VRV4NVZOK74TEDJYXS645EQJZ2/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit

On 4/7/25 2:14 AM, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Here is the commit that enabled these:
   98ce1eb1fd87e gpiolib: introduce gpio_chip setters that return values

This looks good.  Thank you.

Reviewed-by: Alex Elder <elder@riscstar.com>

> ---
>   drivers/staging/greybus/gpio.c | 16 +++++++++-------
>   1 file changed, 9 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/staging/greybus/gpio.c b/drivers/staging/greybus/gpio.c
> index 16bcf7fc8158..f81c34160f72 100644
> --- a/drivers/staging/greybus/gpio.c
> +++ b/drivers/staging/greybus/gpio.c
> @@ -185,8 +185,8 @@ static int gb_gpio_get_value_operation(struct gb_gpio_controller *ggc,
>   	return 0;
>   }
>   
> -static void gb_gpio_set_value_operation(struct gb_gpio_controller *ggc,
> -					u8 which, bool value_high)
> +static int gb_gpio_set_value_operation(struct gb_gpio_controller *ggc,
> +				       u8 which, bool value_high)
>   {
>   	struct device *dev = &ggc->gbphy_dev->dev;
>   	struct gb_gpio_set_value_request request;
> @@ -195,7 +195,7 @@ static void gb_gpio_set_value_operation(struct gb_gpio_controller *ggc,
>   	if (ggc->lines[which].direction == 1) {
>   		dev_warn(dev, "refusing to set value of input gpio %u\n",
>   			 which);
> -		return;
> +		return -EPERM;
>   	}
>   
>   	request.which = which;
> @@ -204,10 +204,12 @@ static void gb_gpio_set_value_operation(struct gb_gpio_controller *ggc,
>   				&request, sizeof(request), NULL, 0);
>   	if (ret) {
>   		dev_err(dev, "failed to set value of gpio %u\n", which);
> -		return;
> +		return ret;
>   	}
>   
>   	ggc->lines[which].value = request.value;
> +
> +	return 0;
>   }
>   
>   static int gb_gpio_set_debounce_operation(struct gb_gpio_controller *ggc,
> @@ -457,11 +459,11 @@ static int gb_gpio_get(struct gpio_chip *chip, unsigned int offset)
>   	return ggc->lines[which].value;
>   }
>   
> -static void gb_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
> +static int gb_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
>   {
>   	struct gb_gpio_controller *ggc = gpiochip_get_data(chip);
>   
> -	gb_gpio_set_value_operation(ggc, (u8)offset, !!value);
> +	return gb_gpio_set_value_operation(ggc, (u8)offset, !!value);
>   }
>   
>   static int gb_gpio_set_config(struct gpio_chip *chip, unsigned int offset,
> @@ -555,7 +557,7 @@ static int gb_gpio_probe(struct gbphy_device *gbphy_dev,
>   	gpio->direction_input = gb_gpio_direction_input;
>   	gpio->direction_output = gb_gpio_direction_output;
>   	gpio->get = gb_gpio_get;
> -	gpio->set = gb_gpio_set;
> +	gpio->set_rv = gb_gpio_set;
>   	gpio->set_config = gb_gpio_set_config;
>   	gpio->base = -1;		/* Allocate base dynamically */
>   	gpio->ngpio = ggc->line_max + 1;
> 
> ---
> base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
> change-id: 20250331-gpiochip-set-rv-greybus-cd2365755186
> 
> Best regards,

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
