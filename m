Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KHgFIy6Xymla+QUAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Mon, 30 Mar 2026 17:30:54 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D7135DE03
	for <lists+greybus-dev@lfdr.de>; Mon, 30 Mar 2026 17:30:54 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 299E03F828
	for <lists+greybus-dev@lfdr.de>; Mon, 30 Mar 2026 15:24:01 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by lists.linaro.org (Postfix) with ESMTPS id 19E283F760
	for <greybus-dev@lists.linaro.org>; Mon, 30 Mar 2026 15:23:57 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=r2K8atL8;
	dmarc=pass (policy=none) header.from=linuxfoundation.org;
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 172.105.4.254 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 889AA600CB;
	Mon, 30 Mar 2026 15:23:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A63A3C4CEF7;
	Mon, 30 Mar 2026 15:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1774884236;
	bh=dKbvp8ix6uRKUnW/rwHFQfK0m1zd7znPNt3Pmzy/8Bo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r2K8atL8MqpujJ5k8HvDGbO0gUeLJfNwYswhkLoukYH8tk2SKIhJjGknHCbf1GpQ+
	 TyFdnC7EEfUNF7mljVJKA2F+ZqelVrjqd16sTEOa88sC++REbkD8rRp1f86+YxtHln
	 L3TjvpIz0bW+LB7iMIW9H8oScq61ZpZ//BBGEAxE=
Date: Mon, 30 Mar 2026 17:23:53 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Yug Merabtene <yug.merabtene@gmail.com>
Message-ID: <2026033036-dry-dominion-c63a@gregkh>
References: <20260329180117.611024-1-test@test.com>
 <20260329184124.775392-1-yug.merabtene@gmail.com>
 <20260329184124.775392-3-yug.merabtene@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260329184124.775392-3-yug.merabtene@gmail.com>
X-Spamd-Bar: /
Message-ID-Hash: JQEJ55CDTBZBMYRRPVQ4MM6YMAMIUVSD
X-Message-ID-Hash: JQEJ55CDTBZBMYRRPVQ4MM6YMAMIUVSD
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: andy@kernel.org, hvaibhav.linux@gmail.com, johan@kernel.org, elder@kernel.org, pure.logic@nexus-software.ie, dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v2 2/2] staging: greybus: switch sysfs show paths to sysfs_emit()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/JQEJ55CDTBZBMYRRPVQ4MM6YMAMIUVSD/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [6.59 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[linuxfoundation.org:s=korg];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+mx];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[linuxfoundation.org : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	GREYLIST(0.00)[pass,body];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-0.399];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,greybus-dev-bounces@lists.linaro.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,nexus-software.ie,lists.freedesktop.org,vger.kernel.org,lists.linaro.org,lists.linux.dev];
	TAGGED_RCPT(0.00)[greybus-dev];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linaro.org:helo,lists.linaro.org:rdns,linaro.org:email]
X-Rspamd-Queue-Id: 10D7135DE03
X-Rspamd-Action: add header
X-Rspamd-Server: lfdr
X-Spam: Yes

