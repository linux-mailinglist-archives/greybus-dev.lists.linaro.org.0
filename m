Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id D922B993A40
	for <lists+greybus-dev@lfdr.de>; Tue,  8 Oct 2024 00:35:32 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id BF46543FE4
	for <lists+greybus-dev@lfdr.de>; Mon,  7 Oct 2024 22:35:31 +0000 (UTC)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	by lists.linaro.org (Postfix) with ESMTPS id DD5503F4E0
	for <greybus-dev@lists.linaro.org>; Mon,  7 Oct 2024 22:35:26 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linaro.org header.s=google header.b=cbcl+G51;
	dmarc=pass (policy=none) header.from=linaro.org;
	spf=pass (lists.linaro.org: domain of ulf.hansson@linaro.org designates 209.85.219.170 as permitted sender) smtp.mailfrom=ulf.hansson@linaro.org
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e25cf3c7278so4378296276.3
        for <greybus-dev@lists.linaro.org>; Mon, 07 Oct 2024 15:35:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728340526; x=1728945326; darn=lists.linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gesjil9Y0RZgbcjmX5qHd/S97rHztDCcedkOm+1cl0k=;
        b=cbcl+G51UcfF+XgH5m6XbTJUKOaymdSD114T4LgOf/U029+GWf4lGtTy+Am61CIGAH
         Bn3fSeaeYJ/UEPeMUJ99+6jVYmkScVdRHPHlHVaYBBHmRvbB/zN6AVd2Vz9pR/WxpPJ/
         Fk9d6U8qL37KVT2bzwwzUSN7v68jdfv4pv90TDx6/FTw4oQ2mZAcLALcCovvjWDtW+JA
         cLukzplvSB9mqmUGXm6yMBl6Bnrkvfg/SBeLQJXe0KmXRleUXm9/Blke8k2EHBpddViv
         81zEJHBofEEvYby5yFgc6DidP/t+1DQkzR/jzO78kAIwbV4ZmoZWmSQ0+bmPNfuVcGfY
         BMlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728340526; x=1728945326;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gesjil9Y0RZgbcjmX5qHd/S97rHztDCcedkOm+1cl0k=;
        b=ctFiVIO7szIhLWjtVsyNaOPjPYZY+ebjw7ADbE7yXXHdICebNkb1Gkdm0Eh6VU2dTy
         R15Unh5kGVD9JhZUd0OCpa3QzrJ4QMdOuq6oo3dskA1nXjmjefYx1xpPHWsE/Ftgipep
         Bvyc8c+3qzm9EKnWImmmC7NXDoYpzsPy2RrQRx+Q5jWQTZ1GoeQOF/0pJIyc6MeViXT/
         8t1bPHdIwGiX1BJFdnk2e0VdpyXvAAdF75vbVSSxRychWmwjoPxGGiBymzv4uhKhKj/+
         18U3rjhb6lRHdboABm1pdNeu4K6O6TgWUlpEy1ey6KN5AuDJqKufoFv8ndRTWh7G2O5i
         /6sA==
X-Forwarded-Encrypted: i=1; AJvYcCV2PSSlphw1Yq9HV4MZDEXXnrWI/bwt2IWpsOZQFGiNT/Q7duVYsd2eVCSRkcZCMEuHIsk9ivX4EuQxhw==@lists.linaro.org
X-Gm-Message-State: AOJu0Ywm0FrsCno9c9EX6lnrTpCXDk5RwNl9wT7JHqN2BbUYkcEHDBbZ
	X+pJmn71OJ1tPh6lQWqPeOoVXQvl5NAjq0VG9fN1bRmOCtQNnPf389QboFadMp56SS/H30sNZt9
	TR0v1HRUG6Co67OYzvbMYgD3fGBf+fjmjig7jkMDG
X-Google-Smtp-Source: AGHT+IGYLLRVc3CeXKReIUVnntYlZ+ULRb29gPUl3UTx4hoqAUGdx6q2aFDzdnacRWqcM/cOYseo4GoEdp7e3a8qLZE=
X-Received: by 2002:a05:6902:2305:b0:e28:6ec7:4353 with SMTP id
 3f1490d57ef6-e2893964043mr10612649276.54.1728340526338; Mon, 07 Oct 2024
 15:35:26 -0700 (PDT)
MIME-Version: 1.0
References: <20241004094101.113349-1-sakari.ailus@linux.intel.com>
 <CAPDyKFp0N6UJhnHS164Tdf=xkWB0jzq65L9TdvYazeBQ-6WjeQ@mail.gmail.com>
 <20241007184924.GH14766@pendragon.ideasonboard.com> <CAPDyKFpQVnF7eQv3dup8k-3EijnMjuveCG9sZ=Rpey1Y6MBJEg@mail.gmail.com>
 <20241007222502.GG30699@pendragon.ideasonboard.com>
In-Reply-To: <20241007222502.GG30699@pendragon.ideasonboard.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 8 Oct 2024 00:34:49 +0200
Message-ID: <CAPDyKFrGNwna6Y2pqSRaBbRYHKRaD2ayqQHLtoqLPOu9Et7qTg@mail.gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: DD5503F4E0
X-Spamd-Bar: ------
X-Spamd-Result: default: False [-6.50 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCVD_COUNT_ONE(0.00)[1];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[39];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.219.170:from];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,lists.freedesktop.org,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org,opensource.cirrus.com,lists.linux.dev,lists.linaro.org,kernel.org,gmail.com];
	TAGGED_RCPT(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+]
