Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 00E4823159F
	for <lists+greybus-dev@lfdr.de>; Wed, 29 Jul 2020 00:37:26 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 2E93E61936
	for <lists+greybus-dev@lfdr.de>; Tue, 28 Jul 2020 22:37:25 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 2297E66588; Tue, 28 Jul 2020 22:37:25 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE
	autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id B454866566;
	Tue, 28 Jul 2020 22:37:10 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 31FC261936
 for <greybus-dev@lists.linaro.org>; Tue, 28 Jul 2020 22:37:09 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 20E6766558; Tue, 28 Jul 2020 22:37:09 +0000 (UTC)
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
 [209.85.166.68])
 by lists.linaro.org (Postfix) with ESMTPS id D667961936
 for <greybus-dev@lists.linaro.org>; Tue, 28 Jul 2020 22:37:07 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id l1so22494938ioh.5
 for <greybus-dev@lists.linaro.org>; Tue, 28 Jul 2020 15:37:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EReXMTG1Tmh9rCxrfzcdSSmSqczZSw6FsxufeVNcmCk=;
 b=EsuQJqEsC53cbDc6lp57fT409UjEjDw8w6TchiM8sE4yZ6EovTsAoUI6P+uQkJMMt1
 aQrsCoFfCLOKE1IPT4iUUoFOTFkUmgbyyjGFhT6nlp/qw3Y+OU3XCPpurY97K2xkny+H
 EKFl1CnSNcbZTtB7kri3jpfwKBhxjZW8xJf1MBkzsdt5+v4d+3ds3zq3gI2wkXV0xr6w
 QFUY4tYX2qxfV620kL+o3IOIW/YppXDvVyfOTRmtK8qMz93JX/1CzEoi8yfUNaAIXvmC
 rTGq/U8SmkM55FWNJO21PhDpUT/DNdxFENQ8NTOvoqhIKoXC1FhcwTeOSNK65HhfxgBq
 9cfA==
X-Gm-Message-State: AOAM530BEL5rWsxqw00Y9jXD6Vhv6fnR3zQvpcYtSEEZ5imtwufKFmyu
 dG2UWpdqOZ3AoTtW7ornN4QZ9OSsB0M=
X-Google-Smtp-Source: ABdhPJyzXHG0tAuOusgIOMdvOpWxshaGRK/E/BmEJ3ru0oPTifXmHxcqzffEoT+KHP49oqXHsitCTg==
X-Received: by 2002:a05:6638:27a:: with SMTP id
 x26mr4781663jaq.43.1595975827218; 
 Tue, 28 Jul 2020 15:37:07 -0700 (PDT)
Received: from [172.22.22.4] (c-73-185-129-58.hsd1.mn.comcast.net.
 [73.185.129.58])
 by smtp.googlemail.com with ESMTPSA id b11sm105864ile.32.2020.07.28.15.37.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jul 2020 15:37:06 -0700 (PDT)
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20200727183258.GA28571@embeddedor>
From: Alex Elder <elder@ieee.org>
Message-ID: <63871608-e076-26b0-85df-cff11699c3a3@ieee.org>
Date: Tue, 28 Jul 2020 17:37:05 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200727183258.GA28571@embeddedor>
Content-Language: en-US
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: Re: [greybus-dev] [PATCH][next] greybus: Use fallthrough
	pseudo-keyword
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

