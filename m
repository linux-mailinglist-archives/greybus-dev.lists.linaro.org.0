Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 16F834809E5
	for <lists+greybus-dev@lfdr.de>; Tue, 28 Dec 2021 15:25:26 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 22094611B1
	for <lists+greybus-dev@lfdr.de>; Tue, 28 Dec 2021 14:25:25 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id D9742611EB; Tue, 28 Dec 2021 14:25:24 +0000 (UTC)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 427AA60FAD;
	Tue, 28 Dec 2021 14:25:22 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id AA77A60B0A
 for <greybus-dev@lists.linaro.org>; Tue, 28 Dec 2021 14:25:20 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 9E27360DA3; Tue, 28 Dec 2021 14:25:20 +0000 (UTC)
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com
 [209.85.166.171])
 by lists.linaro.org (Postfix) with ESMTPS id 9483260B0A
 for <greybus-dev@lists.linaro.org>; Tue, 28 Dec 2021 14:25:18 +0000 (UTC)
Received: by mail-il1-f171.google.com with SMTP id f17so14348720ilj.11
 for <greybus-dev@lists.linaro.org>; Tue, 28 Dec 2021 06:25:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=jrGkg0GjQaZqyWg6VJHnXS6TpWywtIeIOU6kuR+w79A=;
 b=bY6YNYMS5NBC0WP/gMaauje8VyV0/iL/D2bUvGRmbnGj1MPW0+EbMLwNdZJJdZqqR9
 Ul6gbD0S5GYCplzAG61XxBmNmUumThINANUMP9XnBfOcYNuGEhiM7c2DIeEMXhx8anI0
 QPk6XQzG1USVEBF5GlHkjhBzXkvI4D7f++MLkJ1ibzFnpUASClKdHHEdG+6KLD0+Y2WU
 gVQicitnjRPlvmrkbGeE9HA5MIeybiX051Y6b7xzYmwYnmvx2Ph+Nj7u0ONDITR3BPuM
 fQTD7uDod/BrrnZrRx9ZeBU+bhbABwtEnkeMxzR42v4FqpDp96qPn7CNbnwJiRyVJ02V
 kXCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=jrGkg0GjQaZqyWg6VJHnXS6TpWywtIeIOU6kuR+w79A=;
 b=VS0AlzNf0d4BqmTh9gj3lw7mdeEmduTcCluOvuAprco7gbcZECbbGlsbdGgST64nrV
 zCKijotMT1rdHYNVU/GwEGxwQqKUCaDr4AwRRhKQwybbu3FIfFtynidgclLHKTix6zMy
 5j67QKB0vJndTKiy+G0z0wXoKgaZmV0m/4aElMM4qK5F64afzyHkp28ToUVNpG892c9M
 ngOBKwkh44/QX68UZKHGi+5429tk+k3eGipkNhz+5xd1Fn9Y/NwC3W4vZY41XPX6egzU
 oTrYLMBrfYyPgl/3TuMBrr0G4koDkxudmTgUb/X4+qlNbRUNxbyUUB46jtYdY4BP77Zj
 bSbA==
X-Gm-Message-State: AOAM533fHl4AtL3K/6/PXxSyDpbieHI5zNhluEgpB3iPfpIYQELw0P+h
 Ubo02/O58jucUnDZncpdKUPjM0xK
X-Google-Smtp-Source: ABdhPJwBHI7t61Vcu/OI3LRrGbaXgP9h5utn0tKneDRxb5p5nDSZzWW/RC4/hEZgjR/prnZM3zdFgQ==
X-Received: by 2002:a05:6e02:154c:: with SMTP id
 j12mr9339365ilu.169.1640701517640; 
 Tue, 28 Dec 2021 06:25:17 -0800 (PST)
Received: from [172.22.22.4] (c-73-185-129-58.hsd1.mn.comcast.net.
 [73.185.129.58])
 by smtp.googlemail.com with ESMTPSA id v4sm10795800ilq.13.2021.12.28.06.25.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Dec 2021 06:25:16 -0800 (PST)
Message-ID: <4d25feae-aa07-f8f1-88b9-1209e57b9c2a@linaro.org>
Date: Tue, 28 Dec 2021 08:25:15 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Content-Language: en-US
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org
References: <20211228135541.380275-1-gregkh@linuxfoundation.org>
From: Alex Elder <elder@linaro.org>
In-Reply-To: <20211228135541.380275-1-gregkh@linuxfoundation.org>
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Re: [greybus-dev] [PATCH] staging: greybus: auto_manager: use
 default_groups in kobj_type
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
Cc: linux-staging@lists.linux.dev, Alex Elder <elder@kernel.org>,
 Johan Hovold <johan@kernel.org>, greybus-dev@lists.linaro.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: greybus-dev-bounces@lists.linaro.org
Sender: "greybus-dev" <greybus-dev-bounces@lists.linaro.org>
X-Virus-Scanned: ClamAV using ClamSMTP

On 12/28/21 7:55 AM, Greg Kroah-Hartman wrote:
> There are currently 2 ways to create a set of sysfs files for a
> kobj_type, through the default_attrs field, and the default_groups
> field.  Move the greybus audio code to use default_groups field which
> has been the preferred way since aa30f47cf666 ("kobject: Add support for
> default attribute groups to kobj_type") so that we can soon get rid of
> the obsolete default_attrs field.
> 
> Cc: Vaibhav Agarwal <vaibhav.sr@gmail.com>
> Cc: Mark Greer <mgreer@animalcreek.com>
> Cc: Johan Hovold <johan@kernel.org>
> Cc: Alex Elder <elder@kernel.org>
> Cc: greybus-dev@lists.linaro.org
> Cc: linux-staging@lists.linux.dev
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Nice and simple to convert this (as it should be).
Looks good to me.

Reviewed-by: Alex Elder <elder@linaro.org>

> ---
>   drivers/staging/greybus/audio_manager_module.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/greybus/audio_manager_module.c b/drivers/staging/greybus/audio_manager_module.c
> index 525cf8f8394f..0a0f0a394c84 100644
> --- a/drivers/staging/greybus/audio_manager_module.c
> +++ b/drivers/staging/greybus/audio_manager_module.c
> @@ -142,11 +142,12 @@ static struct attribute *gb_audio_module_default_attrs[] = {
>   	&gb_audio_module_op_devices_attribute.attr,
>   	NULL,   /* need to NULL terminate the list of attributes */
>   };
> +ATTRIBUTE_GROUPS(gb_audio_module_default);
>   
>   static struct kobj_type gb_audio_module_type = {
>   	.sysfs_ops = &gb_audio_module_sysfs_ops,
>   	.release = gb_audio_module_release,
> -	.default_attrs = gb_audio_module_default_attrs,
> +	.default_groups = gb_audio_module_default_groups,
>   };
>   
>   static void send_add_uevent(struct gb_audio_manager_module *module)
> 

_______________________________________________
greybus-dev mailing list
greybus-dev@lists.linaro.org
https://lists.linaro.org/mailman/listinfo/greybus-dev
