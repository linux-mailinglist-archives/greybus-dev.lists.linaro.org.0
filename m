Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CHyBE6uWuGk8gQEAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Tue, 17 Mar 2026 00:47:55 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id B73C22A2122
	for <lists+greybus-dev@lfdr.de>; Tue, 17 Mar 2026 00:47:54 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 7145F3F8EF
	for <lists+greybus-dev@lfdr.de>; Mon, 16 Mar 2026 23:47:53 +0000 (UTC)
Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	by lists.linaro.org (Postfix) with ESMTPS id 1E1F73F78F
	for <greybus-dev@lists.linaro.org>; Mon, 16 Mar 2026 20:22:58 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=aVcyu325;
	arc=pass ("google.com:s=arc-20240605:i=1");
	spf=pass (lists.linaro.org: domain of oaroraetimis@gmail.com designates 74.125.224.46 as permitted sender) smtp.mailfrom=oaroraetimis@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-64ca09f2056so3772627d50.2
        for <greybus-dev@lists.linaro.org>; Mon, 16 Mar 2026 13:22:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773692577; cv=none;
        d=google.com; s=arc-20240605;
        b=GN0izNC7tGF7Yd+CLnHf+x7whGz5aoWXeoeTJAYeNg+jFcLFpUOVereOs5mklCjYea
         xQ1zJKQTYkS6eH6RB8v8vqi8udjg2pNZLzW2hS9sgu6FBdZfSeXF3qn7HhLs+c8mU2h+
         T4Fv2VQ4vF5I8KWvmNGmXqFGfgY+27vPMaJI07NIjPu41b+Z1FMcgrb7TUdhe+Vz29rt
         40IW/5ChFyMroVxiTXGl/frmsoT+/yJqGAWRYCiwxuVRbxADX5VJYvEeRB/khDm0uWOH
         o/1NWKEfNVg0PXQPLEPtnLlBJ8JsSlYa8oj44hu6wsJvesTXgLOBgQuyfbPtge6oIDnh
         vq9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=lROZOUJ88WGsH745hKVcl3ZHoeV5cSPJkvngsXaonTo=;
        fh=QOT/w9RHW18Vcq/Svbhmi38oxPShKLv5l+ReaZkzKHE=;
        b=L2RE7hlwb9aGnkGa96WFumc4ftlHUB9M8kBpe9SYJKlE+WLGgXpcK+qYT238rdnDku
         3lUxWt91OsLbb97PVb0pYdn0uDOvCzX3Jhzyny25RVwnYPKvWMketj9xv5RC3z6M48A0
         oS15zbuDU1eOQs30qs3D4nlnagpozDi5SUJitLngrdtszs/ZvJ/gF73MEzvMSYpdY0dZ
         Zkw3HHT/9XidcatgNHPogHk3qfer9dfjqunJtC/pAWeXQ+4SvTPbzW2iDMgQT1k/fR6a
         tRI5yKonaikbOsZrxT25oVSSAQbBWOc22ix5Wuahm9WYnXI/oSPxhjUpTZrboefpwm7s
         XcYA==;
        darn=lists.linaro.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773692577; x=1774297377; darn=lists.linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lROZOUJ88WGsH745hKVcl3ZHoeV5cSPJkvngsXaonTo=;
        b=aVcyu325XGqLopBgx+1S31VrdnCJ5NF+WBi2zPuIYBFXKz+7RjMfv+SMn4ln6vOw4V
         sxXtJpaV85S608lqrnFBzbYJMiKNZ8r2RRrE3vU9PQn2/JEEXjPksEiCeuS5gu0cwYip
         H77fCmGYHDdMcoVH2PEZBDkGsc5f8K4+bCxlSmy8LwG4t5CvK7rI3EJOcQiK7BWcr57P
         MZJVkjH4DtZSM5uwebcVAJOEzbHejgT3x9VI634MLq2+iJpdMPez9U1b+kC2tOOYBYty
         9HSEudvzvtmU+/yoOlrasdxZFt8v0OXvHaaovVWmTAEy9h/cSj3HyqEnKM8Bv4cAJ0sx
         XnHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773692577; x=1774297377;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lROZOUJ88WGsH745hKVcl3ZHoeV5cSPJkvngsXaonTo=;
        b=tN36y8pM0pfAQ6bYjGcMevGNKr4e4n07zP6SsDX7AH0tQmMKwI5l1CJQZlFeCmV8Fe
         8mfZ8WHatCLLFepqcjPMLCo/Iq1E67tPWe7JXal0y5NmonawqCiAC8yJJtry5gSrtCJ4
         MMx61j+L+81jX/KQrNZcT9bHf2QncrFanwS/p16fPsaq2tX4pdGvdd+ua+0wlHCWwSne
         +Xd/Br06My8vaWfoDQcp54MAGdYxjHCwPR/oKj9RnLmb7lqzJ4NQzjuhYc09zOQ9GQ3L
         OKLUVDkg3SznHo1OnbYneh0wlsO+cyGwGePY9f58bqPCrrFbR+CmjwhUmzCqVBTHDa4H
         arLw==
