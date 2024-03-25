Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EF3988AF18
	for <lists+greybus-dev@lfdr.de>; Mon, 25 Mar 2024 19:55:40 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 8CDEB43C24
	for <lists+greybus-dev@lfdr.de>; Mon, 25 Mar 2024 18:55:39 +0000 (UTC)
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	by lists.linaro.org (Postfix) with ESMTPS id E1EEB3EE2D
	for <greybus-dev@lists.linaro.org>; Mon, 25 Mar 2024 18:55:37 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=ieee.org header.s=google header.b=XrgoVJAP;
	dmarc=pass (policy=quarantine) header.from=ieee.org;
	spf=pass (lists.linaro.org: domain of elder@ieee.org designates 209.85.167.177 as permitted sender) smtp.mailfrom=elder@ieee.org
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-3bd4e6a7cb0so2328184b6e.3
        for <greybus-dev@lists.linaro.org>; Mon, 25 Mar 2024 11:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1711392937; x=1711997737; darn=lists.linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Cj/zBkshsC4lwntiD0vAyA9XrZfVrKKDmooPQjZW7Qo=;
        b=XrgoVJAPM+qRm3sFU/wir+eCuk2AYFRlmC0CJwLwgscMwYaLJ7CD3GEmYNMPDnXDRF
         nKP/1b+Ljpm5a35pn1mIo+CJIvV8yE8srBfU98iZYDw2QmDlWFeVl7VWTp5dHU1C4NEF
         vdf5bpIwUm1wskeztiaq/TKbG6XnzjPOru24o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711392937; x=1711997737;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Cj/zBkshsC4lwntiD0vAyA9XrZfVrKKDmooPQjZW7Qo=;
        b=uiXBAYnzZ+m5kY+OBeEFm7PNGu6xhIP1x5ZSXtaGb5wGHyMokDaAp5gQ3lRkfyL/D7
         d6cP9AWHhL6v90MVXsdZzcwShNPxdI6cBUXu5SC9T7jGpcSQsLqIkiFGCGaPt57Jb8ed
         zUYP8VR4ufcOkzxdKn4r4rbz3SCdAuVv9uan/orzU2qq2W0LyLatvv3UVEhF0abpIEyV
         OfIkNjWbeA5gnaOJjRrxokJw160AUDa/6qt6EDZN/6Wa9UqiP+yhxaos4l6mXxswGbyD
         em91noQLpmqGfewS0k+w4Hgaqw1yYwLpiOfH/BwEq9y1z/DWA7VeD+GJ7SWZf1QZEqmK
         TsBA==
X-Forwarded-Encrypted: i=1; AJvYcCUoSAbawJ8epiRzjmmyxSnO5/2T0nqFe5270hZO8iQehL3phcjGePfN65LEvBaXlNCyZ/QK9rtcsI3BBdqselNBz6bn+yJ8HlvExva6
X-Gm-Message-State: AOJu0YxkuBuceXe0GoM/AG91jKmEyQLU8ZvKYDvT47o0lnaQDgmKbZPZ
	GWmEPjHj4nAiuzPL/uMccxnDtKLG0aoio729fvTpE+gmwtOhAX1XqBGj0IlBbg==
X-Google-Smtp-Source: AGHT+IFCQ6dTAsXuH06ZelNXQ9c4Skk+OgXPlQ2HLWUVAZX/lzuTI4GSeawmlVG2sWPirElQOitZ7g==
X-Received: by 2002:a05:6808:291:b0:3c3:9c24:dc6e with SMTP id z17-20020a056808029100b003c39c24dc6emr611265oic.24.1711392937256;
        Mon, 25 Mar 2024 11:55:37 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.googlemail.com with ESMTPSA id gb13-20020a05622a598d00b00430d494c75asm2857127qtb.19.2024.03.25.11.55.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Mar 2024 11:55:37 -0700 (PDT)
Message-ID: <14e1f476-7c3c-40ac-a48e-9af3e43a834d@ieee.org>
Date: Mon, 25 Mar 2024 13:55:36 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20240307094838.688281-1-rmfrfs@gmail.com>
 <2024032543-village-reference-960d@gregkh>
 <9fa87c55-42e2-4449-936f-4835b267d22f@ieee.org>
 <2024032510-planner-caterer-3693@gregkh>
