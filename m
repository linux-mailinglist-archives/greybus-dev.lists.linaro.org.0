Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 220DF159C01
	for <lists+greybus-dev@lfdr.de>; Tue, 11 Feb 2020 23:16:28 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 2B393608FC
	for <lists+greybus-dev@lfdr.de>; Tue, 11 Feb 2020 22:16:27 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 2066E609E7; Tue, 11 Feb 2020 22:16:27 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE autolearn=disabled
	version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id E90DB60B4C;
	Tue, 11 Feb 2020 22:16:13 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id CC3A66087C
 for <greybus-dev@lists.linaro.org>; Tue, 11 Feb 2020 22:16:11 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id A978B609E7; Tue, 11 Feb 2020 22:16:11 +0000 (UTC)
Received: from mail-il1-f196.google.com (mail-il1-f196.google.com
 [209.85.166.196])
 by lists.linaro.org (Postfix) with ESMTPS id 74D0D6087C
 for <greybus-dev@lists.linaro.org>; Tue, 11 Feb 2020 22:16:10 +0000 (UTC)
Received: by mail-il1-f196.google.com with SMTP id v13so4885409iln.4
 for <greybus-dev@lists.linaro.org>; Tue, 11 Feb 2020 14:16:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=H6KlLlplsizPpKg7w1wwWFh0NtfbnywsiGoeM+An45U=;
 b=WS11ZPJ5MKdll4QBR54SRVKq/r6EndEoeLWd8mlEAx0lRtFViIl+gQANh0ORTUTdbn
 ikzC3DAbmHBErG9zNv2z5OlidPKltBlguFplNlt0YcKQlCkhqtjZPhW5oaLHBZYdGMPY
 thmhrfwOTaVyTymACNS4Ahfuo23O5Ac94ws6Lm22bJ2OJFBdHZKSWTT6IEYebGWFx5h9
 tF5aTrqvbjP7pST+ghtB+V88ZyzmArK0C74H2ZbqHOjM8mVwZN7lfQAwxk3PHhFZ2piT
 0mhI76wXrHsKFwY5/KQwRexe8CXprw7Dd8bFEHZ1APzP7hGOz2N9sfwLhpsNxA+KTmTo
 Yj6w==
X-Gm-Message-State: APjAAAVDmyfivhz3+iB7dqrMghWPBtPOrPp/I9i5jx8agZYf3JJyNpW6
 iFFZqetY750uKeK5CV4QVtSe9sT/
X-Google-Smtp-Source: APXvYqzTqJNXmNj4lMWwdLNrDnJkdwd3aVpL7i2tk1tOW88coogfvaC/JMWvkpyM8dBzuY4epaT2ZA==
X-Received: by 2002:a05:6e02:8eb:: with SMTP id
 n11mr8102929ilt.26.1581459369847; 
 Tue, 11 Feb 2020 14:16:09 -0800 (PST)
Received: from [172.22.22.10] (c-73-185-129-58.hsd1.mn.comcast.net.
 [73.185.129.58])
 by smtp.googlemail.com with ESMTPSA id s10sm1376816iop.36.2020.02.11.14.16.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Feb 2020 14:16:09 -0800 (PST)
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20200211211219.GA673@embeddedor>
From: Alex Elder <elder@linaro.org>
Message-ID: <e465ca6e-ed9f-4340-9f4c-104f9b6acb74@linaro.org>
Date: Tue, 11 Feb 2020 16:15:35 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200211211219.GA673@embeddedor>
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

