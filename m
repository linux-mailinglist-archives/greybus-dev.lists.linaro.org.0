Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YEFrIMEJ+2mbVQMAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Wed, 06 May 2026 11:28:33 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D034D89C0
	for <lists+greybus-dev@lfdr.de>; Wed, 06 May 2026 11:28:33 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 611BD406B3
	for <lists+greybus-dev@lfdr.de>; Wed,  6 May 2026 09:28:32 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	by lists.linaro.org (Postfix) with ESMTPS id 0A88C404C7
	for <greybus-dev@lists.linaro.org>; Mon,  4 May 2026 23:35:08 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=efB9VmU4;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (lists.linaro.org: domain of meatuni001@gmail.com designates 209.85.128.53 as permitted sender) smtp.mailfrom=meatuni001@gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-48374014a77so53758215e9.3
        for <greybus-dev@lists.linaro.org>; Mon, 04 May 2026 16:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777937707; x=1778542507; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WqpTPO4JM1ij5VfC2iJKwCbrcvO2GqT/K+xw0onwWmI=;
        b=efB9VmU4HQw6l9I4DJ0jP7bQF797A9y1XE5hZ48GTClQnMbDGcsvaxQvj3m3HsKim+
         eoMuv0tdxEFMCt1aSgmmiuMbsp8OZjtyH7dZZkyO4FxNXcLwBX8QAc3xccaddQ+yfi/i
         Tai/YOdeUX00MGwaEqdnNzHWcRp80jLwjruIjg7o9bgG1OXj8/c5fH935SZ7U8syKbh1
         l9F8gcsJzVdL9uMNAzCWDc6uf8SrnjDUgi/C/9PbTHWpGS3ijmUHuc3Bp9BHj2Rx1/Em
         FNywJkEDybeU7z2Af1bUDstJNlMPIArC/xu+uuAGhgiKm3rMRXurRF1fjOBbrLWwTkoa
         ELyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777937707; x=1778542507;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WqpTPO4JM1ij5VfC2iJKwCbrcvO2GqT/K+xw0onwWmI=;
        b=K7WdlM2ZyEHbekN+A7SX68VXgr2w/ThULQ4OeIgPQGYGH62FZfy/Pnk3849PcsAw4Z
         qGgp43JuioOezKzwa4w2Dz/n3IRfA/c8mH32+1dgdZ3w1E9TEYgM64J+ozNdWJk81YnS
         0DoIbreaOfjhRdIPmvoyPkPkzgJPRDU0fz/yUt9AMxBOG/Buze7zcDI+2CDrBhliXwQx
         EaDfH5rAZl3ioNy+zQSKvLyYgaEdJ5v8mL7YaL//+1zEy+iQLeOCYczZjoNiIGFoWCw5
         XSkKTHPcTxs6SKaOD/l4tu23lygWs/bBunqRqHVzUJBhYGBrCwe+2xVl+ZvpYh0BhoO7
         uCvQ==
X-Gm-Message-State: AOJu0YxypdUETzclTwRUWc+XjZ3ecfSJdevVwKoJOE+S9Mo5hpGZcskF
	lQKK3A6AALJuFLMkKKh9w/2u9NdSVR+Dg7ttF8AM7yQhHKsn6XJGsAWGr4E/WaBH5co=
X-Gm-Gg: AeBDievCJeozJ1rTxgD44HVQvuEMU1Sj8f6+eX4mQpfPSIM63VUSzLSxWbKLdJOVgHm
	o6UgLJsKhqN2iQ2r8RLLtym3FFXQt78LqP9arI+Zc15Sw4iulNSAF89MGr4WJxn+sfR5GNluOZQ
	Ayvb7MatWCH/DJBdpjLxnXEhvsD3xSOxnyII3MwYDxTOakWEtf9kFwIlzLZMzTud+izdtb3C8om
	XC7QyDjNmTgAUKJWAOMh1H8z8dGiCF90F6GHF8Yxx3moMsJALYWBbUAxal2SFbBSigrNHBPP6F6
	HpHpw1PNdR64D8SoqaCz1WbCN/1CucP1fWGrabcuTpelF7jJ3G3Sn6zygZ3t7zb7wWB38dGFdXL
	uIiTXPQi73JsyQI3eB66enJRUN/UDlsVYK/egDw4q8ZDehCZwpMHG0F/nmBV3Gsqpuv88DkBeSd
	Uy4AfBZHCWEWzOgcXR2deoDRGaVg8=
X-Received: by 2002:a05:600c:4445:b0:48a:52ee:5776 with SMTP id 5b1f17b1804b1-48a986380ecmr189126045e9.11.1777937706367;
        Mon, 04 May 2026 16:35:06 -0700 (PDT)
