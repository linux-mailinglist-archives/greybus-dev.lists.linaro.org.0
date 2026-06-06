Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 617yDUFJJWqOGAIAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Sun, 07 Jun 2026 12:34:41 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id BFC6E64FD02
	for <lists+greybus-dev@lfdr.de>; Sun, 07 Jun 2026 12:34:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=tumelty-co-uk.20251104.gappssmtp.com header.s=20251104 header.b=baj1ycYm;
	spf=pass (mail.lfdr.de: domain of "greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org" designates 44.210.186.118 as permitted sender) smtp.mailfrom="greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org";
	dmarc=none;
	arc=reject ("signature check failed: fail, {[1] = sig:google.com:reject}")
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id D8F8440A00
	for <lists+greybus-dev@lfdr.de>; Sun,  7 Jun 2026 10:34:39 +0000 (UTC)
Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	by lists.linaro.org (Postfix) with ESMTPS id A1CF9404F4
	for <greybus-dev@lists.linaro.org>; Sat,  6 Jun 2026 08:05:29 +0000 (UTC)
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-66061993294so2977456d50.3
        for <greybus-dev@lists.linaro.org>; Sat, 06 Jun 2026 01:05:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780733129; cv=none;
        d=google.com; s=arc-20240605;
        b=kdam2hPig2iLjzfNoB64AdvU9odzr2zvy1hgaKTXjWtkvdL5l8N4QDWTM3ZfpGmpV1
         W4B0U9g7MkHR8UjJ9GVF3LDdbSD4k65nJSg6PWNTFAiWkDSsHdYIqEP7/9ebVHdQiavT
         C/3Zi2zRXHGTInYa6J2V9TIME6SGdFkmXztavnUU0XE2OgbiTElem6t3rJzVquKrEewo
         wAYoLHTgDmDlGO/2cDP39UvwhjYFEvEeidnip9hMCH3GI9FFy9Hj6ZA+4nzbTMcG2qIs
         mhfoBIOhqb1XMaF38QM86a11s2F727KGzTMiKfTttbfYoFyL9YFc+oTeepTEgq435ZSv
         ad/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=+462Ps5D5r/EuqKJ1KiXW6CPnQJ/Qb0n8gsPG7bDTWk=;
        fh=sfCIQQK7uGw/RgAFkWBffCAiab2afqPZe4qx9GrpOgI=;
        b=LJho5310vllM6a0oHeFblAUeUTUqkuAcff3/8XIXVzzUhhy1n2eAcr40BcRDGsWSvL
         WOdauWGRWWS62sJOyJX8Mw23D17Uqiw+IPu1nVeHKPHutEjKywuoJsSKwF8jH1FlQ8Sx
         zgNmbsaOtDDYnSrKfVHiSzdg58NS3O8ZTJzMuDnYbGfbeGaEUFeGjj1M+2rhl/o9B37M
         V6EdkaccVIzZ9z0Ksn1QnmjwdeGiapEuo/3yZA9xXn7yaX+CRCNpo4RNkUB0m826eOtk
         MPWVE6fBDJSS2FgAFyd07BUpJeqWDmRocQFSOdLFDRf2nCsF2Bbp6Wb+1xh78k9eGB8d
         uogA==;
        darn=lists.linaro.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tumelty-co-uk.20251104.gappssmtp.com; s=20251104; t=1780733129; x=1781337929; darn=lists.linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+462Ps5D5r/EuqKJ1KiXW6CPnQJ/Qb0n8gsPG7bDTWk=;
        b=baj1ycYmD7PIA2TdWm92ImnOZ28yqk5naNM20FJ3Le4FazA9+tl4VX7futYUjDbSrZ
         jYrneC16e9yRInsAZjYIw7NMHy4poa5EwzNy9TPlhBXNmppHR6vo1fM6iqt8NNa+lxHi
         DYd6PZoMrfBMKOyehplzWCOGht4dYg/8udZCbrWcQtK6vpVPFLBFOZPU6Hi2N89MEdlO
         g994sMAXepOelRGXiGi52LktY8Ui4GNycXtrqx1bqFcDxQmOJgxbw6l6BaDYLZvvv+3E
         dA18dp+S1D4z5u6thwIUgDArFDOZdx7L8rp8TMHtUeFUaJOqkyn6sj4YBi/QW+bj7WJV
         pSig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780733129; x=1781337929;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+462Ps5D5r/EuqKJ1KiXW6CPnQJ/Qb0n8gsPG7bDTWk=;
        b=qnNQJ6EYG1OJcDN5QqHjnwC4X4+PYN4E00uAai8xqKXPERQ+Zlwd+tbOGZLKeyUhbA
         T2eMU/tQCvji7umg1uKsosax3uxBaftTx22j4Zgl79tFV00Fugtjo+ZGd9Tp+OBseDvG
         mScoT0+A82CUA0LlE8Xb6UAK0zhUSe6tdbKbWzZJEQM5mYuwQBWO7hvggvvuFJAb0S2T
         6v0pCyNZ1KXLT56F7x9cBFOVlGGTEjxK76KlSxnHqdrwPc6BtPXs2qI5tQLw2gdhKIn0
         fOY7OsX54HxMucXfTsIlJleNgfTdM3KWQRlHm21WhIm1BE1P3z7nEb1lMNbJuZQuc9hw
         xI0A==
