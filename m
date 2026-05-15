Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wM+8HDa8BmpAnQIAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Fri, 15 May 2026 08:24:54 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 011DD549F5F
	for <lists+greybus-dev@lfdr.de>; Fri, 15 May 2026 08:24:53 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 63F503F820
	for <lists+greybus-dev@lfdr.de>; Fri, 15 May 2026 06:17:53 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by lists.linaro.org (Postfix) with ESMTPS id 09B1B3F820
	for <greybus-dev@lists.linaro.org>; Fri, 15 May 2026 06:17:49 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=sKpqWMe2;
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 172.234.252.31 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org;
	dmarc=pass (policy=none) header.from=linuxfoundation.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 750D8406CF;
	Fri, 15 May 2026 06:17:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06350C2BCB0;
	Fri, 15 May 2026 06:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1778825868;
	bh=jQlT5g/KADfPCvxIwOmvCrRl9MRyjHSYOIvEquZiR/o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sKpqWMe2Rmn0Z6baLO9+Jx2S5y1wDLMw88E6yBVPAWFFH3lf5UFNe1Mol1eUFdRFH
	 R1rUiUTuBRHp0Lx+gJVodg+UhC5KWBj6GnflVljw1ILhEkuH57TfZ6qr/y89M7qMRf
	 OTHc6FCMBYpKQt4tGx27eyhRX0tZZzRmYb9URG+A=
Date: Fri, 15 May 2026 08:17:52 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Nikolai Grlica <grlicanikolai@gmail.com>
Message-ID: <2026051538-paragraph-troubling-8104@gregkh>
References: <CAKSDPXASdY+EP8r8YLJ6YcQYKTKsVrVEAK-BJOt-=UXMXk=DQQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKSDPXASdY+EP8r8YLJ6YcQYKTKsVrVEAK-BJOt-=UXMXk=DQQ@mail.gmail.com>
X-Spamd-Bar: /
Message-ID-Hash: RXNTAGQJDRKBBRNXRDRYQ4WNUCT3B5C3
X-Message-ID-Hash: RXNTAGQJDRKBBRNXRDRYQ4WNUCT3B5C3
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: audio: add missing newlines to sysfs attributes
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/RXNTAGQJDRKBBRNXRDRYQ4WNUCT3B5C3/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 011DD549F5F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [5.09 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	R_DKIM_REJECT(1.00)[linuxfoundation.org:s=korg];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx];
	DMARC_POLICY_SOFTFAIL(0.10)[linuxfoundation.org : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	GREYLIST(0.00)[pass,body];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:-];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,greybus-dev-bounces@lists.linaro.org];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	NEURAL_SPAM(0.00)[0.564];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linaro.org:helo,lists.linaro.org:rdns,linaro.org:email]
X-Rspamd-Action: no action

On Fri, May 15, 2026 at 10:02:26AM +0200, Nikolai Grlica wrote:
> Sysfs attribute output should be newline-terminated.
> 
> Add missing newlines to the Greybus audio manager module attribute show
> functions.
> 
> Signed-off-by: Nikolai Grlica <grlicanikolai@gmail.com>
> ---
>  drivers/staging/greybus/audio_manager_module.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/staging/greybus/audio_manager_module.c
> b/drivers/staging/greybus/audio_manager_module.c
> index dc90cc2d2308..5737f2a32f5a 100644
> --- a/drivers/staging/greybus/audio_manager_module.c
> +++ b/drivers/staging/greybus/audio_manager_module.c
> @@ -75,7 +75,7 @@ static void gb_audio_module_release(struct kobject *kobj)
>  static ssize_t gb_audio_module_name_show(struct gb_audio_manager_module
> *module,
>   struct gb_audio_manager_module_attribute *attr, char *buf)
>  {
> - return sysfs_emit(buf, "%s", module->desc.name);
> + return sysfs_emit(buf, "%s\n", module->desc.name);
>  }
> 
>  static struct gb_audio_manager_module_attribute
> gb_audio_module_name_attribute =
> @@ -84,7 +84,7 @@ static struct gb_audio_manager_module_attribute
> gb_audio_module_name_attribute =
>  static ssize_t gb_audio_module_vid_show(struct gb_audio_manager_module
> *module,
>   struct gb_audio_manager_module_attribute *attr, char *buf)
>  {
> - return sysfs_emit(buf, "%d", module->desc.vid);
> + return sysfs_emit(buf, "%d\n", module->desc.vid);
>  }
> 
>  static struct gb_audio_manager_module_attribute
> gb_audio_module_vid_attribute =
> @@ -93,7 +93,7 @@ static struct gb_audio_manager_module_attribute
> gb_audio_module_vid_attribute =
>  static ssize_t gb_audio_module_pid_show(struct gb_audio_manager_module
> *module,
>   struct gb_audio_manager_module_attribute *attr, char *buf)
>  {
> - return sysfs_emit(buf, "%d", module->desc.pid);
> + return sysfs_emit(buf, "%d\n", module->desc.pid);
>  }
> 
>  static struct gb_audio_manager_module_attribute
> gb_audio_module_pid_attribute =
> @@ -103,7 +103,7 @@ static ssize_t gb_audio_module_intf_id_show(struct
> gb_audio_manager_module *modu
>      struct gb_audio_manager_module_attribute *attr,
>      char *buf)
>  {
> - return sysfs_emit(buf, "%d", module->desc.intf_id);
> + return sysfs_emit(buf, "%d\n", module->desc.intf_id);
>  }
> 
>  static struct gb_audio_manager_module_attribute
> @@ -114,7 +114,7 @@ static ssize_t gb_audio_module_ip_devices_show(struct
> gb_audio_manager_module *m
>         struct gb_audio_manager_module_attribute *attr,
>         char *buf)
>  {
> - return sysfs_emit(buf, "0x%X", module->desc.ip_devices);
> + return sysfs_emit(buf, "0x%X\n", module->desc.ip_devices);
>  }
> 
>  static struct gb_audio_manager_module_attribute
> @@ -125,7 +125,7 @@ static ssize_t gb_audio_module_op_devices_show(struct
> gb_audio_manager_module *m
>         struct gb_audio_manager_module_attribute *attr,
>         char *buf)
>  {
> - return sysfs_emit(buf, "0x%X", module->desc.op_devices);
> + return sysfs_emit(buf, "0x%X\n", module->desc.op_devices);
>  }
> 
>  static struct gb_audio_manager_module_attribute
> 
> base-commit: 81f55766523e5293604cb96c5e98d10da345ff33
> --
> 2.54.0

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

- Your patch is malformed (tabs converted to spaces, linewrapped, etc.)
  and can not be applied.  Please read the file,
  Documentation/process/email-clients.rst in order to fix this.

- You sent a patch that has been sent multiple times in the past few
  days, and is identical to ones that has been recently rejected.
  Please always look at the mailing list traffic to determine if you are
  duplicating other people's work.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
