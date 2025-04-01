Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CBCAA782FA
	for <lists+greybus-dev@lfdr.de>; Tue,  1 Apr 2025 21:56:04 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id BC93B46009
	for <lists+greybus-dev@lfdr.de>; Tue,  1 Apr 2025 19:56:03 +0000 (UTC)
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
	by lists.linaro.org (Postfix) with ESMTPS id 91A2B44397
	for <greybus-dev@lists.linaro.org>; Tue,  1 Apr 2025 19:55:17 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=ieee.org header.s=google header.b=WGXAEt80;
	spf=pass (lists.linaro.org: domain of elder@ieee.org designates 209.85.166.43 as permitted sender) smtp.mailfrom=elder@ieee.org;
	dmarc=pass (policy=quarantine) header.from=ieee.org
Received: by mail-io1-f43.google.com with SMTP id ca18e2360f4ac-85e73f7ba09so486714939f.3
        for <greybus-dev@lists.linaro.org>; Tue, 01 Apr 2025 12:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1743537317; x=1744142117; darn=lists.linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=p5BGxV995iPbNsm0G9OmkNVQGbzPtq/umLW+mNxhnvk=;
        b=WGXAEt80EIY3gwT9mQKpF5gy7omFukNXw3NmjtfQr3QgIZQftFjdnML7UYTa1krvXX
         T9J01XhEN8JjYfum2yctzDC+OBXTGxg404xNPzkBuwdZh03lw92eam2Px5srqF3I2ZQL
         Tv3Qh0phrerUv0T0B3rSDt6pPv5tXIcJ862BU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743537317; x=1744142117;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p5BGxV995iPbNsm0G9OmkNVQGbzPtq/umLW+mNxhnvk=;
        b=i4Wt0pCnVYeT82Bd0HLH1BRaNHSFiSOI5Rz8K2+HQ+BS0KLr73+B/cCqsGFEBX+iHJ
         6k/cyKmHcbLraMpbXEZDWQzQynCjDL9XiNK8htZ/twfxV1ww+Fw8dh7CkGsvunAPBgrr
         WlsXzlraLrZA7CzyOdt/RzK3keQAyGH13d+FppWlMtaaDSrWnoC9XwIjPxxMwZ6nWZZB
         l8TmqF+XLw1JhXqNv/ra4h+RLy5r/pL1OCnZ2opEs4NtKD12MuxJTcNhN/9muJdTD01d
         psU4TNWf1Mec+OIK0GMF655Qbano70CdXUV8eota/LXhpy/UaHqCOd41Z0bXqkNqPqkk
         dV6A==
X-Forwarded-Encrypted: i=1; AJvYcCVqH4WUyiIz6yOUZIwdMw2u5NvVELvYrU0OJz09yLIa2xvhUwMU2KIv0K+2kLLjhP3cuk3u/5Ddl2MUBg==@lists.linaro.org
X-Gm-Message-State: AOJu0Yyh2TCerhzlUR/UgHJnF8bF16FoiG+EvSLFM92huMk2knnnPUrg
	zX8Dwb4Cv8tmznpDEpa5n6/IGbtXq4hL0E4xBSiF+icfZ8eIXCnkCdOIvUPjqQ==
X-Gm-Gg: ASbGnctKEELA0L0vHnLCnXrPqmz0TzNpT6dGLjX4JITFhSe56WPPP5Y7qg9usACG6NF
	xFN/2j3+gFQLGuhBgMkALrJy2zFhU93M8tp8qYWFQU7QAKvG+QZUWqc/7a8yj8U7U8aqJ6eF2ml
	nHNHvRpQ/ZjaXzji1yxfiVLGQD0fe5hHOYpt7Pl3tjKzi/nE38wrPWgC0lHVpE3UBCMWISPzn2z
	SxIWsvQPsdj2U2Vqchf4LPx0kuZDlZGR5/j3d4pcIwBKY1bJFYki4hkVcl+Fu0tXgIIVbgHwLXH
	UB+wj3wT5bz4W3k2ki5XuvoRYXkiCOLq9QhLfJs9i0WwB6ndzqjxwhGw29TauxCDxhnzG8ZIiOa
	rdU0=
