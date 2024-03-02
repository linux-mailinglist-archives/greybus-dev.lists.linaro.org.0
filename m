Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD7D86F0D4
	for <lists+greybus-dev@lfdr.de>; Sat,  2 Mar 2024 16:21:24 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 96ED943FFE
	for <lists+greybus-dev@lfdr.de>; Sat,  2 Mar 2024 15:21:23 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	by lists.linaro.org (Postfix) with ESMTPS id 6B2403F363
	for <greybus-dev@lists.linaro.org>; Sat,  2 Mar 2024 15:21:17 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=iNzjt1I5;
	spf=pass (lists.linaro.org: domain of rmfrfs@gmail.com designates 209.85.221.46 as permitted sender) smtp.mailfrom=rmfrfs@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-33dcd8dec88so1865891f8f.1
        for <greybus-dev@lists.linaro.org>; Sat, 02 Mar 2024 07:21:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709392876; x=1709997676; darn=lists.linaro.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=db2sXyhsfc6Q/OHUgG2VKAJ26jyQ5IGovOGiX2OSiYg=;
        b=iNzjt1I539Cl6OkTLA6HMfMjITEZCQ7EVSed/uhKwLhDBFW34e2uW/H7Gq0GRxdpcy
         JCF+XcE75gv4Is9Uora3m9Sh33GVwY0qsfDxxEo12E8EzcPm7/D+vSQDJvKYs74xO58o
         8CiD5kNfr/8Wpp1Q02unprc5vv8wbmJpmlCdtFtea/8t5wn2AJPeuhfoBZ1QXe0lVUCx
         3K4caWg0CXpgeNd70y1Bnf63ZWNA3R4J4XN/KNeSPJpGGHXlt1nbRSEBPtA8diUgJamO
         9Al0HtA+sVfqLAsJ2PEztEHu2EMnTzUO2SUz2lP7+xEVs1Krt37i1b5ZSNAFMVqe1MOB
         eoIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709392876; x=1709997676;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=db2sXyhsfc6Q/OHUgG2VKAJ26jyQ5IGovOGiX2OSiYg=;
        b=toic7GAS67iAlbz72N3/YLDrq2fxf7qB/LxxugsDTAc3jYBqqnus8/s9ga69iyflIi
         G4vbe4o+XKIL/GK9FAKMyAW1UCAevdJJf7FAR95rsl9NSA5eTL/73qqAm/fK5h3cWKDm
         8r9FGlN2aJLoz70+zd97jwMe/0k0H8+yJByQxfBKYnDw++r4vo1wX2gU2YURZ7hwKMyA
         QB/dNAb1ihHIY8QYn82gUphccYl9vk/YH/vQA7BfuwJnPh3PcwpGuAnpDZWpTh2irr8S
         dlLOeZY4BIBd/+zOjbrvTOzxsT4l3MsxlXB7UhvU9waTZDFUm907KWCyOgypitiKe5jK
         7cNw==
X-Gm-Message-State: AOJu0YxhK7OwH85a2ht4Y/OfimGnm7U3FAtnBvsTuIhp+J3nBwWzU9sP
	jTVZYcMAS6eHzVgrhE9iWwQivb3Nixwp9HUts8yOzVnUrB4jv5lq
X-Google-Smtp-Source: AGHT+IFje49m2+Sm61wx66C0eYJgt+5oKJABw7vtF/Ez8g0huflWYR1aEJCCJ9duKZaPb3dTeuUmeg==
X-Received: by 2002:a05:6000:222:b0:33a:ee4d:98c8 with SMTP id l2-20020a056000022200b0033aee4d98c8mr3692596wrz.61.1709392876171;
        Sat, 02 Mar 2024 07:21:16 -0800 (PST)
Received: from localhost (a109-49-32-45.cpe.netcabo.pt. [109.49.32.45])
        by smtp.gmail.com with ESMTPSA id h5-20020adf9cc5000000b0033dd9b050f9sm7441049wre.14.2024.03.02.07.21.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Mar 2024 07:21:15 -0800 (PST)
