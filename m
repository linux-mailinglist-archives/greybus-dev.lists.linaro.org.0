Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id B7BE44B74AB
	for <lists+greybus-dev@lfdr.de>; Tue, 15 Feb 2022 20:24:50 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id E88653EE8B
	for <lists+greybus-dev@lfdr.de>; Tue, 15 Feb 2022 19:24:49 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	by lists.linaro.org (Postfix) with ESMTPS id A33373ED2A;
	Tue, 15 Feb 2022 19:24:47 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4835061758;
	Tue, 15 Feb 2022 19:24:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8127AC340EB;
	Tue, 15 Feb 2022 19:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1644953086;
	bh=kUCZYr9eynBGfoyFNpGztKhdR0TjeWfPR20goAdEojo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pgheRwOAKjRlXMfJul10RwEjs5CBKHR/i0QEhyIM79774uc0ovg3u5myvyhB8s/qu
	 xkZdoun6Ve/NuXn1+qZDB9F/trYlid+yq9euKiwm3PP7bJ4zoGvDfPTjgfeWCzsH6f
	 Z5GtGABFqXnkSAxbAOokUuetZQuukvg8GogLN1PAUilOeXNWgORbaiYjI/aeCr++5W
	 YWvZj7f6KVH+xfahOEVmZaopl52rdr1jj6eaQg39ut/UgM8cVQWsEKIq8K1eRZzAAa
	 TaPAe7uN1AmbZCmz+9XMV8T/S9ihvGxGOcJfBqdWD8uwk44Sq4S7ITZBKug7wSeC6N
	 S7tHpNRHJfaSA==
Date: Tue, 15 Feb 2022 13:32:21 -0600
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Leon Romanovsky <leon@kernel.org>
Message-ID: <20220215193221.GA884407@embeddedor>
References: <20220215174743.GA878920@embeddedor>
 <202202151016.C0471D6E@keescook>
 <20220215192110.GA883653@embeddedor>
 <Ygv8wY75hNqS7zO6@unreal>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Ygv8wY75hNqS7zO6@unreal>
Message-ID-Hash: GLOI3K46NUHO2RNXDHLKCD43QI2V24GD
X-Message-ID-Hash: GLOI3K46NUHO2RNXDHLKCD43QI2V24GD
X-MailFrom: gustavoars@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Kees Cook <keescook@chromium.org>, GR-QLogic-Storage-Upstream@marvell.com, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, linux-ia64@vger.kernel.org, linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, linux-um@lists.infradead.org, linux-xtensa@linux-xtensa.org, linux-crypto@vger.kernel.org, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com, netdev@vger.kernel.org, linux-omap@vger.kernel.org, linux-scsi@vger.kernel.org, target-devel@vger.kernel.org, mpi3mr-linuxdrv.pdl@broadcom.com, linux-staging@lists.linux.dev, linux-rpi-kernel@lists.infradead.org, sparmaintainer@unisys.com, linux-cifs@vger.kernel.org, samba-technical@lists.samba.org, linux-ext4@vger.kernel.org, linux-acpi@vger.kernel.org, devel@acpica.org, linux-arch@vger.kernel.org, linux-mm@kvack.org, greybus-dev@lists.linaro.org, linu
 x-i3c@lists.infradead.org, linux-rdma@vger.kernel.org, linux-bluetooth@vger.kernel.org, alsa-devel@alsa-project.org, devicetree@vger.kernel.org, linux-perf-users@vger.kernel.org, linux-hardening@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH][next] treewide: Replace zero-length arrays with flexible-array members
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/GLOI3K46NUHO2RNXDHLKCD43QI2V24GD/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Feb 15, 2022 at 09:19:29PM +0200, Leon Romanovsky wrote:
> On Tue, Feb 15, 2022 at 01:21:10PM -0600, Gustavo A. R. Silva wrote:
> > On Tue, Feb 15, 2022 at 10:17:40AM -0800, Kees Cook wrote:
> > > On Tue, Feb 15, 2022 at 11:47:43AM -0600, Gustavo A. R. Silva wrote:
> > > 
> > > These all look trivially correct to me. Only two didn't have the end of
> > > the struct visible in the patch, and checking those showed them to be
> > > trailing members as well, so:
> > > 
> > > Reviewed-by: Kees Cook <keescook@chromium.org>
> > 
> > I'll add this to my -next tree.
> 
> I would like to ask you to send mlx5 patch separately to netdev. We are working
> to delete that file completely and prefer to avoid from unnecessary merge conflicts.

Oh OK. Sure thing; I will do so.

Thanks
--
Gustavo
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
