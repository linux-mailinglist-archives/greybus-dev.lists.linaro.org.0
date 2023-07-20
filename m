Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 54E9B75B16B
	for <lists+greybus-dev@lfdr.de>; Thu, 20 Jul 2023 16:41:30 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 5F0F93F92B
	for <lists+greybus-dev@lfdr.de>; Thu, 20 Jul 2023 14:41:29 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	by lists.linaro.org (Postfix) with ESMTPS id C3F703F095
	for <greybus-dev@lists.linaro.org>; Thu, 20 Jul 2023 14:41:23 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20221208 header.b=gWcKKtu+;
	spf=pass (lists.linaro.org: domain of thierry.reding@gmail.com designates 209.85.218.54 as permitted sender) smtp.mailfrom=thierry.reding@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-991fe70f21bso148273066b.3
        for <greybus-dev@lists.linaro.org>; Thu, 20 Jul 2023 07:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689864083; x=1690468883;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wLrHxYUorj4cRATSl4FYWOBY6cgIskL8/uHYHedoFV8=;
        b=gWcKKtu+NPxLWPKoWi3l0E4hcgurpq8rsryPV5UeUd/jTyTcdlvtGzb8gh0vph929W
         hr/RMZNCEsxLG3NWBSl60PCuiWYcdsfPONdHgFdAOnDMUgDNA1qOo8kUP2AUFiJiMcDf
         UKtBS/ErkKBVFXl2mZncl0VCjfxioeF1wCFhisv/VGv0JbxKwdQHnjdMPtQl8dpjxT6I
         ccyE8q9NPMzASWLBYhw4sR4Pzu1xv2BMCVLl+k0kZzQkNDpSaiv7UzSVPpeN6wSITaAf
         ZXLIBD5HlyMKXxRDkrj7j3QZ1sgaderLBP6XGfHj0oYi4LU4XCdssHqdMFcQCOiWQo+d
         QWFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689864083; x=1690468883;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wLrHxYUorj4cRATSl4FYWOBY6cgIskL8/uHYHedoFV8=;
        b=RQuoz/BzBRH72bWXcXLliWqO2Hsyg7v+daN6Yqei4nszATonASrgJQcvHPjemfV3q6
         InKr/UnzcJJ+mWTad9okgTiYTtPwkHYiSFqx73bDXHVQECay5VCupVIAMGkw4FMnqemf
         b9uekGASv0m6O9EwonEbpGlsBSiBx4Tlt1LcuqDUc+KxninaAEPw8UySEiPJQ2m+nSPM
         OZpfzJftxyLmSfPFyDjMD+sJu5SNlsCMrIWalcvhL2VYdbis4UT+Ji7eeSiSYzq7KYnZ
         L0kBRxP6p+MwXqZJewJQTE+SclGKexKg0LjDCeUFK/A8eQ6PLhTY+Oi/NhzZZn/op32w
         n4zw==
X-Gm-Message-State: ABy/qLYT6WZ3dpSR2YwIo1gQxD7uB/Vf3BDhWw/wngc5QbuqtMs7bO9o
	XH0Z4o8a9n3Dm48D4wAERrM=
X-Google-Smtp-Source: APBJJlHgueNlqW0haDo5hRGUxcvhVV7/ihvmmvg/gwqzFV0iohHNBCeqNUuKd8ZztzBQESq59FBD8w==
X-Received: by 2002:a17:906:8488:b0:970:1b2d:45cc with SMTP id m8-20020a170906848800b009701b2d45ccmr4904840ejx.57.1689864082442;
        Thu, 20 Jul 2023 07:41:22 -0700 (PDT)
