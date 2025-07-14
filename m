Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id A1522B03FFA
	for <lists+greybus-dev@lfdr.de>; Mon, 14 Jul 2025 15:32:03 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 7B57745724
	for <lists+greybus-dev@lfdr.de>; Mon, 14 Jul 2025 13:32:02 +0000 (UTC)
Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.73])
	by lists.linaro.org (Postfix) with ESMTPS id D33C24122D
	for <greybus-dev@lists.linaro.org>; Mon, 14 Jul 2025 13:31:58 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=ubuntu.com header.s=fe-953a8a3ca9 header.b=UJsfbsV0;
	spf=pass (lists.linaro.org: domain of "SRS0=2073=Z4=ubuntu.com=schopin@fe-bounces.ubuntu.com" designates 121.127.44.73 as permitted sender) smtp.mailfrom="SRS0=2073=Z4=ubuntu.com=schopin@fe-bounces.ubuntu.com";
	dmarc=pass (policy=none) header.from=ubuntu.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ubuntu.com;
 h=Content-Transfer-Encoding: MIME-Version: Message-ID: Date: Subject: Cc:
 To: From; q=dns/txt; s=fe-953a8a3ca9; t=1752499917;
 bh=EUP3YEzDD6Id6ZhB1Y6hZ/zaBctkExpb8qNgPN1Ya60=;
 b=UJsfbsV0uZ/rPDAIfj+oRUB38S6gFZ+UybNfe8otILmgpQX7PrxjlBzHyAjIfP5beZoYz+twL
 vkTM6jJD3YyUXK2LstEHHQJStuWBzcmSHiVgxD6p8qO6gt9iHh9X1/zrhiVke6FjF0zLyri6KlZ
 oNpwWnyD7OKRFOOCb54d7h/qmLEwYWBycgS17A1z9r5Qi82BIxm8FIAN+BcDjuNt5YhqOFNSiN4
 sBxVzAhk0O6AljLDJxnD0oV61agebGFo8PLX9GE8TW4bLZRjBxCFWlK4QoOK8HqxAEF9pwFy7ls
 SXfd32wAeIU80TaQ4xjXjo+kUy1tyeAByASK7Fv33c2w==
X-Forward-Email-ID: 687506cb85526031a5bfa407
X-Forward-Email-Sender: rfc822; schopin@ubuntu.com, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 1.1.6
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Simon Chopin <schopin@ubuntu.com>
To: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Mon, 14 Jul 2025 15:31:33 +0200
Message-ID: <20250714133148.442401-1-schopin@ubuntu.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: D33C24122D
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.20 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ubuntu.com,none];
	FORGED_SENDER(0.30)[schopin@ubuntu.com,SRS0=2073=Z4=ubuntu.com=schopin@fe-bounces.ubuntu.com];
	R_DKIM_ALLOW(-0.20)[ubuntu.com:s=fe-953a8a3ca9];
	R_SPF_ALLOW(-0.20)[+a:smtp.forwardemail.net];
	MIME_GOOD(-0.10)[text/plain];
	ASN(0.00)[asn:60068, ipnet:121.127.44.0/24, country:GB];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_ZERO(0.00)[0];
	NEURAL_HAM(-0.00)[-1.000];
	ARC_NA(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[schopin@ubuntu.com,SRS0=2073=Z4=ubuntu.com=schopin@fe-bounces.ubuntu.com];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	URIBL_BLOCKED(0.00)[checkpatch.pl:url,ubuntu.com:email,ubuntu.com:dkim,ubuntu.com:mid,smtp.forwardemail.net:rdns,smtp.forwardemail.net:helo];
	DNSWL_BLOCKED(0.00)[121.127.44.73:from];
	DKIM_TRACE(0.00)[ubuntu.com:+]
X-Rspamd-Action: no action
Message-ID-Hash: K2Z2FQA3K2OURSCADFOW2KFWDWXCE7WQ
X-Message-ID-Hash: K2Z2FQA3K2OURSCADFOW2KFWDWXCE7WQ
X-MailFrom: SRS0=2073=Z4=ubuntu.com=schopin@fe-bounces.ubuntu.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: ~lkcamp/patches@lists.sr.ht, koike@igalia.com, Simon Chopin <schopin@ubuntu.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v2] staging: greybus: Documentation: firmware.c: fix whitespace alignments
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/K2Z2FQA3K2OURSCADFOW2KFWDWXCE7WQ/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This addresses all instances of the checkpatch.pl warning
"CHECK: Alignment should match open parenthesis"
in this file.

Signed-off-by: Simon Chopin <schopin@ubuntu.com>

---

This patch was created as part of the "Submit your first
contribution to the Linux kernel" workshop at Debconf 25.

changed in v2:
* commit title amended to mention Documentation
---
 .../greybus/Documentation/firmware/firmware.c | 24 +++++++++----------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/greybus/Documentation/firmware/firmware.c b/drivers/staging/greybus/Documentation/firmware/firmware.c
index 765d69faa9cc..b27d425c5c06 100644
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
@@ -69,20 +69,20 @@ static int update_intf_firmware(int fd)
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
-		intf_load.status);
+	       firmware_tag, intf_load.major, intf_load.minor,
+	       intf_load.status);
 
 	/* Initiate Mode-switch to the newly loaded firmware */
 	printf("Initiate Mode switch\n");
@@ -108,12 +108,12 @@ static int update_backend_firmware(int fd)
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
@@ -122,7 +122,7 @@ static int update_backend_firmware(int fd)
 	if ((backend_fw_info.status != GB_FW_U_BACKEND_VERSION_STATUS_SUCCESS)
 	    && (backend_fw_info.status != GB_FW_U_BACKEND_VERSION_STATUS_NOT_AVAILABLE)) {
 		printf("Failed to get backend firmware version: %s (%d)\n",
-			fwdev, backend_fw_info.status);
+		       fwdev, backend_fw_info.status);
 		return -1;
 	}
 
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

base-commit: 1b0ee85ee7967a4d7a68080c3f6a66af69e4e0b4
-- 
2.48.1

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
