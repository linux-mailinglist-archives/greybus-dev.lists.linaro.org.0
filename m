Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ZtaGCW1X82lfzwEAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Thu, 30 Apr 2026 15:21:49 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id ABAE24A35DF
	for <lists+greybus-dev@lfdr.de>; Thu, 30 Apr 2026 15:21:48 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id C0825404F5
	for <lists+greybus-dev@lfdr.de>; Thu, 30 Apr 2026 13:21:47 +0000 (UTC)
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
	by lists.linaro.org (Postfix) with ESMTPS id 4BA803F78A
	for <greybus-dev@lists.linaro.org>; Thu, 30 Apr 2026 00:13:41 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=emvKhRP4;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (lists.linaro.org: domain of sonionwhat@gmail.com designates 209.85.221.66 as permitted sender) smtp.mailfrom=sonionwhat@gmail.com;
	arc=pass ("google.com:s=arc-20240605:i=1")
Received: by mail-wr1-f66.google.com with SMTP id ffacd0b85a97d-43d734223e4so206424f8f.0
        for <greybus-dev@lists.linaro.org>; Wed, 29 Apr 2026 17:13:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777508020; cv=none;
        d=google.com; s=arc-20240605;
        b=Ane0gtFzDC4kErf7jjDhXFp5S7RKbVB0XrNoBJVH0H4gO0lBWr1lOof9PKBV+SEJuA
         loFYluOQAxIj5KzyQPIH5W6aUAmlfU0E3JAGbah00piCp3S2TZ6iQbvqOCLOgRnLzxYx
         eE+VWeBQafWSASDgb2nmsFWvNa9hbCP9mGgs/lpX8EZwYIQwR3jyoj4sm86BArAHikqm
         kXYsbVxp8qeJ6A/72rIcT2W12jfu7tqbfWofl4ldjZAzDFQdvwRw2ueMXJiX1519k1L0
         757BWl38Yvemdrtg7KDglFNpBpcheCX2WEN5l6HhH6joZHjHQb+vjj8XcLT4GOfRXHUO
         WoTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=hz+5Qp+4MVwm7bQlLYMXwO9tyluYCzRfE7ueZ3Twdrw=;
        fh=xCm/RmciAzSm8nLn21Uyp/wdPguGW7OpzjMjFqCjCy8=;
        b=PhQH/q6YmHmr1nsExUECsIEAyLUOn/0d5tfcxX9GZOkLPspCB4zMsNAy0dJIG2tBk1
         aMMpWT7l0dboZqdv8DyRlK/J2rbzXSkWaYEypel6WODzmrtJlpfJZNN4EfI+K5kWxpIz
         wymzxoezeiLzAHC6Gv5brZ03CpvYnZFE8QSmdSgX/0zDgO5AVmX0Zr3EssZcrxSMtMFO
         jz0HMUhOfplvsJlgPUUcDYMjTINtAkXNkefpaej12C8KemR2DIdNOQCShTOSzJGuKLSn
         ewX5vBHqfY+rBRsaiZPBU/gmM4zYnES7Maqy5I+M6q6HUh9vaz9NBANe3Iqvph4o1Q9z
         jU9A==;
        darn=lists.linaro.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777508020; x=1778112820; darn=lists.linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hz+5Qp+4MVwm7bQlLYMXwO9tyluYCzRfE7ueZ3Twdrw=;
        b=emvKhRP4/IMLLpvHHNQxQWQsw/4GI7l4UooesRJtKJbN0xkat5AQDdeADemDmaIb4j
         XDEaCPdyo5Q0LlnVY4IovVsqrVjP7ezOEbvJlJsMtumNSizlLz7qbrBGuYYAO9bYSvZP
         +fVO0XCsCGUIr5wd60PeKY7++lbIp0K+lJ0VE/gTPWJYFW5/P/EmbZ45dCqSI+OoNAiZ
         LbYI4n+/S6sAdtrR127JWd4RwQXhvjiWY2Q/lh2aMaxs14geFKNgEA5bQZEaxXUS8y67
         ww2c9yJ9f/8aockymoi2iZa1nJtDhnhqm0TjK21dxjkK/d9h0C+4F1+698SoYpxOVCRt
         gC1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777508020; x=1778112820;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hz+5Qp+4MVwm7bQlLYMXwO9tyluYCzRfE7ueZ3Twdrw=;
        b=VH7rsOyui7MNnpfFdHIDPA5HjIQeDI8v9+JK5oIkgxBFwsag2673ksqpDgQTlw/xwo
         9Bu3Tx+/C5ncNfQy3+tsT5unMTLFLWeuLZkBZJiwBjPL14TFdCDrWR2fhG7kzlwXjp/s
         Uw/235ylLYxNuFqQX1jCXgyxZWw/gw+vQPvRF2vZQLDOBeMbAOe7BvKltA0b5Fns7hKH
         +qzkG15CYHQd1VBeOF5yLln/2WWdUFvAyI/maxBsamFqWnBKUGO19pboHmvLy3i5ug8a
         j+J0Du/c0+nt2MSWkOe7exKhtUg/H42orxG0RyZ8muDEmBVvWmIvdF3veNSrxTw9qnk7
         LJWg==
