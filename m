Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 337A91A9682
	for <lists+greybus-dev@lfdr.de>; Wed, 15 Apr 2020 10:30:47 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 65B876605A
	for <lists+greybus-dev@lfdr.de>; Wed, 15 Apr 2020 08:30:46 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 50C8566070; Wed, 15 Apr 2020 08:30:46 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FROM,HK_RANDOM_FROM,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 6966766054;
	Wed, 15 Apr 2020 08:30:25 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id D8FD161617
 for <greybus-dev@lists.linaro.org>; Wed, 15 Apr 2020 08:30:22 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id CB2916188F; Wed, 15 Apr 2020 08:30:22 +0000 (UTC)
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
 [209.85.128.65])
 by lists.linaro.org (Postfix) with ESMTPS id 2C5ED60F23
 for <greybus-dev@lists.linaro.org>; Wed, 15 Apr 2020 08:30:21 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id o81so10753789wmo.2
 for <greybus-dev@lists.linaro.org>; Wed, 15 Apr 2020 01:30:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=dc4svgaoPj8cPa0X2dzfQwqB2qRNRWZMSYToFXDF5KE=;
 b=JvDKLWuwonN2QDg7bGOIzAE8PHEu31s4qYoQFvGmx6E7zA9WUWjzcYR5+RDxNlavVW
 0tVxN02pV8rCAxDZjdvwyBi/5Rz1UutKVWbbZFUzmfKtxV/EX2Q/oQrTlRVuYZaOjC61
 rf5eX6PPYOj+FxJpY+h+E4WIZww4EGQdUu3QiL/xy5sYn6iRgZu1iJPoYkruAbsf6WJe
 ek8a8BJSJsyRcg4xuh9xcTA43+GmtT3VcgCKMbgL/k0O4MdGkVQ+mb7O2dI4xTyLigVx
 LBxfog4sH60FJImJuuk8LEuiwIjGamfYzHePFFaPtr9c7GosBUGPcUenJbpDOwl6yqxx
 P/Og==
X-Gm-Message-State: AGi0PubY/kzmWgv7wCcDK88p2nABYnA3ahPObTGAb44U7qUaancLvmLz
 2Dg2W7Mjk7+uHH4ikVlb4hg=
X-Google-Smtp-Source: APiQypLjonbFDJi3jxw1i1ANZLx5+YHURwfAKrIwK8Wglw04haWqjrRQ0EvRnmT0qeJUEyVbL8dgkA==
X-Received: by 2002:a1c:c2d4:: with SMTP id s203mr4305096wmf.128.1586939420233; 
 Wed, 15 Apr 2020 01:30:20 -0700 (PDT)
Received: from arch-thunder.localdomain (a109-49-46-234.cpe.netcabo.pt.
 [109.49.46.234])
 by smtp.gmail.com with ESMTPSA id 74sm9797001wrk.30.2020.04.15.01.30.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Apr 2020 01:30:19 -0700 (PDT)
Date: Wed, 15 Apr 2020 09:30:15 +0100
From: Rui Miguel Silva <rmfrfs@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Message-ID: <20200415083015.g6dhlnznmyvq5ibs@arch-thunder.localdomain>
References: <20200414161413.3036-1-ulf.hansson@linaro.org>
 <20200414161413.3036-20-ulf.hansson@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200414161413.3036-20-ulf.hansson@linaro.org>
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: mirq-linux@rere.qmqm.pl, Jesper Nilsson <jesper.nilsson@axis.com>,
 Alex Elder <elder@kernel.org>, Alex Dubov <oakad@yahoo.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, linux-mmc@vger.kernel.org,
 Adrian Hunter <adrian.hunter@intel.com>, Johan Hovold <johan@kernel.org>,
 Paul Cercueil <paul@crapouillou.net>, greybus-dev@lists.linaro.org,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Sascha Sommer <saschasommer@freenet.de>, Lars Persson <lars.persson@axis.com>,
 Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Bruce Chang <brucechang@via.com.tw>, Harald Welte <HaraldWelte@viatech.com>
Subject: Re: [greybus-dev] [PATCH 19/19] staging: greybus: sdio: Respect the
 cmd->busy_timeout from the mmc core
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

