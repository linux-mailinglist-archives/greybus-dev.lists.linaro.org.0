Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B7B51E24E1
	for <lists+greybus-dev@lfdr.de>; Tue, 26 May 2020 17:01:54 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 948F365F96
	for <lists+greybus-dev@lfdr.de>; Tue, 26 May 2020 15:01:53 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 8652765F9C; Tue, 26 May 2020 15:01:53 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE
	autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 8C4A365F98;
	Tue, 26 May 2020 15:01:33 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 68F8F65F91
 for <greybus-dev@lists.linaro.org>; Tue, 26 May 2020 15:01:19 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 4FC8065F96; Tue, 26 May 2020 15:01:19 +0000 (UTC)
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
 [209.85.208.66])
 by lists.linaro.org (Postfix) with ESMTPS id F155965F91
 for <greybus-dev@lists.linaro.org>; Tue, 26 May 2020 15:01:17 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id g9so17901290edr.8
 for <greybus-dev@lists.linaro.org>; Tue, 26 May 2020 08:01:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/FQ3kSh6QRt/DhDlB1iVTGQKeiQZDzu9nHJXUdnImCk=;
 b=uFYVPvBSdZYdynv1MhaUFaW7Y4g4V8DhcsELyBo7A4dzXn6+5C5VN6dRHVrWZLi/J3
 9WaaCN/M9hlsRjejXGpBvnAGNQINKinkxsLT021VsLE8plFTAR+cMCWPlsNZOfobS4Sy
 ddXiDNAIRAddsaA3Mv5nIfgvpR4vVqWcDhab4WMA8FeRb/+1k6yXLnep3cVuP/xx0VSk
 nqryzLx5IbFJDraWk7YUTIa43FgqrBhFHNhrUtKURVyk086AzF6HGBNOnhuO9iWsrmy8
 NFzjxvZ/yUXHvpCCCj5NU7Sen68A8XLkEIVhc/zRI2584ucrS7TYBc/ED3UhBRW2RRuA
 OwDg==
X-Gm-Message-State: AOAM532JMLWBpuXZ1w6QdySTQTqNjqf5xwKS89Cs3j9DrDxj5hBp6ecp
 enuArwWtMBNWhv7/Ku4yMuo=
X-Google-Smtp-Source: ABdhPJzUcDOK5LS647ncdAETZsJMJ8+0djAcX5w/EM0H6iRkO7YVRDADM+BVObYTE4LLegacDOPiCg==
X-Received: by 2002:a05:6402:31b5:: with SMTP id
 dj21mr21365281edb.160.1590505277038; 
 Tue, 26 May 2020 08:01:17 -0700 (PDT)
Received: from rocinante ([95.155.85.46])
 by smtp.gmail.com with ESMTPSA id f13sm143194edk.36.2020.05.26.08.01.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 May 2020 08:01:15 -0700 (PDT)
Date: Tue, 26 May 2020 17:01:14 +0200
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Alex Elder <elder@linaro.org>
Message-ID: <20200526150114.GB75990@rocinante>
References: <20200525182608.1823735-1-kw@linux.com>
 <20200525182608.1823735-2-kw@linux.com>
 <20200526063334.GB2578492@kroah.com>
 <41c42552-0f4f-df6a-d587-5c62333aa6a8@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <41c42552-0f4f-df6a-d587-5c62333aa6a8@linaro.org>
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
 "Martin K. Petersen" <martin.petersen@oracle.com>, linux-usb@vger.kernel.org,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org,
 Karsten Graul <kgraul@linux.ibm.com>
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

SGVsbG8gQWxleCBhbmQgR3JlZywKClsuLi5dCj4gVGhpcyBjb3VsZCBqdXN0IGJlOgo+IAo+IAlp
ZiAoZHJ2KQo+IAkJcmV0dXJuIGRydi0+cG07Cj4gCj4gCXJldHVybiBOVUxMOwo+IAo+IE9yIGlm
IHlvdSB3YW50IHRvIGV2b2tlIHBhc3Npb24gaW4gR3JlZzoKPiAKPiAJcmV0dXJuIGRydiA/IGRy
di0+cG0gOiBOVUxMOwo+IAo+IAkJCQkJLUFsZXgKPiAKPiA+IEkgaGF0ZSA/IDogbGluZXMgd2l0
aCBhIHBhc3Npb24sIGFzIHRoZXkgYnJlYWsgbm9ybWFsIHBhdHRlcm4gbWF0dGNoaW5nCj4gPiBp
biBteSBicmFpbi4gIFBsZWFzZSBqdXN0IHNwZWxsIHRoaXMgYWxsIG91dDoKPiA+IAlpZiAoZHJ2
ICYmIGRydi0+cG0pCj4gPiAJCXJldHVybiBkcnYtPnBtOwo+ID4gCXJldHVybiBOVUxMOwo+ID4g
Cj4gPiBNdWNoIGVhc2llciB0byByZWFkLCBhbmQgdGhlIGNvbXBpbGVyIHdpbGwgZG8gdGhlIGV4
YWN0IHNhbWUgdGhpbmcuCj4gPiAKPiA+IE9ubHkgcGxhY2UgPyA6IGFyZSBvayB0byB1c2UgaW4g
bXkgb3BpbmlvbiwgYXJlIGFzIGZ1bmN0aW9uIGFyZ3VtZW50cy4KCkkgd2lsbCBzdGVlciBhd2F5
IGZyb20gdGhlIHRlcm5hcnkgb3BlcmF0b3IgbmV4dCB0aW1lLiAgQWxzbywgZ29vZCB0bwpsZWFy
biBhYm91dCBHcmVnJ3MgcHJlZmVyZW5jZS4KClRoYW5rIHlvdSBib3RoIQoKS3J6eXN6dG9mCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmdyZXlidXMtZGV2
IG1haWxpbmcgbGlzdApncmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3JnCmh0dHBzOi8vbGlzdHMu
bGluYXJvLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2dyZXlidXMtZGV2Cg==