Received: from localhost (p200300e41f1bd600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1b:d600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id c11-20020a170906924b00b0098e34446464sm799399ejx.25.2023.07.20.07.41.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jul 2023 07:41:21 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Benson Leung <bleung@chromium.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Michael Walle <michael@walle.cc>,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Date: Thu, 20 Jul 2023 16:41:16 +0200
Message-ID: <168986404868.1519829.8131310221840364014.b4-ty@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230714205623.2496590-1-u.kleine-koenig@pengutronix.de>
References: <20230714205623.2496590-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: C3F703F095
X-Spamd-Bar: ----
X-Spamd-Result: default: False [-4.10 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20221208];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.218.54:from];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_TWELVE(0.00)[25];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_TLS_LAST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RCVD_COUNT_TWO(0.00)[2]
Message-ID-Hash: PSDRTFGMYMCNDXKUJUJRI3NER3ZCMXJK
X-Message-ID-Hash: PSDRTFGMYMCNDXKUJUJRI3NER3ZCMXJK
X-MailFrom: thierry.reding@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: linux-pwm@vger.kernel.org, kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Guenter Roeck <groeck@chromium.org>, chrome-platform@lists.linux.dev, linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 00/10] pwm: Constistenly name pwm_chip variables "chip"
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/PSDRTFGMYMCNDXKUJUJRI3NER3ZCMXJK/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Transfer-Encoding: base64

