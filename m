Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 715F574867E
	for <lists+greybus-dev@lfdr.de>; Wed,  5 Jul 2023 16:37:34 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 30050413E0
	for <lists+greybus-dev@lfdr.de>; Wed,  5 Jul 2023 14:37:33 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	by lists.linaro.org (Postfix) with ESMTPS id 0215F3EF6B
	for <greybus-dev@lists.linaro.org>; Tue,  4 Jul 2023 09:00:39 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20221208 header.b=ncuOnvqc;
	spf=pass (lists.linaro.org: domain of islituo@gmail.com designates 209.85.208.182 as permitted sender) smtp.mailfrom=islituo@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2b69ed7d050so85698151fa.2
        for <greybus-dev@lists.linaro.org>; Tue, 04 Jul 2023 02:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688461237; x=1691053237;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gwsmGBw6iq4zpC21lit8Yc2cNVPBKyoDscm8/pa0hjI=;
        b=ncuOnvqcmZFLoIuvKBeHBd2qVVsdHvRNlZ90oBrmc56TsB6ltjTp5Qd0Q9vHE2p7gb
         xGLkJ78NsR1zjAAtsXzq4uJ8Iy4NfFGwopvFvSWza7LOV/IAdpWQZCUY12jMTHpdjYuX
         iJr1rFnChO/DEAXYbrIeDJZ7SlB6xY52GFks1XePnfVdELDlxz7gFd9Yu2d6meGnS3hc
         c8wcigbQMltrHMLoWMK78p+WWw40DXCDiFpbZJpf7L48ko4ryldwyaRZqzwsgCI4UHpQ
         yu4gYJXNvGkdv0yLgW3DhQbHNSpUZssYdE637WtzpxBY/uSLnzZCjc+xCUohoeW4/jK7
         Vftg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688461237; x=1691053237;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gwsmGBw6iq4zpC21lit8Yc2cNVPBKyoDscm8/pa0hjI=;
        b=TX+xoscQMuAbl8Q91YX+WG+60k9nOEzqM0ATevp4SVdXTfaIAM0DnkIag+5hMUy6MT
         QL6l/D+PfzhpSUCnFnobcb2/vopYAoGB9CV1PgPznDRDoO72+BOSkZ39OBqKPRcNq4xs
         dlKmvlPtJsiBuJ1iqHn2tMcjjCsvMqflDfR4OD9YHofRpBsWF5OPUKdz6IDyLbluc/wM
         2eXbCfnNC1apuPiTnjP9ZOHMjGiSNgWnz8e8sjb9ly9Ic0eZQHf4e6vBfFJ2/P0bgAI9
         dvHYOOYLTzm2TxporsY1xzWRnkpQTrX01jpfCX2Y0cWt5EhMm7/C82UN6L5YBBorIgSm
         i2Yg==
X-Gm-Message-State: ABy/qLaS1J/mRWX4mUmhIxkwhjE6OGFtrXqLi7f7ahqQMyuGz3OL6Dqb
	PiLV3oBsfnUiN+nJDa6kk5xqy3KlvgE0GqIeyV4=
X-Google-Smtp-Source: APBJJlEo3WZ6vmoBQPNT6CdhjL4c2f2oGBwAe3/3TvGnnC3oQHkE7dA2qmSRFz+DMU/N5U4Xh0xm5ntCPfHevQLAFZA=
X-Received: by 2002:a19:5002:0:b0:4fb:9469:d65f with SMTP id
 e2-20020a195002000000b004fb9469d65fmr8221694lfb.37.1688461237411; Tue, 04 Jul
 2023 02:00:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230626084339.998784-1-islituo@gmail.com> <2023070352-upscale-bankable-76a7@gregkh>
