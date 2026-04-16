Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mMpNBFz24GmInwAAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Thu, 16 Apr 2026 16:46:52 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C3D640FBD9
	for <lists+greybus-dev@lfdr.de>; Thu, 16 Apr 2026 16:46:51 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 33F22404E0
	for <lists+greybus-dev@lfdr.de>; Thu, 16 Apr 2026 14:46:50 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lists.linaro.org (Postfix) with ESMTPS id E98ED3F772
	for <greybus-dev@lists.linaro.org>; Thu, 16 Apr 2026 14:46:46 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=redhat.com header.s=mimecast20190719 header.b=avVS49ZM;
	dmarc=pass (policy=quarantine) header.from=redhat.com;
	spf=pass (lists.linaro.org: domain of btissoir@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=btissoir@redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776350806;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QdVxqyAXKoeqrj2cGnO5r3z+/z3A0QdARs5q1LcXUQY=;
	b=avVS49ZMor1aD6oEOUF7tG9PmHNKqNPr5ZwmbWK/fzfUr+UPnOnQb3eUIneGiHi4nwEEHU
	IwcxvEohgQbR58i4xFBenAyDzXMk99vE6HDvNU1mtQHC/hbIqhH5ezaMeIvqoKYvw3ySrP
	x1772wAFt095IKTRJS8KDAaPkdCgG/c=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-185-W9wSjo__OvGlkjz9tJsd2w-1; Thu, 16 Apr 2026 10:46:45 -0400
X-MC-Unique: W9wSjo__OvGlkjz9tJsd2w-1
X-Mimecast-MFC-AGG-ID: W9wSjo__OvGlkjz9tJsd2w_1776350804
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c7963d8d167so784641a12.0
        for <greybus-dev@lists.linaro.org>; Thu, 16 Apr 2026 07:46:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776350804; x=1776955604;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QdVxqyAXKoeqrj2cGnO5r3z+/z3A0QdARs5q1LcXUQY=;
        b=SxX5tkg6C8Ub3MkrM9TAvA4wueDdiBVYH12LiqlhCfWZZr5Eac7uwWOv1UyfruQlad
         WaQfm3/bePWrDqcXOG9ViRb6QHy23T50+Ic2xcXJbwG4pARPGrU3wkk3t46Ps85HLe/p
         rPAaNU9FE2p/LPaSR0Icw0y1oNHqlYCG4qF4JbgGPpT4e6TCnrjTKVF6PRuqX1Ipp2/C
         bIUEN2fFQVa/g3tX8YMleCoLNRY6KlpG/Dj54edHYXEnsYgqHIjbXzFxezPOOLYr/tZZ
         6ax3sJ1dbJsqU83fP2mhEhgHsa4H8I8uhYDRcFQGGYaSoRFgMfovEAVlA2d8ruKwxXfy
         E9Dg==
X-Forwarded-Encrypted: i=1; AFNElJ/ZZLMzZtdv051UzF6JJnq6Ckya3SIARpB0f6V4RVEALp0j4UjToSQtYbUQVsWFEZkWkAXHilSftco1ug==@lists.linaro.org
X-Gm-Message-State: AOJu0YxF3HwlKF1zC+zUyN80leZsWkk8N7bitd1jw0rI05rHDllGSyjo
	T8YF9WrrEGzz7r7RTGx86qXHHkOz/KrouzP7brybBUlnjLQ2Nh3WOJtMGzd94Cc52ChkZR/RwNt
	mXtN+yxDXOJUdAVY6MXSoE4iZDKZ9bwE5HBAn8cw7nm4iBFW+kykFzZdIjaknGjkr2Q7Ey2pftN
	ZyIaRpuvv0zXNziE4PJz/mHZeDOoNrWkgVtJaR3Dyf
X-Gm-Gg: AeBDietmoTA8iAtq8A/MOGCXdQxT8bMuTT7ASq4X32J2Aq3SFAPO345tDGmoEUlgGhX
	jCNy8SIsMdvX3bi09biAZlEwrAkBmagNqnF+yrtXy1dIpOgOqUXG65HnpG5Lkn1ddrs9uYpEY9p
	5HTimYFIdXqP/oQNa+0WX7izaxbthL1Lk8zwjPs/yBjL30JjPnk5e8kd6COClLU9Ay/BqwIwBCX
	XQ=
X-Received: by 2002:a05:6a20:4312:b0:398:8d38:c60c with SMTP id adf61e73a8af0-39fe40aac53mr28231793637.55.1776350803581;
        Thu, 16 Apr 2026 07:46:43 -0700 (PDT)
X-Received: by 2002:a05:6a20:4312:b0:398:8d38:c60c with SMTP id
 adf61e73a8af0-39fe40aac53mr28231742637.55.1776350803080; Thu, 16 Apr 2026
 07:46:43 -0700 (PDT)
MIME-Version: 1.0
References: <20260415-wip-fix-core-v1-0-ed3c4c823175@kernel.org>
 <20260415-wip-fix-core-v1-2-ed3c4c823175@kernel.org> <8fedad8e9caecd379f2296562cd6abd37f7cee46.camel@hadess.net>
In-Reply-To: <8fedad8e9caecd379f2296562cd6abd37f7cee46.camel@hadess.net>
From: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date: Thu, 16 Apr 2026 16:46:28 +0200
X-Gm-Features: AQROBzD-vVFl_065x6nZIK1IjlDiUy9P4QSkjgjIaaL4c8szdqTSf21JUcEoXr8
Message-ID: <CAO-hwJ+EgC0pM6L6vGFEaRFt2Nwj5b-CCf_5e5VkvrXgdHrjNg@mail.gmail.com>
To: Bastien Nocera <hadess@hadess.net>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 0X-lB7eEeYDAtNZEWEUV-uZA5Gr6kzOe2fpMRNNBgq4_1776350804
X-Mimecast-Originator: redhat.com
X-Spamd-Bar: ---
Message-ID-Hash: 2T6ZD5V7ZWCAYSYJLWRS3HMR6Z6KZQCX
X-Message-ID-Hash: 2T6ZD5V7ZWCAYSYJLWRS3HMR6Z6KZQCX
X-MailFrom: btissoir@redhat.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Benjamin Tissoires <bentiss@kernel.org>, Jiri Kosina <jikos@kernel.org>, =?UTF-8?Q?Filipe_La=C3=ADns?= <lains@riseup.net>, Ping Cheng <ping.cheng@wacom.com>, Jason Gerecke <jason.gerecke@wacom.com>, Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, Lee Jones <lee@kernel.org>, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-usb@vger.kernel.org, stable@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 2/4] HID: core: introduce hid_safe_input_report()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/2T6ZD5V7ZWCAYSYJLWRS3HMR6Z6KZQCX/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Spamd-Result: default: False [2.09 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[redhat.com : SPF not aligned (relaxed),quarantine];
	R_DKIM_REJECT(1.00)[redhat.com:s=mimecast20190719];
	R_SPF_ALLOW(-0.20)[+mx:c];
	MAILLIST(-0.20)[mailman];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	FROM_NEQ_ENVFROM(0.00)[benjamin.tissoires@redhat.com,greybus-dev-bounces@lists.linaro.org];
	DKIM_TRACE(0.00)[redhat.com:-];
	TAGGED_RCPT(0.00)[greybus-dev];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,mail.gmail.com:mid,lists.linaro.org:helo,lists.linaro.org:rdns]
