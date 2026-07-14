Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Bw5hNm5FV2qkIQEAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Wed, 15 Jul 2026 10:31:42 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id B35E475BE6C
	for <lists+greybus-dev@lfdr.de>; Wed, 15 Jul 2026 10:31:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=gmail.com header.s=20251104 header.b=IEnpZjzQ;
	spf=pass (mail.lfdr.de: domain of "greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org" designates 44.210.186.118 as permitted sender) smtp.mailfrom="greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org";
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=gmail.com (policy=none);
	arc=reject ("signature check failed: fail, {[1] = sig:google.com:reject}")
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id CBB6440A24
	for <lists+greybus-dev@lfdr.de>; Wed, 15 Jul 2026 08:31:41 +0000 (UTC)
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	by lists.linaro.org (Postfix) with ESMTPS id B9837401B9
	for <greybus-dev@lists.linaro.org>; Tue, 14 Jul 2026 08:54:39 +0000 (UTC)
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-7eb61bbeb25so432522a34.1
        for <greybus-dev@lists.linaro.org>; Tue, 14 Jul 2026 01:54:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784019279; cv=none;
        d=google.com; s=arc-20260327;
        b=VZEh9STnSh5CTsR1vwtRcYxVz+2KRMsFfFYgkh+LyxhXK9PqBxKm+AAxdsPpgVuwb+
         m2aWXu/skOCJtW6BIiCYbCjZZ+VqqUzhsBpB5QD4tHIjWnBLWBvgg2C7Oq8kY4hNtVyI
         s0dM4iZ/fB6iZVes4q4nDHxuZCS2k4v0S4tqpJQa52vfMFrDq/nBjJKiZZ4EQxuRHUM6
         9uwTdqfQMyX98tM6O3pUbH6I8Mvqsf6tk5U8Tuyq2+8P1N+afM3sdUb3hrlisFHPzspi
         ChMxh1dIGKUzr+4BLstcO5RrMIPhftryhmlfcP2X1/SA3K28KCmgRQw9oi9cU3zss7kU
         XtjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=D5meVHbHX7r/k1qre2ohKxZGrJcpHJIe7SsiCCjrA7s=;
        fh=xtm6YZCTnuHipFsFITYd4qtYft3uoih6U88cU1o9nsY=;
        b=a1KvVMSf7b/gEsqXTFi7bihAl46jFs8ocYo3hIfffCv7r6fhNg9+m2fB3GcMRRolIj
         Fb7IB11ilNwXuNDH0/mhTCk+MzUzUk/xMrKmhDb0QhnylE+RTyvs1WCx7GdVBpV3uTtl
         BxZoYTxNYD2wZpHJ4jm9FHiHlTYL0t8sC8NwtCWUGsxDD2o1RjEOgVM4AKVeWUg6eDrs
         p+kPyU5iXf+vqOZSUvipryGQcE2PO+gngGRkv9VKoB3eYTSwlxOOT66GUnCfpRtDG21A
         3Lj/Ybyq/HqLdPzim+aQGSdIa08i3iQZoroQWrmZf70vLp6bBS3Hdc0swZNM6flmdy6n
         V9Lw==;
        darn=lists.linaro.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784019279; x=1784624079; darn=lists.linaro.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=D5meVHbHX7r/k1qre2ohKxZGrJcpHJIe7SsiCCjrA7s=;
        b=IEnpZjzQhuXYeajWmbn9jm8AdMgz2oO5TGPIU7Mo5vXHtB1r8OD2thehJLVKfrZoDJ
         1GgmeCwCgmEhvQgZ0YI7CvRO9hwJIlw4YLAVKulxBYLDG6vdmi0UMIwdEIeVKea3qQ7W
         8tekBsu1Awc/34653tOsZJa4XArciVsgWYFCkBucAoKJVMiPPqWWhPl2GBxLPnFm8rfL
         2syjaK4w2TvobxzthyNJrgnMMCzFqYaRLHKSucqZKvSrK90Oy+/TwxUCpsw2IbBBvTZa
         pGVeqGiVp6dHyJZZblzKBtPFbw9f6xv2lv2TPkqGwpZZz5menhZMyjdemd6mnfz0d+lJ
         HF2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784019279; x=1784624079;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=D5meVHbHX7r/k1qre2ohKxZGrJcpHJIe7SsiCCjrA7s=;
        b=A6EctYyAjyzF/Ft0zw9bJbC9sApIjUtm1I1ChhvKiq4kQRvOjl9dmQw2RNq1//NzFn
         05uVH/Hjd5kLZ5Jqu/TlFb+Kr/tZeM2b8KRH6HFL4jyB8uXPhNXmn7uQfdpE8E9BrV8Y
         FuXqEyX9K4SHnm3T1NpPsNpAWx3okX+A8Y57+0GGfUkXyCj45fAghOI63gDIiZO3Kzv8
         /+SynzvcbQYqjZzr35F4O+k/20tM1MqThzH5WS0GxeEXFJouL2TWvZWY2VnGvv5eJWCB
         3+LJ9+xEusHimDJ19EIJLi6lTRH/IAHFak45GHYPhC0189u8w3Dr1t/E0cc7C+BG+FHT
         7bBw==
