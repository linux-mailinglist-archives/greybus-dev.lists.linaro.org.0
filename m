Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A176C36E6
	for <lists+greybus-dev@lfdr.de>; Tue, 21 Mar 2023 17:26:50 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 698F43EC46
	for <lists+greybus-dev@lfdr.de>; Tue, 21 Mar 2023 16:26:49 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	by lists.linaro.org (Postfix) with ESMTPS id 6CB53441BF
	for <greybus-dev@lists.linaro.org>; Tue, 21 Mar 2023 16:26:45 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=AKFeVjHs;
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 145.40.68.75 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org;
	dmarc=pass (policy=none) header.from=linuxfoundation.org
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 86957B818CB;
	Tue, 21 Mar 2023 16:26:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD4C4C433D2;
	Tue, 21 Mar 2023 16:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1679416003;
	bh=tKkWKaI2vB8Y3uT5D+N8CfXzL37wrUQjbZ1WKGqRlGI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AKFeVjHsPQS6dAl6zd96IZOCGHqrPcab2l3l9yTBLAqJICxz3pLG0ytby4K5Vu++u
	 EwENZ9OiiTSX31CXM/bCq5C0KstSrArKmAg3KSeKnlil+6+WUCIK6D0Mn3wlJgGzMs
	 e7Ln2zF7W0W/KZOpUHrs5W6OPI7kIcp4mM9yyiGM=
Date: Tue, 21 Mar 2023 17:26:40 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
Message-ID: <ZBnawJvBVkgyVh78@kroah.com>
References: <cover.1679352669.git.eng.mennamahmoud.mm@gmail.com>
 <ee77a227-13bd-70ad-1d8e-f9719970e0f8@inria.fr>
 <196b5d53-701f-e2dd-596c-9fdb6a59f5cd@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <196b5d53-701f-e2dd-596c-9fdb6a59f5cd@gmail.com>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 6CB53441BF
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.50 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:145.40.68.75];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MIME_GOOD(-0.10)[text/plain];
	NEURAL_HAM(-0.00)[-1.000];
	FREEMAIL_CC(0.00)[inria.fr,lists.linux.dev,kernel.org,gmail.com,pengutronix.de,lists.linaro.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	ASN(0.00)[asn:54825, ipnet:145.40.68.0/24, country:US];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	URIBL_BLOCKED(0.00)[ams.source.kernel.org:helo,ams.source.kernel.org:rdns];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2]
