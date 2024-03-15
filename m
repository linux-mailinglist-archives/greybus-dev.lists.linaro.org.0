Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id C03F487EFB7
	for <lists+greybus-dev@lfdr.de>; Mon, 18 Mar 2024 19:28:59 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id B1F9D43C35
	for <lists+greybus-dev@lfdr.de>; Mon, 18 Mar 2024 18:28:58 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	by lists.linaro.org (Postfix) with ESMTPS id 0F7393F387
	for <greybus-dev@lists.linaro.org>; Fri, 15 Mar 2024 20:14:35 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linaro.org header.s=google header.b=iy5obGft;
	spf=pass (lists.linaro.org: domain of krzysztof.kozlowski@linaro.org designates 209.85.218.47 as permitted sender) smtp.mailfrom=krzysztof.kozlowski@linaro.org;
	dmarc=pass (policy=none) header.from=linaro.org
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a4675aaa2e8so262488966b.0
        for <greybus-dev@lists.linaro.org>; Fri, 15 Mar 2024 13:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710533674; x=1711138474; darn=lists.linaro.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=odLjH6pCRhbd6VY/8IpKN5+gXDMhrfAYCr6uel2M/zo=;
        b=iy5obGft9fL80E6r00OoC8dETo4Ctw9H9MwVwtZxYILEcsd8y63hi4xq2qd5iCaDeK
         CxOle2SNe39RPDXJaMZTmmI4fnGJ+cvka75HSmf2e3wmKErPzERJ1GRm9FUbBRvlYn5l
         4RzP/jvxNqI22jOlLZG+Oxij+5lT9QagatdF8LXEFfSH6SuZFcklrwvP5e/1vtaJRHCf
         yisWoWVycOGQB/qyxPpKtyaMpWQ3WVGpIh1E7qYDSIMvVj6FNQnaQ/qxYpAq1G1XAbD9
         uGhCSKt5CHnwQwyJ41h9VOql0KWtCQbrluQu6mw+rVAvm93HZ/k10nfxXkjunWGfe0xw
         0d7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710533674; x=1711138474;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=odLjH6pCRhbd6VY/8IpKN5+gXDMhrfAYCr6uel2M/zo=;
        b=tdkAFgGlHQmGjlcBDAptj7jns7mxcNbpGi3HMIRTbEaVT/LLwVqKqq5ksSX1uCJSRj
         zZtfInzfPcU0FQhYmlGCIJk/TRQCFdfMrXZ3f04w3tAqPUM7TCgB4H+6YPhkFN1uHfpo
         5sLi3snSavtxK22/iACs7Xn7rjs8SESDhzoaGCpAUWN8Yl2KubbK37ckWUu5G9Q4FrTr
         wSdKiCIOMkkae5F+Z/zlF2a3uw9xNC7XUTIpFlkRaCKaDTcLWMWcu2c9/KPa9vFKpvlW
         A84Xk2gr/Kur+/wHy7nwS5h0UDZ+iQUqaMFR1zpL3pdXvoThBUIl8vU3K2T98is6qE9z
         zG7A==
X-Forwarded-Encrypted: i=1; AJvYcCUQcGKd3JnCwnOeePXfb/2tyHiRh4EvxRr7H6I7bhZigjDHRC5ubDS55x7l6CH2tF/Wt1+HQl849VEguWtNlmQnQh7j19mHC5D62FNo
X-Gm-Message-State: AOJu0YxL3pJEj7TSDrFGmCqkoglxtc/isUBRyddbqcJGR5w3nRHG4uNb
	mZfbnHhguyzesUB9Nl9VVIpJjn5gYQDopVtKEGUSp6WsvTyyo5DfFpBIcYR2+3zhsA==
X-Google-Smtp-Source: AGHT+IEsS46iEcSasaXWquxv5k5qikS5zVamCo2J4zeZor8vCboZ/fxtqwqJns14sHIDjc/FiAzt+Q==
X-Received: by 2002:a17:907:72d5:b0:a46:a23f:bc2c with SMTP id du21-20020a17090772d500b00a46a23fbc2cmr27440ejc.25.1710533673785;
        Fri, 15 Mar 2024 13:14:33 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.97])
        by smtp.gmail.com with ESMTPSA id hj11-20020a170906874b00b00a46a04d7daesm90052ejb.115.2024.03.15.13.14.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Mar 2024 13:14:33 -0700 (PDT)
