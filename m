Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id EB703508D49
	for <lists+greybus-dev@lfdr.de>; Wed, 20 Apr 2022 18:28:53 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id C8C9340488
	for <lists+greybus-dev@lfdr.de>; Wed, 20 Apr 2022 16:28:52 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	by lists.linaro.org (Postfix) with ESMTPS id 1CD4A3EC4B
	for <greybus-dev@lists.linaro.org>; Wed, 20 Apr 2022 16:28:50 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 2ADC8B81F8E;
	Wed, 20 Apr 2022 16:28:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F719C385A0;
	Wed, 20 Apr 2022 16:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1650472127;
	bh=1NrwORl7TpAJ23BH9sDvu1Q+P5kuqJUNPzBg+nFEQeQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SEWj9WpK1NklvjCLRgMxfOYs1q+9GpPzyuvNkoKun3XgUhGWx/s4oOvUa6q2BkaId
	 ekFPz1DAg+mTh3SHUFBjXdON9HjfCobQa7CcvtnhinS4gwVWZwgSYa9kGrdu5VDXyy
	 Hr0g2TYQW7EecOz8n7PjoMLV+IWq4Ftis6ZTVMVc=
Date: Wed, 20 Apr 2022 18:28:44 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Xiaomeng Tong <xiam0nd.tong@gmail.com>
Message-ID: <YmA0vHtvNmv9PNi9@kroah.com>
References: <20220414084219.13501-1-xiam0nd.tong@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220414084219.13501-1-xiam0nd.tong@gmail.com>
Message-ID-Hash: QU2WOTQFQ4IHOPNJMD575WJIYN46TZ6S
X-Message-ID-Hash: QU2WOTQFQ4IHOPNJMD575WJIYN46TZ6S
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: dan.carpenter@oracle.com, johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v2] greybus: audio_codec: initialize data to silence static checker warnings
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/QU2WOTQFQ4IHOPNJMD575WJIYN46TZ6S/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Apr 14, 2022 at 04:42:19PM +0800, Xiaomeng Tong wrote:
> These three declares are here:
> 	struct gbaudio_data_connection *data;
> 
> Since all three of these functions check for if the codec->module_list is
> empty at the start of the function so these are not real bugs to bypass
> 'if (!data) {'. To avoid static checker warnings like Smatch, initialize
> the data with NULL.

We do not work around broken tools, we ask that the tools be fixed.

thanks,

greg k-h
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
