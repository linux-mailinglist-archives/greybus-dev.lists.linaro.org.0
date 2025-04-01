Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id B27FDA771A7
	for <lists+greybus-dev@lfdr.de>; Tue,  1 Apr 2025 02:04:15 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id ABB0B4488F
	for <lists+greybus-dev@lfdr.de>; Tue,  1 Apr 2025 00:04:14 +0000 (UTC)
Received: from mail-yb1-f193.google.com (mail-yb1-f193.google.com [209.85.219.193])
	by lists.linaro.org (Postfix) with ESMTPS id 1C33044893
	for <greybus-dev@lists.linaro.org>; Tue,  1 Apr 2025 00:03:28 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=Ez3HYiZR;
	spf=pass (lists.linaro.org: domain of ganeshkpittala@gmail.com designates 209.85.219.193 as permitted sender) smtp.mailfrom=ganeshkpittala@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-yb1-f193.google.com with SMTP id 3f1490d57ef6-e573136107bso4830478276.3
        for <greybus-dev@lists.linaro.org>; Mon, 31 Mar 2025 17:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743465807; x=1744070607; darn=lists.linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=C7vBALgDbLbPZJGJs0qgLSOpivWk46R3NCMNVl9/pE0=;
        b=Ez3HYiZRdsbx1n0UmHHBV6p8lerNr7HFiVvJxOEDXYoZTGttXxJrS3fdoL5nwxBkWN
         kQLISz+VicT0dW/zl/phmimI19Vof2xdJEKVhuQwlGJxPgP3cySfjZhbGMPl+sUl1PJf
         Fo66YMLcmJw1EwQ67bYCQHzzwCFeU9bZAKHzycwlRIY4GEIsRsE94QF6TxQOpFzCEg8S
         q9acd2kTF1W7+/HUhSdkmth4PUMTmcBp5eHXKVcH6NIf31cUPmt7Oh1qHhNSN8TR8D0m
         tH4vHtOkNjMJRqewf21joysmkzZdUWzaYEMzYoAburILliL8Ew1TSUsQ7Mt4vLNTyHNx
         jeVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743465807; x=1744070607;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C7vBALgDbLbPZJGJs0qgLSOpivWk46R3NCMNVl9/pE0=;
        b=CqcN3bJ46HOGPulz9NWNAWKKaVGWP6O27WtiFRqZoGaa2pGLqT36GQUKsNsjTliohG
         F0NwBrvXqa7hTjrvgJ1E0DARKCGFEOkti9QbgY+WJ9PzCxgMtAVVI8is1f2OY+Qi2XOf
         P4rWtjWYbnZxF2DXtbYziDHNmj3Gwd3UC2RKz4ZycYqkOV8C0qEqgRLzTb46iqZZLvlV
         n3kjAq3vYtcl8RwJYb9pxKKbyvkEIXIEuTqO2ZrODgCweSEzSpzE8lsIiz8GXVlGf23p
         1inp5dlIGXIBgSyOCcyiqMCzhgDb6+lbI3mHwz8juaSKNhfOMYCWouMwdsA3dRsDOQ9I
         t0PA==
X-Forwarded-Encrypted: i=1; AJvYcCXok9OpDRoMIsDN7+9LQmSwRJuKFXVeCgiQlaQ4oEZI94mg6YknGmbwe7C1uQHSzpa4QdJmPV7IIYY9dA==@lists.linaro.org
X-Gm-Message-State: AOJu0Yy0M3dT+st37CB6aR1JM+ZUy8HFDxtFxtNMdxVHc0VVdY0V8+5X
	izxSpMduXpccKVwLUAtMIXJkNGjrSLkY4slO37ZzZd2Q7GwFTdEab4oxaLPOsQwf4fYzfqmhZ3I
	TJ2kduZbE6JpST5EqbfgZ41Zsx1g=
X-Gm-Gg: ASbGncvwWPBWSjuemtB6JKkem56vSrrKArJdYK9vGoWD7njhkz0/ITRSd96udnKrLbT
	hodVPh6N2pKMN3jwwOvVzvqqF7BK7WzZWQxS3QkSxw/FNNPagwkZ1Q8LAbLUw4WtFpiayUvTsQz
	3SSc3rOumVvA7PS19S6red6iTjB0c6NOyhs4fBK9NlmNx+HWgDPfPGFU7/XfT0TrJRh9utPA==
