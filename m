Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 00FB91A2EAE
	for <lists+greybus-dev@lfdr.de>; Thu,  9 Apr 2020 07:05:12 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 7BEB066460
	for <lists+greybus-dev@lfdr.de>; Thu,  9 Apr 2020 05:05:11 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 6D3C06661F; Thu,  9 Apr 2020 05:05:11 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS autolearn=disabled
	version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 7897F66626;
	Thu,  9 Apr 2020 05:04:54 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 8304166576
 for <greybus-dev@lists.linaro.org>; Wed,  8 Apr 2020 08:55:24 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 77CFE6657F; Wed,  8 Apr 2020 08:55:24 +0000 (UTC)
Received: from w1.tutanota.de (w1.tutanota.de [81.3.6.162])
 by lists.linaro.org (Postfix) with ESMTPS id E0EC266576
 for <greybus-dev@lists.linaro.org>; Wed,  8 Apr 2020 08:55:22 +0000 (UTC)
Received: from w3.tutanota.de (unknown [192.168.1.164])
 by w1.tutanota.de (Postfix) with ESMTP id 1078EFA030D;
 Wed,  8 Apr 2020 08:55:22 +0000 (UTC)
Date: Wed, 8 Apr 2020 10:55:22 +0200 (CEST)
From: zenyu@tuta.io
To: Johan <johan@kernel.org>, Elder <elder@kernel.org>,
 Gregkh <gregkh@linuxfoundation.org>
Message-ID: <M4O-2uM----2@tuta.io>
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Thu, 09 Apr 2020 05:04:53 +0000
Cc: Greybus Dev <greybus-dev@lists.linaro.org>,
 Linux Kernel <linux-kernel@vger.kernel.org>
Subject: [greybus-dev] [PATCH] greybus: fix typos in GREYBUS/GREYBUS_ES2
	help text
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
Content-Type: multipart/mixed; boundary="===============5791757959350524861=="
Errors-To: greybus-dev-bounces@lists.linaro.org
Sender: "greybus-dev" <greybus-dev-bounces@lists.linaro.org>
X-Virus-Scanned: ClamAV using ClamSMTP

--===============5791757959350524861==
Content-Type: multipart/alternative; 
	boundary="----=_Part_301065_91680293.1586336122052"

------=_Part_301065_91680293.1586336122052
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

From: Zenyu Sy <zenyu@tuta.io>

Fix typos ("an" -> "a", "chose" -> "choose") in Kconfig

Signed-off-by: Zenyu Sy <zenyu@tuta.io>
---
base-commit: f5e94d10e4c468357019e5c28d48499f677b284f
Sorry, I just submitted a wrong patch several minutes ago,
so please ignore that one.
drivers/greybus/Kconfig | 6 +++---
1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/greybus/Kconfig b/drivers/greybus/Kconfig
index b84fcaf8b..aeea082f1 100644
--- a/drivers/greybus/Kconfig
+++ b/drivers/greybus/Kconfig
@@ -3,7 +3,7 @@ menuconfig GREYBUS
tristate "Greybus support"
depends on SYSFS
---help---
-=09=C2=A0 This option enables the Greybus driver core.=C2=A0 Greybus is an
+=09=C2=A0 This option enables the Greybus driver core.=C2=A0 Greybus is a
=C2=A0 hardware protocol that was designed to provide Unipro with a
=C2=A0 sane application layer.=C2=A0 It was originally designed for the
=C2=A0 ARA project, a module phone system, but has shown up in other
@@ -12,7 +12,7 @@ menuconfig GREYBUS

=C2=A0 Say Y here to enable support for these types of drivers.

-=09=C2=A0 To compile this code as a module, chose M here: the module
+=09=C2=A0 To compile this code as a module, choose M here: the module
=C2=A0 will be called greybus.ko

if GREYBUS
@@ -25,7 +25,7 @@ config GREYBUS_ES2
=C2=A0 acts as a Greybus "host controller".=C2=A0 This device is a bridge
=C2=A0 from a USB device to a Unipro network.

