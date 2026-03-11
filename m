Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2NJ2JH4tsWkVrwIAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Wed, 11 Mar 2026 09:53:18 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 338E425FC54
	for <lists+greybus-dev@lfdr.de>; Wed, 11 Mar 2026 09:53:18 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 3F338401F8
	for <lists+greybus-dev@lfdr.de>; Wed, 11 Mar 2026 08:53:17 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	by lists.linaro.org (Postfix) with ESMTPS id 31BB13F804
	for <greybus-dev@lists.linaro.org>; Wed, 11 Mar 2026 05:43:01 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=UwrPwxlF;
	arc=pass ("google.com:s=arc-20240605:i=1");
	spf=pass (lists.linaro.org: domain of lukagejak5@gmail.com designates 209.85.215.169 as permitted sender) smtp.mailfrom=lukagejak5@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-c73a5473bbdso1428564a12.2
        for <greybus-dev@lists.linaro.org>; Tue, 10 Mar 2026 22:43:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773207780; cv=none;
        d=google.com; s=arc-20240605;
        b=YIEil1K/G9HlBrgsyV6gKxhE/G5r6YJ8dwQENZBA2/LVSdPlMrjoGdlN02LqnZN/d8
         RuixYr6v1DtCIxzcgaesN3k0YK0M0r81FRfHOadb7P1OWsMtdobE+RTRhIr03FpFJgtw
         Gx/qI9E3fCcaJhfek3+WNJm2qFUJI7Vdn4ME5VuywlAB7jKDxewnQ5ABvLxyGbxskNCM
         ZSJnpioG7S/FHZpRL1G+X2WT/Z64D7331tXaR85W9XTfba6nA6EliBXlU+AEBE4Ye4jT
         hGdCRwVOMoQF7x6Z/1amdg4aBRZxLG83OV4I0yxkotZwYnVEjOtFRQ/EGp8pyA5UcxP2
         TVwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HsZ0aj30QzrWxLy9ik/IeJVQ3KkElzxj0uQiMmN5kNQ=;
        fh=plj3I7hnjwtgEEMFbGcR67cRHvQHx2d2mRdr90fRRe4=;
        b=PdczGIGw6p7lp78O6zeUN8YYpj1tWIKhzstl7x/vHsfrlnJ6w1S3dcbtVtjgY6xGgT
         FafDFHRPIIclAkT20yzMtsNLC1nncz//hDF9Mtz68jmuKn0yAM4oTTqhyhWnsBvQ34wC
         ZVoxlYnx3heGXvMVlu5R4bgBzJ8ynkI6Q9lACTMM+mpA5AOt/a31ey4V1cRq1CoCcMYG
         hBTnAslj8CyFQpX08gSIjTQlJ5TflYH+grPBm24WXX2cQ8Qsfucsar+rZdHhum0Qd3cB
         u9dYW3vlfSnA8dV0zjBXFQCOQ1li+Eqq5Oas3q0+GqRV2RSQmhldrNjRm7KLE+EMVzpJ
         h9eQ==;
        darn=lists.linaro.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773207780; x=1773812580; darn=lists.linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HsZ0aj30QzrWxLy9ik/IeJVQ3KkElzxj0uQiMmN5kNQ=;
        b=UwrPwxlFlR1qx8v57b34Du2YBUt8qEGBKBcQprBQESG64NUop/uPX7NyrvLUfF2lE3
         eNRpdOr7Ur+Qo77nzWL4l/pDzeERSCxNAquOERPexYRMkETMMIZKLB9DwcRVRnLzgPnS
         stTK+lTFsEuGpw4AAeMgJiQKg0PWG5u4+mIArfoHQtILbRzWvi6Uc6XiZBSRA4/51WSM
         AMM92iyl6+/dASC8DS4zrZX8CyjSktebGLhszxjxTZqPnNnpKU+qSJl/aRMyKvzbXwMI
         yRxw9nHCQrjPoi6YnkftxQEjkvLST9U8cyRbR/sb/snG1Tz5i9F69cDHkr2fK5cAxZav
         YLTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773207780; x=1773812580;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HsZ0aj30QzrWxLy9ik/IeJVQ3KkElzxj0uQiMmN5kNQ=;
        b=eTaUIqpQdK7FYVofpWqD/7nHYTrVADJJKW/JUJn2ceGxPk+BAcDB3+NpwcniWiPmuP
         TDKH7H9L4x2LG1mWyg0JQyPCUUtr5V8tSBV4nyXaIfRMzmcoIQ63Lz7v6Aaf2NTrr312
         5uymnnj1neqlJp71aW6exB/1qmWuAdjKof3pW+Q+PIL21C9sEI8iGGRB4l/yNsfZeLV/
         5mPczaaSlyQUh9aLerAn0MNcmvaZQ61GeH3R8cVZZuFI1KkKkuqnsJIz7Z/l3OyyBc/9
         nuP1eSknQf5ioc6ci5gRshwNgLs3wR9eoEH/E6U/8d410BKpZuY4VI52Jm4cIQWd/Rnq
         zdoA==
