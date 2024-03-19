Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BBF487F7A6
	for <lists+greybus-dev@lfdr.de>; Tue, 19 Mar 2024 07:43:00 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 92737446C1
	for <lists+greybus-dev@lfdr.de>; Tue, 19 Mar 2024 06:42:59 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	by lists.linaro.org (Postfix) with ESMTPS id 6949F40449
	for <greybus-dev@lists.linaro.org>; Tue, 19 Mar 2024 06:42:57 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=VAi5GiXX;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (lists.linaro.org: domain of ayushdevel1325@gmail.com designates 209.85.210.173 as permitted sender) smtp.mailfrom=ayushdevel1325@gmail.com
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-6e46dcd8feaso3020995b3a.2
        for <greybus-dev@lists.linaro.org>; Mon, 18 Mar 2024 23:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710830576; x=1711435376; darn=lists.linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MekR1vkf79zx6hDhHO4dw0XGgAfid+zxEfjnfq9iFoY=;
        b=VAi5GiXXi/LurWrYHXodK6Wa3k324KTh1X/HPv1niSl3BMLv1hhNFqvr8npD4QjNLy
         jXs88OjlfiXj/M/Z2lwjB5RGZ44wlw/qvBaDSuCQ/k4GentkwJ3fUTxAJx7grWxp/KZ6
         91Mxyjf2KwnFRmmBjFfYrgN8zX66RoA+cf8ZIBMoudUXoc2yiQn11AlmvktZpYqEzV5r
         YbO4eTNwInyk6fqwSxG2ahiu3hoVs8JE0SxbWQ1uctK3Ai+w6LConOni2v1r/4/KuRFW
         wJNHG3PSXJN63Uo8TYMNgHK3wJtGLEhNjamtKz0JZyp57pdxUCQvlrz6agQiyUsltgHR
         9s4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710830576; x=1711435376;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MekR1vkf79zx6hDhHO4dw0XGgAfid+zxEfjnfq9iFoY=;
        b=PSik577Gks21w2u8zLs0uXH5EIYAQPPUWVzgc8hN6mRb+GSoJRZTOo0wUPcOHL+tT3
         t+F/TE+YoTy9w0sb7+Tlj80uhiSibtm8WQ7020ouaiMp953ziDmMEJYkI/7ki38rtInR
         7Y9s1OA30EDx5EZK+Y7+IEDS9d+Ca5Bqodg9ozfXyWk7As0AW6iGvXYgDMPL9bAsefjw
         31vJEeRCjIWjuBJ5zsH8kLnPnLrGQHSr2ph5ZrkeGvhzHJ6lm5uZpkYvz5IidLLWZt1s
         2XvfL7n79MT5YPBXvTWm0LSZgQ9PSg0TwwJnMQcpXh6uOSA2yKxZmqbq/4DZDTaV7JuM
         2HxQ==
X-Forwarded-Encrypted: i=1; AJvYcCXN5NBysdDr9YE2O/934vP9MIB+YoJTTMGdoe2R/nJniLDHRlHzSq19FTbFP1oy81rxIcDp8RDkNJH7ZbekKJb8BT16E9XBCD8pDK7S
X-Gm-Message-State: AOJu0Yx27u3FEZTaHrBBJ07ytkPfSAe0f686H6ee1/6r4NcVPUQpSIQc
	zf+fIuV3rvGAzMnH15IHi/SqTgMMNgje+5HrTnBGmPN4tFS9ajs1
X-Google-Smtp-Source: AGHT+IELy+WEtoYME8bn4yLFQ+wqr8qOT2Cs6dmJHNy7S8i5urAB8y1ed9hdTxndDnXa/NFifvMK5Q==
X-Received: by 2002:a05:6a00:1ad3:b0:6e6:4679:fa8b with SMTP id f19-20020a056a001ad300b006e64679fa8bmr2033581pfv.4.1710830576427;
        Mon, 18 Mar 2024 23:42:56 -0700 (PDT)
Received: from [172.16.116.58] ([103.15.228.94])
        by smtp.gmail.com with ESMTPSA id i3-20020a056a00004300b006e56e5c09absm9215698pfk.14.2024.03.18.23.42.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Mar 2024 23:42:56 -0700 (PDT)
Message-ID: <c85c3d7c-df50-4328-b260-753a036c92d8@gmail.com>
Date: Tue, 19 Mar 2024 12:12:37 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20240317193714.403132-1-ayushdevel1325@gmail.com>
 <20240317193714.403132-2-ayushdevel1325@gmail.com>
 <1be08004-fe29-4e0b-b0c9-7cc7af15d0b0@linaro.org>
