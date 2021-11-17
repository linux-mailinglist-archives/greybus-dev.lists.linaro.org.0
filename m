Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id B3836454FE2
	for <lists+greybus-dev@lfdr.de>; Wed, 17 Nov 2021 22:55:16 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 8681760C02
	for <lists+greybus-dev@lfdr.de>; Wed, 17 Nov 2021 21:55:15 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 3AA8C60C34; Wed, 17 Nov 2021 21:55:15 +0000 (UTC)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id BDE4360BF4;
	Wed, 17 Nov 2021 21:55:12 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 74CF860BEC
 for <greybus-dev@lists.linaro.org>; Wed, 17 Nov 2021 21:55:11 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 6FDB460BF2; Wed, 17 Nov 2021 21:55:11 +0000 (UTC)
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com
 [209.85.166.172])
 by lists.linaro.org (Postfix) with ESMTPS id 5EB7D60BEC
 for <greybus-dev@lists.linaro.org>; Wed, 17 Nov 2021 21:55:09 +0000 (UTC)
Received: by mail-il1-f172.google.com with SMTP id l8so4340976ilv.3
 for <greybus-dev@lists.linaro.org>; Wed, 17 Nov 2021 13:55:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Hxr69O3bJrzYefrTxgVZfC16APa+v16lfxoy3u13P1s=;
 b=QpE3KxMjhsnLmogPyVojs8AgoyXiIlugpWIViPAv7oiK1aXt5F2T46PeR0VJXEnpCz
 m7v3Ao9VxhEIBD60di2CRpisiRPQNSoPF7NcpFHnujXABezOdIK1zP/UY9sj+8ofWpQT
 gcfhUceItvGTYjnCGDFe9ChfLskStZ6AucPz6AQ+TpywDW+h3lfvuU/oh+zGlhfY8Xee
 taBiu6Od2l3Sywgqnhj8ycQdLaQItwJjpk72zE2va7G3BseM3BIPpHYt/sXHv+8ODP3Q
 Xo1YHwiRjmv3aiuHJPhguGEg/ziKpQTxdHOvsFEumpzmy8th51zMlS3/uyPTpk2C0vXU
 a49A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Hxr69O3bJrzYefrTxgVZfC16APa+v16lfxoy3u13P1s=;
 b=oJoOQHKtZXHauvTkDyr5DEDlWz33PlJLO5V5VbwlSSl48w0MbyTZygCOeR37Nq/VRM
 Oe3+qhhvIaid4rZAx2xCp2Llsa6GcK5thHYo1SZlJudqcCZuVKY28f2JuvBWlNmRSojB
 RiIwiXM+5Wf89PGhZJfAcOkUhhp2D2ZHG4LkDUtYG4j7nDFu9nF2dPt6qgeANuYFzmPX
 5mhSCQiYywMLvUtIDc0k6XDvXa4WUawlBXzh9q0qzfeUZICgwaGGTHjHwGYTwWXKml25
 52VQgHYOQRjPDfrKFtXxmFA4vewcsGKZ6tRmsIuEz/mas94LFtYAwZunWKoBb6Oed34s
 ffiw==
X-Gm-Message-State: AOAM530kVpev4FcbRGtO6AVgNcm72s3yUjjcHCansqwKJCf+6bn+D37e
 8hMpw9PwExtPMLrpcmWW5bnSm/37nGpkA0Cm
X-Google-Smtp-Source: ABdhPJziRfbgGvt+zj01L3LXVaTAP4Q1xpUA/9+Eb4Zh/hXWLeCX1sMr0sPVc/gYLkSCCicB08Nz4Q==
X-Received: by 2002:a92:c5cc:: with SMTP id s12mr12752085ilt.239.1637186108709; 
 Wed, 17 Nov 2021 13:55:08 -0800 (PST)
