Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E7406BF99
	for <lists+greybus-dev@lfdr.de>; Wed, 17 Jul 2019 18:29:06 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 9497C6071B
	for <lists+greybus-dev@lfdr.de>; Wed, 17 Jul 2019 16:29:05 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 897726180B; Wed, 17 Jul 2019 16:29:05 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
	ip-10-150-125-211.ec2.internal
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 0C5C96198E;
	Wed, 17 Jul 2019 16:28:40 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id E4B1F6180B
 for <greybus-dev@lists.linaro.org>; Wed, 17 Jul 2019 16:28:36 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id CD7BF6071B; Wed, 17 Jul 2019 16:28:36 +0000 (UTC)
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
 [209.85.128.67])
 by lists.linaro.org (Postfix) with ESMTPS id C98706071B
 for <greybus-dev@lists.linaro.org>; Wed, 17 Jul 2019 16:28:34 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id a15so22793022wmj.5
 for <greybus-dev@lists.linaro.org>; Wed, 17 Jul 2019 09:28:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QsuqKd2yeLqKvDjSoymYk+qWNRD807R1aiXLIw845QA=;
 b=UoFSUtbAHpoCysvR3JMdiz6S5oNEw8UTJrfs3YJV1BgSat5XPvz5KM656LvIhjG29a
 0N5n12jBYBNLLkhBM/HBFxRSrzGFkRqKthvv/ckb5NhDp9ciLX+cBz4mut++vz75ovQK
 C/o2JN4Wrj//UWOmJ/JzEm1GT9dScs3w5v/7JDRoqVWIQthWA950oss4uLUKFvsZJUs7
 6CagsupXZeKqunHJHdOWlzmkh20vprhf6jFVES86/HWc+QI8T6c2jid7ZR1CX7bFQAh8
 q7IJnHoz8YXPaDQUaxix33D0+hU3YJrLegDu0IaMKFbmxspjQz2bSuJDhRFdgAD6K2gn
 02sQ==
X-Gm-Message-State: APjAAAXpNOQSW20Mj6OlT8f5Jphc78FiR+vyi4/27RiUJilAmFZ6JGd4
 oBtq6zXTsKFxxBfyt/tPkOx3G9SkJTgOao3RYto=
X-Google-Smtp-Source: APXvYqwCQmjP5V2dlhFBlolY8TQIebULHSlboolBqeQKGONXQNQig5a/i1DnKekXPij4CCyErhCD35Z9I7gF0qyy45E=
X-Received: by 2002:a1c:6555:: with SMTP id z82mr38573804wmb.129.1563380913509; 
 Wed, 17 Jul 2019 09:28:33 -0700 (PDT)
MIME-Version: 1.0
References: <CAFPGqosrnQmroLFRmTRNCYyqdQXnhBhJuCLo=WMphs60KvhKZQ@mail.gmail.com>
 <20190706085603.GE9955@kroah.com>
 <CAFPGqovJPQFNSYtiYyZAEkpOe2C53cifZ7Yaei_GUWKNErVz7w@mail.gmail.com>
 <20190713154843.GA12533@kroah.com>
 <CAFPGqov1AbeA16sJLJCWKod6QMqkCigt57sC1n-+FH9-Wxgpvw@mail.gmail.com>
 <20190716192544.GA27918@kroah.com>
In-Reply-To: <20190716192544.GA27918@kroah.com>
From: Jason Kridner <jkridner@beagleboard.org>
Date: Wed, 17 Jul 2019 12:28:09 -0400
Message-ID: <CA+T6QPnSqhi4Xr+0ooh+Thkd8oQFfH=djZ=NgoWFWE4D=Mz0Jw@mail.gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
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
Content-Type: multipart/mixed; boundary="===============3577373508384567759=="
Errors-To: greybus-dev-bounces@lists.linaro.org
Sender: "greybus-dev" <greybus-dev-bounces@lists.linaro.org>
X-Virus-Scanned: ClamAV using ClamSMTP

--===============3577373508384567759==
Content-Type: multipart/alternative; boundary="000000000000ff9c69058de2fbbd"

--000000000000ff9c69058de2fbbd
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 16, 2019 at 3:25 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> On Sun, Jul 14, 2019 at 01:13:37AM +0530, Vaishnav MA wrote:
> > > On Sat, Jul 13, 2019 at 06:03:02PM +0530, Vaishnav MA wrote:

[...]

> > tl;dr: the idea of the project is to bind a kernel driver for an
existing
> > I2C/SPI chip to an I2C/SPI greybus device
>
> Yes, I remember reading about this, hopefully it works out :)
>
> > No on the device side, Linux is not running, Click Boards are simply
add-on
> > modules(sensors, OLED displays, transceivers ..) which use SPI, I2C or
UART
> > to communicate with the Beaglebone and Kernel Drivers exist for most of
> > them.
>
> Do you have a pointer to the specs for these?

