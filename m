Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 4166D996C25
	for <lists+greybus-dev@lfdr.de>; Wed,  9 Oct 2024 15:34:52 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 27605449F9
	for <lists+greybus-dev@lfdr.de>; Wed,  9 Oct 2024 13:34:51 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	by lists.linaro.org (Postfix) with ESMTPS id 30DAD3F44E
	for <greybus-dev@lists.linaro.org>; Wed,  9 Oct 2024 13:34:47 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=U3neOl0y;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (lists.linaro.org: domain of rafael@kernel.org designates 147.75.193.91 as permitted sender) smtp.mailfrom=rafael@kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 11B88A43F47
	for <greybus-dev@lists.linaro.org>; Wed,  9 Oct 2024 13:34:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D413C4CED1
	for <greybus-dev@lists.linaro.org>; Wed,  9 Oct 2024 13:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728480886;
	bh=e0gqHlZkDT5WvXlJLxiiH51AUvpJH6OopoCW36UMFTI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=U3neOl0ybb4Ab65jgWhp3xT7HcEy4YMuUgGV+fe0qorbYgOtJiVf4vdBC8aSbF+zk
	 VaSzmlKJr1Td+ZlEfUnqPwPvP3ItSIxZE3mhiSqTU0Y+ILn1z2LAcj5l0mNd964u9E
	 IJiiL6vn/nZ84NJqFn6bT+eDEGpN/zUWDJjiTS1Nw44OfqVQU1G+/BklpTTM5qjnQt
	 qFWcWXBTn592t1uwoUFl7fAOhoRDLvjep0N3/TGk+zJy9Qodx9ZM9pOn4mlQ+m1tjB
	 +zz3ljVHlk8StJ6aovxl3cW8GcQDcp3o2MYDG6IpoR0lwS4CMa0F2Pi7cYkeI0mOAq
	 BM9t8zEhFY8Sg==
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-5e7aec9e168so3589806eaf.3
        for <greybus-dev@lists.linaro.org>; Wed, 09 Oct 2024 06:34:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWRnVHyPgToJ+9hugiHgq4T2qqBTPdFvq93TdtxENtw74J7sIBTnpuBkWLDy5ZaGj047kW2/9JXjaRhZg==@lists.linaro.org
X-Gm-Message-State: AOJu0Yz7HRwRECoGku8qFP0fKvus7EHZJcT0Y+oW9mLvuswIbaq3u/9+
	41olJ+EBBAoszGxsZK7PJ7JTiRSS6Cwf3yJpxF7oL1+btokqOfkzfe3l8h5shnBMKsMu0anE79z
	8iW8CprFQ1uljlUgwVfBwmU1FPnY=
X-Google-Smtp-Source: AGHT+IGPvjQmX3zbZk+/LQ5kxG4XslEJ8m7y5iETpKVOpmsBmOdZ4tET2kRXnqT/piSrFy5yYrBa2CfwSNatwWXgz3s=
X-Received: by 2002:a05:6820:270f:b0:5e5:c489:6f3c with SMTP id
 006d021491bc7-5e987bc9df9mr1249377eaf.5.1728480885551; Wed, 09 Oct 2024
 06:34:45 -0700 (PDT)
MIME-Version: 1.0
References: <20241004094101.113349-1-sakari.ailus@linux.intel.com>
 <CAPDyKFp0N6UJhnHS164Tdf=xkWB0jzq65L9TdvYazeBQ-6WjeQ@mail.gmail.com>
 <20241007184924.GH14766@pendragon.ideasonboard.com> <CAPDyKFpQVnF7eQv3dup8k-3EijnMjuveCG9sZ=Rpey1Y6MBJEg@mail.gmail.com>
 <20241007222502.GG30699@pendragon.ideasonboard.com> <CAPDyKFrGNwna6Y2pqSRaBbRYHKRaD2ayqQHLtoqLPOu9Et7qTg@mail.gmail.com>
 <CAJZ5v0jvJyS7D5-wURi2kyWN-rmNa+YqupeQJ000pQRVd9VBcQ@mail.gmail.com> <41a0ad69-912b-4eb3-84f7-fb385433c056@opensource.cirrus.com>
