Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E1F09966EA
	for <lists+greybus-dev@lfdr.de>; Wed,  9 Oct 2024 12:20:36 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 125A344315
	for <lists+greybus-dev@lfdr.de>; Wed,  9 Oct 2024 10:20:35 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	by lists.linaro.org (Postfix) with ESMTPS id 126D73F38F
	for <greybus-dev@lists.linaro.org>; Wed,  9 Oct 2024 10:20:30 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=Sypaa8E4;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (lists.linaro.org: domain of rafael@kernel.org designates 147.75.193.91 as permitted sender) smtp.mailfrom=rafael@kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2AE87A43D15
	for <greybus-dev@lists.linaro.org>; Wed,  9 Oct 2024 10:20:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6666DC4CECE
	for <greybus-dev@lists.linaro.org>; Wed,  9 Oct 2024 10:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728469229;
	bh=ImAK0CpUwm+JPbTzbW7azTUBVNfLGbvl7aS7sfbdp0E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Sypaa8E4XTR2h+6vO973S9djHACjIXek0KLq783ADF8tNtOe1bMZrJFf0zlt8+zSs
	 OLRAtppFEIb5Ic0mWDNDYNRaI6e9/Z7vBQGyOQ8guZklNp3J6lYVvOJPY0Nte+XhtF
	 xT1b91GGI33rYAt7gxwLcB1d3y1SBKs6bb4MxTTF1y6tGBweQi8zO12oDVI1/KpONI
	 bOJQtQv0XV690wHla57wDR2aHvoM6Up16kaIYdw6AVyfMWDvtpnERh2dLqJ6WBvkYw
	 EhkKXnH7yqObLqkMathJ5jYncRSwZXMHxI2dTYJuZPN1g66Yyks/L1YgZFWJ7ipDTo
	 JPDgtbBAM36Bg==
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-5e800d4e462so797601eaf.1
        for <greybus-dev@lists.linaro.org>; Wed, 09 Oct 2024 03:20:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXqjdWeMWed/Tj+sIcNuDgDh980aITAi9hNH4Us66AWlaAMNMxGZh3ygSqITzwE4RVu8hrNnCoULQhjeQ==@lists.linaro.org
X-Gm-Message-State: AOJu0YxMgQAy/6lxUc3qA0z0IM49bvbrgJ8Sj+tWp2bJuSeI0Jm7vzwS
	sGcBGtDQfD/LTcQh58b7vLpRaBwYTfnGO+YinvGGi0hxNxgGA55kEoSlJyiLPqPjH+IVh1hgnPX
	XRNvWGy9dOB7tgxZNEvw9mi3HD0s=
X-Google-Smtp-Source: AGHT+IF28e1A9mtOEy4wCWwLUrfMAFq/4+DT8Vi41Eljnp8AjlauSlJofg4NJprxAH2sFsPScvE36aWo6OHCPjXQ49c=
X-Received: by 2002:a05:6820:270f:b0:5e7:c925:b05 with SMTP id
 006d021491bc7-5e987aadf58mr1212364eaf.2.1728469228716; Wed, 09 Oct 2024
 03:20:28 -0700 (PDT)
MIME-Version: 1.0
References: <20241004094101.113349-1-sakari.ailus@linux.intel.com>
 <CAPDyKFp0N6UJhnHS164Tdf=xkWB0jzq65L9TdvYazeBQ-6WjeQ@mail.gmail.com>
 <20241007184924.GH14766@pendragon.ideasonboard.com> <CAPDyKFpQVnF7eQv3dup8k-3EijnMjuveCG9sZ=Rpey1Y6MBJEg@mail.gmail.com>
 <20241007222502.GG30699@pendragon.ideasonboard.com> <CAPDyKFrGNwna6Y2pqSRaBbRYHKRaD2ayqQHLtoqLPOu9Et7qTg@mail.gmail.com>
 <CAJZ5v0jvJyS7D5-wURi2kyWN-rmNa+YqupeQJ000pQRVd9VBcQ@mail.gmail.com>
In-Reply-To: <CAJZ5v0jvJyS7D5-wURi2kyWN-rmNa+YqupeQJ000pQRVd9VBcQ@mail.gmail.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 9 Oct 2024 12:20:16 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0htLbrFeby43Ycqpaihqd4x56MokC9sTVRBmTTQSX7vmQ@mail.gmail.com>
Message-ID: <CAJZ5v0htLbrFeby43Ycqpaihqd4x56MokC9sTVRBmTTQSX7vmQ@mail.gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 126D73F38F
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
	RCPT_COUNT_TWELVE(0.00)[39];
	ARC_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org,opensource.cirrus.com,lists.linux.dev,lists.linaro.org,gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+]
