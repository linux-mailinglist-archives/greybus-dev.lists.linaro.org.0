Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id BBD35A022A
	for <lists+greybus-dev@lfdr.de>; Wed, 28 Aug 2019 14:49:37 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id E1C9D607CE
	for <lists+greybus-dev@lfdr.de>; Wed, 28 Aug 2019 12:49:36 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id D331060BDE; Wed, 28 Aug 2019 12:49:36 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
	ip-10-150-125-211.ec2.internal
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2 autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 7B9926162E;
	Wed, 28 Aug 2019 12:49:25 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 96965607CE
 for <greybus-dev@lists.linaro.org>; Wed, 28 Aug 2019 12:49:22 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 8428660BDE; Wed, 28 Aug 2019 12:49:22 +0000 (UTC)
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
 [209.85.221.67])
 by lists.linaro.org (Postfix) with ESMTPS id 7CDEA607CE
 for <greybus-dev@lists.linaro.org>; Wed, 28 Aug 2019 12:49:21 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id s18so2401609wrn.1
 for <greybus-dev@lists.linaro.org>; Wed, 28 Aug 2019 05:49:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=7leuT5w16CNYuFxUpc5aCG5ie2XhemLfDo5wWmNgZKU=;
 b=A3L1wL1O8/Yap6imib+h7r0YZIpii4D9uO1mSx+CyFpk6e0tEymEqUzsd3KgsI7bY4
 uYiv7OHth7rxoiWrMEqTrmOyt6abG1fpu/BSoj0oAhwS1jXdWNNwphDCdK2sy/0CZmZK
 L5lzwniPdMGK5PnbvgkobfyKfzo2PQwGSRK3CKIKuON7j+vLvFLzUpZpvxzDhG/m/S0g
 RGPwNab4dAFuUaOwCdwH8UHWjOdo4e/dQRKlT9LKU55lLmk1B4EvbsjcXGRHBniGSOLR
 Rh3mpcO9qkCHx5UxqqGFkZTEuBrohk6lBE2giZJghAMk966B/IRCkbH3YgiUS/eYbJYn
 eNtg==
X-Gm-Message-State: APjAAAXCifXj369apKpb2hLDLgfV57V9pzIWSuCzj/eXGlXsB0TGAUCH
 5ezYb/EHoaiwznuKp0C6SEkg3qL0
X-Google-Smtp-Source: APXvYqz08sIA4qCAkDSBu9lplw5abtVFPQ09qxgLfQkQBpdsmtXeUwOCclAo2J6LsC33EVNBEoVFYg==
X-Received: by 2002:adf:9d8b:: with SMTP id p11mr4253576wre.226.1566996560697; 
 Wed, 28 Aug 2019 05:49:20 -0700 (PDT)
