Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FC2B4C6458
	for <lists+greybus-dev@lfdr.de>; Mon, 28 Feb 2022 09:07:28 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 1623D3EE53
	for <lists+greybus-dev@lfdr.de>; Mon, 28 Feb 2022 08:07:27 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	by lists.linaro.org (Postfix) with ESMTPS id 46C1A3EE53
	for <greybus-dev@lists.linaro.org>; Mon, 28 Feb 2022 08:07:24 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 5BFBCB80DD3
	for <greybus-dev@lists.linaro.org>; Mon, 28 Feb 2022 08:07:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 808A9C340F9
	for <greybus-dev@lists.linaro.org>; Mon, 28 Feb 2022 08:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1646035641;
	bh=ZIThCTjaypYDGsg6PqLBGFPVK72nb1FskfDKUMQoQFo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=aD1Bq94lyoSrU2rCMMALEIwxpVEUCGPfDF3dSAY04qYShfUHRGnHnfOLK00oUyW0n
	 ZqsMF2iFDnWnNQU4y+SGtYOAu5Ni1fTK3qmdoXezKrSqgWCYwRDMEoKeNDdb+Nkuz3
	 qCcOiJz8mrsH9PbnU9Uy6ClGyXORbh7pBctQV46m71jB+a9PCxnWvZ62vTMJBnf1Xx
	 q8KNT0ei+VPVQMCRbzemricf9saJwYLDd4YpN1D4EvBQKNGAbl0BWqTlhRM3X0vYXD
	 MHWCP9V/paczpqcSPuXqjoBZyne5r0/hJDs5BnKQTtpBr0XDpT3ldBKKSTwvH5O2Xk
	 UqCo5U8NmR1hw==
Received: by mail-wm1-f47.google.com with SMTP id bg31-20020a05600c3c9f00b00381590dbb33so1667891wmb.3
        for <greybus-dev@lists.linaro.org>; Mon, 28 Feb 2022 00:07:21 -0800 (PST)
X-Gm-Message-State: AOAM531UziuPFv8tBY7gmQlfPZQ0VDGBQ35GKoMe0f2+eX76wEH3bpp+
	ZufU7n5+pHTlovH3Y26AF2sx5EF/EK/495YEq2s=
X-Google-Smtp-Source: ABdhPJzpcZ5s+5KOBMUi70sNCMSXIqY3vXEepsFRSDE8fekaJ/SUkhm+3dpDI9J9lgxQZ0OAu6bPJpVx/Y8rip86Cms=
X-Received: by 2002:a05:600c:4f8e:b0:381:6de4:fccc with SMTP id
 n14-20020a05600c4f8e00b003816de4fcccmr1697739wmq.82.1646035639695; Mon, 28
 Feb 2022 00:07:19 -0800 (PST)
MIME-Version: 1.0
References: <20220227215408.3180023-1-arnd@kernel.org> <CAHk-=whWbENRz-vLY6vpESDLj6kGUTKO3khGtVfipHqwewh2HQ@mail.gmail.com>
In-Reply-To: <CAHk-=whWbENRz-vLY6vpESDLj6kGUTKO3khGtVfipHqwewh2HQ@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Mon, 28 Feb 2022 09:07:03 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3Lv_uSXt9yf-9iOV3hZgV7KvwZjL-gbLTLRgo0UOQguw@mail.gmail.com>
Message-ID: <CAK8P3a3Lv_uSXt9yf-9iOV3hZgV7KvwZjL-gbLTLRgo0UOQguw@mail.gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID-Hash: JZ4M6WPJW5NJT7A5WRIQ7XORDMPMDFY3
X-Message-ID-Hash: JZ4M6WPJW5NJT7A5WRIQ7XORDMPMDFY3
X-MailFrom: arnd@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Masahiro Yamada <masahiroy@kernel.org>, llvm@lists.linux.dev, Jonathan Corbet <corbet@lwn.net>, Federico Vaga <federico.vaga@vaga.pv.it>, Alex Shi <alexs@kernel.org>, Hu Haowen <src.res@email.cn>, Michal Marek <michal.lkml@markovi.net>, Nick Desaulniers <ndesaulniers@google.com>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-doc-tw-discuss@lists.sourceforge.net, Linux ARM <linux-arm-kernel@lists.infradead.org>, intel-gfx <intel-gfx@lists.freedesktop.org>, dri-devel <dri-devel@lists.freedesktop.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-btrfs <linux-btrfs@vger.kernel.org>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] Kbuild: remove -std=gnu89 from compiler arguments
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/JZ4M6WPJW5NJT7A5WRIQ7XORDMPMDFY3/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, Feb 27, 2022 at 11:36 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> And I don't want somebody with a newer compiler version to not notice
> that he or she ended up using a c17 feature, just because _that_
> compiler supported it, and then other people get build errors because
> their compilers use gnu11 instead by default.
>
> Put another way: I see absolutely no upside to allowing different
> users using higher/lower versions of the standard. There are only
> downsides.
>
> If gnu11 is supported by gcc-5.1 and up, and all the relevant clang
> versions, then let's just pick that.

Ok, changed my patch to -gnu11 now.

> And if there are any possible future advantages to gnu17 (or eventual
> gnu2x versions), let's document those, so that we can say "once our
> compiler version requirements go up sufficiently, we'll move to gnuXX
> because we want to take advantage of YY".
>
> Please?

I think all of the options here are equally bad: picking gnu11 means
we use a non-standard default for anything other than gcc-5 and
may get surprised again in the future when we want to change to
a newer version; -std=gnu1x would work as an alias for gnu17 in
all versions including gcc-5 but is already marked as 'deprecated'
in the gcc documentation; and using -std=gnu17 for modern compilers
requires a workaround for gcc-7 and earlier.

Regarding new features from gcc-2x, I think we already use
most of what is listed in https://en.wikipedia.org/wiki/C2x, as
those are all GNU extensions that are valid in modern gnu89 as
well. Newly added features seem to only depend on the compiler
version, e.g. #elifdef works in both clang-13 and gcc-12 with
any -std=gnu?? argument, so picking an earlier standard won't
stop people from breaking the build with older compilers.

         Arnd
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
