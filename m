Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 77725AC4D76
	for <lists+greybus-dev@lfdr.de>; Tue, 27 May 2025 13:33:29 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 909B7454E2
	for <lists+greybus-dev@lfdr.de>; Tue, 27 May 2025 11:33:28 +0000 (UTC)
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com [209.85.208.66])
	by lists.linaro.org (Postfix) with ESMTPS id 09EF2450A9
	for <greybus-dev@lists.linaro.org>; Tue, 27 May 2025 05:50:56 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=jJzk+kcc;
	spf=pass (lists.linaro.org: domain of clf700383@gmail.com designates 209.85.208.66 as permitted sender) smtp.mailfrom=clf700383@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-ed1-f66.google.com with SMTP id 4fb4d7f45d1cf-60472d90787so379334a12.1
        for <greybus-dev@lists.linaro.org>; Mon, 26 May 2025 22:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748325055; x=1748929855; darn=lists.linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mu9iSZ9Th/47Nb0jS9axxAY4+IRtONHz/7iK+0n6mDs=;
        b=jJzk+kccwlsNLgb0k8GTZKU9ok46qIx65h+BjFw2b6VIiAesdibSBTRihMT+95sZVD
         S2fpo5+CM3gYDAE00NI9odbEAbkG128Ddm+tR6QmOVLYdbWtvKrSeOvu+slQ6Vjo+SSd
         la1O/yYkWYQUGOHBMqfs7bj/jgM4Eb4TYbl8yVEvYVYQmaH0M6eyqUn/mzqrSzl80JU9
         +z/6xPaeia5Ov0m79zarUeZgtV4imBB7W/z7KJfQCCppMHphTO7MoZnhmTuctR3Ruk8R
         q0vtSQzRvNrWhmU6U1aUyGzBtc2Gm0Xy5l7W5JnoptuRYqwYIT/L/AAf04NIklkLwhdr
         bEng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748325055; x=1748929855;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mu9iSZ9Th/47Nb0jS9axxAY4+IRtONHz/7iK+0n6mDs=;
        b=muRsR3ZiVduCxheiUO5VofRnZ99F5+a1BmS0XMBIJ+O9ZDG4a/SsqjvANqCVG1C3NG
         iprFnKAec7TgQEo5PDLZvi7tpMeUgYfHjNM5XjPAwMosmHWu4is1oIZWs1BFL5B/6VEx
         uANBj8V1vV8EujlnxjAGNsTdNICG/NjcAF5CecgbpSvzvGasjVgHoi1cz56oSaOx5dhn
         y9a8cHFEVRzZyE/zvtuaIFpH07+wqD7kAuwFB25VPo4Tn16fS+HDmCO5Z6TmsN/YSGmP
         M8RP5LVX0P5v3gCX6AgUvuejhMhamPW/61R5rQG2yrSBlfQBWfdr2RiTJP/UOMG6Jvwz
         cPwQ==
X-Forwarded-Encrypted: i=1; AJvYcCXd6cdH3sVdI2zVReoV2pfZ2GJWixxMcNVwmRfhW3DORVxJCWrJvcvw9Z5frs8KERlUbUJhz3HxDOOTJQ==@lists.linaro.org
X-Gm-Message-State: AOJu0YxBpwim13EmsJPLS4neteFcKnrTqaTx/rTC/4v4GEG12vBKT5mC
	NjYJx+8wWGBiVm4qtu55KCgKrzxKvRCncwyjHZeNCtOHtzed8QP+q955fYRY2H2R+jloNMNlZqO
	xBatC7sLFUcUqZ7Yw976iMDW0L0PYp78=
X-Gm-Gg: ASbGncvLECMyhYSV/aH+9up4mXLcxKLNjssu2Hvyjzm17OxSPvIlpeavp6lLPpob25Z
	3bcGHDcwQPiHZe0hlLglnUz2tpiGcyyE+G4Mgv+Vq++YH05nH2Oo9uIIhZkv3K7LMYgwN2aWU++
	W+S7QjO+PXs/TbsFHDMvM/pOXPNthYojC2Ku1Cb/ELa2YC62aQZwSd3XM=
