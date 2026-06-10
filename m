Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6o/II16JKWrGYwMAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Wed, 10 Jun 2026 17:57:18 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 21AFD66B174
	for <lists+greybus-dev@lfdr.de>; Wed, 10 Jun 2026 17:57:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=agatha.dev header.s=default header.b=Hf1U1R9r;
	spf=pass (mail.lfdr.de: domain of "greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org" designates 44.210.186.118 as permitted sender) smtp.mailfrom="greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org";
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=agatha.dev (policy=none)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 3AD3140A24
	for <lists+greybus-dev@lfdr.de>; Wed, 10 Jun 2026 15:57:17 +0000 (UTC)
Received: from nyc3000-r.dnsiaas.com (nyc3000-r.dnsiaas.com [96.47.167.18])
	by lists.linaro.org (Postfix) with ESMTPS id 8CA0440150
	for <greybus-dev@lists.linaro.org>; Wed, 10 Jun 2026 15:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=agatha.dev;
	s=default; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=dXkquXoLXVgBlIqba+dV3n+xr4jjmhx766YSiM2pFno=; b=Hf1U1R9rpAE/Fug0fQ6pDv9uil
	BgUXduQszjqV0n0T9g4YwAW1Z2iZA8nSjovIQ1++Ah6fzAWmBBOBDjSRnhYmVPMKrYzDBbPRdZx46
	EFsLoEclRx+awt8VbLHgzkpNMMTRR2vh+09fws3bPFDKGK/RYIyH2nt5S94MBLZMfawkT7QDoYmHt
	7RsFFB1XV4bIstxwZnfOCRq5kNe6TRiwcL/oLT5QGmvuHc2nmRtTJEfor8tVvojCg77a9hJhzQZZQ
	Y9gTct7DdymsWcpfBCKqmZu2WGr0Fks9DQovAt1xP0jS/iePEB9TzGV8yPPkUP98osY6cZgSPXXVh
	gAH0Ot1Q==;
Received: from [170.254.153.168] (port=38428 helo=guidai)
	by nyc3000-r.dnsiaas.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <code@agatha.dev>)
	id 1wXLIA-0000000GTCj-1PWR;
	Wed, 10 Jun 2026 11:56:34 -0400
Date: Wed, 10 Jun 2026 12:56:27 -0300
From: Agatha Isabelle Moreira <code@agatha.dev>
To: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Message-ID: <guidai1XKN.5119.20264910ailrVzaYHJjfjtzS_13611_LINUXKERNEL_AGATHA_@links.agatha.dev>
References: <20260609202705.183875-1-enelsonmoore@gmail.com>
 <guidaiFoSi.541328.2026169aiie51mhcpgO149o_23655_LINUXKERNEL_AGATHA_@links.agatha.dev>
 <CADkSEUjVYOCYDRkr+WYD34_LH=gYGRyvHfwWH6q5jPLZBtXeTA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADkSEUjVYOCYDRkr+WYD34_LH=gYGRyvHfwWH6q5jPLZBtXeTA@mail.gmail.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - nyc3000-r.dnsiaas.com
