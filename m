Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YHLdHVNnhGlK2wMAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Thu, 05 Feb 2026 10:48:03 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id DB325F1068
	for <lists+greybus-dev@lfdr.de>; Thu, 05 Feb 2026 10:48:02 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id B59943F820
	for <lists+greybus-dev@lfdr.de>; Thu,  5 Feb 2026 09:48:01 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	by lists.linaro.org (Postfix) with ESMTPS id F1DB93F799
	for <greybus-dev@lists.linaro.org>; Thu,  5 Feb 2026 09:47:57 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linaro.org header.s=google header.b=Q9jL6t18;
	spf=pass (lists.linaro.org: domain of rui.silva@linaro.org designates 209.85.218.47 as permitted sender) smtp.mailfrom=rui.silva@linaro.org;
	dmarc=pass (policy=none) header.from=linaro.org
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b8860d6251bso87353766b.3
        for <greybus-dev@lists.linaro.org>; Thu, 05 Feb 2026 01:47:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770284877; x=1770889677; darn=lists.linaro.org;
        h=in-reply-to:references:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A8L/5GVKN6SgP0V716Hd0o1e71oyUMMXvmVf3IuUxkA=;
        b=Q9jL6t18ZopSKm0ErGg2tjjdSEa3TY+zwfxZzEIyx9DTCh8HgyfxIVu8R0XBmOm19X
         zj292q5FxK9L3vWc+LUOFHKf9vyrAAKoKuSjVRIXdg0IgO87IU6SdD19mEGmDSVn7+iH
         JmdueS8ODvqsMLgs54UCupEU/lU0MzvngZ3MsOkPMZc5J6WoyPkPACTadRb5xe2Denv6
         bh+0vKGXxlD8cdJppo++5CmkqjSo/562xQOri8Q/Ba323qlKsi6TMT9BRwLbj4xm0jjZ
         q4lZfoTbvMcUUaa1Cnkl8hjjBFTFfOEpc+swDX7ggIP6eH66IrVj7k3MVhgLrPond9Lg
         KQNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770284877; x=1770889677;
        h=in-reply-to:references:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A8L/5GVKN6SgP0V716Hd0o1e71oyUMMXvmVf3IuUxkA=;
        b=WLSrzu5Gy86uohivnGGasUxgml5W6FarCxZ1ckCnwNPpzcHY7Nl+3yihUBWI7+fhWu
         9ynssT8NWeZK8E7oiklCeTYfUvxtLdnW5KIRjFA2tucnF5vUvL1Mlsw4NI5wd7A7wnyf
         AFkuCc+3IB0uhp5z0i4AYCShVy5ClmLLJKIo29XrK2CkVWtCSiIhWQPZAUR3TI3uMhcA
         eKrc2bFoLzvTkKrKIm7GgSoYP5wNSbYSk558mswxn8beWemMl89RNghgGQpYaqrxlVBr
         H+3NJyF0dVzjiuyOq1yaK4C/kJbHKKdewYYEzD7F6bwH8+kEuCrRVjjxOkiZgm2/JfE1
         GKEQ==
X-Forwarded-Encrypted: i=1; AJvYcCUkd7k15c+zZCKACYQAxLEqkZx1dAyNakMWhadWk/nGokl6M8DCAOxWbUSNo8iJvDouFh3Q1W3/hQft7g==@lists.linaro.org
X-Gm-Message-State: AOJu0Yxc6OMOkyzYQmmJPPukfk6qGiOt11WR0pBV16P1i6q+MQD7KyPQ
	OT9sTDhzPLi3STzOXZBsHBnpbwJyTPwp5b1wEgF2Fh4fVSfmhydWEP0zfQiG5wjtlhwDgA==
X-Gm-Gg: AZuq6aKJtXF5d+96VdL3BHft6C/SlqF6QVqjoDABCIFoDTygngqVjhBoJvbQcUoJBPn
	tf0NIoEaTSfe8P953KVFY4fouYiOJyE5OFYMTIlBNku7fEu9VAY4rM+IUQPMIRweM/siX/PYkR0
	ZEk1VwlguGWCWlt5BwjPAqhJ85ut0X268qO0dG/+vhBHg+yCIaJaRQWsu/+o8HgurOcW4XrIC6S
	TRw2+xBcor1QC7RZh3w6QmwBGIkjKL25Wd6Hu+IGn3OaPXS7PgjtOXvtK6/PDqUDOtPOyyQh+39
	x65PfmfnNzaKeZzC69pNiw5CSQ1BunZzE8qGvt7/7vZacc/G0HSpbf4GLwKa8gMqwDvhItukxET
	9qhrF9RJ6G5swZPYF1McVx7earH5XFHLkI2tmIfOAoCrcOynl+q7q8N8oUOwYZ2o7QuT5cS0++N
	ApSnzwtvDlwMzoVKR4KM5EWmQpSkeo2BmP+GZilgw=
