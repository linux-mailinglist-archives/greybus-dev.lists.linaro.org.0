Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id A978187F87B
	for <lists+greybus-dev@lfdr.de>; Tue, 19 Mar 2024 08:37:02 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id B2D4844379
	for <lists+greybus-dev@lfdr.de>; Tue, 19 Mar 2024 07:37:01 +0000 (UTC)
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	by lists.linaro.org (Postfix) with ESMTPS id 978CB44372
	for <greybus-dev@lists.linaro.org>; Tue, 19 Mar 2024 07:36:58 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=ew49y6W9;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (lists.linaro.org: domain of ayushdevel1325@gmail.com designates 209.85.161.41 as permitted sender) smtp.mailfrom=ayushdevel1325@gmail.com
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-5a4a14c52fcso1115798eaf.1
        for <greybus-dev@lists.linaro.org>; Tue, 19 Mar 2024 00:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710833818; x=1711438618; darn=lists.linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YHCJlZjtshIG0jJom0kvx9m2BM/FXwZE6cIGEiQKBVE=;
        b=ew49y6W9oQJGs4tmc3c46jhymf/abeotr1v8r04oebCrOEEQhFxOsUJzTfpAro615D
         01zNVBd0A6o89y7vdr7cabWzZCcsSpNhTQ+SjpjbG77L5kxHjobyiwOnrK47HFxUuLJm
         VTk1Z6KSWsQ0rPrEMN4R3O2L3wEB8gK2W1fjrugT1ZOlreHMKp+svdykq0rbLKHFpZcc
         vZCbpPj30NfNCu4GRfXL6dJAOfeh34ElpdQxIqMZjluxzKHz2KSL3B4ddsZ2E1SL7tzZ
         CrkOurxr1YX/gbS17AV+vz4+05XFogJQn295UNqBgdqdZIN7tL72TWvg7ug7WiTaDFgc
         IWVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710833818; x=1711438618;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YHCJlZjtshIG0jJom0kvx9m2BM/FXwZE6cIGEiQKBVE=;
        b=dQHXNNOSNPUJBqZcQS9zh52HIOlFbgTgR5qnak0uCee4zHiyOxXXEsIwUM4tCGMVg0
         exy9lHlKQTHC66viECcXRWdqFs7vjLkJu/liaMIQ3JLB0R8yPuh8CYpr53d2sPT1gi8D
         lY4fTTYeOyOcWPVrU8HxcQKx3YB+mpBR6TAEDdvzNob8FJByzmtrVx6Gnq6itW43DIge
         JDbsLLLywam7lmCw88CPwZBon5J+8/hHgCEhJA2tqXJjCilp6QFSB5nD0m+IgsxhvyPt
         RfKhsf9BynAvYdy/KAaV59L8xsQxUF+61tmqsWFg0WjJoSYpCv+zUIpSmtc2+pfQ5Pv1
         wXlA==
X-Forwarded-Encrypted: i=1; AJvYcCX7xT3tLdQy1tknE9fb1sk74My6Xz7FO4MI49jf9GN/FF1frF7PHktJZva7HRznDBSVSP86H+UKuQI/XI+//C88qKOPCANM/C7JAyEd
X-Gm-Message-State: AOJu0YwTzf9Hhiuk/vDrIic947ox+SLMmQSKr1LkXqtYegFmRc1dqQDC
	9ihxVvjfTXRPIWkTfjDDyzZBCDnSivIgez9QcN8QI7NPr+s8IfXz
X-Google-Smtp-Source: AGHT+IHjuPClKQPIBso0PeBaQRxcjfszD2QnTuP0HROvRIimQAr/wBK/UV5WSm8hqR9OEWW0N8sFWw==
X-Received: by 2002:a05:6358:4319:b0:17e:69fd:e8cc with SMTP id r25-20020a056358431900b0017e69fde8ccmr8283727rwc.21.1710833817767;
        Tue, 19 Mar 2024 00:36:57 -0700 (PDT)
