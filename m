Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id E2BB5A87205
	for <lists+greybus-dev@lfdr.de>; Sun, 13 Apr 2025 14:59:45 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 07D20454D5
	for <lists+greybus-dev@lfdr.de>; Sun, 13 Apr 2025 12:59:45 +0000 (UTC)
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com [209.85.222.194])
	by lists.linaro.org (Postfix) with ESMTPS id 207DB4597B
	for <greybus-dev@lists.linaro.org>; Sun, 13 Apr 2025 07:32:55 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=PdY1FMui;
	spf=pass (lists.linaro.org: domain of ganeshkpittala@gmail.com designates 209.85.222.194 as permitted sender) smtp.mailfrom=ganeshkpittala@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-qk1-f194.google.com with SMTP id af79cd13be357-7c5f720c717so456580585a.0
        for <greybus-dev@lists.linaro.org>; Sun, 13 Apr 2025 00:32:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744529575; x=1745134375; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cfqOPU3wDyCgu3vC/mniafYNGRL//NvF+7lZ1K70QeA=;
        b=PdY1FMuiMl62zsLUb6ufkct1TQwiyYc6IuCr4vn/kR9Z5XcjE7ROKyBnEpgRelTLmK
         cKnPon/e5TSAMkpb1Y6zD4QV5UnZnEWTwiFnZJRwE+vW6cUccixuKO/2qowNn5uUUFrH
         mKJAP0VYvzJsea6pnQ0wlPIlIxQ+X0aLdBG2aMTzd8l9cBpGJCOMBdYdBly5IOVuFUdh
         hCROmckMUp+VWZXAc7Dcql3Yw6fpk8b+0LLIynuiVFPk/Oqt9p1vsl5k7Fk2KAdIPBCB
         j714+grHt35YbEb7myobYZgo9h5bcjGQWrnL9/kDDDmxyqeHN42uQSqajmUbOo4AqAky
         ehfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744529575; x=1745134375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cfqOPU3wDyCgu3vC/mniafYNGRL//NvF+7lZ1K70QeA=;
        b=dOHOg67GI3ruivUABgPxZ10bjFCzNwPVGXG8X4+PM6lsRbYeQoRSLMdtTqn8iPqXS0
         G6zhXuNFLQYLPAnXfb9/9PI5PssznauASLd8rzlz6Y53eWZLynrEcor2+VmlAmUZ7JZB
         sF+i67LRyUodn9HWpd2rhN0TfQkacTq6JwF5yuADzVRJRLWRbUivK9o7qvia3BALw6Wr
         Dkf1QoFkwwSNTAPped1DEQDnmiEfMTcSCpgzqujLy7hw9MJs5VKUrL3pAbfiYNJbSqpZ
         MzxSsoN7IUBZ8tJziJQ/URz4M100hZtJ6zNiIZLIXso/OHzvsJfdH2SMwqhoQd/Nq5kI
         sAwQ==
X-Gm-Message-State: AOJu0Yxvka+1E8byOBuCgxV+dkk2vZ75+zJtJqi2zgudE/n0uaJpMq5o
	RRLEpeWQ0Cqqk6zOyWYLRj1VWdMX7OCKllZgOhbYFY0CPND8CgZY
X-Gm-Gg: ASbGncvgpImr08pwP0DrK+yDhixVpeICjQaE3YJsrfair/46fUnlCd/CTlQoTZeTgH8
	gncE4LIgFPAWYoL96MuyogBPXkPE/u7K9YNsi//tFSZyoNdsp470W6hHN8xewZqf4VjtbSaqOVa
	ZaWusHjgtKPtJhLmolUUzxnTM17AyCK69gBMHviKXA1Lab1t363X8sZej+VKxcWLfxga3alr3VF
	9tjt8Tnu8c8nMoIX0i4+z39BasM18UGgNgNs6F3xH9CiWgjDBgtyDvLqat4zHrptCjQor+es0ni
	nn9fc2eAYT+iGLgmRuUnj6e9sOKZOIOh7DD8ziKMab+jcn9QJMDCDsYW9n/4pukNyjjGSfMawzU
	XeGEcCYFx0/uwuT2icA==
X-Google-Smtp-Source: AGHT+IHh7do8k/l7nY7jzUed4eBmOzqjrZqSgir0AaDpT5VzCL16gYZxnsXjqi/syQ2mjP7YJ3yIqQ==
X-Received: by 2002:a05:620a:4515:b0:7c5:6b46:e1ee with SMTP id af79cd13be357-7c7a764cb6bmr1771180085a.4.1744529574458;
        Sun, 13 Apr 2025 00:32:54 -0700 (PDT)
