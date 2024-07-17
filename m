Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id AEDD3933C31
	for <lists+greybus-dev@lfdr.de>; Wed, 17 Jul 2024 13:25:17 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 8BC3644191
	for <lists+greybus-dev@lfdr.de>; Wed, 17 Jul 2024 11:25:16 +0000 (UTC)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	by lists.linaro.org (Postfix) with ESMTPS id 11E7D410C8
	for <greybus-dev@lists.linaro.org>; Wed, 17 Jul 2024 08:20:18 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=Mp+QWsz8;
	spf=pass (lists.linaro.org: domain of soyjuanarbol@gmail.com designates 209.85.128.171 as permitted sender) smtp.mailfrom=soyjuanarbol@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-65f8b0df1f0so38530757b3.2
        for <greybus-dev@lists.linaro.org>; Wed, 17 Jul 2024 01:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721204417; x=1721809217; darn=lists.linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WQHFUewm52sH96DT0Mr+uVYL/u3ZhRFNbvylcd06KB0=;
        b=Mp+QWsz8UmO5XbzqiYFjMugu+auhKgMXgxyHVw2BBRfa39bWEenSwETfhk12miAQQi
         dcgXgUsEm0sG3v/3yPaXxyU0j4dysiSZfAeb/GMPMqyg5w+RR6KjPjApicBtQarKt2Hq
         Pt+NqwOiFKczbm6RMO3oMGAgeUcGSLxavXnqlkZ4M3qxF1yXzzO/cOF1NiNlJbqIc17D
         1YevyPApLElfk6Ws+FCcXBGsJpyMj9jt8kWyh0POKJrPpDR3BqTUyFWDXj8A+EJFO35i
         DYV3q4p9+mspj6FYQiWmUgv/fupeK/dATT8dx8M+izcPZDNquIAn92QvdR1YzUPSZlwG
         ez6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721204417; x=1721809217;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WQHFUewm52sH96DT0Mr+uVYL/u3ZhRFNbvylcd06KB0=;
        b=AB0YUFDHsak84hAf+LaEz4xgNoWPN3RmeARzAExsp6zki7kxAqLp3suH+zeVZknWqw
         V7FE++F3owilnd8Hrd9ie4QEmht9bvdjCl0+Fb2W9x6bRpTcJvpWpN6M7IoW502GrDFv
         VEL2hdiw9ymhoCyU2ITk5UMu1Q3JqVMh5QKPrl1/6EWhR9NJhAk9/GiaHxNIx6go03Gf
         2BUm+4zV7AnHpXXrRM9NE22es7gAKCsXKHL4oqV7mEHbdI/zt2BzopwWPcINaTBb05wz
         ZxXJt+DYI/4/rHNI5zvGEM/MlYqX5AAhWTrA8rVf/pgBsarzmhbRQxNVHnpZfm0n5y9L
         FmKA==
X-Forwarded-Encrypted: i=1; AJvYcCVfbYAIgO96qBAAh03uZxJKUR5Hri5mvKmObmylXCsz4MxfVBLI8F4yTKnbhI0ISGucrbasZt3uYijhsk63oZLQGmleIsJjYBPMi9yi
X-Gm-Message-State: AOJu0YxEfvvdueuGQ94CG2CJVZVWTllH10y2xCSFn6V1r0JuO8zrdeFR
	RvVIPNnAo6g6InrIkMGpNoFFB55SVJkS4UUbwOkBjT4iD9wFwueUtD5zGYMnhQTCU7skZCm4RxD
	xfzJSEUQ0I8gj0orbka1dg9tS7lE=
X-Google-Smtp-Source: AGHT+IFfnuM/SvyeQet26WxwgZHXWibeeepy0vST60gmFqKk3Z89TK0UwLxRK+WY4y5Uv316mDAwYkAjUgHTbBcN7xg=
X-Received: by 2002:a05:690c:6001:b0:664:f825:93ca with SMTP id
 00721157ae682-664fe7442d6mr12693757b3.25.1721204417402; Wed, 17 Jul 2024
 01:20:17 -0700 (PDT)
