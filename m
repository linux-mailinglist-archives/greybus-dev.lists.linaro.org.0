Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FC88A904D8
	for <lists+greybus-dev@lfdr.de>; Wed, 16 Apr 2025 15:51:12 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 7B02144B31
	for <lists+greybus-dev@lfdr.de>; Wed, 16 Apr 2025 13:51:11 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	by lists.linaro.org (Postfix) with ESMTPS id 2800943D10
	for <greybus-dev@lists.linaro.org>; Wed, 16 Apr 2025 13:51:08 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=beagleboard-org.20230601.gappssmtp.com header.s=20230601 header.b=utwdZNaU;
	spf=neutral (lists.linaro.org: 209.85.214.181 is neither permitted nor denied by domain of ayush@beagleboard.org) smtp.mailfrom=ayush@beagleboard.org;
	dmarc=fail reason="No valid SPF, DKIM not aligned (relaxed)" header.from=beagleboard.org (policy=none)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-22423adf751so63225265ad.2
        for <greybus-dev@lists.linaro.org>; Wed, 16 Apr 2025 06:51:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20230601.gappssmtp.com; s=20230601; t=1744811467; x=1745416267; darn=lists.linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dlv/qOg8JejlAO0c4FSuHmbsXKhE7BmnkIp5SOPS//s=;
        b=utwdZNaUcZ/oXgd91/61UWzOhVQ3rB0nWZxWxyswQ0WuJpUHsx/1XC1WsSrGo9/Kg0
         umpdKpiqhekjZz75vEBZMqpL854OglOHvsmphWd9iC6fBFmbDeTkuBjoHDLEWxm3rOiL
         DfDbIJE5gDD8z4vRKruMjzNJK/FuS485df/FsLX0Ir/SnaWqZjYIOdX1zuojvwigOe/k
         oCcCIm6vwwJ8x83LB2bUYV/RfWrCnAZSgz6m9AM7hVgLQxE2g/3u4vbV8a34ubTVZasp
         RleMaZn++iKyNfS4Va7q/hozVW4CIIlCOYafJWm1gmSUH94w4JL1GlY+A/nI2eT1IMx7
         Yf2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744811467; x=1745416267;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dlv/qOg8JejlAO0c4FSuHmbsXKhE7BmnkIp5SOPS//s=;
        b=TspezlKdhje7AkkurVHOrArx6SKHWqU79KQ3n7RLnG8l8wrZmZZk3KEm0LXh17L29N
         cuObA/u2wRUvakUuFQPiuoG3Eu73K7PS/UzNXNg9m0PkhtJbThLPvD65oOoJ8g2tvK64
         w7tYkQHwpsYqbCcCJEz2G0vjH57s8L8yRjH5T6yvqqpVWV5iTbuKiNopAiORGKmhJ3nx
         pZYSGmgSQqj0xR4qLp6RtrCjIKJNnt1YotYY/ZzswoYHinAQD+KC3XqfZ2LFuZkqizCZ
         YgSpAey3+6xkUbCzMhi7PAyO2lZ/lxH9/arXKLmrutVn4NXkzF2+j9J7YEQBwjLMPK3r
         g2QQ==
X-Gm-Message-State: AOJu0Yx/2Pm5dY1NDP+Mf9gKZifRI76+eR0AWSoLa417g1Z0GYauPQ/T
	5XnSpToPm+4mTMyEUkTmKEJc7DeFBaZoqWxKKZmbPWcPL5HmdRtOAHvwp/6vg7mGeR0orNOVWNv
	0vA==
