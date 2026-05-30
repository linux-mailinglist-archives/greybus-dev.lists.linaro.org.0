Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oLKANt4hG2oN/ggAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Sat, 30 May 2026 19:43:58 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 68813610425
	for <lists+greybus-dev@lfdr.de>; Sat, 30 May 2026 19:43:58 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 235983F960
	for <lists+greybus-dev@lfdr.de>; Sat, 30 May 2026 17:43:57 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	by lists.linaro.org (Postfix) with ESMTPS id 1F42D3F960
	for <greybus-dev@lists.linaro.org>; Sat, 30 May 2026 17:43:52 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=google.com header.s=20251104 header.b=ebx7hi3a;
	spf=pass (lists.linaro.org: domain of cmllamas@google.com designates 209.85.214.172 as permitted sender) smtp.mailfrom=cmllamas@google.com;
	dmarc=pass (policy=reject) header.from=google.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2bf2d865383so125ad.1
        for <greybus-dev@lists.linaro.org>; Sat, 30 May 2026 10:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780163031; x=1780767831; darn=lists.linaro.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QOyDHP4ZxCe5uNffp9qfUHpgLGSQaBL/VpuY0l97f+w=;
        b=ebx7hi3aGgIO/ze4+SXwEVIkdjtbGF84KusfbUH9i6Wi7dCxAqb9dBkCss3l6rJ9tu
         k6nfmHuus3MmJUQHPxC7p588DgnN7dOLuV94suB0mfuPWg4q0i1QWWGgJw7lPxB+Bs2O
         w4u+OupQZ7RlzCS5Sgn7fTweF5N6fbJjT3nr1dzbPApo3tPuwymehKZhV9lm//8GR/JS
         tMI6b9hV4P7nmrHkTfXtvKIGOl191pXyX1mY29oJoJrdFn0T4Xv2Pi/SW53hvR1UURGQ
         cnSqd60YIR3keItGjee+5g+PUcVCjkD+LKyxphsvgiPh3kwkyjSfc9spHjPWP7UUR4ob
         Q7ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780163031; x=1780767831;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QOyDHP4ZxCe5uNffp9qfUHpgLGSQaBL/VpuY0l97f+w=;
        b=MkuVi/mxbjESZdhC5epiCFIhiMMkBzdcv3o1tWze2KHWScSicAuLJeTMaPQ3usQ3m8
         TvlxkpUMHM8qrrGMAKn/ZhOviCtgxeA1VPDbnPLLlDU/nac5FsHTU752PR8+YZi94zlW
         nGu95r2WEjinxfbA0sFAJFn/40BKpfFax96SER6dyUFwfsX5InEqY6YtQO4rk/W7Robg
         w3HwT20g1o9YmouOvgmq7R1eWJpBz8xnwaToYBi2VCK/YQaMOCD/q3WxfLq6Rgla/hwQ
         2srytHIyUORyLNwZX9CLRz9zFhOiay0Z3D8tIG8SrkvDgP1YDuZDeJABuNF4Ox9XgugS
         GCxw==
X-Forwarded-Encrypted: i=1; AFNElJ84Sccf+F3V1zNLmxOTjeU2vKjWUKChhAug6VC+aUrcN7ZkArTti1s+GZKHYx7Djp6ff5Hzrvak56zNQA==@lists.linaro.org
X-Gm-Message-State: AOJu0YyTFZCw9fEsMmErgFWKIaaxyxeZi5gZcqJWaNbxDm1ha6nd4tUq
	wV83On6DmgUdpXXEF0r4k5Y4FSQQQZxD4mO0M51zrneMXhXG5rOepWiujlYWNK6iwg==
