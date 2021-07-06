Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E1A33BC9F4
	for <lists+greybus-dev@lfdr.de>; Tue,  6 Jul 2021 12:31:01 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 639246693E
	for <lists+greybus-dev@lfdr.de>; Tue,  6 Jul 2021 10:31:00 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 46A2C668D5; Tue,  6 Jul 2021 10:30:52 +0000 (UTC)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 372E36696F;
	Tue,  6 Jul 2021 10:30:49 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 5A27B66884
 for <greybus-dev@lists.linaro.org>; Tue,  6 Jul 2021 10:25:49 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 53DDF6687E; Tue,  6 Jul 2021 10:25:49 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.linaro.org (Postfix) with ESMTPS id 2C58B66884
 for <greybus-dev@lists.linaro.org>; Tue,  6 Jul 2021 10:25:47 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1F9FB619A9;
 Tue,  6 Jul 2021 10:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625567145;
 bh=V+uGgWI7ODWDPnX93N2q4QxlyZDaMh1bjqAqdpBNoN4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=maDtNYbjZpDD0PKjc4+nM3Y213Akod8ccrNcZVsiy5KPtneyyahoRaDB5AbMrAwYJ
 m6oMoU+hcgZXNuCsoc9yJ2+bzIoCnRHsti/6uqBP8DKnPnXcD/khw96G8CUsBlPlvR
 uf0MJVwBY0fA5Npz0MHmvhwpdr+Wv2TOZMh4BI+fP5OWpWrOVsQ5Dquu1HsKCQm/Z3
 7bqMd9M3OziVf290y6vu/n9lxKpsWMkO6NowOo/L+CwTy3kWF456W471Gj/HhlY3go
 paE6+JOD9eP6KydGYz0nficgDNBo/ZvaGMWNwDkXP9s9hxxto+00KpCpg6+2NdC4+K
 HB6sMk/Pez8VQ==
Received: by pali.im (Postfix)
 id 93CEB6E9; Tue,  6 Jul 2021 12:25:42 +0200 (CEST)
Date: Tue, 6 Jul 2021 12:25:42 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Message-ID: <20210706102542.7lzvb6nm4ztmlarl@pali>
References: <20210706095037.1425211-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210706095037.1425211-1-u.kleine-koenig@pengutronix.de>
User-Agent: NeoMutt/20180716
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
 Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
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
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
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
 Mauro Carvalho Chehab <mchehab@kernel.org>,
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

T24gVHVlc2RheSAwNiBKdWx5IDIwMjEgMTE6NTA6MzcgVXdlIEtsZWluZS1Lw7ZuaWcgd3JvdGU6
Cj4gVGhlIGRyaXZlciBjb3JlIGlnbm9yZXMgdGhlIHJldHVybiB2YWx1ZSBvZiB0aGlzIGNhbGxi
YWNrIGJlY2F1c2UgdGhlcmUKPiBpcyBvbmx5IGxpdHRsZSBpdCBjYW4gZG8gd2hlbiBhIGRldmlj
ZSBkaXNhcHBlYXJzLgo+IAo+IFRoaXMgaXMgdGhlIGZpbmFsIGJpdCBvZiBhIGxvbmcgbGFzdGlu
ZyBjbGVhbnVwIHF1ZXN0IHdoZXJlIHNldmVyYWwKPiBidXNlcyB3ZXJlIGNvbnZlcnRlZCB0byBh
bHNvIHJldHVybiB2b2lkIGZyb20gdGhlaXIgcmVtb3ZlIGNhbGxiYWNrLgo+IEFkZGl0aW9uYWxs
eSBzb21lIHJlc291cmNlIGxlYWtzIHdlcmUgZml4ZWQgdGhhdCB3ZXJlIGNhdXNlZCBieSBkcml2
ZXJzCj4gcmV0dXJuaW5nIGFuIGVycm9yIGNvZGUgaW4gdGhlIGV4cGVjdGF0aW9uIHRoYXQgdGhl
IGRyaXZlciB3b24ndCBnbwo+IGF3YXkuCj4gCj4gV2l0aCBzdHJ1Y3QgYnVzX3R5cGU6OnJlbW92
ZSByZXR1cm5pbmcgdm9pZCBpdCdzIHByZXZlbnRlZCB0aGF0IG5ld2x5Cj4gaW1wbGVtZW50ZWQg
YnVzZXMgcmV0dXJuIGFuIGlnbm9yZWQgZXJyb3IgY29kZSBhbmQgc28gZG9uJ3QgYW50aWNpcGF0
ZQo+IHdyb25nIGV4cGVjdGF0aW9ucyBmb3IgZHJpdmVyIGF1dGhvcnMuCj4gCj4gU2lnbmVkLW9m
Zi1ieTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4K
CkFja2VkLWJ5OiBQYWxpIFJvaMOhciA8cGFsaUBrZXJuZWwub3JnPgoKPiAtLS0KPiBIZWxsbywK
PiAKPiB0aGlzIHBhdGNoIGRlcGVuZHMgb24gIlBDSTogZW5kcG9pbnQ6IE1ha2Ugc3RydWN0IHBj
aV9lcGZfZHJpdmVyOjpyZW1vdmUKPiByZXR1cm4gdm9pZCIgdGhhdCBpcyBub3QgeWV0IGFwcGxp
ZWQsIHNlZQo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyMTAyMjMwOTA3NTcuNTc2MDQt
MS11LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGUuCj4gCj4gSSB0ZXN0ZWQgaXQgdXNpbmcg
YWxsbW9kY29uZmlnIG9uIGFtZDY0IGFuZCBhcm0sIGJ1dCBJIHdvdWxkbid0IGJlCj4gc3VycHJp
c2VkIGlmIEkgc3RpbGwgbWlzc2VkIHRvIGNvbnZlcnQgYSBkcml2ZXIuIFNvIGl0IHdvdWxkIGJl
IGdyZWF0IHRvCj4gZ2V0IHRoaXMgaW50byBuZXh0IGVhcmx5IGFmdGVyIHRoZSBtZXJnZSB3aW5k
b3cgY2xvc2VzLgo+IAo+IEkgc2VuZCB0aGlzIG1haWwgdG8gYWxsIHBlb3BsZSB0aGF0IGdldF9t
YWludGFpbmVyLnBsIGVtaXRzIGZvciB0aGlzCj4gcGF0Y2guIEkgd29uZGVyIGhvdyBtYW55IHJl
Y2lwZW50cyB3aWxsIHJlZnVzZSB0aGlzIG1haWwgYmVjYXVzZSBvZiB0aGUKPiBsb25nIENjOiBs
aXN0IDotKQo+IAo+IEJlc3QgcmVnYXJkcwo+IFV3ZQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpncmV5YnVzLWRldiBtYWlsaW5nIGxpc3QKZ3JleWJ1cy1k
ZXZAbGlzdHMubGluYXJvLm9yZwpodHRwczovL2xpc3RzLmxpbmFyby5vcmcvbWFpbG1hbi9saXN0
aW5mby9ncmV5YnVzLWRldgo=
