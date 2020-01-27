Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 509D514A5C5
	for <lists+greybus-dev@lfdr.de>; Mon, 27 Jan 2020 15:10:17 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 152CD609A8
	for <lists+greybus-dev@lfdr.de>; Mon, 27 Jan 2020 14:10:16 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 092C46183B; Mon, 27 Jan 2020 14:10:16 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE autolearn=disabled
	version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id EC46F618C5;
	Mon, 27 Jan 2020 14:10:01 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 413BA609A8
 for <greybus-dev@lists.linaro.org>; Mon, 27 Jan 2020 14:09:59 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 2D0A261843; Mon, 27 Jan 2020 14:09:59 +0000 (UTC)
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
 [209.85.166.65])
 by lists.linaro.org (Postfix) with ESMTPS id 04717609A8
 for <greybus-dev@lists.linaro.org>; Mon, 27 Jan 2020 14:09:58 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id t26so10078723ioi.13
 for <greybus-dev@lists.linaro.org>; Mon, 27 Jan 2020 06:09:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Yv5KqLnXONaOGib3wLrqYVmgcYdGx8e/GR+T9YQ6OPw=;
 b=SNDSf2nTMznLZlzrlpjemTu/6SWgt+oZ27UWybBAUQAanZIjo4iFVmffF64kzrrgih
 SQFdYgOQDKNxh4fExEQZjXjJA1V8a825kMJK+9+MtTCOHmwxI8cG6UR7EzJiqpxgqxZ2
 2xMipeTKs1fExMItRRYRXSTjfMnZUpuajfcylkkERJBge3DgxSLvrA01cgJluEJWJMDa
 YuhgrBq02j1F8YHDvCLlNsae3HH4pZwzpIOIJq67j23pzBIulIiI1RvltxPFylNKzn08
 zGtjVqTx8eY0jtQF6+dnl+ak3sxaeWBhpzjFzER+L/YrbY7c7+e7eqW7eDEQZW4KJQ9C
 Qx7A==
X-Gm-Message-State: APjAAAXyktzIY9s+Pulz7Kxic7AtwMpECUWG+cGJ6KlGz1rB0nq3H68j
 OXHLbrOB+/tuCsVIJBqXVl6amEv8KYk873jn
X-Google-Smtp-Source: APXvYqwtVgEtLekwn8fG1L9sK07okuROrJ9qxmXeVCwPLq/j16zWaXdybm2To8GVQ2l04vYEu9xWwQ==
X-Received: by 2002:a02:cc59:: with SMTP id i25mr8166924jaq.78.1580134197214; 
 Mon, 27 Jan 2020 06:09:57 -0800 (PST)
Received: from [172.22.22.26] (c-73-185-129-58.hsd1.mn.comcast.net.
 [73.185.129.58])
 by smtp.googlemail.com with ESMTPSA id g12sm3532484iom.5.2020.01.27.06.09.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jan 2020 06:09:56 -0800 (PST)
To: SAURAV GIREPUNJE <saurav.girepunje@gmail.com>,
 Johan Hovold <johan@kernel.org>
References: <20200125084403.GA3386@google.com>
 <20200125100011.GK8375@localhost> <20200125121459.GA2792@google.com>
From: Alex Elder <elder@linaro.org>
Message-ID: <275d6509-ebd2-f00e-176d-abf97ae834da@linaro.org>
Date: Mon, 27 Jan 2020 08:10:02 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200125121459.GA2792@google.com>
Content-Language: en-US
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, vireshk@kernel.org, elder@kernel.org,
 linux-kernel@vger.kernel.org, greybus-dev@lists.linaro.org
Subject: Re: [greybus-dev] [PATCH] staging: greybus: bootrom: fix
 uninitialized variables
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