X-Gm-Message-State: AOJu0YxTtl2/u37V30R1dsfoUIBdtxZcdqLWARoM55CzupyZz1akLWR7
	nQVvzZIuUQJYvN//WfSYRvbjQrVWn/qvSdrnjhaQ45YDGR5ZgVgh55B0Wgj7PyXNvSfkBZAissu
	Co/57ESE6K7r8DCMvIHVWcIXQ6QD7THH41OcV
X-Gm-Gg: AfdE7cnbKFuyjaRSQgwK9H1xwyotZGJbSGsARPPTzsSmyTSqyfRX2jPhrClXm6+cVIb
	DuEKAcnERoM9Llj33UuKC01eYT/kyS1O6B+9+BrjTl5D96O85poyaWBzrfPZQAqTuwf3XQoDht+
	0/F7aiwDMIOdtolhzC04BiYpg7p1TdoZ0tOW9v8LLAiVo5rbuQzdZYhRdmsuuUIEgyJj1PykIlk
	Dka4R+BX6FZ8hy63twC1K3iBK2wQza0ZSv7wlIZEArD8nUjsytFwQv/b9Sfc3+LH4NMwsEian77
	FSMFAtW+xaPhMt2qHHyH86i7C9BttZ63+OJ3Gd7BqdBow/vDqj2redZberKuldmVN8rx6mvrv0Y
	IBzkW0KdoDSlx8hKmkuuWhs6XaDuVQRP+HHIPDi006YDm6ZOe
X-Received: by 2002:a05:6871:79a0:b0:448:5af5:c026 with SMTP id
 586e51a60fabf-451f10da380mr7323335fac.12.1784013136229; Tue, 14 Jul 2026
 00:12:16 -0700 (PDT)
