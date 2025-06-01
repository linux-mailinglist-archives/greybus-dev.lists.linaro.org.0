Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id BA236ACADCB
	for <lists+greybus-dev@lfdr.de>; Mon,  2 Jun 2025 14:08:32 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 86FEB443E6
	for <lists+greybus-dev@lfdr.de>; Mon,  2 Jun 2025 12:08:31 +0000 (UTC)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	by lists.linaro.org (Postfix) with ESMTPS id 256AC43D69
	for <greybus-dev@lists.linaro.org>; Sun,  1 Jun 2025 09:31:19 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b="NubAg/yY";
	spf=pass (lists.linaro.org: domain of braker.noob.kernel@gmail.com designates 209.85.219.172 as permitted sender) smtp.mailfrom=braker.noob.kernel@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-e7d9d480e6cso2512354276.2
        for <greybus-dev@lists.linaro.org>; Sun, 01 Jun 2025 02:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748770279; x=1749375079; darn=lists.linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M2XnIZlfqbuB02O2JRcDHPIrk01jX+E1tx8F/ogvGZA=;
        b=NubAg/yYkKItyYkENR51/0USatfHywXjoLXOmwpjuf13Nl6ynSz9yhku9C+6hK02iT
         9qSWuOr0+UcUYN2VWU9Y3SiUH3ZjGn1Uo1Pa7XP9St67pCBy23fFnAGj8nZQy5NV+LCo
         ucTpQftnZ7wq0N6WpEGudfTdmnfaReEkC2RprygqoCsMU7f7gy4MygtdRQ9G6brq3Uyj
         rTzQ02JkryVsz1jdv730iJwFKklSeqmEygH/4Ab0IU56VMSLt+B9fs9a8LPdA2XNoUXj
         7KFKA1O2ycQLkGm45KhIP2j7Px4AsMgiz+r6p9eZIHzVLDsREGyuMlDFyWkn+pb5fxfs
         8ddQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748770279; x=1749375079;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M2XnIZlfqbuB02O2JRcDHPIrk01jX+E1tx8F/ogvGZA=;
        b=ZC7lzviNGqdWxL6ZRsU9+Eg78kownhzLANkbsso4AGLZDntVF/bHVeLR8dyoFvHNzO
         zGtNFy3yGzOR+Owm9VzojdyOeA9K/tRtUbVNpU0p8NccjmG2XjKgc9/DR0t7vti6H7Z7
         QvjId1eSLVof03DUU964x7GjH7H5shZ6WVnXSyUsR+XBNJ57FgSI5cQCO0olL2vYzIk2
         voidEyeS54ccYK1EYv00SFcMXVDyZi9mddzAH5P2d4v6swSSEY2Z7fm/+V2uApFuwlhk
         fk+yV6+0Afa0+UHTTysgD3YlHk8ZiBVJY7qoxcoFAl6m/qFyXZuimyM0UL3c9K3GFL62
         9cwQ==
X-Forwarded-Encrypted: i=1; AJvYcCXft0LqehQ5tSOqj4z3dGmY2L+nBddqu4Vylu5wPKlsZPFWXMjdntgBC/sIPK+uneoySEwoqSVeXrOw9A==@lists.linaro.org
X-Gm-Message-State: AOJu0Yz+zMIr7BXNGm6gkXCkXAf+J0CFDBIVZdxuv+MkfL7h4gl6PEma
	3QZjrvdTnFEvNZuzbmirozoFOEwKVUyyhR49gsTBEFaY1IvwA1eP5cgM8bhMrYEMuo5iTU8aaAb
	n12Cj1kQfjZD1TZp6YUklYkwiU4ZcnJRDEVpL
X-Gm-Gg: ASbGncvLMxnd9TjEI3FqcE9q7zmTCNdJWefacLVBFs+jAqq84mcoRRdku5ZarsBmtI4
	sDf1emPkzqUa1JmIAeLHh2OsaO5FSyeRdjI8L3ShneRHf3QXxAfQcvLWU0ky7ArZ3d3PN9kvETr
	MvfqG26R0P0rgedmB37qqGWr6B+RFvFfb2MqH4MJW199SS2HmVRPetU7tpE7DbT+eimg==
X-Google-Smtp-Source: AGHT+IEAVxxVpc52dXYXmYpF2W2KyGQQojuQC/tNyL+Jz/nubv7tptBH4Ky3KnPNhkTPSeL9J6BGRhHiNSfj1DyScu4=
X-Received: by 2002:a05:690c:884:b0:70e:2d77:3cfe with SMTP id
 00721157ae682-71097c34bb1mr62644577b3.2.1748770278556; Sun, 01 Jun 2025
 02:31:18 -0700 (PDT)
