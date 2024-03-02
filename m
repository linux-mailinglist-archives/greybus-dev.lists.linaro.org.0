Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CD3C86F0D0
	for <lists+greybus-dev@lfdr.de>; Sat,  2 Mar 2024 16:18:25 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 3448B43FF9
	for <lists+greybus-dev@lfdr.de>; Sat,  2 Mar 2024 15:18:24 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	by lists.linaro.org (Postfix) with ESMTPS id 864F73F3C2
	for <greybus-dev@lists.linaro.org>; Sat,  2 Mar 2024 15:18:16 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=H6J+qKG+;
	spf=pass (lists.linaro.org: domain of rmfrfs@gmail.com designates 209.85.221.52 as permitted sender) smtp.mailfrom=rmfrfs@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-33ddd1624beso1912474f8f.1
        for <greybus-dev@lists.linaro.org>; Sat, 02 Mar 2024 07:18:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709392695; x=1709997495; darn=lists.linaro.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=d3tsMku+8+1/N/PLDjGS+jqwA4yTKYJa9xvpuCgVhy4=;
        b=H6J+qKG+xYG9566aX61Vq4d7W6rxYU5DxjPEm3dayAXTl0S/La0x9hLOwpSxC94Ppl
         Jy8PuEaKtmj+kwzE+3nQLej9/pKEavBIchiyLLUO60uVUZiIFTCW8IJ3Brnah6JJzUuP
         fUI9SjRviXbJPd2s+FZOBKOqW9pt5PPVMcaQi2zeQiT0XRgYh1nTSgbHrXxuOJLUipuN
         polyYjnWzweKQPh41NH3LfTCozXjzPW4RAK9kzE9GL9KkQl3RvDFJGqP6xS/o8+jSiY5
         nf0d/d/JQwK0puEVs2qV9/+xGgXL3NJDa5bvYALUFmQLk4gqn3Dbzuk+adliM9jaPjf5
         NbcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709392695; x=1709997495;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d3tsMku+8+1/N/PLDjGS+jqwA4yTKYJa9xvpuCgVhy4=;
        b=JQn4aLr8hwk8cNtf3znacbXpq+aqml3IO9IbdgocYJ7spNsGlZ+SBLzC3UHHm8sUgo
         w7QBdGvQ2V0biTZkvrLFOIkfYq3UuvyikSw688WLmAxXMHEXhGPdA5lI1XNlb/ecW6e7
         2vDVrDFvUHvyY7pSFcGPj9gjmL9qVw9Is6OuV0gVZ0ujJ5lMTy8zh0ab15WvAnJ6+xI3
         KA6k2gGaqaIH4/PswaVTiPd+qw9ySTgxi99FV7mpbjgSLyjXGKOONeXEVpk8U3eR9B5T
         bszkN5zNzEIG4nDHgOZu0JOc09orJjppJWwXWuchXi5KJlte8p/SM1hyhvm/bO/DklmY
         ESeg==
X-Forwarded-Encrypted: i=1; AJvYcCXKYv1hGa4DKkC5V62w3EDcgmcGBJrDeeVg5gQKMTAJtPMGdaV5ZXD0MTsUlJQR8//DcjJYgjhcfokTyBfz0v1QsU1MnbwSA4QqaQxX
X-Gm-Message-State: AOJu0Ywmo/0v/QgZIcD8y1E0XHLccC0B7YZQ4dSSGkyglmfvzJGU9BK/
	4Ht2S4EiScTZhXu/TYHF01q1kCHgHHci3sgcakeSp9GStvcyTrTh
X-Google-Smtp-Source: AGHT+IHMGqcaebuU5XjaJPHEn0KuC12L6kxnnC++HraoFBZmu+7GOQj+YVKjoRWrraAtMf/akjrVOw==
X-Received: by 2002:adf:ca8a:0:b0:33e:1505:9463 with SMTP id r10-20020adfca8a000000b0033e15059463mr5508436wrh.13.1709392695236;
        Sat, 02 Mar 2024 07:18:15 -0800 (PST)