Received: from UbuntuDev.. (syn-074-067-077-020.res.spectrum.com. [74.67.77.20])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4796eb0b58csm52142401cf.2.2025.04.13.00.32.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 00:32:54 -0700 (PDT)
From: Ganesh Kumar Pittala <ganeshkpittala@gmail.com>
To: johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org
Date: Sun, 13 Apr 2025 07:32:20 +0000
Message-ID: <20250413073220.15931-5-ganeshkpittala@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250413073220.15931-1-ganeshkpittala@gmail.com>
References: <20250413073220.15931-1-ganeshkpittala@gmail.com>
MIME-Version: 1.0
X-Rspamd-Queue-Id: 207DB4597B
X-Spamd-Bar: ++
X-Spamd-Result: default: False [2.50 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	RBL_SENDERSCORE_REPUT_3(2.50)[209.85.222.194:from];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_DN_NONE(0.00)[];
	R_DKIM_ALLOW(0.00)[gmail.com:s=20230601];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	FREEMAIL_CC(0.00)[lists.linaro.org,lists.linux.dev,vger.kernel.org,gmail.com,animalcreek.com,nexus-software.ie];
	DKIM_TRACE(0.00)[gmail.com:+];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.222.194:from];
	TAGGED_RCPT(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DMARC_POLICY_ALLOW(0.00)[gmail.com,none];
	R_SPF_ALLOW(0.00)[+ip4:209.85.128.0/17:c];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action
X-Spam-Level: **
X-Rspamd-Server: lists.linaro.org
X-MailFrom: ganeshkpittala@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: L3IAQRYVIRACSL26EVVJIDO4ILUZKYB7
X-Message-ID-Hash: L3IAQRYVIRACSL26EVVJIDO4ILUZKYB7
X-Mailman-Approved-At: Sun, 13 Apr 2025 12:59:23 +0000
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, hvaibhav.linux@gmail.com, pure.logic@nexus-software.ie, ganeshkpittala@gmail.com
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v2 4/4] staging: greybus: split gb_audio_gb_get_topology into helper functions
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/L3IAQRYVIRACSL26EVVJIDO4ILUZKYB7/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This patch addresses the TODO in gb_audio_gb_get_topology() by
splitting its logic into two smaller internal helper functions:
  - gb_audio_get_topology_size()
  - gb_audio_read_topology()

This improves modularity and readability while preserving the
original behavior and interface.

Signed-off-by: Ganesh Kumar Pittala <ganeshkpittala@gmail.com>
---
 drivers/staging/greybus/audio_gb.c | 36 +++++++++++++++++++++++-------
 1 file changed, 28 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/greybus/audio_gb.c b/drivers/staging/greybus/audio_gb.c
index 9d8994fdb41a..92cfd1a6fc10 100644
--- a/drivers/staging/greybus/audio_gb.c
+++ b/drivers/staging/greybus/audio_gb.c
@@ -8,21 +8,28 @@
 #include <linux/greybus.h>
 #include "audio_codec.h"
 
-/* TODO: Split into separate calls */
-int gb_audio_gb_get_topology(struct gb_connection *connection,
-			     struct gb_audio_topology **topology)
+static int gb_audio_gb_get_topology_size(struct gb_connection *connection,
+					 u16 *size)
 {
-	struct gb_audio_get_topology_size_response size_resp;
-	struct gb_audio_topology *topo;
-	u16 size;
+	struct gb_audio_get_topology_size_response resp;
 	int ret;
 
 	ret = gb_operation_sync(connection, GB_AUDIO_TYPE_GET_TOPOLOGY_SIZE,
-				NULL, 0, &size_resp, sizeof(size_resp));
+				NULL, 0, &resp, sizeof(resp));
 	if (ret)
 		return ret;
 
-	size = le16_to_cpu(size_resp.size);
+	*size = le16_to_cpu(resp.size);
+	return 0;
+}
+
+static int gb_audio_gb_read_topology(struct gb_connection *connection,
+				     struct gb_audio_topology **topology,
+				     u16 size)
+{
+	struct gb_audio_topology *topo;
+	int ret;
+
 	if (size < sizeof(*topo))
 		return -ENODATA;
 
@@ -41,6 +48,19 @@ int gb_audio_gb_get_topology(struct gb_connection *connection,
 
 	return 0;
 }
+
+int gb_audio_gb_get_topology(struct gb_connection *connection,
+			     struct gb_audio_topology **topology)
+{
+	u16 size;
+	int ret;
+
+	ret = gb_audio_gb_get_topology_size(connection, &size);
+	if (ret)
+		return ret;
+
+	return gb_audio_gb_read_topology(connection, topology, size);
+}
 EXPORT_SYMBOL_GPL(gb_audio_gb_get_topology);
 
 int gb_audio_gb_get_control(struct gb_connection *connection,
-- 
2.43.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
