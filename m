Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 0240B86F0DC
	for <lists+greybus-dev@lfdr.de>; Sat,  2 Mar 2024 16:31:50 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 067F34402D
	for <lists+greybus-dev@lfdr.de>; Sat,  2 Mar 2024 15:31:50 +0000 (UTC)
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
	by lists.linaro.org (Postfix) with ESMTPS id 8E2763F3C2
	for <greybus-dev@lists.linaro.org>; Sat,  2 Mar 2024 15:31:40 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=ieee.org header.s=google header.b=EfGt0JUR;
	spf=pass (lists.linaro.org: domain of elder@ieee.org designates 209.85.166.49 as permitted sender) smtp.mailfrom=elder@ieee.org;
	dmarc=pass (policy=quarantine) header.from=ieee.org
Received: by mail-io1-f49.google.com with SMTP id ca18e2360f4ac-7c7f3f66d17so148337739f.0
        for <greybus-dev@lists.linaro.org>; Sat, 02 Mar 2024 07:31:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1709393500; x=1709998300; darn=lists.linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pcwS+vAT2fwsjgoSR/yvl2URHCxzURia5C1neOopGqY=;
        b=EfGt0JURkcWHLZt+NDAkuescxALE6xY3ZGGcQlB2ZHNAkHiKpKdWKTSUqi9AO0of+Z
         6KvCEPVP47BZcTcgXVI25+zNXzcO5QTCQWo1Jc4Td8ZU2d/ULkQ4l6PMtyXAjvm2klW7
         hBO14Iv1ycyzcM9By8jBki3/TVJd+Lom6YmWU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709393500; x=1709998300;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pcwS+vAT2fwsjgoSR/yvl2URHCxzURia5C1neOopGqY=;
        b=h+R+COTLMaiVVr9j3n/mylP4kOOe171kOW14I2dvuuAF0ZJgfNxvEcwJlJxnMX1Sxs
         eUSzJLGpV4bzHRkACWFyifTttxPLVAPVYu/9DTY0IIkcnERWGPQixPlyAL16/ZGfiVoI
         15j7xKEdOeIfOUNqUR5SYV01Z1AbpWqkdmapBRnuiLH16+9OLVN3OoBQhyZ1+shjK+mT
         f+ej8iLsrANRr4ht8SdKOd512bSYkO233yWxrQUDuzQ2DYU/jBwZ5tp70fZ3sUPrTPec
         eOWeL1SbxjyodJIBluDhNJZlrWBhdosOC+KCMYIAtrJ7b7xBJQiPLG4q9s4Ek48jSS4K
         Gwdw==
X-Gm-Message-State: AOJu0YwXkIewLr4HMwv6GVb+Jm4aUaymCDT3WbM4bb2i7/no3rkmJXkh
	zPkCmelRcltZGrCgH8car4ZjeNwqXo8OvPpvvJinAK4Wa+/fj532PfHxodC6vehn0UnWfCoiqfk
	=
X-Google-Smtp-Source: AGHT+IEBv+JTa8wk1BLmy4gNLO1GkrEgOLNKogq6t7WnUC0e929OVeUuFvEzgQyds5sDteHCjN1p8Q==
X-Received: by 2002:a5e:a810:0:b0:7c7:f6ac:cb4 with SMTP id c16-20020a5ea810000000b007c7f6ac0cb4mr4979742ioa.3.1709393499975;
        Sat, 02 Mar 2024 07:31:39 -0800 (PST)
Received: from [10.211.55.3] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.googlemail.com with ESMTPSA id s7-20020a056602168700b007c7ab36d3ffsm1438960iow.43.2024.03.02.07.31.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 Mar 2024 07:31:39 -0800 (PST)
Message-ID: <07df4b96-70c2-41de-9d76-1deb80447a79@ieee.org>
Date: Sat, 2 Mar 2024 09:31:38 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Mikhail Lobanov <m.lobanov@rosalinux.ru>,
 Rui Miguel Silva <rmfrfs@gmail.com>
References: <20240301190425.120605-1-m.lobanov@rosalinux.ru>
From: Alex Elder <elder@ieee.org>
In-Reply-To: <20240301190425.120605-1-m.lobanov@rosalinux.ru>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 8E2763F3C2
X-Spamd-Bar: -------
X-Spamd-Result: default: False [-7.99 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	DMARC_POLICY_ALLOW(-0.50)[ieee.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[ieee.org:s=google];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.166.49:from];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_TO(0.00)[rosalinux.ru,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[ieee.org:+]
Message-ID-Hash: BWSZ5N3HINZW4PBIXCOSBWYMRTTDF6BQ
X-Message-ID-Hash: BWSZ5N3HINZW4PBIXCOSBWYMRTTDF6BQ
X-MailFrom: elder@ieee.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] greybus: Fix deref of NULL in __gb_lights_flash_brightness_set
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/BWSZ5N3HINZW4PBIXCOSBWYMRTTDF6BQ/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit

On 3/1/24 1:04 PM, Mikhail Lobanov wrote:
> Dereference of null pointer in the __gb_lights_flash_brightness_set function.
> Assigning the channel the result of executing the get_channel_from_mode function
> without checking for NULL may result in an error.
> 
> Found by Linux Verification Center (linuxtesting.org) with SVACE.

I think this is an actual problem but this might not be the
right fix.

The point of the call to get_channel_from_mode() is to get
the attached torch channel if the passed-in channel is a
flash channel.  It's *possible* that any flash channel will
*always* have an attached torch channel, but if so there
ought to be a comment to that effect near this call (to
explain why there's no need for the null pointer check).

I think Dan's suggestion should be implemented as well.
It's possible the intention really *was* to have
get_channel_from_mode() return the original channel pointer
if there is no attached channel with the requested mode.
But if so, that should be done differently.  I.e., Dan's
suggestion should be taken, and the callers should use the
passed-in channel if the call to get_channel_from_mode()
returns NULL.  (I hope that's clear.)

So anyway, I think this (and Dan's suggestion) should be
addressed, but your fix might not be correct.

Rui, can you please shed some light on the situation?

					-Alex

> 
> Fixes: 2870b52bae4c ("greybus: lights: add lights implementation")
> Signed-off-by: Mikhail Lobanov <m.lobanov@rosalinux.ru>
> ---
>   drivers/staging/greybus/light.c | 9 +++++++--
>   1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/greybus/light.c b/drivers/staging/greybus/light.c
> index 87d36948c610..929514350947 100644
> --- a/drivers/staging/greybus/light.c
> +++ b/drivers/staging/greybus/light.c
> @@ -148,10 +148,15 @@ static int __gb_lights_flash_brightness_set(struct gb_channel *channel)
>   						GB_CHANNEL_MODE_TORCH);
>   
>   	/* For not flash we need to convert brightness to intensity */
> -	intensity = channel->intensity_uA.min +
> +
> +	if (channel) {
> +		intensity = channel->intensity_uA.min +
>   			(channel->intensity_uA.step * channel->led->brightness);
>   
> -	return __gb_lights_flash_intensity_set(channel, intensity);
> +		return __gb_lights_flash_intensity_set(channel, intensity);
> +	}
> +
> +	return 0;
>   }
>   #else
>   static struct gb_channel *get_channel_from_cdev(struct led_classdev *cdev)

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
