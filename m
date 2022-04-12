Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 0654D4FD1BC
	for <lists+greybus-dev@lfdr.de>; Tue, 12 Apr 2022 09:04:13 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 27126402DE
	for <lists+greybus-dev@lfdr.de>; Tue, 12 Apr 2022 07:04:12 +0000 (UTC)
Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	by lists.linaro.org (Postfix) with ESMTPS id E44323F066
	for <greybus-dev@lists.linaro.org>; Tue, 12 Apr 2022 07:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=Bkffw/tORnlmhR+gIFgr3oGerYveSodb4qpEBRE6/iA=;
  b=NN5omO0mJWMWo28GRM27ZTIEsCMWZZQfcFvGkzizYwguhHUhVxh/oz2M
   I0hjb6s+ioxXL/zpOYfpsmt8FUiyozS69m89vwlzL4qOhSGGpIS7I03u8
   q97rx4H8YhWxSCqrEyeAyxTkfdKI0H3RIwAvKaND2RkFYJ6rvUEgwOGzL
   0=;
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="5.90,253,1643670000";
   d="scan'208";a="31248913"
Received: from 203.107.68.85.rev.sfr.net (HELO hadrien) ([85.68.107.203])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2022 09:04:09 +0200
Date: Tue, 12 Apr 2022 09:04:08 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Jaehee Park <jhpark1013@gmail.com>
In-Reply-To: <eaf51ac31d264179298cb24c91f05a14e3651bda.1649712572.git.jhpark1013@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2204120901380.3122@hadrien>
References: <cover.1649712572.git.jhpark1013@gmail.com> <eaf51ac31d264179298cb24c91f05a14e3651bda.1649712572.git.jhpark1013@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Message-ID-Hash: WAZIELDT6KC5TYSET7JZHHZFAGKM3DGA
X-Message-ID-Hash: WAZIELDT6KC5TYSET7JZHHZFAGKM3DGA
X-MailFrom: julia.lawall@inria.fr
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 2/2] staging: greybus: remove return in an empty void function
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/WAZIELDT6KC5TYSET7JZHHZFAGKM3DGA/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On Mon, 11 Apr 2022, Jaehee Park wrote:

> Issue found by checkpatch:
> WARNING: void function return statements are not generally useful

Even for a simple change, it wouldbe better to follow the model that the
subject line should concisely orient the reader (eg "remove unneeded
return") and the log message should give a more complete description.
Simply repeating what checkpatch tells you is rarely a good idea.  It says
what the problem is in a general way, whereas you should be explaining the
reasoning behind your fix in a specific case.  Here you could say that an
empty function with void return type does not need an explicit return, and
that the problem was detected with checkpatch.

julia

>
> Signed-off-by: Jaehee Park <jhpark1013@gmail.com>
> ---
>  drivers/staging/greybus/audio_codec.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/staging/greybus/audio_codec.c b/drivers/staging/greybus/audio_codec.c
> index 0f50d1e51e2c..3e3a16568def 100644
> --- a/drivers/staging/greybus/audio_codec.c
> +++ b/drivers/staging/greybus/audio_codec.c
> @@ -1032,7 +1032,6 @@ static int gbcodec_probe(struct snd_soc_component *comp)
>  static void gbcodec_remove(struct snd_soc_component *comp)
>  {
>  	/* Empty function for now */
> -	return;
>  }
>
>  static int gbcodec_write(struct snd_soc_component *comp, unsigned int reg,
> --
> 2.25.1
>
>
>
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
