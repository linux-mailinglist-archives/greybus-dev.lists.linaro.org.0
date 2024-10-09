Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id B465F99673F
	for <lists+greybus-dev@lfdr.de>; Wed,  9 Oct 2024 12:28:30 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id B9F6E4009F
	for <lists+greybus-dev@lfdr.de>; Wed,  9 Oct 2024 10:28:28 +0000 (UTC)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	by lists.linaro.org (Postfix) with ESMTPS id 96C093F44E
	for <greybus-dev@lists.linaro.org>; Wed,  9 Oct 2024 10:28:22 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linaro.org header.s=google header.b=o84dK3zn;
	dmarc=pass (policy=none) header.from=linaro.org;
	spf=pass (lists.linaro.org: domain of ulf.hansson@linaro.org designates 209.85.219.180 as permitted sender) smtp.mailfrom=ulf.hansson@linaro.org
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e28fc33fd8eso764311276.1
        for <greybus-dev@lists.linaro.org>; Wed, 09 Oct 2024 03:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728469702; x=1729074502; darn=lists.linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/fIjIpUdHAzWUFceihGJMz4qHHzjyT7pvRboVHLIXt8=;
        b=o84dK3zncAeAmcVlvGu/yOgFsfmI1UI2kldJpmhjOct1E8uk1lWFd8GeKEx66EDUOI
         5BUz09BZ5UvTM19zBkbfaBKFkN/GClumLU10PY2W2YWL4zuY8pcAwhcpIP563bC/TOeY
         IDT7NnLPj4e31WUXzZq/nu+fnizxbBru0d6LXujwPlQ77bCbBct3jErXQMaiUGLXka3b
         ZGk+0KG6sHrLFiiFtbzFvJaM+J24KQ23t/mhvDnY+rcNxskvgTNrOpVqYK+fmwbDCyWz
         bJD90nLJC5frbKxGed/i/WWeyPJkT6snopbvHz7AfhLwL35TlZeaawb/gpnnPY+7gwln
         kUHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728469702; x=1729074502;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/fIjIpUdHAzWUFceihGJMz4qHHzjyT7pvRboVHLIXt8=;
        b=FSKx0qzOz/UOzR2W8ALjpxjRiosKMkjJY9dirXPH0fEwuw1jlQ5d0edL4v3ycTtCqj
         EbL8AV001/PHuC02hz9gvtGxGF7ayhJFR0evYr0lhJLhpKyYQU4YXVUVfvHwOgpFJHaS
         pRxJpD6n1QkXE36ih2xxNiorH6XHpTvpIzufUj7g8swXU80oQsQdYUfJLUSpkK6L+7IV
         2XjMEHx4z0FgyOXlXrKYhMFgTVN3zjP8BpJlmEBYi9zwKoRhox7wL7Qh6SDgPrvSIP1r
         Q9dgyV71NwbDZPEwd4a1cD/9EfahBfneZSF8KEs126JwfTsZfDZDKRd8O5xrBKJaGwEf
         LuHw==
X-Forwarded-Encrypted: i=1; AJvYcCWpMNcjW3eDmg2D0s/DXSOpphGHmOz3awSnIZJhm2m4CZCeU1GJfFN99qfIpXbaaAGvVj4NvA04JoUp1w==@lists.linaro.org
X-Gm-Message-State: AOJu0Yxsq8nCzNNXtQkBwkKTwR7aWuOhU+r1J0bSvEYKbfCZCEfq4/Sy
	kLDcDzg2UgH9naKb9JJ+CqBJQABbxcyUy9UOtQBDoG9DaDP74bTTWyKWSdJJXJlCgIuQRdj/qlm
	a9Tf+Ec8+KjrXeRUo78GO0R2lMsu85wd505b85b+G
X-Google-Smtp-Source: AGHT+IHNaU3Z3+DDKTWwqyhccdWy6KGvX0jRFFJtFda2WTvGLlJcpHA53hhWZp12VBznxD4kUpVSZMoh/Lgesk7avnk=
X-Received: by 2002:a25:eb02:0:b0:e25:96a4:1706 with SMTP id
 3f1490d57ef6-e28fe43f3d1mr1744852276.19.1728469701975; Wed, 09 Oct 2024
 03:28:21 -0700 (PDT)
