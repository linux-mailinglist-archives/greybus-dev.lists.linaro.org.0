Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A48D85EDFA
	for <lists+greybus-dev@lfdr.de>; Thu, 22 Feb 2024 01:27:38 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id A932243F52
	for <lists+greybus-dev@lfdr.de>; Thu, 22 Feb 2024 00:27:37 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	by lists.linaro.org (Postfix) with ESMTPS id 6B3313EFFE
	for <greybus-dev@lists.linaro.org>; Mon, 19 Feb 2024 12:40:10 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=marliere.net header.s=2024 header.b=EUuagCe7;
	spf=pass (lists.linaro.org: domain of rbmarliere@gmail.com designates 209.85.214.180 as permitted sender) smtp.mailfrom=rbmarliere@gmail.com;
	dmarc=pass (policy=reject) header.from=marliere.net
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1dbf1fe91fcso7282145ad.3
        for <greybus-dev@lists.linaro.org>; Mon, 19 Feb 2024 04:40:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708346409; x=1708951209;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:dkim-signature:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uqp09n7s8zSXfMfH82VCiLrRu+5FdThwynVc1xzdBm4=;
        b=c4d60/PggldvVuVPulv0NWf7V8XkZdc58Aj446+hZiJBK0vitNp/c4CLxO36YNtouO
         ENOwpup186++7ESdDKrClz0WZAOF3sSS1/WALvF/J6NfDsohk7gVxiFyGZy0kpu+A9p6
         w5/aaF57DNJpzyM1Oyiu0Pn5H117g7/v64Y1qzmk83DwL7DBlmac2A8I2wQ6VVZC0ioL
         CeUYRb0vEOltsiSCCaVYa0pVB4juP81WVBFoSFJYO4fZa9JzB3+DFFLbmo34b+fCowY4
         u7yChJw7fOz9fE8YMgEFTKh8KBjxJWrHFigOjF2GM54PVdBWTJWpBtVcE4homz6f3yaK
         rOuQ==
X-Gm-Message-State: AOJu0YwX2ldmgn+t7MF3vZIPfK1qDVpfMDdJG+VxFmNEfDzR277KFFe/
	aclIRbWiF6kxy3yZ3+5tj43w0ldxpLD1Fyd93XVaFIkqFF6nYkuH
X-Google-Smtp-Source: AGHT+IEzOcyrQNaeZ8NHui8RLhzYqr7vsb1ZnJ2FVHcLfKWy/PFZRAzAJT3hrppWWRPLFRqdpj/2wA==
X-Received: by 2002:a17:903:986:b0:1db:db5e:6712 with SMTP id mb6-20020a170903098600b001dbdb5e6712mr6666851plb.58.1708346409476;
        Mon, 19 Feb 2024 04:40:09 -0800 (PST)
Received: from mail.marliere.net ([24.199.118.162])
        by smtp.gmail.com with ESMTPSA id 12-20020a170902ee4c00b001dba739d15bsm4264878plo.76.2024.02.19.04.40.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Feb 2024 04:40:09 -0800 (PST)
From: "Ricardo B. Marliere" <ricardo@marliere.net>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marliere.net;
	s=2024; t=1708346407;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Uqp09n7s8zSXfMfH82VCiLrRu+5FdThwynVc1xzdBm4=;
	b=EUuagCe7S/6/yXzp7Z3+rQT/7HoQMInIBNUcLZr6wE2f29W/TyU2goKrx7h4lAd+XZ4CH0
	otEKx/7M+n5pbPmrNK+dJoWwhT1BnAeSJutBy2ckrJLnlOPhceKi/MWTrjCv5wwh05mPGu
	Av/kffvuaqnETo7hfCh5ZeMBrCvpHmMiuG4KnzXqzg0MVFYK+MMzGjx/p2wK96Pld88fu6
	sG6pF6wzjsbyFn6xflvUnWDt+psrdwUKGVBaUNoRgkJEM/OfK3g225yILhOAsXM/PzmUpX
	/HrT+Hfad7fsIZx5nwgCo20H6VcVwwZY++rp/HWB0wBuZGCsy61Fjf8n0ZjPzg==
Date: Mon, 19 Feb 2024 09:40:50 -0300
MIME-Version: 1.0
Message-Id: <20240219-device_cleanup-greybus-v1-1-babb3f65e8cc@marliere.net>
X-B4-Tracking: v=1; b=H4sIAFFM02UC/x2M3QpAQBQGX0Xn2pbdyM+rSOL4cEpLu61I3t3mc
 mpmHvJwAk9N8pDDKV52G0GnCfE62AVKpshkMpNnRtdqihKj5w2DDYdaHO4xeMV1yRpzYfKiohg
 fDrNc/7jt3vcD/TXi92gAAAA=
