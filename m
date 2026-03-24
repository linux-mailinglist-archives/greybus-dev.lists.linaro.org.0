Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oHdYJi1BwmmCagQAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Tue, 24 Mar 2026 08:45:49 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 29CDA304205
	for <lists+greybus-dev@lfdr.de>; Tue, 24 Mar 2026 08:45:49 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id EF46F3F9BB
	for <lists+greybus-dev@lfdr.de>; Tue, 24 Mar 2026 07:45:47 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by lists.linaro.org (Postfix) with ESMTPS id 17A783F76C
	for <greybus-dev@lists.linaro.org>; Tue, 24 Mar 2026 07:45:45 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=S0szbZVa;
	spf=pass (lists.linaro.org: domain of johan@kernel.org designates 172.234.252.31 as permitted sender) smtp.mailfrom=johan@kernel.org;
	dmarc=pass (policy=quarantine) header.from=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7BDC1402F6;
	Tue, 24 Mar 2026 07:45:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FA4DC19424;
	Tue, 24 Mar 2026 07:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774338344;
	bh=by9GVycVJdtLPs5Z1KLxxcZMnxEN8r3zSjfsmGlPqJU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S0szbZVaZ480Q96hc7eHrQiEvFcO5eGMqVnNPax6/+8UENpT2clQrK+wgIf/saDmn
	 NmUQBJDDDhHBxeT8GVwpl/hfwzOSUsbAhqfwb8EqT4GaupmIGfSCX2dg7IOGHsiJUg
	 AL/EZ22FjxvcBZ9osQmBrZiL2OcCv/vJshHmMxAoIaS8roKnNI/eWi5b2hklM7miQP
	 N1RX/jVHXGfPYTzore7Y5WrI5K1SdAGF5UNIQ/4WFQ1osY0QtP/9vPVeDCagFGLMnc
	 9t0f8XzwfvTM9zCSh7JVVu8CIUjAW/2yaIoNg3T9aOD2dTlUk4dkFPiRZEzeQ4epdu
	 rUh9CUbg4yiGA==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1w4wSL-00000003iBN-3mgd;
	Tue, 24 Mar 2026 08:45:41 +0100
Date: Tue, 24 Mar 2026 08:45:41 +0100
From: Johan Hovold <johan@kernel.org>
To: Damien =?utf-8?Q?Ri=C3=A9gel?= <damien.riegel@silabs.com>
Message-ID: <acJBJVB9ZfGrmPrg@hovoldconsulting.com>
References: <20260324022510.28596-1-damien.riegel@silabs.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260324022510.28596-1-damien.riegel@silabs.com>
X-Spamd-Bar: ---
Message-ID-Hash: 3VE5BIXK72HEOQMLOEJY6MP2EM6GA4MO
X-Message-ID-Hash: 3VE5BIXK72HEOQMLOEJY6MP2EM6GA4MO
X-MailFrom: johan@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Alex Elder <elder@kernel.org>, Dan Carpenter <dan.carpenter@linaro.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v3 1/2] greybus: raw: fix use-after-free on cdev close
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/3VE5BIXK72HEOQMLOEJY6MP2EM6GA4MO/>
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
	NEURAL_SPAM(0.00)[0.955];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[johan@kernel.org,greybus-dev-bounces@lists.linaro.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email]
