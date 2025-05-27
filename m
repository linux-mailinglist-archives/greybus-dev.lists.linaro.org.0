Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 26400AC4D75
	for <lists+greybus-dev@lfdr.de>; Tue, 27 May 2025 13:33:25 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 475BE454CD
	for <lists+greybus-dev@lfdr.de>; Tue, 27 May 2025 11:33:24 +0000 (UTC)
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com [209.85.216.65])
	by lists.linaro.org (Postfix) with ESMTPS id 13CA544466
	for <greybus-dev@lists.linaro.org>; Tue, 27 May 2025 05:07:06 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=EPMHmDGB;
	spf=pass (lists.linaro.org: domain of clf700383@gmail.com designates 209.85.216.65 as permitted sender) smtp.mailfrom=clf700383@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pj1-f65.google.com with SMTP id 98e67ed59e1d1-309f26c68b8so163763a91.2
        for <greybus-dev@lists.linaro.org>; Mon, 26 May 2025 22:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748322425; x=1748927225; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bq5EwIkXOrraR/5nVIEtjR45/z8eeDLu8nm16aEaZ24=;
        b=EPMHmDGB6a8iC5FTPvCid0yJilZvuU85Z8F0KlqOce/WASCZUS9khmoy4Dj7W+HDZX
         NA+Oiu3nX8tkB+GDShZLn3zmwaVnmj0brGzSHKZ00qS/h7v2yh2ZjvOTgr8dzUGVoEL8
         o2x1dEVYyvk5ZqNgkqAUPSKRulKIhPaEuDeo5cWKXvgRakTFIzcsqZkhmGwX5K97su8V
         9WTavX1uBIKuPhSic6A44WrVRNSfJTzqPBGihFs9UCT5RtgXks69HQdwEZfx1TRwNIeo
         LU/+zVdDg6HISmaUQHRcb6DOp7yxsmQyCtF2HGUD83SdD3gLL3ySYMMyvfwcjeKBoPGV
         tqaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748322425; x=1748927225;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bq5EwIkXOrraR/5nVIEtjR45/z8eeDLu8nm16aEaZ24=;
        b=MPc9w5eXUko4t1bbDsIl4lYMcEkF7DzJst1l6kwz+vh1If6tIhvSnR6neAdZICfeop
         D+jQoOaSd+w4V79rriVlyA8o/Za++3avOMsxmUA6N2MZVLbnIsMHW6XfeqJNfWDqDQa+
         dZv4slJe/qQipnXWA2d+sgAfuz8bZwZZXL44TTTGHYX4kEVgF4bJltuTngfi34SOSK0h
         IVW/0Ob5nvr7XJ+2UPeMNN2p2UJOwUVPAvjWjnCkgq69z7UP/uARiBQwlJ32eqjP4/YN
         67/2eoytx3L9TFe7putGQrU+w4+gG0aaME/gJ/rHffp4HMGXmKtFSSWfqyn1MJGCWvyz
         q2PQ==
X-Forwarded-Encrypted: i=1; AJvYcCXsxBITqY6DkyNRK0A4UwVI9GQ40no5KUgQUj+3x9me4WpeO+OlpbkbxUieNWUg4tp6fblEXVnW8+6N/Q==@lists.linaro.org
X-Gm-Message-State: AOJu0YwN7n2Iwj29R8bIt/pDKIGWnXB8gqyJshdci07QNHLCodro2rcU
	wNye7fetT0NUlEb1Ui7FxLHrOCAkZfh3D74sEIGfhOkoKI7gSc1HWFo3
X-Gm-Gg: ASbGncsYPvSkFKyv5bi22aKHiQYyN+WGyNWw80myTod0gFCkFEbsttFZaG6lgyrfuWM
	7U2pCoCNt8QgOxtKmMcrsC4Axzpp+hiP3itVPIwZdckDhhR4PrmdMEx854jvyvZfQwry40nqBaT
	ARkK5HhPpr7EZKjpEBm+cIkOlMrlqpb/stUGqZrvzcdPTsIXmMMJwVPvFEX5ijx3vjq5Y8GZ+ef
	MspiU3w1GNjaxDEa+REIPrfWuGXqm3NImfSuRKDgWicaPLno+NdpAb8NaxNS82jSJLN9Z2bkOvp
	GXKan2h0oniO1fDbty4bxohhiBypwLXgmsvK+33Cnfw=