To: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
X-Developer-Signature: v=1; a=openpgp-sha256; l=4624; i=ricardo@marliere.net;
 h=from:subject:message-id; bh=DbweASTEXHvNHHbDdR8OnHgPokqfSwG7rbh512B1lj0=;
 b=owEBbQKS/ZANAwAKAckLinxjhlimAcsmYgBl00xW7Nefy4TJNlZLv/bpaOaI78TMjGEzcuTza
 Mz/ae//utqJAjMEAAEKAB0WIQQDCo6eQk7jwGVXh+HJC4p8Y4ZYpgUCZdNMVgAKCRDJC4p8Y4ZY
 pnDRD/9cmNomQhIAU/nkOiUExUM2pxbNd/K/pTr+/ohcxYOgdqOfgtbC5S9il98tMlts4r/F5hy
 GDt2vbiHiQF/UNXnwMPuvfOolQDRKmXrZ26yiMUx7nxDNbG9roa31XxhfDqcd2BAdmQ8H+Xy+1a
 yJZmg1Cmi1FTZtcVx6MLKU8VFHGGRUzLCwhn+pRcwbongd8hyQopEE4/Pul2p/j4ldJr7J71gw0
 xIPG+o+QR3RZs+IPY+HSsfeQbcp1WaRuBOmxsAQgGjO37p88RsYVCF4EQkPPcAvRcD48kqFu2zX
 Ed/7GzEVxHmHNibdJMdqe+fLj+Rzhb9jnT/eDlDx7kt+i0PQEWhDi7lFWEn9kBGh5qud0+NudMG
 qHossSpY1bciBdZBT06i5pQkzPjaJjPn0EDdSYks1IQeUVkjcoSQ2qSxFp2mQe1Ow72nxvY3T9Z
 956FyeP0HaoXIxG4ume5kX0OoDMyrvAd/m66CDCa5NSidPwG0w+B8CIwPWhM7RdJKWG4huGotwS
 BD+wRxJUYiIC9EGpzBp8ajQhpeFbcxul7GFx+rFg0BpSBRPU27YMouLi3bqsx/yLWltRcRwcB2P
 ztewUH/6cKFVjYqLEbOS8ekKbnuzSG+TdoOwqphtMBNoSA0PTqdEw3hAKYPR5NLFJTv38gv6Mm6
 CIFsZbDoo6J7Z7w==
X-Developer-Key: i=ricardo@marliere.net; a=openpgp;
 fpr=030A8E9E424EE3C0655787E1C90B8A7C638658A6
X-Rspamd-Queue-Id: 6B3313EFFE
X-Spamd-Bar: ---
X-Spamd-Result: default: False [-3.80 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	DMARC_POLICY_ALLOW(-0.50)[marliere.net,reject];
	FORGED_SENDER(0.30)[ricardo@marliere.net,rbmarliere@gmail.com];
	R_DKIM_ALLOW(-0.20)[marliere.net:s=2024];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.214.180:from];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	ARC_NA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ricardo@marliere.net,rbmarliere@gmail.com];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWO(0.00)[2];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[marliere.net:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-MailFrom: rbmarliere@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: V56UD4KOI77IN67W4ATJ7474VGIUDJWH
X-Message-ID-Hash: V56UD4KOI77IN67W4ATJ7474VGIUDJWH
X-Mailman-Approved-At: Thu, 22 Feb 2024 00:27:19 +0000
CC: greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org, "Ricardo B. Marliere" <ricardo@marliere.net>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] greybus: constify the struct device_type usage
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/V56UD4KOI77IN67W4ATJ7474VGIUDJWH/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Since commit aed65af1cc2f ("drivers: make device_type const"), the driver
core can properly handle constant struct device_type. Move the
greybus_hd_type, greybus_module_type, greybus_interface_type,
greybus_control_type, greybus_bundle_type and greybus_svc_type variables to
be constant structures as well, placing it into read-only memory which can
not be modified at runtime.

Signed-off-by: Ricardo B. Marliere <ricardo@marliere.net>
---
 drivers/greybus/bundle.c    |  2 +-
 drivers/greybus/control.c   |  2 +-
 drivers/greybus/hd.c        |  2 +-
 drivers/greybus/interface.c |  2 +-
 drivers/greybus/module.c    |  2 +-
 drivers/greybus/svc.c       |  2 +-
 include/linux/greybus.h     | 12 ++++++------
 7 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/greybus/bundle.c b/drivers/greybus/bundle.c
