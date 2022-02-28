Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D04C4C781B
	for <lists+greybus-dev@lfdr.de>; Mon, 28 Feb 2022 19:41:02 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id C5FF43EF15
	for <lists+greybus-dev@lfdr.de>; Mon, 28 Feb 2022 18:41:01 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	by lists.linaro.org (Postfix) with ESMTPS id C6DC73EBCD
	for <greybus-dev@lists.linaro.org>; Mon, 28 Feb 2022 18:40:58 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id s25so18687535lji.5
        for <greybus-dev@lists.linaro.org>; Mon, 28 Feb 2022 10:40:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=B+acwbp8IAqy4EQhdzrRR6UrvnBSYJWdfAOCkLBEf6s=;
        b=LvJ51tK8OGXmUdrq1FTGfGhAU7kyWg6aDacet+/T6m1xcdm96SFLNin6cqkfGY+rbg
         A+4gdF9QL3th8X1CIPS6F2KrwGpjUcAkZFh2wMRAAEhyIS9gK5hzhXTjv7RRLGY5VhDN
         /ORnVKar4p0KNDioI7O/8vsyY3PJ0BwGF0c/w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=B+acwbp8IAqy4EQhdzrRR6UrvnBSYJWdfAOCkLBEf6s=;
        b=k6GeNppW7tQv9kGLxkv7ZbKFlTaN+CrqrkP+9mihc/nW7b/qstbOKIY0/LLl6kj7Td
         OkH8RRnTSkeJgA/Sy4ZdixAy03OcVw9B39PoVsEtampWwP9ljEt8I9QBNpFr06DjbA+A
         9jxx8IUHZUm4Zc5WaD5Dd+t2rO4sxVNStCs00dYIcwuhZ4x68Q0Jwd3rWQtA+5uLsxHY
         t1YvQOzCizKbB9HMl83uJrY9+aRP12tTQe/cQol38VLAfOCdKIyzf+MwAtcIoYLDDVt7
         ciIZJ5c32Hoi8hwDWRf0v+lMP/aD6vQVbTvNeqcXgN62XuKoKzO1YPqc0pJ/v3Lgi6eN
         yIHQ==
X-Gm-Message-State: AOAM533O7RuK8i6Jq2mrkDJ1+PLK3lC78IgtauIy328pAlOP9zqIftyd
	4NjNs3AiantkUAy9K2hsUlw1HEs16z1Y6k3WK/Y=
X-Google-Smtp-Source: ABdhPJw7Vwgh3U2GFJnlZEP0H9OPldPRpM18sB8rme26Ddcx/eZBBR38S3CpCrvrFVnzC/1v5k6oMw==
X-Received: by 2002:a2e:900a:0:b0:246:17bb:a771 with SMTP id h10-20020a2e900a000000b0024617bba771mr14870952ljg.363.1646073657349;
        Mon, 28 Feb 2022 10:40:57 -0800 (PST)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com. [209.85.167.43])
        by smtp.gmail.com with ESMTPSA id a12-20020a2e7f0c000000b00246885c9b88sm765259ljd.87.2022.02.28.10.40.55
        for <greybus-dev@lists.linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Feb 2022 10:40:55 -0800 (PST)
Received: by mail-lf1-f43.google.com with SMTP id i11so22970047lfu.3
        for <greybus-dev@lists.linaro.org>; Mon, 28 Feb 2022 10:40:55 -0800 (PST)
X-Received: by 2002:ac2:4c8c:0:b0:445:6c26:3cff with SMTP id
 d12-20020ac24c8c000000b004456c263cffmr13670491lfl.435.1646073655129; Mon, 28
 Feb 2022 10:40:55 -0800 (PST)
MIME-Version: 1.0
References: <20220228103142.3301082-1-arnd@kernel.org> <YhyxML05rjJ/57Vk@FVFF77S0Q05N>
 <CAK8P3a0CTmtUq+Uba2S3D7wjSstew2M+LfzZoOcKdKK9cfXO9A@mail.gmail.com>
In-Reply-To: <CAK8P3a0CTmtUq+Uba2S3D7wjSstew2M+LfzZoOcKdKK9cfXO9A@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 28 Feb 2022 10:40:38 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjU+DCbFG4nd3Wne-KbQ1n5=BHynv3xEmRYTaayBj-EfQ@mail.gmail.com>
Message-ID: <CAHk-=wjU+DCbFG4nd3Wne-KbQ1n5=BHynv3xEmRYTaayBj-EfQ@mail.gmail.com>
To: Arnd Bergmann <arnd@kernel.org>
Message-ID-Hash: XPRQV4KLQ3MNQ2WELGR6HQ6NH5SIPYL4
X-Message-ID-Hash: XPRQV4KLQ3MNQ2WELGR6HQ6NH5SIPYL4
X-MailFrom: torvalds@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Mark Rutland <mark.rutland@arm.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Masahiro Yamada <masahiroy@kernel.org>, llvm@lists.linux.dev, Jonathan Corbet <corbet@lwn.net>, Federico Vaga <federico.vaga@vaga.pv.it>, Alex Shi <alexs@kernel.org>, Hu Haowen <src.res@email.cn>, Michal Marek <michal.lkml@markovi.net>, Nick Desaulniers <ndesaulniers@google.com>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-doc-tw-discuss@lists.sourceforge.net, Linux ARM <linux-arm-kernel@lists.infradead.org>, Intel Graphics <intel-gfx@lists.freedesktop.org>, dri-devel <dri-devel@lists.freedesktop.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-btrfs <linux-btrfs@vger.kernel.org>, Marco Elver <elver@google.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] [v2] Kbuild: move to -std=gnu11
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/XPRQV4KLQ3MNQ2WELGR6HQ6NH5SIPYL4/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Feb 28, 2022 at 3:37 AM Arnd Bergmann <arnd@kernel.org> wrote:
>
> I think the KBUILD_USERCFLAGS portion and the modpost.c fix for it
> make sense regardless of the -std=gnu11 change

I do think they make sense, but I want to note again that people doing
cross builds obviously use different tools for user builds than for
the kernel. In fact, even not cross-building, we've had situations
where the "kbuild" compiler is different from the host compiler,
because people have upgraded one but not the other (upgrading the
kernel build environment is actually much easier than upgrading the
host build environment, because you don't need all the random
libraries etc, and you can literally _just_ build your own gcc and
binutils)

And we have *not* necessarily required that the host tools match the
kernel tools.

So I could well imagine that there are people who build their kernels,
but their host build environment might be old enough that -std=gnu11
is problematic for that part.

And note how any change to  KBUILD_USERCFLAGS is reflected in KBUILD_HOSTCFLAGS.

So I would suggest that the KBUILD_USERCFLAGS part of the patch (and
the modpost.c change that goes with it) be done as a separate commit.
Because we might end up reverting that part.

Hmm?

           Linus
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
