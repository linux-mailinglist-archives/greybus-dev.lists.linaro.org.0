Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 5521C4C6B68
	for <lists+greybus-dev@lfdr.de>; Mon, 28 Feb 2022 12:58:18 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 86B223EF1A
	for <lists+greybus-dev@lfdr.de>; Mon, 28 Feb 2022 11:58:17 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	by lists.linaro.org (Postfix) with ESMTPS id 711643EE53
	for <greybus-dev@lists.linaro.org>; Mon, 28 Feb 2022 11:58:14 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0FD8E6111E
	for <greybus-dev@lists.linaro.org>; Mon, 28 Feb 2022 11:58:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9E27C340F4
	for <greybus-dev@lists.linaro.org>; Mon, 28 Feb 2022 11:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1646049492;
	bh=+wvb9UMyXw53TgaflmlowqbBW5U339MQvEG61L0RkPg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=UlCStjXbnIL+tfRuh3M8eOd/h3mUpwJ+nEULnaK4vf3kxoiCEv5i0xND3ezpVA1NJ
	 asbmtDFOlir3ENKdd5FtudHAFpICftoFAjg6pKnlneSMDx4MEcMsA7vyUakbeSXT3X
	 nUFP3khnYZ3qbJmCpnLt55WnwxVSwm68nX+ZoeTqoOeNVMtaEKy9cV8dRI1jifZvRs
	 3d8GMkEbETN4Ra3aEXU+hnLTNMO6DC9y8V8wZcQ/VhkpJgOkBR6F1J/pdElsRBECPA
	 +TJ6HAZgwTGJzbkY9pLdTcNwhjqMu8BzqcPR/E1tqcUQ16+HSU3jxayRCKNIOXQOOa
	 RK7ioBNniwedQ==
Received: by mail-wr1-f48.google.com with SMTP id j17so15111362wrc.0
        for <greybus-dev@lists.linaro.org>; Mon, 28 Feb 2022 03:58:12 -0800 (PST)
X-Gm-Message-State: AOAM532tPjXtjceu+g0n0iFuNDeOqLcrWex5bIjF2dZYwYFLBdJHNf81
	kGF4VCMsN9GOjYme+AzuV+bxXjT410m7LQh3xuY=
X-Google-Smtp-Source: ABdhPJwy6iIN+2EltyCCG8tEZNqW13aNO74dzYWDQrDlYbSLva54a7gegIjmFcrq6DWR6/fwUhMsaBFj3vOKpR4gr9Q=
X-Received: by 2002:adf:edc3:0:b0:1ec:5f11:5415 with SMTP id
 v3-20020adfedc3000000b001ec5f115415mr13633412wro.317.1646049491206; Mon, 28
 Feb 2022 03:58:11 -0800 (PST)
MIME-Version: 1.0
References: <20220228103142.3301082-1-arnd@kernel.org> <CANpmjNP6VE9G8Yng4W7Mayk-0QsqUtAXkrMUSvL5pAP5DpXSmA@mail.gmail.com>
In-Reply-To: <CANpmjNP6VE9G8Yng4W7Mayk-0QsqUtAXkrMUSvL5pAP5DpXSmA@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Mon, 28 Feb 2022 12:57:55 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3cRa1piP2BSmN2dTW4QErhSP7AMO9xqAm=_FFYprAkOA@mail.gmail.com>
Message-ID: <CAK8P3a3cRa1piP2BSmN2dTW4QErhSP7AMO9xqAm=_FFYprAkOA@mail.gmail.com>
To: Marco Elver <elver@google.com>
Message-ID-Hash: YBPDZB7XTQW24HMFJNC6F3WHDLMN52VQ
X-Message-ID-Hash: YBPDZB7XTQW24HMFJNC6F3WHDLMN52VQ
X-MailFrom: arnd@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Linus Torvalds <torvalds@linux-foundation.org>, Masahiro Yamada <masahiroy@kernel.org>, llvm@lists.linux.dev, Jonathan Corbet <corbet@lwn.net>, Federico Vaga <federico.vaga@vaga.pv.it>, Alex Shi <alexs@kernel.org>, Hu Haowen <src.res@email.cn>, Michal Marek <michal.lkml@markovi.net>, Nick Desaulniers <ndesaulniers@google.com>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-doc-tw-discuss@lists.sourceforge.net, Linux ARM <linux-arm-kernel@lists.infradead.org>, Intel Graphics <intel-gfx@lists.freedesktop.org>, dri-devel <dri-devel@lists.freedesktop.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-btrfs <linux-btrfs@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] [v2] Kbuild: move to -std=gnu11
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/YBPDZB7XTQW24HMFJNC6F3WHDLMN52VQ/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Feb 28, 2022 at 12:47 PM Marco Elver <elver@google.com> wrote:
> On Mon, 28 Feb 2022 at 11:32, Arnd Bergmann <arnd@kernel.org> wrote:
>
> > Nathan Chancellor reported an additional -Wdeclaration-after-statement
> > warning that appears in a system header on arm, this still needs a
> > workaround.
>
> On the topic of Wdeclaration-after-statement, Clang only respects this
> warning with C99 and later starting with Clang 14:
> https://github.com/llvm/llvm-project/commit/c65186c89f35#diff-ec770381d76c859f5f572db789175fe44410a72608f58ad5dbb14335ba56eb97R61
>
> Until Clang 14, -Wdeclaration-after-statement is ignored by Clang in
> newer standards. If this is a big problem, we can probably convince
> the Clang stable folks to backport the fixes. However, the build won't
> fail, folks might just miss the warning if they don't also test with
> GCC.

I don't expect this is to be a big issue, as long as the latest clang behaves
as expected. There are many warnings that are only produced by one of the
two compilers, so this is something we already deal with.

I think it's more important to address the extra warning that Nathan
reported, where clang now complains about the intermingled declaration
in a system header when previously neither gcc nor clang noticed this.

> > The differences between gnu99, gnu11, gnu1x and gnu17 are fairly
> > minimal and mainly impact warnings at the -Wpedantic level that the
> > kernel never enables. Between these, gnu11 is the newest version
> > that is supported by all supported compiler versions, though it is
> > only the default on gcc-5, while all other supported versions of
> > gcc or clang default to gnu1x/gnu17.
> >
> > Link: https://lore.kernel.org/lkml/CAHk-=wiyCH7xeHcmiFJ-YgXUy2Jaj7pnkdKpcovt8fYbVFW3TA@mail.gmail.com/
> > Link: https://github.com/ClangBuiltLinux/linux/issues/1603
> > Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
> > Cc: Masahiro Yamada <masahiroy@kernel.org>
> > Cc: linux-kbuild@vger.kernel.org
> > Cc: llvm@lists.linux.dev
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>
> Acked-by: Marco Elver <elver@google.com>

Thanks,

         Arnd
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
