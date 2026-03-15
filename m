Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6MpwDhnjtmmkKAEAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Sun, 15 Mar 2026 17:49:29 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id EF6A6291891
	for <lists+greybus-dev@lfdr.de>; Sun, 15 Mar 2026 17:49:28 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 015C23F75D
	for <lists+greybus-dev@lfdr.de>; Sun, 15 Mar 2026 16:49:28 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	by lists.linaro.org (Postfix) with ESMTPS id 11B8C3F66B
	for <greybus-dev@lists.linaro.org>; Sun, 15 Mar 2026 10:58:59 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=egeDXf4k;
	spf=pass (lists.linaro.org: domain of giacomodiclerico@gmail.com designates 209.85.221.48 as permitted sender) smtp.mailfrom=giacomodiclerico@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-43b40fb7f95so245489f8f.3
        for <greybus-dev@lists.linaro.org>; Sun, 15 Mar 2026 03:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773572338; x=1774177138; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DDWezVGPsLaY+EZX4t3/fksS/loBe8oTtJGFDBsLxP4=;
        b=egeDXf4kQ4l9Y3emubY82/Bl+hLPUboO8gNyTBXBoqaRv8NiU8VXOOtvykYih3J+AK
         w1XGeGJQ/LE0jWCIErb35qhNK46utBBm6fVyepIf6V9yS/g4hu+dCqMO5a7OfWrYQRzt
         IKE3v3hOlBkpGprv+3sFcuQljBO3rL2AMy4sl4ldI6TdxRy1tEnycS1HXf1wpuzeCULk
         nRRzFgveAZ6/+lLudy4QDq71kcyS9JZMtdcyE7yCAVY+DSV8H6AXbXrxG1d6M07ySW5V
         ElJdGHLoyby3IIUjZ975DPulA4jrHcManQaFo518pXlsf5loznYh9VmzgZ7iUoe2MLA2
         HiNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773572338; x=1774177138;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DDWezVGPsLaY+EZX4t3/fksS/loBe8oTtJGFDBsLxP4=;
        b=oiBiMB0cxgoypXIG3Tb+UF8WO3ttlQSKMYRTmZUs47S+vf0BGGALNOyHt72LsnQOdE
         mH2CC3bWzFQToUsNS/HRGwGnSM6IBMVaVwmWA7PVj3T9xUWG8pMxFgzp9eALNg9paIvv
         Qwm72s9U5K2A4h3qYqs4BkCcSHyHRr3EGcOxf70Du56t7Ot5U/PipA0m43D/e/jwuRoH
         mKOU0P7aOlW8oNtp+qdgncbaL8c+I80FW3pKjctOjRgjBjT+GiVVxfB4Uyk48woacJSs
         rAFslyirfCKyx+/0ej7hcyqR6kBtuQFXkXnomokmB6exZblOzK7hbvKApFkHNGQ7SiKq
         fp8Q==
X-Forwarded-Encrypted: i=1; AJvYcCVVa+x9/2kYGNhZ5wWKVEiYZdDbzJH+TBIuollvVU8YRW9CRL4tZ2XAtmHN7KeY/oVZs798FPPDENoF0Q==@lists.linaro.org
X-Gm-Message-State: AOJu0Ywaej2RNry8a12hTAHz8WM+nEBueVQ62XPo15fONzxr7fdRyl5c
	KT1yhQIf05oGUQAPNVNamNgBFNXXQTkzdCJd6/YmefiH70Cvqcy21wLj
X-Gm-Gg: ATEYQzznhrQiV7Fxpx7/MKURVrwCpl350nximQsj+LbrbtjddTOwuvc12oIOD7U8zF9
	Af0Wb3Uro1rcyD0Z3i5sW/dPlezVRgM1HsPM88J+Yxgk7pZNXRzFHUItAxSTD9Qgy3pXGr03RQH
	Eh19EbtcGuKrDQKsY2iBwJOrScPtG7lXWZtMMy7+EcqPW+Cf3MkTb35s8AtyNBhj8d9GN/iQ84O
	a7TCtrDImxBe4ldVTZfyk3dGt+TKfCD825fVSk8AesAIm9PGrvVFPXDJFjW17gOKN/J0M3Qt99H
	BHVI9MOz2Y+tbaUst3lwh6KVmEYnPDS1wbx36wQG49MmMswuamVN0Amgj96BMhuiIRWLfOXjF9f
	R8oBSftlNfQdjvFTpuxb2OBnP0zG3R0+azg4uoIcjYlB/Lz5+RIVpyyy6eCTbEbNNwf4Q8nxpSC
	XIJ/0hd9TOZ8gG3R6hDHtnTVyITVxhOlSFfj3Lbk4rYkoNMbm1F5wZ3j2DrkkxXn5yROJQvBMN5
	pUfNjpb1I2lKe5+1q/x+6fShc/ce5/E7Q==
