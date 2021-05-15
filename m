Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id D55693823DB
	for <lists+greybus-dev@lfdr.de>; Mon, 17 May 2021 07:56:48 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id C431060CFC
	for <lists+greybus-dev@lfdr.de>; Mon, 17 May 2021 05:56:46 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id DE6A960B8D; Mon, 17 May 2021 05:56:44 +0000 (UTC)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id D113060B82;
	Mon, 17 May 2021 05:56:41 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 97B8C61A3F
 for <greybus-dev@lists.linaro.org>; Sat, 15 May 2021 03:41:26 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 95B5B61A46; Sat, 15 May 2021 03:41:26 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by lists.linaro.org (Postfix) with ESMTPS id 909A761A3F
 for <greybus-dev@lists.linaro.org>; Sat, 15 May 2021 03:41:24 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id
 ep16-20020a17090ae650b029015d00f578a8so764055pjb.2
 for <greybus-dev@lists.linaro.org>; Fri, 14 May 2021 20:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ljG9oS+Y9DDy2qFTkHB7c25Na40O6djGYUjNa4ly9m4=;
 b=JpXkSEOTpY2wB+GpFOUxcoB4rttZ3iBxzftCur9r4nhabJfM2OhLp/1+Qt8GUNu848
 0KfPGgcjfLvH3O1FzEyHknjq5NXfNbJ4QRvRfkFh7iFlX8uY9QkRulFEoMZNpSzTYaq4
 vz9mHeGup1H61whSBsyYXIa4oQ48faHJUfufsklggb8WRThQjcfCQRnlHg2HArcDqU1R
 RQUn02tbjae5SjwDCY2Pjc/OibGeoW+0NKvT43nvc+SzQJS/5DOy7+BmOmuNHl6CSSZA
 xfbMduEVDS+246g3a/zfbPGK43ble8mUQEiVo68QeQ5Ts/M2iD282URrx1LayJK2aICM
 tGbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ljG9oS+Y9DDy2qFTkHB7c25Na40O6djGYUjNa4ly9m4=;
 b=buI4ZPkN6bsDZHjJ9muwxSqazMOfsw6o1HwfYHnYV+A369U4DYrq/6A0LRl9WSzvqG
 QHMvIOKcGgINtt/yy2nEuVw3s4iQJxsyCLxc80PjDHBa8ki62VGfzyX06mruqkAsaLqO
 Jcd4tLZww7xyz7mJu1myiN0UttFk1qhp+g1Vzt7Z+E/0bD+/FGvU/xEa48LV3bD/UIxl
 7n3hnuypGXR9jJabXSLWkq3awRfaTXKf2tl6X5SP5ABdXa1LxlUhivWJv4M6dWrFtWQ5
 tsvPfkOzjo/Zqhxl78v4Daihk8zZ/lnMauAWIFHfVsRq2ItMcKKUVKHloL/HQjvs3r6d
 jBYw==
X-Gm-Message-State: AOAM533Lh2CaNUoP+GbCuqI6LkbDkFeulVKrlt2SsToFoKzpPgINRv2z
 ws30kza1DttMXD4Psw9Zhy8=
X-Google-Smtp-Source: ABdhPJw6SxER/k+RVLDYG7obbuBdx20yQSWPf7vwHoH+puJyrrmQbb2K9s99KF/WuMXZYbMdFEJucg==
X-Received: by 2002:a17:90b:4ac2:: with SMTP id
 mh2mr13678260pjb.33.1621050083590; 
 Fri, 14 May 2021 20:41:23 -0700 (PDT)
Received: from fedora.. ([2405:201:6008:61b4:4e16:5348:d963:c66d])
 by smtp.googlemail.com with ESMTPSA id 21sm4895479pfh.103.2021.05.14.20.41.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 May 2021 20:41:23 -0700 (PDT)
From: Shreyansh Chouhan <chouhan.shreyansh630@gmail.com>
To: pure.logic@nexus-software.ie, johan@kernel.org, elder@kernel.org,
 gregkh@linuxfoundation.org
Date: Sat, 15 May 2021 09:11:16 +0530
Message-Id: <20210515034116.660895-1-chouhan.shreyansh630@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Mon, 17 May 2021 05:56:39 +0000
Subject: [greybus-dev] [PATCH] staging: greybus: add declare_ to declaring
 macros
