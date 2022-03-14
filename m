Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D0E64D87A6
	for <lists+greybus-dev@lfdr.de>; Mon, 14 Mar 2022 16:03:49 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 085143EF65
	for <lists+greybus-dev@lfdr.de>; Mon, 14 Mar 2022 15:03:48 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	by lists.linaro.org (Postfix) with ESMTPS id 2C71A3EBE7
	for <greybus-dev@lists.linaro.org>; Mon, 14 Mar 2022 15:03:46 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C93486123C;
	Mon, 14 Mar 2022 15:03:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E078C340E9;
	Mon, 14 Mar 2022 15:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1647270225;
	bh=TOCa2Y+srhzXpGyLE0cjs/+WyeybMthKurMeliCpKbo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iFb+nfJccPcZTK+rrovHHIol8KNikO/3HCWQPdrIy54REM/I9aeoI3ppdx3BVrYDP
	 JfLsuKNNziHrIm9ajtjN0XoIBgoGmBPDvMeiKS3q/srl1ny0LJlnJSTHe7r6x+Ameq
	 ipyW/YkV2OUq17PtPpZatHzddaMHMpMv/Oaipkn8=
Date: Mon, 14 Mar 2022 16:03:41 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Song Chen <chensong_2000@189.cn>
Message-ID: <Yi9ZTdcZsdDjecC3@kroah.com>
References: <1646791174-30557-1-git-send-email-chensong_2000@189.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1646791174-30557-1-git-send-email-chensong_2000@189.cn>
Message-ID-Hash: BOWBKC2W3WLLMPWNJXHPLRHRUGP4KZCS
X-Message-ID-Hash: BOWBKC2W3WLLMPWNJXHPLRHRUGP4KZCS
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: johan@kernel.org, elder@kernel.org, thierry.reding@gmail.com, u.kleine-koenig@pengutronix.de, lee.jones@linaro.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v4] staging: greybus: introduce pwm_ops::apply
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/BOWBKC2W3WLLMPWNJXHPLRHRUGP4KZCS/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Mar 09, 2022 at 09:59:34AM +0800, Song Chen wrote:
> Introduce newer .apply function in pwm_ops to
> replace legacy operations,like enable, disable,
> config and set_polarity.

You can use the full 72 columns please.

> This guarantees atomic changes of the pwm
> controller configuration and also reduces the
> size of the driver.

The driver is bigger (more lines) with this change, so why do you say it
is smaller?

thanks,

greg k-h
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
