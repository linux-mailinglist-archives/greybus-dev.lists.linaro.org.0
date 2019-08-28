Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id E41F1A05FE
	for <lists+greybus-dev@lfdr.de>; Wed, 28 Aug 2019 17:18:12 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 1650A617F1
	for <lists+greybus-dev@lfdr.de>; Wed, 28 Aug 2019 15:18:12 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 06A57617F5; Wed, 28 Aug 2019 15:18:12 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
	ip-10-150-125-211.ec2.internal
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id B3238617F2;
	Wed, 28 Aug 2019 15:17:56 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id B3E0F6088F
 for <greybus-dev@lists.linaro.org>; Wed, 28 Aug 2019 15:17:54 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id A74F2617F1; Wed, 28 Aug 2019 15:17:54 +0000 (UTC)
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
 [209.85.128.65])
 by lists.linaro.org (Postfix) with ESMTPS id 4CEF26088F
 for <greybus-dev@lists.linaro.org>; Wed, 28 Aug 2019 15:17:53 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id f72so457607wmf.5
 for <greybus-dev@lists.linaro.org>; Wed, 28 Aug 2019 08:17:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=WyiSw2nRgiZA25mEaN43/uhDjB007i6cQ+HN5h3ds3Q=;
 b=Tkw82bQANn7GRQ80FlRPYVhv+eIiUVx+UV0JTPmB2zVyIw2bgzmteoOQp47p/gjFM/
 dJPsmfrhS4lcZu7D25u3i+iWIdT1CSkW2FJEwXIYH6nULRk4wEgYmBNL7tVtehqZckbm
 2tvzqZX2MhyusdHwqaHhFQeIgUYzhA0a8uThWtW8TiXRxOEsDO3+S7FDShmeCOOwV5tV
 vAV6HPvfRxpTiNilqk0m5eugUFVDGUEqscmjWEfASBXlrKJq36enRpD3JcXuGgjHQ4qF
 S9nEpPh42Y7bWtaB1TsJ3SM2BjRl0OtA117+XAwEN3NgOPj1ZX11jPXSpu1ZnzAjdINF
 5Uyg==
X-Gm-Message-State: APjAAAW4rlDa4vrMyB2bJ8S4GDqH9O+1dnXHLcjswXdq9zQMUWXmQJp/
 r+WK/HJyH/WmC5nO1zU/8Bl+LqC9
X-Google-Smtp-Source: APXvYqwH4sFdRo7kgwhzZjXE6IwIvhdcDqB65nQeKnOyrXSctpcIpJTkmPN/rztPzYoZ/91YuhsSPw==
X-Received: by 2002:a1c:238d:: with SMTP id j135mr5754384wmj.39.1567005472383; 
 Wed, 28 Aug 2019 08:17:52 -0700 (PDT)
