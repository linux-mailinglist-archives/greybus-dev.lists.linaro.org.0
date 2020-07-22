Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 381882299CE
	for <lists+greybus-dev@lfdr.de>; Wed, 22 Jul 2020 16:08:55 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 5E72261873
	for <lists+greybus-dev@lfdr.de>; Wed, 22 Jul 2020 14:08:54 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 516A866558; Wed, 22 Jul 2020 14:08:54 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
	SPF_HELO_PASS autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 51B37665AA;
	Wed, 22 Jul 2020 14:08:06 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id ABF5066558
 for <greybus-dev@lists.linaro.org>; Wed, 22 Jul 2020 14:08:01 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 99C85665AA; Wed, 22 Jul 2020 14:08:01 +0000 (UTC)
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by lists.linaro.org (Postfix) with ESMTPS id 7C61066558
 for <greybus-dev@lists.linaro.org>; Wed, 22 Jul 2020 14:07:55 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id E8C355C00BC;
 Wed, 22 Jul 2020 10:07:54 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Wed, 22 Jul 2020 10:07:54 -0400
X-ME-Sender: <xms:OkgYX393EFO_11x57W-NGxm2JyJeIpXnI7J-RwaqcaV-78jy-D-h2A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrgeelgdejvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefirhgvghcu
 mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpedufefgvd
 euffethefhfefhffeugeekieefjeetgfeifedtjeefteduffehffdvveenucffohhmrghi
 nhepsggvrghglhgvsghorghrugdrohhrghdpkhgvrhhnvghlrdhorhhgnecukfhppeekfe
 drkeeirdekledruddtjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgr
 ihhlfhhrohhmpehgrhgvgheskhhrohgrhhdrtghomh
X-ME-Proxy: <xmx:OkgYXzsXabxPYNUl7X2tk5a9NLSqW5xb2HEpi9j4X2B-R3u_1mRTYw>
 <xmx:OkgYX1A-Yi8_POVSfvjF1a53mtV9eH-ob2jZ7eLX2dCSzkoBD7adbQ>
 <xmx:OkgYXzfUc4dgR2YOQWakkXqXSRK61oH9pSaFq3mrPa-msE5Ol_uWDQ>
 <xmx:OkgYX3bWRP8-r_xfH1VWUBo-crD95e9mTc8aewa51BkvR00bAxSQwQ>
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 by mail.messagingengine.com (Postfix) with ESMTPA id 5079B328005D;
 Wed, 22 Jul 2020 10:07:54 -0400 (EDT)
Date: Wed, 22 Jul 2020 16:07:54 +0200
From: Greg KH <greg@kroah.com>
To: Jason Kridner <jkridner@beagleboard.org>
Message-ID: <20200722140754.GA3755463@kroah.com>
References: <CAF4BF-SDCA3Q1n0h9y4cxjFHAHEO4q1E8xPeZP3XQR-7501mVA@mail.gmail.com>
 <797f68c2-4e40-81ab-3adb-27a37dd8d502@linaro.org>
 <CAK8RMs1ZPaczzFWiPnt6g=YMH6F7GE3PJtHrt4XDfpa_f_ArvQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8RMs1ZPaczzFWiPnt6g=YMH6F7GE3PJtHrt4XDfpa_f_ArvQ@mail.gmail.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: greybus-dev@lists.linaro.org, Alex Elder <elder@linaro.org>
Subject: Re: [greybus-dev] PR for examples manifests
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

T24gV2VkLCBKdWwgMjIsIDIwMjAgYXQgMDk6MDM6MzZBTSAtMDQwMCwgSmFzb24gS3JpZG5lciB3
cm90ZToKPiBPbiBXZWQsIEp1bCAyMiwgMjAyMCBhdCA3OjM4IEFNIEFsZXggRWxkZXIgPGVsZGVy
QGxpbmFyby5vcmc+IHdyb3RlOgo+IAo+ID4gT24gNy84LzIwIDEyOjA4IFBNLCBDaHJpc3RvcGhl
ciBGcmllZHQgd3JvdGU6Cj4gPiA+IEhpIGxpc3QsCj4gPgo+ID4gQ2hyaXN0b3BoZXIsIEknbSBz
b3JyeSB0aGlzIGhhc24ndCByZWNlaXZlZCB0aGUgYXR0ZW50aW9uIGl0Cj4gPiBkZXNlcnZlcy4g
IFRvIGJlIGhvbmVzdCwgeW91cnMgaXMgdGhlIGZpcnN0L29ubHkgcHVsbCByZXF1ZXN0IG9uCj4g
PiB0aGlzIHJlcG9zaXRvcnkgc2luY2UgUHJvamVjdCBBcmEgc2h1dCBkb3duLCBhbmQgdGhlIHN0
YXR1cyBvZgo+ID4gdGhlICJwcm9qZWN0YXJhIiBHaXRIdWIgYWNjb3VudCBpcyBhIGxpdHRsZSBm
dXp6eS4gIFlvdXIgcmVxdWVzdAo+ID4gaGFzIG5vdCBiZWVuIGZvcmdvdHRlbiwgd2UncmUganVz
dCB3b3JraW5nIG91dCBob3cgd2UnbGwgaGFuZGxlIGl0Lgo+ID4gV2UgbWlnaHQgbmVlZCB0byBy
ZS1ob3N0IHRoZSBvZmZpY2lhbCB1cHN0cmVhbSBvZiAibWFuaWZlc3RvIgo+ID4gc29tZXdoZXJl
IGVsc2UuCj4gPgo+IAo+IFdlIGhhdmUgYSBwcm9qZWN0IGF0IEJlYWdsZUJvYXJkLm9yZyB0aGF0
IHdpbGwgbWFrZSBnb29kIHVzZSBvZiBHcmV5YnVzIGFuZAo+IE1hbmlmZXN0by4gU2luY2UgR3Jl
eWJ1cyBpcyBpbiB0aGUgbWFpbmxpbmUgbm93LCBJ4oCZZCBzdWdnZXN0IGhvc3Rpbmcgb24KPiBr
ZXJuZWwub3JnIHdvdWxkIG1ha2Ugc2Vuc2UuIExvdHMgb2YgaW50ZXJlc3QgaGVyZSBpZiB0aGUg
cmVtYWluaW5nCj4gbG9uZy10ZXJtIGdvYWxzIG9mIFByb2plY3QgQXJhIGNhbiBiZSBzcGVsbGVk
IG91dCBhbmQgbWFpbnRhaW5lcnNoaXAgcGFzc2VkCj4gb24uCgpNYW55IG9mIHVzIGNhbiBwdXQg
dGhpcyBvbiBrZXJuZWwub3JnIGFzIHdlIGhhdmUgcGVyc29uYWwgYWNjb3VudHMsIGJ1dAp0aGVu
IHdlIG1pc3MgdGhlICJkcml2ZS1ieSIgZ2l0aHViIGNvbnRyaWJ1dGlvbnMgbGlrZSB0aGlzLCBy
aWdodD8KCnRoYW5rcywKCmdyZWcgay1oCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmdyZXlidXMtZGV2IG1haWxpbmcgbGlzdApncmV5YnVzLWRldkBsaXN0
cy5saW5hcm8ub3JnCmh0dHBzOi8vbGlzdHMubGluYXJvLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2dy
ZXlidXMtZGV2Cg==
