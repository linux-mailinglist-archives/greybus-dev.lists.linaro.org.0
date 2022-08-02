Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 63C1A5878E3
	for <lists+greybus-dev@lfdr.de>; Tue,  2 Aug 2022 10:20:02 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 3B98C4796B
	for <lists+greybus-dev@lfdr.de>; Tue,  2 Aug 2022 08:20:01 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	by lists.linaro.org (Postfix) with ESMTPS id 659223EB7D
	for <greybus-dev@lists.linaro.org>; Tue,  2 Aug 2022 08:20:00 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id DF96560500;
	Tue,  2 Aug 2022 08:19:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDA7AC433C1;
	Tue,  2 Aug 2022 08:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1659428399;
	bh=XgwKA0mkCkCTsNw2LXbYMe8gfREdShiCQyRYibvV+2M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j5cqY8jGaqhQxYFED+XpMKLpcM3iONjwHsx4+2n7Q/asEWFyA4tgmXWKG8j5dDfAn
	 kaqv4IwWn09HAqQzu4mIQNlQwjTuPrjVVWOkHey+Xlmm593MWO7bSysG2cfRLbd8BD
	 J/1sIxnuGxsWm6fxOIAAeM8dTZeL6w4vA0B4V2T0=
Date: Tue, 2 Aug 2022 10:19:56 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: cgel.zte@gmail.com
Message-ID: <YujeLEMsIrVD2tGn@kroah.com>
References: <20220802074542.1648594-1-ye.xingchen@zte.com.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220802074542.1648594-1-ye.xingchen@zte.com.cn>
Message-ID-Hash: LXIWFHWU3XTUEYMS35LUL5ET7HVMHUKH
X-Message-ID-Hash: LXIWFHWU3XTUEYMS35LUL5ET7HVMHUKH
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: linux-kernel@vger.kernel.org, greybus-dev@lists.linaro.org, ye xingchen <ye.xingchen@zte.com.cn>, Zeal Robot <zealci@zte.com.cn>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH linux-next] staging: greybus:using the pm_runtime_resume_and_get  to simplify the code
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/LXIWFHWU3XTUEYMS35LUL5ET7HVMHUKH/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Aug 02, 2022 at 07:45:42AM +0000, cgel.zte@gmail.com wrote:
> From: ye xingchen <ye.xingchen@zte.com.cn>
> 
> Using pm_runtime_resume_and_get() to instade of  pm_runtime_get_sync
> and pm_runtime_put_noidle.
> 
> Reported-by: Zeal Robot <zealci@zte.com.cn>

Please follow the rules in
Documentation/process/researcher-guidelines.rst for stuff like this,
otherwise I have to reject it.

greg k-h
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
