Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 7155C6C3716
	for <lists+greybus-dev@lfdr.de>; Tue, 21 Mar 2023 17:40:02 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 5BCEC3EBA6
	for <lists+greybus-dev@lfdr.de>; Tue, 21 Mar 2023 16:40:01 +0000 (UTC)
Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	by lists.linaro.org (Postfix) with ESMTPS id 6ECFC3EBA6
	for <greybus-dev@lists.linaro.org>; Tue, 21 Mar 2023 16:39:56 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=inria.fr header.s=dc header.b=mK6kLhXL;
	spf=pass (lists.linaro.org: domain of julia.lawall@inria.fr designates 192.134.164.83 as permitted sender) smtp.mailfrom=julia.lawall@inria.fr;
	dmarc=pass (policy=none) header.from=inria.fr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=PzFbeSMMbS4CC7XY2NIBhcKqrJEORtC8j3V9n4WJKHA=;
  b=mK6kLhXLytGD1zE70XoQ6WcMB+mJyZieWcb6GqWmQMfOVpN0GBdaE4fg
   1oU3+eZXBLvCLchaYuZFATS8et4Q+7qxQ7ZV1p29S1a4Art/+eDSPeeo+
   8HfOFnSJUZZMC/ekg0lpUiwC/tW/C9oBktNSKwlOlb1b1qOWJEJWKMl27
   c=;
X-IronPort-AV: E=Sophos;i="5.98,279,1673910000";
   d="scan'208";a="98353568"