SGkgVWxmLApUaGFua3MgZm9yIHRoZSBwYXRjaC4KCk9uIFR1ZSwgQXByIDE0LCAyMDIwIGF0IDA2
OjE0OjEzUE0gKzAyMDAsIFVsZiBIYW5zc29uIHdyb3RlOgo+IFVzaW5nIGEgZml4ZWQgMXMgdGlt
ZW91dCBmb3IgYWxsIGNvbW1hbmRzIGlzIGEgYml0IHByb2JsZW1hdGljLgo+IAo+IEZvciBzb21l
IGNvbW1hbmRzIGl0IG1lYW5zIHdhaXRpbmcgbG9uZ2VyIHRoYW4gbmVlZGVkIGZvciB0aGUgdGlt
ZW91dCB0bwo+IGV4cGlyZSwgd2hpY2ggbWF5IG5vdCBhIGJpZyBpc3N1ZSwgYnV0IHN0aWxsLiBG
b3Igb3RoZXIgY29tbWFuZHMsIGxpa2UgZm9yCj4gYW4gZXJhc2UgKENNRDM4KSB0aGF0IHVzZXMg
YSBSMUIgcmVzcG9uc2UsIG1heSByZXF1aXJlIGxvbmdlciB0aW1lb3V0cyB0aGFuCj4gMXMuIElu
IHRoZXNlIGNhc2VzLCB3ZSBtYXkgZW5kIHVwIHRyZWF0aW5nIHRoZSBjb21tYW5kIGFzIGl0IGZh
aWxlZCwgd2hpbGUKPiBpdCBqdXN0IG5lZWRlZCBzb21lIG1vcmUgdGltZSB0byBjb21wbGV0ZSBz
dWNjZXNzZnVsbHkuCj4gCj4gRml4IHRoZSBwcm9ibGVtIGJ5IHJlc3BlY3RpbmcgdGhlIGNtZC0+
YnVzeV90aW1lb3V0LCB3aGljaCBpcyBwcm92aWRlZCBieQo+IHRoZSBtbWMgY29yZS4KPiAKPiBD
YzogUnVpIE1pZ3VlbCBTaWx2YSA8cm1mcmZzQGdtYWlsLmNvbT4KPiBDYzogSm9oYW4gSG92b2xk
IDxqb2hhbkBrZXJuZWwub3JnPgo+IENjOiBBbGV4IEVsZGVyIDxlbGRlckBrZXJuZWwub3JnPgo+
IENjOiBHcmVnIEtyb2FoLUhhcnRtYW4gPGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPgo+IENj
OiBncmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3JnCj4gU2lnbmVkLW9mZi1ieTogVWxmIEhhbnNz
b24gPHVsZi5oYW5zc29uQGxpbmFyby5vcmc+CkxHVE0KCkFja2VkLWJ5OiBSdWkgTWlndWVsIFNp
bHZhIDxybWZyZnNAZ21haWwuY29tPgoKLS0tLS0tCkNoZWVycywKICAgICBSdWkKCj4gLS0tCj4g
IGRyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL3NkaW8uYyB8IDEwICsrKysrKystLS0KPiAgMSBmaWxl
IGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvc2Rpby5jIGIvZHJpdmVycy9zdGFnaW5nL2dyZXli
dXMvc2Rpby5jCj4gaW5kZXggNjhjNTcxOGJlODI3Li5jNGIxNmJiNWMxYTQgMTAwNjQ0Cj4gLS0t
IGEvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvc2Rpby5jCj4gKysrIGIvZHJpdmVycy9zdGFnaW5n
L2dyZXlidXMvc2Rpby5jCj4gQEAgLTQxMSw2ICs0MTEsNyBAQCBzdGF0aWMgaW50IGdiX3NkaW9f
Y29tbWFuZChzdHJ1Y3QgZ2Jfc2Rpb19ob3N0ICpob3N0LCBzdHJ1Y3QgbW1jX2NvbW1hbmQgKmNt
ZCkKPiAgCXN0cnVjdCBnYl9zZGlvX2NvbW1hbmRfcmVxdWVzdCByZXF1ZXN0ID0gezB9Owo+ICAJ
c3RydWN0IGdiX3NkaW9fY29tbWFuZF9yZXNwb25zZSByZXNwb25zZTsKPiAgCXN0cnVjdCBtbWNf
ZGF0YSAqZGF0YSA9IGhvc3QtPm1ycS0+ZGF0YTsKPiArCXVuc2lnbmVkIGludCB0aW1lb3V0X21z
Owo+ICAJdTggY21kX2ZsYWdzOwo+ICAJdTggY21kX3R5cGU7Cj4gIAlpbnQgaTsKPiBAQCAtNDY5
LDkgKzQ3MCwxMiBAQCBzdGF0aWMgaW50IGdiX3NkaW9fY29tbWFuZChzdHJ1Y3QgZ2Jfc2Rpb19o
b3N0ICpob3N0LCBzdHJ1Y3QgbW1jX2NvbW1hbmQgKmNtZCkKPiAgCQlyZXF1ZXN0LmRhdGFfYmxr
c3ogPSBjcHVfdG9fbGUxNihkYXRhLT5ibGtzeik7Cj4gIAl9Cj4gIAo+IC0JcmV0ID0gZ2Jfb3Bl
cmF0aW9uX3N5bmMoaG9zdC0+Y29ubmVjdGlvbiwgR0JfU0RJT19UWVBFX0NPTU1BTkQsCj4gLQkJ
CQkmcmVxdWVzdCwgc2l6ZW9mKHJlcXVlc3QpLCAmcmVzcG9uc2UsCj4gLQkJCQlzaXplb2YocmVz
cG9uc2UpKTsKPiArCXRpbWVvdXRfbXMgPSBjbWQtPmJ1c3lfdGltZW91dCA/IGNtZC0+YnVzeV90
aW1lb3V0IDoKPiArCQlHQl9PUEVSQVRJT05fVElNRU9VVF9ERUZBVUxUOwo+ICsKPiArCXJldCA9
IGdiX29wZXJhdGlvbl9zeW5jX3RpbWVvdXQoaG9zdC0+Y29ubmVjdGlvbiwgR0JfU0RJT19UWVBF
X0NPTU1BTkQsCj4gKwkJCQkJJnJlcXVlc3QsIHNpemVvZihyZXF1ZXN0KSwgJnJlc3BvbnNlLAo+
ICsJCQkJCXNpemVvZihyZXNwb25zZSksIHRpbWVvdXRfbXMpOwo+ICAJaWYgKHJldCA8IDApCj4g
IAkJZ290byBvdXQ7Cj4gIAo+IC0tIAo+IDIuMjAuMQo+IApfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpncmV5YnVzLWRldiBtYWlsaW5nIGxpc3QKZ3JleWJ1
cy1kZXZAbGlzdHMubGluYXJvLm9yZwpodHRwczovL2xpc3RzLmxpbmFyby5vcmcvbWFpbG1hbi9s
aXN0aW5mby9ncmV5YnVzLWRldgo=
