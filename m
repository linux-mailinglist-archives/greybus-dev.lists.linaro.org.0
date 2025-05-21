Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D900ABF2D6
	for <lists+greybus-dev@lfdr.de>; Wed, 21 May 2025 13:28:55 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id A44BD44407
	for <lists+greybus-dev@lfdr.de>; Wed, 21 May 2025 11:28:54 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	by lists.linaro.org (Postfix) with ESMTPS id 99D473F68D
	for <greybus-dev@lists.linaro.org>; Wed, 21 May 2025 08:42:22 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=SKFhqwa9;
	spf=pass (lists.linaro.org: domain of braker.noob.kernel@gmail.com designates 209.85.128.177 as permitted sender) smtp.mailfrom=braker.noob.kernel@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-70cc667a7ecso25837857b3.3
        for <greybus-dev@lists.linaro.org>; Wed, 21 May 2025 01:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747816942; x=1748421742; darn=lists.linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SCgJZXkhtbkjdkE3gdVVdoOPKWGJdcA4tMEqgryxtSc=;
        b=SKFhqwa9XTutwrO+iMKbuq8Qcjp+P0tyjlbo6QqL66dCFdrshkIje8CgkzNidYhnZR
         oJMe5pHBFxKNueP/hSmoy8Z3HkA+cgUh/4tstbLx81o/4wj65LZ8RL14rrZbRROkg9fu
         rl5ClO8fadLQCOE7bTL4J5wB+mxbllOA52XZJqUhHQ5U75gGPvW7wVM7truUurJ2DCfp
         c0kt0ulvDWYoAbMeojTPofypfqUdYiWNiu5ps/slLair+aSD04OnPfulzlk0p3xEdymA
         MX/VUV8yzeJfmOCvwPDVhY+AvIO+NJ6r5gLRWJceNcfDyYPcWSNjOclv0hQHpEepoxeF
         Rugw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747816942; x=1748421742;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SCgJZXkhtbkjdkE3gdVVdoOPKWGJdcA4tMEqgryxtSc=;
        b=R9ciwiJUD+repz71j58HryAZZCHvLwMuZzzw2pmS4jMbWfCcKdNJsHD75V8pjNMVgw
         s+4fIJ+0DvsaxpU2vffAS9PITiQZ5akMDpjUlgP+Kb5N14KPgGt8T478NjQDyfz/MMXw
         SIl8bLcLdJdhmkIBwTHVJYm+6EHaXmjJ+Jlsc81Funa6JdMUiK/8K3O/U4I8z6uqIe/p
         ElDxcnjXSbp+wIJpvfANSBVHOzppaOiwZ0z6Gg1pffsKaO3kMg13Zl0HRjNCsykNFJOL
         8MHi5mhInZhbXJBzeqyJ3lcPLex5NU79ejxZlEuQPDdVEh4hX21+uIrHHB0BGxuza2oR
         TNug==
X-Forwarded-Encrypted: i=1; AJvYcCUJ7QNJCT8mX0p+u7U7OUaILeDkusboUPLZp/mmOJyrgISZ3Uep66dpdXlKY54ftn7Y6ZZM2FYy1tdtsw==@lists.linaro.org
X-Gm-Message-State: AOJu0YzTvOMjmH24Ont+mfERiazSWmdD6DOqE3jPNFgOJ2YHwK8Q/DwW
	5MI6O0JCh14JiRbprDLNQj66nIY/YGv2zIx96suj44XBlqJhZy/DHOckrX+88/VOtY/SLG2T5Rj
	+60Vc2Lg6XlapPYA6GUSMdpMrNvJbcEk=
X-Gm-Gg: ASbGncs5NGNWrbmHHf4qz0Tj8aNNJTsBRZUG00J5cWTBGL0MvJ6c6Lbuq9WFSLUDYc1
	QpTIfzvz85hdiJfXmSsWfpp4uS57UbumDpV2mtvDwQYdMzt/glLgNEjgnhxF/Npg0GO8Nbg23Rw
	BGzabGxuW6UDGePHcDnUItwz9YQ13cUGvs/nocJs4OXfwMqUb0pnERnQ34JMbSzME//yg7l6iKP
	rGG
X-Google-Smtp-Source: AGHT+IFNHZSYsBdgNuwuykkG1XrjBeWI/DMdaIBKSjsDJ2IOaa44XWs61oPcZaHSqqhwBUVLkt3fM50/jwfOB7wmAmo=
X-Received: by 2002:a05:690c:ed4:b0:708:2604:4a10 with SMTP id
 00721157ae682-70caafccab3mr271916987b3.18.1747816942101; Wed, 21 May 2025
 01:42:22 -0700 (PDT)
