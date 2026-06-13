Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 78oTE2HfL2ocIQUAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Mon, 15 Jun 2026 13:17:53 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id DBFFA685A8B
	for <lists+greybus-dev@lfdr.de>; Mon, 15 Jun 2026 13:17:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=gmail.com header.s=20251104 header.b=rZfIk+H8;
	spf=pass (mail.lfdr.de: domain of "greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org" designates 44.210.186.118 as permitted sender) smtp.mailfrom="greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org";
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=gmail.com (policy=none);
	arc=reject ("signature check failed: fail, {[1] = sig:google.com:reject}")
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id F40CB40A88
	for <lists+greybus-dev@lfdr.de>; Mon, 15 Jun 2026 11:17:51 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	by lists.linaro.org (Postfix) with ESMTPS id 0F4663F8F1
	for <greybus-dev@lists.linaro.org>; Sat, 13 Jun 2026 15:38:37 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-bec3f69d343so288895566b.0
        for <greybus-dev@lists.linaro.org>; Sat, 13 Jun 2026 08:38:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781365116; cv=none;
        d=google.com; s=arc-20240605;
        b=Iet94UL5q4nuuaOUjjlR6DyhQZTFCnIqF9UJopw38rFj1bVqti5zqpzsucGLieJDXB
         aulptn7E+vyLWy2qqDf7xwQveTs5hzdCmKLuMRmlPvi/8xdqIzKqhmcn6H8bi3wx6+mS
         9GtkNlBRJvuqWWGg++Pam2PwxIBqwvhLB/Zqv4zJAxGPxQS09xlWPsRTeI+zihrermnZ
         tPZTT0PKY5U/ka4nKUaKSMk90crdvKan0IKomt9j2qCLSjqY1auLpOOXj0RVG2pWp+Yj
         ImE3aeR0EJsB05jZ44OCi+/Oyklp81zbXDYkeBUYBEw+DovD+PA/k666c+Y9BLWqqViS
         nNLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uOWDGizk9369FTjRLh6NLGNPGfs8z28wb9Xl2vEAMls=;
        fh=5sY2vtp0kLqJoppi9RklvGELerz1JBDsXeyo4qboLDY=;
        b=Xik4YWhVzWBhD+2hci6ohj6mhpAoB9CD+NEhdntw7OSDAh4BwRZHmSAeYu4oRnSV3B
         pQaP3yIvCY5PPw0TXFVZ2unasL9Rn/Doc3+0IG4GWZuNP5RUCMvhOvA7ZRQMU7x9G/q6
         WCfF9uFNGDHApuQPxr01HlJ5Rq5agI7Sxlf0sO56jpbVNhQEi8dp+M7AkfBfDVJaNYHQ
         YfBAW9D8U7RVs5mmXwnLIOgTShvyl7en+rk6QNUF4C+1C2pe4NNeETsvC273Sjff9fqN
         832nhXqV62AhPjy5fd12lAh530x+kkawi6xjcadH7oEEC1kl4WZAinAOLzGBosUvy/Co
         8u9w==;
        darn=lists.linaro.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781365116; x=1781969916; darn=lists.linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uOWDGizk9369FTjRLh6NLGNPGfs8z28wb9Xl2vEAMls=;
        b=rZfIk+H8oNXLNSfRPOxTpyC6BsNcl+a43EhvEhm64PGZ8iWdT2jMszRkJlvc6q/z0z
         lZsiNZDEbGvwdlL6m9JHHWZLunszdCzdWTXjHcmswQKJx9Lq7SJqlPqGdaTKSVBGnaOm
         mBFAEObzlEiIfxPJ5/wDMQ+qT42HI8UU2D8KHLncOUWWWQqy8YFoR+6yYlD2rPQ5d+Pq
         SaqThX78rkHVpAqRVMKO/J/1BW58irSIa/GDw4n8IZqEA4aMIUHqrphmnyNnL6ghZjYQ
         844vSzSTr2+2uIY6oCvKvBZfWytf9is5z8ccQVjSgJe9cESFisHxwPG9Ni9+LL2A/Col
         /djg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781365116; x=1781969916;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uOWDGizk9369FTjRLh6NLGNPGfs8z28wb9Xl2vEAMls=;
        b=q1Fn04htuzEAz0fIIbypXbInLdNz8Cljg0D0CzkFOV25Q3KVmuXfh5aZVvdivvWHkD
         ScmCwtaXmGf9iHPCo5LuCBA7agLdy+qN0rQFjQpvsTHMAgA+I0sMAkrMwTclGiI7GHf6
         qwUbZpkBi9ESuAnXMSMn1m7ZatbrTUBQUswk2IXI1gfUxXJmhPe+7Bklv1cJ1D/Pa893
         94X2LBu/2a48cA3vdh6P8T0OViePVA7ItwbYjLYRQ6Q2swekNm4mPEFVpj1rMCUyoABD
         S76HusQA4FvTSwt9/OGaIVIhPTdrssuhaWj9GZIkVWG49ohEIRYzvCc+wtCS7rhTQT2u
         O7yA==
