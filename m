Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SJ5kN74kvGkxtgIAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Thu, 19 Mar 2026 17:30:54 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C0D22CED79
	for <lists+greybus-dev@lfdr.de>; Thu, 19 Mar 2026 17:30:54 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 453DB401C5
	for <lists+greybus-dev@lfdr.de>; Thu, 19 Mar 2026 16:30:53 +0000 (UTC)
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	by lists.linaro.org (Postfix) with ESMTPS id 8F8473F8EF
	for <greybus-dev@lists.linaro.org>; Thu, 19 Mar 2026 16:05:22 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=b2ADmtHv;
	arc=pass ("google.com:s=arc-20240605:i=1");
	spf=pass (lists.linaro.org: domain of grondon@gmail.com designates 209.85.161.48 as permitted sender) smtp.mailfrom=grondon@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-67bb19ac35aso769377eaf.1
        for <greybus-dev@lists.linaro.org>; Thu, 19 Mar 2026 09:05:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773936322; cv=none;
        d=google.com; s=arc-20240605;
        b=jRtzRx+zL+B8IFwHelt3yFy06fgrG1OK1wE4z29LEgrO/sAd4BuoOlAWBQ7n9wYQE4
         ugE3+e85J8x7fwn5uf1u8hYt8RZ/5rhd5jyvjQ8Bj717FwUxwd0/iZJu1QD1PsqtWSYr
         PDRYD8U04Jxxbul58PfOrfztwKUYs2Mz/t/ESIJcicOxyRP5rTu9K7JRH5ijmc+vuC9b
         eIVGGzU3IMPoSOwK52S0SnCMSDwWomJkJPFCQ7UwDWZ4NChkLgBML/0ZwLoUJhrlgadh
         YMdX/b6YL1XzkZpKxndp0en+R6CYmVih19iXtdLKJhxXKY7CRydnNszk1/4W1tTu7sH9
         hezg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=eGX/SkxVphBdxLbdjbMEDYx6SC8qr+cMDwIWtRBHGBY=;
        fh=uPLynRyvj3iukYvMVb+hk+FTL44140a2zd69dAU0JK0=;
        b=GVUnI9PytZtC6ZRq3sIEXmj1zdCW/L4Puvxx5/S6KY7USKQsEL+4AmYDMVjrqFhNTm
         XSZHBY39dvRyDFJLOxKHg9NrJOxZBzHimfFkVCZRaVEmgkzCNhUuflNy+FB7/NhEWaVt
         k4PCNGnpcfz4MlVbJj5HgzlHKfuc3TkGj/R8giMt8/QGIN0cAhyY3VXXCAGsGMIjXpo/
         wAA1DQO44hTgrgyT5t5lRAmXdQyCWfwnp1lpH2lCuqIQ8pONS4bf6evxraRbyuLyoWOE
         T1kMnBQG669flR2LyWayrMyzBm/sViMp0Zd1cBksYwSX6VqIwsFH1A326ENBVXuMUFSk
         KM6A==;
        darn=lists.linaro.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773936322; x=1774541122; darn=lists.linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eGX/SkxVphBdxLbdjbMEDYx6SC8qr+cMDwIWtRBHGBY=;
        b=b2ADmtHvoYQ9ejxO3ixocwHWl/rz9YXkc06L31FRooP/cwvdCsyz+0idgKmMONewVP
         DlXoG9tFeJ1QkE6PkJ4M1n59Z1bJ0eIzIYAgH/eh0gcbP56VURagX5yJxs111B9Jk8HD
         hh0p/Ny57sXqDDm6DPd5As2aJvv7yzjKThOb/evUP9gsgabRcSNlT7IPzMqPJiel1af2
         spARLBbS4nY+NGffTMq9sr1wioXq1380vD862GnjQas4U6mqPy+A8xDeSKKiVvUkqO6g
         VSznUrzjxbQ8N+ev6zAw0OD8Cnhgdpwl6194ZUbjUlQhkfUQL/SoKR+vIr5f7ObdKT3R
         09Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773936322; x=1774541122;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eGX/SkxVphBdxLbdjbMEDYx6SC8qr+cMDwIWtRBHGBY=;
        b=VrrHVloQ7p9hRGRovhSvYYPC6j8DFcaSTypjx43WX+AzbySb/1V35LSeghG39kVRFn
         nXPXPefluTw5DsJoU+lUVdJcWqofIgyV0AD0hrOHDZjo2kcynv2w3mnCN04Woywc98O0
         LuBlp9R9HvIx0xLhH+k7GoqexopoUpQG4rJCrTB/iRR/x4j7v8dmrJuUTyinJ9JHG4IN
         pkNXQ/KnfnyGqjWqUFOnwdFErd4DZxv8AUYNtXo9+6yBNpPaiDOSPerhASU9QwIYkuTv
         a2aubSIK8qjNOOOlavoTarQh1K8GMbE4OcutbmQEX+wF8PKTLXkmWaIDEluYv4mlgE9x
         TQnA==
X-Forwarded-Encrypted: i=1; AJvYcCWnZxmTU6nSCqeGTAIREkjCSYziqixWNE+driEaLRJtNTPJXJQlA0neMjYxzCSxeeTjz/HfYXfHnT55Gw==@lists.linaro.org
X-Gm-Message-State: AOJu0Yzg1D0qyrEeR31JwiKBckcBhvPhIt8wNE2RgJbjm61L6IyTOTWw
	QKc1J5+eYxWhRLjxhyK23+JrE/NQDTgvxSXyYoIoOSnLItM0kM+9mZWQn1iYG2RxBH66X48t0F4
	Y2mqt6B1QsRuQLjCpauRaoSQ9ykxGkew=
