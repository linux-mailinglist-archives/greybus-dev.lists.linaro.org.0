Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id D9E0387F76E
	for <lists+greybus-dev@lfdr.de>; Tue, 19 Mar 2024 07:34:33 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id E87D240449
	for <lists+greybus-dev@lfdr.de>; Tue, 19 Mar 2024 06:34:32 +0000 (UTC)
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	by lists.linaro.org (Postfix) with ESMTPS id AD76840449
	for <greybus-dev@lists.linaro.org>; Tue, 19 Mar 2024 06:34:30 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=nej75IVy;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (lists.linaro.org: domain of ayushdevel1325@gmail.com designates 209.85.167.175 as permitted sender) smtp.mailfrom=ayushdevel1325@gmail.com
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-3bbc649c275so2609421b6e.0
        for <greybus-dev@lists.linaro.org>; Mon, 18 Mar 2024 23:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710830070; x=1711434870; darn=lists.linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6i7aoJ1vHA+2Toojra4EO+vaFmcLOGaxt4dt9iW58AU=;
        b=nej75IVygsTzDuxYJXkn70qpa47iviVic7Cavh6irUDVBL2mLl6Ctmnrd/X0Qn+uZg
         czXG704LO/0FYX08oQhMAUfDiIj0HZ6+XYbqlJdHUM4189vITUPvS9hfIad9D8u7taH/
         j/KwOkgMm8734J9kothn3S6NUBW27bB4w5M2DsVzN4t9p9WFRkbyYjJaJfyU94QvM5ot
         QoDOA3qgicuNOdyLgtjnLfsMtmYqdpJKoZgaT4qWxNRVh151NJWBJcqWFAknlPsuO1f+
         m7/R1egdX74UVaW3VKqWPefzZhSOEdPqAya4ScYrV/+xyEoq4m/8mKBR7xUjogui6jmN
         5p8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710830070; x=1711434870;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6i7aoJ1vHA+2Toojra4EO+vaFmcLOGaxt4dt9iW58AU=;
        b=cKshAce+u88clN5+ZTfQFxTKqHfF/BAoAVFmK7yJuN4LHCSkVnQIOecE2Ew5OyJmE0
         Iyt/UPf5J6dAi4pHOUxax0wX1HV7mR8qBYnHUU9c3tiX8MTvUiTHmX8Jl7YVVW75BKqT
         mgc+4eiGRnUQC+jiCOyoEqDPDDsKyh/1Oate3dQMbSIX4BM3ru6GBSa7L7ztk6So9Asz
         ijudcfVZ3avuEvk2Fzeot4lmMhHH0Zah8IxCc5OYFTzLFo8gf2FgELKCgaYVYmBbdF/I
         kq5DPZ0DI1v1LH26TWad/U3WZTdOJZ3Om7tkrRuk2E3QVYldhYEV3zW+cPZsF7eeIo0u
         vRoA==
X-Forwarded-Encrypted: i=1; AJvYcCWZGHrErxsokke4UZUoVFuZ+omJWkk9hODFLP3nDs9SjndzOFZyudznORAbJTMSibIgysfaYKORDB5/fuQaOUst+CavDX3yUhcWeemE
X-Gm-Message-State: AOJu0YwXXXHWLz1rBCFlUu+Un7etpl4q4MbEfpQ2OUcLnlQzbxIxLen4
	7NBCaJNahTr1aG7M1rJ9R8Sou8b4kOJTIW6eozb3BRd/Iwi2lSsr
X-Google-Smtp-Source: AGHT+IGuQNKk/56j6/1OgRfV+KuiHjrbg9qcyLSSf4NVGqlYs9w0eVzrJxbIdhfaTJLPhN/H3r/twA==
X-Received: by 2002:a05:6871:3403:b0:222:649a:a932 with SMTP id nh3-20020a056871340300b00222649aa932mr14307687oac.7.1710830069957;
        Mon, 18 Mar 2024 23:34:29 -0700 (PDT)
Received: from [172.16.116.58] ([103.15.228.94])
        by smtp.gmail.com with ESMTPSA id p13-20020a62ab0d000000b006e53cc789c3sm8958908pff.107.2024.03.18.23.34.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Mar 2024 23:34:29 -0700 (PDT)
