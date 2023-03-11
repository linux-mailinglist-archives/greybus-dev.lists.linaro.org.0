Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id B128D6B5CED
	for <lists+greybus-dev@lfdr.de>; Sat, 11 Mar 2023 15:39:07 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id BFB3F3EA3F
	for <lists+greybus-dev@lfdr.de>; Sat, 11 Mar 2023 14:39:06 +0000 (UTC)
Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	by lists.linaro.org (Postfix) with ESMTPS id 55DDE3EA3C
	for <greybus-dev@lists.linaro.org>; Sat, 11 Mar 2023 14:39:00 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=inria.fr header.s=dc header.b=oBBDl5JE;
	spf=pass (lists.linaro.org: domain of julia.lawall@inria.fr designates 192.134.164.83 as permitted sender) smtp.mailfrom=julia.lawall@inria.fr;
	dmarc=pass (policy=none) header.from=inria.fr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=70ULOWvNZDhIBg4vnstMVFwRyoxPMpkyu+flXX6WHg8=;
  b=oBBDl5JEgQh2HilqASq9c6QFzZ0YysFeqdmYczgig5W3R6UZk+6Zu0Tr
   VgTqQA6sy6p65pYgatxx5IhD9i7X0X73v/b+trvXrOHAgCHlSb+2fLZCl
   3qhwIlkFS4Xk+qQbpqF5rusMXFbzjYj/NOrzNCNzeccJK0yxsw+Bz95jX
   g=;
X-IronPort-AV: E=Sophos;i="5.98,252,1673910000";
   d="scan'208";a="96649566"
Received: from 231.85.89.92.rev.sfr.net (HELO hadrien) ([92.89.85.231])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2023 15:38:59 +0100
Date: Sat, 11 Mar 2023 15:38:59 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
In-Reply-To: <27dfe880-35f7-cbc1-cf8b-7bbd7f1c7301@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2303111537430.2802@hadrien>
References: <b6521b9a75a4088d621246b436c7ec5d35365690.1678462486.git.eng.mennamahmoud.mm@gmail.com> <alpine.DEB.2.22.394.2303110958250.2802@hadrien> <71211670-60f9-11f4-1ee7-f94d4d9df4fb@gmail.com> <alpine.DEB.2.22.394.2303111354490.2802@hadrien>
 <61dab579-f10b-5538-8b61-ebe73ae5b4f1@gmail.com> <27dfe880-35f7-cbc1-cf8b-7bbd7f1c7301@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-72012524-1678545539=:2802"
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 55DDE3EA3C
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.50 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	CTYPE_MIXED_BOGUS(1.00)[];
	RCVD_DKIM_ARC_DNSWL_HI(-1.00)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[inria.fr,none];
	RCVD_IN_DNSWL_HI(-0.50)[192.134.164.83:from];
	R_DKIM_ALLOW(-0.20)[inria.fr:s=dc];
	R_SPF_ALLOW(-0.20)[+ip4:192.134.164.0/24:c];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain];
	DKIM_TRACE(0.00)[inria.fr:+];
	MIME_TRACE(0.00)[0:+,1:+];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	ASN(0.00)[asn:2200, ipnet:192.134.164.0/24, country:FR];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	ARC_NA(0.00)[]
