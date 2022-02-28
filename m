Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 05F644C7231
	for <lists+greybus-dev@lfdr.de>; Mon, 28 Feb 2022 18:08:04 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 395473EF15
	for <lists+greybus-dev@lfdr.de>; Mon, 28 Feb 2022 17:08:03 +0000 (UTC)
Received: from conssluserg-06.nifty.com (conssluserg-06.nifty.com [210.131.2.91])
	by lists.linaro.org (Postfix) with ESMTPS id 5DC373EB82
	for <greybus-dev@lists.linaro.org>; Mon, 28 Feb 2022 17:08:00 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178]) (authenticated)
	by conssluserg-06.nifty.com with ESMTP id 21SH7qI9002794
	for <greybus-dev@lists.linaro.org>; Tue, 1 Mar 2022 02:07:52 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 21SH7qI9002794
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
	s=dec2015msa; t=1646068072;
	bh=98mZh3DSkLLdEUaUpwDchiQq5D3wILeXQhtbg+uZ5C0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=D7+3GydIml5G5ULFdTIEOoeqAwyMiUllHF3GnHTuWW10nvZHqUydYyT+Jh/PjJc0C
	 9dGdscCwyV7M2qIK+TzlPN1lAgIFyW+LG8jTroxw3JcjB6xKD7AirJYq0hUGTm8FH0
	 G+ADSE21IaerZgVAUzhrazbpc1LG5nCdoDPIyOH+HiPFxvUV/fpB4XJyJl5QpYMKTS
	 4ZTfUYOn5AT4FiPGSuUklu/G/I3NUW/sdn3Ghx5EQK34yrsnKdstPivvN6BQ2Vg4IY
	 ckEBCcFgDL3VltZ5/Wnp4REwrg9Mbqj+hvGqQh0dDV6gu6iHvDuGU/mp/Vm9sD7zLJ
	 M5BfVt3YSVuhQ==
X-Nifty-SrcIP: [209.85.210.178]
Received: by mail-pf1-f178.google.com with SMTP id s11so1182841pfu.13
        for <greybus-dev@lists.linaro.org>; Mon, 28 Feb 2022 09:07:52 -0800 (PST)
X-Gm-Message-State: AOAM532Uboxfy19e8uEWk1R+mFYwigKu+im2G79BR4TtGJRA83+m7/v8
	qROAUXd6ex6UkeeiqLvIVo9rF+t6YylfR2XmDwg=
X-Google-Smtp-Source: ABdhPJyLr4NM5Xb8MWbTJd6oMf6oOtnn2XpS61KrD/xyflT+Su6ouIqvNpJKrYGOOASYu0nk5xFAElbhZTOY0HMSDmM=
X-Received: by 2002:a63:e758:0:b0:378:8511:cfe7 with SMTP id
 j24-20020a63e758000000b003788511cfe7mr7050358pgk.126.1646068071650; Mon, 28
 Feb 2022 09:07:51 -0800 (PST)
MIME-Version: 1.0
References: <20220228103142.3301082-1-arnd@kernel.org> <YhyxML05rjJ/57Vk@FVFF77S0Q05N>
In-Reply-To: <YhyxML05rjJ/57Vk@FVFF77S0Q05N>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 1 Mar 2022 02:07:08 +0900
X-Gmail-Original-Message-ID: <CAK7LNATbX3TfETQTAr=e5kQLMDSXSn_KetDKTAaeZSq9k_70Uw@mail.gmail.com>
Message-ID: <CAK7LNATbX3TfETQTAr=e5kQLMDSXSn_KetDKTAaeZSq9k_70Uw@mail.gmail.com>
To: Mark Rutland <mark.rutland@arm.com>
Message-ID-Hash: ACN4V7K4F43FOJZPMWZ4VDBHITKUU245
X-Message-ID-Hash: ACN4V7K4F43FOJZPMWZ4VDBHITKUU245
X-MailFrom: masahiroy@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Arnd Bergmann <arnd@kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Linus Torvalds <torvalds@linux-foundation.org>, llvm@lists.linux.dev, Jonathan Corbet <corbet@lwn.net>, Federico Vaga <federico.vaga@vaga.pv.it>, Alex Shi <alexs@kernel.org>, Hu Haowen <src.res@email.cn>, Michal Marek <michal.lkml@markovi.net>, Nick Desaulniers <ndesaulniers@google.com>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-doc-tw-discuss@lists.sourceforge.net, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, intel-gfx <intel-gfx@lists.freedesktop.org>, dri-devel <dri-devel@lists.freedesktop.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-btrfs@vger.kernel.org, Marco Elver <elver@google.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] [v2] Kbuild: move to -std=gnu11
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/ACN4V7K4F43FOJZPMWZ4VDBHITKUU245/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Feb 28, 2022 at 8:25 PM Mark Rutland <mark.rutland@arm.com> wrote:
>
> Hi Arnd,
>
> This is great!
>
> On Mon, Feb 28, 2022 at 11:27:43AM +0100, Arnd Bergmann wrote:
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
> > gnu89 and gnu11, but this was taken care of by defining 'inline' to
> > include __attribute__((gnu_inline)) in order to allow building with
> > clang a while ago.
> >
> > One minor issue that remains is an added gcc warning for shifts of
> > negative integers when building with -Werror, which happens with the
> > 'make W=1' option, as well as for three drivers in the kernel that always
> > enable -Werror, but it was only observed with the i915 driver so far.
> > To be on the safe side, add -Wno-shift-negative-value to any -Wextra
> > in a Makefile.
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
>


I do not understand this statement:

"Usually such warnings are implciitly enabled as part of `-std=gnu89`,
 and in preparation for changing the standard used, this patch explciitly
enales the warnings with `-Wdeclaration-after-statement`, which takes
effect regardless of which version of the C standard is in use."



modpost is already built with -std=gnu89.

If  Wdeclaration-after-statement is implied by gnu89,
why did nobody notice this before?


-- 
Best Regards
Masahiro Yamada
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
