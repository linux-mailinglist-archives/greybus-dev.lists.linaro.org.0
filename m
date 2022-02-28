Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 533A64C7C42
	for <lists+greybus-dev@lfdr.de>; Mon, 28 Feb 2022 22:41:55 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 7FCA63EE91
	for <lists+greybus-dev@lfdr.de>; Mon, 28 Feb 2022 21:41:54 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	by lists.linaro.org (Postfix) with ESMTPS id 8B4B13EBCD
	for <greybus-dev@lists.linaro.org>; Mon, 28 Feb 2022 21:41:51 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id z4so12670295pgh.12
        for <greybus-dev@lists.linaro.org>; Mon, 28 Feb 2022 13:41:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=SDEQwyNhO1YP2PlPCVZv2QT+trnELH3tuuISdUJhH/A=;
        b=d9xMn/X4LpBqF7CCmU2zh6/QLyVNBTRuNZU+e7jV9ejFO0/bkIPnXV0yhaKjw6dJm8
         FJS3J2mi6lbO85oN/dNF+rqWxtAJUijNlNeALlXJL+eaCxB0tcq950US1kKVvr8mqukF
         e0ToSOH4Si3JfzpFzCogjXNl1DMde6d8MLn9SuHccOTRwzid1E81/cSQ/4tTUtiOrMCh
         9TojhlCRrVYJxHlgtGOmRoGhypN9RiWcKC8aFAkMrBK4RGw8XoilLoTMd70dGA9hdZYh
         n+kv4MVL49Db4WfNBmaeThQEFLAURei7cyQEoj8G+S/4PT3zkCcTFjR/aTe5mw8oJWud
         4tvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=SDEQwyNhO1YP2PlPCVZv2QT+trnELH3tuuISdUJhH/A=;
        b=Q3HZ/XfezIaslyUc0RngL2DQ+swi9RlKDs+iPp0jxT7HE9vjl/kaEyDWkhVyb0kSd0
         WBH2NXrOncvlc8kKi1W7OzBWSeir3DCYGMIpRTkX0hg0h8Ha5coqfQS5nemCIBhr/e9Q
         Qp/vsxbFTjxRt1p6KQuUm5cn15T69swZ/OnDNjDjQkiDTRqTOzhPDDtw7JNADskaEx8F
         iUjpZjF+S27MwzeNNZZ/kyWKh4kxgVbDl2CGAOYo9ruUEH6NiMwIByZPuxoZWAIyoddo
         9TuNCCWFKRrrze0QbGvgkfGcaGxfIXufqUun2bCG+Cet93E2iEnkmwaNuMossksyShrX
         5vxg==
X-Gm-Message-State: AOAM5315ANvZSdLEabuvFP1MvgNFaUOY9OQx0zcYXmKMv6WDusQ82Cnl
	+FnNNfy/bvG4lDZ3FVOAdKrxUQ==
X-Google-Smtp-Source: ABdhPJysQYIb7FAhRgqLT3HifNDIOw9MY3JP0SvCbCIF1CiA1nyX5JMrxTKRUKNjLMnj4tBxx48g9A==
X-Received: by 2002:a05:6a00:26e0:b0:4e1:7131:de2b with SMTP id p32-20020a056a0026e000b004e17131de2bmr23819114pfw.20.1646084510471;
        Mon, 28 Feb 2022 13:41:50 -0800 (PST)
Received: from google.com ([2620:15c:2ce:200:777f:ae46:e31e:b07e])
        by smtp.gmail.com with ESMTPSA id 23-20020a17090a0b9700b001b8f602eaeasm259006pjr.53.2022.02.28.13.41.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Feb 2022 13:41:50 -0800 (PST)
Date: Mon, 28 Feb 2022 13:41:45 -0800
From: Fangrui Song <maskray@google.com>
To: Nick Desaulniers <ndesaulniers@google.com>
Message-ID: <20220228214145.o37bgp3zl3rxpeo4@google.com>
References: <20220228103142.3301082-1-arnd@kernel.org>
 <CAKwvOdkLUx1td+qgUYy3w2ojtBG-mJTzpJg3BV8Xv56YHTxHCw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKwvOdkLUx1td+qgUYy3w2ojtBG-mJTzpJg3BV8Xv56YHTxHCw@mail.gmail.com>
