Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 65D2F1EB7D1
	for <lists+greybus-dev@lfdr.de>; Tue,  2 Jun 2020 11:03:10 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 7B29160F10
	for <lists+greybus-dev@lfdr.de>; Tue,  2 Jun 2020 09:03:09 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 65EF460F4F; Tue,  2 Jun 2020 09:03:09 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE
	autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id EE4A5619F3;
	Tue,  2 Jun 2020 09:01:39 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id A63B9610D0
 for <greybus-dev@lists.linaro.org>; Tue, 26 May 2020 10:36:09 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 867F8618F4; Tue, 26 May 2020 10:36:09 +0000 (UTC)
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 by lists.linaro.org (Postfix) with ESMTPS id 9A46B610D0
 for <greybus-dev@lists.linaro.org>; Tue, 26 May 2020 10:36:06 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id a68so15837311otb.10
 for <greybus-dev@lists.linaro.org>; Tue, 26 May 2020 03:36:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=OP8/hxzSora7+RyKmdWGrhPbxw1jS07GePgn3bcs4Ls=;
 b=H4Uuri5JNa9WqrqRzw8lpphbj6qx8BEJn6C4OwZEZ9dc94OI6YB+EWhDYv06quPrt2
 uTbaeokPDycCM2yoZX5P+2L7HFu68SlsKHJZOxEF9faZtmFyDMa4PVM9F1bAOzAQe7kI
 Nlzof35ZUhNKK2lCxSolJ+6GsVbE6hBQmr8pOaWVdCRQKQuq7OAgnIIL6Q3u+hgIjQIR
 a9CFzi1eXgu1/8cJTNP9Ipqe4yc49hrQh1d0oidjgiHDGdVRu1Dye90DEhsNBoUEZLo7
 gmIjdR4U38IJV9HiHEEhds36r0IKM0IuSeFg8ACpl/aYwwXfZq8AkikvP6cNPnHces+x
 gmsw==
X-Gm-Message-State: AOAM5301vdV6VUCjgZDgfzLAeQZirMh8yrWgdJIzBf2Q1K6CC8OWPPWk
 1umxwBps4xksSPZiDCGHeJxaAig7o3v+PFfUSCk=
X-Google-Smtp-Source: ABdhPJy1GHMjiBmqkoqcnOQswjrf3GtFhFuljSG5cgXHe0ZrV2FGIT0iVHs8J6BfXHu/3+89V/CmkBUjqTdpcpTHsMI=
X-Received: by 2002:a9d:6c0f:: with SMTP id f15mr346512otq.118.1590489366099; 
 Tue, 26 May 2020 03:36:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200525182608.1823735-1-kw@linux.com>
 <20200525182608.1823735-3-kw@linux.com>
 <CAJZ5v0jQUmdDYmJsP43Ja3urpVLUxe-yD_Hm_Jd2LtCoPiXsrQ@mail.gmail.com>
 <20200526094518.GA4600@amd>
In-Reply-To: <20200526094518.GA4600@amd>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Tue, 26 May 2020 12:35:55 +0200
Message-ID: <CAJZ5v0ibtOMFDtCcyfmGeE15uR-+hQLw8tr6bfbp4aR4V7C3vA@mail.gmail.com>
To: Pavel Machek <pavel@denx.de>
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Tue, 02 Jun 2020 09:01:36 +0000
Cc: =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Linux PCI <linux-pci@vger.kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, linux-s390@vger.kernel.org,
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

