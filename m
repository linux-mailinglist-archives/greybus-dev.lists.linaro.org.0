Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 9307786F153
	for <lists+greybus-dev@lfdr.de>; Sat,  2 Mar 2024 17:35:54 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id A10EB44248
	for <lists+greybus-dev@lfdr.de>; Sat,  2 Mar 2024 16:35:53 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	by lists.linaro.org (Postfix) with ESMTPS id 783E33F363
	for <greybus-dev@lists.linaro.org>; Sat,  2 Mar 2024 16:35:47 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=XopVEYoZ;
	spf=pass (lists.linaro.org: domain of rmfrfs@gmail.com designates 209.85.208.176 as permitted sender) smtp.mailfrom=rmfrfs@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2d28e465655so43939441fa.0
        for <greybus-dev@lists.linaro.org>; Sat, 02 Mar 2024 08:35:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709397346; x=1710002146; darn=lists.linaro.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=6e6z+3MaXoTllC5shSsv//DVSc5oQDrjOWLS3+A7iL8=;
        b=XopVEYoZJpc4bYP4/AURuscTS2xnerCZJ54xsH6HBSijGsZDmIVggTvr+7QcLbvHC7
         TuH+jFTC50KqFlAQu1BbG+ebjvomh7btNwIAYsWB90iyTPTWx27ZqzK3j1PXMyGSnDmV
         02GoXtEI4iGoooe/sbcFK+/fDGuPqd8aFJyQ2kWtkW3Qni3mg9Q8yac7w31lnaUPY8mB
         NBzTVUvqUsdqLNNlUIkqx2SNdlQ7H3lspu1OoI/naNJXEnEAOz+VvFWB3fmZpSuujtR8
         /Pzd7dkwG0CsYnm67Vk722eUOrqzpjPk7rPpi1zDy4I18Bux5teBdAlKJn8wrS/cUpv6
         fypw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709397346; x=1710002146;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6e6z+3MaXoTllC5shSsv//DVSc5oQDrjOWLS3+A7iL8=;
        b=YGcMdgjoyPYeoaupBDZiXbcj5J/d32/3MmulAcb6tgitCSjQPqw+4PQFGdNwqi5Q7D
         Zd5yWfxKihC9e2gb7pUc8kq380ikaeG3IKqF8m404SiDkatxnAT7EbVdfcOacrHKPv5d
         z5Pv845kuiN67c8CiTyh526T11CSD0d/xCHUsqcBQtJLnvkG40ht8UW0DClYxNzncZ7U
         IAVqS+psyxoY2i7+QToqy00OtUyeHDAmEds981OOesWQlJcJQ0J6WoL8q3eWYGST3pJD
         1SiEWr67xvdWtz8MmoDonRvpRDwhg/2d+OQUaht3dqWVBNJUJZq56CH+H55r77BDRFhF
         +OMQ==
X-Gm-Message-State: AOJu0Ywn1GHbLlGVstyclEf8CBeKbZteIbHirLF5G+m/OXL3+gK4VZ5q
	QZ9c786O8ZWfAGlV+FLdDDht9JA4p2mG0Ona92EZZBtYWZaAEUZl
X-Google-Smtp-Source: AGHT+IGlJ+hdrGnK505esCOHxSvoTG61Z0gG/nTd2nIOanMWktVOwVeoJcG+AgB9uxz6FKki/HgveQ==
X-Received: by 2002:a2e:3801:0:b0:2d2:a9f8:c436 with SMTP id f1-20020a2e3801000000b002d2a9f8c436mr2881143lja.53.1709397345851;
        Sat, 02 Mar 2024 08:35:45 -0800 (PST)
Received: from localhost (a109-49-32-45.cpe.netcabo.pt. [109.49.32.45])
        by smtp.gmail.com with ESMTPSA id p7-20020a05600c358700b00412b6fbb9b5sm41816wmq.8.2024.03.02.08.35.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Mar 2024 08:35:45 -0800 (PST)
