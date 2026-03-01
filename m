Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MAAgMsZRpWkc8wUAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Mon, 02 Mar 2026 10:00:54 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id DEB6E1D5276
	for <lists+greybus-dev@lfdr.de>; Mon, 02 Mar 2026 10:00:47 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id D84763F809
	for <lists+greybus-dev@lfdr.de>; Mon,  2 Mar 2026 09:00:41 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	by lists.linaro.org (Postfix) with ESMTPS id 3DCD53ED23
	for <greybus-dev@lists.linaro.org>; Sun,  1 Mar 2026 09:52:09 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b="f/LxK2yR";
	spf=pass (lists.linaro.org: domain of activprithvi@gmail.com designates 209.85.215.171 as permitted sender) smtp.mailfrom=activprithvi@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c7103601c8cso1513540a12.2
        for <greybus-dev@lists.linaro.org>; Sun, 01 Mar 2026 01:52:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772358728; x=1772963528; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Nm5Am12037HbAYWTJo8eItPltWuuhhyfYxRI/gBF+1w=;
        b=f/LxK2yRuyQNrc7zCnRXwtU2DPHBGNkGNGWdSx9HSdNgb9PVwzS/NX8MNlvvMRoU5V
         t1fejXuPbfSs1hUPKANn+n1WxgLTSBZQEmCjl3XXLi+YFt8ISdP+/4pm7/NI6D9B89Vt
         xOIxPWQC7xa1dzbutsKrMc+WuqkJhmtohXk6TbZvXvt6kcb7EqqOMvG0aQx3nzpO3J81
         rynQY6KBHtzgxTfLCKM1BA1REXdQIxnvIqeVa9Yh9JpW4hwGMO6p3Pcq3EIH9tt6oNAb
         ff9Q1i/CEIUj8H4V+BhTMs913Lt2eO4MKmoJ1UqPvIO6I9vv+YQoFqGygezFC6BcaRCZ
         SL8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772358728; x=1772963528;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nm5Am12037HbAYWTJo8eItPltWuuhhyfYxRI/gBF+1w=;
        b=OAPwab130+wpKcIqI23YfIpOjaY7aWJwVpEKH9/ei/MAR+C2KiFVt3Iw8E3/t4eXAS
         J3qsIiPJExSfqD5XSQLXNGBgPGAaETCExnh9gTCcnJEvUR1Rd6DedCyyc5xrjeQCuebF
         i6ZIRgBrZl691rA9tPk5U+yG2yJhKMDkBSFJ0t9Mv+hjoeE4QcW6db2Thlv3S+4q9Fst
         PxHqLWT1ZXXBf9irDBUa4sLSJBN9RrGQOKS9bJpfqlcIinL9nMwObG/JNOsjYRK4S5Qf
         sgKVuOu6JBXf/6fxBy/+CWGiBQo4IeeszCglRFzMnCIgKXEDLBD5Nn/Nd5kUnQvOydAi
         /9+g==
X-Gm-Message-State: AOJu0YyNChUpFAr5Kw86ISUVKL/M//mnf1lm0g52xdUpAF9gAQzKBQkJ
	3oW2JA1Ou5gOPBKHLiQaNuixzxg5UfWRzLapXyRwt+wb5HM2yIlJcwWY
X-Gm-Gg: ATEYQzwGlKkRa8Tulxa9DAr5fpEXmElTu0UU6BPhrIbhEwQq981HssDJAO9Z8CIabuL
	9UD29yVzf37AEHK5Oyh3KUfcnFG89DwJsmeuJj4lpT4mECF/TBp/wmR7Wkz6J3BgBRgEAx9cqoj
	5rsNSEowIy4dn41hovayJCYr1S6gaxBlWwtT1Bd45UkFBdLTys9oWskQtCD/Ws7yXDH6iN5RIUE
	r53j5C+My5vYe9Op2MD6XI6SW268izQllkv80Rg20XLeEUgoNckEgRYZ3uy/psyp28fqp6Bxii4
	P7wTjD0sedXvDawP6SKA+WPwKqfNwrQGUXpMuIrHypSZxofQwzLCeNI7ncZZlOufkFRaRkbTxmO
	/7rHyykiPMAE50G7ep/ILjp2BwFEKmYeVgoXeXosXA9dMdH2FBMEPWM1nwGGP9+qKNnr2HSolle
	Olv7jISRvLSXPFELPSm5JIkKLCn89bRSSo5ex6aR0K
