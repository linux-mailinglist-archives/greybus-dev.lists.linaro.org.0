Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CE4989CCFD
	for <lists+greybus-dev@lfdr.de>; Mon,  8 Apr 2024 22:38:57 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 1BD3B43FA5
	for <lists+greybus-dev@lfdr.de>; Mon,  8 Apr 2024 20:38:56 +0000 (UTC)
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
	by lists.linaro.org (Postfix) with ESMTPS id B2EF840F24
	for <greybus-dev@lists.linaro.org>; Mon,  8 Apr 2024 20:38:53 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=google.com header.s=20230601 header.b=yO0iqqLz;
	dmarc=pass (policy=reject) header.from=google.com;
	spf=pass (lists.linaro.org: domain of justinstitt@google.com designates 209.85.166.43 as permitted sender) smtp.mailfrom=justinstitt@google.com
Received: by mail-io1-f43.google.com with SMTP id ca18e2360f4ac-7d5ee54dcecso56190839f.0
        for <greybus-dev@lists.linaro.org>; Mon, 08 Apr 2024 13:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712608733; x=1713213533; darn=lists.linaro.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=66EhmBXE+6opbYU7Qf+U0TLJ3Vt1siSvg3UxG+2mUhg=;
        b=yO0iqqLzF5M3ujLu+CCdK0eZtY7TrqLdEnF0Fp1wOkJjySp4ruTyPNIPi4e4P2q1GT
         KyL7/2ZRpJYFQaYzBBUq2vs4qHtzRBK5XBEbQWJHTHReW0NBbn6neP/LZ1vYIP3MpiGw
         LHmvMVnao9VVxuT1W5f4lnWltL98vb2Fg0+ATvEIVcaaTGe0Q6M3UOiThuM6P026cYAd
         eHij/t3hvgqH2y162Kde2OettJ/9xe7XlSQ6qHAnb1KUXHaj4CCAe3wL1OFrmSCgTeCZ
         CQxiMJBQ0zqoSoiwNeLOD8J4MEAsGPaYjy+M3uO21v0rVDDWpl84gw9cGRa9YIWUu8YT
         1qrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712608733; x=1713213533;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=66EhmBXE+6opbYU7Qf+U0TLJ3Vt1siSvg3UxG+2mUhg=;
        b=VTrgr7HAKB6DjQEWJBnwc/Mmq6GAM68ZB/+oE2ugTx33+TkYl3vXCjm/HY9VumeVkr
         ni2dfZoVHjJTb+oa8353+pa+uqrYN3kfedfYT/m9+uouMTU2qAXoV0Qe9ogW58R+B91H
         mjscGOaBoqrZaThKAVdngTU212Rtv0PZdZNhY71cm6dtVxC6PNJJcWZz7nYMBff2cWA0
         IzP5rFnAntrxaFSQgylFh3XHAl6tWzlGAjTDznx9g3u25cAB4GQho1jjeLtNoLsSInAL
         UAVwzvCeOUTBv7Tz0Ul1lVEP1+/5D4XytMKTVoGxf0qeQ+tylfN5l86d+AmEHKXd6pb2
         Ag0g==
X-Forwarded-Encrypted: i=1; AJvYcCXG42ptaQ+/btCTBiEQZUT28srXMkFPXZpv3/OPYpBi3VSBN6WD5zKf41O9jGKx1c+ZA3pOQfdy0bRo+/ncq8VTo/g65uQ9pT+KLbh2
X-Gm-Message-State: AOJu0YxBkQEN7/q9CnFE0yjH4lFxQFgnibCXKsURMwYKxvA5BmLLt11C
	5v4jqOpuM+tu0AwerWqh7F4F5iMUGQeZrCfMmwzyn6BHjHO5AxuZm2tYCK+aZg==
X-Google-Smtp-Source: AGHT+IE345TzGH9Fq0etBCi6wkGO3vYGKyR4fYGiq6aa+SdZJ1rKU5+HgSIED7L9Bjx9H4TLIj8esA==
X-Received: by 2002:a05:6602:4898:b0:7d5:f78f:ab1c with SMTP id ee24-20020a056602489800b007d5f78fab1cmr3626178iob.2.1712608733081;
        Mon, 08 Apr 2024 13:38:53 -0700 (PDT)
Received: from google.com (30.64.135.34.bc.googleusercontent.com. [34.135.64.30])
        by smtp.gmail.com with ESMTPSA id bv24-20020a056638449800b0047be26df380sm2795121jab.2.2024.04.08.13.38.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Apr 2024 13:38:52 -0700 (PDT)
Date: Mon, 8 Apr 2024 20:38:49 +0000
From: Justin Stitt <justinstitt@google.com>
To: Arnd Bergmann <arnd@kernel.org>
Message-ID: <xuqmx35li5pwktklh2rds7zqmsieletfzhkerdvw2agv5zjpnb@2qr5oh7ktdv3>
References: <20240408194821.3183462-1-arnd@kernel.org>
 <20240408194821.3183462-3-arnd@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240408194821.3183462-3-arnd@kernel.org>
