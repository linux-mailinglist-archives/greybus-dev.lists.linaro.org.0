Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC18588BAE
	for <lists+greybus-dev@lfdr.de>; Wed,  3 Aug 2022 14:00:27 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id BB40647F46
	for <lists+greybus-dev@lfdr.de>; Wed,  3 Aug 2022 12:00:26 +0000 (UTC)
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	by lists.linaro.org (Postfix) with ESMTPS id 41F1D3F482
	for <greybus-dev@lists.linaro.org>; Wed,  3 Aug 2022 12:00:24 +0000 (UTC)
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-10edfa2d57dso9780151fac.0
        for <greybus-dev@lists.linaro.org>; Wed, 03 Aug 2022 05:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=k85+BXyXynjZ9LSZSXWsf3MQl+dSKBggc5agia098P8=;
        b=nzSIftlCZzp3NnHVf+zVO4P2cvt7R0Vb/+9SeBIE7ot8a+Nn1akpwSxc0WDrMCtXJj
         JI5Wvvp+C4dq0ctrpVggyBfSTZZqK31vKg71HccE6605WiBxHVM90sRcfC70eZ3BX3tx
         +l0MbhSURmo/uGc5YeluJ0GfF7ZLnENFCj4b5CDk6HGCwFaIbvZchvnH8T2Uie1ofxi2
         /thywAWJTxoq2RFTyHHmKE64nNI1hQ1qHCsKlxrW7jZMK7SYi/HRKTz3Q0HL7EskMRdD
         UxGDPfOCsSx6BmDytaLpr2kpbuMHCKO1oxcGBvASzy2Sx/za5WF9eT9zGKEfClt7QINY
         M7kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=k85+BXyXynjZ9LSZSXWsf3MQl+dSKBggc5agia098P8=;
        b=65Hec1T9S169I2y5u1DuRS1/u98UwQG6UU18UzWwStg0wD44R0U5LzKjsH3g4QWE3h
         HE/JN32RjsO2Rdzv96XYD7kjkM2LE52m8H0L/B0lUPrYv5hnh/6jKNH9oJwSKpxAK0K1
         53C9q1dgqF61QGavDhUJdvSC1OlHVTNt9GetyZ6Hwwgo/ZAQ+c3M7DgjNAPmWzfyz24n
         rPgsqZi4uhAi/oNG+/X2mSntqhkTIGYzaZbfOEr4SvAk5XkMUEvKr1a0Z2h+VOYI2pd0
         gXxh8FkXh8muANKmQf4Eri9jRpfq1sr+Ne0GjfPoP82CyCY0DfvqRBPEq8SWu9RxKI0z
         qmWQ==
X-Gm-Message-State: ACgBeo3PmM7hVGeInVkupz7z63C46c349O0X6yZ4d/aP+RaGKdfMkHnI
	3vq9DaX9e4siIdSNwfoDJREjcE/S
X-Google-Smtp-Source: AA6agR4OJE3JEX4SdirNZxWAXw9IAgX/r+aRoG9wImJGaaaVzzAwEAFHvKjOXWZNXgjW9YZTnbEifA==
X-Received: by 2002:a05:6870:a1aa:b0:10d:a546:8aa3 with SMTP id a42-20020a056870a1aa00b0010da5468aa3mr1727370oaf.287.1659528023546;
        Wed, 03 Aug 2022 05:00:23 -0700 (PDT)
Received: from [172.22.22.4] (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.googlemail.com with ESMTPSA id g8-20020a9d6208000000b0061cbd18bd18sm4078207otj.45.2022.08.03.05.00.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Aug 2022 05:00:22 -0700 (PDT)
Message-ID: <81d363ba-82ef-d556-2d77-083e3b2d9d02@linaro.org>
Date: Wed, 3 Aug 2022 07:00:21 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Greg KH <gregkh@linuxfoundation.org>, cgel.zte@gmail.com
References: <20220803062258.1650792-1-ye.xingchen@zte.com.cn>
 <YuoWCSQCnNU3DrUL@kroah.com>
From: Alex Elder <elder@linaro.org>
In-Reply-To: <YuoWCSQCnNU3DrUL@kroah.com>
Message-ID-Hash: DPCNROUIPESTMQ7I5SKVVIX7EY2VGTOK
X-Message-ID-Hash: DPCNROUIPESTMQ7I5SKVVIX7EY2VGTOK
X-MailFrom: elder@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: linux-kernel@vger.kernel.org, greybus-dev@lists.linaro.org, ye xingchen <ye.xingchen@zte.com.cn>, Zeal Robot <zealci@zte.com.cn>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH linux-next] staging: greybus:using the
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/DPCNROUIPESTMQ7I5SKVVIX7EY2VGTOK/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit

On 8/3/22 1:30 AM, Greg KH wrote:
> On Wed, Aug 03, 2022 at 06:22:58AM +0000, cgel.zte@gmail.com wrote:
>> From: ye xingchen <ye.xingchen@zte.com.cn>
>>
>> Using pm_runtime_resume_and_get() to instade of  pm_runtime_get_sync
>> and pm_runtime_put_noidle.
>>
>> Reported-by: Zeal Robot <zealci@zte.com.cn>
>> Signed-off-by:  <ye.xingchen@zte.com.cn>
>> ---
>>   drivers/greybus/core.c | 3 +--
>>   1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/drivers/greybus/core.c b/drivers/greybus/core.c
>> index e546c6431877..b9063e86534b 100644
>> --- a/drivers/greybus/core.c
>> +++ b/drivers/greybus/core.c
>> @@ -174,9 +174,8 @@ static int greybus_probe(struct device *dev)
>>   	if (!id)
>>   		return -ENODEV;
>>   
>> -	retval = pm_runtime_get_sync(&bundle->intf->dev);
>> +	retval = pm_runtime_resume_and_get(&bundle->intf->dev);
>>   	if (retval < 0) {
>> -		pm_runtime_put_noidle(&bundle->intf->dev);
>>   		return retval;
>>   	}
>>   
>> -- 
>> 2.25.1
> 
> Now this is just being silly.  Consider all future emails also dropped.


No Greg, please don't do this, or please undo this.

This happened because the original poster was not a subscriber to the
greybus-dev mailing list.  Such messages get held until someone (me)
releases them after picking them out from the mostly spam that is
caught and held.  I have been trying to do that daily lately but
it's still not enough to avoid this happening.

You were on the original addressee list.  So you got the message
immediately.  But the mailing list filter held it and sent it
again when I released it yesterday.  This is why you saw it the
second time.

Ye Xingchen had nothing to do with your receiving the message twice.

					-Alex

> greg k-h
> _______________________________________________
> greybus-dev mailing list -- greybus-dev@lists.linaro.org
> To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
