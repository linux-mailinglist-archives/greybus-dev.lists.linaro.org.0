Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id D3C4856CF5
	for <lists+greybus-dev@lfdr.de>; Wed, 26 Jun 2019 16:56:39 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 0117D606A3
	for <lists+greybus-dev@lfdr.de>; Wed, 26 Jun 2019 14:56:39 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id E9FFF6073E; Wed, 26 Jun 2019 14:56:38 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
	ip-10-150-125-211.ec2.internal
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_LOW,SPF_HELO_PASS autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 8D25E607C7;
	Wed, 26 Jun 2019 14:56:06 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 0056260695
 for <greybus-dev@lists.linaro.org>; Wed, 26 Jun 2019 14:56:02 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id E1573606A3; Wed, 26 Jun 2019 14:56:01 +0000 (UTC)
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by lists.linaro.org (Postfix) with ESMTPS id 4016A60695
 for <greybus-dev@lists.linaro.org>; Wed, 26 Jun 2019 14:55:59 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 9121F2BAC;
 Wed, 26 Jun 2019 10:55:58 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Wed, 26 Jun 2019 10:55:58 -0400
X-ME-Sender: <xms:fYcTXQqXGx5yU-dES0j1R-vePhQY3C_VDAeK27uM356TCOFY5YJPIw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudeigdekgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujghofgesthdtredttdervdenucfhrhhomhepofgrrhhk
 ucfirhgvvghruceomhhgrhgvvghrsegrnhhimhgrlhgtrhgvvghkrdgtohhmqeenucfkph
 epieekrddvrdekjedrleehnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmghhrvggvrhes
 rghnihhmrghltghrvggvkhdrtghomhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:fYcTXW-r9mZKwhKcaAHFHfPCc-aSvSgpB1AZUsnBGicbApfuN3ZAJA>
 <xmx:fYcTXQrZLKslPzPyub55rzp8dhaRm0gh2hklxDSXMuqjKa_S_C1z8Q>
 <xmx:fYcTXSWPeswHe0rLGPbBeQbl2p6XicXvFRi0S8Sc2MvgxbDWaKlH-w>
 <xmx:focTXQCL2tGIWWd1MZuxWf_PHy3pVd7B4A9cJmITl_KU7UQkmXkXvQ>
Received: from blue.animalcreek.com (ip68-2-87-95.ph.ph.cox.net [68.2.87.95])
 by mail.messagingengine.com (Postfix) with ESMTPA id 8E02D380085;
 Wed, 26 Jun 2019 10:55:57 -0400 (EDT)
Received: by blue.animalcreek.com (Postfix, from userid 1000)
 id 671A4A2233F; Wed, 26 Jun 2019 07:55:54 -0700 (MST)
Date: Wed, 26 Jun 2019 07:55:54 -0700
From: Mark Greer <mgreer@animalcreek.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Message-ID: <20190626145554.GA30952@animalcreek.com>
References: <20190430152148.GB1854@animalcreek.com>
 <791e334e-9e70-bd54-dbb2-57e03f120d4c@linaro.org>
 <20190502050917.jtxcg3mv3ik66t6l@vireshk-i7>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190502050917.jtxcg3mv3ik66t6l@vireshk-i7>
Organization: Animal Creek Technologies, Inc.
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: greybus-dev@lists.linaro.org, Alex Elder <elder@linaro.org>
Subject: Re: [greybus-dev] Anyone else having delays with this list?
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

