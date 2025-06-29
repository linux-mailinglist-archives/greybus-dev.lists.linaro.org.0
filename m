Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FC44AECC05
	for <lists+greybus-dev@lfdr.de>; Sun, 29 Jun 2025 11:47:42 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id E298944549
	for <lists+greybus-dev@lfdr.de>; Sun, 29 Jun 2025 09:47:39 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by lists.linaro.org (Postfix) with ESMTPS id 1CF7744131
	for <greybus-dev@lists.linaro.org>; Sun, 29 Jun 2025 09:47:36 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=v7IR09Z+;
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 172.105.4.254 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org;
	dmarc=pass (policy=none) header.from=linuxfoundation.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 85BE760EDF;
	Sun, 29 Jun 2025 09:47:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B78A2C4CEEB;
	Sun, 29 Jun 2025 09:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1751190455;
	bh=3PsiXreKOO08zP3QkoiRqU3jk58Y08869vFWrOIe+v4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=v7IR09Z+zK/FXdLr8CtBrByTZs73/BlZF6YxCy3rxHuvw8wXvUYcA3H45zgMbb8x9
	 h/hpFeIWMUD7WDZd+1B03mSVID1mqZBa+0BMLgrgoqi6+FauY98T4Y/dfKM70aDB8R
	 Q+xh9qeHV8x1DQd0BkqxHuDObaSI7a2hDQO0YxW8=
Date: Sun, 29 Jun 2025 11:47:32 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Pranav Tyagi <pranav.tyagi03@gmail.com>
Message-ID: <2025062945-prologue-plutonium-870f@gregkh>
References: <20250628063121.362685-1-pranav.tyagi03@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250628063121.362685-1-pranav.tyagi03@gmail.com>
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 1CF7744131
X-Spamd-Bar: +
X-Spamd-Result: default: False [1.00 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	RBL_SENDERSCORE_REPUT_9(-1.00)[172.105.4.254:from];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.4.254];
	MIME_GOOD(-0.10)[text/plain];
	ASN(0.00)[asn:63949, ipnet:172.105.0.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	TAGGED_RCPT(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ARC_NA(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[linuxfoundation.org:+]
X-Rspamd-Action: no action
X-Spam-Level: *
Message-ID-Hash: YA5SCWKXD3L7EUKUP6LDPQDIQ7A5ZVD4
X-Message-ID-Hash: YA5SCWKXD3L7EUKUP6LDPQDIQ7A5ZVD4
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, pure.logic@nexus-software.ie, johan@kernel.org, elder@kernel.org, skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] greybus: loopback: remove gb_loopback_async_wait_all()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/YA5SCWKXD3L7EUKUP6LDPQDIQ7A5ZVD4/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Jun 28, 2025 at 12:01:21PM +0530, Pranav Tyagi wrote:
> Remove redundant gb_loopback_async_wait_all() as connection is disabled
> at the beginning and no further incoming/outgoing requests are possible.
> 
> Signed-off-by: Pranav Tyagi <pranav.tyagi03@gmail.com>
> ---
>  drivers/staging/greybus/loopback.c | 7 -------
>  1 file changed, 7 deletions(-)
> 
> diff --git a/drivers/staging/greybus/loopback.c b/drivers/staging/greybus/loopback.c
> index 1f19323b0e1a..9d0d4308ad25 100644
> --- a/drivers/staging/greybus/loopback.c
> +++ b/drivers/staging/greybus/loopback.c
> @@ -1110,13 +1110,6 @@ static void gb_loopback_disconnect(struct gb_bundle *bundle)
>  	gb_connection_latency_tag_disable(gb->connection);
>  	debugfs_remove(gb->file);
>  
> -	/*
> -	 * FIXME: gb_loopback_async_wait_all() is redundant now, as connection
> -	 * is disabled at the beginning and so we can't have any more
> -	 * incoming/outgoing requests.
> -	 */
> -	gb_loopback_async_wait_all(gb);

How was this tested?  It might be redundant but I don't think you can
delete this just yet, otherwise we would have done so a long time ago.

And your changelog just says the same thing as this comment, shouldn't
you write something different?

thanks,

greg k-h
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
