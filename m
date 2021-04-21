Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id E52033662C5
	for <lists+greybus-dev@lfdr.de>; Wed, 21 Apr 2021 02:02:15 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 13EA3667BE
	for <lists+greybus-dev@lfdr.de>; Wed, 21 Apr 2021 00:02:15 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 054A16684D; Wed, 21 Apr 2021 00:02:15 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE
	autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 2272C66852;
	Wed, 21 Apr 2021 00:01:40 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 6E448667BE
 for <greybus-dev@lists.linaro.org>; Wed, 21 Apr 2021 00:01:37 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 5F5856684D; Wed, 21 Apr 2021 00:01:37 +0000 (UTC)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com
 [209.85.219.175])
 by lists.linaro.org (Postfix) with ESMTPS id BD4726684F
 for <greybus-dev@lists.linaro.org>; Wed, 21 Apr 2021 00:01:17 +0000 (UTC)
Received: by mail-yb1-f175.google.com with SMTP id p3so24471774ybk.0
 for <greybus-dev@lists.linaro.org>; Tue, 20 Apr 2021 17:01:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2CGCH5PGeVhADiVX2syGd44hSjwQsXphUBfbI1udXx4=;
 b=fz2fsRT2Bo4Aua1AlZ1XbGECM63KlTrFEFWaHxO1Nsejpuvb3V6N89p0iWoCSyrROC
 6A2ZfTpkh32BIW5flF+R3Bpz4hrELIV9CRJy8we+hqtZwZU+MszOHLRsfJqrr0sQdszo
 7zJ34Y2pe/AVaKHEdlkPenK815aujKwziURe7LNe+mpV0LtYoBVsRmCA9UsqbdKA8oQi
 fgX2SSZd2XmzMeJY8Ln9CHa2hDCOkZysfLmK5vFoELf1EahFkDNHSp7xxPjCFH2/ioWW
 keu/syZj1GCnQMiGZkcYA9gWde5x0oyXHuFVvMdZiPMvh7govohfbmfDqaurvKkyw5ms
 AZQQ==
X-Gm-Message-State: AOAM532EMl8/+q/C8rjRWgOP2xbz8aZozSgJN3iN4eGkqkVcl+72LIuZ
 pZQOlVkedwfs9FKw6JJf+keFHHhETBjCiY6WPpyVOwaFT3izldI2
X-Google-Smtp-Source: ABdhPJxmZR9ou3AeMJbJmm0tXsRWpG/78UiB/MY/S5ZAIqocfYlM20LKlPiBDYvap1jcGjaolqUtaPEmL3AdiLK2zgI=
X-Received: by 2002:a25:3450:: with SMTP id b77mr23212212yba.211.1618963277229; 
 Tue, 20 Apr 2021 17:01:17 -0700 (PDT)
MIME-Version: 1.0
References: <CAMgvH3p9L8D6ZeGbzVqMSahUU-mUL7K1-yijgz+D=B6MYHJjSQ@mail.gmail.com>
 <YHmQPbufUqbthg55@kroah.com>
 <CAMgvH3qf84NqzguGHAe4EASoAWyV15NpwsjKNvuTaq_drMXnyw@mail.gmail.com>
 <YHp7dsQsKa4K05d3@kroah.com>
 <CAMgvH3rnDQ2OOwwtnSWiuquV_S5EU9iQ4i2gOoWbOkvigE-MtA@mail.gmail.com>
 <YH0zXh2AMZAJUnAo@kroah.com>
 <CAMgvH3pgBehB3799TLLzAWZWSyeD0qCiJfUqkvzVVr5ZO5JxmQ@mail.gmail.com>
 <YH6H9SR1h0Mg4x2Q@kroah.com>
In-Reply-To: <YH6H9SR1h0Mg4x2Q@kroah.com>
From: Kyle Harding <kyle@balena.io>
Date: Tue, 20 Apr 2021 20:01:06 -0400
Message-ID: <CAMgvH3qZBf6wayv+OoVfZzZQH3Qt8Y9Ar8_KH2xdXiPYX4EJTg@mail.gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: greybus-dev@lists.linaro.org
Subject: Re: [greybus-dev] DMA support via gb-netlink and gbridge
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
Content-Type: multipart/mixed; boundary="===============6287997684995554541=="
Errors-To: greybus-dev-bounces@lists.linaro.org
Sender: "greybus-dev" <greybus-dev-bounces@lists.linaro.org>
X-Virus-Scanned: ClamAV using ClamSMTP

--===============6287997684995554541==
Content-Type: multipart/alternative; boundary="0000000000000b66d105c070438d"

