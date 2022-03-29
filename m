Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 965384EA706
	for <lists+greybus-dev@lfdr.de>; Tue, 29 Mar 2022 07:17:48 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 7474F3EE13
	for <lists+greybus-dev@lfdr.de>; Tue, 29 Mar 2022 05:17:47 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	by lists.linaro.org (Postfix) with ESMTPS id 577A63EA29
	for <greybus-dev@lists.linaro.org>; Tue, 29 Mar 2022 05:17:45 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0767561457;
	Tue, 29 Mar 2022 05:17:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8D5CC2BBE4;
	Tue, 29 Mar 2022 05:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1648531064;
	bh=X8Qn7F6rC63/GnRr6CPPqirj9apFFFA15tfuNaZx/dQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=odRgAPa6JVZhXGW6VKWu6cRxX3IGgrtVRxbl8TfWkRw9Ue1iJvw9N5NIcEZX49De7
	 f0w+h8UCK2oogrgLKdA+AnrFdsXLcohCoQ5+knCQDU9h8EjMEbCqPBirDs2arYz3vv
	 9wPB/JJ5Xu2eEIcbfClUWyBfA107yJDfZr1HLkck=
Date: Tue, 29 Mar 2022 07:17:41 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Xiaomeng Tong <xiam0nd.tong@gmail.com>
Message-ID: <YkKWdcI2AdidmqOv@kroah.com>
References: <20220329015913.10420-1-xiam0nd.tong@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220329015913.10420-1-xiam0nd.tong@gmail.com>
Message-ID-Hash: Q2VKKS4SGB52L62HBI4RJUD7NNLE2L7T
X-Message-ID-Hash: Q2VKKS4SGB52L62HBI4RJUD7NNLE2L7T
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: dan.carpenter@oracle.com, johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] greybus: audio_codec: initialize data to silence static checker warnings
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/Q2VKKS4SGB52L62HBI4RJUD7NNLE2L7T/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Mar 29, 2022 at 09:59:13AM +0800, Xiaomeng Tong wrote:
> These three declares are here:
> 	struct gbaudio_data_connection *data;
> 
> Since all three of these functions check for if the codec->module_list is
> empty at the start of the function so these are not real bugs to bypass
> 'if (!data) {'. To avoid static checker warnings like Smatch, initialize
> the data with NULL.
> 
> Signed-off-by: Xiaomeng Tong <xiam0nd.tong@gmail.com>
> ---
>  drivers/staging/greybus/audio_codec.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/greybus/audio_codec.c b/drivers/staging/greybus/audio_codec.c
> index b589cf6b1d03..939e05af4dcf 100644
> --- a/drivers/staging/greybus/audio_codec.c
> +++ b/drivers/staging/greybus/audio_codec.c
> @@ -397,7 +397,7 @@ static int gbcodec_hw_params(struct snd_pcm_substream *substream,
>  	u8 sig_bits, channels;
>  	u32 format, rate;
>  	struct gbaudio_module_info *module;
> -	struct gbaudio_data_connection *data;
> +	struct gbaudio_data_connection *data = NULL;
>  	struct gb_bundle *bundle;
>  	struct gbaudio_codec_info *codec = dev_get_drvdata(dai->dev);
>  	struct gbaudio_stream_params *params;
> @@ -498,7 +498,7 @@ static int gbcodec_prepare(struct snd_pcm_substream *substream,
>  {
>  	int ret;
>  	struct gbaudio_module_info *module;
> -	struct gbaudio_data_connection *data;
> +	struct gbaudio_data_connection *data = NULL;
>  	struct gb_bundle *bundle;
>  	struct gbaudio_codec_info *codec = dev_get_drvdata(dai->dev);
>  	struct gbaudio_stream_params *params;
> @@ -562,7 +562,7 @@ static int gbcodec_prepare(struct snd_pcm_substream *substream,
>  static int gbcodec_mute_stream(struct snd_soc_dai *dai, int mute, int stream)
>  {
>  	int ret;
> -	struct gbaudio_data_connection *data;
> +	struct gbaudio_data_connection *data = NULL;
>  	struct gbaudio_module_info *module;
>  	struct gb_bundle *bundle;
>  	struct gbaudio_codec_info *codec = dev_get_drvdata(dai->dev);
> -- 
> 2.17.1
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
  kernel file, Documentation/SubmittingPatches for what needs to be done
  here to properly describe this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
