Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F9316C00D2
	for <lists+greybus-dev@lfdr.de>; Sun, 19 Mar 2023 12:36:54 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 53FB13EF88
	for <lists+greybus-dev@lfdr.de>; Sun, 19 Mar 2023 11:36:53 +0000 (UTC)
Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	by lists.linaro.org (Postfix) with ESMTPS id 540873EC46
	for <greybus-dev@lists.linaro.org>; Sun, 19 Mar 2023 11:36:48 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=inria.fr header.s=dc header.b=ph7y2g9j;
	spf=pass (lists.linaro.org: domain of julia.lawall@inria.fr designates 192.134.164.104 as permitted sender) smtp.mailfrom=julia.lawall@inria.fr;
	dmarc=pass (policy=none) header.from=inria.fr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=Y5LBSHwMhNo9lCQHwoXjOmrKTbcIgRBEgsurhqinmWg=;
  b=ph7y2g9jG/cGD8fDSRRFW4ko2r4CBEfIHzbPtTtePJfvJkDwdh2i1Doh
   Njw36ALPZs6hIxM13+sqLeHMQniGagzsiFtFplNGfqbSTciXvcPMLscAa
   ns4tEUNPv2oQ3je0s9V/6p708RmTF9qzpq4H6sQcntV8jseOnzZjWKFJ5
   o=;
X-IronPort-AV: E=Sophos;i="5.98,273,1673910000";
   d="scan'208";a="50605638"