T24gNy8yNy8yMCAxOjMyIFBNLCBHdXN0YXZvIEEuIFIuIFNpbHZhIHdyb3RlOgo+IFJlcGxhY2Ug
dGhlIGV4aXN0aW5nIC8qIGZhbGwgdGhyb3VnaCAqLyBjb21tZW50cyBhbmQgaXRzIHZhcmlhbnRz
IHdpdGgKPiB0aGUgbmV3IHBzZXVkby1rZXl3b3JkIG1hY3JvIGZhbGx0aHJvdWdoWzFdLgo+IAo+
IFsxXSBodHRwczovL3d3dy5rZXJuZWwub3JnL2RvYy9odG1sL3Y1LjcvcHJvY2Vzcy9kZXByZWNh
dGVkLmh0bWw/aGlnaGxpZ2h0PWZhbGx0aHJvdWdoI2ltcGxpY2l0LXN3aXRjaC1jYXNlLWZhbGwt
dGhyb3VnaAoKVGhhbmtzIGZvciB0aGUgcGF0Y2guICBJdCBsb29rcyBnb29kLCBidXQgaXQgcmFp
c2VzCmFub3RoZXIgcXVlc3Rpb24gSSdkIGxpa2UgZGlzY3Vzc2lvbiBvbi4KCkl0IHNlZW1zIHRo
YXQgSm9oYW4gbGlrZXMgZGVmYXVsdCAob3IgZmluYWwpIGNhc2VzIGluCnN3aXRjaCBzdGF0ZW1l
bnRzIHdpdGhvdXQgYSAiYnJlYWsiIHN0YXRlbWVudC4gIFZpcmVzaAphbmQgQnJ5YW4gYXBwZWFy
IHRvIGJlIGZvbmQgb2YgdGhpcyB0b28uCgpJdCdzIHBlZGFudGljLCBidXQgSSBkb24ndCBsaWtl
IHRoYXQuICBBbSBJIHdyb25nPwogICAtLT4gSm9oYW4vVmlyZXNoL0JyeWFuIHdvdWxkIHlvdSBw
bGVhc2UgY29tbWVudD8KCklmIHRoZXkgYXJlbid0IGNvbnZpbmNpbmcgKG9yIGRvbid0IGNhcmUp
IEkgdGhpbmsgYnJlYWsKc3RhdGVtZW50cyBzaG91bGQgYWxzbyBiZSBhZGRlZCBoZXJlOgotIElu
IGdiX2ludGVyZmFjZV9yZWFkX2FuZF9jbGVhcl9pbml0X3N0YXR1cygpIGZvciB0aGUKICAgZGVm
YXVsdCBjYXNlCi0gSW4gZ2JfaW50ZXJmYWNlX2FjdGl2YXRlKCkgZm9yIHRoZSBkZWZhdWx0IGNh
c2UuCi0gSW4gZ2Jfc3ZjX3Byb2Nlc3NfZGVmZXJyZWRfcmVxdWVzdCgpIGZvciB0aGUgZGVmYXVs
dAogICBjYXNlCgpCdXQgbGV0J3Mgd2FpdCB0byBzZWUgd2hhdCBKb2hhbiAoZXQgYWwpIHNheXMu
ICBJZiB5b3UKZG9uJ3Qgd2FudCB0byBkbyB0aGF0LCBzYXkgc28gYW5kIEknbGwgZG8gaXQgbGF0
ZXIuCgpJIGxvb2tlZCBhdCB0aGUgY29kZSBpbiBkcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy8gYW5k
IHNhdwpubyBuZWVkIHRvIGFkZCBhICJmYWxsdGhyb3VnaCIgYW55d2hlcmUsIGJ1dDoKLSBJbiBm
d19tZ210X2JhY2tlbmRfZndfdmVyc2lvbl9vcGVyYXRpb24oKSBWaXJlc2gKICAgc2VlbXMgdG8g
aGF2ZSBza2lwcGVkIHRoZSBicmVhayBpbiB0aGUgZmF1bHQgc3RhdGVtZW50Ci0gSW4gZ2JfdWFy
dF9yZXF1ZXN0X2hhbmRsZXIoKSBCcnlhbiBkaWQgdGhpcyB0b28uCgpEZXBlbmRpbmcgb24gZGlz
Y3Vzc2lvbiwgdGhlc2UgY291bGQgYmUgZml4ZWQgaW4gYQpzZXBhcmF0ZSBwYXRjaCBhcyB3ZWxs
LgoKVGhlc2UgY2FzZXMgYXJlbid0IGZvdW5kIGJ5ICJjaGVja3BhdGNoLnBsIiBiZWNhdXNlIGl0
IG9ubHkKbG9va3MgYXQgY2FzZSAiYmxvY2tzIiB0aGF0IGFyZSBmb2xsb3dlZCBieSBhbm90aGVy
IGNhc2UuClNvIHRoZSBsYXN0IGNhc2UgaXNuJ3QgY2hlY2tlZC4KCgkJCQkJLUFsZXgKCj4gU2ln
bmVkLW9mZi1ieTogR3VzdGF2byBBLiBSLiBTaWx2YSA8Z3VzdGF2b2Fyc0BrZXJuZWwub3JnPgo+
IC0tLQo+ICAgZHJpdmVycy9ncmV5YnVzL2VzMi5jICAgICAgIHwgMiArLQo+ICAgZHJpdmVycy9n
cmV5YnVzL2ludGVyZmFjZS5jIHwgMiArLQo+ICAgMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlv
bnMoKyksIDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3JleWJ1cy9l
czIuYyBiL2RyaXZlcnMvZ3JleWJ1cy9lczIuYwo+IGluZGV4IDM2NjcxNmYxMWIxYS4uMWRmNmFi
NWQzMzlkIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3JleWJ1cy9lczIuYwo+ICsrKyBiL2RyaXZl
cnMvZ3JleWJ1cy9lczIuYwo+IEBAIC03NTksNyArNzU5LDcgQEAgc3RhdGljIGludCBjaGVja191
cmJfc3RhdHVzKHN0cnVjdCB1cmIgKnVyYikKPiAgIAljYXNlIC1FT1ZFUkZMT1c6Cj4gICAJCWRl
dl9lcnIoZGV2LCAiJXM6IG92ZXJmbG93IGFjdHVhbCBsZW5ndGggaXMgJWRcbiIsCj4gICAJCQlf
X2Z1bmNfXywgdXJiLT5hY3R1YWxfbGVuZ3RoKTsKPiAtCQkvKiBmYWxsIHRocm91Z2ggKi8KPiAr
CQlmYWxsdGhyb3VnaDsKPiAgIAljYXNlIC1FQ09OTlJFU0VUOgo+ICAgCWNhc2UgLUVOT0VOVDoK
PiAgIAljYXNlIC1FU0hVVERPV046Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3JleWJ1cy9pbnRl
cmZhY2UuYyBiL2RyaXZlcnMvZ3JleWJ1cy9pbnRlcmZhY2UuYwo+IGluZGV4IDY3ZGJlNmZkYTlh
MS4uNThlYTM3NGQ4YWFhIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3JleWJ1cy9pbnRlcmZhY2Uu
Ywo+ICsrKyBiL2RyaXZlcnMvZ3JleWJ1cy9pbnRlcmZhY2UuYwo+IEBAIC0xMjMzLDcgKzEyMzMs
NyBAQCBpbnQgZ2JfaW50ZXJmYWNlX2FkZChzdHJ1Y3QgZ2JfaW50ZXJmYWNlICppbnRmKQo+ICAg
CWNhc2UgR0JfSU5URVJGQUNFX1RZUEVfR1JFWUJVUzoKPiAgIAkJZGV2X2luZm8oJmludGYtPmRl
diwgIkdNUCBWSUQ9MHglMDh4LCBQSUQ9MHglMDh4XG4iLAo+ICAgCQkJIGludGYtPnZlbmRvcl9p
ZCwgaW50Zi0+cHJvZHVjdF9pZCk7Cj4gLQkJLyogZmFsbC10aHJvdWdoICovCj4gKwkJZmFsbHRo
cm91Z2g7Cj4gICAJY2FzZSBHQl9JTlRFUkZBQ0VfVFlQRV9VTklQUk86Cj4gICAJCWRldl9pbmZv
KCZpbnRmLT5kZXYsICJEREJMMSBNYW51ZmFjdHVyZXI9MHglMDh4LCBQcm9kdWN0PTB4JTA4eFxu
IiwKPiAgIAkJCSBpbnRmLT5kZGJsMV9tYW51ZmFjdHVyZXJfaWQsCj4gCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpncmV5YnVzLWRldiBtYWlsaW5nIGxp
c3QKZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpodHRwczovL2xpc3RzLmxpbmFyby5vcmcv
bWFpbG1hbi9saXN0aW5mby9ncmV5YnVzLWRldgo=
