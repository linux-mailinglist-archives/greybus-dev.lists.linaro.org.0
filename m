Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 20CD18B8310
	for <lists+greybus-dev@lfdr.de>; Wed,  1 May 2024 01:41:50 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id A957C44342
	for <lists+greybus-dev@lfdr.de>; Tue, 30 Apr 2024 23:41:48 +0000 (UTC)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	by lists.linaro.org (Postfix) with ESMTPS id 06F0244342
	for <greybus-dev@lists.linaro.org>; Tue, 30 Apr 2024 23:41:46 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=ieee.org header.s=google header.b=c80QkjF0;
	spf=pass (lists.linaro.org: domain of elder@ieee.org designates 209.85.219.177 as permitted sender) smtp.mailfrom=elder@ieee.org;
	dmarc=pass (policy=quarantine) header.from=ieee.org
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-dcc6fc978ddso346726276.0
        for <greybus-dev@lists.linaro.org>; Tue, 30 Apr 2024 16:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1714520505; x=1715125305; darn=lists.linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HyNJHGFWuCMTbeFg405HlnRxBUxH//W5wiUSNddP8XU=;
        b=c80QkjF0wfIcHqJNCJweBra698/hyXuQNsEzM/+k0pp2X96p5R9iqiiAU+n5k2q6de
         MKb3db5FWcGEkp4uNtBwXWJsw2B4XcSaVjhDIdKCTdErziVCexBTAh4raFNrYro+6Y3O
         /JTd1ZJzt9VwvJUfs1JNaR/ZajqTru6nrVqXA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714520505; x=1715125305;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HyNJHGFWuCMTbeFg405HlnRxBUxH//W5wiUSNddP8XU=;
        b=HatX1udbCuJEH9aDk5O3A+NDdJ5//s/46EIvNRZBRJeOtGB9WVkjMREcvRZYoKJav6
         ks9k+hle2nRZOxVa8hCIwfuyCMsolK0iPCRSVbtkj6P2fEyHoh6PwTBuVD3UJqK1Lo0h
         GCHr29BI+yhYDDsvgLbX/a0kFBLwu0ggDII5ArefrpzMHftDOKj3zWMpr0xrVNBNWaO7
         yU3jJAchGpJp2XwwX7TY1NQ7vO5rQvjAfTzi6Uo66qFV+y64L0ge1aRbWG+OaecunwjB
         u8LPhblVZWjzOVbl/tzgIh822QwHZT0z3OU+wSaufJWHoBL0TqwD7bHnqiwrREavGSoL
         DF9w==
X-Forwarded-Encrypted: i=1; AJvYcCW6JXYVzOm3rLE+wUq/1ffvlyyZoH+Bn/RGlcPWkoiByoKDEJDj79+yBUSEhUWB7fhWrfm1QPXDxBDMaHZYKWFnEVeqVoqWIPUVRhnD
X-Gm-Message-State: AOJu0Yyd6APUM0Lm8z0gNsC+pR71VKXlqVSxNF/kykTuS/jLMMK46FF8
	KJXs7N6mw/Y8IpHhLEMZa3vis6cf2+sf1Edm2kjf3CyrSXhbfE1R3Sy/ycrKEg==
X-Google-Smtp-Source: AGHT+IG9ARc9BS7K77ZQwk0ByPLtLEEQsTsSNZsRxRh92VKyfaBL924BS3RaIxHei9zkfWFIw/3oyg==
X-Received: by 2002:a5b:b02:0:b0:dd1:6cad:8fd3 with SMTP id z2-20020a5b0b02000000b00dd16cad8fd3mr803465ybp.27.1714520505457;
        Tue, 30 Apr 2024 16:41:45 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.googlemail.com with ESMTPSA id p81-20020a25d854000000b00de617955013sm493242ybg.45.2024.04.30.16.41.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Apr 2024 16:41:44 -0700 (PDT)
Message-ID: <506f15e3-b40e-481a-9eac-772faf4feb6b@ieee.org>
Date: Tue, 30 Apr 2024 18:41:42 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Arnd Bergmann <arnd@kernel.org>, linux-kernel@vger.kernel.org,
 Vaibhav Hiremath <hvaibhav.linux@gmail.com>, Johan Hovold
 <johan@kernel.org>, Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Viresh Kumar <viresh.kumar@linaro.org>
References: <20240403080702.3509288-1-arnd@kernel.org>
 <20240403080702.3509288-18-arnd@kernel.org>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <20240403080702.3509288-18-arnd@kernel.org>
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 06F0244342
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.49 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ieee.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[ieee.org:s=google];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	DKIM_TRACE(0.00)[ieee.org:+];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,vger.kernel.org,gmail.com,linuxfoundation.org,linaro.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.219.177:from];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	DNSWL_BLOCKED(0.00)[73.228.159.35:received,209.85.219.177:from];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[];
	DWL_DNSWL_BLOCKED(0.00)[ieee.org:dkim];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action