X-Forwarded-Encrypted: i=1; AFNElJ9OYfv038Xtq8pfW9zvPnlX1+oGZjgVZD0mhqFT1+v9YlTJqaiQ9mCQ7tAQW1jhKiVX7wj9/7hWgHiA5A==@lists.linaro.org
X-Gm-Message-State: AOJu0YzPchEBCDpH7UtoQKk6s4Y3+3+/ERfXxPfWcsNUU/sbOQPG7COd
	LMZLAopDt4wdNxO7Ifoj3Af6c79YXh27zTKwoO0c+WO8EIyW2kH/Xejg1pA3Sp1kGcbjsNEsV6t
	464IVFiW1cf6olacG5xJyDwQ3ojne3F/hE1CFnPUpVQ==
X-Gm-Gg: Acq92OGheVibq0aFPEhbHLj3EyV/zFMomhr/kPKUK4PnGlxzPryZaI0+RHNWOJ1uojz
	Kjp5k3OoHJe52rzTqRuu8J5boCbV7XgO1rCM8939IRtpVlBBKgj/CoCWCfCwsb23fhDhsxtZmLk
	OgmNus7TXJrjB3rzG45kRBKpVeVCcchEmu5Q1tRWSb587NWSW4zT96b69FQcoLFcVvkZIrVz4pF
	sTb53spJ7W4UJgamKgSEgKeG3IVPtzmf1YToKscMx9HfpHydd+KS5pmB+OQz3SRUogy/tY0yivL
	mXP+cAl336BKF07ZPoI=
X-Received: by 2002:a05:690e:1248:b0:651:b7e2:6835 with SMTP id
 956f58d0204a3-66106f39db1mr6841132d50.35.1780733129163; Sat, 06 Jun 2026
 01:05:29 -0700 (PDT)
