Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id BA9084C6472
	for <lists+greybus-dev@lfdr.de>; Mon, 28 Feb 2022 09:12:00 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id F15AC3EF15
	for <lists+greybus-dev@lfdr.de>; Mon, 28 Feb 2022 08:11:59 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	by lists.linaro.org (Postfix) with ESMTPS id A247B3EEF9
	for <greybus-dev@lists.linaro.org>; Mon, 28 Feb 2022 08:11:57 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id BFE14B80E58
	for <greybus-dev@lists.linaro.org>; Mon, 28 Feb 2022 08:11:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72122C36AE7
	for <greybus-dev@lists.linaro.org>; Mon, 28 Feb 2022 08:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1646035915;
	bh=zMDLEB8toWf2EIp4Gbj5PSCBFzWdzLn4mVbcpqFSMxs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=G5/HKt1YcKrybKD+1q8UgQW8r6UniPBg+HgJCRHDiawTCCJy2G9uMVmVMIrAH+MIY
	 uUZuQAmqf+UgQqG4LSwOUKjuA8mlT2hPXWXAetE6/wffM3OsZ6cQuw+SmzDdC9fizY
	 tnKAD3prEcX2CmRCAP5e0Sp4+MmIaoIy7bEgoECFMmrlcDv1M29iegogMcMJXx4EzC
	 Ww6E2vE2Ei6Ccl+33CFLA3ixlnEAH6a8FHRWu+p6u8hOq0ib6UliPV2J7DZbNT/orL
	 Z5vh8VINzIAjIFdahYuMGIJkpIkpdyHyDhOYN0mcWcjSY+6pRXFj43dgIYPqjgmCqP
	 vBf0o1GuFv9eA==
Received: by mail-wm1-f46.google.com with SMTP id p4so5177416wmg.1
        for <greybus-dev@lists.linaro.org>; Mon, 28 Feb 2022 00:11:55 -0800 (PST)
X-Gm-Message-State: AOAM530BnXsHtbjaE8Me4BkatXGpJ8wEGyTfwhQv2GdjoaEvYhnPOQpS
	/bamCuiN/FnnsmUQTTtQ1RVe/7A193L5alL4s7U=
X-Google-Smtp-Source: ABdhPJx0yttNosgz0Dhhih9aIMEkkBewvoulgcXNOZok4rXBWTX7Xo99SrIvGnmvPy9Xsi9me/xpLhkH8sj6MYMy+yQ=
X-Received: by 2002:a05:600c:4802:b0:381:3b27:89b7 with SMTP id
 i2-20020a05600c480200b003813b2789b7mr11349875wmo.173.1646035913752; Mon, 28
 Feb 2022 00:11:53 -0800 (PST)
MIME-Version: 1.0
References: <20220227215408.3180023-1-arnd@kernel.org> <YhwT2Gw8vsQHPxAB@quad.stoffel.home>
In-Reply-To: <YhwT2Gw8vsQHPxAB@quad.stoffel.home>
From: Arnd Bergmann <arnd@kernel.org>
Date: Mon, 28 Feb 2022 09:11:37 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1A8Y3F93FzbWum9U=_Mc8zR9T5p=tTkQK90ARan41EbA@mail.gmail.com>
Message-ID: <CAK8P3a1A8Y3F93FzbWum9U=_Mc8zR9T5p=tTkQK90ARan41EbA@mail.gmail.com>
To: john@quad.stoffel.home
Message-ID-Hash: 3EU4U4GDVS6VAR75K5HGLWJVPNQNDKQU
X-Message-ID-Hash: 3EU4U4GDVS6VAR75K5HGLWJVPNQNDKQU
X-MailFrom: arnd@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Linus Torvalds <torvalds@linux-foundation.org>, Masahiro Yamada <masahiroy@kernel.org>, llvm@lists.linux.dev, Jonathan Corbet <corbet@lwn.net>, Federico Vaga <federico.vaga@vaga.pv.it>, Alex Shi <alexs@kernel.org>, Hu Haowen <src.res@email.cn>, Michal Marek <michal.lkml@markovi.net>, Nick Desaulniers <ndesaulniers@google.com>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-doc-tw-discuss@lists.sourceforge.net, Linux ARM <linux-arm-kernel@lists.infradead.org>, Intel Graphics <intel-gfx@lists.freedesktop.org>, dri-devel <dri-devel@lists.freedesktop.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-btrfs <linux-btrfs@vger.kernel.org>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] Kbuild: remove -std=gnu89 from compiler arguments
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/3EU4U4GDVS6VAR75K5HGLWJVPNQNDKQU/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Feb 28, 2022 at 1:14 AM John Stoffel <john@quad.stoffel.home> wrote:
>
> On Sun, Feb 27, 2022 at 10:52:43PM +0100, Arnd Bergmann wrote:
> > From: Arnd Bergmann <arnd@arndb.de>
> >
> > During a patch discussion, Linus brought up the option of changing
> > the C standard version from gnu89 to gnu99, which allows using variable
> > declaration inside of a for() loop. While the C99, C11 and later standards
> > introduce many other features, most of these are already available in
> > gnu89 as GNU extensions as well.
> >
> > An earlier attempt to do this when gcc-5 started defaulting to
> > -std=gnu11 failed because at the time that caused warnings about
> > designated initializers with older compilers. Now that gcc-5.1 is the
> > minimum compiler version used for building kernels, that is no longer a
> > concern. Similarly, the behavior of 'inline' functions changes between
> > gnu89 and gnu89, but this was taken care of by defining 'inline' to
>
> Typo here?  Second one should be gnu99 right?


Fixed, thanks!

        Arnd
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
