Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D245870C46
	for <lists+greybus-dev@lfdr.de>; Mon,  4 Mar 2024 22:19:56 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 7E7CF44366
	for <lists+greybus-dev@lfdr.de>; Mon,  4 Mar 2024 21:19:55 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	by lists.linaro.org (Postfix) with ESMTPS id 121B33F0A4
	for <greybus-dev@lists.linaro.org>; Mon,  4 Mar 2024 21:19:50 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=chromium.org header.s=google header.b="UZf02aY/";
	spf=pass (lists.linaro.org: domain of keescook@chromium.org designates 209.85.210.169 as permitted sender) smtp.mailfrom=keescook@chromium.org;
	dmarc=pass (policy=none) header.from=chromium.org
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-6e5dddd3b95so1976146b3a.1
        for <greybus-dev@lists.linaro.org>; Mon, 04 Mar 2024 13:19:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1709587189; x=1710191989; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kuwjsv4D6U5YXnr6LRJiA6f6hlMDXAPMBAB9PBj+oJs=;
        b=UZf02aY/xu+glM5IizlTtTbLnABNM00r1Gyg6ZfsxuKsHYKAG8ajY3t4gSbvT+0bRZ
         Klnp+TwXrtOpe/+dQSgqwiE9FYjgfXnV7zkFhmgjeMXJNmRpHcFtRZ8IBnutr90HQqG0
         22s72ZkCTLf0zpuXv3Va1xan3zGNAJhGgFROk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709587189; x=1710191989;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kuwjsv4D6U5YXnr6LRJiA6f6hlMDXAPMBAB9PBj+oJs=;
        b=jkqVKxlmIIEh96n8tHxYxvASoO4DLpbkg8S6nkq+AfjDRvpVsUuD1tlUhosRzvDrvV
         KqxhFcVmex26b0tgKjUT2o8ttQOFMyGdW/Hffc1J4mDBFtxrdsFs5LMhuxBvBv6MRzAt
         x7Qolzsp5kZjp9fzceEF60LlyeAd9N8ZQM0aXSdUy5Uvkm2+TO3+DIF+JRGUKKklDE3H
         f/um+mdf6rSKiainYMKj3mUUmbtQSqyHHANKYFbxg7m6cMqYUEHTmGnu7XAlLiV07+Li
         V7gpi6X0+LJjUxaa+78RgSshf5DxRb5Tgk5zvDOWJ1MknvvGoB8khxrN++3gs6eySskp
         C69Q==
X-Forwarded-Encrypted: i=1; AJvYcCUzUtToJ0JdLEyh0eD8Mo/rrmFj9tSDsDMwhXCV2yRt2clcRLfkGW9rdqkSXxh+0bKdRuCGCuvXZJokQPtXIxs3z6pBAWhcG1A7H6p7
X-Gm-Message-State: AOJu0Yzgf/B51Z8gdnOSSWlZzjyDlRtk8eCOwgYdfQ2HSUpuOEHTBJXa
	EmVXGh7PBE5zg1jEC9mXaC/nimHsb8GlSoKqNIJD1qUNAph2tKAXvJ05EqUckg==
X-Google-Smtp-Source: AGHT+IFLxwTdMSiyaeqLoOgKMl1Ene20t6SG2k2rnn50xB6oOWu9hS/cIeVubtkEo9a2ceOAc//KiA==
X-Received: by 2002:a05:6a00:3c8e:b0:6e4:c592:deaa with SMTP id lm14-20020a056a003c8e00b006e4c592deaamr854224pfb.11.1709587189198;
        Mon, 04 Mar 2024 13:19:49 -0800 (PST)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id t26-20020a62d15a000000b006e04c3b3b5asm8283288pfl.175.2024.03.04.13.19.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Mar 2024 13:19:47 -0800 (PST)
