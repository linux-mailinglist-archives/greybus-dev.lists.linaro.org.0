Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id A70DEA76D03
	for <lists+greybus-dev@lfdr.de>; Mon, 31 Mar 2025 20:48:24 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 7026645F91
	for <lists+greybus-dev@lfdr.de>; Mon, 31 Mar 2025 18:48:23 +0000 (UTC)
Received: from out-186.mta0.migadu.com (out-186.mta0.migadu.com [91.218.175.186])
	by lists.linaro.org (Postfix) with ESMTPS id CE2FD3F5D8
	for <greybus-dev@lists.linaro.org>; Mon, 31 Mar 2025 18:41:05 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linux.dev header.s=key1 header.b=fzbi9CCm;
	spf=pass (lists.linaro.org: domain of thorsten.blum@linux.dev designates 91.218.175.186 as permitted sender) smtp.mailfrom=thorsten.blum@linux.dev;
	dmarc=pass (policy=none) header.from=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1743446464;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=HcZZ3xXi7jtAHyO9OCCUYW9yL683KSwMvch++4nggX8=;
	b=fzbi9CCmDYaUwgI+RnGLhVwxdzpiZxoF2gVaRiBAXUmJCtpBMnTrsOAubmpf95G1oEQK8R
	rXmIssbmvaIulHZrNflUKiZ01dVgLCKlysdULnl31i03z8B0Tmmd8jkobKmp51QAC93w5w
	hIQ8gJObgUynMiN6vLDnV00xEaOzkMY=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Viresh Kumar <vireshk@kernel.org>,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Mon, 31 Mar 2025 20:39:35 +0200
Message-ID: <20250331183935.1880097-2-thorsten.blum@linux.dev>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: CE2FD3F5D8
X-Spamd-Bar: ---
X-Spamd-Result: default: False [-3.40 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	RBL_SENDERSCORE_REPUT_9(-1.00)[91.218.175.186:from];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	R_SPF_ALLOW(-0.20)[+ip4:91.218.175.0/24];
	ONCE_RECEIVED(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	ASN(0.00)[asn:202172, ipnet:91.218.175.0/24, country:CH];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_ZERO(0.00)[0];
	FROM_EQ_ENVFROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	DKIM_TRACE(0.00)[linux.dev:+]
X-Rspamd-Action: no action
X-MailFrom: thorsten.blum@linux.dev
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: QGESUTZG767JUMX74YODZ7ASYPKFNYIG
X-Message-ID-Hash: QGESUTZG767JUMX74YODZ7ASYPKFNYIG
X-Mailman-Approved-At: Mon, 31 Mar 2025 18:48:20 +0000
CC: Thorsten Blum <thorsten.blum@linux.dev>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] staging: greybus: Remove unnecessary NUL-termination checks
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/QGESUTZG767JUMX74YODZ7ASYPKFNYIG/>
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
buffer is NUL-terminated, making the checks obsolete. Remove them.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 drivers/staging/greybus/fw-management.c | 39 +------------------------
 1 file changed, 1 insertion(+), 38 deletions(-)

diff --git a/drivers/staging/greybus/fw-management.c b/drivers/staging/greybus/fw-management.c
index a47385175582..852c0830261f 100644
--- a/drivers/staging/greybus/fw-management.c
+++ b/drivers/staging/greybus/fw-management.c
@@ -125,16 +125,6 @@ static int fw_mgmt_interface_fw_version_operation(struct fw_mgmt *fw_mgmt,
 
 	strscpy_pad(fw_info->firmware_tag, response.firmware_tag);
 
-	/*
-	 * The firmware-tag should be NULL terminated, otherwise throw error but
-	 * don't fail.
-	 */
-	if (fw_info->firmware_tag[GB_FIRMWARE_TAG_MAX_SIZE - 1] != '\0') {
-		dev_err(fw_mgmt->parent,
-			"fw-version: firmware-tag is not NULL terminated\n");
-		fw_info->firmware_tag[GB_FIRMWARE_TAG_MAX_SIZE - 1] = '\0';
-	}
-
 	return 0;
 }
 
@@ -154,15 +144,6 @@ static int fw_mgmt_load_and_validate_operation(struct fw_mgmt *fw_mgmt,
 	request.load_method = load_method;
 	strscpy_pad(request.firmware_tag, tag);
 
-	/*
-	 * The firmware-tag should be NULL terminated, otherwise throw error and
-	 * fail.
-	 */
-	if (request.firmware_tag[GB_FIRMWARE_TAG_MAX_SIZE - 1] != '\0') {
-		dev_err(fw_mgmt->parent, "load-and-validate: firmware-tag is not NULL terminated\n");
-		return -EINVAL;
-	}
-
 	/* Allocate ids from 1 to 255 (u8-max), 0 is an invalid id */
 	ret = ida_alloc_range(&fw_mgmt->id_map, 1, 255, GFP_KERNEL);
 	if (ret < 0) {
@@ -250,15 +231,6 @@ static int fw_mgmt_backend_fw_version_operation(struct fw_mgmt *fw_mgmt,
 
 	strscpy_pad(request.firmware_tag, fw_info->firmware_tag);
 
-	/*
-	 * The firmware-tag should be NULL terminated, otherwise throw error and
-	 * fail.
-	 */
-	if (request.firmware_tag[GB_FIRMWARE_TAG_MAX_SIZE - 1] != '\0') {
-		dev_err(fw_mgmt->parent, "backend-version: firmware-tag is not NULL terminated\n");
-		return -EINVAL;
-	}
-
 	ret = gb_operation_sync(connection,
 				GB_FW_MGMT_TYPE_BACKEND_FW_VERSION, &request,
 				sizeof(request), &response, sizeof(response));
@@ -301,16 +273,7 @@ static int fw_mgmt_backend_fw_update_operation(struct fw_mgmt *fw_mgmt,
 	struct gb_fw_mgmt_backend_fw_update_request request;
 	int ret;
 
-	ret = strscpy_pad(request.firmware_tag, tag);
-
-	/*
-	 * The firmware-tag should be NULL terminated, otherwise throw error and
-	 * fail.
-	 */
-	if (ret == -E2BIG) {
-		dev_err(fw_mgmt->parent, "backend-update: firmware-tag is not NULL terminated\n");
-		return -EINVAL;
-	}
+	strscpy_pad(request.firmware_tag, tag);
 
 	/* Allocate ids from 1 to 255 (u8-max), 0 is an invalid id */
 	ret = ida_alloc_range(&fw_mgmt->id_map, 1, 255, GFP_KERNEL);
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
