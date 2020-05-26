Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EB461E2162
	for <lists+greybus-dev@lfdr.de>; Tue, 26 May 2020 13:53:45 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 86E1B65F8A
	for <lists+greybus-dev@lfdr.de>; Tue, 26 May 2020 11:53:44 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 7A8D365F87; Tue, 26 May 2020 11:53:44 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE autolearn=disabled
	version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id C4EE7619A8;
	Tue, 26 May 2020 11:53:28 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 651656174C
 for <greybus-dev@lists.linaro.org>; Tue, 26 May 2020 11:53:26 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 4BCD361943; Tue, 26 May 2020 11:53:26 +0000 (UTC)
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
 [209.85.166.67])
 by lists.linaro.org (Postfix) with ESMTPS id 28BD66174C
 for <greybus-dev@lists.linaro.org>; Tue, 26 May 2020 11:53:25 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id h10so21564810iob.10
 for <greybus-dev@lists.linaro.org>; Tue, 26 May 2020 04:53:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hlMxfZxeMD+DKWmT3pt17RdFPN380iI2WVeOeZ79wkw=;
 b=CxjbJhFEsN9pPPSbX5FF3GIPSYP4Of0MQbu+/zxgX+D20oUDqu5h80YM+/jegL1VxT
 R/RSbXbXgLBDA1HpJ8gBWYEhTZNj+AyQVnlLAqLOsN6udmjIZQdSwqV69nGUTiTqCUqQ
 tnTm3/C2J2pjUMxEsWMuwfpiq3g1UUNyfa+XRzPGPmbALbRX6lNgVT/qZep83y+garn9
 t0OHlbbFjyKS4VRAN6CE855ShFHJQQPcjWjdmSJ1hDmFBAb1mQtVnOXURI2+M+TQP8Z0
 lOq74NRQRahjEEE0PQypL05Ovdh9WBTrZoy4rjy/gp7kgbCSAD6QvIkuDN8qBQ0/+DHA
 xCag==
X-Gm-Message-State: AOAM530TKrvDBE5ox3EyaDN6jmj+RD8jrq1MC5bnUvn85VcrqkGEWqXU
 aYRQBcqmC4CenVuM1TKnKu49pao/
X-Google-Smtp-Source: ABdhPJysJNQt3T6dM953D88S5wdzxi/U/oshKuW/qDlHy6hbQRmFmerb1YPlez4lats+13/+SUWV/g==
X-Received: by 2002:a5e:a70b:: with SMTP id b11mr8299591iod.63.1590494004490; 
 Tue, 26 May 2020 04:53:24 -0700 (PDT)
Received: from [172.22.22.4] (c-73-185-129-58.hsd1.mn.comcast.net.
 [73.185.129.58])
 by smtp.googlemail.com with ESMTPSA id c7sm11123220ilf.36.2020.05.26.04.53.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 May 2020 04:53:23 -0700 (PDT)
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kw@linux.com>
References: <20200525182608.1823735-1-kw@linux.com>
 <20200525182608.1823735-2-kw@linux.com> <20200526063334.GB2578492@kroah.com>
From: Alex Elder <elder@linaro.org>
Message-ID: <41c42552-0f4f-df6a-d587-5c62333aa6a8@linaro.org>
Date: Tue, 26 May 2020 06:53:22 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200526063334.GB2578492@kroah.com>
Content-Language: en-US
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
 "David S. Miller" <davem@davemloft.net>, Karsten Graul <kgraul@linux.ibm.com>
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: greybus-dev-bounces@lists.linaro.org
Sender: "greybus-dev" <greybus-dev-bounces@lists.linaro.org>
X-Virus-Scanned: ClamAV using ClamSMTP

