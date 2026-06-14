Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kW6fCmnfL2oiIQUAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Mon, 15 Jun 2026 13:18:01 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id D5A8E685A9A
	for <lists+greybus-dev@lfdr.de>; Mon, 15 Jun 2026 13:18:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=gmail.com header.s=20251104 header.b=RllPo7Ig;
	spf=pass (mail.lfdr.de: domain of "greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org" designates 44.210.186.118 as permitted sender) smtp.mailfrom="greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org";
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=gmail.com (policy=none);
	arc=reject ("signature check failed: fail, {[1] = sig:google.com:reject}")
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id E61BB40A97
	for <lists+greybus-dev@lfdr.de>; Mon, 15 Jun 2026 11:17:59 +0000 (UTC)
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	by lists.linaro.org (Postfix) with ESMTPS id 5AD5340A11
	for <greybus-dev@lists.linaro.org>; Sun, 14 Jun 2026 08:43:06 +0000 (UTC)
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-7e6deacafa8so2129633a34.0
        for <greybus-dev@lists.linaro.org>; Sun, 14 Jun 2026 01:43:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781426586; cv=none;
        d=google.com; s=arc-20240605;
        b=TiyutrgQ+RDP6YhhWcVza09QccOZTSW8Ihj5dxNNzEAYTcFPRwAbbs7fk4p2iu0vim
         +DVpLRiUATgaPX0gQAUsMWgpexB2KIewBMltx0iEQVsuZHVrNety0X03FslXr+pq5y/R
         EniMfsy9tXDBtQTlqyy1+iRXXoMIqz+g8lmNl+mMIN/G2RKOBn3FAv/RmTm3yd0ne9Bi
         lyqtZkYKv+arbioA+BAJEdM+Z7+EU6KM3nX6aT+bOE9By63upeFA7Qq05zZraO2pgEw9
         uCkGkSG7uGLosZ1Pkuld61USVnFnneBDfezpNisWDHRCMr+iOM1tG+E7DPDc08lT7kWH
         qR7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=t2FPNTZ0LBeauhe2IRB3wKbW8uCrpmddfDCYByrAJvs=;
        fh=bvKXaH3IWS+rVacylZK3q1dgyuDhF+NvTWLetLmCUEU=;
        b=ZzuXvtTJeLveG4gENLNmSI5r0fuzMDc6pLmKmAOVQlYDgbPkcZSWcsaVHBCCamsOPX
         ASibnoiIRMen3FlpbfQTzalo3RN/QjZkOHhf27VbL0V3GxIs/E/U1T2MHKHhT9pSjsvi
         OUxXr50vcuyNkw5TKx6i9pvfqO6u6TUosYGQEvnCIboB5HwmCthEiMkwU37NFGfLfx4i
         cxrTbBFk9AmvTnbKvLr2OELm0KcJjzlo7ody75s+mGbA9gfVvxIkiqDJZ/cJVJJDqCJc
         XhpNge/Ec/8QUnL86ghx6qgTkI4MYoQJXMK5/LHTRNRwcv+5cF/VIEdlVidTVIjf17Y0
         joHQ==;
        darn=lists.linaro.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781426586; x=1782031386; darn=lists.linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t2FPNTZ0LBeauhe2IRB3wKbW8uCrpmddfDCYByrAJvs=;
        b=RllPo7IgzEEJIusTrOyQjmFjLXomxJPdORwrXKadDnqTiggiVW8c4NIacM/I5sVGo6
         M0OHLhgvciRymS3I6G9szvgppNDXbqn8rUkVJVKKsLyLbeL21OWqLF16NlXKqu+VaINl
         lESKO8AXYhZCdcGP+Tg8iQahJM7ZVKw9tdpIul/NFw2iZiXbzMuzhxSjfx0Qa4VhZ1NH
         y1FLNuuX3m9l02eQftuEsKTmJEDoemrcUl5w0bdUtn553prhzRIFP1kgNsofgDpsrq5O
         lSBQ0S1Iy+E8v3NmT0gxfdUBwOer0Cs0yPQgaOxnHbCi5Ah+s+WP9MbKy23Qm66g81vP
         LAzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781426586; x=1782031386;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=t2FPNTZ0LBeauhe2IRB3wKbW8uCrpmddfDCYByrAJvs=;
        b=jDzmqyKrADnLedXos3+WqeT9KTyGyfUWvust3bRBHFQ7QHHKKeZ9ypFsGykzGWAYMP
         YsD29Zw0C3fcsjeV/zxCJNPrYB6PAA1/raCpTt9iyrsN0cgZdAKEcHwtxBJZnyiWBNje
         ++Hpbtg7OaOwPE10k8fq/FRj6s8xCXE56c7gY1mwbpbkTG+7fNlCYvnIGys8Lhtx9M7a
         7m6jBwvVwWw98oG8ny80gLrxKBHo4/vYdnv42Vw/Kzv7poHP09xrdBz1ZCv7XHoTE4db
         tZqWVgreoiIaGNMW9QieKTt5fwW6fip+C2Vf0CFHOjHqThA4O382/s7yy6RJoIDZoA95
         qYpQ==
