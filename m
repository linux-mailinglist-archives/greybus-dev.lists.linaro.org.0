Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 7360EC819CF
	for <lists+greybus-dev@lfdr.de>; Mon, 24 Nov 2025 17:38:10 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 4F0973F849
	for <lists+greybus-dev@lfdr.de>; Mon, 24 Nov 2025 16:38:09 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by lists.linaro.org (Postfix) with ESMTPS id 981B13EA32
	for <greybus-dev@lists.linaro.org>; Mon, 24 Nov 2025 16:38:02 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=GhAOBw1m;
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 172.234.252.31 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org;
	dmarc=pass (policy=none) header.from=linuxfoundation.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 01FDA40705;
	Mon, 24 Nov 2025 16:38:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D250C4CEF1;
	Mon, 24 Nov 2025 16:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1764002281;
	bh=wQugYOHXFig3DIQ59puMZSl2HrVTJpj7XoRftj0gVo8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GhAOBw1mpm38xM+ZHumHsfsqt2Am+3HEtP26jnyQoHljbCF5srYGzi1QqfEzT37/1
	 tB3x0WjgfgWvqZcy4/7qnS812GVnl8HBJiAa8LzqNox4SRRuzj0zrFeB0EysYGWq+a
	 bRIP0sN/jmk2by607mLrNeszT1LKwwvYks1BM21o=
Date: Mon, 24 Nov 2025 17:37:25 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Sameeksha Sankpal <sameekshasankpal@gmail.com>
Message-ID: <2025112407-gratify-demanding-c817@gregkh>
References: <20251122083814.49753-1-sameekshasankpal@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251122083814.49753-1-sameekshasankpal@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.50 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.252.31];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,animalcreek.com,kernel.org,lists.linaro.org,lists.linux.dev,vger.kernel.org];
	RCPT_COUNT_SEVEN(0.00)[8];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+]
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 981B13EA32
X-Spamd-Bar: /
Message-ID-Hash: V457GSW6436N36PEO3MLZBC3NZQPA6EK
X-Message-ID-Hash: V457GSW6436N36PEO3MLZBC3NZQPA6EK
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: audio_manager: make envp[] static const
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/V457GSW6436N36PEO3MLZBC3NZQPA6EK/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Nov 22, 2025 at 02:08:13PM +0530, Sameeksha Sankpal wrote:
> The envp[] array contains string literals and is never modified.
> Declare it as 'static const char * const' to place it in read-only
> memory and avoid unnecessary stack usage.
> 
> This fixes a checkpatch warning:
> "char * array declaration might be better as static const"
> 
> Signed-off-by: Sameeksha Sankpal <sameekshasankpal@gmail.com>
> ---
>  drivers/staging/greybus/audio_manager_module.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/greybus/audio_manager_module.c b/drivers/staging/greybus/audio_manager_module.c
> index 4a4dfb42f50f..1b83c05f2434 100644
> --- a/drivers/staging/greybus/audio_manager_module.c
> +++ b/drivers/staging/greybus/audio_manager_module.c
> @@ -159,7 +159,7 @@ static void send_add_uevent(struct gb_audio_manager_module *module)
>  	char ip_devices_string[64];
>  	char op_devices_string[64];
>  
> -	char *envp[] = {
> +	static const char * const envp[] = {
>  		name_string,
>  		vid_string,
>  		pid_string,
> -- 
> 2.43.0
> 
> 

Any specific reason why you did not build this patch before submitting
it?  Please always do so.

thanks,

greg k-h
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
