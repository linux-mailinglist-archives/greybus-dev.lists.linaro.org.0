Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 4021A91F4F
	for <lists+greybus-dev@lfdr.de>; Mon, 19 Aug 2019 10:50:01 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id E88DC617B5
	for <lists+greybus-dev@lfdr.de>; Mon, 19 Aug 2019 08:49:59 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id DBD1A617C8; Mon, 19 Aug 2019 08:49:59 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
	ip-10-150-125-211.ec2.internal
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FROM,MAILING_LIST_MULTI,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2
	autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 85416617C3;
	Mon, 19 Aug 2019 08:49:49 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 667A761738
 for <greybus-dev@lists.linaro.org>; Mon, 19 Aug 2019 08:49:47 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 551AF617B5; Mon, 19 Aug 2019 08:49:47 +0000 (UTC)
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
 [209.85.128.68])
 by lists.linaro.org (Postfix) with ESMTPS id 3173961738
 for <greybus-dev@lists.linaro.org>; Mon, 19 Aug 2019 08:49:46 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id 10so847377wmp.3
 for <greybus-dev@lists.linaro.org>; Mon, 19 Aug 2019 01:49:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=80VSM+t1CYaRexxNp5fbk0ecYIgQsYY2Bq3uB1r8nUM=;
 b=D6MZuhC5IAatfit7hUyLS0ZJezLyWIJ8etyFDmkeugmd/YQt1t/WIwuY6Q4LxkJyNh
 EzfMRGhZLTBQntxajUsvSFhOmJkTOyOuzzBYzqzmKmgtpvYgDwyHvDMPwN+E9aWtZ8i5
 lSOnYl9EpoiLAUb6T8xtciMZf4qn5azOOHg9WowrRdrrcjOUOK33RP6G9O+lFAMO/pLd
 xIAfiVNxmind6/GfMfMtSmVeqnR/69v6rafn5DD1Gveonbs8uMUqsQ0CSsdhg6VOtZmX
 cOK5Jao2Vd3aqCeXeKjPyVUYtQZPzetERn+b7oGERBpV/eaIaPuu8d5jGcVHVI+LL0rX
 lLbA==
X-Gm-Message-State: APjAAAWhR6EhJKGDJDc9lTBhg0raKB12PCkEsb8zhM14tD06JVaBGsW+
 rL8qMCW6DKxH8VK/5/BB8iAOd9EE
X-Google-Smtp-Source: APXvYqzTiowWymfjTO+kSq6HqRizXN8R/O4WwmLTF4lMyrYC2bn56pytI82QKj6IZXS4psZD8k0nyg==
X-Received: by 2002:a1c:4c06:: with SMTP id z6mr18733654wmf.47.1566204585125; 
 Mon, 19 Aug 2019 01:49:45 -0700 (PDT)
