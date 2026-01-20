Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 65872D3C007
	for <lists+greybus-dev@lfdr.de>; Tue, 20 Jan 2026 08:10:01 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id A43963F818
	for <lists+greybus-dev@lfdr.de>; Tue, 20 Jan 2026 07:09:59 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by lists.linaro.org (Postfix) with ESMTPS id 4AE4F3F732
	for <greybus-dev@lists.linaro.org>; Tue, 20 Jan 2026 07:09:57 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b="bxq6ar/C";
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 172.234.252.31 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org;
	dmarc=pass (policy=none) header.from=linuxfoundation.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AD52341A04;
	Tue, 20 Jan 2026 07:09:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2F5FC16AAE;
	Tue, 20 Jan 2026 07:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1768892996;
	bh=moegPz+ML0gdFecipcMmRMhdgWHCHbPMNwXLKdmh4Ds=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bxq6ar/C6N89cELHJrLeO/JGCvE4oEr6pUFjjEBatvXhuFGgy6CoUPSOe2zDUt583
	 zMXEfeSwxxfBQVrW5gcxzlj5FRmjm0e7adCbPVdE4H0KOrN7OZlDcGmCNlwWspomg3
	 lyDUb4BL5s8CcKIzkPrE8BFEs+o5wDs+77/J1bQk=
Date: Tue, 20 Jan 2026 08:09:53 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Lee Yongjun <jun85566@gmail.com>
Message-ID: <2026012002-postal-fancy-8329@gregkh>
References: <20260120070701.3689-1-jun85566@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260120070701.3689-1-jun85566@gmail.com>
X-Rspamd-Queue-Id: 4AE4F3F732
X-Spamd-Bar: /
X-Spamd-Result: default: False [0.50 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.252.31];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MIME_GOOD(-0.10)[text/plain];
	URIBL_BLOCKED(0.00)[gregkh:mid];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,animalcreek.com,kernel.org,lists.linaro.org,lists.linux.dev,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	DNSWL_BLOCKED(0.00)[172.234.252.31:from];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DWL_DNSWL_NONE(0.00)[linuxfoundation.org:dkim]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: KERIVJ4L44YOVC6JY4O3GMAN2GBVW65J
X-Message-ID-Hash: KERIVJ4L44YOVC6JY4O3GMAN2GBVW65J
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: audio: Limit scope of jack-related variables
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/KERIVJ4L44YOVC6JY4O3GMAN2GBVW65J/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Jan 20, 2026 at 04:07:01PM +0900, Lee Yongjun wrote:
> Move jack-related variable declarations inside the CONFIG_SND_JACK
> conditional block.
> 
> These variables are only used when CONFIG_SND_JACK is enabled, so
> limiting their scope improves code clarity and avoids unused variable
> warnings when the option is disabled.
> 
> No functional changes intended.
> 
> Signed-off-by: Lee Yongjun <jun85566@gmail.com>
> ---
>  drivers/staging/greybus/audio_codec.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/greybus/audio_codec.c b/drivers/staging/greybus/audio_codec.c
> index 444c53b4e08d..f752d5fbd685 100644
> --- a/drivers/staging/greybus/audio_codec.c
> +++ b/drivers/staging/greybus/audio_codec.c
> @@ -935,8 +935,6 @@ static void gbaudio_codec_cleanup(struct gbaudio_module_info *module)
>  void gbaudio_unregister_module(struct gbaudio_module_info *module)
>  {
>  	struct snd_soc_component *comp = gbcodec->component;
> -	struct gbaudio_jack *jack, *n;
> -	int mask;
>  
>  	dev_dbg(comp->dev, "Unregister %s module\n", module->name);
>  
> @@ -948,6 +946,8 @@ void gbaudio_unregister_module(struct gbaudio_module_info *module)
>  	mutex_unlock(&gbcodec->lock);
>  
>  #ifdef CONFIG_SND_JACK
> +	struct gbaudio_jack *jack, *n;
> +	int mask;
>  	/* free jack devices for this module jack_list */

Please no, let's keep the variable definitions at the top of the scope
please.  The compiler will handle this just fine if they aren't used due
to the config option not being enabled.

thanks,

greg k-h
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
