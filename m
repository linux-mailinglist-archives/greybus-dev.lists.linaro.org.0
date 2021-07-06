Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id B92CF3BF690
	for <lists+greybus-dev@lfdr.de>; Thu,  8 Jul 2021 09:57:00 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 9452266957
	for <lists+greybus-dev@lfdr.de>; Thu,  8 Jul 2021 07:56:59 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 80AA866950; Thu,  8 Jul 2021 07:56:17 +0000 (UTC)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 8526166977;
	Thu,  8 Jul 2021 07:56:14 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id BBE1960BC6
 for <greybus-dev@lists.linaro.org>; Tue,  6 Jul 2021 10:57:01 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id AEA546328E; Tue,  6 Jul 2021 10:57:01 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by lists.linaro.org (Postfix) with ESMTPS id A675060BC6
 for <greybus-dev@lists.linaro.org>; Tue,  6 Jul 2021 10:56:59 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id i94so25575097wri.4
 for <greybus-dev@lists.linaro.org>; Tue, 06 Jul 2021 03:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=l+H215FJz8pJPI4hh9v/iWNuVbn0nifA4Jaafd28qC4=;
 b=UCSZee8bkwQhVbXkWa9n6dda1YB5cGQkIPiVKhb8KKz80S/zIXHEgxifSSr+8L29bp
 bwv7fkXzMNhKGGQN2c3BmsUcjrj/WCoXm6Ben2qP8+Bg0YH95vQBsFhGIbEyGr/lrU1Q
 Ln5txN4w7J+T5EMRaT/NpEGp+Hm9dI3o+V77bGk/sdRf0SYC4Lr7n5Wxc/3RjcZaFj49
 pMNis8YQVecjuUzjIFQPnwBJPdiGSBK5ZHDxUgMGNPSzs1az976bZyXyvd6ztydUQ9Xm
 nwGGg1WV1KPpW+turyU66Gq6SgHBmHxg/+HCmUj/1/PNr7tZsqoiZrxGaduOWyUClunz
 BuDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=l+H215FJz8pJPI4hh9v/iWNuVbn0nifA4Jaafd28qC4=;
 b=YGJgmSCy00SvCaoF/rL0xS6nubkbatCnLoRhzjNOam/PmzEW/1ctal0qZYxLzhcgnS
 UgpV0bQ1RA1m+ZrARYnNjVRC0y4LmraXK9DKw+S3grN5UiyNEDxXvXLtZbkdT+rtOTPm
 CDzfw/H5fmFwkc6LPoHfvVFoLin55TbLm+iTA0aiDuRgd04CSGRsVJ30M4Gs25iL/Voj
 XDMHDe1qq282GXdhaISfPPhPjxtDeXP2xvvPQ2Q+k94COR8olN2P8evOHPjKDhWw8Sd4
 aeWwNFYIr9CYVaPd2JUArv1NEz7jOJSD14vM5ykg5IqB6hgf6vGFqWxYcv7J5BgP3144
 xKbA==
X-Gm-Message-State: AOAM532EwcjCOSJddHojkeQD4XmYNse9fBfkVPJL4mrv1J+OTfqkEXJe
 CrPULrqeqsJnpV1wgNKUUbkZKyzp
