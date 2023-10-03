Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id F39F17B689E
	for <lists+greybus-dev@lfdr.de>; Tue,  3 Oct 2023 14:09:23 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 0D20940D22
	for <lists+greybus-dev@lfdr.de>; Tue,  3 Oct 2023 12:09:23 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	by lists.linaro.org (Postfix) with ESMTPS id 07BA73E9FC
	for <greybus-dev@lists.linaro.org>; Tue,  3 Oct 2023 12:09:15 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=PRC0cJOi;
	spf=pass (lists.linaro.org: domain of ayushdevel1325@gmail.com designates 209.85.214.178 as permitted sender) smtp.mailfrom=ayushdevel1325@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1c434c33ec0so5884095ad.3
        for <greybus-dev@lists.linaro.org>; Tue, 03 Oct 2023 05:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696334954; x=1696939754; darn=lists.linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CmBs73lcWD9k98KqGPVGwvpI7hbBVTH4u02wod8lyZo=;
        b=PRC0cJOi+mnUjFbbEQLyy1C4it3GJPM6pciVl1LgEQUtasTfQXjM655+tkUTLM5z3R
         4FqpzM8I77xi6dpP6AY5QTgY4xTcHQ0FCiB36sRPHvbADLuAiQfGn1Gqev1oOwh7R3kV
         WIEjUwgVl74g9tliC0WB5e4G6eiEUXLQD8kYn2GU4hh2BaDWdmrC+y1tbtZ1+0J/Xl1n
         bk8eifDEge1skb0zSeLHt+5AdVyhZDJFIGhnhR920G0wa1MgMhjs/roHtJxBn6DeGips
         +gcRGk+KPA47UvQD4tVTxd+KaRY0A7AWa+bGaGZE01vNxKZMKMsbvPNfqtpn6ir7T0sM
         z+sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696334954; x=1696939754;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CmBs73lcWD9k98KqGPVGwvpI7hbBVTH4u02wod8lyZo=;
        b=EyR5kES6bsMKJJ0pSfjxVzsrf4g8FtI48RZxlWqmH21Z+ofLz/Jj1Z/AfiwzEoi2zh
         eThNe30jaU9Ci98crNyjTKHCOeK2b8RT5c3tg7P4c+0c36a93mHhOHXhcvt6GXIt5vbE
         U5NkCo64Uk0kEHldFSkPdnFgmjxQxWs3DAf1KgFIXFvkH781A4r5LjYE+MMgcDR3z+Aa
         JHzNraYnxs99sX1lQr0SYb87Uik/9QRgTkGJcESEOEix2gaHMC6V1m2PJ2Z1DCKj3PyX
         kZFTaki0r6UB+WHJbvV0kBH9V1HY2zGjNWrNPF9LwRtY2ra96VtaoTkPP5X6d2uFrSYo
         etOA==
X-Gm-Message-State: AOJu0YxF40tj6mHOOn/flNspP0hKIr1lEiNsWE/eyaG6Qi90QGtJnWn0
	UmRCklcseuTpfPmXx+JUpX4=
X-Google-Smtp-Source: AGHT+IEvC0m8WS0q071UtHrbTqvrtJ1b6c+LAX2fqhcw9n+G09+3gQmOUEgpwf0QKSpzk4WcWWzTNw==
X-Received: by 2002:a17:902:8649:b0:1c3:5f05:922a with SMTP id y9-20020a170902864900b001c35f05922amr11025143plt.60.1696334953970;
        Tue, 03 Oct 2023 05:09:13 -0700 (PDT)
Received: from [172.16.116.58] ([103.15.228.93])
        by smtp.gmail.com with ESMTPSA id ja7-20020a170902efc700b001bf846dd2d0sm1393813plb.13.2023.10.03.05.09.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Oct 2023 05:09:13 -0700 (PDT)
Message-ID: <2105b93c-0502-e909-ea09-dba73d43b912@gmail.com>
Date: Tue, 3 Oct 2023 17:39:08 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 greybus-dev@lists.linaro.org
References: <20231002182454.211165-1-ayushdevel1325@gmail.com>
 <20231002182454.211165-2-ayushdevel1325@gmail.com>
 <55f63415-781a-4107-8643-9f77c7ee38d1@linaro.org>
From: Ayush Singh <ayushdevel1325@gmail.com>
In-Reply-To: <55f63415-781a-4107-8643-9f77c7ee38d1@linaro.org>
X-Spamd-Bar: ------
X-Spamd-Result: default: False [-6.60 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.214.178:from];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	URIBL_BLOCKED(0.00)[devicetree.org:url];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 07BA73E9FC
Message-ID-Hash: MQ7YW6C2ZE7ZYFOD426RTD5A5RKTZ7HU
X-Message-ID-Hash: MQ7YW6C2ZE7ZYFOD426RTD5A5RKTZ7HU
X-MailFrom: ayushdevel1325@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, vaishnav@beagleboard.org, nm@ti.com, krzysztof.kozlowski+dt@linaro.org, vigneshr@ti.com, kristo@kernel.org, robh+dt@kernel.org, conor+dt@kernel.org, linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v6 1/3] dt-bindings: Add beaglecc1352
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/MQ7YW6C2ZE7ZYFOD426RTD5A5RKTZ7HU/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit

>> driver.
>>
>> Signed-off-by: Ayush Singh <ayushdevel1325@gmail.com>
>> ---
>>   .../devicetree/bindings/net/ti,cc1352p7.yaml  | 48 +++++++++++++++++++
>>   MAINTAINERS                                   |  6 +++
>>   2 files changed, 54 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/net/ti,cc1352p7.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/net/ti,cc1352p7.yaml b/Documentation/devicetree/bindings/net/ti,cc1352p7.yaml
>> new file mode 100644
>> index 000000000000..57bc2c43e5b1
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/net/ti,cc1352p7.yaml
>> @@ -0,0 +1,48 @@
>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/net/ti,cc1352p7.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Texas Instruments Simplelink CC1352P7 wireless MCU
>> +
>> +description:
>> +  The cc1352p7 mcu can be connected via SPI or UART.
> If over SPI, then the binding is incomplete. This is fine for now, I guess.
>
> Best regards,
> Krzysztof

Well, I added the line about SPI because the data sheet states that 
CC1352P7 can be connected over SPI or UART when used as wireless MCU. 
But yes, I do not have much knowledge about SPI itself, so the bindings 
might be incomplete for SPI usage. Should I remove it or leave it be?


Sincerely,

Ayush Singh

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