X-AntiAbuse: Original Domain - lists.linaro.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - agatha.dev
X-Get-Message-Sender-Via: nyc3000-r.dnsiaas.com: authenticated_id: me@agatha.dev
X-Authenticated-Sender: nyc3000-r.dnsiaas.com: me@agatha.dev
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Spamd-Bar: ---
X-MailFrom: code@agatha.dev
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: HDTFWNDWDDQJOOOIRKJLD7XDSYSVBLKT
X-Message-ID-Hash: HDTFWNDWDDQJOOOIRKJLD7XDSYSVBLKT
X-Mailman-Approved-At: Wed, 10 Jun 2026 15:57:06 +0000
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Namjae Jeon <linkinjeon@kernel.org>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: remove driver depending on nonexistent config option
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/HDTFWNDWDDQJOOOIRKJLD7XDSYSVBLKT/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.69 / 15.00];
	R_DKIM_REJECT(1.00)[agatha.dev:s=default];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx:c];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[agatha.dev : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	HAS_X_AS(0.00)[me@agatha.dev];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:enelsonmoore@gmail.com,m:greybus-dev@lists.linaro.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:johan@kernel.org,m:elder@kernel.org,m:kuba@kernel.org,m:linkinjeon@kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	HAS_X_GMSV(0.00)[me@agatha.dev];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[code@agatha.dev,greybus-dev-bounces@lists.linaro.org];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	HAS_X_SOURCE(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[code@agatha.dev,greybus-dev-bounces@lists.linaro.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[agatha.dev:-];
	TAGGED_RCPT(0.00)[greybus-dev];
	HAS_X_ANTIABUSE(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[agatha.dev:from_mime,agatha.dev:email,links.agatha.dev:mid,lists.linaro.org:helo,lists.linaro.org:rdns,lists.linaro.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 21AFD66B174

T24gVHVlLCBKdW4gMDksIDIwMjYgYXQgMDY6MTQ6NDFQTSAtMDcwMCwgRXRoYW4gTmVsc29uLU1v
b3JlIHdyb3RlOg0KPiBIaSwgQWdhdGhhLA0KDQpIaSwgRXRoYW4hDQoNCj4gDQo+IE9uIFR1ZSwg
SnVuIDksIDIwMjYgYXQgNDo1NuKAr1BNIEFnYXRoYSBJc2FiZWxsZSBNb3JlaXJhIDxjb2RlQGFn
YXRoYS5kZXY+IHdyb3RlOg0KPiA+IE9uIFR1ZSwgSnVuIDA5LCAyMDI2IGF0IDAxOjI2OjU4UE0g
LTA3MDAsIEV0aGFuIE5lbHNvbi1Nb29yZSB3cm90ZToNCj4gPiA+IFRoZSBHcmV5YnVzIEFyY2hl
IFBsYXRmb3JtIGRyaXZlciBkZXBlbmRzIG9uIHRoZSBjb25maWcgb3B0aW9uDQo+ID4gPiBVU0Jf
SFNJQ19VU0IzNjEzLCB3aGljaCBoYXMgbmV2ZXIgZXhpc3RlZCBpbiBtYWlubGluZSBMaW51eC4g
VGhlcmVmb3JlLA0KPiA+DQo+ID4gQWN0dWFsbHkgaXQgZG9zbid0LiBUaGUgYGRlcGVuZHMgb25g
IGxpbmUgc2F5czoNCj4gPg0KPiA+ICAgICAgZGVwZW5kcyBvbiBVU0JfSFNJQ19VU0IzNjEzIHx8
IENPTVBJTEVfVEVTVA0KPiA+DQo+ID4gVGhhdCdzIGEgbG9naWNhbCBPUiBvcGVyYXRpb24sIGl0
IGRlcGVuZHMgb24gVVNCX0hTSUNfVVNCMzYxMyBPUg0KPiA+IENPTVBJTEVfVEVTVC4NCj4gDQo+
IFRoZSBmdW5jdGlvbiBvZiBDT01QSUxFX1RFU1QgaXMgdG8gYWxsb3cgZHJpdmVycyB0byBiZSBj
b21waWxlZCBpbg0KPiBlbnZpcm9ubWVudHMgd2hlcmUgdGhleSBkbyBub3Qgd29yaywgdG8gZW5h
YmxlIGJldHRlciBjb2RlIGNvdmVyYWdlDQo+IGFuZCBlYXNpZXIgdGVzdGluZyBvZiB0cmVlLXdp
ZGUgY2hhbmdlcyB3aXRob3V0IGNyb3NzIGNvbXBpbGVycy4gSXQNCg0KWWVzLCBhbmQgdGhhdCdz
IGJlZW4gYWxzbyBkaXNjdXNzZWQgaW4gdGhlIHRocmVhZCBJIGxpbmtlZCBvbiBteQ0KcHJldmlv
dXMgbWVzc2FnZSBhcyB3ZWxsLiBNeSBwb2ludCBpcyBqdXN0IG9uIGNvbW1pdCBtZXNzYWdlIGFj
Y3VyYWN5Lg0KDQo+IHNob3VsZCBuZXZlciBiZSBlbmFibGVkIGZvciBwcm9kdWN0aW9uIHVzZSBj
YXNlcy4gU28geWVzLCB0ZWNobmljYWxseSwNCg0KTm90IHRoZSBtYWluIHBvaW50IGhlcmUsIGJ1
dCBJJ2QgYWxzbyBub3RlIHRoYXQgbm8gc3RhZ2luZyBkcml2ZXIgaXMNCmludGVuZGVkIGZvciBw
cm9kdWN0aW9uIHVzZSBjYXNlcy4NCg0KPiBpdCBkb2VzIGRlcGVuZCBvbiBlaXRoZXIgb3B0aW9u
LCBidXQgb25seSBvbiBvbmUgInJlYWwiIG9wdGlvbi4NCj4gVGhlcmVmb3JlLCBJIGRvbid0IHRo
aW5rIHRoZXJlIGlzIGFueXRoaW5nIHdyb25nIHdpdGggdGhlIGNvbW1pdA0KPiBtZXNzYWdlLg0K
DQpXaGlsZSBJIGRvIHVuZGVyc3RhbmQgdGhhdCB0aGlzIGRyaXZlciBvbmx5IGNvbXBpbGVzIGFu
ZCBjYW5ub3QgYmUNCmxvYWRlZCwgSSB0aGluayB0aGlzIHBpZWNlIG9mIGluZm9ybWF0aW9uIGlz
bid0IGFjY3VyYXRlbHkgZGVzY3JpYmVkIGluDQp0aGUgY29tbWl0IG1lc3NhZ2UsIGVzcGVjaWFs
bHkgd2hlbiBjb25zaWRlcmluZyBpdCdzIGJlZW4gYXJndWVkIGFib3V0DQp0aGF0IGluIHByZXZp
b3VzIHBhdGNoZXMuDQoNClNpbmNlcmVseSwgDQpBZ2F0aGEgSXNhYmVsbGUgTW9yZWlyYQ0KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1kZXYg
bWFpbGluZyBsaXN0IC0tIGdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKVG8gdW5zdWJzY3Jp
YmUgc2VuZCBhbiBlbWFpbCB0byBncmV5YnVzLWRldi1sZWF2ZUBsaXN0cy5saW5hcm8ub3JnCg==
