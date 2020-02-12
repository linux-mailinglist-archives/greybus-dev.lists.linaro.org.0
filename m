Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 371A7159DEA
	for <lists+greybus-dev@lfdr.de>; Wed, 12 Feb 2020 01:22:06 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 5A3A361789
	for <lists+greybus-dev@lfdr.de>; Wed, 12 Feb 2020 00:22:05 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 3FC71618B2; Wed, 12 Feb 2020 00:22:05 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE autolearn=disabled
	version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 956426162E;
	Wed, 12 Feb 2020 00:21:51 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 783326087C
 for <greybus-dev@lists.linaro.org>; Wed, 12 Feb 2020 00:21:49 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 6879C60B4C; Wed, 12 Feb 2020 00:21:49 +0000 (UTC)
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
 [209.85.166.68])
 by lists.linaro.org (Postfix) with ESMTPS id 42D206087C
 for <greybus-dev@lists.linaro.org>; Wed, 12 Feb 2020 00:21:48 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id i11so149368ioi.12
 for <greybus-dev@lists.linaro.org>; Tue, 11 Feb 2020 16:21:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=znb551cSk4SwLxhNrEmBfKq1pXuZl4kKW4lbTxGwGf0=;
 b=T0MvdqxKnnC0JdvUeHGoVoWKQFY1bLqCD9k/MqACTBWSeR8R8RgVsotFYXp42ObbxU
 +F1x0Ta3pjasN0G0Ncgj/LORO7eq4bBjY7lrupK8H9eQxl/ofXr6M4c1eFwLaYXOZkJs
 HGzb334ZWWfSSHAXI9kuScmITTajHlSvdCX66h35OFzBCnAbSV9mET8n7pLy47izNWqj
 2UfkF2bfZXjmWwEvKyqUbaYfrHejGeYgWniCJCQC30qPATWlOVnr7Mhyr4Nbwqa64Be1
 bJ/6oeYL0+b1EoXADNOvKuuDLSh6P13BLNrKpTqY5anEC7vbOFaOI7FLTXPONlKo2GMC
 VEnQ==
X-Gm-Message-State: APjAAAUnM6h/x9szW/8uulOWy0RbzDKyq28sbeAgvzRfzWumQSPBo1OP
 NU+R8jSHkjbUtmrrzQ75IbQUVp2+
X-Google-Smtp-Source: APXvYqxnRq6BGvwAHW2U261ceZ/bNuGg0tou3R07qwEpFfCKWQdGO9ZqNUDWl6Avc9BLocaETXZ3DQ==
X-Received: by 2002:a5e:9b01:: with SMTP id j1mr15005204iok.27.1581466907709; 
 Tue, 11 Feb 2020 16:21:47 -0800 (PST)
Received: from [172.22.22.10] (c-73-185-129-58.hsd1.mn.comcast.net.
 [73.185.129.58])
 by smtp.googlemail.com with ESMTPSA id q90sm1797509ili.27.2020.02.11.16.21.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Feb 2020 16:21:46 -0800 (PST)
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20200211211219.GA673@embeddedor>
 <e465ca6e-ed9f-4340-9f4c-104f9b6acb74@linaro.org>
 <ebd179c5-29d6-4c86-e047-76815572fcf6@embeddedor.com>
From: Alex Elder <elder@linaro.org>
Message-ID: <7ac2012c-6d22-dcc2-7c96-b9d6d578706a@linaro.org>
Date: Tue, 11 Feb 2020 18:21:13 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <ebd179c5-29d6-4c86-e047-76815572fcf6@embeddedor.com>
Content-Language: en-US
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, greybus-dev@lists.linaro.org,
 linux-kernel@vger.kernel.org
Subject: Re: [greybus-dev] [PATCH] staging: greybus: Replace zero-length
 array with flexible-array member
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