Received: from arch-late (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
 by smtp.gmail.com with ESMTPSA id r190sm4158890wmf.0.2019.08.28.08.17.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2019 08:17:51 -0700 (PDT)
References: <20190827205917.8308-1-rui.silva@linaro.org>
 <20190828083519.GA29752@kroah.com>
 <0b740eb9-5ef4-8346-aa78-6b07bb060e7b@infradead.org>
User-agent: mu4e 1.2.0; emacs 27.0.50
From: Rui Miguel Silva <rui.silva@linaro.org>
To: Randy Dunlap <rdunlap@infradead.org>
In-reply-to: <0b740eb9-5ef4-8346-aa78-6b07bb060e7b@infradead.org>
Date: Wed, 28 Aug 2019 16:17:50 +0100
Message-ID: <m3blw9wc81.fsf@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, Alex Elder <elder@kernel.org>,
 Johan Hovold <johan@kernel.org>, greybus-dev@lists.linaro.org,
 Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [greybus-dev] [PATCH v2] staging: greybus: add missing includes
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

SGkgUmFuZHksCk9uIFdlZCAyOCBBdWcgMjAxOSBhdCAxNjowOSwgUmFuZHkgRHVubGFwIHdyb3Rl
Ogo+IE9uIDgvMjgvMTkgMTozNSBBTSwgR3JlZyBLcm9haC1IYXJ0bWFuIHdyb3RlOgo+PiBPbiBU
dWUsIEF1ZyAyNywgMjAxOSBhdCAwOTo1OToxN1BNICswMTAwLCBSdWkgTWlndWVsIFNpbHZhIHdy
b3RlOgo+Pj4gQmVmb3JlIG1vdmluZyBncmV5YnVzIGNvcmUgb3V0IG9mIHN0YWdpbmcgYW5kIG1v
dmluZyBoZWFkZXIgZmlsZXMgdG8KPj4+IGluY2x1ZGUvbGludXggc29tZSBncmV5YnVzIGhlYWRl
ciBmaWxlcyB3ZXJlIG1pc3NpbmcgdGhlIG5lY2Vzc2FyeQo+Pj4gaW5jbHVkZXMuIFRoaXMgd291
bGQgdHJpZ2dlciBjb21waWxhdGlvbiBmYWlsbHVyZXMgd2l0aCBzb21lIGV4YW1wbGUKPj4+IGVy
cm9ycyBsb2dnZWQgYmVsbG93IGZvciB3aXRoIENPTkZJR19LRVJORUxfSEVBREVSX1RFU1Q9eS4K
Pj4+Cj4+PiBTbywgYWRkIHRoZSBuZWNlc3NhcnkgaGVhZGVycyB0byBjb21waWxlIGNsZWFuIGJl
Zm9yZSByZWxvY2F0aW5nIHRoZQo+Pj4gaGVhZGVyIGZpbGVzLgo+Pj4KPj4+IC4vaW5jbHVkZS9s
aW51eC9ncmV5YnVzL2hkLmg6MjM6NTA6IGVycm9yOiB1bmtub3duIHR5cGUgbmFtZSAndTE2Jwo+
Pj4gICBpbnQgKCpjcG9ydF9kaXNhYmxlKShzdHJ1Y3QgZ2JfaG9zdF9kZXZpY2UgKmhkLCB1MTYg
Y3BvcnRfaWQpOyBefn4KPj4+IC4vaW5jbHVkZS9saW51eC9ncmV5YnVzL2dyZXlidXNfcHJvdG9j
b2xzLmg6MTMxNDoyOiBlcnJvcjogdW5rbm93biB0eXBlIG5hbWUgJ19fdTgnCj4+PiAgIF9fdTgg
ZGF0YVswXTsKPj4+ICAgXn5+fgo+Pj4gLi9pbmNsdWRlL2xpbnV4L2dyZXlidXMvaGQuaDoyNDo1
MjogZXJyb3I6IHVua25vd24gdHlwZSBuYW1lICd1MTYnCj4+PiAgIGludCAoKmNwb3J0X2Nvbm5l
Y3RlZCkoc3RydWN0IGdiX2hvc3RfZGV2aWNlICpoZCwgdTE2IGNwb3J0X2lkKTsgXn5+Cj4+PiAu
L2luY2x1ZGUvbGludXgvZ3JleWJ1cy9oZC5oOjI1OjQ4OiBlcnJvcjogdW5rbm93biB0eXBlIG5h
bWUgJ3UxNicKPj4+ICAgaW50ICgqY3BvcnRfZmx1c2gpKHN0cnVjdCBnYl9ob3N0X2RldmljZSAq
aGQsIHUxNiBjcG9ydF9pZCk7IF5+fgo+Pj4gLi9pbmNsdWRlL2xpbnV4L2dyZXlidXMvaGQuaDoy
Njo1MTogZXJyb3I6IHVua25vd24gdHlwZSBuYW1lICd1MTYnCj4+PiAgIGludCAoKmNwb3J0X3No
dXRkb3duKShzdHJ1Y3QgZ2JfaG9zdF9kZXZpY2UgKmhkLCB1MTYgY3BvcnRfaWQsIF5+fgo+Pj4g
Li9pbmNsdWRlL2xpbnV4L2dyZXlidXMvaGQuaDoyNzo1OiBlcnJvcjogdW5rbm93biB0eXBlIG5h
bWUgJ3U4Jwo+Pj4gdTggcGhhc2UsIHVuc2lnbmVkIGludCB0aW1lb3V0KTsKPj4+ICAgICAgXn4K
Pj4+IC4vaW5jbHVkZS9saW51eC9ncmV5YnVzL2hkLmg6Mjg6NTA6IGVycm9yOiB1bmtub3duIHR5
cGUgbmFtZSAndTE2Jwo+Pj4gICBpbnQgKCpjcG9ydF9xdWllc2NlKShzdHJ1Y3QgZ2JfaG9zdF9k
ZXZpY2UgKmhkLCB1MTYgY3BvcnRfaWQsIF5+fgo+Pj4gLi9pbmNsdWRlL2xpbnV4L2dyZXlidXMv
aGQuaDoyOTo1OiBlcnJvcjogdW5rbm93biB0eXBlIG5hbWUgJ3NpemVfdCcKPj4+ICAgICAgc2l6
ZV90IHBlZXJfc3BhY2UsIHVuc2lnbmVkIGludCB0aW1lb3V0KTsKPj4+ICAgICAgXn5+fn5+Cj4+
PiAuL2luY2x1ZGUvbGludXgvZ3JleWJ1cy9oZC5oOjI5OjU6IG5vdGU6ICdzaXplX3QnIGlzIGRl
ZmluZWQgaW4gaGVhZGVyICc8c3RkZGVmLmg+JzsgZGlkIHlvdSBmb3JnZXQgdG8gJyNpbmNsdWRl
IDxzdGRkZWYuaD4nPwo+Pj4gLi9pbmNsdWRlL2xpbnV4L2dyZXlidXMvaGQuaDoxOjE6Cj4+PiAr
I2luY2x1ZGUgPHN0ZGRlZi5oPgo+Pj4gIC8qIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwt
Mi4wICovCj4+PiAuL2luY2x1ZGUvbGludXgvZ3JleWJ1cy9oZC5oOjI5OjU6Cj4+PiAgICAgIHNp
emVfdCBwZWVyX3NwYWNlLCB1bnNpZ25lZCBpbnQgdGltZW91dCk7Cj4+PiAgICAgIF5+fn5+fgo+
Pj4gLi9pbmNsdWRlL2xpbnV4L2dyZXlidXMvaGQuaDozMDo0ODogZXJyb3I6IHVua25vd24gdHlw
ZSBuYW1lICd1MTYnCj4+PiAgIGludCAoKmNwb3J0X2NsZWFyKShzdHJ1Y3QgZ2JfaG9zdF9kZXZp
Y2UgKmhkLCB1MTYgY3BvcnRfaWQpOyBefn4KPj4+IC4vaW5jbHVkZS9saW51eC9ncmV5YnVzL2hk
Lmg6MzI6NDk6IGVycm9yOiB1bmtub3duIHR5cGUgbmFtZSAndTE2Jwo+Pj4gICBpbnQgKCptZXNz
YWdlX3NlbmQpKHN0cnVjdCBnYl9ob3N0X2RldmljZSAqaGQsIHUxNiBkZXN0X2Nwb3J0X2lkLCBe
fn4KPj4+IC4vaW5jbHVkZS9saW51eC9ncmV5YnVzL2hkLmg6MzM6MzI6IGVycm9yOiB1bmtub3du
IHR5cGUgbmFtZSAnZ2ZwX3QnCj4+PiBzdHJ1Y3QgZ2JfbWVzc2FnZSAqbWVzc2FnZSwgZ2ZwX3Qg
Z2ZwX21hc2spOyBefn5+fgo+Pj4gLi9pbmNsdWRlL2xpbnV4L2dyZXlidXMvaGQuaDozNTo1NTog
ZXJyb3I6IHVua25vd24gdHlwZSBuYW1lICd1MTYnCj4+PiAgIGludCAoKmxhdGVuY3lfdGFnX2Vu
YWJsZSkoc3RydWN0IGdiX2hvc3RfZGV2aWNlICpoZCwgdTE2IGNwb3J0X2lkKTsKPj4+Cj4+PiBS
ZXBvcnRlZC1ieToga2J1aWxkIHRlc3Qgcm9ib3QgPGxrcEBpbnRlbC5jb20+Cj4+PiBSZXBvcnRl
ZC1ieTogR2FvIFhpYW5nIDxoc2lhbmdrYW9AYW9sLmNvbT4KPj4+IFNpZ25lZC1vZmYtYnk6IFJ1
aSBNaWd1ZWwgU2lsdmEgPHJ1aS5zaWx2YUBsaW5hcm8ub3JnPgo+Pj4gQWNrZWQtYnk6IEFsZXgg
RWxkZXIgPGVsZGVyQGtlcm5lbC5vcmc+Cj4+PiAtLS0KPj4+Cj4+PiB2MS0+djI6Cj4+PiBsa3BA
aW50ZWw6Cj4+PiAgIC0gYWRkZWQgZ3JleWJ1c19wcm90b2NvbHMuaCBpbmNsdWRlIHRvIHN2Yy5o
IGhlYWRlcgo+Pj4gQWxleCBFbGRlcjoKPj4+ICAgLSByZW1vdmUgZXh0cmEgbGluZSBpbiBvcGVy
YXRpb24uaAo+Pj4KPj4+IExvb2tzIGxpa2UgbGtwIGNhbiBub3cgZmluZCBtaXNzaW5nIGhlYWRl
cnMgdGhhdCB3ZSBjYW4gbm90IDopLAo+Pj4gaXQgbXVzdCBiZSB0aGUgY29uZmlnLiBidXQgaXQg
aXMgcmlnaHQuCj4+Pgo+Pj4gR3JlZyBwbGVhc2Ugbm90ZSB0aGUgbmV3IGluY2x1ZGUgaW4gc3Zj
LmggbWF5IG5lZWQgdG8gYmUgY2hhbmdlZAo+Pj4gd2hlbiBtb3ZpbmcgaGVhZGVycyB0byBpbmNs
dWRlL2xpbnV4Cj4+Cj4+IEFzIGEgdmVyc2lvbiBvZiB5b3VyIGZpcnN0IHBhdGNoIGlzIGFscmVh
ZHkgaW4gbXkgdHJlZSwgdGhpcyBvbmUgd2lsbAo+PiBub3QgYXBwbHkgOigKPj4KPj4gQ2FuIHlv
dSBqdXN0IHNlbmQgYSBmaXgtdXAgcGF0Y2ggYWdhaW5zdCBteSBzdGFnaW5nLW5leHQgYnJhbmNo
IGluc3RlYWQ/Cj4+Cj4+IHRoYW5rcywKPj4KPj4gZ3JlZyBrLWgKPj4gX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPj4gZGV2ZWwgbWFpbGluZyBsaXN0Cj4+
IGRldmVsQGxpbnV4ZHJpdmVycHJvamVjdC5vcmcKPj4gaHR0cDovL2RyaXZlcmRldi5saW51eGRy
aXZlcnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8vZHJpdmVyZGV2LWRldmVsCj4+Cj4KPiBs
aW51eC1uZXh0IG9mIDIwMTkwODI4IGhhcyB0aGVzZSB3YXJuaW5nczoKPgo+IC4vLi4vaW5jbHVk
ZS9saW51eC9ncmV5YnVzL3N2Yy5oOjkxOjE4OiB3YXJuaW5nOiAnc3RydWN0IGdiX3N2Y19sMl90
aW1lcl9jZmcnIGRlY2xhcmVkIGluc2lkZSBwYXJhbWV0ZXIgbGlzdCB3aWxsIG5vdCBiZSB2aXNp
YmxlIG91dHNpZGUgb2YgdGhpcyBkZWZpbml0aW9uIG9yIGRlY2xhcmF0aW9uCj4gLi8uLi9pbmNs
dWRlL2xpbnV4L2dyZXlidXMvb3BlcmF0aW9uLmg6MTg4OjM0OiB3YXJuaW5nOiAnc3RydWN0IGdi
X2hvc3RfZGV2aWNlJyBkZWNsYXJlZCBpbnNpZGUgcGFyYW1ldGVyIGxpc3Qgd2lsbCBub3QgYmUg
dmlzaWJsZSBvdXRzaWRlIG9mIHRoaXMgZGVmaW5pdGlvbiBvciBkZWNsYXJhdGlvbgo+Cj4KPiBB
cmUgdGhleSBmaXhlZCBieSBzb21lIG9mIHRoZXNlIHBhdGNoZXM/Cj4KClllcywgdGhpcyBbMF0g
c2hvdWxkIGZpeCBpdC4KCi0tLQpDaGVlcnMsCglSdWkKClswXTogaHR0cDovL2RyaXZlcmRldi5s
aW51eGRyaXZlcnByb2plY3Qub3JnL3BpcGVybWFpbC9kcml2ZXJkZXYtZGV2ZWwvMjAxOS1BdWd1
c3QvMTM4MDE2Lmh0bWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZ3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0CmdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5v
cmcKaHR0cHM6Ly9saXN0cy5saW5hcm8ub3JnL21haWxtYW4vbGlzdGluZm8vZ3JleWJ1cy1kZXYK
