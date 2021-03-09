Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id D76D9332608
	for <lists+greybus-dev@lfdr.de>; Tue,  9 Mar 2021 14:05:32 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 1056566015
	for <lists+greybus-dev@lfdr.de>; Tue,  9 Mar 2021 13:05:32 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 04831665B5; Tue,  9 Mar 2021 13:05:31 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 6516A6651C;
	Tue,  9 Mar 2021 13:05:17 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 4243766015
 for <greybus-dev@lists.linaro.org>; Tue,  9 Mar 2021 13:05:15 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 26622664E3; Tue,  9 Mar 2021 13:05:15 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.linaro.org (Postfix) with ESMTPS id 250E066015
 for <greybus-dev@lists.linaro.org>; Tue,  9 Mar 2021 13:05:14 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 809C765272;
 Tue,  9 Mar 2021 13:05:12 +0000 (UTC)
Date: Tue, 9 Mar 2021 14:05:10 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Alexandru Ardelean <aardelean@deviqon.com>
Message-ID: <YEdyhjayjbztoWI+@kroah.com>
References: <20210308145502.1075689-1-aardelean@deviqon.com>
 <20210308145502.1075689-7-aardelean@deviqon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210308145502.1075689-7-aardelean@deviqon.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, ldewangan@nvidia.com, elder@kernel.org,
 vireshk@kernel.org, broonie@kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, greybus-dev@lists.linaro.org,
 thierry.reding@gmail.com, bcm-kernel-feedback-list@broadcom.com,
 linux-tegra@vger.kernel.org, f.fainelli@gmail.com, johan@kernel.org,
 jonathanh@nvidia.com, linux@deviqon.com
Subject: Re: [greybus-dev] [PATCH 06/10] staging: greybus: spilib: use
 'spi_delay_to_ns' for getting xfer delay
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

