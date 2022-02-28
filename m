Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DA304C6ABC
	for <lists+greybus-dev@lfdr.de>; Mon, 28 Feb 2022 12:37:59 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id AE60E3EF16
	for <lists+greybus-dev@lfdr.de>; Mon, 28 Feb 2022 11:37:58 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	by lists.linaro.org (Postfix) with ESMTPS id B817E3EEFC
	for <greybus-dev@lists.linaro.org>; Mon, 28 Feb 2022 11:37:55 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5614360F9E
	for <greybus-dev@lists.linaro.org>; Mon, 28 Feb 2022 11:37:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD38EC340F2
	for <greybus-dev@lists.linaro.org>; Mon, 28 Feb 2022 11:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1646048274;
	bh=NMuZjdNCVeQj2VoQ5jMSwA/dHUHPZ7Mhms+WmvHKcaw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=puCfv4I80mTbhnHyUqTc9LSw3FPxPIOJ/vkuheGKL8juHQ+7OafzFbeIoOUiNrCzk
	 gMcRYr5uV1QgmlA2AVn6fH3BtT9wmOgIs9iNnH1so1jgptzNGXyJSNUNB+mD3GKWqs
	 E2XJQclA3FD72633y5W3VT8t4EU62kfI9ObJFzphTP1SAs7YsrIBe3/G3kytn/9qqP
	 5AHT3io7WPI82HCHJY9xunwb0bTqn6d4f/32za5KRCjqEkKdRHTt21XpXMpLeN/tBN
	 BbNvU8hEz/6Lp8OapNZxReFBxhZ7uLVFNvhFYK1wsIb1vZ8/L7F83N5gNIw77oSuFB
	 0hR/PLkKQ9mRw==
Received: by mail-wr1-f44.google.com with SMTP id b5so15002779wrr.2
        for <greybus-dev@lists.linaro.org>; Mon, 28 Feb 2022 03:37:54 -0800 (PST)
X-Gm-Message-State: AOAM533aWm4thK43Q/sqHX6RRCq5NjQ58sPor3QX3VmftgZyRFLMCnsE
	efk2RnzR1wK3RD2eii2sa5gYUN6NHUTgHhHuYR8=
X-Google-Smtp-Source: ABdhPJxtXB6efD/LJ+kcWSKRCDN7bVXv1mCQCSSOtPPswSnZe/jnGK76a+5LOiLNukj3ERUK1wRtMZW5JaW1kqm9z5k=
X-Received: by 2002:a05:6000:1866:b0:1ef:8a14:ab6a with SMTP id
 d6-20020a056000186600b001ef8a14ab6amr7567987wri.12.1646048273093; Mon, 28 Feb
 2022 03:37:53 -0800 (PST)
MIME-Version: 1.0
References: <20220228103142.3301082-1-arnd@kernel.org> <YhyxML05rjJ/57Vk@FVFF77S0Q05N>
In-Reply-To: <YhyxML05rjJ/57Vk@FVFF77S0Q05N>
From: Arnd Bergmann <arnd@kernel.org>
Date: Mon, 28 Feb 2022 12:37:37 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0CTmtUq+Uba2S3D7wjSstew2M+LfzZoOcKdKK9cfXO9A@mail.gmail.com>
Message-ID: <CAK8P3a0CTmtUq+Uba2S3D7wjSstew2M+LfzZoOcKdKK9cfXO9A@mail.gmail.com>
To: Mark Rutland <mark.rutland@arm.com>
Message-ID-Hash: EKGGXY4WCIZECUFKEDXILDNFUE3JTZSD
X-Message-ID-Hash: EKGGXY4WCIZECUFKEDXILDNFUE3JTZSD
X-MailFrom: arnd@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Linus Torvalds <torvalds@linux-foundation.org>, Masahiro Yamada <masahiroy@kernel.org>, llvm@lists.linux.dev, Jonathan Corbet <corbet@lwn.net>, Federico Vaga <federico.vaga@vaga.pv.it>, Alex Shi <alexs@kernel.org>, Hu Haowen <src.res@email.cn>, Michal Marek <michal.lkml@markovi.net>, Nick Desaulniers <ndesaulniers@google.com>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-doc-tw-discuss@lists.sourceforge.net, Linux ARM <linux-arm-kernel@lists.infradead.org>, Intel Graphics <intel-gfx@lists.freedesktop.org>, dri-devel <dri-devel@lists.freedesktop.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-btrfs <linux-btrfs@vger.kernel.org>, Marco Elver <elver@google.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] [v2] Kbuild: move to -std=gnu11
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/EKGGXY4WCIZECUFKEDXILDNFUE3JTZSD/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Feb 28, 2022 at 12:25 PM Mark Rutland <mark.rutland@arm.com> wrote:
> On Mon, Feb 28, 2022 at 11:27:43AM +0100, Arnd Bergmann wrote:
> >
> > Nathan Chancellor reported an additional -Wdeclaration-after-statement
> > warning that appears in a system header on arm, this still needs a
> > workaround.
>
> FWIW, I had a go at moving to c99 a few weeks ago (to be able to use
> for-loop-declarations in some concurrency primitives), and when I tried, I also
> saw declaration-after-statement warnings when building modpost.c, which is easy
> enough to fix:
>
>   https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git/commit/?h=treewide/gnu99&id=505775bd6fd0bc1883f3271f826963066bbdc194

I think the KBUILD_USERCFLAGS portion and the modpost.c fix for it
make sense regardless of the -std=gnu11 change, but your change
to KBUILD_CFLAGS is not actually needed because the warning is
already enabled there -- gnu89 allows intermingled declarations since
gcc-3.4, so the warning flag was added during early 2.6.x kernels.

       Arnd
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
