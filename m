Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id BE9E0364A37
	for <lists+greybus-dev@lfdr.de>; Mon, 19 Apr 2021 21:05:33 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 87F9B66815
	for <lists+greybus-dev@lfdr.de>; Mon, 19 Apr 2021 19:05:32 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 727E266816; Mon, 19 Apr 2021 19:05:32 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE
	autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id BF9366681B;
	Mon, 19 Apr 2021 19:03:48 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 7861266810
 for <greybus-dev@lists.linaro.org>; Mon, 19 Apr 2021 19:00:11 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 66D2666813; Mon, 19 Apr 2021 19:00:11 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 by lists.linaro.org (Postfix) with ESMTPS id 0210866810
 for <greybus-dev@lists.linaro.org>; Mon, 19 Apr 2021 19:00:09 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id u4so40625880ljo.6
 for <greybus-dev@lists.linaro.org>; Mon, 19 Apr 2021 12:00:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AKyVCs7nPYW2kpvhKbC1FYsH1QA8AojruOKx/EJ5MM8=;
 b=ARkjbm2iwzyOLh5wLI4LXHBzzSNtM6AMCGPbdwShSgK5rPOFULzzm6BenrcGqG7PhK
 hdVS2Umx91gO+PfCxpLABcHPwUxUo02L/i/qSd45ewcIsz6E60rcSY/LC0mACcejci0D
 pBPoEjkPY/I1X6Q9ot0BYXKqGspBPhJmQARQFL3+1/V+u3HOBUo5x0eZrymtdokalQ7S
 tae8uQrsw3GrqXUB/ywGqaE+nGmvC4lrdbrjiS9cA3M0B4LVP2xgDchZQSwqhJTyoX5e
 xVLikhp+nEoljnSDnQ0kAC0LFjMFS84BtMiCagCATi2+Ydd+qsUCpTI3Jm6h6ZSzloQC
 ic/Q==
X-Gm-Message-State: AOAM532TnJu04uom8Vc041YH6hBL8lbBPH0gBz3RrIkMhy+Yq16tUwFa
 B0F2X6oBVoFG94DSHGFkqmziBd+OMq5BjtoTgWEcyQ==
X-Google-Smtp-Source: ABdhPJwWu27t5KlenCGVWG1U/SFpdItAhIQslbDBXSWdbpRebVTBayW7JhPAqppl6WP62srm7H0nnguSwP+aVXELoWc=
X-Received: by 2002:a2e:93c4:: with SMTP id p4mr11744391ljh.367.1618858807902; 
 Mon, 19 Apr 2021 12:00:07 -0700 (PDT)
MIME-Version: 1.0
References: <CAMgvH3p9L8D6ZeGbzVqMSahUU-mUL7K1-yijgz+D=B6MYHJjSQ@mail.gmail.com>
 <YHmQPbufUqbthg55@kroah.com>
 <CAMgvH3qf84NqzguGHAe4EASoAWyV15NpwsjKNvuTaq_drMXnyw@mail.gmail.com>
 <YHp7dsQsKa4K05d3@kroah.com>
 <CAMgvH3rnDQ2OOwwtnSWiuquV_S5EU9iQ4i2gOoWbOkvigE-MtA@mail.gmail.com>
 <YH0zXh2AMZAJUnAo@kroah.com>
In-Reply-To: <YH0zXh2AMZAJUnAo@kroah.com>
From: Kyle Harding <kyle@balena.io>
Date: Mon, 19 Apr 2021 14:59:56 -0400
Message-ID: <CAMgvH3pgBehB3799TLLzAWZWSyeD0qCiJfUqkvzVVr5ZO5JxmQ@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="===============5217912060897096570=="
Errors-To: greybus-dev-bounces@lists.linaro.org
Sender: "greybus-dev" <greybus-dev-bounces@lists.linaro.org>
X-Virus-Scanned: ClamAV using ClamSMTP

--===============5217912060897096570==
Content-Type: multipart/alternative; boundary="0000000000002fd4a005c057f097"

