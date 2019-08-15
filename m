Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id C68D78F4D8
	for <lists+greybus-dev@lfdr.de>; Thu, 15 Aug 2019 21:39:45 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id F252D609C3
	for <lists+greybus-dev@lfdr.de>; Thu, 15 Aug 2019 19:39:44 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id E6759615DE; Thu, 15 Aug 2019 19:39:44 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
	ip-10-150-125-211.ec2.internal
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_LOW,SPF_HELO_PASS autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 9F79C61719;
	Thu, 15 Aug 2019 19:39:30 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 75618609A2
 for <greybus-dev@lists.linaro.org>; Thu, 15 Aug 2019 19:39:27 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 69D44615DE; Thu, 15 Aug 2019 19:39:27 +0000 (UTC)
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by lists.linaro.org (Postfix) with ESMTPS id E32E8609A2
 for <greybus-dev@lists.linaro.org>; Thu, 15 Aug 2019 19:39:25 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 58E3121F9F;
 Thu, 15 Aug 2019 15:39:25 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Thu, 15 Aug 2019 15:39:25 -0400
X-ME-Sender: <xms:7LRVXTPPyMZWcLa6tpuCwSVxTz7V_lU0WQAjHzmDGmUGuyw6HBsG6A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudefuddgudefkecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujggfsehttdertddtredvnecuhfhrohhmpefirhgv
 ghcumffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucfkphepkeefrdekiedrkeelrd
 dutdejnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhrohgrhhdrtghomhen
 ucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:7LRVXXKywO7WSOCZgOnKfAVqopCZi_vR1AtH4NrKU2mOi9l4X815Jw>
 <xmx:7LRVXfNFTC-6fWqQy0L3VhwJNztXm9z9iKLNbp2gx_9bELhcjzKPQg>
 <xmx:7LRVXZOFHH4IKMo3K6fEhx7t5KUdKlv3hCBtaEGfQm7I_Jz2sYSC0g>
 <xmx:7bRVXbNlM0jNStMgJ779-029GA_3TAIQPj_YqoTCzPqLjIk7jPfkPw>
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 by mail.messagingengine.com (Postfix) with ESMTPA id 70B0F380075;
 Thu, 15 Aug 2019 15:39:24 -0400 (EDT)
Date: Thu, 15 Aug 2019 21:39:22 +0200
From: Greg KH <greg@kroah.com>
To: Christopher Friedt <chrisfriedt@gmail.com>
Message-ID: <20190815193922.GI30437@kroah.com>
References: <CAF4BF-R5yjta8zTcsFc8auYQ8cAHDqN0yM5rYwG6JctCbkOm1g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAF4BF-R5yjta8zTcsFc8auYQ8cAHDqN0yM5rYwG6JctCbkOm1g@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: greybus-dev@lists.linaro.org
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

T24gVGh1LCBBdWcgMTUsIDIwMTkgYXQgMTI6NDk6NTFQTSAtMDQwMCwgQ2hyaXN0b3BoZXIgRnJp
ZWR0IHdyb3RlOgo+IEhpIExpc3QhCj4gCj4gSSdtIGN1cnJlbnRseSB1c2luZyBnYnJpZGdlIC8g
dGNwaXAgd2l0aCB0aGUKPiBJSUQxLXNpbXBsZS1ncGlvLW1vZHVsZS5tbmZzIGV4YW1wbGUgdG8g
aG9vayB1cCBhIGZha2UgbW9kdWxlIHRoYXQKPiBqdXN0IHJlc3BvbmRzIHRvIHNvY2tldCBJL08u
Cj4gCj4gQSBjb3VwbGUgb2Ygc21hbGwgY2hhbmdlcyB3ZXJlIHJlcXVpcmVkLCBidXQgZXZlcnl0
aGluZyBzZWVtcyB0byBiZQo+IHBhcnNlZCwgYnVuZGxlcywgY3BvcnRzIGFyZSBhbGwgY3JlYXRl
ZC4KPiAKPiBIb3dldmVyLCBmb3Igc29tZSByZWFzb24sIGdyZXlidXMgZG9lcyBub3Qgc2VlbSB0
byBhdXRvbWF0aWNhbGx5IGJpbmQKPiB0aGUgZGV2aWNlIHRvIHRoZSBnYi1ncGlvIGRyaXZlciwg
bm9yIGRvZXMgaXQgcHJvYmUgdGhlIGRldmljZS4gSSBvbmx5Cj4gc2VlIHBpbmdzIGFmdGVyIHRo
ZSBzdmMgaGFzIGluc2VydGVkIG15IGZha2UgbW9kdWxlIGFuZCBoYW5kc2hha2UgaXMKPiBjb21w
bGV0ZS4KPiAKPiBJcyBhbnlvbmUgYXdhcmUgaWYgYSBzZXBhcmF0ZSBzdGVwIHRoYXQgaXMgcmVx
dWlyZWQgdG8gYmluZCB0aGUgZGV2aWNlCj4gdG8gdGhlIGRyaXZlcj8KPiBJJ3ZlIHRyaWVkCj4g
Cj4gc3VkbyBzaCAtYyAnZWNobyAtbiAxLTIuMi4xID4gL3N5cy9idXMvZ2JwaHkvZHJpdmVycy9n
cGlvL2JpbmQnCj4gCj4gYnV0IHRoYXQgZ2l2ZXMgbWUgLUVOT0RFVgoKSXQgc2hvdWxkICJqdXN0
IHdvcmsiIGlmIHRoZSBtYW5pZmVzdCBzaWduYXR1cmVzIG1hdGNoIHRoZSB3aGF0IHRoZQpncmV5
YnVzIGdwaW8gZHJpdmVyIGV4cGVjdHMuCgpEbyB5b3UgZ2V0IGFueSBsb2dnaW5nIG1lc3NhZ2Vz
IGluIHlvdXIga2VybmVsIGxvZyB3aGVuIHlvdSBkbyB0aGlzPwoKdGhhbmtzLAoKZ3JlZyBrLWgK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1k
ZXYgbWFpbGluZyBsaXN0CmdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKaHR0cHM6Ly9saXN0
cy5saW5hcm8ub3JnL21haWxtYW4vbGlzdGluZm8vZ3JleWJ1cy1kZXYK