X-Received: by 2002:a05:6a21:6da2:b0:38b:ecae:671b with SMTP id adf61e73a8af0-395c373cacemr8691204637.0.1772358728247;
        Sun, 01 Mar 2026 01:52:08 -0800 (PST)
Received: from localhost.localdomain ([111.125.231.159])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c70fa801963sm8971216a12.21.2026.03.01.01.52.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 01:52:07 -0800 (PST)
From: Prithvi Tambewagh <activprithvi@gmail.com>
To: johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org
Date: Sun,  1 Mar 2026 15:21:54 +0530
Message-Id: <20260301095154.144809-1-activprithvi@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Spamd-Bar: --
X-MailFrom: activprithvi@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: EFJCNU7YMAELT5VVIXR6FEQRKPOLR2HI
X-Message-ID-Hash: EFJCNU7YMAELT5VVIXR6FEQRKPOLR2HI
X-Mailman-Approved-At: Mon, 02 Mar 2026 09:00:32 +0000
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org, david.hunter.linux@gmail.com, khalid@kernel.org, Prithvi Tambewagh <activprithvi@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] staging: greybus: standardize data type and fix alignment to parentheses
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/EFJCNU7YMAELT5VVIXR6FEQRKPOLR2HI/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.09 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[lists.linaro.org,lists.linux.dev,vger.kernel.org,linuxfoundation.org,gmail.com,kernel.org];
	ARC_NA(0.00)[];
	RSPAMD_URIBL_FAIL(0.00)[linaro.org:query timed out];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-0.996];
	FROM_NEQ_ENVFROM(0.00)[activprithvi@gmail.com,greybus-dev-bounces@lists.linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email]
X-Rspamd-Queue-Id: DEB6E1D5276
X-Rspamd-Action: no action

Standardize code in the file:
drivers/staging/greybus/Documentation/firmware/authenticate.c
by making the following changes:

1. Remove redundant 'int' from 'unsigned long long int' as suggested by
   checkpatch when printing the obtained device UID:
   printf("UID received: 0x%llx\n", *(unsigned long long *)(uid.uid));

2. Fix alignment of multi-line printf statement to match opening
   parentheses:
   printf("Authenticated, result (%02x), sig-size (%02x)\n",
          authenticate.result_code, authenticate.signature_size);

Signed-off-by: Prithvi Tambewagh <activprithvi@gmail.com>
---
 drivers/staging/greybus/Documentation/firmware/authenticate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/greybus/Documentation/firmware/authenticate.c b/drivers/staging/greybus/Documentation/firmware/authenticate.c
index 3d2c6f88a138..ba4b16b04557 100644
--- a/drivers/staging/greybus/Documentation/firmware/authenticate.c
+++ b/drivers/staging/greybus/Documentation/firmware/authenticate.c
@@ -58,7 +58,7 @@ int main(int argc, char *argv[])
 		goto close_fd;
 	}
 
-	printf("UID received: 0x%llx\n", *(unsigned long long int *)(uid.uid));
+	printf("UID received: 0x%llx\n", *(unsigned long long *)(uid.uid));
 
 	/* Get certificate */
 	printf("Get IMS certificate\n");
@@ -85,7 +85,7 @@ int main(int argc, char *argv[])
 	}
 
 	printf("Authenticated, result (%02x), sig-size (%02x)\n",
-		authenticate.result_code, authenticate.signature_size);
+	       authenticate.result_code, authenticate.signature_size);
 
 close_fd:
 	close(fd);

base-commit: eb71ab2bf72260054677e348498ba995a057c463
-- 
2.34.1

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
