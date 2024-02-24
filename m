Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 263FC8625D6
	for <lists+greybus-dev@lfdr.de>; Sat, 24 Feb 2024 16:43:41 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id EC8D843C43
	for <lists+greybus-dev@lfdr.de>; Sat, 24 Feb 2024 15:43:39 +0000 (UTC)
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
	by lists.linaro.org (Postfix) with ESMTPS id 53AEB3F1FD
	for <greybus-dev@lists.linaro.org>; Sat, 24 Feb 2024 15:43:33 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=ieee.org header.s=google header.b=LUIzNLSt;
	spf=pass (lists.linaro.org: domain of elder@ieee.org designates 209.85.166.43 as permitted sender) smtp.mailfrom=elder@ieee.org;
	dmarc=pass (policy=quarantine) header.from=ieee.org
Received: by mail-io1-f43.google.com with SMTP id ca18e2360f4ac-7c7964d109aso59962239f.2
        for <greybus-dev@lists.linaro.org>; Sat, 24 Feb 2024 07:43:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1708789413; x=1709394213; darn=lists.linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R0qYyqY2wAqQ9qpXtppc+dFQhwKCUOdHpHjo4UMt1ME=;
        b=LUIzNLStgwNCUh9ezD4yhiOmJhjVbGxZsLiN5SQnCM8QX3m82cYr4NnCeL2pZu7CXG
         kfOyJY+b5ul0v3qhseojy+zmTVo40pspdVVp5g1yttNLaDkIDDzSW3Ot+L5x1Lv3Zw9y
         cjDwltXcQVI/KN5XM6vMXOrgqeJWq2ee1qwAU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708789413; x=1709394213;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R0qYyqY2wAqQ9qpXtppc+dFQhwKCUOdHpHjo4UMt1ME=;
        b=VNW/OdfdGGc4Ps1IGegaJ7Pvgjv+2oSuLxADt5v+4h1BS07kD13nRJtA4koso/Mkzd
         I9dU48zuW8MkbJledW6dTQ439yUzBvdrHJwZWw6Rto8uPN2L0lp4eaZzd/yvfb2za8kf
         uX8HbfQ3PZT9xsXSpWHyoTAvmL3yGeAjxVsVJabYLE7a84rbbXQg2VbT5nUnTZ9aIAdb
         jh/SkXJZQC0WZaIgojkhDJkg2JRtUZmipRN6OexG/OG6fpVPHrnEHkMEuSwbWG7Z+hn7
         IZJHv4NtlMruhZ0C04JPvFx487RgB3ptAIRwVqqlzuZBxQiZ4S2q0L7OwLvSBg1IeJUm
         SojQ==
X-Gm-Message-State: AOJu0Yz8GCI9q2vZoypAqIF77tPFoyBSVH6EeNx5dD+QkbcdcD2KDeIU
	m/bZsQSSbf9V66vv0QxskQkvpvcbrrCV2xjWY6j10Ls76Bq96dW7gzoJTSVgHg==
X-Google-Smtp-Source: AGHT+IGYIeQXlsMNeG/G/L6Vb6ceeWKlccDbA9iL8PUQMucFElhxUyLuQwRTAUUoILbcdfLswdfGWw==
X-Received: by 2002:a6b:dc16:0:b0:7c7:a437:74bd with SMTP id s22-20020a6bdc16000000b007c7a43774bdmr3105766ioc.2.1708789412733;
        Sat, 24 Feb 2024 07:43:32 -0800 (PST)
Received: from [10.211.55.3] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.googlemail.com with ESMTPSA id j3-20020a02cc63000000b0047434d0be66sm304570jaq.27.2024.02.24.07.43.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Feb 2024 07:43:32 -0800 (PST)
Message-ID: <cf5b2696-d7ca-40fc-856a-52f352cd270c@ieee.org>
Date: Sat, 24 Feb 2024 09:43:30 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "Ricardo B. Marliere" <ricardo@marliere.net>,
 Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20240219-device_cleanup-greybus-v1-1-babb3f65e8cc@marliere.net>
