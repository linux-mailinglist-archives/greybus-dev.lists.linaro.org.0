Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id D7BE787D3F1
	for <lists+greybus-dev@lfdr.de>; Fri, 15 Mar 2024 19:50:09 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id EA755451F0
	for <lists+greybus-dev@lfdr.de>; Fri, 15 Mar 2024 18:50:08 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	by lists.linaro.org (Postfix) with ESMTPS id 42493451F0
	for <greybus-dev@lists.linaro.org>; Fri, 15 Mar 2024 18:50:03 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=UUlwsDe2;
	spf=pass (lists.linaro.org: domain of ayushdevel1325@gmail.com designates 209.85.210.174 as permitted sender) smtp.mailfrom=ayushdevel1325@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-6e6f6825102so1114353b3a.1
        for <greybus-dev@lists.linaro.org>; Fri, 15 Mar 2024 11:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710528602; x=1711133402; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aRqivYuE7DcmOFFhwyqSkRwN4XtrqdDpfy8FtThn+Dk=;
        b=UUlwsDe298JqQf7CZEa6rVNMJ17WUbmkFWFW+CzpWWt5N+avyhoHWcJpmb7LduxOMy
         rLBTVbHHSqEK7eU9yMVySS/gtrVbl0qaWAmcz0sD9a2sfL7LAn4lhiaZ+oKZI749v9ks
         PZ6b2VTsnawDOBU5pFlh5AIujn3KnKslXoasV+1nqjOudM0Itd6AhHN+ZaKBA+4ZI/Ej
         l1g77jG1xGrD0srCiQGb51OLXBjYedrWO+OpgdeOEKfWYiqJalD3Rln1jHos57b24/m4
         DDx560gjYSDPx3viNZa/G0DUypTj3KT47CKd2zeHKhJds9F0VvwjuVxI9J/OonmH3Bs5
         pHqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710528602; x=1711133402;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aRqivYuE7DcmOFFhwyqSkRwN4XtrqdDpfy8FtThn+Dk=;
        b=e99HpxTMva9Ous97FxYxK7V/2E44hEzPTPlr7NqQDsJxofxcI03D0w2hRtYS0RVh2h
         AiOyMZG8IhJ/fkNTEWFuCqU6m4noFdrk7JVG2oRhTnDqlgbhc4C7Okren/A0pxfrkiz4
         cfIdfSP6dv6cdh25oYPvclaCOPpB0RMfWwI06Rl709OUWsbAz5zpq3JAg0IDa0CldoCe
         Vitv0MGt/OgG0G381Mafo0xJaPGpDx5NERT97BDB2Wh8U94+LaED68zIT5a1eoIi4kBF
         5u0cCy/f+QO3e4beWN7l+8reTbpjxasCiQ81IMqm9FMC70skLytyMEKxoFOT1rZcYCuu
         Hrwg==
X-Forwarded-Encrypted: i=1; AJvYcCWsoFK2DrbOTsKz0XFUJA5lfgdJLf6rp1l7E3HLLCnpfepyrzGEezRjU/zRpagyyK8FFFlvW+ASCnm7t0tcx/hOf98SmCXW8/NEk5ID
X-Gm-Message-State: AOJu0YxY7vTMu4zjMPTb2ADJxLRE92JK2eFpWQcdETl8LDTMkyzwXBEE
	s+pl8UpXy7vQlkTcWxVqOUfeDqEjGegYL7wpwX9i6GNMlSbMRChz
X-Google-Smtp-Source: AGHT+IHQbXiA7SVlIsgBVryvm0PGS1QFL0t3DlqmYIaIG83GvhramGbGJdZlO3EHZsPjHP3Bdwk5+g==
X-Received: by 2002:a05:6a20:7d9c:b0:1a3:53a0:da1f with SMTP id v28-20020a056a207d9c00b001a353a0da1fmr1195976pzj.12.1710528602430;
        Fri, 15 Mar 2024 11:50:02 -0700 (PDT)
Received: from toolbox.iitism.net ([103.15.228.94])
        by smtp.gmail.com with ESMTPSA id f17-20020a056a0022d100b006e6cc998be8sm3580784pfj.207.2024.03.15.11.49.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Mar 2024 11:50:02 -0700 (PDT)
