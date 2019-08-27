Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 4936F9EF0C
	for <lists+greybus-dev@lfdr.de>; Tue, 27 Aug 2019 17:37:23 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 7BBEF607DB
	for <lists+greybus-dev@lfdr.de>; Tue, 27 Aug 2019 15:37:22 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 6FFD360EFB; Tue, 27 Aug 2019 15:37:22 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
	ip-10-150-125-211.ec2.internal
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_LOW,SPF_HELO_PASS autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 74927616FC;
	Tue, 27 Aug 2019 15:37:11 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 0003D60749
 for <greybus-dev@lists.linaro.org>; Tue, 27 Aug 2019 15:37:05 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id D71FB60EFB; Tue, 27 Aug 2019 15:37:05 +0000 (UTC)
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by lists.linaro.org (Postfix) with ESMTPS id D721A60749
 for <greybus-dev@lists.linaro.org>; Tue, 27 Aug 2019 15:37:04 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 60AD131CF;
 Tue, 27 Aug 2019 11:37:04 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Tue, 27 Aug 2019 11:37:04 -0400
X-ME-Sender: <xms:H05lXYnkQd8lwS2bE--rsSWqdnodWBByDJQB-N-IcBQuMzsABdWgmg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudehkedggedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjohgfsehttdertddtredvnecuhfhrohhmpeforghr
 khcuifhrvggvrhcuoehmghhrvggvrhesrghnihhmrghltghrvggvkhdrtghomheqnecukf
 hppeeikedrvddrkedvrddujedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehmghhrvggv
 rhesrghnihhmrghltghrvggvkhdrtghomhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:H05lXaAlMztUzYiTTKOCWRpljwzu_E8qxMgULqPo6Hk0O5s2htmgRA>
 <xmx:H05lXS2fkrWt6fRCTz9SfYyMXzsLLBOO0hKPnznqW_YFdxnuzd9X1g>
 <xmx:H05lXUJd_enQGTgYD64lMgO1FH4bYFFAhiESZB2UYqHP6qgTd_oyiA>
 <xmx:IE5lXfxNgmKDHoT7Nj6FPXGTRITOZMTiWX22bOfwt_tb4T4MGVe6Fg>
Received: from blue.animalcreek.com (ip68-2-82-171.ph.ph.cox.net [68.2.82.171])
 by mail.messagingengine.com (Postfix) with ESMTPA id CF7CD8005B;
 Tue, 27 Aug 2019 11:37:02 -0400 (EDT)
Received: by blue.animalcreek.com (Postfix, from userid 1000)
 id 12F9EA21E58; Tue, 27 Aug 2019 08:37:02 -0700 (MST)
Date: Tue, 27 Aug 2019 08:37:02 -0700
From: Mark Greer <mgreer@animalcreek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Message-ID: <20190827153702.GA26138@animalcreek.com>
References: <20190825055429.18547-1-gregkh@linuxfoundation.org>
 <20190825055429.18547-3-gregkh@linuxfoundation.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190825055429.18547-3-gregkh@linuxfoundation.org>
Organization: Animal Creek Technologies, Inc.
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, elder@kernel.org,
 Viresh Kumar <vireshk@kernel.org>, johan@kernel.org,
 linux-kernel@vger.kernel.org, greybus-dev@lists.linaro.org
Subject: Re: [greybus-dev] [PATCH 2/9] staging: greybus: remove license
	"boilerplate"
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

T24gU3VuLCBBdWcgMjUsIDIwMTkgYXQgMDc6NTQ6MjJBTSArMDIwMCwgR3JlZyBLcm9haC1IYXJ0
bWFuIHdyb3RlOgo+IFdoZW4gdGhlIGdyZXlidXMgZHJpdmVycyB3ZXJlIGNvbnZlcnRlZCB0byBT
UERYIGlkZW50aWZpZXJzIGZvciB0aGUKPiBsaWNlbnNlIHRleHQsIHNvbWUgbGljZW5zZSBib2ls
ZXJwbGF0ZSB3YXMgbm90IHJlbW92ZWQuICBDbGVhbiB0aGlzIHVwCj4gYnkgcmVtb3ZpbmcgdGhp
cyB1bm5lZWRlZCB0ZXh0IG5vdy4KPiAKPiBDYzogSm9oYW4gSG92b2xkIDxqb2hhbkBrZXJuZWwu
b3JnPgo+IENjOiBBbGV4IEVsZGVyIDxlbGRlckBrZXJuZWwub3JnPgo+IENjOiBWYWliaGF2IEFn
YXJ3YWwgPHZhaWJoYXYuc3JAZ21haWwuY29tPgo+IENjOiBNYXJrIEdyZWVyIDxtZ3JlZXJAYW5p
bWFsY3JlZWsuY29tPgo+IENjOiBWaXJlc2ggS3VtYXIgPHZpcmVzaGtAa2VybmVsLm9yZz4KPiBD
YzogIkJyeWFuIE8nRG9ub2dodWUiIDxwdXJlLmxvZ2ljQG5leHVzLXNvZnR3YXJlLmllPgo+IENj
OiBncmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3JnCj4gQ2M6IGRldmVsQGRyaXZlcmRldi5vc3Vv
c2wub3JnCj4gU2lnbmVkLW9mZi1ieTogR3JlZyBLcm9haC1IYXJ0bWFuIDxncmVna2hAbGludXhm
b3VuZGF0aW9uLm9yZz4KPiAtLS0KCkFja2VkLWJ5OiBNYXJrIEdyZWVyIDxtZ3JlZXJAYW5pbWFs
Y3JlZWtrLmNvbT4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZ3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0CmdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcK
aHR0cHM6Ly9saXN0cy5saW5hcm8ub3JnL21haWxtYW4vbGlzdGluZm8vZ3JleWJ1cy1kZXYK