X-Google-Smtp-Source: AGHT+IG1ZpXlBdEq/GjPYtl6pc9EcGGLHPouogdxKALQB+704gWvgLlSpt5eYSZDLGVS4PrHfg2rcg==
X-Received: by 2002:a05:6a20:438f:b0:1ee:d6a7:e333 with SMTP id adf61e73a8af0-2188c3a285bmr6988282637.8.1748322424767;
        Mon, 26 May 2025 22:07:04 -0700 (PDT)
Received: from user.. ([58.206.232.74])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a98a0ca7sm17883937b3a.158.2025.05.26.22.07.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 22:07:04 -0700 (PDT)
From: clingfei <clf700383@gmail.com>
To: elder@kernel.org
Date: Tue, 27 May 2025 13:06:35 +0800
Message-Id: <20250527050635.946553-1-clf700383@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Spamd-Result: default: False [-2.60 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.216.65:from];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	URIBL_BLOCKED(0.00)[mail-pj1-f65.google.com:rdns,mail-pj1-f65.google.com:helo];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[chromium.org,kernel.org,linuxfoundation.org,lists.linaro.org,lists.linux.dev,vger.kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 13CA544466
X-Spamd-Bar: --
X-MailFrom: clf700383@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: YNWO53JXDK73ACO6AMRO3NEIUYFCJH6R
X-Message-ID-Hash: YNWO53JXDK73ACO6AMRO3NEIUYFCJH6R
X-Mailman-Approved-At: Tue, 27 May 2025 11:33:15 +0000
CC: keescook@chromium.org, johan@kernel.org, vireshk@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, clf700383@gmail.com
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v2] greybus: Avoid fake flexible array for response data
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/YNWO53JXDK73ACO6AMRO3NEIUYFCJH6R/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

We want to get rid of zero size arrays and use flexible arrays instead.
However, in this case the struct is just one flexible array of u8 which
adds no value. Just use a pointer instead.

v1: https://lore.kernel.org/all/202505262032.507AD8E0DC@keescook/

Signed-off-by: clingfei <clf700383@gmail.com>
---
 drivers/staging/greybus/i2c.c             | 12 ++++--------
 include/linux/greybus/greybus_protocols.h |  3 ---
 2 files changed, 4 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/greybus/i2c.c b/drivers/staging/greybus/i2c.c
index 14f1ff6d448c..b248d6717b71 100644
--- a/drivers/staging/greybus/i2c.c
+++ b/drivers/staging/greybus/i2c.c
@@ -144,15 +144,14 @@ gb_i2c_operation_create(struct gb_connection *connection,
 }
 
 static void gb_i2c_decode_response(struct i2c_msg *msgs, u32 msg_count,
-				   struct gb_i2c_transfer_response *response)
+				   u8 *data)
 {
 	struct i2c_msg *msg = msgs;
-	u8 *data;
 	u32 i;
 
-	if (!response)
+	if (!data)
 		return;
-	data = response->data;
+
 	for (i = 0; i < msg_count; i++) {
 		if (msg->flags & I2C_M_RD) {
 			memcpy(msg->buf, data, msg->len);
@@ -188,10 +187,7 @@ static int gb_i2c_transfer_operation(struct gb_i2c_device *gb_i2c_dev,
 
 	ret = gb_operation_request_send_sync(operation);
 	if (!ret) {
-		struct gb_i2c_transfer_response *response;
-
-		response = operation->response->payload;
-		gb_i2c_decode_response(msgs, msg_count, response);
+		gb_i2c_decode_response(msgs, msg_count, operation->response->payload);
 		ret = msg_count;
 	} else if (!gb_i2c_expected_transfer_error(ret)) {
 		dev_err(dev, "transfer operation failed (%d)\n", ret);
diff --git a/include/linux/greybus/greybus_protocols.h b/include/linux/greybus/greybus_protocols.h
index 820134b0105c..6a35c78b967b 100644
--- a/include/linux/greybus/greybus_protocols.h
+++ b/include/linux/greybus/greybus_protocols.h
@@ -678,9 +678,6 @@ struct gb_i2c_transfer_request {
 	__le16				op_count;
 	struct gb_i2c_transfer_op	ops[];		/* op_count of these */
 } __packed;
-struct gb_i2c_transfer_response {
-	__u8				data[0];	/* inbound data */
-} __packed;
 
 
 /* GPIO */
-- 
2.34.1

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