X-Rspamd-Action: no action
Message-ID-Hash: X6OKMXX6QSV4CMIX5ZKNGVGO7X6BU7JH
X-Message-ID-Hash: X6OKMXX6QSV4CMIX5ZKNGVGO7X6BU7JH
X-MailFrom: rafael@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org, linux-clk@vger.kernel.org, linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org, linux-gpio@vger.kernel.org, amd-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, linux-i3c@lists.infradead.org, linux-iio@vger.kernel.org, linux-input@vger.kernel.org, patches@opensource.cirrus.com, iommu@lists.linux.dev, imx@lists.linux.dev, linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org, linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-pci@vger.kernel.org, linux-phy@lists.infradead.org, linux-pwm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-sound@vger.kernel.org, linux-spi@vger.kernel.org, linux-staging@lists.linux.dev, linux-usb@vger.kernel.org, linux-serial@vger.kernel.org, greybus-dev@l
 ists.linaro.org, asahi@lists.linux.dev, Andy Shevchenko <andy.shevchenko@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 00/51] treewide: Switch to __pm_runtime_put_autosuspend()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/X6OKMXX6QSV4CMIX5ZKNGVGO7X6BU7JH/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gVHVlLCBPY3QgOCwgMjAyNCBhdCA4OjI04oCvUE0gUmFmYWVsIEouIFd5c29ja2kgPHJhZmFl