--0000000000000b66d105c070438d
Content-Type: text/plain; charset="UTF-8"

On Tue, Apr 20, 2021 at 3:51 AM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> A: http://en.wikipedia.org/wiki/Top_post
> Q: Were do I find info about this thing called top-posting?
> A: Because it messes up the order in which people normally read text.
> Q: Why is top-posting such a bad thing?
> A: Top-posting.
> Q: What is the most annoying thing in e-mail?
>
> A: No.
> Q: Should I include quotations after my reply?
>
> http://daringfireball.net/2007/07/on_top
>

TIL about top-posting. Thanks for enlightening me!

>
> On Mon, Apr 19, 2021 at 02:59:56PM -0400, Kyle Harding wrote:
> > Thanks Greg, I've explained our solution poorly so I'll quote a
colleague
> > as I'm too close to the problem at this point!
> >
> > We'd like to essentially run a virtualized vendor kernel to manage a
> > hardware device such as an SDIO wireless card passed through from the
host,
> > running a mainline kernel. Network traffic would be routed from host to
> > guest over a virtio interface.
> >
> > Is it possible to use Greybus in this way, or am I misunderstanding the
use
> > case of this subsystem?
>
> You could abuse greybus to do something like this, but that feels like a
> ton of extra work when there are already solutions for this type of
> thing today in Linux.  Why not just use some of the existing hardware
> pass-through solutions that are out there that allow virtual kernels to
> have access to hardware directly?  Why try to create yet-another way to
> do this?
>
> But hey, if you want to take the time to write such kernel code, all the
> best!  :)
>
> greg k-h

We've explored options such as VFIO for this use case. Although VFIO works
great on PCs with hardware peripherals on an I/O bus such as PCI behind an
IOMMU, we're looking to passthrough a platform device (SDIO wireless
specifically, but potentially others as well) on an embedded system, such
as a Raspberry Pi 4.
We've investigated vfio-platform intended for this, but based on a paper
[1] describing the architecture and use cases, it seems to require specific
hardware that implements DMA translation functionality, such as an IOMMU or
SMMU, along with the appropriate driver. As we understand, a lot of the
platforms we support don't have an IOMMU.

The kernel docs [2] describe the programming interface of devices as
generally composed of I/O access, interrupts, and DMA.

Devices are the main target of any I/O driver.  Devices typically
create a programming interface made up of I/O access, interrupts,
and DMA.  Without going into the details of each of these, DMA is
by far the most critical aspect for maintaining a secure environment
as allowing a device read-write access to system memory imposes the
greatest risk to the overall system integrity.

This seems to explain the need for an IOMMU to passthrough a device to a
virtualized guest, as any DMA done by a device would need guest
physical-addresses translated to host-physical addresses.
However, we don't know for certain if the driver for our wireless adapter
(mwifiex) uses DMA. Grepping the source shows references to DMA, but the
fact that SDIO devices can be connected over a USB bridge seems to indicate
it either doesn't, or we're not completely understanding.

We really don't know how feasible this idea is given our hardware
constraints. Greybus may very likely be solving an entirely different
issue, but it seemed to have enough overlap to be worth investigating.
We're looking to understand if this is possible given our hardware
constraints, or if we're barking up the wrong tree.

[1]: http://www.fp7-save.eu/papers/EUC2014B.pdf
[2]: https://www.kernel.org/doc/Documentation/driver-api/vfio.rst

Cheers, Kyle

--0000000000000b66d105c070438d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br><br>On Tue, Apr 20, 2021 at 3:51 AM Greg KH &lt;<a=
 href=3D"mailto:gregkh@linuxfoundation.org">gregkh@linuxfoundation.org</a>&=
gt; wrote:<br>&gt;<br>&gt; A: <a href=3D"http://en.wikipedia.org/wiki/Top_p=
ost">http://en.wikipedia.org/wiki/Top_post</a><br>&gt; Q: Were do I find in=
fo about this thing called top-posting?<br>&gt; A: Because it messes up the=
 order in which people normally read text.<br>&gt; Q: Why is top-posting su=
ch a bad thing?<br>&gt; A: Top-posting.<br>&gt; Q: What is the most annoyin=
g thing in e-mail?<br>&gt;<br>&gt; A: No.<br>&gt; Q: Should I include quota=
tions after my reply?<br>&gt;<br><div>&gt; <a href=3D"http://daringfireball=
.net/2007/07/on_top">http://daringfireball.net/2007/07/on_top</a></div><div=
>&gt;</div><div><br></div><div>TIL about top-posting. Thanks for enlighteni=
ng me!</div><div><br></div>&gt;<br>&gt; On Mon, Apr 19, 2021 at 02:59:56PM =
-0400, Kyle Harding wrote:<br>&gt; &gt; Thanks Greg, I&#39;ve explained our=
 solution poorly so I&#39;ll quote a colleague<br>&gt; &gt; as I&#39;m too =