X-Forwarded-Encrypted: i=1; AJvYcCX0TnJz8gK3PGbnaGIWwh+7QJFCFB4R8G6PpuU6vqFShrB9mAdamAhI/BHI59RQ7f8u3q+YpVcUCQ5byw==@lists.linaro.org
X-Gm-Message-State: AOJu0YzHwO43q4NitSU2a4sD8XUYXXq6osWXeZsEygOVsjO04yd86Psl
	qlgRGG391U6d5MOL4jW2I/BGgRYkNuqSn457HENBjV9elweUBUE93ggBmTQMfYz5/MfgYA6rwum
	ky8BpCqb/VCymsQL/EhkxUpPD1DtMqA==
X-Gm-Gg: ATEYQzyDEzDJfBMDQHKUC3AE6n09uJfPbdJkAJD68NiGuu4t+POADS98/b/d1Jobgy1
	j07lM+7I1VOx9CwlU8drBE0IJlywCeFs2MqjV8pvU0jnYNBprCxKUlAus/pQiLv840GuSinJFww
	Lyj/rUyAkJ/RWG1IJ9ulmpoVrKCxf0/PFA/vPH9yVRVbOOkP4cGUrEWpooaCpC7yZqm35rM73fH
	y8mGNK9S/ZjDV2ecXVpp7+0nliQ2GZqf4PbEtJAvucl4nSrVBzTkKoRGXdctv4Kkde5j8UAR0HA
	//mBACYnF81pUT2AKXrzdZJkvsM/UE3tjnRGJlb0tASj8PGd121bRsyaBY+LFZrRTt2o
X-Received: by 2002:a05:6a21:458f:b0:398:791a:9caa with SMTP id
 adf61e73a8af0-398c5ec806amr1236794637.18.1773207780121; Tue, 10 Mar 2026
 22:43:00 -0700 (PDT)
MIME-Version: 1.0
References: <20260310200513.2162018-1-sanjayembedded@gmail.com>
In-Reply-To: <20260310200513.2162018-1-sanjayembedded@gmail.com>
From: Luka Gejak <lukagejak5@gmail.com>
Date: Wed, 11 Mar 2026 06:42:48 +0100
X-Gm-Features: AaiRm53yOPVigtTBWqUrHQSRYbaimfIQ_tKWwOGhPWuEPWqnKrEs0Ob5KWiVmFM
Message-ID: <CADRnA90=F5rRtWWJtSg7mA_QLzQa5Fzh3s2RzXDJtOOTiitzrQ@mail.gmail.com>
To: Sanjay Chitroda <sanjayembeddedse@gmail.com>
X-Spamd-Bar: -----
X-MailFrom: lukagejak5@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: 3GYCZLMJ4GLPGHEUONDNDUXCL7TCUQID
X-Message-ID-Hash: 3GYCZLMJ4GLPGHEUONDNDUXCL7TCUQID
X-Mailman-Approved-At: Wed, 11 Mar 2026 08:53:10 +0000
CC: jic23@kernel.org, m.tretter@pengutronix.de, mchehab@kernel.org, p.zabel@pengutronix.de, tiffany.lin@mediatek.com, andrew-ct.chen@mediatek.com, yunfei.dong@mediatek.com, matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, johan@kernel.org, elder@kernel.org, pure.logic@nexus-software.ie, dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org, kernel@pengutronix.de, kees@kernel.org, nabijaczleweli@nabijaczleweli.xyz, marcelo.schmitt1@gmail.com, maudspierings@gocontroll.com, hverkuil+cisco@kernel.org, ribalda@chromium.org, straube.linux@gmail.com, dan.carpenter@linaro.org, ethantidmore06@gmail.com, samasth.norway.ananda@oracle.com, karanja99erick@gmail.com, s9430939@naver.com, tglx@kernel.org, mingo@kernel.org, sun.jian.kdev@gmail.com, weibu@redadmin.org, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux
 .dev, skhan@linuxfoundation.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 0/7] drivers: Simplify cleanup paths using __free
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/3GYCZLMJ4GLPGHEUONDNDUXCL7TCUQID/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Rspamd-Queue-Id: 338E425FC54
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	R_SPF_ALLOW(-0.20)[+mx:c];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[41];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_TO(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,pengutronix.de,mediatek.com,gmail.com,collabora.com,nexus-software.ie,baylibre.com,analog.com,nabijaczleweli.xyz,gocontroll.com,chromium.org,linaro.org,oracle.com,naver.com,redadmin.org,vger.kernel.org,lists.infradead.org,lists.linaro.org,lists.linux,linuxfoundation.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	NEURAL_HAM(-0.00)[-0.987];
	FROM_NEQ_ENVFROM(0.00)[lukagejak5@gmail.com,greybus-dev-bounces@lists.linaro.org];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev,cisco];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	DKIM_TRACE(0.00)[gmail.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:email,linaro.org:email,mail.gmail.com:mid]