index 84660729538b..a6e1cca06172 100644
--- a/drivers/greybus/bundle.c
+++ b/drivers/greybus/bundle.c
@@ -166,7 +166,7 @@ static const struct dev_pm_ops gb_bundle_pm_ops = {
 	SET_RUNTIME_PM_OPS(gb_bundle_suspend, gb_bundle_resume, gb_bundle_idle)
 };
 
-struct device_type greybus_bundle_type = {
+const struct device_type greybus_bundle_type = {
 	.name =		"greybus_bundle",
 	.release =	gb_bundle_release,
 	.pm =		&gb_bundle_pm_ops,
diff --git a/drivers/greybus/control.c b/drivers/greybus/control.c
index 359a25841973..b5cf49d09df2 100644
--- a/drivers/greybus/control.c
+++ b/drivers/greybus/control.c
@@ -436,7 +436,7 @@ static void gb_control_release(struct device *dev)
 	kfree(control);
 }
 
-struct device_type greybus_control_type = {
+const struct device_type greybus_control_type = {
 	.name =		"greybus_control",
 	.release =	gb_control_release,
 };
diff --git a/drivers/greybus/hd.c b/drivers/greybus/hd.c
index 72b21bf2d7d3..e2f3496bddc3 100644
--- a/drivers/greybus/hd.c
+++ b/drivers/greybus/hd.c
@@ -116,7 +116,7 @@ static void gb_hd_release(struct device *dev)
 	kfree(hd);
 }
 
-struct device_type greybus_hd_type = {
+const struct device_type greybus_hd_type = {
 	.name		= "greybus_host_device",
 	.release	= gb_hd_release,
 };
diff --git a/drivers/greybus/interface.c b/drivers/greybus/interface.c
index 9ec949a438ef..a88dc701289c 100644
--- a/drivers/greybus/interface.c
+++ b/drivers/greybus/interface.c
@@ -765,7 +765,7 @@ static const struct dev_pm_ops gb_interface_pm_ops = {
 			   gb_interface_runtime_idle)
 };
 
-struct device_type greybus_interface_type = {
+const struct device_type greybus_interface_type = {
 	.name =		"greybus_interface",
 	.release =	gb_interface_release,
 	.pm =		&gb_interface_pm_ops,
diff --git a/drivers/greybus/module.c b/drivers/greybus/module.c
index 36f77f9e1d74..7f7153a1dd60 100644
--- a/drivers/greybus/module.c
+++ b/drivers/greybus/module.c
@@ -81,7 +81,7 @@ static void gb_module_release(struct device *dev)
 	kfree(module);
 }
 
-struct device_type greybus_module_type = {
+const struct device_type greybus_module_type = {
 	.name		= "greybus_module",
 	.release	= gb_module_release,
 };
diff --git a/drivers/greybus/svc.c b/drivers/greybus/svc.c
index 0d7e749174a4..4256467fcd35 100644
--- a/drivers/greybus/svc.c
+++ b/drivers/greybus/svc.c
@@ -1305,7 +1305,7 @@ static void gb_svc_release(struct device *dev)
 	kfree(svc);
 }
 
-struct device_type greybus_svc_type = {
+const struct device_type greybus_svc_type = {
 	.name		= "greybus_svc",
 	.release	= gb_svc_release,
 };
diff --git a/include/linux/greybus.h b/include/linux/greybus.h
index 18c0fb958b74..5f9791fae3c0 100644
--- a/include/linux/greybus.h
+++ b/include/linux/greybus.h
@@ -106,12 +106,12 @@ struct dentry *gb_debugfs_get(void);
 
 extern struct bus_type greybus_bus_type;
 
-extern struct device_type greybus_hd_type;
-extern struct device_type greybus_module_type;
-extern struct device_type greybus_interface_type;
-extern struct device_type greybus_control_type;
-extern struct device_type greybus_bundle_type;
-extern struct device_type greybus_svc_type;
+extern const struct device_type greybus_hd_type;
+extern const struct device_type greybus_module_type;
+extern const struct device_type greybus_interface_type;
+extern const struct device_type greybus_control_type;
+extern const struct device_type greybus_bundle_type;
+extern const struct device_type greybus_svc_type;
 
 static inline int is_gb_host_device(const struct device *dev)
 {

---
base-commit: b401b621758e46812da61fa58a67c3fd8d91de0d
change-id: 20240219-device_cleanup-greybus-c97c1ef52458

Best regards,
-- 
Ricardo B. Marliere <ricardo@marliere.net>

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
