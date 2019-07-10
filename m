Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 4805C65029
	for <lists+greybus-dev@lfdr.de>; Thu, 11 Jul 2019 04:30:33 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 5CDB3616F0
	for <lists+greybus-dev@lfdr.de>; Thu, 11 Jul 2019 02:30:32 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 5210361781; Thu, 11 Jul 2019 02:30:32 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
	ip-10-150-125-211.ec2.internal
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DATE_IN_PAST_03_06,
	DKIM_ADSP_CUSTOM_MED,FREEMAIL_FROM,HTML_MESSAGE,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2 autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 8F966617B3;
	Thu, 11 Jul 2019 02:30:08 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id B24CC61591
 for <greybus-dev@lists.linaro.org>; Wed, 10 Jul 2019 17:24:25 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id A144661778; Wed, 10 Jul 2019 17:24:25 +0000 (UTC)
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
 [209.85.222.196])
 by lists.linaro.org (Postfix) with ESMTPS id AB71C61591
 for <greybus-dev@lists.linaro.org>; Wed, 10 Jul 2019 17:24:24 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id a27so2527941qkk.5
 for <greybus-dev@lists.linaro.org>; Wed, 10 Jul 2019 10:24:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kAkVcfzCu105X+rCeudPOX8QY0Ki9acMjFF88hKu5KE=;
 b=EKmveeGS6+FR4N7UfGge/jCXAZM79EOhCCMZ392+igQ3828BzloPmrtoViPJbYuvVZ
 qI7VyestSUpBnFC8RIcfERzmJdr6wV9bhlsrlk6qeBZfwb2SKu5rO0nBz0W6hMcbwGf1
 uD71C9FHfENB6N6siYSBBgt6XcpGMdYR0/L3pW//9Tw5+TO8cKoIGv8vQP9E/Xw3o4y/
 mKC/j4tpGRfFeZ71dOE9FcYIBRQFSbS7jZAwPbk8yyld+vuEh9tirufe4miBAmRQLZLR
 A8sCV329zxVD4nsUBqgLlMiE0nEkbNYRzZyFO0IudPpvpRrBdfsWUCAFllm6KjZ2Ltvv
 yRnQ==
X-Gm-Message-State: APjAAAVflk5846pIunxF/amDlNAEWY/Niv05A/RsZos9zKP0e70fSEN9
 X9UdjvJx2Q5MznYEpS/+RCoDfflluhsGqXGvtw==
X-Google-Smtp-Source: APXvYqxRMVfHAGhUhJxKEuxHcWEypQSPSIfRy6EHETsgGSjA5PN4MCksd6ynojHcEmKksUuQb5QPx9wELjM/JEsQA3s=
X-Received: by 2002:a37:6508:: with SMTP id z8mr23709035qkb.492.1562779464305; 
 Wed, 10 Jul 2019 10:24:24 -0700 (PDT)
MIME-Version: 1.0
References: <20190710122018.2250-1-iamkeyur96@gmail.com>
 <20190710163538.GA30902@kroah.com>
In-Reply-To: <20190710163538.GA30902@kroah.com>
From: Keyur Patel <iamkeyur96@gmail.com>
Date: Wed, 10 Jul 2019 09:24:17 -0400
Message-ID: <CAAEMwn2ijpMczu=bVnnWKmdRfLXgeo0ir2-Z5s0r5OAxB_615A@mail.gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Thu, 11 Jul 2019 02:30:06 +0000
Cc: devel@driverdev.osuosl.org, Alex Elder <elder@kernel.org>,
 Johan Hovold <johan@kernel.org>, linux-kernel@vger.kernel.org,
 greybus-dev@lists.linaro.org, David Lin <dtwlin@gmail.com>
Subject: Re: [greybus-dev] [PATCH] staging: greybus: add logging statement
	when kfifo_alloc fails
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
Content-Type: multipart/mixed; boundary="===============0387982414244874942=="
Errors-To: greybus-dev-bounces@lists.linaro.org
Sender: "greybus-dev" <greybus-dev-bounces@lists.linaro.org>
X-Virus-Scanned: ClamAV using ClamSMTP

--===============0387982414244874942==
Content-Type: multipart/alternative; boundary="000000000000d5122b058d56f20a"

--000000000000d5122b058d56f20a
Content-Type: text/plain; charset="UTF-8"

