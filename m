Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B1B08815C3
	for <lists+greybus-dev@lfdr.de>; Wed, 20 Mar 2024 17:39:31 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 3FBD643BAF
	for <lists+greybus-dev@lfdr.de>; Wed, 20 Mar 2024 16:39:30 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	by lists.linaro.org (Postfix) with ESMTPS id 9E23D3F449
	for <greybus-dev@lists.linaro.org>; Wed, 20 Mar 2024 16:39:26 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=Oha7CjYG;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (lists.linaro.org: domain of ayushdevel1325@gmail.com designates 209.85.214.169 as permitted sender) smtp.mailfrom=ayushdevel1325@gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1deffa23bb9so37053505ad.2
        for <greybus-dev@lists.linaro.org>; Wed, 20 Mar 2024 09:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710952766; x=1711557566; darn=lists.linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wQauky859kuXAuDXbgdFBECQEJeQkaoXwKu7AZgTe6c=;
        b=Oha7CjYGLEfcYUllWDwtal0x+IcMLTwFIWRKyFoJCFwoiASq06IckbHbgfC2QAmo7U
         cW0hr6XF9EEA3pZDPBgdVJUX3VkoBFzTOpSJzC2yNUMOF4erlgdBTNWyWdzckxdt734U
         ThITnPb/UKppU1ZemaVP3DQzL/eWqu5hNispDZZPOgUZqK0XdThq2pt78rsIUZwLQzLf
         jSwKMSEU+JH3XuKQHAjU3T+tZa4EtJEtklXNkmSxWpxiNmzgvrJv0mH6o9E2uE3PFcm9
         wCdVW2YLN0FlwLBE4FF/K8XB51oWsoKav2tcIpOnLd7Y4sA+l6g6R716epJyeUjZBbqi
         qOeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710952766; x=1711557566;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wQauky859kuXAuDXbgdFBECQEJeQkaoXwKu7AZgTe6c=;
        b=Ife7rHz7lvKE81pQT094DuQYMHlXMRY7R5fbAVXWExdSkzoWDcO8+GKCb//lAzKGTO
         Mq69FgHjJBGDenubC2DMHHo3pGr8Za8OmKZuaXvCK0Wy9xPDgeT2vPan+vkCvNR20B/v
         zjF/6GxsQsYDaHRh9WwL5ac2mCmviR3P68vUH02G8nXrpLLdkEMwfhRr6W843c5c6DYV
         wClzddRYPPG6IPPcb0XPCuDOfpD/MR6moxABDa6F3IpZyzUWKYq9cHU90oOnC825NpB3
         KyyD93b9nqdTfr741gsznPfbBRYzDluwkECRxw+okHu5vg7+xp7XInkwClP1xQyDFEy7
         4+FQ==
X-Forwarded-Encrypted: i=1; AJvYcCWt4mP9zp6oBKXRY7zZDEsIcabSBqry2x6Xdce8OqEfOGHSQLEyst9YhwdzVuUBCaGV8LzcSvo1DNV/boJmpGwNXOUmTSGMxzi5QpEo
X-Gm-Message-State: AOJu0YxQGocgxyG9928PoXziuohcfhaJWJgmIMr9cOGChU5kYJbR28G5
	OjaxKDagZpP/9enfy0ooGLVAVRx2VgMo2r2zlO3UmEN9bjsNUvam
X-Google-Smtp-Source: AGHT+IHRwH0VWCUf9JBVUF6vi6xAR3lOSAEpU0/xZlFkKgm6Ojvm2NjLdbfGrZw09mEv5vUlHe6IFg==
X-Received: by 2002:a17:902:e5c2:b0:1de:e026:1b8e with SMTP id u2-20020a170902e5c200b001dee0261b8emr23472945plf.41.1710952765579;
        Wed, 20 Mar 2024 09:39:25 -0700 (PDT)
Received: from [172.16.116.58] ([103.15.228.94])
        by smtp.gmail.com with ESMTPSA id mm14-20020a1709030a0e00b001dd2b965a8esm13846928plb.163.2024.03.20.09.39.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Mar 2024 09:39:25 -0700 (PDT)
