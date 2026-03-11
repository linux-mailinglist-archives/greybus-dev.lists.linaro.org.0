Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CHPxC3otsWkVrwIAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Wed, 11 Mar 2026 09:53:14 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CEEF25FC45
	for <lists+greybus-dev@lfdr.de>; Wed, 11 Mar 2026 09:53:13 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 772953F8EF
	for <lists+greybus-dev@lfdr.de>; Wed, 11 Mar 2026 08:53:12 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	by lists.linaro.org (Postfix) with ESMTPS id A30AE40149
	for <greybus-dev@lists.linaro.org>; Wed, 11 Mar 2026 02:18:17 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b="lT/OxryQ";
	spf=pass (lists.linaro.org: domain of sanjayembeddedse@gmail.com designates 209.85.214.180 as permitted sender) smtp.mailfrom=sanjayembeddedse@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2ae50a33ff8so72053085ad.3
        for <greybus-dev@lists.linaro.org>; Tue, 10 Mar 2026 19:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773195497; x=1773800297; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1ZAqF770CjctREhKahUCDqzMAEkw+GXfuiDNjYlwSLk=;
        b=lT/OxryQ3T+6KSsINsGZEynOc6KtOwz4dFW3P6qSBklKUILOC4RPZFdzQswEcl7+xf
         JSVq0xrLQAjMLVlea5XapyCVv40K1FwlteY9BgHxVR3naWCWScgBWQXe+PXFGB4ipozZ
         4pRlQoVH0rHhXc/T8L8ypWXT/7quchBEEo69Jk6R3WAr9qNvTbpB9P3rI735LJRssiqp
         DsyCUPOpo7TIT/ccAmT2kR3rZqE4TJaQXejBdFiBD+wqD2VsexjptjCjxz4BaCR/UXli
         7ZheBxlyuSSil7gyggtrnVAGefHu9ISdB6gCIZUc9ApkWRLQe2FM3hhxHOC7yxo8wXIi
         /mhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773195497; x=1773800297;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1ZAqF770CjctREhKahUCDqzMAEkw+GXfuiDNjYlwSLk=;
        b=X3Bm7y1HeX2RRRAzJ12bomjuZoK90CcrIjW3fLuvWEEUDyAPsPlS03UEv0rlE75NE7
         n/3LgDrcXH9mVhIqxa62SFON3T8opgRpZ9YLl6LlfiglRdOiJOkOsmlda+veOESwyDEp
         ER6vmR2VHVRYhA8+/QwSsPOfbJHOf1MeN3jK0r3i4KV2UD1ngoPhN/Qra+aJ+7Pi3S6y
         cBZAAxQDCSuAasg1pTF7+zyoimTe92Wj3jAukDK3yptPM8CSXZEPGTDR9LhZ5nGCEmH2
         +P3DNrm8Q1A3vUFhvRj+1b7fDJgWCyZ5F6SDx9KW2N6UBEdWd9xG1HNoImCRCoH+n/WD
         IrhA==
X-Forwarded-Encrypted: i=1; AJvYcCXLnDc19pz6ZK6ASccqm1Cl2rk6Ei2ntL2neC7IRUsQ9wU3K3Uyr61RTix8w8trRR2bBU3bW/u7pKq7mQ==@lists.linaro.org
X-Gm-Message-State: AOJu0YxtbgaO38jS8xUEftyGuvbftTV41NpJPqZ4sAFBb1ygoW8XuCmo
	6BlDSexlyTR6jY2Y7t7IpjGG6TSXy2DPEWtcQJUni2c8rTLNPR0krk4J
X-Gm-Gg: ATEYQzz+uHE7XEc+iNYRf5PgLkX6/TeLg81Bqd4QQlpZpR+V8S2cC7CLp3PMVdrYBQi
	NBsY1wuepAGLcH7YZFq1OFvI7F8V6Z5me2z7v7G/LFe38+WccSt+UBiYHa86/mTgL5MUBlcnT7Q
	QwFV45UFkcQOtI27GmxK1ihF6m4MCmAA9Q9wtSvQzVf7i25J9N7d5GgAw1XTqIuumE0bzR8G5d/
	NSzt++Aivfl4LGY0xefrphp0uEqrb3gz34qBQtRefO/r+RtEpezcKaYLrronG8Kkg5ideXmgBPj
	HmLlzJTOojAtgTKY56ccsdWuU6zw65e4MDXeQB/+s9mPKj1qSBb25oZuN6jyNqMtHCi0QQnDHI8
	4mUOijNa+viWHyGFaO2IqIp31CrQVpqUqNwsPBjIHNUO5g+/N9foQqEFZ8fqA/dcCCWraMg7fs5
	9f+tINwb+5ZyJxD1W0kFL6wMbn+FhoamZUhPw=
