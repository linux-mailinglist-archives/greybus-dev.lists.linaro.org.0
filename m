Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id D72496C3C59
	for <lists+greybus-dev@lfdr.de>; Tue, 21 Mar 2023 21:59:21 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 78F6B3F23D
	for <lists+greybus-dev@lfdr.de>; Tue, 21 Mar 2023 20:59:20 +0000 (UTC)
Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	by lists.linaro.org (Postfix) with ESMTPS id C7A713ED72
	for <greybus-dev@lists.linaro.org>; Tue, 21 Mar 2023 20:59:15 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=inria.fr header.s=dc header.b=nqFkP6g7;
	spf=pass (lists.linaro.org: domain of julia.lawall@inria.fr designates 192.134.164.104 as permitted sender) smtp.mailfrom=julia.lawall@inria.fr;
	dmarc=pass (policy=none) header.from=inria.fr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=9q3c6DZ84qERaYxwpBLMMZMDxJrnwUpqZmpXF6Hs6ks=;
  b=nqFkP6g7VrkH6F9TIZQuEyi4wfkMDquj8ZeBCPqQE62fZzKFPB/t3ip8
   O58YVcqMbnHQV7IEILZ/MbN+HnYPzihOvUaByrZiJeE4f0O8FcpchHgoR
   s1ZX/QVdcpKsZUgfS4zT5u/gLNi9II2BsXIWw0vikJ4H7ZVgfLR+aap4O
   s=;
X-IronPort-AV: E=Sophos;i="5.98,279,1673910000";
   d="scan'208";a="50854107"
Received: from 231.85.89.92.rev.sfr.net (HELO hadrien) ([92.89.85.231])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2023 21:59:14 +0100
Date: Tue, 21 Mar 2023 21:59:13 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
In-Reply-To: <20230321181725.8691-1-eng.mennamahmoud.mm@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2303212158170.2919@hadrien>
References: <20230321181725.8691-1-eng.mennamahmoud.mm@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: C7A713ED72
X-Spamd-Bar: ---
X-Spamd-Result: default: False [-3.60 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	RCVD_DKIM_ARC_DNSWL_HI(-1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[inria.fr,none];
	MID_RHS_NOT_FQDN(0.50)[];
	RCVD_IN_DNSWL_HI(-0.50)[192.134.164.104:from];
	R_DKIM_ALLOW(-0.20)[inria.fr:s=dc];
	R_SPF_ALLOW(-0.20)[+ip4:192.134.164.0/24];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[192.134.164.104:from];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:2200, ipnet:192.134.164.0/24, country:FR];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[linuxfoundation.org,lists.linux.dev,kernel.org,gmail.com,pengutronix.de,lists.linaro.org,vger.kernel.org];
	RCVD_COUNT_ONE(0.00)[1];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_RCPT(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	DKIM_TRACE(0.00)[inria.fr:+]
Message-ID-Hash: ITTXKLVQ6JRT74CJBEZ5ANWUGOOJP3Y2
X-Message-ID-Hash: ITTXKLVQ6JRT74CJBEZ5ANWUGOOJP3Y2
X-MailFrom: julia.lawall@inria.fr
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: outreachy@lists.linux.dev, johan@kernel.org, elder@kernel.org, vireshk@kernel.org, thierry.reding@gmail.com, u.kleine-koenig@pengutronix.de, greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, linux-pwm@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v2 1/2] staging: greybus: remove unnecessary blank line
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/ITTXKLVQ6JRT74CJBEZ5ANWUGOOJP3Y2/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On Tue, 21 Mar 2023, Menna Mahmoud wrote:

> Remove unnecessary blank line before struct as reported
> by checkpatch:
>
> " CHECK: Please don't use multiple blank lines "
>
> Signed-off-by: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
> ---
> change in v2:
> 	add patches that have same edit in sigle patch.
> ---
>  drivers/staging/greybus/greybus_authentication.h | 1 -
>  1 file changed, 1 deletion(-)
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
> --
> 2.34.1
>
>
> From 6f56ebcda89f91cdfe6e64c0707dc476ebc1e819 Mon Sep 17 00:00:00 2001
> From: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
> Date: Tue, 21 Mar 2023 00:03:32 +0200
> Subject: [PATCH v2 2/2] staging: greybus: remove unnecessary blank line

This doesn't look right.  If you put two changes in a single message, you
shouldn't repeat the log message etc.  Use git log -p to look at what
others have done.

julia

>
> Remove unnecessary blank line before struct as reported
> by checkpatch:
>
> " CHECK: Please don't use multiple blank lines "
>
> Signed-off-by: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
> ---
> change in v2:
>         add patches that have same edit in sigle patch.
> ---
>  drivers/staging/greybus/pwm.c | 1 -
>  1 file changed, 1 deletion(-)
>
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