MIME-Version: 1.0
From: Alfie Varghese <alfievarghese22@gmail.com>
Date: Tue, 14 Jul 2026 12:42:04 +0530
X-Gm-Features: AUfX_my5ry7nqhGRNTBkuVgd44MMyahHxgDSk8XnHhGArTPYT53y1b5bxGQ_nSA
Message-ID: <CAHp0ZPPbdc+5PgFUDVgamt_Ds8xAY=K_GgH3abx3ucpndGepFg@mail.gmail.com>
To: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
X-Spamd-Bar: -----
X-MailFrom: alfievarghese22@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: LW42M5NAO3GWHMZ6SWHHQAG6ND3J6MU4
X-Message-ID-Hash: LW42M5NAO3GWHMZ6SWHHQAG6ND3J6MU4
X-Mailman-Approved-At: Wed, 15 Jul 2026 08:31:34 +0000
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, dan.carpenter@linaro.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v2] staging: greybus: uart: return tty_alloc_driver() errors
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/LW42M5NAO3GWHMZ6SWHHQAG6ND3J6MU4/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: multipart/mixed; boundary="===============3396156147184316451=="
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.59 / 15.00];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	DATE_IN_PAST(1.00)[25];
	R_SPF_ALLOW(-0.20)[+mx:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[multipart/mixed,multipart/alternative,text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:johan@kernel.org,m:elder@kernel.org,m:gregkh@linuxfoundation.org,m:greybus-dev@lists.linaro.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:dan.carpenter@linaro.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:~,4:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[alfievarghese22@gmail.com,greybus-dev-bounces@lists.linaro.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alfievarghese22@gmail.com,greybus-dev-bounces@lists.linaro.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	TAGGED_RCPT(0.00)[greybus-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B35E475BE6C

--===============3396156147184316451==
Content-Type: multipart/alternative; boundary="000000000000427b5c06568cedd8"

--000000000000427b5c06568cedd8
Content-Type: text/plain; charset="UTF-8"

gb_tty_init() maps any tty_alloc_driver() failure to -ENOMEM.
tty_alloc_driver() currently always returns -ENOMEM on failure,
so this does not change behavior in practice. However, returning
PTR_ERR(gb_tty_driver) is more correct and consistent with kernel
conventions, preserving any future error codes the function might
return.

Signed-off-by: Alfie Varghese <alfievarghese22@gmail.com>
---
v2: updated commit message per Dan Carpenter's review to clarify
that tty_alloc_driver() currently only returns -ENOMEM, making
this a style fix rather than a behavioral change.

drivers/staging/greybus/uart.c | 2 +-
1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/uart.c b/drivers/staging/greybus/uart.c
index 7d060b4cd33d..24b4dab069c3 100644
--- a/drivers/staging/greybus/uart.c
+++ b/drivers/staging/greybus/uart.c
@@ -951,7 +951,7 @@ static int gb_tty_init(void)
if (IS_ERR(gb_tty_driver)) {
pr_err("Can not allocate tty driver\n");
- retval = -ENOMEM;
+ retval = PTR_ERR(gb_tty_driver);
goto fail_unregister_dev;
}

--000000000000427b5c06568cedd8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><div dir=3D"auto">gb_tty_init() maps any tty_alloc_d=
river() failure to -ENOMEM.<br>tty_alloc_driver() currently always returns =
-ENOMEM on failure,<br>so this does not change behavior in practice. Howeve=
r, returning<br>PTR_ERR(gb_tty_driver) is more correct and consistent with =
kernel<br>conventions, preserving any future error codes the function might=
<br>return.<br><br>Signed-off-by: Alfie Varghese &lt;<a href=3D"mailto:alfi=
evarghese22@gmail.com" target=3D"_blank" rel=3D"noreferrer">alfievarghese22=
@gmail.com</a>&gt;<br>---<br>v2: updated commit message per Dan Carpenter&#=
39;s review to clarify<br>    that tty_alloc_driver() currently only return=
s -ENOMEM, making<br>    this a style fix rather than a behavioral change.<=
br><br> drivers/staging/greybus/uart.c | 2 +-<br> 1 file changed, 1 inserti=
on(+), 1 deletion(-)<br><br>diff --git a/drivers/staging/greybus/uart.c b/d=
rivers/staging/greybus/uart.c<br>index 7d060b4cd33d..24b4dab069c3 100644<br=
>--- a/drivers/staging/greybus/uart.c<br>+++ b/drivers/staging/greybus/uart=
.c<br>@@ -951,7 +951,7 @@ static int gb_tty_init(void)<br> 	if (IS_ERR(gb_t=
ty_driver)) {<br> 		pr_err(&quot;Can not allocate tty driver\n&quot;);<br>-=
		retval =3D -ENOMEM;<br>+		retval =3D PTR_ERR(gb_tty_driver);<br> 		goto f=
ail_unregister_dev;<br> 	}</div></div></div>

--000000000000427b5c06568cedd8--

--===============3396156147184316451==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

--===============3396156147184316451==--
