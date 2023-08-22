Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B12E787434
	for <lists+greybus-dev@lfdr.de>; Thu, 24 Aug 2023 17:30:07 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 2778A40F1E
	for <lists+greybus-dev@lfdr.de>; Thu, 24 Aug 2023 15:30:06 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	by lists.linaro.org (Postfix) with ESMTPS id 8AAE143EE6
	for <greybus-dev@lists.linaro.org>; Tue, 22 Aug 2023 08:02:27 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20221208 header.b=aNpu76vC;
	spf=pass (lists.linaro.org: domain of roheetchavan@gmail.com designates 209.85.214.181 as permitted sender) smtp.mailfrom=roheetchavan@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1bdb7b0c8afso23612335ad.3
        for <greybus-dev@lists.linaro.org>; Tue, 22 Aug 2023 01:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692691346; x=1693296146;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GHuVqZQ6eWzWGlZ3K43xXY3+GR5axkEe+E8WbhwDchs=;
        b=aNpu76vCZhA/BQGp5D9JvSshleIwRjcI0bMuCHgAKG+hB2+6j9iuUEQ8IOrqQ7UGXH
         mR7HYX3NOcBmt+JvV6JwS4OkqezRJoeLi78y/SIKUTuyz3l+e0BewAaA01aIRgMhYNY0
         +w0jj7a2ilWT2KdIXqCivGboFkul7STHaQfDAjPgjmv8CxeGolCmeYVi31bYWoK1wz2n
         awxKIRn6vsGZ0rcOjtmBGVkIV/mmeRdKQyRZvzMXxj69bWzyQQw8b/NxzwocJi7IXdTy
         kio/MXFC5O//lHnNIbpn4DMeWmXLvuOJV4aT7iqW9UO0EtM4qwN+BZs8RjBY7p2WwDiZ
         JeIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692691346; x=1693296146;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GHuVqZQ6eWzWGlZ3K43xXY3+GR5axkEe+E8WbhwDchs=;
        b=AsTgTELuxAUYFREHbYfMUbFDYtZ59n88kjulitX5gNdPZUhYIANWBYpQnHDSeJQXQa
         KYdgakx6xbBELvixOAu/1Y08KU6t6JHAdwOHP1LOYg8h2QgVl4xTTpuN9RhsxKR6yHYE
         jRtT1WiXxqvGPRjzW8MihOpvB1tjf6ax0vvEJYte9bn78l1VfFu+Pu4LopAMruSgw0eu
         WZWuHWqN8Lt2VMElXNOPGEdk4x4AuM1uMsiUINsgrp+8V0dBdBAlkavqn+7QQ6CB3syc
         qOl+2NMfBgfaH+aMatdKqUPn6ctQ2p1mh43wdIXesU0WYnLtfGepKjfcvOo3f/k5fdVg
         sPPQ==
X-Gm-Message-State: AOJu0YwNPTxr8WynoMj2IuxgWPetV6OhRBnm+u7l0tYPpbaqxl+xANMp
	1cwXmMOwVFp12H7TSIHWWg8=
X-Google-Smtp-Source: AGHT+IF1C0krg/CMZNxa0h4RWEEaL/o1F/F9Blg+aKZTbZ19HcNAA0bakcIF1eMWrK16YWy+ksG//Q==
X-Received: by 2002:a17:902:7890:b0:1bd:d14a:7e14 with SMTP id q16-20020a170902789000b001bdd14a7e14mr6195774pll.65.1692691346525;
        Tue, 22 Aug 2023 01:02:26 -0700 (PDT)
Received: from XHD-CHAVAN-L1.amd.com ([149.199.50.128])
        by smtp.gmail.com with ESMTPSA id g9-20020a170902c38900b001a1b66af22fsm8418789plg.62.2023.08.22.01.02.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Aug 2023 01:02:26 -0700 (PDT)
From: Rohit Chavan <roheetchavan@gmail.com>
To: Viresh Kumar <vireshk@kernel.org>,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Date: Tue, 22 Aug 2023 13:32:13 +0530
Message-Id: <20230822080213.6757-1-roheetchavan@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Rspamd-Queue-Id: 8AAE143EE6
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.60 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20221208];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.214.181:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	DKIM_TRACE(0.00)[gmail.com:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-MailFrom: roheetchavan@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: JNXQXX7WDVBD4HBCHBH5STD7DMV3HUPL
X-Message-ID-Hash: JNXQXX7WDVBD4HBCHBH5STD7DMV3HUPL
X-Mailman-Approved-At: Thu, 24 Aug 2023 15:30:00 +0000
CC: Rohit Chavan <roheetchavan@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] staging: greybus: fix alignment of open parenthesis
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/JNXQXX7WDVBD4HBCHBH5STD7DMV3HUPL/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Fixed all CHECK: Alignment should match open parenthesis
as reported by checkpatch to adhere to the Linux kernel
coding-style guidelines.

Signed-off-by: Rohit Chavan <roheetchavan@gmail.com>
---
 drivers/staging/greybus/fw-core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/greybus/fw-core.c b/drivers/staging/greybus/fw-core.c
index 57bebf24636b..0fb15a60412f 100644
--- a/drivers/staging/greybus/fw-core.c
+++ b/drivers/staging/greybus/fw-core.c
@@ -89,7 +89,7 @@ static int gb_fw_core_probe(struct gb_bundle *bundle,
 			}

 			connection = gb_connection_create(bundle, cport_id,
-						gb_fw_mgmt_request_handler);
+							  gb_fw_mgmt_request_handler);
 			if (IS_ERR(connection)) {
 				ret = PTR_ERR(connection);
 				dev_err(&bundle->dev,
@@ -110,7 +110,7 @@ static int gb_fw_core_probe(struct gb_bundle *bundle,
 			}

 			connection = gb_connection_create(bundle, cport_id,
-						gb_fw_download_request_handler);
+							  gb_fw_download_request_handler);
 			if (IS_ERR(connection)) {
 				dev_err(&bundle->dev, "failed to create download connection (%ld)\n",
 					PTR_ERR(connection));
--
2.30.2

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
