Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E1E9AC45C3
	for <lists+greybus-dev@lfdr.de>; Tue, 27 May 2025 02:59:44 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 1B9494403B
	for <lists+greybus-dev@lfdr.de>; Tue, 27 May 2025 00:59:43 +0000 (UTC)
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
	by lists.linaro.org (Postfix) with ESMTPS id 299CA44342
	for <greybus-dev@lists.linaro.org>; Mon, 26 May 2025 11:08:12 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=nKEynj46;
	spf=pass (lists.linaro.org: domain of clf700383@gmail.com designates 209.85.214.193 as permitted sender) smtp.mailfrom=clf700383@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pl1-f193.google.com with SMTP id d9443c01a7336-231b7b21535so1817145ad.1
        for <greybus-dev@lists.linaro.org>; Mon, 26 May 2025 04:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748257691; x=1748862491; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TYrv+P2HDOOtjJG1Ylbuyew/XFq9E/PugmdWiaigIXA=;
        b=nKEynj46AY2Q+PtWTa2momYezjEoF3Yd4LJrNZ6tKgbvj5bxRGAAi3xd73JLo3pIen
         bZDXF3EmdprBwxRcuel98CZ/RLHTN1iWSpHlL8Y0MoWhHfpT36v80ZvE1JrPad+C3Uhn
         RH3HdZs1cjJV012I7n09QJKCC4mNxZgSocp+xXaEFxQmnOtBgp39dAOJj6BoqJHD/r5o
         cdetjEhrrrK1ER3wd8WvTKMQcrT7Xa05iCFOMKFS0rIvzFQHn5L/SkV0xzCVANkuvndt
         0os2mma3B9SoJOyz1X14sfhHF/S+VjbwWg4Km1twsX1gU9iSEFhdjYyLdKEteGzxsyIN
         32UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748257691; x=1748862491;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TYrv+P2HDOOtjJG1Ylbuyew/XFq9E/PugmdWiaigIXA=;
        b=CyjhereYaZ6KTd9djPQJB/B42DujzpSSKG3fYaTFcbFtCWwX4x6YN553yKzM1+g8yV
         WQFAg37goU3mD2vgOtwCavVIzZrvrqqoC/dDt9q1vRLHc7ETmjUhAFtI2QlpmaQ89Dl8
         mWXQoxEjon4L/S33BbBke6cwqyeXBQqDkHQ3qQkfne8/eGbvQ4T7RKahe/hj1w52CQi3
         2nLPCQndRMEhk8U+ubJ9z9L8mQJiJtQXxYao8qNMgzKBzIpvYyCl0xVbqugof9ccg2ie
         ggqozzgowAqRyzQ7sz8JWBFHuudbfp9HHSq3XWRcQpEASkPRz6bbV59B7FOL2Y0azueA
         X0bg==
X-Forwarded-Encrypted: i=1; AJvYcCUFu1zgZVdoD3EGF31RcdBDVNE6zBPJM77up1yCSr1UdGjtcueSsh83bzGXLG7lJYunJvNSB3aQGlT1bw==@lists.linaro.org
X-Gm-Message-State: AOJu0YxXEv4BO3Y/6tjUSBA0SYseaFYAhAYtyey3MmLPhgsd4S/STxxz
	WEFRM8v8g5QfQZIe9xgzaSqfr2PJ2Tc0qaN0UGLG1x2qejILM7TS2d5k
X-Gm-Gg: ASbGnctOo2pA3ikgJq5p4XQuF/nCh7Jqf0yel58swEJY/7sxK83HKxDPnn/7kaw/LRg
	x5aG2mi5g7Grrl+YDYfept3fVdjHs2EkEc+IFVDf3Cfa+8tNRANjLeYEeegdfKjMq41s1S8QjVv
	aZsEDLiDB8nUilcHHfSuAbUs4Eg+AN6mtvcAfk+m58VlgmLjGFoyfent7wS2/39nMCyA3d2rCJp
	6LVNPdBup0sUi5Jh3Jho2v159mMEV8zhrXiNS1WF7LsavcDmKs9Wn5hyH2dTILxc/gqOwOo/ILg
	eF306UYt5psjDGWeaVJdVnQhpCEvGg==
