Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id A05C58A22E
	for <lists+greybus-dev@lfdr.de>; Mon, 12 Aug 2019 17:23:16 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 60DC561836
	for <lists+greybus-dev@lfdr.de>; Mon, 12 Aug 2019 15:23:15 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 547B261834; Mon, 12 Aug 2019 15:23:15 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
	ip-10-150-125-211.ec2.internal
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2
	autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 5970461837;
	Mon, 12 Aug 2019 15:22:57 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id DB61B61833
 for <greybus-dev@lists.linaro.org>; Mon, 12 Aug 2019 15:22:54 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id BA59A61836; Mon, 12 Aug 2019 15:22:54 +0000 (UTC)
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
 [209.85.221.68])
 by lists.linaro.org (Postfix) with ESMTPS id 44CBD61833
 for <greybus-dev@lists.linaro.org>; Mon, 12 Aug 2019 15:22:53 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id 31so104956558wrm.1
 for <greybus-dev@lists.linaro.org>; Mon, 12 Aug 2019 08:22:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=K4gecuTWogV/HTAQa5PQyUiVIeVlZXPJx9pmHhc+97g=;
 b=aghMrUUr0J6xUiWZOwe26So5RkEYt7D2ygjhZ0NpwsfvUwUnXxHJ/69cUUllzlXuUG
 8dz3C/Ks2J2+RfAXtRdqEfvK7Sn1xZdP7OrAovMwEbg9dkOVCYXMwZhXmEMQyjgNKP3W
 0t+Nar/ZYLKuJcjFgBiskOo2X1zHd2Sng4uLipmCvvd6W93+1mPzHJY4oBzUgGVB83js
 4EJ9jKXqiGzKiRFFzF8BM2vhkQ5yXpEflxjDlCB2PiFmoWkRY8fC09ifLZmhixbLnn8s
 ER2Qw9x2pdnfOZm4WRzILJZb81MQVOX8t23MNz7CblbT6bqUZ45NXUNdOOR2MuWnEhlp
 8/9g==
X-Gm-Message-State: APjAAAU7LWEJjPnb3nIhlTCAiciCmSxK6VXqoxIdWFmx/HnoohVl+dzY
 FIZ9wCPLgDF1ISMVlNG2Zv/06COF16yW503xqpU=
X-Google-Smtp-Source: APXvYqwz5kXfBRFY0CqtHV6mnTHLzM6X0yUkDph5/QGt849zY7D39WcSlf21liKniwxBPMfjKH9jF3WbQZDdITxPJ2Y=
X-Received: by 2002:adf:f28d:: with SMTP id k13mr23139403wro.19.1565623372224; 
 Mon, 12 Aug 2019 08:22:52 -0700 (PDT)
MIME-Version: 1.0
References: <CAFPGqosrnQmroLFRmTRNCYyqdQXnhBhJuCLo=WMphs60KvhKZQ@mail.gmail.com>
 <20190706085603.GE9955@kroah.com>
 <CAFPGqovJPQFNSYtiYyZAEkpOe2C53cifZ7Yaei_GUWKNErVz7w@mail.gmail.com>
 <20190713154843.GA12533@kroah.com>
 <CAFPGqov1AbeA16sJLJCWKod6QMqkCigt57sC1n-+FH9-Wxgpvw@mail.gmail.com>
 <20190716192544.GA27918@kroah.com>
 <CA+T6QPnSqhi4Xr+0ooh+Thkd8oQFfH=djZ=NgoWFWE4D=Mz0Jw@mail.gmail.com>
 <CA+T6QPm5+f2mLqbv3o9yd2S9BvvVD-U9GA-yisXuowhuB6Qijg@mail.gmail.com>
In-Reply-To: <CA+T6QPm5+f2mLqbv3o9yd2S9BvvVD-U9GA-yisXuowhuB6Qijg@mail.gmail.com>
From: Jason Kridner <jkridner@beagleboard.org>
Date: Mon, 12 Aug 2019 11:22:41 -0400
Message-ID: <CA+T6QPkSZr9ignCZGhaifpOWE6517fELRDjJp6f3bAWDOft0JQ@mail.gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>, Christopher Friedt <chris@friedt.co>
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: greybus-dev@lists.linaro.org, Vaishnav MA <mavaishnav007@gmail.com>
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
Content-Type: multipart/mixed; boundary="===============6506359367170576498=="
Errors-To: greybus-dev-bounces@lists.linaro.org
Sender: "greybus-dev" <greybus-dev-bounces@lists.linaro.org>
X-Virus-Scanned: ClamAV using ClamSMTP

--===============6506359367170576498==
Content-Type: multipart/alternative; boundary="000000000000f42052058fed18d7"

--000000000000f42052058fed18d7
Content-Type: text/plain; charset="UTF-8"

On Mon, Jul 22, 2019 at 12:43 PM Jason Kridner <jkridner@beagleboard.org>
wrote:
> On Wed, Jul 17, 2019 at 11:28 AM Jason Kridner <jkridner@beagleboard.org>
wrote:
> > On Tue, Jul 16, 2019 at 3:25 PM Greg KH <gregkh@linuxfoundation.org>
wrote:
> > > On Sun, Jul 14, 2019 at 01:13:37AM +0530, Vaishnav MA wrote:
> > > > > On Sat, Jul 13, 2019 at 06:03:02PM +0530, Vaishnav MA wrote:
> >
> > I believe there are two problems here to solve:

Let's just focus on #1.

> >
> > 1. How do we specify the extra data?

The *extra* data here is whatever else a driver needs to load. Manifests
have the buses needed and name to find the driver, but are missing any
association between extra signals, like IRQ or other named GPIOs. We'd like
a common way to specify those.

Chris has suggested adding some additional data to the manifests, like

[string-descriptor 2]string =
driver-specific-gpio-name=manifest-specific-gpio-name

I've proposed trying to define mikroBus as an extra bundle type and add
another driver to try to plug in any missing platform data.

Vaishnav has suggested to me this:

> consider an example for an mpu9dof click , this click requires a greybus
i2c bus and a greybus gpio interrupt ,
> so the manifest will have a i2c protocol on cport1 and gpio protocol on
cport2 , loading the manifest will set up
> the corresponding peripherals (greybus gpio, greybus i2c bus) , also the
manifest will have the click name and
> port , which will be passed to the Mikrobus driver for device
instantiation

So, again, putting a bit of extra metadata into the manifest, but here,
specifically at the bundle level, but, I feel he's saying something very
similar to me regarding having a mikroBus driver pull that data out and
call the appropriate driver registration.

Is there something just off in our terminology or understanding of the
architecture that is preventing us from finding the obvious answer?

--
https://beagleboard.org/about - a 501c3 non-profit educating around open
hardware computing

--000000000000f42052058fed18d7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On Mon, Jul 22, 2019 at 12:43 PM Jason Kridner &lt;<a href=
=3D"mailto:jkridner@beagleboard.org">jkridner@beagleboard.org</a>&gt; wrote=
:<br>&gt; On Wed, Jul 17, 2019 at 11:28 AM Jason Kridner &lt;<a href=3D"mai=
lto:jkridner@beagleboard.org">jkridner@beagleboard.org</a>&gt; wrote:<br>&g=
t; &gt; On Tue, Jul 16, 2019 at 3:25 PM Greg KH &lt;<a href=3D"mailto:gregk=
h@linuxfoundation.org">gregkh@linuxfoundation.org</a>&gt; wrote:<br>&gt; &g=
t; &gt; On Sun, Jul 14, 2019 at 01:13:37AM +0530, Vaishnav MA wrote:<br>&gt=
; &gt; &gt; &gt; &gt; On Sat, Jul 13, 2019 at 06:03:02PM +0530, Vaishnav MA=
 wrote:<br>&gt; &gt;<br>&gt; &gt; I believe there are two problems here to =
solve:<div><br></div><div>Let&#39;s just focus on #1.</div><div><br>&gt; &g=
t;<br>&gt; &gt; 1. How do we specify the extra data?<br><br>The *extra* dat=
a here is whatever else a driver needs to load. Manifests have the buses ne=
eded and name to find the driver, but are missing any association between e=
xtra signals, like IRQ or other named GPIOs. We&#39;d like a common way to =
specify those.</div><div><br></div><div>Chris has suggested adding some add=
itional data to the manifests, like</div><div><br></div><div>[string-descri=
ptor 2]string =3D driver-specific-gpio-name=3Dmanifest-specific-gpio-name</=
div><div><br></div><div>I&#39;ve proposed trying to define mikroBus as an e=
xtra bundle type and add another driver to try to plug in any missing platf=
orm data.</div><div><br></div><div>Vaishnav has suggested to me this:</div>=
<div><br></div><div>&gt; consider an example for an mpu9dof click , this cl=
ick requires a greybus i2c bus and a greybus gpio interrupt ,=C2=A0</div><d=
iv>&gt; so the manifest will have a i2c protocol on cport1 and gpio protoco=
l on cport2 , loading the manifest will set up=C2=A0</div><div>&gt; the cor=
responding peripherals (greybus gpio, greybus i2c bus) , also the manifest =
will have the click name and=C2=A0</div><div>&gt; port , which will be pass=
ed to the Mikrobus driver for device instantiation</div><div><br></div><div=
>So, again, putting a bit of extra metadata into the manifest, but here, sp=
ecifically at the bundle level, but, I feel he&#39;s saying something very =
similar to me regarding having a mikroBus driver pull that data out and cal=
l the appropriate driver registration.</div><div><br></div><div>Is there so=
mething just off in our terminology or understanding of the architecture th=
at is preventing us from finding the obvious answer?<br><br>--<br><a href=
=3D"https://beagleboard.org/about">https://beagleboard.org/about</a> - a 50=
1c3 non-profit educating around open hardware computing<div><br></div></div=
></div>

--000000000000f42052058fed18d7--

--===============6506359367170576498==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1k
ZXYgbWFpbGluZyBsaXN0CmdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKaHR0cHM6Ly9saXN0
cy5saW5hcm8ub3JnL21haWxtYW4vbGlzdGluZm8vZ3JleWJ1cy1kZXYK

--===============6506359367170576498==--
