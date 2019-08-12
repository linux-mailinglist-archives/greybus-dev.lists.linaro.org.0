Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 910488A553
	for <lists+greybus-dev@lfdr.de>; Mon, 12 Aug 2019 20:06:25 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id C2A3161833
	for <lists+greybus-dev@lfdr.de>; Mon, 12 Aug 2019 18:06:24 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id A3EDD6183E; Mon, 12 Aug 2019 18:06:24 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
	ip-10-150-125-211.ec2.internal
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2
	autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id D48AF61836;
	Mon, 12 Aug 2019 18:06:11 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 5E71161831
 for <greybus-dev@lists.linaro.org>; Mon, 12 Aug 2019 18:06:09 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 4003661834; Mon, 12 Aug 2019 18:06:09 +0000 (UTC)
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
 [209.85.128.67])
 by lists.linaro.org (Postfix) with ESMTPS id ED10B61831
 for <greybus-dev@lists.linaro.org>; Mon, 12 Aug 2019 18:06:07 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id 10so394450wmp.3
 for <greybus-dev@lists.linaro.org>; Mon, 12 Aug 2019 11:06:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oeb1zT8ILyeXCenKRurnZV7JJxYp9MA6jTgGlQaf/ew=;
 b=ADS/oeHffyOrDHYUl7Utqskm8zpyTqctdFvMx2H22F4SnpFxCcnW2LVo31zUeVYnKk
 mFFiLqwM+szafeAe+/ds4kgYpuJHi16deFP5sZLa3gcn1MTOfhdA/AnVosHKJ0wtS2U4
 xU6FVhVfmKGwI/DpmwVCM/LSRi2q+seaMmA+8bb/Ehste0jymp1XxUROq6FiuFOnmMWc
 icUOsbUKCi2FkZ3X2NOZnCppuq0mv+QcN0TXhy4dDFzQkJIHesM+j5oMS1cRsj31Z0sg
 ZKGQD7OEuWtcYLMDlUN5CSiXOz6bZTOl5R84J3btqiY7oaUznO7arLkITjDLsfFmkSmT
 Dt4Q==
X-Gm-Message-State: APjAAAWddFu7dioebBle5ZxYlMeaFdCNuv46lX6u8llDvROR311y6U+O
 e6nRL30BKaWrwlTPBVEo9dbpKRfEfcbY0nP97Zo=
X-Google-Smtp-Source: APXvYqwn8D/2eCzSRfkjbOZYZfZfc3K/lNG/rMKNE2yWPK6p3mmPLOLJsnD+JVrryvF6LGeh+V9ZxdmYVTetMSK3BfM=
X-Received: by 2002:a7b:cb89:: with SMTP id m9mr617575wmi.50.1565633166887;
 Mon, 12 Aug 2019 11:06:06 -0700 (PDT)
MIME-Version: 1.0
References: <CAFPGqosrnQmroLFRmTRNCYyqdQXnhBhJuCLo=WMphs60KvhKZQ@mail.gmail.com>
 <20190706085603.GE9955@kroah.com>
 <CAFPGqovJPQFNSYtiYyZAEkpOe2C53cifZ7Yaei_GUWKNErVz7w@mail.gmail.com>
 <20190713154843.GA12533@kroah.com>
 <CAFPGqov1AbeA16sJLJCWKod6QMqkCigt57sC1n-+FH9-Wxgpvw@mail.gmail.com>
 <20190716192544.GA27918@kroah.com>
 <CA+T6QPnSqhi4Xr+0ooh+Thkd8oQFfH=djZ=NgoWFWE4D=Mz0Jw@mail.gmail.com>
 <CA+T6QPm5+f2mLqbv3o9yd2S9BvvVD-U9GA-yisXuowhuB6Qijg@mail.gmail.com>
 <CA+T6QPkSZr9ignCZGhaifpOWE6517fELRDjJp6f3bAWDOft0JQ@mail.gmail.com>
 <CAF4BF-TE2OyH9z16NWisy856qULa6F1+ao4BDgQukSDqi6vmEw@mail.gmail.com>
 <CAF4BF-Qmem3xQGKCfREi5__N0QhAJkP6K1LZX5q6bSkKxzmwHA@mail.gmail.com>
In-Reply-To: <CAF4BF-Qmem3xQGKCfREi5__N0QhAJkP6K1LZX5q6bSkKxzmwHA@mail.gmail.com>
From: Jason Kridner <jkridner@beagleboard.org>
Date: Mon, 12 Aug 2019 14:05:55 -0400
Message-ID: <CA+T6QPnkrA10_ZOvQS4W=1m0q3xpUqKUzwfhMeoNZXkNpp1RUw@mail.gmail.com>
To: Christopher Friedt <chrisfriedt@gmail.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: Christopher Friedt <chris@friedt.co>, Vaishnav MA <mavaishnav007@gmail.com>,
 greybus-dev@lists.linaro.org