X-Forwarded-Encrypted: i=1; AFNElJ9S+zjpctccdJxsZVIp+itQfmpEXV/uDM9XjcBvGM3RLwEypsTemrDvqIlcWVOG1lSrxhO73o+FwjlktQ==@lists.linaro.org
X-Gm-Message-State: AOJu0YwCuDZFZ/9tz/mPG+sszMlZlzBvbzZ4xNtNT1Iikj0dlGN3QqBQ
	tlP2J+pfY9FGZ/4+4R/fH0owDz56bOnCAUR9O7jMLUBTe6Zb/lMKKDk4vxMyqFotYDEfDjbOYWw
	PdWqRiJeBk4s58TkjruHeHxVxOrJ4RVM=
X-Gm-Gg: Acq92OF8x2fLmvTnkY4FKeam9QSqAJpE4PlYxYEY0pJBD0sgq66IILaACWoOKfPGW/p
	lExNUems78JLM4Cg0QJqlngto4Nk1ysxrX6o0r+4tHVv3F0kU0KvtHTL/G4I9G3JtroppTWDesZ
	ubqWqSKnBNRAqqToZMoQAPxSGTQJC0xzdI1OsTlQsQId8WBcbTNHQi7H8o6pGLPVyxNaDcKZzQX
	uGTsB5vrq9WLGUFj5CvTR0P1cCIFJp6tVDlkWY58CKu+jEUY94bgk35f7QoU1ddE14+DntAyOlW
	WHk64/U5eK3sfhCuBARP9KA=
X-Received: by 2002:a17:907:e895:b0:bed:d329:1ed9 with SMTP id
 a640c23a62f3a-bff4bdfcba1mr152037266b.33.1781365115721; Sat, 13 Jun 2026
 08:38:35 -0700 (PDT)
MIME-Version: 1.0
References: <20260613014905.48458-1-brockhaftner@gmail.com>
 <aiz1bMmAN-gQnm9x@stanley.mountain> <aiz14CLCduz7996E@stanley.mountain>
In-Reply-To: <aiz14CLCduz7996E@stanley.mountain>
From: Brock Haftner <brockhaftner@gmail.com>
Date: Sat, 13 Jun 2026 08:38:24 -0700
X-Gm-Features: AVVi8Cd5UbthRNShg8YEncP0KBxT_NGxx0mp2GrBPMxb4eVX4ZgEGIFccYFnCgs
Message-ID: <CAAYiRaP0ahm9NsmPBdEy1A_TiCPCfGt-nBC_xf1-tN_RiuvmSA@mail.gmail.com>
To: Dan Carpenter <error27@gmail.com>
X-Spamd-Bar: ----
X-MailFrom: brockhaftner@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: XTJJDGZM7X6TNMF5LHPNJMY2KGAH3J32
X-Message-ID-Hash: XTJJDGZM7X6TNMF5LHPNJMY2KGAH3J32
X-Mailman-Approved-At: Mon, 15 Jun 2026 11:17:31 +0000
CC: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, outreachy@lists.linux.dev, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: audio: add missing newline to sysfs_emit formats
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/XTJJDGZM7X6TNMF5LHPNJMY2KGAH3J32/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.69 / 15.00];
	DATE_IN_PAST(1.00)[43];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	R_SPF_ALLOW(-0.20)[+mx:c];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	FORGED_SENDER(0.00)[brockhaftner@gmail.com,greybus-dev-bounces@lists.linaro.org];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:error27@gmail.com,m:johan@kernel.org,m:elder@kernel.org,m:outreachy@lists.linux.dev,m:greybus-dev@lists.linaro.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brockhaftner@gmail.com,greybus-dev-bounces@lists.linaro.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,linaro.org:email,checkpatch.pl:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DBFFA685A8B

