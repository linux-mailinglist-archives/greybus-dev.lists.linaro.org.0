Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id EAF4F3BC9F6
	for <lists+greybus-dev@lfdr.de>; Tue,  6 Jul 2021 12:31:03 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id F091366944
	for <lists+greybus-dev@lfdr.de>; Tue,  6 Jul 2021 10:31:02 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id E813866943; Tue,  6 Jul 2021 10:30:51 +0000 (UTC)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id BF2066693E;
	Tue,  6 Jul 2021 10:30:46 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id A70B96049C
 for <greybus-dev@lists.linaro.org>; Tue,  6 Jul 2021 10:25:17 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 9E4096678B; Tue,  6 Jul 2021 10:25:17 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 by lists.linaro.org (Postfix) with ESMTPS id 98C1E6049C
 for <greybus-dev@lists.linaro.org>; Tue,  6 Jul 2021 10:25:15 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id t3so27304936edc.7
 for <greybus-dev@lists.linaro.org>; Tue, 06 Jul 2021 03:25:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc:content-transfer-encoding;
 bh=QFd4cSgjRlNs6aAHRKVeotkaIh4ASKGZEfmqK4rh/rE=;
 b=NUnMAfAWjSS3mm7aa9w5JTGwccrdersBJEHUvh/X997oe/SDtkXmDEDtvk5S4J/00o
 2G+Ij9MSAgj9YcgslWXhFhgC8v6MSOVV4Zt1IbvKNsFy9F+AH/EkX7giVPXgWpMzuGm9
 FbxHbR5+g87DJ5wmpG+3wcknda1d5zt2QTi7zv4VzyWF3Pqqf9y/atmIq2O7CkOSqY+Y
 y61weaQjyP9m2DLBMr8davZIlBm6FhLPklwa6lyuL3SHTvs+R/x0TBDD0NJBW4hkDAXd
 0sjOsFW1Roicnevp2DzabF1CSRI1LJLSAtlmH+KZ4U6ByzySQE7UJCS2IE/FL32KOn9n
 uhzw==
X-Gm-Message-State: AOAM530mVoiV2wf6mZaXF9NQLg5kDZPOSbDsQn+sByUeVx6k+oFNPwMj
 7AK3AyJ/39PnksY0pw7065HLxYRrtRT/Z+T8vJA=
X-Google-Smtp-Source: ABdhPJw2z6l7JreA1jOqMbRCt5Ec4Db5BMmNy6wafkUPvOjeZFHcW+DE9JsbbX4gYdonTiq+RmV7RQ==
X-Received: by 2002:a05:6402:27ce:: with SMTP id
 c14mr21906284ede.333.1625567114182; 
 Tue, 06 Jul 2021 03:25:14 -0700 (PDT)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com.
 [209.85.218.51])
 by smtp.gmail.com with ESMTPSA id s5sm7081308edi.93.2021.07.06.03.25.13
 for <greybus-dev@lists.linaro.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jul 2021 03:25:13 -0700 (PDT)
Received: by mail-ej1-f51.google.com with SMTP id hr1so29959856ejc.1
 for <greybus-dev@lists.linaro.org>; Tue, 06 Jul 2021 03:25:13 -0700 (PDT)
X-Received: by 2002:a2e:1409:: with SMTP id u9mr9759960ljd.94.1625567102788;
 Tue, 06 Jul 2021 03:25:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210706095037.1425211-1-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20210706095037.1425211-1-u.kleine-koenig@pengutronix.de>