Received: from node ([202.47.63.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a822bf3ffsm390071835e9.7.2026.05.04.16.35.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 16:35:05 -0700 (PDT)
From: Muhammad Bilal <meatuni001@gmail.com>
To: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev
Date: Mon,  4 May 2026 19:33:28 -0400
Message-ID: <20260504233328.7409-1-meatuni001@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Spamd-Bar: --
X-MailFrom: meatuni001@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: FFTUMDXNPMYE6YPVQLQPDEQ4RZZQDNHG
X-Message-ID-Hash: FFTUMDXNPMYE6YPVQLQPDEQ4RZZQDNHG
X-Mailman-Approved-At: Wed, 06 May 2026 09:28:27 +0000
CC: vireshk@kernel.org, johan@kernel.org, elder@kernel.org, linux-kernel@vger.kernel.org, Muhammad Bilal <meatuni001@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v1] greybus: authentication: validate CAP response payload size
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/FFTUMDXNPMYE6YPVQLQPDEQ4RZZQDNHG/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 45D034D89C0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.59 / 15.00];
	DATE_IN_PAST(1.00)[33];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+mx:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-0.954];
	FROM_NEQ_ENVFROM(0.00)[meatuni001@gmail.com,greybus-dev-bounces@lists.linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linaro.org:helo,lists.linaro.org:rdns]

cap_get_ims_certificate() and cap_authenticate() copy variable-length
response data directly into fixed-size UAPI buffers using the
untrusted op->response->payload_size value without any bounds checks.

A malicious or compromised Greybus endpoint can return an oversized
certificate or signature payload, causing a kernel heap overflow.

Fix both functions by:
  - Rejecting responses shorter than sizeof(*response) with -EPROTO.
  - Rejecting payloads exceeding CAP_CERTIFICATE_MAX_SIZE (1600) or
    CAP_SIGNATURE_MAX_SIZE (320) with -EMSGSIZE.
  - Copying only the validated size into the UAPI buffer.

Fixes: e3eda54d0b5f ("greybus: Add Component Authentication Protocol support")
Signed-off-by: Muhammad Bilal <meatuni001@gmail.com>
---
 drivers/staging/greybus/authentication.c | 34 +++++++++++++++++++++---
 1 file changed, 30 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/greybus/authentication.c b/drivers/staging/greybus/authentication.c
index 97b9937bb..103cc15d2 100644
--- a/drivers/staging/greybus/authentication.c
+++ b/drivers/staging/greybus/authentication.c
@@ -109,6 +109,7 @@ static int cap_get_ims_certificate(struct gb_cap *cap, u32 class, u32 id,
 	struct gb_cap_get_ims_certificate_request *request;
 	struct gb_cap_get_ims_certificate_response *response;
 	size_t max_size = gb_operation_get_payload_size_max(connection);
+	size_t cert_size;
 	struct gb_operation *op;
 	int ret;
 
@@ -131,9 +132,21 @@ static int cap_get_ims_certificate(struct gb_cap *cap, u32 class, u32 id,
 	}
 
 	response = op->response->payload;
+
+	if (op->response->payload_size < sizeof(*response)) {
+		ret = -EPROTO;
+		goto done;
+	}
+
+	cert_size = op->response->payload_size - sizeof(*response);
+	if (cert_size > CAP_CERTIFICATE_MAX_SIZE) {
+		ret = -EMSGSIZE;
+		goto done;
+	}
+
 	*result = response->result_code;
-	*size = op->response->payload_size - sizeof(*response);
-	memcpy(certificate, response->certificate, *size);
+	*size = (u32)cert_size;
+	memcpy(certificate, response->certificate, cert_size);
 
 done:
 	gb_operation_put(op);
@@ -148,6 +161,7 @@ static int cap_authenticate(struct gb_cap *cap, u32 auth_type, u8 *uid,
 	struct gb_cap_authenticate_request *request;
 	struct gb_cap_authenticate_response *response;
 	size_t max_size = gb_operation_get_payload_size_max(connection);
+	size_t sig_size;
 	struct gb_operation *op;
 	int ret;
 
@@ -170,10 +184,22 @@ static int cap_authenticate(struct gb_cap *cap, u32 auth_type, u8 *uid,
 	}
 
 	response = op->response->payload;
+
+	if (op->response->payload_size < sizeof(*response)) {
+		ret = -EPROTO;
+		goto done;
+	}
+
+	sig_size = op->response->payload_size - sizeof(*response);
+	if (sig_size > CAP_SIGNATURE_MAX_SIZE) {
+		ret = -EMSGSIZE;
+		goto done;
+	}
+
 	*result = response->result_code;
-	*signature_size = op->response->payload_size - sizeof(*response);
+	*signature_size = (u32)sig_size;
 	memcpy(auth_response, response->response, sizeof(response->response));
-	memcpy(signature, response->signature, *signature_size);
+	memcpy(signature, response->signature, sig_size);
 
 done:
 	gb_operation_put(op);
-- 
2.54.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
