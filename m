Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id C0688B0459E
	for <lists+greybus-dev@lfdr.de>; Mon, 14 Jul 2025 18:38:47 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id A4163450AA
	for <lists+greybus-dev@lfdr.de>; Mon, 14 Jul 2025 16:38:46 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	by lists.linaro.org (Postfix) with ESMTPS id EB5E9440CE
	for <greybus-dev@lists.linaro.org>; Mon, 14 Jul 2025 16:38:34 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=JD8xucix;
	spf=pass (lists.linaro.org: domain of rmfrfs@gmail.com designates 209.85.128.50 as permitted sender) smtp.mailfrom=rmfrfs@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-45611a6a706so8375355e9.1
        for <greybus-dev@lists.linaro.org>; Mon, 14 Jul 2025 09:38:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752511114; x=1753115914; darn=lists.linaro.org;
        h=in-reply-to:references:to:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nA6MOwgCp6FTYVinfvEZJR7VSvHLCjeqeD7Gs1ZsFHc=;
        b=JD8xucixEhrvYcqib/cz5oPmGzoxMMBZ+Dp1wRrzcjAZWrk0LkugBtu++Z+vzEQcOi
         8VBR3EvH2jNZYOkLO4rnCfF9C9z31PWl8uSnm7bs/cwMhFhwPNfwhupfX7dlq8QHUqnZ
         SvPOpm1BK3QfSTpd+VEKek7mREep79lJhjPFuVGKbxX+ahqllctbSeq2UuXFMRjLt6j0
         HzcLSxRwQYq04aFuL6Pg1VcWDoFbF/64pNfdIgY3Ed6uEVJptBZc/jRqPsJkF3IpyjoY
         nDxreTqmu47OUYXE9U7mpUAlVvFsHxVWt6Q2yJbz3A+w8FqWC1Lu86C77HQhMtDqEmM/
         KwEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752511114; x=1753115914;
        h=in-reply-to:references:to:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nA6MOwgCp6FTYVinfvEZJR7VSvHLCjeqeD7Gs1ZsFHc=;
        b=fO5XQBXubZjL65HRptPNMsZP83edgDAsy/Ml7nFQOMre+rdB0hE1/abWo5nQvnARxq
         OptrAlIDMb3odxUViazMhyrd3U0mvfc9zeEbffiWzx1LaRDWyYrbXB4CuS9bqwJgvKtf
         mp4lX+vkRsTNQ2N/KnIy1B8I4lnPd3EXL1uFooFV/HkiYzoBN33sTaQAXJ5mzHVIbBfv
         NJsB1zfYcseeM9VjkKflpvfFqWO+7vT8FnItD57WS38J0w4isTZy7hVA4G9nIOc5UXs2
         qkoBZq1gP9ioE3zjG2SEMdKryoK19NszgCGaiL8L3GabimIWMe7OyAmAtoe6ehvxMyU/
         wbxQ==
X-Forwarded-Encrypted: i=1; AJvYcCXHCMeW680bAjxjcRpTd1RK5z/sSf/VfuTWLUQt1+/d+mVPOnvXh97QxBQ5tDfxqbkldm/Fp85Y4+9qMw==@lists.linaro.org
X-Gm-Message-State: AOJu0YwiTc79kF9B0O8Jyfn2O4Wb79wHOy4ZUss0qBTvwb24znemF52L
	+/s1yNL6hWuGuGcvE3WjMF1VHioDgEsLHlip/MNeUjki3eWT2X3+ZcbI
X-Gm-Gg: ASbGnctkcQhJKEAveQMiS0PAZXuhAzzSF6DQKE0FZBPq98QaECDzUQNR+YlXubUSHPB
	X7g5Oh/bm11brMs0XGXS+GYP85F4USkyD3dVEwkIIfuywaZMgAmy9LmfgvUxHyCtkaqyDSIXOXW
	hK0/AMDzoZHRewHQ9SrDQXC4ev1NKPjliDbAWa4W3zdM+mWo3+Eps/4juQGJcRdzIAGIhFLGVwa
	LmcjpQeRUZPSyBeG37cqBHV87YIjFNToBJ9CATiLqMRr8PJJ1eIBQ4hYatPZVAR4e2j9poZEAKA
	p5w7xSL6RnVvty/iogM28m5muYOkTqjUoZ4zFbPL2uEi4ibHrXVtZ0A6GjEYiSV7XQanEYp/0nG
	L/HIgnxY9bqnPboxiWImz1DD27HO6dZ0ygO4faxkkwBXtiHGRFw==
X-Google-Smtp-Source: AGHT+IH3FzHWgfO64SorIO2LSrTeSaITLBr9pADAESGyIjq06fDfQg9wHeJoPO/Fp0S4R0e2GAEolg==
X-Received: by 2002:a05:600c:5304:b0:456:207e:fd83 with SMTP id 5b1f17b1804b1-456207efef8mr27541745e9.4.1752511113555;
        Mon, 14 Jul 2025 09:38:33 -0700 (PDT)
