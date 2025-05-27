Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id DE2F6AC4D74
	for <lists+greybus-dev@lfdr.de>; Tue, 27 May 2025 13:33:18 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 7E5A7453BC
	for <lists+greybus-dev@lfdr.de>; Tue, 27 May 2025 11:33:17 +0000 (UTC)
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com [209.85.208.67])
	by lists.linaro.org (Postfix) with ESMTPS id B7E2B4403B
	for <greybus-dev@lists.linaro.org>; Tue, 27 May 2025 04:32:19 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b="I8W+f/F3";
	spf=pass (lists.linaro.org: domain of clf700383@gmail.com designates 209.85.208.67 as permitted sender) smtp.mailfrom=clf700383@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-ed1-f67.google.com with SMTP id 4fb4d7f45d1cf-604f48c6e94so11953a12.3
        for <greybus-dev@lists.linaro.org>; Mon, 26 May 2025 21:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748320339; x=1748925139; darn=lists.linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/7yT088MKt4AElIKQJ2fby39tRFtfSK4doCjhZvV/iQ=;
        b=I8W+f/F3SYqChTEKpFy9sMzrww0bGlo6OvJ8yuwEctZYCmLRuDxBivNxsNKqy+Faol
         zxlqE0e1tUBMmGqdYGTcetPshcvjGADgJirg16w//yW/PWMpkNSZpIWM3RQrw5Q4Japg
         gE5NIrNqIC2HdPMUCAm+maRfoDFyDBk+jZqG3EdS1QnJlb1QtS1DgZbqttGtyG4fOhLJ
         a8/4f9yYO1Sqw9hqgQ+Ihs4N2XardZrW8Nt7cmsXDRPa+yDVKzza7sjG5QuPfQpxREt3
         0aGLdIXAUvztiv76JLwTip4vlcGQ6EPmTQE+E1nyjweei6CvqkDVjrOPAe6fg9KibI4W
         +iAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748320339; x=1748925139;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/7yT088MKt4AElIKQJ2fby39tRFtfSK4doCjhZvV/iQ=;
        b=sKBQGBQDJogbbDW0o6rZZ+gXrFncy4diW340DLmxDS88Ym4zBtQUUxnsQYqH2TI6J3
         SBE1072Lb5vTQDtJiHT1SO+o7sHVUXv3rsv6XVhkPzo6APSjRNLpjJsJ1PEiX/AlKHVR
         cniPGYOWkV7zbPSY8s0LXQNHeD8l6A1Xd4bC6J+F6I7A9Jko4/zOWRwVzzXCmK44Zt16
         va4uz2jMYUH4tRv1jriSsichvP9BA03ZKlVkgxIMLuRVId2PtZwph4V5T/24jDAYkchC
         8OSs9MmRZyXH7q1IUbGkHI49fB5aYC1jWKS/rnfaD/OEcloj8iO55g2kO6L6OSvhbqV2
         ppSg==
X-Forwarded-Encrypted: i=1; AJvYcCXzLMEozr8D/tvQLIpAmGOen47bcRnZ7NXXCRYr0/at1AXuJ+1mWBsTVgD4zH1r5ILcYm3wd7dlZ9QgSw==@lists.linaro.org
X-Gm-Message-State: AOJu0YyHp7NTc03MsR6hpZnhpd8hzJh6np8k2DrXKdFGOJ9l60r/0atq
	PiMSjhNbF7IbCmuYN82zuKjY/Y1ZXN4a4X5W9AwAfrloPTN1rp6VzeFwOsHfIUYT6DA/ol9UJOR
	GYhs1iJCYJCKsABr03JL/5K/lwtSffDU=
X-Gm-Gg: ASbGnctRfGZweQKWhsVZK6dw+e0hlrsX+6uS2f8APQv+yEFGZDiWFAsynVEJUyNJQe3
	kQb9VWL6RrVPV7JT3ZJdRPYB3OqvRI34gNRe1uNuTWMhu0+4LmlmCnkiKhMYECpWXTtMAsTtGaA
	7H2vAPgUv6pqGAsXl1SBXhwvJ+pL3GJx3Z3XsOgJ0kOpDMV0Ww2OHnhgI=
