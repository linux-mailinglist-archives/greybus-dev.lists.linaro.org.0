Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id BA76722CEFD
	for <lists+greybus-dev@lfdr.de>; Fri, 24 Jul 2020 22:02:51 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 5EDC466631
	for <lists+greybus-dev@lfdr.de>; Fri, 24 Jul 2020 20:02:50 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 4FCB1609A2; Fri, 24 Jul 2020 20:02:50 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FROM,MAILING_LIST_MULTI,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 12A3D66611;
	Fri, 24 Jul 2020 20:02:39 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 68B056038C
 for <greybus-dev@lists.linaro.org>; Fri, 24 Jul 2020 20:02:36 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 49F8366609; Fri, 24 Jul 2020 20:02:36 +0000 (UTC)
Received: from mail-il1-f195.google.com (mail-il1-f195.google.com
 [209.85.166.195])
 by lists.linaro.org (Postfix) with ESMTPS id 6ABA06038C
 for <greybus-dev@lists.linaro.org>; Fri, 24 Jul 2020 20:02:35 +0000 (UTC)
Received: by mail-il1-f195.google.com with SMTP id s21so8197474ilk.5
 for <greybus-dev@lists.linaro.org>; Fri, 24 Jul 2020 13:02:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Rzect1zoYXwpE7Gw9KZ24QWNMjzrgegunIj60A2shmc=;
 b=jIIiZxo7sbNJdFvSX5LXTpevNBPSS1e3tfaZBkUnhw+Wa0fP9pIUl0wj6B/Y3cabCm
 37VvP49vvDj38a910jTaL6omNW3ogfyqS/qkWPKG0K3FmxtKPCA463dASXI2nXHtcVfp
 ZXSo7q10jZdVBr8JV3haD8V1i7vepbY5R7MqOSQW4gx6dJXI9D9R0yDRBE+eS2rUbMAu
 kRumlGMu23rmpLaFZ80J0gW2j2wIE0gepiZjJhce5AkjOfc/6Z++pc8drsEGe8C0GIdu
 02oJIkKkvF51JAtyhEVf8R/3KB7nTZ6gG4qBpYCrs12rSc7Bu8rvXY8kcvlvRlf46B6a
 dQow==
X-Gm-Message-State: AOAM532uOyqlXtPGXUz3QZBsSuvttkWLZFxi+PaMTsyQ/kFa+rTxN4j9
 hI1tHdGV6u7gbvPP0yB2JMlvN3k58JZD6sHicrg=
X-Google-Smtp-Source: ABdhPJyvQs3lL/Xdz9IxTYCy4TTdyO5pnFyiqOQns6Htik+Knq15InRF3xZrgvTUFkekiFsJqGolwDnmlC13gEAEiA8=
X-Received: by 2002:a92:1805:: with SMTP id 5mr11092495ily.127.1595620954759; 
 Fri, 24 Jul 2020 13:02:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200724120637.GA427284@vaishnav-VirtualBox>
In-Reply-To: <20200724120637.GA427284@vaishnav-VirtualBox>
From: Christopher Friedt <chrisfriedt@gmail.com>
Date: Fri, 24 Jul 2020 16:02:23 -0400
Message-ID: <CAF4BF-T3do2jFYu_n_JXSOn8P8mk=_Z4XzKo_VfTK=-dskX4WA@mail.gmail.com>
To: Vaishnav M A <vaishnav@beagleboard.org>
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: rajkovic@mikroe.com, robh@kernel.org, elder@kernel.org,
 Drew Fustini <drew@beagleboard.org>, arnd@arndb.de, mchehab+huawei@kernel.org,
 johan@kernel.org, linux-kernel@vger.kernel.org, greybus-dev@lists.linaro.org,
 robertcnelson@beagleboard.org, davem@davemloft.net,
 zoran.stojsavljevic@gmail.com
Subject: Re: [greybus-dev] [PATCH] RFC : mikroBUS driver for add-on boards
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

