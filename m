Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 317D73BF693
	for <lists+greybus-dev@lfdr.de>; Thu,  8 Jul 2021 09:57:11 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id EEFD466934
	for <lists+greybus-dev@lfdr.de>; Thu,  8 Jul 2021 07:57:09 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id B924C6676A; Thu,  8 Jul 2021 07:56:22 +0000 (UTC)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id CA45C6697E;
	Thu,  8 Jul 2021 07:56:19 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 9F05D604F9
 for <greybus-dev@lists.linaro.org>; Tue,  6 Jul 2021 11:17:59 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 876BB60BC6; Tue,  6 Jul 2021 11:17:59 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by lists.linaro.org (Postfix) with ESMTPS id 77533604F9
 for <greybus-dev@lists.linaro.org>; Tue,  6 Jul 2021 11:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625570277;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X+JgLl9QuEVsbPi9CHfgp/50dUcjaNVT1a3Q1xwSglg=;
 b=NvkXANPVY3BU9Z47a7WIgfyX99b/fX2R3+gkXRx5UbLe8xvk+4bD/GEsafqgWAgCsYHYU8
 8nqBRHRtdxTI/pAS0l9vErZyBvTg8xpzogppN68KAaDJjHkwpk3omwvyH4EL4uXOjv8Gqy
 vLNHZHbOCB1P+W+L0k2ttO2FFWZdnW4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-277-yIaEybclO9Gf3dSvLShqRA-1; Tue, 06 Jul 2021 07:17:55 -0400
X-MC-Unique: yIaEybclO9Gf3dSvLShqRA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 966CD802C87;
 Tue,  6 Jul 2021 11:17:49 +0000 (UTC)
Received: from localhost (ovpn-113-13.ams2.redhat.com [10.36.113.13])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2FC1919C79;
 Tue,  6 Jul 2021 11:17:39 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>
In-Reply-To: <87pmvvhfqq.fsf@redhat.com>
Organization: Red Hat GmbH
References: <20210706095037.1425211-1-u.kleine-koenig@pengutronix.de>
 <87pmvvhfqq.fsf@redhat.com>
