Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 410BB3BF6A2
	for <lists+greybus-dev@lfdr.de>; Thu,  8 Jul 2021 09:57:45 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 379B26692E
	for <lists+greybus-dev@lfdr.de>; Thu,  8 Jul 2021 07:57:44 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id EC8F766931; Thu,  8 Jul 2021 07:56:51 +0000 (UTC)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 0F990669C6;
	Thu,  8 Jul 2021 07:56:48 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id BD75860C4C
 for <greybus-dev@lists.linaro.org>; Thu,  8 Jul 2021 05:40:03 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id B456C633A2; Thu,  8 Jul 2021 05:40:03 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 by lists.linaro.org (Postfix) with ESMTPS id 72EC460C4C
 for <greybus-dev@lists.linaro.org>; Thu,  8 Jul 2021 05:40:01 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1m1MkT-0006EF-FH; Thu, 08 Jul 2021 07:38:57 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1m1Mk9-00030G-2j; Thu, 08 Jul 2021 07:38:37 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1m1Mk8-0007Hx-U3; Thu, 08 Jul 2021 07:38:36 +0200
Date: Thu, 8 Jul 2021 07:38:13 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Sven Van Asbroeck <thesven73@gmail.com>
Message-ID: <20210708053813.pem2ufjuwkacptv3@pengutronix.de>
References: <20210706154803.1631813-1-u.kleine-koenig@pengutronix.de>
 <CAGngYiWm4u27o-yy5L5tokMB5G1RUR5uYmKf2oXah2P3J=hK2A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAGngYiWm4u27o-yy5L5tokMB5G1RUR5uYmKf2oXah2P3J=hK2A@mail.gmail.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: greybus-dev@lists.linaro.org
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Thu, 08 Jul 2021 07:55:56 +0000
Subject: Re: [greybus-dev] [PATCH v2 0/4] bus: Make remove callback return
 void
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
 Alison Schofield <alison.schofield@intel.com>,
 Jaroslav Kysela <perex@perex.cz>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 Paul Mackerras <paulus@samba.org>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Mike Christie <michael.christie@oracle.com>, Wei Liu <wei.liu@kernel.org>,
 Maxim Levitsky <maximlevitsky@gmail.com>, Samuel Holland <samuel@sholland.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Takashi Iwai <tiwai@suse.com>,
 linux-acpi@vger.kernel.org, Tom Rix <trix@redhat.com>,
 xen-devel@lists.xenproject.org, Tomas Winkler <tomas.winkler@intel.com>,
 Jason Wang <jasowang@redhat.com>, Ohad Ben-Cohen <ohad@wizery.com>,
 Alex Williamson <alex.williamson@redhat.com>, Alex Elder <elder@kernel.org>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Geoff Levand <geoff@infradead.org>, linux-usb@vger.kernel.org,
 linux-wireless@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-spi <linux-spi@vger.kernel.org>,
 Kai-Heng Feng <kai.heng.feng@canonical.com>,
 Sascha Hauer <kernel@pengutronix.de>, Jon Mason <jdmason@kudzu.us>,
 linux-ntb@googlegroups.com, linux-media <linux-media@vger.kernel.org>,
 David Woodhouse <dwmw@amazon.co.uk>,
 Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Manohar Vanga <manohar.vanga@gmail.com>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 virtualization@lists.linux-foundation.org,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 target-devel@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-i2c <linux-i2c@vger.kernel.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Stephen Hemminger <sthemmin@microsoft.com>, Jiri Slaby <jirislaby@kernel.org>,
 Helge Deller <deller@gmx.de>,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 industrypack-devel@lists.sourceforge.net, Wu Hao <hao.wu@intel.com>,
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>,
 William Breathitt Gray <vilhelm.gray@gmail.com>, greybus-dev@lists.linaro.org,
 Bjorn Helgaas <bhelgaas@google.com>, Mark Gross <mgross@linux.intel.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 Johannes Thumshirn <morbidrsa@gmail.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 Cornelia Huck <cohuck@redhat.com>, Wolfram Sang <wsa@kernel.org>,
 Joey Pabalan <jpabalanb@gmail.com>, Yehezkel Bernat <YehezkelShB@gmail.com>,
 Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>, Len Brown <lenb@kernel.org>,
 Bodo Stroesser <bostroesser@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Tyrel Datwyler <tyreld@linux.ibm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 linux-pci@vger.kernel.org, Julien Grall <jgrall@amazon.com>,
 SeongJae Park <sjpark@amazon.de>, linux-hyperv@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, Frank Li <lznuaa@gmail.com>,
 Ira Weiny <ira.weiny@intel.com>, Rob Herring <robh@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Dave Jiang <dave.jiang@intel.com>, linux-staging@lists.linux.dev,
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
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 Martyn Welch <martyn@welchs.me.uk>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-mmc@vger.kernel.org,
 linux-sunxi@lists.linux.dev, Stefan Richter <stefanr@s5r6.in-berlin.de>,
 Sudeep Holla <sudeep.holla@arm.com>, "David S. Miller" <davem@davemloft.net>,
 kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
 linux-remoteproc@vger.kernel.org, Maximilian Luz <luzmaximilian@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Kirti Wankhede <kwankhede@nvidia.com>,
 Andreas Noever <andreas.noever@gmail.com>, linux-i3c@lists.infradead.org,
 linux1394-devel@lists.sourceforge.net, Lee Jones <lee.jones@linaro.org>,
 Arnd Bergmann <arnd@arndb.de>, linux-scsi@vger.kernel.org,
 Vishal Verma <vishal.l.verma@intel.com>, Russell King <linux@armlinux.org.uk>,
 Thorsten Scherer <t.scherer@eckelmann.de>, Andy Gross <agross@kernel.org>,
 linux-serial@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 Michael Jamet <michael.jamet@intel.com>, Johan Hovold <johan@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>, Hannes Reinecke <hare@suse.de>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Johannes Berg <johannes@sipsolutions.net>, Juergen Gross <jgross@suse.com>,
 netdev <netdev@vger.kernel.org>, linux-mips@vger.kernel.org,
 Alexandre Bounine <alex.bou9@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 Mark Brown <broonie@kernel.org>, Marc Zyngier <maz@kernel.org>,
 dmaengine@vger.kernel.org, linux-fpga@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Content-Type: multipart/mixed; boundary="===============4150749186160629297=="
