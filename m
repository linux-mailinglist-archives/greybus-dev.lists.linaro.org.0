Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A006705A2
	for <lists+greybus-dev@lfdr.de>; Mon, 22 Jul 2019 18:44:29 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 0FB2960C0E
	for <lists+greybus-dev@lfdr.de>; Mon, 22 Jul 2019 16:44:28 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id E0EE360C13; Mon, 22 Jul 2019 16:44:27 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
	ip-10-150-125-211.ec2.internal
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 3F4FC60BFC;
	Mon, 22 Jul 2019 16:44:12 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 4B5D960BD9
 for <greybus-dev@lists.linaro.org>; Mon, 22 Jul 2019 16:44:10 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 3FA3360BD7; Mon, 22 Jul 2019 16:44:10 +0000 (UTC)
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
 [209.85.221.65])
 by lists.linaro.org (Postfix) with ESMTPS id CBB7D60BD7
 for <greybus-dev@lists.linaro.org>; Mon, 22 Jul 2019 16:44:08 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id c2so36934732wrm.8
 for <greybus-dev@lists.linaro.org>; Mon, 22 Jul 2019 09:44:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6ab9JaOWAjHYAlEazcAjkHsRsvQbIuM7aFdjQpyqMR8=;
 b=L43FpFHkznFCBUFnNU6/3jjuj1KabFZvBpCPiptd3gvZ9ji/7joEkX69x1euVe5za/
 SSRHe/nfGMQtdoXB+tYWsGCX1s+gBDJPoW2V7/Z/n5b3BzdCVM4h4mpm7DScsxFciDPR
 4RVfgtyvz4/MqKOlXtHdVn1YsQDGWBJeHCkMukX3rlqSeMeIS5Bh/9FY1DQIKZrIb9tD
 mGDMrYr64xXOoHwr7uSwFe7VUVFBx0+D1Lxvw+EO4ZeDUxEmlziw3ebilEVwGSPv1KwK
 SGdlLkFjbN2QGY5iV7fDWJH9Dabeb1oCHyjt2NGTzwtjGbDl/3rAopTbDV2A9sgJwWiO
 mpSQ==
X-Gm-Message-State: APjAAAXeUDlm4UAzDF5ebZdEluYHIJPUJS6MDdbpTxT3XCJaI3+SGXgi
 1DcBGopPNCCAY8KH3zDpkR2xRZNLngaWh0+MkPQ=
X-Google-Smtp-Source: APXvYqzLGnG3hZJiXBwWmJ4DKmtTAnSA1AxN91AK8WV6hMz7WoRtxhBgGyZwNsdC3fVPIilehfUTLC2C673Hdkyk1aU=
X-Received: by 2002:adf:f84f:: with SMTP id d15mr74842767wrq.53.1563813847755; 
 Mon, 22 Jul 2019 09:44:07 -0700 (PDT)
MIME-Version: 1.0
References: <CAFPGqosrnQmroLFRmTRNCYyqdQXnhBhJuCLo=WMphs60KvhKZQ@mail.gmail.com>
 <20190706085603.GE9955@kroah.com>
 <CAFPGqovJPQFNSYtiYyZAEkpOe2C53cifZ7Yaei_GUWKNErVz7w@mail.gmail.com>
 <20190713154843.GA12533@kroah.com>
 <CAFPGqov1AbeA16sJLJCWKod6QMqkCigt57sC1n-+FH9-Wxgpvw@mail.gmail.com>
 <20190716192544.GA27918@kroah.com>
 <CA+T6QPnSqhi4Xr+0ooh+Thkd8oQFfH=djZ=NgoWFWE4D=Mz0Jw@mail.gmail.com>
In-Reply-To: <CA+T6QPnSqhi4Xr+0ooh+Thkd8oQFfH=djZ=NgoWFWE4D=Mz0Jw@mail.gmail.com>
From: Jason Kridner <jkridner@beagleboard.org>
Date: Mon, 22 Jul 2019 11:43:54 -0500
Message-ID: <CA+T6QPm5+f2mLqbv3o9yd2S9BvvVD-U9GA-yisXuowhuB6Qijg@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="===============0178109027445243928=="
Errors-To: greybus-dev-bounces@lists.linaro.org
Sender: "greybus-dev" <greybus-dev-bounces@lists.linaro.org>
X-Virus-Scanned: ClamAV using ClamSMTP

--===============0178109027445243928==
Content-Type: multipart/alternative; boundary="000000000000e3f13d058e47c8a8"

--000000000000e3f13d058e47c8a8
Content-Type: text/plain; charset="UTF-8"

On Wed, Jul 17, 2019 at 11:28 AM Jason Kridner <jkridner@beagleboard.org>
wrote:
> On Tue, Jul 16, 2019 at 3:25 PM Greg KH <gregkh@linuxfoundation.org>
wrote:
> > On Sun, Jul 14, 2019 at 01:13:37AM +0530, Vaishnav MA wrote:
> > > > On Sat, Jul 13, 2019 at 06:03:02PM +0530, Vaishnav MA wrote:
>
> I believe there are two problems here to solve:
>
> 1. How do we specify the extra data?

I get that greybus itself shouldn't embed platform data for all the
devices, but I think it only encapsulates the bus transports. Is there a
generic place for the IRQ/RESET/etc. interfaces most all sensors need?

Let's take a random SPI-based IIO sensor as an example, bmg160[1].

