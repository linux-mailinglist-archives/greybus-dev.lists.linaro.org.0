Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ePdpMGs8nmkrUQQAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Wed, 25 Feb 2026 01:03:55 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 34FB818E3F8
	for <lists+greybus-dev@lfdr.de>; Wed, 25 Feb 2026 01:03:55 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 458043F853
	for <lists+greybus-dev@lfdr.de>; Wed, 25 Feb 2026 00:03:54 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	by lists.linaro.org (Postfix) with ESMTPS id AC2D74048F
	for <greybus-dev@lists.linaro.org>; Tue, 24 Feb 2026 18:48:05 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=R9Ifs61W;
	spf=pass (lists.linaro.org: domain of chakrabortyshubham66@gmail.com designates 209.85.218.47 as permitted sender) smtp.mailfrom=chakrabortyshubham66@gmail.com;
	arc=pass ("google.com:s=arc-20240605:i=1");
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b8fb6ad3243so822482166b.1
        for <greybus-dev@lists.linaro.org>; Tue, 24 Feb 2026 10:48:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771958885; cv=none;
        d=google.com; s=arc-20240605;
        b=CcFxs729sBZAKPKON9dv6nGC2pE7ftY6lC//SnMGwrXc5wf9mBrFD+Zq+JFUnLtXXT
         T3jDJpW532riDziObqebVx3vvIAh0g7Bl/cw5dUCQX1KbosC3HbFm/w9RfD0t1IQOfHu
         awY9gm6fV2MQoA2t/CcGPucUR1Ct1G0UGMv0jiyR3p0b/IPuEXdgSWwbYhzOK4jINg94
         pMqMcataaO4LpgB+yY2KVTkd65Wz/dxA5XZIIvlwGTP1vFvQZfM5uw8Etau33iZc9aoF
         uFbkR7uLY8kFQ/Jso5x0o+l48rNwIKMWPnohAhLtlIA/lLHQjlt/Bb9s8H7v++3pObGc
         4ZZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=oA5ehJckvw7eXMdXSJNblAhogSS2sQooQpSrTmJjXBA=;
        fh=sfk1GIo3z5a0omTeXyidxF+JEgkWY4irYk3xRpiAz2o=;
        b=NRBxeGYwxquBUj/fqSFKDHsPxzhsPSLHIoyQ/0Hg1vrW71uUADyOY42TIBoLeXLZ1U
         CMZSnMPZex0nMLml7itvHmgGpx6Uk9iSOUBrMsQrQJPTWIiUFSgDOuYwsu4fAcwewzne
         n1eqPsHG7E/7hE8Mg3venJLmmgauFnUNQtiwph/Kin7e+30GmoXgCWOiG/rbkxcv++cp
         QaP8wYFObN/EYke1YAwytxvGEWcdxrzO3pjae0Q8AuBfVL6A11AFp2xw9dzbplLi2qkS
         j5pllNF2JnpKf4/vLVdERyfNO/C0uWpbbSPlyrp+/nshxwu3ubFC23ztx0Ik8M45rwRk
         yPJw==;
        darn=lists.linaro.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771958885; x=1772563685; darn=lists.linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oA5ehJckvw7eXMdXSJNblAhogSS2sQooQpSrTmJjXBA=;
        b=R9Ifs61WCnsoUUnCdXieQbmo/i9v4CpfOKy7C+Y1jkKA2cQV7c2RFrRtTpeA5Wh9MJ
         gDKtNcDLQ1DF+/Q4M+OSTG+1qp7uHKaewkX1mrfw43kaQZQ8HGbP7JyS/D/SVnnmHG0N
         OKL2kzg54URACefVgiV6i29kJwFJumkiNdokmmFq8b++rNqJuuDBRy0oCaFmORjWnMXq
         w0czcJtkLB+L+Rrkl7pdKRFp4o6Q8GanC/zlum8B+SzyVQZl+bdwUuYUZZCDBnC8h9WX
         PV6m0pqX7MnoZly2oHz9JkyhjCuCroUDvZJwIexPz2VDHbLQBpe63VR/waffLX38jrfP
         uf4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771958885; x=1772563685;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oA5ehJckvw7eXMdXSJNblAhogSS2sQooQpSrTmJjXBA=;
        b=beNMdWRRYydD1IFHebYYcWw3oWK+7UwgvIKpOc6kcP/2DsA3R8js23IohaV6hZO0H8
         k6q0lw9n+gfFBaxFprVDD/3kn2YP6KVa35g2YBZXj3VM9VfYv24w4BbNP0SgHwW4TyHi
         Wj5eeDxMTbmJrswMKyH6v16MJfDUP91wINlTPB92C//HqTNO+pQsrEezNdkqfvIe7UHj
         siDbP2/MZjWGQ8h7fPuU42B5XS/TSOYV8XZAMWzg4UlWNd6acZ26cxPvOXZaQ9YfXXHo
         MtLuu53i9iNRCxZpNBU008yijEP+xGlaYXyiAuWOhk8v8Rx9Iagkzd37g8+Pb1753mbh
         Q0qw==
