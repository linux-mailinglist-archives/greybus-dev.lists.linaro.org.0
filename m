Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id A209A1ABDCE
	for <lists+greybus-dev@lfdr.de>; Thu, 16 Apr 2020 12:26:16 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id C353D66031
	for <lists+greybus-dev@lfdr.de>; Thu, 16 Apr 2020 10:26:15 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id B752F65FC6; Thu, 16 Apr 2020 10:26:15 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id DC26766030;
	Thu, 16 Apr 2020 10:26:04 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 10DDC65FC6
 for <greybus-dev@lists.linaro.org>; Thu, 16 Apr 2020 10:26:02 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id EA90B619B0; Thu, 16 Apr 2020 10:26:01 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.linaro.org (Postfix) with ESMTPS id 9842A619B0
 for <greybus-dev@lists.linaro.org>; Thu, 16 Apr 2020 10:25:54 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 543B42192A;
 Thu, 16 Apr 2020 10:25:53 +0000 (UTC)
Date: Thu, 16 Apr 2020 12:25:51 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Ulf Hansson <ulf.hansson@linaro.org>
Message-ID: <20200416102551.GB820251@kroah.com>
References: <20200414161413.3036-1-ulf.hansson@linaro.org>
 <20200414161413.3036-20-ulf.hansson@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200414161413.3036-20-ulf.hansson@linaro.org>
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: mirq-linux@rere.qmqm.pl, Jesper Nilsson <jesper.nilsson@axis.com>,
 Alex Elder <elder@kernel.org>, Alex Dubov <oakad@yahoo.com>,
 greybus-dev@lists.linaro.org, Linus Walleij <linus.walleij@linaro.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, linux-mmc@vger.kernel.org,
 Adrian Hunter <adrian.hunter@intel.com>, Johan Hovold <johan@kernel.org>,
 Paul Cercueil <paul@crapouillou.net>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Sascha Sommer <saschasommer@freenet.de>, Lars Persson <lars.persson@axis.com>,
 Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>,
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

T24gVHVlLCBBcHIgMTQsIDIwMjAgYXQgMDY6MTQ6MTNQTSArMDIwMCwgVWxmIEhhbnNzb24gd3Jv
dGU6Cj4gVXNpbmcgYSBmaXhlZCAxcyB0aW1lb3V0IGZvciBhbGwgY29tbWFuZHMgaXMgYSBiaXQg
cHJvYmxlbWF0aWMuCj4gCj4gRm9yIHNvbWUgY29tbWFuZHMgaXQgbWVhbnMgd2FpdGluZyBsb25n
ZXIgdGhhbiBuZWVkZWQgZm9yIHRoZSB0aW1lb3V0IHRvCj4gZXhwaXJlLCB3aGljaCBtYXkgbm90
IGEgYmlnIGlzc3VlLCBidXQgc3RpbGwuIEZvciBvdGhlciBjb21tYW5kcywgbGlrZSBmb3IKPiBh
biBlcmFzZSAoQ01EMzgpIHRoYXQgdXNlcyBhIFIxQiByZXNwb25zZSwgbWF5IHJlcXVpcmUgbG9u
Z2VyIHRpbWVvdXRzIHRoYW4KPiAxcy4gSW4gdGhlc2UgY2FzZXMsIHdlIG1heSBlbmQgdXAgdHJl
YXRpbmcgdGhlIGNvbW1hbmQgYXMgaXQgZmFpbGVkLCB3aGlsZQo+IGl0IGp1c3QgbmVlZGVkIHNv
bWUgbW9yZSB0aW1lIHRvIGNvbXBsZXRlIHN1Y2Nlc3NmdWxseS4KPiAKPiBGaXggdGhlIHByb2Js
ZW0gYnkgcmVzcGVjdGluZyB0aGUgY21kLT5idXN5X3RpbWVvdXQsIHdoaWNoIGlzIHByb3ZpZGVk
IGJ5Cj4gdGhlIG1tYyBjb3JlLgo+IAo+IENjOiBSdWkgTWlndWVsIFNpbHZhIDxybWZyZnNAZ21h
aWwuY29tPgo+IENjOiBKb2hhbiBIb3ZvbGQgPGpvaGFuQGtlcm5lbC5vcmc+Cj4gQ2M6IEFsZXgg
RWxkZXIgPGVsZGVyQGtlcm5lbC5vcmc+Cj4gQ2M6IEdyZWcgS3JvYWgtSGFydG1hbiA8Z3JlZ2to
QGxpbnV4Zm91bmRhdGlvbi5vcmc+Cj4gQ2M6IGdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcK
PiBTaWduZWQtb2ZmLWJ5OiBVbGYgSGFuc3NvbiA8dWxmLmhhbnNzb25AbGluYXJvLm9yZz4KCkFj
a2VkLWJ5OiBHcmVnIEtyb2FoLUhhcnRtYW4gPGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpncmV5YnVzLWRl
diBtYWlsaW5nIGxpc3QKZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpodHRwczovL2xpc3Rz
LmxpbmFyby5vcmcvbWFpbG1hbi9saXN0aW5mby9ncmV5YnVzLWRldgo=
