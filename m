Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id CAADC1F5AEC
	for <lists+greybus-dev@lfdr.de>; Wed, 10 Jun 2020 20:01:36 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id EA86261963
	for <lists+greybus-dev@lfdr.de>; Wed, 10 Jun 2020 18:01:35 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id DCC406197A; Wed, 10 Jun 2020 18:01:35 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id C07626198E;
	Wed, 10 Jun 2020 18:01:25 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 5DF48618C4
 for <greybus-dev@lists.linaro.org>; Wed, 10 Jun 2020 18:01:23 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 2B87A61963; Wed, 10 Jun 2020 18:01:23 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by lists.linaro.org (Postfix) with ESMTPS id AA9A9618C4
 for <greybus-dev@lists.linaro.org>; Wed, 10 Jun 2020 18:01:21 +0000 (UTC)
X-Originating-IP: 86.202.110.81
Received: from localhost (lfbn-lyo-1-15-81.w86-202.abo.wanadoo.fr
 [86.202.110.81])
 (Authenticated sender: alexandre.belloni@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 07B8EC0005;
 Wed, 10 Jun 2020 18:01:18 +0000 (UTC)
Date: Wed, 10 Jun 2020 20:01:18 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Mark Brown <broonie@kernel.org>
Message-ID: <20200610180118.GZ3720@piout.net>
References: <cover.1591802243.git.vaibhav.sr@gmail.com>
 <20200610173711.GK5005@sirena.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200610173711.GK5005@sirena.org.uk>
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, alsa-devel@alsa-project.org,
 Alex Elder <elder@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 greybus-dev@lists.linaro.org, Johan Hovold <johan@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [greybus-dev] [PATCH v2 0/6] Enable Greybus Audio codec driver
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

T24gMTAvMDYvMjAyMCAxODozNzoxMSswMTAwLCBNYXJrIEJyb3duIHdyb3RlOgo+IE9uIFdlZCwg
SnVuIDEwLCAyMDIwIGF0IDEwOjU4OjI0UE0gKzA1MzAsIFZhaWJoYXYgQWdhcndhbCB3cm90ZToK
PiA+IFRoZSBleGlzdGluZyBHQiBBdWRpbyBjb2RlYyBkcml2ZXIgaXMgZGVwZW5kZW50IG9uIE1T
TTg5OTQgQXVkaW8gZHJpdmVyLgo+ID4gRHVyaW5nIHRoZSBkZXZlbG9wbWVudCBzdGFnZSwgdGhp
cyBkZXBlbmRlbmN5IHdhcyBjb25maWd1cmVkIGR1ZSB0bwo+ID4gdmFyaW91cyBjaGFuZ2VzIGlu
dm9sdmVkIGluIE1TTSBBdWRpbyBkcml2ZXIgdG8gZW5hYmxlIGFkZHRpb25hbCBjb2RlYwo+ID4g
Y2FyZCBhbmQgc29tZSBvZiB0aGUgY2hhbmdlcyBwcm9wb3NlZCBpbiBtYWlubGluZSBBU29DIGZy
YW1ld29yay4KPiAKPiBJJ20gbm90IHN1cmUgd2h5IHlvdSdyZSBjb3B5aW5nIG1lIG9uIGEgc3Rh
Z2luZyBkcml2ZXI/ICBJIGRvbid0IHJlY2FsbAo+IHRoZSBiYXNlIGRyaXZlciBoYXZpbmcgYmVl
biBzdWJtaXR0ZWQgcHJvcGVybHkgeWV0LgoKVGhhdCB3YXMgbXkgc3VnZ2VzdGlvbiwgdGhlIHdo
b2xlIGhpc3RvcnkgaXMgdGhhdCBJIHN1Ym1pdHRlZCBhIHBhdGNoCnJlbW92aW5nIHRoaXMgZHJp
dmVyIGFzIGl0IHdhcyBub3QgZ2V0dGluZyBjb21waWxlZCBhbmQgc28gZGlkbid0IGdvCnRocm91
Z2ggdGhlIGNvbXBvbmVudGl6YXRpb24uIFNlZQpodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21s
LzIwMjAwNTA3MjEyOTEyLjU5OTQzMy0xLWFsZXhhbmRyZS5iZWxsb25pQGJvb3RsaW4uY29tLwoK
TXkgcG9pbnQgd2FzIHRoYXQgaWYgd2Ugd2VyZSB0byBrZWVwIHRoYXQgZHJpdmVyLCB0aGUgZ29h
bCB3b3VsZCBiZSB0bwpoYXZlIGl0IG91dCBvZiBzdGFnaW5nIGluc3RlYWQgb2Ygc2ltcGx5IG1h
a2luZyBpdCBjb21waWxlLgoKLS0gCkFsZXhhbmRyZSBCZWxsb25pLCBCb290bGluCkVtYmVkZGVk
IExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcKaHR0cHM6Ly9ib290bGluLmNvbQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpncmV5YnVzLWRldiBtYWls
aW5nIGxpc3QKZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpodHRwczovL2xpc3RzLmxpbmFy
by5vcmcvbWFpbG1hbi9saXN0aW5mby9ncmV5YnVzLWRldgo=
