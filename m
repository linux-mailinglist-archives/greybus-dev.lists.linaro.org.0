Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A456C8CD2
	for <lists+greybus-dev@lfdr.de>; Sat, 25 Mar 2023 09:55:56 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 8FE3644731
	for <lists+greybus-dev@lfdr.de>; Sat, 25 Mar 2023 08:55:54 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	by lists.linaro.org (Postfix) with ESMTPS id B4E103E948
	for <greybus-dev@lists.linaro.org>; Sat, 25 Mar 2023 08:55:50 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=JdeBzSAm;
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 145.40.68.75 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org;
	dmarc=pass (policy=none) header.from=linuxfoundation.org
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id C2FE2B8069A;
	Sat, 25 Mar 2023 08:55:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E933AC433D2;
	Sat, 25 Mar 2023 08:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1679734548;
	bh=7u5dawj2c2fO53iR4hy3wYysiDixPMrt/zLjhNT/b28=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JdeBzSAmWOb5OtTKlnceOFbh0Y7xF0HS24UVpYblMZH5+h8P/7T1Tb0Oy2T3cN6NE
	 aIzasQ07PK0xoGUTeC1zCJ3ZIJbrykefNg8PDiszW07VZo9GxZJ2jnMD0HnCVGEvUk
	 mKZ/4yIoECOSSTRYLMiCSjgaQHrBt93SNO+OFYp8=
Date: Sat, 25 Mar 2023 09:55:45 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Sumitra Sharma <sumitraartsy@gmail.com>
Message-ID: <ZB63EVLK6/29UUi0@kroah.com>
References: <cover.1679732179.git.sumitraartsy@gmail.com>
 <f1ef1b643840e74f211264dda0c590f8458618f6.1679732179.git.sumitraartsy@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f1ef1b643840e74f211264dda0c590f8458618f6.1679732179.git.sumitraartsy@gmail.com>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: B4E103E948
X-Spamd-Bar: ----
X-Spamd-Result: default: False [-4.00 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip4:145.40.68.75];
	MIME_GOOD(-0.10)[text/plain];
	NEURAL_HAM(-0.00)[-1.000];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	ASN(0.00)[asn:54825, ipnet:145.40.68.0/24, country:US];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[]
Message-ID-Hash: JRM7WHILYDYNSKJULIYLJCKM5ZAITXXI
X-Message-ID-Hash: JRM7WHILYDYNSKJULIYLJCKM5ZAITXXI
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: outreachy@lists.linux.dev, johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v3 3/3] staging: greybus: Inline pwm_chip_to_gb_pwm_chip()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/JRM7WHILYDYNSKJULIYLJCKM5ZAITXXI/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Mar 25, 2023 at 01:31:10AM -0700, Sumitra Sharma wrote:
> Convert 'pwm_chip_to_gb_pwm_chip' from a macro to a static
> inline function, to make the relevant types apparent in the
> definition and to benefit from the type checking performed by
> the compiler at call sites.
> 
> Signed-off-by: Sumitra Sharma <sumitraartsy@gmail.com>
> ---
>  drivers/staging/greybus/pwm.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/greybus/pwm.c b/drivers/staging/greybus/pwm.c
> index 3fda172239d2..88da1d796f13 100644
> --- a/drivers/staging/greybus/pwm.c
> +++ b/drivers/staging/greybus/pwm.c
> @@ -21,9 +21,11 @@ struct gb_pwm_chip {
>  	struct pwm_chip		chip;
>  	struct pwm_chip		*pwm;
>  };
> -#define pwm_chip_to_gb_pwm_chip(chip) \
> -	container_of(chip, struct gb_pwm_chip, chip)
>  
> +static inline struct gb_pwm_chip *pwm_chip_to_gb_pwm_chip(struct pwm_chip *chip)
> +{
> +	return container_of(chip, struct gb_pwm_chip, chip);
> +}
>  
>  static int gb_pwm_count_operation(struct gb_pwm_chip *pwmc)
>  {
> -- 
> 2.25.1
> 
> 

This patch didn't apply due to changes made in my tree by a patch from
someone else before yours.  Can you rebase it and resend?

thanks,

greg k-h
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