X-BeenThere: greybus-dev@lists.linaro.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
List-Unsubscribe: <https://lists.linaro.org/mailman/options/greybus-dev>,
 <mailto:greybus-dev-request@lists.linaro.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/greybus-dev/>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Subscribe: <https://lists.linaro.org/mailman/listinfo/greybus-dev>,
 <mailto:greybus-dev-request@lists.linaro.org?subject=subscribe>
Cc: greybus-dev@lists.linaro.org,
 Shreyansh Chouhan <chouhan.shreyansh630@gmail.com>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: greybus-dev-bounces@lists.linaro.org
Sender: "greybus-dev" <greybus-dev-bounces@lists.linaro.org>
X-Virus-Scanned: ClamAV using ClamSMTP

Prefixed the names of all the macros that were used for declaring things
with 'declare_'. This should help with clarifying about what these
macros do.

Signed-off-by: Shreyansh Chouhan <chouhan.shreyansh630@gmail.com>
---
 drivers/staging/greybus/loopback.c | 56 +++++++++++++++---------------
 1 file changed, 28 insertions(+), 28 deletions(-)

diff --git a/drivers/staging/greybus/loopback.c b/drivers/staging/greybus/loopback.c
index 2471448ba42a..ddbeb33fa3c1 100644
--- a/drivers/staging/greybus/loopback.c
+++ b/drivers/staging/greybus/loopback.c
@@ -119,7 +119,7 @@ module_param(kfifo_depth, uint, 0444);
 #define GB_LOOPBACK_US_WAIT_MAX				1000000
 
 /* interface sysfs attributes */
-#define gb_loopback_ro_attr(field)				\
+#define declare_gb_loopback_ro_attr(field)				\
 static ssize_t field##_show(struct device *dev,			\
 			    struct device_attribute *attr,		\
 			    char *buf)					\
@@ -129,7 +129,7 @@ static ssize_t field##_show(struct device *dev,			\
 }									\
 static DEVICE_ATTR_RO(field)
 
-#define gb_loopback_ro_stats_attr(name, field, type)		\
+#define declare_gb_loopback_ro_stats_attr(name, field, type)		\
 static ssize_t name##_##field##_show(struct device *dev,	\
 			    struct device_attribute *attr,		\
 			    char *buf)					\
@@ -142,7 +142,7 @@ static ssize_t name##_##field##_show(struct device *dev,	\
 }									\
 static DEVICE_ATTR_RO(name##_##field)
 
-#define gb_loopback_ro_avg_attr(name)			\
+#define declare_gb_loopback_ro_avg_attr(name)			\
 static ssize_t name##_avg_show(struct device *dev,		\
 			    struct device_attribute *attr,		\
 			    char *buf)					\
@@ -162,12 +162,12 @@ static ssize_t name##_avg_show(struct device *dev,		\
 }									\
 static DEVICE_ATTR_RO(name##_avg)
 
-#define gb_loopback_stats_attrs(field)				\
-	gb_loopback_ro_stats_attr(field, min, u);		\
-	gb_loopback_ro_stats_attr(field, max, u);		\
-	gb_loopback_ro_avg_attr(field)
+#define declare_gb_loopback_stats_attrs(field)				\
+	declare_gb_loopback_ro_stats_attr(field, min, u);		\
+	declare_gb_loopback_ro_stats_attr(field, max, u);		\
+	declare_gb_loopback_ro_avg_attr(field)
 
-#define gb_loopback_attr(field, type)					\
+#define declare_gb_loopback_attr(field, type)				\
 static ssize_t field##_show(struct device *dev,				\
 			    struct device_attribute *attr,		\
 			    char *buf)					\
@@ -193,7 +193,7 @@ static ssize_t field##_store(struct device *dev,			\
 }									\
 static DEVICE_ATTR_RW(field)
 
-#define gb_dev_loopback_ro_attr(field, conn)				\
+#define declare_gb_dev_loopback_ro_attr(field, conn)			\
 static ssize_t field##_show(struct device *dev,		\
 			    struct device_attribute *attr,		\
 			    char *buf)					\
