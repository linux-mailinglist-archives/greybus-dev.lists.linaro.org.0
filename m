Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 9970188AF3E
	for <lists+greybus-dev@lfdr.de>; Mon, 25 Mar 2024 20:04:40 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 8506943C2E
	for <lists+greybus-dev@lfdr.de>; Mon, 25 Mar 2024 19:04:39 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	by lists.linaro.org (Postfix) with ESMTPS id 7B48F3EE2D
	for <greybus-dev@lists.linaro.org>; Mon, 25 Mar 2024 19:04:36 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linaro.org header.s=google header.b=slVW0w4d;
	dmarc=pass (policy=none) header.from=linaro.org;
	spf=pass (lists.linaro.org: domain of rui.silva@linaro.org designates 209.85.167.43 as permitted sender) smtp.mailfrom=rui.silva@linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-513dd2d2415so4942104e87.3
        for <greybus-dev@lists.linaro.org>; Mon, 25 Mar 2024 12:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711393475; x=1711998275; darn=lists.linaro.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=T3N/3Adm2GlrHPtgDuDVvUkAM++pdesMApffsNDmK6o=;
        b=slVW0w4duB8Ei4mH+GlnTdxDa72ALmRT2QBpac2CL/60w99tEyP3JVEF5QA/YnT8e8
         SNgEqZA1bWOdOmtPR7uXs4GaW6ZCWM8OBdltZxkMEXxGuC0p2T7U3zMg7roGLmlf46Q1
         DlWMHqQ4HAQ8vVhs5Y5XKn8JQFjy2/AMwV0QgOLShkdKFRM2iqHwMoxiHqG6Zlbt5esw
         gouNrprTVMNYqYLDYCuh/ec6P+TogscYlViSJ8QKAJNYMGpMOK/IGITCBp0x+Cc+tE2R
         Aou107fbeDLvwavSq3vOxxmuL/eqPZ6u8kVloH2K9SOcPkCdcsHQDxPYCzW8B8KrjuU9
         Ln4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711393475; x=1711998275;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T3N/3Adm2GlrHPtgDuDVvUkAM++pdesMApffsNDmK6o=;
        b=kGUF5vZlC5n4F87PzpeTYMqtFvAhsc+ZB58ml4pwko3Hu6P/WWrC4Wio5wM5mFFEDM
         gVaFazCoo8jI2cf4f+9Hrguy8hfz7USz7u7amFJdtn2K4W7hOs1BW/REedWujzWPb5Lh
         ALRGIDeQ6O/f2g03qMcVvA9jQB035IoHicP5virz//l0jEdvd7mdez7YSsQUvX7csLEU
         93jjzmv2FIQDtjnNz2TcguVTNtTSqIn82JSAmjwRzOlMF950sGvskSRlTLzWjk0UrAe6
         SgvB0iTWnWoWwu/9u/geqhEnJHadbdkKQjdNQYbqQnRD/r1NNOGZgrfsRtqah5MuGwMG
         nycA==
X-Gm-Message-State: AOJu0YzLXs8GSUBcJTJcNhbnOLbbuJRXS2dtgxTAmcRZ/DJdCz0l9NbO
	sc6Faq2VApxMh6Gf0g7IXwp2tpjVa/8DF/iaIvyDSRpIKHbt7eisg1JiC2Rj05k5Lg==
X-Google-Smtp-Source: AGHT+IFYxo3DGoKZd7qFWUNQD35n7ofgkaIM8OtUomoOB31LzCDNcblGf6pjiiWwAx7JEYz6h4rhkw==
X-Received: by 2002:a05:6512:718:b0:515:8a62:682c with SMTP id b24-20020a056512071800b005158a62682cmr4766441lfs.58.1711393475068;
        Mon, 25 Mar 2024 12:04:35 -0700 (PDT)
