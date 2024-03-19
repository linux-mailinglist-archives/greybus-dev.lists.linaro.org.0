Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id EC57F87F7DF
	for <lists+greybus-dev@lfdr.de>; Tue, 19 Mar 2024 07:59:31 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id EFB8540A53
	for <lists+greybus-dev@lfdr.de>; Tue, 19 Mar 2024 06:59:30 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	by lists.linaro.org (Postfix) with ESMTPS id 038303F449
	for <greybus-dev@lists.linaro.org>; Tue, 19 Mar 2024 06:59:28 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=WcOgOayo;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (lists.linaro.org: domain of ayushdevel1325@gmail.com designates 209.85.214.172 as permitted sender) smtp.mailfrom=ayushdevel1325@gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1dee27acf7aso33544125ad.2
        for <greybus-dev@lists.linaro.org>; Mon, 18 Mar 2024 23:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710831567; x=1711436367; darn=lists.linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sMcKfZi1xz5eaYp9NuQfLHyNEpRw2+4mgzvyh4Nj45M=;
        b=WcOgOayoSVysi6upUSCAh3Ff20zVsm7Rz5D/hH09hZTbNmwekH6JPMQ1W9aa7PqRtH
         tjgtdUN6z3pzC1ZsNz6YGHrZuMspH95JbvdOi5TNZR+DB33qzdIHg9uTdcHvxa98lpaC
         jWdzaoi2DuCdIfjpVrtYR/Oz6pR6urU0Ktbo5h7/Ab4YWvKKQbRGvfNxgncvF4lGrvEJ
         /qY99EOTzXy5F3U9+afi6i/P1UiSNmO56Ywlch25DtgFQaSohsJZG9zWCTghouMR76Y3
         SWD1rcud2NCJisu3WcMIfKoB6tGbVtL9HoQeCxVZaXT28ckSmLQ6d7/yilYBQrDtOPQA
         b6VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710831567; x=1711436367;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sMcKfZi1xz5eaYp9NuQfLHyNEpRw2+4mgzvyh4Nj45M=;
        b=kcyk3fluAfkq/pd+eS8E9Nswgf7dnAisTqTKYc/cmC63oJNk31+sl4EMkLqwbCSu8Z
         18SfsN5vniy4jI0Bcvj3JZSBNxIDoSo3T2pWEGO51uLdtkQEXfVExnfoPIc09Jf96HKq
         UN+B+z3+S1DhBDuvKopYt/aozXvFH8qLuXwnaXrncTG31a/m9LwO4Y44WkcxmfiJxLyT
         2rCjAncnxVC2FymTqcn49pLZYny2+mhKXBu9sT8B15BFloNN1CIZ4zPrh3NUU9LUWSkr
         8mL1Q/sAzbtjKSWL39xYAlppaKSMN64fTvpD4Arwqlms16v41ahNkrH6SBRRPH/B6mgj
         RIsQ==
X-Forwarded-Encrypted: i=1; AJvYcCW20ESua7nTscI4aDkb5hDbym2iyiIFTRUBK9BQXYTPO3zNhEUQ/d6N6miDtEvnHE9aSszF/qC36opIyCBNRCVBiMinMUE7gqUsYWlq
X-Gm-Message-State: AOJu0YyiTZNKzM/5w0cyRl1aKcYX6Excwm0VDEyoAfxf4GwyEQIbStU6
	uVmIAVob3GBdC6HqbGeIdq9RZ8sR4kM1DcLc8oCFS6pQGv7O6Ug/
X-Google-Smtp-Source: AGHT+IEPaXPncig+2mfJueHot0LijD4BGVGO0GUG1oH2eSfMb7KVBv96LoNJAMJa6u8EF69x5xL/1g==
X-Received: by 2002:a17:903:230a:b0:1de:f6aa:c991 with SMTP id d10-20020a170903230a00b001def6aac991mr14909604plh.34.1710831567041;
        Mon, 18 Mar 2024 23:59:27 -0700 (PDT)
Received: from [172.16.116.58] ([103.15.228.94])
        by smtp.gmail.com with ESMTPSA id u16-20020a170903125000b001dd8e1db1b1sm10509163plh.175.2024.03.18.23.59.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Mar 2024 23:59:26 -0700 (PDT)
Message-ID: <28a5e314-30ba-4fc4-9228-51adb63e7aaa@gmail.com>
Date: Tue, 19 Mar 2024 12:29:07 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-kernel@vger.kernel.org
References: <20240315184908.500352-1-ayushdevel1325@gmail.com>
 <20240315184908.500352-8-ayushdevel1325@gmail.com>
 <8799b216-57a7-451b-80a3-3d4ae9693e0b@linaro.org>
 <402d1296-0a0c-4f85-a096-be7993869f94@gmail.com>
 <81d55f10-c538-494f-8274-6ea8c4366ab2@linaro.org>
From: Ayush Singh <ayushdevel1325@gmail.com>
In-Reply-To: <81d55f10-c538-494f-8274-6ea8c4366ab2@linaro.org>
X-Rspamd-Queue-Id: 038303F449
X-Spamd-Bar: ------
X-Spamd-Result: default: False [-6.47 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-2.98)[99.89%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[beagleboard.org,kernel.org,linaro.org,ti.com,amd.com,arndb.de,linuxfoundation.org,gmail.com,vger.kernel.org,lists.infradead.org,lists.linaro.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MID_RHS_MATCH_FROM(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.214.172:from];
	TAGGED_RCPT(0.00)[dt];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: MTNAHL2JMW6BR54AIYNA2YMPRC2NNGVN
X-Message-ID-Hash: MTNAHL2JMW6BR54AIYNA2YMPRC2NNGVN
X-MailFrom: ayushdevel1325@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: robertcnelson@beagleboard.org, Vaishnav M A <vaishnav@beagleboard.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, Derek Kiernan <derek.kiernan@amd.com>, Dragan Cvetic <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jiri Slaby <jirislaby@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org, linux-serial@vger.kernel.org, greybus-dev@lists.linaro.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v3 7/8] mikrobus: Add mikrobus driver
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/MTNAHL2JMW6BR54AIYNA2YMPRC2NNGVN/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit

On 3/19/24 11:02, Krzysztof Kozlowski wrote:

> On 16/03/2024 14:06, Ayush Singh wrote:
>>   > Are you sure this fits in Linux coding style limit (not checkpatch
>> limit, but the limit expressed by Linux coding style)?
>>
>>
>> Well, I am just using clang-format with column width of 100 instead of
>> 80. The docs now say 80 is prefered rather than mandatory, so well I was
> So you introduce your own style? Then consider it mandatory...
>
>> using 100 since I prefer that. If 80 is necessary or would make review
>> easier than I can just switch to it.
> You do not choose your own coding style.
>
>>
>> I will remove serdev, pwm, clickID and send a new patch with the minimal
>> driver and better commit messages as suggested with Vaishnav. It is
>> important to have good support for mikroBUS boards without clickID as well.
> Best regards,
> Krzysztof
>

I mean after the whole discussion about 80 vs 100 column line limit a 
few years ago, and change in checkpatch behavior, I thought 100 was an 
acceptable column length in the kernel, but I guess was mistaken, and 80 
character is still mandatory? Not sure why there was a change in 
checkpatch and docs though.

Regardless, I have switched 80 in the next patch since it is mandatory, 
and I do not care as long as I can format using a formatter.


Ayush Singh

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
