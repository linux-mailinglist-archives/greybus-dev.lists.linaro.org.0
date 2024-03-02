Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A07786F0B3
	for <lists+greybus-dev@lfdr.de>; Sat,  2 Mar 2024 15:57:26 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 0751943FC7
	for <lists+greybus-dev@lfdr.de>; Sat,  2 Mar 2024 14:57:25 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	by lists.linaro.org (Postfix) with ESMTPS id E168D3F3C2
	for <greybus-dev@lists.linaro.org>; Sat,  2 Mar 2024 14:57:18 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=ieee.org header.s=google header.b="U/6oKg2k";
	spf=pass (lists.linaro.org: domain of elder@ieee.org designates 209.85.219.42 as permitted sender) smtp.mailfrom=elder@ieee.org;
	dmarc=pass (policy=quarantine) header.from=ieee.org
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-68facd7ea4aso24756956d6.0
        for <greybus-dev@lists.linaro.org>; Sat, 02 Mar 2024 06:57:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1709391438; x=1709996238; darn=lists.linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wfIgoTdA9N+MeIiEy0xWNsxv5l2fuvtP53bPZ++Mceg=;
        b=U/6oKg2kgfiotyIJACY/D0gnAbf3oJTMgSlWlAIBVXCiyWkkBXc1vYH/l9OSZd/0tJ
         yh8MmiR04nGVLlwyUEnVXvQaDh3Slh9YAI530pOkpMsKQ8WURSfOLRP71qeCUNmGO1R/
         tb4PfimT5KO2PRNF3c5CT5u5RIw0JVGFCLzVQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709391438; x=1709996238;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wfIgoTdA9N+MeIiEy0xWNsxv5l2fuvtP53bPZ++Mceg=;
        b=rR197o9AX4q6+t9kuxUjlnar+joCYg6aydB03FcOeeAXcwzBl4XXjRV8TGSAxcomSt
         J5zDdE9EcYFYe4X7VF8uj9rHCy487ZTXdVHLCf+aGlUJ/p30tfYZX8bbchFIycM7CGle
         udgBndq3NQEdCOiD8SKMZhkurha5+kaYFOPdEc1Vey3X2z/dA/Rn0uOOVh/94qiLeJIW
         sjHx0bARreHNnKVYAQFrA4KZFaowQgHifi6/gWvjGZiOP/vk+fwoP3wri7kQTFBy1i+g
         /bMMzGYZnWOAiAu5S6pyzdZJ1QD/0dZ9sy1Z5y/Zv/Ohf+uIVJNISkTHmy0FYJPhypKN
         01EA==
X-Gm-Message-State: AOJu0YxlpJ8G3+0mocf5gWbJYaRphxN2+a0Cu8IWm7NJAi2Amw0fr+qn
	1MlkPuXzWvo/wQDB/dFehdT1OgNPZo7+vRRZNy5rt2eIDQFjIx48Wegw5VZ3xw==
X-Google-Smtp-Source: AGHT+IG9qW7IYS8D4z4TN+vHi467Y/Zi72+/DehK/Phj0uWp6/CbVvutRoW9BsGBwd53MOe9t8x0Hw==
X-Received: by 2002:a0c:da84:0:b0:690:5ff8:cc0 with SMTP id z4-20020a0cda84000000b006905ff80cc0mr2942320qvj.11.1709391438501;
        Sat, 02 Mar 2024 06:57:18 -0800 (PST)
Received: from [10.211.55.3] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.googlemail.com with ESMTPSA id or33-20020a05621446a100b0068f455083fbsm3018169qvb.63.2024.03.02.06.57.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 Mar 2024 06:57:18 -0800 (PST)
Message-ID: <36a4d208-9945-4a65-bdf1-d8309d779e63@ieee.org>
Date: Sat, 2 Mar 2024 08:57:17 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@linaro.org>,
 Mikhail Lobanov <m.lobanov@rosalinux.ru>, rmfrfs@gmail.com
References: <20240301190425.120605-1-m.lobanov@rosalinux.ru>
 <7ef732ad-a50f-4cf5-8322-376f42eb051b@moroto.mountain>
From: Alex Elder <elder@ieee.org>
In-Reply-To: <7ef732ad-a50f-4cf5-8322-376f42eb051b@moroto.mountain>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: E168D3F3C2
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
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.219.42:from];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_TO(0.00)[linaro.org,rosalinux.ru,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[ieee.org:+]
Message-ID-Hash: T57XU5CE7EAHJ3DIL5MHDBQ6MIKBJGF2
X-Message-ID-Hash: T57XU5CE7EAHJ3DIL5MHDBQ6MIKBJGF2
X-MailFrom: elder@ieee.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] greybus: Fix deref of NULL in __gb_lights_flash_brightness_set
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/T57XU5CE7EAHJ3DIL5MHDBQ6MIKBJGF2/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit

On 3/2/24 3:59 AM, Dan Carpenter wrote:
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

I agree with you.  This looks quite wrong to me, and I
like your fix, *except* there is also no need to check
whether the channel pointer is null inside the loop.
It's the address of an object, and will always be non-null.

     static struct gb_channel *
     get_channel_from_mode(struct gb_light *light, u32 mode)
     {
         struct gb_channel *channel;
         u32 i;

         for (i = 0; i < light->channels_count; i++) {
             channel = &light->channels[i];
             if (channel->mode == mode)
                 return channel;
         }
         return NULL;
     }


Rui, could you please confirm what Dan says (and his
proposed change) was your intention?

If so (and assuming you also fix the check for a null
channel pointer inside the loop):

Reviewed-by: Alex Elder <elder@linaro.org>

					-Alex

> 
> diff --git a/drivers/staging/greybus/light.c b/drivers/staging/greybus/light.c
> index d62f97249aca..acd435f5d25d 100644
> --- a/drivers/staging/greybus/light.c
> +++ b/drivers/staging/greybus/light.c
> @@ -95,15 +95,15 @@ static struct led_classdev *get_channel_cdev(struct gb_channel *channel)
>   static struct gb_channel *get_channel_from_mode(struct gb_light *light,
>   						u32 mode)
>   {
> -	struct gb_channel *channel = NULL;
> +	struct gb_channel *channel;
>   	int i;
>   
>   	for (i = 0; i < light->channels_count; i++) {
>   		channel = &light->channels[i];
>   		if (channel && channel->mode == mode)
> -			break;
> +			return channel;
>   	}
> -	return channel;
> +	return NULL;
>   }
>   
>   static int __gb_lights_flash_intensity_set(struct gb_channel *channel,
> _______________________________________________
> greybus-dev mailing list -- greybus-dev@lists.linaro.org
> To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
