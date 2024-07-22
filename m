Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F3F4938DA0
	for <lists+greybus-dev@lfdr.de>; Mon, 22 Jul 2024 12:45:59 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id AEDA93F3A3
	for <lists+greybus-dev@lfdr.de>; Mon, 22 Jul 2024 10:45:57 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	by lists.linaro.org (Postfix) with ESMTPS id B8AF93F3A3
	for <greybus-dev@lists.linaro.org>; Mon, 22 Jul 2024 10:45:51 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=beagleboard-org.20230601.gappssmtp.com header.s=20230601 header.b=n050GjfR;
	spf=neutral (lists.linaro.org: 209.85.215.178 is neither permitted nor denied by domain of ayush@beagleboard.org) smtp.mailfrom=ayush@beagleboard.org;
	dmarc=fail reason="No valid SPF, DKIM not aligned (relaxed)" header.from=beagleboard.org (policy=none)
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-72703dd2b86so664961a12.1
        for <greybus-dev@lists.linaro.org>; Mon, 22 Jul 2024 03:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20230601.gappssmtp.com; s=20230601; t=1721645151; x=1722249951; darn=lists.linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Yk4UQACOPEhu0mUYszop0tJksRuFg9b/i8uYeB9F4sQ=;
        b=n050GjfRw3q/t1apBTo0hoM+4Y2Rf2wWKxghKpFEnak65SNxpTlshNi39To9HdIIhy
         M0hf6P5+cvbciP1AXEJubc8JQ1MthIpHp1RgaVPEiU71Wuf4+bfgEUmR6W6Vk99ZSnEA
         WTCRPf2q/pCiLatXmOftfSsTKVrC9JDdJBRGKiK8o38aCh9nclqlfa6NTd08skePgULE
         mOWxCe3tBFdOb0s2wuavH/2BzavzXk1oi59jzN3003R4RTRXtHnsXkHsPP0AftLr20ql
         IDs8Jw6+DX8mqJbLFI6AfK7R9al8SqyRV8PCAU8slNWrfx3pYC0Dfc4Nevu9gvElw8WU
         sKSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721645151; x=1722249951;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Yk4UQACOPEhu0mUYszop0tJksRuFg9b/i8uYeB9F4sQ=;
        b=K8hNsUrhwCf3Stj8Z3XsuNo0oJTAoUqUYpwKZeHPb+qmQzU0ay3tpMHCEmY4J371fF
         0xXOGuAX5cnDp4ZV5u/G8icjm0wsJbWiTbZEVj2sEN+9ObXdPhkgO8FpIEHGJndxPJ0y
         uhegso6uuIzscfq317wrf4tJDyetlOVhM/IIZLZwSbXFwBhYI2Vgj2yeX8/gAuP6Qort
         hsGwf8TrxGxw5rbSSIsbhEBKmnb/vvFaWt4T5N0xpATl/TQSK5m3ORsiEGYxbKD6S/Wh
         dian2H0lk5HKaJZfVdKMc4cFOum9DwgELAz9uQgWzT9kU/0xYFdNB5yML8cjgqWZwwhX
         PCjg==
X-Forwarded-Encrypted: i=1; AJvYcCU2qoMfMr6807eh+dJw0RZnYir8mHtlhwnM0M+XVF8b1ZEEhhvnF/apIQ+LENpHl2nK39n9moBWaso0mF/nGviiMYDz8pnoADRH9H6I
X-Gm-Message-State: AOJu0Yyc/1Ml3kN4hcq/tBqN7XTFn8dN5WoRfcYfRECqtvHxYQASHgie
	bFUsCJzesiOK9on/mig4MfjedKm+6asDy9mrfETOykQJz+dNVB9m1zZTbWkq9Q==