T24gMi8xMS8yMCA0OjQ3IFBNLCBHdXN0YXZvIEEuIFIuIFNpbHZhIHdyb3RlOgo+IAo+IAo+IE9u
IDIvMTEvMjAgMTY6MTUsIEFsZXggRWxkZXIgd3JvdGU6Cj4+IE9uIDIvMTEvMjAgMzoxMiBQTSwg
R3VzdGF2byBBLiBSLiBTaWx2YSB3cm90ZToKPj4+IFRoZSBjdXJyZW50IGNvZGViYXNlIG1ha2Vz
IHVzZSBvZiB0aGUgemVyby1sZW5ndGggYXJyYXkgbGFuZ3VhZ2UKPj4+IGV4dGVuc2lvbiB0byB0
aGUgQzkwIHN0YW5kYXJkLCBidXQgdGhlIHByZWZlcnJlZCBtZWNoYW5pc20gdG8gZGVjbGFyZQo+
Pj4gdmFyaWFibGUtbGVuZ3RoIHR5cGVzIHN1Y2ggYXMgdGhlc2Ugb25lcyBpcyBhIGZsZXhpYmxl
IGFycmF5IG1lbWJlclsxXVsyXSwKPj4+IGludHJvZHVjZWQgaW4gQzk5Ogo+Pj4KPj4+IHN0cnVj
dCBmb28gewo+Pj4gICAgICAgICBpbnQgc3R1ZmY7Cj4+PiAgICAgICAgIHN0cnVjdCBib28gYXJy
YXlbXTsKPj4+IH07Cj4+Pgo+Pj4gQnkgbWFraW5nIHVzZSBvZiB0aGUgbWVjaGFuaXNtIGFib3Zl
LCB3ZSB3aWxsIGdldCBhIGNvbXBpbGVyIHdhcm5pbmcKPj4+IGluIGNhc2UgdGhlIGZsZXhpYmxl
IGFycmF5IGRvZXMgbm90IG9jY3VyIGxhc3QgaW4gdGhlIHN0cnVjdHVyZSwgd2hpY2gKPj4+IHdp
bGwgaGVscCB1cyBwcmV2ZW50IHNvbWUga2luZCBvZiB1bmRlZmluZWQgYmVoYXZpb3IgYnVncyBm
cm9tIGJlaW5nCj4+PiBpbmFkdmVydGVubHkgaW50cm9kdWNlZFszXSB0byB0aGUgY29kZWJhc2Ug
ZnJvbSBub3cgb24uCj4+Pgo+Pj4gVGhpcyBpc3N1ZSB3YXMgZm91bmQgd2l0aCB0aGUgaGVscCBv
ZiBDb2NjaW5lbGxlLgo+Pj4KPj4+IFsxXSBodHRwczovL2djYy5nbnUub3JnL29ubGluZWRvY3Mv
Z2NjL1plcm8tTGVuZ3RoLmh0bWwKPj4+IFsyXSBodHRwczovL2dpdGh1Yi5jb20vS1NQUC9saW51
eC9pc3N1ZXMvMjEKPj4+IFszXSBjb21taXQgNzY0OTc3MzI5MzJmICgiY3hnYjMvbDJ0OiBGaXgg
dW5kZWZpbmVkIGJlaGF2aW91ciIpCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogR3VzdGF2byBBLiBS
LiBTaWx2YSA8Z3VzdGF2b0BlbWJlZGRlZG9yLmNvbT4KPj4+IC0tLQo+Pj4gIGRyaXZlcnMvc3Rh
Z2luZy9ncmV5YnVzL3Jhdy5jIHwgMiArLQo+Pj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKSwgMSBkZWxldGlvbigtKQo+Pj4KPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3N0YWdpbmcv
Z3JleWJ1cy9yYXcuYyBiL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL3Jhdy5jCj4+PiBpbmRleCA4
MzhhY2JlODRjYTAuLjJiMzAxYjJhYTEwNyAxMDA2NDQKPj4+IC0tLSBhL2RyaXZlcnMvc3RhZ2lu
Zy9ncmV5YnVzL3Jhdy5jCj4+PiArKysgYi9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9yYXcuYwo+
Pj4gQEAgLTMwLDcgKzMwLDcgQEAgc3RydWN0IGdiX3JhdyB7Cj4+PiAgc3RydWN0IHJhd19kYXRh
IHsKPj4+ICAJc3RydWN0IGxpc3RfaGVhZCBlbnRyeTsKPj4+ICAJdTMyIGxlbjsKPj4+IC0JdTgg
ZGF0YVswXTsKPj4+ICsJdTggZGF0YVtdOwo+Pj4gIH07Cj4+PiAgCj4+PiAgc3RhdGljIHN0cnVj
dCBjbGFzcyAqcmF3X2NsYXNzOwo+Pj4KPj4KPj4gRG9lcyB0aGUga2FtbGxvYygpIGNhbGwgaW4g
cmVjZWl2ZV9kYXRhKCkgaGF2ZSBhbnkgcHJvYmxlbXMKPj4gd2l0aCB0aGUgc2l6ZW9mKCpyYXdf
ZGF0YSkgcGFzc2VkIGFzIGl0cyBhcmd1bWVudD8KPj4KPiAKPiBOb3QgaW4gdGhpcyBjYXNlLiBJ
dCdkIGJlIGRpZmZlcmVudCB3aXRoIGEgb25lLWVsZW1lbnQgYXJyYXkgKHU4IGRhdGFbMV0pLAo+
IHRob3VnaC4KPiAKPj4gSSdtIG5vdCBlbnRpcmVseSBzdXJlIHdoYXQgc2l6ZW9mKHN0cnVjdC13
aXRoLWZsZXhpYmxlLWFycmF5LW1lbWJlcikKPj4gcHJvZHVjZXMuCj4+Cj4gCj4gVGhlIHNhbWUg
YXMgc2l6ZW9mKHN0cnVjdC13aXRoLXplcm8tbGVuZ3RoLWFycmF5KToKPiAKPiAiRmxleGlibGUg
YXJyYXkgbWVtYmVycyBoYXZlIGluY29tcGxldGUgdHlwZSwgYW5kIHNvIHRoZSBzaXplb2Ygb3Bl
cmF0b3IKPiBtYXkgbm90IGJlIGFwcGxpZWQuIEFzIGEgcXVpcmsgb2YgdGhlIG9yaWdpbmFsIGlt
cGxlbWVudGF0aW9uIG9mCj4gemVyby1sZW5ndGggYXJyYXlzLCBzaXplb2YgZXZhbHVhdGVzIHRv
IHplcm8uIlsxXQo+IAo+IFsxXSBodHRwczovL2djYy5nbnUub3JnL29ubGluZWRvY3MvZ2NjL1pl
cm8tTGVuZ3RoLmh0bWwKCkkgc2F3IHRoYXQsIGJ1dCBJIHdvbmRlcmVkIHdoYXQgdGhlIHN0YW5k
YXJkIHNheXMgKGFuZAp3aGV0aGVyIENsYW5nIHByb2R1Y2VzIHRoZSBzYW1lIHJlc3VsdCkuCgpJ
IGZvdW5kIHRoaXMgaW4gYSBkcmFmdCBzdGFuZGFyZCwgYW5kIEkgZ3Vlc3Mgd2UgY2FuCmFzc3Vt
ZSBpdCBhcHBsaWVzIGhlcmU6CgogICAgIi4uLnRoZSAgc2l6ZSBvZiB0aGUgc3RydWN0dXJlIGlz
IGFzIGlmIHRoZSBmbGV4aWJsZQogICAgYXJyYXkgIG1lbWJlciB3ZXJlIG9taXR0ZWQgZXhjZXB0
IHRoYXQgaXQgbWF5IGhhdmUKICAgIG1vcmUgdHJhaWxpbmcgcGFkZGluZyB0aGFuIHRoZSBvbWlz
c2lvbiB3b3VsZCBpbXBseS4iCgpMb29rcyBnb29kIHRvIG1lLgoKUmV2aWV3ZWQtYnk6IEFsZXgg
RWxkZXIgPGVsZGVyQGxpbmFyby5vcmc+Cgo+IAo+IC0tCj4gR3VzdGF2bwo+IAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1kZXYgbWFpbGlu
ZyBsaXN0CmdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKaHR0cHM6Ly9saXN0cy5saW5hcm8u
b3JnL21haWxtYW4vbGlzdGluZm8vZ3JleWJ1cy1kZXYK
