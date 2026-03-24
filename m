Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6JROKrNCwmmCagQAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Tue, 24 Mar 2026 08:52:19 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 42BFB3042D6
	for <lists+greybus-dev@lfdr.de>; Tue, 24 Mar 2026 08:52:19 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 41E7A40140
	for <lists+greybus-dev@lfdr.de>; Tue, 24 Mar 2026 07:52:18 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by lists.linaro.org (Postfix) with ESMTPS id D75773F903
	for <greybus-dev@lists.linaro.org>; Tue, 24 Mar 2026 07:52:15 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=TyjUDAOk;
	spf=pass (lists.linaro.org: domain of johan@kernel.org designates 172.105.4.254 as permitted sender) smtp.mailfrom=johan@kernel.org;
	dmarc=pass (policy=quarantine) header.from=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5E52760103;
	Tue, 24 Mar 2026 07:52:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2C7FC2BC9E;
	Tue, 24 Mar 2026 07:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774338734;
	bh=mBPvp3q+TvJUpg4+ASx6IuOCedA/fw22Wnrq5ySC6tg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TyjUDAOk/+jRzBAdVvEw/ggWIsO/sUESVSr0DPUG6zwUvd7fqDZcMI+ZOr9w1Zdxs
	 E4qcn3atm8qw++RB0IjeUd924w0vrDDMF5piO+ApjNyds7BKzE+J+Dm2IbJke90BiU
	 bPcEUw27601sgCYJQo49mRG/AMkk9S3DFc4zVYafDq7oEL6hYyh/39BdGt4rvSd/Tp
	 qga/isPx580WepsnvGVfa8aK7d1vRcDRRGDE2Kw59hZH3gVpNz7DXa4l3Aj92/87VW
	 K/cEUgKC9Lu1ICG8pgvKF/vS3MZHadaoOa5RpwQUB6snaG7afF159VCp1cgb6rVFjn
	 x+OenNo5gK2UA==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1w4wYe-00000003iHD-2A05;
	Tue, 24 Mar 2026 08:52:12 +0100
Date: Tue, 24 Mar 2026 08:52:12 +0100
From: Johan Hovold <johan@kernel.org>
To: Damien =?utf-8?Q?Ri=C3=A9gel?= <damien.riegel@silabs.com>
Message-ID: <acJCrBYJS61o2ZbG@hovoldconsulting.com>
References: <20260324022510.28596-1-damien.riegel@silabs.com>
 <20260324022510.28596-2-damien.riegel@silabs.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260324022510.28596-2-damien.riegel@silabs.com>
