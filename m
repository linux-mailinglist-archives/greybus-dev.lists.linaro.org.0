Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E81FBD9D13
	for <lists+greybus-dev@lfdr.de>; Tue, 14 Oct 2025 15:53:13 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id E46B445D1E
	for <lists+greybus-dev@lfdr.de>; Tue, 14 Oct 2025 13:53:11 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	by lists.linaro.org (Postfix) with ESMTPS id A025E4447C
	for <greybus-dev@lists.linaro.org>; Tue, 14 Oct 2025 13:53:07 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linaro.org header.s=google header.b=gB8O9mh5;
	dmarc=pass (policy=none) header.from=linaro.org;
	spf=pass (lists.linaro.org: domain of dan.carpenter@linaro.org designates 209.85.128.52 as permitted sender) smtp.mailfrom=dan.carpenter@linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-46e34bd8eb2so54755175e9.3
        for <greybus-dev@lists.linaro.org>; Tue, 14 Oct 2025 06:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760449986; x=1761054786; darn=lists.linaro.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vYLX/V/IYNpEsTQWc+fcqDgIUy63VyLnT/A3MBhbEHY=;
        b=gB8O9mh5JpMmCxpui6XL1Po+12b0wZwp8d9vf3I5wRuuzxuSQiYbyTr7hiKqEekt2z
         EUizqXMJdWehi4vNeW0sQLtwVw3oZ3wZbMKhQGhrU6KNg61etq+kfGJlBdmZBx8TGiIt
         Ve/vOWe3ifF1kaIZbOC2RALS4KeOoX+BNUCf+cUqcLXUOIgGsmj4HR1cdxXhnvP+U7ZY
         52TeMxy+vED+kJlOYDCNfKPLHVZ/quOgJpwxyDJsCXMdMWuAOf70EULhwRv5NCH1iokh
         GFrgUf/ip1MIqn3Ar8vcIMtWD6KITL0gaLJPtT33Sq5w3ceEN9G48D63zKESHqSFXIvJ
         w+Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760449986; x=1761054786;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vYLX/V/IYNpEsTQWc+fcqDgIUy63VyLnT/A3MBhbEHY=;
        b=RrLMS4Ket5tYlizGAGkDPlixuuOiAQ0hVW5o9U8AAAZ6GndBzwR/wdu2hvhdu8Cyl+
         LZ5qutsVmTcMWBLC466GaGCj6S/wNR4CJwfePkF/tfDQ43I/naGfkOkP8Hp62AZQX+vV
         84v904z7Fy0/Vr38KhEwugin3Fl5hjfQCeO2MYVShI3gCnPZYBfEz1lkfauI0o6pM3jo
         7r2MbU7JooiaPk6/yfSMRwuzBpEoXRrfmIrxc4UH44O/7cc04fL/FeCC4h8Egnc6Qhvy
         bU6tuKju8PBwR043WqZT5WcgadJxJ9PCxbyHGoZvAyagkJDnhcInb+uLaxF5ieo+FhNY
         By7g==
X-Forwarded-Encrypted: i=1; AJvYcCUmpMrxVi9d6rF3APdmg4qFDx8akXMPa6KQZ7JsE1AAHzf5jIridsrSUEJGcLjRBtQtnsqyM0wMYRbYMQ==@lists.linaro.org
X-Gm-Message-State: AOJu0YyDv8pxKao8QBq1xsRg86U+s+EMHScO6DP+hkGxgH6UGKXSh/WE
	uFqEwM8N1DBZOLxjv9WBXAOOKjS4AakuTByTEudJlHDgcdv+Bdv3BaVbiKCwyulMLIVCVA==
X-Gm-Gg: ASbGncujRP0sPAUTr+1D4bLH0MYcbCKMnshVYNroJz/2FV/iHOIxD5VB36Wt2JF8reg
	EnfpEOl0YUe3epZO/HRE9wA+F7ozP0lQOG2DSTVCHuyLw1q1hIzBTo75Xcf2AgC5lV1d+CeaCg+
	I3Z0dJ1XlfeqpJYMuef7lbXMSetDHj9JA5nmSYvj6hzFf3/Oa8+HAYtyqt6a68Wutz+igSMF1ID
	Kmw3NVUDSmAeyBL2aK4E++8bqwaRNvrzkg2XlDWNMISpnQjYJJKm+vOjtJMUuxCIgHVNtKxrFFq
	/8G6rt0a1+3lz0r9DNd8MiUS8MhcTvyBDwTmOreQpuVIw4Ci0grBvbldH946GYNHlaNqZCz2hln
	VOAeeEw9FQkgqC+NiU93/czl2XqQ7SGQiS/fd9ad2ZFl2Thj86W9JHqfJ4ntGvA==
X-Google-Smtp-Source: AGHT+IFcYBoVH6SZ1b0n1fUVs59heTV+uMc9my9gJaVg1Bkdl7LM1WLOakMGVQ2yKdbkJej4zbdLaA==
X-Received: by 2002:a05:600c:4ed4:b0:45d:5c71:769a with SMTP id 5b1f17b1804b1-46fa9b08be6mr157473195e9.26.1760449986537;
        Tue, 14 Oct 2025 06:53:06 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-46fb483c7e0sm244106135e9.7.2025.10.14.06.53.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 06:53:06 -0700 (PDT)
Date: Tue, 14 Oct 2025 16:53:02 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
Message-ID: <aO5VvrKTswmfO-n9@stanley.mountain>
References: <20251014134148.2597178-1-vivek.balachandhar@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251014134148.2597178-1-vivek.balachandhar@gmail.com>
X-Rspamd-Queue-Id: A025E4447C
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.50 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.128.52:from];
	NEURAL_HAM(-0.00)[-1.000];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[9];
	URIBL_BLOCKED(0.00)[linaro.org:dkim];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[linaro.org:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: ODBBIWRGTUKW3IYU3M7GJ3HH2L23PXEO
X-Message-ID-Hash: ODBBIWRGTUKW3IYU3M7GJ3HH2L23PXEO
X-MailFrom: dan.carpenter@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: johan@kernel.org, elder@kernel.org, schopin@ubuntu.com, me@abhy.me, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: documentation: replace strncpy() with strscpy_pad()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/ODBBIWRGTUKW3IYU3M7GJ3HH2L23PXEO/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Oct 14, 2025 at 01:41:48PM +0000, Vivek BalachandharTN wrote:
> strncpy() does not guarantee NUL-termination and is deprecated for
> NUL-terminated strings. Replace it with strscpy_pad(), which guarantees
> NUL-termination and zero-pads the remaining bytes, matching the fixed-size
> firmware tag semantics.
> 
> Signed-off-by: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
> ---
>  .../greybus/Documentation/firmware/firmware.c        | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/staging/greybus/Documentation/firmware/firmware.c b/drivers/staging/greybus/Documentation/firmware/firmware.c
> index 3b35ef6d4adb..deac8584841b 100644
> --- a/drivers/staging/greybus/Documentation/firmware/firmware.c
> +++ b/drivers/staging/greybus/Documentation/firmware/firmware.c

This is sample user space code so the strscpy_pad() isn't available.  It
will break the compile.

regards,
dan carpenter

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
