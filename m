Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 04CD788AB87
	for <lists+greybus-dev@lfdr.de>; Mon, 25 Mar 2024 18:25:21 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id CB58141532
	for <lists+greybus-dev@lfdr.de>; Mon, 25 Mar 2024 17:25:19 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	by lists.linaro.org (Postfix) with ESMTPS id 23B293EE2D
	for <greybus-dev@lists.linaro.org>; Mon, 25 Mar 2024 17:25:16 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b="kzd/dCN9";
	dmarc=pass (policy=none) header.from=linuxfoundation.org;
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 145.40.73.55 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id B1C42CE1B21;
	Mon, 25 Mar 2024 17:25:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0750CC433F1;
	Mon, 25 Mar 2024 17:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1711387512;
	bh=Im8fSElPcwJhoaGSevQTn339Qc+KDItzGNhffc+HDek=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kzd/dCN9mmtiSXqWSeKcjA+NCsfz5vgp63a1xjjEndvKPlOJ91Si0XK13ZJ6roKLX
	 LSYVdpF3ECwSPXB4grFcgbxZenPmyOw6TcWHMif8d9eNmYy0zvqiGpsi1kXAsYcHis
	 YhBmEvEWKkW6J44goZTotiO/g4C/qV8CdQHSaElI=
Date: Mon, 25 Mar 2024 18:25:09 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Rui Miguel Silva <rui.silva@linaro.org>
Message-ID: <2024032543-village-reference-960d@gregkh>
References: <20240307094838.688281-1-rmfrfs@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240307094838.688281-1-rmfrfs@gmail.com>
X-Rspamd-Queue-Id: 23B293EE2D
X-Spamd-Bar: /
X-Spamd-Result: default: False [0.50 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:145.40.73.55];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:54825, ipnet:145.40.73.0/24, country:US];
	ARC_NA(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FREEMAIL_CC(0.00)[lists.linaro.org,rosalinux.ru,lists.linux.dev,ieee.org,gmail.com];
	FROM_EQ_ENVFROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_FIVE(0.00)[6];
	DKIM_TRACE(0.00)[linuxfoundation.org:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: HVJWZBEVCV2ZESSHRPA75JL5WOTJ6T4P
X-Message-ID-Hash: HVJWZBEVCV2ZESSHRPA75JL5WOTJ6T4P
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: greybus-dev@lists.linaro.org, Mikhail Lobanov <m.lobanov@rosalinux.ru>, linux-staging@lists.linux.dev
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] greybus: lights: check return of get_channel_from_mode
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/HVJWZBEVCV2ZESSHRPA75JL5WOTJ6T4P/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Mar 07, 2024 at 09:48:13AM +0000, Rui Miguel Silva wrote:
> If channel for the given node is not found we return null from
> get_channel_from_mode. Make sure we validate the return pointer
> before using it in two of the missing places.
> 
> This was originally reported in [0]:
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
> 
> [0] https://lore.kernel.org/all/20240301190425.120605-1-m.lobanov@rosalinux.ru
> 
> Fixes: 2870b52bae4c ("greybus: lights: add lights implementation")
> Reported-by: Mikhail Lobanov <m.lobanov@rosalinux.ru>
> Suggested-by: Mikhail Lobanov <m.lobanov@rosalinux.ru>
> Suggested-by: Alex Elder <elder@ieee.org>
> Signed-off-by: Rui Miguel Silva <rmfrfs@gmail.com>
> ---
>  drivers/staging/greybus/light.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/greybus/light.c b/drivers/staging/greybus/light.c
> index c6bd86a5335a..6f10b9e2c053 100644
> --- a/drivers/staging/greybus/light.c
> +++ b/drivers/staging/greybus/light.c
> @@ -147,6 +147,9 @@ static int __gb_lights_flash_brightness_set(struct gb_channel *channel)
>  		channel = get_channel_from_mode(channel->light,
>  						GB_CHANNEL_MODE_TORCH);
>  
> +	if (!channel)
> +		return -EINVAL;
> +
>  	/* For not flash we need to convert brightness to intensity */
>  	intensity = channel->intensity_uA.min +
>  			(channel->intensity_uA.step * channel->led->brightness);
> @@ -549,7 +552,8 @@ static int gb_lights_light_v4l2_register(struct gb_light *light)
>  	}
>  
>  	channel_flash = get_channel_from_mode(light, GB_CHANNEL_MODE_FLASH);
> -	WARN_ON(!channel_flash);
> +	if (WARN_ON(!channel_flash))
> +		return -EINVAL;

We should NOT crash machines just because of this, the WARN_ON() should
be removed and just properly handle the error please.

thanks,

greg k-h
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
