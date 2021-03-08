Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F790331F78
	for <lists+greybus-dev@lfdr.de>; Tue,  9 Mar 2021 07:42:26 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 59AC766794
	for <lists+greybus-dev@lfdr.de>; Tue,  9 Mar 2021 06:42:25 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 4C79E66793; Tue,  9 Mar 2021 06:42:25 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE autolearn=disabled
	version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id AF59D667C5;
	Tue,  9 Mar 2021 06:39:42 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 67646617ED
 for <greybus-dev@lists.linaro.org>; Mon,  8 Mar 2021 16:42:10 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 4F7D0665AA; Mon,  8 Mar 2021 16:42:10 +0000 (UTC)
Received: from www381.your-server.de (www381.your-server.de [78.46.137.84])
 by lists.linaro.org (Postfix) with ESMTPS id 4D695617ED
 for <greybus-dev@lists.linaro.org>; Mon,  8 Mar 2021 16:42:09 +0000 (UTC)
Received: from sslproxy01.your-server.de ([78.46.139.224])
 by www381.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92.3) (envelope-from <lars@metafoo.de>)
 id 1lJIxL-0007HI-1U; Mon, 08 Mar 2021 17:42:07 +0100
Received: from [62.216.202.180] (helo=[192.168.178.20])
 by sslproxy01.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <lars@metafoo.de>)
 id 1lJIxK-000WTg-OM; Mon, 08 Mar 2021 17:42:06 +0100
To: Alexandru Ardelean <aardelean@deviqon.com>, linux-spi@vger.kernel.org,
 linux-kernel@vger.kernel.org, greybus-dev@lists.linaro.org,
 devel@driverdev.osuosl.org, linux-tegra@vger.kernel.org,
 bcm-kernel-feedback-list@broadcom.com
References: <20210308145502.1075689-1-aardelean@deviqon.com>
 <20210308145502.1075689-2-aardelean@deviqon.com>
From: Lars-Peter Clausen <lars@metafoo.de>
Message-ID: <8a6ec9a1-71f8-ce1d-600a-66eba9244a54@metafoo.de>
Date: Mon, 8 Mar 2021 17:42:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210308145502.1075689-2-aardelean@deviqon.com>
Content-Language: en-US
X-Authenticated-Sender: lars@metafoo.de
X-Virus-Scanned: Clear (ClamAV 0.102.4/26102/Mon Mar  8 13:03:13 2021)
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Tue, 09 Mar 2021 06:39:38 +0000
Cc: thierry.reding@gmail.com, elder@kernel.org, johan@kernel.org,
 jonathanh@nvidia.com, broonie@kernel.org, ldewangan@nvidia.com,
 vireshk@kernel.org, f.fainelli@gmail.com, linux@deviqon.com
Subject: Re: [greybus-dev] [PATCH 01/10] spi: spi-axi-spi-engine: remove
 usage of delay_usecs
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

T24gMy84LzIxIDM6NTQgUE0sIEFsZXhhbmRydSBBcmRlbGVhbiB3cm90ZToKPiBUaGUgJ2RlbGF5
X3VzZWNzJyBmaWVsZCB3YXMgaGFuZGxlZCBmb3IgYmFja3dhcmRzIGNvbXBhdGliaWxpdHkgaW4g
Y2FzZQo+IHRoZXJlIHdlcmUgc29tZSB1c2VycyB0aGF0IHN0aWxsIGNvbmZpZ3VyZWQgU1BJIGRl
bGF5IHRyYW5zZmVycyB3aXRoCj4gdGhpcyBmaWVsZC4KPgo+IFRoZXkgc2hvdWxkIGFsbCBiZSBy
ZW1vdmVkIGJ5IG5vdy4KPgo+IFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRydSBBcmRlbGVhbiA8YWFy
ZGVsZWFuQGRldmlxb24uY29tPgo+IC0tLQo+ICAgZHJpdmVycy9zcGkvc3BpLWF4aS1zcGktZW5n
aW5lLmMgfCAxMiArKysrLS0tLS0tLS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMo
KyksIDggZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9zcGkvc3BpLWF4aS1z
cGktZW5naW5lLmMgYi9kcml2ZXJzL3NwaS9zcGktYXhpLXNwaS1lbmdpbmUuYwo+IGluZGV4IGFm
ODZlNmQ2ZTE2Yi4uODBjM2UzOGY1YzFiIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvc3BpL3NwaS1h
eGktc3BpLWVuZ2luZS5jCj4gKysrIGIvZHJpdmVycy9zcGkvc3BpLWF4aS1zcGktZW5naW5lLmMK
PiBAQCAtMTcwLDE0ICsxNzAsMTAgQEAgc3RhdGljIHZvaWQgc3BpX2VuZ2luZV9nZW5fc2xlZXAo
c3RydWN0IHNwaV9lbmdpbmVfcHJvZ3JhbSAqcCwgYm9vbCBkcnksCj4gICAJdW5zaWduZWQgaW50
IHQ7Cj4gICAJaW50IGRlbGF5Owo+ICAgCj4gLQlpZiAoeGZlci0+ZGVsYXlfdXNlY3MpIHsKPiAt
CQlkZWxheSA9IHhmZXItPmRlbGF5X3VzZWNzOwo+IC0JfSBlbHNlIHsKPiAtCQlkZWxheSA9IHNw
aV9kZWxheV90b19ucygmeGZlci0+ZGVsYXksIHhmZXIpOwo+IC0JCWlmIChkZWxheSA8IDApCj4g
LQkJCXJldHVybjsKPiAtCQlkZWxheSAvPSAxMDAwOwo+IC0JfQo+ICsJZGVsYXkgPSBzcGlfZGVs
YXlfdG9fbnMoJnhmZXItPmRlbGF5LCB4ZmVyKTsKPiArCWlmIChkZWxheSA8IDApCj4gKwkJcmV0
dXJuOwoKQml0IG9mIGEgbml0LCBidXQgdGhpcyBjb3VsZCBiZSBgZGVsYXkgPD0gMGAgYW5kIHRo
ZW4gZHJvcCB0aGUgY2hlY2sgZm9yIApgZGVsYXkgPT0gMGAgYmVsb3cuCgo+ICsJZGVsYXkgLz0g
MTAwMDsKPiAgIAo+ICAgCWlmIChkZWxheSA9PSAwKQo+ICAgCQlyZXR1cm47CgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1kZXYgbWFpbGlu
ZyBsaXN0CmdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKaHR0cHM6Ly9saXN0cy5saW5hcm8u
b3JnL21haWxtYW4vbGlzdGluZm8vZ3JleWJ1cy1kZXYK