T24gVGh1LCBNYXkgMDIsIDIwMTkgYXQgMTA6Mzk6MTdBTSArMDUzMCwgVmlyZXNoIEt1bWFyIHdy
b3RlOgo+IE9uIDMwLTA0LTE5LCAxMDo0OSwgQWxleCBFbGRlciB3cm90ZToKPiA+IE9uIDQvMzAv
MTkgMTA6MjEgQU0sIE1hcmsgR3JlZXIgd3JvdGU6Cj4gPiA+IEhpIGV2ZXJ5b25lLgo+ID4gPiAK
PiA+ID4gSXMgYW55b25lIGVsc2UgZXhwZXJpZW5jaW5nIGRlbGF5cyByZWNlaXZpbmcgZW1haWwg
ZnJvbSB0aGlzIGxpc3Q/Cj4gPiA+IAo+ID4gPiBJIGp1c3QgcmVjZWl2ZWQgYSBidW5jaCB0b2Rh
eSAoQXByaWwgMzApIHdpdGggc29tZSBlbWFpbHMgZGF0aW5nIGJhY2sgYXMKPiA+ID4gZmFyIGFz
IEphbiAxNS4KPiAKPiBJIGRvbid0IHRoaW5rIHlvdSBzaG91bGQgaGF2ZSByZWNlaXZlZCBzb21l
dGhpbmcgZnJvbSBKYW4gMTUgb24gMzB0aAo+IEFwcmlsLiBXaGF0IHBhdGNoIGl0IHdhcywgc28g
SSBjYW4gZG91YmxlIGNoZWNrLgoKSG1tLCB3ZWxsLCBJIGp1c3QgZ290IHRoaXMgZW1haWwgdG9k
YXkgKEp1bmUgMjYpLiAgOikKU29tZXRoaW5nIGlzIHVwIGJ1dCBpdCBzZWVtcyB0byBiZSBvbmx5
IG1lLiAgSSdsbCBzZWUgaWYgSSBoYXZlCnNvbWV0aGluZyBtaXMtY29uZmlndXJlZCBidXQgSSBk
b24ndCBzZWUgdGhpcyB3aXRoIGFueSBvdGhlciBtYWlsIGxpc3QuCgpBcyBmb3IgeW91ciBxdWVz
dGlvbiwgSSBkb24ndCBzZWUgb25lIGZyb20gSmFuIDE1IGVpdGhlci4gIE1heWJlIGl0IHdhcwp0
aGUgMTQgb3IgMTYsIEkgZG9uJ3QgcmVjYWxsIG5vdy4gIEl0IHdhcyBhIHJlc3BvbnNlIGZyb20g
R3JlZyBidXQgSQpkb24ndCByZWNhbGwgdGhlIHN1YmplY3QuICBUaGVyZSB3ZXJlIHNldmVyYWwg
dGhhdCB3ZXJlIGhlbGQgdXA7IHRoYXQKb25lIHdhcyB0aGUgb2xkZXN0LgoKPiA+IEkgaGF2ZW4n
dCBub3RpY2VkLCBidXQgdGhlIHRyYWZmaWMgaXMgbGlnaHQgYW5kIGludGVybWl0dGVudC4gIE5l
dwo+ID4gcG9zdGVycyBhcmVuJ3QgYWxsb3dlZCB0byBzZW5kIHRvIHRoZSBsaXN0IHdpdGhvdXQg
cGVybWlzc2lvbiwgYW5kCj4gPiB3ZSBsaXN0IGFkbWluaXN0cmF0b3JzIChJIHRoaW5rIGp1c3Qg
R2xlbiBhbmQgSSkgbWF5IG5vdCBiZSBhcwo+IAo+IEkgYW0gYWRtaW4gdG9vIGFuZCBkbyByZWxl
YXNlIHRoZXNlIGVtYWlscyB2ZXJ5IG9mdGVuIChldmVyeSBkYXkgb3IKPiB0d28pLgoKSXQgbXVz
dCBiZSBzb21ldGhpbmcgb24gbXkgc2lkZSBzbyBkb24ndCBzcGVuZCBtdWNoIHRpbWUgb24gaXQu
Ckp1c3QgZG8gbWUgYSBmYXZvciBhbmQgcGluZyBtZSBkaXJlY3RseSBpZiBJJ20gbm90IHJlc3Bv
bmRpbmcgdG8gYW4KZW1haWwgdGhhdCBJIHNob3VsZCBiZSAoaWYgeW91IHBsZWFzZSkuCgo+ID4g
dGltZWx5IGFzIHdlIHNob3VsZCBiZSBhYm91dCByZXZpZXdpbmcgdGhlc2UgdGhpbmdzLgo+ID4g
Cj4gPiBJIGhvcGUgYWxsIGlzIHdlbGwgd2l0aCB5b3UgTWFyaywgbmljZSB0byBoZWFyIGZyb20g
eW91IQo+IAo+IC0tIAo+IHZpcmVzaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpncmV5YnVzLWRldiBtYWlsaW5nIGxpc3QKZ3JleWJ1cy1kZXZAbGlzdHMu
bGluYXJvLm9yZwpodHRwczovL2xpc3RzLmxpbmFyby5vcmcvbWFpbG1hbi9saXN0aW5mby9ncmV5
YnVzLWRldgo=
