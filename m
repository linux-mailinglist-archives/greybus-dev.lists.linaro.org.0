Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id ECF254C7B4C
	for <lists+greybus-dev@lfdr.de>; Mon, 28 Feb 2022 22:04:00 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 1127C3EB82
	for <lists+greybus-dev@lfdr.de>; Mon, 28 Feb 2022 21:04:00 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	by lists.linaro.org (Postfix) with ESMTPS id 2548A3EB82
	for <greybus-dev@lists.linaro.org>; Mon, 28 Feb 2022 21:03:58 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id u11so19178031lju.4
        for <greybus-dev@lists.linaro.org>; Mon, 28 Feb 2022 13:03:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iiqNCFc6U32ONzTNhKfvxI6B2p9x39AVrXt2rLta2M8=;
        b=W1quCfVq9oQhkjVMSeWaW2Z55DxdyDGbetnmG15rPiQ3v4OpkSJBRZVXEMnaa2odqg
         QOxU/DybvDsA1JnfyM0Ii4qw3F6xR+UbY0dAPPGiPqs4IHrP1aOpkQPW6UBPfhHTs8Tm
         PR7CBwZgGDqGkw8bM51JgA90FDhHoPP/FDNizSDpxNc9PDO+WtRrOnLiA4YcU9jxsmrw
         z0maaOELQKiR1hC/GWCjcXmHCEwCPjiDrVGmn41QSQ89BJlDlTrXtLJTHpab0xmVnH4M
         sZrukyP266PjsJuciZ6D4hmibJchflD3xDwtX05kLpAsnblhXyGN7U6wiOr/bpk5iv1a
         EfsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iiqNCFc6U32ONzTNhKfvxI6B2p9x39AVrXt2rLta2M8=;
        b=MGZod6wQVT9x3DFaYekd/nkHaGOqkCXLjVW8VivkSCI9M43Z8PtMZ3FS80oe0GHpSf
         Dv1lB60dEQ/gZVWHKaFhWLdwW2qjbIMbc8B56s1VaFBSXoaNQo8dMUj/D7Qi0QkhQt2L
         IF7mqe+xt3AYJaDlrocnRl/+0HQ1Vdzy+wnvBXpmPQxdaQKpYj12iqCt9nDADxiIxFLa
         lKsyp42q7/oifjstUUROkW6ndq8V22bwkKKToYP7sVnFUDtDD1zmH+RewA6wqvT6OKha
         ncLqa+ajYzldzCDO3EhWjB0b2IngO/G3rcVWBpeEetNocSZMUSJUudyPzub4brtc5oX8
         V/PA==
X-Gm-Message-State: AOAM5323c7kEaii23DMKCQCjswbFEWH4zJR+L4YLBbXnK8p2jOmkNrQD
	2E2ILL9RCoM5oDTqPF1r7y2h8tCdpBXvfUMynYd7kA==
X-Google-Smtp-Source: ABdhPJzGFFfCBCn90UYvglywOrc8nxTF2i5r3/1lhRKGwuSQ5VMkWLmIJa+L1faEtfi148WU9C5GVQ0oji3KdUudozI=
X-Received: by 2002:a2e:bf24:0:b0:246:801e:39d3 with SMTP id
 c36-20020a2ebf24000000b00246801e39d3mr8506477ljr.472.1646082236647; Mon, 28
 Feb 2022 13:03:56 -0800 (PST)
MIME-Version: 1.0
References: <20220228103142.3301082-1-arnd@kernel.org>
In-Reply-To: <20220228103142.3301082-1-arnd@kernel.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 28 Feb 2022 13:03:45 -0800
Message-ID: <CAKwvOdkLUx1td+qgUYy3w2ojtBG-mJTzpJg3BV8Xv56YHTxHCw@mail.gmail.com>
To: Arnd Bergmann <arnd@kernel.org>
Message-ID-Hash: H5AROPO6FXS5RGP3OCC4ISWHQ2LBCE2N
X-Message-ID-Hash: H5AROPO6FXS5RGP3OCC4ISWHQ2LBCE2N
X-MailFrom: ndesaulniers@google.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: linux-kbuild@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Linus Torvalds <torvalds@linux-foundation.org>, Masahiro Yamada <masahiroy@kernel.org>, llvm@lists.linux.dev, Jonathan Corbet <corbet@lwn.net>, Federico Vaga <federico.vaga@vaga.pv.it>, Alex Shi <alexs@kernel.org>, Hu Haowen <src.res@email.cn>, Michal Marek <michal.lkml@markovi.net>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc-tw-discuss@lists.sourceforge.net, linux-arm-kernel@lists.infradead.org, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-btrfs@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] [v2] Kbuild: move to -std=gnu11
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/H5AROPO6FXS5RGP3OCC4ISWHQ2LBCE2N/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Feb 28, 2022 at 2:32 AM Arnd Bergmann <arnd@kernel.org> wrote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> During a patch discussion, Linus brought up the option of changing
> the C standard version from gnu89 to gnu99, which allows using variable
> declaration inside of a for() loop. While the C99, C11 and later standards
> introduce many other features, most of these are already available in
> gnu89 as GNU extensions as well.
>
> An earlier attempt to do this when gcc-5 started defaulting to
> -std=gnu11 failed because at the time that caused warnings about
> designated initializers with older compilers. Now that gcc-5.1 is the
> minimum compiler version used for building kernels, that is no longer a
> concern. Similarly, the behavior of 'inline' functions changes between

More precisely, the semantics of "extern inline" functions changed
between ISO C90 and ISO C99.

That's the only concern I have, which I doubt is an issue. The kernel
is already covered by the function attribute as you note.

Just to have some measure:
$ git grep -rn "extern inline" | wc -l
116

Most of those are in arch/alpha/ which is curious; I wonder if those
were intentional.

(I do worry about Makefiles that completely reset KBUILD_CFLAGS
though; the function attributes still take precedence).

> gnu89 and gnu11, but this was taken care of by defining 'inline' to
> include __attribute__((gnu_inline)) in order to allow building with
> clang a while ago.
>
> One minor issue that remains is an added gcc warning for shifts of
> negative integers when building with -Werror, which happens with the
> 'make W=1' option, as well as for three drivers in the kernel that always
> enable -Werror, but it was only observed with the i915 driver so far.
> To be on the safe side, add -Wno-shift-negative-value to any -Wextra
> in a Makefile.
>
> Nathan Chancellor reported an additional -Wdeclaration-after-statement
> warning that appears in a system header on arm, this still needs a
> workaround.

Ack; I think we can just fix this in clang.

>
> The differences between gnu99, gnu11, gnu1x and gnu17 are fairly
> minimal and mainly impact warnings at the -Wpedantic level that the
> kernel never enables. Between these, gnu11 is the newest version
> that is supported by all supported compiler versions, though it is
> only the default on gcc-5, while all other supported versions of
> gcc or clang default to gnu1x/gnu17.

I agree. With the fixup to s/Werror/Wextra.

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

>
> Link: https://lore.kernel.org/lkml/CAHk-=wiyCH7xeHcmiFJ-YgXUy2Jaj7pnkdKpcovt8fYbVFW3TA@mail.gmail.com/
> Link: https://github.com/ClangBuiltLinux/linux/issues/1603
> Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
> Cc: Masahiro Yamada <masahiroy@kernel.org>
> Cc: linux-kbuild@vger.kernel.org
> Cc: llvm@lists.linux.dev
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

-- 
Thanks,
~Nick Desaulniers
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
