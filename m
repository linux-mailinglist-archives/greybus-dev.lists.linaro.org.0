Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DDAD1E2164
	for <lists+greybus-dev@lfdr.de>; Tue, 26 May 2020 13:54:03 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 7759865F85
	for <lists+greybus-dev@lfdr.de>; Tue, 26 May 2020 11:54:02 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 62AF56174C; Tue, 26 May 2020 11:54:02 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE
	autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 1AAAB619A8;
	Tue, 26 May 2020 11:53:50 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 997B96174C
 for <greybus-dev@lists.linaro.org>; Tue, 26 May 2020 11:53:46 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 8E2BD61943; Tue, 26 May 2020 11:53:46 +0000 (UTC)
Received: from mail-il1-f195.google.com (mail-il1-f195.google.com
 [209.85.166.195])
 by lists.linaro.org (Postfix) with ESMTPS id 7E4826174C
 for <greybus-dev@lists.linaro.org>; Tue, 26 May 2020 11:53:34 +0000 (UTC)
Received: by mail-il1-f195.google.com with SMTP id 9so1549265ilg.12
 for <greybus-dev@lists.linaro.org>; Tue, 26 May 2020 04:53:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7PyzWO+Jj1rYJeTrMVgBfJHyXjKscWMPYAF4ENdmpbQ=;
 b=rOzDYieJ9yO6/mvQyadZqhKBIhbHQ8r/QxS5P6llCdbA2lWWJ6txuJ9FU2G0Y/me0R
 +M+V/MNmvE7dOtAaY640cd+ifKDkLYmzjd6nrWFiFH1gbKcge+FZOeQtvHIo5dvJvxnP
 7NnYgF26GcqUS/dYfRUKF18f6erb9asd8U8JhMfzMotXXnuTN2P3huyZ4zoWDQLWrzjw
 cL84MPJchjQIn4PHAzn8pUMn1OolmbD5D2ShmytI7Z2XFkE6LVVrtzHeD5R5rbyyqqkz
 qyIOoHDsCiqHfHd6JJQpLmey+mm0qqtuKnlsdpDa5n2LWqvVlEzlIm406P5naHX4FMnL
 QBmw==
X-Gm-Message-State: AOAM530x5bGofKbNrNQWsgA1g8sO4B54tyFlFSjkUx7A2Ka7A3Tbv4tH
 mEYVIlRxF7/36SVLqfmo+2XCZ4nr
X-Google-Smtp-Source: ABdhPJzIRXhjoFS59ZxVdmc6/72StiajMagnM67AqEd1ZphCwh2n55Z/orX4GwagAuzNM2iGGOZU8A==
X-Received: by 2002:a92:584b:: with SMTP id m72mr662144ilb.119.1590494013995; 
 Tue, 26 May 2020 04:53:33 -0700 (PDT)
Received: from [172.22.22.4] (c-73-185-129-58.hsd1.mn.comcast.net.
 [73.185.129.58])
 by smtp.googlemail.com with ESMTPSA id e12sm272486ioc.37.2020.05.26.04.53.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 May 2020 04:53:33 -0700 (PDT)
To: =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kw@linux.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
References: <20200525182608.1823735-1-kw@linux.com>
 <20200525182608.1823735-4-kw@linux.com>
From: Alex Elder <elder@linaro.org>
Message-ID: <91707da0-86a8-9e87-efdc-c5a01d259beb@linaro.org>
Date: Tue, 26 May 2020 06:53:32 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200525182608.1823735-4-kw@linux.com>
Content-Language: en-US
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: Ulf Hansson <ulf.hansson@linaro.org>, linux-pci@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Pavel Machek <pavel@ucw.cz>,
 linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org,
 Kevin Hilman <khilman@kernel.org>, Julian Wiedmann <jwi@linux.ibm.com>,
 linux-acpi@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 Len Brown <lenb@kernel.org>, linux-pm@vger.kernel.org,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 Ursula Braun <ubraun@linux.ibm.com>, Johan Hovold <johan@kernel.org>,
 greybus-dev@lists.linaro.org, John Stultz <john.stultz@linaro.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Felipe Balbi <balbi@kernel.org>,
 Alex Elder <elder@kernel.org>,
 "Martin K. Petersen" <martin.petersen@oracle.com>, netdev@vger.kernel.org,
 linux-usb@vger.kernel.org, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 "David S. Miller" <davem@davemloft.net>, Karsten Graul <kgraul@linux.ibm.com>
Subject: Re: [greybus-dev] [PATCH 3/8] greybus: Use the new device_to_pm()
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: greybus-dev-bounces@lists.linaro.org
Sender: "greybus-dev" <greybus-dev-bounces@lists.linaro.org>
X-Virus-Scanned: ClamAV using ClamSMTP

