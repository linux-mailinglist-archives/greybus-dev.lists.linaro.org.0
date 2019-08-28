Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id B4154A00E2
	for <lists+greybus-dev@lfdr.de>; Wed, 28 Aug 2019 13:42:28 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id E04066088F
	for <lists+greybus-dev@lfdr.de>; Wed, 28 Aug 2019 11:42:27 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id D50AB617E7; Wed, 28 Aug 2019 11:42:27 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
	ip-10-150-125-211.ec2.internal
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 0BD606162E;
	Wed, 28 Aug 2019 11:42:17 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id AFF5D6088F
 for <greybus-dev@lists.linaro.org>; Wed, 28 Aug 2019 11:42:14 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 99BE960BDE; Wed, 28 Aug 2019 11:42:14 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.linaro.org (Postfix) with ESMTPS id B75F36088F
 for <greybus-dev@lists.linaro.org>; Wed, 28 Aug 2019 11:42:13 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6349422CF8;
 Wed, 28 Aug 2019 11:42:12 +0000 (UTC)
Date: Wed, 28 Aug 2019 13:42:10 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Johan Hovold <johan@kernel.org>
Message-ID: <20190828114210.GB31462@kroah.com>
References: <20190828102859.13180-1-rui.silva@linaro.org>
 <20190828104726.GE13017@localhost>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190828104726.GE13017@localhost>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, greybus-dev@lists.linaro.org,
 Alex Elder <elder@kernel.org>, Rui Miguel Silva <rui.silva@linaro.org>,
 Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [greybus-dev] [PATCH] staging: greybus: fix more header includes
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

T24gV2VkLCBBdWcgMjgsIDIwMTkgYXQgMTI6NDc6MjZQTSArMDIwMCwgSm9oYW4gSG92b2xkIHdy
b3RlOgo+IE9uIFdlZCwgQXVnIDI4LCAyMDE5IGF0IDExOjI4OjU5QU0gKzAxMDAsIFJ1aSBNaWd1
ZWwgU2lsdmEgd3JvdGU6Cj4gPiBNb3JlIGhlYWRlcnMgbmVlZGVkIHRvIGJlIGZpeGVkIHdoZW4g
bW92aW5nIGdyZXlidXMgb3V0IG9mIHN0YWdpbmcgYW5kCj4gPiBlbmFibGluZyB0aGUgQ09NUElM
RV9URVNUIG9wdGlvbi4KPiA+IAo+ID4gUmVwb3J0ZWQtYnk6IGtidWlsZCB0ZXN0IHJvYm90IDxs
a3BAaW50ZWwuY29tPgo+ID4gU2lnbmVkLW9mZi1ieTogUnVpIE1pZ3VlbCBTaWx2YSA8cnVpLnNp
bHZhQGxpbmFyby5vcmc+Cj4gPiAtLS0KPiA+ICBpbmNsdWRlL2xpbnV4L2dyZXlidXMvb3BlcmF0
aW9uLmggfCAxICsKPiA+ICBpbmNsdWRlL2xpbnV4L2dyZXlidXMvc3ZjLmggICAgICAgfCAyICsr
Cj4gPiAgMiBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKPiA+IAo+ID4gZGlmZiAtLWdp
dCBhL2luY2x1ZGUvbGludXgvZ3JleWJ1cy9vcGVyYXRpb24uaCBiL2luY2x1ZGUvbGludXgvZ3Jl
eWJ1cy9vcGVyYXRpb24uaAo+ID4gaW5kZXggOGNhODY0YmJhMjNlLi5iZmJjNTZkOGQ4NjMgMTAw
NjQ0Cj4gPiAtLS0gYS9pbmNsdWRlL2xpbnV4L2dyZXlidXMvb3BlcmF0aW9uLmgKPiA+ICsrKyBi
L2luY2x1ZGUvbGludXgvZ3JleWJ1cy9vcGVyYXRpb24uaAo+ID4gQEAgLTE1LDYgKzE1LDcgQEAK
PiA+ICAjaW5jbHVkZSA8bGludXgvdHlwZXMuaD4KPiA+ICAjaW5jbHVkZSA8bGludXgvd29ya3F1
ZXVlLmg+Cj4gPiAgCj4gPiArI2luY2x1ZGUgImhkLmgiCj4gCj4gTm8gbmVlZCB0byBpbmNsdWRl
IGhkLmgsIHlvdSBvbmx5IG5lZWQgYSBmb3J3YXJkIGRlY2xhcmF0aW9uIG9mIHN0cnVjdAo+IGdi
X2hvc3RfZGV2aWNlLgo+IAo+ID4gIHN0cnVjdCBnYl9vcGVyYXRpb247Cj4gPiAgCj4gPiBkaWZm
IC0tZ2l0IGEvaW5jbHVkZS9saW51eC9ncmV5YnVzL3N2Yy5oIGIvaW5jbHVkZS9saW51eC9ncmV5
YnVzL3N2Yy5oCj4gPiBpbmRleCA1MDdmOGJkNGU0YzguLjExYTg2NTA0YzQyOSAxMDA2NDQKPiA+
IC0tLSBhL2luY2x1ZGUvbGludXgvZ3JleWJ1cy9zdmMuaAo+ID4gKysrIGIvaW5jbHVkZS9saW51
eC9ncmV5YnVzL3N2Yy5oCj4gPiBAQCAtMTIsNiArMTIsOCBAQAo+ID4gICNpbmNsdWRlIDxsaW51
eC90eXBlcy5oPgo+ID4gICNpbmNsdWRlIDxsaW51eC9kZXZpY2UuaD4KPiA+ICAKPiA+ICsjaW5j
bHVkZSAiZ3JleWJ1c19wcm90b2NvbHMuaCIKPiAKPiBTYW1lIGhlcmUsIG5vIG5lZWQgdG8gaW5j
bHVkZSBhbGwgdGhlIHByb3RvY29sIGRlZmluaXRpb25zIGZvciBzdHJ1Y3QKPiBnYl9zdmNfbDJf
dGltZXJfY2ZnLgoKSSBhZ3JlZSB3aXRoIEpvaGFuLCBqdXN0IGZvcndhcmQgZGVjbGFyZSB0aGVz
ZSB0aGluZ3MgYW5kIGFsbCBzaG91bGQgYmUKZmluZSBhbmQgbXVjaCBzaW1wbGVyLgoKdGhhbmtz
LAoKZ3JlZyBrLWgKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZ3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0CmdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcK
aHR0cHM6Ly9saXN0cy5saW5hcm8ub3JnL21haWxtYW4vbGlzdGluZm8vZ3JleWJ1cy1kZXYK
