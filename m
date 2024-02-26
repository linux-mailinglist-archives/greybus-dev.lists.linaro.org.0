Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F99086CAD7
	for <lists+greybus-dev@lfdr.de>; Thu, 29 Feb 2024 14:59:42 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 1D8823F49E
	for <lists+greybus-dev@lfdr.de>; Thu, 29 Feb 2024 13:59:41 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	by lists.linaro.org (Postfix) with ESMTPS id 3F95D3F00F
	for <greybus-dev@lists.linaro.org>; Mon, 26 Feb 2024 21:04:41 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=marliere.net header.s=2024 header.b=O+kp4mZt;
	spf=pass (lists.linaro.org: domain of rbmarliere@gmail.com designates 209.85.210.177 as permitted sender) smtp.mailfrom=rbmarliere@gmail.com;
	dmarc=pass (policy=reject) header.from=marliere.net
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-6e4d869b019so1658790b3a.0
        for <greybus-dev@lists.linaro.org>; Mon, 26 Feb 2024 13:04:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708981480; x=1709586280;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:dkim-signature:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=di/AZFz9sLot2V88t6wDfyehv4U4V7LTUaaM/w4fGrY=;
        b=wlo8vhnXJ6/l7o6P4hqnFEoaf+gUR2mosbxKpSzAJqnbQHvKNTtfb2NnC1fh8kGjdV
         I5hEyEn7K+Sq4BR88DxsgD1MG4PwJ7w1whCi6MGcvB2LV/fbbUOdi6K4N3aXzIX8k618
         qnA7gNxXo7Q/7tBwrGbO8JcdQ2vfOOr4BEzG0ayI/+hRde/NBIrplDdVhNwGwRNtOeDq
         b57Gt83nWhWQot2lxYln0AkrizjYduxLfcmNBVJVVxxarXKSPwSrm6HZC4TQeHbDSfOj
         XQuFTrgOQ4FScj4QOD9SXHxp7s0SMwDfUhKvoUdWrqHezK31GMTpGmfrNv903rjws3Kf
         kb3g==
X-Gm-Message-State: AOJu0YwK4nCi6Dj/57cW538IgRLxuzGXn+Sf71D2KNIQr97JkgFdSaxO
	e5QtQiAPckhgiG5OwC7gEj1qHqCE9RL8LsfNzksYSwx6+Aq5e1Cu
X-Google-Smtp-Source: AGHT+IHLff8hF5X99cuoYiqtIthswWIQQHVmGF8jh4pG2pljdRsU7vN99EJhhpGtHRMJEb08Ifl0Kg==
X-Received: by 2002:a05:6a20:6f87:b0:19e:cbe9:64b with SMTP id gv7-20020a056a206f8700b0019ecbe9064bmr353724pzb.50.1708981480296;
        Mon, 26 Feb 2024 13:04:40 -0800 (PST)
Received: from mail.marliere.net ([24.199.118.162])
        by smtp.gmail.com with ESMTPSA id f6-20020a056a00238600b006e0dd50b0d0sm4478320pfc.8.2024.02.26.13.04.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 13:04:39 -0800 (PST)
From: "Ricardo B. Marliere" <ricardo@marliere.net>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marliere.net;
	s=2024; t=1708981478;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=di/AZFz9sLot2V88t6wDfyehv4U4V7LTUaaM/w4fGrY=;
	b=O+kp4mZtE1neSJbHU9ouoMvy1Tws5X8oq8pCWjz0pRVnpcNwgKmss6/9lIJRad88qcB3uR
	xinrZD4qXViDTZD6eyTAohvRzHJOetgk8e3YnCtASYPqOlJLlOA9xe4WybOAPUIGcllGfa
	VPIXdR5Ilna3Ir9fFX8vFC8anxm33M0sLjRWIFTyAaSR//bTYBwq20aGAF5M15WTVdVASo
	h6cEJ93KFsm3DF5fSA3gnMKYmp0xdmckUrnYMQeYBNO7WluvUvWjqbiPybRuByS0wOr5xb
	Q9HJl3ENxlO1wkDETyjr2kOqd+HcJ7cNepeeDVcxKrjs6OVVy9ZTvzSMtLohjQ==
