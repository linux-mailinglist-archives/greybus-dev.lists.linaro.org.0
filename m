Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id C45CBABF2D5
	for <lists+greybus-dev@lfdr.de>; Wed, 21 May 2025 13:28:50 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id DEA6244410
	for <lists+greybus-dev@lfdr.de>; Wed, 21 May 2025 11:28:49 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	by lists.linaro.org (Postfix) with ESMTPS id ACD913F68D
	for <greybus-dev@lists.linaro.org>; Wed, 21 May 2025 08:39:03 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=AzhfqKmy;
	spf=pass (lists.linaro.org: domain of braker.noob.kernel@gmail.com designates 209.85.128.178 as permitted sender) smtp.mailfrom=braker.noob.kernel@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-6ff4faf858cso46132497b3.2
        for <greybus-dev@lists.linaro.org>; Wed, 21 May 2025 01:39:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747816743; x=1748421543; darn=lists.linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nlxLaOezJ54RMifNGPJT90Ch1a3hAKhBD04YGfXVM6I=;
        b=AzhfqKmyruuj9Wj/6tKjXX5fTBsrTaCf0FJ7GndpuOVhEmn3d5SseKXm31mY9/6xYB
         Mu9UogQFQEN+JC7I6WyXvlBJ1m2NoR2xbTpWnv7jN7NjPYwRsmeXF00DGB9XBeVWiRJV
         b+dfQIRYpSV/OCsxu8wTbmmfPlvwHJVP0fNzBgMpV6sWPmfAV3bGQIldNB62jOvFoCTG
         21G9KW+st3wnDy68Q18f6HTPAHjhbZQEM5V9Dvi9HXZbOR+Om6vveh08AeZqJ27y+Our
         YrtnYrjQE4WLPdrw97T2IgWW47l6WkYpJtSLU8XOkij274SqgfQiJNXVkTo39LB73ezv
         xAhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747816743; x=1748421543;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nlxLaOezJ54RMifNGPJT90Ch1a3hAKhBD04YGfXVM6I=;
        b=KEEFB7nTWdmnCktonVvvsDqoBFKWuiMzt3B19e2ZSAf/U1tqGxM67tuN8rf9MCjG6k
         CUK6PPXxQnjMf31XeLixZsSBlEi2j7+wSv4GpZr/+zw4ldYkyjYyLrpCQI3SbrDYDuki
         OVhEZLa8b5UUuUwZhrHwi1R5Y9PdRqxMHu4UOgo732tvseLa8oSRyYCIlpmOKNq91OU6
         /HGGiSfMIveAZXNKnVUtN4tme0hocgLGZ5MGws34BMdrrkBciLCWnkfsBRPk6plF26xu
         TFqo/zPAJQN3dzjEMgADjzmnbJvOnIrX3bvvDSdoNS6yhr3a/GgzJy22/4FXPvMpzrdP
         4GEg==
X-Forwarded-Encrypted: i=1; AJvYcCXc+xzCsrmwc3dZQp2SQ3nR5oA8lCrKizSjqfQ0sh6qpNBDT5Fy/zzQ9cZiBe7sYLWWWj7vFsTFZPs9vA==@lists.linaro.org
X-Gm-Message-State: AOJu0YzqVH7ChpMsPZj4Wk71+HOHsnDhSG2nIxSQqGswdw0DtyDwFULs
	oAlCupQNzMpCVAMcC6EvezXA656hic0u122sRzHhLB5RzvNuMLQlnmIeqOOiAsfGfg9p08wUNG/
	SmffQI5PkJZV1JOj/VUu2EVZwXrVNZMg=
X-Gm-Gg: ASbGncueT3t/1qDtLjG0/WoHs5XK52sbQ6xjePA1SlpG7gZW3YwqKhO2RJvFNm4oM8S
	BJsqavzzFaVk3B/g4+P/dLrs+CSR8VTmbleI1fSsNeKlT3y1KeO76g1CtZa5LLL48x23q6Yan73
	CK8FVC+M+wlMjBlXNm/5ObFqstis+c+1TqzWR0ezPcGtC1CeMH47tDT+HZtR2O8GRM4g==
X-Google-Smtp-Source: AGHT+IGn1ic8/qU3MsjWAq3GBfIPqaxt/z4IAGrqjkiBpwB9quqh6qpru5pVvB2n0NZEUTIDlvgIJbb6/9KsnN95NN4=
X-Received: by 2002:a05:690c:3610:b0:70d:fd2a:1457 with SMTP id
 00721157ae682-70dfd2a14dbmr3227307b3.1.1747816743190; Wed, 21 May 2025
 01:39:03 -0700 (PDT)
