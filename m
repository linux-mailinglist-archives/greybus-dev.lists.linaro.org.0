Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BD524C6D4E
	for <lists+greybus-dev@lfdr.de>; Mon, 28 Feb 2022 14:00:05 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 7B5C53EEFE
	for <lists+greybus-dev@lfdr.de>; Mon, 28 Feb 2022 13:00:04 +0000 (UTC)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	by lists.linaro.org (Postfix) with ESMTPS id BA7AE3EE53
	for <greybus-dev@lists.linaro.org>; Mon, 28 Feb 2022 13:00:00 +0000 (UTC)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out1.suse.de (Postfix) with ESMTP id 5F35721991;
	Mon, 28 Feb 2022 12:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1646053199;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GYvrOH34zCWl0BM57x3MsoAIfmyz0j5aUqs18/+9t2Q=;
	b=CjK8nNU5xeMNbntdPyPSfsq8/1RCdmnnM+tnemCL9lQAmpVtTSbi2i0S/zED3dXrk+604R
	F7IO7CYu/SbuKXg9SBt5CXTg/P34/O1YqlSaqPLhtC63aEQddztfpC4Hi7UwtxSCvZvSgX
	/+ilzqW9cikrpXqztnZDSBZcWjPDsWQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1646053199;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GYvrOH34zCWl0BM57x3MsoAIfmyz0j5aUqs18/+9t2Q=;
	b=YC640EWtiJvSsnZFCbq8EFRrctbU3bFx2JBcqb+i/kX+D3HkAqM4d4d/mY/yRse7T0PyAW
	0aoolUYAD4EZD9DA==
Received: from ds.suse.cz (ds.suse.cz [10.100.12.205])
	by relay2.suse.de (Postfix) with ESMTP id 81766A3B84;
	Mon, 28 Feb 2022 12:59:58 +0000 (UTC)
Received: by ds.suse.cz (Postfix, from userid 10065)
	id A86B6DA823; Mon, 28 Feb 2022 13:56:07 +0100 (CET)
Date: Mon, 28 Feb 2022 13:56:07 +0100
From: David Sterba <dsterba@suse.cz>
To: Arnd Bergmann <arnd@kernel.org>
Message-ID: <20220228125607.GG12643@twin.jikos.cz>
Mail-Followup-To: dsterba@suse.cz, Arnd Bergmann <arnd@kernel.org>,
	linux-kbuild@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Masahiro Yamada <masahiroy@kernel.org>, llvm@lists.linux.dev,
	Jonathan Corbet <corbet@lwn.net>,
	Federico Vaga <federico.vaga@vaga.pv.it>,
	Alex Shi <alexs@kernel.org>, Hu Haowen <src.res@email.cn>,
	Michal Marek <michal.lkml@markovi.net>,
	Nick Desaulniers <ndesaulniers@google.com>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc-tw-discuss@lists.sourceforge.net,
	linux-arm-kernel@lists.infradead.org,
	intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-btrfs@vger.kernel.org
References: <20220228103142.3301082-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220228103142.3301082-1-arnd@kernel.org>
User-Agent: Mutt/1.5.23.1-rc1 (2014-03-12)
Message-ID-Hash: JOGIFV2HER2RJWBEQ6XMBQFA4KOJA2BT
X-Message-ID-Hash: JOGIFV2HER2RJWBEQ6XMBQFA4KOJA2BT
X-MailFrom: dsterba@suse.cz
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: linux-kbuild@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Linus Torvalds <torvalds@linux-foundation.org>, Masahiro Yamada <masahiroy@kernel.org>, llvm@lists.linux.dev, Jonathan Corbet <corbet@lwn.net>, Federico Vaga <federico.vaga@vaga.pv.it>, Alex Shi <alexs@kernel.org>, Hu Haowen <src.res@email.cn>, Michal Marek <michal.lkml@markovi.net>, Nick Desaulniers <ndesaulniers@google.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc-tw-discuss@lists.sourceforge.net, linux-arm-kernel@lists.infradead.org, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-btrfs@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Reply-To: dsterba@suse.cz
Subject: [greybus-dev] Re: [PATCH] [v2] Kbuild: move to -std=gnu11
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/JOGIFV2HER2RJWBEQ6XMBQFA4KOJA2BT/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Feb 28, 2022 at 11:27:43AM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> 
> Link: https://lore.kernel.org/lkml/CAHk-=wiyCH7xeHcmiFJ-YgXUy2Jaj7pnkdKpcovt8fYbVFW3TA@mail.gmail.com/
> Link: https://github.com/ClangBuiltLinux/linux/issues/1603
> Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
> Cc: Masahiro Yamada <masahiroy@kernel.org>
> Cc: linux-kbuild@vger.kernel.org
> Cc: llvm@lists.linux.dev
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> [v2]
>  - added -std=gnu11 back, rather than just relying on the default
>  - minor changes to changelog text
> ---
>  Documentation/process/programming-language.rst              | 4 ++--
>  .../translations/it_IT/process/programming-language.rst     | 4 ++--
>  .../translations/zh_CN/process/programming-language.rst     | 4 ++--
>  .../translations/zh_TW/process/programming-language.rst     | 4 ++--
>  Makefile                                                    | 6 +++---
>  arch/arm64/kernel/vdso32/Makefile                           | 2 +-
>  drivers/gpu/drm/i915/Makefile                               | 1 +
>  drivers/staging/greybus/tools/Makefile                      | 3 ++-

For

>  fs/btrfs/Makefile                                           | 1 +

Acked-by: David Sterba <dsterba@suse.com>
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
