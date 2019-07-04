Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id DFA895FB4C
	for <lists+greybus-dev@lfdr.de>; Thu,  4 Jul 2019 17:56:01 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 11B9D61781
	for <lists+greybus-dev@lfdr.de>; Thu,  4 Jul 2019 15:56:01 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 042D761787; Thu,  4 Jul 2019 15:56:00 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
	ip-10-150-125-211.ec2.internal
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_LOW,SPF_HELO_PASS autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 35C4261785;
	Thu,  4 Jul 2019 15:55:50 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 10AFF60E9E
 for <greybus-dev@lists.linaro.org>; Thu,  4 Jul 2019 15:55:48 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id F384A61781; Thu,  4 Jul 2019 15:55:47 +0000 (UTC)
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by lists.linaro.org (Postfix) with ESMTPS id D17E960E9E
 for <greybus-dev@lists.linaro.org>; Thu,  4 Jul 2019 15:55:46 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 9087918E2;
 Thu,  4 Jul 2019 11:55:46 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Thu, 04 Jul 2019 11:55:46 -0400
X-ME-Sender: <xms:gSEeXeSJZ13ZJDRYm6sQZAmbjTgoTtqJTRKVt5mo6hOYiNK66RhmlQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrfedvgdeljecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujghofgesthdtredttdervdenucfhrhhomhepofgrrhhk
 ucfirhgvvghruceomhhgrhgvvghrsegrnhhimhgrlhgtrhgvvghkrdgtohhmqeenucfkph
 epieekrddvrdekjedrleehnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmghhrvggvrhes
 rghnihhmrghltghrvggvkhdrtghomhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:gSEeXYCDTULzTwvjWIlqxBWrN2IdBStYQ-OePsOXybw_vFKaNM4x8Q>
 <xmx:gSEeXW3q0NqpSkm9RprpJqyoSOOrVIsEJeAlPTgtZjvzlUrWaRJUQw>
 <xmx:gSEeXeXHDI-EbjNhcop2oajjHqtaPOKdY4s2m9TcbOPA57ojRzoUJw>
 <xmx:giEeXe7g1ZXBuiE6DWNZzHP8LMlFf7jRSL0UpaHDETllnufFqKrrXQ>
Received: from blue.animalcreek.com (ip68-2-87-95.ph.ph.cox.net [68.2.87.95])
 by mail.messagingengine.com (Postfix) with ESMTPA id 6D81D380088;
 Thu,  4 Jul 2019 11:55:45 -0400 (EDT)
Received: by blue.animalcreek.com (Postfix, from userid 1000)
 id 56FC1A22246; Thu,  4 Jul 2019 08:55:42 -0700 (MST)
Date: Thu, 4 Jul 2019 08:55:42 -0700
From: Mark Greer <mgreer@animalcreek.com>
To: Colin King <colin.king@canonical.com>
Message-ID: <20190704155542.GA28490@animalcreek.com>
References: <20190704133031.28809-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190704133031.28809-1-colin.king@canonical.com>
Organization: Animal Creek Technologies, Inc.
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, Alex Elder <elder@kernel.org>,
 kernel-janitors@vger.kernel.org, Johan Hovold <johan@kernel.org>,
 greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: Re: [greybus-dev] [PATCH] staging: greybus: remove redundant
 assignment to variable is_empty
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

T24gVGh1LCBKdWwgMDQsIDIwMTkgYXQgMDI6MzA6MzFQTSArMDEwMCwgQ29saW4gS2luZyB3cm90
ZToKPiBGcm9tOiBDb2xpbiBJYW4gS2luZyA8Y29saW4ua2luZ0BjYW5vbmljYWwuY29tPgo+IAo+
IFRoZSB2YXJpYWJsZSBpc19lbXB0eSBpcyBiZWluZyBpbml0aWFsaXplZCB3aXRoIGEgdmFsdWUg
dGhhdCBpcyBuZXZlcgo+IHJlYWQgYW5kIGl0IGlzIGJlaW5nIHVwZGF0ZWQgbGF0ZXIgd2l0aCBh
IG5ldyB2YWx1ZS4gVGhlCj4gaW5pdGlhbGl6YXRpb24gaXMgcmVkdW5kYW50IGFuZCBjYW4gYmUg
cmVtb3ZlZC4KPiAKPiBBZGRyZXNzZXMtQ292ZXJpdHk6ICgiVW51c2VkIHZhbHVlIikKPiBTaWdu
ZWQtb2ZmLWJ5OiBDb2xpbiBJYW4gS2luZyA8Y29saW4ua2luZ0BjYW5vbmljYWwuY29tPgo+IC0t
LQo+ICBkcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9hdWRpb19tYW5hZ2VyLmMgfCAyICstCj4gIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9hdWRpb19tYW5hZ2VyLmMgYi9kcml2ZXJzL3N0
YWdpbmcvZ3JleWJ1cy9hdWRpb19tYW5hZ2VyLmMKPiBpbmRleCBjMmE0YWY0YzFkMDYuLjliMTll
YTlkM2ZhMSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9hdWRpb19tYW5h
Z2VyLmMKPiArKysgYi9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9hdWRpb19tYW5hZ2VyLmMKPiBA
QCAtODYsNyArODYsNyBAQCBFWFBPUlRfU1lNQk9MX0dQTChnYl9hdWRpb19tYW5hZ2VyX3JlbW92
ZSk7Cj4gIHZvaWQgZ2JfYXVkaW9fbWFuYWdlcl9yZW1vdmVfYWxsKHZvaWQpCj4gIHsKPiAgCXN0
cnVjdCBnYl9hdWRpb19tYW5hZ2VyX21vZHVsZSAqbW9kdWxlLCAqbmV4dDsKPiAtCWludCBpc19l
bXB0eSA9IDE7Cj4gKwlpbnQgaXNfZW1wdHk7Cj4gIAo+ICAJZG93bl93cml0ZSgmbW9kdWxlc19y
d3NlbSk7CgpSZXZpZXdlZC1ieTogTWFyayBHcmVlciA8bWdyZWVyQGFuaW1hbGNyZWVrLmNvbT4K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1k
ZXYgbWFpbGluZyBsaXN0CmdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKaHR0cHM6Ly9saXN0
cy5saW5hcm8ub3JnL21haWxtYW4vbGlzdGluZm8vZ3JleWJ1cy1kZXYK
