Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FEF7552E1E
	for <lists+greybus-dev@lfdr.de>; Tue, 21 Jun 2022 11:21:39 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 7BE1A3F2D4
	for <lists+greybus-dev@lfdr.de>; Tue, 21 Jun 2022 09:21:38 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	by lists.linaro.org (Postfix) with ESMTPS id BF23D3F1FC
	for <greybus-dev@lists.linaro.org>; Tue, 21 Jun 2022 09:21:35 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id A1514B816BF;
	Tue, 21 Jun 2022 09:21:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50DB3C3411C;
	Tue, 21 Jun 2022 09:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655803293;
	bh=tLFl3NPsWZx6U7LiKRVGtumSH0CZrXn2AYNCegSzJwk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H2pPcLSE1yTCq8tTzqno+Z8p282Zk+f+DmIhtq8KzlmT/Muz+4bASepBPc1bFvVdG
	 +X/SO5ykm3h+MsrZfUltWVX55N1kiUDZzEzqB0OPUjir0mMkpe5vq1zO9bww1+XzCI
	 qtdI1z09qGYvZqQCpEyLupa48QZ37rdB3RYh8qHbC04runRXaPgqdESlFCMGk1N5dg
	 CcLdTTxxgQj3FtArEFVesrp5xPc1iaTFfubKAFurl02UM3yCE8KAc9D7m4fn3qr3Bp
	 WzQxRIDPKOz0IcNKrFbs5bMiRx64fA8IDBui4H/56rRYrom9jVwefG4x+QHY56NpB6
	 vmf8OqB0/p4eA==
Received: from johan by xi.lan with local (Exim 4.94.2)
	(envelope-from <johan@kernel.org>)
	id 1o3a4d-0001m4-Dd; Tue, 21 Jun 2022 11:21:27 +0200
Date: Tue, 21 Jun 2022 11:21:27 +0200
From: Johan Hovold <johan@kernel.org>
To: keliu <liuke94@huawei.com>
Message-ID: <YrGNlwxsI7SH0Bqr@hovoldconsulting.com>
References: <20220527111348.3444003-1-liuke94@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220527111348.3444003-1-liuke94@huawei.com>
Message-ID-Hash: 66RMGIMSGDO2NAVWYK3CJDZRXPZTDMHQ
X-Message-ID-Hash: 66RMGIMSGDO2NAVWYK3CJDZRXPZTDMHQ
X-MailFrom: johan@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: elder@kernel.org, greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] drivers: greybus: Directly use ida_alloc()/free()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/66RMGIMSGDO2NAVWYK3CJDZRXPZTDMHQ/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, May 27, 2022 at 11:13:48AM +0000, keliu wrote:

Please drop "drivers: " from Subject and use a more descriptive summary
like:

	greybus: replace ida_simple interface

> Use ida_alloc()/ida_free() instead of deprecated
> ida_simple_get()/ida_simple_remove() .
> 
> Signed-off-by: keliu <liuke94@huawei.com>

Again, this needs to be a full (legal) name.

> ---
>  drivers/greybus/es2.c       |  4 ++--
>  drivers/greybus/hd.c        | 12 ++++++------
>  drivers/greybus/interface.c |  8 ++++----
>  3 files changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/greybus/es2.c b/drivers/greybus/es2.c
> index e89cca015095..c861fb2acd8a 100644
> --- a/drivers/greybus/es2.c
> +++ b/drivers/greybus/es2.c
> @@ -522,7 +522,7 @@ static int es2_cport_allocate(struct gb_host_device *hd, int cport_id,
>  		return -EINVAL;
>  	}
>  
> -	return ida_simple_get(id_map, ida_start, ida_end, GFP_KERNEL);
> +	return ida_alloc_range(id_map, ida_start, ida_end - 1, GFP_KERNEL);

Please mention in the commit message that the upper bound is inclusive
in the new API.

