Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 892FA39292D
	for <lists+greybus-dev@lfdr.de>; Thu, 27 May 2021 10:03:42 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 3D2FB60AC6
	for <lists+greybus-dev@lfdr.de>; Thu, 27 May 2021 08:03:41 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id C545960B67; Thu, 27 May 2021 08:03:40 +0000 (UTC)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id D8C0D60ADB;
	Thu, 27 May 2021 08:03:37 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 7471960A85
 for <greybus-dev@lists.linaro.org>; Thu, 27 May 2021 08:03:36 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 709C060AC6; Thu, 27 May 2021 08:03:36 +0000 (UTC)
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com
 [209.85.166.182])
 by lists.linaro.org (Postfix) with ESMTPS id 6BB5C60A85
 for <greybus-dev@lists.linaro.org>; Thu, 27 May 2021 08:03:34 +0000 (UTC)
Received: by mail-il1-f182.google.com with SMTP id z1so3378760ils.0
 for <greybus-dev@lists.linaro.org>; Thu, 27 May 2021 01:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=makerville-io.20150623.gappssmtp.com; s=20150623;
 h=mime-version:from:date:message-id:subject:to;
 bh=FIpeq13I4YjP8S7WMcSqp745DghYqYa3A/0TmmliNSw=;
 b=oubRRiG9zh7VcZ3K2MDHXi/07VNok+N8kH7r/Gixxy3nYd5BXlfxBVy3yNLKIR45Ml
 fZkhSizd7fN9kL6pCyiWrWp+iaWkg3fnvrgKrOys+nY4cNYSVYdChQT4nW+hJcH8j+bz
 aPFIC01PHdFvXFsN2v0yA1YXasfImIhMaJnzXQmFm0SM6i3hND0FKQ9ZiAXYtowBHTwd
 DWnpZmNBxQTqXGfpOL0DI3RnrU94HH4UbBnKF4Qyo9fIu9gUBmoQJiM4RlMAkkcfCNou
 GMWBcm7pmHLvR2A0Yi0k8t8xMoC8/flEcovoUzrEMxm2pnGIU+5SqeeUDmA20DBmr5Ss
 mXWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=FIpeq13I4YjP8S7WMcSqp745DghYqYa3A/0TmmliNSw=;
 b=o78l8LVV+woBl4Imon4NaDhwpiMaTbessBXC65oAB9Phci/oYZ+B1Ehs7uvk3NT3t1
 NR8thPVAjNxsUYjE0Ud9iD6gSSH5m2Gpip9mmBgH5Usur38MIEnH8TLS26PTSEVf2WvO
 c+SlHABY8u9jzI8DBi2mK3K5gEAPzcvhOlkEd1yfsj44eLf5Wi9c7Os6cDHVk4LOzgbD
 iryHVHdSPAWraGOefNQwmsyh/lBqVgqtAqb3aes7Z8ZG+rMtm8tgcpApRZXDR2L6L3dF
 doPu33xVhCrGJPVOlGzynY4Gqd3FCpnyAkiSBghXEQYANGmI+T5YoDCkmDYz05RrSCLS
 oB+w==
X-Gm-Message-State: AOAM532mZKjWP9/bWK+mQl45RD8HsgZ31edZw+0msTLB5piM92H5Za1p
 nirB9/VUeqwbT+eEsIcimgUsCLviDKpgc5qTFLB6Yuu15HahIg==
X-Google-Smtp-Source: ABdhPJw7aLwFSm5rPZcPmriXg1Eu1F6vEeVlFdfHb5xdohEzpxoG/fvcmYYcKBq5BseDC+3UOeW1z9/KjqplFgeZjy8=
X-Received: by 2002:a05:6e02:f10:: with SMTP id
 x16mr1928706ilj.65.1622102613621; 
 Thu, 27 May 2021 01:03:33 -0700 (PDT)
MIME-Version: 1.0
From: Anuj Deshpande <anuj@makerville.io>
Date: Thu, 27 May 2021 13:32:57 +0530
Message-ID: <CA+5xZ=RwozcYBrQaCgkTuah8e=UDnw9cmFMkkEYmCK8jC+QbOA@mail.gmail.com>
To: greybus-dev@lists.linaro.org
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: [greybus-dev] Support for ADC
X-BeenThere: greybus-dev@lists.linaro.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
List-Unsubscribe: <https://lists.linaro.org/mailman/options/greybus-dev>,
 <mailto:greybus-dev-request@lists.linaro.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/greybus-dev/>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Subscribe: <https://lists.linaro.org/mailman/listinfo/greybus-dev>,
 <mailto:greybus-dev-request@lists.linaro.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0145783596966754816=="
Errors-To: greybus-dev-bounces@lists.linaro.org
Sender: "greybus-dev" <greybus-dev-bounces@lists.linaro.org>
X-Virus-Scanned: ClamAV using ClamSMTP

--===============0145783596966754816==
Content-Type: multipart/alternative; boundary="0000000000001313aa05c34b3214"

--0000000000001313aa05c34b3214
Content-Type: text/plain; charset="UTF-8"

Hi

I was looking at the Zephyr for Greybus
<https://github.com/cfriedt/greybus-for-zephyr/> work, and realized that
the actual spec for greybus doesn't actually have support for ADC. My
usecase is to use the ADCs on an attached microcontroller as if they are
native ADCs on a Linux machine.

I understand this is more complicated than it looks - because unlike a
GPIO, or I2C, there's no such thing as a native ADC for the Linux side of
things. Have I understood that correctly?

I stumbled into the IIO subsystem for such requirements where there's some
analog sensor that would need to be read - but that would not work through
a microcontroller like my use case.

If one were to look at adding such support, what would they need? Is this
something that's been discussed before? Would love to understand this a bit
more, and potentially contribute.

--0000000000001313aa05c34b3214
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi</div><div><br></div><div></div><div>I was looking =
at the <a href=3D"https://github.com/cfriedt/greybus-for-zephyr/">Zephyr fo=
r Greybus</a> work, and realized that the actual spec for greybus doesn&#39=
;t actually have support for ADC. My usecase is to use the ADCs on an attac=
hed microcontroller as if they are native ADCs on a Linux machine.</div><di=
v><br></div><div>I understand this is more complicated than it looks - beca=
use unlike a GPIO, or I2C, there&#39;s no such thing as a native ADC for th=
e Linux side of things. Have I understood that correctly?</div><div><br></d=
iv><div>I stumbled into the IIO subsystem for such requirements where there=
&#39;s some analog sensor that would need to be read - but that would not w=
ork through a microcontroller like my use case.<br></div><div><br></div><di=
v>If one were to look at adding such support, what would they need? Is this=
 something that&#39;s been discussed before? Would love to understand this =
a bit more, and potentially contribute.<br></div></div>

--0000000000001313aa05c34b3214--

--===============0145783596966754816==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
greybus-dev mailing list
greybus-dev@lists.linaro.org
https://lists.linaro.org/mailman/listinfo/greybus-dev

--===============0145783596966754816==--