In-Reply-To: <2023070352-upscale-bankable-76a7@gregkh>
From: Tuo Li <islituo@gmail.com>
Date: Tue, 4 Jul 2023 17:00:27 +0800
Message-ID: <CADm8TekvdE9HR3_WreztGx=p8VRXjR=wZiKkgrHDsDUotvpafA@mail.gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
X-Spamd-Result: default: False [-8.00 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[99.99%];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20221208];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-0.999];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,lists.linaro.org,lists.linux.dev,vger.kernel.org,outlook.com,buaa.edu.cn];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCVD_COUNT_ONE(0.00)[1];
	FROM_EQ_ENVFROM(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_TLS_LAST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	DWL_DNSWL_NONE(0.00)[gmail.com:dkim];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.208.182:from]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 0215F3EF6B
X-Spamd-Bar: -------
X-MailFrom: islituo@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: MH6IBSCKS4AMEE2OVAB64Z3S5PRMKAFW
X-Message-ID-Hash: MH6IBSCKS4AMEE2OVAB64Z3S5PRMKAFW
X-Mailman-Approved-At: Wed, 05 Jul 2023 14:37:27 +0000
CC: dtwlin@gmail.com, johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, baijiaju1990@outlook.com, BassCheck <bass@buaa.edu.cn>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: fix a possible data-inconsistency due to data race in get_serial_info()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/MH6IBSCKS4AMEE2OVAB64Z3S5PRMKAFW/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: multipart/mixed; boundary="===============5755392528011268545=="

--===============5755392528011268545==
Content-Type: multipart/alternative; boundary="00000000000045e47005ffa58433"

--00000000000045e47005ffa58433
Content-Type: text/plain; charset="UTF-8"

Thanks for your reply!


> > The variables gb_tty->port.close_delay and gb_tty->port.closing_wait are
> > ofter accessed together while holding the lock gb_tty->port.mutex. Here
> is
> > an example in set_serial_info():
> >
> >   mutex_lock(&gb_tty->port.mutex);
> >   ...
> >   gb_tty->port.close_delay = close_delay;
> >   gb_tty->port.closing_wait = closing_wait;
> >   ...
> >   mutex_unlock(&gb_tty->port.mutex);
> >
> > However, they are accessed without holding the lock gb_tty->port.mutex
> when
> > are accessed in get_serial_info():
> >
> >   ss->close_delay = jiffies_to_msecs(gb_tty->port.close_delay) / 10;
> >   ss->closing_wait =
> >     gb_tty->port.closing_wait == ASYNC_CLOSING_WAIT_NONE ?
> >       ASYNC_CLOSING_WAIT_NONE :
> >       jiffies_to_msecs(gb_tty->port.closing_wait) / 10;
> >
> > In my opinion, this may be a harmful race, because ss->close_delay can be
> > inconsistent with ss->closing_wait if gb_tty->port.close_delay and
> > gb_tty->port.closing_wait are updated by another thread after the
> > assignment to ss->close_delay.
>
> And how can that happen?
>

I am sorry that this data race is reported by a static analysis tool, and
thus I do not know how to write a test case to trigger this data race.

