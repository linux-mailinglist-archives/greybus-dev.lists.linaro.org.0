Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 30FD487FDFD
	for <lists+greybus-dev@lfdr.de>; Tue, 19 Mar 2024 14:04:05 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 2FF5444200
	for <lists+greybus-dev@lfdr.de>; Tue, 19 Mar 2024 13:04:04 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	by lists.linaro.org (Postfix) with ESMTPS id F06323F326
	for <greybus-dev@lists.linaro.org>; Tue, 19 Mar 2024 13:04:00 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=b7muIFKI;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (lists.linaro.org: domain of ayushdevel1325@gmail.com designates 209.85.214.172 as permitted sender) smtp.mailfrom=ayushdevel1325@gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1e04ac200a6so3716125ad.1
        for <greybus-dev@lists.linaro.org>; Tue, 19 Mar 2024 06:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710853440; x=1711458240; darn=lists.linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TB3+Jx7RLucIKEs6eH+0Nj3AnIcH8F/JCvJNLp7YE6g=;
        b=b7muIFKIIuGaWBZnfwjaujK87mDtqtt5Wrln2kSXo6u38OvKZE1VJ1Yr2D+KhviI5J
         T9DQp1dsBdTTjvbh00Ki9sX7WQqtTHMpqkzWGdOM/8L4GED/CI2T/Fsir6OC3SLMl3ua
         hWDQcApTMkESHLX/vCh4vR6ZUu1yLo0OdvpGqQDM43PqLe3mMKN2A5ZI527XUxx9/w/u
         skpc7vVte4mHOBgSGm4L/xRXzv7R6uPvJPliGytoAVFbMSqUDH85X7AHp1++aRGscRni
         8Ln4h7kOKqMpT6jFagqfxKMDLB154E5qkz50h6iwiZ+A9SCU981Fp/MyDagBMVcX7BI5
         a/5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710853440; x=1711458240;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TB3+Jx7RLucIKEs6eH+0Nj3AnIcH8F/JCvJNLp7YE6g=;
        b=d0RUzA8VFiXBvaA5q2QoGAJpYEyS9tw6zIhON+RSW7amXvyJ+3WVSK/8OGw6S6IIug
         IBNKQZUYq/b+YP7irKIiRt7XVmJiG+HjOrHGNFaQ+tOk+UWITzoLOmtqFmFp3ydK8gZS
         DvMGJj/fH9Y1Zha/3ZAHsqLSGg0127c/cs/Sc+Skt82gJGdmv0YMjpidFhuLYuDLOkZ8
         3U5Io5WOaOj2p6Z3Eu7yZrP8rpQt5MTWTTIlQ+lWSL+7dTlMk9zesLcE4QEWF3YEEgV1
         /PWLvroz/EbfUeST74FupmlAJO4OYOKgAEcHtaF1pem/B2NlV7NfQIq6RjwqG92uwUhu
         Q3sg==
X-Forwarded-Encrypted: i=1; AJvYcCXZgdFj9KRBkCkVZmyYAboXza4551DMjqLkqTSTIXCdnbq/LHEJMfewHQUZcKGVy4wvNfFwAhLoDx1bZz98Ytrrx82dHAaXsxP/g5S/
X-Gm-Message-State: AOJu0YxE3oQ2eijynR5NByYX0jGfRWRXqcLHhaq8Shd9tdjAvOAyKwMd
	aknaT0V2wXs41Zon7KjBt9GrVVcriel1zFjxF8obsvygrOLWRJ3B
X-Google-Smtp-Source: AGHT+IHp9n/ieIqxsK6SNAifPecss5n/WcUXZF+7gmtGuEG/9nF1SdfwSwoEsfEnrazkiPBdUXRu0g==
X-Received: by 2002:a17:903:2308:b0:1e0:119e:f925 with SMTP id d8-20020a170903230800b001e0119ef925mr3803743plh.26.1710853439734;
        Tue, 19 Mar 2024 06:03:59 -0700 (PDT)
Received: from [172.16.116.58] ([103.15.228.94])
        by smtp.gmail.com with ESMTPSA id x8-20020aa79a48000000b006e685994cdesm9676540pfj.63.2024.03.19.06.03.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Mar 2024 06:03:59 -0700 (PDT)
Message-ID: <81ec4156-8758-406e-876b-5acf13951d09@gmail.com>
Date: Tue, 19 Mar 2024 18:33:39 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Michael Walle <mwalle@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20240317193714.403132-1-ayushdevel1325@gmail.com>
 <20240317193714.403132-2-ayushdevel1325@gmail.com>
 <CZWVF90JJO98.2M7ARQ9WMGC94@kernel.org>
 <d4dc4d94-d323-4158-8c08-b7d37d8750d3@gmail.com>
 <0f3f56d4-3381-44f1-91bc-c126f3ced085@linaro.org>
 <c8031e17-5ae8-4794-8b8c-1736be6452d3@gmail.com>
 <CZXMK3W52AFO.1APK080GVJESK@kernel.org>
 <5a9b1cd9-05ec-4606-92b6-eadbc7af6202@gmail.com>
 <CZXPQZY8PUGE.QZM8XSOUNMT4@kernel.org>