X-Rspamd-Queue-Id: 29CDA304205
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gTW9uLCBNYXIgMjMsIDIwMjYgYXQgMTA6MjU6MDlQTSAtMDQwMCwgRGFtaWVuIFJpw6lnZWwg
d3JvdGU6DQo+IFRoaXMgYWRkcmVzc2VzIGEgdXNlLWFmdGVyLWZyZWUgYnVnIHdoZW4gYSByYXcg
YnVuZGxlIGlzIGRpc2Nvbm5lY3RlZA0KPiBidXQgaXRzIGNoYXJkZXYgaXMgc3RpbGwgb3BlbmVk
IGJ5IGFuIGFwcGxpY2F0aW9uLiBXaGVuIHRoZSBhcHBsaWNhdGlvbg0KPiByZWxlYXNlcyB0aGUg
Y2RldiwgaXQgY2F1c2VzIHRoZSBmb2xsb3dpbmcgcGFuaWMgd2hlbiBpbml0IG9uIGZyZWUgaXMN
Cj4gZW5hYmxlZCAoQ09ORklHX0lOSVRfT05fRlJFRV9ERUZBVUxUX09OPXkpOg0KDQo+IEZpeGVz
OiBlODA2YzdmYjhlOWIgKCJncmV5YnVzOiByYXc6IGFkZCByYXcgZ3JleWJ1cyBrZXJuZWwgZHJp
dmVyIikNCj4gUmV2aWV3ZWQtYnk6IEpvaGFuIEhvdm9sZCA8am9oYW5Aa2VybmVsLm9yZz4NCj4g
U2lnbmVkLW9mZi1ieTogRGFtaWVuIFJpw6lnZWwgPGRhbWllbi5yaWVnZWxAc2lsYWJzLmNvbT4N
Cj4gLS0tDQo+IENoYW5nZXMgaW4gdjM6DQo+ICAgLSBtb3ZlIGFzc2lnbm1lbnQgb2YgcmF3LT5k
ZXYucGFyZW50DQo+ICAgLSBhZGQgUmV2aWV3ZWQtQnk6IEpvaGFuIEhvdm9sZA0KPiANCj4gQ2hh
bmdlcyBpbiB2MjoNCj4gICAtIHRyaW0gZG93biB0cmFjZSBpbiBjb21taXQgbWVzc2FnZSB0byBr
ZWVwIG9ubHkgdGhlIGVzc2VudGlhbCBwYXJ0DQo+ICAgLSByZXdvcmsgZXJyb3IgcGF0aHMgaW4g
cHJvYmUgZnVuY3Rpb24gdG8gZW5zdXJlIGRldmljZSBpcyBhbHdheXMgZnJlZWQNCj4gICAgIChz
ZXQgZGV2aWNlIHJlbGVhc2UgY2FsbGJhY2sgYmVmb3JlIGFueSBjYWxsIHRvIHB1dF9kZXZpY2Up
DQo+ICAgLSBtb3ZlIGlkYV9mcmVlIHRvIHJlbGVhc2UgY2FsbGJhY2sNCg0KVGhhbmtzIGZvciB0
aGUgdXBkYXRlIGFsbCBsb29rcyBnb29kIG5vdywgZXhjZXB0IG9uZSB0aGluZy4NCg0KSSBub3Rp
Y2VkIG5vdyB0aGF0IHlvdSBkaWQgbm90IGJhc2UgdGhpcyBvbiA3LjAtcmMgc28gaXQgd2lsbCBu
ZWVkDQphbm90aGVyIHJlc3BpbiBkdWUgdG8gYSB0cmVld2lkZSBhbGxvY2F0aW9uIGNoYW5nZSBp
biA3LjAtcmMxLg0KDQo+IEBAIC0xNjQsMTUgKzE3MiwzMCBAQCBzdGF0aWMgaW50IGdiX3Jhd19w
cm9iZShzdHJ1Y3QgZ2JfYnVuZGxlICpidW5kbGUsDQo+ICAJaWYgKGNwb3J0X2Rlc2MtPnByb3Rv
Y29sX2lkICE9IEdSRVlCVVNfUFJPVE9DT0xfUkFXKQ0KPiAgCQlyZXR1cm4gLUVOT0RFVjsNCj4g
IA0KPiArCW1pbm9yID0gaWRhX2FsbG9jKCZtaW5vcnMsIEdGUF9LRVJORUwpOw0KPiArCWlmICht
aW5vciA8IDApDQo+ICsJCXJldHVybiBtaW5vcjsNCj4gKw0KPiAgCXJhdyA9IGt6YWxsb2Moc2l6
ZW9mKCpyYXcpLCBHRlBfS0VSTkVMKTsNCg0KVGhpcyBsaW5lIGlzIG5vdyANCg0KCSByYXcgPSBr
emFsbG9jX29iaigqcmF3KTsNCg0KaW4gbWFpbmxpbmUgc28gdGhlIHBhdGNoIHdvdWxkIG5vdCBh
cHBseSBjbGVhbmx5Lg0KDQpDb3VsZCB5b3UgcmViYXNlIHRoZXNlIG9uIHJjNCAod2hpY2ggaXMg
dGhlIGN1cnJlbnQgc3RhZ2luZyBiYXNlKT8NCg0KSm9oYW4NCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmdyZXlidXMtZGV2IG1haWxpbmcgbGlzdCAtLSBn
cmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3JnClRvIHVuc3Vic2NyaWJlIHNlbmQgYW4gZW1haWwg
dG8gZ3JleWJ1cy1kZXYtbGVhdmVAbGlzdHMubGluYXJvLm9yZwo=
