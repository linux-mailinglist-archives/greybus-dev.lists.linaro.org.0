Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 40C1E87D51A
	for <lists+greybus-dev@lfdr.de>; Fri, 15 Mar 2024 21:40:25 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 4D25E43E8F
	for <lists+greybus-dev@lfdr.de>; Fri, 15 Mar 2024 20:40:24 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	by lists.linaro.org (Postfix) with ESMTPS id E60E940A53
	for <greybus-dev@lists.linaro.org>; Fri, 15 Mar 2024 20:40:16 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linaro.org header.s=google header.b=qz2NgLco;
	spf=pass (lists.linaro.org: domain of krzysztof.kozlowski@linaro.org designates 209.85.208.45 as permitted sender) smtp.mailfrom=krzysztof.kozlowski@linaro.org;
	dmarc=pass (policy=none) header.from=linaro.org
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-568aa3096e9so2142345a12.0
        for <greybus-dev@lists.linaro.org>; Fri, 15 Mar 2024 13:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710535216; x=1711140016; darn=lists.linaro.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GZGA5Ahl8JwT0YD+YfVJrQEJg9N0A5Xv5JcpBW3b6Oc=;
        b=qz2NgLcoy1mioNG9RoOTDpbOu3t7+LUsk414rr23uuQgTL5fKwEl/lvEwOXc24u03Z
         t0DHwuhzmTT36m6glv7ZaM9x+UjdcCXA4BNq16JnURPAdQCF/6fa8wEcAJcB7R1EhaRy
         9i25VcCK+HWPUtJPY3CLPGvWv/XNqGHUyoQ8WPEAmyfd5L6Ap6kB4Dcy+zOLFUChw4i4
         OQAA+v6+XSUGWCh8fG8iWnaZqMK9clLwWLf3vvo4hP+CsyVit1PtkPOlKFxk7Y6bpZes
         KeFZUYoidvHHfQw2kohfRA/OsTbijM6U3t0QM43BAVE1MDrEM11SedwJSQlhGVymW8eK
         Yn2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710535216; x=1711140016;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GZGA5Ahl8JwT0YD+YfVJrQEJg9N0A5Xv5JcpBW3b6Oc=;
        b=Hcnr83tXr2mBUclBjXAOLDqnZWCb0q0/kpL+FeE5CaBSSerB/JYF4jfCUmXTxuhuxU
         MSwZucUCtTX1CZeAPT+aD9Ggf3eWC0pYuMeHrSECyIb53UOU+3Evk+TeTvxnpvGDk2oA
         ba79zvdtQtFQz1XVBN/vIUo2kTgRaWA3LyxnOjmzIrlPUygXIowdXfV+V1N5zAdjwuyr
         y4vyURJLSVrgQFF7I3KgoZhSOpD+EG7PmtlgmLm93B9rMsRKGueoXsl6jDnC4bk4OmIt
         GSArVeGWOLSkFvnhyd9yOh/30oMI7COzCxzJv9x81qqXoIvcROyZQzmeTb0meXe/t4Xt
         hMKQ==
X-Forwarded-Encrypted: i=1; AJvYcCVH8hKLvMObiMuqe4J91S5mrBo9Z68jjUsxe8fEzr1PEak59Rb8xYgoqzYTLb78EH3zkI4zbcy0bnTHZ5Z95C8w/gUFbcjrIkHo21NT
X-Gm-Message-State: AOJu0YyPLIFMmLMa3p05mhg9gtd2j5bQ/YqED49Ll9Q4W2LVZ6YslqMC
	Q+9StW7uVe6kOY4phtfOWMQrm6EDqKgI3Su7/SdPqW30dHSN99Z3i/8SJNP8kcZICg==
X-Google-Smtp-Source: AGHT+IE3Vm/Ztnbl0AydJgGYmRakPJs1AkSrmM+AD33E4IENFkMpZ3f1ZYQ4gnNtHsJoBb+VAZHshQ==
X-Received: by 2002:a17:907:c783:b0:a46:7b92:f110 with SMTP id tz3-20020a170907c78300b00a467b92f110mr4496923ejc.31.1710535215862;
        Fri, 15 Mar 2024 13:40:15 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.97])
        by smtp.gmail.com with ESMTPSA id pv27-20020a170907209b00b00a44fcdf20d1sm2018576ejb.189.2024.03.15.13.40.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Mar 2024 13:40:15 -0700 (PDT)
