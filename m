Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id E14496B5996
	for <lists+greybus-dev@lfdr.de>; Sat, 11 Mar 2023 09:57:57 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id E34B73EA35
	for <lists+greybus-dev@lfdr.de>; Sat, 11 Mar 2023 08:57:56 +0000 (UTC)
Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	by lists.linaro.org (Postfix) with ESMTPS id 9FD753EA35
	for <greybus-dev@lists.linaro.org>; Sat, 11 Mar 2023 08:57:46 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=inria.fr header.s=dc header.b=kc+22KI9;
	spf=pass (lists.linaro.org: domain of julia.lawall@inria.fr designates 192.134.164.83 as permitted sender) smtp.mailfrom=julia.lawall@inria.fr;
	dmarc=pass (policy=none) header.from=inria.fr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=94TY6prpmIkG+xcIe1ZrjJUwgTSMdg+tKXutKOn9kZs=;
  b=kc+22KI9dO1GKpH8QtgTJMOWkh3UyQ270gj02DTpj8TAUcdnJ8Ur9LrE
   YdIOuOBnX301ncnDhHOMUyk9mSaU414LXx9m3mrxrjp+GT5s0CJ4nTrHc
   wRVkSV6LOvHDfHqUpK1VKdUNC1tKVMgtMEpi0FKvrWzX+xBOZQtrkLCws
   A=;
X-IronPort-AV: E=Sophos;i="5.98,252,1673910000";
   d="scan'208";a="96628084"
Received: from 231.85.89.92.rev.sfr.net (HELO hadrien) ([92.89.85.231])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2023 09:57:45 +0100
Date: Sat, 11 Mar 2023 09:57:45 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
In-Reply-To: <ccd27442c1ad9a33b0b7564176fa68f7b153fa20.1678462486.git.eng.mennamahmoud.mm@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2303110956591.2802@hadrien>
References: <b6521b9a75a4088d621246b436c7ec5d35365690.1678462486.git.eng.mennamahmoud.mm@gmail.com> <ccd27442c1ad9a33b0b7564176fa68f7b153fa20.1678462486.git.eng.mennamahmoud.mm@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 9FD753EA35
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.00 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[inria.fr,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:192.134.164.0/24];
	R_DKIM_ALLOW(-0.20)[inria.fr:s=dc];
	MIME_GOOD(-0.10)[text/plain];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:2200, ipnet:192.134.164.0/24, country:FR];
	RCVD_TLS_LAST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_TWO(0.00)[2];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	TAGGED_RCPT(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	DKIM_TRACE(0.00)[inria.fr:+]
Message-ID-Hash: W7R6XI4WZ3GQNS4HE6STSR4DJCLMULUQ
X-Message-ID-Hash: W7R6XI4WZ3GQNS4HE6STSR4DJCLMULUQ
X-MailFrom: julia.lawall@inria.fr
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: outreachy@lists.linux.dev, vireshk@kernel.org, johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 2/2] staging: greybus: Fix Alignment with parenthesis
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/W7R6XI4WZ3GQNS4HE6STSR4DJCLMULUQ/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On Fri, 10 Mar 2023, Menna Mahmoud wrote:

> Fix " CHECK: Alignment should match open parenthesis "
> Reported by checkpath

The log message could be better, to explain what you have done and why.
The word "fix" doesn't express any of that, and should be avoided if
possible.

julia

>
> Signed-off-by: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
> ---
>  drivers/staging/greybus/fw-core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/staging/greybus/fw-core.c b/drivers/staging/greybus/fw-core.c
> index f562cb12d5ad..0fb15a60412f 100644
> --- a/drivers/staging/greybus/fw-core.c
> +++ b/drivers/staging/greybus/fw-core.c
> @@ -110,7 +110,7 @@ static int gb_fw_core_probe(struct gb_bundle *bundle,
>  			}
>
>  			connection = gb_connection_create(bundle, cport_id,
> -						gb_fw_download_request_handler);
> +							  gb_fw_download_request_handler);
>  			if (IS_ERR(connection)) {
>  				dev_err(&bundle->dev, "failed to create download connection (%ld)\n",
>  					PTR_ERR(connection));
> --
> 2.34.1
>
>
>
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