X-Rspamd-Queue-Id: 7C3D640FBD9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gVGh1LCBBcHIgMTYsIDIwMjYgYXQgMTE6NDHigK9BTSBCYXN0aWVuIE5vY2VyYSA8aGFkZXNz
QGhhZGVzcy5uZXQ+IHdyb3RlOg0KPg0KPiBPbiBXZWQsIDIwMjYtMDQtMTUgYXQgMTE6MzggKzAy
MDAsIEJlbmphbWluIFRpc3NvaXJlcyB3cm90ZToNCj4gPiBoaWRfaW5wdXRfcmVwb3J0KCkgaXMg
dXNlZCBpbiB0b28gbWFueSBwbGFjZXMgdG8gaGF2ZSBhIGNvbW1pdCB0aGF0DQo+ID4gZG9lc24n
dCBjcm9zcyBzdWJzeXN0ZW0gYm9yZGVycy4gSW5zdGVhZCBvZiBjaGFuZ2luZyB0aGUgQVBJLA0K
PiA+IGludHJvZHVjZQ0KPiA+IGEgbmV3IG9uZSB3aGVuIHRoaW5ncyBtYXR0ZXJzIGluIHRoZSB0
cmFuc3BvcnQgbGF5ZXJzOg0KPiA+IC0gdXNiaGlkDQo+ID4gLSBpMmNoaWQNCj4gPg0KPiA+IFRo
aXMgZWZmZWN0aXZlbHkgcmV2ZXJ0IHRvIHRoZSBvbGQgYmVoYXZpb3IgZm9yIHRob3NlIHR3byB0
cmFuc3BvcnQNCj4gPiBsYXllcnMuDQo+ID4NCj4gPiBGaXhlczogMGEzZmU5NzJhN2NiICgiSElE
OiBjb3JlOiBNaXRpZ2F0ZSBwb3RlbnRpYWwgT09CIGJ5IHJlbW92aW5nDQo+ID4gYm9ndXMgbWVt
c2V0KCkiKQ0KPiA+IENjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnDQo+ID4gU2lnbmVkLW9mZi1i
eTogQmVuamFtaW4gVGlzc29pcmVzIDxiZW50aXNzQGtlcm5lbC5vcmc+DQo+ID4gLS0tDQo+ID4g
IGRyaXZlcnMvaGlkL2hpZC1jb3JlLmMgICAgICAgICAgICAgfCAyMSArKysrKysrKysrKysrKysr
KysrKysNCj4gPiAgZHJpdmVycy9oaWQvaTJjLWhpZC9pMmMtaGlkLWNvcmUuYyB8ICA3ICsrKyst
LS0NCj4gPiAgZHJpdmVycy9oaWQvdXNiaGlkL2hpZC1jb3JlLmMgICAgICB8IDExICsrKysrKy0t
LS0tDQo+ID4gIGluY2x1ZGUvbGludXgvaGlkLmggICAgICAgICAgICAgICAgfCAgMiArKw0KPiA+
ICA0IGZpbGVzIGNoYW5nZWQsIDMzIGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pDQo+ID4N
Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9oaWQvaGlkLWNvcmUuYyBiL2RyaXZlcnMvaGlkL2hp
ZC1jb3JlLmMNCj4gPiBpbmRleCBhODA2ODIwZGY3ZTUuLmNiMGFkOTllN2EwYSAxMDA2NDQNCj4g
PiAtLS0gYS9kcml2ZXJzL2hpZC9oaWQtY29yZS5jDQo+ID4gKysrIGIvZHJpdmVycy9oaWQvaGlk
LWNvcmUuYw0KPiA+IEBAIC0yMTkxLDYgKzIxOTEsMjcgQEAgaW50IGhpZF9pbnB1dF9yZXBvcnQo
c3RydWN0IGhpZF9kZXZpY2UgKmhpZCwNCj4gPiBlbnVtIGhpZF9yZXBvcnRfdHlwZSB0eXBlLCB1
OCAqZGF0YQ0KPiA+ICB9DQo+ID4gIEVYUE9SVF9TWU1CT0xfR1BMKGhpZF9pbnB1dF9yZXBvcnQp
Ow0KPiA+DQo+ID4gKy8qKg0KPiA+ICsgKiBoaWRfc2FmZV9pbnB1dF9yZXBvcnQgLSByZXBvcnQg
ZGF0YSBmcm9tIGxvd2VyIGxheWVyICh1c2IsIGJ0Li4uKQ0KPiA+ICsgKg0KPiA+ICsgKiBAaGlk
OiBoaWQgZGV2aWNlDQo+ID4gKyAqIEB0eXBlOiBISUQgcmVwb3J0IHR5cGUgKEhJRF8qX1JFUE9S
VCkNCj4gPiArICogQGRhdGE6IHJlcG9ydCBjb250ZW50cw0KPiA+ICsgKiBAYnVmc2l6ZTogYWxs
b2NhdGVkIHNpemUgb2YgdGhlIGRhdGEgYnVmZmVyDQo+ID4gKyAqIEBzaXplOiB1c2VmdWwgc2l6
ZSBvZiBkYXRhIHBhcmFtZXRlcg0KPiA+ICsgKiBAaW50ZXJydXB0OiBkaXN0aW5ndWlzaCBiZXR3
ZWVuIGludGVycnVwdCBhbmQgY29udHJvbCB0cmFuc2ZlcnMNCj4gPiArICoNCj4gPiArICogVGhp
cyBpcyBkYXRhIGVudHJ5IGZvciBsb3dlciBsYXllcnMuDQo+DQo+IFlvdSBwcm9iYWJseSB3YW50
IHRvIGV4cGxhaW4gd2h5IGl0IHNob3VsZCBiZSB1c2VkIGluc3RlYWQgb2YNCj4gaGlkX2lucHV0
X3JlcG9ydCgpIGluIHRoaXMgZG9jIGJsdXJiLCBhbmQgbW9kaWZ5IHRoZSBoaWRfaW5wdXRfcmVw
b3J0KCkNCj4gZG9jcyB0byBtZW50aW9uIHRoYXQgdGhpcyBzaG91bGQgYmUgdXNlZC4NCg0KR29v
ZCBwb2ludC4gU2VuZGluZyB2MiBBU0FQLg0KDQo+DQo+IE1heWJlIGhpZF9pbnB1dF9yZXBvcnQo
KSBzaG91bGQgYWxzbyBiZSBtYXJrZWQgYXMgZGVwcmVjYXRlZCBzb21laG93LA0KPiB0byBhdm9p
ZCBuZXcgdXNlcnM/DQoNCldlbGwsIGl0J3Mgbm90IGVudGlyZWx5IGRlcHJlY2F0ZWQgYmVjYXVz
ZSwgZm9yIGluc3RhbmNlLCBpbiB1aGlkIHdlDQpvbmx5IGhhdmUgdGhlIGJ1ZmZlciB3aXRoIHRo
ZSBwcm92aWRlZCBzaXplIGFyb3VuZC4gU28gd2UgY2FuJ3QgYmUNCmxlc3MgcmVzdHJpY3RpdmUg
aW4gdGhhdCBwcmVjaXNlIGNhc2UsIGFuZCB0aGVuIHN3aXRjaGluZyB0byBfc2FmZQ0Kd2lsbCBu
b3QgY2hhbmdlIGEgYml0Lg0KDQpDaGVlcnMsDQpCZW5qYW1pbg0KDQo+DQo+IENoZWVycw0KPg0K
PiA+ICsgKi8NCj4gPiAraW50IGhpZF9zYWZlX2lucHV0X3JlcG9ydChzdHJ1Y3QgaGlkX2Rldmlj
ZSAqaGlkLCBlbnVtDQo+ID4gaGlkX3JlcG9ydF90eXBlIHR5cGUsIHU4ICpkYXRhLA0KPiA+ICsg
ICAgICAgICAgICAgICAgICAgICAgIHNpemVfdCBidWZzaXplLCB1MzIgc2l6ZSwgaW50IGludGVy
cnVwdCkNCj4gPiArew0KPiA+ICsgICAgIHJldHVybiBfX2hpZF9pbnB1dF9yZXBvcnQoaGlkLCB0
eXBlLCBkYXRhLCBidWZzaXplLCBzaXplLA0KPiA+IGludGVycnVwdCwgMCwNCj4gPiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGZhbHNlLCAvKiBmcm9tX2JwZiAqLw0KPiA+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgZmFsc2UgLyogbG9ja19hbHJlYWR5X3Rha2VuICov
KTsNCj4gPiArfQ0KPiA+ICtFWFBPUlRfU1lNQk9MX0dQTChoaWRfc2FmZV9pbnB1dF9yZXBvcnQp
Ow0KPiA+ICsNCj4gPiAgYm9vbCBoaWRfbWF0Y2hfb25lX2lkKGNvbnN0IHN0cnVjdCBoaWRfZGV2
aWNlICpoZGV2LA0KPiA+ICAgICAgICAgICAgICAgICAgICAgY29uc3Qgc3RydWN0IGhpZF9kZXZp
Y2VfaWQgKmlkKQ0KPiA+ICB7DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaGlkL2kyYy1oaWQv
aTJjLWhpZC1jb3JlLmMgYi9kcml2ZXJzL2hpZC9pMmMtDQo+ID4gaGlkL2kyYy1oaWQtY29yZS5j
DQo+ID4gaW5kZXggNWExODNhZjNkNWM2Li5lMGEzMDI1NDRjZWYgMTAwNjQ0DQo+ID4gLS0tIGEv
ZHJpdmVycy9oaWQvaTJjLWhpZC9pMmMtaGlkLWNvcmUuYw0KPiA+ICsrKyBiL2RyaXZlcnMvaGlk
L2kyYy1oaWQvaTJjLWhpZC1jb3JlLmMNCj4gPiBAQCAtNTc0LDkgKzU3NCwxMCBAQCBzdGF0aWMg
dm9pZCBpMmNfaGlkX2dldF9pbnB1dChzdHJ1Y3QgaTJjX2hpZA0KPiA+ICppaGlkKQ0KPiA+ICAg
ICAgICAgICAgICAgaWYgKGloaWQtPmhpZC0+Z3JvdXAgIT0gSElEX0dST1VQX1JNSSkNCj4gPiAg
ICAgICAgICAgICAgICAgICAgICAgcG1fd2FrZXVwX2V2ZW50KCZpaGlkLT5jbGllbnQtPmRldiwg
MCk7DQo+ID4NCj4gPiAtICAgICAgICAgICAgIGhpZF9pbnB1dF9yZXBvcnQoaWhpZC0+aGlkLCBI
SURfSU5QVVRfUkVQT1JULA0KPiA+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgIGloaWQt
PmluYnVmICsgc2l6ZW9mKF9fbGUxNiksDQo+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgcmV0X3NpemUgLSBzaXplb2YoX19sZTE2KSwgMSk7DQo+ID4gKyAgICAgICAgICAgICBoaWRf
c2FmZV9pbnB1dF9yZXBvcnQoaWhpZC0+aGlkLCBISURfSU5QVVRfUkVQT1JULA0KPiA+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGloaWQtPmluYnVmICsgc2l6ZW9mKF9fbGUx
NiksDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaWhpZC0+YnVmc2l6
ZSAtDQo+ID4gc2l6ZW9mKF9fbGUxNiksDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgcmV0X3NpemUgLSBzaXplb2YoX19sZTE2KSwgMSk7DQo+ID4gICAgICAgfQ0KPiA+
DQo+ID4gICAgICAgcmV0dXJuOw0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2hpZC91c2JoaWQv
aGlkLWNvcmUuYyBiL2RyaXZlcnMvaGlkL3VzYmhpZC9oaWQtDQo+ID4gY29yZS5jDQo+ID4gaW5k
ZXggZmJiZmMwZjYwODI5Li41YWY5M2I5YjFmYjUgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9o
aWQvdXNiaGlkL2hpZC1jb3JlLmMNCj4gPiArKysgYi9kcml2ZXJzL2hpZC91c2JoaWQvaGlkLWNv
cmUuYw0KPiA+IEBAIC0yODMsOSArMjgzLDkgQEAgc3RhdGljIHZvaWQgaGlkX2lycV9pbihzdHJ1
Y3QgdXJiICp1cmIpDQo+ID4gICAgICAgICAgICAgICAgICAgICAgIGJyZWFrOw0KPiA+ICAgICAg
ICAgICAgICAgdXNiaGlkX21hcmtfYnVzeSh1c2JoaWQpOw0KPiA+ICAgICAgICAgICAgICAgaWYg
KCF0ZXN0X2JpdChISURfUkVTVU1FX1JVTk5JTkcsICZ1c2JoaWQtPmlvZmwpKSB7DQo+ID4gLSAg
ICAgICAgICAgICAgICAgICAgIGhpZF9pbnB1dF9yZXBvcnQodXJiLT5jb250ZXh0LA0KPiA+IEhJ
RF9JTlBVVF9SRVBPUlQsDQo+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgdXJiLT50cmFuc2Zlcl9idWZmZXIsDQo+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgdXJiLT5hY3R1YWxfbGVuZ3RoLCAxKTsNCj4gPiArICAgICAgICAgICAgICAg
ICAgICAgaGlkX3NhZmVfaW5wdXRfcmVwb3J0KHVyYi0+Y29udGV4dCwNCj4gPiBISURfSU5QVVRf
UkVQT1JULA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
dXJiLT50cmFuc2Zlcl9idWZmZXIsDQo+ID4gdXJiLT50cmFuc2Zlcl9idWZmZXJfbGVuZ3RoLA0K
PiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdXJiLT5hY3R1
YWxfbGVuZ3RoLA0KPiA+IDEpOw0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAvKg0KPiA+ICAg
ICAgICAgICAgICAgICAgICAgICAgKiBhdXRvc3VzcGVuZCByZWZ1c2VkIHdoaWxlIGtleXMgYXJl
DQo+ID4gcHJlc3NlZA0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgKiBiZWNhdXNlIG1vc3Qg
a2V5Ym9hcmRzIGRvbid0IHdha2UgdXAgd2hlbg0KPiA+IEBAIC00ODIsOSArNDgyLDEwIEBAIHN0
YXRpYyB2b2lkIGhpZF9jdHJsKHN0cnVjdCB1cmIgKnVyYikNCj4gPiAgICAgICBzd2l0Y2ggKHN0
YXR1cykgew0KPiA+ICAgICAgIGNhc2UgMDogICAgICAgICAgICAgICAgIC8qIHN1Y2Nlc3MgKi8N
Cj4gPiAgICAgICAgICAgICAgIGlmICh1c2JoaWQtPmN0cmxbdXNiaGlkLT5jdHJsdGFpbF0uZGly
ID09DQo+ID4gVVNCX0RJUl9JTikNCj4gPiAtICAgICAgICAgICAgICAgICAgICAgaGlkX2lucHV0
X3JlcG9ydCh1cmItPmNvbnRleHQsDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgIGhpZF9zYWZl
X2lucHV0X3JlcG9ydCh1cmItPmNvbnRleHQsDQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgdXNiaGlkLT5jdHJsW3VzYmhpZC0NCj4gPiA+Y3RybHRhaWxdLnJlcG9ydC0+dHlwZSwN
Cj4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1cmItPnRyYW5zZmVyX2J1ZmZlciwg
dXJiLQ0KPiA+ID5hY3R1YWxfbGVuZ3RoLCAwKTsNCj4gPiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICB1cmItPnRyYW5zZmVyX2J1ZmZlciwgdXJiLQ0KPiA+ID50cmFuc2Zlcl9idWZmZXJf
bGVuZ3RoLA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVyYi0+YWN0dWFsX2xl
bmd0aCwgMCk7DQo+ID4gICAgICAgICAgICAgICBicmVhazsNCj4gPiAgICAgICBjYXNlIC1FU0hV
VERPV046ICAgICAgICAvKiB1bnBsdWcgKi8NCj4gPiAgICAgICAgICAgICAgIHVucGx1ZyA9IDE7
DQo+ID4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvaGlkLmggYi9pbmNsdWRlL2xpbnV4L2hp
ZC5oDQo+ID4gaW5kZXggYWM0MzJhMmVmNDE1Li5iZmI5ODU5ZjM5MWUgMTAwNjQ0DQo+ID4gLS0t
IGEvaW5jbHVkZS9saW51eC9oaWQuaA0KPiA+ICsrKyBiL2luY2x1ZGUvbGludXgvaGlkLmgNCj4g
PiBAQCAtMTAzMCw2ICsxMDMwLDggQEAgc3RydWN0IGhpZF9maWVsZCAqaGlkX2ZpbmRfZmllbGQo
c3RydWN0DQo+ID4gaGlkX2RldmljZSAqaGRldiwgdW5zaWduZWQgaW50IHJlcG9ydF90eQ0KPiA+
ICBpbnQgaGlkX3NldF9maWVsZChzdHJ1Y3QgaGlkX2ZpZWxkICosIHVuc2lnbmVkLCBfX3MzMik7
DQo+ID4gIGludCBoaWRfaW5wdXRfcmVwb3J0KHN0cnVjdCBoaWRfZGV2aWNlICpoaWQsIGVudW0g
aGlkX3JlcG9ydF90eXBlDQo+ID4gdHlwZSwgdTggKmRhdGEsIHUzMiBzaXplLA0KPiA+ICAgICAg
ICAgICAgICAgICAgICBpbnQgaW50ZXJydXB0KTsNCj4gPiAraW50IGhpZF9zYWZlX2lucHV0X3Jl
cG9ydChzdHJ1Y3QgaGlkX2RldmljZSAqaGlkLCBlbnVtDQo+ID4gaGlkX3JlcG9ydF90eXBlIHR5
cGUsIHU4ICpkYXRhLA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIHNpemVfdCBidWZzaXpl
LCB1MzIgc2l6ZSwgaW50IGludGVycnVwdCk7DQo+ID4gIHN0cnVjdCBoaWRfZmllbGQgKmhpZGlu
cHV0X2dldF9sZWRfZmllbGQoc3RydWN0IGhpZF9kZXZpY2UgKmhpZCk7DQo+ID4gIHVuc2lnbmVk
IGludCBoaWRpbnB1dF9jb3VudF9sZWRzKHN0cnVjdCBoaWRfZGV2aWNlICpoaWQpOw0KPiA+ICBf
X3MzMiBoaWRpbnB1dF9jYWxjX2Fic19yZXMoY29uc3Qgc3RydWN0IGhpZF9maWVsZCAqZmllbGQs
IF9fdTE2DQo+ID4gY29kZSk7DQo+DQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmdyZXlidXMtZGV2IG1haWxpbmcgbGlzdCAtLSBncmV5YnVzLWRldkBs
aXN0cy5saW5hcm8ub3JnClRvIHVuc3Vic2NyaWJlIHNlbmQgYW4gZW1haWwgdG8gZ3JleWJ1cy1k
ZXYtbGVhdmVAbGlzdHMubGluYXJvLm9yZwo=