T24gU2F0LCBKdW4gMTMsIDIwMjYgYXQgMDk6MTc6MDhBTSArMDMwMCwgRGFuIENhcnBlbnRlciB3
cm90ZToNCj4gT24gU2F0LCBKdW4gMTMsIDIwMjYgYXQgMDk6MTU6MDhBTSArMDMwMCwgRGFuIENh
cnBlbnRlciB3cm90ZToNCj4gPiBPbiBGcmksIEp1biAxMiwgMjAyNiBhdCAwNjo0OTowNVBNIC0w
NzAwLCBCcm9jayBIYWZ0bmVyIHdyb3RlOg0KPiA+ID4gVGhlIHN5c2ZzX2VtaXQoKSBmdW5jdGlv
biBpcyB1c2VkIHRvIGZvcm1hdCBzdHJpbmdzIHRoYXQgYXJlIHJldHVybmVkDQo+ID4gPiB0byB1
c2Vyc3BhY2UuIEFjY29yZGluZyB0byB0aGUgc3lzZnMgZG9jdW1lbnRhdGlvbiwgdGhlc2Ugb3V0
cHV0cw0KPiA+ID4gc2hvdWxkIGluY2x1ZGUgYSBuZXdsaW5lIGNoYXJhY3RlciBmb3IgdmlzdWFs
IGNsYXJpdHkuDQo+ID4gPg0KPiA+ID4gRml4IHRoZSBjaGVja3BhdGNoLnBsIHdhcm5pbmdzIGJ5
IGFkZGluZyB0aGUgbWlzc2luZyAnXG4nIHRvIHRoZQ0KPiA+ID4gc3lzZnNfZW1pdCgpIGZvcm1h
dCBzdHJpbmdzIGluc2lkZSBzZXZlcmFsIGZ1bmN0aW9ucy4NCj4gPiA+DQo+ID4gPiBTaWduZWQt
b2ZmLWJ5OiBCcm9jayBIYWZ0bmVyIDxicm9ja2hhZnRuZXJAZ21haWwuY29tPg0KPiA+DQo+ID4g
UGxlYXNlIGRvbid0IGRvIHRoaXMgZm9yIGV4aXN0aW5nIGNvZGUsIG9ubHkgZm9yIG5ldyBjb2Rl
LiAgVGhlcmUNCj4gPiBpcyBhIHJpc2NrIHRoYXQgdXNlciBzcGFjZSByZWxpZXMgb24gdGhlIG9s
ZCBiZWhhdmlvci4NCj4NCj4gV2Ugc2hvdWxkIGRlbGV0ZSB0aGlzIGNoZWNrcGF0Y2ggd2Fybmlu
ZyByZWFsbHkuICBJdCBjb3VsZCBiZSBhDQo+IHNhc2hpa28gcnVsZSB3aGljaCBvbmx5IGFwcGxp
ZXMgZm9yIHBhdGNoZXMgd2hpY2ggaW50cm9kdWNlIG5ldw0KPiBmdW5jdGlvbnMgb3Igc29tZXRo
aW5nLg0KDQpUaGFuayB5b3UgZm9yIHRoZSBleHBsYW5hdGlvbiwgYXBvbG9naWVzIGZvciB0aGUg
bWlzdGFrZS4gSSBkaWQgbm90DQpjb25zaWRlciB1c2VyLXNwYWNlIGltcGxpY2F0aW9ucyBmb3Ig
YWRkaW5nIHRoZSBuZXdsaW5lIGNoYXJhY3RlcnMuDQpJIHdpbGwgZHJvcCB0aGlzIHBhdGNoLCB0
aGFuayB5b3UgZm9yIHRoZSByZXBseS4NCg0KQ2hlZXJzLA0KQnJvY2sNCg0KDQpPbiBGcmksIEp1
biAxMiwgMjAyNiBhdCAxMToxN+KAr1BNIERhbiBDYXJwZW50ZXIgPGVycm9yMjdAZ21haWwuY29t
PiB3cm90ZToNCj4NCj4gT24gU2F0LCBKdW4gMTMsIDIwMjYgYXQgMDk6MTU6MDhBTSArMDMwMCwg
RGFuIENhcnBlbnRlciB3cm90ZToNCj4gPiBPbiBGcmksIEp1biAxMiwgMjAyNiBhdCAwNjo0OTow
NVBNIC0wNzAwLCBCcm9jayBIYWZ0bmVyIHdyb3RlOg0KPiA+ID4gVGhlIHN5c2ZzX2VtaXQoKSBm
dW5jdGlvbiBpcyB1c2VkIHRvIGZvcm1hdCBzdHJpbmdzIHRoYXQgYXJlIHJldHVybmVkDQo+ID4g
PiB0byB1c2Vyc3BhY2UuIEFjY29yZGluZyB0byB0aGUgc3lzZnMgZG9jdW1lbnRhdGlvbiwgdGhl
c2Ugb3V0cHV0cw0KPiA+ID4gc2hvdWxkIGluY2x1ZGUgYSBuZXdsaW5lIGNoYXJhY3RlciBmb3Ig
dmlzdWFsIGNsYXJpdHkuDQo+ID4gPg0KPiA+ID4gRml4IHRoZSBjaGVja3BhdGNoLnBsIHdhcm5p
bmdzIGJ5IGFkZGluZyB0aGUgbWlzc2luZyAnXG4nIHRvIHRoZQ0KPiA+ID4gc3lzZnNfZW1pdCgp
IGZvcm1hdCBzdHJpbmdzIGluc2lkZSBzZXZlcmFsIGZ1bmN0aW9ucy4NCj4gPiA+DQo+ID4gPiBT
aWduZWQtb2ZmLWJ5OiBCcm9jayBIYWZ0bmVyIDxicm9ja2hhZnRuZXJAZ21haWwuY29tPg0KPiA+
DQo+ID4gUGxlYXNlIGRvbid0IGRvIHRoaXMgZm9yIGV4aXN0aW5nIGNvZGUsIG9ubHkgZm9yIG5l
dyBjb2RlLiAgVGhlcmUNCj4gPiBpcyBhIHJpc2NrIHRoYXQgdXNlciBzcGFjZSByZWxpZXMgb24g
dGhlIG9sZCBiZWhhdmlvci4NCj4NCj4gV2Ugc2hvdWxkIGRlbGV0ZSB0aGlzIGNoZWNrcGF0Y2gg
d2FybmluZyByZWFsbHkuICBJdCBjb3VsZCBiZSBhDQo+IHNhc2hpa28gcnVsZSB3aGljaCBvbmx5
IGFwcGxpZXMgZm9yIHBhdGNoZXMgd2hpY2ggaW50cm9kdWNlIG5ldw0KPiBmdW5jdGlvbnMgb3Ig
c29tZXRoaW5nLg0KPg0KPiByZWdhcmRzLA0KPiBkYW4gY2FycGVudGVyDQo+DQpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpncmV5YnVzLWRldiBtYWlsaW5n
IGxpc3QgLS0gZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpUbyB1bnN1YnNjcmliZSBzZW5k
IGFuIGVtYWlsIHRvIGdyZXlidXMtZGV2LWxlYXZlQGxpc3RzLmxpbmFyby5vcmcK