X-Forwarded-Encrypted: i=1; AJvYcCU2ARAP1z9l9v+Z9aIEwtIZIdcgn94KUZjo/2/yS59U5YWLP+69Nhdkn9I9azH2B9gG9D5CY1OGVZKGhQ==@lists.linaro.org
X-Gm-Message-State: AOJu0YzfJMdErB3df+fuh415dtXTrjdMj3fK3j5WE5fYHXRaDuCJ11vd
	V7YsaEnpha5g6rc1aTPIsEGOk7D5dpgdLk0QwkWNQIG5uZrHZ0I3K45Bsvw2VKWNpSoEoO6TTbx
	b9kfZmhQS80Mzbdfm/A6ejxCeCVYaT4Q=
X-Gm-Gg: ATEYQzziQ3KvkmhsgeLdPz9gMJokidkGtM641rnRaQhJoXbfg5ncxcvEEno4VbL6BCV
	jZRnW1SGvA5dSGH+kc6mHCeUd6WtHg9dg2shnq/RFDgu61FDMod/bAgp/NfIXAHMnZYGsAU6VJx
	OM/0RuMHp1di4fOI5SCKvUXStW4ObfR2khrBqJHX9voM56OzovvR/I2M48GAD40uyISec9tyZBA
	DDWVGisIeqd73Gv7cjhhBW+pJrYPAS+kC1aE0HWMBModvMKUnq+CNlrlWg8uVjsacOGQB9Hn3vt
	J49rCgGBg590c62hm3KGI+czKq/yt+Xat6wSyOF5moG4BM/TTQKm
X-Received: by 2002:a17:907:1b09:b0:b8f:1c:e815 with SMTP id
 a640c23a62f3a-b9081bad8d4mr946479466b.48.1771958884284; Tue, 24 Feb 2026
 10:48:04 -0800 (PST)
MIME-Version: 1.0
References: <20260223181158.13234-1-chakrabortyshubham66@gmail.com> <2026022438-gamma-blog-1561@gregkh>
In-Reply-To: <2026022438-gamma-blog-1561@gregkh>
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Date: Wed, 25 Feb 2026 00:17:52 +0530
X-Gm-Features: AaiRm51BcKsJ0XaFcQtbx4xHEw1dy5ZHm9ldUEAhHRGIfeQw8xGguMLrpvtA4xQ
Message-ID: <CABvxksyV_0tRsZXf9QJuNAoi7oHTEF9RzdRkKzZCE=jcYJiJSw@mail.gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
X-Spamd-Bar: ----
X-MailFrom: chakrabortyshubham66@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: SNUOL2NYXZV6FW4QEDDPYXVY6KEFGITM
X-Message-ID-Hash: SNUOL2NYXZV6FW4QEDDPYXVY6KEFGITM
X-Mailman-Approved-At: Wed, 25 Feb 2026 00:03:52 +0000
CC: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v3] staging: greybus: audio: Use sysfs_emit in show functions
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/SNUOL2NYXZV6FW4QEDDPYXVY6KEFGITM/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: multipart/mixed; boundary="===============8501432000798382127=="
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.59 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx];
	MIME_GOOD(-0.10)[multipart/mixed,multipart/alternative,text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:~,4:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chakrabortyshubham66@gmail.com,greybus-dev-bounces@lists.linaro.org];
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[greybus-dev];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	NEURAL_SPAM(0.00)[0.896];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,linuxfoundation.org:email,linaro.org:email,desc.name:url,lists.linaro.org:helo,lists.linaro.org:rdns]
X-Rspamd-Queue-Id: 34FB818E3F8
X-Rspamd-Action: no action