User-Agent: Notmuch/0.32.1 (https://notmuchmail.org)
Date: Tue, 06 Jul 2021 13:17:37 +0200
Message-ID: <87mtqzhesu.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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

T24gVHVlLCBKdWwgMDYgMjAyMSwgQ29ybmVsaWEgSHVjayA8Y29odWNrQHJlZGhhdC5jb20+IHdy
b3RlOgoKPiBPbiBUdWUsIEp1bCAwNiAyMDIxLCBVd2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUt
a29lbmlnQHBlbmd1dHJvbml4LmRlPiB3cm90ZToKPgo+PiBUaGUgZHJpdmVyIGNvcmUgaWdub3Jl
cyB0aGUgcmV0dXJuIHZhbHVlIG9mIHRoaXMgY2FsbGJhY2sgYmVjYXVzZSB0aGVyZQo+PiBpcyBv
bmx5IGxpdHRsZSBpdCBjYW4gZG8gd2hlbiBhIGRldmljZSBkaXNhcHBlYXJzLgo+Pgo+PiBUaGlz
IGlzIHRoZSBmaW5hbCBiaXQgb2YgYSBsb25nIGxhc3RpbmcgY2xlYW51cCBxdWVzdCB3aGVyZSBz
ZXZlcmFsCj4+IGJ1c2VzIHdlcmUgY29udmVydGVkIHRvIGFsc28gcmV0dXJuIHZvaWQgZnJvbSB0
aGVpciByZW1vdmUgY2FsbGJhY2suCj4+IEFkZGl0aW9uYWxseSBzb21lIHJlc291cmNlIGxlYWtz
IHdlcmUgZml4ZWQgdGhhdCB3ZXJlIGNhdXNlZCBieSBkcml2ZXJzCj4+IHJldHVybmluZyBhbiBl
cnJvciBjb2RlIGluIHRoZSBleHBlY3RhdGlvbiB0aGF0IHRoZSBkcml2ZXIgd29uJ3QgZ28KPj4g
YXdheS4KPj4KPj4gV2l0aCBzdHJ1Y3QgYnVzX3R5cGU6OnJlbW92ZSByZXR1cm5pbmcgdm9pZCBp
dCdzIHByZXZlbnRlZCB0aGF0IG5ld2x5Cj4+IGltcGxlbWVudGVkIGJ1c2VzIHJldHVybiBhbiBp
Z25vcmVkIGVycm9yIGNvZGUgYW5kIHNvIGRvbid0IGFudGljaXBhdGUKPj4gd3JvbmcgZXhwZWN0
YXRpb25zIGZvciBkcml2ZXIgYXV0aG9ycy4KPgo+IFlheSEKPgo+Pgo+PiBTaWduZWQtb2ZmLWJ5
OiBVd2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlPgo+PiAt
LS0KPj4gSGVsbG8sCj4+Cj4+IHRoaXMgcGF0Y2ggZGVwZW5kcyBvbiAiUENJOiBlbmRwb2ludDog
TWFrZSBzdHJ1Y3QgcGNpX2VwZl9kcml2ZXI6OnJlbW92ZQo+PiByZXR1cm4gdm9pZCIgdGhhdCBp
cyBub3QgeWV0IGFwcGxpZWQsIHNlZQo+PiBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjEw
MjIzMDkwNzU3LjU3NjA0LTEtdS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlLgo+Pgo+PiBJ
IHRlc3RlZCBpdCB1c2luZyBhbGxtb2Rjb25maWcgb24gYW1kNjQgYW5kIGFybSwgYnV0IEkgd291
bGRuJ3QgYmUKPj4gc3VycHJpc2VkIGlmIEkgc3RpbGwgbWlzc2VkIHRvIGNvbnZlcnQgYSBkcml2
ZXIuIFNvIGl0IHdvdWxkIGJlIGdyZWF0IHRvCj4+IGdldCB0aGlzIGludG8gbmV4dCBlYXJseSBh
ZnRlciB0aGUgbWVyZ2Ugd2luZG93IGNsb3Nlcy4KPgo+IEknbSBhZnJhaWQgeW91IG1pc3NlZCB0
aGUgczM5MC1zcGVjaWZpYyBidXNzZXMgaW4gZHJpdmVycy9zMzkwL2Npby8KPiAoY3NzL2Njdy9j
Y3dncm91cCkuCgpUaGUgY2hhbmdlIGZvciB2ZmlvL21kZXYgbG9va3MgZ29vZC4KClRoZSBmb2xs
b3dpbmcgc2hvdWxkIGRvIHRoZSB0cmljayBmb3IgczM5MDsgbm90IHN1cmUgaWYgb3RoZXIKYXJj
aGl0ZWN0dXJlcyBoYXZlIGVhc3ktdG8tbWlzcyBidXNzZXMgYXMgd2VsbC4KCmRpZmYgLS1naXQg
YS9kcml2ZXJzL3MzOTAvY2lvL2Njd2dyb3VwLmMgYi9kcml2ZXJzL3MzOTAvY2lvL2Njd2dyb3Vw
LmMKaW5kZXggOTc0ODE2NWUwOGU5Li5hNjZmNDE2MTM4YWIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
czM5MC9jaW8vY2N3Z3JvdXAuYworKysgYi9kcml2ZXJzL3MzOTAvY2lvL2Njd2dyb3VwLmMKQEAg
LTQzOSwxNyArNDM5LDE1IEBAIG1vZHVsZV9leGl0KGNsZWFudXBfY2N3Z3JvdXApOwogCiAvKioq
KioqKioqKioqKioqKioqKioqKioqKiogZHJpdmVyIHN0dWZmICoqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKi8KIAotc3RhdGljIGludCBjY3dncm91cF9yZW1vdmUoc3RydWN0IGRldmljZSAq
ZGV2KQorc3RhdGljIHZvaWQgY2N3Z3JvdXBfcmVtb3ZlKHN0cnVjdCBkZXZpY2UgKmRldikKIHsK
IAlzdHJ1Y3QgY2N3Z3JvdXBfZGV2aWNlICpnZGV2ID0gdG9fY2N3Z3JvdXBkZXYoZGV2KTsKIAlz
dHJ1Y3QgY2N3Z3JvdXBfZHJpdmVyICpnZHJ2ID0gdG9fY2N3Z3JvdXBkcnYoZGV2LT5kcml2ZXIp
OwogCiAJaWYgKCFkZXYtPmRyaXZlcikKLQkJcmV0dXJuIDA7CisJCXJldHVybjsKIAlpZiAoZ2Ry
di0+cmVtb3ZlKQogCQlnZHJ2LT5yZW1vdmUoZ2Rldik7Ci0KLQlyZXR1cm4gMDsKIH0KIAogc3Rh
dGljIHZvaWQgY2N3Z3JvdXBfc2h1dGRvd24oc3RydWN0IGRldmljZSAqZGV2KQpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9zMzkwL2Npby9jc3MuYyBiL2RyaXZlcnMvczM5MC9jaW8vY3NzLmMKaW5kZXgg
YTk3NDk0M2MyN2RhLi5lYmMzMjFlZGJhNTEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvczM5MC9jaW8v
Y3NzLmMKKysrIGIvZHJpdmVycy9zMzkwL2Npby9jc3MuYwpAQCAtMTM3MSwxNSArMTM3MSwxNCBA
QCBzdGF0aWMgaW50IGNzc19wcm9iZShzdHJ1Y3QgZGV2aWNlICpkZXYpCiAJcmV0dXJuIHJldDsK
IH0KIAotc3RhdGljIGludCBjc3NfcmVtb3ZlKHN0cnVjdCBkZXZpY2UgKmRldikKK3N0YXRpYyB2
b2lkIGNzc19yZW1vdmUoc3RydWN0IGRldmljZSAqZGV2KQogewogCXN0cnVjdCBzdWJjaGFubmVs
ICpzY2g7Ci0JaW50IHJldDsKIAogCXNjaCA9IHRvX3N1YmNoYW5uZWwoZGV2KTsKLQlyZXQgPSBz
Y2gtPmRyaXZlci0+cmVtb3ZlID8gc2NoLT5kcml2ZXItPnJlbW92ZShzY2gpIDogMDsKKwlpZiAo
c2NoLT5kcml2ZXItPnJlbW92ZSkKKwkJc2NoLT5kcml2ZXItPnJlbW92ZShzY2gpOwogCXNjaC0+
ZHJpdmVyID0gTlVMTDsKLQlyZXR1cm4gcmV0OwogfQogCiBzdGF0aWMgdm9pZCBjc3Nfc2h1dGRv
d24oc3RydWN0IGRldmljZSAqZGV2KQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9zMzkwL2Npby9kZXZp
Y2UuYyBiL2RyaXZlcnMvczM5MC9jaW8vZGV2aWNlLmMKaW5kZXggODRmNjU5Y2FmZTc2Li42MWQ1
ZDU1YmQ5YzggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvczM5MC9jaW8vZGV2aWNlLmMKKysrIGIvZHJp
dmVycy9zMzkwL2Npby9kZXZpY2UuYwpAQCAtMTc0Miw3ICsxNzQyLDcgQEAgY2N3X2RldmljZV9w
cm9iZSAoc3RydWN0IGRldmljZSAqZGV2KQogCXJldHVybiAwOwogfQogCi1zdGF0aWMgaW50IGNj
d19kZXZpY2VfcmVtb3ZlKHN0cnVjdCBkZXZpY2UgKmRldikKK3N0YXRpYyB2b2lkIGNjd19kZXZp
Y2VfcmVtb3ZlKHN0cnVjdCBkZXZpY2UgKmRldikKIHsKIAlzdHJ1Y3QgY2N3X2RldmljZSAqY2Rl
diA9IHRvX2Njd2RldihkZXYpOwogCXN0cnVjdCBjY3dfZHJpdmVyICpjZHJ2ID0gY2Rldi0+ZHJ2
OwpAQCAtMTc3Niw4ICsxNzc2LDYgQEAgc3RhdGljIGludCBjY3dfZGV2aWNlX3JlbW92ZShzdHJ1
Y3QgZGV2aWNlICpkZXYpCiAJc3Bpbl91bmxvY2tfaXJxKGNkZXYtPmNjd2xvY2spOwogCWlvX3N1
YmNoYW5uZWxfcXVpZXNjZShzY2gpOwogCV9fZGlzYWJsZV9jbWYoY2Rldik7Ci0KLQlyZXR1cm4g
MDsKIH0KIAogc3RhdGljIHZvaWQgY2N3X2RldmljZV9zaHV0ZG93bihzdHJ1Y3QgZGV2aWNlICpk
ZXYpCmRpZmYgLS1naXQgYS9kcml2ZXJzL3MzOTAvY2lvL3NjbS5jIGIvZHJpdmVycy9zMzkwL2Np
by9zY20uYwppbmRleCA5ZjI2ZDQzMTBiYjMuLmI2YjQ1ODljNzBiZCAxMDA2NDQKLS0tIGEvZHJp
dmVycy9zMzkwL2Npby9zY20uYworKysgYi9kcml2ZXJzL3MzOTAvY2lvL3NjbS5jCkBAIC0yOCwx
MiArMjgsMTMgQEAgc3RhdGljIGludCBzY21kZXZfcHJvYmUoc3RydWN0IGRldmljZSAqZGV2KQog
CXJldHVybiBzY21kcnYtPnByb2JlID8gc2NtZHJ2LT5wcm9iZShzY21kZXYpIDogLUVOT0RFVjsK
IH0KIAotc3RhdGljIGludCBzY21kZXZfcmVtb3ZlKHN0cnVjdCBkZXZpY2UgKmRldikKK3N0YXRp
YyB2b2lkIHNjbWRldl9yZW1vdmUoc3RydWN0IGRldmljZSAqZGV2KQogewogCXN0cnVjdCBzY21f
ZGV2aWNlICpzY21kZXYgPSB0b19zY21fZGV2KGRldik7CiAJc3RydWN0IHNjbV9kcml2ZXIgKnNj
bWRydiA9IHRvX3NjbV9kcnYoZGV2LT5kcml2ZXIpOwogCi0JcmV0dXJuIHNjbWRydi0+cmVtb3Zl
ID8gc2NtZHJ2LT5yZW1vdmUoc2NtZGV2KSA6IC1FTk9ERVY7CisJaWYgKHNjbWRydi0+cmVtb3Zl
KQorCQlzY21kcnYtPnJlbW92ZShzY21kZXYpOwogfQogCiBzdGF0aWMgaW50IHNjbWRldl91ZXZl
bnQoc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3Qga29ial91ZXZlbnRfZW52ICplbnYpCmRpZmYg
LS1naXQgYS9kcml2ZXJzL3MzOTAvY3J5cHRvL2FwX2J1cy5jIGIvZHJpdmVycy9zMzkwL2NyeXB0
by9hcF9idXMuYwppbmRleCBkMjU2MDE4NmQ3NzEuLjhhMGQzN2MwZTJhNSAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9zMzkwL2NyeXB0by9hcF9idXMuYworKysgYi9kcml2ZXJzL3MzOTAvY3J5cHRvL2Fw
X2J1cy5jCkBAIC04ODQsNyArODg0LDcgQEAgc3RhdGljIGludCBhcF9kZXZpY2VfcHJvYmUoc3Ry
dWN0IGRldmljZSAqZGV2KQogCXJldHVybiByYzsKIH0KIAotc3RhdGljIGludCBhcF9kZXZpY2Vf
cmVtb3ZlKHN0cnVjdCBkZXZpY2UgKmRldikKK3N0YXRpYyB2b2lkIGFwX2RldmljZV9yZW1vdmUo
c3RydWN0IGRldmljZSAqZGV2KQogewogCXN0cnVjdCBhcF9kZXZpY2UgKmFwX2RldiA9IHRvX2Fw
X2RldihkZXYpOwogCXN0cnVjdCBhcF9kcml2ZXIgKmFwX2RydiA9IGFwX2Rldi0+ZHJ2OwpAQCAt
OTA5LDggKzkwOSw2IEBAIHN0YXRpYyBpbnQgYXBfZGV2aWNlX3JlbW92ZShzdHJ1Y3QgZGV2aWNl
ICpkZXYpCiAJYXBfZGV2LT5kcnYgPSBOVUxMOwogCiAJcHV0X2RldmljZShkZXYpOwotCi0JcmV0
dXJuIDA7CiB9CiAKIHN0cnVjdCBhcF9xdWV1ZSAqYXBfZ2V0X3FkZXYoYXBfcWlkX3QgcWlkKQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1k
ZXYgbWFpbGluZyBsaXN0CmdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKaHR0cHM6Ly9saXN0
cy5saW5hcm8ub3JnL21haWxtYW4vbGlzdGluZm8vZ3JleWJ1cy1kZXYK
