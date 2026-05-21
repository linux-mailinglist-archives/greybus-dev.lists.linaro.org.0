Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8CYmNsDODmq7CQYAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Thu, 21 May 2026 11:22:08 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 671025A23A8
	for <lists+greybus-dev@lfdr.de>; Thu, 21 May 2026 11:22:08 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 739C440983
	for <lists+greybus-dev@lfdr.de>; Thu, 21 May 2026 09:22:07 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by lists.linaro.org (Postfix) with ESMTPS id 5E8294044C
	for <greybus-dev@lists.linaro.org>; Thu, 21 May 2026 09:22:03 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=gmbAu1A6;
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 172.105.4.254 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org;
	dmarc=pass (policy=none) header.from=linuxfoundation.org
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 065CF601F4;
	Thu, 21 May 2026 09:22:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4337F1F000E9;
	Thu, 21 May 2026 09:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1779355322;
	bh=3x85B8ZNcso/Z/jHyiuGnO8WMljjjgSK4PnnDC9FgjI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gmbAu1A6ltLfgI1xiabBy9rG7Ji1F54Go83ALa1ePhQCX4codfqmb+8lMYM3h8oxR
	 2Yq1QYBOn8Om1YN0PId/yOkgOfkaR0JT0DEYTiX/T7SXWaC/Mw6MEjCFFCKl5HvOXj
	 nOpA59Xd4XPcjuB59HkkhrXDSuFV9eEppjfnFKhU=
Date: Thu, 21 May 2026 11:22:05 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Alexander A. Klimov" <grandmaster@al2klimov.de>
Message-ID: <2026052100-alongside-magician-527f@gregkh>
References: <c758029d-186f-4a9f-b953-90121f43d8d8@al2klimov.de>
 <agGdJFofiZYKqqhr@stanley.mountain>
 <c17dd24c-2bf1-4ef8-a8d3-79014a75242f@al2klimov.de>
 <2026051243-factual-lyricism-6c54@gregkh>
 <381ed71b-1db1-45d3-a9be-bf2f8018a611@al2klimov.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <381ed71b-1db1-45d3-a9be-bf2f8018a611@al2klimov.de>
X-Spamd-Bar: /
Message-ID-Hash: 56GO2KRKHL37VGFNWBVMHCFVL32QFK56
X-Message-ID-Hash: 56GO2KRKHL37VGFNWBVMHCFVL32QFK56
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Dan Carpenter <error27@gmail.com>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Pankaj Bharadiya <pankaj.bharadiya@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v3] staging: greybus: audio: correct sscanf() return value check
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/56GO2KRKHL37VGFNWBVMHCFVL32QFK56/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [6.59 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[linuxfoundation.org:s=korg];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+mx];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[linuxfoundation.org : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	ARC_NA(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:-];
	TAGGED_RCPT(0.00)[greybus-dev];
	RCPT_COUNT_SEVEN(0.00)[8];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,greybus-dev-bounces@lists.linaro.org];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,lists.linaro.org,lists.linux.dev,vger.kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	TO_DN_SOME(0.00)[];
	NEURAL_SPAM(0.00)[0.915];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 671025A23A8
X-Rspamd-Action: add header
X-Rspamd-Server: lfdr
X-Spam: Yes

On Tue, May 12, 2026 at 09:15:54PM +0200, Alexander A. Klimov wrote:
> manager_sysfs_add_store() passes 6 pointers to sscanf(),
> but required latter to return 7 which always failed the operation.
> I corrected it to 6.
> 
> Fixes: 49b9137a6002 ("staging: greybus: audio: remove redundant slot field")
> Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>
> ---
>  v2: added "Fixes:" to commit message
>  v3: added all these v2/v3 lines here as requested by Greg KH
>  v3: while on it, replaced title "Greybus audio protocols drivers:" ...
>  v3: ... with "staging: greybus: audio:"
> 
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

Does not apply to my tree :(
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