Received: from [172.22.22.4] (c-73-185-129-58.hsd1.mn.comcast.net.
 [73.185.129.58])
 by smtp.googlemail.com with ESMTPSA id a25sm588238ioa.24.2021.11.17.13.55.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Nov 2021 13:55:07 -0800 (PST)
Message-ID: <b0d2b643-214a-07c5-96b7-4845c54cba72@linaro.org>
Date: Wed, 17 Nov 2021 15:55:06 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>
References: <20211116072027.18466-1-tiwai@suse.de>
 <07e228eb-676a-bdb1-c2ec-a96f691f5a18@linaro.org>
 <s5h5ysqlcm8.wl-tiwai@suse.de>
From: Alex Elder <elder@linaro.org>
In-Reply-To: <s5h5ysqlcm8.wl-tiwai@suse.de>
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
Cc: greybus-dev@lists.linaro.org, Alex Elder <elder@kernel.org>,
 Johan Hovold <johan@kernel.org>, linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: greybus-dev-bounces@lists.linaro.org
Sender: "greybus-dev" <greybus-dev-bounces@lists.linaro.org>
X-Virus-Scanned: ClamAV using ClamSMTP

On 11/17/21 3:02 PM, Takashi Iwai wrote:
> On Wed, 17 Nov 2021 20:56:14 +0100,
> Alex Elder wrote:
>>
>> On 11/16/21 1:20 AM, Takashi Iwai wrote:
>>> snd_ctl_remove() has to be called with card->controls_rwsem held (when
>>> called after the card instantiation).  This patch adds the missing
>>> rwsem calls around it.
>>
>> I see the comment above snd_ctl_remove() that says you must hold
>> the write lock.  And given that, this seems correct to me.
>>
>> I understand why you want to take the lock just once, rather
>> than each time snd_ctl_remove() is called.
>>
>> However I believe the acquisition and release of the lock
>> belongs inside gbaudio_remove_controls(), not in its caller.
>>
>> If you disagree, can you please explain why?
> 
> In general if the function returns an error and has a loop inside,
> taking a lock in the caller side avoids the forgotten unlock.

But taking the lock in the called function makes the
caller not need to take the lock (which would be even
more valuable if there were more than one caller).

I prefer having the lock acquisition in the called
function.  Please send version 2, as I suggested.

					-Alex

> Takashi
> 
> 
>> Otherwise, will you please submit version two, taking the
>> lock inside gbaudio_remove_controls()?
>>
>> Thanks.
>>
>> 					-Alex
>>
>>> Fixes: 510e340efe0c ("staging: greybus: audio: Add helper APIs for dynamic audio modules")
>>> Signed-off-by: Takashi Iwai <tiwai@suse.de>
>>> ---
>>>    drivers/staging/greybus/audio_helper.c | 8 ++++++--
>>>    1 file changed, 6 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/staging/greybus/audio_helper.c b/drivers/staging/greybus/audio_helper.c
>>> index 1ed4772d2771..843760675876 100644
>>> --- a/drivers/staging/greybus/audio_helper.c
>>> +++ b/drivers/staging/greybus/audio_helper.c
>>> @@ -192,7 +192,11 @@ int gbaudio_remove_component_controls(struct snd_soc_component *component,
>>>    				      unsigned int num_controls)
>>>    {
>>>    	struct snd_card *card = component->card->snd_card;
>>> +	int err;
>>>    -	return gbaudio_remove_controls(card, component->dev, controls,
>>> -				       num_controls, component->name_prefix);
>>> +	down_write(&card->controls_rwsem);
>>> +	err = gbaudio_remove_controls(card, component->dev, controls,
>>> +				      num_controls, component->name_prefix);
>>> +	up_write(&card->controls_rwsem);
>>> +	return err;
>>>    }
>>>
>>

_______________________________________________
greybus-dev mailing list
greybus-dev@lists.linaro.org
https://lists.linaro.org/mailman/listinfo/greybus-dev