close to the problem at this point!<br>&gt; &gt;<br>&gt; &gt; We&#39;d like=
 to essentially run a virtualized vendor kernel to manage a<br>&gt; &gt; ha=
rdware device such as an SDIO wireless card passed through from the host,<b=
r>&gt; &gt; running a mainline kernel. Network traffic would be routed from=
 host to<br>&gt; &gt; guest over a virtio interface.<br>&gt; &gt;<br>&gt; &=
gt; Is it possible to use Greybus in this way, or am I misunderstanding the=
 use<br>&gt; &gt; case of this subsystem?<br>&gt;<br>&gt; You could abuse g=
reybus to do something like this, but that feels like a<br>&gt; ton of extr=
a work when there are already solutions for this type of<br>&gt; thing toda=
y in Linux.=C2=A0 Why not just use some of the existing hardware<br>&gt; pa=
ss-through solutions that are out there that allow virtual kernels to<br>&g=
t; have access to hardware directly?=C2=A0 Why try to create yet-another wa=
y to<br>&gt; do this?<br>&gt;<br>&gt; But hey, if you want to take the time=
 to write such kernel code, all the<br>&gt; best! =C2=A0:)<br>&gt;<br><div>=
&gt; greg k-h</div><div><br></div><div>
<div>We&#39;ve explored options such as VFIO for this use case. Although VF=
IO works great on PCs with hardware peripherals on an I/O bus such as PCI b=
ehind an IOMMU, we&#39;re looking to passthrough a platform device (SDIO wi=
reless specifically, but potentially others as well) on an embedded system,=
 such as a Raspberry Pi 4.</div><div>We&#39;ve investigated vfio-platform i=
ntended for this, but based on a paper [1] describing the architecture and =
use cases, it seems to require specific hardware that implements DMA transl=
ation functionality, such as an IOMMU or SMMU, along with the appropriate d=
river. As we understand, a lot of the platforms we support don&#39;t have a=
n IOMMU.</div><br>The kernel docs [2] describe the programming interface of=
 devices as generally composed of I/O access, interrupts, and DMA.<br><br><=
div style=3D"margin-left:40px">Devices are the main target of any I/O drive=
r.=C2=A0 Devices typically<br>create a programming interface made up of I/O=
 access, interrupts,<br>and DMA.=C2=A0 Without going into the details of ea=
ch of these, DMA is<br>by far the most critical aspect for maintaining a se=
cure environment<br>as allowing a device read-write access to system memory=
 imposes the<br>greatest risk to the overall system integrity.<br></div><br=
><div>This seems to explain the need for an IOMMU to passthrough a device t=
o a virtualized guest, as any DMA done by a device would need guest physica=
l-addresses translated to host-physical addresses.</div><div>However, we do=
n&#39;t know for certain if the driver for our wireless adapter (mwifiex) u=
ses DMA. Grepping the source shows references to DMA, but the fact that SDI=
O devices can be connected over a USB bridge seems to indicate it either do=
esn&#39;t, or we&#39;re not completely understanding.</div><br>We really do=
n&#39;t know how feasible this idea is given our hardware constraints. Grey=
bus may very likely be solving an entirely different issue, but it seemed t=
o have enough overlap to be worth investigating. We&#39;re looking to under=
stand if this is possible given our hardware constraints, or if we&#39;re b=
arking up the wrong tree.<br><br>[1]: <a href=3D"http://www.fp7-save.eu/pap=
ers/EUC2014B.pdf">http://www.fp7-save.eu/papers/EUC2014B.pdf</a><br>[2]: <a=
 href=3D"https://www.kernel.org/doc/Documentation/driver-api/vfio.rst">http=
s://www.kernel.org/doc/Documentation/driver-api/vfio.rst</a> <br></div><div=
><br></div><div>Cheers, Kyle<br></div></div>

--0000000000000b66d105c070438d--

--===============6287997684995554541==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1k
ZXYgbWFpbGluZyBsaXN0CmdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKaHR0cHM6Ly9saXN0
cy5saW5hcm8ub3JnL21haWxtYW4vbGlzdGluZm8vZ3JleWJ1cy1kZXYK

--===============6287997684995554541==--