https://mikroe.com/click

There are about 700 different Click board options.

I'm mentoring Vaishnav in this project. I'll try to restate the goal I'd
ideally like to see him achieve.

The interim goal is provide a template for others to follow when adding any
of these Click boards to a Linux host where existing Linux drivers would be
given sufficient platform data via gbsim to be instantiated over greybus
using these embedded buses that otherwise are non-discoverable. This solves
a few problems:

1. It allows the drivers to be loaded at runtime, rather than be configured
into the boot device tree. Loading driver at boot time can be someone
reasonable to expect, but it slows the debugging process requiring a reboot
and leaving developers with the possibility of making a system not boot
easily. While dynamic overlays are somewhat supported via configfs and I'd
love to see that continue to move forward, there seems to be a fair amount
of push-back due to the security implications of being able to arbitrarily
alter the hardware. By going through greybus, we are limited to extending
and existing set of embedded busses rather than doing arbitrary pokes into
the kernel. So, this is a potentially better way to load these drivers at
runtime.

2. By using the Click header as a proxy for the various embedded buses,
there is an opportunity for abstraction of the Linux host. For example, on
BeagleBone Black, the mikroBUS Cape[1] provides 4 slots for Click boards to
be added. Each of these might utilize a different SPI port, I2C port or
GPIO pins. By defining a metadata set for the body of Click boards, we
could use our implementation of gbsim (or other solution) to map the ports
to board resources. The same abstraction should hold true for
non-BeagleBoard.org Linux systems, allowing us to better share metadata
with folks developing with, say, a Raspberry Pi. So, this is potentially a
better way to collaborate on metadata around these Click boards.

3. While this particular project focuses on building a solution for
BeagleBone Black and PocketBeagle users via gbsim, because it uses greybus,
other transports could potentially be used, either IP (such as demonstrated
by Alexandre Bailon[2][3]) or via a microcontroller interface (such as the
BeagleBone PRUs). So, this can grow to be a tested set of metadata for
connecting to hundreds of IoT sensor/actuator devices that can now be
abstracted regarding how they are wired-up to a system. I plan to talk
about this a lot more at Linux Plumbers in September.

[1] https://www.mikroe.com/beaglebone-mikrobus-cape
[2] https://www.youtube.com/watch?v=7H50pv-4YXw
[3] https://elinux.org/images/c/cb/Using_Greybus_for_IoT.pdf
[4] https://www.mikroe.com/mikrobus

>
>
> So what is going to be the "transport" layer for greybus here?

Today, gbsim will provide the transport, however that works.

>
> If the beaglebone can see the raw SPI/I2C/UART port, and that is where
> Linux is running, it's going to be a bit hard to use greybus here.

Somehow, gbsim has already largely addressed this issue as far as I can
tell. New ports are getting instantiated. The trick is providing the extra
platform information to deal with things like reset controls or interrupt
lines. The mikroBus specification[4] has physical positions for reset and
interrupt, but I'm not sure this is flexible enough. We still need to
translate that into the board-specific resources and pass those to the
kernel somehow as well.

I believe there are two problems here to solve:

1. How do we specify the extra data?

2. For a gbsim implementation, how do we add the translation layer and
build the platform data needed by the drivers?

>
> gbsim is great for doing greybus development of the host code, but
> tieing it to the actual device side is a bit tough here as that is what
> gbsim is emulating.

We'd like to extend it for the purpose of rapid-prototyping and it would
thus act a as a test harness for connecting greybus to a huge collection of
sensors/actuators that could be reused across any transport implemented in
the future, as greybus was originally intended.

>
> >  For example, for SPI based devices I am passing the Driver name to
> > Greybus(via a modified Greybus Simulator Manifest)  through the
.modalias
> > property which is being sent to the spi_new_device call in greybus
> > <
https://github.com/beagleboard/linux/blob/f45281297c419d29df9bedbb9d1eaeb12fd2b93b/drivers/staging/greybus/spilib.c#L475
>
> > ,
> > however, since additional platform_data
> > <
https://linuxtv.org/downloads/v4l-dvb-internals/device-drivers/API-struct-spi-board-info.html
>
> > is not being considered in greybus, support for devices(Click Boards)
with
> > Interrupt/Reset or other requirements cannot be implemented in this way.
> > Can you recommend the best way to bind an existing Kernel Driver for an
> > I2C/SPI chip for a Generic SPI/I2C based device(with interrupts and
other
> > platform specific data).
>
> Use device tree overlays :)

