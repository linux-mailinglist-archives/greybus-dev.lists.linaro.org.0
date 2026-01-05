Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ABCCCF4710
	for <lists+greybus-dev@lfdr.de>; Mon, 05 Jan 2026 16:38:12 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id D1A4B3F843
	for <lists+greybus-dev@lfdr.de>; Mon,  5 Jan 2026 15:38:10 +0000 (UTC)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	by lists.linaro.org (Postfix) with ESMTPS id 3EAEF3F713
	for <greybus-dev@lists.linaro.org>; Mon,  5 Jan 2026 15:38:08 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=fmPA2GbF;
	spf=pass (lists.linaro.org: domain of sun.jian.kdev@gmail.com designates 209.85.128.171 as permitted sender) smtp.mailfrom=sun.jian.kdev@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-790884840baso1048767b3.0
        for <greybus-dev@lists.linaro.org>; Mon, 05 Jan 2026 07:38:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767627488; x=1768232288; darn=lists.linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q/gWPzgaa5LfKzS4YfDBDSuINDb+qBDf38olYVcxwSU=;
        b=fmPA2GbFIqPoI3rlzFA5YtTJ0tMT0YIbQPpea9bh7l9lVTCLIXptQviRZjCEr7pArj
         kZD+ePaEOinXcKhDcNy6uND5m7wDD8uOCkt8WSWsPwRljjHH546NEuISbaxV0XMzFTNR
         UDFNPSYv8vkLlwthliHVatvBqEBdbSF/Wc/AfrE7HBO7Ru2YUHhWU7Hu+Jc7kZGB2r0X
         YQ/PKOYD3zESyzRv4Vy9zN64zARvD0wg8zsxgIWeZmyM3daBUlNXvTG84c/FB4a5Vraf
         zqhkXjxQn4zJQbHWF5jZeevtMCZg6rAfwDC6JKaNTThCOXG2CMd74w7JwLeL/Ofo5lhD
         2TPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767627488; x=1768232288;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Q/gWPzgaa5LfKzS4YfDBDSuINDb+qBDf38olYVcxwSU=;
        b=LinbrgTqnvCKZwN5rOl6eFgx7urYtyiEFVf2L7pAZ2+wDLAWGkWlW8IHGEsBMX9CpH
         Tw86XNsV4jFS3ujigQy0pKxFNfOmuAqG57jPts8Ti8JU2ycNXGVnz+AuoSyrfHrsUuKK
         CHcj2dYYVx3VMmlMKoZMVZR220UZhWQ6Um2wZmhKNkKfkZNr/gWCCz3/rHGaM8bCEeZ8
         97VDf3JHW4wtifs5a0AxQ12KXcPTqnp4bJIB0t77MxcqABMjcwVlUjnFzO7GMkOVwhgz
         HemeJEDBlk6STz2jkEwF5qC3Vil7BUSbqbaF5W+T3qumoWOyQLnFFWRdgduVpJjgcZ8A
         /n+g==
X-Forwarded-Encrypted: i=1; AJvYcCW6UHbgt4M0hPz2LWp/E5q1NvWCDA8TawaNuP9HswVvzGyQDWwbbCB7pPXolN15kEY7RkDzxeoUh9+hBw==@lists.linaro.org
X-Gm-Message-State: AOJu0YwJfXmVhWQkpntjm/EVl/uJJV9uo2a0w+ll3Ldbvsi4YmbkwFjO
	ZTqFZxiOY1j2IXek3JAFFDHRFSriGIU2PhKUt65fr9eT7DKHz/9vyTCXW51IV8xlZbXQnFoOpdS
	eW4aRIHhKnTl42l6UH78XyOZfAz+ux9c=
X-Gm-Gg: AY/fxX691Vc9+1HwU6VZjqJZxC5dDwSYn0V8+kSsK4EKqq1nKbGaWhpKAZ/oU89n+kY
	nG58jgX8zsJU9UavRSaQyl+P7WRv3XZLzhJBVwEoB+zaRuB0nbIRFc+prxpxXa6zmHZRjwvaj2U
	+mMSab3OITZDrPpudZV5ZHyIOtkl/RDzQYUBFJYWYlYAuTAIM5QALjz8aF0+Di7Ukj+dUZJysX9
	8h5MaDfZR/jRQA76tlByZsQ7MN85ktixlxaCbCnX4acF9DPwsffDvtAxRx3fnvvufxn41OCMxCH
X-Google-Smtp-Source: AGHT+IGl87GGPVMUN6FsjpAQJ4VKxCFefnCPMdgk+GP3o+7QVSulcegVZl3+LNvQ6jZg7L+xQKVP9NhHQ157u/7BtOo=
X-Received: by 2002:a05:690e:b83:b0:63f:55de:63cc with SMTP id
 956f58d0204a3-6466a86bfefmr38238597d50.31.1767627487533; Mon, 05 Jan 2026
 07:38:07 -0800 (PST)
MIME-Version: 1.0
References: <20251229112649.137391-1-sun.jian.kdev@gmail.com>
 <20251230012908.214959-1-sun.jian.kdev@gmail.com> <aVumucN_RFQwfgj9@stanley.mountain>
