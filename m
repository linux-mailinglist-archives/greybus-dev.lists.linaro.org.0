Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA1D65E583
	for <lists+greybus-dev@lfdr.de>; Thu,  5 Jan 2023 07:19:44 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 61F5B3EF98
	for <lists+greybus-dev@lfdr.de>; Thu,  5 Jan 2023 06:19:43 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	by lists.linaro.org (Postfix) with ESMTPS id 06AF63EE4A
	for <greybus-dev@lists.linaro.org>; Thu,  5 Jan 2023 06:19:38 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=none;
	spf=pass (lists.linaro.org: domain of jirislaby@gmail.com designates 209.85.128.47 as permitted sender) smtp.mailfrom=jirislaby@gmail.com;
	dmarc=fail reason="SPF not aligned (relaxed), No valid DKIM" header.from=kernel.org (policy=none)
Received: by mail-wm1-f47.google.com with SMTP id i17-20020a05600c355100b003d99434b1cfso566290wmq.1
        for <greybus-dev@lists.linaro.org>; Wed, 04 Jan 2023 22:19:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MMhTa8031xnJCr78Gg3MxS4F8Q+GpLcOHRVjapQT5tQ=;
        b=QvH8QzoVy8CgZbMrs6HSI/mzIyTrDutlLrz7yGsOsHmH0lcSXP//Liej1wshVg8lQc
         zKMOp5ebYbnLcUlmiBF0Jj5EaVS05+iVAwOMe5reSCKGGbPp6OH3i9XnsWYhD/uBuFyy
         Ly7sVLc7WDej6DhkwyOFJgk2a+UWdYhOUdKyZabGLkF8RVMSQ9lgar/k7jV0fAAODNSy
         KkNOtQSh7xzyCXTkKoAUzgTVtFHLLYFop55G07Ok8jHXy1jSXuU97+i2ZD/VM5OFyK74
         TqPwxYRAcVuwQgGqYhq+5eWNcGOLAuqZbJ/0ukBzXcI/9hQB3apHD/12Bl6J/Ffw31SM
         OaVw==
X-Gm-Message-State: AFqh2krue0ZAGM3Wf5iWevdwqGVszrUOORiCj7nfIgSHQ16yecMKKRew
	hffoEoxC9WI/F8trdzlJztE=
X-Google-Smtp-Source: AMrXdXvnbuIqp+JAgFHrP0UKIr61/hDJcQemGGF6LX9p8WLjDYXsDs+9lWsr5CrFNlnRZz9V75Ka4w==
X-Received: by 2002:a05:600c:3d11:b0:3cf:8b22:76b3 with SMTP id bh17-20020a05600c3d1100b003cf8b2276b3mr35818833wmb.0.1672899577065;
        Wed, 04 Jan 2023 22:19:37 -0800 (PST)
Received: from ?IPV6:2a0b:e7c0:0:107::aaaa:49? ([2a0b:e7c0:0:107::aaaa:49])
        by smtp.gmail.com with ESMTPSA id q187-20020a1c43c4000000b003c6c182bef9sm1319688wma.36.2023.01.04.22.19.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jan 2023 22:19:36 -0800 (PST)
Message-ID: <09043f30-c516-e173-3836-5e5dd5f5c472@kernel.org>
Date: Thu, 5 Jan 2023 07:19:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To: =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 linux-serial@vger.kernel.org, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>,
 Ulf Hansson <ulf.hansson@linaro.org>, David Lin <dtwlin@gmail.com>,
 Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Oliver Neukum <oneukum@suse.com>, linux-kernel@vger.kernel.org,
 linux-mmc@vger.kernel.org, greybus-dev@lists.linaro.org,
 linux-staging@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org
References: <20230104151531.73994-1-ilpo.jarvinen@linux.intel.com>
 <20230104151531.73994-8-ilpo.jarvinen@linux.intel.com>
From: Jiri Slaby <jirislaby@kernel.org>
In-Reply-To: <20230104151531.73994-8-ilpo.jarvinen@linux.intel.com>
X-Spamd-Result: default: False [-6.40 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	RCVD_IN_DNSWL_HI(-1.00)[209.85.128.47:from,2a0b:e7c0:0:107::aaaa:49:received];
	FORGED_SENDER(0.30)[jirislaby@kernel.org,jirislaby@gmail.com];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	DMARC_POLICY_SOFTFAIL(0.10)[kernel.org : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail-wm1-f47.google.com:rdns,mail-wm1-f47.google.com:helo];
	RCPT_COUNT_TWELVE(0.00)[21];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.128.47:from];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jirislaby@kernel.org,jirislaby@gmail.com];
	FREEMAIL_TO(0.00)[linux.intel.com,vger.kernel.org,linuxfoundation.org,arndb.de,linaro.org,gmail.com,kernel.org,pengutronix.de,nxp.com,suse.com,lists.linaro.org,lists.linux.dev,lists.ozlabs.org,lists.infradead.org];
	RCVD_COUNT_THREE(0.00)[3];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 06AF63EE4A
