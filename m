Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0H15LnNAh2nVVQQAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Sat, 07 Feb 2026 14:38:59 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 5541D106035
	for <lists+greybus-dev@lfdr.de>; Sat, 07 Feb 2026 14:38:59 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 563703F78E
	for <lists+greybus-dev@lfdr.de>; Sat,  7 Feb 2026 13:38:58 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by lists.linaro.org (Postfix) with ESMTPS id 6705D3F78E
	for <greybus-dev@lists.linaro.org>; Sat,  7 Feb 2026 13:38:55 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=otFV0YEa;
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 172.105.4.254 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org;
	dmarc=pass (policy=none) header.from=linuxfoundation.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0C4E96001A;
	Sat,  7 Feb 2026 13:38:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7121C116D0;
	Sat,  7 Feb 2026 13:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1770471534;
	bh=c3BrW7RvTCIAb6OImzo6XVdZAO4auXYrJs2bvJYsUlk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=otFV0YEaIS8m/BJ2sZJX+YSnGK5urIr9+H3FKEhD0gBiRUAeSlyASLvYiWJNF8+Dn
	 k7HCm7f5wo/xo3B+HI/l31BBRo5r/tA9vEcbr+EVZ3xmwID/htMyZf8n06vNN3fp0L
	 CaE1QnF5diei1Eb42fK5tKNg17RYQ01pitxMSbsE=
Date: Sat, 7 Feb 2026 14:38:50 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Rachit Dhar <rchtdhr@gmail.com>
Message-ID: <2026020704-velocity-palpitate-afd2@gregkh>
References: <20260204183003.182728-1-rchtdhr@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260204183003.182728-1-rchtdhr@gmail.com>
X-Spamd-Bar: /
Message-ID-Hash: PRIDV24LOZRQY5ROTAAQUUKEMEOULCJB
X-Message-ID-Hash: PRIDV24LOZRQY5ROTAAQUUKEMEOULCJB
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v3 1/4] staging: greybus: added comment to mutex declaration in fw-management.c
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/PRIDV24LOZRQY5ROTAAQUUKEMEOULCJB/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [5.09 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	R_DKIM_REJECT(1.00)[linuxfoundation.org:s=korg];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx];
	DMARC_POLICY_SOFTFAIL(0.10)[linuxfoundation.org : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	GREYLIST(0.00)[pass,meta];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,greybus-dev-bounces@lists.linaro.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:-];
	TAGGED_RCPT(0.00)[greybus-dev];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[checkpatch.pl:url,linaro.org:email,lists.linaro.org:helo,lists.linaro.org:rdns]
X-Rspamd-Queue-Id: 5541D106035
X-Rspamd-Action: no action

On Wed, Feb 04, 2026 at 06:30:03PM +0000, Rachit Dhar wrote:
> Added comment to mutex declaration, to resolve a checkpatch.pl check.
> 
> Signed-off-by: Rachit Dhar <rchtdhr@gmail.com>
> ---
>  drivers/staging/greybus/fw-management.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/greybus/fw-management.c b/drivers/staging/greybus/fw-management.c
> index 152949c23d65..07a0e6b63cf3 100644
> --- a/drivers/staging/greybus/fw-management.c
> +++ b/drivers/staging/greybus/fw-management.c
> @@ -28,7 +28,7 @@ struct fw_mgmt {
>  
>  	/* Common id-map for interface and backend firmware requests */
>  	struct ida		id_map;
> -	struct mutex		mutex;
> +	struct mutex		mutex; /* protects fw_mgmt->disabled, and serializes ioctl */

How do you "know" that this is what it is for?

Fixing this type of checkpatch warning is hard, and requires lots of
documentation and checking.  If you didn't write the code originally, I
wouldn't worry about this type of issue at all, it's best for new code,
not existing code.

thanks,

greg k-h
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
