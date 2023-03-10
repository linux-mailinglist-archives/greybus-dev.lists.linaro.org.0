Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 856AE6B52F4
	for <lists+greybus-dev@lfdr.de>; Fri, 10 Mar 2023 22:40:53 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 295153F4FB
	for <lists+greybus-dev@lfdr.de>; Fri, 10 Mar 2023 21:40:52 +0000 (UTC)
Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	by lists.linaro.org (Postfix) with ESMTPS id A7DD23EA35
	for <greybus-dev@lists.linaro.org>; Fri, 10 Mar 2023 21:40:44 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=inria.fr header.s=dc header.b=INf9NsDQ;
	spf=pass (lists.linaro.org: domain of julia.lawall@inria.fr designates 192.134.164.83 as permitted sender) smtp.mailfrom=julia.lawall@inria.fr;
	dmarc=pass (policy=none) header.from=inria.fr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=C22Vv52YlLFXDQAzrVyEnZsk3nV/t8HWy5YvoTmURaw=;
  b=INf9NsDQos40foWQCkzV1iCnlmTywX09p/3WTixKooa/ojJMhXBJtikJ
   7QJbnFV4orp3M4cMuX0E0InFfuBC5jpOTeHuZ4MFI/4/S89bvpnVkcYXp
   GvXLa8WPgDjX/0vv/qAFVVfhz5CE3ZgdzJRGW3r8v9XagvjkYrs/I6mXf
   w=;
X-IronPort-AV: E=Sophos;i="5.98,250,1673910000";
   d="scan'208";a="96598247"
Received: from 231.85.89.92.rev.sfr.net (HELO hadrien) ([92.89.85.231])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2023 22:40:43 +0100
Date: Fri, 10 Mar 2023 22:40:43 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Khadija Kamran <kamrankhadijadj@gmail.com>
In-Reply-To: <ZAtkW6g6DwPg/pDp@khadija-virtual-machine>
Message-ID: <alpine.DEB.2.22.394.2303102239560.3199@hadrien>
References: <ZAtkW6g6DwPg/pDp@khadija-virtual-machine>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: A7DD23EA35
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.00 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[inria.fr,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:192.134.164.0/24];
	R_DKIM_ALLOW(-0.20)[inria.fr:s=dc];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[lists.linux.dev,gmail.com,kernel.org,linuxfoundation.org,lists.linaro.org,vger.kernel.org];
	ASN(0.00)[asn:2200, ipnet:192.134.164.0/24, country:FR];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[inria.fr:+];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2]
Message-ID-Hash: 4PN632W4ZEIYRKMJJVGOQXUV3VC66YSL
X-Message-ID-Hash: 4PN632W4ZEIYRKMJJVGOQXUV3VC66YSL
X-MailFrom: julia.lawall@inria.fr
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: outreachy@lists.linux.dev, Vaibhav Hiremath <hvaibhav.linux@gmail.com>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: fix exceeds line length
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/4PN632W4ZEIYRKMJJVGOQXUV3VC66YSL/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On Fri, 10 Mar 2023, Khadija Kamran wrote:

> Length of line 182 exceeds 100 columns in file
> drivers/staging/grebus/arche-platform.c, fix by removing tabs from the
> line.

Try to rephrase without using "fix".  Fix doens't give any information
about what is actually done.

julia

>
> Signed-off-by: Khadija Kamran <kamrankhadijadj@gmail.com>
> ---
>  drivers/staging/greybus/arche-platform.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/staging/greybus/arche-platform.c b/drivers/staging/greybus/arche-platform.c
> index fcbd5f71eff2..0f0fbc263f8a 100644
> --- a/drivers/staging/greybus/arche-platform.c
> +++ b/drivers/staging/greybus/arche-platform.c
> @@ -179,7 +179,7 @@ static irqreturn_t arche_platform_wd_irq(int irq, void *devid)
>  				if (arche_pdata->wake_detect_state !=
>  						WD_STATE_COLDBOOT_START) {
>  					arche_platform_set_wake_detect_state(arche_pdata,
> -									     WD_STATE_COLDBOOT_TRIG);
> +						WD_STATE_COLDBOOT_TRIG);
>  					spin_unlock_irqrestore(&arche_pdata->wake_lock,
>  							       flags);
>  					return IRQ_WAKE_THREAD;
> --
> 2.34.1
>
>
>
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
