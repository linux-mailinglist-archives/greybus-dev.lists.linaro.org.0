Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id S5EjErJWIGrY1QAAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Wed, 03 Jun 2026 18:30:42 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id D385B639BE3
	for <lists+greybus-dev@lfdr.de>; Wed, 03 Jun 2026 18:30:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=nKHzN7sS;
	spf=pass (mail.lfdr.de: domain of "greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org" designates 44.210.186.118 as permitted sender) smtp.mailfrom="greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org";
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=kernel.org (policy=quarantine)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id EAC6240A49
	for <lists+greybus-dev@lfdr.de>; Wed,  3 Jun 2026 16:30:40 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by lists.linaro.org (Postfix) with ESMTPS id 36DED40A51
	for <greybus-dev@lists.linaro.org>; Wed,  3 Jun 2026 16:30:36 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id EB99360142;
	Wed,  3 Jun 2026 16:30:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B45641F00893;
	Wed,  3 Jun 2026 16:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780504235;
	bh=b/289Llr71EjVLLCjJt/OxZWrs0VB++6DzyuhEhHHiQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=nKHzN7sSDtq7gJzYHEz8RVOodSqXhwPs71OX55WMo+NhtLNaqR0htg5fIt51aVGUn
	 1U+8enFuoDAHDd7/4xSRL4eOdWbLq8Srfzvt6gZwj8gWFwow1vK5aI4/UgAuk5CoNR
	 YUaZhcBExX/YAjI/Q/fYH3iwRwspN6Igp37k3b7F033wBa42xMcI/9iBldzK+Ne6lV
	 1DfyB9pwjsVmNgOt3Qg1JDXHFc740k5wcVz9mjFsD1JcvYwOSDOUTvXFRBqUZjX6Tn
	 awwZFA+FqfmMxAT57TpUfpKsQfs90f0vKi3mFnInoDSbyJSIavnSm0/g0oHj/j9DU/
	 5ZdqfEMtOxjiw==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	=?UTF-8?q?Filipe=20La=C3=ADns?= <lains@riseup.net>,
	Bastien Nocera <hadess@hadess.net>,
	Ping Cheng <ping.cheng@wacom.com>,
	Jason Gerecke <jason.gerecke@wacom.com>,
	Viresh Kumar <vireshk@kernel.org>,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev
