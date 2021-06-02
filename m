Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 82875398AEE
	for <lists+greybus-dev@lfdr.de>; Wed,  2 Jun 2021 15:43:22 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id D087861012
	for <lists+greybus-dev@lfdr.de>; Wed,  2 Jun 2021 13:43:20 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 429CD60752; Wed,  2 Jun 2021 13:43:20 +0000 (UTC)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 8FD456079C;
	Wed,  2 Jun 2021 13:43:17 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 8479960713
 for <greybus-dev@lists.linaro.org>; Wed,  2 Jun 2021 13:43:16 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 8237B60774; Wed,  2 Jun 2021 13:43:16 +0000 (UTC)
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com
 [209.85.166.44])
 by lists.linaro.org (Postfix) with ESMTPS id 74A8360713
 for <greybus-dev@lists.linaro.org>; Wed,  2 Jun 2021 13:43:14 +0000 (UTC)
Received: by mail-io1-f44.google.com with SMTP id r4so2567349iol.6
 for <greybus-dev@lists.linaro.org>; Wed, 02 Jun 2021 06:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ieee.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=bQwWMdNiop3KR5deOzjW/qoaepwqcvp7jJfbHI3zXtY=;
 b=JPtMWY4kgGga8R41zy7szTr3zo7j99f+OfcMYf3jZwLVSe7eCz6+i5RKPqO9EFb/6f
 Ett0SsYxZ1oWEBSe4AY+D5FyHsE63ePBYY2wG2/WeUQ0OvKdU54hH9KzaMXgrumXCtrx
 OvCC+X92lFHRNMwzTd1/AE0BhtspPGgsL+eqE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bQwWMdNiop3KR5deOzjW/qoaepwqcvp7jJfbHI3zXtY=;
 b=jlA3BPfZc4Q+OOB0nE8MGppOqfBNONJslXOCQEXg0VXrxxb0aDDexN3p5Qkf3EuFOc
 gU1a33ssBPLkP7/40KRTRPfzGr2hYLxPHYnN40sn8W/6PkpDT1XAssJ7JT0p8/wblZGP
 T4CowUFh5L0h9ZmVRGhefevAB0g/xYFvTnjhrlm6JhGUCQ6xOHmyh6eamh4uFilyiJWl
 RjLEABLt/1P4B87rJ8WO6diLicxDVi66lhxiXrh6JZCjyZNP5eJoVBfq8wQO9y5mZyMN
 5Q+goBEqVlbfSDtfCTGrhzLwLj6DJkS2la11M5J0DtA5vnH4yIGyV3s3GGlkIQIzH0/Z
 4q1w==
X-Gm-Message-State: AOAM53252AsXqoSVVmqdgleY+hHmJGOctJ2w/waLVCMxTzvT+88iSMjv
 9IutkrTFjUMPTGXhS8yppuebsA==
X-Google-Smtp-Source: ABdhPJzI132qPNGQXEIRmSa3fSS7UK52IeTZVxH49vKtqdaD+xrMOSB2COZPmz0sKUk9M9cC2VPEtA==
X-Received: by 2002:a05:6638:343:: with SMTP id
 x3mr9697267jap.101.1622641393970; 
 Wed, 02 Jun 2021 06:43:13 -0700 (PDT)
Received: from [172.22.22.4] (c-73-185-129-58.hsd1.mn.comcast.net.
 [73.185.129.58])
 by smtp.googlemail.com with ESMTPSA id i12sm51270ilk.22.2021.06.02.06.43.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jun 2021 06:43:13 -0700 (PDT)
To: sh4nnu <manikishanghantasala@gmail.com>
References: <20210602133659.46158-1-manikishanghantasala@gmail.com>
From: Alex Elder <elder@ieee.org>
Message-ID: <9a3878fd-3b59-76f5-ddc7-625c66f9fee8@ieee.org>
Date: Wed, 2 Jun 2021 08:43:11 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210602133659.46158-1-manikishanghantasala@gmail.com>
Content-Language: en-US
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Re: [greybus-dev] [PATCH] staging: greybus: fixed the coding style,
 labels should not be indented.
X-BeenThere: greybus-dev@lists.linaro.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
List-Unsubscribe: <https://lists.linaro.org/mailman/options/greybus-dev>,
 <mailto:greybus-dev-request@lists.linaro.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/greybus-dev/>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Subscribe: <https://lists.linaro.org/mailman/listinfo/greybus-dev>,
 <mailto:greybus-dev-request@lists.linaro.org?subject=subscribe>
Cc: Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org,
 linux-staging@lists.linux.dev, Johan Hovold <johan@kernel.org>,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: greybus-dev-bounces@lists.linaro.org
Sender: "greybus-dev" <greybus-dev-bounces@lists.linaro.org>
X-Virus-Scanned: ClamAV using ClamSMTP

On 6/2/21 8:36 AM, sh4nnu wrote:
> From: Manikishan Ghantasala <manikishanghantasala@gmail.com>
> 
> staging: greybus: gpio.c: Clear coding-style problem
> "labels should not be indented" by removing indentation.

These are not labels.

I don't really understand what you're doing here.

Can you please explain why you think this needs changing?

					-Alex

> Signed-off-by: Manikishan Ghantasala <manikishanghantasala@gmail.com>
> ---
>   drivers/staging/greybus/gpio.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/greybus/gpio.c b/drivers/staging/greybus/gpio.c
> index 7e6347fe93f9..4661f4a251bd 100644
> --- a/drivers/staging/greybus/gpio.c
> +++ b/drivers/staging/greybus/gpio.c
> @@ -20,9 +20,9 @@
>   struct gb_gpio_line {
>   	/* The following has to be an array of line_max entries */
>   	/* --> make them just a flags field */
> -	u8			active:    1,
> -				direction: 1,	/* 0 = output, 1 = input */
> -				value:     1;	/* 0 = low, 1 = high */
> +	u8			active:1,
> +				direction:1,	/* 0 = output, 1 = input */
> +				value:1;	/* 0 = low, 1 = high */
>   	u16			debounce_usec;
>   
>   	u8			irq_type;
> 

_______________________________________________
greybus-dev mailing list
greybus-dev@lists.linaro.org
https://lists.linaro.org/mailman/listinfo/greybus-dev
