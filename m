Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id B491EA90604
	for <lists+greybus-dev@lfdr.de>; Wed, 16 Apr 2025 16:19:12 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 7A4ED45995
	for <lists+greybus-dev@lfdr.de>; Wed, 16 Apr 2025 14:19:11 +0000 (UTC)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	by lists.linaro.org (Postfix) with ESMTPS id E3DC143FCE
	for <greybus-dev@lists.linaro.org>; Wed, 16 Apr 2025 14:01:10 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=E7Cgtb4m;
	spf=pass (lists.linaro.org: domain of braker.noob.kernel@gmail.com designates 209.85.219.169 as permitted sender) smtp.mailfrom=braker.noob.kernel@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e6df32ad351so5424833276.2
        for <greybus-dev@lists.linaro.org>; Wed, 16 Apr 2025 07:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744812070; x=1745416870; darn=lists.linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aS82+lH6QsxhmtvYdbhWI17/yvZRt3Bo7vzMZfAr+hI=;
        b=E7Cgtb4mRJkeBAkpkGl7nzHAZAr1upLPnjngmH+d4WMFhW9V2Aia8htV3tFbrAsPyL
         aH8rf6p8juQwUj5f5qFBDJMtU9xYmXYsJHmTyhZqzt+zg8dnjl/95IAbJ/8SS2fDxQ+3
         LMqN1ncIJ4lJSvFZc0Je9vXV8yOxY7gHuRXClFdNu4aHzD7LpA67BeuA6bJk2vomGStg
         UL7/76MCtZj5shK33DqvpiduPSHwtSjOfBnuYv1WO2iBHvGHXQM/yJs24qSIHejNbh5L
         FinEGGcfh/cIt/ZUQgYNzURlowm6fz3UOe3edm/fQx+ND0+ChPsNZhaGvJuQy/XYVWre
         LcUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744812070; x=1745416870;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aS82+lH6QsxhmtvYdbhWI17/yvZRt3Bo7vzMZfAr+hI=;
        b=tfi1JdFBB9OQSuBczmCv6SPXOzRsupsYek49MtXoBMdk6UZiXjeKEP6iLArST/VdVg
         N6Id8oAqRE1Z4IzAx+MiiVGXYHQUHt1hJofGkY8hxGM89xlxSKK2OgFlxTFsznOMPfiF
         fMYWSX4lLTHyb/mY9Tv7xrregMkaANNzFSvWqpQm03zrKGJfw9k7RErbci5alspKwLiM
         +ZYgwQ1lEvN0BXDjH3l/u0o/agxB0306dEGcCXKEwuuCwE4FC1kQazH9w9RSNlsDSOmD
         NGsNKCSadmJlFUFuGl+k38RWy9+o7C0++/hX8CYNbco89663k8ze1BFGw38frqd97lVt
         yAlg==
X-Forwarded-Encrypted: i=1; AJvYcCXeTtdHt1PkQIxjPgNAjT5OCPz+k8wfJRtN/tn53KADnpFCuVeo+D1pmetMuX/agEExHY3CSE/QDzkcyA==@lists.linaro.org
X-Gm-Message-State: AOJu0YxRJJqn1HqvmClCWRbyEzTZ4emDAXrOQWQq+Eb3v/kziTUSd5GP
	vEYPbMVE/3d1IPeZx3dz3UORF8IlDjubKu4yInw8+STEnEhIwJL5eT0N/JrCPZzD6bEeBn3d/Tt
	IMG3NBzE+9kz54b7A2AFYZXayZg0=
X-Gm-Gg: ASbGncvAG9fM/Aq17ZiSMQn1uJr1BAKxHL5DDPGM2fnYaCuxjQiq/5rWT9yuy/LRToA
	dpIBT1Xo0Ta1oI2L50FFwNNhcNv/qbxSLexNswgjGeSTTXAv0va6P+w95anjshB93EXTmRL8Bj+
	7YFyKcDZ53Jq+hQ1CGHSbEx+aUHOcjCl5I+mSJIuyhZalviYnS0nK7CdQcp7Xyn0TvXRY=
X-Google-Smtp-Source: AGHT+IH3PwBlF/C4ixeDAQ4ysaDt4Z17lrWu/O4DqlCaBaRfkfvnnjLVZbUUZZSHVVu3TuTGVAhA5CZ/B9vRZ0nD9cQ=
X-Received: by 2002:a05:6902:260a:b0:e6d:dc83:285f with SMTP id
 3f1490d57ef6-e727593eabdmr2520960276.13.1744812070344; Wed, 16 Apr 2025
 07:01:10 -0700 (PDT)
