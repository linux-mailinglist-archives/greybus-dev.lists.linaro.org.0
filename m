Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FE5823CB08
	for <lists+greybus-dev@lfdr.de>; Wed,  5 Aug 2020 15:36:07 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 53CF16604C
	for <lists+greybus-dev@lfdr.de>; Wed,  5 Aug 2020 13:36:06 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 4205466027; Wed,  5 Aug 2020 13:36:06 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE autolearn=disabled
	version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id E21016192C;
	Wed,  5 Aug 2020 13:35:50 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 595BF60631
 for <greybus-dev@lists.linaro.org>; Wed,  5 Aug 2020 13:35:48 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 4D95D6604B; Wed,  5 Aug 2020 13:35:48 +0000 (UTC)
Received: from mail-il1-f195.google.com (mail-il1-f195.google.com
 [209.85.166.195])
 by lists.linaro.org (Postfix) with ESMTPS id 4B19360CFC
 for <greybus-dev@lists.linaro.org>; Wed,  5 Aug 2020 13:35:18 +0000 (UTC)
Received: by mail-il1-f195.google.com with SMTP id e16so2665367ilc.12
 for <greybus-dev@lists.linaro.org>; Wed, 05 Aug 2020 06:35:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UQ34G3pqxLqTbbjhaVdGSStK5ucy52wKTiNEc0i7lhs=;
 b=UJRRftCIEaJRzizxn3E1S9sPl7krt8aXGYDIM0FZgO9XpRcmFewtHwSy7I5L82zA9o
 n4ors2OzUKgEcpfhPFjYm3vUFQtASsakcCAeBUCftmwbM4YaIPIYd4iCinwa9pbmHYTP
 a7IVoSOwXBksuLe3aBqhAGFZ8fs3EFUdpeMTFaJvlCJb7S4sFK8B1hZXcnaHd8euRCAT
 KlGIwHVy1yvJSeDVh5TYd7fGEyWa0t1Y98YbS00UOL0qb4uk3lO0ITGlQPWJWSg85SzT
 23Soif9JPOO1HTneKJYbq5QkStw++KqDjc0QOCUT21F2d6pywXs2vrS/d2Z8dR6dsOiW
 JnXQ==
X-Gm-Message-State: AOAM530R2i2NHRYIJTwnq/NH3OBBDc55DqbGKTMSzlIs40uSuAPZMXlB
 Gu4EyiJQnLeddYFojMIEucvraA==
X-Google-Smtp-Source: ABdhPJx+IM6LnPvTZbXFzHv/G8qW8EUFY/JlJTEKddie4rWI6431YxeTK9FVVZ8BKUQTn+5tLLxi8Q==
X-Received: by 2002:a92:1b5b:: with SMTP id b88mr4070447ilb.104.1596634517699; 
 Wed, 05 Aug 2020 06:35:17 -0700 (PDT)
Received: from [172.22.22.26] (c-73-185-129-58.hsd1.mn.comcast.net.
 [73.185.129.58])
 by smtp.googlemail.com with ESMTPSA id j81sm1068864iof.13.2020.08.05.06.35.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Aug 2020 06:35:16 -0700 (PDT)
To: Colin Ian King <colin.king@canonical.com>, Johan Hovold
 <johan@kernel.org>, Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Vaibhav Agarwal <vaibhav.sr@gmail.com>, Mark Greer <mgreer@animalcreek.com>,
 greybus-dev@lists.linaro.org,
 "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>
References: <7da6363c-9423-2b9f-029a-395cc8a932d7@canonical.com>
From: Alex Elder <elder@ieee.org>
Message-ID: <07ad3809-de73-9a66-0e4f-3a49f395a98a@ieee.org>
Date: Wed, 5 Aug 2020 08:35:15 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <7da6363c-9423-2b9f-029a-395cc8a932d7@canonical.com>
Content-Language: en-US
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [greybus-dev] issue with uninitialized value used in a
 comparison in gbcodec_mixer_dapm_ctl_put
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

