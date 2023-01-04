Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 2920D65D456
	for <lists+greybus-dev@lfdr.de>; Wed,  4 Jan 2023 14:34:07 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id D59AF3ED42
	for <lists+greybus-dev@lfdr.de>; Wed,  4 Jan 2023 13:34:05 +0000 (UTC)
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
	by lists.linaro.org (Postfix) with ESMTPS id E9E683ED42
	for <greybus-dev@lists.linaro.org>; Wed,  4 Jan 2023 13:33:59 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=ieee.org header.s=google header.b=BWA4m8t4;
	spf=pass (lists.linaro.org: domain of elder@ieee.org designates 209.85.166.177 as permitted sender) smtp.mailfrom=elder@ieee.org;
	dmarc=pass (policy=quarantine) header.from=ieee.org
Received: by mail-il1-f177.google.com with SMTP id bp26so4828424ilb.3
        for <greybus-dev@lists.linaro.org>; Wed, 04 Jan 2023 05:33:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E6lnHIrLeffNqYuMzqqIZDsBK+pCEcWE0LlZrei9DjY=;
        b=BWA4m8t4wHPfxNwvMoBi6UA3kZuyt9r0R37MxFbbpgIJe5FLYUXuH0TtWrjXFhThig
         CxT8nB0yVHjnoEMQ+a3Sqe5wf1E5wnsClLCq3k1pmcXSnxGgWHLBsVWuKfk3C71BESxv
         NZeFGC+KvmMQVpjeSiWgCO2VYG0o7ymoqkB3E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E6lnHIrLeffNqYuMzqqIZDsBK+pCEcWE0LlZrei9DjY=;
        b=CuLa/SBIMMeepPscoG4cCtjlC9NFEdmPo+9/yHHUVr9lc2ZB0wdmhnJ2NXPddxaF+E
         pTOOLPEO7awRk5BilRJiaD1kfcmQLJuzaeZRkbJjg/X2bplPQ5gTGiNgg6lTWz4+mf77
         WXVHGGbxJoMtPc7BmlYTTyDxfe0+jXgSIZLrLD8wbWCkd+unS7jCNwk944RQ87f3znF5
         CQjLFyyJwJA7evFtoimiqC05q1heH2l/Mp1FaDGBHGMpeoNGpGBESnfQ0FUx3bV3pGK6
         5FtZJN6IBpz8vR8hx8bKLMbseBM+TUAfnrtwTm4SKZsBJ4iuiedXJc2r9Xw+5s8OPW3X
         R0tw==
X-Gm-Message-State: AFqh2kpnLboak+YMkm1ck7PDO8homQFxP/vWAsQzB1CL2vFQfm1zPvX+
	9JnQJVywa1fwKILeoPqE+zRyeQ==
X-Google-Smtp-Source: AMrXdXuwjWYJ8N4s26XlYKVs8+TthVoGFb5zQvfgcG+226lExm6A3+9S6riTirOXFmyvfnVowlESjQ==
X-Received: by 2002:a92:d10f:0:b0:304:d0b7:e362 with SMTP id a15-20020a92d10f000000b00304d0b7e362mr30117562ilb.5.1672839239344;
        Wed, 04 Jan 2023 05:33:59 -0800 (PST)
Received: from [10.211.55.3] ([98.61.227.136])
        by smtp.googlemail.com with ESMTPSA id q24-20020a02a998000000b0038a360671adsm11168718jam.27.2023.01.04.05.33.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jan 2023 05:33:58 -0800 (PST)
Message-ID: <f943d3ca-7cf7-cb4d-5dc7-1e45015ba213@ieee.org>
Date: Wed, 4 Jan 2023 07:33:57 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
To: Deepak R Varma <drv@mailo.com>, Johan Hovold <johan@kernel.org>,
 Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <Y7T5MYfANf2xVsEx@qemulion>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <Y7T5MYfANf2xVsEx@qemulion>
X-Spamd-Result: default: False [-7.50 / 15.00];
	DWL_DNSWL_HI(-3.50)[ieee.org:dkim];
	BAYES_HAM(-3.00)[100.00%];
	DMARC_POLICY_ALLOW(-0.50)[ieee.org,quarantine];
	R_DKIM_ALLOW(-0.20)[ieee.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	MIME_GOOD(-0.10)[text/plain];
	FROM_EQ_ENVFROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail-il1-f177.google.com:rdns,mail-il1-f177.google.com:helo,ieee.org:dkim,flexible_array.cocci:url,gnu.org:url];
	DKIM_TRACE(0.00)[ieee.org:+];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.166.177:from]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: E9E683ED42
X-Spamd-Bar: -------
Message-ID-Hash: OV7NUF7MCCK5RXP2ZIWEY66PBMAIHLCN
X-Message-ID-Hash: OV7NUF7MCCK5RXP2ZIWEY66PBMAIHLCN
X-MailFrom: elder@ieee.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Saurabh Singh Sengar <ssengar@microsoft.com>, Praveen Kumar <kumarpraveen@linux.microsoft.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: Replace zero-length array by DECLARE_FLEX_ARRAY() helper
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/OV7NUF7MCCK5RXP2ZIWEY66PBMAIHLCN/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit

On 1/3/23 9:57 PM, Deepak R Varma wrote:
> The code currently uses C90 standard extension based zero length array
> struct which is now deprecated and the new C99 standard extension of
> flexible array declarations are to be used instead. Also, the macro
> DECLARE_FLEX_ARRAY() allows to use single flexible array member in a
> structure. Refer to these links [1], [2] for details.

Thank you for citing some references in your commit, it's
a good and helpful practice.  This might have been another
helpful one:
 
https://lore.kernel.org/lkml/20210827163015.3141722-2-keescook@chromium.org/

> [1] https://gcc.gnu.org/onlinedocs/gcc/Zero-Length.html
> [2] https://lkml.kernel.org/r/YxKY6O2hmdwNh8r8@work

FYI, Linux mailing lists hosted by kernel.org are normally
cited using "lore.kernel.org" now, e.g.:
   https://lore.kernel.org/lkml/YxKY6O2hmdwNh8r8@work
Your patch is fine, this is just so you can consider this
in the future.

> Issue identified using Coccinelle flexible_array.cocci semantic patch.
> 
> Signed-off-by: Deepak R Varma <drv@mailo.com>

Looks good to me.

Reviewed-by: Alex Elder <elder@linaro.org>

> ---
>   drivers/staging/greybus/usb.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/greybus/usb.c b/drivers/staging/greybus/usb.c
> index 8e9d9d59a357..b7badf87a3f0 100644
> --- a/drivers/staging/greybus/usb.c
> +++ b/drivers/staging/greybus/usb.c
> @@ -27,7 +27,7 @@ struct gb_usb_hub_control_request {
>   };
> 
>   struct gb_usb_hub_control_response {
> -	u8 buf[0];
> +	DECLARE_FLEX_ARRAY(u8, buf);
>   };
> 
>   struct gb_usb_device {
> --
> 2.34.1
> 
> 
> 

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
