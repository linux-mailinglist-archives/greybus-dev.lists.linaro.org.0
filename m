Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id A0436BFBC43
	for <lists+greybus-dev@lfdr.de>; Wed, 22 Oct 2025 14:04:01 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id C45E73F7B5
	for <lists+greybus-dev@lfdr.de>; Wed, 22 Oct 2025 12:04:00 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	by lists.linaro.org (Postfix) with ESMTPS id 340593F77C
	for <greybus-dev@lists.linaro.org>; Wed, 22 Oct 2025 12:03:56 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linaro.org header.s=google header.b=JQ9FSZ+C;
	dmarc=pass (policy=none) header.from=linaro.org;
	spf=pass (lists.linaro.org: domain of dan.carpenter@linaro.org designates 209.85.128.46 as permitted sender) smtp.mailfrom=dan.carpenter@linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-47118259fd8so42571595e9.3
        for <greybus-dev@lists.linaro.org>; Wed, 22 Oct 2025 05:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761134635; x=1761739435; darn=lists.linaro.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=r0gYph7SovwhcGw7EVJ3qVkwV+hfXw0N2ivsENsGig4=;
        b=JQ9FSZ+CkHKGrT51keDoyCxZahXkYiZyuf68BENF1fW9tHLP21K46a0Pp18WT70KFq
         Abr+GhhfTYcNOHPrPiswNyNcj4WYlRQfDFWD7xP+XmSZP8OxDgV8oL/tr2G6wZ1FJ7/n
         0h2JJuliItLX2+mOou5se1qeoFkLUfrkQKtsVtrB2Yoc08CfC40UXDOd5k/vJXhXvKTL
         kRWwkWFfyGq5zsgjJuQ5rZj3++3VOnBE5f04ca1ZceBET8EargDnNEDSIyciaEHvgbi0
         OTl/4K+d+EIXK0iCLESx1Xs6T3lx4Aa0+fuu7oYVAfTvKdJSBjIFYb83Nh+cUmzZUhEG
         5TYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761134635; x=1761739435;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r0gYph7SovwhcGw7EVJ3qVkwV+hfXw0N2ivsENsGig4=;
        b=D0sRR7/p8PuBBF8U8WksT8UN/nsNeKNbMgD5BMMW2cntv8C1UOatxYULe+OL8q1wFh
         kvibrSlI1ZzFhYfaisXK6sAf4coUYuefnLpBvslKIfeItu5Gdn6toMKqc99pPJNECthw
         FPasMWVvJKlh2kPEVaTDT4o3HUiMyHCkB0n41TQqv3k4C/3rnmWDSaT9Fao3x9x2gJDO
         j/M1qSo2rKxeZBFoT0zgo+xh9JYtBbLGb+rflJ1Re82Yq47ySpKnJnl5H6QFIY8X3d+b
         mYScaiG+8GNTbDXFmWLW3gG0lW9ElaUShLlawxqi5xvGz359xtUOywoRuvkDGfMXCDxb
         d6Uw==
X-Forwarded-Encrypted: i=1; AJvYcCUzaS+PTbAfYtO5zGLl+dVI/3kfYBi2SbPxxgb14kQXhqfJYC/aKKvxYX5R8uIs9+AE4p/NEGt6VbSaBQ==@lists.linaro.org
X-Gm-Message-State: AOJu0YyXM/+CmU4/oHmkq4a50eKvMoD2wRlq/u8i/xXP1ltOSfCUuGeX
	GNb1ZZhg+5FqOiJss1ncis8mmcnNiYHjWKsVNTAKJXEkNxEiHeQIQ+FQ0f/8lGaAW2j7oA==
X-Gm-Gg: ASbGncuOT2SVT6wjkKCilfCfIpNvaHsOduKUKOi491Ff9xMP2C3vWNXV1rOlIFhGsr8
	G2/XqLAqTpRfC5h5NC7+Cy6rqWOi9wI9Nt/5Y0DJtGJWRlXaEz2HN4Rff+GMCLkWeTgPot5wwLc
	TR3y7isLLPgP9XSsKNP+8QsAZyyShS+dggPhUH71L3oEwEzO8Avat3CVOhFld+1tr9Q6xO1cvNs
	b27iUbzK0eL19tHBwKxUI++A3zcGB7DcyaId8CGGOHBNfitPcgWdStCIXLZ45XtzqLEucJWvZCT
	gTz+MhJ7ktehSbJ92MxBUAC+h9IPuZ2fs7ZgUWw1lUch/fuLXesWpwMCo1sIprfcaopQ5sjsljS
	MhpBStze6fNTSsT5PdeAGQPt9ZCmyapTEvNzsu3EDKlZqyJeKhwJ1vQira33iG6wlorE83Xdyk2
	SOIKF93BHB/WZITVY0
