Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id B54CF8154D7
	for <lists+greybus-dev@lfdr.de>; Sat, 16 Dec 2023 01:09:41 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id BE74443C4D
	for <lists+greybus-dev@lfdr.de>; Sat, 16 Dec 2023 00:09:40 +0000 (UTC)
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	by lists.linaro.org (Postfix) with ESMTPS id 3CBED3F090
	for <greybus-dev@lists.linaro.org>; Sat, 16 Dec 2023 00:09:36 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=DR9cLtu1;
	spf=pass (lists.linaro.org: domain of ayushdevel1325@gmail.com designates 209.85.167.169 as permitted sender) smtp.mailfrom=ayushdevel1325@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-3b9ef61b6b8so980939b6e.3
        for <greybus-dev@lists.linaro.org>; Fri, 15 Dec 2023 16:09:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702685375; x=1703290175; darn=lists.linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XdA4va0gZa6nUIdxAUVBRHBZJl8udaeGAnDZ+2Ao6NQ=;
        b=DR9cLtu1hhAEpd8dRJliBNnhDzmfYXy0e7mDjYSXMyhOJhQqN3d/Rv4rQ/HHxb8IgW
         oATyB8fb//BUvLKmSGaX1DeF5hqhf+CQ5lJftpXlKfganRcw75YnPFkURfbc4uU9HjnK
         /l4tQ0H+iErnPeoxP9L0We4GOy60MvTc6UXDfwQ9vhONzHHChp6LdeN/SZvUTwh2OHx3
         LF/s28JkQqwSsPpoYDN8SjPCWbbh2WGPXSACsj4ouMadC35bwAhBxy/vIqQOaeDp2EHz
         ZvWcX0FdDwLpKD5v00idOPrrnCTI2BKp8TsEHTHeI37fmyIl2o8y0eDMtEvNbR1Hh72f
         kdSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702685375; x=1703290175;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XdA4va0gZa6nUIdxAUVBRHBZJl8udaeGAnDZ+2Ao6NQ=;
        b=l1eZ1n5m3fBKBOYVWnGs9UdJH2tKRqa0vJyzxg78tung7z7+Huhb7WdhDDGD7Ho7En
         r9uKfJTZhHzRP4wDzDPv6OWkKS3z5YqLE7OZ31TSzudpClfULnIuS67FugOTxucA7eUt
         pKCEf9lfMW4y3NxleU5oQ/gvQkNFbSBWNIru53vkDGFuTm6yPrePZeaQenv7fFoKjC2n
         Hshg5fLMLw/I0nmWFjoa3rRkTbEE4tYhICWXdGn5Mn8TKiVE/F0YXIX45BeT2WZ9m8Gf
         DLkOY7S5Qjh+wzMuSXNiH+8maC0xMWini9kP01Hvuk1bKgLoIssrxiDmqnIKxqO1Dz+C
         tpPw==
X-Gm-Message-State: AOJu0Yx72Y5bczFT3S3WFiYFdHRoEJ2pMTVWEecEcftJb5fMOVUDZHr1
	CDf6F8cHDevadrx3FE3OW6A=
X-Google-Smtp-Source: AGHT+IETrkQSURFgZazcQePnO2skiylCFTEp/72zKBWjsKkEXSPyWWepGDnybCHecw0vyPZiqgJEhw==
X-Received: by 2002:a05:6359:c83:b0:170:2e7f:bb98 with SMTP id go3-20020a0563590c8300b001702e7fbb98mr14637892rwb.55.1702685375340;
        Fri, 15 Dec 2023 16:09:35 -0800 (PST)
Received: from ?IPV6:2406:3003:2007:229e:ac29:68d8:877:4f72? ([2406:3003:2007:229e:ac29:68d8:877:4f72])
        by smtp.gmail.com with ESMTPSA id 5-20020a17090a018500b0028658657e9csm16913744pjc.46.2023.12.15.16.09.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Dec 2023 16:09:34 -0800 (PST)
Message-ID: <e60f7697-1a1a-46a4-9def-b59cae9777a3@gmail.com>
Date: Sat, 16 Dec 2023 05:39:30 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Greg KH <gregkh@linuxfoundation.org>
References: <20231211065420.213664-1-ayushdevel1325@gmail.com>
 <20231211065420.213664-2-ayushdevel1325@gmail.com>
 <2023121559-overfed-kisser-3923@gregkh>
From: Ayush Singh <ayushdevel1325@gmail.com>
In-Reply-To: <2023121559-overfed-kisser-3923@gregkh>
X-Rspamd-Queue-Id: 3CBED3F090
X-Spamd-Bar: -------
X-Spamd-Result: default: False [-7.99 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.167.169:from];
	RCPT_COUNT_SEVEN(0.00)[8];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: 7DDHCP6YIIPYUFRCXVHTTXLESZHI662L
X-Message-ID-Hash: 7DDHCP6YIIPYUFRCXVHTTXLESZHI662L
X-MailFrom: ayushdevel1325@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: greybus-dev@lists.linaro.org, johan@kernel.org, elder@kernel.org, linux-kernel@vger.kernel.org, nm@ti.com, yujie.liu@intel.com
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH V2 1/1] greybus: gb-beagleplay: Remove use of pad bytes
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/7DDHCP6YIIPYUFRCXVHTTXLESZHI662L/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit

On 12/15/23 21:50, Greg KH wrote:

> On Mon, Dec 11, 2023 at 12:24:18PM +0530, Ayush Singh wrote:
>> Make gb-beagleplay greybus spec compliant by moving cport information to
>> transport layer instead of using `header->pad` bytes.
>>
>> Greybus HDLC frame now has the following payload:
>> 1. le16 cport
>> 2. gb_operation_msg_hdr msg_header
>> 3. u8 *msg_payload
>>
>> Fixes: ec558bbfea67 ("greybus: Add BeaglePlay Linux Driver")
>> Signed-off-by: Ayush Singh <ayushdevel1325@gmail.com>
>> ---
>>   drivers/greybus/gb-beagleplay.c | 55 ++++++++++++++++++++++++---------
>>   1 file changed, 41 insertions(+), 14 deletions(-)
> This doesn't apply against my char-misc-next branch at all, what did you
> generate it against?
>
> thanks,
>
> greg k-h

The base commit of my tree is 
`0f5f12ac05f36f117e793656c3f560625e927f1b`. The tag is `next-20231205`.

I can rebase to a newer tag if you wish.

Ayush Singh

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