X-Gm-Gg: Acq92OGOyxjjigo3hYgQgkJ/R13kVBJ5SHakPBJl8BQjB7dSa8yrt60y/bTfwI+2ZZn
	NCtFozD3X6JLMCmvvNsboT6/8Vz8FnxXSNnzn33WRMpxmfckDudeBRFoL4+pzMHvN10UroXGHcj
	VCsBv+iW+8GVbu60BMJsD2MJtXM1zUJY9+tyt1Of0Uv1v9Lfgf9qT1ly2wfy1ckW5J38TtyrW3l
	6ahq2aAHW1CZO05DKo6bK1+lSRkREEuH6zGLpHnKr72C2Z8qIclPxT+8YRbp+c93I+v5eTlBOD1
	kKhDW9hXiInEclSY5mdyX3MkjUKGPC1SFj5fRz4k3CqPc6PsQj/XJ0vP0bqSP27EK5szp1o0uSa
	lOFPpZM/C+moNfdlDZDY2i7mYU5EBVRP/PZhcHAXnKYUtLyiUhsmvw0zBaQS72peDMuxNrewbCf
	a6/wVRYQ+/OXQ8efaqr7OCNhrzn0Mp+KEc+HPT04hvzBRnfHnNYVbFqrHqX8QG9Q0yiedS4vDMw
	tOeX/mbTwE9M7f/nyDuX+7CqaSdl2yt4FGa3OrrHOsC7uW+N1GeWUB/
X-Received: by 2002:a17:902:ef44:b0:2b4:60e6:44bc with SMTP id d9443c01a7336-2c07cb2ec5bmr239755ad.13.1780163030509;
        Sat, 30 May 2026 10:43:50 -0700 (PDT)
Received: from google.com (112.174.16.34.bc.googleusercontent.com. [34.16.174.112])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85a187eb12sm203716a12.6.2026.05.30.10.43.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 10:43:49 -0700 (PDT)
Date: Sat, 30 May 2026 17:43:45 +0000
From: Carlos Llamas <cmllamas@google.com>
To: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Message-ID: <ahsh0UtTX6e0ZeHa@google.com>
References: <20260415-wip-fix-core-v1-0-ed3c4c823175@kernel.org>
 <20260415-wip-fix-core-v1-2-ed3c4c823175@kernel.org>
 <8fedad8e9caecd379f2296562cd6abd37f7cee46.camel@hadess.net>
 <CAO-hwJ+EgC0pM6L6vGFEaRFt2Nwj5b-CCf_5e5VkvrXgdHrjNg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAO-hwJ+EgC0pM6L6vGFEaRFt2Nwj5b-CCf_5e5VkvrXgdHrjNg@mail.gmail.com>