X-Gm-Gg: ASbGncun9L31TUY/Mu1g9H3A1SQCXcaJ9pqH6g5+m47M5zM/hxWYQ3XO8FZoF2LYjqV
	bpfCsK5ztcxOWEArvmReS+kF9iZ3qeQ/qBLpGtuiLXtcVIkFBZ8sUmbKFzyam0qzLaPITvzExfi
	N1ZRoeqeiJTbQmmxFUZ3xvFMMuqqhaCxwrG1F/uWJpuFB/dctGMPIH3UQZ1O+QxKPTXb+5zDNoF
	O+QYBYYSNo+MBUJAoyeD0vkf+6nqJYe0g12SlDEDWkJjicTaH47i4q6OJvfgh3ZAp/fLCDMHXj7
	Q6PL38DeU9p17rMY7n81zLMcvDwSvjTzgy1OQ9vOJgHUlN9xCokZKhNRTA==
X-Google-Smtp-Source: AGHT+IGunPfiyVBTdHC64B2USKh4Nx/rEnbirfThO5tYNT95mYphg+shHVbZUzUTVFWHjefgUGc8UQ==
X-Received: by 2002:a17:903:2305:b0:224:de2:7fd0 with SMTP id d9443c01a7336-22c35909355mr33046425ad.25.1744811466770;
        Wed, 16 Apr 2025 06:51:06 -0700 (PDT)
Received: from [172.16.116.85] ([103.15.228.94])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c33fa5d77sm13814465ad.150.2025.04.16.06.51.05
        for <greybus-dev@lists.linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Apr 2025 06:51:06 -0700 (PDT)
Message-ID: <34567f13-5669-4fe9-9c3a-addfa7e0cb4b@beagleboard.org>
Date: Wed, 16 Apr 2025 19:21:04 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: greybus-dev@lists.linaro.org
References: <CAG+54DbvpWHyX8+ucEQpg2B6rNTJP11CRpYxcYVrKpKehzrK-A@mail.gmail.com>
 <490ab216-982e-4707-abe4-a5b8d0444458@gmail.com>
 <eec572fd-3074-8f2c-f978-94841edf7a6@inria.fr>
