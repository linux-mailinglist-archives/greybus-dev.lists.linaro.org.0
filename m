Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id C70D1666100
	for <lists+greybus-dev@lfdr.de>; Wed, 11 Jan 2023 17:54:52 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id D20533EF9F
	for <lists+greybus-dev@lfdr.de>; Wed, 11 Jan 2023 16:54:51 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	by lists.linaro.org (Postfix) with ESMTPS id DDE473EF98
	for <greybus-dev@lists.linaro.org>; Wed, 11 Jan 2023 16:54:44 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=NZ2n4T9W;
	spf=pass (lists.linaro.org: domain of johan@kernel.org designates 145.40.68.75 as permitted sender) smtp.mailfrom=johan@kernel.org;
	dmarc=pass (policy=none) header.from=kernel.org
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id BF9D3B81C87;
	Wed, 11 Jan 2023 16:54:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EC4BC433D2;
	Wed, 11 Jan 2023 16:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673456082;
	bh=mXESQehV0wt8kRi6/+LpO/EWbusEEZr0NKPtbWhQXkk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NZ2n4T9WAfM31GVkMr0U+OYQ1Le0CO4szDFcbo43kBez/1J9qnZ9YKq8esW75ezAZ
	 8JfUAS86yxHZ9RhJ0V0pNmj/VY/ORz9S6fCeFssGIrcuF1Xfq9yUTkn3I4Is0Wx2Mc
	 NFzsNx9oyDWOwe61DNPL38/EqDVkfCeFJN2jUfno83iUYhu70LDJ+1tw4eGExWbpbY
	 EOSUDeG+tMj/l65lE9dJr/seo+5C+OIm0cRJdutUZSTltGuxSufv6PYLoSM27KZI6v
	 4KVn8oRKJo1GTkXYra54pA1zq+/IHJ9a5qCkOem0Z3aiYG9t9YXNKYj154cUDU8BE7
	 E8CK13X7gSsBA==
Received: from johan by xi.lan with local (Exim 4.94.2)
	(envelope-from <johan@kernel.org>)
	id 1pFeN6-0003YU-Rv; Wed, 11 Jan 2023 17:54:41 +0100
Date: Wed, 11 Jan 2023 17:54:40 +0100
From: Johan Hovold <johan@kernel.org>
To: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Message-ID: <Y77p0P9YaCwPArxv@hovoldconsulting.com>
References: <20230111142331.34518-1-ilpo.jarvinen@linux.intel.com>
 <20230111142331.34518-12-ilpo.jarvinen@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230111142331.34518-12-ilpo.jarvinen@linux.intel.com>