X-Google-Smtp-Source: AGHT+IGNdjt1ioZka/MfrUXU2SVsDMyJgphhop6BGYuBejGpJjh5Z0xlxPd99SUXLZ+Qf4iFm8VMUJ9jFQBQ9va5g1w=
X-Received: by 2002:a05:6402:40c4:b0:600:ecab:a724 with SMTP id
 4fb4d7f45d1cf-602d9df5fb6mr3677394a12.3.1748320338424; Mon, 26 May 2025
 21:32:18 -0700 (PDT)
MIME-Version: 1.0
References: <20250526110654.3916536-1-clf700383@gmail.com> <aDRSaZ4Rq47hjMuY@stanley.mountain>
 <202505262032.507AD8E0DC@keescook>
In-Reply-To: <202505262032.507AD8E0DC@keescook>
From: clingfei <clf700383@gmail.com>
Date: Tue, 27 May 2025 12:32:06 +0800
X-Gm-Features: AX0GCFt6M-DLPU6Rug26S0yCmPd2LL6xTjBxIrNVfYMDVnZ8Ffn-v_tt52vtSok
Message-ID: <CADPKJ-7qOcOS2kxxKrfvk5aSp5YUCWQa1q7s8bq33Zgn_hyVSg@mail.gmail.com>
To: Kees Cook <kees@kernel.org>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Spamd-Result: default: False [-8.00 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[99.99%];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	ARC_NA(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RCVD_COUNT_ONE(0.00)[1];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.208.67:from];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-0.998];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	DNSWL_BLOCKED(0.00)[209.85.208.67:from];
	RCVD_TLS_LAST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+]
X-Rspamd-Queue-Id: B7E2B4403B
X-Spamd-Bar: -------
X-MailFrom: clf700383@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: OYK6X5XOJBG4BXEDUSOLQZH5B3JGITFP
X-Message-ID-Hash: OYK6X5XOJBG4BXEDUSOLQZH5B3JGITFP
X-Mailman-Approved-At: Tue, 27 May 2025 11:33:15 +0000
CC: Dan Carpenter <dan.carpenter@linaro.org>, elder@kernel.org, johan@kernel.org, vireshk@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] greybus: Avoid fake flexible array for response data
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/OYK6X5XOJBG4BXEDUSOLQZH5B3JGITFP/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: multipart/mixed; boundary="===============2148064206299975454=="

--===============2148064206299975454==
Content-Type: multipart/alternative; boundary="000000000000b9b5ff0636168c6c"

--000000000000b9b5ff0636168c6c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Kees Cook <kees@kernel.org> =E4=BA=8E2025=E5=B9=B45=E6=9C=8827=E6=97=A5=E5=
=91=A8=E4=BA=8C 11:36=E5=86=99=E9=81=93=EF=BC=9A