Received: from localhost (a109-49-32-45.cpe.netcabo.pt. [109.49.32.45])
        by smtp.gmail.com with ESMTPSA id p18-20020adf9d92000000b0033e18f5714esm5454212wre.59.2024.03.02.07.18.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Mar 2024 07:18:14 -0800 (PST)
From: Rui Miguel Silva <rmfrfs@gmail.com>
To: Mikhail Lobanov <m.lobanov@rosalinux.ru>
In-Reply-To: <20240301190425.120605-1-m.lobanov@rosalinux.ru>
References: <20240301190425.120605-1-m.lobanov@rosalinux.ru>
Date: Sat, 02 Mar 2024 15:18:13 +0000
Message-ID: <m31q8smzm2.fsf@gmail.com>
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 864F73F3C2
X-Spamd-Bar: --------
X-Spamd-Result: default: False [-8.00 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.221.52:from];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_TWO(0.00)[2];
	MID_RHS_MATCH_FROM(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+]
Message-ID-Hash: MPGWY7UYRNHHQ7ALMMTWZGS23RCD4D6A
X-Message-ID-Hash: MPGWY7UYRNHHQ7ALMMTWZGS23RCD4D6A
X-MailFrom: rmfrfs@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Mikhail Lobanov <m.lobanov@rosalinux.ru>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] greybus: Fix deref of NULL in __gb_lights_flash_brightness_set
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/MPGWY7UYRNHHQ7ALMMTWZGS23RCD4D6A/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Mikhail,
Thanks for your patch.

Mikhail Lobanov <m.lobanov@rosalinux.ru> writes:

> Dereference of null pointer in the __gb_lights_flash_brightness_set function.
> Assigning the channel the result of executing the get_channel_from_mode function
> without checking for NULL may result in an error.
>
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
>
> Fixes: 2870b52bae4c ("greybus: lights: add lights implementation")
> Signed-off-by: Mikhail Lobanov <m.lobanov@rosalinux.ru>

Yeah, at the time when this was implemented I recall that we could only
set the brightness of the torch mode in a flash led, not in the flash
only mode. So, if we were getting here was that for sure we had a torch
channel and get_channel_from_mode will always find a channel, so never
returning null here.

but yeah, this is safer. but maybe just do something like the bellow
would be simpler:
modified   drivers/staging/greybus/light.c
@@ -147,6 +147,9 @@ static int __gb_lights_flash_brightness_set(struct gb_channel *channel)
 		channel = get_channel_from_mode(channel->light,
 						GB_CHANNEL_MODE_TORCH);
 
+	if (!channel)
+		return -EINVAL;
+
 	/* For not flash we need to convert brightness to intensity */
 	intensity = channel->intensity_uA.min +
 			(channel->intensity_uA.step * channel->led->brightness);

what do you think?

Cheers,
    Rui

> ---
>  drivers/staging/greybus/light.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/staging/greybus/light.c b/drivers/staging/greybus/light.c
> index 87d36948c610..929514350947 100644
> --- a/drivers/staging/greybus/light.c
> +++ b/drivers/staging/greybus/light.c
> @@ -148,10 +148,15 @@ static int __gb_lights_flash_brightness_set(struct gb_channel *channel)
>  						GB_CHANNEL_MODE_TORCH);
>  
>  	/* For not flash we need to convert brightness to intensity */
> -	intensity = channel->intensity_uA.min +
> +
> +	if (channel) {
> +		intensity = channel->intensity_uA.min +
>  			(channel->intensity_uA.step * channel->led->brightness);
>  
> -	return __gb_lights_flash_intensity_set(channel, intensity);
> +		return __gb_lights_flash_intensity_set(channel, intensity);
> +	}
> +
> +	return 0;
>  }
>  #else
>  static struct gb_channel *get_channel_from_cdev(struct led_classdev *cdev)
> -- 
> 2.43.0
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
