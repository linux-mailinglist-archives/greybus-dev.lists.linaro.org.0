Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IE9ULb1EHWqlXwkAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Mon, 01 Jun 2026 10:37:17 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 5077061B8EA
	for <lists+greybus-dev@lfdr.de>; Mon, 01 Jun 2026 10:37:17 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 5A5A840976
	for <lists+greybus-dev@lfdr.de>; Mon,  1 Jun 2026 08:37:16 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by lists.linaro.org (Postfix) with ESMTPS id 78DD53F960
	for <greybus-dev@lists.linaro.org>; Mon,  1 Jun 2026 08:37:10 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=KHYalArn;
	spf=pass (lists.linaro.org: domain of lee@kernel.org designates 172.234.252.31 as permitted sender) smtp.mailfrom=lee@kernel.org;
	dmarc=pass (policy=quarantine) header.from=kernel.org
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id F1BFB40788;
	Mon,  1 Jun 2026 08:37:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB54D1F00893;
	Mon,  1 Jun 2026 08:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780303029;
	bh=z3QpwtT7GmqEAhsdwu3qFmzXB4GNjgddAwlZ/NfI2dM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=KHYalArntKQXlq3uQIAEopgOAqH5eT/OGts+BG3xgw+So+LgoLjj6etGzEmZ3LPR4
	 UuQbYnLZ65gcd68Npvgz48HaJgv2pTPw0Yr/VeoqAU6OE+PRbiTaZIKkzSUFADzdrP
	 52MAwBAI1Nfl2AgJiC0/r5IU3qXmPqXryiWtEXTgELFudGBAYnAKVlPnFigKN8Fyny
	 0aL7po0PbWxAi7IA6apKpG+niGQZMvYRC1eK+mgAotQCgjI1AySvqmJimWnJn37dPU
	 DuAL4ifFQZotct95M27Nl3LMd/i8jxJzAKgW9VpxHmrKbjCSqldBwTX7NgaBn4g2KE
	 K4Ug47mY7v1qg==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	=?UTF-8?q?Filipe=20La=C3=ADns?= <lains@riseup.net>,
	Bastien Nocera <hadess@hadess.net>,
	Ping Cheng <ping.cheng@wacom.com>,
	Jason Gerecke <jason.gerecke@wacom.com>,
	Viresh Kumar <vireshk@kernel.org>,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>,
	Kwok Kin Ming <kenkinming2002@gmail.com>,
	"Mario Limonciello (AMD)" <superm1@kernel.org>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	bpf@vger.kernel.org
Date: Mon,  1 Jun 2026 09:36:10 +0100
Message-ID: <20260601083642.908433-2-lee@kernel.org>
X-Mailer: git-send-email 2.54.0.823.g6e5bcc1fc9-goog
In-Reply-To: <20260601083642.908433-1-lee@kernel.org>
References: <20260601083642.908433-1-lee@kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: --
Message-ID-Hash: HO52U7SXLIJIABY7XQPC2W6FLJZQ5BHS
X-Message-ID-Hash: HO52U7SXLIJIABY7XQPC2W6FLJZQ5BHS
X-MailFrom: lee@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: stable@vger.kernel.org, Jiri Kosina <jkosina@suse.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [linux-6.12.y 2/4] HID: pass the buffer size to hid_report_raw_event
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/HO52U7SXLIJIABY7XQPC2W6FLJZQ5BHS/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [2.99 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20260515];
	MID_CONTAINS_FROM(1.00)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[kernel.org,riseup.net,hadess.net,wacom.com,linuxfoundation.org,gmail.com,vger.kernel.org,lists.linaro.org,lists.linux.dev];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,greybus-dev-bounces@lists.linaro.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	NEURAL_HAM(-0.00)[-0.983];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linaro.org:rdns,lists.linaro.org:helo,suse.com:email,linaro.org:email]
X-Rspamd-Queue-Id: 5077061B8EA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
 drivers/hid/bpf/hid_bpf_dispatch.c |  6 +++--
 drivers/hid/hid-core.c             | 37 +++++++++++++++++++++---------
 drivers/hid/hid-gfrm.c             |  4 ++--
 drivers/hid/hid-logitech-hidpp.c   |  2 +-
 drivers/hid/hid-multitouch.c       |  2 +-
 drivers/hid/hid-primax.c           |  2 +-
 drivers/hid/hid-vivaldi-common.c   |  2 +-
 drivers/hid/wacom_sys.c            |  6 ++---
 drivers/staging/greybus/hid.c      |  2 +-
 include/linux/hid.h                |  4 ++--
 include/linux/hid_bpf.h            | 14 +++++++----
 11 files changed, 51 insertions(+), 30 deletions(-)

