Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 3378B87F000
	for <lists+greybus-dev@lfdr.de>; Mon, 18 Mar 2024 19:55:45 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 3007940D2B
	for <lists+greybus-dev@lfdr.de>; Mon, 18 Mar 2024 18:55:44 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	by lists.linaro.org (Postfix) with ESMTPS id 9FB833F090
	for <greybus-dev@lists.linaro.org>; Mon, 18 Mar 2024 18:55:41 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b="GoRAe/t5";
	dmarc=pass (policy=none) header.from=linuxfoundation.org;
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 145.40.73.55 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id ABC29CE0B32;
	Mon, 18 Mar 2024 18:55:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B88CEC43390;
	Mon, 18 Mar 2024 18:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1710788137;
	bh=I81m1u3/gCGGvR+mJK7Lbsg9hTItXoG0ObMM/YWSWRg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GoRAe/t5gnCYRr4W2+XxQic8Y6xH09gwfXPD5Ta4nNmIMvaDKSWQOqbHa8/Tq6bQu
	 694lYsH9NoB9QPxSl8bNuUi0DUIr67W8GxGvn/zZ4J0vVgPM4mIptyEjWcqUQp0iG/
	 DzzRMwvPwXEn11MZ7EmGkDE33RmJ8ajp03tiCvto=
Date: Mon, 18 Mar 2024 19:55:33 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Alex Elder <elder@ieee.org>
Message-ID: <2024031818-lizard-actress-2279@gregkh>
References: <20240317193714.403132-5-ayushdevel1325@gmail.com>
 <4fe6f68a-786c-4e3d-b97d-847d6965d1d3@web.de>
 <3eb9d5c2-149c-460c-9684-3fdaf946c400@ieee.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3eb9d5c2-149c-460c-9684-3fdaf946c400@ieee.org>