Received: from 231.85.89.92.rev.sfr.net (HELO hadrien) ([92.89.85.231])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2023 12:36:47 +0100
Date: Sun, 19 Mar 2023 12:36:46 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
In-Reply-To: <15e81411-e40f-43c5-bb7f-907d6d5f93c5@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2303191235580.2867@hadrien>
References: <20230319110831.39931-1-eng.mennamahmoud.mm@gmail.com> <alpine.DEB.2.22.394.2303191216240.2867@hadrien> <15e81411-e40f-43c5-bb7f-907d6d5f93c5@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-17532282-1679225806=:2867"
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 540873EC46
X-Spamd-Bar: -
X-Spamd-Result: default: False [-1.10 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	CTYPE_MIXED_BOGUS(1.00)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[inria.fr,none];
	R_DKIM_ALLOW(-0.20)[inria.fr:s=dc];
	R_SPF_ALLOW(-0.20)[+ip4:192.134.164.0/24];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[192.134.164.104:from];
	FREEMAIL_TO(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+];
	RCVD_TLS_LAST(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	ASN(0.00)[asn:2200, ipnet:192.134.164.0/24, country:FR];
	RCVD_COUNT_ONE(0.00)[1];
	RCPT_COUNT_SEVEN(0.00)[8];
	DKIM_TRACE(0.00)[inria.fr:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	ARC_NA(0.00)[]
Message-ID-Hash: RTO5TMYU4HE5QTRIAXBSAU5IPOIGBSNP
X-Message-ID-Hash: RTO5TMYU4HE5QTRIAXBSAU5IPOIGBSNP
X-MailFrom: julia.lawall@inria.fr
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: outreachy@lists.linux.dev, johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: add blank line after struct
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/RTO5TMYU4HE5QTRIAXBSAU5IPOIGBSNP/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-17532282-1679225806=:2867
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQoNCk9uIFN1biwgMTkgTWFyIDIwMjMsIE1lbm5hIE1haG1vdWQgd3JvdGU6DQoNCj4NCj4gT24g
2aHZqS/Zoy/Zotmg2aLZoyDZodmjOtmh2aksIEp1bGlhIExhd2FsbCB3cm90ZToNCj4gPg0KPiA+
IE9uIFN1biwgMTkgTWFyIDIwMjMsIE1lbm5hIE1haG1vdWQgd3JvdGU6DQo+ID4NCj4gPiA+IGFk
ZCBibGFuayBsaW5lIGFmdGVyIHN0cnVjdCBmb3IgcmVhZGFiaWxpdHkgYXMNCj4gPiBUaGUgbG9n
IG1lc3NhZ2Ugc2hvdWxkIHN0YXJ0IHdpdGggYSBjYXBpdGFsIGxldHRlciwgc28gIkFkZCIuDQo+
DQo+DQo+IE9rYXksIEkgd2lsbCBmaXggaXQuDQo+DQo+ID4NCj4gPiA+IHJlcG9ydGVkIGJ5IGNo
ZWNrcGF0Y2ggc2NyaXB0DQo+ID4gInJlcG9ydGVkIGJ5IGNoZWNrcGF0Y2giIG9yICJyZXBvcnRl
ZCBieSB0aGUgY2hlY2twYXRjaCBzY3JpcHQiLg0KPiA+IFRoZSBmaXJzdCBpcyBtb3JlIGNvbmNp
c2UsIGFuZCBpdCBkb2Vzbid0IHJlYWxseSBtYXR0ZXIgd2hldGhlciBjaGVja3BhdGNoDQo+ID4g
aXMgYSBzY3JpcHQgb3Igc29tZXRoaW5nIGVsc2UuDQo+DQo+DQo+IGdvdCBpdC4NCj4NCj4gPiA+
ICIgQ0hFQ0s6IFBsZWFzZSB1c2UgYSBibGFuayBsaW5lIGFmdGVyIGZ1bmN0aW9uL3N0cnVjdC91
bmlvbi9lbnVtDQo+ID4gPiBkZWNsYXJhdGlvbnMiDQo+ID4gSSBndWVzcyB0aGUgI2RlZmluZSB3
YXMgY29uY2F0ZW5hdGVkIHRvIHRoZSBlbmQgb2YgdGhlIGRlZmluaXRpb24gdG8gc2hvdw0KPiA+
IHRoYXQgaXQgaXMgY2xvc2VseSByZWxhdGVkIHRvIHRoZSBkZWZpbml0aW9uLiAgV2l0aCB0aGUg
I2RlZmluZSwgaXQgc2VlbXMNCj4gPiByYXRoZXIgbmF0dXJhbCwgYnV0IHRoZSBiZXR0ZXIgc29s
dHV0aW9uIHdvdWxkIGJlIHRvIG1ha2UgYSBzdGF0aWMgaW5saW5lDQo+ID4gZnVuY3Rpb24gaW4g
Ym90aCBjYXNlcy4gIFRoZXJlIHdvdWxkIG5hdHVyYWxseSBiZSBhIGJsYW5rIGxpbmUgYmVmb3Jl
IGENCj4gPiBmdW5jdGlvbiBkZWZpbml0aW9uIGFzIHdlbGwuDQo+DQo+DQo+IGdvdCB5b3VyIHBv
aW50LCBzbywgc2hvdWxkIGkgaWdub3JlIHRoaXM/DQoNCk5vdCBzdXJlIHdoYXQgeW91IG1lYW4g
YnkgaWdub3JlLiAgSWYgeW91IHJld3JpdGUgdGhlICNkZWZpbmUgYXMgYQ0KZnVuY3Rpb24sIGFu
IHVzZSB0aGUgbmF0dXJhbCBwbGFjZW1lbnQgZm9yIGEgZnVuY3Rpb24gZGVmaW5pdGlvbiwgdGhl
biB0aGUNCmNoZWNrcGF0Y2ggd2FybmluZyB3aWxsIGdvIGF3YXkgYXMgYSBzaWRlIGVmZmVjdC4N
Cg0KanVsaWENCg0KPg0KPg0KPiBNZW5uYQ0KPg0KPiA+DQo+ID4ganVsaWENCj4gPg0KPiA+ID4g
U2lnbmVkLW9mZi1ieTogTWVubmEgTWFobW91ZCA8ZW5nLm1lbm5hbWFobW91ZC5tbUBnbWFpbC5j
b20+DQo+ID4gPiAtLS0NCj4gPiA+ICAgZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvZ2JwaHkuaCB8
IDIgKysNCj4gPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQ0KPiA+ID4NCj4g
PiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9nYnBoeS5oDQo+ID4gPiBi
L2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2dicGh5LmgNCj4gPiA+IGluZGV4IGQ0YTIyNWI3NjMz
OC4uMWRlNTEwNDk5NDgwIDEwMDY0NA0KPiA+ID4gLS0tIGEvZHJpdmVycy9zdGFnaW5nL2dyZXli
dXMvZ2JwaHkuaA0KPiA+ID4gKysrIGIvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvZ2JwaHkuaA0K
PiA+ID4gQEAgLTE1LDYgKzE1LDcgQEAgc3RydWN0IGdicGh5X2RldmljZSB7DQo+ID4gPiAgIAlz
dHJ1Y3QgbGlzdF9oZWFkIGxpc3Q7DQo+ID4gPiAgIAlzdHJ1Y3QgZGV2aWNlIGRldjsNCj4gPiA+
ICAgfTsNCj4gPiA+ICsNCj4gPiA+ICAgI2RlZmluZSB0b19nYnBoeV9kZXYoZCkgY29udGFpbmVy
X29mKGQsIHN0cnVjdCBnYnBoeV9kZXZpY2UsIGRldikNCj4gPiA+DQo+ID4gPiAgIHN0YXRpYyBp
bmxpbmUgdm9pZCAqZ2JfZ2JwaHlfZ2V0X2RhdGEoc3RydWN0IGdicGh5X2RldmljZSAqZ2RldikN
Cj4gPiA+IEBAIC00Myw2ICs0NCw3IEBAIHN0cnVjdCBnYnBoeV9kcml2ZXIgew0KPiA+ID4NCj4g
PiA+ICAgCXN0cnVjdCBkZXZpY2VfZHJpdmVyIGRyaXZlcjsNCj4gPiA+ICAgfTsNCj4gPiA+ICsN
Cj4gPiA+ICAgI2RlZmluZSB0b19nYnBoeV9kcml2ZXIoZCkgY29udGFpbmVyX29mKGQsIHN0cnVj
dCBnYnBoeV9kcml2ZXIsIGRyaXZlcikNCj4gPiA+DQo+ID4gPiAgIGludCBnYl9nYnBoeV9yZWdp
c3Rlcl9kcml2ZXIoc3RydWN0IGdicGh5X2RyaXZlciAqZHJpdmVyLA0KPiA+ID4gLS0NCj4gPiA+
IDIuMzQuMQ0KPiA+ID4NCj4gPiA+DQo+ID4gPg0KPg==

--8323329-17532282-1679225806=:2867
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

--8323329-17532282-1679225806=:2867--
