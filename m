Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id AA34BA771A4
	for <lists+greybus-dev@lfdr.de>; Tue,  1 Apr 2025 02:01:36 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id BCF7E44860
	for <lists+greybus-dev@lfdr.de>; Tue,  1 Apr 2025 00:01:35 +0000 (UTC)
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
	by lists.linaro.org (Postfix) with ESMTPS id 8456644331
	for <greybus-dev@lists.linaro.org>; Mon, 31 Mar 2025 21:39:52 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=g5t8CW1P;
	spf=pass (lists.linaro.org: domain of ganeshkpittala@gmail.com designates 209.85.222.196 as permitted sender) smtp.mailfrom=ganeshkpittala@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-qk1-f196.google.com with SMTP id af79cd13be357-7c5b2472969so499287985a.1
        for <greybus-dev@lists.linaro.org>; Mon, 31 Mar 2025 14:39:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743457192; x=1744061992; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7tEJ1wFPm3jkVhALABWguqUU8xeCdgYsuDfWLA4x5WU=;
        b=g5t8CW1PUyEdrd8G4oVPWIEkr5jjUcdOXm/d9qBkIEXIdi3m7mlJNLF16yhkHL0+IH
         0VjwW+kBRwa9wKh0TBjEau49QneyoPlYyitMujLCDJQ84BypSOxCEr1ihglegUJM9oob
         myCkQS3swL8gVj7YFWyBxDCIt1ZPBj6SBPmySlp9uusfHu4aT/QVqfhIaOYY9ZowKuE2
         W9XVx6azP9O8J5Vmx37jxGVPdSWOcnTGdnvgLM590ydsins5mXy6s9xly830GEEvRFcg
         m8rTZVuVyjFXZAK8dFkDxqWeIWtl0MoWEeSIEi+w+OQJBpe1sLetOAOA+Vx+dy84UYyB
         5hOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743457192; x=1744061992;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7tEJ1wFPm3jkVhALABWguqUU8xeCdgYsuDfWLA4x5WU=;
        b=KkB++wWqDA7UDmdfRqN95Z48tqZYDxuG6HnFSiS05EIXD6qaLuqHXXhi/z1vF0JFjc
         dhwXr/gLZI8qGsI4LpwkKG7e92zPUDpd6kuFYgJqiS1FXcC3uGCSGebabqFCjI5huRfs
         0ml1F8I3qkFesnLNE7QexHn9O/iXmc01WUxvC74iUlHKfXZGM6pW8/947zQ7Z9LdiG8F
         paLwNEy2Ik8VhhzUHQfTtQSENprTws93clJ9t/ORiDVYUfwDUNqiwyKRYzF7qmoE87Hz
         fDk46vVedySNpD/3z/CV7OrfSWUxMdjzzKHiCRXRv1PGr0Iy3I+1AaGwqGJp0KazmsiP
         rjQw==
X-Forwarded-Encrypted: i=1; AJvYcCWv9UIkpyjl7kUP0ZYZ83tMYj/U7XMhXB7gPIAeayXH3DBM2nnqNi6XnLW/ELM4s1aNnAqWG7MyYFQqAQ==@lists.linaro.org
X-Gm-Message-State: AOJu0Yy+eGCBIQAY1TC0Bvfh/XTtSNzuCs+UDfIUayjAi2CvQYKLvBrz
	z7IM6cdxBH7OQ9POcEaGazwjInF9kwSubOHPZJD6b4wssf7mOblVJ72B9GxglFjfdQ==
X-Gm-Gg: ASbGncsvAJNb0Dr675qywh/rq/LADy7/XHyIzIgg5INza+/Ag2pn/F5Kmhs/ZCIeskb
	Zhymryg+syO3PxuPOrqAV2lC5kn6Pais1t16rlxK4F0e+PZjOnJ1bbUrSRzm86sngVH3yiZyFcF
	0FJOQghq3EIpHG9ii4/88RAxMLYzyZlOJJUS0Py9StMGgeEEFJYXShPQXOs4TX8xdY2EpPV/E5/
	GvoilWfbf/BqT1NjJuk/gmIKawsn4eJTcMef60WM3shb9VAeSUSXhPOjdDOnHdEnXah/gZXJLzC
	pux3Aj1yivRfn6WCZd+wgWi1T+mMj5tzvlGVLwK7RAshDV6PB7bPxPNN+f74/C5HWe2xoLZ0l7U
	mCDL0S5L51mK0JMp0l1mrcw==
