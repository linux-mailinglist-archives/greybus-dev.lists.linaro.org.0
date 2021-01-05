Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id C44C72EB263
	for <lists+greybus-dev@lfdr.de>; Tue,  5 Jan 2021 19:21:52 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id E55C366727
	for <lists+greybus-dev@lfdr.de>; Tue,  5 Jan 2021 18:21:51 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id D78246672A; Tue,  5 Jan 2021 18:21:51 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS
	autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id E34B966729;
	Tue,  5 Jan 2021 18:21:33 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 8EC2A60F2C
 for <greybus-dev@lists.linaro.org>; Tue,  5 Jan 2021 18:21:31 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 75BFC66727; Tue,  5 Jan 2021 18:21:31 +0000 (UTC)
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by lists.linaro.org (Postfix) with ESMTPS id 33A4C60F2C
 for <greybus-dev@lists.linaro.org>; Tue,  5 Jan 2021 18:21:30 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id F22655C009F;
 Tue,  5 Jan 2021 13:21:29 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Tue, 05 Jan 2021 13:21:29 -0500
X-ME-Sender: <xms:Ka70X6CrPPhMDfQEQx1qF6ME5Z3lhcFJCqcc9nV_jdT9qmJf2qgXIg>
 <xme:Ka70X0dU_JPMhDmOJY-tp-rdVW-KFquwGYJ_Tv391EXbdS9oIIO0tKYpzGghHO0y7
 FdBJFBffI7Bsw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvdefjedgjeehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcu
 mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeevueehje
 fgfffgiedvudekvdektdelleelgefhleejieeugeegveeuuddukedvteenucfkphepkeef
 rdekiedrjeegrdeigeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
 hlfhhrohhmpehgrhgvgheskhhrohgrhhdrtghomh
X-ME-Proxy: <xmx:Ka70X6ehwJojrsBaSQFgc-26NzeYFUukesJhU9kV9krW4hl8nmdKkQ>
 <xmx:Ka70XwjL344WB1N6o3xSilOKrRfJgaoQUVut9gngF2-9P2nwIdFhzw>
 <xmx:Ka70X-SrERDPKdCVzUTL6GsCndvaTtm0J5awUKUcQEb6bTBJtsQMEg>
 <xmx:Ka70X8NVw0Fd2cS4xXO9Tae_GKJjh2IGQK1M2g2-u747u2D8maVC7A>
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 by mail.messagingengine.com (Postfix) with ESMTPA id 5A14E1080068;
 Tue,  5 Jan 2021 13:21:29 -0500 (EST)
Date: Tue, 5 Jan 2021 19:22:53 +0100
From: Greg KH <greg@kroah.com>
To: Christopher Friedt <chrisfriedt@gmail.com>
Message-ID: <X/SuffmTcTuXj0dp@kroah.com>
References: <CAF4BF-R1gKuRZ3g3DSHROSxbmBT2gFJxSsZkzjNgBcw1mjuv5Q@mail.gmail.com>
 <135673dd-2732-e453-5833-796af3ea867b@linaro.org>
 <CAF4BF-QQFKTdQtgBXNPeSG+QwFJ7fetZPfkvuMn7Ajy51JUGvA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAF4BF-QQFKTdQtgBXNPeSG+QwFJ7fetZPfkvuMn7Ajy51JUGvA@mail.gmail.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: greybus-dev@lists.linaro.org, johan@kernel.org,
 Alex Elder <elder@linaro.org>
Subject: Re: [greybus-dev] Authentication and Ecryption
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

