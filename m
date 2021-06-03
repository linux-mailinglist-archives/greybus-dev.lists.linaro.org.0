Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 21CBF39AD43
	for <lists+greybus-dev@lfdr.de>; Thu,  3 Jun 2021 23:55:15 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id CB53F60B63
	for <lists+greybus-dev@lfdr.de>; Thu,  3 Jun 2021 21:55:13 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 72B2860B65; Thu,  3 Jun 2021 21:55:13 +0000 (UTC)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 2A48B606B5;
	Thu,  3 Jun 2021 21:55:11 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 914D860572
 for <greybus-dev@lists.linaro.org>; Thu,  3 Jun 2021 21:55:09 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 86A626066C; Thu,  3 Jun 2021 21:55:09 +0000 (UTC)
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com
 [209.85.210.50])
 by lists.linaro.org (Postfix) with ESMTPS id 7DCA760572
 for <greybus-dev@lists.linaro.org>; Thu,  3 Jun 2021 21:55:07 +0000 (UTC)
Received: by mail-ot1-f50.google.com with SMTP id
 5-20020a9d01050000b02903c700c45721so6154165otu.6
 for <greybus-dev@lists.linaro.org>; Thu, 03 Jun 2021 14:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=O0AHKb8SzFFWyVM+WVdBKXLWI+pRbVoX23KoodBk3sU=;
 b=C1mfTlItCazDj4zyHIyO33ijPj7JmggfgHu2V/Nvpv2qUNrwjWkFVbGnNVxrx1nhZ3
 m1AMpkKgydBbcVS0JKfDnWOfq7oiWGitw4yiEsZjdylIsG4RZdrpUvltw7k7/P9WlIfD
 kzrcqqbtk5mD2CmX13u4xWB6sg1iDm3Zg2ZLtdqrmBXpF7tLQ8VMHLNxXKlUQL/gxipI
 TuM8glglk02b6tDmFv6GxfesZ0+otfLxcGrSKQzGA9JLw0RQPY/rxi56mzRL/YKoDBYW
 CP3BzHMHSFsOdDrYHzSD/b0/i/U1p8L3ZBnmS9RQi0tobvoNx4sHi2hV4EVxXQEwmRXQ
 EOnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=O0AHKb8SzFFWyVM+WVdBKXLWI+pRbVoX23KoodBk3sU=;
 b=foW1EhmZdCbJc/MdwKxZco6U2m183VoE1za9fV08jbWI6VL5m6sylu+iXgIkrmj3Wu
 x23KAaQSlOLUYdmNZaTqS2W1fWlAwwxak0kBMyk3gkhpBNQj8WD3N/ykUsrvC8cRMcPc
 NyziFa5VYCxleEu3avhso3hYMrNBjgwA211Z+txtsmAYxVskSCKKp0pD95A3DhNW0g9r
 zgDrb4F8xqc9BYPbnzDkD2QjnAeFz/3Xvb9iIaIP5zOpZwtHOaUhWmZQ9ESMvff3Qwdt
 eLhyern9M0AcypHgNi1cKQC12LXDDV+R1ZbZjdQBLhgwYHqaWXipcMEJmNNotWvQLB/P
 cgxQ==
X-Gm-Message-State: AOAM531b9i2FtbAw1IWe7TyCIqSEFVoprvWy8elGXPMNbrlG2W06fuF2
 TeSUr1hNBt6TnyQjJs8qKc3ypTgW
X-Google-Smtp-Source: ABdhPJxP6X/Ko1xj6k9t4gVYLe86TlzGsdTkR4Pt66q4EqQYMk8GaP890NfpcG5tndgN9xlkjBFN2w==
X-Received: by 2002:a9d:7750:: with SMTP id t16mr1170972otl.135.1622757306927; 
 Thu, 03 Jun 2021 14:55:06 -0700 (PDT)
Received: from [172.22.22.4] (c-73-185-129-58.hsd1.mn.comcast.net.
 [73.185.129.58])
 by smtp.googlemail.com with ESMTPSA id i4sm31997oth.38.2021.06.03.14.55.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Jun 2021 14:55:06 -0700 (PDT)
To: David Laight <David.Laight@ACULAB.COM>,
 'Manikishan Ghantasala' <manikishanghantasala@gmail.com>,
 Alex Elder <elder@ieee.org>
References: <20210602133659.46158-1-manikishanghantasala@gmail.com>
 <9a3878fd-3b59-76f5-ddc7-625c66f9fee8@ieee.org>
 <CAKzJ-FNW8EPX2oQd1qr5NagnvjtWwvSeuAh8DNLetj11+BJ6RA@mail.gmail.com>
 <792dd57c0ef8454497e5ae4c4534dea2@AcuMS.aculab.com>
 <e1c36fb4-ab72-0cce-f6fe-3f04125dae28@linaro.org>
 <e23879ae78404be2b707b550b3029e43@AcuMS.aculab.com>
From: Alex Elder <elder@linaro.org>
Message-ID: <10ad30e2-c906-b210-bf0e-5e20b6de1993@linaro.org>
Date: Thu, 3 Jun 2021 16:55:04 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <e23879ae78404be2b707b550b3029e43@AcuMS.aculab.com>
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

On 6/3/21 4:48 PM, David Laight wrote:
> From: Alex Elder
>> Sent: 03 June 2021 22:46
>>
>> On 6/3/21 4:22 PM, David Laight wrote:
> ...
>>>>>> --- a/drivers/staging/greybus/gpio.c
>>>>>> +++ b/drivers/staging/greybus/gpio.c
>>>>>> @@ -20,9 +20,9 @@
>>>>>>     struct gb_gpio_line {
>>>>>>         /* The following has to be an array of line_max entries */
>>>>>>         /* --> make them just a flags field */
>>>>>> -     u8                      active:    1,
>>>>>> -                             direction: 1,   /* 0 = output, 1 = input */
>>>>>> -                             value:     1;   /* 0 = low, 1 = high */
>>>>>> +     u8                      active:1,
>>>>>> +                             direction:1,    /* 0 = output, 1 = input */
>>>>>> +                             value:1;        /* 0 = low, 1 = high */
>>>
>>> Why are you even using bitfields at all?
>>> If you cared about the structure size you'd not have a byte-size pad here.
>>
>> Apparently I committed this, and it was part of the very first
>> Greybus drivers...
>>
>> These would be better defined as Booleans; there are others in
>> the same structure after all.  That would have avoided the
>> checkpatch problem in the first place.
> 
> Using 'u8' can be sensible.
> Boolean will be 32bit.

Not necessarily, sizeof(bool) is implementation defined.
And I thought you didn't think the size of the structure
was very important...

In any case, I'm open to changing the type of these fields,
and my preference would be bool rather than u8, because it
is completely clear what it represents.

					-Alex

> 	David
> 
> -
> Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
> Registration No: 1397386 (Wales)
> 

_______________________________________________
greybus-dev mailing list
greybus-dev@lists.linaro.org
https://lists.linaro.org/mailman/listinfo/greybus-dev
