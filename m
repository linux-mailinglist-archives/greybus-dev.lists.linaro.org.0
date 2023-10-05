Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 834377B9C10
	for <lists+greybus-dev@lfdr.de>; Thu,  5 Oct 2023 11:08:45 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 7D2B040C7F
	for <lists+greybus-dev@lfdr.de>; Thu,  5 Oct 2023 09:08:44 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	by lists.linaro.org (Postfix) with ESMTPS id 39E2D3EAB1
	for <greybus-dev@lists.linaro.org>; Thu,  5 Oct 2023 09:08:36 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=Hl0nRPjT;
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 139.178.84.217 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org;
	dmarc=pass (policy=none) header.from=linuxfoundation.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B4AA561459;
	Thu,  5 Oct 2023 09:08:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDC6DC4160E;
	Thu,  5 Oct 2023 09:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1696496915;
	bh=DKlHct01eZZdgFFxoFSnHEvWjamH4HVMNYorMvqVhcM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Hl0nRPjTCgvdFsoN+K40ZjBXi7s0IGP49FjOYJUblKJzn2o2mixa+kCOtZsGQUnmh
	 9LCPyBFwDazPYxVpByMCpGSndjCRgc2eks0Ssi/G/hL+/pETpx3iNIofV+7U4GfhvO
	 TKvIS8e0xn6oPJzFpOWsU+8tcb1iqg1IEdQDtGhc=
Date: Thu, 5 Oct 2023 11:08:32 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Ayush Singh <ayushdevel1325@gmail.com>
Message-ID: <2023100501-siesta-dictate-132e@gregkh>
References: <20231004184639.462510-1-ayushdevel1325@gmail.com>
 <20231004184639.462510-3-ayushdevel1325@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231004184639.462510-3-ayushdevel1325@gmail.com>
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.00 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip4:139.178.84.217];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	ARC_NA(0.00)[];
	ASN(0.00)[asn:54825, ipnet:139.178.80.0/21, country:US];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[dt];
	BLOCKLISTDE_FAIL(0.00)[139.178.84.217:server fail,100.75.92.58:server fail];
	FREEMAIL_TO(0.00)[gmail.com];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 39E2D3EAB1
Message-ID-Hash: URQYFGMRABRQSUCRTWRDLUJY56TOVVIL
X-Message-ID-Hash: URQYFGMRABRQSUCRTWRDLUJY56TOVVIL
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: greybus-dev@lists.linaro.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, vaishnav@beagleboard.org, nm@ti.com, krzysztof.kozlowski+dt@linaro.org, johan@kernel.org, elder@kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v7 2/3] greybus: Add BeaglePlay Linux Driver
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/URQYFGMRABRQSUCRTWRDLUJY56TOVVIL/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Oct 05, 2023 at 12:16:37AM +0530, Ayush Singh wrote:
> Add the Greybus host driver for BeaglePlay board by BeagleBoard.org.
> 
> The current greybus setup involves running SVC in a user-space
> application (GBridge) and using netlink to communicate with kernel
> space. GBridge itself uses wpanusb kernel driver, so the greybus messages
> travel from kernel space (gb_netlink) to user-space (GBridge) and then
> back to kernel space (wpanusb) before reaching CC1352.
> 
> This driver directly communicates with CC1352 (running SVC Zephyr
> application). Thus, it simplifies the complete greybus setup eliminating
> user-space GBridge.
> 
> This driver is responsible for the following:
> - Start SVC (CC1352) on driver load.
> - Send/Receive Greybus messages to/from CC1352 using HDLC over UART.
> - Print Logs from CC1352.
> - Stop SVC (CC1352) on driver load.
> 
> Signed-off-by: Ayush Singh <ayushdevel1325@gmail.com>
> ---
>  MAINTAINERS                     |   1 +
>  drivers/greybus/Kconfig         |  10 +
>  drivers/greybus/Makefile        |   2 +
>  drivers/greybus/gb-beagleplay.c | 501 ++++++++++++++++++++++++++++++++
>  4 files changed, 514 insertions(+)
>  create mode 100644 drivers/greybus/gb-beagleplay.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 5467669d7963..d87e30626a6a 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -8974,6 +8974,7 @@ M:	Ayush Singh <ayushdevel1325@gmail.com>
>  L:	greybus-dev@lists.linaro.org (moderated for non-subscribers)
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/net/ti,cc1352p7.yaml
> +F:	drivers/greybus/gb-beagleplay.c
>  
>  GREYBUS SUBSYSTEM
>  M:	Johan Hovold <johan@kernel.org>
> diff --git a/drivers/greybus/Kconfig b/drivers/greybus/Kconfig
> index 78ba3c3083d5..fd4f26d09c53 100644
> --- a/drivers/greybus/Kconfig
> +++ b/drivers/greybus/Kconfig
> @@ -17,6 +17,16 @@ menuconfig GREYBUS
>  
>  if GREYBUS
>  
> +config GREYBUS_BEAGLEPLAY
> +	tristate "Greybus BeaglePlay driver"
> +	depends on TTY

What you want to depend on here is serdev, not tty, right?  Or am I
mis-reading the code requirements?

thanks,

greg k-h
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
