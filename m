Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id A0F2887D3F0
	for <lists+greybus-dev@lfdr.de>; Fri, 15 Mar 2024 19:50:02 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id ABBBE451F0
	for <lists+greybus-dev@lfdr.de>; Fri, 15 Mar 2024 18:50:01 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	by lists.linaro.org (Postfix) with ESMTPS id 88027447A6
	for <greybus-dev@lists.linaro.org>; Fri, 15 Mar 2024 18:49:54 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=LpBJuu9F;
	spf=pass (lists.linaro.org: domain of ayushdevel1325@gmail.com designates 209.85.215.182 as permitted sender) smtp.mailfrom=ayushdevel1325@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-5dbcfa0eb5dso1969584a12.3
        for <greybus-dev@lists.linaro.org>; Fri, 15 Mar 2024 11:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710528594; x=1711133394; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zcNxWNH5QzToDPbBOtHvsfB896+SEBZGOEHaE/ifDKQ=;
        b=LpBJuu9F8IoonroFmEB/R2Aew4b18laR9X4j5OjkKvRGJlp/3oL8QEPcO9w3aShR4B
         fkDmhlxk9ooxAzXeGYMYIceJF5zDYhfUf4vnMtpDRpaTwWXQ0vQTdZmj9PRjjqjol5iK
         hK6wHh+ATUElZp463mynnkF65fHTOLzrdm7QzPtBt/obKX08UCDNbFCqo8CBqeMFCjUf
         ZLOyuf6Q5/KjE6LE94IMPoEVplFivDVEC/kzXUPTdsVZmJ/3cwEZc429gevlg8o1LXnF
         oEAs4FSowIyip/TsI7hCr4n8TGOhjhck4gUW+nSs94FUCmsM96zeAS/eTTVHP4a0+NKg
         RnUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710528594; x=1711133394;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zcNxWNH5QzToDPbBOtHvsfB896+SEBZGOEHaE/ifDKQ=;
        b=PZqYDpRa8vUcuUaImOXqWT57tiLXDNF+SgDjlLjhyVsq8Zsvy4D2iDYSuApIbWQrHL
         F1NtwiN3ePXf6T9Ti/ZVhuSuntBgDhTDtEuxadQwzGiOvwGIpdp7H+Q8MoAMUxWD2D2u
         94wGRo6qPvE/yyDyNRhmsy3P7N6UgX13XDhyXBLASMunQTJb1A89pyEDz2KBnK+ne4DK
         Ca3aO691V6hWvzA17QOp0lxAT7r4QfTTTArX2DrpbLoZQBruKF9nH6FGPxmAk6y/TCsP
         3hsb5WNYnsjn3+3n+2lZCOkE0IvfRwoQqxW5o6qnPaedlxkcl1ze5kSzvrnmpq5AC2MP
         Ee/A==
X-Forwarded-Encrypted: i=1; AJvYcCU/dgIC5pwekhbkpXxfgWjj2kH6l85AcDcEeKfLjXH4Ok75KMQrfDGHWzvYsHg2njD5JJA+en67sZpzD70fcFNnCJSfkRBNOzWz0JMZ
X-Gm-Message-State: AOJu0YxMFf1F3MOQ0pXDTDodKgxLU6sneNTYP+ETCLLFfpPLbMPNqMRb
	yGT65NJfVAULaIKYpWBR+ChfYCfUnBYQtVT/1uz83w5vZvFjnh0K
X-Google-Smtp-Source: AGHT+IFUoqWC1HtQxdY7BvPQs9oM6UO/StxnSTV9tWAOOYsTsEYNfXK17Rt3JHJT1PSBQMF68CAHlw==
X-Received: by 2002:a05:6a20:9f95:b0:1a3:51fc:a62d with SMTP id mm21-20020a056a209f9500b001a351fca62dmr2182876pzb.26.1710528593624;
        Fri, 15 Mar 2024 11:49:53 -0700 (PDT)
Received: from toolbox.iitism.net ([103.15.228.94])
        by smtp.gmail.com with ESMTPSA id f17-20020a056a0022d100b006e6cc998be8sm3580784pfj.207.2024.03.15.11.49.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Mar 2024 11:49:53 -0700 (PDT)