Received: from localhost (a95-94-245-170.cpe.netcabo.pt. [95.94.245.170])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4560538da14sm80523135e9.23.2025.07.14.09.38.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 09:38:32 -0700 (PDT)
From: Rui Miguel Silva <rmfrfs@gmail.com>
X-Google-Original-From: "Rui Miguel Silva" <rui.silva@linaro.com>
Mime-Version: 1.0
Date: Mon, 14 Jul 2025 17:38:31 +0100
Message-Id: <DBBXCAEMM5ZO.GTKVMMR2XDJ7@linaro.com>
To: "Akhil Varkey" <akhilvarkey@disroot.org>,
 <greybus-dev@lists.linaro.org>, <linux-staging@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>, <rmfrfs@gmail.com>, <johan@kernel.org>,
 <elder@kernel.org>, <gregkh@linuxfoundation.org>
References: <20250714135606.41671-1-akhilvarkey@disroot.org>
In-Reply-To: <20250714135606.41671-1-akhilvarkey@disroot.org>
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: EB5E9440CE
X-Spamd-Bar: ---
X-Spamd-Result: default: False [-3.50 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[disroot.org,lists.linaro.org,lists.linux.dev,vger.kernel.org,gmail.com,kernel.org,linuxfoundation.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	DNSWL_BLOCKED(0.00)[95.94.245.170:received];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.128.50:from];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_IN_DNSWL_NONE(0.00)[209.85.128.50:from]
X-Rspamd-Action: no action
Message-ID-Hash: 36YDXZXL56GX24E2Q2LBGRDZN5AFJZBP
X-Message-ID-Hash: 36YDXZXL56GX24E2Q2LBGRDZN5AFJZBP
X-MailFrom: rmfrfs@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: ~lkcamp/patches@lists.sr.ht, koike@igalia.com
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: power_supply fix alignment
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/36YDXZXL56GX24E2Q2LBGRDZN5AFJZBP/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hey Akhil,
Thanks for your patch.

All looks good with the exception of a small nit...

On Mon Jul 14, 2025 at 2:56 PM WEST, Akhil Varkey wrote:

> Fix checkpatch check "CHECK:Alignment should match open parenthesis"
>
> Signed-off-by: Akhil Varkey <akhilvarkey@disroot.org>
> ---
>
> Hello, This is my first patch, I appreciate any feedbacks. Thanks!!

Welcome, and continue...

> ---
>  drivers/staging/greybus/power_supply.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/staging/greybus/power_supply.c b/drivers/staging/greybus/power_supply.c
> index 2ef46822f676..a484c0ca058d 100644
> --- a/drivers/staging/greybus/power_supply.c
> +++ b/drivers/staging/greybus/power_supply.c
> @@ -324,7 +324,7 @@ static struct gb_power_supply_prop *get_psy_prop(struct gb_power_supply *gbpsy,
>  }
>  
>  static int is_psy_prop_writeable(struct gb_power_supply *gbpsy,
> -				     enum power_supply_property psp)
> +				 enum power_supply_property psp)
>  {
>  	struct gb_power_supply_prop *prop;
>  
> @@ -493,7 +493,7 @@ static int gb_power_supply_description_get(struct gb_power_supply *gbpsy)
>  	if (!gbpsy->model_name)
>  		return -ENOMEM;
>  	gbpsy->serial_number = kstrndup(resp.serial_number, PROP_MAX,
> -				       GFP_KERNEL);
> +					GFP_KERNEL);
>  	if (!gbpsy->serial_number)
>  		return -ENOMEM;
>  
> @@ -546,7 +546,7 @@ static int gb_power_supply_prop_descriptors_get(struct gb_power_supply *gbpsy)
>  	}
>  
>  	gbpsy->props = kcalloc(gbpsy->properties_count, sizeof(*gbpsy->props),
> -			      GFP_KERNEL);
> +			       GFP_KERNEL);
>  	if (!gbpsy->props) {
>  		ret = -ENOMEM;
>  		goto out_put_operation;
> @@ -634,8 +634,8 @@ static int __gb_power_supply_property_get(struct gb_power_supply *gbpsy,
>  }
>  
>  static int __gb_power_supply_property_strval_get(struct gb_power_supply *gbpsy,
> -						enum power_supply_property psp,
> -						union power_supply_propval *val)
> +						 enum power_supply_property psp,
> +						 union power_supply_propval *val)

Here you fix the alignment, but the last line goes over column 81, even
though 80 is not really one hard requirement anymore, all code
(strings is ok to go over to be easier to grep for messages) is on that
register.

So, to be coherent, if you could please send a V2 without this specific change
would be great, Or even better, if you could get rid of all the _ and __
prefixes in functions names that would be great, and will give more
space for function paramethers.
Your call.

Also, gives you also the chance to practice to send a new
version ;).

Cheers,
    Rui

>  {
>  	switch (psp) {
>  	case POWER_SUPPLY_PROP_MODEL_NAME:
> @@ -943,8 +943,8 @@ static int gb_power_supplies_setup(struct gb_power_supplies *supplies)
>  		goto out;
>  
>  	supplies->supply = kcalloc(supplies->supplies_count,
> -				     sizeof(struct gb_power_supply),
> -				     GFP_KERNEL);
> +				   sizeof(struct gb_power_supply),
> +				   GFP_KERNEL);
>  
>  	if (!supplies->supply) {
>  		ret = -ENOMEM;
> -- 
> 2.47.2



_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
