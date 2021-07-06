Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CC503BC9F5
	for <lists+greybus-dev@lfdr.de>; Tue,  6 Jul 2021 12:31:03 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 850F16693F
	for <lists+greybus-dev@lfdr.de>; Tue,  6 Jul 2021 10:31:02 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 73621668D5; Tue,  6 Jul 2021 10:30:53 +0000 (UTC)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id D92636697A;
	Tue,  6 Jul 2021 10:30:50 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 6F9716687E
 for <greybus-dev@lists.linaro.org>; Tue,  6 Jul 2021 10:27:08 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 67D3C668D4; Tue,  6 Jul 2021 10:27:08 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.linaro.org (Postfix) with ESMTPS id 3E3AA6687E
 for <greybus-dev@lists.linaro.org>; Tue,  6 Jul 2021 10:27:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 67D94619A5;
 Tue,  6 Jul 2021 10:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625567225;
 bh=0Vco6bcsV+Des5dnB/IHP43/fsWcFHTPga6X4P0iyiI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=MJ47WOBtCFnBMrkhOv+LFd3d2n5QIFWUez/HdhcKSgj7hDo7O0eQPQO5H1okLYNyY
 WRHGLatcUEVgmIJR5BCR7gEfLHN7Lv0rc0YJ5MyF740i+lCi8D4V+MGNYVLcohzTMs
 AfQKJwNYwrk/3LHkBQb8ARTgdmp51CHltJ3T5fWM60xGKOpwPUaG1eqdKH5Upw0qVs
 s7qgJDHkhXgsuZf0dm36DQ+Su4NaRp8y0KTbqHcRHQh4sMzfcc9GcElEIURZcXDone
 /RqrSOsALErH8v8KBG/HSN0T6lH+qCDwKWZm1izYVpvXQqH5K2135N2PlYwMDGoyI2
 kPGtTEoLasdOg==
Date: Tue, 6 Jul 2021 12:26:31 +0200
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@pengutronix.de>
Message-ID: <20210706122631.463bc671@coco.lan>
In-Reply-To: <20210706095037.1425211-1-u.kleine-koenig@pengutronix.de>
References: <20210706095037.1425211-1-u.kleine-koenig@pengutronix.de>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Tue, 06 Jul 2021 10:30:44 +0000
Subject: Re: [greybus-dev] [PATCH] bus: Make remove callback return void
X-BeenThere: greybus-dev@lists.linaro.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
List-Unsubscribe: <https://lists.linaro.org/mailman/options/greybus-dev>,
 <mailto:greybus-dev-request@lists.linaro.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/greybus-dev/>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Subscribe: <https://lists.linaro.org/mailman/listinfo/greybus-dev>,
 <mailto:greybus-dev-request@lists.linaro.org?subject=subscribe>
