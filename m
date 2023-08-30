Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id C372178D5EC
	for <lists+greybus-dev@lfdr.de>; Wed, 30 Aug 2023 14:37:07 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id A8DD743F3E
	for <lists+greybus-dev@lfdr.de>; Wed, 30 Aug 2023 12:37:06 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	by lists.linaro.org (Postfix) with ESMTPS id 953183F5B4
	for <greybus-dev@lists.linaro.org>; Wed, 30 Aug 2023 12:36:59 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20221208 header.b=BvLBGbuf;
	spf=pass (lists.linaro.org: domain of ayushdevel1325@gmail.com designates 209.85.210.172 as permitted sender) smtp.mailfrom=ayushdevel1325@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-68a56401b9aso4023415b3a.1
        for <greybus-dev@lists.linaro.org>; Wed, 30 Aug 2023 05:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693399019; x=1694003819; darn=lists.linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MxkaocNYdP1OUNNC1g9L9ctJG6foZ0StSv6xHEmjkVQ=;
        b=BvLBGbuf5fM+sNBIn+ndD8WEnCpzYCD50TZoBUNZy5vSwYTBun1Sm3oqKeZX/YlAkF
         iCbIsTSrehVcUqom3165WxKN/VKdh/WuFdqAnSfn9f8KJL5EBTryoihhFH8uuuxR4hEx
         RwAnFXNl9eBh2u7cQXZji1rGHJcL8pXekVNSf99L9Y79LCXa793rGjvrTuZDyYGw8wbW
         C1BOH329FFREGeCjDJrEkc8rdtaZs/zRFZqXHKrwOldyycrc3k88AEYe23aEpUJ21T6+
         Vvytdkeun9ory+OHVng56eyoWSHEd6RUSAfAWqWja/jQ0g9eDn1DrffmhBkeJtpp3hS3
         gelg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693399019; x=1694003819;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MxkaocNYdP1OUNNC1g9L9ctJG6foZ0StSv6xHEmjkVQ=;
        b=Y+1ygW9Riah7Ilk2iCRwjuEhfVWaGHr5MnqGNsPT4tKDhjrwH4P3okHW8ozdr+r1gA
         4cATGcJiW/A16LF2dOmnJWPvM6ExSIXO4MbAuSBWlFAM+Wu3da5ZxoDMwT1hcDJoUzw9
         8JXJA3TLpdfSFFdD6N/E4Rx3A4nHrgeHBlxYU/zUZw/wMgQzuF97SQD0oOF/9EHjQmTf
         Rz0PO/7j+Yo/ckK+bfBr2H3wjCEKUZAVmQyEkEl5AfFqC8nvwCatUbpKwd4vNy5LTkYM
         HXKQbYgmljdcotGgn1s6EQcMKTKzqv4j9fhcr9oMN0zuugA0qgCMOUyuwHXYwhcuZvwZ
         Ow3Q==
X-Gm-Message-State: AOJu0YyLhuYS1x4Ivyf6xMaPLubD5VG7Sf7zpbLfaD9TKg3BC3nSsvu8
	N/zPpUpHkb+v1jpemLOUQZU78gu8LYTmfg==
X-Google-Smtp-Source: AGHT+IF1sC5a2MRtT4fsJvXVb7MXdrs/nvYNUoa44eLcZph9U/9CRozemL+dSJ2HP7YXnBh9EhzTtQ==
X-Received: by 2002:a05:6a00:24ca:b0:68b:e92b:3f8b with SMTP id d10-20020a056a0024ca00b0068be92b3f8bmr2087755pfv.2.1693399018611;
        Wed, 30 Aug 2023 05:36:58 -0700 (PDT)
Received: from [172.16.116.58] ([103.15.228.92])
        by smtp.gmail.com with ESMTPSA id fk22-20020a056a003a9600b006889511ab14sm10064530pfb.37.2023.08.30.05.36.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Aug 2023 05:36:58 -0700 (PDT)
Message-ID: <2069449a-506d-afe1-b259-dca34a85900c@gmail.com>
Date: Wed, 30 Aug 2023 18:06:54 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
To: Greg KH <gregkh@linuxfoundation.org>
References: <20230830122427.284415-1-ayushdevel1325@gmail.com>
 <20230830122427.284415-3-ayushdevel1325@gmail.com>
 <2023083005-trough-patchy-f60a@gregkh>
Content-Language: en-US
From: Ayush Singh <ayushdevel1325@gmail.com>
In-Reply-To: <2023083005-trough-patchy-f60a@gregkh>
X-Rspamd-Queue-Id: 953183F5B4
X-Spamd-Bar: -------------
X-Spamd-Result: default: False [-13.50 / 15.00];
	REPLY(-4.00)[];
	DWL_DNSWL_HI(-3.50)[gmail.com:dkim];
	BAYES_HAM(-3.00)[99.99%];
	RCVD_DKIM_ARC_DNSWL_HI(-1.00)[];
	RCVD_IN_DNSWL_HI(-1.00)[103.15.228.92:received,209.85.210.172:from];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20221208];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_TWO(0.00)[2];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.210.172:from];
	FREEMAIL_ENVFROM(0.00)[gmail.com]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: L63UNQTDNQBHY2T2DKAKVDBSZNW5DIAM
X-Message-ID-Hash: L63UNQTDNQBHY2T2DKAKVDBSZNW5DIAM
X-MailFrom: ayushdevel1325@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: greybus-dev@lists.linaro.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 2/2] staging/greybus: Add BeaglePlay Linux Driver
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/L63UNQTDNQBHY2T2DKAKVDBSZNW5DIAM/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit

On 8/30/23 17:58, Greg KH wrote:

> On Wed, Aug 30, 2023 at 05:54:27PM +0530, Ayush Singh wrote:
>> This is Serdev driver that communicates with Greybus SVC connected over
>> UART. This driver has only been tested on BeaglePlay (with CC1352 in
>> BeaglePlay serving as SVC).
>>
>> This driver is responsible for the following:
>> - Start SVC (CC1352) on driver load.
>> - Send/Receive Greybus messages to/from CC1352 using HDLC over UART.
>> - Print Logs from CC1352.
>> - Stop SVC (CC1352) on driver load.
>>
>> This patch does the following:
>> - Add Driver
>> - Add Kconfig option to enable the driver
>> - Update Makefile to build the driver
>> - Update MAINTAINERS
>>
>> Signed-off-by: Ayush Singh <ayushdevel1325@gmail.com>
>> ---
>>   MAINTAINERS                             |   5 +
>>   drivers/staging/greybus/Kconfig         |   9 +
>>   drivers/staging/greybus/Makefile        |   3 +
>>   drivers/staging/greybus/gb-beagleplay.c | 493 ++++++++++++++++++++++++
> Why is this in drivers/staging/ and not in drivers/greybus/ ?

Well, there are a few reasons I can give:

1. It has not been thoroughly tested. I have only tested it in my 
personal setup.

2. Since mikrobus code has not been merged, running a normal 
beagleconnect freedom as the greybus node is not possible.

3. I thought new and experimental drivers should go into staging?


Sorry for the checkpatch error. I added the BeagleBoard.org copyright 
after running checkpatch and forgot to run it again.

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
