Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id B54EF96D876
	for <lists+greybus-dev@lfdr.de>; Thu,  5 Sep 2024 14:27:12 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 95A2B4251C
	for <lists+greybus-dev@lfdr.de>; Thu,  5 Sep 2024 12:27:11 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	by lists.linaro.org (Postfix) with ESMTPS id D3DD643C8E
	for <greybus-dev@lists.linaro.org>; Thu,  5 Sep 2024 01:57:49 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=QodUrMwQ;
	spf=pass (lists.linaro.org: domain of sayyad.abid16@gmail.com designates 209.85.210.169 as permitted sender) smtp.mailfrom=sayyad.abid16@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-715cc93694fso234738b3a.2
        for <greybus-dev@lists.linaro.org>; Wed, 04 Sep 2024 18:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725501469; x=1726106269; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=n7kGfxgSCo65vV7XDs8R4AUdpPBvnBCVoPJ54TTdnlE=;
        b=QodUrMwQPJDZ/RR8dL30/qzWpcZ8+Iqw/UMd59akpWHN/srnqxvZckAjqCuDmZK+nJ
         hLA9JbSZVRuYkrblVxaMgEItRXxEDbIufTDTLklYTBINkhX9xi0EKDmPtt4Fu3jfrUjn
         V+INaa44UKDXbmYpT7U+2Y4JlrI/lm0nb0HqcB4fYnO2BbFdG4vs5DZQyIHypVNQNv3Y
         tJp6uXXTLdj1H8AbJ1fVSThtXlUDLk5stSDWABRBRiwO2aMtQK4urbyuWWQvwFIf9lnS
         lwKIJ/YsYlrlMKZyKs0bPRmxLM0YjTPXqZNKzBg7in3ny1tEO/UqzcQ2KuUCMAo1LEq1
         MrHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725501469; x=1726106269;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n7kGfxgSCo65vV7XDs8R4AUdpPBvnBCVoPJ54TTdnlE=;
        b=TU7/+ZbvuGRRyC0CUfOBgrcrXHGABEEeRufGlMIWjVWfIsuD8TjZWaCvr2HNJqYGZw
         pB5TBG9n1U2weG24W64dw78sUrcpRKsF6YEZuNIDSDnj4w/4jDrkNNZHjhTPczGBJQbn
         zvzk+w99b65nEVApRMD8utprZtpT4xPTuAB/ddbrBn7b9vco1FIgP85u4RCDc4i1pbDZ
         Bt+6KkKx8/w/mXnGEERQkzquSguAhqBAbie4sUMJl0V52S44TkYMuUcl8ACNCQZioPAF
         1tSlZN8C5ihfti+d+eUnB/A11HqDzLmBLkjVXmVB72CuFYS3nLh7XtlFtEW26X5KLIKk
         2Bxw==
X-Forwarded-Encrypted: i=1; AJvYcCUQXoNR2sTsNz2/MupBOTPAo8B2M5tUjHy8GL+cIAw6sNn49B4ZfQEDONXfqMUIRuxZLhQsJlhAV1ORWA==@lists.linaro.org
X-Gm-Message-State: AOJu0YwDLDdI8oVRgkyJeY7tWXIRW3cHc1/9gR3R+Fua2nTRzoDRQJxR
	pcpGtfJ00qT1t4WYg5DSMd6O4W4enVG+ckpB0sbdntYGnS2rCh7/
X-Google-Smtp-Source: AGHT+IH3Zw+QyodS99FAVTsx6c6wJQ+bXdqteUMq9iTmUNbjqzda6Ru4FUyHwNNjoaRslU0wja3byA==
X-Received: by 2002:a05:6a00:1405:b0:714:20e6:1a92 with SMTP id d2e1a72fcca58-7173c1e0e1cmr12875865b3a.2.1725501468725;
        Wed, 04 Sep 2024 18:57:48 -0700 (PDT)