T24gMS8yNS8yMCA2OjE0IEFNLCBTQVVSQVYgR0lSRVBVTkpFIHdyb3RlOgo+IE9uIDI1LzAxLzIw
IDExOjAwICswMTAwLCBKb2hhbiBIb3ZvbGQgd3JvdGU6Cj4+IE9uIFNhdCwgSmFuIDI1LCAyMDIw
IGF0IDAyOjE0OjAzUE0gKzA1MzAsIFNhdXJhdiBHaXJlcHVuamUgd3JvdGU6Cj4+PiBmaXggdW5p
bml0aWFsaXplZCB2YXJpYWJsZXMgaXNzdWUgZm91bmQgdXNpbmcgc3RhdGljIGNvZGUgYW5hbHlz
aXMgdG9vbAo+Pgo+PiBXaGljaCB0b29sIGlzIHRoYXQ/Cj4+Cj4+PiAoZXJyb3IpIFVuaW5pdGlh
bGl6ZWQgdmFyaWFibGU6IG9mZnNldAo+Pj4gKGVycm9yKSBVbmluaXRpYWxpemVkIHZhcmlhYmxl
OiBzaXplCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogU2F1cmF2IEdpcmVwdW5qZSA8c2F1cmF2Lmdp
cmVwdW5qZUBnbWFpbC5jb20+Cj4+PiAtLS0KPj4+IMKgIGRyaXZlcnMvc3RhZ2luZy9ncmV5YnVz
L2Jvb3Ryb20uYyB8IDIgKy0KPj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwg
MSBkZWxldGlvbigtKQo+Pj4KPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1
cy9ib290cm9tLmMgYi9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9ib290cm9tLmMKPj4+IGluZGV4
IGE4ZWZiODYuLjllYWJlYjMgMTAwNjQ0Cj4+PiAtLS0gYS9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1
cy9ib290cm9tLmMKPj4+ICsrKyBiL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2Jvb3Ryb20uYwo+
Pj4gQEAgLTI0NSw3ICsyNDUsNyBAQCBzdGF0aWMgaW50IGdiX2Jvb3Ryb21fZ2V0X2Zpcm13YXJl
KHN0cnVjdCBnYl9vcGVyYXRpb24gKm9wKQo+Pj4gwqDCoMKgwqDCoCBzdHJ1Y3QgZ2JfYm9vdHJv
bV9nZXRfZmlybXdhcmVfcmVxdWVzdCAqZmlybXdhcmVfcmVxdWVzdDsKPj4+IMKgwqDCoMKgwqAg
c3RydWN0IGdiX2Jvb3Ryb21fZ2V0X2Zpcm13YXJlX3Jlc3BvbnNlICpmaXJtd2FyZV9yZXNwb25z
ZTsKPj4+IMKgwqDCoMKgwqAgc3RydWN0IGRldmljZSAqZGV2ID0gJm9wLT5jb25uZWN0aW9uLT5i
dW5kbGUtPmRldjsKPj4+IC3CoMKgwqAgdW5zaWduZWQgaW50IG9mZnNldCwgc2l6ZTsKPj4+ICvC
oMKgwqAgdW5zaWduZWQgaW50IG9mZnNldCA9IDAsIHNpemUgPSAwOwo+Pj4gwqDCoMKgwqDCoCBl
bnVtIG5leHRfcmVxdWVzdF90eXBlIG5leHRfcmVxdWVzdDsKPj4+IMKgwqDCoMKgwqAgaW50IHJl
dCA9IDA7Cj4+Cj4+IEkgdGhpbmsgdGhpcyBoYXMgY29tZSB1cCBpbiB0aGUgcGFzdCwgYW5kIHdo
aWxlIHRoZSBjb2RlIGluIHF1ZXN0aW9uIGlzCj4+IG92ZXJseSBjb21wbGljYXRlZCBhbmQgY29u
ZnVzZXMgc3RhdGljIGNoZWNrZXJzIGFzIHdlbGwgYXMgaHVtYW5zLCBpdAo+PiBsb29rcyBjb3Jy
ZWN0IHRvIG1lLgo+Pgo+PiBQbGVhc2UgbWFrZSBzdXJlIHRvIHZlcmlmeSB0aGUgb3V0cHV0IG9m
IGFueSB0b29scyBiZWZvcmUgcG9zdGluZwo+PiBwYXRjaGVzIGJhc2VkIG9uIHRoZW0uCj4+Cj4+
IEpvaGFuCj4gSSB1c2VkIGNwcGNoZWNrIHRvb2wgLgoKSW1wbGllZCBpbiBKb2hhbidzIHF1ZXN0
aW9uIGlzIGEgc3VnZ2VzdGlvbi4KCldoZW4geW91IHByb3Bvc2UgYSBwYXRjaCB0aGF0IGFkZHJl
c3NlcyBzb21ldGhpbmcgZmxhZ2dlZCBieSBhCnRvb2wgb2Ygc29tZSBraW5kLCBpdCBpcyBnb29k
IHByYWN0aWNlIHRvIGlkZW50aWZ5IHRoZSB0b29sIGluCnRoZSBwYXRjaCBkZXNjcmlwdGlvbiwg
YW5kIGV2ZW4gYmV0dGVyLCBnaXZlIGFuIGV4YW1wbGUgb2YgaG93CnRoZSB0b29sIHdhcyBpbnZv
a2VkIHdoZW4gcmVwb3J0ZWQgdGhlIHByb2JsZW0geW91J3JlIGZpeGluZy4KU29tZXRpbWVzIHBl
b3BsZSBldmVuIGluY2x1ZGUgdGhlIG91dHB1dCBvZiB0aGUgdG9vbCwgdGhvdWdoCkkgdGhpbmsg
dGhhdCBjYW4gc29tZXRpbWVzIGJlIGEgYml0IG11Y2guCgpBbmQgYXMgeW91IGhhdmUgbm93IGhl
YXJkIHNldmVyYWwgdGltZXMsIGRvIG5vdCBibGluZGx5IHRydXN0CnRoZSBvdXRwdXQgb2YgdGhl
c2UgdG9vbHMuICBUaGV5J3JlIGludGVuZGVkIHRvIGNhbGwgYXR0ZW50aW9uCnRvIHRoaW5ncyBm
b3IgeW91IHRvIGV4YW1pbmU7IHRoZXkgYXJlIG5vIG1hdGNoIGZvciBhIGh1bWFuLAphbmQgdGhp
bmdzIHRoZXkgdGVsbCB5b3UgYWJvdXQgYXJlIG5vdCBndWFyYW50ZWVkIHRvIGJlIHJlYWwKcHJv
YmxlbXMuCgoJCQkJCS1BbGV4Cgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fIAo+IGdyZXlidXMtZGV2IG1haWxpbmcgbGlzdAo+IGdyZXlidXMtZGV2QGxp
c3RzLmxpbmFyby5vcmcKPiBodHRwczovL2xpc3RzLmxpbmFyby5vcmcvbWFpbG1hbi9saXN0aW5m
by9ncmV5YnVzLWRldgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZ3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0CmdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5v
cmcKaHR0cHM6Ly9saXN0cy5saW5hcm8ub3JnL21haWxtYW4vbGlzdGluZm8vZ3JleWJ1cy1kZXYK
