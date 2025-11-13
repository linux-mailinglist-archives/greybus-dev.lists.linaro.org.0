Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B48C579E4
	for <lists+greybus-dev@lfdr.de>; Thu, 13 Nov 2025 14:20:14 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 2C9C73F80C
	for <lists+greybus-dev@lfdr.de>; Thu, 13 Nov 2025 13:20:13 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by lists.linaro.org (Postfix) with ESMTPS id 2099F3F77A
	for <greybus-dev@lists.linaro.org>; Thu, 13 Nov 2025 13:20:10 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=QPpjVZ3k;
	dmarc=pass (policy=none) header.from=linuxfoundation.org;
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 172.105.4.254 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A6B6C60210;
	Thu, 13 Nov 2025 13:20:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 351FAC4CEFB;
	Thu, 13 Nov 2025 13:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1763040009;
	bh=ekjGudGOri5L0SYWYsS/gxUuyFFk1MVNHVKXjFcCVeI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QPpjVZ3kFE4ilb4q6XM7C6ygRZnFpk9yWF0MwqG34xkFybxa5G0+3b9S/6Md+jcCC
	 QVCorVSCoVJHKcofJJYjZKgh7aSpt0BEeZlnr4WFS5pvVfOw2LjNftEI0qaZvTiId7
	 Mt1zMSehkiDL1kZBn7yH+s1v6e5u51+S/U5Mbrv8=
Date: Thu, 13 Nov 2025 08:20:07 -0500
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Chang Junzheng <guagua210311@qq.com>
Message-ID: <2025111341-attendee-ferment-262b@gregkh>
References: <tencent_7710B04B6BEE52903BA2F56376DB9D18A907@qq.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <tencent_7710B04B6BEE52903BA2F56376DB9D18A907@qq.com>
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 2099F3F77A
X-Spamd-Bar: ++
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.00 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.4.254];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_CC(0.00)[lists.linux.dev,gmail.com,animalcreek.com,kernel.org,lists.linaro.org,vger.kernel.org,outlook.com];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.0.0/19, country:SG];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[];
	FREEMAIL_TO(0.00)[qq.com];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_HAS_DN(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[linuxfoundation.org:+]
X-Spam-Level: **
Message-ID-Hash: AHY5N6K4PRA52LMWF2BJVFCEKUSZJFYQ
X-Message-ID-Hash: AHY5N6K4PRA52LMWF2BJVFCEKUSZJFYQ
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: outreachy@lists.linux.dev, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Chang Junzheng <guagua210311@outlook.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: audio_manager_module: make envp array static const
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/AHY5N6K4PRA52LMWF2BJVFCEKUSZJFYQ/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Nov 13, 2025 at 09:01:46PM +0800, Chang Junzheng wrote:
> From: Chang Junzheng <guagua210311@outlook.com>
> 
> The envp array in send_add_uevent() function is declared as a non-const
> local array, which triggers the following checkpatch.pl warning:
> 
> WARNING: char * array declaration might be better as static const
> 
> Change the declaration to 'static const char * const' to improve code
> safety by making the array read-only and allow for better compiler
> optimization. This follows the kernel coding style recommendations.
> 
> Signed-off-by: Chang Junzheng <guagua210311@qq.com>

You sent this twice?

> ---
>  drivers/staging/greybus/audio_manager_module.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/staging/greybus/audio_manager_module.c b/drivers/staging/greybus/audio_manager_module.c
> index 4a4dfb42f50f..ca6a2cd0bc4f 100644
> --- a/drivers/staging/greybus/audio_manager_module.c
> +++ b/drivers/staging/greybus/audio_manager_module.c
> @@ -159,14 +159,14 @@ static void send_add_uevent(struct gb_audio_manager_module *module)
>  	char ip_devices_string[64];
>  	char op_devices_string[64];
>  
> -	char *envp[] = {
> -		name_string,
> -		vid_string,
> -		pid_string,
> -		intf_id_string,
> -		ip_devices_string,
> -		op_devices_string,
> -		NULL
> +	static const char * const envp[] = {
> +						name_string,
> +						vid_string,
> +						pid_string,
> +						intf_id_string,
> +						ip_devices_string,
> +						op_devices_string,
> +						NULL

Why did you indent this?

thanks,

greg k-h
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