X-Google-Smtp-Source: AGHT+IF8oa3AYXfzFTrpxVaADoFu1eHHdn+1kSB5T16SwRD0pCGON9/yLRxNAAoUhNTp1RU1EfrPnYVf3KNvEcLuhv4=
X-Received: by 2002:aa7:cd16:0:b0:602:e002:f037 with SMTP id
 4fb4d7f45d1cf-602e0033b9bmr3024855a12.5.1748325054655; Mon, 26 May 2025
 22:50:54 -0700 (PDT)
MIME-Version: 1.0
References: <20250527050635.946553-1-clf700383@gmail.com> <2025052700-ungodly-vitality-d86d@gregkh>
In-Reply-To: <2025052700-ungodly-vitality-d86d@gregkh>
From: clingfei <clf700383@gmail.com>
Date: Tue, 27 May 2025 13:50:42 +0800
X-Gm-Features: AX0GCFvpY5pnbxrQ0do9awtnlP68ukFWbQpuKDLKiPXl2ghGljKA7usDYV2uW5w
Message-ID: <CADPKJ-64_fod0ObZsg_prtB4u+ZA6shZ6AnXqn4vxK1NGxHgkQ@mail.gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Spamd-Result: default: False [-8.00 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[99.99%];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_ONE(0.00)[1];
	RCPT_COUNT_SEVEN(0.00)[8];
	MISSING_XM_UA(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.208.66:from];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	DKIM_TRACE(0.00)[gmail.com:+]
X-Rspamd-Queue-Id: 09EF2450A9
X-Spamd-Bar: -------
X-MailFrom: clf700383@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: 3VYIPLGNOSEKRCGT4Y4I5MR7WESSGW4O
X-Message-ID-Hash: 3VYIPLGNOSEKRCGT4Y4I5MR7WESSGW4O
X-Mailman-Approved-At: Tue, 27 May 2025 11:33:15 +0000
CC: elder@kernel.org, keescook@chromium.org, johan@kernel.org, vireshk@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v2] greybus: Avoid fake flexible array for response data
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/3VYIPLGNOSEKRCGT4Y4I5MR7WESSGW4O/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

