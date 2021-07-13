Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 37AF23DE58D
	for <lists+greybus-dev@lfdr.de>; Tue,  3 Aug 2021 06:39:40 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 64E1E65FE3
	for <lists+greybus-dev@lfdr.de>; Tue,  3 Aug 2021 04:39:38 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 061F466518; Tue,  3 Aug 2021 04:39:31 +0000 (UTC)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id B572B63504;
	Tue,  3 Aug 2021 04:39:26 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 70D1261174
 for <greybus-dev@lists.linaro.org>; Tue, 13 Jul 2021 07:40:49 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 58F086179C; Tue, 13 Jul 2021 07:40:49 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 by lists.linaro.org (Postfix) with ESMTPS id 19C5E61174
 for <greybus-dev@lists.linaro.org>; Tue, 13 Jul 2021 07:40:47 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1m3D1n-0003wU-UB; Tue, 13 Jul 2021 09:40:28 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1m3D1h-0006Pq-8S; Tue, 13 Jul 2021 09:40:21 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1m3D1h-0000sY-4N; Tue, 13 Jul 2021 09:40:21 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Tue, 13 Jul 2021 09:40:09 +0200
Message-Id: <20210713074014.684791-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: greybus-dev@lists.linaro.org
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Tue, 03 Aug 2021 04:39:24 +0000
Subject: [greybus-dev] [PATCH v3 0/5] bus: Make remove callback return void
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
Cc: nvdimm@lists.linux.dev, Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Samuel Iglesias Gonsalvez <siglesias@igalia.com>,
 Jens Taprogge <jens.taprogge@taprogge.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, Jaroslav Kysela <perex@perex.cz>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 Paul Mackerras <paulus@samba.org>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Mike Christie <michael.christie@oracle.com>, Wei Liu <wei.liu@kernel.org>,
 Maxim Levitsky <maximlevitsky@gmail.com>, Samuel Holland <samuel@sholland.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Halil Pasic <pasic@linux.ibm.com>,
 linux-acpi@vger.kernel.org, linux-pci@vger.kernel.org,
 xen-devel@lists.xenproject.org, Tomas Winkler <tomas.winkler@intel.com>,
 Julien Grall <jgrall@amazon.com>, Ohad Ben-Cohen <ohad@wizery.com>,
 Alex Williamson <alex.williamson@redhat.com>, Alex Elder <elder@kernel.org>,
 linux-parisc@vger.kernel.org, Geoff Levand <geoff@infradead.org>,
 linux-fpga@vger.kernel.org, linux-usb@vger.kernel.org,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, Kai-Heng Feng <kai.heng.feng@canonical.com>,
 kernel@pengutronix.de, Jon Mason <jdmason@kudzu.us>,
 linux-ntb@googlegroups.com, Wu Hao <hao.wu@intel.com>,
 David Woodhouse <dwmw@amazon.co.uk>,
 =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Manohar Vanga <manohar.vanga@gmail.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>, linux-wireless@vger.kernel.org,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 virtualization@lists.linux-foundation.org,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 target-devel@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-i2c@vger.kernel.org, linux-s390@vger.kernel.org,
 Stefano Stabellini <sstabellini@kernel.org>,
 Stephen Hemminger <sthemmin@microsoft.com>, Jiri Slaby <jirislaby@kernel.org>,
 Helge Deller <deller@gmx.de>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
 YueHaibing <yuehaibing@huawei.com>, industrypack-devel@lists.sourceforge.net,
 linux-mips@vger.kernel.org, Len Brown <lenb@kernel.org>,
 Eric Farman <farman@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>,
 William Breathitt Gray <vilhelm.gray@gmail.com>, greybus-dev@lists.linaro.org,
 Frank Li <lznuaa@gmail.com>, Mark Gross <mgross@linux.intel.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, Johannes Thumshirn <morbidrsa@gmail.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 Cornelia Huck <cohuck@redhat.com>, Peter Oberparleiter <oberpar@linux.ibm.com>,
 Wolfram Sang <wsa@kernel.org>, Joey Pabalan <jpabalanb@gmail.com>,
 Yehezkel Bernat <YehezkelShB@gmail.com>,
 =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
 Alison Schofield <alison.schofield@intel.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Tyrel Datwyler <tyreld@linux.ibm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Tom Rix <trix@redhat.com>, Jason Wang <jasowang@redhat.com>,
 SeongJae Park <sjpark@amazon.de>, alsa-devel@alsa-project.org,
 platform-driver-x86@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
 netdev@vger.kernel.org, Vineeth Vijayan <vneethv@linux.ibm.com>,
 Ira Weiny <ira.weiny@intel.com>, Rob Herring <robh@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Dave Jiang <dave.jiang@intel.com>, linux-staging@lists.linux.dev,
 Dexuan Cui <decui@microsoft.com>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Chen-Yu Tsai <wens@csie.org>,
 linux-input@vger.kernel.org, Matt Porter <mporter@kernel.crashing.org>,
 Allen Hubbe <allenbh@gmail.com>, Alex Dubov <oakad@yahoo.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, Jiri Kosina <jikos@kernel.org>,
 "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>,
 Ben Widawsky <ben.widawsky@intel.com>,
 Harald Freudenberger <freude@linux.ibm.com>, linux-cxl@vger.kernel.org,
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
 Marc Zyngier <maz@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Thorsten Scherer <t.scherer@eckelmann.de>, Andy Gross <agross@kernel.org>,
 linux-serial@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 linux-hyperv@vger.kernel.org, Michael Jamet <michael.jamet@intel.com>,
 Heiko Carstens <hca@linux.ibm.com>, Johan Hovold <johan@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>, Hannes Reinecke <hare@suse.de>,
 Juergen Gross <jgross@suse.com>, linuxppc-dev@lists.ozlabs.org,
 Takashi Iwai <tiwai@suse.com>, Alexandre Bounine <alex.bou9@gmail.com>,
 Vinod Koul <vkoul@kernel.org>, Mark Brown <broonie@kernel.org>,
 Vishal Verma <vishal.l.verma@intel.com>, dmaengine@vger.kernel.org,
 Moritz Fischer <mdf@kernel.org>, Johannes Berg <johannes@sipsolutions.net>,
 Maximilian Luz <luzmaximilian@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: greybus-dev-bounces@lists.linaro.org