X-Google-Smtp-Source: AGHT+IEFxalrJlq0+JMFGrsZjGtwnzd/nNhPXdgkAW1KvbTlhxj3uTDPqBntpYHL3YNJMNpvUi7mEg==
X-Received: by 2002:a05:620a:1929:b0:7c5:6ba5:dd65 with SMTP id af79cd13be357-7c6908d3e9bmr1359435085a.55.1743456836165;
        Mon, 31 Mar 2025 14:33:56 -0700 (PDT)
Received: from UbuntuDev.. (syn-074-067-077-020.res.spectrum.com. [74.67.77.20])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c5f7682e57sm549849485a.39.2025.03.31.14.33.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 14:33:55 -0700 (PDT)
From: gpittala <ganeshkpittala@gmail.com>
To: johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org
Date: Mon, 31 Mar 2025 21:33:37 +0000
Message-ID: <20250331213337.6171-1-ganeshkpittala@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 8456644331
X-Spamd-Bar: ++
X-Spamd-Result: default: False [2.00 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	RBL_SENDERSCORE_REPUT_4(2.00)[209.85.222.196:from];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	FREEMAIL_CC(0.00)[gmail.com,animalcreek.com,nexus-software.ie,lists.linaro.org,lists.linux.dev,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_ALLOW(0.00)[gmail.com:s=20230601];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	DMARC_POLICY_ALLOW(0.00)[gmail.com,none];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	TO_DN_NONE(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	TAGGED_RCPT(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.244];
	R_SPF_ALLOW(0.00)[+ip4:209.85.128.0/17];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.222.196:from];
	FROM_HAS_DN(0.00)[]
X-Spam-Level: **
X-Rspamd-Action: no action
X-MailFrom: ganeshkpittala@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: ZQ27K5RHFHOQVAR7ZICNN5JUMRUZ5DMZ
X-Message-ID-Hash: ZQ27K5RHFHOQVAR7ZICNN5JUMRUZ5DMZ
X-Mailman-Approved-At: Tue, 01 Apr 2025 00:01:31 +0000
CC: hvaibhav.linux@gmail.com, pure.logic@nexus-software.ie, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, ganeshkpittala@gmail.com
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] staging: greybus: Multiple cleanups and refactors
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/ZQ27K5RHFHOQVAR7ZICNN5JUMRUZ5DMZ/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This patch includes multiple meaningful cleanups for the Greybus staging driver:

1. firmware.c: Replaced deprecated 'strncpy()' with 'strscpy()'
2. sysfs show functions: Replaced 'sprintf()' with 'sysfs_emit()'
3. loopback.c: Refactored a large function (gp_loopback_fn) to improve readability
4. audio_gb.c: Split logic in get_topology() into separate calls as per TODO

All changes are tested and pass checkpatch.pl

Signed-off-by: gpittala <ganeshkpittala@gmail.com>
---
 .../greybus/Documentation/firmware/firmware.c |  32 ++--
 drivers/staging/greybus/arche-apb-ctrl.c      |  11 +-
 drivers/staging/greybus/arche-platform.c      |  11 +-
 drivers/staging/greybus/audio_gb.c            |  37 +++-
 .../staging/greybus/audio_manager_module.c    |  13 +-
 drivers/staging/greybus/gbphy.c               |   3 +-
 drivers/staging/greybus/light.c               |   5 +-
 drivers/staging/greybus/loopback.c            | 170 ++++++++++--------
 8 files changed, 159 insertions(+), 123 deletions(-)

diff --git a/drivers/staging/greybus/Documentation/firmware/firmware.c b/drivers/staging/greybus/Documentation/firmware/firmware.c
index 765d69faa9cc..8e375c88c881 100644
--- a/drivers/staging/greybus/Documentation/firmware/firmware.c
+++ b/drivers/staging/greybus/Documentation/firmware/firmware.c
@@ -47,12 +47,12 @@ static int update_intf_firmware(int fd)
 	ret = ioctl(fd, FW_MGMT_IOC_GET_INTF_FW, &intf_fw_info);
 	if (ret < 0) {
 		printf("Failed to get interface firmware version: %s (%d)\n",
-			fwdev, ret);
+		       fwdev, ret);
 		return -1;
 	}
 
 	printf("Interface Firmware tag (%s), major (%d), minor (%d)\n",
-		intf_fw_info.firmware_tag, intf_fw_info.major,
+	       intf_fw_info.firmware_tag, intf_fw_info.major,
 		intf_fw_info.minor);
 
 	/* Try Interface Firmware load over Unipro */