MIME-Version: 1.0
References: <CAG+54DZgF55R2pEtkVBdnwXEyNu9TrSMA9zkmw7RjWrDqX4SsQ@mail.gmail.com>
 <aDAvnmtgnssj7K5l@stanley.mountain>
In-Reply-To: <aDAvnmtgnssj7K5l@stanley.mountain>
From: Rujra Bhatt <braker.noob.kernel@gmail.com>
Date: Sun, 1 Jun 2025 15:01:07 +0530
X-Gm-Features: AX0GCFvrKlBcZktxRYZfmtgwWx5h5VXrJDETBQWkyQDAgoH4Jt5t3xNUgvl3A9M
Message-ID: <CAG+54DZC9ATaTme_WknauN5LVQRKut-ZJs8SAaZv8FbcQMCf7Q@mail.gmail.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Spamd-Result: default: False [-3.69 / 15.00];
	BAYES_HAM(-2.69)[98.65%];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RCVD_COUNT_ONE(0.00)[1];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.219.172:from];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	URIBL_BLOCKED(0.00)[linaro.org:email,mail.gmail.com:mid];
	NEURAL_HAM(-0.00)[-1.000];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+]
X-Rspamd-Queue-Id: 256AC43D69
X-Spamd-Bar: ---
X-MailFrom: braker.noob.kernel@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: LYGUSONPDNE7ABHOQ2VJKVRVJ7G72XAC
X-Message-ID-Hash: LYGUSONPDNE7ABHOQ2VJKVRVJ7G72XAC
X-Mailman-Approved-At: Mon, 02 Jun 2025 12:08:29 +0000
CC: Johan Hovold <johan@kernel.org>, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging : greybus : Documentation : firmware : Replace deprecated strncpy() with strscpy()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/LYGUSONPDNE7ABHOQ2VJKVRVJ7G72XAC/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgRGFuLA0KDQoNCg0KT24gRnJpLCBNYXkgMjMsIDIwMjUgYXQgMTo0OeKAr1BNIERhbiBDYXJw
ZW50ZXIgPGRhbi5jYXJwZW50ZXJAbGluYXJvLm9yZz4gd3JvdGU6DQo+DQo+IE9uIFNhdCwgTWF5
IDE3LCAyMDI1IGF0IDA5OjExOjMwQU0gKzA1MzAsIHJ1anJhIHdyb3RlOg0KPiA+IFRvIGVuc3Vy
aW5nIHRoYXQgdGhlIGZpcm13YXJlX3RhZyBpcyBwcm9wZXJseSBudWxsLXRlcm1pbmF0ZWQuIFdo
ZW4NCj4gPiBjb3B5aW5nIGZpcm13YXJlIHRhZyBzdHJpbmdzIHRvIHByZXZlbnQgYnVmZmVyIG92
ZXJmbG93cyBhbmQgZW5zdXJlDQo+ID4gZGF0YSBpbnRlZ3JpdHkuDQo+ID4NCj4gPiBUaGUgbWF4
aW11bSBzaXplIG9mIHRhZyBpcyBHQl9GSVJNV0FSRV9VX1RBR19NQVhfU0laRSA9IDEwIGJ5dGVz
LCBhbmQgaXQNCj4gPiBtYXkgb3IgbWF5IG5vdCBiZSBOVUxMLXRlcm1pbmF0ZWQuDQo+ID4gaW5j
bHVkZWQgaW4gImdyZXlidXNfZmlybXdhcmUuaCINCj4gPg0KPiA+IGNoYW5nZXMgaGFzIGJlZW4g
bWFkZSBhdCAzIHBvc2l0aW9uczoNCj4gPiAxOiB1cGRhdGUgZmlybXdhcmUgdGFnDQo+ID4gMjog
YmFja2VuZCB1cGRhdGUgZmlybXdhcmUgdGFnDQo+ID4gMzogYmFja2VuZCB1cGRhdGUgZmlybXdh
cmUgdGFnIHdpdGggdW5pcHJvDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBSdWpyYSBCaGF0dCA8
YnJha2VyLm5vb2Iua2VybmVsQGdtYWlsLmNvbT4NCj4NCj4gRnJvbSBkb2Vzbid0IG1hdGNoIFNp
Z25lZC1vZmYtYnkgbGluZS4NCj4NCj4gVGhlIHBhdGNoIGlzIGNvcnJ1cHRlZCBhbmQgZG9lc24n
dCBhcHBseS4gIFJlYWQgdGhlIHR3byBwYXJhZ3JhcGhzIG9mDQo+IERvY3VtZW50YXRpb24vcHJv
Y2Vzcy9lbWFpbC1jbGllbnRzLnJzdC4NCj4NCj4gVGhpcyBpcyBhIHVzZXNwYWNlIHByb2dyYW0g
c28gSSBkb24ndCB0aGluayBpdCBoYXMgYSBzdHJzY3B5KCkNCj4gZnVuY3Rpb24uICBIb3cgZGlk
IHlvdSBjb21waWxlIHRoaXM/DQoNCkkgbWlzdGFrZW5seSBzdWJtaXR0ZWQgdGhlIHBhdGNoIHdp
dGggYSBtaXNtYXRjaGVkIEZyb206IGFuZA0KU2lnbmVkLW9mZi1ieTogbGluZS4gSeKAmWxsIGNv
cnJlY3QgdGhlIGF1dGhvciBpbmZvcm1hdGlvbiBmcm9tIG5vdw0Kb253YXJkcyBwYXRjaGVzIGJ5
IGZvbGxvd2luZyB0aGUgZ3VpZGFuY2UgaW4NCkRvY3VtZW50YXRpb24vcHJvY2Vzcy9lbWFpbC1j
bGllbnRzLnJzdC4NCg0KQWxzbywgcmVnYXJkaW5nIHRoZSB1c2Ugb2Ygc3Ryc2NweSgpOg0KWW91
J3JlIGFic29sdXRlbHkgY29ycmVjdC4gSXQncyBhIGtlcm5lbC1zcGFjZSBmdW5jdGlvbiBhbmQg
bm90DQphdmFpbGFibGUgaW4gdXNlciBzcGFjZS4gVGhhdCBjYWxsIHNob3VsZG7igJl0IGhhdmUg
YmVlbiB0aGVyZS4gSeKAmWxsDQpyZXBsYWNlIGl0IHdpdGggYSBzdWl0YWJsZSB1c2Vyc3BhY2Ug
YWx0ZXJuYXRpdmUsIHN1Y2ggYXMgc3RybmNweSgpLA0KYXMgZWFybGllciBpdCB3YXMuDQoNCkFs
c28gSSBhbSBub3QgYWJsZSB0byBjb21waWxlIGl0IHByb3Blcmx5LiBXaWxsIGxlYXJuIGl0IHRo
ZSBwcm9wZXINCndheSwgYXMgSSBoYXZlIHRyaWVkIHRvIGNvbXBpbGUgaXQgdmlhIHR1cm5pbmcg
T04gdGhlIGtlcm5lbA0KbWVudWNvbmZpZyBmb3IgZ3JleWJ1cyBzdXBwb3J0IGFuZA0KLS0tIFsq
XSJHcmV5YnVzIEZpcm13YXJlIERvd25sb2FkIENsYXNzIGRyaXZlciIgdGhlbiBjb21waWxlZCBp
dCB1c2luZw0KbWFrZSBhbmQgaW5zdGFsbGVkIGl0LCBBbHNvIGhhdmUgbm90IHRlc3RlZCB2aWEg
ImdjYyAtbyBmaXJtd2FyZQ0KZmlybXdhcmUuYyIuDQpJZiB5b3UgaGF2ZSBhbnkgc3VnZ2VzdGlv
bnMgb24gaG93IHRvIGNvbXBpbGUgb3IgdGVzdCB0aGlzIG1vcmUNCmVmZmVjdGl2ZWx5LCBJIHdv
dWxkIHJlYWxseSBhcHByZWNpYXRlIHlvdXIgZ3VpZGFuY2UuDQoNClRoYW5rIHlvdSBzbyBtdWNo
IGZvciB0aGUgZmVlZGJhY2sgYW5kIHJldmlldy4gQWxzbyBzb3JyeSBmb3IgbXkNCmRlbGF5ZWQg
cmVzcG9uc2UuDQoNCnJlZ2FyZHMsDQpSdWpyYSBCaGF0dA0KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0IC0tIGdy
ZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKVG8gdW5zdWJzY3JpYmUgc2VuZCBhbiBlbWFpbCB0
byBncmV5YnVzLWRldi1sZWF2ZUBsaXN0cy5saW5hcm8ub3JnCg==