Message-ID: <b70ceddb-0f36-4ee3-bafe-01e4683cc72a@linaro.org>
Date: Fri, 15 Mar 2024 21:14:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Ayush Singh <ayushdevel1325@gmail.com>, linux-kernel@vger.kernel.org
References: <20240315184908.500352-1-ayushdevel1325@gmail.com>
 <20240315184908.500352-3-ayushdevel1325@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240315184908.500352-3-ayushdevel1325@gmail.com>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 0F7393F387
X-Spamd-Bar: ------
X-Spamd-Result: default: False [-6.49 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	URIBL_BLOCKED(0.00)[mail-ej1-f47.google.com:rdns,mail-ej1-f47.google.com:helo,beagleboard.org:email];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	FREEMAIL_CC(0.00)[beagleboard.org,kernel.org,linaro.org,ti.com,amd.com,arndb.de,linuxfoundation.org,gmail.com,vger.kernel.org,lists.infradead.org,lists.linaro.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.218.47:from];
	TO_DN_SOME(0.00)[]
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Hits: administrivia
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
Message-ID-Hash: KGPNQMR5I7EERADKRQDJ5GKZKZTJNV5R
X-Message-ID-Hash: KGPNQMR5I7EERADKRQDJ5GKZKZTJNV5R
X-Mailman-Approved-At: Mon, 18 Mar 2024 18:28:56 +0000
CC: robertcnelson@beagleboard.org, Vaishnav M A <vaishnav@beagleboard.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, Derek Kiernan <derek.kiernan@amd.com>, Dragan Cvetic <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jiri Slaby <jirislaby@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org, linux-serial@vger.kernel.org, greybus-dev@lists.linaro.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v3 2/8] w1: Add w1_find_master_device
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/KGPNQMR5I7EERADKRQDJ5GKZKZTJNV5R/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 15/03/2024 19:49, Ayush Singh wrote:
> Add helper to find w1_master from w1_bus_master, which is present in
> drvdata of platform device.

Who needs this?

> 
> Signed-off-by: Vaishnav M A <vaishnav@beagleboard.org>
> Signed-off-by: Ayush Singh <ayushdevel1325@gmail.com>
> ---
>  drivers/w1/w1.c     |  6 +++---
>  drivers/w1/w1_int.c | 27 +++++++++++++++++++++++++++
>  include/linux/w1.h  |  1 +
>  3 files changed, 31 insertions(+), 3 deletions(-)

Why is this in the patchset? What are the dependencies? Please clearly
express dependencies between patches or merging needs in cover letter.
Otherwise please do not combine unrelated patches from different
subsystems together. It's make review and merging only difficult.

> 
> diff --git a/drivers/w1/w1.c b/drivers/w1/w1.c
> index afb1cc4606c5..ce8a3f93f2ef 100644
> --- a/drivers/w1/w1.c
> +++ b/drivers/w1/w1.c
> @@ -673,9 +673,9 @@ static int __w1_attach_slave_device(struct w1_slave *sl)
>  	sl->dev.of_node = of_find_matching_node(sl->master->dev.of_node,
>  						sl->family->of_match_table);
>  
> -	dev_set_name(&sl->dev, "%02x-%012llx",
> -		 (unsigned int) sl->reg_num.family,
> -		 (unsigned long long) sl->reg_num.id);
> +	dev_set_name(&sl->dev, "%s-%02x-%012llx", sl->master->name,
> +		     (unsigned int)sl->reg_num.family,
> +		     (unsigned long long)sl->reg_num.id);
>  	snprintf(&sl->name[0], sizeof(sl->name),

Why? How is this related to the goal "add a helper"? Where is the helper
used? I don't see. Don't combine unrelated topics in one patch.

>  		 "%02x-%012llx",
>  		 (unsigned int) sl->reg_num.family,
> diff --git a/drivers/w1/w1_int.c b/drivers/w1/w1_int.c
> index 3a71c5eb2f83..2bfef8e67687 100644
> --- a/drivers/w1/w1_int.c
> +++ b/drivers/w1/w1_int.c
> @@ -242,3 +242,30 @@ void w1_remove_master_device(struct w1_bus_master *bm)
>  	__w1_remove_master_device(found);
>  }
>  EXPORT_SYMBOL(w1_remove_master_device);
> +
> +/**
> + * w1_find_master_device() - find a master device
> + * @bm:	master bus device to search
> + */
> +struct w1_master *w1_find_master_device(struct w1_bus_master *bm)

Why are you duplicating w1_search_master_id()? Without locking? Sorry,
this looks like you did not look at all at existing code.

Best regards,
Krzysztof

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
