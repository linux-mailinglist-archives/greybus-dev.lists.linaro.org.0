Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id D5CE04CA93F
	for <lists+greybus-dev@lfdr.de>; Wed,  2 Mar 2022 16:38:14 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 17BF73EF06
	for <lists+greybus-dev@lfdr.de>; Wed,  2 Mar 2022 15:38:14 +0000 (UTC)
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
	by lists.linaro.org (Postfix) with ESMTPS id 84FF23EEBB
	for <greybus-dev@lists.linaro.org>; Tue,  1 Mar 2022 10:44:05 +0000 (UTC)
Received: by mail-io1-f44.google.com with SMTP id 195so18028084iou.0
        for <greybus-dev@lists.linaro.org>; Tue, 01 Mar 2022 02:44:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dohQLzfhr7wZu6SxVtIw3CHG42SObGN2SXyswtlVBsg=;
        b=WrUDonvN2fO25UTk5VNVhFhd8gruRaN5xzDoP4JD0Sakac0hlwGn0vLFs4yYd4XAFv
         uZKJIKn4j7cuELvqeeSDPXMNu2C1n0MsJpfl9rt1CcXMWz8ysAwYiWu0FU5ssFw8GnBu
         KImb7bl4uZxpEQ889GR2FwiQtAowT5cOncwrkuheaR+UErGWa6dJdP5knzUj9ZNji+C6
         SaCIGAmJwbqyXPo1H+nGW/xKoV4Sv5xxMQcmeQv2UvCQ1LPx9cytIPoPatO3xtpXO37Q
         QL3drAKRoTDr8u6LO2OfPrWDqwyTUyYOMOn4N3XOwbIN3FW3QG+ijjXJMFfWWnQ72HyS
         YuTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dohQLzfhr7wZu6SxVtIw3CHG42SObGN2SXyswtlVBsg=;
        b=0yHUyrWV8K/gd3xTMFHh/bzNP8JpSHcMu/gd9HvIfaqAqAqJlQQIglyqZ2xD9wHIjm
         vgBA8aamLLLciNrXO7WXhExEp+4ldMzm57/ND1DxboWNxB/PaCLlvF3qzgjRJ7wmL0ra
         B0a7CM6tJqPZVDuu63s6kAZaxkV9vvQEsA4YzLW/+YHtx4VBXfUP9aBlzjff6beiIVeY
         k6LkO7tHu29n1H+2AIlqLkweDVECzPOCeLcgSIA2SFl/xCazLxtB5KtICVUzR2GHgBtN
         9GE4s6+uRVilDYfylkRduzwIhXQ1b6W6lK1qZ9b22pREVOSVKWxuywsbTxXUfCGN0Nwn
         AFfw==
X-Gm-Message-State: AOAM530iBYxEiPzW7JX6QFlJGH7jMMuX2Ofrhavho+6KTSYepj8kwQeB
	yhgXSrCHn+WA6SgMHaf0LLnHepIDmdMdkmqdakM=
X-Google-Smtp-Source: ABdhPJw1aZ/CGkeAZM6RKVYVHBay0f9lMjJdsMqyLhdijbZf60uaKu7bggqdaHiabrS+XPZY5qiqhEF5Hass1iDJqZk=
X-Received: by 2002:a6b:661a:0:b0:640:dd42:58ff with SMTP id
 a26-20020a6b661a000000b00640dd4258ffmr18921633ioc.64.1646131444958; Tue, 01
 Mar 2022 02:44:04 -0800 (PST)
MIME-Version: 1.0
References: <20220228103142.3301082-1-arnd@kernel.org>
In-Reply-To: <20220228103142.3301082-1-arnd@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 1 Mar 2022 11:43:53 +0100
Message-ID: <CANiq72=wmYeBcJvRbBgRj1q_cHjZBVjxStXSu-8Ogv5bJhCqpA@mail.gmail.com>
To: Arnd Bergmann <arnd@kernel.org>
X-MailFrom: miguel.ojeda.sandonis@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: R23VALKKR5OOV6DH75ODGCQNALZKYART
X-Message-ID-Hash: R23VALKKR5OOV6DH75ODGCQNALZKYART
X-Mailman-Approved-At: Wed, 02 Mar 2022 15:38:10 +0000
CC: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Linus Torvalds <torvalds@linux-foundation.org>, Masahiro Yamada <masahiroy@kernel.org>, llvm@lists.linux.dev, Jonathan Corbet <corbet@lwn.net>, Federico Vaga <federico.vaga@vaga.pv.it>, Alex Shi <alexs@kernel.org>, Hu Haowen <src.res@email.cn>, Michal Marek <michal.lkml@markovi.net>, Nick Desaulniers <ndesaulniers@google.com>, Linux Doc Mailing List <linux-doc@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-doc-tw-discuss@lists.sourceforge.net, Linux ARM <linux-arm-kernel@lists.infradead.org>, Intel Graphics Development <intel-gfx@lists.freedesktop.org>, dri-devel <dri-devel@lists.freedesktop.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, Linux Btrfs <linux-btrfs@vger.kernel.org>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] [v2] Kbuild: move to -std=gnu11
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/R23VALKKR5OOV6DH75ODGCQNALZKYART/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Feb 28, 2022 at 11:32 AM Arnd Bergmann <arnd@kernel.org> wrote:
>
> -under ``-std=gnu89`` [gcc-c-dialect-options]_: the GNU dialect of ISO C90
> -(including some C99 features). ``clang`` [clang]_ is also supported, see
> +under ``-std=gnu11`` [gcc-c-dialect-options]_: the GNU dialect of ISO C11
> +(including some C17 features). ``clang`` [clang]_ is also supported, see

I think the "(including some C17)" bit would not make much sense
anymore. There were no major changes in C17 and GCC implements
`-std=c11` and `-std=c17` as basically the same thing according to the
docs (and GNU extensions apply equally to both, I would assume).

When I wrote the "(including some C99 features)" I meant that GCC
implemented some C99 features as extensions in C90 mode, and the
kernel used some of those (e.g. the now gone VLAs).

With that changed, for `programming-language.rst`:

Reviewed-by: Miguel Ojeda <ojeda@kernel.org>

Cheers,
Miguel
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
