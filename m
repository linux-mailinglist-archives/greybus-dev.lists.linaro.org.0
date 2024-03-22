Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id B68CA8872F9
	for <lists+greybus-dev@lfdr.de>; Fri, 22 Mar 2024 19:23:34 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 5BAE13F94C
	for <lists+greybus-dev@lfdr.de>; Fri, 22 Mar 2024 18:23:33 +0000 (UTC)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	by lists.linaro.org (Postfix) with ESMTPS id B3F203F359
	for <greybus-dev@lists.linaro.org>; Fri, 22 Mar 2024 18:23:30 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=QSLjosCu;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (lists.linaro.org: domain of ayushdevel1325@gmail.com designates 209.85.219.179 as permitted sender) smtp.mailfrom=ayushdevel1325@gmail.com
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-dd14d8e7026so2214010276.2
        for <greybus-dev@lists.linaro.org>; Fri, 22 Mar 2024 11:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711131810; x=1711736610; darn=lists.linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cVym+5J84D0U9MB20cuLgiHbdn7KsrTiTTYLm5nU3Ns=;
        b=QSLjosCuju3hqPDVjvNnnxmKWWJPwvOjBIjRRFRy8J0ulUAJNTX9mNKiL0zlFKSYxe
         UzyciEu9yeyIVUTnZbxQocm7XgEPGDkPKRSNJxDlOR0caZqYyqghkMMvgYQtNK5MBT6q
         PwnB4wUViPJxdYzXPpHWIiIlMoHfdrdVU0hHqwJ4uaJ5K2JA0/Hbu52TPvOT1xUSAJgO
         5z/At177ti0goUTE2y+Hf+xF3HoTaoVvJe9DwlU83ckVxu6B80nhybHoeckIjAndE+Ue
         oSuApymNb6mSTnuDM0LBZ0iuwEpBwlPV0w5epzT3aBXtX+RbXbg3qayrvrXzjEUwWcWb
         wTuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711131810; x=1711736610;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cVym+5J84D0U9MB20cuLgiHbdn7KsrTiTTYLm5nU3Ns=;
        b=UfHrAv/2LBAZl8BV8aRAHyEZJzBcb/tRPjacV0Ms2g04adO8PtjQvKOnihxUhLxW+Y
         j/ZPnqCWM7MWA36B1+HkB8Ko3gMF1wr49mv9WlYv8HI27setUHEAf63RBHLD0lQWnxTD
         3tdeIA9ptsKgizlmqbvgYhW+tD3qaUVbxiO6bNurxcyKQPKfzB7Ib431lu31/1c1nfjL
         +LoFIM7RKEcK0VbHa8a8dG2zz9hztPAuZCV2KnPRjw0++Y977FEy4z6lft8Ii1t6BTiB
         WB7TW5hxRmBzIqVVCjbLUg3gCR1f+7OROK7gv+u9WLw7crcn+XjUurnQy0TIrLTM788O
         cLug==
X-Forwarded-Encrypted: i=1; AJvYcCUkz+p5MMAQFmBXv1oLi1gLpj8o5VWoraT4r7e6Y2aZpAHpFeuIAL8rKhL+W02GJxfYFhydhZ7lFMoQd2BhU7S5XRRZUyp6rhB0wOcL
X-Gm-Message-State: AOJu0YwugleMvuJKlAFdtDfJ5y3XxEyxFM3bcXAJn7EY1BwMGINMlHKO
	EdvxWrM2ERTbdw7Jkn9N+keaLv+OkPfvPnWJBrZVL/QLKa6h99toCcVu52sJ31c=
X-Google-Smtp-Source: AGHT+IG/LMCZJH7aXi9h/am5L+n244m9THHyeSa1Xy+XIaj8rR+qWj8t1DixCN81CE+f8Df4CyPlww==
X-Received: by 2002:a05:6a21:329e:b0:1a3:a89b:a70a with SMTP id yt30-20020a056a21329e00b001a3a89ba70amr394321pzb.37.1711131352895;
        Fri, 22 Mar 2024 11:15:52 -0700 (PDT)
Received: from [172.16.116.58] ([103.15.228.94])
        by smtp.gmail.com with ESMTPSA id c6-20020aa78c06000000b006e5af565b1dsm43048pfd.201.2024.03.22.11.15.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Mar 2024 11:15:52 -0700 (PDT)
Message-ID: <711ff5ea-244d-4b64-a39c-3f2da63e30c0@gmail.com>
Date: Fri, 22 Mar 2024 23:45:32 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: open list <linux-kernel@vger.kernel.org>
References: <20240317193714.403132-1-ayushdevel1325@gmail.com>
 <20240317193714.403132-2-ayushdevel1325@gmail.com>