In-Reply-To: <aVumucN_RFQwfgj9@stanley.mountain>
From: sun jian <sun.jian.kdev@gmail.com>
Date: Mon, 5 Jan 2026 23:37:55 +0800
X-Gm-Features: AQt7F2p5VcvIirf6mh8dvM9J3boQMIoPyg3Rrs3N9TrU8ra2Ow6u9_l82iDGyCY
Message-ID: <CABFUUZEhxz5n8Rf5UvxZiFRoXQ+DuZtpa9+iS46Rt4rpb8hD9A@mail.gmail.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
X-Rspamd-Queue-Id: 3EAEF3F713
X-Spamd-Bar: ---
X-Spamd-Result: default: False [-4.00 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RCVD_COUNT_ONE(0.00)[1];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.128.171:from];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	URIBL_BLOCKED(0.00)[linaro.org:email];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,animalcreek.com,linuxfoundation.org,lists.linaro.org,lists.linux.dev,vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	DWL_DNSWL_NONE(0.00)[gmail.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: AWE6NWVFXM6FD6BQOQCSJKG7UKYGWTHF
X-Message-ID-Hash: AWE6NWVFXM6FD6BQOQCSJKG7UKYGWTHF
X-MailFrom: sun.jian.kdev@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, David Laight <david.laight.linux@gmail.com>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v3] staging: greybus: audio: avoid snprintf truncation warnings
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/AWE6NWVFXM6FD6BQOQCSJKG7UKYGWTHF/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgRGFuLA0KDQpVbmRlcnN0b29kIOKAlCBJJ2xsIGRyb3AgdGhpcyBwYXRjaC4gVGhhbmtzLg0K
DQpyZWdhcmRzLA0KU3VuIEppYW4NCg0KT24gTW9uLCBKYW4gNSwgMjAyNiBhdCA3OjU14oCvUE0g
RGFuIENhcnBlbnRlciA8ZGFuLmNhcnBlbnRlckBsaW5hcm8ub3JnPiB3cm90ZToNCj4NCj4gVGhp
cyBXPTEgc3RyaW5nIHRydW5jYXRpb24gd2FybmluZ3MgYWx3YXlzIHNlZW1zIGxpa2UgYSBwb2lu
dGxlc3MgdGhpbmcuDQo+IGRtZXNnIG91dHB1dCBpcyByZWFsbHkgb25seSBpbnRlbmRlZCBmb3Ig
ZGV2ZWxvcGVycy4gIEkgZG9uJ3QgZXZlbiBrbm93DQo+IGhvdyB0byBsb29rIGF0IHRoZSBkbWVz
ZyBvbiBteSBwaG9uZSBvciBraW5kbGUuICBXaG8gY2FyZXMgaWYgdGhlIGxhc3QNCj4gY2hhcmFj
dGVyIGluIGEgcmVhbGx5IGxvbmcgZGV2aWNlIG5hbWUgaXMgbWlzc2luZz8gIEkgaGF2ZSBsb29r
ZWQgYXQgYQ0KPiBsb3Qgb2Ygc3RhY2sgdHJhY2VzIGFuZCBJIGhhdmUgbmV2ZXIgb25jZSBiZWVu
IHN0eW1pZWQgYmVjYXVzZSBvbmUNCj4gY2hhcmFjdGVyIHdhcyBtaXNzaW5nIGluIGEgcmVhbGx5
IGxvbmcgZGV2aWNlIG5hbWUuDQo+DQo+IEFuZCBhbHNvIHRoZXNlIGFyZSA5MCUgZmFsc2UgcG9z
aXRpdmVzLiAgV2UganVzdCBhZGQgYm91bmRzIGNoZWNraW5nIGFsbA0KPiBvZiBvdXIgb3V0cHV0
IHRvIHByZXZlbnQgbWVtb3J5IGNvcnJ1cHRpb24gYW5kIG5vdCBiZWNhdXNlIHdlIHRoaW5rIHRo
YXQNCj4gd2UnbGwgYWN0dWFsbHkgaGl0IHRoZSBib3VuZGFyaWVzLiAgQW5kIHRoZSBHQ0MgaXMg
bm90IGFibGUgdG8gYW5hbHl6ZQ0KPiB0aGVzZSBpbiBhIHNlbnNpYmxlIHdheSwgaXQncyBqdXN0
IGdvaW5nIGJhc2VkIG9uIHRoZSB2YXJpYWJsZSB0eXBlcy4NCj4NCj4gVGhpcyBwYXRjaCBtYWtl
cyB0aGUgY29kZSB3b3JzZSAobW9yZSBjb21wbGljYXRlZCkuDQo+DQo+IFRvIHJlY2FwOg0KPiAx
OiBJdCdzIHdhcm5pbmcgYWJvdXQgYSBub24taXNzdWUuICBObyBvbmUgY2FyZXMgYWJvdXQgdHJ1
bmNhdGVkIG91dHB1dC4NCj4gMjogVGhlIHdhcm5pbmcgaXMgaW1wbGVtZW50ZWQgcG9vcmx5LiAg
SGlnaCBmYWxzZSBwb3NpdGl2ZSByYXRpby4NCj4gMzogVGhlIGZpeCBtYWtlcyB0aGUgY29kZSB3
b3JzZQ0KPg0KPiBKdXN0IGZpeCB0aGUgdG9vbCBpbnN0ZWFkIG9mIG1ha2luZyB0aGUgY29kZSB3
b3JzZSBmb3Igbm8gcmVhc29uLg0KPg0KPiByZWdhcmRzLA0KPiBkYW4gY2FycGVudGVyDQpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpncmV5YnVzLWRldiBt
YWlsaW5nIGxpc3QgLS0gZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpUbyB1bnN1YnNjcmli
ZSBzZW5kIGFuIGVtYWlsIHRvIGdyZXlidXMtZGV2LWxlYXZlQGxpc3RzLmxpbmFyby5vcmcK