Received: from debian.tail629bbc.ts.net ([103.57.173.143])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-717785b599fsm2208658b3a.216.2024.09.04.18.57.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 18:57:48 -0700 (PDT)
From: Sayyad Abid <sayyad.abid16@gmail.com>
To: linux-kernel@vger.org
Date: Thu,  5 Sep 2024 07:27:15 +0530
Message-Id: <20240905015714.356662-1-sayyad.abid16@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Spamd-Bar: --
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: D3DD643C8E
X-Spamd-Result: default: False [-2.10 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17:c];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.210.169:from];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,linuxfoundation.org,lists.linaro.org,lists.linux.dev,nexus-software.ie,gmail.com];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	FROM_HAS_DN(0.00)[]
X-MailFrom: sayyad.abid16@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: FYTYNHB4HBHAFQNRV3LV3BOVGK6GYGM7
X-Message-ID-Hash: FYTYNHB4HBHAFQNRV3LV3BOVGK6GYGM7
X-Mailman-Approved-At: Thu, 05 Sep 2024 12:27:09 +0000
CC: johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, Sayyad Abid <sayyad.abid16@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] staging: greybus: Fix coding style and syntax issues
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/FYTYNHB4HBHAFQNRV3LV3BOVGK6GYGM7/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

fix errors from running scripts/checkpatch.pl, including:
- Added spaces before open braces and parentheses where required.
- Resolved macro argument precedence issues by adding parentheses.
- Corrected trailing whitespace and improper indentation.

No functional changes introduced, just cleanups for better code quality.

Signed-off-by: Sayyad Abid <sayyad.abid16@gmail.com>
---
 drivers/staging/greybus/loopback.c | 58 ++++++++++++++++--------------
 1 file changed, 31 insertions(+), 27 deletions(-)

diff --git a/drivers/staging/greybus/loopback.c b/drivers/staging/greybus/loopback.c
index 1f19323b0e1a..3e39a90cf86c 100644
--- a/drivers/staging/greybus/loopback.c
+++ b/drivers/staging/greybus/loopback.c
@@ -163,35 +163,39 @@ static ssize_t name##_avg_show(struct device *dev,		\
 static DEVICE_ATTR_RO(name##_avg)
 
 #define gb_loopback_stats_attrs(field)				\
-	gb_loopback_ro_stats_attr(field, min, u);		\
-	gb_loopback_ro_stats_attr(field, max, u);		\
-	gb_loopback_ro_avg_attr(field)
+	do {							\
+		gb_loopback_ro_stats_attr(field, min, u);		\
+		gb_loopback_ro_stats_attr(field, max, u);		\
+		gb_loopback_ro_avg_attr(field)				\
+	} while (0)
 
 #define gb_loopback_attr(field, type)					\
-static ssize_t field##_show(struct device *dev,				\
-			    struct device_attribute *attr,		\
-			    char *buf)					\
-{									\
-	struct gb_loopback *gb = dev_get_drvdata(dev);			\
-	return sprintf(buf, "%" #type "\n", gb->field);			\
-}									\
-static ssize_t field##_store(struct device *dev,			\
-			    struct device_attribute *attr,		\
-			    const char *buf,				\
-			    size_t len)					\
-{									\
-	int ret;							\
-	struct gb_loopback *gb = dev_get_drvdata(dev);			\
-	mutex_lock(&gb->mutex);						\
-	ret = sscanf(buf, "%"#type, &gb->field);			\
-	if (ret != 1)							\
-		len = -EINVAL;						\
-	else								\
-		gb_loopback_check_attr(gb, bundle);			\
-	mutex_unlock(&gb->mutex);					\
-	return len;							\
-}									\
-static DEVICE_ATTR_RW(field)
+do {									\
+	static ssize_t field##_show(struct device *dev			\
+				    struct device_attribute *attr,	\
+				    char *buf)				\
+	{								\
+		struct gb_loopback *gb = dev_get_drvdata(dev);		\
+		return sprintf(buf, "%" #type "\n", gb->field);		\
+	}								\
+	static ssize_t field##_store(struct device *dev,		\
+				    struct device_attribute *attr,	\
+				    const char *buf,			\
+				    size_t len)				\
+	{								\
+		int ret;						\
+		struct gb_loopback *gb = dev_get_drvdata(dev);		\
+		mutex_lock(&gb->mutex);					\
+		ret = sscanf(buf, "%"#type, &gb->field);		\
+		if (ret != 1)						\
+			len = -EINVAL;					\
+		else							\
+			gb_loopback_check_attr(gb, bundle);		\
+		mutex_unlock(&gb->mutex);				\
+		return len;						\
+	}								\
+	static DEVICE_ATTR_RW(field					\
+} while (0)
 
 #define gb_dev_loopback_ro_attr(field, conn)				\
 static ssize_t field##_show(struct device *dev,		\
-- 
2.39.2

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
