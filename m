Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id A25BE88AF6F
	for <lists+greybus-dev@lfdr.de>; Mon, 25 Mar 2024 20:08:58 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id B438F43C33
	for <lists+greybus-dev@lfdr.de>; Mon, 25 Mar 2024 19:08:57 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	by lists.linaro.org (Postfix) with ESMTPS id D029743BAF
	for <greybus-dev@lists.linaro.org>; Mon, 25 Mar 2024 19:08:54 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linaro.org header.s=google header.b=BkNSZCTa;
	dmarc=pass (policy=none) header.from=linaro.org;
	spf=pass (lists.linaro.org: domain of rui.silva@linaro.org designates 209.85.221.50 as permitted sender) smtp.mailfrom=rui.silva@linaro.org
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3416df43cabso3294491f8f.3
        for <greybus-dev@lists.linaro.org>; Mon, 25 Mar 2024 12:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711393734; x=1711998534; darn=lists.linaro.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ivdettvGpltNPeISxFbK8+ZclvtCBGXuV4SmOUszKcE=;
        b=BkNSZCTaCvfeV0D8E/6cFmPgqyB5Ig05tJihxOG2F+drQ8kFlCe1sVrq7QsvRlmQCx
         ZOVAjm3U0ctVO9OA/Ot8mYM4RDCBpSp6i910BSJePZFKDO6NvDSAaFrYC+qwiyXUt4lU
         HWCerGQCL0Ms2meLuM3hU4Qj5S5AM5uhDBeh2aH0TfGgCBRGEcuX5m5VKSdVsfJKC3VF
         157D5+4e5SisAoPms4AbEE1RZoh92ELzztqKBx8QuijF9SAOl7YsU+mYXzLhhlRYOR/t
         Vuhvqc0wIaUursIYD8DjFBvd/WrFRXFJOb/waxZfSyUm+KGPSGbB/DK+sIIZ0rLi5QhS
         lkEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711393734; x=1711998534;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ivdettvGpltNPeISxFbK8+ZclvtCBGXuV4SmOUszKcE=;
        b=HAmKrjfEAyDrbmc6BWKAYKDzczGFJLqMD5NxADkc3cK7awAFeBPtccyrAQEzqx2G0W
         CMKVPYSYr8enJCRnNHURs/V5V7YQlEjezUCe4SazglWdyq3p0htq4dQDJDvCRfttuMAf
         yfPaYiDFzyoZ0e5YimaCqU45kjk59N/CMktFWMszhTM+g20KfDVPQeNTh2c50c4upB78
         aL8n4bbQNA9p0YTi8KxtiRBPIUR46D3SkULLQmB9hPtls1GjKsjHtoAaD7mSdfKz8Le3
         Cl5weWkdZ3YZGYBYGIh6bIF6u+8vfNYlX+QAHAKCp742Q9cqwpFdXRj/lVDOhuzTcbzo
         Siqg==
X-Gm-Message-State: AOJu0YzAO268yeJP1RnmV9xX386EyxN5EhBbKPZx+uSFMp3bfgKYALwk
	HNzx1l2ijhWoKBZBw7CEeeAfyt8bnqZqcRHmzyYUzGg0xmz59gQHGj61qF0L7LIaubFKjW8LbXV
	T5PQ=
X-Google-Smtp-Source: AGHT+IF5YpsNwEMr5DhVdk+y0oO8sPxx6leaiIIRqFMnBG4DybO/Yhkm/g4bGoUhp1EAdgyvtjTaJg==
X-Received: by 2002:a05:6000:1152:b0:33d:2775:1e63 with SMTP id d18-20020a056000115200b0033d27751e63mr5398930wrx.41.1711393733537;
        Mon, 25 Mar 2024 12:08:53 -0700 (PDT)
Received: from localhost (a109-49-32-45.cpe.netcabo.pt. [109.49.32.45])
        by smtp.gmail.com with ESMTPSA id h8-20020a05600004c800b0033b66c2d61esm10139182wri.48.2024.03.25.12.08.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 12:08:53 -0700 (PDT)
From: Rui Miguel Silva <rui.silva@linaro.org>
To: Alex Elder <elder@ieee.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
In-Reply-To: <14e1f476-7c3c-40ac-a48e-9af3e43a834d@ieee.org>
References: <20240307094838.688281-1-rmfrfs@gmail.com>
 <2024032543-village-reference-960d@gregkh>
 <9fa87c55-42e2-4449-936f-4835b267d22f@ieee.org>
 <2024032510-planner-caterer-3693@gregkh>
 <14e1f476-7c3c-40ac-a48e-9af3e43a834d@ieee.org>
