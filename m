Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 27B7E99566D
	for <lists+greybus-dev@lfdr.de>; Tue,  8 Oct 2024 20:25:18 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 3578144A06
	for <lists+greybus-dev@lfdr.de>; Tue,  8 Oct 2024 18:25:17 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	by lists.linaro.org (Postfix) with ESMTPS id 8EE343F4B4
	for <greybus-dev@lists.linaro.org>; Tue,  8 Oct 2024 18:25:08 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=QWv3+c7h;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (lists.linaro.org: domain of rafael@kernel.org designates 147.75.193.91 as permitted sender) smtp.mailfrom=rafael@kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8A269A432F7
	for <greybus-dev@lists.linaro.org>; Tue,  8 Oct 2024 18:24:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 536D2C4CED4
	for <greybus-dev@lists.linaro.org>; Tue,  8 Oct 2024 18:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728411907;
	bh=gbTLwyB5anW/NVNa27O4GYEgcT7Zt8zwGlDOBl4w9X4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=QWv3+c7hgheNar52dT93kuaRJqQGwrTlm+2qt+dJoGyQzAHIgU0jubrC8ThWhyZIZ
	 RS8ECJijkXPnKWXZt/DHYo4oNlel2cdA7QmeMfgDuBLkCfLLpl6vQcl4DNTcV5EyFH
	 5h8XYKukhwE21LUBMtMTij4WxRmO6XhWfjQaEwayPWgg9ncS5s6vbgtpgFKR2d4Ze1
	 U8RaeSIFzvB8vNoypQgBEdP43kZiPZVbc5vt/+kjhif0hCbio5j23Z7Fbcd2MdU+Eu
	 u4mqS8NwdiP912BRPYfCL4ckK1zD9U7UpC3cflIOLH9kTp0r9qM6ScGNZWHbmYuBvP
	 5BPH6goJRp7XQ==
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-5e5568f1baaso3161334eaf.2
        for <greybus-dev@lists.linaro.org>; Tue, 08 Oct 2024 11:25:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVmIY8/5M+sKS7Ho53K3Ryo4+r0LBu17VR/MN6+N5h6goVeow/RFdo+iBXp8hDtQedVFZQ8nqnadhC+YA==@lists.linaro.org
X-Gm-Message-State: AOJu0YwCqtFdA5B1vJLLztq7RN6vZ2pSYo0NumwSpU4xlwr6lWFtt/qB
	zSPzKqXIGuJX0+CC5XpZ+9d3gepbTL6My5dZDYeQOWdMfxD3Es/B1Pv6D19woDJ841fMwWTJ9dY
	4UGX4z+P1S43CyFXUri0jbytjD7s=
X-Google-Smtp-Source: AGHT+IE8/UzrmOfg0dgL+a7sFpnmZmTmVZlVfZVXeH9h9sR6Zbx0f+k3/XHDUWx/NQFfJo1odWsZ7gtN5j50xL2u+GA=
X-Received: by 2002:a05:6820:228e:b0:5e1:d741:6f04 with SMTP id
 006d021491bc7-5e7cc079979mr12626737eaf.3.1728411906564; Tue, 08 Oct 2024
 11:25:06 -0700 (PDT)
MIME-Version: 1.0
References: <20241004094101.113349-1-sakari.ailus@linux.intel.com>
 <CAPDyKFp0N6UJhnHS164Tdf=xkWB0jzq65L9TdvYazeBQ-6WjeQ@mail.gmail.com>
 <20241007184924.GH14766@pendragon.ideasonboard.com> <CAPDyKFpQVnF7eQv3dup8k-3EijnMjuveCG9sZ=Rpey1Y6MBJEg@mail.gmail.com>
 <20241007222502.GG30699@pendragon.ideasonboard.com> <CAPDyKFrGNwna6Y2pqSRaBbRYHKRaD2ayqQHLtoqLPOu9Et7qTg@mail.gmail.com>