@@ -63,25 +63,25 @@ static int update_intf_firmware(int fd)
 	intf_load.major = 0;
 	intf_load.minor = 0;
 
-	strncpy((char *)&intf_load.firmware_tag, firmware_tag,
+	strscpy((char *)&intf_load.firmware_tag, firmware_tag,
 		GB_FIRMWARE_U_TAG_MAX_SIZE);
 
 	ret = ioctl(fd, FW_MGMT_IOC_INTF_LOAD_AND_VALIDATE, &intf_load);
 	if (ret < 0) {
 		printf("Failed to load interface firmware: %s (%d)\n", fwdev,
-			ret);
+		       ret);
 		return -1;
 	}
 
 	if (intf_load.status != GB_FW_U_LOAD_STATUS_VALIDATED &&
 	    intf_load.status != GB_FW_U_LOAD_STATUS_UNVALIDATED) {
 		printf("Load status says loading failed: %d\n",
-			intf_load.status);
+		       intf_load.status);
 		return -1;
 	}
 
 	printf("Interface Firmware (%s) Load done: major: %d, minor: %d, status: %d\n",
-		firmware_tag, intf_load.major, intf_load.minor,
+	       firmware_tag, intf_load.major, intf_load.minor,
 		intf_load.status);
 
 	/* Initiate Mode-switch to the newly loaded firmware */
@@ -101,35 +101,35 @@ static int update_backend_firmware(int fd)
 	/* Get Backend Firmware Version */
 	printf("Getting Backend Firmware Version\n");
 
-	strncpy((char *)&backend_fw_info.firmware_tag, firmware_tag,
+	strscpy((char *)&backend_fw_info.firmware_tag, firmware_tag,
 		GB_FIRMWARE_U_TAG_MAX_SIZE);
 
 retry_fw_version:
 	ret = ioctl(fd, FW_MGMT_IOC_GET_BACKEND_FW, &backend_fw_info);
 	if (ret < 0) {
 		printf("Failed to get backend firmware version: %s (%d)\n",
-			fwdev, ret);
+		       fwdev, ret);
 		return -1;
 	}
 
 	printf("Backend Firmware tag (%s), major (%d), minor (%d), status (%d)\n",
-		backend_fw_info.firmware_tag, backend_fw_info.major,
+	       backend_fw_info.firmware_tag, backend_fw_info.major,
 		backend_fw_info.minor, backend_fw_info.status);
 
 	if (backend_fw_info.status == GB_FW_U_BACKEND_VERSION_STATUS_RETRY)
 		goto retry_fw_version;
 
-	if ((backend_fw_info.status != GB_FW_U_BACKEND_VERSION_STATUS_SUCCESS)
-	    && (backend_fw_info.status != GB_FW_U_BACKEND_VERSION_STATUS_NOT_AVAILABLE)) {
+	if ((backend_fw_info.status != GB_FW_U_BACKEND_VERSION_STATUS_SUCCESS) &&
+	    (backend_fw_info.status != GB_FW_U_BACKEND_VERSION_STATUS_NOT_AVAILABLE)) {
 		printf("Failed to get backend firmware version: %s (%d)\n",
-			fwdev, backend_fw_info.status);
+		       fwdev, backend_fw_info.status);
 		return -1;
 	}
 
 	/* Try Backend Firmware Update over Unipro */
 	printf("Updating Backend Firmware\n");
 
-	strncpy((char *)&backend_update.firmware_tag, firmware_tag,
+	strscpy((char *)&backend_update.firmware_tag, firmware_tag,
 		GB_FIRMWARE_U_TAG_MAX_SIZE);
 
 retry_fw_update:
@@ -148,10 +148,10 @@ static int update_backend_firmware(int fd)
 
 	if (backend_update.status != GB_FW_U_BACKEND_FW_STATUS_SUCCESS) {
 		printf("Load status says loading failed: %d\n",
-			backend_update.status);
+		       backend_update.status);
 	} else {
 		printf("Backend Firmware (%s) Load done: status: %d\n",
-				firmware_tag, backend_update.status);
+		       firmware_tag, backend_update.status);
 	}
 
 	return 0;
