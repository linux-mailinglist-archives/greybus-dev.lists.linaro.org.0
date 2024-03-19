Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA3687FD00
	for <lists+greybus-dev@lfdr.de>; Tue, 19 Mar 2024 12:37:06 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id EC36743C89
	for <lists+greybus-dev@lfdr.de>; Tue, 19 Mar 2024 11:37:05 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	by lists.linaro.org (Postfix) with ESMTPS id 1208C3F453
	for <greybus-dev@lists.linaro.org>; Tue, 19 Mar 2024 11:37:03 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=jvS9xsOR;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (lists.linaro.org: domain of ayushdevel1325@gmail.com designates 209.85.214.170 as permitted sender) smtp.mailfrom=ayushdevel1325@gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1deefb08b9eso23486995ad.3
        for <greybus-dev@lists.linaro.org>; Tue, 19 Mar 2024 04:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710848222; x=1711453022; darn=lists.linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=umAIavC67cazmJ9lW2ejp2jSJGxVPgTOeby3+DV2+G4=;
        b=jvS9xsOR65NFQVZVPMhdw8E7MVy8jqDZPaIG2cUPauqVi5ZClwVd7USr8/raURNV2x
         G51AvOo8CoM0xcUNFINk9Ef8gSEV1fGUCGeHGmYtcojsV2qV8JeugdOrY7XRetUKxLRk
         fuyzlb0IQi1+Fdg2DkDLhFLiNxxAMXiG9RfnnYLtIuSXVD4F1t1wtwKFW4Vjt6HMFAhh
         Vabf1AcmMq4MPfdiY4p1tYMxFCUPRCcV/dWmJpAcREf5OJB039IImwm2rfwWH/CaUSeW
         l7jciuOwrM+/YPVZmFaFjkh7ac+DDDFiqd2+S5yyCNyqsWMGSy1owDV1dTsYXfJraCeE
         d7Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710848222; x=1711453022;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=umAIavC67cazmJ9lW2ejp2jSJGxVPgTOeby3+DV2+G4=;
        b=mEALPRv1nQk8dV+RUbhBLLfu2qttooQwiNZHS3jEY05dMd/KOR/c9pmvG+F6kuOICP
         AFIsY5Tgv/H+fy3498DD3m2AFPTiMUjAawG7hcnMjWThJ/0veQONAB8XyAk4QgRdGgRl
         VUcw+8XbDGhTLjefaPqsdGRmcDT6fPaeZlMI2tpODdYsQ0ueCQKqXkrMFl9/43sQyIvP
         3QB8qApdv24Q8lS9Co5jd5s+ixX0zZolwmkx9JWyQ07YEHdzkw9MfPkBtr0U8FkZZtw8
         OzV/e3lnc9ijQ0op2JG6JJPYgKUB4/VSzZrKxPj8alrhgqzr0YwmicLt9UbKn6tEUVqn
         +47A==
X-Forwarded-Encrypted: i=1; AJvYcCWMxR51u0tqHT/HbhYJsALSGA7VF2RLhRcSJfHkIDjCIlOPkE62cTH+SFG9SWrygrf6bQV4T1LrQGW2o9LSNvSLGSxCvCUwuzM54Lb1
X-Gm-Message-State: AOJu0Yx3H604IkpK52PY+/0Hm25W6fkfn2BUr9VPanN8RQvvQ2UbYW2i
	4qhLW5LO3RWobuTQ649g9pUj4soP647rzSvpS4Zt9paB7mFLgShV
X-Google-Smtp-Source: AGHT+IF+DsFLA4Qvhq8yiEnjGjx2GBguwAi8iI5wKdvQAedsOquaxYYW+xLfytLU6wfSwtrLpVXPfw==
X-Received: by 2002:a17:902:6502:b0:1e0:3861:9e46 with SMTP id b2-20020a170902650200b001e038619e46mr2136786plk.49.1710848222071;
        Tue, 19 Mar 2024 04:37:02 -0700 (PDT)
Received: from [172.16.116.58] ([103.15.228.94])
        by smtp.gmail.com with ESMTPSA id lg7-20020a170902fb8700b001dd1d7bc0f7sm11218702plb.154.2024.03.19.04.36.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Mar 2024 04:37:01 -0700 (PDT)
Message-ID: <5a9b1cd9-05ec-4606-92b6-eadbc7af6202@gmail.com>
Date: Tue, 19 Mar 2024 17:06:36 +0530
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
From: Ayush Singh <ayushdevel1325@gmail.com>
In-Reply-To: <CZXMK3W52AFO.1APK080GVJESK@kernel.org>
X-Rspamd-Queue-Id: 1208C3F453
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.59 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.214.170:from];
	XM_UA_NO_VERSION(0.01)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[gmail.com:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: LZMZRR7TXHII4G6WGJ7NGR4WWUSMEFER
X-Message-ID-Hash: LZMZRR7TXHII4G6WGJ7NGR4WWUSMEFER
X-MailFrom: ayushdevel1325@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: robertcnelson@beagleboard.org, lorforlinux@beagleboard.org, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, Derek Kiernan <derek.kiernan@amd.com>, Dragan Cvetic <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>, Vaishnav M A <vaishnav.a@ti.com>, Mark Brown <broonie@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated list:ARM/TEXAS INSTRUMENTS K3 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "open list:SPI SUBSYSTEM" <linux-spi@vger.kernel.org>, "moderated list:GREYBUS SUBSYSTEM" <greybus-dev@lists.linaro.org>, Vaishnav M A <vaishnav@beagleboard.org>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v4 1/5] dt-bindings: misc: Add mikrobus-connector
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/LZMZRR7TXHII4G6WGJ7NGR4WWUSMEFER/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit

On 3/19/24 15:08, Michael Walle wrote:

> Hi,
>
>> Regardless, this patch actually does not contain any code for EEPROM
>> support I have just mentioned it to give more context on why mikroBUS
>> manifest is the focus of this patch instead of DT overlay or something
>> else.
> Right, and I think this is the crux here. Why can't you use DT
> overlays? The manifest files, seem to be yet another hardware
> description (method) and we already have DT. Can't we have some kind
> of userspace helper that could translate them to DT overlays? That
> way, you could also handle the EEPROM vs non-EEPROM case, or have
> some other kind of method to load a DT overlay.
>
> Admittedly, I've never worked with in-kernel overlays, but AFAIK
> they work with some subsystems.
>
> -michael


So let me 1st go over 3 cases that the driver needs to support:

1. Non EEPROM boards:

Using overlays should be pretty similar to current solution. If the 
manifest is converted to overlay in userspace, then we do not even need 
to do manifest parsing, setting up spi, i2c etc in the kernel driver.


2. EEPROM boards

How do you propose handling these. If you are proposing storing dt 
overlay in EEPROM, then this raises some questions regarding support 
outside of Linux.

The other option would be generating overlay from manifest in the kernel 
driver, which I'm not sure is significantly better than registering the 
i2c, spi, etc. interfaces separately using standard kernel APIs.


3. Over Greybus

It is quite important to have mikroBUS over greybus for BeagleConnect. 
This is one of the major reasons why greybus manifest was chosen for the 
manifest format.


Also, it is important to note that mikroBUS manifest is being used since 
2020 now and thus manifests for a lot of boards (both supporting clickID 
and not supporting it exist). So I would prefer using it, unless of 
course there are strong reasons not to.


Ayush Singh

CorrectBasicCloseSpellingPossible spelling mistake found.GrabsGrey 
busIgnore
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