X-Spamd-Result: default: False [-12.00 / 15.00];
	REPLY(-4.00)[];
	DWL_DNSWL_HI(-3.50)[kernel.org:dkim];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	RCVD_DKIM_ARC_DNSWL_HI(-1.00)[];
	RCVD_IN_DNSWL_HI(-1.00)[145.40.68.75:from,52.25.139.140:received];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,none];
	R_SPF_ALLOW(-0.20)[+a:ams.source.kernel.org];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.10)[text/plain];
	ASN(0.00)[asn:54825, ipnet:145.40.68.0/24, country:US];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,linuxfoundation.org,kernel.org,igalia.com,enneenne.com,arndb.de,linaro.org,gmail.com,pengutronix.de,nxp.com,lists.linaro.org,lists.linux.dev,lists.ozlabs.org,lists.infradead.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[kernel.org:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: DDE473EF98
X-Spamd-Bar: ------------
Message-ID-Hash: JIJHKXAL6NXBJ766COCEGBKYBWNDF3IK
X-Message-ID-Hash: JIJHKXAL6NXBJ766COCEGBKYBWNDF3IK
X-MailFrom: johan@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: linux-serial@vger.kernel.org, Jiri Slaby <jirislaby@kernel.org>, Samuel Iglesias =?utf-8?Q?Gons=C3=A1lvez?= <siglesias@igalia.com>, Rodolfo Giometti <giometti@enneenne.com>, Arnd Bergmann <arnd@arndb.de>, Ulf Hansson <ulf.hansson@linaro.org>, David Lin <dtwlin@gmail.com>, Alex Elder <elder@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v3 11/13] tty/serial: Call ->dtr_rts() parameter active consistently
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/JIJHKXAL6NXBJ766COCEGBKYBWNDF3IK/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gV2VkLCBKYW4gMTEsIDIwMjMgYXQgMDQ6MjM6MjlQTSArMDIwMCwgSWxwbyBKw6RydmluZW4g
d3JvdGU6DQo+IENvbnZlcnQgdmFyaW91cyBwYXJhbWV0ZXIgbmFtZXMgZm9yIC0+ZHRyX3J0cygp
IGFuZCByZWxhdGVkIGZ1bmN0aW9ucw0KPiBmcm9tIG9ub2ZmLCBvbiwgYW5kIHJhaXNlIHRvIGFj
dGl2ZS4NCj4gDQo+IFJldmlld2VkLWJ5OiBKaXJpIFNsYWJ5IDxqaXJpc2xhYnlAa2VybmVsLm9y
Zz4NCj4gU2lnbmVkLW9mZi1ieTogSWxwbyBKw6RydmluZW4gPGlscG8uamFydmluZW5AbGludXgu
aW50ZWwuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvY2hhci9wY21jaWEvc3luY2xpbmtfY3MuYyB8
IDYgKysrLS0tDQo+ICBkcml2ZXJzL21tYy9jb3JlL3NkaW9fdWFydC5jICAgICAgfCA2ICsrKy0t
LQ0KPiAgZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvdWFydC5jICAgIHwgNCArKy0tDQo+ICBkcml2
ZXJzL3R0eS9hbWlzZXJpYWwuYyAgICAgICAgICAgfCA0ICsrLS0NCj4gIGRyaXZlcnMvdHR5L2h2
Yy9odmNfY29uc29sZS5oICAgICB8IDIgKy0NCj4gIGRyaXZlcnMvdHR5L2h2Yy9odmNfaXVjdi5j
ICAgICAgICB8IDYgKysrLS0tDQo+ICBkcml2ZXJzL3R0eS9teHNlci5jICAgICAgICAgICAgICAg
fCA0ICsrLS0NCj4gIGRyaXZlcnMvdHR5L25fZ3NtLmMgICAgICAgICAgICAgICB8IDQgKystLQ0K
PiAgZHJpdmVycy90dHkvc2VyaWFsL3NlcmlhbF9jb3JlLmMgIHwgOCArKysrLS0tLQ0KPiAgZHJp
dmVycy90dHkvc3luY2xpbmtfZ3QuYyAgICAgICAgIHwgNCArKy0tDQo+ICBpbmNsdWRlL2xpbnV4
L3R0eV9wb3J0LmggICAgICAgICAgfCA0ICsrLS0NCj4gIGluY2x1ZGUvbGludXgvdXNiL3Nlcmlh
bC5oICAgICAgICB8IDIgKy0NCj4gIDEyIGZpbGVzIGNoYW5nZWQsIDI3IGluc2VydGlvbnMoKyks
IDI3IGRlbGV0aW9ucygtKQ0KDQo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L3R0eV9wb3J0
LmggYi9pbmNsdWRlL2xpbnV4L3R0eV9wb3J0LmgNCj4gaW5kZXggYzQ0ZTQ4OWRlMGZmLi5lZGY2
ODVhMjRmN2MgMTAwNjQ0DQo+IC0tLSBhL2luY2x1ZGUvbGludXgvdHR5X3BvcnQuaA0KPiArKysg
Yi9pbmNsdWRlL2xpbnV4L3R0eV9wb3J0LmgNCj4gQEAgLTE2LDcgKzE2LDcgQEAgc3RydWN0IHR0
eV9zdHJ1Y3Q7DQo+ICAvKioNCj4gICAqIHN0cnVjdCB0dHlfcG9ydF9vcGVyYXRpb25zIC0tIG9w
ZXJhdGlvbnMgb24gdHR5X3BvcnQNCj4gICAqIEBjYXJyaWVyX3JhaXNlZDogcmV0dXJuIHRydWUg
aWYgdGhlIGNhcnJpZXIgaXMgcmFpc2VkIG9uIEBwb3J0DQo+IC0gKiBAZHRyX3J0czogcmFpc2Ug
dGhlIERUUiBsaW5lIGlmIEByYWlzZSBpcyB0cnVlLCBvdGhlcndpc2UgbG93ZXIgRFRSDQo+ICsg
KiBAZHRyX3J0czogcmFpc2UgdGhlIERUUiBsaW5lIGlmIEBhY3RpdmUgaXMgdHJ1ZSwgb3RoZXJ3
aXNlIGxvd2VyIERUUg0KPiAgICogQHNodXRkb3duOiBjYWxsZWQgd2hlbiB0aGUgbGFzdCBjbG9z
ZSBjb21wbGV0ZXMgb3IgYSBoYW5ndXAgZmluaXNoZXMgSUZGIHRoZQ0KPiAgICoJcG9ydCB3YXMg
aW5pdGlhbGl6ZWQuIERvIG5vdCB1c2UgdG8gZnJlZSByZXNvdXJjZXMuIFR1cm4gb2ZmIHRoZSBk
ZXZpY2UNCj4gICAqCW9ubHkuIENhbGxlZCB1bmRlciB0aGUgcG9ydCBtdXRleCB0byBzZXJpYWxp
emUgYWdhaW5zdCBAYWN0aXZhdGUgYW5kDQo+IEBAIC0zMiw3ICszMiw3IEBAIHN0cnVjdCB0dHlf
c3RydWN0Ow0KPiAgICovDQo+ICBzdHJ1Y3QgdHR5X3BvcnRfb3BlcmF0aW9ucyB7DQo+ICAJYm9v
bCAoKmNhcnJpZXJfcmFpc2VkKShzdHJ1Y3QgdHR5X3BvcnQgKnBvcnQpOw0KPiAtCXZvaWQgKCpk
dHJfcnRzKShzdHJ1Y3QgdHR5X3BvcnQgKnBvcnQsIGJvb2wgcmFpc2UpOw0KPiArCXZvaWQgKCpk
dHJfcnRzKShzdHJ1Y3QgdHR5X3BvcnQgKnBvcnQsIGJvb2wgYWN0aXZlKTsNCj4gIAl2b2lkICgq
c2h1dGRvd24pKHN0cnVjdCB0dHlfcG9ydCAqcG9ydCk7DQo+ICAJaW50ICgqYWN0aXZhdGUpKHN0
cnVjdCB0dHlfcG9ydCAqcG9ydCwgc3RydWN0IHR0eV9zdHJ1Y3QgKnR0eSk7DQo+ICAJdm9pZCAo
KmRlc3RydWN0KShzdHJ1Y3QgdHR5X3BvcnQgKnBvcnQpOw0KPiBkaWZmIC0tZ2l0IGEvaW5jbHVk
ZS9saW51eC91c2Ivc2VyaWFsLmggYi9pbmNsdWRlL2xpbnV4L3VzYi9zZXJpYWwuaA0KPiBpbmRl
eCBiYWQzNDNjNWU4YTcuLjMzYWZkOWYzZWJiZSAxMDA2NDQNCj4gLS0tIGEvaW5jbHVkZS9saW51
eC91c2Ivc2VyaWFsLmgNCj4gKysrIGIvaW5jbHVkZS9saW51eC91c2Ivc2VyaWFsLmgNCj4gQEAg
LTI5Miw3ICsyOTIsNyBAQCBzdHJ1Y3QgdXNiX3NlcmlhbF9kcml2ZXIgew0KPiAgCQkJc3RydWN0
IHNlcmlhbF9pY291bnRlcl9zdHJ1Y3QgKmljb3VudCk7DQo+ICAJLyogQ2FsbGVkIGJ5IHRoZSB0
dHkgbGF5ZXIgZm9yIHBvcnQgbGV2ZWwgd29yay4gVGhlcmUgbWF5IG9yIG1heSBub3QNCj4gIAkg
ICBiZSBhbiBhdHRhY2hlZCB0dHkgYXQgdGhpcyBwb2ludCAqLw0KPiAtCXZvaWQgKCpkdHJfcnRz
KShzdHJ1Y3QgdXNiX3NlcmlhbF9wb3J0ICpwb3J0LCBib29sIG9uKTsNCj4gKwl2b2lkICgqZHRy
X3J0cykoc3RydWN0IHVzYl9zZXJpYWxfcG9ydCAqcG9ydCwgYm9vbCBhY3RpdmUpOw0KDQpUaGlz
IGlzIG5vdCBhIHR0eV9wb3J0IGNhbGxiYWNrIHNvIHRoaXMgY2hhbmdlIGRvZXMgbm90IGJlbG9u
ZyBpbiB0aGlzDQpwYXRjaC4NCg0KPiAgCWJvb2wgKCpjYXJyaWVyX3JhaXNlZCkoc3RydWN0IHVz
Yl9zZXJpYWxfcG9ydCAqcG9ydCk7DQo+ICAJLyogQ2FsbGVkIGJ5IHRoZSB1c2Igc2VyaWFsIGhv
b2tzIHRvIGFsbG93IHRoZSB1c2VyIHRvIHJld29yayB0aGUNCj4gIAkgICB0ZXJtaW9zIHN0YXRl
ICovDQoNCkpvaGFuDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpncmV5YnVzLWRldiBtYWlsaW5nIGxpc3QgLS0gZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJv
Lm9yZwpUbyB1bnN1YnNjcmliZSBzZW5kIGFuIGVtYWlsIHRvIGdyZXlidXMtZGV2LWxlYXZlQGxp
c3RzLmxpbmFyby5vcmcK
