Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 9499E870899
	for <lists+greybus-dev@lfdr.de>; Mon,  4 Mar 2024 18:50:03 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id A29814410A
	for <lists+greybus-dev@lfdr.de>; Mon,  4 Mar 2024 17:50:02 +0000 (UTC)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	by lists.linaro.org (Postfix) with ESMTPS id 00368400E5
	for <greybus-dev@lists.linaro.org>; Mon,  4 Mar 2024 17:49:56 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=ieee.org header.s=google header.b=RFIqYRLj;
	spf=pass (lists.linaro.org: domain of elder@ieee.org designates 209.85.217.41 as permitted sender) smtp.mailfrom=elder@ieee.org;
	dmarc=pass (policy=quarantine) header.from=ieee.org
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-472d80cda16so69318137.0
        for <greybus-dev@lists.linaro.org>; Mon, 04 Mar 2024 09:49:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1709574595; x=1710179395; darn=lists.linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9Pd2ZqD9+Nj0j4ec7ryunKzk1xgCPWEAoRbwQKMaYuE=;
        b=RFIqYRLjLXDAEWpCaBn1r6YJU+KcckqoMnsXyiiyFoIo7RrUrAzOlGqVcUK5FN4Lyh
         MHvJH13Gov1ez1IXxgoes0Yvajt6IOEDZhu5j72mBc7uH3dHFHNI71q9HUmYsyX1wG5l
         H2E494U0v3L34cDf8YovP3VkFyN9EzxllnZWI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709574595; x=1710179395;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9Pd2ZqD9+Nj0j4ec7ryunKzk1xgCPWEAoRbwQKMaYuE=;
        b=hY1tRUuTk8xsTfJZLurghX9akGUrJC2BSP2q4kszgjgbHXHIAWzx7HR6AleWq2PlVo
         Z70glhXOczL4sUZJEuyj0BNJqfZVLqhNjAK/2k+cigeiO0iwFMExzV6rmPJvxACrSA8C
         ssZuZHcpNuYJCow696niFeJVbT3aXlONg7ami1Tme2jcql7avUTOEhvF8cmnmSbWeBZz
         D+sJ228WSkQ0wQZQgHoH0Ee7GyIJ//s13/y+ItUm3HPVh9RStiBefvnPGZ5KFRPWkZMt
         EKUYREFXZN1Fm6HV1/HZXy0VFAZ7AXiTrLurHrWleQnWqCTjeuBVHZbyIPMkIIyQTdNX
         P1zA==
X-Forwarded-Encrypted: i=1; AJvYcCV3PtTLtFk/hm/u/ujwsM08Jga64Cp0du5DDPaAdS3FXrk8Sg3o1WME/jT7UagUSZjjSS+UVBuo3CMDdGOrr7ifLztNs2BnofunD4Ah
X-Gm-Message-State: AOJu0Yy4IFkvkg650ZiGlKoHCV02U7jMwo6N2R8Yaf3voBKDVme7JlHU
	ZjD4cDQlvL4zL/MkSSCvI4g4pbs82nRnjXF3bvdfcqHrTa2ojzFtEls+49s+xA==
X-Google-Smtp-Source: AGHT+IFKl0IbUfafOj5m9zaSe/S5V0PjhekyC8gN8/+VSm+peqpjggkhFvHZLy6t34sJp++enhU9+Q==
X-Received: by 2002:a67:e34e:0:b0:472:6e92:dc9 with SMTP id s14-20020a67e34e000000b004726e920dc9mr6672607vsm.4.1709574595513;
        Mon, 04 Mar 2024 09:49:55 -0800 (PST)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.googlemail.com with ESMTPSA id kd3-20020a05622a268300b0042ef2740186sm1103686qtb.51.2024.03.04.09.49.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Mar 2024 09:49:55 -0800 (PST)
Message-ID: <1c77c0ef-c098-4962-909d-6bf53cdbde60@ieee.org>
Date: Mon, 4 Mar 2024 11:49:53 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Rui Miguel Silva <rmfrfs@gmail.com>,
 Dan Carpenter <dan.carpenter@linaro.org>
References: <379c0cb4-39e0-4293-8a18-c7b1298e5420@moroto.mountain>
 <m3sf16tky7.fsf@gmail.com>
From: Alex Elder <elder@ieee.org>
In-Reply-To: <m3sf16tky7.fsf@gmail.com>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 00368400E5
X-Spamd-Bar: -------
X-Spamd-Result: default: False [-7.99 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	DMARC_POLICY_ALLOW(-0.50)[ieee.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[ieee.org:s=google];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.217.41:from];
	MID_RHS_MATCH_FROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	FREEMAIL_TO(0.00)[gmail.com,linaro.org];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[ieee.org:+]
Message-ID-Hash: YCDFMLPWJI3VRRHTU3X6JJV3XKKQDKHV
X-Message-ID-Hash: YCDFMLPWJI3VRRHTU3X6JJV3XKKQDKHV
X-MailFrom: elder@ieee.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: fix get_channel_from_mode() failure path
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/YCDFMLPWJI3VRRHTU3X6JJV3XKKQDKHV/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit

On 3/4/24 3:17 AM, Rui Miguel Silva wrote:
> Hi Dan,
> once again thanks for the patch.
> 
> Dan Carpenter <dan.carpenter@linaro.org> writes:
> 
>> The get_channel_from_mode() function is supposed to return the channel
>> which matches the mode.  But it has a bug where if it doesn't find a
>> matching channel then it returns the last channel.  It should return
>> NULL instead.
>>
>> Also remove an unnecessary NULL check on "channel".
>>
>> Fixes: 2870b52bae4c ("greybus: lights: add lights implementation")
>> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> 
> Reviewed-by: Rui Miguel Silva <rmfrfs@gmail.com>

Looks good.

Reviewed-by: Alex Elder <elder@linaro.org>

> 
> Cheers,
>    Rui
> 
>> ---
>>   drivers/staging/greybus/light.c | 8 ++++----
>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/staging/greybus/light.c b/drivers/staging/greybus/light.c
>> index d62f97249aca..a5c2fe963866 100644
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
>> -		if (channel && channel->mode == mode)
>> -			break;
>> +		if (channel->mode == mode)
>> +			return channel;
>>   	}
>> -	return channel;
>> +	return NULL;
>>   }
>>   
>>   static int __gb_lights_flash_intensity_set(struct gb_channel *channel,
>> -- 
>> 2.43.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
