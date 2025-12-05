Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 854C1CA6655
	for <lists+greybus-dev@lfdr.de>; Fri, 05 Dec 2025 08:26:49 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 780203F96E
	for <lists+greybus-dev@lfdr.de>; Fri,  5 Dec 2025 07:26:48 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	by lists.linaro.org (Postfix) with ESMTPS id 41E173F8EF
	for <greybus-dev@lists.linaro.org>; Fri,  5 Dec 2025 07:26:41 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linaro.org header.s=google header.b=rNuADlBd;
	spf=pass (lists.linaro.org: domain of dan.carpenter@linaro.org designates 209.85.128.46 as permitted sender) smtp.mailfrom=dan.carpenter@linaro.org;
	dmarc=pass (policy=none) header.from=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-47774d3536dso16548535e9.0
        for <greybus-dev@lists.linaro.org>; Thu, 04 Dec 2025 23:26:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764919600; x=1765524400; darn=lists.linaro.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1/xSk7k7y5ORewyP92d4zP5k+wuexOEfuZzjXOsxttE=;
        b=rNuADlBdpDq67lQfvujSj6E8Vfq2SyaXul/Qw0mzJEydiTWCC3o37unbOtoDZpQD0B
         OhIvjHEchjx8weg5U4DpvLP5aIM50V5yjbuwhjSlf1e3sk2BduqbZofmbQag7tpviPMT
         i/RtWFYjqDkOaRtsOLVOGsXq9D/4kmdYCzJiVnoWMBWgP7SEhTX/V5clfUuy0dxbxVSa
         XSQqHbkGJj7xMvkl0/Ad07Bc8DBF3v/b/PSAokTOaARKZ5XOurKfgWsiZUItWPq+apvG
         WqGiITOV+rdTbQ2o92QgUVJ8C+n0J9u+8n3Qe3du1aH8o906xcZf07ytZwK9uiBniu+o
         /uzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764919600; x=1765524400;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1/xSk7k7y5ORewyP92d4zP5k+wuexOEfuZzjXOsxttE=;
        b=bKQ7h9Zo27AmhDh7G5kBkehNkiSRLTm2DRj/W0KPhYDno1249gvcszwj5wCgh817dy
         VqsOnpcauZ8ZgENGIfujuT5TnV/4Br+IKOs5oia3uwvk3uLTAm7hU3rUBacGUN9SCG8Q
         6Mesz9xxwSSVx4ahBGQGn3uSg/CHcTChZZyW6Irdy/8HIMC/DFwFFf1A15DuGJl0zfTs
         ytGUTLQbeOLy8Ra9LeMCIA7sJ/wf/HRvlMkqZAFRZjyqlJPeORJu+uyXizb5z2Llw86g
         D1hgzb3RMn18IFsmJQUE/b3HgyBwL/O0y0aYddGBSfABXJS2QwqHeM/FXukoCbSGWYYy
         V/DA==
X-Forwarded-Encrypted: i=1; AJvYcCX6YR6RBb+IFPwZckUp5Q41zNjYE4ZkaR48XyBY1EZsDfO9+nzX+e2UdkU+0tTRyMwDw/04FLLlUy1Tqw==@lists.linaro.org
X-Gm-Message-State: AOJu0YxBiurbsEB7wi8toguZITIzhkYNXgDysDwIMcWMj5Vjint+b+FG
	QQxJPhnbDLAL7qh9IfGu4KjgBei8FbBq4Z/j25MZRMQu6Ql0jqMxs6tznX6JRftp6nYexg==
X-Gm-Gg: ASbGncuCUkWjMMAaWCiyN7UpyJZz5kHbByMkVaHF/q2dlY1U27jPuq3aRsh+IQt7Woj
	eN4i0g0GiPU43w4pqCRzzweWXtSBAA6/RbszP8IhGaUm3U6wAaZb83gZmKgOhK+HcCZKfdvV8Ab
	Y2ZoJimXs2PNDaLokNrIpgde9G/JMCydI6uO42UnAd1Ap3U/fBoRQFsOW7J2/DQ40FKkGx5fz+q
	BpQ5P+SwEW6nvRn8szEWSiSZCp0rq731VCx5loNxr1nT5IvzI6LbJaDK6SAlNboFnaN4UPSH8sZ
	xFsOJvlw0dNVQfzJELmI7KqKjmgfmkzEzqvLPqKK7hxFe50S14w0sVBz8s1OsQEjKwjY3I9P5Wp
	3ktWeaekGcw7A4ebm7k/9ruK32h4ZOtV5AcIh9i+c0ctFnfsekRVbhjS8S8MTyTmzjOXfZTYz9E
	thbJAwx1vm2pEJxil2
