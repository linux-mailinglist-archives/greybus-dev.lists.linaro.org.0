Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB7658AB2C
	for <lists+greybus-dev@lfdr.de>; Fri,  5 Aug 2022 14:58:45 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id B83A73F481
	for <lists+greybus-dev@lfdr.de>; Fri,  5 Aug 2022 12:58:44 +0000 (UTC)
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
	by lists.linaro.org (Postfix) with ESMTPS id CE8423ED93
	for <greybus-dev@lists.linaro.org>; Fri,  5 Aug 2022 12:58:42 +0000 (UTC)
Received: by mail-io1-f48.google.com with SMTP id o2so1827528iof.8
        for <greybus-dev@lists.linaro.org>; Fri, 05 Aug 2022 05:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=Mxa9Bp3rNbGzk40iisjMrutXZ3GCm5zp+e0lvh8w/ws=;
        b=onGGkPH9lffZbdwCQ0RS75hF+TOALaPTvE/7Bz4CKWiDU5Z3jefh5KiCmSKi7DyXuU
         d+CNRYYlcq98LmQuwqW0wnnHmvHicJ+ioc8ixORiGeC+SG8jKds+KTfuEh0lQP8phzxo
         9EvzpqwIPH8vhPmaRx8PMMbRapgxO7A/D3sXeITk9MG2GdVv+diZwWpYiSk21XzByLcp
         llfm1fSFjwfpYzZ96cLtIfNm40rfQH1DnFdOE28j5cDbTsbR+BZY5XqASYnHlzAr3doU
         fwsUiwnXIoWLZFvsLCF7yeYf3aVdONSb6V7oMEvdj+Tw4XDEy7Erm4cY2Wby/gjrTNbN
         Suhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=Mxa9Bp3rNbGzk40iisjMrutXZ3GCm5zp+e0lvh8w/ws=;
        b=nVNXicg0mooBfXyr7pU2FECJoM0zeXwkn8T7r4TI4GPoy/ZEKVJzEqmcLDET16WbEx
         lgLeGU+G8I7Pw2lzvv79m6YJbepdU7MxWSZlsp5SvqogM6wgtLMxr3ZIJi9DwHhhHHLx
         XP8cGuzafnntSixFWlQT5quLU3aD+ZWrEAoBfHjmBo+SZbDQ5XdRSfiaH1VxCp6bNut6
         Xg4EffztJlmVz52Rfos3CPKFEda3A9zdYHNyHlYnTxnkNgkBt2gPHgl1GJUX6/N02G50
         X6OBrdPAyNPVpzMGoLTUJYOsMqBSxRenxj6h6JVcRvzyuZWHRrDvWBFhCPUUmB57SVXC
         NpIg==
X-Gm-Message-State: ACgBeo3ZaL9aZwHivVwxVgmV0qfjo9PhnBRMKj6vCVshnZQsXEsRSfJH
	awb3A+X10c6s4CoLNOnk1rOdY1lj
X-Google-Smtp-Source: AA6agR7CbGIhobo6yaqpnB+Gqd92RhKcRGHAx4m0mUzKKQ8CGUOaDA+PfH+Lf7NmiandPpnJDQVEpQ==
X-Received: by 2002:a5e:8811:0:b0:682:8a6a:cf40 with SMTP id l17-20020a5e8811000000b006828a6acf40mr2726024ioj.136.1659704322209;
        Fri, 05 Aug 2022 05:58:42 -0700 (PDT)