X-Forwarded-Encrypted: i=1; AFNElJ9AjE2t6WQNk14CB6D0bYHPqIoDZjm0iVvaiTNzz5yF4WCeQ/J9H095ok7A326HlUtDIfX7aFfoKMrzhQ==@lists.linaro.org
X-Gm-Message-State: AOJu0Yze8f7J+KBHVR3jh0Y/A8S3Z/jL82NujsYH+4YFCOs3t7Vtqf2y
	h5zn5Agv83ukgNxFgF81ZgNJaxABbb174ltqSHUrRMlr2gqSFXq5RVNmBkGByDMuX7MJWIHayso
	jhJPlx6QGBd+QLBBoWB9Ck5XpBxndcrM=
X-Gm-Gg: AeBDieuw6U32yqZ8xdR6YUqD2tEgQ3nabZCBz881Z6rsVjuVCH+ZRQ0bG4xEvWwL3nQ
	Bh+ygvRLKpVVRHwOGEIyi2BN4tpblR86Ckp9mNa38wlSjjUjlPn2GLiw6XRRJ9LKZuJI466w+Lp
	HY7KN5yqWJPlRFHK8gJXQ5t9pPt9xg1Wp7mkiPFFmofU8eX9t9m5fefPhAnaEIBwxpIHNPy3hAn
	A4/LT2eywfOmHHXWRJin+S7di8fJ/Dmaw58uuk7zYw/QT9io5frlY3zSywU8Yj9q2Ny1fAjafnD
	TBSDo6+2b23WJwJJxTJx91WAeQKZSIwqO4Zj8LJiwCvymSF1eOqiRUxDJIXJ0TJ7+zWUxJYmy1i
	ejpGIqug/hl/sGsI=
X-Received: by 2002:a05:6000:2103:b0:43e:ab40:28d with SMTP id
 ffacd0b85a97d-4494dc52adbmr315947f8f.2.1777508020044; Wed, 29 Apr 2026
 17:13:40 -0700 (PDT)
