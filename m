Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (ec2-54-158-76-221.compute-1.amazonaws.com [54.158.76.221])
	by mail.lfdr.de (Postfix) with ESMTPS id 37F7EFDAA
	for <lists+greybus-dev@lfdr.de>; Tue, 30 Apr 2019 18:19:57 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 295C960746
	for <lists+greybus-dev@lfdr.de>; Tue, 30 Apr 2019 16:19:56 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 17CFC61725; Tue, 30 Apr 2019 16:19:56 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
	ip-10-150-125-211.ec2.internal
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_LOW,SPF_HELO_PASS autolearn=disabled version=3.4.2
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 71AD1615C0;
	Tue, 30 Apr 2019 16:19:45 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id C3B1560746
 for <greybus-dev@lists.linaro.org>; Tue, 30 Apr 2019 16:19:43 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id A9AF260F31; Tue, 30 Apr 2019 16:19:43 +0000 (UTC)
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by lists.linaro.org (Postfix) with ESMTPS id 8EDAA60746
 for <greybus-dev@lists.linaro.org>; Tue, 30 Apr 2019 16:19:42 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 36F4915984;
 Tue, 30 Apr 2019 12:19:42 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Tue, 30 Apr 2019 12:19:42 -0400
X-ME-Sender: <xms:nXXIXFprjjjuh_Rd_P6tANfqsaJezOEB8idFM9d3WD8tStZDeOlR2w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrieehgdegtdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujghofgesthdtredttdervdenucfhrhhomhepofgrrhhk
 ucfirhgvvghruceomhhgrhgvvghrsegrnhhimhgrlhgtrhgvvghkrdgtohhmqeenucfkph
 epieekrddvrdekjedrleehnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmghhrvggvrhes
 rghnihhmrghltghrvggvkhdrtghomhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:nXXIXFVKeodp4kxyAgHNUVIcr4VRsLUYaaljItW_jziUS13tKZUHoQ>
 <xmx:nXXIXMqakYotppLOV8X_54g2t-FGjB4ebAgl2-SGv2w6jb-pnmRWqw>
 <xmx:nXXIXJGFErkcuisIqxJ6wqKEn1AgoT0NryZ3WR8_Rm64EkmMIg29Yg>
 <xmx:nnXIXDuZ0tqSjCc_H7hAPEYwbypo3rycWVNeRWOfjEOORW2r9LV38A>
Received: from blue.animalcreek.com (ip68-2-87-95.ph.ph.cox.net [68.2.87.95])
 by mail.messagingengine.com (Postfix) with ESMTPA id 31AB8103CB;
 Tue, 30 Apr 2019 12:19:41 -0400 (EDT)
Received: by blue.animalcreek.com (Postfix, from userid 1000)
 id 7A6AAA21364; Tue, 30 Apr 2019 09:19:40 -0700 (MST)
Date: Tue, 30 Apr 2019 09:19:40 -0700
From: Mark Greer <mgreer@animalcreek.com>
To: Alex Elder <elder@linaro.org>
Message-ID: <20190430161940.GA3422@animalcreek.com>
References: <20190430152148.GB1854@animalcreek.com>
 <791e334e-9e70-bd54-dbb2-57e03f120d4c@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <791e334e-9e70-bd54-dbb2-57e03f120d4c@linaro.org>
Organization: Animal Creek Technologies, Inc.
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: greybus-dev@lists.linaro.org
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

T24gVHVlLCBBcHIgMzAsIDIwMTkgYXQgMTA6NDk6NTFBTSAtMDUwMCwgQWxleCBFbGRlciB3cm90
ZToKPiBPbiA0LzMwLzE5IDEwOjIxIEFNLCBNYXJrIEdyZWVyIHdyb3RlOgo+ID4gSGkgZXZlcnlv
bmUuCj4gPiAKPiA+IElzIGFueW9uZSBlbHNlIGV4cGVyaWVuY2luZyBkZWxheXMgcmVjZWl2aW5n
IGVtYWlsIGZyb20gdGhpcyBsaXN0Pwo+ID4gCj4gPiBJIGp1c3QgcmVjZWl2ZWQgYSBidW5jaCB0
b2RheSAoQXByaWwgMzApIHdpdGggc29tZSBlbWFpbHMgZGF0aW5nIGJhY2sgYXMKPiA+IGZhciBh
cyBKYW4gMTUuCj4gCj4gSSBoYXZlbid0IG5vdGljZWQsIGJ1dCB0aGUgdHJhZmZpYyBpcyBsaWdo
dCBhbmQgaW50ZXJtaXR0ZW50LiAgTmV3Cj4gcG9zdGVycyBhcmVuJ3QgYWxsb3dlZCB0byBzZW5k
IHRvIHRoZSBsaXN0IHdpdGhvdXQgcGVybWlzc2lvbiwgYW5kCj4gd2UgbGlzdCBhZG1pbmlzdHJh
dG9ycyAoSSB0aGluayBqdXN0IEdsZW4gYW5kIEkpIG1heSBub3QgYmUgYXMKPiB0aW1lbHkgYXMg
d2Ugc2hvdWxkIGJlIGFib3V0IHJldmlld2luZyB0aGVzZSB0aGluZ3MuCj4gCj4gSSBob3BlIGFs
bCBpcyB3ZWxsIHdpdGggeW91IE1hcmssIG5pY2UgdG8gaGVhciBmcm9tIHlvdSEKPiAKPiAJCQkJ
CS1BbGV4CgpIaSBBbGV4LgoKVGhhbmtzIGZvciByZXNwb25kaW5nIGFuZCBmb3IgdGhlIHdlbGwt
d2lzaGVzLgoKSXQgc2VlbXMgdG8gYmUganVzdCBtZSBhcyBJIHNlZSByZXNwb25zZXMgZnJvbSBv
dGhlciBwZW9wbGUgZHVyaW5nIG15CiJibGFja291dCIgcGVyaW9kIHNvIEkga25vdyB0aGV5IHdl
cmUgZ2V0dGluZyBlbWFpbHMuICBJIGFtIGF0IGEgbG9zcwpidXQgaWYgeW91IHNlZSBhbnkgZW1h
aWxzIHRoYXQgeW91IHRoaW5rIEkgc2hvdWxkIGJlIHJlc3BvbmRpbmcgdG8gYnV0CkknbSBub3Qs
IHBsZWFzZSBwb2tlIG1lIGRpcmVjdGx5ICh0aGF0IGdvZXMgZm9yIGFueW9uZSwgbm90IGp1c3Qg
QWxleCkuCgpJdCBpcyBuaWNlIHRvIGhlYXIgZnJvbSB5b3UgdG9vLiAgSSBob3BlIHlvdSBhcmUg
ZG9pbmcgd2VsbCBhbmQgbGlmZSBpcwpnb29kLiAgQXMgZm9yIG1lLCBJJ20gZG9pbmcgd2VsbC4g
IEknbSBrZWVwaW5nIGJ1c3kgYW5kIGhhdmluZyBmdW4gb24gdGhlCm9kZCBvY2Nhc2lvbi4gIDsp
CgpNYXJrCi0tCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmdyZXlidXMtZGV2IG1haWxpbmcgbGlzdApncmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3JnCmh0
dHBzOi8vbGlzdHMubGluYXJvLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2dyZXlidXMtZGV2Cg==