In-Reply-To: <CAPDyKFrGNwna6Y2pqSRaBbRYHKRaD2ayqQHLtoqLPOu9Et7qTg@mail.gmail.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Tue, 8 Oct 2024 20:24:55 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0jvJyS7D5-wURi2kyWN-rmNa+YqupeQJ000pQRVd9VBcQ@mail.gmail.com>
Message-ID: <CAJZ5v0jvJyS7D5-wURi2kyWN-rmNa+YqupeQJ000pQRVd9VBcQ@mail.gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 8EE343F4B4
X-Spamd-Bar: ------
X-Spamd-Result: default: False [-6.50 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:147.75.193.91];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[39];
	ASN(0.00)[asn:54825, ipnet:147.75.192.0/21, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org,opensource.cirrus.com,lists.linux.dev,lists.linaro.org,gmail.com];
	URIBL_BLOCKED(0.00)[linaro.org:email,mail.gmail.com:mid,nyc.source.kernel.org:helo,nyc.source.kernel.org:rdns];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RCVD_COUNT_THREE(0.00)[3];
	DKIM_TRACE(0.00)[kernel.org:+]
X-Rspamd-Action: no action
Message-ID-Hash: OTX7KGYM2X54QIDID3AIU2KDBV4CO2RJ
X-Message-ID-Hash: OTX7KGYM2X54QIDID3AIU2KDBV4CO2RJ
X-MailFrom: rafael@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org, linux-clk@vger.kernel.org, linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org, linux-gpio@vger.kernel.org, amd-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, linux-i3c@lists.infradead.org, linux-iio@vger.kernel.org, linux-input@vger.kernel.org, patches@opensource.cirrus.com, iommu@lists.linux.dev, imx@lists.linux.dev, linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org, linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-pci@vger.kernel.org, linux-phy@lists.infradead.org, linux-pwm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-sound@vger.kernel.org, linux-spi@vger.kernel.org, linux-staging@lists.linux.dev, linux-usb@vger.kernel.org, linux-serial@vger.kernel.org, greybus-dev@l
 ists.linaro.org, asahi@lists.linux.dev, Andy Shevchenko <andy.shevchenko@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 00/51] treewide: Switch to __pm_runtime_put_autosuspend()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/OTX7KGYM2X54QIDID3AIU2KDBV4CO2RJ/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gVHVlLCBPY3QgOCwgMjAyNCBhdCAxMjozNeKAr0FNIFVsZiBIYW5zc29uIDx1bGYuaGFuc3Nv
