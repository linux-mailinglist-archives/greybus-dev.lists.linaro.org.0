Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id B4EEDADF7E9
	for <lists+greybus-dev@lfdr.de>; Wed, 18 Jun 2025 22:42:23 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 7A61344670
	for <lists+greybus-dev@lfdr.de>; Wed, 18 Jun 2025 20:42:22 +0000 (UTC)
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	by lists.linaro.org (Postfix) with ESMTPS id ACC2E44037
	for <greybus-dev@lists.linaro.org>; Wed, 18 Jun 2025 20:42:18 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linaro.org header.s=google header.b="e9Ji/qtd";
	spf=pass (lists.linaro.org: domain of dan.carpenter@linaro.org designates 209.85.210.46 as permitted sender) smtp.mailfrom=dan.carpenter@linaro.org;
	dmarc=pass (policy=none) header.from=linaro.org
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-73a01a7bee7so42053a34.1
        for <greybus-dev@lists.linaro.org>; Wed, 18 Jun 2025 13:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750279338; x=1750884138; darn=lists.linaro.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hYufF9gbGHCLXN7Cc7t3rq/6SWdHhk4SLqkzSCs6BiI=;
        b=e9Ji/qtde37v30yT4TPpEhoW6Zvc6Ye5RE7n4QYsee0aOZfi9u5scbemjQEgnpiYwr
         wa/JjRHkIDDWsd7r1BL3DdKUdEe2L0tQu7elL+41LuZftbRpW3yDSFyYYnP2j3Htp++r
         OR6uNtIill30XdI+8jIA02+C2uD58b6z7+BzAJyNeCk/+IjVBcCkDmPy5a5cvB+ymdFL
         JFucFJdHPiVJd4Lg3r1kWa/yMKUvxzf1pZEOXX52FmVEM9opzAcaeQpvzD1HKT0wjHR0
         eFpmf1SEFawl90E0V2ifhmwEhEb7e3Jv6/88h7T6+gSt8vkgX4q/+rkvZSv2omqJU+VZ
         70tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750279338; x=1750884138;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hYufF9gbGHCLXN7Cc7t3rq/6SWdHhk4SLqkzSCs6BiI=;
        b=C53PUaU2AMuii8snSySfS+rbS1OlCwSnvU0/R36A050CDY0Yco5QPcv1E02UPHkvcB
         uMcPlyxLjQUzgrt6w3ImalXHaDrnTh8UvIz76194PiStHuvPW/M5T4Qw9MnWcwZqUewU
         oJ2Ui6vHFh/2jFp38LwmjvCnHVMognuBFOZMkV4eOJqD4vtO9GxvH3w6ncx0PBD7K1TZ
         AAAUefcu/v60SLRiMXxX08JNCShrpnfx9dBCFqFSROnScwOVPwP7tLe2q3ZyrJZwhbFi
         X1FX+dcLmJ4XLYtgbf8cnUlZ0NJyA3W2RVzKY1uwTojWli+0dDKsFsV31CUGK15b6w+V
         CPlQ==
X-Forwarded-Encrypted: i=1; AJvYcCUUycjWsmlCDXkI0h048XmqqVgAl/4NEQxp8iyc2m9KbuOma4QMvdjPfTZXdjdNpZP+FIbpQrARpiIDlw==@lists.linaro.org
X-Gm-Message-State: AOJu0Yyh575LqqoAultEjnsxYG0GZxyqU3mL+QUiizButZcbHNDxWtzd
	aMv6necicPr2r5sk1o7K7IlxMZJq61M3pv8LahITG5/FrAUvOqlH/iCBeIfPPX0UUg+cCQ==
X-Gm-Gg: ASbGncuDx66BnRc9k1JeHFp3UQGBwAjoZca6vMZJLfzZ86uUod4XquBAAg4d1BF8mgA
	v1A2PnYuLZtvVCAmLCm2ixbDNCtm44XWqP2sUD6QqEKlUhFbUXLw9AsaYdPdN3a3aXN5WE+ELHC
	ri4+7PZGPQ/yZOiIz2MKeebh2D4wHCT7cirlfGX/YqCHOjgKNs1Tqsprkg0COIbtTxGF267X5R8
	brYPAHZFzNwGd2hrLNcr03yKeqrkOzXAxAwrCKGt2PUOVupijeofrHE7oQhuiy81vwDbu6F9Kmn
	nPjitp1++rQf4U9jdYyADRxWibzTIOxqvUPkqHbMEYV1C4Ip+ncx/Wke5/5yQfKDdUXJSA0OvEj
	XrWtw
