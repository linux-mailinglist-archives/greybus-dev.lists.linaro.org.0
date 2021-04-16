Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A6203620A0
	for <lists+greybus-dev@lfdr.de>; Fri, 16 Apr 2021 15:13:51 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 1027B667D2
	for <lists+greybus-dev@lfdr.de>; Fri, 16 Apr 2021 13:13:50 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id F2537667D0; Fri, 16 Apr 2021 13:13:49 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=BAYES_00,HTML_IMAGE_ONLY_12,
	HTML_MESSAGE,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 3E219667CF;
	Fri, 16 Apr 2021 13:13:34 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 92CDB667BD
 for <greybus-dev@lists.linaro.org>; Fri, 16 Apr 2021 13:13:31 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 71B20667CD; Fri, 16 Apr 2021 13:13:31 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by lists.linaro.org (Postfix) with ESMTPS id 4137E667BD
 for <greybus-dev@lists.linaro.org>; Fri, 16 Apr 2021 13:13:30 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id g8so44736737lfv.12
 for <greybus-dev@lists.linaro.org>; Fri, 16 Apr 2021 06:13:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=V42ORV1RlprmEGA0yajxHLACfM/WvV0zGuBg52zcWTY=;
 b=qsa/l0eX5Gxz4tAHZrvc7wVABh8PTDUPjglUwrSWjlAuGiS3Di68m4cX0lGbjBr7fn
 aK8sPLf2/kHVKNH38QCbKBqXWzTpLIgqZheWA348OFwXPXp0FlhFOXTFYhOV4sOwTmeW
 mpFKloyNqWaP8PQ/Qc3wjmuWsxBcP+lFjIJ2REXa1AqeADRLcZFZaE+yDHJCxPjuDEL7
 k1d+AASzwxu1CchmZhf86cxx610r9pOpxlJgptO+hcVhBzbmtfDHo1WUtfW5XuZ6dil+
 csxr9LnZUm6h4cVYOsBIyihsc0/8hZZr5h6KlnWkQGJXAXtvgIb+5cvxqR2GoqyvI2on
 n03g==
X-Gm-Message-State: AOAM531tECb2rz8dFd5/qk50i0TumG2iGrUKE9pzFbM6FjOt08d0tf0E
 rwULPQjoVigOVq+l5bCRuPst9QyOlrsbjt7uwVdeUKhSCz9YiQ==
X-Google-Smtp-Source: ABdhPJwWUl4PBNfED7cCjs2zyXkB7vjSrC3GNePg5j6dNUCY4jbdih4ogaJwdlSSmhIgvhG7uqW+oUgFYn8NAcX9Q2w=
X-Received: by 2002:a05:6512:b8f:: with SMTP id
 b15mr3208705lfv.633.1618578808880; 
 Fri, 16 Apr 2021 06:13:28 -0700 (PDT)
MIME-Version: 1.0
From: Kyle Harding <kyle@balena.io>
Date: Fri, 16 Apr 2021 09:13:18 -0400
Message-ID: <CAMgvH3p9L8D6ZeGbzVqMSahUU-mUL7K1-yijgz+D=B6MYHJjSQ@mail.gmail.com>
To: greybus-dev@lists.linaro.org
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: [greybus-dev] DMA support via gb-netlink and gbridge
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
Content-Type: multipart/mixed; boundary="===============2521576866151488305=="
Errors-To: greybus-dev-bounces@lists.linaro.org
Sender: "greybus-dev" <greybus-dev-bounces@lists.linaro.org>
X-Virus-Scanned: ClamAV using ClamSMTP

--===============2521576866151488305==
Content-Type: multipart/alternative; boundary="000000000000f1ce1505c016be97"

--000000000000f1ce1505c016be97
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hey all, new member here!

As the subject line suggests, our development hardware does not support
UniPro so we were looking at a guest kernel solution with TCP/IP transport
over gbridge.

However, one of the SDIO bus devices is a wifi module that requires DMA. Is
this possible over the current gb-netlink/gbridge to your knowledge?

Cheers,

--=20

*=E2=80=94*

*Kyle Harding*
Embedded Linux Engineer, balena.io

--000000000000f1ce1505c016be97
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hey all, new member here!</div><div><br></div><div>As=
 the subject line suggests, our development hardware does not support UniPr=
o so we were looking at a guest kernel solution with TCP/IP transport over =
gbridge.<br><br></div><div>However, one of the SDIO bus devices is a wifi m=
odule that requires DMA. Is this possible over the current gb-netlink/gbrid=
ge to your knowledge?<br><br></div><div>Cheers,<br></div><div><br>-- <br><d=
iv dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signature"=
><div dir=3D"ltr"><div><br><b><span style=3D"color:rgb(68,68,68)">=E2=80=94=
</span></b></div><div><b><span style=3D"color:rgb(68,68,68)">Kyle Harding<b=
r></span></b></div><div><span style=3D"color:rgb(68,68,68)">Embedded Linux =
Engineer, <a rel=3D"noreferrer nofollow noopener" href=3D"https://balena.io=
/" target=3D"_blank">balena.io</a></span></div><img src=3D"https://docs.goo=
gle.com/uc?export=3Ddownload&amp;id=3D19JQYFfYSOYn9PHCFelyKTbzC2EWiNfQ9&amp=
;revid=3D0B0wyeuOD3Y_rSUFLMGNRMGw5Q2dvUGsvazZoSnQ2NkdBZEFzPQ" width=3D"96" =
height=3D"26"></div></div></div></div>

--000000000000f1ce1505c016be97--

--===============2521576866151488305==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1k
ZXYgbWFpbGluZyBsaXN0CmdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKaHR0cHM6Ly9saXN0
cy5saW5hcm8ub3JnL21haWxtYW4vbGlzdGluZm8vZ3JleWJ1cy1kZXYK

--===============2521576866151488305==--
