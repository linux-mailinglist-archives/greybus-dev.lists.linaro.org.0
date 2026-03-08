Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +IRoAc7FrWkr7QEAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Sun, 08 Mar 2026 19:54:06 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C6CD231C91
	for <lists+greybus-dev@lfdr.de>; Sun, 08 Mar 2026 19:54:05 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id DE3063F82F
	for <lists+greybus-dev@lfdr.de>; Sun,  8 Mar 2026 18:48:58 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by lists.linaro.org (Postfix) with ESMTPS id E31C23F795
	for <greybus-dev@lists.linaro.org>; Sun,  8 Mar 2026 18:48:55 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=r0lNfoNo;
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 172.234.252.31 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org;
	dmarc=pass (policy=none) header.from=linuxfoundation.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 69EEE4439F;
	Sun,  8 Mar 2026 18:48:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E878BC116C6;
	Sun,  8 Mar 2026 18:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1772995735;
	bh=UIW5Y/nitsGt9rpNnO9TUyL4/fetcdl2/J6gG7vz2h4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r0lNfoNoeNOMI/5bsO6TWmJM7kpib4F055kprMVgCyEDW+IvSxX8uq97t2RrEm2CZ
	 3uLHJWcDKDoK5544FfJHVgUoc67oCaa5gOpQ3cp8pL2WwzD/gM4+U3Y48EKAOpuzuK
	 8FpDhXQHro7cMxwiBTJSxEZr1WS/rk4pYkna84zg=
Date: Sun, 8 Mar 2026 19:48:52 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Prithvi Tambewagh <activprithvi@gmail.com>
Message-ID: <2026030840-linked-curliness-3f47@gregkh>
References: <20260301095154.144809-1-activprithvi@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260301095154.144809-1-activprithvi@gmail.com>
X-Spamd-Bar: /
Message-ID-Hash: M2GTZKRUBSOYBRCMU42DU2AWLMZN2Y27
X-Message-ID-Hash: M2GTZKRUBSOYBRCMU42DU2AWLMZN2Y27
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org, david.hunter.linux@gmail.com, khalid@kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: standardize data type and fix alignment to parentheses
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/M2GTZKRUBSOYBRCMU42DU2AWLMZN2Y27/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 6C6CD231C91
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [6.59 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[linuxfoundation.org:s=korg];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx:c];
	DMARC_POLICY_SOFTFAIL(0.10)[linuxfoundation.org : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	GREYLIST(0.00)[pass,meta];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	RCPT_COUNT_SEVEN(0.00)[10];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,greybus-dev-bounces@lists.linaro.org];
	FREEMAIL_CC(0.00)[kernel.org,lists.linaro.org,lists.linux.dev,vger.kernel.org,linuxfoundation.org,gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_SPAM(0.00)[0.961];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linaro.org:rdns,lists.linaro.org:helo,linaro.org:email]
X-Rspamd-Action: add header
X-Spam: Yes

On Sun, Mar 01, 2026 at 03:21:54PM +0530, Prithvi Tambewagh wrote:
> Standardize code in the file:
> drivers/staging/greybus/Documentation/firmware/authenticate.c
> by making the following changes:
> 
> 1. Remove redundant 'int' from 'unsigned long long int' as suggested by
>    checkpatch when printing the obtained device UID:
>    printf("UID received: 0x%llx\n", *(unsigned long long *)(uid.uid));
> 
> 2. Fix alignment of multi-line printf statement to match opening
>    parentheses:
>    printf("Authenticated, result (%02x), sig-size (%02x)\n",
>           authenticate.result_code, authenticate.signature_size);
> 
> Signed-off-by: Prithvi Tambewagh <activprithvi@gmail.com>
> ---
>  drivers/staging/greybus/Documentation/firmware/authenticate.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/greybus/Documentation/firmware/authenticate.c b/drivers/staging/greybus/Documentation/firmware/authenticate.c
> index 3d2c6f88a138..ba4b16b04557 100644
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
> @@ -85,7 +85,7 @@ int main(int argc, char *argv[])
>  	}
>  
>  	printf("Authenticated, result (%02x), sig-size (%02x)\n",
> -		authenticate.result_code, authenticate.signature_size);
> +	       authenticate.result_code, authenticate.signature_size);
>  
>  close_fd:
>  	close(fd);
> 
> base-commit: eb71ab2bf72260054677e348498ba995a057c463
> -- 
> 2.34.1
> 
> 

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- Your patch did many different things all at once, making it difficult
  to review.  All Linux kernel patches need to only do one thing at a
  time.  If you need to do multiple things (such as clean up all coding
  style issues in a file/driver), do it in a sequence of patches, each
  one doing only one thing.  This will make it easier to review the
  patches to ensure that they are correct, and to help alleviate any
  merge issues that larger patches can cause.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
