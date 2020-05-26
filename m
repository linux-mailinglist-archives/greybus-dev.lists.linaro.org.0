Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 773FC1E2771
	for <lists+greybus-dev@lfdr.de>; Tue, 26 May 2020 18:48:34 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 1E3DA65F97
	for <lists+greybus-dev@lfdr.de>; Tue, 26 May 2020 16:48:33 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 0F38565F98; Tue, 26 May 2020 16:48:33 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE autolearn=disabled
	version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id AB61F65F99;
	Tue, 26 May 2020 16:48:18 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 41B1F65F95
 for <greybus-dev@lists.linaro.org>; Tue, 26 May 2020 16:48:16 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 2D7FC65F98; Tue, 26 May 2020 16:48:16 +0000 (UTC)
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
 [209.85.166.68])
 by lists.linaro.org (Postfix) with ESMTPS id 211DA65F95
 for <greybus-dev@lists.linaro.org>; Tue, 26 May 2020 16:48:15 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id h10so22740923iob.10
 for <greybus-dev@lists.linaro.org>; Tue, 26 May 2020 09:48:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CDy85Gj7MYd1kNtILJcUzn7KVIhIM0XshsVeAc/i0tA=;
 b=FUHRi6qaoc35ken0Dt4z3+ydEYvKRiYxnZU6TUWvsozK+rFsH9UplWfVIzwNAlbPgV
 K0ANHgnLfZOj8s+y0xj3IPzf269bgsGJu2qpjeVRb89J34mlm8hCM8kskzWtP5hW06Of
 r5Gan3xmG/N5+d0g4oR0/ldlsGNDfbKHTdqERqJ5qxX87Jn+Z86M6qqWkY+/SK3wvMfa
 D8QXYqDxx3MozjU7PM01UVMQKHlyrUf+DXw7ktOP9PyWIyyeAWfa5usX6hkv9c9Ldcwk
 Q8khYDFfA4l2swkM5wqM7tqlbpkzntLxq9qNFDwY1cfv3n36q44LY2UvnX/qqBQDYQGX
 ytzw==
X-Gm-Message-State: AOAM532xd3lcApjsTEM49va8y7pT682wrinFLBNbHRVBEmlPKTv5XT7R
 90giDBzG82QNVX/xs3CHdUOl/j92
X-Google-Smtp-Source: ABdhPJwt8EDbE+Md3qNwECgPyEhh34GzLnn6Kwx5Q+Egs2R3PU4UAkkaFOOCDwhKuojJpS4rMr4mTQ==
X-Received: by 2002:a02:2708:: with SMTP id g8mr1921759jaa.52.1590511694529;
 Tue, 26 May 2020 09:48:14 -0700 (PDT)
Received: from [172.22.22.4] (c-73-185-129-58.hsd1.mn.comcast.net.
 [73.185.129.58])
 by smtp.googlemail.com with ESMTPSA id d29sm250489ild.42.2020.05.26.09.48.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 May 2020 09:48:13 -0700 (PDT)
To: =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kw@linux.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20200525182608.1823735-1-kw@linux.com>
 <20200525182608.1823735-9-kw@linux.com> <20200526063521.GC2578492@kroah.com>
 <20200526150744.GC75990@rocinante>
From: Alex Elder <elder@linaro.org>
Message-ID: <acb9415a-d0d0-3ebc-b5ae-c26a7dc2114a@linaro.org>
Date: Tue, 26 May 2020 11:48:12 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200526150744.GC75990@rocinante>
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: greybus-dev-bounces@lists.linaro.org
Sender: "greybus-dev" <greybus-dev-bounces@lists.linaro.org>
X-Virus-Scanned: ClamAV using ClamSMTP

T24gNS8yNi8yMCAxMDowNyBBTSwgS3J6eXN6dG9mIFdpbGN6ecWEc2tpIHdyb3RlOgo+IEhlbGxv
IEdyZWcsCj4gCj4gWy4uLl0KPj4gSXQncyAiaW50ZXJlc3RpbmciIGhvdyB1c2luZyB5b3VyIG5l
dyBoZWxwZXIgZG9lc24ndCBhY3R1YWxseSBtYWtlIHRoZQo+PiBjb2RlIHNtYWxsZXIuICBQZXJo
YXBzIGl0IGlzbid0IGEgZ29vZCBoZWxwZXIgZnVuY3Rpb24/CgpIZWxwZXIgZnVuY3Rpb25zIG9m
dGVuIGltcHJvdmUgY29kZSByZWFkYWJpbGl0eSwgd2hpY2ggaXMKYmVuZWZpY2lhbCBldmVuIGlm
IGl0IGRvZXNuJ3QgcmVkdWNlIGNvZGUgc2l6ZSBvciBlZmZpY2llbmN5LgoKQnV0IEkgd29uJ3Qg
YXJndWUgZm9yIG9yIGFnYWluc3QgdGhpcyBwYXJ0aWN1bGFyIGNoYW5nZS4KSXQncyBPSyB3aXRo
IG1lIGVpdGhlciB3YXkuCgoJCQkJCS1BbGV4Cgo+IFRoZSBpZGVhIGZvciB0aGUgaGVscGVyIHdh
cyBpbnNwaXJlZCBieSB0aGUgY29tbWVudCBEYW4gbWFkZSB0byBCam9ybgo+IGFib3V0IEJqb3Ju
J3MgY2hhbmdlLCBhcyBwZXI6Cj4gCj4gICAgaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvZHJpdmVy
ZGV2LWRldmVsLzIwMTkxMDE2MTM1MDAyLkdBMjQ2NzhAa2FkYW0vCj4gCj4gSXQgbG9va2VkIGxp
a2UgYSBnb29kIGlkZWEgdG8gdHJ5IHRvIHJlZHVjZSB0aGUgZm9sbG93aW5nOgo+IAo+ICAgIGRl
di0+ZHJpdmVyICYmIGRldi0+ZHJpdmVyLT5wbSAmJiBkZXYtPmRyaXZlci0+cG0tPnByZXBhcmUK
PiAKPiBJbnRvIHNvbWV0aGluZyBtb3JlIHN1Y2NpbmN0LiAgQWxiZWl0LCBnaXZlbiB0aGUgZmVl
ZGJhY2sgZnJvbSB5b3Vyc2VsZgo+IGFuZCBSYWZhZWwsIEkgZ2F0aGVyIHRoYXQgdGhpcyBoZWxw
ZXIgaXMgbm90IHJlYWxseSBhIGdvb2QgYWRkaXRpb24uCj4gCj4gVGhhbmsgeW91IGV2ZXJ5b25l
IGFuZCBzb3JyeSBmb3IgdGhlIGNvbW1vdGlvbiEKPiAKPiBLcnp5c3p0b2YKPiBfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGdyZXlidXMtZGV2IG1haWxp
bmcgbGlzdAo+IGdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKPiBodHRwczovL2xpc3RzLmxp
bmFyby5vcmcvbWFpbG1hbi9saXN0aW5mby9ncmV5YnVzLWRldgo+IAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0
CmdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKaHR0cHM6Ly9saXN0cy5saW5hcm8ub3JnL21h
aWxtYW4vbGlzdGluZm8vZ3JleWJ1cy1kZXYK
