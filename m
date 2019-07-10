Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 80E5F6502A
	for <lists+greybus-dev@lfdr.de>; Thu, 11 Jul 2019 04:30:42 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id A906B61797
	for <lists+greybus-dev@lfdr.de>; Thu, 11 Jul 2019 02:30:41 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 9D87C617A2; Thu, 11 Jul 2019 02:30:41 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
	ip-10-150-125-211.ec2.internal
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DATE_IN_PAST_03_06,
	DKIM_ADSP_CUSTOM_MED,FREEMAIL_FROM,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 11223617FA;
	Thu, 11 Jul 2019 02:30:09 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 3001F6177D
 for <greybus-dev@lists.linaro.org>; Wed, 10 Jul 2019 18:24:06 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 2491561789; Wed, 10 Jul 2019 18:24:06 +0000 (UTC)
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
 [209.85.160.195])
 by lists.linaro.org (Postfix) with ESMTPS id 42F806177D
 for <greybus-dev@lists.linaro.org>; Wed, 10 Jul 2019 18:24:05 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id h18so3480168qtm.9
 for <greybus-dev@lists.linaro.org>; Wed, 10 Jul 2019 11:24:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=zAcgUolazA7luBwp8paMkjhRVKLXRJL6TdvFMDHQKzA=;
 b=bJntSgTqDDNgNgwTVj1kUGT5OnA+bKKNLvjMnXAX9WxjfPs9jyi7CafYGqV04hOQC6
 vhizTd22m7ldyyJbDNNQsZWbWi4C7wb8ryN8WZUWjR8H5MLcmOzaU+juwgnGrnmeIwid
 v9W+oXjxuFXQOtrJbn33W8U6BHgDBr3kLMmhmGHKeve5rYwTyA/jhQgkjW1GBBXMgjBf
 m+JKA117L/+joCzNqs33r0NCTZBXjPapbNnWnTjNsavpTl1UCcvmS0wCa1RIayW9kaZR
 w0husHPg+6G6nd5FnEyjWRAJvJvn1IDDySZUIC+5CkvR3D4yH7t9I0deh57Nbn//OVlz
 vWkQ==
X-Gm-Message-State: APjAAAVrQ66bMv0qMdIGtETnYyiwaThAGhxr2vBbnpfpQZt7D1Q7a49/
 hX2lBCWfjDyZkQy+WDbJnQ==
X-Google-Smtp-Source: APXvYqx9x9Hv8Yb01z7kNT2uDT6YWO3K7fCYZ/dkH2TwctUQ9egiiR8ut6bSAfySZQU4uXvTVDUyAw==
X-Received: by 2002:ac8:374b:: with SMTP id p11mr24711189qtb.316.1562783044890; 
 Wed, 10 Jul 2019 11:24:04 -0700 (PDT)
Received: from keyur-pc (modemcable148.230-83-70.mc.videotron.ca.
 [70.83.230.148])
 by smtp.gmail.com with ESMTPSA id f25sm1608616qta.81.2019.07.10.11.24.03
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 10 Jul 2019 11:24:03 -0700 (PDT)
Date: Wed, 10 Jul 2019 10:24:06 -0400
From: Keyur Patel <iamkeyur96@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Message-ID: <20190710142406.GA6669@keyur-pc>
References: <20190710122018.2250-1-iamkeyur96@gmail.com>
 <20190710163538.GA30902@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190710163538.GA30902@kroah.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Thu, 11 Jul 2019 02:30:06 +0000
Cc: devel@driverdev.osuosl.org, Alex Elder <elder@kernel.org>,
 Johan Hovold <johan@kernel.org>, linux-kernel@vger.kernel.org,
 greybus-dev@lists.linaro.org, David Lin <dtwlin@gmail.com>
Subject: Re: [greybus-dev] [PATCH] staging: greybus: add logging statement
 when kfifo_alloc fails
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

