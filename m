Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 59FFA1EB7CE
	for <lists+greybus-dev@lfdr.de>; Tue,  2 Jun 2020 11:02:44 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 86E8260DA3
	for <lists+greybus-dev@lfdr.de>; Tue,  2 Jun 2020 09:02:43 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 7A10260F10; Tue,  2 Jun 2020 09:02:43 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE
	autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 8C7BA619B2;
	Tue,  2 Jun 2020 09:01:38 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 0A99161805
 for <greybus-dev@lists.linaro.org>; Tue, 26 May 2020 08:39:10 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id ECD49618F4; Tue, 26 May 2020 08:39:09 +0000 (UTC)
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 by lists.linaro.org (Postfix) with ESMTPS id 1C3DD61805
 for <greybus-dev@lists.linaro.org>; Tue, 26 May 2020 08:39:09 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id a68so15621206otb.10
 for <greybus-dev@lists.linaro.org>; Tue, 26 May 2020 01:39:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=MpwY3EHc5z85EihmevYmSupSr3w2Pyaz4sc6UHi08wA=;
 b=I3QHRNW1f4AL4ZqgsfKHw+04qMLUFBqj9WDxCEKl9ojuzLNyevAvO6SBRwTUdvxhKW
 zSbbw9XRXBRePen+sbx1wVIj/UY3KTWJQfqAUM/b11wl9GWkFJjt3XFflmm0tEhm6izD
 TER6qldj2to8lHqQ82XxS0aADuqHc3BTem7nHQeA1+iiKldwgJgv7He7dwYsqnTF0ksH
 h/DcQxvCksnDhuCGW2pS4XnMV0sUxOK125xeJXDC4O8wgk6C5dCv8/m8RqHaGkvSM2pn
 4sdlQhcjN77NApmy67AjXy6xaVTcpwlRVWLgNlNvGiRNxw0jyxPoa82DqwQx98F2r08t
 OLpw==
X-Gm-Message-State: AOAM533oMLTgH//Z7+ZojZ24KkB0Imo2wCZaNoq3ZplA1z+Suj3/N8OK
 XW0o+TXNHHGp9b7encDQITAtvucI903zTWaPey0=
X-Google-Smtp-Source: ABdhPJyg99dhbbsUdUpzqyLlD2Zp0WEwPi+B3o8RxPqwRzQCCrVCeDF3laDVas19O0CvHdxuwQP2MEhi6k5TafK25JQ=
X-Received: by 2002:a9d:6c0f:: with SMTP id f15mr94657otq.118.1590482348592;
 Tue, 26 May 2020 01:39:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200525182608.1823735-1-kw@linux.com>
 <20200525182608.1823735-6-kw@linux.com>
