Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 50F544C4253
	for <lists+greybus-dev@lfdr.de>; Fri, 25 Feb 2022 11:32:44 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 79D5D3EF0A
	for <lists+greybus-dev@lfdr.de>; Fri, 25 Feb 2022 10:32:43 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	by lists.linaro.org (Postfix) with ESMTPS id 64CBC3EF09
	for <greybus-dev@lists.linaro.org>; Fri, 25 Feb 2022 10:32:41 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 4C2FEB82DDE;
	Fri, 25 Feb 2022 10:32:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 769D0C340E7;
	Fri, 25 Feb 2022 10:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1645785159;
	bh=WQQt1uu312A8XAs+LoP4SDfB91oIAFo5DwTin5tMleA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uBW9Hi9JccIwTAKePyO2/690IAkx8JAzL/Kla+OIpGoBi4ZJaBhfVXQleOJNl5a8X
	 3xA1o4aNphQibsgBjgX8+znJ3GqA8dLvYVSxUz3BdQZ2cQsIh6BfD0TE9bO5ZG3gHx
	 QS9gLSoTdlth+Tm1H1aGGiLWvacrQ3F7QYRN/Jrc=
Date: Fri, 25 Feb 2022 11:32:31 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Song Chen <chensong_2000@189.cn>
Message-ID: <YhiwP/qt+yHLHztR@kroah.com>
References: <1645780561-18481-1-git-send-email-chensong_2000@189.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1645780561-18481-1-git-send-email-chensong_2000@189.cn>
Message-ID-Hash: HDMKZXKMJ772NXKFCS73IFHE74JBUGDF
X-Message-ID-Hash: HDMKZXKMJ772NXKFCS73IFHE74JBUGDF
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: johan@kernel.org, elder@kernel.org, thierry.reding@gmail.com, u.kleine-koenig@pengutronix.de, lee.jones@linaro.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v3] staging: greybus: introduce pwm_ops::apply
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/HDMKZXKMJ772NXKFCS73IFHE74JBUGDF/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Feb 25, 2022 at 05:16:01PM +0800, Song Chen wrote:
> Introduce apply in pwm_ops to replace legacy operations,
> like enable, disable, config and set_polarity.

Why?  You are saying what you are doing here, but nothing about why this
is needed, or what it will help with, or what it will fix.

You need to explain why a change is needed.

thanks,

greg k-h
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
