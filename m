Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B7E689AC19
	for <lists+greybus-dev@lfdr.de>; Sat,  6 Apr 2024 18:45:57 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 3763B4425A
	for <lists+greybus-dev@lfdr.de>; Sat,  6 Apr 2024 16:45:56 +0000 (UTC)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	by lists.linaro.org (Postfix) with ESMTPS id 07F27441C9
	for <greybus-dev@lists.linaro.org>; Sat,  6 Apr 2024 16:45:54 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=ieee.org header.s=google header.b=aTBLv4N4;
	dmarc=pass (policy=quarantine) header.from=ieee.org;
	spf=pass (lists.linaro.org: domain of elder@ieee.org designates 209.85.160.174 as permitted sender) smtp.mailfrom=elder@ieee.org
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-432ffed0423so15827621cf.1
        for <greybus-dev@lists.linaro.org>; Sat, 06 Apr 2024 09:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1712421953; x=1713026753; darn=lists.linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xUzxhIyO9Z42EWr6hvKS7Qfwp4EqErW6SFdavLE1o5g=;
        b=aTBLv4N4gHKqFitKkcug4dW3nl5Qt5UdW1Z7TxV4qrk56J/v+kMhamvpJTAj2e+qZg
         JN/q01t0XoHxcWukzUunJat2d3BVJ2s7+PW/l0Q+6ebWhHAG9nC/ZYTLbauf9AMrZ4HK
         SLBOMYqS8KUvTHV9HSSERdgK/CJRwQX+nDB3s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712421953; x=1713026753;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xUzxhIyO9Z42EWr6hvKS7Qfwp4EqErW6SFdavLE1o5g=;
        b=v0b9aHHD882V9ncwcsVCH6bjYKaAwL6sutg0UmaTZCqGff8okvzlZA2sMAkWYb4Szt
         Z3dIkXZMNQR0LK+CyW9wsyiEoSVyuuWFEmCJeWNJDEW5z5bZ0m7z1VV3w8Dfz5nYM5hx
         p8HwNuKLFAROpIJ/p9Z0QK4AZD8J0u+lpOKXMWDRufSImxbBE1HA2qrBJggg8isqClQJ
         0v6bHg/8JCwVbblnjekq5LY4v8dMnoBpvsMv2hLiDYWcejQdQVe3NbPQCDRLT7TyaYO+
         N+m0htoukP7G2PwArcgW8KJLVq8f5XY4AwUMYxNy9wiaEBKOf6Ruk56OT93GGkwX2Buq
         SRkw==
X-Forwarded-Encrypted: i=1; AJvYcCXRipY/YLayu4bT9PN7N30W/99oyNrX7pcWX0vVZJ1uJ/DMBirLD2bOHItDRbFaOkMs8VU+Zzih+xOjRB/R471lractV8ldjZMs3fJd
X-Gm-Message-State: AOJu0Yx2Qi/QDEbIU/qVCUaXrf2Tjj0H7ITUmt/nUWXSSxyXVpIh1YsU
	/obBgnlfDkiuuqKqBEaMev8vw/pan3iMLWu+dTioVSWAtcvEJnTR9O0C2ULLTw==
X-Google-Smtp-Source: AGHT+IEvslkQ6rXgUW5EvmlGfHPFV2jcGN7xIZ4kQjPo99VaaKYYs8/WO0XY1HAROkySf3cJQl69Jw==
X-Received: by 2002:ac8:594a:0:b0:431:5f09:83cb with SMTP id 10-20020ac8594a000000b004315f0983cbmr5549704qtz.32.1712421953535;
        Sat, 06 Apr 2024 09:45:53 -0700 (PDT)
Received: from [10.211.55.3] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.googlemail.com with ESMTPSA id e1-20020ac81301000000b004317c90d0d6sm3321qtj.65.2024.04.06.09.45.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Apr 2024 09:45:53 -0700 (PDT)
Message-ID: <5e1c5156-d906-4473-970b-bff71e4dcd96@ieee.org>
Date: Sat, 6 Apr 2024 11:45:51 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@linaro.org>,
 Jackson Chui <jacksonchui.qwerty@gmail.com>
References: <20240404001627.94858-1-jacksonchui.qwerty@gmail.com>
 <658e1f40-d1eb-4ba7-9ba3-0aa05a1ed06e@ieee.org>
 <ZhBrff8qkkmum4wc@jc-ubuntu-dev-korn-1>
 <5eb3afe2-da7b-4f98-aac2-bff529a02cea@moroto.mountain>
