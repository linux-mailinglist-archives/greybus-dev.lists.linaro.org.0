Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6GCeLLNc32n1RwAAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Wed, 15 Apr 2026 11:38:59 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 780E8402AFD
	for <lists+greybus-dev@lfdr.de>; Wed, 15 Apr 2026 11:38:59 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 8DD69404DD
	for <lists+greybus-dev@lfdr.de>; Wed, 15 Apr 2026 09:38:58 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by lists.linaro.org (Postfix) with ESMTPS id 8B1D8404C9
	for <greybus-dev@lists.linaro.org>; Wed, 15 Apr 2026 09:38:53 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b="Ih7Alt4/";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (lists.linaro.org: domain of bentiss@kernel.org designates 172.234.252.31 as permitted sender) smtp.mailfrom=bentiss@kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0B4AD43CB4;
	Wed, 15 Apr 2026 09:38:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C965C2BCB4;
	Wed, 15 Apr 2026 09:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776245932;
	bh=MzSQKZrDA313SgPUGR+WOvoQhU1jMkPRybrCIYLxygw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Ih7Alt4/6aJKSIv7Ba5c2xGOdtkD/z01NEgXNz+SHq9ix3lEXTvlu2qYJXZZp/IKp
	 tf+beSZ8+HH/jldLqALl4whi2DhX34RuzLB9uPrRE5VBc8kX27GSzP+NK/6vg9Wv/N
	 O4oomrvOdC0aa2bHiocLbv95lnheZFoTAdNDCJOKRscZKuu6UipRD4P/mw+Q1um8rg
	 JKvgWllA9KvVPhlWUYXdERU82EXjrO+vXnj/Ys3yh5kLhnIjRW6UjzIHhj9EO6j/1Z
	 HmGUsPL47sxPlAAaPU+cSz/YI2BCYHvNXCjQmghLugb/uzJp9JOULetRmdXa5FUju4
	 fHSixHjc5Z9xg==
From: Benjamin Tissoires <bentiss@kernel.org>
Date: Wed, 15 Apr 2026 11:38:14 +0200
MIME-Version: 1.0
Message-Id: <20260415-wip-fix-core-v1-1-ed3c4c823175@kernel.org>
References: <20260415-wip-fix-core-v1-0-ed3c4c823175@kernel.org>
In-Reply-To: <20260415-wip-fix-core-v1-0-ed3c4c823175@kernel.org>
To: Jiri Kosina <jikos@kernel.org>,
 =?utf-8?q?Filipe_La=C3=ADns?= <lains@riseup.net>,
 Bastien Nocera <hadess@hadess.net>, Ping Cheng <ping.cheng@wacom.com>,
 Jason Gerecke <jason.gerecke@wacom.com>, Viresh Kumar <vireshk@kernel.org>,
 Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lee Jones <lee@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776245925; l=13915;
 i=bentiss@kernel.org; s=20230215; h=from:subject:message-id;
 bh=MzSQKZrDA313SgPUGR+WOvoQhU1jMkPRybrCIYLxygw=;
 b=cKYnLfCipmzS+KFp2Bs00uL4lawJEAa7F7wXPrBd4GxRYWsfyHd0GshG2yKpivAxEYHSwsxak
 WGst+pWshsLDsxXH/BI56L3BbIb7aLpPYWrkYzb5qDINKxysLESRP02
X-Developer-Key: i=bentiss@kernel.org; a=ed25519;
 pk=7D1DyAVh6ajCkuUTudt/chMuXWIJHlv2qCsRkIizvFw=
X-Spamd-Bar: -----
Message-ID-Hash: S62QWA5C7ZU7TF6M6BVUNPXVRCRZIFJI
X-Message-ID-Hash: S62QWA5C7ZU7TF6M6BVUNPXVRCRZIFJI
X-MailFrom: bentiss@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-usb@vger.kernel.org, Benjamin Tissoires <bentiss@kernel.org>, stable@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH 1/4] HID: pass the buffer size to hid_report_raw_event
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/S62QWA5C7ZU7TF6M6BVUNPXVRCRZIFJI/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
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
	NEURAL_HAM(-0.00)[-0.923];
	FROM_NEQ_ENVFROM(0.00)[bentiss@kernel.org,greybus-dev-bounces@lists.linaro.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linaro.org:helo,lists.linaro.org:rdns,linaro.org:email]
