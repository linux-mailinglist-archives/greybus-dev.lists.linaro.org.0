Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 59972363700
	for <lists+greybus-dev@lfdr.de>; Sun, 18 Apr 2021 19:32:03 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id C770F622F1
	for <lists+greybus-dev@lfdr.de>; Sun, 18 Apr 2021 17:31:59 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id BB5D4622F9; Sun, 18 Apr 2021 17:31:59 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE
	autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id A801D618C2;
	Sun, 18 Apr 2021 17:31:38 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 35154608B0
 for <greybus-dev@lists.linaro.org>; Sun, 18 Apr 2021 17:31:35 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 1E794618B2; Sun, 18 Apr 2021 17:31:35 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by lists.linaro.org (Postfix) with ESMTPS id D1BEB608B0
 for <greybus-dev@lists.linaro.org>; Sun, 18 Apr 2021 17:31:33 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id j18so52414023lfg.5
 for <greybus-dev@lists.linaro.org>; Sun, 18 Apr 2021 10:31:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/qg2DRkAArf9OeiJ72D8uya6o8S1dx4oKI4P0NSEgFQ=;
 b=Ge0n8lNn/wcEYOVzMjBPzkYNmNKqfkLaJBMNKxCk/ybFk3VlnqPw6yGlWZyAZ0fsug
 YMp1J0Eq7GMzIss8zdUhg6NIcXYbvYYJxlCh451wSaKwWS/s5BY0b+pujcDKWceGD7Uy
 otc9r+5IBAkzvddOQit6pMXBUke00BSiwozcjoUtDv2AJRQtuaYino/Bagj7pvbriG92
 AgvpdT/GcS/iK9kcS2KbnXb8thFQtrdR6K++QyJiTAUZCVBJCTyX2WLiuBJsL0o2Tdvg
 cEkdyQLu0DKOa5tq+rI22iALavtonqSAwhB62Ivukfcf76p0+Te/3ywZIZ+AYPvIe28X
 vbhA==
X-Gm-Message-State: AOAM533Wcon5SHA0+LLa13ZxF5zAYofi3IGO4OXwSbVmBMGnR3lN4FN3
 XnyHKfkiks9wfPdCwM8fnm0Qz2bEQFuOGaXNur0KV/WPjrRKvcgj
X-Google-Smtp-Source: ABdhPJxfP99/jUA1wY7FVwXWOX+EcCwJz7WJLYX+3wKa5cNW+5hL0CoKQIsVH+h7174Smcxag9Xc0tDaFoy1JavzEqU=
X-Received: by 2002:a19:6d07:: with SMTP id i7mr9513536lfc.568.1618767092745; 
 Sun, 18 Apr 2021 10:31:32 -0700 (PDT)
MIME-Version: 1.0
References: <CAMgvH3p9L8D6ZeGbzVqMSahUU-mUL7K1-yijgz+D=B6MYHJjSQ@mail.gmail.com>
 <YHmQPbufUqbthg55@kroah.com>
 <CAMgvH3qf84NqzguGHAe4EASoAWyV15NpwsjKNvuTaq_drMXnyw@mail.gmail.com>
 <YHp7dsQsKa4K05d3@kroah.com>
In-Reply-To: <YHp7dsQsKa4K05d3@kroah.com>
From: Kyle Harding <kyle@balena.io>
Date: Sun, 18 Apr 2021 13:31:23 -0400
Message-ID: <CAMgvH3rnDQ2OOwwtnSWiuquV_S5EU9iQ4i2gOoWbOkvigE-MtA@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="===============0044350782610295360=="
Errors-To: greybus-dev-bounces@lists.linaro.org
Sender: "greybus-dev" <greybus-dev-bounces@lists.linaro.org>
X-Virus-Scanned: ClamAV using ClamSMTP

--===============0044350782610295360==
Content-Type: multipart/alternative; boundary="000000000000899bb505c0429561"

--000000000000899bb505c0429561
Content-Type: text/plain; charset="UTF-8"