X-Rspamd-Action: no action

RGVhciBTYW5qYXksDQpXb3VsZCB5b3UgbWluZCBleHBsYWluaW5nIHdoeSB5b3UgcHV0IHNvIG1h
bnkgcGVvcGxlIGludG8gVE8gYW5kIENDDQpmaWVsZHMgd2hlbiBzZW5kaW5nIHBhdGNoIHNlcmll
cy4gWW91IHNob3VsZCBzdGljayB0byBtYWludGFpbmVycyBhbmQNCnJldmlld2VycyBmcm9tIG1h
aW50YWluZXJzIGZpbGUgYXMgb3RoZXJzIGNhbiBzdGlsbCBzZWUgaXQgb24gdGhlDQptYWlsaW5n
IGxpc3QodGhhdCdzIHdoeSB5b3UgQ0Mga2VybmVsIG1haWxpbmcubGlzdCByZWxhdGVkIGVtYWls
cykuDQpTaW5jZXJlbHkgTHVrYSBHZWphaw0KUC5TLiBJZiB5b3UgYXJlIGluY2x1ZGluZyBtZSBp
biBmdXJ0aGVyIGRpc2N1c3Npb25zIG9yIHBhdGNoIHNlcmllcw0KcGxlYXNlIHVzZSBsdWthLmdl
amFrQGxpbnV4LmRldiBpbnN0ZWFkIG9mIGx1a2FnZWphazVAZ21haWwuY29tLg0KVGhhbmtzIGlu
IGFkdmFuY2UuDQoNCk9uIFR1ZSwgTWFyIDEwLCAyMDI2IGF0IDk6MDXigK9QTSBTYW5qYXkgQ2hp
dHJvZGENCjxzYW5qYXllbWJlZGRlZHNlQGdtYWlsLmNvbT4gd3JvdGU6DQo+DQo+IEZyb206IFNh
bmpheSBDaGl0cm9kYSA8c2FuamF5ZW1iZWRkZWRzZUBnbWFpbC5jb20+DQo+DQo+IEhpIGFsbCwN
Cj4NCj4gVGhpcyBwYXRjaCBzZXJpZXMgcmVwbGFjZXMgbWFudWFsIGNsZWFudXAgYW5kIGV4cGxp
Y2l0IGtmcmVlKCkgY2FsbHMgd2l0aA0KPiB0aGUgX19mcmVlIGF0dHJpYnV0ZSBmcm9tIDxsaW51
eC9jbGVhbnVwLmg+LiBUaGlzIG1vZGVybml6ZXMgdGhlIG1lbW9yeQ0KPiBtYW5hZ2VtZW50IHN0
eWxlIGFuZCBzaW1wbGlmaWVzIGNvbW1vbiBlcnJvciBwYXRocyB3aXRob3V0IGFsdGVyaW5nIGFu
eQ0KPiBmdW5jdGlvbmFsIGJlaGF2aW9yLg0KPg0KPiBUaGUgX19mcmVlIGF0dHJpYnV0ZSBwcm92
aWRlcyBhdXRvbWF0aWMgc2NvcGUtYmFzZWQgY2xlYW51cCwgbWFraW5nDQo+IHJlc291cmNlIG1h
bmFnZW1lbnQgY2xlYXJlciBhbmQgcmVkdWNpbmcgdGhlIGNoYW5jZXMgb2YgbWlzc2luZyBjbGVh
bnVwDQo+IG9uIGVhcmx5IHJldHVybnMuDQo+DQo+IE5vIGZ1bmN0aW9uYWwgY2hhbmdlcyBhcmUg
aW50ZW5kZWQgaW4gdGhpcyBzZXJpZXMuDQo+DQo+IFRlc3Rpbmc6DQo+ICAgLSBDb21waWxlZCB3
aXRoIFc9MQ0KPiAgIC0gQnVpbGQtdGVzdGVkIG9uIGk4Nl82NA0KPg0KPiBCYXNlZCBvbjoNCj4g
ICA8bGludXgtdjcuMC1yYzI+DQo+DQo+IEZlZWwgZnJlZSB0byBzaGFyZSB5b3VyIHZhbHVhYmxl
IGlucHV0IGluIGNvbnRleHQgb2YgdGhlIGNsZWFudXAgQVBJLg0KPg0KPiBUaGFua3MsDQo+IFNh
bmpheSBDaGl0cm9kYQ0KPg0KPiBTYW5qYXkgQ2hpdHJvZGEgKDcpOg0KPiAgIHN0YWdpbmc6IGdy
ZXlidXM6IHNpbXBsaWZ5IGNsZWFudXAgdXNpbmcgX19mcmVlDQo+ICAgaWlvOiBzc3Bfc2Vuc29y
czogc2ltcGxpZnkgY2xlYW51cCB1c2luZyBfX2ZyZWUNCj4gICBpaW86IHN0X3NlbnNvcnM6IHNp
bXBsaWZ5IGNsZWFudXAgdXNpbmcgX19mcmVlDQo+ICAgbWVkaWE6IG1lZGlhdGVrOiB2Y29kZWM6
IHNpbXBsaWZ5IGNsZWFudXAgdXNpbmcgX19mcmVlDQo+ICAgbWVkaWE6IGNoaXBzLW1lZGlhOiBj
b2RhOiBzaW1wbGlmeSBjbGVhbnVwIHVzaW5nIF9fZnJlZQ0KPiAgIG1lZGlhOiBhbGxlZ3JvOiBz
aW1wbGlmeSBjbGVhbnVwIHVzaW5nIF9fZnJlZQ0KPiAgIHN0YWdpbmc6IHJ0bDg3MjNiczogc2lt
cGxpZnkgY2xlYW51cCB1c2luZyBfX2ZyZWUNCj4NCj4gIGRyaXZlcnMvaWlvL2NvbW1vbi9zc3Bf
c2Vuc29ycy9zc3Bfc3BpLmMgICAgICB8ICA5ICstDQo+ICAuLi4vaWlvL2NvbW1vbi9zdF9zZW5z
b3JzL3N0X3NlbnNvcnNfY29yZS5jICAgfCAgNyArLQ0KPiAgLi4uL21lZGlhL3BsYXRmb3JtL2Fs
bGVncm8tZHZ0L2FsbGVncm8tY29yZS5jIHwgOTUgKysrKystLS0tLS0tLS0tLS0tLQ0KPiAgLi4u
L3BsYXRmb3JtL2NoaXBzLW1lZGlhL2NvZGEvY29kYS1iaXQuYyAgICAgIHwgIDQgKy0NCj4gIC4u
Li9wbGF0Zm9ybS9jaGlwcy1tZWRpYS9jb2RhL2NvZGEtanBlZy5jICAgICB8IDM5ICsrKystLS0t
DQo+ICAuLi4vbWVkaWF0ZWsvdmNvZGVjL2NvbW1vbi9tdGtfdmNvZGVjX2RiZ2ZzLmMgfCAgMyAr
LQ0KPiAgZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvY2FtZXJhLmMgICAgICAgICAgICAgIHwgMjcg
KystLS0tDQo+ICBkcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9sb29wYmFjay5jICAgICAgICAgICAg
fCAzNSArKystLS0tLQ0KPiAgZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvcmF3LmMgICAgICAgICAg
ICAgICAgIHwgIDYgKy0NCj4gIC4uLi9zdGFnaW5nL3J0bDg3MjNicy9oYWwvcnRsODcyM2JfaGFs
X2luaXQuYyB8IDEzICstLQ0KPiAgZHJpdmVycy9zdGFnaW5nL3J0bDg3MjNicy9oYWwvc2Rpb19v
cHMuYyAgICAgIHwgMzcgKystLS0tLS0NCj4gIDExIGZpbGVzIGNoYW5nZWQsIDc4IGluc2VydGlv
bnMoKyksIDE5NyBkZWxldGlvbnMoLSkNCj4NCj4gLS0NCj4gMi4zNC4xDQo+DQpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpncmV5YnVzLWRldiBtYWlsaW5n
IGxpc3QgLS0gZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpUbyB1bnN1YnNjcmliZSBzZW5k
IGFuIGVtYWlsIHRvIGdyZXlidXMtZGV2LWxlYXZlQGxpc3RzLmxpbmFyby5vcmcK