From: Ayush Singh <ayushdevel1325@gmail.com>
To: linux-kernel@vger.kernel.org
Date: Sat, 16 Mar 2024 00:19:02 +0530
Message-ID: <20240315184908.500352-5-ayushdevel1325@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240315184908.500352-1-ayushdevel1325@gmail.com>
References: <20240315184908.500352-1-ayushdevel1325@gmail.com>
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 42493451F0
X-Spamd-Bar: -----
X-Spamd-Result: default: False [-5.10 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.210.174:from];
	MIME_GOOD(-0.10)[text/plain];
	FROM_EQ_ENVFROM(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	URIBL_BLOCKED(0.00)[beagleboard.org:email];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[25];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_TLS_LAST(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dt];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[gmail.com:+];
	FREEMAIL_CC(0.00)[beagleboard.org,kernel.org,linaro.org,ti.com,amd.com,arndb.de,linuxfoundation.org,gmail.com,vger.kernel.org,lists.infradead.org,lists.linaro.org];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[]
Message-ID-Hash: 7SVVXCICSUCDZ7ZJN3HCVLWGSDKCE6RB
X-Message-ID-Hash: 7SVVXCICSUCDZ7ZJN3HCVLWGSDKCE6RB
X-MailFrom: ayushdevel1325@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Vaishnav M A <vaishnav@beagleboard.org>, robertcnelson@beagleboard.org, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, Derek Kiernan <derek.kiernan@amd.com>, Dragan Cvetic <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jiri Slaby <jirislaby@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org, linux-serial@vger.kernel.org, greybus-dev@lists.linaro.org, Ayush Singh <ayushdevel1325@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v3 4/8] serdev: add of_ helper to get serdev controller
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/7SVVXCICSUCDZ7ZJN3HCVLWGSDKCE6RB/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Vaishnav M A <vaishnav@beagleboard.org>

add of_find_serdev_controller_by_node to obtain a
serdev_controller from the device_node, which
can help if the serdev_device is not described
over device tree and instantiation of the device
happens from a different driver, for the same purpose
an option to not delete an empty serdev controller
is added.

Signed-off-by: Vaishnav M A <vaishnav@beagleboard.org>
Signed-off-by: Ayush Singh <ayushdevel1325@gmail.com>
---
 drivers/tty/serdev/core.c | 19 +++++++++++++++++++
 include/linux/serdev.h    |  4 ++++
 2 files changed, 23 insertions(+)

diff --git a/drivers/tty/serdev/core.c b/drivers/tty/serdev/core.c
index 613cb356b918..5b5b3f2b2e42 100644
--- a/drivers/tty/serdev/core.c
+++ b/drivers/tty/serdev/core.c
@@ -555,6 +555,19 @@ static int of_serdev_register_devices(struct serdev_controller *ctrl)
 	return 0;
 }
 
+#if defined(CONFIG_OF)
+struct serdev_controller *of_find_serdev_controller_by_node(struct device_node *node)
+{
+	struct device *dev = bus_find_device_by_of_node(&serdev_bus_type, node);
+
+	if (!dev)
+		return NULL;
+
+	return (dev->type == &serdev_ctrl_type) ? to_serdev_controller(dev) : NULL;
+}
+EXPORT_SYMBOL_GPL(of_find_serdev_controller_by_node);
+#endif
+
 #ifdef CONFIG_ACPI
 
 #define SERDEV_ACPI_MAX_SCAN_DEPTH 32
@@ -785,6 +798,12 @@ int serdev_controller_add(struct serdev_controller *ctrl)
 
 	pm_runtime_enable(&ctrl->dev);
 
+	/* provide option to not delete a serdev controller without devices
+	 * if property is present
+	 */
+	if (device_property_present(&ctrl->dev, "force-empty-serdev-controller"))
+		return 0;
+
 	ret_of = of_serdev_register_devices(ctrl);
 	ret_acpi = acpi_serdev_register_devices(ctrl);
 	if (ret_of && ret_acpi) {
diff --git a/include/linux/serdev.h b/include/linux/serdev.h
index ff78efc1f60d..287d7b9bc10a 100644
--- a/include/linux/serdev.h
+++ b/include/linux/serdev.h
@@ -117,6 +117,10 @@ static inline struct serdev_controller *to_serdev_controller(struct device *d)
 	return container_of(d, struct serdev_controller, dev);
 }
 
+#if defined(CONFIG_OF)
+struct serdev_controller *of_find_serdev_controller_by_node(struct device_node *node);
+#endif
+
 static inline void *serdev_device_get_drvdata(const struct serdev_device *serdev)
 {
 	return dev_get_drvdata(&serdev->dev);
-- 
2.44.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
