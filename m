Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id B411D25E88B
	for <lists+greybus-dev@lfdr.de>; Sat,  5 Sep 2020 16:58:53 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 5DF5A6086F
	for <lists+greybus-dev@lfdr.de>; Sat,  5 Sep 2020 14:58:52 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 4E3956676A; Sat,  5 Sep 2020 14:58:52 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 3621B66767;
	Sat,  5 Sep 2020 14:58:41 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id D70C966757
 for <greybus-dev@lists.linaro.org>; Sat,  5 Sep 2020 14:58:38 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id BDB676086F; Sat,  5 Sep 2020 14:58:38 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.linaro.org (Postfix) with ESMTPS id 5FD186086F
 for <greybus-dev@lists.linaro.org>; Sat,  5 Sep 2020 14:58:37 +0000 (UTC)
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E11C6208B3;
 Sat,  5 Sep 2020 14:58:35 +0000 (UTC)
Date: Sat, 5 Sep 2020 16:58:55 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Johan Hovold <johan@kernel.org>
Message-ID: <20200905145855.GA102858@kroah.com>
References: <20200903015742.308765-1-yebin10@huawei.com>
 <20200905122719.GW21288@localhost>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200905122719.GW21288@localhost>
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: greybus-dev@lists.linaro.org, elder@kernel.org, Ye Bin <yebin10@huawei.com>
Subject: Re: [greybus-dev] [PATCH] staging: greybus: Fix NULL ptr reference
 in gb_bootrom_get_firmware
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

T24gU2F0LCBTZXAgMDUsIDIwMjAgYXQgMDI6Mjc6MTlQTSArMDIwMCwgSm9oYW4gSG92b2xkIHdy
b3RlOgo+IE9uIFRodSwgU2VwIDAzLCAyMDIwIGF0IDA5OjU3OjQyQU0gKzA4MDAsIFllIEJpbiB3
cm90ZToKPiA+IEluIGdiX2Jvb3Ryb21fZ2V0X2Zpcm13YXJlIGZ1bnRpb24gZncgbWF5YmUgbnVs
bCwgd2UgbXVzdCB0ZXN0IGl0IGJlZm9yZQo+ID4gdXNlIGl0Lgo+IAo+IE5vLCBmdyB3aWxsIG5l
dmVyIGJlIE5VTEwgd2hlbiByZXQgaXMgemVybyBzbyB0aGUgY3VycmVudCBjb2RlIGlzCj4gY29y
cmVjdC4KPiAKPiBHcmVnLCBwbGVhc2UgZHJvcCB0aGlzIG9uZSBmcm9tIHlvdXIgdGVzdGluZyBi
cmFuY2guCj4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBZZSBCaW4gPHllYmluMTBAaHVhd2VpLmNvbT4K
PiA+IC0tLQo+ID4gIGRyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2Jvb3Ryb20uYyB8IDIgKy0KPiA+
ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiA+IAo+ID4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2Jvb3Ryb20uYyBiL2RyaXZlcnMv
c3RhZ2luZy9ncmV5YnVzL2Jvb3Ryb20uYwo+ID4gaW5kZXggYThlZmI4NmRlMTQwLi5lMTU3M2E1
ZmViZjAgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9ib290cm9tLmMK
PiA+ICsrKyBiL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2Jvb3Ryb20uYwo+ID4gQEAgLTI5OCw3
ICsyOTgsNyBAQCBzdGF0aWMgaW50IGdiX2Jvb3Ryb21fZ2V0X2Zpcm13YXJlKHN0cnVjdCBnYl9v
cGVyYXRpb24gKm9wKQo+ID4gIAo+ID4gIHF1ZXVlX3dvcms6Cj4gPiAgCS8qIFJlZnJlc2ggdGlt
ZW91dCAqLwo+ID4gLQlpZiAoIXJldCAmJiAob2Zmc2V0ICsgc2l6ZSA9PSBmdy0+c2l6ZSkpCj4g
PiArCWlmICghcmV0ICYmIGZ3ICYmIChvZmZzZXQgKyBzaXplID09IGZ3LT5zaXplKSkKCkFoLCBt
aXNzZWQgdGhhdCByZXQgd291bGQgYmUgY2hlY2tlZCBmaXJzdCBoZXJlLCB0aGFua3MgZm9yIGNh
dGNoaW5nCnRoYXQuCgpOb3cgZHJvcHBlZC4KCmdyZWcgay1oCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmdyZXlidXMtZGV2IG1haWxpbmcgbGlzdApncmV5
YnVzLWRldkBsaXN0cy5saW5hcm8ub3JnCmh0dHBzOi8vbGlzdHMubGluYXJvLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2dyZXlidXMtZGV2Cg==
