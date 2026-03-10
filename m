Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wDsVNXGYsGkukgIAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Tue, 10 Mar 2026 23:17:21 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id A23A4258CFC
	for <lists+greybus-dev@lfdr.de>; Tue, 10 Mar 2026 23:17:21 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id C912E401CF
	for <lists+greybus-dev@lfdr.de>; Tue, 10 Mar 2026 22:17:20 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	by lists.linaro.org (Postfix) with ESMTPS id B9E833FDB1
	for <greybus-dev@lists.linaro.org>; Tue, 10 Mar 2026 20:05:40 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=Ct+Y9oHU;
	spf=pass (lists.linaro.org: domain of sanjayembeddedse@gmail.com designates 209.85.210.177 as permitted sender) smtp.mailfrom=sanjayembeddedse@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-82735a41920so4945345b3a.2
        for <greybus-dev@lists.linaro.org>; Tue, 10 Mar 2026 13:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773173140; x=1773777940; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DPTwHYGbckptva0R18TL8RRhJ8bcbXMlJm3dcfwo28E=;
        b=Ct+Y9oHUNc+2365Aprsrwh3U4US5StqOwLZEPbQxehd6BP2SyJhqb02+9ElPNAB006
         zj8WvkYp4oe22FvrcDT6ggdMXG1Rn18qpkbxE3o5Y6/9m5qAEsJv/57ppdLrXO/syJLv
         uswi7asN1NVUC9bwioBkKVi5urjCqjjugq+rgSYY7nABjuTNQBO6lRlj4hX48PngG+lc
         ZisBlYyr4dgyTJ8Y5KMOJBswqOQfnLi8tzknMqR4q+ko/4BiML1enPER951hfsLi6ri/
         Y86vTJM1ExLGAXbhDQSyysuGHjk6KBT7UprRAorYWtL/II/HbwAkEHyGdPvYGn+aIrFn
         2fSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773173140; x=1773777940;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DPTwHYGbckptva0R18TL8RRhJ8bcbXMlJm3dcfwo28E=;
        b=bBzH0iD03oigK1tlCZ2q7y8KxIWZEmnnmyfmYeB9jM8D3xV72zVikzQTAEL9KxKR+B
         lKPAWxxlVe2A/oarwQifthS0RpMt4jWxOPNLERzJ4t7+GOXppPYlbJZvPL+nUnfHdxCw
         X6b664s8JOvcHi/5fxG79Tgp5+WzC3y338V8h5zgN8hYoof2U0QZuB8VM2HZMgVXs3n0
         CG7T68hwIRsTbDhp+0htbEbH4gQb8p3wFx7PVh08yLUmJxmVA3sZSiYHW7eRzXugvNsP
         Ehn9OtV+eDA+sws4yjH88GlM5aM/Mvnt7RPezUis/bLBOrX01PGEt8uPzhky9gdK49fd
         g9jQ==
X-Forwarded-Encrypted: i=1; AJvYcCVNW0rtCXuG6hWPCJqkWjT7vZK1iqho7xDZV/h3bIW+ycZOuMa0yZXDCxgMW4h8Rwsq+qJVxRbW13Z5oA==@lists.linaro.org
X-Gm-Message-State: AOJu0YzEgM7TvSjEP9Sa4NxnjptPHaQakVIOfhUOh6oFP8/lMe3/c5jE
	+w6YZLSL9mKTSNZXMv0Q2wJRWQK3tCXN7Gg+ZYR6cUhPwbzXLkliOcAm
X-Gm-Gg: ATEYQzwQgV9pPwJqlOMvaZORWACdH9Zo+xJRP6/G24hhgL6Fev+t0I6dxRtw5AqUYSH
	i11HbKsdVhEOAsotPLlsdQbllmWMURSV6G3HK1RoQls/gvz9AI9RkqAezclUX/QZxnkXOLb7RKw
	4Lptc6H1FTqVl+ispDpy7wJmMkIiqGVpJVFZp6QEveLGAdUQEEavwNLKlpQ68nPdnK/K2QUdS2T
	YRfRT36JaEn7nhnleQGVZYKzK4sDMce1GJc+GBmPHzJBaRA5xV3wVfpNvs3jVZwbj9GLThIoRHu
	AnAEP61c59p3VuZVce+aTZPy48Bgc8N0NjcrU7Cm30aXfLubuq7Wo8NHeKZxpDg96MdcwiWXtYG
	EK8fs6s3bmy4utTs+azP6LhT/KB4fq8NBK8chHlOEAgkXR6Ar16l7YTRCMR1mMCDtzzNTjXQVZY
	G9wdXb9cfEHrekcrVJOPG+VXquglPa0TBzInQSipZFCOKhWz1s