Received: from [172.22.22.26] (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.googlemail.com with ESMTPSA id g9-20020a05660226c900b0067b75781af9sm1868946ioo.37.2022.08.05.05.58.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Aug 2022 05:58:41 -0700 (PDT)
Message-ID: <f523f2af-d9e9-34f8-c230-5cfa725e352b@linaro.org>
Date: Fri, 5 Aug 2022 07:58:40 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Greg KH <gregkh@linuxfoundation.org>
References: <20220803062258.1650792-1-ye.xingchen@zte.com.cn>
 <YuoWCSQCnNU3DrUL@kroah.com>
 <81d363ba-82ef-d556-2d77-083e3b2d9d02@linaro.org>
 <YupqXVa+RYm4Ul+m@kroah.com>
From: Alex Elder <elder@linaro.org>
In-Reply-To: <YupqXVa+RYm4Ul+m@kroah.com>
Message-ID-Hash: MK5HO2UEXUBFIDCJVE7LZL3X2NWBY5VF
X-Message-ID-Hash: MK5HO2UEXUBFIDCJVE7LZL3X2NWBY5VF
X-MailFrom: elder@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: cgel.zte@gmail.com, linux-kernel@vger.kernel.org, greybus-dev@lists.linaro.org, ye xingchen <ye.xingchen@zte.com.cn>, Zeal Robot <zealci@zte.com.cn>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH linux-next] staging: greybus:using the
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/MK5HO2UEXUBFIDCJVE7LZL3X2NWBY5VF/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit

On 8/3/22 7:30 AM, Greg KH wrote:
> On Wed, Aug 03, 2022 at 07:00:21AM -0500, Alex Elder wrote:
>> On 8/3/22 1:30 AM, Greg KH wrote:
>>> On Wed, Aug 03, 2022 at 06:22:58AM +0000, cgel.zte@gmail.com wrote:
>>>> From: ye xingchen <ye.xingchen@zte.com.cn>
>>>>
>>>> Using pm_runtime_resume_and_get() to instade of  pm_runtime_get_sync
>>>> and pm_runtime_put_noidle.
>>>>
>>>> Reported-by: Zeal Robot <zealci@zte.com.cn>
>>>> Signed-off-by:  <ye.xingchen@zte.com.cn>
>>>> ---
>>>>    drivers/greybus/core.c | 3 +--
>>>>    1 file changed, 1 insertion(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/greybus/core.c b/drivers/greybus/core.c
>>>> index e546c6431877..b9063e86534b 100644
>>>> --- a/drivers/greybus/core.c
>>>> +++ b/drivers/greybus/core.c
>>>> @@ -174,9 +174,8 @@ static int greybus_probe(struct device *dev)
>>>>    	if (!id)
>>>>    		return -ENODEV;
>>>> -	retval = pm_runtime_get_sync(&bundle->intf->dev);
>>>> +	retval = pm_runtime_resume_and_get(&bundle->intf->dev);
>>>>    	if (retval < 0) {
>>>> -		pm_runtime_put_noidle(&bundle->intf->dev);
>>>>    		return retval;
>>>>    	}
>>>> -- 
>>>> 2.25.1
>>>
>>> Now this is just being silly.  Consider all future emails also dropped.
>>
>>
>> No Greg, please don't do this, or please undo this.
>>
>> This happened because the original poster was not a subscriber to the
>> greybus-dev mailing list.  Such messages get held until someone (me)
>> releases them after picking them out from the mostly spam that is
>> caught and held.  I have been trying to do that daily lately but
>> it's still not enough to avoid this happening.
>>
>> You were on the original addressee list.  So you got the message
>> immediately.  But the mailing list filter held it and sent it
>> again when I released it yesterday.  This is why you saw it the
>> second time.
>>
>> Ye Xingchen had nothing to do with your receiving the message twice.
> 
> Ah, ok.  But they did send a number of patches like this while after I
> had sent my first request to not do patches in this format anymore,
> which is what caused my response here.

I might have been mistaken.  The message was sent on two consecutive
days.  But the second might have been sent because the first got
held up in the queue until I released.

Anyway, Ye Xingchen, you should know not to re-send this patch until
you have at least reviewed Documentation/process/researcher-guidelines.rst,
as Greg suggested.

In fact, you should *not* re-post this patch at all.  Someone else
from your organization posted exactly the same thing in April and it
was rejected.

https://lore.kernel.org/all/Yl+948unOoDFdLe2@hovoldconsulting.com/

I would say your Zeal Robot needs to be taught that sometimes there
are exceptions to the "rules" it is trying to enforce.

					-Alex

> 
> thanks,
> 
> greg k-h
> _______________________________________________
> greybus-dev mailing list -- greybus-dev@lists.linaro.org
> To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
