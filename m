Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EBF68A7769
	for <lists+greybus-dev@lfdr.de>; Wed, 17 Apr 2024 00:02:15 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 15D9C45241
	for <lists+greybus-dev@lfdr.de>; Tue, 16 Apr 2024 22:02:14 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	by lists.linaro.org (Postfix) with ESMTPS id 51630400D7
	for <greybus-dev@lists.linaro.org>; Mon,  8 Apr 2024 22:44:42 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=WQnHIppS;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (lists.linaro.org: domain of jacksonchui.qwerty@gmail.com designates 209.85.210.181 as permitted sender) smtp.mailfrom=jacksonchui.qwerty@gmail.com
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-6ecf05fd12fso4140649b3a.2
        for <greybus-dev@lists.linaro.org>; Mon, 08 Apr 2024 15:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712616281; x=1713221081; darn=lists.linaro.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CKZc4c8lA2wcnIkG9X93w8id7DRu1ED4YOIT0xR9IFU=;
        b=WQnHIppSByLkEYkIcTpyYNekL3SN0i0ae4wVKDZMZtwTz/o6/XTj4KIatWuiqN3S7d
         gnEU9N9QOsthyjdpKRDVmWPLl9qYWY89BoxLS+NuyIG0yBt8jYFlF7+9YAlFWwAxSU6g
         9l6+rjHaMSS3bbnCQy2nugZyrDxynJQw7DsW72YV0Z+2dela0FZfUd6b7PqbUDonuIG0
         QS2ZtD989LnJQFkc6fybSSDyNQK69RLtCgRbKkBflTsOmE2QHHsNn//+MgMdEWCN/nHy
         h33eHhldgePPpSFQiXLwJUP0ns1y2Go6ooCnTJ+v7udu7S2MubyClem6WFIpHlqZF5rB
         R/dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712616281; x=1713221081;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CKZc4c8lA2wcnIkG9X93w8id7DRu1ED4YOIT0xR9IFU=;
        b=ClX0If9KIYd/PRRDUyeDQ5DKcXfKZa8osWVEPQ+LR+y10b/+e8NMr2siXhNhdtkPFz
         +D3u8TD9uoZMby5uMEyowArMWrM8lhY8UmcLOeDaa5fjJ61D2yrqIfwLWObXnuQiaCgH
         vB+JqZd3PzDsdPDipeN6OFI/M0lIPvq3at/TseBA3mw0SAPilP5uJs3KCR/Bg+AhicoX
         jtJDIRCKfOCyywAJg56S3nFPTK2vQCh5ABjNWQrfFnNTFBMgN+/+OCoDlgsxBPAyOJn7
         Bpnsz5LMG31Lpo+Jp4Y3flqoOYA2MfuGcF1qy6N4Ib12u/7WBJXSpO7H+HLJGJQCdgI5
         hOEw==
X-Forwarded-Encrypted: i=1; AJvYcCVmeoBrgCWcsa8d4kdFAJxfYa/vrCZ2kyGh3XfIdAKGfNVu8+M6h+zjHpaKTRiGzrGlrMSV0QE8cz6ZfWt+6Dly1bhGm5IM/ibiXO5D
X-Gm-Message-State: AOJu0Yw1TzlbKGkYoKMQROY7fJXOI6OEqzU664nqFMyj44Xg6JqGGfsT
	tUQc8KnyOYMbVgF4zebVG2gnzkhts8YeD7QCVpKP0EFzon65HuLc
X-Google-Smtp-Source: AGHT+IEQ6x5BfJgpVcqBxhQ0jHQpLc5V1u824p3HKlh4QMBlx8Di6OTQ0/e9hWxZu5kSqTeI1bVx+w==
X-Received: by 2002:a05:6a20:c901:b0:1a7:6ca9:2925 with SMTP id gx1-20020a056a20c90100b001a76ca92925mr5739021pzb.59.1712616281303;
        Mon, 08 Apr 2024 15:44:41 -0700 (PDT)
Received: from jc-ubuntu-dev-korn-1 (c-98-210-1-68.hsd1.ca.comcast.net. [98.210.1.68])
        by smtp.gmail.com with ESMTPSA id m6-20020a17090a34c600b0029be7922b32sm9623026pjf.26.2024.04.08.15.44.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Apr 2024 15:44:40 -0700 (PDT)
Date: Mon, 8 Apr 2024 15:44:40 -0700
From: Jackson Chui <jacksonchui.qwerty@gmail.com>
To: Jackson Chui <jacksonchui.qwerty@gmail.com>
Message-ID: <ZhRzWNiak1qOdJLL@jc-ubuntu-dev-korn-1>
MIME-Version: 1.0
Content-Disposition: inline
X-Rspamd-Queue-Id: 51630400D7
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.10 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.210.181:from];
	MIME_GOOD(-0.10)[text/plain];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	URIBL_BLOCKED(0.00)[mail-pf1-f181.google.com:helo,mail-pf1-f181.google.com:rdns];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-MailFrom: jacksonchui.qwerty@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: JLCQ6UJ4AVJ3SXSSYGP7QEUZZECIBMSB