X-Google-Smtp-Source: AGHT+IE8Yzt70TZYcNhHaKZmfudRm9bqr4DZF9FrsdiV0SgnjyY2AA4L/NqUonhTzt1HtCqJmAo8IA==
X-Received: by 2002:a05:6e02:378f:b0:3d5:eb10:1c3b with SMTP id e9e14a558f8ab-3d6ca5b4575mr55992685ab.5.1743537317009;
        Tue, 01 Apr 2025 12:55:17 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.googlemail.com with ESMTPSA id 8926c6da1cb9f-4f46487159dsm2569433173.97.2025.04.01.12.55.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Apr 2025 12:55:15 -0700 (PDT)
Message-ID: <bd773190-1cdd-4faf-be39-ea042d6e8124@ieee.org>
Date: Tue, 1 Apr 2025 14:55:14 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thorsten Blum <thorsten.blum@linux.dev>
References: <20250331183935.1880097-2-thorsten.blum@linux.dev>
 <8a68ab78-cf18-4937-a8b7-fb0fa41c9d53@ieee.org>
 <9288204E-F6B7-4C9D-AADB-511A845A2624@linux.dev>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <9288204E-F6B7-4C9D-AADB-511A845A2624@linux.dev>
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 91A2B44397
X-Spamd-Bar: -------
X-Spamd-Result: default: False [-8.00 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[99.99%];
	DMARC_POLICY_ALLOW(-0.50)[ieee.org,quarantine];
	R_DKIM_ALLOW(-0.20)[ieee.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	MIME_GOOD(-0.10)[text/plain];
	RBL_SENDERSCORE_REPUT_8(0.00)[209.85.166.43:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.166.43:from];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[ieee.org:+]
X-Rspamd-Action: no action
X-MailFrom: elder@ieee.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: H3YDCNNW62POYXLZMLUFKSVUIA3N6ZFF
X-Message-ID-Hash: H3YDCNNW62POYXLZMLUFKSVUIA3N6ZFF
X-Mailman-Approved-At: Tue, 01 Apr 2025 19:56:00 +0000
CC: Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: Remove unnecessary NUL-termination checks
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/H3YDCNNW62POYXLZMLUFKSVUIA3N6ZFF/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit

On 4/1/25 2:51 PM, Thorsten Blum wrote:
> On 1. Apr 2025, at 01:31, Alex Elder wrote:
>> On 3/31/25 1:39 PM, Thorsten Blum wrote:
>>> @@ -125,16 +125,6 @@ static int fw_mgmt_interface_fw_version_operation(struct fw_mgmt *fw_mgmt,
>>>     	strscpy_pad(fw_info->firmware_tag, response.firmware_tag);
>>>   -	/*
>>> -	 * The firmware-tag should be NULL terminated, otherwise throw error but
>>> -	 * don't fail.
>>> -	 */
>>> -	if (fw_info->firmware_tag[GB_FIRMWARE_TAG_MAX_SIZE - 1] != '\0') {
>>> -		dev_err(fw_mgmt->parent,
>>> -			"fw-version: firmware-tag is not NULL terminated\n");
>>> -		fw_info->firmware_tag[GB_FIRMWARE_TAG_MAX_SIZE - 1] = '\0';
>>> -	}
>>
>> Interesting this didn't return an error, while others below did.
> 
> Should I keep it that way when checking for a truncated firmware tag or
> should this also fail like the others?
> 
> Thanks,
> Thorsten
> 
I don't know the answer right now, and I don't have time at
the moment to investigate.  Just keep that logic the way it
is, and make your other fix.

					-Alex
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