From: Alex Elder <elder@ieee.org>
In-Reply-To: <20240219-device_cleanup-greybus-v1-1-babb3f65e8cc@marliere.net>
X-Rspamd-Queue-Id: 53AEB3F1FD
X-Spamd-Bar: ---
X-Spamd-Result: default: False [-3.99 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	DMARC_POLICY_ALLOW(-0.50)[ieee.org,quarantine];
	R_DKIM_ALLOW(-0.20)[ieee.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.166.43:from];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWO(0.00)[2];
	DNSWL_BLOCKED(0.00)[73.228.159.35:received,209.85.166.43:from];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	DKIM_TRACE(0.00)[ieee.org:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: 4LT2RL4ZM3I6LJBCPEW5ML5YK7LMPJLK
X-Message-ID-Hash: 4LT2RL4ZM3I6LJBCPEW5ML5YK7LMPJLK
X-MailFrom: elder@ieee.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] greybus: constify the struct device_type usage
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/4LT2RL4ZM3I6LJBCPEW5ML5YK7LMPJLK/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit

On 2/19/24 6:40 AM, Ricardo B. Marliere wrote:
> Since commit aed65af1cc2f ("drivers: make device_type const"), the driver
> core can properly handle constant struct device_type. Move the
> greybus_hd_type, greybus_module_type, greybus_interface_type,
> greybus_control_type, greybus_bundle_type and greybus_svc_type variables to
> be constant structures as well, placing it into read-only memory which can
> not be modified at runtime.
> 
> Signed-off-by: Ricardo B. Marliere <ricardo@marliere.net>

This looks good to me.  Assuming it compiles cleanly:

Reviewed-by: Alex Elder <elder@linaro.org>

On another subject:

Johan might disagree, but I think it would be nice to make
the definitions of the Greybus device types as static (private)
and make the is_gb_host_device() etc. functions real functions
rather than static inlines in <linux/greybus.h>.

It turns out that all of the is_gb_*() functions are called only
from drivers/greybus/core.c; they could all be moved there rather
than advertising them in <linux/greybus.h>.

					-Alex


> ---
>   drivers/greybus/bundle.c    |  2 +-
>   drivers/greybus/control.c   |  2 +-
>   drivers/greybus/hd.c        |  2 +-
>   drivers/greybus/interface.c |  2 +-
>   drivers/greybus/module.c    |  2 +-
>   drivers/greybus/svc.c       |  2 +-
>   include/linux/greybus.h     | 12 ++++++------
>   7 files changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/greybus/bundle.c b/drivers/greybus/bundle.c
> index 84660729538b..a6e1cca06172 100644
> --- a/drivers/greybus/bundle.c
> +++ b/drivers/greybus/bundle.c
> @@ -166,7 +166,7 @@ static const struct dev_pm_ops gb_bundle_pm_ops = {
>   	SET_RUNTIME_PM_OPS(gb_bundle_suspend, gb_bundle_resume, gb_bundle_idle)
>   };
>   
> -struct device_type greybus_bundle_type = {
> +const struct device_type greybus_bundle_type = {
>   	.name =		"greybus_bundle",
>   	.release =	gb_bundle_release,
>   	.pm =		&gb_bundle_pm_ops,
> diff --git a/drivers/greybus/control.c b/drivers/greybus/control.c
> index 359a25841973..b5cf49d09df2 100644
> --- a/drivers/greybus/control.c
> +++ b/drivers/greybus/control.c
> @@ -436,7 +436,7 @@ static void gb_control_release(struct device *dev)
>   	kfree(control);
>   }
>   
> -struct device_type greybus_control_type = {
> +const struct device_type greybus_control_type = {
>   	.name =		"greybus_control",
>   	.release =	gb_control_release,
>   };
> diff --git a/drivers/greybus/hd.c b/drivers/greybus/hd.c
> index 72b21bf2d7d3..e2f3496bddc3 100644
> --- a/drivers/greybus/hd.c
> +++ b/drivers/greybus/hd.c
> @@ -116,7 +116,7 @@ static void gb_hd_release(struct device *dev)
>   	kfree(hd);
>   }
>   
> -struct device_type greybus_hd_type = {
> +const struct device_type greybus_hd_type = {
>   	.name		= "greybus_host_device",
>   	.release	= gb_hd_release,
>   };
> diff --git a/drivers/greybus/interface.c b/drivers/greybus/interface.c
> index 9ec949a438ef..a88dc701289c 100644
> --- a/drivers/greybus/interface.c
> +++ b/drivers/greybus/interface.c
> @@ -765,7 +765,7 @@ static const struct dev_pm_ops gb_interface_pm_ops = {
>   			   gb_interface_runtime_idle)
>   };
>   
> -struct device_type greybus_interface_type = {
> +const struct device_type greybus_interface_type = {
>   	.name =		"greybus_interface",
>   	.release =	gb_interface_release,
>   	.pm =		&gb_interface_pm_ops,
> diff --git a/drivers/greybus/module.c b/drivers/greybus/module.c
> index 36f77f9e1d74..7f7153a1dd60 100644
> --- a/drivers/greybus/module.c
> +++ b/drivers/greybus/module.c
> @@ -81,7 +81,7 @@ static void gb_module_release(struct device *dev)
>   	kfree(module);
>   }
>   
> -struct device_type greybus_module_type = {
> +const struct device_type greybus_module_type = {
>   	.name		= "greybus_module",
>   	.release	= gb_module_release,
>   };
> diff --git a/drivers/greybus/svc.c b/drivers/greybus/svc.c
> index 0d7e749174a4..4256467fcd35 100644
> --- a/drivers/greybus/svc.c
> +++ b/drivers/greybus/svc.c
> @@ -1305,7 +1305,7 @@ static void gb_svc_release(struct device *dev)
>   	kfree(svc);
>   }
>   
> -struct device_type greybus_svc_type = {
> +const struct device_type greybus_svc_type = {
>   	.name		= "greybus_svc",
>   	.release	= gb_svc_release,
>   };
> diff --git a/include/linux/greybus.h b/include/linux/greybus.h
> index 18c0fb958b74..5f9791fae3c0 100644
> --- a/include/linux/greybus.h
> +++ b/include/linux/greybus.h
> @@ -106,12 +106,12 @@ struct dentry *gb_debugfs_get(void);
>   
>   extern struct bus_type greybus_bus_type;
>   
> -extern struct device_type greybus_hd_type;
> -extern struct device_type greybus_module_type;
> -extern struct device_type greybus_interface_type;
> -extern struct device_type greybus_control_type;
> -extern struct device_type greybus_bundle_type;
> -extern struct device_type greybus_svc_type;
> +extern const struct device_type greybus_hd_type;
> +extern const struct device_type greybus_module_type;
> +extern const struct device_type greybus_interface_type;
> +extern const struct device_type greybus_control_type;
> +extern const struct device_type greybus_bundle_type;
> +extern const struct device_type greybus_svc_type;
>   
>   static inline int is_gb_host_device(const struct device *dev)
>   {
> 
> ---
> base-commit: b401b621758e46812da61fa58a67c3fd8d91de0d
> change-id: 20240219-device_cleanup-greybus-c97c1ef52458
> 
> Best regards,

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
