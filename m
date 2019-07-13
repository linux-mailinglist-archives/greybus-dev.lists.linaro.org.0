Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 41ABF67BDB
	for <lists+greybus-dev@lfdr.de>; Sat, 13 Jul 2019 21:46:20 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 66ACA617FC
	for <lists+greybus-dev@lfdr.de>; Sat, 13 Jul 2019 19:46:19 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 5BF7D61868; Sat, 13 Jul 2019 19:46:19 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
	ip-10-150-125-211.ec2.internal
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FROM,HTML_MESSAGE,MAILING_LIST_MULTI,RCVD_IN_DNSWL_NONE
	autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 6CF5B61839;
	Sat, 13 Jul 2019 19:45:58 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 273946105C
 for <greybus-dev@lists.linaro.org>; Sat, 13 Jul 2019 19:45:55 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 14BC861828; Sat, 13 Jul 2019 19:45:55 +0000 (UTC)
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com
 [209.85.166.45])
 by lists.linaro.org (Postfix) with ESMTPS id 6AB996105C
 for <greybus-dev@lists.linaro.org>; Sat, 13 Jul 2019 19:45:53 +0000 (UTC)
Received: by mail-io1-f45.google.com with SMTP id f4so27590708ioh.6
 for <greybus-dev@lists.linaro.org>; Sat, 13 Jul 2019 12:45:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=l41A0zZ7olJHEZ3w7/Hcjceb5lZin9BC62K3YOpf/TI=;
 b=ogM7yvPjE1DNHcCI5ICM2di9K7ypjNpACaRqxLd/dAykTJ9h6cQEfdVB0FKp36cGU5
 +zn3aQFnaTWbKL2EkFLYvRGEUgWSFwKGwICk43eaTBL17vqgGgYZvPK9sABRCm+xAiCS
 646R8o0NbvJTnvzO/v6k2UTqMfJv9fasvOsAfgbneaL+4m03vg2+1MJAt9Iul871oFYw
 VmmplOhs6z09wiU80FNrfMu/dGOh8e30UsRWTvZjLvUT0Qkg3kv2XWvx/PsyqVSx0GU2
 3AzZkYP6KEsuSYxPtOUrtXWXncLs197a6FHA3Idn06PnNEHc2Jo7xLkF3VsVNUBoanTH
 X2hA==
X-Gm-Message-State: APjAAAXPmKrmyYCI84zaUWAiLCxFYlC66FP+5KCbnKuHhDu81L2t4sjl
 EoI1JAbn13wqPr1Df1kgpsdM88pE8rnJ1aeuFH0=
X-Google-Smtp-Source: APXvYqzUNoRU+PpVP+n/8+tQmO2u9uothya5ae8+3UbRHHCcp0XlPseZ6+TTVATkZzeLhyNa1j/3iwUYKQGNgv0Hh5A=
X-Received: by 2002:a5d:8347:: with SMTP id q7mr16231318ior.277.1563047152676; 
 Sat, 13 Jul 2019 12:45:52 -0700 (PDT)
MIME-Version: 1.0
References: <CAFPGqosrnQmroLFRmTRNCYyqdQXnhBhJuCLo=WMphs60KvhKZQ@mail.gmail.com>
 <20190706085603.GE9955@kroah.com>
 <CAFPGqovJPQFNSYtiYyZAEkpOe2C53cifZ7Yaei_GUWKNErVz7w@mail.gmail.com>
 <20190713154843.GA12533@kroah.com>
In-Reply-To: <20190713154843.GA12533@kroah.com>
From: Vaishnav MA <mavaishnav007@gmail.com>
Date: Sun, 14 Jul 2019 01:13:37 +0530
Message-ID: <CAFPGqov1AbeA16sJLJCWKod6QMqkCigt57sC1n-+FH9-Wxgpvw@mail.gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: greybus-dev@lists.linaro.org
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
Content-Type: multipart/mixed; boundary="===============7878811117800564148=="
Errors-To: greybus-dev-bounces@lists.linaro.org
Sender: "greybus-dev" <greybus-dev-bounces@lists.linaro.org>
X-Virus-Scanned: ClamAV using ClamSMTP

