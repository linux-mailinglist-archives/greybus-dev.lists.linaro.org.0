Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id E413D125A29
	for <lists+greybus-dev@lfdr.de>; Thu, 19 Dec 2019 04:57:44 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 10A596198D
	for <lists+greybus-dev@lfdr.de>; Thu, 19 Dec 2019 03:57:44 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 0531361981; Thu, 19 Dec 2019 03:57:43 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FROM,MAILING_LIST_MULTI,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 3DB8861991;
	Thu, 19 Dec 2019 03:57:24 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 3757160836
 for <greybus-dev@lists.linaro.org>; Mon, 16 Dec 2019 02:29:44 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 1E45A60B04; Mon, 16 Dec 2019 02:29:44 +0000 (UTC)
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com
 [209.85.166.172])
 by lists.linaro.org (Postfix) with ESMTPS id 37B9060836
 for <greybus-dev@lists.linaro.org>; Mon, 16 Dec 2019 02:29:43 +0000 (UTC)
Received: by mail-il1-f172.google.com with SMTP id b15so4217584iln.3
 for <greybus-dev@lists.linaro.org>; Sun, 15 Dec 2019 18:29:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8j43jisQ6JiFe82Q1du5QwR3Ykw0OlLPEckWdKC2/Pw=;
 b=jV5B0ENKK+u8Hx9JdTHyZ7HGcDxSKreaG2GcS8xhh50wjU9lGN6pbk3Wv+Lf1966PK
 IgYjA+o9yjbeUBnSvX5zrY+5goxmdRAKhNenXXziPdHctnkaRurvBcZvvMg9fTBriQI4
 UouUDkF8sJGwkmoWiCjV0h68f8JpmvrKlPiOOYDburq7wyJFzErBu9hJxtX4c+az+mAb
 aAPSUYP29DElQUDYWyQ0GzHyV5WUXh4v3TP2zUWMJyRlATSSc2jRqwG0/EaQkNozALDz
 nocWQThBTyFSxRclEtjjv6fC/8QvLp9QmXPWNYI+z057rOF2YBtpsA7L/6DZY3Jg/7cg
 m65g==
X-Gm-Message-State: APjAAAWaArTVVhYm/IsWzK/rEyZYalvrwSidbHrFMymBZBwosKHrrP8S
 iFwTOuX53uohMTKRgcZ4p5Swusn6K668zrSC6f8=
X-Google-Smtp-Source: APXvYqyI6Ti9HNvy+8yUHGqf4u8Mj7FIhNsvN3PsJo8O8ocD03m8vI3/OUYrD5ckXN6YBkPfrAL0G/1QxpoVvssGTYA=
X-Received: by 2002:a92:4717:: with SMTP id u23mr4990501ila.190.1576463382499; 
 Sun, 15 Dec 2019 18:29:42 -0800 (PST)
MIME-Version: 1.0
References: <CAEkB2ES3baAR-E9rqkkO+cEPCjvTnS1miKD_h8V7MSJz5a5eBw@mail.gmail.com>
 <20191215131310.GA10631@localhost>
In-Reply-To: <20191215131310.GA10631@localhost>
From: Navid Emamdoost <navid.emamdoost@gmail.com>
Date: Sun, 15 Dec 2019 20:29:31 -0600
Message-ID: <CAEkB2EQd5VO0+Kn9Q4=350R_OR8RSD4C_eyDV0ew-u-kyx2osw@mail.gmail.com>
To: Johan Hovold <johan@kernel.org>
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Thu, 19 Dec 2019 03:57:22 +0000
Cc: greybus-dev@lists.linaro.org, Alex Elder <elder@kernel.org>
Subject: Re: [greybus-dev] Potential memory leak in greybus/svc.c
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

R290IGl0ISBUaGFua3MgZm9yIGNsYXJpZnlpbmcuCgpPbiBTdW4sIERlYyAxNSwgMjAxOSBhdCA3
OjEzIEFNIEpvaGFuIEhvdm9sZCA8am9oYW5Aa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBTYXQs
IERlYyAxNCwgMjAxOSBhdCAwNTo0NDowNVBNIC0wNjAwLCBOYXZpZCBFbWFtZG9vc3Qgd3JvdGU6
Cj4gPiBIZWxsbywKPiA+Cj4gPiBJdCBzZWVtcyB0byBtZSB0aGVyZSBpcyBhIG1lbW9yeSBsZWFr
IGluIHRoZSBpbXBsZW1lbnRhdGlvbiBvZiBnYl9zdmNfY3JlYXRlKCkuCj4gPiBJbiB0aGUgZXJy
b3IgaGFuZGxpbmcgcGF0aCAobGFiZWxlZCBhcyBlcnJfcHV0X2RldmljZSkgdGhlIGNvZGUKPiA+
IGNvcnJlY3RseSBwdXRzIHN2Yy0+ZGV2LCBidXQgSSBhbSBzdXNwaWNpb3VzIHRoYXQgc3ZjLT53
cSBpcyBsZWFraW5nLgo+ID4gVGhlIGFsbG9jYXRlZCBzdmMtPndxIG5lZWRzIGEgcmVsZWFzZSB2
aWEgZGVzdHJveV93b3JrcXVldWUoKSBpbiB0aGUKPiA+IGVycm9yIGhhbmRsaW5nIHBhdGguIEFt
IEkgbWlzc2luZyBzb21ldGhpbmc/Cj4KPiBZb3UgYXJlLiBKdXN0IGdyZXAgZm9yIGRlc3Ryb3lf
d29ya3F1ZXVlKCkgaW4gdGhhdCBmaWxlIHRvIHNlZSB3aGVyZQo+IHN2Yy0+d2MgaXMgZnJlZWQg
KGFuZCB0aGF0IGZ1bmN0aW9uIGlzIGNhbGxlZCBvbiBmaW5hbCBwdXRfZGV2aWNlKCkpLgo+Cj4g
Sm9oYW4KCgoKLS0gCk5hdmlkLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpncmV5YnVzLWRldiBtYWlsaW5nIGxpc3QKZ3JleWJ1cy1kZXZAbGlzdHMubGlu
YXJvLm9yZwpodHRwczovL2xpc3RzLmxpbmFyby5vcmcvbWFpbG1hbi9saXN0aW5mby9ncmV5YnVz
LWRldgo=