-=09=C2=A0 To compile this code as a module, chose M here: the module
+=09=C2=A0 To compile this code as a module, choose M here: the module
=C2=A0 will be called gb-es2.ko

endif=09# GREYBUS
--
2.26.0



------=_Part_301065_91680293.1586336122052
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"content-type" content=3D"text/html; charset=3DUTF-8=
">
  </head>
  <body>
<div>From: Zenyu Sy &lt;<a href=3D"mailto:zenyu@tuta.io">zenyu@tuta.io</a>&=
gt;<br></div><div><br></div><div>Fix typos ("an" -&gt; "a", "chose" -&gt; "=
choose") in Kconfig<br></div><div><br></div><div>Signed-off-by: Zenyu Sy &l=
t;<a href=3D"mailto:zenyu@tuta.io">zenyu@tuta.io</a>&gt;<br></div><div>---<=
br></div><div>base-commit: f5e94d10e4c468357019e5c28d48499f677b284f<br></di=
v><div>Sorry, I just submitted a wrong patch several minutes ago,<br></div>=
<div>so please ignore that one.<br></div><div>drivers/greybus/Kconfig | 6 +=
++---<br></div><div>1 file changed, 3 insertions(+), 3 deletions(-)<br></di=
v><div><br></div><div>diff --git a/drivers/greybus/Kconfig b/drivers/greybu=
s/Kconfig<br></div><div>index b84fcaf8b..aeea082f1 100644<br></div><div>---=
 a/drivers/greybus/Kconfig<br></div><div>+++ b/drivers/greybus/Kconfig<br><=
/div><div>@@ -3,7 +3,7 @@ menuconfig GREYBUS<br></div><div>tristate "Greybu=
s support"<br></div><div>depends on SYSFS<br></div><div>---help---<br></div=
><div>-=09&nbsp; This option enables the Greybus driver core.&nbsp; Greybus=
 is an<br></div><div>+=09&nbsp; This option enables the Greybus driver core=
.&nbsp; Greybus is a<br></div><div>&nbsp; hardware protocol that was design=
ed to provide Unipro with a<br></div><div>&nbsp; sane application layer.&nb=
sp; It was originally designed for the<br></div><div>&nbsp; ARA project, a =
module phone system, but has shown up in other<br></div><div>@@ -12,7 +12,7=
 @@ menuconfig GREYBUS<br></div><div><br></div><div>&nbsp; Say Y here to en=
able support for these types of drivers.<br></div><div><br></div><div>-=09&=
nbsp; To compile this code as a module, chose M here: the module<br></div><=
div>+=09&nbsp; To compile this code as a module, choose M here: the module<=
br></div><div>&nbsp; will be called greybus.ko<br></div><div><br></div><div=
>if GREYBUS<br></div><div>@@ -25,7 +25,7 @@ config GREYBUS_ES2<br></div><di=
v>&nbsp; acts as a Greybus "host controller".&nbsp; This device is a bridge=
<br></div><div>&nbsp; from a USB device to a Unipro network.<br></div><div>=
<br></div><div>-=09&nbsp; To compile this code as a module, chose M here: t=
he module<br></div><div>+=09&nbsp; To compile this code as a module, choose=
 M here: the module<br></div><div>&nbsp; will be called gb-es2.ko<br></div>=
<div><br></div><div>endif=09# GREYBUS<br></div><div>--<br></div><div>2.26.0=
<br></div><div><br></div><div><br></div>  </body>
</html>

------=_Part_301065_91680293.1586336122052--

--===============5791757959350524861==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1k
ZXYgbWFpbGluZyBsaXN0CmdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKaHR0cHM6Ly9saXN0
cy5saW5hcm8ub3JnL21haWxtYW4vbGlzdGluZm8vZ3JleWJ1cy1kZXYK

--===============5791757959350524861==--
