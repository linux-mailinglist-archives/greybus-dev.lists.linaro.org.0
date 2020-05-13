Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AF051D1C86
	for <lists+greybus-dev@lfdr.de>; Wed, 13 May 2020 19:45:52 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 5CE9565F8A
	for <lists+greybus-dev@lfdr.de>; Wed, 13 May 2020 17:45:51 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 4FEA165F8C; Wed, 13 May 2020 17:45:51 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS
	autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 5EB8165F8B;
	Wed, 13 May 2020 17:45:37 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 1D79165F87
 for <greybus-dev@lists.linaro.org>; Wed, 13 May 2020 17:45:35 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 12D0465F8A; Wed, 13 May 2020 17:45:35 +0000 (UTC)
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by lists.linaro.org (Postfix) with ESMTPS id E6BBC65F87
 for <greybus-dev@lists.linaro.org>; Wed, 13 May 2020 17:45:33 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.west.internal (Postfix) with ESMTP id 7A5187C6;
 Wed, 13 May 2020 13:45:32 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Wed, 13 May 2020 13:45:33 -0400
X-ME-Sender: <xms:OzK8Xkvuw1T4NPdrAYzmREF7yFM_9jlkRJPPcAYK7_l0gmDNjoCLxA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrleeggdduudehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjohgfsehttdertddtredvnecuhfhrohhmpeforghr
 khcuifhrvggvrhcuoehmghhrvggvrhesrghnihhmrghltghrvggvkhdrtghomheqnecugg
 ftrfgrthhtvghrnhepfeekfeejkeegleduvdduveetteeuueeiveeujeeijeelvdeiveek
 ieevkedvtdegnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepieekrddvrd
 ekvddrudejudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhr
 ohhmpehmghhrvggvrhesrghnihhmrghltghrvggvkhdrtghomh
X-ME-Proxy: <xmx:OzK8Xhf0nR65uNaULO6efOwquN3A1Ah6ClhHaMT2kBvayvb2xtTMGA>
 <xmx:OzK8XvzvIeHSOlNITgSzP9NqG6m132Oqi5UikfgD1l-Q-7dKcAhtIg>
 <xmx:OzK8XnMCQ2LZQ4Wy61LleqOUCdxBmTJE_IpRiGk1Nn1GRoCnCElTlw>
 <xmx:PDK8XjlZkOstIWKTU1jRhu8y5LthaEmy9bsNpq_iELVujSWfjyGgNg>
Received: from blue.animalcreek.com (ip68-2-82-171.ph.ph.cox.net [68.2.82.171])
 by mail.messagingengine.com (Postfix) with ESMTPA id 0F179328005A;
 Wed, 13 May 2020 13:45:31 -0400 (EDT)
Received: by blue.animalcreek.com (Postfix, from userid 1000)
 id 23EC5A21E97; Wed, 13 May 2020 10:45:30 -0700 (MST)
Date: Wed, 13 May 2020 10:45:30 -0700
From: Mark Greer <mgreer@animalcreek.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Message-ID: <20200513174530.GA32096@animalcreek.com>
References: <20200507212912.599433-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200507212912.599433-1-alexandre.belloni@bootlin.com>
Organization: Animal Creek Technologies, Inc.
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, Alex Elder <elder@kernel.org>,
 Johan Hovold <johan@kernel.org>, greybus-dev@lists.linaro.org,
 linux-kernel@vger.kernel.org
Subject: Re: [greybus-dev] [PATCH] greybus: audio: remove unused code
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

T24gVGh1LCBNYXkgMDcsIDIwMjAgYXQgMTE6Mjk6MTFQTSArMDIwMCwgQWxleGFuZHJlIEJlbGxv
bmkgd3JvdGU6Cj4gR1JFWUJVU19BVURJT19NU004OTk0IGlzIG5vdCBhbiBleGlzdGluZyBjb25m
aWd1cmF0aW9uIG9wdGlvbiBhbmQgYXMKPiByZXBvcnRlZCBpbiBTZXB0ZW1iZXIgMjAxNiwgaXQg
ZGVwZW5kcyBvbiBhbiAib3V0LW9mLXRyZWUgcXVhbGNvbW0gYXVkaW8KPiBkcml2ZXIiLiBUaGlz
IGRyaXZlciBuZXZlciBtYWRlIGl0IHVwc3RyZWFtLgo+IAo+IGh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL2xrbWwvMjAxNjA5MjEwNzM5MDUuR0EzMTI2M0Brcm9haC5jb20vCj4gCj4gTW9yZW92ZXIs
IHRoZXJlIGRvZXNuJ3Qgc2VlbSB0byBiZSBhbnkgaW50ZXJlc3QgaW4gYWN0dWFsbHkgZml4aW5n
IHRoZQo+IGRyaXZlciBhcyBpdCB1c2VzIEFTb0MgQVBJcyB0aGF0IGhhdmUgYmVlbiByZW1vdmVk
IGZyb20gdGhlIGtlcm5lbCBpbiAyMDE4Cj4gYXMgc2hvd24gYnkgaXRzIHVzZSBvZiBzbmRfc29j
X3JlZ2lzdGVyX2NvZGVjIGFuZAo+IHNuZF9zb2NfY29kZWNfZ2V0X2RydmRhdGEsIHJlbW92ZWQg
aW4gY29tbWl0IDk5OWY3ZjVhZjhlYiAoIkFTb0M6IHJlbW92ZQo+IENvZGVjIHJlbGF0ZWQgY29k
ZSIpLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRyZSBCZWxsb25pIDxhbGV4YW5kcmUuYmVs
bG9uaUBib290bGluLmNvbT4KPiAtLS0KCkV2ZXJ5dGhpbmcgeW91IHNheSBpcyB0cnVlIGJ1dCBp
dCBpcyBzdGlsbCBraW5kYSBzYWQgdG8gc2VlIHRoaXMgZ28uCkJ1dCB0aGF0IGlzIGxpZmUuLi4g
IElmIGFuZCB3aGVuIHNvbWVvbmUgaGFzIHRoZSBtb3RpdmF0aW9uIHRvIGdldCB0aGlzCndvcmtp
bmcgYWdhaW4gdGhleSBjYW4gdGFrZSBhIGxvb2sgYXQgdGhlIGdpdCBoaXN0b3J5LgoKVGhhbmtz
IGZvciB0aGlzLCBBbGV4YW5kcmUuCgpBY2tlZC1ieTogTWFyayBHcmVlciA8bWdyZWVyQGFuaW1h
bGNyZWVrLmNvbT4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZ3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0CmdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcK
aHR0cHM6Ly9saXN0cy5saW5hcm8ub3JnL21haWxtYW4vbGlzdGluZm8vZ3JleWJ1cy1kZXYK