--===============7878811117800564148==
Content-Type: multipart/alternative; boundary="0000000000004d7645058d954610"

--0000000000004d7645058d954610
Content-Type: text/plain; charset="UTF-8"

On Sat, Jul 13, 2019 at 9:18 PM Greg KH <gregkh@linuxfoundation.org> wrote:

>
> A: Because it messes up the order in which people normally read text.
> Q: Why is top-posting such a bad thing?
> A: Top-posting.
> Q: What is the most annoying thing in e-mail?
>
> A: No.
> Q: Should I include quotations after my reply?
>
> http://daringfireball.net/2007/07/on_top


Sorry about this, won't happen again, thanks for the tip.

>
>
> On Sat, Jul 13, 2019 at 06:03:02PM +0530, Vaishnav MA wrote:
> > Hi,
> >
> > Thanks a lot for your quick response, the project aims to implement
> support
> > for the Clickboards(load the corresponding kernel driver for the
> clickboard
> > with corresponding parameters) through greybus manifests instead of the
> > existing support via Device Tree overlays(which requires a reboot in
> > Beaglebone when loading a new overlay),  does greybus currently allow to
> > describe devices on I2C, SPI, UART, etc. behind a greybus device?
>
> Yes, of course it describes these devices, but in a way so that the host
> can talk to the device.  The specifics as to how the i2c/spi/uart device
> talks to the "real" hardware on the device side is up to the
> firmware/code in the device.  Greybus does not care at all about that,
> it is merely a transport layer for data that goes across these types of
> hardware busses.
>
> > If not
> > what would be the best way to do it? (going through some of the previous
> > discussions on the maiing list I saw suggestions regarding adding Device
> > Tree Support, if it is feasible could you please elaborate on how it can
> be
> > implemented so that I can try to do it.)
>
> Is Linux running on the "device" side?  I don't know what a Clickboard
> is, nor how they work at all, sorry.  You can look at the firmware that
> was written for many greybus devices using NuttX in the github repos if
> you want examples of how to handle this on the device side.  Perhaps
> that is the piece you are missing?
>

tl;dr: the idea of the project is to bind a kernel driver for an existing
I2C/SPI chip to an I2C/SPI greybus device

