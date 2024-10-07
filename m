Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id A9BC0993A1C
	for <lists+greybus-dev@lfdr.de>; Tue,  8 Oct 2024 00:25:17 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 3808A44003
	for <lists+greybus-dev@lfdr.de>; Mon,  7 Oct 2024 22:25:15 +0000 (UTC)
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	by lists.linaro.org (Postfix) with ESMTPS id 362733F64C
	for <greybus-dev@lists.linaro.org>; Mon,  7 Oct 2024 22:25:10 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b="Vt/jQpsJ";
	dmarc=none;
	spf=pass (lists.linaro.org: domain of laurent.pinchart@ideasonboard.com designates 213.167.242.64 as permitted sender) smtp.mailfrom=laurent.pinchart@ideasonboard.com
Received: from pendragon.ideasonboard.com (unknown [132.205.230.14])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3BF2C2E0;
	Tue,  8 Oct 2024 00:23:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1728339812;
	bh=dP+7pB+yKyOf0NQhF4Ey5QlbknqrHAfw9DP+SkAi1ag=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Vt/jQpsJvHUxjmrGDOx6XdDb5/eYcmNOZ+fqGvfgmsCX/Gb8xh5L8MF7/XiaHHs5d
	 yKwoK1M07KNVU8k6VzBH5mlVNl0fsdfcm8rX4+3gQCvlKP9vNnMhm8hVpFB58jMlbq
	 3JlQ6yo4ObX+z3BTaIVDayxCEaIiiFVwmh4Cxqis=
Date: Tue, 8 Oct 2024 01:25:02 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Message-ID: <20241007222502.GG30699@pendragon.ideasonboard.com>
References: <20241004094101.113349-1-sakari.ailus@linux.intel.com>
 <CAPDyKFp0N6UJhnHS164Tdf=xkWB0jzq65L9TdvYazeBQ-6WjeQ@mail.gmail.com>
 <20241007184924.GH14766@pendragon.ideasonboard.com>
 <CAPDyKFpQVnF7eQv3dup8k-3EijnMjuveCG9sZ=Rpey1Y6MBJEg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPDyKFpQVnF7eQv3dup8k-3EijnMjuveCG9sZ=Rpey1Y6MBJEg@mail.gmail.com>
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 362733F64C
X-Spamd-Bar: -----
X-Spamd-Result: default: False [-5.88 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-2.98)[99.92%];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+mx];
	MIME_GOOD(-0.10)[text/plain];
	ONCE_RECEIVED(0.10)[];
	ASN(0.00)[asn:29169, ipnet:213.167.240.0/20, country:FR];
	RCVD_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[39];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DMARC_NA(0.00)[ideasonboard.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,lists.freedesktop.org,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org,opensource.cirrus.com,lists.linux.dev,lists.linaro.org,kernel.org,gmail.com];
	TAGGED_RCPT(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+]
X-Rspamd-Action: no action
Message-ID-Hash: D3VIXW6L4XGXOZKZMZRUP4GOMWTPQZY5
X-Message-ID-Hash: D3VIXW6L4XGXOZKZMZRUP4GOMWTPQZY5
X-MailFrom: laurent.pinchart@ideasonboard.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Sakari Ailus <sakari.ailus@linux.intel.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org, linux-clk@vger.kernel.org, linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org, linux-gpio@vger.kernel.org, amd-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, linux-i3c@lists.infradead.org, linux-iio@vger.kernel.org, linux-input@vger.kernel.org, patches@opensource.cirrus.com, iommu@lists.linux.dev, imx@lists.linux.dev, linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org, linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-pci@vger.kernel.org, linux-phy@lists.infradead.org, linux-pwm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-sound@vger.kernel.org, linux-spi@vger.kernel.org, linux-staging@lists.linux.dev, linux-usb@vger.kernel.org
 , linux-serial@vger.kernel.org, greybus-dev@lists.linaro.org, asahi@lists.linux.dev, rafael@kernel.org, Andy Shevchenko <andy.shevchenko@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 00/51] treewide: Switch to __pm_runtime_put_autosuspend()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/D3VIXW6L4XGXOZKZMZRUP4GOMWTPQZY5/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Ulf,

On Tue, Oct 08, 2024 at 12:08:24AM +0200, Ulf Hansson wrote:
> On Mon, 7 Oct 2024 at 20:49, Laurent Pinchart wrote:
> > On Fri, Oct 04, 2024 at 04:38:36PM +0200, Ulf Hansson wrote:
> > > On Fri, 4 Oct 2024 at 11:41, Sakari Ailus wrote:
> > > >
> > > > Hello everyone,
> > > >
> > > > This set will switch the users of pm_runtime_put_autosuspend() to
> > > > __pm_runtime_put_autosuspend() while the former will soon be re-purposed
> > > > to include a call to pm_runtime_mark_last_busy(). The two are almost
> > > > always used together, apart from bugs which are likely common. Going
> > > > forward, most new users should be using pm_runtime_put_autosuspend().
> > > >
> > > > Once this conversion is done and pm_runtime_put_autosuspend() re-purposed,
> > > > I'll post another set to merge the calls to __pm_runtime_put_autosuspend()
> > > > and pm_runtime_mark_last_busy().
> > >
> > > That sounds like it could cause a lot of churns.
> > >
> > > Why not add a new helper function that does the
> > > pm_runtime_put_autosuspend() and the pm_runtime_mark_last_busy()
> > > things? Then we can start moving users over to this new interface,
> > > rather than having this intermediate step?
> >
> > I think the API would be nicer if we used the shortest and simplest
> > function names for the most common use cases. Following
> > pm_runtime_put_autosuspend() with pm_runtime_mark_last_busy() is that
> > most common use case. That's why I like Sakari's approach of repurposing
> > pm_runtime_put_autosuspend(), and introducing
> > __pm_runtime_put_autosuspend() for the odd cases where
> > pm_runtime_mark_last_busy() shouldn't be called.
> 
> Okay, so the reason for this approach is because we couldn't find a
> short and descriptive name that could be used in favor of
> pm_runtime_put_autosuspend(). Let me throw some ideas at it and maybe
> you like it - or not. :-)

I like the idea at least :-)

> I don't know what options you guys discussed, but to me the entire
> "autosuspend"-suffix isn't really that necessary in my opinion. There
> are more ways than calling pm_runtime_put_autosuspend() that triggers
> us to use the RPM_AUTO flag for rpm_suspend(). For example, just
> calling pm_runtime_put() has the similar effect.

To be honest, I'm lost there. pm_runtime_put() calls
__pm_runtime_idle(RPM_GET_PUT | RPM_ASYNC), while
pm_runtime_put_autosuspend() calls __pm_runtime_suspend(RPM_GET_PUT |
RPM_ASYNC | RPM_AUTO).

> 
> Moreover, it's similar for pm_runtime_mark_last_busy(), it's called
> during rpm_resume() too, for example. So why bother about having
> "mark_last_busy" in the new name too.
> 
> That said, my suggestion is simply "pm_runtime_put_suspend".

Can we do even better, and make pm_runtime_put() to handle autosuspend
automatically when autosuspend is enabled ?

> If you don't like it, I will certainly not object to your current
> approach, even if I think it leads to unnecessary churns.
> 
> [...]
> 
> Kind regards
> Uffe

-- 
Regards,

Laurent Pinchart
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