From: Ayush Singh <ayushdevel1325@gmail.com>
In-Reply-To: <20240317193714.403132-2-ayushdevel1325@gmail.com>
X-Rspamd-Queue-Id: B3F203F359
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.49 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.219.179:from];
	TAGGED_RCPT(0.00)[dt];
	FREEMAIL_ENVFROM(0.00)[gmail.com]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: MW6YMIEBOGWGPIINZ4AZBFS4BH37ADZF
X-Message-ID-Hash: MW6YMIEBOGWGPIINZ4AZBFS4BH37ADZF
X-MailFrom: ayushdevel1325@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: robertcnelson@beagleboard.org, lorforlinux@beagleboard.org, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, Derek Kiernan <derek.kiernan@amd.com>, Dragan Cvetic <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>, Vaishnav M A <vaishnav.a@ti.com>, Mark Brown <broonie@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated list:ARM/TEXAS INSTRUMENTS K3 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "open list:SPI SUBSYSTEM" <linux-spi@vger.kernel.org>, "moderated list:GREYBUS SUBSYSTEM" <greybus-dev@lists.linaro.org>, Vaishnav M A <vaishnav@beagleboard.org>, Michael Walle <mwalle@kernel.org>, Andrew Lunn <andrew@lunn.ch>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v4 1/5] dt-bindings: misc: Add mikrobus-connector
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/MW6YMIEBOGWGPIINZ4AZBFS4BH37ADZF/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit

On 3/18/24 01:07, Ayush Singh wrote:

> Add DT bindings for mikroBUS interface. MikroBUS is an open standard
> developed by MikroElektronika for connecting add-on boards to
> microcontrollers or microprocessors.
>
> mikroBUS is a connector and does not have a controller. Instead the
> software is responsible for identification of board and setting up /
> registering uart, spi, i2c, pwm and other buses. Thus it needs a way to
> get uart, spi, i2c, pwm and gpio controllers / adapters.
>
> A mikroBUS addon board is free to leave some of the pins unused which
> are marked as NC or Not Connected.
>
> Some of the pins might need to be configured as GPIOs deviating from their
> reserved purposes Eg: SHT15 Click where the SCL and SDA Pins need to be
> configured as GPIOs for the driver (drivers/hwmon/sht15.c) to work.
>
> For some add-on boards the driver may not take care of some additional
> signals like reset/wake-up/other. Eg: ENC28J60 click where the reset line
> (RST pin on the mikrobus port) needs to be pulled high.
>
> Here's the list of pins in mikroBUS connector:
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
> Additionally, some new mikroBUS boards contain 1-wire EEPROM that contains
> a manifest to describe the addon board to provide plug and play
> capabilities.
>
> Link: https://www.mikroe.com/mikrobus
> Link:
> https://download.mikroe.com/documents/standards/mikrobus/mikrobus-standard-specification-v200.pdf
> mikroBUS specification
> Link: https://www.mikroe.com/sht1x-click SHT15 Click
> Link: https://www.mikroe.com/eth-click ENC28J60 Click
> Link: https://www.mikroe.com/clickid ClickID
>
> Co-developed-by: Vaishnav M A <vaishnav@beagleboard.org>
> Signed-off-by: Vaishnav M A <vaishnav@beagleboard.org>
> Signed-off-by: Ayush Singh <ayushdevel1325@gmail.com>
> ---
>   .../connector/mikrobus-connector.yaml         | 113 ++++++++++++++++++
>   MAINTAINERS                                   |   6 +
>   2 files changed, 119 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/connector/mikrobus-connector.yaml
>
> diff --git a/Documentation/devicetree/bindings/connector/mikrobus-connector.yaml b/Documentation/devicetree/bindings/connector/mikrobus-connector.yaml
> new file mode 100644
> index 000000000000..ee3736add41c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/connector/mikrobus-connector.yaml
> @@ -0,0 +1,113 @@
> +# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/connector/mikrobus-connector.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: mikroBUS add-on board socket
> +
> +maintainers:
> +  - Ayush Singh <ayushdevel1325@gmail.com>
> +
> +properties:
> +  compatible:
> +    const: mikrobus-connector
> +
> +  pinctrl-0: true
> +  pinctrl-1: true
> +  pinctrl-2: true
> +  pinctrl-3: true
> +  pinctrl-4: true
> +  pinctrl-5: true
> +  pinctrl-6: true
> +  pinctrl-7: true
> +  pinctrl-8: true
> +
> +  pinctrl-names:
> +    items:
> +      - const: default
> +      - const: pwm_default
> +      - const: pwm_gpio
> +      - const: uart_default
> +      - const: uart_gpio
> +      - const: i2c_default
> +      - const: i2c_gpio
> +      - const: spi_default
> +      - const: spi_gpio
> +
> +  mikrobus-gpios:
> +    minItems: 11
> +    maxItems: 12
> +
> +  i2c-adapter:
> +    description: i2c adapter attached to the mikrobus socket.
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +
> +  spi-controller:
> +    description: spi bus number of the spi-master attached to the mikrobus socket.
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +
> +  uart:
> +    description: uart port attached to the mikrobus socket
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +
> +  pwms:
> +    description: the pwm-controller corresponding to the mikroBUS PWM pin.
> +    maxItems: 1
> +
> +  spi-cs:
> +    description: spi chip-select numbers corresponding to the chip-selects on the mikrobus socket.
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    items:
> +      - description: chip select corresponding to CS pin
> +      - description: chip select corresponding to RST pin
> +
> +required:
> +  - compatible
> +  - pinctrl-0
> +  - pinctrl-1
> +  - pinctrl-2
> +  - pinctrl-3
> +  - pinctrl-4
> +  - pinctrl-5
> +  - pinctrl-6
> +  - pinctrl-7
> +  - pinctrl-8
> +  - i2c-adapter
> +  - spi-controller
> +  - spi-cs
> +  - uart
> +  - pwms
> +  - mikrobus-gpios
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    mikrobus {
> +      compatible = "mikrobus-connector";
> +      pinctrl-names = "default", "pwm_default", "pwm_gpio","uart_default", "uart_gpio", "i2c_default",
> +                      "i2c_gpio", "spi_default", "spi_gpio";
> +      pinctrl-0 = <&P2_03_gpio_input_pin &P1_04_gpio_pin &P1_02_gpio_pin>;
> +      pinctrl-1 = <&P2_01_pwm_pin>;
> +      pinctrl-2 = <&P2_01_gpio_pin>;
> +      pinctrl-3 = <&P2_05_uart_pin &P2_07_uart_pin>;
> +      pinctrl-4 = <&P2_05_gpio_pin &P2_07_gpio_pin>;
> +      pinctrl-5 = <&P2_09_i2c_pin &P2_11_i2c_pin>;
> +      pinctrl-6 = <&P2_09_gpio_pin &P2_11_gpio_pin>;
> +      pinctrl-7 = <&P1_12_spi_pin &P1_10_spi_pin &P1_08_spi_sclk_pin &P1_06_spi_cs_pin>;
> +      pinctrl-8 = <&P1_12_gpio_pin &P1_10_gpio_pin &P1_08_gpio_pin &P1_06_gpio_pin>;
> +      pwms = <&ehrpwm1 0 500000 0>;
> +      i2c-adapter = <&i2c1>;
> +      spi-controller = <&spi1>;
> +      spi-cs = <0 1>;
> +      uart = <&uart1>;
> +      mikrobus-gpios = <&gpio1 18 GPIO_ACTIVE_HIGH>, <&gpio0 23 GPIO_ACTIVE_HIGH>,
> +                       <&gpio0 30 GPIO_ACTIVE_HIGH>, <&gpio0 31 GPIO_ACTIVE_HIGH>,
> +                       <&gpio0 15 GPIO_ACTIVE_HIGH>, <&gpio0 14 GPIO_ACTIVE_HIGH>,
> +                       <&gpio0 4 GPIO_ACTIVE_HIGH>, <&gpio0 3 GPIO_ACTIVE_HIGH>,
> +                       <&gpio0 2 GPIO_ACTIVE_HIGH>, <&gpio0 5 GPIO_ACTIVE_HIGH>,
> +                       <&gpio2 25 GPIO_ACTIVE_HIGH>, <&gpio2 3 GPIO_ACTIVE_HIGH>;
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 375d34363777..69418a058c6b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -14767,6 +14767,12 @@ M:	Oliver Neukum <oliver@neukum.org>
>   S:	Maintained
>   F:	drivers/usb/image/microtek.*
>   
> +MIKROBUS
> +M:	Ayush Singh <ayushdevel1325@gmail.com>
> +M:	Vaishnav M A <vaishnav@beagleboard.org>
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/misc/mikrobus-connector.yaml
> +
>   MIKROTIK CRS3XX 98DX3236 BOARD SUPPORT
>   M:	Luka Kovacic <luka.kovacic@sartura.hr>
>   M:	Luka Perkov <luka.perkov@sartura.hr>


After going through all the discussions here, I have a few questions:

1. Is the old `*_register_device(controller, board_info)` style 
discouraged in favor of using device tree, at least for drivers using 
multiple fundamental buses (i2c, spi, etc)? Or is the problem just that 
these bindings do not leave open the possibility of using device tree 
overlays? Will it be fine if the dt bindings allow for dt overlays, but 
the driver still uses imperative registering of board?

2. Is the preferred way to handle virtual devices (like those created by 
greybus subsystem) now device tree? Is that one of the blockers for 
greybus i2c, spi etc to still be in staging?

3. How are virtual devices created in device tree? If I register an i2c 
adapter using `i2c_add_adapter`, is the device tree entry is dynamically 
created, which can then be used by a device tree overlay?


Ayush Singh

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
