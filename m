Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id BEFC54C721B
	for <lists+greybus-dev@lfdr.de>; Mon, 28 Feb 2022 18:03:59 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id E6D6C3EE57
	for <lists+greybus-dev@lfdr.de>; Mon, 28 Feb 2022 17:03:58 +0000 (UTC)
Received: from conssluserg-04.nifty.com (conssluserg-04.nifty.com [210.131.2.83])
	by lists.linaro.org (Postfix) with ESMTPS id 630ED3EB82
	for <greybus-dev@lists.linaro.org>; Mon, 28 Feb 2022 17:03:56 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182]) (authenticated)
	by conssluserg-04.nifty.com with ESMTP id 21SH3b2Q032179
	for <greybus-dev@lists.linaro.org>; Tue, 1 Mar 2022 02:03:38 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 21SH3b2Q032179
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
	s=dec2015msa; t=1646067818;
	bh=sryAZLDXD/t7zVmI+J82zVk8l2yloq/oD0nvYGiN984=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=DFAl9D3d5SV7l8OlblFtkdudyppXM87TTXLJkKaFiDrnHYA5wFLCqpf/bi6XW+/lL
	 Wxcxf4DRuPeQzgRVRD0ZLZqGJVyV92OkIiBQSKCRD0fkbmGaM77V1X8/io54DfJJE1
	 WHjVeTmICFjHCNQFMP84l0KM6p9KeusZdxBvunEoZ/3O0KaCmfcm9xJcBOxDBliQLy
	 v2hLNwthpmWXp3NyaQ3wZjDjgPQxfdr5sC/vbH+pTH2mOrDULVuZBpmLb5vfOGA989
	 Xl28AGykKx2Snuz0kqy9XcABSVfqA/+0wAkzfvVhA8SShTSlLQBtapcr4hUau+8ujK
	 GQtrmak7eUByg==
X-Nifty-SrcIP: [209.85.210.182]
Received: by mail-pf1-f182.google.com with SMTP id g1so11545320pfv.1
        for <greybus-dev@lists.linaro.org>; Mon, 28 Feb 2022 09:03:37 -0800 (PST)
X-Gm-Message-State: AOAM531ZxpbrLUXb/oLK1V1tz6vpK+JCB505jEXfyvikiPcGLbhMpbTw
	JCHu+QdEQgpPvdKsCXMmzCIcT4mfeWD+qUhR3vI=
X-Google-Smtp-Source: ABdhPJxISxDkNdxsVTKDDV2g7ZIxBL9oz/LlNlGrxEOGwup5cilO+xLo89K+cDWbGEDhDHUjyYzEiShtkCuCLkVGAaU=
X-Received: by 2002:a05:6a02:182:b0:374:5a57:cbf9 with SMTP id
 bj2-20020a056a02018200b003745a57cbf9mr18072494pgb.616.1646067817034; Mon, 28
 Feb 2022 09:03:37 -0800 (PST)
MIME-Version: 1.0
References: <20220228103142.3301082-1-arnd@kernel.org>
In-Reply-To: <20220228103142.3301082-1-arnd@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 1 Mar 2022 02:02:53 +0900
X-Gmail-Original-Message-ID: <CAK7LNATVs-yRX4PnURkLv3fz3gAnuzG2GxZ2gdvmJX2g+0P-_w@mail.gmail.com>
Message-ID: <CAK7LNATVs-yRX4PnURkLv3fz3gAnuzG2GxZ2gdvmJX2g+0P-_w@mail.gmail.com>
To: Arnd Bergmann <arnd@kernel.org>
Message-ID-Hash: P35RMH7BIOGHARJ26XXXMECBSGVETNLU
X-Message-ID-Hash: P35RMH7BIOGHARJ26XXXMECBSGVETNLU
X-MailFrom: masahiroy@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Linus Torvalds <torvalds@linux-foundation.org>, llvm@lists.linux.dev, Jonathan Corbet <corbet@lwn.net>, Federico Vaga <federico.vaga@vaga.pv.it>, Alex Shi <alexs@kernel.org>, Hu Haowen <src.res@email.cn>, Michal Marek <michal.lkml@markovi.net>, Nick Desaulniers <ndesaulniers@google.com>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-doc-tw-discuss@lists.sourceforge.net, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, intel-gfx <intel-gfx@lists.freedesktop.org>, dri-devel <dri-devel@lists.freedesktop.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-btrfs@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] [v2] Kbuild: move to -std=gnu11
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/P35RMH7BIOGHARJ26XXXMECBSGVETNLU/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Feb 28, 2022 at 7:32 PM Arnd Bergmann <arnd@kernel.org> wrote:
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
> gnu89 and gnu11, but this was taken care of by defining 'inline' to
> include __attribute__((gnu_inline)) in order to allow building with
> clang a while ago.
>
> One minor issue that remains is an added gcc warning for shifts of
> negative integers when building with -Werror, which happens with the

Is this a typo?

   building with -Werror, ...
->
   building with -Wextra, ...




> 'make W=1' option, as well as for three drivers in the kernel that always
> enable -Werror, but it was only observed with the i915 driver so far.

Same here.

   enable -Werror, but ...
->
  enable -Wextra, but ...




Otherwise,

Acked-by: Masahiro Yamada <masahiroy@kernel.org>


Please let me know if you want me to pick up this.









--
Best Regards

Masahiro Yamada
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