X-Forwarded-Encrypted: i=1; AFNElJ+IxRdxy4zFEhIXzZxGre+FiVrNkuNPm/WLRwLmlCCI2tX6yjouNj9ENNtc61Ct6SH2XpYTMMr1BkfWlg==@lists.linaro.org
X-Gm-Message-State: AOJu0YxRgm9DpX6EK9dYkYbIJucguEA5fMIg6aMeah6U+BjEp8KteyST
	kKM4kiPZYIoesTzGCNuY8erlWg+3AF9UtWJhNNbysmr6hb3CtBr+knRUUiNddR/5vb2EFpNFsb+
	Ak5WrXpL85cEzRDn6j21UfnoZgV8qlzc=
X-Gm-Gg: Acq92OGX8NfFkQw4KLX+oLNmQeY1HNzVV2NOaWY9vCC9hOeNjI7z7hKo2IZ/kxn79l8
	mo59/st24b11tMcNMLkfGvnug92AaJmO1HThSdRtsToF7Fsaot6MF1ioMp+YGFe5IA+h0A5iyAW
	G7fgoLrdJkrhWNIF2n7wBAl/rJf8bXoFnx0uErGAL50s/ZDklgSo5zxvoMicXiQh/LoFuTNw3FO
	c6Qr9YzUQXEgpdNmsDhEnWIdEYtUbXDLoBwO8sDwfh2ZR5lGg47wBE0pqpQinCDA2Y8CYmw/uQg
	7h6j1pDa6Q==
X-Received: by 2002:a05:6808:c40c:b0:486:5306:dd91 with SMTP id
 5614622812f47-4872dd9f493mr6250582b6e.7.1781426585618; Sun, 14 Jun 2026
 01:43:05 -0700 (PDT)
