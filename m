Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 207786F6E55
	for <lists+greybus-dev@lfdr.de>; Thu,  4 May 2023 16:54:18 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 3044B44358
	for <lists+greybus-dev@lfdr.de>; Thu,  4 May 2023 14:54:17 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	by lists.linaro.org (Postfix) with ESMTPS id 9D20D3EF1C
	for <greybus-dev@lists.linaro.org>; Thu,  4 May 2023 14:54:13 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b="RGc7/jfZ";
	spf=pass (lists.linaro.org: domain of johan@kernel.org designates 139.178.84.217 as permitted sender) smtp.mailfrom=johan@kernel.org;
	dmarc=pass (policy=none) header.from=kernel.org
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5003862C76;
	Thu,  4 May 2023 14:54:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC219C433D2;
	Thu,  4 May 2023 14:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683212052;
	bh=TmACzxlSeb+WERvLsvXQwELOey/j51OsQ52OPnlwneM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RGc7/jfZgBMqdOT/Q8ZklvtXELuPyC9G8Adup84Tf9khzhzWdDv88vQQ9IDmJm1Sf
	 1n4pccodaWrjOOxU2AuhH0AhIf+m75+vtQOctPrO6jmPvVaoQPuaazFvTkDj3ZNCcs
	 KxlZJowPBY61AortnBGbZBlPSZKNmF2RT4k+MD6kTJmdctso3MMxdpxf+KgWg7YI3t
	 h7TvpRp4hQ3t65AbR3jzyG4LkkR10bddkOijzbDvowHKWwjpWhdRqbA1jpg/nWKPh7
	 p91/odYPl18phx6XoRXPLc0MerVB7Vh/KE/eL4BlsoeVvQy/kkeOMc6FRbd/DjbBIr
	 ANWGE77uzyqFQ==
Received: from johan by xi.lan with local (Exim 4.94.2)
	(envelope-from <johan@kernel.org>)
	id 1puaLc-0004eW-Oc; Thu, 04 May 2023 16:54:21 +0200
Date: Thu, 4 May 2023 16:54:20 +0200
From: Johan Hovold <johan@kernel.org>
To: Dongliang Mu <dzm91@hust.edu.cn>
Message-ID: <ZFPHHImqiVRRV5Cd@hovoldconsulting.com>
References: <20230504135841.1566958-1-dzm91@hust.edu.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230504135841.1566958-1-dzm91@hust.edu.cn>
X-Spamd-Result: default: False [-9.50 / 15.00];
	DWL_DNSWL_HI(-3.50)[kernel.org:dkim];
	BAYES_HAM(-3.00)[100.00%];
	RCVD_DKIM_ARC_DNSWL_HI(-1.00)[];
	RCVD_IN_DNSWL_HI(-1.00)[139.178.84.217:from,52.25.139.140:received];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,none];
	R_SPF_ALLOW(-0.20)[+a:dfw.source.kernel.org];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.10)[text/plain];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:54825, ipnet:139.178.80.0/21, country:US];
	FROM_EQ_ENVFROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 9D20D3EF1C
X-Spamd-Bar: ---------
Message-ID-Hash: HNYT3RCIUGU6XGTJDKN2HDZ4O7MI7DQN
X-Message-ID-Hash: HNYT3RCIUGU6XGTJDKN2HDZ4O7MI7DQN
X-MailFrom: johan@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Alex Elder <elder@kernel.org>, Jacopo Mondi <jacopo.mondi@linaro.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Greg Kroah-Hartman <gregkh@google.com>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] drivers: staging: greybus: fix GPF issue in gb_camera_capture
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/HNYT3RCIUGU6XGTJDKN2HDZ4O7MI7DQN/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, May 04, 2023 at 09:58:41PM +0800, Dongliang Mu wrote:
> In gb_camera_capture(), it does not check the value of settings
> before dereferencing it. And gb_camera_debugfs_capture calls
> gb_camera_capture with the 6th parameter settings as NULL.

Looks like you just broke gb_camera_debugfs_capture() which relies on
passing NULL as settings.

> Fix this by checking the value of setting at the starting of
> gb_camera_capture.
> 
> Fixes: 3265edaf0d70 ("greybus: Add driver for the camera class protocol")
> Signed-off-by: Dongliang Mu <dzm91@hust.edu.cn>
> ---
>  drivers/staging/greybus/camera.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/greybus/camera.c b/drivers/staging/greybus/camera.c
> index cdbb42cd413b..5a4b26e7f645 100644
> --- a/drivers/staging/greybus/camera.c
> +++ b/drivers/staging/greybus/camera.c
> @@ -659,7 +659,7 @@ static int gb_camera_capture(struct gb_camera *gcam, u32 request_id,
>  	size_t req_size;
>  	int ret;
>  
> -	if (settings_size > GB_CAMERA_MAX_SETTINGS_SIZE)
> +	if (settings_size > GB_CAMERA_MAX_SETTINGS_SIZE || !settings)
>  		return -EINVAL;
>  
>  	req_size = sizeof(*req) + settings_size;

Johan
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