Received: from localhost (a109-49-32-45.cpe.netcabo.pt. [109.49.32.45])
        by smtp.gmail.com with ESMTPSA id jg26-20020a05600ca01a00b004148670f9ecsm6059842wmb.23.2024.03.25.12.04.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 12:04:34 -0700 (PDT)
From: Rui Miguel Silva <rui.silva@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
In-Reply-To: <2024032543-village-reference-960d@gregkh>
References: <20240307094838.688281-1-rmfrfs@gmail.com>
 <2024032543-village-reference-960d@gregkh>
Date: Mon, 25 Mar 2024 19:04:33 +0000
Message-ID: <m35xxadtfi.fsf@gmail.com>
MIME-Version: 1.0
X-Rspamd-Queue-Id: 7B48F3EE2D
X-Spamd-Bar: --------
X-Spamd-Result: default: False [-8.00 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.167.43:from];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	DKIM_TRACE(0.00)[linaro.org:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: 3ZLCIPYI4NOJYVDIXLGW72WYG3IXZS6I
X-Message-ID-Hash: 3ZLCIPYI4NOJYVDIXLGW72WYG3IXZS6I
X-MailFrom: rui.silva@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: greybus-dev@lists.linaro.org, Mikhail Lobanov <m.lobanov@rosalinux.ru>, linux-staging@lists.linux.dev
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] greybus: lights: check return of get_channel_from_mode
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/3ZLCIPYI4NOJYVDIXLGW72WYG3IXZS6I/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Greg,

Greg Kroah-Hartman <gregkh@linuxfoundation.org> writes:

> On Thu, Mar 07, 2024 at 09:48:13AM +0000, Rui Miguel Silva wrote:
>> If channel for the given node is not found we return null from
>> get_channel_from_mode. Make sure we validate the return pointer
>> before using it in two of the missing places.
>> 
>> This was originally reported in [0]:
>> Found by Linux Verification Center (linuxtesting.org) with SVACE.
>> 
>> [0] https://lore.kernel.org/all/20240301190425.120605-1-m.lobanov@rosalinux.ru
>> 
>> Fixes: 2870b52bae4c ("greybus: lights: add lights implementation")
>> Reported-by: Mikhail Lobanov <m.lobanov@rosalinux.ru>
>> Suggested-by: Mikhail Lobanov <m.lobanov@rosalinux.ru>
>> Suggested-by: Alex Elder <elder@ieee.org>
>> Signed-off-by: Rui Miguel Silva <rmfrfs@gmail.com>
>> ---
>>  drivers/staging/greybus/light.c | 6 +++++-
>>  1 file changed, 5 insertions(+), 1 deletion(-)
>> 
>> diff --git a/drivers/staging/greybus/light.c b/drivers/staging/greybus/light.c
>> index c6bd86a5335a..6f10b9e2c053 100644
>> --- a/drivers/staging/greybus/light.c
>> +++ b/drivers/staging/greybus/light.c
>> @@ -147,6 +147,9 @@ static int __gb_lights_flash_brightness_set(struct gb_channel *channel)
>>  		channel = get_channel_from_mode(channel->light,
>>  						GB_CHANNEL_MODE_TORCH);
>>  
>> +	if (!channel)
>> +		return -EINVAL;
>> +
>>  	/* For not flash we need to convert brightness to intensity */
>>  	intensity = channel->intensity_uA.min +
>>  			(channel->intensity_uA.step * channel->led->brightness);
>> @@ -549,7 +552,8 @@ static int gb_lights_light_v4l2_register(struct gb_light *light)
>>  	}
>>  
>>  	channel_flash = get_channel_from_mode(light, GB_CHANNEL_MODE_FLASH);
>> -	WARN_ON(!channel_flash);
>> +	if (WARN_ON(!channel_flash))
>> +		return -EINVAL;
>
> We should NOT crash machines just because of this, the WARN_ON() should
> be removed and just properly handle the error please.

Yeah, will move this to a less severe option (dev_err) to make some
noise about this "this should never happen" issue.

Cheers,
   Rui

> thanks,
>
> greg k-h
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
