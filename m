Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yPpbDsRMwWlbSAQAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Mon, 23 Mar 2026 15:23:00 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D2BE2F4530
	for <lists+greybus-dev@lfdr.de>; Mon, 23 Mar 2026 15:22:59 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id AABF73F735
	for <lists+greybus-dev@lfdr.de>; Mon, 23 Mar 2026 14:22:58 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by lists.linaro.org (Postfix) with ESMTPS id 716E33F6DA
	for <greybus-dev@lists.linaro.org>; Mon, 23 Mar 2026 14:22:55 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=DzBkfag8;
	spf=pass (lists.linaro.org: domain of johan@kernel.org designates 172.234.252.31 as permitted sender) smtp.mailfrom=johan@kernel.org;
	dmarc=pass (policy=quarantine) header.from=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AA9BA43A24;
	Mon, 23 Mar 2026 14:22:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89399C2BCB1;
	Mon, 23 Mar 2026 14:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774275774;
	bh=75yMJNjNKG40Z7gVjEIHoK8Kc4ACaANukIDeoem0vvI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DzBkfag8wEp6d13LEU3cb/n+u8SrIuTebqAz/rWb08DfKNBrNSlMf760MAIuCfBFu
	 SHQHsPbG7CiQebXMyVNSZ5ICdtJYKMJ2ei7zxeBY9zkCJsQ4NaZQPWkoYHb5akoCzS
	 U6gckJZmBs1g2tWoEXsbPsu5zn8Y7/U6z9udeAhAuhfMroKfXgqPn1wiLsxeYw4Bpo
	 g8hdATs+cntRw3ALJT5SDQSts4rlmJX/2fWqPw6gIs4+I5mPhO60QeycNCFOPK7Ex5
	 1HKyp6MNo9N6yVt+zgy7JTLSoDzr4ibNA185/XfYWbkMYxXmGhLl5MbT0dzcGHSUwn
	 3PZscKFuRbnnw==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1w4gBA-00000003amJ-1Zae;
	Mon, 23 Mar 2026 15:22:52 +0100
Date: Mon, 23 Mar 2026 15:22:52 +0100
From: Johan Hovold <johan@kernel.org>
To: Damien =?utf-8?Q?Ri=C3=A9gel?= <damien.riegel@silabs.com>
Message-ID: <acFMvCgcwIny-z2N@hovoldconsulting.com>
References: <20260319162049.42269-1-damien.riegel@silabs.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260319162049.42269-1-damien.riegel@silabs.com>
X-Spamd-Bar: ---
Message-ID-Hash: NWIYHHKM2PDTLFJGF4GBGSL2ROAVYFHH
X-Message-ID-Hash: NWIYHHKM2PDTLFJGF4GBGSL2ROAVYFHH
X-MailFrom: johan@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Alex Elder <elder@kernel.org>, Dan Carpenter <dan.carpenter@linaro.org>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v2 1/2] greybus: raw: fix use-after-free on cdev close
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/NWIYHHKM2PDTLFJGF4GBGSL2ROAVYFHH/>
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
	NEURAL_SPAM(0.00)[0.959];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[johan@kernel.org,greybus-dev-bounces@lists.linaro.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,hovoldconsulting.com:mid,lists.linaro.org:helo,lists.linaro.org:rdns,silabs.com:email]
