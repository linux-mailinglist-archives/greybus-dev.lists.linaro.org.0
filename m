Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 45E5C159C66
	for <lists+greybus-dev@lfdr.de>; Tue, 11 Feb 2020 23:44:50 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 65A14608DF
	for <lists+greybus-dev@lfdr.de>; Tue, 11 Feb 2020 22:44:49 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 4C32861789; Tue, 11 Feb 2020 22:44:49 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_NONE,SPF_HELO_PASS autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 127AC60B4C;
	Tue, 11 Feb 2020 22:44:36 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 159C1608DF
 for <greybus-dev@lists.linaro.org>; Tue, 11 Feb 2020 22:44:34 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id F1326609E7; Tue, 11 Feb 2020 22:44:33 +0000 (UTC)
Received: from gateway32.websitewelcome.com (gateway32.websitewelcome.com
 [192.185.145.122])
 by lists.linaro.org (Postfix) with ESMTPS id E4A9D608DF
 for <greybus-dev@lists.linaro.org>; Tue, 11 Feb 2020 22:44:32 +0000 (UTC)
Received: from cm12.websitewelcome.com (cm12.websitewelcome.com [100.42.49.8])
 by gateway32.websitewelcome.com (Postfix) with ESMTP id 7E0635660A1
 for <greybus-dev@lists.linaro.org>;
 Tue, 11 Feb 2020 16:44:32 -0600 (CST)
Received: from gator4166.hostgator.com ([108.167.133.22]) by cmsmtp with SMTP
 id 1eGejJiXUvBMd1eGejdJVa; Tue, 11 Feb 2020 16:44:32 -0600
X-Authority-Reason: nr=8
Received: from [200.68.140.36] (port=22367 helo=[192.168.43.131])
 by gator4166.hostgator.com with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92)
 (envelope-from <gustavo@embeddedor.com>)
 id 1j1eGe-003Fzq-1q; Tue, 11 Feb 2020 16:44:32 -0600
To: Alex Elder <elder@linaro.org>, Johan Hovold <johan@kernel.org>,
 Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20200211211219.GA673@embeddedor>
 <e465ca6e-ed9f-4340-9f4c-104f9b6acb74@linaro.org>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Autocrypt: addr=gustavo@embeddedor.com; keydata=
 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
 VtSixD1uOgytAP7RWS474w==
Message-ID: <ebd179c5-29d6-4c86-e047-76815572fcf6@embeddedor.com>
Date: Tue, 11 Feb 2020 16:47:06 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <e465ca6e-ed9f-4340-9f4c-104f9b6acb74@linaro.org>
Content-Language: en-US
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.linaro.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 200.68.140.36
X-Source-L: No
X-Exim-ID: 1j1eGe-003Fzq-1q
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.43.131]) [200.68.140.36]:22367
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 11
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
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