Received: from arch-late (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
 by smtp.gmail.com with ESMTPSA id g26sm1777766wmh.32.2019.08.28.05.49.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2019 05:49:20 -0700 (PDT)
References: <20190828102859.13180-1-rui.silva@linaro.org>
 <20190828104726.GE13017@localhost> <20190828114210.GB31462@kroah.com>
User-agent: mu4e 1.2.0; emacs 27.0.50
From: Rui Miguel Silva <rui.silva@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
In-reply-to: <20190828114210.GB31462@kroah.com>
Date: Wed, 28 Aug 2019 13:49:16 +0100
Message-ID: <m3d0gpwj3n.fsf@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, greybus-dev@lists.linaro.org,
 Alex Elder <elder@kernel.org>, Johan Hovold <johan@kernel.org>,
 Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [greybus-dev] [PATCH] staging: greybus: fix more header includes
X-BeenThere: greybus-dev@lists.linaro.org
X-Mailman-Version: 2.1.16
Precedence: list
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
List-Unsubscribe: <https://lists.linaro.org/mailman/options/greybus-dev>,
 <mailto:greybus-dev-request@lists.linaro.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/greybus-dev/>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Subscribe: <https://lists.linaro.org/mailman/listinfo/greybus-dev>,
 <mailto:greybus-dev-request@lists.linaro.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: greybus-dev-bounces@lists.linaro.org
Sender: "greybus-dev" <greybus-dev-bounces@lists.linaro.org>
X-Virus-Scanned: ClamAV using ClamSMTP

SGksCk9uIFdlZCAyOCBBdWcgMjAxOSBhdCAxMjo0MiwgR3JlZyBLcm9haC1IYXJ0bWFuIHdyb3Rl
Ogo+IE9uIFdlZCwgQXVnIDI4LCAyMDE5IGF0IDEyOjQ3OjI2UE0gKzAyMDAsIEpvaGFuIEhvdm9s
ZCB3cm90ZToKPj4gT24gV2VkLCBBdWcgMjgsIDIwMTkgYXQgMTE6Mjg6NTlBTSArMDEwMCwgUnVp
IE1pZ3VlbCBTaWx2YSB3cm90ZToKPj4gPiBNb3JlIGhlYWRlcnMgbmVlZGVkIHRvIGJlIGZpeGVk
IHdoZW4gbW92aW5nIGdyZXlidXMgb3V0IG9mIHN0YWdpbmcgYW5kCj4+ID4gZW5hYmxpbmcgdGhl
IENPTVBJTEVfVEVTVCBvcHRpb24uCj4+ID4KPj4gPiBSZXBvcnRlZC1ieToga2J1aWxkIHRlc3Qg
cm9ib3QgPGxrcEBpbnRlbC5jb20+Cj4+ID4gU2lnbmVkLW9mZi1ieTogUnVpIE1pZ3VlbCBTaWx2
YSA8cnVpLnNpbHZhQGxpbmFyby5vcmc+Cj4+ID4gLS0tCj4+ID4gIGluY2x1ZGUvbGludXgvZ3Jl
eWJ1cy9vcGVyYXRpb24uaCB8IDEgKwo+PiA+ICBpbmNsdWRlL2xpbnV4L2dyZXlidXMvc3ZjLmgg
ICAgICAgfCAyICsrCj4+ID4gIDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCj4+ID4K
Pj4gPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9ncmV5YnVzL29wZXJhdGlvbi5oIGIvaW5j
bHVkZS9saW51eC9ncmV5YnVzL29wZXJhdGlvbi5oCj4+ID4gaW5kZXggOGNhODY0YmJhMjNlLi5i
ZmJjNTZkOGQ4NjMgMTAwNjQ0Cj4+ID4gLS0tIGEvaW5jbHVkZS9saW51eC9ncmV5YnVzL29wZXJh
dGlvbi5oCj4+ID4gKysrIGIvaW5jbHVkZS9saW51eC9ncmV5YnVzL29wZXJhdGlvbi5oCj4+ID4g
QEAgLTE1LDYgKzE1LDcgQEAKPj4gPiAgI2luY2x1ZGUgPGxpbnV4L3R5cGVzLmg+Cj4+ID4gICNp
bmNsdWRlIDxsaW51eC93b3JrcXVldWUuaD4KPj4gPgo+PiA+ICsjaW5jbHVkZSAiaGQuaCIKPj4K
Pj4gTm8gbmVlZCB0byBpbmNsdWRlIGhkLmgsIHlvdSBvbmx5IG5lZWQgYSBmb3J3YXJkIGRlY2xh
cmF0aW9uIG9mIHN0cnVjdAo+PiBnYl9ob3N0X2RldmljZS4KPj4KPj4gPiAgc3RydWN0IGdiX29w
ZXJhdGlvbjsKPj4gPgo+PiA+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L2dyZXlidXMvc3Zj
LmggYi9pbmNsdWRlL2xpbnV4L2dyZXlidXMvc3ZjLmgKPj4gPiBpbmRleCA1MDdmOGJkNGU0Yzgu
LjExYTg2NTA0YzQyOSAxMDA2NDQKPj4gPiAtLS0gYS9pbmNsdWRlL2xpbnV4L2dyZXlidXMvc3Zj
LmgKPj4gPiArKysgYi9pbmNsdWRlL2xpbnV4L2dyZXlidXMvc3ZjLmgKPj4gPiBAQCAtMTIsNiAr
MTIsOCBAQAo+PiA+ICAjaW5jbHVkZSA8bGludXgvdHlwZXMuaD4KPj4gPiAgI2luY2x1ZGUgPGxp
bnV4L2RldmljZS5oPgo+PiA+Cj4+ID4gKyNpbmNsdWRlICJncmV5YnVzX3Byb3RvY29scy5oIgo+
Pgo+PiBTYW1lIGhlcmUsIG5vIG5lZWQgdG8gaW5jbHVkZSBhbGwgdGhlIHByb3RvY29sIGRlZmlu
aXRpb25zIGZvciBzdHJ1Y3QKPj4gZ2Jfc3ZjX2wyX3RpbWVyX2NmZy4KPgo+IEkgYWdyZWUgd2l0
aCBKb2hhbiwganVzdCBmb3J3YXJkIGRlY2xhcmUgdGhlc2UgdGhpbmdzIGFuZCBhbGwgc2hvdWxk
IGJlCj4gZmluZSBhbmQgbXVjaCBzaW1wbGVyLgo+CgpBZ3JlZSBhbHNvLCB2MiBvdXQuCgotLS0K
Q2hlZXJzLAoJUnVpCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpncmV5YnVzLWRldiBtYWlsaW5nIGxpc3QKZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9y
ZwpodHRwczovL2xpc3RzLmxpbmFyby5vcmcvbWFpbG1hbi9saXN0aW5mby9ncmV5YnVzLWRldgo=
