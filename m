Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B8F178D5F6
	for <lists+greybus-dev@lfdr.de>; Wed, 30 Aug 2023 14:49:06 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 871FF3EE31
	for <lists+greybus-dev@lfdr.de>; Wed, 30 Aug 2023 12:49:05 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	by lists.linaro.org (Postfix) with ESMTPS id A7AF43EFD0
	for <greybus-dev@lists.linaro.org>; Wed, 30 Aug 2023 12:48:58 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=rfkx9912;
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 139.178.84.217 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org;
	dmarc=pass (policy=none) header.from=linuxfoundation.org
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4C5386126B;
	Wed, 30 Aug 2023 12:48:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91A81C43395;
	Wed, 30 Aug 2023 12:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1693399738;
	bh=l1Mf9uTJdIUqMsq1/iCY6cqGZwaFGVBHyV2uv91uqd8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rfkx9912FY2mAe6I2xKA/YKvgzqO8ukPk1eZBN7LkSjhYk5TemkIhgnI8cwdm2cH1
	 zMIVa0FRVgURqGtIXm64TZdm0ZH4vWmV6zFsXgf0SNB4gWSnL7yne1CB+JVSWNN50b
	 TRCgKi1Mr3MaSytvHaFKjiam1yuyFuvFm8hz31qw=
Date: Wed, 30 Aug 2023 14:48:55 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Ayush Singh <ayushdevel1325@gmail.com>
Message-ID: <2023083044-drench-resigned-8cc4@gregkh>
References: <20230830122427.284415-1-ayushdevel1325@gmail.com>
 <20230830122427.284415-3-ayushdevel1325@gmail.com>
 <2023083005-trough-patchy-f60a@gregkh>
 <2069449a-506d-afe1-b259-dca34a85900c@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2069449a-506d-afe1-b259-dca34a85900c@gmail.com>
X-Rspamd-Queue-Id: A7AF43EFD0
X-Spamd-Bar: -------
X-Spamd-Result: default: False [-7.00 / 15.00];
	REPLY(-4.00)[];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	DWL_DNSWL_HI(-3.50)[linuxfoundation.org:dkim];
	BAYES_HAM(-3.00)[100.00%];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:139.178.84.217];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:54825, ipnet:139.178.80.0/21, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_TWO(0.00)[2];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: FOVLB525ZFW7N322A2GVYDF3RW5X4J4D
X-Message-ID-Hash: FOVLB525ZFW7N322A2GVYDF3RW5X4J4D
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: greybus-dev@lists.linaro.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 2/2] staging/greybus: Add BeaglePlay Linux Driver
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/FOVLB525ZFW7N322A2GVYDF3RW5X4J4D/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Aug 30, 2023 at 06:06:54PM +0530, Ayush Singh wrote:
> On 8/30/23 17:58, Greg KH wrote:
> 
> > On Wed, Aug 30, 2023 at 05:54:27PM +0530, Ayush Singh wrote:
> > > This is Serdev driver that communicates with Greybus SVC connected over
> > > UART. This driver has only been tested on BeaglePlay (with CC1352 in
> > > BeaglePlay serving as SVC).
> > > 
> > > This driver is responsible for the following:
> > > - Start SVC (CC1352) on driver load.
> > > - Send/Receive Greybus messages to/from CC1352 using HDLC over UART.
> > > - Print Logs from CC1352.
> > > - Stop SVC (CC1352) on driver load.
> > > 
> > > This patch does the following:
> > > - Add Driver
> > > - Add Kconfig option to enable the driver
> > > - Update Makefile to build the driver
> > > - Update MAINTAINERS
> > > 
> > > Signed-off-by: Ayush Singh <ayushdevel1325@gmail.com>
> > > ---
> > >   MAINTAINERS                             |   5 +
> > >   drivers/staging/greybus/Kconfig         |   9 +
> > >   drivers/staging/greybus/Makefile        |   3 +
> > >   drivers/staging/greybus/gb-beagleplay.c | 493 ++++++++++++++++++++++++
> > Why is this in drivers/staging/ and not in drivers/greybus/ ?
> 
> Well, there are a few reasons I can give:
> 
> 1. It has not been thoroughly tested. I have only tested it in my personal
> setup.
> 
> 2. Since mikrobus code has not been merged, running a normal beagleconnect
> freedom as the greybus node is not possible.

What is "mikrobus"?

> 3. I thought new and experimental drivers should go into staging?

staging is only for code that is not ready to be in the real portion of
the kernel and it comes with a list of what needs to be done to get it
out of staging.

For this, new driver, it should just go into the real portion of the
kernel as obviously you've tested it and it works :)

thanks,

greg k-h
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
