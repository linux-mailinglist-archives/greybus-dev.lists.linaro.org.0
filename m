Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 537DC5534D7
	for <lists+greybus-dev@lfdr.de>; Tue, 21 Jun 2022 16:48:39 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 7D2573F2D4
	for <lists+greybus-dev@lfdr.de>; Tue, 21 Jun 2022 14:48:38 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	by lists.linaro.org (Postfix) with ESMTPS id 39DE33F0CB
	for <greybus-dev@lists.linaro.org>; Tue, 21 Jun 2022 14:48:37 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 47868B8197E;
	Tue, 21 Jun 2022 14:48:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B6F7C341C0;
	Tue, 21 Jun 2022 14:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1655822916;
	bh=Gwr+QyPB83NBVvE/p+NStVDucuI4XhibcTOhatHYCMk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=acuemdwiDFqqe9DwJANs1HBjVp9507bqKE0b6z1jOvk5N/RsystoicJlpZgu+S4Se
	 RsKidwCiZ9K0ixmveG3eS7t15WBuY3AN6WA+sZM5AxObD7Eaw4sdLbJujJ7fQkRMfb
	 wp7jXfiy4cQZOvJcQd5awP1YS39Ug17eBfV4mgrM=
Date: Tue, 21 Jun 2022 16:48:32 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Dongliang Mu <mudongliangabcd@gmail.com>
Message-ID: <YrHaQHGhdV0w0ot+@kroah.com>
References: <CAD-N9QVVKUDFKMSxUc-smcz0B_7PrjN3DPku+cDM3ZKDn0XLBA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAD-N9QVVKUDFKMSxUc-smcz0B_7PrjN3DPku+cDM3ZKDn0XLBA@mail.gmail.com>
Message-ID-Hash: PP5Z33GY3K2AP4BNZZB7CNNA7MZUK3GF
X-Message-ID-Hash: PP5Z33GY3K2AP4BNZZB7CNNA7MZUK3GF
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: vireshk@kernel.org, Johan Hovold <johan@kernel.org>, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel <linux-kernel@vger.kernel.org>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: Unitialized Variable and Null Pointer Dereference bug in gb_bootrom_get_firmware
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/PP5Z33GY3K2AP4BNZZB7CNNA7MZUK3GF/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Jun 21, 2022 at 10:36:04PM +0800, Dongliang Mu wrote:
> Hi maintainers,
> 
> I would like to send one bug report.
> 
> In gb_bootrom_get_firmware, if the first branch is satisfied, it will
> go to queue_work, leading to the dereference of uninitialized const
> variable "fw". If the second branch is satisfied, it will go to unlock
> with fw as NULL pointer, leading to a NULL Pointer Dereference.
> 
> The Fixes commit should be [1], introducing the dereference of "fw" in
> the error handling code.
> 
> I am not sure how to fix this bug. Any comment on removing the
> dereference of fw?

As Johan said, please fix up your tool that found this, it is not
working properly.

thanks,

greg k-h
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
