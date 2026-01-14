Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 66537D1D79A
	for <lists+greybus-dev@lfdr.de>; Wed, 14 Jan 2026 10:21:25 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 7AC10401B1
	for <lists+greybus-dev@lfdr.de>; Wed, 14 Jan 2026 09:21:24 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by lists.linaro.org (Postfix) with ESMTPS id B2E5F40145
	for <greybus-dev@lists.linaro.org>; Wed, 14 Jan 2026 09:21:21 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=Wx4usfiJ;
	spf=pass (lists.linaro.org: domain of johan@kernel.org designates 172.234.252.31 as permitted sender) smtp.mailfrom=johan@kernel.org;
	dmarc=pass (policy=quarantine) header.from=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 106B440BFD;
	Wed, 14 Jan 2026 09:21:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1F19C4CEF7;
	Wed, 14 Jan 2026 09:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768382480;
	bh=RiZtDJYUAJTA+wEkD7Xo+CUG4dhyfOyMyYtjam37kf8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Wx4usfiJgHXmqwlwjvvqIGtiFVVymaFvzEPmlCtfdiZOp9vKtTZpj3JV7I81OiY17
	 /dIrH0IX9DXPiSIeuXzn/4TQUMgIFfZZ9W57xSLhmt73YsU4SlJ3esNQ84d8OwAPxo
	 LGB+wWyKIv+QfiT5S4JrxNyKGteMfK5z2IJTmhH8spNKk9z/mv7+n2a6v/lc4ExrZQ
	 JydmKkicBrdMRvDZl7KKrzQ49VOloGlupw6mjz7gozknTBt7dZ1eHOWuCoF5mw7/p/
	 oJrp0Dsq2q3nvy6CI4n10xJW5V4wspJGigqhbN0TqdXB0bXxe8J6ZSsERQ/ZbWTbpU
	 zfLNPp3em8MHw==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vfx3x-000000007gZ-1gzr;
	Wed, 14 Jan 2026 10:21:14 +0100
Date: Wed, 14 Jan 2026 10:21:13 +0100
From: Johan Hovold <johan@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <aWdgCblk91iJE4T2@hovoldconsulting.com>
References: <20251230062704.3339404-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251230062704.3339404-1-rdunlap@infradead.org>
X-Rspamd-Queue-Id: B2E5F40145
X-Spamd-Bar: ---
X-Spamd-Result: default: False [-4.00 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.252.31];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_SEVEN(0.00)[7];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	DWL_DNSWL_BLOCKED(0.00)[kernel.org:dkim];
	RCVD_COUNT_THREE(0.00)[3];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,kernel.org,linuxfoundation.org,lists.linaro.org,lists.linux.dev];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_EQ_ENVFROM(0.00)[];
	DNSWL_BLOCKED(0.00)[100.75.92.58:received,172.234.252.31:from];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: O7PRLASOZOJZFEUT4PGFLHHJLACY54HH
X-Message-ID-Hash: O7PRLASOZOJZFEUT4PGFLHHJLACY54HH
X-MailFrom: johan@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: linux-kernel@vger.kernel.org, Vaibhav Hiremath <hvaibhav.linux@gmail.com>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: arche: drop dangling Kconfig symbol
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/O7PRLASOZOJZFEUT4PGFLHHJLACY54HH/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Dec 29, 2025 at 10:27:04PM -0800, Randy Dunlap wrote:
> The Kconfig symbol USB_HSIC_USB3613 is not defined in the kernel source
> tree. Drop it since it unused.
>
> Fixes: 2eccd4aa19fc ("staging: greybus: enable compile testing of arche driver")

As the commit message of that commit says this was done on purpose to
allow the driver to be compile tested without the out-of-tree driver
that never went upstream.

These days we have a USB hub driver that should probably be used
instead, but yeah, someone would need to do the rework.

And while referencing the commit is good, I'm not sure a Fixes tag is
warranted.

> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
 
> --- linux-next-20251219.orig/drivers/staging/greybus/arche-platform.c
> +++ linux-next-20251219/drivers/staging/greybus/arche-platform.c
> @@ -23,14 +23,10 @@
>  #include <linux/of.h>
>  #include "arche_platform.h"
>  
> -#if IS_ENABLED(CONFIG_USB_HSIC_USB3613)
> -#include <linux/usb/usb3613.h>
> -#else
>  static inline int usb3613_hub_mode_ctrl(bool unused)
>  {
>  	return 0;
>  }
> -#endif
>  
>  #define WD_COLDBOOT_PULSE_WIDTH_MS	30
>  
> --- linux-next-20251219.orig/drivers/staging/greybus/Kconfig
> +++ linux-next-20251219/drivers/staging/greybus/Kconfig
> @@ -206,7 +206,6 @@ endif	# GREYBUS_BRIDGED_PHY
>  
>  config GREYBUS_ARCHE
>  	tristate "Greybus Arche Platform driver"
> -	depends on USB_HSIC_USB3613 || COMPILE_TEST
>  	help
>  	  Select this option if you have an Arche device.

The above just seems to hide the fact that the driver currently cannot
be used.

Can you please at least add some kind of TODO comment to indicate that
the driver should be reworked to drop the dependency on the OOT driver?

And it's probably best to keep the depends on COMPILE_TEST until that
has been resolved. Perhaps also wrap usb3613_hub_mode_ctrl() in

	#ifdef CONFIG_COMPILE_TEST
	...
	#endif

Johan
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
