Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GLbgFNodAmocoAEAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Mon, 11 May 2026 20:20:10 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id D56695143F3
	for <lists+greybus-dev@lfdr.de>; Mon, 11 May 2026 20:20:09 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 56C293F7DC
	for <lists+greybus-dev@lfdr.de>; Mon, 11 May 2026 18:20:08 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	by lists.linaro.org (Postfix) with ESMTPS id C966E3EC66
	for <greybus-dev@lists.linaro.org>; Mon, 11 May 2026 12:26:35 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Jwo2x9fx;
	arc=pass ("google.com:s=arc-20240605:i=1");
	spf=pass (lists.linaro.org: domain of meatuni001@gmail.com designates 209.85.208.173 as permitted sender) smtp.mailfrom=meatuni001@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-393da8f389bso41361041fa.1
        for <greybus-dev@lists.linaro.org>; Mon, 11 May 2026 05:26:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778502395; cv=none;
        d=google.com; s=arc-20240605;
        b=HkvDyi5f9GnvkrNp2RQ7wAkcbGR2m8w3KR3R8yAbMiM/ahhK00QY2KAwFwv35AyoKf
         AVXIvTfe5kGYZjat5b2q1HvmxlCajKRYIiVMJMCXw3dj9Cbo/rMSZUtDTp0J+x7hJP5P
         tjrWG2dCyE7+MpcVpjKkBhFyJshjtRs0vrZp552MV2oKHQJ5govIyB7Nuk7Lc3+crsrq
         W64sKu/wBNfU6XoC5REVYcD41hHnhLr98U8RgQYVHlmmHegC8r5Mf00CGTGBy9TB1s9o
         W/fk5E+5FkhWxqm2eX8KjxZtIvvw7qSaiRx665AyzBj3C3gKlC/EG98bQ1TmGxvrm9zL
         p88A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=zUDGbopcKu92LW8UDVvqGeoeJW7QeZYBWz+15TwotUs=;
        fh=ZJeHNIpSJOkIkPvHi+9RjGSb7HQDfm63G42oyZ2chOo=;
        b=LdHn6xxNcwxq/B7v4PJ2RVGw4wYPRdlgF46CN0mvX8pLZVXl2CEFqqbvkUlx4yaKU1
         q0wIt5ozlIFrMuZarH2SiTOApyIuD+eX6i+F16InAQN30og7yqWw/BR/NqRVHve+idoQ
         fo7tvlVrz2nhVXHCJnEvzJnhFQhHJsByQ3VOVf6irNN2nsklPp5dMbs8tpZXTSDeUyML
         6N0YvApAVqQs5NvXsWDGPVnXrkJ3x67Ip2MKtq4DKunWYltn12CrR/f+DQXWt+E5MJDl
         MYLqlY9Bi5v2iVfrqB3I/fi/65F03pAbIYWDJMMcmc4wClbNs2yMwr3sc1bC9LxAe2XN
         Rq/Q==;
        darn=lists.linaro.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778502395; x=1779107195; darn=lists.linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zUDGbopcKu92LW8UDVvqGeoeJW7QeZYBWz+15TwotUs=;
        b=Jwo2x9fxJE+d/3kFTCbIRs17xJRB1Meg9QPJQSpXhfpLDopWIW4Z2m+bMDI/zBmo2t
         YBPcbI+iwzMqgvHKjAuj3LvOItlVukqmeXuN/q+TTPx4sVfoCSOyJRoLcXRkdsOeDeHP
         cn40VwLzlbTBUvOdjSi47L6B9CjZ82dJVMKSXpWqEqhpvGPxx1GbDFRGdLLecsO5uo5i
         ufIyADw/aIa8zgPIUURQBISMlVEcjcqn90pluQ8uctUc4XhKvDU/YRpOFrhhuRJCN538
         BdloBtJKlS+xpcwnQDqFN/Y+ta8WmK6qh2HWRAsSpUIqQRrukGMkccdrBaZYyoJg1UH9
         soGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778502395; x=1779107195;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zUDGbopcKu92LW8UDVvqGeoeJW7QeZYBWz+15TwotUs=;
        b=emr+YZm6JVqp8hWsd9d5j4cBSfBrc03swe8A5GEZkUMY5zY70mHvJGH3nYdp4qSgrn
         oiDiCMCIDd6O45bujSo0f+xnINsZDB3H2qAHSXnOjpxha9JhrkpsN5u7Z+ex5Tm2orhU
         BYnhslnExU3W2Vf9VcZXFlZbA/Y4G9qJR33G6CuGQkNWlPNmTPPjmsnwAHLGVkKpmw2g
         jw7sk5ozVWj7ho7ATzL2lXCrv77X7BkbwoU26PnIy8eIo/2TFM1EOJKu9e0oDR7UXg7C
         D9Iu4u1GojchRpthGwMppIM3Ge6B46a+/u6td1dzf3I4AP2aRy4XumhFwirK67C0QGup
         1DOw==