From: Ayush Singh <ayushdevel1325@gmail.com>
In-Reply-To: <CZXPQZY8PUGE.QZM8XSOUNMT4@kernel.org>
X-Rspamd-Queue-Id: F06323F326
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.49 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[25];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.214.172:from];
	MID_RHS_MATCH_FROM(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[dt];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: 6537QOKPS2VGEHB2OKGIESNXYWRVXARI
X-Message-ID-Hash: 6537QOKPS2VGEHB2OKGIESNXYWRVXARI
X-MailFrom: ayushdevel1325@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: robertcnelson@beagleboard.org, lorforlinux@beagleboard.org, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, Derek Kiernan <derek.kiernan@amd.com>, Dragan Cvetic <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>, Vaishnav M A <vaishnav.a@ti.com>, Mark Brown <broonie@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated list:ARM/TEXAS INSTRUMENTS K3 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "open list:SPI SUBSYSTEM" <linux-spi@vger.kernel.org>, "moderated list:GREYBUS SUBSYSTEM" <greybus-dev@lists.linaro.org>, Vaishnav M A <vaishnav@beagleboard.org>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v4 1/5] dt-bindings: misc: Add mikrobus-connector
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/6537QOKPS2VGEHB2OKGIESNXYWRVXARI/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit

On 3/19/24 17:38, Michael Walle wrote:

> On Tue Mar 19, 2024 at 12:36 PM CET, Ayush Singh wrote:
>>>> Regardless, this patch actually does not contain any code for EEPROM
>>>> support I have just mentioned it to give more context on why mikroBUS
>>>> manifest is the focus of this patch instead of DT overlay or something
>>>> else.
>>> Right, and I think this is the crux here. Why can't you use DT
>>> overlays? The manifest files, seem to be yet another hardware
>>> description (method) and we already have DT. Can't we have some kind
>>> of userspace helper that could translate them to DT overlays? That
>>> way, you could also handle the EEPROM vs non-EEPROM case, or have
>>> some other kind of method to load a DT overlay.
>>>
>>> Admittedly, I've never worked with in-kernel overlays, but AFAIK
>>> they work with some subsystems.
>>>
>>> -michael
>>
>> So let me 1st go over 3 cases that the driver needs to support:
>>
>> 1. Non EEPROM boards:
>>
>> Using overlays should be pretty similar to current solution. If the
>> manifest is converted to overlay in userspace, then we do not even need
>> to do manifest parsing, setting up spi, i2c etc in the kernel driver.
>>
>>
>> 2. EEPROM boards
>>
>> How do you propose handling these. If you are proposing storing dt
>> overlay in EEPROM, then this raises some questions regarding support
>> outside of Linux.
>>
>> The other option would be generating overlay from manifest in the kernel
>> driver, which I'm not sure is significantly better than registering the
>> i2c, spi, etc. interfaces separately using standard kernel APIs.
> You did answer that yourself in (1): you could use a user space
> helper to translate it to a DT overlay, I don't think this has to be
> done in the kernel.

I do not understand what you mean. For EEPROM supported boards, user 
space is not involved. The driver can directly read the manifest from 
add-on board and setup everything, so it is plug and play.

The manual involvement of user space is only for non EEPROM boards since 
we do not have a way to identify the board without the user needing to 
provide the manifest.


> Also how do you know whether there is an EEPROM
> or not?

Set RST GPIO to low. clickID supported board will enter ID MODE, Then 
check if CS line has a w1 gpio bus.

>> 3. Over Greybus
>>
>> It is quite important to have mikroBUS over greybus for BeagleConnect.
>> This is one of the major reasons why greybus manifest was chosen for the
>> manifest format.
>>
>> Also, it is important to note that mikroBUS manifest is being used since
>> 2020 now and thus manifests for a lot of boards (both supporting clickID
>> and not supporting it exist). So I would prefer using it, unless of
>> course there are strong reasons not to.
> And also here, I'm not really familiar with greybus. Could you give
> a more complex example? My concern is that some driver might need
> additional properties from DT (or software nodes) to function
> properly. It might not only be a node with a compatible string but
> also more advanced bindings. How would that play together with this?
> My gut feeling is that you can handle any missing properties
> easier/better (eg. for existing modules) in user space. But maybe
> that is already solved in/with greybus?

Greybus is a communication protocol designed for modular electronic 
devices. It allows different parts of a device to be hot plugged (added 
or removed) while the device is still running. Greybus manifest is used 
to describe the capabilities of a module in the greybus network. The 
host then creates appropriate bidirectional unipro connections with the 
module based on the cports described in the manifest. I have added a 
link to lwn article that goes into more detail.

BeagleConnect simply allows using greybus over any bidirectional 
transport, instead of just Unipro.

I cannot comment much about how greybus handles missing properties. 
While greybus also works just in kernel space, greybus protocols are 
inherently higher level than kernel driver, so it might have an easier 
time with this.

I have also added a link to eLInux page which provides rational for the 
mikroBUS manifest. But the crux seems to be that dynamic overlays were 
not well-supported back then. Also, the use of mikroBUS using greybus 
subsystem was already used. Hence the mikroBUS driver.

Greybus is not a big blocker from my perspective, since it is always 
possible to introduce a new protocol for mikroBUS in Greybus spec. I 
think as long as both EEPROM and non EEPROM boards can be supported by 
mikroBUS driver and dt-bindings, are can be used outside of Linux (eg: 
ZephyrRTOS, nuttx, etc), it is fine.

> Here's a random one: the manifest [1] just lists the compatible
> string apparently, but the actual DT binding has also reset-gpios,
> some -supply and interrupt properties.
>
> -michael
>
> [1] https://github.com/MikroElektronika/click_id/blob/main/manifests/WEATHER-CLICK.mnfs


Yes, the concern is valid. Support for validating the manifest is 
nowhere near as good as devicetree overlays. But I think that would be a 
problem with the device rather than the responsibility of the kernel. It 
is up to the manufacturer to have valid manifests.


Link: https://lwn.net/Articles/715955/ Greybus

Link https://elinux.org/Mikrobus eLinux article


Ayush Singh

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
