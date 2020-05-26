Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 880391E1B5C
	for <lists+greybus-dev@lfdr.de>; Tue, 26 May 2020 08:33:57 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id AFB11618F4
	for <lists+greybus-dev@lfdr.de>; Tue, 26 May 2020 06:33:56 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id A09A5619D7; Tue, 26 May 2020 06:33:56 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id B6C0965F7F;
	Tue, 26 May 2020 06:33:40 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id DCE0B618F4
 for <greybus-dev@lists.linaro.org>; Tue, 26 May 2020 06:33:38 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id D0743619D9; Tue, 26 May 2020 06:33:38 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.linaro.org (Postfix) with ESMTPS id 9514D618F4
 for <greybus-dev@lists.linaro.org>; Tue, 26 May 2020 06:33:37 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 493922073B;
 Tue, 26 May 2020 06:33:36 +0000 (UTC)
Date: Tue, 26 May 2020 08:33:34 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
Message-ID: <20200526063334.GB2578492@kroah.com>
References: <20200525182608.1823735-1-kw@linux.com>
 <20200525182608.1823735-2-kw@linux.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200525182608.1823735-2-kw@linux.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: Ulf Hansson <ulf.hansson@linaro.org>, linux-pci@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Pavel Machek <pavel@ucw.cz>,
 linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org,
 Kevin Hilman <khilman@kernel.org>, Julian Wiedmann <jwi@linux.ibm.com>,
 linux-acpi@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 Dan Carpenter <dan.carpenter@oracle.com>, Len Brown <lenb@kernel.org>,
 linux-pm@vger.kernel.org, "James E.J. Bottomley" <jejb@linux.ibm.com>,
 Ursula Braun <ubraun@linux.ibm.com>, Johan Hovold <johan@kernel.org>,
 greybus-dev@lists.linaro.org, John Stultz <john.stultz@linaro.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Felipe Balbi <balbi@kernel.org>,
 Alex Elder <elder@kernel.org>,
 "Martin K. Petersen" <martin.petersen@oracle.com>, netdev@vger.kernel.org,
 linux-usb@vger.kernel.org, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Karsten Graul <kgraul@linux.ibm.com>, "David S. Miller" <davem@davemloft.net>
Subject: Re: [greybus-dev] [PATCH 1/8] driver core: Add helper for accessing
 Power Management callbacs
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