MIME-Version: 1.0
References: <CAG+54DbvpWHyX8+ucEQpg2B6rNTJP11CRpYxcYVrKpKehzrK-A@mail.gmail.com>
 <Z_-11fvQJtiwAxaA@hovoldconsulting.com>
In-Reply-To: <Z_-11fvQJtiwAxaA@hovoldconsulting.com>
From: rujra <braker.noob.kernel@gmail.com>
Date: Wed, 16 Apr 2025 19:30:57 +0530
X-Gm-Features: ATxdqUHme8x0ou36rcWIxaW7Dcgccen7Uj-888b9FXv4mH_qnq_hP6Afzo26IVs
Message-ID: <CAG+54DbMYHDRMs+P1GcSYdqKJn+EBNA2xxXZfeWCX4DK+b31+g@mail.gmail.com>
To: Johan Hovold <johan@kernel.org>
X-Rspamd-Queue-Id: E3DC143FCE
X-Spamd-Bar: -------
X-Spamd-Result: default: False [-8.00 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[99.99%];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,linuxfoundation.org,lists.linaro.org,lists.linux.dev,vger.kernel.org];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	URIBL_BLOCKED(0.00)[mail.gmail.com:mid];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_ONE(0.00)[1];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.219.169:from];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RBL_SENDERSCORE_REPUT_8(0.00)[209.85.219.169:from];
	FREEMAIL_ENVFROM(0.00)[gmail.com]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-MailFrom: braker.noob.kernel@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: 42ZTCGG3HA4FR54C4VHPOFQTWAA5JVD5
X-Message-ID-Hash: 42ZTCGG3HA4FR54C4VHPOFQTWAA5JVD5
X-Mailman-Approved-At: Wed, 16 Apr 2025 14:19:06 +0000
CC: ayushdevel1325@gmail.com, elder@kernel.org, greybus-dev@lists.linaro.org, outreachy@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [FIRST-PATCH] staging : greybus : gb-beagleplay.c : fixing the checks as first-patch
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/42ZTCGG3HA4FR54C4VHPOFQTWAA5JVD5/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: multipart/mixed; boundary="===============5814912946325268066=="

--===============5814912946325268066==
Content-Type: multipart/alternative; boundary="000000000000a7214f0632e5b782"

--000000000000a7214f0632e5b782
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

hi team,
I have acknowledge the feedback and sure will try to change the file inside
drivers/staging directory.
thanking you,
regards,
rujra bhatt

On Wed, 16 Apr 2025, 7:21=E2=80=AFpm Johan Hovold, <johan@kernel.org> wrote=
:

> On Wed, Apr 16, 2025 at 05:47:41PM +0530, rujra wrote:
> > added comments on spinlocks for producer-consumer model, rearranged the
> > lines on function calls where it should not end with "(" this bracket,
> > also removed white-spaces and aligned the arguments of function calls.
> >
> > Signed-off-by: Rujra Bhatt <braker.noob.kernel@gmail.com>
>
> You're doing too many things in one patch, the patch is white space
> damaged, and the patch prefix is wrong since this driver does not live
> in staging.
>
> If you want to practise creating patches, please make sure to work in
> drivers/staging where changes like these may be accepted.
>
> Johan
>

--000000000000a7214f0632e5b782
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">hi team,<br>
 I have acknowledge the feedback and sure will try to change the file insid=
e drivers/staging directory. <br>
thanking you,<br>
regards,<br>
rujra bhatt</p>
<br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, 16 Apr 2025, 7:21=E2=80=AFpm Johan Hovold, &lt;<a h=
ref=3D"mailto:johan@kernel.org">johan@kernel.org</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px =
#ccc solid;padding-left:1ex">On Wed, Apr 16, 2025 at 05:47:41PM +0530, rujr=
a wrote:<br>
&gt; added comments on spinlocks for producer-consumer model, rearranged th=
e<br>
&gt; lines on function calls where it should not end with &quot;(&quot; thi=
s bracket,<br>
&gt; also removed white-spaces and aligned the arguments of function calls.=
<br>
&gt; <br>
&gt; Signed-off-by: Rujra Bhatt &lt;<a href=3D"mailto:braker.noob.kernel@gm=
ail.com" target=3D"_blank" rel=3D"noreferrer">braker.noob.kernel@gmail.com<=
/a>&gt;<br>
<br>
You&#39;re doing too many things in one patch, the patch is white space<br>
damaged, and the patch prefix is wrong since this driver does not live<br>
in staging.<br>
<br>
If you want to practise creating patches, please make sure to work in<br>
drivers/staging where changes like these may be accepted. <br>
<br>
Johan<br>
</blockquote></div>

--000000000000a7214f0632e5b782--

--===============5814912946325268066==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

--===============5814912946325268066==--
