Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id A1368CF2C11
	for <lists+greybus-dev@lfdr.de>; Mon, 05 Jan 2026 10:29:17 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 658EA40145
	for <lists+greybus-dev@lfdr.de>; Mon,  5 Jan 2026 09:29:16 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	by lists.linaro.org (Postfix) with ESMTPS id C29713F835
	for <greybus-dev@lists.linaro.org>; Mon,  5 Jan 2026 09:29:13 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linaro.org header.s=google header.b=oNb3L5Ey;
	spf=pass (lists.linaro.org: domain of dan.carpenter@linaro.org designates 209.85.221.41 as permitted sender) smtp.mailfrom=dan.carpenter@linaro.org;
	dmarc=pass (policy=none) header.from=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-432777da980so4037737f8f.0
        for <greybus-dev@lists.linaro.org>; Mon, 05 Jan 2026 01:29:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767605353; x=1768210153; darn=lists.linaro.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3FOjzDY/r2U/Kq/8+NQu0xSKjWhumQpilnNpvJw2ez0=;
        b=oNb3L5EyClAllBcNY/wr+XIs69lMyKtZU2NwmjacyxErnK5OfNYeNy9L/JlST/OtYK
         AWY98ZR9OvB/JpUOva1JoOGOoJt1B2FNS+hYuV2B1LhLTPGYVmvrc960+qcEGgxV925a
         yyAe41y1QRwJbgnkMoA3op4LyNZQM82nAhKHAFe/2spkVy0lKmjzQxAmsEYJ59Al1wsS
         2XlEzUzHu6AbsOGW2TnPBH4ZCqIloCgNR00oJQm3oKhqw3J26gWqNvzC4W4puvXjWB9h
         q7sTABv8Lm88hw/ZhZ/MkXv/FodMPR1qjHBeJ4EdN6DvxJiXimhvJ1nfhA3X5QfyLfNI
         MagA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767605353; x=1768210153;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3FOjzDY/r2U/Kq/8+NQu0xSKjWhumQpilnNpvJw2ez0=;
        b=QVhj0muHM1qUjfSmECnh1Ykym0npBHrjvcrABRgm6qhadUYVDAwv8EpigekLBeeIbw
         Rj3av1uwqTbavqZTEU7IhFsfR1uYU3iF+HwUkvHF/JwXlPdsrTxlAwplGOSEn6HYMWQq
         bVZ+KQO09ayo+PBNFK/cpzP4/D5Qfe381LT/Zkm6t15skszuMl/s2PFBTAuVTZDcGPJb
         0HkhrEPw2HI9gksBD2mUzoAT2LFjWkU12G9nHzpp5eWxOYK8XwB5rbJ7zbsjY7/1Ppu5
         /jK4jJzbLroXqISVAGUm0qYkSSooNjVwx6BYRCm1+K5cHqvkNWAuSTxZlJx3vgTRswru
         aFdg==
X-Forwarded-Encrypted: i=1; AJvYcCUN+hL+ge6HtzbFhPcxrNUS/t54MUWTZJs29Bl6ZXvyds+Bliytb3t+W3jc1/SwlkBdfbFih3s/5s0pLQ==@lists.linaro.org
X-Gm-Message-State: AOJu0Yyv1LeUQaBRoDy2cnpBKMq5tce0q4GR9sg7JO5JSNKDKAHeD+QB
	N6szCecvg3si5acc/a/VEOC1iM5svU5WpadkAh+vsvAEWAIXlcGmJDOMA5Woqz9g7+Ll+A==
X-Gm-Gg: AY/fxX6BXZ8nPV8/fCRZr8x8CqZRhfkQexPbvMvMJdLN6csuZhhsouJvJRAdrEemZy9
	W26vtebZgzUJQbgjvhsLntxcQ2LyKM8ho7yCOObeHr5yyY0jzBdlDTIhNjIHIbmI23tFFWVbmZA
	LClPCIRiEbo/s3uGsRJazyuDHbo1uMUYYI8PwNNBd1fTJJulVk3EYnhQfPWly2DZI7MjPVQ9b7j
	ZQVdCwCW1EtphClDCuiqau6rYrIuf4bgkf2gaOKcJJMtdAR1nBJ8KehNeAU5q7oED1xehAUVgbH
	okwNQ4n2efAeh0yu/g4jBwcEDmptcEUjynPK/44i98Vsr2ZUFLuwNiWRIbogRMiul+eqPUBLl2p
	IYWSZCCu9jVh5aPKsoq2GvzPia7xim5yRkJkUuZAy1Jo4jXrM4eYlOOmQaCO4YUjCK9CnFutC3x
	WlyhzM30n+8qFvQ5IbT3/XH/DsQtI=
