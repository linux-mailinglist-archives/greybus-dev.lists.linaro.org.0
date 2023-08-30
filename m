Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 2364278D5E2
	for <lists+greybus-dev@lfdr.de>; Wed, 30 Aug 2023 14:30:02 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 247CB3EFC7
	for <lists+greybus-dev@lfdr.de>; Wed, 30 Aug 2023 12:30:01 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	by lists.linaro.org (Postfix) with ESMTPS id 397C13ED19
	for <greybus-dev@lists.linaro.org>; Wed, 30 Aug 2023 12:29:54 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=DQs3yVzZ;
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 139.178.84.217 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org;
	dmarc=pass (policy=none) header.from=linuxfoundation.org
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D4EEF61FB6;
	Wed, 30 Aug 2023 12:29:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6890C433C7;
	Wed, 30 Aug 2023 12:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1693398593;
	bh=lww/lAvSVd/cX9JGqfklrGxfzhLs62082CnxQDVeoMI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DQs3yVzZjjen+3rCSxMC3oJJDTGOK4plNgI1EQNBBfZy4nwLsj1moMnlbNfQfujWr
	 wYQ/amgwWd9hnuIMmpCJmfIg1u9HL70sfm1e0Ri1q1/b0+VwwmUDdS5em1U7Vuezwa
	 56b10BIe6rHQVX4WumKFRPqnWpx2QOxhLWh8smPo=
Date: Wed, 30 Aug 2023 14:29:50 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Ayush Singh <ayushdevel1325@gmail.com>
Message-ID: <2023083028-portfolio-repayment-8be8@gregkh>
References: <20230830122427.284415-1-ayushdevel1325@gmail.com>
 <20230830122427.284415-3-ayushdevel1325@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230830122427.284415-3-ayushdevel1325@gmail.com>
X-Rspamd-Queue-Id: 397C13ED19
X-Spamd-Bar: --------
X-Spamd-Result: default: False [-9.00 / 15.00];
	REPLY(-4.00)[];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	DWL_DNSWL_HI(-3.50)[linuxfoundation.org:dkim];
	BAYES_HAM(-3.00)[99.99%];
	RCVD_IN_DNSWL_HI(-1.00)[52.25.139.140:received,139.178.84.217:from];
	RCVD_DKIM_ARC_DNSWL_HI(-1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:139.178.84.217];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[lists.linaro.org,gmail.com,kernel.org];
	RCVD_TLS_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	ASN(0.00)[asn:54825, ipnet:139.178.80.0/21, country:US];
	RCPT_COUNT_FIVE(0.00)[5]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: NANH42TKD2PXBB5NR653XPTUGGYBQKGX
X-Message-ID-Hash: NANH42TKD2PXBB5NR653XPTUGGYBQKGX
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: greybus-dev@lists.linaro.org, hvaibhav.linux@gmail.com, elder@kernel.org, johan@kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 2/2] staging/greybus: Add BeaglePlay Linux Driver
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/NANH42TKD2PXBB5NR653XPTUGGYBQKGX/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Aug 30, 2023 at 05:54:27PM +0530, Ayush Singh wrote:
> This is Serdev driver that communicates with Greybus SVC connected over
> UART. This driver has only been tested on BeaglePlay (with CC1352 in
> BeaglePlay serving as SVC).
> 
> This driver is responsible for the following:
> - Start SVC (CC1352) on driver load.
> - Send/Receive Greybus messages to/from CC1352 using HDLC over UART.
> - Print Logs from CC1352.
> - Stop SVC (CC1352) on driver load.
> 
> This patch does the following:
> - Add Driver
> - Add Kconfig option to enable the driver
> - Update Makefile to build the driver
> - Update MAINTAINERS

Always run scripts/checkpatch.pl so that a maintainer doesn't have to
ask you why you didn't run scripts/checkpatch.pl on your patch :)

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
