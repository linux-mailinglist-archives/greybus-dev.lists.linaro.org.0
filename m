Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 283B31BE7FB
	for <lists+greybus-dev@lfdr.de>; Wed, 29 Apr 2020 22:01:18 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 4A5D36199D
	for <lists+greybus-dev@lfdr.de>; Wed, 29 Apr 2020 20:01:17 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 3F408619AC; Wed, 29 Apr 2020 20:01:17 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE autolearn=disabled
	version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 067B5619B0;
	Wed, 29 Apr 2020 20:00:59 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id DEA9A61999
 for <greybus-dev@lists.linaro.org>; Wed, 29 Apr 2020 20:00:54 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id C6E26619AC; Wed, 29 Apr 2020 20:00:54 +0000 (UTC)
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
 [209.85.166.67])
 by lists.linaro.org (Postfix) with ESMTPS id 5272461999
 for <greybus-dev@lists.linaro.org>; Wed, 29 Apr 2020 20:00:53 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id k6so3674581iob.3
 for <greybus-dev@lists.linaro.org>; Wed, 29 Apr 2020 13:00:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ivR/S7GYo6YmuHq6apeA7QKo7Gig9pWiDmfkfQ66UQQ=;
 b=eziRPyedwqmoRQWlHjUxSU9e3pOuCjcD335Dk3VQIa5aLSqFm47ejgCUIHnCNylP/m
 q8qbLcMPoGmO/F4nRQx7ZgJSHGV9dukfSWVSRtL3VDBf/e7wibqkTcaXH3ojqbdp83jw
 97luan8fISzELE5GdRytTK869M+3+12WMMsYJSMsaVR+upEIxe1/m2cT8iJXDtvOVQ3x
 4MiHqCEDlPRdiRNCzTKT2A+E1TeFvG2mif+a3M9EZBC5lUlLClPIC0g5vozNfUSFkqwe
 +irEu8dSu4SsKpXmZrctfO+L6nNrsFDMwzPKIFd5EeFLjZYNsMLnO3EdAJBGkbG2cMBa
 sK5w==
X-Gm-Message-State: AGi0Pub2yE09zEuR9Tjbi7o02T+V5Q+q7rxYC2vS2hxY468/Gj9Ho7h+
 DhhE173gIt8Au/1/JV+Hst/FqKby
X-Google-Smtp-Source: APiQypLJYlgIkzUo0VrI2MJoIfEiY2Izq72/hXtGKLGfgtFLlCE+J5AWZYav1XxM1Q3A0EtD0zh1AA==
X-Received: by 2002:a02:90cd:: with SMTP id c13mr31100201jag.83.1588190452552; 
 Wed, 29 Apr 2020 13:00:52 -0700 (PDT)
Received: from [172.22.22.26] (c-73-185-129-58.hsd1.mn.comcast.net.
 [73.185.129.58])
 by smtp.googlemail.com with ESMTPSA id v9sm1173063iol.28.2020.04.29.13.00.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Apr 2020 13:00:51 -0700 (PDT)
To: Arnd Bergmann <arnd@arndb.de>, David Lin <dtwlin@gmail.com>,
 Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Axel Haslam <ahaslam@baylibre.com>
References: <20200429190022.12671-1-arnd@arndb.de>
From: Alex Elder <elder@linaro.org>
Message-ID: <7146e1ca-1fc7-61ab-e798-7b017c7c974b@linaro.org>
Date: Wed, 29 Apr 2020 15:00:44 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200429190022.12671-1-arnd@arndb.de>
Content-Language: en-US
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, greybus-dev@lists.linaro.org,
 Greg Kroah-Hartman <gregkh@google.com>, linux-kernel@vger.kernel.org,
 Johan Hovold <johan@hovoldconsulting.com>
Subject: Re: [greybus-dev] [PATCH] greybus: uart: fix uninitialized flow
 control variable
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