DQpPbiBGcmksIDE0IEp1bCAyMDIzIDIyOjU2OjEzICswMjAwLCBVd2UgS2xlaW5lLUvDtm5pZyB3
cm90ZToNCj4gd2hpbGUgd29ya2luZyBvbiBhbiBleHRlbnNpb24gZm9yIHRoZSBwd20gZnJhbWV3
b3JrLCBJIG5vdGljZWQgdGhhdCBzb21lDQo+IGRyaXZlcnMgYW5kIGV2ZW4gdGhlIGNvcmUgb25s
eSBuZWFybHkgY29uc2lzdGVudGx5IG5hbWVkIGFsbCB2YXJpYWJsZXMNCj4gYW5kIHN0cnVjdCBt
ZW1iZXJzIGhvbGRpbmcgYSBwb2ludGVyIHRvIGEgc3RydWN0IHB3bV9jaGlwICJjaGlwIjoNCj4g
DQo+ICQgZ2l0IGdyZXAgLVBobyAnc3RydWN0IHB3bV9jaGlwIFwqKlthLXowLTlfXSsoKm5sYTpb
XChhLXowLTlfXSknIHY2LjUtcmMxIHwgc29ydCB8IHVuaXEgLWMgfCBzb3J0IC1uDQo+ICAgICAg
IDEgc3RydWN0IHB3bV9jaGlwICpwd20NCj4gICAgICAgMSBzdHJ1Y3QgcHdtX2NoaXAgcHdtDQo+
ICAgICAgIDEgc3RydWN0IHB3bV9jaGlwIHB3bV9jaGlwDQo+ICAgICAgIDIgc3RydWN0IHB3bV9j
aGlwICpfY2hpcA0KPiAgICAgICA0IHN0cnVjdCBwd21fY2hpcCAqYw0KPiAgICAgICA4IHN0cnVj
dCBwd21fY2hpcCAqcGMNCj4gICAgICA1NyBzdHJ1Y3QgcHdtX2NoaXAgY2hpcA0KPiAgICAgMzU4
IHN0cnVjdCBwd21fY2hpcCAqY2hpcA0KPiANCj4gWy4uLl0NCg0KQXBwbGllZCwgdGhhbmtzIQ0K
DQpbMDEvMTBdIHB3bTogVXNlIGEgY29uc2lzdGVudCBuYW1lIGZvciBwd21fY2hpcCBwb2ludGVy
cyBpbiB0aGUgY29yZQ0KICAgICAgICBjb21taXQ6IGI0Zjc4ZmY3NDZlYzUyNzRmZmZhOTJmYTJh
NGRjNTMxMzYwYjUwMTYNClswMi8xMF0gcHdtOiBhdG1lbC1obGNkYzogVXNlIGNvbnNpc3RlbnQg
dmFyaWFibGUgbmFtaW5nDQogICAgICAgIGNvbW1pdDogNTA5MTQzOTI2ZTE4NDc2MmNkYWZmYjZi
NjdkMzgwOWZkZGQ3ZjRkOQ0KWzAzLzEwXSBwd206IGJjbS1rb25hOiBDb25zaXN0ZW5seSBuYW1l
IHB3bV9jaGlwIHZhcmlhYmxlcyAiY2hpcCINCiAgICAgICAgY29tbWl0OiBhZjg3Mzg1YzdhZDI3
ODIwN2QzNGZmMzY4MWZhMzI1YTI0MGFlODdjDQpbMDQvMTBdIHB3bTogY3JjOiBDb25zaXN0ZW5s
eSBuYW1lIHB3bV9jaGlwIHZhcmlhYmxlcyAiY2hpcCINCiAgICAgICAgY29tbWl0OiBmYzMwODI2
ZDUwZDEwZDY3NjI4YWRkZmFiYjkzNjdiNTA2N2VmYTQyDQpbMDUvMTBdIHB3bTogY3Jvcy1lYzog
Q29uc2lzdGVubHkgbmFtZSBwd21fY2hpcCB2YXJpYWJsZXMgImNoaXAiDQogICAgICAgIGNvbW1p
dDogNmI1ZmRiMmI2NTVhYzlhYmU2ZmJkMmNiY2IyNWM4ODM3ZTNlODU1Mw0KWzA2LzEwXSBwd206
IGxwMzk0MzogQ29uc2lzdGVubHkgbmFtZSBwd21fY2hpcCB2YXJpYWJsZXMgImNoaXAiDQogICAg
ICAgIGNvbW1pdDogZGQ0OTliNjM2MThlNTIzYjQ3ZjMwZDk5YmYyMGY0MTdkZTExODdmZg0KWzA3
LzEwXSBwd206IHJvY2tjaGlwOiBDb25zaXN0ZW5seSBuYW1lIHB3bV9jaGlwIHZhcmlhYmxlcyAi
Y2hpcCINCiAgICAgICAgY29tbWl0OiA4YzI5N2QxZmRiNWQyYjgxZDM5YWRhNmI0MzVmYjkyYTQx
YmU5ZjE3DQpbMDgvMTBdIHB3bTogc2lmaXZlOiBDb25zaXN0ZW5seSBuYW1lIHB3bV9jaGlwIHZh
cmlhYmxlcyAiY2hpcCINCiAgICAgICAgY29tbWl0OiBjYjY5ZjQwZWE3Y2IxMzkyMjM5MDFmY2Zj
ODFlNGUwYTBhMDM2NzNjDQpbMDkvMTBdIHB3bTogc2wyOGNwbGQ6IENvbnNpc3Rlbmx5IG5hbWUg
cHdtX2NoaXAgdmFyaWFibGVzICJjaGlwIg0KICAgICAgICBjb21taXQ6IGU3OTk3NGM1YzNkZGMz
ZTgxODFmNTgyMTE3YzQzNjg1NTc1MjRmMjANClsxMC8xMF0gc3RhZ2luZzogZ3JleWJ1czogcHdt
OiBDb25zaXN0ZW5seSBuYW1lIHB3bV9jaGlwIHZhcmlhYmxlcyAiY2hpcCINCiAgICAgICAgY29t
bWl0OiBlZmQxZDFhZDdmNTI1ODA5ZmNkZjc1Mzg2MzhhMDgyNzRiNzVjOTlmDQoNCkJlc3QgcmVn
YXJkcywNCi0tIA0KVGhpZXJyeSBSZWRpbmcgPHRoaWVycnkucmVkaW5nQGdtYWlsLmNvbT4NCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmdyZXlidXMtZGV2
IG1haWxpbmcgbGlzdCAtLSBncmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3JnClRvIHVuc3Vic2Ny
aWJlIHNlbmQgYW4gZW1haWwgdG8gZ3JleWJ1cy1kZXYtbGVhdmVAbGlzdHMubGluYXJvLm9yZwo=
