Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F5439AD16
	for <lists+greybus-dev@lfdr.de>; Thu,  3 Jun 2021 23:46:10 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id D3979606B5
	for <lists+greybus-dev@lfdr.de>; Thu,  3 Jun 2021 21:46:08 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 3F8BE60BF0; Thu,  3 Jun 2021 21:46:08 +0000 (UTC)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 9DCA9606B5;
	Thu,  3 Jun 2021 21:46:05 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 4947860572
 for <greybus-dev@lists.linaro.org>; Thu,  3 Jun 2021 21:46:04 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 4722F6066C; Thu,  3 Jun 2021 21:46:04 +0000 (UTC)
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com
 [209.85.166.53])
 by lists.linaro.org (Postfix) with ESMTPS id 417F360572
 for <greybus-dev@lists.linaro.org>; Thu,  3 Jun 2021 21:46:02 +0000 (UTC)
Received: by mail-io1-f53.google.com with SMTP id a8so7897259ioa.12
 for <greybus-dev@lists.linaro.org>; Thu, 03 Jun 2021 14:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5hYN0m9fjMChEAS/wXbVHaeLqYj0w+avaFBB2KzbaKQ=;
 b=tbingU8+EXeEyF9wZOnShTdITV3nEcTvbV9wPe5s2qmfZuZ56hVtJ7K6M3DOK8vu6r
 eey89xG73gilLhDh4yCr3rP2+jFDtlvIEOpnGKFS2Vfo80iatsLcCCo0Wbak2gpCzTCH
 ktH8ojegJJAbHZ/k9rOrDdqeNwCOHkpnm8NqulaCWygjMhBgAlX6rz6pFEwYzBh2lg9P
 VRT7TiyvNJ8eJ2MdvDbaPfRe1cIFKszqMlMLWnE/SSdCLsXU7D4QXD/+xMjVfvKXmLiO
 j9hCih4r/5JYv3i/EAIy80U50T/QAuQwupGY/EeddV7ePS3WbI59uItt3vi7Neu8fRx/
 ODkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5hYN0m9fjMChEAS/wXbVHaeLqYj0w+avaFBB2KzbaKQ=;
 b=rkXmd/mBZaOJrZz5Uyop7rQf2yhb1KTYuDzxpMFmHcfuSGvVNm7FNr5mGCYxn5yX8T
 fgcVboQo3bpXNIgA1MTXR52HarBdPsHdR4nusnV70OpbaiwBsStwTsAt/LVj/spOaPRB
 iikmOVNEYeEGkN+4LHbNwpxPgcFK/lWx4wFTCURDJF03YEW1TRdobsFv7oB9zOa2NDBA
 BZ77X7ui+i/IT9818hAD5tN9EWJyeDXFPT3ygb4Moo74Ww4CQ5lAMctp7nL07vTag39/
 ViXSiYF+zJSuOVKfuh/H3/aKkf+7lNiMwqcTYHe0PynPbE12GwZqT+5eCFLQXhehyg3M
 v+qA==
X-Gm-Message-State: AOAM5300126t1HoO1dkcBvEUO3CC6piLjoqae2EFlZ9wVJbFcBs+x5wb
 T48sIS93hArK5c1OXMyQDRdjpNis
X-Google-Smtp-Source: ABdhPJyPsE8yU5GjdLW7Mi8jJ56LaqeAkeazSQlhqSf6mCpOFgtsLuN/A9Wn7lCiX3b3qZssinMOLA==
X-Received: by 2002:a6b:3b4c:: with SMTP id i73mr1079942ioa.149.1622756761477; 
 Thu, 03 Jun 2021 14:46:01 -0700 (PDT)
Received: from [172.22.22.4] (c-73-185-129-58.hsd1.mn.comcast.net.
 [73.185.129.58])
 by smtp.googlemail.com with ESMTPSA id z8sm2234354ioi.38.2021.06.03.14.46.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Jun 2021 14:46:01 -0700 (PDT)
To: David Laight <David.Laight@ACULAB.COM>,
 'Manikishan Ghantasala' <manikishanghantasala@gmail.com>,
 Alex Elder <elder@ieee.org>
References: <20210602133659.46158-1-manikishanghantasala@gmail.com>
 <9a3878fd-3b59-76f5-ddc7-625c66f9fee8@ieee.org>
 <CAKzJ-FNW8EPX2oQd1qr5NagnvjtWwvSeuAh8DNLetj11+BJ6RA@mail.gmail.com>
 <792dd57c0ef8454497e5ae4c4534dea2@AcuMS.aculab.com>