From: Alex Elder <elder@ieee.org>
In-Reply-To: <5eb3afe2-da7b-4f98-aac2-bff529a02cea@moroto.mountain>
X-Rspamd-Queue-Id: 07F27441C9
X-Spamd-Bar: ------
X-Spamd-Result: default: False [-6.59 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ieee.org,quarantine];
	R_DKIM_ALLOW(-0.20)[ieee.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.160.174:from];
	XM_UA_NO_VERSION(0.01)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[ieee.org:+];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: ZXIGEIQFIEBKBSEZTGMJHETO7BIGG7X3
X-Message-ID-Hash: ZXIGEIQFIEBKBSEZTGMJHETO7BIGG7X3
X-MailFrom: elder@ieee.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: Clear up precedence for gcam logging macros
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/ZXIGEIQFIEBKBSEZTGMJHETO7BIGG7X3/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit

On 4/6/24 4:09 AM, Dan Carpenter wrote:
> On Fri, Apr 05, 2024 at 02:22:05PM -0700, Jackson Chui wrote:
>> On Thu, Apr 04, 2024 at 05:05:09PM -0500, Alex Elder wrote:
>>> On 4/3/24 7:16 PM, Jackson Chui wrote:
>>>> Reported by checkpatch:
>>>>
>>>> CHECK: Macro argument 'gcam' may be better as '(gcam)' to avoid
>>>> precedence issues
>>>
>>> I agree with your argument about the way the macro should be
>>> defined.  But perhaps these gcam_*() functions could just
>>> be eliminated?
>>>
>>> I see 15 calls to gcam_err(), 1 call to gcam_dbg(), and none
>>> to gcam_info().  It would be a different patch, but maybe
>>> you could do that instead?
>>>
>>> 					-Alex
>>>
>>>
>>>>
>>>> Disambiguates '&' (address-of) operator and '->' operator precedence,
>>>> accounting for how '(gcam)->bundle->dev' is a 'struct device' and not a
>>>> 'struct device*', which is required by the dev_{dbg,info,err} driver
>>>> model diagnostic macros. Issue found by checkpatch.
>>>>
>>>> Signed-off-by: Jackson Chui <jacksonchui.qwerty@gmail.com>
>>>> ---
>>>>    drivers/staging/greybus/camera.c | 6 +++---
>>>>    1 file changed, 3 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/drivers/staging/greybus/camera.c b/drivers/staging/greybus/camera.c
>>>> index a8173aa3a995..d82a2d2abdca 100644
>>>> --- a/drivers/staging/greybus/camera.c
>>>> +++ b/drivers/staging/greybus/camera.c
>>>> @@ -180,9 +180,9 @@ static const struct gb_camera_fmt_info *gb_camera_get_format_info(u16 gb_fmt)
>>>>    #define GB_CAMERA_MAX_SETTINGS_SIZE	8192
>>>> -#define gcam_dbg(gcam, format...)	dev_dbg(&gcam->bundle->dev, format)
>>>> -#define gcam_info(gcam, format...)	dev_info(&gcam->bundle->dev, format)
>>>> -#define gcam_err(gcam, format...)	dev_err(&gcam->bundle->dev, format)
>>>> +#define gcam_dbg(gcam, format...)	dev_dbg(&((gcam)->bundle->dev), format)
>>>> +#define gcam_info(gcam, format...)	dev_info(&((gcam)->bundle->dev), format)
>>>> +#define gcam_err(gcam, format...)	dev_err(&((gcam)->bundle->dev), format)
>>>>    static int gb_camera_operation_sync_flags(struct gb_connection *connection,
>>>>    					  int type, unsigned int flags,
>>>
>>
>> Thanks for the feedback, Alex!
>>
>> I thought about refactoring it, but I feel it is worth keeping
>> the macro around. It acts as an apdater between callers, who
>> have 'gcam' and want to log and what the dynamic debug macros
>> expect. Without it, the code gets pretty ugly.
> 
> Another idea would be to create a function:
> 
> struct device *gcam_dev(struct gb_camera *gcam)
> {
> 	return &gcam->bundle->dev;
> }
> 
> 	dev_dbg(gcam_dev(gcam), "received metadata ...
> 
> (I don't know how to actually compile this code so I haven't tried it).

Yes, I prefer this over the original suggestion.  But
even here the gcam_dev() function doesn't add all that
much value; it saves four characters I guess.

Jackson, the basic principle that makes me say I don't
like the wrapper macros is that the wrapper obscures
the simple call(s) to dev_dbg(), etc.  If there was
something you wanted to do every time--along with
calling dev_dbg()--then maybe the wrapper would be
helpful, but instead it simply hides the standard call.
Better to have the code just use the functions kernel
programmers recognize.

					-Alex
> 
> regards,
> dan carpenter

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
