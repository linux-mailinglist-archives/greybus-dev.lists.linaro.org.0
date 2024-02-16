Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E854858A20
	for <lists+greybus-dev@lfdr.de>; Sat, 17 Feb 2024 00:28:37 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id CCC183F953
	for <lists+greybus-dev@lfdr.de>; Fri, 16 Feb 2024 23:28:35 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	by lists.linaro.org (Postfix) with ESMTPS id 09E143F369
	for <greybus-dev@lists.linaro.org>; Fri, 16 Feb 2024 23:28:28 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=chromium.org header.s=google header.b=O5V3+S5h;
	dmarc=pass (policy=none) header.from=chromium.org;
	spf=pass (lists.linaro.org: domain of keescook@chromium.org designates 209.85.210.170 as permitted sender) smtp.mailfrom=keescook@chromium.org
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-6e0f803d9dfso937554b3a.0
        for <greybus-dev@lists.linaro.org>; Fri, 16 Feb 2024 15:28:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1708126107; x=1708730907; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gXaXr91zE2iwkpuzNYcgIVZmRt4beRglHQkgu1Q6RzQ=;
        b=O5V3+S5hI+4tE2utPHXZMeLlgiriuMqk5T2+E5XnTHLgusJEMFT5Pa+/9auaUQ6aAo
         BJrB/swH/JGN5BYfJLMCOQ0q3lr1nLBf//ZbVvD0/HB7tAVe0JJki7Ctzwy9b12ywQoj
         jhrcfAs/YWo3z2m8J6cOcvRsnlKgC8+bYbQYI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708126107; x=1708730907;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gXaXr91zE2iwkpuzNYcgIVZmRt4beRglHQkgu1Q6RzQ=;
        b=AejCIX9V4ZKLz4kLf4Mkmur9LXPdBjGelXRMvSMVwzj1HjQ6jk4suSwyL1QGucARl9
         djPRlRoyDguYYFRNbRYjWOU+l0NSDEbF4fRuByhxyaZyarLJdaxt09CtoFarVlTdnx4u
         FJBWMt6VD9r106TMlLnJH6mVrum9pY5QOjEGu3JRkSmqqqyInDYYYDzysNkzPTUwlZqJ
         SwqqEggfk0V5B3trGXYIS/I2+i9aq3Am2+uoyM3b9wPIJRIvYrYjV/QoPE6eYaZ/jyTx
         vmtJSeWYPde1zvDewCOmLAtD1hmS1d6xinw9Xj9UFKGJJ9GzceWxN5s0UcKWkwXmd8CH
         p+Cg==
X-Forwarded-Encrypted: i=1; AJvYcCUYR5ZIo6QbbKpVcZHpzTd68fTtb2De7DBHDvqTUWKiE57KhOnU7ifS4p7k6ogZoUZkAcp7bv1HPbwjqE0rF4luqyo+WYE7HyLU88S4
X-Gm-Message-State: AOJu0YxpSGs1IUwnwDXRIvTKg2al0+UkFQ3ihZtg8jipd4KDNhYHlJpS
	tRWDUzgFEJy0Z2UCZJgX4aOXItiCt5qVzwGMpZ4MhGNG+s9phpxw0BvDY2YsvKay5+F1ylUPMlY
	=
X-Google-Smtp-Source: AGHT+IHzmse8nnYR28KfPJrToxw6+BFDoqXkfVQ5zblzLbp8e/RsNZ3dw5J5POgI/1Eaua4oIaLVrg==
X-Received: by 2002:aa7:9887:0:b0:6dd:88a8:cf25 with SMTP id r7-20020aa79887000000b006dd88a8cf25mr5714710pfl.8.1708126106847;
        Fri, 16 Feb 2024 15:28:26 -0800 (PST)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id bm16-20020a056a00321000b006e0d22fe8e3sm476961pfb.116.2024.02.16.15.28.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 15:28:26 -0800 (PST)