I think an approach could be to come up with a generic IIO protocol class
for greybus, rather than an actual protocol class for each sensor we'd
like to use. In this generic IIO protocol class implementation, the extra
platform data could be included using commonly named greybus gpio resources.

Alternatively, a generic mikroBus protocol class for greybus could be
created, assuming all the resources that bus assumes
(GPIO/PWM/SPI/I2C/etc.). Not sure if this is better.

Since Click boards will use a common GPIO for IRQ and the SPI device
structure includes the irq entry[2], it would seem this could be done in at
least a Click-generic way if not an IIO-generic way over greybus.

Of course, drivers that aren't direct usage of SPI (or other provided
buses) interfaces like fbtft_device[3] would still require an additional
driver to provide their platform data, so we'd either need to figure out
how to bury that under a display class or create another driver to provide
platform data for that group of drivers.

Would that be the right track?

>
> 2. For a gbsim implementation, how do we add the translation layer and
build the platform data needed by the drivers?
>

If there's no preference here, would defining a JSON format and dataset to
provide the information to either the gbsim or microcontroller
implementations be something acceptable? YAML? other?

Regards,
Jason

[1]
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/iio/gyro/bmg160_core.c
[2[
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/include/linux/spi/spi.h#n169
[3]
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/staging/fbtft/flexfb.c#n792

--
https://beagleboard.org/about - a 501c3 non-profit educating around open
hardware computing

--000000000000e3f13d058e47c8a8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br>On Wed, Jul 17, 2019 at 11:28 AM Jason Kridner &lt=
;<a href=3D"mailto:jkridner@beagleboard.org">jkridner@beagleboard.org</a>&g=
t; wrote:<br>&gt; On Tue, Jul 16, 2019 at 3:25 PM Greg KH &lt;<a href=3D"ma=
ilto:gregkh@linuxfoundation.org">gregkh@linuxfoundation.org</a>&gt; wrote:<=
br>&gt; &gt; On Sun, Jul 14, 2019 at 01:13:37AM +0530, Vaishnav MA wrote:<b=
r>&gt; &gt; &gt; &gt; On Sat, Jul 13, 2019 at 06:03:02PM +0530, Vaishnav MA=
 wrote:<div>&gt;<br>&gt; I believe there are two problems here to solve:<br=
>&gt;<br>&gt; 1. How do we specify the extra data?</div><div><br></div><div=
>I get that greybus itself shouldn&#39;t embed platform data for all the de=
vices, but I think it only encapsulates the bus transports. Is there a gene=
ric place for the IRQ/RESET/etc. interfaces most all sensors need?</div><di=
v><br></div><div>Let&#39;s take a random SPI-based IIO sensor as an example=
, bmg160[1].</div><div><br></div><div>I think an approach could be to come =
up with a generic IIO protocol class for greybus, rather than an actual pro=
tocol class for each sensor we&#39;d like=C2=A0to use. In this generic IIO =
protocol class implementation, the extra platform data could be included us=
ing commonly named greybus gpio resources.</div><div><br></div><div>Alterna=
tively, a generic mikroBus protocol class for greybus could be created, ass=
uming all the resources that bus assumes (GPIO/PWM/SPI/I2C/etc.). Not sure =
if this is better.</div><div><br></div>Since Click boards will use a common=
 GPIO for IRQ and the SPI device structure includes the irq entry[2], it wo=
uld seem this could be done in at least a Click-generic way if not an IIO-g=
eneric way over greybus.<div><br></div><div>Of course, drivers that aren&#3=
9;t direct usage of SPI (or other provided buses) interfaces like fbtft_dev=
ice[3] would still require an additional driver to provide their platform d=
ata, so we&#39;d either need to figure out how to bury that under a display=
 class or create another driver to provide platform data for that group of =
drivers.</div><div><br></div><div>Would that be the right track?<br><br>&gt=
;<div>&gt; 2. For a gbsim implementation, how do we add the translation lay=
er and build the platform data needed by the drivers?<br>&gt;</div><div><br=
></div><div>If there&#39;s no preference here, would defining a JSON format=
 and dataset to provide the information to either the gbsim or microcontrol=
ler implementations be something acceptable? YAML? other?<br><div><br></div=
><div>Regards,</div><div>Jason</div><div><br></div><div>[1]=C2=A0<a href=3D=
"https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/dr=
ivers/iio/gyro/bmg160_core.c">https://git.kernel.org/pub/scm/linux/kernel/g=
it/torvalds/linux.git/tree/drivers/iio/gyro/bmg160_core.c</a></div><div>[2[=
=C2=A0<a href=3D"https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/l=
inux.git/tree/include/linux/spi/spi.h#n169">https://git.kernel.org/pub/scm/=
linux/kernel/git/torvalds/linux.git/tree/include/linux/spi/spi.h#n169</a></=
div><div>[3]=C2=A0<a href=3D"https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git/tree/drivers/staging/fbtft/flexfb.c#n792">https://git.=
kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/staging=
/fbtft/flexfb.c#n792</a></div><br class=3D"gmail-Apple-interchange-newline"=
>--<br><a href=3D"https://beagleboard.org/about">https://beagleboard.org/ab=
out</a> - a 501c3 non-profit educating around open hardware computing</div>=
</div></div>

--000000000000e3f13d058e47c8a8--

--===============0178109027445243928==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1k
ZXYgbWFpbGluZyBsaXN0CmdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKaHR0cHM6Ly9saXN0
cy5saW5hcm8ub3JnL21haWxtYW4vbGlzdGluZm8vZ3JleWJ1cy1kZXYK

--===============0178109027445243928==--