Message-ID: <5723478b-1717-4f83-959f-14bfce309bcf@linaro.org>
Date: Fri, 15 Mar 2024 21:40:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
References: <20240315184908.500352-1-ayushdevel1325@gmail.com>
 <20240315184908.500352-2-ayushdevel1325@gmail.com>
 <314a88e0-19cd-4b95-9cf3-aef1c7579eec@linaro.org>
 <ZfSteEmeQX5IUJnU@shell.armlinux.org.uk>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <ZfSteEmeQX5IUJnU@shell.armlinux.org.uk>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: E60E940A53
X-Spamd-Bar: ------
X-Spamd-Result: default: False [-6.49 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,beagleboard.org,kernel.org,linaro.org,ti.com,amd.com,arndb.de,linuxfoundation.org,lists.infradead.org,lists.linaro.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	URIBL_BLOCKED(0.00)[linaro.org:dkim];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.208.45:from];
	TO_DN_SOME(0.00)[]
Message-ID-Hash: 27GEVGXMLIY7RZKNL7CBFED6YAGUV3U5
X-Message-ID-Hash: 27GEVGXMLIY7RZKNL7CBFED6YAGUV3U5
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Ayush Singh <ayushdevel1325@gmail.com>, linux-kernel@vger.kernel.org, robertcnelson@beagleboard.org, Vaishnav M A <vaishnav@beagleboard.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, Derek Kiernan <derek.kiernan@amd.com>, Dragan Cvetic <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jiri Slaby <jirislaby@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org, linux-serial@vger.kernel.org, greybus-dev@lists.linaro.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v3 1/8] dt-bindings: misc: Add mikrobus-connector
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/27GEVGXMLIY7RZKNL7CBFED6YAGUV3U5/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 15/03/2024 21:20, Russell King (Oracle) wrote:
> On Fri, Mar 15, 2024 at 09:09:11PM +0100, Krzysztof Kozlowski wrote:
>>> +properties:
>>> +  compatible:
>>> +    const: mikrobus-connector
>>
>> Hm, why do you create binding for the connector, not for some sort of
>> controller? Please provide some rationale for this in commit msg.
> 
> I think you have a distorted view. I refer you to the Mikroe mikroBUS
> specification - it's _just_ a connector which provides a fairly
> standardised purpose for each pin and the electrical specifications.
> For example of the pins: power, UART, SPIs, I2C, PWM, and analogue
> pins.

I refer to the commit msg or description in the binding and there is
nothing explained like this. Yeah, true, I could google every possible
bus specification, but I also expect some sort of help here by the patch
submitter.

The binding looks like binding for a connector, not for some sort of
controller, then are you saying the control part it is purely in
software? That's how DTS looks like, but then my question is are there
some sort of controller which would also perform this?

> 
>>> +  pinctrl-names:
>>> +    items:
>>> +      - const: default
>>> +      - const: pwm_default
>>> +      - const: pwm_gpio
>>> +      - const: uart_default
>>> +      - const: uart_gpio
>>> +      - const: i2c_default
>>> +      - const: i2c_gpio
>>> +      - const: spi_default
>>> +      - const: spi_gpio
>>
>> I fail to see why such choice is related to the connector itself.
> 
> This isn't a choice at all. Here's the list of pins:
> 
> Analog - AN
> Reset - RST
> SPI Chip Select - CS
> SPI Clock - SCK
> SPI Master Input Slave Output - MISO
> SPI Master Output Slave Input - MOSI
> VCC-3.3V power - +3.3V
> Reference Ground - GND
> PWM - PWM output
> INT - Hardware Interrupt
> RX - UART Receive
> TX - UART Transmit
> SCL - I2C Clock
> SDA - I2C Data
> +5V - VCC-5V power
> GND - Reference Ground
> 
> Any data pin can be a GPIO if e.g. a relay board is plugged in, even
> if some of the other pins are used for e.g. UART purposes. For example,
> a GPS board that provides the GPS data over the UART pins, and the
> PPS signal through a different pin.

And could you not have some certain features supported? Could have some
pins just pull down / not connected?

Best regards,
Krzysztof

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