--0000000000002fd4a005c057f097
Content-Type: text/plain; charset="UTF-8"

Thanks Greg, I've explained our solution poorly so I'll quote a colleague
as I'm too close to the problem at this point!

We'd like to essentially run a virtualized vendor kernel to manage a
hardware device such as an SDIO wireless card passed through from the host,
running a mainline kernel. Network traffic would be routed from host to
guest over a virtio interface.

Is it possible to use Greybus in this way, or am I misunderstanding the use
case of this subsystem?

On Mon, Apr 19, 2021 at 3:38 AM Greg KH <gregkh@linuxfoundation.org> wrote:

> On Sun, Apr 18, 2021 at 01:31:23PM -0400, Kyle Harding wrote:
> > That does help, thank you Greg! It seems that in general the transport
> > shouldn't be a problem.
> >
> > What if the non-hardware side is a kvm guest kernel without IOMMU
> support?
> > If we used greybus to expose the SDIO bus to the kvm would the DMA
> transfer
> > garbage in Host Memory?
> >
> > I understand this is a non-traditional approach, and I believe that with
> > IOMMU this wouldn't be an issue.
>
> Again, I think you are getting very confused as to what the greybus
> protocol stack is for.
>
> You can use it for any type of bus you want, you just need to write a
> driver for that transport layer.  But for talking to virtual machines,
> why not just use the virtio layer which is designed just for that?  You
> could make a virtio transport for greybus, but really, why?  Who would
> use that?
>
> And again, IOMMUs have nothing to do with this at all.
>
> thanks,
>
> greg k-h
>

--0000000000002fd4a005c057f097
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks Greg, I&#39;ve explained our solution poorly so I&#=
39;ll quote a colleague as I&#39;m too close to the problem at this point!<=
br><br>We&#39;d like to essentially run a virtualized vendor kernel to mana=
ge a hardware device such as an SDIO wireless card passed through from the =
host, running a mainline kernel. Network traffic would be routed from host =
to guest over a virtio interface. <br><br>Is it possible to use Greybus in =
this way, or am I misunderstanding the use case of this subsystem?<br></div=
><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mo=
n, Apr 19, 2021 at 3:38 AM Greg KH &lt;<a href=3D"mailto:gregkh@linuxfounda=
tion.org">gregkh@linuxfoundation.org</a>&gt; wrote:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">On Sun, Apr 18, 2021 at 01:31:23PM -040=
0, Kyle Harding wrote:<br>
&gt; That does help, thank you Greg! It seems that in general the transport=
<br>
&gt; shouldn&#39;t be a problem.<br>
&gt; <br>
&gt; What if the non-hardware side is a kvm guest kernel without IOMMU supp=
ort?<br>
&gt; If we used greybus to expose the SDIO bus to the kvm would the DMA tra=
nsfer<br>
&gt; garbage in Host Memory?<br>
&gt; <br>
&gt; I understand this is a non-traditional approach, and I believe that wi=
th<br>
&gt; IOMMU this wouldn&#39;t be an issue.<br>
<br>
Again, I think you are getting very confused as to what the greybus<br>
protocol stack is for.<br>
<br>
You can use it for any type of bus you want, you just need to write a<br>
driver for that transport layer.=C2=A0 But for talking to virtual machines,=
<br>
why not just use the virtio layer which is designed just for that?=C2=A0 Yo=
u<br>
could make a virtio transport for greybus, but really, why?=C2=A0 Who would=
<br>
use that?<br>
<br>
And again, IOMMUs have nothing to do with this at all.<br>
<br>
thanks,<br>
<br>
greg k-h<br>
</blockquote></div>

--0000000000002fd4a005c057f097--

--===============5217912060897096570==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1k
ZXYgbWFpbGluZyBsaXN0CmdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKaHR0cHM6Ly9saXN0
cy5saW5hcm8ub3JnL21haWxtYW4vbGlzdGluZm8vZ3JleWJ1cy1kZXYK

--===============5217912060897096570==--