MIME-Version: 1.0
References: <20241004094101.113349-1-sakari.ailus@linux.intel.com>
 <CAPDyKFp0N6UJhnHS164Tdf=xkWB0jzq65L9TdvYazeBQ-6WjeQ@mail.gmail.com>
 <20241007184924.GH14766@pendragon.ideasonboard.com> <CAPDyKFpQVnF7eQv3dup8k-3EijnMjuveCG9sZ=Rpey1Y6MBJEg@mail.gmail.com>
 <20241007222502.GG30699@pendragon.ideasonboard.com> <CAPDyKFrGNwna6Y2pqSRaBbRYHKRaD2ayqQHLtoqLPOu9Et7qTg@mail.gmail.com>
 <CAJZ5v0jvJyS7D5-wURi2kyWN-rmNa+YqupeQJ000pQRVd9VBcQ@mail.gmail.com>
In-Reply-To: <CAJZ5v0jvJyS7D5-wURi2kyWN-rmNa+YqupeQJ000pQRVd9VBcQ@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 9 Oct 2024 12:27:45 +0200
Message-ID: <CAPDyKFqh_BS=6eN4tQzZ20sWCHL3kdnrY=1Mgd7B9gfBamm8bw@mail.gmail.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 96C093F44E
X-Spamd-Bar: ------
X-Spamd-Result: default: False [-6.50 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCVD_COUNT_ONE(0.00)[1];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[39];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.219.180:from];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[ideasonboard.com,linux.intel.com,lists.freedesktop.org,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org,opensource.cirrus.com,lists.linux.dev,lists.linaro.org,gmail.com];
	TAGGED_RCPT(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+]
X-Rspamd-Action: no action
Message-ID-Hash: EY4QOTU74U6ABI7YOFUJHOIBNRCPECIN
X-Message-ID-Hash: EY4QOTU74U6ABI7YOFUJHOIBNRCPECIN
X-MailFrom: ulf.hansson@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org, linux-clk@vger.kernel.org, linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org, linux-gpio@vger.kernel.org, amd-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, linux-i3c@lists.infradead.org, linux-iio@vger.kernel.org, linux-input@vger.kernel.org, patches@opensource.cirrus.com, iommu@lists.linux.dev, imx@lists.linux.dev, linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org, linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-pci@vger.kernel.org, linux-phy@lists.infradead.org, linux-pwm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-sound@vger.kernel.org, linux-spi@vger.kernel.org, li
 nux-staging@lists.linux.dev, linux-usb@vger.kernel.org, linux-serial@vger.kernel.org, greybus-dev@lists.linaro.org, asahi@lists.linux.dev, Andy Shevchenko <andy.shevchenko@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 00/51] treewide: Switch to __pm_runtime_put_autosuspend()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/EY4QOTU74U6ABI7YOFUJHOIBNRCPECIN/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gVHVlLCA4IE9jdCAyMDI0IGF0IDIwOjI1LCBSYWZhZWwgSi4gV3lzb2NraSA8cmFmYWVsQGtl