T24gNy8zMC8yMCAxMTowMiBBTSwgQ29saW4gSWFuIEtpbmcgd3JvdGU6Cj4gSGksCj4gCj4gU3Rh
dGljIGFuYWx5c2lzIHdpdGggQ292ZXJpdHkgaGFzIGRldGVjdGVkIGFuIHVuaW5pdGlhbGl6ZWQg
dmFsdWUgYmVpbmcKPiB1c2VkIGluIGEgY29tcGFyaXNvbi4gIFRoZSBlcnJvciB3YXMgZGV0ZWN0
ZWQgb24gYSByZWNlbnQgY2hhbmdlIHRvCj4gZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvYXVkaW9f
dG9wb2xvZ3kuYyBob3dldmVyIHRoZSBpc3N1ZSBhY3R1YWxseQo+IGRhdGVzIGJhY2sgdG8gdGhl
IG9yaWdpbmFsIGNvbW1pdDoKPiAKPiBjb21taXQgNjMzOWQyMzIyYzQ3ZjRiOGViYWJmOWRhZjAx
MzAzMjhlZDcyNjQ4Ygo+IEF1dGhvcjogVmFpYmhhdiBBZ2Fyd2FsIDx2YWliaGF2LmFnYXJ3YWxA
bGluYXJvLm9yZz4KPiBEYXRlOiAgIFdlZCBKYW4gMTMgMTQ6MDc6NTEgMjAxNiAtMDcwMAo+IAo+
ICAgICBncmV5YnVzOiBhdWRpbzogQWRkIHRvcG9sb2d5IHBhcnNlciBmb3IgR0IgY29kZWMKPiAK
PiBUaGUgYW5hbHlzaXMgaXMgYXMgZm9sbG93czoKPiAKPiA0MjUgc3RhdGljIGludCBnYmNvZGVj
X21peGVyX2RhcG1fY3RsX3B1dChzdHJ1Y3Qgc25kX2tjb250cm9sICprY29udHJvbCwKPiA0MjYg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBzbmRfY3RsX2VsZW1f
dmFsdWUKPiAqdWNvbnRyb2wpCj4gNDI3IHsKPiA0MjggICAgICAgIGludCByZXQsIHdpLCBtYXgs
IGNvbm5lY3Q7Cj4gNDI5ICAgICAgICB1bnNpZ25lZCBpbnQgbWFzaywgdmFsOwo+IDQzMCAgICAg
ICAgc3RydWN0IGdiX2F1ZGlvX2N0bF9lbGVtX2luZm8gKmluZm87Cj4gNDMxICAgICAgICBzdHJ1
Y3QgZ2JhdWRpb19jdGxfcHZ0ICpkYXRhOwo+IAo+ICAgIDEuIHZhcl9kZWNsOiBEZWNsYXJpbmcg
dmFyaWFibGUgZ2J2YWx1ZSB3aXRob3V0IGluaXRpYWxpemVyLgo+IDQzMiAgICAgICAgc3RydWN0
IGdiX2F1ZGlvX2N0bF9lbGVtX3ZhbHVlIGdidmFsdWU7Cj4gNDMzICAgICAgICBzdHJ1Y3QgZ2Jh
dWRpb19tb2R1bGVfaW5mbyAqbW9kdWxlOwo+IDQzNCAgICAgICAgc3RydWN0IHNuZF9zb2NfZGFw
bV93aWRnZXRfbGlzdCAqd2xpc3QgPQo+IHNuZF9rY29udHJvbF9jaGlwKGtjb250cm9sKTsKPiA0
MzUgICAgICAgIHN0cnVjdCBzbmRfc29jX2RhcG1fd2lkZ2V0ICp3aWRnZXQgPSB3bGlzdC0+d2lk
Z2V0c1swXTsKPiA0MzYgICAgICAgIHN0cnVjdCBkZXZpY2UgKmNvZGVjX2RldiA9IHdpZGdldC0+
ZGFwbS0+ZGV2Owo+IDQzNyAgICAgICAgc3RydWN0IGdiYXVkaW9fY29kZWNfaW5mbyAqZ2IgPSBk
ZXZfZ2V0X2RydmRhdGEoY29kZWNfZGV2KTsKPiA0MzggICAgICAgIHN0cnVjdCBnYl9idW5kbGUg
KmJ1bmRsZTsKPiA0MzkKPiAKPiAgICAyLiBDb25kaXRpb24gMCAvKiBfX2J1aWx0aW5fdHlwZXNf
Y29tcGF0aWJsZV9wKCkgKi8sIHRha2luZyBmYWxzZSBicmFuY2guCj4gICAgMy4gQ29uZGl0aW9u
IDEgLyogX19idWlsdGluX3R5cGVzX2NvbXBhdGlibGVfcCgpICovLCB0YWtpbmcgdHJ1ZSBicmFu
Y2guCj4gICAgNC4gRmFsbGluZyB0aHJvdWdoIHRvIGVuZCBvZiBpZiBzdGF0ZW1lbnQuCj4gICAg
NS4gQ29uZGl0aW9uICEhYnJhbmNoLCB0YWtpbmcgZmFsc2UgYnJhbmNoLgo+ICAgIDYuIENvbmRp
dGlvbiAoey4uLjsgISFicmFuY2g7fSksIHRha2luZyBmYWxzZSBicmFuY2guCj4gCj4gNDQwICAg
ICAgICBkZXZfZGJnKGNvZGVjX2RldiwgIkVudGVyZWQgJXM6JXNcbiIsIF9fZnVuY19fLAo+IGtj
b250cm9sLT5pZC5uYW1lKTsKPiA0NDEgICAgICAgIG1vZHVsZSA9IGZpbmRfZ2JfbW9kdWxlKGdi
LCBrY29udHJvbC0+aWQubmFtZSk7Cj4gCj4gICAgNy4gQ29uZGl0aW9uICFtb2R1bGUsIHRha2lu
ZyBmYWxzZSBicmFuY2guCj4gNDQyICAgICAgICBpZiAoIW1vZHVsZSkKPiA0NDMgICAgICAgICAg
ICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4gNDQ0Cj4gNDQ1ICAgICAgICBkYXRhID0gKHN0cnVjdCBn
YmF1ZGlvX2N0bF9wdnQgKilrY29udHJvbC0+cHJpdmF0ZV92YWx1ZTsKPiA0NDYgICAgICAgIGlu
Zm8gPSAoc3RydWN0IGdiX2F1ZGlvX2N0bF9lbGVtX2luZm8gKilkYXRhLT5pbmZvOwo+IAo+ICAg
IDguIENvbmRpdGlvbiAwIC8qICEhKCFfX2J1aWx0aW5fdHlwZXNfY29tcGF0aWJsZV9wKCkgJiYK
PiAhX19idWlsdGluX3R5cGVzX2NvbXBhdGlibGVfcCgpKSAqLywgdGFraW5nIGZhbHNlIGJyYW5j
aC4KPiA0NDcgICAgICAgIGJ1bmRsZSA9IHRvX2diX2J1bmRsZShtb2R1bGUtPmRldik7Cj4gNDQ4
Cj4gCj4gICAgOS4gQ29uZGl0aW9uIGRhdGEtPnZjb3VudCA9PSAyLCB0YWtpbmcgdHJ1ZSBicmFu
Y2guCj4gNDQ5ICAgICAgICBpZiAoZGF0YS0+dmNvdW50ID09IDIpCj4gNDUwICAgICAgICAgICAg
ICAgIGRldl93YXJuKHdpZGdldC0+ZGFwbS0+ZGV2LAo+IDQ1MSAgICAgICAgICAgICAgICAgICAg
ICAgICAiR0I6IENvbnRyb2wgJyVzJyBpcyBzdGVyZW8sIHdoaWNoIGlzIG5vdAo+IHN1cHBvcnRl
ZFxuIiwKPiA0NTIgICAgICAgICAgICAgICAgICAgICAgICAga2NvbnRyb2wtPmlkLm5hbWUpOwo+
IDQ1Mwo+IDQ1NCAgICAgICAgbWF4ID0gbGUzMl90b19jcHUoaW5mby0+dmFsdWUuaW50ZWdlci5t
YXgpOwo+IDQ1NSAgICAgICAgbWFzayA9ICgxIDw8IGZscyhtYXgpKSAtIDE7Cj4gNDU2ICAgICAg
ICB2YWwgPSB1Y29udHJvbC0+dmFsdWUuaW50ZWdlci52YWx1ZVswXSAmIG1hc2s7Cj4gCj4gICAg
MTAuIENvbmRpdGlvbiAhIXZhbCwgdGFraW5nIHRydWUgYnJhbmNoLgo+IDQ1NyAgICAgICAgY29u
bmVjdCA9ICEhdmFsOwo+IDQ1OAo+IDQ1OSAgICAgICAgLyogdXBkYXRlIHVjb250cm9sICovCj4g
Cj4gVW5pbml0aWFsaXplZCBzY2FsYXIgdmFyaWFibGUgKFVOSU5JVCkKPiAgICAxMS4gdW5pbml0
X3VzZTogVXNpbmcgdW5pbml0aWFsaXplZCB2YWx1ZSBnYnZhbHVlLnZhbHVlLmludGVnZXJfdmFs
dWVbMF0uCj4gNDYwICAgICAgICBpZiAoZ2J2YWx1ZS52YWx1ZS5pbnRlZ2VyX3ZhbHVlWzBdICE9
IHZhbCkgewo+IAo+IFRoZSBnYnZhbHVlLnZhbHVlLmludGVnZXJfdmFsdWVbMF0gcmVhZCBpcyBi
b2d1cyBzaW5jZSBnYnZhbHVlIHdhcwo+IGRlY2xhcmVkIG9uIHRoZSBzdGFjayBidXQgd2FzIG5v
dCBpbml0aWFsaXplZC4gIFRoZXJlIHNlZW1zIHRvIGJlIG5vCj4gd2hlcmUgdGhhdCBzZXRzIHRo
aXMgZGF0YS4gSSdtIGFzc3VtaW5nIG1vc3Qgb2YgdGhlIHRpbWUgdGhhdCB0aGUKPiBjb21wYXJp
c29uIHdvcmtzIGJlY2F1c2UgdGhlIGdhcmJhZ2UgdmFsdWUgaXMgZGlmZmVyZW50IGZyb20gdmFs
IGFuZCBzbwo+IHRoZSBjb2RlIGluIHRoZSBpZiBzdGFuemEgaXMgZXhlY3V0ZWQuCj4gCj4gQW55
aG93LCBJJ20gdW5zdXJlIHdoYXQgdGhlIG9yaWdpbmFsIGludGVudCBvZiB0aGUgY29kZSB3YXMs
IHNvIEkndmUgbm90Cj4gYXR0ZW1wdGVkIHRvIGZpeCB0aGlzLgoKSSB0aGluayB0aGUgZml4IGlz
IHRvIGFkZCBhIGNhbGwgdG8gdGhpczoKCiAgICAgICAgcmV0ID0gZ2JfYXVkaW9fZ2JfZ2V0X2Nv
bnRyb2wobW9kdWxlLT5tZ210X2Nvbm5lY3Rpb24sIGRhdGEtPmN0bF9pZCwKICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBHQl9BVURJT19JTlZBTElEX0lOREVYLCAmZ2J2YWx1
ZSk7CgpiZWZvcmUgdGhlIGZpZWxkIHdpdGhpbiBnYnZhbHVlIGlzIHVzZWQuCgpMb29raW5nIGF0
IGdiY29kZWNfbWl4ZXJfZGFwbV9jdGxfZ2V0KCkgZGVmaW5lZCBqdXN0IGFib3ZlIHRoYXQsIGl0
CnNlZW1zIHRoYXQgdGhlIGNhbGwgdG8gZ2JfYXVkaW9fZ2JfZ2V0X2NvbnRyb2woKSBzaG91bGQg
YmUgcHJlY2VkZWQKYnkgYSBjYWxsIHRvIGdiX3BtX3J1bnRpbWVfZ2V0X3N5bmMoKS4gIEFuZCBn
aXZlbiB0aGF0IGR1cGxpY2F0aW9uLApJIHN1Z2dlc3QgdGhpcyBjYWxsIGFuZCB0aGUgUE0gcnVu
dGltZSB3cmFwcGVyIGZ1bmN0aW9ucyBzaG91bGQgYmUKcGxhY2VkIGluIGEgbmV3IGhlbHBlciBm
dW5jdGlvbi4KCkkga25vdyB0aGF0IFZhaWJoYXYgc2FpZCBoZSB3b3VsZCBiZSBmaXhpbmcgdGhp
cywgc28gSSBndWVzcyBteQpjb21tZW50cyBhcmUgZGlyZWN0ZWQgYXQgaGltLiAgVGhhbmtzIGZv
ciBzZW5kaW5nIHRoZSBwYXRjaCBDb2xpbi4KCgkJCQkJLUFsZXgKCgo+IENvbGluCj4gCj4gCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpncmV5YnVzLWRl
diBtYWlsaW5nIGxpc3QKZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpodHRwczovL2xpc3Rz
LmxpbmFyby5vcmcvbWFpbG1hbi9saXN0aW5mby9ncmV5YnVzLWRldgo=