X-Rspamd-Queue-Id: 9FB833F090
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.00 / 15.00];
	REPLY(-4.00)[];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:145.40.73.55];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MIME_GOOD(-0.10)[text/plain];
	MISSING_XM_UA(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:54825, ipnet:145.40.73.0/24, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FREEMAIL_CC(0.00)[web.de,gmail.com,beagleboard.org,vger.kernel.org,lists.infradead.org,lists.linaro.org,kernel.org,arndb.de,amd.com,linaro.org,ti.com];
	TAGGED_RCPT(0.00)[dt];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DWL_DNSWL_BLOCKED(0.00)[linuxfoundation.org:dkim];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: JYHFYAMWVWDVDICEJJUPHEVLLBZO4S75
X-Message-ID-Hash: JYHFYAMWVWDVDICEJJUPHEVLLBZO4S75
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Markus Elfring <Markus.Elfring@web.de>, Ayush Singh <ayushdevel1325@gmail.com>, Vaishnav M A <vaishnav@beagleboard.org>, devicetree@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, lorforlinux@beagleboard.org, greybus-dev@lists.linaro.org, LKML <linux-kernel@vger.kernel.org>, Alex Elder <elder@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Conor Dooley <conor+dt@kernel.org>, Derek Kiernan <derek.kiernan@amd.com>, Dragan Cvetic <dragan.cvetic@amd.com>, Johan Hovold <johan@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Mark Brown <broonie@kernel.org>, Nishanth Menon <nm@ti.com>, Rob Herring <robh@kernel.org>, Robert Nelson <robertcnelson@beagleboard.org>, Tero Kristo <kristo@kernel.org>, Vaishnav M A <vaishnav.a@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v4 4/5] mikrobus: Add mikroBUS driver
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/JYHFYAMWVWDVDICEJJUPHEVLLBZO4S75/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gTW9uLCBNYXIgMTgsIDIwMjQgYXQgMDE6NDE6MzhQTSAtMDUwMCwgQWxleCBFbGRlciB3cm90
ZToNCj4gT24gMy8xOC8yNCAxMjo1OCBQTSwgTWFya3VzIEVsZnJpbmcgd3JvdGU6DQo+ID4g4oCm
DQo+ID4gPiArKysgYi9kcml2ZXJzL21pc2MvbWlrcm9idXMvbWlrcm9idXNfY29yZS5jDQo+ID4g
4oCmDQo+ID4gPiArc3RhdGljIGludCBtaWtyb2J1c19waW5jdHJsX3NldHVwKHN0cnVjdCBtaWty
b2J1c19wb3J0ICpwb3J0LA0KPiA+ID4gKwkJCQkgIHN0cnVjdCBhZGRvbl9ib2FyZF9pbmZvICpi
b2FyZCkNCj4gPiA+ICt7DQo+ID4gPiArCWludCByZXQ7DQo+ID4gPiArDQo+ID4gPiArCWlmICgh
Ym9hcmQgfHwgYm9hcmQtPnBpbl9zdGF0ZVtNSUtST0JVU19QSU5fUFdNXSA9PSBNSUtST0JVU19T
VEFURV9QV00pDQo+ID4gPiArCQlyZXQgPSBtaWtyb2J1c19waW5jdHJsX3NlbGVjdChwb3J0LCAi
cHdtX2RlZmF1bHQiKTsNCj4gPiA+ICsJZWxzZQ0KPiA+ID4gKwkJcmV0ID0gbWlrcm9idXNfcGlu
Y3RybF9zZWxlY3QocG9ydCwgInB3bV9ncGlvIik7DQo+ID4g4oCmDQo+ID4gDQo+ID4gSG93IGRv
IHlvdSB0aGluayBhYm91dCB0byBhdm9pZCB0aGUgc3BlY2lmaWNhdGlvbiBvZiBhIGJpdCBvZiBk
dXBsaWNhdGUgc291cmNlIGNvZGUgaGVyZQ0KPiA+IGJ5IHVzaW5nIGNvbmRpdGlvbmFsIG9wZXJh
dG9yIGV4cHJlc3Npb25zPw0KPiA+IA0KPiA+IAlyZXQgPSBtaWtyb2J1c19waW5jdHJsX3NlbGVj
dChwb3J0LA0KPiA+IAkJCQkgICAgICAoKCFib2FyZCB8fA0KPiA+IAkJCQkJYm9hcmQtPnBpbl9z
dGF0ZVtNSUtST0JVU19QSU5fUFdNXSA9PSBNSUtST0JVU19TVEFURV9QV00pDQo+ID4gCQkJCSAg
ICAgID8gInB3bV9kZWZhdWx0Ig0KPiA+IAkJCQkgICAgICA6ICJwd21fZ3BpbyIpKTsNCj4gDQo+
IE5vLg0KPiANCj4gSXQncyBhIGNvbXBsZXggZW5vdWdoIGJpdCBvZiBsb2dpYyB3aXRob3V0IHRy
eWluZyB0byBidXJ5DQo+IGl0IGluc2lkZSB0aGUgcGFyYW1ldGVycyBwYXNzZWQgdG8gdGhlIGZ1
bmN0aW9uLg0KDQpIaSwNCg0KVGhpcyBpcyB0aGUgc2VtaS1mcmllbmRseSBwYXRjaC1ib3Qgb2Yg
R3JlZyBLcm9haC1IYXJ0bWFuLg0KDQpNYXJrdXMsIHlvdSBzZWVtIHRvIGhhdmUgc2VudCBhIG5v
bnNlbnNpY2FsIG9yIG90aGVyd2lzZSBwb2ludGxlc3MNCnJldmlldyBjb21tZW50IHRvIGEgcGF0
Y2ggc3VibWlzc2lvbiBvbiBhIExpbnV4IGtlcm5lbCBkZXZlbG9wZXIgbWFpbGluZw0KbGlzdC4g
IEkgc3Ryb25nbHkgc3VnZ2VzdCB0aGF0IHlvdSBub3QgZG8gdGhpcyBhbnltb3JlLiAgUGxlYXNl
IGRvIG5vdA0KYm90aGVyIGRldmVsb3BlcnMgd2hvIGFyZSBhY3RpdmVseSB3b3JraW5nIHRvIHBy
b2R1Y2UgcGF0Y2hlcyBhbmQNCmZlYXR1cmVzIHdpdGggY29tbWVudHMgdGhhdCwgaW4gdGhlIGVu
ZCwgYXJlIGEgd2FzdGUgb2YgdGltZS4NCg0KUGF0Y2ggc3VibWl0dGVyLCBwbGVhc2UgaWdub3Jl
IE1hcmt1cydzIHN1Z2dlc3Rpb247IHlvdSBkbyBub3QgbmVlZCB0bw0KZm9sbG93IGl0IGF0IGFs
bC4gIFRoZSBwZXJzb24vYm90L0FJIHRoYXQgc2VudCBpdCBpcyBiZWluZyBpZ25vcmVkIGJ5DQph
bG1vc3QgYWxsIExpbnV4IGtlcm5lbCBtYWludGFpbmVycyBmb3IgaGF2aW5nIGEgcGVyc2lzdGVu
dCBwYXR0ZXJuIG9mDQpiZWhhdmlvciBvZiBwcm9kdWNpbmcgZGlzdHJhY3RpbmcgYW5kIHBvaW50
bGVzcyBjb21tZW50YXJ5LCBhbmQNCmluYWJpbGl0eSB0byBhZGFwdCB0byBmZWVkYmFjay4gIFBs
ZWFzZSBmZWVsIGZyZWUgdG8gYWxzbyBpZ25vcmUgZW1haWxzDQpmcm9tIHRoZW0uDQoNCnRoYW5r
cywNCg0KZ3JlZyBrLWgncyBwYXRjaCBlbWFpbCBib3QNCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmdyZXlidXMtZGV2IG1haWxpbmcgbGlzdCAtLSBncmV5
YnVzLWRldkBsaXN0cy5saW5hcm8ub3JnClRvIHVuc3Vic2NyaWJlIHNlbmQgYW4gZW1haWwgdG8g
Z3JleWJ1cy1kZXYtbGVhdmVAbGlzdHMubGluYXJvLm9yZwo=
