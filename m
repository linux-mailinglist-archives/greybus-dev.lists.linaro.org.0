Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id EE5B41E24A8
	for <lists+greybus-dev@lfdr.de>; Tue, 26 May 2020 16:58:01 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 14AF165F91
	for <lists+greybus-dev@lfdr.de>; Tue, 26 May 2020 14:58:01 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 07C5765F9C; Tue, 26 May 2020 14:58:00 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
	SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 7313465F97;
	Tue, 26 May 2020 14:57:49 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 1F73565F91
 for <greybus-dev@lists.linaro.org>; Tue, 26 May 2020 14:57:47 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id F1F9465F96; Tue, 26 May 2020 14:57:46 +0000 (UTC)
Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com
 [209.85.218.68])
 by lists.linaro.org (Postfix) with ESMTPS id 15CC165F91
 for <greybus-dev@lists.linaro.org>; Tue, 26 May 2020 14:57:46 +0000 (UTC)
Received: by mail-ej1-f68.google.com with SMTP id a2so24114632ejb.10
 for <greybus-dev@lists.linaro.org>; Tue, 26 May 2020 07:57:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=h/vc/U48e43hYebkBpRwszhtS9SjYZ2xSvS7nTqAhXk=;
 b=kawVmQkSZRgvYEhv1oTFDn+mXHyTn1IQacbtSEyoUsCBuJBkrvpp++fCsNRv0AOBT3
 FLpKBTOHI4nuZBKYYVSSwGu3oH+4vlURYjesIQp3Tr6OpkMRSRqvOp4VzHL9fTUgYRt5
 lkNynzj9AYWijljIMRNTvcK30ODHdgcr1ey4KNl5qSQObBP9LqA/lCSaYZUrCDsLsUVa
 E1aEHU19JL6kO6tXbbZ9ixq5MXk+DGiOX1tH+NAcGZOcwOOBiG7xsFEErJNegssKF7IP
 bQB6JudDplKbUD0S2ne1FTbITBhyufwpc7SpYgGiJuFfhGqlKvnk95OZCpm3hn01H0NJ
 Ol5A==
X-Gm-Message-State: AOAM531vu5xifDitbPYBI+BLPFPlmNhkdh1qcw/z9OfVRAtwK34oyPXE
 yUxijr6oM3vu9xt5AWkp7AA=
X-Google-Smtp-Source: ABdhPJzdElVIHtsR0qMTrQLNXyURt2kuG/VwKifaQBwdr8EPvJOXOlo0YVxmLG6Ml176FD4Quk6tgg==
X-Received: by 2002:a17:906:4406:: with SMTP id
 x6mr1463667ejo.160.1590505065110; 
 Tue, 26 May 2020 07:57:45 -0700 (PDT)
Received: from rocinante ([95.155.85.46])
 by smtp.gmail.com with ESMTPSA id v3sm149610ejj.14.2020.05.26.07.57.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 May 2020 07:57:44 -0700 (PDT)
Date: Tue, 26 May 2020 16:57:42 +0200
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Ursula Braun <ubraun@linux.ibm.com>
Message-ID: <20200526145742.GA75990@rocinante>
References: <20200525182608.1823735-1-kw@linux.com>
 <20200525182608.1823735-9-kw@linux.com>
 <55c3d2eb-feff-bf33-235d-b89c0abef7b1@linux.ibm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <55c3d2eb-feff-bf33-235d-b89c0abef7b1@linux.ibm.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: Ulf Hansson <ulf.hansson@linaro.org>, linux-pci@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Pavel Machek <pavel@ucw.cz>,
 linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org,
 Kevin Hilman <khilman@kernel.org>, Julian Wiedmann <jwi@linux.ibm.com>,
 linux-acpi@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 Dan Carpenter <dan.carpenter@oracle.com>, Len Brown <lenb@kernel.org>,
 linux-pm@vger.kernel.org, "James E.J. Bottomley" <jejb@linux.ibm.com>,
 Johan Hovold <johan@kernel.org>, greybus-dev@lists.linaro.org,
 John Stultz <john.stultz@linaro.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Felipe Balbi <balbi@kernel.org>, Alex Elder <elder@kernel.org>,
 "Martin K. Petersen" <martin.petersen@oracle.com>, linux-usb@vger.kernel.org,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, Karsten Graul <kgraul@linux.ibm.com>,
 netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>
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

SGkgVXJzdWxhLAoKT24gMjAtMDUtMjYgMDk6MDc6MjcsIFVyc3VsYSBCcmF1biB3cm90ZToKPiAK
PiAKPiBPbiA1LzI1LzIwIDg6MjYgUE0sIEtyenlzenRvZiBXaWxjennFhHNraSB3cm90ZToKPiA+
IFVzZSB0aGUgbmV3IGRldmljZV90b19wbSgpIGhlbHBlciB0byBhY2Nlc3MgUG93ZXIgTWFuYWdl
bWVudCBjYWxsYmFjcwo+ID4gKHN0cnVjdCBkZXZfcG1fb3BzKSBmb3IgYSBwYXJ0aWN1bGFyIGRl
dmljZSAoc3RydWN0IGRldmljZV9kcml2ZXIpLgo+ID4gCj4gPiBObyBmdW5jdGlvbmFsIGNoYW5n
ZSBpbnRlbmRlZC4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogS3J6eXN6dG9mIFdpbGN6ecWEc2tp
IDxrd0BsaW51eC5jb20+Cj4gCj4gcG0gc3VwcG9ydCBpcyBnb2luZyB0byBiZSByZW1vdmVkIChm
b3IgczM5MCBpbiBnZW5lcmFsIGFuZCkgZm9yCj4gbmV0L2l1Y3YvaXVjdi5jIHdpdGggdGhpcyBu
ZXQtbmV4dCBwYXRjaDoKWy4uLl0KCkdvb2QgdG8ga25vdyEgIFRoYW5rIHlvdSBmb3IgbGV0dGlu
ZyBtZSBrbm93LiAgSSBhcHByZWNpYXRlIHRoYXQuCgpLcnp5c3p0b2YKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0
CmdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKaHR0cHM6Ly9saXN0cy5saW5hcm8ub3JnL21h
aWxtYW4vbGlzdGluZm8vZ3JleWJ1cy1kZXYK