X-Google-Smtp-Source: AGHT+IGLRjvHkbD51sq0sAkqKxpj1rcyV+vQVTA74eAF94lRvk/+SSjX418hZaRMI0oM7tM6XrvOng==
X-Received: by 2002:a05:6000:24c4:b0:430:fc3a:fbce with SMTP id ffacd0b85a97d-4324e4c9d45mr74505993f8f.15.1767605352648;
        Mon, 05 Jan 2026 01:29:12 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eaa46c0sm99932867f8f.34.2026.01.05.01.29.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 01:29:12 -0800 (PST)
Date: Mon, 5 Jan 2026 12:29:09 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Khaled Saleh <khaled.saleh.req@gmail.com>
Message-ID: <aVuEZQ11i0gS_t7q@stanley.mountain>
References: <20251221194200.3734-1-khaled.saleh.req@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251221194200.3734-1-khaled.saleh.req@gmail.com>
X-Rspamd-Queue-Id: C29713F835
X-Spamd-Bar: ----
X-Spamd-Result: default: False [-4.00 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	ARC_NA(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.221.41:from];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_THREE(0.00)[4];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_HAS_DN(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	URIBL_BLOCKED(0.00)[linaro.org:dkim,linaro.org:from_smtp,linaro.org:from_mime,mail-wr1-f41.google.com:helo,mail-wr1-f41.google.com:rdns];
	DKIM_TRACE(0.00)[linaro.org:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: CB7BE4LBEHOOANBFYGI6ITQH6ZQMQKDB
X-Message-ID-Hash: CB7BE4LBEHOOANBFYGI6ITQH6ZQMQKDB
X-MailFrom: dan.carpenter@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: linux-staging@lists.linux.dev, greybus-dev@lists.linaro.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: split gb_audio_gb_get_topology() into helper functions
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/CB7BE4LBEHOOANBFYGI6ITQH6ZQMQKDB/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, Dec 21, 2025 at 09:42:00PM +0200, Khaled Saleh wrote:
> From: khaled <khaled.saleh.req@gmail.com>

Full name, please.

> 
> The gb_audio_gb_get_topology() function performs multiple distinct
> operations: retrieving the topology size, allocating the topology buffer,
> and fetching the topology data. A TODO comment in the file notes that
> this logic should be split into separate calls.
> 
> Introduce helper functions for each step and update
> gb_audio_gb_get_topology() to use them.
> 
> This improves readability and maintainability without changing behavior.
> 
> Signed-off-by: Khaled Saleh <khaled.saleh.req@gmail.com>
> ---
>  drivers/staging/greybus/audio_gb.c | 47 +++++++++++++++++++++++-------
>  1 file changed, 36 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/staging/greybus/audio_gb.c b/drivers/staging/greybus/audio_gb.c
> index 9d8994fdb41a..0d5109ec14f6 100644
> --- a/drivers/staging/greybus/audio_gb.c
> +++ b/drivers/staging/greybus/audio_gb.c
> @@ -9,36 +9,61 @@
>  #include "audio_codec.h"
>  
>  /* TODO: Split into separate calls */
> +static int gb_audio_topology_get_size(struct gb_connection *connection, u16 *size)

Use size_t for sizes.

> +{
> +	struct gb_audio_get_topology_size_response resp;
> +	int ret;
> +
> +	ret = gb_operation_sync(connection,
> +				GB_AUDIO_TYPE_GET_TOPOLOGY_SIZE,
> +				NULL, 0,
> +				&resp, sizeof(resp));
> +	if (ret)
> +		return ret;
> +
> +	*size = le16_to_cpu(resp.size);
> +
> +	return 0;
> +}
> +
> +static struct gb_audio_topology *gb_audio_topology_alloc(u16 size)

Same.

> +{
> +	if (size < sizeof(struct gb_audio_topology))
> +		return NULL;
> +
> +	return kzalloc(size, GFP_KERNEL);
> +}
> +
> +static int gb_audio_topology_fetch(struct gb_connection *connection,
> +				   struct gb_audio_topology *topo, u16 size)

Same.

It's fine for now since there is just one caller, but using anything
other that size_t for sizes is just asking for integer overflow bugs.

regards,
dan carpenter


_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
