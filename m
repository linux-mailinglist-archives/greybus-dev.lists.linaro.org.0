Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id D0BD678516E
	for <lists+greybus-dev@lfdr.de>; Wed, 23 Aug 2023 09:25:13 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id B965943FD7
	for <lists+greybus-dev@lfdr.de>; Wed, 23 Aug 2023 07:25:12 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	by lists.linaro.org (Postfix) with ESMTPS id 77FCA3F5BD
	for <greybus-dev@lists.linaro.org>; Wed, 23 Aug 2023 07:25:05 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=LWyMlhWR;
	spf=pass (lists.linaro.org: domain of johan@kernel.org designates 139.178.84.217 as permitted sender) smtp.mailfrom=johan@kernel.org;
	dmarc=pass (policy=none) header.from=kernel.org
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0D09164994;
	Wed, 23 Aug 2023 07:25:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AD3BC433C7;
	Wed, 23 Aug 2023 07:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692775504;
	bh=1studFEeQMbmLRoPYWeUq2xQ+7OX2VLP9fugdfnqMkE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LWyMlhWRv6sXMsR1yMY0M9pZpNmcpuiFGEDlVRBO4ODn9UpeuaWafzD6RukGWnyDg
	 PD0UtLcmgoyihQa3WbjhfDgV8NYgm03/Wr/rieFEDyRZT/R61YE5jdIQWvJuejV0Lt
	 yvDtExPHqxNWIMWIDxuYITnvaSL7zgXCS14NZj/RX5DlzX7bDlitsl9BOfLlAtLcIn
	 8wHhUZ7wrp2I9JCozw7Q/hLK674mQQX1Jj3jdt7zTAAaZYLONydoLMzgHJaZ7WAwjG
	 hyQRQAcJtEnmGcOHjAsp+aIBGs5X2OPXUyubrhgJ6+jowHRj31YFcYQg6S1AEWkEu2
	 niB3JP7EqEV+A==
Received: from johan by theta with local (Exim 4.96)
	(envelope-from <johan@kernel.org>)
	id 1qYiEX-0007eb-1b;
	Wed, 23 Aug 2023 09:24:53 +0200
Date: Wed, 23 Aug 2023 09:24:53 +0200
From: Johan Hovold <johan@kernel.org>
To: Yang Yingliang <yangyingliang@huawei.com>
Message-ID: <ZOW0ReI1EUM70YGm@hovoldconsulting.com>
References: <20230811070826.739049-1-yangyingliang@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230811070826.739049-1-yangyingliang@huawei.com>
X-Rspamd-Queue-Id: 77FCA3F5BD
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.50 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,none];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+a:dfw.source.kernel.org];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:54825, ipnet:139.178.80.0/21, country:US];
	TAGGED_RCPT(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[lists.linux.dev,lists.linaro.org,gmail.com,kernel.org,linuxfoundation.org];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: AWRQFCZCATYN45ROXBDZTGK47LDEOCUH
X-Message-ID-Hash: AWRQFCZCATYN45ROXBDZTGK47LDEOCUH
X-MailFrom: johan@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: linux-staging@lists.linux.dev, greybus-dev@lists.linaro.org, hvaibhav.linux@gmail.com, elder@kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH -next] staging: greybus: arche-apb-ctrl: remove unnecessary platform_set_drvdata()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/AWRQFCZCATYN45ROXBDZTGK47LDEOCUH/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Aug 11, 2023 at 03:08:26PM +0800, Yang Yingliang wrote:
> Remove unnecessary platform_set_drvdata(..., NULL) in ->remove(),
> the driver_data will be cleared in device_unbind_cleanup() after
> calling ->remove() in driver call code.

s/call/core/
 
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---
>  drivers/staging/greybus/arche-apb-ctrl.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/staging/greybus/arche-apb-ctrl.c b/drivers/staging/greybus/arche-apb-ctrl.c
> index 8541995008da..5c77c1813214 100644
> --- a/drivers/staging/greybus/arche-apb-ctrl.c
> +++ b/drivers/staging/greybus/arche-apb-ctrl.c
> @@ -423,7 +423,6 @@ static void arche_apb_ctrl_remove(struct platform_device *pdev)
>  {
>  	device_remove_file(&pdev->dev, &dev_attr_state);
>  	poweroff_seq(pdev);
> -	platform_set_drvdata(pdev, NULL);
>  }

Should be ok:

Reviewed-by: Johan Hovold <johan@kernel.org>

Johan
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
