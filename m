Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id C6F58D17BE9
	for <lists+greybus-dev@lfdr.de>; Tue, 13 Jan 2026 10:45:35 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 551D84014A
	for <lists+greybus-dev@lfdr.de>; Tue, 13 Jan 2026 09:45:31 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by lists.linaro.org (Postfix) with ESMTPS id 55D413F776
	for <greybus-dev@lists.linaro.org>; Tue, 13 Jan 2026 09:45:29 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=luqg7yPT;
	spf=pass (lists.linaro.org: domain of johan@kernel.org designates 172.105.4.254 as permitted sender) smtp.mailfrom=johan@kernel.org;
	dmarc=pass (policy=quarantine) header.from=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E10A660017;
	Tue, 13 Jan 2026 09:45:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9278CC116C6;
	Tue, 13 Jan 2026 09:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768297528;
	bh=35I9oINNVs7iLA3lBqvq0zhW8rY/MhsKQbBOk10n5w8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=luqg7yPTP6RGJ0PL2AbIKdwKrwrfCdMRL8rw+oGlosr7PIGsuwC8LR/gRI4Xu1flJ
	 p6SUPF6xNMTOqhdBobwGW6b77JXZ4WN/t4ccK8UxT0jPSpvnnNE/8p7hyukLDCi0X+
	 FJH1qKpskhaABUEMuvCwdwLbDPnDz1+nJc5bTNZSKKJk+1LmBJzFMkr7htP8OgDA7p
	 U4OJBk/mz20TjQZdXC7Lu4yNhxBlUt/skzZkdPTWzvvYxCYH2dqxyX0dCbV4j3jhwf
	 +LvV12TW1OdLQ4BF2441U2fmOxy2m69xdAoKU4uyjBvuKaC3elcL6FIfg3U+iRl24D
	 ePEZrqIIXCgpA==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vfaxk-0000000065Z-3NRw;
	Tue, 13 Jan 2026 10:45:21 +0100
Date: Tue, 13 Jan 2026 10:45:20 +0100
From: Johan Hovold <johan@kernel.org>
To: Marco Crivellari <marco.crivellari@suse.com>
Message-ID: <aWYUMO4lwV_Az7Im@hovoldconsulting.com>
References: <20251112152710.207577-1-marco.crivellari@suse.com>
 <CAAofZF5-u52f5Z79GcGM_dp2Z6VsPhtz7ZWKDhim5UjO38pfpQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAofZF5-u52f5Z79GcGM_dp2Z6VsPhtz7ZWKDhim5UjO38pfpQ@mail.gmail.com>
X-Rspamd-Queue-Id: 55D413F776
X-Spamd-Bar: ---
X-Spamd-Result: default: False [-4.00 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.4.254];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.0.0/19, country:SG];
	RCPT_COUNT_SEVEN(0.00)[10];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	DWL_DNSWL_BLOCKED(0.00)[kernel.org:dkim];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.linaro.org,kernel.org,gmail.com,linutronix.de,suse.com,linuxfoundation.org];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: O2JUQRBQ4CWT3ODEFCLLHO2MQHLMTWY6
X-Message-ID-Hash: O2JUQRBQ4CWT3ODEFCLLHO2MQHLMTWY6
X-MailFrom: johan@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: linux-kernel@vger.kernel.org, greybus-dev@lists.linaro.org, Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, Frederic Weisbecker <frederic@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Michal Hocko <mhocko@suse.com>, Alex Elder <elder@kernel.org>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v2] greybus: add WQ_PERCPU to alloc_workqueue users
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/O2JUQRBQ4CWT3ODEFCLLHO2MQHLMTWY6/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gV2VkLCBEZWMgMjQsIDIwMjUgYXQgMDQ6MjA6NTJQTSArMDEwMCwgTWFyY28gQ3JpdmVsbGFy
aSB3cm90ZToNCj4gT24gV2VkLCBOb3YgMTIsIDIwMjUgYXQgNDoyN+KAr1BNIE1hcmNvIENyaXZl
bGxhcmkNCj4gPG1hcmNvLmNyaXZlbGxhcmlAc3VzZS5jb20+IHdyb3RlOg0KPiA+IFsuLi5dDQo+
ID4gIGRyaXZlcnMvZ3JleWJ1cy9vcGVyYXRpb24uYyB8IDIgKy0NCj4gPiAgMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncmV5YnVzL29wZXJhdGlvbi5jIGIvZHJpdmVycy9ncmV5YnVzL29wZXJhdGlvbi5j
DQo+ID4gaW5kZXggNTRjY2M0MzRhMWY3Li43ZTEyZmZiMmRkNjAgMTAwNjQ0DQo+ID4gLS0tIGEv
ZHJpdmVycy9ncmV5YnVzL29wZXJhdGlvbi5jDQo+ID4gKysrIGIvZHJpdmVycy9ncmV5YnVzL29w
ZXJhdGlvbi5jDQo+ID4gQEAgLTEyMzgsNyArMTIzOCw3IEBAIGludCBfX2luaXQgZ2Jfb3BlcmF0
aW9uX2luaXQodm9pZCkNCj4gPiAgICAgICAgICAgICAgICAgZ290byBlcnJfZGVzdHJveV9tZXNz
YWdlX2NhY2hlOw0KPiA+DQo+ID4gICAgICAgICBnYl9vcGVyYXRpb25fY29tcGxldGlvbl93cSA9
IGFsbG9jX3dvcmtxdWV1ZSgiZ3JleWJ1c19jb21wbGV0aW9uIiwNCj4gPiAtICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDAsIDApOw0KPiA+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgV1FfUEVSQ1BV
LCAwKTsNCj4gPiAgICAgICAgIGlmICghZ2Jfb3BlcmF0aW9uX2NvbXBsZXRpb25fd3EpDQo+ID4g
ICAgICAgICAgICAgICAgIGdvdG8gZXJyX2Rlc3Ryb3lfb3BlcmF0aW9uX2NhY2hlOw0KPiA+DQo+
IA0KPiBHZW50bGUgcGluZy4NCg0KT24gQ2hyaXN0bWFzIEV2ZT8NCg0KSXQnbGwgYmUgcGlja2Vk
IHVwIGJ5IGV2ZW50dWFsbHkgbm93IHRoYXQgcGVvcGxlIGFyZSBiYWNrIGZyb20NCmNvbmZlcmVu
Y2VzIGFuZCBob2xpZGF5Lg0KDQpKb2hhbg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZ3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0IC0tIGdyZXlidXMtZGV2
QGxpc3RzLmxpbmFyby5vcmcKVG8gdW5zdWJzY3JpYmUgc2VuZCBhbiBlbWFpbCB0byBncmV5YnVz
LWRldi1sZWF2ZUBsaXN0cy5saW5hcm8ub3JnCg==