Sender: "greybus-dev" <greybus-dev-bounces@lists.linaro.org>
X-Virus-Scanned: ClamAV using ClamSMTP

SGVsbG8sCgp0aGlzIGlzIHRoZSBmaW5hbCBwYXRjaCBzZXQgZm9yIG15IGVmZm9ydCB0byBtYWtl
IHN0cnVjdApidXNfdHlwZTo6cmVtb3ZlIHJldHVybiB2b2lkLgoKVGhlIGZpcnN0IGZvdXIgcGF0
Y2hlcyBjb250YWluIGNsZWFudXBzIHRoYXQgbWFrZSBzb21lIG9mIHRoZXNlCmNhbGxiYWNrcyAo
bW9yZSBvYnZpb3VzbHkpIGFsd2F5cyByZXR1cm4gMC4gVGhleSBhcmUgYWNrZWQgYnkgdGhlCnJl
c3BlY3RpdmUgbWFpbnRhaW5lcnMuIEJqb3JuIEhlbGdhYXMgZXhwbGljaXRseSBhc2tlZCB0byBp
bmNsdWRlIHRoZQpwY2kgcGF0Y2ggKCMxKSBpbnRvIHRoaXMgc2VyaWVzLCBzbyBHcmVnIHRha2lu
ZyB0aGlzIGlzIGZpbmUuIEkgYXNzdW1lCnRoZSBzMzkwIHBlb3BsZSBhcmUgZmluZSB3aXRoIEdy
ZWcgdGFraW5nIHBhdGNoZXMgIzIgdG8gIzQsIHRvbywgdGhleQpkaWRuJ3QgZXhwbGljaXRseSBz
YWlkIHNvIHRob3VnaC4KClRoZSBsYXN0IHBhdGNoIGFjdHVhbGx5IGNoYW5nZXMgdGhlIHByb3Rv
dHlwZSBhbmQgc28gdG91Y2hlcyBxdWl0ZSBzb21lCmRyaXZlcnMgYW5kIGhhcyB0aGUgcG90ZW50
aWFsIHRvIGNvbmZsaWN0IHdpdGggZnV0dXJlIGRldmVsb3BtZW50cywgc28gSQpjb25zaWRlciBp
dCBiZW5lZmljaWFsIHRvIHB1dCB0aGVzZSBwYXRjaGVzIGludG8gbmV4dCBzb29uLiBJIGV4cGVj
dAp0aGF0IGl0IHdpbGwgYmUgR3JlZyB3aG8gdGFrZXMgdGhlIGNvbXBsZXRlIHNlcmllcywgaGUg
YWxyZWFkeSBjb25maXJtZWQKdmlhIGlyYyAoZm9yIHYyKSB0byBsb29rIGludG8gdGhpcyBzZXJp
ZXMuCgpJbiB0aGUgbGFzdCByb3VuZCBJIGZhaWxlZCB0byBzZW5kIHRoZSBjb3ZlciBsZXR0ZXIg
dG8gYWxsIGFmZmVjdGVkCnBlb3BsZSwgc29ycnkgZm9yIHRoYXQsIHRoaXMgc2hvdWxkIGJlIGZp
eGVkIG5vdy4KCkJlc3QgcmVnYXJkcwpVd2UKCkNoYW5nZXMgc2luY2UgdjI6CiAtIEFkZCBzZXZl
cmFsIGFja3MvcmV2aWV3IHRhZ3MKIC0gSW5jbHVkZSBwYXRjaCAjMSBleHBsaWNpdGx5CiAtIHJl
YmFzZSB0byB2NS4xNC1yYzEsIGJ1aWxkIHRlc3Qgb24gYW1kNjQsIGFybTY0IGFuZCBzMzkwIHVz
aW5nCiAgIGFsbG1vZGNvbmZpZwoKVXdlIEtsZWluZS1Lw7ZuaWcgKDUpOgogIFBDSTogZW5kcG9p
bnQ6IE1ha2Ugc3RydWN0IHBjaV9lcGZfZHJpdmVyOjpyZW1vdmUgcmV0dXJuIHZvaWQKICBzMzkw
L2NpbzogTWFrZSBzdHJ1Y3QgY3NzX2RyaXZlcjo6cmVtb3ZlIHJldHVybiB2b2lkCiAgczM5MC9j
Y3dncm91cDogRHJvcCBpZiB3aXRoIGFuIGFsd2F5cyBmYWxzZSBjb25kaXRpb24KICBzMzkwL3Nj
bTogTWFrZSBzdHJ1Y3Qgc2NtX2RyaXZlcjo6cmVtb3ZlIHJldHVybiB2b2lkCiAgYnVzOiBNYWtl
IHJlbW92ZSBjYWxsYmFjayByZXR1cm4gdm9pZAoKIGFyY2gvYXJtL2NvbW1vbi9sb2NvbW8uYyAg
ICAgICAgICAgICAgICAgIHwgMyArLS0KIGFyY2gvYXJtL2NvbW1vbi9zYTExMTEuYyAgICAgICAg
ICAgICAgICAgIHwgNCArLS0tCiBhcmNoL2FybS9tYWNoLXJwYy9lY2FyZC5jICAgICAgICAgICAg
ICAgICB8IDQgKy0tLQogYXJjaC9taXBzL3NnaS1pcDIyL2lwMjItZ2lvLmMgICAgICAgICAgICAg
fCAzICstLQogYXJjaC9wYXJpc2Mva2VybmVsL2RyaXZlcnMuYyAgICAgICAgICAgICAgfCA1ICsr
LS0tCiBhcmNoL3Bvd2VycGMvcGxhdGZvcm1zL3BzMy9zeXN0ZW0tYnVzLmMgICB8IDMgKy0tCiBh
cmNoL3Bvd2VycGMvcGxhdGZvcm1zL3BzZXJpZXMvaWJtZWJ1cy5jICB8IDMgKy0tCiBhcmNoL3Bv
d2VycGMvcGxhdGZvcm1zL3BzZXJpZXMvdmlvLmMgICAgICB8IDMgKy0tCiBhcmNoL3MzOTAvaW5j
bHVkZS9hc20vZWFkbS5oICAgICAgICAgICAgICB8IDIgKy0KIGRyaXZlcnMvYWNwaS9idXMuYyAg
ICAgICAgICAgICAgICAgICAgICAgIHwgMyArLS0KIGRyaXZlcnMvYW1iYS9idXMuYyAgICAgICAg
ICAgICAgICAgICAgICAgIHwgNCArLS0tCiBkcml2ZXJzL2Jhc2UvYXV4aWxpYXJ5LmMgICAgICAg
ICAgICAgICAgICB8IDQgKy0tLQogZHJpdmVycy9iYXNlL2lzYS5jICAgICAgICAgICAgICAgICAg
ICAgICAgfCA0ICstLS0KIGRyaXZlcnMvYmFzZS9wbGF0Zm9ybS5jICAgICAgICAgICAgICAgICAg
IHwgNCArLS0tCiBkcml2ZXJzL2JjbWEvbWFpbi5jICAgICAgICAgICAgICAgICAgICAgICB8IDYg
KystLS0tCiBkcml2ZXJzL2J1cy9zdW54aS1yc2IuYyAgICAgICAgICAgICAgICAgICB8IDQgKy0t
LQogZHJpdmVycy9jeGwvY29yZS5jICAgICAgICAgICAgICAgICAgICAgICAgfCAzICstLQogZHJp
dmVycy9kYXgvYnVzLmMgICAgICAgICAgICAgICAgICAgICAgICAgfCA0ICstLS0KIGRyaXZlcnMv
ZG1hL2lkeGQvc3lzZnMuYyAgICAgICAgICAgICAgICAgIHwgNCArLS0tCiBkcml2ZXJzL2ZpcmV3
aXJlL2NvcmUtZGV2aWNlLmMgICAgICAgICAgICB8IDQgKy0tLQogZHJpdmVycy9maXJtd2FyZS9h
cm1fc2NtaS9idXMuYyAgICAgICAgICAgfCA0ICstLS0KIGRyaXZlcnMvZmlybXdhcmUvZ29vZ2xl
L2NvcmVib290X3RhYmxlLmMgIHwgNCArLS0tCiBkcml2ZXJzL2ZwZ2EvZGZsLmMgICAgICAgICAg
ICAgICAgICAgICAgICB8IDQgKy0tLQogZHJpdmVycy9oaWQvaGlkLWNvcmUuYyAgICAgICAgICAg
ICAgICAgICAgfCA0ICstLS0KIGRyaXZlcnMvaGlkL2ludGVsLWlzaC1oaWQvaXNodHAvYnVzLmMg
ICAgIHwgNCArLS0tCiBkcml2ZXJzL2h2L3ZtYnVzX2Rydi5jICAgICAgICAgICAgICAgICAgICB8
IDUgKy0tLS0KIGRyaXZlcnMvaHd0cmFjaW5nL2ludGVsX3RoL2NvcmUuYyAgICAgICAgIHwgNCAr
LS0tCiBkcml2ZXJzL2kyYy9pMmMtY29yZS1iYXNlLmMgICAgICAgICAgICAgICB8IDUgKy0tLS0K
IGRyaXZlcnMvaTNjL21hc3Rlci5jICAgICAgICAgICAgICAgICAgICAgIHwgNCArLS0tCiBkcml2
ZXJzL2lucHV0L2dhbWVwb3J0L2dhbWVwb3J0LmMgICAgICAgICB8IDMgKy0tCiBkcml2ZXJzL2lu
cHV0L3NlcmlvL3NlcmlvLmMgICAgICAgICAgICAgICB8IDMgKy0tCiBkcml2ZXJzL2lwYWNrL2lw
YWNrLmMgICAgICAgICAgICAgICAgICAgICB8IDQgKy0tLQogZHJpdmVycy9tYWNpbnRvc2gvbWFj
aW9fYXNpYy5jICAgICAgICAgICAgfCA0ICstLS0KIGRyaXZlcnMvbWNiL21jYi1jb3JlLmMgICAg
ICAgICAgICAgICAgICAgIHwgNCArLS0tCiBkcml2ZXJzL21lZGlhL3BjaS9idDh4eC9idHR2LWdw
aW8uYyAgICAgICB8IDMgKy0tCiBkcml2ZXJzL21lbXN0aWNrL2NvcmUvbWVtc3RpY2suYyAgICAg
ICAgICB8IDMgKy0tCiBkcml2ZXJzL21mZC9tY3AtY29yZS5jICAgICAgICAgICAgICAgICAgICB8
IDMgKy0tCiBkcml2ZXJzL21pc2MvbWVpL2J1cy5jICAgICAgICAgICAgICAgICAgICB8IDQgKy0t
LQogZHJpdmVycy9taXNjL3RpZm1fY29yZS5jICAgICAgICAgICAgICAgICAgfCAzICstLQogZHJp
dmVycy9tbWMvY29yZS9idXMuYyAgICAgICAgICAgICAgICAgICAgfCA0ICstLS0KIGRyaXZlcnMv
bW1jL2NvcmUvc2Rpb19idXMuYyAgICAgICAgICAgICAgIHwgNCArLS0tCiBkcml2ZXJzL25ldC9u
ZXRkZXZzaW0vYnVzLmMgICAgICAgICAgICAgICB8IDMgKy0tCiBkcml2ZXJzL250Yi9jb3JlLmMg
ICAgICAgICAgICAgICAgICAgICAgICB8IDQgKy0tLQogZHJpdmVycy9udGIvbnRiX3RyYW5zcG9y
dC5jICAgICAgICAgICAgICAgfCA0ICstLS0KIGRyaXZlcnMvbnZkaW1tL2J1cy5jICAgICAgICAg
ICAgICAgICAgICAgIHwgMyArLS0KIGRyaXZlcnMvcGNpL2VuZHBvaW50L3BjaS1lcGYtY29yZS5j
ICAgICAgIHwgNyArKy0tLS0tCiBkcml2ZXJzL3BjaS9wY2ktZHJpdmVyLmMgICAgICAgICAgICAg
ICAgICB8IDMgKy0tCiBkcml2ZXJzL3BjbWNpYS9kcy5jICAgICAgICAgICAgICAgICAgICAgICB8
IDQgKy0tLQogZHJpdmVycy9wbGF0Zm9ybS9zdXJmYWNlL2FnZ3JlZ2F0b3IvYnVzLmMgfCA0ICst
LS0KIGRyaXZlcnMvcGxhdGZvcm0veDg2L3dtaS5jICAgICAgICAgICAgICAgIHwgNCArLS0tCiBk
cml2ZXJzL3BucC9kcml2ZXIuYyAgICAgICAgICAgICAgICAgICAgICB8IDMgKy0tCiBkcml2ZXJz
L3JhcGlkaW8vcmlvLWRyaXZlci5jICAgICAgICAgICAgICB8IDQgKy0tLQogZHJpdmVycy9ycG1z
Zy9ycG1zZ19jb3JlLmMgICAgICAgICAgICAgICAgfCA3ICsrLS0tLS0KIGRyaXZlcnMvczM5MC9i
bG9jay9zY21fZHJ2LmMgICAgICAgICAgICAgIHwgNCArLS0tCiBkcml2ZXJzL3MzOTAvY2lvL2Nj
d2dyb3VwLmMgICAgICAgICAgICAgICB8IDYgKy0tLS0tCiBkcml2ZXJzL3MzOTAvY2lvL2Noc2Nf
c2NoLmMgICAgICAgICAgICAgICB8IDMgKy0tCiBkcml2ZXJzL3MzOTAvY2lvL2Nzcy5jICAgICAg
ICAgICAgICAgICAgICB8IDcgKysrLS0tLQogZHJpdmVycy9zMzkwL2Npby9jc3MuaCAgICAgICAg
ICAgICAgICAgICAgfCAyICstCiBkcml2ZXJzL3MzOTAvY2lvL2RldmljZS5jICAgICAgICAgICAg
ICAgICB8IDkgKysrLS0tLS0tCiBkcml2ZXJzL3MzOTAvY2lvL2VhZG1fc2NoLmMgICAgICAgICAg
ICAgICB8IDQgKy0tLQogZHJpdmVycy9zMzkwL2Npby9zY20uYyAgICAgICAgICAgICAgICAgICAg
fCA1ICsrKy0tCiBkcml2ZXJzL3MzOTAvY2lvL3ZmaW9fY2N3X2Rydi5jICAgICAgICAgICB8IDMg
Ky0tCiBkcml2ZXJzL3MzOTAvY3J5cHRvL2FwX2J1cy5jICAgICAgICAgICAgICB8IDQgKy0tLQog
ZHJpdmVycy9zY3NpL3Njc2lfZGVidWcuYyAgICAgICAgICAgICAgICAgfCAzICstLQogZHJpdmVy
cy9zaW94L3Npb3gtY29yZS5jICAgICAgICAgICAgICAgICAgfCA0ICstLS0KIGRyaXZlcnMvc2xp
bWJ1cy9jb3JlLmMgICAgICAgICAgICAgICAgICAgIHwgNCArLS0tCiBkcml2ZXJzL3NvYy9xY29t
L2Fwci5jICAgICAgICAgICAgICAgICAgICB8IDQgKy0tLQogZHJpdmVycy9zcGkvc3BpLmMgICAg
ICAgICAgICAgICAgICAgICAgICAgfCA0ICstLS0KIGRyaXZlcnMvc3BtaS9zcG1pLmMgICAgICAg
ICAgICAgICAgICAgICAgIHwgMyArLS0KIGRyaXZlcnMvc3NiL21haW4uYyAgICAgICAgICAgICAg
ICAgICAgICAgIHwgNCArLS0tCiBkcml2ZXJzL3N0YWdpbmcvZmllbGRidXMvYW55YnVzcy9ob3N0
LmMgICB8IDQgKy0tLQogZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvZ2JwaHkuYyAgICAgICAgICAg
fCA0ICstLS0KIGRyaXZlcnMvdGFyZ2V0L2xvb3BiYWNrL3RjbV9sb29wLmMgICAgICAgIHwgNSAr
Ky0tLQogZHJpdmVycy90aHVuZGVyYm9sdC9kb21haW4uYyAgICAgICAgICAgICAgfCA0ICstLS0K
IGRyaXZlcnMvdHR5L3NlcmRldi9jb3JlLmMgICAgICAgICAgICAgICAgIHwgNCArLS0tCiBkcml2
ZXJzL3VzYi9jb21tb24vdWxwaS5jICAgICAgICAgICAgICAgICB8IDQgKy0tLQogZHJpdmVycy91
c2Ivc2VyaWFsL2J1cy5jICAgICAgICAgICAgICAgICAgfCA0ICstLS0KIGRyaXZlcnMvdXNiL3R5
cGVjL2J1cy5jICAgICAgICAgICAgICAgICAgIHwgNCArLS0tCiBkcml2ZXJzL3ZkcGEvdmRwYS5j
ICAgICAgICAgICAgICAgICAgICAgICB8IDQgKy0tLQogZHJpdmVycy92ZmlvL21kZXYvbWRldl9k
cml2ZXIuYyAgICAgICAgICAgfCA0ICstLS0KIGRyaXZlcnMvdmlydGlvL3ZpcnRpby5jICAgICAg
ICAgICAgICAgICAgIHwgMyArLS0KIGRyaXZlcnMvdm1lL3ZtZS5jICAgICAgICAgICAgICAgICAg
ICAgICAgIHwgNCArLS0tCiBkcml2ZXJzL3hlbi94ZW5idXMveGVuYnVzLmggICAgICAgICAgICAg
ICB8IDIgKy0KIGRyaXZlcnMveGVuL3hlbmJ1cy94ZW5idXNfcHJvYmUuYyAgICAgICAgIHwgNCAr
LS0tCiBpbmNsdWRlL2xpbnV4L2RldmljZS9idXMuaCAgICAgICAgICAgICAgICB8IDIgKy0KIGlu
Y2x1ZGUvbGludXgvcGNpLWVwZi5oICAgICAgICAgICAgICAgICAgIHwgMiArLQogc291bmQvYW9h
L3NvdW5kYnVzL2NvcmUuYyAgICAgICAgICAgICAgICAgfCA0ICstLS0KIDg3IGZpbGVzIGNoYW5n
ZWQsIDk4IGluc2VydGlvbnMoKyksIDI0MSBkZWxldGlvbnMoLSkKCmJhc2UtY29tbWl0OiBlNzNm
MGYwZWU3NTQxMTcxZDg5ZjJlMjQ5MTEzMGM3NzcxYmE1OGQzCi0tIAoyLjMwLjIKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmdyZXlidXMtZGV2IG1haWxp
bmcgbGlzdApncmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3JnCmh0dHBzOi8vbGlzdHMubGluYXJv
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2dyZXlidXMtZGV2Cg==