In-Reply-To: <41a0ad69-912b-4eb3-84f7-fb385433c056@opensource.cirrus.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 9 Oct 2024 15:34:33 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0gbrhMpPT0fHYSC+ES5WS5kv7XkM2hj9M4vpNwFFs6xsQ@mail.gmail.com>
Message-ID: <CAJZ5v0gbrhMpPT0fHYSC+ES5WS5kv7XkM2hj9M4vpNwFFs6xsQ@mail.gmail.com>
To: Richard Fitzgerald <rf@opensource.cirrus.com>, Sakari Ailus <sakari.ailus@linux.intel.com>
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 30DAD3F44E
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.50 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:147.75.193.91];
	MIME_GOOD(-0.10)[text/plain];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:54825, ipnet:147.75.192.0/21, country:US];
	TAGGED_RCPT(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[41];
	ARC_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[linaro.org,ideasonboard.com,lists.freedesktop.org,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org,opensource.cirrus.com,lists.linux.dev,lists.linaro.org,gmail.com,pengutronix.de];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+]
X-Rspamd-Action: no action
Message-ID-Hash: ZAWUIQO42RRNI74MAF6RN6BT2CNNUDNT
X-Message-ID-Hash: ZAWUIQO42RRNI74MAF6RN6BT2CNNUDNT
X-MailFrom: rafael@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Ulf Hansson <ulf.hansson@linaro.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org, linux-clk@vger.kernel.org, linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org, linux-gpio@vger.kernel.org, amd-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, linux-i3c@lists.infradead.org, linux-iio@vger.kernel.org, linux-input@vger.kernel.org, patches@opensource.cirrus.com, iommu@lists.linux.dev, imx@lists.linux.dev, linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org, linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-pci@vger.kernel.org, linux-phy@lists.infradead.org, linux-pwm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-sound@vger.kernel.org, linux-spi@vger.kernel.org, linux-sta
 ging@lists.linux.dev, linux-usb@vger.kernel.org, linux-serial@vger.kernel.org, greybus-dev@lists.linaro.org, asahi@lists.linux.dev, Andy Shevchenko <andy.shevchenko@gmail.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 00/51] treewide: Switch to __pm_runtime_put_autosuspend()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/ZAWUIQO42RRNI74MAF6RN6BT2CNNUDNT/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gV2VkLCBPY3QgOSwgMjAyNCBhdCAyOjQ44oCvUE0gUmljaGFyZCBGaXR6Z2VyYWxkDQo8cmZA
