Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id F3E401EB7CC
	for <lists+greybus-dev@lfdr.de>; Tue,  2 Jun 2020 11:02:33 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 224B6608C3
	for <lists+greybus-dev@lfdr.de>; Tue,  2 Jun 2020 09:02:33 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 1586C60F10; Tue,  2 Jun 2020 09:02:33 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE
	autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 54B016197A;
	Tue,  2 Jun 2020 09:01:38 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 9AFE761805
 for <greybus-dev@lists.linaro.org>; Tue, 26 May 2020 08:37:50 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 8B507618F4; Tue, 26 May 2020 08:37:50 +0000 (UTC)
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 by lists.linaro.org (Postfix) with ESMTPS id 60E8B61805
 for <greybus-dev@lists.linaro.org>; Tue, 26 May 2020 08:37:49 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id a68so15618524otb.10
 for <greybus-dev@lists.linaro.org>; Tue, 26 May 2020 01:37:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=RHXgtuB1SAqLX2SMugvAUZcluD7absnJHKc68BKyHlE=;
 b=Gt2Fs5RiEULAGqNrdSR863uJ3dk+LXYDox8mkTtfK6U6BJmkEyGvQCIoqee5nz4dm1
 etIOETIqhHX30fXgBQhyk8OAH8G34on1ltThMdqIExu/O5eEUF4lB56i/I4PZLh+rXUp
 Er/dUAdrxAxGX8hXbGjuX6qOdjHruucIw51MvU8pvabX/a7rxdyYngirXLeK1+kGx0yY
 LxYATKqlILyu3FKnzz2VlEcsG1A3ZFaiVf4Ibf2/g63f67UmEZXndhKRU22aR2RExhhU
 QNTyKN1piKJLk1McooECtbWcecNWdws1/qO0t+cVaJnJdcGTOScbEJi9+Q/oEyCeUkJr
 TYzQ==
X-Gm-Message-State: AOAM530kxtzdi/9tzmuocGLVFyKTW51NVfvQtBwuaG5dx/mu4/FZGh37
 rrS0eY+FgMHrZl5jFJ4kon6M2zxQaI7Fedp8vek=
X-Google-Smtp-Source: ABdhPJy0XoZJ2esVX8+4wcFLlF6um9NLvGAJ5fc2t1hUUEHZCOGJRTRLWSbAKm+GZYwEumVFNBb3ARUgbj71FBUSPrI=
X-Received: by 2002:a9d:6c0f:: with SMTP id f15mr92375otq.118.1590482268905;
 Tue, 26 May 2020 01:37:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200525182608.1823735-1-kw@linux.com>
 <20200525182608.1823735-3-kw@linux.com>
In-Reply-To: <20200525182608.1823735-3-kw@linux.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Tue, 26 May 2020 10:37:36 +0200
Message-ID: <CAJZ5v0jQUmdDYmJsP43Ja3urpVLUxe-yD_Hm_Jd2LtCoPiXsrQ@mail.gmail.com>
To: =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Tue, 02 Jun 2020 09:01:36 +0000
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Linux PCI <linux-pci@vger.kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Pavel Machek <pavel@ucw.cz>,
 linux-s390@vger.kernel.org,
 "open list:TARGET SUBSYSTEM" <linux-scsi@vger.kernel.org>,
 Kevin Hilman <khilman@kernel.org>, Julian Wiedmann <jwi@linux.ibm.com>,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Dan Carpenter <dan.carpenter@oracle.com>,
 Len Brown <lenb@kernel.org>, Linux PM <linux-pm@vger.kernel.org>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 Ursula Braun <ubraun@linux.ibm.com>, Johan Hovold <johan@kernel.org>,
 greybus-dev@lists.linaro.org, John Stultz <john.stultz@linaro.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Felipe Balbi <balbi@kernel.org>,
 Alex Elder <elder@kernel.org>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 "open list:ULTRA-WIDEBAND \(UWB\) SUBSYSTEM:" <linux-usb@vger.kernel.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, Karsten Graul <kgraul@linux.ibm.com>,
 netdev <netdev@vger.kernel.org>, "David S. Miller" <davem@davemloft.net>
