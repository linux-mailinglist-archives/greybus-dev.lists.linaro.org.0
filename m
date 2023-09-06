Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 233D37941B0
	for <lists+greybus-dev@lfdr.de>; Wed,  6 Sep 2023 18:48:03 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id F37B33EAB0
	for <lists+greybus-dev@lfdr.de>; Wed,  6 Sep 2023 16:48:01 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	by lists.linaro.org (Postfix) with ESMTPS id D4FB23EAB0
	for <greybus-dev@lists.linaro.org>; Wed,  6 Sep 2023 16:47:55 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20221208 header.b=CbloAgbv;
	spf=pass (lists.linaro.org: domain of ayushdevel1325@gmail.com designates 209.85.215.181 as permitted sender) smtp.mailfrom=ayushdevel1325@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-565e395e7a6so69819a12.0
        for <greybus-dev@lists.linaro.org>; Wed, 06 Sep 2023 09:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694018875; x=1694623675; darn=lists.linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YVuYrvdAZmiakwnUrTCNPT76uwDHc4nkNKfw/tN0vVQ=;
        b=CbloAgbvNU5BNa2CnFgPaTm5vMllSISpDrTnW7a8piqya+5VEaeBgxMe/0EgEx37n8
         Y4ZLkN8yVC4FcQWNtXkNBldLMGsw6Fnrvgty92VfrXpnFOjRtSNMaEycAFJwVFXikM7z
         30sseamzI38RNV+TbngvKGoFxRslC+ijGkWXuq18HPRq1HI/ag9EjHNCuqQgOkkPx2U7
         O9ULB2N9LjIUTRObhyLTxMnrFhCsSnG9OMAVXuMiGnkxPSPIW20DzhnqfwIfWIypqTZT
         fZW2qT/f6kpK8DiqttemoU4fe8StcIPlri98Rm2QGRnMZ6BAIF4GxEUwQEn+xaW1/Bo4
         5l2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694018875; x=1694623675;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YVuYrvdAZmiakwnUrTCNPT76uwDHc4nkNKfw/tN0vVQ=;
        b=DYYJ/YigkXqPSXtSqbbKHesByE6XjCuuOpuNh7DhA+ITi3kgIyKTWvlj4Fblc+7Of6
         47J0Zpet88z/AMgp12k+QW4DvfXUXBxWVyZHNiQrw7tbWNSRuQjG47ZwutjQvzgCAVfS
         JInLuXgtMSM6HpRzJ/ZKt/7POuLBfQ1xR0KRfVxnqpZmyeFF9gOr9Q9ycORSwNdlxshc
         gvmwtNhNjcYttj9u+omPch/SWuRsJ4FPCBQs0lm2ey1csDNF8Oo0653a4dV5vjcbC9+o
         G8I4/4zETU3+zZ6wMBFra+boW/THvakMXeg7of1JVvFD+QulD29rljzA9cxSwQbXthBt
         /JwA==
X-Gm-Message-State: AOJu0YwkEdmffEHgxWGAvXVVrkzyifRYna45i+PxQ8cRvKgylAsY4qt+
	YLfvh2En8/8KZ0o6K7Yfw3U=
X-Google-Smtp-Source: AGHT+IGwiyMi44H17BEmu2LD+jihfhYG50dvi+Awsyh+gYS13Uz0l7Gp0RELkeYJpELupfsdcC2ZUw==
X-Received: by 2002:a05:6a21:a105:b0:14d:29f6:18c3 with SMTP id aq5-20020a056a21a10500b0014d29f618c3mr12270887pzc.20.1694018874768;
        Wed, 06 Sep 2023 09:47:54 -0700 (PDT)
Received: from [172.16.116.58] ([103.15.228.93])
        by smtp.gmail.com with ESMTPSA id h3-20020a63b003000000b0056c466b09a4sm11455647pgf.59.2023.09.06.09.47.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Sep 2023 09:47:54 -0700 (PDT)
Message-ID: <8c4717f1-36f3-96dc-2335-ec323e3f46df@gmail.com>
Date: Wed, 6 Sep 2023 22:17:49 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>, greybus-dev@lists.linaro.org
References: <20230902182845.1840620-1-ayushdevel1325@gmail.com>
 <20230902182845.1840620-2-ayushdevel1325@gmail.com>
 <937ea540-09e1-65f2-7165-662bbee2542b@kernel.org>
From: Ayush Singh <ayushdevel1325@gmail.com>
In-Reply-To: <937ea540-09e1-65f2-7165-662bbee2542b@kernel.org>
X-Rspamd-Queue-Id: D4FB23EAB0
X-Spamd-Bar: ----
X-Spamd-Result: default: False [-4.10 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20221208];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.215.181:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: IOCFIVPXF6V3IKMSWMBGPMIAMXMQOYY2
X-Message-ID-Hash: IOCFIVPXF6V3IKMSWMBGPMIAMXMQOYY2
X-MailFrom: ayushdevel1325@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Vaishnav M A <vaishnav@beagleboard.org>, Nishanth Menon <nm@ti.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v4 1/3] dt-bindings: Add beaglecc1352
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/IOCFIVPXF6V3IKMSWMBGPMIAMXMQOYY2/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit

On 9/4/23 12:44, Krzysztof Kozlowski wrote:
> On 02/09/2023 20:28, Ayush Singh wrote:
>> Add DT bindings for BeagleCC1352 co-processor UART.
> This does not look like UART controller.
>
>
>> Signed-off-by: Ayush Singh <ayushdevel1325@gmail.com>
>> ---
>>   .../bindings/serial/beaglecc1352.yaml         | 25 +++++++++++++++++++
> It's not a serial driver. Don't put it in unrelated directory.
>
>> @@ -0,0 +1,25 @@
>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/serial/beaglecc1352.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: BeaglePlay CC1352 serial UART
> How is this serial UART? Of what? The SoC? Do not describe interface but
> the device.
>
>> +
>> +maintainers:
>> +  - Ayush Singh <ayushdevel1325@gmail.com>
>> +
>> +properties:
>> +  compatible:
>> +    const: beagle,cc1352
> No resources? This does not seem useful... Put it then only in trivial
> devices if your hardware - hardware, not driver - does not have any
> pins, interrupts or other resources.
>
>> +
>> +required:
>> +  - compatible
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    beaglecc1352 {
> Node names should be generic. See also an explanation and list of
> examples (not exhaustive) in DT specification:
> https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation
>
> Best regards,
> Krzysztof

I would like to get some help on how to tackle this particular device 
since I cannot seem to find anything similar to this setup. First let me 
go over the setup.

The BeaglePlay board has 2 processors. AM625 processor which is the main 
processor. This runs the main Linux system. This processor does not have 
direct access to SubG.

It also contains a CC1352P7 MCU with it's own flash program memory, ROM 
and SRAM. This processor has SubG antenna. It runs it's own OS (Zephyr 
by default).

The only way for CC1352P7 and AM625 to communicate is by using that 
particular UART which is just a standard 8250 UART. The setup pretty 
much looks like 2 boards connected over UART except the UART will always 
be static.

I guess it would make most sense to write a CC1352P7 binding in this 
case? However, I am not sure how accurate that is since anything from 
the Linux side will be interacting with the Zephyr application, and not 
the processor. So in all actuality, the processor itself does not matter 
at all.


Ayush Singh

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