diff --git a/drivers/hid/bpf/hid_bpf_dispatch.c b/drivers/hid/bpf/hid_bpf_dispatch.c
index 284861c166d9..b711d83dfde1 100644
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
@@ -514,7 +516,7 @@ __hid_bpf_input_report(struct hid_bpf_ctx *ctx, enum hid_report_type type, u8 *b
 	if (ret)
 		return ret;
 
-	return hid_ops->hid_input_report(ctx->hid, type, buf, size, 0, (u64)(long)ctx, true,
+	return hid_ops->hid_input_report(ctx->hid, type, buf, size, size, 0, (u64)(long)ctx, true,
 					 lock_already_taken);
 }
 
diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
index 294a25330ed0..ceff91722c3c 100644
--- a/drivers/hid/hid-core.c
+++ b/drivers/hid/hid-core.c
@@ -1998,24 +1998,32 @@ int __hid_request(struct hid_device *hid, struct hid_report *report,
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
@@ -2028,9 +2036,15 @@ int hid_report_raw_event(struct hid_device *hid, enum hid_report_type type, u8 *
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
 
@@ -2039,7 +2053,7 @@ int hid_report_raw_event(struct hid_device *hid, enum hid_report_type type, u8 *
 	if (hid->claimed & HID_CLAIMED_HIDRAW) {
 		ret = hidraw_report_event(hid, data, size);
 		if (ret)
-			goto out;
+			return ret;
 	}
 
 	if (hid->claimed != HID_CLAIMED_HIDRAW && report->maxfield) {
@@ -2051,15 +2065,15 @@ int hid_report_raw_event(struct hid_device *hid, enum hid_report_type type, u8 *
 
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
@@ -2084,7 +2098,8 @@ static int __hid_input_report(struct hid_device *hid, enum hid_report_type type,
 	report_enum = hid->report_enum + type;
 	hdrv = hid->driver;
 
-	data = dispatch_hid_bpf_device_event(hid, type, data, &size, interrupt, source, from_bpf);
+	data = dispatch_hid_bpf_device_event(hid, type, data, &bufsize, &size, interrupt,
+					     source, from_bpf);
 	if (IS_ERR(data)) {
 		ret = PTR_ERR(data);
 		goto unlock;
@@ -2113,7 +2128,7 @@ static int __hid_input_report(struct hid_device *hid, enum hid_report_type type,
 			goto unlock;
 	}
 
-	ret = hid_report_raw_event(hid, type, data, size, interrupt);
+	ret = hid_report_raw_event(hid, type, data, bufsize, size, interrupt);
 
 unlock:
 	if (!lock_already_taken)
@@ -2135,7 +2150,7 @@ static int __hid_input_report(struct hid_device *hid, enum hid_report_type type,
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
index d60cd4379e86..858ac2ab46bd 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -3691,7 +3691,7 @@ static int hidpp10_consumer_keys_raw_event(struct hidpp_device *hidpp,
 	memcpy(&consumer_report[1], &data[3], 4);
 	/* We are called from atomic context */
 	hid_report_raw_event(hidpp->hid_dev, HID_INPUT_REPORT,
-			     consumer_report, 5, 1);
+			     consumer_report, sizeof(consumer_report), 5, 1);
 
 	return 1;
 }
diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
index fcf9a806f109..760f9db44c9e 100644
--- a/drivers/hid/hid-multitouch.c
+++ b/drivers/hid/hid-multitouch.c
@@ -500,7 +500,7 @@ static void mt_get_feature(struct hid_device *hdev, struct hid_report *report)
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
index 1b1112772777..ffcf65dcf713 100644
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
index 63c77a3df591..afa78c96ede8 100644
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
index bef017d6b440..fdd401e4ebde 100644
--- a/include/linux/hid.h
+++ b/include/linux/hid.h
@@ -1213,8 +1213,8 @@ static inline u32 hid_report_len(struct hid_report *report)
 	return DIV_ROUND_UP(report->size, 8) + (report->id > 0);
 }
 
-int hid_report_raw_event(struct hid_device *hid, enum hid_report_type type, u8 *data, u32 size,
-			 int interrupt);
+int hid_report_raw_event(struct hid_device *hid, enum hid_report_type type, u8 *data,
+			 size_t bufsize, u32 size, int interrupt);
 
 /* HID quirks API */
 unsigned long hid_lookup_quirk(const struct hid_device *hdev);
diff --git a/include/linux/hid_bpf.h b/include/linux/hid_bpf.h
index 6a47223e6460..aa87513acbcd 100644
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
 u8 *call_hid_bpf_rdesc_fixup(struct hid_device *hdev, const u8 *rdesc, unsigned int *size);
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
2.54.0.823.g6e5bcc1fc9-goog

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
