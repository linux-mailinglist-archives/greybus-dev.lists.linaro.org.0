Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A2C64B7495
	for <lists+greybus-dev@lfdr.de>; Tue, 15 Feb 2022 20:13:42 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 7AFDA3EE82
	for <lists+greybus-dev@lfdr.de>; Tue, 15 Feb 2022 19:13:41 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	by lists.linaro.org (Postfix) with ESMTPS id 5E07F3ED2A;
	Tue, 15 Feb 2022 19:13:38 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 2784BB81C66;
	Tue, 15 Feb 2022 19:13:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA149C340EB;
	Tue, 15 Feb 2022 19:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1644952415;
	bh=aWKfLj+OcuQ7ORm2NzKcSLdWPXwTMvCyCCSlhItZJdc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Pb9b+lIl3czsbILZx4JGaHKfxai5nhmkbafSdXIePkm1+42+PtZWRvtnxsIxieHjT
	 9ekyHuwvisvcr9fVX07+lClUNa2p0vhktIvKZSAjwuXs2gg0KwuzJxVI1eJwsCEsx9
	 QAqj6xuEKLMkpaRxHB9Jbh5UZNn3lhP/U/32rVpI9FJi1e5LJ0Z2HLVW0p7KctTIZB
	 uH0ohVDX/Qm561zC5FzYDM+alYJWObfXnSGwWXg348TFcT9AqtFzE3U54RAksJmBj5
	 t03G17WjapCI9e95mge26r6O7cubp0cNepLCQdTnroGWEV76h8vqtZwzBmUYMX3S66
	 UcWCeciahTo0A==
Date: Tue, 15 Feb 2022 13:21:10 -0600
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Kees Cook <keescook@chromium.org>
Message-ID: <20220215192110.GA883653@embeddedor>
References: <20220215174743.GA878920@embeddedor>
 <202202151016.C0471D6E@keescook>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <202202151016.C0471D6E@keescook>
Message-ID-Hash: 5NEAMYGBE6IBRRUUWWBPPM5UA2A2W5DB
X-Message-ID-Hash: 5NEAMYGBE6IBRRUUWWBPPM5UA2A2W5DB
X-MailFrom: gustavoars@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: GR-QLogic-Storage-Upstream@marvell.com, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, linux-ia64@vger.kernel.org, linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, linux-um@lists.infradead.org, linux-xtensa@linux-xtensa.org, linux-crypto@vger.kernel.org, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com, netdev@vger.kernel.org, linux-omap@vger.kernel.org, linux-scsi@vger.kernel.org, target-devel@vger.kernel.org, mpi3mr-linuxdrv.pdl@broadcom.com, linux-staging@lists.linux.dev, linux-rpi-kernel@lists.infradead.org, sparmaintainer@unisys.com, linux-cifs@vger.kernel.org, samba-technical@lists.samba.org, linux-ext4@vger.kernel.org, linux-acpi@vger.kernel.org, devel@acpica.org, linux-arch@vger.kernel.org, linux-mm@kvack.org, greybus-dev@lists.linaro.org, linux-i3c@lists.infradead.org, linux-rd
 ma@vger.kernel.org, linux-bluetooth@vger.kernel.org, alsa-devel@alsa-project.org, devicetree@vger.kernel.org, linux-perf-users@vger.kernel.org, linux-hardening@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH][next] treewide: Replace zero-length arrays with flexible-array members
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/5NEAMYGBE6IBRRUUWWBPPM5UA2A2W5DB/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gVHVlLCBGZWIgMTUsIDIwMjIgYXQgMTA6MTc6NDBBTSAtMDgwMCwgS2VlcyBDb29rIHdyb3Rl
Og0KPiBPbiBUdWUsIEZlYiAxNSwgMjAyMiBhdCAxMTo0Nzo0M0FNIC0wNjAwLCBHdXN0YXZvIEEu
IFIuIFNpbHZhIHdyb3RlOg0KPiA+IFRoZXJlIGlzIGEgcmVndWxhciBuZWVkIGluIHRoZSBrZXJu
ZWwgdG8gcHJvdmlkZSBhIHdheSB0byBkZWNsYXJlDQo+ID4gaGF2aW5nIGEgZHluYW1pY2FsbHkg
c2l6ZWQgc2V0IG9mIHRyYWlsaW5nIGVsZW1lbnRzIGluIGEgc3RydWN0dXJlLg0KPiA+IEtlcm5l
bCBjb2RlIHNob3VsZCBhbHdheXMgdXNlIOKAnGZsZXhpYmxlIGFycmF5IG1lbWJlcnPigJ1bMV0g
Zm9yIHRoZXNlDQo+ID4gY2FzZXMuIFRoZSBvbGRlciBzdHlsZSBvZiBvbmUtZWxlbWVudCBvciB6
ZXJvLWxlbmd0aCBhcnJheXMgc2hvdWxkDQo+ID4gbm8gbG9uZ2VyIGJlIHVzZWRbMl0uDQo+ID4g
DQo+ID4gVGhpcyBjb2RlIHdhcyB0cmFuc2Zvcm1lZCB3aXRoIHRoZSBoZWxwIG9mIENvY2NpbmVs
bGU6DQo+ID4gKG5leHQtMjAyMjAyMTQkIHNwYXRjaCAtLWpvYnMgJChnZXRjb25mIF9OUFJPQ0VT
U09SU19PTkxOKSAtLXNwLWZpbGUgc2NyaXB0LmNvY2NpIC0taW5jbHVkZS1oZWFkZXJzIC0tZGly
IC4gPiBvdXRwdXQucGF0Y2gpDQo+ID4gDQo+ID4gQEANCj4gPiBpZGVudGlmaWVyIFMsIG1lbWJl
ciwgYXJyYXk7DQo+ID4gdHlwZSBUMSwgVDI7DQo+ID4gQEANCj4gPiANCj4gPiBzdHJ1Y3QgUyB7
DQo+ID4gICAuLi4NCj4gPiAgIFQxIG1lbWJlcjsNCj4gPiAgIFQyIGFycmF5Ww0KPiA+IC0gMA0K
PiA+ICAgXTsNCj4gPiB9Ow0KPiANCj4gVGhlc2UgYWxsIGxvb2sgdHJpdmlhbGx5IGNvcnJlY3Qg
dG8gbWUuIE9ubHkgdHdvIGRpZG4ndCBoYXZlIHRoZSBlbmQgb2YNCj4gdGhlIHN0cnVjdCB2aXNp
YmxlIGluIHRoZSBwYXRjaCwgYW5kIGNoZWNraW5nIHRob3NlIHNob3dlZCB0aGVtIHRvIGJlDQo+
IHRyYWlsaW5nIG1lbWJlcnMgYXMgd2VsbCwgc286DQo+IA0KPiBSZXZpZXdlZC1ieTogS2VlcyBD
b29rIDxrZWVzY29va0BjaHJvbWl1bS5vcmc+DQoNCkknbGwgYWRkIHRoaXMgdG8gbXkgLW5leHQg
dHJlZS4NCg0KVGhhbmtzIQ0KLS0NCkd1c3Rhdm8NCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmdyZXlidXMtZGV2IG1haWxpbmcgbGlzdCAtLSBncmV5YnVz
LWRldkBsaXN0cy5saW5hcm8ub3JnClRvIHVuc3Vic2NyaWJlIHNlbmQgYW4gZW1haWwgdG8gZ3Jl
eWJ1cy1kZXYtbGVhdmVAbGlzdHMubGluYXJvLm9yZwo=
