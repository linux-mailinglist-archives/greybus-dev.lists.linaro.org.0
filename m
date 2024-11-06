Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 33D8D9BEEF4
	for <lists+greybus-dev@lfdr.de>; Wed,  6 Nov 2024 14:23:46 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 4791A4140E
	for <lists+greybus-dev@lfdr.de>; Wed,  6 Nov 2024 13:23:45 +0000 (UTC)
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
	by lists.linaro.org (Postfix) with ESMTPS id 17E64413E8
	for <greybus-dev@lists.linaro.org>; Wed,  6 Nov 2024 13:23:19 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=ieee.org header.s=google header.b=SCLmgVUG;
	spf=pass (lists.linaro.org: domain of elder@ieee.org designates 209.85.166.49 as permitted sender) smtp.mailfrom=elder@ieee.org;
	dmarc=pass (policy=quarantine) header.from=ieee.org
Received: by mail-io1-f49.google.com with SMTP id ca18e2360f4ac-83abf71f244so225784639f.1
        for <greybus-dev@lists.linaro.org>; Wed, 06 Nov 2024 05:23:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1730899398; x=1731504198; darn=lists.linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lvbC08yvW1+eqm0ij3BDRpcWHRsnk8Vwjo+EayjDVtU=;
        b=SCLmgVUGOXwryCbTukvG5dEwVHx1X9l5FLxacBh/chlbmoLAvtxRBgSYaoey/YpN92
         qCcFgJBcDKUz7B5GEjZGRDOpXQoo2zQbhSdJBfvNhqlMTo4ZUkqfEFdke6mHpg3Y/GWl
         xcjd5zSIjma4XHUOSgbi8tHmlexIQvbgB3RRA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730899398; x=1731504198;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lvbC08yvW1+eqm0ij3BDRpcWHRsnk8Vwjo+EayjDVtU=;
        b=MRqEELDgbE3rHY+INNMkVC7lsYPOUfrByr1YRS44qae+VEIvsmT2iGkLnRy47rfkR6
         Gh2waBnP2ZDP9Bhpd0R5rIh6uM4A0ZOhO0gt7x9l1HL2J+FyL4SIbnnxnajVdGggUn08
         3Vot2vocYsV2Os0+pe4u9pHbCi0o7k389fzX5RafAFoZIe2MyAjSHTN9pc24s2hI5hRy
         ddMzDQeBrxQu72mmfv2Hg8U5OOKomqnegE8XCIzdKqBICDgoqKzCfdYarj/F5d840PN7
         p13MyfYprcVc7Xayl9KUbs84VuWySoUlO8+KKoH1eRhZZk0w6raBZDu0EXV8p2CFDfXV
         5O3w==
X-Gm-Message-State: AOJu0Ywbb/4zHtPPoO0MmdOTztOaIPH32/uc0CZ+QcnclVm16YMHcnLK
	T11sjBzFGxM5fFRzD8QOheCTl47y/bxXWfObFPPiN3Gg0mAMA1zyqvtJNB1LaA==
X-Google-Smtp-Source: AGHT+IHbqwR7B3eVmE9F/lWy/V/XK5+ENJpr7w8o5TU778A+kAokEQDMU/5iZGUsEydWO8j+npXxNA==
X-Received: by 2002:a05:6602:1695:b0:83b:2167:650f with SMTP id ca18e2360f4ac-83b6503964emr2926999139f.10.1730899398332;
        Wed, 06 Nov 2024 05:23:18 -0800 (PST)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.googlemail.com with ESMTPSA id ca18e2360f4ac-83b67b23aafsm313767039f.13.2024.11.06.05.23.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Nov 2024 05:23:16 -0800 (PST)
Message-ID: <6c36f9d8-b6ee-476c-9daf-feb2fd7ef15c@ieee.org>
Date: Wed, 6 Nov 2024 07:23:14 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Qiu-ji Chen <chenqiuji666@gmail.com>, dtwlin@gmail.com, johan@kernel.org,
 elder@kernel.org, gregkh@linuxfoundation.org
References: <20241106095819.15194-1-chenqiuji666@gmail.com>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <20241106095819.15194-1-chenqiuji666@gmail.com>
X-Spamd-Result: default: False [-8.00 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[99.99%];
	DMARC_POLICY_ALLOW(-0.50)[ieee.org,quarantine];
	R_DKIM_ALLOW(-0.20)[ieee.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.166.49:from];
	RBL_SENDERSCORE_REPUT_8(0.00)[209.85.166.49:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,linuxfoundation.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[lists.linaro.org,lists.linux.dev,vger.kernel.org,gmail.com];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[ieee.org:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 17E64413E8
X-Spamd-Bar: -------
X-MailFrom: elder@ieee.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: LOTFHTMH7TQE2RJGOUGP3ATWXCYROOLK
X-Message-ID-Hash: LOTFHTMH7TQE2RJGOUGP3ATWXCYROOLK
X-Mailman-Approved-At: Wed, 06 Nov 2024 13:23:40 +0000
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, baijiaju1990@gmail.com
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v2] greybus/uart: Fix atomicity violation in get_serial_info()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/LOTFHTMH7TQE2RJGOUGP3ATWXCYROOLK/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit

On 11/6/24 3:58 AM, Qiu-ji Chen wrote:
> Our static checker found a bug where set_serial_info() uses a mutex, but
> get_serial_info() does not. Fortunately, the impact of this is relatively
> minor. It doesn't cause a crash or any other serious issues. However, if a
> race condition occurs between set_serial_info() and get_serial_info(),
> there is a chance that the data returned by get_serial_info() will be
> meaningless.
> 
> Signed-off-by: Qiu-ji Chen <chenqiuji666@gmail.com>
> Fixes: 0aad5ad563c8 ("greybus/uart: switch to ->[sg]et_serial()")

Looks good.

Reviewed-by: Alex Elder <elder@riscstar.com>

PS  I was going to suggest computing the close delay and closing wait
     outside the mutex, as get_serial_info() above it does.  But it's
     minor and there's no reason to hold up your patch for that.

> ---
> V2:
> Modified the patch description to make it more concise and easier to understand.
> Changed the fix code to ensure the logic is correct.
> Thanks to Johan Hovold and Dan Carpenter for helpful suggestion.
> ---
>   drivers/staging/greybus/uart.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/staging/greybus/uart.c b/drivers/staging/greybus/uart.c
> index cdf4ebb93b10..8eab94cb06fa 100644
> --- a/drivers/staging/greybus/uart.c
> +++ b/drivers/staging/greybus/uart.c
> @@ -596,11 +596,13 @@ static int get_serial_info(struct tty_struct *tty,
>   	struct gb_tty *gb_tty = tty->driver_data;
>   
>   	ss->line = gb_tty->minor;
> +	mutex_lock(&gb_tty->port.mutex);
>   	ss->close_delay = jiffies_to_msecs(gb_tty->port.close_delay) / 10;
>   	ss->closing_wait =
>   		gb_tty->port.closing_wait == ASYNC_CLOSING_WAIT_NONE ?
>   		ASYNC_CLOSING_WAIT_NONE :
>   		jiffies_to_msecs(gb_tty->port.closing_wait) / 10;
> +	mutex_unlock(&gb_tty->port.mutex);
>   
>   	return 0;
>   }

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
