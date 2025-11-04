Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AD56C30823
	for <lists+greybus-dev@lfdr.de>; Tue, 04 Nov 2025 11:29:21 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 1A3E53F73B
	for <lists+greybus-dev@lfdr.de>; Tue,  4 Nov 2025 10:29:20 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by lists.linaro.org (Postfix) with ESMTPS id 741513F73B
	for <greybus-dev@lists.linaro.org>; Tue,  4 Nov 2025 10:29:15 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=U3G1cM2r;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (lists.linaro.org: domain of johan@kernel.org designates 172.105.4.254 as permitted sender) smtp.mailfrom=johan@kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 002BE600AC;
	Tue,  4 Nov 2025 10:29:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0361C116B1;
	Tue,  4 Nov 2025 10:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762252154;
	bh=ZvgrGlX+pY1sb/eE7IG6GO3T1HRtlfCFy+ccRd/1UpI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U3G1cM2r1KT8NVg0CVB/YWTIbPDqI2nJA/N4IOEgZmbgwBJL6b17+J1lxY9OREUQN
	 pMiMKBSNOIfE9wceaB8ZkTG1qWdD6bEKSBLhVCrsaXnAuRrcZiXGs4k6Pa5f0sGC0U
	 Y2b6EsMo08ZbjC3nCXtaqpskSZqkkyrag+Wi7FcS8ouU15XC6N+KqFG5z/SL+CzMur
	 ccU1g/8KnqSez/+V4HTydjmp1zeiksFeYt5rYpwe43S8RihkFl3hLdJlgODCR+cGOW
	 URzKFSDSkMB++ywmnnTXlmvafUMIg/d6kP6zvTEiCJJx3bnq/vnmmyCl9RACJmBCzv
	 JYjcCGyDQrtIA==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vGEHt-000000006XV-3EyI;
	Tue, 04 Nov 2025 11:29:17 +0100
Date: Tue, 4 Nov 2025 11:29:17 +0100
From: Johan Hovold <johan@kernel.org>
To: Haotian Zhang <vulab@iscas.ac.cn>
Message-ID: <aQnVfdHKk7TD0JwM@hovoldconsulting.com>
References: <20251104090825.224-1-vulab@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251104090825.224-1-vulab@iscas.ac.cn>
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 741513F73B
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.50 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.4.254];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.10)[text/plain];
	TAGGED_RCPT(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.0.0/19, country:SG];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_THREE(0.00)[3];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,linuxfoundation.org,lists.linaro.org,lists.linux.dev,vger.kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DNSWL_BLOCKED(0.00)[172.105.4.254:from,100.75.92.58:received];
	URIBL_BLOCKED(0.00)[iscas.ac.cn:email];
	DKIM_TRACE(0.00)[kernel.org:+]
X-Rspamd-Action: no action
Message-ID-Hash: 4IX7P46BOTK4IE7XDV56VR5MPIF6S47V
X-Message-ID-Hash: 4IX7P46BOTK4IE7XDV56VR5MPIF6S47V
X-MailFrom: johan@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Vaibhav Hiremath <hvaibhav.linux@gmail.com>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: arche-platform: fix pm_notifier leak in probe error path
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/4IX7P46BOTK4IE7XDV56VR5MPIF6S47V/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Nov 04, 2025 at 05:08:25PM +0800, Haotian Zhang wrote:
> In arche_platform_probe(), if arche_platform_coldboot_seq() fails after
> register_pm_notifier() succeeds, the function returns without unregistering
> the pm_notifier, leading to a resource leak.
> 
> Add unregister_pm_notifier() call in the err_coldboot error path to
> properly clean up the registered notifier on failure.
> 
> Fixes: d29b67d44a7c ("greybus: arche-platform: Add support for init-off feature")
> Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
> ---
>  drivers/staging/greybus/arche-platform.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/staging/greybus/arche-platform.c b/drivers/staging/greybus/arche-platform.c
> index d48464390f58..9c5bb5dae187 100644
> --- a/drivers/staging/greybus/arche-platform.c
> +++ b/drivers/staging/greybus/arche-platform.c
> @@ -545,6 +545,7 @@ static int arche_platform_probe(struct platform_device *pdev)
>  	return 0;
>  
>  err_coldboot:
> +	unregister_pm_notifier(&arche_pdata->pm_notifier);
>  	mutex_unlock(&arche_pdata->platform_state_mutex);

This looks mostly correct, but please make sure to release the lock
before deregistering the notifier so that things are unwound in reverse
order.

It would be even better to move the mutex unlock to where the driver
jumps to err_coldboot since it is only held in that conditional since
the offending commit.

>  err_device_remove:
>  	device_remove_file(&pdev->dev, &dev_attr_state);

Johan
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