From: Ayush Singh <ayushdevel1325@gmail.com>
To: linux-kernel@vger.kernel.org
Date: Sat, 16 Mar 2024 00:19:01 +0530
Message-ID: <20240315184908.500352-4-ayushdevel1325@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240315184908.500352-1-ayushdevel1325@gmail.com>
References: <20240315184908.500352-1-ayushdevel1325@gmail.com>
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 88027447A6
X-Spamd-Bar: -----
X-Spamd-Result: default: False [-5.10 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.215.182:from];
	TO_DN_SOME(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[25];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,beagleboard.org,kernel.org,linaro.org,ti.com,amd.com,arndb.de,linuxfoundation.org,vger.kernel.org,lists.infradead.org,lists.linaro.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	TAGGED_RCPT(0.00)[dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
Message-ID-Hash: XTKINBKDSKZVTZDQO6CBRW2RZ4ZBQFZR
X-Message-ID-Hash: XTKINBKDSKZVTZDQO6CBRW2RZ4ZBQFZR
X-MailFrom: ayushdevel1325@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Ayush Singh <ayushdevel1325@gmail.com>, robertcnelson@beagleboard.org, Vaishnav M A <vaishnav@beagleboard.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, Derek Kiernan <derek.kiernan@amd.com>, Dragan Cvetic <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jiri Slaby <jirislaby@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org, linux-serial@vger.kernel.org, greybus-dev@lists.linaro.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v3 3/8] spi: Make of_find_spi_controller_by_node() available
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/XTKINBKDSKZVTZDQO6CBRW2RZ4ZBQFZR/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This externalizes and exports the symbol
of_find_spi_controller_by_node() from the SPI core akin to how
of_find_i2c_adapter_by_node() is already available. As we will
need this also for non-dynamic OF setups, we move it under a
CONFIG_OF check.

Signed-off-by: Ayush Singh <ayushdevel1325@gmail.com>
---
 drivers/spi/spi.c       | 206 ++++++++++++++++++++--------------------
 include/linux/spi/spi.h |   4 +
 2 files changed, 108 insertions(+), 102 deletions(-)

diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
index ba4d3fde2054..9ec507d92f80 100644
--- a/drivers/spi/spi.c
+++ b/drivers/spi/spi.c
@@ -2320,6 +2320,93 @@ void spi_flush_queue(struct spi_controller *ctlr)
 
 /*-------------------------------------------------------------------------*/
 
+static void spi_controller_release(struct device *dev)
+{
+	struct spi_controller *ctlr;
+
+	ctlr = container_of(dev, struct spi_controller, dev);
+	kfree(ctlr);
+}
+
+static struct class spi_master_class = {
+	.name		= "spi_master",
+	.dev_release	= spi_controller_release,
+	.dev_groups	= spi_master_groups,
+};
+
+static ssize_t slave_show(struct device *dev, struct device_attribute *attr,
+			  char *buf)
+{
+	struct spi_controller *ctlr = container_of(dev, struct spi_controller,
+						   dev);
+	struct device *child;
+
+	child = device_find_any_child(&ctlr->dev);
+	return sysfs_emit(buf, "%s\n", child ? to_spi_device(child)->modalias : NULL);
+}
+
+static ssize_t slave_store(struct device *dev, struct device_attribute *attr,
+			   const char *buf, size_t count)
+{
+	struct spi_controller *ctlr = container_of(dev, struct spi_controller,
+						   dev);
+	struct spi_device *spi;
+	struct device *child;
+	char name[32];
+	int rc;
+
+	rc = sscanf(buf, "%31s", name);
+	if (rc != 1 || !name[0])
+		return -EINVAL;
+
+	child = device_find_any_child(&ctlr->dev);
+	if (child) {
+		/* Remove registered slave */
+		device_unregister(child);
+		put_device(child);
+	}
+
+	if (strcmp(name, "(null)")) {
+		/* Register new slave */
+		spi = spi_alloc_device(ctlr);
+		if (!spi)
+			return -ENOMEM;
+
+		strscpy(spi->modalias, name, sizeof(spi->modalias));
+
+		rc = spi_add_device(spi);
+		if (rc) {
+			spi_dev_put(spi);
+			return rc;
+		}
+	}
+
+	return count;
+}
+
+static DEVICE_ATTR_RW(slave);
+
+static struct attribute *spi_slave_attrs[] = {
+	&dev_attr_slave.attr,
+	NULL,
+};
+
+static const struct attribute_group spi_slave_group = {
+	.attrs = spi_slave_attrs,
+};
+
+static const struct attribute_group *spi_slave_groups[] = {
+	&spi_controller_statistics_group,
+	&spi_slave_group,
+	NULL,
+};
+
+static struct class spi_slave_class = {
+	.name		= "spi_slave",
+	.dev_release	= spi_controller_release,
+	.dev_groups	= spi_slave_groups,
+};
+
 #if defined(CONFIG_OF)
 static void of_spi_parse_dt_cs_delay(struct device_node *nc,
 				     struct spi_delay *delay, const char *prop)
@@ -2543,6 +2630,23 @@ static void of_register_spi_devices(struct spi_controller *ctlr)
 		}
 	}
 }
+
+/* The spi controllers are not using spi_bus, so we find it with another way */
+struct spi_controller *of_find_spi_controller_by_node(struct device_node *node)
+{
+	struct device *dev;
+
+	dev = class_find_device_by_of_node(&spi_master_class, node);
+	if (!dev && IS_ENABLED(CONFIG_SPI_SLAVE))
+		dev = class_find_device_by_of_node(&spi_slave_class, node);
+	if (!dev)
+		return NULL;
+
+	/* Reference got in class_find_device */
+	return container_of(dev, struct spi_controller, dev);
+}
+EXPORT_SYMBOL_GPL(of_find_spi_controller_by_node);
+
 #else
 static void of_register_spi_devices(struct spi_controller *ctlr) { }
 #endif