CgpPbiAyLzExLzIwIDE2OjE1LCBBbGV4IEVsZGVyIHdyb3RlOgo+IE9uIDIvMTEvMjAgMzoxMiBQ
TSwgR3VzdGF2byBBLiBSLiBTaWx2YSB3cm90ZToKPj4gVGhlIGN1cnJlbnQgY29kZWJhc2UgbWFr
ZXMgdXNlIG9mIHRoZSB6ZXJvLWxlbmd0aCBhcnJheSBsYW5ndWFnZQo+PiBleHRlbnNpb24gdG8g
dGhlIEM5MCBzdGFuZGFyZCwgYnV0IHRoZSBwcmVmZXJyZWQgbWVjaGFuaXNtIHRvIGRlY2xhcmUK
Pj4gdmFyaWFibGUtbGVuZ3RoIHR5cGVzIHN1Y2ggYXMgdGhlc2Ugb25lcyBpcyBhIGZsZXhpYmxl
IGFycmF5IG1lbWJlclsxXVsyXSwKPj4gaW50cm9kdWNlZCBpbiBDOTk6Cj4+Cj4+IHN0cnVjdCBm
b28gewo+PiAgICAgICAgIGludCBzdHVmZjsKPj4gICAgICAgICBzdHJ1Y3QgYm9vIGFycmF5W107
Cj4+IH07Cj4+Cj4+IEJ5IG1ha2luZyB1c2Ugb2YgdGhlIG1lY2hhbmlzbSBhYm92ZSwgd2Ugd2ls
bCBnZXQgYSBjb21waWxlciB3YXJuaW5nCj4+IGluIGNhc2UgdGhlIGZsZXhpYmxlIGFycmF5IGRv
ZXMgbm90IG9jY3VyIGxhc3QgaW4gdGhlIHN0cnVjdHVyZSwgd2hpY2gKPj4gd2lsbCBoZWxwIHVz
IHByZXZlbnQgc29tZSBraW5kIG9mIHVuZGVmaW5lZCBiZWhhdmlvciBidWdzIGZyb20gYmVpbmcK
Pj4gaW5hZHZlcnRlbmx5IGludHJvZHVjZWRbM10gdG8gdGhlIGNvZGViYXNlIGZyb20gbm93IG9u
Lgo+Pgo+PiBUaGlzIGlzc3VlIHdhcyBmb3VuZCB3aXRoIHRoZSBoZWxwIG9mIENvY2NpbmVsbGUu
Cj4+Cj4+IFsxXSBodHRwczovL2djYy5nbnUub3JnL29ubGluZWRvY3MvZ2NjL1plcm8tTGVuZ3Ro
Lmh0bWwKPj4gWzJdIGh0dHBzOi8vZ2l0aHViLmNvbS9LU1BQL2xpbnV4L2lzc3Vlcy8yMQo+PiBb
M10gY29tbWl0IDc2NDk3NzMyOTMyZiAoImN4Z2IzL2wydDogRml4IHVuZGVmaW5lZCBiZWhhdmlv
dXIiKQo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBHdXN0YXZvIEEuIFIuIFNpbHZhIDxndXN0YXZvQGVt
YmVkZGVkb3IuY29tPgo+PiAtLS0KPj4gIGRyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL3Jhdy5jIHwg
MiArLQo+PiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4+
Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9yYXcuYyBiL2RyaXZlcnMv
c3RhZ2luZy9ncmV5YnVzL3Jhdy5jCj4+IGluZGV4IDgzOGFjYmU4NGNhMC4uMmIzMDFiMmFhMTA3
IDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9yYXcuYwo+PiArKysgYi9k
cml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9yYXcuYwo+PiBAQCAtMzAsNyArMzAsNyBAQCBzdHJ1Y3Qg
Z2JfcmF3IHsKPj4gIHN0cnVjdCByYXdfZGF0YSB7Cj4+ICAJc3RydWN0IGxpc3RfaGVhZCBlbnRy
eTsKPj4gIAl1MzIgbGVuOwo+PiAtCXU4IGRhdGFbMF07Cj4+ICsJdTggZGF0YVtdOwo+PiAgfTsK
Pj4gIAo+PiAgc3RhdGljIHN0cnVjdCBjbGFzcyAqcmF3X2NsYXNzOwo+Pgo+IAo+IERvZXMgdGhl
IGthbWxsb2MoKSBjYWxsIGluIHJlY2VpdmVfZGF0YSgpIGhhdmUgYW55IHByb2JsZW1zCj4gd2l0
aCB0aGUgc2l6ZW9mKCpyYXdfZGF0YSkgcGFzc2VkIGFzIGl0cyBhcmd1bWVudD8KPiAKCk5vdCBp
biB0aGlzIGNhc2UuIEl0J2QgYmUgZGlmZmVyZW50IHdpdGggYSBvbmUtZWxlbWVudCBhcnJheSAo
dTggZGF0YVsxXSksCnRob3VnaC4KCj4gSSdtIG5vdCBlbnRpcmVseSBzdXJlIHdoYXQgc2l6ZW9m
KHN0cnVjdC13aXRoLWZsZXhpYmxlLWFycmF5LW1lbWJlcikKPiBwcm9kdWNlcy4KPiAKClRoZSBz
YW1lIGFzIHNpemVvZihzdHJ1Y3Qtd2l0aC16ZXJvLWxlbmd0aC1hcnJheSk6CgoiRmxleGlibGUg
YXJyYXkgbWVtYmVycyBoYXZlIGluY29tcGxldGUgdHlwZSwgYW5kIHNvIHRoZSBzaXplb2Ygb3Bl
cmF0b3IKbWF5IG5vdCBiZSBhcHBsaWVkLiBBcyBhIHF1aXJrIG9mIHRoZSBvcmlnaW5hbCBpbXBs
ZW1lbnRhdGlvbiBvZgp6ZXJvLWxlbmd0aCBhcnJheXMsIHNpemVvZiBldmFsdWF0ZXMgdG8gemVy
by4iWzFdCgpbMV0gaHR0cHM6Ly9nY2MuZ251Lm9yZy9vbmxpbmVkb2NzL2djYy9aZXJvLUxlbmd0
aC5odG1sCgotLQpHdXN0YXZvCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmdyZXlidXMtZGV2IG1haWxpbmcgbGlzdApncmV5YnVzLWRldkBsaXN0cy5saW5h
cm8ub3JnCmh0dHBzOi8vbGlzdHMubGluYXJvLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2dyZXlidXMt
ZGV2Cg==