MIME-Version: 1.0
References: <ZpdrmuzGgYDJ-Bb0@fedora> <2024071739-mollusk-uneaten-8dec@gregkh>
In-Reply-To: <2024071739-mollusk-uneaten-8dec@gregkh>
From: =?UTF-8?Q?Juan_Jos=C3=A9?= <soyjuanarbol@gmail.com>
Date: Wed, 17 Jul 2024 03:20:06 -0500
Message-ID: <CABi5LnQHcK7=8=noGQ1QBjLa6UkR7Dv4GpViEfCQvwS4q7Ojhg@mail.gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
X-Rspamd-Queue-Id: 11E7D410C8
X-Spamd-Bar: --------
X-Spamd-Result: default: False [-8.00 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCVD_COUNT_ONE(0.00)[1];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.128.171:from];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	DKIM_TRACE(0.00)[gmail.com:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-MailFrom: soyjuanarbol@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: YG75VZHHJSVZFMG3XUF6IHYQ3HJNQ7YZ
X-Message-ID-Hash: YG75VZHHJSVZFMG3XUF6IHYQ3HJNQ7YZ
X-Mailman-Approved-At: Wed, 17 Jul 2024 11:25:09 +0000
CC: johan@kernel.org, linux-staging@lists.linux.dev, trivial@kernel.org, greybus-dev@lists.linaro.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: Enclose multi-statement macro in do-while loop
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/YG75VZHHJSVZFMG3XUF6IHYQ3HJNQ7YZ/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: multipart/mixed; boundary="===============4288283892804873320=="

--===============4288283892804873320==
Content-Type: multipart/alternative; boundary="000000000000e29eb3061d6d2162"

--000000000000e29eb3061d6d2162
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Yes! I build and clean and build and clean and build again, everything
seems fine from the compiler side and posttest task as well. Everything
seems ok.

Thanks,
- Juan Jos=C3=A9

On Wed, Jul 17, 2024 at 2:50=E2=80=AFAM Greg KH <gregkh@linuxfoundation.org=
> wrote:

> On Wed, Jul 17, 2024 at 01:58:34AM -0500, Juan Jos=C3=A9 Arboleda wrote:
> > The macro `gb_loopback_stats_attrs` in the Greybus loopback driver
> > contains multiple statements, which should be enclosed in a do-while
> > loop to ensure proper execution and adhere to coding standards.
> >
> > This patch modifies the `gb_loopback_stats_attrs` macro to enclose
> > its statements in a do-while loop, addressing the style error flagged
> > by checkpatch.pl.
> >
> > Signed-off-by: Juan Jos=C3=A9 Arboleda <soyjuanarbol@gmail.com>
> > ---
> >  drivers/staging/greybus/loopback.c | 8 +++++---
> >  1 file changed, 5 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/staging/greybus/loopback.c
> b/drivers/staging/greybus/loopback.c
> > index 4313d3bbc23a..a97de86c67a5 100644
> > --- a/drivers/staging/greybus/loopback.c
> > +++ b/drivers/staging/greybus/loopback.c
> > @@ -163,9 +163,11 @@ static ssize_t name##_avg_show(struct device *dev,
>              \
> >  static DEVICE_ATTR_RO(name##_avg)
> >
> >  #define gb_loopback_stats_attrs(field)                               \
> > -     gb_loopback_ro_stats_attr(field, min, u);               \
> > -     gb_loopback_ro_stats_attr(field, max, u);               \
> > -     gb_loopback_ro_avg_attr(field)
> > +     do {                                                    \
> > +             gb_loopback_ro_stats_attr(field, min, u);       \
> > +             gb_loopback_ro_stats_attr(field, max, u);       \
> > +             gb_loopback_ro_avg_attr(field);                 \
> > +     } while (0)
> >
> >  #define gb_loopback_attr(field, type)
>       \
> >  static ssize_t field##_show(struct device *dev,
>       \
>
> Are you sure you test-built this change?
>
> thanks,
>
> greg k-h
>


--=20
Regards,
-Juan Jos=C3=A9

--000000000000e29eb3061d6d2162
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Yes! I build and clean and build and clean and build again=
, everything seems fine from the compiler side and posttest task as well. E=
verything seems ok.<br><br>Thanks,<div>- Juan=C2=A0Jos=C3=A9</div></div><br=
><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, J=
ul 17, 2024 at 2:50=E2=80=AFAM Greg KH &lt;<a href=3D"mailto:gregkh@linuxfo=
undation.org">gregkh@linuxfoundation.org</a>&gt; wrote:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">On Wed, Jul 17, 2024 at 01:58:34AM =
-0500, Juan Jos=C3=A9 Arboleda wrote:<br>
&gt; The macro `gb_loopback_stats_attrs` in the Greybus loopback driver<br>
&gt; contains multiple statements, which should be enclosed in a do-while<b=
r>
&gt; loop to ensure proper execution and adhere to coding standards.<br>
&gt; <br>
&gt; This patch modifies the `gb_loopback_stats_attrs` macro to enclose<br>
&gt; its statements in a do-while loop, addressing the style error flagged<=
br>
&gt; by <a href=3D"http://checkpatch.pl" rel=3D"noreferrer" target=3D"_blan=
k">checkpatch.pl</a>.<br>
&gt; <br>
&gt; Signed-off-by: Juan Jos=C3=A9 Arboleda &lt;<a href=3D"mailto:soyjuanar=
bol@gmail.com" target=3D"_blank">soyjuanarbol@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 drivers/staging/greybus/loopback.c | 8 +++++---<br>
&gt;=C2=A0 1 file changed, 5 insertions(+), 3 deletions(-)<br>
&gt; <br>
&gt; diff --git a/drivers/staging/greybus/loopback.c b/drivers/staging/grey=
bus/loopback.c<br>
&gt; index 4313d3bbc23a..a97de86c67a5 100644<br>
&gt; --- a/drivers/staging/greybus/loopback.c<br>
&gt; +++ b/drivers/staging/greybus/loopback.c<br>
&gt; @@ -163,9 +163,11 @@ static ssize_t name##_avg_show(struct device *dev=
,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;=C2=A0 static DEVICE_ATTR_RO(name##_avg)<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 #define gb_loopback_stats_attrs(field)=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0\<br>
&gt; -=C2=A0 =C2=A0 =C2=A0gb_loopback_ro_stats_attr(field, min, u);=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt; -=C2=A0 =C2=A0 =C2=A0gb_loopback_ro_stats_attr(field, max, u);=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt; -=C2=A0 =C2=A0 =C2=A0gb_loopback_ro_avg_attr(field)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0do {=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gb_loopback_ro_stats_=
attr(field, min, u);=C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gb_loopback_ro_stats_=
attr(field, max, u);=C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gb_loopback_ro_avg_at=
tr(field);=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0} while (0)<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 #define gb_loopback_attr(field, type)=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt;=C2=A0 static ssize_t field##_show(struct device *dev,=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 \<br>
<br>
Are you sure you test-built this change?<br>
<br>
thanks,<br>
<br>
greg k-h<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr">Regards,<div>-Juan Jos=C3=A9</div></div></div>

--000000000000e29eb3061d6d2162--

--===============4288283892804873320==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

--===============4288283892804873320==--