Content-Language: en-US
From: Ayush Singh <ayush@beagleboard.org>
In-Reply-To: <eec572fd-3074-8f2c-f978-94841edf7a6@inria.fr>
X-Rspamd-Queue-Id: 2800943D10
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.50 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	RBL_SENDERSCORE_REPUT_7(0.50)[209.85.214.181:from];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.214.181:from];
	BAD_REP_POLICIES(0.10)[];
	DMARC_POLICY_SOFTFAIL(0.10)[beagleboard.org : No valid SPF, DKIM not aligned (relaxed),none];
	FROM_HAS_DN(0.00)[];
	R_SPF_NEUTRAL(0.00)[?all];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	R_DKIM_ALLOW(0.00)[beagleboard-org.20230601.gappssmtp.com:s=20230601];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[beagleboard-org.20230601.gappssmtp.com:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: VPCF7ZOTYC2Y7LP3FSAFERUJGIUOKSYT
X-Message-ID-Hash: VPCF7ZOTYC2Y7LP3FSAFERUJGIUOKSYT
X-MailFrom: ayush@beagleboard.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [FIRST-PATCH] staging : greybus : gb-beagleplay.c : fixing the checks as first-patch
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/VPCF7ZOTYC2Y7LP3FSAFERUJGIUOKSYT/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit

On 4/16/25 19:15, Julia Lawall wrote:

>
> On Wed, 16 Apr 2025, Ayush Singh wrote:
>
>> On 4/16/25 17:47, rujra wrote:
>>
>>> added comments on spinlocks for producer-consumer model, rearranged the
>>> lines on function calls where it should not end with "(" this bracket,
>>> also removed white-spaces and aligned the arguments of function calls.
>> Are these manual adjustments, or using clang-format?
>>
>> I do not care about formatting being "readable". As long as it can be done by
>> a tool like clang-format, that's fine with me.
>>
>> Of course if you are fixing some checkpatch error, that is okay, but if now,
>> please avoid formatting changes.
>>
>> The comments are fine. Although you probably want to add a space between `//`
>> and the sentence start.
> I don't think the kernel commonly uses // for comments.
>
> julia

Ahh, right. `/* */` is for C comments. So that needs to be fixed as well.

>>
>>> Signed-off-by: Rujra Bhatt <braker.noob.kernel@gmail.com>
>>>
>>>> 8------------------------------------------------------8<
>>>    drivers/greybus/gb-beagleplay.c | 16 ++++++++--------
>>>    1 file changed, 8 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/drivers/greybus/gb-beagleplay.c
>>> b/drivers/greybus/gb-beagleplay.c
>>> index 473ac3f2d382..fa1c3a40dd0b 100644
>>> --- a/drivers/greybus/gb-beagleplay.c
>>> +++ b/drivers/greybus/gb-beagleplay.c
>>> @@ -73,7 +73,9 @@ struct gb_beagleplay {
>>>           struct gb_host_device *gb_hd;
>>>
>>>           struct work_struct tx_work;
>>> +       //used to ensure that only one producer can access the shared
>>> resource at a time.
>>>           spinlock_t tx_producer_lock;
>>> +       //used to ensure that only one consumer can access the shared
>>> resource at a time.
>>>           spinlock_t tx_consumer_lock;
>>>           struct circ_buf tx_circ_buf;
>>>           u16 tx_crc;
>>> @@ -642,8 +644,8 @@ static int cc1352_bootloader_wait_for_ack(struct
>>> gb_beagleplay *bg)
>>>    {
>>>           int ret;
>>>
>>> -       ret = wait_for_completion_timeout(
>>> -               &bg->fwl_ack_com,
>>> msecs_to_jiffies(CC1352_BOOTLOADER_TIMEOUT));
>>> +       ret = wait_for_completion_timeout(&bg->fwl_ack_com,
>>> +
>>> msecs_to_jiffies(CC1352_BOOTLOADER_TIMEOUT));
>>>           if (ret < 0)
>>>                   return dev_err_probe(&bg->sd->dev, ret,
>>>                                        "Failed to acquire ack semaphore");
>>> @@ -680,9 +682,8 @@ static int cc1352_bootloader_get_status(struct
>>> gb_beagleplay *bg)
>>>           if (ret < 0)
>>>                   return ret;
>>>
>>> -       ret = wait_for_completion_timeout(
>>> -               &bg->fwl_cmd_response_com,
>>> -               msecs_to_jiffies(CC1352_BOOTLOADER_TIMEOUT));
>>> +       ret = wait_for_completion_timeout(&bg->fwl_cmd_response_com,
>>> +
>>> msecs_to_jiffies(CC1352_BOOTLOADER_TIMEOUT));
>>>           if (ret < 0)
>>>                   return dev_err_probe(&bg->sd->dev, ret,
>>>                                        "Failed to acquire last status
>>> semaphore");
>>> @@ -765,9 +766,8 @@ static int cc1352_bootloader_crc32(struct
>>> gb_beagleplay *bg, u32 *crc32)
>>>           if (ret < 0)
>>>                   return ret;
>>>
>>> -       ret = wait_for_completion_timeout(
>>> -               &bg->fwl_cmd_response_com,
>>> -               msecs_to_jiffies(CC1352_BOOTLOADER_TIMEOUT));
>>> +       ret = wait_for_completion_timeout(&bg->fwl_cmd_response_com,
>>> +
>>> msecs_to_jiffies(CC1352_BOOTLOADER_TIMEOUT));
>>>           if (ret < 0)
>>>                   return dev_err_probe(&bg->sd->dev, ret,
>>>                                        "Failed to acquire last status
>>> semaphore");
>>> --
>>> 2.43.0
>>
>> Best Regards,
>>
>> Ayush Singh
>>
>>
>>

Best Regards,

Ayush Singh

> _______________________________________________
> greybus-dev mailing list -- greybus-dev@lists.linaro.org
> To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
