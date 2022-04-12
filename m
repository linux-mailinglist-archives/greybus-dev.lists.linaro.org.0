Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id DF8F44FCF63
	for <lists+greybus-dev@lfdr.de>; Tue, 12 Apr 2022 08:21:58 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 19559402DE
	for <lists+greybus-dev@lfdr.de>; Tue, 12 Apr 2022 06:21:58 +0000 (UTC)
Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	by lists.linaro.org (Postfix) with ESMTPS id D1D043E818
	for <greybus-dev@lists.linaro.org>; Tue, 12 Apr 2022 06:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=VuUzRanb1g3lZ54LSZZGevqxgq7SS6sYYnuAsAsQAfU=;
  b=pujxQUiTv0ydC7Nc6d2Pzj2yv/J1fyj+FbPtZDeF8RYU5ITZXoZx9VZw
   kJZWYtWAZoFxXvZ5au/pe5ASj75aphNEt+z65ZLre75C7bZO4vprsv/SX
   KFxKwwsVsc98VX6/FtJKLM5Y1hGAcm8pERIR3RHzZP0llrWNya5+D47+h
   k=;
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="5.90,253,1643670000";
   d="scan'208";a="11244043"
Received: from 203.107.68.85.rev.sfr.net (HELO hadrien) ([85.68.107.203])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2022 08:21:53 +0200
Date: Tue, 12 Apr 2022 08:21:52 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Jaehee Park <jhpark1013@gmail.com>
In-Reply-To: <20220411212512.GA2797956@jaehee-ThinkPad-X1-Extreme>
Message-ID: <alpine.DEB.2.22.394.2204120821110.3122@hadrien>
References: <20220411212512.GA2797956@jaehee-ThinkPad-X1-Extreme>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Message-ID-Hash: 6CE6YJL22L5R7KQW74VV7KU627XFACR4
X-Message-ID-Hash: 6CE6YJL22L5R7KQW74VV7KU627XFACR4
X-MailFrom: julia.lawall@inria.fr
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 1/2] staging: greybus: correct typo in comment 'Atleast' to 'At least'
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/6CE6YJL22L5R7KQW74VV7KU627XFACR4/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On Mon, 11 Apr 2022, Jaehee Park wrote:

> Correct spelling typo.

You could make the subject line more concise and the log message more
informative.

julia

>
> Signed-off-by: Jaehee Park <jhpark1013@gmail.com>
> ---
>  drivers/staging/greybus/arche-apb-ctrl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/staging/greybus/arche-apb-ctrl.c b/drivers/staging/greybus/arche-apb-ctrl.c
> index bbf3ba744fc4..45afa208d004 100644
> --- a/drivers/staging/greybus/arche-apb-ctrl.c
> +++ b/drivers/staging/greybus/arche-apb-ctrl.c
> @@ -445,7 +445,7 @@ static int __maybe_unused arche_apb_ctrl_suspend(struct device *dev)
>  static int __maybe_unused arche_apb_ctrl_resume(struct device *dev)
>  {
>  	/*
> -	 * Atleast for ES2 we have to meet the delay requirement between
> +	 * At least for ES2 we have to meet the delay requirement between
>  	 * unipro switch and AP bridge init, depending on whether bridge is in
>  	 * OFF state or standby state.
>  	 *
> --
> 2.25.1
>
>
>
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
