Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id E5B64CE8E94
	for <lists+greybus-dev@lfdr.de>; Tue, 30 Dec 2025 08:40:56 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 050FE400F7
	for <lists+greybus-dev@lfdr.de>; Tue, 30 Dec 2025 07:40:56 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by lists.linaro.org (Postfix) with ESMTPS id 3FE8D3F73E
	for <greybus-dev@lists.linaro.org>; Tue, 30 Dec 2025 07:40:52 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=dGIJq0Qe;
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 172.234.252.31 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org;
	dmarc=pass (policy=none) header.from=linuxfoundation.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A093740193;
	Tue, 30 Dec 2025 07:40:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0A2AC4CEFB;
	Tue, 30 Dec 2025 07:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1767080451;
	bh=3sQqO0OWQ5uZmsVAwqEf+DbTHYSJ+DEQYED3X1WPebE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dGIJq0QeTeTR+gMxM+bL5st01NAAbYEY5jeRPBehHrLAv1KaGJa1bNWhmd/QH0TMi
	 tXBTsvj0rLemeCohZPaZTKL3xHm46VF+GewvETWETqur666V6surYVrCA9VsaZIPrZ
	 J1Upopj4fR9ypwqXC/+X1sNWyaTn+lUetDkUdSyA=
Date: Tue, 30 Dec 2025 08:40:48 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Sun Jian <sun.jian.kdev@gmail.com>
Message-ID: <2025123028-transform-nutshell-81fa@gregkh>
References: <20251229112649.137391-1-sun.jian.kdev@gmail.com>
 <20251230012908.214959-1-sun.jian.kdev@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251230012908.214959-1-sun.jian.kdev@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.50 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.252.31];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,animalcreek.com,lists.linaro.org,lists.linux.dev,vger.kernel.org];
	URIBL_BLOCKED(0.00)[gregkh:mid,linuxfoundation.org:dkim,linuxfoundation.org:from_smtp,linuxfoundation.org:from_mime];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+]
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 3FE8D3F73E
X-Spamd-Bar: /
Message-ID-Hash: CPKJW6SHDQ26Z2O4E2XRHKIG7BOODDKD
X-Message-ID-Hash: CPKJW6SHDQ26Z2O4E2XRHKIG7BOODDKD
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, David Laight <david.laight.linux@gmail.com>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v3] staging: greybus: audio: avoid snprintf truncation warnings
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/CPKJW6SHDQ26Z2O4E2XRHKIG7BOODDKD/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Dec 30, 2025 at 09:29:08AM +0800, Sun Jian wrote:
> W=1 reports possible truncation when formatting widget/control names
> with snprintf() and a %s argument. Use a small helper and hide the %s
> pointer from the compiler's truncation analysis via OPTIMIZER_HIDE_VAR(),
> while keeping the existing snprintf() formatting.
> 
> No functional change intended.
> 
> Signed-off-by: Sun Jian <sun.jian.kdev@gmail.com>
> 
> Changes in v3:
> - Replace the earlier scnprintf()/strlcat() approach with a helper
>   keeping snprintf().
> - Hide the %s argument from compiler truncation analysis using
>   OPTIMIZER_HIDE_VAR().
> - Add a small local length limit macro with a short comment.
> ---

The "changes" go below the --- line, as the documentation asks for.  And
please include what changed from versions prior to that as well.

But:

>  drivers/staging/greybus/audio_topology.c | 22 +++++++++++++++-------
>  1 file changed, 15 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/staging/greybus/audio_topology.c b/drivers/staging/greybus/audio_topology.c
> index 76146f91cddc..35775067897c 100644
> --- a/drivers/staging/greybus/audio_topology.c
> +++ b/drivers/staging/greybus/audio_topology.c
> @@ -1009,6 +1009,19 @@ static const struct snd_soc_dapm_widget gbaudio_widgets[] = {
>  					SND_SOC_DAPM_POST_PMD),
>  };
>  
> +/* Limit %s length to avoid -Wformat-truncation with snprintf() */
> +#define GB_NAME_TMP_LEN 32
> +
> +static void gbaudio_prefix_dev_id(char *name, size_t name_len,
> +				  unsigned int dev_id)
> +{
> +	char temp_name[GB_NAME_TMP_LEN], *cp = temp_name;
> +
> +	strscpy(temp_name, name, sizeof(temp_name));
> +	OPTIMIZER_HIDE_VAR(cp);

What?  Why?  That feels wrong.  Let's not add hacks for broken
compilers.

> +	snprintf(name, name_len, "GB %u %s", dev_id, cp);
> +}
> +
>  static int gbaudio_tplg_create_widget(struct gbaudio_module_info *module,
>  				      struct snd_soc_dapm_widget *dw,
>  				      struct gb_audio_widget *w, int *w_size)
> @@ -1018,7 +1031,6 @@ static int gbaudio_tplg_create_widget(struct gbaudio_module_info *module,
>  	struct gb_audio_control *curr;
>  	struct gbaudio_control *control, *_control;
>  	size_t size;
> -	char temp_name[NAME_SIZE];
>  
>  	ret = gbaudio_validate_kcontrol_count(w);
>  	if (ret) {
> @@ -1086,8 +1098,7 @@ static int gbaudio_tplg_create_widget(struct gbaudio_module_info *module,
>  	}
>  
>  	/* Prefix dev_id to widget control_name */
> -	strscpy(temp_name, w->name, sizeof(temp_name));
> -	snprintf(w->name, sizeof(w->name), "GB %d %s", module->dev_id, temp_name);
> +	gbaudio_prefix_dev_id(w->name, sizeof(w->name), module->dev_id);

This feels like a broken tool, let's not do foolish things just to make
compilers quiet.  W=1 is not a good reason to just make things "silent"
by moving code around like you did here.

sorry,

greg k-h
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
