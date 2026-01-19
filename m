Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E02D3ABDB
	for <lists+greybus-dev@lfdr.de>; Mon, 19 Jan 2026 15:27:34 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id AAE4B3F7FD
	for <lists+greybus-dev@lfdr.de>; Mon, 19 Jan 2026 14:27:33 +0000 (UTC)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	by lists.linaro.org (Postfix) with ESMTPS id 9DE6B3F6B6
	for <greybus-dev@lists.linaro.org>; Mon, 19 Jan 2026 13:02:22 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=QoUQJWLd;
	spf=pass (lists.linaro.org: domain of architanant5@gmail.com designates 209.85.128.171 as permitted sender) smtp.mailfrom=architanant5@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-78fb7704cb4so35465767b3.3
        for <greybus-dev@lists.linaro.org>; Mon, 19 Jan 2026 05:02:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768827742; x=1769432542; darn=lists.linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5HCwKfSnUANiYwy4UeDrOo+gBt85G6cvrtr/rzoBn/k=;
        b=QoUQJWLdZgt75BtIAKesrO2S+w75SzhF0A23lNNb+k1CK/4NfYHgih7rG3x0gA4Mzp
         XGNR4XHQwER5ltOKb5XxprGP0G5hlpl2Q+qYwiAp7x2mog+wFGKHQJM5v7dlsCatmmaq
         7QwQm1MytL9XROZ4vt3Cim+2K/6gLlCIHUCPCkl7BgG26b70jBGPsn+4tMaz+sNoWa//
         RP6OCrpXX3VAiimVKmsrZsQiyRHXD34S0ivAb+KBhJQXGlgmQgucPBcwSAEj+yfYloyO
         duRFR4Avs7vn+JMIRfU4AlPbzOXS70BBXMI3aL29UCIXLASDitAyIhRNW4UrW3+vszVz
         /New==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768827742; x=1769432542;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5HCwKfSnUANiYwy4UeDrOo+gBt85G6cvrtr/rzoBn/k=;
        b=CD7fkgw4IXWbXnlESISsoUzeQVp0ho+2stfW/lMxd6MnsyyPLgQdVrKGsmKFy0j8Vu
         A4yCzjgPOhSUFbZYQ6EwR5VImawB26Q5Nue00zuIxmr9okSgSgN7r3Ma/XK7T3XmkTYq
         mStShFimcd79kxhIhNuEAqpAi/bhGjU8L/8dI7jOmGg58hyxS4tpJiSqDgJXvIYrn7Yw
         mAFdC4FM2B/mddsRKT7ksotXmjX+ho22I6TbgcgfWa8yoeCfEK2RWcHURzk27JlZq53d
         dM3Vbg+9EC6Tg5qcqQm1kG9u89pxAgTYJ6JDdJ5dGYZHSyuPYz595PA1UBoOsLD9faBa
         L2cA==
X-Forwarded-Encrypted: i=1; AJvYcCWA2DsvOUQ9MXLk7ObjqUkSG7wp8RKsSHY9NCvY37w2a8miLiN1ks7EAY8rU5VISvkzwS+msXGaXnFClQ==@lists.linaro.org
X-Gm-Message-State: AOJu0YyvHc1venL94xTPFZWZeZHt/dEOWCQJH8yLVQnOJDw3S9RSwMTW
	9Qfm6pM0yhnN00WVhgS8mHOVUQ/slkF9pTwaBaBjoMZMswCF1oL7NTD3YYZyYlNvftgDnTxgtVc
	F78QmzIueDmMzR3Xb713NOEgZuPrdV6s=
X-Gm-Gg: AZuq6aJCYSgR0b+4ngCAHT7Ki4nIqipPM6C9FssAtMDGDpOd8fscrNAzjQ9HDcQMomn
	T6mFK9TnY5e75CCrVuQ7uVwKdVkDv8sjobWNN3yGNz0OM5MkSlx0fQcD35qSBycuWgu/LxdpmK2
	p+WHKBAK1wivnfstF7zmXbbA2ffsJq/o/Nm/2PRXD6cHiQRYayHepiALB34jd680Tm8wweU7DLg
	pVTcQuKoyuthLIA8dzS5wN/VVPVOrHInEJezRyf9jzQf7Du1+pIl/8152GMU/NjrLG6e8f9F4Bn
	+r1EoXBq/G8Z
X-Received: by 2002:a05:690c:9693:b0:786:58c4:7a21 with SMTP id
 00721157ae682-793c68b7c28mr77654947b3.69.1768827741956; Mon, 19 Jan 2026
 05:02:21 -0800 (PST)
