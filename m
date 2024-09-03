Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id A182396A60A
	for <lists+greybus-dev@lfdr.de>; Tue,  3 Sep 2024 20:01:01 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id AEBB23F485
	for <lists+greybus-dev@lfdr.de>; Tue,  3 Sep 2024 18:01:00 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	by lists.linaro.org (Postfix) with ESMTPS id AF8FC3F485
	for <greybus-dev@lists.linaro.org>; Tue,  3 Sep 2024 18:00:56 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=jcqh2llS;
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 147.75.193.91 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org;
	dmarc=pass (policy=none) header.from=linuxfoundation.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 448D6A43D25;
	Tue,  3 Sep 2024 18:00:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84EE3C4CEC4;
	Tue,  3 Sep 2024 18:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1725386456;
	bh=bpfYOFFePq66fzrqBBk9gBOxUfPmCQJRHRGFWc1CQ/8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jcqh2llSkOZwJRa4zncRAvJtl0vyp0PMI0HPQThmCmVMtnTHbGaJnb/NGlGgjjyvY
	 RxksYRIdomHzWli5T9rsKkRaQmJkQLs+ljpn9WfawdjvfmPrqJYlF/0dfkfT0vUedk
	 0FWOoMFrxT7svKTyZpJix2fNd6DAKZIv3k6N7W9k=
Date: Tue, 3 Sep 2024 20:00:52 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Li Zetao <lizetao1@huawei.com>
Message-ID: <2024090322-driven-scallion-8a06@gregkh>
References: <20240903144019.2005320-1-lizetao1@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240903144019.2005320-1-lizetao1@huawei.com>
X-Rspamd-Action: no action
X-Spamd-Bar: ---
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: AF8FC3F485
X-Spamd-Result: default: False [-3.50 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip4:147.75.193.91];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:54825, ipnet:147.75.192.0/21, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+]
Message-ID-Hash: N6EJRZ2V3CR4XQ254PEKIMAHRGI6HKIW
X-Message-ID-Hash: N6EJRZ2V3CR4XQ254PEKIMAHRGI6HKIW
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH -next] greybus: Remove redundant null pointer checks in gb_svc_pwrmon_debugfs_init()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/N6EJRZ2V3CR4XQ254PEKIMAHRGI6HKIW/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Sep 03, 2024 at 10:40:19PM +0800, Li Zetao wrote:
> Since the debugfs_create_dir() never returns a null pointer, checking
> the return value for a null pointer is redundant, and using IS_ERR is
> safe enough.
> 
> Signed-off-by: Li Zetao <lizetao1@huawei.com>
> ---
>  drivers/greybus/svc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/greybus/svc.c b/drivers/greybus/svc.c
> index 4256467fcd35..906ea61cba30 100644
> --- a/drivers/greybus/svc.c
> +++ b/drivers/greybus/svc.c
> @@ -765,7 +765,7 @@ static void gb_svc_pwrmon_debugfs_init(struct gb_svc *svc)
>  	u8 rail_count;
>  
>  	dent = debugfs_create_dir("pwrmon", svc->debugfs_dentry);
> -	if (IS_ERR_OR_NULL(dent))
> +	if (IS_ERR(dent))
>  		return;

Really the value should not be checked at all, nothing different should
happen if, or if not, debugfs is working.

So perhaps just remove the check?

thanks,

greg k-h
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