X-Forwarded-Encrypted: i=1; AJvYcCXUzAlMaPXAunPio2yspuZinfCY58ldcSiGttHKP+lfEmSCXS6rlxy1DTY6wLsBrmdYcWxEJC2puQYAbg==@lists.linaro.org
X-Gm-Message-State: AOJu0Yy/aQSvrd+GRVo58hbhrEX57x75zsRZKcj6EKnCrXoqoLFkxOJL
	qpU+oO5+uZDNFqHsZDr5o5mpswok517rzeM+VrKQLmhoqTOKE8X9GVDesBaVx1C4036l6eX7qZh
	6AlZzvP+fKeiAzlQW/blAAm5Ja5HOMfRJjnEe
X-Gm-Gg: ATEYQzzQXIh+MryDKSTbJTc9B4fWKTWV/FamRSYMNSFfR24kMT5tjC698c8gkR7oB3i
	V71KE2AJiQCwPY4Dg0nEFVBK21fJFFlHFTmNXZG10koXiXeaKR2OOSfDNGxBd0jzuGXVuC/Y+Ou
	A3vMgJw0tbDDoUcEAkMf3nVbEUuKPGnsPxT/TRDRJDeoiAKTs+iEggbhCisbXvvxXNasITorxLw
	w3veo13sZwn2TzuNl9nWfOLu2BE3L/JZxYeAhL9ls4L2hz+4/EVWBAJv0FYUBIgnsiGfS3TRujv
	gOri3AGp
X-Received: by 2002:a53:b007:0:b0:64c:f78b:1259 with SMTP id
 956f58d0204a3-64e6306d889mr10568556d50.62.1773692577573; Mon, 16 Mar 2026
 13:22:57 -0700 (PDT)
MIME-Version: 1.0
References: <20260315182028.133028-1-OaroraEtimis@gmail.com> <abfGStu_eSV0xcM6@stanley.mountain>
In-Reply-To: <abfGStu_eSV0xcM6@stanley.mountain>
From: Oarora Etimis <oaroraetimis@gmail.com>
Date: Tue, 17 Mar 2026 04:22:45 +0800
X-Gm-Features: AaiRm50J8sl7TmR-zVJBtwICAOgTXT4cT6lzjN0ut4BeAocCzc_f38S92FcBxLY
Message-ID: <CAJrv7PA-Ya0Ar2SqBjDYed6cq0bgKVsXumf5g8aQR1WX9i=8iA@mail.gmail.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
X-Spamd-Bar: -----
X-MailFrom: oaroraetimis@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: UW43AXNP2SFEQ3ORIATR3H5LCCXB3Q2C
X-Message-ID-Hash: UW43AXNP2SFEQ3ORIATR3H5LCCXB3Q2C
X-Mailman-Approved-At: Mon, 16 Mar 2026 23:47:51 +0000
CC: vireshk@kernel.org, johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: bootrom: fix potential null pointer dereference
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/UW43AXNP2SFEQ3ORIATR3H5LCCXB3Q2C/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: multipart/mixed; boundary="===============6394927050030750252=="
X-Spamd-Result: default: False [1.59 / 15.00];
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[multipart/mixed,multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:~,4:+];
	RCVD_COUNT_THREE(0.00)[3];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oaroraetimis@gmail.com,greybus-dev-bounces@lists.linaro.org];
	DKIM_TRACE(0.00)[gmail.com:-];
	TAGGED_RCPT(0.00)[greybus-dev];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	NEURAL_SPAM(0.00)[0.006];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,mail.gmail.com:mid,lists.linaro.org:helo,lists.linaro.org:rdns]
X-Rspamd-Queue-Id: B73C22A2122
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

--===============6394927050030750252==
Content-Type: multipart/alternative; boundary="00000000000006ef68064d29fc05"

--00000000000006ef68064d29fc05
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Yes, it was a false positive from Clang (make LLVM=3D1). I will drop the
patch.
=E2=80=8BThanks,
Oarora

