Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 936A31E2501
	for <lists+greybus-dev@lfdr.de>; Tue, 26 May 2020 17:08:03 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id ABE8D65F95
	for <lists+greybus-dev@lfdr.de>; Tue, 26 May 2020 15:08:02 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 9AF7765F96; Tue, 26 May 2020 15:08:02 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
	SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id DEBB765F97;
	Tue, 26 May 2020 15:07:50 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 59A1B65F91
 for <greybus-dev@lists.linaro.org>; Tue, 26 May 2020 15:07:48 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 4A02D65F96; Tue, 26 May 2020 15:07:48 +0000 (UTC)
Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com
 [209.85.218.67])
 by lists.linaro.org (Postfix) with ESMTPS id 4118565F91
 for <greybus-dev@lists.linaro.org>; Tue, 26 May 2020 15:07:47 +0000 (UTC)
Received: by mail-ej1-f67.google.com with SMTP id d7so24203039eja.7
 for <greybus-dev@lists.linaro.org>; Tue, 26 May 2020 08:07:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=KjgTih7A660W8l2Ai5zV0xie7l2fjS3cquiqxZY0eUs=;
 b=YYA8P9DCWFmoINtpPGiNFJwvwTofwesiezklpwJIic7YioKnt0MACgUlpVnIhMJLfh
 fRRWODdGCp1ZcZSu3eZooBIACQtXA9nsSMjft3q7jo2ge9e+ClRNbiOiyLaAoA0tzP8P
 l+CURGVpSfW8kl506etlajzk6MiNjmlqBOho7v7PqKBhHB0PO4ut7a5tJ2XwfTbRcctS
 m/6nRbFcaVcpTuKyD/PiCm8QdufjVTBl14alV6e8IKE0gsokY7hXjZgcoVqBzZI+w4PB
 OGp3Whd9b+t7z8udj2KlGwTWlFKOyxduLTzfjN0mM7M5tOckc4trUl4/ZVzuJ0ZwweML
 KouA==
X-Gm-Message-State: AOAM5307G8R+4rr1H3fDFplFUqUpD8uyEkumbjghm2HNNSTqu1xFO8r1
 wFrje7GphAtlLDU1B6z88qM=
X-Google-Smtp-Source: ABdhPJzpF2izaI7HGirZOZ/xZQdcIiUyWXIQKdVRDh55kJz8UdqLFQpxuDMPANNvmQBg9fruG2pCcw==
X-Received: by 2002:a17:906:8748:: with SMTP id
 hj8mr1609977ejb.335.1590505666414; 
 Tue, 26 May 2020 08:07:46 -0700 (PDT)
Received: from rocinante ([95.155.85.46])
 by smtp.gmail.com with ESMTPSA id t22sm137834ejr.93.2020.05.26.08.07.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 May 2020 08:07:45 -0700 (PDT)
Date: Tue, 26 May 2020 17:07:44 +0200
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Message-ID: <20200526150744.GC75990@rocinante>
References: <20200525182608.1823735-1-kw@linux.com>
 <20200525182608.1823735-9-kw@linux.com>
 <20200526063521.GC2578492@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200526063521.GC2578492@kroah.com>
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

SGVsbG8gR3JlZywKClsuLi5dCj4gSXQncyAiaW50ZXJlc3RpbmciIGhvdyB1c2luZyB5b3VyIG5l
dyBoZWxwZXIgZG9lc24ndCBhY3R1YWxseSBtYWtlIHRoZQo+IGNvZGUgc21hbGxlci4gIFBlcmhh
cHMgaXQgaXNuJ3QgYSBnb29kIGhlbHBlciBmdW5jdGlvbj8KClRoZSBpZGVhIGZvciB0aGUgaGVs
cGVyIHdhcyBpbnNwaXJlZCBieSB0aGUgY29tbWVudCBEYW4gbWFkZSB0byBCam9ybgphYm91dCBC
am9ybidzIGNoYW5nZSwgYXMgcGVyOgoKICBodHRwczovL2xvcmUua2VybmVsLm9yZy9kcml2ZXJk
ZXYtZGV2ZWwvMjAxOTEwMTYxMzUwMDIuR0EyNDY3OEBrYWRhbS8KCkl0IGxvb2tlZCBsaWtlIGEg
Z29vZCBpZGVhIHRvIHRyeSB0byByZWR1Y2UgdGhlIGZvbGxvd2luZzoKCiAgZGV2LT5kcml2ZXIg
JiYgZGV2LT5kcml2ZXItPnBtICYmIGRldi0+ZHJpdmVyLT5wbS0+cHJlcGFyZQoKSW50byBzb21l
dGhpbmcgbW9yZSBzdWNjaW5jdC4gIEFsYmVpdCwgZ2l2ZW4gdGhlIGZlZWRiYWNrIGZyb20geW91
cnNlbGYKYW5kIFJhZmFlbCwgSSBnYXRoZXIgdGhhdCB0aGlzIGhlbHBlciBpcyBub3QgcmVhbGx5
IGEgZ29vZCBhZGRpdGlvbi4KClRoYW5rIHlvdSBldmVyeW9uZSBhbmQgc29ycnkgZm9yIHRoZSBj
b21tb3Rpb24hCgpLcnp5c3p0b2YKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZ3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0CmdyZXlidXMtZGV2QGxpc3RzLmxp
bmFyby5vcmcKaHR0cHM6Ly9saXN0cy5saW5hcm8ub3JnL21haWxtYW4vbGlzdGluZm8vZ3JleWJ1
cy1kZXYK
