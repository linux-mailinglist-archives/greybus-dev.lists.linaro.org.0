Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id C749056A06E
	for <lists+greybus-dev@lfdr.de>; Thu,  7 Jul 2022 12:52:54 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id BACAF3EE6D
	for <lists+greybus-dev@lfdr.de>; Thu,  7 Jul 2022 10:52:53 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	by lists.linaro.org (Postfix) with ESMTPS id 3CB7A3EE6D
	for <greybus-dev@lists.linaro.org>; Thu,  7 Jul 2022 10:52:52 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 17C2CB8213C;
	Thu,  7 Jul 2022 10:52:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2942EC3411E;
	Thu,  7 Jul 2022 10:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1657191169;
	bh=cRZmEvhq3mkvO9CFf2gncqX2zdzXsEPflfQTcsk6ojM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=owrk7JzN0soODypmpkaL+lysRCGSQc06WnHyCmBP92nkBhUf9yLZo9mj+RQ+wEE7q
	 /yY7+Zai3DNrujSqlPQVe8w3Qaq8mUoN+S+awMvU3PKZVqhuSD4hro6aDXvNBJ3rkO
	 vpucQn2Hp8wsfumfI/OEQBDsmua0KW/yS+MUS9Yo=
Date: Thu, 7 Jul 2022 12:52:46 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Karthik Alapati <mail@karthek.com>
Message-ID: <Ysa6/gEg1VV4mEq1@kroah.com>
References: <Ysa1oopf0ELw+OfB@karthik-strix-linux.karthek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Ysa1oopf0ELw+OfB@karthik-strix-linux.karthek.com>
Message-ID-Hash: K65LXEMC6KVGV7RAA7V3PAXRPRVPHTFH
X-Message-ID-Hash: K65LXEMC6KVGV7RAA7V3PAXRPRVPHTFH
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: don't use index pointer after iter
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/K65LXEMC6KVGV7RAA7V3PAXRPRVPHTFH/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Jul 07, 2022 at 03:59:54PM +0530, Karthik Alapati wrote:
> There are some usages of index pointer of list(w) which may not point to
> the right entry when the required entry is not found and the list traversal
> completes with index pointer pointing to the last entry. So, use w_found
> flag to track the case where the entry is found.

That is already being done here with the use of the w variable.

Look at commit 80c968a04a38 ("staging: greybus: audio: fix loop cursor
use after iteration") and then d2b47721a100 ("staging: greybus: audio:
replace safe list iteration").

> diff --git a/drivers/staging/greybus/audio_helper.c b/drivers/staging/greybus/audio_helper.c
> index 843760675876..7c04897a22a2 100644
> --- a/drivers/staging/greybus/audio_helper.c
> +++ b/drivers/staging/greybus/audio_helper.c
> @@ -116,6 +116,7 @@ int gbaudio_dapm_free_controls(struct snd_soc_dapm_context *dapm,
>  {
>  	int i;
>  	struct snd_soc_dapm_widget *w, *next_w;
> +	bool w_found = false;
>  #ifdef CONFIG_DEBUG_FS
>  	struct dentry *parent = dapm->debugfs_dapm;
>  	struct dentry *debugfs_w = NULL;
> @@ -124,15 +125,18 @@ int gbaudio_dapm_free_controls(struct snd_soc_dapm_context *dapm,
>  	mutex_lock(&dapm->card->dapm_mutex);
>  	for (i = 0; i < num; i++) {
>  		/* below logic can be optimized to identify widget pointer */
> +		w_found = false
>  		list_for_each_entry_safe(w, next_w, &dapm->card->widgets,
>  					 list) {

You are working off of an old kernel version here, please see the above
commits which do not seem to be in your tree.  Always work on linux-next
for issues so that you do not duplicate work that others have completed.

thanks,

greg k-h
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