From: Rui Miguel Silva <rmfrfs@gmail.com>
To: Alex Elder <elder@ieee.org>, Dan Carpenter <dan.carpenter@linaro.org>,
 Mikhail Lobanov <m.lobanov@rosalinux.ru>
In-Reply-To: <36a4d208-9945-4a65-bdf1-d8309d779e63@ieee.org>
References: <20240301190425.120605-1-m.lobanov@rosalinux.ru>
 <7ef732ad-a50f-4cf5-8322-376f42eb051b@moroto.mountain>
 <36a4d208-9945-4a65-bdf1-d8309d779e63@ieee.org>
Date: Sat, 02 Mar 2024 15:21:15 +0000
Message-ID: <m3wmqklkwk.fsf@gmail.com>
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 6B2403F363
X-Spamd-Bar: --------
X-Spamd-Result: default: False [-8.00 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.221.46:from];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_COUNT_TWO(0.00)[2];
	MID_RHS_MATCH_FROM(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+]
Message-ID-Hash: OBAQIKLDJA43227GHF7YUD6B6OMK25H7
X-Message-ID-Hash: OBAQIKLDJA43227GHF7YUD6B6OMK25H7
X-MailFrom: rmfrfs@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] greybus: Fix deref of NULL in __gb_lights_flash_brightness_set
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/OBAQIKLDJA43227GHF7YUD6B6OMK25H7/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Alex Elder <elder@ieee.org> writes:
Hey Alex,

> On 3/2/24 3:59 AM, Dan Carpenter wrote:
>> On Fri, Mar 01, 2024 at 02:04:24PM -0500, Mikhail Lobanov wrote:
>>> Dereference of null pointer in the __gb_lights_flash_brightness_set function.
>>> Assigning the channel the result of executing the get_channel_from_mode function
>>> without checking for NULL may result in an error.
>> 
>> get_channel_from_mode() can only return NULL when light->channels_count
>> is zero.
>> 
>> Although get_channel_from_mode() seems buggy to me.  If it can't
>> find the correct mode, it just returns the last channel.  So potentially
>> it should be made to return NULL.
>
> I agree with you.  This looks quite wrong to me, and I
> like your fix, *except* there is also no need to check
> whether the channel pointer is null inside the loop.
> It's the address of an object, and will always be non-null.
>
>      static struct gb_channel *
>      get_channel_from_mode(struct gb_light *light, u32 mode)
>      {
>          struct gb_channel *channel;
>          u32 i;
>
>          for (i = 0; i < light->channels_count; i++) {
>              channel = &light->channels[i];
>              if (channel->mode == mode)
>                  return channel;
>          }
>          return NULL;
>      }
>
>
> Rui, could you please confirm what Dan says (and his
> proposed change) was your intention?

Yup, Dan is right.

>
> If so (and assuming you also fix the check for a null
> channel pointer inside the loop):

And you also here.
>
> Reviewed-by: Alex Elder <elder@linaro.org>

Thanks.

Cheers,
   Rui
>
> 					-Alex
>
>> 
>> diff --git a/drivers/staging/greybus/light.c b/drivers/staging/greybus/light.c
>> index d62f97249aca..acd435f5d25d 100644
>> --- a/drivers/staging/greybus/light.c
>> +++ b/drivers/staging/greybus/light.c
>> @@ -95,15 +95,15 @@ static struct led_classdev *get_channel_cdev(struct gb_channel *channel)
>>   static struct gb_channel *get_channel_from_mode(struct gb_light *light,
>>   						u32 mode)
>>   {
>> -	struct gb_channel *channel = NULL;
>> +	struct gb_channel *channel;
>>   	int i;
>>   
>>   	for (i = 0; i < light->channels_count; i++) {
>>   		channel = &light->channels[i];
>>   		if (channel && channel->mode == mode)
>> -			break;
>> +			return channel;
>>   	}
>> -	return channel;
>> +	return NULL;
>>   }
>>   
>>   static int __gb_lights_flash_intensity_set(struct gb_channel *channel,
>> _______________________________________________
>> greybus-dev mailing list -- greybus-dev@lists.linaro.org
>> To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