> On Mon, May 26, 2025 at 02:37:13PM +0300, Dan Carpenter wrote:
> > On Mon, May 26, 2025 at 07:06:54PM +0800, clingfei wrote:
> > > As https://lore.kernel.org/all/20240304211940.it.083-kees@kernel.org/
> >
> > I don't want to have to read a link to understand the commit message.
> >
> > Does this change really affect anything in terms of "enforce the 0-size=
d
> > destinations" rule?  I don't think this is a destination.  I think Kees
> > enabled the checking he wanted.  You should probably CC him since we're
> > refering to his email.
>
> FWIW, the above patch became commit 7ba59ac7da2a ("greybus: Avoid fake
> flexible array for response data").
>
> > > pointed out, to enforce the 0-sized destinations, the remaining 0-siz=
ed
> > > destinations need to be handled. Thus the struct
> > > gb_control_get_manifest_response and struct gb_i2c_transfer_response
> > > are removed.
> >
> > Here is a better commit message;
> >
> > "We want to get rid of zero size arrays and use flexible arrays instead=
.
> > However, in this case the struct is just one flexible array of u8 which
> > adds no value.  Just use a char pointer instead."
> >
> > I would have ignored it, probably but actually the
> > gb_control_get_manifest_response struct is not used so put that in a
> > separate commit.  That's a simpler commit to review.
> >
> > "The gb_control_get_manifest_response struct is not used.  Delete it."
>
> The patch content itself looks mechanically correct. I think Dan's style
> suggestions would be good to see. Can you send a v2?
>
> -Kees
>
> >
> > >
> > > Signed-off-by: clingfei <clf700383@gmail.com>
> > > ---
> > >  drivers/staging/greybus/i2c.c             | 9 ++++-----
> > >  include/linux/greybus/greybus_protocols.h | 9 ---------
> > >  2 files changed, 4 insertions(+), 14 deletions(-)
> > >
> > > diff --git a/drivers/staging/greybus/i2c.c
> b/drivers/staging/greybus/i2c.c
> > > index 14f1ff6d448c..2857c2834206 100644
> > > --- a/drivers/staging/greybus/i2c.c
> > > +++ b/drivers/staging/greybus/i2c.c
> > > @@ -144,15 +144,14 @@ gb_i2c_operation_create(struct gb_connection
> *connection,
> > >  }
> > >
> > >  static void gb_i2c_decode_response(struct i2c_msg *msgs, u32
> msg_count,
> > > -                              struct gb_i2c_transfer_response
> *response)
> > > +                              u8 *data)
> > >  {
> > >     struct i2c_msg *msg =3D msgs;
> > > -   u8 *data;
> > >     u32 i;
> > >
> > > -   if (!response)
> > > +   if (!data)
> > >             return;
> > > -   data =3D response->data;
> > > +
> > >     for (i =3D 0; i < msg_count; i++) {
> > >             if (msg->flags & I2C_M_RD) {
> > >                     memcpy(msg->buf, data, msg->len);
> > > @@ -188,7 +187,7 @@ static int gb_i2c_transfer_operation(struct
> gb_i2c_device *gb_i2c_dev,
> > >
> > >     ret =3D gb_operation_request_send_sync(operation);
> > >     if (!ret) {
> > > -           struct gb_i2c_transfer_response *response;
> > > +           u8 *response;
> > >
> > >             response =3D operation->response->payload;
> > >             gb_i2c_decode_response(msgs, msg_count, response);
> >
> > I like when parameters are called the same thing on both sides.  The
> > name "response" adds no value.  Instead get rid of that variable and
> > pass operation->response->payload directly.
> >
> >               gb_i2c_decode_response(msgs, msg_count,
> >                                      operation->response->payload);
> >
> > regards,
> > dan carpenter
> >
>
> --
> Kees Cook
>

Thanks for your review, I will send a PATCH v2.
However, as Greg mentioned, I am not sure how to verify its correctness. Do
you have any suggestions?

--000000000000b9b5ff0636168c6c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=
=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr=
">Kees Cook &lt;<a href=3D"mailto:kees@kernel.org">kees@kernel.org</a>&gt; =
=E4=BA=8E2025=E5=B9=B45=E6=9C=8827=E6=97=A5=E5=91=A8=E4=BA=8C 11:36=E5=86=
=99=E9=81=93=EF=BC=9A<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">On Mon, May 26, 2025 at 02:37:13PM +0300, Dan Carpenter wrote:<br>
&gt; On Mon, May 26, 2025 at 07:06:54PM +0800, clingfei wrote:<br>
&gt; &gt; As <a href=3D"https://lore.kernel.org/all/20240304211940.it.083-k=
ees@kernel.org/" rel=3D"noreferrer" target=3D"_blank">https://lore.kernel.o=
rg/all/20240304211940.it.083-kees@kernel.org/</a><br>
&gt; <br>
&gt; I don&#39;t want to have to read a link to understand the commit messa=
ge.<br>
&gt; <br>
&gt; Does this change really affect anything in terms of &quot;enforce the =
0-sized<br>
&gt; destinations&quot; rule?=C2=A0 I don&#39;t think this is a destination=
.=C2=A0 I think Kees<br>
&gt; enabled the checking he wanted.=C2=A0 You should probably CC him since=
 we&#39;re<br>
&gt; refering to his email.<br>
<br>
FWIW, the above patch became commit 7ba59ac7da2a (&quot;greybus: Avoid fake=
<br>
flexible array for response data&quot;).<br>
<br>
&gt; &gt; pointed out, to enforce the 0-sized destinations, the remaining 0=
-sized<br>
&gt; &gt; destinations need to be handled. Thus the struct<br>
&gt; &gt; gb_control_get_manifest_response and struct gb_i2c_transfer_respo=
nse<br>
&gt; &gt; are removed.<br>
&gt; <br>
&gt; Here is a better commit message;<br>
&gt; <br>
&gt; &quot;We want to get rid of zero size arrays and use flexible arrays i=
nstead.<br>
&gt; However, in this case the struct is just one flexible array of u8 whic=
h<br>
&gt; adds no value.=C2=A0 Just use a char pointer instead.&quot;<br>
&gt; <br>
&gt; I would have ignored it, probably but actually the<br>
&gt; gb_control_get_manifest_response struct is not used so put that in a<b=
r>
&gt; separate commit.=C2=A0 That&#39;s a simpler commit to review.<br>
&gt; <br>
&gt; &quot;The gb_control_get_manifest_response struct is not used.=C2=A0 D=
elete it.&quot;<br>
<br>
The patch content itself looks mechanically correct. I think Dan&#39;s styl=
e<br>
suggestions would be good to see. Can you send a v2?<br>
<br>
-Kees<br>
<br>
&gt; <br>
&gt; &gt; <br>
&gt; &gt; Signed-off-by: clingfei &lt;<a href=3D"mailto:clf700383@gmail.com=
" target=3D"_blank">clf700383@gmail.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 drivers/staging/greybus/i2c.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| 9 ++++-----<br>
&gt; &gt;=C2=A0 include/linux/greybus/greybus_protocols.h | 9 ---------<br>
&gt; &gt;=C2=A0 2 files changed, 4 insertions(+), 14 deletions(-)<br>
&gt; &gt; <br>
&gt; &gt; diff --git a/drivers/staging/greybus/i2c.c b/drivers/staging/grey=
bus/i2c.c<br>
&gt; &gt; index 14f1ff6d448c..2857c2834206 100644<br>
&gt; &gt; --- a/drivers/staging/greybus/i2c.c<br>
&gt; &gt; +++ b/drivers/staging/greybus/i2c.c<br>
&gt; &gt; @@ -144,15 +144,14 @@ gb_i2c_operation_create(struct gb_connectio=
n *connection,<br>
&gt; &gt;=C2=A0 }<br>
&gt; &gt;=C2=A0 <br>
&gt; &gt;=C2=A0 static void gb_i2c_decode_response(struct i2c_msg *msgs, u3=
2 msg_count,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct gb_i2c_transfer_response *=
response)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 u8 *data)<br>
&gt; &gt;=C2=A0 {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0struct i2c_msg *msg =3D msgs;<br>
&gt; &gt; -=C2=A0 =C2=A0u8 *data;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0u32 i;<br>
&gt; &gt;=C2=A0 <br>
&gt; &gt; -=C2=A0 =C2=A0if (!response)<br>
&gt; &gt; +=C2=A0 =C2=A0if (!data)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
&gt; &gt; -=C2=A0 =C2=A0data =3D response-&gt;data;<br>
&gt; &gt; +<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; msg_count; i++) {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (msg-&gt;flags =
&amp; I2C_M_RD) {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0memcpy(msg-&gt;buf, data, msg-&gt;len);<br>
&gt; &gt; @@ -188,7 +187,7 @@ static int gb_i2c_transfer_operation(struct g=
b_i2c_device *gb_i2c_dev,<br>
&gt; &gt;=C2=A0 <br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0ret =3D gb_operation_request_send_sync(operati=
on);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0if (!ret) {<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct gb_i2c_transfer_=
response *response;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u8 *response;<br>
&gt; &gt;=C2=A0 <br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0response =3D opera=
tion-&gt;response-&gt;payload;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gb_i2c_decode_resp=
onse(msgs, msg_count, response);<br>
&gt; <br>
&gt; I like when parameters are called the same thing on both sides.=C2=A0 =
The<br>
&gt; name &quot;response&quot; adds no value.=C2=A0 Instead get rid of that=
 variable and<br>
&gt; pass operation-&gt;response-&gt;payload directly.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gb_i2c_decode_re=
sponse(msgs, msg_count,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 operation-&g=
t;response-&gt;payload);<br>
&gt; <br>
&gt; regards,<br>
&gt; dan carpenter<br>
&gt; <br>
<br>
-- <br>
Kees Cook<br></blockquote><div><br>Thanks for your review, I will send a PA=
TCH v2.=C2=A0<br>However, as Greg mentioned, I am not sure how to verify it=
s correctness. Do you have any suggestions?</div></div></div></div>

--000000000000b9b5ff0636168c6c--

--===============2148064206299975454==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

--===============2148064206299975454==--