T24gMi8xMS8yMCAzOjEyIFBNLCBHdXN0YXZvIEEuIFIuIFNpbHZhIHdyb3RlOgo+IFRoZSBjdXJy
ZW50IGNvZGViYXNlIG1ha2VzIHVzZSBvZiB0aGUgemVyby1sZW5ndGggYXJyYXkgbGFuZ3VhZ2UK
PiBleHRlbnNpb24gdG8gdGhlIEM5MCBzdGFuZGFyZCwgYnV0IHRoZSBwcmVmZXJyZWQgbWVjaGFu
aXNtIHRvIGRlY2xhcmUKPiB2YXJpYWJsZS1sZW5ndGggdHlwZXMgc3VjaCBhcyB0aGVzZSBvbmVz
IGlzIGEgZmxleGlibGUgYXJyYXkgbWVtYmVyWzFdWzJdLAo+IGludHJvZHVjZWQgaW4gQzk5Ogo+
IAo+IHN0cnVjdCBmb28gewo+ICAgICAgICAgaW50IHN0dWZmOwo+ICAgICAgICAgc3RydWN0IGJv
byBhcnJheVtdOwo+IH07Cj4gCj4gQnkgbWFraW5nIHVzZSBvZiB0aGUgbWVjaGFuaXNtIGFib3Zl
LCB3ZSB3aWxsIGdldCBhIGNvbXBpbGVyIHdhcm5pbmcKPiBpbiBjYXNlIHRoZSBmbGV4aWJsZSBh
cnJheSBkb2VzIG5vdCBvY2N1ciBsYXN0IGluIHRoZSBzdHJ1Y3R1cmUsIHdoaWNoCj4gd2lsbCBo
ZWxwIHVzIHByZXZlbnQgc29tZSBraW5kIG9mIHVuZGVmaW5lZCBiZWhhdmlvciBidWdzIGZyb20g
YmVpbmcKPiBpbmFkdmVydGVubHkgaW50cm9kdWNlZFszXSB0byB0aGUgY29kZWJhc2UgZnJvbSBu
b3cgb24uCj4gCj4gVGhpcyBpc3N1ZSB3YXMgZm91bmQgd2l0aCB0aGUgaGVscCBvZiBDb2NjaW5l
bGxlLgo+IAo+IFsxXSBodHRwczovL2djYy5nbnUub3JnL29ubGluZWRvY3MvZ2NjL1plcm8tTGVu
Z3RoLmh0bWwKPiBbMl0gaHR0cHM6Ly9naXRodWIuY29tL0tTUFAvbGludXgvaXNzdWVzLzIxCj4g
WzNdIGNvbW1pdCA3NjQ5NzczMjkzMmYgKCJjeGdiMy9sMnQ6IEZpeCB1bmRlZmluZWQgYmVoYXZp
b3VyIikKPiAKPiBTaWduZWQtb2ZmLWJ5OiBHdXN0YXZvIEEuIFIuIFNpbHZhIDxndXN0YXZvQGVt
YmVkZGVkb3IuY29tPgo+IC0tLQo+ICBkcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9yYXcuYyB8IDIg
Ky0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL3Jhdy5jIGIvZHJpdmVycy9zdGFn
aW5nL2dyZXlidXMvcmF3LmMKPiBpbmRleCA4MzhhY2JlODRjYTAuLjJiMzAxYjJhYTEwNyAxMDA2
NDQKPiAtLS0gYS9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9yYXcuYwo+ICsrKyBiL2RyaXZlcnMv
c3RhZ2luZy9ncmV5YnVzL3Jhdy5jCj4gQEAgLTMwLDcgKzMwLDcgQEAgc3RydWN0IGdiX3JhdyB7
Cj4gIHN0cnVjdCByYXdfZGF0YSB7Cj4gIAlzdHJ1Y3QgbGlzdF9oZWFkIGVudHJ5Owo+ICAJdTMy
IGxlbjsKPiAtCXU4IGRhdGFbMF07Cj4gKwl1OCBkYXRhW107Cj4gIH07Cj4gIAo+ICBzdGF0aWMg
c3RydWN0IGNsYXNzICpyYXdfY2xhc3M7Cj4gCgpEb2VzIHRoZSBrYW1sbG9jKCkgY2FsbCBpbiBy
ZWNlaXZlX2RhdGEoKSBoYXZlIGFueSBwcm9ibGVtcwp3aXRoIHRoZSBzaXplb2YoKnJhd19kYXRh
KSBwYXNzZWQgYXMgaXRzIGFyZ3VtZW50PwoKSSdtIG5vdCBlbnRpcmVseSBzdXJlIHdoYXQgc2l6
ZW9mKHN0cnVjdC13aXRoLWZsZXhpYmxlLWFycmF5LW1lbWJlcikKcHJvZHVjZXMuCgoJCQkJCS1B
bGV4Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmdyZXli
dXMtZGV2IG1haWxpbmcgbGlzdApncmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3JnCmh0dHBzOi8v
bGlzdHMubGluYXJvLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2dyZXlidXMtZGV2Cg==
