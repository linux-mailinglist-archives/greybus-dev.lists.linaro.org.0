Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ECF5933C2F
	for <lists+greybus-dev@lfdr.de>; Wed, 17 Jul 2024 13:25:12 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id AFD60410F4
	for <lists+greybus-dev@lfdr.de>; Wed, 17 Jul 2024 11:25:10 +0000 (UTC)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	by lists.linaro.org (Postfix) with ESMTPS id 4773740F75
	for <greybus-dev@lists.linaro.org>; Wed, 17 Jul 2024 06:58:38 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b="ex/7rgCl";
	spf=pass (lists.linaro.org: domain of soyjuanarbol@gmail.com designates 209.85.222.45 as permitted sender) smtp.mailfrom=soyjuanarbol@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-81013580bd5so319973241.0
        for <greybus-dev@lists.linaro.org>; Tue, 16 Jul 2024 23:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721199518; x=1721804318; darn=lists.linaro.org;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n5MI4wA4eNqCCeuCE33RMDqDRerDlDtTN/blIniiod4=;
        b=ex/7rgCl9E7RMdbACjCX57M9jJsdsiVEt3Zd3sOqDcGV6vS48RC15uSG69qWuUiwE3
         d/WKvXEoiYVsotj5tPfn+9z9zgh24r9VQC8tcuTpxzIAZdxjjtH289ER5+nAedzPzfP6
         RNZwDDUQM0/ETkpXnOkvVP1+ch1pBgdG55hbwxJ3Q9ix8beQMlapz8ZQE00IaOElcJUx
         FfIcOwqLwGaI1Rwy7FVvRjrwDdIAwpOZ2DBB2ouJpiKrCoLJoSsSWAg860l1HTS9LfaQ
         tPrr8dk8zs/5GrzV0TZZfTpHWvdF75MJSI0kPyz28jzir6GnoEhLx/4WP96is9Botcoz
         71dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721199518; x=1721804318;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n5MI4wA4eNqCCeuCE33RMDqDRerDlDtTN/blIniiod4=;
        b=nIl0xOmgyWO6T6wqZj/RBKOBcFHVYErlP9Lh3tfOXJ7KxZecyFwEIOzpSnlc/GPMkB
         3m4+PCeb9VpyE8u1IjEyjM8LExm2ZMtc4iEOzkqn7IBZ727wlnttNTCC/jpFCBoDoBm0
         4y0b6eKnbQk/C1QJGbrmtIPB1szIph3pvVz0e841UoJW+wwLxmMHhq7fwUDN23pwUI4c
         vnc+a98ITAjvtC7Tb9gapFf10nnxqNLQp9MSG2noBzWQBUTqGO0JKMzbi4sGmPvSBSh/
         tVmVWMhN6t5rRxRw55yp+7J+eJwdJPaIWbtOOkH4FZUu44KjB0FhbHIdFkr9tc6SSZzy
         E+eg==
X-Forwarded-Encrypted: i=1; AJvYcCVbhmKfurUkwxKsDP//4SjJsknX8EY1c2yx6R6RsKT8QnaDgio1guPV3810VO5jfhHxOncDT13+kgnUe85mqy1lugW/+cqxLqqj7tjK
X-Gm-Message-State: AOJu0YyuBsQ/S4F22BrIf+mCoGMh/hLChBXrzdNjxwd18L/kgS2/Cc+C
	jg/IQmlDq6qMtwsLPbHjtYuq6jSgy+gEtb8HxhUTF7FUYONh0H3N
X-Google-Smtp-Source: AGHT+IFJFn/H55QzwVuNHPtKpm9rl7xAFOCWsmfpf0dujwwCbunCOsARF3xBr8Fh2JtdSo1QIpXWyA==
X-Received: by 2002:a05:6102:80aa:b0:48f:e913:7f5b with SMTP id ada2fe7eead31-49159853aeamr817084137.19.1721199517752;
        Tue, 16 Jul 2024 23:58:37 -0700 (PDT)
Received: from fedora ([2800:e6:4000:47e:7c52:7bd4:cfe5:9874])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-491561c743fsm306949137.34.2024.07.16.23.58.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jul 2024 23:58:37 -0700 (PDT)
Date: Wed, 17 Jul 2024 01:58:34 -0500
From: Juan =?iso-8859-1?Q?Jos=E9?= Arboleda <soyjuanarbol@gmail.com>
To: gregkh@linuxfoundation.org, pure.logic@nexus-software.ie,
	johan@kernel.org
Message-ID: <ZpdrmuzGgYDJ-Bb0@fedora>
MIME-Version: 1.0
Content-Disposition: inline
X-Rspamd-Queue-Id: 4773740F75
X-Spamd-Bar: ---
X-Spamd-Result: default: False [-3.50 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	URIBL_BLOCKED(0.00)[checkpatch.pl:url];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.222.45:from];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-MailFrom: soyjuanarbol@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: 4W74GCVHEBGPJHFRVHNZYSQIRR2ZLRHL
X-Message-ID-Hash: 4W74GCVHEBGPJHFRVHNZYSQIRR2ZLRHL
X-Mailman-Approved-At: Wed, 17 Jul 2024 11:25:07 +0000
CC: linux-staging@lists.linux.dev, trivial@kernel.org, greybus-dev@lists.linaro.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] staging: greybus: Enclose multi-statement macro in do-while loop
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/4W74GCVHEBGPJHFRVHNZYSQIRR2ZLRHL/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

The macro `gb_loopback_stats_attrs` in the Greybus loopback driver
contains multiple statements, which should be enclosed in a do-while
loop to ensure proper execution and adhere to coding standards.

This patch modifies the `gb_loopback_stats_attrs` macro to enclose
its statements in a do-while loop, addressing the style error flagged
by checkpatch.pl.

Signed-off-by: Juan Jos=E9 Arboleda <soyjuanarbol@gmail.com>
---
 drivers/staging/greybus/loopback.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/greybus/loopback.c b/drivers/staging/greybus/l=
oopback.c
index 4313d3bbc23a..a97de86c67a5 100644
--- a/drivers/staging/greybus/loopback.c
+++ b/drivers/staging/greybus/loopback.c
@@ -163,9 +163,11 @@ static ssize_t name##_avg_show(struct device *dev,		\
 static DEVICE_ATTR_RO(name##_avg)
=20
 #define gb_loopback_stats_attrs(field)				\
-	gb_loopback_ro_stats_attr(field, min, u);		\
-	gb_loopback_ro_stats_attr(field, max, u);		\
-	gb_loopback_ro_avg_attr(field)
+	do {							\
+		gb_loopback_ro_stats_attr(field, min, u);	\
+		gb_loopback_ro_stats_attr(field, max, u);	\
+		gb_loopback_ro_avg_attr(field);			\
+	} while (0)
=20
 #define gb_loopback_attr(field, type)					\
 static ssize_t field##_show(struct device *dev,				\
--=20
2.45.2

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