X-Rspamd-Queue-Id: B2EF840F24
X-Spamd-Bar: -------
X-Spamd-Result: default: False [-7.50 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,kernel.org,linaro.org,arndb.de,wanadoo.fr,lists.linaro.org,lists.linux.dev,vger.kernel.org];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.166.43:from];
	RCPT_COUNT_SEVEN(0.00)[11];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_TWO(0.00)[2];
	URIBL_BLOCKED(0.00)[arndb.de:email];
	DKIM_TRACE(0.00)[google.com:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: EOTA7PT47CTHSJMNSVGB5ETB5ODOGBVI
X-Message-ID-Hash: EOTA7PT47CTHSJMNSVGB5ETB5ODOGBVI
X-MailFrom: justinstitt@google.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, Dan Carpenter <dan.carpenter@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 3/3] [v2] staging: greybus: change strncpy() to strscpy_pad()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/EOTA7PT47CTHSJMNSVGB5ETB5ODOGBVI/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

On Mon, Apr 08, 2024 at 09:48:11PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> gcc-10 warns about a strncpy() that does not enforce zero-termination:
> 
> In file included from include/linux/string.h:369,
>                  from drivers/staging/greybus/fw-management.c:9:
> In function 'strncpy',
>     inlined from 'fw_mgmt_backend_fw_update_operation' at drivers/staging/greybus/fw-management.c:306:2:
> include/linux/fortify-string.h:108:30: error: '__builtin_strncpy' specified bound 10 equals destination size [-Werror=stringop-truncation]
>   108 | #define __underlying_strncpy __builtin_strncpy
>       |                              ^
> include/linux/fortify-string.h:187:9: note: in expansion of macro '__underlying_strncpy'
>   187 |  return __underlying_strncpy(p, q, size);
>       |         ^~~~~~~~~~~~~~~~~~~~
> 
> For some reason, I cannot reproduce this with gcc-9 or gcc-11, and I only
> get a warning for one of the four related strncpy()s, so I'm not
> sure what's going on.
> 
> Change all four to strscpy_pad(), which is the safest replacement here,
> as it avoids ending up with uninitialized stack data in the tag name.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

This patch helps out with [1].

Reviewed-by: Justin Stitt <justinstitt@google.com>

> ---
> v2
>  - use strscpy_pad()
>  - use two-argument form
>  - change all four instances, not just the one that produced the warning
> ---
>  drivers/staging/greybus/fw-management.c | 12 +++++-------
>  1 file changed, 5 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/staging/greybus/fw-management.c b/drivers/staging/greybus/fw-management.c
> index 3054f084d777..a47385175582 100644
> --- a/drivers/staging/greybus/fw-management.c
> +++ b/drivers/staging/greybus/fw-management.c
> @@ -123,8 +123,7 @@ static int fw_mgmt_interface_fw_version_operation(struct fw_mgmt *fw_mgmt,
>  	fw_info->major = le16_to_cpu(response.major);
>  	fw_info->minor = le16_to_cpu(response.minor);
>  
> -	strncpy(fw_info->firmware_tag, response.firmware_tag,
> -		GB_FIRMWARE_TAG_MAX_SIZE);
> +	strscpy_pad(fw_info->firmware_tag, response.firmware_tag);
>  
>  	/*
>  	 * The firmware-tag should be NULL terminated, otherwise throw error but
> @@ -153,7 +152,7 @@ static int fw_mgmt_load_and_validate_operation(struct fw_mgmt *fw_mgmt,
>  	}
>  
>  	request.load_method = load_method;
> -	strncpy(request.firmware_tag, tag, GB_FIRMWARE_TAG_MAX_SIZE);
> +	strscpy_pad(request.firmware_tag, tag);
>  
>  	/*
>  	 * The firmware-tag should be NULL terminated, otherwise throw error and
> @@ -249,8 +248,7 @@ static int fw_mgmt_backend_fw_version_operation(struct fw_mgmt *fw_mgmt,
>  	struct gb_fw_mgmt_backend_fw_version_response response;
>  	int ret;
>  
> -	strncpy(request.firmware_tag, fw_info->firmware_tag,
> -		GB_FIRMWARE_TAG_MAX_SIZE);
> +	strscpy_pad(request.firmware_tag, fw_info->firmware_tag);
>  
>  	/*
>  	 * The firmware-tag should be NULL terminated, otherwise throw error and
> @@ -303,13 +301,13 @@ static int fw_mgmt_backend_fw_update_operation(struct fw_mgmt *fw_mgmt,
>  	struct gb_fw_mgmt_backend_fw_update_request request;
>  	int ret;
>  
> -	strncpy(request.firmware_tag, tag, GB_FIRMWARE_TAG_MAX_SIZE);
> +	ret = strscpy_pad(request.firmware_tag, tag);
>  
>  	/*
>  	 * The firmware-tag should be NULL terminated, otherwise throw error and
>  	 * fail.
>  	 */
> -	if (request.firmware_tag[GB_FIRMWARE_TAG_MAX_SIZE - 1] != '\0') {
> +	if (ret == -E2BIG) {
>  		dev_err(fw_mgmt->parent, "backend-update: firmware-tag is not NULL terminated\n");
>  		return -EINVAL;
>  	}
> -- 
> 2.39.2
> 
>

Link: https://github.com/KSPP/linux/issues/90 [1]

Thanks
Justin
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
