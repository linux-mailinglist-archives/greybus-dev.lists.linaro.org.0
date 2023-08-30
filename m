Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 7792978D5DD
	for <lists+greybus-dev@lfdr.de>; Wed, 30 Aug 2023 14:27:20 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 7BCDC3EFC6
	for <lists+greybus-dev@lfdr.de>; Wed, 30 Aug 2023 12:27:19 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	by lists.linaro.org (Postfix) with ESMTPS id DC3553EC22
	for <greybus-dev@lists.linaro.org>; Wed, 30 Aug 2023 12:27:11 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=xP3pNvgp;
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 139.178.84.217 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org;
	dmarc=pass (policy=none) header.from=linuxfoundation.org
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5F028624A8;
	Wed, 30 Aug 2023 12:27:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41F00C433C8;
	Wed, 30 Aug 2023 12:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1693398430;
	bh=hV3Ww7weGzK/eX4grQEyIbhsgzK+QKwviHngh9A4vmU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=xP3pNvgpJ32kQQEBTcDQdUIuR3cXRgLT1NBbeCzozQTRbedxrpZwQkmalQVArUWkj
	 yXfsGyCppj1W4CxlFqg2JS4Z8k9HU3EgsfSrKtbhU1Pg3sPDGXOaTxRMeIjVm+Jm7E
	 L4r0t4vZcmPSAl8KQQj/bD+qSOiI/cL4Wnvv3fac=
Date: Wed, 30 Aug 2023 14:27:07 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Ayush Singh <ayushdevel1325@gmail.com>
Message-ID: <2023083030-throwing-shale-5c25@gregkh>
References: <20230830122427.284415-1-ayushdevel1325@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230830122427.284415-1-ayushdevel1325@gmail.com>
X-Rspamd-Queue-Id: DC3553EC22
X-Spamd-Bar: ---------
X-Spamd-Result: default: False [-9.00 / 15.00];
	REPLY(-4.00)[];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	DWL_DNSWL_HI(-3.50)[linuxfoundation.org:dkim];
	BAYES_HAM(-3.00)[100.00%];
	RCVD_IN_DNSWL_HI(-1.00)[139.178.84.217:from,52.25.139.140:received];
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
Message-ID-Hash: 2XOD7Y5HCIYHTWMIOW7ESSVNC6XDRI77
X-Message-ID-Hash: 2XOD7Y5HCIYHTWMIOW7ESSVNC6XDRI77
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: greybus-dev@lists.linaro.org, hvaibhav.linux@gmail.com, elder@kernel.org, johan@kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 0/2] staging/greybus: Add BeaglePlay Greybus Driver
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/2XOD7Y5HCIYHTWMIOW7ESSVNC6XDRI77/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Aug 30, 2023 at 05:54:25PM +0530, Ayush Singh wrote:
> This driver can be used in any Greybus setup where SVC and Linux Host
> are connected over UART.
> 
> This driver has been tested on BeaglePlay by BeagleBoard.org. It communicates
> with BeaglePlay CC1352 co-processor which serves as Greybus SVC. This
> replaces the old setup with bcfserial, wpanusb and GBridge. This driver also
> contains async HDLC code since communication with SVC take place over UART
> using HDLC.
> 
> This patchset also introduces a compatible property for the UART that is
> connected to CC1352 in BeaglePlay. I am not quite sure if it needs its
> own DT Schema file under `Documentation/devicetree/bindings/serial`.
> 
> This driver has been created as a part of my Google Summer of Code 2023.
> For more information, take a look at my blog.
> 
> I have made most of the changes requested in the first version of this
> patch and simplified the code as well.
> 
> This patchset has been tested over `next-20230825`.
> 
> My GSoC23 Blog: https://programmershideaway.xyz/tags/gsoc23/
> Zephyr Application: https://git.beagleboard.org/gsoc/greybus/cc1352-firmware
> GitHub Branch: https://github.com/Ayush1325/linux/tree/gb-beagleplay
> Video Demo: https://youtu.be/GVuIB7i5pjk
> 
> Ayush Singh (2):
>   dts: Add beaglecc1352 to devicetree
>   staging/greybus: Add BeaglePlay Linux Driver
> 
>  MAINTAINERS                                   |   5 +
>  .../arm64/boot/dts/ti/k3-am625-beagleplay.dts |   4 +
>  drivers/staging/greybus/Kconfig               |   9 +
>  drivers/staging/greybus/Makefile              |   3 +
>  drivers/staging/greybus/gb-beagleplay.c       | 493 ++++++++++++++++++
>  5 files changed, 514 insertions(+)
>  create mode 100644 drivers/staging/greybus/gb-beagleplay.c
> 
> -- 
> 2.41.0
> 

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- This looks like a new version of a previously submitted patch, but you
  did not list below the --- line any changes from the previous version.
  Please read the section entitled "The canonical patch format" in the
  kernel file, Documentation/process/submitting-patches.rst for what
  needs to be done here to properly describe this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