Message-ID-Hash: 4T3YKGFNSW3BJZSCBJFM2PY6WJS6OCCX
X-Message-ID-Hash: 4T3YKGFNSW3BJZSCBJFM2PY6WJS6OCCX
X-MailFrom: julia.lawall@inria.fr
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Julia Lawall <julia.lawall@inria.fr>, outreachy@lists.linux.dev, vireshk@kernel.org, johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 1/2] staging: greybus: Fix Alignment with parenthesis
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/4T3YKGFNSW3BJZSCBJFM2PY6WJS6OCCX/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-72012524-1678545539=:2802
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQoNCk9uIFNhdCwgMTEgTWFyIDIwMjMsIE1lbm5hIE1haG1vdWQgd3JvdGU6DQoNCj4NCj4gT24g
2aHZoS/Zoy/Zotmg2aLZoyDZodmkOtml2acsIE1lbm5hIE1haG1vdWQgd3JvdGU6DQo+ID4NCj4g
PiBPbiDZodmhL9mjL9mi2aDZotmjINmh2aQ62aXZpSwgSnVsaWEgTGF3YWxsIHdyb3RlOg0KPiA+
ID4NCj4gPiA+IE9uIFNhdCwgMTEgTWFyIDIwMjMsIE1lbm5hIE1haG1vdWQgd3JvdGU6DQo+ID4g
Pg0KPiA+ID4gPiBPbiDZodmhL9mjL9mi2aDZotmjINmh2aA62aXZqSwgSnVsaWEgTGF3YWxsIHdy
b3RlOg0KPiA+ID4gPiA+IE9uIEZyaSwgMTAgTWFyIDIwMjMsIE1lbm5hIE1haG1vdWQgd3JvdGU6
DQo+ID4gPiA+ID4NCj4gPiA+ID4gPiA+IEZpeCAiIENIRUNLOiBBbGlnbm1lbnQgc2hvdWxkIG1h
dGNoIG9wZW4gcGFyZW50aGVzaXMgIg0KPiA+ID4gPiA+ID4gUmVwb3J0ZWQgYnkgY2hlY2twYXRo
DQo+ID4gPiA+ID4gU2VlIHRoZSBtZXNzYWdlIGluIHRoZSBvdGhlciBtYWlsIGFib3V0IHRoZSBs
b2cgbWVzc2FnZS4NCj4gPiA+ID4gPg0KPiA+ID4gPiA+IEFsc28sIHlvdSBzaG91bGQgbm90IGhh
dmUgdHdvIHBhdGNoZXMgd2l0aCB0aGUgc2FtZSBzdWJqZWN0LsKgIEhlcmUsDQo+ID4gPiA+ID4g
dGhlDQo+ID4gPiA+ID4gY2hhbmdlcyBhcmUgb24gdGhlIHNhbWUgZmlsZSBhbmQgYXJlIGVzc2Vu
dGlhbGx5IHRoZSBzYW1lLCBldmVuDQo+ID4gPiA+ID4gaW52b2x2aW5nDQo+ID4gPiA+ID4gdGhl
IHNhbWUgZnVuY3Rpb24gY2FsbC7CoCBTbyB0aGV5IGNhbiBiZSB0b2dldGhlciBpbiBvbmUgcGF0
Y2guDQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBqdWxpYQ0KPiA+ID4gPiBva2F5LCBJIHdpbGwuIGFw
cHJlY2lhdGUgeW91ciBmZWVkYmFjay4gdGhhbmtzLg0KPiA+ID4gUGxlYXNlIHB1dCBzb21lIGJs
YW5rIGxpbmVzIGFyb3VuZCB5b3VyIHJlc3BvbnNlLCBzbyBpdCBpcyBlYXNpZXIgdG8gZmluZC4N
Cj4gPiA+DQo+ID4gPiB0aGFua3MsDQo+ID4gPiBqdWxpYQ0KPiA+DQo+ID4NCj4gPiBPa2F5LCBJ
IHdpbGwuDQo+ID4NCj4gPiB0aGFua3MsDQo+ID4NCj4gPiBNZW5uYQ0KPg0KPg0KPg0KPiBIaSBK
dWxpYSwNCj4NCj4gYWNjb3JkaW5nIHRvIEFsZXggZmVlZGJhY2sNCj4NCj4gIiBJIHRoaW5rIHRo
aXMgdHlwZSBvZiBhbGlnbm1lbnQgaXMgbm90IGEgbWFqb3IgcHJvYmxlbSwNCj4gYW5kIGFsaWdu
bWVudCBpc24ndCBkb25lIHRoaXMgd2F5IGluIGdlbmVyYWwgaW4gdGhpcw0KPiBkcml2ZXIsIGl0
J3MgcHJvYmFibHkgT0sgdG8ga2VlcCBpdCB0aGF0IHdheS4gLSBBbGV4ICINCj4NCj4NCj4gLEkg
d29uJ3QgcmVzdWJtaXQgdGhlc2UgcGF0Y2hlcywgcmlnaHQ/DQoNClRoZSBleGlzdGluZyBjb2Rl
IGluZGVlZCBsb29rcyBiZXR0ZXIgdG8gbWUuICBTbyB5b3UgY2FuIHNraXAgdGhpcyBpc3N1ZS4N
Cg0KanVsaWENCg0KDQo+DQo+DQo+IMKgLU1lbm5hDQo+DQo+DQo+ID4NCj4gPg0KPiA+ID4gPiA+
ID4gU2lnbmVkLW9mZi1ieTogTWVubmEgTWFobW91ZCA8ZW5nLm1lbm5hbWFobW91ZC5tbUBnbWFp
bC5jb20+DQo+ID4gPiA+ID4gPiAtLS0NCj4gPiA+ID4gPiA+IMKgwqAgZHJpdmVycy9zdGFnaW5n
L2dyZXlidXMvZnctY29yZS5jIHwgMiArLQ0KPiA+ID4gPiA+ID4gwqDCoCAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4gPiA+ID4gPiA+DQo+ID4gPiA+ID4g
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvZnctY29yZS5jDQo+ID4gPiA+
ID4gPiBiL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2Z3LWNvcmUuYw0KPiA+ID4gPiA+ID4gaW5k
ZXggNTdiZWJmMjQ2MzZiLi5mNTYyY2IxMmQ1YWQgMTAwNjQ0DQo+ID4gPiA+ID4gPiAtLS0gYS9k
cml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9mdy1jb3JlLmMNCj4gPiA+ID4gPiA+ICsrKyBiL2RyaXZl
cnMvc3RhZ2luZy9ncmV5YnVzL2Z3LWNvcmUuYw0KPiA+ID4gPiA+ID4gQEAgLTg5LDcgKzg5LDcg
QEAgc3RhdGljIGludCBnYl9md19jb3JlX3Byb2JlKHN0cnVjdCBnYl9idW5kbGUNCj4gPiA+ID4g
PiA+ICpidW5kbGUsDQo+ID4gPiA+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH0N
Cj4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNv
bm5lY3Rpb24gPSBnYl9jb25uZWN0aW9uX2NyZWF0ZShidW5kbGUsIGNwb3J0X2lkLA0KPiA+ID4g
PiA+ID4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZ2Jf
ZndfbWdtdF9yZXF1ZXN0X2hhbmRsZXIpOw0KPiA+ID4gPiA+ID4gKw0KPiA+ID4gPiA+ID4gZ2Jf
ZndfbWdtdF9yZXF1ZXN0X2hhbmRsZXIpOw0KPiA+ID4gPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBpZiAoSVNfRVJSKGNvbm5lY3Rpb24pKSB7DQo+ID4gPiA+ID4gPiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0ID0gUFRSX0VSUihjb25uZWN0aW9uKTsN
Cj4gPiA+ID4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBkZXZfZXJy
KCZidW5kbGUtPmRldiwNCj4gPiA+ID4gPiA+IC0tDQo+ID4gPiA+ID4gPiAyLjM0LjENCj4gPiA+
ID4gPiA+DQo+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4NCj4gPiA+ID4NCj4=

--8323329-72012524-1678545539=:2802
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

--8323329-72012524-1678545539=:2802--