Also you have trailing whitespace in your changelog text :(
>

I am sorry to bother you, and I will be careful in the subsequent patches.

> Besides, the select operator may return wrong value if
> > gb_tty->port.closing_wait is updated right after the condition is
> > calculated.
> >
> > To fix this possible data-inconsistency caused by data race, a lock and
> > unlock pair is added when accessing different fields of gb_tty->port.
> >
> > Reported-by: BassCheck <bass@buaa.edu.cn>
>
> As per the documentation for research tools like this, you need to
> explain how this was tested.
>

I use a static analysis tool to detect this possible data race. It first
collects
all struct fields that may be protected by a lock when accessed. And then,
for each of such struct fields, it calculates the proportion of the
protected
accesses in all accesses. If the proportion is greater than a given
threshold,
the tool generates warnings for those unprotected field accesses.
Any suggestion on this static analysis tool will be appreciated.

Sincerely,
Tuo Li

--00000000000045e47005ffa58433
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thanks for your reply!</div><div>=C2=A0</div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex"><span style=3D"color:rgb(80,0,80)=
">&gt; The variables gb_tty-&gt;port.close_delay and gb_tty-&gt;port.closin=
g_wait are<br>&gt; ofter accessed together while holding the lock gb_tty-&g=
t;port.mutex. Here is<br>&gt; an example in set_serial_info():<br>&gt;<br>&=
gt;=C2=A0 =C2=A0mutex_lock(&amp;gb_tty-&gt;port.mutex);<br>&gt;=C2=A0 =C2=
=A0...<br>&gt;=C2=A0 =C2=A0gb_tty-&gt;port.close_delay =3D close_delay;<br>=
&gt;=C2=A0 =C2=A0gb_tty-&gt;port.closing_wait =3D closing_wait;<br>&gt;=C2=
=A0 =C2=A0...<br>&gt;=C2=A0 =C2=A0mutex_unlock(&amp;gb_tty-&gt;port.mutex);=
<br>&gt;<br>&gt; However, they are accessed without holding the lock gb_tty=
-&gt;port.mutex when<br>&gt; are accessed in get_serial_info():<br>&gt;<br>=
&gt;=C2=A0 =C2=A0ss-&gt;close_delay =3D jiffies_to_msecs(gb_tty-&gt;port.cl=
ose_delay) / 10;<br>&gt;=C2=A0 =C2=A0ss-&gt;closing_wait =3D<br>&gt;=C2=A0 =
=C2=A0 =C2=A0gb_tty-&gt;port.closing_wait =3D=3D ASYNC_CLOSING_WAIT_NONE ?<=
br>&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0ASYNC_CLOSING_WAIT_NONE :<br>&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0jiffies_to_msecs(gb_tty-&gt;port.closing_wait) / 10;<br=
>&gt;<br>&gt; In my opinion, this may be a harmful race, because ss-&gt;clo=
se_delay can be<br>&gt; inconsistent with ss-&gt;closing_wait if gb_tty-&gt=
;port.close_delay and<br>&gt; gb_tty-&gt;port.closing_wait are updated by a=
nother thread after the<br>&gt; assignment to ss-&gt;close_delay.<br><br></=
span>And how can that happen?<br></blockquote><div>=C2=A0</div><div>I am so=
rry that this data race is reported by a static analysis tool, and=C2=A0</d=
iv><div>thus I do not know how to write a test case to trigger this data ra=
ce.</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">A=
lso you have trailing whitespace in your changelog text :(<br></blockquote>=
<div><br></div><div>I am sorry to bother you, and I will be careful in the=
=C2=A0subsequent patches.</div><div><br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">&gt; Besides, the select operator may return wrong val=
ue if<br>&gt; gb_tty-&gt;port.closing_wait is updated right after the condi=
tion is<br>&gt; calculated.<br>&gt;<br>&gt; To fix this possible data-incon=
sistency caused by data race, a lock and<br>&gt; unlock pair is added when =
accessing different fields of gb_tty-&gt;port.<br>&gt;<br>&gt; Reported-by:=
 BassCheck &lt;<a href=3D"mailto:bass@buaa.edu.cn" target=3D"_blank">bass@b=
uaa.edu.cn</a>&gt;<br><br>As per the documentation for research tools like =
this, you need to<br>explain how this was tested.<br></blockquote><div><br>=
</div><div>I use a static analysis tool to detect this possible data race. =
It first collects</div><div>all struct fields that may be protected by a lo=
ck when accessed. And then,=C2=A0</div><div>for each of such struct fields,=
 it calculates the proportion of the protected=C2=A0</div><div>accesses in =
all accesses. If the proportion is greater than a given threshold,=C2=A0</d=
iv><div>the tool generates warnings for those unprotected field accesses.</=
div><div>Any suggestion on this static analysis tool will be appreciated.</=
div><div><br></div><div>Sincerely,</div><div>Tuo Li</div></div>

--00000000000045e47005ffa58433--

--===============5755392528011268545==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

--===============5755392528011268545==--
