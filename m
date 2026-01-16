Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB6FD2FD2B
	for <lists+greybus-dev@lfdr.de>; Fri, 16 Jan 2026 11:48:22 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 8D6EA401B2
	for <lists+greybus-dev@lfdr.de>; Fri, 16 Jan 2026 10:48:21 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by lists.linaro.org (Postfix) with ESMTPS id 2E1503F7FD
	for <greybus-dev@lists.linaro.org>; Fri, 16 Jan 2026 10:48:19 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=D8BO3iI3;
	spf=pass (lists.linaro.org: domain of johan@kernel.org designates 172.105.4.254 as permitted sender) smtp.mailfrom=johan@kernel.org;
	dmarc=pass (policy=quarantine) header.from=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 767F060167;
	Fri, 16 Jan 2026 10:48:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25D01C19421;
	Fri, 16 Jan 2026 10:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768560498;
	bh=iCJ6EbP46EjJMBrDIjaB7dUG2DlJCwr/o18twaR+bwU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D8BO3iI3REI0cRSwbIDBlrZKN6g/X7qSWwnQvasUw4nFuGbsy7vwwgX6XFZNx6EQH
	 CICsQPzQcttohPQK9iGBC/IIL3u/FmjSrE3/ORieqnVkOsQiqSoyVRBkaglgIXGFVt
	 gzkybH7VoyT4PYlpt4TzYDsnNDMlXeE7HVIM2in/lXdJlF1lwinVhayq7FSpjZlS1O
	 IdMOzvksIlqjulc8tsMkiIAli53UbFtoVph3YKEMSi+xuqe94vbibIDAKGrBpb88kc
	 dQXhDLVj1wPBzXNOUi6hSMoLy89U/jutJ/FlzoKLZKWQ92qOOPii/153rQNaOK7wHX
	 gJ0pxJJS5T0Xw==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vghNF-000000006XR-3elc;
	Fri, 16 Jan 2026 11:48:14 +0100
Date: Fri, 16 Jan 2026 11:48:13 +0100
From: Johan Hovold <johan@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <aWoXbQYqVeahIxc8@hovoldconsulting.com>
References: <20251230062704.3339404-1-rdunlap@infradead.org>
 <aWdgCblk91iJE4T2@hovoldconsulting.com>
 <f51a80c9-bc87-442e-b2e5-0e688a4cedd1@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f51a80c9-bc87-442e-b2e5-0e688a4cedd1@infradead.org>
X-Rspamd-Queue-Id: 2E1503F7FD
X-Spamd-Bar: ---
X-Spamd-Result: default: False [-4.00 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.4.254];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.0.0/19, country:SG];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_THREE(0.00)[3];
	DWL_DNSWL_NONE(0.00)[kernel.org:dkim];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,kernel.org,linuxfoundation.org,lists.linaro.org,lists.linux.dev];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_EQ_ENVFROM(0.00)[];
	DNSWL_BLOCKED(0.00)[100.75.92.58:received];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: 3OUMR6KPKL7D446JWGQU7RA4BNZLJ3JZ
X-Message-ID-Hash: 3OUMR6KPKL7D446JWGQU7RA4BNZLJ3JZ
X-MailFrom: johan@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: linux-kernel@vger.kernel.org, Vaibhav Hiremath <hvaibhav.linux@gmail.com>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: arche: drop dangling Kconfig symbol
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/3OUMR6KPKL7D446JWGQU7RA4BNZLJ3JZ/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Jan 14, 2026 at 04:28:33PM -0800, Randy Dunlap wrote:
> On 1/14/26 1:21 AM, Johan Hovold wrote:
> > On Mon, Dec 29, 2025 at 10:27:04PM -0800, Randy Dunlap wrote:
> >> The Kconfig symbol USB_HSIC_USB3613 is not defined in the kernel source
> >> tree. Drop it since it unused.
> >>
> >> Fixes: 2eccd4aa19fc ("staging: greybus: enable compile testing of arche driver")
> > 
> > As the commit message of that commit says this was done on purpose to
> > allow the driver to be compile tested without the out-of-tree driver
> > that never went upstream.
> > 
> > These days we have a USB hub driver that should probably be used
> > instead, but yeah, someone would need to do the rework.
> 
> We?
> Do you mean drivers/usb/core/hub.c?

I meant the on-board hub driver (now renamed to "on-board dev") which
did not exist when this greybus driver was written and merged to
staging:

	drivers/usb/misc/onboard_usb_dev_pdevs.c

> >> -#if IS_ENABLED(CONFIG_USB_HSIC_USB3613)
> >> -#include <linux/usb/usb3613.h>
> >> -#else
> >>  static inline int usb3613_hub_mode_ctrl(bool unused)
> >>  {
> >>  	return 0;
> >>  }
> >> -#endif
> >>  
> >>  #define WD_COLDBOOT_PULSE_WIDTH_MS	30
> >>  
> >> --- linux-next-20251219.orig/drivers/staging/greybus/Kconfig
> >> +++ linux-next-20251219/drivers/staging/greybus/Kconfig
> >> @@ -206,7 +206,6 @@ endif	# GREYBUS_BRIDGED_PHY
> >>  
> >>  config GREYBUS_ARCHE
> >>  	tristate "Greybus Arche Platform driver"
> >> -	depends on USB_HSIC_USB3613 || COMPILE_TEST
> >>  	help
> >>  	  Select this option if you have an Arche device.
> > 
> > The above just seems to hide the fact that the driver currently cannot
> > be used.
> > 
> > Can you please at least add some kind of TODO comment to indicate that
> > the driver should be reworked to drop the dependency on the OOT driver?
> 
> Sure, I can add that, but I think it needs more info. Reworked how?
> What should the usb3613_hub_mode_ctrl() function do?

IIRC, this driver exists since we needed to power on the on-board USB
hub so that the controller could be enumerated. Since there was no
support for doing such things at the time in mainline, we have this
custom interface for calling into the out-of-tree hub driver.

I'd need to spend more time looking at this to say exactly how this
should be reworked.

> > And it's probably best to keep the depends on COMPILE_TEST until that
> 
> ack
> 
> > has been resolved. Perhaps also wrap usb3613_hub_mode_ctrl() in
> > 
> > 	#ifdef CONFIG_COMPILE_TEST
> > 	...
> > 	#endif
> 
> Don't think so. The driver calls usb3613_hub_mod_ctrl() in 4 places,
> so it needs to be there.

Not if the driver can only be enabled for compile testing.

Perhaps replacing USB_HSIC_USB3613 with

	depends on BROKEN || COMPILE_TEST

and adding a comment above the ifdeffed usb3613_hub_mode_ctrl() helper
would make the state of things more clear.

Or just keep the dependency on the non-existing hub driver symbol. 

Johan
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