X-Google-Smtp-Source: AGHT+IGbTDbBwca1C4VrH0/hA3S6xV1DimazE2cwql0k7QUaUo+m4vZviNr4xZ00h+PE/OuBz/gSuA==
X-Received: by 2002:a05:6a00:391b:b0:704:173c:5111 with SMTP id d2e1a72fcca58-70d08635b76mr5376790b3a.3.1721645150824;
        Mon, 22 Jul 2024 03:45:50 -0700 (PDT)
Received: from [172.22.58.167] ([117.250.76.237])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70cff5a149csm5078144b3a.169.2024.07.22.03.45.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jul 2024 03:45:50 -0700 (PDT)
Message-ID: <5a865811-a6c0-47ad-b8a0-265bb31d4124@beagleboard.org>
Date: Mon, 22 Jul 2024 16:15:41 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Conor Dooley <conor@kernel.org>
References: <20240719-beagleplay_fw_upgrade-v1-0-8664d4513252@beagleboard.org>
 <20240719-beagleplay_fw_upgrade-v1-1-8664d4513252@beagleboard.org>
 <20240719-scuttle-strongbox-e573441c45e6@spud>
Content-Language: en-US
From: Ayush Singh <ayush@beagleboard.org>
In-Reply-To: <20240719-scuttle-strongbox-e573441c45e6@spud>
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: B8AF93F3A3
X-Spamd-Bar: -
X-Spamd-Result: default: False [-1.80 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_ALLOW(-0.20)[beagleboard-org.20230601.gappssmtp.com:s=20230601];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.215.178:from];
	DMARC_POLICY_SOFTFAIL(0.10)[beagleboard.org : No valid SPF, DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	R_SPF_NEUTRAL(0.00)[?all];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	URIBL_BLOCKED(0.00)[beagleboard.org:email,beagleboard.org:mid];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	DKIM_TRACE(0.00)[beagleboard-org.20230601.gappssmtp.com:+]
X-Rspamd-Action: no action
Message-ID-Hash: SKBBRK3XWQQTJQYUVILD254PWH6VP2RU
X-Message-ID-Hash: SKBBRK3XWQQTJQYUVILD254PWH6VP2RU
X-MailFrom: ayush@beagleboard.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: robertcnelson@beagleboard.org, "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 1/3] dt-bindings: net: ti,cc1352p7: Add boot-gpio
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/SKBBRK3XWQQTJQYUVILD254PWH6VP2RU/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit


On 7/19/24 20:25, Conor Dooley wrote:
> On Fri, Jul 19, 2024 at 03:15:10PM +0530, Ayush Singh wrote:
>> boot-gpio (along with reset-gpio) is used to enable bootloader backdoor
>> for flashing new firmware.
>>
>> The pin and pin level to enabel bootloader backdoor is configed using
>> the following CCFG variables in cc1352p7:
>> - SET_CCFG_BL_CONFIG_BL_PIN_NO
>> - SET_CCFG_BL_CONFIG_BL_LEVEL
>>
>> Signed-off-by: Ayush Singh <ayush@beagleboard.org>
>> ---
>>   Documentation/devicetree/bindings/net/ti,cc1352p7.yaml | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/net/ti,cc1352p7.yaml b/Documentation/devicetree/bindings/net/ti,cc1352p7.yaml
>> index 3dde10de4630..a3511bb59b05 100644
>> --- a/Documentation/devicetree/bindings/net/ti,cc1352p7.yaml
>> +++ b/Documentation/devicetree/bindings/net/ti,cc1352p7.yaml
>> @@ -29,6 +29,9 @@ properties:
>>     reset-gpios:
>>       maxItems: 1
>>   
>> +  boot-gpios:
>> +    maxItems: 1
> I think this needs a description that explains what this is actually
> for, and "boot-gpios" is not really an accurate name for what it is used
> for IMO.

I was using the name `boot-gpios` since cc1352-flasher uses the name 
boot-line. Anyway, would `bsl-gpios` be better? Or for more descriptive 
names, I guess it can be `bootloader-config-gpios` or 
`bootloader-backdoor-gpios`.


Ayush Singh

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