MIME-Version: 1.0
References: <20260118060548.24548-1-architanant5@gmail.com>
 <20260118060548.24548-2-architanant5@gmail.com> <aW4Ghy94jAGSPml3@hovoldconsulting.com>
In-Reply-To: <aW4Ghy94jAGSPml3@hovoldconsulting.com>
From: Archit Anant <architanant5@gmail.com>
Date: Mon, 19 Jan 2026 18:32:10 +0530
X-Gm-Features: AZwV_QifGs4aAAqQ8T_kfbS801qYl3n5giwHxQH-1-asDfybRCMK_3a95F6td7o
Message-ID: <CADJHxWDpKy8T5i3byDZrEuZOgA-MpHZPYeZWvMDPqoXZvAT6Mw@mail.gmail.com>
To: Johan Hovold <johan@kernel.org>
X-Rspamd-Queue-Id: 9DE6B3F6B6
X-Spamd-Bar: ---
X-Spamd-Result: default: False [-4.00 / 15.00];
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
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.128.171:from];
	DWL_DNSWL_BLOCKED(0.00)[gmail.com:dkim];
	MISSING_XM_UA(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-MailFrom: architanant5@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: AUD5YR2OGGGLMAZWOEHSFHFBYJFQHCWG
X-Message-ID-Hash: AUD5YR2OGGGLMAZWOEHSFHFBYJFQHCWG
X-Mailman-Approved-At: Mon, 19 Jan 2026 14:27:31 +0000
CC: vireshk@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Julia Lawall <Julia.Lawall@inria.fr>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 1/1] staging: greybus: fw-core: use %pe for error printing
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/AUD5YR2OGGGLMAZWOEHSFHFBYJFQHCWG/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: multipart/mixed; boundary="===============4949510548580152743=="

--===============4949510548580152743==
Content-Type: multipart/alternative; boundary="0000000000003a6d920648bd4de9"

--0000000000003a6d920648bd4de9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Understood. I wasn't aware of the preference for numerical consistency in
this subsystem. I will drop this patch.

Thanks for the review.

Sincerely,
Archit Anant

On Mon, 19 Jan, 2026, 3:55=E2=80=AFpm Johan Hovold, <johan@kernel.org> wrot=
e:

> [ +CC: Julia ]
>
> On Sun, Jan 18, 2026 at 11:35:48AM +0530, Archit Anant wrote:
> > Use the %pe printk format specifier to print error codes as symbolic
> > names (e.g., -ENOMEM) instead of numeric values. This improves
> > readability of error logs.
>
> Greybus and this driver uses numerical errnos in its error messages so
> this will introduce a needless inconsistency for no good reason.
>
> > Issue identified by coccicheck using the ptr_err_to_pe.cocci script.
>
> Also see:
>
>
> https://lore.kernel.org/all/20251029132922.17329-1-johan@kernel.org/
>
> Johan
>

--0000000000003a6d920648bd4de9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Understood. I wasn&#39;t aware of the preference for=
 numerical consistency in this subsystem. I will drop this patch.</div><div=
 dir=3D"auto"><br></div><div dir=3D"auto">Thanks for the review.</div><div>=
<br></div><div data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><font fa=
ce=3D"arial, sans-serif" color=3D"#666666">Sincerely,</font><div><font face=
=3D"arial, sans-serif">Archit Anant</font></div></div></div></div><br><div =
class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail=
_attr">On Mon, 19 Jan, 2026, 3:55=E2=80=AFpm Johan Hovold, &lt;<a href=3D"m=
ailto:johan@kernel.org">johan@kernel.org</a>&gt; wrote:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc sol=
id;padding-left:1ex">[ +CC: Julia ]<br>
<br>
On Sun, Jan 18, 2026 at 11:35:48AM +0530, Archit Anant wrote:<br>
&gt; Use the %pe printk format specifier to print error codes as symbolic<b=
r>
&gt; names (e.g., -ENOMEM) instead of numeric values. This improves<br>
&gt; readability of error logs.<br>
<br>
Greybus and this driver uses numerical errnos in its error messages so<br>
this will introduce a needless inconsistency for no good reason.<br>
<br>
&gt; Issue identified by coccicheck using the ptr_err_to_pe.cocci script.<b=
r>
<br>
Also see:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"https://lore.kernel.org/all/20251029=
132922.17329-1-johan@kernel.org/" rel=3D"noreferrer noreferrer" target=3D"_=
blank">https://lore.kernel.org/all/20251029132922.17329-1-johan@kernel.org/=
</a><br>
<br>
Johan<br>
</blockquote></div>

--0000000000003a6d920648bd4de9--

--===============4949510548580152743==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

--===============4949510548580152743==--
