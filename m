Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 306D583DD74
	for <lists+greybus-dev@lfdr.de>; Fri, 26 Jan 2024 16:27:25 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 41EDB40D34
	for <lists+greybus-dev@lfdr.de>; Fri, 26 Jan 2024 15:27:24 +0000 (UTC)
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
	by lists.linaro.org (Postfix) with ESMTPS id 6F80E3F372
	for <greybus-dev@lists.linaro.org>; Fri, 26 Jan 2024 15:27:18 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=ieee.org header.s=google header.b="JNXnH/iL";
	dmarc=pass (policy=quarantine) header.from=ieee.org;
	spf=pass (lists.linaro.org: domain of elder@ieee.org designates 209.85.166.54 as permitted sender) smtp.mailfrom=elder@ieee.org
Received: by mail-io1-f54.google.com with SMTP id ca18e2360f4ac-7beefdfe71eso30776439f.0
        for <greybus-dev@lists.linaro.org>; Fri, 26 Jan 2024 07:27:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1706282838; x=1706887638; darn=lists.linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a4YLTamt/dfCfCUlCRgJ4PI4VKPOTvevkMpm6aJpxeo=;
        b=JNXnH/iLvp50hLpuJKHFQQiBHgyBIBSQ5zhgBOJuM9M1o4gmpf2t4ZiL4Bez3oeeUw
         DZ3uiQb5qN/Yd6TLNg8sxPvFNGmFMaesa0R8j4noxn/BF42r1Z4wM4k4EO5WNPQNQG/r
         ZljTnQfGSooRi2Q3qQ3hyF6jivFyNcZFpN58c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706282838; x=1706887638;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a4YLTamt/dfCfCUlCRgJ4PI4VKPOTvevkMpm6aJpxeo=;
        b=u6Xv202mWKNeOkSohkeYZsR35TxljjZDw4CUE/GfQYffTNDaRqoFe6QdFYI+0wPEkK
         GpORSkAKgZH6GwW6kV5CI6fLmHW3uDA+hs/h2SRA7zaOhHIBiMwZ8eNVwRm0sCOBDyCw
         yceArfEofANNeaxXRvQ5pNih6D4JwLBXoEgeVEQ0qXPTwibg/FDPwXYaDwqYZwskec8c
         8ea7rEnZqJIjUNSUHuL3r/JhjuypJwXwuZNUHlS3apiZWHt2nG0SLPGLBHtXJjhvr8O0
         m07Y73xUpuN8fuatCs6XzrbHQt6Cy79OID5nE1g9v+fMDIIX+2JZJ1WXMhtqNzGgopIR
         W9gg==
X-Gm-Message-State: AOJu0YxsRKb/4oUsq0QF6eTDY5phj4DzK7u7RjSLr7uPB4iEvkwe3VAH
	ChQMWDAKAiA1y5/8FCTcbm5i1OcH+SLBcjkCXZrOcs8iJ1/JArUJmFpeYyGlKQ==
X-Google-Smtp-Source: AGHT+IH2+E2ZGiBvOqV5jJVhXW/UdB37L5HITTy5G70/vnCA1pyoTK6U/M9SXKioRh4tqGEiNYUhgw==
X-Received: by 2002:a5e:dd01:0:b0:7bf:d258:6344 with SMTP id t1-20020a5edd01000000b007bfd2586344mr109800iop.0.1706282837817;
        Fri, 26 Jan 2024 07:27:17 -0800 (PST)
Received: from [172.22.22.28] (c-98-61-227-136.hsd1.mn.comcast.net. [98.61.227.136])
        by smtp.googlemail.com with ESMTPSA id d8-20020a056602184800b007bc102fb67asm412821ioi.10.2024.01.26.07.27.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jan 2024 07:27:17 -0800 (PST)