cm5lbC5vcmc+IHdyb3RlOg0KPg0KPiBPbiBUdWUsIE9jdCA4LCAyMDI0IGF0IDEyOjM14oCvQU0g
VWxmIEhhbnNzb24gPHVsZi5oYW5zc29uQGxpbmFyby5vcmc+IHdyb3RlOg0KPiA+DQo+ID4gT24g
VHVlLCA4IE9jdCAyMDI0IGF0IDAwOjI1LCBMYXVyZW50IFBpbmNoYXJ0DQo+ID4gPGxhdXJlbnQu
cGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4gd3JvdGU6DQo+ID4gPg0KPiA+ID4gSGkgVWxmLA0K
PiA+ID4NCj4gPiA+IE9uIFR1ZSwgT2N0IDA4LCAyMDI0IGF0IDEyOjA4OjI0QU0gKzAyMDAsIFVs
ZiBIYW5zc29uIHdyb3RlOg0KPiA+ID4gPiBPbiBNb24sIDcgT2N0IDIwMjQgYXQgMjA6NDksIExh
dXJlbnQgUGluY2hhcnQgd3JvdGU6DQo+ID4gPiA+ID4gT24gRnJpLCBPY3QgMDQsIDIwMjQgYXQg
MDQ6Mzg6MzZQTSArMDIwMCwgVWxmIEhhbnNzb24gd3JvdGU6DQo+ID4gPiA+ID4gPiBPbiBGcmks
IDQgT2N0IDIwMjQgYXQgMTE6NDEsIFNha2FyaSBBaWx1cyB3cm90ZToNCj4gPiA+ID4gPiA+ID4N
Cj4gPiA+ID4gPiA+ID4gSGVsbG8gZXZlcnlvbmUsDQo+ID4gPiA+ID4gPiA+DQo+ID4gPiA+ID4g
PiA+IFRoaXMgc2V0IHdpbGwgc3dpdGNoIHRoZSB1c2VycyBvZiBwbV9ydW50aW1lX3B1dF9hdXRv
c3VzcGVuZCgpIHRvDQo+ID4gPiA+ID4gPiA+IF9fcG1fcnVudGltZV9wdXRfYXV0b3N1c3BlbmQo
KSB3aGlsZSB0aGUgZm9ybWVyIHdpbGwgc29vbiBiZSByZS1wdXJwb3NlZA0KPiA+ID4gPiA+ID4g
PiB0byBpbmNsdWRlIGEgY2FsbCB0byBwbV9ydW50aW1lX21hcmtfbGFzdF9idXN5KCkuIFRoZSB0
d28gYXJlIGFsbW9zdA0KPiA+ID4gPiA+ID4gPiBhbHdheXMgdXNlZCB0b2dldGhlciwgYXBhcnQg
ZnJvbSBidWdzIHdoaWNoIGFyZSBsaWtlbHkgY29tbW9uLiBHb2luZw0KPiA+ID4gPiA+ID4gPiBm
b3J3YXJkLCBtb3N0IG5ldyB1c2VycyBzaG91bGQgYmUgdXNpbmcgcG1fcnVudGltZV9wdXRfYXV0
b3N1c3BlbmQoKS4NCj4gPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4gT25jZSB0aGlzIGNvbnZl
cnNpb24gaXMgZG9uZSBhbmQgcG1fcnVudGltZV9wdXRfYXV0b3N1c3BlbmQoKSByZS1wdXJwb3Nl
ZCwNCj4gPiA+ID4gPiA+ID4gSSdsbCBwb3N0IGFub3RoZXIgc2V0IHRvIG1lcmdlIHRoZSBjYWxs
cyB0byBfX3BtX3J1bnRpbWVfcHV0X2F1dG9zdXNwZW5kKCkNCj4gPiA+ID4gPiA+ID4gYW5kIHBt
X3J1bnRpbWVfbWFya19sYXN0X2J1c3koKS4NCj4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiBUaGF0
IHNvdW5kcyBsaWtlIGl0IGNvdWxkIGNhdXNlIGEgbG90IG9mIGNodXJucy4NCj4gPiA+ID4gPiA+
DQo+ID4gPiA+ID4gPiBXaHkgbm90IGFkZCBhIG5ldyBoZWxwZXIgZnVuY3Rpb24gdGhhdCBkb2Vz
IHRoZQ0KPiA+ID4gPiA+ID4gcG1fcnVudGltZV9wdXRfYXV0b3N1c3BlbmQoKSBhbmQgdGhlIHBt
X3J1bnRpbWVfbWFya19sYXN0X2J1c3koKQ0KPiA+ID4gPiA+ID4gdGhpbmdzPyBUaGVuIHdlIGNh
biBzdGFydCBtb3ZpbmcgdXNlcnMgb3ZlciB0byB0aGlzIG5ldyBpbnRlcmZhY2UsDQo+ID4gPiA+
ID4gPiByYXRoZXIgdGhhbiBoYXZpbmcgdGhpcyBpbnRlcm1lZGlhdGUgc3RlcD8NCj4gPiA+ID4g
Pg0KPiA+ID4gPiA+IEkgdGhpbmsgdGhlIEFQSSB3b3VsZCBiZSBuaWNlciBpZiB3ZSB1c2VkIHRo
ZSBzaG9ydGVzdCBhbmQgc2ltcGxlc3QNCj4gPiA+ID4gPiBmdW5jdGlvbiBuYW1lcyBmb3IgdGhl
IG1vc3QgY29tbW9uIHVzZSBjYXNlcy4gRm9sbG93aW5nDQo+ID4gPiA+ID4gcG1fcnVudGltZV9w
dXRfYXV0b3N1c3BlbmQoKSB3aXRoIHBtX3J1bnRpbWVfbWFya19sYXN0X2J1c3koKSBpcyB0aGF0
DQo+ID4gPiA+ID4gbW9zdCBjb21tb24gdXNlIGNhc2UuIFRoYXQncyB3aHkgSSBsaWtlIFNha2Fy
aSdzIGFwcHJvYWNoIG9mIHJlcHVycG9zaW5nDQo+ID4gPiA+ID4gcG1fcnVudGltZV9wdXRfYXV0
b3N1c3BlbmQoKSwgYW5kIGludHJvZHVjaW5nDQo+ID4gPiA+ID4gX19wbV9ydW50aW1lX3B1dF9h
dXRvc3VzcGVuZCgpIGZvciB0aGUgb2RkIGNhc2VzIHdoZXJlDQo+ID4gPiA+ID4gcG1fcnVudGlt
ZV9tYXJrX2xhc3RfYnVzeSgpIHNob3VsZG4ndCBiZSBjYWxsZWQuDQo+ID4gPiA+DQo+ID4gPiA+
IE9rYXksIHNvIHRoZSByZWFzb24gZm9yIHRoaXMgYXBwcm9hY2ggaXMgYmVjYXVzZSB3ZSBjb3Vs
ZG4ndCBmaW5kIGENCj4gPiA+ID4gc2hvcnQgYW5kIGRlc2NyaXB0aXZlIG5hbWUgdGhhdCBjb3Vs
ZCBiZSB1c2VkIGluIGZhdm9yIG9mDQo+ID4gPiA+IHBtX3J1bnRpbWVfcHV0X2F1dG9zdXNwZW5k
KCkuIExldCBtZSB0aHJvdyBzb21lIGlkZWFzIGF0IGl0IGFuZCBtYXliZQ0KPiA+ID4gPiB5b3Ug
bGlrZSBpdCAtIG9yIG5vdC4gOi0pDQo+ID4gPg0KPiA+ID4gSSBsaWtlIHRoZSBpZGVhIGF0IGxl
YXN0IDotKQ0KPiA+ID4NCj4gPiA+ID4gSSBkb24ndCBrbm93IHdoYXQgb3B0aW9ucyB5b3UgZ3V5
cyBkaXNjdXNzZWQsIGJ1dCB0byBtZSB0aGUgZW50aXJlDQo+ID4gPiA+ICJhdXRvc3VzcGVuZCIt
c3VmZml4IGlzbid0IHJlYWxseSB0aGF0IG5lY2Vzc2FyeSBpbiBteSBvcGluaW9uLiBUaGVyZQ0K
PiA+ID4gPiBhcmUgbW9yZSB3YXlzIHRoYW4gY2FsbGluZyBwbV9ydW50aW1lX3B1dF9hdXRvc3Vz
cGVuZCgpIHRoYXQgdHJpZ2dlcnMNCj4gPiA+ID4gdXMgdG8gdXNlIHRoZSBSUE1fQVVUTyBmbGFn
IGZvciBycG1fc3VzcGVuZCgpLiBGb3IgZXhhbXBsZSwganVzdA0KPiA+ID4gPiBjYWxsaW5nIHBt
X3J1bnRpbWVfcHV0KCkgaGFzIHRoZSBzaW1pbGFyIGVmZmVjdC4NCj4gPiA+DQo+ID4gPiBUbyBi
ZSBob25lc3QsIEknbSBsb3N0IHRoZXJlLiBwbV9ydW50aW1lX3B1dCgpIGNhbGxzDQo+ID4gPiBf
X3BtX3J1bnRpbWVfaWRsZShSUE1fR0VUX1BVVCB8IFJQTV9BU1lOQyksIHdoaWxlDQo+ID4gPiBw
bV9ydW50aW1lX3B1dF9hdXRvc3VzcGVuZCgpIGNhbGxzIF9fcG1fcnVudGltZV9zdXNwZW5kKFJQ
TV9HRVRfUFVUIHwNCj4gPiA+IFJQTV9BU1lOQyB8IFJQTV9BVVRPKS4NCj4gPg0KPiA+IF9fcG1f
cnVudGltZV9pZGxlKCkgZW5kcyB1cCBjYWxsaW5nIHJwbV9pZGxlKCksIHdoaWNoIG1heSBjYWxs
DQo+ID4gcnBtX3N1c3BlbmQoKSAtIGlmIGl0IHN1Y2NlZWRzIHRvIGlkbGUgdGhlIGRldmljZS4g
SW4gdGhhdCBjYXNlLCBpdA0KPiA+IHRhZ3Mgb24gdGhlIFJQTV9BVVRPIGZsYWcgaW4gdGhlIGNh
bGwgdG8gcnBtX3N1c3BlbmQoKS4gUXVpdGUgc2ltaWxhcg0KPiA+IHRvIHdoYXQgaXMgaGFwcGVu
aW5nIHdoZW4gY2FsbGluZyBwbV9ydW50aW1lX3B1dF9hdXRvc3VzcGVuZCgpLg0KPg0KPiBSaWdo
dC4NCj4NCj4gRm9yIGFsbW9zdCBldmVyeWJvZHksIGV4Y2VwdCBmb3IgYSBzbWFsbCBidW5jaCBv
ZiBkcml2ZXJzIHRoYXQNCj4gYWN0dWFsbHkgaGF2ZSBhIC5ydW50aW1lX2lkbGUoKSBjYWxsYmFj
aywgcG1fcnVudGltZV9wdXQoKSBpcw0KPiBsaXRlcmFsbHkgZXF1aXZhbGVudCB0byBwbV9ydW50
aW1lX3B1dF9hdXRvc3VzcGVuZCgpLg0KPg0KPiBTbyByZWFsbHkgdGhlIHF1ZXN0aW9uIGlzIHdo
eSBhbnlvbmUgd2hvIGRvZXNuJ3QgcHJvdmlkZSBhDQo+IC5ydW50aW1lX2lkbGUoKSBjYWxsYmFj
ayBib3RoZXJzIHdpdGggdXNpbmcgdGhpcyBzcGVjaWFsDQo+IHBtX3J1bnRpbWVfcHV0X2F1dG9z
dXNwZW5kKCkgdGhpbmcsIHdoaWNoIHJlYWxseSBtZWFucyAiZG8gYQ0KPiBydW50aW1lX3B1dCgp
LCBidXQgc2tpcCBteSAucnVudGltZV9pZGxlKCkgY2FsbGJhY2siLg0KDQpNeSBndWVzcyBpcyB0
aGF0IGl0J3MgaW4gbW9zdCBjYXNlcyBhIGxlZ2FjeSBwYXR0ZXJuIHRoYXQgaXMgYmVpbmcNCmZv
bGxvd2VkLiBBbHNvIG5vdGUgdGhhdCBycG1faWRsZSgpIGRpZG4ndCAiYWx3YXlzIiB0YWcgb24g
dGhlDQpSUE1fQVVUTyBmbGFnLCBldmVuIGlmIGl0J3MgcXVpdGUgYSB3aGlsZSBhZ28gKDIwMTMp
IHNpbmNlIHdlIGFkZGVkDQppdC4NCg0KVW5sZXNzIHRoZXJlIGlzIHNvbWUgYWN0dWFsIG9wdGlt
aXphdGlvbiBpbnZvbHZlZCwgYXMgaXQgYWxzbyBhbGxvd3MNCnVzIHRvIHNraXAgY2FsbGluZyBy
cG1faWRsZSgpIGFuZCBnbyBkaXJlY3RseSBmb3IgcnBtX3N1c3BlbmQoKS4NCg0KPg0KPiA+ID4N
Cj4gPiA+ID4NCj4gPiA+ID4gTW9yZW92ZXIsIGl0J3Mgc2ltaWxhciBmb3IgcG1fcnVudGltZV9t
YXJrX2xhc3RfYnVzeSgpLCBpdCdzIGNhbGxlZA0KPiA+ID4gPiBkdXJpbmcgcnBtX3Jlc3VtZSgp
IHRvbywgZm9yIGV4YW1wbGUuIFNvIHdoeSBib3RoZXIgYWJvdXQgaGF2aW5nDQo+ID4gPiA+ICJt
YXJrX2xhc3RfYnVzeSIgaW4gdGhlIG5ldyBuYW1lIHRvby4NCj4gPiA+ID4NCj4gPiA+ID4gVGhh
dCBzYWlkLCBteSBzdWdnZXN0aW9uIGlzIHNpbXBseSAicG1fcnVudGltZV9wdXRfc3VzcGVuZCIu
DQo+ID4gPg0KPiA+ID4gQ2FuIHdlIGRvIGV2ZW4gYmV0dGVyLCBhbmQgbWFrZSBwbV9ydW50aW1l
X3B1dCgpIHRvIGhhbmRsZSBhdXRvc3VzcGVuZA0KPiA+ID4gYXV0b21hdGljYWxseSB3aGVuIGF1
dG9zdXNwZW5kIGlzIGVuYWJsZWQgPw0KPiA+DQo+ID4gQXMgc3RhdGVkIGFib3ZlLCB0aGlzIGlz
IGFscmVhZHkgdGhlIGNhc2UuDQo+DQo+IFdoYXQgcmVhbGx5IGlzIG5lZWRlZCBhcHBlYXJzIHRv
IGJlIGEgY29tYmluYXRpb24gb2YNCj4gcG1fcnVudGltZV9tYXJrX2xhc3RfYnVzeSgpIHdpdGgg
cG1fcnVudGltZV9wdXQoKS4NCg0KVGhpcyBtYWtlcyBzZW5zZSB0byBtZSB0b28sIGJ1dCBJIGRv
bid0IHRoaW5rIHdlIHNob3VsZCBsaW1pdCBpdCB0byB0aGlzLg0KDQpNYWtpbmcgcG1fcnVudGlt
ZV9wdXRfYXV0b3N1c3BlbmQgKG9yIGlmIHRoZSBuYW1lDQoicG1fcnVudGltZV9wdXRfc3VzcGVu
ZCIgaXMgYmV0dGVyPykgdG8gZG8gdGhlIHNpbWlsYXIgdGhpbmcsIGlzDQpwcm9iYWJseSBhIGdv
b2QgaWRlYSB0b28uIEF0IGxlYXN0IGluIG15IG9waW5pb24uDQoNCj4NCj4gR3JhbnRlZCwgcG1f
cnVudGltZV9wdXQoKSBjb3VsZCBkbyB0aGUgcG1fcnVudGltZV9tYXJrX2xhc3RfYnVzeSgpDQo+
IHRoaW5nIGF1dG9tYXRpY2FsbHkgaWYgYXV0b3N1c3BlbmQgaXMgZW5hYmxlZCBhbmQgdGhlIG9u
bHkgY29uc2VxdWVuY2UNCj4gb2YgaXQgbWlnaHQgYmUgZGVsYXlpbmcgYSBzdXNwZW5kIG9mIHRo
ZSBkZXZpY2UgdW50aWwgaXRzIGF1dG9zdXNwZW5kDQo+IHRpbWVyIGV4cGlyZXMsIHdoaWNoIHNo
b3VsZCBub3QgYmUgYSBwcm9ibGVtIGluIHRoZSB2YXN0IG1ham9yaXR5IG9mDQo+IGNhc2VzLg0K
DQpSaWdodC4NCg0KSSBndWVzcyB3ZSBzaG91bGQgZXhwZWN0IHRoZSAqc3luYyogdmFyaWFudHMg
dG8gYmUgdXNlZCwgaWYgdGhlIHRpbWVyDQpyZWFsbHkgbmVlZHMgdG8gYmUgb3ZlcnJpZGRlbi4N
Cg0KS2luZCByZWdhcmRzDQpVZmZlDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpncmV5YnVzLWRldiBtYWlsaW5nIGxpc3QgLS0gZ3JleWJ1cy1kZXZAbGlz
dHMubGluYXJvLm9yZwpUbyB1bnN1YnNjcmliZSBzZW5kIGFuIGVtYWlsIHRvIGdyZXlidXMtZGV2
LWxlYXZlQGxpc3RzLmxpbmFyby5vcmcK