Received: from [172.16.116.58] ([103.15.228.94])
        by smtp.gmail.com with ESMTPSA id e15-20020aa7980f000000b006e6988c64a5sm9100478pfl.208.2024.03.19.00.36.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Mar 2024 00:36:57 -0700 (PDT)
Message-ID: <c8031e17-5ae8-4794-8b8c-1736be6452d3@gmail.com>
Date: Tue, 19 Mar 2024 13:06:39 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Michael Walle <mwalle@kernel.org>, open list <linux-kernel@vger.kernel.org>
References: <20240317193714.403132-1-ayushdevel1325@gmail.com>
 <20240317193714.403132-2-ayushdevel1325@gmail.com>
 <CZWVF90JJO98.2M7ARQ9WMGC94@kernel.org>
 <d4dc4d94-d323-4158-8c08-b7d37d8750d3@gmail.com>
 <0f3f56d4-3381-44f1-91bc-c126f3ced085@linaro.org>
From: Ayush Singh <ayushdevel1325@gmail.com>
In-Reply-To: <0f3f56d4-3381-44f1-91bc-c126f3ced085@linaro.org>
X-Rspamd-Queue-Id: 978CB44372
X-Spamd-Bar: ------
X-Spamd-Result: default: False [-6.59 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.161.41:from];
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
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dt];
	DWL_DNSWL_BLOCKED(0.00)[gmail.com:dkim];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: I46FPLGYPDYKTZ22OEQBPJIFCQXK7UMS
X-Message-ID-Hash: I46FPLGYPDYKTZ22OEQBPJIFCQXK7UMS
X-MailFrom: ayushdevel1325@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: robertcnelson@beagleboard.org, lorforlinux@beagleboard.org, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, Derek Kiernan <derek.kiernan@amd.com>, Dragan Cvetic <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>, Vaishnav M A <vaishnav.a@ti.com>, Mark Brown <broonie@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated list:ARM/TEXAS INSTRUMENTS K3 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "open list:SPI SUBSYSTEM" <linux-spi@vger.kernel.org>, "moderated list:GREYBUS SUBSYSTEM" <greybus-dev@lists.linaro.org>, Vaishnav M A <vaishnav@beagleboard.org>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v4 1/5] dt-bindings: misc: Add mikrobus-connector
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/I46FPLGYPDYKTZ22OEQBPJIFCQXK7UMS/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit

On 3/19/24 11:28, Krzysztof Kozlowski wrote:

> On 18/03/2024 18:20, Ayush Singh wrote:
>> On 3/18/24 17:52, Michael Walle wrote:
>>
>>> On Sun Mar 17, 2024 at 8:37 PM CET, Ayush Singh wrote:
>>>> Add DT bindings for mikroBUS interface. MikroBUS is an open standard
>>>> developed by MikroElektronika for connecting add-on boards to
>>>> microcontrollers or microprocessors.
>>>>
>>>> mikroBUS is a connector and does not have a controller. Instead the
>>>> software is responsible for identification of board and setting up /
>>>> registering uart, spi, i2c, pwm and other buses. Thus it needs a way to
>>>> get uart, spi, i2c, pwm and gpio controllers / adapters.
>>>>
>>>> A mikroBUS addon board is free to leave some of the pins unused which
>>>> are marked as NC or Not Connected.
>>>>
>>>> Some of the pins might need to be configured as GPIOs deviating from their
>>>> reserved purposes Eg: SHT15 Click where the SCL and SDA Pins need to be
>>>> configured as GPIOs for the driver (drivers/hwmon/sht15.c) to work.
>>>>
>>>> For some add-on boards the driver may not take care of some additional
>>>> signals like reset/wake-up/other. Eg: ENC28J60 click where the reset line
>>>> (RST pin on the mikrobus port) needs to be pulled high.
>>>>
>>>> Here's the list of pins in mikroBUS connector:
>>>> Analog - AN
>>>> Reset - RST
>>>> SPI Chip Select - CS
>>>> SPI Clock - SCK
>>>> SPI Master Input Slave Output - MISO
>>>> SPI Master Output Slave Input - MOSI
>>>> VCC-3.3V power - +3.3V
>>>> Reference Ground - GND
>>>> PWM - PWM output
>>>> INT - Hardware Interrupt
>>>> RX - UART Receive
>>>> TX - UART Transmit
>>>> SCL - I2C Clock
>>>> SDA - I2C Data
>>>> +5V - VCC-5V power
>>>> GND - Reference Ground
>>>>
>>>> Additionally, some new mikroBUS boards contain 1-wire EEPROM that contains
>>>> a manifest to describe the addon board to provide plug and play
>>>> capabilities.
>>>>
>>>> Link: https://www.mikroe.com/mikrobus
>>>> Link:
>>>> https://download.mikroe.com/documents/standards/mikrobus/mikrobus-standard-specification-v200.pdf
>>>> mikroBUS specification
>>>> Link: https://www.mikroe.com/sht1x-click SHT15 Click
>>>> Link: https://www.mikroe.com/eth-click ENC28J60 Click
>>>> Link: https://www.mikroe.com/clickid ClickID
>>>>
>>>> Co-developed-by: Vaishnav M A <vaishnav@beagleboard.org>
>>>> Signed-off-by: Vaishnav M A <vaishnav@beagleboard.org>
>>>> Signed-off-by: Ayush Singh <ayushdevel1325@gmail.com>
>>>> ---
>>>>    .../connector/mikrobus-connector.yaml         | 113 ++++++++++++++++++
>>> See also
>>> https://lore.kernel.org/r/YmFo+EntwxIsco%2Ft@robh.at.kernel.org/
>>>
>>> Looks like this proposal doesn't have the subnodes. How do you
>>> attach a kernel driver to it's spi port for example? Only through
>>> the manifest files?
>>>
>>> -michael
>>
>> So I looked at the Patch, and it seems the approach of fundamentally
>> different than this PR. So, let me try to explain what this patch set
>> does for an add-on board using SPI.
>>
>> The device tree defines the SPI controller associated with mikroBUS SPI
>> pins. The driver on match queries and takes a reference to the SPI
>> controller but does nothing with it. Once a mikroBUS add-on board is
>> detected (by passing manifest using sysfs or reading from 1-wire
>> EEPROM), the driver parses the manifest, and if it detects an SPI device
> As I understood Mikrobus does not have EEPROM.

mikroBUS add-on boards do not need to have EEPROM, but they can have it. 
Simply put, EEPROM is not part of mikroBUS specification, but you will 
find a lot (especially newer) addon boards with support for EEPROM manifest.

Regardless, this patch actually does not contain any code for EEPROM 
support I have just mentioned it to give more context on why mikroBUS 
manifest is the focus of this patch instead of DT overlay or something 
else.

>> in manifest, it registers SPI device along with setting properties such
>> as `chip_select`, `max_speed_hz`, `mode`, etc., which are defined in the
>> manifest. On board removal, it unregisters the SPI device and waits for
>> a new mikroBUS board to be detected again.
> You explained drivers, not hardware for DT.


Yes, I was replying to the question posed by Michael. Since this happens 
in the driver and not in the devicetree, I needed to explain the working 
of the driver:


 > How do you attach a kernel driver to it's spi port for example?


For more hardware side, the bindings are for mikrobus connector rather 
than for any addon board. Thus, while an addon board might not use some 
of the pins, the connector still needs to have all the pins and 
associated controllers.

>> It is also possible for SPI not to be used by a device, in which case,
>> no SPI device is registered to the controller. It is also possible that
>> the SPI pins will be used as normal GPIOs. Everything is identified from
>> the manifest.
>
> Best regards,
> Krzysztof
>

Ayush Singh

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