X-Rspamd-Queue-Id: 9D2BE2F4530
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gVGh1LCBNYXIgMTksIDIwMjYgYXQgMTI6MjA6NDhQTSAtMDQwMCwgRGFtaWVuIFJpw6lnZWwg
d3JvdGU6DQo+IFRoaXMgYWRkcmVzc2VzIGEgdXNlLWFmdGVyLWZyZWUgYnVnIHdoZW4gYSByYXcg
YnVuZGxlIGlzIGRpc2Nvbm5lY3RlZA0KPiBidXQgaXRzIGNoYXJkZXYgaXMgc3RpbGwgb3BlbmVk
IGJ5IGFuIGFwcGxpY2F0aW9uLiBXaGVuIHRoZSBhcHBsaWNhdGlvbg0KPiByZWxlYXNlcyB0aGUg
Y2RldiwgaXQgY2F1c2VzIHRoZSBmb2xsb3dpbmcgcGFuaWMgd2hlbiBpbml0IG9uIGZyZWUgaXMN
Cj4gZW5hYmxlZCAoQ09ORklHX0lOSVRfT05fRlJFRV9ERUZBVUxUX09OPXkpOg0KDQo+IEZpeGVz
OiBlODA2YzdmYjhlOWIgKCJncmV5YnVzOiByYXc6IGFkZCByYXcgZ3JleWJ1cyBrZXJuZWwgZHJp
dmVyIikNCj4gU2lnbmVkLW9mZi1ieTogRGFtaWVuIFJpw6lnZWwgPGRhbWllbi5yaWVnZWxAc2ls
YWJzLmNvbT4NCj4gLS0tDQo+IENoYW5nZXMgaW4gdjI6DQo+ICAgLSB0cmltIGRvd24gdHJhY2Ug
aW4gY29tbWl0IG1lc3NhZ2UgdG8ga2VlcCBvbmx5IHRoZSBlc3NlbnRpYWwgcGFydA0KPiAgIC0g
cmV3b3JrIGVycm9yIHBhdGhzIGluIHByb2JlIGZ1bmN0aW9uIHRvIGVuc3VyZSBkZXZpY2UgaXMg
YWx3YXlzDQo+ICAgICBmcmVlZCAoc2V0IGRldmljZSByZWxlYXNlIGNhbGxiYWNrIGJlZm9yZSBh
bnkgY2FsbCB0byBwdXRfZGV2aWNlKQ0KPiAgIC0gbW92ZSBpZGFfZnJlZSB0byByZWxlYXNlIGNh
bGxiYWNrDQoNCj4gQEAgLTE2NCw2MyArMTcyLDU4IEBAIHN0YXRpYyBpbnQgZ2JfcmF3X3Byb2Jl
KHN0cnVjdCBnYl9idW5kbGUgKmJ1bmRsZSwNCj4gIAlpZiAoY3BvcnRfZGVzYy0+cHJvdG9jb2xf
aWQgIT0gR1JFWUJVU19QUk9UT0NPTF9SQVcpDQo+ICAJCXJldHVybiAtRU5PREVWOw0KPiAgDQo+
ICsJbWlub3IgPSBpZGFfYWxsb2MoJm1pbm9ycywgR0ZQX0tFUk5FTCk7DQo+ICsJaWYgKG1pbm9y
IDwgMCkNCj4gKwkJcmV0dXJuIG1pbm9yOw0KPiArDQo+ICAJcmF3ID0ga3phbGxvYyhzaXplb2Yo
KnJhdyksIEdGUF9LRVJORUwpOw0KPiAtCWlmICghcmF3KQ0KPiArCWlmICghcmF3KSB7DQo+ICsJ
CWlkYV9mcmVlKCZtaW5vcnMsIG1pbm9yKTsNCj4gIAkJcmV0dXJuIC1FTk9NRU07DQo+ICsJfQ0K
PiArDQo+ICsJZGV2aWNlX2luaXRpYWxpemUoJnJhdy0+ZGV2KTsNCj4gKwlyYXctPmRldi5kZXZ0
ID0gTUtERVYocmF3X21ham9yLCBtaW5vcik7DQo+ICsJcmF3LT5kZXYuY2xhc3MgPSAmcmF3X2Ns
YXNzOw0KPiArCXJhdy0+ZGV2LnJlbGVhc2UgPSByYXdfZGV2X3JlbGVhc2U7DQo+ICsJcmV0dmFs
ID0gZGV2X3NldF9uYW1lKCZyYXctPmRldiwgImdiIXJhdyVkIiwgbWlub3IpOw0KPiArCWlmIChy
ZXR2YWwpDQo+ICsJCWdvdG8gZXJyb3JfcHV0X2RldmljZTsNCj4gIA0KPiAgCWNvbm5lY3Rpb24g
PSBnYl9jb25uZWN0aW9uX2NyZWF0ZShidW5kbGUsIGxlMTZfdG9fY3B1KGNwb3J0X2Rlc2MtPmlk
KSwNCj4gIAkJCQkJICBnYl9yYXdfcmVxdWVzdF9oYW5kbGVyKTsNCj4gIAlpZiAoSVNfRVJSKGNv
bm5lY3Rpb24pKSB7DQo+ICAJCXJldHZhbCA9IFBUUl9FUlIoY29ubmVjdGlvbik7DQo+IC0JCWdv
dG8gZXJyb3JfZnJlZTsNCj4gKwkJZ290byBlcnJvcl9wdXRfZGV2aWNlOw0KPiAgCX0NCj4gIA0K
PiAgCUlOSVRfTElTVF9IRUFEKCZyYXctPmxpc3QpOw0KPiAgCW11dGV4X2luaXQoJnJhdy0+bGlz
dF9sb2NrKTsNCj4gIA0KPiAgCXJhdy0+Y29ubmVjdGlvbiA9IGNvbm5lY3Rpb247DQo+ICsJcmF3
LT5kZXYucGFyZW50ID0gJmNvbm5lY3Rpb24tPmJ1bmRsZS0+ZGV2Ow0KDQpZb3UgY2FuIHNldCB0
aGUgcGFyZW50IGFib3ZlIHdoZXJlIHlvdSBpbml0aWFsaXNlIGRldiBzaW5jZSB0aGUgcHJvYmUN
CmZ1bmN0aW9uIGlzIGNhbGxlZCB3aXRoIGEgcG9pbnRlciB0byB0aGUgYnVuZGxlICh0aGF0IGlz
IGJlaW5nIGJvdW5kKS4NCg0KPiAgCWdyZXlidXNfc2V0X2RydmRhdGEoYnVuZGxlLCByYXcpOw0K
DQpMb29rcyBnb29kIG90aGVyd2lzZToNCg0KUmV2aWV3ZWQtYnk6IEpvaGFuIEhvdm9sZCA8am9o
YW5Aa2VybmVsLm9yZz4NCg0KSm9oYW4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmdyZXlidXMtZGV2IG1haWxpbmcgbGlzdCAtLSBncmV5YnVzLWRldkBs
aXN0cy5saW5hcm8ub3JnClRvIHVuc3Vic2NyaWJlIHNlbmQgYW4gZW1haWwgdG8gZ3JleWJ1cy1k
ZXYtbGVhdmVAbGlzdHMubGluYXJvLm9yZwo=
