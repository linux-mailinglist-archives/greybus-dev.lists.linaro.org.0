Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 2831589D2CA
	for <lists+greybus-dev@lfdr.de>; Tue,  9 Apr 2024 09:04:27 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 00B8A43FBF
	for <lists+greybus-dev@lfdr.de>; Tue,  9 Apr 2024 07:04:26 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	by lists.linaro.org (Postfix) with ESMTPS id DF5D8400D7
	for <greybus-dev@lists.linaro.org>; Tue,  9 Apr 2024 07:04:23 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linaro.org header.s=google header.b=bJPAPPIV;
	dmarc=pass (policy=none) header.from=linaro.org;
	spf=pass (lists.linaro.org: domain of dan.carpenter@linaro.org designates 209.85.218.49 as permitted sender) smtp.mailfrom=dan.carpenter@linaro.org
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a51beae2f13so295245666b.1
        for <greybus-dev@lists.linaro.org>; Tue, 09 Apr 2024 00:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712646263; x=1713251063; darn=lists.linaro.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZO+G8vYwqEif2MQQep31dNkOjqakaMIvdbgiCkuB6BI=;
        b=bJPAPPIVZfrNwMHa1RrZw/Tm3fNZ4DOs2VsaNyS0HcQ0Qgr1WOno26F7vszF4i6Aei
         XfyXwoWsKbYpFtfD5ssbNAq1KbXTArDr1f4avoyEAiDQgKso9kYINPUE/0nqdRoFxool
         NMCyOcZUWDD73nBVdL7cNUgisA4iKALq43hU7sR8A45eifNgfJHYbv7E1iLaQKAXY64L
         jlRVbSgVvWfeIMUI5E8CE2JtAsy23960LcnTDzTJhbDvwUnuMF9THkFvtJFOlxXtsnN6
         YIv2kSzl+PQ/Q/HjR4f3129ALumlQCL9jRSNGGafKq4BhJOWLhZistHY/WJ3qNG4VvTo
         wY9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712646263; x=1713251063;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZO+G8vYwqEif2MQQep31dNkOjqakaMIvdbgiCkuB6BI=;
        b=xViE0cN9kIHGFBvXmsFk5NT+7LcWyOa4Wn7QXai5+Xt5kdHhGS3D20o/gZ4NMzG0J8
         JZEjS2k0pR+osXrQaHTlx4VSkXUJYJ0V4U6HT1BJ3tLnZOj23oT2Sib1ljwyfgWrdHMQ
         xlrnOs8OSvJZspFBGmfpBxOK7NkQ5acSw3c/MIceJm2UeMgkbO59SYc8sXj9OxECOFUv
         h1s9/MWwLZYSt2Bjh5Z3rTsTg1JQqtMbGfHsh616deKoXm0r7vv8vRcF1U4bbSk9tuOc
         AmFmMQAJV3y9h/4j5LT8bY5m3Wn3u96Cn6Kwzr1+bX0ps3V+u0CIWlvnsOTDUVh1dgc2
         ZE8w==
X-Forwarded-Encrypted: i=1; AJvYcCVO68du4aakqFqZp4G0gvN2O9ezoibkmzpklM8mk7A6E4rqnu5+HxWQCPfnpR9krvFtdEBigN553WVLes7PCero1uTkgUWbqinRwWCJ
X-Gm-Message-State: AOJu0Yz1R3uMm6/LU8yEaq88hXL+nXm72yjwJRDRL/DNjLO+u5npXx6R
	GMJjGO1wF3zngkhCXdRoYbaLkEtI6CLuDYV/kS/HEHCy0W4G/JwxNlUATokhz+W6Wg==
X-Google-Smtp-Source: AGHT+IEJR0mpYHfVzK+X/mS3qDum9gkPCn+raThHT7VInTnvN2rmMEEmTyHQC1FpsccQ9/zUzab77g==
X-Received: by 2002:a17:907:948d:b0:a4d:f5d4:fb02 with SMTP id dm13-20020a170907948d00b00a4df5d4fb02mr8230339ejc.51.1712646262666;
        Tue, 09 Apr 2024 00:04:22 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id ak2-20020a170906888200b00a51dccd16d9sm1716392ejc.99.2024.04.09.00.04.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Apr 2024 00:04:21 -0700 (PDT)
Date: Tue, 9 Apr 2024 10:04:17 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Arnd Bergmann <arnd@kernel.org>
Message-ID: <514e5aa2-851b-4846-93f1-51f972d782b3@moroto.mountain>
References: <20240408194821.3183462-1-arnd@kernel.org>
 <20240408194821.3183462-3-arnd@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240408194821.3183462-3-arnd@kernel.org>
X-Rspamd-Queue-Id: DF5D8400D7
X-Spamd-Bar: --------
X-Spamd-Result: default: False [-8.10 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[99.99%];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.218.49:from];
	URIBL_BLOCKED(0.00)[linaro.org:dkim,linaro.org:email,arndb.de:email];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,kernel.org,google.com,arndb.de,wanadoo.fr,lists.linaro.org,lists.linux.dev,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: MWBKO363CA2LKCQCDNQC6GM6RSQ7C56G
X-Message-ID-Hash: MWBKO363CA2LKCQCDNQC6GM6RSQ7C56G
X-MailFrom: dan.carpenter@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, Justin Stitt <justinstitt@google.com>, Arnd Bergmann <arnd@arndb.de>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 3/3] [v2] staging: greybus: change strncpy() to strscpy_pad()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/MWBKO363CA2LKCQCDNQC6GM6RSQ7C56G/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

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
> ---
> v2
>  - use strscpy_pad()
>  - use two-argument form
>  - change all four instances, not just the one that produced the warning

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