bEBrZXJuZWwub3JnPiB3cm90ZToNCj4NCj4gT24gVHVlLCBPY3QgOCwgMjAyNCBhdCAxMjozNeKA
r0FNIFVsZiBIYW5zc29uIDx1bGYuaGFuc3NvbkBsaW5hcm8ub3JnPiB3cm90ZToNCj4gPg0KPiA+
IE9uIFR1ZSwgOCBPY3QgMjAyNCBhdCAwMDoyNSwgTGF1cmVudCBQaW5jaGFydA0KPiA+IDxsYXVy
ZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+IHdyb3RlOg0KPiA+ID4NCj4gPiA+IEhpIFVs
ZiwNCj4gPiA+DQo+ID4gPiBPbiBUdWUsIE9jdCAwOCwgMjAyNCBhdCAxMjowODoyNEFNICswMjAw
LCBVbGYgSGFuc3NvbiB3cm90ZToNCj4gPiA+ID4gT24gTW9uLCA3IE9jdCAyMDI0IGF0IDIwOjQ5
LCBMYXVyZW50IFBpbmNoYXJ0IHdyb3RlOg0KPiA+ID4gPiA+IE9uIEZyaSwgT2N0IDA0LCAyMDI0
IGF0IDA0OjM4OjM2UE0gKzAyMDAsIFVsZiBIYW5zc29uIHdyb3RlOg0KPiA+ID4gPiA+ID4gT24g
RnJpLCA0IE9jdCAyMDI0IGF0IDExOjQxLCBTYWthcmkgQWlsdXMgd3JvdGU6DQo+ID4gPiA+ID4g
PiA+DQo+ID4gPiA+ID4gPiA+IEhlbGxvIGV2ZXJ5b25lLA0KPiA+ID4gPiA+ID4gPg0KPiA+ID4g
PiA+ID4gPiBUaGlzIHNldCB3aWxsIHN3aXRjaCB0aGUgdXNlcnMgb2YgcG1fcnVudGltZV9wdXRf
YXV0b3N1c3BlbmQoKSB0bw0KPiA+ID4gPiA+ID4gPiBfX3BtX3J1bnRpbWVfcHV0X2F1dG9zdXNw
ZW5kKCkgd2hpbGUgdGhlIGZvcm1lciB3aWxsIHNvb24gYmUgcmUtcHVycG9zZWQNCj4gPiA+ID4g
PiA+ID4gdG8gaW5jbHVkZSBhIGNhbGwgdG8gcG1fcnVudGltZV9tYXJrX2xhc3RfYnVzeSgpLiBU
aGUgdHdvIGFyZSBhbG1vc3QNCj4gPiA+ID4gPiA+ID4gYWx3YXlzIHVzZWQgdG9nZXRoZXIsIGFw
YXJ0IGZyb20gYnVncyB3aGljaCBhcmUgbGlrZWx5IGNvbW1vbi4gR29pbmcNCj4gPiA+ID4gPiA+
ID4gZm9yd2FyZCwgbW9zdCBuZXcgdXNlcnMgc2hvdWxkIGJlIHVzaW5nIHBtX3J1bnRpbWVfcHV0
X2F1dG9zdXNwZW5kKCkuDQo+ID4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+IE9uY2UgdGhpcyBj
b252ZXJzaW9uIGlzIGRvbmUgYW5kIHBtX3J1bnRpbWVfcHV0X2F1dG9zdXNwZW5kKCkgcmUtcHVy
cG9zZWQsDQo+ID4gPiA+ID4gPiA+IEknbGwgcG9zdCBhbm90aGVyIHNldCB0byBtZXJnZSB0aGUg
Y2FsbHMgdG8gX19wbV9ydW50aW1lX3B1dF9hdXRvc3VzcGVuZCgpDQo+ID4gPiA+ID4gPiA+IGFu
ZCBwbV9ydW50aW1lX21hcmtfbGFzdF9idXN5KCkuDQo+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4g
VGhhdCBzb3VuZHMgbGlrZSBpdCBjb3VsZCBjYXVzZSBhIGxvdCBvZiBjaHVybnMuDQo+ID4gPiA+
ID4gPg0KPiA+ID4gPiA+ID4gV2h5IG5vdCBhZGQgYSBuZXcgaGVscGVyIGZ1bmN0aW9uIHRoYXQg
ZG9lcyB0aGUNCj4gPiA+ID4gPiA+IHBtX3J1bnRpbWVfcHV0X2F1dG9zdXNwZW5kKCkgYW5kIHRo
ZSBwbV9ydW50aW1lX21hcmtfbGFzdF9idXN5KCkNCj4gPiA+ID4gPiA+IHRoaW5ncz8gVGhlbiB3
ZSBjYW4gc3RhcnQgbW92aW5nIHVzZXJzIG92ZXIgdG8gdGhpcyBuZXcgaW50ZXJmYWNlLA0KPiA+
ID4gPiA+ID4gcmF0aGVyIHRoYW4gaGF2aW5nIHRoaXMgaW50ZXJtZWRpYXRlIHN0ZXA/DQo+ID4g
PiA+ID4NCj4gPiA+ID4gPiBJIHRoaW5rIHRoZSBBUEkgd291bGQgYmUgbmljZXIgaWYgd2UgdXNl
ZCB0aGUgc2hvcnRlc3QgYW5kIHNpbXBsZXN0DQo+ID4gPiA+ID4gZnVuY3Rpb24gbmFtZXMgZm9y
IHRoZSBtb3N0IGNvbW1vbiB1c2UgY2FzZXMuIEZvbGxvd2luZw0KPiA+ID4gPiA+IHBtX3J1bnRp
bWVfcHV0X2F1dG9zdXNwZW5kKCkgd2l0aCBwbV9ydW50aW1lX21hcmtfbGFzdF9idXN5KCkgaXMg
dGhhdA0KPiA+ID4gPiA+IG1vc3QgY29tbW9uIHVzZSBjYXNlLiBUaGF0J3Mgd2h5IEkgbGlrZSBT
YWthcmkncyBhcHByb2FjaCBvZiByZXB1cnBvc2luZw0KPiA+ID4gPiA+IHBtX3J1bnRpbWVfcHV0
X2F1dG9zdXNwZW5kKCksIGFuZCBpbnRyb2R1Y2luZw0KPiA+ID4gPiA+IF9fcG1fcnVudGltZV9w
dXRfYXV0b3N1c3BlbmQoKSBmb3IgdGhlIG9kZCBjYXNlcyB3aGVyZQ0KPiA+ID4gPiA+IHBtX3J1
bnRpbWVfbWFya19sYXN0X2J1c3koKSBzaG91bGRuJ3QgYmUgY2FsbGVkLg0KPiA+ID4gPg0KPiA+
ID4gPiBPa2F5LCBzbyB0aGUgcmVhc29uIGZvciB0aGlzIGFwcHJvYWNoIGlzIGJlY2F1c2Ugd2Ug
Y291bGRuJ3QgZmluZCBhDQo+ID4gPiA+IHNob3J0IGFuZCBkZXNjcmlwdGl2ZSBuYW1lIHRoYXQg
Y291bGQgYmUgdXNlZCBpbiBmYXZvciBvZg0KPiA+ID4gPiBwbV9ydW50aW1lX3B1dF9hdXRvc3Vz
cGVuZCgpLiBMZXQgbWUgdGhyb3cgc29tZSBpZGVhcyBhdCBpdCBhbmQgbWF5YmUNCj4gPiA+ID4g
eW91IGxpa2UgaXQgLSBvciBub3QuIDotKQ0KPiA+ID4NCj4gPiA+IEkgbGlrZSB0aGUgaWRlYSBh
dCBsZWFzdCA6LSkNCj4gPiA+DQo+ID4gPiA+IEkgZG9uJ3Qga25vdyB3aGF0IG9wdGlvbnMgeW91
IGd1eXMgZGlzY3Vzc2VkLCBidXQgdG8gbWUgdGhlIGVudGlyZQ0KPiA+ID4gPiAiYXV0b3N1c3Bl
bmQiLXN1ZmZpeCBpc24ndCByZWFsbHkgdGhhdCBuZWNlc3NhcnkgaW4gbXkgb3Bpbmlvbi4gVGhl
cmUNCj4gPiA+ID4gYXJlIG1vcmUgd2F5cyB0aGFuIGNhbGxpbmcgcG1fcnVudGltZV9wdXRfYXV0
b3N1c3BlbmQoKSB0aGF0IHRyaWdnZXJzDQo+ID4gPiA+IHVzIHRvIHVzZSB0aGUgUlBNX0FVVE8g
ZmxhZyBmb3IgcnBtX3N1c3BlbmQoKS4gRm9yIGV4YW1wbGUsIGp1c3QNCj4gPiA+ID4gY2FsbGlu
ZyBwbV9ydW50aW1lX3B1dCgpIGhhcyB0aGUgc2ltaWxhciBlZmZlY3QuDQo+ID4gPg0KPiA+ID4g
VG8gYmUgaG9uZXN0LCBJJ20gbG9zdCB0aGVyZS4gcG1fcnVudGltZV9wdXQoKSBjYWxscw0KPiA+
ID4gX19wbV9ydW50aW1lX2lkbGUoUlBNX0dFVF9QVVQgfCBSUE1fQVNZTkMpLCB3aGlsZQ0KPiA+
ID4gcG1fcnVudGltZV9wdXRfYXV0b3N1c3BlbmQoKSBjYWxscyBfX3BtX3J1bnRpbWVfc3VzcGVu
ZChSUE1fR0VUX1BVVCB8DQo+ID4gPiBSUE1fQVNZTkMgfCBSUE1fQVVUTykuDQo+ID4NCj4gPiBf
X3BtX3J1bnRpbWVfaWRsZSgpIGVuZHMgdXAgY2FsbGluZyBycG1faWRsZSgpLCB3aGljaCBtYXkg
Y2FsbA0KPiA+IHJwbV9zdXNwZW5kKCkgLSBpZiBpdCBzdWNjZWVkcyB0byBpZGxlIHRoZSBkZXZp
Y2UuIEluIHRoYXQgY2FzZSwgaXQNCj4gPiB0YWdzIG9uIHRoZSBSUE1fQVVUTyBmbGFnIGluIHRo
ZSBjYWxsIHRvIHJwbV9zdXNwZW5kKCkuIFF1aXRlIHNpbWlsYXINCj4gPiB0byB3aGF0IGlzIGhh
cHBlbmluZyB3aGVuIGNhbGxpbmcgcG1fcnVudGltZV9wdXRfYXV0b3N1c3BlbmQoKS4NCj4NCj4g
UmlnaHQuDQo+DQo+IEZvciBhbG1vc3QgZXZlcnlib2R5LCBleGNlcHQgZm9yIGEgc21hbGwgYnVu
Y2ggb2YgZHJpdmVycyB0aGF0DQo+IGFjdHVhbGx5IGhhdmUgYSAucnVudGltZV9pZGxlKCkgY2Fs
bGJhY2ssIHBtX3J1bnRpbWVfcHV0KCkgaXMNCj4gbGl0ZXJhbGx5IGVxdWl2YWxlbnQgdG8gcG1f
cnVudGltZV9wdXRfYXV0b3N1c3BlbmQoKS4NCj4NCj4gU28gcmVhbGx5IHRoZSBxdWVzdGlvbiBp
cyB3aHkgYW55b25lIHdobyBkb2Vzbid0IHByb3ZpZGUgYQ0KPiAucnVudGltZV9pZGxlKCkgY2Fs
bGJhY2sgYm90aGVycyB3aXRoIHVzaW5nIHRoaXMgc3BlY2lhbA0KPiBwbV9ydW50aW1lX3B1dF9h
dXRvc3VzcGVuZCgpIHRoaW5nLCB3aGljaCByZWFsbHkgbWVhbnMgImRvIGENCj4gcnVudGltZV9w
dXQoKSwgYnV0IHNraXAgbXkgLnJ1bnRpbWVfaWRsZSgpIGNhbGxiYWNrIi4NCj4NCj4gPiA+DQo+
ID4gPiA+DQo+ID4gPiA+IE1vcmVvdmVyLCBpdCdzIHNpbWlsYXIgZm9yIHBtX3J1bnRpbWVfbWFy
a19sYXN0X2J1c3koKSwgaXQncyBjYWxsZWQNCj4gPiA+ID4gZHVyaW5nIHJwbV9yZXN1bWUoKSB0
b28sIGZvciBleGFtcGxlLiBTbyB3aHkgYm90aGVyIGFib3V0IGhhdmluZw0KPiA+ID4gPiAibWFy
a19sYXN0X2J1c3kiIGluIHRoZSBuZXcgbmFtZSB0b28uDQo+ID4gPiA+DQo+ID4gPiA+IFRoYXQg
c2FpZCwgbXkgc3VnZ2VzdGlvbiBpcyBzaW1wbHkgInBtX3J1bnRpbWVfcHV0X3N1c3BlbmQiLg0K
PiA+ID4NCj4gPiA+IENhbiB3ZSBkbyBldmVuIGJldHRlciwgYW5kIG1ha2UgcG1fcnVudGltZV9w
dXQoKSB0byBoYW5kbGUgYXV0b3N1c3BlbmQNCj4gPiA+IGF1dG9tYXRpY2FsbHkgd2hlbiBhdXRv
c3VzcGVuZCBpcyBlbmFibGVkID8NCj4gPg0KPiA+IEFzIHN0YXRlZCBhYm92ZSwgdGhpcyBpcyBh
bHJlYWR5IHRoZSBjYXNlLg0KPg0KPiBXaGF0IHJlYWxseSBpcyBuZWVkZWQgYXBwZWFycyB0byBi
ZSBhIGNvbWJpbmF0aW9uIG9mDQo+IHBtX3J1bnRpbWVfbWFya19sYXN0X2J1c3koKSB3aXRoIHBt
X3J1bnRpbWVfcHV0KCkuDQo+DQo+IEdyYW50ZWQsIHBtX3J1bnRpbWVfcHV0KCkgY291bGQgZG8g
dGhlIHBtX3J1bnRpbWVfbWFya19sYXN0X2J1c3koKQ0KPiB0aGluZyBhdXRvbWF0aWNhbGx5IGlm
IGF1dG9zdXNwZW5kIGlzIGVuYWJsZWQgYW5kIHRoZSBvbmx5IGNvbnNlcXVlbmNlDQo+IG9mIGl0
IG1pZ2h0IGJlIGRlbGF5aW5nIGEgc3VzcGVuZCBvZiB0aGUgZGV2aWNlIHVudGlsIGl0cyBhdXRv
c3VzcGVuZA0KPiB0aW1lciBleHBpcmVzLCB3aGljaCBzaG91bGQgbm90IGJlIGEgcHJvYmxlbSBp
biB0aGUgdmFzdCBtYWpvcml0eSBvZg0KPiBjYXNlcy4NCg0KVGhhdCBzYWlkLCBpdCBpcyBsaWtl
bHkgYmV0dGVyIHRvIGF2b2lkIHN1cnByaXNpbmcgdGhlIGN1cnJlbnQgdXNlcnMNCm9mIHBtX3J1
bnRpbWVfcHV0KCkgYW5kIGRlZmluZSBzb21ldGhpbmcgbGlrZQ0KDQpzdGF0aWMgaW5saW5lIHZv
aWQgcG1fcnVudGltZV90b3VjaF9hbmRfcHV0KHN0cnVjdCBkZXZpY2UgKmRldikNCnsNCiAgICAg
ICAgcG1fcnVudGltZV9tYXJrX2xhc3RfYnVzeShkZXYpOw0KICAgICAgICBwbV9ydW50aW1lX3B1
dChkZXYpOw0KfQ0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZ3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0IC0tIGdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5v
cmcKVG8gdW5zdWJzY3JpYmUgc2VuZCBhbiBlbWFpbCB0byBncmV5YnVzLWRldi1sZWF2ZUBsaXN0
cy5saW5hcm8ub3JnCg==
