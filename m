Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id BB6B587F700
	for <lists+greybus-dev@lfdr.de>; Tue, 19 Mar 2024 06:58:24 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id BFACB441E1
	for <lists+greybus-dev@lfdr.de>; Tue, 19 Mar 2024 05:58:23 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	by lists.linaro.org (Postfix) with ESMTPS id 596ED3F090
	for <greybus-dev@lists.linaro.org>; Tue, 19 Mar 2024 05:58:21 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linaro.org header.s=google header.b=LwATjdrT;
	dmarc=pass (policy=none) header.from=linaro.org;
	spf=pass (lists.linaro.org: domain of krzysztof.kozlowski@linaro.org designates 209.85.218.50 as permitted sender) smtp.mailfrom=krzysztof.kozlowski@linaro.org
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a44f2d894b7so597671766b.1
        for <greybus-dev@lists.linaro.org>; Mon, 18 Mar 2024 22:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710827900; x=1711432700; darn=lists.linaro.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AHZxkIrQigLNKh0NYZ3VY9vjzcY5knHl+RRNaM0i/mU=;
        b=LwATjdrTVZtqJexe/KUOnvXagado9a+RiYgyM3Z9NMkJ14yh8veXm3wW1qgqaLxmMx
         yZuCCvOahPKS1NObAO6emiKKOUw6gLJVxExKMf6As6aWMWSB2d6H8eoVmqHCkWFmtuiA
         8cs6aQE5dDBD0o9MwiRJQH2RPdCsKvtANUhV0pKqewveT4x1Hn06g7+1Hk5qdy4a+JGp
         20H1vAeCtcHdHLh16aDNwcXT4mpSh5A3YTn7IwAhSo5NGuR3G/l/1vxK5JtitLIZWTgB
         NUbWbx90NO80qkw68KQhY8BGgk4A25lBJCaf8OGsPgoIyNQUeIHxdfyzo02lshlXsjbB
         U/ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710827900; x=1711432700;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AHZxkIrQigLNKh0NYZ3VY9vjzcY5knHl+RRNaM0i/mU=;
        b=uJ7N+63SuadlxAd+o30vQ0FNICzmtlVjJiq9YzuwdNSS5VEZgYGzW6xEd5bvLB7K16
         DctPGK3AWDDbc2nVDKhAKhrx1/fR7rlifjojbHGwVfzhNz7sUj2Rb7OyAVBSU0nypZn9
         Bs8HTKd7Fun6IQbU3wYfso2Ro0QeLqdEhDNBHzIhmwp8EIyBzC3UIKG+NK7PAj7WrfCW
         2m4m5Fdyi82xhegZ3Fria1iyKOq0JUXKaAZYiZI+kaJb45y1LQw9pqBRA/wbvdsDZfjp
         yt6SoO9CjOtMMuXUwgioCLfyPO1POrlJT/QqP4zxpJsYg0Ohf3BqjmOl75T4tJ7MMqKD
         Oecg==
X-Forwarded-Encrypted: i=1; AJvYcCV4aeEDllVuA60mzHKE9C2Db7ltubsRR7Xru3srV5kmxU58RabptBR76jWKdH6yUygqDyAmp8Dr64KNzul2rf2LopYcZltRM+g8X09+
X-Gm-Message-State: AOJu0YyQeqIDDzHErDiSL8Un4F29J6CpNT0+yCD296QgOeBB7WjC/4PF
	2w9bgmXYpBaiOZPPqtQkmcruMqGcf6sh1PZnU2hazEprxofJ/ZBXBJDwj7DnWIU+iQ==
X-Google-Smtp-Source: AGHT+IHwCkG40hy/SFzMED/6wGkOQzF7IaTU5dKiPXmf1qRgBL8tjx21tNtw6xjZGClaExB5EjL6IA==
X-Received: by 2002:a17:906:2787:b0:a46:4771:4611 with SMTP id j7-20020a170906278700b00a4647714611mr8493593ejc.36.1710827900213;
        Mon, 18 Mar 2024 22:58:20 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.97])
        by smtp.gmail.com with ESMTPSA id lg20-20020a170906f89400b00a4664e6ad8esm5616547ejb.169.2024.03.18.22.58.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Mar 2024 22:58:19 -0700 (PDT)
Message-ID: <0f3f56d4-3381-44f1-91bc-c126f3ced085@linaro.org>
Date: Tue, 19 Mar 2024 06:58:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Ayush Singh <ayushdevel1325@gmail.com>, Michael Walle
 <mwalle@kernel.org>, open list <linux-kernel@vger.kernel.org>
References: <20240317193714.403132-1-ayushdevel1325@gmail.com>
 <20240317193714.403132-2-ayushdevel1325@gmail.com>
 <CZWVF90JJO98.2M7ARQ9WMGC94@kernel.org>
 <d4dc4d94-d323-4158-8c08-b7d37d8750d3@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <d4dc4d94-d323-4158-8c08-b7d37d8750d3@gmail.com>
X-Rspamd-Queue-Id: 596ED3F090
X-Spamd-Bar: ------
X-Spamd-Result: default: False [-6.59 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.218.50:from];
	XM_UA_NO_VERSION(0.01)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	TAGGED_RCPT(0.00)[dt];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,vger.kernel.org];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: QJ2G4WMMQQWK5FCLJSAUXSFBPDKVLSA3
