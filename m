Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GJfpAkNd+GnatQIAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Mon, 04 May 2026 10:48:03 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C6FA4BA7B6
	for <lists+greybus-dev@lfdr.de>; Mon, 04 May 2026 10:48:02 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 41A23409CC
	for <lists+greybus-dev@lfdr.de>; Mon,  4 May 2026 08:48:01 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by lists.linaro.org (Postfix) with ESMTPS id D775F409CA
	for <greybus-dev@lists.linaro.org>; Mon,  4 May 2026 08:47:54 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=oJEbFzGO;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (lists.linaro.org: domain of bentiss@kernel.org designates 172.234.252.31 as permitted sender) smtp.mailfrom=bentiss@kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6008F440D3;
	Mon,  4 May 2026 08:47:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 303D5C2BCF4;
	Mon,  4 May 2026 08:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777884474;
	bh=LcCUxJZ9vDXuOX5QsjD4mqmdPrRKSI5jsjauA/s8Qsg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=oJEbFzGO/HeaDcyQfs9EYHpLd5MGXMATak+RRUXiV3D5Qx9mkVGrRjQBqbW1YkIV6
	 quXO9WD9nbWEb3BTD1Cnmabm1ar9pSOmNNebiSo1C+VlBR9ilEpOzVA07hVJHu1WHs
	 xLM9LlIhS5LhYGl08iGbeOAWFi/6ANvF+B7jS6IJlIpjNyAdpmIy49ZJsxlXTK/dPd
	 FQUzug4JkKk/d7Hvx4s0ZmCOurDxeo9/gAOgWoNAl8oeN5c6uID2eLzbv+aiSi94Vr
	 03ZxNgdgosMVptmq7fhufGFzkriFkkVf1zdIbduNsvt42LDvTtzaOCSO0ch/UDthCv
	 nHZUtztBz2k7w==
From: Benjamin Tissoires <bentiss@kernel.org>
Date: Mon, 04 May 2026 10:47:24 +0200
MIME-Version: 1.0
Message-Id: <20260504-wip-fix-core-v3-3-ce1f11f4968f@kernel.org>
References: <20260504-wip-fix-core-v3-0-ce1f11f4968f@kernel.org>
In-Reply-To: <20260504-wip-fix-core-v3-0-ce1f11f4968f@kernel.org>
To: Jiri Kosina <jikos@kernel.org>,
 =?utf-8?q?Filipe_La=C3=ADns?= <lains@riseup.net>,
 Bastien Nocera <hadess@hadess.net>, Ping Cheng <ping.cheng@wacom.com>,
 Jason Gerecke <jason.gerecke@wacom.com>, Viresh Kumar <vireshk@kernel.org>,
 Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lee Jones <lee@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777884459; l=2586;
 i=bentiss@kernel.org; s=20230215; h=from:subject:message-id;
 bh=LcCUxJZ9vDXuOX5QsjD4mqmdPrRKSI5jsjauA/s8Qsg=;
 b=BR42A1lrnPuRPFKsvC0KYNwOErDyVZ7Eg+qiAzaOplp9OLE8nEWArXfGLIfCFj0HRRhHH7wU6
 2axtBUqFVXwAtDuLY1US0Lrl/AdYYD5GL1txUO2cXLdZ7luUy7bfM2Y
X-Developer-Key: i=bentiss@kernel.org; a=ed25519;
 pk=7D1DyAVh6ajCkuUTudt/chMuXWIJHlv2qCsRkIizvFw=
X-Spamd-Bar: ----
Message-ID-Hash: YLOLCWLQVAXBOQ6OIOD74JLVZWDJUGX5
X-Message-ID-Hash: YLOLCWLQVAXBOQ6OIOD74JLVZWDJUGX5
X-MailFrom: bentiss@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Icenowy Zheng <uwu@icenowy.me>, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-usb@vger.kernel.org, Benjamin Tissoires <bentiss@kernel.org>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v3 3/4] HID: multitouch: use __free(kfree) to clean up temporary buffers
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/YLOLCWLQVAXBOQ6OIOD74JLVZWDJUGX5/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 9C6FA4BA7B6
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
	NEURAL_HAM(-0.00)[-0.978];
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
 drivers/hid/hid-multitouch.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
index eeab0b6e32cc..b19463e545d6 100644
--- a/drivers/hid/hid-multitouch.c
+++ b/drivers/hid/hid-multitouch.c
@@ -507,7 +507,6 @@ static void mt_get_feature(struct hid_device *hdev, struct hid_report *report)
 {
 	int ret;
 	u32 size = hid_report_len(report);
-	u8 *buf;
 
 	/*
 	 * Do not fetch the feature report if the device has been explicitly
@@ -516,7 +515,7 @@ static void mt_get_feature(struct hid_device *hdev, struct hid_report *report)
 	if (hdev->quirks & HID_QUIRK_NO_INIT_REPORTS)
 		return;
 
-	buf = hid_alloc_report_buf(report, GFP_KERNEL);
+	u8 *buf __free(kfree) = hid_alloc_report_buf(report, GFP_KERNEL);
 	if (!buf)
 		return;
 
@@ -529,7 +528,7 @@ static void mt_get_feature(struct hid_device *hdev, struct hid_report *report)
 		/* The report ID in the request and the response should match */
 		if (report->id != buf[0]) {
 			hid_err(hdev, "Returned feature report did not match the request\n");
-			goto free;
+			return;
 		}
 
 		ret = hid_report_raw_event(hdev, HID_FEATURE_REPORT, buf,
@@ -537,9 +536,6 @@ static void mt_get_feature(struct hid_device *hdev, struct hid_report *report)
 		if (ret)
 			dev_warn(&hdev->dev, "failed to report feature\n");
 	}
-
-free:
-	kfree(buf);
 }
 
 static void mt_feature_mapping(struct hid_device *hdev,
@@ -1658,7 +1654,6 @@ static bool mt_need_to_apply_feature(struct hid_device *hdev,
 	struct mt_class *cls = &td->mtclass;
 	struct hid_report *report = field->report;
 	unsigned int index = usage->usage_index;
-	char *buf;
 	u32 report_len;
 	int max;
 
@@ -1673,17 +1668,18 @@ static bool mt_need_to_apply_feature(struct hid_device *hdev,
 			return false;
 
 		if (cls->quirks & MT_QUIRK_FORCE_GET_FEATURE) {
-			report_len = hid_report_len(report);
-			buf = hid_alloc_report_buf(report, GFP_KERNEL);
+			char *buf __free(kfree) = hid_alloc_report_buf(report, GFP_KERNEL);
+
 			if (!buf) {
 				hid_err(hdev,
 					"failed to allocate buffer for report\n");
 				return false;
 			}
+
+			report_len = hid_report_len(report);
 			hid_hw_raw_request(hdev, report->id, buf, report_len,
 					   HID_FEATURE_REPORT,
 					   HID_REQ_GET_REPORT);
-			kfree(buf);
 		}
 
 		field->value[index] = td->inputmode_value;

-- 
2.54.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