On Mon, Mar 16, 2026, 16:58 Dan Carpenter <dan.carpenter@linaro.org> wrote:

> On Mon, Mar 16, 2026 at 02:20:28AM +0800, Oarora Etimis wrote:
> > In gb_bootrom_get_firmware(), the 'fw' pointer could be NULL if the
> > function jumps to the 'unlock' label. The execution flow continues
> > into the 'queue_work' block where 'fw->size' is accessed, leading to
> > a null pointer dereference.
> >
> > Fix this by adding a NULL check for 'fw' before accessing its members.
> >
> > Signed-off-by: Oarora Etimis <OaroraEtimis@gmail.com>
> > ---
> >  drivers/staging/greybus/bootrom.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/staging/greybus/bootrom.c
> b/drivers/staging/greybus/bootrom.c
> > index 83921d90c322..50c80475d241 100644
> > --- a/drivers/staging/greybus/bootrom.c
> > +++ b/drivers/staging/greybus/bootrom.c
> > @@ -298,7 +298,7 @@ static int gb_bootrom_get_firmware(struct
> gb_operation *op)
> >
> >  queue_work:
> >       /* Refresh timeout */
> > -     if (!ret && (offset + size =3D=3D fw->size))
> > +     if (!ret && fw && (offset + size =3D=3D fw->size))
>
> Was this a static checker false positive?  Which checker are you using?
>
> If fw is NULL then "ret" is a negative error code so the original code
> is fine.
>
> regards,
> dan carpenter
>
> >               next_request =3D NEXT_REQ_READY_TO_BOOT;
> >       else
> >               next_request =3D NEXT_REQ_GET_FIRMWARE;
> > --
> > 2.47.3
> >
>

--00000000000006ef68064d29fc05
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Yes, it was a false positive from Clang (make LLVM=3D1). =
I will drop the patch.<div dir=3D"auto">=E2=80=8BThanks,</div><div dir=3D"a=
uto">Oarora</div></div><br><div class=3D"gmail_quote gmail_quote_container"=
><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Mar 16, 2026, 16:58 Dan Carp=
enter &lt;<a href=3D"mailto:dan.carpenter@linaro.org">dan.carpenter@linaro.=
org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Mon, Mar 16, =
2026 at 02:20:28AM +0800, Oarora Etimis wrote:<br>
&gt; In gb_bootrom_get_firmware(), the &#39;fw&#39; pointer could be NULL i=
f the<br>
&gt; function jumps to the &#39;unlock&#39; label. The execution flow conti=
nues<br>
&gt; into the &#39;queue_work&#39; block where &#39;fw-&gt;size&#39; is acc=
essed, leading to<br>
&gt; a null pointer dereference.<br>
&gt; <br>
&gt; Fix this by adding a NULL check for &#39;fw&#39; before accessing its =
members.<br>
&gt; <br>
&gt; Signed-off-by: Oarora Etimis &lt;<a href=3D"mailto:OaroraEtimis@gmail.=
com" target=3D"_blank" rel=3D"noreferrer">OaroraEtimis@gmail.com</a>&gt;<br=
>
&gt; ---<br>
&gt;=C2=A0 drivers/staging/greybus/bootrom.c | 2 +-<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/drivers/staging/greybus/bootrom.c b/drivers/staging/greyb=
us/bootrom.c<br>
&gt; index 83921d90c322..50c80475d241 100644<br>
&gt; --- a/drivers/staging/greybus/bootrom.c<br>
&gt; +++ b/drivers/staging/greybus/bootrom.c<br>
&gt; @@ -298,7 +298,7 @@ static int gb_bootrom_get_firmware(struct gb_opera=
tion *op)<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 queue_work:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Refresh timeout */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0if (!ret &amp;&amp; (offset + size =3D=3D fw-&gt;=
size))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!ret &amp;&amp; fw &amp;&amp; (offset + size =
=3D=3D fw-&gt;size))<br>
<br>
Was this a static checker false positive?=C2=A0 Which checker are you using=
?<br>
<br>
If fw is NULL then &quot;ret&quot; is a negative error code so the original=
 code<br>
is fine.<br>
<br>
regards,<br>
dan carpenter<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0next_request =3D=
 NEXT_REQ_READY_TO_BOOT;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0next_request =3D=
 NEXT_REQ_GET_FIRMWARE;<br>
&gt; -- <br>
&gt; 2.47.3<br>
&gt; <br>
</blockquote></div>

--00000000000006ef68064d29fc05--

--===============6394927050030750252==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

--===============6394927050030750252==--
