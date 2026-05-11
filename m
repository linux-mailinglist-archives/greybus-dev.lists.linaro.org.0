Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gJnJF9ONAWpyeAEAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Mon, 11 May 2026 10:05:39 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id F1E84509CA5
	for <lists+greybus-dev@lfdr.de>; Mon, 11 May 2026 10:05:38 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 1189D3F846
	for <lists+greybus-dev@lfdr.de>; Mon, 11 May 2026 08:05:38 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by lists.linaro.org (Postfix) with ESMTPS id D527C3F743
	for <greybus-dev@lists.linaro.org>; Mon, 11 May 2026 08:05:33 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=eBfQkbQW;
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 172.105.4.254 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org;
	dmarc=pass (policy=none) header.from=linuxfoundation.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CAA38600C3;
	Mon, 11 May 2026 07:55:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33940C2BCB0;
	Mon, 11 May 2026 07:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1778486100;
	bh=uTtZfoNIMsGKvElS5H8bVwCKaZfC4pFNFc/Ie5T4nrY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eBfQkbQWmxDE68vSJjBsX8bm8xdIGf2YvECiBfkL3ddYnBlPVK8zrlMbvpW8lA3AI
	 wF4YLiuZ9bE4ezkf0R862mOdyyooqGsIxrOmZybGzebl67RpbFyiKzE8O0+JeAMCRp
	 k+FeUvEBIX9sTsSsPYKkifSl3Esl0LL4qFW7m8ZY=
Date: Mon, 11 May 2026 09:54:58 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Alexander A. Klimov" <grandmaster@al2klimov.de>
Message-ID: <2026051146-pope-shimmy-7c4b@gregkh>
References: <c758029d-186f-4a9f-b953-90121f43d8d8@al2klimov.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c758029d-186f-4a9f-b953-90121f43d8d8@al2klimov.de>
X-Spamd-Bar: /
Message-ID-Hash: OAFEPMWIIXJQPZJ4Q44CZAOBGO24B5X5
X-Message-ID-Hash: OAFEPMWIIXJQPZJ4Q44CZAOBGO24B5X5
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] Greybus audio protocols drivers: correct sscanf() return value check
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/OAFEPMWIIXJQPZJ4Q44CZAOBGO24B5X5/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: F1E84509CA5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [5.09 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	R_DKIM_REJECT(1.00)[linuxfoundation.org:s=korg];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+mx:c];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[linuxfoundation.org : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:-];
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[greybus-dev];
	NEURAL_HAM(-0.00)[-0.993];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,greybus-dev-bounces@lists.linaro.org];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linaro.org:helo,lists.linaro.org:rdns,al2klimov.de:email]
X-Rspamd-Action: no action

On Sun, May 10, 2026 at 08:41:43PM +0200, Alexander A. Klimov wrote:
> manager_sysfs_add_store() passes 6 pointers to sscanf(),
> but required latter to return 7 which always failed the operation.
> I corrected it to 6.
> 
> Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>
> ---
>  drivers/staging/greybus/audio_manager_sysfs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/greybus/audio_manager_sysfs.c b/drivers/staging/greybus/audio_manager_sysfs.c
> index fcd518f954..ff323ca815 100644
> --- a/drivers/staging/greybus/audio_manager_sysfs.c
> +++ b/drivers/staging/greybus/audio_manager_sysfs.c
> @@ -23,7 +23,7 @@ static ssize_t manager_sysfs_add_store(struct kobject *kobj,
>  			desc.name, &desc.vid, &desc.pid, &desc.intf_id,
>  			&desc.ip_devices, &desc.op_devices);
> 
> -	if (num != 7)
> +	if (num != 6)
>  		return -EINVAL;
> 
>  	num = gb_audio_manager_add(&desc);
> -- 
> 2.54.0
> 
> 

Cool, but was this tested?  How has this ever worked?

thanks,

greg k-h
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
