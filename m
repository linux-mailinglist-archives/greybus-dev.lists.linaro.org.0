Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 159AA87D4E6
	for <lists+greybus-dev@lfdr.de>; Fri, 15 Mar 2024 21:20:28 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 1DE133F387
	for <lists+greybus-dev@lfdr.de>; Fri, 15 Mar 2024 20:20:27 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	by lists.linaro.org (Postfix) with ESMTPS id 86FDD3F387
	for <greybus-dev@lists.linaro.org>; Fri, 15 Mar 2024 20:20:20 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linaro.org header.s=google header.b="xnr9eAR/";
	spf=pass (lists.linaro.org: domain of krzysztof.kozlowski@linaro.org designates 209.85.167.45 as permitted sender) smtp.mailfrom=krzysztof.kozlowski@linaro.org;
	dmarc=pass (policy=none) header.from=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-513173e8191so3349836e87.1
        for <greybus-dev@lists.linaro.org>; Fri, 15 Mar 2024 13:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710534019; x=1711138819; darn=lists.linaro.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nFLXmRhGh05ZQ+tNAE5GDIqilWlaMO+4VWUU/gtzhg8=;
        b=xnr9eAR/2QXYRKSbnIBWeR4Xr0ehMrwDIkf2YnomllJpEyysmA3umWDjoNAqft4HAC
         unaU3eyqrosmp4xnXyOHqr16Br1FMJ+w7lv7jKcXY2Z0nxdgS/eG7fhPR7q88UfnlQ72
         CxEyMVCk++SKj38RaXOQt5mVY88tGzijQqZJdKXmgvcDXh+Na21yFFd4U5TnGkaWpf2v
         awa1wUC5HKSaSyrmzOuEPVu9JBiK+4EfFdQysvkb5OdKqanU+13pchab3q0xVn8dr0uJ
         nHbT8Kw5aEDa60y7Se+XETS41KLxkM5lyN6VyrgTFsck0IOo9SOtOMdwQ9i9EMWdtD86
         1vNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710534019; x=1711138819;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nFLXmRhGh05ZQ+tNAE5GDIqilWlaMO+4VWUU/gtzhg8=;
        b=ZltYs8ylAQHtNG3/YKurigRLXLrbp5MV7+olMt9z5QqmOx0Pv5BS/m6Ad+s40AO0zZ
         wxLt33VhiAoTP5zMREvrqG8M0PkX3Z+MH/ud2jKL80klUX7bw7fP3+oBCOQ4IL6tvMb6
         vb/k7+AaSesF+aT91fwcL2S3hRNE7GpcqGVEPptAGSXDOO7Ovf82EWO5eo9jRe4VwLNa
         O30udynXSQsztqzoD3nICba3bkkF/S+kz1EKkhCTWCsvbfH3im/1WjKhap+xGgabYTpU
         n+vzOABJ0kLUUCKLkBJQox0Qjf8RZqw0QUAPkutYqMZbdRPSZvTyT6Sqc3nonA7wD1Dy
         Ra8Q==
X-Forwarded-Encrypted: i=1; AJvYcCU+30MPldQRLMMHs2Oc1+NadXOVKm+cmIzBvwAoaN73zUYjNCjPPNzElW04+OQUiJ2f1V2DFKCdsK4UkDpSybYZQ91YYXxzQ0txF36x
X-Gm-Message-State: AOJu0Yykh7bTCG1f468NmmZMWl6X29tBV/3e9GJw3uBaGyKwMYbvDukx
	+hGWbhTunyZHMBA1g+SCBGUhxcOPbG9RMh7cTgvghyIjsJvgMfPqceZaawkf5AL1Mw==
X-Google-Smtp-Source: AGHT+IF4vTBppgdKLxPs0gyXIFUHd6EcJY0uvVQJV5qIJs0T7dA0+OeqNjD+A2cte5EpHKfHfRAhuQ==
X-Received: by 2002:a05:6512:2815:b0:513:a39e:ae45 with SMTP id cf21-20020a056512281500b00513a39eae45mr5383892lfb.62.1710534019273;
        Fri, 15 Mar 2024 13:20:19 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.97])
        by smtp.gmail.com with ESMTPSA id u8-20020a5d4688000000b0033e3c4e600asm3953082wrq.7.2024.03.15.13.20.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Mar 2024 13:20:18 -0700 (PDT)
Message-ID: <b2e76011-8645-445f-b92d-54ce9cef3c3f@linaro.org>
Date: Fri, 15 Mar 2024 21:20:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Ayush Singh <ayushdevel1325@gmail.com>, linux-kernel@vger.kernel.org
References: <20240315184908.500352-1-ayushdevel1325@gmail.com>
 <20240315184908.500352-9-ayushdevel1325@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240315184908.500352-9-ayushdevel1325@gmail.com>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 86FDD3F387
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
	URIBL_BLOCKED(0.00)[linaro.org:dkim,mail-lf1-f45.google.com:rdns,mail-lf1-f45.google.com:helo];
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
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.167.45:from];
	TO_DN_SOME(0.00)[]
