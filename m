Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D3E7AC7D9
	for <lists+greybus-dev@lfdr.de>; Sun, 24 Sep 2023 14:00:40 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 3374743D5C
	for <lists+greybus-dev@lfdr.de>; Sun, 24 Sep 2023 12:00:39 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	by lists.linaro.org (Postfix) with ESMTPS id 572393E975
	for <greybus-dev@lists.linaro.org>; Sun, 24 Sep 2023 12:00:30 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linaro.org header.s=google header.b=X14QNSuc;
	spf=pass (lists.linaro.org: domain of krzysztof.kozlowski@linaro.org designates 209.85.221.45 as permitted sender) smtp.mailfrom=krzysztof.kozlowski@linaro.org;
	dmarc=pass (policy=none) header.from=linaro.org
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3231d67aff2so1166950f8f.0
        for <greybus-dev@lists.linaro.org>; Sun, 24 Sep 2023 05:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695556829; x=1696161629; darn=lists.linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dBOJish6GxNLMFSFNmns6IL1J0Fi1oU9wxX+89lv5vI=;
        b=X14QNSucE1mMboCe/9bpUaNHFAQFn1bFaMG6Hi8oMgwin2ULPA13cNSRjGn75XDXfy
         amBb+MT9lbOqsyCN53ZRZHwTFaucQ8NwGwlbXK1WFsrSW2eSv4fa/U+Q2U9D0BQT5KHe
         xgsbNvm229P2jla5qTrMbem+ZXL3xXZ2uD7LQIuIbVfbuJTjKZ9X4+F+clCCgftaaeki
         GIf7md/Y7xAd5ILRhyV4d3JH1L3rxuV55KGhESC27nljY3hBUcyH5n/zWWF4NVg+dam5
         zVeaTmZ1noc+ZNFiyo7THoX6TUHbwMsNh8Bwb1RSpjp+L8sKZ26OHd9Y/CT5BXOd6pYq
         YmhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695556829; x=1696161629;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dBOJish6GxNLMFSFNmns6IL1J0Fi1oU9wxX+89lv5vI=;
        b=proin5q7DrYHAESA2XDzA6mTjky+w13LKXGxIQLxpXQErFUFYjhpKf3yyOlCS7GHED
         3c00ny5ZWCV4dWuV1qXDSO3pw4WEhY+QgLOk7mEPD0MDLXTLxlTFtHAqa1wrqCsgTlE3
         R1Tw2GWlG7YvwhuuB5ZsjcsbLijtbHmrvy1wgepvt9KWw1b/FL+9PJjzSzD6nBJwDNc+
         HI8XZ4KryOtZl6LL2tJrq5a3N6L/priWok+fLm7UO20k17ZuCBUG3jhCMjb6zyTCr8JF
         jyP8eEow9cqFHB+5xYapXQUbqkTqaTgHO0AyUFyDXtNkkYDspDSflT8MWEaUQBFM74kz
         a2bw==
X-Gm-Message-State: AOJu0Yxb/KsK54EO2clgixQ60dENmJAFDXLSlZwh0CTTuqrnGI/86eqe
	SFqng1hn31IzwaF42k5eEkqIr7/f
X-Google-Smtp-Source: AGHT+IGO8bCTbMJp5fVQdgKbNu5/LSlEzUCvJRZBKQ27KJ/4WhcXJ+t6ywp5uxBWqEtgLTT7BspaIw==
X-Received: by 2002:adf:f746:0:b0:31d:db92:31ae with SMTP id z6-20020adff746000000b0031ddb9231aemr3344191wrp.44.1695556829154;
        Sun, 24 Sep 2023 05:00:29 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.100])
        by smtp.gmail.com with ESMTPSA id 12-20020a05600c240c00b003fc02e8ea68sm12284948wmp.13.2023.09.24.05.00.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 24 Sep 2023 05:00:28 -0700 (PDT)
Message-ID: <0fd912a9-4aaa-d4bd-4ceb-7319d9f46db8@linaro.org>
Date: Sun, 24 Sep 2023 14:00:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-US
To: Ayush Singh <ayushdevel1325@gmail.com>, greybus-dev@lists.linaro.org
References: <20230924113725.164948-1-ayushdevel1325@gmail.com>
 <20230924113725.164948-2-ayushdevel1325@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230924113725.164948-2-ayushdevel1325@gmail.com>
X-Spamd-Bar: ------
X-Spamd-Result: default: False [-6.50 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.221.45:from];
	TAGGED_RCPT(0.00)[dt];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,lists.linaro.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[linaro.org:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 572393E975
Message-ID-Hash: OK2L5THRSXEFFRJLXS3ERPCYCYAAMH3W
X-Message-ID-Hash: OK2L5THRSXEFFRJLXS3ERPCYCYAAMH3W
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, vaishnav@beagleboard.org, nm@ti.com, krzysztof.kozlowski+dt@linaro.org, vigneshr@ti.com, kristo@kernel.org, robh+dt@kernel.org, conor+dt@kernel.org, linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v5 1/3] dt-bindings: Add beagleplaycc1352
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/OK2L5THRSXEFFRJLXS3ERPCYCYAAMH3W/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 24/09/2023 13:36, Ayush Singh wrote:
> Adds DT bindings for BeaglePlay CC1352 co-processor.

I gave you the link to the exact wording you should use. "Add", not
"Adds". The latter is not a correct English sentences, I believe.

> 
> BeaglePlay has a CC1352 co-processor connected to the main AM62 (running
> Linux) over UART. In the BeagleConnect Technology, CC1352 is responsible
> for handling 6LoWPAN communication with beagleconnect freedom nodes as
> well as their discovery.
> 
> It is used by gb-beagleplay greybus driver.
> 
> Signed-off-by: Ayush Singh <ayushdevel1325@gmail.com>
> ---
>  .../bindings/net/beagle,play-cc1352.yaml      | 25 +++++++++++++++++++
>  MAINTAINERS                                   |  6 +++++
>  2 files changed, 31 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/beagle,play-cc1352.yaml
> 
> diff --git a/Documentation/devicetree/bindings/net/beagle,play-cc1352.yaml b/Documentation/devicetree/bindings/net/beagle,play-cc1352.yaml
> new file mode 100644
> index 000000000000..f8536d1a6765
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/beagle,play-cc1352.yaml
> @@ -0,0 +1,25 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/beagle,play-cc1352.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: BeaglePlay CC1352 co-processor

So this is "Texas Instruments Simplelink CC1352P7 wireless MCU"? Since
you do not have any fixed feature and run general-purpose OS, then this
should be rather compatible matching actual hardware (so ti,cc1352p7).

> +
> +maintainers:
> +  - Ayush Singh <ayushdevel1325@gmail.com>
> +
> +properties:
> +  compatible:
> +    const: beagle,play-cc1352

> +
> +required:
> +  - compatible

Still no resources? I asked about it last time and you did not answer
anything.

> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    mcu {
> +      compatible = "beagle,play-cc1352";
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 37b9626ee654..9d1b49a6dfad 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -8969,6 +8969,12 @@ F:	drivers/staging/greybus/sdio.c
>  F:	drivers/staging/greybus/spi.c
>  F:	drivers/staging/greybus/spilib.c
>  
> +GREYBUS BEAGLEPLAY DRIVERS
> +M:	Ayush Singh <ayushdevel1325@gmail.com>
> +L:	greybus-dev@lists.linaro.org (moderated for non-subscribers)
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/serial/beaglecc1352.yaml

That's not a correct path.


Best regards,
Krzysztof

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