X-Google-Smtp-Source: AGHT+IGzzeXqvvtMYEhgelf1zxaiR/pha/QAgFAlvhTzf3pfuLBytIh1fL2ehaLfaCgrcdK94vSXtA==
X-Received: by 2002:a05:6830:8209:b0:72a:10ec:3542 with SMTP id 46e09a7af769-73a36318969mr11536449a34.13.1750279338012;
        Wed, 18 Jun 2025 13:42:18 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:1b3b:c162:aefa:da1b])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73a28403ed0sm2124977a34.26.2025.06.18.13.42.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 13:42:17 -0700 (PDT)
Date: Wed, 18 Jun 2025 23:42:15 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Pranav Tyagi <pranav.tyagi03@gmail.com>
Message-ID: <29717a11-8867-4a28-81a6-2d847b254042@suswa.mountain>
References: <20250617125137.24503-1-pranav.tyagi03@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250617125137.24503-1-pranav.tyagi03@gmail.com>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Spamd-Result: default: False [-2.60 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.210.46:from];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	URIBL_BLOCKED(0.00)[suswa.mountain:mid,linaro.org:dkim,mail-ot1-f46.google.com:rdns,mail-ot1-f46.google.com:helo];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	DWL_DNSWL_BLOCKED(0.00)[linaro.org:dkim];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: ACC2E44037
X-Spamd-Bar: --
Message-ID-Hash: 64IXBV4ZZJPYTLBTSQL2M2UKEUYBYKNR
X-Message-ID-Hash: 64IXBV4ZZJPYTLBTSQL2M2UKEUYBYKNR
X-MailFrom: dan.carpenter@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: johan@kernel.org, elder@kernel.org, vireshk@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] greybus: firmware: use strscpy, fix tag size
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/64IXBV4ZZJPYTLBTSQL2M2UKEUYBYKNR/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Jun 17, 2025 at 06:21:37PM +0530, Pranav Tyagi wrote:
> Increase the size of firmware_tag arrays in the following structs from
> GB_FIRMWARE_U_TAG_MAX_SIZE to GB_FIRMWARE_U_TAG_MAX_SIZE + 1 to
> accommodate null termination:
> 	- fw_mgmt_ioc_intf_load_and_validate
> 	- fw_mgmt_ioc_get_backend_version
> 	- fw_mgmt_ioc_backend_fw_update
> 	- fw_mgmt_ioc_get_intf_version
> 
> Replace strncpy() with strscpy() to ensure proper null termination as
> firmware_tag is interpreted as a null-terminated string
> and printed with %s.
> 
> Signed-off-by: Pranav Tyagi <pranav.tyagi03@gmail.com>
> ---
>  .../greybus/Documentation/firmware/firmware.c        | 12 ++++++------
>  drivers/staging/greybus/greybus_firmware.h           |  8 ++++----
>  2 files changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/staging/greybus/Documentation/firmware/firmware.c b/drivers/staging/greybus/Documentation/firmware/firmware.c
> index 765d69faa9cc..3b4061f4b34a 100644
> --- a/drivers/staging/greybus/Documentation/firmware/firmware.c
> +++ b/drivers/staging/greybus/Documentation/firmware/firmware.c
> @@ -63,8 +63,8 @@ static int update_intf_firmware(int fd)
>  	intf_load.major = 0;
>  	intf_load.minor = 0;
>  
> -	strncpy((char *)&intf_load.firmware_tag, firmware_tag,
> -		GB_FIRMWARE_U_TAG_MAX_SIZE);
> +	strscpy((char *)&intf_load.firmware_tag, firmware_tag,
> +		GB_FIRMWARE_U_TAG_MAX_SIZE + 1);


This is in the Documentation/ directory.  It's sample userspace
code.  Userspace code doesn't have strscpy() so this won't
compile.

regards,
dan carpenter

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