Message-ID-Hash: VPSXXM6U5EB4C4SDMG3F5FMLSZKFTQSS
X-Message-ID-Hash: VPSXXM6U5EB4C4SDMG3F5FMLSZKFTQSS
X-MailFrom: maskray@google.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Arnd Bergmann <arnd@kernel.org>, linux-kbuild@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Linus Torvalds <torvalds@linux-foundation.org>, Masahiro Yamada <masahiroy@kernel.org>, llvm@lists.linux.dev, Jonathan Corbet <corbet@lwn.net>, Federico Vaga <federico.vaga@vaga.pv.it>, Alex Shi <alexs@kernel.org>, Hu Haowen <src.res@email.cn>, Michal Marek <michal.lkml@markovi.net>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc-tw-discuss@lists.sourceforge.net, linux-arm-kernel@lists.infradead.org, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-btrfs@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] [v2] Kbuild: move to -std=gnu11
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/VPSXXM6U5EB4C4SDMG3F5FMLSZKFTQSS/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit

Thanks for the patch!

(Was always wondering which of binutils and kernel would migrate to C99+
earlier... binutils won)

On 2022-02-28, Nick Desaulniers wrote:
>On Mon, Feb 28, 2022 at 2:32 AM Arnd Bergmann <arnd@kernel.org> wrote:
>>
>> From: Arnd Bergmann <arnd@arndb.de>
>>
>> During a patch discussion, Linus brought up the option of changing
>> the C standard version from gnu89 to gnu99, which allows using variable
>> declaration inside of a for() loop. While the C99, C11 and later standards
>> introduce many other features, most of these are already available in
>> gnu89 as GNU extensions as well.
>>
>> An earlier attempt to do this when gcc-5 started defaulting to
>> -std=gnu11 failed because at the time that caused warnings about
>> designated initializers with older compilers. Now that gcc-5.1 is the
>> minimum compiler version used for building kernels, that is no longer a
>> concern. Similarly, the behavior of 'inline' functions changes between
>
>More precisely, the semantics of "extern inline" functions changed
>between ISO C90 and ISO C99.

Perhaps a clearer explanation to readers is: "extern inline" and "inline" swap
semantics with gnu_inline (-fgnu89-inline or __attribute__((__gnu_inline__))).

>That's the only concern I have, which I doubt is an issue. The kernel
>is already covered by the function attribute as you note.
>
>Just to have some measure:
>$ git grep -rn "extern inline" | wc -l
>116

"^inline" behaves like C99+ "extern inline"

Agree this is handled by

     #define inline inline __gnu_inline __inline_maybe_unused notrace

>Most of those are in arch/alpha/ which is curious; I wonder if those
>were intentional.
>
>(I do worry about Makefiles that completely reset KBUILD_CFLAGS
>though; the function attributes still take precedence).
>
>> gnu89 and gnu11, but this was taken care of by defining 'inline' to
>> include __attribute__((gnu_inline)) in order to allow building with
>> clang a while ago.
>>
>> One minor issue that remains is an added gcc warning for shifts of
>> negative integers when building with -Werror, which happens with the
>> 'make W=1' option, as well as for three drivers in the kernel that always
>> enable -Werror, but it was only observed with the i915 driver so far.
>> To be on the safe side, add -Wno-shift-negative-value to any -Wextra
>> in a Makefile.
>>
>> Nathan Chancellor reported an additional -Wdeclaration-after-statement
>> warning that appears in a system header on arm, this still needs a
>> workaround.
>
>Ack; I think we can just fix this in clang.
>
>>
>> The differences between gnu99, gnu11, gnu1x and gnu17 are fairly
>> minimal and mainly impact warnings at the -Wpedantic level that the
>> kernel never enables. Between these, gnu11 is the newest version
>> that is supported by all supported compiler versions, though it is
>> only the default on gcc-5, while all other supported versions of
>> gcc or clang default to gnu1x/gnu17.
>
>I agree. With the fixup to s/Werror/Wextra.
>
>Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
>
>>
>> Link: https://lore.kernel.org/lkml/CAHk-=wiyCH7xeHcmiFJ-YgXUy2Jaj7pnkdKpcovt8fYbVFW3TA@mail.gmail.com/
>> Link: https://github.com/ClangBuiltLinux/linux/issues/1603
>> Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
>> Cc: Masahiro Yamada <masahiroy@kernel.org>
>> Cc: linux-kbuild@vger.kernel.org
>> Cc: llvm@lists.linux.dev
>> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>
>-- 
>Thanks,
>~Nick Desaulniers
>
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
