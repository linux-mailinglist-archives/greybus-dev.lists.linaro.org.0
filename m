Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id B885C6064D3
	for <lists+greybus-dev@lfdr.de>; Thu, 20 Oct 2022 17:40:59 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id A832B3F4D7
	for <lists+greybus-dev@lfdr.de>; Thu, 20 Oct 2022 15:40:58 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	by lists.linaro.org (Postfix) with ESMTPS id 181613EBF7
	for <greybus-dev@lists.linaro.org>; Thu, 20 Oct 2022 15:40:53 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=skva0VPy;
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 139.178.84.217 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org;
	dmarc=pass (policy=none) header.from=linuxfoundation.org
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8AAD161C21;
	Thu, 20 Oct 2022 15:40:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A0FEC433D6;
	Thu, 20 Oct 2022 15:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1666280452;
	bh=8LfYTvcOE361XSrCDq1dHKnQsaqFwcRl7ob/DFKlE2w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=skva0VPyG+mOfz8PBtYZK6FNMd7dA5GMQZti7ltVhJe8gM0bYm9NIqmNAgLzyVeoO
	 TafGRASsEJxAtET3R4jugMq6Y1opguelmhCSyaE+VvU6monIK/I6JYVyMdsE7Z7rbf
	 gSPhwH5QZud68pCXY5zh6ZXghxz74FceXbDhmgK8=
Date: Thu, 20 Oct 2022 17:40:49 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Deepak R Varma <drv@mailo.com>
Message-ID: <Y1FsAZQqFdX12lgb@kroah.com>
References: <Y0wS4HQo9m/W/TrQ@debian-BULLSEYE-live-builder-AMD64>
 <alpine.DEB.2.22.394.2210161649400.2876@hadrien>
 <Y0wdDTUBrUT/cr9w@lion2204>
 <alpine.DEB.2.22.394.2210161709440.2876@hadrien>
 <Y0wi4itS3d8aExFc@debian-BULLSEYE-live-builder-AMD64>
 <Y0wmC2oi0TOpvpPM@kroah.com>
 <Y0woVSgGfUuvJUzY@debian-BULLSEYE-live-builder-AMD64>
 <Y1AXkRJRtmnEom5T@debian-BULLSEYE-live-builder-AMD64>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y1AXkRJRtmnEom5T@debian-BULLSEYE-live-builder-AMD64>
X-Rspamd-Server: lists.linaro.org
X-Spamd-Bar: -------------
X-Rspamd-Queue-Id: 181613EBF7
X-Spamd-Result: default: False [-13.50 / 15.00];
	REPLY(-4.00)[];
	DWL_DNSWL_HI(-3.50)[linuxfoundation.org:dkim];
	BAYES_HAM(-3.00)[100.00%];
	RCVD_IN_DNSWL_HI(-1.00)[52.25.139.140:received,139.178.84.217:from];
	RCVD_DKIM_ARC_DNSWL_HI(-1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:139.178.84.217];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MIME_GOOD(-0.10)[text/plain];
	ASN(0.00)[asn:54825, ipnet:139.178.80.0/21, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_THREE(0.00)[3];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[]
Message-ID-Hash: I7XTHX5VXOT2CMVTGBSKP6WNDD7QBBLA
X-Message-ID-Hash: I7XTHX5VXOT2CMVTGBSKP6WNDD7QBBLA
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Julia Lawall <julia.lawall@inria.fr>, outreachy@lists.linux.dev, johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: loopback: enclose macro statements in do-while loop
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/I7XTHX5VXOT2CMVTGBSKP6WNDD7QBBLA/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Oct 19, 2022 at 08:58:17PM +0530, Deepak R Varma wrote:
> On Sun, Oct 16, 2022 at 11:50:45AM -0400, Deepak R Varma wrote:
> > On Sun, Oct 16, 2022 at 05:40:59PM +0200, Greg KH wrote:
> > > On Sun, Oct 16, 2022 at 11:27:30AM -0400, Deepak R Varma wrote:
> > > > On Sun, Oct 16, 2022 at 05:10:17PM +0200, Julia Lawall wrote:
> > > > >
> > > > >
> > > > > On Sun, 16 Oct 2022, Deepak R Varma wrote:
> > > > >
> > > > > > On Sun, Oct 16, 2022 at 04:51:09PM +0200, Julia Lawall wrote:
> > > > > > >
> > > > > > >
> > > > > > > On Sun, 16 Oct 2022, Deepak R Varma wrote:
> > > > > > >
> > > > > > > > Include multiple statements of macro definition inside do-while{0} loop
> > > > > > > > to avoid possible partial program execution. Issue reported by
> > > > > > > > checkpatch script:
> > > > > > > >
> > > > > > > > ERROR: Macros with multiple statements should be enclosed in a do - while loop
> > > > > > >
> > > > > > > I don't think this change will compile.  See if you can figure out why
> > > > > > > not.
> > > > > >
> > > > > > It did compile. I built the greybus driver and loaded it as well with the
> > > > > > modinfo tool. Can you please tell why you think it won't compile?
> > > > >
> > > > > Do you have a .o file for the .c file that you changed?
> > > >
> > > > I see many .o files and a greybus.ko as well, but not the loopback.o
> > > > Am I missing anything with my configuration? I did set Greybus Support to (M) in
> > > > the menuconfig.
> > >
> > > CONFIG_GREYBUS_LOOPBACK has to be enabled in order to build the
> > > drivers/staging/greybus/loopback.c file.
> > >
> > > A simple check would be to do:
> > > 	make drivers/staging/greybus/loopback.o
> > >
> > > does that work with your change?
> >
> > No, it did not. I understand why it did not. My apologies for not looking into
> > the build of loopback.o file when the greybus module was rebuilt.
> >
> > Please ignore my patch.
> 
> I just received a message from Kernel Test Robot that this patch failed to
> compile. I had requested to drop/ignore this patch. However, looks like it
> included in the staging-testing tree????

It just took a while to get to your patch, it picked it up off of the
mailing list, the change is not applied anywhere.

> Let me know anything required from me to fix the bot complaint. Thank you.

There's nothing to do as it's long-gone from my queue.

thanks,

greg k-h
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
