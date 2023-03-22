Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F2256C4747
	for <lists+greybus-dev@lfdr.de>; Wed, 22 Mar 2023 11:14:26 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id EB30B3EA46
	for <lists+greybus-dev@lfdr.de>; Wed, 22 Mar 2023 10:14:24 +0000 (UTC)
Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	by lists.linaro.org (Postfix) with ESMTPS id CAB843E96A
	for <greybus-dev@lists.linaro.org>; Wed, 22 Mar 2023 10:14:19 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=inria.fr header.s=dc header.b=eiSRkcfD;
	spf=pass (lists.linaro.org: domain of julia.lawall@inria.fr designates 192.134.164.104 as permitted sender) smtp.mailfrom=julia.lawall@inria.fr;
	dmarc=pass (policy=none) header.from=inria.fr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=PYNtrfbTrgWXps9hIv+gLj5vvQqBeOvzaAxQ9ZWQjXo=;
  b=eiSRkcfDADq0FBmuUWsom/KcUq7vpwqPS7/+K/Ym8Ya3c0wcjYjaczJV
   7kqX9M5hdbzfY7Px3lUo1VLcLjI6jX9mC0sjB2oCbqXZ3IyQROQ2MctMc
   ycT9a1eQ9VazY48A4UR/mhQpZRAxNAl8j+ehP0RdsqStetGdyEMu+mhWy
   w=;
X-IronPort-AV: E=Sophos;i="5.98,281,1673910000";
   d="scan'208";a="50902796"
Received: from dt-lawall.paris.inria.fr ([128.93.67.65])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2023 11:14:19 +0100
Date: Wed, 22 Mar 2023 11:14:18 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
To: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
In-Reply-To: <20230322100927.28351-1-eng.mennamahmoud.mm@gmail.com>
Message-ID: <369edb35-b93b-301c-fcef-8e64e5d4a122@inria.fr>
References: <20230322100927.28351-1-eng.mennamahmoud.mm@gmail.com>
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: CAB843E96A
X-Spamd-Bar: ----
X-Spamd-Result: default: False [-4.10 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	RCVD_DKIM_ARC_DNSWL_HI(-1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[inria.fr,none];
	RCVD_IN_DNSWL_HI(-0.50)[128.93.67.65:received];
	R_DKIM_ALLOW(-0.20)[inria.fr:s=dc];
	R_SPF_ALLOW(-0.20)[+ip4:192.134.164.0/24];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[192.134.164.104:from];
	FREEMAIL_CC(0.00)[linuxfoundation.org,lists.linux.dev,kernel.org,gmail.com,pengutronix.de,lists.linaro.org,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail3-relais-sop.national.inria.fr:helo,mail3-relais-sop.national.inria.fr:rdns,inria.fr:dkim];
	FROM_HAS_DN(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	ARC_NA(0.00)[];
	ASN(0.00)[asn:2200, ipnet:192.134.164.0/24, country:FR];
	RCVD_COUNT_ONE(0.00)[1];
	DKIM_TRACE(0.00)[inria.fr:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[]
Message-ID-Hash: KJCGBLRMLYY6WHJLVYN3334E4YISSGSP
X-Message-ID-Hash: KJCGBLRMLYY6WHJLVYN3334E4YISSGSP
X-MailFrom: julia.lawall@inria.fr
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: outreachy@lists.linux.dev, johan@kernel.org, elder@kernel.org, vireshk@kernel.org, thierry.reding@gmail.com, u.kleine-koenig@pengutronix.de, greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, linux-pwm@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: remove unnecessary blank line
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/KJCGBLRMLYY6WHJLVYN3334E4YISSGSP/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On Wed, 22 Mar 2023, Menna Mahmoud wrote:

> Remove unnecessary blank line before struct as reported
> by checkpatch:
>
> " CHECK: Please don't use multiple blank lines "

Since there is no vX indicator, one doesn't know that this replaces some
previous patches.

julia

>
> Signed-off-by: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
> ---
>  drivers/staging/greybus/greybus_authentication.h | 1 -
>  drivers/staging/greybus/pwm.c                    | 1 -
>  2 files changed, 2 deletions(-)
>
> diff --git a/drivers/staging/greybus/greybus_authentication.h b/drivers/staging/greybus/greybus_authentication.h
> index 7edc7295b7ab..48b4a9794d3c 100644
> --- a/drivers/staging/greybus/greybus_authentication.h
> +++ b/drivers/staging/greybus/greybus_authentication.h
> @@ -41,7 +41,6 @@
>  #define CAP_AUTH_RESULT_CR_NO_KEY	0x03
>  #define CAP_AUTH_RESULT_CR_SIG_FAIL	0x04
>
> -
>  /* IOCTL support */
>  struct cap_ioc_get_endpoint_uid {
>  	__u8			uid[8];
> diff --git a/drivers/staging/greybus/pwm.c b/drivers/staging/greybus/pwm.c
> index 3fda172239d2..26d39e08c3b6 100644
> --- a/drivers/staging/greybus/pwm.c
> +++ b/drivers/staging/greybus/pwm.c
> @@ -24,7 +24,6 @@ struct gb_pwm_chip {
>  #define pwm_chip_to_gb_pwm_chip(chip) \
>  	container_of(chip, struct gb_pwm_chip, chip)
>
> -
>  static int gb_pwm_count_operation(struct gb_pwm_chip *pwmc)
>  {
>  	struct gb_pwm_count_response response;
> --
> 2.34.1
>
>
>
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