Message-ID: <53dfea0f-6840-4a02-af9d-65a99a53f28a@ieee.org>
Date: Fri, 26 Jan 2024 09:27:16 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <26425379d3eb9ba1b9af44468576ee20c77eb248.1705226208.git.christophe.jaillet@wanadoo.fr>
From: Alex Elder <elder@ieee.org>
In-Reply-To: <26425379d3eb9ba1b9af44468576ee20c77eb248.1705226208.git.christophe.jaillet@wanadoo.fr>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 6F80E3F372
X-Spamd-Bar: ---
X-Spamd-Result: default: False [-3.99 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	DMARC_POLICY_ALLOW(-0.50)[ieee.org,quarantine];
	R_DKIM_ALLOW(-0.20)[ieee.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17:c];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.166.54:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	FREEMAIL_TO(0.00)[wanadoo.fr,kernel.org,linuxfoundation.org];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_TLS_LAST(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[ieee.org:+]
Message-ID-Hash: YLTEARCPZU4FT6O2NG5HIT4DJ56Q2WZA
X-Message-ID-Hash: YLTEARCPZU4FT6O2NG5HIT4DJ56Q2WZA
X-MailFrom: elder@ieee.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, greybus-dev@lists.linaro.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] greybus: Remove usage of the deprecated ida_simple_xx() API
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/YLTEARCPZU4FT6O2NG5HIT4DJ56Q2WZA/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit

On 1/14/24 3:57 AM, Christophe JAILLET wrote:
> ida_alloc() and ida_free() should be preferred to the deprecated
> ida_simple_get() and ida_simple_remove().
> 
> Note that the upper limit of ida_simple_get() is exclusive, but the one of
> ida_alloc_range()/ida_alloc_max() is inclusive. So a -1 has been added when
> needed.

Looks good.

Reviewed-by: Alex Elder <elder@linaro.org>

> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>   drivers/greybus/es2.c       |  8 ++++----
>   drivers/greybus/hd.c        | 16 ++++++++--------
>   drivers/greybus/interface.c |  9 ++++-----
>   3 files changed, 16 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/greybus/es2.c b/drivers/greybus/es2.c
> index e89cca015095..1ee78d0d90b4 100644
> --- a/drivers/greybus/es2.c
> +++ b/drivers/greybus/es2.c
> @@ -513,16 +513,16 @@ static int es2_cport_allocate(struct gb_host_device *hd, int cport_id,
>   
>   	if (cport_id < 0) {
>   		ida_start = 0;
> -		ida_end = hd->num_cports;
> +		ida_end = hd->num_cports - 1;
>   	} else if (cport_id < hd->num_cports) {
>   		ida_start = cport_id;
> -		ida_end = cport_id + 1;
> +		ida_end = cport_id;
>   	} else {
>   		dev_err(&hd->dev, "cport %d not available\n", cport_id);
>   		return -EINVAL;
>   	}
>   
> -	return ida_simple_get(id_map, ida_start, ida_end, GFP_KERNEL);
> +	return ida_alloc_range(id_map, ida_start, ida_end, GFP_KERNEL);
>   }
>   
>   static void es2_cport_release(struct gb_host_device *hd, u16 cport_id)
> @@ -535,7 +535,7 @@ static void es2_cport_release(struct gb_host_device *hd, u16 cport_id)
>   		return;
>   	}
>   
> -	ida_simple_remove(&hd->cport_id_map, cport_id);
> +	ida_free(&hd->cport_id_map, cport_id);
>   }
>   
>   static int cport_enable(struct gb_host_device *hd, u16 cport_id,
> diff --git a/drivers/greybus/hd.c b/drivers/greybus/hd.c
> index 72b21bf2d7d3..bc5fd2f53d8b 100644
> --- a/drivers/greybus/hd.c
> +++ b/drivers/greybus/hd.c
> @@ -50,7 +50,7 @@ int gb_hd_cport_reserve(struct gb_host_device *hd, u16 cport_id)
>   	struct ida *id_map = &hd->cport_id_map;
>   	int ret;
>   
> -	ret = ida_simple_get(id_map, cport_id, cport_id + 1, GFP_KERNEL);
> +	ret = ida_alloc_range(id_map, cport_id, cport_id, GFP_KERNEL);
>   	if (ret < 0) {
>   		dev_err(&hd->dev, "failed to reserve cport %u\n", cport_id);
>   		return ret;
> @@ -64,7 +64,7 @@ void gb_hd_cport_release_reserved(struct gb_host_device *hd, u16 cport_id)
>   {
>   	struct ida *id_map = &hd->cport_id_map;
>   
> -	ida_simple_remove(id_map, cport_id);
> +	ida_free(id_map, cport_id);
>   }
>   EXPORT_SYMBOL_GPL(gb_hd_cport_release_reserved);
>   
> @@ -80,16 +80,16 @@ int gb_hd_cport_allocate(struct gb_host_device *hd, int cport_id,
>   
>   	if (cport_id < 0) {
>   		ida_start = 0;
> -		ida_end = hd->num_cports;
> +		ida_end = hd->num_cports - 1;
>   	} else if (cport_id < hd->num_cports) {
>   		ida_start = cport_id;
> -		ida_end = cport_id + 1;
> +		ida_end = cport_id;
>   	} else {
>   		dev_err(&hd->dev, "cport %d not available\n", cport_id);
>   		return -EINVAL;
>   	}
>   
> -	return ida_simple_get(id_map, ida_start, ida_end, GFP_KERNEL);
> +	return ida_alloc_range(id_map, ida_start, ida_end, GFP_KERNEL);
>   }
>   
>   /* Locking: Caller guarantees serialisation */
> @@ -100,7 +100,7 @@ void gb_hd_cport_release(struct gb_host_device *hd, u16 cport_id)
>   		return;
>   	}
>   
> -	ida_simple_remove(&hd->cport_id_map, cport_id);
> +	ida_free(&hd->cport_id_map, cport_id);
>   }
>   
>   static void gb_hd_release(struct device *dev)
> @@ -111,7 +111,7 @@ static void gb_hd_release(struct device *dev)
>   
>   	if (hd->svc)
>   		gb_svc_put(hd->svc);
> -	ida_simple_remove(&gb_hd_bus_id_map, hd->bus_id);
> +	ida_free(&gb_hd_bus_id_map, hd->bus_id);
>   	ida_destroy(&hd->cport_id_map);
>   	kfree(hd);
>   }
> @@ -162,7 +162,7 @@ struct gb_host_device *gb_hd_create(struct gb_hd_driver *driver,
>   	if (!hd)
>   		return ERR_PTR(-ENOMEM);
>   
> -	ret = ida_simple_get(&gb_hd_bus_id_map, 1, 0, GFP_KERNEL);
> +	ret = ida_alloc_min(&gb_hd_bus_id_map, 1, GFP_KERNEL);
>   	if (ret < 0) {
>   		kfree(hd);
>   		return ERR_PTR(ret);
> diff --git a/drivers/greybus/interface.c b/drivers/greybus/interface.c
> index 9ec949a438ef..c3cfd62831ff 100644
> --- a/drivers/greybus/interface.c
> +++ b/drivers/greybus/interface.c
> @@ -131,9 +131,8 @@ static int gb_interface_route_create(struct gb_interface *intf)
>   	int ret;
>   
>   	/* Allocate an interface device id. */
> -	ret = ida_simple_get(&svc->device_id_map,
> -			     GB_SVC_DEVICE_ID_MIN, GB_SVC_DEVICE_ID_MAX + 1,
> -			     GFP_KERNEL);
> +	ret = ida_alloc_range(&svc->device_id_map, GB_SVC_DEVICE_ID_MIN,
> +			      GB_SVC_DEVICE_ID_MAX, GFP_KERNEL);
>   	if (ret < 0) {
>   		dev_err(&intf->dev, "failed to allocate device id: %d\n", ret);
>   		return ret;
> @@ -165,7 +164,7 @@ static int gb_interface_route_create(struct gb_interface *intf)
>   	 * XXX anymore.
>   	 */
>   err_ida_remove:
> -	ida_simple_remove(&svc->device_id_map, device_id);
> +	ida_free(&svc->device_id_map, device_id);
>   
>   	return ret;
>   }
> @@ -178,7 +177,7 @@ static void gb_interface_route_destroy(struct gb_interface *intf)
>   		return;
>   
>   	gb_svc_route_destroy(svc, svc->ap_intf_id, intf->interface_id);
> -	ida_simple_remove(&svc->device_id_map, intf->device_id);
> +	ida_free(&svc->device_id_map, intf->device_id);
>   	intf->device_id = GB_INTERFACE_DEVICE_ID_BAD;
>   }
>   

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
