Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id AFA452298EC
	for <lists+greybus-dev@lfdr.de>; Wed, 22 Jul 2020 15:04:13 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id C166E665D5
	for <lists+greybus-dev@lfdr.de>; Wed, 22 Jul 2020 13:04:12 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id B4867665E4; Wed, 22 Jul 2020 13:04:12 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE
	autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 1F5C0665D6;
	Wed, 22 Jul 2020 13:03:53 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id AE09A66558
 for <greybus-dev@lists.linaro.org>; Wed, 22 Jul 2020 13:03:49 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 8F90461936; Wed, 22 Jul 2020 13:03:49 +0000 (UTC)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com
 [209.85.222.51])
 by lists.linaro.org (Postfix) with ESMTPS id 54D0D61936
 for <greybus-dev@lists.linaro.org>; Wed, 22 Jul 2020 13:03:48 +0000 (UTC)
Received: by mail-ua1-f51.google.com with SMTP id b24so613860uak.2
 for <greybus-dev@lists.linaro.org>; Wed, 22 Jul 2020 06:03:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1xPleL3HxYWkyadAweS+sXi3lGGqGJeRh0gHS/P2+e8=;
 b=gQ29THoyyeA66IlmmBPW5N15JDSuizYpZD4cw9UPYfHxfry3CexZxCixkEpqcjWK5M
 gdWcf8VRruW6F+8yXXJv6+sqpxTqOn82zB8keVZ44kn/RiUXNcG3ub7k2MbnCDFsyeTE
 gZRd24chO5ziKgmewmdKQUj/bqTUuPhJI5aeld5oH0dylkgS4t/yE7WtyYx98bjYBzV7
 aJKcJU127Bq2n+ekLuKi921qJUymolPiN/B6CqF0n3LXgCeMP88G4ka/Kp6ToYtrYpQX
 mQl27mDHqsumXXzST7pgdL/aDz3n1gGchSfx0kCkRFM0IqxeguSirbSx3V/f+xHk4zqh
 TeXQ==
X-Gm-Message-State: AOAM533vhG31Z6UoCQpnCNe+jWM3eZst386V15OKoBHGg0vEKI2PL2/N
 493yI6IoygRGc2woJXdm+jjMpd3Vi23CSM+41CD+0w==
X-Google-Smtp-Source: ABdhPJxxGdiyQ4IrAZOM2rBm6TBEx5VcFQKY+/X+6ZKRjWpilwljVzKuWTJA6kselvp8PYgPCZs2DLFTndXTuL8cmb4=
X-Received: by 2002:a9f:380e:: with SMTP id p14mr22797734uad.21.1595423027811; 
 Wed, 22 Jul 2020 06:03:47 -0700 (PDT)
MIME-Version: 1.0
References: <CAF4BF-SDCA3Q1n0h9y4cxjFHAHEO4q1E8xPeZP3XQR-7501mVA@mail.gmail.com>
 <797f68c2-4e40-81ab-3adb-27a37dd8d502@linaro.org>
In-Reply-To: <797f68c2-4e40-81ab-3adb-27a37dd8d502@linaro.org>
From: Jason Kridner <jkridner@beagleboard.org>
Date: Wed, 22 Jul 2020 09:03:36 -0400
Message-ID: <CAK8RMs1ZPaczzFWiPnt6g=YMH6F7GE3PJtHrt4XDfpa_f_ArvQ@mail.gmail.com>
To: Alex Elder <elder@linaro.org>
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: greybus-dev@lists.linaro.org
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
Content-Type: multipart/mixed; boundary="===============0694121052525748820=="
Errors-To: greybus-dev-bounces@lists.linaro.org
Sender: "greybus-dev" <greybus-dev-bounces@lists.linaro.org>
X-Virus-Scanned: ClamAV using ClamSMTP

--===============0694121052525748820==
Content-Type: multipart/alternative; boundary="000000000000d6f2c205ab075e3b"

--000000000000d6f2c205ab075e3b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 22, 2020 at 7:38 AM Alex Elder <elder@linaro.org> wrote:

> On 7/8/20 12:08 PM, Christopher Friedt wrote:
> > Hi list,
>
> Christopher, I'm sorry this hasn't received the attention it
> deserves.  To be honest, yours is the first/only pull request on
> this repository since Project Ara shut down, and the status of
> the "projectara" GitHub account is a little fuzzy.  Your request
> has not been forgotten, we're just working out how we'll handle it.
> We might need to re-host the official upstream of "manifesto"
> somewhere else.
>

We have a project at BeagleBoard.org that will make good use of Greybus and
Manifesto. Since Greybus is in the mainline now, I=E2=80=99d suggest hostin=
g on
kernel.org would make sense. Lots of interest here if the remaining
long-term goals of Project Ara can be spelled out and maintainership passed
on.


