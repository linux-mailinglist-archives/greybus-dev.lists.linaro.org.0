Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 39DBF4FF712
	for <lists+greybus-dev@lfdr.de>; Wed, 13 Apr 2022 14:48:09 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 372373EF66
	for <lists+greybus-dev@lfdr.de>; Wed, 13 Apr 2022 12:48:08 +0000 (UTC)
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
	by lists.linaro.org (Postfix) with ESMTPS id 9AC493EEDE
	for <greybus-dev@lists.linaro.org>; Wed, 13 Apr 2022 12:48:05 +0000 (UTC)
Received: by mail-io1-f42.google.com with SMTP id b16so1724551ioz.3
        for <greybus-dev@lists.linaro.org>; Wed, 13 Apr 2022 05:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=9jPZG9/+m97btsIbUfBFkqEN0JQ7wZ3+b8nQQ/RX0/U=;
        b=QBoFY5ec7cTEQSifRW8FUGrkedVgwRZQotcNk3yipnOF3lhr9Pcn4eFZ9Puuwt97s9
         uXvcFWEzJ2ok1oCj6cpgUqFryCjxuO3hPjWQrNyMdJDmwZw2HOQrGwO1anN03ZPZZR65
         VSUM5TcLIQTgDrKFO1rlFgqmx4H88Sn4OPrXo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=9jPZG9/+m97btsIbUfBFkqEN0JQ7wZ3+b8nQQ/RX0/U=;
        b=w4IidZrUNeD/QCUYIy2jm6XoZUQY31vJqQdJGkFMb/Mb9OTnssf7vB1T2WBkoXzxsJ
         h7DipYxE++iD6h3wJtXuF1NCl6oLceEZYXqA+SxP6T20Mzm3VJ9GTC150T/dU0z3rpQR
         IfXHhSB9NTFspunhLc2qFB89X29Q9m1U55KUSQaOUMDn7+vKBowYkSQmH33yqIVLqFPR
         b293kJK2Qrdh2L9TwJsSgekyxApSFJnHprlrYMdmu57JXlJo7zsfqcBLqsPf7pzqbVru
         cYoQzo5vZB6VgQt6zvDZzrwzlB6FAFVmpdSd3o7LGasSZ+GrmsUEnEQislb2sCUGo4FG
         JSfg==
X-Gm-Message-State: AOAM532hkXTp1xM4zli9ut/YYd2KLAyy92dW3XW0+QUOJ6cMYfrVVWSF
	59PVmInvQv81OowyNRJA1KVzAA==
X-Google-Smtp-Source: ABdhPJwcDwROpz/UfIELVwrdwOuvg76PG0BW+jpB2S6XlS8+0l+GjJIkxkMWI7DdRYklftWbiiTamQ==
X-Received: by 2002:a02:271f:0:b0:326:af4:3f0c with SMTP id g31-20020a02271f000000b003260af43f0cmr11290770jaa.300.1649854085065;
        Wed, 13 Apr 2022 05:48:05 -0700 (PDT)
Received: from [172.22.22.4] (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.googlemail.com with ESMTPSA id x186-20020a6bc7c3000000b00648deae6630sm24343335iof.54.2022.04.13.05.48.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Apr 2022 05:48:04 -0700 (PDT)
Message-ID: <a4e5c567-63dd-f7de-114b-a357075444a2@ieee.org>
Date: Wed, 13 Apr 2022 07:48:03 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: Jaehee Park <jhpark1013@gmail.com>, johan@kernel.org
References: <cover.1649824370.git.jhpark1013@gmail.com>
 <12037ae2502ad7d0311bcdf2178c3d2156293236.1649824370.git.jhpark1013@gmail.com>
From: Alex Elder <elder@ieee.org>
In-Reply-To: <12037ae2502ad7d0311bcdf2178c3d2156293236.1649824370.git.jhpark1013@gmail.com>
Message-ID-Hash: E5PDBQD4J5APH6SEY6JPIO6GF56DZK33
X-Message-ID-Hash: E5PDBQD4J5APH6SEY6JPIO6GF56DZK33
X-MailFrom: elder@ieee.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, outreachy@lists.linux.dev, Dan Carpenter <dan.carpenter@oracle.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v3 2/2] staging: greybus: remove empty callback function
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/E5PDBQD4J5APH6SEY6JPIO6GF56DZK33/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit

On 4/12/22 11:38 PM, Jaehee Park wrote:
> Remove the optional remove callback for the soc_codec_dev_gbaudio
> structure. The only place it is referenced is
> snd_soc_component_remove() which is only called if the sound_component
> pointer is non-null. The null function pointers here can be optionally
> ommitted. When a sound component is registered this way, the remove
> callback is optional. We can safely remove the whole gbcodec_remove
> function, which used to be an empty function with a void return type.

Now I think your description is a little long...  But that's OK.

This looks good to me.  Thank you for responding to all our
feedback.

Reviewed-by: Alex Elder <elder@linaro.org>
> 
> Suggested-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Jaehee Park <jhpark1013@gmail.com>
> ---
>   drivers/staging/greybus/audio_codec.c | 8 --------
>   1 file changed, 8 deletions(-)
> 
> diff --git a/drivers/staging/greybus/audio_codec.c b/drivers/staging/greybus/audio_codec.c
> index 0f50d1e51e2c..dc030caa64ba 100644
> --- a/drivers/staging/greybus/audio_codec.c
> +++ b/drivers/staging/greybus/audio_codec.c
> @@ -1029,12 +1029,6 @@ static int gbcodec_probe(struct snd_soc_component *comp)
>   	return 0;
>   }
>   
> -static void gbcodec_remove(struct snd_soc_component *comp)
> -{
> -	/* Empty function for now */
> -	return;
> -}
> -
>   static int gbcodec_write(struct snd_soc_component *comp, unsigned int reg,
>   			 unsigned int value)
>   {
> @@ -1049,8 +1043,6 @@ static unsigned int gbcodec_read(struct snd_soc_component *comp,
>   
>   static const struct snd_soc_component_driver soc_codec_dev_gbaudio = {
>   	.probe	= gbcodec_probe,
> -	.remove	= gbcodec_remove,
> -
>   	.read = gbcodec_read,
>   	.write = gbcodec_write,
>   };

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
