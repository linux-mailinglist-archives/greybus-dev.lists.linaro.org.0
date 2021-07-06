Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id BF1BC3BF68F
	for <lists+greybus-dev@lfdr.de>; Thu,  8 Jul 2021 09:56:59 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 7DFD56697A
	for <lists+greybus-dev@lfdr.de>; Thu,  8 Jul 2021 07:56:58 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 437CA66765; Thu,  8 Jul 2021 07:56:18 +0000 (UTC)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id E85A366967;
	Thu,  8 Jul 2021 07:56:15 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id E34DB60BC6
 for <greybus-dev@lists.linaro.org>; Tue,  6 Jul 2021 10:57:45 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id DB9C86328E; Tue,  6 Jul 2021 10:57:45 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by lists.linaro.org (Postfix) with ESMTPS id CD3F660BC6
 for <greybus-dev@lists.linaro.org>; Tue,  6 Jul 2021 10:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625569063;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QUyu+xoe1E6BsQbSDzUeyLIXRBJKwC/I/FCZr8qcsPA=;
 b=Tpitbp8kRSV2Hc2y6VIhqDekGY7ZfeSw1kRC+BpUzdAdWDjVolk9floMPAIccWCKebta0U
 41FDt47yB0fzRf/2Kg6HJo1mf3TAQLqXEk9QilWjSmo7/7k26EWUm7t8rCvaA0yK9jrXp0
 lpxxx/yL6IbqFrmFw/bhdsMwYLpf2fo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-263-5mCOs4Y3P-6VHTb8_rh9-g-1; Tue, 06 Jul 2021 06:57:41 -0400
X-MC-Unique: 5mCOs4Y3P-6VHTb8_rh9-g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 481AE100B3AC;
 Tue,  6 Jul 2021 10:57:36 +0000 (UTC)
Received: from localhost (ovpn-113-13.ams2.redhat.com [10.36.113.13])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 95A0A60CC6;
 Tue,  6 Jul 2021 10:57:19 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>
