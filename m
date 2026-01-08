Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id CA705D024AB
	for <lists+greybus-dev@lfdr.de>; Thu, 08 Jan 2026 12:05:15 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id E91FA40164
	for <lists+greybus-dev@lfdr.de>; Thu,  8 Jan 2026 11:05:14 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	by lists.linaro.org (Postfix) with ESMTPS id 590B43F8EC
	for <greybus-dev@lists.linaro.org>; Thu,  8 Jan 2026 11:05:13 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linaro.org header.s=google header.b=QpFU3wH8;
	spf=pass (lists.linaro.org: domain of rui.silva@linaro.org designates 209.85.128.46 as permitted sender) smtp.mailfrom=rui.silva@linaro.org;
	dmarc=pass (policy=none) header.from=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-47795f6f5c0so18984585e9.1
        for <greybus-dev@lists.linaro.org>; Thu, 08 Jan 2026 03:05:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767870312; x=1768475112; darn=lists.linaro.org;
        h=in-reply-to:references:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7wi0cLxVYTkjjMZXxZy4zeQFvgVDMeogFnmSnZc8m8I=;
        b=QpFU3wH8OldYGwQ+XqlYC+7ACjmA1552yXg4qrgHAGLXmfhUmDsAtHd3RKjbfZJOWn
         u60s9m6m0nVdUrW9iWZkOrl37EB1Gn9PmUKr9pn8ie4rgjerqNYDZo1Wek2ctKIrxcNJ
         ZGL+oH/VkSGClOyPcDURJbM7hkXRPXxb4zE7v95v7fM5ZFd0pRftNNehJhlDBs3rPHEY
         g6rgjBBiL0n/mahCHg6FMxddsPriz45mQM9Z3H0v2DF/D7ZWE+Iv1l62KMuqiOJe4uRb
         jvtnZDFbhOgEt6Fee/M+e6EPJxxxOGprNtCpIDaCz3HaQ/HF8DcztDClRbEPR/MOnCN8
         tGuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767870312; x=1768475112;
        h=in-reply-to:references:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7wi0cLxVYTkjjMZXxZy4zeQFvgVDMeogFnmSnZc8m8I=;
        b=eUEQuPqzGglO6m9/IcTDyi2QTT6M2FFNvJwE+YLdmff5QcfVWr6ZENhsYXTWUAyzJ+
         tWNWBZfKUurkNvoE/nv9ltxqCirD5drML8zcO08SH5WzP5KazyZcM7gDgfYUfFgcvalX
         H9shBsjz5yl8hqpINYLDBOV4qAnKBst6ncVIKFIbQA7Gt0hLAWXYXc4ql9RY1eUPaljD
         iOignJSc8G6k532t+iSb6NMPg9OrBDFLEK0g+rGjdT8Uy2hQZsVZfrXJ/GBLdeo1jdO4
         wxz4D6bzjXf4OpcYuUvJa/hb2Gb5LxkW0GtL7NnzwxSv0zYoqD9vP+CWyKlVTsHXLi7f
         3KXQ==
X-Gm-Message-State: AOJu0YxmaAvFNFCzpXzs8XkA8NxGzSu+9giLWAv95f3HKvWKt7FR2kqC
	JTQ7gVW3jWIialJ4RBJPT4qbSa57gVSP//JnGlsMVvoaBBwXSGLTZ6xeED/56AL9AZ+y5Q==
X-Gm-Gg: AY/fxX4jwvm0uVNOyKGtxFuRCrMv0EfNE9PtmCBuxNkOQaablq7BgfsdEp3vkX+y0fS
	aTGiHsvcHNiEi2SvZ1yt0keo8ym84or6xbOSkebAd8PEOMT9SzIweRz6+TfFMiR+GkyXoGOHfRS
	Z5El5lZJ08qfqXwcPG2ZCRNtdEss2icdzRFvj+Ts9EKR9t0NFdqHWEltbk2lRcNYmeIkMeTLhnf
	/9h6IUkOABMnA6Cp4rTabbK2BkDhAcCGVyrRqtdq4AnV9mhvzmFjNmzxVqec3WNlo7mp90H9GUR
	AAlXIayJbt/GQpsDhygeVS7OyFh1h27qRzCVk5DBe4+l7NsqKuxfWRbKku0AEJx3n555kBFzUpR
	0AzAq6RY/46mF8mJBqwDItIfqYdLFdQD+zxCQUwC5FJtyCagdW7cUjz6WZBujZtts0KkIsgIwiS
	AUuBprwolWpAABgruJ0EIOQjPFXjc4zMLXOr/lN6DxQBcAUGTYS+R2