Date: Mon, 26 Feb 2024 18:05:19 -0300
MIME-Version: 1.0
Message-Id: <20240226-device_cleanup-greybus2-v1-1-5f7d1161e684@marliere.net>
X-B4-Tracking: v=1; b=H4sIAA793GUC/x2MWwqAMAzAriL9dqD1BV5FRLZZtSBTNiaK7O4WP
 wNJXgjkmQL02QueLg58OIEyz8Bu2q2keBYGLLAuEFs1i2RpsjtpF0+1enpMDKhM11ZLI0qpDUh
 9elr4/s/DmNIH7HTC32kAAAA=
To: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
X-Developer-Signature: v=1; a=openpgp-sha256; l=2971; i=ricardo@marliere.net;
 h=from:subject:message-id; bh=5tVQ0AMIfAJPSPk2zY4do+pRL26IYgV2hvr8tGafaN8=;
 b=owEBbQKS/ZANAwAKAckLinxjhlimAcsmYgBl3P0d9kMM+PbT3cDnBmZLrC8fNpA0mO+2XqX+h
 YrEzMq/RzeJAjMEAAEKAB0WIQQDCo6eQk7jwGVXh+HJC4p8Y4ZYpgUCZdz9HQAKCRDJC4p8Y4ZY
 pkaMD/4ljpY9VocuH1egUJQ9hR0j7hv3W2ShMTpEraG0BmXGH0DG2tAGOofhaB14D/T6/FmHKqr
 7xEsRh5oB1PcoDhIJpEqKPhMR9Axxm87E1ruZuEq1p4UeWmj3hy63zzzFCA1TQZcBQXJm6HvIcy
 2zjlgCCugNcCHx44zEVHE0vEM7Bcax1jz2+LfHOigtY9BMzsG8LQ2oW6kHzIMXxp4V40/T4v+Ux
 fsuiBAO7Kt9yFHJzQAmQbmMmyApMBiUikImrGk4RD9+QFHG14EG+PCBWfV7m00dM/UnajsDo0qy
 y/oipRbebMww8IzcBuC4TEfGYtrTqiNd5B3eDUlbr2Su6Tve50PHrEGpNgTAG6zwexJ1VoVWA7j
 THJ6aX7G1LS7JqowYvKomp6HQUYmq2l3Dbn/HEsmocVB2q73unx8v3KzkKQMaN44G/94J2D5rQh
 GFIISnNX8YdwhWdItrA8Xriz9ljNJ3MYCOhJjfFRo89XXgzlsem30QP92OuMHwVuNoJuN26BD0y
 R+71NkqgGMMDtlgP7fzg6F6MFTcn9nmoV6ICrLhU0Ar1Gz4HBlWELCXFAyRbfexp77RVRciyCFm
 IDQnvbDjIKTtt21fJ1tFNyr+JiVUFmh7oqjmzGZhJJXzUvvnaE48d0yYzsKDYK5QbrbeqDo+9t+
 h5ZKvmHDtS3cNJw==