X-Spamd-Bar: ------
Message-ID-Hash: KI4YECYQCP7BNZ5QJ53HMUGP4YV4ED3W
X-Message-ID-Hash: KI4YECYQCP7BNZ5QJ53HMUGP4YV4ED3W
X-MailFrom: jirislaby@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 07/10] tty: Convert ->dtr_rts() to take bool argument
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/KI4YECYQCP7BNZ5QJ53HMUGP4YV4ED3W/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: base64

T24gMDQuIDAxLiAyMywgMTY6MTUsIElscG8gSsOkcnZpbmVuIHdyb3RlOg0KPiBDb252ZXJ0IHRo
ZSByYWlzZS9vbiBwYXJhbWV0ZXIgaW4gLT5kdHJfcnRzKCkgdG8gYm9vbCB0aHJvdWdoIHRoZQ0K
PiBjYWxsY2hhaW4uIFRoZSBwYXJhbWV0ZXIgaXMgdXNlZCBsaWtlIGJvb2wuIEluIFVTQiBzZXJp
YWwsIHRoZXJlDQo+IHJlbWFpbnMgYSBmZXcgaW1wbGljaXQgYm9vbCAtPiBsYXJnZXIgdHlwZSBj
b252ZXJzaW9ucyBiZWNhdXNlIHNvbWUNCj4gZGV2aWNlcyB1c2UgdTggaW4gdGhlaXIgY29udHJv
bCBtZXNzYWdlcy4NCg0KUmV2aWV3ZWQtYnk6IEppcmkgU2xhYnkgPGppcmlzbGFieUBrZXJuZWwu
b3JnPg0KDQo+IFNpZ25lZC1vZmYtYnk6IElscG8gSsOkcnZpbmVuIDxpbHBvLmphcnZpbmVuQGxp
bnV4LmludGVsLmNvbT4NCj4gLS0tDQouLi4NCj4gLS0tIGEvZHJpdmVycy9jaGFyL3BjbWNpYS9z
eW5jbGlua19jcy5jDQo+ICsrKyBiL2RyaXZlcnMvY2hhci9wY21jaWEvc3luY2xpbmtfY3MuYw0K
PiBAQCAtMzc4LDcgKzM3OCw3IEBAIHN0YXRpYyB2b2lkIGFzeW5jX21vZGUoTUdTTFBDX0lORk8g
KmluZm8pOw0KPiAgIHN0YXRpYyB2b2lkIHR4X3RpbWVvdXQoc3RydWN0IHRpbWVyX2xpc3QgKnQp
Ow0KPiAgIA0KPiAgIHN0YXRpYyBib29sIGNhcnJpZXJfcmFpc2VkKHN0cnVjdCB0dHlfcG9ydCAq
cG9ydCk7DQo+IC1zdGF0aWMgdm9pZCBkdHJfcnRzKHN0cnVjdCB0dHlfcG9ydCAqcG9ydCwgaW50
IG9ub2ZmKTsNCj4gK3N0YXRpYyB2b2lkIGR0cl9ydHMoc3RydWN0IHR0eV9wb3J0ICpwb3J0LCBi
b29sIG9ub2ZmKTsNCg0KTm90IGFueXRoaW5nIGZvciB0aGlzIHBhdGNoLCBidXQgaGF2aW5nIHRo
aXMgZHViYmVkICJvbm9mZiIgaW5zdGVhZCBvZiANCiJvbiIgbWFrZXMgaXQgcmVhbGx5IGNvbmZ1
c2luZy4NCg0KPiAtLS0gYS9kcml2ZXJzL21tYy9jb3JlL3NkaW9fdWFydC5jDQo+ICsrKyBiL2Ry
aXZlcnMvbW1jL2NvcmUvc2Rpb191YXJ0LmMNCj4gQEAgLTU0OCwxNCArNTQ4LDE0IEBAIHN0YXRp
YyBib29sIHVhcnRfY2Fycmllcl9yYWlzZWQoc3RydWN0IHR0eV9wb3J0ICp0cG9ydCkNCj4gICAg
KglhZGp1c3RlZCBkdXJpbmcgYW4gb3BlbiwgY2xvc2UgYW5kIGhhbmd1cC4NCj4gICAgKi8NCj4g
ICANCj4gLXN0YXRpYyB2b2lkIHVhcnRfZHRyX3J0cyhzdHJ1Y3QgdHR5X3BvcnQgKnRwb3J0LCBp
bnQgb25vZmYpDQo+ICtzdGF0aWMgdm9pZCB1YXJ0X2R0cl9ydHMoc3RydWN0IHR0eV9wb3J0ICp0
cG9ydCwgYm9vbCBvbm9mZikNCj4gICB7DQo+ICAgCXN0cnVjdCBzZGlvX3VhcnRfcG9ydCAqcG9y
dCA9DQo+ICAgCQkJY29udGFpbmVyX29mKHRwb3J0LCBzdHJ1Y3Qgc2Rpb191YXJ0X3BvcnQsIHBv
cnQpOw0KPiAgIAlpbnQgcmV0ID0gc2Rpb191YXJ0X2NsYWltX2Z1bmMocG9ydCk7DQo+ICAgCWlm
IChyZXQpDQo+ICAgCQlyZXR1cm47DQo+IC0JaWYgKG9ub2ZmID09IDApDQo+ICsJaWYgKCFvbm9m
ZikNCj4gICAJCXNkaW9fdWFydF9jbGVhcl9tY3RybChwb3J0LCBUSU9DTV9EVFIgfCBUSU9DTV9S
VFMpOw0KPiAgIAllbHNlDQo+ICAgCQlzZGlvX3VhcnRfc2V0X21jdHJsKHBvcnQsIFRJT0NNX0RU
UiB8IFRJT0NNX1JUUyk7DQoNCkVzcGVjaWFsbHkgaGVyZS4gV2hhdCBkb2VzICIhb25vZmYiIG1l
YW4/IElmIGl0IHdlcmU6DQoNCmlmIChvbikNCiAgIHNkaW9fdWFydF9zZXRfbWN0cmwocG9ydCwg
VElPQ01fRFRSIHwgVElPQ01fUlRTKTsNCmVsc2UNCiAgIHNkaW9fdWFydF9jbGVhcl9tY3RybChw
b3J0LCBUSU9DTV9EVFIgfCBUSU9DTV9SVFMpOw0KDQppdCB3b3VsZCBiZSBhIGxvdCBtb3JlIGNs
ZWFyLg0KDQo+IC0tLSBhL2RyaXZlcnMvdHR5L2FtaXNlcmlhbC5jDQo+ICsrKyBiL2RyaXZlcnMv
dHR5L2FtaXNlcmlhbC5jDQo+IEBAIC0xNDU5LDcgKzE0NTksNyBAQCBzdGF0aWMgYm9vbCBhbWln
YV9jYXJyaWVyX3JhaXNlZChzdHJ1Y3QgdHR5X3BvcnQgKnBvcnQpDQo+ICAgCXJldHVybiAhKGNp
YWIucHJhICYgU0VSX0RDRCk7DQo+ICAgfQ0KPiAgIA0KPiAtc3RhdGljIHZvaWQgYW1pZ2FfZHRy
X3J0cyhzdHJ1Y3QgdHR5X3BvcnQgKnBvcnQsIGludCByYWlzZSkNCj4gK3N0YXRpYyB2b2lkIGFt
aWdhX2R0cl9ydHMoc3RydWN0IHR0eV9wb3J0ICpwb3J0LCBib29sIHJhaXNlKQ0KDQpPciAicmFp
c2UiLiBUaGF0IG1ha2VzIHNlbnNlIHRvbyBhbmQgd2UgY2FsbCBpdCBhcyBzdWNoIGluIA0KdHR5
X3BvcnRfb3BlcmF0aW9uczoNCg0KPiAtLS0gYS9pbmNsdWRlL2xpbnV4L3R0eV9wb3J0LmgNCj4g
KysrIGIvaW5jbHVkZS9saW51eC90dHlfcG9ydC5oDQouLi4NCj4gQEAgLTMyLDcgKzMyLDcgQEAg
c3RydWN0IHR0eV9zdHJ1Y3Q7DQo+ICAgICovDQo+ICAgc3RydWN0IHR0eV9wb3J0X29wZXJhdGlv
bnMgew0KPiAgIAlib29sICgqY2Fycmllcl9yYWlzZWQpKHN0cnVjdCB0dHlfcG9ydCAqcG9ydCk7
DQo+IC0Jdm9pZCAoKmR0cl9ydHMpKHN0cnVjdCB0dHlfcG9ydCAqcG9ydCwgaW50IHJhaXNlKTsN
Cj4gKwl2b2lkICgqZHRyX3J0cykoc3RydWN0IHR0eV9wb3J0ICpwb3J0LCBib29sIHJhaXNlKTsN
Cj4gICAJdm9pZCAoKnNodXRkb3duKShzdHJ1Y3QgdHR5X3BvcnQgKnBvcnQpOw0KPiAgIAlpbnQg
KCphY3RpdmF0ZSkoc3RydWN0IHR0eV9wb3J0ICpwb3J0LCBzdHJ1Y3QgdHR5X3N0cnVjdCAqdHR5
KTsNCj4gICAJdm9pZCAoKmRlc3RydWN0KShzdHJ1Y3QgdHR5X3BvcnQgKnBvcnQpOw0KDQpDYXJl
IHRvIGZpeCB0aGF0IHVwIHRvbz8NCg0KdGhhbmtzLA0KLS0gDQpqcw0Kc3VzZSBsYWJzDQoNCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmdyZXlidXMtZGV2
IG1haWxpbmcgbGlzdCAtLSBncmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3JnClRvIHVuc3Vic2Ny
aWJlIHNlbmQgYW4gZW1haWwgdG8gZ3JleWJ1cy1kZXYtbGVhdmVAbGlzdHMubGluYXJvLm9yZwo=
