Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id C624786F0D7
	for <lists+greybus-dev@lfdr.de>; Sat,  2 Mar 2024 16:23:12 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id DA8C73F363
	for <lists+greybus-dev@lfdr.de>; Sat,  2 Mar 2024 15:23:11 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	by lists.linaro.org (Postfix) with ESMTPS id E672D3F363
	for <greybus-dev@lists.linaro.org>; Sat,  2 Mar 2024 15:23:05 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b="c840xJw/";
	spf=pass (lists.linaro.org: domain of rmfrfs@gmail.com designates 209.85.128.41 as permitted sender) smtp.mailfrom=rmfrfs@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-412d5ae1c5cso2804535e9.2
        for <greybus-dev@lists.linaro.org>; Sat, 02 Mar 2024 07:23:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709392985; x=1709997785; darn=lists.linaro.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=A7rzo5E+RHg0C/U2GFdAHU5U5qrBuZYlX6RBI4q7dlI=;
        b=c840xJw/X5oo5SO8clADiyRWKFoujAGAA7YABOcimf/fjT0EdK4cSk3mp35enk/UVM
         zwW57fUgir9sBF2Dl8h7uXBAGn36jZD4s3wn/bos+XBWom9tBaViGcc1+SmEbAaJapAG
         BSv2OdrWtOx3KKu2fBMZBATFabtzeczKwuzMQmFuzOmVEXiWYm+p/bGH7USx3YqgIWLL
         foWdYBGtXrEJJqv/sLWnX1dgZ1Wij/Vn8Rx1dIj6R+lx898UoVTfNvfii3cnEH8245jz
         7qyz9YbTnjNKrYGixFOkQjt6vBWEMmf+YV+VGM5X6DuHLeIod2/LIvAZDgV8JTgWJylx
         LdtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709392985; x=1709997785;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A7rzo5E+RHg0C/U2GFdAHU5U5qrBuZYlX6RBI4q7dlI=;
        b=trnuvFnXSTzBssAFyUYLP78RRfHnVErGzSd6k9g4t7UnJywGcfUtCJvXOXJjH0a+a4
         tTSjChRxw12y/Ic4S5h52y1+lBylywnyDqvQPKrx+gv/BOj/G7p/AhaZjx3mStr2BiDM
         323lQ7Pjmn/F/7mJOYs2wn4XlvDjy0JGpvPVAK+33WuvU1Y+XoWOvUkZ3ybSMqk0iraK
         1rvko/ow/FOUoLi09oIPq3PpUDTRzEnGbVQGM5ZiGTVepaofA3h/aiLTG5QwwuTFS3ld
         ZX1lxEKoZ3ehsexywR6wYFM6qlqp8yCSDYt7YScUXFgIaXW6/FEKUdrRFlZaS/S5nrlP
         G3GA==
X-Forwarded-Encrypted: i=1; AJvYcCUcw+bSBEiRkLJv/SUcQ6uTP6B8oEIy6VczhJHIM2/tODmAx8NLFojnGMIPP1ZR1ckV06pywZGlws5abWp1cjZIaeNNrNgy1gr5VMTH
X-Gm-Message-State: AOJu0YzRfljZSOzZ5gE0Eo5j6spYpKvdukNbYCbF1nWp5NpSdRpHTPBA
	yH8UL6QYikfWD9nRqISRPTFSalv37qyLFV0H58qrgnkMWZV8YzJJ
X-Google-Smtp-Source: AGHT+IF9EsswUNlrC8dO3hIulzO0/nAlfpDfjvuB54ZVatBrhaWcGqVfEjcX2nY29ypVQwZKsWWmYg==
X-Received: by 2002:a05:600c:468a:b0:412:b0d3:62f4 with SMTP id p10-20020a05600c468a00b00412b0d362f4mr3921542wmo.26.1709392984465;
        Sat, 02 Mar 2024 07:23:04 -0800 (PST)
Received: from localhost (a109-49-32-45.cpe.netcabo.pt. [109.49.32.45])
        by smtp.gmail.com with ESMTPSA id p3-20020a5d4583000000b0033b47ee01f1sm7486148wrq.49.2024.03.02.07.23.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Mar 2024 07:23:04 -0800 (PST)
From: Rui Miguel Silva <rmfrfs@gmail.com>
To: Dan Carpenter <dan.carpenter@linaro.org>, Mikhail Lobanov
 <m.lobanov@rosalinux.ru>
In-Reply-To: <7ef732ad-a50f-4cf5-8322-376f42eb051b@moroto.mountain>
References: <20240301190425.120605-1-m.lobanov@rosalinux.ru>
 <7ef732ad-a50f-4cf5-8322-376f42eb051b@moroto.mountain>
Date: Sat, 02 Mar 2024 15:23:03 +0000
Message-ID: <m3ttlolktk.fsf@gmail.com>
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: E672D3F363
X-Spamd-Bar: --------
X-Spamd-Result: default: False [-8.00 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17:c];
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
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.128.41:from];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_COUNT_TWO(0.00)[2];
	MID_RHS_MATCH_FROM(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+]
Message-ID-Hash: VYFGSNRPR2EJT5POW2MVGMI2O6LL6VJL
X-Message-ID-Hash: VYFGSNRPR2EJT5POW2MVGMI2O6LL6VJL
X-MailFrom: rmfrfs@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] greybus: Fix deref of NULL in __gb_lights_flash_brightness_set
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/VYFGSNRPR2EJT5POW2MVGMI2O6LL6VJL/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Dan Carpenter <dan.carpenter@linaro.org> writes:
Hi Dan,

> On Fri, Mar 01, 2024 at 02:04:24PM -0500, Mikhail Lobanov wrote:
>> Dereference of null pointer in the __gb_lights_flash_brightness_set function.
>> Assigning the channel the result of executing the get_channel_from_mode function
>> without checking for NULL may result in an error.
>
> get_channel_from_mode() can only return NULL when light->channels_count
> is zero.
>
> Although get_channel_from_mode() seems buggy to me.  If it can't
> find the correct mode, it just returns the last channel.  So potentially
> it should be made to return NULL.

Correct, thanks for the fix. Will you or me send a proper patch for
this? Taking also the suggestion from Alex.

Thanks in advance.

Cheers,
   Rui
>
> diff --git a/drivers/staging/greybus/light.c b/drivers/staging/greybus/light.c
> index d62f97249aca..acd435f5d25d 100644
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
>  		if (channel && channel->mode == mode)
> -			break;
> +			return channel;
>  	}
> -	return channel;
> +	return NULL;
>  }
>  
>  static int __gb_lights_flash_intensity_set(struct gb_channel *channel,
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
