Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 40DBA9939D0
	for <lists+greybus-dev@lfdr.de>; Tue,  8 Oct 2024 00:09:07 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 1B2E543FE6
	for <lists+greybus-dev@lfdr.de>; Mon,  7 Oct 2024 22:09:06 +0000 (UTC)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	by lists.linaro.org (Postfix) with ESMTPS id 66FB63F4E0
	for <greybus-dev@lists.linaro.org>; Mon,  7 Oct 2024 22:09:01 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linaro.org header.s=google header.b=QtkPqBlm;
	dmarc=pass (policy=none) header.from=linaro.org;
	spf=pass (lists.linaro.org: domain of ulf.hansson@linaro.org designates 209.85.219.181 as permitted sender) smtp.mailfrom=ulf.hansson@linaro.org
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e28e6a1b11eso706182276.0
        for <greybus-dev@lists.linaro.org>; Mon, 07 Oct 2024 15:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728338941; x=1728943741; darn=lists.linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CqX9Y0dEmHgiIN61I3/zW08Bfod5n7pFQiGUVIMbBVk=;
        b=QtkPqBlmil/Ph+OvkIv/vtjP+bf0cQIaQVzh0zFas9ETJ0ZclsBM9Sra7TlRMKwOYp
         rRZwPpECp/Oj4/lAR4ylByn+ABtRwuvcvIi6NgzBB8nUfAdTOVGddIYgOwJCqrS/JhUq
         s8c6+DinfjMFH9bhCbbv37H4mP6t6D27PpH6/1YovnrS+9nkOkz3WZevlLosRvjyFhdF
         EZ7dT2lEO/XmxlfgoGgCZNvbF3hEG9BqdseWuMyhXjLhkJqVngFbB2GuKV5lO0ZV07P8
         bx62v9zmWSuRtCTXL/IQfqkn35bdpJYSwo2VkjIb4IW55CL2CJ3EH/csn7FGnet9MGW5
         SdoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728338941; x=1728943741;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CqX9Y0dEmHgiIN61I3/zW08Bfod5n7pFQiGUVIMbBVk=;
        b=K//tiwN6qZwloKQyArprFsS0gSS5d/Bzxt/qolToW1UA8r2AyEvZmNhsneMw/Wo9IT
         zKWWMOs8MLEHyRlQYMFQHJ/eyYf9/8WuHfEHs3Io9X1n7w6msRLLO3wKQKfY+PhWqKS0
         juxrkqHK57Bq6WEqN41o8aeinnIce2J81syqWG20HzXNqOGrnIwtK3NxTfz8iekdMoTB
         RMoqMVB0XW45xyIVh4YVsX7hd3bJssFjX7AF1OupgFkcp0FJY87n8SkRBasyeWz292HV
         88AqDWCVQa3iGt1WQXMk4gCuk/rU0kxt3ht9w4bfu6x2PzLQoOk6PdTFsYUUOhJ52t+c
         Zevw==
X-Forwarded-Encrypted: i=1; AJvYcCUGbr9iz1ARrQjss/UpFB3/uLro+3Zzy5xPh5GXMMgPgCvN7vrw9EuSS/IZSf8mj8eyIy+9WEEXbRp+Ag==@lists.linaro.org
X-Gm-Message-State: AOJu0Yx0FO1XMSJ2xPe3eZRW++A1M8JQjZlg/060X+O/WeV289FkDF3j
	FKcg4Ww3DlkBl2EQvje/yCPIQ1hF+2t+83Fc9V2JIVyKVhW9bm+msNCc7kc7p6IEhjlY44pMydW
	J4HybAMWlqzrduxb4JYEKUaHyFFnlI0lq5C1OQnfF
X-Google-Smtp-Source: AGHT+IE2nJVabbXdwibt1H0pVBms5dYTsG8RkBKKAzfdsgMhYsZ8VyWIk7HanuWHiQPQxXFBk2ezA08qlljJFN0QQR4=
X-Received: by 2002:a05:6902:848:b0:e28:edbd:765f with SMTP id
 3f1490d57ef6-e28edbd7f75mr206026276.2.1728338940867; Mon, 07 Oct 2024
 15:09:00 -0700 (PDT)