@@ -185,7 +185,7 @@ int main(int argc, char *argv[])
 		fw_timeout = strtoul(argv[4], &endptr, 10);
 
 	printf("Trying Firmware update: fwdev: %s, type: %s, tag: %s, timeout: %u\n",
-		fwdev, fw_update_type == 0 ? "interface" : "backend",
+	       fwdev, fw_update_type == 0 ? "interface" : "backend",
 		firmware_tag, fw_timeout);
 
 	printf("Opening %s firmware management device\n", fwdev);
diff --git a/drivers/staging/greybus/arche-apb-ctrl.c b/drivers/staging/greybus/arche-apb-ctrl.c
index 90ab32638d3f..9862188e8367 100644
--- a/drivers/staging/greybus/arche-apb-ctrl.c
+++ b/drivers/staging/greybus/arche-apb-ctrl.c
@@ -17,6 +17,7 @@
 #include <linux/pm.h>
 #include <linux/regulator/consumer.h>
 #include <linux/spinlock.h>
+#include <linux/sysfs.h>
 #include "arche_platform.h"
 
 static void apb_bootret_deassert(struct device *dev);
@@ -299,16 +300,16 @@ static ssize_t state_show(struct device *dev,
 
 	switch (apb->state) {
 	case ARCHE_PLATFORM_STATE_OFF:
-		return sprintf(buf, "off%s\n",
+		return sysfs_emit(buf, "off%s\n",
 				apb->init_disabled ? ",disabled" : "");
 	case ARCHE_PLATFORM_STATE_ACTIVE:
-		return sprintf(buf, "active\n");
+		return sysfs_emit(buf, "active\n");
 	case ARCHE_PLATFORM_STATE_STANDBY:
-		return sprintf(buf, "standby\n");
+		return sysfs_emit(buf, "standby\n");
 	case ARCHE_PLATFORM_STATE_FW_FLASHING:
-		return sprintf(buf, "fw_flashing\n");
+		return sysfs_emit(buf, "fw_flashing\n");
 	default:
-		return sprintf(buf, "unknown state\n");
+		return sysfs_emit(buf, "unknown state\n");
 	}
 }
 
diff --git a/drivers/staging/greybus/arche-platform.c b/drivers/staging/greybus/arche-platform.c
index d48464390f58..2e706c1169d5 100644
--- a/drivers/staging/greybus/arche-platform.c
+++ b/drivers/staging/greybus/arche-platform.c
@@ -21,6 +21,7 @@
 #include <linux/time.h>
 #include <linux/greybus.h>
 #include <linux/of.h>
+#include <linux/sysfs.h>
 #include "arche_platform.h"
 
 #if IS_ENABLED(CONFIG_USB_HSIC_USB3613)
@@ -374,15 +375,15 @@ static ssize_t state_show(struct device *dev,
 
 	switch (arche_pdata->state) {
 	case ARCHE_PLATFORM_STATE_OFF:
-		return sprintf(buf, "off\n");
+		return sysfs_emit(buf, "off\n");
 	case ARCHE_PLATFORM_STATE_ACTIVE:
-		return sprintf(buf, "active\n");
+		return sysfs_emit(buf, "active\n");
 	case ARCHE_PLATFORM_STATE_STANDBY:
-		return sprintf(buf, "standby\n");
+		return sysfs_emit(buf, "standby\n");
 	case ARCHE_PLATFORM_STATE_FW_FLASHING:
-		return sprintf(buf, "fw_flashing\n");
+		return sysfs_emit(buf, "fw_flashing\n");
 	default:
-		return sprintf(buf, "unknown state\n");
+		return sysfs_emit(buf, "unknown state\n");
 	}
 }
 
diff --git a/drivers/staging/greybus/audio_gb.c b/drivers/staging/greybus/audio_gb.c
index 9d8994fdb41a..c7f8df7b4cbe 100644
--- a/drivers/staging/greybus/audio_gb.c
+++ b/drivers/staging/greybus/audio_gb.c
@@ -8,21 +8,28 @@
 #include <linux/greybus.h>
 #include "audio_codec.h"
 
-/* TODO: Split into separate calls */
-int gb_audio_gb_get_topology(struct gb_connection *connection,
-			     struct gb_audio_topology **topology)
+static int gb_audio_gb_get_topology_size(struct gb_connection *connection,
+					 u16 *size)
 {
-	struct gb_audio_get_topology_size_response size_resp;
-	struct gb_audio_topology *topo;
-	u16 size;
+	struct gb_audio_get_topology_size_response resp;
 	int ret;
 
 	ret = gb_operation_sync(connection, GB_AUDIO_TYPE_GET_TOPOLOGY_SIZE,
-				NULL, 0, &size_resp, sizeof(size_resp));
+				NULL, 0, &resp, sizeof(resp));
 	if (ret)
 		return ret;
 
-	size = le16_to_cpu(size_resp.size);
+	*size = le16_to_cpu(resp.size);
+	return 0;
+}
+
+static int gb_audio_gb_read_topology(struct gb_connection *connection,
+				     struct gb_audio_topology **topology,
+				     u16 size)
+{
+	struct gb_audio_topology *topo;
+	int ret;
+
 	if (size < sizeof(*topo))
 		return -ENODATA;
 
@@ -38,9 +45,21 @@ int gb_audio_gb_get_topology(struct gb_connection *connection,
 	}
 
 	*topology = topo;
-
 	return 0;
 }