--===============8501432000798382127==
Content-Type: multipart/alternative; boundary="000000000000dabec7064b965339"

--000000000000dabec7064b965339
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Greg,

You are right. The \n additions were a mistake on my part =E2=80=94 the ori=
ginal
sprintf calls did not include \n and I should not have changed the output
behavior in the same patch.

I will send a v4 that does a pure mechanical conversion from sprintf to
sysfs_emit with no change in output, keeping the format strings identical
to the originals.

Thank you for the review.

Shubham

On Tue, Feb 24, 2026 at 11:40=E2=80=AFPM Greg Kroah-Hartman <
gregkh@linuxfoundation.org> wrote:

> On Mon, Feb 23, 2026 at 11:41:58PM +0530, Shubham Chakraborty wrote:
> > Refactor sprintf to sysfs_emit in all show functions of the greybus
> > audio manager module. This follows the standard kernel practice of
> > using sysfs_emit for sysfs attributes, ensuring consistent output
> > formatting and newline handling.
> >
> > Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
> > ---
> >
> > v3:
> >  - Add patch history below the --- line as requested by Greg KH.
> >
> > v2:
> >  - Add missing Signed-off-by line.
> >  - Wrap commit message at 72 characters.
> >
> >  drivers/staging/greybus/audio_manager_module.c | 12 ++++++------
> >  1 file changed, 6 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/staging/greybus/audio_manager_module.c
> b/drivers/staging/greybus/audio_manager_module.c
> > index e87b82ca6..f22ee73eb 100644
> > --- a/drivers/staging/greybus/audio_manager_module.c
> > +++ b/drivers/staging/greybus/audio_manager_module.c
> > @@ -76,7 +76,7 @@ static void gb_audio_module_release(struct kobject
> *kobj)
> >  static ssize_t gb_audio_module_name_show(struct gb_audio_manager_modul=
e
> *module,
> >                                          struct
> gb_audio_manager_module_attribute *attr, char *buf)
> >  {
> > -       return sprintf(buf, "%s", module->desc.name);
> > +       return sysfs_emit(buf, "%s\n", module->desc.name);
>
> You just changed the output of all of these sysfs files by adding "\n"
> to the end.  Why?
>
> I don't think that's wrong, BUT it is a user/kernel api change, so you
> need to document it, and ideally, that would happen in a separate change
> from this one.
>
> So can you do the conversion to sysfs_emit() with NO change in the
> output, and a second one to add the \n if you really think it is needed.
>
> And is it needed?  If so, why?  What tool uses these files and does it
> now still work?
>
> thanks,
>
> greg k-h
>

--000000000000dabec7064b965339
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><p class=3D"gmail-font-claude-response-body gmail-break-wo=
rds gmail-whitespace-normal gmail-leading-[1.7]">Hi Greg,</p><p class=3D"gm=
ail-font-claude-response-body gmail-break-words gmail-whitespace-normal gma=
il-leading-[1.7]">You are right. The \n additions were a mistake on my part=
 =E2=80=94 the original sprintf calls did not include \n and I should not h=
ave changed the output behavior in the same patch.</p><p class=3D"gmail-fon=
t-claude-response-body gmail-break-words gmail-whitespace-normal gmail-lead=
ing-[1.7]">I will send a v4 that does a pure mechanical conversion from spr=
intf to sysfs_emit with no change in output, keeping the format strings ide=
ntical to the originals.</p><p class=3D"gmail-font-claude-response-body gma=
il-break-words gmail-whitespace-normal gmail-leading-[1.7]">Thank you for t=
he review.</p><p class=3D"gmail-font-claude-response-body gmail-break-words=
 gmail-whitespace-normal gmail-leading-[1.7]">



</p><p class=3D"gmail-font-claude-response-body gmail-break-words gmail-whi=
tespace-normal gmail-leading-[1.7]">Shubham</p></div><br><div class=3D"gmai=
l_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue=
, Feb 24, 2026 at 11:40=E2=80=AFPM Greg Kroah-Hartman &lt;<a href=3D"mailto=
:gregkh@linuxfoundation.org">gregkh@linuxfoundation.org</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">On Mon, Feb 23, 2026=
 at 11:41:58PM +0530, Shubham Chakraborty wrote:<br>
&gt; Refactor sprintf to sysfs_emit in all show functions of the greybus<br=
>
&gt; audio manager module. This follows the standard kernel practice of<br>
&gt; using sysfs_emit for sysfs attributes, ensuring consistent output<br>
&gt; formatting and newline handling.<br>
&gt; <br>
&gt; Signed-off-by: Shubham Chakraborty &lt;<a href=3D"mailto:chakrabortysh=
ubham66@gmail.com" target=3D"_blank">chakrabortyshubham66@gmail.com</a>&gt;=
<br>
&gt; ---<br>
&gt; <br>
&gt; v3:<br>
&gt;=C2=A0 - Add patch history below the --- line as requested by Greg KH.<=
br>
&gt; <br>
&gt; v2:<br>
&gt;=C2=A0 - Add missing Signed-off-by line.<br>
&gt;=C2=A0 - Wrap commit message at 72 characters.<br>
&gt; <br>
&gt;=C2=A0 drivers/staging/greybus/audio_manager_module.c | 12 ++++++------=
<br>
&gt;=C2=A0 1 file changed, 6 insertions(+), 6 deletions(-)<br>
&gt; <br>
&gt; diff --git a/drivers/staging/greybus/audio_manager_module.c b/drivers/=
staging/greybus/audio_manager_module.c<br>
&gt; index e87b82ca6..f22ee73eb 100644<br>
&gt; --- a/drivers/staging/greybus/audio_manager_module.c<br>
&gt; +++ b/drivers/staging/greybus/audio_manager_module.c<br>
&gt; @@ -76,7 +76,7 @@ static void gb_audio_module_release(struct kobject *=
kobj)<br>
&gt;=C2=A0 static ssize_t gb_audio_module_name_show(struct gb_audio_manager=
_module *module,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 struct gb_audio_manager_module_attribute *attr, char *buf)<br>
&gt;=C2=A0 {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0return sprintf(buf, &quot;%s&quot;, module=
-&gt;<a href=3D"http://desc.name" rel=3D"noreferrer" target=3D"_blank">desc=
.name</a>);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return sysfs_emit(buf, &quot;%s\n&quot;, m=
odule-&gt;<a href=3D"http://desc.name" rel=3D"noreferrer" target=3D"_blank"=
>desc.name</a>);<br>
<br>
You just changed the output of all of these sysfs files by adding &quot;\n&=
quot;<br>
to the end.=C2=A0 Why?<br>
<br>
I don&#39;t think that&#39;s wrong, BUT it is a user/kernel api change, so =
you<br>
need to document it, and ideally, that would happen in a separate change<br=
>
from this one.<br>
<br>
So can you do the conversion to sysfs_emit() with NO change in the<br>
output, and a second one to add the \n if you really think it is needed.<br=
>
<br>
And is it needed?=C2=A0 If so, why?=C2=A0 What tool uses these files and do=
es it<br>
now still work?<br>
<br>
thanks,<br>
<br>
greg k-h<br>
</blockquote></div>

--000000000000dabec7064b965339--

--===============8501432000798382127==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

--===============8501432000798382127==--
