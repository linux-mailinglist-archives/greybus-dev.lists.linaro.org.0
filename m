Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DBA4671CE2
	for <lists+greybus-dev@lfdr.de>; Wed, 18 Jan 2023 14:04:55 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 6A6FB3F04F
	for <lists+greybus-dev@lfdr.de>; Wed, 18 Jan 2023 13:04:54 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	by lists.linaro.org (Postfix) with ESMTPS id 6F9073EEF1
	for <greybus-dev@lists.linaro.org>; Tue, 17 Jan 2023 08:51:32 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20210112 header.b=Q3J63XlG;
	spf=pass (lists.linaro.org: domain of error27@gmail.com designates 209.85.128.54 as permitted sender) smtp.mailfrom=error27@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id o17-20020a05600c511100b003db021ef437so2479727wms.4
        for <greybus-dev@lists.linaro.org>; Tue, 17 Jan 2023 00:51:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8xUTsuDVDtEpe1GJ8CtfZxPtOBZeRfWuY5JCnMma88g=;
        b=Q3J63XlGShJ/2WbvRq4hq2JID/RnkKt4xtbAsiugUa9SNycDgYwChezLN95KF6GWZS
         ZVJkIixYUlATzLJeowVp4c1h7z/f/4DH7nMUk4d4cegvxfChKv/AYjU+hXanodexOasF
         VAq8RVqnozkvWd1b5Fh1WlO2+qOfWgf+KUsbML1KuGpsVE2k8s88Z7SJqQfDqdIzgmai
         qbo8EyyaT9JS2OZssTz1Kfflfc2yI4nJHvivkCXHHpXB6yQMbO8dk+957rWZtiA+tEDr
         mJo3+KPuXQid4Tndd7zCW0puoOEZ60Ol+p6iPz76PYqum6cooiDuY2vr0mGP53YeFcAD
         MZLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8xUTsuDVDtEpe1GJ8CtfZxPtOBZeRfWuY5JCnMma88g=;
        b=tSvX8/Un4PMNOWrd+x2lQBh71v+eR97PVBh6eerp47r6Cnb5gd8qH1BHTI01NPgxi6
         zdjnv1OTeF0M20FsMjUr77p94cfHp04034jqE2wtl2dlqClOsMa1/Vr/no8AR7nrKKwG
         hnCrLp2EjSNVua5xaFB0v7AK9d1Jo92x9wg5VaMiAeVdjaGGipXVpZU7K4QM6OXU47ae
         1NQSYfLJQvdL7xT/rkkaID4vXDOnyblpxu97M+9f8LGChUaf9WlBHjtnuLNnsA71FQX6
         1z0yul66TdL218IbPzIFGMf/rPwp2FUhL7og3VHXWN/exR5I8TmpJ5o6R6s9PZtvdYj/
         uitg==
X-Gm-Message-State: AFqh2koZXiXVWBW65n7LzBXWzP3z73uVJFnqWjsY2A23natXlNO2dq7O
	aX+5jSvObySGUNSzmXoaIZA=
X-Google-Smtp-Source: AMrXdXuaWZ988H1JpKPLPP+mvkv2SJjjaD8lYx2S17O9IVBsaXXDA9gK/NSe7U0nWs0SYGpizHjdWQ==
X-Received: by 2002:a05:600c:1d22:b0:3da:f66c:795d with SMTP id l34-20020a05600c1d2200b003daf66c795dmr2466961wms.9.1673945491342;
        Tue, 17 Jan 2023 00:51:31 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id o2-20020a05600c4fc200b003da2932bde0sm13956874wmq.23.2023.01.17.00.51.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 00:51:30 -0800 (PST)
Date: Tue, 17 Jan 2023 11:51:27 +0300
From: Dan Carpenter <error27@gmail.com>
To: Brent Pappas <bpappas@pappasbrent.com>
Message-ID: <Y8Zhj81ltR7HI7Uh@kadam>
References: <20230116184707.22302-1-bpappas@pappasbrent.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230116184707.22302-1-bpappas@pappasbrent.com>
X-Spamd-Result: default: False [-3.50 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20210112];
	MIME_GOOD(-0.10)[text/plain];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_EQ_ENVFROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,linuxfoundation.org,lists.linaro.org,lists.linux.dev,vger.kernel.org];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.128.54:from]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 6F9073EEF1
X-Spamd-Bar: ---
X-MailFrom: error27@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: WZXWD2HYC64NDMJ3LC6D2X44WTOCWIRK
X-Message-ID-Hash: WZXWD2HYC64NDMJ3LC6D2X44WTOCWIRK
X-Mailman-Approved-At: Wed, 18 Jan 2023 13:04:43 +0000
CC: johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: gpio: Replace macro irq_data_to_gpio_chip with function
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/WZXWD2HYC64NDMJ3LC6D2X44WTOCWIRK/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Jan 16, 2023 at 01:47:06PM -0500, Brent Pappas wrote:
> Replace the macro irq_data_to_gpio_chip with a static inline function to comply
> with Linux coding style standards.
> 
> Signed-off-by: Brent Pappas <bpappas@pappasbrent.com>
> ---
>  drivers/staging/greybus/gpio.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/greybus/gpio.c b/drivers/staging/greybus/gpio.c
> index 8a7cf1d0e968..833162ceb385 100644
> --- a/drivers/staging/greybus/gpio.c
> +++ b/drivers/staging/greybus/gpio.c
> @@ -43,7 +43,11 @@ struct gb_gpio_controller {
>  };
>  #define gpio_chip_to_gb_gpio_controller(chip) \
>  	container_of(chip, struct gb_gpio_controller, chip)
> -#define irq_data_to_gpio_chip(d) (d->domain->host_data)
> +
> +static inline void *irq_data_to_gpio_chip(struct irq_data *d)

1) Don't make this a void pointer.  ->host_data is void but we want to
   return a struct gpio_chip * type so declare it as returning a
   gpio_chip struct pointer.  A big advantage of function over macros is
   the type checking.

2) Don't declare it as inline.  Modern compilers are smart and confident.
   They are smart enough to make it inline automatically.  And confident
   enough that they just ignore when people mark stuff as inline.  (We
   have an __always_inline macro for when the compiler is wrong.)

regards,
dan carpenter

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
