Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 5097E4C5FBA
	for <lists+greybus-dev@lfdr.de>; Mon, 28 Feb 2022 00:12:05 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 860983EBE4
	for <lists+greybus-dev@lfdr.de>; Sun, 27 Feb 2022 23:12:04 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	by lists.linaro.org (Postfix) with ESMTPS id 8C1013EBE4
	for <greybus-dev@lists.linaro.org>; Sun, 27 Feb 2022 23:12:01 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id bn33so15052953ljb.6
        for <greybus-dev@lists.linaro.org>; Sun, 27 Feb 2022 15:12:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AJKFWkaNILgrND2ajpv99ahQRaE4hGQV9IUMvW6X5jc=;
        b=COC/4g+XK0ncFFdjTFjbGI8kwJnazvpy+Y8Z5kBv2abHG/7OdfJl8XVUO/gQJQXrgU
         7syJ6Bl4EH1rhevEXJDyJCzV6vXIrdiBYUsB99agtvA7QQFqI7pET+wt/bULnxpe/llB
         DoHBp+DrTOur4By7IXXtsNs4+hSllcxUFM+zA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AJKFWkaNILgrND2ajpv99ahQRaE4hGQV9IUMvW6X5jc=;
        b=UASj9GNb+1tcFJPQQolqyphFmo+zzkOZFBEoj0NQvmu0/WepoKOV/3tgjA194xC4cg
         dKFdqJOTYNUxROnOtH6tp/+CVeX+kw+vaUrXijp/PBE29F4Z6hXwC10mX7PekOraLAnF
         V3t6SNJpipnnYBUeeN2Vn5uJ6cWCpTvZ8Jj7jNDbty7vN6IY2RkAxWO0o004mXQAVJlx
         OwN+Kq1/L732z6p2IjGIRBoGPGRbPOh7wcwacnSMrk0j4m+REdCmgrWipyP+OAGfELDf
         /kKeDJkSDu2pp+3VPNM5freIoNCrb5lYcLrWw+il8bRXA/jdM7PpDaXQv5tS3E4tKXhs
         hGBA==
X-Gm-Message-State: AOAM533uMKDTiby7EfNbKimWlZn0AIhBjRTkmZNWGf22rAGW65tnrTy1
	i1PWQOMkdorFCuR5dYapHyIsOP78HSdy6fnqhoU=
X-Google-Smtp-Source: ABdhPJwFDnIYLMiAHRuQXWGElV5Cim4eOzlB6fGvMNbqHypsO23dGChH+gLmqiZrAIjsR+rCCCT86A==
X-Received: by 2002:a05:651c:21a:b0:244:c506:7919 with SMTP id y26-20020a05651c021a00b00244c5067919mr12229595ljn.147.1646003520187;
        Sun, 27 Feb 2022 15:12:00 -0800 (PST)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com. [209.85.208.179])
        by smtp.gmail.com with ESMTPSA id w2-20020a197b02000000b00443a9b2a1ccsm751864lfc.165.2022.02.27.15.11.58
        for <greybus-dev@lists.linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Feb 2022 15:11:58 -0800 (PST)
Received: by mail-lj1-f179.google.com with SMTP id o6so15046647ljp.3
        for <greybus-dev@lists.linaro.org>; Sun, 27 Feb 2022 15:11:58 -0800 (PST)
X-Received: by 2002:a2e:b8cc:0:b0:246:4767:7a29 with SMTP id
 s12-20020a2eb8cc000000b0024647677a29mr12717079ljp.152.1646003517979; Sun, 27
 Feb 2022 15:11:57 -0800 (PST)
MIME-Version: 1.0
References: <20220227215408.3180023-1-arnd@kernel.org> <dd41c574-05b0-23bc-646c-0bd341e6e50b@linaro.org>
In-Reply-To: <dd41c574-05b0-23bc-646c-0bd341e6e50b@linaro.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 27 Feb 2022 15:11:41 -0800
X-Gmail-Original-Message-ID: <CAHk-=wg_r01OASRuSFfbEk_YHjve2BsBbkDYiEiKTaX2jm=53g@mail.gmail.com>
Message-ID: <CAHk-=wg_r01OASRuSFfbEk_YHjve2BsBbkDYiEiKTaX2jm=53g@mail.gmail.com>
To: Alex Elder <elder@linaro.org>
Message-ID-Hash: EDTLMHOEUTNXOFBG26XGXKZRNKI7MVUT
X-Message-ID-Hash: EDTLMHOEUTNXOFBG26XGXKZRNKI7MVUT
X-MailFrom: torvalds@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Arnd Bergmann <arnd@kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Masahiro Yamada <masahiroy@kernel.org>, llvm@lists.linux.dev, Jonathan Corbet <corbet@lwn.net>, Federico Vaga <federico.vaga@vaga.pv.it>, Alex Shi <alexs@kernel.org>, Hu Haowen <src.res@email.cn>, Michal Marek <michal.lkml@markovi.net>, Nick Desaulniers <ndesaulniers@google.com>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-doc-tw-discuss@lists.sourceforge.net, Linux ARM <linux-arm-kernel@lists.infradead.org>, intel-gfx <intel-gfx@lists.freedesktop.org>, dri-devel <dri-devel@lists.freedesktop.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-btrfs <linux-btrfs@vger.kernel.org>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] Kbuild: remove -std=gnu89 from compiler arguments
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/EDTLMHOEUTNXOFBG26XGXKZRNKI7MVUT/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, Feb 27, 2022 at 3:04 PM Alex Elder <elder@linaro.org> wrote:
>
> Glancing at the Greybus code, I don't believe there's any
> reason it needs to shift a negative value.  Such warnings
> could be fixed by making certain variables unsigned, for
> example.

As mentioned in the original thread, making things unsigned actually
is likely to introduce bugs and make things worse.

The warning is simply bogus, and the fact that it was enabled by
-Wextra in gcc for std=gnu99 and up was a mistake that looks likely to
be fixed in gcc.

So don't try to "fix" the code to make any possible warnings go away.
You may just make things worse.

(That is often true in general for the more esoteric warnings, but in
this case it's just painfully more obvious).

              Linus
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
