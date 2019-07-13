Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF9167A21
	for <lists+greybus-dev@lfdr.de>; Sat, 13 Jul 2019 14:35:43 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id E98C961828
	for <lists+greybus-dev@lfdr.de>; Sat, 13 Jul 2019 12:35:41 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id D81E561868; Sat, 13 Jul 2019 12:35:41 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
	ip-10-150-125-211.ec2.internal
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FROM,HTML_MESSAGE,MAILING_LIST_MULTI,RCVD_IN_DNSWL_NONE
	autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id B7C9C61877;
	Sat, 13 Jul 2019 12:35:22 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id C57046105C
 for <greybus-dev@lists.linaro.org>; Sat, 13 Jul 2019 12:35:19 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id AF83D61868; Sat, 13 Jul 2019 12:35:19 +0000 (UTC)
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
 [209.85.166.66])
 by lists.linaro.org (Postfix) with ESMTPS id 4DBC76105C
 for <greybus-dev@lists.linaro.org>; Sat, 13 Jul 2019 12:35:18 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id o9so26318536iom.3
 for <greybus-dev@lists.linaro.org>; Sat, 13 Jul 2019 05:35:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HrshEvRqkK1H/9AFPT5j2pcNyt78aPj642ONdeI6+8c=;
 b=EBfXiADmrcwAiQmaZhy26WH7+Q6yJrV+ZfdRNPzKUk+aVcww1bekJkwYCoC2Ujkqgt
 L3k2H4M6837Dbr90ORbArbTwGMuJiWcs70PXQNG23OMDAjNwP9P6f5csmV2vuyMYrPm6
 DvYOGa7AqAy6Rc5zepIIjcLhHFGpxTCrJ/5etwlVv46zGvOA+5vMTFqpjdhaGohx+RJi
 +f/Z73hdgs+A2Cwwl0lbnZZX9u9p+XB/pjuGVwibrwEeZEHfSYzzNh4hB7H4ZfI54rLC
 Y3Kv16wz/md89y7g1pNgDJs8U1kXjy8d+5naYL/gMKVKTwOegm2JNKlEKG92NKdWGnLi
 zMpw==
X-Gm-Message-State: APjAAAX5uB4Mo9hKTvW+sfuyvf0XROd7tOvg+xRDofUtXEezoAr40gCV
 V0AmORkQg0EuGFsbNCw7v/PY/V6E9tG+iXVbPqbRmo3uAX0=
X-Google-Smtp-Source: APXvYqwK04W+gVKpkLj2jLNyNgHzcyEhics3sdbuTPbDjTQf1+Wq2TfD0vgt7JbYXB+JtYL2yI2QHrqK/w/KrtR0+mY=
X-Received: by 2002:a02:c519:: with SMTP id s25mr16546019jam.11.1563021317407; 
 Sat, 13 Jul 2019 05:35:17 -0700 (PDT)
MIME-Version: 1.0
References: <CAFPGqosrnQmroLFRmTRNCYyqdQXnhBhJuCLo=WMphs60KvhKZQ@mail.gmail.com>
 <20190706085603.GE9955@kroah.com>
In-Reply-To: <20190706085603.GE9955@kroah.com>
From: Vaishnav MA <mavaishnav007@gmail.com>
Date: Sat, 13 Jul 2019 18:03:02 +0530
Message-ID: <CAFPGqovJPQFNSYtiYyZAEkpOe2C53cifZ7Yaei_GUWKNErVz7w@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="===============3119905113976302185=="
Errors-To: greybus-dev-bounces@lists.linaro.org
Sender: "greybus-dev" <greybus-dev-bounces@lists.linaro.org>
X-Virus-Scanned: ClamAV using ClamSMTP

--===============3119905113976302185==
Content-Type: multipart/alternative; boundary="00000000000066895b058d8f426b"

--00000000000066895b058d8f426b
Content-Type: text/plain; charset="UTF-8"

Hi,

Thanks a lot for your quick response, the project aims to implement support
for the Clickboards(load the corresponding kernel driver for the clickboard
with corresponding parameters) through greybus manifests instead of the
existing support via Device Tree overlays(which requires a reboot in
Beaglebone when loading a new overlay),  does greybus currently allow to
describe devices on I2C, SPI, UART, etc. behind a greybus device? If not
what would be the best way to do it? (going through some of the previous
discussions on the maiing list I saw suggestions regarding adding Device
Tree Support, if it is feasible could you please elaborate on how it can be
implemented so that I can try to do it.)

Thanks and Regards

Vaishnav M A
GSoC '19 Student Under Beagleboard.org

On Sat, Jul 6, 2019 at 2:26 PM Greg KH <gregkh@linuxfoundation.org> wrote:

