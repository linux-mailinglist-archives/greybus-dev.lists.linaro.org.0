Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id AD5083BF68C
	for <lists+greybus-dev@lfdr.de>; Thu,  8 Jul 2021 09:56:56 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id C4A696698F
	for <lists+greybus-dev@lfdr.de>; Thu,  8 Jul 2021 07:56:55 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id BE9496697B; Thu,  8 Jul 2021 07:56:24 +0000 (UTC)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 96C1A669A6;
	Thu,  8 Jul 2021 07:56:20 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 02464603AB
 for <greybus-dev@lists.linaro.org>; Tue,  6 Jul 2021 11:42:18 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id EA55260B5A; Tue,  6 Jul 2021 11:42:18 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by lists.linaro.org (Postfix) with ESMTPS id A597C603AB
 for <greybus-dev@lists.linaro.org>; Tue,  6 Jul 2021 11:42:16 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10036"; a="189476196"
X-IronPort-AV: E=Sophos;i="5.83,328,1616482800"; d="scan'208";a="189476196"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2021 04:42:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,328,1616482800"; d="scan'208";a="562991774"
Received: from kuha.fi.intel.com ([10.237.72.162])
 by fmsmga001.fm.intel.com with SMTP; 06 Jul 2021 04:41:40 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation);
 Tue, 06 Jul 2021 14:41:39 +0300
Date: Tue, 6 Jul 2021 14:41:39 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Message-ID: <YORBc384OjIBC/Yj@kuha.fi.intel.com>
References: <20210706095037.1425211-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210706095037.1425211-1-u.kleine-koenig@pengutronix.de>
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
Cc: Alison Schofield <alison.schofield@intel.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Samuel Iglesias Gonsalvez <siglesias@igalia.com>,
 Jens Taprogge <jens.taprogge@taprogge.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 Paul Mackerras <paulus@samba.org>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>, Ira Weiny <ira.weiny@intel.com>,
 "Dubov <oakad"@ya, Wei Liu <wei.liu@kernel.org>,
 Dave Jiang <dave.jiang@intel.com>, Maxim Levitsky <maximlevitsky@gmail.com>,
 Johannes Thumshirn <morbidrsa@gmail.com>,
 Vishal Verma <vishal.l.verma@intel.com>, Helge Deller <deller@gmx.de>,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Dexuan Cui <decui@microsoft.com>, Russell King <linux@armlinux.org.uk>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Tom Rix <trix@redhat.com>, Len Brown <lenb@kernel.org>,
 Jiri Kosina <jikos@kernel.org>, Haiyang Zhang <haiyangz@microsoft.com>,
 Sudeep Holla <sudeep.holla@arm.com>,
 William Breathitt Gray <vilhelm.gray@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, Alex@lists.linaro.org,
 Ben Widawsky <ben.widawsky@intel.com>, Moritz Fischer <mdf@kernel.org>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Cristian Marussi <cristian.marussi@arm.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Geoff Levand <geoff@infradead.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-kernel@vger.kernel.org,
 Wolfram Sang <wsa@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Stefan Richter <stefanr@s5r6.in-berlin.de>, kernel@pengutronix.de,
 Michael Ellerman <mpe@ellerman.id.au>, Wu Hao <hao.wu@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: greybus-dev-bounces@lists.linaro.org
Sender: "greybus-dev" <greybus-dev-bounces@lists.linaro.org>
X-Virus-Scanned: ClamAV using ClamSMTP

On Tue, Jul 06, 2021 at 11:50:37AM +0200, Uwe Kleine-K=F6nig wrote:
> The driver core ignores the return value of this callback because there
> is only little it can do when a device disappears.
> =

> This is the final bit of a long lasting cleanup quest where several
> buses were converted to also return void from their remove callback.
> Additionally some resource leaks were fixed that were caused by drivers
> returning an error code in the expectation that the driver won't go
> away.
> =

> With struct bus_type::remove returning void it's prevented that newly
> implemented buses return an ignored error code and so don't anticipate
> wrong expectations for driver authors.
> =

> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

For ulpi and typec:

Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

thanks,

-- =

heikki
_______________________________________________
greybus-dev mailing list
greybus-dev@lists.linaro.org
https://lists.linaro.org/mailman/listinfo/greybus-dev
