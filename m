Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 64B686C96AE
	for <lists+greybus-dev@lfdr.de>; Sun, 26 Mar 2023 18:09:59 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 47DF043CD4
	for <lists+greybus-dev@lfdr.de>; Sun, 26 Mar 2023 16:09:58 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	by lists.linaro.org (Postfix) with ESMTPS id A29A03E96A
	for <greybus-dev@lists.linaro.org>; Fri, 24 Mar 2023 07:33:18 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20210112 header.b=TbYYunfA;
	spf=pass (lists.linaro.org: domain of sumitraartsy@gmail.com designates 209.85.214.170 as permitted sender) smtp.mailfrom=sumitraartsy@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id bc12so1143251plb.0
        for <greybus-dev@lists.linaro.org>; Fri, 24 Mar 2023 00:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679643198;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iFqGuLOjRab6Iw0/SrS988UhB5baV+MAIu0DYUhVDv8=;
        b=TbYYunfAKu2D1sw2lxqSPDFgQq4QxB+C6KjrzoaYoQYJvFSh0LNCsqjKiCCBwW8BrP
         rk4reQW4vq5tKm4rrPB80RQvjxvUG/AaHRLKhgsHpM7L1cV/MZw/iroBWlF4F6VYXt9t
         6a7u+Tk3RzBMl3L82gu3xu/B9ieFWV5IwnkU7rnS3FEalfbAiVwxZMP0k1sT6cWn+7cm
         cy9NzMtALZfOnXCmtCfiE+qxHRMfF0DsmmOG8YrZcLrkS5tzTZcmXzd4LWfmnwxpzmsa
         BMBl0cZkLNcPFz12Cc03ppXMt2WRhC1bLEW4pGj/FMc7OwKYL4cnTqvT3ZA8ZHNr52Fm
         MxHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679643198;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iFqGuLOjRab6Iw0/SrS988UhB5baV+MAIu0DYUhVDv8=;
        b=soAxAIhQRTAXZXZ3Du5niL5MOf8HaF3VcF4hQalx+qdXbYuZOtgAoUI4G3gSdwT/xD
         vXMiqn44rEw/DWUa5C2PDF4Pifq9X8/4Cm4+5708wXY7uA0Cg5Z/PtcN6R85kWXGp+h+
         iwpPSXJ/QtmHiBGv8vcjz72qLszyNLISlqZZJJnypALxQY5h4KoJCD7cDTK3LNsHUg8N
         wlnnbn4MCg27U6+bwWJIexQ2hYnWTnkKPcl8IO2ppSioAF1yIIOc78+UpG49xR4sBPua
         F+TbiZnI8N0vbwpsGURa9yczpAZYsr0P7v51TFSSH4kDLMHc1CewyRIiHDM7rpzm040U
         DRzg==
X-Gm-Message-State: AAQBX9eOqRAVtEPk49tOvxRhlnPekEy5uVBdoSasROUUBbkFBiMJ+PZ4
	azsGB6Zbe7j4bD69aHQ9Wbg=
X-Google-Smtp-Source: AKy350ZmLpoEtnDFhblQhO36/Gw2rsyoAihKSYf9RxCSZz16qfqGjrCblTnYSoqo8UcH1lMfy5MJkA==
X-Received: by 2002:a17:902:e84d:b0:1a1:b528:9bea with SMTP id t13-20020a170902e84d00b001a1b5289beamr2028314plg.50.1679643197759;
        Fri, 24 Mar 2023 00:33:17 -0700 (PDT)
Received: from ubuntu.localdomain ([59.89.175.90])
        by smtp.gmail.com with ESMTPSA id v12-20020a1709029a0c00b0019a75ea08e5sm13511604plp.33.2023.03.24.00.33.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Mar 2023 00:33:17 -0700 (PDT)
From: Sumitra Sharma <sumitraartsy@gmail.com>
To: outreachy@lists.linux.dev
Date: Fri, 24 Mar 2023 00:30:00 -0700
Message-Id: <f200046cde9d205904f3050718a3936ed813974f.1679642024.git.sumitraartsy@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1679642024.git.sumitraartsy@gmail.com>
References: <cover.1679642024.git.sumitraartsy@gmail.com>
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: A29A03E96A
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.60 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20210112];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.214.170:from];
	MIME_GOOD(-0.10)[text/plain];
	FROM_EQ_ENVFROM(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	FREEMAIL_CC(0.00)[kernel.org,linuxfoundation.org,lists.linaro.org,lists.linux.dev,vger.kernel.org,gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_TWO(0.00)[2]
X-MailFrom: sumitraartsy@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: MBETDB54DP27B7A4U3OO2CT7ASODAL3G
X-Message-ID-Hash: MBETDB54DP27B7A4U3OO2CT7ASODAL3G
X-Mailman-Approved-At: Sun, 26 Mar 2023 16:09:32 +0000
CC: johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Sumitra Sharma <sumitraartsy@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v2 2/3] Staging: greybus: Use inline function for gb_audio_manager_module
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/MBETDB54DP27B7A4U3OO2CT7ASODAL3G/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Convert 'gb_audio_manager_module' from a macro to a static
inline function, to make the relevant types apparent in the
definition and to benefit from the type checking performed by
the compiler at call sites.

Signed-off-by: Sumitra Sharma <sumitraartsy@gmail.com>
---
v2: Change patch subject, noted by Alison Schofield 
<alison.schofield@intel.com>

 drivers/staging/greybus/audio_manager_module.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/greybus/audio_manager_module.c b/drivers/staging/greybus/audio_manager_module.c
index 81b4ba607a0e..5f9dcbdbc191 100644
--- a/drivers/staging/greybus/audio_manager_module.c
+++ b/drivers/staging/greybus/audio_manager_module.c
@@ -12,8 +12,11 @@
 
 #define to_gb_audio_module_attr(x)	\
 		container_of(x, struct gb_audio_manager_module_attribute, attr)
-#define to_gb_audio_module(x)		\
-		container_of(x, struct gb_audio_manager_module, kobj)
+
+static inline struct gb_audio_manager_module *to_gb_audio_module(struct kobject *kobj)
+{
+	return container_of(kobj, struct gb_audio_manager_module, kobj);
+}
 
 struct gb_audio_manager_module_attribute {
 	struct attribute attr;
-- 
2.25.1

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