X-Message-ID-Hash: JLCQ6UJ4AVJ3SXSSYGP7QEUZZECIBMSB
X-Mailman-Approved-At: Tue, 16 Apr 2024 22:02:11 +0000
CC: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [Patch v2] staging: greybus: Replace gcam macros with direct dev log calls
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/JLCQ6UJ4AVJ3SXSSYGP7QEUZZECIBMSB/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Reported by checkpatch:

CHECK: Macro argument 'gcam' may be better as '(gcam)' to avoid
precedence issues

Inline standard calls to 'dev_*' kernel logging functions, in favor
of 'gcam_*' macros, to clear up gcam-related logging.

Signed-off-by: Jackson Chui <jacksonchui.qwerty@gmail.com>

---
Changes in v2:
  - Inline 'dev_*' logging functions, over wrappers and macros
    to just use the standard call.
  - Remove 'gcam_*' macros, since they are no longer used.
---
 drivers/staging/greybus/camera.c | 58 +++++++++++++++-----------------
 1 file changed, 27 insertions(+), 31 deletions(-)

diff --git a/drivers/staging/greybus/camera.c b/drivers/staging/greybus/camera.c
index a8173aa3a995..b8b2bdfa59e5 100644
--- a/drivers/staging/greybus/camera.c
+++ b/drivers/staging/greybus/camera.c
@@ -180,10 +180,6 @@ static const struct gb_camera_fmt_info *gb_camera_get_format_info(u16 gb_fmt)
 
 #define GB_CAMERA_MAX_SETTINGS_SIZE	8192
 