X-Spamd-Bar: ----
Message-ID-Hash: 5MYMVUZLIA6ADAT27F5ZUKZZGFXVK45V
X-Message-ID-Hash: 5MYMVUZLIA6ADAT27F5ZUKZZGFXVK45V
X-MailFrom: cmllamas@google.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Bastien Nocera <hadess@hadess.net>, Benjamin Tissoires <bentiss@kernel.org>, Jiri Kosina <jikos@kernel.org>, Filipe =?iso-8859-1?Q?La=EDns?= <lains@riseup.net>, Ping Cheng <ping.cheng@wacom.com>, Jason Gerecke <jason.gerecke@wacom.com>, Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, Lee Jones <lee@kernel.org>, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-usb@vger.kernel.org, stable@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 2/4] HID: core: introduce hid_safe_input_report()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/5MYMVUZLIA6ADAT27F5ZUKZZGFXVK45V/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Spamd-Result: default: False [2.59 / 15.00];
	DMARC_POLICY_REJECT(2.00)[google.com : SPF not aligned (relaxed),reject];
	R_DKIM_REJECT(1.00)[google.com:s=20251104];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[17];
	DKIM_TRACE(0.00)[google.com:-];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.978];
	FROM_NEQ_ENVFROM(0.00)[cmllamas@google.com,greybus-dev-bounces@lists.linaro.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 68813610425
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gVGh1LCBBcHIgMTYsIDIwMjYgYXQgMDQ6NDY6MjhQTSArMDIwMCwgQmVuamFtaW4gVGlzc29p
cmVzIHdyb3RlOg0KPiBPbiBUaHUsIEFwciAxNiwgMjAyNiBhdCAxMTo0MeKAr0FNIEJhc3RpZW4g
Tm9jZXJhIDxoYWRlc3NAaGFkZXNzLm5ldD4gd3JvdGU6DQo+ID4NCj4gPiBPbiBXZWQsIDIwMjYt
MDQtMTUgYXQgMTE6MzggKzAyMDAsIEJlbmphbWluIFRpc3NvaXJlcyB3cm90ZToNCj4gPiA+IGhp
ZF9pbnB1dF9yZXBvcnQoKSBpcyB1c2VkIGluIHRvbyBtYW55IHBsYWNlcyB0byBoYXZlIGEgY29t
bWl0IHRoYXQNCj4gPiA+IGRvZXNuJ3QgY3Jvc3Mgc3Vic3lzdGVtIGJvcmRlcnMuIEluc3RlYWQg
b2YgY2hhbmdpbmcgdGhlIEFQSSwNCj4gPiA+IGludHJvZHVjZQ0KPiA+ID4gYSBuZXcgb25lIHdo
ZW4gdGhpbmdzIG1hdHRlcnMgaW4gdGhlIHRyYW5zcG9ydCBsYXllcnM6DQo+ID4gPiAtIHVzYmhp
ZA0KPiA+ID4gLSBpMmNoaWQNCj4gPiA+DQo+ID4gPiBUaGlzIGVmZmVjdGl2ZWx5IHJldmVydCB0
byB0aGUgb2xkIGJlaGF2aW9yIGZvciB0aG9zZSB0d28gdHJhbnNwb3J0DQo+ID4gPiBsYXllcnMu
DQo+ID4gPg0KPiA+ID4gRml4ZXM6IDBhM2ZlOTcyYTdjYiAoIkhJRDogY29yZTogTWl0aWdhdGUg
cG90ZW50aWFsIE9PQiBieSByZW1vdmluZw0KPiA+ID4gYm9ndXMgbWVtc2V0KCkiKQ0KPiA+ID4g
Q2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcNCj4gPiA+IFNpZ25lZC1vZmYtYnk6IEJlbmphbWlu
IFRpc3NvaXJlcyA8YmVudGlzc0BrZXJuZWwub3JnPg0KPiA+ID4gLS0tDQo+ID4gPiAgZHJpdmVy
cy9oaWQvaGlkLWNvcmUuYyAgICAgICAgICAgICB8IDIxICsrKysrKysrKysrKysrKysrKysrKw0K
PiA+ID4gIGRyaXZlcnMvaGlkL2kyYy1oaWQvaTJjLWhpZC1jb3JlLmMgfCAgNyArKysrLS0tDQo+
ID4gPiAgZHJpdmVycy9oaWQvdXNiaGlkL2hpZC1jb3JlLmMgICAgICB8IDExICsrKysrKy0tLS0t
DQo+ID4gPiAgaW5jbHVkZS9saW51eC9oaWQuaCAgICAgICAgICAgICAgICB8ICAyICsrDQo+ID4g
PiAgNCBmaWxlcyBjaGFuZ2VkLCAzMyBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQ0KPiA+
ID4NCj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2hpZC9oaWQtY29yZS5jIGIvZHJpdmVycy9o
aWQvaGlkLWNvcmUuYw0KPiA+ID4gaW5kZXggYTgwNjgyMGRmN2U1Li5jYjBhZDk5ZTdhMGEgMTAw
NjQ0DQo+ID4gPiAtLS0gYS9kcml2ZXJzL2hpZC9oaWQtY29yZS5jDQo+ID4gPiArKysgYi9kcml2
ZXJzL2hpZC9oaWQtY29yZS5jDQo+ID4gPiBAQCAtMjE5MSw2ICsyMTkxLDI3IEBAIGludCBoaWRf
aW5wdXRfcmVwb3J0KHN0cnVjdCBoaWRfZGV2aWNlICpoaWQsDQo+ID4gPiBlbnVtIGhpZF9yZXBv
cnRfdHlwZSB0eXBlLCB1OCAqZGF0YQ0KPiA+ID4gIH0NCj4gPiA+ICBFWFBPUlRfU1lNQk9MX0dQ
TChoaWRfaW5wdXRfcmVwb3J0KTsNCj4gPiA+DQo+ID4gPiArLyoqDQo+ID4gPiArICogaGlkX3Nh
ZmVfaW5wdXRfcmVwb3J0IC0gcmVwb3J0IGRhdGEgZnJvbSBsb3dlciBsYXllciAodXNiLCBidC4u
LikNCj4gPiA+ICsgKg0KPiA+ID4gKyAqIEBoaWQ6IGhpZCBkZXZpY2UNCj4gPiA+ICsgKiBAdHlw
ZTogSElEIHJlcG9ydCB0eXBlIChISURfKl9SRVBPUlQpDQo+ID4gPiArICogQGRhdGE6IHJlcG9y
dCBjb250ZW50cw0KPiA+ID4gKyAqIEBidWZzaXplOiBhbGxvY2F0ZWQgc2l6ZSBvZiB0aGUgZGF0
YSBidWZmZXINCj4gPiA+ICsgKiBAc2l6ZTogdXNlZnVsIHNpemUgb2YgZGF0YSBwYXJhbWV0ZXIN
Cj4gPiA+ICsgKiBAaW50ZXJydXB0OiBkaXN0aW5ndWlzaCBiZXR3ZWVuIGludGVycnVwdCBhbmQg
Y29udHJvbCB0cmFuc2ZlcnMNCj4gPiA+ICsgKg0KPiA+ID4gKyAqIFRoaXMgaXMgZGF0YSBlbnRy
eSBmb3IgbG93ZXIgbGF5ZXJzLg0KPiA+DQo+ID4gWW91IHByb2JhYmx5IHdhbnQgdG8gZXhwbGFp
biB3aHkgaXQgc2hvdWxkIGJlIHVzZWQgaW5zdGVhZCBvZg0KPiA+IGhpZF9pbnB1dF9yZXBvcnQo
KSBpbiB0aGlzIGRvYyBibHVyYiwgYW5kIG1vZGlmeSB0aGUgaGlkX2lucHV0X3JlcG9ydCgpDQo+
ID4gZG9jcyB0byBtZW50aW9uIHRoYXQgdGhpcyBzaG91bGQgYmUgdXNlZC4NCj4gDQo+IEdvb2Qg
cG9pbnQuIFNlbmRpbmcgdjIgQVNBUC4NCj4gDQo+ID4NCj4gPiBNYXliZSBoaWRfaW5wdXRfcmVw
b3J0KCkgc2hvdWxkIGFsc28gYmUgbWFya2VkIGFzIGRlcHJlY2F0ZWQgc29tZWhvdywNCj4gPiB0
byBhdm9pZCBuZXcgdXNlcnM/DQo+IA0KPiBXZWxsLCBpdCdzIG5vdCBlbnRpcmVseSBkZXByZWNh
dGVkIGJlY2F1c2UsIGZvciBpbnN0YW5jZSwgaW4gdWhpZCB3ZQ0KPiBvbmx5IGhhdmUgdGhlIGJ1
ZmZlciB3aXRoIHRoZSBwcm92aWRlZCBzaXplIGFyb3VuZC4gU28gd2UgY2FuJ3QgYmUNCj4gbGVz
cyByZXN0cmljdGl2ZSBpbiB0aGF0IHByZWNpc2UgY2FzZSwgYW5kIHRoZW4gc3dpdGNoaW5nIHRv
IF9zYWZlDQo+IHdpbGwgbm90IGNoYW5nZSBhIGJpdC4NCj4gDQo+IENoZWVycywNCj4gQmVuamFt
aW4NCg0KSGkgQmVuamFtaW4sIG91ciBDSSBzdGFydGVkIGZhaWxpbmcgd2l0aCBjb21taXQgMGEz
ZmU5NzJhN2NiICgiSElEOg0KY29yZTogTWl0aWdhdGUgcG90ZW50aWFsIE9PQiBieSByZW1vdmlu
ZyBib2d1cyBtZW1zZXQoKSIpLCBzbyBJIHdhcw0KaG9waW5nIHlvdXIgcGF0Y2hzZXQgd291bGQg
Zml4IHRoaXMuDQoNCkhvd2V2ZXIsIEkganVzdCByZWFsaXplZCBvdXIgY2FsbCBwYXRoIGdvZXMg
dGhyb3VnaCB1aGlkIHByZWNpc2VseSwNCndoaWNoIHN0aWxsIHRyaWdnZXJzIHRoZSBFSU5WQUwg
ZXJyb3Igc2luY2UgdWhpZCBhcyBub3QgY29udmVydGVkIHRvDQpoaWRfc2FmZV9pbnB1dF9yZXBv
cnQoKS4NCg0KTXkgdmFndWUgdW5kZXJzdGFuZGluZyB0aG91Z2gsIGlzIHRoYXQgdWhpZF9ldmVu
dCB1c2VzIGEgc3RhdGljIGJ1ZmZlcg0KaW4gZXYtPmRhdGFbVUhJRF9EQVRBX01BWF0sIHNvIG1h
eWJlIHdlIGNhbiB1c2UgdGhhdCB0aHJvdWdoDQp1aGlkX2Rldl9pbnB1dHsyfSgpPw0KDQpJIHJh
biB0aGUgZm9sbG93aW5nIHBhdGggdGhyb3VnaCBvdXIgQ0kgYW5kIGl0IGZpeGVkIG91ciBpc3N1
ZSwgc28gSQ0Kd2FudGVkIHRvIGdldCB5b3VyIHRob3VnaHRzIG9uIHRoaXMuDQoNCkNhcmxvcyBM
bGFtYXMNCg0KLS0tDQogZHJpdmVycy9oaWQvdWhpZC5jIHwgOCArKysrLS0tLQ0KIDEgZmlsZSBj
aGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2hpZC91aGlkLmMgYi9kcml2ZXJzL2hpZC91aGlkLmMNCmluZGV4IDUyNGI1M2EzYzg3
Yi4uMzdiNjBjM2FhZjY2IDEwMDY0NA0KLS0tIGEvZHJpdmVycy9oaWQvdWhpZC5jDQorKysgYi9k
cml2ZXJzL2hpZC91aGlkLmMNCkBAIC01OTUsOCArNTk1LDggQEAgc3RhdGljIGludCB1aGlkX2Rl
dl9pbnB1dChzdHJ1Y3QgdWhpZF9kZXZpY2UgKnVoaWQsIHN0cnVjdCB1aGlkX2V2ZW50ICpldikN
CiAJaWYgKCFSRUFEX09OQ0UodWhpZC0+cnVubmluZykpDQogCQlyZXR1cm4gLUVJTlZBTDsNCiAN
Ci0JaGlkX2lucHV0X3JlcG9ydCh1aGlkLT5oaWQsIEhJRF9JTlBVVF9SRVBPUlQsIGV2LT51Lmlu
cHV0LmRhdGEsDQotCQkJIG1pbl90KHNpemVfdCwgZXYtPnUuaW5wdXQuc2l6ZSwgVUhJRF9EQVRB
X01BWCksIDApOw0KKwloaWRfc2FmZV9pbnB1dF9yZXBvcnQodWhpZC0+aGlkLCBISURfSU5QVVRf
UkVQT1JULCBldi0+dS5pbnB1dC5kYXRhLCBVSElEX0RBVEFfTUFYLA0KKwkJCSAgICAgIG1pbl90
KHNpemVfdCwgZXYtPnUuaW5wdXQuc2l6ZSwgVUhJRF9EQVRBX01BWCksIDApOw0KIA0KIAlyZXR1
cm4gMDsNCiB9DQpAQCAtNjA2LDggKzYwNiw4IEBAIHN0YXRpYyBpbnQgdWhpZF9kZXZfaW5wdXQy
KHN0cnVjdCB1aGlkX2RldmljZSAqdWhpZCwgc3RydWN0IHVoaWRfZXZlbnQgKmV2KQ0KIAlpZiAo
IVJFQURfT05DRSh1aGlkLT5ydW5uaW5nKSkNCiAJCXJldHVybiAtRUlOVkFMOw0KIA0KLQloaWRf
aW5wdXRfcmVwb3J0KHVoaWQtPmhpZCwgSElEX0lOUFVUX1JFUE9SVCwgZXYtPnUuaW5wdXQyLmRh
dGEsDQotCQkJIG1pbl90KHNpemVfdCwgZXYtPnUuaW5wdXQyLnNpemUsIFVISURfREFUQV9NQVgp
LCAwKTsNCisJaGlkX3NhZmVfaW5wdXRfcmVwb3J0KHVoaWQtPmhpZCwgSElEX0lOUFVUX1JFUE9S
VCwgZXYtPnUuaW5wdXQyLmRhdGEsIFVISURfREFUQV9NQVgsDQorCQkJICAgICAgbWluX3Qoc2l6
ZV90LCBldi0+dS5pbnB1dDIuc2l6ZSwgVUhJRF9EQVRBX01BWCksIDApOw0KIA0KIAlyZXR1cm4g
MDsNCiB9DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpn
cmV5YnVzLWRldiBtYWlsaW5nIGxpc3QgLS0gZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpU
byB1bnN1YnNjcmliZSBzZW5kIGFuIGVtYWlsIHRvIGdyZXlidXMtZGV2LWxlYXZlQGxpc3RzLmxp
bmFyby5vcmcK
