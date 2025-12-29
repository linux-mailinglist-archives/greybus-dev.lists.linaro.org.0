Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id EE1B7CE7B1C
	for <lists+greybus-dev@lfdr.de>; Mon, 29 Dec 2025 17:52:42 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 087C83F80E
	for <lists+greybus-dev@lfdr.de>; Mon, 29 Dec 2025 16:52:42 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by lists.linaro.org (Postfix) with ESMTPS id F1A593F754
	for <greybus-dev@lists.linaro.org>; Mon, 29 Dec 2025 16:52:37 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=cgS4cJyi;
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 172.234.252.31 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org;
	dmarc=pass (policy=none) header.from=linuxfoundation.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 71FF240999;
	Mon, 29 Dec 2025 16:52:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4742C4CEF7;
	Mon, 29 Dec 2025 16:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1767027157;
	bh=SHLSEAVL1aZpGLSoxEotwI04ykQfGfsOtO/Ecx/xb+w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cgS4cJyiCZNw2JuP/KY2dB7wjX+u/0EVHA91S20Q8WNdfLejKuKkuq3t2kAAqd3D1
	 EIg5ir8AX+UrRdRoH/Gl/tGJaZ9u9eQOKbZqaBU5e5lIuGW4E2F9phO2/X8AFrs/i9
	 FeZTp7JCW7j9KRFVcj4zaqI7L8ejtShV25b2gOqc=
Date: Mon, 29 Dec 2025 17:52:34 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Sun Jian <sun.jian.kdev@gmail.com>
Message-ID: <2025122922-wrath-elevating-bd85@gregkh>
References: <20251229112649.137391-1-sun.jian.kdev@gmail.com>
 <20251229161346.188805-1-sun.jian.kdev@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251229161346.188805-1-sun.jian.kdev@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.50 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.252.31];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	MISSING_XM_UA(0.00)[];
	BLOCKLISTDE_FAIL(0.00)[100.75.92.58:server fail];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	URIBL_BLOCKED(0.00)[linuxfoundation.org:dkim,linuxfoundation.org:from_smtp,linuxfoundation.org:from_mime,gregkh:mid];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,animalcreek.com,lists.linaro.org,lists.linux.dev,vger.kernel.org];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[linuxfoundation.org:+]
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: F1A593F754
X-Spamd-Bar: /
Message-ID-Hash: H7F6F5422YS76JIUIN4Z5XTBJTNQJXXB
X-Message-ID-Hash: H7F6F5422YS76JIUIN4Z5XTBJTNQJXXB
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, David Laight <david.laight.linux@gmail.com>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v2] staging: greybus: audio: avoid snprintf truncation warnings
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/H7F6F5422YS76JIUIN4Z5XTBJTNQJXXB/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Dec 30, 2025 at 12:13:46AM +0800, Sun Jian wrote:
> W=1 reports possible truncation when formatting widget/control names
> with snprintf() and a %s argument. Use a small helper and hide the %s
> pointer from the compiler's truncation analysis via OPTIMIZER_HIDE_VAR(),
> while keeping the existing snprintf() formatting.
> 
> No functional change intended.
> 
> Signed-off-by: Sun Jian <sun.jian.kdev@gmail.com>
> ---
>  drivers/staging/greybus/audio_topology.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/greybus/audio_topology.c b/drivers/staging/greybus/audio_topology.c
> index 76146f91cddc..4293ab899390 100644
> --- a/drivers/staging/greybus/audio_topology.c
> +++ b/drivers/staging/greybus/audio_topology.c
> @@ -1087,7 +1087,8 @@ static int gbaudio_tplg_create_widget(struct gbaudio_module_info *module,
>  
>  	/* Prefix dev_id to widget control_name */
>  	strscpy(temp_name, w->name, sizeof(temp_name));
> -	snprintf(w->name, sizeof(w->name), "GB %d %s", module->dev_id, temp_name);
> +	scnprintf(w->name, sizeof(w->name), "GB %d ", module->dev_id);
> +	strlcat(w->name, temp_name, sizeof(w->name));
>  
>  	switch (w->type) {
>  	case snd_soc_dapm_spk:
> @@ -1169,8 +1170,8 @@ static int gbaudio_tplg_process_kcontrols(struct gbaudio_module_info *module,
>  		control->id = curr->id;
>  		/* Prefix dev_id to widget_name */
>  		strscpy(temp_name, curr->name, sizeof(temp_name));
> -		snprintf(curr->name, sizeof(curr->name), "GB %d %s", module->dev_id,
> -			 temp_name);
> +		scnprintf(curr->name, sizeof(curr->name), "GB %d ", module->dev_id);
> +		strlcat(curr->name, temp_name, sizeof(curr->name));
>  		control->name = curr->name;
>  		if (curr->info.type == GB_AUDIO_CTL_ELEM_TYPE_ENUMERATED) {
>  			struct gb_audio_enumerated *gbenum =
> -- 
> 2.43.0
> 
> 

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- This looks like a new version of a previously submitted patch, but you
  did not list below the --- line any changes from the previous version.
  Please read the section entitled "The canonical patch format" in the
  kernel file, Documentation/process/submitting-patches.rst for what
  needs to be done here to properly describe this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
