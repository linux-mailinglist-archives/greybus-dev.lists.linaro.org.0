Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F06B4FE978
	for <lists+greybus-dev@lfdr.de>; Tue, 12 Apr 2022 22:35:10 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 71E4A3EEE7
	for <lists+greybus-dev@lfdr.de>; Tue, 12 Apr 2022 20:35:09 +0000 (UTC)
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
	by lists.linaro.org (Postfix) with ESMTPS id B8B963ECE6
	for <greybus-dev@lists.linaro.org>; Tue, 12 Apr 2022 20:35:06 +0000 (UTC)
Received: by mail-io1-f51.google.com with SMTP id g21so23598623iom.13
        for <greybus-dev@lists.linaro.org>; Tue, 12 Apr 2022 13:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=M/SL6jGK0Sq77N5QBCF7FLbfokc9NofrgU/f7GHCINE=;
        b=IGHMDTCFCmYvFcY7njXSJlq5+k0qU5W4RKrNwWjdDDtLEYgaqVaxm42hs8yzb6WHvi
         jI5oFH9aT9H6BbgEvLkflG7LUpoXZIkVqyRoKSHvOJrnrHR68almb7jBJqmT1ydKXMmF
         5dDrb5DB40NuvHlklLXupzunEgHfkDZC5MaS0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=M/SL6jGK0Sq77N5QBCF7FLbfokc9NofrgU/f7GHCINE=;
        b=5YZUvp0gM6KDuT4Ep7Ot+kccNgTCIdOgGhf3PEuytZqziGheHa8s7czxDDH0S1ZbMS
         B/+XroZFz6XmYEp/F19IQKQocQ5djW36/LQbWxk45c9wlnhLX6479hte5rw93e/la6xT
         J/iv7x0/pLSshSqxEYg7WXJuEHmP5mesd54U9J3uNbBjG7Ut4f1X2oQCcqD3Lvdg6ogh
         oaLhtonC8M08GIeFv0lo1YzYDoh8+6OdGMQue2dOjkNoTWjanfHkqO522jiyPkX5vqAa
         We3dNt5WTUq/acafAu16pUybjYsEm2Wjhh8UqmNkLTd2l3S2sPkjDgdBx4Ismzz6sFhw
         PQ+g==
X-Gm-Message-State: AOAM530fXUwyt4nZzMysQPQBeLKGUNG80h7i+D16ESTwNySaxJyCK/5E
	R/vCe+ZcSgoCEKFQqxd1rmIRwA==
X-Google-Smtp-Source: ABdhPJyD/kOVnJKuPO9y/dGCfdQxgbauiG7ap0jN30d4ZSdU8kjF8qORVJzxwDZAtMgQAX1lLuZ9+Q==
X-Received: by 2002:a05:6638:380a:b0:326:3710:8ffe with SMTP id i10-20020a056638380a00b0032637108ffemr4372793jav.47.1649795706265;
        Tue, 12 Apr 2022 13:35:06 -0700 (PDT)
Received: from [172.22.22.4] (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.googlemail.com with ESMTPSA id c15-20020a5d8b4f000000b00648f75d0289sm22348849iot.6.2022.04.12.13.35.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Apr 2022 13:35:05 -0700 (PDT)
Message-ID: <a509099e-2b19-7a27-693c-b418bd2f7b28@ieee.org>
Date: Tue, 12 Apr 2022 15:35:04 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: Jaehee Park <jhpark1013@gmail.com>, johan@kernel.org
References: <cover.1649793138.git.jhpark1013@gmail.com>
 <d4d01ecdabc492e52a3decebf165d1f584f3b3bf.1649793138.git.jhpark1013@gmail.com>
From: Alex Elder <elder@ieee.org>
In-Reply-To: <d4d01ecdabc492e52a3decebf165d1f584f3b3bf.1649793138.git.jhpark1013@gmail.com>
Message-ID-Hash: HY6GLUEH7FCALXNJWAXFLZ2PU373TKSB
X-Message-ID-Hash: HY6GLUEH7FCALXNJWAXFLZ2PU373TKSB
X-MailFrom: elder@ieee.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v2 2/2] staging: greybus: remove unneeded return
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/HY6GLUEH7FCALXNJWAXFLZ2PU373TKSB/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit

On 4/12/22 2:59 PM, Jaehee Park wrote:
> An empty function with void return type does not need an explicit
> return. Issue found by checkpatch.
> 
> Signed-off-by: Jaehee Park <jhpark1013@gmail.com>

Dan's suggestion here was to simply remove this function
entirely.  It is only used as the ->remove callback
for the soc_codec_dev_gbaudio structure.

You can see that soc_codec_dev_gbaudio is only used in the
call to devm_snd_soc_register_component() near the end of
"audio_codec.c".  When a sound component is registered
that way, the ->remove callback is optional.  You can see
that because the only place in "sound/soc/soc-component.c"
that it is referenced is snd_soc_component_remove() (as
Dan said), and it only calls the function if it the pointer
is non-null.  Allowing null function pointers in places
like this. to allow them to be optionally omitted is not
an uncommon pattern you'll see in the kernel.

Anyway, please don't just add another small patch to remove
the function.  Just replace *this* patch with one that
removes the function, and omits the assignment if its
address to soc_codec_dev_gbaudio->remove.

					-Alex

> ---
>   drivers/staging/greybus/audio_codec.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/staging/greybus/audio_codec.c b/drivers/staging/greybus/audio_codec.c
> index 0f50d1e51e2c..3e3a16568def 100644
> --- a/drivers/staging/greybus/audio_codec.c
> +++ b/drivers/staging/greybus/audio_codec.c
> @@ -1032,7 +1032,6 @@ static int gbcodec_probe(struct snd_soc_component *comp)
>   static void gbcodec_remove(struct snd_soc_component *comp)
>   {
>   	/* Empty function for now */
> -	return;
>   }
>   
>   static int gbcodec_write(struct snd_soc_component *comp, unsigned int reg,

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