Message-ID: <3ed8c487-544b-4d72-b1e0-edb5baa8119b@gmail.com>
Date: Tue, 19 Mar 2024 12:04:11 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20240317193714.403132-1-ayushdevel1325@gmail.com>
 <20240317193714.403132-6-ayushdevel1325@gmail.com>
 <889fb174-076c-44d1-9c6f-c3b967cd01ea@linaro.org>
From: Ayush Singh <ayushdevel1325@gmail.com>
In-Reply-To: <889fb174-076c-44d1-9c6f-c3b967cd01ea@linaro.org>
X-Rspamd-Queue-Id: AD76840449
X-Spamd-Bar: ------
X-Spamd-Result: default: False [-6.49 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	TAGGED_RCPT(0.00)[dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.167.175:from];
	FREEMAIL_ENVFROM(0.00)[gmail.com]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: UBTUSWALCT2HILMQP7EITH2NK6E4BWSY
X-Message-ID-Hash: UBTUSWALCT2HILMQP7EITH2NK6E4BWSY
X-MailFrom: ayushdevel1325@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: robertcnelson@beagleboard.org, lorforlinux@beagleboard.org, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, Derek Kiernan <derek.kiernan@amd.com>, Dragan Cvetic <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>, Vaishnav M A <vaishnav.a@ti.com>, Mark Brown <broonie@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated list:ARM/TEXAS INSTRUMENTS K3 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "open list:SPI SUBSYSTEM" <linux-spi@vger.kernel.org>, "moderated list:GREYBUS SUBSYSTEM" <greybus-dev@lists.linaro.org>, Vaishnav M A <vaishnav@beagleboard.org>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v4 5/5] dts: ti: k3-am625-beagleplay: Add mikroBUS
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/UBTUSWALCT2HILMQP7EITH2NK6E4BWSY/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit


On 3/19/24 11:29, Krzysztof Kozlowski wrote:
> On 17/03/2024 20:37, Ayush Singh wrote:
>> DONOTMERGE
> Why? Explain then the purpose of this patch.

Well, it was suggested to have DONOTMERGE by Vaishnav in the patches 
until dt bindings have been approved, since this patch touches different 
subsystems. Here is the full context from v3:

> The reasoning behind this is that these patches go in to separate  maintainer trees and without the bindings merged first the device tree changes cannot be validated, thus it is a usual practice to get the bindings and driver merged first and the device tree changes to go in the next cycle. Another alternative is you can point to your fork with  all the changes together.

>> this patch depends on patch 1
> How? I don't see any dependency.

I think it is not allowed to have code in device tree unless a 
corresponding dt-binding exists for the device. And thus every time the 
dt-binding changes, this patch also needs to change.So I thought it is 
dependent on patch 1.

>> Add mikroBUS connector support for Beagleplay.
>>
>> Co-developed-by: Vaishnav M A <vaishnav@beagleboard.org>
>> Signed-off-by: Vaishnav M A <vaishnav@beagleboard.org>
>> Signed-off-by: Ayush Singh <ayushdevel1325@gmail.com>
>> ---
>>   .../arm64/boot/dts/ti/k3-am625-beagleplay.dts | 80 +++++++++++++++++--
>>   1 file changed, 72 insertions(+), 8 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts b/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts
>> index a34e0df2ab86..e1dce1b80153 100644
>> --- a/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts
>> +++ b/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts
>> @@ -29,6 +29,7 @@ aliases {
>>   		i2c3 = &main_i2c3;
>>   		i2c4 = &wkup_i2c0;
>>   		i2c5 = &mcu_i2c0;
>> +		mikrobus0 = &mikrobus0;
>>   		mmc0 = &sdhci0;
>>   		mmc1 = &sdhci1;
>>   		mmc2 = &sdhci2;
>> @@ -230,6 +231,38 @@ simple-audio-card,codec {
>>   		};
>>   	};
>>   
>
> Best regards,
> Krzysztof


Link: 
https://lore.kernel.org/lkml/CALudOK5v_uCUffxHGKS-jA-DKLNV7xwmKkxJwjHaMWWgDdPDqA@mail.gmail.com/ 
Patch v3


Ayush Singh

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