X-Google-Smtp-Source: AGHT+IF8d+eOn5WXQzZSsznMPOsLvrn831hTi5UJldRnKidp5jv2vulOpc1E2RauT/dk12ZbQp4/9Nf0IAObpwmjMsc=
X-Received: by 2002:a05:690c:3383:b0:6fd:359a:8fd2 with SMTP id
 00721157ae682-702572f19d4mr154042267b3.26.1743465807612; Mon, 31 Mar 2025
 17:03:27 -0700 (PDT)
MIME-Version: 1.0
References: <20250331213337.6171-1-ganeshkpittala@gmail.com> <d683962c-e8b7-4adc-9902-483976197637@riscstar.com>
In-Reply-To: <d683962c-e8b7-4adc-9902-483976197637@riscstar.com>
From: Ganesh Kumar Pittala <ganeshkpittala@gmail.com>
Date: Mon, 31 Mar 2025 20:03:16 -0400
X-Gm-Features: AQ5f1JrEMEknNs26VD3nkWz7l4RkbHnzL5cbj-DKvACRBU-OwJtNvbLD9Q7xc5s
Message-ID: <CALVXb-qDioGFAfmtJPu_jVR_5G7VfC2bDD_bvjicbrVZKkc=hA@mail.gmail.com>
To: Alex Elder <elder@riscstar.com>
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 1C33044893
X-Spamd-Bar: --
X-Spamd-Result: default: False [-3.00 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[99.99%];
	RBL_SENDERSCORE_REPUT_3(2.50)[209.85.219.193:from];
	SUSPICIOUS_RECIPS(1.50)[];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	BAD_REP_POLICIES(0.10)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[kernel.org,linuxfoundation.org,gmail.com,animalcreek.com,nexus-software.ie,lists.linaro.org,lists.linux.dev,vger.kernel.org];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	R_DKIM_ALLOW(0.00)[gmail.com:s=20230601];
	RCVD_TLS_LAST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[gmail.com,none];
	DKIM_TRACE(0.00)[gmail.com:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-0.445];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.219.193:from];
	RCVD_COUNT_ONE(0.00)[1];
	TAGGED_RCPT(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	R_SPF_ALLOW(0.00)[+ip4:209.85.128.0/17];
	FREEMAIL_ENVFROM(0.00)[gmail.com]
X-Rspamd-Action: no action
X-MailFrom: ganeshkpittala@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: PA7YW3PVZ5JRYHBLFS3E2VVPBOKKOILN
X-Message-ID-Hash: PA7YW3PVZ5JRYHBLFS3E2VVPBOKKOILN
X-Mailman-Approved-At: Tue, 01 Apr 2025 00:04:11 +0000
CC: johan@kernel.org, elder@kernel.org, hvaibhav.linux@gmail.com, pure.logic@nexus-software.ie, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: Multiple cleanups and refactors
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/PA7YW3PVZ5JRYHBLFS3E2VVPBOKKOILN/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: multipart/mixed; boundary="===============0621507830379993121=="

--===============0621507830379993121==
Content-Type: multipart/alternative; boundary="0000000000002418390631ac44d1"

--0000000000002418390631ac44d1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alex,

Thank you for the detailed feedback and guidance. I appreciate your time
reviewing the patch.

I=E2=80=99ll split the changes into separate patches as suggested and send =
a v2
shortly.

Best regards,
Ganesh Pittala

On Mon, Mar 31, 2025 at 7:49=E2=80=AFPM Alex Elder <elder@riscstar.com> wro=
te:

> On 3/31/25 4:33 PM, gpittala wrote:
> > This patch includes multiple meaningful cleanups for the Greybus stagin=
g
> driver:
> >
> > 1. firmware.c: Replaced deprecated 'strncpy()' with 'strscpy()'
>
> This is a good type of change to make.
>
> > 2. sysfs show functions: Replaced 'sprintf()' with 'sysfs_emit()'
>
> This is also an improvement.
>
> > 3. loopback.c: Refactored a large function (gp_loopback_fn) to improve
> readability
>
> I have only glanced at this, but refactoring something can
> sometimes be clearer if you do it in several small patches.
>
> > 4. audio_gb.c: Split logic in get_topology() into separate calls as per
> TODO
>
> I'll comment more below, but you should almost always have
> only one change per patch.  So each of the four items listed
> above deserves its own patch.  You could send them separately
> (because they're unrelated), or as a series of cleanups.
>
> Note that "one change per patch" is a logical (not literal)
> statement.  For example, you could do a single patch that
> replaces *all* calls to strncpy() with strcspy().
>
> > All changes are tested and pass checkpatch.pl
> >
> > Signed-off-by: gpittala <ganeshkpittala@gmail.com>
> > ---
> >   .../greybus/Documentation/firmware/firmware.c |  32 ++--
> >   drivers/staging/greybus/arche-apb-ctrl.c      |  11 +-
> >   drivers/staging/greybus/arche-platform.c      |  11 +-
> >   drivers/staging/greybus/audio_gb.c            |  37 +++-
> >   .../staging/greybus/audio_manager_module.c    |  13 +-
> >   drivers/staging/greybus/gbphy.c               |   3 +-
> >   drivers/staging/greybus/light.c               |   5 +-
> >   drivers/staging/greybus/loopback.c            | 170 ++++++++++-------=
-
> >   8 files changed, 159 insertions(+), 123 deletions(-)
> >
> > diff --git a/drivers/staging/greybus/Documentation/firmware/firmware.c
> b/drivers/staging/greybus/Documentation/firmware/firmware.c
> > index 765d69faa9cc..8e375c88c881 100644
> > --- a/drivers/staging/greybus/Documentation/firmware/firmware.c
> > +++ b/drivers/staging/greybus/Documentation/firmware/firmware.c
> > @@ -47,12 +47,12 @@ static int update_intf_firmware(int fd)
> >       ret =3D ioctl(fd, FW_MGMT_IOC_GET_INTF_FW, &intf_fw_info);
> >       if (ret < 0) {
> >               printf("Failed to get interface firmware version: %s
> (%d)\n",
> > -                     fwdev, ret);
> > +                    fwdev, ret);
>
> The two changes in this hunk are not mentioned in the
> description above.  Please remove these changes.  If
> you want to do reformatting like this, do it in a
> separate patch.
>
> While it might be reasonable to include a little white
> space change like this occasionally, you should avoid
> doing it.  It is unrelated, and complicates your patch
> unnecessarily.
>
> This comment applies to several other changes you've
> made below.  It also applies to removal (or addition) of
> blank lines, or really, any other white space changes.
>
>                                         -Alex
>
> >               return -1;
> >       }
> >
> >       printf("Interface Firmware tag (%s), major (%d), minor (%d)\n",
> > -             intf_fw_info.firmware_tag, intf_fw_info.major,
> > +            intf_fw_info.firmware_tag, intf_fw_info.major,
> >               intf_fw_info.minor);
> >
> >       /* Try Interface Firmware load over Unipro */
> . . .
>

--0000000000002418390631ac44d1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><p class=3D"gmail-">Hi Alex,</p>
<p class=3D"gmail-">Thank you for the detailed feedback and guidance. I app=
reciate your time reviewing the patch.</p>
<p class=3D"gmail-">I=E2=80=99ll split the changes into separate patches as=
 suggested and send a v2 shortly.</p>
<p class=3D"gmail-">Best regards,<br>
Ganesh Pittala</p></div><br><div class=3D"gmail_quote gmail_quote_container=
"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Mar 31, 2025 at 7:49=E2=80=
=AFPM Alex Elder &lt;<a href=3D"mailto:elder@riscstar.com">elder@riscstar.c=
om</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">On 3/31/25 4:33 PM, gpittala wrote:<br>
&gt; This patch includes multiple meaningful cleanups for the Greybus stagi=
ng driver:<br>
&gt; <br>
&gt; 1. firmware.c: Replaced deprecated &#39;strncpy()&#39; with &#39;strsc=
py()&#39;<br>
<br>
This is a good type of change to make.<br>
<br>
&gt; 2. sysfs show functions: Replaced &#39;sprintf()&#39; with &#39;sysfs_=
emit()&#39;<br>
<br>
This is also an improvement.<br>
<br>
&gt; 3. loopback.c: Refactored a large function (gp_loopback_fn) to improve=
 readability<br>
<br>
I have only glanced at this, but refactoring something can<br>
sometimes be clearer if you do it in several small patches.<br>
<br>
&gt; 4. audio_gb.c: Split logic in get_topology() into separate calls as pe=
r TODO<br>
<br>
I&#39;ll comment more below, but you should almost always have<br>
only one change per patch.=C2=A0 So each of the four items listed<br>
above deserves its own patch.=C2=A0 You could send them separately<br>
(because they&#39;re unrelated), or as a series of cleanups.<br>
<br>
Note that &quot;one change per patch&quot; is a logical (not literal)<br>
statement.=C2=A0 For example, you could do a single patch that<br>
replaces *all* calls to strncpy() with strcspy().<br>
<br>
&gt; All changes are tested and pass <a href=3D"http://checkpatch.pl" rel=
=3D"noreferrer" target=3D"_blank">checkpatch.pl</a><br>
&gt; <br>
&gt; Signed-off-by: gpittala &lt;<a href=3D"mailto:ganeshkpittala@gmail.com=
" target=3D"_blank">ganeshkpittala@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0.../greybus/Documentation/firmware/firmware.c |=C2=A0 32 +=
+--<br>
&gt;=C2=A0 =C2=A0drivers/staging/greybus/arche-apb-ctrl.c=C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 11 +-<br>
&gt;=C2=A0 =C2=A0drivers/staging/greybus/arche-platform.c=C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 11 +-<br>
&gt;=C2=A0 =C2=A0drivers/staging/greybus/audio_gb.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 37 +++-<br>
&gt;=C2=A0 =C2=A0.../staging/greybus/audio_manager_module.c=C2=A0 =C2=A0 |=
=C2=A0 13 +-<br>
&gt;=C2=A0 =C2=A0drivers/staging/greybus/gbphy.c=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A03 +-<br>
&gt;=C2=A0 =C2=A0drivers/staging/greybus/light.c=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A05 +-<br>
&gt;=C2=A0 =C2=A0drivers/staging/greybus/loopback.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 170 ++++++++++--------<br>
&gt;=C2=A0 =C2=A08 files changed, 159 insertions(+), 123 deletions(-)<br>
&gt; <br>
&gt; diff --git a/drivers/staging/greybus/Documentation/firmware/firmware.c=
 b/drivers/staging/greybus/Documentation/firmware/firmware.c<br>
&gt; index 765d69faa9cc..8e375c88c881 100644<br>
&gt; --- a/drivers/staging/greybus/Documentation/firmware/firmware.c<br>
&gt; +++ b/drivers/staging/greybus/Documentation/firmware/firmware.c<br>
&gt; @@ -47,12 +47,12 @@ static int update_intf_firmware(int fd)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D ioctl(fd, FW_MGMT_IOC_GET_INTF_FW, &=
amp;intf_fw_info);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret &lt; 0) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0printf(&quot;Fai=
led to get interface firmware version: %s (%d)\n&quot;,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0fwdev, ret);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 fwdev, ret);<br>
<br>
The two changes in this hunk are not mentioned in the<br>
description above.=C2=A0 Please remove these changes.=C2=A0 If<br>
you want to do reformatting like this, do it in a<br>
separate patch.<br>
<br>
While it might be reasonable to include a little white<br>
space change like this occasionally, you should avoid<br>
doing it.=C2=A0 It is unrelated, and complicates your patch<br>
unnecessarily.<br>
<br>
This comment applies to several other changes you&#39;ve<br>
made below.=C2=A0 It also applies to removal (or addition) of<br>
blank lines, or really, any other white space changes.<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -Alex<br=
>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0printf(&quot;Interface Firmware tag (%s), ma=
jor (%d), minor (%d)\n&quot;,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0intf_fw_info.firmware=
_tag, intf_fw_info.major,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 intf_fw_info.firmware_tag, =
intf_fw_info.major,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0intf_fw_info.min=
or);<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Try Interface Firmware load over Unipro *=
/<br>
. . .<br>
</blockquote></div>

--0000000000002418390631ac44d1--

--===============0621507830379993121==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

--===============0621507830379993121==--
