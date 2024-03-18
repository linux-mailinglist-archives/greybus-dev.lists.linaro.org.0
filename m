Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 00F4B87EFE8
	for <lists+greybus-dev@lfdr.de>; Mon, 18 Mar 2024 19:41:45 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id F3C9140E13
	for <lists+greybus-dev@lfdr.de>; Mon, 18 Mar 2024 18:41:43 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	by lists.linaro.org (Postfix) with ESMTPS id DA93F3F326
	for <greybus-dev@lists.linaro.org>; Mon, 18 Mar 2024 18:41:41 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=ieee.org header.s=google header.b="AhJ/UBfV";
	dmarc=pass (policy=quarantine) header.from=ieee.org;
	spf=pass (lists.linaro.org: domain of elder@ieee.org designates 209.85.160.171 as permitted sender) smtp.mailfrom=elder@ieee.org
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-430a0d6c876so25875321cf.3
        for <greybus-dev@lists.linaro.org>; Mon, 18 Mar 2024 11:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1710787301; x=1711392101; darn=lists.linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h2Eahz5y1g6Io4kuIZCPOk+HRz1bynd6ShyA3Ce0EGU=;
        b=AhJ/UBfVQZpVQtxnTi2s0+IjGGe0coQyZsx3AZbAqPTYDuD4q8IhNIxkC6JTJjAmSI
         C+tgVMrGWj/Rra0yV2Qgmi74MzHYVim2+56uvsfOfuY/Yu9MY95VdXD3IXa6zAVAoVSy
         /X7VtVV/xYKnHNpMGSZw/RQ4+JlEeQEAPZ8KE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710787301; x=1711392101;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h2Eahz5y1g6Io4kuIZCPOk+HRz1bynd6ShyA3Ce0EGU=;
        b=IB6mLbBq70PF/ASXzOPIJlx+7KhAtouiQl2xRiztdroE7Tb6bZQUTZfGYPC9281x8z
         rE4JvP5US96DH5AjMcS8H6GROXevVjWemEYyuKCXasoeJdJjya7QDHtMtAfdjaq6npuP
         PoHQLk7yQqNqeyRyUFyFbyvH6a7Zit5Szr8utgELeX07FQTziN/4SrnnBZ2j9fkaEnTS
         zdneeklhxfEn8DlZLIlD5yeCX11A8pMaYegTppmOabv0FxmD4GBZVZIgUtyiO1vrUWtd
         t9jcDhekvcJCxfRfhvmp+tyEmhJzi+zj75HbzRO+evifzRfmOmeE06OZAshDkMs+GtEy
         bZ5w==
X-Forwarded-Encrypted: i=1; AJvYcCVTdHX1vvHIbgqszLVKXqFAQrkU+XAjsXrz7472MdJG0Q46E6PkNRjGGYneFDXaez05y+45dzkzRMNtg5l6JYOXIamkZ/VBODBy+4t3
X-Gm-Message-State: AOJu0YwQIP2fCaJhoDLeFj1JB6FEF/gqvUM33a+RDRk3Ywcm900EZeaZ
	pBLzo26IsYkI6XPfqFeA6D8e4e4OcGAGKEr2ExB/myK4GWLsk79YbvJxX7JZvg==
X-Google-Smtp-Source: AGHT+IGa3DaP+ZQVnj5jdz1bnLoir7DhMaL4Yu8xli/2COHN6CI/dNA/dqupLIRNhbwqIkT59FDHPg==
X-Received: by 2002:a05:622a:248:b0:430:e4ad:afbf with SMTP id c8-20020a05622a024800b00430e4adafbfmr381232qtx.20.1710787301471;
        Mon, 18 Mar 2024 11:41:41 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.googlemail.com with ESMTPSA id fj5-20020a05622a550500b00430b423f06csm3796449qtb.86.2024.03.18.11.41.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Mar 2024 11:41:41 -0700 (PDT)
Message-ID: <3eb9d5c2-149c-460c-9684-3fdaf946c400@ieee.org>
Date: Mon, 18 Mar 2024 13:41:38 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Markus Elfring <Markus.Elfring@web.de>,
 Ayush Singh <ayushdevel1325@gmail.com>,
 Vaishnav M A <vaishnav@beagleboard.org>, devicetree@vger.kernel.org,
 kernel-janitors@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, lorforlinux@beagleboard.org,
 greybus-dev@lists.linaro.org
References: <20240317193714.403132-5-ayushdevel1325@gmail.com>
 <4fe6f68a-786c-4e3d-b97d-847d6965d1d3@web.de>
