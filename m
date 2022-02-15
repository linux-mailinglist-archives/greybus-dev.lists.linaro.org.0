Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id DB6894B749C
	for <lists+greybus-dev@lfdr.de>; Tue, 15 Feb 2022 20:19:43 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 18A483EE8A
	for <lists+greybus-dev@lfdr.de>; Tue, 15 Feb 2022 19:19:43 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	by lists.linaro.org (Postfix) with ESMTPS id 9A34F3ECD6;
	Tue, 15 Feb 2022 19:19:40 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3A349617A1;
	Tue, 15 Feb 2022 19:19:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E76B9C340EB;
	Tue, 15 Feb 2022 19:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1644952780;
	bh=RxAYLCqbUWlxjV9GFahzPwnkRBYKU9aVJMxo+INb+K8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oa82FKq0/HZo1Hieccox0xhuEOltsBpyNCb/oKWHfz9JimsfI5qrPFHosVG+Hw9KD
	 FqjMZvJ5BquXlsEM1IUTOugfyhHJjbL+NoooCvHgJp/wzFU4N6mJ3/+qfEy0h1bhbj
	 fv9Bo5w4LHHM1g+pM9OlS1+FV6MX0/N+Aa88X5OzELy65s1Xs5Q/258d9WBNoUp0fb
	 HMGG+vm/A6PvbbvtXJ00MB45hauRqyRZCekvmCmXYRktZmaEtd9qOIjTryp50cyo1/
	 0DT+ajNam/uql+1lfstz9xW/6FSdwogqLIyHb8bwuPl3b0gveaOfCnpwJkPBK0mL1q
	 tCTR2Et3rHU/g==
Date: Tue, 15 Feb 2022 21:19:29 +0200
From: Leon Romanovsky <leon@kernel.org>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Message-ID: <Ygv8wY75hNqS7zO6@unreal>
References: <20220215174743.GA878920@embeddedor>
 <202202151016.C0471D6E@keescook>
 <20220215192110.GA883653@embeddedor>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220215192110.GA883653@embeddedor>