Date: Mon, 25 Mar 2024 19:08:52 +0000
Message-ID: <m334sedt8b.fsf@gmail.com>
MIME-Version: 1.0
X-Rspamd-Queue-Id: D029743BAF
X-Spamd-Bar: --------
X-Spamd-Result: default: False [-8.00 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17:c];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.221.50:from];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	DKIM_TRACE(0.00)[linaro.org:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: IAR3JDNLMQY64JCYSF3GREJDTJ6PSFBO
X-Message-ID-Hash: IAR3JDNLMQY64JCYSF3GREJDTJ6PSFBO
X-MailFrom: rui.silva@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: greybus-dev@lists.linaro.org, Mikhail Lobanov <m.lobanov@rosalinux.ru>, linux-staging@lists.linux.dev
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] greybus: lights: check return of get_channel_from_mode
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/IAR3JDNLMQY64JCYSF3GREJDTJ6PSFBO/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hey Alex,

Alex Elder <elder@ieee.org> writes:

> On 3/25/24 1:50 PM, Greg Kroah-Hartman wrote:
>> On Mon, Mar 25, 2024 at 01:31:34PM -0500, Alex Elder wrote:
>>> On 3/25/24 12:25 PM, Greg Kroah-Hartman wrote:
>>>> On Thu, Mar 07, 2024 at 09:48:13AM +0000, Rui Miguel Silva wrote:
>>>>> If channel for the given node is not found we return null from
>>>>> get_channel_from_mode. Make sure we validate the return pointer
>>>>> before using it in two of the missing places.
>>>>>
>>>>> This was originally reported in [0]:
>>>>> Found by Linux Verification Center (linuxtesting.org) with SVACE.
>>>>>
>>>>> [0] https://lore.kernel.org/all/20240301190425.120605-1-m.lobanov@rosalinux.ru
>>>>>
>>>>> Fixes: 2870b52bae4c ("greybus: lights: add lights implementation")
>>>>> Reported-by: Mikhail Lobanov <m.lobanov@rosalinux.ru>
>>>>> Suggested-by: Mikhail Lobanov <m.lobanov@rosalinux.ru>
>>>>> Suggested-by: Alex Elder <elder@ieee.org>
>>>>> Signed-off-by: Rui Miguel Silva <rmfrfs@gmail.com>
>>>>> ---
>>>>>    drivers/staging/greybus/light.c | 6 +++++-
>>>>>    1 file changed, 5 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/drivers/staging/greybus/light.c b/drivers/staging/greybus/light.c
>>>>> index c6bd86a5335a..6f10b9e2c053 100644
>>>>> --- a/drivers/staging/greybus/light.c
>>>>> +++ b/drivers/staging/greybus/light.c
>>>>> @@ -147,6 +147,9 @@ static int __gb_lights_flash_brightness_set(struct gb_channel *channel)
>>>>>    		channel = get_channel_from_mode(channel->light,
>>>>>    						GB_CHANNEL_MODE_TORCH);
>>>>> +	if (!channel)
>>>>> +		return -EINVAL;
>>>>> +
>>>>>    	/* For not flash we need to convert brightness to intensity */
>>>>>    	intensity = channel->intensity_uA.min +
>>>>>    			(channel->intensity_uA.step * channel->led->brightness);
>>>>> @@ -549,7 +552,8 @@ static int gb_lights_light_v4l2_register(struct gb_light *light)
>>>>>    	}
>>>>>    	channel_flash = get_channel_from_mode(light, GB_CHANNEL_MODE_FLASH);
>>>>> -	WARN_ON(!channel_flash);
>>>>> +	if (WARN_ON(!channel_flash))
>>>>> +		return -EINVAL;
>>>>
>>>> We should NOT crash machines just because of this, the WARN_ON() should
>>>> be removed and just properly handle the error please.
>>>
>>> Greg, WARN_ON() doesn't normally crash the machine.  That said,
>>> it's reasonable to remove the WARN_ON().
>> 
>> The huge majority of running Linux systems in the world run with
>> panic-on-warn enabled, including the one in your pocket :(
>
> I did not know that.  Then WARN_ON() is no better than BUG_ON().
> I'm still learning.  Thank you.

I also lost track of all this failure cascade options that normally
take the all system down.

Thanks anyway for the comments,
Cheers,
    Rui
    
>
> 					-Alex
>
>>> I think the purpose of the warning is that this is a case that
>>> should "never happen," so if it does, it's making some noise.
>> 
>> Making noise by rebooting the box is not good.
>> 
>> thanks,
>> 
>> greg k-h
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