MIME-Version: 1.0
References: <20260614060857.15366-1-abdelnasserhussein11@gmail.com> <2026061419-bunkmate-cinch-b506@gregkh>
In-Reply-To: <2026061419-bunkmate-cinch-b506@gregkh>
From: nasser <abdelnasserhussein11@gmail.com>
Date: Sun, 14 Jun 2026 11:42:54 +0300
X-Gm-Features: AVVi8CdUp7QjVsdE2N5IiYG6QwUSvi_854TvUVAKenslfGhwaHj6rgkG34WHdVE
Message-ID: <CANpqX3bBFfSFteX+_9snU1KjYQK0cZT9KnNa9XpsSOk-254gHw@mail.gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
X-Spamd-Bar: -----
X-MailFrom: abdelnasserhussein11@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: YQSAYINEFW7J727YMFJX6WXIIDZJG3PU
X-Message-ID-Hash: YQSAYINEFW7J727YMFJX6WXIIDZJG3PU
X-Mailman-Approved-At: Mon, 15 Jun 2026 11:17:31 +0000
CC: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v2] staging: greybus: audio: check sscanf() result directly
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/YQSAYINEFW7J727YMFJX6WXIIDZJG3PU/>
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
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	DATE_IN_PAST(1.00)[26];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+mx:c];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:gregkh@linuxfoundation.org,m:johan@kernel.org,m:elder@kernel.org,m:greybus-dev@lists.linaro.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:lkp@intel.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[abdelnasserhussein11@gmail.com,greybus-dev-bounces@lists.linaro.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abdelnasserhussein11@gmail.com,greybus-dev-bounces@lists.linaro.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	TAGGED_RCPT(0.00)[greybus-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,intel.com:email,linaro.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D5A8E685A9A

SGkgR3JlZywNCg0KVGhhbmtzIGZvciB0aGUgcmV2aWV3IGFuZCB0aGUgZmVlZGJhY2suDQoNCk9u
IFN1biwgSnVuIDE0LCAyMDI2IGF0IDA2OjE1OjAwQU0gKzAwMDAsIEdyZWcgS3JvYWgtSGFydG1h
biB3cm90ZToNCj4gV2hlbiB5b3Ugc2F5ICJhbHNvIiB0aGF0IGltcGxpZXMgaXQgc2hvdWxkIGJl
IGEgc2VwYXJhdGUgcGF0Y2guDQoNClVuZGVyc3Rvb2QuIEkgd2lsbCBzcGxpdCB0aGVzZSBjaGFu
Z2VzIGludG8gYSB0d28tcGF0Y2ggc2VyaWVzIGluIHYzLg0KDQo+IGxrcCBkaWRuJ3QgcmVwb3J0
IHRoZSBzbWF0Y2ggd2FybmluZyA6KA0KDQpNeSBtaXN0YWtlLiBJIHdpbGwgZml4IHRoZSBSZXBv
cnRlZC1ieSBhbmQgQ2xvc2VzIHRhZ3MgaW4gdGhlIG5leHQNCnZlcnNpb24gdG8gY29ycmVjdGx5
IHJlZmxlY3QgdGhlIHNvdXJjZSBvZiB0aGUgd2FybmluZy4NCg0KPiBObyBsaXN0IG9mIHdoYXQg
Y2hhbmdlZCBmcm9tIHByZXZpb3VzIHZlcnNpb25zPw0KDQpJIGFwb2xvZ2l6ZSBmb3IgbWlzc2lu
ZyB0aGF0LiBJIHdpbGwgbWFrZSBzdXJlIHRvIGluY2x1ZGUgYSBwcm9wZXINCmNoYW5nZWxvZyBi
ZWxvdyB0aGUgJy0tLScgbGluZSBmb3IgdjMuDQoNCkkgd2lsbCBzZW5kIHRoZSB2MyBwYXRjaCBz
ZXJpZXMgc2hvcnRseS4NCg0KVGhhbmtzLA0KQWJkZWxuYXNzZXINCg0KDQpPbiBTdW4sIEp1biAx
NCwgMjAyNiBhdCA5OjE34oCvQU0gR3JlZyBLcm9haC1IYXJ0bWFuDQo8Z3JlZ2toQGxpbnV4Zm91
bmRhdGlvbi5vcmc+IHdyb3RlOg0KPg0KPiBPbiBTdW4sIEp1biAxNCwgMjAyNiBhdCAwOTowODo1
N0FNICswMzAwLCBhYmRlbG5hc3NlciBodXNzZWluIHdyb3RlOg0KPiA+IFNtYXRjaCB3YXJuczoN
Cj4gPg0KPiA+ICAgZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvYXVkaW9fY29kZWMuYzozMzUgZ2Jh
dWRpb19tb2R1bGVfdXBkYXRlKCkNCj4gPiAgIHdhcm46IHNzY2FuZiBkb2Vzbid0IHJldHVybiBl
cnJvciBjb2Rlcw0KPiA+DQo+ID4gc3NjYW5mKCkgcmV0dXJucyB0aGUgbnVtYmVyIG9mIHN1Y2Nl
c3NmdWxseSBtYXRjaGVkIGlucHV0IGl0ZW1zLCBub3QgYQ0KPiA+IG5lZ2F0aXZlIGVycm9yIGNv
ZGUuIENvbXBhcmUgdGhlIHJldHVybiB2YWx1ZSBkaXJlY3RseSB3aXRoIHRoZSBleHBlY3RlZA0K
PiA+IG51bWJlciBvZiBjb252ZXJzaW9ucyBpbnN0ZWFkIG9mIHN0b3JpbmcgaXQgaW4gcmV0IGFz
IGFuIGVycm9yIGNvZGUuDQo+ID4NCj4gPiBBbHNvIHJlbW92ZSB0aGUgcmVkdW5kYW50IGVsc2Ut
aWYgY2hlY2sgZm9yIHNuZF9zb2NfZGFwbV9haWZfb3V0LiBUaGUNCj4gPiB3aWRnZXQgaWQgaXMg
dmFsaWRhdGVkIGVhcmxpZXIgaW4gdGhlIGZ1bmN0aW9uLCBzbyB0aGUgcmVtYWluaW5nIGJyYW5j
aA0KPiA+IGNhbiBvbmx5IGhhbmRsZSBzbmRfc29jX2RhcG1fYWlmX291dC4gVGhpcyBhdm9pZHMg
YSBjb21waWxlciB3YXJuaW5nDQo+ID4gYWJvdXQgYSBwb3RlbnRpYWxseSB1bmluaXRpYWxpemVk
IHZhcmlhYmxlLg0KPg0KPiBXaGVuIHlvdSBzYXkgImFsc28iIHRoYXQgaW1wbGllcyBpdCBzaG91
bGQgYmUgYSBzZXBhcmF0ZSBwYXRjaC4NCj4NCj4gPg0KPiA+IFJlcG9ydGVkLWJ5OiBrZXJuZWwg
dGVzdCByb2JvdCA8bGtwQGludGVsLmNvbT4NCj4NCj4gbGtwIGRpZG4ndCByZXBvcnQgdGhlIHNt
YXRjaCB3YXJuaW5nIDooDQo+DQo+ID4gQ2xvc2VzOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9v
ZS1rYnVpbGQtYWxsLzIwMjYwNjE0MDM0Ny5nR1ZXRG5iaS1sa3BAaW50ZWwuY29tLw0KPiA+DQo+
ID4gU2lnbmVkLW9mZi1ieTogYWJkZWxuYXNzZXIgaHVzc2VpbiA8YWJkZWxuYXNzZXJodXNzZWlu
MTFAZ21haWwuY29tPg0KPiA+IC0tLQ0KPiA+ICBkcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9hdWRp
b19jb2RlYy5jIHwgNSArKy0tLQ0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCsp
LCAzIGRlbGV0aW9ucygtKQ0KPg0KPiBObyBsaXN0IG9mIHdoYXQgY2hhbmdlZCBmcm9tIHByZXZp
b3VzIHZlcnNpb25zPw0KPg0KPiB0aGFua3MsDQo+DQo+IGdyZWcgay1oDQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpncmV5YnVzLWRldiBtYWlsaW5nIGxp
c3QgLS0gZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpUbyB1bnN1YnNjcmliZSBzZW5kIGFu
IGVtYWlsIHRvIGdyZXlidXMtZGV2LWxlYXZlQGxpc3RzLmxpbmFyby5vcmcK