From: Kees Cook <keescook@chromium.org>
To: Viresh Kumar <vireshk@kernel.org>
Date: Fri, 16 Feb 2024 15:28:24 -0800
Message-Id: <20240216232824.work.862-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4687; i=keescook@chromium.org;
 h=from:subject:message-id; bh=o729TUA+/3yrI2XpDVI6zjAuiCqtDa09o5cSkSVCI84=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlz++YdWhS9IIogaVrW9SXyH69n7HtxXWgzsEWI
 xIH+eLcTAWJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZc/vmAAKCRCJcvTf3G3A
 JlTnD/4zwXwfUJWeKhGf1W4ft6eKbqeQCvVoNZQ9aKFDD0mrJwYRLvv3lE+NCFt2OV8fURFxPPm
 Zi0XIMgEjr6RCcAkWLMXn5WFQlCa7kl3VPK/mcTEY67RfFtM7yqKxQMCg93xlys0g6vfyvbwJD7
 tqiFLue/hRz/hoNvDTY1eNL/ssnp5+c9veBSEChT22FCQUhmrTh82/qH/oGTvts4/OqsET1papu
 ZaDE7QFWM8Gufc850aQKbdha9QGlsSkYN/isMz2o7dL88+015HmuZ2iAXUwqVAEvKWrKP/++Z1D
 MAfLPX9mUdUbMRrS4KSc07keJIyT8pldu3A4LofOHpNF+GQ0tVEs04seMyOBsFW9R3oyQGzAQQi
 Na55cRYAHTRU+wfJrcR/7KL6pLFiXzMxcuWvvR88O+aNjlK9TH4JqHBLTMWMY6144L+ajxsWkMO
 FrHOp7mImhRmyEktzBG2fXS17A4s5BXYsOiNTkxQzHGii7vcjNetNx3O9ue8LJU/2D5HLDllPf9
 c+UJODNrmtCD+6/4n2+w0QBLyzl9tHN3WdQPmBF8WkVgBoZvqQFqagKjKqFlqlSoh9S9k1WyD+a
 EEjjdpdCFOv8uxyFFZiBAhHhZ7Kx6U6WbXwQnOMJGn0pP/PsczRro7m59EI3yT88cICN6/FK+Uj
 X0M/NCL XdMlbTTQ==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 09E143F369
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.60 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_RHS_MATCH_TO(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.210.170:from];
	MIME_GOOD(-0.10)[text/plain];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_TLS_LAST(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_TWO(0.00)[2];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	DKIM_TRACE(0.00)[chromium.org:+]
Message-ID-Hash: O5YZMC2QEW32G2FIN2OFY5DEM7VAIKAO
X-Message-ID-Hash: O5YZMC2QEW32G2FIN2OFY5DEM7VAIKAO
X-MailFrom: keescook@chromium.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Kees Cook <keescook@chromium.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, "Gustavo A . R . Silva" <gustavo@embeddedor.com>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] greybus: Avoid fake flexible array for response data
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/O5YZMC2QEW32G2FIN2OFY5DEM7VAIKAO/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

FORTIFY_SOURCE has been ignoring 0-sized destinations while the kernel
code base has been converted to flexible arrays. In order to enforce
the 0-sized destinations (e.g. with __counted_by), the remaining 0-sized
destinations need to be handled. Instead of converting an empty struct
into using a flexible array, just directly use a pointer without any
additional indirection. Remove struct gb_bootrom_get_firmware_response
and struct gb_fw_download_fetch_firmware_response.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
Cc: Viresh Kumar <vireshk@kernel.org>
Cc: Johan Hovold <johan@kernel.org>
Cc: Alex Elder <elder@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Gustavo A. R. Silva <gustavo@embeddedor.com>
Cc: greybus-dev@lists.linaro.org
Cc: linux-staging@lists.linux.dev
---
 drivers/staging/greybus/bootrom.c         | 7 +++----
 drivers/staging/greybus/fw-download.c     | 7 +++----
 include/linux/greybus/greybus_protocols.h | 8 --------
 3 files changed, 6 insertions(+), 16 deletions(-)