X-Received: by 2002:a17:903:1666:b0:2a9:47ff:101c with SMTP id d9443c01a7336-2aeae8eb7dcmr9366255ad.46.1773195496591;
        Tue, 10 Mar 2026 19:18:16 -0700 (PDT)
Received: from ehlo.thunderbird.net ([2401:4900:aab1:729a::4bc6:faff])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aeae34e009sm5679355ad.46.2026.03.10.19.18.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 19:18:16 -0700 (PDT)
Date: Wed, 11 Mar 2026 07:27:18 +0530
From: Sanjay Chitroda <sanjayembeddedse@gmail.com>
To: David Lechner <dlechner@baylibre.com>, jic23@kernel.org,
 m.tretter@pengutronix.de, mchehab@kernel.org, p.zabel@pengutronix.de,
 tiffany.lin@mediatek.com, andrew-ct.chen@mediatek.com,
 yunfei.dong@mediatek.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, johan@kernel.org, elder@kernel.org,
 gregkh@linuxfoundation.org, pure.logic@nexus-software.ie
User-Agent: Thunderbird for Android
In-Reply-To: <79bfac24-dcb4-4fb9-90d8-3ef2393f51e3@baylibre.com>
References: <20260310200513.2162018-1-sanjayembedded@gmail.com> <79bfac24-dcb4-4fb9-90d8-3ef2393f51e3@baylibre.com>
Message-ID: <7F16ED38-6BC1-4D31-B5B6-6C1E45D24C25@gmail.com>
MIME-Version: 1.0
X-Spamd-Bar: ----
X-MailFrom: sanjayembeddedse@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: 5YSKL24QZIPAHQG4Z7NOFLFILUMOOCS7
X-Message-ID-Hash: 5YSKL24QZIPAHQG4Z7NOFLFILUMOOCS7
X-Mailman-Approved-At: Wed, 11 Mar 2026 08:53:10 +0000
CC: nuno.sa@analog.com, andy@kernel.org, kernel@pengutronix.de, kees@kernel.org, nabijaczleweli@nabijaczleweli.xyz, marcelo.schmitt1@gmail.com, maudspierings@gocontroll.com, hverkuil+cisco@kernel.org, ribalda@chromium.org, straube.linux@gmail.com, dan.carpenter@linaro.org, lukagejak5@gmail.com, ethantidmore06@gmail.com, samasth.norway.ananda@oracle.com, karanja99erick@gmail.com, s9430939@naver.com, tglx@kernel.org, mingo@kernel.org, sun.jian.kdev@gmail.com, weibu@redadmin.org, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, skhan@linuxfoundation.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 0/7] drivers: Simplify cleanup paths using __free
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/5YSKL24QZIPAHQG4Z7NOFLFILUMOOCS7/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Rspamd-Queue-Id: 9CEEF25FC45
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.20 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+mx];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[baylibre.com,kernel.org,pengutronix.de,mediatek.com,gmail.com,collabora.com,linuxfoundation.org,nexus-software.ie];
	RCPT_COUNT_TWELVE(0.00)[42];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	FREEMAIL_CC(0.00)[analog.com,kernel.org,pengutronix.de,nabijaczleweli.xyz,gmail.com,gocontroll.com,chromium.org,linaro.org,oracle.com,naver.com,redadmin.org,vger.kernel.org,lists.infradead.org,lists.linaro.org,lists.linux.dev,linuxfoundation.org];
	DKIM_TRACE(0.00)[gmail.com:-];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sanjayembeddedse@gmail.com,greybus-dev-bounces@lists.linaro.org];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev,cisco];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_SPAM(0.00)[0.808];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,baylibre.com:email]
X-Rspamd-Action: no action