Message-ID-Hash: U6IEGIWSR4REHLY655AGJNYZMJHPKVWM
X-Message-ID-Hash: U6IEGIWSR4REHLY655AGJNYZMJHPKVWM
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Julia Lawall <julia.lawall@inria.fr>, outreachy@lists.linux.dev, johan@kernel.org, elder@kernel.org, vireshk@kernel.org, thierry.reding@gmail.com, u.kleine-koenig@pengutronix.de, greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, linux-pwm@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 0/3] edits in greybus driver
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/U6IEGIWSR4REHLY655AGJNYZMJHPKVWM/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gVHVlLCBNYXIgMjEsIDIwMjMgYXQgMDY6MjI6NDRQTSArMDIwMCwgTWVubmEgTWFobW91ZCB3
cm90ZToNCj4gDQo+IE9uINmi2aHigI8v2aPigI8v2aLZoNmi2aMg2aHZozrZpNmmLCBKdWxpYSBM
YXdhbGwgd3JvdGU6DQo+ID4gDQo+ID4gT24gVHVlLCAyMSBNYXIgMjAyMywgTWVubmEgTWFobW91
ZCB3cm90ZToNCj4gPiANCj4gPiA+IFRoaXMgcGF0Y2hzZXQgaW5jbHVkZXMgY2hhbmdlIGhhcHBl
bmVkIGluIGdyZXlidXMgZHJpdmVyIGluIHRocmVlDQo+ID4gPiBkaWZmZXJlbnQgZmlsZXMgdHdv
IG9mIHRoZW0gcGF0Y2ggb25lIGFuZCB0aHJlZSByZWxhdGVkIHRvDQo+ID4gPiBjaGVja3BhdGNo
IGlzc3VlIGFuZCBpbiBzZWNvbmQgcGF0Y2ggY29udmVydCB0d28NCj4gPiA+IGBjb250YWluZXJf
b2ZgIG1hY3JvcyBpbnRvIGlubGluZSBmdW5jdGlvbnMuDQo+ID4gPiANCj4gPiA+IE1lbm5hIE1h
aG1vdWQgKDMpOg0KPiA+ID4gICAgc3RhZ2luZzogZ3JleWJ1czogcmVtb3ZlIHVubmVjZXNzYXJ5
IGJsYW5rIGxpbmUNCj4gPiA+ICAgIHN0YWdpbmc6IGdyZXlidXM6IHVzZSBpbmxpbmUgZnVuY3Rp
b24gZm9yIG1hY3Jvcw0KPiA+ID4gICAgc3RhZ2luZzogZ3JleWJ1czogcmVtb3ZlIHVubmVjZXNz
YXJ5IGJsYW5rIGxpbmUNCj4gPiBEaWZmZXJlbnQgcGF0Y2hlcyBzaG91bGQgaGF2ZSBkaWZmZXJl
bnQgc3ViamVjdCBsaW5lcy4NCj4gQnV0IEkgaGF2ZSBhbHJlYWR5IHRoZSBzYW1lIGVkaXQgaW4g
Ym90aCBmaWxlLCBzbyBzaG91bGQgSSByZS13cml0ZSB0aGUNCj4gc3ViamVjdCBmb3Igb25lIG9m
IHRoZW0/DQo+ID4gICAgWW91IG5lZWQgdG8gZWl0aGVyDQo+ID4gYmUgbW9yZSBzcGVjaWZpYyBh
Ym91dCB0aGUgZmlsZSBhZmZlY3RlZCBvciBtZXJnZSB0aGUgdHdvIHBhdGNoZXMgd2l0aCB0aGUN
Cj4gPiBzYW1lIHN1YmplY3QgaW50byBvbmUuDQo+IA0KPiBlYWNoIHBhdGNoIHJlbGF0ZWQgdG8g
ZGlmZmVyZW50IGZpbGUuIFNvLCBDYW4gSSB0byBtZXJnZSB0d28gY29tbWl0cyBmb3INCj4gZGlm
ZmVyZW50IGZpbGVzIGJ1dCBoYXZlIHRoZSBzYW1lIGVkaXQgaW4gb25lIHBhdGNoPw0KDQpZZXMs
IG9yIG1ha2UgMiBkaWZmZXJlbnQgcGF0Y2hlcyB3aXRoIDIgZGlmZmVyZW50IHN1YmplY3QgbGlu
ZXMgYXMgdGhleQ0KYXJlIG9idmlvdXNseSBkb2luZyBkaWZmZXJlbnQgdGhpbmdzLg0KDQo+IGJ1
dCBpbiB0aGlzIGNhc2Ugbm8gbmVlZCB0byBjcmVhdGUgcGF0Y2hzZXQgZm9yIGFsbCBjaGFuZ2Vz
IGluIGBncmV5YnVzYA0KPiBkcml2ZXIsIHJpZ2h0Pw0KPiANCj4gSWYgb2theSB3aXRoIHRoYXQs
IHNob3VsZCBJIHZlcnNpb25pbmcgdGhlIHBhdGNoZXMgdG8gcmVzZW5kIHRoZW0gYWdhaW4sIG9y
DQo+IHNob3VsZCBhZGQgIlJFU0VORCIgc3ViamVjdCBwcmVmaXg/DQo+IA0KPiBwbGVhc2UgdGVs
bCBtZSB0aGUgYmVzdCB3YXkgdG8gcmVzZW5kIHRoZXNlIHBhdGNoZXMsIGFwcHJlY2lhdGUgeW91
ciBoZWxwLg0KDQpXaGF0IHdvdWxkIHlvdSB3YW50IHRvIHNlZSBpZiB5b3UgaGFkIHRvIHJldmll
dyBhbmQgYXBwbHkgbG9hZHMgb2YNCnBhdGNoZXMgbGlrZSB0aGlzPw0KDQooaGludCwgaXQncyBu
b3QgYSByZXNlbmQsIGJ1dCBhIG5ldyB2ZXJzaW9uLi4uKQ0KDQp0aGFua3MsDQoNCmdyZWcgay1o
DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpncmV5YnVz
LWRldiBtYWlsaW5nIGxpc3QgLS0gZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpUbyB1bnN1
YnNjcmliZSBzZW5kIGFuIGVtYWlsIHRvIGdyZXlidXMtZGV2LWxlYXZlQGxpc3RzLmxpbmFyby5v
cmcK
