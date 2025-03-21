Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 48923A6BB13
	for <lists+greybus-dev@lfdr.de>; Fri, 21 Mar 2025 13:48:47 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 5E66E410F5
	for <lists+greybus-dev@lfdr.de>; Fri, 21 Mar 2025 12:48:46 +0000 (UTC)
Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	by lists.linaro.org (Postfix) with ESMTPS id CD64F3F6C3
	for <greybus-dev@lists.linaro.org>; Fri, 21 Mar 2025 12:48:43 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=inria.fr header.s=dc header.b=L+OZKske;
	dmarc=pass (policy=none) header.from=inria.fr;
	spf=pass (lists.linaro.org: domain of julia.lawall@inria.fr designates 192.134.164.83 as permitted sender) smtp.mailfrom=julia.lawall@inria.fr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=HN+q68AfhJlHYLdy8aJOhr17kmYyQWHhDqqu4ktSByQ=;
  b=L+OZKskewizHh8c8ye2DG0WN1rJjlniH+DVXOOObfLltyPwtoyaeTbh9
   axMankDwr5H0+JAa2bKnwsCxlJ1/x9uYLQ5yx6XqhAyw8qHRY5HmQORa0
   Q98lQaA+5pzVYibzIcARmOOHHcITy/6qiJ0NCexKg0eQqFxk9cb7TaD8Y
   E=;
X-IronPort-AV: E=Sophos;i="6.14,264,1736809200";
   d="scan'208";a="214125366"
Received: from dt-lawall.paris.inria.fr ([128.93.67.65])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2025 13:48:43 +0100
Date: Fri, 21 Mar 2025 13:48:42 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
To: ErickKaranja <karanja99erick@gmail.com>
In-Reply-To: <20250321115545.24468-1-karanja99erick@gmail.com>
Message-ID: <15e28afa-6faa-4e3e-d92a-b06a3e3b474@inria.fr>
References: <20250321115545.24468-1-karanja99erick@gmail.com>
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: CD64F3F6C3
X-Spamd-Bar: ------
X-Spamd-Result: default: False [-6.90 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[inria.fr,none];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[192.134.164.83:from];
	R_DKIM_ALLOW(-0.20)[inria.fr:s=dc];
	R_SPF_ALLOW(-0.20)[+ip4:192.134.164.0/24];
	MIME_GOOD(-0.10)[text/plain];
	ASN(0.00)[asn:2200, ipnet:192.134.164.0/24, country:FR];
	RCVD_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	MISSING_XM_UA(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,linuxfoundation.org,lists.linux.dev,lists.linaro.org,vger.kernel.org];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_TLS_LAST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DKIM_TRACE(0.00)[inria.fr:+]
Message-ID-Hash: QPMJHZP4ME5A6NY2UILE32FGENIKJGUV
X-Message-ID-Hash: QPMJHZP4ME5A6NY2UILE32FGENIKJGUV
X-MailFrom: julia.lawall@inria.fr
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: hvaibhav.linux@gmail.com, johan@kernel.org, elder@kernel.org, outreachy@lists.linux.dev, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: fix line length issue
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/QPMJHZP4ME5A6NY2UILE32FGENIKJGUV/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On Fri, 21 Mar 2025, ErickKaranja wrote:

> Fix line length exceeding 100 columns in arche-platform.c. The code now
> follows Linux kernel coding style guidelines by keeping lines under the
> maximum allowed length of 100 characters.

Thanks for the patch.

In your log message you can try to avoid the word "Fix".  Probably most
patches fix something, so it doesn't give much information.  And it
doesn't say anything about how you fixed it.  Here it could be "Reduce a
line that exceeds 100 columns".  You don't have to mention the file name,
because one can easily see that from looking at the patch.

>
> Reported by checkpatch:
>
> CHECK: line length of 101 exceeds 100 columns
>
> Signed-off-by: ErickKaranja <karanja99erick@gmail.com>

Here you should have Erick Karanja, not ErickKaranja.

thanks,
julia

> ---
>  drivers/staging/greybus/arche-platform.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/staging/greybus/arche-platform.c b/drivers/staging/greybus/arche-platform.c
> index d48464390f58..1a82a7a3991c 100644
> --- a/drivers/staging/greybus/arche-platform.c
> +++ b/drivers/staging/greybus/arche-platform.c
> @@ -179,8 +179,8 @@ static irqreturn_t arche_platform_wd_irq(int irq, void *devid)
>  				 */
>  				if (arche_pdata->wake_detect_state !=
>  						WD_STATE_COLDBOOT_START) {
> -					arche_platform_set_wake_detect_state(arche_pdata,
> -									     WD_STATE_COLDBOOT_TRIG);
> +					arche_platform_set_wake_detect_state
> +						(arche_pdata, WD_STATE_COLDBOOT_TRIG);
>  					spin_unlock_irqrestore(&arche_pdata->wake_lock,
>  							       flags);
>  					return IRQ_WAKE_THREAD;
> --
> 2.43.0
>
>
>
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