MIME-Version: 1.0
References: <aC2ILNV6xgt11KuN@brak3r-Ubuntu> <2025052142-maturing-earthworm-cb31@gregkh>
 <CAG+54DZWjN3ii-JCOME8XdA1B+5yCmRSo0-wqTv+zt5w6UcEVA@mail.gmail.com>
In-Reply-To: <CAG+54DZWjN3ii-JCOME8XdA1B+5yCmRSo0-wqTv+zt5w6UcEVA@mail.gmail.com>
From: Rujra Bhatt <braker.noob.kernel@gmail.com>
Date: Wed, 21 May 2025 14:12:10 +0530
X-Gm-Features: AX0GCFv4llWsqgoVnjPLvP_a1XEhJ4RdYPXyZq8ZJBAv-ijFh3TqO7nT_Ne_OUA
Message-ID: <CAG+54Daj+1fj7pm+f-a-WYYzV5FGKby2_gqu6WjZMPCEXPGDYQ@mail.gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Spamd-Result: default: False [-3.93 / 15.00];
	BAYES_HAM(-2.93)[99.71%];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17:c];
	MIME_GOOD(-0.10)[text/plain];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	ARC_NA(0.00)[];
	RCVD_COUNT_ONE(0.00)[1];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.128.177:from];
	URIBL_BLOCKED(0.00)[daringfireball.net:url,mail.gmail.com:mid,mail-yw1-f177.google.com:rdns,mail-yw1-f177.google.com:helo];
	NEURAL_HAM(-0.00)[-1.000];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+]
