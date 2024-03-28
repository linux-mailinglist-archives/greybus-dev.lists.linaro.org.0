Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 525C5890280
	for <lists+greybus-dev@lfdr.de>; Thu, 28 Mar 2024 16:00:38 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 19E5444381
	for <lists+greybus-dev@lfdr.de>; Thu, 28 Mar 2024 15:00:37 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	by lists.linaro.org (Postfix) with ESMTPS id F3EED40D25
	for <greybus-dev@lists.linaro.org>; Thu, 28 Mar 2024 15:00:34 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linaro.org header.s=google header.b="V/sAVv9k";
	dmarc=pass (policy=none) header.from=linaro.org;
	spf=pass (lists.linaro.org: domain of dan.carpenter@linaro.org designates 209.85.208.170 as permitted sender) smtp.mailfrom=dan.carpenter@linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2d700beb6beso14836441fa.2
        for <greybus-dev@lists.linaro.org>; Thu, 28 Mar 2024 08:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711638034; x=1712242834; darn=lists.linaro.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1wJgbtA/vjDhwvz63u9VWEaiKAUmcJOl/pw5kAYmOlA=;
        b=V/sAVv9kgnwQig43Bm9M21dY0mVRrEQWyQ6vN7CHkA4bLIa0kcvK0B3QwdrqVIO4xr
         hQcdrwp/AC8EAs4hZJKeEqeD6EwepJUIc+ofMYKqvnrzwV87KAleKVFcQ8WJBJ567urN
         iB7IY4Muzt0PGvQVZuUumlEGfY5hNeDlsGi1ZCVRZ4KH1dWUSeianCFRj1Uy3nwS7Cq6
         M2D0coLbnHI2bWL3Ommb9cFzK+F1lIf7enn1/1DJs4pNTuAA5EoctmQBQxzEMtZ6qfPn
         xVSWLNJDmvMTQq3qSGgkSjU26/BefhtjL3GJunbirpp/JVuDi++kz6M37Bxo9qIC7SZo
         CJ8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711638034; x=1712242834;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1wJgbtA/vjDhwvz63u9VWEaiKAUmcJOl/pw5kAYmOlA=;
        b=ZSKQt2xP0h31tAySQVVBMfkZlU3Axq6uqdmeboJi/F+eqZf3p9ld4UcE6tt9ulXGMP
         A6bYoXEqU813MxHUDExTvfOx5aWnNCvlyDxMWE5adhIzQQg0wue4CDuqa5ii7etO/Aaq
         6v6y8uNk+WTCZSfhzPSllFxiTa0YkyLlJ20RS9xme7E0B7xMlTpi78/uqp+rwFr0izYB
         2wI+7ewmmmLwTEATxAWUZwui64mNDRNaJn76dRJgvxJef8RpJAga8DaK+ROqjdgg707f
         /K0nDbTMsk5p+2MHac+eo+oSbTo6x+bJTe8aJlWJvACp4cvhH52CIGdLfwYqkQ0u1Pn4
         wKgw==
X-Forwarded-Encrypted: i=1; AJvYcCX8i+DDBLlw796EyRrgY7xUXIrkPlasPYIwwIdILFdTonD9WVIA8DXOM6o0d1Ln2dDP+PIhPE1cxBmJzTorim4DYOlYiliWBL2QYgSb
X-Gm-Message-State: AOJu0YxN4vEL23jo2O7aZa4tZcadfDIb6oS0vbeBGHtqkskUQDg5GDYi
	DbNqVmWYQ+VB053PrlVAhyjvOyLZDlKDCKcY44Ml8Rq5wh/0h9Xiel3zh4o6KO+t2A==
X-Google-Smtp-Source: AGHT+IGQ5CWKUqLKQ/deCqDvSGjzq/7ohPtTESkm+XyAfECW03YuhSnOZLJc5W2tTuXIQeRPB5tQuw==
X-Received: by 2002:a2e:9591:0:b0:2d4:2b05:a671 with SMTP id w17-20020a2e9591000000b002d42b05a671mr2299444ljh.32.1711638033575;
        Thu, 28 Mar 2024 08:00:33 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id d15-20020a056402400f00b0056c5395e581sm703497eda.70.2024.03.28.08.00.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 08:00:33 -0700 (PDT)
Date: Thu, 28 Mar 2024 18:00:29 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Arnd Bergmann <arnd@kernel.org>
Message-ID: <76214105-94ae-4540-8511-e9e2ff6d257e@moroto.mountain>
References: <20240328140512.4148825-1-arnd@kernel.org>
 <20240328140512.4148825-11-arnd@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240328140512.4148825-11-arnd@kernel.org>
X-Rspamd-Queue-Id: F3EED40D25
X-Spamd-Bar: --------
X-Spamd-Result: default: False [-8.00 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.208.170:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,linuxfoundation.org,arndb.de,wanadoo.fr,lists.linaro.org,lists.linux.dev];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: VLCE4M7TDHUXOYR772ICERSITOVLBXT3
X-Message-ID-Hash: VLCE4M7TDHUXOYR772ICERSITOVLBXT3
X-MailFrom: dan.carpenter@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: linux-kernel@vger.kernel.org, Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 10/11] staging: greybus: change strncpy() to strscpy()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/VLCE4M7TDHUXOYR772ICERSITOVLBXT3/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Mar 28, 2024 at 03:04:54PM +0100, Arnd Bergmann wrote:
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> This is from randconfig testing with random gcc versions, a .config to
> reproduce is at https://pastebin.com/r13yezkU
> ---
>  drivers/staging/greybus/fw-management.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/greybus/fw-management.c b/drivers/staging/greybus/fw-management.c
> index 3054f084d777..35bfdd5f32d2 100644
> --- a/drivers/staging/greybus/fw-management.c
> +++ b/drivers/staging/greybus/fw-management.c
> @@ -303,13 +303,13 @@ static int fw_mgmt_backend_fw_update_operation(struct fw_mgmt *fw_mgmt,
>  	struct gb_fw_mgmt_backend_fw_update_request request;
>  	int ret;
>  
> -	strncpy(request.firmware_tag, tag, GB_FIRMWARE_TAG_MAX_SIZE);
> +	ret = strscpy(request.firmware_tag, tag, GB_FIRMWARE_TAG_MAX_SIZE);

This needs to be strscpy_pad() or it risks an information leak.

>  
>  	/*
>  	 * The firmware-tag should be NULL terminated, otherwise throw error and
                                      ^^^^^^^^^^^^^^^^
These comments are out of date.

>  	 * fail.
>  	 */
> -	if (request.firmware_tag[GB_FIRMWARE_TAG_MAX_SIZE - 1] != '\0') {
> +	if (ret == -E2BIG) {
>  		dev_err(fw_mgmt->parent, "backend-update: firmware-tag is not NULL terminated\n");
                                                          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
More out of date prints.

regards,
dan carpenter

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
