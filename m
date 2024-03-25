Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 687A688AEF0
	for <lists+greybus-dev@lfdr.de>; Mon, 25 Mar 2024 19:51:02 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 7095943C2C
	for <lists+greybus-dev@lfdr.de>; Mon, 25 Mar 2024 18:51:01 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	by lists.linaro.org (Postfix) with ESMTPS id 6CD5D3EE2D
	for <greybus-dev@lists.linaro.org>; Mon, 25 Mar 2024 18:50:59 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=mukT9J7o;
	dmarc=pass (policy=none) header.from=linuxfoundation.org;
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 139.178.84.217 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EE7C961012;
	Mon, 25 Mar 2024 18:50:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46112C433F1;
	Mon, 25 Mar 2024 18:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1711392658;
	bh=BF4UHxrA7PcCQf24IMBehx8zXAO2lhS3FFGTZokYJAI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mukT9J7oMc9MKKa0ufROyUOdHrvL4bfExuw7RufQ+vAikPFHiU7Wv+Ag9hvUDIdyU
	 M7CAk/kt4O0B1T6VV53gG+cH4t2tkdqeywDIy7iVgiV1qUHrbgaOTaILvI0sboW7Y+
	 C6hwPICsGwhbt8slWX/uhGN5dt8eOzkUemJ5DlRg=
Date: Mon, 25 Mar 2024 19:50:55 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Alex Elder <elder@ieee.org>
Message-ID: <2024032510-planner-caterer-3693@gregkh>
References: <20240307094838.688281-1-rmfrfs@gmail.com>
 <2024032543-village-reference-960d@gregkh>
 <9fa87c55-42e2-4449-936f-4835b267d22f@ieee.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9fa87c55-42e2-4449-936f-4835b267d22f@ieee.org>
X-Rspamd-Queue-Id: 6CD5D3EE2D
X-Spamd-Bar: ---
X-Spamd-Result: default: False [-3.50 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip4:139.178.84.217];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:54825, ipnet:139.178.80.0/21, country:US];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[linaro.org,lists.linaro.org,rosalinux.ru,lists.linux.dev,gmail.com];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: 5EYFPRZQA7AH6VH6EBVDZAFQ6DT675MZ
X-Message-ID-Hash: 5EYFPRZQA7AH6VH6EBVDZAFQ6DT675MZ
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Rui Miguel Silva <rui.silva@linaro.org>, greybus-dev@lists.linaro.org, Mikhail Lobanov <m.lobanov@rosalinux.ru>, linux-staging@lists.linux.dev
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] greybus: lights: check return of get_channel_from_mode
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/5EYFPRZQA7AH6VH6EBVDZAFQ6DT675MZ/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Mar 25, 2024 at 01:31:34PM -0500, Alex Elder wrote:
> On 3/25/24 12:25 PM, Greg Kroah-Hartman wrote:
> > On Thu, Mar 07, 2024 at 09:48:13AM +0000, Rui Miguel Silva wrote:
> > > If channel for the given node is not found we return null from
> > > get_channel_from_mode. Make sure we validate the return pointer
> > > before using it in two of the missing places.
> > > 
> > > This was originally reported in [0]:
> > > Found by Linux Verification Center (linuxtesting.org) with SVACE.
> > > 
> > > [0] https://lore.kernel.org/all/20240301190425.120605-1-m.lobanov@rosalinux.ru
> > > 
> > > Fixes: 2870b52bae4c ("greybus: lights: add lights implementation")
> > > Reported-by: Mikhail Lobanov <m.lobanov@rosalinux.ru>
> > > Suggested-by: Mikhail Lobanov <m.lobanov@rosalinux.ru>
> > > Suggested-by: Alex Elder <elder@ieee.org>
> > > Signed-off-by: Rui Miguel Silva <rmfrfs@gmail.com>
> > > ---
> > >   drivers/staging/greybus/light.c | 6 +++++-
> > >   1 file changed, 5 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/staging/greybus/light.c b/drivers/staging/greybus/light.c
> > > index c6bd86a5335a..6f10b9e2c053 100644
> > > --- a/drivers/staging/greybus/light.c
> > > +++ b/drivers/staging/greybus/light.c
> > > @@ -147,6 +147,9 @@ static int __gb_lights_flash_brightness_set(struct gb_channel *channel)
> > >   		channel = get_channel_from_mode(channel->light,
> > >   						GB_CHANNEL_MODE_TORCH);
> > > +	if (!channel)
> > > +		return -EINVAL;
> > > +
> > >   	/* For not flash we need to convert brightness to intensity */
> > >   	intensity = channel->intensity_uA.min +
> > >   			(channel->intensity_uA.step * channel->led->brightness);
> > > @@ -549,7 +552,8 @@ static int gb_lights_light_v4l2_register(struct gb_light *light)
> > >   	}
> > >   	channel_flash = get_channel_from_mode(light, GB_CHANNEL_MODE_FLASH);
> > > -	WARN_ON(!channel_flash);
> > > +	if (WARN_ON(!channel_flash))
> > > +		return -EINVAL;
> > 
> > We should NOT crash machines just because of this, the WARN_ON() should
> > be removed and just properly handle the error please.
> 
> Greg, WARN_ON() doesn't normally crash the machine.  That said,
> it's reasonable to remove the WARN_ON().

The huge majority of running Linux systems in the world run with
panic-on-warn enabled, including the one in your pocket :(

> I think the purpose of the warning is that this is a case that
> should "never happen," so if it does, it's making some noise.

Making noise by rebooting the box is not good.

thanks,

greg k-h
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