Date: Wed,  3 Jun 2026 17:30:13 +0100
Message-ID: <20260603163022.3301081-2-lee@kernel.org>
X-Mailer: git-send-email 2.54.0.1032.g2f8565e1d1-goog
In-Reply-To: <20260603163022.3301081-1-lee@kernel.org>
References: <20260603163022.3301081-1-lee@kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: --
Message-ID-Hash: P5PQINVY425NSFTFGJ6ZJELDLARQ2TZP
X-Message-ID-Hash: P5PQINVY425NSFTFGJ6ZJELDLARQ2TZP
X-MailFrom: lee@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: stable@vger.kernel.org, Benjamin Tissoires <bentiss@kernel.org>, Jiri Kosina <jkosina@suse.com>, Sasha Levin <sashal@kernel.org>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [linux-6.1.y 2/3] HID: pass the buffer size to hid_report_raw_event
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/P5PQINVY425NSFTFGJ6ZJELDLARQ2TZP/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.99 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20260515];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:jikos@kernel.org,m:benjamin.tissoires@redhat.com,m:lains@riseup.net,m:hadess@hadess.net,m:ping.cheng@wacom.com,m:jason.gerecke@wacom.com,m:vireshk@kernel.org,m:johan@kernel.org,m:elder@kernel.org,m:gregkh@linuxfoundation.org,m:linux-input@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:greybus-dev@lists.linaro.org,m:linux-staging@lists.linux.dev,m:stable@vger.kernel.org,m:bentiss@kernel.org,m:jkosina@suse.com,m:sashal@kernel.org,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	FORGED_SENDER(0.00)[lee@kernel.org,greybus-dev-bounces@lists.linaro.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,greybus-dev-bounces@lists.linaro.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,linaro.org:email,lists.linaro.org:helo,lists.linaro.org:rdns,lists.linaro.org:from_smtp,linuxfoundation.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D385B639BE3

From: Benjamin Tissoires <bentiss@kernel.org>

[ Upstream commit 2c85c61d1332e1e16f020d76951baf167dcb6f7a ]

commit 0a3fe972a7cb ("HID: core: Mitigate potential OOB by removing
bogus memset()") enforced the provided data to be at least the size of
the declared buffer in the report descriptor to prevent a buffer
overflow. However, we can try to be smarter by providing both the buffer
size and the data size, meaning that hid_report_raw_event() can make
better decision whether we should plaining reject the buffer (buffer
overflow attempt) or if we can safely memset it to 0 and pass it to the
rest of the stack.

Fixes: 0a3fe972a7cb ("HID: core: Mitigate potential OOB by removing bogus memset()")
Cc: stable@vger.kernel.org
Signed-off-by: Benjamin Tissoires <bentiss@kernel.org>
Acked-by: Johan Hovold <johan@kernel.org>
Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Jiri Kosina <jkosina@suse.com>
Stable-dep-of: 206342541fc8 ("HID: core: introduce hid_safe_input_report()")
Signed-off-by: Sasha Levin <sashal@kernel.org>
(cherry picked from commit 509c2605065004fc4cd86ee50a9350d402785307)
[Lee: Backported to linux-6.12.y and beyond]
Signed-off-by: Lee Jones <lee@kernel.org>
---
 drivers/hid/hid-core.c           | 33 +++++++++++++++++++++++---------
 drivers/hid/hid-gfrm.c           |  4 ++--
 drivers/hid/hid-logitech-hidpp.c |  2 +-
 drivers/hid/hid-multitouch.c     |  2 +-
 drivers/hid/hid-primax.c         |  2 +-
 drivers/hid/hid-vivaldi-common.c |  2 +-
 drivers/hid/wacom_sys.c          |  6 +++---
 drivers/staging/greybus/hid.c    |  2 +-
 include/linux/hid.h              |  4 ++--
 9 files changed, 36 insertions(+), 21 deletions(-)

diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
index e3d728d67b53..346c5554da5c 100644
--- a/drivers/hid/hid-core.c
+++ b/drivers/hid/hid-core.c
@@ -1986,24 +1986,32 @@ int __hid_request(struct hid_device *hid, struct hid_report *report,
 }
 EXPORT_SYMBOL_GPL(__hid_request);
 
-int hid_report_raw_event(struct hid_device *hid, enum hid_report_type type, u8 *data, u32 size,
-			 int interrupt)
+int hid_report_raw_event(struct hid_device *hid, enum hid_report_type type, u8 *data,
+			 size_t bufsize, u32 size, int interrupt)
 {
 	struct hid_report_enum *report_enum = hid->report_enum + type;
 	struct hid_report *report;
 	struct hid_driver *hdrv;
 	int max_buffer_size = HID_MAX_BUFFER_SIZE;
 	u32 rsize, csize = size;
+	size_t bsize = bufsize;
 	u8 *cdata = data;
 	int ret = 0;
 
 	report = hid_get_report(report_enum, data);
 	if (!report)
-		goto out;
+		return 0;
+
+	if (unlikely(bsize < csize)) {
+		hid_warn_ratelimited(hid, "Event data for report %d is incorrect (%d vs %ld)\n",
+				     report->id, csize, bsize);
+		return -EINVAL;
+	}
 
 	if (report_enum->numbered) {
 		cdata++;
 		csize--;
+		bsize--;
 	}
 
 	rsize = hid_compute_report_size(report);
@@ -2016,9 +2024,15 @@ int hid_report_raw_event(struct hid_device *hid, enum hid_report_type type, u8 *
 	else if (rsize > max_buffer_size)
 		rsize = max_buffer_size;
 
+	if (bsize < rsize) {
+		hid_warn_ratelimited(hid, "Event data for report %d was too short (%d vs %ld)\n",
+				     report->id, rsize, bsize);
+		return -EINVAL;
+	}
+
 	if (csize < rsize) {
 		dbg_hid("report %d is too short, (%d < %d)\n", report->id,
-				csize, rsize);
+			csize, rsize);
 		memset(cdata + csize, 0, rsize - csize);
 	}
 
@@ -2027,7 +2041,7 @@ int hid_report_raw_event(struct hid_device *hid, enum hid_report_type type, u8 *
 	if (hid->claimed & HID_CLAIMED_HIDRAW) {
 		ret = hidraw_report_event(hid, data, size);
 		if (ret)
-			goto out;
+			return ret;
 	}
 
 	if (hid->claimed != HID_CLAIMED_HIDRAW && report->maxfield) {
@@ -2039,7 +2053,7 @@ int hid_report_raw_event(struct hid_device *hid, enum hid_report_type type, u8 *
 
 	if (hid->claimed & HID_CLAIMED_INPUT)
 		hidinput_report_event(hid, report);
-out:
+
 	return ret;
 }
 EXPORT_SYMBOL_GPL(hid_report_raw_event);
@@ -2055,12 +2069,13 @@ EXPORT_SYMBOL_GPL(hid_report_raw_event);
  *
  * This is data entry for lower layers.
  */
-int hid_input_report(struct hid_device *hid, enum hid_report_type type, u8 *data, u32 size,
-		     int interrupt)
+int hid_input_report(struct hid_device *hid, enum hid_report_type type, u8 *data,
+		     u32 size, int interrupt)
 {
 	struct hid_report_enum *report_enum;
 	struct hid_driver *hdrv;
 	struct hid_report *report;
+	size_t bufsize = size;
 	int ret = 0;
 
 	if (!hid)
@@ -2105,7 +2120,7 @@ int hid_input_report(struct hid_device *hid, enum hid_report_type type, u8 *data
 			goto unlock;
 	}
 
-	ret = hid_report_raw_event(hid, type, data, size, interrupt);
+	ret = hid_report_raw_event(hid, type, data, bufsize, size, interrupt);
 
 unlock:
 	up(&hid->driver_input_lock);
diff --git a/drivers/hid/hid-gfrm.c b/drivers/hid/hid-gfrm.c
index 699186ff2349..d2a56bf92b41 100644
--- a/drivers/hid/hid-gfrm.c
+++ b/drivers/hid/hid-gfrm.c
@@ -66,7 +66,7 @@ static int gfrm_raw_event(struct hid_device *hdev, struct hid_report *report,
 	switch (data[1]) {
 	case GFRM100_SEARCH_KEY_DOWN:
 		ret = hid_report_raw_event(hdev, HID_INPUT_REPORT, search_key_dn,
-					   sizeof(search_key_dn), 1);
+					   sizeof(search_key_dn), sizeof(search_key_dn), 1);
 		break;
 
 	case GFRM100_SEARCH_KEY_AUDIO_DATA:
@@ -74,7 +74,7 @@ static int gfrm_raw_event(struct hid_device *hdev, struct hid_report *report,
 
 	case GFRM100_SEARCH_KEY_UP:
 		ret = hid_report_raw_event(hdev, HID_INPUT_REPORT, search_key_up,
-					   sizeof(search_key_up), 1);
+					   sizeof(search_key_up), sizeof(search_key_up), 1);
 		break;
 
 	default:
diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index 339a227c457e..113307157a27 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -3692,7 +3692,7 @@ static int hidpp10_consumer_keys_raw_event(struct hidpp_device *hidpp,
 	memcpy(&consumer_report[1], &data[3], 4);
 	/* We are called from atomic context */
 	hid_report_raw_event(hidpp->hid_dev, HID_INPUT_REPORT,
-			     consumer_report, 5, 1);
+			     consumer_report, sizeof(consumer_report), 5, 1);
 
 	return 1;
 }
diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
index 003950894362..6c04eed0a464 100644
--- a/drivers/hid/hid-multitouch.c
+++ b/drivers/hid/hid-multitouch.c
@@ -479,7 +479,7 @@ static void mt_get_feature(struct hid_device *hdev, struct hid_report *report)
 		}
 
 		ret = hid_report_raw_event(hdev, HID_FEATURE_REPORT, buf,
-					   size, 0);
+					   size, size, 0);
 		if (ret)
 			dev_warn(&hdev->dev, "failed to report feature\n");
 	}
diff --git a/drivers/hid/hid-primax.c b/drivers/hid/hid-primax.c
index 1e6413d07cae..16e2a811eda9 100644
--- a/drivers/hid/hid-primax.c
+++ b/drivers/hid/hid-primax.c
@@ -44,7 +44,7 @@ static int px_raw_event(struct hid_device *hid, struct hid_report *report,
 			data[0] |= (1 << (data[idx] - 0xE0));
 			data[idx] = 0;
 		}
-		hid_report_raw_event(hid, HID_INPUT_REPORT, data, size, 0);
+		hid_report_raw_event(hid, HID_INPUT_REPORT, data, size, size, 0);
 		return 1;
 
 	default:	/* unknown report */
diff --git a/drivers/hid/hid-vivaldi-common.c b/drivers/hid/hid-vivaldi-common.c
index b0af2be94895..7fb986615768 100644
--- a/drivers/hid/hid-vivaldi-common.c
+++ b/drivers/hid/hid-vivaldi-common.c
@@ -85,7 +85,7 @@ void vivaldi_feature_mapping(struct hid_device *hdev,
 	}
 
 	ret = hid_report_raw_event(hdev, HID_FEATURE_REPORT, report_data,
-				   report_len, 0);
+				   report_len, report_len, 0);
 	if (ret) {
 		dev_warn(&hdev->dev, "failed to report feature %d\n",
 			 field->report->id);
diff --git a/drivers/hid/wacom_sys.c b/drivers/hid/wacom_sys.c
index 52011503ff3b..52b7f474d866 100644
--- a/drivers/hid/wacom_sys.c
+++ b/drivers/hid/wacom_sys.c
@@ -74,7 +74,7 @@ static void wacom_wac_queue_flush(struct hid_device *hdev,
 		int err;
 
 		size = kfifo_out(fifo, buf, sizeof(buf));
-		err = hid_report_raw_event(hdev, HID_INPUT_REPORT, buf, size, false);
+		err = hid_report_raw_event(hdev, HID_INPUT_REPORT, buf, size, size, false);
 		if (err) {
 			hid_warn(hdev, "%s: unable to flush event due to error %d\n",
 				 __func__, err);
@@ -319,7 +319,7 @@ static void wacom_feature_mapping(struct hid_device *hdev,
 					       data, n, WAC_CMD_RETRIES);
 			if (ret == n && features->type == HID_GENERIC) {
 				ret = hid_report_raw_event(hdev,
-					HID_FEATURE_REPORT, data, n, 0);
+					HID_FEATURE_REPORT, data, n, n, 0);
 			} else if (ret == 2 && features->type != HID_GENERIC) {
 				features->touch_max = data[1];
 			} else {
@@ -380,7 +380,7 @@ static void wacom_feature_mapping(struct hid_device *hdev,
 					data, n, WAC_CMD_RETRIES);
 		if (ret == n) {
 			ret = hid_report_raw_event(hdev, HID_FEATURE_REPORT,
-						   data, n, 0);
+						   data, n, n, 0);
 		} else {
 			hid_warn(hdev, "%s: could not retrieve sensor offsets\n",
 				 __func__);
diff --git a/drivers/staging/greybus/hid.c b/drivers/staging/greybus/hid.c
index 15335c38cb26..e761411ccf64 100644
--- a/drivers/staging/greybus/hid.c
+++ b/drivers/staging/greybus/hid.c
@@ -201,7 +201,7 @@ static void gb_hid_init_report(struct gb_hid *ghid, struct hid_report *report)
 	 * we just need to setup the input fields, so using
 	 * hid_report_raw_event is safe.
 	 */
-	hid_report_raw_event(ghid->hid, report->type, ghid->inbuf, size, 1);
+	hid_report_raw_event(ghid->hid, report->type, ghid->inbuf, ghid->bufsize, size, 1);
 }
 
 static void gb_hid_init_reports(struct gb_hid *ghid)
diff --git a/include/linux/hid.h b/include/linux/hid.h
index f4bdaf1b8f41..a9857fdfc327 100644
--- a/include/linux/hid.h
+++ b/include/linux/hid.h
@@ -1205,8 +1205,8 @@ static inline u32 hid_report_len(struct hid_report *report)
 	return DIV_ROUND_UP(report->size, 8) + (report->id > 0);
 }
 
-int hid_report_raw_event(struct hid_device *hid, enum hid_report_type type, u8 *data, u32 size,
-			 int interrupt);
+int hid_report_raw_event(struct hid_device *hid, enum hid_report_type type, u8 *data,
+			 size_t bufsize, u32 size, int interrupt);
 
 /* HID quirks API */
 unsigned long hid_lookup_quirk(const struct hid_device *hdev);
-- 
2.54.0.1032.g2f8565e1d1-goog

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