In-Reply-To: <20200525182608.1823735-6-kw@linux.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Tue, 26 May 2020 10:38:56 +0200
Message-ID: <CAJZ5v0i-RnP7RycZ3GqOZuEYqrX_+r5-VS7DqtNCyHDwp1sPKg@mail.gmail.com>
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
Subject: Re: [greybus-dev] [PATCH 5/8] usb: phy: fsl: Use the new
 device_to_pm() helper to access struct dev_pm_ops
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
aWxjennFhHNraSA8a3dAbGludXguY29tPgo+IC0tLQo+ICBkcml2ZXJzL3VzYi9waHkvcGh5LWZz
bC11c2IuYyB8IDExICsrKysrKystLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMo
KyksIDQgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvcGh5L3BoeS1m
c2wtdXNiLmMgYi9kcml2ZXJzL3VzYi9waHkvcGh5LWZzbC11c2IuYwo+IGluZGV4IGI0NTFmNDY5
NWYzZi4uM2I5YWQ1ZGI4MzgwIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvdXNiL3BoeS9waHktZnNs
LXVzYi5jCj4gKysrIGIvZHJpdmVycy91c2IvcGh5L3BoeS1mc2wtdXNiLmMKPiBAQCAtNDYwLDYg
KzQ2MCw3IEBAIGludCBmc2xfb3RnX3N0YXJ0X2hvc3Qoc3RydWN0IG90Z19mc20gKmZzbSwgaW50
IG9uKQo+ICAgICAgICAgc3RydWN0IGRldmljZSAqZGV2Owo+ICAgICAgICAgc3RydWN0IGZzbF9v
dGcgKm90Z19kZXYgPQo+ICAgICAgICAgICAgICAgICBjb250YWluZXJfb2Yob3RnLT51c2JfcGh5
LCBzdHJ1Y3QgZnNsX290ZywgcGh5KTsKPiArICAgICAgIGNvbnN0IHN0cnVjdCBkZXZfcG1fb3Bz
ICpwbTsKPiAgICAgICAgIHUzMiByZXR2YWwgPSAwOwo+Cj4gICAgICAgICBpZiAoIW90Zy0+aG9z
dCkKPiBAQCAtNDc5LDggKzQ4MCw5IEBAIGludCBmc2xfb3RnX3N0YXJ0X2hvc3Qoc3RydWN0IG90
Z19mc20gKmZzbSwgaW50IG9uKQo+ICAgICAgICAgICAgICAgICBlbHNlIHsKPiAgICAgICAgICAg
ICAgICAgICAgICAgICBvdGdfcmVzZXRfY29udHJvbGxlcigpOwo+ICAgICAgICAgICAgICAgICAg
ICAgICAgIFZEQkcoImhvc3Qgb24uLi4uLi5cbiIpOwo+IC0gICAgICAgICAgICAgICAgICAgICAg
IGlmIChkZXYtPmRyaXZlci0+cG0gJiYgZGV2LT5kcml2ZXItPnBtLT5yZXN1bWUpIHsKPiAtICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJldHZhbCA9IGRldi0+ZHJpdmVyLT5wbS0+cmVz
dW1lKGRldik7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgcG0gPSBkcml2ZXJfdG9fcG0oZGV2
LT5kcml2ZXIpOwo+ICsgICAgICAgICAgICAgICAgICAgICAgIGlmIChwbSAmJiBwbS0+cmVzdW1l
KSB7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZXR2YWwgPSBwbS0+cmVzdW1l
KGRldik7CgpBbmQgd2h5IGlzIHRoZSBuZXcgdmVyc2lvbiBiZXR0ZXIgdGhpcyB0aW1lPwoKPiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGlmIChmc20tPmlkKSB7Cj4gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC8qIGRlZmF1bHQtYiAqLwo+ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBmc2xfb3RnX2Rydl92YnVzKGZzbSwgMSk7
Cj4gQEAgLTUwNCw4ICs1MDYsOSBAQCBpbnQgZnNsX290Z19zdGFydF9ob3N0KHN0cnVjdCBvdGdf
ZnNtICpmc20sIGludCBvbikKPiAgICAgICAgICAgICAgICAgZWxzZSB7Cj4gICAgICAgICAgICAg
ICAgICAgICAgICAgVkRCRygiaG9zdCBvZmYuLi4uLi5cbiIpOwo+ICAgICAgICAgICAgICAgICAg
ICAgICAgIGlmIChkZXYgJiYgZGV2LT5kcml2ZXIpIHsKPiAtICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGlmIChkZXYtPmRyaXZlci0+cG0gJiYgZGV2LT5kcml2ZXItPnBtLT5zdXNwZW5k
KQo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZXR2YWwgPSBkZXYt
PmRyaXZlci0+cG0tPnN1c3BlbmQoZGV2KTsKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHBtID0gZHJpdmVyX3RvX3BtKGRldi0+ZHJpdmVyKTsKPiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGlmIChwbSAmJiBwbS0+c3VzcGVuZCkKPiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgcmV0dmFsID0gcG0tPnN1c3BlbmQoZGV2KTsKPiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGlmIChmc20tPmlkKQo+ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAvKiBkZWZhdWx0LWIgKi8KPiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgZnNsX290Z19kcnZfdmJ1cyhmc20sIDApOwo+IC0tCj4g
Mi4yNi4yCj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
Z3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0CmdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKaHR0
cHM6Ly9saXN0cy5saW5hcm8ub3JnL21haWxtYW4vbGlzdGluZm8vZ3JleWJ1cy1kZXYK