From: Chen-Yu Tsai <wens@csie.org>
Date: Tue, 6 Jul 2021 18:24:51 +0800
X-Gmail-Original-Message-ID: <CAGb2v65WCwDkCzf26urwM91nEWGPAzMHSMFX73WQsFQoWhr8JA@mail.gmail.com>
Message-ID: <CAGb2v65WCwDkCzf26urwM91nEWGPAzMHSMFX73WQsFQoWhr8JA@mail.gmail.com>
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
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
Reply-To: wens@csie.org
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
 PCI <linux-pci@vger.kernel.org>, xen-devel@lists.xenproject.org,
 Tomas Winkler <tomas.winkler@intel.com>, Julien Grall <jgrall@amazon.com>,
 Ohad Ben-Cohen <ohad@wizery.com>, Alex Williamson <alex.williamson@redhat.com>,
 Alex Elder <elder@kernel.org>, linux-parisc@vger.kernel.org,
 Geoff Levand <geoff@infradead.org>, linux-usb <linux-usb@vger.kernel.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 linux-kernel <linux-kernel@vger.kernel.org>, linux-spi@vger.kernel.org,
 Thorsten Scherer <t.scherer@eckelmann.de>,
 Sascha Hauer <kernel@pengutronix.de>, Jon Mason <jdmason@kudzu.us>,
 linux-ntb@googlegroups.com, Wu Hao <hao.wu@intel.com>,
 David Woodhouse <dwmw@amazon.co.uk>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Manohar Vanga <manohar.vanga@gmail.com>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 virtualization@lists.linux-foundation.org,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 target-devel@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-i2c@vger.kernel.org, Kai-Heng Feng <kai.heng.feng@canonical.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Stephen Hemminger <sthemmin@microsoft.com>, Ira Weiny <ira.weiny@intel.com>,
 Helge Deller <deller@gmx.de>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 industrypack-devel@lists.sourceforge.net, linux-mips@vger.kernel.org,
 Len Brown <lenb@kernel.org>, Linux-ALSA <alsa-devel@alsa-project.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Johan Hovold <johan@kernel.org>,
 greybus-dev@lists.linaro.org, Bjorn Helgaas <bhelgaas@google.com>,
 Dave Jiang <dave.jiang@intel.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Johannes Thumshirn <morbidrsa@gmail.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 Cornelia Huck <cohuck@redhat.com>, Wolfram Sang <wsa@kernel.org>,
 Joey Pabalan <jpabalanb@gmail.com>, Yehezkel Bernat <YehezkelShB@gmail.com>,
 =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>,
 Bodo Stroesser <bostroesser@gmail.com>,
 Alison Schofield <alison.schofield@intel.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Tyrel Datwyler <tyreld@linux.ibm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Tom Rix <trix@redhat.com>, Jason Wang <jasowang@redhat.com>,
 SeongJae Park <sjpark@amazon.de>, linux-hyperv@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, Frank Li <lznuaa@gmail.com>,
 netdev <netdev@vger.kernel.org>, Qinglang Miao <miaoqinglang@huawei.com>,
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Mark Gross <mgross@linux.intel.com>, linux-staging@lists.linux.dev,
 Dexuan Cui <decui@microsoft.com>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Kishon Vijay Abraham I <kishon@ti.com>, linux-input@vger.kernel.org,
 Matt Porter <mporter@kernel.crashing.org>, Allen Hubbe <allenbh@gmail.com>,
 Alex Dubov <oakad@yahoo.com>, Haiyang Zhang <haiyangz@microsoft.com>,
 Jiri Kosina <jikos@kernel.org>, Vladimir Zapolskiy <vz@mleia.com>,
 Ben Widawsky <ben.widawsky@intel.com>, Moritz Fischer <mdf@kernel.org>,
 linux-cxl@vger.kernel.org, Michael Buesch <m@bues.ch>,
 Dan Williams <dan.j.williams@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Cristian Marussi <cristian.marussi@arm.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Martyn Welch <martyn@welchs.me.uk>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 linux-mmc <linux-mmc@vger.kernel.org>, linux-sunxi@lists.linux.dev,
 Stefan Richter <stefanr@s5r6.in-berlin.de>,
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
 "open list:DMA GENERIC OFFLOAD ENGINE SUBSYSTEM" <dmaengine@vger.kernel.org>,
 Johannes Berg <johannes@sipsolutions.net>,
 Maximilian Luz <luzmaximilian@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: greybus-dev-bounces@lists.linaro.org
Sender: "greybus-dev" <greybus-dev-bounces@lists.linaro.org>
X-Virus-Scanned: ClamAV using ClamSMTP