From: Rui Miguel Silva <rmfrfs@gmail.com>
To: Alex Elder <elder@ieee.org>, Mikhail Lobanov <m.lobanov@rosalinux.ru>
In-Reply-To: <07df4b96-70c2-41de-9d76-1deb80447a79@ieee.org>
References: <20240301190425.120605-1-m.lobanov@rosalinux.ru>
 <07df4b96-70c2-41de-9d76-1deb80447a79@ieee.org>
Date: Sat, 02 Mar 2024 16:35:44 +0000
Message-ID: <m3o7bwlhgf.fsf@gmail.com>
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 783E33F363
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
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.208.176:from];
	RCPT_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_TWO(0.00)[2];
	MID_RHS_MATCH_FROM(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+]
Message-ID-Hash: X6C4XDKXXZJTNDVAWKMTCPS3GYXZQ3DC
X-Message-ID-Hash: X6C4XDKXXZJTNDVAWKMTCPS3GYXZQ3DC
X-MailFrom: rmfrfs@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] greybus: Fix deref of NULL in __gb_lights_flash_brightness_set
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/X6C4XDKXXZJTNDVAWKMTCPS3GYXZQ3DC/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Alex,
Alex Elder <elder@ieee.org> writes:

> On 3/1/24 1:04 PM, Mikhail Lobanov wrote:
>> Dereference of null pointer in the __gb_lights_flash_brightness_set function.
>> Assigning the channel the result of executing the get_channel_from_mode function
>> without checking for NULL may result in an error.
>> 
>> Found by Linux Verification Center (linuxtesting.org) with SVACE.
>
> I think this is an actual problem but this might not be the
> right fix.
>
> The point of the call to get_channel_from_mode() is to get
> the attached torch channel if the passed-in channel is a
> flash channel.  It's *possible* that any flash channel will
> *always* have an attached torch channel, but if so there
> ought to be a comment to that effect near this call (to
> explain why there's no need for the null pointer check).
>
> I think Dan's suggestion should be implemented as well.
> It's possible the intention really *was* to have
> get_channel_from_mode() return the original channel pointer
> if there is no attached channel with the requested mode.
> But if so, that should be done differently.  I.e., Dan's
> suggestion should be taken, and the callers should use the
> passed-in channel if the call to get_channel_from_mode()
> returns NULL.  (I hope that's clear.)
>
> So anyway, I think this (and Dan's suggestion) should be
> addressed, but your fix might not be correct.
>
> Rui, can you please shed some light on the situation?

As we talked,  this email was sent at the same time as my replies to
this thread and you think I addressed your concerns in that replies.
If not, just go ahead and ask again.

Cheers,
   Rui
>
> 					-Alex
>
>> 
>> Fixes: 2870b52bae4c ("greybus: lights: add lights implementation")
>> Signed-off-by: Mikhail Lobanov <m.lobanov@rosalinux.ru>
>> ---
>>   drivers/staging/greybus/light.c | 9 +++++++--
>>   1 file changed, 7 insertions(+), 2 deletions(-)
>> 
>> diff --git a/drivers/staging/greybus/light.c b/drivers/staging/greybus/light.c
>> index 87d36948c610..929514350947 100644
>> --- a/drivers/staging/greybus/light.c
>> +++ b/drivers/staging/greybus/light.c
>> @@ -148,10 +148,15 @@ static int __gb_lights_flash_brightness_set(struct gb_channel *channel)
>>   						GB_CHANNEL_MODE_TORCH);
>>   
>>   	/* For not flash we need to convert brightness to intensity */
>> -	intensity = channel->intensity_uA.min +
>> +
>> +	if (channel) {
>> +		intensity = channel->intensity_uA.min +
>>   			(channel->intensity_uA.step * channel->led->brightness);
>>   
>> -	return __gb_lights_flash_intensity_set(channel, intensity);
>> +		return __gb_lights_flash_intensity_set(channel, intensity);
>> +	}
>> +
>> +	return 0;
>>   }
>>   #else
>>   static struct gb_channel *get_channel_from_cdev(struct led_classdev *cdev)
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