MIME-Version: 1.0
References: <20260428002448.4829-1-sonionwhat@gmail.com> <afB6iSKiEy5V1mNR@stanley.mountain>
In-Reply-To: <afB6iSKiEy5V1mNR@stanley.mountain>
From: Bentley Blacketer <sonionwhat@gmail.com>
Date: Wed, 29 Apr 2026 20:13:28 -0400
X-Gm-Features: AVHnY4K1P2fNQzwPOESFvHZwBjwzzuTsxqc5R0qMzZV0lwajIyGZLP859O2pURc
Message-ID: <CAD3iFGMXs6jgGMVj6LsfTzjWsL5FHb8kVYyxiPQHvUBwK66RrQ@mail.gmail.com>
To: Dan Carpenter <error27@gmail.com>
X-Spamd-Bar: ----
X-MailFrom: sonionwhat@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: NDTNBUSC2AQIWNBRDXJI5FE2JS2HF54D
X-Message-ID-Hash: NDTNBUSC2AQIWNBRDXJI5FE2JS2HF54D
X-Mailman-Approved-At: Thu, 30 Apr 2026 13:21:38 +0000
CC: vireshk@kernel.org, johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: bootrom: replace dev_info with dev_dbg for firmware name
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/NDTNBUSC2AQIWNBRDXJI5FE2JS2HF54D/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: multipart/mixed; boundary="===============4213248984472286086=="
X-Rspamd-Queue-Id: ABAE24A35DF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.59 / 15.00];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx:c];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[multipart/mixed,multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:~,4:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[sonionwhat@gmail.com,greybus-dev-bounces@lists.linaro.org];
	DKIM_TRACE(0.00)[gmail.com:-];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	TAGGED_RCPT(0.00)[greybus-dev];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[checkpatch.pl:url,mail.gmail.com:mid,lists.linaro.org:helo,lists.linaro.org:rdns,linaro.org:email]

--===============4213248984472286086==
Content-Type: multipart/alternative; boundary="0000000000001ec93a0650a256b1"

--0000000000001ec93a0650a256b1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks Dan.

Will run checkpatch and fix the meta commentary location for v2.

On Tue, Apr 28, 2026 at 5:14=E2=80=AFAM Dan Carpenter <error27@gmail.com> w=
rote:

> On Mon, Apr 27, 2026 at 08:24:48PM -0400, kernelcoredev wrote:
> > The original dev_info call was intentionally temporary, with a FIXME
> > comment noting it should be downgraded to dev_dbg once modules with
> > valid VID/PID values were common. Project Ara was cancelled in 2016,
> > so that time has long passed.
> >
> > Remove the FIXME comment and downgrade to dev_dbg as originally intende=
d.
> >
> > Tested via code inspection only, as Project Ara hardware is no longer
> > available.
>
> Put this meta commentary
>
> >
> > Signed-off-by: Bentley Blacketer  <sonionwhat@gmail.com>
> > ---
>   ^^^
> Under the --- cut off line.
>
> >  drivers/staging/greybus/bootrom.c | 9 +++------
> >  1 file changed, 3 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/staging/greybus/bootrom.c
> b/drivers/staging/greybus/bootrom.c
> > index 83921d90c..757460c8b 100644
> > --- a/drivers/staging/greybus/bootrom.c
> > +++ b/drivers/staging/greybus/bootrom.c
> > @@ -168,12 +168,9 @@ static int find_firmware(struct gb_bootrom
> *bootrom, u8 stage)
> >                intf->ddbl1_manufacturer_id, intf->ddbl1_product_id,
> >                intf->vendor_id, intf->product_id);
> >
> > -     // FIXME:
> > -     // Turn to dev_dbg later after everyone has valid bootloaders wit=
h
> good
> > -     // ids, but leave this as dev_info for now to make it easier to
> track
> > -     // down "empty" vid/pid modules.
> > -     dev_info(&connection->bundle->dev, "Firmware file '%s'
> requested\n",
> > -              firmware_name);
> > +
> > +    dev_dbg(&connection->bundle->dev, "Firmware file '%s' requested\n"=
,
> > +         firmware_name);
>
> Please run your patches through checkpatch.pl.
>
> https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/
>
> regards,
> dan carpenter
>
> >
> >       rc =3D request_firmware(&bootrom->fw, firmware_name,
> >                             &connection->bundle->dev);
> > --
> > 2.54.0
> >
>

