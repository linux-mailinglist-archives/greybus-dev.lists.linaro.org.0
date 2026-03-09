Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +BVMKG3vrmkWKQIAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Mon, 09 Mar 2026 17:03:57 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 37D1E23C628
	for <lists+greybus-dev@lfdr.de>; Mon, 09 Mar 2026 17:03:57 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 2FF1E3F809
	for <lists+greybus-dev@lfdr.de>; Mon,  9 Mar 2026 16:03:56 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by lists.linaro.org (Postfix) with ESMTPS id 6D6133F7B6
	for <greybus-dev@lists.linaro.org>; Mon,  9 Mar 2026 16:03:53 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=ZUCGHCr5;
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 172.105.4.254 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org;
	dmarc=pass (policy=none) header.from=linuxfoundation.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0061960103;
	Mon,  9 Mar 2026 16:03:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A7E0C4CEF7;
	Mon,  9 Mar 2026 16:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773072232;
	bh=SwVP4t0NfembXlAWp1GF3hPUHd/LxFlFHVUj9h+WxcU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZUCGHCr5o1tQAcRM5XosgBjIP/b6MNq7X9eW6OVNKppY1Toth+twFZ+HAFRbf97XB
	 1q4uKirLw8y0UdA0dhzM39E5qqOP8br1U8VimxBesA6fUA6ThYZRj9S/9CF0HbSadT
	 dLt3PVGKXonrHpQcx293AhFKyVcPpLfEWfdsE9yo=
Date: Mon, 9 Mar 2026 17:03:50 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Tomasz Unger <tomasz.unger@yahoo.pl>
Message-ID: <2026030937-deception-tubeless-56bc@gregkh>
References: <20260305-greybus-unsigned-long-long-v1-1-e912b6023fcd.ref@yahoo.pl>
 <20260305-greybus-unsigned-long-long-v1-1-e912b6023fcd@yahoo.pl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260305-greybus-unsigned-long-long-v1-1-e912b6023fcd@yahoo.pl>
X-Spamd-Bar: /
Message-ID-Hash: 6FP22DLEXVFRAHJ5TMH3SEMRZQJMNIIH
X-Message-ID-Hash: 6FP22DLEXVFRAHJ5TMH3SEMRZQJMNIIH
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: Prefer 'unsigned long long' over 'unsigned long long int'
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/6FP22DLEXVFRAHJ5TMH3SEMRZQJMNIIH/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 37D1E23C628
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [5.09 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	R_DKIM_REJECT(1.00)[linuxfoundation.org:s=korg];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx:c];
	DMARC_POLICY_SOFTFAIL(0.10)[linuxfoundation.org : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[yahoo.pl];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:-];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,greybus-dev-bounces@lists.linaro.org];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	NEURAL_SPAM(0.00)[0.993];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linaro.org:rdns,lists.linaro.org:helo,linaro.org:email,checkpatch.pl:url,yahoo.pl:email]
X-Rspamd-Action: no action

On Thu, Mar 05, 2026 at 09:58:19AM +0100, Tomasz Unger wrote:
> Remove redundant 'int' keyword from 'unsigned long long int' type cast.
> 'unsigned long long' and 'unsigned long long int' are identical types
> in C. Prefer the shorter form as suggested by checkpatch.pl --strict.
> 
> Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
> ---
>  drivers/staging/greybus/Documentation/firmware/authenticate.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/greybus/Documentation/firmware/authenticate.c b/drivers/staging/greybus/Documentation/firmware/authenticate.c
> index 3d2c6f88a138..0ef88b7d24de 100644
> --- a/drivers/staging/greybus/Documentation/firmware/authenticate.c
> +++ b/drivers/staging/greybus/Documentation/firmware/authenticate.c
> @@ -58,7 +58,7 @@ int main(int argc, char *argv[])
>  		goto close_fd;
>  	}
>  
> -	printf("UID received: 0x%llx\n", *(unsigned long long int *)(uid.uid));
> +	printf("UID received: 0x%llx\n", *(unsigned long long *)(uid.uid));
>  
>  	/* Get certificate */
>  	printf("Get IMS certificate\n");
> 
> ---
> base-commit: 6ae79e7736ee6a5f920867e5346d8a106cd1db74
> change-id: 20260305-greybus-unsigned-long-long-e7465302d3fa
> 
> Best regards,
> -- 
> Tomasz Unger <tomasz.unger@yahoo.pl>
> 

Someone sent this just before you did:
	https://lore.kernel.org/r/20260304193206.4992-1-rayfraytech@gmail.com

sorry,

greg k-h
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
