Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id BA85C4E2639
	for <lists+greybus-dev@lfdr.de>; Mon, 21 Mar 2022 13:19:03 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id E7D913EF89
	for <lists+greybus-dev@lfdr.de>; Mon, 21 Mar 2022 12:19:02 +0000 (UTC)
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
	by lists.linaro.org (Postfix) with ESMTPS id 907A63EE8D
	for <greybus-dev@lists.linaro.org>; Mon, 21 Mar 2022 12:19:00 +0000 (UTC)
Received: by mail-io1-f48.google.com with SMTP id x4so16436636iop.7
        for <greybus-dev@lists.linaro.org>; Mon, 21 Mar 2022 05:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=gviUCZoqMlwAzPxDTeni3/iP7iEP9Odnzm6mNqYWrWE=;
        b=sUINLx6thHdc+ZK8Os4juDGY3FX9AeO5hZVu/WjHFREy1p3ODH3sudnKqkHlbnB7l6
         UO2IiYkkoyKWuTT31JjYaPqvJtA144jGu4cDav2Q+wXfQbPYU5Gx+6uyB6BAR4etAR3Z
         3zG4DBXNSYV1rQBfDL3UrV+GYPjDf4tMlpGovjwSESOqxy5/CtlgY3GhqUpp/OpaIg5f
         rv8uY1at77CC7Mag+vZdnHCVQInAkvwytCiv3igX9p4CK2RSSxss1KzYdOS1OnEiRFPR
         wKqHrqwG9IyZNdLT3X/G0XosymFnKXHWY5p//o+JKPIEGPp8RDmLA4K+fkldDp6S9jpZ
         RpQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=gviUCZoqMlwAzPxDTeni3/iP7iEP9Odnzm6mNqYWrWE=;
        b=uOaEuXF/4X3htnLfgv6F3NpDK1Og5pLdpYPKpJw6HRVBLaa1W5vpNUADPXPTbEoUj7
         NsIpdO/C6hKeHlyUVWJXjZNhYZd43thekjF6lTcQ/iLRH/waqrO2zx4jBxQwoSPI1EVo
         5EoojUK+OUm4M3f3lOcD79w7PHZez7/w9qTQV36PC6+6EEsQFx3lWIqYYsG41g1OTj9p
         XJWQpC9VM+jq/6sZHqTp+eWsxSIjlP4/iiiBVwK4JTd/xQqL79sa6ts6HB82D7RbGsWE
         MZEtDUZcUd/SQzlRy0eeWRpYikuheuP+i3i5aM3fMPwYthLtbOwbiT/kLmQCbOVjmWRO
         eEEg==
X-Gm-Message-State: AOAM532hWT/Wh9M+14Zj4FFwKB85uHwvjyF6JXOA8XYC3B7TvbqJ8SgW
	PbQjPznii5adWFgChRBr1/Qozdwu
X-Google-Smtp-Source: ABdhPJwnU6BWz11dWizI7zp4dHVLETJ6TbQyIBffJyHl3m3j17tE7tcHexwcX2y3NMCekWPKLLRtlQ==
X-Received: by 2002:a05:6638:1455:b0:319:e467:656b with SMTP id l21-20020a056638145500b00319e467656bmr10518195jad.111.1647865139942;
        Mon, 21 Mar 2022 05:18:59 -0700 (PDT)
Received: from [172.22.22.26] (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.googlemail.com with ESMTPSA id w8-20020a056e0213e800b002c8279fb9dfsm1847793ilj.57.2022.03.21.05.18.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Mar 2022 05:18:59 -0700 (PDT)
Message-ID: <312061ed-61d6-4e2f-a180-8e8c85573e31@linaro.org>
Date: Mon, 21 Mar 2022 07:18:57 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Jakob Koschel <jakobkoschel@gmail.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
References: <20220319202058.2518847-1-jakobkoschel@gmail.com>
 <20220321084844.GG3293@kadam>
 <23587784-B0EB-4FDD-B5BC-DC1B16404DA7@gmail.com>
 <20220321092132.GI3293@kadam>
 <56102C8D-DBFF-43A5-9641-04577F01AB6D@gmail.com>
From: Alex Elder <elder@linaro.org>
In-Reply-To: <56102C8D-DBFF-43A5-9641-04577F01AB6D@gmail.com>
Message-ID-Hash: AWD2VKJ5TK4WVL2FKWPT5WSM6WCK7XLR
X-Message-ID-Hash: AWD2VKJ5TK4WVL2FKWPT5WSM6WCK7XLR
X-MailFrom: elder@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, Mike Rapport <rppt@kernel.org>, Brian Johannesmeyer <bjohannesmeyer@gmail.com>, Cristiano Giuffrida <c.giuffrida@vu.nl>, "Bos, H.J." <h.j.bos@vu.nl>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: codecs: fix type confusion with dedicated list iterator variable
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/AWD2VKJ5TK4WVL2FKWPT5WSM6WCK7XLR/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit

On 3/21/22 4:27 AM, Jakob Koschel wrote:
> 

I just released some messages that were marked as spam.  So
this looks to me like it's already been seen on the list.
I'm not sure why this happens but if it seems like deja vu,
you're not imagining things.  Please know that this could
happen from time to time, but I'll see if I can find out
how to avoid it.

					-Alex

>> On 21. Mar 2022, at 10:21, Dan Carpenter <dan.carpenter@oracle.com> wrote:
>>
>> On Mon, Mar 21, 2022 at 10:06:13AM +0100, Jakob Koschel wrote:
>>>
>>>> On 21. Mar 2022, at 09:48, Dan Carpenter <dan.carpenter@oracle.com> wrote:
>>>>
>>>> The subject says that it fixes a bug but it does not.
>>>
>>> Thank you for your review!
>>>
>>> I don't agree that this doesn't fix a bug:
>>>
>>>> +		}
>>>> 	}
>>>> 	if (!data) {
>>>> -		dev_err(dai->dev, "%s:%s DATA connection missing\n",
>>>> -			dai->name, module->name);
>>>
>>> Using 'module' when data == NULL is *guaranteed* to be a type confused
>>> bogus pointer. It fundamentally can never be correct.
>>
>> Ah.  I did not read all the way to the end of the patch.
>>
>> The bugfix needs to be sent as it's own patch.  Just the one liner.  It
>> needs a fixes tag as well.
>>
>> [PATCH] staging: greybus: fix Oops in error message
>>
>> The "module" pointer is invalid here.  It's the list iterator and we
>> exited the loop without finding a valid entry.
>>
>> Fixes: 6dd67645f22c ("greybus: audio: Use single codec driver registration")
>> Signed-off-by: You
>>
>> 	if (!data) {
>> -		dev_err(dai->dev, "%s:%s DATA connection missing\n",
>> -			dai->name, module->name);
>> +		dev_err(dai->dev, "%s DATA connection missing\n",
>> +			dai->name);
>> 		mutex_unlock(&codec->lock);
>>
>> We're happy to apply the other stuff as well, but we don't mix cleanups
>> and bug fixes like that.
> 
> ok great, I'll separate and resubmit both. Thanks!
> 
>>
>> regards,
>> dan carpenter
> 
> 	Jakob
> 
> _______________________________________________
> greybus-dev mailing list -- greybus-dev@lists.linaro.org
> To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
