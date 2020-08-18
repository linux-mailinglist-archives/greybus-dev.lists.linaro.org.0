Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B64E2489AB
	for <lists+greybus-dev@lfdr.de>; Tue, 18 Aug 2020 17:24:19 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id B0E8F6162C
	for <lists+greybus-dev@lfdr.de>; Tue, 18 Aug 2020 15:24:18 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id A32F8619B1; Tue, 18 Aug 2020 15:24:18 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id AE28260EFF;
	Tue, 18 Aug 2020 15:24:06 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id B2E5160D77
 for <greybus-dev@lists.linaro.org>; Tue, 18 Aug 2020 15:24:04 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 9E29C60E68; Tue, 18 Aug 2020 15:24:04 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.linaro.org (Postfix) with ESMTPS id A02C760D77
 for <greybus-dev@lists.linaro.org>; Tue, 18 Aug 2020 15:24:03 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0B842206DA;
 Tue, 18 Aug 2020 15:24:02 +0000 (UTC)
Date: Tue, 18 Aug 2020 17:24:26 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Vaishnav M A <vaishnav@beagleboard.org>
Message-ID: <20200818152426.GA713928@kroah.com>
References: <20200818124815.11029-1-vaishnav@beagleboard.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200818124815.11029-1-vaishnav@beagleboard.org>
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: rajkovic@mikroe.com, robh@kernel.org, elder@kernel.org,
 drew@beagleboard.org, arnd@arndb.de, mchehab+huawei@kernel.org,
 linux-kernel@vger.kernel.org, johan@kernel.org, greybus-dev@lists.linaro.org,
 robertcnelson@beagleboard.org, davem@davemloft.net,
 zoran.stojsavljevic@gmail.com
Subject: Re: [greybus-dev] [RFC PATCH v2 0/3] mikroBUS driver for add-on
	boards
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

T24gVHVlLCBBdWcgMTgsIDIwMjAgYXQgMDY6MTg6MTJQTSArMDUzMCwgVmFpc2huYXYgTSBBIHdy
b3RlOgo+IEhpLAo+IAo+IFRoaXMgUGF0Y2ggc2VyaWVzIGlzIGFuIHVwZGF0ZSB0byB0aGUgbWlr
cm9CVVMgZHJpdmVyCj4gUkZDIHYxIFBhdGNoIDogaHR0cHM6Ly9sa21sLm9yZy9sa21sLzIwMjAv
Ny8yNC81MTggLgoKUGxlYXNlIHVzZSBsb3JlLmtlcm5lbC5vcmcgZm9yIGxpbmtzLCB3ZSBoYXZl
IG5vIGlkZWEgaWYgbGttbC5vcmcgd2lsbApiZSB3b3JraW5nIHRvbW9ycm93IG9yIG5vdCA6KQoK
PiBUaGUgbWlrcm9idXMgZHJpdmVyIGlzIHVwZGF0ZWQgdG8gYWRkIG1pa3JvYnVzIHBvcnRzIGZy
b20gZGV2aWNlLXRyZWUKPiBvdmVybGF5cywgdGhlIGRlYnVnIGludGVyZmFjZXMgZm9yIGFkZGlu
ZyBtaWtyb2J1cyBwb3J0cyB0aHJvdWdoIHN5c0ZTCj4gaXMgcmVtb3ZlZCwgYW5kIHRoZSBkcml2
ZXIgY29uc2lkZXJzIHRoZSBleHRlbmRlZCB1c2FnZSBvZiBtaWtyb2J1cwo+IHBvcnQgcGlucyBm
cm9tIHRoZWlyIHN0YW5kYXJkIHB1cnBvc2VzLgoKSSBkb24ndCBrbm93IHdoYXQgInByb3BlcnRp
ZXMiIGFuZCAiZGV2aWNlIiBtZWFuIHdpdGggcmVnYXJkcyB0byB0aGluZ3MKaGVyZSwgYW55IGNo
YW5jZSB5b3UgY2FuIHByb3ZpZGUgYSBwYXRjaCB0byB0aGUgZ3JleWJ1cyBzcGVjIGl0c2VsZiB0
aGF0CmFkZHMgdGhpcyBpbmZvcm1hdGlvbiBzbyB3ZSBjYW4gYmV0dGVyIHVuZGVyc3RhbmQgdGhl
IHJlYXNvbmluZyBoZXJlIHRvCnNlZSBpZiB0aGUga2VybmVsIGNoYW5nZXMgbWF0Y2ggdXAgd2l0
aCB0aGUgZ29hbHM/Cgp0aGFua3MsCgpncmVnIGstaApfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpncmV5YnVzLWRldiBtYWlsaW5nIGxpc3QKZ3JleWJ1cy1k
ZXZAbGlzdHMubGluYXJvLm9yZwpodHRwczovL2xpc3RzLmxpbmFyby5vcmcvbWFpbG1hbi9saXN0
aW5mby9ncmV5YnVzLWRldgo=
