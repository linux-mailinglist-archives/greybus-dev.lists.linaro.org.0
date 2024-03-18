Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 7027487EE9D
	for <lists+greybus-dev@lfdr.de>; Mon, 18 Mar 2024 18:21:14 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 5F37C40F12
	for <lists+greybus-dev@lfdr.de>; Mon, 18 Mar 2024 17:21:13 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	by lists.linaro.org (Postfix) with ESMTPS id E531D3F326
	for <greybus-dev@lists.linaro.org>; Mon, 18 Mar 2024 17:21:10 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=lI8Yefxh;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (lists.linaro.org: domain of ayushdevel1325@gmail.com designates 209.85.214.177 as permitted sender) smtp.mailfrom=ayushdevel1325@gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1e02f839d66so7286235ad.1
        for <greybus-dev@lists.linaro.org>; Mon, 18 Mar 2024 10:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710782470; x=1711387270; darn=lists.linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x/knzn9bTkesJADirI8KqYpzRa+RPpd7vXsAjKTfoE4=;
        b=lI8Yefxh9vxowPaoChjVAwjJAY0QuNlZjHbmVkhrgsLXrxiYCcA6NI5OmFHwuz7B4E
         XJ55YKMK/Y9n9qJxaHdm7Y4k64YuyT/oGdlHbOWTbTMGgAaXn6m/arbkGnSdgrsVvEpb
         5DiDI8yewyCtcHDoxy+E304XdEl1nPTszs1c8zKz/Q0RAZ8bJvEE8rl3U/1zl+PHMWE1
         /aukxLrLdUr7r0tUtSafwCHawtBVGfdU6JNHIS8gPYBeT13ovjhAxTq0grTG1DWpfwEs
         rLjXokvY8eJ5an+dcU9HybbNqL/DssRJvimY7gQG3607v8+lRDx4b4cLoAFg9bITx+Zw
         rYgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710782470; x=1711387270;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x/knzn9bTkesJADirI8KqYpzRa+RPpd7vXsAjKTfoE4=;
        b=FZoOqqyyqCJLjjfL6Q6Cm5jXMUq125WRSAlNZa/w0yN4QPSLVKlAg2vKURjM1eAS3w
         Euk0YRMtIgj+E5hnDjPqC6XSpRc/itFqQnCTqLYSTr0gx6dLGHIZB6HzhAkQwez5oBmD
         aREhf02A+3uZjGcNVhgvj1mZwN+YK5LpjXYWRjLItyqaq90ID/K++o3dJtD8FRbsbqXZ
         5hRRrjUr/SEq5B4HOz0PrpNCgCmfuPUnCWySgZUoswmKY8vkLYvqSZIAQE0HyBFHuO9K
         sx4yojLgl+voys4nf0TdDoNiH/MYpQ5XjcRL/YuIUiJj1CCf84rkTjaINZn60n5v/jmp
         RhrQ==
X-Forwarded-Encrypted: i=1; AJvYcCXrMXo4xbaxE+qLtbrhluKwdI0u8BQY65P9mtzDTFfRnt0hensCtOSab803Kr5Qmi98PhyzDCkAf32t0nohZ9d0geYgXZBsDuMGNqIg
X-Gm-Message-State: AOJu0YzdKm/NpOhPCvvafR8vTkz7zPSNPJK6pgWPAvqCT9wC9QnzjkNl
	w/v4BtuYyiPQy2GTq8sn3J4/6pz1W/nzIki1TTVw9dmgny1trcwF
X-Google-Smtp-Source: AGHT+IEwDsNP9+G3XFWSMW4+vV0LFrP4NkkcgrwJoaAAj13Gy3eFsigEPk/8RfGXbGr0lNwTF62eRA==
X-Received: by 2002:a17:902:fc47:b0:1df:fe8a:2284 with SMTP id me7-20020a170902fc4700b001dffe8a2284mr7559061plb.8.1710782469893;
        Mon, 18 Mar 2024 10:21:09 -0700 (PDT)
Received: from [172.16.116.58] ([103.15.228.94])
        by smtp.gmail.com with ESMTPSA id lb4-20020a170902fa4400b001e0287592c4sm2177195plb.267.2024.03.18.10.21.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Mar 2024 10:21:09 -0700 (PDT)
Message-ID: <d4dc4d94-d323-4158-8c08-b7d37d8750d3@gmail.com>
Date: Mon, 18 Mar 2024 22:50:51 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Michael Walle <mwalle@kernel.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20240317193714.403132-1-ayushdevel1325@gmail.com>
 <20240317193714.403132-2-ayushdevel1325@gmail.com>
 <CZWVF90JJO98.2M7ARQ9WMGC94@kernel.org>
From: Ayush Singh <ayushdevel1325@gmail.com>
In-Reply-To: <CZWVF90JJO98.2M7ARQ9WMGC94@kernel.org>
X-Rspamd-Queue-Id: E531D3F326
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.59 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.214.177:from];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	DNSWL_BLOCKED(0.00)[103.15.228.94:received,209.85.214.177:from];
	MID_RHS_MATCH_FROM(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dt];
	FREEMAIL_ENVFROM(0.00)[gmail.com]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: EQUMY4YL6OS3Z427AN5TTODZEXAMGCPV