X-Received: by 2002:a05:6000:4305:b0:439:ae2f:83f9 with SMTP id ffacd0b85a97d-43a04d83c3dmr16927584f8f.11.1773572337755;
        Sun, 15 Mar 2026 03:58:57 -0700 (PDT)
Received: from misharch.salamander-pythagorean.ts.net (net-93-146-220-2.cust.vodafonedsl.it. [93.146.220.2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe21b631sm38010070f8f.27.2026.03.15.03.58.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 03:58:57 -0700 (PDT)
From: Giacomo Di Clerico <giacomodiclerico@gmail.com>
To: pure.logic@nexus-software.ie
Date: Sun, 15 Mar 2026 11:58:53 +0100
Message-ID: <20260315105853.34609-1-giacomodiclerico@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Spamd-Bar: --
X-MailFrom: giacomodiclerico@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: 6J7UE43DKCLFHJBSYPUGSOGLMQN3ZYD7
X-Message-ID-Hash: 6J7UE43DKCLFHJBSYPUGSOGLMQN3ZYD7
X-Mailman-Approved-At: Sun, 15 Mar 2026 16:49:22 +0000
CC: johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Giacomo Di Clerico <giacomodiclerico@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] staging: greybus: loopback: remove unused argument from macro
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/6J7UE43DKCLFHJBSYPUGSOGLMQN3ZYD7/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [1.59 / 15.00];
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	MID_CONTAINS_FROM(1.00)[];
	R_SPF_ALLOW(-0.20)[+mx:c];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,lists.linaro.org,lists.linux.dev,vger.kernel.org,gmail.com];
	DKIM_TRACE(0.00)[gmail.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	FROM_NEQ_ENVFROM(0.00)[giacomodiclerico@gmail.com,greybus-dev-bounces@lists.linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_SPAM(0.00)[0.658];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email]
X-Rspamd-Queue-Id: EF6A6291891
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The gb_dev_loopback_ro_attr macro accepted a 'conn' argument which
was never used in its expansion. Remove it from both the macro
definition and its invocation.

Signed-off-by: Giacomo Di Clerico <giacomodiclerico@gmail.com>
---
 drivers/staging/greybus/loopback.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/greybus/loopback.c b/drivers/staging/greybus/loopback.c
index aa9c73cb0ae5..855d5051c55d 100644
--- a/drivers/staging/greybus/loopback.c
+++ b/drivers/staging/greybus/loopback.c
@@ -193,7 +193,7 @@ static ssize_t field##_store(struct device *dev,			\
 }									\
 static DEVICE_ATTR_RW(field)
 
-#define gb_dev_loopback_ro_attr(field, conn)				\
+#define gb_dev_loopback_ro_attr(field)				\
 static ssize_t field##_show(struct device *dev,		\
 			    struct device_attribute *attr,		\
 			    char *buf)					\
@@ -305,7 +305,7 @@ gb_dev_loopback_rw_attr(us_wait, d);
 /* Maximum iterations for a given operation: 1-(2^32-1), 0 implies infinite */
 gb_dev_loopback_rw_attr(iteration_max, u);
 /* The current index of the for (i = 0; i < iteration_max; i++) loop */
-gb_dev_loopback_ro_attr(iteration_count, false);
+gb_dev_loopback_ro_attr(iteration_count);
 /* A flag to indicate synchronous or asynchronous operations */
 gb_dev_loopback_rw_attr(async, u);
 /* Timeout of an individual asynchronous request */
-- 
2.53.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
