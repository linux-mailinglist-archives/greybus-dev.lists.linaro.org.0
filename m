Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB5979A372
	for <lists+greybus-dev@lfdr.de>; Mon, 11 Sep 2023 08:23:34 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 2ACFB3F204
	for <lists+greybus-dev@lfdr.de>; Mon, 11 Sep 2023 06:23:33 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	by lists.linaro.org (Postfix) with ESMTPS id F147F3F1A6
	for <greybus-dev@lists.linaro.org>; Mon, 11 Sep 2023 06:23:24 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b="uiFv+//H";
	spf=pass (lists.linaro.org: domain of krzk@kernel.org designates 145.40.68.75 as permitted sender) smtp.mailfrom=krzk@kernel.org;
	dmarc=pass (policy=none) header.from=kernel.org
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id F253CB80DF8;
	Mon, 11 Sep 2023 06:23:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A62DC433C7;
	Mon, 11 Sep 2023 06:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694413402;
	bh=FYOki8zkUBTLpZudZIQoxjbaH31iT+OS5RrD9yP7Kjs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=uiFv+//HeqADmL8H5TS0Iy8FkNOSv/bmVwihFdrYebWrRVWAcS1iEXSoF2U+ThkDG
	 j5H+gPhy0eBm/XjW3YD2etMjvEnL0xgTT/NMHffSuVeIm236NDkeqqDFfiuU9SECii
	 dUsg8/pIm13Dszlj05tn8lEvkz2XSOMHrBb2H7sHosg3vlExILYMCZ0GpCL47rH2Iz
	 mi1q7QRunmblyKo/YlJBTVMwWM9vI5KpnjVZss3ZFW+fxgk2OHfFJkXykHSGnP6U2r
	 LbkiEUc9ZvR4rzvkPtbIa30EvENHRaAWbac9ozU9TcMJzx8K8zzRQhfR+7ZSebhtMT
	 upxgBMRwE/bYg==
Message-ID: <e2a776f7-411e-a027-f0a8-3b0615c7f06e@kernel.org>
Date: Mon, 11 Sep 2023 08:23:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Content-Language: en-US
To: Ayush Singh <ayushdevel1325@gmail.com>, greybus-dev@lists.linaro.org
References: <20230902182845.1840620-1-ayushdevel1325@gmail.com>
 <20230902182845.1840620-2-ayushdevel1325@gmail.com>
 <937ea540-09e1-65f2-7165-662bbee2542b@kernel.org>
 <8c4717f1-36f3-96dc-2335-ec323e3f46df@gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <8c4717f1-36f3-96dc-2335-ec323e3f46df@gmail.com>
X-Rspamd-Queue-Id: F147F3F1A6
X-Spamd-Bar: ---
X-Spamd-Result: default: False [-4.00 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,none];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+a:ams.source.kernel.org];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:54825, ipnet:145.40.68.0/24, country:US];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,lists.linaro.org];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,devicetree-specification.readthedocs.io:url];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_TWO(0.00)[2];
	NEURAL_HAM(-0.00)[-1.000];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: BPSYYXBGSCZUVFSU5XGS6SHZISWYRB43
X-Message-ID-Hash: BPSYYXBGSCZUVFSU5XGS6SHZISWYRB43
X-MailFrom: krzk@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Vaishnav M A <vaishnav@beagleboard.org>, Nishanth Menon <nm@ti.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v4 1/3] dt-bindings: Add beaglecc1352
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/BPSYYXBGSCZUVFSU5XGS6SHZISWYRB43/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 06/09/2023 18:47, Ayush Singh wrote:
> On 9/4/23 12:44, Krzysztof Kozlowski wrote:
>> On 02/09/2023 20:28, Ayush Singh wrote:
>>> Add DT bindings for BeagleCC1352 co-processor UART.
>> This does not look like UART controller.
>>
>>
>>> Signed-off-by: Ayush Singh <ayushdevel1325@gmail.com>
>>> ---
>>>   .../bindings/serial/beaglecc1352.yaml         | 25 +++++++++++++++++++
>> It's not a serial driver. Don't put it in unrelated directory.
>>
>>> @@ -0,0 +1,25 @@
>>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/serial/beaglecc1352.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: BeaglePlay CC1352 serial UART
>> How is this serial UART? Of what? The SoC? Do not describe interface but
>> the device.
>>
>>> +
>>> +maintainers:
>>> +  - Ayush Singh <ayushdevel1325@gmail.com>
>>> +
>>> +properties:
>>> +  compatible:
>>> +    const: beagle,cc1352
>> No resources? This does not seem useful... Put it then only in trivial
>> devices if your hardware - hardware, not driver - does not have any
>> pins, interrupts or other resources.
>>
>>> +
>>> +required:
>>> +  - compatible
>>> +
>>> +additionalProperties: false
>>> +
>>> +examples:
>>> +  - |
>>> +    beaglecc1352 {
>> Node names should be generic. See also an explanation and list of
>> examples (not exhaustive) in DT specification:
>> https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation
>>
>> Best regards,
>> Krzysztof
> 
> I would like to get some help on how to tackle this particular device 
> since I cannot seem to find anything similar to this setup. First let me 
> go over the setup.
> 
> The BeaglePlay board has 2 processors. AM625 processor which is the main 
> processor. This runs the main Linux system. This processor does not have 
> direct access to SubG.
> 
> It also contains a CC1352P7 MCU with it's own flash program memory, ROM 
> and SRAM. This processor has SubG antenna. It runs it's own OS (Zephyr 
> by default).
> 
> The only way for CC1352P7 and AM625 to communicate is by using that 
> particular UART which is just a standard 8250 UART. The setup pretty 
> much looks like 2 boards connected over UART except the UART will always 
> be static.
> 
> I guess it would make most sense to write a CC1352P7 binding in this 
> case? However, I am not sure how accurate that is since anything from 
> the Linux side will be interacting with the Zephyr application, and not 
> the processor. So in all actuality, the processor itself does not matter 
> at all.

I think the bindings require specific name and give you proper hint what
should it be. If you still wonder, it means you still did not test your
DTS. Such testing is a requirement.

Best regards,
Krzysztof

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
