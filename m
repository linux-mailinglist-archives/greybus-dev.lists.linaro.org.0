Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id AA271C6057F
	for <lists+greybus-dev@lfdr.de>; Sat, 15 Nov 2025 14:17:22 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id A02633F7DE
	for <lists+greybus-dev@lfdr.de>; Sat, 15 Nov 2025 13:17:21 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by lists.linaro.org (Postfix) with ESMTPS id A6D2B3F69B
	for <greybus-dev@lists.linaro.org>; Sat, 15 Nov 2025 13:17:15 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=0aqm31J0;
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 172.105.4.254 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org;
	dmarc=pass (policy=none) header.from=linuxfoundation.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3910B60052;
	Sat, 15 Nov 2025 13:17:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B995C113D0;
	Sat, 15 Nov 2025 13:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1763212634;
	bh=8oG8Uauz3t6zi4rCZpI7TfWEbCPWnsJwuEQVEx/mnxo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=0aqm31J0iX9WgkwAvdvMKk8Un3eJg5mznmTiWLj7P35U+1YsvvLyPMGKYh3JGUgZ7
	 sRE6PT+PLe8Thb4vj4/dAUzTnmKz+cjLfRx/U9EygE7/iZ/Rv/CH1MdD/kaehhFBmZ
	 ADVt+3VtXm+WJ0xw7W8t8tVwpGVFO9AcPWf/BimQ=
Date: Sat, 15 Nov 2025 08:17:11 -0500
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Chang Junzheng <guagua210311@qq.com>
Message-ID: <2025111500-ladder-siren-1b39@gregkh>
References: <tencent_A64EA96730156BC5D2E33B86752776DB9D07@qq.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <tencent_A64EA96730156BC5D2E33B86752776DB9D07@qq.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.50 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.4.254];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_LAST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_CC(0.00)[lists.linux.dev,gmail.com,animalcreek.com,kernel.org,lists.linaro.org,vger.kernel.org,outlook.com];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_TWO(0.00)[2];
	FREEMAIL_TO(0.00)[qq.com];
	FROM_EQ_ENVFROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+]
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: A6D2B3F69B
X-Spamd-Bar: /
Message-ID-Hash: Q7RW3IPYCO4RA5VIVHBVQ5CCG3C4XDBL
X-Message-ID-Hash: Q7RW3IPYCO4RA5VIVHBVQ5CCG3C4XDBL
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: outreachy@lists.linux.dev, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Chang Junzheng <guagua210311@outlook.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v2] staging: greybus: audio_manager_module: make envp array static const
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/Q7RW3IPYCO4RA5VIVHBVQ5CCG3C4XDBL/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Nov 14, 2025 at 09:40:43AM +0800, Chang Junzheng wrote:
> From: Chang Junzheng <guagua210311@outlook.com>
> 
> Fix checkpatch.pl warning by changing envp array declaration to
> static const char * const. This improves code safety and follows
> kernel coding style recommendations.
> 
> Signed-off-by: Chang Junzheng <guagua210311@qq.com>
> ---
> Changes in v2:
> - Restored original indentation of array elements
> - Only changed the array declaration as originally intended
> 
>  drivers/staging/greybus/audio_manager_module.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/staging/greybus/audio_manager_module.c b/drivers/staging/greybus/audio_manager_module.c
> index 4a4dfb42f50f..78013d59fc93 100644
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

Did you test build this change?  Why not?
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