Message-ID-Hash: KH26SPJ6EQ2FWRSGLGGZ2OPCG5CE5FM3
X-Message-ID-Hash: KH26SPJ6EQ2FWRSGLGGZ2OPCG5CE5FM3
X-MailFrom: leon@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Kees Cook <keescook@chromium.org>, GR-QLogic-Storage-Upstream@marvell.com, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, linux-ia64@vger.kernel.org, linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, linux-um@lists.infradead.org, linux-xtensa@linux-xtensa.org, linux-crypto@vger.kernel.org, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com, netdev@vger.kernel.org, linux-omap@vger.kernel.org, linux-scsi@vger.kernel.org, target-devel@vger.kernel.org, mpi3mr-linuxdrv.pdl@broadcom.com, linux-staging@lists.linux.dev, linux-rpi-kernel@lists.infradead.org, sparmaintainer@unisys.com, linux-cifs@vger.kernel.org, samba-technical@lists.samba.org, linux-ext4@vger.kernel.org, linux-acpi@vger.kernel.org, devel@acpica.org, linux-arch@vger.kernel.org, linux-mm@kvack.org, greybus-dev@lists.linaro.org, linu
 x-i3c@lists.infradead.org, linux-rdma@vger.kernel.org, linux-bluetooth@vger.kernel.org, alsa-devel@alsa-project.org, devicetree@vger.kernel.org, linux-perf-users@vger.kernel.org, linux-hardening@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH][next] treewide: Replace zero-length arrays with flexible-array members
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/KH26SPJ6EQ2FWRSGLGGZ2OPCG5CE5FM3/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gVHVlLCBGZWIgMTUsIDIwMjIgYXQgMDE6MjE6MTBQTSAtMDYwMCwgR3VzdGF2byBBLiBSLiBT
aWx2YSB3cm90ZToNCj4gT24gVHVlLCBGZWIgMTUsIDIwMjIgYXQgMTA6MTc6NDBBTSAtMDgwMCwg
S2VlcyBDb29rIHdyb3RlOg0KPiA+IE9uIFR1ZSwgRmViIDE1LCAyMDIyIGF0IDExOjQ3OjQzQU0g
LTA2MDAsIEd1c3Rhdm8gQS4gUi4gU2lsdmEgd3JvdGU6DQo+ID4gPiBUaGVyZSBpcyBhIHJlZ3Vs
YXIgbmVlZCBpbiB0aGUga2VybmVsIHRvIHByb3ZpZGUgYSB3YXkgdG8gZGVjbGFyZQ0KPiA+ID4g
aGF2aW5nIGEgZHluYW1pY2FsbHkgc2l6ZWQgc2V0IG9mIHRyYWlsaW5nIGVsZW1lbnRzIGluIGEg
c3RydWN0dXJlLg0KPiA+ID4gS2VybmVsIGNvZGUgc2hvdWxkIGFsd2F5cyB1c2Ug4oCcZmxleGli
bGUgYXJyYXkgbWVtYmVyc+KAnVsxXSBmb3IgdGhlc2UNCj4gPiA+IGNhc2VzLiBUaGUgb2xkZXIg
c3R5bGUgb2Ygb25lLWVsZW1lbnQgb3IgemVyby1sZW5ndGggYXJyYXlzIHNob3VsZA0KPiA+ID4g
bm8gbG9uZ2VyIGJlIHVzZWRbMl0uDQo+ID4gPiANCj4gPiA+IFRoaXMgY29kZSB3YXMgdHJhbnNm
b3JtZWQgd2l0aCB0aGUgaGVscCBvZiBDb2NjaW5lbGxlOg0KPiA+ID4gKG5leHQtMjAyMjAyMTQk
IHNwYXRjaCAtLWpvYnMgJChnZXRjb25mIF9OUFJPQ0VTU09SU19PTkxOKSAtLXNwLWZpbGUgc2Ny
aXB0LmNvY2NpIC0taW5jbHVkZS1oZWFkZXJzIC0tZGlyIC4gPiBvdXRwdXQucGF0Y2gpDQo+ID4g
PiANCj4gPiA+IEBADQo+ID4gPiBpZGVudGlmaWVyIFMsIG1lbWJlciwgYXJyYXk7DQo+ID4gPiB0
eXBlIFQxLCBUMjsNCj4gPiA+IEBADQo+ID4gPiANCj4gPiA+IHN0cnVjdCBTIHsNCj4gPiA+ICAg
Li4uDQo+ID4gPiAgIFQxIG1lbWJlcjsNCj4gPiA+ICAgVDIgYXJyYXlbDQo+ID4gPiAtIDANCj4g
PiA+ICAgXTsNCj4gPiA+IH07DQo+ID4gDQo+ID4gVGhlc2UgYWxsIGxvb2sgdHJpdmlhbGx5IGNv
cnJlY3QgdG8gbWUuIE9ubHkgdHdvIGRpZG4ndCBoYXZlIHRoZSBlbmQgb2YNCj4gPiB0aGUgc3Ry
dWN0IHZpc2libGUgaW4gdGhlIHBhdGNoLCBhbmQgY2hlY2tpbmcgdGhvc2Ugc2hvd2VkIHRoZW0g
dG8gYmUNCj4gPiB0cmFpbGluZyBtZW1iZXJzIGFzIHdlbGwsIHNvOg0KPiA+IA0KPiA+IFJldmll
d2VkLWJ5OiBLZWVzIENvb2sgPGtlZXNjb29rQGNocm9taXVtLm9yZz4NCj4gDQo+IEknbGwgYWRk
IHRoaXMgdG8gbXkgLW5leHQgdHJlZS4NCg0KSSB3b3VsZCBsaWtlIHRvIGFzayB5b3UgdG8gc2Vu
ZCBtbHg1IHBhdGNoIHNlcGFyYXRlbHkgdG8gbmV0ZGV2LiBXZSBhcmUgd29ya2luZw0KdG8gZGVs
ZXRlIHRoYXQgZmlsZSBjb21wbGV0ZWx5IGFuZCBwcmVmZXIgdG8gYXZvaWQgZnJvbSB1bm5lY2Vz
c2FyeSBtZXJnZSBjb25mbGljdHMuDQoNClRoYW5rcw0KDQo+IA0KPiBUaGFua3MhDQo+IC0tDQo+
IEd1c3Rhdm8NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmdyZXlidXMtZGV2IG1haWxpbmcgbGlzdCAtLSBncmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3Jn
ClRvIHVuc3Vic2NyaWJlIHNlbmQgYW4gZW1haWwgdG8gZ3JleWJ1cy1kZXYtbGVhdmVAbGlzdHMu
bGluYXJvLm9yZwo=
