Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C6418629D0
	for <lists+greybus-dev@lfdr.de>; Sun, 25 Feb 2024 09:56:10 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 53CF54425A
	for <lists+greybus-dev@lfdr.de>; Sun, 25 Feb 2024 08:56:09 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	by lists.linaro.org (Postfix) with ESMTPS id 450B83F087
	for <greybus-dev@lists.linaro.org>; Sun, 25 Feb 2024 08:56:04 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=K1IDhiv5;
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 139.178.84.217 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org;
	dmarc=pass (policy=none) header.from=linuxfoundation.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DC04F60C7F;
	Sun, 25 Feb 2024 08:56:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC01AC433C7;
	Sun, 25 Feb 2024 08:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1708851363;
	bh=38kp4Bs+qLUhrrZmHZ4+Od2TQWEIG08zA9tTBFZcypY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K1IDhiv5jvK/2H48lJqX+xJl5pEuRbA8n+pEIxesovoKIUTnnAbZWVPV9T5fIAa8M
	 6kZGXjHW9VIJkLELBvQkdPK09ICmNXjzsgnyVTrjpxVLW8SruYRM9+SYXT7LtWPQnG
	 8u6CnoZY/XxoCMoc6UPwdy5Vez8wxpMWcsWsmYIg=
Date: Sun, 25 Feb 2024 09:56:01 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Dileep Sankhla <dileepsankhla.ds@gmail.com>
Message-ID: <2024022538-buffoon-praising-f748@gregkh>
References: <20240225084017.418773-1-dileepsankhla.ds@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240225084017.418773-1-dileepsankhla.ds@gmail.com>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Spam-Level: **
X-Rspamd-Queue-Id: 450B83F087
X-Spamd-Bar: ++
X-Spamd-Result: default: False [2.00 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip4:139.178.84.217];
	MIME_GOOD(-0.10)[text/plain];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	ASN(0.00)[asn:54825, ipnet:139.178.80.0/21, country:US];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	DNSWL_BLOCKED(0.00)[100.75.92.58:received,139.178.84.217:from];
	DKIM_TRACE(0.00)[linuxfoundation.org:+]
Message-ID-Hash: WHK7HHA7DYL75SIGFWEQ4WWPY2YZ3D35
X-Message-ID-Hash: WHK7HHA7DYL75SIGFWEQ4WWPY2YZ3D35
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, johan@kernel.org, elder@kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: put macro in a do - while loop
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/WHK7HHA7DYL75SIGFWEQ4WWPY2YZ3D35/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, Feb 25, 2024 at 02:10:17PM +0530, Dileep Sankhla wrote:
> Enclose the macro gb_loopback_stats_attrs defined with multiple
> replacement statements in a do - while loop. This avoids possible
> if/else logic defects and clears a checkpatch error.
> 
> ERROR: Macros with multiple statements should be enclosed in a do -
> while loop
> 
> Signed-off-by: Dileep Sankhla <dileepsankhla.ds@gmail.com>
> ---
>  drivers/staging/greybus/loopback.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/greybus/loopback.c b/drivers/staging/greybus/loopback.c
> index bb33379b5297..eb5a7a20f5a3 100644
> --- a/drivers/staging/greybus/loopback.c
> +++ b/drivers/staging/greybus/loopback.c
> @@ -162,9 +162,11 @@ static ssize_t name##_avg_show(struct device *dev,		\
>  static DEVICE_ATTR_RO(name##_avg)
>  
>  #define gb_loopback_stats_attrs(field)				\
> -	gb_loopback_ro_stats_attr(field, min, u);		\
> -	gb_loopback_ro_stats_attr(field, max, u);		\
> -	gb_loopback_ro_avg_attr(field)
> +	do {							\
> +		gb_loopback_ro_stats_attr(field, min, u);	\
> +		gb_loopback_ro_stats_attr(field, max, u);	\
> +		gb_loopback_ro_avg_attr(field);			\
> +	} while (0)

Did you test build this?

>  #define gb_loopback_attr(field, type)					\
>  static ssize_t field##_show(struct device *dev,				\

Why did you only change one if you thought this was a valid change?

thanks,

greg k-h
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
