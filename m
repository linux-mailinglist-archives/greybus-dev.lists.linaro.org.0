Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id C47D9873268
	for <lists+greybus-dev@lfdr.de>; Wed,  6 Mar 2024 10:21:48 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id AD95643D30
	for <lists+greybus-dev@lfdr.de>; Wed,  6 Mar 2024 09:21:47 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	by lists.linaro.org (Postfix) with ESMTPS id 41AA83F983
	for <greybus-dev@lists.linaro.org>; Wed,  6 Mar 2024 09:21:42 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=SJI46+1F;
	spf=pass (lists.linaro.org: domain of rmfrfs@gmail.com designates 209.85.128.44 as permitted sender) smtp.mailfrom=rmfrfs@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-412e1b52934so3636925e9.1
        for <greybus-dev@lists.linaro.org>; Wed, 06 Mar 2024 01:21:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709716901; x=1710321701; darn=lists.linaro.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=DEbhInZlM3kJtT7xjjkbZehB8ROzUjJZQUZRHEJT3Fw=;
        b=SJI46+1FUKB1fZGGnpyEaEIUpF9kKSoUSSXHP56F7ApwK/2RXoxTDzqvwtbW/Z0VXb
         7dzQOmWeRiblMtf31suypzh2l3HVy0ma1WkhOrAtv0ne0MgsXqEN7PYh8uFwnvaCVwSu
         3TVIuQlx4+oNsMi2zpjvN1Aed75ePH0UdPmpa3G+rfZyQckKQ32EWLpaNuJNV/ojgJo3
         mNLOMc+196Zq9W+3aMvHT9GOchZFSdyxpKpNbXx7MQERbNkIi0U0BNDu4xKtVvb1Jgj0
         i2Z8BCKxGOdKlfalU0MWVg4ZEj7r2rg4e0TNc8VpK52C3UHJRlWpoQM/Oh2Nm3uXe7md
         jvrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709716901; x=1710321701;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DEbhInZlM3kJtT7xjjkbZehB8ROzUjJZQUZRHEJT3Fw=;
        b=VFOJPTHl/jf5Jl32lSwpGpsbPN96JhLXzgYw45bV8KsUCt28CcrhQERrd4B/uwEX66
         o9cq/ca42+U+7J3/UD30fI6mR5RGeNfM0K2HdnYaxckouOqQsWigFZ3eVYAuHXPRVTz7
         I7I/Hei7GJZVEQX0uB9q/jcmdO5gOZWUTA7tqnpJ/zvo1t3tBHOWLT7yReyvtROpVb+4
         Sb8Cx6aWSaXScdz2bEbMqm2vNjSIiSGQ93itcSefMP/+37bgqvW5w/euZxv1XXZ1dJ7k
         wCGXnuAaVeMf9cMC2sDNahxwyIxUWJize/nwUP/vS27b71rxUVrEn5d324Co9Hfi6YUP
         /h4Q==
X-Forwarded-Encrypted: i=1; AJvYcCUfm3056htIGFz481YiuXO97nt2zU4MWas7Ig87CqiPE4xKIpmXiWCUi49srrODWVo2bhNW+5DspJSaVB5zd2Hn0Y74EpBe7xETfXXf
X-Gm-Message-State: AOJu0YxZa5eSENaL+tRbVpoXZqm4boxpEY6vbeIbAo62jr8eGQJoK0Vm
	tz6uI/wMceaUmr/3MUL3WZtNZdb78oouCPzfUmqrhpzIN9qNUx4G
X-Google-Smtp-Source: AGHT+IEFn3clUVe3HbSihlyMh7NH6uC2n7uWdal4zB80Ths400Ms6K94kq6wQTFqZ5PbecFVK2jH1g==
X-Received: by 2002:a05:600c:4448:b0:412:ee6a:8826 with SMTP id v8-20020a05600c444800b00412ee6a8826mr3596962wmn.12.1709716900620;
        Wed, 06 Mar 2024 01:21:40 -0800 (PST)
Received: from localhost (a109-49-32-45.cpe.netcabo.pt. [109.49.32.45])
        by smtp.gmail.com with ESMTPSA id v13-20020adfd04d000000b0033d202abf01sm16944420wrh.28.2024.03.06.01.21.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Mar 2024 01:21:40 -0800 (PST)
From: Rui Miguel Silva <rmfrfs@gmail.com>
To: Mikhail Lobanov <m.lobanov@rosalinux.ru>
In-Reply-To: <20240301190425.120605-1-m.lobanov@rosalinux.ru>
References: <20240301190425.120605-1-m.lobanov@rosalinux.ru>
Date: Wed, 06 Mar 2024 09:21:39 +0000
Message-ID: <m38r2v67h8.fsf@gmail.com>
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 41AA83F983
X-Spamd-Bar: ----
X-Spamd-Result: default: False [-4.00 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	FROM_EQ_ENVFROM(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.128.44:from];
	RCPT_COUNT_FIVE(0.00)[6];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	URIBL_BLOCKED(0.00)[mail-wm1-f44.google.com:rdns,mail-wm1-f44.google.com:helo,linuxtesting.org:url,rosalinux.ru:email];
	FROM_HAS_DN(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_TLS_LAST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+]
Message-ID-Hash: 6M7PUFYL63TWXHWZKXMWSTXH2VAKBIXZ
X-Message-ID-Hash: 6M7PUFYL63TWXHWZKXMWSTXH2VAKBIXZ
X-MailFrom: rmfrfs@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Mikhail Lobanov <m.lobanov@rosalinux.ru>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] greybus: Fix deref of NULL in __gb_lights_flash_brightness_set
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/6M7PUFYL63TWXHWZKXMWSTXH2VAKBIXZ/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Mikhail,
Mikhail Lobanov <m.lobanov@rosalinux.ru> writes:

> Dereference of null pointer in the __gb_lights_flash_brightness_set function.
> Assigning the channel the result of executing the get_channel_from_mode function
> without checking for NULL may result in an error.
>
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
>
> Fixes: 2870b52bae4c ("greybus: lights: add lights implementation")
> Signed-off-by: Mikhail Lobanov <m.lobanov@rosalinux.ru>

Are you sending a new version with the changes suggested in this thread?
or do you want me to prepare something with your reported-by tag?

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
