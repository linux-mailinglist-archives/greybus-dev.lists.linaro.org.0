Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id E07062299D7
	for <lists+greybus-dev@lfdr.de>; Wed, 22 Jul 2020 16:13:05 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 0AE7C66558
	for <lists+greybus-dev@lfdr.de>; Wed, 22 Jul 2020 14:13:05 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id F2802665AA; Wed, 22 Jul 2020 14:13:04 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FROM,HTML_MESSAGE,MAILING_LIST_MULTI,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 45290665A5;
	Wed, 22 Jul 2020 14:12:53 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id CDF6661873
 for <greybus-dev@lists.linaro.org>; Wed, 22 Jul 2020 14:12:50 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id BA27766588; Wed, 22 Jul 2020 14:12:50 +0000 (UTC)
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com
 [209.85.166.53])
 by lists.linaro.org (Postfix) with ESMTPS id D137061873
 for <greybus-dev@lists.linaro.org>; Wed, 22 Jul 2020 14:12:49 +0000 (UTC)
Received: by mail-io1-f53.google.com with SMTP id a12so2656393ion.13
 for <greybus-dev@lists.linaro.org>; Wed, 22 Jul 2020 07:12:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BsnWUBPplZ8tberLbTz983FuMga03HdGVe7+IrBBcjY=;
 b=EFXbW0wgmD+HE/CW4Sx+bO4LUMISBHj0DQtJ+P3ht5oVsGpiv5HJJH80WCnxg6ybXa
 CJoAJ27ayiowdzYLiHEEwVPIBRHDR26P+VFAgo4SPpQkt+FWkKTu/oL+lZRkvNZmIXlN
 P6gXMj1ARjAXLiydf9jJSIjpAbg9JtNheximUdZDDxaHQWVFZwTY3Xcx15OfYlNaN93/
 KketFiRkVOZLKS2499XGymAmL2dnB+qezOYPHlYCmmsYfJy8KpgpMssmPYBlm2qft8OW
 hMMTUNpwJMakGpcx5iqPQXdaKCpida1H7t4U3ydN2TVyDxfPt6+Ro69tQ6DE/HuccBi5
 XlQA==
X-Gm-Message-State: AOAM531Odaw5b2LZwNxtThtXrIYwngQgNB5pvH2oOXO678pGvJpYoMrZ
 fFEz9D0CWuFFq24hgYvlnU0mOgJFd8iH12C97yI=
X-Google-Smtp-Source: ABdhPJxYVwr0eQ+3oop8WpXRMPPt9noe48bFFSyNWXCQjBbSGEhh/83Sz5pJRFq/3fFXEtUovo06mk9Xr01CZrgF/KY=
X-Received: by 2002:a02:b81a:: with SMTP id o26mr36161792jam.41.1595427169191; 
 Wed, 22 Jul 2020 07:12:49 -0700 (PDT)
MIME-Version: 1.0
References: <CAF4BF-SDCA3Q1n0h9y4cxjFHAHEO4q1E8xPeZP3XQR-7501mVA@mail.gmail.com>
 <797f68c2-4e40-81ab-3adb-27a37dd8d502@linaro.org>
 <CAK8RMs1ZPaczzFWiPnt6g=YMH6F7GE3PJtHrt4XDfpa_f_ArvQ@mail.gmail.com>
 <20200722140754.GA3755463@kroah.com>
In-Reply-To: <20200722140754.GA3755463@kroah.com>
From: Christopher Friedt <chrisfriedt@gmail.com>
Date: Wed, 22 Jul 2020 10:12:36 -0400
Message-ID: <CAF4BF-Sk_VOx7FzUWtCZisV54gGXvmvgo6rf_2F=Wm5dYXO88Q@mail.gmail.com>
To: Greg KH <greg@kroah.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: greybus-dev@lists.linaro.org, Alex Elder <elder@linaro.org>
Subject: Re: [greybus-dev] PR for examples manifests
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
Content-Type: multipart/mixed; boundary="===============7482304747418565611=="
Errors-To: greybus-dev-bounces@lists.linaro.org
Sender: "greybus-dev" <greybus-dev-bounces@lists.linaro.org>
X-Virus-Scanned: ClamAV using ClamSMTP

--===============7482304747418565611==
Content-Type: multipart/alternative; boundary="000000000000af48e305ab085547"

--000000000000af48e305ab085547
Content-Type: text/plain; charset="UTF-8"

On Wed., Jul. 22, 2020, 10:08 a.m. Greg KH, <greg@kroah.com> wrote:

> Many of us can put this on kernel.org as we have personal accounts, but
> then we miss the "drive-by" github contributions like this, right?
>

Thanks Greg ;-)

>

--000000000000af48e305ab085547
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Wed., Jul. 22, 2020, 10:08 a.m. Greg KH, &lt;<a hre=
f=3D"mailto:greg@kroah.com">greg@kroah.com</a>&gt; wrote:</div><blockquote =
class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid=
;padding-left:1ex">
Many of us can put this on <a href=3D"http://kernel.org" rel=3D"noreferrer =
noreferrer" target=3D"_blank">kernel.org</a> as we have personal accounts, =
but<br>
then we miss the &quot;drive-by&quot; github contributions like this, right=
?<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto"=
>Thanks Greg ;-)</div><div dir=3D"auto"><div class=3D"gmail_quote"><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc s=
olid;padding-left:1ex">
</blockquote></div></div></div>

--000000000000af48e305ab085547--

--===============7482304747418565611==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1k
ZXYgbWFpbGluZyBsaXN0CmdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKaHR0cHM6Ly9saXN0
cy5saW5hcm8ub3JnL21haWxtYW4vbGlzdGluZm8vZ3JleWJ1cy1kZXYK

--===============7482304747418565611==--