From: Alex Elder <elder@ieee.org>
In-Reply-To: <4fe6f68a-786c-4e3d-b97d-847d6965d1d3@web.de>
X-Rspamd-Queue-Id: DA93F3F326
X-Spamd-Bar: ------
X-Spamd-Result: default: False [-6.49 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ieee.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[ieee.org:s=google];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.160.171:from];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[web.de,gmail.com,beagleboard.org,vger.kernel.org,lists.infradead.org,lists.linaro.org];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[ieee.org:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: HE6WOMEHIVWIGGDGBJFBSNXPQOONZLTS
X-Message-ID-Hash: HE6WOMEHIVWIGGDGBJFBSNXPQOONZLTS
X-MailFrom: elder@ieee.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: LKML <linux-kernel@vger.kernel.org>, Alex Elder <elder@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Conor Dooley <conor+dt@kernel.org>, Derek Kiernan <derek.kiernan@amd.com>, Dragan Cvetic <dragan.cvetic@amd.com>, Johan Hovold <johan@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Mark Brown <broonie@kernel.org>, Nishanth Menon <nm@ti.com>, Rob Herring <robh@kernel.org>, Robert Nelson <robertcnelson@beagleboard.org>, Tero Kristo <kristo@kernel.org>, Vaishnav M A <vaishnav.a@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v4 4/5] mikrobus: Add mikroBUS driver
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/HE6WOMEHIVWIGGDGBJFBSNXPQOONZLTS/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: base64

T24gMy8xOC8yNCAxMjo1OCBQTSwgTWFya3VzIEVsZnJpbmcgd3JvdGU6DQo+IOKApg0KPj4gKysr
IGIvZHJpdmVycy9taXNjL21pa3JvYnVzL21pa3JvYnVzX2NvcmUuYw0KPiDigKYNCj4+ICtzdGF0
aWMgaW50IG1pa3JvYnVzX3BpbmN0cmxfc2V0dXAoc3RydWN0IG1pa3JvYnVzX3BvcnQgKnBvcnQs
DQo+PiArCQkJCSAgc3RydWN0IGFkZG9uX2JvYXJkX2luZm8gKmJvYXJkKQ0KPj4gK3sNCj4+ICsJ
aW50IHJldDsNCj4+ICsNCj4+ICsJaWYgKCFib2FyZCB8fCBib2FyZC0+cGluX3N0YXRlW01JS1JP
QlVTX1BJTl9QV01dID09IE1JS1JPQlVTX1NUQVRFX1BXTSkNCj4+ICsJCXJldCA9IG1pa3JvYnVz
X3BpbmN0cmxfc2VsZWN0KHBvcnQsICJwd21fZGVmYXVsdCIpOw0KPj4gKwllbHNlDQo+PiArCQly
ZXQgPSBtaWtyb2J1c19waW5jdHJsX3NlbGVjdChwb3J0LCAicHdtX2dwaW8iKTsNCj4g4oCmDQo+
IA0KPiBIb3cgZG8geW91IHRoaW5rIGFib3V0IHRvIGF2b2lkIHRoZSBzcGVjaWZpY2F0aW9uIG9m
IGEgYml0IG9mIGR1cGxpY2F0ZSBzb3VyY2UgY29kZSBoZXJlDQo+IGJ5IHVzaW5nIGNvbmRpdGlv
bmFsIG9wZXJhdG9yIGV4cHJlc3Npb25zPw0KPiANCj4gCXJldCA9IG1pa3JvYnVzX3BpbmN0cmxf
c2VsZWN0KHBvcnQsDQo+IAkJCQkgICAgICAoKCFib2FyZCB8fA0KPiAJCQkJCWJvYXJkLT5waW5f
c3RhdGVbTUlLUk9CVVNfUElOX1BXTV0gPT0gTUlLUk9CVVNfU1RBVEVfUFdNKQ0KPiAJCQkJICAg
ICAgPyAicHdtX2RlZmF1bHQiDQo+IAkJCQkgICAgICA6ICJwd21fZ3BpbyIpKTsNCg0KTm8uDQoN
Ckl0J3MgYSBjb21wbGV4IGVub3VnaCBiaXQgb2YgbG9naWMgd2l0aG91dCB0cnlpbmcgdG8gYnVy
eQ0KaXQgaW5zaWRlIHRoZSBwYXJhbWV0ZXJzIHBhc3NlZCB0byB0aGUgZnVuY3Rpb24uDQoNCgkJ
CQkJLUFsZXgNCg0KPiANCj4gDQo+IFJlZ2FyZHMsDQo+IE1hcmt1cw0KPiANCg0KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1kZXYgbWFpbGlu
ZyBsaXN0IC0tIGdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKVG8gdW5zdWJzY3JpYmUgc2Vu
ZCBhbiBlbWFpbCB0byBncmV5YnVzLWRldi1sZWF2ZUBsaXN0cy5saW5hcm8ub3JnCg==