@@ -2942,20 +3046,6 @@ static void acpi_register_spi_devices(struct spi_controller *ctlr)
 static inline void acpi_register_spi_devices(struct spi_controller *ctlr) {}
 #endif /* CONFIG_ACPI */
 
-static void spi_controller_release(struct device *dev)
-{
-	struct spi_controller *ctlr;
-
-	ctlr = container_of(dev, struct spi_controller, dev);
-	kfree(ctlr);
-}
-
-static struct class spi_master_class = {
-	.name		= "spi_master",
-	.dev_release	= spi_controller_release,
-	.dev_groups	= spi_master_groups,
-};
-
 #ifdef CONFIG_SPI_SLAVE
 /**
  * spi_slave_abort - abort the ongoing transfer request on an SPI slave
@@ -2983,79 +3073,6 @@ int spi_target_abort(struct spi_device *spi)
 	return -ENOTSUPP;
 }
 EXPORT_SYMBOL_GPL(spi_target_abort);
-
-static ssize_t slave_show(struct device *dev, struct device_attribute *attr,
-			  char *buf)
-{
-	struct spi_controller *ctlr = container_of(dev, struct spi_controller,
-						   dev);
-	struct device *child;
-
-	child = device_find_any_child(&ctlr->dev);
-	return sysfs_emit(buf, "%s\n", child ? to_spi_device(child)->modalias : NULL);
-}
-
-static ssize_t slave_store(struct device *dev, struct device_attribute *attr,
-			   const char *buf, size_t count)
-{
-	struct spi_controller *ctlr = container_of(dev, struct spi_controller,
-						   dev);
-	struct spi_device *spi;
-	struct device *child;
-	char name[32];
-	int rc;
-
-	rc = sscanf(buf, "%31s", name);
-	if (rc != 1 || !name[0])
-		return -EINVAL;
-
-	child = device_find_any_child(&ctlr->dev);
-	if (child) {
-		/* Remove registered slave */
-		device_unregister(child);
-		put_device(child);
-	}
-
-	if (strcmp(name, "(null)")) {
-		/* Register new slave */
-		spi = spi_alloc_device(ctlr);
-		if (!spi)
-			return -ENOMEM;
-
-		strscpy(spi->modalias, name, sizeof(spi->modalias));
-
-		rc = spi_add_device(spi);
-		if (rc) {
-			spi_dev_put(spi);
-			return rc;
-		}
-	}
-
-	return count;
-}
-
-static DEVICE_ATTR_RW(slave);
-
-static struct attribute *spi_slave_attrs[] = {
-	&dev_attr_slave.attr,
-	NULL,
-};
-
-static const struct attribute_group spi_slave_group = {
-	.attrs = spi_slave_attrs,
-};
-
-static const struct attribute_group *spi_slave_groups[] = {
-	&spi_controller_statistics_group,
-	&spi_slave_group,
-	NULL,
-};
-
-static struct class spi_slave_class = {
-	.name		= "spi_slave",
-	.dev_release	= spi_controller_release,
-	.dev_groups	= spi_slave_groups,
-};
 #else
 extern struct class spi_slave_class;	/* dummy */
 #endif
@@ -4749,21 +4766,6 @@ static struct spi_device *of_find_spi_device_by_node(struct device_node *node)
 	return dev ? to_spi_device(dev) : NULL;
 }
 
-/* The spi controllers are not using spi_bus, so we find it with another way */
-static struct spi_controller *of_find_spi_controller_by_node(struct device_node *node)
-{
-	struct device *dev;
-
-	dev = class_find_device_by_of_node(&spi_master_class, node);
-	if (!dev && IS_ENABLED(CONFIG_SPI_SLAVE))
-		dev = class_find_device_by_of_node(&spi_slave_class, node);
-	if (!dev)
-		return NULL;
-
-	/* Reference got in class_find_device */
-	return container_of(dev, struct spi_controller, dev);
-}
-
 static int of_spi_notify(struct notifier_block *nb, unsigned long action,
 			 void *arg)
 {
diff --git a/include/linux/spi/spi.h b/include/linux/spi/spi.h
index e400d454b3f0..f6fb7bad9a90 100644
--- a/include/linux/spi/spi.h
+++ b/include/linux/spi/spi.h
@@ -1684,4 +1684,8 @@ spi_transfer_is_last(struct spi_controller *ctlr, struct spi_transfer *xfer)
 	return list_is_last(&xfer->transfer_list, &ctlr->cur_msg->transfers);
 }
 
+#if IS_ENABLED(CONFIG_OF)
+struct spi_controller *of_find_spi_controller_by_node(struct device_node *node);
+#endif
+
 #endif /* __LINUX_SPI_H */
-- 
2.44.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
