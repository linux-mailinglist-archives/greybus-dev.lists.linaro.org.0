Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D28BB3CF89
	for <lists+greybus-dev@lfdr.de>; Sat, 30 Aug 2025 23:29:53 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 2211F4159B
	for <lists+greybus-dev@lfdr.de>; Sat, 30 Aug 2025 21:29:52 +0000 (UTC)
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	by lists.linaro.org (Postfix) with UTF8SMTPS id C3C88410E9
	for <greybus-dev@lists.linaro.org>; Sat, 30 Aug 2025 21:29:46 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=coZsIh5J;
	spf=pass (lists.linaro.org: domain of laurent.pinchart@ideasonboard.com designates 213.167.242.64 as permitted sender) smtp.mailfrom=laurent.pinchart@ideasonboard.com;
	dmarc=pass (policy=none) header.from=ideasonboard.com
Received: from pendragon.ideasonboard.com (237.69-130-109.adsl-dyn.isp.belgacom.be [109.130.69.237])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 16DE4337C;
	Sat, 30 Aug 2025 23:28:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1756589319;
	bh=nazjNil7c6YoIWTwvr8MF0GJzNNzswGy21FyNw0czQ4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=coZsIh5JzjfqVisAaGMLyp5r3GM20OUCq708856ovzdu6b8NgKEA/LDIg//jBFcP0
	 mfOCQ3HFvKWfn0LCAMQshiidRtUEWNvZKqdkD+7VF7GwY4qdCh2aWCVsVdy7ikrctI
	 NLu8VHtXbco5TeC5FJpaGl1jWjf8LrXEKYIObNN8=
Date: Sat, 30 Aug 2025 23:29:23 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Masaharu Noguchi <nogunix@gmail.com>
Message-ID: <20250830212923.GB16364@pendragon.ideasonboard.com>
References: <20250830173850.323897-1-nogunix@gmail.com>
 <20250830173850.323897-3-nogunix@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250830173850.323897-3-nogunix@gmail.com>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: C3C88410E9
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.30 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+mx];
	ONCE_RECEIVED(0.20)[];
	MIME_GOOD(-0.10)[text/plain];
	ASN(0.00)[asn:29169, ipnet:213.167.240.0/20, country:FR];
	ARC_NA(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_ONE(0.00)[1];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	TAGGED_RCPT(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MISSING_XM_UA(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,lists.linux.dev,gmail.com,animalcreek.com,kernel.org,lists.linaro.org,broadcom.com,raspberrypi.com,lists.infradead.org,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DNSWL_BLOCKED(0.00)[213.167.242.64:from,109.130.69.237:received];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[ideasonboard.com:+]
Message-ID-Hash: B2CQY42BF7B2J3YP3GBCHTGAE2EXCGDA
X-Message-ID-Hash: B2CQY42BF7B2J3YP3GBCHTGAE2EXCGDA
X-MailFrom: laurent.pinchart@ideasonboard.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: linux-staging@lists.linux.dev, johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, florian.fainelli@broadcom.com, rjui@broadcom.com, sbranden@broadcom.com, bcm-kernel-feedback-list@broadcom.com, dave.stevenson@raspberrypi.com, hverkuil@kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 2/2] staging: vc04_services: bcm2835-camera: avoid -Wformat-truncation
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/B2CQY42BF7B2J3YP3GBCHTGAE2EXCGDA/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, Aug 31, 2025 at 02:38:50AM +0900, Masaharu Noguchi wrote:
>     - Fix -Wformat-truncation in vidioc_querycap() when composing bus_info.
>     - Use scnprintf() for the prefix and strscpy() for the remainder.
> 
> Signed-off-by: Masaharu Noguchi <nogunix@gmail.com>
> ---
>  .../staging/vc04_services/bcm2835-camera/bcm2835-camera.c    | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
> index fa7ea4ca4c36..c2788659af12 100644
> --- a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
> +++ b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
> @@ -874,13 +874,14 @@ static int vidioc_querycap(struct file *file, void *priv,
>  	struct bcm2835_mmal_dev *dev = video_drvdata(file);
>  	u32 major;
>  	u32 minor;
> +	int n;
>  
>  	vchiq_mmal_version(dev->instance, &major, &minor);
>  
>  	strscpy(cap->driver, "bcm2835 mmal", sizeof(cap->driver));
>  	snprintf((char *)cap->card, sizeof(cap->card), "mmal service %d.%d", major, minor);
> -
> -	snprintf((char *)cap->bus_info, sizeof(cap->bus_info), "platform:%s", dev->v4l2_dev.name);
> +	n = scnprintf((char *)cap->bus_info, sizeof(cap->bus_info), "platform:");
> +	strscpy((char *)cap->bus_info + n, dev->v4l2_dev.name, sizeof(cap->bus_info) - n);

The fact that we need such a complicated construct is a sign that
there's something wrong in our APIs. The above code is too complicated
for what it does, making it less readable, more difficult to maintain,
and more bug-prone. I don't know if we need yet another sprintf variant
in the kernel, or something else, but this doens't seem to be what we
need.

>  	return 0;
>  }
>  

-- 
Regards,

Laurent Pinchart
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
