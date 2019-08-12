Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 9387D8A673
	for <lists+greybus-dev@lfdr.de>; Mon, 12 Aug 2019 20:43:00 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id B4FF761837
	for <lists+greybus-dev@lfdr.de>; Mon, 12 Aug 2019 18:42:59 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id A52C86183C; Mon, 12 Aug 2019 18:42:59 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
	ip-10-150-125-211.ec2.internal
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FROM,HTML_MESSAGE,MAILING_LIST_MULTI,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id ABA6E61838;
	Mon, 12 Aug 2019 18:42:36 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id D60B6617E7
 for <greybus-dev@lists.linaro.org>; Mon, 12 Aug 2019 18:39:23 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id C8D1B61836; Mon, 12 Aug 2019 18:39:23 +0000 (UTC)
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 by lists.linaro.org (Postfix) with ESMTPS id 062D26182E
 for <greybus-dev@lists.linaro.org>; Mon, 12 Aug 2019 18:39:17 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id n5so162751218otk.1
 for <greybus-dev@lists.linaro.org>; Mon, 12 Aug 2019 11:39:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=j72CBK1y4Gq6SLMWi/S0XMSNjCFnOgR5+nne9z0+KQ8=;
 b=rhueRRQM5GVQBCzDLd9uwef0jG+5eztjP9ViUQ3zy6c+cJkHh8RPlglLJlOgO5xIwQ
 pb8BRm1jKw+OJH5ACJk/T4hRPnYjvVASk8FA8MhCD4DE/HzisAgJne1WrczDfUt+gNvG
 U7ahFLglV62KJHKYv4Dqq2STdMTzB1A9XRfcxCyh8QtNYWGt6G6Yhi0l2RcbZirP0ToA
 /4H9evmnwgpruTgaEeRfPegqgrBu3SMqdvMSXzEVkwnqTG7Exk+HrpOTeSDqNIExwno0
 PGvwsCHXbTRFr2YhETJ1u7ZddhHX2NeBpJKCbMQF0g2pGMmUMYaRD+5ZheYaVnA6mZLj
 bECg==
X-Gm-Message-State: APjAAAWfcWwSz8wdn0jyGp4B1vPApu93s4i3OQSvvGSbBIe/LO2dQKaV
 UXKrjptvVYsH8DZc3q/eDGxiTgmrAKJtW2mQnMg=
X-Google-Smtp-Source: APXvYqwpldSWJmS3U/5iCONjAztljhv8kaJtmRnY3Fp0j1DkYKK4uYpBfEzCfhBDQm87mh06zSxR4+DJVy/2Qcw0abo=
X-Received: by 2002:a5d:924e:: with SMTP id e14mr33731157iol.215.1565635156330; 
 Mon, 12 Aug 2019 11:39:16 -0700 (PDT)
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
 <CA+T6QPnkrA10_ZOvQS4W=1m0q3xpUqKUzwfhMeoNZXkNpp1RUw@mail.gmail.com>
In-Reply-To: <CA+T6QPnkrA10_ZOvQS4W=1m0q3xpUqKUzwfhMeoNZXkNpp1RUw@mail.gmail.com>
From: Christopher Friedt <chrisfriedt@gmail.com>
Date: Mon, 12 Aug 2019 14:39:04 -0400
Message-ID: <CAF4BF-R=6-Sg3vD_niMGt9F9hVS7wQqjYBKRHaY7RVKA_xAHtw@mail.gmail.com>
To: Jason Kridner <jkridner@beagleboard.org>
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: Vaishnav MA <mavaishnav007@gmail.com>, greybus-dev@lists.linaro.org
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
Content-Type: multipart/mixed; boundary="===============2531992183540459820=="
Errors-To: greybus-dev-bounces@lists.linaro.org
Sender: "greybus-dev" <greybus-dev-bounces@lists.linaro.org>
X-Virus-Scanned: ClamAV using ClamSMTP

--===============2531992183540459820==
Content-Type: multipart/alternative; boundary="000000000000574cf9058fefd773"

--000000000000574cf9058fefd773
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon., Aug. 12, 2019, 2:06 p.m. Jason Kridner, <jkridner@beagleboard.org>
wrote:

> On Mon, Aug 12, 2019 at 12:49 PM Christopher Friedt <chrisfriedt@gmail.co=
m>
> wrote:
> >
> > On Mon, Aug 12, 2019 at 12:47 PM Christopher Friedt
> > <chrisfriedt@gmail.com> wrote:
> [snip]
>
> > >
> > > My thoughts were that manifests could be a source of platform_data in
> > > the kernel just like devicetree or acpi, accessed through the
> > > linux/of.h interface in driver code.
> > >
> [snip]
>
> > >
> > > Care would need to be taken that all of the property types defined in
> > > linux/of.h were accounted for.
> >
> > This would require a rev to the manifest specification, and also some
> > plumbing in the kernel.
>
> Assuming we take on this task and our proposed modifications are accepted=
,
> would it be sufficient to be able to describe the body of 600
> mikroBus-compatible Click boards for which at likely hundreds already hav=
e
> drivers in some same shape without needing to touch all the drivers? I
> mean, my goal here is to produce a pattern that enables getting such boar=
ds
> supported in the kernel tremendously quicker and easier than touching the
> existing body of microcontroller firmware.
>

Yes. We would essentially just be using the same interface as device tree,
so if the drivers used device tree before, they would Just Work=E2=84=A2 wi=
th this
change.

There are some intricacies though. Specifically to ensure that "phandles"
referenced resources on the same physical module.

Technically speaking, it *might* be possible to string a wire up from a
remote module to the host gpio, or from one module to another module, but I
just can't see that as being practical.

--000000000000574cf9058fefd773
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Mon., Aug. 12, 2019, 2:06 p.m. Jason Kridner, &lt;<=
a href=3D"mailto:jkridner@beagleboard.org">jkridner@beagleboard.org</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr">On Mon, Au=
g 12, 2019 at 12:49 PM Christopher Friedt &lt;<a href=3D"mailto:chrisfriedt=
@gmail.com" target=3D"_blank" rel=3D"noreferrer">chrisfriedt@gmail.com</a>&=
gt; wrote:<br>&gt;<br>&gt; On Mon, Aug 12, 2019 at 12:47 PM Christopher Fri=
edt<br>&gt; &lt;<a href=3D"mailto:chrisfriedt@gmail.com" target=3D"_blank" =
rel=3D"noreferrer">chrisfriedt@gmail.com</a>&gt; wrote:<br><div>[snip]</div=
><div><br></div><div>&gt; &gt;<br>&gt; &gt; My thoughts were that manifests=
 could be a source of platform_data in<br>&gt; &gt; the kernel just like de=
vicetree or acpi, accessed through the<br>&gt; &gt; linux/of.h interface in=
 driver code.<br>&gt; &gt;<br>[snip]<br><br>&gt; &gt;<br>&gt; &gt; Care wou=
ld need to be taken that all of the property types defined in<br>&gt; &gt; =
linux/of.h were accounted for.<br>&gt;<br>&gt; This would require a rev to =
the manifest specification, and also some<br>&gt; plumbing in the kernel.<b=
r><br>Assuming we take on this task and our proposed modifications are acce=
pted, would it be sufficient to be able to describe the body of 600 mikroBu=
s-compatible Click boards for which at likely hundreds already have drivers=
 in some same shape without needing to touch all the drivers? I mean, my go=
al here is to produce a pattern that enables getting such boards supported =
in the kernel tremendously quicker and easier than touching the existing bo=
dy of microcontroller firmware.</div></div></blockquote></div></div><div di=
r=3D"auto"><br></div><div dir=3D"auto">Yes. We would essentially just be us=
ing the same interface as device tree, so if the drivers used device tree b=
efore, they would Just Work=E2=84=A2 with this change.</div><div dir=3D"aut=
o"><br></div><div dir=3D"auto">There are some intricacies though. Specifica=
lly to ensure that &quot;phandles&quot; referenced resources on the same ph=
ysical module.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Technical=
ly speaking, it *might* be possible to string a wire up from a remote modul=
e to the host gpio, or from one module to another module, but I just can&#3=
9;t see that as being practical.</div><div dir=3D"auto"></div></div>

--000000000000574cf9058fefd773--

--===============2531992183540459820==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1k
ZXYgbWFpbGluZyBsaXN0CmdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKaHR0cHM6Ly9saXN0
cy5saW5hcm8ub3JnL21haWxtYW4vbGlzdGluZm8vZ3JleWJ1cy1kZXYK

--===============2531992183540459820==--