Subject: Re: [greybus-dev] [PATCH 2/8] ACPI: PM: Use the new device_to_pm()
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

T24gTW9uLCBNYXkgMjUsIDIwMjAgYXQgODoyNiBQTSBLcnp5c3p0b2YgV2lsY3p5xYRza2kgPGt3
QGxpbnV4LmNvbT4gd3JvdGU6Cj4KPiBVc2UgdGhlIG5ldyBkZXZpY2VfdG9fcG0oKSBoZWxwZXIg
dG8gYWNjZXNzIFBvd2VyIE1hbmFnZW1lbnQgY2FsbGJhY3MKPiAoc3RydWN0IGRldl9wbV9vcHMp
IGZvciBhIHBhcnRpY3VsYXIgZGV2aWNlIChzdHJ1Y3QgZGV2aWNlX2RyaXZlcikuCj4KPiBObyBm
dW5jdGlvbmFsIGNoYW5nZSBpbnRlbmRlZC4KPgo+IFNpZ25lZC1vZmYtYnk6IEtyenlzenRvZiBX
aWxjennFhHNraSA8a3dAbGludXguY29tPgo+IC0tLQo+ICBkcml2ZXJzL2FjcGkvZGV2aWNlX3Bt
LmMgfCA1ICsrKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDIgZGVsZXRp
b25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9hY3BpL2RldmljZV9wbS5jIGIvZHJpdmVy
cy9hY3BpL2RldmljZV9wbS5jCj4gaW5kZXggNTgzMmJjMTBhY2E4Li5iOThhMzJjNDhmYmUgMTAw
NjQ0Cj4gLS0tIGEvZHJpdmVycy9hY3BpL2RldmljZV9wbS5jCj4gKysrIGIvZHJpdmVycy9hY3Bp
L2RldmljZV9wbS5jCj4gQEAgLTEwMjIsOSArMTAyMiwxMCBAQCBzdGF0aWMgYm9vbCBhY3BpX2Rl
dl9uZWVkc19yZXN1bWUoc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3QgYWNwaV9kZXZpY2UgKmFk
ZXYpCj4gIGludCBhY3BpX3N1YnN5c19wcmVwYXJlKHN0cnVjdCBkZXZpY2UgKmRldikKPiAgewo+
ICAgICAgICAgc3RydWN0IGFjcGlfZGV2aWNlICphZGV2ID0gQUNQSV9DT01QQU5JT04oZGV2KTsK
PiArICAgICAgIGNvbnN0IHN0cnVjdCBkZXZfcG1fb3BzICpwbSA9IGRyaXZlcl90b19wbShkZXYt
PmRyaXZlcik7CgpJIGRvbid0IHJlYWxseSBzZWUgYSByZWFzb24gZm9yIHRoaXMgY2hhbmdlLgoK
V2hhdCdzIHdyb25nIHdpdGggdGhlIGNoZWNrIGJlbG93PwoKPgo+IC0gICAgICAgaWYgKGRldi0+
ZHJpdmVyICYmIGRldi0+ZHJpdmVyLT5wbSAmJiBkZXYtPmRyaXZlci0+cG0tPnByZXBhcmUpIHsK
PiAtICAgICAgICAgICAgICAgaW50IHJldCA9IGRldi0+ZHJpdmVyLT5wbS0+cHJlcGFyZShkZXYp
Owo+ICsgICAgICAgaWYgKHBtICYmIHBtLT5wcmVwYXJlKSB7Cj4gKyAgICAgICAgICAgICAgIGlu
dCByZXQgPSBwbS0+cHJlcGFyZShkZXYpOwo+Cj4gICAgICAgICAgICAgICAgIGlmIChyZXQgPCAw
KQo+ICAgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiByZXQ7Cj4gLS0KPiAyLjI2LjIKPgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpncmV5YnVzLWRl
diBtYWlsaW5nIGxpc3QKZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpodHRwczovL2xpc3Rz
LmxpbmFyby5vcmcvbWFpbG1hbi9saXN0aW5mby9ncmV5YnVzLWRldgo=
