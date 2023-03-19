Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id A07536C00F7
	for <lists+greybus-dev@lfdr.de>; Sun, 19 Mar 2023 12:46:48 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 9CAFB3EF88
	for <lists+greybus-dev@lfdr.de>; Sun, 19 Mar 2023 11:46:47 +0000 (UTC)
Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	by lists.linaro.org (Postfix) with ESMTPS id 545CB3EC46
	for <greybus-dev@lists.linaro.org>; Sun, 19 Mar 2023 11:46:43 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=inria.fr header.s=dc header.b=KEtefP0P;
	spf=pass (lists.linaro.org: domain of julia.lawall@inria.fr designates 192.134.164.104 as permitted sender) smtp.mailfrom=julia.lawall@inria.fr;
	dmarc=pass (policy=none) header.from=inria.fr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=1IZ/KAw5saCbQvg06OT7S25vtZZN9V8w6z1PpAAdwxc=;
  b=KEtefP0PNcPwq6E4Xc+0+EplzDXLqBzyHWTGunZyFXUPMQgB1noFZhYN
   tQmHHISy8FVu4FBYovEGleWX+PGdQhtYckggzdwh8t0pk3jHObWi+Nt5m
   yNLxK+V/XkmYyEZkFE9Msnbpdv6mFOPr1USw788p888LYAwQa74cNeO/l
   s=;
X-IronPort-AV: E=Sophos;i="5.98,273,1673910000";
   d="scan'208";a="50605869"
