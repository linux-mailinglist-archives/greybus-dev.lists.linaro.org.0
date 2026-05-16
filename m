Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id bPAbAUX0CWqFvgQAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Sun, 17 May 2026 19:00:53 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC35562597
	for <lists+greybus-dev@lfdr.de>; Sun, 17 May 2026 19:00:52 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 1B058404F4
	for <lists+greybus-dev@lfdr.de>; Sun, 17 May 2026 16:51:33 +0000 (UTC)
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	by lists.linaro.org (Postfix) with ESMTPS id C82153F72F
	for <greybus-dev@lists.linaro.org>; Sat, 16 May 2026 18:25:27 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=DLgGvKGd;
	arc=pass ("google.com:s=arc-20240605:i=1");
	spf=pass (lists.linaro.org: domain of brgerst@gmail.com designates 209.85.221.169 as permitted sender) smtp.mailfrom=brgerst@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-57754ec3462so188297e0c.0
        for <greybus-dev@lists.linaro.org>; Sat, 16 May 2026 11:25:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778955927; cv=none;
        d=google.com; s=arc-20240605;
        b=IsDaF8BMsnpHFQ7tD0oG8U4goyA3JtGmGdEax0gZ6Dq2zok1c3JBU8AqYpuuRRQ3kO
         127Hr6XT0XtJWTfEbYG4wu8wGTDswuFO59H9Ipq6BtNDZhSpm6ne9kJdziFc4rLB3+8v
         7GkLoVKOw8GaPbO3BhJ34BQ8sfBrsn1+ATRywrJfJwIuxiN6fyFTQXMEn797tPv8j6Tq
         G8XAxPKDN/CxOxZXUTwcE528gqVjq0jCXWgb/h0DgzZE1kw4esC5jbZCsikFSPRvv5ph
         Ij+stI4SCTE1RFKLmaPDmsQmQYhAeEfFKH/vjQAv86qakg53nVFGClum//YFAD187fIT
         Gvyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SkG/mV7/+T57gOebLhjBWLUXJSJDsOeED6RV9YmxRq0=;
        fh=rnRzarJVJWt73mzVtViM63vYhlZwmHsQBrT6xH5+fN0=;
        b=RmJUoHgEM2h2QYIU/1NmEAxpZcsWivElbWKt/yGiD7jRjGQQEPh+7rrn4TI5KFNJcG
         gTbWOrbeLm9oqIMXra+DMOzFrFOIQBZnC/ndFxHCWwOHgxgLX9i+Pn7obJUO/2RBnSSu
         Bw/GjtCNDUA2Eeg58vP9m1Xzgv//svsh/ghJ3pYWRJdFUKBzuq4kgp/y1sNRosLflwSH
         WUj4LiJhIIM/QFNEp3w7KZ1pmjX+je03slo3IWpH1ZM0EKL1DEi9VNk+5vrW1n9tN0Lm
         8l+NJfZeA/lLpMfaCMKXFchYAswFqb/oQg041bkIotIxwLutWMZHoW30A4HA1LlYKT3Y
         bSVw==;
        darn=lists.linaro.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778955927; x=1779560727; darn=lists.linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SkG/mV7/+T57gOebLhjBWLUXJSJDsOeED6RV9YmxRq0=;
        b=DLgGvKGd4Ts2v6mOFeHbKAY08bB/6zYmduUVzBH4U4wAMuSlxMwY/fwzGfexlcD4pp
         jYm0Q3m2Dep6YWOSBM5e8PEs77AwwgfCsDEX9/NKrwkPZr7k50+m+BTii6x4yFcIIKfr
         zKVyDfAx1TF/6ioQkU6R9gYfXvwqouuHPP9XMJ/DSCLSBHVuWl5kzcoYCTfmn5fEWsh5
         tNxxK2yp0Eb0qxi05WccLEe2tCZhPt3uLYSuLH/VYX7Pgxejd6HlgXKxkS6y0iBAMX1T
         edKXwSFsZ1kOEu/76kSTtL+74eib/fZhGB3BfRRK4xgKHHw8uDEM23q0Yo0EduDnNdjx
         izqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778955927; x=1779560727;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SkG/mV7/+T57gOebLhjBWLUXJSJDsOeED6RV9YmxRq0=;
        b=KjKeW7PIVmAlMTS39W7eAC5r2qLVmwP9KUWz6kJKlgv2RwJkXxWhPqZhobgy8evQK/
         iZyPMAhaHBJhq64sh7nvR3rPmn45df8a1LpDVMlBGuhcZTbTePQiKXBslydzfYeU6/iF
         cgeoanULlYTQJv+2ME/2/U/y0e4pW+KbKPKQ/UrsIZbG/RWyf0KAM89HXxFSMK1zb6J3
         STaOdSG8rCyJ55ZXCptjZr0czRVC8T79Bf2Ob8zvTBL5P7l4BlDf7mCFmDnOoR3DKsKn
         RX6PwotNqZHzA2CFo6ByXmb1LjF9YIKv5WjqQkwo6k+mJsZ5iZZH/xS2FwCIv1FNfDwk
         6ljA==
