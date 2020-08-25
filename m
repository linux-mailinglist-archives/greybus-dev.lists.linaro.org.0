Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id E4E71250E59
	for <lists+greybus-dev@lfdr.de>; Tue, 25 Aug 2020 03:44:35 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 1C43761868
	for <lists+greybus-dev@lfdr.de>; Tue, 25 Aug 2020 01:44:35 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 0C6CE60EFE; Tue, 25 Aug 2020 01:44:35 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FROM,MAILING_LIST_MULTI,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 63CFD60EFE;
	Tue, 25 Aug 2020 01:44:20 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 002E9608DD
 for <greybus-dev@lists.linaro.org>; Tue, 25 Aug 2020 01:44:18 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id E795960D73; Tue, 25 Aug 2020 01:44:17 +0000 (UTC)
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
 [209.85.222.196])
 by lists.linaro.org (Postfix) with ESMTPS id 96D0B608DD
 for <greybus-dev@lists.linaro.org>; Tue, 25 Aug 2020 01:44:16 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id o12so4976064qki.13
 for <greybus-dev@lists.linaro.org>; Mon, 24 Aug 2020 18:44:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fe927XpL2PIePdhPHFFj/u8541ev56/XnVnreXE8fcA=;
 b=QeeGu0aZtzoJ8ks/nx1F/49qHvSP8+F7hchj2JGrxVehYtyGx4M/0KT9ICGJX79+OX
 PuErLNzFpz7JYvXDqnY17P9oh6QeqSGxjFm8R611La+5ngz8dogPfAQQZy1fvuZxolYa
 ckXhamsaaIURkz9oMo5tMP60L3skDnJEBa+MsXSo7SaDwXLDlo2KeWQkY32/5HniNT79
 D8W4IAl3BnIwoGgCNLqvYB8bpDaUP2VzlPmqOjZbaXPw5vCQ+TnIK2XlSE6w7trdZK5U
 mA/Ly7k5ZAbpZa+flM8lsjOacdHphuTulnqV8XT42brpBz9ulwTlB6WKk8baILPo2egw
 KccA==
X-Gm-Message-State: AOAM5331L6g8od8m62I+015zyKh1in2jmwFw2ylDxKDGe32A+j7TLx2e
 +KMYWJMtH9+6W/K7SpyjWkQ=
X-Google-Smtp-Source: ABdhPJxfn+TI8Y9xjJ/3Gk+yyNnj1KyvdpFFZDtO8DBbk/jj8iJP37pLpb5GHc24Due3eBVDeYBEQA==
X-Received: by 2002:a37:98d:: with SMTP id 135mr7246102qkj.384.1598319856217; 
 Mon, 24 Aug 2020 18:44:16 -0700 (PDT)
Received: from [192.168.1.46] (c-73-88-245-53.hsd1.tn.comcast.net.
 [73.88.245.53])
 by smtp.gmail.com with ESMTPSA id u16sm6625694qkm.121.2020.08.24.18.44.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Aug 2020 18:44:15 -0700 (PDT)
To: Vaishnav M A <vaishnav@beagleboard.org>, greybus-dev@lists.linaro.org,
 linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org, arnd@arndb.de,
 johan@kernel.org, elder@kernel.org,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
References: <20200818124815.11029-1-vaishnav@beagleboard.org>
 <d53f0014-db7c-902c-70c7-eacac41cc6ed@gmail.com>
From: Frank Rowand <frowand.list@gmail.com>
Message-ID: <cc4fc632-caf0-93d8-804f-431ec053133d@gmail.com>
Date: Mon, 24 Aug 2020 20:44:13 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <d53f0014-db7c-902c-70c7-eacac41cc6ed@gmail.com>
Content-Language: en-US
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: rajkovic@mikroe.com, robh@kernel.org, mchehab+huawei@kernel.org,
 robertcnelson@beagleboard.org, drew@beagleboard.org, davem@davemloft.net,
 zoran.stojsavljevic@gmail.com
Subject: Re: [greybus-dev] [RFC PATCH v2 0/3] mikroBUS driver for add-on
	boards
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