MIME-Version: 1.0
References: <aC2ILNV6xgt11KuN@brak3r-Ubuntu> <2025052142-maturing-earthworm-cb31@gregkh>
In-Reply-To: <2025052142-maturing-earthworm-cb31@gregkh>
From: Rujra Bhatt <braker.noob.kernel@gmail.com>
Date: Wed, 21 May 2025 14:08:52 +0530
X-Gm-Features: AX0GCFt73yT51gJAn-US9CzR9fBeYpCj9Uj81PJZLSTvmlHCr2-bT7uYTz3V5X0
Message-ID: <CAG+54DZWjN3ii-JCOME8XdA1B+5yCmRSo0-wqTv+zt5w6UcEVA@mail.gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Spamd-Result: default: False [-4.00 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	MIME_GOOD(-0.10)[text/plain];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	URIBL_BLOCKED(0.00)[linuxfoundation.org:email,mail.gmail.com:mid,daringfireball.net:url];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_ONE(0.00)[1];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	DWL_DNSWL_BLOCKED(0.00)[gmail.com:dkim];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.128.178:from];
	RCPT_COUNT_FIVE(0.00)[6]
X-Rspamd-Queue-Id: ACD913F68D
X-Spamd-Bar: ---
X-MailFrom: braker.noob.kernel@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: ZBVSPLKPWEPRJPJFBTLMIZXQFO2W6JIC
X-Message-ID-Hash: ZBVSPLKPWEPRJPJFBTLMIZXQFO2W6JIC
X-Mailman-Approved-At: Wed, 21 May 2025 11:28:40 +0000
CC: Johan Hovold <johan@kernel.org>, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH RESEND] staging : greybus : Documentation : firmware : Replace deprecated strncpy() with strscpy()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/ZBVSPLKPWEPRJPJFBTLMIZXQFO2W6JIC/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gV2VkLCBNYXkgMjEsIDIwMjUgYXQgMDk6MDY6MDBBTSArMDIwMCwgR3JlZyBLSCB3cm90ZToN
Cj4gQTogaHR0cDovL2VuLndpa2lwZWRpYS5vcmcvd2lraS9Ub3BfcG9zdA0KPiBROiBXZXJlIGRv
IEkgZmluZCBpbmZvIGFib3V0IHRoaXMgdGhpbmcgY2FsbGVkIHRvcC1wb3N0aW5nPw0KPiBBOiBC
ZWNhdXNlIGl0IG1lc3NlcyB1cCB0aGUgb3JkZXIgaW4gd2hpY2ggcGVvcGxlIG5vcm1hbGx5IHJl
YWQgdGV4dC4NCj4gUTogV2h5IGlzIHRvcC1wb3N0aW5nIHN1Y2ggYSBiYWQgdGhpbmc/DQo+IEE6
IFRvcC1wb3N0aW5nLg0KPiBROiBXaGF0IGlzIHRoZSBtb3N0IGFubm95aW5nIHRoaW5nIGluIGUt
bWFpbD8NCj4NCj4gQTogTm8uDQo+IFE6IFNob3VsZCBJIGluY2x1ZGUgcXVvdGF0aW9ucyBhZnRl
ciBteSByZXBseT8NCj4NCj4NCj4gaHR0cDovL2RhcmluZ2ZpcmViYWxsLm5ldC8yMDA3LzA3L29u
X3RvcA0KPg0KPiBPbiBXZWQsIE1heSAyMSwgMjAyNSBhdCAxMToxMToyNkFNICswNTMwLCBydWpy
YSB3cm90ZToNCj4gPiBIaSBncmVnLA0KPiA+DQo+ID4gd2h5IGlzIHRoaXMgYSBSRVNFTkQgPzoN
Cj4gPg0KPiA+ID4+IEkgaGFkIHNlbnQgdGhlIHNhbWUgcGF0Y2ggNCBkYXlzIGFnbyBhbmQgZGlk
bid0IGdldCBhbnkgcmVwbHkgLCBoZW5jZSB0cmllZCB0byByZXNlbmQgdGhlIHNhbWUgcGF0Y2gg
Zm9yIHRoZSBzYW1lLA0KPiA+IGhlcmUgaXMgZWFybGllciBtYWlsIDoNCj4gPiBodHRwczovL21h
aWwuZ29vZ2xlLmNvbS9tYWlsL3UvMS8/aWs9ZjYzYjAzNTE1ZSZ2aWV3PW9tJnBlcm1tc2dpZD1t
c2ctYTpzOjEyMjkwODYzOTMwMjU5NjUxNzIxDQo+DQo+IFRoYXQgaXMgYSBsaW5rIHRvIF95b3Vy
XyBhY2NvdW50LCBub3QgYSBwdWJsaWMgcmVjb3JkIG9mIHlvdXIgZW1haWwgOigNCj4NCj4gPiAs
DQo+ID4NCj4gPiBsaW5lIGRvZXMgbm90IG1hdGNoIHRoaXM6DQo+ID4gPj4gc29ycnkgLCBpIGNv
dWxkIG5vdCBnZXQgaXQgd2hhdCBpdCBpcyBleGFjdGx5ID8sIGlmIHBvc3NpYmxlIGNhbiB5b3Ug
c2hhcmUgc29tZSBpbnNpZ2h0cyBvciBleGFtcGxlIHNvIHRoYXQgZnJvbSBpbiBmdXR1cmUgaSB3
b3VsZCBnZXQgaXQgcmlnaHQuDQo+DQo+IFlvdXIgIkZyb206IiBsaW5lIGluIHlvdXIgZW1haWwg
ZG9lcyBub3QgbWF0Y2ggd2l0aCB0aGUgc2lnbmVkLW9mZi1ieQ0KPiBsaW5lLg0KDQpUaGlzIGhh
cyBiZWVuIGFkZHJlc3NlZCBzdWNjZXNzZnVsbHksIEtpbmRseSBwcmV2aWV3IGl0Lg0KDQppcyB0
aGlzIHRoZSB3YXkgY29ycmVjdCBhYm91dCB0aGUgcmVwbHkgZW1haWwgPyAsIGtpbmRseSBsZXQg
bWUga25vdyBhcyBJDQpoYXZlIHRyaWVkIHRvIGdldCBtb3JlIGFuZCBtb3JlIGFuc3dlcnMgYW5k
IHNvbHZlZCBpc3N1ZXMsIGFuZCB0aGFuayB5b3UNCnNvIG11Y2ggZm9yIHlvdXIgZ3VpZGFuY2Ug
YW5kIHdpbGwgYmUga2VlcCBpbiBtaW5kIGFib3V0IHRoZSBwcm9jZXNzIGFuZCB3aWxsDQpub3Qg
ZmFpbCBuZXh0IHRpbWUgb253YXJkcy4NCg0KdGhhbmsgeW91LA0KcmVnYXJkcywNClJ1anJhIEJo
YXR0DQoNCk9uIFdlZCwgTWF5IDIxLCAyMDI1IGF0IDI6MDLigK9QTSBHcmVnIEtIIDxncmVna2hA
bGludXhmb3VuZGF0aW9uLm9yZz4gd3JvdGU6DQo+DQo+IE9uIFdlZCwgTWF5IDIxLCAyMDI1IGF0
IDAxOjMwOjQ0UE0gKzA1MzAsIFJ1anJhIEJoYXR0IHdyb3RlOg0KPg0KPiA8c25pcD4NCj4NCj4g
Rm9yIHNvbWUgcmVhc29uIHlvdSBzZW50IHRoaXMgb25seSB0byBtZSwgd2hpY2ggaXMgYSBiaXQg
cnVkZSB0bw0KPiBldmVyeW9uZSBlbHNlIG9uIHRoZSBtYWlsaW5nIGxpc3QuICBJJ2xsIGJlIGds
YWQgdG8gcmVzcG9uZCBpZiB5b3UNCj4gcmVzZW5kIGl0IHRvIGV2ZXJ5b25lLg0KPg0KPiB0aGFu
a3MsDQo+DQo+IGdyZWcgay1oDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpncmV5YnVzLWRldiBtYWlsaW5nIGxpc3QgLS0gZ3JleWJ1cy1kZXZAbGlzdHMu
bGluYXJvLm9yZwpUbyB1bnN1YnNjcmliZSBzZW5kIGFuIGVtYWlsIHRvIGdyZXlidXMtZGV2LWxl
YXZlQGxpc3RzLmxpbmFyby5vcmcK