From: Alex Elder <elder@ieee.org>
In-Reply-To: <2024032510-planner-caterer-3693@gregkh>
X-Rspamd-Queue-Id: E1EEB3EE2D
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
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.167.177:from];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[linaro.org,lists.linaro.org,rosalinux.ru,lists.linux.dev,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[ieee.org:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: WBC3PO4FG5YTKIST44HFUEACRFFNWUPE
X-Message-ID-Hash: WBC3PO4FG5YTKIST44HFUEACRFFNWUPE
X-MailFrom: elder@ieee.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Rui Miguel Silva <rui.silva@linaro.org>, greybus-dev@lists.linaro.org, Mikhail Lobanov <m.lobanov@rosalinux.ru>, linux-staging@lists.linux.dev
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] greybus: lights: check return of get_channel_from_mode
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/WBC3PO4FG5YTKIST44HFUEACRFFNWUPE/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit

On 3/25/24 1:50 PM, Greg Kroah-Hartman wrote:
> On Mon, Mar 25, 2024 at 01:31:34PM -0500, Alex Elder wrote:
>> On 3/25/24 12:25 PM, Greg Kroah-Hartman wrote:
>>> On Thu, Mar 07, 2024 at 09:48:13AM +0000, Rui Miguel Silva wrote:
>>>> If channel for the given node is not found we return null from
>>>> get_channel_from_mode. Make sure we validate the return pointer
>>>> before using it in two of the missing places.
>>>>
>>>> This was originally reported in [0]:
>>>> Found by Linux Verification Center (linuxtesting.org) with SVACE.
>>>>
>>>> [0] https://lore.kernel.org/all/20240301190425.120605-1-m.lobanov@rosalinux.ru
>>>>
>>>> Fixes: 2870b52bae4c ("greybus: lights: add lights implementation")
>>>> Reported-by: Mikhail Lobanov <m.lobanov@rosalinux.ru>
>>>> Suggested-by: Mikhail Lobanov <m.lobanov@rosalinux.ru>
>>>> Suggested-by: Alex Elder <elder@ieee.org>
>>>> Signed-off-by: Rui Miguel Silva <rmfrfs@gmail.com>
>>>> ---
>>>>    drivers/staging/greybus/light.c | 6 +++++-
>>>>    1 file changed, 5 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/staging/greybus/light.c b/drivers/staging/greybus/light.c
>>>> index c6bd86a5335a..6f10b9e2c053 100644
>>>> --- a/drivers/staging/greybus/light.c
>>>> +++ b/drivers/staging/greybus/light.c
>>>> @@ -147,6 +147,9 @@ static int __gb_lights_flash_brightness_set(struct gb_channel *channel)
>>>>    		channel = get_channel_from_mode(channel->light,
>>>>    						GB_CHANNEL_MODE_TORCH);
>>>> +	if (!channel)
>>>> +		return -EINVAL;
>>>> +
>>>>    	/* For not flash we need to convert brightness to intensity */
>>>>    	intensity = channel->intensity_uA.min +
>>>>    			(channel->intensity_uA.step * channel->led->brightness);
>>>> @@ -549,7 +552,8 @@ static int gb_lights_light_v4l2_register(struct gb_light *light)
>>>>    	}
>>>>    	channel_flash = get_channel_from_mode(light, GB_CHANNEL_MODE_FLASH);
>>>> -	WARN_ON(!channel_flash);
>>>> +	if (WARN_ON(!channel_flash))
>>>> +		return -EINVAL;
>>>
>>> We should NOT crash machines just because of this, the WARN_ON() should
>>> be removed and just properly handle the error please.
>>
>> Greg, WARN_ON() doesn't normally crash the machine.  That said,
>> it's reasonable to remove the WARN_ON().
> 
> The huge majority of running Linux systems in the world run with
> panic-on-warn enabled, including the one in your pocket :(

I did not know that.  Then WARN_ON() is no better than BUG_ON().
I'm still learning.  Thank you.

					-Alex

>> I think the purpose of the warning is that this is a case that
>> should "never happen," so if it does, it's making some noise.
> 
> Making noise by rebooting the box is not good.
> 
> thanks,
> 
> greg k-h

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