That does help, thank you Greg! It seems that in general the transport
shouldn't be a problem.

What if the non-hardware side is a kvm guest kernel without IOMMU support?
If we used greybus to expose the SDIO bus to the kvm would the DMA transfer
garbage in Host Memory?

I understand this is a non-traditional approach, and I believe that with
IOMMU this wouldn't be an issue.

Thanks,
Kyle

On Sat, Apr 17, 2021 at 2:08 AM Greg KH <gregkh@linuxfoundation.org> wrote:

> On Fri, Apr 16, 2021 at 09:34:01AM -0400, Kyle Harding wrote:
> > My understanding is that the system with the SDIO hardware will write
> > packets directly to shared memory, and thus will be unavailable to be
> read
> > by the networking stack on the remote/virtual system.
>
> The SDIO hardware controller is off on the "device" side of a greybus
> connection, not on the host, so if any DMA needs to happen, that device
> side handles it.
>
> The SDIO hardware is not on the "host" side, perhaps you are getting
> confused as to how a greybus protocol is supposed to be used?
>
> Think of it as a SDIO device that is plugged into a system by a USB
> connection.  The USB data traveling to the device doesn't care about
> SDIO dma stuff, as the whole SDIO controller hardware is in the USB
> device itself.
>
> You can think of greybus as just a way to tell a device "hey, here's
> some SDIO data, can you read/write it please?"  The transport on which
> that message goes on does not matter, which is why you can do this over
> a network connection.
>
> hope this helps,
>
> greg k-h
>

--000000000000899bb505c0429561
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>That does help, thank you Greg! It seems that in gene=
ral the transport shouldn&#39;t be a problem.</div><div><br></div><div>What=
 if the non-hardware side is a kvm guest kernel without IOMMU support? If w=
e used greybus to expose the SDIO bus to the kvm would the DMA=20
 transfer garbage in Host Memory?</div><div><br></div><div>I understand thi=
s is a non-traditional approach, and I believe that with IOMMU this wouldn&=
#39;t be an issue.<br><br></div><div>Thanks,<br></div><div>Kyle<br></div></=
div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On=
 Sat, Apr 17, 2021 at 2:08 AM Greg KH &lt;<a href=3D"mailto:gregkh@linuxfou=
ndation.org">gregkh@linuxfoundation.org</a>&gt; wrote:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">On Fri, Apr 16, 2021 at 09:34:01AM -=
0400, Kyle Harding wrote:<br>
&gt; My understanding is that the system with the SDIO hardware will write<=
br>
&gt; packets directly to shared memory, and thus will be unavailable to be =
read<br>
&gt; by the networking stack on the remote/virtual system.<br>
<br>
The SDIO hardware controller is off on the &quot;device&quot; side of a gre=
ybus<br>
connection, not on the host, so if any DMA needs to happen, that device<br>
side handles it.<br>
<br>
The SDIO hardware is not on the &quot;host&quot; side, perhaps you are gett=
ing<br>
confused as to how a greybus protocol is supposed to be used?<br>
<br>
Think of it as a SDIO device that is plugged into a system by a USB<br>
connection.=C2=A0 The USB data traveling to the device doesn&#39;t care abo=
ut<br>
SDIO dma stuff, as the whole SDIO controller hardware is in the USB<br>
device itself.<br>
<br>
You can think of greybus as just a way to tell a device &quot;hey, here&#39=
;s<br>
some SDIO data, can you read/write it please?&quot;=C2=A0 The transport on =
which<br>
that message goes on does not matter, which is why you can do this over<br>
a network connection.<br>
<br>
hope this helps,<br>
<br>
greg k-h<br>
</blockquote></div>

--000000000000899bb505c0429561--

--===============0044350782610295360==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1k
ZXYgbWFpbGluZyBsaXN0CmdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKaHR0cHM6Ly9saXN0
cy5saW5hcm8ub3JnL21haWxtYW4vbGlzdGluZm8vZ3JleWJ1cy1kZXYK

--===============0044350782610295360==--
