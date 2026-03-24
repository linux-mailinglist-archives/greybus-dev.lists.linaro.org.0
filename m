Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yFqYK2pFwmnvbAQAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Tue, 24 Mar 2026 09:03:54 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 28DB53044EA
	for <lists+greybus-dev@lfdr.de>; Tue, 24 Mar 2026 09:03:54 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 2099D40140
	for <lists+greybus-dev@lfdr.de>; Tue, 24 Mar 2026 08:03:53 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by lists.linaro.org (Postfix) with ESMTPS id 81C183F751
	for <greybus-dev@lists.linaro.org>; Tue, 24 Mar 2026 08:03:50 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=UV8JkEaq;
	spf=pass (lists.linaro.org: domain of johan@kernel.org designates 172.105.4.254 as permitted sender) smtp.mailfrom=johan@kernel.org;
	dmarc=pass (policy=quarantine) header.from=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0DF45600AC;
	Tue, 24 Mar 2026 08:03:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1603C19424;
	Tue, 24 Mar 2026 08:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774339429;
	bh=2RNy7XQ1l1G1mKHRnJ9KURLUqO/6eJHSqGg8eXblqaI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UV8JkEaqJ3ZUYC0bLISlB73ShwOgl1EbobTWgGa6wO7ddt+L8xEfwfZ+LkIc1EaBh
	 D3DxFjRYhjukxNklJ4+jbO1gmgNuMV3R8idvAYnVyPQfhJ1QCVc8CSLR8YJmd1cxow
	 n1G05YgmfhriH5UuCiWq7pMCrZxAInsIpUkDmgBYgD9idnPJkfpBZm6Dw+v0rxeBSz
	 KgtoQGdglF3nfo0JGJaWROQaJTL9+hwhG9LYkqGFRtuJYVMIUaA8yYBmhbVxWMIEms
	 enPEby87SUy9EdC/u0vPZFoRYsIjVB+5lYRuzcNFmISnoqRpSzKm+4zLlgO7mh7Jpx
	 lpBzHqPUkhXgQ==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1w4wjr-00000003iTm-0VYy;
	Tue, 24 Mar 2026 09:03:47 +0100
Date: Tue, 24 Mar 2026 09:03:47 +0100
From: Johan Hovold <johan@kernel.org>
To: Damien =?utf-8?Q?Ri=C3=A9gel?= <damien.riegel@silabs.com>
Message-ID: <acJFY3-qJ4IZGe6m@hovoldconsulting.com>
References: <20260324022510.28596-1-damien.riegel@silabs.com>
 <20260324022510.28596-2-damien.riegel@silabs.com>
 <acJCrBYJS61o2ZbG@hovoldconsulting.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <acJCrBYJS61o2ZbG@hovoldconsulting.com>
X-Spamd-Bar: ---
Message-ID-Hash: E5QFOZAVJLINXXAT4BC6IXUWQQVKLABQ
X-Message-ID-Hash: E5QFOZAVJLINXXAT4BC6IXUWQQVKLABQ
X-MailFrom: johan@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Alex Elder <elder@kernel.org>, Dan Carpenter <dan.carpenter@linaro.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v3 2/2] greybus: raw: fix use-after-free if write is called after disconnect
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/E5QFOZAVJLINXXAT4BC6IXUWQQVKLABQ/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Spamd-Result: default: False [2.09 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	NEURAL_SPAM(0.00)[0.946];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[johan@kernel.org,greybus-dev-bounces@lists.linaro.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,lists.linaro.org:helo,lists.linaro.org:rdns,hovoldconsulting.com:mid]
X-Rspamd-Queue-Id: 28DB53044EA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gVHVlLCBNYXIgMjQsIDIwMjYgYXQgMDg6NTI6MTJBTSArMDEwMCwgSm9oYW4gSG92b2xkIHdy
b3RlOg0KPiBPbiBNb24sIE1hciAyMywgMjAyNiBhdCAxMDoyNToxMFBNIC0wNDAwLCBEYW1pZW4g
UmnDqWdlbCB3cm90ZToNCg0KPiA+ICsJcmV0dmFsID0gZ2JfcmF3X3NlbmQocmF3LCBjb3VudCwg
YnVmKTsNCj4gPiArCWlmICghcmV0dmFsKQ0KPiA+ICsJCXJldHZhbCA9IGNvdW50Ow0KPiANCj4g
SSdkIGludmVydCB0aGlzIHNvIHRoYXQgd2UgdGVzdCBmb3IgZXJyb3JzIGNvbnNpc3RlbnRseToN
Cj4gDQo+IAlpZiAocmV0dmFsKQ0KPiAJCWdvdG8gZXhpdDsNCj4gDQo+IAlyZXR2YWwgPSBjb3Vu
dDsNCj4gDQo+ID4gK2V4aXQ6DQo+ID4gKwl1cF9yZWFkKCZyYXctPmRpc2Nvbm5lY3RfbG9jayk7
DQo+ID4gKw0KPiA+ICsJcmV0dXJuIHJldHZhbDsNCj4gPiAgfQ0KPiA+ICANCj4gPiAgc3RhdGlj
IHNzaXplX3QgcmF3X3JlYWQoc3RydWN0IGZpbGUgKmZpbGUsIGNoYXIgX191c2VyICpidWYsIHNp
emVfdCBjb3VudCwNCg0KRm9yZ290IHRvIHNheSB5b3UgY2FuIGluY2x1ZGUgbXk6DQoNClJldmll
d2VkLWJ5OiBKb2hhbiBIb3ZvbGQgPGpvaGFuQGtlcm5lbC5vcmc+DQoNCndoZW4gcmVzcGlubmlu
Zy4NCg0KSm9oYW4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmdyZXlidXMtZGV2IG1haWxpbmcgbGlzdCAtLSBncmV5YnVzLWRldkBsaXN0cy5saW5hcm8u
b3JnClRvIHVuc3Vic2NyaWJlIHNlbmQgYW4gZW1haWwgdG8gZ3JleWJ1cy1kZXYtbGVhdmVAbGlz
dHMubGluYXJvLm9yZwo=
