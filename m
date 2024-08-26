Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id B923995EC64
	for <lists+greybus-dev@lfdr.de>; Mon, 26 Aug 2024 10:52:35 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id A022F40B91
	for <lists+greybus-dev@lfdr.de>; Mon, 26 Aug 2024 08:52:34 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	by lists.linaro.org (Postfix) with ESMTPS id 4CE5040B91
	for <greybus-dev@lists.linaro.org>; Mon, 26 Aug 2024 08:52:30 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=pDjorypg;
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 147.75.193.91 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org;
	dmarc=pass (policy=none) header.from=linuxfoundation.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B69C1A41FEE;
	Mon, 26 Aug 2024 08:52:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AD64C58120;
	Mon, 26 Aug 2024 08:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1724661415;
	bh=n3CIJNLyzGeqG3nDgil8AKYIze1p6GZww+31Duon/Ns=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pDjorypgwJXSQYljBX2QhyN/Bt5XWzOLCa+r36Y8BLi0aEb7ezDLZ2w8oQBDo4SSx
	 jxtUDUc+0tAnTMFZ4pmf3Ttym8WgTzvv7CnlDfMumHZWvIAMfJwz4eWFHJPNlr/i9i
	 kDQTZr/GzqONZXMIY4rzPwCL2iYLKwxEr8zGRy3g=
Date: Mon, 26 Aug 2024 10:36:53 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Dorine Tipo <dorine.a.tipo@gmail.com>
Message-ID: <2024082639-direction-ibuprofen-729c@gregkh>
References: <20240826083213.23499-1-dorine.a.tipo@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240826083213.23499-1-dorine.a.tipo@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Bar: ++
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 4CE5040B91
X-Spam-Level: **
X-Spamd-Result: default: False [2.00 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:147.75.193.91];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_CC(0.00)[nexus-software.ie,kernel.org,lists.linaro.org,lists.linux.dev,linuxfoundation.org,gmail.com];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:54825, ipnet:147.75.192.0/21, country:US];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_HAS_DN(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[linuxfoundation.org:+]
Message-ID-Hash: HOGPJEGKADSWNTEIIOYVCTGUP7GPL47U
X-Message-ID-Hash: HOGPJEGKADSWNTEIIOYVCTGUP7GPL47U
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, Shuah Khan <skhan@linuxfoundation.org>, Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: Enclose multi-statement Macro in a do-while loop
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/HOGPJEGKADSWNTEIIOYVCTGUP7GPL47U/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Aug 26, 2024 at 08:32:12AM +0000, Dorine Tipo wrote:
> Update the gb_loopback_stats_attrs() macro to use a do-while(0) loop.
> This ensures that it is treated as a single statement, preventing
> potential issues when used in conditional or loop constructs.
> 
> Signed-off-by: Dorine Tipo <dorine.a.tipo@gmail.com>
> ---
>  drivers/staging/greybus/loopback.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/greybus/loopback.c b/drivers/staging/greybus/loopback.c
> index 1f19323b0e1a..0f3e4c43e2de 100644
> --- a/drivers/staging/greybus/loopback.c
> +++ b/drivers/staging/greybus/loopback.c
> @@ -163,9 +163,11 @@ static ssize_t name##_avg_show(struct device *dev,		\
>  static DEVICE_ATTR_RO(name##_avg)
> 
>  #define gb_loopback_stats_attrs(field)				\
> -	gb_loopback_ro_stats_attr(field, min, u);		\
> -	gb_loopback_ro_stats_attr(field, max, u);		\
> -	gb_loopback_ro_avg_attr(field)
> +	do {
> +		gb_loopback_ro_stats_attr(field, min, u);		\
> +		gb_loopback_ro_stats_attr(field, max, u);		\
> +		gb_loopback_ro_avg_attr(field);
> +	} while (0)
> 

Please always test-build your patches before sending them out :(
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