X-Forwarded-Encrypted: i=1; AFNElJ/x/b7dBhd/p2hYDAmpLx6bFgZMlu715iuxsIYJfV+bsrHd51P1XQZ3M8pNRTUDyQ35yt96ciQ55xd6NQ==@lists.linaro.org
X-Gm-Message-State: AOJu0YzcGeu7bs5zMpRmc0QlKgg8ghsm0qcZ8h4R/Shz/Pq6eaza65d9
	jCvRUPRD6RpmJq2CxWrnlR6xgvBLC7829vgRPvMw0EixfeHQvQeY05GSyWn3jzGipey9q6z9J23
	IBqyMstIWCCLvbxQAErk64vA/u7N8aw==
X-Gm-Gg: Acq92OGOVYUmwRvlqRlvW5uaDO2w4VTNUOs8werHfrjjSW3VRQ8F7hL1MrSQmFoGcvF
	VylPjPZGS2oonVoVw7tV8gy0o/RAuVZXvXq6H0ceOwxrcG0hlaw9+DgQaR7Ou7KzbsCFBga0pMU
	JmeQEYUY19vZmj3Xxokz5djrWfrqN092OKlX//NwVbDOaV+A4WMWcCY5Bi/XywtoT0ujOEbF79Q
	bthi/vwlgCNJqeJmaQzdEB3ogcFVpRhQChtjFgzHlypcxMZdC3KHTNzYfCxOugbVfH9qCKyIuEg
	AXcawMK5XKVfG2wIOtNaOTTyqUKZrB27pXIO392z
X-Received: by 2002:a05:6102:a4a:b0:631:3cbe:24a9 with SMTP id
 ada2fe7eead31-63a403acd61mr5104520137.31.1778955927317; Sat, 16 May 2026
 11:25:27 -0700 (PDT)