T24gVHVlLCBKYW4gMDUsIDIwMjEgYXQgMTI6Mzc6MzhQTSAtMDUwMCwgQ2hyaXN0b3BoZXIgRnJp
ZWR0IHdyb3RlOgo+IEhpIEFsZXggJiBhbGwuCj4gCj4gSGFwcHkgTmV3IFllYXIsIGFuZCB0aGFu
a3MgZm9yIGFsbCBvZiB0aGUgYWR2aWNlIDotKQo+IAo+IEkgZW5kZWQgdXAgdGFraW5nIGl0IGFu
ZCBhbSB1c2luZyBUTFMgZm9yIGF1dGhlbnRpY2F0aW9uIGFuZAo+IGVuY3J5cHRpb24uIFN0YW5k
YXJkcyBhcmUgbmljZS4KPiAKPiBCb3RoIG9uZS13YXkgYXV0aGVudGljYXRpb24gKHNpbWlsYXIg
dG8gSFRUUFMpIGFuZCBtdXR1YWwKPiBhdXRoZW50aWNhdGlvbiAoc2ltaWxhciB0byBTU0ggcHVi
bGljIGtleSkgYXJlIHN1cHBvcnRlZCBub3cgYmV0d2Vlbgo+IFplcGh5clsxXSBhbmQgR2JyaWRn
ZVsyXS4KPiAKPiBPbiBTYXQsIE5vdiA3LCAyMDIwIGF0IDEyOjMzIFBNIEFsZXggRWxkZXIgPGVs
ZGVyQGxpbmFyby5vcmc+IHdyb3RlOgo+ID4KPiA+IE9uIDkvMTEvMjAgODo1MiBBTSwgQ2hyaXN0
b3BoZXIgRnJpZWR0IHdyb3RlOgo+ID4gSSBhbHNvIGNvbmN1ciB3aXRoIEdyZWcncyBxdWVzdGlv
bnMgYWJvdXQgd2h5IHlvdSBmZWVsCj4gPiB0aGVzZSB0aGluZ3MgbmVlZCB0byBiZSBpbmNvcnBv
cmF0ZWQgKmludG8qIEdyZXlidXMsIHJhdGhlcgo+ID4gdGhhbiBzZXQgdXAgKmFyb3VuZCogR3Jl
eWJ1cyBzb21laG93LiAgT24gUHJvamVjdCBBcmEsIHRoZQo+IAo+IEkgd291bGQgYWxzbyBjb25j
dXIgYXQgdGhpcyBwb2ludC4gTXkgb3JpZ2luYWwgY2hhbmdlcyB3ZXJlIG1vc3RseQo+IGRvaW5n
IHRoZSBzYW1lIHRoaW5nIHRoYXQgVExTIGRvZXMgYnV0IGp1c3QgaW4gYSBub24tc3RhbmRhcmQg
d2F5Lgo+IE9yaWdpbmFsbHksIGl0IHdhcyBqdXN0IGEgcHJvb2Ygb2YgY29uY2VwdCBmb3IgdGhl
IGNsaWVudCBkdWUgdG8KPiB1bmRlcnNwZWNpZmljYXRpb24sIGJ1dCBUTFMganVzdCBtYWtlcyB3
YXkgbW9yZSBzZW5zZS4KPiAKPiBJJ3ZlIHVzZWQgWmVwaHlyJ3MgVExTIGV4dGVuc2lvbnMgZm9y
IHRoZSBzb2NrZXQgQVBJIGFuZCBPcGVuU1NMCj4gb24gdGhlIExpbnV4IHNpZGUuIFNvIGl0J3Mg
cHJldHR5IGNsZWFuIGFuZCBhbHNvIHZlcnkgdGVzdGFibGUuCj4gCj4gVGhlcmUgYXJlIG5vIGNo
YW5nZXMgcmVxdWlyZWQgdG8gdGhlIEdyZXlidXMgc3BlYyBzbyB0aGF0IHdvcmtzIGFzLWlzLAo+
IGFuZCBlbmNyeXB0aW9uIGlzIGtlcHQgYXMgYSB0cmFuc3BvcnQtbGF5ZXIgb3B0aW9uLiBGb3Ig
Z2JyaWRnZSwgaXQncwo+IGEgc2VwYXJhdGUgbG9naWNhbCB0cmFuc3BvcnQgYW5kIGNhbiBiZSB1
c2VkIGluZGVwZW5kZW50bHkgb2YKPiBwbGFpbi10ZXh0IFRDUC9JUCB0b28uIFRoZSBzZXJ2aWNl
IGlzIGFkdmVydGlzZWQgdXNpbmcKPiAiX2dyZXlidXNzLl90Y3AiIHJhdGhlciB0aGFuICJfZ3Jl
eWJ1cy5fdGNwIi4KCk5pY2UsIHRoYXQgc291bmRzIHZlcnkgcmVhc29uYWJsZS4KCj4gUXVpdGUg
YSBudW1iZXIgb2YgZmVhdHVyZXMgd2VyZSBhZGRlZCB0byBaZXBoeXIgdG8gc3VwcG9ydCB0aGlz
LCBpbmNsdWRpbmcKPiAKPiAqIEROUy1TRCAoYW5kIHNsaWdodCBtb2RpZmljYXRpb24gb2YgdGhl
IGV4aXN0aW5nIG1ETlMgaW1wbCkKPiAqIGFsaWduZWQgaGVhcCBhbGxvY2F0b3JzCj4gKiBkeW5h
bWljIHB0aHJlYWQgc3RhY2sgc3VwcG9ydAo+ICogc29tZSBtaW5vciBidWdmaXhlcyB0byBUQ1AK
PiAqIHNvbWUgZHJpdmVyIHN1cHBvcnQgZm9yIHRoZSBwaHlzaWNhbCBsYXllciAoSUVFRSA4MDIu
MTUuNCwgQkxFKQo+ICogYSBmb3J0aGNvbWluZyB0ZW1wbGF0ZSBmb3IgZXh0ZXJuYWwgbW9kdWxl
cwoKSGV5LCBldmVuIGJldHRlciwgWmVwaHlyIGlzIGJlbmVmaXRpbmcgZnJvbSB0aGlzLCBncmVh
dCB3b3JrLgoKPiBUaGUgZmFjdCB0aGF0IGdicmlkZ2UgdXNlcyBhIHNlcGFyYXRlIHNvY2tldCBw
ZXIgQ1BvcnQgKGFsdGhvdWdoIGtpbmQKPiBvZiBuaWNlIGNvbmNlcHR1YWxseSkgZG9lcyBoYXZl
IGEgbm9uLW5lZ2xpZ2FibGUgaW1wYWN0IG9uCj4gbWVtb3J5LWNvbnN0cmFpbmVkIGRldmljZXMg
dGhvdWdoLgoKSW4gd2hhdCB3YXk/ICBJcyB0aGlzIGJlY2F1c2UgYSBzb2NrZXQgaGFzIGEgbG90
IG9mIG1lbW9yeSBzdGF0ZSBuZWVkZWQsCm9yIGlzIHRoaXMgc29tZSBvdGhlciBncmV5YnVzIG92
ZXJoZWFkPwoKPiBUaGF0IGltcGFjdCBpcyBleGFjZXJiYXRlZCB3aGVuIFRMUyBpcyB0aHJvd24g
aW50byB0aGUgbWl4LiBJJ3ZlIGFkZGVkCj4gYW5vdGhlciBwYWlyIG9mIHRpY2tldHMgdG8gIGNv
bmNlbnRyYXRlIGFsbCB0cmFmZmljIGludG8gYSBzaW5nbGUgc29ja2V0Cj4gY29ubmVjdGlvbiBs
aWtlIHdoYXQgaXMgY3VycmVudGx5IGRvbmUgZm9yIHRoZSBVQVJUIHRyYW5zcG9ydC4gVGhhdCBy
ZWR1Y2VzCj4gbm90IG9ubHkgdGhlIG1lbW9yeSByZXF1aXJlZCBwZXIgc29ja2V0LCBidXQgYWxz
byB0aGUgZHVwbGljYXRpb24gb2YgVExTCj4gcmVzb3VyY2VzIG9uIGEgcGVyLXNvY2tldCBiYXNp
cyAoZXNwZWNpYWxseSB3aGVuIG11dHVhbCBhdXRoIGlzIHVzZWQpLiBBIGZ1dHVyZQo+IGNoYW5n
ZSBmb3IgZ2JyaWRnZSBhbmQgTGludXggbWlnaHQgYmUgdG8gbW92ZSBzb2NrZXQgSS9PIHRvIHRo
ZSBrZXJuZWwKPiBhZnRlciBUTFMgYXV0aCArIEFFUyBpcyBzZXQgdXAuIFRoYXQgd2FzIG91dCBv
ZiBzY29wZSBmb3IgbXkgZXhpc3RpbmcKPiBjb250cmFjdCwgYnV0IGl0IHdvdWxkIGJlICJpbnRl
cmVzdGluZyIgdG8gaW1wbGVtZW50Lgo+IAo+IEF0IHRoaXMgcG9pbnQsIG15IEdyZXlidXMgZm9y
IFplcGh5ciBtb2R1bGUgaXMgYWxwaGEgcmVhZHkuIEl0IHdvcmtzCj4gb3ZlciBVQVJULCBidXQg
YWxzbyBhbnkgb3RoZXIgdHJhbnNwb3J0IHRoYXQgc3VwcG9ydHMgVENQL0lQIHN1Y2ggYXMKPiBF
dGhlcm5ldCwgV2lGaSwgQkxFLCA4MDIuMTUuNCAoYm90aCAyLjQgR0h6IGFuZCBTdWIgR0h6KSwg
Q0FOCj4gKGFsdGhvdWdoIHRoYXQncyB1bnRlc3RlZCkuIFN0aWxsIGxvdHMgb2Ygd29yayB0byBi
ZSBkb25lIChsaWtlCj4gc3VwcG9ydCBmb3IgZGlmZmVyZW50IEdyZXlidXMgcHJvdG9jb2xzKSwg
YnV0IGl0J3MgcXVpdGUgdXNhYmxlIGZvcgo+IEdQSU8sIEkyQywgYW5kIFNQSSBub3cgOy0pCgpB
bnkgTGludXgga2VybmVsLXNpZGUgY2hhbmdlcyBuZWVkZWQgZm9yIGFueSBvZiB0aGlzPwoKSSBh
bSBpbnRlcmVzdGVkIGluIGdldHRpbmcgdGhlIHJlbWFpbmluZyBncmV5YnVzIGNvZGUgb3V0IG9m
IHN0YWdpbmcKdGhpcyB5ZWFyLCBhcyB0aGVyZSdzIG5vIGdvb2QgcmVhc29uIGZvciBpdCB0byBi
ZSBoYW5naW5nIGFyb3VuZCB3aXRoIG5vCnJlYWwgZGV2ZWxvcG1lbnQgaGFwcGVuaW5nLiAgSWYg
dGhlcmUncyBhbnl0aGluZyBsZWZ0IHRvIGJlIGRvbmUgb24gdGhlCkxpbnV4IHBvcnRpb24sIHRo
YXQgd291bGQgYmUgZ29vZCB0byBrbm93LCBvdGhlcndpc2UgSSB0aGluayB3ZSdsbCBqdXN0CnN0
YXJ0IG1vdmluZyBpbmRpdmR1YWwgZHJpdmVycyBvdXQgb2Ygc3RhZ2luZyBzbG93bHkuLi4KCnRo
YW5rcywKCmdyZWcgay1oCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmdyZXlidXMtZGV2IG1haWxpbmcgbGlzdApncmV5YnVzLWRldkBsaXN0cy5saW5hcm8u
b3JnCmh0dHBzOi8vbGlzdHMubGluYXJvLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2dyZXlidXMtZGV2
Cg==