X-Rspamd-Queue-Id: 780E8402AFD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
---
 drivers/hid/bpf/hid_bpf_dispatch.c |  6 ++++--
 drivers/hid/hid-core.c             | 42 +++++++++++++++++++++++++-------------
 drivers/hid/hid-gfrm.c             |  4 ++--
 drivers/hid/hid-logitech-hidpp.c   |  2 +-
 drivers/hid/hid-multitouch.c       |  2 +-
 drivers/hid/hid-primax.c           |  2 +-
 drivers/hid/hid-vivaldi-common.c   |  2 +-
 drivers/hid/wacom_sys.c            |  6 +++---
 drivers/staging/greybus/hid.c      |  2 +-
 include/linux/hid.h                |  4 ++--
 include/linux/hid_bpf.h            | 14 ++++++++-----
 11 files changed, 53 insertions(+), 33 deletions(-)

diff --git a/drivers/hid/bpf/hid_bpf_dispatch.c b/drivers/hid/bpf/hid_bpf_dispatch.c
index 50c7b45c59e3..d0130658091b 100644
--- a/drivers/hid/bpf/hid_bpf_dispatch.c
+++ b/drivers/hid/bpf/hid_bpf_dispatch.c
@@ -24,7 +24,8 @@ EXPORT_SYMBOL(hid_ops);
 
 u8 *
 dispatch_hid_bpf_device_event(struct hid_device *hdev, enum hid_report_type type, u8 *data,
-			      u32 *size, int interrupt, u64 source, bool from_bpf)
+			      size_t *buf_size, u32 *size, int interrupt, u64 source,
+			      bool from_bpf)
 {
 	struct hid_bpf_ctx_kern ctx_kern = {
 		.ctx = {
@@ -74,6 +75,7 @@ dispatch_hid_bpf_device_event(struct hid_device *hdev, enum hid_report_type type
 		*size = ret;
 	}
 
+	*buf_size = ctx_kern.ctx.allocated_size;
 	return ctx_kern.data;
 }
 EXPORT_SYMBOL_GPL(dispatch_hid_bpf_device_event);
@@ -505,7 +507,7 @@ __hid_bpf_input_report(struct hid_bpf_ctx *ctx, enum hid_report_type type, u8 *b
 	if (ret)
 		return ret;
 
-	return hid_ops->hid_input_report(ctx->hid, type, buf, size, 0, (u64)(long)ctx, true,
+	return hid_ops->hid_input_report(ctx->hid, type, buf, size, size, 0, (u64)(long)ctx, true,
 					 lock_already_taken);
 }
 
diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
index 61afec5915ec..a806820df7e5 100644
--- a/drivers/hid/hid-core.c
+++ b/drivers/hid/hid-core.c
@@ -2033,24 +2033,32 @@ int __hid_request(struct hid_device *hid, struct hid_report *report,
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
@@ -2063,11 +2071,16 @@ int hid_report_raw_event(struct hid_device *hid, enum hid_report_type type, u8 *
 	else if (rsize > max_buffer_size)
 		rsize = max_buffer_size;
 
+	if (bsize < rsize) {
+		hid_warn_ratelimited(hid, "Event data for report %d was too short (%d vs %ld)\n",
+				     report->id, rsize, bsize);
+		return -EINVAL;
+	}
+
 	if (csize < rsize) {
-		hid_warn_ratelimited(hid, "Event data for report %d was too short (%d vs %d)\n",
-				     report->id, rsize, csize);
-		ret = -EINVAL;
-		goto out;
+		dbg_hid("report %d is too short, (%d < %d)\n", report->id,
+			csize, rsize);
+		memset(cdata + csize, 0, rsize - csize);
 	}
 
 	if ((hid->claimed & HID_CLAIMED_HIDDEV) && hid->hiddev_report_event)
@@ -2075,7 +2088,7 @@ int hid_report_raw_event(struct hid_device *hid, enum hid_report_type type, u8 *
 	if (hid->claimed & HID_CLAIMED_HIDRAW) {
 		ret = hidraw_report_event(hid, data, size);
 		if (ret)
-			goto out;
+			return ret;
 	}
 
 	if (hid->claimed != HID_CLAIMED_HIDRAW && report->maxfield) {
@@ -2087,15 +2100,15 @@ int hid_report_raw_event(struct hid_device *hid, enum hid_report_type type, u8 *
 
 	if (hid->claimed & HID_CLAIMED_INPUT)
 		hidinput_report_event(hid, report);
-out:
+
 	return ret;
 }
 EXPORT_SYMBOL_GPL(hid_report_raw_event);
 
 
 static int __hid_input_report(struct hid_device *hid, enum hid_report_type type,
-			      u8 *data, u32 size, int interrupt, u64 source, bool from_bpf,
-			      bool lock_already_taken)
+			      u8 *data, size_t bufsize, u32 size, int interrupt, u64 source,
+			      bool from_bpf, bool lock_already_taken)
 {
 	struct hid_report_enum *report_enum;
 	struct hid_driver *hdrv;
@@ -2120,7 +2133,8 @@ static int __hid_input_report(struct hid_device *hid, enum hid_report_type type,
 	report_enum = hid->report_enum + type;
 	hdrv = hid->driver;
 
-	data = dispatch_hid_bpf_device_event(hid, type, data, &size, interrupt, source, from_bpf);
+	data = dispatch_hid_bpf_device_event(hid, type, data, &bufsize, &size, interrupt,
+					     source, from_bpf);
 	if (IS_ERR(data)) {
 		ret = PTR_ERR(data);
 		goto unlock;
@@ -2149,7 +2163,7 @@ static int __hid_input_report(struct hid_device *hid, enum hid_report_type type,
 			goto unlock;
 	}
 
-	ret = hid_report_raw_event(hid, type, data, size, interrupt);
+	ret = hid_report_raw_event(hid, type, data, bufsize, size, interrupt);
 
 unlock:
 	if (!lock_already_taken)
@@ -2171,7 +2185,7 @@ static int __hid_input_report(struct hid_device *hid, enum hid_report_type type,
 int hid_input_report(struct hid_device *hid, enum hid_report_type type, u8 *data, u32 size,
 		     int interrupt)
 {
-	return __hid_input_report(hid, type, data, size, interrupt, 0,
+	return __hid_input_report(hid, type, data, size, size, interrupt, 0,
 				  false, /* from_bpf */
 				  false /* lock_already_taken */);
 }
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
index b1330d23bd2d..b3ff9265377b 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -3673,7 +3673,7 @@ static int hidpp10_consumer_keys_raw_event(struct hidpp_device *hidpp,
 	memcpy(&consumer_report[1], &data[3], 4);
 	/* We are called from atomic context */
 	hid_report_raw_event(hidpp->hid_dev, HID_INPUT_REPORT,
-			     consumer_report, 5, 1);
+			     consumer_report, sizeof(consumer_report), 5, 1);
 
 	return 1;
 }
diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
index e82a3c4e5b44..eeab0b6e32cc 100644
--- a/drivers/hid/hid-multitouch.c
+++ b/drivers/hid/hid-multitouch.c
@@ -533,7 +533,7 @@ static void mt_get_feature(struct hid_device *hdev, struct hid_report *report)
 		}
 
 		ret = hid_report_raw_event(hdev, HID_FEATURE_REPORT, buf,
-					   size, 0);
+					   size, size, 0);
 		if (ret)
 			dev_warn(&hdev->dev, "failed to report feature\n");
 	}
diff --git a/drivers/hid/hid-primax.c b/drivers/hid/hid-primax.c
index e44d79dff8de..8db054280afb 100644
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
index bf734055d4b6..b12bb5cc091a 100644
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
index 0d1c6d90fe21..a32320b351e3 100644
--- a/drivers/hid/wacom_sys.c
+++ b/drivers/hid/wacom_sys.c
@@ -90,7 +90,7 @@ static void wacom_wac_queue_flush(struct hid_device *hdev,
 			kfree(buf);
 			continue;
 		}
-		err = hid_report_raw_event(hdev, HID_INPUT_REPORT, buf, size, false);
+		err = hid_report_raw_event(hdev, HID_INPUT_REPORT, buf, size, size, false);
 		if (err) {
 			hid_warn(hdev, "%s: unable to flush event due to error %d\n",
 				 __func__, err);
@@ -334,7 +334,7 @@ static void wacom_feature_mapping(struct hid_device *hdev,
 					       data, n, WAC_CMD_RETRIES);
 			if (ret == n && features->type == HID_GENERIC) {
 				ret = hid_report_raw_event(hdev,
-					HID_FEATURE_REPORT, data, n, 0);
+					HID_FEATURE_REPORT, data, n, n, 0);
 			} else if (ret == 2 && features->type != HID_GENERIC) {
 				features->touch_max = data[1];
 			} else {
@@ -395,7 +395,7 @@ static void wacom_feature_mapping(struct hid_device *hdev,
 					data, n, WAC_CMD_RETRIES);
 		if (ret == n) {
 			ret = hid_report_raw_event(hdev, HID_FEATURE_REPORT,
-						   data, n, 0);
+						   data, n, n, 0);
 		} else {
 			hid_warn(hdev, "%s: could not retrieve sensor offsets\n",
 				 __func__);
diff --git a/drivers/staging/greybus/hid.c b/drivers/staging/greybus/hid.c
index 1f58c907c036..37e8605c6767 100644
--- a/drivers/staging/greybus/hid.c
+++ b/drivers/staging/greybus/hid.c
@@ -201,7 +201,7 @@ static void gb_hid_init_report(struct gb_hid *ghid, struct hid_report *report)
 	 * we just need to setup the input fields, so using
 	 * hid_report_raw_event is safe.
 	 */
-	hid_report_raw_event(ghid->hid, report->type, ghid->inbuf, size, 1);
+	hid_report_raw_event(ghid->hid, report->type, ghid->inbuf, ghib->bufsize, size, 1);
 }
 
 static void gb_hid_init_reports(struct gb_hid *ghid)
diff --git a/include/linux/hid.h b/include/linux/hid.h
index 442a80d79e89..ac432a2ef415 100644
--- a/include/linux/hid.h
+++ b/include/linux/hid.h
@@ -1298,8 +1298,8 @@ static inline u32 hid_report_len(struct hid_report *report)
 	return DIV_ROUND_UP(report->size, 8) + (report->id > 0);
 }
 
-int hid_report_raw_event(struct hid_device *hid, enum hid_report_type type, u8 *data, u32 size,
-			 int interrupt);
+int hid_report_raw_event(struct hid_device *hid, enum hid_report_type type, u8 *data,
+			 size_t bufsize, u32 size, int interrupt);
 
 /* HID quirks API */
 unsigned long hid_lookup_quirk(const struct hid_device *hdev);
diff --git a/include/linux/hid_bpf.h b/include/linux/hid_bpf.h
index a2e47dbcf82c..19fffa4574a4 100644
--- a/include/linux/hid_bpf.h
+++ b/include/linux/hid_bpf.h
@@ -72,8 +72,8 @@ struct hid_ops {
 	int (*hid_hw_output_report)(struct hid_device *hdev, __u8 *buf, size_t len,
 				    u64 source, bool from_bpf);
 	int (*hid_input_report)(struct hid_device *hid, enum hid_report_type type,
-				u8 *data, u32 size, int interrupt, u64 source, bool from_bpf,
-				bool lock_already_taken);
+				u8 *data, size_t bufsize, u32 size, int interrupt, u64 source,
+				bool from_bpf, bool lock_already_taken);
 	struct module *owner;
 	const struct bus_type *bus_type;
 };
@@ -200,7 +200,8 @@ struct hid_bpf {
 
 #ifdef CONFIG_HID_BPF
 u8 *dispatch_hid_bpf_device_event(struct hid_device *hid, enum hid_report_type type, u8 *data,
-				  u32 *size, int interrupt, u64 source, bool from_bpf);
+				  size_t *buf_size, u32 *size, int interrupt, u64 source,
+				  bool from_bpf);
 int dispatch_hid_bpf_raw_requests(struct hid_device *hdev,
 				  unsigned char reportnum, __u8 *buf,
 				  u32 size, enum hid_report_type rtype,
@@ -215,8 +216,11 @@ int hid_bpf_device_init(struct hid_device *hid);
 const u8 *call_hid_bpf_rdesc_fixup(struct hid_device *hdev, const u8 *rdesc, unsigned int *size);
 #else /* CONFIG_HID_BPF */
 static inline u8 *dispatch_hid_bpf_device_event(struct hid_device *hid, enum hid_report_type type,
-						u8 *data, u32 *size, int interrupt,
-						u64 source, bool from_bpf) { return data; }
+						u8 *data, size_t *buf_size, u32 *size,
+						int interrupt, u64 source, bool from_bpf)
+{
+	return data;
+}
 static inline int dispatch_hid_bpf_raw_requests(struct hid_device *hdev,
 						unsigned char reportnum, u8 *buf,
 						u32 size, enum hid_report_type rtype,

-- 
2.53.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