X-Received: by 2002:a05:6a00:3397:b0:823:f96:63bb with SMTP id d2e1a72fcca58-829f721d2bfmr102248b3a.52.1773173139764;
        Tue, 10 Mar 2026 13:05:39 -0700 (PDT)
Received: from hu-ckantibh-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829f6dc2d0asm101660b3a.13.2026.03.10.13.05.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 13:05:39 -0700 (PDT)
From: Sanjay Chitroda <sanjayembeddedse@gmail.com>
X-Google-Original-From: Sanjay Chitroda <sanjayembedded@gmail.com>
To: jic23@kernel.org,
	m.tretter@pengutronix.de,
	mchehab@kernel.org,
	p.zabel@pengutronix.de,
	tiffany.lin@mediatek.com,
	andrew-ct.chen@mediatek.com,
	yunfei.dong@mediatek.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org,
	pure.logic@nexus-software.ie
Date: Wed, 11 Mar 2026 01:35:07 +0530
Message-Id: <20260310200513.2162018-2-sanjayembedded@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260310200513.2162018-1-sanjayembedded@gmail.com>
References: <20260310200513.2162018-1-sanjayembedded@gmail.com>
MIME-Version: 1.0
X-Spamd-Bar: ---
X-MailFrom: sanjayembeddedse@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: XPV6ZVIKDN23COGLRZX5IPQLLQVHWYZB
X-Message-ID-Hash: XPV6ZVIKDN23COGLRZX5IPQLLQVHWYZB
X-Mailman-Approved-At: Tue, 10 Mar 2026 22:17:14 +0000
CC: dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org, kernel@pengutronix.de, kees@kernel.org, nabijaczleweli@nabijaczleweli.xyz, marcelo.schmitt1@gmail.com, maudspierings@gocontroll.com, hverkuil+cisco@kernel.org, ribalda@chromium.org, straube.linux@gmail.com, dan.carpenter@linaro.org, lukagejak5@gmail.com, ethantidmore06@gmail.com, samasth.norway.ananda@oracle.com, karanja99erick@gmail.com, s9430939@naver.com, tglx@kernel.org, mingo@kernel.org, sun.jian.kdev@gmail.com, weibu@redadmin.org, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, sanjayembeddedse@gmail.com, skhan@linuxfoundation.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH 1/7] staging: greybus: simplify cleanup using __free
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/XPV6ZVIKDN23COGLRZX5IPQLLQVHWYZB/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: A23A4258CFC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.09 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx:c];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,pengutronix.de,mediatek.com,gmail.com,collabora.com,linuxfoundation.org,nexus-software.ie];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[43];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.279];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sanjayembeddedse@gmail.com,greybus-dev-bounces@lists.linaro.org];
	FREEMAIL_CC(0.00)[baylibre.com,analog.com,kernel.org,pengutronix.de,nabijaczleweli.xyz,gmail.com,gocontroll.com,chromium.org,linaro.org,oracle.com,naver.com,redadmin.org,vger.kernel.org,lists.infradead.org,lists.linaro.org,lists.linux.dev,linuxfoundation.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev,cisco];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email]
X-Rspamd-Action: no action

From: Sanjay Chitroda <sanjayembeddedse@gmail.com>

Replace manual cleanup logic with __free attribute from cleanup.h. This
removes explicit kfree() calls and simplifies the error handling paths.

No functional change intended for kmalloc().

Signed-off-by: Sanjay Chitroda <sanjayembeddedse@gmail.com>
---
 drivers/staging/greybus/camera.c   | 27 +++++++----------------
 drivers/staging/greybus/loopback.c | 35 ++++++++++--------------------
 drivers/staging/greybus/raw.c      |  6 ++---
 3 files changed, 22 insertions(+), 46 deletions(-)