X-Gm-Message-State: AOJu0Yz4SknkNJ0ktUHZs7heA1t6pugtscghdiOk+lPPO4hMgxlB4CGu
	I1afxmLm43Y3QZKnWF8H0y0t0fI1f6lTGwrVgHXCWNBuk2kx1dE+dypHG3CmE7WcjYMwvdU2y46
	UOCT5QIoWUckvH4bb5PJlEOgIuMv55DQ=
X-Gm-Gg: Acq92OEz2+4FtxDCZJoBDzu0MEcieVuVebCRiBIgAYJV8mMXp4yuVDad/c9G968R+Pk
	yEacKCBsGDltAiLVf3jXUiqCQdx/cGcWFlOX+OQ3GAaDq0Ra84b9MtMJ62rZLosoxw7DJC+X+g5
	5eYFGtF/L1yQjymA6dKaLdiny3Uu5WrZOm+K8BL8kKeub1Nq8Oq+unSk14EUHxxYMJXgnWHGWsG
	UmJYIp61+e3sgPvVK37zOV7mGOBFVcMX1i9U94Wz21oJlswHPaD+XvQ0qHMVWRrfeQEyhMv+Q0m
	SY2NK6OnbAvB8hYAy+gwElQSX9mW49YIFZuHxg03W9VnJrn98Cp39vbsyjGjn8H4zZoZ2eiDgFv
	cUQ==
X-Received: by 2002:a05:651c:1550:b0:393:a5ed:7dca with SMTP id
 38308e7fff4ca-39408032327mr28340241fa.10.1778502394287; Mon, 11 May 2026
 05:26:34 -0700 (PDT)
MIME-Version: 1.0
References: <20260504233328.7409-1-meatuni001@gmail.com> <2026051156-hamster-plating-7ae7@gregkh>
In-Reply-To: <2026051156-hamster-plating-7ae7@gregkh>
From: Muhammad Bilal <meatuni001@gmail.com>
Date: Mon, 11 May 2026 08:26:22 -0400
X-Gm-Features: AVHnY4Kl9AXV4zkbJdDxhdu7suqYwE1xi-Mf2yQ-Zxb65GwlmUrBeq4--jOn6cg
Message-ID: <CADqcGBmrwyTuNbrMqTpa5GE6odoeFGfXPdA-vdNGuxSK13L=HA@mail.gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
X-Spamd-Bar: ----
X-MailFrom: meatuni001@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: 2ZLLIKYDT53M24CHSLOMUULQD3R5PVOR
X-Message-ID-Hash: 2ZLLIKYDT53M24CHSLOMUULQD3R5PVOR
X-Mailman-Approved-At: Mon, 11 May 2026 18:20:02 +0000
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, vireshk@kernel.org, johan@kernel.org, elder@kernel.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v1] greybus: authentication: validate CAP response payload size
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/2ZLLIKYDT53M24CHSLOMUULQD3R5PVOR/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: multipart/mixed; boundary="===============8151070205262184697=="
X-Rspamd-Queue-Id: D56695143F3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.59 / 15.00];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
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
	FROM_NEQ_ENVFROM(0.00)[meatuni001@gmail.com,greybus-dev-bounces@lists.linaro.org];
	DKIM_TRACE(0.00)[gmail.com:-];
	TAGGED_RCPT(0.00)[greybus-dev];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	NEURAL_SPAM(0.00)[0.116];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linaro.org:helo,lists.linaro.org:rdns,mail.gmail.com:mid,linuxfoundation.org:email,linaro.org:email]
X-Rspamd-Action: no action

--===============8151070205262184697==
Content-Type: multipart/alternative; boundary="0000000000007197fc065189dbb6"

--0000000000007197fc065189dbb6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 11, 2026 at 03:53:00AM +0000, Greg KH wrote:
> Was this tested on any real greybus devices?

No, I do not have access to real Greybus hardware. The issue was
identified through code review of drivers/staging/greybus/authentication.c.

The vulnerable paths are:

1. payload_size is used in a subtraction without first verifying
   payload_size >=3D sizeof(*response), which can underflow on short
   responses.

2. The resulting size is passed directly to memcpy() into fixed-size
   UAPI buffers without validating against CAP_CERTIFICATE_MAX_SIZE
   or CAP_SIGNATURE_MAX_SIZE.

A malicious or compromised Greybus endpoint could therefore trigger
an out-of-bounds write through an oversized payload.

The fix adds the missing bounds checks before the memcpy() calls,
which matches common kernel validation patterns.

If testing on real hardware is required before merging, I am happy
to wait.

Thanks,
Muhammad Bilal

On Mon, May 11, 2026 at 3:53=E2=80=AFAM Greg KH <gregkh@linuxfoundation.org=
> wrote:

> On Mon, May 04, 2026 at 07:33:28PM -0400, Muhammad Bilal wrote:
> > cap_get_ims_certificate() and cap_authenticate() copy variable-length
> > response data directly into fixed-size UAPI buffers using the
> > untrusted op->response->payload_size value without any bounds checks.
> >
> > A malicious or compromised Greybus endpoint can return an oversized
> > certificate or signature payload, causing a kernel heap overflow.
> >
> > Fix both functions by:
> >   - Rejecting responses shorter than sizeof(*response) with -EPROTO.
> >   - Rejecting payloads exceeding CAP_CERTIFICATE_MAX_SIZE (1600) or
> >     CAP_SIGNATURE_MAX_SIZE (320) with -EMSGSIZE.
> >   - Copying only the validated size into the UAPI buffer.
> >
> > Fixes: e3eda54d0b5f ("greybus: Add Component Authentication Protocol
> support")
> > Signed-off-by: Muhammad Bilal <meatuni001@gmail.com>
> > ---
> >  drivers/staging/greybus/authentication.c | 34 +++++++++++++++++++++---
> >  1 file changed, 30 insertions(+), 4 deletions(-)
>
> Was this tested on any real greybus devices?
>
> thanks,
>
> greg k-h
>

--0000000000007197fc065189dbb6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On Mon, May 11, 2026 at 03:53:00AM +0000, Greg KH wrote:<b=
r>&gt; Was this tested on any real greybus devices?<br><br>No, I do not hav=
e access to real Greybus hardware. The issue was<br>identified through code=
 review of drivers/staging/greybus/authentication.c.<br><br>The vulnerable =
paths are:<br><br>1. payload_size is used in a subtraction without first ve=
rifying<br>=C2=A0 =C2=A0payload_size &gt;=3D sizeof(*response), which can u=
nderflow on short<br>=C2=A0 =C2=A0responses.<br><br>2. The resulting size i=
s passed directly to memcpy() into fixed-size<br>=C2=A0 =C2=A0UAPI buffers =
without validating against CAP_CERTIFICATE_MAX_SIZE<br>=C2=A0 =C2=A0or CAP_=
SIGNATURE_MAX_SIZE.<br><br>A malicious or compromised Greybus endpoint coul=
d therefore trigger<br>an out-of-bounds write through an oversized payload.=
<br><br>The fix adds the missing bounds checks before the memcpy() calls,<b=
r>which matches common kernel validation patterns.<br><br>If testing on rea=
l hardware is required before merging, I am happy<br>to wait.<br><br>Thanks=
,<br>Muhammad Bilal</div><br><div class=3D"gmail_quote gmail_quote_containe=
r"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, May 11, 2026 at 3:53=E2=80=
=AFAM Greg KH &lt;<a href=3D"mailto:gregkh@linuxfoundation.org">gregkh@linu=
xfoundation.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">On Mon, May 04, 2026 at 07:33:28PM -0400, Muhammad Bilal wro=
te:<br>
&gt; cap_get_ims_certificate() and cap_authenticate() copy variable-length<=
br>
&gt; response data directly into fixed-size UAPI buffers using the<br>
&gt; untrusted op-&gt;response-&gt;payload_size value without any bounds ch=
ecks.<br>
&gt; <br>
&gt; A malicious or compromised Greybus endpoint can return an oversized<br=
>
&gt; certificate or signature payload, causing a kernel heap overflow.<br>
&gt; <br>
&gt; Fix both functions by:<br>
&gt;=C2=A0 =C2=A0- Rejecting responses shorter than sizeof(*response) with =
-EPROTO.<br>
&gt;=C2=A0 =C2=A0- Rejecting payloads exceeding CAP_CERTIFICATE_MAX_SIZE (1=
600) or<br>
&gt;=C2=A0 =C2=A0 =C2=A0CAP_SIGNATURE_MAX_SIZE (320) with -EMSGSIZE.<br>
&gt;=C2=A0 =C2=A0- Copying only the validated size into the UAPI buffer.<br=
>
&gt; <br>
&gt; Fixes: e3eda54d0b5f (&quot;greybus: Add Component Authentication Proto=
col support&quot;)<br>
&gt; Signed-off-by: Muhammad Bilal &lt;<a href=3D"mailto:meatuni001@gmail.c=
om" target=3D"_blank">meatuni001@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 drivers/staging/greybus/authentication.c | 34 ++++++++++++++++++=
+++---<br>
&gt;=C2=A0 1 file changed, 30 insertions(+), 4 deletions(-)<br>
<br>
Was this tested on any real greybus devices?<br>
<br>
thanks,<br>
<br>
greg k-h<br>
</blockquote></div>

--0000000000007197fc065189dbb6--

--===============8151070205262184697==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

--===============8151070205262184697==--
