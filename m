Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sG8VLx1dnGmkEwQAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Mon, 23 Feb 2026 14:58:53 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EC661778F5
	for <lists+greybus-dev@lfdr.de>; Mon, 23 Feb 2026 14:58:53 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 3B51A40445
	for <lists+greybus-dev@lfdr.de>; Mon, 23 Feb 2026 13:53:48 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by lists.linaro.org (Postfix) with ESMTPS id 1735E3F7DE
	for <greybus-dev@lists.linaro.org>; Mon, 23 Feb 2026 13:53:46 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=wnFxX2Sg;
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 172.234.252.31 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org;
	dmarc=pass (policy=none) header.from=linuxfoundation.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 85D6240841;
	Mon, 23 Feb 2026 13:53:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 304B4C116D0;
	Mon, 23 Feb 2026 13:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1771854825;
	bh=6Ln8+Sk3x3ghopBK8ov6B/CH600e+c28R5lk5Qd8NdI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=wnFxX2SgsAVwm2aqhGGmkB60ZU3e93u9gWw0rBmHX4ABv07OPP+L6wsXAX3VirTq7
	 6yFUKsuFgNt/wZ8B0H568SOp9MIk5htorY84dbARCqCThBr1sD7m4sJEjRHoGBGNgt
	 5L0dUB8NBw8EvXApmeqv+v0CJAS4fw5qTvcHvuHs=
Date: Mon, 23 Feb 2026 14:53:27 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Rachit Dhar <rchtdhr@gmail.com>
Message-ID: <2026022313-velocity-unwieldy-dd40@gregkh>
References: <20260204183033.182747-1-rchtdhr@gmail.com>
 <2026020714-tightness-atonable-8a17@gregkh>
 <CAJH1ELAO0VXJUC5s8W6KhVO4=4BA_ir94KDte+V87Vt-Sq6Ykw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJH1ELAO0VXJUC5s8W6KhVO4=4BA_ir94KDte+V87Vt-Sq6Ykw@mail.gmail.com>
X-Spamd-Bar: /
Message-ID-Hash: 3BGFBIT5JULHZOTHYT2LJIPBSDCJAHOF
X-Message-ID-Hash: 3BGFBIT5JULHZOTHYT2LJIPBSDCJAHOF
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v3 2/4] staging: greybus: fixed styling issue in fw-management.c
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/3BGFBIT5JULHZOTHYT2LJIPBSDCJAHOF/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [5.19 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	R_DKIM_REJECT(1.00)[linuxfoundation.org:s=korg];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx];
	DMARC_POLICY_SOFTFAIL(0.10)[linuxfoundation.org : SPF not aligned (relaxed),none];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	GREYLIST(0.00)[pass,body];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-0.967];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,greybus-dev-bounces@lists.linaro.org];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	TAGGED_RCPT(0.00)[greybus-dev];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linaro.org:helo,lists.linaro.org:rdns,linuxfoundation.org:email,linaro.org:email]
X-Rspamd-Queue-Id: 3EC661778F5
X-Rspamd-Action: no action

T24gTW9uLCBGZWIgMTYsIDIwMjYgYXQgMTA6MzM6NTlBTSArMDUzMCwgUmFjaGl0IERoYXIgd3Jv
dGU6DQo+IE9uIFNhdCwgRmViIDcsIDIwMjYgYXQgNzowOOKAr1BNIEdyZWcgS3JvYWgtSGFydG1h
bg0KPiA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+IHdyb3RlOg0KPiA+DQo+ID4gV2hhdCBz
cGVjaWZpYyBzdHlsZSBpc3N1ZSB3YXMgZml4ZWQ/ICBQbGVhc2UgYmUgc3BlY2lmaWMuDQo+ID4N
Cj4gPiBBbHNvLCB5b3VyIHBhdGNoZXMgd2VyZSBub3QgY29ycmVjdGx5IGxpbmtlZCB0b2dldGhl
ci4gIFBsZWFzZSB1c2UNCj4gPiBzb21ldGhpbmcgbGlrZSAnZ2l0IHNlbmQtZW1haWwnIHRvIHNl
bmQgdGhlbSBhbGwgYXQgb25jZS4gIE90aGVyd2lzZQ0KPiA+IHRoZXkgZ2V0IGxvc3QgYW5kIG91
dC1vZi1vcmRlciBhcyB5b3UgY2FuIHNlZSBpbiB0aGUgZW1haWwgYXJjaGl2ZXMgb24NCj4gPiBs
b3JlLmtlcm5lbC5vcmcuDQo+IA0KPiBUaGUgc3R5bGUgaXNzdWUgZml4ZWQgd2FzIGZvciB0aGUg
Zm9sbG93aW5nIGNoZWNrcGF0Y2ggY2hlY2s6DQo+IA0KPiBDSEVDSzogQWxpZ25tZW50IHNob3Vs
ZCBtYXRjaCBvcGVuIHBhcmVudGhlc2lzDQo+ICM0Mzc6IEZJTEU6IGRyaXZlcnMvc3RhZ2luZy9n
cmV5YnVzL2Z3LW1hbmFnZW1lbnQuYzo0Mzc6DQo+ICsgICAgICAgICAgICAgICByZXQgPSBmd19t
Z210X2xvYWRfYW5kX3ZhbGlkYXRlX29wZXJhdGlvbihmd19tZ210LA0KPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIGludGZfbG9hZC5sb2FkX21ldGhvZCwgaW50Zl9sb2FkLmZpcm13
YXJlX3RhZyk7DQo+IA0KPiBUaGFua3MgZm9yIHBvaW50aW5nIG91dCB0aGUgaXNzdWUgb2Ygb3V0
LW9mLW9yZGVyIHBhdGNoZXMuDQo+IEkgZGlkIHVzZSBnaXQgc2VuZC1lbWFpbCwgYnV0IGRpZCBz
byBmb3IgZWFjaCBwYXRjaCBzZXBhcmF0ZWx5LA0KPiB3aGljaCBtaWdodCBoYXZlIGxlZCB0byB0
aGlzLiBJZiBJIHNob3VsZCBzZW5kIGFub3RoZXIgcGF0Y2ggc2VyaWVzDQo+IHRvIGNvcnJlY3Qg
dGhpcywgcGxlYXNlIGxldCBtZSBrbm93Lg0KDQpJIGNhbid0IHRha2UgdGhlc2UgYXMtaXMsIHNv
IHllcywgcGxlYXNlIHJlYmFzZSBhbmQgcmVzZW5kIHRoZSByZW1haW5pbmcNCm9uZXMuDQoNCnRo
YW5rcywNCg0KZ3JlZyBrLWgNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmdyZXlidXMtZGV2IG1haWxpbmcgbGlzdCAtLSBncmV5YnVzLWRldkBsaXN0cy5s
aW5hcm8ub3JnClRvIHVuc3Vic2NyaWJlIHNlbmQgYW4gZW1haWwgdG8gZ3JleWJ1cy1kZXYtbGVh
dmVAbGlzdHMubGluYXJvLm9yZwo=