Cc: nvdimm@lists.linux.dev, Alexey Kardashevskiy <aik@ozlabs.ru>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Samuel Iglesias Gonsalvez <siglesias@igalia.com>,
 Jens Taprogge <jens.taprogge@taprogge.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, Jaroslav Kysela <perex@perex.cz>,
 linux-fpga@vger.kernel.org, Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 Paul Mackerras <paulus@samba.org>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Mike Christie <michael.christie@oracle.com>, Wei Liu <wei.liu@kernel.org>,
 Maxim Levitsky <maximlevitsky@gmail.com>, Samuel Holland <samuel@sholland.org>,
 Michael Ellerman <mpe@ellerman.id.au>, linux-acpi@vger.kernel.org,
 linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org,
 Tomas Winkler <tomas.winkler@intel.com>, Julien Grall <jgrall@amazon.com>,
 Ohad Ben-Cohen <ohad@wizery.com>, Alex Williamson <alex.williamson@redhat.com>,
 Alex Elder <elder@kernel.org>, linux-parisc@vger.kernel.org,
 Geoff Levand <geoff@infradead.org>, linux-usb@vger.kernel.org,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, Thorsten Scherer <t.scherer@eckelmann.de>,
 kernel@pengutronix.de, Jon Mason <jdmason@kudzu.us>,
 linux-ntb@googlegroups.com, Wu Hao <hao.wu@intel.com>,
 David Woodhouse <dwmw@amazon.co.uk>,
 Krzysztof =?UTF-8?B?V2lsY3p5xYRza2k=?= <kw@linux.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Manohar Vanga <manohar.vanga@gmail.com>, linux-wireless@vger.kernel.org,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 virtualization@lists.linux-foundation.org,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 target-devel@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-i2c@vger.kernel.org, Kai-Heng Feng <kai.heng.feng@canonical.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Stephen Hemminger <sthemmin@microsoft.com>, Ira Weiny <ira.weiny@intel.com>,
 Helge Deller <deller@gmx.de>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 industrypack-devel@lists.sourceforge.net, linux-mips@vger.kernel.org,
 Len Brown <lenb@kernel.org>, alsa-devel@alsa-project.org,
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, Johan Hovold <johan@kernel.org>,
 greybus-dev@lists.linaro.org, Bjorn Helgaas <bhelgaas@google.com>,
 Dave Jiang <dave.jiang@intel.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, Johannes Thumshirn <morbidrsa@gmail.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 Cornelia Huck <cohuck@redhat.com>, Wolfram Sang <wsa@kernel.org>,
 Joey Pabalan <jpabalanb@gmail.com>, Yehezkel Bernat <YehezkelShB@gmail.com>,
 Pali =?UTF-8?B?Um9ow6Fy?= <pali@kernel.org>,
 Bodo Stroesser <bostroesser@gmail.com>,
 Alison Schofield <alison.schofield@intel.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Tyrel Datwyler <tyreld@linux.ibm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Tom Rix <trix@redhat.com>, Jason Wang <jasowang@redhat.com>,
 SeongJae Park <sjpark@amazon.de>, linux-hyperv@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, Frank Li <lznuaa@gmail.com>,
 netdev@vger.kernel.org, Qinglang Miao <miaoqinglang@huawei.com>,
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Mark Gross <mgross@linux.intel.com>, linux-staging@lists.linux.dev,
 Dexuan Cui <decui@microsoft.com>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Kishon Vijay Abraham I <kishon@ti.com>, Chen-Yu Tsai <wens@csie.org>,
 linux-input@vger.kernel.org, Matt Porter <mporter@kernel.crashing.org>,
 Allen Hubbe <allenbh@gmail.com>, Alex Dubov <oakad@yahoo.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, Jiri Kosina <jikos@kernel.org>,
 Vladimir Zapolskiy <vz@mleia.com>, Ben Widawsky <ben.widawsky@intel.com>,
 Moritz Fischer <mdf@kernel.org>, linux-cxl@vger.kernel.org,
 Michael Buesch <m@bues.ch>, Dan Williams <dan.j.williams@intel.com>,
 Cristian Marussi <cristian.marussi@arm.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Martyn Welch <martyn@welchs.me.uk>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-mmc@vger.kernel.org,
 linux-sunxi@lists.linux.dev, Stefan Richter <stefanr@s5r6.in-berlin.de>,
 Sudeep Holla <sudeep.holla@arm.com>, "David S. Miller" <davem@davemloft.net>,
 Sven Van Asbroeck <TheSven73@gmail.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, linux-remoteproc@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Kirti Wankhede <kwankhede@nvidia.com>,
 Andreas Noever <andreas.noever@gmail.com>, linux-i3c@lists.infradead.org,
 linux1394-devel@lists.sourceforge.net, Lee Jones <lee.jones@linaro.org>,
 Arnd Bergmann <arnd@arndb.de>, linux-scsi@vger.kernel.org,
 Vishal Verma <vishal.l.verma@intel.com>, Russell King <linux@armlinux.org.uk>,
 Andy Gross <agross@kernel.org>, linux-serial@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Michael Jamet <michael.jamet@intel.com>,
 William Breathitt Gray <vilhelm.gray@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>, Hannes Reinecke <hare@suse.de>,
 Adrian Hunter <adrian.hunter@intel.com>, Juergen Gross <jgross@suse.com>,
 linuxppc-dev@lists.ozlabs.org, Takashi Iwai <tiwai@suse.com>,
 Alexandre Bounine <alex.bou9@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 Mark Brown <broonie@kernel.org>, Marc Zyngier <maz@kernel.org>,
 dmaengine@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>,
 Maximilian Luz <luzmaximilian@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: greybus-dev-bounces@lists.linaro.org
