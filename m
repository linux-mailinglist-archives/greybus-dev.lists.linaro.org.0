Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E77E6D43A2
	for <lists+greybus-dev@lfdr.de>; Mon,  3 Apr 2023 13:37:23 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 74A313EA1C
	for <lists+greybus-dev@lfdr.de>; Mon,  3 Apr 2023 11:37:22 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	by lists.linaro.org (Postfix) with ESMTPS id 2D6723ED3E
	for <greybus-dev@lists.linaro.org>; Sun,  2 Apr 2023 18:22:38 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20210112 header.b=SnqroAys;
	spf=pass (lists.linaro.org: domain of angelalbertoc.r@gmail.com designates 209.85.128.47 as permitted sender) smtp.mailfrom=angelalbertoc.r@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id l10-20020a05600c1d0a00b003f04bd3691eso1902075wms.5
        for <greybus-dev@lists.linaro.org>; Sun, 02 Apr 2023 11:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680459757;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qQ7cV2QrQ0t06/mixdh3yXEE4i1+hMwYh5eUdnobqIY=;
        b=SnqroAysuuy6fCAhOqM/pte7g0pC57vqLd9iMHOo+QmBJPZP+vSIO8n/7zpnrpkiHd
         Xx5EOZpzD4o2kYL+pIIT5o6KqSjrqpjI0cOMy+8mvnnU3/CgdwPGOdcmlD5tfrROu73U
         V9y/A7xxeWl+uB35So+Sbnqc93imltGIIhhZ1/tyWDsXyT96fBVVcw+xsA/lmA8K9kG0
         l8Y4K0sgbF/AyAc/+1DmdxLVWLjw8PeBOB+6rTdWr3z9EiWv9Vs7jdnksFXVhya71sPJ
         htPabrudLs0S4DJDFgLK3DD/0yAred5HK+QbbszXlGlrqOyNDtDASOpnrvxSO2Vm/3DB
         gDOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680459757;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qQ7cV2QrQ0t06/mixdh3yXEE4i1+hMwYh5eUdnobqIY=;
        b=kj+PiF6E0tk6EqABjLj5W8z3iKQqblcgXAwTWD7FspGc4zOcMutRmuXc1yo+CCYpLx
         hMDNJnQeOPxk5I5+NxkUCEp8HMzegXQG+upBGkpy2eaQlw0cEd+C0P3LybJv79HHkWH8
         mDJ/Iqf/tVoZayGVQ8M90hdFmOUdUvcNJBVbgaja1L/DjWp8yOYwUObvrlM1wPXEd/on
         9xQpKEj7i10oOrytrhJ2IUE3Npzf3goFykZdhq09pZeIQ/KS9GD3YZba0ola3r75ipxr
         q3LUR7wOlZifbz1HGjyNRtDa9yrcxFJAYRConQ2EvbsP6mfPhKFwUWJX1laW/AMLA0VS
         Q6yw==
X-Gm-Message-State: AO0yUKVnPf5sOGjcCdE3FspWktNZgL1ZrxkB9bydpC/+M5Vd6Wl0e5ce
	TPRVdjS+45wyAH3Bh10b7MA=
X-Google-Smtp-Source: AK7set+XRX11PiiYSdo892GnW8rwV0ktJWvZ8PvO8hWxBuyWKFXwQRLG7CCMvUCZBO4lOuifVNtIVA==
X-Received: by 2002:a05:600c:2157:b0:3ed:cf2a:3fe8 with SMTP id v23-20020a05600c215700b003edcf2a3fe8mr26406192wml.8.1680459756820;
        Sun, 02 Apr 2023 11:22:36 -0700 (PDT)
Received: from ?IPV6:2a0c:5a82:e704:7800:4aa3:3ca0:c843:43e3? ([2a0c:5a82:e704:7800:4aa3:3ca0:c843:43e3])
        by smtp.gmail.com with ESMTPSA id m9-20020a7bcb89000000b003ed4f6c6234sm9743571wmi.23.2023.04.02.11.22.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Apr 2023 11:22:36 -0700 (PDT)
Message-ID: <0af15115-9641-a1c8-f398-c4e8e77379a3@gmail.com>
Date: Sun, 2 Apr 2023 20:22:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Content-Language: en-US
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20230402122550.70682-1-angelalbertoc.r@gmail.com>
 <2023040252-racoon-daintily-3589@gregkh>
From: =?UTF-8?Q?=c3=81ngel_Alberto_Carretero?= <angelalbertoc.r@gmail.com>
In-Reply-To: <2023040252-racoon-daintily-3589@gregkh>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 2D6723ED3E
X-Spamd-Bar: --------
X-Spamd-Result: default: False [-8.00 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20210112];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.128.47:from];
	MID_RHS_MATCH_FROM(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RCVD_COUNT_TWO(0.00)[2]
X-MailFrom: angelalbertoc.r@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: XRE6XYFZNXZQ3RLS3JIDEIUULXGZ6I72
X-Message-ID-Hash: XRE6XYFZNXZQ3RLS3JIDEIUULXGZ6I72
X-Mailman-Approved-At: Mon, 03 Apr 2023 11:36:42 +0000
CC: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: loopback: fix up checkpath macro do while error.
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/XRE6XYFZNXZQ3RLS3JIDEIUULXGZ6I72/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit



On 02/04/2023 15:16, Greg Kroah-Hartman wrote:
> On Sun, Apr 02, 2023 at 02:25:51PM +0200, Angel Alberto Carretero wrote:
>> Wrap macro in a do-while statement.
>>
>> Signed-off-by: Angel Alberto Carretero <angelalbertoc.r@gmail.com>
>> ---
>>   drivers/staging/greybus/loopback.c | 8 +++++---
>>   1 file changed, 5 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/staging/greybus/loopback.c b/drivers/staging/greybus/loopback.c
>> index d7b39f3bb652..371809770ed0 100644
>> --- a/drivers/staging/greybus/loopback.c
>> +++ b/drivers/staging/greybus/loopback.c
>> @@ -162,9 +162,11 @@ static ssize_t name##_avg_show(struct device *dev,		\
>>   static DEVICE_ATTR_RO(name##_avg)
>>   
>>   #define gb_loopback_stats_attrs(field)				\
>> -	gb_loopback_ro_stats_attr(field, min, u);		\
>> -	gb_loopback_ro_stats_attr(field, max, u);		\
>> -	gb_loopback_ro_avg_attr(field)
>> +	do {		\
>> +		gb_loopback_ro_stats_attr(field, min, u);		\
>> +		gb_loopback_ro_stats_attr(field, max, u);		\
>> +		gb_loopback_ro_avg_attr(field);		\
>> +	} while (0)
>>   
>>   #define gb_loopback_attr(field, type)					\
>>   static ssize_t field##_show(struct device *dev,				\
>> -- 
>> 2.40.0
>>
>>
> 
> Any specific reason why you did not test build your change before
> submitting it?
> 
> thanks,
> 
> greg k-h

Apologies, we can drop the patch. I was trying to find an error as part
of the eudyptula challenge and thought I was compiling the driver
correctly. Upon further examination, the macro cannot be written with a
do-while because it is defining functions.
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