X-Developer-Key: i=ricardo@marliere.net; a=openpgp;
 fpr=030A8E9E424EE3C0655787E1C90B8A7C638658A6
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 3F95D3F00F
X-Spamd-Bar: ---
X-Spamd-Result: default: False [-3.80 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	DMARC_POLICY_ALLOW(-0.50)[marliere.net,reject];
	FORGED_SENDER(0.30)[ricardo@marliere.net,rbmarliere@gmail.com];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[marliere.net:s=2024];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.210.177:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	ARC_NA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_NEQ_ENVFROM(0.00)[ricardo@marliere.net,rbmarliere@gmail.com];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[marliere.net:+]
X-MailFrom: rbmarliere@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: JBWSGI4LUYGCCS75AKCVNXFBAOUJI3JC
X-Message-ID-Hash: JBWSGI4LUYGCCS75AKCVNXFBAOUJI3JC
X-Mailman-Approved-At: Thu, 29 Feb 2024 13:59:21 +0000
CC: greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org, "Ricardo B. Marliere" <ricardo@marliere.net>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] greybus: move is_gb_* functions out of greybus.h
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/JBWSGI4LUYGCCS75AKCVNXFBAOUJI3JC/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The functions below are only used within the context of
drivers/greybus/core.c, so move them all into core and drop their 'inline'
specifiers:

is_gb_host_device(), is_gb_module(), is_gb_interface(), is_gb_control(),
is_gb_bundle() and is_gb_svc().

Suggested-by: Alex Elder <elder@ieee.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Ricardo B. Marliere <ricardo@marliere.net>
---
 drivers/greybus/core.c  | 30 ++++++++++++++++++++++++++++++
 include/linux/greybus.h | 30 ------------------------------
 2 files changed, 30 insertions(+), 30 deletions(-)

diff --git a/drivers/greybus/core.c b/drivers/greybus/core.c
index 5714be740470..f660b213233d 100644
--- a/drivers/greybus/core.c
+++ b/drivers/greybus/core.c
@@ -27,6 +27,36 @@ int greybus_disabled(void)
 }
 EXPORT_SYMBOL_GPL(greybus_disabled);
 
+static int is_gb_host_device(const struct device *dev)
+{
+	return dev->type == &greybus_hd_type;
+}
+
+static int is_gb_module(const struct device *dev)
+{
+	return dev->type == &greybus_module_type;
+}
+
+static int is_gb_interface(const struct device *dev)
+{
+	return dev->type == &greybus_interface_type;
+}
+
+static int is_gb_control(const struct device *dev)
+{
+	return dev->type == &greybus_control_type;
+}
+
+static int is_gb_bundle(const struct device *dev)
+{
+	return dev->type == &greybus_bundle_type;
+}
+
+static int is_gb_svc(const struct device *dev)
+{
+	return dev->type == &greybus_svc_type;
+}
+
 static bool greybus_match_one_id(struct gb_bundle *bundle,
 				 const struct greybus_bundle_id *id)
 {
diff --git a/include/linux/greybus.h b/include/linux/greybus.h
index 18c0fb958b74..38c45ec7d099 100644
--- a/include/linux/greybus.h
+++ b/include/linux/greybus.h
@@ -113,36 +113,6 @@ extern struct device_type greybus_control_type;
 extern struct device_type greybus_bundle_type;
 extern struct device_type greybus_svc_type;
 
-static inline int is_gb_host_device(const struct device *dev)
-{
-	return dev->type == &greybus_hd_type;
-}
-
-static inline int is_gb_module(const struct device *dev)
-{
-	return dev->type == &greybus_module_type;
-}
-
-static inline int is_gb_interface(const struct device *dev)
-{
-	return dev->type == &greybus_interface_type;
-}
-
-static inline int is_gb_control(const struct device *dev)
-{
-	return dev->type == &greybus_control_type;
-}
-
-static inline int is_gb_bundle(const struct device *dev)
-{
-	return dev->type == &greybus_bundle_type;
-}
-
-static inline int is_gb_svc(const struct device *dev)
-{
-	return dev->type == &greybus_svc_type;
-}
-
 static inline bool cport_id_valid(struct gb_host_device *hd, u16 cport_id)
 {
 	return cport_id != CPORT_ID_BAD && cport_id < hd->num_cports;

---
base-commit: 70ff1fe626a166dcaadb5a81bfe75e22c91f5dbf
change-id: 20240226-device_cleanup-greybus2-b763f50221ab

Best regards,
-- 
Ricardo B. Marliere <ricardo@marliere.net>

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
