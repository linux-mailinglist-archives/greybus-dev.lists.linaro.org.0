Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (ec2-54-158-76-221.compute-1.amazonaws.com [54.158.76.221])
	by mail.lfdr.de (Postfix) with ESMTPS id 635E3FC9E
	for <lists+greybus-dev@lfdr.de>; Tue, 30 Apr 2019 17:19:49 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 614CD608AF
	for <lists+greybus-dev@lfdr.de>; Tue, 30 Apr 2019 15:19:48 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 527C1608CE; Tue, 30 Apr 2019 15:19:48 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
	ip-10-150-125-211.ec2.internal
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_LOW,SPF_HELO_PASS autolearn=disabled version=3.4.2
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 32ABB60EF5;
	Tue, 30 Apr 2019 15:19:37 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 7E71A608AF
 for <greybus-dev@lists.linaro.org>; Tue, 30 Apr 2019 15:19:34 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 6F8C360832; Tue, 30 Apr 2019 15:19:34 +0000 (UTC)
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by lists.linaro.org (Postfix) with ESMTPS id 6587560832
 for <greybus-dev@lists.linaro.org>; Tue, 30 Apr 2019 15:19:33 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 95B2013CFD;
 Tue, 30 Apr 2019 11:19:32 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Tue, 30 Apr 2019 11:19:32 -0400
X-ME-Sender: <xms:gmfIXNIp3cgHm5z8P87KAp4zfzY5ZS_E_R4aKo-nfR_eV_Zx6humzQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrieehgddvkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujghofgesthdtredttdervdenucfhrhhomhepofgrrhhk
 ucfirhgvvghruceomhhgrhgvvghrsegrnhhimhgrlhgtrhgvvghkrdgtohhmqeenucfkph
 epieekrddvrdekjedrleehnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmghhrvggvrhes
 rghnihhmrghltghrvggvkhdrtghomhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:gmfIXAMRsaPLqfhQUsdfwSRIsOaWifswxzpnBY04sYzPHfRHrKLaUQ>
 <xmx:gmfIXNYROxrkfHO9y3_UupmN1f78ui2nxLhrcW1JjYak2qzBoYvOWA>
 <xmx:gmfIXEyQgwzU5MKiqAZNI3cZSNthcGfmFgflccqtzXSqTEtRkpX6yA>
 <xmx:hGfIXOtcc0O3WEiGO4HvZqWv4cKhud4QyMiawWAcTNunwmyh_u1ZBQ>
Received: from blue.animalcreek.com (ip68-2-87-95.ph.ph.cox.net [68.2.87.95])
 by mail.messagingengine.com (Postfix) with ESMTPA id 84A6B103CC;
 Tue, 30 Apr 2019 11:19:30 -0400 (EDT)
Received: by blue.animalcreek.com (Postfix, from userid 1000)
 id DEAC8A21364; Tue, 30 Apr 2019 08:19:28 -0700 (MST)
Date: Tue, 30 Apr 2019 08:19:28 -0700
From: Mark Greer <mgreer@animalcreek.com>
To: Vaibhav Agarwal <vaibhav.sr@gmail.com>
Message-ID: <20190430151928.GA1854@animalcreek.com>
References: <20190314064525.15756-1-kjlu@umn.edu>
 <CAAs364_6MpywkbsFdZrT5TEdrD8+u1eTmg-8_KY0dypy_PgMxQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAs364_6MpywkbsFdZrT5TEdrD8+u1eTmg-8_KY0dypy_PgMxQ@mail.gmail.com>
Organization: Animal Creek Technologies, Inc.
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, Alex Elder <elder@kernel.org>,
 Kangjie Lu <kjlu@umn.edu>, Johan Hovold <johan@kernel.org>,
 greybus-dev@lists.linaro.org, pakki001@umn.edu, linux-kernel@vger.kernel.org
Subject: Re: [greybus-dev] [PATCH] greybus: audio_manager: fix a missing
 check of ida_simple_get
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

