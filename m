Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uC7dMWPmr2nkdAIAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Tue, 10 Mar 2026 10:37:39 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 26759248973
	for <lists+greybus-dev@lfdr.de>; Tue, 10 Mar 2026 10:37:39 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 12B1C3F903
	for <lists+greybus-dev@lfdr.de>; Tue, 10 Mar 2026 09:37:38 +0000 (UTC)
Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	by lists.linaro.org (Postfix) with ESMTPS id E92E63F7B6
	for <greybus-dev@lists.linaro.org>; Mon,  9 Mar 2026 16:55:26 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=HPzBSpt5;
	spf=pass (lists.linaro.org: domain of luistermc789@gmail.com designates 74.125.224.54 as permitted sender) smtp.mailfrom=luistermc789@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-64c9707fc11so8774241d50.2
        for <greybus-dev@lists.linaro.org>; Mon, 09 Mar 2026 09:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773075326; x=1773680126; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LaWZMdjFEQ20IaqsZlhzMluUuWd0tbi4PXrKIMmPnEc=;
        b=HPzBSpt5SUOpcqXmw+6Dj/3im1Su7POmpomnY1Y8u9TDU3eEpdQV7zL9upgaCEtDBi
         41fXwGYq/5RqaZq8eZQ0zKMCkTzPqzX/tTQGp52JOc6OaplsY0DFwmA0BVsFbSk0Pvnc
         3MaiJZA63uGj1q3bIXiefPh7VlRLyK/JNRMNWubgzES28ApcpIvFrnvWrHHjIn4l1fGc
         oevNcFF1HM4vRoVwiaF0KAeaSO0u1mIBCo2pgcIzd9ci3+ubI2tLjTWS6VS3inusR4dY
         6O5FfyHB0vqBSD5o5Go6E2lx+AxaDKSS6uE5vbonfVBTO8/XczuZ3KmMvpJViGrsx4XJ
         5iew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773075326; x=1773680126;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LaWZMdjFEQ20IaqsZlhzMluUuWd0tbi4PXrKIMmPnEc=;
        b=RYb/epkHS+a3IXNCQqsm3/InQcb1VWmxxOblhO74N8zlw2qJe1bJZnnY9hq4Jg+veX
         Iv8TdcxA7OG/xi8rFcVCt2umvV8JhCtcCxEqQeF0BaBpbD8Inr9bUn6tFZA6FcBrjpag
         IeSL0QvnN0mic4kwP2M8PTZZQsVuo9r5kpI4XkBZowTLxnTrLoIsj5mzpC7nmktGE29p
         YnFnj/0PjFGesTxmJFmlqSeSvBmJF/0dJ7r9Ami3GRq30fYNF5Rlr7dRWuDmftk1wBp3
         ydSuguuhc54jxxfHR14oGlFsn46T3BJ/8dJ36JfC0eZN4dAAlCsAFJsnv62sMAqwLO9s
         pSRA==
X-Gm-Message-State: AOJu0YzIBGpR9D9/TWN74DBjz6oKWKVLQuDaGcfkmKzncpU8j+kERH0N
	6qSvt3Qv1O4onucUJ7no9SZxf/uI+7+URy4BzZXsOC+wP/yzPZQafYRtFIno9W/sEtM=
X-Gm-Gg: ATEYQzxsu18Wb4jyVr7jB3aWBcKo/AnCplBZZ3h4ex948XkQRPBbuq/DqMEXK2alyKF
	zFEuAk7OQWZkflRQx2S09J5HO/6Z0hwXw6xYDY9/kqZKTsO1Qb5464HXz7hzuTFAPXZqXcdTENn
	lhYLiHJxPqw3CHFsHNZULu2RnxX+BqnfostyXrfyAiUOwSaRYrXKJNtGSnnQBgN/hcHI0ZTu9p8
	uOuy9Zb6FxTO1qKMO0YVfHjbc76gmbFKzwNia45qBAiqP0qL5zhTQTZyhW0L4izN0rssqR+9Wks
	jyxiyakgswcooXBavsE5RUqBgyD6em/+A/a+XwzCGACbZ8OvRemr5ad0sxvOBE9Am1x0tMkTxxg
	YCXU4JF7MJXwVPeqWyewrhbjsrf4pchoa6L+5oJWlzU1s8UtsVud0OqiQKE+rgoIDoD9MgsMe0X
	m70FY77De1p9i7FQ==
X-Received: by 2002:a53:b1a4:0:b0:64c:c34c:60ea with SMTP id 956f58d0204a3-64d1429cc22mr8177078d50.54.1773075326224;
        Mon, 09 Mar 2026 09:55:26 -0700 (PDT)