Message-ID: <c3223f90-6e7c-4fdc-905a-770c474445e2@gmail.com>
Date: Wed, 20 Mar 2024 22:09:05 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Andrew Lunn <andrew@lunn.ch>
References: <d4dc4d94-d323-4158-8c08-b7d37d8750d3@gmail.com>
 <0f3f56d4-3381-44f1-91bc-c126f3ced085@linaro.org>
 <c8031e17-5ae8-4794-8b8c-1736be6452d3@gmail.com>
 <CZXMK3W52AFO.1APK080GVJESK@kernel.org>
 <5a9b1cd9-05ec-4606-92b6-eadbc7af6202@gmail.com>
 <CZXPQZY8PUGE.QZM8XSOUNMT4@kernel.org>
 <81ec4156-8758-406e-876b-5acf13951d09@gmail.com>
 <CZXSKOLK6S1S.N86E2AZG2V90@kernel.org>
 <2eec6437-dd11-408d-9bcb-92ba2bee4487@ti.com>
 <28c995cb-1660-435f-9ee4-1195439231f0@gmail.com>
 <f53cd006-5eb0-47f2-8f84-e7915154f12d@lunn.ch>
Content-Language: en-US
From: Ayush Singh <ayushdevel1325@gmail.com>
In-Reply-To: <f53cd006-5eb0-47f2-8f84-e7915154f12d@lunn.ch>
X-Rspamd-Queue-Id: 9E23D3F449
X-Spamd-Bar: ------
X-Spamd-Result: default: False [-6.59 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.214.169:from];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[26];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dt];
	DWL_DNSWL_BLOCKED(0.00)[gmail.com:dkim];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: OFIGLV4GHMONN72U3Y3VCH4435XQE4UZ
X-Message-ID-Hash: OFIGLV4GHMONN72U3Y3VCH4435XQE4UZ
X-MailFrom: ayushdevel1325@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Vaishnav Achath <vaishnav.a@ti.com>, Michael Walle <mwalle@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, open list <linux-kernel@vger.kernel.org>, robertcnelson@beagleboard.org, lorforlinux@beagleboard.org, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, Derek Kiernan <derek.kiernan@amd.com>, Dragan Cvetic <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated list:ARM/TEXAS INSTRUMENTS K3 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "open list:SPI SUBSYSTEM" <linux-spi@vger.kernel.org>, "moderated list:GREYBUS SUBSYSTEM" <greybus-dev@lists.linaro.org>, Vaishnav M A <vaishnav@beagl
 eboard.org>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v4 1/5] dt-bindings: misc: Add mikrobus-connector
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/OFIGLV4GHMONN72U3Y3VCH4435XQE4UZ/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit

On 3/20/24 01:02, Andrew Lunn wrote:

>> Yes, after discussion with Vaishnav and trying to brainstorm some way to do
>> the same thing with dt overlays, it seems that trying to use dt overlays
>> will mean need to have completely separate implementation of mikroBUS for
>> local ports and mikroBUS over greybus.
> Could you explain why please?
>
> Are greybus I2C bus masters different from physical I2C bus masters?
> Are greybus SPI bus masters different from physical SPI bus masters?

Well, they are virtual, so they are not declared in the device tree. I 
have linked the greybus i2c implementation. It basically allocates an 
i2c_adpater and then adds it using `i2c_add_adapter` method. This 
adapter can then be passed to say mikroBUS driver where it can be used 
as a normal i2c_adapter, and we can register the device to it.

>> Additionally, trying to put dt overlays in EEPROM would mean they
>> will be incompatible with use in local ports and vice versa.
> I don't think you need to put the DT overlay in the EEPROM. All you
> need to do is translate the manifest into DT for those simple devices
> which can be described by the limited manifest format. For more
> complex devices, you use the ID to go find a DT fragment which
> describes the board, and skip the manifest to DT transformation.
>
> 	Andrew

I am not familiar enough to know if the device tree can work with 
virtual devices created by greybus subsystem.

Maybe the problem stems from the fact that mikroBUS does not have a 
physical controller (and my inability to explain the patch properly). 
However, the purpose of this patchset is to in fact provide a virtual 
mikroBUS controller to allow us to register a mikroBUS addon board 
described by board_info struct similar to how it is possible to create 
and register an i2c device on an i2c adapter using 
`i2c_new_client_device` or spi device using `spi_new_device`. The 
manifest is used to populate this board_info struct, but it will be 
possible to use something other than mikroBUS manifest if someone wants 
to. I can make the necessary adjustments by moving manifest support to 
its own config option.


Link: 
https://elixir.bootlin.com/linux/latest/source/drivers/staging/greybus/i2c.c#L230 
Greybus i2c


Ayush Singh

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