Message-ID-Hash: QD6GMGTYSF2QZN6ZZ7XQSY3C2N5NT2MK
X-Message-ID-Hash: QD6GMGTYSF2QZN6ZZ7XQSY3C2N5NT2MK
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: robertcnelson@beagleboard.org, Vaishnav M A <vaishnav@beagleboard.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, Derek Kiernan <derek.kiernan@amd.com>, Dragan Cvetic <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jiri Slaby <jirislaby@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org, linux-serial@vger.kernel.org, greybus-dev@lists.linaro.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v3 8/8] dts: ti: k3-am625-beagleplay: Add mikroBUS
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/QD6GMGTYSF2QZN6ZZ7XQSY3C2N5NT2MK/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 15/03/2024 19:49, Ayush Singh wrote:
> Add mikroBUS connector support for Beagleplay.
> 
> Signed-off-by: Ayush Singh <ayushdevel1325@gmail.com>
> ---
>  .../arm64/boot/dts/ti/k3-am625-beagleplay.dts | 76 +++++++++++++++++--
>  1 file changed, 68 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts b/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts
> index a34e0df2ab86..886308f99d1a 100644
> --- a/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts
> +++ b/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts
> @@ -29,6 +29,7 @@ aliases {
>  		i2c3 = &main_i2c3;
>  		i2c4 = &wkup_i2c0;
>  		i2c5 = &mcu_i2c0;
> +		mikrobus0 = &mikrobus0;
>  		mmc0 = &sdhci0;
>  		mmc1 = &sdhci1;
>  		mmc2 = &sdhci2;
> @@ -230,6 +231,33 @@ simple-audio-card,codec {
>  		};
>  	};
>  
> +	mikrobus0: linux-mikrobus {

Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation


mikrobus {

> +		compatible = "mikrobus-connector";
> +		pinctrl-names = "default", "pwm_default", "pwm_gpio",
> +				"uart_default", "uart_gpio", "i2c_default",
> +				"i2c_gpio", "spi_default", "spi_gpio";
> +		pinctrl-0 = <&mikrobus_gpio_pins_default>;
> +		pinctrl-1 = <&mikrobus_pwm_pins_default>;
> +		pinctrl-2 = <&mikrobus_pwm_pins_gpio>;
> +		pinctrl-3 = <&mikrobus_uart_pins_default>;
> +		pinctrl-4 = <&mikrobus_uart_pins_gpio>;
> +		pinctrl-5 = <&mikrobus_i2c_pins_default>;
> +		pinctrl-6 = <&mikrobus_i2c_pins_gpio>;
> +		pinctrl-7 = <&mikrobus_spi_pins_default>;
> +		pinctrl-8 = <&mikrobus_spi_pins_gpio>;
> +		i2c-adapter = <&main_i2c3>;
> +		spi-controller = <&main_spi2>;
> +		spi-cs = <0 1>;
> +		uart = <&main_uart5>;
> +		pwms = <&ecap2 0 500000 0>;
> +		mikrobus-gpios =
> +		<&main_gpio1 11 GPIO_ACTIVE_HIGH>, <&main_gpio1 9 GPIO_ACTIVE_HIGH>,

Join with previous line.
> +		<&main_gpio1 24 GPIO_ACTIVE_HIGH>, <&main_gpio1 25 GPIO_ACTIVE_HIGH>,

Fix indentation. See DTS coding style.

> +		<&main_gpio1 22 GPIO_ACTIVE_HIGH>, <&main_gpio1 23 GPIO_ACTIVE_HIGH>,
> +		<&main_gpio1 7 GPIO_ACTIVE_HIGH>, <&main_gpio1 8 GPIO_ACTIVE_HIGH>,
> +		<&main_gpio1 14 GPIO_ACTIVE_HIGH>, <&main_gpio1 13 GPIO_ACTIVE_HIGH>,
> +		<&main_gpio1 12 GPIO_ACTIVE_HIGH>, <&main_gpio1 10 GPIO_ACTIVE_HIGH>;
> +	};
>  };
>  

>  
>  &main_spi2 {
> -	pinctrl-names = "default";
> -	pinctrl-0 = <&mikrobus_spi_pins_default>;
>  	status = "okay";
>  };
>  
> @@ -875,9 +932,8 @@ &main_uart1 {
>  };
>  
>  &main_uart5 {
> -	pinctrl-names = "default";
> -	pinctrl-0 = <&mikrobus_uart_pins_default>;
>  	status = "okay";
> +	force-empty-serdev-controller;

NAK. Don't add undocumented properties. That's a clear no go.

Best regards,
Krzysztof

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