No on the device side, Linux is not running, Click Boards are simply add-on
modules(sensors, OLED displays, transceivers ..) which use SPI, I2C or UART
to communicate with the Beaglebone and Kernel Drivers exist for most of
them. The idea of the project is to attach these devices to already
existing kernel drivers through greybus(so as to provide partial hot-plug
support; currently support through Device Tree overlay on Beaglebone
require a reboot whenever a new overlay for a new click board is added).
For this, I am making use of the Greybus Simulator Project (
https://github.com/projectara/gbsim) on the Beaglebone Backend and I am
able to add support for some of the I2C and SPI Click Boards with simple
SPI/I2C interfaces(no Interrupts or other extra platform data).

 For example, for SPI based devices I am passing the Driver name to
Greybus(via a modified Greybus Simulator Manifest)  through the .modalias
property which is being sent to the spi_new_device call in greybus
<https://github.com/beagleboard/linux/blob/f45281297c419d29df9bedbb9d1eaeb12fd2b93b/drivers/staging/greybus/spilib.c#L475>
,
however, since additional platform_data
<https://linuxtv.org/downloads/v4l-dvb-internals/device-drivers/API-struct-spi-board-info.html>
is not being considered in greybus, support for devices(Click Boards) with
Interrupt/Reset or other requirements cannot be implemented in this way.
Can you recommend the best way to bind an existing Kernel Driver for an
I2C/SPI chip for a Generic SPI/I2C based device(with interrupts and other
platform specific data).

quoting a discussion between you and Rob H (source:
https://lists.gt.net/linux/kernel/2526400 ),

> There's also things that never got solved. Like how do you describe
> > devices on I2C, SPI, UART, etc. behind a greybus device? The plan was
> > to use DT overlays, but that was never solved and brings a whole set
> > of problems to solve upstream.
>
> That is only an issue if you want to bind a kernel driver for an
> existing i2c/spi chip to an i2c/spi greybus device. With the code we
> have today, we do it for a specific SPI chip (for firmware download),
> but rely on everything to be userspace-only accesses to make it simpler
> at this point in time.
>
> When DT overlays get more settled down, yes, I want to revisit this idea
> of how to do it for greybus devices, but that's a long-term goal and is
> not required at all right now to have a working system and devices.
>
> thanks,
>
> greg k-h
>

I believe this is what I am trying to achieve, I understand that a custom
firmware/userspace program for each device will work through Greybus, but
the idea of the project was to bind an existing kernel driver to the device.


>
> thanks,
>
> greg k-h
>

Thanks a lot for your valuable time,

Vaishnav M A

--0000000000004d7645058d954610
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><div dir=3D"ltr">On Sat, Jul 13=
, 2019 at 9:18 PM Greg KH &lt;<a href=3D"mailto:gregkh@linuxfoundation.org"=
>gregkh@linuxfoundation.org</a>&gt; wrote:<br></div><div class=3D"gmail_quo=
te"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
A: Because it messes up the order in which people normally read text.<br>
Q: Why is top-posting such a bad thing?<br>
A: Top-posting.<br>
Q: What is the most annoying thing in e-mail?<br>
<br>
A: No.<br>
Q: Should I include quotations after my reply?<br>
<br>
<a href=3D"http://daringfireball.net/2007/07/on_top" rel=3D"noreferrer" tar=
get=3D"_blank">http://daringfireball.net/2007/07/on_top</a></blockquote><di=
v><br></div><div>Sorry about this, won&#39;t happen=C2=A0again, thanks for =
the tip.</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
On Sat, Jul 13, 2019 at 06:03:02PM +0530, Vaishnav MA wrote:<br>
&gt; Hi,<br>
&gt; <br>
&gt; Thanks a lot for your quick response, the project aims to implement su=
pport<br>
&gt; for the Clickboards(load the corresponding kernel driver for the click=
board<br>
&gt; with corresponding parameters) through greybus manifests instead of th=
e<br>
&gt; existing support via Device Tree overlays(which requires a reboot in<b=
r>
&gt; Beaglebone when loading a new overlay),=C2=A0 does greybus currently a=
llow to<br>
&gt; describe devices on I2C, SPI, UART, etc. behind a greybus device?<br>
<br>
Yes, of course it describes these devices, but in a way so that the host<br=
>
can talk to the device.=C2=A0 The specifics as to how the i2c/spi/uart devi=
ce<br>
talks to the &quot;real&quot; hardware on the device side is up to the<br>
firmware/code in the device.=C2=A0 Greybus does not care at all about that,=
<br>
it is merely a transport layer for data that goes across these types of<br>
hardware busses.<br>
<br>
&gt; If not<br>
&gt; what would be the best way to do it? (going through some of the previo=
us<br>
&gt; discussions on the maiing list I saw suggestions regarding adding Devi=
ce<br>
&gt; Tree Support, if it is feasible could you please elaborate on how it c=
an be<br>
&gt; implemented so that I can try to do it.)<br>
<br>
Is Linux running on the &quot;device&quot; side?=C2=A0 I don&#39;t know wha=
t a Clickboard<br>
is, nor how they work at all, sorry.=C2=A0 You can look at the firmware tha=
t<br>
was written for many greybus devices using NuttX in the github repos if<br>
you want examples of how to handle this on the device side.=C2=A0 Perhaps<b=
r>
that is the piece you are missing?<br></blockquote><div><br></div><div>tl;d=
r: the idea of the project is to bind a kernel driver for an existing I2C/S=
PI chip to an I2C/SPI greybus device</div><div><br></div><div>No on the dev=
ice side, Linux is not running, Click Boards are simply add-on modules(sens=
ors, OLED displays, transceivers ..) which use SPI, I2C or UART to communic=
ate with the Beaglebone and Kernel Drivers exist for most of them. The idea=
 of the project is to attach these devices to already existing kernel drive=
rs through greybus(so as to provide partial hot-plug support; currently sup=
port through Device Tree overlay on Beaglebone require a reboot whenever a =
new overlay for a new click board is added). For this, I am making use of t=
he Greybus Simulator Project (<a href=3D"https://github.com/projectara/gbsi=
m">https://github.com/projectara/gbsim</a>) on the Beaglebone Backend and I=
 am able to add support for some of the I2C and SPI Click Boards with simpl=
e SPI/I2C interfaces(no Interrupts or other extra platform data).</div><div=
><br></div><div>=C2=A0For example, for SPI based devices I am passing the D=
river name to Greybus(via a modified Greybus Simulator Manifest)=C2=A0 thro=
ugh the .modalias property which is being sent to the spi_new_device call i=
n <a href=3D"https://github.com/beagleboard/linux/blob/f45281297c419d29df9b=
edbb9d1eaeb12fd2b93b/drivers/staging/greybus/spilib.c#L475">greybus</a>=C2=
=A0, however, since additional <a href=3D"https://linuxtv.org/downloads/v4l=
-dvb-internals/device-drivers/API-struct-spi-board-info.html">platform_data=
</a> is not being considered in greybus, support for devices(Click Boards) =
with Interrupt/Reset or other requirements cannot be implemented in this wa=
y. Can you recommend the best way to bind an existing Kernel Driver for an =
I2C/SPI chip for a Generic SPI/I2C based device(with interrupts and other p=
latform specific data).</div><div><br></div><div>quoting a discussion betwe=
en you and Rob H (source:=C2=A0<a href=3D"https://lists.gt.net/linux/kernel=
/2526400">https://lists.gt.net/linux/kernel/2526400</a>=C2=A0),=C2=A0</div>=
<div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">&gt; There=
&#39;s also things that never got solved. Like how do you describe <br>&gt;=
 devices on I2C, SPI, UART, etc. behind a greybus device? The plan was <br>=
&gt; to use DT overlays, but that was never solved and brings a whole set <=
br>&gt; of problems to solve upstream. <br><br>That is only an issue if you=
 want to bind a kernel driver for an <br>existing i2c/spi chip to an i2c/sp=
i greybus device. With the code we <br>have today, we do it for a specific =
SPI chip (for firmware download), <br>but rely on everything to be userspac=
e-only accesses to make it simpler <br>at this point in time. <br><br>When =
DT overlays get more settled down, yes, I want to revisit this idea <br>of =
how to do it for greybus devices, but that&#39;s a long-term goal and is <b=
r>not required at all right now to have a working system and devices. <br><=
br>thanks, <br><br>greg k-h<br></blockquote><div><br></div><div>I believe t=
his is what I am trying to achieve, I understand that a custom firmware/use=
rspace program for each device will work through Greybus, but the idea of t=
he project was to bind an existing kernel driver to the device.</div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
thanks,<br>
<br>
greg k-h<br></blockquote><div><br></div><div>Thanks a lot for your valuable=
 time,</div><div><br></div><div>Vaishnav M A=C2=A0</div></div></div>

--0000000000004d7645058d954610--

--===============7878811117800564148==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1k
ZXYgbWFpbGluZyBsaXN0CmdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKaHR0cHM6Ly9saXN0
cy5saW5hcm8ub3JnL21haWxtYW4vbGlzdGluZm8vZ3JleWJ1cy1kZXYK

--===============7878811117800564148==--