X-Rspamd-Action: no action
Message-ID-Hash: G2SNB3GHSHBVRYFNNTGNDUCEUBJXRLJI
X-Message-ID-Hash: G2SNB3GHSHBVRYFNNTGNDUCEUBJXRLJI
X-MailFrom: ulf.hansson@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Sakari Ailus <sakari.ailus@linux.intel.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org, linux-clk@vger.kernel.org, linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org, linux-gpio@vger.kernel.org, amd-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, linux-i3c@lists.infradead.org, linux-iio@vger.kernel.org, linux-input@vger.kernel.org, patches@opensource.cirrus.com, iommu@lists.linux.dev, imx@lists.linux.dev, linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org, linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-pci@vger.kernel.org, linux-phy@lists.infradead.org, linux-pwm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-sound@vger.kernel.org, linux-spi@vger.kernel.org, linux-staging@lists.linux.dev, linux-usb@vger.kernel.org
 , linux-serial@vger.kernel.org, greybus-dev@lists.linaro.org, asahi@lists.linux.dev, rafael@kernel.org, Andy Shevchenko <andy.shevchenko@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 00/51] treewide: Switch to __pm_runtime_put_autosuspend()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/G2SNB3GHSHBVRYFNNTGNDUCEUBJXRLJI/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, 8 Oct 2024 at 00:25, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Ulf,
>
> On Tue, Oct 08, 2024 at 12:08:24AM +0200, Ulf Hansson wrote:
> > On Mon, 7 Oct 2024 at 20:49, Laurent Pinchart wrote:
> > > On Fri, Oct 04, 2024 at 04:38:36PM +0200, Ulf Hansson wrote:
> > > > On Fri, 4 Oct 2024 at 11:41, Sakari Ailus wrote:
> > > > >
> > > > > Hello everyone,
> > > > >
> > > > > This set will switch the users of pm_runtime_put_autosuspend() to
> > > > > __pm_runtime_put_autosuspend() while the former will soon be re-purposed
> > > > > to include a call to pm_runtime_mark_last_busy(). The two are almost
> > > > > always used together, apart from bugs which are likely common. Going
> > > > > forward, most new users should be using pm_runtime_put_autosuspend().
> > > > >
> > > > > Once this conversion is done and pm_runtime_put_autosuspend() re-purposed,
> > > > > I'll post another set to merge the calls to __pm_runtime_put_autosuspend()
> > > > > and pm_runtime_mark_last_busy().
> > > >
> > > > That sounds like it could cause a lot of churns.
> > > >
> > > > Why not add a new helper function that does the
> > > > pm_runtime_put_autosuspend() and the pm_runtime_mark_last_busy()
> > > > things? Then we can start moving users over to this new interface,
> > > > rather than having this intermediate step?
> > >
> > > I think the API would be nicer if we used the shortest and simplest
> > > function names for the most common use cases. Following
> > > pm_runtime_put_autosuspend() with pm_runtime_mark_last_busy() is that
> > > most common use case. That's why I like Sakari's approach of repurposing
> > > pm_runtime_put_autosuspend(), and introducing
> > > __pm_runtime_put_autosuspend() for the odd cases where
> > > pm_runtime_mark_last_busy() shouldn't be called.
> >
> > Okay, so the reason for this approach is because we couldn't find a
> > short and descriptive name that could be used in favor of
> > pm_runtime_put_autosuspend(). Let me throw some ideas at it and maybe
> > you like it - or not. :-)
>
> I like the idea at least :-)
>
> > I don't know what options you guys discussed, but to me the entire
> > "autosuspend"-suffix isn't really that necessary in my opinion. There
> > are more ways than calling pm_runtime_put_autosuspend() that triggers
> > us to use the RPM_AUTO flag for rpm_suspend(). For example, just
> > calling pm_runtime_put() has the similar effect.
>
> To be honest, I'm lost there. pm_runtime_put() calls
> __pm_runtime_idle(RPM_GET_PUT | RPM_ASYNC), while
> pm_runtime_put_autosuspend() calls __pm_runtime_suspend(RPM_GET_PUT |
> RPM_ASYNC | RPM_AUTO).

__pm_runtime_idle() ends up calling rpm_idle(), which may call
rpm_suspend() - if it succeeds to idle the device. In that case, it
tags on the RPM_AUTO flag in the call to rpm_suspend(). Quite similar
to what is happening when calling pm_runtime_put_autosuspend().

>
> >
> > Moreover, it's similar for pm_runtime_mark_last_busy(), it's called
> > during rpm_resume() too, for example. So why bother about having
> > "mark_last_busy" in the new name too.
> >
> > That said, my suggestion is simply "pm_runtime_put_suspend".
>
> Can we do even better, and make pm_runtime_put() to handle autosuspend
> automatically when autosuspend is enabled ?

As stated above, this is already the case.

>
> > If you don't like it, I will certainly not object to your current
> > approach, even if I think it leads to unnecessary churns.
> >
> > [...]
> >
> > Kind regards
> > Uffe
>
> --
> Regards,
>
> Laurent Pinchart

Kind regards
Uffe
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