b3BlbnNvdXJjZS5jaXJydXMuY29tPiB3cm90ZToNCj4NCj4gT24gMDgvMTAvMjAyNCA3OjI0IHBt
LCBSYWZhZWwgSi4gV3lzb2NraSB3cm90ZToNCj4gPiBPbiBUdWUsIE9jdCA4LCAyMDI0IGF0IDEy
OjM14oCvQU0gVWxmIEhhbnNzb24gPHVsZi5oYW5zc29uQGxpbmFyby5vcmc+IHdyb3RlOg0KPiA+
Pg0KPiA+PiBPbiBUdWUsIDggT2N0IDIwMjQgYXQgMDA6MjUsIExhdXJlbnQgUGluY2hhcnQNCj4g
Pj4gPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4gd3JvdGU6DQo+ID4+Pg0KPiA+
Pj4gSGkgVWxmLA0KPiA+Pj4NCj4gPj4+IE9uIFR1ZSwgT2N0IDA4LCAyMDI0IGF0IDEyOjA4OjI0
QU0gKzAyMDAsIFVsZiBIYW5zc29uIHdyb3RlOg0KPiA+Pj4+IE9uIE1vbiwgNyBPY3QgMjAyNCBh
dCAyMDo0OSwgTGF1cmVudCBQaW5jaGFydCB3cm90ZToNCj4gPj4+Pj4gT24gRnJpLCBPY3QgMDQs
IDIwMjQgYXQgMDQ6Mzg6MzZQTSArMDIwMCwgVWxmIEhhbnNzb24gd3JvdGU6DQo+ID4+Pj4+PiBP
biBGcmksIDQgT2N0IDIwMjQgYXQgMTE6NDEsIFNha2FyaSBBaWx1cyB3cm90ZToNCj4gPj4+Pj4+
Pg0KPiA+Pj4+Pj4+IEhlbGxvIGV2ZXJ5b25lLA0KPiA+Pj4+Pj4+DQo+ID4+Pj4+Pj4gVGhpcyBz
ZXQgd2lsbCBzd2l0Y2ggdGhlIHVzZXJzIG9mIHBtX3J1bnRpbWVfcHV0X2F1dG9zdXNwZW5kKCkg
dG8NCj4gPj4+Pj4+PiBfX3BtX3J1bnRpbWVfcHV0X2F1dG9zdXNwZW5kKCkgd2hpbGUgdGhlIGZv
cm1lciB3aWxsIHNvb24gYmUgcmUtcHVycG9zZWQNCj4gPj4+Pj4+PiB0byBpbmNsdWRlIGEgY2Fs
bCB0byBwbV9ydW50aW1lX21hcmtfbGFzdF9idXN5KCkuIFRoZSB0d28gYXJlIGFsbW9zdA0KPiA+
Pj4+Pj4+IGFsd2F5cyB1c2VkIHRvZ2V0aGVyLCBhcGFydCBmcm9tIGJ1Z3Mgd2hpY2ggYXJlIGxp
a2VseSBjb21tb24uIEdvaW5nDQo+ID4+Pj4+Pj4gZm9yd2FyZCwgbW9zdCBuZXcgdXNlcnMgc2hv
dWxkIGJlIHVzaW5nIHBtX3J1bnRpbWVfcHV0X2F1dG9zdXNwZW5kKCkuDQo+ID4+Pj4+Pj4NCj4g
Pj4+Pj4+PiBPbmNlIHRoaXMgY29udmVyc2lvbiBpcyBkb25lIGFuZCBwbV9ydW50aW1lX3B1dF9h
dXRvc3VzcGVuZCgpIHJlLXB1cnBvc2VkLA0KPiA+Pj4+Pj4+IEknbGwgcG9zdCBhbm90aGVyIHNl
dCB0byBtZXJnZSB0aGUgY2FsbHMgdG8gX19wbV9ydW50aW1lX3B1dF9hdXRvc3VzcGVuZCgpDQo+
ID4+Pj4+Pj4gYW5kIHBtX3J1bnRpbWVfbWFya19sYXN0X2J1c3koKS4NCj4gPj4+Pj4+DQo+ID4+
Pj4+PiBUaGF0IHNvdW5kcyBsaWtlIGl0IGNvdWxkIGNhdXNlIGEgbG90IG9mIGNodXJucy4NCj4g
Pj4+Pj4+DQo+ID4+Pj4+PiBXaHkgbm90IGFkZCBhIG5ldyBoZWxwZXIgZnVuY3Rpb24gdGhhdCBk
b2VzIHRoZQ0KPiA+Pj4+Pj4gcG1fcnVudGltZV9wdXRfYXV0b3N1c3BlbmQoKSBhbmQgdGhlIHBt
X3J1bnRpbWVfbWFya19sYXN0X2J1c3koKQ0KPiA+Pj4+Pj4gdGhpbmdzPyBUaGVuIHdlIGNhbiBz
dGFydCBtb3ZpbmcgdXNlcnMgb3ZlciB0byB0aGlzIG5ldyBpbnRlcmZhY2UsDQo+ID4+Pj4+PiBy
YXRoZXIgdGhhbiBoYXZpbmcgdGhpcyBpbnRlcm1lZGlhdGUgc3RlcD8NCj4gPj4+Pj4NCj4gPj4+
Pj4gSSB0aGluayB0aGUgQVBJIHdvdWxkIGJlIG5pY2VyIGlmIHdlIHVzZWQgdGhlIHNob3J0ZXN0
IGFuZCBzaW1wbGVzdA0KPiA+Pj4+PiBmdW5jdGlvbiBuYW1lcyBmb3IgdGhlIG1vc3QgY29tbW9u
IHVzZSBjYXNlcy4gRm9sbG93aW5nDQo+ID4+Pj4+IHBtX3J1bnRpbWVfcHV0X2F1dG9zdXNwZW5k
KCkgd2l0aCBwbV9ydW50aW1lX21hcmtfbGFzdF9idXN5KCkgaXMgdGhhdA0KPiA+Pj4+PiBtb3N0
IGNvbW1vbiB1c2UgY2FzZS4gVGhhdCdzIHdoeSBJIGxpa2UgU2FrYXJpJ3MgYXBwcm9hY2ggb2Yg
cmVwdXJwb3NpbmcNCj4gPj4+Pj4gcG1fcnVudGltZV9wdXRfYXV0b3N1c3BlbmQoKSwgYW5kIGlu
dHJvZHVjaW5nDQo+ID4+Pj4+IF9fcG1fcnVudGltZV9wdXRfYXV0b3N1c3BlbmQoKSBmb3IgdGhl
IG9kZCBjYXNlcyB3aGVyZQ0KPiA+Pj4+PiBwbV9ydW50aW1lX21hcmtfbGFzdF9idXN5KCkgc2hv
dWxkbid0IGJlIGNhbGxlZC4NCj4gPj4+Pg0KPiA+Pj4+IE9rYXksIHNvIHRoZSByZWFzb24gZm9y
IHRoaXMgYXBwcm9hY2ggaXMgYmVjYXVzZSB3ZSBjb3VsZG4ndCBmaW5kIGENCj4gPj4+PiBzaG9y
dCBhbmQgZGVzY3JpcHRpdmUgbmFtZSB0aGF0IGNvdWxkIGJlIHVzZWQgaW4gZmF2b3Igb2YNCj4g
Pj4+PiBwbV9ydW50aW1lX3B1dF9hdXRvc3VzcGVuZCgpLiBMZXQgbWUgdGhyb3cgc29tZSBpZGVh
cyBhdCBpdCBhbmQgbWF5YmUNCj4gPj4+PiB5b3UgbGlrZSBpdCAtIG9yIG5vdC4gOi0pDQo+ID4+
Pg0KPiA+Pj4gSSBsaWtlIHRoZSBpZGVhIGF0IGxlYXN0IDotKQ0KPiA+Pj4NCj4gPj4+PiBJIGRv
bid0IGtub3cgd2hhdCBvcHRpb25zIHlvdSBndXlzIGRpc2N1c3NlZCwgYnV0IHRvIG1lIHRoZSBl
bnRpcmUNCj4gPj4+PiAiYXV0b3N1c3BlbmQiLXN1ZmZpeCBpc24ndCByZWFsbHkgdGhhdCBuZWNl
c3NhcnkgaW4gbXkgb3Bpbmlvbi4gVGhlcmUNCj4gPj4+PiBhcmUgbW9yZSB3YXlzIHRoYW4gY2Fs
bGluZyBwbV9ydW50aW1lX3B1dF9hdXRvc3VzcGVuZCgpIHRoYXQgdHJpZ2dlcnMNCj4gPj4+PiB1
cyB0byB1c2UgdGhlIFJQTV9BVVRPIGZsYWcgZm9yIHJwbV9zdXNwZW5kKCkuIEZvciBleGFtcGxl
LCBqdXN0DQo+ID4+Pj4gY2FsbGluZyBwbV9ydW50aW1lX3B1dCgpIGhhcyB0aGUgc2ltaWxhciBl
ZmZlY3QuDQo+ID4+Pg0KPiA+Pj4gVG8gYmUgaG9uZXN0LCBJJ20gbG9zdCB0aGVyZS4gcG1fcnVu
dGltZV9wdXQoKSBjYWxscw0KPiA+Pj4gX19wbV9ydW50aW1lX2lkbGUoUlBNX0dFVF9QVVQgfCBS
UE1fQVNZTkMpLCB3aGlsZQ0KPiA+Pj4gcG1fcnVudGltZV9wdXRfYXV0b3N1c3BlbmQoKSBjYWxs
cyBfX3BtX3J1bnRpbWVfc3VzcGVuZChSUE1fR0VUX1BVVCB8DQo+ID4+PiBSUE1fQVNZTkMgfCBS
UE1fQVVUTykuDQo+ID4+DQo+ID4+IF9fcG1fcnVudGltZV9pZGxlKCkgZW5kcyB1cCBjYWxsaW5n
IHJwbV9pZGxlKCksIHdoaWNoIG1heSBjYWxsDQo+ID4+IHJwbV9zdXNwZW5kKCkgLSBpZiBpdCBz
dWNjZWVkcyB0byBpZGxlIHRoZSBkZXZpY2UuIEluIHRoYXQgY2FzZSwgaXQNCj4gPj4gdGFncyBv
biB0aGUgUlBNX0FVVE8gZmxhZyBpbiB0aGUgY2FsbCB0byBycG1fc3VzcGVuZCgpLiBRdWl0ZSBz
aW1pbGFyDQo+ID4+IHRvIHdoYXQgaXMgaGFwcGVuaW5nIHdoZW4gY2FsbGluZyBwbV9ydW50aW1l
X3B1dF9hdXRvc3VzcGVuZCgpLg0KPiA+DQo+ID4gUmlnaHQuDQo+ID4NCj4gPiBGb3IgYWxtb3N0
IGV2ZXJ5Ym9keSwgZXhjZXB0IGZvciBhIHNtYWxsIGJ1bmNoIG9mIGRyaXZlcnMgdGhhdA0KPiA+
IGFjdHVhbGx5IGhhdmUgYSAucnVudGltZV9pZGxlKCkgY2FsbGJhY2ssIHBtX3J1bnRpbWVfcHV0
KCkgaXMNCj4gPiBsaXRlcmFsbHkgZXF1aXZhbGVudCB0byBwbV9ydW50aW1lX3B1dF9hdXRvc3Vz
cGVuZCgpLg0KPiA+DQo+ID4gU28gcmVhbGx5IHRoZSBxdWVzdGlvbiBpcyB3aHkgYW55b25lIHdo
byBkb2Vzbid0IHByb3ZpZGUgYQ0KPiA+IC5ydW50aW1lX2lkbGUoKSBjYWxsYmFjayBib3RoZXJz
IHdpdGggdXNpbmcgdGhpcyBzcGVjaWFsDQo+ID4gcG1fcnVudGltZV9wdXRfYXV0b3N1c3BlbmQo
KSB0aGluZywNCj4NCj4gQmVjYXVzZSB0aGV5IGFyZSBmb2xsb3dpbmcgdGhlIGRvY3VtZW50YXRp
b24/IEl0IHNheXM6DQo+DQo+ICJEcml2ZXJzIHNob3VsZCBjYWxsIHBtX3J1bnRpbWVfbWFya19s
YXN0X2J1c3koKSB0byB1cGRhdGUgdGhpcyBmaWVsZA0KPiBhZnRlciBjYXJyeWluZyBvdXQgSS9P
LCB0eXBpY2FsbHkganVzdCBiZWZvcmUgY2FsbGluZw0KPiBwbV9ydW50aW1lX3B1dF9hdXRvc3Vz
cGVuZCgpLiINCj4NCj4gYW5kDQo+DQo+ICJJbiBvcmRlciB0byB1c2UgYXV0b3N1c3BlbmQsIHN1
YnN5c3RlbXMgb3IgZHJpdmVycyBtdXN0IGNhbGwNCj4gcG1fcnVudGltZV91c2VfYXV0b3N1c3Bl
bmQoKSAoLi4uKSwgYW5kIHRoZXJlYWZ0ZXIgdGhleSBzaG91bGQgdXNlIHRoZQ0KPiB2YXJpb3Vz
IGAqX2F1dG9zdXNwZW5kKClgIGhlbHBlciBmdW5jdGlvbnMgaW5zdGVhZCBvZiB0aGUgbm9uIw0K
PiBhdXRvc3VzcGVuZCBjb3VudGVycGFydHMiDQo+DQo+IFNvIHRoZSBkb2N1bWVudGF0aW9uIHNh
eXMgSSBzaG91bGQgYmUgdXNpbmcgcG1fcnVudGltZV9wdXRfYXV0b3N1c3BlbmQoKQ0KPiBpbnN0
ZWFkIG9mIHBtX3J1bnRpbWVfcHV0KCkuDQo+DQo+IFNlZW1zIHVuZmFpciB0byBjcml0aWNpc2Ug
cGVvcGxlIGZvciBmb2xsb3dpbmcgdGhlIGRvY3VtZW50YXRpb24uDQoNCkknbSBub3QgY3JpdGlj
aXNpbmcgYW55b25lLCBqdXN0IHdvbmRlcmluZyB3aHkgdGhleSBkbyB3aGF0IHRoZXkgZG8uDQoN
CiJCZWNhdXNlIGl0IGlzIGRvY3VtZW50ZWQgdGhpcyB3YXkiIGlzIGEgZmFpciBhbnN3ZXIsIGJ1
dCBpdCBkb2Vzbid0DQppbnZhbGlkYXRlIHRoZSBvYnNlcnZhdGlvbiB0aGF0IHRoZSBkaWZmZXJl
bmNlIGJldHdlZW4NCnBtX3J1bnRpbWVfcHV0X2F1dG9zdXNwZW5kKCkgYW5kIHBtX3J1bnRpbWVf
cHV0KCkgYm9pbHMgZG93biB0byB0aGUNCmNhc2VzIHdoZW4gdGhlIC5ydW50aW1lX2lkbGUoKSBj
YWxsYmFjayBpcyBwcmVzZW50ICh3aGljaCBhcmUgZmV3IGFuZA0KZmFyIGJldHdlZW4gc28gdG8g
c3BlYWspLiAgTW9yZW92ZXIsIHRoZXJlIGFyZSBjYWxsIHNpdGVzIHVzaW5nDQpwbV9ydW50aW1l
XyooKSBmdW5jdGlvbnMgZXZlbiB0aG91Z2ggdGhleSBtYXkgbm90IGtub3cgd2hldGhlciBvciBu
b3QNCmF1dG9zdXNwZW5kIGlzIGVuYWJsZWQgZm9yIHRoZSB0YXJnZXQgZGV2aWNlcywgc28gdGhl
IGFkdmljZSBnaXZlbiBpbg0KdGhlIGRvY3VtZW50YXRpb24gY2Fubm90IGJlIHVuaXZlcnNhbGx5
IGZvbGxvd2VkIHJlZ2FyZGxlc3MuDQoNClRoaXMgdGhyZWFkIGlzIGFib3V0IHRoZSB3YXkgdG8g
Z28sIGdlbmVyYWxseSBzcGVha2luZywgYW5kIHdoYXQgSSdtDQpzYXlpbmcgaXMgZWZmZWN0aXZl
bHkgdGhhdCByZXBsYWNpbmcgcG1fcnVudGltZV9wdXRfYXV0b3N1c3BlbmQoKSB3aXRoDQpwbV9y
dW50aW1lX3B1dCgpIGFsbW9zdCBldmVyeXdoZXJlIChpZiBub3QganVzdCBldmVyeXdoZXJlKSB3
b3VsZCBiZQ0KZmluZSB3aXRoIG1lLg0KDQpJIGFsc28gdGhpbmsgdGhhdCB0aGUgY3VycmVudCB1
c2VycyBvZiBwbV9ydW50aW1lX3B1dF9hdXRvc3VzcGVuZCgpDQp0aGF0IGlzIG5vdCBpbW1lZGlh
dGVseSBwcmVjZWRlZCBieSBwbV9ydW50aW1lX21hcmtfbGFzdF9idXN5KCkgY2FuIGJlDQpyZWFk
aWx5IHN3aXRjaGVkIG92ZXIgdG8gdXNpbmcgcG1fcnVudGltZV9wdXQoKSBpbnN0ZWFkIG9mIGl0
IGFuZCB0aGVuDQpwbV9ydW50aW1lX3B1dF9hdXRvc3VzcGVuZCgpIGNhbiBiZSBtYWRlIGNhbGwN
CnBtX3J1bnRpbWVfbWFya19sYXN0X2J1c3koKSwgc28gdGhlIGxhdHRlciBjYW4gYmUgcmVtb3Zl
ZCBmcm9tIHRoZQ0KY29kZSB1c2luZyB0aGUgZm9ybWVyLiAgTm90ZSB0aGF0IHRoaXMgbGFzdCBz
dGVwIGRvZXMgbm90IHJlcXVpcmUNCnRyZWUtd2lkZSBjaGFuZ2VzLCBiZWNhdXNlIGNhbGxpbmcg
cG1fcnVudGltZV9tYXJrX2xhc3RfYnVzeSgpIHR3aWNlDQppbiBhIHJvdyBmb3IgdGhlIHNhbWUg
ZGV2aWNlIGlzIG5vdCBhIHByb2JsZW0uDQoNCk9mIGNvdXJzZSwgdGhlIGRvY3VtZW50YXRpb24g
bmVlZHMgdG8gYmUgdXBkYXRlZCBpbiBhY2NvcmRhbmNlIHdpdGgNCnRoZSBjb2RlIGNoYW5nZXMs
IHdoaWNoIGRpZG4ndCBoYXBwZW4gd2hlbiBwcmV2aW91cyBjaGFuZ2VzIHdlcmUgbWFkZQ0KdG8g
cG1fcnVudGltZV9wdXQoKSBhbmQgdGhhdCBsaWtlbHkgaXMgd2h5IGl0IGRvZXMgbm90IHJlZmxl
Y3QgdGhlDQpjdXJyZW50IGNvZGUuDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpncmV5YnVzLWRldiBtYWlsaW5nIGxpc3QgLS0gZ3JleWJ1cy1kZXZAbGlz
dHMubGluYXJvLm9yZwpUbyB1bnN1YnNjcmliZSBzZW5kIGFuIGVtYWlsIHRvIGdyZXlidXMtZGV2
LWxlYXZlQGxpc3RzLmxpbmFyby5vcmcK