@@ -203,7 +203,7 @@ static ssize_t field##_show(struct device *dev,		\
 }									\
 static DEVICE_ATTR_RO(field)
 
-#define gb_dev_loopback_rw_attr(field, type)				\
+#define declare_gb_dev_loopback_rw_attr(field, type)			\
 static ssize_t field##_show(struct device *dev,				\
 			    struct device_attribute *attr,		\
 			    char *buf)					\
@@ -268,26 +268,26 @@ static void gb_loopback_check_attr(struct gb_loopback *gb)
 }
 
 /* Time to send and receive one message */
-gb_loopback_stats_attrs(latency);
+declare_gb_loopback_stats_attrs(latency);
 /* Number of requests sent per second on this cport */
-gb_loopback_stats_attrs(requests_per_second);
+declare_gb_loopback_stats_attrs(requests_per_second);
 /* Quantity of data sent and received on this cport */
-gb_loopback_stats_attrs(throughput);
+declare_gb_loopback_stats_attrs(throughput);
 /* Latency across the UniPro link from APBridge's perspective */
-gb_loopback_stats_attrs(apbridge_unipro_latency);
+declare_gb_loopback_stats_attrs(apbridge_unipro_latency);
 /* Firmware induced overhead in the GPBridge */
-gb_loopback_stats_attrs(gbphy_firmware_latency);
+declare_gb_loopback_stats_attrs(gbphy_firmware_latency);
 
 /* Number of errors encountered during loop */
-gb_loopback_ro_attr(error);
+declare_gb_loopback_ro_attr(error);
 /* Number of requests successfully completed async */
-gb_loopback_ro_attr(requests_completed);
+declare_gb_loopback_ro_attr(requests_completed);
 /* Number of requests timed out async */
-gb_loopback_ro_attr(requests_timedout);
+declare_gb_loopback_ro_attr(requests_timedout);
 /* Timeout minimum in useconds */
-gb_loopback_ro_attr(timeout_min);
+declare_gb_loopback_ro_attr(timeout_min);
 /* Timeout minimum in useconds */
-gb_loopback_ro_attr(timeout_max);
+declare_gb_loopback_ro_attr(timeout_max);
 
 /*
  * Type of loopback message to send based on protocol type definitions
@@ -297,21 +297,21 @@ gb_loopback_ro_attr(timeout_max);
  *					   payload returned in response)
  * 4 => Send a sink message (message with payload, no payload in response)
  */
-gb_dev_loopback_rw_attr(type, d);
+declare_gb_dev_loopback_rw_attr(type, d);
 /* Size of transfer message payload: 0-4096 bytes */
-gb_dev_loopback_rw_attr(size, u);
+declare_gb_dev_loopback_rw_attr(size, u);
 /* Time to wait between two messages: 0-1000 ms */
-gb_dev_loopback_rw_attr(us_wait, d);
+declare_gb_dev_loopback_rw_attr(us_wait, d);
 /* Maximum iterations for a given operation: 1-(2^32-1), 0 implies infinite */
-gb_dev_loopback_rw_attr(iteration_max, u);
+declare_gb_dev_loopback_rw_attr(iteration_max, u);
 /* The current index of the for (i = 0; i < iteration_max; i++) loop */
-gb_dev_loopback_ro_attr(iteration_count, false);
+declare_gb_dev_loopback_ro_attr(iteration_count, false);
 /* A flag to indicate synchronous or asynchronous operations */
-gb_dev_loopback_rw_attr(async, u);
+declare_gb_dev_loopback_rw_attr(async, u);
 /* Timeout of an individual asynchronous request */
-gb_dev_loopback_rw_attr(timeout, u);
+declare_gb_dev_loopback_rw_attr(timeout, u);
 /* Maximum number of in-flight operations before back-off */
-gb_dev_loopback_rw_attr(outstanding_operations_max, u);
+declare_gb_dev_loopback_rw_attr(outstanding_operations_max, u);
 
 static struct attribute *loopback_attrs[] = {
 	&dev_attr_latency_min.attr,
-- 
2.31.1

_______________________________________________
greybus-dev mailing list
greybus-dev@lists.linaro.org
https://lists.linaro.org/mailman/listinfo/greybus-dev