MIME-Version: 1.0
References: <20241004094101.113349-1-sakari.ailus@linux.intel.com>
 <CAPDyKFp0N6UJhnHS164Tdf=xkWB0jzq65L9TdvYazeBQ-6WjeQ@mail.gmail.com> <20241007184924.GH14766@pendragon.ideasonboard.com>
In-Reply-To: <20241007184924.GH14766@pendragon.ideasonboard.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 8 Oct 2024 00:08:24 +0200
Message-ID: <CAPDyKFpQVnF7eQv3dup8k-3EijnMjuveCG9sZ=Rpey1Y6MBJEg@mail.gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 66FB63F4E0
X-Spamd-Bar: ------
X-Spamd-Result: default: False [-6.45 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-2.95)[99.79%];
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
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.219.181:from];
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
Message-ID-Hash: CA6GJQFK33RPUFV4VIGI3SRBNMYGC7YD
X-Message-ID-Hash: CA6GJQFK33RPUFV4VIGI3SRBNMYGC7YD
X-MailFrom: ulf.hansson@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Sakari Ailus <sakari.ailus@linux.intel.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org, linux-clk@vger.kernel.org, linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org, linux-gpio@vger.kernel.org, amd-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, linux-i3c@lists.infradead.org, linux-iio@vger.kernel.org, linux-input@vger.kernel.org, patches@opensource.cirrus.com, iommu@lists.linux.dev, imx@lists.linux.dev, linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org, linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-pci@vger.kernel.org, linux-phy@lists.infradead.org, linux-pwm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-sound@vger.kernel.org, linux-spi@vger.kernel.org, linux-staging@lists.linux.dev, linux-usb@vger.kernel.org
 , linux-serial@vger.kernel.org, greybus-dev@lists.linaro.org, asahi@lists.linux.dev, rafael@kernel.org, Andy Shevchenko <andy.shevchenko@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 00/51] treewide: Switch to __pm_runtime_put_autosuspend()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/CA6GJQFK33RPUFV4VIGI3SRBNMYGC7YD/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, 7 Oct 2024 at 20:49, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Ulf,
>
> On Fri, Oct 04, 2024 at 04:38:36PM +0200, Ulf Hansson wrote:
> > On Fri, 4 Oct 2024 at 11:41, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
> > >
> > > Hello everyone,
> > >
> > > This set will switch the users of pm_runtime_put_autosuspend() to
> > > __pm_runtime_put_autosuspend() while the former will soon be re-purposed
> > > to include a call to pm_runtime_mark_last_busy(). The two are almost
> > > always used together, apart from bugs which are likely common. Going
> > > forward, most new users should be using pm_runtime_put_autosuspend().
> > >
> > > Once this conversion is done and pm_runtime_put_autosuspend() re-purposed,
> > > I'll post another set to merge the calls to __pm_runtime_put_autosuspend()
> > > and pm_runtime_mark_last_busy().
> >
> > That sounds like it could cause a lot of churns.
> >
> > Why not add a new helper function that does the
> > pm_runtime_put_autosuspend() and the pm_runtime_mark_last_busy()
> > things? Then we can start moving users over to this new interface,
> > rather than having this intermediate step?
>
> I think the API would be nicer if we used the shortest and simplest
> function names for the most common use cases. Following
> pm_runtime_put_autosuspend() with pm_runtime_mark_last_busy() is that
> most common use case. That's why I like Sakari's approach of repurposing
> pm_runtime_put_autosuspend(), and introducing
> __pm_runtime_put_autosuspend() for the odd cases where
> pm_runtime_mark_last_busy() shouldn't be called.

Okay, so the reason for this approach is because we couldn't find a
short and descriptive name that could be used in favor of
pm_runtime_put_autosuspend(). Let me throw some ideas at it and maybe
you like it - or not. :-)

I don't know what options you guys discussed, but to me the entire
"autosuspend"-suffix isn't really that necessary in my opinion. There
are more ways than calling pm_runtime_put_autosuspend() that triggers
us to use the RPM_AUTO flag for rpm_suspend(). For example, just
calling pm_runtime_put() has the similar effect.

Moreover, it's similar for pm_runtime_mark_last_busy(), it's called
during rpm_resume() too, for example. So why bother about having
"mark_last_busy" in the new name too.

That said, my suggestion is simply "pm_runtime_put_suspend".

If you don't like it, I will certainly not object to your current
approach, even if I think it leads to unnecessary churns.

[...]

Kind regards
Uffe
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
