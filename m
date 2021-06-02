Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 2201E398D44
	for <lists+greybus-dev@lfdr.de>; Wed,  2 Jun 2021 16:38:56 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id DBA7960F4F
	for <lists+greybus-dev@lfdr.de>; Wed,  2 Jun 2021 14:38:54 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id CC05760F06; Wed,  2 Jun 2021 14:38:54 +0000 (UTC)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 297F16079C;
	Wed,  2 Jun 2021 14:38:52 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 5C23860713
 for <greybus-dev@lists.linaro.org>; Wed,  2 Jun 2021 14:38:50 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 59F3360774; Wed,  2 Jun 2021 14:38:50 +0000 (UTC)
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com
 [209.85.166.54])
 by lists.linaro.org (Postfix) with ESMTPS id 52C6D60713
 for <greybus-dev@lists.linaro.org>; Wed,  2 Jun 2021 14:38:48 +0000 (UTC)
Received: by mail-io1-f54.google.com with SMTP id q7so2797225iob.4
 for <greybus-dev@lists.linaro.org>; Wed, 02 Jun 2021 07:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ieee.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Wa/wty1AqVchNLec2lyVeo7rH67/UrtzC+3fwYGm3+k=;
 b=W9DsqSl18rPIG3MTwutPjA67ZKIVWYxaHbnbhi3zlWGx8ORcZBDBjH4RXq/ASqmkcp
 bU5Nl+Wv3p/vRjhh7yXKi5sn9cgIPHH3YAXyauguMZrI1ny7mSE/4dFyKPPOvKuoqiul
 zO3M1kEgUIHkN/GwotsQskj/ofeyQa8ndp0Gc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Wa/wty1AqVchNLec2lyVeo7rH67/UrtzC+3fwYGm3+k=;
 b=CuXM6PCAI4yvk++FdUuhmHx9ljjeRfSAbnTWjDxVTxAtGIxW5d4EtfxWi1aAsx/n/+
 jLxGtomKW5T8pKUG7SEjRE6klOoYLm+YeF1EyrKrAZlcKMS3qAC7t95+eLXiskg0lPct
 b8qdXQYJClYaRQRG0J9pa+sVgk5/4wfcAWHtz6ydLOBZ3Dw4uGQz8AofeLD5XDYutLMC
 FVgJJQT/2NP7vZCnStCN7KmDAVD+yzGy+o1mBZJWYs6TELL0f5WbWWF0S4Y31dJzMvlL
 HLNXiUKmKfgDqTmK+OOW7n5wjlWc2tiCY00KxjUpLkarmV5rvIMS+aunMP+N1Gir7w1K
 1nFQ==
X-Gm-Message-State: AOAM530SfTCra32x/O4CEWnJZaYfZ6VWxHjCmoaFr6cZlWaDp93OcoSV
 M4H1hCJq+G7bOsBEZl+1XMuY0w==
X-Google-Smtp-Source: ABdhPJzSNXy7b5DGkDCPiHfC7JqwcrGXcCTmeLd4RHyEUn6x1JdXI7FWvRd0pmhb61A+xjo6zk1Ifw==
X-Received: by 2002:a05:6638:2643:: with SMTP id
 n3mr30375514jat.104.1622644727758; 
 Wed, 02 Jun 2021 07:38:47 -0700 (PDT)
Received: from [172.22.22.4] (c-73-185-129-58.hsd1.mn.comcast.net.
 [73.185.129.58])
 by smtp.googlemail.com with ESMTPSA id k9sm89434ioa.13.2021.06.02.07.38.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jun 2021 07:38:47 -0700 (PDT)
To: Manikishan Ghantasala <manikishanghantasala@gmail.com>
References: <20210602133659.46158-1-manikishanghantasala@gmail.com>
 <9a3878fd-3b59-76f5-ddc7-625c66f9fee8@ieee.org>
 <CAKzJ-FNW8EPX2oQd1qr5NagnvjtWwvSeuAh8DNLetj11+BJ6RA@mail.gmail.com>
From: Alex Elder <elder@ieee.org>
Message-ID: <dabb158b-8c7f-152e-f9a8-3c6e482af751@ieee.org>
Date: Wed, 2 Jun 2021 09:38:45 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAKzJ-FNW8EPX2oQd1qr5NagnvjtWwvSeuAh8DNLetj11+BJ6RA@mail.gmail.com>
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
Cc: Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org,
 linux-staging@lists.linux.dev, Johan Hovold <johan@kernel.org>,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: greybus-dev-bounces@lists.linaro.org
Sender: "greybus-dev" <greybus-dev-bounces@lists.linaro.org>
X-Virus-Scanned: ClamAV using ClamSMTP

On 6/2/21 9:27 AM, Manikishan Ghantasala wrote:
> Sending this mail again as I missed to reply to all.
>   Hi Alex,
> 
> I agree those are called bit-field member names rather than labels.
> But the reason I mentioned is because the ./scripts/checkpatch.pl
> gave out a warning saying "labels should not be indented".
> 
> Sorry for the confusion in the name I referred to. So, I think this
> change is needed as I feel this is not following the coding-style by
> having indent before the width for bit field member. I went through
> other places in source code to make sure this is correct, and sent the
> patch after confirmation.

I agree that many instances in the kernel source place the width
of a C bit-field immediately after the colon.  But it is not a
universal convention, and I personally prefer the aligned widths
used by the Greybus code here.

So I don't find this patch acceptable.

					-Alex

> Regards,
> Manikishan Ghantasala
> 
> On Wed, 2 Jun 2021 at 19:13, Alex Elder <elder@ieee.org> wrote:
>>
>> On 6/2/21 8:36 AM, sh4nnu wrote:
>>> From: Manikishan Ghantasala <manikishanghantasala@gmail.com>
>>>
>>> staging: greybus: gpio.c: Clear coding-style problem
>>> "labels should not be indented" by removing indentation.
>>
>> These are not labels.
>>
>> I don't really understand what you're doing here.
>>
>> Can you please explain why you think this needs changing?
>>
>>                                          -Alex
>>
>>> Signed-off-by: Manikishan Ghantasala <manikishanghantasala@gmail.com>
>>> ---
>>>    drivers/staging/greybus/gpio.c | 6 +++---
>>>    1 file changed, 3 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/staging/greybus/gpio.c b/drivers/staging/greybus/gpio.c
>>> index 7e6347fe93f9..4661f4a251bd 100644
>>> --- a/drivers/staging/greybus/gpio.c
>>> +++ b/drivers/staging/greybus/gpio.c
>>> @@ -20,9 +20,9 @@
>>>    struct gb_gpio_line {
>>>        /* The following has to be an array of line_max entries */
>>>        /* --> make them just a flags field */
>>> -     u8                      active:    1,
>>> -                             direction: 1,   /* 0 = output, 1 = input */
>>> -                             value:     1;   /* 0 = low, 1 = high */
>>> +     u8                      active:1,
>>> +                             direction:1,    /* 0 = output, 1 = input */
>>> +                             value:1;        /* 0 = low, 1 = high */
>>>        u16                     debounce_usec;
>>>
>>>        u8                      irq_type;
>>>
>>

_______________________________________________
greybus-dev mailing list
greybus-dev@lists.linaro.org
https://lists.linaro.org/mailman/listinfo/greybus-dev
