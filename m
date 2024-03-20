Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id BF7DD880C0A
	for <lists+greybus-dev@lfdr.de>; Wed, 20 Mar 2024 08:31:18 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id B294740C65
	for <lists+greybus-dev@lfdr.de>; Wed, 20 Mar 2024 07:31:17 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	by lists.linaro.org (Postfix) with ESMTPS id AF89040B68
	for <greybus-dev@lists.linaro.org>; Wed, 20 Mar 2024 07:31:15 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linaro.org header.s=google header.b=Jpp0bHkK;
	dmarc=pass (policy=none) header.from=linaro.org;
	spf=pass (lists.linaro.org: domain of krzysztof.kozlowski@linaro.org designates 209.85.218.46 as permitted sender) smtp.mailfrom=krzysztof.kozlowski@linaro.org
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a46ba938de0so443348266b.3
        for <greybus-dev@lists.linaro.org>; Wed, 20 Mar 2024 00:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710919874; x=1711524674; darn=lists.linaro.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8xEIUTznrQVSL70C6oRjL1I5rh5o7wWPgx3F+xPmOKY=;
        b=Jpp0bHkKjwfM8Mb9Dlxg68cBoSfZ0x2XtpFgliLxESVvixkaX08csDAeHMZV+k5G4P
         fRvntt/vXQKT8Zrc1nJgBgre4sUormJHdC2z1Pzlm/FlCANUt58P4nVE5q3b+SCn7I2m
         xomoNO90FZIdK9+j6qDlwPIMexKXg3TVWqQb9UiIAZuXWz+zrirFP+Yw1If+xc9vC8dz
         MVlbno2skaDluY5pZRReUrZZnGCiSbzHOExJeTHEd6hmCNt+IQETFRaaqT2LUWYtLcw9
         eWrE41clEDs0jCJANm7CW8CkwqqqxHAErr+06nyrBImPZn9dsR9G2FWGq+Hbi7B3iqNh
         U91w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710919874; x=1711524674;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8xEIUTznrQVSL70C6oRjL1I5rh5o7wWPgx3F+xPmOKY=;
        b=Zbmenta9x8rBm27Fq0USC0Trd8Lgh5p5qyWIZPlPr71PpgRgEUqzX8OKbI/7ivAI9Y
         wuibjpnao/6Fp26/2O5948KQNuEFqJXGahPeJ5o/J1nHNz9V3PcKbZcv2N/nug/UGaOd
         FM5YWtHgkDUET4Zc7dXOuNhobf6MGFwF2Em7rLX2OpCWJn5dKBFoKZZbWCEnMcQlck9a
         hIb5wj12me1uvyRyP2Pcb00Ryfi3ps8AmZrgLynvkLorw2HG95NUBoAhyX83Q/G2ZA3m
         z7g8zZmjQWGo92yckXHOFTQlFiZ3cvxP4qioJiE+lmzcytqYX6B24lAspzMdFrQHLvVB
         zelg==
X-Forwarded-Encrypted: i=1; AJvYcCX9kBT8WbHROTpAdbC6ucE6ZVxndjTE17lNa8LqlUc3nEFPZ0JgiSb8q6fc7pWgTO5lOw4/jNv5LKVPP+eg4CS2Xcx0vC246NT/gvqI
X-Gm-Message-State: AOJu0YyL4Cx5NXn55lTitM5vh1OISJj/fHaFf4LYASnh8W4clOsCCX6I
	ZuqWgmUJHMDwKc4z14hm+UaCydvQQqaUS0Ozao/biAWL9VcHASpBfOsXickFMUYq+w==
X-Google-Smtp-Source: AGHT+IF1j6M4tEq92+m+SqkomIgZHn/M+kPz7rRG4xKuSv1DpkrJ9WhLR7h3XwPVp1W7n7fFi5mRrw==
X-Received: by 2002:a17:906:f884:b0:a46:be82:f478 with SMTP id lg4-20020a170906f88400b00a46be82f478mr5114732ejb.68.1710919874527;
        Wed, 20 Mar 2024 00:31:14 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.97])
        by smtp.gmail.com with ESMTPSA id e9-20020a170906c00900b00a46ce8f5e11sm2481648ejz.152.2024.03.20.00.31.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Mar 2024 00:31:14 -0700 (PDT)
Message-ID: <13ced390-71a0-4edf-b2f0-19195ec30c22@linaro.org>
Date: Wed, 20 Mar 2024 08:31:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Ayush Singh <ayushdevel1325@gmail.com>,
 open list <linux-kernel@vger.kernel.org>
References: <20240317193714.403132-1-ayushdevel1325@gmail.com>
 <20240317193714.403132-6-ayushdevel1325@gmail.com>
 <889fb174-076c-44d1-9c6f-c3b967cd01ea@linaro.org>
 <3ed8c487-544b-4d72-b1e0-edb5baa8119b@gmail.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <3ed8c487-544b-4d72-b1e0-edb5baa8119b@gmail.com>
X-Rspamd-Queue-Id: AF89040B68
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.59 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.218.46:from];
	XM_UA_NO_VERSION(0.01)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	TAGGED_RCPT(0.00)[dt];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: R2NQH7SSMKPE46WMKVLZKCZYTB2G6VTU
X-Message-ID-Hash: R2NQH7SSMKPE46WMKVLZKCZYTB2G6VTU
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: robertcnelson@beagleboard.org, lorforlinux@beagleboard.org, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, Derek Kiernan <derek.kiernan@amd.com>, Dragan Cvetic <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>, Vaishnav M A <vaishnav.a@ti.com>, Mark Brown <broonie@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated list:ARM/TEXAS INSTRUMENTS K3 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "open list:SPI SUBSYSTEM" <linux-spi@vger.kernel.org>, "moderated list:GREYBUS SUBSYSTEM" <greybus-dev@lists.linaro.org>, Vaishnav M A <vaishnav@beagleboard.org>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v4 5/5] dts: ti: k3-am625-beagleplay: Add mikroBUS
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/R2NQH7SSMKPE46WMKVLZKCZYTB2G6VTU/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 19/03/2024 07:34, Ayush Singh wrote:
> 
> On 3/19/24 11:29, Krzysztof Kozlowski wrote:
>> On 17/03/2024 20:37, Ayush Singh wrote:
>>> DONOTMERGE
>> Why? Explain then the purpose of this patch.
> 
> Well, it was suggested to have DONOTMERGE by Vaishnav in the patches 
> until dt bindings have been approved, since this patch touches different 
> subsystems. Here is the full context from v3:
> 
>> The reasoning behind this is that these patches go in to separate  maintainer trees and without the bindings merged first the device tree changes cannot be validated, thus it is a usual practice to get the bindings and driver merged first and the device tree changes to go in the next cycle. Another alternative is you can point to your fork with  all the changes together.

This is some odd style of work. Please don't follow such advise.

> 
>>> this patch depends on patch 1
>> How? I don't see any dependency.
> 
> I think it is not allowed to have code in device tree unless a 
> corresponding dt-binding exists for the device. And thus every time the 

And you provided the binding.

> dt-binding changes, this patch also needs to change.So I thought it is 
> dependent on patch 1.

But it is not a dependency. Dependency means something does not work
without another. Or something must be applied in the same branch as
another. None of the cases are here. Drop the statements.

This is no different than all of our regular works. Do you see any of
such comments ("dont merge", "dependency")? No.

Best regards,
Krzysztof

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