diff --git a/drivers/staging/greybus/camera.c b/drivers/staging/greybus/camera.c
index 62b55bb28408..14a603ca2400 100644
--- a/drivers/staging/greybus/camera.c
+++ b/drivers/staging/greybus/camera.c
@@ -519,8 +519,6 @@ static int gb_camera_configure_streams(struct gb_camera *gcam,
 				       struct gb_camera_stream_config *streams,
 				       struct gb_camera_csi_params *csi_params)
 {
-	struct gb_camera_configure_streams_request *req;
-	struct gb_camera_configure_streams_response *resp;
 	unsigned int nstreams = *num_streams;
 	unsigned int i;
 	size_t req_size;
@@ -533,11 +531,11 @@ static int gb_camera_configure_streams(struct gb_camera *gcam,
 	req_size = sizeof(*req) + nstreams * sizeof(req->config[0]);
 	resp_size = sizeof(*resp) + nstreams * sizeof(resp->config[0]);
 
-	req = kmalloc(req_size, GFP_KERNEL);
-	resp = kmalloc(resp_size, GFP_KERNEL);
+	struct gb_camera_configure_streams_request *req __free(kfree) =
+	    kmalloc(req_size, GFP_KERNEL);
+	struct gb_camera_configure_streams_response *resp __free(kfree) =
+	    kmalloc(resp_size, GFP_KERNEL);
 	if (!req || !resp) {
-		kfree(req);
-		kfree(resp);
 		return -ENOMEM;
 	}
 
@@ -641,8 +639,6 @@ static int gb_camera_configure_streams(struct gb_camera *gcam,
 
 done_skip_pm_put:
 	mutex_unlock(&gcam->mutex);
-	kfree(req);
-	kfree(resp);
 	return ret;
 }
 
@@ -650,7 +646,6 @@ static int gb_camera_capture(struct gb_camera *gcam, u32 request_id,
 			     unsigned int streams, unsigned int num_frames,
 			     size_t settings_size, const void *settings)
 {
-	struct gb_camera_capture_request *req;
 	size_t req_size;
 	int ret;
 
@@ -658,7 +653,8 @@ static int gb_camera_capture(struct gb_camera *gcam, u32 request_id,
 		return -EINVAL;
 
 	req_size = sizeof(*req) + settings_size;
-	req = kmalloc(req_size, GFP_KERNEL);
+	struct gb_camera_capture_request *req __free(kfree) =
+	    kmalloc(req_size, GFP_KERNEL);
 	if (!req)
 		return -ENOMEM;
 
@@ -680,8 +676,6 @@ static int gb_camera_capture(struct gb_camera *gcam, u32 request_id,
 done:
 	mutex_unlock(&gcam->mutex);
 
-	kfree(req);
-
 	return ret;
 }
 
@@ -870,16 +864,15 @@ static ssize_t gb_camera_debugfs_capabilities(struct gb_camera *gcam,
 		&gcam->debugfs.buffers[GB_CAMERA_DEBUGFS_BUFFER_CAPABILITIES];
 	size_t size = 1024;
 	unsigned int i;
-	u8 *caps;
 	int ret;
 
-	caps = kmalloc(size, GFP_KERNEL);
+	u8 *caps __free(kfree) = kmalloc(size, GFP_KERNEL);
 	if (!caps)
 		return -ENOMEM;
 
 	ret = gb_camera_capabilities(gcam, caps, &size);
 	if (ret < 0)
-		goto done;
+		return ret;
 
 	/*
 	 * hex_dump_to_buffer() doesn't return the number of bytes dumped prior
@@ -893,10 +886,6 @@ static ssize_t gb_camera_debugfs_capabilities(struct gb_camera *gcam,
 		buffer->length += sprintf(buffer->data + buffer->length,
 					  "%*ph\n", nbytes, caps + i);
 	}
-
-done:
-	kfree(caps);
-	return ret;
 }
 
 static ssize_t gb_camera_debugfs_configure_streams(struct gb_camera *gcam,
diff --git a/drivers/staging/greybus/loopback.c b/drivers/staging/greybus/loopback.c
index aa9c73cb0ae5..ae729f744ac5 100644
--- a/drivers/staging/greybus/loopback.c
+++ b/drivers/staging/greybus/loopback.c
@@ -508,10 +508,10 @@ static int gb_loopback_async_operation(struct gb_loopback *gb, int type,
 
 static int gb_loopback_sync_sink(struct gb_loopback *gb, u32 len)
 {
-	struct gb_loopback_transfer_request *request;
 	int retval;
 
-	request = kmalloc(len + sizeof(*request), GFP_KERNEL);
+	struct gb_loopback_transfer_request *request __free(kfree) =
+		kmalloc(len + sizeof(*request), GFP_KERNEL);
 	if (!request)
 		return -ENOMEM;
 
@@ -519,25 +519,24 @@ static int gb_loopback_sync_sink(struct gb_loopback *gb, u32 len)
 	retval = gb_loopback_operation_sync(gb, GB_LOOPBACK_TYPE_SINK,
 					    request, len + sizeof(*request),
 					    NULL, 0);
-	kfree(request);
 	return retval;
 }
 
 static int gb_loopback_sync_transfer(struct gb_loopback *gb, u32 len)
 {
-	struct gb_loopback_transfer_request *request;
-	struct gb_loopback_transfer_response *response;
 	int retval;
 
 	gb->apbridge_latency_ts = 0;
 	gb->gbphy_latency_ts = 0;
 
-	request = kmalloc(len + sizeof(*request), GFP_KERNEL);
+	struct gb_loopback_transfer_request *request __free(kfree) =
+		kmalloc(len + sizeof(*request), GFP_KERNEL);
 	if (!request)
 		return -ENOMEM;
-	response = kmalloc(len + sizeof(*response), GFP_KERNEL);
+
+	struct gb_loopback_transfer_response *response __free(kfree) =
+		kmalloc(len + sizeof(*response), GFP_KERNEL);
 	if (!response) {
-		kfree(request);
 		return -ENOMEM;
 	}
 
@@ -548,7 +547,7 @@ static int gb_loopback_sync_transfer(struct gb_loopback *gb, u32 len)
 					    request, len + sizeof(*request),
 					    response, len + sizeof(*response));
 	if (retval)
-		goto gb_error;
+		return retval;
 
 	if (memcmp(request->data, response->data, len)) {
 		dev_err(&gb->connection->bundle->dev,
@@ -558,10 +557,6 @@ static int gb_loopback_sync_transfer(struct gb_loopback *gb, u32 len)
 	gb->apbridge_latency_ts = (u32)__le32_to_cpu(response->reserved0);
 	gb->gbphy_latency_ts = (u32)__le32_to_cpu(response->reserved1);
 
-gb_error:
-	kfree(request);
-	kfree(response);
-
 	return retval;
 }
 
@@ -573,10 +568,10 @@ static int gb_loopback_sync_ping(struct gb_loopback *gb)
 
 static int gb_loopback_async_sink(struct gb_loopback *gb, u32 len)
 {
-	struct gb_loopback_transfer_request *request;
 	int retval;
 
-	request = kmalloc(len + sizeof(*request), GFP_KERNEL);
+	struct gb_loopback_transfer_request *request __free(kfree) =
+		kmalloc(len + sizeof(*request), GFP_KERNEL);
 	if (!request)
 		return -ENOMEM;
 
@@ -584,7 +579,6 @@ static int gb_loopback_async_sink(struct gb_loopback *gb, u32 len)
 	retval = gb_loopback_async_operation(gb, GB_LOOPBACK_TYPE_SINK,
 					     request, len + sizeof(*request),
 					     0, NULL);
-	kfree(request);
 	return retval;
 }
 
@@ -621,10 +615,10 @@ static int gb_loopback_async_transfer_complete(
 
 static int gb_loopback_async_transfer(struct gb_loopback *gb, u32 len)
 {
-	struct gb_loopback_transfer_request *request;
 	int retval, response_len;
 
-	request = kmalloc(len + sizeof(*request), GFP_KERNEL);
+	struct gb_loopback_transfer_request *request __free(kfree) =
+		kmalloc(len + sizeof(*request), GFP_KERNEL);
 	if (!request)
 		return -ENOMEM;
 
@@ -636,11 +630,6 @@ static int gb_loopback_async_transfer(struct gb_loopback *gb, u32 len)
 					     request, len + sizeof(*request),
 					     len + response_len,
 					     gb_loopback_async_transfer_complete);
-	if (retval)
-		goto gb_error;
-
-gb_error:
-	kfree(request);
 	return retval;
 }
 
diff --git a/drivers/staging/greybus/raw.c b/drivers/staging/greybus/raw.c
index 3027a2c25bcd..60a754b20432 100644
--- a/drivers/staging/greybus/raw.c
+++ b/drivers/staging/greybus/raw.c
@@ -126,15 +126,14 @@ static int gb_raw_request_handler(struct gb_operation *op)
 static int gb_raw_send(struct gb_raw *raw, u32 len, const char __user *data)
 {
 	struct gb_connection *connection = raw->connection;
-	struct gb_raw_send_request *request;
 	int retval;
 
-	request = kmalloc(len + sizeof(*request), GFP_KERNEL);
+	struct gb_raw_send_request *request __free(kfree) =
+	    kmalloc(len + sizeof(*request), GFP_KERNEL);
 	if (!request)
 		return -ENOMEM;
 
 	if (copy_from_user(&request->data[0], data, len)) {
-		kfree(request);
 		return -EFAULT;
 	}
 
@@ -144,7 +143,6 @@ static int gb_raw_send(struct gb_raw *raw, u32 len, const char __user *data)
 				   request, len + sizeof(*request),
 				   NULL, 0);
 
-	kfree(request);
 	return retval;
 }
 
-- 
2.34.1

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