MIME-Version: 1.0
References: <20260504-wip-fix-core-v3-0-ce1f11f4968f@kernel.org> <20260504-wip-fix-core-v3-1-ce1f11f4968f@kernel.org>
In-Reply-To: <20260504-wip-fix-core-v3-1-ce1f11f4968f@kernel.org>
From: Brian Gerst <brgerst@gmail.com>
Date: Sat, 16 May 2026 14:25:15 -0400
X-Gm-Features: AVHnY4Ld3uQxrMVDp5dOpfkW5jEH4X-4ObNKlmAwKJn9zSPCBkcMEhByKE4-YXg
Message-ID: <CAMzpN2ijE3vqnh30T0ETQBp6qcVbsxNZZ32h4oEri9nBFUd-UQ@mail.gmail.com>
To: Benjamin Tissoires <bentiss@kernel.org>
X-Spamd-Bar: -----
X-MailFrom: brgerst@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: GMZWHSWGJH4D7G65VK2B323RTW3XOSUV
X-Message-ID-Hash: GMZWHSWGJH4D7G65VK2B323RTW3XOSUV
X-Mailman-Approved-At: Sun, 17 May 2026 16:51:14 +0000
CC: Jiri Kosina <jikos@kernel.org>, =?UTF-8?Q?Filipe_La=C3=ADns?= <lains@riseup.net>, Bastien Nocera <hadess@hadess.net>, Ping Cheng <ping.cheng@wacom.com>, Jason Gerecke <jason.gerecke@wacom.com>, Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, Lee Jones <lee@kernel.org>, Icenowy Zheng <uwu@icenowy.me>, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-usb@vger.kernel.org, stable@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v3 1/4] HID: pass the buffer size to hid_report_raw_event
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/GMZWHSWGJH4D7G65VK2B323RTW3XOSUV/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Rspamd-Queue-Id: 7BC35562597
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.69 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+mx:c];
	MAILLIST(-0.20)[mailman];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[17];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgerst@gmail.com,greybus-dev-bounces@lists.linaro.org];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	NEURAL_SPAM(0.00)[0.095];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,lists.linaro.org:helo,lists.linaro.org:rdns,mail.gmail.com:mid]
X-Rspamd-Action: no action

