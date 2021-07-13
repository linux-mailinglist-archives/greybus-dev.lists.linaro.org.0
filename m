Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E9B03DE595
	for <lists+greybus-dev@lfdr.de>; Tue,  3 Aug 2021 06:40:01 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 6B0CA63509
	for <lists+greybus-dev@lfdr.de>; Tue,  3 Aug 2021 04:40:00 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 4E46960B43; Tue,  3 Aug 2021 04:39:35 +0000 (UTC)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 22C5666018;
	Tue,  3 Aug 2021 04:39:29 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id E2C6461307
 for <greybus-dev@lists.linaro.org>; Tue, 13 Jul 2021 19:36:03 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id DCAD6632DD; Tue, 13 Jul 2021 19:36:03 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 by lists.linaro.org (Postfix) with ESMTPS id A32E561307
 for <greybus-dev@lists.linaro.org>; Tue, 13 Jul 2021 19:36:01 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1m3OBr-0001GT-RJ; Tue, 13 Jul 2021 21:35:35 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1m3OBi-0006p7-4I; Tue, 13 Jul 2021 21:35:26 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1m3OBh-0002bU-W6; Tue, 13 Jul 2021 21:35:25 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Tue, 13 Jul 2021 21:35:17 +0200
Message-Id: <20210713193522.1770306-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: greybus-dev@lists.linaro.org
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Tue, 03 Aug 2021 04:39:24 +0000
Subject: [greybus-dev] [PATCH v4 0/5] bus: Make remove callback return void
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
Cc: nvdimm@lists.linux.dev, linux-sh@vger.kernel.org,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
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
 linux-acpi@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org,
 Tomas Winkler <tomas.winkler@intel.com>, Julien Grall <jgrall@amazon.com>,
 Ohad Ben-Cohen <ohad@wizery.com>, Yufen Yu <yuyufen@huawei.com>,
 Alex Williamson <alex.williamson@redhat.com>, Alex Elder <elder@kernel.org>,
 linux-parisc@vger.kernel.org, Finn Thain <fthain@linux-m68k.org>,
 Geoff Levand <geoff@infradead.org>, linux-fpga@vger.kernel.org,
 linux-usb@vger.kernel.org, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 Kai-Heng Feng <kai.heng.feng@canonical.com>, kernel@pengutronix.de,
 Jon Mason <jdmason@kudzu.us>, linux-ntb@googlegroups.com,
 Wu Hao <hao.wu@intel.com>, David Woodhouse <dwmw@amazon.co.uk>,
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
 Stephen Hemminger <sthemmin@microsoft.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Jiri Slaby <jirislaby@kernel.org>,
 Helge Deller <deller@gmx.de>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
 YueHaibing <yuehaibing@huawei.com>, industrypack-devel@lists.sourceforge.net,
 linux-mips@vger.kernel.org, Len Brown <lenb@kernel.org>,
 Eric Farman <farman@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>,
 William Breathitt Gray <vilhelm.gray@gmail.com>, greybus-dev@lists.linaro.org,
 linux-m68k@lists.linux-m68k.org, Florian Fainelli <f.fainelli@gmail.com>,
 Rikard Falkeborn <rikard.falkeborn@gmail.com>, Frank Li <lznuaa@gmail.com>,
 Mark Gross <mgross@linux.intel.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, Johannes Thumshirn <morbidrsa@gmail.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 Cornelia Huck <cohuck@redhat.com>, Peter Oberparleiter <oberpar@linux.ibm.com>,
 Wolfram Sang <wsa@kernel.org>, Joey Pabalan <jpabalanb@gmail.com>,
 Yehezkel Bernat <YehezkelShB@gmail.com>,
 =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
 Bodo Stroesser <bostroesser@gmail.com>,
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
 Sven Van Asbroeck <TheSven73@gmail.com>, Rich Felker <dalias@libc.org>,
 kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
 linux-remoteproc@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 sparclinux@vger.kernel.org, Kirti Wankhede <kwankhede@nvidia.com>,
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