In-Reply-To: <20210706095037.1425211-1-u.kleine-koenig@pengutronix.de>
Organization: Red Hat GmbH
References: <20210706095037.1425211-1-u.kleine-koenig@pengutronix.de>
User-Agent: Notmuch/0.32.1 (https://notmuchmail.org)
Date: Tue, 06 Jul 2021 12:57:17 +0200
Message-ID: <87pmvvhfqq.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Thu, 08 Jul 2021 07:55:56 +0000
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
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 Paul Mackerras <paulus@samba.org>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, "K. Y.
 Srinivasan" <kys@microsoft.com>, Mike Christie <michael.christie@oracle.com>,
 Wei Liu <wei.liu@kernel.org>, Maxim Levitsky <maximlevitsky@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Michael Ellerman <mpe@ellerman.id.au>,
 linux-acpi@vger.kernel.org, linux-pci@vger.kernel.org,
 xen-devel@lists.xenproject.org, Tomas Winkler <tomas.winkler@intel.com>,
 Julien Grall <jgrall@amazon.com>, Ohad Ben-Cohen <ohad@wizery.com>,
 Alex Williamson <alex.williamson@redhat.com>, Alex Elder <elder@kernel.org>,
 linux-parisc@vger.kernel.org, Geoff Levand <geoff@infradead.org>,
 linux-fpga@vger.kernel.org, linux-usb@vger.kernel.org, "Rafael J.
 Wysocki" <rjw@rjwysocki.net>, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, Thorsten Scherer <t.scherer@eckelmann.de>,
 kernel@pengutronix.de, Jon Mason <jdmason@kudzu.us>,
 linux-ntb@googlegroups.com, Wu Hao <hao.wu@intel.com>,
 David Woodhouse <dwmw@amazon.co.uk>,
 Krzysztof =?utf-8?Q?Wilczy=C5=84sk?= =?utf-8?Q?i?= <kw@linux.com>,
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
 =?utf-8?Q?Rafa=C5=82_Mi=C5=82eck?= =?utf-8?Q?i?= <zajec5@gmail.com>,
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
 Wolfram Sang <wsa@kernel.org>, Joey Pabalan <jpabalanb@gmail.com>,
 Yehezkel Bernat <YehezkelShB@gmail.com>,
 Pali =?utf-8?Q?Roh=C3=A1r?= <pali@kernel.org>,
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
 Sudeep Holla <sudeep.holla@arm.com>, "David S.
 Miller" <davem@davemloft.net>, Sven Van Asbroeck <TheSven73@gmail.com>,
 kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
 linux-remoteproc@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
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

T24gVHVlLCBKdWwgMDYgMjAyMSwgVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0Bw
ZW5ndXRyb25peC5kZT4gd3JvdGU6Cgo+IFRoZSBkcml2ZXIgY29yZSBpZ25vcmVzIHRoZSByZXR1
cm4gdmFsdWUgb2YgdGhpcyBjYWxsYmFjayBiZWNhdXNlIHRoZXJlCj4gaXMgb25seSBsaXR0bGUg
aXQgY2FuIGRvIHdoZW4gYSBkZXZpY2UgZGlzYXBwZWFycy4KPgo+IFRoaXMgaXMgdGhlIGZpbmFs
IGJpdCBvZiBhIGxvbmcgbGFzdGluZyBjbGVhbnVwIHF1ZXN0IHdoZXJlIHNldmVyYWwKPiBidXNl
cyB3ZXJlIGNvbnZlcnRlZCB0byBhbHNvIHJldHVybiB2b2lkIGZyb20gdGhlaXIgcmVtb3ZlIGNh
bGxiYWNrLgo+IEFkZGl0aW9uYWxseSBzb21lIHJlc291cmNlIGxlYWtzIHdlcmUgZml4ZWQgdGhh
dCB3ZXJlIGNhdXNlZCBieSBkcml2ZXJzCj4gcmV0dXJuaW5nIGFuIGVycm9yIGNvZGUgaW4gdGhl
IGV4cGVjdGF0aW9uIHRoYXQgdGhlIGRyaXZlciB3b24ndCBnbwo+IGF3YXkuCj4KPiBXaXRoIHN0
cnVjdCBidXNfdHlwZTo6cmVtb3ZlIHJldHVybmluZyB2b2lkIGl0J3MgcHJldmVudGVkIHRoYXQg
bmV3bHkKPiBpbXBsZW1lbnRlZCBidXNlcyByZXR1cm4gYW4gaWdub3JlZCBlcnJvciBjb2RlIGFu
ZCBzbyBkb24ndCBhbnRpY2lwYXRlCj4gd3JvbmcgZXhwZWN0YXRpb25zIGZvciBkcml2ZXIgYXV0
aG9ycy4KCllheSEKCj4KPiBTaWduZWQtb2ZmLWJ5OiBVd2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVp
bmUta29lbmlnQHBlbmd1dHJvbml4LmRlPgo+IC0tLQo+IEhlbGxvLAo+Cj4gdGhpcyBwYXRjaCBk
ZXBlbmRzIG9uICJQQ0k6IGVuZHBvaW50OiBNYWtlIHN0cnVjdCBwY2lfZXBmX2RyaXZlcjo6cmVt
b3ZlCj4gcmV0dXJuIHZvaWQiIHRoYXQgaXMgbm90IHlldCBhcHBsaWVkLCBzZWUKPiBodHRwczov
L2xvcmUua2VybmVsLm9yZy9yLzIwMjEwMjIzMDkwNzU3LjU3NjA0LTEtdS5rbGVpbmUta29lbmln
QHBlbmd1dHJvbml4LmRlLgo+Cj4gSSB0ZXN0ZWQgaXQgdXNpbmcgYWxsbW9kY29uZmlnIG9uIGFt
ZDY0IGFuZCBhcm0sIGJ1dCBJIHdvdWxkbid0IGJlCj4gc3VycHJpc2VkIGlmIEkgc3RpbGwgbWlz
c2VkIHRvIGNvbnZlcnQgYSBkcml2ZXIuIFNvIGl0IHdvdWxkIGJlIGdyZWF0IHRvCj4gZ2V0IHRo
aXMgaW50byBuZXh0IGVhcmx5IGFmdGVyIHRoZSBtZXJnZSB3aW5kb3cgY2xvc2VzLgoKSSdtIGFm
cmFpZCB5b3UgbWlzc2VkIHRoZSBzMzkwLXNwZWNpZmljIGJ1c3NlcyBpbiBkcml2ZXJzL3MzOTAv
Y2lvLwooY3NzL2Njdy9jY3dncm91cCkuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpncmV5YnVzLWRldiBtYWlsaW5nIGxpc3QKZ3JleWJ1cy1kZXZAbGlz
dHMubGluYXJvLm9yZwpodHRwczovL2xpc3RzLmxpbmFyby5vcmcvbWFpbG1hbi9saXN0aW5mby9n
cmV5YnVzLWRldgo=