T24gVHVlLCBKdWwgNiwgMjAyMSBhdCA1OjU0IFBNIFV3ZSBLbGVpbmUtS8O2bmlnCjx1LmtsZWlu
ZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+IHdyb3RlOgo+Cj4gVGhlIGRyaXZlciBjb3JlIGlnbm9y
ZXMgdGhlIHJldHVybiB2YWx1ZSBvZiB0aGlzIGNhbGxiYWNrIGJlY2F1c2UgdGhlcmUKPiBpcyBv
bmx5IGxpdHRsZSBpdCBjYW4gZG8gd2hlbiBhIGRldmljZSBkaXNhcHBlYXJzLgo+Cj4gVGhpcyBp
cyB0aGUgZmluYWwgYml0IG9mIGEgbG9uZyBsYXN0aW5nIGNsZWFudXAgcXVlc3Qgd2hlcmUgc2V2
ZXJhbAo+IGJ1c2VzIHdlcmUgY29udmVydGVkIHRvIGFsc28gcmV0dXJuIHZvaWQgZnJvbSB0aGVp
ciByZW1vdmUgY2FsbGJhY2suCj4gQWRkaXRpb25hbGx5IHNvbWUgcmVzb3VyY2UgbGVha3Mgd2Vy
ZSBmaXhlZCB0aGF0IHdlcmUgY2F1c2VkIGJ5IGRyaXZlcnMKPiByZXR1cm5pbmcgYW4gZXJyb3Ig
Y29kZSBpbiB0aGUgZXhwZWN0YXRpb24gdGhhdCB0aGUgZHJpdmVyIHdvbid0IGdvCj4gYXdheS4K
Pgo+IFdpdGggc3RydWN0IGJ1c190eXBlOjpyZW1vdmUgcmV0dXJuaW5nIHZvaWQgaXQncyBwcmV2
ZW50ZWQgdGhhdCBuZXdseQo+IGltcGxlbWVudGVkIGJ1c2VzIHJldHVybiBhbiBpZ25vcmVkIGVy
cm9yIGNvZGUgYW5kIHNvIGRvbid0IGFudGljaXBhdGUKPiB3cm9uZyBleHBlY3RhdGlvbnMgZm9y
IGRyaXZlciBhdXRob3JzLgo+Cj4gU2lnbmVkLW9mZi1ieTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUu
a2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4KPiAtLS0KPiBIZWxsbywKPgo+IHRoaXMgcGF0
Y2ggZGVwZW5kcyBvbiAiUENJOiBlbmRwb2ludDogTWFrZSBzdHJ1Y3QgcGNpX2VwZl9kcml2ZXI6
OnJlbW92ZQo+IHJldHVybiB2b2lkIiB0aGF0IGlzIG5vdCB5ZXQgYXBwbGllZCwgc2VlCj4gaHR0
cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDIxMDIyMzA5MDc1Ny41NzYwNC0xLXUua2xlaW5lLWtv
ZW5pZ0BwZW5ndXRyb25peC5kZS4KPgo+IEkgdGVzdGVkIGl0IHVzaW5nIGFsbG1vZGNvbmZpZyBv
biBhbWQ2NCBhbmQgYXJtLCBidXQgSSB3b3VsZG4ndCBiZQo+IHN1cnByaXNlZCBpZiBJIHN0aWxs
IG1pc3NlZCB0byBjb252ZXJ0IGEgZHJpdmVyLiBTbyBpdCB3b3VsZCBiZSBncmVhdCB0bwo+IGdl
dCB0aGlzIGludG8gbmV4dCBlYXJseSBhZnRlciB0aGUgbWVyZ2Ugd2luZG93IGNsb3Nlcy4KPgo+
IEkgc2VuZCB0aGlzIG1haWwgdG8gYWxsIHBlb3BsZSB0aGF0IGdldF9tYWludGFpbmVyLnBsIGVt
aXRzIGZvciB0aGlzCj4gcGF0Y2guIEkgd29uZGVyIGhvdyBtYW55IHJlY2lwZW50cyB3aWxsIHJl
ZnVzZSB0aGlzIG1haWwgYmVjYXVzZSBvZiB0aGUKPiBsb25nIENjOiBsaXN0IDotKQo+Cj4gQmVz
dCByZWdhcmRzCj4gVXdlCj4KCj4gIGRyaXZlcnMvYnVzL3N1bnhpLXJzYi5jICAgICAgICAgICAg
ICAgICAgIHwgNCArLS0tCgpBY2tlZC1ieTogQ2hlbi1ZdSBUc2FpIDx3ZW5zQGNzaWUub3JnPgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpncmV5YnVzLWRl
diBtYWlsaW5nIGxpc3QKZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpodHRwczovL2xpc3Rz
LmxpbmFyby5vcmcvbWFpbG1hbi9saXN0aW5mby9ncmV5YnVzLWRldgo=