Received: from arch-late (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
 by smtp.gmail.com with ESMTPSA id o11sm12162736wmh.46.2019.08.19.01.49.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2019 01:49:44 -0700 (PDT)
References: <CAF4BF-R5yjta8zTcsFc8auYQ8cAHDqN0yM5rYwG6JctCbkOm1g@mail.gmail.com>
 <20190815193922.GI30437@kroah.com>
 <CAF4BF-TpZYteWN2VM5B5+yQrOLQR_czJMaJBE2gAbMGmSo1iJw@mail.gmail.com>
User-agent: mu4e 1.2.0; emacs 27.0.50
From: Rui Miguel Silva <rmfrfs@gmail.com>
To: greybus-dev@lists.linaro.org, Christopher Friedt <chrisfriedt@gmail.com>
In-reply-to: <CAF4BF-TpZYteWN2VM5B5+yQrOLQR_czJMaJBE2gAbMGmSo1iJw@mail.gmail.com>
Date: Mon, 19 Aug 2019 09:49:42 +0100
Message-ID: <m3blwl1qvt.fsf@gmail.com>
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: Greg KH <greg@kroah.com>
Subject: Re: [greybus-dev] binding gb gpio device to gb-phy driver?
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

SGkgQ2hyaXN0b3BoZXIsCkp1c3QgZ2V0dGluZyBiYWNrIGZyb20gc29tZSB0aW1lIG9mZiBhbmQg
Y2F0Y2hpbmcgdXAgd2l0aCB0aGUKZ3JleWJ1cyBtb3ZlbWVudHMuIEkgd2FzIHRoZSBndXkgdGhh
dCBoYXZlIGltcGxlbWVudGVkIHNvbWUgb2YgdGhlCnByb3RvY29scyBhbmQgbWFpbnRhaW4vdXNl
ZCB0aGUgZ2JzaW0gbW9yZS4KCk9uIFRodSAxNSBBdWcgMjAxOSBhdCAyMDo0NiwgQ2hyaXN0b3Bo
ZXIgRnJpZWR0IHdyb3RlOgo+IE9uIFRodSwgQXVnIDE1LCAyMDE5IGF0IDM6MzkgUE0gR3JlZyBL
SCA8Z3JlZ0Brcm9haC5jb20+IHdyb3RlOgo+PiBPbiBUaHUsIEF1ZyAxNSwgMjAxOSBhdCAxMjo0
OTo1MVBNIC0wNDAwLCBDaHJpc3RvcGhlciBGcmllZHQgd3JvdGU6Cj4+ID4gSXMgYW55b25lIGF3
YXJlIGlmIGEgc2VwYXJhdGUgc3RlcCB0aGF0IGlzIHJlcXVpcmVkIHRvIGJpbmQgdGhlIGRldmlj
ZQo+PiA+IHRvIHRoZSBkcml2ZXI/Cj4+ID4gSSd2ZSB0cmllZAo+PiA+Cj4+ID4gc3VkbyBzaCAt
YyAnZWNobyAtbiAxLTIuMi4xID4gL3N5cy9idXMvZ2JwaHkvZHJpdmVycy9ncGlvL2JpbmQnCj4+
ID4KPj4gPiBidXQgdGhhdCBnaXZlcyBtZSAtRU5PREVWCj4+Cj4+IEl0IHNob3VsZCAianVzdCB3
b3JrIiBpZiB0aGUgbWFuaWZlc3Qgc2lnbmF0dXJlcyBtYXRjaCB0aGUgd2hhdCB0aGUKPj4gZ3Jl
eWJ1cyBncGlvIGRyaXZlciBleHBlY3RzLgo+Pgo+PiBEbyB5b3UgZ2V0IGFueSBsb2dnaW5nIG1l
c3NhZ2VzIGluIHlvdXIga2VybmVsIGxvZyB3aGVuIHlvdSBkbyB0aGlzPwo+Cj4gVGhlIGJ1bmRs
ZSBjbGFzcyBpbiB0aGUgbWFuaWZlc3Qgd2FzIGluY29ycmVjdC4gU2hvdWxkIGhhdmUgYmVlbiAw
eDBhCj4gKGJyaWRnZWQgcGh5KSAtIEdQSU8gcHJvdG9jb2wgaXMgYSBnbyA7LSkKCkdyZWF0IHRv
IHNlZSBzb21lb25lIHRyeWluZyB0byB1c2UgaXQsIGxldCBtZSBrbm93IGlmIHlvdSBuZWVkCmFu
eXRoaW5nIG1vcmUgYW5kIEkgd2lsbCB0cnkgdG8gaGF2ZSBtb3JlIGF0dGVudGlvbiB0byB0aGlz
IGxpc3QuCgpDaGVlcnMsCiAgIFJ1aQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpncmV5YnVzLWRldiBtYWlsaW5nIGxpc3QKZ3JleWJ1cy1kZXZAbGlzdHMu
bGluYXJvLm9yZwpodHRwczovL2xpc3RzLmxpbmFyby5vcmcvbWFpbG1hbi9saXN0aW5mby9ncmV5
YnVzLWRldgo=