T24gNS8yNS8yMCAxOjI2IFBNLCBLcnp5c3p0b2YgV2lsY3p5xYRza2kgd3JvdGU6Cj4gVXNlIHRo
ZSBuZXcgZGV2aWNlX3RvX3BtKCkgaGVscGVyIHRvIGFjY2VzcyBQb3dlciBNYW5hZ2VtZW50IGNh
bGxiYWNzCj4gKHN0cnVjdCBkZXZfcG1fb3BzKSBmb3IgYSBwYXJ0aWN1bGFyIGRldmljZSAoc3Ry
dWN0IGRldmljZV9kcml2ZXIpLgo+IAo+IE5vIGZ1bmN0aW9uYWwgY2hhbmdlIGludGVuZGVkLgoK
TG9va3MgZmluZSB0byBtZS4KClJldmlld2VkLWJ5OiBBbGV4IEVsZGVyIDxlbGRlckBsaW5hcm8u
b3JnPgoKPiBTaWduZWQtb2ZmLWJ5OiBLcnp5c3p0b2YgV2lsY3p5xYRza2kgPGt3QGxpbnV4LmNv
bT4KPiAtLS0KPiAgIGRyaXZlcnMvZ3JleWJ1cy9idW5kbGUuYyB8IDQgKystLQo+ICAgMSBmaWxl
IGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncmV5YnVzL2J1bmRsZS5jIGIvZHJpdmVycy9ncmV5YnVzL2J1bmRsZS5jCj4g
aW5kZXggODQ2NjA3Mjk1MzhiLi5kMzhkM2E2MzA4MTIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9n
cmV5YnVzL2J1bmRsZS5jCj4gKysrIGIvZHJpdmVycy9ncmV5YnVzL2J1bmRsZS5jCj4gQEAgLTEw
OCw3ICsxMDgsNyBAQCBzdGF0aWMgdm9pZCBnYl9idW5kbGVfZW5hYmxlX2FsbF9jb25uZWN0aW9u
cyhzdHJ1Y3QgZ2JfYnVuZGxlICpidW5kbGUpCj4gICBzdGF0aWMgaW50IGdiX2J1bmRsZV9zdXNw
ZW5kKHN0cnVjdCBkZXZpY2UgKmRldikKPiAgIHsKPiAgIAlzdHJ1Y3QgZ2JfYnVuZGxlICpidW5k
bGUgPSB0b19nYl9idW5kbGUoZGV2KTsKPiAtCWNvbnN0IHN0cnVjdCBkZXZfcG1fb3BzICpwbSA9
IGRldi0+ZHJpdmVyLT5wbTsKPiArCWNvbnN0IHN0cnVjdCBkZXZfcG1fb3BzICpwbSA9IGRyaXZl
cl90b19wbShkZXYtPmRyaXZlcik7Cj4gICAJaW50IHJldDsKPiAgIAo+ICAgCWlmIChwbSAmJiBw
bS0+cnVudGltZV9zdXNwZW5kKSB7Cj4gQEAgLTEzNSw3ICsxMzUsNyBAQCBzdGF0aWMgaW50IGdi
X2J1bmRsZV9zdXNwZW5kKHN0cnVjdCBkZXZpY2UgKmRldikKPiAgIHN0YXRpYyBpbnQgZ2JfYnVu
ZGxlX3Jlc3VtZShzdHJ1Y3QgZGV2aWNlICpkZXYpCj4gICB7Cj4gICAJc3RydWN0IGdiX2J1bmRs
ZSAqYnVuZGxlID0gdG9fZ2JfYnVuZGxlKGRldik7Cj4gLQljb25zdCBzdHJ1Y3QgZGV2X3BtX29w
cyAqcG0gPSBkZXYtPmRyaXZlci0+cG07Cj4gKwljb25zdCBzdHJ1Y3QgZGV2X3BtX29wcyAqcG0g
PSBkcml2ZXJfdG9fcG0oZGV2LT5kcml2ZXIpOwo+ICAgCWludCByZXQ7Cj4gICAKPiAgIAlyZXQg
PSBnYl9jb250cm9sX2J1bmRsZV9yZXN1bWUoYnVuZGxlLT5pbnRmLT5jb250cm9sLCBidW5kbGUt
PmlkKTsKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmdyZXlidXMtZGV2IG1haWxpbmcgbGlzdApncmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3JnCmh0
dHBzOi8vbGlzdHMubGluYXJvLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2dyZXlidXMtZGV2Cg==
