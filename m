Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BB4E5403D8
	for <lists+greybus-dev@lfdr.de>; Tue,  7 Jun 2022 18:36:41 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 067383F1A7
	for <lists+greybus-dev@lfdr.de>; Tue,  7 Jun 2022 16:36:40 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	by lists.linaro.org (Postfix) with ESMTPS id 7AB053F187
	for <greybus-dev@lists.linaro.org>; Tue,  7 Jun 2022 16:36:37 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id F3B08617DC;
	Tue,  7 Jun 2022 16:36:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5726AC385A5;
	Tue,  7 Jun 2022 16:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654619796;
	bh=8i5haULdeB2Ou8xLNgGyaqjpMUp/nNMdFFzefBtFQus=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YJOYP5lV5TwG9gnAjthINUaJCRhaAv5ayjybpS0BpNazzoGwVMj1SxQg/skv+eP2j
	 efB3JHODISGBtLWUuzpgVu+c7ki/+9fNOmc/qm31lf8ENLQGu6USScXIR7Zd28pTdR
	 I7xQe05KIYnjlzNRc9/HGJCmoftFlmEgqMYyxEpLsOT44uN6EThAx4V3w78k8oEVLl
	 Mg/nn5b6OJwEzh6oB1f2a94OudqtGDnidgkmdmRttS3p3DWqamPeIm2veizy34Wt+b
	 BYJXF201xvI3qlVaiD4trtkK1XnW2mq9C9RymqaGNWW8XM8nl6LEyESSq45YPdZeDL
	 AsE7PUYfzdm3w==
Received: from johan by xi.lan with local (Exim 4.94.2)
	(envelope-from <johan@kernel.org>)
	id 1nycBz-0002GQ-7u; Tue, 07 Jun 2022 18:36:31 +0200
Date: Tue, 7 Jun 2022 18:36:31 +0200
From: Johan Hovold <johan@kernel.org>
To: Jared Kangas <kangas.jd@gmail.com>
Message-ID: <Yp9+j7xrjDQWkem3@hovoldconsulting.com>
References: <20220605231806.720085-1-kangas.jd@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220605231806.720085-1-kangas.jd@gmail.com>
Message-ID-Hash: 2ZIA4FILEZU2R4CU2MHNH3DNZCXTNRTO
X-Message-ID-Hash: 2ZIA4FILEZU2R4CU2MHNH3DNZCXTNRTO
X-MailFrom: johan@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: elder@kernel.org, greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: audio: fix loop cursor use after iteration
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/2ZIA4FILEZU2R4CU2MHNH3DNZCXTNRTO/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, Jun 05, 2022 at 04:18:06PM -0700, Jared Kangas wrote:
> gbaudio_dapm_free_controls() iterates over widgets using
> list_for_each_entry_safe(), which leaves the loop cursor pointing to a
> meaningless structure if it completes a traversal of the list. The
> cursor was set to NULL at the end of the loop body, but would be
> overwritten by the final loop cursor update.
> 
> Because of this behavior, the widget could be non-null after the loop
> even if the widget wasn't found, and the cleanup logic would treat the
> pointer as a valid widget to free.
> 
> To fix this, introduce a temporary variable to act as the loop cursor
> and copy it to a variable that can be accessed after the loop finishes.
> 
> This was detected with the help of Coccinelle.

Please add the missing Fixes tag and a CC stable tag here as Dan
mentioned.

> Signed-off-by: Jared Kangas <kangas.jd@gmail.com>
> ---
>  drivers/staging/greybus/audio_helper.c | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/staging/greybus/audio_helper.c b/drivers/staging/greybus/audio_helper.c
> index 843760675876..07461a5d97c7 100644
> --- a/drivers/staging/greybus/audio_helper.c
> +++ b/drivers/staging/greybus/audio_helper.c
> @@ -115,7 +115,7 @@ int gbaudio_dapm_free_controls(struct snd_soc_dapm_context *dapm,
>  			       int num)
>  {
>  	int i;
> -	struct snd_soc_dapm_widget *w, *next_w;
> +	struct snd_soc_dapm_widget *w, *next_w, *tmp_w;
>  #ifdef CONFIG_DEBUG_FS
>  	struct dentry *parent = dapm->debugfs_dapm;
>  	struct dentry *debugfs_w = NULL;
> @@ -124,13 +124,14 @@ int gbaudio_dapm_free_controls(struct snd_soc_dapm_context *dapm,
>  	mutex_lock(&dapm->card->dapm_mutex);
>  	for (i = 0; i < num; i++) {
>  		/* below logic can be optimized to identify widget pointer */
> -		list_for_each_entry_safe(w, next_w, &dapm->card->widgets,
> +		w = NULL;
> +		list_for_each_entry_safe(tmp_w, next_w, &dapm->card->widgets,

This should be list_for_each_entry() as w is not unlinked in this loop.

>  					 list) {
> -			if (w->dapm != dapm)
> -				continue;
> -			if (!strcmp(w->name, widget->name))
> +			if (tmp_w->dapm == dapm &&
> +			    !strcmp(tmp_w->name, widget->name)) {
> +				w = tmp_w;
>  				break;
> -			w = NULL;
> +			}
>  		}
>  		if (!w) {
>  			dev_err(dapm->dev, "%s: widget not found\n",

Looks good otherwise:

Reviewed-by: Johan Hovold <johan@kernel.org>
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