If they can be applied at runtime, that may be a suitable solution.
Translation could happen at the userspace/application layer and the
overlays could be applied. Due to the pushbacks on overlays being added to
the mainline (at least by my understanding), this would continue to live
out-of-tree. I'd like to roadmap a way to eventually bring it all back in.
Hopefully, I've explained sufficiently why greybus still has a role in
this, even if we do generate some dt overlays on-the-fly.

Regards,
Jason
--
https://beagleboard.org/about - a 501c3 non-profit educating around open
hardware computing

--000000000000ff9c69058de2fbbd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On Tue, Jul 16, 2019 at 3:25 PM Greg KH &lt;<a href=3D"mai=
lto:gregkh@linuxfoundation.org">gregkh@linuxfoundation.org</a>&gt; wrote:<b=
r>&gt; On Sun, Jul 14, 2019 at 01:13:37AM +0530, Vaishnav MA wrote:<br>&gt;=
 &gt; &gt; On Sat, Jul 13, 2019 at 06:03:02PM +0530, Vaishnav MA wrote:<br>=
<br>[...]<div><br>&gt; &gt; tl;dr: the idea of the project is to bind a ker=
nel driver for an existing<br>&gt; &gt; I2C/SPI chip to an I2C/SPI greybus =
device<br>&gt;<br>&gt; Yes, I remember reading about this, hopefully it wor=
ks out :)<br>&gt;<br>&gt; &gt; No on the device side, Linux is not running,=
 Click Boards are simply add-on<br>&gt; &gt; modules(sensors, OLED displays=
, transceivers ..) which use SPI, I2C or UART<br>&gt; &gt; to communicate w=
ith the Beaglebone and Kernel Drivers exist for most of<br>&gt; &gt; them.<=
br>&gt;<br>&gt; Do you have a pointer to the specs for these?<div><br></div=
><div><a href=3D"https://mikroe.com/click">https://mikroe.com/click</a></di=
v><div><br></div><div>There are about 700 different Click board options.</d=
iv><div><br></div><div>I&#39;m mentoring Vaishnav in this project. I&#39;ll=
 try to restate the goal I&#39;d ideally like to see him achieve.</div><div=
><br></div><div>The interim goal is provide a template for others to follow=
 when adding any of these Click boards to a Linux host where existing Linux=
 drivers would be given sufficient platform data via gbsim to be instantiat=
ed over greybus using these embedded buses that otherwise are non-discovera=
ble. This solves a few problems:</div><div><br></div><div>1. It allows the =
drivers to be loaded at runtime, rather than be configured into the boot de=
vice tree. Loading driver at boot time can be someone reasonable to expect,=
 but it slows the debugging process requiring a reboot and leaving develope=
rs with the possibility of making a system not boot easily. While dynamic o=
verlays are somewhat supported via configfs and I&#39;d love to see that co=
ntinue to move forward, there seems to be a fair amount of push-back due to=
 the security implications of being able to arbitrarily alter the hardware.=
 By going through greybus, we are limited to extending and existing set of =
embedded busses rather than doing arbitrary pokes into the kernel. So, this=
 is a potentially better way to load these drivers at runtime.</div><div><b=
r></div><div>2. By using the Click header as a proxy for the various embedd=
ed buses, there is an opportunity for abstraction of the Linux host. For ex=
ample, on BeagleBone Black, the mikroBUS Cape[1] provides 4 slots for Click=
 boards to be added. Each of these might utilize a different SPI port, I2C =
port or GPIO pins. By defining a metadata set for the body of Click boards,=
 we could use our implementation of gbsim (or other solution) to map the po=
rts to board resources. The same abstraction should hold true for non-Beagl=
eBoard.org Linux systems, allowing us to better share metadata with folks d=
eveloping with, say, a Raspberry Pi. So, this is potentially a better way t=
o collaborate on metadata around these Click boards.</div><div><br></div><d=
iv>3. While this particular project focuses on building a solution for Beag=
leBone Black and PocketBeagle users via gbsim, because it uses greybus, oth=
er transports could potentially be used, either IP (such as demonstrated by=
 Alexandre Bailon[2][3]) or via a microcontroller interface (such as the Be=
agleBone PRUs). So, this can grow to be a tested set of metadata for connec=
ting to hundreds of IoT sensor/actuator devices that can now be abstracted =
regarding how they are wired-up to a system. I plan to talk about this a lo=
t more at Linux Plumbers in September.</div><div><br></div><div>[1]=C2=A0<a=
 href=3D"https://www.mikroe.com/beaglebone-mikrobus-cape">https://www.mikro=