bkBsaW5hcm8ub3JnPiB3cm90ZToNCj4NCj4gT24gVHVlLCA4IE9jdCAyMDI0IGF0IDAwOjI1LCBM
YXVyZW50IFBpbmNoYXJ0DQo+IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+IHdy
b3RlOg0KPiA+DQo+ID4gSGkgVWxmLA0KPiA+DQo+ID4gT24gVHVlLCBPY3QgMDgsIDIwMjQgYXQg
MTI6MDg6MjRBTSArMDIwMCwgVWxmIEhhbnNzb24gd3JvdGU6DQo+ID4gPiBPbiBNb24sIDcgT2N0
IDIwMjQgYXQgMjA6NDksIExhdXJlbnQgUGluY2hhcnQgd3JvdGU6DQo+ID4gPiA+IE9uIEZyaSwg
T2N0IDA0LCAyMDI0IGF0IDA0OjM4OjM2UE0gKzAyMDAsIFVsZiBIYW5zc29uIHdyb3RlOg0KPiA+
ID4gPiA+IE9uIEZyaSwgNCBPY3QgMjAyNCBhdCAxMTo0MSwgU2FrYXJpIEFpbHVzIHdyb3RlOg0K
PiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+IEhlbGxvIGV2ZXJ5b25lLA0KPiA+ID4gPiA+ID4NCj4g
PiA+ID4gPiA+IFRoaXMgc2V0IHdpbGwgc3dpdGNoIHRoZSB1c2VycyBvZiBwbV9ydW50aW1lX3B1
dF9hdXRvc3VzcGVuZCgpIHRvDQo+ID4gPiA+ID4gPiBfX3BtX3J1bnRpbWVfcHV0X2F1dG9zdXNw
ZW5kKCkgd2hpbGUgdGhlIGZvcm1lciB3aWxsIHNvb24gYmUgcmUtcHVycG9zZWQNCj4gPiA+ID4g
PiA+IHRvIGluY2x1ZGUgYSBjYWxsIHRvIHBtX3J1bnRpbWVfbWFya19sYXN0X2J1c3koKS4gVGhl
IHR3byBhcmUgYWxtb3N0DQo+ID4gPiA+ID4gPiBhbHdheXMgdXNlZCB0b2dldGhlciwgYXBhcnQg
ZnJvbSBidWdzIHdoaWNoIGFyZSBsaWtlbHkgY29tbW9uLiBHb2luZw0KPiA+ID4gPiA+ID4gZm9y
d2FyZCwgbW9zdCBuZXcgdXNlcnMgc2hvdWxkIGJlIHVzaW5nIHBtX3J1bnRpbWVfcHV0X2F1dG9z
dXNwZW5kKCkuDQo+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gT25jZSB0aGlzIGNvbnZlcnNpb24g
aXMgZG9uZSBhbmQgcG1fcnVudGltZV9wdXRfYXV0b3N1c3BlbmQoKSByZS1wdXJwb3NlZCwNCj4g
PiA+ID4gPiA+IEknbGwgcG9zdCBhbm90aGVyIHNldCB0byBtZXJnZSB0aGUgY2FsbHMgdG8gX19w
bV9ydW50aW1lX3B1dF9hdXRvc3VzcGVuZCgpDQo+ID4gPiA+ID4gPiBhbmQgcG1fcnVudGltZV9t
YXJrX2xhc3RfYnVzeSgpLg0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gVGhhdCBzb3VuZHMgbGlrZSBp
dCBjb3VsZCBjYXVzZSBhIGxvdCBvZiBjaHVybnMuDQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBXaHkg
bm90IGFkZCBhIG5ldyBoZWxwZXIgZnVuY3Rpb24gdGhhdCBkb2VzIHRoZQ0KPiA+ID4gPiA+IHBt
X3J1bnRpbWVfcHV0X2F1dG9zdXNwZW5kKCkgYW5kIHRoZSBwbV9ydW50aW1lX21hcmtfbGFzdF9i
dXN5KCkNCj4gPiA+ID4gPiB0aGluZ3M/IFRoZW4gd2UgY2FuIHN0YXJ0IG1vdmluZyB1c2VycyBv
dmVyIHRvIHRoaXMgbmV3IGludGVyZmFjZSwNCj4gPiA+ID4gPiByYXRoZXIgdGhhbiBoYXZpbmcg
dGhpcyBpbnRlcm1lZGlhdGUgc3RlcD8NCj4gPiA+ID4NCj4gPiA+ID4gSSB0aGluayB0aGUgQVBJ
IHdvdWxkIGJlIG5pY2VyIGlmIHdlIHVzZWQgdGhlIHNob3J0ZXN0IGFuZCBzaW1wbGVzdA0KPiA+
ID4gPiBmdW5jdGlvbiBuYW1lcyBmb3IgdGhlIG1vc3QgY29tbW9uIHVzZSBjYXNlcy4gRm9sbG93
aW5nDQo+ID4gPiA+IHBtX3J1bnRpbWVfcHV0X2F1dG9zdXNwZW5kKCkgd2l0aCBwbV9ydW50aW1l
X21hcmtfbGFzdF9idXN5KCkgaXMgdGhhdA0KPiA+ID4gPiBtb3N0IGNvbW1vbiB1c2UgY2FzZS4g
VGhhdCdzIHdoeSBJIGxpa2UgU2FrYXJpJ3MgYXBwcm9hY2ggb2YgcmVwdXJwb3NpbmcNCj4gPiA+
ID4gcG1fcnVudGltZV9wdXRfYXV0b3N1c3BlbmQoKSwgYW5kIGludHJvZHVjaW5nDQo+ID4gPiA+
IF9fcG1fcnVudGltZV9wdXRfYXV0b3N1c3BlbmQoKSBmb3IgdGhlIG9kZCBjYXNlcyB3aGVyZQ0K
PiA+ID4gPiBwbV9ydW50aW1lX21hcmtfbGFzdF9idXN5KCkgc2hvdWxkbid0IGJlIGNhbGxlZC4N
Cj4gPiA+DQo+ID4gPiBPa2F5LCBzbyB0aGUgcmVhc29uIGZvciB0aGlzIGFwcHJvYWNoIGlzIGJl
Y2F1c2Ugd2UgY291bGRuJ3QgZmluZCBhDQo+ID4gPiBzaG9ydCBhbmQgZGVzY3JpcHRpdmUgbmFt
ZSB0aGF0IGNvdWxkIGJlIHVzZWQgaW4gZmF2b3Igb2YNCj4gPiA+IHBtX3J1bnRpbWVfcHV0X2F1
dG9zdXNwZW5kKCkuIExldCBtZSB0aHJvdyBzb21lIGlkZWFzIGF0IGl0IGFuZCBtYXliZQ0KPiA+
ID4geW91IGxpa2UgaXQgLSBvciBub3QuIDotKQ0KPiA+DQo+ID4gSSBsaWtlIHRoZSBpZGVhIGF0
IGxlYXN0IDotKQ0KPiA+DQo+ID4gPiBJIGRvbid0IGtub3cgd2hhdCBvcHRpb25zIHlvdSBndXlz
IGRpc2N1c3NlZCwgYnV0IHRvIG1lIHRoZSBlbnRpcmUNCj4gPiA+ICJhdXRvc3VzcGVuZCItc3Vm
Zml4IGlzbid0IHJlYWxseSB0aGF0IG5lY2Vzc2FyeSBpbiBteSBvcGluaW9uLiBUaGVyZQ0KPiA+
ID4gYXJlIG1vcmUgd2F5cyB0aGFuIGNhbGxpbmcgcG1fcnVudGltZV9wdXRfYXV0b3N1c3BlbmQo
KSB0aGF0IHRyaWdnZXJzDQo+ID4gPiB1cyB0byB1c2UgdGhlIFJQTV9BVVRPIGZsYWcgZm9yIHJw
bV9zdXNwZW5kKCkuIEZvciBleGFtcGxlLCBqdXN0DQo+ID4gPiBjYWxsaW5nIHBtX3J1bnRpbWVf
cHV0KCkgaGFzIHRoZSBzaW1pbGFyIGVmZmVjdC4NCj4gPg0KPiA+IFRvIGJlIGhvbmVzdCwgSSdt
IGxvc3QgdGhlcmUuIHBtX3J1bnRpbWVfcHV0KCkgY2FsbHMNCj4gPiBfX3BtX3J1bnRpbWVfaWRs
ZShSUE1fR0VUX1BVVCB8IFJQTV9BU1lOQyksIHdoaWxlDQo+ID4gcG1fcnVudGltZV9wdXRfYXV0
b3N1c3BlbmQoKSBjYWxscyBfX3BtX3J1bnRpbWVfc3VzcGVuZChSUE1fR0VUX1BVVCB8DQo+ID4g
UlBNX0FTWU5DIHwgUlBNX0FVVE8pLg0KPg0KPiBfX3BtX3J1bnRpbWVfaWRsZSgpIGVuZHMgdXAg
Y2FsbGluZyBycG1faWRsZSgpLCB3aGljaCBtYXkgY2FsbA0KPiBycG1fc3VzcGVuZCgpIC0gaWYg
aXQgc3VjY2VlZHMgdG8gaWRsZSB0aGUgZGV2aWNlLiBJbiB0aGF0IGNhc2UsIGl0DQo+IHRhZ3Mg
b24gdGhlIFJQTV9BVVRPIGZsYWcgaW4gdGhlIGNhbGwgdG8gcnBtX3N1c3BlbmQoKS4gUXVpdGUg
c2ltaWxhcg0KPiB0byB3aGF0IGlzIGhhcHBlbmluZyB3aGVuIGNhbGxpbmcgcG1fcnVudGltZV9w
dXRfYXV0b3N1c3BlbmQoKS4NCg0KUmlnaHQuDQoNCkZvciBhbG1vc3QgZXZlcnlib2R5LCBleGNl
cHQgZm9yIGEgc21hbGwgYnVuY2ggb2YgZHJpdmVycyB0aGF0DQphY3R1YWxseSBoYXZlIGEgLnJ1
bnRpbWVfaWRsZSgpIGNhbGxiYWNrLCBwbV9ydW50aW1lX3B1dCgpIGlzDQpsaXRlcmFsbHkgZXF1
aXZhbGVudCB0byBwbV9ydW50aW1lX3B1dF9hdXRvc3VzcGVuZCgpLg0KDQpTbyByZWFsbHkgdGhl
IHF1ZXN0aW9uIGlzIHdoeSBhbnlvbmUgd2hvIGRvZXNuJ3QgcHJvdmlkZSBhDQoucnVudGltZV9p
ZGxlKCkgY2FsbGJhY2sgYm90aGVycyB3aXRoIHVzaW5nIHRoaXMgc3BlY2lhbA0KcG1fcnVudGlt
ZV9wdXRfYXV0b3N1c3BlbmQoKSB0aGluZywgd2hpY2ggcmVhbGx5IG1lYW5zICJkbyBhDQpydW50
aW1lX3B1dCgpLCBidXQgc2tpcCBteSAucnVudGltZV9pZGxlKCkgY2FsbGJhY2siLg0KDQo+ID4N
Cj4gPiA+DQo+ID4gPiBNb3Jlb3ZlciwgaXQncyBzaW1pbGFyIGZvciBwbV9ydW50aW1lX21hcmtf
bGFzdF9idXN5KCksIGl0J3MgY2FsbGVkDQo+ID4gPiBkdXJpbmcgcnBtX3Jlc3VtZSgpIHRvbywg
Zm9yIGV4YW1wbGUuIFNvIHdoeSBib3RoZXIgYWJvdXQgaGF2aW5nDQo+ID4gPiAibWFya19sYXN0
X2J1c3kiIGluIHRoZSBuZXcgbmFtZSB0b28uDQo+ID4gPg0KPiA+ID4gVGhhdCBzYWlkLCBteSBz
dWdnZXN0aW9uIGlzIHNpbXBseSAicG1fcnVudGltZV9wdXRfc3VzcGVuZCIuDQo+ID4NCj4gPiBD
YW4gd2UgZG8gZXZlbiBiZXR0ZXIsIGFuZCBtYWtlIHBtX3J1bnRpbWVfcHV0KCkgdG8gaGFuZGxl
IGF1dG9zdXNwZW5kDQo+ID4gYXV0b21hdGljYWxseSB3aGVuIGF1dG9zdXNwZW5kIGlzIGVuYWJs
ZWQgPw0KPg0KPiBBcyBzdGF0ZWQgYWJvdmUsIHRoaXMgaXMgYWxyZWFkeSB0aGUgY2FzZS4NCg0K
V2hhdCByZWFsbHkgaXMgbmVlZGVkIGFwcGVhcnMgdG8gYmUgYSBjb21iaW5hdGlvbiBvZg0KcG1f
cnVudGltZV9tYXJrX2xhc3RfYnVzeSgpIHdpdGggcG1fcnVudGltZV9wdXQoKS4NCg0KR3JhbnRl
ZCwgcG1fcnVudGltZV9wdXQoKSBjb3VsZCBkbyB0aGUgcG1fcnVudGltZV9tYXJrX2xhc3RfYnVz
eSgpDQp0aGluZyBhdXRvbWF0aWNhbGx5IGlmIGF1dG9zdXNwZW5kIGlzIGVuYWJsZWQgYW5kIHRo
ZSBvbmx5IGNvbnNlcXVlbmNlDQpvZiBpdCBtaWdodCBiZSBkZWxheWluZyBhIHN1c3BlbmQgb2Yg
dGhlIGRldmljZSB1bnRpbCBpdHMgYXV0b3N1c3BlbmQNCnRpbWVyIGV4cGlyZXMsIHdoaWNoIHNo
b3VsZCBub3QgYmUgYSBwcm9ibGVtIGluIHRoZSB2YXN0IG1ham9yaXR5IG9mDQpjYXNlcy4NCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmdyZXlidXMtZGV2
IG1haWxpbmcgbGlzdCAtLSBncmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3JnClRvIHVuc3Vic2Ny
aWJlIHNlbmQgYW4gZW1haWwgdG8gZ3JleWJ1cy1kZXYtbGVhdmVAbGlzdHMubGluYXJvLm9yZwo=
