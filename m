Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 353C07B9BCA
	for <lists+greybus-dev@lfdr.de>; Thu,  5 Oct 2023 10:21:53 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 3AA0640C57
	for <lists+greybus-dev@lfdr.de>; Thu,  5 Oct 2023 08:21:52 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	by lists.linaro.org (Postfix) with ESMTPS id 456C340C57
	for <greybus-dev@lists.linaro.org>; Thu,  5 Oct 2023 08:21:41 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=MErecUO4;
	spf=pass (lists.linaro.org: domain of ayushdevel1325@gmail.com designates 209.85.210.170 as permitted sender) smtp.mailfrom=ayushdevel1325@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-692c70bc440so560325b3a.3
        for <greybus-dev@lists.linaro.org>; Thu, 05 Oct 2023 01:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696494100; x=1697098900; darn=lists.linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6xF4VcmjAf7zdGNHFHYPdHCqEwDNHCYpzit/ZJRYbdY=;
        b=MErecUO4ALWeE7aEm/PG3HYW0YwKgI6BZlwAVKuQ8TasSNA7rOJRm/rN5sz6avNYgY
         0IMB6Oj/X8QCcx4/EmlXFuIq0FLclgsKZSXFk98pQI+umWPCbT/EGk1Co2KzweUuwuH5
         bS4oQg3/a8e6p26HQs7wIGUQzof628dN0CEyJzeBS8S5hD0Z7u8zffnniKaYZWTdRz0H
         r0HOwHV7IYy0W1uwxb3Wx+s+dZj0qRjSXcwoLC9Lecol+cGE5kp0fu8UNf5eWpw9CDa5
         kaLnUKpyY4vE2hqOT6NAhKY10UMaRoAfCSuuX8aJ035D1NKcTXeP/PqAS++Lz35ilXki
         SN0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696494100; x=1697098900;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6xF4VcmjAf7zdGNHFHYPdHCqEwDNHCYpzit/ZJRYbdY=;
        b=rq8+P7tE0xTWG7wfkBeqT5e9PcARu4K08jCUDhtmVxCfWX6zppPcAz/HxS1zj92fv+
         uDRG6Q2U8YhUej/w/IdsYcLkoaEZzdwff1hosAsRrnmZD6B2Z9lfGYb+se3zDXefl7KZ
         OhiMA1zrfgEWkykhDmePZPW0rt944erTrtxGPPtma9coz7l7tC2o4tUiJy0u94+Ik/WQ
         k9F8Jy2if8JE6woum5ZOtF1XiAOFUXm/+I0MJ1D7zUZ4CYXBBE1m3d7aP2MU4rc0r2Ad
         r/NtNM3dQodm+Sr4u683l1A+mx/cWsA7wzuEPsOP44DSvrPHElXzJh9/4rVHnM1E7i64
         0eoA==
X-Gm-Message-State: AOJu0Yy5BCzVVeExpviF+rXVCCk9UBF8kpJ2tl427HEpmpLxTMeroXpW
	SnRMDTo4iCcZ/ff3GZfFGEE=
X-Google-Smtp-Source: AGHT+IFKBdwGGId/1JAn0eJrQXX5wPVt+NoaMAx1n6nayA0VFCwN8qF7d/i7qqYCoj4hKXcATdIsBg==
X-Received: by 2002:a05:6a20:3d95:b0:159:b7dc:2295 with SMTP id s21-20020a056a203d9500b00159b7dc2295mr4774516pzi.9.1696494100161;
        Thu, 05 Oct 2023 01:21:40 -0700 (PDT)
Received: from [172.16.116.58] ([103.15.228.93])
        by smtp.gmail.com with ESMTPSA id du6-20020a056a002b4600b0068a13b0b300sm842288pfb.11.2023.10.05.01.21.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Oct 2023 01:21:39 -0700 (PDT)
Message-ID: <aa63918f-3a95-5e86-d61d-91a59cf643ad@gmail.com>
Date: Thu, 5 Oct 2023 13:51:34 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 greybus-dev@lists.linaro.org
References: <20231004184639.462510-1-ayushdevel1325@gmail.com>
 <20231004184639.462510-2-ayushdevel1325@gmail.com>
 <a171cc72-98cf-4f7f-ba86-6da2ac45ea22@linaro.org>
Content-Language: en-US
From: Ayush Singh <ayushdevel1325@gmail.com>
In-Reply-To: <a171cc72-98cf-4f7f-ba86-6da2ac45ea22@linaro.org>
X-Spamd-Bar: ------
X-Spamd-Result: default: False [-6.60 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.210.170:from];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_TWELVE(0.00)[14];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dt];
	FREEMAIL_ENVFROM(0.00)[gmail.com]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 456C340C57
Message-ID-Hash: SNUFX7HG4AOADNI7WSGGQ6MMU3QFXJE2
X-Message-ID-Hash: SNUFX7HG4AOADNI7WSGGQ6MMU3QFXJE2
X-MailFrom: ayushdevel1325@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, vaishnav@beagleboard.org, nm@ti.com, krzysztof.kozlowski+dt@linaro.org, vigneshr@ti.com, kristo@kernel.org, robh+dt@kernel.org, conor+dt@kernel.org, linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v7 1/3] dt-bindings: net: Add ti,cc1352p7
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/SNUFX7HG4AOADNI7WSGGQ6MMU3QFXJE2/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit

>> Signed-off-by: Ayush Singh <ayushdevel1325@gmail.com>
>> ---
>>   .../devicetree/bindings/net/ti,cc1352p7.yaml  | 51 +++++++++++++++++++
>>   MAINTAINERS                                   |  6 +++
>>   2 files changed, 57 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/net/ti,cc1352p7.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/net/ti,cc1352p7.yaml b/Documentation/devicetree/bindings/net/ti,cc1352p7.yaml
>> new file mode 100644
>> index 000000000000..291ba34c389b
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/net/ti,cc1352p7.yaml
>> @@ -0,0 +1,51 @@
>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/net/ti,cc1352p7.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Texas Instruments Simplelink CC1352P7 wireless MCU
>> +
>> +description:
>> +  The cc1352p7 mcu can be connected via SPI or UART.
>> +
>> +maintainers:
>> +  - Ayush Singh <ayushdevel1325@gmail.com>
>> +
>> +properties:
>> +  compatible:
>> +    const: ti,cc1352p7
>> +
>> +  clocks:
>> +    maxItems: 2
>> +
>> +  clock-names:
>> +    description:
>> +      sclk_hf is the main system (mcu and peripherals) clock
>> +      sclk_lf is low-frequency system clock
> This does no go here, but to clocks. I wrote how it should be done.
> Don't ignore the feedback.
It was suggested to use `clock-names` by Nishanth Menon in the previous 
email, so I thought this was what it meant. I will remove clock-names if 
that's better.
>> +    items:
>> +      - const: sclk_hf
>> +      - const: sclk_lf
>> +
>> +  reset-gpios: true
>
> No, really, why do you change correct code into incorrect one? Who asked
> you to drop maxItems?
I found that many bindings (`display/ilitek,ili9486.yaml`, 
`iio/dac/adi,ad5758.yaml`) use this pattern instead of `maxItems` for 
`reset-gpios`. So I assumed it was some sort of convention. I will 
change it back to `maxItems`.


Sincerely,

Ayush Singh

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