> On Thu, Jul 04, 2019 at 01:16:48AM +0530, Vaishnav MA wrote:
> > Hi,
> >
> > I have been working on the Google Summer of Code Project : Click Board
> > Support through Greybus
> > <https://summerofcode.withgoogle.com/projects/#5996499987595264> , which
> > aims to bring in support for MikroElektronika Click Boards
> > <https://www.mikroe.com/click> through Greybus Simulator
> > <https://github.com/projectara/gbsim> , I was able to set up and bring
> in
> > support for some of the Click boards through Greybus Simulator and
> passing
> > the properties related to the Click Board device driver manipulating the
> > product string and vendor string properties in the manifest, however I am
> > stuck now as some of the click boards require additional platform
> data(like
> > Reset Pin, Interrupts..etc) passed to the spi_new_device/i2c_new_device
> > calls, does Greybus allow passing of these parameters to the driver, if
> so
> > can someone guide me with the documentation for the same or point me a
> > suitable example so that I can implement the solution in the project.
>
> Greybus does support passing some of those options to the device, but I
> don't see how reset pin and interrupts matter from the host side of
> things here.  Why do they need to be passed to the greybus host?  Aren't
> they specific to the greybus "device" in how it actually turns those
> greybus messages into specific commands to the real hardware?
>
> You "know" the interrupt and reset pin and those attributes on the
> device, and use that for when you need to talk to the real hardware
> device.  Greybus is just a transfer layer of a generic SPI/I2C message
> to the device itself.
>
> Does that help any?
>
> >  If greybus doesn't allow for passing these parameters what would be the
> > ideal way to bring in support for these click boards(which mostly uses
> > SPI/I2C interfaces) through the greybus subsystem?.
>
> Just create a new greybus device for each board and you should be fine.
>
> thanks,
>
> greg k-h
>

--00000000000066895b058d8f426b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>Thanks a lot for your quick=C2=A0re=
sponse, the project aims to implement support for the Clickboards(load the =
corresponding kernel driver for the clickboard with corresponding parameter=
s) through greybus manifests instead of the existing support via Device Tre=
e overlays(which requires a reboot in Beaglebone when loading a new overlay=
),=C2=A0 does greybus currently allow to describe devices on I2C, SPI, UART=
, etc. behind a greybus device? If not what would be the best way to do it?=
 (going through some of the previous discussions on the maiing list I saw s=
uggestions regarding adding Device Tree Support, if it is feasible could yo=
u please elaborate on how it can be implemented so that I can try to do it.=
)</div><div><br></div><div><div>Thanks and Regards</div><div><br></div><div=
>Vaishnav M A</div><div>GSoC &#39;19 Student Under Beagleboard.org</div></d=
iv></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_att=
r">On Sat, Jul 6, 2019 at 2:26 PM Greg KH &lt;<a href=3D"mailto:gregkh@linu=
xfoundation.org" target=3D"_blank">gregkh@linuxfoundation.org</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Thu, Jul 04=
, 2019 at 01:16:48AM +0530, Vaishnav MA wrote:<br>
&gt; Hi,<br>
&gt; <br>
&gt; I have been working on the Google Summer of Code Project : Click Board=
<br>
&gt; Support through Greybus<br>
&gt; &lt;<a href=3D"https://summerofcode.withgoogle.com/projects/#599649998=
7595264" rel=3D"noreferrer" target=3D"_blank">https://summerofcode.withgoog=
le.com/projects/#5996499987595264</a>&gt; , which<br>
&gt; aims to bring in support for MikroElektronika Click Boards<br>
&gt; &lt;<a href=3D"https://www.mikroe.com/click" rel=3D"noreferrer" target=
=3D"_blank">https://www.mikroe.com/click</a>&gt; through Greybus Simulator<=
br>
&gt; &lt;<a href=3D"https://github.com/projectara/gbsim" rel=3D"noreferrer"=
 target=3D"_blank">https://github.com/projectara/gbsim</a>&gt; , I was able=
 to set up and bring in<br>
&gt; support for some of the Click boards through Greybus Simulator and pas=
sing<br>
&gt; the properties related to the Click Board device driver manipulating t=
he<br>
&gt; product string and vendor string properties in the manifest, however I=
 am<br>
&gt; stuck now as some of the click boards require additional platform data=
(like<br>
&gt; Reset Pin, Interrupts..etc) passed to the spi_new_device/i2c_new_devic=
e<br>
&gt; calls, does Greybus allow passing of these parameters to the driver, i=
f so<br>
&gt; can someone guide me with the documentation for the same or point me a=
<br>
&gt; suitable example so that I can implement the solution in the project.<=
br>
<br>
Greybus does support passing some of those options to the device, but I<br>
don&#39;t see how reset pin and interrupts matter from the host side of<br>
things here.=C2=A0 Why do they need to be passed to the greybus host?=C2=A0=
 Aren&#39;t<br>
they specific to the greybus &quot;device&quot; in how it actually turns th=
ose<br>
greybus messages into specific commands to the real hardware?<br>
<br>
You &quot;know&quot; the interrupt and reset pin and those attributes on th=
e<br>
device, and use that for when you need to talk to the real hardware<br>
device.=C2=A0 Greybus is just a transfer layer of a generic SPI/I2C message=
<br>
to the device itself.<br>
<br>
Does that help any?<br>
<br>
&gt;=C2=A0 If greybus doesn&#39;t allow for passing these parameters what w=
ould be the<br>
&gt; ideal way to bring in support for these click boards(which mostly uses=
<br>
&gt; SPI/I2C interfaces) through the greybus subsystem?.<br>
<br>
Just create a new greybus device for each board and you should be fine.<br>
<br>
thanks,<br>
<br>
greg k-h<br>
</blockquote></div>

--00000000000066895b058d8f426b--

--===============3119905113976302185==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1k
ZXYgbWFpbGluZyBsaXN0CmdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKaHR0cHM6Ly9saXN0
cy5saW5hcm8ub3JnL21haWxtYW4vbGlzdGluZm8vZ3JleWJ1cy1kZXYK

--===============3119905113976302185==--