diff --git a/drivers/staging/greybus/bootrom.c b/drivers/staging/greybus/bootrom.c
index 79581457c4af..76ad5f289072 100644
--- a/drivers/staging/greybus/bootrom.c
+++ b/drivers/staging/greybus/bootrom.c
@@ -243,10 +243,10 @@ static int gb_bootrom_get_firmware(struct gb_operation *op)
 	struct gb_bootrom *bootrom = gb_connection_get_data(op->connection);
 	const struct firmware *fw;
 	struct gb_bootrom_get_firmware_request *firmware_request;
-	struct gb_bootrom_get_firmware_response *firmware_response;
 	struct device *dev = &op->connection->bundle->dev;
 	unsigned int offset, size;
 	enum next_request_type next_request;
+	u8 *firmware_response;
 	int ret = 0;
 
 	/* Disable timeouts */
@@ -280,15 +280,14 @@ static int gb_bootrom_get_firmware(struct gb_operation *op)
 		goto unlock;
 	}
 
-	if (!gb_operation_response_alloc(op, sizeof(*firmware_response) + size,
-					 GFP_KERNEL)) {
+	if (!gb_operation_response_alloc(op, size, GFP_KERNEL)) {
 		dev_err(dev, "%s: error allocating response\n", __func__);
 		ret = -ENOMEM;
 		goto unlock;
 	}
 
 	firmware_response = op->response->payload;
-	memcpy(firmware_response->data, fw->data + offset, size);
+	memcpy(firmware_response, fw->data + offset, size);
 
 	dev_dbg(dev, "responding with firmware (offs = %u, size = %u)\n",
 		offset, size);
diff --git a/drivers/staging/greybus/fw-download.c b/drivers/staging/greybus/fw-download.c
index 543692c567f9..2d73bb729aa2 100644
--- a/drivers/staging/greybus/fw-download.c
+++ b/drivers/staging/greybus/fw-download.c
@@ -271,11 +271,11 @@ static int fw_download_fetch_firmware(struct gb_operation *op)
 	struct gb_connection *connection = op->connection;
 	struct fw_download *fw_download = gb_connection_get_data(connection);
 	struct gb_fw_download_fetch_firmware_request *request;
-	struct gb_fw_download_fetch_firmware_response *response;
 	struct fw_request *fw_req;
 	const struct firmware *fw;
 	unsigned int offset, size;
 	u8 firmware_id;
+	u8 *response;
 	int ret = 0;
 
 	if (op->request->payload_size != sizeof(*request)) {
@@ -325,8 +325,7 @@ static int fw_download_fetch_firmware(struct gb_operation *op)
 		goto put_fw;
 	}
 
-	if (!gb_operation_response_alloc(op, sizeof(*response) + size,
-					 GFP_KERNEL)) {
+	if (!gb_operation_response_alloc(op, size, GFP_KERNEL)) {
 		dev_err(fw_download->parent,
 			"error allocating fetch firmware response\n");
 		ret = -ENOMEM;
@@ -334,7 +333,7 @@ static int fw_download_fetch_firmware(struct gb_operation *op)
 	}
 
 	response = op->response->payload;
-	memcpy(response->data, fw->data + offset, size);
+	memcpy(response, fw->data + offset, size);
 
 	dev_dbg(fw_download->parent,
 		"responding with firmware (offs = %u, size = %u)\n", offset,
diff --git a/include/linux/greybus/greybus_protocols.h b/include/linux/greybus/greybus_protocols.h
index aeb8f9243545..603acdcc0c6b 100644
--- a/include/linux/greybus/greybus_protocols.h
+++ b/include/linux/greybus/greybus_protocols.h
@@ -232,10 +232,6 @@ struct gb_fw_download_fetch_firmware_request {
 	__le32			size;
 } __packed;
 
-struct gb_fw_download_fetch_firmware_response {
-	__u8			data[0];
-} __packed;
-
 /* firmware download release firmware request */
 struct gb_fw_download_release_firmware_request {
 	__u8			firmware_id;
@@ -414,10 +410,6 @@ struct gb_bootrom_get_firmware_request {
 	__le32			size;
 } __packed;
 
-struct gb_bootrom_get_firmware_response {
-	__u8			data[0];
-} __packed;
-
 /* Bootrom protocol Ready to boot request */
 struct gb_bootrom_ready_to_boot_request {
 	__u8			status;
-- 
2.34.1

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
