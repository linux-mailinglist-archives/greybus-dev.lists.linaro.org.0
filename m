Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 0046E88AE54
	for <lists+greybus-dev@lfdr.de>; Mon, 25 Mar 2024 19:31:38 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id D2BF243C2C
	for <lists+greybus-dev@lfdr.de>; Mon, 25 Mar 2024 18:31:37 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	by lists.linaro.org (Postfix) with ESMTPS id DAE043EE2D
	for <greybus-dev@lists.linaro.org>; Mon, 25 Mar 2024 18:31:35 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=ieee.org header.s=google header.b=B8VtxR1j;
	dmarc=pass (policy=quarantine) header.from=ieee.org;
	spf=pass (lists.linaro.org: domain of elder@ieee.org designates 209.85.222.182 as permitted sender) smtp.mailfrom=elder@ieee.org
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-789e83637e0so297570885a.2
        for <greybus-dev@lists.linaro.org>; Mon, 25 Mar 2024 11:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1711391495; x=1711996295; darn=lists.linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nWXC2kNqOyO/to5qi03U9/HzGBiAGiav0puPTUx88nc=;
        b=B8VtxR1jJ+4AjRXUcAZwuCNsCg3ynckldRSFXaGeersmSfYHnF5f6eWD/SLJ7ltFwT
         B7H+bJBdFLK9ITzvCf4ijo25YBID1LIs47LxTZg2wAPmP7QC24x3kK3BVWFTKf/Z1gSV
         dPvutDMseD/ivAF6bdmmWnCRO78gUeB4Cy+Os=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711391495; x=1711996295;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nWXC2kNqOyO/to5qi03U9/HzGBiAGiav0puPTUx88nc=;
        b=jheUdYmn0Z2wGhf8CLsUcC9yVwdQvMwcsWXtjmUyxjDwru/E1wOpO3CInxg5V0EUbr
         cZrTCDMCDIjKsR69jEVNjMKsUsuUdTe8GFeNPrvBeD5D1pi5onmFH0YyOpdgXOGWHIA/
         NgkI5f/RbriEL2WhKxo4MxYuZxuv3xw2pogGpWntS43x4dlfLGNSm2KfmZ6F3t8z6Mfy
         GfBBlDT8cK4axXS+sx6jF6b7N+Hsy1B6vSL/KlJKAsbL+cjVBi4fiwZ66Im+2M42NFUy
         J7gBjxTbqpEdODyJIFII1dUEzI5SOWh8vxbcPIMgz9lsU+Y8PYVaiumYK4KE0RGgfvkc
         S5Jg==
X-Gm-Message-State: AOJu0Yw4IIA9MVKV9x0kcbPKxzDKpxFQFjFtV4EGnWgJ97EtBTbNvn3K
	iwZhBnEcz6xBShTnUVknCOZH3deoQJBUOvnqUfcIGP8tbU7d7avmtd79MGsprQ==
X-Google-Smtp-Source: AGHT+IHtTl6QyxmpD871JHhfnvEgjhEQq5C8VFrsMAix+gWM9mc/ChbgvU9B9JozmfBfPc4uu2Icew==
X-Received: by 2002:a05:620a:2204:b0:78a:4813:da7e with SMTP id m4-20020a05620a220400b0078a4813da7emr7215786qkh.50.1711391495365;
        Mon, 25 Mar 2024 11:31:35 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.googlemail.com with ESMTPSA id w10-20020a05620a094a00b0078a24b82c21sm2323834qkw.103.2024.03.25.11.31.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Mar 2024 11:31:35 -0700 (PDT)
Message-ID: <9fa87c55-42e2-4449-936f-4835b267d22f@ieee.org>
Date: Mon, 25 Mar 2024 13:31:34 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rui Miguel Silva <rui.silva@linaro.org>
References: <20240307094838.688281-1-rmfrfs@gmail.com>
 <2024032543-village-reference-960d@gregkh>
From: Alex Elder <elder@ieee.org>
In-Reply-To: <2024032543-village-reference-960d@gregkh>
X-Rspamd-Queue-Id: DAE043EE2D
X-Spamd-Bar: -------
X-Spamd-Result: default: False [-7.99 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	DMARC_POLICY_ALLOW(-0.50)[ieee.org,quarantine];
	R_DKIM_ALLOW(-0.20)[ieee.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.222.182:from];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[lists.linaro.org,rosalinux.ru,lists.linux.dev,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[ieee.org:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: ROZ5CIROOY4AXJ2XSRFCIHVBG5JXR74V
X-Message-ID-Hash: ROZ5CIROOY4AXJ2XSRFCIHVBG5JXR74V
X-MailFrom: elder@ieee.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: greybus-dev@lists.linaro.org, Mikhail Lobanov <m.lobanov@rosalinux.ru>, linux-staging@lists.linux.dev
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] greybus: lights: check return of get_channel_from_mode
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/ROZ5CIROOY4AXJ2XSRFCIHVBG5JXR74V/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit

On 3/25/24 12:25 PM, Greg Kroah-Hartman wrote:
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
>>   drivers/staging/greybus/light.c | 6 +++++-
>>   1 file changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/staging/greybus/light.c b/drivers/staging/greybus/light.c
>> index c6bd86a5335a..6f10b9e2c053 100644
>> --- a/drivers/staging/greybus/light.c
>> +++ b/drivers/staging/greybus/light.c
>> @@ -147,6 +147,9 @@ static int __gb_lights_flash_brightness_set(struct gb_channel *channel)
>>   		channel = get_channel_from_mode(channel->light,
>>   						GB_CHANNEL_MODE_TORCH);
>>   
>> +	if (!channel)
>> +		return -EINVAL;
>> +
>>   	/* For not flash we need to convert brightness to intensity */
>>   	intensity = channel->intensity_uA.min +
>>   			(channel->intensity_uA.step * channel->led->brightness);
>> @@ -549,7 +552,8 @@ static int gb_lights_light_v4l2_register(struct gb_light *light)
>>   	}
>>   
>>   	channel_flash = get_channel_from_mode(light, GB_CHANNEL_MODE_FLASH);
>> -	WARN_ON(!channel_flash);
>> +	if (WARN_ON(!channel_flash))
>> +		return -EINVAL;
> 
> We should NOT crash machines just because of this, the WARN_ON() should
> be removed and just properly handle the error please.

Greg, WARN_ON() doesn't normally crash the machine.  That said,
it's reasonable to remove the WARN_ON().

I think the purpose of the warning is that this is a case that
should "never happen," so if it does, it's making some noise.

The only caller is gb_lights_light_register(), and it checks
for an error and does "properly handle" the\ error (assuming
any error meaning "light has no flash" is correct).

Rui, please weigh in.

					-Alex


> 
> thanks,
> 
> greg k-h

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
