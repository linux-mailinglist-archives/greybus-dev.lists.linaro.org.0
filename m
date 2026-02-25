Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iEEWAiTynmnoXwQAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Wed, 25 Feb 2026 13:59:16 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 65076197B68
	for <lists+greybus-dev@lfdr.de>; Wed, 25 Feb 2026 13:59:15 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 77C4C404B6
	for <lists+greybus-dev@lfdr.de>; Wed, 25 Feb 2026 12:59:14 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	by lists.linaro.org (Postfix) with ESMTPS id 175973F9BE
	for <greybus-dev@lists.linaro.org>; Wed, 25 Feb 2026 11:05:25 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=VwTRAtdc;
	spf=pass (lists.linaro.org: domain of azpijr@gmail.com designates 209.85.128.50 as permitted sender) smtp.mailfrom=azpijr@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-48069a48629so67140475e9.0
        for <greybus-dev@lists.linaro.org>; Wed, 25 Feb 2026 03:05:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772017524; x=1772622324; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jchPYDkTxTgSHgMaLoueosfcrqNqeUJ5bQfoOU6aUu0=;
        b=VwTRAtdcd5WcEvbRwnbJP7UcmQQEr48AxSlQgzwfukhed57U2yEpyBtV+V/Qcpdq94
         bW6oJ8uqAvKm3juQcjsx/08sSyYRbajVHEVFBWkSiSvheMdB4oEDgRjAkMUki+uvzlOw
         ZoQgle4OKalWY8k1eEI844L12YEEgC/774cU1TdvLssMFPa6uJSt5JStmJxndSx5Jq6R
         eNUq2FWIbfybZP4sZZdnoCfknw9G0eDrMf+Xj+stUy+yZFlCtmKD07WSe2O4aNZwF3QY
         XZVvDHYArv2eOqzgqoAgS5QguG44uKT6DlcX++TZSaa1PeGf1bqKwgyH0MrN29Mo4wLS
         jd3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772017524; x=1772622324;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jchPYDkTxTgSHgMaLoueosfcrqNqeUJ5bQfoOU6aUu0=;
        b=Hp6o2jAX/mL1DBRbUypbPBhlGmcr1Y+Ilv9BE23YOfIQ60Nf0ysz2T71viF5KrA6rW
         3ZjQB9KjB5nsPLt8/83Rg4NoZ0QJ4IBiCdwFAXqlHiiB4Mjpf+YQOE3cZsoswayi2U7W
         VxxTxe/tfzXFwebGyTP2UEo5/PDO25hLaY/MzYoTkFQYl18F942cJhWQYgTfoyTywBm5
         twYezrK9gxwdzgPdzbQe29UHoNTd9qBgRRzjhkqoIQYBVzUbrkMD0uxILJ22p/LLqG7r
         Rq0OzhSgsnn4N+dQx1m6Zrlb+xTJNTxBTLgFa9LCgkdlLZGcOVEMkpkEEiEvQqlzlh1+
         14AQ==
X-Gm-Message-State: AOJu0Yz6koeB3TeMkdWbq0N0XVtL2+FTF02h79bciUk0aWTRqYhG9mdA
	STpK+2/CQCDxriZ0xWbK0xNOYdiFR3c/niYyVDMF3tMabxTm+8lajk9H
X-Gm-Gg: ATEYQzygSWYdwjmKb2kKIxeeAkHsFTO8W4B3mxNtwGTnitXd3spKzHntbUEtCTVVdzl
	gj54XK2KccBW6nnxIVwROozTW58F2VlMG8SBIBxkLipGrOnaZqDUgzWfOGEWfG6RYPVrPmH6t0r
	izC4O5MSJ2LZ6J4aZpIdgGfgXnyDRmCf87bs+/9kAiGR47lAPTGfou4UupeK5RqP6MoRSMsf42H
	8ktfrsZEGmJOU7w9rro5V/yCsVHXH3zhY4u37F+48FFt95yLi6fWotdPnXW8oOkF0ixXOr1zv3l
	z+xWXsDow3tYe84NkHJae9k6UkyZjoxvr6vMy2nHcTZWvUxfnooJgVrkRdkEpAwHUOINghbPGfG
	p5zkoz0+Vu5Cp0iv0lrIbrO3IAw50KsUXqNJxTAKiUzuZZAO8BaGkjbqxIlka4nJqGXD3VvXzFj
	dxNTvW0jKnrKnagfAwFVDzPkRwWxa1t34uZA8Ila8=
X-Received: by 2002:a05:600c:674f:b0:483:6ff1:18b with SMTP id 5b1f17b1804b1-483a9555bafmr262387805e9.0.1772017523777;
        Wed, 25 Feb 2026 03:05:23 -0800 (PST)
Received: from localhost.localdomain ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd70e692sm57494205e9.7.2026.02.25.03.05.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 03:05:23 -0800 (PST)
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
To: johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org
Date: Wed, 25 Feb 2026 12:05:06 +0100
Message-ID: <20260225110511.107114-1-azpijr@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Spamd-Bar: --
X-MailFrom: azpijr@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: 3VHJRHPH6UXN377SI2DEXFI3ZHEEX4YD
X-Message-ID-Hash: 3VHJRHPH6UXN377SI2DEXFI3ZHEEX4YD
X-Mailman-Approved-At: Wed, 25 Feb 2026 12:59:02 +0000
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, azpijr@gmail.com
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] staging: greybus: camera: add comment for mutex
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/3VHJRHPH6UXN377SI2DEXFI3ZHEEX4YD/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.59 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx:c];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	FREEMAIL_CC(0.00)[lists.linaro.org,lists.linux.dev,vger.kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.984];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[azpijr@gmail.com,greybus-dev-bounces@lists.linaro.org];
	DKIM_TRACE(0.00)[gmail.com:-];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email]
X-Rspamd-Queue-Id: 65076197B68
X-Rspamd-Action: no action

Add a comment to the mutex definition in struct gb_camera to
describe what it protects, satisfying a checkpatch.pl CHECK.

Signed-off-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
---
Hi,

I noticed a CHECK for alignment in this file on line 267. However,
fixing it pushed the line over 100 characters. I felt that adding
extreme indentation might add more noise than value, so I've only
included the mutex comment fix here.

I'd appreciate your guidance on whether you prefer strict alignment
even if it breaks the 100-column rule in these specific cases.
---
 drivers/staging/greybus/camera.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/camera.c b/drivers/staging/greybus/camera.c
index 62b55bb28408..a6f3637b8871 100644
--- a/drivers/staging/greybus/camera.c
+++ b/drivers/staging/greybus/camera.c
@@ -53,7 +53,7 @@ struct gb_camera {
 	struct gb_connection *data_connection;
 	u16 data_cport_id;

-	struct mutex mutex;
+	struct mutex mutex; /* Protects camera state */
 	enum gb_camera_state state;

 	struct {
--
2.53.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