T24gNS8yNi8yMCAxOjMzIEFNLCBHcmVnIEtyb2FoLUhhcnRtYW4gd3JvdGU6Cj4gT24gTW9uLCBN
YXkgMjUsIDIwMjAgYXQgMDY6MjY6MDFQTSArMDAwMCwgS3J6eXN6dG9mIFdpbGN6ecWEc2tpIHdy
b3RlOgo+PiBBZGQgZHJpdmVyX3RvX3BtKCkgaGVscGVyIGFsbG93aW5nIGZvciBhY2Nlc3Npbmcg
dGhlIFBvd2VyIE1hbmFnZW1lbnQKPj4gY2FsbGJhY3MgZm9yIGEgcGFydGljdWxhciBkZXZpY2Uu
ICBBY2Nlc3MgdG8gdGhlIGNhbGxiYWNzIChzdHJ1Y3QKPj4gZGV2X3BtX29wcykgaXMgbm9ybWFs
bHkgZG9uZSB0aHJvdWdoIHVzaW5nIHRoZSBwbSBwb2ludGVyIHRoYXQgaXMKPj4gZW1iZWRkZWQg
d2l0aGluIHRoZSBkZXZpY2VfZHJpdmVyIHN0cnVjdC4KPj4KPj4gSGVscGVyIGFsbG93cyBmb3Ig
dGhlIGNvZGUgcmVxdWlyZWQgdG8gcmVmZXJlbmNlIHRoZSBwbSBwb2ludGVyIGFuZAo+PiBhY2Nl
c3MgUG93ZXIgTWFuYWdlbWVudCBjYWxsYmFzIHRvIGJlIHNpbXBsaWZpZWQuICBDaGFuZ2luZyB0
aGUKPj4gZm9sbG93aW5nOgo+Pgo+PiAgICBzdHJ1Y3QgZGV2aWNlX2RyaXZlciAqZHJ2ID0gZGV2
LT5kcml2ZXI7Cj4+ICAgIGlmIChkZXYtPmRyaXZlciAmJiBkZXYtPmRyaXZlci0+cG0gJiYgZGV2
LT5kcml2ZXItPnBtLT5wcmVwYXJlKSB7Cj4+ICAgICAgICBpbnQgcmV0ID0gZGV2LT5kcml2ZXIt
PnBtLT5wcmVwYXJlKGRldik7Cj4+Cj4+IFRvOgo+Pgo+PiAgICBjb25zdCBzdHJ1Y3QgZGV2X3Bt
X29wcyAqcG0gPSBkcml2ZXJfdG9fcG0oZGV2LT5kcml2ZXIpOwo+PiAgICBpZiAocG0gJiYgcG0t
PnByZXBhcmUpIHsKPj4gICAgICAgIGludCByZXQgPSBwbS0+cHJlcGFyZShkZXYpOwo+Pgo+PiBP
ciwgY2hhbmdpbmcgdGhlIGZvbGxvd2luZzoKPj4KPj4gICAgICAgY29uc3Qgc3RydWN0IGRldl9w
bV9vcHMgKnBtID0gZGV2LT5kcml2ZXIgPyBkZXYtPmRyaXZlci0+cG0gOiBOVUxMOwo+Pgo+PiBU
bzoKPj4gICAgICAgY29uc3Qgc3RydWN0IGRldl9wbV9vcHMgKnBtID0gZHJpdmVyX3RvX3BtKGRl
di0+ZHJpdmVyKTsKPj4KPj4gU2lnbmVkLW9mZi1ieTogS3J6eXN6dG9mIFdpbGN6ecWEc2tpIDxr
d0BsaW51eC5jb20+Cj4+IC0tLQo+PiAgIGluY2x1ZGUvbGludXgvZGV2aWNlL2RyaXZlci5oIHwg
MTUgKysrKysrKysrKysrKysrCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDE1IGluc2VydGlvbnMoKykK
Pj4KPj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvZGV2aWNlL2RyaXZlci5oIGIvaW5jbHVk
ZS9saW51eC9kZXZpY2UvZHJpdmVyLmgKPj4gaW5kZXggZWU3YmE1YjU0MTdlLi5jY2QwYjMxNWZk
OTMgMTAwNjQ0Cj4+IC0tLSBhL2luY2x1ZGUvbGludXgvZGV2aWNlL2RyaXZlci5oCj4+ICsrKyBi
L2luY2x1ZGUvbGludXgvZGV2aWNlL2RyaXZlci5oCj4+IEBAIC0yMzYsNiArMjM2LDIxIEBAIGRy
aXZlcl9maW5kX2RldmljZV9ieV9hY3BpX2RldihzdHJ1Y3QgZGV2aWNlX2RyaXZlciAqZHJ2LCBj
b25zdCB2b2lkICphZGV2KQo+PiAgIH0KPj4gICAjZW5kaWYKPj4gICAKPj4gKy8qKgo+PiArICog
ZHJpdmVyX3RvX3BtIC0gUmV0dXJuIFBvd2VyIE1hbmFnZW1lbnQgY2FsbGJhY3MgKHN0cnVjdCBk
ZXZfcG1fb3BzKSBmb3IKPj4gKyAqICAgICAgICAgICAgICAgIGEgcGFydGljdWxhciBkZXZpY2Uu
Cj4+ICsgKiBAZHJ2OiBQb2ludGVyIHRvIGEgZGV2aWNlIChzdHJ1Y3QgZGV2aWNlX2RyaXZlcikg
Zm9yIHdoaWNoIHlvdSB3YW50IHRvIGFjY2Vzcwo+PiArICogICAgICAgdGhlIFBvd2VyIE1hbmFn
ZW1lbnQgY2FsbGJhY2tzLgo+PiArICoKPj4gKyAqIFJldHVybnMgYSBwb2ludGVyIHRvIHRoZSBz
dHJ1Y3QgZGV2X3BtX29wcyBlbWJlZGRlZCB3aXRoaW4gdGhlIGRldmljZSAoc3RydWN0Cj4+ICsg
KiBkZXZpY2VfZHJpdmVyKSwgb3IgcmV0dXJucyBOVUxMIGlmIFBvd2VyIE1hbmFnZW1lbnQgaXMg
bm90IHByZXNlbnQgYW5kIHRoZQo+PiArICogcG9pbnRlciBpcyBub3QgdmFsaWQuCj4+ICsgKi8K
Pj4gK3N0YXRpYyBpbmxpbmUgY29uc3Qgc3RydWN0IGRldl9wbV9vcHMgKmRyaXZlcl90b19wbShz
dHJ1Y3QgZGV2aWNlX2RyaXZlciAqZHJ2KQo+PiArewo+PiArCXJldHVybiBkcnYgJiYgZHJ2LT5w
bSA/IGRydi0+cG0gOiBOVUxMOwoKVGhpcyBjb3VsZCBqdXN0IGJlOgoKCWlmIChkcnYpCgkJcmV0
dXJuIGRydi0+cG07CgoJcmV0dXJuIE5VTEw7CgpPciBpZiB5b3Ugd2FudCB0byBldm9rZSBwYXNz
aW9uIGluIEdyZWc6CgoJcmV0dXJuIGRydiA/IGRydi0+cG0gOiBOVUxMOwoKCQkJCQktQWxleAoK
PiBJIGhhdGUgPyA6IGxpbmVzIHdpdGggYSBwYXNzaW9uLCBhcyB0aGV5IGJyZWFrIG5vcm1hbCBw
YXR0ZXJuIG1hdHRjaGluZwo+IGluIG15IGJyYWluLiAgUGxlYXNlIGp1c3Qgc3BlbGwgdGhpcyBh
bGwgb3V0Ogo+IAlpZiAoZHJ2ICYmIGRydi0+cG0pCj4gCQlyZXR1cm4gZHJ2LT5wbTsKPiAJcmV0
dXJuIE5VTEw7Cj4gCj4gTXVjaCBlYXNpZXIgdG8gcmVhZCwgYW5kIHRoZSBjb21waWxlciB3aWxs
IGRvIHRoZSBleGFjdCBzYW1lIHRoaW5nLgo+IAo+IE9ubHkgcGxhY2UgPyA6IGFyZSBvayB0byB1
c2UgaW4gbXkgb3BpbmlvbiwgYXJlIGFzIGZ1bmN0aW9uIGFyZ3VtZW50cy4KPiAKPiB0aGFua3Ms
Cj4gCj4gZ3JlZyBrLWgKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwo+IGdyZXlidXMtZGV2IG1haWxpbmcgbGlzdAo+IGdyZXlidXMtZGV2QGxpc3RzLmxp
bmFyby5vcmcKPiBodHRwczovL2xpc3RzLmxpbmFyby5vcmcvbWFpbG1hbi9saXN0aW5mby9ncmV5
YnVzLWRldgo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZ3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0CmdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcK
aHR0cHM6Ly9saXN0cy5saW5hcm8ub3JnL21haWxtYW4vbGlzdGluZm8vZ3JleWJ1cy1kZXYK