T24gNC8yOS8yMCAyOjAwIFBNLCBBcm5kIEJlcmdtYW5uIHdyb3RlOgo+IGdjYy0xMCBwb2ludHMg
b3V0IGFuIHVuaW5pdGlhbGl6ZWQgdmFyaWFibGUgdXNlOgoKV293LCBuaWNlLCBjaGVja2luZyBp
bmRpdmlkdWFsIHVuaW5pdGlhbGl6ZWQgZmllbGRzIHdpdGhpbgp0aGUgc3RydWN0dXJlLgoKVGhl
IHN0cnVjdHVyZSBzaG91bGQgcmVhbGx5IGJlIHplcm8taW5pdGlhbGl6ZWQgYW55d2F5OyBpdCdz
CnBhc3NlZCBhcyBhIHN0cnVjdHVyZSBpbiBhIG1lc3NhZ2UgZWxzZXdoZXJlLiAgV2l0aCB5b3Vy
CmNoYW5nZSwgYWxsIGZpZWxkcyBpbiB0aGUgc3RydWN0dXJlIGFyZSB3cml0dGVuLCBidXQgaW4K
dGhlb3J5IHRoZSBzdHJ1Y3R1cmUgY291bGQgY2hhbmdlIGFuZCBzdGFjayBnYXJiYWdlIGNvdWxk
CmJlIHNlbnQgb3ZlciB0aGUgd2lyZS4KCldoYXQgZG8geW91IHRoaW5rIG9mIGRvaW5nIHRoaXMg
aW5zdGVhZD8gIE9yIGluIGFkZGl0aW9uPwoKICAgICAgICBzdHJ1Y3QgZ2JfdHR5X2xpbmVfY29k
aW5nIG5ld2xpbmUgPSB7IH07CgooUHJlc3VtYWJseSB0aGF0IHdvdWxkIGFsc28gc2lsZW5jZSB0
aGUgd2FybmluZy4pCgpJIGVuZG9yc2Ugb2YgeW91ciBjaGFuZ2UsIGVpdGhlciB3YXkuCgoJCQkJ
CS1BbGV4Cgo+IGRyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL3VhcnQuYzogSW4gZnVuY3Rpb24gJ2di
X3R0eV9zZXRfdGVybWlvcyc6Cj4gZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvdWFydC5jOjU0MDoy
NDogZXJyb3I6ICduZXdsaW5lLmZsb3dfY29udHJvbCcgaXMgdXNlZCB1bmluaXRpYWxpemVkIGlu
IHRoaXMgZnVuY3Rpb24gWy1XZXJyb3I9dW5pbml0aWFsaXplZF0KPiAgIDU0MCB8ICAgbmV3bGlu
ZS5mbG93X2NvbnRyb2wgfD0gR0JfU0VSSUFMX0FVVE9fUlRTQ1RTX0VOOwo+IAo+IEluc3RlYWQg
b2YgdXNpbmcgfD0gYW5kICY9IG9uIHRoZSB1bmluaXRpYWxpemVkIHZhcmlhYmxlLCB1c2UgYQo+
IGRpcmVjdCBhc3NpZ25tZW50Lgo+IAo+IEZpeGVzOiBlNTVjMjUyMDZkNWMgKCJncmV5YnVzOiB1
YXJ0OiBIYW5kbGUgQ1JUU0NUUyBmbGFnIGluIHRlcm1pb3MiKQo+IFNpZ25lZC1vZmYtYnk6IEFy
bmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+Cj4gLS0tCj4gIGRyaXZlcnMvc3RhZ2luZy9ncmV5
YnVzL3VhcnQuYyB8IDQgKystLQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAy
IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy91
YXJ0LmMgYi9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy91YXJ0LmMKPiBpbmRleCA1NWM1MTE0M2Ji
MDkuLjRmZmIzMzRjZDVjZCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy91
YXJ0LmMKPiArKysgYi9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy91YXJ0LmMKPiBAQCAtNTM3LDkg
KzUzNyw5IEBAIHN0YXRpYyB2b2lkIGdiX3R0eV9zZXRfdGVybWlvcyhzdHJ1Y3QgdHR5X3N0cnVj
dCAqdHR5LAo+ICAJfQo+ICAKPiAgCWlmIChDX0NSVFNDVFModHR5KSAmJiBDX0JBVUQodHR5KSAh
PSBCMCkKPiAtCQluZXdsaW5lLmZsb3dfY29udHJvbCB8PSBHQl9TRVJJQUxfQVVUT19SVFNDVFNf
RU47Cj4gKwkJbmV3bGluZS5mbG93X2NvbnRyb2wgPSBHQl9TRVJJQUxfQVVUT19SVFNDVFNfRU47
Cj4gIAllbHNlCj4gLQkJbmV3bGluZS5mbG93X2NvbnRyb2wgJj0gfkdCX1NFUklBTF9BVVRPX1JU
U0NUU19FTjsKPiArCQluZXdsaW5lLmZsb3dfY29udHJvbCA9IDA7Cj4gIAo+ICAJaWYgKG1lbWNt
cCgmZ2JfdHR5LT5saW5lX2NvZGluZywgJm5ld2xpbmUsIHNpemVvZihuZXdsaW5lKSkpIHsKPiAg
CQltZW1jcHkoJmdiX3R0eS0+bGluZV9jb2RpbmcsICZuZXdsaW5lLCBzaXplb2YobmV3bGluZSkp
Owo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZ3Jl
eWJ1cy1kZXYgbWFpbGluZyBsaXN0CmdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKaHR0cHM6
Ly9saXN0cy5saW5hcm8ub3JnL21haWxtYW4vbGlzdGluZm8vZ3JleWJ1cy1kZXYK
