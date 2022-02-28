Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 642E94C77A1
	for <lists+greybus-dev@lfdr.de>; Mon, 28 Feb 2022 19:25:18 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 976503EF14
	for <lists+greybus-dev@lfdr.de>; Mon, 28 Feb 2022 18:25:17 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	by lists.linaro.org (Postfix) with ESMTPS id B40083E894
	for <greybus-dev@lists.linaro.org>; Mon, 28 Feb 2022 18:25:14 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4888A614FB
	for <greybus-dev@lists.linaro.org>; Mon, 28 Feb 2022 18:25:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D911C34101
	for <greybus-dev@lists.linaro.org>; Mon, 28 Feb 2022 18:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1646072712;
	bh=W7p79vSB6J1+jxnozFyNib9GmWcAolUohfmSDG//bFo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=bW1ZFMo50q0kPFmsangI6ntG68WPn+8ztd5psh0iHHbmPXGd2Do9g5exX/orPNmoF
	 TbileAdECwDuGZ3+humcDGlnOjlNYxeI3qAjbFLAsFhTc2LHic+YIf2ERa75osRNhn
	 Kqq71bFPRaIovWhnQvFqOiR1ebj4qUhN855gks3wvS+rvdXKdGJUNfOOen3tcmT4S7
	 zpLTE7SvQlwyFubmoSBvPJGw1f5VxlcwUT5kGQbM5VRWy3yFRzf9kbennsbklNWQnr
	 VImWf5/+PDhsYj8Ik1QLewhHGzp4RLahjjkzTll08wtY5vt0rMq16dXAFWp3Qw6QCA
	 7XcyjSwBnCISg==
Received: by mail-wr1-f45.google.com with SMTP id s1so16801972wrg.10
        for <greybus-dev@lists.linaro.org>; Mon, 28 Feb 2022 10:25:12 -0800 (PST)
X-Gm-Message-State: AOAM533Ns8mQAvGk5GS2bQZAmesocWXpWfauwc7NjIfvKv34rwVe+TlY
	Dznp7xblo31qlpKLEA3yYCmc/Lvf4WBd/KtBWxs=
X-Google-Smtp-Source: ABdhPJz4fZLcu78yhCIhmUlg8wcyJThC/WAQ6UaeDqjOpOcx7YS8Qt8gbRJs54Y1simdrFMDrQr0lGIp9e5ElXVyTL0=
X-Received: by 2002:adf:edc3:0:b0:1ec:5f11:5415 with SMTP id
 v3-20020adfedc3000000b001ec5f115415mr14857770wro.317.1646072710661; Mon, 28
 Feb 2022 10:25:10 -0800 (PST)
MIME-Version: 1.0
References: <20220228103142.3301082-1-arnd@kernel.org> <CAK7LNATVs-yRX4PnURkLv3fz3gAnuzG2GxZ2gdvmJX2g+0P-_w@mail.gmail.com>
In-Reply-To: <CAK7LNATVs-yRX4PnURkLv3fz3gAnuzG2GxZ2gdvmJX2g+0P-_w@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Mon, 28 Feb 2022 19:24:54 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2To9St5=v6EHtJ-LBEp4-NOThPmO+qYeAfnxQPm2_Keg@mail.gmail.com>
Message-ID: <CAK8P3a2To9St5=v6EHtJ-LBEp4-NOThPmO+qYeAfnxQPm2_Keg@mail.gmail.com>
To: Masahiro Yamada <masahiroy@kernel.org>, Jani Nikula <jani.nikula@linux.intel.com>
Message-ID-Hash: ZRSPZI2ZVYKDT2DLVAL2WSBU35DPWSCO
X-Message-ID-Hash: ZRSPZI2ZVYKDT2DLVAL2WSBU35DPWSCO
X-MailFrom: arnd@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Linus Torvalds <torvalds@linux-foundation.org>, llvm@lists.linux.dev, Jonathan Corbet <corbet@lwn.net>, Federico Vaga <federico.vaga@vaga.pv.it>, Alex Shi <alexs@kernel.org>, Hu Haowen <src.res@email.cn>, Michal Marek <michal.lkml@markovi.net>, Nick Desaulniers <ndesaulniers@google.com>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-doc-tw-discuss@lists.sourceforge.net, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, intel-gfx <intel-gfx@lists.freedesktop.org>, dri-devel <dri-devel@lists.freedesktop.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-btrfs <linux-btrfs@vger.kernel.org>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] [v2] Kbuild: move to -std=gnu11
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/ZRSPZI2ZVYKDT2DLVAL2WSBU35DPWSCO/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Feb 28, 2022 at 6:02 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> On Mon, Feb 28, 2022 at 7:32 PM Arnd Bergmann <arnd@kernel.org> wrote:
> >
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
>
> Is this a typo?
>
>    building with -Werror, ...
> ->
>    building with -Wextra, ...
>

I'm being slow today, Jani actually pointed out the same thing and I
misunderstood him. Fixed it now, thanks!

> Acked-by: Masahiro Yamada <masahiroy@kernel.org>
>
>
> Please let me know if you want me to pick up this.

Yes, that would be great. I'll send a v3 with the updated changelog,
but will drop most of the Cc list as there are no functional changes.

        Arnd
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
