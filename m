Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 39DAC2E8F63
	for <lists+greybus-dev@lfdr.de>; Mon,  4 Jan 2021 03:19:10 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id E528260DD0
	for <lists+greybus-dev@lfdr.de>; Mon,  4 Jan 2021 02:19:08 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id D561361082; Mon,  4 Jan 2021 02:19:08 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE autolearn=disabled
	version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 9BF5661839;
	Mon,  4 Jan 2021 02:18:54 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 8DCCF608C3
 for <greybus-dev@lists.linaro.org>; Mon,  4 Jan 2021 02:18:51 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 6DEE461082; Mon,  4 Jan 2021 02:18:51 +0000 (UTC)
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com
 [209.85.166.45])
 by lists.linaro.org (Postfix) with ESMTPS id 49059608C3
 for <greybus-dev@lists.linaro.org>; Mon,  4 Jan 2021 02:18:50 +0000 (UTC)
Received: by mail-io1-f45.google.com with SMTP id d9so23722060iob.6
 for <greybus-dev@lists.linaro.org>; Sun, 03 Jan 2021 18:18:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=T3zwU8+9vJsSFH0cocgNEnbGtFiXyYPpUvK1pfeu9Jc=;
 b=ODJO12CmvXFWEQxnpuf9FDdu3E2qrWOo+c0LujWHZB2k9660Y0mt3/eQSVXpSWSHnP
 QwCatWpEWshsgbefHPQKkYdXbWwIIbwevHo90S8yhtkh1W/hzOsu06ssM8IJKtAvtrgm
 8hzVItsBu7o5MzhM0Cp6U1yvhrt6DFYMaI7rRJD/u3xg3e0/GqioMNBtWJWPnOlV2mdH
 VoCgU8NObsgqEWHekOY9qw5OFDw9xLQ/5UsYL0f8Yas/BL93p6LJhUnhvtXKyThB6KlU
 oxLAYngUBLlvPgom3znCAGZ+00ugJJzdxAdUVRmMuro/qSvCw/EkRDahN9J6y7/TEyA2
 /E0Q==
X-Gm-Message-State: AOAM531K6ui+n16BUCTy/f04C1RMcbbTcuCJ0yGCF0/B89TM/0fkUMIb
 D8BorMJv6TgXYc36UALjC0D+Yw==
X-Google-Smtp-Source: ABdhPJwg0Hrrg9PhM5yO6+Fu8jRBIBmLhEazmMJKlBF2BhnkB9zwbcgdNmjZP04ZahA7xnDp0HgZLg==
X-Received: by 2002:a6b:7d42:: with SMTP id d2mr57793459ioq.176.1609726729750; 
 Sun, 03 Jan 2021 18:18:49 -0800 (PST)
Received: from [172.22.22.4] (c-73-185-129-58.hsd1.mn.comcast.net.
 [73.185.129.58])
 by smtp.googlemail.com with ESMTPSA id y12sm42527985ilk.32.2021.01.03.18.18.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Jan 2021 18:18:49 -0800 (PST)
To: Arnd Bergmann <arnd@kernel.org>, Vaibhav Agarwal <vaibhav.sr@gmail.com>,
 Mark Greer <mgreer@animalcreek.com>, Johan Hovold <johan@kernel.org>,
 Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nathan Chancellor <natechancellor@gmail.com>,
 Nick Desaulniers <ndesaulniers@google.com>
References: <20210103223541.2790855-1-arnd@kernel.org>
From: Alex Elder <elder@ieee.org>
Message-ID: <d9c341c9-9005-b425-9dd8-e797869bbcb0@ieee.org>
Date: Sun, 3 Jan 2021 20:18:47 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20210103223541.2790855-1-arnd@kernel.org>
Content-Language: en-US
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, Arnd Bergmann <arnd@arndb.de>,
 clang-built-linux@googlegroups.com, linux-kernel@vger.kernel.org,
 Coiby Xu <coiby.xu@gmail.com>, greybus-dev@lists.linaro.org,
 Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [greybus-dev] [PATCH] staging: greybus: fix stack size warning
	with UBSAN
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: greybus-dev-bounces@lists.linaro.org
Sender: "greybus-dev" <greybus-dev-bounces@lists.linaro.org>
X-Virus-Scanned: ClamAV using ClamSMTP