X-Rspamd-Queue-Id: 99D473F68D
X-Spamd-Bar: ---
X-MailFrom: braker.noob.kernel@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: SWNIFOBXB5TEQUNIPO5X5GQ6DGLUMYGZ
X-Message-ID-Hash: SWNIFOBXB5TEQUNIPO5X5GQ6DGLUMYGZ
X-Mailman-Approved-At: Wed, 21 May 2025 11:28:41 +0000
CC: Johan Hovold <johan@kernel.org>, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH RESEND] staging : greybus : Documentation : firmware : Replace deprecated strncpy() with strscpy()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/SWNIFOBXB5TEQUNIPO5X5GQ6DGLUMYGZ/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gV2VkLCBNYXkgMjEsIDIwMjUgYXQgMjowOOKAr1BNIFJ1anJhIEJoYXR0DQo8YnJha2VyLm5v
b2Iua2VybmVsQGdtYWlsLmNvbT4gd3JvdGU6DQo+DQo+IE9uIFdlZCwgTWF5IDIxLCAyMDI1IGF0
IDA5OjA2OjAwQU0gKzAyMDAsIEdyZWcgS0ggd3JvdGU6DQo+ID4gQTogaHR0cDovL2VuLndpa2lw
ZWRpYS5vcmcvd2lraS9Ub3BfcG9zdA0KPiA+IFE6IFdlcmUgZG8gSSBmaW5kIGluZm8gYWJvdXQg
dGhpcyB0aGluZyBjYWxsZWQgdG9wLXBvc3Rpbmc/DQo+ID4gQTogQmVjYXVzZSBpdCBtZXNzZXMg
dXAgdGhlIG9yZGVyIGluIHdoaWNoIHBlb3BsZSBub3JtYWxseSByZWFkIHRleHQuDQo+ID4gUTog
V2h5IGlzIHRvcC1wb3N0aW5nIHN1Y2ggYSBiYWQgdGhpbmc/DQo+ID4gQTogVG9wLXBvc3Rpbmcu
DQo+ID4gUTogV2hhdCBpcyB0aGUgbW9zdCBhbm5veWluZyB0aGluZyBpbiBlLW1haWw/DQo+ID4N
Cj4gPiBBOiBOby4NCj4gPiBROiBTaG91bGQgSSBpbmNsdWRlIHF1b3RhdGlvbnMgYWZ0ZXIgbXkg
cmVwbHk/DQo+ID4NCj4gPg0KPiA+IGh0dHA6Ly9kYXJpbmdmaXJlYmFsbC5uZXQvMjAwNy8wNy9v
bl90b3ANCj4gPg0KPiA+IE9uIFdlZCwgTWF5IDIxLCAyMDI1IGF0IDExOjExOjI2QU0gKzA1MzAs
IHJ1anJhIHdyb3RlOg0KPiA+ID4gSGkgZ3JlZywNCj4gPiA+DQo+ID4gPiB3aHkgaXMgdGhpcyBh
IFJFU0VORCA/Og0KPiA+ID4NCj4gPiA+ID4+IEkgaGFkIHNlbnQgdGhlIHNhbWUgcGF0Y2ggNCBk
YXlzIGFnbyBhbmQgZGlkbid0IGdldCBhbnkgcmVwbHkgLCBoZW5jZSB0cmllZCB0byByZXNlbmQg
dGhlIHNhbWUgcGF0Y2ggZm9yIHRoZSBzYW1lLA0KPiA+ID4gaGVyZSBpcyBlYXJsaWVyIG1haWwg
Og0KPiA+ID4gaHR0cHM6Ly9tYWlsLmdvb2dsZS5jb20vbWFpbC91LzEvP2lrPWY2M2IwMzUxNWUm
dmlldz1vbSZwZXJtbXNnaWQ9bXNnLWE6czoxMjI5MDg2MzkzMDI1OTY1MTcyMQ0KPiA+DQo+ID4g
VGhhdCBpcyBhIGxpbmsgdG8gX3lvdXJfIGFjY291bnQsIG5vdCBhIHB1YmxpYyByZWNvcmQgb2Yg
eW91ciBlbWFpbCA6KA0KPiA+DQo+ID4gPiAsDQo+ID4gPg0KPiA+ID4gbGluZSBkb2VzIG5vdCBt
YXRjaCB0aGlzOg0KPiA+ID4gPj4gc29ycnkgLCBpIGNvdWxkIG5vdCBnZXQgaXQgd2hhdCBpdCBp
cyBleGFjdGx5ID8sIGlmIHBvc3NpYmxlIGNhbiB5b3Ugc2hhcmUgc29tZSBpbnNpZ2h0cyBvciBl
eGFtcGxlIHNvIHRoYXQgZnJvbSBpbiBmdXR1cmUgaSB3b3VsZCBnZXQgaXQgcmlnaHQuDQo+ID4N
Cj4gPiBZb3VyICJGcm9tOiIgbGluZSBpbiB5b3VyIGVtYWlsIGRvZXMgbm90IG1hdGNoIHdpdGgg
dGhlIHNpZ25lZC1vZmYtYnkNCj4gPiBsaW5lLg0KPg0KPiBUaGlzIGhhcyBiZWVuIGFkZHJlc3Nl
ZCBzdWNjZXNzZnVsbHksIEtpbmRseSBwcmV2aWV3IGl0Lg0KPg0KPiBpcyB0aGlzIHRoZSB3YXkg
Y29ycmVjdCBhYm91dCB0aGUgcmVwbHkgZW1haWwgPyAsIGtpbmRseSBsZXQgbWUga25vdyBhcyBJ
DQo+IGhhdmUgdHJpZWQgdG8gZ2V0IG1vcmUgYW5kIG1vcmUgYW5zd2VycyBhbmQgc29sdmVkIGlz
c3VlcywgYW5kIHRoYW5rIHlvdQ0KPiBzbyBtdWNoIGZvciB5b3VyIGd1aWRhbmNlIGFuZCB3aWxs
IGJlIGtlZXAgaW4gbWluZCBhYm91dCB0aGUgcHJvY2VzcyBhbmQgd2lsbA0KPiBub3QgZmFpbCBu
ZXh0IHRpbWUgb253YXJkcy4NCj4NCg0KDQo+IE9uIFdlZCwgTWF5IDIxLCAyMDI1IGF0IDI6MDLi
gK9QTSBHcmVnIEtIIDxncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZz4gd3JvdGU6DQo+ID4NCj4g
PiBPbiBXZWQsIE1heSAyMSwgMjAyNSBhdCAwMTozMDo0NFBNICswNTMwLCBSdWpyYSBCaGF0dCB3
cm90ZToNCj4gPg0KPiA+IDxzbmlwPg0KPiA+DQo+ID4gRm9yIHNvbWUgcmVhc29uIHlvdSBzZW50
IHRoaXMgb25seSB0byBtZSwgd2hpY2ggaXMgYSBiaXQgcnVkZSB0bw0KPiA+IGV2ZXJ5b25lIGVs
c2Ugb24gdGhlIG1haWxpbmcgbGlzdC4gIEknbGwgYmUgZ2xhZCB0byByZXNwb25kIGlmIHlvdQ0K
PiA+IHJlc2VuZCBpdCB0byBldmVyeW9uZS4NCj4gPg0KDQpSZS1zZW5kIGl0IHRvIGV2ZXJ5b25l
ICwgYXMgcGVyIHlvdXIgZ3VpZGFuY2UgLA0KdGhhbmsgeW91LCBhbmQgc29ycnkgZm9yIGFueSBp
bmNvbnZlbmllbmNlIGNhdXNlZC4NCg0KdGhhbmsgeW91LA0KcmVnYXJkcywNClJ1anJhIEJoYXR0
DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpncmV5YnVz
LWRldiBtYWlsaW5nIGxpc3QgLS0gZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpUbyB1bnN1
YnNjcmliZSBzZW5kIGFuIGVtYWlsIHRvIGdyZXlidXMtZGV2LWxlYXZlQGxpc3RzLmxpbmFyby5v
cmcK