Errors-To: greybus-dev-bounces@lists.linaro.org
Sender: "greybus-dev" <greybus-dev-bounces@lists.linaro.org>
X-Virus-Scanned: ClamAV using ClamSMTP


--===============4150749186160629297==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bpxpm3lcta7ifhrg"
Content-Disposition: inline


--bpxpm3lcta7ifhrg
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 07, 2021 at 10:08:53PM -0400, Sven Van Asbroeck wrote:
> On Tue, Jul 6, 2021 at 11:50 AM Uwe Kleine-K=F6nig
> <u.kleine-koenig@pengutronix.de> wrote:
> >
> >  drivers/staging/fieldbus/anybuss/host.c   | 4 +---
>=20
> Awesome !
>=20
> Acked-by: Sven Van Asbroeck <TheSven73@gmail.com>

I note that as an Ack for patch 4 only, as the others don't touch this
file.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--bpxpm3lcta7ifhrg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmDmjzsACgkQwfwUeK3K
7Alp5wf+LJkpxzkaW2ldAtFhGuqT1XfOqbe9d5vNgqvqupJS1Q+aeie0kH0038ba
uN3KDJ2V2DAmMf6OIKUFucVxBpCC92myb63zIHRJs5kGzTu41BRp3yt/I650Xzdr
+MB/xdEr/XFy2f9gDr/QdCojwh44TXqKzZPG6a7r6uQu8/AAUOdVEcfK6o01hN8W
szxNTR1qtdQMHj9Ji8fo0wADdSPEez1kGe+HEOJVWBZnhdyCqS0jh774r7GsLjqY
l8S7HhKPoY6/CCbEHKfYA15GUvexTA14O2tn6vuQPtiTTdDoh/Nl0wj0z5/WbWjX
HF/tKnNb3l18s65PbEmxEKa2XonjFQ==
=+Y+1
-----END PGP SIGNATURE-----

--bpxpm3lcta7ifhrg--

--===============4150749186160629297==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
greybus-dev mailing list
greybus-dev@lists.linaro.org
https://lists.linaro.org/mailman/listinfo/greybus-dev

--===============4150749186160629297==--