X-Google-Smtp-Source: AGHT+IHq3w0bF9u3FNLf9NfvqS8horvVYf7CrW5lhlByo7h0D4LInhkkAn5Rq1vWblX71HzqOcrmxA==
X-Received: by 2002:a17:902:db03:b0:223:5525:622f with SMTP id d9443c01a7336-23414f2fca5mr49499585ad.1.1748257691042;
        Mon, 26 May 2025 04:08:11 -0700 (PDT)
Received: from user.. ([2001:da8:283:e049::9:6ed3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23435e7671asm28156875ad.89.2025.05.26.04.08.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 04:08:10 -0700 (PDT)
From: clingfei <clf700383@gmail.com>
To: elder@kernel.org
Date: Mon, 26 May 2025 19:06:54 +0800
Message-Id: <20250526110654.3916536-1-clf700383@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Spamd-Result: default: False [-2.60 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.214.193:from];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_TLS_LAST(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linuxfoundation.org,lists.linaro.org,lists.linux.dev,vger.kernel.org,gmail.com];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	DKIM_TRACE(0.00)[gmail.com:+]
X-Rspamd-Queue-Id: 299CA44342
X-Spamd-Bar: --
X-MailFrom: clf700383@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: 3BS2ICKHCZI4442SKGH7QHO4O3ICWAEZ
X-Message-ID-Hash: 3BS2ICKHCZI4442SKGH7QHO4O3ICWAEZ
X-Mailman-Approved-At: Tue, 27 May 2025 00:59:41 +0000
CC: johan@kernel.org, vireshk@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, clf700383@gmail.com
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] greybus: Avoid fake flexible array for response data
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/3BS2ICKHCZI4442SKGH7QHO4O3ICWAEZ/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

As https://lore.kernel.org/all/20240304211940.it.083-kees@kernel.org/
pointed out, to enforce the 0-sized destinations, the remaining 0-sized
destinations need to be handled. Thus the struct
gb_control_get_manifest_response and struct gb_i2c_transfer_response
are removed.

Signed-off-by: clingfei <clf700383@gmail.com>
---
 drivers/staging/greybus/i2c.c             | 9 ++++-----
 include/linux/greybus/greybus_protocols.h | 9 ---------
 2 files changed, 4 insertions(+), 14 deletions(-)

diff --git a/drivers/staging/greybus/i2c.c b/drivers/staging/greybus/i2c.c
index 14f1ff6d448c..2857c2834206 100644
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
@@ -188,7 +187,7 @@ static int gb_i2c_transfer_operation(struct gb_i2c_device *gb_i2c_dev,
 
 	ret = gb_operation_request_send_sync(operation);
 	if (!ret) {
-		struct gb_i2c_transfer_response *response;
+		u8 *response;
 
 		response = operation->response->payload;
 		gb_i2c_decode_response(msgs, msg_count, response);
diff --git a/include/linux/greybus/greybus_protocols.h b/include/linux/greybus/greybus_protocols.h
index 820134b0105c..14395f9300d6 100644
--- a/include/linux/greybus/greybus_protocols.h
+++ b/include/linux/greybus/greybus_protocols.h
@@ -110,11 +110,6 @@ struct gb_control_get_manifest_size_response {
 	__le16			size;
 } __packed;
 
-/* Control protocol manifest get request has no payload */
-struct gb_control_get_manifest_response {
-	__u8			data[0];
-} __packed;
-
 /* Control protocol [dis]connected request */
 struct gb_control_connected_request {
 	__le16			cport_id;
@@ -678,10 +673,6 @@ struct gb_i2c_transfer_request {
 	__le16				op_count;
 	struct gb_i2c_transfer_op	ops[];		/* op_count of these */
 } __packed;
-struct gb_i2c_transfer_response {
-	__u8				data[0];	/* inbound data */
-} __packed;
-
 
 /* GPIO */
 
-- 
2.34.1

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
