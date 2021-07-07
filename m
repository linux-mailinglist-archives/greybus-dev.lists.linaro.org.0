Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id C5E593BF69C
	for <lists+greybus-dev@lfdr.de>; Thu,  8 Jul 2021 09:57:27 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id A9E7266945
	for <lists+greybus-dev@lfdr.de>; Thu,  8 Jul 2021 07:57:26 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 9CDB366943; Thu,  8 Jul 2021 07:56:46 +0000 (UTC)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 915CB66A89;
	Thu,  8 Jul 2021 07:56:43 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 8286560B27
 for <greybus-dev@lists.linaro.org>; Wed,  7 Jul 2021 14:25:30 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 5500566904; Wed,  7 Jul 2021 14:25:30 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by lists.linaro.org (Postfix) with ESMTPS id 4401660B27
 for <greybus-dev@lists.linaro.org>; Wed,  7 Jul 2021 14:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625667927;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R1b1MmqRg+JjTb9SqE3N1oUES1jMyS6VpEEII2IWGuk=;
 b=DBpBczUgFB6V/rMm59vP7mT+W/C6Utznlc1KFJfhBuS6L7AHom/UCZbRDyOT2Gd7f6DPZh
 KeMTK0ddheB3UbV2r7Lsg+eh8aju2GKyS8xbH5cSfZQE+YmVaMTnp77fofDiCrhEQT6h6Y
 fqgVQ1j7MlL+tHkNB3V4xf2fNqboCPg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-144-CRo11BF7MI-sHiDKM9mjGw-1; Wed, 07 Jul 2021 10:25:26 -0400
X-MC-Unique: CRo11BF7MI-sHiDKM9mjGw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E6AB71926DB0;
 Wed,  7 Jul 2021 14:25:20 +0000 (UTC)
Received: from [10.36.112.61] (ovpn-112-61.ams2.redhat.com [10.36.112.61])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E4E3919C66;
 Wed,  7 Jul 2021 14:24:39 +0000 (UTC)
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20210706154803.1631813-1-u.kleine-koenig@pengutronix.de>
 <20210706154803.1631813-5-u.kleine-koenig@pengutronix.de>
From: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Message-ID: <5d3bf56e-285f-ecc1-ec64-384409645353@redhat.com>
Date: Wed, 7 Jul 2021 16:24:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210706154803.1631813-5-u.kleine-koenig@pengutronix.de>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=benjamin.tissoires@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Thu, 08 Jul 2021 07:55:56 +0000
Subject: Re: [greybus-dev] [PATCH v2 4/4] bus: Make remove callback return
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
 Ulf Hansson <ulf.hansson@linaro.org>, Jaroslav Kysela <perex@perex.cz>,
 Thorsten Scherer <t.scherer@eckelmann.de>, Paul Mackerras <paulus@samba.org>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Mike Christie <michael.christie@oracle.com>, Wei Liu <wei.liu@kernel.org>,
 Maxim Levitsky <maximlevitsky@gmail.com>, Samuel Holland <samuel@sholland.org>,
 Michael Ellerman <mpe@ellerman.id.au>, linux-acpi@vger.kernel.org,
 linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org,
 Tomas Winkler <tomas.winkler@intel.com>, Julien Grall <jgrall@amazon.com>,
 Ohad Ben-Cohen <ohad@wizery.com>, Alex Williamson <alex.williamson@redhat.com>,
 Alex Elder <elder@kernel.org>, linux-parisc@vger.kernel.org,
 Geoff Levand <geoff@infradead.org>, linux-fpga@vger.kernel.org,
 linux-usb@vger.kernel.org, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 Kai-Heng Feng <kai.heng.feng@canonical.com>, kernel@pengutronix.de,
 Jon Mason <jdmason@kudzu.us>, linux-ntb@googlegroups.com,
 Wu Hao <hao.wu@intel.com>, David Woodhouse <dwmw@amazon.co.uk>,
 =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kw@linux.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Manohar Vanga <manohar.vanga@gmail.com>, linux-wireless@vger.kernel.org,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 virtualization@lists.linux-foundation.org,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 target-devel@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-i2c@vger.kernel.org, Stefano Stabellini <sstabellini@kernel.org>,
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
 =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>,
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
 Vladimir Zapolskiy <vz@mleia.com>, Russell King <rmk+kernel@armlinux.org.uk>,
 Ben Widawsky <ben.widawsky@intel.com>, Moritz Fischer <mdf@kernel.org>,
 linux-cxl@vger.kernel.org, Michael Buesch <m@bues.ch>,
 Dan Williams <dan.j.williams@intel.com>,
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
 Johannes Thumshirn <jth@kernel.org>, Maximilian Luz <luzmaximilian@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: greybus-dev-bounces@lists.linaro.org
