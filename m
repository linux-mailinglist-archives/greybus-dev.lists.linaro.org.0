Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2KmSHUdd+GnatQIAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Mon, 04 May 2026 10:48:07 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AA284BA7C5
	for <lists+greybus-dev@lfdr.de>; Mon, 04 May 2026 10:48:06 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id A6999409EA
	for <lists+greybus-dev@lfdr.de>; Mon,  4 May 2026 08:48:05 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by lists.linaro.org (Postfix) with ESMTPS id 66F4F409C8
	for <greybus-dev@lists.linaro.org>; Mon,  4 May 2026 08:47:58 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b="l0k/1KUb";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (lists.linaro.org: domain of bentiss@kernel.org designates 172.234.252.31 as permitted sender) smtp.mailfrom=bentiss@kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DFFC143DE6;
	Mon,  4 May 2026 08:47:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACE76C2BCB8;
	Mon,  4 May 2026 08:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777884477;
	bh=DXYQc7X2AK50Mj+CIjz8BuE9j6+b2UJfrn8B83jW6pg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=l0k/1KUb6RG000H+kGDm7nhsCb421I1oUGeBEVA+tFHRcxDrBra82APpHH3RV2G0Y
	 EiVgMMfdALzdSpak9bXChuaY/6RXE3Chp1R3o7YoIC1fTW0k6ILvk6ylV1lAhMv8u6
	 F6UiOz+aYqrlmRC1f5TuMnV+orj3cOj/XEcrOI5nx77b2HE9/k0dwwQJQk2pmrhHNu
	 2+djzl8+4/G8g400OzvpzQSSZuSsMN+/vGtrMkn8cJKnIiY8uJbpzAJevOJoY5ckng
	 QT9ZmSI9/9G4KloPow6DnBZuuk73oQafeSaARVXCzq6lUhhQ9It0DM2gScUIeyRHNw
	 UvqL2OH9CeLWQ==
From: Benjamin Tissoires <bentiss@kernel.org>
Date: Mon, 04 May 2026 10:47:25 +0200
MIME-Version: 1.0
Message-Id: <20260504-wip-fix-core-v3-4-ce1f11f4968f@kernel.org>
References: <20260504-wip-fix-core-v3-0-ce1f11f4968f@kernel.org>
In-Reply-To: <20260504-wip-fix-core-v3-0-ce1f11f4968f@kernel.org>
To: Jiri Kosina <jikos@kernel.org>,
 =?utf-8?q?Filipe_La=C3=ADns?= <lains@riseup.net>,
 Bastien Nocera <hadess@hadess.net>, Ping Cheng <ping.cheng@wacom.com>,
 Jason Gerecke <jason.gerecke@wacom.com>, Viresh Kumar <vireshk@kernel.org>,
 Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lee Jones <lee@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777884459; l=6985;
 i=bentiss@kernel.org; s=20230215; h=from:subject:message-id;
 bh=DXYQc7X2AK50Mj+CIjz8BuE9j6+b2UJfrn8B83jW6pg=;
 b=JZtCh8p6BoKS4cb3iSfsODBVljPa+P4bPc7keNXAL6OSxZWucSnYuEXncjjidOV597oQrMP5j
 fHh9FhOC4hwCZepPA65Bg3GJsT7OykiU+xZ1GavX8XeXU2p3Ha02Zmw
X-Developer-Key: i=bentiss@kernel.org; a=ed25519;
 pk=7D1DyAVh6ajCkuUTudt/chMuXWIJHlv2qCsRkIizvFw=
X-Spamd-Bar: ----
Message-ID-Hash: IKUAMOMMRU37H6APXVLKUHDMKP3LVBDQ
X-Message-ID-Hash: IKUAMOMMRU37H6APXVLKUHDMKP3LVBDQ
X-MailFrom: bentiss@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Icenowy Zheng <uwu@icenowy.me>, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-usb@vger.kernel.org, Benjamin Tissoires <bentiss@kernel.org>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v3 4/4] HID: wacom: use __free(kfree) to clean up temporary buffers
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/IKUAMOMMRU37H6APXVLKUHDMKP3LVBDQ/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 0AA284BA7C5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.99 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	DKIM_TRACE(0.00)[kernel.org:-];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.977];
	FROM_NEQ_ENVFROM(0.00)[bentiss@kernel.org,greybus-dev-bounces@lists.linaro.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email]

This simplifies error handling and protects against memory leaks.

Signed-off-by: Benjamin Tissoires <bentiss@kernel.org>
---
 drivers/hid/hid-core.c  |  4 ++--
 drivers/hid/wacom_sys.c | 40 +++++++++++++---------------------------
 2 files changed, 15 insertions(+), 29 deletions(-)

diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
index b3596851c719..7fc20e0405ad 100644
--- a/drivers/hid/hid-core.c
+++ b/drivers/hid/hid-core.c
@@ -2050,8 +2050,8 @@ int hid_report_raw_event(struct hid_device *hid, enum hid_report_type type, u8 *
 		return 0;
 
 	if (unlikely(bsize < csize)) {
-		hid_warn_ratelimited(hid, "Event data for report %d is incorrect (%d vs %ld)\n",
-				     report->id, csize, bsize);
+		hid_warn_ratelimited(hid, "Event data for report %d is incorrect (%d vs %d)\n",
+				     report->id, csize, (unsigned int)bsize);
 		return -EINVAL;
 	}
 
diff --git a/drivers/hid/wacom_sys.c b/drivers/hid/wacom_sys.c
index a32320b351e3..adb31f54e524 100644
--- a/drivers/hid/wacom_sys.c
+++ b/drivers/hid/wacom_sys.c
@@ -70,11 +70,10 @@ static void wacom_wac_queue_flush(struct hid_device *hdev,
 {
 	while (!kfifo_is_empty(fifo)) {
 		int size = kfifo_peek_len(fifo);
-		u8 *buf;
 		unsigned int count;
 		int err;
 
-		buf = kzalloc(size, GFP_KERNEL);
+		u8 *buf __free(kfree) = kzalloc(size, GFP_KERNEL);
 		if (!buf) {
 			kfifo_skip(fifo);
 			continue;
@@ -87,7 +86,6 @@ static void wacom_wac_queue_flush(struct hid_device *hdev,
 			// to flush seems reasonable enough, however.
 			hid_warn(hdev, "%s: removed fifo entry with unexpected size\n",
 				 __func__);
-			kfree(buf);
 			continue;
 		}
 		err = hid_report_raw_event(hdev, HID_INPUT_REPORT, buf, size, size, false);
@@ -95,8 +93,6 @@ static void wacom_wac_queue_flush(struct hid_device *hdev,
 			hid_warn(hdev, "%s: unable to flush event due to error %d\n",
 				 __func__, err);
 		}
-
-		kfree(buf);
 	}
 }
 
@@ -311,7 +307,6 @@ static void wacom_feature_mapping(struct hid_device *hdev,
 	struct wacom_features *features = &wacom->wacom_wac.features;
 	struct hid_data *hid_data = &wacom->wacom_wac.hid_data;
 	unsigned int equivalent_usage = wacom_equivalent_usage(usage->hid);
-	u8 *data;
 	int ret;
 	u32 n;
 
@@ -325,10 +320,11 @@ static void wacom_feature_mapping(struct hid_device *hdev,
 		/* leave touch_max as is if predefined */
 		if (!features->touch_max) {
 			/* read manually */
-			n = hid_report_len(field->report);
-			data = hid_alloc_report_buf(field->report, GFP_KERNEL);
+			u8 *data __free(kfree) = hid_alloc_report_buf(field->report, GFP_KERNEL);
+
 			if (!data)
 				break;
+			n = hid_report_len(field->report);
 			data[0] = field->report->id;
 			ret = wacom_get_report(hdev, HID_FEATURE_REPORT,
 					       data, n, WAC_CMD_RETRIES);
@@ -344,7 +340,6 @@ static void wacom_feature_mapping(struct hid_device *hdev,
 					 "defaulting to %d\n",
 					  features->touch_max);
 			}
-			kfree(data);
 		}
 		break;
 	case HID_DG_INPUTMODE:
@@ -386,10 +381,11 @@ static void wacom_feature_mapping(struct hid_device *hdev,
 	case WACOM_HID_WD_OFFSETRIGHT:
 	case WACOM_HID_WD_OFFSETBOTTOM:
 		/* read manually */
-		n = hid_report_len(field->report);
-		data = hid_alloc_report_buf(field->report, GFP_KERNEL);
+		u8 *data __free(kfree) = hid_alloc_report_buf(field->report, GFP_KERNEL);
+
 		if (!data)
 			break;
+		n = hid_report_len(field->report);
 		data[0] = field->report->id;
 		ret = wacom_get_report(hdev, HID_FEATURE_REPORT,
 					data, n, WAC_CMD_RETRIES);
@@ -400,7 +396,6 @@ static void wacom_feature_mapping(struct hid_device *hdev,
 			hid_warn(hdev, "%s: could not retrieve sensor offsets\n",
 				 __func__);
 		}
-		kfree(data);
 		break;
 	}
 }
@@ -581,7 +576,6 @@ static int wacom_hid_set_device_mode(struct hid_device *hdev)
 static int wacom_set_device_mode(struct hid_device *hdev,
 				 struct wacom_wac *wacom_wac)
 {
-	u8 *rep_data;
 	struct hid_report *r;
 	struct hid_report_enum *re;
 	u32 length;
@@ -595,7 +589,7 @@ static int wacom_set_device_mode(struct hid_device *hdev,
 	if (!r)
 		return -EINVAL;
 
-	rep_data = hid_alloc_report_buf(r, GFP_KERNEL);
+	u8 *rep_data __free(kfree) = hid_alloc_report_buf(r, GFP_KERNEL);
 	if (!rep_data)
 		return -ENOMEM;
 
@@ -614,8 +608,6 @@ static int wacom_set_device_mode(struct hid_device *hdev,
 		 rep_data[1] != wacom_wac->mode_report &&
 		 limit++ < WAC_MSG_RETRIES);
 
-	kfree(rep_data);
-
 	return error < 0 ? error : 0;
 }
 
@@ -921,7 +913,6 @@ static int wacom_add_shared_data(struct hid_device *hdev)
 
 static int wacom_led_control(struct wacom *wacom)
 {
-	unsigned char *buf;
 	int retval;
 	unsigned char report_id = WAC_CMD_LED_CONTROL;
 	int buf_size = 9;
@@ -940,7 +931,8 @@ static int wacom_led_control(struct wacom *wacom)
 		report_id = WAC_CMD_WL_INTUOSP2;
 		buf_size = 51;
 	}
-	buf = kzalloc(buf_size, GFP_KERNEL);
+
+	unsigned char *buf __free(kfree) = kzalloc(buf_size, GFP_KERNEL);
 	if (!buf)
 		return -ENOMEM;
 
@@ -996,7 +988,6 @@ static int wacom_led_control(struct wacom *wacom)
 
 	retval = wacom_set_report(wacom->hdev, HID_FEATURE_REPORT, buf, buf_size,
 				  WAC_CMD_RETRIES);
-	kfree(buf);
 
 	return retval;
 }
@@ -1004,11 +995,10 @@ static int wacom_led_control(struct wacom *wacom)
 static int wacom_led_putimage(struct wacom *wacom, int button_id, u8 xfer_id,
 		const unsigned len, const void *img)
 {
-	unsigned char *buf;
 	int i, retval;
 	const unsigned chunk_len = len / 4; /* 4 chunks are needed to be sent */
 
-	buf = kzalloc(chunk_len + 3 , GFP_KERNEL);
+	unsigned char *buf __free(kfree) = kzalloc(chunk_len + 3, GFP_KERNEL);
 	if (!buf)
 		return -ENOMEM;
 
@@ -1018,7 +1008,7 @@ static int wacom_led_putimage(struct wacom *wacom, int button_id, u8 xfer_id,
 	retval = wacom_set_report(wacom->hdev, HID_FEATURE_REPORT, buf, 2,
 				  WAC_CMD_RETRIES);
 	if (retval < 0)
-		goto out;
+		return retval;
 
 	buf[0] = xfer_id;
 	buf[1] = button_id & 0x07;
@@ -1038,8 +1028,6 @@ static int wacom_led_putimage(struct wacom *wacom, int button_id, u8 xfer_id,
 	wacom_set_report(wacom->hdev, HID_FEATURE_REPORT, buf, 2,
 			 WAC_CMD_RETRIES);
 
-out:
-	kfree(buf);
 	return retval;
 }
 
@@ -1948,10 +1936,9 @@ static int wacom_remote_create_attr_group(struct wacom *wacom, __u32 serial,
 static int wacom_cmd_unpair_remote(struct wacom *wacom, unsigned char selector)
 {
 	const size_t buf_size = 2;
-	unsigned char *buf;
 	int retval;
 
-	buf = kzalloc(buf_size, GFP_KERNEL);
+	unsigned char *buf __free(kfree) = kzalloc(buf_size, GFP_KERNEL);
 	if (!buf)
 		return -ENOMEM;
 
@@ -1960,7 +1947,6 @@ static int wacom_cmd_unpair_remote(struct wacom *wacom, unsigned char selector)
 
 	retval = wacom_set_report(wacom->hdev, HID_OUTPUT_REPORT, buf,
 				  buf_size, WAC_CMD_RETRIES);
-	kfree(buf);
 
 	return retval;
 }

-- 
2.54.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