Received: from 231.85.89.92.rev.sfr.net (HELO hadrien) ([92.89.85.231])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2023 12:46:42 +0100
Date: Sun, 19 Mar 2023 12:46:41 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
In-Reply-To: <6cc1e2f7-e971-b195-acba-9b4c136aa16b@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2303191246190.2867@hadrien>
References: <20230319110831.39931-1-eng.mennamahmoud.mm@gmail.com> <alpine.DEB.2.22.394.2303191216240.2867@hadrien> <15e81411-e40f-43c5-bb7f-907d6d5f93c5@gmail.com> <alpine.DEB.2.22.394.2303191235580.2867@hadrien>
 <6cc1e2f7-e971-b195-acba-9b4c136aa16b@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-996529056-1679226402=:2867"
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 545CB3EC46
X-Spamd-Bar: -
X-Spamd-Result: default: False [-1.10 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	CTYPE_MIXED_BOGUS(1.00)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[inria.fr,none];
	R_SPF_ALLOW(-0.20)[+ip4:192.134.164.0/24];
	R_DKIM_ALLOW(-0.20)[inria.fr:s=dc];
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
Message-ID-Hash: HH2CGNXX7BQWSLRNAMKIAPVF2BDGTH3X
X-Message-ID-Hash: HH2CGNXX7BQWSLRNAMKIAPVF2BDGTH3X
X-MailFrom: julia.lawall@inria.fr
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: outreachy@lists.linux.dev, johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: add blank line after struct
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/HH2CGNXX7BQWSLRNAMKIAPVF2BDGTH3X/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-996529056-1679226402=:2867
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQoNCk9uIFN1biwgMTkgTWFyIDIwMjMsIE1lbm5hIE1haG1vdWQgd3JvdGU6DQoNCj4NCj4gT24g
2aHZqS/Zoy/Zotmg2aLZoyDZodmjOtmj2aYsIEp1bGlhIExhd2FsbCB3cm90ZToNCj4gPg0KPiA+
IE9uIFN1biwgMTkgTWFyIDIwMjMsIE1lbm5hIE1haG1vdWQgd3JvdGU6DQo+ID4NCj4gPiA+IE9u
INmh2akv2aMv2aLZoNmi2aMg2aHZozrZodmpLCBKdWxpYSBMYXdhbGwgd3JvdGU6DQo+ID4gPiA+
IE9uIFN1biwgMTkgTWFyIDIwMjMsIE1lbm5hIE1haG1vdWQgd3JvdGU6DQo+ID4gPiA+DQo+ID4g
PiA+ID4gYWRkIGJsYW5rIGxpbmUgYWZ0ZXIgc3RydWN0IGZvciByZWFkYWJpbGl0eSBhcw0KPiA+
ID4gPiBUaGUgbG9nIG1lc3NhZ2Ugc2hvdWxkIHN0YXJ0IHdpdGggYSBjYXBpdGFsIGxldHRlciwg
c28gIkFkZCIuDQo+ID4gPg0KPiA+ID4gT2theSwgSSB3aWxsIGZpeCBpdC4NCj4gPiA+DQo+ID4g
PiA+ID4gcmVwb3J0ZWQgYnkgY2hlY2twYXRjaCBzY3JpcHQNCj4gPiA+ID4gInJlcG9ydGVkIGJ5
IGNoZWNrcGF0Y2giIG9yICJyZXBvcnRlZCBieSB0aGUgY2hlY2twYXRjaCBzY3JpcHQiLg0KPiA+
ID4gPiBUaGUgZmlyc3QgaXMgbW9yZSBjb25jaXNlLCBhbmQgaXQgZG9lc24ndCByZWFsbHkgbWF0
dGVyIHdoZXRoZXINCj4gPiA+ID4gY2hlY2twYXRjaA0KPiA+ID4gPiBpcyBhIHNjcmlwdCBvciBz
b21ldGhpbmcgZWxzZS4NCj4gPiA+DQo+ID4gPiBnb3QgaXQuDQo+ID4gPg0KPiA+ID4gPiA+ICIg
Q0hFQ0s6IFBsZWFzZSB1c2UgYSBibGFuayBsaW5lIGFmdGVyIGZ1bmN0aW9uL3N0cnVjdC91bmlv
bi9lbnVtDQo+ID4gPiA+ID4gZGVjbGFyYXRpb25zIg0KPiA+ID4gPiBJIGd1ZXNzIHRoZSAjZGVm
aW5lIHdhcyBjb25jYXRlbmF0ZWQgdG8gdGhlIGVuZCBvZiB0aGUgZGVmaW5pdGlvbiB0bw0KPiA+
ID4gPiBzaG93DQo+ID4gPiA+IHRoYXQgaXQgaXMgY2xvc2VseSByZWxhdGVkIHRvIHRoZSBkZWZp
bml0aW9uLiAgV2l0aCB0aGUgI2RlZmluZSwgaXQNCj4gPiA+ID4gc2VlbXMNCj4gPiA+ID4gcmF0
aGVyIG5hdHVyYWwsIGJ1dCB0aGUgYmV0dGVyIHNvbHR1dGlvbiB3b3VsZCBiZSB0byBtYWtlIGEg
c3RhdGljDQo+ID4gPiA+IGlubGluZQ0KPiA+ID4gPiBmdW5jdGlvbiBpbiBib3RoIGNhc2VzLiAg
VGhlcmUgd291bGQgbmF0dXJhbGx5IGJlIGEgYmxhbmsgbGluZSBiZWZvcmUgYQ0KPiA+ID4gPiBm
dW5jdGlvbiBkZWZpbml0aW9uIGFzIHdlbGwuDQo+ID4gPg0KPiA+ID4gZ290IHlvdXIgcG9pbnQs
IHNvLCBzaG91bGQgaSBpZ25vcmUgdGhpcz8NCj4gPiBOb3Qgc3VyZSB3aGF0IHlvdSBtZWFuIGJ5
IGlnbm9yZS4gIElmIHlvdSByZXdyaXRlIHRoZSAjZGVmaW5lIGFzIGENCj4gPiBmdW5jdGlvbiwg
YW4gdXNlIHRoZSBuYXR1cmFsIHBsYWNlbWVudCBmb3IgYSBmdW5jdGlvbiBkZWZpbml0aW9uLCB0
aGVuIHRoZQ0KPiA+IGNoZWNrcGF0Y2ggd2FybmluZyB3aWxsIGdvIGF3YXkgYXMgYSBzaWRlIGVm
ZmVjdC4NCj4NCj4NCj4gSSBtZWFuIGlnbm9yZSB0aGlzIHBhdGNoIGFuZCBtYWtlIGFub3RoZXIg
cGF0Y2ggd2l0aCByZXdyaXRlICNkZWZpbmUgYXMgeW91DQo+IHN1Z2dlc3RlZC4NCg0KWWVzIDop
ICBUaGF0J3MgZmluZSAoImRyb3AiIHdvdWxkIGJlIGJldHRlciB0aGFuICJpZ25vcmUiKS4NCg0K
anVsaWENCg0KPg0KPg0KPiBNZW5uYQ0KPg0KPiA+DQo+ID4ganVsaWENCj4gPg0KPiA+ID4NCj4g
PiA+IE1lbm5hDQo+ID4gPg0KPiA+ID4gPiBqdWxpYQ0KPiA+ID4gPg0KPiA+ID4gPiA+IFNpZ25l
ZC1vZmYtYnk6IE1lbm5hIE1haG1vdWQgPGVuZy5tZW5uYW1haG1vdWQubW1AZ21haWwuY29tPg0K
PiA+ID4gPiA+IC0tLQ0KPiA+ID4gPiA+ICAgIGRyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2dicGh5
LmggfCAyICsrDQo+ID4gPiA+ID4gICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQ0K
PiA+ID4gPiA+DQo+ID4gPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVz
L2dicGh5LmgNCj4gPiA+ID4gPiBiL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2dicGh5LmgNCj4g
PiA+ID4gPiBpbmRleCBkNGEyMjViNzYzMzguLjFkZTUxMDQ5OTQ4MCAxMDA2NDQNCj4gPiA+ID4g
PiAtLS0gYS9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9nYnBoeS5oDQo+ID4gPiA+ID4gKysrIGIv
ZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvZ2JwaHkuaA0KPiA+ID4gPiA+IEBAIC0xNSw2ICsxNSw3
IEBAIHN0cnVjdCBnYnBoeV9kZXZpY2Ugew0KPiA+ID4gPiA+ICAgIAlzdHJ1Y3QgbGlzdF9oZWFk
IGxpc3Q7DQo+ID4gPiA+ID4gICAgCXN0cnVjdCBkZXZpY2UgZGV2Ow0KPiA+ID4gPiA+ICAgIH07
DQo+ID4gPiA+ID4gKw0KPiA+ID4gPiA+ICAgICNkZWZpbmUgdG9fZ2JwaHlfZGV2KGQpIGNvbnRh
aW5lcl9vZihkLCBzdHJ1Y3QgZ2JwaHlfZGV2aWNlLCBkZXYpDQo+ID4gPiA+ID4NCj4gPiA+ID4g
PiAgICBzdGF0aWMgaW5saW5lIHZvaWQgKmdiX2dicGh5X2dldF9kYXRhKHN0cnVjdCBnYnBoeV9k
ZXZpY2UgKmdkZXYpDQo+ID4gPiA+ID4gQEAgLTQzLDYgKzQ0LDcgQEAgc3RydWN0IGdicGh5X2Ry
aXZlciB7DQo+ID4gPiA+ID4NCj4gPiA+ID4gPiAgICAJc3RydWN0IGRldmljZV9kcml2ZXIgZHJp
dmVyOw0KPiA+ID4gPiA+ICAgIH07DQo+ID4gPiA+ID4gKw0KPiA+ID4gPiA+ICAgICNkZWZpbmUg
dG9fZ2JwaHlfZHJpdmVyKGQpIGNvbnRhaW5lcl9vZihkLCBzdHJ1Y3QgZ2JwaHlfZHJpdmVyLA0K
PiA+ID4gPiA+IGRyaXZlcikNCj4gPiA+ID4gPg0KPiA+ID4gPiA+ICAgIGludCBnYl9nYnBoeV9y
ZWdpc3Rlcl9kcml2ZXIoc3RydWN0IGdicGh5X2RyaXZlciAqZHJpdmVyLA0KPiA+ID4gPiA+IC0t
DQo+ID4gPiA+ID4gMi4zNC4xDQo+ID4gPiA+ID4NCj4gPiA+ID4gPg0KPiA+ID4gPiA+DQo+ID4g
Pg0KPg==

--8323329-996529056-1679226402=:2867
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

--8323329-996529056-1679226402=:2867--