e.com/beaglebone-mikrobus-cape</a></div><div>[2]=C2=A0<a href=3D"https://ww=
w.youtube.com/watch?v=3D7H50pv-4YXw">https://www.youtube.com/watch?v=3D7H50=
pv-4YXw</a></div><div>[3]=C2=A0<a href=3D"https://elinux.org/images/c/cb/Us=
ing_Greybus_for_IoT.pdf">https://elinux.org/images/c/cb/Using_Greybus_for_I=
oT.pdf</a></div><div>[4]=C2=A0<a href=3D"https://www.mikroe.com/mikrobus">h=
ttps://www.mikroe.com/mikrobus</a></div><div><br>&gt;<br>&gt;<br>&gt; So wh=
at is going to be the &quot;transport&quot; layer for greybus here?</div><d=
iv><br></div><div>Today, gbsim will provide the transport, however that wor=
ks.</div><div><br>&gt;<br>&gt; If the beaglebone can see the raw SPI/I2C/UA=
RT port, and that is where<br>&gt; Linux is running, it&#39;s going to be a=
 bit hard to use greybus here.</div><div><br></div><div>Somehow, gbsim has =
already largely addressed this issue as far as I can tell. New ports are ge=
tting instantiated. The trick is providing the extra platform information t=
o deal with things like reset controls or interrupt lines. The mikroBus spe=
cification[4] has physical positions for reset and interrupt, but I&#39;m n=
ot sure this is flexible enough. We still need to translate that into the b=
oard-specific resources and pass those to the kernel somehow as well.</div>=
<div><br></div><div>I believe there are two problems here to solve:</div><d=
iv><br></div><div>1. How do we specify the extra data?</div><div><br></div>=
<div>2. For a gbsim implementation, how do we add the translation layer and=
 build the platform data needed by the drivers?</div><div><br>&gt;<br>&gt; =
gbsim is great for doing greybus development of the host code, but<br>&gt; =
tieing it to the actual device side is a bit tough here as that is what<br>=
&gt; gbsim is emulating.</div><div><br></div><div>We&#39;d like to extend i=
t for the purpose of rapid-prototyping and it would thus act a as a test ha=
rness for connecting greybus to a huge collection of sensors/actuators that=
 could be reused across any transport implemented in the future, as greybus=
 was originally intended.</div><div><br>&gt;<br>&gt; &gt; =C2=A0For example=
, for SPI based devices I am passing the Driver name to<br>&gt; &gt; Greybu=
s(via a modified Greybus Simulator Manifest) =C2=A0through the .modalias<br=
>&gt; &gt; property which is being sent to the spi_new_device call in greyb=
us<br>&gt; &gt; &lt;<a href=3D"https://github.com/beagleboard/linux/blob/f4=
5281297c419d29df9bedbb9d1eaeb12fd2b93b/drivers/staging/greybus/spilib.c#L47=
5">https://github.com/beagleboard/linux/blob/f45281297c419d29df9bedbb9d1eae=
b12fd2b93b/drivers/staging/greybus/spilib.c#L475</a>&gt;<br>&gt; &gt; ,<br>=
&gt; &gt; however, since additional platform_data<br>&gt; &gt; &lt;<a href=
=3D"https://linuxtv.org/downloads/v4l-dvb-internals/device-drivers/API-stru=
ct-spi-board-info.html">https://linuxtv.org/downloads/v4l-dvb-internals/dev=
ice-drivers/API-struct-spi-board-info.html</a>&gt;<br>&gt; &gt; is not bein=
g considered in greybus, support for devices(Click Boards) with<br>&gt; &gt=
; Interrupt/Reset or other requirements cannot be implemented in this way.<=
br>&gt; &gt; Can you recommend the best way to bind an existing Kernel Driv=
er for an<br>&gt; &gt; I2C/SPI chip for a Generic SPI/I2C based device(with=
 interrupts and other<br>&gt; &gt; platform specific data).<br>&gt;<br>&gt;=
 Use device tree overlays :)</div><div><br></div><div>If they can be applie=
d at runtime, that may be a suitable solution. Translation could happen at =
the userspace/application layer and the overlays could be applied. Due to t=
he pushbacks on overlays being added to the mainline (at least by my unders=
tanding), this would continue to live out-of-tree. I&#39;d like to roadmap =
a way to eventually bring it all back in. Hopefully, I&#39;ve explained suf=
ficiently why greybus still has a role in this, even if we do generate some=
 dt overlays on-the-fly.</div><div><br></div><div>Regards,</div><div>Jason<=
br>--<br><a href=3D"https://beagleboard.org/about">https://beagleboard.org/=
about</a> - a 501c3 non-profit educating around open hardware computing</di=
v><div><br></div></div></div>

--000000000000ff9c69058de2fbbd--

--===============3577373508384567759==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1k
ZXYgbWFpbGluZyBsaXN0CmdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKaHR0cHM6Ly9saXN0
cy5saW5hcm8ub3JnL21haWxtYW4vbGlzdGluZm8vZ3JleWJ1cy1kZXYK

--===============3577373508384567759==--