R3JlZyBLSCA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+IOS6jjIwMjXlubQ15pyIMjfml6Xl
kajkuowgMTM6MTXlhpnpgZPvvJoNCj4NCj4gT24gVHVlLCBNYXkgMjcsIDIwMjUgYXQgMDE6MDY6
MzVQTSArMDgwMCwgY2xpbmdmZWkgd3JvdGU6DQo+ID4gV2Ugd2FudCB0byBnZXQgcmlkIG9mIHpl
cm8gc2l6ZSBhcnJheXMgYW5kIHVzZSBmbGV4aWJsZSBhcnJheXMgaW5zdGVhZC4NCj4gPiBIb3dl
dmVyLCBpbiB0aGlzIGNhc2UgdGhlIHN0cnVjdCBpcyBqdXN0IG9uZSBmbGV4aWJsZSBhcnJheSBv
ZiB1OCB3aGljaA0KPiA+IGFkZHMgbm8gdmFsdWUuIEp1c3QgdXNlIGEgcG9pbnRlciBpbnN0ZWFk
Lg0KPg0KPiBOb3QgdHJ1ZSBhdCBhbGwsIHNvcnJ5LCBpdCBkb2VzICJhZGQgdmFsdWUiLiAgUGxl
YXNlIHJlYWQgdGhlIGdyZXlidXMNCj4gc3BlY2lmaWNhdGlvbiBpZiB5b3UgaGF2ZSBxdWVzdGlv
bnMgYWJvdXQgdGhpcy4NCj4NCj4gPg0KPiA+IHYxOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9h
bGwvMjAyNTA1MjYyMDMyLjUwN0FEOEUwRENAa2Vlc2Nvb2svDQo+DQo+IFBsZWFzZSByZWFkIG91
ciBkb2N1bWVudGF0aW9uIGZvciBob3cgdG8gcHJvcGVybHkgdmVyc2lvbiBrZXJuZWwgcGF0Y2hl
cw0KDQpTb3JyeSwgSSB3aWxsIHJlYWQgaXQuDQo+DQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBj
bGluZ2ZlaSA8Y2xmNzAwMzgzQGdtYWlsLmNvbT4NCj4NCj4gQWxzbywgd2UgbmVlZCBhICJmdWxs
Im5hbWUsIG5vdCBhbiBlbWFpbCBhbGlhcy4NCj4NCj4gPiAtLS0NCj4gPiAgZHJpdmVycy9zdGFn
aW5nL2dyZXlidXMvaTJjLmMgICAgICAgICAgICAgfCAxMiArKysrLS0tLS0tLS0NCj4gPiAgaW5j
bHVkZS9saW51eC9ncmV5YnVzL2dyZXlidXNfcHJvdG9jb2xzLmggfCAgMyAtLS0NCj4gPiAgMiBm
aWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9ucygtKQ0KPiA+DQo+ID4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2kyYy5jIGIvZHJpdmVycy9zdGFn
aW5nL2dyZXlidXMvaTJjLmMNCj4gPiBpbmRleCAxNGYxZmY2ZDQ0OGMuLmIyNDhkNjcxN2I3MSAx
MDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9pMmMuYw0KPiA+ICsrKyBi
L2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2kyYy5jDQo+ID4gQEAgLTE0NCwxNSArMTQ0LDE0IEBA
IGdiX2kyY19vcGVyYXRpb25fY3JlYXRlKHN0cnVjdCBnYl9jb25uZWN0aW9uICpjb25uZWN0aW9u
LA0KPiA+ICB9DQo+ID4NCj4gPiAgc3RhdGljIHZvaWQgZ2JfaTJjX2RlY29kZV9yZXNwb25zZShz
dHJ1Y3QgaTJjX21zZyAqbXNncywgdTMyIG1zZ19jb3VudCwNCj4gPiAtICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBzdHJ1Y3QgZ2JfaTJjX3RyYW5zZmVyX3Jlc3BvbnNlICpyZXNwb25z
ZSkNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1OCAqZGF0YSkNCj4gPiAg
ew0KPiA+ICAgICAgIHN0cnVjdCBpMmNfbXNnICptc2cgPSBtc2dzOw0KPiA+IC0gICAgIHU4ICpk
YXRhOw0KPiA+ICAgICAgIHUzMiBpOw0KPiA+DQo+ID4gLSAgICAgaWYgKCFyZXNwb25zZSkNCj4g
PiArICAgICBpZiAoIWRhdGEpDQo+ID4gICAgICAgICAgICAgICByZXR1cm47DQo+ID4gLSAgICAg
ZGF0YSA9IHJlc3BvbnNlLT5kYXRhOw0KPiA+ICsNCj4gPiAgICAgICBmb3IgKGkgPSAwOyBpIDwg
bXNnX2NvdW50OyBpKyspIHsNCj4gPiAgICAgICAgICAgICAgIGlmIChtc2ctPmZsYWdzICYgSTJD
X01fUkQpIHsNCj4gPiAgICAgICAgICAgICAgICAgICAgICAgbWVtY3B5KG1zZy0+YnVmLCBkYXRh
LCBtc2ctPmxlbik7DQo+ID4gQEAgLTE4OCwxMCArMTg3LDcgQEAgc3RhdGljIGludCBnYl9pMmNf
dHJhbnNmZXJfb3BlcmF0aW9uKHN0cnVjdCBnYl9pMmNfZGV2aWNlICpnYl9pMmNfZGV2LA0KPiA+
DQo+ID4gICAgICAgcmV0ID0gZ2Jfb3BlcmF0aW9uX3JlcXVlc3Rfc2VuZF9zeW5jKG9wZXJhdGlv
bik7DQo+ID4gICAgICAgaWYgKCFyZXQpIHsNCj4gPiAtICAgICAgICAgICAgIHN0cnVjdCBnYl9p
MmNfdHJhbnNmZXJfcmVzcG9uc2UgKnJlc3BvbnNlOw0KPiA+IC0NCj4gPiAtICAgICAgICAgICAg
IHJlc3BvbnNlID0gb3BlcmF0aW9uLT5yZXNwb25zZS0+cGF5bG9hZDsNCj4gPiAtICAgICAgICAg
ICAgIGdiX2kyY19kZWNvZGVfcmVzcG9uc2UobXNncywgbXNnX2NvdW50LCByZXNwb25zZSk7DQo+
ID4gKyAgICAgICAgICAgICBnYl9pMmNfZGVjb2RlX3Jlc3BvbnNlKG1zZ3MsIG1zZ19jb3VudCwg
b3BlcmF0aW9uLT5yZXNwb25zZS0+cGF5bG9hZCk7DQo+ID4gICAgICAgICAgICAgICByZXQgPSBt
c2dfY291bnQ7DQo+ID4gICAgICAgfSBlbHNlIGlmICghZ2JfaTJjX2V4cGVjdGVkX3RyYW5zZmVy
X2Vycm9yKHJldCkpIHsNCj4gPiAgICAgICAgICAgICAgIGRldl9lcnIoZGV2LCAidHJhbnNmZXIg
b3BlcmF0aW9uIGZhaWxlZCAoJWQpXG4iLCByZXQpOw0KPiA+IGRpZmYgLS1naXQgYS9pbmNsdWRl
L2xpbnV4L2dyZXlidXMvZ3JleWJ1c19wcm90b2NvbHMuaCBiL2luY2x1ZGUvbGludXgvZ3JleWJ1
cy9ncmV5YnVzX3Byb3RvY29scy5oDQo+ID4gaW5kZXggODIwMTM0YjAxMDVjLi42YTM1Yzc4Yjk2
N2IgMTAwNjQ0DQo+ID4gLS0tIGEvaW5jbHVkZS9saW51eC9ncmV5YnVzL2dyZXlidXNfcHJvdG9j
b2xzLmgNCj4gPiArKysgYi9pbmNsdWRlL2xpbnV4L2dyZXlidXMvZ3JleWJ1c19wcm90b2NvbHMu
aA0KPiA+IEBAIC02NzgsOSArNjc4LDYgQEAgc3RydWN0IGdiX2kyY190cmFuc2Zlcl9yZXF1ZXN0
IHsNCj4gPiAgICAgICBfX2xlMTYgICAgICAgICAgICAgICAgICAgICAgICAgIG9wX2NvdW50Ow0K
PiA+ICAgICAgIHN0cnVjdCBnYl9pMmNfdHJhbnNmZXJfb3AgICAgICAgb3BzW107ICAgICAgICAg
IC8qIG9wX2NvdW50IG9mIHRoZXNlICovDQo+ID4gIH0gX19wYWNrZWQ7DQo+ID4gLXN0cnVjdCBn
Yl9pMmNfdHJhbnNmZXJfcmVzcG9uc2Ugew0KPiA+IC0gICAgIF9fdTggICAgICAgICAgICAgICAg
ICAgICAgICAgICAgZGF0YVswXTsgICAgICAgIC8qIGluYm91bmQgZGF0YSAqLw0KPiA+IC19IF9f
cGFja2VkOw0KPg0KPiBBcyBJIHNhaWQgYmVmb3JlLCB5b3UgY2FuJ3QganVzdCBkZWxldGUgc3Ry
dWN0dXJlcyB0aGF0IGFyZSBleHBvcnRlZCB0bw0KPiB1c2Vyc3BhY2Ugd2l0aG91dCBicmVha2lu
ZyB0aGluZ3MuICBXaHkgaXMgdGhpcyBjaGFuZ2UgYWNjZXB0YWJsZSB0byBkbw0KPiB0aGF0Pw0K
Pg0KPiBBbmQgaG93IHdhcyBhbnkgb2YgdGhpcyB0ZXN0ZWQ/DQo+DQo+IGdyZWcgay1oDQoNCkNv
dWxkIHlvdSBwbGVhc2UgZ2l2ZSBzb21lIGV4YW1wbGVzIHRoYXQgd2lsbCBiZSBicm9rZW4gYnkg
dGhpcyBjaGFuZ2U/DQpBbmQgSSBhbSBub3Qgc3VyZSBob3cgdGhpcyBzaG91bGQgYmUgdGVzdGVk
LiBJdCBzZWVtcyB0aGF0IGl0IHdpbGwgbm90DQpoYXZlIGFueSBuZWdhdGl2ZSBpbXBhY3Qgb24g
ZnVuY3Rpb25hbGl0eS4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmdyZXlidXMtZGV2IG1haWxpbmcgbGlzdCAtLSBncmV5YnVzLWRldkBsaXN0cy5saW5h
cm8ub3JnClRvIHVuc3Vic2NyaWJlIHNlbmQgYW4gZW1haWwgdG8gZ3JleWJ1cy1kZXYtbGVhdmVA
bGlzdHMubGluYXJvLm9yZwo=