From: Alex Elder <elder@linaro.org>
Message-ID: <e1c36fb4-ab72-0cce-f6fe-3f04125dae28@linaro.org>
Date: Thu, 3 Jun 2021 16:45:59 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <792dd57c0ef8454497e5ae4c4534dea2@AcuMS.aculab.com>
Content-Language: en-US
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Re: [greybus-dev] [PATCH] staging: greybus: fixed the coding style,
 labels should not be indented.
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
Cc: "greybus-dev@lists.linaro.org" <greybus-dev@lists.linaro.org>,
 Alex Elder <elder@kernel.org>,
 "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
 Johan Hovold <johan@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: greybus-dev-bounces@lists.linaro.org
Sender: "greybus-dev" <greybus-dev-bounces@lists.linaro.org>
X-Virus-Scanned: ClamAV using ClamSMTP

On 6/3/21 4:22 PM, David Laight wrote:
> From: Manikishan Ghantasala
>> Sent: 02 June 2021 15:28
>>
>> I agree those are called bit-field member names rather than labels.
>> But the reason I mentioned is because the ./scripts/checkpatch.pl
>> gave out a warning saying "labels should not be indented".
>>
>> Sorry for the confusion in the name I referred to. So, I think this
>> change is needed as I feel this is not following the coding-style by
>> having indent before the width for bit field member. I went through
>> other places in source code to make sure this is correct, and sent the
>> patch after confirmation.
>>
>> Regards,
>> Manikishan Ghantasala
>>
>> On Wed, 2 Jun 2021 at 19:13, Alex Elder <elder@ieee.org> wrote:
>>>
>>> On 6/2/21 8:36 AM, sh4nnu wrote:
>>>> From: Manikishan Ghantasala <manikishanghantasala@gmail.com>
>>>>
>>>> staging: greybus: gpio.c: Clear coding-style problem
>>>> "labels should not be indented" by removing indentation.
>>>
>>> These are not labels.
>>>
>>> I don't really understand what you're doing here.
>>>
>>> Can you please explain why you think this needs changing?
>>>
>>>                                          -Alex
>>>
>>>> Signed-off-by: Manikishan Ghantasala <manikishanghantasala@gmail.com>
>>>> ---
>>>>    drivers/staging/greybus/gpio.c | 6 +++---
>>>>    1 file changed, 3 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/drivers/staging/greybus/gpio.c b/drivers/staging/greybus/gpio.c
>>>> index 7e6347fe93f9..4661f4a251bd 100644
>>>> --- a/drivers/staging/greybus/gpio.c
>>>> +++ b/drivers/staging/greybus/gpio.c
>>>> @@ -20,9 +20,9 @@
>>>>    struct gb_gpio_line {
>>>>        /* The following has to be an array of line_max entries */
>>>>        /* --> make them just a flags field */
>>>> -     u8                      active:    1,
>>>> -                             direction: 1,   /* 0 = output, 1 = input */
>>>> -                             value:     1;   /* 0 = low, 1 = high */
>>>> +     u8                      active:1,
>>>> +                             direction:1,    /* 0 = output, 1 = input */
>>>> +                             value:1;        /* 0 = low, 1 = high */
> 
> Why are you even using bitfields at all?
> If you cared about the structure size you'd not have a byte-size pad here.

Apparently I committed this, and it was part of the very first
Greybus drivers...

These would be better defined as Booleans; there are others in
the same structure after all.  That would have avoided the
checkpatch problem in the first place.

I was probably thinking *a little* about structure size when
defining it this way, but I agree with you, the bit-fields
don't really add value.

> Since I doubt many copies of this structure get allocated the
> (typical) increase in code size for the bitfields will also
> exceed any size saving.
> 
> Isn't the kernel style also to repeat the type for every field?

I see that style in many places, but not all.  I personally
like it this way--provided it's done in a way that makes
it clear where the integral boundaries are.

					-Alex

> 	David
> 
> 
>>>>        u16                     debounce_usec;
>>>>
>>>>        u8                      irq_type;
>>>>
>>>
> 
> -
> Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
> Registration No: 1397386 (Wales)
> _______________________________________________
> greybus-dev mailing list
> greybus-dev@lists.linaro.org
> https://lists.linaro.org/mailman/listinfo/greybus-dev
> 

_______________________________________________
greybus-dev mailing list
greybus-dev@lists.linaro.org
https://lists.linaro.org/mailman/listinfo/greybus-dev