X-Google-Smtp-Source: AGHT+IEY2TgyTGfGNhNiFczm1vB6rimaMhMz5RZu+zN6ZnmkRbUDl8IcuOYqyXEzu158hZENQ3zc/A==
X-Received: by 2002:a05:600c:4f89:b0:46e:3edc:2811 with SMTP id 5b1f17b1804b1-4711787750dmr137799265e9.14.1761134634976;
        Wed, 22 Oct 2025 05:03:54 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-475c41ca845sm42531015e9.0.2025.10.22.05.03.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 05:03:54 -0700 (PDT)
Date: Wed, 22 Oct 2025 15:03:51 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ayush Singh <ayush@beagleboard.org>
Message-ID: <aPjIJw3ahPxnDE5Q@stanley.mountain>
References: <20251022-gb-fw-v1-1-183b18500cd5@beagleboard.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251022-gb-fw-v1-1-183b18500cd5@beagleboard.org>
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 340593F77C
X-Spamd-Bar: ----
X-Spamd-Result: default: False [-4.00 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.128.46:from];
	RCVD_IN_DNSWL_NONE(0.00)[209.85.128.46:from];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	DNSWL_BLOCKED(0.00)[196.207.164.177:received];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+]
X-Rspamd-Action: no action
Message-ID-Hash: SM3UTEVXSLYHBI4OD5TIKMZY66KPOWEK
X-Message-ID-Hash: SM3UTEVXSLYHBI4OD5TIKMZY66KPOWEK
X-MailFrom: dan.carpenter@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Deepak Khatri <lorforlinux@beagleboard.org>, Robert Nelson <robertcnelson@beagleboard.org>, Dhruva Gole <d-gole@ti.com>, Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: fw-download: Fix find firmware req
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/SM3UTEVXSLYHBI4OD5TIKMZY66KPOWEK/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Oct 22, 2025 at 12:57:57PM +0530, Ayush Singh wrote:
> diff --git a/drivers/staging/greybus/fw-download.c b/drivers/staging/greybus/fw-download.c
> index 9a09bd3af79ba0dcf7efa683f4e86246bcd473a5..06f1be8f3121e29551ea8416d5ee2666339b2fe3 100644
> --- a/drivers/staging/greybus/fw-download.c
> +++ b/drivers/staging/greybus/fw-download.c
> @@ -159,7 +159,7 @@ static int exceeds_release_timeout(struct fw_request *fw_req)
>  
>  /* This returns path of the firmware blob on the disk */
>  static struct fw_request *find_firmware(struct fw_download *fw_download,
> -					const char *tag)
> +					const char *tag, const char *format)
>  {
>  	struct gb_interface *intf = fw_download->connection->bundle->intf;
>  	struct fw_request *fw_req;
> @@ -178,10 +178,17 @@ static struct fw_request *find_firmware(struct fw_download *fw_download,
>  	}
>  	fw_req->firmware_id = ret;
>  
> -	snprintf(fw_req->name, sizeof(fw_req->name),
> -		 FW_NAME_PREFIX "%08x_%08x_%08x_%08x_%s.tftf",
> -		 intf->ddbl1_manufacturer_id, intf->ddbl1_product_id,
> -		 intf->vendor_id, intf->product_id, tag);
> +	if (strnlen(format, GB_FIRMWARE_FORMAT_MAX_SIZE) == 0) {

Change this to:

	if (format[0] == '\0') {

In the caller, the assumption that format is at least
GB_FIRMWARE_FORMAT_MAX_SIZE makes sense but in this function it
doesn't make sense.


> +		snprintf(fw_req->name, sizeof(fw_req->name),
> +			 FW_NAME_PREFIX "%08x_%08x_%08x_%08x_%s",
> +			 intf->ddbl1_manufacturer_id, intf->ddbl1_product_id,
> +			 intf->vendor_id, intf->product_id, tag);
> +	} else {
> +		snprintf(fw_req->name, sizeof(fw_req->name),
> +			 FW_NAME_PREFIX "%08x_%08x_%08x_%08x_%s.%s",
> +			 intf->ddbl1_manufacturer_id, intf->ddbl1_product_id,
> +			 intf->vendor_id, intf->product_id, tag, format);
> +	}
>  
>  	dev_info(fw_download->parent, "Requested firmware package '%s'\n",
>  		 fw_req->name);
> @@ -225,7 +232,7 @@ static int fw_download_find_firmware(struct gb_operation *op)
>  	struct gb_fw_download_find_firmware_request *request;
>  	struct gb_fw_download_find_firmware_response *response;
>  	struct fw_request *fw_req;
> -	const char *tag;
> +	const char *tag, *format;
>  
>  	if (op->request->payload_size != sizeof(*request)) {
>  		dev_err(fw_download->parent,

We have changed the sizeof(*request) but we haven't changed
->payload_size so how can this ever be true?  Did you test this change?

regards,
dan carpenter

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