-#define gcam_dbg(gcam, format...)	dev_dbg(&gcam->bundle->dev, format)
-#define gcam_info(gcam, format...)	dev_info(&gcam->bundle->dev, format)
-#define gcam_err(gcam, format...)	dev_err(&gcam->bundle->dev, format)
-
 static int gb_camera_operation_sync_flags(struct gb_connection *connection,
 					  int type, unsigned int flags,
 					  void *request, size_t request_size,
@@ -232,8 +228,8 @@ static int gb_camera_get_max_pkt_size(struct gb_camera *gcam,
 
 		fmt_info = gb_camera_get_format_info(cfg->format);
 		if (!fmt_info) {
-			gcam_err(gcam, "unsupported greybus image format: %d\n",
-				 cfg->format);
+			dev_err(&gcam->bundle->dev, "unsupported greybus image format: %d\n",
+				cfg->format);
 			return -EIO;
 		}
 
@@ -241,18 +237,18 @@ static int gb_camera_get_max_pkt_size(struct gb_camera *gcam,
 			pkt_size = le32_to_cpu(cfg->max_pkt_size);
 
 			if (pkt_size == 0) {
-				gcam_err(gcam,
-					 "Stream %u: invalid zero maximum packet size\n",
-					 i);
+				dev_err(&gcam->bundle->dev,
+					"Stream %u: invalid zero maximum packet size\n",
+					i);
 				return -EIO;
 			}
 		} else {
 			pkt_size = le16_to_cpu(cfg->width) * fmt_info->bpp / 8;
 
 			if (pkt_size != le32_to_cpu(cfg->max_pkt_size)) {
-				gcam_err(gcam,
-					 "Stream %u: maximum packet size mismatch (%u/%u)\n",
-					 i, pkt_size, cfg->max_pkt_size);
+				dev_err(&gcam->bundle->dev,
+					"Stream %u: maximum packet size mismatch (%u/%u)\n",
+					i, pkt_size, cfg->max_pkt_size);
 				return -EIO;
 			}
 		}
@@ -275,13 +271,13 @@ static const int gb_camera_configure_streams_validate_response(struct gb_camera
 
 	/* Validate the returned response structure */
 	if (resp->padding[0] || resp->padding[1]) {
-		gcam_err(gcam, "response padding != 0\n");
+		dev_err(&gcam->bundle->dev, "response padding != 0\n");
 		return -EIO;
 	}
 
 	if (resp->num_streams > nstreams) {
-		gcam_err(gcam, "got #streams %u > request %u\n",
-			 resp->num_streams, nstreams);
+		dev_err(&gcam->bundle->dev, "got #streams %u > request %u\n",
+			resp->num_streams, nstreams);
 		return -EIO;
 	}
 
@@ -289,7 +285,7 @@ static const int gb_camera_configure_streams_validate_response(struct gb_camera
 		struct gb_camera_stream_config_response *cfg = &resp->config[i];
 
 		if (cfg->padding) {
-			gcam_err(gcam, "stream #%u padding != 0\n", i);
+			dev_err(&gcam->bundle->dev, "stream #%u padding != 0\n", i);
 			return -EIO;
 		}
 	}
@@ -340,16 +336,16 @@ static int gb_camera_set_power_mode(struct gb_camera *gcam, bool hs)
 
 	ret = gb_camera_set_intf_power_mode(gcam, intf->interface_id, hs);
 	if (ret < 0) {
-		gcam_err(gcam, "failed to set module interface to %s (%d)\n",
-			 hs ? "HS" : "PWM", ret);
+		dev_err(&gcam->bundle->dev, "failed to set module interface to %s (%d)\n",
+			hs ? "HS" : "PWM", ret);
 		return ret;
 	}
 
 	ret = gb_camera_set_intf_power_mode(gcam, svc->ap_intf_id, hs);
 	if (ret < 0) {
 		gb_camera_set_intf_power_mode(gcam, intf->interface_id, !hs);
-		gcam_err(gcam, "failed to set AP interface to %s (%d)\n",
-			 hs ? "HS" : "PWM", ret);
+		dev_err(&gcam->bundle->dev, "failed to set AP interface to %s (%d)\n",
+			hs ? "HS" : "PWM", ret);
 		return ret;
 	}
 
@@ -435,7 +431,7 @@ static int gb_camera_setup_data_connection(struct gb_camera *gcam,
 			   sizeof(csi_cfg),
 			   GB_APB_REQUEST_CSI_TX_CONTROL, false);
 	if (ret < 0) {
-		gcam_err(gcam, "failed to start the CSI transmitter\n");
+		dev_err(&gcam->bundle->dev, "failed to start the CSI transmitter\n");
 		goto error_power;
 	}
 
@@ -470,7 +466,7 @@ static void gb_camera_teardown_data_connection(struct gb_camera *gcam)
 			   GB_APB_REQUEST_CSI_TX_CONTROL, false);
 
 	if (ret < 0)
-		gcam_err(gcam, "failed to stop the CSI transmitter\n");
+		dev_err(&gcam->bundle->dev, "failed to stop the CSI transmitter\n");
 
 	/* Set the UniPro link to low speed mode. */
 	gb_camera_set_power_mode(gcam, false);
@@ -507,7 +503,7 @@ static int gb_camera_capabilities(struct gb_camera *gcam,
 					     NULL, 0,
 					     (void *)capabilities, size);
 	if (ret)
-		gcam_err(gcam, "failed to retrieve capabilities: %d\n", ret);
+		dev_err(&gcam->bundle->dev, "failed to retrieve capabilities: %d\n", ret);
 
 done:
 	mutex_unlock(&gcam->mutex);
@@ -723,22 +719,22 @@ static int gb_camera_request_handler(struct gb_operation *op)
 	struct gb_message *request;
 
 	if (op->type != GB_CAMERA_TYPE_METADATA) {
-		gcam_err(gcam, "Unsupported unsolicited event: %u\n", op->type);
+		dev_err(&gcam->bundle->dev, "Unsupported unsolicited event: %u\n", op->type);
 		return -EINVAL;
 	}
 
 	request = op->request;
 
 	if (request->payload_size < sizeof(*payload)) {
-		gcam_err(gcam, "Wrong event size received (%zu < %zu)\n",
-			 request->payload_size, sizeof(*payload));
+		dev_err(&gcam->bundle->dev, "Wrong event size received (%zu < %zu)\n",
+			request->payload_size, sizeof(*payload));
 		return -EINVAL;
 	}
 
 	payload = request->payload;
 
-	gcam_dbg(gcam, "received metadata for request %u, frame %u, stream %u\n",
-		 payload->request_id, payload->frame_number, payload->stream);
+	dev_dbg(&gcam->bundle->dev, "received metadata for request %u, frame %u, stream %u\n",
+		payload->request_id, payload->frame_number, payload->stream);
 
 	return 0;
 }
@@ -1347,15 +1343,15 @@ static int gb_camera_resume(struct device *dev)
 
 	ret = gb_connection_enable(gcam->connection);
 	if (ret) {
-		gcam_err(gcam, "failed to enable connection: %d\n", ret);
+		dev_err(&gcam->bundle->dev, "failed to enable connection: %d\n", ret);
 		return ret;
 	}
 
 	if (gcam->data_connection) {
 		ret = gb_connection_enable(gcam->data_connection);
 		if (ret) {
-			gcam_err(gcam,
-				 "failed to enable data connection: %d\n", ret);
+			dev_err(&gcam->bundle->dev,
+				"failed to enable data connection: %d\n", ret);
 			return ret;
 		}
 	}
-- 
2.34.1

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
