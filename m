Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F32387F7BC
	for <lists+greybus-dev@lfdr.de>; Tue, 19 Mar 2024 07:47:22 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 8C78C446C2
	for <lists+greybus-dev@lfdr.de>; Tue, 19 Mar 2024 06:47:21 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	by lists.linaro.org (Postfix) with ESMTPS id 7AA173F449
	for <greybus-dev@lists.linaro.org>; Tue, 19 Mar 2024 06:47:19 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=GCRpTHkr;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (lists.linaro.org: domain of ayushdevel1325@gmail.com designates 209.85.210.176 as permitted sender) smtp.mailfrom=ayushdevel1325@gmail.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-6e6fb9a494aso2662750b3a.0
        for <greybus-dev@lists.linaro.org>; Mon, 18 Mar 2024 23:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710830838; x=1711435638; darn=lists.linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Mcliv/L3zWAX4KNH4oJjctVPq87mh6KvjFep3NTqLok=;
        b=GCRpTHkrmsedeLas7xDi9CcdDTbsYzYjPIowkoxoyJtVYU/x85sgoevW95vZKWIjcK
         kvz6R1+HHX0yi6zGS0KHHcRlXJgXJr+5YvTn/OyEyqXf6YqiGBX2h0KCIXugRFFqw0bE
         /+zVvd/9Iv1oBJlL3EVlNd6gJboYfHhTag9xbInMsVMqyuXbwZvY/b5GCRE3Jt7R4jzl
         jknG805ln2X01LUi9BMOZaVVqyRlTTL41KXcc5+OI1i+X8mA3squX0s6oT29BpETKY/G
         bMpp0TmY4sBaaggvc+9GpvpC+zT8rq2Ndlt9GCwEjebxr8x2pUtnaP0g/xGNZNN6Ye55
         aJwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710830838; x=1711435638;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Mcliv/L3zWAX4KNH4oJjctVPq87mh6KvjFep3NTqLok=;
        b=CXM768xA7woHze5CICeW/azrNJyBrkEmbApeZr2i/C3X7jkyRiFFAKOQvh3KDFBvN6
         V+/kem/TSTrIUdeqsQPYKWRMODRATI3iclNys/E7VqzrKTTDA85U3b0qJBXGtcuUpJ/k
         ZEirw+APpdEMwAq1ZvGCIXu5Vx4TiIExfmFNm6G3NSlC2HG/e/5qJmOf5mbpUUS4eQgY
         4RoS/cXdEyxwo75XkAKiO+NLZiFM5ZjM8jaoOxX+3dl5hWJ8otLXTjxVt+zFJTSKftKe
         XyzewcoPvlwoZ3cmL6Xt2xa7/vCHKLW7Ft+npfWKNMWVyE0PoVzYm6hCs9XhGT+rxTqQ
         Vomw==
X-Forwarded-Encrypted: i=1; AJvYcCXABRtm7lmDdtEKQzSw2cM8GI21YnrJ64OpGavs936DVxuk3Ct9KQl6ioctkLurJrLKB/6Het7WiXYn4Rc0WHTIj2reTKmUoYawcu/p
X-Gm-Message-State: AOJu0Yy1ilXl0GvECYYKhCHr4bfotPL0m9AOqSZ2LZNxrTyOZHg0jQrR
	KYShbij7mrhAtGPxZk1Pu1cI63YGuCJHbIk4secxdP7Rv4xStDoW
X-Google-Smtp-Source: AGHT+IGn01bFm+mPOLfCut+RdmK9QJx2Dvyl6xsp0/JlSdy25DMPadErJIUiUPMF8Z5ezLXGNj8vtw==
X-Received: by 2002:a05:6a00:1489:b0:6e4:cf7c:6c28 with SMTP id v9-20020a056a00148900b006e4cf7c6c28mr15088249pfu.22.1710830838641;
        Mon, 18 Mar 2024 23:47:18 -0700 (PDT)
Received: from [172.16.116.58] ([103.15.228.94])
        by smtp.gmail.com with ESMTPSA id r7-20020aa79ec7000000b006e6d0165a7bsm8787672pfq.82.2024.03.18.23.47.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Mar 2024 23:47:18 -0700 (PDT)
Message-ID: <89ec1649-5231-422e-9760-6e04b2a514fd@gmail.com>
Date: Tue, 19 Mar 2024 12:17:00 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20240317193714.403132-1-ayushdevel1325@gmail.com>
 <20240317193714.403132-5-ayushdevel1325@gmail.com>
 <06009676-6189-40b9-a6d6-66a112e4f387@linaro.org>
From: Ayush Singh <ayushdevel1325@gmail.com>
In-Reply-To: <06009676-6189-40b9-a6d6-66a112e4f387@linaro.org>
X-Rspamd-Queue-Id: 7AA173F449
X-Spamd-Bar: ------
X-Spamd-Result: default: False [-6.49 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17:c];
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
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.210.176:from];
	FREEMAIL_ENVFROM(0.00)[gmail.com]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: HIX3SVI4H6HVC6IY6PUCJ2A2JJFZ674U
X-Message-ID-Hash: HIX3SVI4H6HVC6IY6PUCJ2A2JJFZ674U
X-MailFrom: ayushdevel1325@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: robertcnelson@beagleboard.org, lorforlinux@beagleboard.org, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, Derek Kiernan <derek.kiernan@amd.com>, Dragan Cvetic <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>, Vaishnav M A <vaishnav.a@ti.com>, Mark Brown <broonie@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated list:ARM/TEXAS INSTRUMENTS K3 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "open list:SPI SUBSYSTEM" <linux-spi@vger.kernel.org>, "moderated list:GREYBUS SUBSYSTEM" <greybus-dev@lists.linaro.org>, Vaishnav M A <vaishnav@beagleboard.org>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v4 4/5] mikrobus: Add mikroBUS driver
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/HIX3SVI4H6HVC6IY6PUCJ2A2JJFZ674U/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit

On 3/19/24 11:34, Krzysztof Kozlowski wrote:

> On 17/03/2024 20:37, Ayush Singh wrote:
>> DONOTMERGE
>>
>> this patch depends on Patch 1, 2, 3
> So none of your work should be reviewed? I don't understand this, but in
> such case I am not going to review it.
>
> Best regards,
> Krzysztof
>
I am a bit lost here. It was mentioned in the patch v3 that I should 
specify the interdependence of patches in v3. And now you are saying I 
should not?

Here is the rationale for the dependence:

1. Any changes to the property names in dt-bindings patch 1 will need an 
appropriate change here.

2. This patch will fail to build without patch 2.

3. This patch will fail to build without patch 3.


Ayush Singh

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