Subject: Re: [greybus-dev] Greybus For IoT : Click Board Support on
	Beaglebone Boards
X-BeenThere: greybus-dev@lists.linaro.org
X-Mailman-Version: 2.1.16
Precedence: list
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
List-Unsubscribe: <https://lists.linaro.org/mailman/options/greybus-dev>,
 <mailto:greybus-dev-request@lists.linaro.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/greybus-dev/>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Subscribe: <https://lists.linaro.org/mailman/listinfo/greybus-dev>,
 <mailto:greybus-dev-request@lists.linaro.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============6936866220054018294=="
Errors-To: greybus-dev-bounces@lists.linaro.org
Sender: "greybus-dev" <greybus-dev-bounces@lists.linaro.org>
X-Virus-Scanned: ClamAV using ClamSMTP

--===============6936866220054018294==
Content-Type: multipart/alternative; boundary="000000000000c2d09f058fef602f"

--000000000000c2d09f058fef602f
Content-Type: text/plain; charset="UTF-8"

On Mon, Aug 12, 2019 at 12:49 PM Christopher Friedt <chrisfriedt@gmail.com>
wrote:
>
> On Mon, Aug 12, 2019 at 12:47 PM Christopher Friedt
> <chrisfriedt@gmail.com> wrote:
[snip]

> >
> > My thoughts were that manifests could be a source of platform_data in
> > the kernel just like devicetree or acpi, accessed through the
> > linux/of.h interface in driver code.
> >
[snip]

> >
> > Care would need to be taken that all of the property types defined in
> > linux/of.h were accounted for.
>
> This would require a rev to the manifest specification, and also some
> plumbing in the kernel.

Assuming we take on this task and our proposed modifications are accepted,
would it be sufficient to be able to describe the body of 600
mikroBus-compatible Click boards for which at likely hundreds already have
drivers in some same shape without needing to touch all the drivers? I
mean, my goal here is to produce a pattern that enables getting such boards
supported in the kernel tremendously quicker and easier than touching the
existing body of microcontroller firmware.

--
https://beagleboard.org/about - a 501c3 non-profit educating around open
hardware computing

--000000000000c2d09f058fef602f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On Mon, Aug 12, 2019 at 12:49 PM Christopher Friedt &lt;<a=
 href=3D"mailto:chrisfriedt@gmail.com">chrisfriedt@gmail.com</a>&gt; wrote:=
<br>&gt;<br>&gt; On Mon, Aug 12, 2019 at 12:47 PM Christopher Friedt<br>&gt=
; &lt;<a href=3D"mailto:chrisfriedt@gmail.com">chrisfriedt@gmail.com</a>&gt=
; wrote:<br><div>[snip]</div><div><br></div><div>&gt; &gt;<br>&gt; &gt; My =
thoughts were that manifests could be a source of platform_data in<br>&gt; =
&gt; the kernel just like devicetree or acpi, accessed through the<br>&gt; =
&gt; linux/of.h interface in driver code.<br>&gt; &gt;<br>[snip]<br><br>&gt=
; &gt;<br>&gt; &gt; Care would need to be taken that all of the property ty=
pes defined in<br>&gt; &gt; linux/of.h were accounted for.<br>&gt;<br>&gt; =
This would require a rev to the manifest specification, and also some<br>&g=
t; plumbing in the kernel.<br><br>Assuming we take on this task and our pro=
posed modifications are accepted, would it be sufficient to be able to desc=
ribe the body of 600 mikroBus-compatible Click boards for which at likely h=
undreds already have drivers in some same shape without needing to touch al=
l the drivers? I mean, my goal here is to produce a pattern that enables ge=
tting such boards supported in the kernel tremendously quicker and easier t=
han touching the existing body of microcontroller firmware.<br><br>--<br><a=
 href=3D"https://beagleboard.org/about">https://beagleboard.org/about</a> -=
 a 501c3 non-profit educating around open hardware computing</div></div>

--000000000000c2d09f058fef602f--

--===============6936866220054018294==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1k
ZXYgbWFpbGluZyBsaXN0CmdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKaHR0cHM6Ly9saXN0
cy5saW5hcm8ub3JnL21haWxtYW4vbGlzdGluZm8vZ3JleWJ1cy1kZXYK

--===============6936866220054018294==--