From: Ayush Singh <ayushdevel1325@gmail.com>
In-Reply-To: <1be08004-fe29-4e0b-b0c9-7cc7af15d0b0@linaro.org>
X-Rspamd-Queue-Id: 6949F40449
X-Spamd-Bar: ------
X-Spamd-Result: default: False [-6.59 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.210.173:from];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[25];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	TAGGED_RCPT(0.00)[dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: OPW4QMIIZPSHGXX3P2GV25FSON6RHVZA
X-Message-ID-Hash: OPW4QMIIZPSHGXX3P2GV25FSON6RHVZA
X-MailFrom: ayushdevel1325@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: robertcnelson@beagleboard.org, lorforlinux@beagleboard.org, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, Derek Kiernan <derek.kiernan@amd.com>, Dragan Cvetic <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>, Vaishnav M A <vaishnav.a@ti.com>, Mark Brown <broonie@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated list:ARM/TEXAS INSTRUMENTS K3 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "open list:SPI SUBSYSTEM" <linux-spi@vger.kernel.org>, "moderated list:GREYBUS SUBSYSTEM" <greybus-dev@lists.linaro.org>, Vaishnav M A <vaishnav@beagleboard.org>, "Russell King (Oracle)" <linux@armlinux.org.uk>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v4 1/5] dt-bindings: misc: Add mikrobus-connector
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/OPW4QMIIZPSHGXX3P2GV25FSON6RHVZA/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit


On 3/19/24 11:33, Krzysztof Kozlowski wrote:
> On 17/03/2024 20:37, Ayush Singh wrote:
>> Add DT bindings for mikroBUS interface. MikroBUS is an open standard
>> developed by MikroElektronika for connecting add-on boards to
>> microcontrollers or microprocessors.
>>
> ...
>
>> +title: mikroBUS add-on board socket
>> +
>> +maintainers:
>> +  - Ayush Singh <ayushdevel1325@gmail.com>
>> +
>> +properties:
>> +  compatible:
>> +    const: mikrobus-connector
>> +
>> +  pinctrl-0: true
>> +  pinctrl-1: true
>> +  pinctrl-2: true
>> +  pinctrl-3: true
>> +  pinctrl-4: true
>> +  pinctrl-5: true
>> +  pinctrl-6: true
>> +  pinctrl-7: true
>> +  pinctrl-8: true
>> +
>> +  pinctrl-names:
>> +    items:
>> +      - const: default
>> +      - const: pwm_default
>> +      - const: pwm_gpio
>> +      - const: uart_default
>> +      - const: uart_gpio
>> +      - const: i2c_default
>> +      - const: i2c_gpio
>> +      - const: spi_default
>> +      - const: spi_gpio
>> +
>> +  mikrobus-gpios:
>> +    minItems: 11
>> +    maxItems: 12
> I don't see any of the issues resolved which I raised at v3. I think
> Russell pointed that you do not have EEPROM and that some pins are
> optional. You do not allow that.

So this patchset does not contain any EEPROM code. The bindings describe 
mikroBUS connector and not mikroBUS addon board. While it is optional 
for the mikroBUS addon board to not use sone pins (aka NC), the pins 
still exist on the connector on the device side. It is not optional to 
have pins in the host device.

> Plus I don't see him being Cced but he had quite detailed look and
> comments at your patchset, so *you are supposed to Cc* him.
>
> I also do not see Rob's comments fully addressed.
>
> Do not send next versions before resolving previous discusssion.

I apologize, I thought he was on the list by get_maintainers.pl, but it 
seems I was mistaken. I will try to remember going forward.

>> +
>> +  i2c-adapter:
>> +    description: i2c adapter attached to the mikrobus socket.
>> +    $ref: /schemas/types.yaml#/definitions/phandle
>> +
>> +  spi-controller:
>> +    description: spi bus number of the spi-master attached to the mikrobus socket.
>> +    $ref: /schemas/types.yaml#/definitions/phandle
>> +
>> +  uart:
>> +    description: uart port attached to the mikrobus socket
>> +    $ref: /schemas/types.yaml#/definitions/phandle
>> +
>> +  pwms:
>> +    description: the pwm-controller corresponding to the mikroBUS PWM pin.
>> +    maxItems: 1
>> +
>> +  spi-cs:
>> +    description: spi chip-select numbers corresponding to the chip-selects on the mikrobus socket.
>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>> +    items:
>> +      - description: chip select corresponding to CS pin
>> +      - description: chip select corresponding to RST pin
>> +
>> +required:
>> +  - compatible
>> +  - pinctrl-0
>> +  - pinctrl-1
>> +  - pinctrl-2
>> +  - pinctrl-3
>> +  - pinctrl-4
>> +  - pinctrl-5
>> +  - pinctrl-6
>> +  - pinctrl-7
>> +  - pinctrl-8
>> +  - i2c-adapter
>> +  - spi-controller
>> +  - spi-cs
>> +  - uart
>> +  - pwms
>> +  - mikrobus-gpios
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/gpio/gpio.h>
>> +
>> +    mikrobus {
>> +      compatible = "mikrobus-connector";
>> +      pinctrl-names = "default", "pwm_default", "pwm_gpio","uart_default", "uart_gpio", "i2c_default",
> Please properly wrap your code according to Linux and DTS coding style
> documents.
>
>
> Best regards,
> Krzysztof
>
Ayush Singh
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