Didn't notice that. I agree that this will result only into redundancy.
Quick look over files reveal that there are multiple places
where people are using print statements after memory allocation fails.
Should I go ahead and send patches to remove those
redundant print statements.

On Wed, 10 Jul 2019 at 12:35, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
wrote:

> On Wed, Jul 10, 2019 at 08:20:17AM -0400, Keyur Patel wrote:
> > Added missing logging statement when kfifo_alloc fails, to improve
> > debugging.
> >
> > Signed-off-by: Keyur Patel <iamkeyur96@gmail.com>
> > ---
> >  drivers/staging/greybus/uart.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/staging/greybus/uart.c
> b/drivers/staging/greybus/uart.c
> > index b3bffe91ae99..86a395ae177d 100644
> > --- a/drivers/staging/greybus/uart.c
> > +++ b/drivers/staging/greybus/uart.c
> > @@ -856,8 +856,10 @@ static int gb_uart_probe(struct gbphy_device
> *gbphy_dev,
> >
> >       retval = kfifo_alloc(&gb_tty->write_fifo, GB_UART_WRITE_FIFO_SIZE,
> >                            GFP_KERNEL);
> > -     if (retval)
> > +     if (retval) {
> > +             pr_err("kfifo_alloc failed\n");
> >               goto exit_buf_free;
> > +     }
>
> You should have already gotten an error message from the log if this
> fails, from the kmalloc_array() call failing, right?
>
> So why is this needed?  We have been trying to remove these types of
> messages and keep them in the "root" place where the failure happens.
>
> thanks,
>
> greg k-h
>


-- 
Regards
Keyur Patel

--000000000000d5122b058d56f20a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Didn&#39;t notice that. I agree that this will result=
 only into redundancy. Quick look over files reveal that there are multiple=
 places</div><div>where people are using print statements after memory allo=
cation fails. Should I go ahead and send patches to remove those</div><div>=
redundant print statements.<br></div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">On Wed, 10 Jul 2019 at 12:35, Greg Kroah-Har=
tman &lt;<a href=3D"mailto:gregkh@linuxfoundation.org">gregkh@linuxfoundati=
on.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">On Wed, Jul 10, 2019 at 08:20:17AM -0400, Keyur Patel wrote:<br>
&gt; Added missing logging statement when kfifo_alloc fails, to improve<br>
&gt; debugging.<br>
&gt; <br>
&gt; Signed-off-by: Keyur Patel &lt;<a href=3D"mailto:iamkeyur96@gmail.com"=
 target=3D"_blank">iamkeyur96@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 drivers/staging/greybus/uart.c | 4 +++-<br>
&gt;=C2=A0 1 file changed, 3 insertions(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/drivers/staging/greybus/uart.c b/drivers/staging/greybus/=
uart.c<br>
&gt; index b3bffe91ae99..86a395ae177d 100644<br>
&gt; --- a/drivers/staging/greybus/uart.c<br>
&gt; +++ b/drivers/staging/greybus/uart.c<br>
&gt; @@ -856,8 +856,10 @@ static int gb_uart_probe(struct gbphy_device *gbp=
hy_dev,<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0retval =3D kfifo_alloc(&amp;gb_tty-&gt;write=
_fifo, GB_UART_WRITE_FIFO_SIZE,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 GFP_KERNEL);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0if (retval)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (retval) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_err(&quot;kfifo_al=
loc failed\n&quot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto exit_buf_fr=
ee;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
<br>
You should have already gotten an error message from the log if this<br>
fails, from the kmalloc_array() call failing, right?<br>
<br>
So why is this needed?=C2=A0 We have been trying to remove these types of<b=
r>
messages and keep them in the &quot;root&quot; place where the failure happ=
ens.<br>
<br>
thanks,<br>
<br>
greg k-h<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature"><div dir=3D"ltr"><div>Regards<br></div>Keyur Patel<br></div=
></div></div>

--000000000000d5122b058d56f20a--

--===============0387982414244874942==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1k
ZXYgbWFpbGluZyBsaXN0CmdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKaHR0cHM6Ly9saXN0
cy5saW5hcm8ub3JnL21haWxtYW4vbGlzdGluZm8vZ3JleWJ1cy1kZXYK

--===============0387982414244874942==--