X-Google-Smtp-Source: AGHT+IHv7g9k/MI4TfuXMCEZW93m6zGf7qxNLrOVEx9WLQYfZAR+01N633qUWhbfiDUgojUqOvYRPg==
X-Received: by 2002:a05:600c:46cb:b0:47a:810f:1d06 with SMTP id 5b1f17b1804b1-47d84b26da4mr67559795e9.4.1767870312264;
        Thu, 08 Jan 2026 03:05:12 -0800 (PST)
Received: from localhost (a109-48-201-233.cpe.netcabo.pt. [109.48.201.233])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d8636cb0dsm41520205e9.0.2026.01.08.03.05.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 03:05:12 -0800 (PST)
From: Rui Miguel Silva <rui.silva@linaro.org>
X-Google-Original-From: "Rui Miguel Silva" <rui.silva@linaro.com>
Mime-Version: 1.0
Date: Thu, 08 Jan 2026 11:05:09 +0000
Message-Id: <DFJ5Q0E4QQ0F.1A6G2J04HJNH1@linaro.com>
To: "Chaitanya Mishra" <chaitanyamishra.ai@gmail.com>, <rmfrfs@gmail.com>,
 <johan@kernel.org>, <elder@kernel.org>, <gregkh@linuxfoundation.org>
References: <20260108103700.15384-1-chaitanyamishra.ai@gmail.com>
 <20260108104947.23767-1-chaitanyamishra.ai@gmail.com>
In-Reply-To: <20260108104947.23767-1-chaitanyamishra.ai@gmail.com>
X-Rspamd-Queue-Id: 590B43F8EC
X-Spamd-Bar: ---
X-Spamd-Result: default: False [-3.50 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	URIBL_BLOCKED(0.00)[conf.name:url,linaro.org:dkim,linaro.org:from_smtp,linaro.org:email,linaro.org:from_mime,linaro.com:mid,mail-wm1-f46.google.com:helo,mail-wm1-f46.google.com:rdns];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,linuxfoundation.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	DNSWL_BLOCKED(0.00)[209.85.128.46:from,109.48.201.233:received];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.128.46:from];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: PLQH32PRN4HSWRXTKXVF4KW2BX3BJS5Y
X-Message-ID-Hash: PLQH32PRN4HSWRXTKXVF4KW2BX3BJS5Y
X-MailFrom: rui.silva@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v2] staging: greybus: lights: avoid NULL deref
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/PLQH32PRN4HSWRXTKXVF4KW2BX3BJS5Y/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hey Chaitanya,
Thanks for the patch.

On Thu Jan 8, 2026 at 10:49 AM WET, Chaitanya Mishra wrote:

> gb_lights_light_config() stores channel_count before allocating the
> channels array. If kcalloc() fails, gb_lights_release() iterates the
> non-zero count and dereferences light->channels, which is NULL.
>
> Allocate channels first and only then publish channels_count so the
> cleanup path can't walk a NULL pointer.

Good catch, going through the error path, does looks this fix the issue.

But you need to add the changes between versions bellow --  and maybe a
link to the first version.

Reviewed-by: Rui Miguel Silva <rui.silva@linaro.org>

Cheers,
    Rui
>
> Fixes: 2870b52bae4c ("greybus: lights: add lights implementation")
> Signed-off-by: Chaitanya Mishra <chaitanyamishra.ai@gmail.com>
> ---
>  drivers/staging/greybus/light.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/staging/greybus/light.c b/drivers/staging/greybus/light.c
> index e509fdc715db..38c233a706c4 100644
> --- a/drivers/staging/greybus/light.c
> +++ b/drivers/staging/greybus/light.c
> @@ -1008,14 +1008,18 @@ static int gb_lights_light_config(struct gb_lights *glights, u8 id)
>  	if (!strlen(conf.name))
>  		return -EINVAL;
>  
> -	light->channels_count = conf.channel_count;
>  	light->name = kstrndup(conf.name, NAMES_MAX, GFP_KERNEL);
>  	if (!light->name)
>  		return -ENOMEM;
> -	light->channels = kcalloc(light->channels_count,
> +	light->channels = kcalloc(conf.channel_count,
>  				  sizeof(struct gb_channel), GFP_KERNEL);
>  	if (!light->channels)
>  		return -ENOMEM;
> +	/*
> +	 * Publish channels_count only after channels allocation so cleanup
> +	 * doesn't walk a NULL channels pointer on allocation failure.
> +	 */
> +	light->channels_count = conf.channel_count;
>  
>  	/* First we collect all the configurations for all channels */
>  	for (i = 0; i < light->channels_count; i++) {
> -- 
> 2.50.1 (Apple Git-155)



_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
