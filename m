Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 4841B60006B
	for <lists+greybus-dev@lfdr.de>; Sun, 16 Oct 2022 17:09:31 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 37D893EF7F
	for <lists+greybus-dev@lfdr.de>; Sun, 16 Oct 2022 15:09:30 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	by lists.linaro.org (Postfix) with ESMTPS id 65E903EEBC
	for <greybus-dev@lists.linaro.org>; Sun, 16 Oct 2022 15:09:24 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=IuWrDb9z;
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 139.178.84.217 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org;
	dmarc=pass (policy=none) header.from=linuxfoundation.org
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0FC7860BEC;
	Sun, 16 Oct 2022 15:09:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB13FC433D6;
	Sun, 16 Oct 2022 15:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1665932963;
	bh=LkZdo4C2etXIVshfF7HoMh8gk7bTmamu8NWJxVgV6ss=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IuWrDb9zRcOdm/rFvubwvMCe9R+XIrTQGZDpQk0LBJ3rSqUro1C1064e1xiwMwzd8
	 28JpdeBEGig6elOdA6QNOQVg16Zd5OaI+DjIhaGXT2nu4rBLflOxXuxB5O5BQ4J5fN
	 dwB1vZIP7dj5unPXSGSWLbk1bjZ2QsVR0vGfTVLQ=
Date: Sun, 16 Oct 2022 17:10:09 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Deepak R Varma <drv@mailo.com>
Message-ID: <Y0we0XPpye+Vjznr@kroah.com>
References: <Y0wS4HQo9m/W/TrQ@debian-BULLSEYE-live-builder-AMD64>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y0wS4HQo9m/W/TrQ@debian-BULLSEYE-live-builder-AMD64>
X-Rspamd-Server: lists.linaro.org
X-Spamd-Bar: ----
X-Rspamd-Queue-Id: 65E903EEBC
X-Spamd-Result: default: False [-4.00 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip4:139.178.84.217];
	MIME_GOOD(-0.10)[text/plain];
	NEURAL_HAM(-0.00)[-1.000];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:54825, ipnet:139.178.80.0/21, country:US];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[]
Message-ID-Hash: 664YR5QEQJW2J7FWAC63K7AJVHQCM5RR
X-Message-ID-Hash: 664YR5QEQJW2J7FWAC63K7AJVHQCM5RR
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: outreachy@lists.linux.dev, johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: loopback: enclose macro statements in do-while loop
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/664YR5QEQJW2J7FWAC63K7AJVHQCM5RR/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, Oct 16, 2022 at 10:19:12AM -0400, Deepak R Varma wrote:
> Include multiple statements of macro definition inside do-while{0} loop
> to avoid possible partial program execution. Issue reported by
> checkpatch script:
> 
> ERROR: Macros with multiple statements should be enclosed in a do - while loop
> 
> Signed-off-by: Deepak R Varma <drv@mailo.com>
> ---
>  drivers/staging/greybus/loopback.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/greybus/loopback.c b/drivers/staging/greybus/loopback.c
> index 1a61fce98056..37214cb43937 100644
> --- a/drivers/staging/greybus/loopback.c
> +++ b/drivers/staging/greybus/loopback.c
> @@ -163,9 +163,11 @@ static ssize_t name##_avg_show(struct device *dev,		\
>  static DEVICE_ATTR_RO(name##_avg)
> 
>  #define gb_loopback_stats_attrs(field)				\
> +do {								\
>  	gb_loopback_ro_stats_attr(field, min, u);		\
>  	gb_loopback_ro_stats_attr(field, max, u);		\
> -	gb_loopback_ro_avg_attr(field)
> +	gb_loopback_ro_avg_attr(field);				\
> +} while (0)
> 
>  #define gb_loopback_attr(field, type)					\
>  static ssize_t field##_show(struct device *dev,				\
> --
> 2.30.2

Always test-build your changes before sending them out so you do not get
grumpy maintainers asking why you did not test-build your changes.

Also, don't bindly trust that checkpatch is always correct, you need to
read the C code to verify that it is a sane request.

thanks,

greg k-h
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