X-Google-Smtp-Source: ABdhPJwMhrNwpvhovE9XwK0jC9OIuq8TBsnt9DrnKno6fhX9rnIZO8Cd1er4LBIyS1GM0G/5i1HmFw==
X-Received: by 2002:a5d:4711:: with SMTP id y17mr21172584wrq.355.1625569018612; 
 Tue, 06 Jul 2021 03:56:58 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id o3sm16468134wrw.56.2021.07.06.03.56.55
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 06 Jul 2021 03:56:57 -0700 (PDT)
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20210706095037.1425211-1-u.kleine-koenig@pengutronix.de>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <bd408732-a23d-d3e6-3786-ea9fbf114d50@linaro.org>
Date: Tue, 6 Jul 2021 11:56:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20210706095037.1425211-1-u.kleine-koenig@pengutronix.de>
Content-Language: en-US
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
Cc: =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kw@linux.com>,
 Alison Schofield <alison.schofield@intel.com>, linux-staging@lists.linux.dev,
 target-devel@vger.kernel.org, kvm@vger.kernel.org,
 Mark Gross <mgross@linux.intel.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Samuel Iglesias Gonsalvez <siglesias@igalia.com>,
 Matt Porter <mporter@kernel.crashing.org>,
 Jens Taprogge <jens.taprogge@taprogge.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 virtualization@lists.linux-foundation.org,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 Paul Mackerras <paulus@samba.org>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>, Ira Weiny <ira.weiny@intel.com>,
 linux-usb@vger.kernel.org, Wei Liu <wei.liu@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Dave Jiang <dave.jiang@intel.com>, Maxim Levitsky <maximlevitsky@gmail.com>,
 Johannes Thumshirn <morbidrsa@gmail.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Helge Deller <deller@gmx.de>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Dexuan Cui <decui@microsoft.com>, Russell King <linux@armlinux.org.uk>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Kishon Vijay Abraham I <kishon@ti.com>, Chen-Yu Tsai <wens@csie.org>,
 linux-serial@vger.kernel.org, Tom Rix <trix@redhat.com>,
 Jakub Kicinski <kuba@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Jon Mason <jdmason@kudzu.us>, Len Brown <lenb@kernel.org>,
 Allen Hubbe <allenbh@gmail.com>, Jiri Kosina <jikos@kernel.org>,
 Alex Dubov <oakad@yahoo.com>, Lee Jones <lee.jones@linaro.org>,
 linux-arm-msm@vger.kernel.org, Haiyang Zhang <haiyangz@microsoft.com>,
 Sudeep Holla <sudeep.holla@arm.com>,
 William Breathitt Gray <vilhelm.gray@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
 Ben Widawsky <ben.widawsky@intel.com>, Moritz Fischer <mdf@kernel.org>,
 xen-devel@lists.xenproject.org, Bjorn Helgaas <bhelgaas@google.com>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Tomas Winkler <tomas.winkler@intel.com>,
 Cristian Marussi <cristian.marussi@arm.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, greybus-dev@lists.linaro.org,
 Geoff Levand <geoff@infradead.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, Wolfram Sang <wsa@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Stefan Richter <stefanr@s5r6.in-berlin.de>,
 Arnd Bergmann <arnd@arndb.de>, kernel@pengutronix.de,
 Vishal Verma <vishal.l.verma@intel.com>, Wu Hao <hao.wu@intel.com>,
 Maximilian Luz <luzmaximilian@gmail.com>,
 "David S. Miller" <davem@davemloft.net>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: greybus-dev-bounces@lists.linaro.org
Sender: "greybus-dev" <greybus-dev-bounces@lists.linaro.org>
X-Virus-Scanned: ClamAV using ClamSMTP

CgpPbiAwNi8wNy8yMDIxIDEwOjUwLCBVd2UgS2xlaW5lLUvDtm5pZyB3cm90ZToKPiBUaGUgZHJp
dmVyIGNvcmUgaWdub3JlcyB0aGUgcmV0dXJuIHZhbHVlIG9mIHRoaXMgY2FsbGJhY2sgYmVjYXVz
ZSB0aGVyZQo+IGlzIG9ubHkgbGl0dGxlIGl0IGNhbiBkbyB3aGVuIGEgZGV2aWNlIGRpc2FwcGVh
cnMuCj4gCj4gVGhpcyBpcyB0aGUgZmluYWwgYml0IG9mIGEgbG9uZyBsYXN0aW5nIGNsZWFudXAg
cXVlc3Qgd2hlcmUgc2V2ZXJhbAo+IGJ1c2VzIHdlcmUgY29udmVydGVkIHRvIGFsc28gcmV0dXJu
IHZvaWQgZnJvbSB0aGVpciByZW1vdmUgY2FsbGJhY2suCj4gQWRkaXRpb25hbGx5IHNvbWUgcmVz
b3VyY2UgbGVha3Mgd2VyZSBmaXhlZCB0aGF0IHdlcmUgY2F1c2VkIGJ5IGRyaXZlcnMKPiByZXR1
cm5pbmcgYW4gZXJyb3IgY29kZSBpbiB0aGUgZXhwZWN0YXRpb24gdGhhdCB0aGUgZHJpdmVyIHdv
bid0IGdvCj4gYXdheS4KPiAKPiBXaXRoIHN0cnVjdCBidXNfdHlwZTo6cmVtb3ZlIHJldHVybmlu
ZyB2b2lkIGl0J3MgcHJldmVudGVkIHRoYXQgbmV3bHkKPiBpbXBsZW1lbnRlZCBidXNlcyByZXR1
cm4gYW4gaWdub3JlZCBlcnJvciBjb2RlIGFuZCBzbyBkb24ndCBhbnRpY2lwYXRlCj4gd3Jvbmcg
ZXhwZWN0YXRpb25zIGZvciBkcml2ZXIgYXV0aG9ycy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBVd2Ug
S2xlaW5lLUvDtm5pZzx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+Cj4gLS0tCi4uLgoK
PiAgIGRyaXZlcnMvc2xpbWJ1cy9jb3JlLmMgICAgICAgICAgICAgICAgICAgIHwgNCArLS0tCgpm
b3Igc2xpbWJ1cyBjaGFuZ2VzOgoKQWNrZWQtYnk6IFNyaW5pdmFzIEthbmRhZ2F0bGEgPHNyaW5p
dmFzLmthbmRhZ2F0bGFAbGluYXJvLm9yZz4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmdyZXlidXMtZGV2IG1haWxpbmcgbGlzdApncmV5YnVzLWRldkBs
aXN0cy5saW5hcm8ub3JnCmh0dHBzOi8vbGlzdHMubGluYXJvLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2dyZXlidXMtZGV2Cg==