T24gTW9uLCBNYXkgNCwgMjAyNiBhdCA0OjQ44oCvQU0gQmVuamFtaW4gVGlzc29pcmVzIDxiZW50
aXNzQGtlcm5lbC5vcmc+IHdyb3RlOg0KPg0KPiBjb21taXQgMGEzZmU5NzJhN2NiICgiSElEOiBj
b3JlOiBNaXRpZ2F0ZSBwb3RlbnRpYWwgT09CIGJ5IHJlbW92aW5nDQo+IGJvZ3VzIG1lbXNldCgp
IikgZW5mb3JjZWQgdGhlIHByb3ZpZGVkIGRhdGEgdG8gYmUgYXQgbGVhc3QgdGhlIHNpemUgb2YN
Cj4gdGhlIGRlY2xhcmVkIGJ1ZmZlciBpbiB0aGUgcmVwb3J0IGRlc2NyaXB0b3IgdG8gcHJldmVu
dCBhIGJ1ZmZlcg0KPiBvdmVyZmxvdy4gSG93ZXZlciwgd2UgY2FuIHRyeSB0byBiZSBzbWFydGVy
IGJ5IHByb3ZpZGluZyBib3RoIHRoZSBidWZmZXINCj4gc2l6ZSBhbmQgdGhlIGRhdGEgc2l6ZSwg
bWVhbmluZyB0aGF0IGhpZF9yZXBvcnRfcmF3X2V2ZW50KCkgY2FuIG1ha2UNCj4gYmV0dGVyIGRl
Y2lzaW9uIHdoZXRoZXIgd2Ugc2hvdWxkIHBsYWluaW5nIHJlamVjdCB0aGUgYnVmZmVyIChidWZm
ZXINCj4gb3ZlcmZsb3cgYXR0ZW1wdCkgb3IgaWYgd2UgY2FuIHNhZmVseSBtZW1zZXQgaXQgdG8g
MCBhbmQgcGFzcyBpdCB0byB0aGUNCj4gcmVzdCBvZiB0aGUgc3RhY2suDQo+DQo+IEZpeGVzOiAw
YTNmZTk3MmE3Y2IgKCJISUQ6IGNvcmU6IE1pdGlnYXRlIHBvdGVudGlhbCBPT0IgYnkgcmVtb3Zp
bmcgYm9ndXMgbWVtc2V0KCkiKQ0KPiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZw0KPiBTaWdu
ZWQtb2ZmLWJ5OiBCZW5qYW1pbiBUaXNzb2lyZXMgPGJlbnRpc3NAa2VybmVsLm9yZz4NCj4gLS0t
DQo+ICBkcml2ZXJzL2hpZC9icGYvaGlkX2JwZl9kaXNwYXRjaC5jIHwgIDYgKysrKy0tDQo+ICBk
cml2ZXJzL2hpZC9oaWQtY29yZS5jICAgICAgICAgICAgIHwgNDIgKysrKysrKysrKysrKysrKysr
KysrKysrKy0tLS0tLS0tLS0tLS0NCj4gIGRyaXZlcnMvaGlkL2hpZC1nZnJtLmMgICAgICAgICAg
ICAgfCAgNCArKy0tDQo+ICBkcml2ZXJzL2hpZC9oaWQtbG9naXRlY2gtaGlkcHAuYyAgIHwgIDIg
Ky0NCj4gIGRyaXZlcnMvaGlkL2hpZC1tdWx0aXRvdWNoLmMgICAgICAgfCAgMiArLQ0KPiAgZHJp
dmVycy9oaWQvaGlkLXByaW1heC5jICAgICAgICAgICB8ICAyICstDQo+ICBkcml2ZXJzL2hpZC9o
aWQtdml2YWxkaS1jb21tb24uYyAgIHwgIDIgKy0NCj4gIGRyaXZlcnMvaGlkL3dhY29tX3N5cy5j
ICAgICAgICAgICAgfCAgNiArKystLS0NCj4gIGRyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2hpZC5j
ICAgICAgfCAgMiArLQ0KPiAgaW5jbHVkZS9saW51eC9oaWQuaCAgICAgICAgICAgICAgICB8ICA0
ICsrLS0NCj4gIGluY2x1ZGUvbGludXgvaGlkX2JwZi5oICAgICAgICAgICAgfCAxNCArKysrKysr
Ky0tLS0tDQo+ICAxMSBmaWxlcyBjaGFuZ2VkLCA1MyBpbnNlcnRpb25zKCspLCAzMyBkZWxldGlv
bnMoLSkNCj4NCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaGlkL2JwZi9oaWRfYnBmX2Rpc3BhdGNo
LmMgYi9kcml2ZXJzL2hpZC9icGYvaGlkX2JwZl9kaXNwYXRjaC5jDQo+IGluZGV4IDUwYzdiNDVj
NTllMy4uZDAxMzA2NTgwOTFiIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2hpZC9icGYvaGlkX2Jw
Zl9kaXNwYXRjaC5jDQo+ICsrKyBiL2RyaXZlcnMvaGlkL2JwZi9oaWRfYnBmX2Rpc3BhdGNoLmMN
Cj4gQEAgLTI0LDcgKzI0LDggQEAgRVhQT1JUX1NZTUJPTChoaWRfb3BzKTsNCj4NCj4gIHU4ICoN
Cj4gIGRpc3BhdGNoX2hpZF9icGZfZGV2aWNlX2V2ZW50KHN0cnVjdCBoaWRfZGV2aWNlICpoZGV2
LCBlbnVtIGhpZF9yZXBvcnRfdHlwZSB0eXBlLCB1OCAqZGF0YSwNCj4gLSAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgdTMyICpzaXplLCBpbnQgaW50ZXJydXB0LCB1NjQgc291cmNlLCBib29s
IGZyb21fYnBmKQ0KPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzaXplX3QgKmJ1Zl9z
aXplLCB1MzIgKnNpemUsIGludCBpbnRlcnJ1cHQsIHU2NCBzb3VyY2UsDQo+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIGJvb2wgZnJvbV9icGYpDQo+ICB7DQo+ICAgICAgICAgc3RydWN0
IGhpZF9icGZfY3R4X2tlcm4gY3R4X2tlcm4gPSB7DQo+ICAgICAgICAgICAgICAgICAuY3R4ID0g
ew0KPiBAQCAtNzQsNiArNzUsNyBAQCBkaXNwYXRjaF9oaWRfYnBmX2RldmljZV9ldmVudChzdHJ1
Y3QgaGlkX2RldmljZSAqaGRldiwgZW51bSBoaWRfcmVwb3J0X3R5cGUgdHlwZQ0KPiAgICAgICAg
ICAgICAgICAgKnNpemUgPSByZXQ7DQo+ICAgICAgICAgfQ0KPg0KPiArICAgICAgICpidWZfc2l6
ZSA9IGN0eF9rZXJuLmN0eC5hbGxvY2F0ZWRfc2l6ZTsNCj4gICAgICAgICByZXR1cm4gY3R4X2tl
cm4uZGF0YTsNCj4gIH0NCj4gIEVYUE9SVF9TWU1CT0xfR1BMKGRpc3BhdGNoX2hpZF9icGZfZGV2
aWNlX2V2ZW50KTsNCj4gQEAgLTUwNSw3ICs1MDcsNyBAQCBfX2hpZF9icGZfaW5wdXRfcmVwb3J0
KHN0cnVjdCBoaWRfYnBmX2N0eCAqY3R4LCBlbnVtIGhpZF9yZXBvcnRfdHlwZSB0eXBlLCB1OCAq
Yg0KPiAgICAgICAgIGlmIChyZXQpDQo+ICAgICAgICAgICAgICAgICByZXR1cm4gcmV0Ow0KPg0K
PiAtICAgICAgIHJldHVybiBoaWRfb3BzLT5oaWRfaW5wdXRfcmVwb3J0KGN0eC0+aGlkLCB0eXBl
LCBidWYsIHNpemUsIDAsICh1NjQpKGxvbmcpY3R4LCB0cnVlLA0KPiArICAgICAgIHJldHVybiBo
aWRfb3BzLT5oaWRfaW5wdXRfcmVwb3J0KGN0eC0+aGlkLCB0eXBlLCBidWYsIHNpemUsIHNpemUs
IDAsICh1NjQpKGxvbmcpY3R4LCB0cnVlLA0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGxvY2tfYWxyZWFkeV90YWtlbik7DQo+ICB9DQo+DQo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2hpZC9oaWQtY29yZS5jIGIvZHJpdmVycy9oaWQvaGlkLWNvcmUuYw0KPiBpbmRl
eCA2MWFmZWM1OTE1ZWMuLmE4MDY4MjBkZjdlNSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9oaWQv
aGlkLWNvcmUuYw0KPiArKysgYi9kcml2ZXJzL2hpZC9oaWQtY29yZS5jDQo+IEBAIC0yMDMzLDI0
ICsyMDMzLDMyIEBAIGludCBfX2hpZF9yZXF1ZXN0KHN0cnVjdCBoaWRfZGV2aWNlICpoaWQsIHN0
cnVjdCBoaWRfcmVwb3J0ICpyZXBvcnQsDQo+ICB9DQo+ICBFWFBPUlRfU1lNQk9MX0dQTChfX2hp
ZF9yZXF1ZXN0KTsNCj4NCj4gLWludCBoaWRfcmVwb3J0X3Jhd19ldmVudChzdHJ1Y3QgaGlkX2Rl
dmljZSAqaGlkLCBlbnVtIGhpZF9yZXBvcnRfdHlwZSB0eXBlLCB1OCAqZGF0YSwgdTMyIHNpemUs
DQo+IC0gICAgICAgICAgICAgICAgICAgICAgICBpbnQgaW50ZXJydXB0KQ0KPiAraW50IGhpZF9y
ZXBvcnRfcmF3X2V2ZW50KHN0cnVjdCBoaWRfZGV2aWNlICpoaWQsIGVudW0gaGlkX3JlcG9ydF90
eXBlIHR5cGUsIHU4ICpkYXRhLA0KPiArICAgICAgICAgICAgICAgICAgICAgICAgc2l6ZV90IGJ1
ZnNpemUsIHUzMiBzaXplLCBpbnQgaW50ZXJydXB0KQ0KPiAgew0KPiAgICAgICAgIHN0cnVjdCBo
aWRfcmVwb3J0X2VudW0gKnJlcG9ydF9lbnVtID0gaGlkLT5yZXBvcnRfZW51bSArIHR5cGU7DQo+
ICAgICAgICAgc3RydWN0IGhpZF9yZXBvcnQgKnJlcG9ydDsNCj4gICAgICAgICBzdHJ1Y3QgaGlk
X2RyaXZlciAqaGRydjsNCj4gICAgICAgICBpbnQgbWF4X2J1ZmZlcl9zaXplID0gSElEX01BWF9C
VUZGRVJfU0laRTsNCj4gICAgICAgICB1MzIgcnNpemUsIGNzaXplID0gc2l6ZTsNCj4gKyAgICAg
ICBzaXplX3QgYnNpemUgPSBidWZzaXplOw0KPiAgICAgICAgIHU4ICpjZGF0YSA9IGRhdGE7DQo+
ICAgICAgICAgaW50IHJldCA9IDA7DQo+DQo+ICAgICAgICAgcmVwb3J0ID0gaGlkX2dldF9yZXBv
cnQocmVwb3J0X2VudW0sIGRhdGEpOw0KPiAgICAgICAgIGlmICghcmVwb3J0KQ0KPiAtICAgICAg
ICAgICAgICAgZ290byBvdXQ7DQo+ICsgICAgICAgICAgICAgICByZXR1cm4gMDsNCj4gKw0KPiAr
ICAgICAgIGlmICh1bmxpa2VseShic2l6ZSA8IGNzaXplKSkgew0KPiArICAgICAgICAgICAgICAg
aGlkX3dhcm5fcmF0ZWxpbWl0ZWQoaGlkLCAiRXZlbnQgZGF0YSBmb3IgcmVwb3J0ICVkIGlzIGlu
Y29ycmVjdCAoJWQgdnMgJWxkKVxuIiwNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHJlcG9ydC0+aWQsIGNzaXplLCBic2l6ZSk7DQoNClRoaXMgZmFpbHMgdG8gYnVpbGQg
b24gMzItYml0IHdpdGggdGhpcyBlcnJvcjoNCg0KSW4gZmlsZSBpbmNsdWRlZCBmcm9tIC4vaW5j
bHVkZS9saW51eC9kZXZpY2UuaDoxNSwNCiAgICAgICAgICAgICAgICAgZnJvbSAuL2luY2x1ZGUv
bGludXgvaW5wdXQuaDoxOSwNCiAgICAgICAgICAgICAgICAgZnJvbSBkcml2ZXJzL2hpZC9oaWQt
Y29yZS5jOjI1Og0KZHJpdmVycy9oaWQvaGlkLWNvcmUuYzogSW4gZnVuY3Rpb24g4oCYaGlkX3Jl
cG9ydF9yYXdfZXZlbnTigJk6DQpkcml2ZXJzL2hpZC9oaWQtY29yZS5jOjIwNTM6NDM6IGVycm9y
OiBmb3JtYXQg4oCYJWxk4oCZIGV4cGVjdHMgYXJndW1lbnQNCm9mIHR5cGUg4oCYbG9uZyBpbnTi
gJksIGJ1dCBhcmd1bWVudCA1IGhhcyB0eXBlIOKAmHNpemVfdOKAmSB7YWthIOKAmHVuc2lnbmVk
DQppbnTigJl9IFstV2Vycm9yPWZvcm1hdD1dDQogMjA1MyB8ICAgICAgICAgICAgICAgICBoaWRf
d2Fybl9yYXRlbGltaXRlZChoaWQsICJFdmVudCBkYXRhIGZvcg0KcmVwb3J0ICVkIGlzIGluY29y
cmVjdCAoJWQgdnMgJWxkKVxuIiwNCiAgICAgIHwNCl5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+DQoNClRoZSBwcm9wZXIgZm9ybWF0IHNwZWNpZmll
ciBmb3Igc2l6ZV90IGlzICIlenUiLg0KDQpCcmlhbiBHZXJzdA0KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0IC0t
IGdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKVG8gdW5zdWJzY3JpYmUgc2VuZCBhbiBlbWFp
bCB0byBncmV5YnVzLWRldi1sZWF2ZUBsaXN0cy5saW5hcm8ub3JnCg==
