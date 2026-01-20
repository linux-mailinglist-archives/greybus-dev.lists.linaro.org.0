Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uEInMzGnb2lDEgAAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Tue, 20 Jan 2026 17:02:57 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 625BD4700E
	for <lists+greybus-dev@lfdr.de>; Tue, 20 Jan 2026 17:02:57 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 887473FDB0
	for <lists+greybus-dev@lfdr.de>; Tue, 20 Jan 2026 12:58:12 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	by lists.linaro.org (Postfix) with ESMTPS id BB3E13F70D
	for <greybus-dev@lists.linaro.org>; Tue, 20 Jan 2026 07:23:58 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=ARbucG06;
	spf=pass (lists.linaro.org: domain of jun85566@gmail.com designates 209.85.214.179 as permitted sender) smtp.mailfrom=jun85566@gmail.com;
	arc=pass ("google.com:s=arc-20240605:i=1");
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-29f0f875bc5so35295755ad.3
        for <greybus-dev@lists.linaro.org>; Mon, 19 Jan 2026 23:23:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768893838; cv=none;
        d=google.com; s=arc-20240605;
        b=Ph2uR425K7sT7ImuqJ261znjy02yZUFdQ1jaeMDRtMAKW3zwLfCd7PQ2jANjqYUb8B
         q9UqEt9khLW5yeR6zL6dUHBQQqeMKdiLZMtYqDUZVU6Z+RAa1RZnH6GEBnJugxBabASs
         YBL9aI3GjQpc2Orb9KNNG/J9OcPRz6g93DQTleATTzXGfm7NdilrUPTAE2SGQu//LvYG
         vCzp2Uxt/u5IywXb/N6CcEwxGjCwLoqKMcbGh+d1uA28JT8/2xR+cmjaMr5zNctY31lV
         oVvIJFbQoO/0/HOgFVcTSeHqqJgfzi7teoXhnI9t6I1PrS7P/XWejuVH8WaHhQtaehav
         9URw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=EnliosyHDEGnpgSL8tbT63Ew46yeV+oannBBYWEYkSA=;
        fh=8UubNYHhgcIPPfUWo4WZYZip8L6vzVr2ctH2aQ4zAaw=;
        b=I3evMyKq2MttzhRZeNGopYUe+HgNcEkTzFZ/V060p7+YUKMynw+kHRkKYnvzLTqI4X
         QBpswqohluXoy1mJOAk66f19WfzojUY88SxW23AcG63gjEiJgfGOfc5jUsg+5Nboj5EM
         uSSzuVEIqanQXK+pd4U2fHViQeY6q3i0sr5PgGMFtdhK1M6DhbttnRPZEn6wptC+EQre
         GVxm0Ho7TENSpqFEUbc0gt19ghVQd7xxjKJ8k+TYpfWvX70WeHZcfKDoyuE1xegsnj4L
         8fgpHkLfUj2xE6v+fh4kpl0c9/4iT4sezPr8bD6ct+e3hwRdyBjFIEXwIfz3/Wn3RpSt
         qUnw==;
        darn=lists.linaro.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768893838; x=1769498638; darn=lists.linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EnliosyHDEGnpgSL8tbT63Ew46yeV+oannBBYWEYkSA=;
        b=ARbucG06Yj1lNR7GFQjz+eg5ePR2obW9uyBXTAeX7rX3j99hQnP/KzptcR+p9NxDH0
         fs/zfV1SVs0PvNJfLIW1SNecz04kS5dCE4YGTtIPZs3e2yDrOG6Ol6gLmm/24o4BqoIx
         x3qSGm2TPZkS1RQVhjvNETSynyx6malEiIVHd0qYjRTD5i+rP/t+aXOo8KgLo9bhXCql
         jDx5+LyKtbP/fsfXe8UMCYoBMwOwWvewQIo3xDXnJh2toZqmm52laDOqkl/BSnJWajjc
         gffcLOAJ42+gHKox2bowPlv2ePmk12ziYCGL4RQrusrF5pGVkKSun7NIzKWGz3ISPbhd
         aXrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768893838; x=1769498638;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EnliosyHDEGnpgSL8tbT63Ew46yeV+oannBBYWEYkSA=;
        b=bf100Qd0Lxv3Le7Y5WKgRvJPRkkVrAA6WFbUh3FJe6NHDAZEnbn7zrPfHbfG8FA+jB
         NiZ5ur2nRiY54Qa7O/ANsPAamZ7tKkONeuVZ4up0GVg+/zKx5V3t72PouKTGdF+GgtC0
         /o5yP3A/GxogrrTq2vzoAZz6f6Anzy83DZgVLEZz9ACtcXqgm+O9jMngulhTex/ahzIg
         Jw/BOPUjyVAOt4wFedFZUJVaWIzAHSbXeEt9JBM+2b4T77zDbYeTxA1x9+iupKiZOYuM
         5NeQSQRJDkyHNdOe201ZSwb0rmd73LPd0bXnHS5CksjH46LPmKaX5pqBaE0dlDfbNVb3
         iMHQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/Kgfn3keC7jsKRpy98GC1ja6MRgLk24UQ0u8yLy8ruqCw5qw1ViiR7vpI1Tcqo/47u+ffv/gBgZnxwg==@lists.linaro.org