MIME-Version: 1.0
References: <20260605192857.78944-1-rhys@tumelty.co.uk> <aiPHgttTk0bK563E@stanley.mountain>
In-Reply-To: <aiPHgttTk0bK563E@stanley.mountain>
From: Rhys Tumelty <rhys@tumelty.co.uk>
Date: Sat, 6 Jun 2026 09:05:18 +0100
X-Gm-Features: AVVi8CeJMuqH1PmC8I5_CEOeQ_Cq-cyof4CaNUQq7YN3lQUPBtHbOjLGNQwBa0s
Message-ID: <CA+46LBHckDv+rW6CEyZbYWTRz=FWuvpz-kWorYm1-6WcNXjOOA@mail.gmail.com>
To: Dan Carpenter <error27@gmail.com>
X-Spamd-Bar: /
X-MailFrom: rhys@tumelty.co.uk
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: GGP4PWS4XDI4OJT5PJ757BV46E2457GM
X-Message-ID-Hash: GGP4PWS4XDI4OJT5PJ757BV46E2457GM
X-Mailman-Approved-At: Sun, 07 Jun 2026 10:34:27 +0000
CC: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: audio: fix snprintf truncation errors
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/GGP4PWS4XDI4OJT5PJ757BV46E2457GM/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: multipart/mixed; boundary="===============0489620345730192333=="
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.49 / 15.00];
	DATE_IN_PAST(1.00)[26];
	R_DKIM_REJECT(1.00)[tumelty-co-uk.20251104.gappssmtp.com:s=20251104];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx:c];
	MIME_GOOD(-0.10)[multipart/mixed,multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:error27@gmail.com,m:johan@kernel.org,m:elder@kernel.org,m:greybus-dev@lists.linaro.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	DMARC_NA(0.00)[tumelty.co.uk];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[rhys@tumelty.co.uk,greybus-dev-bounces@lists.linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:~,4:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[tumelty-co-uk.20251104.gappssmtp.com:-];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rhys@tumelty.co.uk,greybus-dev-bounces@lists.linaro.org];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	TAGGED_RCPT(0.00)[greybus-dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tumelty.co.uk:from_mime,linaro.org:email,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BFC6E64FD02

--===============0489620345730192333==
Content-Type: multipart/alternative; boundary="0000000000009a97c70653913d0b"

--0000000000009a97c70653913d0b
Content-Type: text/plain; charset="UTF-8"

Thanks for the review. I'll drop this patch.

Best Regards,
Rhys

On Sat, 6 Jun 2026 at 08:08, Dan Carpenter <error27@gmail.com> wrote:

> On Fri, Jun 05, 2026 at 08:28:56PM +0100, Rhys Tumelty wrote:
> > change snprintf() to scnprintf() in both gbaudio_tplg_create_widget()
> > and gbaudio_tplg_process_kcontrols() to prevent potential string
> > truncation warnings when prefixing the device id to the control name.
> >
>
> This commit message is unclear.  My understanding is that snprintf()
> is complaining that the array size of w->name is less than the array
> size of "GB %d %s" plus the array size of temp_name.  This is a W=1
> complaint.
>
> I hate this warning.  We use snprintf() to deliberately truncate
> the string.  Now it's complaining that the string might be truncated.
> Oh no!  What we want to happen might happen!  This is the same argument
> that people used to block safer alternatives to strcpy() into glibc
> because "it's still going to truncate the string and that's equally
> bad as a root exploit!"
>
> First of all, the string is not going to be truncated.  (I haven't
> looked).  Second of all, this warning makes no sense in the kernel.
> I have never once had a bug which I failed to debug because the
> last two bytes in a string were truncated.  There has never been a
> scenario where I was looking through dmesg and snprintf() truncated
> some bytes so I couldn't guess what I was looking at.
>
> So your solution is to change it to scnprintf() which is kernel only
> and GCC doesn't know about it...  I bet GCC eventually learns about
> scnprintf() and it eventually becomes a warning again.
>
> A better solution is to disable that annoying check.
>
> regards,
> dan carpenter
>
>

--0000000000009a97c70653913d0b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thanks for the review. I&#39;ll drop this patch.</div=
><div><br></div><div>Best Regards,</div><div>Rhys</div></div><br><div class=
=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr=
">On Sat, 6 Jun 2026 at 08:08, Dan Carpenter &lt;<a href=3D"mailto:error27@=
gmail.com">error27@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">On Fri, Jun 05, 2026 at 08:28:56PM +0100, Rhys =
Tumelty wrote:<br>
&gt; change snprintf() to scnprintf() in both gbaudio_tplg_create_widget()<=
br>
&gt; and gbaudio_tplg_process_kcontrols() to prevent potential string<br>
&gt; truncation warnings when prefixing the device id to the control name.<=
br>
&gt; <br>
<br>
This commit message is unclear.=C2=A0 My understanding is that snprintf()<b=
r>
is complaining that the array size of w-&gt;name is less than the array<br>
size of &quot;GB %d %s&quot; plus the array size of temp_name.=C2=A0 This i=
s a W=3D1<br>
complaint.<br>
<br>
I hate this warning.=C2=A0 We use snprintf() to deliberately truncate<br>
the string.=C2=A0 Now it&#39;s complaining that the string might be truncat=
ed.<br>
Oh no!=C2=A0 What we want to happen might happen!=C2=A0 This is the same ar=
gument<br>
that people used to block safer alternatives to strcpy() into glibc<br>
because &quot;it&#39;s still going to truncate the string and that&#39;s eq=
ually<br>
bad as a root exploit!&quot;<br>
<br>
First of all, the string is not going to be truncated.=C2=A0 (I haven&#39;t=
<br>
looked).=C2=A0 Second of all, this warning makes no sense in the kernel.<br=
>
I have never once had a bug which I failed to debug because the<br>
last two bytes in a string were truncated.=C2=A0 There has never been a<br>
scenario where I was looking through dmesg and snprintf() truncated<br>
some bytes so I couldn&#39;t guess what I was looking at.<br>
<br>
So your solution is to change it to scnprintf() which is kernel only<br>
and GCC doesn&#39;t know about it...=C2=A0 I bet GCC eventually learns abou=
t<br>
scnprintf() and it eventually becomes a warning again.<br>
<br>
A better solution is to disable that annoying check.<br>
<br>
regards,<br>
dan carpenter<br>
<br>
</blockquote></div>

--0000000000009a97c70653913d0b--

--===============0489620345730192333==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

--===============0489620345730192333==--