Received: from horus ([138.97.160.237])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64d175d325dsm4910307d50.4.2026.03.09.09.55.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 09:55:25 -0700 (PDT)
From: Luis Soza Rodriguez <luistermc789@gmail.com>
X-Google-Original-From: Luis Soza Rodriguez <contact@sluisr.com>
To: pure.logic@nexus-software.ie,
	johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org
Date: Mon,  9 Mar 2026 10:55:22 -0600
Message-ID: <20260309165522.26388-1-contact@sluisr.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Spamd-Bar: ---
X-MailFrom: luistermc789@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: YUOL5XE3EXQVX7Z3CU4ZEHQNNHSX3M4M
X-Message-ID-Hash: YUOL5XE3EXQVX7Z3CU4ZEHQNNHSX3M4M
X-Mailman-Approved-At: Tue, 10 Mar 2026 09:37:36 +0000
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Luis Soza Rodriguez <contact@sluisr.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] staging: greybus: loopback: use sysfs_emit in sysfs show functions
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/YUOL5XE3EXQVX7Z3CU4ZEHQNNHSX3M4M/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 26759248973
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.59 / 15.00];
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.245];
	FROM_NEQ_ENVFROM(0.00)[luistermc789@gmail.com,greybus-dev-bounces@lists.linaro.org];
	DKIM_TRACE(0.00)[gmail.com:-];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email]
X-Rspamd-Action: no action

As per the kernel's documentation, sysfs_emit() is the preferred way
to format strings for sysfs attributes. It handles buffer overruns
safely. Replace sprintf calls with sysfs_emit across all loopback
sysfs show macros.

Signed-off-by: Luis Soza Rodriguez <contact@sluisr.com>
---
 drivers/staging/greybus/loopback.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/greybus/loopback.c b/drivers/staging/greybus/loopback.c
index aa9c73cb0..3a502d89d 100644
--- a/drivers/staging/greybus/loopback.c
+++ b/drivers/staging/greybus/loopback.c
@@ -125,7 +125,7 @@ static ssize_t field##_show(struct device *dev,			\
 			    char *buf)					\
 {									\
 	struct gb_loopback *gb = dev_get_drvdata(dev);			\
-	return sprintf(buf, "%u\n", gb->field);			\
+	return sysfs_emit(buf, "%u\n", gb->field);			\
 }									\
 static DEVICE_ATTR_RO(field)
 
@@ -137,8 +137,8 @@ static ssize_t name##_##field##_show(struct device *dev,	\
 	struct gb_loopback *gb = dev_get_drvdata(dev);			\
 	/* Report 0 for min and max if no transfer succeeded */		\
 	if (!gb->requests_completed)					\
-		return sprintf(buf, "0\n");				\
-	return sprintf(buf, "%" #type "\n", gb->name.field);		\
+		return sysfs_emit(buf, "0\n");				\
+	return sysfs_emit(buf, "%" #type "\n", gb->name.field);		\
 }									\
 static DEVICE_ATTR_RO(name##_##field)
 
@@ -158,7 +158,7 @@ static ssize_t name##_avg_show(struct device *dev,		\
 	rem = do_div(avg, count);					\
 	rem *= 1000000;							\
 	do_div(rem, count);						\
-	return sprintf(buf, "%llu.%06u\n", avg, (u32)rem);		\
+	return sysfs_emit(buf, "%llu.%06u\n", avg, (u32)rem);		\
 }									\
 static DEVICE_ATTR_RO(name##_avg)
 
@@ -173,7 +173,7 @@ static ssize_t field##_show(struct device *dev,				\
 			    char *buf)					\
 {									\
 	struct gb_loopback *gb = dev_get_drvdata(dev);			\
-	return sprintf(buf, "%" #type "\n", gb->field);			\
+	return sysfs_emit(buf, "%" #type "\n", gb->field);			\
 }									\
 static ssize_t field##_store(struct device *dev,			\
 			    struct device_attribute *attr,		\
@@ -199,7 +199,7 @@ static ssize_t field##_show(struct device *dev,		\
 			    char *buf)					\
 {									\
 	struct gb_loopback *gb = dev_get_drvdata(dev);			\
-	return sprintf(buf, "%u\n", gb->field);				\
+	return sysfs_emit(buf, "%u\n", gb->field);				\
 }									\
 static DEVICE_ATTR_RO(field)
 
@@ -209,7 +209,7 @@ static ssize_t field##_show(struct device *dev,				\
 			    char *buf)					\
 {									\
 	struct gb_loopback *gb = dev_get_drvdata(dev);			\
-	return sprintf(buf, "%" #type "\n", gb->field);			\
+	return sysfs_emit(buf, "%" #type "\n", gb->field);			\
 }									\
 static ssize_t field##_store(struct device *dev,			\
 			    struct device_attribute *attr,		\
-- 
2.53.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