X-Gm-Message-State: AOJu0Yxpd0uKiEJCyGO04XN67W9dC5Dm95NCDY1iP/GDnd08sMZD/n0y
	6C/ghj1VmFgqBiLWArVcB4woY6DPoTqDTR0VxjQaSUBzXUSNt1OlEpXsi4JcKoqQiauPtLqq+xZ
	mvpzPW0L31q0L3q80swLz2a8yrbDX+98=
X-Gm-Gg: AZuq6aJhIOzEa8kaiUGLeeoE3AzQLOLFeMuj3hFt3cw0nYI/jpxqCZTcIGFPdJZfThv
	pnTu8Xfgw9xy/zcyf62qzC7Y03fJEQStVjom9LRswUNGGHRVv+mOjKUuArhh/+FEazLkL2NahHm
	F33jMLdGPEfMZuxuWEMFLpJKq3S/Sq+GbdAk4wALWpbwix0Wlyw05itCHMpH4lD6TU9R+ApBO6U
	Ag+Pe+Su4laT2rC+NtwXyKoKz1Sqt5FGowUPX6q4/1A9kl7OSJq4B8wgzHQ27cKWI+NKg==
X-Received: by 2002:a17:902:d583:b0:2a7:682b:5098 with SMTP id
 d9443c01a7336-2a7682b5178mr9089905ad.9.1768893837742; Mon, 19 Jan 2026
 23:23:57 -0800 (PST)
MIME-Version: 1.0
References: <20260120070701.3689-1-jun85566@gmail.com> <2026012002-postal-fancy-8329@gregkh>
In-Reply-To: <2026012002-postal-fancy-8329@gregkh>
From: Jun <jun85566@gmail.com>
Date: Tue, 20 Jan 2026 16:23:45 +0900
X-Gm-Features: AZwV_QgysPY9d9qdRI_uFy-ZwWOWY0UeffyV6zH83YAz5XbkdctWHATOEuhdmJ4
Message-ID: <CAJ_OVWSVdxwGxPfyTeTuv4fjWdxro+HQ3nVoeD_fvr3qQ4guEA@mail.gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
X-Spamd-Bar: -----
X-MailFrom: jun85566@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: CIKGS4QO7P3LNFTD6Z7KPWC5EZAVZXCT
X-Message-ID-Hash: CIKGS4QO7P3LNFTD6Z7KPWC5EZAVZXCT
X-Mailman-Approved-At: Tue, 20 Jan 2026 12:58:03 +0000
CC: johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: audio: Limit scope of jack-related variables
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/CIKGS4QO7P3LNFTD6Z7KPWC5EZAVZXCT/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: multipart/mixed; boundary="===============1787958309261531752=="
X-Spamd-Result: default: False [1.59 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+mx];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[multipart/mixed,multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:~,4:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jun85566@gmail.com,greybus-dev-bounces@lists.linaro.org];
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[greybus-dev];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,mail.gmail.com:mid,lists.linaro.org:rdns,lists.linaro.org:helo,linuxfoundation.org:email]
X-Rspamd-Queue-Id: 625BD4700E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

--===============1787958309261531752==
Content-Type: multipart/alternative; boundary="000000000000d818050648ccb0aa"

--000000000000d818050648ccb0aa
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Understood, thank you for the clarification.
I'll keep the variable definitions at the top of the scope as suggested and
won't pursue this change further.

Thanks for the feedback,

Lee Yongjun

2026=EB=85=84 1=EC=9B=94 20=EC=9D=BC (=ED=99=94) PM 4:09, Greg KH <gregkh@l=
inuxfoundation.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:

> On Tue, Jan 20, 2026 at 04:07:01PM +0900, Lee Yongjun wrote:
> > Move jack-related variable declarations inside the CONFIG_SND_JACK
> > conditional block.
> >
> > These variables are only used when CONFIG_SND_JACK is enabled, so
> > limiting their scope improves code clarity and avoids unused variable
> > warnings when the option is disabled.
> >
> > No functional changes intended.
> >
> > Signed-off-by: Lee Yongjun <jun85566@gmail.com>
> > ---
> >  drivers/staging/greybus/audio_codec.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/staging/greybus/audio_codec.c
> b/drivers/staging/greybus/audio_codec.c
> > index 444c53b4e08d..f752d5fbd685 100644
> > --- a/drivers/staging/greybus/audio_codec.c
> > +++ b/drivers/staging/greybus/audio_codec.c
> > @@ -935,8 +935,6 @@ static void gbaudio_codec_cleanup(struct
> gbaudio_module_info *module)
> >  void gbaudio_unregister_module(struct gbaudio_module_info *module)
> >  {
> >       struct snd_soc_component *comp =3D gbcodec->component;
> > -     struct gbaudio_jack *jack, *n;
> > -     int mask;
> >
> >       dev_dbg(comp->dev, "Unregister %s module\n", module->name);
> >
> > @@ -948,6 +946,8 @@ void gbaudio_unregister_module(struct
> gbaudio_module_info *module)
> >       mutex_unlock(&gbcodec->lock);
> >
> >  #ifdef CONFIG_SND_JACK
> > +     struct gbaudio_jack *jack, *n;
> > +     int mask;
> >       /* free jack devices for this module jack_list */
>
> Please no, let's keep the variable definitions at the top of the scope
> please.  The compiler will handle this just fine if they aren't used due
> to the config option not being enabled.
>
> thanks,
>
> greg k-h
>

--000000000000d818050648ccb0aa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Understood, thank you for the clarification.<div>I&#39;ll =
keep the variable definitions at the top of the scope as suggested and won&=
#39;t pursue this change further.</div><div><br></div><div>Thanks for the f=
eedback,</div><div><br></div><div>Lee Yongjun</div></div><br><div class=3D"=
gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">20=
26=EB=85=84 1=EC=9B=94 20=EC=9D=BC (=ED=99=94) PM 4:09, Greg KH &lt;<a href=
=3D"mailto:gregkh@linuxfoundation.org">gregkh@linuxfoundation.org</a>&gt;=
=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">On Tue, Jan 20, 2026 at 04:07:01PM +0900, Lee Yongju=
n wrote:<br>
&gt; Move jack-related variable declarations inside the CONFIG_SND_JACK<br>
&gt; conditional block.<br>
&gt; <br>
&gt; These variables are only used when CONFIG_SND_JACK is enabled, so<br>
&gt; limiting their scope improves code clarity and avoids unused variable<=
br>
&gt; warnings when the option is disabled.<br>
&gt; <br>
&gt; No functional changes intended.<br>
&gt; <br>
&gt; Signed-off-by: Lee Yongjun &lt;<a href=3D"mailto:jun85566@gmail.com" t=
arget=3D"_blank">jun85566@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 drivers/staging/greybus/audio_codec.c | 4 ++--<br>
&gt;=C2=A0 1 file changed, 2 insertions(+), 2 deletions(-)<br>
&gt; <br>
&gt; diff --git a/drivers/staging/greybus/audio_codec.c b/drivers/staging/g=
reybus/audio_codec.c<br>
&gt; index 444c53b4e08d..f752d5fbd685 100644<br>
&gt; --- a/drivers/staging/greybus/audio_codec.c<br>
&gt; +++ b/drivers/staging/greybus/audio_codec.c<br>
&gt; @@ -935,8 +935,6 @@ static void gbaudio_codec_cleanup(struct gbaudio_m=
odule_info *module)<br>
&gt;=C2=A0 void gbaudio_unregister_module(struct gbaudio_module_info *modul=
e)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct snd_soc_component *comp =3D gbcodec-&=
gt;component;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0struct gbaudio_jack *jack, *n;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0int mask;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0dev_dbg(comp-&gt;dev, &quot;Unregister %s mo=
dule\n&quot;, module-&gt;name);<br>
&gt;=C2=A0 <br>
&gt; @@ -948,6 +946,8 @@ void gbaudio_unregister_module(struct gbaudio_modu=
le_info *module)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0mutex_unlock(&amp;gbcodec-&gt;lock);<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 #ifdef CONFIG_SND_JACK<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct gbaudio_jack *jack, *n;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int mask;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* free jack devices for this module jack_li=
st */<br>
<br>
Please no, let&#39;s keep the variable definitions at the top of the scope<=
br>
please.=C2=A0 The compiler will handle this just fine if they aren&#39;t us=
ed due<br>
to the config option not being enabled.<br>
<br>
thanks,<br>
<br>
greg k-h<br>
</blockquote></div>

--000000000000d818050648ccb0aa--

--===============1787958309261531752==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

--===============1787958309261531752==--