T24gV2VkLCBKdWwgMTAsIDIwMTkgYXQgMDY6MzU6MzhQTSArMDIwMCwgR3JlZyBLcm9haC1IYXJ0
bWFuIHdyb3RlOgo+IE9uIFdlZCwgSnVsIDEwLCAyMDE5IGF0IDA4OjIwOjE3QU0gLTA0MDAsIEtl
eXVyIFBhdGVsIHdyb3RlOgo+ID4gQWRkZWQgbWlzc2luZyBsb2dnaW5nIHN0YXRlbWVudCB3aGVu
IGtmaWZvX2FsbG9jIGZhaWxzLCB0byBpbXByb3ZlCj4gPiBkZWJ1Z2dpbmcuCj4gPiAKPiA+IFNp
Z25lZC1vZmYtYnk6IEtleXVyIFBhdGVsIDxpYW1rZXl1cjk2QGdtYWlsLmNvbT4KPiA+IC0tLQo+
ID4gIGRyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL3VhcnQuYyB8IDQgKysrLQo+ID4gIDEgZmlsZSBj
aGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiA+IAo+ID4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL3VhcnQuYyBiL2RyaXZlcnMvc3RhZ2luZy9ncmV5
YnVzL3VhcnQuYwo+ID4gaW5kZXggYjNiZmZlOTFhZTk5Li44NmEzOTVhZTE3N2QgMTAwNjQ0Cj4g
PiAtLS0gYS9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy91YXJ0LmMKPiA+ICsrKyBiL2RyaXZlcnMv
c3RhZ2luZy9ncmV5YnVzL3VhcnQuYwo+ID4gQEAgLTg1Niw4ICs4NTYsMTAgQEAgc3RhdGljIGlu
dCBnYl91YXJ0X3Byb2JlKHN0cnVjdCBnYnBoeV9kZXZpY2UgKmdicGh5X2RldiwKPiA+ICAKPiA+
ICAJcmV0dmFsID0ga2ZpZm9fYWxsb2MoJmdiX3R0eS0+d3JpdGVfZmlmbywgR0JfVUFSVF9XUklU
RV9GSUZPX1NJWkUsCj4gPiAgCQkJICAgICBHRlBfS0VSTkVMKTsKPiA+IC0JaWYgKHJldHZhbCkK
PiA+ICsJaWYgKHJldHZhbCkgewo+ID4gKwkJcHJfZXJyKCJrZmlmb19hbGxvYyBmYWlsZWRcbiIp
Owo+ID4gIAkJZ290byBleGl0X2J1Zl9mcmVlOwo+ID4gKwl9Cj4gCj4gWW91IHNob3VsZCBoYXZl
IGFscmVhZHkgZ290dGVuIGFuIGVycm9yIG1lc3NhZ2UgZnJvbSB0aGUgbG9nIGlmIHRoaXMKPiBm
YWlscywgZnJvbSB0aGUga21hbGxvY19hcnJheSgpIGNhbGwgZmFpbGluZywgcmlnaHQ/Cj4gCj4g
U28gd2h5IGlzIHRoaXMgbmVlZGVkPyAgV2UgaGF2ZSBiZWVuIHRyeWluZyB0byByZW1vdmUgdGhl
c2UgdHlwZXMgb2YKPiBtZXNzYWdlcyBhbmQga2VlcCB0aGVtIGluIHRoZSAicm9vdCIgcGxhY2Ug
d2hlcmUgdGhlIGZhaWx1cmUgaGFwcGVucy4KPiAKPiB0aGFua3MsCj4gCj4gZ3JlZyBrLWgKCkRp
ZG4ndCBub3RpY2UgdGhhdC4gSSBhZ3JlZSB0aGF0IHRoaXMgd2lsbCByZXN1bHQgb25seSBpbnRv
IHJlZHVuZGFuY3kuIApRdWljayBsb29rIG92ZXIgZmlsZXMgcmV2ZWFsIHRoYXQgdGhlcmUgYXJl
IG11bHRpcGxlIHBsYWNlcwp3aGVyZSBwZW9wbGUgYXJlIHVzaW5nIHByaW50IHN0YXRlbWVudHMg
YWZ0ZXIgbWVtb3J5IGFsbG9jYXRpb24gZmFpbHMuIApTaG91bGQgSSBnbyBhaGVhZCBhbmQgc2Vu
ZCBwYXRjaGVzIHRvIHJlbW92ZSB0aG9zZQpyZWR1bmRhbnQgcHJpbnQgc3RhdGVtZW50cz8KClNv
cnJ5LCBpZiB5b3UncmUgcmVjZWl2aW5nIHRoaXMgbWVzc2FnZSBhZ2Fpbi4KClRobmFrcy4KS2V5
dXIgUGF0ZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
Z3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0CmdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKaHR0
cHM6Ly9saXN0cy5saW5hcm8ub3JnL21haWxtYW4vbGlzdGluZm8vZ3JleWJ1cy1kZXYK
