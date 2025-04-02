Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 058FCA78DBD
	for <lists+greybus-dev@lfdr.de>; Wed,  2 Apr 2025 14:03:08 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id D760C43E97
	for <lists+greybus-dev@lfdr.de>; Wed,  2 Apr 2025 12:03:06 +0000 (UTC)
Received: from out-189.mta1.migadu.com (out-189.mta1.migadu.com [95.215.58.189])
	by lists.linaro.org (Postfix) with ESMTPS id F38683F66C
	for <greybus-dev@lists.linaro.org>; Wed,  2 Apr 2025 11:58:25 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linux.dev header.s=key1 header.b="D/Q9sGRM";
	spf=pass (lists.linaro.org: domain of thorsten.blum@linux.dev designates 95.215.58.189 as permitted sender) smtp.mailfrom=thorsten.blum@linux.dev;
	dmarc=pass (policy=none) header.from=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1743595104;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=U6s5Q93fZJsXAS6nby2Y8nIyT8Bor7D/QRKLwNJnvT0=;
	b=D/Q9sGRM1jql8E7+oRkENiw36/pF+FpK3DLPJ11tTn+gNjvCZAIY90YYYJaDd/0c0TI4qL
	fsjcAjp+0NRy2ndD2ZQuZNhm6TtUql6L2b/xnyg7pOnxs1jgoxj2gmj9LfUHMs6tmNHDxc
	wyo8OpSY0oJrnZiSAo8d/KEAN8uQhZI=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Viresh Kumar <vireshk@kernel.org>,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Wed,  2 Apr 2025 13:57:54 +0200
Message-ID: <20250402115755.1929043-1-thorsten.blum@linux.dev>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: F38683F66C
X-Spamd-Bar: ---
X-Spamd-Result: default: False [-3.40 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	RBL_SENDERSCORE_REPUT_9(-1.00)[95.215.58.189:from];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	R_SPF_ALLOW(-0.20)[+ip4:95.215.58.0/24];
	ONCE_RECEIVED(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	ASN(0.00)[asn:202172, ipnet:95.215.58.0/24, country:CH];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_ZERO(0.00)[0];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[95.215.58.189:from];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	ARC_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[linux.dev:+]
X-Rspamd-Action: no action
X-MailFrom: thorsten.blum@linux.dev
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: B2KVY2HW7FOLFJSQGTBYCGKJOI3RO77N
X-Message-ID-Hash: B2KVY2HW7FOLFJSQGTBYCGKJOI3RO77N
X-Mailman-Approved-At: Wed, 02 Apr 2025 12:03:04 +0000
CC: Thorsten Blum <thorsten.blum@linux.dev>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v2] staging: greybus: Check for string truncation instead of NUL-termination
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/B2KVY2HW7FOLFJSQGTBYCGKJOI3RO77N/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Commit 18f44de63f88 ("staging: greybus: change strncpy() to
strscpy_pad()") didn't remove the now unnecessary NUL-termination
checks. Unlike strncpy(), strscpy_pad() guarantees that the destination
buffer is NUL-terminated, making these checks obsolete. Remove them and
check for string truncation instead.

Compile-tested only.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
Changes in v2:
- Check the return value of strscpy_pad() for string truncation instead
  of NUL-termination as suggested by Alex Elder
- Link to v1: https://lore.kernel.org/r/20250331183935.1880097-2-thorsten.blum@linux.dev/
---
 drivers/staging/greybus/fw-management.c | 48 +++++++++----------------
 1 file changed, 17 insertions(+), 31 deletions(-)

diff --git a/drivers/staging/greybus/fw-management.c b/drivers/staging/greybus/fw-management.c
index a47385175582..152949c23d65 100644
--- a/drivers/staging/greybus/fw-management.c
+++ b/drivers/staging/greybus/fw-management.c
@@ -123,17 +123,11 @@ static int fw_mgmt_interface_fw_version_operation(struct fw_mgmt *fw_mgmt,
 	fw_info->major = le16_to_cpu(response.major);
 	fw_info->minor = le16_to_cpu(response.minor);
 
-	strscpy_pad(fw_info->firmware_tag, response.firmware_tag);
-
-	/*
-	 * The firmware-tag should be NULL terminated, otherwise throw error but
-	 * don't fail.
-	 */
-	if (fw_info->firmware_tag[GB_FIRMWARE_TAG_MAX_SIZE - 1] != '\0') {
+	ret = strscpy_pad(fw_info->firmware_tag, response.firmware_tag);
+	if (ret == -E2BIG)
 		dev_err(fw_mgmt->parent,
-			"fw-version: firmware-tag is not NULL terminated\n");
-		fw_info->firmware_tag[GB_FIRMWARE_TAG_MAX_SIZE - 1] = '\0';
-	}
+			"fw-version: truncated firmware tag: %s\n",
+			fw_info->firmware_tag);
 
 	return 0;
 }
@@ -152,14 +146,12 @@ static int fw_mgmt_load_and_validate_operation(struct fw_mgmt *fw_mgmt,
 	}
 
 	request.load_method = load_method;
-	strscpy_pad(request.firmware_tag, tag);
 
-	/*
-	 * The firmware-tag should be NULL terminated, otherwise throw error and
-	 * fail.
-	 */
-	if (request.firmware_tag[GB_FIRMWARE_TAG_MAX_SIZE - 1] != '\0') {
-		dev_err(fw_mgmt->parent, "load-and-validate: firmware-tag is not NULL terminated\n");
+	ret = strscpy_pad(request.firmware_tag, tag);
+	if (ret == -E2BIG) {
+		dev_err(fw_mgmt->parent,
+			"load-and-validate: truncated firmware tag: %s\n",
+			request.firmware_tag);
 		return -EINVAL;
 	}
 
@@ -248,14 +240,11 @@ static int fw_mgmt_backend_fw_version_operation(struct fw_mgmt *fw_mgmt,
 	struct gb_fw_mgmt_backend_fw_version_response response;
 	int ret;
 
-	strscpy_pad(request.firmware_tag, fw_info->firmware_tag);
-
-	/*
-	 * The firmware-tag should be NULL terminated, otherwise throw error and
-	 * fail.
-	 */
-	if (request.firmware_tag[GB_FIRMWARE_TAG_MAX_SIZE - 1] != '\0') {
-		dev_err(fw_mgmt->parent, "backend-version: firmware-tag is not NULL terminated\n");
+	ret = strscpy_pad(request.firmware_tag, fw_info->firmware_tag);
+	if (ret == -E2BIG) {
+		dev_err(fw_mgmt->parent,
+			"backend-fw-version: truncated firmware tag: %s\n",
+			request.firmware_tag);
 		return -EINVAL;
 	}
 
@@ -302,13 +291,10 @@ static int fw_mgmt_backend_fw_update_operation(struct fw_mgmt *fw_mgmt,
 	int ret;
 
 	ret = strscpy_pad(request.firmware_tag, tag);
-
-	/*
-	 * The firmware-tag should be NULL terminated, otherwise throw error and
-	 * fail.
-	 */
 	if (ret == -E2BIG) {
-		dev_err(fw_mgmt->parent, "backend-update: firmware-tag is not NULL terminated\n");
+		dev_err(fw_mgmt->parent,
+			"backend-fw-update: truncated firmware tag: %s\n",
+			request.firmware_tag);
 		return -EINVAL;
 	}
 
-- 
2.49.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
