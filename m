Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 536B54BA9C3
	for <lists+greybus-dev@lfdr.de>; Thu, 17 Feb 2022 20:26:51 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 46B283EEBA
	for <lists+greybus-dev@lfdr.de>; Thu, 17 Feb 2022 19:26:50 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	by lists.linaro.org (Postfix) with ESMTPS id 029E53ED58
	for <greybus-dev@lists.linaro.org>; Thu, 17 Feb 2022 19:26:47 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 62290B8244F;
	Thu, 17 Feb 2022 19:26:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AED3C340E8;
	Thu, 17 Feb 2022 19:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1645126004;
	bh=+GbxhSGLzwmU1NtyRldCXItdnvRFCwidru7MjEV9s9c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YmhwJXVCJ4d6qu6l7uDUhvZunhZtjhor06UZWQf8d3iGcpaA6HVHREYiU2F4K9LVi
	 pxjQqnAZG8dDh0hbia26X4YryPPB135FbUrs0C4xZbDM35AEpAFmG+HI+3fO75S/SG
	 d49dxFKeG3z6GnWeN5P/cXX1rkhQBang4SrQD5OM=
Date: Thu, 17 Feb 2022 20:26:41 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Husni Faiz <ahamedhusni73@gmail.com>
Message-ID: <Yg6hcX6XK4Eu0KOR@kroah.com>
References: <20220217190722.44894-1-ahamedhusni73@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220217190722.44894-1-ahamedhusni73@gmail.com>
Message-ID-Hash: 5TRLVTFBCHZU57SYXR72PPQ57GXDVPX4
X-Message-ID-Hash: 5TRLVTFBCHZU57SYXR72PPQ57GXDVPX4
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: loopback: Fix Coding Style Error
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/5TRLVTFBCHZU57SYXR72PPQ57GXDVPX4/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Feb 18, 2022 at 12:37:22AM +0530, Husni Faiz wrote:
> Macros with multiple statements should be enclosed in a do - while
> block.
> 
> Signed-off-by: Husni Faiz <ahamedhusni73@gmail.com>
> ---
>  drivers/staging/greybus/loopback.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/greybus/loopback.c b/drivers/staging/greybus/loopback.c
> index 2471448ba42a..33666a49e0a8 100644
> --- a/drivers/staging/greybus/loopback.c
> +++ b/drivers/staging/greybus/loopback.c
> @@ -162,10 +162,12 @@ static ssize_t name##_avg_show(struct device *dev,		\
>  }									\
>  static DEVICE_ATTR_RO(name##_avg)
>  
> -#define gb_loopback_stats_attrs(field)				\
> -	gb_loopback_ro_stats_attr(field, min, u);		\
> -	gb_loopback_ro_stats_attr(field, max, u);		\
> -	gb_loopback_ro_avg_attr(field)
> +#define gb_loopback_stats_attrs(field)					\
> +	do {												\
> +		gb_loopback_ro_stats_attr(field, min, u);		\
> +		gb_loopback_ro_stats_attr(field, max, u);		\
> +		gb_loopback_ro_avg_attr(field)					\
> +	} while (0)
>  
>  #define gb_loopback_attr(field, type)					\
>  static ssize_t field##_show(struct device *dev,				\
> -- 
> 2.25.1
> 
> 

Did you try to build this change?
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
