Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 243801E1B6C
	for <lists+greybus-dev@lfdr.de>; Tue, 26 May 2020 08:35:57 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 4C58C619D7
	for <lists+greybus-dev@lfdr.de>; Tue, 26 May 2020 06:35:56 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 3D1DA65F80; Tue, 26 May 2020 06:35:56 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 5A14365F7F;
	Tue, 26 May 2020 06:35:42 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 65A82618F4
 for <greybus-dev@lists.linaro.org>; Tue, 26 May 2020 06:35:38 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 5816765F80; Tue, 26 May 2020 06:35:38 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.linaro.org (Postfix) with ESMTPS id 27BAA618F4
 for <greybus-dev@lists.linaro.org>; Tue, 26 May 2020 06:35:24 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EF9752068D;
 Tue, 26 May 2020 06:35:22 +0000 (UTC)
Date: Tue, 26 May 2020 08:35:21 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
Message-ID: <20200526063521.GC2578492@kroah.com>
References: <20200525182608.1823735-1-kw@linux.com>
 <20200525182608.1823735-9-kw@linux.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200525182608.1823735-9-kw@linux.com>
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
Subject: Re: [greybus-dev] [PATCH 8/8] net/iucv: Use the new device_to_pm()
 helper to access struct dev_pm_ops
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

T24gTW9uLCBNYXkgMjUsIDIwMjAgYXQgMDY6MjY6MDhQTSArMDAwMCwgS3J6eXN6dG9mIFdpbGN6
ecWEc2tpIHdyb3RlOgo+IFVzZSB0aGUgbmV3IGRldmljZV90b19wbSgpIGhlbHBlciB0byBhY2Nl
c3MgUG93ZXIgTWFuYWdlbWVudCBjYWxsYmFjcwo+IChzdHJ1Y3QgZGV2X3BtX29wcykgZm9yIGEg
cGFydGljdWxhciBkZXZpY2UgKHN0cnVjdCBkZXZpY2VfZHJpdmVyKS4KPiAKPiBObyBmdW5jdGlv
bmFsIGNoYW5nZSBpbnRlbmRlZC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBLcnp5c3p0b2YgV2lsY3p5
xYRza2kgPGt3QGxpbnV4LmNvbT4KPiAtLS0KPiAgbmV0L2l1Y3YvaXVjdi5jIHwgMzAgKysrKysr
KysrKysrKysrKysrLS0tLS0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxOCBpbnNlcnRpb25z
KCspLCAxMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvbmV0L2l1Y3YvaXVjdi5jIGIv
bmV0L2l1Y3YvaXVjdi5jCj4gaW5kZXggOWEyZDAyMzg0MmZlLi4xYTMwMjlhYjdjMWYgMTAwNjQ0
Cj4gLS0tIGEvbmV0L2l1Y3YvaXVjdi5jCj4gKysrIGIvbmV0L2l1Y3YvaXVjdi5jCj4gQEAgLTE4
MzYsMjMgKzE4MzYsMjMgQEAgc3RhdGljIHZvaWQgaXVjdl9leHRlcm5hbF9pbnRlcnJ1cHQoc3Ry
dWN0IGV4dF9jb2RlIGV4dF9jb2RlLAo+ICAKPiAgc3RhdGljIGludCBpdWN2X3BtX3ByZXBhcmUo
c3RydWN0IGRldmljZSAqZGV2KQo+ICB7Cj4gLQlpbnQgcmMgPSAwOwo+ICsJY29uc3Qgc3RydWN0
IGRldl9wbV9vcHMgKnBtID0gZHJpdmVyX3RvX3BtKGRldi0+ZHJpdmVyKTsKPiAgCj4gICNpZmRl
ZiBDT05GSUdfUE1fREVCVUcKPiAgCXByaW50ayhLRVJOX0lORk8gIml1Y3ZfcG1fcHJlcGFyZVxu
Iik7Cj4gICNlbmRpZgo+IC0JaWYgKGRldi0+ZHJpdmVyICYmIGRldi0+ZHJpdmVyLT5wbSAmJiBk
ZXYtPmRyaXZlci0+cG0tPnByZXBhcmUpCj4gLQkJcmMgPSBkZXYtPmRyaXZlci0+cG0tPnByZXBh
cmUoZGV2KTsKPiAtCXJldHVybiByYzsKPiArCXJldHVybiBwbSAmJiBwbS0+cHJlcGFyZSA/IHBt
LT5wcmVwYXJlKGRldikgOiAwOwoKTm8gbmVlZCBmb3IgPyA6IGhlcmUgZWl0aGVyLCBqdXN0IHVz
ZSBpZiAoKSBwbGVhc2UuCgpJdCdzICJpbnRlcmVzdGluZyIgaG93IHVzaW5nIHlvdXIgbmV3IGhl
bHBlciBkb2Vzbid0IGFjdHVhbGx5IG1ha2UgdGhlCmNvZGUgc21hbGxlci4gIFBlcmhhcHMgaXQg
aXNuJ3QgYSBnb29kIGhlbHBlciBmdW5jdGlvbj8KCnRoYW5rcywKCmdyZWcgay1oCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmdyZXlidXMtZGV2IG1haWxp
bmcgbGlzdApncmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3JnCmh0dHBzOi8vbGlzdHMubGluYXJv
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2dyZXlidXMtZGV2Cg==
