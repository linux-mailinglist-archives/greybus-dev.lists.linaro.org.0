Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id AB2F987E968
	for <lists+greybus-dev@lfdr.de>; Mon, 18 Mar 2024 13:37:41 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id B868744244
	for <lists+greybus-dev@lfdr.de>; Mon, 18 Mar 2024 12:37:40 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	by lists.linaro.org (Postfix) with ESMTPS id DA69E3F326
	for <greybus-dev@lists.linaro.org>; Mon, 18 Mar 2024 12:37:37 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=cZIhoWb+;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (lists.linaro.org: domain of ayushdevel1325@gmail.com designates 209.85.210.173 as permitted sender) smtp.mailfrom=ayushdevel1325@gmail.com
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-6e6cb0f782bso3586117b3a.1
        for <greybus-dev@lists.linaro.org>; Mon, 18 Mar 2024 05:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710765457; x=1711370257; darn=lists.linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HanPhs+5pxNZQ2UN6SW5+54Ajhvbvl08qcxZF5kLZJw=;
        b=cZIhoWb+qjUn2gHJXQO8zwRGprzCsVP5ehionax6Wj1Isj8SZPVViDJuL2qXEV7HhG
         enYb0gCvUT+CAhSfrkmA5Q1dURic3DCvK99YMOQLCavKebBnhqgP+SFGMKIXMzKv8DMp
         Robi86aJD24TvV01HG8b6mlnvJWnuJa/kNRq+Pncnv01qxofhvkuhKJIFMGFBPeCHVmb
         nP9CozNtyr6piU2LEizapu/Nrz/cfxOUzZjCJYcZs+yzknYUvgQn4WA9g+vzblMM7/bh
         vOoT5Xf1TmdQ7UDzXD0+AN8oB357ojg5jaRjoPW1JCECDeceC6uti7GV60H0+sXIFxtH
         acMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710765457; x=1711370257;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HanPhs+5pxNZQ2UN6SW5+54Ajhvbvl08qcxZF5kLZJw=;
        b=UPPs/ZDj6TWcvxcgdOa7WoEge5wIlauA5Jt1cbxccbnGjg47jb3OaUtVNBt060hE+n
         Cxb//CuMS0WGb9bD/+54oiUFkvFITRDJpillJtyb61vdrr/+J+Z6WRAVJtihs4QVCSdV
         qJOKw+cdGsAQyrqNkYT/fGXWRRjAweFXNeyIUHkW8Szp6ad1o1r3p6RINw3XHHSEHVEp
         Qjac/xHcfDj4wFCuN0KG0ewCBSWYH6BU4zxnHFE5sUW75cM6Y8n7MdYc4H8dQ4zJ0umq
         46V5bpJrdy92d5JbOv7eu5tetYyHYZGz5tzavc0draN42mrA+eFbf9rVqI27k0xGtB9y
         QV7A==
X-Forwarded-Encrypted: i=1; AJvYcCXor5In0fVExoCIFN0VMTQMACdBwniwl0EjFlaqSnxRFJsFLEr0mKtouu3n3igMdb+73NTSt1NhMfuZvIPlrBMUibvTe08Gq8beUyt3
X-Gm-Message-State: AOJu0YwNBJWjf/kkhXCizkllHrQVw8Mp9ChKpM5085TVWOyB7rtb9Cqb
	5p22tNySXS+qhK8JLkOcBsSkDB+qhw9Xed4wMFpbPkSgfxsOO6Tw
X-Google-Smtp-Source: AGHT+IE28j3JMcgmkhIHT5C2xjMBKmVzdMK31Wr/3TQ9SLPD+hsnPLfW9CeJ8hkB4t35V3ofHy0FWQ==
X-Received: by 2002:a05:6a20:9185:b0:1a3:6b98:9a84 with SMTP id v5-20020a056a20918500b001a36b989a84mr852665pzd.10.1710765456826;
        Mon, 18 Mar 2024 05:37:36 -0700 (PDT)
Received: from [172.16.116.58] ([103.15.228.94])
        by smtp.gmail.com with ESMTPSA id r3-20020a17090ad40300b0029c68206e2bsm7569501pju.0.2024.03.18.05.37.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Mar 2024 05:37:36 -0700 (PDT)
Message-ID: <c3f5aa60-61e1-46df-8c3c-864e0acc750e@gmail.com>
Date: Mon, 18 Mar 2024 18:07:17 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Rob Herring <robh@kernel.org>
References: <20240315184908.500352-1-ayushdevel1325@gmail.com>
 <20240315184908.500352-2-ayushdevel1325@gmail.com>
 <20240317205927.GA2178147-robh@kernel.org>