Sender: "greybus-dev" <greybus-dev-bounces@lists.linaro.org>
X-Virus-Scanned: ClamAV using ClamSMTP

T24gNy82LzIxIDU6NDggUE0sIFV3ZSBLbGVpbmUtS8O2bmlnIHdyb3RlOgo+IFRoZSBkcml2ZXIg
Y29yZSBpZ25vcmVzIHRoZSByZXR1cm4gdmFsdWUgb2YgdGhpcyBjYWxsYmFjayBiZWNhdXNlIHRo
ZXJlCj4gaXMgb25seSBsaXR0bGUgaXQgY2FuIGRvIHdoZW4gYSBkZXZpY2UgZGlzYXBwZWFycy4K
PiAKPiBUaGlzIGlzIHRoZSBmaW5hbCBiaXQgb2YgYSBsb25nIGxhc3RpbmcgY2xlYW51cCBxdWVz
dCB3aGVyZSBzZXZlcmFsCj4gYnVzZXMgd2VyZSBjb252ZXJ0ZWQgdG8gYWxzbyByZXR1cm4gdm9p
ZCBmcm9tIHRoZWlyIHJlbW92ZSBjYWxsYmFjay4KPiBBZGRpdGlvbmFsbHkgc29tZSByZXNvdXJj
ZSBsZWFrcyB3ZXJlIGZpeGVkIHRoYXQgd2VyZSBjYXVzZWQgYnkgZHJpdmVycwo+IHJldHVybmlu
ZyBhbiBlcnJvciBjb2RlIGluIHRoZSBleHBlY3RhdGlvbiB0aGF0IHRoZSBkcml2ZXIgd29uJ3Qg
Z28KPiBhd2F5Lgo+IAo+IFdpdGggc3RydWN0IGJ1c190eXBlOjpyZW1vdmUgcmV0dXJuaW5nIHZv
aWQgaXQncyBwcmV2ZW50ZWQgdGhhdCBuZXdseQo+IGltcGxlbWVudGVkIGJ1c2VzIHJldHVybiBh
biBpZ25vcmVkIGVycm9yIGNvZGUgYW5kIHNvIGRvbid0IGFudGljaXBhdGUKPiB3cm9uZyBleHBl
Y3RhdGlvbnMgZm9yIGRyaXZlciBhdXRob3JzLgo+IAo+IEFja2VkLWJ5OiBSdXNzZWxsIEtpbmcg
KE9yYWNsZSkgPHJtaytrZXJuZWxAYXJtbGludXgub3JnLnVrPiAoRm9yIEFSTSwgQW1iYSBhbmQg
cmVsYXRlZCBwYXJ0cykKPiBBY2tlZC1ieTogTWFyayBCcm93biA8YnJvb25pZUBrZXJuZWwub3Jn
Pgo+IEFja2VkLWJ5OiBDaGVuLVl1IFRzYWkgPHdlbnNAY3NpZS5vcmc+IChmb3IgZHJpdmVycy9i
dXMvc3VueGktcnNiLmMpCj4gQWNrZWQtYnk6IFBhbGkgUm9ow6FyIDxwYWxpQGtlcm5lbC5vcmc+
Cj4gQWNrZWQtYnk6IE1hdXJvIENhcnZhbGhvIENoZWhhYiA8bWNoZWhhYkBrZXJuZWwub3JnPiAo
Zm9yIGRyaXZlcnMvbWVkaWEpCj4gQWNrZWQtYnk6IEhhbnMgZGUgR29lZGUgPGhkZWdvZWRlQHJl
ZGhhdC5jb20+IChGb3IgZHJpdmVycy9wbGF0Zm9ybSkKPiBBY2tlZC1ieTogQWxleGFuZHJlIEJl
bGxvbmkgPGFsZXhhbmRyZS5iZWxsb25pQGJvb3RsaW4uY29tPgo+IEFja2VkLUJ5OiBWaW5vZCBL
b3VsIDx2a291bEBrZXJuZWwub3JnPgo+IEFja2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NA
c3VzZS5jb20+IChGb3IgWGVuKQo+IEFja2VkLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5h
cm8ub3JnPiAoRm9yIGRyaXZlcnMvbWZkKQo+IEFja2VkLWJ5OiBKb2hhbm5lcyBUaHVtc2hpcm4g
PGp0aEBrZXJuZWwub3JnPiAoRm9yIGRyaXZlcnMvbWNiKQo+IEFja2VkLWJ5OiBKb2hhbiBIb3Zv
bGQgPGpvaGFuQGtlcm5lbC5vcmc+Cj4gQWNrZWQtYnk6IFNyaW5pdmFzIEthbmRhZ2F0bGEgPHNy
aW5pdmFzLmthbmRhZ2F0bGFAbGluYXJvLm9yZz4gKEZvciBkcml2ZXJzL3NsaW1idXMpCj4gQWNr
ZWQtYnk6IEtpcnRpIFdhbmtoZWRlIDxrd2Fua2hlZGVAbnZpZGlhLmNvbT4gKEZvciBkcml2ZXJz
L3ZmaW8pCj4gQWNrZWQtYnk6IE1heGltaWxpYW4gTHV6IDxsdXptYXhpbWlsaWFuQGdtYWlsLmNv
bT4KPiBBY2tlZC1ieTogSGVpa2tpIEtyb2dlcnVzIDxoZWlra2kua3JvZ2VydXNAbGludXguaW50
ZWwuY29tPiAoRm9yIHVscGkgYW5kIHR5cGVjKQo+IEFja2VkLWJ5OiBTYW11ZWwgSWdsZXNpYXMg
R29uc8OhbHZleiA8c2lnbGVzaWFzQGlnYWxpYS5jb20+IChGb3IgaXBhY2spCj4gUmV2aWV3ZWQt
Ynk6IFRvbSBSaXggPHRyaXhAcmVkaGF0LmNvbT4gKEZvciBmcGdhKQo+IEFja2VkLWJ5OiBHZW9m
ZiBMZXZhbmQgPGdlb2ZmQGluZnJhZGVhZC5vcmc+IChGb3IgcHMzKQo+IFNpZ25lZC1vZmYtYnk6
IFV3ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+Cj4gLS0t
Cj4gCgpbLi4uXQoKPiAgIGRyaXZlcnMvaGlkL2hpZC1jb3JlLmMgICAgICAgICAgICAgICAgICAg
IHwgNCArLS0tCj4gICBkcml2ZXJzL2hpZC9pbnRlbC1pc2gtaGlkL2lzaHRwL2J1cy5jICAgICB8
IDQgKy0tLQoKWy4uLl0KCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaGlkL2hpZC1jb3JlLmMgYi9k
cml2ZXJzL2hpZC9oaWQtY29yZS5jCj4gaW5kZXggN2RiMzMyMTM5ZjdkLi5kYmVkMjUyNGZkNDcg
MTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9oaWQvaGlkLWNvcmUuYwo+ICsrKyBiL2RyaXZlcnMvaGlk
L2hpZC1jb3JlLmMKPiBAQCAtMjMwMiw3ICsyMzAyLDcgQEAgc3RhdGljIGludCBoaWRfZGV2aWNl
X3Byb2JlKHN0cnVjdCBkZXZpY2UgKmRldikKPiAgIAlyZXR1cm4gcmV0Owo+ICAgfQo+ICAgCj4g
LXN0YXRpYyBpbnQgaGlkX2RldmljZV9yZW1vdmUoc3RydWN0IGRldmljZSAqZGV2KQo+ICtzdGF0
aWMgdm9pZCBoaWRfZGV2aWNlX3JlbW92ZShzdHJ1Y3QgZGV2aWNlICpkZXYpCj4gICB7Cj4gICAJ
c3RydWN0IGhpZF9kZXZpY2UgKmhkZXYgPSB0b19oaWRfZGV2aWNlKGRldik7Cj4gICAJc3RydWN0
IGhpZF9kcml2ZXIgKmhkcnY7Cj4gQEAgLTIzMjIsOCArMjMyMiw2IEBAIHN0YXRpYyBpbnQgaGlk
X2RldmljZV9yZW1vdmUoc3RydWN0IGRldmljZSAqZGV2KQo+ICAgCj4gICAJaWYgKCFoZGV2LT5p
b19zdGFydGVkKQo+ICAgCQl1cCgmaGRldi0+ZHJpdmVyX2lucHV0X2xvY2spOwo+IC0KPiAtCXJl
dHVybiAwOwo+ICAgfQo+ICAgCj4gICBzdGF0aWMgc3NpemVfdCBtb2RhbGlhc19zaG93KHN0cnVj
dCBkZXZpY2UgKmRldiwgc3RydWN0IGRldmljZV9hdHRyaWJ1dGUgKmEsCj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvaGlkL2ludGVsLWlzaC1oaWQvaXNodHAvYnVzLmMgYi9kcml2ZXJzL2hpZC9pbnRl
bC1pc2gtaGlkL2lzaHRwL2J1cy5jCj4gaW5kZXggZjA4MDJiMDQ3ZWQ4Li44YTUxYmQ5Y2QwOTMg
MTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9oaWQvaW50ZWwtaXNoLWhpZC9pc2h0cC9idXMuYwo+ICsr
KyBiL2RyaXZlcnMvaGlkL2ludGVsLWlzaC1oaWQvaXNodHAvYnVzLmMKPiBAQCAtMjU1LDcgKzI1
NSw3IEBAIHN0YXRpYyBpbnQgaXNodHBfY2xfYnVzX21hdGNoKHN0cnVjdCBkZXZpY2UgKmRldiwg
c3RydWN0IGRldmljZV9kcml2ZXIgKmRydikKPiAgICAqCj4gICAgKiBSZXR1cm46IFJldHVybiB2
YWx1ZSBmcm9tIGRyaXZlciByZW1vdmUoKSBjYWxsLgo+ICAgICovCj4gLXN0YXRpYyBpbnQgaXNo
dHBfY2xfZGV2aWNlX3JlbW92ZShzdHJ1Y3QgZGV2aWNlICpkZXYpCj4gK3N0YXRpYyB2b2lkIGlz
aHRwX2NsX2RldmljZV9yZW1vdmUoc3RydWN0IGRldmljZSAqZGV2KQo+ICAgewo+ICAgCXN0cnVj
dCBpc2h0cF9jbF9kZXZpY2UgKmRldmljZSA9IHRvX2lzaHRwX2NsX2RldmljZShkZXYpOwo+ICAg
CXN0cnVjdCBpc2h0cF9jbF9kcml2ZXIgKmRyaXZlciA9IHRvX2lzaHRwX2NsX2RyaXZlcihkZXYt
PmRyaXZlcik7Cj4gQEAgLTI2Nyw4ICsyNjcsNiBAQCBzdGF0aWMgaW50IGlzaHRwX2NsX2Rldmlj
ZV9yZW1vdmUoc3RydWN0IGRldmljZSAqZGV2KQo+ICAgCj4gICAJaWYgKGRyaXZlci0+cmVtb3Zl
KQo+ICAgCQlkcml2ZXItPnJlbW92ZShkZXZpY2UpOwo+IC0KPiAtCXJldHVybiAwOwo+ICAgfQo+
ICAgCj4gICAvKioKCkZvciB0aGUgSElEIHBhcnQ6CgpBY2tlZC1ieTogQmVuamFtaW4gVGlzc29p
cmVzIDxiZW5qYW1pbi50aXNzb2lyZXNAcmVkaGF0LmNvbT4KCkNoZWVycywKQmVuamFtaW4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmdyZXlidXMtZGV2
IG1haWxpbmcgbGlzdApncmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3JnCmh0dHBzOi8vbGlzdHMu
bGluYXJvLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2dyZXlidXMtZGV2Cg==
