Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id CD01A1EB7D4
	for <lists+greybus-dev@lfdr.de>; Tue,  2 Jun 2020 11:03:36 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id F22C660DA3
	for <lists+greybus-dev@lfdr.de>; Tue,  2 Jun 2020 09:03:35 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id E31C060F4F; Tue,  2 Jun 2020 09:03:35 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SUBJ_OBFU_PUNCT_FEW,
	SUBJ_OBFU_PUNCT_MANY autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id C454D65F82;
	Tue,  2 Jun 2020 09:01:40 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 3F90260628
 for <greybus-dev@lists.linaro.org>; Tue, 26 May 2020 15:28:47 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 2213665F93; Tue, 26 May 2020 15:28:47 +0000 (UTC)
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
 by lists.linaro.org (Postfix) with SMTP id 0236A60628
 for <greybus-dev@lists.linaro.org>; Tue, 26 May 2020 15:28:45 +0000 (UTC)
Received: (qmail 7552 invoked by uid 1000); 26 May 2020 11:28:44 -0400
Date: Tue, 26 May 2020 11:28:44 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Message-ID: <20200526152844.GA5809@rowland.harvard.edu>
References: <20200525182608.1823735-1-kw@linux.com>
 <20200525182608.1823735-9-kw@linux.com>
 <20200526063521.GC2578492@kroah.com>
 <20200526150744.GC75990@rocinante>
 <CAJZ5v0grVQhmk=q9_=CbBa8y_8XbTOeqv-Hb6Hivi6ffKsVHmQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJZ5v0grVQhmk=q9_=CbBa8y_8XbTOeqv-Hb6Hivi6ffKsVHmQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Tue, 02 Jun 2020 09:01:36 +0000
Cc: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Linux PCI <linux-pci@vger.kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Pavel Machek <pavel@ucw.cz>,
 linux-s390@vger.kernel.org,
 "open list:TARGET SUBSYSTEM" <linux-scsi@vger.kernel.org>,
 Kevin Hilman <khilman@kernel.org>, Julian Wiedmann <jwi@linux.ibm.com>,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Dan Carpenter <dan.carpenter@oracle.com>,
 Len Brown <lenb@kernel.org>, Linux PM <linux-pm@vger.kernel.org>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 Ursula Braun <ubraun@linux.ibm.com>, Johan Hovold <johan@kernel.org>,
 greybus-dev@lists.linaro.org, John Stultz <john.stultz@linaro.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Felipe Balbi <balbi@kernel.org>,
 Alex Elder <elder@kernel.org>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 "open list:ULTRA-WIDEBAND \(UWB\) SUBSYSTEM:" <linux-usb@vger.kernel.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, Karsten Graul <kgraul@linux.ibm.com>,
 netdev <netdev@vger.kernel.org>, "David S. Miller" <davem@davemloft.net>
Subject: Re: [greybus-dev] [PATCH 8/8] net/iucv: Use the new device_to_pm()
 helper to access struct dev_pm_ops
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

T24gVHVlLCBNYXkgMjYsIDIwMjAgYXQgMDU6MTk6MDdQTSArMDIwMCwgUmFmYWVsIEouIFd5c29j
a2kgd3JvdGU6Cj4gT24gVHVlLCBNYXkgMjYsIDIwMjAgYXQgNTowNyBQTSBLcnp5c3p0b2YgV2ls
Y3p5xYRza2kgPGt3QGxpbnV4LmNvbT4gd3JvdGU6Cj4gPgo+ID4gSGVsbG8gR3JlZywKPiA+Cj4g
PiBbLi4uXQo+ID4gPiBJdCdzICJpbnRlcmVzdGluZyIgaG93IHVzaW5nIHlvdXIgbmV3IGhlbHBl
ciBkb2Vzbid0IGFjdHVhbGx5IG1ha2UgdGhlCj4gPiA+IGNvZGUgc21hbGxlci4gIFBlcmhhcHMg
aXQgaXNuJ3QgYSBnb29kIGhlbHBlciBmdW5jdGlvbj8KPiA+Cj4gPiBUaGUgaWRlYSBmb3IgdGhl
IGhlbHBlciB3YXMgaW5zcGlyZWQgYnkgdGhlIGNvbW1lbnQgRGFuIG1hZGUgdG8gQmpvcm4KPiA+
IGFib3V0IEJqb3JuJ3MgY2hhbmdlLCBhcyBwZXI6Cj4gPgo+ID4gICBodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9kcml2ZXJkZXYtZGV2ZWwvMjAxOTEwMTYxMzUwMDIuR0EyNDY3OEBrYWRhbS8KPiA+
Cj4gPiBJdCBsb29rZWQgbGlrZSBhIGdvb2QgaWRlYSB0byB0cnkgdG8gcmVkdWNlIHRoZSBmb2xs
b3dpbmc6Cj4gPgo+ID4gICBkZXYtPmRyaXZlciAmJiBkZXYtPmRyaXZlci0+cG0gJiYgZGV2LT5k
cml2ZXItPnBtLT5wcmVwYXJlCj4gPgo+ID4gSW50byBzb21ldGhpbmcgbW9yZSBzdWNjaW5jdC4g
IEFsYmVpdCwgZ2l2ZW4gdGhlIGZlZWRiYWNrIGZyb20geW91cnNlbGYKPiA+IGFuZCBSYWZhZWws
IEkgZ2F0aGVyIHRoYXQgdGhpcyBoZWxwZXIgaXMgbm90IHJlYWxseSBhIGdvb2QgYWRkaXRpb24u
Cj4gCj4gSU1PIGl0IGNvdWxkIGJlIHVzZWQgZm9yIHJlZHVjaW5nIGNvZGUgZHVwbGljYXRpb24g
bGlrZSB5b3UgZGlkIGluIHRoZQo+IFBDSSBjb2RlLCBidXQgbm90IG5lY2Vzc2FyaWx5IGluIHRo
ZSBvdGhlciBwbGFjZXMgd2hlcmUgdGhlIGNvZGUgaW4KPiBxdWVzdGlvbiBpcyBub3QgZXhhY3Rs
eSBkdXBsaWNhdGVkLgoKVGhlIGNvZGUgY291bGQgYmUgYSBsaXR0bGUgbW9yZSBzdWNjaW5jdCwg
YWx0aG91Z2ggaXQgd291bGRuJ3QgZml0IGV2ZXJ5IAp1c2FnZS4gIEZvciBleGFtcGxlLAoKI2Rl
ZmluZSBwbV9kb19jYWxsYmFjayhkZXYsIG1ldGhvZCkgXAoJKGRldi0+ZHJpdmVyICYmIGRldi0+
ZHJpdmVyLT5wbSAmJiBkZXYtPmRyaXZlci0+cG0tPmNhbGxiYWNrID8gXAoJZGV2LT5kcml2ZXIt
PnBtLT5jYWxsYmFjayhkZXYpIDogMCkKClRoZW4gdGhlIHVzYWdlIGlzIHNvbWV0aGluZyBsaWtl
OgoKCXJldCA9IHBtX2RvX2NhbGxiYWNrKGRldiwgcHJlcGFyZSk7CgpXb3VsZCB0aGlzIGJlIGFu
IG92ZXJhbGwgaW1wcm92ZW1lbnQ/CgpBbGFuIFN0ZXJuCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmdyZXlidXMtZGV2IG1haWxpbmcgbGlzdApncmV5YnVz
LWRldkBsaXN0cy5saW5hcm8ub3JnCmh0dHBzOi8vbGlzdHMubGluYXJvLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2dyZXlidXMtZGV2Cg==