T24gRnJpLCBNYXIgMTUsIDIwMTkgYXQgMTA6NDk6NDZBTSArMDUzMCwgVmFpYmhhdiBBZ2Fyd2Fs
IHdyb3RlOgo+IE9uIFRodSwgTWFyIDE0LCAyMDE5IGF0IDEyOjE1IFBNIEthbmdqaWUgTHUgPGtq
bHVAdW1uLmVkdT4gd3JvdGU6Cj4gPgo+ID4gaWRhX3NpbXBsZV9nZXQgY291bGQgZmFpbC4gVGhl
IGZpeCBpbnNlcnRzIGEgY2hlY2sgZm9yIGl0cwo+ID4gcmV0dXJuIHZhbHVlLgo+ID4KPiA+IFNp
Z25lZC1vZmYtYnk6IEthbmdqaWUgTHUgPGtqbHVAdW1uLmVkdT4KPiA+IC0tLQo+ID4gIGRyaXZl
cnMvc3RhZ2luZy9ncmV5YnVzL2F1ZGlvX21hbmFnZXIuYyB8IDMgKysrCj4gPiAgMSBmaWxlIGNo
YW5nZWQsIDMgaW5zZXJ0aW9ucygrKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3N0YWdp
bmcvZ3JleWJ1cy9hdWRpb19tYW5hZ2VyLmMgYi9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9hdWRp
b19tYW5hZ2VyLmMKPiA+IGluZGV4IGQ0NGIwNzBkODg2Mi4uYzJhNGFmNGMxZDA2IDEwMDY0NAo+
ID4gLS0tIGEvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvYXVkaW9fbWFuYWdlci5jCj4gPiArKysg
Yi9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9hdWRpb19tYW5hZ2VyLmMKPiA+IEBAIC00NSw2ICs0
NSw5IEBAIGludCBnYl9hdWRpb19tYW5hZ2VyX2FkZChzdHJ1Y3QgZ2JfYXVkaW9fbWFuYWdlcl9t
b2R1bGVfZGVzY3JpcHRvciAqZGVzYykKPiA+ICAgICAgICAgaW50IGVycjsKPiA+Cj4gPiAgICAg
ICAgIGlkID0gaWRhX3NpbXBsZV9nZXQoJm1vZHVsZV9pZCwgMCwgMCwgR0ZQX0tFUk5FTCk7Cj4g
PiArICAgICAgIGlmIChpZCA8IDApCj4gPiArICAgICAgICAgICAgICAgcmV0dXJuIGlkOwo+ID4g
Kwo+ID4gICAgICAgICBlcnIgPSBnYl9hdWRpb19tYW5hZ2VyX21vZHVsZV9jcmVhdGUoJm1vZHVs
ZSwgbWFuYWdlcl9rc2V0LAo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgaWQsIGRlc2MpOwo+ID4gICAgICAgICBpZiAoZXJyKSB7Cj4gCj4gUmV2aWV3ZWQt
Ynk6IFZhaWJoYXYgQWdhcndhbCA8dmFpYmhhdi5zckBnbWFpbC5jb20+CgpJIGFtIHNvcnJ5IGZv
ciBub3QgcmVzcG9uZGluZyB1bnRpbCBub3cuICBGb3Igc29tZSBzdHJhbmdlIHJlYXNvbiwgZW1h
aWwKZnJvbSB0aGlzIGxpc3QgYXJlIGJlaW5nIGRlbGF5ZWQuICBJIGp1c3QgZ290IHRoaXMgdG9k
YXkgKEFwcmlsIDMwKS4KClRoYW5rcyBmb3IgdGhlIHBhdGNoLCBLYW5namllLCBhbmQgdGhhbmtz
IGZvciB0aGUgcmV2aWV3LCBWYWliaGF2LgoKQW5kIEZXSVcsCgpSZXZpZXdlZC1ieTogTWFyayBH
cmVlciA8bWdyZWVyQGFuaW1hbGNyZWVrLmNvbT4KCk1hcmsKLS0KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0Cmdy
ZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKaHR0cHM6Ly9saXN0cy5saW5hcm8ub3JnL21haWxt
YW4vbGlzdGluZm8vZ3JleWJ1cy1kZXYK
