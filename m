Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id B9561362117
	for <lists+greybus-dev@lfdr.de>; Fri, 16 Apr 2021 15:34:36 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id E97F8667CB
	for <lists+greybus-dev@lfdr.de>; Fri, 16 Apr 2021 13:34:35 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id DACD5667CC; Fri, 16 Apr 2021 13:34:35 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE
	autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 18958667CD;
	Fri, 16 Apr 2021 13:34:17 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id BC9CC667BD
 for <greybus-dev@lists.linaro.org>; Fri, 16 Apr 2021 13:34:14 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 9F0B0667CC; Fri, 16 Apr 2021 13:34:14 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by lists.linaro.org (Postfix) with ESMTPS id 7CFF5667BD
 for <greybus-dev@lists.linaro.org>; Fri, 16 Apr 2021 13:34:13 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id n138so44910612lfa.3
 for <greybus-dev@lists.linaro.org>; Fri, 16 Apr 2021 06:34:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2Acloa6Jx/4pgUNgBNhB6f/CCTcNvW3d91z34hYzCtA=;
 b=Fj0oJgSfgjxYJljVpKPl7YIrbB8GWvSbTTII0nrBuI92wrUfn6CtbGVY1BwXHy/UgN
 57EmZIak7+5/r9ap7VVhQRgh2VQAUlbWg9g9BamRkuDrNlqwRprSedJQ0Ap13S67Y+tC
 QZ61HCTiyP6tbTkoSaJ6byfBy/iswvbzXkjogAOB2GOXN+ib/Vh7R9ybom0A+PSO7Gvb
 5JklJXykn6DKN3FG6par/AAh5S/IXVkwfHPfadufvRiV7WvfpfY9Iv6nI8zvoX2W+i09
 myYnR+HoDEoso8DDI7809KgiTxzZbue3/OBgo3Evao0uB4/uAIsu2CIqE4dqylU2zFD9
 VCwQ==
X-Gm-Message-State: AOAM530djarKeGsWiLTpP1Z8uhPiO2RweCE+tFjm3nVirQEdaV94oKVJ
 swfGyHda4l9UtwRzAsnEoTqxzmXXskmyNKbLDeVSGg==
X-Google-Smtp-Source: ABdhPJySsQRmWhjCbW5gHii7c5g1Og/+7kbZ8F+hItc0ssAn3cIbiW5O1yosyfJxS8d1wdA6UhzWGyCRRjyT/Fo50Ck=
X-Received: by 2002:a19:6d07:: with SMTP id i7mr3035745lfc.568.1618580052351; 
 Fri, 16 Apr 2021 06:34:12 -0700 (PDT)
MIME-Version: 1.0
References: <CAMgvH3p9L8D6ZeGbzVqMSahUU-mUL7K1-yijgz+D=B6MYHJjSQ@mail.gmail.com>
 <YHmQPbufUqbthg55@kroah.com>
In-Reply-To: <YHmQPbufUqbthg55@kroah.com>
From: Kyle Harding <kyle@balena.io>
Date: Fri, 16 Apr 2021 09:34:01 -0400
Message-ID: <CAMgvH3qf84NqzguGHAe4EASoAWyV15NpwsjKNvuTaq_drMXnyw@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="===============1833709932390912133=="
Errors-To: greybus-dev-bounces@lists.linaro.org
Sender: "greybus-dev" <greybus-dev-bounces@lists.linaro.org>
X-Virus-Scanned: ClamAV using ClamSMTP

--===============1833709932390912133==
Content-Type: multipart/alternative; boundary="0000000000000fae4e05c01709e7"

--0000000000000fae4e05c01709e7
Content-Type: text/plain; charset="UTF-8"

My understanding is that the system with the SDIO hardware will write
packets directly to shared memory, and thus will be unavailable to be read
by the networking stack on the remote/virtual system.

But I will also admit that I started learning about DMA recently so I could
be misunderstanding something crucial.

On Fri, Apr 16, 2021 at 9:25 AM Greg KH <gregkh@linuxfoundation.org> wrote:

> On Fri, Apr 16, 2021 at 09:13:18AM -0400, Kyle Harding wrote:
> > Hey all, new member here!
> >
> > As the subject line suggests, our development hardware does not support
> > UniPro so we were looking at a guest kernel solution with TCP/IP
> transport
> > over gbridge.
> >
> > However, one of the SDIO bus devices is a wifi module that requires DMA.
> Is
> > this possible over the current gb-netlink/gbridge to your knowledge?
>
> Where is the DMA happening here?  Across the network?  Or on the system
> that actually has the SDIO device hardware?  If the latter, you should
> be fine, right?
>
> thanks,
>
> greg k-h
>

--0000000000000fae4e05c01709e7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>My understanding is that the system with the SDIO har=
dware will write packets directly to shared memory, and thus will be unavai=
lable to be read by the networking stack on the remote/virtual system.<br><=
br></div>But I will also admit that I started learning about DMA recently s=
o I could be misunderstanding something crucial.<br></div><br><div class=3D=
"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Apr 16, 2021 at=
 9:25 AM Greg KH &lt;<a href=3D"mailto:gregkh@linuxfoundation.org">gregkh@l=
inuxfoundation.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">On Fri, Apr 16, 2021 at 09:13:18AM -0400, Kyle Harding wr=
ote:<br>
&gt; Hey all, new member here!<br>
&gt; <br>
&gt; As the subject line suggests, our development hardware does not suppor=
t<br>
&gt; UniPro so we were looking at a guest kernel solution with TCP/IP trans=
port<br>
&gt; over gbridge.<br>
&gt; <br>
&gt; However, one of the SDIO bus devices is a wifi module that requires DM=
A. Is<br>
&gt; this possible over the current gb-netlink/gbridge to your knowledge?<b=
r>
<br>
Where is the DMA happening here?=C2=A0 Across the network?=C2=A0 Or on the =
system<br>
that actually has the SDIO device hardware?=C2=A0 If the latter, you should=
<br>
be fine, right?<br>
<br>
thanks,<br>
<br>
greg k-h<br>
</blockquote></div>

--0000000000000fae4e05c01709e7--

--===============1833709932390912133==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1k
ZXYgbWFpbGluZyBsaXN0CmdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKaHR0cHM6Ly9saXN0
cy5saW5hcm8ub3JnL21haWxtYW4vbGlzdGluZm8vZ3JleWJ1cy1kZXYK

--===============1833709932390912133==--