X-Message-ID-Hash: EQUMY4YL6OS3Z427AN5TTODZEXAMGCPV
X-MailFrom: ayushdevel1325@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: robertcnelson@beagleboard.org, lorforlinux@beagleboard.org, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, Derek Kiernan <derek.kiernan@amd.com>, Dragan Cvetic <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>, Vaishnav M A <vaishnav.a@ti.com>, Mark Brown <broonie@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated list:ARM/TEXAS INSTRUMENTS K3 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "open list:SPI SUBSYSTEM" <linux-spi@vger.kernel.org>, "moderated list:GREYBUS SUBSYSTEM" <greybus-dev@lists.linaro.org>, Vaishnav M A <vaishnav@beagleboard.org>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v4 1/5] dt-bindings: misc: Add mikrobus-connector
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/EQUMY4YL6OS3Z427AN5TTODZEXAMGCPV/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit

On 3/18/24 17:52, Michael Walle wrote:

> On Sun Mar 17, 2024 at 8:37 PM CET, Ayush Singh wrote:
>> Add DT bindings for mikroBUS interface. MikroBUS is an open standard
>> developed by MikroElektronika for connecting add-on boards to
>> microcontrollers or microprocessors.
>>
>> mikroBUS is a connector and does not have a controller. Instead the
>> software is responsible for identification of board and setting up /
>> registering uart, spi, i2c, pwm and other buses. Thus it needs a way to
>> get uart, spi, i2c, pwm and gpio controllers / adapters.
>>
>> A mikroBUS addon board is free to leave some of the pins unused which
>> are marked as NC or Not Connected.
>>
>> Some of the pins might need to be configured as GPIOs deviating from their
>> reserved purposes Eg: SHT15 Click where the SCL and SDA Pins need to be
>> configured as GPIOs for the driver (drivers/hwmon/sht15.c) to work.
>>
>> For some add-on boards the driver may not take care of some additional
>> signals like reset/wake-up/other. Eg: ENC28J60 click where the reset line
>> (RST pin on the mikrobus port) needs to be pulled high.
>>
>> Here's the list of pins in mikroBUS connector:
>> Analog - AN
>> Reset - RST
>> SPI Chip Select - CS
>> SPI Clock - SCK
>> SPI Master Input Slave Output - MISO
>> SPI Master Output Slave Input - MOSI
>> VCC-3.3V power - +3.3V
>> Reference Ground - GND
>> PWM - PWM output
>> INT - Hardware Interrupt
>> RX - UART Receive
>> TX - UART Transmit
>> SCL - I2C Clock
>> SDA - I2C Data
>> +5V - VCC-5V power
>> GND - Reference Ground
>>
>> Additionally, some new mikroBUS boards contain 1-wire EEPROM that contains
>> a manifest to describe the addon board to provide plug and play
>> capabilities.
>>
>> Link: https://www.mikroe.com/mikrobus
>> Link:
>> https://download.mikroe.com/documents/standards/mikrobus/mikrobus-standard-specification-v200.pdf
>> mikroBUS specification
>> Link: https://www.mikroe.com/sht1x-click SHT15 Click
>> Link: https://www.mikroe.com/eth-click ENC28J60 Click
>> Link: https://www.mikroe.com/clickid ClickID
>>
>> Co-developed-by: Vaishnav M A <vaishnav@beagleboard.org>
>> Signed-off-by: Vaishnav M A <vaishnav@beagleboard.org>
>> Signed-off-by: Ayush Singh <ayushdevel1325@gmail.com>
>> ---
>>   .../connector/mikrobus-connector.yaml         | 113 ++++++++++++++++++
> See also
> https://lore.kernel.org/r/YmFo+EntwxIsco%2Ft@robh.at.kernel.org/
>
> Looks like this proposal doesn't have the subnodes. How do you
> attach a kernel driver to it's spi port for example? Only through
> the manifest files?
>
> -michael


So I looked at the Patch, and it seems the approach of fundamentally 
different than this PR. So, let me try to explain what this patch set 
does for an add-on board using SPI.

The device tree defines the SPI controller associated with mikroBUS SPI 
pins. The driver on match queries and takes a reference to the SPI 
controller but does nothing with it. Once a mikroBUS add-on board is 
detected (by passing manifest using sysfs or reading from 1-wire 
EEPROM), the driver parses the manifest, and if it detects an SPI device 
in manifest, it registers SPI device along with setting properties such 
as `chip_select`, `max_speed_hz`, `mode`, etc., which are defined in the 
manifest. On board removal, it unregisters the SPI device and waits for 
a new mikroBUS board to be detected again.

It is also possible for SPI not to be used by a device, in which case, 
no SPI device is registered to the controller. It is also possible that 
the SPI pins will be used as normal GPIOs. Everything is identified from 
the manifest.


Ayush Singh

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