T24gTW9uLCBNYXIgMDgsIDIwMjEgYXQgMDQ6NTQ6NThQTSArMDIwMCwgQWxleGFuZHJ1IEFyZGVs
ZWFuIHdyb3RlOgo+IFRoZSBpbnRlbnQgaXMgdGhlIHJlbW92YWwgb2YgdGhlICdkZWxheV91c2Vj
cycgZmllbGQgZnJvbSB0aGUKPiBzcGlfdHJhbnNmZXIgc3RydWN0LCBhcyB0aGVyZSBpcyBhICdk
ZWxheScgZmllbGQgdGhhdCBkb2VzIHRoZSBzYW1lCj4gdGhpbmcuCj4gCj4gVGhlIHNwaV9kZWxh
eV90b19ucygpIGNhbiBiZSB1c2VkIHRvIGdldCB0aGUgdHJhbnNmZXIgZGVsYXkuIEl0IHdvcmtz
IGJ5Cj4gdXNpbmcgdGhlICdkZWxheV91c2VjcycgZmllbGQgZmlyc3QgKGlmIGl0IGlzIG5vbi16
ZXJvKSwgYW5kIGZpbmFsbHkKPiB1c2VzIHRoZSAnZGVsYXknIGZpZWxkLgo+IAo+IFNpbmNlIHRo
ZSAnZGVsYXlfdXNlY3MnIGZpZWxkIGlzIGdvaW5nIGF3YXksIHRoaXMgY2hhbmdlIG1ha2VzIHVz
ZSBvZiB0aGUKPiBzcGlfZGVsYXlfdG9fbnMoKSBmdW5jdGlvbi4gVGhpcyBhbHNvIG1lYW5zIGRp
dmlkaW5nIHRoZSByZXR1cm4gdmFsdWUgb2YKPiB0aGUgZnVuY3Rpb24gYnkgMTAwMCwgdG8gY29u
dmVydCBpdCB0byBtaWNyb3NlY29uZHMuCj4gVG8gcHJldmVudCBhbnkgcG90ZW50aWFsIGZhdWx0
cyB3aGVuIGNvbnZlcnRpbmcgdG8gbWljcm9zZWNvbmRzIGFuZCBzaW5jZQo+IHRoZSByZXN1bHQg
b2Ygc3BpX2RlbGF5X3RvX25zKCkgaXMgaW50LCB0aGUgZGVsYXkgaXMgYmVpbmcgY29tcHV0ZWQg
aW4gMzIKPiBiaXRzIGFuZCB0aGVuIGNsYW1wZWQgYmV0d2VlbiAwICYgVTE2X01BWC4KPiAKPiBT
aWduZWQtb2ZmLWJ5OiBBbGV4YW5kcnUgQXJkZWxlYW4gPGFhcmRlbGVhbkBkZXZpcW9uLmNvbT4K
PiAtLS0KPiAgZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvc3BpbGliLmMgfCA1ICsrKystCj4gIDEg
ZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvc3BpbGliLmMgYi9kcml2ZXJzL3N0YWdpbmcv
Z3JleWJ1cy9zcGlsaWIuYwo+IGluZGV4IDY3MmQ1NDBkMzM2NS4uMzA2NTUxNTNkZjZhIDEwMDY0
NAo+IC0tLSBhL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL3NwaWxpYi5jCj4gKysrIGIvZHJpdmVy
cy9zdGFnaW5nL2dyZXlidXMvc3BpbGliLmMKPiBAQCAtMjQ1LDYgKzI0NSw3IEBAIHN0YXRpYyBz
dHJ1Y3QgZ2Jfb3BlcmF0aW9uICpnYl9zcGlfb3BlcmF0aW9uX2NyZWF0ZShzdHJ1Y3QgZ2Jfc3Bp
bGliICpzcGksCj4gIAkvKiBGaWxsIGluIHRoZSB0cmFuc2ZlcnMgYXJyYXkgKi8KPiAgCXhmZXIg
PSBzcGktPmZpcnN0X3hmZXI7Cj4gIAl3aGlsZSAobXNnLT5zdGF0ZSAhPSBHQl9TUElfU1RBVEVf
T1BfRE9ORSkgewo+ICsJCWludCB4ZmVyX2RlbGF5Owo+ICAJCWlmICh4ZmVyID09IHNwaS0+bGFz
dF94ZmVyKQo+ICAJCQl4ZmVyX2xlbiA9IHNwaS0+bGFzdF94ZmVyX3NpemU7Cj4gIAkJZWxzZQo+
IEBAIC0yNTksNyArMjYwLDkgQEAgc3RhdGljIHN0cnVjdCBnYl9vcGVyYXRpb24gKmdiX3NwaV9v
cGVyYXRpb25fY3JlYXRlKHN0cnVjdCBnYl9zcGlsaWIgKnNwaSwKPiAgCj4gIAkJZ2JfeGZlci0+
c3BlZWRfaHogPSBjcHVfdG9fbGUzMih4ZmVyLT5zcGVlZF9oeik7Cj4gIAkJZ2JfeGZlci0+bGVu
ID0gY3B1X3RvX2xlMzIoeGZlcl9sZW4pOwo+IC0JCWdiX3hmZXItPmRlbGF5X3VzZWNzID0gY3B1
X3RvX2xlMTYoeGZlci0+ZGVsYXlfdXNlY3MpOwo+ICsJCXhmZXJfZGVsYXkgPSBzcGlfZGVsYXlf
dG9fbnMoJnhmZXItPmRlbGF5LCB4ZmVyKSAvIDEwMDA7Cj4gKwkJeGZlcl9kZWxheSA9IGNsYW1w
X3QodTE2LCB4ZmVyX2RlbGF5LCAwLCBVMTZfTUFYKTsKPiArCQlnYl94ZmVyLT5kZWxheV91c2Vj
cyA9IGNwdV90b19sZTE2KHhmZXJfZGVsYXkpOwo+ICAJCWdiX3hmZXItPmNzX2NoYW5nZSA9IHhm
ZXItPmNzX2NoYW5nZTsKPiAgCQlnYl94ZmVyLT5iaXRzX3Blcl93b3JkID0geGZlci0+Yml0c19w
ZXJfd29yZDsKPiAgCgpBY2tlZC1ieTogR3JlZyBLcm9haC1IYXJ0bWFuIDxncmVna2hAbGludXhm
b3VuZGF0aW9uLm9yZz4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZ3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0CmdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5v
cmcKaHR0cHM6Ly9saXN0cy5saW5hcm8ub3JnL21haWxtYW4vbGlzdGluZm8vZ3JleWJ1cy1kZXYK
