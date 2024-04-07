Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id D122089AECE
	for <lists+greybus-dev@lfdr.de>; Sun,  7 Apr 2024 08:13:31 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 8538543CE0
	for <lists+greybus-dev@lfdr.de>; Sun,  7 Apr 2024 06:13:30 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	by lists.linaro.org (Postfix) with ESMTPS id CE25D3EE2D
	for <greybus-dev@lists.linaro.org>; Sun,  7 Apr 2024 06:13:27 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=ZEHQ9yVQ;
	dmarc=pass (policy=none) header.from=linuxfoundation.org;
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 145.40.73.55 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 62477CE0A36;
	Sun,  7 Apr 2024 06:13:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE2F2C433C7;
	Sun,  7 Apr 2024 06:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1712470403;
	bh=4wcLIJ61+MYcFNncPI6IcB5hQwoIi8wRWHK0RjMxaog=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZEHQ9yVQtK1MSybStYHVzVrR94EHrGftYkrZf0sx+cnPVNg4J5MFIMaYU5Yc1092R
	 8+ElU4E7SknAZPdszFo0iXxICwLpgh8l/pLmHYT2lnz+s5x695j31L/JDmacM5Sbj/
	 va2S2xOXsq+sNbDrUQ5p72jLGIBRYkraWXSTlpNI=
Date: Sun, 7 Apr 2024 08:13:19 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Jackson Chui <jacksonchui.qwerty@gmail.com>
Message-ID: <2024040708-dividing-igloo-37ed@gregkh>
References: <20240404001627.94858-1-jacksonchui.qwerty@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240404001627.94858-1-jacksonchui.qwerty@gmail.com>
X-Rspamd-Queue-Id: CE25D3EE2D
X-Spamd-Bar: ++
X-Spamd-Result: default: False [2.00 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:145.40.73.55];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MIME_GOOD(-0.10)[text/plain];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:54825, ipnet:145.40.73.0/24, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TAGGED_RCPT(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	DKIM_TRACE(0.00)[linuxfoundation.org:+]
X-Rspamd-Action: no action
X-Spam-Level: **
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: 6DSXMG5ZRJKNVXKYFBCCFJJUCLHSW23H
X-Message-ID-Hash: 6DSXMG5ZRJKNVXKYFBCCFJJUCLHSW23H
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: Clear up precedence for gcam logging macros
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/6DSXMG5ZRJKNVXKYFBCCFJJUCLHSW23H/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Apr 03, 2024 at 05:16:28PM -0700, Jackson Chui wrote:
> Reported by checkpatch:
> 
> CHECK: Macro argument 'gcam' may be better as '(gcam)' to avoid
> precedence issues
> 
> Disambiguates '&' (address-of) operator and '->' operator precedence,
> accounting for how '(gcam)->bundle->dev' is a 'struct device' and not a
> 'struct device*', which is required by the dev_{dbg,info,err} driver
> model diagnostic macros. Issue found by checkpatch.

This really is not an issue at all, as you are dealing with pointers and
structures and nothing else.

> 
> Signed-off-by: Jackson Chui <jacksonchui.qwerty@gmail.com>
> ---
>  drivers/staging/greybus/camera.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/greybus/camera.c b/drivers/staging/greybus/camera.c
> index a8173aa3a995..d82a2d2abdca 100644
> --- a/drivers/staging/greybus/camera.c
> +++ b/drivers/staging/greybus/camera.c
> @@ -180,9 +180,9 @@ static const struct gb_camera_fmt_info *gb_camera_get_format_info(u16 gb_fmt)
>  
>  #define GB_CAMERA_MAX_SETTINGS_SIZE	8192
>  
> -#define gcam_dbg(gcam, format...)	dev_dbg(&gcam->bundle->dev, format)
> -#define gcam_info(gcam, format...)	dev_info(&gcam->bundle->dev, format)
> -#define gcam_err(gcam, format...)	dev_err(&gcam->bundle->dev, format)
> +#define gcam_dbg(gcam, format...)	dev_dbg(&((gcam)->bundle->dev), format)

Again, the original code here is fine.  Getting rid of the gcam_*()
functions would be nice, as hiding dev_*() calls isn't really needed.

thanks,

greg k-h
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