X-Message-ID-Hash: QJ2G4WMMQQWK5FCLJSAUXSFBPDKVLSA3
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: robertcnelson@beagleboard.org, lorforlinux@beagleboard.org, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, Derek Kiernan <derek.kiernan@amd.com>, Dragan Cvetic <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>, Vaishnav M A <vaishnav.a@ti.com>, Mark Brown <broonie@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated list:ARM/TEXAS INSTRUMENTS K3 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "open list:SPI SUBSYSTEM" <linux-spi@vger.kernel.org>, "moderated list:GREYBUS SUBSYSTEM" <greybus-dev@lists.linaro.org>, Vaishnav M A <vaishnav@beagleboard.org>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v4 1/5] dt-bindings: misc: Add mikrobus-connector
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/QJ2G4WMMQQWK5FCLJSAUXSFBPDKVLSA3/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 18/03/2024 18:20, Ayush Singh wrote:
> On 3/18/24 17:52, Michael Walle wrote:
> 
>> On Sun Mar 17, 2024 at 8:37 PM CET, Ayush Singh wrote:
>>> Add DT bindings for mikroBUS interface. MikroBUS is an open standard
>>> developed by MikroElektronika for connecting add-on boards to
>>> microcontrollers or microprocessors.
>>>
>>> mikroBUS is a connector and does not have a controller. Instead the
>>> software is responsible for identification of board and setting up /
>>> registering uart, spi, i2c, pwm and other buses. Thus it needs a way to
>>> get uart, spi, i2c, pwm and gpio controllers / adapters.
>>>
>>> A mikroBUS addon board is free to leave some of the pins unused which
>>> are marked as NC or Not Connected.
>>>
>>> Some of the pins might need to be configured as GPIOs deviating from their
>>> reserved purposes Eg: SHT15 Click where the SCL and SDA Pins need to be
>>> configured as GPIOs for the driver (drivers/hwmon/sht15.c) to work.
>>>
>>> For some add-on boards the driver may not take care of some additional
>>> signals like reset/wake-up/other. Eg: ENC28J60 click where the reset line
>>> (RST pin on the mikrobus port) needs to be pulled high.
>>>
>>> Here's the list of pins in mikroBUS connector:
>>> Analog - AN
>>> Reset - RST
>>> SPI Chip Select - CS
>>> SPI Clock - SCK
>>> SPI Master Input Slave Output - MISO
>>> SPI Master Output Slave Input - MOSI
>>> VCC-3.3V power - +3.3V
>>> Reference Ground - GND
>>> PWM - PWM output
>>> INT - Hardware Interrupt
>>> RX - UART Receive
>>> TX - UART Transmit
>>> SCL - I2C Clock
>>> SDA - I2C Data
>>> +5V - VCC-5V power
>>> GND - Reference Ground
>>>
>>> Additionally, some new mikroBUS boards contain 1-wire EEPROM that contains
>>> a manifest to describe the addon board to provide plug and play
>>> capabilities.
>>>
>>> Link: https://www.mikroe.com/mikrobus
>>> Link:
>>> https://download.mikroe.com/documents/standards/mikrobus/mikrobus-standard-specification-v200.pdf
>>> mikroBUS specification
>>> Link: https://www.mikroe.com/sht1x-click SHT15 Click
>>> Link: https://www.mikroe.com/eth-click ENC28J60 Click
>>> Link: https://www.mikroe.com/clickid ClickID
>>>
>>> Co-developed-by: Vaishnav M A <vaishnav@beagleboard.org>
>>> Signed-off-by: Vaishnav M A <vaishnav@beagleboard.org>
>>> Signed-off-by: Ayush Singh <ayushdevel1325@gmail.com>
>>> ---
>>>   .../connector/mikrobus-connector.yaml         | 113 ++++++++++++++++++
>> See also
>> https://lore.kernel.org/r/YmFo+EntwxIsco%2Ft@robh.at.kernel.org/
>>
>> Looks like this proposal doesn't have the subnodes. How do you
>> attach a kernel driver to it's spi port for example? Only through
>> the manifest files?
>>
>> -michael
> 
> 
> So I looked at the Patch, and it seems the approach of fundamentally 
> different than this PR. So, let me try to explain what this patch set 
> does for an add-on board using SPI.
> 
> The device tree defines the SPI controller associated with mikroBUS SPI 
> pins. The driver on match queries and takes a reference to the SPI 
> controller but does nothing with it. Once a mikroBUS add-on board is 
> detected (by passing manifest using sysfs or reading from 1-wire 
> EEPROM), the driver parses the manifest, and if it detects an SPI device 

As I understood Mikrobus does not have EEPROM.

> in manifest, it registers SPI device along with setting properties such 
> as `chip_select`, `max_speed_hz`, `mode`, etc., which are defined in the 
> manifest. On board removal, it unregisters the SPI device and waits for 
> a new mikroBUS board to be detected again.

You explained drivers, not hardware for DT.

> 
> It is also possible for SPI not to be used by a device, in which case, 
> no SPI device is registered to the controller. It is also possible that 
> the SPI pins will be used as normal GPIOs. Everything is identified from 
> the manifest.


Best regards,
Krzysztof

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
