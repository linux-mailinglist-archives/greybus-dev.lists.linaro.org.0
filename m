Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A73247CFA5
	for <lists+greybus-dev@lfdr.de>; Wed, 22 Dec 2021 10:58:57 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 48D1C6101D
	for <lists+greybus-dev@lfdr.de>; Wed, 22 Dec 2021 09:58:55 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 19D0460B99; Wed, 22 Dec 2021 09:58:54 +0000 (UTC)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id A729060B53;
	Wed, 22 Dec 2021 09:58:51 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 6CB2E60B53
 for <greybus-dev@lists.linaro.org>; Wed, 22 Dec 2021 09:58:49 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 52BFF60A66; Wed, 22 Dec 2021 09:58:49 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by lists.linaro.org (Postfix) with ESMTPS id 23D6F60A66
 for <greybus-dev@lists.linaro.org>; Wed, 22 Dec 2021 09:58:47 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 99C3E61976;
 Wed, 22 Dec 2021 09:58:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD3C5C36AE8;
 Wed, 22 Dec 2021 09:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1640167126;
 bh=4Jbtx0sxV9eUary/KdEpdFh2LPUEDT9+q6duvRyEM3M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IldX2r97TCE1WX4R71Z6NObvVMPrG5wnqtdEYIZ3ukMQAQW2gpG8U5J8ikHJVEu/D
 /tB02O/QmMhYdfGSaZylcxZicU2OqDzkozPpFT+OxK2O83UCwro3anDPCdoTH+j5sW
 jY5mjqU6YFwpZ1U0MIzvqyG4oDM63KcExIcFsHqI=
Date: Wed, 22 Dec 2021 10:58:43 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Message-ID: <YcL20/7ddWTsdIuQ@kroah.com>
References: <CAKXUXMym0M1UNuNGUVpFr2yUwOwjkZ_sQpCD0jC8YB+hs=j-bA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKXUXMym0M1UNuNGUVpFr2yUwOwjkZ_sQpCD0jC8YB+hs=j-bA@mail.gmail.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Re: [greybus-dev] Addition of config USB_HSIC_USB3613 soon?
X-BeenThere: greybus-dev@lists.linaro.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
List-Unsubscribe: <https://lists.linaro.org/mailman/options/greybus-dev>,
 <mailto:greybus-dev-request@lists.linaro.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/greybus-dev/>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Subscribe: <https://lists.linaro.org/mailman/listinfo/greybus-dev>,
 <mailto:greybus-dev-request@lists.linaro.org?subject=subscribe>
Cc: Alex Elder <elder@kernel.org>, linux-staging@lists.linux.dev,
 Vaibhav Hiremath <hvaibhav.linux@gmail.com>, Johan Hovold <johan@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 greybus-dev@lists.linaro.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: greybus-dev-bounces@lists.linaro.org
Sender: "greybus-dev" <greybus-dev-bounces@lists.linaro.org>
X-Virus-Scanned: ClamAV using ClamSMTP

On Wed, Dec 22, 2021 at 10:54:41AM +0100, Lukas Bulwahn wrote:
> Dear Vaibhav, dear Johan, dear Alex, dear Greg,
> 
> I have seen that the greybus arche driver has been under heavy
> development in 2016 and 2017 with some further clean-up in 2019.
> 
> However, so far, the config GREYBUS_ARCHE for this driver still
> depends on the out-of-tree config USB_HSIC_USB3613, with a proper
> exception made for compile testing (with COMPILE_TEST).
> 
> Will this USB_HSIC_USB3613 config and driver still be added in the
> mainline kernel in the near future, so that the config dependencies
> are consistent in mainline?

Do you have this hardware?  If so, we can add the driver, but given that
I did not think the chip ever actually shipped, it didn't make much
sense.

> Or, are the further out-of-tree additions still maintained for the
> current kernel and will stay out of tree? Is this arche driver not
> needed anymore and can be dropped?

Do you want to drop it as it is causing problems for you?  It's a good
example driver for those wanting to create a greybus host controller
driver so it's nice to have in the tree, unless you have a different one
that should be merged instead?

thanks,

greg k-h
_______________________________________________
greybus-dev mailing list
greybus-dev@lists.linaro.org
https://lists.linaro.org/mailman/listinfo/greybus-dev
