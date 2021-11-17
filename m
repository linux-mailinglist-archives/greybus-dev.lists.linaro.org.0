Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id F26DD454E38
	for <lists+greybus-dev@lfdr.de>; Wed, 17 Nov 2021 20:56:24 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 72AE760C29
	for <lists+greybus-dev@lfdr.de>; Wed, 17 Nov 2021 19:56:23 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 0EA3F60851; Wed, 17 Nov 2021 19:56:22 +0000 (UTC)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 4454760BD8;
	Wed, 17 Nov 2021 19:56:20 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 5EA2A60851
 for <greybus-dev@lists.linaro.org>; Wed, 17 Nov 2021 19:56:19 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 5C0CF60BD1; Wed, 17 Nov 2021 19:56:19 +0000 (UTC)
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com
 [209.85.166.53])
 by lists.linaro.org (Postfix) with ESMTPS id 56A1360851
 for <greybus-dev@lists.linaro.org>; Wed, 17 Nov 2021 19:56:17 +0000 (UTC)
Received: by mail-io1-f53.google.com with SMTP id x10so4830332ioj.9
 for <greybus-dev@lists.linaro.org>; Wed, 17 Nov 2021 11:56:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=5VBfPESdcXTL80+DWpyXFkbq5atbMeJcpA3NDVqVEho=;
 b=X6KFt1hJmRksijS0mwdT5x5R5Cb4kdgmuOI69Q5aRlP/NMidCD9mNur25QLLju7p+1
 pUnRfFzKJkXdvMArbfV9m/Xw/xwRBpAk9betoF/jo7wwqhUGkvGBQ+KYG1ZXNJ4TZ0Yw
 kyzV3zPSieN/NrE6lVrQ4epovmEKfDuAtowsj8PTOykl8nIfQqKjNbF3h074mrzZAeVT
 e3M4RDoRtYs1LnC1QctSZCQIe5V4+udBfbKLFPnA6qc5adbm9r9zdQmHzGiP3aBxIK+3
 myvsCAz7qgWVp4mb/EbX+4ze2Rdvz74wnd8ziPhECnzVkuNNjGYJUe0KgB/kCJbbCI9K
 IynQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=5VBfPESdcXTL80+DWpyXFkbq5atbMeJcpA3NDVqVEho=;
 b=A/RwrVkDho4UH9QPhKhXQB/ajdRWJrvrYpDxJOWjdsDvvgZJMV0nX6vJ4rkkkoqqKL
 y9UeSSRbw005GMkFfK+9amlHelmm9DXG+YWeiBY9b19h16TqnOKXNDwbhU30V6cYaNQj
 tNuNg3klUkvUOHTiC9/5o1NBmjKjRcFw1+4KTNhD0RkD7y1gzDRol6KntrtG3EHnFII1
 xIA9KolOP85jxzmRuYfho4iPommLZCrdmvweP9nxufsA5RKOVBZjT736gM47NN19BD+t
 jPDM7x76X/1KYOoKEAiBLMeFBm3iLvtOM/K8bieJYS3kkBzIzVDfPEY1lHkXMUk0j/Jf
 Kv6g==
X-Gm-Message-State: AOAM530jLmsyBG/7dhC9C/S9ZNPLM3DvjFA6W3bLQ3YG/h8eFpshKO9l
 hLQORUhjZryfA0/NxaWOb6hSfBNv
X-Google-Smtp-Source: ABdhPJy5ZbbuIX+vxu7l+x9G0lL52knByhCJwD3rbmlDMi+PygF6+8Dkj/nbTl0tF87B33FoT5E2KA==
X-Received: by 2002:a05:6638:238b:: with SMTP id
 q11mr15391858jat.43.1637178976751; 
 Wed, 17 Nov 2021 11:56:16 -0800 (PST)
Received: from [172.22.22.4] (c-73-185-129-58.hsd1.mn.comcast.net.
 [73.185.129.58])
 by smtp.googlemail.com with ESMTPSA id d2sm577088ilg.77.2021.11.17.11.56.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Nov 2021 11:56:16 -0800 (PST)
Message-ID: <07e228eb-676a-bdb1-c2ec-a96f691f5a18@linaro.org>
Date: Wed, 17 Nov 2021 13:56:14 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>, greybus-dev@lists.linaro.org
References: <20211116072027.18466-1-tiwai@suse.de>
From: Alex Elder <elder@linaro.org>
In-Reply-To: <20211116072027.18466-1-tiwai@suse.de>
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Re: [greybus-dev] [PATCH] staging: greybus: Add missing rwsem
 around snd_ctl_remove() calls
X-BeenThere: greybus-dev@lists.linaro.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
List-Unsubscribe: <https://lists.linaro.org/mailman/options/greybus-dev>,
 <mailto:greybus-dev-request@lists.linaro.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/greybus-dev/>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Subscribe: <https://lists.linaro.org/mailman/listinfo/greybus-dev>,
 <mailto:greybus-dev-request@lists.linaro.org?subject=subscribe>
Cc: Alex Elder <elder@kernel.org>, Johan Hovold <johan@kernel.org>,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: greybus-dev-bounces@lists.linaro.org
Sender: "greybus-dev" <greybus-dev-bounces@lists.linaro.org>
X-Virus-Scanned: ClamAV using ClamSMTP

On 11/16/21 1:20 AM, Takashi Iwai wrote:
> snd_ctl_remove() has to be called with card->controls_rwsem held (when
> called after the card instantiation).  This patch adds the missing
> rwsem calls around it.

I see the comment above snd_ctl_remove() that says you must hold
the write lock.  And given that, this seems correct to me.

I understand why you want to take the lock just once, rather
than each time snd_ctl_remove() is called.

However I believe the acquisition and release of the lock
belongs inside gbaudio_remove_controls(), not in its caller.

If you disagree, can you please explain why?

Otherwise, will you please submit version two, taking the
lock inside gbaudio_remove_controls()?

Thanks.

					-Alex

> Fixes: 510e340efe0c ("staging: greybus: audio: Add helper APIs for dynamic audio modules")
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
>   drivers/staging/greybus/audio_helper.c | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/greybus/audio_helper.c b/drivers/staging/greybus/audio_helper.c
> index 1ed4772d2771..843760675876 100644
> --- a/drivers/staging/greybus/audio_helper.c
> +++ b/drivers/staging/greybus/audio_helper.c
> @@ -192,7 +192,11 @@ int gbaudio_remove_component_controls(struct snd_soc_component *component,
>   				      unsigned int num_controls)
>   {
>   	struct snd_card *card = component->card->snd_card;
> +	int err;
>   
> -	return gbaudio_remove_controls(card, component->dev, controls,
> -				       num_controls, component->name_prefix);
> +	down_write(&card->controls_rwsem);
> +	err = gbaudio_remove_controls(card, component->dev, controls,
> +				      num_controls, component->name_prefix);
> +	up_write(&card->controls_rwsem);
> +	return err;
>   }
> 

_______________________________________________
greybus-dev mailing list
greybus-dev@lists.linaro.org
https://lists.linaro.org/mailman/listinfo/greybus-dev