DQoNCk9uIDExIE1hcmNoIDIwMjYgMzoyMjoyOOKAr2FtIElTVCwgRGF2aWQgTGVjaG5lciA8ZGxl
Y2huZXJAYmF5bGlicmUuY29tPiB3cm90ZToNCj5PbiAzLzEwLzI2IDM6MDUgUE0sIFNhbmpheSBD
aGl0cm9kYSB3cm90ZToNCj4+IEZyb206IFNhbmpheSBDaGl0cm9kYSA8c2FuamF5ZW1iZWRkZWRz
ZUBnbWFpbC5jb20+DQo+PiANCj4+IEhpIGFsbCwNCj4+IA0KPj4gVGhpcyBwYXRjaCBzZXJpZXMg
cmVwbGFjZXMgbWFudWFsIGNsZWFudXAgYW5kIGV4cGxpY2l0IGtmcmVlKCkgY2FsbHMgd2l0aA0K
Pj4gdGhlIF9fZnJlZSBhdHRyaWJ1dGUgZnJvbSA8bGludXgvY2xlYW51cC5oPi4gVGhpcyBtb2Rl
cm5pemVzIHRoZSBtZW1vcnkNCj4+IG1hbmFnZW1lbnQgc3R5bGUgYW5kIHNpbXBsaWZpZXMgY29t
bW9uIGVycm9yIHBhdGhzIHdpdGhvdXQgYWx0ZXJpbmcgYW55DQo+PiBmdW5jdGlvbmFsIGJlaGF2
aW9yLg0KPj4gDQo+PiBUaGUgX19mcmVlIGF0dHJpYnV0ZSBwcm92aWRlcyBhdXRvbWF0aWMgc2Nv
cGUtYmFzZWQgY2xlYW51cCwgbWFraW5nDQo+PiByZXNvdXJjZSBtYW5hZ2VtZW50IGNsZWFyZXIg
YW5kIHJlZHVjaW5nIHRoZSBjaGFuY2VzIG9mIG1pc3NpbmcgY2xlYW51cA0KPj4gb24gZWFybHkg
cmV0dXJucy4NCj4+IA0KPj4gTm8gZnVuY3Rpb25hbCBjaGFuZ2VzIGFyZSBpbnRlbmRlZCBpbiB0
aGlzIHNlcmllcy4NCj4+IA0KPj4gVGVzdGluZzoNCj4+ICAgLSBDb21waWxlZCB3aXRoIFc9MQ0K
Pj4gICAtIEJ1aWxkLXRlc3RlZCBvbiBpODZfNjQNCj4+IA0KPj4gQmFzZWQgb246DQo+PiAgIDxs
aW51eC12Ny4wLXJjMj4NCj4+IA0KPj4gRmVlbCBmcmVlIHRvIHNoYXJlIHlvdXIgdmFsdWFibGUg
aW5wdXQgaW4gY29udGV4dCBvZiB0aGUgY2xlYW51cCBBUEkuDQo+PiANCj4+IFRoYW5rcywNCj4+
IFNhbmpheSBDaGl0cm9kYQ0KPj4gDQo+PiBTYW5qYXkgQ2hpdHJvZGEgKDcpOg0KPj4gICBzdGFn
aW5nOiBncmV5YnVzOiBzaW1wbGlmeSBjbGVhbnVwIHVzaW5nIF9fZnJlZQ0KPj4gICBpaW86IHNz
cF9zZW5zb3JzOiBzaW1wbGlmeSBjbGVhbnVwIHVzaW5nIF9fZnJlZQ0KPj4gICBpaW86IHN0X3Nl
bnNvcnM6IHNpbXBsaWZ5IGNsZWFudXAgdXNpbmcgX19mcmVlDQo+PiAgIG1lZGlhOiBtZWRpYXRl
azogdmNvZGVjOiBzaW1wbGlmeSBjbGVhbnVwIHVzaW5nIF9fZnJlZQ0KPj4gICBtZWRpYTogY2hp
cHMtbWVkaWE6IGNvZGE6IHNpbXBsaWZ5IGNsZWFudXAgdXNpbmcgX19mcmVlDQo+PiAgIG1lZGlh
OiBhbGxlZ3JvOiBzaW1wbGlmeSBjbGVhbnVwIHVzaW5nIF9fZnJlZQ0KPj4gICBzdGFnaW5nOiBy
dGw4NzIzYnM6IHNpbXBsaWZ5IGNsZWFudXAgdXNpbmcgX19mcmVlDQo+DQo+VGhlcmUgaXMgbm8g
cmVhc29uIHRvIHB1dCBwYXRjaGVzIGZyb20gZGlmZmVyZW50IHN1YnN5c3RlbXMNCj5pbiB0aGUg
c2FtZSBzZXJpZXMgd2hlbiB0aGVyZSBpcyBubyBkZXBlbmRlbmN5IGJldHdlZW4gdGhlbS4NCj5J
dCBqdXN0IG1ha2UgZm9yIG1vcmUgbm9pc2UgZm9yIGV2ZXJ5b25lLg0KPg0KDQpUaGFua3MgZm9y
IHRoZSBmZWVkYmFjay4gSSB3aWxsIHNwbGl0IHVucmVsYXRlZCBwYXRjaGVzIGludG8NCnNlcGFy
YXRlIHNlcmllcyBwZXIgc3Vic3lzdGVtIG9yIGluZGl2aWR1YWwgaW4gZnV0dXJlIHN1Ym1pc3Np
b25zLg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZ3Jl
eWJ1cy1kZXYgbWFpbGluZyBsaXN0IC0tIGdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKVG8g
dW5zdWJzY3JpYmUgc2VuZCBhbiBlbWFpbCB0byBncmV5YnVzLWRldi1sZWF2ZUBsaXN0cy5saW5h
cm8ub3JnCg==