Received: from dt-lawall.paris.inria.fr ([128.93.67.65])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2023 17:39:55 +0100
Date: Tue, 21 Mar 2023 17:39:55 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
To: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
In-Reply-To: <196b5d53-701f-e2dd-596c-9fdb6a59f5cd@gmail.com>
Message-ID: <8020f263-158d-db6e-f34-425b72983bb@inria.fr>
References: <cover.1679352669.git.eng.mennamahmoud.mm@gmail.com> <ee77a227-13bd-70ad-1d8e-f9719970e0f8@inria.fr> <196b5d53-701f-e2dd-596c-9fdb6a59f5cd@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1428913748-1679416795=:10740"
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 6ECFC3EBA6
X-Spamd-Bar: -
X-Spamd-Result: default: False [-1.50 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	CTYPE_MIXED_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[inria.fr,none];
	R_DKIM_ALLOW(-0.20)[inria.fr:s=dc];
	R_SPF_ALLOW(-0.20)[+ip4:192.134.164.0/24:c];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	ASN(0.00)[asn:2200, ipnet:192.134.164.0/24, country:FR];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_ONE(0.00)[1];
	MIME_TRACE(0.00)[0:+,1:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,lists.linux.dev,kernel.org,gmail.com,pengutronix.de,lists.linaro.org,vger.kernel.org];
	DKIM_TRACE(0.00)[inria.fr:+];
	ARC_NA(0.00)[]
Message-ID-Hash: JJTKX46QSFYKDH4Y4TMFLHZHNVG4KM5J
X-Message-ID-Hash: JJTKX46QSFYKDH4Y4TMFLHZHNVG4KM5J
X-MailFrom: julia.lawall@inria.fr
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: outreachy@lists.linux.dev, johan@kernel.org, elder@kernel.org, vireshk@kernel.org, thierry.reding@gmail.com, u.kleine-koenig@pengutronix.de, greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, linux-pwm@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 0/3] edits in greybus driver
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/JJTKX46QSFYKDH4Y4TMFLHZHNVG4KM5J/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1428913748-1679416795=:10740
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQoNCk9uIFR1ZSwgMjEgTWFyIDIwMjMsIE1lbm5hIE1haG1vdWQgd3JvdGU6DQoNCj4NCj4gT24g
2aLZoS/Zoy/Zotmg2aLZoyDZodmjOtmk2aYsIEp1bGlhIExhd2FsbCB3cm90ZToNCj4gPg0KPiA+
IE9uIFR1ZSwgMjEgTWFyIDIwMjMsIE1lbm5hIE1haG1vdWQgd3JvdGU6DQo+ID4NCj4gPiA+IFRo
aXMgcGF0Y2hzZXQgaW5jbHVkZXMgY2hhbmdlIGhhcHBlbmVkIGluIGdyZXlidXMgZHJpdmVyIGlu
IHRocmVlDQo+ID4gPiBkaWZmZXJlbnQgZmlsZXMgdHdvIG9mIHRoZW0gcGF0Y2ggb25lIGFuZCB0
aHJlZSByZWxhdGVkIHRvDQo+ID4gPiBjaGVja3BhdGNoIGlzc3VlIGFuZCBpbiBzZWNvbmQgcGF0
Y2ggY29udmVydCB0d28NCj4gPiA+IGBjb250YWluZXJfb2ZgIG1hY3JvcyBpbnRvIGlubGluZSBm
dW5jdGlvbnMuDQo+ID4gPg0KPiA+ID4gTWVubmEgTWFobW91ZCAoMyk6DQo+ID4gPiAgICBzdGFn
aW5nOiBncmV5YnVzOiByZW1vdmUgdW5uZWNlc3NhcnkgYmxhbmsgbGluZQ0KPiA+ID4gICAgc3Rh
Z2luZzogZ3JleWJ1czogdXNlIGlubGluZSBmdW5jdGlvbiBmb3IgbWFjcm9zDQo+ID4gPiAgICBz
dGFnaW5nOiBncmV5YnVzOiByZW1vdmUgdW5uZWNlc3NhcnkgYmxhbmsgbGluZQ0KPiA+IERpZmZl
cmVudCBwYXRjaGVzIHNob3VsZCBoYXZlIGRpZmZlcmVudCBzdWJqZWN0IGxpbmVzLg0KPiBCdXQg
SSBoYXZlIGFscmVhZHkgdGhlIHNhbWUgZWRpdCBpbiBib3RoIGZpbGUsIHNvIHNob3VsZCBJIHJl
LXdyaXRlIHRoZQ0KPiBzdWJqZWN0IGZvciBvbmUgb2YgdGhlbT8NCj4gPiAgICBZb3UgbmVlZCB0
byBlaXRoZXINCj4gPiBiZSBtb3JlIHNwZWNpZmljIGFib3V0IHRoZSBmaWxlIGFmZmVjdGVkIG9y
IG1lcmdlIHRoZSB0d28gcGF0Y2hlcyB3aXRoIHRoZQ0KPiA+IHNhbWUgc3ViamVjdCBpbnRvIG9u
ZS4NCj4NCj4gZWFjaCBwYXRjaCByZWxhdGVkIHRvIGRpZmZlcmVudCBmaWxlLiBTbywgQ2FuIEkg
dG8gbWVyZ2UgdHdvIGNvbW1pdHMgZm9yDQo+IGRpZmZlcmVudCBmaWxlcyBidXQgaGF2ZSB0aGUg
c2FtZSBlZGl0IGluIG9uZSBwYXRjaD8NCg0KVGhleSBhcmUgYm90aCBmb3IgZ3JleWJ1cywgd2hp
Y2ggaXMgd2hhdCB5b3UgYWR2ZXJ0aXNlIGluIHRoZSBzdWJqZWN0DQpsaW5lLiAgQW5kIHRoZSBz
ZW5zZSBvZiB0aGUgY2hhbmdlcyBpcyB0aGUgc2FtZSwgYW5kIHRoZSBjaGFuZ2VzIGFyZSBxdWl0
ZQ0Kc2ltcGxlLiAgU28gSSB0aGluayB5b3UgY291bGQganVzdCBwdXQgdGhlbSBpbiBvbmUgcGF0
Y2guICBJZiB5b3UgZmluZA0Kb3RoZXIgb2NjdXJyZW5jZXMgb2YgdGhlIHByb2JsZW0gaW4gZ3Jl
eWJ1cyB5b3UgY291bGQgbWFrZSBvbmUgcGF0Y2ggdGhhdA0KZml4ZXMgYWxsIG9mIHRoZW0uDQoN
Cj4gYnV0IGluIHRoaXMgY2FzZSBubyBuZWVkIHRvIGNyZWF0ZSBwYXRjaHNldCBmb3IgYWxsIGNo
YW5nZXMgaW4gYGdyZXlidXNgDQo+IGRyaXZlciwgcmlnaHQ/DQoNCkEgcGF0Y2hzZXQgaXMgbmVl
ZGVkIGlmIHRoZSBjaGFuZ2VzIGFmZmVjdCB0aGUgc2FtZSBmaWxlLCBiZWNhdXNlIHRoZXJlDQpt
aWdodCBiZSBjb21wbGljYXRpb25zIGlmIHRoZSBwYXRjaGVzIGFyZSBhcHBsaWVkIGluIHRoZSB3
cm9uZyBvcmRlci4NCg0KPg0KPiBJZiBva2F5IHdpdGggdGhhdCwgc2hvdWxkIEkgdmVyc2lvbmlu
ZyB0aGUgcGF0Y2hlcyB0byByZXNlbmQgdGhlbSBhZ2Fpbiwgb3INCj4gc2hvdWxkIGFkZCAiUkVT
RU5EIiBzdWJqZWN0IHByZWZpeD8NCg0KUkVTRU5EIHdvdWxkIGJlIGlmIHlvdSBzZW5kIGV4YWN0
bHkgdGhlIHNhbWUgdGhpbmcsIGJlY2F1c2Ugc29tZSB0aW1lIGhhcw0KcGFzc2VkIGFuZCB5b3Ug
YXJlIHdvcnJpZWQgdGhhdCB0aGUgcGF0Y2ggaGFzIGJlZW4gbG9zdC4gIE5vdyB0aGF0IHlvdQ0K
aGF2ZSBwdXQgdGhlc2UgaW4gYSBzZXJpZXMsIGl0IGlzIHBlcmhhcHMgYmVzdCB0byBsZWF2ZSB0
aGVtIGluIGEgc2VyaWVzDQphbmQgaW5jcmVhc2UgdGhlIHZlcnNpb24gbnVtYmVyLCB0byBhdm9p
ZCBjb25mdXNpb24gb24gdGhlIHBhcnQgb2YgcGVvcGxlDQpyZWFkaW5nIHRoZSBwYXRjaGVzLg0K
DQpqdWxpYQ0KDQo+IHBsZWFzZSB0ZWxsIG1lIHRoZSBiZXN0IHdheSB0byByZXNlbmQgdGhlc2Ug
cGF0Y2hlcywgYXBwcmVjaWF0ZSB5b3VyIGhlbHAuDQo+DQo+DQo+IE1lbm5hDQo+DQo+DQo+ID4N
Cj4gPiBqdWxpYQ0KPiA+DQo+ID4gPiAgIGRyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2dicGh5Lmgg
ICAgICAgICAgICAgICAgICB8IDEwICsrKysrKysrLS0NCj4gPiA+ICAgZHJpdmVycy9zdGFnaW5n
L2dyZXlidXMvZ3JleWJ1c19hdXRoZW50aWNhdGlvbi5oIHwgIDEgLQ0KPiA+ID4gICBkcml2ZXJz
L3N0YWdpbmcvZ3JleWJ1cy9wd20uYyAgICAgICAgICAgICAgICAgICAgfCAgMSAtDQo+ID4gPiAg
IDMgZmlsZXMgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQ0KPiA+ID4N
Cj4gPiA+IC0tDQo+ID4gPiAyLjM0LjENCj4gPiA+DQo+ID4gPg0KPiA+ID4NCj4=

--8323329-1428913748-1679416795=:10740
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

--8323329-1428913748-1679416795=:10740--
