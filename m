Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC985ECF5
	for <lists+greybus-dev@lfdr.de>; Wed,  3 Jul 2019 21:49:05 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id DC7D9616DE
	for <lists+greybus-dev@lfdr.de>; Wed,  3 Jul 2019 19:49:04 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id D0C7A61635; Wed,  3 Jul 2019 19:49:04 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
	ip-10-150-125-211.ec2.internal
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FROM,HTML_MESSAGE,MAILING_LIST_MULTI,RCVD_IN_DNSWL_NONE
	autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id CB3AF61655;
	Wed,  3 Jul 2019 19:48:52 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 60CD761613
 for <greybus-dev@lists.linaro.org>; Wed,  3 Jul 2019 19:48:50 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 49B6461636; Wed,  3 Jul 2019 19:48:50 +0000 (UTC)
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com
 [209.85.166.49])
 by lists.linaro.org (Postfix) with ESMTPS id 4463961613
 for <greybus-dev@lists.linaro.org>; Wed,  3 Jul 2019 19:48:49 +0000 (UTC)
Received: by mail-io1-f49.google.com with SMTP id e5so3352293iok.4
 for <greybus-dev@lists.linaro.org>; Wed, 03 Jul 2019 12:48:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=AIGq6ikWB6R4Q9XAw95oHpcXDEzZ5E42+NRVDoMNJWc=;
 b=dSHvbRV7AdQXKgana77E6P5dNwwV8ezsBmYRli2/2ARIPEfAMHxAkyMIIWXORX/Do1
 2JFIN45kNDkder6ZQ+EtmHFOwVOGh8WzQ6ddk/i0w2Qn3DMZ3novYm6zzlZ50lXbH8DA
 CtzNQvL1xOowyir3UVdT1HA9EW1G1IDc4UixwWkOB/emwfXLUqNBPG6xN2o1GO6tkhA5
 J6kaA5FpPh6K4eYipG3YxeoVVj+KT8MaA9VIKSent/2wqrLLsa6fI+arS5773RR0wVYz
 gP+fsuf0MNo4qNPqhIPKeOiGH12eX5rd3tf7EWQXTByJQo9aO2gcBS5oacBsj5i2dhvO
 6KYQ==
X-Gm-Message-State: APjAAAUyOOwOVdD1DQxv4m5wR9ApI1hR3Xhe07PfsoLqLa/4MkMC9x6S
 p1JhKhD+r0A5H8kdYU02uJaySSqpbJwuygmGX+ptrQ==
X-Google-Smtp-Source: APXvYqw2blXYBgZurh59itecahrzgooARLtitCKxxB3Kc3P8HRGTzhj6fhWLgT3BabBVJx73Bo59mOfGx71lvbj9JQk=
X-Received: by 2002:a6b:ba56:: with SMTP id k83mr10189892iof.105.1562183328382; 
 Wed, 03 Jul 2019 12:48:48 -0700 (PDT)
MIME-Version: 1.0
From: Vaishnav MA <mavaishnav007@gmail.com>
Date: Thu, 4 Jul 2019 01:16:48 +0530
Message-ID: <CAFPGqosrnQmroLFRmTRNCYyqdQXnhBhJuCLo=WMphs60KvhKZQ@mail.gmail.com>
To: greybus-dev@lists.linaro.org
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: Jason Kridner <jkridner@gmail.com>, Ravi Kumar Prasad <7ravikp@gmail.com>
Subject: [greybus-dev] Greybus For IoT : Click Board Support on Beaglebone
	Boards
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
Content-Type: multipart/mixed; boundary="===============0092267200715920530=="
Errors-To: greybus-dev-bounces@lists.linaro.org
Sender: "greybus-dev" <greybus-dev-bounces@lists.linaro.org>
X-Virus-Scanned: ClamAV using ClamSMTP

--===============0092267200715920530==
Content-Type: multipart/alternative; boundary="0000000000005cd007058ccc26cf"

--0000000000005cd007058ccc26cf
Content-Type: text/plain; charset="UTF-8"

Hi,

I have been working on the Google Summer of Code Project : Click Board
Support through Greybus
<https://summerofcode.withgoogle.com/projects/#5996499987595264> , which
aims to bring in support for MikroElektronika Click Boards
<https://www.mikroe.com/click> through Greybus Simulator
<https://github.com/projectara/gbsim> , I was able to set up and bring in
support for some of the Click boards through Greybus Simulator and passing
the properties related to the Click Board device driver manipulating the
product string and vendor string properties in the manifest, however I am
stuck now as some of the click boards require additional platform data(like
Reset Pin, Interrupts..etc) passed to the spi_new_device/i2c_new_device
calls, does Greybus allow passing of these parameters to the driver, if so
can someone guide me with the documentation for the same or point me a
suitable example so that I can implement the solution in the project.

 If greybus doesn't allow for passing these parameters what would be the
ideal way to bring in support for these click boards(which mostly uses
SPI/I2C interfaces) through the greybus subsystem?.

Thanks and Regards

Vaishnav M A
GSoC '19 Student Under Beagleboard.org

--0000000000005cd007058ccc26cf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>I have been working on the Google S=
ummer of Code Project :<a href=3D"https://summerofcode.withgoogle.com/proje=
cts/#5996499987595264"> Click Board Support through Greybus=C2=A0</a>=C2=A0=
, which aims to bring in support for <a href=3D"https://www.mikroe.com/clic=
k">MikroElektronika Click Boards</a> through <a href=3D"https://github.com/=
projectara/gbsim">Greybus Simulator</a>=C2=A0, I was able to set up and bri=
ng in support for some of the Click boards through Greybus Simulator and pa=
ssing the properties related to the Click Board device driver manipulating =
the product string and vendor string properties in the manifest, however I =
am stuck now as some of the click boards require additional platform data(l=
ike Reset Pin, Interrupts..etc) passed to the spi_new_device/i2c_new_device=
 calls, does Greybus allow passing of these parameters to the driver, if so=
 can someone guide me with the documentation for the same or point me a sui=
table example so that I can implement the solution in the project.</div><di=
v><br></div><div>=C2=A0If greybus doesn&#39;t allow for passing these param=
eters what would be the ideal way to bring in support for these click board=
s(which mostly uses SPI/I2C interfaces) through the greybus subsystem?.</di=
v><div><br></div><div>Thanks and Regards</div><div><br></div><div>Vaishnav =
M A</div><div>GSoC &#39;19 Student Under Beagleboard.org</div></div>

--0000000000005cd007058ccc26cf--

--===============0092267200715920530==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1k
ZXYgbWFpbGluZyBsaXN0CmdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKaHR0cHM6Ly9saXN0
cy5saW5hcm8ub3JnL21haWxtYW4vbGlzdGluZm8vZ3JleWJ1cy1kZXYK

--===============0092267200715920530==--