--0000000000001ec93a0650a256b1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks Dan.<br><br>Will run checkpatch and fix the meta co=
mmentary location for v2.</div><br><div class=3D"gmail_quote gmail_quote_co=
ntainer"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Apr 28, 2026 at 5:14=
=E2=80=AFAM Dan Carpenter &lt;<a href=3D"mailto:error27@gmail.com">error27@=
gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">On Mon, Apr 27, 2026 at 08:24:48PM -0400, kernelcoredev wrote:<b=
r>
&gt; The original dev_info call was intentionally temporary, with a FIXME<b=
r>
&gt; comment noting it should be downgraded to dev_dbg once modules with<br=
>
&gt; valid VID/PID values were common. Project Ara was cancelled in 2016,<b=
r>
&gt; so that time has long passed.<br>
&gt; <br>
&gt; Remove the FIXME comment and downgrade to dev_dbg as originally intend=
ed.<br>
&gt; <br>
&gt; Tested via code inspection only, as Project Ara hardware is no longer<=
br>
&gt; available.<br>
<br>
Put this meta commentary<br>
<br>
&gt; <br>
&gt; Signed-off-by: Bentley Blacketer=C2=A0 &lt;<a href=3D"mailto:sonionwha=
t@gmail.com" target=3D"_blank">sonionwhat@gmail.com</a>&gt;<br>
&gt; ---<br>
=C2=A0 ^^^<br>
Under the --- cut off line.<br>
<br>
&gt;=C2=A0 drivers/staging/greybus/bootrom.c | 9 +++------<br>
&gt;=C2=A0 1 file changed, 3 insertions(+), 6 deletions(-)<br>
&gt; <br>
&gt; diff --git a/drivers/staging/greybus/bootrom.c b/drivers/staging/greyb=
us/bootrom.c<br>
&gt; index 83921d90c..757460c8b 100644<br>
&gt; --- a/drivers/staging/greybus/bootrom.c<br>
&gt; +++ b/drivers/staging/greybus/bootrom.c<br>
&gt; @@ -168,12 +168,9 @@ static int find_firmware(struct gb_bootrom *bootr=
om, u8 stage)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 intf-&gt;ddbl1_=
manufacturer_id, intf-&gt;ddbl1_product_id,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 intf-&gt;vendor=
_id, intf-&gt;product_id);<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 =C2=A0// FIXME:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0// Turn to dev_dbg later after everyone has valid=
 bootloaders with good<br>
&gt; -=C2=A0 =C2=A0 =C2=A0// ids, but leave this as dev_info for now to mak=
e it easier to track<br>
&gt; -=C2=A0 =C2=A0 =C2=A0// down &quot;empty&quot; vid/pid modules.<br>
&gt; -=C2=A0 =C2=A0 =C2=A0dev_info(&amp;connection-&gt;bundle-&gt;dev, &quo=
t;Firmware file &#39;%s&#39; requested\n&quot;,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 firmware_name);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 dev_dbg(&amp;connection-&gt;bundle-&gt;dev, &quot;Firmw=
are file &#39;%s&#39; requested\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0firmware_name);<br>
<br>
Please run your patches through <a href=3D"http://checkpatch.pl" rel=3D"nor=
eferrer" target=3D"_blank">checkpatch.pl</a>.<br>
<br>
<a href=3D"https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2=
-patch/" rel=3D"noreferrer" target=3D"_blank">https://staticthinking.wordpr=
ess.com/2022/07/27/how-to-send-a-v2-patch/</a><br>
<br>
regards,<br>
dan carpenter<br>
<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0rc =3D request_firmware(&amp;bootrom-&gt;fw,=
 firmware_name,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;connection-&gt;bundle-&gt;dev);<br>
&gt; -- <br>
&gt; 2.54.0<br>
&gt; <br>
</blockquote></div>

--0000000000001ec93a0650a256b1--

--===============4213248984472286086==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

--===============4213248984472286086==--