Content-Language: en-US
From: Ayush Singh <ayushdevel1325@gmail.com>
In-Reply-To: <20240317205927.GA2178147-robh@kernel.org>
X-Rspamd-Queue-Id: DA69E3F326
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
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,beagleboard.org,linaro.org,kernel.org,ti.com,amd.com,arndb.de,linuxfoundation.org,gmail.com,lists.infradead.org,lists.linaro.org];
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
Message-ID-Hash: PZOQVAP5LYXHATFVO6JSD647JAEISNAF
X-Message-ID-Hash: PZOQVAP5LYXHATFVO6JSD647JAEISNAF
X-MailFrom: ayushdevel1325@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: linux-kernel@vger.kernel.org, robertcnelson@beagleboard.org, Vaishnav M A <vaishnav@beagleboard.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, Derek Kiernan <derek.kiernan@amd.com>, Dragan Cvetic <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jiri Slaby <jirislaby@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org, linux-serial@vger.kernel.org, greybus-dev@lists.linaro.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v3 1/8] dt-bindings: misc: Add mikrobus-connector
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/PZOQVAP5LYXHATFVO6JSD647JAEISNAF/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit

A new version of the patch is up and can be found here: 
https://lore.kernel.org/lkml/20240317193714.403132-1-ayushdevel1325@gmail.com/


On 3/18/24 02:29, Rob Herring wrote:

> On Sat, Mar 16, 2024 at 12:18:59AM +0530, Ayush Singh wrote:
>> Add DT bindings for mikroBUS interface. MikroBUS is an open standard
>> developed by MikroElektronika for connecting add-on boards to
>> microcontrollers or microprocessors.
>>
>> Signed-off-by: Ayush Singh <ayushdevel1325@gmail.com>
>> ---
>>   .../bindings/misc/mikrobus-connector.yaml     | 110 ++++++++++++++++++
>>   MAINTAINERS                                   |   6 +
>>   2 files changed, 116 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/misc/mikrobus-connector.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/misc/mikrobus-connector.yaml b/Documentation/devicetree/bindings/misc/mikrobus-connector.yaml
>> new file mode 100644
>> index 000000000000..6eace2c0dddc
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/misc/mikrobus-connector.yaml
>> @@ -0,0 +1,110 @@
>> +# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/misc/mikrobus-connector.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
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
> What is each GPIO entry?




>
>> +
>> +  i2c-adapter:
> We already have i2c-bus and i2c-parent properties. Neither of those work
> for you?

I think i2c-bus should work. Although I could only find information 
about what it is supposed to be in some old kernel i2c.txt so is there a 
general place for such properties to be discovered?

>> +    description: i2c adapter attached to the mikrobus socket.
>> +    $ref: /schemas/types.yaml#/definitions/phandle
>> +
>> +  spi-controller:
>> +    description: spi bus number of the spi-master attached to the mikrobus socket.
>> +    $ref: /schemas/types.yaml#/definitions/phandle
>> +
>> +  uart:
> Nice and consistent. In 3 properties, we have 'adapter', 'controller'
> and <null>...

Right. So the names I am currently using are from v2 of the patch and 
are based on Linux kernel names for this. But yes, they probably need to 
be changed since dt-bindings are not supposed to be tied to Linux. Not 
sure if `spi-bus` and `serial-bus` are appropriate though, so maybe 
`{spi, serial}-controller` is fine?

To explain why these are here in the first place, mikroBUS addon boards 
are free to only use a few of these buses or multiple of these 
simultaneously. Also, some of the properties of spi, i2c etc device 
needs to be changed depending on the mikroBUS board (mostly described by 
mikroBUS manifest). This means, the driver needs access to i2c adapter, 
spi controller, serdev-controller, pwm associated with the mikroBUS 
connector to configure them (or not use them in case of Not Connected) 
and register the board.

> Also, DT generally uses 'serial' rather than 'uart'.
Noted
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
> How would someone handle any of the properties defined in
> spi-peripheral-props.yaml?
>
>
> Rob

After taking a look at `spi-peripheral-props.yaml`, the properties 
described here will actually be specified by mikroBUS manifest and thus 
will be set by the driver after parsing the manifest.

If you are referring to keeping `spi-cs` in sync with `reg`, well I'm 
not quite sure how to do it better than the current implementation.

Ayush Singh

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