On Sun, Mar 29, 2026 at 08:41:24PM +0200, Yug Merabtene wrote:
> Signed-off-by: Yug Merabtene <yug.merabtene@gmail.com>
> ---
>  drivers/staging/greybus/arche-apb-ctrl.c       | 12 ++++++------
>  drivers/staging/greybus/arche-platform.c       | 10 +++++-----
>  drivers/staging/greybus/audio_manager_module.c | 12 ++++++------
>  drivers/staging/greybus/gbphy.c                |  2 +-
>  drivers/staging/greybus/light.c                |  4 ++--
>  drivers/staging/greybus/loopback.c             | 14 +++++++-------
>  6 files changed, 27 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/staging/greybus/arche-apb-ctrl.c b/drivers/staging/greybus/arche-apb-ctrl.c
> index 33f26a65f0cc..10effbe07a2a 100644
> --- a/drivers/staging/greybus/arche-apb-ctrl.c
> +++ b/drivers/staging/greybus/arche-apb-ctrl.c
> @@ -300,16 +300,16 @@ static ssize_t state_show(struct device *dev,
>  
>  	switch (apb->state) {
>  	case ARCHE_PLATFORM_STATE_OFF:
> -		return sprintf(buf, "off%s\n",
> -				apb->init_disabled ? ",disabled" : "");
> +		return sysfs_emit(buf, "off%s\n",
> +				  apb->init_disabled ? ",disabled" : "");
>  	case ARCHE_PLATFORM_STATE_ACTIVE:
> -		return sprintf(buf, "active\n");
> +		return sysfs_emit(buf, "active\n");
>  	case ARCHE_PLATFORM_STATE_STANDBY:
> -		return sprintf(buf, "standby\n");
> +		return sysfs_emit(buf, "standby\n");
>  	case ARCHE_PLATFORM_STATE_FW_FLASHING:
> -		return sprintf(buf, "fw_flashing\n");
> +		return sysfs_emit(buf, "fw_flashing\n");
>  	default:
> -		return sprintf(buf, "unknown state\n");
> +		return sysfs_emit(buf, "unknown state\n");
>  	}
>  }
>  
> diff --git a/drivers/staging/greybus/arche-platform.c b/drivers/staging/greybus/arche-platform.c
> index f669a7e2eb11..de5de59ea8ab 100644
> --- a/drivers/staging/greybus/arche-platform.c
> +++ b/drivers/staging/greybus/arche-platform.c
> @@ -374,15 +374,15 @@ static ssize_t state_show(struct device *dev,
>  
>  	switch (arche_pdata->state) {
>  	case ARCHE_PLATFORM_STATE_OFF:
> -		return sprintf(buf, "off\n");
> +		return sysfs_emit(buf, "off\n");
>  	case ARCHE_PLATFORM_STATE_ACTIVE:
> -		return sprintf(buf, "active\n");
> +		return sysfs_emit(buf, "active\n");
>  	case ARCHE_PLATFORM_STATE_STANDBY:
> -		return sprintf(buf, "standby\n");
> +		return sysfs_emit(buf, "standby\n");
>  	case ARCHE_PLATFORM_STATE_FW_FLASHING:
> -		return sprintf(buf, "fw_flashing\n");
> +		return sysfs_emit(buf, "fw_flashing\n");
>  	default:
> -		return sprintf(buf, "unknown state\n");
> +		return sysfs_emit(buf, "unknown state\n");
>  	}
>  }
>  
> diff --git a/drivers/staging/greybus/audio_manager_module.c b/drivers/staging/greybus/audio_manager_module.c
> index e87b82ca6d8a..f22ee73eb8d2 100644
> --- a/drivers/staging/greybus/audio_manager_module.c
> +++ b/drivers/staging/greybus/audio_manager_module.c
> @@ -76,7 +76,7 @@ static void gb_audio_module_release(struct kobject *kobj)
>  static ssize_t gb_audio_module_name_show(struct gb_audio_manager_module *module,
>  					 struct gb_audio_manager_module_attribute *attr, char *buf)
>  {
> -	return sprintf(buf, "%s", module->desc.name);
> +	return sysfs_emit(buf, "%s\n", module->desc.name);
>  }
>  
>  static struct gb_audio_manager_module_attribute gb_audio_module_name_attribute =
> @@ -85,7 +85,7 @@ static struct gb_audio_manager_module_attribute gb_audio_module_name_attribute =
>  static ssize_t gb_audio_module_vid_show(struct gb_audio_manager_module *module,
>  					struct gb_audio_manager_module_attribute *attr, char *buf)
>  {
> -	return sprintf(buf, "%d", module->desc.vid);
> +	return sysfs_emit(buf, "%d\n", module->desc.vid);
>  }
>  
>  static struct gb_audio_manager_module_attribute gb_audio_module_vid_attribute =
> @@ -94,7 +94,7 @@ static struct gb_audio_manager_module_attribute gb_audio_module_vid_attribute =
>  static ssize_t gb_audio_module_pid_show(struct gb_audio_manager_module *module,
>  					struct gb_audio_manager_module_attribute *attr, char *buf)
>  {
> -	return sprintf(buf, "%d", module->desc.pid);
> +	return sysfs_emit(buf, "%d\n", module->desc.pid);
>  }
>  
>  static struct gb_audio_manager_module_attribute gb_audio_module_pid_attribute =
> @@ -104,7 +104,7 @@ static ssize_t gb_audio_module_intf_id_show(struct gb_audio_manager_module *modu
>  					    struct gb_audio_manager_module_attribute *attr,
>  					    char *buf)
>  {
> -	return sprintf(buf, "%d", module->desc.intf_id);
> +	return sysfs_emit(buf, "%d\n", module->desc.intf_id);
>  }
>  
>  static struct gb_audio_manager_module_attribute
> @@ -115,7 +115,7 @@ static ssize_t gb_audio_module_ip_devices_show(struct gb_audio_manager_module *m
>  					       struct gb_audio_manager_module_attribute *attr,
>  					       char *buf)
>  {
> -	return sprintf(buf, "0x%X", module->desc.ip_devices);
> +	return sysfs_emit(buf, "0x%X\n", module->desc.ip_devices);
>  }
>  
>  static struct gb_audio_manager_module_attribute
> @@ -126,7 +126,7 @@ static ssize_t gb_audio_module_op_devices_show(struct gb_audio_manager_module *m
>  					       struct gb_audio_manager_module_attribute *attr,
>  					       char *buf)
>  {
> -	return sprintf(buf, "0x%X", module->desc.op_devices);
> +	return sysfs_emit(buf, "0x%X\n", module->desc.op_devices);
>  }
>  
>  static struct gb_audio_manager_module_attribute
> diff --git a/drivers/staging/greybus/gbphy.c b/drivers/staging/greybus/gbphy.c
> index bdb0f5164a6f..bb9a5b538e6e 100644
> --- a/drivers/staging/greybus/gbphy.c
> +++ b/drivers/staging/greybus/gbphy.c
> @@ -31,7 +31,7 @@ static ssize_t protocol_id_show(struct device *dev,
>  {
>  	struct gbphy_device *gbphy_dev = to_gbphy_dev(dev);
>  
> -	return sprintf(buf, "0x%02x\n", gbphy_dev->cport_desc->protocol_id);
> +	return sysfs_emit(buf, "0x%02x\n", gbphy_dev->cport_desc->protocol_id);
>  }
>  static DEVICE_ATTR_RO(protocol_id);
>  
> diff --git a/drivers/staging/greybus/light.c b/drivers/staging/greybus/light.c
> index cab02b5da867..2689f9a7524a 100644
> --- a/drivers/staging/greybus/light.c
> +++ b/drivers/staging/greybus/light.c
> @@ -173,7 +173,7 @@ static ssize_t fade_##__dir##_show(struct device *dev,			\
>  	struct led_classdev *cdev = dev_get_drvdata(dev);		\
>  	struct gb_channel *channel = get_channel_from_cdev(cdev);	\
>  									\
> -	return sprintf(buf, "%u\n", channel->fade_##__dir);		\
> +	return sysfs_emit(buf, "%u\n", channel->fade_##__dir);		\
>  }									\
>  									\
>  static ssize_t fade_##__dir##_store(struct device *dev,			\
> @@ -220,7 +220,7 @@ static ssize_t color_show(struct device *dev, struct device_attribute *attr,
>  	struct led_classdev *cdev = dev_get_drvdata(dev);
>  	struct gb_channel *channel = get_channel_from_cdev(cdev);
>  
> -	return sprintf(buf, "0x%08x\n", channel->color);
> +	return sysfs_emit(buf, "0x%08x\n", channel->color);
>  }
>  
>  static ssize_t color_store(struct device *dev, struct device_attribute *attr,
> diff --git a/drivers/staging/greybus/loopback.c b/drivers/staging/greybus/loopback.c
> index aa9c73cb0ae5..3a502d89d19f 100644
> --- a/drivers/staging/greybus/loopback.c
> +++ b/drivers/staging/greybus/loopback.c
> @@ -125,7 +125,7 @@ static ssize_t field##_show(struct device *dev,			\
>  			    char *buf)					\
>  {									\
>  	struct gb_loopback *gb = dev_get_drvdata(dev);			\
> -	return sprintf(buf, "%u\n", gb->field);			\
> +	return sysfs_emit(buf, "%u\n", gb->field);			\
>  }									\
>  static DEVICE_ATTR_RO(field)
>  
> @@ -137,8 +137,8 @@ static ssize_t name##_##field##_show(struct device *dev,	\
>  	struct gb_loopback *gb = dev_get_drvdata(dev);			\
>  	/* Report 0 for min and max if no transfer succeeded */		\
>  	if (!gb->requests_completed)					\
> -		return sprintf(buf, "0\n");				\
> -	return sprintf(buf, "%" #type "\n", gb->name.field);		\
> +		return sysfs_emit(buf, "0\n");				\
> +	return sysfs_emit(buf, "%" #type "\n", gb->name.field);		\
>  }									\
>  static DEVICE_ATTR_RO(name##_##field)
>  
> @@ -158,7 +158,7 @@ static ssize_t name##_avg_show(struct device *dev,		\
>  	rem = do_div(avg, count);					\
>  	rem *= 1000000;							\
>  	do_div(rem, count);						\
> -	return sprintf(buf, "%llu.%06u\n", avg, (u32)rem);		\
> +	return sysfs_emit(buf, "%llu.%06u\n", avg, (u32)rem);		\
>  }									\
>  static DEVICE_ATTR_RO(name##_avg)
>  
> @@ -173,7 +173,7 @@ static ssize_t field##_show(struct device *dev,				\
>  			    char *buf)					\
>  {									\
>  	struct gb_loopback *gb = dev_get_drvdata(dev);			\
> -	return sprintf(buf, "%" #type "\n", gb->field);			\
> +	return sysfs_emit(buf, "%" #type "\n", gb->field);			\
>  }									\
>  static ssize_t field##_store(struct device *dev,			\
>  			    struct device_attribute *attr,		\
> @@ -199,7 +199,7 @@ static ssize_t field##_show(struct device *dev,		\
>  			    char *buf)					\
>  {									\
>  	struct gb_loopback *gb = dev_get_drvdata(dev);			\
> -	return sprintf(buf, "%u\n", gb->field);				\
> +	return sysfs_emit(buf, "%u\n", gb->field);				\
>  }									\
>  static DEVICE_ATTR_RO(field)
>  
> @@ -209,7 +209,7 @@ static ssize_t field##_show(struct device *dev,				\
>  			    char *buf)					\
>  {									\
>  	struct gb_loopback *gb = dev_get_drvdata(dev);			\
> -	return sprintf(buf, "%" #type "\n", gb->field);			\
> +	return sysfs_emit(buf, "%" #type "\n", gb->field);			\
>  }									\
>  static ssize_t field##_store(struct device *dev,			\
>  			    struct device_attribute *attr,		\
> -- 
> 2.34.1
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

- You did not specify a description of why the patch is needed, or
  possibly, any description at all, in the email body.  Please read the
  section entitled "The canonical patch format" in the kernel file,
  Documentation/process/submitting-patches.rst for what is needed in
  order to properly describe the change.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
