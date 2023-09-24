Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 9580B7AC827
	for <lists+greybus-dev@lfdr.de>; Sun, 24 Sep 2023 14:54:06 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 912F640C17
	for <lists+greybus-dev@lfdr.de>; Sun, 24 Sep 2023 12:54:05 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	by lists.linaro.org (Postfix) with ESMTPS id 6E0F53EC33
	for <greybus-dev@lists.linaro.org>; Sun, 24 Sep 2023 12:53:58 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linaro.org header.s=google header.b=XSGRlVzd;
	spf=pass (lists.linaro.org: domain of krzysztof.kozlowski@linaro.org designates 209.85.128.51 as permitted sender) smtp.mailfrom=krzysztof.kozlowski@linaro.org;
	dmarc=pass (policy=none) header.from=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-405361bb949so48571185e9.1
        for <greybus-dev@lists.linaro.org>; Sun, 24 Sep 2023 05:53:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695560037; x=1696164837; darn=lists.linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V+zWR4OnErzUNTHI9CGno+JO0shm7NKnCH0fmpCCo4c=;
        b=XSGRlVzdBYYdWf092R23iponjOox5X4ieuCZIaUQrMszaYbTneaZU1B72OZ9dKYxd6
         mg2dEO3rI9d1q4VLoa9yjAD9Y92kH9YHfqQHl7xF0KxdwPIREuPzp0BrFzVb0Lcb/Ojq
         2yTFod8HDTqqJT+l+nKIYUmetUmj23Xtc4FaLU5uAw0zXUH+/uq5LJ7LfgMdrdbWohWw
         nVsYRfOf4+jZpVJag27xGqVV61nwZFQ5hKEanR6j6OAy9e3Sj2qJkaB+mAlJwGEgKcbk
         zWDXYIhGxhI9/RvO/HfFSpbXxgDgHrdXUA0xfZ9fgsd26+w8YdFuTeW+7zHbUzN06BOx
         6nzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695560037; x=1696164837;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V+zWR4OnErzUNTHI9CGno+JO0shm7NKnCH0fmpCCo4c=;
        b=Gj3kZuppTVEz//ZcNNZtZ8WlpTPWtFO55oMUrEcGXbZCwYIP972njUv6YeL0vUPA1O
         AW1R6Kwf6PbkpG46eQpzhl2S6C7wzrULjCs1dVYtlhNJyRiV50+wpGE5wtjfi800KucX
         BbaNxnnSk3TMFaKPJS06ihhvFAkmQNCiH2rGH9kv5G5BmsHOr8GfjhzrX78C3wrAteGI
         +AfBOak8lFOvGPDDf1+htRVfzUqdUjf1I3TiFtLP9HbGl1ipq0Eoq6Ae2KO9Y0G4fZF0
         pcgMGPdjRYdikZIn3zaJmy5fJfh81KuVN+dzpfb5z46oYbGEBRwNG884d7sgzU9oZpWg
         zETQ==
X-Gm-Message-State: AOJu0Yz7FXHQjlv40UnUYScku9x5QMz6A8u5xKfCEjg3dckIoPW0HkZ0
	8i6aDSwsSLfMJNmooJhKzEXBDmJU
X-Google-Smtp-Source: AGHT+IE+y3uD5k3aI0TjwvT+iKkLTK6/bpET/tRb+igBUnXtTSJ7YkjJcnfCC4yooWKXBkNSieuy7Q==
X-Received: by 2002:a5d:4842:0:b0:314:152d:f8db with SMTP id n2-20020a5d4842000000b00314152df8dbmr3615045wrs.58.1695560037285;
        Sun, 24 Sep 2023 05:53:57 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.100])
        by smtp.gmail.com with ESMTPSA id f18-20020a5d58f2000000b00317b0155502sm9222827wrd.8.2023.09.24.05.53.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 24 Sep 2023 05:53:56 -0700 (PDT)
Message-ID: <141ec8de-4008-9f96-e915-92056b409edc@linaro.org>
Date: Sun, 24 Sep 2023 14:53:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-US
To: Ayush Singh <ayushdevel1325@gmail.com>, greybus-dev@lists.linaro.org
References: <20230924113725.164948-1-ayushdevel1325@gmail.com>
 <20230924113725.164948-2-ayushdevel1325@gmail.com>
 <0fd912a9-4aaa-d4bd-4ceb-7319d9f46db8@linaro.org>
 <69f8f5aa-075c-0dc1-7a5f-bd6978c71f53@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <69f8f5aa-075c-0dc1-7a5f-bd6978c71f53@gmail.com>
X-Spamd-Bar: ------
X-Spamd-Result: default: False [-6.50 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,lists.linaro.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.128.51:from];
	TAGGED_RCPT(0.00)[dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail-wm1-f51.google.com:helo,mail-wm1-f51.google.com:rdns]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 6E0F53EC33
Message-ID-Hash: 7O5OEGCNFNYHFLS2JLB3QE5AO4AZAGYY
X-Message-ID-Hash: 7O5OEGCNFNYHFLS2JLB3QE5AO4AZAGYY
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, vaishnav@beagleboard.org, nm@ti.com, krzysztof.kozlowski+dt@linaro.org, vigneshr@ti.com, kristo@kernel.org, robh+dt@kernel.org, conor+dt@kernel.org, linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v5 1/3] dt-bindings: Add beagleplaycc1352
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/7O5OEGCNFNYHFLS2JLB3QE5AO4AZAGYY/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 24/09/2023 14:22, Ayush Singh wrote:
>> So this is "Texas Instruments Simplelink CC1352P7 wireless MCU"? Since
>> you do not have any fixed feature and run general-purpose OS, then this
>> should be rather compatible matching actual hardware (so ti,cc1352p7).
> Yes, it is "Texas Instruments Simplelink CC1352P7 wireless MCU". Since 
> the docs suggest that all functionality of the device should be 
> mentioned in the bindings rather than just what is being used, I suppose 
> all the other properties can be defined as optional? The bindings for 
> this device do exist in Zephyr, so I guess that can be re-purposed for 
> Linux kernel. However, I think in that case it should be moved into 
> `soc` instead of `net`?

Zephyr bindings might be entirely different, because they are for the
case of running Zephyr OS on this processor.

I still do not fully understand whether you describe here generic MCU
used for Greybus or some specific firmware with fixed features. Looks
like the first, thus my suggestion about compatible. The location could
be arm.

>>
>>> +
>>> +maintainers:
>>> +  - Ayush Singh <ayushdevel1325@gmail.com>
>>> +
>>> +properties:
>>> +  compatible:
>>> +    const: beagle,play-cc1352
>>> +
>>> +required:
>>> +  - compatible
>> Still no resources? I asked about it last time and you did not answer
>> anything.
> Sorry, I missed that. By resources, I think you mean pins, peripherals, 
> etc right?

By resources I mean whatever is needed to power it up and operate, e.g.
clocks, supplies, reset lines.

Best regards,
Krzysztof

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