Sender: "greybus-dev" <greybus-dev-bounces@lists.linaro.org>
X-Virus-Scanned: ClamAV using ClamSMTP

RW0gVHVlLCAgNiBKdWwgMjAyMSAxMTo1MDozNyArMDIwMApVd2UgS2xlaW5lLUvDtm5pZyA8dS5r
bGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlPiBlc2NyZXZldToKCj4gVGhlIGRyaXZlciBjb3Jl
IGlnbm9yZXMgdGhlIHJldHVybiB2YWx1ZSBvZiB0aGlzIGNhbGxiYWNrIGJlY2F1c2UgdGhlcmUK
PiBpcyBvbmx5IGxpdHRsZSBpdCBjYW4gZG8gd2hlbiBhIGRldmljZSBkaXNhcHBlYXJzLgo+IAo+
IFRoaXMgaXMgdGhlIGZpbmFsIGJpdCBvZiBhIGxvbmcgbGFzdGluZyBjbGVhbnVwIHF1ZXN0IHdo
ZXJlIHNldmVyYWwKPiBidXNlcyB3ZXJlIGNvbnZlcnRlZCB0byBhbHNvIHJldHVybiB2b2lkIGZy
b20gdGhlaXIgcmVtb3ZlIGNhbGxiYWNrLgo+IEFkZGl0aW9uYWxseSBzb21lIHJlc291cmNlIGxl
YWtzIHdlcmUgZml4ZWQgdGhhdCB3ZXJlIGNhdXNlZCBieSBkcml2ZXJzCj4gcmV0dXJuaW5nIGFu
IGVycm9yIGNvZGUgaW4gdGhlIGV4cGVjdGF0aW9uIHRoYXQgdGhlIGRyaXZlciB3b24ndCBnbwo+
IGF3YXkuCj4gCj4gV2l0aCBzdHJ1Y3QgYnVzX3R5cGU6OnJlbW92ZSByZXR1cm5pbmcgdm9pZCBp
dCdzIHByZXZlbnRlZCB0aGF0IG5ld2x5Cj4gaW1wbGVtZW50ZWQgYnVzZXMgcmV0dXJuIGFuIGln
bm9yZWQgZXJyb3IgY29kZSBhbmQgc28gZG9uJ3QgYW50aWNpcGF0ZQo+IHdyb25nIGV4cGVjdGF0
aW9ucyBmb3IgZHJpdmVyIGF1dGhvcnMuCj4gCj4gU2lnbmVkLW9mZi1ieTogVXdlIEtsZWluZS1L
w7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4KPiAtLS0KPiBIZWxsbywKPiAK
PiB0aGlzIHBhdGNoIGRlcGVuZHMgb24gIlBDSTogZW5kcG9pbnQ6IE1ha2Ugc3RydWN0IHBjaV9l
cGZfZHJpdmVyOjpyZW1vdmUKPiByZXR1cm4gdm9pZCIgdGhhdCBpcyBub3QgeWV0IGFwcGxpZWQs
IHNlZQo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyMTAyMjMwOTA3NTcuNTc2MDQtMS11
LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGUuCj4gCj4gSSB0ZXN0ZWQgaXQgdXNpbmcgYWxs
bW9kY29uZmlnIG9uIGFtZDY0IGFuZCBhcm0sIGJ1dCBJIHdvdWxkbid0IGJlCj4gc3VycHJpc2Vk
IGlmIEkgc3RpbGwgbWlzc2VkIHRvIGNvbnZlcnQgYSBkcml2ZXIuIFNvIGl0IHdvdWxkIGJlIGdy
ZWF0IHRvCj4gZ2V0IHRoaXMgaW50byBuZXh0IGVhcmx5IGFmdGVyIHRoZSBtZXJnZSB3aW5kb3cg
Y2xvc2VzLgo+IAo+IEkgc2VuZCB0aGlzIG1haWwgdG8gYWxsIHBlb3BsZSB0aGF0IGdldF9tYWlu
dGFpbmVyLnBsIGVtaXRzIGZvciB0aGlzCj4gcGF0Y2guIEkgd29uZGVyIGhvdyBtYW55IHJlY2lw
ZW50cyB3aWxsIHJlZnVzZSB0aGlzIG1haWwgYmVjYXVzZSBvZiB0aGUKPiBsb25nIENjOiBsaXN0
IDotKQo+IAo+IEJlc3QgcmVnYXJkcwo+IFV3ZQo+IAoKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9t
ZWRpYS9wY2kvYnQ4eHgvYnR0di1ncGlvLmMgYi9kcml2ZXJzL21lZGlhL3BjaS9idDh4eC9idHR2
LWdwaW8uYwo+IGluZGV4IGI3MzAyMjVjYTg4Ny4uYTJiMThlMmJlZDFiIDEwMDY0NAo+IC0tLSBh
L2RyaXZlcnMvbWVkaWEvcGNpL2J0OHh4L2J0dHYtZ3Bpby5jCj4gKysrIGIvZHJpdmVycy9tZWRp
YS9wY2kvYnQ4eHgvYnR0di1ncGlvLmMKPiBAQCAtNDYsMTQgKzQ2LDEzIEBAIHN0YXRpYyBpbnQg
YnR0dl9zdWJfcHJvYmUoc3RydWN0IGRldmljZSAqZGV2KQo+ICAJcmV0dXJuIHN1Yi0+cHJvYmUg
PyBzdWItPnByb2JlKHNkZXYpIDogLUVOT0RFVjsKPiAgfQo+ICAKPiAtc3RhdGljIGludCBidHR2
X3N1Yl9yZW1vdmUoc3RydWN0IGRldmljZSAqZGV2KQo+ICtzdGF0aWMgdm9pZCBidHR2X3N1Yl9y
ZW1vdmUoc3RydWN0IGRldmljZSAqZGV2KQo+ICB7Cj4gIAlzdHJ1Y3QgYnR0dl9zdWJfZGV2aWNl
ICpzZGV2ID0gdG9fYnR0dl9zdWJfZGV2KGRldik7Cj4gIAlzdHJ1Y3QgYnR0dl9zdWJfZHJpdmVy
ICpzdWIgPSB0b19idHR2X3N1Yl9kcnYoZGV2LT5kcml2ZXIpOwo+ICAKPiAgCWlmIChzdWItPnJl
bW92ZSkKPiAgCQlzdWItPnJlbW92ZShzZGV2KTsKPiAtCXJldHVybiAwOwo+ICB9Cj4gIAoKQWNr
ZWQtYnk6IE1hdXJvIENhcnZhbGhvIENoZWhhYiA8bWNoZWhhYkBrZXJuZWwub3JnPiAjIGZvciBk
cml2ZXJzL21lZGlhCgoKVGhhbmtzLApNYXVybwpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpncmV5YnVzLWRldiBtYWlsaW5nIGxpc3QKZ3JleWJ1cy1kZXZA
bGlzdHMubGluYXJvLm9yZwpodHRwczovL2xpc3RzLmxpbmFyby5vcmcvbWFpbG1hbi9saXN0aW5m
by9ncmV5YnVzLWRldgo=