>
> In any case, this will be reviewed and addressed "soon," and I'm
> sorry for the delay.  If we change anything, we'll announce it
> on the mailing list, and I suppose I'll explain the resolution
> here either way.
>
>                                         -Alex
>
> > I made a PR to GitHub before realizing that it's probably preferred to
> send a patch to the ML.
> >
> > https://github.com/projectara/manifesto/pull/1
> >
> > Patch is attached as well.
> >
> > Is anyone able to  merge the PR or patch?
> >
> > Thanks,
> >
> > C
> >
> > _______________________________________________
> > greybus-dev mailing list
> > greybus-dev@lists.linaro.org
> > https://lists.linaro.org/mailman/listinfo/greybus-dev
> >
>
> _______________________________________________
> greybus-dev mailing list
> greybus-dev@lists.linaro.org
> https://lists.linaro.org/mailman/listinfo/greybus-dev
>


--=20
BeagleBoard.org Foundation is a US-based 501(c)3 non-profit providing
education and collaboration around open source hardware and software

Use https://beagleboard.org/about/jkridner to schedule a meeting

--000000000000d6f2c205ab075e3b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-family:courier new,monospace"><br></div></div><br><div class=3D"gmail_quo=
te"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jul 22, 2020 at 7:38 AM A=
lex Elder &lt;<a href=3D"mailto:elder@linaro.org">elder@linaro.org</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 7/8/20=
 12:08 PM, Christopher Friedt wrote:<br>
&gt; Hi list,<br>
<br>
Christopher, I&#39;m sorry this hasn&#39;t received the attention it<br>
deserves.=C2=A0 To be honest, yours is the first/only pull request on<br>
this repository since Project Ara shut down, and the status of<br>
the &quot;projectara&quot; GitHub account is a little fuzzy.=C2=A0 Your req=
uest<br>
has not been forgotten, we&#39;re just working out how we&#39;ll handle it.=
<br>
We might need to re-host the official upstream of &quot;manifesto&quot;<br>
somewhere else.<br></blockquote><div><br></div><div>We have a project at Be=
agleBoard.org that will make good use of Greybus=20
and Manifesto. Since Greybus is in the mainline now, I=E2=80=99d suggest ho=
sting
 on <a href=3D"http://kernel.org" rel=3D"noreferrer" target=3D"_blank">kern=
el.org</a>
 would make sense. Lots of interest here if the remaining=C2=A0 long-term=
=20
goals of Project Ara can be spelled out and maintainership passed on.</div>=
<div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
In any case, this will be reviewed and addressed &quot;soon,&quot; and I&#3=
9;m<br>
sorry for the delay.=C2=A0 If we change anything, we&#39;ll announce it<br>
on the mailing list, and I suppose I&#39;ll explain the resolution<br>
here either way.<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -Alex<br=
>
<br>
&gt; I made a PR to GitHub before realizing that it&#39;s probably preferre=
d to send a patch to the ML.<br>
&gt; <br>
&gt; <a href=3D"https://github.com/projectara/manifesto/pull/1" rel=3D"nore=
ferrer" target=3D"_blank">https://github.com/projectara/manifesto/pull/1</a=
><br>
&gt; <br>
&gt; Patch is attached as well.<br>
&gt; <br>
&gt; Is anyone able to=C2=A0 merge the PR or patch?<br>
&gt; <br>
&gt; Thanks,<br>
&gt; <br>
&gt; C<br>
&gt; <br>
&gt; _______________________________________________<br>
&gt; greybus-dev mailing list<br>
&gt; <a href=3D"mailto:greybus-dev@lists.linaro.org" target=3D"_blank">grey=
bus-dev@lists.linaro.org</a><br>
&gt; <a href=3D"https://lists.linaro.org/mailman/listinfo/greybus-dev" rel=
=3D"noreferrer" target=3D"_blank">https://lists.linaro.org/mailman/listinfo=
/greybus-dev</a><br>
&gt; <br>
<br>
_______________________________________________<br>
greybus-dev mailing list<br>
<a href=3D"mailto:greybus-dev@lists.linaro.org" target=3D"_blank">greybus-d=
ev@lists.linaro.org</a><br>
<a href=3D"https://lists.linaro.org/mailman/listinfo/greybus-dev" rel=3D"no=
referrer" target=3D"_blank">https://lists.linaro.org/mailman/listinfo/greyb=
us-dev</a><br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature"><div dir=3D"ltr"><div><span style=3D"color:rgb(34,34,34)">B=
eagleBoard.org Foundation is a US-based 501(c)3 non-profit providing educat=
ion and collaboration around open source hardware and software</span><br st=
yle=3D"color:rgb(34,34,34)"></div><div><span style=3D"color:rgb(34,34,34)">=
<br></span></div><div><span style=3D"color:rgb(34,34,34)">Use <a href=3D"ht=
tps://beagleboard.org/about/jkridner" target=3D"_blank">https://beagleboard=
.org/about/jkridner</a> to schedule a meeting</span><span style=3D"color:rg=
b(34,34,34)"><br></span></div><div><span style=3D"color:rgb(34,34,34)"><br>=
</span></div></div></div></div>

--000000000000d6f2c205ab075e3b--

--===============0694121052525748820==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1k
ZXYgbWFpbGluZyBsaXN0CmdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKaHR0cHM6Ly9saXN0
cy5saW5hcm8ub3JnL21haWxtYW4vbGlzdGluZm8vZ3JleWJ1cy1kZXYK

--===============0694121052525748820==--
