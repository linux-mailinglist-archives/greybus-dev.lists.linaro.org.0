Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 75910868173
	for <lists+greybus-dev@lfdr.de>; Mon, 26 Feb 2024 20:50:12 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 6282943C91
	for <lists+greybus-dev@lfdr.de>; Mon, 26 Feb 2024 19:50:11 +0000 (UTC)
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	by lists.linaro.org (Postfix) with ESMTPS id 85DE33EFF3
	for <greybus-dev@lists.linaro.org>; Mon, 26 Feb 2024 19:50:06 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=ieee.org header.s=google header.b=Oh7OMKYZ;
	spf=pass (lists.linaro.org: domain of elder@ieee.org designates 209.85.160.54 as permitted sender) smtp.mailfrom=elder@ieee.org;
	dmarc=pass (policy=quarantine) header.from=ieee.org
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-21e6be74db4so1747072fac.2
        for <greybus-dev@lists.linaro.org>; Mon, 26 Feb 2024 11:50:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1708977006; x=1709581806; darn=lists.linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EAVCZoKYn3AEDXjkAwhVC7Z/hnkKJALO8ZdxGQStZT8=;
        b=Oh7OMKYZEzkr9/fpbxpiFb7g9/ylNUefPyUPlmxvCzvif0eBlnTlLcXJklieaEPMvz
         3irgIcpOr1OyT6lLgfKs2uA7uChAfLXMPG75WqC5ss7I/+gd0J1Yu4/0CA+t+93aosGh
         AHA3tLvBUufmDm/FUl3epTpVpXMq8WdL1/+U0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708977006; x=1709581806;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EAVCZoKYn3AEDXjkAwhVC7Z/hnkKJALO8ZdxGQStZT8=;
        b=a6N9hdoC9Nd3cw7AHtN8tB+6oJHAblk1KDY4lhz6EKJRXjQbf8ggbXB+30zNmTfM/o
         4SOY1PKrpUzmSDFkdE00QwYXbeUdMQ0H6IxFOng41SKAqO2A4ZhBj8dNL0LDb2I5t8iN
         FdgMOdv7tCV0EgeYcKHNrL+hqMu6apcLYDvqcJBiDoF/23HOSm0UQFrFFePtHxF3u+3+
         0FGjDW2zYkSET62x2KwUpGblEHviuTW6XU6ARRkhZh4P8X3s9n/Pzkvze1YHQFgKPapd
         moWeFI+R3HH+7QgTFTFwXvun92zLYdFDSP7DyvHVHZ9mxm4wppBnBQLBK2G6xEEHN4SW
         9AAA==
X-Forwarded-Encrypted: i=1; AJvYcCWljzXRRf98xpiWXCGr1AhgMLozAzI6d+wY4SP1jwT6EpsYGc6R57mHDmefuIYKKa1mfBAGXO4dx/Wv/4ZWiLa+wSKVi30mPEpb+x/Q
X-Gm-Message-State: AOJu0Yx6gIMEmBGHESrpSDL8mKd7r+mlonDV8B967Oup+/HQSyZr0D4i
	k1OLBoAeFZagmCYOMRromIOiiZJqk0wnGDeVFNZ/iKXgazVyh3AaU5Bgw/4Hgg==
X-Google-Smtp-Source: AGHT+IF3F3G9Gwycez7fdEEAWLKJ7t+MFJqzKyngrVMmkrFWin+O79T5sA1qaTzEz1Hi0+dRrv84NQ==
X-Received: by 2002:a05:6870:14ca:b0:21f:dc6e:e4dc with SMTP id l10-20020a05687014ca00b0021fdc6ee4dcmr6334366oab.5.1708977005991;
        Mon, 26 Feb 2024 11:50:05 -0800 (PST)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.googlemail.com with ESMTPSA id t10-20020a05620a034a00b00787e11574c5sm82378qkm.125.2024.02.26.11.50.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Feb 2024 11:50:05 -0800 (PST)
Message-ID: <17e89261-d46b-4845-9fca-05dac3006a39@ieee.org>
Date: Mon, 26 Feb 2024 13:50:04 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "Ricardo B. Marliere" <ricardo@marliere.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20240219-device_cleanup-greybus-v1-1-babb3f65e8cc@marliere.net>
 <cf5b2696-d7ca-40fc-856a-52f352cd270c@ieee.org>
 <ids3525jm5zkwkgizt2xtg3do37kqqtfdy5gc2cptdduexoe7r@cr4yxh3tykkh>
 <2024022553-deepness-sublevel-73de@gregkh>
 <yru2ywkyqwhg3rpyuqkkx73fxkkgsfj3vcbttnzrjq662ctrov@boh65bhxjjgo>
From: Alex Elder <elder@ieee.org>
In-Reply-To: <yru2ywkyqwhg3rpyuqkkx73fxkkgsfj3vcbttnzrjq662ctrov@boh65bhxjjgo>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 85DE33EFF3
X-Spamd-Bar: --------
X-Spamd-Result: default: False [-8.08 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-2.99)[99.96%];
	DMARC_POLICY_ALLOW(-0.50)[ieee.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[ieee.org:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.160.54:from];
	XM_UA_NO_VERSION(0.01)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[ieee.org:+]
Message-ID-Hash: WKCUN6ZUV4L6SZR33LIAA2ZEKGYOIN7D
X-Message-ID-Hash: WKCUN6ZUV4L6SZR33LIAA2ZEKGYOIN7D
X-MailFrom: elder@ieee.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] greybus: constify the struct device_type usage
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/WKCUN6ZUV4L6SZR33LIAA2ZEKGYOIN7D/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit

On 2/25/24 5:04 AM, Ricardo B. Marliere wrote:
>>>> On another subject:
>>>>
>>>> Johan might disagree, but I think it would be nice to make
>>>> the definitions of the Greybus device types as static (private)
>>>> and make the is_gb_host_device() etc. functions real functions
>>>> rather than static inlines in <linux/greybus.h>.
>>>>
>>>> It turns out that all of the is_gb_*() functions are called only
>>>> from drivers/greybus/core.c; they could all be moved there rather
>>>> than advertising them in <linux/greybus.h>.
>>> I guess it depends whether they would be used somewhere else in the
>>> future. Perhaps it was left there with that intention when it was first
>>> being developed? I agree, though. Will happily send a patch with this if
>>> desired.
>> Let's clean the code up for what we have today.  If it's needed in the
>> future, we can move the structures then.
> Sounds good to me, will send a v2 then!

I might be misinterpreting Greg's response; I *think* he
agrees with my suggestion.

In any case, please do *not* send v2 with the purpose of
including my suggestion.

If you send a v2, keep it focused on this original patch.
You can then implement the other suggestion as a follow-on
patch (or series).

					-Alex
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
