Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 66A5F8622BA
	for <lists+greybus-dev@lfdr.de>; Sat, 24 Feb 2024 06:27:48 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 287B63F0B9
	for <lists+greybus-dev@lfdr.de>; Sat, 24 Feb 2024 05:27:47 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	by lists.linaro.org (Postfix) with ESMTPS id 264FF3F0B9
	for <greybus-dev@lists.linaro.org>; Sat, 24 Feb 2024 05:27:41 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=n1q17bxb;
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 139.178.84.217 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org;
	dmarc=pass (policy=none) header.from=linuxfoundation.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B839A601C8;
	Sat, 24 Feb 2024 05:27:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0A6DC433F1;
	Sat, 24 Feb 2024 05:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1708752460;
	bh=X2Voa/lGxk4ES7nWY51+cmiznqb71ZDPT59P/2/VOWk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n1q17bxbv9DOyF8yrOzXlPxbjV/F25EohVgvSMjx/+HZYHbRScGXfP/nQvtLqp4wM
	 NcP62jBsbkWB+D1tukg1I/ynhx4iZv3wtNTM2TfHtutFCHNPhfzOmAcJ3cz4GRrqC3
	 /KNqyL1jJqJEwKiN+S/quzWCax1Hs0XZZw2Nhk0w=
Date: Sat, 24 Feb 2024 06:27:41 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Dileep Sankhla <dileepsankhla.ds@gmail.com>
Message-ID: <2024022427-abruptly-vastness-ed23@gregkh>
References: <CAHxc4buV_UieeVVBhua3vmT2+2e6qf2B9uoxpSPAg6faGBa=Ww@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHxc4buV_UieeVVBhua3vmT2+2e6qf2B9uoxpSPAg6faGBa=Ww@mail.gmail.com>
X-Rspamd-Queue-Id: 264FF3F0B9
X-Spamd-Bar: ++
X-Spamd-Result: default: False [2.00 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:139.178.84.217];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:54825, ipnet:139.178.80.0/21, country:US];
	FROM_EQ_ENVFROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+]
X-Rspamd-Action: no action
X-Spam-Level: **
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: N3F4CM4XFU4ULR7FRJPXS6OV5N5AA2SJ
X-Message-ID-Hash: N3F4CM4XFU4ULR7FRJPXS6OV5N5AA2SJ
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, johan@kernel.org, elder@kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: tree for the greybus subsystem
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/N3F4CM4XFU4ULR7FRJPXS6OV5N5AA2SJ/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Feb 23, 2024 at 11:44:48PM +0530, Dileep Sankhla wrote:
> Hello,
> 
> I am fixing a coding style problem in the loopback bridge driver for
> the Greybus loopback module. The source code file (please see [0]) is
> located in the staging tree for the linux-next.
> 
> In order to create the patch, I need to find the right development
> tree. I checked the MAINTAINERS file for the Greybus subsystem
> development tree but could not find one. I also searched [1] for
> "greybus", but without success.
> 
> What is the development tree for the greybus subsystem?

As the staging subsystem is how this code flows into the tree:

	$ ./scripts/get_maintainer.pl drivers/staging/greybus/loopback.c
	"Bryan O'Donoghue" <pure.logic@nexus-software.ie> (maintainer:GREYBUS LOOPBACK DRIVER)
	Johan Hovold <johan@kernel.org> (maintainer:GREYBUS SUBSYSTEM)
	Alex Elder <elder@kernel.org> (maintainer:GREYBUS SUBSYSTEM)
	Greg Kroah-Hartman <gregkh@linuxfoundation.org> (maintainer:GREYBUS SUBSYSTEM)
	greybus-dev@lists.linaro.org (moderated list:GREYBUS SUBSYSTEM)
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM)
	linux-kernel@vger.kernel.org (open list)

Then the staging.git tree as shown in MAINTAINERS is the correct one.

But you should always be able to just use linux-next as a default if you
can't figure out what tree to use.

thanks,

greg k-h
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