T24gMS8zLzIxIDQ6MzUgUE0sIEFybmQgQmVyZ21hbm4gd3JvdGU6Cj4gRnJvbTogQXJuZCBCZXJn
bWFubiA8YXJuZEBhcm5kYi5kZT4KPiAKPiBjbGFuZyB3YXJucyBhYm91dCBleGNlc3NpdmUgc3Rh
Y2sgdXNhZ2UgaW4gdGhpcyBkcml2ZXIgd2hlbgo+IFVCU0FOIGlzIGVuYWJsZWQ6Cj4gCj4gZHJp
dmVycy9zdGFnaW5nL2dyZXlidXMvYXVkaW9fdG9wb2xvZ3kuYzo5Nzc6MTI6IGVycm9yOiBzdGFj
ayBmcmFtZSBzaXplIG9mIDE4MzYgYnl0ZXMgaW4gZnVuY3Rpb24gJ2diYXVkaW9fdHBsZ19jcmVh
dGVfd2lkZ2V0JyBbLVdlcnJvciwtV2ZyYW1lLWxhcmdlci10aGFuPV0KPiAKPiBSZXdvcmsgdGhp
cyBjb2RlIHRvIG5vIGxvbmdlciB1c2UgY29tcG91bmQgbGl0ZXJhbHMgZm9yCj4gaW5pdGlhbGl6
aW5nIHRoZSBzdHJ1Y3R1cmUgaW4gZWFjaCBjYXNlLCBidXQgaW5zdGVhZCBrZWVwCj4gdGhlIGNv
bW1vbiBiaXRzIGluIGEgcHJlYWxsb2NhdGVkIGNvbnN0YW50IGFycmF5IGFuZCBjb3B5Cj4gdGhl
bSBhcyBuZWVkZWQuCgpUaGlzIGlzIGdvb2QsIGJ1dCBJIGhhdmUgYSBmZXcgY29tbWVudHMuCgpZ
b3UgdG9vayBvdXQgdGhlIGRlZmF1bHQgY2FzZSwgYW5kIGl0IHNlZW1zIHlvdSBhcmUgdXNpbmcK
YSB3LT50eXBlIHZhbHVlIGJpZ2dlciB0aGFuIHRoZSBpbml0aWFsaXphdGlvbiBhcnJheSB0bwpk
ZXRlcm1pbmUgdmFsaWRpdHkuICBCdXQgdGhlcmUgYXJlIG1vcmUgdmFsdWVzIGRlZmluZWQgaW4K
dGhlIHNuZF9zb2NfZGFwbV90eXBlIGVudW1lcmF0ZWQgdHlwZSB0aGFuIGFyZSBleHBsaWNpdGx5
Cmxpc3RlZCBhcyBjYXNlcyBpbiB0aGUgc3dpdGNoIHN0YXRlbWVudC4gIFNvIHRoZSBzd2l0Y2gK
c3RhdGVtZW50IG5vIGxvbmdlciB0cmVhdHMgc29tZSB0eXBlcyBhcyBpbnZhbGlkIChzdWNoCmFz
IHNuZF9zb2NfZGFwbV9kZW11eCkuICBBbSBJIG1pc3Npbmcgc29tZXRoaW5nPwoKWW91IGFyZSBz
ZXR0aW5nIGV4cGxpY2l0IG5hbWVzLCBzdWNoIGFzICJzcGsiLCAiaHAiLAoibWljIiwgZXRjLiBp
biB0aGUgaW5pdGlhbGl6YXRpb24gYXJyYXkuICBCdXQgeW91CnVwZGF0ZSB0aGUgbmFtZSBhZnRl
ciAoc3RydWN0KSBhc3NpZ25pbmcgZnJvbSB0aGUKYXJyYXkuICBJIGhhdmUgbm8gcmVhbCBvYmpl
Y3Rpb24gSSBndWVzcywgYnV0IHdoeQpib3RoZXI/ICBXaHkgbm90IGp1c3QgdXNlIG51bGwgcG9p
bnRlcnMgaW4gdGhlCmluaXRpYWxpemF0aW9uIGFycmF5PwoKWW91IGNoYW5nZSBhIHNlbWljb2xv
biB0byBhIGNvbW1hIGluIG9uZSBzcG90LCBhbmQgeW91CnNob3VsZCBub3QgaGF2ZS4gIEknbGwg
cG9pbnQgdGhhdCBvdXQgYmVsb3cuCgpJIGxpa2UgdGhhdCB5b3UgZ290IHJpZCBvZiB0aGUgdHlw
ZSBjYXN0cywgd2hpY2ggd2VyZQphcHBhcmVudGx5IHVubmVjZXNzYXJ5LgoKWW91IGRyb3BwZWQg
dGhlIGJyZWFrIGluIHRoZSBmaW5hbCBjYXNlIGluIHRoZSBzd2l0Y2gKc3RhdGVtZW50LCBidXQg
aW4gYW4gZWFybGllciBkaXNjdXNzaW9uIEkgdGhpbmsgd2UKY29uY2x1ZGVkIHRoYXQgd2Fzbid0
IGEgcHJvYmxlbS4KCkkgZ3Vlc3MgdGhlIG1haW4gdGhpbmcgaXMgdGhlIGZpcnN0IHRoaW5nIG1l
bnRpb25lZC4KCgpUaGFua3MuCgoJCQkJCS1BbGV4Cgo+IFNpZ25lZC1vZmYtYnk6IEFybmQgQmVy
Z21hbm4gPGFybmRAYXJuZGIuZGU+Cj4gLS0tCj4gICBkcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9h
dWRpb190b3BvbG9neS5jIHwgMTA2ICsrKysrKysrKystLS0tLS0tLS0tLS0tCj4gICAxIGZpbGUg
Y2hhbmdlZCwgNDcgaW5zZXJ0aW9ucygrKSwgNTkgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2F1ZGlvX3RvcG9sb2d5LmMgYi9kcml2ZXJzL3N0
YWdpbmcvZ3JleWJ1cy9hdWRpb190b3BvbG9neS5jCj4gaW5kZXggOTZiOGIyOWZlODk5Li5jMDM4
NzM5MTVjMjAgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvYXVkaW9fdG9w
b2xvZ3kuYwo+ICsrKyBiL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2F1ZGlvX3RvcG9sb2d5LmMK
PiBAQCAtOTc0LDYgKzk3NCw0NCBAQCBzdGF0aWMgaW50IGdiYXVkaW9fd2lkZ2V0X2V2ZW50KHN0
cnVjdCBzbmRfc29jX2RhcG1fd2lkZ2V0ICp3LAo+ICAgCXJldHVybiByZXQ7Cj4gICB9Cj4gICAK
PiArc3RhdGljIGNvbnN0IHN0cnVjdCBzbmRfc29jX2RhcG1fd2lkZ2V0IGdiYXVkaW9fd2lkZ2V0
c1tdID0gewo+ICsJW3NuZF9zb2NfZGFwbV9zcGtdCT0gU05EX1NPQ19EQVBNX1NQSygic3BrIiwg
Z2Jjb2RlY19ldmVudF9zcGspLAo+ICsJW3NuZF9zb2NfZGFwbV9ocF0JPSBTTkRfU09DX0RBUE1f
SFAoImhwIiwgZ2Jjb2RlY19ldmVudF9ocCksCj4gKwlbc25kX3NvY19kYXBtX21pY10JPSBTTkRf
U09DX0RBUE1fTUlDKCJtaWMiLCBnYmNvZGVjX2V2ZW50X2ludF9taWMpLAoKLiAuIC4KCj4gQEAg
LTEwNTAsNzggKzEwODgsMjggQEAgc3RhdGljIGludCBnYmF1ZGlvX3RwbGdfY3JlYXRlX3dpZGdl
dChzdHJ1Y3QgZ2JhdWRpb19tb2R1bGVfaW5mbyAqbW9kdWxlLAo+ICAgCXN0cmxjcHkodGVtcF9u
YW1lLCB3LT5uYW1lLCBOQU1FX1NJWkUpOwo+ICAgCXNucHJpbnRmKHctPm5hbWUsIE5BTUVfU0la
RSwgIkdCICVkICVzIiwgbW9kdWxlLT5kZXZfaWQsIHRlbXBfbmFtZSk7Cj4gICAKPiArCWlmICh3
LT50eXBlID4gQVJSQVlfU0laRShnYmF1ZGlvX3dpZGdldHMpKSB7Cj4gKwkJcmV0ID0gLUVJTlZB
TDsKPiArCQlnb3RvIGVycm9yOwo+ICsJfQo+ICsJKmR3ID0gZ2JhdWRpb193aWRnZXRzW3ctPnR5
cGVdOwo+ICsJZHctPm5hbWUgPSB3LT5uYW1lOwo+ICsKPiAgIAlzd2l0Y2ggKHctPnR5cGUpIHsK
PiAgIAljYXNlIHNuZF9zb2NfZGFwbV9zcGs6Cj4gLQkJKmR3ID0gKHN0cnVjdCBzbmRfc29jX2Rh
cG1fd2lkZ2V0KQo+IC0JCQlTTkRfU09DX0RBUE1fU1BLKHctPm5hbWUsIGdiY29kZWNfZXZlbnRf
c3BrKTsKPiAgIAkJbW9kdWxlLT5vcF9kZXZpY2VzIHw9IEdCQVVESU9fREVWSUNFX09VVF9TUEVB
S0VSOwo+ICAgCQlicmVhazsKPiAgIAljYXNlIHNuZF9zb2NfZGFwbV9ocDoKPiAtCQkqZHcgPSAo
c3RydWN0IHNuZF9zb2NfZGFwbV93aWRnZXQpCj4gLQkJCVNORF9TT0NfREFQTV9IUCh3LT5uYW1l
LCBnYmNvZGVjX2V2ZW50X2hwKTsKPiAgIAkJbW9kdWxlLT5vcF9kZXZpY2VzIHw9IChHQkFVRElP
X0RFVklDRV9PVVRfV0lSRURfSEVBRFNFVAo+IC0JCQkJCXwgR0JBVURJT19ERVZJQ0VfT1VUX1dJ
UkVEX0hFQURQSE9ORSk7Cj4gKwkJCQkJfCBHQkFVRElPX0RFVklDRV9PVVRfV0lSRURfSEVBRFBI
T05FKSwKClBsZWFzZSBmaXggdGhpcyAoYWJvdmUpIHRvIHByZXNlcnZlIHRoZSBvcmlnaW5hbCBz
ZW1pY29sb24uCgo+ICAgCQltb2R1bGUtPmlwX2RldmljZXMgfD0gR0JBVURJT19ERVZJQ0VfSU5f
V0lSRURfSEVBRFNFVDsKPiAgIAkJYnJlYWs7Cj4gICAJY2FzZSBzbmRfc29jX2RhcG1fbWljOgo+
IC0JCSpkdyA9IChzdHJ1Y3Qgc25kX3NvY19kYXBtX3dpZGdldCkKPiAtCQkJU05EX1NPQ19EQVBN
X01JQyh3LT5uYW1lLCBnYmNvZGVjX2V2ZW50X2ludF9taWMpOwo+ICAgCQltb2R1bGUtPmlwX2Rl
dmljZXMgfD0gR0JBVURJT19ERVZJQ0VfSU5fQlVJTFRJTl9NSUM7Cj4gICAJCWJyZWFrOwoKLiAu
IC4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1
cy1kZXYgbWFpbGluZyBsaXN0CmdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKaHR0cHM6Ly9s
aXN0cy5saW5hcm8ub3JnL21haWxtYW4vbGlzdGluZm8vZ3JleWJ1cy1kZXYK