T24gTW9uLCBNYXkgMjUsIDIwMjAgYXQgMDY6MjY6MDFQTSArMDAwMCwgS3J6eXN6dG9mIFdpbGN6
ecWEc2tpIHdyb3RlOgo+IEFkZCBkcml2ZXJfdG9fcG0oKSBoZWxwZXIgYWxsb3dpbmcgZm9yIGFj
Y2Vzc2luZyB0aGUgUG93ZXIgTWFuYWdlbWVudAo+IGNhbGxiYWNzIGZvciBhIHBhcnRpY3VsYXIg
ZGV2aWNlLiAgQWNjZXNzIHRvIHRoZSBjYWxsYmFjcyAoc3RydWN0Cj4gZGV2X3BtX29wcykgaXMg
bm9ybWFsbHkgZG9uZSB0aHJvdWdoIHVzaW5nIHRoZSBwbSBwb2ludGVyIHRoYXQgaXMKPiBlbWJl
ZGRlZCB3aXRoaW4gdGhlIGRldmljZV9kcml2ZXIgc3RydWN0Lgo+IAo+IEhlbHBlciBhbGxvd3Mg
Zm9yIHRoZSBjb2RlIHJlcXVpcmVkIHRvIHJlZmVyZW5jZSB0aGUgcG0gcG9pbnRlciBhbmQKPiBh
Y2Nlc3MgUG93ZXIgTWFuYWdlbWVudCBjYWxsYmFzIHRvIGJlIHNpbXBsaWZpZWQuICBDaGFuZ2lu
ZyB0aGUKPiBmb2xsb3dpbmc6Cj4gCj4gICBzdHJ1Y3QgZGV2aWNlX2RyaXZlciAqZHJ2ID0gZGV2
LT5kcml2ZXI7Cj4gICBpZiAoZGV2LT5kcml2ZXIgJiYgZGV2LT5kcml2ZXItPnBtICYmIGRldi0+
ZHJpdmVyLT5wbS0+cHJlcGFyZSkgewo+ICAgICAgIGludCByZXQgPSBkZXYtPmRyaXZlci0+cG0t
PnByZXBhcmUoZGV2KTsKPiAKPiBUbzoKPiAKPiAgIGNvbnN0IHN0cnVjdCBkZXZfcG1fb3BzICpw
bSA9IGRyaXZlcl90b19wbShkZXYtPmRyaXZlcik7Cj4gICBpZiAocG0gJiYgcG0tPnByZXBhcmUp
IHsKPiAgICAgICBpbnQgcmV0ID0gcG0tPnByZXBhcmUoZGV2KTsKPiAKPiBPciwgY2hhbmdpbmcg
dGhlIGZvbGxvd2luZzoKPiAKPiAgICAgIGNvbnN0IHN0cnVjdCBkZXZfcG1fb3BzICpwbSA9IGRl
di0+ZHJpdmVyID8gZGV2LT5kcml2ZXItPnBtIDogTlVMTDsKPiAKPiBUbzoKPiAgICAgIGNvbnN0
IHN0cnVjdCBkZXZfcG1fb3BzICpwbSA9IGRyaXZlcl90b19wbShkZXYtPmRyaXZlcik7Cj4gCj4g
U2lnbmVkLW9mZi1ieTogS3J6eXN6dG9mIFdpbGN6ecWEc2tpIDxrd0BsaW51eC5jb20+Cj4gLS0t
Cj4gIGluY2x1ZGUvbGludXgvZGV2aWNlL2RyaXZlci5oIHwgMTUgKysrKysrKysrKysrKysrCj4g
IDEgZmlsZSBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2luY2x1
ZGUvbGludXgvZGV2aWNlL2RyaXZlci5oIGIvaW5jbHVkZS9saW51eC9kZXZpY2UvZHJpdmVyLmgK
PiBpbmRleCBlZTdiYTViNTQxN2UuLmNjZDBiMzE1ZmQ5MyAxMDA2NDQKPiAtLS0gYS9pbmNsdWRl
L2xpbnV4L2RldmljZS9kcml2ZXIuaAo+ICsrKyBiL2luY2x1ZGUvbGludXgvZGV2aWNlL2RyaXZl
ci5oCj4gQEAgLTIzNiw2ICsyMzYsMjEgQEAgZHJpdmVyX2ZpbmRfZGV2aWNlX2J5X2FjcGlfZGV2
KHN0cnVjdCBkZXZpY2VfZHJpdmVyICpkcnYsIGNvbnN0IHZvaWQgKmFkZXYpCj4gIH0KPiAgI2Vu
ZGlmCj4gIAo+ICsvKioKPiArICogZHJpdmVyX3RvX3BtIC0gUmV0dXJuIFBvd2VyIE1hbmFnZW1l
bnQgY2FsbGJhY3MgKHN0cnVjdCBkZXZfcG1fb3BzKSBmb3IKPiArICogICAgICAgICAgICAgICAg
YSBwYXJ0aWN1bGFyIGRldmljZS4KPiArICogQGRydjogUG9pbnRlciB0byBhIGRldmljZSAoc3Ry
dWN0IGRldmljZV9kcml2ZXIpIGZvciB3aGljaCB5b3Ugd2FudCB0byBhY2Nlc3MKPiArICogICAg
ICAgdGhlIFBvd2VyIE1hbmFnZW1lbnQgY2FsbGJhY2tzLgo+ICsgKgo+ICsgKiBSZXR1cm5zIGEg
cG9pbnRlciB0byB0aGUgc3RydWN0IGRldl9wbV9vcHMgZW1iZWRkZWQgd2l0aGluIHRoZSBkZXZp
Y2UgKHN0cnVjdAo+ICsgKiBkZXZpY2VfZHJpdmVyKSwgb3IgcmV0dXJucyBOVUxMIGlmIFBvd2Vy
IE1hbmFnZW1lbnQgaXMgbm90IHByZXNlbnQgYW5kIHRoZQo+ICsgKiBwb2ludGVyIGlzIG5vdCB2
YWxpZC4KPiArICovCj4gK3N0YXRpYyBpbmxpbmUgY29uc3Qgc3RydWN0IGRldl9wbV9vcHMgKmRy
aXZlcl90b19wbShzdHJ1Y3QgZGV2aWNlX2RyaXZlciAqZHJ2KQo+ICt7Cj4gKwlyZXR1cm4gZHJ2
ICYmIGRydi0+cG0gPyBkcnYtPnBtIDogTlVMTDsKCkkgaGF0ZSA/IDogbGluZXMgd2l0aCBhIHBh
c3Npb24sIGFzIHRoZXkgYnJlYWsgbm9ybWFsIHBhdHRlcm4gbWF0dGNoaW5nCmluIG15IGJyYWlu
LiAgUGxlYXNlIGp1c3Qgc3BlbGwgdGhpcyBhbGwgb3V0OgoJaWYgKGRydiAmJiBkcnYtPnBtKQoJ
CXJldHVybiBkcnYtPnBtOwoJcmV0dXJuIE5VTEw7CgpNdWNoIGVhc2llciB0byByZWFkLCBhbmQg
dGhlIGNvbXBpbGVyIHdpbGwgZG8gdGhlIGV4YWN0IHNhbWUgdGhpbmcuCgpPbmx5IHBsYWNlID8g
OiBhcmUgb2sgdG8gdXNlIGluIG15IG9waW5pb24sIGFyZSBhcyBmdW5jdGlvbiBhcmd1bWVudHMu
Cgp0aGFua3MsCgpncmVnIGstaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpncmV5YnVzLWRldiBtYWlsaW5nIGxpc3QKZ3JleWJ1cy1kZXZAbGlzdHMubGlu
YXJvLm9yZwpodHRwczovL2xpc3RzLmxpbmFyby5vcmcvbWFpbG1hbi9saXN0aW5mby9ncmV5YnVz
LWRldgo=
