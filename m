Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 08EE08597CB
	for <lists+greybus-dev@lfdr.de>; Sun, 18 Feb 2024 17:48:44 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id C91BF446D5
	for <lists+greybus-dev@lfdr.de>; Sun, 18 Feb 2024 16:48:42 +0000 (UTC)
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
	by lists.linaro.org (Postfix) with ESMTPS id 2FC193EFFE
	for <greybus-dev@lists.linaro.org>; Sun, 18 Feb 2024 16:48:36 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=ieee.org header.s=google header.b="NJ/E7B3q";
	spf=pass (lists.linaro.org: domain of elder@ieee.org designates 209.85.166.174 as permitted sender) smtp.mailfrom=elder@ieee.org;
	dmarc=pass (policy=quarantine) header.from=ieee.org
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-364f794f237so14941865ab.1
        for <greybus-dev@lists.linaro.org>; Sun, 18 Feb 2024 08:48:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1708274915; x=1708879715; darn=lists.linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=37nms9BmJJEsQJsbt0jcgUsWdlYRkTGGuwtAPDF2YJA=;
        b=NJ/E7B3qFofUHq9iK4ppdpw2YHS/5Sr3VTnS+ymChF0lh+RPrWaDL7WwFNy6ntGQu+
         q8xFHxmQNGJGNTA1JLmSfSThDdNB3Xphun5Kz2dDGhuQ8WcGsSwKrwH6OL5rSkOjjqvo
         nPk6vewNtP3rRC8FPWz802Czq7gc2/urw4cXI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708274915; x=1708879715;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=37nms9BmJJEsQJsbt0jcgUsWdlYRkTGGuwtAPDF2YJA=;
        b=VuKX1WzMzHmSmCt+7wGsBPRmVx6hhjPvjiyFE+hOubgiarTKxpLjqW2U3TxB+CQRGU
         ZesR/G2nQyHdldl3DdxhARYBkXIF31BFzzxUk8axQnK8vb3v1HclMoo5owG48sZic7GF
         E8Jy7Hp3dUy+77LKgdxhulz6v0YphGf4+SaxkmJS1JeIV+hnecOAXVGVG3vKDUA3yQmV
         c14fdySo9ld70rtrZOhFcA9iw3dtCgLrp3zOtWI51u0aX4M9R+HJB9Oreinx6h7VxgK6
         KMsS20QGedFBH2SOVRI7X2Dm7RMStcWUHUZDFCn4nTUCceAcjoNPZwVm6/BbQZYh4Ows
         k5XA==
X-Forwarded-Encrypted: i=1; AJvYcCXmbx5Fq/f+rAAwDTmWmpbYj/QRk+HLqXLWCzeO3T9vrDw6IEbUGBP6DdTkrcjLTjHJglc4wVetBenZOfUUS8Drf+cycKqBTG18VFkz
X-Gm-Message-State: AOJu0YzqVcGav3VWrDus+jIw84oBZcLGjLbBSD0dfex/FsGtKlIQF+p0
	ZZQTPiYy9p2jQGhvHv5qD22SXNOB7656pDRFxBnhcqI3MZRVu251aJfe8/uSSA==
X-Google-Smtp-Source: AGHT+IFcE6tBwMe7ot5+O/3t4TbbhIKrINl4J+8hLvJT/caqX8sqYCCWCefFmQzI3F/jhqPVS3tGLw==
X-Received: by 2002:a05:6e02:154c:b0:364:216e:d1dc with SMTP id j12-20020a056e02154c00b00364216ed1dcmr9851712ilu.22.1708274915594;
        Sun, 18 Feb 2024 08:48:35 -0800 (PST)
Received: from [172.22.22.28] (c-98-61-227-136.hsd1.mn.comcast.net. [98.61.227.136])
        by smtp.googlemail.com with ESMTPSA id hm11-20020a0566020f4b00b007c46318b9ccsm1107820iob.14.2024.02.18.08.48.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Feb 2024 08:48:35 -0800 (PST)
Message-ID: <0123aec7-f7ae-454d-9b4a-361e97756242@ieee.org>
Date: Sun, 18 Feb 2024 10:48:33 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Kees Cook <keescook@chromium.org>
References: <20240216232824.work.862-kees@kernel.org>
 <672fafca-547e-443e-8dd8-80ccd2320767@ieee.org>
 <202402171357.E671B5589@keescook>
From: Alex Elder <elder@ieee.org>
In-Reply-To: <202402171357.E671B5589@keescook>
X-Rspamd-Queue-Id: 2FC193EFFE
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
	MIME_TRACE(0.00)[0:+];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.166.174:from];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	ARC_NA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	DKIM_TRACE(0.00)[ieee.org:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: VMYIRYUTLWYIK73SEXYDK7PGNX26JAX2
X-Message-ID-Hash: VMYIRYUTLWYIK73SEXYDK7PGNX26JAX2
X-MailFrom: elder@ieee.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, "Gustavo A . R . Silva" <gustavo@embeddedor.com>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] greybus: Avoid fake flexible array for response data
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/VMYIRYUTLWYIK73SEXYDK7PGNX26JAX2/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit

On 2/17/24 3:58 PM, Kees Cook wrote:
> On Sat, Feb 17, 2024 at 02:17:33PM -0600, Alex Elder wrote:
>> On 2/16/24 5:28 PM, Kees Cook wrote:
>>> FORTIFY_SOURCE has been ignoring 0-sized destinations while the kernel
>>> code base has been converted to flexible arrays. In order to enforce
>>> the 0-sized destinations (e.g. with __counted_by), the remaining 0-sized
>>> destinations need to be handled. Instead of converting an empty struct
>>> into using a flexible array, just directly use a pointer without any
>>> additional indirection. Remove struct gb_bootrom_get_firmware_response
>>> and struct gb_fw_download_fetch_firmware_response.
>>
>> The only down side I see is that it sort of disrupts a pattern
>> used on Greybus request handlers (and the response structure definitions).
>>
>> I think a one-line comment in place of each of these two
>> definitions would be helpful, something like:
>> /* gb_fw_download_fetch_firmware_response contains no data */
> 
> Er, maybe this should be "no other data" ? Do you want a v2 of this
> patch?


Sending v2 is probably best, because I'd like to see these
comments.  Greg could fix it up himself but he probably wants
to pull it from the list

And yes, "no other data" is fine, or maybe "no payload"
or "has an empty payload".  Any of those is better than
nothing; you choose.

Thank you.

					-Alex

> 
>> And then add a similar comment above the calls to
>> gb_operation_response_alloc().
>>
>> Otherwise this looks good.
>>
>> Reviewed-by: Alex Elder <elder@linaro.org>
> 
> Thanks!
> 

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
