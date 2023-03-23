Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id A725F6C6A14
	for <lists+greybus-dev@lfdr.de>; Thu, 23 Mar 2023 14:54:57 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id AFAD543CDF
	for <lists+greybus-dev@lfdr.de>; Thu, 23 Mar 2023 13:54:56 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	by lists.linaro.org (Postfix) with ESMTPS id 581DE3E975
	for <greybus-dev@lists.linaro.org>; Thu, 23 Mar 2023 09:04:30 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20210112 header.b=LIkMDCo6;
	spf=pass (lists.linaro.org: domain of sumitraartsy@gmail.com designates 209.85.216.48 as permitted sender) smtp.mailfrom=sumitraartsy@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pj1-f48.google.com with SMTP id fy10-20020a17090b020a00b0023b4bcf0727so1396286pjb.0
        for <greybus-dev@lists.linaro.org>; Thu, 23 Mar 2023 02:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679562269;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HkAGxiMm0D6sZZHk+W+42sbwTh2uKjw/ysosEWY5e6A=;
        b=LIkMDCo6uE7KtCBkAYpv7U6sC6jQgySdx8sLRUp+8pMXXhPbM43mYGNBF63R+WRXoU
         ukIJ1GGYQ4ykj/OhCzf75lefRjFVnxS5gcTa6UaiyxSZlhgjA31yxQWEbDj/r3BY9/g+
         S6xy4Pgq97Q94R3Fsk15pA6dDpcbmKcg6g+oj/N+0Mle22mvizygKS2m6D4JoPbb3bmf
         bwZJVGXUk4tBt7cPTHn1u202TOgXst67Eg8w3X2DTXrjM3MRjCQzZhPDWUi0ybGKC0OG
         /rnV6SubfPMNzVf87Cw9WwnzOkVvP3CMk//Pvjy9oa5YVrx8p4WGSPT8Zsc5f3lNNeIr
         Dulg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679562269;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HkAGxiMm0D6sZZHk+W+42sbwTh2uKjw/ysosEWY5e6A=;
        b=OA7ZRL4AtQvBNe6R+BqzthinkbAlyi1adXX+Z/wgwqLSG9R3gWCv+SlAmsVxcmgaaW
         tCC9hFgWeEJ6Dbz11ebweLcSSXFzefjilzDnj3ofLwTIg/jggQmf5iPKE64p8/4oCnY8
         SilUrb4I0phZPVNmx7lVJBxk3C6oRLsxzWzOLA+VuQehdezecr1Zo/RP5Qjl25WC68/5
         J+snqqMX6eBy2UrVy9XdSeoLfCXqE2wnTk0b6uI3WHN9x5un9hHN4Lg6LbTnHss2JZK5
         3xqm1EgKk7lfP4Cx47Shy+JCCtATrUplEvvqGSrKc1m/iJiFraYlmA4y/4pNTZFA2LAX
         p/jQ==
X-Gm-Message-State: AO0yUKU2/EgEnmn9qXy5W4k9MLM5DQeCPPKS1Q3CyFKO2qmaFIDZl5Kq
	fsUYEm9rIS8iYmYY4dBD6cg=
X-Google-Smtp-Source: AK7set8I4cmzf3Zmp2eBlUvhQR6WjHK9/2UFO2PkOCoRYTGxgHw7Kr8EnoEKqizYtcXg8exBT1xv3A==
X-Received: by 2002:a17:902:fa43:b0:1a1:a5df:764 with SMTP id lb3-20020a170902fa4300b001a1a5df0764mr5230531plb.7.1679562269354;
        Thu, 23 Mar 2023 02:04:29 -0700 (PDT)
Received: from ubuntu.localdomain ([117.207.139.205])
        by smtp.gmail.com with ESMTPSA id q8-20020a656848000000b005034a57b963sm11277116pgt.58.2023.03.23.02.04.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 02:04:28 -0700 (PDT)
From: Sumitra Sharma <sumitraartsy@gmail.com>
To: outreachy@lists.linux.dev
Date: Thu, 23 Mar 2023 02:03:40 -0700
Message-Id: <2a1752d909a33f2a8e93bd60043aaa5a659c98e4.1679558269.git.sumitraartsy@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1679558269.git.sumitraartsy@gmail.com>
References: <cover.1679558269.git.sumitraartsy@gmail.com>
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 581DE3E975
X-Spamd-Bar: ----
X-Spamd-Result: default: False [-4.10 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	RCVD_DKIM_ARC_DNSWL_HI(-1.00)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	RCVD_IN_DNSWL_HI(-0.50)[117.207.139.205:received];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20210112];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17:c];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.216.48:from];
	MIME_GOOD(-0.10)[text/plain];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	FREEMAIL_CC(0.00)[kernel.org,linuxfoundation.org,lists.linaro.org,lists.linux.dev,vger.kernel.org,gmail.com];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_IN_DNSWL_FAIL(0.00)[209.85.216.48:server fail];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2]
X-MailFrom: sumitraartsy@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: I4BDVSENDLQW7K3N23JZ45E5OSICOBZM
X-Message-ID-Hash: I4BDVSENDLQW7K3N23JZ45E5OSICOBZM
X-Mailman-Approved-At: Thu, 23 Mar 2023 13:54:41 +0000
CC: johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Sumitra Sharma <sumitraartsy@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH 2/3] Staging: greybus: Convert macro struct gb_audio_manager_module to an inline function
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/I4BDVSENDLQW7K3N23JZ45E5OSICOBZM/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Convert 'struct gb_audio_manager_module' from a macro to a static
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