From: Kees Cook <keescook@chromium.org>
To: Alex Elder <elder@kernel.org>
Date: Mon,  4 Mar 2024 13:19:45 -0800
Message-Id: <20240304211940.it.083-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5072; i=keescook@chromium.org;
 h=from:subject:message-id; bh=GzpZ/81jwqeQvoZLzsqYfc6Kb/FkPz/ssCrmMegdNyY=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBl5jrxN9hNacEYPFNk5QoT2iY8dnME3XUqQe4kW
 4SvJZfSbCCJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZeY68QAKCRCJcvTf3G3A
 JjA/D/9ZZh0WdLrPuYsTqE5waxJVDv77dJ7ZtPPon1KGE7ZBUoDU2617qGC0iPW7EBH6V0zqmzM
 zZwqpVFu/pGNwMEfVPMNXj+q0FPfqAxDDQXWcpH/KVpEYQ1d+y7j+4dENod3GgXzeJxqEk0hR4Y
 lgDr8tKheYkl7kSH+a4r8mM5Kn8akoAA9nWpvg5bDzQIefT7dAoUULSbzrMqEkiz4OdQr2XrGZo
 XPPKxbu09NtSJOLMXgkrQAXQJJue1JZwhQSzQ283Di6OjQXDZnwEDUM6ZubiIMztf5uRJ1e70NI
 m3ca/eug+fjncW2K5aciaPRf7FfISVjaXM9dHvSrLPy9KbKlLelXFeOb252L5fi4zz0g2ce8aVR
 k5QWe0rQRUjGAMfaf05h41sTbv8qppoIfNyysuPEx2tCdlX+ut7A9AV2wnIeoQU32JBgDIzHa5R
 Ayd05DxHwPoze3qRRg8H1D1DkGCsOp6V9K1EgLs/J94xN4kOM+X1CYfiFV+tw5pIFPuwIrYcjY/
 YMn9dLJ7lGZifd1eN6LmnKniG/o38iJhTJTL4bVsrsZHOfFHBE1O0E7X6gdjGYOkUOPV1Q1Eb+z
 VCFyTofIZ3UVEye8ohwp1XI3YF8sGZXa5Jtv4yUpv+9EskUlTq7C2p1iUkgQwl2pl6ZKftEqQ1b
 kGTKWup urpNnjpQ==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 121B33F0A4
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.60 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_RHS_MATCH_TO(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.210.169:from];
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
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_TWO(0.00)[2];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	DKIM_TRACE(0.00)[chromium.org:+]
Message-ID-Hash: OC6NHZHECOGYZQNRBU6SJ7UKBW4UUGJN
X-Message-ID-Hash: OC6NHZHECOGYZQNRBU6SJ7UKBW4UUGJN
X-MailFrom: keescook@chromium.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Kees Cook <keescook@chromium.org>, Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>, "Gustavo A . R . Silva" <gustavo@embeddedor.com>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, "Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v2] greybus: Avoid fake flexible array for response data
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/OC6NHZHECOGYZQNRBU6SJ7UKBW4UUGJN/>
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
Cc: Alex Elder <elder@kernel.org>
Cc: Viresh Kumar <vireshk@kernel.org>
Cc: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Gustavo A. R. Silva <gustavo@embeddedor.com>
Cc: greybus-dev@lists.linaro.org
Cc: linux-staging@lists.linux.dev
 v2: add comments about removed structs
 v1: https://patchwork.kernel.org/project/linux-hardening/patch/20240216232824.work.862-kees@kernel.org/
---
 drivers/staging/greybus/bootrom.c         | 8 ++++----
 drivers/staging/greybus/fw-download.c     | 8 ++++----
 include/linux/greybus/greybus_protocols.h | 8 ++------
 3 files changed, 10 insertions(+), 14 deletions(-)

diff --git a/drivers/staging/greybus/bootrom.c b/drivers/staging/greybus/bootrom.c
index 79581457c4af..c0d338db6b52 100644
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
@@ -280,15 +280,15 @@ static int gb_bootrom_get_firmware(struct gb_operation *op)
 		goto unlock;
 	}
 
-	if (!gb_operation_response_alloc(op, sizeof(*firmware_response) + size,
-					 GFP_KERNEL)) {
+	/* gb_bootrom_get_firmware_response contains only a byte array */
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
index 543692c567f9..a06065fb0c5e 100644
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
@@ -325,8 +325,8 @@ static int fw_download_fetch_firmware(struct gb_operation *op)
 		goto put_fw;
 	}
 
-	if (!gb_operation_response_alloc(op, sizeof(*response) + size,
-					 GFP_KERNEL)) {
+	/* gb_fw_download_fetch_firmware_response contains only a byte array */
+	if (!gb_operation_response_alloc(op, size, GFP_KERNEL)) {
 		dev_err(fw_download->parent,
 			"error allocating fetch firmware response\n");
 		ret = -ENOMEM;
@@ -334,7 +334,7 @@ static int fw_download_fetch_firmware(struct gb_operation *op)
 	}
 
 	response = op->response->payload;
-	memcpy(response->data, fw->data + offset, size);
+	memcpy(response, fw->data + offset, size);
 
 	dev_dbg(fw_download->parent,
 		"responding with firmware (offs = %u, size = %u)\n", offset,
diff --git a/include/linux/greybus/greybus_protocols.h b/include/linux/greybus/greybus_protocols.h
index aeb8f9243545..820134b0105c 100644
--- a/include/linux/greybus/greybus_protocols.h
+++ b/include/linux/greybus/greybus_protocols.h
@@ -232,9 +232,7 @@ struct gb_fw_download_fetch_firmware_request {
 	__le32			size;
 } __packed;
 
-struct gb_fw_download_fetch_firmware_response {
-	__u8			data[0];
-} __packed;
+/* gb_fw_download_fetch_firmware_response contains no other data */
 
 /* firmware download release firmware request */
 struct gb_fw_download_release_firmware_request {
@@ -414,9 +412,7 @@ struct gb_bootrom_get_firmware_request {
 	__le32			size;
 } __packed;
 
-struct gb_bootrom_get_firmware_response {
-	__u8			data[0];
-} __packed;
+/* gb_bootrom_get_firmware_response contains no other data */
 
 /* Bootrom protocol Ready to boot request */
 struct gb_bootrom_ready_to_boot_request {
-- 
2.34.1

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
