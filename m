Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A0EED17DBE
	for <lists+greybus-dev@lfdr.de>; Tue, 13 Jan 2026 11:06:55 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 63EFF40150
	for <lists+greybus-dev@lfdr.de>; Tue, 13 Jan 2026 10:06:54 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by lists.linaro.org (Postfix) with ESMTPS id 59CAC3F776
	for <greybus-dev@lists.linaro.org>; Tue, 13 Jan 2026 10:06:52 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=illZs1iE;
	spf=pass (lists.linaro.org: domain of johan@kernel.org designates 172.105.4.254 as permitted sender) smtp.mailfrom=johan@kernel.org;
	dmarc=pass (policy=quarantine) header.from=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B59CF6000A;
	Tue, 13 Jan 2026 10:06:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 670E9C116C6;
	Tue, 13 Jan 2026 10:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768298811;
	bh=uHaCt70arjhBzr371P7SY/ffODMWV2aLD/P+p/XwMbI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=illZs1iENOAIyx/+dVsvT6M91TcaR27POX7cTRDmJJkx0LNodDVBtzZYJiFy6iZG9
	 yCll1KMkMr1GhA3ShKl1oLyVLJs3/3da/LSYrFdARCNRNBS9HeTjOrakiPpEqQuNBY
	 XXUdc9rxFEsw5+rcON9Q+tosB29VEYHkpJC7W2O0ChrYkWWp6LjycDkIoarU4SzRFL
	 aLbrTFmY1grk+AEBq/tigbv9sPXV6f2nj1J2TrYcZSGdCYcGApaqNULAuTbZeXz81L
	 bpmQsAOx2HDI4mNYCYH1p5KHkFUPZ0PKQZSGnTHogHLn3CI1FO/hnoeqJmJqa0hziz
	 Du5ACkPlLb1ow==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vfbIR-000000006lh-2HLB;
	Tue, 13 Jan 2026 11:06:44 +0100
Date: Tue, 13 Jan 2026 11:06:43 +0100
From: Johan Hovold <johan@kernel.org>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Message-ID: <aWYZM-c1XcvD6LPw@hovoldconsulting.com>
References: <20251210175943.590059-2-u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251210175943.590059-2-u.kleine-koenig@baylibre.com>
X-Rspamd-Queue-Id: 59CAC3F776
X-Spamd-Bar: ---
X-Spamd-Result: default: False [-4.00 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.4.254];
	MIME_GOOD(-0.10)[text/plain];
	DWL_DNSWL_NONE(0.00)[kernel.org:dkim];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.0.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DNSWL_BLOCKED(0.00)[172.105.4.254:from,100.75.92.58:received];
	URIBL_BLOCKED(0.00)[hovoldconsulting.com:mid,baylibre.com:email];
	DKIM_TRACE(0.00)[kernel.org:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: AG6OU7JDJWCP3XT3OS2YOBJVF3FHARHY
X-Message-ID-Hash: AG6OU7JDJWCP3XT3OS2YOBJVF3FHARHY
X-MailFrom: johan@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] greybus: Use bus methods for .probe() and .remove()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/AG6OU7JDJWCP3XT3OS2YOBJVF3FHARHY/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gV2VkLCBEZWMgMTAsIDIwMjUgYXQgMDY6NTk6MzlQTSArMDEwMCwgVXdlIEtsZWluZS1Lw7Zu
aWcgd3JvdGU6DQo+IFRoZXNlIGFyZSBuZWFybHkgaWRlbnRpY2FsIHRvIHRoZSByZXNwZWN0aXZl
IGRyaXZlciBjYWxsYmFja3MuIFRoZSBvbmx5DQo+IGRpZmZlcmVuY2UgaXMgdGhhdCAucmVtb3Zl
KCkgcmV0dXJucyB2b2lkIGluc3RlYWQgb2YgaW50Lg0KPiANCj4gVGhlIG9iamVjdGl2ZSBpcyB0
byBnZXQgcmlkIG9mIHVzZXJzIG9mIHN0cnVjdCBkZXZpY2VfZHJpdmVyIGNhbGxiYWNrcw0KPiAu
cHJvYmUoKSBhbmQgLnJlbW92ZSgpIHRvIGV2ZW50dWFsbHkgcmVtb3ZlIHRoZXNlLg0KPiANCj4g
U2lnbmVkLW9mZi1ieTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BiYXlsaWJy
ZS5jb20+DQogDQo+IC1jb25zdCBzdHJ1Y3QgYnVzX3R5cGUgZ3JleWJ1c19idXNfdHlwZSA9IHsN
Cj4gLQkubmFtZSA9CQkiZ3JleWJ1cyIsDQo+IC0JLm1hdGNoID0JZ3JleWJ1c19tYXRjaF9kZXZp
Y2UsDQo+IC0JLnVldmVudCA9CWdyZXlidXNfdWV2ZW50LA0KPiAtCS5zaHV0ZG93biA9CWdyZXli
dXNfc2h1dGRvd24sDQo+IC19Ow0KPiAtDQogDQo+ICtjb25zdCBzdHJ1Y3QgYnVzX3R5cGUgZ3Jl
eWJ1c19idXNfdHlwZSA9IHsNCj4gKwkubmFtZSA9ICJncmV5YnVzIiwNCj4gKwkubWF0Y2ggPSBn
cmV5YnVzX21hdGNoX2RldmljZSwNCj4gKwkudWV2ZW50ID0gZ3JleWJ1c191ZXZlbnQsDQo+ICsJ
LnByb2JlID0gZ3JleWJ1c19wcm9iZSwNCj4gKwkucmVtb3ZlID0gZ3JleWJ1c19yZW1vdmUsDQo+
ICsJLnNodXRkb3duID0gZ3JleWJ1c19zaHV0ZG93biwNCj4gK307DQo+ICsNCg0KUGxlYXNlIGtl
ZXAgdGhlIGluZGVudGF0aW9uIHN0eWxlIHdoZW4gbW92aW5nIHRoZSBzdHJ1Y3QuDQoNCldpdGgg
dGhhdCBhZGRyZXNzZWQ6DQoNCkFja2VkLWJ5OiBKb2hhbiBIb3ZvbGQgPGpvaGFuQGtlcm5lbC5v
cmc+DQoNCkpvaGFuDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpncmV5YnVzLWRldiBtYWlsaW5nIGxpc3QgLS0gZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJv
Lm9yZwpUbyB1bnN1YnNjcmliZSBzZW5kIGFuIGVtYWlsIHRvIGdyZXlidXMtZGV2LWxlYXZlQGxp
c3RzLmxpbmFyby5vcmcK
