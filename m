Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id B319A6470B5
	for <lists+greybus-dev@lfdr.de>; Thu,  8 Dec 2022 14:21:27 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id AA8783E962
	for <lists+greybus-dev@lfdr.de>; Thu,  8 Dec 2022 13:21:26 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	by lists.linaro.org (Postfix) with ESMTPS id 1280F3E92E
	for <greybus-dev@lists.linaro.org>; Thu,  8 Dec 2022 13:21:24 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=pr6dfUw0;
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 145.40.68.75 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org;
	dmarc=pass (policy=none) header.from=linuxfoundation.org
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 1B5C0B823A9;
	Thu,  8 Dec 2022 13:21:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A5C7C433D6;
	Thu,  8 Dec 2022 13:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1670505681;
	bh=IAOHwcqvXUe8ZdDzqPjljhapKqfLGkgRuE/FGTT9b5I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pr6dfUw0KEre6q986eVwgmixUIo/yXwjbwVCh8Qzcn9FQjVbPEqx7ZPsnO5HTeSDv
	 40pM7wRBFBaEEr6BGNFFPw+u9EUzZXWg29aWYGFMTc/U5HLt+gNWc/Oq4xosAL9/Bj
	 xiM8rvtFRxAM8ITzoLuii/tZ0C6y1NT2PL/W6VbQ=
Date: Thu, 8 Dec 2022 14:21:18 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Abhirup Deb <abhirupdeb@linux.vnet.ibm.com>
Message-ID: <Y5HkzlYvJz8L3RX2@kroah.com>
References: <Y5HKqvmRDvxVaCMN@li-27defe4c-32e1-11b2-a85c-e202e9981075.ibm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y5HKqvmRDvxVaCMN@li-27defe4c-32e1-11b2-a85c-e202e9981075.ibm.com>
X-Rspamd-Queue-Id: 1280F3E92E
X-Spamd-Bar: ---------
X-Spamd-Result: default: False [-9.00 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	DWL_DNSWL_LOW(-1.00)[linuxfoundation.org:dkim];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip4:145.40.68.75];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[checkpatch.pl:url,linuxfoundation.org:dkim,ams.source.kernel.org:rdns,ams.source.kernel.org:helo];
	FROM_EQ_ENVFROM(0.00)[];
	ASN(0.00)[asn:54825, ipnet:145.40.68.0/24, country:US];
	NEURAL_HAM(-0.00)[-0.999];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_ALL(0.00)[];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: ZRZLQXOQNVKLCQWYPA63AZTJD6G4KFY6
X-Message-ID-Hash: ZRZLQXOQNVKLCQWYPA63AZTJD6G4KFY6
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v2 RESEND] Staging: greybus: camera: fixed brace coding-style and indentation issues
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/ZRZLQXOQNVKLCQWYPA63AZTJD6G4KFY6/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Dec 08, 2022 at 04:59:46PM +0530, Abhirup Deb wrote:
> Fixes checkpatch.pl warnings for missing braces in &gcam. Fixes
> indentation issues for functions, following the Linux Coding Style.
> 
> Signed-off-by: Abhirup Deb <abhirupdeb@linux.vnet.ibm.com>
> ---
>  drivers/staging/greybus/camera.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/staging/greybus/camera.c b/drivers/staging/greybus/camera.c
> index cdbb42cd413b..6516e7efaab9 100644
> --- a/drivers/staging/greybus/camera.c
> +++ b/drivers/staging/greybus/camera.c
> @@ -180,9 +180,9 @@ static const struct gb_camera_fmt_info *gb_camera_get_format_info(u16 gb_fmt)
>  
>  #define GB_CAMERA_MAX_SETTINGS_SIZE	8192
>  
> -#define gcam_dbg(gcam, format...)	dev_dbg(&gcam->bundle->dev, format)
> -#define gcam_info(gcam, format...)	dev_info(&gcam->bundle->dev, format)
> -#define gcam_err(gcam, format...)	dev_err(&gcam->bundle->dev, format)
> +#define gcam_dbg(gcam, format...)	dev_dbg(&(gcam)->bundle->dev, format)
> +#define gcam_info(gcam, format...)	dev_info(&(gcam)->bundle->dev, format)
> +#define gcam_err(gcam, format...)	dev_err(&(gcam)->bundle->dev, format)
>  
>  static int gb_camera_operation_sync_flags(struct gb_connection *connection,
>  					  int type, unsigned int flags,
> @@ -220,7 +220,7 @@ static int gb_camera_operation_sync_flags(struct gb_connection *connection,
>  }
>  
>  static int gb_camera_get_max_pkt_size(struct gb_camera *gcam,
> -		struct gb_camera_configure_streams_response *resp)
> +				      struct gb_camera_configure_streams_response *resp)
>  {
>  	unsigned int max_pkt_size = 0;
>  	unsigned int i;
> @@ -378,8 +378,8 @@ struct ap_csi_config_request {
>  #define GB_CAMERA_CSI_CLK_FREQ_MARGIN		150000000U
>  
>  static int gb_camera_setup_data_connection(struct gb_camera *gcam,
> -		struct gb_camera_configure_streams_response *resp,
> -		struct gb_camera_csi_params *csi_params)
> +					   struct gb_camera_configure_streams_response *resp,
> +					   struct gb_camera_csi_params *csi_params)
>  {
>  	struct ap_csi_config_request csi_cfg;
>  	struct gb_connection *conn;
> @@ -783,8 +783,8 @@ static ssize_t gb_camera_op_capabilities(void *priv, char *data, size_t len)
>  }
>  
>  static int gb_camera_op_configure_streams(void *priv, unsigned int *nstreams,
> -		unsigned int *flags, struct gb_camera_stream *streams,
> -		struct gb_camera_csi_params *csi_params)
> +					  unsigned int *flags, struct gb_camera_stream *streams,
> +					  struct gb_camera_csi_params *csi_params)
>  {
>  	struct gb_camera *gcam = priv;
>  	struct gb_camera_stream_config *gb_streams;
> -- 
> 2.31.1
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

- Your patch did many different things all at once, making it difficult
  to review.  All Linux kernel patches need to only do one thing at a
  time.  If you need to do multiple things (such as clean up all coding
  style issues in a file/driver), do it in a sequence of patches, each
  one doing only one thing.  This will make it easier to review the
  patches to ensure that they are correct, and to help alleviate any
  merge issues that larger patches can cause.

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
