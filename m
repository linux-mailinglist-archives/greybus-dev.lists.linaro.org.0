Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E9789EF1E
	for <lists+greybus-dev@lfdr.de>; Tue, 27 Aug 2019 17:38:43 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 939C960749
	for <lists+greybus-dev@lfdr.de>; Tue, 27 Aug 2019 15:38:42 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 81B0D607DB; Tue, 27 Aug 2019 15:38:42 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
	ip-10-150-125-211.ec2.internal
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_LOW,SPF_HELO_PASS autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id E5937616FC;
	Tue, 27 Aug 2019 15:38:32 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 203A4607DB
 for <greybus-dev@lists.linaro.org>; Tue, 27 Aug 2019 15:38:31 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 12F3260749; Tue, 27 Aug 2019 15:38:31 +0000 (UTC)
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by lists.linaro.org (Postfix) with ESMTPS id E45D260749
 for <greybus-dev@lists.linaro.org>; Tue, 27 Aug 2019 15:38:29 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id BA06436D8;
 Tue, 27 Aug 2019 11:38:29 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Tue, 27 Aug 2019 11:38:29 -0400
X-ME-Sender: <xms:dE5lXfh57OFmcA4zx2vnYh_HkDFbKhGEEthCk3OLmPtpSUpyIjezZw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudehkedggedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjohgfsehttdertddtredvnecuhfhrohhmpeforghr
 khcuifhrvggvrhcuoehmghhrvggvrhesrghnihhmrghltghrvggvkhdrtghomheqnecukf
 hppeeikedrvddrkedvrddujedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehmghhrvggv
 rhesrghnihhmrghltghrvggvkhdrtghomhenucevlhhushhtvghrufhiiigvpedu
X-ME-Proxy: <xmx:dE5lXXKvy54PRi81-ArXBqtrvBUVoKsk7aeOPqLOF6_30XnplahO6Q>
 <xmx:dE5lXZZP5gxalHX7Af02wPR2C5yEeF07eEZgKejF4PErgPqHx4aE3Q>
 <xmx:dE5lXY2eoXobTPyPO4KtvOl9L2IemykqDm2QCNafB9kpTYNXXJ2z7A>
 <xmx:dU5lXW_gmmLl6kqyQ660BbIKeeITqOvJf10hJPpCGYtdMhZF9c5SSBf6Sz0>
Received: from blue.animalcreek.com (ip68-2-82-171.ph.ph.cox.net [68.2.82.171])
 by mail.messagingengine.com (Postfix) with ESMTPA id 47DD980060;
 Tue, 27 Aug 2019 11:38:28 -0400 (EDT)
Received: by blue.animalcreek.com (Postfix, from userid 1000)
 id B2E0CA21E58; Tue, 27 Aug 2019 08:38:27 -0700 (MST)
Date: Tue, 27 Aug 2019 08:38:27 -0700
From: Mark Greer <mgreer@animalcreek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Message-ID: <20190827153827.GB26138@animalcreek.com>
References: <20190825055429.18547-1-gregkh@linuxfoundation.org>
 <20190825055429.18547-8-gregkh@linuxfoundation.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190825055429.18547-8-gregkh@linuxfoundation.org>
Organization: Animal Creek Technologies, Inc.
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, elder@kernel.org,
 Viresh Kumar <vireshk@kernel.org>, Vaibhav Hiremath <hvaibhav.linux@gmail.com>,
 johan@kernel.org, linux-kernel@vger.kernel.org, greybus-dev@lists.linaro.org,
 David Lin <dtwlin@gmail.com>
Subject: Re: [greybus-dev] [PATCH 7/9] staging: greybus: move core include
 files to include/linux/greybus/
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

T24gU3VuLCBBdWcgMjUsIDIwMTkgYXQgMDc6NTQ6MjdBTSArMDIwMCwgR3JlZyBLcm9haC1IYXJ0
bWFuIHdyb3RlOgo+IFdpdGggdGhlIGdvYWwgb2YgbW92aW5nIHRoZSBjb3JlIG9mIHRoZSBncmV5
YnVzIGNvZGUgb3V0IG9mIHN0YWdpbmcsIHRoZQo+IGluY2x1ZGUgZmlsZXMgbmVlZCB0byBiZSBt
b3ZlZCB0byBpbmNsdWRlL2xpbnV4L2dyZXlidXMuaCBhbmQKPiBpbmNsdWRlL2xpbnV4L2dyZXli
dXMvCj4gCj4gQ2M6IFZhaWJoYXYgSGlyZW1hdGggPGh2YWliaGF2LmxpbnV4QGdtYWlsLmNvbT4K
PiBDYzogSm9oYW4gSG92b2xkIDxqb2hhbkBrZXJuZWwub3JnPgo+IENjOiBBbGV4IEVsZGVyIDxl
bGRlckBrZXJuZWwub3JnPgo+IENjOiBWYWliaGF2IEFnYXJ3YWwgPHZhaWJoYXYuc3JAZ21haWwu
Y29tPgo+IENjOiBNYXJrIEdyZWVyIDxtZ3JlZXJAYW5pbWFsY3JlZWsuY29tPgo+IENjOiBWaXJl
c2ggS3VtYXIgPHZpcmVzaGtAa2VybmVsLm9yZz4KPiBDYzogUnVpIE1pZ3VlbCBTaWx2YSA8cm1m
cmZzQGdtYWlsLmNvbT4KPiBDYzogRGF2aWQgTGluIDxkdHdsaW5AZ21haWwuY29tPgo+IENjOiAi
QnJ5YW4gTydEb25vZ2h1ZSIgPHB1cmUubG9naWNAbmV4dXMtc29mdHdhcmUuaWU+Cj4gQ2M6IGdy
ZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKPiBDYzogZGV2ZWxAZHJpdmVyZGV2Lm9zdW9zbC5v
cmcKPiBTaWduZWQtb2ZmLWJ5OiBHcmVnIEtyb2FoLUhhcnRtYW4gPGdyZWdraEBsaW51eGZvdW5k
YXRpb24ub3JnPgo+IC0tLQoKQWNrZWQtYnk6IE1hcmsgR3JlZXIgPG1ncmVlckBhbmltYWxjcmVl
ay5jb20+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmdy
ZXlidXMtZGV2IG1haWxpbmcgbGlzdApncmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3JnCmh0dHBz
Oi8vbGlzdHMubGluYXJvLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2dyZXlidXMtZGV2Cg==
