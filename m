Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id DB50060610E
	for <lists+greybus-dev@lfdr.de>; Thu, 20 Oct 2022 15:09:36 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id F16293EDFB
	for <lists+greybus-dev@lfdr.de>; Thu, 20 Oct 2022 13:09:35 +0000 (UTC)
Received: from msg-1.mailo.com (msg-1.mailo.com [213.182.54.11])
	by lists.linaro.org (Postfix) with ESMTPS id E89BF3EC08
	for <greybus-dev@lists.linaro.org>; Wed, 19 Oct 2022 15:29:56 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=mailo.com header.s=mailo header.b="eVK/VWD3";
	spf=pass (lists.linaro.org: domain of drv@mailo.com designates 213.182.54.11 as permitted sender) smtp.mailfrom=drv@mailo.com;
	dmarc=pass (policy=none) header.from=mailo.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
	t=1666193377; bh=UiL1Iaru5FKLDfW2TZHa5bXJhCrCD//G7RrOecKut5I=;
	h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:In-Reply-To;
	b=eVK/VWD3QaPqu9Yi/knaOPGldppHJNKZq+7xtQuYprb7jaczWL3lpd0oEKO//miK5
	 nhR7S4DetL37Wq6u9wiyur8IPbLFSFw7RgMakjrMGytrF+l7Ia+ae7sc1fi8ncq2F4
	 3KfPokfrzs0G+KogAlMT6zBNb7Ec4oiPwWgtQt6g=
Received: by b-1.in.mailobj.net [192.168.90.11] with ESMTP
	via [213.182.55.206]
	Wed, 19 Oct 2022 17:29:37 +0200 (CEST)
X-EA-Auth: 4uPeXEa/J4DtPm7TM+egQMdxr22kESKAjQNFaV7UP99mI+kxoWn7oBgRZlc06D0p+tDi1BiLSB0f58DyqCB/VhohnfwyXCXC
Date: Wed, 19 Oct 2022 20:58:17 +0530
From: Deepak R Varma <drv@mailo.com>
To: Greg KH <gregkh@linuxfoundation.org>
Message-ID: <Y1AXkRJRtmnEom5T@debian-BULLSEYE-live-builder-AMD64>
References: <Y0wS4HQo9m/W/TrQ@debian-BULLSEYE-live-builder-AMD64>
 <alpine.DEB.2.22.394.2210161649400.2876@hadrien>
 <Y0wdDTUBrUT/cr9w@lion2204>
 <alpine.DEB.2.22.394.2210161709440.2876@hadrien>
 <Y0wi4itS3d8aExFc@debian-BULLSEYE-live-builder-AMD64>
 <Y0wmC2oi0TOpvpPM@kroah.com>
 <Y0woVSgGfUuvJUzY@debian-BULLSEYE-live-builder-AMD64>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y0woVSgGfUuvJUzY@debian-BULLSEYE-live-builder-AMD64>
X-Rspamd-Server: lists.linaro.org
X-Spamd-Bar: -----
X-Rspamd-Queue-Id: E89BF3EC08
X-Spamd-Result: default: False [-5.00 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	RCVD_DKIM_ARC_DNSWL_HI(-1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[mailo.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	RCVD_IN_DNSWL_HI(-0.50)[213.182.54.11:from];
	R_DKIM_ALLOW(-0.20)[mailo.com:s=mailo];
	R_SPF_ALLOW(-0.20)[+ip4:213.182.54.0/24];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:8304, ipnet:213.182.32.0/19, country:FR];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.897];
	RCPT_COUNT_SEVEN(0.00)[9];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[mailo.com:+]
X-MailFrom: drv@mailo.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: 7F5HOUFBRI4DVL3IINMFD2ND6QKEKS3A
X-Message-ID-Hash: 7F5HOUFBRI4DVL3IINMFD2ND6QKEKS3A
X-Mailman-Approved-At: Thu, 20 Oct 2022 13:09:25 +0000
CC: Julia Lawall <julia.lawall@inria.fr>, outreachy@lists.linux.dev, johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: loopback: enclose macro statements in do-while loop
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/7F5HOUFBRI4DVL3IINMFD2ND6QKEKS3A/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, Oct 16, 2022 at 11:50:45AM -0400, Deepak R Varma wrote:
> On Sun, Oct 16, 2022 at 05:40:59PM +0200, Greg KH wrote:
> > On Sun, Oct 16, 2022 at 11:27:30AM -0400, Deepak R Varma wrote:
> > > On Sun, Oct 16, 2022 at 05:10:17PM +0200, Julia Lawall wrote:
> > > >
> > > >
> > > > On Sun, 16 Oct 2022, Deepak R Varma wrote:
> > > >
> > > > > On Sun, Oct 16, 2022 at 04:51:09PM +0200, Julia Lawall wrote:
> > > > > >
> > > > > >
> > > > > > On Sun, 16 Oct 2022, Deepak R Varma wrote:
> > > > > >
> > > > > > > Include multiple statements of macro definition inside do-while{0} loop
> > > > > > > to avoid possible partial program execution. Issue reported by
> > > > > > > checkpatch script:
> > > > > > >
> > > > > > > ERROR: Macros with multiple statements should be enclosed in a do - while loop
> > > > > >
> > > > > > I don't think this change will compile.  See if you can figure out why
> > > > > > not.
> > > > >
> > > > > It did compile. I built the greybus driver and loaded it as well with the
> > > > > modinfo tool. Can you please tell why you think it won't compile?
> > > >
> > > > Do you have a .o file for the .c file that you changed?
> > >
> > > I see many .o files and a greybus.ko as well, but not the loopback.o
> > > Am I missing anything with my configuration? I did set Greybus Support to (M) in
> > > the menuconfig.
> >
> > CONFIG_GREYBUS_LOOPBACK has to be enabled in order to build the
> > drivers/staging/greybus/loopback.c file.
> >
> > A simple check would be to do:
> > 	make drivers/staging/greybus/loopback.o
> >
> > does that work with your change?
>
> No, it did not. I understand why it did not. My apologies for not looking into
> the build of loopback.o file when the greybus module was rebuilt.
>
> Please ignore my patch.

I just received a message from Kernel Test Robot that this patch failed to
compile. I had requested to drop/ignore this patch. However, looks like it
included in the staging-testing tree????

Let me know anything required from me to fix the bot complaint. Thank you.

>
> Thank you Julia and Greg for the feedback.
> ./drv
>
>
>
> >
> > thanks,
> >
> > greg k-h
> >
>
>
>


_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