SGkgVmFpc2huYXYsCgpBcG9sb2dpZXMgaW4gYWR2YW5jZSAtLSBJIGV4cGVjdCB0byBiZSB2ZXJ5
IHNsb3cgaW4gcmVzcG9uZGluZyB0aGlzCndlZWsuICBMaW51eCBQbHVtYmVycyB3aWxsIHRha2Ug
c29tZSBvZiBteSB0aW1lIGFuZCBJIGFtIG1vdmluZyB0bwphIG5ldyBob21lLgoKLUZyYW5rCgoK
T24gMjAyMC0wOC0xOCAxNTozOCwgRnJhbmsgUm93YW5kIHdyb3RlOgo+IEhpIFZhaXNobmF2LAo+
IAo+ICttZSArZGV2aWNldHJlZQo+IAo+IFBsZWFzZSBhZGQgdGhlc2UgdHdvIHJlY2lwaWVudHMg
dG8gZnV0dXJlIHZlcnNpb25zLgo+IAo+IEkgd2lsbCBjb21tZW50IG1vcmUgYWZ0ZXIgcmVhZGlu
ZyB0aGUgZmlyc3QgdmVyc2lvbiBhbmQgdjIuCj4gCj4gLUZyYW5rCj4gCj4gCj4gT24gMjAyMC0w
OC0xOCAwNzo0OCwgVmFpc2huYXYgTSBBIHdyb3RlOgo+PiBIaSwKPj4KPj4gVGhpcyBQYXRjaCBz
ZXJpZXMgaXMgYW4gdXBkYXRlIHRvIHRoZSBtaWtyb0JVUyBkcml2ZXIKPj4gUkZDIHYxIFBhdGNo
IDogaHR0cHM6Ly9sa21sLm9yZy9sa21sLzIwMjAvNy8yNC81MTggLgo+PiBUaGUgbWlrcm9idXMg
ZHJpdmVyIGlzIHVwZGF0ZWQgdG8gYWRkIG1pa3JvYnVzIHBvcnRzIGZyb20gZGV2aWNlLXRyZWUK
Pj4gb3ZlcmxheXMsIHRoZSBkZWJ1ZyBpbnRlcmZhY2VzIGZvciBhZGRpbmcgbWlrcm9idXMgcG9y
dHMgdGhyb3VnaCBzeXNGUwo+PiBpcyByZW1vdmVkLCBhbmQgdGhlIGRyaXZlciBjb25zaWRlcnMg
dGhlIGV4dGVuZGVkIHVzYWdlIG9mIG1pa3JvYnVzCj4+IHBvcnQgcGlucyBmcm9tIHRoZWlyIHN0
YW5kYXJkIHB1cnBvc2VzLgo+Pgo+PiBjaGFuZ2UgbG9nOgo+PiAgICAgICAgIHYyOiBzdXBwb3J0
IGZvciBhZGRpbmcgbWlrcm9CVVMgcG9ydHMgZnJvbSBEVCBvdmVybGF5cywKPj4gICAgICAgICBy
ZW1vdmUgZGVidWcgc3lzRlMgaW50ZXJmYWNlIGZvciBhZGRpbmcgbWlrcm9idXMgcG9ydHMsCj4+
ICAgICAgICAgY29uc2lkZXIgZXh0ZW5kZWQgcGluIHVzYWdlL2RldmlhdGlvbnMgZnJvbSBtaWty
b2J1cyBzdGFuZGFyZAo+PiAgICAgICAgIHNwZWNpZmljYXRpb25zLAo+PiAgICAgICAgIHVzZSBn
cmV5YnVzIENQb3J0IHByb3RvY29sIGVudW0gaW5zdGVhZCBvZiBuZXcgcHJvdGNvbCBlbnVtcwo+
PiAgICAgICAgIEZpeCBjYXNlcyBvZiB3cm9uZyBpbmRlbmRhdGlvbiwgaWdub3JpbmcgcmV0dXJu
IHZhbHVlcywgZnJlZWluZwo+PiAgICAgICAgIGFsbG9jYXRlZCByZXNvdXJjZXMgaW4gY2FzZSBv
ZiBlcnJvcnMgYW5kIG90aGVyIHN0eWxlIHN1Z2dlc3Rpb25zCj4+ICAgICAgICAgaW4gdjEgcmV2
aWV3Lgo+Pgo+PiBWYWlzaG5hdiBNIEEgKDMpOgo+PiAgIGFkZCBtaWtyb2J1cyBkZXNjcmlwdG9y
cyB0byBncmV5YnVzX21hbmlmZXN0Cj4+ICAgbWlrcm9CVVMgZHJpdmVyIGZvciBhZGQtb24gYm9h
cmRzIG9uIG1pa3JvYnVzIHBvcnRzCj4+ICAgQWRkIERldmljZSBUcmVlIEJpbmRpbmdzIGZvciBt
aWtyb0JVUyBwb3J0Cj4+Cj4+ICAuLi4vYmluZGluZ3MvbWlzYy9saW51eCxtaWtyb2J1cy50eHQg
ICAgICAgICAgfCAgODEgKysKPj4gIE1BSU5UQUlORVJTICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICB8ICAgNiArCj4+ICBkcml2ZXJzL21pc2MvS2NvbmZpZyAgICAgICAgICAgICAg
ICAgICAgICAgICAgfCAgIDEgKwo+PiAgZHJpdmVycy9taXNjL01ha2VmaWxlICAgICAgICAgICAg
ICAgICAgICAgICAgIHwgICAxICsKPj4gIGRyaXZlcnMvbWlzYy9taWtyb2J1cy9LY29uZmlnICAg
ICAgICAgICAgICAgICB8ICAxNiArCj4+ICBkcml2ZXJzL21pc2MvbWlrcm9idXMvTWFrZWZpbGUg
ICAgICAgICAgICAgICAgfCAgIDcgKwo+PiAgZHJpdmVycy9taXNjL21pa3JvYnVzL21pa3JvYnVz
X2NvcmUuYyAgICAgICAgIHwgNjkyICsrKysrKysrKysrKysrKysrKwo+PiAgZHJpdmVycy9taXNj
L21pa3JvYnVzL21pa3JvYnVzX2NvcmUuaCAgICAgICAgIHwgMTkxICsrKysrCj4+ICBkcml2ZXJz
L21pc2MvbWlrcm9idXMvbWlrcm9idXNfbWFuaWZlc3QuYyAgICAgfCA0NDQgKysrKysrKysrKysK
Pj4gIGRyaXZlcnMvbWlzYy9taWtyb2J1cy9taWtyb2J1c19tYW5pZmVzdC5oICAgICB8ICAyMSAr
Cj4+ICBkcml2ZXJzL21pc2MvbWlrcm9idXMvbWlrcm9idXNfcG9ydC5jICAgICAgICAgfCAxNzEg
KysrKysKPj4gIGluY2x1ZGUvbGludXgvZ3JleWJ1cy9ncmV5YnVzX21hbmlmZXN0LmggICAgICB8
ICA0NyArKwo+PiAgMTIgZmlsZXMgY2hhbmdlZCwgMTY3OCBpbnNlcnRpb25zKCspCj4+ICBjcmVh
dGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21pc2MvbGlu
dXgsbWlrcm9idXMudHh0Cj4+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9taXNjL21pa3Jv
YnVzL0tjb25maWcKPj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL21pc2MvbWlrcm9idXMv
TWFrZWZpbGUKPj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL21pc2MvbWlrcm9idXMvbWlr
cm9idXNfY29yZS5jCj4+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9taXNjL21pa3JvYnVz
L21pa3JvYnVzX2NvcmUuaAo+PiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvbWlzYy9taWty
b2J1cy9taWtyb2J1c19tYW5pZmVzdC5jCj4+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9t
aXNjL21pa3JvYnVzL21pa3JvYnVzX21hbmlmZXN0LmgKPj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBk
cml2ZXJzL21pc2MvbWlrcm9idXMvbWlrcm9idXNfcG9ydC5jCj4+Cj4gCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpncmV5YnVzLWRldiBtYWlsaW5nIGxp
c3QKZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpodHRwczovL2xpc3RzLmxpbmFyby5vcmcv
bWFpbG1hbi9saXN0aW5mby9ncmV5YnVzLWRldgo=