X-Gm-Gg: ATEYQzyg+Oc4aYv+N5dxSpRBcncCyJbv91Ea7iUI6pOMs9KnIkQPyyXS5GA4agQJKNr
	Zddgkfb76vF6ZfNIJ6mZZyyW/wKcpdxNP/T+WdiGxLjxc5RpXCKFjoQ0uxnssFxvcWCYwJihi0N
	w93YkN/RxT5JhZnA2k7VgfaIkWd/fdnNbSXjRFgCHXWoiG2JYcbJ0W9pfbGrpoCLsTk7GtoIKyN
	oFCfC4kgUe+9K3c8h3JwGtGMSzCqlVHlwN7xR5u7LvB/LlqsdeFMibultRGO7CIB6SqhFFk5vBa
	Ugjg0zTPWw==
X-Received: by 2002:a4a:e901:0:b0:67b:b96c:272b with SMTP id
 006d021491bc7-67c0db08e24mr5384596eaf.53.1773936321660; Thu, 19 Mar 2026
 09:05:21 -0700 (PDT)
MIME-Version: 1.0
References: <20260319120201.25210-1-grondon@gmail.com> <abwbB3KGkkTh4bYU@stanley.mountain>
In-Reply-To: <abwbB3KGkkTh4bYU@stanley.mountain>
From: Gabriel R <grondon@gmail.com>
Date: Thu, 19 Mar 2026 16:05:08 +0000
X-Gm-Features: AaiRm517nK8C_tRkr3szy_x7rudcZhjqkWKg_zMmW0dlTBR1ft3cqVg5ym8x1WE
Message-ID: <CAN_YdD-tWtFJmJGUG_fj89OnXknpiump=MgSSP_7k6C5YCyidQ@mail.gmail.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
X-Spamd-Bar: -----
X-MailFrom: grondon@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: HCZZDRBDRA3ODEAUIUHMWTFK7A7C67FG
X-Message-ID-Hash: HCZZDRBDRA3ODEAUIUHMWTFK7A7C67FG
X-Mailman-Approved-At: Thu, 19 Mar 2026 16:30:47 +0000
CC: johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: audio: use sysfs_emit() in show functions
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/HCZZDRBDRA3ODEAUIUHMWTFK7A7C67FG/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: multipart/mixed; boundary="===============0450034739369812405=="
X-Spamd-Result: default: False [1.59 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx:c];
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
	FROM_NEQ_ENVFROM(0.00)[grondon@gmail.com,greybus-dev-bounces@lists.linaro.org];
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[greybus-dev];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	NEURAL_SPAM(0.00)[0.659];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,linaro.org:email,lists.linaro.org:helo,lists.linaro.org:rdns]
X-Rspamd-Queue-Id: 5C0D22CED79
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

--===============0450034739369812405==
Content-Type: multipart/alternative; boundary="0000000000004e8db1064d62bcbf"

--0000000000004e8db1064d62bcbf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the review. I see the sprintf-to-sysfs_emit conversion was
already applied in staging-next. Apologies for the noise

Em qui., 19 de mar. de 2026 =C3=A0s 15:49, Dan Carpenter <
dan.carpenter@linaro.org> escreveu:

> Doesn't apply for me.
>
> On Thu, Mar 19, 2026 at 12:02:01PM +0000, Gabriel Rondon wrote:
> > Replace sprintf() with sysfs_emit() in all sysfs attribute show
> > functions. sysfs_emit() is aware of the sysfs buffer page size limit
> > and should be used instead of sprintf() for sysfs show callbacks to
> > prevent potential buffer overflows.
>
> Please clearly state that there are no buffer overflows in the current
> code.
>
> >
> > Also add the missing trailing newline to each output, which is the
> > standard convention for sysfs attributes.
> >
>
> This changes the user space API so it could potentially break
> a script.
>
> regards,
> dan carpenter
>
>

--0000000000004e8db1064d62bcbf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks for the review. I see the sprintf-to-sysfs_emit con=
version was already applied in staging-next. Apologies for the noise</div><=
br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=
=3D"gmail_attr">Em qui., 19 de mar. de 2026 =C3=A0s 15:49, Dan Carpenter &l=
t;<a href=3D"mailto:dan.carpenter@linaro.org">dan.carpenter@linaro.org</a>&=
gt; escreveu:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Do=
esn&#39;t apply for me.<br>
<br>
On Thu, Mar 19, 2026 at 12:02:01PM +0000, Gabriel Rondon wrote:<br>
&gt; Replace sprintf() with sysfs_emit() in all sysfs attribute show<br>
&gt; functions. sysfs_emit() is aware of the sysfs buffer page size limit<b=
r>
&gt; and should be used instead of sprintf() for sysfs show callbacks to<br=
>
&gt; prevent potential buffer overflows.<br>
<br>
Please clearly state that there are no buffer overflows in the current<br>
code.<br>
<br>
&gt; <br>
&gt; Also add the missing trailing newline to each output, which is the<br>
&gt; standard convention for sysfs attributes.<br>
&gt; <br>
<br>
This changes the user space API so it could potentially break<br>
a script.<br>
<br>
regards,<br>
dan carpenter<br>
<br>
</blockquote></div>

--0000000000004e8db1064d62bcbf--

--===============0450034739369812405==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

--===============0450034739369812405==--
