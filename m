Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 600CD6000C7
	for <lists+greybus-dev@lfdr.de>; Sun, 16 Oct 2022 17:42:06 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 531E33EEBC
	for <lists+greybus-dev@lfdr.de>; Sun, 16 Oct 2022 15:42:05 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	by lists.linaro.org (Postfix) with ESMTPS id 530373EEBC
	for <greybus-dev@lists.linaro.org>; Sun, 16 Oct 2022 15:41:59 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=pW1hVPZR;
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 139.178.84.217 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org;
	dmarc=pass (policy=none) header.from=linuxfoundation.org
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D14AE60B82;
	Sun, 16 Oct 2022 15:41:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E66CEC433C1;
	Sun, 16 Oct 2022 15:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1665934918;
	bh=+4RVTTrbXN+/4vqERN49TufdDPKikKJhXlmgMKsWEa0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pW1hVPZRwRW6UK3mrJJuJqasNXV0IR0NECIEAanaRD2TVTXTPm4K2quhIRScFnvyD
	 nztnlhqv0E0AEoQY20/2wDgsc0alYVQfbSWdaLVRjeGK93AKQRT7mjHVOXRTLvQFT/
	 uEtiHeh+aeJmO5USr66hvm9ntpAVO3/LspBlDPCQ=
Date: Sun, 16 Oct 2022 17:40:59 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Deepak R Varma <drv@mailo.com>
Message-ID: <Y0wmC2oi0TOpvpPM@kroah.com>
References: <Y0wS4HQo9m/W/TrQ@debian-BULLSEYE-live-builder-AMD64>
 <alpine.DEB.2.22.394.2210161649400.2876@hadrien>
 <Y0wdDTUBrUT/cr9w@lion2204>
 <alpine.DEB.2.22.394.2210161709440.2876@hadrien>
 <Y0wi4itS3d8aExFc@debian-BULLSEYE-live-builder-AMD64>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y0wi4itS3d8aExFc@debian-BULLSEYE-live-builder-AMD64>
X-Rspamd-Server: lists.linaro.org
X-Spamd-Bar: ----
X-Rspamd-Queue-Id: 530373EEBC
X-Spamd-Result: default: False [-4.00 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip4:139.178.84.217];
	MIME_GOOD(-0.10)[text/plain];
	NEURAL_HAM(-0.00)[-1.000];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:54825, ipnet:139.178.80.0/21, country:US];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[]
Message-ID-Hash: SWJOGGS4EUIOSVG3KSCEY5RCCODZWJWC
X-Message-ID-Hash: SWJOGGS4EUIOSVG3KSCEY5RCCODZWJWC
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Julia Lawall <julia.lawall@inria.fr>, outreachy@lists.linux.dev, johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: loopback: enclose macro statements in do-while loop
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/SWJOGGS4EUIOSVG3KSCEY5RCCODZWJWC/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, Oct 16, 2022 at 11:27:30AM -0400, Deepak R Varma wrote:
> On Sun, Oct 16, 2022 at 05:10:17PM +0200, Julia Lawall wrote:
> >
> >
> > On Sun, 16 Oct 2022, Deepak R Varma wrote:
> >
> > > On Sun, Oct 16, 2022 at 04:51:09PM +0200, Julia Lawall wrote:
> > > >
> > > >
> > > > On Sun, 16 Oct 2022, Deepak R Varma wrote:
> > > >
> > > > > Include multiple statements of macro definition inside do-while{0} loop
> > > > > to avoid possible partial program execution. Issue reported by
> > > > > checkpatch script:
> > > > >
> > > > > ERROR: Macros with multiple statements should be enclosed in a do - while loop
> > > >
> > > > I don't think this change will compile.  See if you can figure out why
> > > > not.
> > >
> > > It did compile. I built the greybus driver and loaded it as well with the
> > > modinfo tool. Can you please tell why you think it won't compile?
> >
> > Do you have a .o file for the .c file that you changed?
> 
> I see many .o files and a greybus.ko as well, but not the loopback.o
> Am I missing anything with my configuration? I did set Greybus Support to (M) in
> the menuconfig.

CONFIG_GREYBUS_LOOPBACK has to be enabled in order to build the
drivers/staging/greybus/loopback.c file.

A simple check would be to do:
	make drivers/staging/greybus/loopback.o

does that work with your change?

thanks,

greg k-h
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