X-Google-Smtp-Source: AGHT+IF4zI+PS5QqylDs49iI5Q83p+mebfmgs63dSePFEMk3FtdfDXsG+qtXKiS/FoLXt0OZ9d72Eg==
X-Received: by 2002:a05:600c:4e89:b0:475:ddad:c3a9 with SMTP id 5b1f17b1804b1-4792eb438d0mr65416405e9.13.1764919600168;
        Thu, 04 Dec 2025 23:26:40 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4792b140cf4sm65734635e9.5.2025.12.04.23.26.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 23:26:39 -0800 (PST)
Date: Fri, 5 Dec 2025 10:26:36 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Julioccps <julio191096@gmail.com>
Message-ID: <aTKJLAZaPjEcS17l@stanley.mountain>
References: <20251204231110.65847-1-julio191096@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251204231110.65847-1-julio191096@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.00 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_HAS_DN(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.128.46:from];
	BLOCKLISTDE_FAIL(0.00)[196.207.164.177:server fail,209.85.128.46:server fail];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,linuxfoundation.org,lists.linaro.org,lists.linux.dev,vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_TLS_LAST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+]
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 41E173F8EF
X-Spamd-Bar: ----
Message-ID-Hash: Y3WUGJELIH3Z45TWJ2SMCBQ5WN7GN6KM
X-Message-ID-Hash: Y3WUGJELIH3Z45TWJ2SMCBQ5WN7GN6KM
X-MailFrom: dan.carpenter@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: hvaibhav.linux@gmail.com, johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v3] staging: greybus: arche-apb-ctrl: switch to device_property_read_bool
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/Y3WUGJELIH3Z45TWJ2SMCBQ5WN7GN6KM/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Dec 04, 2025 at 08:11:10PM -0300, Julioccps wrote:
> Switch from the deprecated of_property_read_bool() to the common
> device_property_read_bool() API. This makes the driver agnostic to
> the underlying firmware interface (DT or ACPI) and simplifies the
> logic.
> 
> Since the driver is no longer strictly dependent on Device Tree,
> include <linux/mod_devicetable.h> directly for the struct
> of_device_id definition, instead of relying on implicit inclusion
> via <linux/of_irq.h>, which has been removed as it is unused.
> 
> Also rename apb_ctrl_get_devtree_data() to apb_ctrl_get_fw_data()
> to better reflect the agnostic nature of the new implementation.
> 
> Signed-off-by: Julio Cesar Carvalho de Paula Souza <julio191096@gmail.com>

This doesn't match your From header.

> ---
> hanges in v3:
>   - Added version history (changelog) required by the subsystem maintainer.
> 
> Changes in v2:
>   - Updated the subject line to match the subsystem standard.
>   - Updated Signed-off-by to use full real name.
> 
>  drivers/staging/greybus/arche-apb-ctrl.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/staging/greybus/arche-apb-ctrl.c b/drivers/staging/greybus/arche-apb-ctrl.c
> index 90ab32638d3f..eea9648a461c 100644
> --- a/drivers/staging/greybus/arche-apb-ctrl.c
> +++ b/drivers/staging/greybus/arche-apb-ctrl.c
> @@ -10,13 +10,14 @@
>  #include <linux/delay.h>
>  #include <linux/gpio/consumer.h>
>  #include <linux/interrupt.h>
> -#include <linux/of_irq.h>
>  #include <linux/module.h>
>  #include <linux/pinctrl/consumer.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm.h>
> +#include <linux/property.h>
>  #include <linux/regulator/consumer.h>
>  #include <linux/spinlock.h>
> +#include <linux/mod_devicetable.h>
>  #include "arche_platform.h"
>  
>  static void apb_bootret_deassert(struct device *dev);
> @@ -314,7 +315,7 @@ static ssize_t state_show(struct device *dev,
>  
>  static DEVICE_ATTR_RW(state);
>  
> -static int apb_ctrl_get_devtree_data(struct platform_device *pdev,
> +static int apb_ctrl_get_fw_data(struct platform_device *pdev,
>  				     struct arche_apb_ctrl_drvdata *apb)
                                   ^^
This line needs to be indented differently now.

>  {
>  	struct device *dev = &pdev->dev;

regards,
dan carpenter
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