SGVsbG8sCgp0aGlzIGlzIHY0IG9mIHRoZSBmaW5hbCBwYXRjaCBzZXQgZm9yIG15IGVmZm9ydCB0
byBtYWtlIHN0cnVjdApidXNfdHlwZTo6cmVtb3ZlIHJldHVybiB2b2lkLgoKVGhlIGZpcnN0IGZv
dXIgcGF0Y2hlcyBjb250YWluIGNsZWFudXBzIHRoYXQgbWFrZSBzb21lIG9mIHRoZXNlCmNhbGxi
YWNrcyAobW9yZSBvYnZpb3VzbHkpIGFsd2F5cyByZXR1cm4gMC4gVGhleSBhcmUgYWNrZWQgYnkg
dGhlCnJlc3BlY3RpdmUgbWFpbnRhaW5lcnMuIEJqb3JuIEhlbGdhYXMgZXhwbGljaXRseSBhc2tl
ZCB0byBpbmNsdWRlIHRoZQpwY2kgcGF0Y2ggKCMxKSBpbnRvIHRoaXMgc2VyaWVzLCBzbyBHcmVn
IHRha2luZyB0aGlzIGlzIGZpbmUuIEkgYXNzdW1lCnRoZSBzMzkwIHBlb3BsZSBhcmUgZmluZSB3
aXRoIEdyZWcgdGFraW5nIHBhdGNoZXMgIzIgdG8gIzQsIHRvbywgdGhleQpkaWRuJ3QgZXhwbGlj
aXRseSBzYWlkIHNvIHRob3VnaC4KClRoZSBsYXN0IHBhdGNoIGFjdHVhbGx5IGNoYW5nZXMgdGhl
IHByb3RvdHlwZSBhbmQgc28gdG91Y2hlcyBxdWl0ZSBzb21lCmRyaXZlcnMgYW5kIGhhcyB0aGUg
cG90ZW50aWFsIHRvIGNvbmZsaWN0IHdpdGggZnV0dXJlIGRldmVsb3BtZW50cywgc28gSQpjb25z
aWRlciBpdCBiZW5lZmljaWFsIHRvIHB1dCB0aGVzZSBwYXRjaGVzIGludG8gbmV4dCBzb29uLiBJ
IGV4cGVjdAp0aGF0IGl0IHdpbGwgYmUgR3JlZyB3aG8gdGFrZXMgdGhlIGNvbXBsZXRlIHNlcmll
cywgaGUgYWxyZWFkeSBjb25maXJtZWQKdmlhIGlyYyAoZm9yIHYyKSB0byBsb29rIGludG8gdGhp
cyBzZXJpZXMuCgpUaGUgb25seSBjaGFuZ2UgY29tcGFyZWQgdG8gdjMgaXMgaW4gdGhlIGZvdXJ0
aCBwYXRjaCB3aGVyZSBJIG1vZGlmaWVkIGEKZmV3IG1vcmUgZHJpdmVycyB0byBmaXggYnVpbGQg
ZmFpbHVyZXMuIFNvbWUgb2YgdGhlbSB3ZXJlIGZvdW5kIGJ5IGJ1aWxkCmJvdHMgKHRoYW5rcyEp
LCBzb21lIG9mIHRoZW0gSSBmb3VuZCBteXNlbGYgdXNpbmcgYSByZWd1bGFyIGV4cHJlc3Npb24K
c2VhcmNoLiBUaGUgbmV3bHkgbW9kaWZpZWQgZmlsZXMgYXJlOgoKIGFyY2gvc3BhcmMva2VybmVs
L3Zpby5jCiBkcml2ZXJzL251YnVzL2J1cy5jCiBkcml2ZXJzL3NoL3N1cGVyaHl3YXkvc3VwZXJo
eXdheS5jCiBkcml2ZXJzL3ZseW5xL3ZseW5xLmMKIGRyaXZlcnMvem9ycm8vem9ycm8tZHJpdmVy
LmMKIHNvdW5kL2FjOTcvYnVzLmMKCkJlc3QgcmVnYXJkcwpVd2UKClV3ZSBLbGVpbmUtS8O2bmln
ICg1KToKICBQQ0k6IGVuZHBvaW50OiBNYWtlIHN0cnVjdCBwY2lfZXBmX2RyaXZlcjo6cmVtb3Zl
IHJldHVybiB2b2lkCiAgczM5MC9jaW86IE1ha2Ugc3RydWN0IGNzc19kcml2ZXI6OnJlbW92ZSBy
ZXR1cm4gdm9pZAogIHMzOTAvY2N3Z3JvdXA6IERyb3AgaWYgd2l0aCBhbiBhbHdheXMgZmFsc2Ug
Y29uZGl0aW9uCiAgczM5MC9zY206IE1ha2Ugc3RydWN0IHNjbV9kcml2ZXI6OnJlbW92ZSByZXR1
cm4gdm9pZAogIGJ1czogTWFrZSByZW1vdmUgY2FsbGJhY2sgcmV0dXJuIHZvaWQKCiBhcmNoL2Fy
bS9jb21tb24vbG9jb21vLmMgICAgICAgICAgICAgICAgICB8IDMgKy0tCiBhcmNoL2FybS9jb21t
b24vc2ExMTExLmMgICAgICAgICAgICAgICAgICB8IDQgKy0tLQogYXJjaC9hcm0vbWFjaC1ycGMv
ZWNhcmQuYyAgICAgICAgICAgICAgICAgfCA0ICstLS0KIGFyY2gvbWlwcy9zZ2ktaXAyMi9pcDIy
LWdpby5jICAgICAgICAgICAgIHwgMyArLS0KIGFyY2gvcGFyaXNjL2tlcm5lbC9kcml2ZXJzLmMg
ICAgICAgICAgICAgIHwgNSArKy0tLQogYXJjaC9wb3dlcnBjL3BsYXRmb3Jtcy9wczMvc3lzdGVt
LWJ1cy5jICAgfCAzICstLQogYXJjaC9wb3dlcnBjL3BsYXRmb3Jtcy9wc2VyaWVzL2libWVidXMu
YyAgfCAzICstLQogYXJjaC9wb3dlcnBjL3BsYXRmb3Jtcy9wc2VyaWVzL3Zpby5jICAgICAgfCAz
ICstLQogYXJjaC9zMzkwL2luY2x1ZGUvYXNtL2VhZG0uaCAgICAgICAgICAgICAgfCAyICstCiBh
cmNoL3NwYXJjL2tlcm5lbC92aW8uYyAgICAgICAgICAgICAgICAgICB8IDQgKy0tLQogZHJpdmVy
cy9hY3BpL2J1cy5jICAgICAgICAgICAgICAgICAgICAgICAgfCAzICstLQogZHJpdmVycy9hbWJh
L2J1cy5jICAgICAgICAgICAgICAgICAgICAgICAgfCA0ICstLS0KIGRyaXZlcnMvYmFzZS9hdXhp
bGlhcnkuYyAgICAgICAgICAgICAgICAgIHwgNCArLS0tCiBkcml2ZXJzL2Jhc2UvaXNhLmMgICAg
ICAgICAgICAgICAgICAgICAgICB8IDQgKy0tLQogZHJpdmVycy9iYXNlL3BsYXRmb3JtLmMgICAg
ICAgICAgICAgICAgICAgfCA0ICstLS0KIGRyaXZlcnMvYmNtYS9tYWluLmMgICAgICAgICAgICAg
ICAgICAgICAgIHwgNiArKy0tLS0KIGRyaXZlcnMvYnVzL3N1bnhpLXJzYi5jICAgICAgICAgICAg
ICAgICAgIHwgNCArLS0tCiBkcml2ZXJzL2N4bC9jb3JlLmMgICAgICAgICAgICAgICAgICAgICAg
ICB8IDMgKy0tCiBkcml2ZXJzL2RheC9idXMuYyAgICAgICAgICAgICAgICAgICAgICAgICB8IDQg
Ky0tLQogZHJpdmVycy9kbWEvaWR4ZC9zeXNmcy5jICAgICAgICAgICAgICAgICAgfCA0ICstLS0K
IGRyaXZlcnMvZmlyZXdpcmUvY29yZS1kZXZpY2UuYyAgICAgICAgICAgIHwgNCArLS0tCiBkcml2
ZXJzL2Zpcm13YXJlL2FybV9zY21pL2J1cy5jICAgICAgICAgICB8IDQgKy0tLQogZHJpdmVycy9m
aXJtd2FyZS9nb29nbGUvY29yZWJvb3RfdGFibGUuYyAgfCA0ICstLS0KIGRyaXZlcnMvZnBnYS9k
ZmwuYyAgICAgICAgICAgICAgICAgICAgICAgIHwgNCArLS0tCiBkcml2ZXJzL2hpZC9oaWQtY29y
ZS5jICAgICAgICAgICAgICAgICAgICB8IDQgKy0tLQogZHJpdmVycy9oaWQvaW50ZWwtaXNoLWhp
ZC9pc2h0cC9idXMuYyAgICAgfCA0ICstLS0KIGRyaXZlcnMvaHYvdm1idXNfZHJ2LmMgICAgICAg
ICAgICAgICAgICAgIHwgNSArLS0tLQogZHJpdmVycy9od3RyYWNpbmcvaW50ZWxfdGgvY29yZS5j
ICAgICAgICAgfCA0ICstLS0KIGRyaXZlcnMvaTJjL2kyYy1jb3JlLWJhc2UuYyAgICAgICAgICAg
ICAgIHwgNSArLS0tLQogZHJpdmVycy9pM2MvbWFzdGVyLmMgICAgICAgICAgICAgICAgICAgICAg
fCA0ICstLS0KIGRyaXZlcnMvaW5wdXQvZ2FtZXBvcnQvZ2FtZXBvcnQuYyAgICAgICAgIHwgMyAr
LS0KIGRyaXZlcnMvaW5wdXQvc2VyaW8vc2VyaW8uYyAgICAgICAgICAgICAgIHwgMyArLS0KIGRy
aXZlcnMvaXBhY2svaXBhY2suYyAgICAgICAgICAgICAgICAgICAgIHwgNCArLS0tCiBkcml2ZXJz
L21hY2ludG9zaC9tYWNpb19hc2ljLmMgICAgICAgICAgICB8IDQgKy0tLQogZHJpdmVycy9tY2Iv
bWNiLWNvcmUuYyAgICAgICAgICAgICAgICAgICAgfCA0ICstLS0KIGRyaXZlcnMvbWVkaWEvcGNp
L2J0OHh4L2J0dHYtZ3Bpby5jICAgICAgIHwgMyArLS0KIGRyaXZlcnMvbWVtc3RpY2svY29yZS9t
ZW1zdGljay5jICAgICAgICAgIHwgMyArLS0KIGRyaXZlcnMvbWZkL21jcC1jb3JlLmMgICAgICAg
ICAgICAgICAgICAgIHwgMyArLS0KIGRyaXZlcnMvbWlzYy9tZWkvYnVzLmMgICAgICAgICAgICAg
ICAgICAgIHwgNCArLS0tCiBkcml2ZXJzL21pc2MvdGlmbV9jb3JlLmMgICAgICAgICAgICAgICAg
ICB8IDMgKy0tCiBkcml2ZXJzL21tYy9jb3JlL2J1cy5jICAgICAgICAgICAgICAgICAgICB8IDQg
Ky0tLQogZHJpdmVycy9tbWMvY29yZS9zZGlvX2J1cy5jICAgICAgICAgICAgICAgfCA0ICstLS0K
IGRyaXZlcnMvbmV0L25ldGRldnNpbS9idXMuYyAgICAgICAgICAgICAgIHwgMyArLS0KIGRyaXZl
cnMvbnRiL2NvcmUuYyAgICAgICAgICAgICAgICAgICAgICAgIHwgNCArLS0tCiBkcml2ZXJzL250
Yi9udGJfdHJhbnNwb3J0LmMgICAgICAgICAgICAgICB8IDQgKy0tLQogZHJpdmVycy9udWJ1cy9i
dXMuYyAgICAgICAgICAgICAgICAgICAgICAgfCA2ICsrLS0tLQogZHJpdmVycy9udmRpbW0vYnVz
LmMgICAgICAgICAgICAgICAgICAgICAgfCAzICstLQogZHJpdmVycy9wY2kvZW5kcG9pbnQvcGNp
LWVwZi1jb3JlLmMgICAgICAgfCA3ICsrLS0tLS0KIGRyaXZlcnMvcGNpL3BjaS1kcml2ZXIuYyAg
ICAgICAgICAgICAgICAgIHwgMyArLS0KIGRyaXZlcnMvcGNtY2lhL2RzLmMgICAgICAgICAgICAg
ICAgICAgICAgIHwgNCArLS0tCiBkcml2ZXJzL3BsYXRmb3JtL3N1cmZhY2UvYWdncmVnYXRvci9i
dXMuYyB8IDQgKy0tLQogZHJpdmVycy9wbGF0Zm9ybS94ODYvd21pLmMgICAgICAgICAgICAgICAg
fCA0ICstLS0KIGRyaXZlcnMvcG5wL2RyaXZlci5jICAgICAgICAgICAgICAgICAgICAgIHwgMyAr
LS0KIGRyaXZlcnMvcmFwaWRpby9yaW8tZHJpdmVyLmMgICAgICAgICAgICAgIHwgNCArLS0tCiBk
cml2ZXJzL3JwbXNnL3JwbXNnX2NvcmUuYyAgICAgICAgICAgICAgICB8IDcgKystLS0tLQogZHJp
dmVycy9zMzkwL2Jsb2NrL3NjbV9kcnYuYyAgICAgICAgICAgICAgfCA0ICstLS0KIGRyaXZlcnMv
czM5MC9jaW8vY2N3Z3JvdXAuYyAgICAgICAgICAgICAgIHwgNiArLS0tLS0KIGRyaXZlcnMvczM5
MC9jaW8vY2hzY19zY2guYyAgICAgICAgICAgICAgIHwgMyArLS0KIGRyaXZlcnMvczM5MC9jaW8v
Y3NzLmMgICAgICAgICAgICAgICAgICAgIHwgNyArKystLS0tCiBkcml2ZXJzL3MzOTAvY2lvL2Nz
cy5oICAgICAgICAgICAgICAgICAgICB8IDIgKy0KIGRyaXZlcnMvczM5MC9jaW8vZGV2aWNlLmMg
ICAgICAgICAgICAgICAgIHwgOSArKystLS0tLS0KIGRyaXZlcnMvczM5MC9jaW8vZWFkbV9zY2gu
YyAgICAgICAgICAgICAgIHwgNCArLS0tCiBkcml2ZXJzL3MzOTAvY2lvL3NjbS5jICAgICAgICAg
ICAgICAgICAgICB8IDUgKysrLS0KIGRyaXZlcnMvczM5MC9jaW8vdmZpb19jY3dfZHJ2LmMgICAg
ICAgICAgIHwgMyArLS0KIGRyaXZlcnMvczM5MC9jcnlwdG8vYXBfYnVzLmMgICAgICAgICAgICAg
IHwgNCArLS0tCiBkcml2ZXJzL3Njc2kvc2NzaV9kZWJ1Zy5jICAgICAgICAgICAgICAgICB8IDMg
Ky0tCiBkcml2ZXJzL3NoL3N1cGVyaHl3YXkvc3VwZXJoeXdheS5jICAgICAgICB8IDggKystLS0t
LS0KIGRyaXZlcnMvc2lveC9zaW94LWNvcmUuYyAgICAgICAgICAgICAgICAgIHwgNCArLS0tCiBk
cml2ZXJzL3NsaW1idXMvY29yZS5jICAgICAgICAgICAgICAgICAgICB8IDQgKy0tLQogZHJpdmVy
cy9zb2MvcWNvbS9hcHIuYyAgICAgICAgICAgICAgICAgICAgfCA0ICstLS0KIGRyaXZlcnMvc3Bp
L3NwaS5jICAgICAgICAgICAgICAgICAgICAgICAgIHwgNCArLS0tCiBkcml2ZXJzL3NwbWkvc3Bt
aS5jICAgICAgICAgICAgICAgICAgICAgICB8IDMgKy0tCiBkcml2ZXJzL3NzYi9tYWluLmMgICAg
ICAgICAgICAgICAgICAgICAgICB8IDQgKy0tLQogZHJpdmVycy9zdGFnaW5nL2ZpZWxkYnVzL2Fu
eWJ1c3MvaG9zdC5jICAgfCA0ICstLS0KIGRyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2dicGh5LmMg
ICAgICAgICAgIHwgNCArLS0tCiBkcml2ZXJzL3RhcmdldC9sb29wYmFjay90Y21fbG9vcC5jICAg
ICAgICB8IDUgKystLS0KIGRyaXZlcnMvdGh1bmRlcmJvbHQvZG9tYWluLmMgICAgICAgICAgICAg
IHwgNCArLS0tCiBkcml2ZXJzL3R0eS9zZXJkZXYvY29yZS5jICAgICAgICAgICAgICAgICB8IDQg
Ky0tLQogZHJpdmVycy91c2IvY29tbW9uL3VscGkuYyAgICAgICAgICAgICAgICAgfCA0ICstLS0K
IGRyaXZlcnMvdXNiL3NlcmlhbC9idXMuYyAgICAgICAgICAgICAgICAgIHwgNCArLS0tCiBkcml2
ZXJzL3VzYi90eXBlYy9idXMuYyAgICAgICAgICAgICAgICAgICB8IDQgKy0tLQogZHJpdmVycy92
ZHBhL3ZkcGEuYyAgICAgICAgICAgICAgICAgICAgICAgfCA0ICstLS0KIGRyaXZlcnMvdmZpby9t
ZGV2L21kZXZfZHJpdmVyLmMgICAgICAgICAgIHwgNCArLS0tCiBkcml2ZXJzL3ZpcnRpby92aXJ0
aW8uYyAgICAgICAgICAgICAgICAgICB8IDMgKy0tCiBkcml2ZXJzL3ZseW5xL3ZseW5xLmMgICAg
ICAgICAgICAgICAgICAgICB8IDQgKy0tLQogZHJpdmVycy92bWUvdm1lLmMgICAgICAgICAgICAg
ICAgICAgICAgICAgfCA0ICstLS0KIGRyaXZlcnMveGVuL3hlbmJ1cy94ZW5idXMuaCAgICAgICAg
ICAgICAgIHwgMiArLQogZHJpdmVycy94ZW4veGVuYnVzL3hlbmJ1c19wcm9iZS5jICAgICAgICAg
fCA0ICstLS0KIGRyaXZlcnMvem9ycm8vem9ycm8tZHJpdmVyLmMgICAgICAgICAgICAgIHwgMyAr
LS0KIGluY2x1ZGUvbGludXgvZGV2aWNlL2J1cy5oICAgICAgICAgICAgICAgIHwgMiArLQogaW5j
bHVkZS9saW51eC9wY2ktZXBmLmggICAgICAgICAgICAgICAgICAgfCAyICstCiBzb3VuZC9hYzk3
L2J1cy5jICAgICAgICAgICAgICAgICAgICAgICAgICB8IDYgKystLS0tCiBzb3VuZC9hb2Evc291
bmRidXMvY29yZS5jICAgICAgICAgICAgICAgICB8IDQgKy0tLQogOTMgZmlsZXMgY2hhbmdlZCwg
MTA3IGluc2VydGlvbnMoKyksIDI2MyBkZWxldGlvbnMoLSkKCgpiYXNlLWNvbW1pdDogZTczZjBm
MGVlNzU0MTE3MWQ4OWYyZTI0OTExMzBjNzc3MWJhNThkMwotLSAKMi4zMC4yCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpncmV5YnVzLWRldiBtYWlsaW5n
IGxpc3QKZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpodHRwczovL2xpc3RzLmxpbmFyby5v
cmcvbWFpbG1hbi9saXN0aW5mby9ncmV5YnVzLWRldgo=
