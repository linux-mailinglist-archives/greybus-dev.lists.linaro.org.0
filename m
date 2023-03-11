Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD826B5C05
	for <lists+greybus-dev@lfdr.de>; Sat, 11 Mar 2023 13:55:29 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 782743F4FB
	for <lists+greybus-dev@lfdr.de>; Sat, 11 Mar 2023 12:55:28 +0000 (UTC)
Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	by lists.linaro.org (Postfix) with ESMTPS id E3D613EA27
	for <greybus-dev@lists.linaro.org>; Sat, 11 Mar 2023 12:55:20 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=inria.fr header.s=dc header.b=gyUecKJQ;
	spf=pass (lists.linaro.org: domain of julia.lawall@inria.fr designates 192.134.164.83 as permitted sender) smtp.mailfrom=julia.lawall@inria.fr;
	dmarc=pass (policy=none) header.from=inria.fr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=bI9XVtudhiGObX5Xjo5yuLSTfAHgHL+jaTd4yxThz9E=;
  b=gyUecKJQ9TidEy2D2EHQSrjzoqmW6xumu8PjMRG4Rv5iOGfWn0Pscs9a
   ic2qezuy++8DYIVNKoXwnLBz/JUQUk/+bPWkJYWh0eNNwWS05HgMmXClK
   LEDBJ+xtQMsPCsOwMyPKeYRnTFnpJcqBg/KRo/fT05bpx0+hVAQ2LZFZz
   M=;
X-IronPort-AV: E=Sophos;i="5.98,252,1673910000";
   d="scan'208";a="96643328"
Received: from 231.85.89.92.rev.sfr.net (HELO hadrien) ([92.89.85.231])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2023 13:55:19 +0100
Date: Sat, 11 Mar 2023 13:55:19 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
In-Reply-To: <71211670-60f9-11f4-1ee7-f94d4d9df4fb@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2303111354490.2802@hadrien>
References: <b6521b9a75a4088d621246b436c7ec5d35365690.1678462486.git.eng.mennamahmoud.mm@gmail.com> <alpine.DEB.2.22.394.2303110958250.2802@hadrien> <71211670-60f9-11f4-1ee7-f94d4d9df4fb@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-602893840-1678539319=:2802"
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: E3D613EA27
X-Spamd-Bar: -
X-Spamd-Result: default: False [-1.00 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	CTYPE_MIXED_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[inria.fr,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:192.134.164.0/24];
	R_DKIM_ALLOW(-0.20)[inria.fr:s=dc];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:2200, ipnet:192.134.164.0/24, country:FR];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[inria.fr:+]
