Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id DE7663BF689
	for <lists+greybus-dev@lfdr.de>; Thu,  8 Jul 2021 09:56:53 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id EFD586698F
	for <lists+greybus-dev@lfdr.de>; Thu,  8 Jul 2021 07:56:52 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id CC9006698A; Thu,  8 Jul 2021 07:56:32 +0000 (UTC)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id A92AB6697A;
	Thu,  8 Jul 2021 07:56:28 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id B6758607FB
 for <greybus-dev@lists.linaro.org>; Tue,  6 Jul 2021 15:11:38 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 8953D60C0C; Tue,  6 Jul 2021 15:11:38 +0000 (UTC)
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com
 [209.85.166.172])
 by lists.linaro.org (Postfix) with ESMTPS id 7F1CC607FB
 for <greybus-dev@lists.linaro.org>; Tue,  6 Jul 2021 15:11:36 +0000 (UTC)
Received: by mail-il1-f172.google.com with SMTP id g3so19822748ilq.10
 for <greybus-dev@lists.linaro.org>; Tue, 06 Jul 2021 08:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=4MFz8ETd/nmuIWZiubiifP+Omq2X9iSE9tCmj3gucYM=;
 b=IvCXivhuxpkQcwCSP/v/Rrn0oejjH/xBgjRtfoGhDm7lPAT9ogutmMgacy+clPyi90
 DRK6HgR8AmsyVM4QORABjf/IAyGQ3UrkgNOTqIRMXsHteuk6/x/Br3dCjgnqoJCe77/0
 NoZ6+4GEFW/mdLd6ihS8LHap9sTax8kG5BzSjYrBjsLKheGiGE55U68yC8yRpvGR3lrH
 i1lwKI80NFV0bQ+s0xhkaB3n4XHhOaW+jqS4RzYr17yLCz7jyCyj2zJOvQd/bsO7dMy8
 2ctnoUx7hTSh3dWCQ/T9gwlXwnhJ8TT3KyPZF8lHiLfnzYjBh4g93fOsXwM2kjJbuutz
 CEWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=4MFz8ETd/nmuIWZiubiifP+Omq2X9iSE9tCmj3gucYM=;
 b=M2ctVGQwITCqf6+3oIUsOqqgD8KKJ2RI8uHPt3lJJEWOjpPRNpmI1asctV7h4fZBDY
 0VSuFQO1OnodEfjV4xfHCE0fKkTwtwXXrHSZObcfR/7HWKTdH6gUACDQRkr8Y1h/yGTH
 DZD0GhamlfljiDSf3l716IObiBBEESC9N5uM3ZDNGRMDfnA12twGKW8HgKivPX6xMI+J
 M0eNPDlA6xfYbnlu8K/yxcN9yWm3ObHt/n8swuJrZEG32Ur8ne5pjjPFqS1Y040AkTfh
 RXNHBXoJat9Odr9tJAum4xsMLFQaw1BEKGVV7orUciiwUgNlOhORHKOucICwm7gjGNzc
 2y6w==
X-Gm-Message-State: AOAM5314OlfLhZ4jzFxQ/dLZwBEbRnrTEqd2htF9Q/vz7HJpEN9dg4/q
 aO9g968NEKEnUJHqYTi0HmLtBXepNevhK1rl5blWjd++
X-Google-Smtp-Source: ABdhPJzdclmD8PsHwW9RgRKWE0tJHszXQy4UssslzUqRBaLI9w/Jj1BdJnRyjKvoHgub8buDAUaWux7OCTROnp7miaQ=
X-Received: by 2002:a05:6e02:1a0f:: with SMTP id
 s15mr14885840ild.58.1625584295743; 
 Tue, 06 Jul 2021 08:11:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210706095037.1425211-1-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20210706095037.1425211-1-u.kleine-koenig@pengutronix.de>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Tue, 6 Jul 2021 09:11:24 -0600
Message-ID: <CANLsYkz_k3rBETkFWd9mm+Lgfcyp=YgiAM8rq8DaqaOcSofEkA@mail.gmail.com>
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
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
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-spi@vger.kernel.org, Thorsten Scherer <t.scherer@eckelmann.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Jon Mason <jdmason@kudzu.us>,
 linux-ntb@googlegroups.com, Wu Hao <hao.wu@intel.com>,
 David Woodhouse <dwmw@amazon.co.uk>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Manohar Vanga <manohar.vanga@gmail.com>, linux-wireless@vger.kernel.org,
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
 Len Brown <lenb@kernel.org>, alsa-devel@alsa-project.org,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, linux-media@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, Johan Hovold <johan@kernel.org>,
 greybus-dev@lists.linaro.org, Bjorn Helgaas <bhelgaas@google.com>,
 Dave Jiang <dave.jiang@intel.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Johannes Thumshirn <morbidrsa@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
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
 "Michael S. Tsirkin" <mst@redhat.com>,
 linux-remoteproc <linux-remoteproc@vger.kernel.org>,
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