X-Received: by 2002:a17:907:3ea8:b0:b83:1327:920d with SMTP id a640c23a62f3a-b8e9ec9179dmr398904666b.0.1770284876852;
        Thu, 05 Feb 2026 01:47:56 -0800 (PST)
Received: from localhost (a109-49-32-132.cpe.netcabo.pt. [109.49.32.132])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8ea00435fdsm202409366b.57.2026.02.05.01.47.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 01:47:56 -0800 (PST)
From: Rui Miguel Silva <rui.silva@linaro.org>
X-Google-Original-From: "Rui Miguel Silva" <rui.silva@linaro.com>
Mime-Version: 1.0
Date: Thu, 05 Feb 2026 09:47:55 +0000
Message-Id: <DG6XM4KTQQBU.3257ITEZ9ZF19@linaro.com>
To: "Rachit Dhar" <rchtdhr@gmail.com>, "Rui Miguel Silva" <rmfrfs@gmail.com>
References: <20260204183142.182785-1-rchtdhr@gmail.com>
In-Reply-To: <20260204183142.182785-1-rchtdhr@gmail.com>
X-Spamd-Bar: ---
Message-ID-Hash: MS3UZWZCBV6T2YV3YB6P3TDVYDD5PPJ2
X-Message-ID-Hash: MS3UZWZCBV6T2YV3YB6P3TDVYDD5PPJ2
X-MailFrom: rui.silva@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v3 4/4] staging: greybus: resolved checkpatch checks for light.c
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/MS3UZWZCBV6T2YV3YB6P3TDVYDD5PPJ2/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.51 / 15.00];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_SPF_ALLOW(-0.20)[+mx:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	NEURAL_SPAM(0.00)[0.995];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	R_DKIM_REJECT(0.00)[linaro.org:s=google];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:-];
	TAGGED_RCPT(0.00)[greybus-dev];
	RCPT_COUNT_SEVEN(0.00)[7];
	FROM_NEQ_ENVFROM(0.00)[rui.silva@linaro.org,greybus-dev-bounces@lists.linaro.org];
	DMARC_POLICY_ALLOW(0.00)[linaro.org,none];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linaro.org:helo,lists.linaro.org:rdns,linaro.org:email,linaro.com:mid]
X-Rspamd-Queue-Id: DB325F1068
X-Rspamd-Action: no action

Hey Rachit,
Thanks for the patch. And the sending corrections along the path.

On Wed Feb 4, 2026 at 6:31 PM WET, Rachit Dhar wrote:

> Added comment to mutex declarations, to resolve checkpatch.pl checks.
>
> Signed-off-by: Rachit Dhar <rchtdhr@gmail.com>
> ---
>  drivers/staging/greybus/light.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/staging/greybus/light.c b/drivers/staging/greybus/light.c
> index e509fdc715db..1f2faa6d545d 100644
> --- a/drivers/staging/greybus/light.c
> +++ b/drivers/staging/greybus/light.c
> @@ -37,7 +37,7 @@ struct gb_channel {
>  	bool				releasing;
>  	bool				strobe_state;
>  	bool				active;
> -	struct mutex			lock;
> +	struct mutex			lock; /* protects gb_channel->active */
>  };
>  
>  struct gb_light {
> @@ -59,7 +59,7 @@ struct gb_lights {
>  	struct gb_connection	*connection;
>  	u8			lights_count;
>  	struct gb_light		*lights;
> -	struct mutex		lights_lock;
> +	struct mutex		lights_lock; /* protects gb_lights->lights */
>  };
>  


This LGTM.

Acked-by: Rui Miguel Silva <rui.silva@linaro.org>

Cheers,
    Rui

>  static void gb_lights_channel_free(struct gb_channel *channel);
> -- 
> 2.43.0



_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
