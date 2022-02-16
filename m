Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B08C4B90EA
	for <lists+greybus-dev@lfdr.de>; Wed, 16 Feb 2022 20:06:02 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 348C13EE8F
	for <lists+greybus-dev@lfdr.de>; Wed, 16 Feb 2022 19:06:01 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	by lists.linaro.org (Postfix) with ESMTPS id B55603ED28;
	Wed, 16 Feb 2022 19:05:58 +0000 (UTC)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-2d646fffcc2so9268177b3.4;
        Wed, 16 Feb 2022 11:05:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yLrFIsE9bo3p9BnVIL7Uc7sprqnSKm0YOW7fBIQdERM=;
        b=D9f1f99GRLUFgGo4Xz8aqFRJvPyhDbQnQCQRdZ21q8qfFxNFIp0LuohpWJtnUgbQdu
         S+NxSnRBmhDyxyrhjPbGO/mRYmww44Kg43YcZZ1ps/Y7PgaQfjWgJT70u+BMjWceJ8pu
         Q1O3tga5PQrFQ3qCYwolq4f2w49JCpyISPfkGoWOiy9NnNAh+9blB+xACMAVGKh5X3XG
         nPYJHHVT9WOtlHGp5PiZS7nRz9HfCKO4EAiMONxg8jTamA1UG3WDDmKpSLNOEaemssAR
         3nHGzb2jaOjbB/pSQsmOzx6Upy84ujkfaBFOgKXNnY8AH4WirtxfjO6D1qJ/t0QRwkCl
         0gIg==
X-Gm-Message-State: AOAM5319nD2r1Y63o7FojvSJZ2bMq+vsqKoU6AL95A9xvwajm1nlW9az
	TyEGFd0iioOG9gYZr8EFbkktdIyJx5c6COx5OGA=
X-Google-Smtp-Source: ABdhPJyFOmiGOmRDkw8czUhuWEAUWZI3b6hfKAcdDSxdtm3oSTgs7z2noREt7vOvPl7JarLhxJEUxltkCz2WrL99cSU=
X-Received: by 2002:a0d:c244:0:b0:2d1:1fbb:180d with SMTP id
 e65-20020a0dc244000000b002d11fbb180dmr3902361ywd.196.1645038358332; Wed, 16
 Feb 2022 11:05:58 -0800 (PST)
MIME-Version: 1.0
References: <20220215174743.GA878920@embeddedor> <202202151016.C0471D6E@keescook>
 <20220215192110.GA883653@embeddedor> <Ygv8wY75hNqS7zO6@unreal> <20220215193221.GA884407@embeddedor>
In-Reply-To: <20220215193221.GA884407@embeddedor>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 16 Feb 2022 20:05:47 +0100
Message-ID: <CAJZ5v0jpAnQk+Hub6ue6t712RW+W0YBjb_gAcZZbUeuYMGv7mg@mail.gmail.com>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Message-ID-Hash: V3I5OJMIOK5QFMJKBRT6Y37FNFPNIQDS
X-Message-ID-Hash: V3I5OJMIOK5QFMJKBRT6Y37FNFPNIQDS
X-MailFrom: rjwysocki@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Leon Romanovsky <leon@kernel.org>, Kees Cook <keescook@chromium.org>, GR-QLogic-Storage-Upstream@marvell.com, linux-alpha@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-ia64@vger.kernel.org, linux-s390@vger.kernel.org, Linux-sh list <linux-sh@vger.kernel.org>, sparclinux@vger.kernel.org, linux-um@lists.infradead.org, linux-xtensa@linux-xtensa.org, Linux Crypto Mailing List <linux-crypto@vger.kernel.org>, intel-gfx <intel-gfx@lists.freedesktop.org>, dri-devel <dri-devel@lists.freedesktop.org>, nouveau <nouveau@lists.freedesktop.org>, coresight@lists.linaro.org, Linux ARM <linux-arm-kernel@lists.infradead.org>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, netdev <netdev@vger.kernel.org>, Linux OMAP Mailing List <linux-omap@vger.kernel.org>, "open list:TARGET SUBSYSTEM" <linux-scsi@vger.kernel.org>, target-devel@vger.kernel.org, mpi3mr-linuxdrv.pdl@broadcom.com, linux-staging@lists.linux.dev, linux-rpi-kernel@lists.infradead.org
 , sparmaintainer@unisys.com, linux-cifs@vger.kernel.org, samba-technical@lists.samba.org, Ext4 Developers List <linux-ext4@vger.kernel.org>, ACPI Devel Maling List <linux-acpi@vger.kernel.org>, "open list:ACPI COMPONENT ARCHITECTURE (ACPICA)" <devel@acpica.org>, linux-arch <linux-arch@vger.kernel.org>, Linux Memory Management List <linux-mm@kvack.org>, greybus-dev@lists.linaro.org, linux-i3c@lists.infradead.org, linux-rdma@vger.kernel.org, "open list:BLUETOOTH DRIVERS" <linux-bluetooth@vger.kernel.org>, "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..." <alsa-devel@alsa-project.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-perf-users@vger.kernel.org, linux-hardening@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH][next] treewide: Replace zero-length arrays with flexible-array members
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/V3I5OJMIOK5QFMJKBRT6Y37FNFPNIQDS/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Feb 15, 2022 at 8:24 PM Gustavo A. R. Silva
<gustavoars@kernel.org> wrote:
>
> On Tue, Feb 15, 2022 at 09:19:29PM +0200, Leon Romanovsky wrote:
> > On Tue, Feb 15, 2022 at 01:21:10PM -0600, Gustavo A. R. Silva wrote:
> > > On Tue, Feb 15, 2022 at 10:17:40AM -0800, Kees Cook wrote:
> > > > On Tue, Feb 15, 2022 at 11:47:43AM -0600, Gustavo A. R. Silva wrote:
> > > >
> > > > These all look trivially correct to me. Only two didn't have the end of
> > > > the struct visible in the patch, and checking those showed them to be
> > > > trailing members as well, so:
> > > >
> > > > Reviewed-by: Kees Cook <keescook@chromium.org>
> > >
> > > I'll add this to my -next tree.
> >
> > I would like to ask you to send mlx5 patch separately to netdev. We are working
> > to delete that file completely and prefer to avoid from unnecessary merge conflicts.
>
> Oh OK. Sure thing; I will do so.

Can you also send the ACPI patch separately, please?

We would like to route it through the upstream ACPICA code base.
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