+
+int gb_audio_gb_get_topology(struct gb_connection *connection,
+			     struct gb_audio_topology **topology)
+{
+	u16 size;
+	int ret;
+
+	ret = gb_audio_gb_get_topology_size(connection, &size);
+	if (ret)
+		return ret;
+
+	return gb_audio_gb_read_topology(connection, topology, size);
+}
 EXPORT_SYMBOL_GPL(gb_audio_gb_get_topology);
 
 int gb_audio_gb_get_control(struct gb_connection *connection,
diff --git a/drivers/staging/greybus/audio_manager_module.c b/drivers/staging/greybus/audio_manager_module.c
index 4a4dfb42f50f..781144be4eec 100644
--- a/drivers/staging/greybus/audio_manager_module.c
+++ b/drivers/staging/greybus/audio_manager_module.c
@@ -6,6 +6,7 @@
  */
 
 #include <linux/slab.h>
+#include <linux/sysfs.h>
 
 #include "audio_manager.h"
 #include "audio_manager_private.h"
@@ -76,7 +77,7 @@ static void gb_audio_module_release(struct kobject *kobj)
 static ssize_t gb_audio_module_name_show(struct gb_audio_manager_module *module,
 					 struct gb_audio_manager_module_attribute *attr, char *buf)
 {
-	return sprintf(buf, "%s", module->desc.name);
+	return sysfs_emit(buf, "%s\n", module->desc.name);
 }
 
 static struct gb_audio_manager_module_attribute gb_audio_module_name_attribute =
@@ -85,7 +86,7 @@ static struct gb_audio_manager_module_attribute gb_audio_module_name_attribute =
 static ssize_t gb_audio_module_vid_show(struct gb_audio_manager_module *module,
 					struct gb_audio_manager_module_attribute *attr, char *buf)
 {
-	return sprintf(buf, "%d", module->desc.vid);
+	return sysfs_emit(buf, "%d\n", module->desc.vid);
 }
 
 static struct gb_audio_manager_module_attribute gb_audio_module_vid_attribute =
@@ -94,7 +95,7 @@ static struct gb_audio_manager_module_attribute gb_audio_module_vid_attribute =
 static ssize_t gb_audio_module_pid_show(struct gb_audio_manager_module *module,
 					struct gb_audio_manager_module_attribute *attr, char *buf)
 {
-	return sprintf(buf, "%d", module->desc.pid);
+	return sysfs_emit(buf, "%d\n", module->desc.pid);
 }
 
 static struct gb_audio_manager_module_attribute gb_audio_module_pid_attribute =
@@ -104,7 +105,7 @@ static ssize_t gb_audio_module_intf_id_show(struct gb_audio_manager_module *modu
 					    struct gb_audio_manager_module_attribute *attr,
 					    char *buf)
 {
-	return sprintf(buf, "%d", module->desc.intf_id);
+	return sysfs_emit(buf, "%d\n", module->desc.intf_id);
 }
 
 static struct gb_audio_manager_module_attribute
@@ -115,7 +116,7 @@ static ssize_t gb_audio_module_ip_devices_show(struct gb_audio_manager_module *m
 					       struct gb_audio_manager_module_attribute *attr,
 					       char *buf)
 {
-	return sprintf(buf, "0x%X", module->desc.ip_devices);
+	return sysfs_emit(buf, "0x%X\n", module->desc.ip_devices);
 }
 
 static struct gb_audio_manager_module_attribute
@@ -126,7 +127,7 @@ static ssize_t gb_audio_module_op_devices_show(struct gb_audio_manager_module *m
 					       struct gb_audio_manager_module_attribute *attr,
 					       char *buf)
 {
-	return sprintf(buf, "0x%X", module->desc.op_devices);
+	return sysfs_emit(buf, "0x%X\n", module->desc.op_devices);
 }
 
 static struct gb_audio_manager_module_attribute
diff --git a/drivers/staging/greybus/gbphy.c b/drivers/staging/greybus/gbphy.c
index 6adcad286633..72d72aa7cb0f 100644
--- a/drivers/staging/greybus/gbphy.c
+++ b/drivers/staging/greybus/gbphy.c
@@ -14,6 +14,7 @@
 #include <linux/slab.h>
 #include <linux/device.h>
 #include <linux/greybus.h>
+#include <linux/sysfs.h>
 
 #include "gbphy.h"
 
@@ -31,7 +32,7 @@ static ssize_t protocol_id_show(struct device *dev,
 {
 	struct gbphy_device *gbphy_dev = to_gbphy_dev(dev);
 
-	return sprintf(buf, "0x%02x\n", gbphy_dev->cport_desc->protocol_id);
+	return sysfs_emit(buf, "0x%02x\n", gbphy_dev->cport_desc->protocol_id);
 }
 static DEVICE_ATTR_RO(protocol_id);
 
diff --git a/drivers/staging/greybus/light.c b/drivers/staging/greybus/light.c
index e509fdc715db..db0e98faec08 100644
--- a/drivers/staging/greybus/light.c
+++ b/drivers/staging/greybus/light.c
@@ -12,6 +12,7 @@
 #include <linux/module.h>
 #include <linux/slab.h>
 #include <linux/greybus.h>
+#include <linux/sysfs.h>
 #include <media/v4l2-flash-led-class.h>
 
 #define NAMES_MAX	32
@@ -173,7 +174,7 @@ static ssize_t fade_##__dir##_show(struct device *dev,			\
 	struct led_classdev *cdev = dev_get_drvdata(dev);		\
 	struct gb_channel *channel = get_channel_from_cdev(cdev);	\
 									\
-	return sprintf(buf, "%u\n", channel->fade_##__dir);		\
+	return sysfs_emit(buf, "%u\n", channel->fade_##__dir);		\
 }									\
 									\
 static ssize_t fade_##__dir##_store(struct device *dev,			\
@@ -220,7 +221,7 @@ static ssize_t color_show(struct device *dev, struct device_attribute *attr,
 	struct led_classdev *cdev = dev_get_drvdata(dev);
 	struct gb_channel *channel = get_channel_from_cdev(cdev);
 
-	return sprintf(buf, "0x%08x\n", channel->color);
+	return sysfs_emit(buf, "0x%08x\n", channel->color);
 }
 
 static ssize_t color_store(struct device *dev, struct device_attribute *attr,
diff --git a/drivers/staging/greybus/loopback.c b/drivers/staging/greybus/loopback.c
index 1f19323b0e1a..0c1b45aa8b7b 100644
--- a/drivers/staging/greybus/loopback.c
+++ b/drivers/staging/greybus/loopback.c
@@ -26,6 +26,7 @@
 #include <linux/atomic.h>
 #include <linux/pm_runtime.h>
 #include <linux/greybus.h>
+#include <linux/sysfs.h>
 #include <asm/div64.h>
 
 #define NSEC_PER_DAY 86400000000000ULL
@@ -125,7 +126,7 @@ static ssize_t field##_show(struct device *dev,			\
 			    char *buf)					\
 {									\
 	struct gb_loopback *gb = dev_get_drvdata(dev);			\
-	return sprintf(buf, "%u\n", gb->field);			\
+	return sysfs_emit(buf, "%u\n", gb->field);			\
 }									\
 static DEVICE_ATTR_RO(field)
 
@@ -137,8 +138,8 @@ static ssize_t name##_##field##_show(struct device *dev,	\
 	struct gb_loopback *gb = dev_get_drvdata(dev);			\
 	/* Report 0 for min and max if no transfer succeeded */		\
 	if (!gb->requests_completed)					\
-		return sprintf(buf, "0\n");				\
-	return sprintf(buf, "%" #type "\n", gb->name.field);		\
+		return sysfs_emit(buf, "0\n");				\
+	return sysfs_emit(buf, "%\n" #type "\n", gb->name.field);		\
 }									\
 static DEVICE_ATTR_RO(name##_##field)
 
@@ -158,7 +159,7 @@ static ssize_t name##_avg_show(struct device *dev,		\
 	rem = do_div(avg, count);					\
 	rem *= 1000000;							\
 	do_div(rem, count);						\
-	return sprintf(buf, "%llu.%06u\n", avg, (u32)rem);		\
+	return sysfs_emit(buf, "%llu.%06u\n", avg, (u32)rem);		\
 }									\
 static DEVICE_ATTR_RO(name##_avg)
 
@@ -173,7 +174,7 @@ static ssize_t field##_show(struct device *dev,				\
 			    char *buf)					\
 {									\
 	struct gb_loopback *gb = dev_get_drvdata(dev);			\
-	return sprintf(buf, "%" #type "\n", gb->field);			\
+	return sysfs_emit(buf, "%\n" #type "\n", gb->field);			\
 }									\
 static ssize_t field##_store(struct device *dev,			\
 			    struct device_attribute *attr,		\
@@ -199,7 +200,7 @@ static ssize_t field##_show(struct device *dev,		\
 			    char *buf)					\
 {									\
 	struct gb_loopback *gb = dev_get_drvdata(dev);			\
-	return sprintf(buf, "%u\n", gb->field);				\
+	return sysfs_emit(buf, "%u\n", gb->field);				\
 }									\
 static DEVICE_ATTR_RO(field)
 
@@ -209,7 +210,7 @@ static ssize_t field##_show(struct device *dev,				\
 			    char *buf)					\
 {									\
 	struct gb_loopback *gb = dev_get_drvdata(dev);			\
-	return sprintf(buf, "%" #type "\n", gb->field);			\
+	return sysfs_emit(buf, "%\n" #type "\n", gb->field);			\
 }									\
 static ssize_t field##_store(struct device *dev,			\
 			    struct device_attribute *attr,		\
@@ -679,7 +680,7 @@ static int gb_loopback_request_handler(struct gb_operation *operation)
 		}
 
 		if (!gb_operation_response_alloc(operation,
-				len + sizeof(*response), GFP_KERNEL)) {
+						 len + sizeof(*response), GFP_KERNEL)) {
 			dev_err(dev, "error allocating response\n");
 			return -ENOMEM;
 		}
@@ -831,109 +832,120 @@ static void gb_loopback_async_wait_to_send(struct gb_loopback *gb)
 				  kthread_should_stop());
 }
 
-static int gb_loopback_fn(void *data)
+static bool gb_loopback_should_stop(struct gb_loopback *gb,
+				    struct gb_bundle *bundle)
+{
+	if (!gb->type) {
+		gb_pm_runtime_put_autosuspend(bundle);
+		wait_event_interruptible(gb->wq,
+					 gb->type || kthread_should_stop());
+		if (kthread_should_stop())
+			return true;
+		gb_pm_runtime_get_sync(bundle);
+	}
+	return kthread_should_stop();
+}
+
+static void gb_loopback_handle_completion(struct gb_loopback *gb,
+					  struct gb_bundle *bundle)
+{
+	gb_loopback_async_wait_all(gb);
+
+	mutex_lock(&gb->mutex);
+	if (gb->iteration_count == gb->iteration_max) {
+		gb->type = 0;
+		gb->send_count = 0;
+		sysfs_notify(&gb->dev->kobj, NULL, "iteration_count");
+		dev_dbg(&bundle->dev, "load test complete\n");
+	} else {
+		dev_dbg(&bundle->dev, "continuing on with new test set\n");
+	}
+	mutex_unlock(&gb->mutex);
+}
+
+static void gb_loopback_dispatch_operation(struct gb_loopback *gb, int type,
+					   u32 size)
 {
 	int error = 0;
-	int us_wait = 0;
-	int type;
-	int ret;
-	u32 size;
 
+	if (gb->async) {
+		if (type == GB_LOOPBACK_TYPE_PING)
+			error = gb_loopback_async_ping(gb);
+		else if (type == GB_LOOPBACK_TYPE_TRANSFER)
+			error = gb_loopback_async_transfer(gb, size);
+		else if (type == GB_LOOPBACK_TYPE_SINK)
+			error = gb_loopback_async_sink(gb, size);
+
+		if (error) {
+			gb->error++;
+			gb->iteration_count++;
+		}
+	} else {
+		if (type == GB_LOOPBACK_TYPE_PING)
+			error = gb_loopback_sync_ping(gb);
+		else if (type == GB_LOOPBACK_TYPE_TRANSFER)
+			error = gb_loopback_sync_transfer(gb, size);
+		else if (type == GB_LOOPBACK_TYPE_SINK)
+			error = gb_loopback_sync_sink(gb, size);
+
+		if (error)
+			gb->error++;
+		gb->iteration_count++;
+		gb_loopback_calculate_stats(gb, !!error);
+	}
+}
+
+static void gb_loopback_delay_if_needed(int us_wait)
+{
+	if (us_wait) {
+		if (us_wait < 20000)
+			usleep_range(us_wait, us_wait + 100);
+		else
+			msleep(us_wait / 1000);
+	}
+}
+
+static int gb_loopback_fn(void *data)
+{
+	int us_wait = 0, type;
+	u32 size;
 	struct gb_loopback *gb = data;
 	struct gb_bundle *bundle = gb->connection->bundle;
 
-	ret = gb_pm_runtime_get_sync(bundle);
-	if (ret)
-		return ret;
+	if (gb_pm_runtime_get_sync(bundle))
+		return -EIO;
 
 	while (1) {
-		if (!gb->type) {
-			gb_pm_runtime_put_autosuspend(bundle);
-			wait_event_interruptible(gb->wq, gb->type ||
-						 kthread_should_stop());
-			ret = gb_pm_runtime_get_sync(bundle);
-			if (ret)
-				return ret;
-		}
-
-		if (kthread_should_stop())
+		if (gb_loopback_should_stop(gb, bundle))
 			break;
 
-		/* Limit the maximum number of in-flight async operations */
 		gb_loopback_async_wait_to_send(gb);
 		if (kthread_should_stop())
 			break;
 
 		mutex_lock(&gb->mutex);
 
-		/* Optionally terminate */
 		if (gb->send_count == gb->iteration_max) {
 			mutex_unlock(&gb->mutex);
-
-			/* Wait for synchronous and asynchronous completion */
-			gb_loopback_async_wait_all(gb);
-
-			/* Mark complete unless user-space has poked us */
-			mutex_lock(&gb->mutex);
-			if (gb->iteration_count == gb->iteration_max) {
-				gb->type = 0;
-				gb->send_count = 0;
-				sysfs_notify(&gb->dev->kobj,  NULL,
-					     "iteration_count");
-				dev_dbg(&bundle->dev, "load test complete\n");
-			} else {
-				dev_dbg(&bundle->dev,
-					"continuing on with new test set\n");
-			}
-			mutex_unlock(&gb->mutex);
+			gb_loopback_handle_completion(gb, bundle);
 			continue;
 		}
+
 		size = gb->size;
 		us_wait = gb->us_wait;
 		type = gb->type;
 		if (ktime_to_ns(gb->ts) == 0)
 			gb->ts = ktime_get();
 
-		/* Else operations to perform */
-		if (gb->async) {
-			if (type == GB_LOOPBACK_TYPE_PING)
-				error = gb_loopback_async_ping(gb);
-			else if (type == GB_LOOPBACK_TYPE_TRANSFER)
-				error = gb_loopback_async_transfer(gb, size);
-			else if (type == GB_LOOPBACK_TYPE_SINK)
-				error = gb_loopback_async_sink(gb, size);
-
-			if (error) {
-				gb->error++;
-				gb->iteration_count++;
-			}
-		} else {
-			/* We are effectively single threaded here */
-			if (type == GB_LOOPBACK_TYPE_PING)
-				error = gb_loopback_sync_ping(gb);
-			else if (type == GB_LOOPBACK_TYPE_TRANSFER)
-				error = gb_loopback_sync_transfer(gb, size);
-			else if (type == GB_LOOPBACK_TYPE_SINK)
-				error = gb_loopback_sync_sink(gb, size);
-
-			if (error)
-				gb->error++;
-			gb->iteration_count++;
-			gb_loopback_calculate_stats(gb, !!error);
-		}
+		gb_loopback_dispatch_operation(gb, type, size);
+
 		gb->send_count++;
 		mutex_unlock(&gb->mutex);
 
-		if (us_wait) {
-			if (us_wait < 20000)
-				usleep_range(us_wait, us_wait + 100);
-			else
-				msleep(us_wait / 1000);
-		}
+		gb_loopback_delay_if_needed(us_wait);
 	}
 
 	gb_pm_runtime_put_autosuspend(bundle);
-
 	return 0;
 }
 
-- 
2.43.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