>  }
>  
>  static void es2_cport_release(struct gb_host_device *hd, u16 cport_id)
> @@ -535,7 +535,7 @@ static void es2_cport_release(struct gb_host_device *hd, u16 cport_id)
>  		return;
>  	}
>  
> -	ida_simple_remove(&hd->cport_id_map, cport_id);
> +	ida_free(&hd->cport_id_map, cport_id);
>  }
>  
>  static int cport_enable(struct gb_host_device *hd, u16 cport_id,
> diff --git a/drivers/greybus/hd.c b/drivers/greybus/hd.c
> index 72b21bf2d7d3..6ff5b0cfd539 100644
> --- a/drivers/greybus/hd.c
> +++ b/drivers/greybus/hd.c
> @@ -50,7 +50,7 @@ int gb_hd_cport_reserve(struct gb_host_device *hd, u16 cport_id)
>  	struct ida *id_map = &hd->cport_id_map;
>  	int ret;
>  
> -	ret = ida_simple_get(id_map, cport_id, cport_id + 1, GFP_KERNEL);
> +	ret = ida_alloc_range(id_map, cport_id, cport_id, GFP_KERNEL);
>  	if (ret < 0) {
>  		dev_err(&hd->dev, "failed to reserve cport %u\n", cport_id);
>  		return ret;
> @@ -64,7 +64,7 @@ void gb_hd_cport_release_reserved(struct gb_host_device *hd, u16 cport_id)
>  {
>  	struct ida *id_map = &hd->cport_id_map;
>  
> -	ida_simple_remove(id_map, cport_id);
> +	ida_free(id_map, cport_id);
>  }
>  EXPORT_SYMBOL_GPL(gb_hd_cport_release_reserved);
>  
> @@ -89,7 +89,7 @@ int gb_hd_cport_allocate(struct gb_host_device *hd, int cport_id,
>  		return -EINVAL;
>  	}
>  
> -	return ida_simple_get(id_map, ida_start, ida_end, GFP_KERNEL);
> +	return ida_alloc_range(id_map, ida_start, ida_end - 1, GFP_KERNEL);
>  }
>  
>  /* Locking: Caller guarantees serialisation */
> @@ -100,7 +100,7 @@ void gb_hd_cport_release(struct gb_host_device *hd, u16 cport_id)
>  		return;
>  	}
>  
> -	ida_simple_remove(&hd->cport_id_map, cport_id);
> +	ida_free(&hd->cport_id_map, cport_id);
>  }
>  
>  static void gb_hd_release(struct device *dev)
> @@ -111,7 +111,7 @@ static void gb_hd_release(struct device *dev)
>  
>  	if (hd->svc)
>  		gb_svc_put(hd->svc);
> -	ida_simple_remove(&gb_hd_bus_id_map, hd->bus_id);
> +	ida_free(&gb_hd_bus_id_map, hd->bus_id);
>  	ida_destroy(&hd->cport_id_map);
>  	kfree(hd);
>  }
> @@ -162,7 +162,7 @@ struct gb_host_device *gb_hd_create(struct gb_hd_driver *driver,
>  	if (!hd)
>  		return ERR_PTR(-ENOMEM);
>  
> -	ret = ida_simple_get(&gb_hd_bus_id_map, 1, 0, GFP_KERNEL);
> +	ret = ida_alloc_min(&gb_hd_bus_id_map, 1, GFP_KERNEL);
>  	if (ret < 0) {
>  		kfree(hd);
>  		return ERR_PTR(ret);
> diff --git a/drivers/greybus/interface.c b/drivers/greybus/interface.c
> index 9ec949a438ef..f685e5f7b7b1 100644
> --- a/drivers/greybus/interface.c
> +++ b/drivers/greybus/interface.c
> @@ -131,8 +131,8 @@ static int gb_interface_route_create(struct gb_interface *intf)
>  	int ret;
>  
>  	/* Allocate an interface device id. */
> -	ret = ida_simple_get(&svc->device_id_map,
> -			     GB_SVC_DEVICE_ID_MIN, GB_SVC_DEVICE_ID_MAX + 1,
> +	ret = ida_alloc_range(&svc->device_id_map,
> +			     GB_SVC_DEVICE_ID_MIN, GB_SVC_DEVICE_ID_MAX,
>  			     GFP_KERNEL);
>  	if (ret < 0) {
>  		dev_err(&intf->dev, "failed to allocate device id: %d\n", ret);
> @@ -165,7 +165,7 @@ static int gb_interface_route_create(struct gb_interface *intf)
>  	 * XXX anymore.
>  	 */
>  err_ida_remove:
> -	ida_simple_remove(&svc->device_id_map, device_id);
> +	ida_free(&svc->device_id_map, device_id);
>  
>  	return ret;
>  }
> @@ -178,7 +178,7 @@ static void gb_interface_route_destroy(struct gb_interface *intf)
>  		return;
>  
>  	gb_svc_route_destroy(svc, svc->ap_intf_id, intf->interface_id);
> -	ida_simple_remove(&svc->device_id_map, intf->device_id);
> +	ida_free(&svc->device_id_map, intf->device_id);
>  	intf->device_id = GB_INTERFACE_DEVICE_ID_BAD;
>  }

Looks good otherwise.

Johan
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