Message-ID-Hash: XN2I3FL3YHPYTRPM6OUWH2RHQNWX6XRV
X-Message-ID-Hash: XN2I3FL3YHPYTRPM6OUWH2RHQNWX6XRV
X-MailFrom: julia.lawall@inria.fr
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: outreachy@lists.linux.dev, vireshk@kernel.org, johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 1/2] staging: greybus: Fix Alignment with parenthesis
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/XN2I3FL3YHPYTRPM6OUWH2RHQNWX6XRV/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-602893840-1678539319=:2802
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQoNCk9uIFNhdCwgMTEgTWFyIDIwMjMsIE1lbm5hIE1haG1vdWQgd3JvdGU6DQoNCj4NCj4gT24g
2aHZoS/Zoy/Zotmg2aLZoyDZodmgOtml2aksIEp1bGlhIExhd2FsbCB3cm90ZToNCj4gPg0KPiA+
IE9uIEZyaSwgMTAgTWFyIDIwMjMsIE1lbm5hIE1haG1vdWQgd3JvdGU6DQo+ID4NCj4gPiA+IEZp
eCAiIENIRUNLOiBBbGlnbm1lbnQgc2hvdWxkIG1hdGNoIG9wZW4gcGFyZW50aGVzaXMgIg0KPiA+
ID4gUmVwb3J0ZWQgYnkgY2hlY2twYXRoDQo+ID4gU2VlIHRoZSBtZXNzYWdlIGluIHRoZSBvdGhl
ciBtYWlsIGFib3V0IHRoZSBsb2cgbWVzc2FnZS4NCj4gPg0KPiA+IEFsc28sIHlvdSBzaG91bGQg
bm90IGhhdmUgdHdvIHBhdGNoZXMgd2l0aCB0aGUgc2FtZSBzdWJqZWN0LiAgSGVyZSwgdGhlDQo+
ID4gY2hhbmdlcyBhcmUgb24gdGhlIHNhbWUgZmlsZSBhbmQgYXJlIGVzc2VudGlhbGx5IHRoZSBz
YW1lLCBldmVuIGludm9sdmluZw0KPiA+IHRoZSBzYW1lIGZ1bmN0aW9uIGNhbGwuICBTbyB0aGV5
IGNhbiBiZSB0b2dldGhlciBpbiBvbmUgcGF0Y2guDQo+ID4NCj4gPiBqdWxpYQ0KPiBva2F5LCBJ
IHdpbGwuIGFwcHJlY2lhdGUgeW91ciBmZWVkYmFjay4gdGhhbmtzLg0KDQpQbGVhc2UgcHV0IHNv
bWUgYmxhbmsgbGluZXMgYXJvdW5kIHlvdXIgcmVzcG9uc2UsIHNvIGl0IGlzIGVhc2llciB0byBm
aW5kLg0KDQp0aGFua3MsDQpqdWxpYQ0KDQo+ID4NCj4gPiA+IFNpZ25lZC1vZmYtYnk6IE1lbm5h
IE1haG1vdWQgPGVuZy5tZW5uYW1haG1vdWQubW1AZ21haWwuY29tPg0KPiA+ID4gLS0tDQo+ID4g
PiAgIGRyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2Z3LWNvcmUuYyB8IDIgKy0NCj4gPiA+ICAgMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+ID4gPg0KPiA+ID4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2Z3LWNvcmUuYw0KPiA+ID4gYi9k
cml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9mdy1jb3JlLmMNCj4gPiA+IGluZGV4IDU3YmViZjI0NjM2
Yi4uZjU2MmNiMTJkNWFkIDEwMDY0NA0KPiA+ID4gLS0tIGEvZHJpdmVycy9zdGFnaW5nL2dyZXli
dXMvZnctY29yZS5jDQo+ID4gPiArKysgYi9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9mdy1jb3Jl
LmMNCj4gPiA+IEBAIC04OSw3ICs4OSw3IEBAIHN0YXRpYyBpbnQgZ2JfZndfY29yZV9wcm9iZShz
dHJ1Y3QgZ2JfYnVuZGxlICpidW5kbGUsDQo+ID4gPiAgIAkJCX0NCj4gPiA+DQo+ID4gPiAgIAkJ
CWNvbm5lY3Rpb24gPSBnYl9jb25uZWN0aW9uX2NyZWF0ZShidW5kbGUsIGNwb3J0X2lkLA0KPiA+
ID4gLQkJCQkJCWdiX2Z3X21nbXRfcmVxdWVzdF9oYW5kbGVyKTsNCj4gPiA+ICsNCj4gPiA+IGdi
X2Z3X21nbXRfcmVxdWVzdF9oYW5kbGVyKTsNCj4gPiA+ICAgCQkJaWYgKElTX0VSUihjb25uZWN0
aW9uKSkgew0KPiA+ID4gICAJCQkJcmV0ID0gUFRSX0VSUihjb25uZWN0aW9uKTsNCj4gPiA+ICAg
CQkJCWRldl9lcnIoJmJ1bmRsZS0+ZGV2LA0KPiA+ID4gLS0NCj4gPiA+IDIuMzQuMQ0KPiA+ID4N
Cj4gPiA+DQo+ID4gPg0KPg==

--8323329-602893840-1678539319=:2802
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

--8323329-602893840-1678539319=:2802--