T24gVHVlLCA2IEp1bCAyMDIxIGF0IDAzOjU2LCBVd2UgS2xlaW5lLUvDtm5pZwo8dS5rbGVpbmUt
a29lbmlnQHBlbmd1dHJvbml4LmRlPiB3cm90ZToKPgo+IFRoZSBkcml2ZXIgY29yZSBpZ25vcmVz
IHRoZSByZXR1cm4gdmFsdWUgb2YgdGhpcyBjYWxsYmFjayBiZWNhdXNlIHRoZXJlCj4gaXMgb25s
eSBsaXR0bGUgaXQgY2FuIGRvIHdoZW4gYSBkZXZpY2UgZGlzYXBwZWFycy4KPgo+IFRoaXMgaXMg
dGhlIGZpbmFsIGJpdCBvZiBhIGxvbmcgbGFzdGluZyBjbGVhbnVwIHF1ZXN0IHdoZXJlIHNldmVy
YWwKPiBidXNlcyB3ZXJlIGNvbnZlcnRlZCB0byBhbHNvIHJldHVybiB2b2lkIGZyb20gdGhlaXIg
cmVtb3ZlIGNhbGxiYWNrLgo+IEFkZGl0aW9uYWxseSBzb21lIHJlc291cmNlIGxlYWtzIHdlcmUg
Zml4ZWQgdGhhdCB3ZXJlIGNhdXNlZCBieSBkcml2ZXJzCj4gcmV0dXJuaW5nIGFuIGVycm9yIGNv
ZGUgaW4gdGhlIGV4cGVjdGF0aW9uIHRoYXQgdGhlIGRyaXZlciB3b24ndCBnbwo+IGF3YXkuCj4K
PiBXaXRoIHN0cnVjdCBidXNfdHlwZTo6cmVtb3ZlIHJldHVybmluZyB2b2lkIGl0J3MgcHJldmVu
dGVkIHRoYXQgbmV3bHkKPiBpbXBsZW1lbnRlZCBidXNlcyByZXR1cm4gYW4gaWdub3JlZCBlcnJv
ciBjb2RlIGFuZCBzbyBkb24ndCBhbnRpY2lwYXRlCj4gd3JvbmcgZXhwZWN0YXRpb25zIGZvciBk
cml2ZXIgYXV0aG9ycy4KPgo+IFNpZ25lZC1vZmYtYnk6IFV3ZSBLbGVpbmUtS8O2bmlnIDx1Lmts
ZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+Cj4gLS0tCj4gSGVsbG8sCj4KPiB0aGlzIHBhdGNo
IGRlcGVuZHMgb24gIlBDSTogZW5kcG9pbnQ6IE1ha2Ugc3RydWN0IHBjaV9lcGZfZHJpdmVyOjpy
ZW1vdmUKPiByZXR1cm4gdm9pZCIgdGhhdCBpcyBub3QgeWV0IGFwcGxpZWQsIHNlZQo+IGh0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyMTAyMjMwOTA3NTcuNTc2MDQtMS11LmtsZWluZS1rb2Vu
aWdAcGVuZ3V0cm9uaXguZGUuCj4KPiBJIHRlc3RlZCBpdCB1c2luZyBhbGxtb2Rjb25maWcgb24g
YW1kNjQgYW5kIGFybSwgYnV0IEkgd291bGRuJ3QgYmUKPiBzdXJwcmlzZWQgaWYgSSBzdGlsbCBt
aXNzZWQgdG8gY29udmVydCBhIGRyaXZlci4gU28gaXQgd291bGQgYmUgZ3JlYXQgdG8KPiBnZXQg
dGhpcyBpbnRvIG5leHQgZWFybHkgYWZ0ZXIgdGhlIG1lcmdlIHdpbmRvdyBjbG9zZXMuCj4KPiBJ
IHNlbmQgdGhpcyBtYWlsIHRvIGFsbCBwZW9wbGUgdGhhdCBnZXRfbWFpbnRhaW5lci5wbCBlbWl0
cyBmb3IgdGhpcwo+IHBhdGNoLiBJIHdvbmRlciBob3cgbWFueSByZWNpcGVudHMgd2lsbCByZWZ1
c2UgdGhpcyBtYWlsIGJlY2F1c2Ugb2YgdGhlCj4gbG9uZyBDYzogbGlzdCA6LSkKPgo+IEJlc3Qg
cmVnYXJkcwo+IFV3ZQo+Cj4gIGFyY2gvYXJtL2NvbW1vbi9sb2NvbW8uYyAgICAgICAgICAgICAg
ICAgIHwgMyArLS0KPiAgYXJjaC9hcm0vY29tbW9uL3NhMTExMS5jICAgICAgICAgICAgICAgICAg
fCA0ICstLS0KPiAgYXJjaC9hcm0vbWFjaC1ycGMvZWNhcmQuYyAgICAgICAgICAgICAgICAgfCA0
ICstLS0KPiAgYXJjaC9taXBzL3NnaS1pcDIyL2lwMjItZ2lvLmMgICAgICAgICAgICAgfCAzICst
LQo+ICBhcmNoL3BhcmlzYy9rZXJuZWwvZHJpdmVycy5jICAgICAgICAgICAgICB8IDUgKystLS0K
PiAgYXJjaC9wb3dlcnBjL3BsYXRmb3Jtcy9wczMvc3lzdGVtLWJ1cy5jICAgfCAzICstLQo+ICBh
cmNoL3Bvd2VycGMvcGxhdGZvcm1zL3BzZXJpZXMvaWJtZWJ1cy5jICB8IDMgKy0tCj4gIGFyY2gv
cG93ZXJwYy9wbGF0Zm9ybXMvcHNlcmllcy92aW8uYyAgICAgIHwgMyArLS0KPiAgZHJpdmVycy9h
Y3BpL2J1cy5jICAgICAgICAgICAgICAgICAgICAgICAgfCAzICstLQo+ICBkcml2ZXJzL2FtYmEv
YnVzLmMgICAgICAgICAgICAgICAgICAgICAgICB8IDQgKy0tLQo+ICBkcml2ZXJzL2Jhc2UvYXV4
aWxpYXJ5LmMgICAgICAgICAgICAgICAgICB8IDQgKy0tLQo+ICBkcml2ZXJzL2Jhc2UvaXNhLmMg
ICAgICAgICAgICAgICAgICAgICAgICB8IDQgKy0tLQo+ICBkcml2ZXJzL2Jhc2UvcGxhdGZvcm0u
YyAgICAgICAgICAgICAgICAgICB8IDQgKy0tLQo+ICBkcml2ZXJzL2JjbWEvbWFpbi5jICAgICAg
ICAgICAgICAgICAgICAgICB8IDYgKystLS0tCj4gIGRyaXZlcnMvYnVzL3N1bnhpLXJzYi5jICAg
ICAgICAgICAgICAgICAgIHwgNCArLS0tCj4gIGRyaXZlcnMvY3hsL2NvcmUuYyAgICAgICAgICAg
ICAgICAgICAgICAgIHwgMyArLS0KPiAgZHJpdmVycy9kYXgvYnVzLmMgICAgICAgICAgICAgICAg
ICAgICAgICAgfCA0ICstLS0KPiAgZHJpdmVycy9kbWEvaWR4ZC9zeXNmcy5jICAgICAgICAgICAg
ICAgICAgfCA0ICstLS0KPiAgZHJpdmVycy9maXJld2lyZS9jb3JlLWRldmljZS5jICAgICAgICAg
ICAgfCA0ICstLS0KPiAgZHJpdmVycy9maXJtd2FyZS9hcm1fc2NtaS9idXMuYyAgICAgICAgICAg
fCA0ICstLS0KPiAgZHJpdmVycy9maXJtd2FyZS9nb29nbGUvY29yZWJvb3RfdGFibGUuYyAgfCA0
ICstLS0KPiAgZHJpdmVycy9mcGdhL2RmbC5jICAgICAgICAgICAgICAgICAgICAgICAgfCA0ICst
LS0KPiAgZHJpdmVycy9oaWQvaGlkLWNvcmUuYyAgICAgICAgICAgICAgICAgICAgfCA0ICstLS0K
PiAgZHJpdmVycy9oaWQvaW50ZWwtaXNoLWhpZC9pc2h0cC9idXMuYyAgICAgfCA0ICstLS0KPiAg
ZHJpdmVycy9odi92bWJ1c19kcnYuYyAgICAgICAgICAgICAgICAgICAgfCA1ICstLS0tCj4gIGRy
aXZlcnMvaHd0cmFjaW5nL2ludGVsX3RoL2NvcmUuYyAgICAgICAgIHwgNCArLS0tCj4gIGRyaXZl
cnMvaTJjL2kyYy1jb3JlLWJhc2UuYyAgICAgICAgICAgICAgIHwgNSArLS0tLQo+ICBkcml2ZXJz
L2kzYy9tYXN0ZXIuYyAgICAgICAgICAgICAgICAgICAgICB8IDQgKy0tLQo+ICBkcml2ZXJzL2lu
cHV0L2dhbWVwb3J0L2dhbWVwb3J0LmMgICAgICAgICB8IDMgKy0tCj4gIGRyaXZlcnMvaW5wdXQv
c2VyaW8vc2VyaW8uYyAgICAgICAgICAgICAgIHwgMyArLS0KPiAgZHJpdmVycy9pcGFjay9pcGFj
ay5jICAgICAgICAgICAgICAgICAgICAgfCA0ICstLS0KPiAgZHJpdmVycy9tYWNpbnRvc2gvbWFj
aW9fYXNpYy5jICAgICAgICAgICAgfCA0ICstLS0KPiAgZHJpdmVycy9tY2IvbWNiLWNvcmUuYyAg
ICAgICAgICAgICAgICAgICAgfCA0ICstLS0KPiAgZHJpdmVycy9tZWRpYS9wY2kvYnQ4eHgvYnR0
di1ncGlvLmMgICAgICAgfCAzICstLQo+ICBkcml2ZXJzL21lbXN0aWNrL2NvcmUvbWVtc3RpY2su
YyAgICAgICAgICB8IDMgKy0tCj4gIGRyaXZlcnMvbWZkL21jcC1jb3JlLmMgICAgICAgICAgICAg
ICAgICAgIHwgMyArLS0KPiAgZHJpdmVycy9taXNjL21laS9idXMuYyAgICAgICAgICAgICAgICAg
ICAgfCA0ICstLS0KPiAgZHJpdmVycy9taXNjL3RpZm1fY29yZS5jICAgICAgICAgICAgICAgICAg
fCAzICstLQo+ICBkcml2ZXJzL21tYy9jb3JlL2J1cy5jICAgICAgICAgICAgICAgICAgICB8IDQg
Ky0tLQo+ICBkcml2ZXJzL21tYy9jb3JlL3NkaW9fYnVzLmMgICAgICAgICAgICAgICB8IDQgKy0t
LQo+ICBkcml2ZXJzL25ldC9uZXRkZXZzaW0vYnVzLmMgICAgICAgICAgICAgICB8IDMgKy0tCj4g
IGRyaXZlcnMvbnRiL2NvcmUuYyAgICAgICAgICAgICAgICAgICAgICAgIHwgNCArLS0tCj4gIGRy
aXZlcnMvbnRiL250Yl90cmFuc3BvcnQuYyAgICAgICAgICAgICAgIHwgNCArLS0tCj4gIGRyaXZl
cnMvbnZkaW1tL2J1cy5jICAgICAgICAgICAgICAgICAgICAgIHwgMyArLS0KPiAgZHJpdmVycy9w
Y2kvZW5kcG9pbnQvcGNpLWVwZi1jb3JlLmMgICAgICAgfCA0ICstLS0KPiAgZHJpdmVycy9wY2kv
cGNpLWRyaXZlci5jICAgICAgICAgICAgICAgICAgfCAzICstLQo+ICBkcml2ZXJzL3BjbWNpYS9k
cy5jICAgICAgICAgICAgICAgICAgICAgICB8IDQgKy0tLQo+ICBkcml2ZXJzL3BsYXRmb3JtL3N1
cmZhY2UvYWdncmVnYXRvci9idXMuYyB8IDQgKy0tLQo+ICBkcml2ZXJzL3BsYXRmb3JtL3g4Ni93
bWkuYyAgICAgICAgICAgICAgICB8IDQgKy0tLQo+ICBkcml2ZXJzL3BucC9kcml2ZXIuYyAgICAg
ICAgICAgICAgICAgICAgICB8IDMgKy0tCj4gIGRyaXZlcnMvcmFwaWRpby9yaW8tZHJpdmVyLmMg
ICAgICAgICAgICAgIHwgNCArLS0tCj4gIGRyaXZlcnMvcnBtc2cvcnBtc2dfY29yZS5jICAgICAg
ICAgICAgICAgIHwgNCArLS0tCgpSZXZpZXdlZC1ieTogTWF0aGlldSBQb2lyaWVyIDxtYXRoaWV1
LnBvaXJpZXJAbGluYXJvLm9yZz4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZ3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0CmdyZXlidXMtZGV2QGxpc3RzLmxp
bmFyby5vcmcKaHR0cHM6Ly9saXN0cy5saW5hcm8ub3JnL21haWxtYW4vbGlzdGluZm8vZ3JleWJ1
cy1kZXYK