X-Spamd-Bar: ---
Message-ID-Hash: BXYYM6VQF54IP4PEJEI7RXK3E6QRSFU4
X-Message-ID-Hash: BXYYM6VQF54IP4PEJEI7RXK3E6QRSFU4
X-MailFrom: johan@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Alex Elder <elder@kernel.org>, Dan Carpenter <dan.carpenter@linaro.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v3 2/2] greybus: raw: fix use-after-free if write is called after disconnect
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/BXYYM6VQF54IP4PEJEI7RXK3E6QRSFU4/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Spamd-Result: default: False [2.09 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	NEURAL_SPAM(0.00)[0.952];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[johan@kernel.org,greybus-dev-bounces@lists.linaro.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[hovoldconsulting.com:mid,linaro.org:email,silabs.com:email]
X-Rspamd-Queue-Id: 42BFB3042D6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gTW9uLCBNYXIgMjMsIDIwMjYgYXQgMTA6MjU6MTBQTSAtMDQwMCwgRGFtaWVuIFJpw6lnZWwg
d3JvdGU6DQo+IElmIGEgdXNlciB3cml0ZXMgdG8gdGhlIGNoYXJkZXYgYWZ0ZXIgZGlzY29ubmVj
dCBoYXMgYmVlbiBjYWxsZWQsIHRoZQ0KPiBrZXJuZWwgcGFuaWNzIHdpdGggdGhlIGZvbGxvd2lu
ZyB0cmFjZSAod2l0aA0KPiBDT05GSUdfSU5JVF9PTl9GUkVFX0RFRkFVTFRfT049eSk6DQoNCj4g
Rml4ZXM6IGU4MDZjN2ZiOGU5YiAoImdyZXlidXM6IHJhdzogYWRkIHJhdyBncmV5YnVzIGtlcm5l
bCBkcml2ZXIiKQ0KPiBTaWduZWQtb2ZmLWJ5OiBEYW1pZW4gUmnDqWdlbCA8ZGFtaWVuLnJpZWdl
bEBzaWxhYnMuY29tPg0KPiAtLS0NCj4gQ2hhbmdlcyBpbiB2MzoNCj4gICAtIHJlbmFtZSAiY29u
bmVjdGVkIiBmbGFnIHRvICJkaXNjb25uZWN0ZWQiDQo+ICAgLSBhY3F1aXJlL3JlbGVhc2Ugb2Yg
d3JpdGUgc2VtYXBob3JlIGFjcXVpcmUvcmVsZWFzZSB3ZXJlIGluDQo+ICAgICBnYl9yYXdfc2Vu
ZCwgbW92ZSB0aGVtIHRvIHRoZSBjYWxsZXIgaW5zdGVhZCAocmF3X3dyaXRlKQ0KPiANCj4gQ2hh
bmdlcyBpbiB2MjoNCj4gICAtIHRyaW0gZG93biB0cmFjZSBpbiBjb21taXQgbWVzc2FnZSB0byBr
ZWVwIG9ubHkgdGhlIGVzc2VudGlhbCBwYXJ0DQo+ICAgLSBjb252ZXJ0IHRoZSBtdXRleCB0aGF0
IHByb3RlY3RlZCB0aGUgY29ubmVjdGlvbiB0byBhIHJ3X3NlbWFwaG9yZQ0KPiAgIC0gdXNlIGEg
ImNvbm5lY3RlZCIgZmxhZyBpbnN0ZWFkIG9mIHJlbHlpbmcgb24gdGhlIGNvbm5lY3Rpb24gcG9p
bnRlcg0KPiAgICAgYmVpbmcgTlVMTCBvciBub3QNCiANCj4gQEAgLTI3NywxMSArMjg1LDIwIEBA
IHN0YXRpYyBzc2l6ZV90IHJhd193cml0ZShzdHJ1Y3QgZmlsZSAqZmlsZSwgY29uc3QgY2hhciBf
X3VzZXIgKmJ1ZiwNCj4gIAlpZiAoY291bnQgPiBNQVhfUEFDS0VUX1NJWkUpDQo+ICAJCXJldHVy
biAtRTJCSUc7DQo+ICANCj4gLQlyZXR2YWwgPSBnYl9yYXdfc2VuZChyYXcsIGNvdW50LCBidWYp
Ow0KPiAtCWlmIChyZXR2YWwpDQo+IC0JCXJldHVybiByZXR2YWw7DQo+ICsJZG93bl9yZWFkKCZy
YXctPmRpc2Nvbm5lY3RfbG9jayk7DQo+ICANCj4gLQlyZXR1cm4gY291bnQ7DQo+ICsJaWYgKHJh
dy0+ZGlzY29ubmVjdGVkKSB7DQo+ICsJCXJldHZhbCA9IC1FTk9ERVY7DQo+ICsJCWdvdG8gZXhp
dDsNCj4gKwl9DQo+ICsNCj4gKwlyZXR2YWwgPSBnYl9yYXdfc2VuZChyYXcsIGNvdW50LCBidWYp
Ow0KPiArCWlmICghcmV0dmFsKQ0KPiArCQlyZXR2YWwgPSBjb3VudDsNCg0KSSdkIGludmVydCB0
aGlzIHNvIHRoYXQgd2UgdGVzdCBmb3IgZXJyb3JzIGNvbnNpc3RlbnRseToNCg0KCWlmIChyZXR2
YWwpDQoJCWdvdG8gZXhpdDsNCg0KCXJldHZhbCA9IGNvdW50Ow0KDQo+ICtleGl0Og0KPiArCXVw
X3JlYWQoJnJhdy0+ZGlzY29ubmVjdF9sb2NrKTsNCj4gKw0KPiArCXJldHVybiByZXR2YWw7DQo+
ICB9DQo+ICANCj4gIHN0YXRpYyBzc2l6ZV90IHJhd19yZWFkKHN0cnVjdCBmaWxlICpmaWxlLCBj
aGFyIF9fdXNlciAqYnVmLCBzaXplX3QgY291bnQsDQoNCkpvaGFuDQpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpncmV5YnVzLWRldiBtYWlsaW5nIGxpc3Qg
LS0gZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpUbyB1bnN1YnNjcmliZSBzZW5kIGFuIGVt
YWlsIHRvIGdyZXlidXMtZGV2LWxlYXZlQGxpc3RzLmxpbmFyby5vcmcK