T24gVHVlLCBNYXkgMjYsIDIwMjAgYXQgMTE6NDUgQU0gUGF2ZWwgTWFjaGVrIDxwYXZlbEBkZW54
LmRlPiB3cm90ZToKPgo+IE9uIFR1ZSAyMDIwLTA1LTI2IDEwOjM3OjM2LCBSYWZhZWwgSi4gV3lz
b2NraSB3cm90ZToKPiA+IE9uIE1vbiwgTWF5IDI1LCAyMDIwIGF0IDg6MjYgUE0gS3J6eXN6dG9m
IFdpbGN6ecWEc2tpIDxrd0BsaW51eC5jb20+IHdyb3RlOgo+ID4gPgo+ID4gPiBVc2UgdGhlIG5l
dyBkZXZpY2VfdG9fcG0oKSBoZWxwZXIgdG8gYWNjZXNzIFBvd2VyIE1hbmFnZW1lbnQgY2FsbGJh
Y3MKPiA+ID4gKHN0cnVjdCBkZXZfcG1fb3BzKSBmb3IgYSBwYXJ0aWN1bGFyIGRldmljZSAoc3Ry
dWN0IGRldmljZV9kcml2ZXIpLgo+ID4gPgo+ID4gPiBObyBmdW5jdGlvbmFsIGNoYW5nZSBpbnRl
bmRlZC4KPiA+ID4KPiA+ID4gU2lnbmVkLW9mZi1ieTogS3J6eXN6dG9mIFdpbGN6ecWEc2tpIDxr
d0BsaW51eC5jb20+Cj4gPiA+IC0tLQo+ID4gPiAgZHJpdmVycy9hY3BpL2RldmljZV9wbS5jIHwg
NSArKystLQo+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlv
bnMoLSkKPiA+ID4KPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvYWNwaS9kZXZpY2VfcG0uYyBi
L2RyaXZlcnMvYWNwaS9kZXZpY2VfcG0uYwo+ID4gPiBpbmRleCA1ODMyYmMxMGFjYTguLmI5OGEz
MmM0OGZiZSAxMDA2NDQKPiA+ID4gLS0tIGEvZHJpdmVycy9hY3BpL2RldmljZV9wbS5jCj4gPiA+
ICsrKyBiL2RyaXZlcnMvYWNwaS9kZXZpY2VfcG0uYwo+ID4gPiBAQCAtMTAyMiw5ICsxMDIyLDEw
IEBAIHN0YXRpYyBib29sIGFjcGlfZGV2X25lZWRzX3Jlc3VtZShzdHJ1Y3QgZGV2aWNlICpkZXYs
IHN0cnVjdCBhY3BpX2RldmljZSAqYWRldikKPiA+ID4gIGludCBhY3BpX3N1YnN5c19wcmVwYXJl
KHN0cnVjdCBkZXZpY2UgKmRldikKPiA+ID4gIHsKPiA+ID4gICAgICAgICBzdHJ1Y3QgYWNwaV9k
ZXZpY2UgKmFkZXYgPSBBQ1BJX0NPTVBBTklPTihkZXYpOwo+ID4gPiArICAgICAgIGNvbnN0IHN0
cnVjdCBkZXZfcG1fb3BzICpwbSA9IGRyaXZlcl90b19wbShkZXYtPmRyaXZlcik7Cj4gPgo+ID4g
SSBkb24ndCByZWFsbHkgc2VlIGEgcmVhc29uIGZvciB0aGlzIGNoYW5nZS4KPiA+Cj4gPiBXaGF0
J3Mgd3Jvbmcgd2l0aCB0aGUgY2hlY2sgYmVsb3c/Cj4KPiBEdXBsaWNhdGVkIGNvZGUuIFllcywg
Y29tcGlsZXIgY2FuIHNvcnQgaXQgb3V0LCBidXQuLi4gbmV3IHZlcnNpb24KPiBsb29rcyBiZXR0
ZXIgdG8gbWUuCgpTbyB0aGUgbmV3IGNvZGUgd291bGQgbm90IGJlIGR1cGxpY2F0ZWQ/CgpMb29r
IGF0IHRoZSBvdGhlciBwYXRjaGVzIGluIHRoZSBzZXJpZXMgdGhlbi4gOi0pCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmdyZXlidXMtZGV2IG1haWxpbmcg
bGlzdApncmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3JnCmh0dHBzOi8vbGlzdHMubGluYXJvLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2dyZXlidXMtZGV2Cg==