Message-ID-Hash: E7EJXNTPYHCISAQVSWQI2WOESY2PXHXT
X-Message-ID-Hash: E7EJXNTPYHCISAQVSWQI2WOESY2PXHXT
X-MailFrom: elder@ieee.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Arnd Bergmann <arnd@arndb.de>, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Luca Ceresoli <luca.ceresoli@bootlin.com>, Rob Herring <robh@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 17/34] greybus: arche-ctrl: move device table to its right location
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/E7EJXNTPYHCISAQVSWQI2WOESY2PXHXT/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit

On 4/3/24 3:06 AM, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The arche-ctrl has two platform drivers and three of_device_id tables,
> but one table is only used for the the module loader, while the other
> two seem to be associated with their drivers.
> 
> This leads to a W=1 warning when the driver is built-in:
> 
> drivers/staging/greybus/arche-platform.c:623:34: error: 'arche_combined_id' defined but not used [-Werror=unused-const-variable=]
>    623 | static const struct of_device_id arche_combined_id[] = {
> 
> Drop the extra table and register both tables that are actually
> used as the ones for the module loader instead.

So what I see is that this commit added arche_combined_id[]:
   1e5dd1f8279a8 greybus: arche-platform: merge arche-apb-ctrl and 
arche-platform

That moved the arche_apb_ctrl_device_driver struct and some other
associated bits out of arche-apb-ctrl.c and into arche-platform.c.
It *kept* arche_platform_of_match[] as the of_match_table for
arche_platform_device_driver, but defined arche_combined_id[] and
declared it for modalias to indicate both drivers were implemented
in the single kernel module.

The later commit (the one you references in "Fixes") then moved
the arche_apb_ctrl_device_driver etc. back to arche-apb-ctrl.c.
That commit did *not* use MODULE_DEVICE_TABLE() to declare
arche_apb_ctrl_of_match[] for modalias.  And it simply kept the
(no longer correct) arche_combined_id[] table to be used by the
arche_platform_device_driver.

So your fix:
- Declares for modalias that arche_apb_ctrl_of_match[] is the
   of_match_table for arche_apb_ctrl_device_driver.
- Declares for modalias that arche_platform_of_match[] is the
   of_match_table for arche_platform_device_driver.
- Gets rid of arche_combined_id[], which is no longer used.

In short:  looks good to me.

Reviewed-by: Alex Elder <elder@linaro.org>

> 
> Fixes: 7b62b61c752a ("greybus: arche-ctrl: Don't expose driver internals to arche-platform driver")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>   drivers/staging/greybus/arche-apb-ctrl.c | 1 +
>   drivers/staging/greybus/arche-platform.c | 9 +--------
>   2 files changed, 2 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/staging/greybus/arche-apb-ctrl.c b/drivers/staging/greybus/arche-apb-ctrl.c
> index 8541995008da..aa6f266b62a1 100644
> --- a/drivers/staging/greybus/arche-apb-ctrl.c
> +++ b/drivers/staging/greybus/arche-apb-ctrl.c
> @@ -466,6 +466,7 @@ static const struct of_device_id arche_apb_ctrl_of_match[] = {
>   	{ .compatible = "usbffff,2", },
>   	{ },
>   };
> +MODULE_DEVICE_TABLE(of, arche_apb_ctrl_of_match);
>   
>   static struct platform_driver arche_apb_ctrl_device_driver = {
>   	.probe		= arche_apb_ctrl_probe,
> diff --git a/drivers/staging/greybus/arche-platform.c b/drivers/staging/greybus/arche-platform.c
> index 891b75327d7f..b33977ccd527 100644
> --- a/drivers/staging/greybus/arche-platform.c
> +++ b/drivers/staging/greybus/arche-platform.c
> @@ -619,14 +619,7 @@ static const struct of_device_id arche_platform_of_match[] = {
>   	{ .compatible = "google,arche-platform", },
>   	{ },
>   };
> -
> -static const struct of_device_id arche_combined_id[] = {
> -	/* Use PID/VID of SVC device */
> -	{ .compatible = "google,arche-platform", },
> -	{ .compatible = "usbffff,2", },
> -	{ },
> -};
> -MODULE_DEVICE_TABLE(of, arche_combined_id);
> +MODULE_DEVICE_TABLE(of, arche_platform_of_match);
>   
>   static struct platform_driver arche_platform_device_driver = {
>   	.probe		= arche_platform_probe,

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
