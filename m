Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 99FB789CCA1
	for <lists+greybus-dev@lfdr.de>; Mon,  8 Apr 2024 21:48:50 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 87E4E43F9F
	for <lists+greybus-dev@lfdr.de>; Mon,  8 Apr 2024 19:48:49 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	by lists.linaro.org (Postfix) with ESMTPS id 819A33F359
	for <greybus-dev@lists.linaro.org>; Mon,  8 Apr 2024 19:48:46 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=cuqouAGK;
	dmarc=pass (policy=none) header.from=kernel.org;
	spf=pass (lists.linaro.org: domain of arnd@kernel.org designates 139.178.84.217 as permitted sender) smtp.mailfrom=arnd@kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1261A61365;
	Mon,  8 Apr 2024 19:48:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B385C433F1;
	Mon,  8 Apr 2024 19:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712605725;
	bh=e7FNZkCRwzJc9ynpMaKnxLTKxonZ60uDaRzM13K/KA0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cuqouAGKUeGkDyrdxrdsGxBnYNDVPKyNbwFOycplmtj6O/rv1anr9TxPGFxEcMcMC
	 ArIkGnAgahQITvMSgImOBgzugMIx839snRTqMxVoNXijpVxAMagKHwpQ1GFs8Mh8pV
	 NH8ut2aEMSjdU5X5kKNX5Hi5hQZoJmaimt0AL+YUJfKeYSU+jQ1RFc9RNjh5zuzloH
	 VZenf+GTwlURY1qORe0cvX7TLaL+rIPY0q/608jQd2TNesQhmKg3Dob8K7dVsPOB5c
	 PR0WeKhKpGe1NQsSveZuPsoDqGRajNfHdpRo9hbL1iYt8LgrHMTheDcLveF9/cDjqO
	 JUo3UMOu2Ae7g==
From: Arnd Bergmann <arnd@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Viresh Kumar <vireshk@kernel.org>,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>
Date: Mon,  8 Apr 2024 21:48:11 +0200
Message-Id: <20240408194821.3183462-3-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240408194821.3183462-1-arnd@kernel.org>
References: <20240408194821.3183462-1-arnd@kernel.org>
MIME-Version: 1.0
X-Rspamd-Queue-Id: 819A33F359
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.50 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,none];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:139.178.84.217];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_LAST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_CC(0.00)[google.com,linaro.org,arndb.de,wanadoo.fr,lists.linaro.org,lists.linux.dev,vger.kernel.org];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:54825, ipnet:139.178.80.0/21, country:US];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	URIBL_BLOCKED(0.00)[arndb.de:email,dfw.source.kernel.org:helo,dfw.source.kernel.org:rdns];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: DGY5K56RBGSR4ABADPIU5FKSQ5R5IK7S
X-Message-ID-Hash: DGY5K56RBGSR4ABADPIU5FKSQ5R5IK7S
X-MailFrom: arnd@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Justin Stitt <justinstitt@google.com>, Dan Carpenter <dan.carpenter@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH 3/3] [v2] staging: greybus: change strncpy() to strscpy_pad()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/DGY5K56RBGSR4ABADPIU5FKSQ5R5IK7S/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Arnd Bergmann <arnd@arndb.de>

gcc-10 warns about a strncpy() that does not enforce zero-termination:

In file included from include/linux/string.h:369,
                 from drivers/staging/greybus/fw-management.c:9:
In function 'strncpy',
    inlined from 'fw_mgmt_backend_fw_update_operation' at drivers/staging/greybus/fw-management.c:306:2:
include/linux/fortify-string.h:108:30: error: '__builtin_strncpy' specified bound 10 equals destination size [-Werror=stringop-truncation]
  108 | #define __underlying_strncpy __builtin_strncpy
      |                              ^
include/linux/fortify-string.h:187:9: note: in expansion of macro '__underlying_strncpy'
  187 |  return __underlying_strncpy(p, q, size);
      |         ^~~~~~~~~~~~~~~~~~~~

For some reason, I cannot reproduce this with gcc-9 or gcc-11, and I only
get a warning for one of the four related strncpy()s, so I'm not
sure what's going on.

Change all four to strscpy_pad(), which is the safest replacement here,
as it avoids ending up with uninitialized stack data in the tag name.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
v2
 - use strscpy_pad()
 - use two-argument form
 - change all four instances, not just the one that produced the warning
---
 drivers/staging/greybus/fw-management.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/greybus/fw-management.c b/drivers/staging/greybus/fw-management.c
index 3054f084d777..a47385175582 100644
--- a/drivers/staging/greybus/fw-management.c
+++ b/drivers/staging/greybus/fw-management.c
@@ -123,8 +123,7 @@ static int fw_mgmt_interface_fw_version_operation(struct fw_mgmt *fw_mgmt,
 	fw_info->major = le16_to_cpu(response.major);
 	fw_info->minor = le16_to_cpu(response.minor);
 
-	strncpy(fw_info->firmware_tag, response.firmware_tag,
-		GB_FIRMWARE_TAG_MAX_SIZE);
+	strscpy_pad(fw_info->firmware_tag, response.firmware_tag);
 
 	/*
 	 * The firmware-tag should be NULL terminated, otherwise throw error but
@@ -153,7 +152,7 @@ static int fw_mgmt_load_and_validate_operation(struct fw_mgmt *fw_mgmt,
 	}
 
 	request.load_method = load_method;
-	strncpy(request.firmware_tag, tag, GB_FIRMWARE_TAG_MAX_SIZE);
+	strscpy_pad(request.firmware_tag, tag);
 
 	/*
 	 * The firmware-tag should be NULL terminated, otherwise throw error and
@@ -249,8 +248,7 @@ static int fw_mgmt_backend_fw_version_operation(struct fw_mgmt *fw_mgmt,
 	struct gb_fw_mgmt_backend_fw_version_response response;
 	int ret;
 
-	strncpy(request.firmware_tag, fw_info->firmware_tag,
-		GB_FIRMWARE_TAG_MAX_SIZE);
+	strscpy_pad(request.firmware_tag, fw_info->firmware_tag);
 
 	/*
 	 * The firmware-tag should be NULL terminated, otherwise throw error and
@@ -303,13 +301,13 @@ static int fw_mgmt_backend_fw_update_operation(struct fw_mgmt *fw_mgmt,
 	struct gb_fw_mgmt_backend_fw_update_request request;
 	int ret;
 
-	strncpy(request.firmware_tag, tag, GB_FIRMWARE_TAG_MAX_SIZE);
+	ret = strscpy_pad(request.firmware_tag, tag);
 
 	/*
 	 * The firmware-tag should be NULL terminated, otherwise throw error and
 	 * fail.
 	 */
-	if (request.firmware_tag[GB_FIRMWARE_TAG_MAX_SIZE - 1] != '\0') {
+	if (ret == -E2BIG) {
 		dev_err(fw_mgmt->parent, "backend-update: firmware-tag is not NULL terminated\n");
 		return -EINVAL;
 	}
-- 
2.39.2

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
