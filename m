Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 882977D882C
	for <lists+greybus-dev@lfdr.de>; Thu, 26 Oct 2023 20:20:56 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 8DF943F23D
	for <lists+greybus-dev@lfdr.de>; Thu, 26 Oct 2023 18:20:55 +0000 (UTC)
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	by lists.linaro.org (Postfix) with ESMTPS id EEDFF3F088
	for <greybus-dev@lists.linaro.org>; Thu, 26 Oct 2023 18:20:49 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=ieee.org header.s=google header.b=Z8oznNkv;
	dmarc=pass (policy=quarantine) header.from=ieee.org;
	spf=pass (lists.linaro.org: domain of elder@ieee.org designates 209.85.167.176 as permitted sender) smtp.mailfrom=elder@ieee.org
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-3b2e72fe47fso749411b6e.1
        for <greybus-dev@lists.linaro.org>; Thu, 26 Oct 2023 11:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1698344449; x=1698949249; darn=lists.linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zD9c3qk1zR7XohQX5ahXN11vQdLFMJ+dj+AbgUO48eE=;
        b=Z8oznNkvip04ixwkd2+mPY65N/gPEjiKMWAxKAf7IhEG0cqCajuGrWu1tRZIT5x+7X
         8Sqz/VuN2flvvYyCb30sMiJtWcUAa2XMnkOgs0Oexh1DCAIb3xrGTJC54zDcIDsXqVnK
         dW4+NeZH0w5gX1CMq/u/7HTpl4lIMuBiA8/Cs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698344449; x=1698949249;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zD9c3qk1zR7XohQX5ahXN11vQdLFMJ+dj+AbgUO48eE=;
        b=fdClX0dPH1hQnv0wA5jHf9WaNmakhSbyLPkpu9aNYG+Jo1huYUk+YYT2mMbs6xVul8
         lj+mafXmUA2hPqfsPUwABhV9ydpNF9tJMr6JGCw79i/pHqytKbiyZZdKxAPBQbK301ww
         G3i9y/RCYKHhkvHmHVnp8MwcThZ+7k5j9ugagOn72rtchNT6f0SB78+Yej/u+OrdijGE
         SjXrTNvlE9pmN0v+4K2saYqYeQ/6nUrVVjSWbExu99GSpF9W66JhCRhYQ+QSt6HR3XQ0
         LyK3XIFYG4C/5zfOyHIjrhGr/kkNUXAmwCbFkjse9NQQryhdZgYy0FAH3tSi64N96q7Q
         ELkg==
X-Gm-Message-State: AOJu0YzvF1QbKCC7HP0A8r+zP387GTbN9hLpaiRLaxzvQGUA++g+CB3r
	GIYvHzC2mQVJ5xErh+aP/pGb0g==
X-Google-Smtp-Source: AGHT+IF81kqYKRpUAdo55BhO6rS7qI2l7xrzwZ9WNDOVB0ff4TIsIPfZ0l6kDz3LLIAX4RzIAJN5ig==
X-Received: by 2002:a05:6808:f8e:b0:3af:9fc4:26c6 with SMTP id o14-20020a0568080f8e00b003af9fc426c6mr171353oiw.20.1698344449334;
        Thu, 26 Oct 2023 11:20:49 -0700 (PDT)
Received: from [172.22.22.28] (c-98-61-227-136.hsd1.mn.comcast.net. [98.61.227.136])
        by smtp.googlemail.com with ESMTPSA id u15-20020a056808150f00b003ae5cb55513sm2889138oiw.38.2023.10.26.11.20.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Oct 2023 11:20:48 -0700 (PDT)
Message-ID: <5d457162-d20a-43a5-989e-ef263fbd91b2@ieee.org>
Date: Thu, 26 Oct 2023 13:20:47 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Nandha Kumar Singaram <nandhakumar.singaram@gmail.com>,
 Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>,
 Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <cover.1697976302.git.nandhakumar.singaram@gmail.com>
 <39be7bb04ce1362b00aa31a638ebe2e88dd81fec.1697976302.git.nandhakumar.singaram@gmail.com>
From: Alex Elder <elder@ieee.org>
In-Reply-To: <39be7bb04ce1362b00aa31a638ebe2e88dd81fec.1697976302.git.nandhakumar.singaram@gmail.com>
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: EEDFF3F088
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.49 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ieee.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17:c];
	R_DKIM_ALLOW(-0.20)[ieee.org:s=google];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ieee.org:+];
	FREEMAIL_CC(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,linuxfoundation.org,lists.linaro.org,lists.linux.dev,vger.kernel.org];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.167.176:from];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[];
	DWL_DNSWL_BLOCKED(0.00)[ieee.org:dkim];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action
Message-ID-Hash: HWEHXN6QKMIYLIS6CLG4MPRFWZQPYWGQ
X-Message-ID-Hash: HWEHXN6QKMIYLIS6CLG4MPRFWZQPYWGQ
X-MailFrom: elder@ieee.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: kumaran.4353@gmail.com
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v2 3/3] staging: greybus: bootrom: fixed prefer using ftrace warning
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/HWEHXN6QKMIYLIS6CLG4MPRFWZQPYWGQ/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit

On 10/22/23 7:22 AM, Nandha Kumar Singaram wrote:
> Adhere to linux coding style. Reported by checkpatch.pl:
> WARNING: Unnecessary ftrace-like logging - prefer using ftrace
> 
> Signed-off-by: Nandha Kumar Singaram <nandhakumar.singaram@gmail.com>

This change looks reasonable to me, though I don't think
ftrace provides device information.

Acked-by: Alex Elder <elder@linaro.org>

> ---
>   drivers/staging/greybus/bootrom.c | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/staging/greybus/bootrom.c b/drivers/staging/greybus/bootrom.c
> index a8efb86de140..79581457c4af 100644
> --- a/drivers/staging/greybus/bootrom.c
> +++ b/drivers/staging/greybus/bootrom.c
> @@ -491,8 +491,6 @@ static void gb_bootrom_disconnect(struct gb_bundle *bundle)
>   {
>   	struct gb_bootrom *bootrom = greybus_get_drvdata(bundle);
>   
> -	dev_dbg(&bundle->dev, "%s\n", __func__);
> -
>   	gb_connection_disable(bootrom->connection);
>   
>   	/* Disable timeouts */

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
