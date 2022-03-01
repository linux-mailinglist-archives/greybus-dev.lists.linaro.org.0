Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 8782E4C8E26
	for <lists+greybus-dev@lfdr.de>; Tue,  1 Mar 2022 15:46:14 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id B814D3EF22
	for <lists+greybus-dev@lfdr.de>; Tue,  1 Mar 2022 14:46:13 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	by lists.linaro.org (Postfix) with ESMTPS id 3CE963EB82
	for <greybus-dev@lists.linaro.org>; Tue,  1 Mar 2022 14:46:11 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D4C4B615F8
	for <greybus-dev@lists.linaro.org>; Tue,  1 Mar 2022 14:46:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6CE1C340F8
	for <greybus-dev@lists.linaro.org>; Tue,  1 Mar 2022 14:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1646145969;
	bh=O7PMjYoyVgpMGjTVJdUqo4vjOgkMH6zVD28CMdfxejY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ScbK0J6pozv/c2GDJYHlIZpbvfONFwSIK/2j9QTvGy0h6OxUAoFSJS7ACLBifahWv
	 DcEHKw3lZtb+uu9XBfWLbqlt4501Amp6VUN+Dzs96ZiZLJ0WrXZIhbPfc31qIWMyNy
	 ATq4x+Oqa8aCq2GW5gs+Y/j2lbHCJQUV8G4qbfbhkoke2or1lVhj8owINILXGePjRZ
	 R7WocAjuMhKmJQAgH9JZzvEWwPneWdjxvB9/qREXxhHUchmngRvsvQS8MYiNKoAhTS
	 lRIGGo0c7PSqmvXlDIU+2nV4tRgWSUE8CyjB1CiW2iruBEJHgJWl3+5y31XDNWkEo7
	 0CfBGfIlQclkw==
Received: by mail-wm1-f48.google.com with SMTP id a13-20020a05600c348d00b0038188b8bbf6so1347852wmq.0
        for <greybus-dev@lists.linaro.org>; Tue, 01 Mar 2022 06:46:09 -0800 (PST)
X-Gm-Message-State: AOAM532OUNLJchsHkA5IS1OXDHW/O57czuOjU5gUNbb8NTAGqlZW2tJQ
	/Pe+PvQIjwXshWavLD/HYPCcm3qX9WgwB2Ko2Tw=
X-Google-Smtp-Source: ABdhPJxXTbyRPUGWO5ZqEHYDoeKGRHcrrv5eZPJqecMQqdHX7hdx2ouYJfmaJG1ZffheKZ5NWAXaiF6wK5E6lkn8a4k=
X-Received: by 2002:a7b:c001:0:b0:381:1afd:5caa with SMTP id
 c1-20020a7bc001000000b003811afd5caamr17359158wmb.35.1646145967920; Tue, 01
 Mar 2022 06:46:07 -0800 (PST)
MIME-Version: 1.0
References: <20220228103142.3301082-1-arnd@kernel.org> <CAKwvOdkLUx1td+qgUYy3w2ojtBG-mJTzpJg3BV8Xv56YHTxHCw@mail.gmail.com>
 <20220228214145.o37bgp3zl3rxpeo4@google.com>
In-Reply-To: <20220228214145.o37bgp3zl3rxpeo4@google.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Tue, 1 Mar 2022 15:45:51 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2ZBOdEWTB1K9wA0v657VTZc-BC4LkDoQ0uw8Hw8FfSyg@mail.gmail.com>
Message-ID: <CAK8P3a2ZBOdEWTB1K9wA0v657VTZc-BC4LkDoQ0uw8Hw8FfSyg@mail.gmail.com>
To: Fangrui Song <maskray@google.com>
Message-ID-Hash: NJ5PFRUEEVQHNQEFMM45P3LSNJKIOMSU
X-Message-ID-Hash: NJ5PFRUEEVQHNQEFMM45P3LSNJKIOMSU
X-MailFrom: arnd@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Nick Desaulniers <ndesaulniers@google.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Linus Torvalds <torvalds@linux-foundation.org>, Masahiro Yamada <masahiroy@kernel.org>, llvm@lists.linux.dev, Jonathan Corbet <corbet@lwn.net>, Federico Vaga <federico.vaga@vaga.pv.it>, Alex Shi <alexs@kernel.org>, Hu Haowen <src.res@email.cn>, Michal Marek <michal.lkml@markovi.net>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-doc-tw-discuss@lists.sourceforge.net, Linux ARM <linux-arm-kernel@lists.infradead.org>, Intel Graphics <intel-gfx@lists.freedesktop.org>, dri-devel <dri-devel@lists.freedesktop.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-btrfs <linux-btrfs@vger.kernel.org>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] [v2] Kbuild: move to -std=gnu11
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/NJ5PFRUEEVQHNQEFMM45P3LSNJKIOMSU/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Feb 28, 2022 at 10:41 PM Fangrui Song <maskray@google.com> wrote:
> >
> >More precisely, the semantics of "extern inline" functions changed
> >between ISO C90 and ISO C99.
>
> Perhaps a clearer explanation to readers is: "extern inline" and "inline" swap
> semantics with gnu_inline (-fgnu89-inline or __attribute__((__gnu_inline__))).
>
> >That's the only concern I have, which I doubt is an issue. The kernel
> >is already covered by the function attribute as you note.
> >
> >Just to have some measure:
> >$ git grep -rn "extern inline" | wc -l
> >116
>
> "^inline" behaves like C99+ "extern inline"
>
> Agree this is handled by
>
>      #define inline inline __gnu_inline __inline_maybe_unused notrace
>

Ok, I've reworded it again, but kept it a bit shorter, I don't think we
need the full explanation in this patch description in the end.

Thanks,

      Arnd
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
