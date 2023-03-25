Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 102CE6C96B3
	for <lists+greybus-dev@lfdr.de>; Sun, 26 Mar 2023 18:10:26 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id BBE3F43CD2
	for <lists+greybus-dev@lfdr.de>; Sun, 26 Mar 2023 16:10:24 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	by lists.linaro.org (Postfix) with ESMTPS id 3746C3E948
	for <greybus-dev@lists.linaro.org>; Sat, 25 Mar 2023 08:32:49 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20210112 header.b=HgZotS7C;
	spf=pass (lists.linaro.org: domain of sumitraartsy@gmail.com designates 209.85.215.172 as permitted sender) smtp.mailfrom=sumitraartsy@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pg1-f172.google.com with SMTP id y19so2400889pgk.5
        for <greybus-dev@lists.linaro.org>; Sat, 25 Mar 2023 01:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679733168;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rZRk78dM+sIDcTF06PFu8cSmlnVuUZmfpf5YGgQ/R64=;
        b=HgZotS7CNv8U8GKTbwzwaX9ktzODi2OfWdl7CnvyiyiZBIvcGFPB9aZYPtM0+NxAAa
         65o2MsIyYii9yQz7c1Y0VQw4HafGwYxCOXn3N2E1jWpfTZVOE+sc1l0Sj8Gp9ZlkHFjD
         eeEsi1WzsA3Pnd/lId0u2m0rA3PgHJlJS5mrIe5pdUUbGLXKtRVgmdsVyAXysNf3LdbV
         0FpEbGccM8JNzG6oz9cjdByjZikUo0673yJI4A4uvJa8PpIUbmi9LjniUCHq5x7KLqCX
         vY3Veu32Gm/HvmjeYEeRkMpmP15EimNKRqj4SuUQaipnZRxKCASMxkQzffLByQeOf0T1
         vwZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679733168;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rZRk78dM+sIDcTF06PFu8cSmlnVuUZmfpf5YGgQ/R64=;
        b=gwNAx39IeiiZXtwilEp1OiHJZrVBuWQ+0CIPZlXhL1CcYxyDF/VGNbA67ZQwySIKSy
         ug1d3WFMhqOvhwd0nW6FkixcnwBm7xZwtA1dY751T//MNQ1O012Ogw/ZvoFRTQlRF2jN
         xlCQm6dRPILeNfC6gd/0I9PgCZIWJx1Qe61n4hjqBGWXupfZXBmLtL77cXxKD8Pz6cQl
         IQYn7LnuwOo3wii8pRfd02AJ67NLa+ZNSc53MZWHUmG4x75XIomaxgnToXuFhD66Cjqo
         PJUKWMdE+9MaWT4h4lrnOqq76De7hiZwpRCz8DAzmUnSTzy44eexvdnT0CUzRrPdfkhC
         Y+YA==
X-Gm-Message-State: AAQBX9fjHMl2V2Rq06MCnK67x2JOkUPLLxSUwcYg5nPVT/US/C+Y5XO2
	U2R5zgSD9xNlV1n43ucvlcs=
X-Google-Smtp-Source: AKy350bTu6uj1pG9dejrYD50lwhf789Tv6IN/ryzCGZ3bDUe0DQDTLTZqN5rKPJ53FnBKsaiGEkevw==
X-Received: by 2002:a62:5e81:0:b0:627:fd49:9ab with SMTP id s123-20020a625e81000000b00627fd4909abmr5191177pfb.28.1679733168222;
        Sat, 25 Mar 2023 01:32:48 -0700 (PDT)
Received: from ubuntu.localdomain ([117.245.251.101])
        by smtp.gmail.com with ESMTPSA id m33-20020a635821000000b0050927cb606asm14290224pgb.13.2023.03.25.01.32.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Mar 2023 01:32:47 -0700 (PDT)
From: Sumitra Sharma <sumitraartsy@gmail.com>
To: outreachy@lists.linux.dev
Date: Sat, 25 Mar 2023 01:31:06 -0700
Message-Id: <7470bf9d9a57e8bf27e55bd5e3791c5e0ee31385.1679732179.git.sumitraartsy@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1679732179.git.sumitraartsy@gmail.com>
References: <cover.1679732179.git.sumitraartsy@gmail.com>
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 3746C3E948
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.50 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20210112];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[kernel.org,linuxfoundation.org,lists.linaro.org,lists.linux.dev,vger.kernel.org,gmail.com];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.215.172:from];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RCVD_COUNT_TWO(0.00)[2]
X-MailFrom: sumitraartsy@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: ZESNJINZNQP7FK2IJGGNHZJI4FGHL2LU
X-Message-ID-Hash: ZESNJINZNQP7FK2IJGGNHZJI4FGHL2LU
X-Mailman-Approved-At: Sun, 26 Mar 2023 16:09:33 +0000
CC: johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Sumitra Sharma <sumitraartsy@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v3 2/3] staging: greybus: Inline gb_audio_manager_module()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/ZESNJINZNQP7FK2IJGGNHZJI4FGHL2LU/>
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
