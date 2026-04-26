Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eWmlGWne7ml7ywAAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Mon, 27 Apr 2026 05:56:25 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id F041946CACE
	for <lists+greybus-dev@lfdr.de>; Mon, 27 Apr 2026 05:56:24 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 94C15406A1
	for <lists+greybus-dev@lfdr.de>; Mon, 27 Apr 2026 03:50:49 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by lists.linaro.org (Postfix) with ESMTPS id 7B071404CD
	for <greybus-dev@lists.linaro.org>; Mon, 27 Apr 2026 03:50:42 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=NZat1Kie;
	dmarc=pass (policy=none) header.from=linuxfoundation.org;
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 172.234.252.31 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F275A40AB4;
	Mon, 27 Apr 2026 03:50:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA41BC19425;
	Mon, 27 Apr 2026 03:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1777261841;
	bh=B0IFs5cZ2XtSKxOZ07ren8gz6btXM9tKZXA5/R9FPl4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NZat1Kie8p0FT5DVKOUY3R7A+ATfRmV7jA6K8KQL/22boRUnbFBXAGCPpZd5ni1/j
	 FrVNLfAgHlv9lCKhCQCreQNFZ1xbGTnCt2GAvn1e53lZwUyJAUWOGMJw12oBmk50ym
	 3PC113gwO+Z9AEaLA86QBSvOxbc5EUyGlCyYuiVk=
Date: Sun, 26 Apr 2026 21:18:05 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Kosugi Souta <k.souta0926@gmail.com>
Message-ID: <2026042657-eldercare-staunch-20f0@gregkh>
References: <2026033032-rethink-jogging-f3b0@gregkh>
 <20260404005939.116701-1-k.souta0926@gmail.com>
 <20260404005939.116701-2-k.souta0926@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260404005939.116701-2-k.souta0926@gmail.com>
X-Spamd-Bar: /
Message-ID-Hash: DSNCWTSY54M66WRUMF6CV3W3QDMSWNE6
X-Message-ID-Hash: DSNCWTSY54M66WRUMF6CV3W3QDMSWNE6
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v3 1/2] staging: greybus: fix unsigned long long type warning
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/DSNCWTSY54M66WRUMF6CV3W3QDMSWNE6/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: F041946CACE
X-Rspamd-Action: add header
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [6.59 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[linuxfoundation.org:s=korg];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[linuxfoundation.org : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[greybus-dev];
	NEURAL_HAM(-0.00)[-0.982];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,greybus-dev-bounces@lists.linaro.org];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	DKIM_TRACE(0.00)[linuxfoundation.org:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[checkpatch.pl:url,linaro.org:email,lists.linaro.org:helo,lists.linaro.org:rdns]
X-Spam: Yes

On Sat, Apr 04, 2026 at 09:59:37AM +0900, Kosugi Souta wrote:
> Fix the checkpatch.pl warning "Prefer 'unsigned long long' over
> 'unsigned long long int'". This cleans up the code style in
> authenticate.c.
> 
> Signed-off-by: Kosugi Souta <k.souta0926@gmail.com>
> ---
>  drivers/staging/greybus/Documentation/firmware/authenticate.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/greybus/Documentation/firmware/authenticate.c b/drivers/staging/greybus/Documentation/firmware/authenticate.c
> index 3d2c6f88a138a5..0ef88b7d24de02 100644
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
> -- 
> 2.43.0
> 
> 

Does not apply to the tree anymore :(
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