SGkgVmFpc2huYXYhCgpPbiBGcmksIEp1bCAyNCwgMjAyMCBhdCA4OjA2IEFNIFZhaXNobmF2IE0g
QSA8dmFpc2huYXZAYmVhZ2xlYm9hcmQub3JnPiB3cm90ZToKPiArZW51bSBtaWtyb2J1c19wcm90
b2NvbCB7Cj4gKyAgICAgICBNSUtST0JVU19QUk9UT0NPTF9TUEkgPSAweDAxLAo+ICsgICAgICAg
TUlLUk9CVVNfUFJPVE9DT0xfSTJDID0gMHgwMiwKPiArICAgICAgIE1JS1JPQlVTX1BST1RPQ09M
X1VBUlQgPSAweDAzLAo+ICsgICAgICAgTUlLUk9CVVNfUFJPVE9DT0xfU1BJX0dQSU9DUyA9IDB4
MDQsCj4gKyAgICAgICBNSUtST0JVU19QUk9UT0NPTF9JMkNfTVVYID0gMHgwNQo+ICt9OwoKV2Un
dmUgYWxyZWFkeSBjaGF0dGVkIGFib3V0IHRoaXMgb2ZmLWxpc3QsIGJ1dCBJIGp1c3Qgd2FudGVk
IHRvIHBvc3QKaGVyZSBhcyB3ZWxsIHNvIG90aGVyIHJlYWRlcnMgYXJlIGF3YXJlLgoKR2l2ZW4g
dGhhdCBNaWtyb0J1cyB3aWxsIGJlIGxheWVyZWQgb24gdG9wIG9mIEdyZXlidXMgYW5kIHdpbGwg
dXNlCkdyZXlidXMgTWFuaWZlc3RzLCBhbmQgdGhhdCB0aGVyZSBpcyBhIHJlbGF0ZWQgY2hhbmdl
IFsxXSBmb3IgdGhlCkdyZXlidXMgTWFuaWZlc3QgdG9vbCAobWFuaWZlc3RvKSwgYW5kIGdpdmVu
IHRoYXQgb3RoZXIsIG5vbi1taWtyb0JVUywKZm9ybSBmYWN0b3JzIG1heSB3YW50IHRvIHJlLXVz
ZSB0aGUgIltkZXZpY2UtZGVzY3JpcHRvciBOXSIgdGFnLCBJCnRoaW5rIGl0IHdvdWxkIG1ha2Ug
c2Vuc2UgdG8gdXNlCgpbZGV2aWNlLWRlc2NyaXB0b3JdOwpwcm90b2NvbCA9IFtjcG9ydCBwcm90
b2NvbF0KCmluc3RlYWQgb2YKCltkZXZpY2UtZGVzY3JpcHRvcl07CnByb3RvY29sID0gW21pa3Jv
YnVzIHByb3RvY29sXS4KCkFzIHlvdSBtZW50aW9uZWQsIHRoZXJlIGlzIG5vIHNwZWNpZmljIG1p
a3JvYnVzIGkyYyBwcm90b2NvbCwgYW5kIHRoZQpwcm90b2NvbCBmaWVsZCBpcyByZWFsbHkganVz
dCBhbiBlbnVtZXJhdGlvbi4KCklmIHRoZXJlIGFyZSBubyBvdGhlciB0ZWNobmljYWwgaXNzdWVz
IGFzaWRlIGZyb20gdGhhdCwgSSB0aGluayBpdAp3b3VsZCBtYWtlIHNlbnNlIHRvIHVzZSB0aGUg
R3JleWJ1cyBDUG9ydCBwcm90b2NvbCBlbnVtZXJhdGlvbnMKaW5zdGVhZCBvZiBpbnRyb2R1Y2lu
ZyBhIG5ldyBvbmUgdGhhdCBpcyBsZXNzIGdlbmVyaWMuCgpUaGF0J3MgdGhlIG9ubHkgc2lnbmlm
aWNhbnQgY3JpdGlxdWUgSSBoYXZlLgoKT3RoZXJ3aXNlLCBncmVhdCB3b3JrIGFuZCB0aGFuayB5
b3UgZm9yIHlvdXIgY29udHJpYnV0aW9uIQoKWzFdIGh0dHBzOi8vZ2l0aHViLmNvbS9wcm9qZWN0
YXJhL21hbmlmZXN0by9wdWxsLzIKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZ3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0CmdyZXlidXMtZGV2QGxpc3RzLmxp
bmFyby5vcmcKaHR0cHM6Ly9saXN0cy5saW5hcm8ub3JnL21haWxtYW4vbGlzdGluZm8vZ3JleWJ1
cy1kZXYK
