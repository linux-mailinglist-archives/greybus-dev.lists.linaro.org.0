Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mLPLAcYLjWkCyQAAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Thu, 12 Feb 2026 00:07:50 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F5371283B8
	for <lists+greybus-dev@lfdr.de>; Thu, 12 Feb 2026 00:07:49 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 2CBA03F91B
	for <lists+greybus-dev@lfdr.de>; Wed, 11 Feb 2026 23:07:48 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	by lists.linaro.org (Postfix) with ESMTPS id 905B43F910
	for <greybus-dev@lists.linaro.org>; Wed, 11 Feb 2026 22:02:21 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=EeVUgpIA;
	spf=pass (lists.linaro.org: domain of azpijr@gmail.com designates 209.85.221.49 as permitted sender) smtp.mailfrom=azpijr@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-436263e31abso5229820f8f.1
        for <greybus-dev@lists.linaro.org>; Wed, 11 Feb 2026 14:02:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770847339; x=1771452139; darn=lists.linaro.org;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mHm+4A9zE9vLZYqsBw9MzVdAOAcFoDEVbjmqs7/Amh8=;
        b=EeVUgpIATmVx7nKiVdIFOM189gw3FZO/UHWjEbI+P5zC+7tX6ILtOD0+kLL+wKAtpz
         D8nYw9a7nWh1l6wak7mgsaLIcJdcNGGQJOWPU9GNFHL1oRNcs1U5J4aiaT/qD3iQtapG
         ncH4CYyy4GBcniHgu7hor1E9A2R+w0E9oddVzpIsQK8k70jdi4qr0UWXVePe6M9TnlM6
         jEBO4VdUhNCyE37v6A/eVQIicf9Ers/rqyoC6x5+Hp0gMBury+aJGnOAVyZz8UiV+mEp
         u/kJN9pZZsqKNuuF0mtv+diOpFXYHV0qmkQpapBQDgYPYZIrWFO/g29NdvGbj5ugBrWh
         ui0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770847339; x=1771452139;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mHm+4A9zE9vLZYqsBw9MzVdAOAcFoDEVbjmqs7/Amh8=;
        b=d9hxUSuIAfdUP6jci7Ry0HxqA4F03crQuqruJCc8whFyopfoj4nk4psiYkLFimGYU0
         AI67/dju08spIuhDngVBormC4Sr1eSynKZXyVcUbz8TBJd9mV05R4gtf88GxLiIiGbwo
         LNsPtxFT+PKQMLj0idEVv9X3bIM5hxNk7uoTvZOKoRVep4NX0WJ3PxpcMqjMTIEpx79Q
         gUzVtDaUm7IWJ3bFhrbKZJSYWJ3opQJol+JIQjWwRbG/VqDpxIZU7LFf63pT565Wh+rm
         /OgnQZypJ7qin9IKHJn7kjFjU/b6ZVzXANsYnBMtIYro77nxmdBSZkrKTuFW2RFNR4eH
         VSTQ==
X-Gm-Message-State: AOJu0Yw0U6ZzlqBK6ueuiNQ5iPnOQjGy5SrKgvr1jbqxGxvCHCm9/v+1
	a1WtAFOFIz0dA5wWOYkVoU7bT9tE7570RdGHmbBQQ5v5AfbHheuAjYuydrXImSPr
X-Gm-Gg: AZuq6aJGVMImvQOHIstsvZUoaAylIUeKppyt1yLguN3oeGnm4jpPMNWczuSjymWNm3A
	PdfHjRHdBxkpMiIGG4wcqrt+oWCSxeqDxMVOuR2siQSKHoRMiXpJApo2LJHblNZgZT5CqtvSRKh
	fEsosFTx8ss9x+KmkzOgQLloXEPdXjiaIFY0YAlZBPlNFeG3+GKaZoDe7WP78pIUQyv0j13Tp2v
	yKNauRX+zpe+bd5YCyXAyjR5+GUOBR2H/Ufx4lp6M20bGtKZRUoNwNYTNaTcz3kS8o7u6TPjSCp
	C1U09Qk8Hi/YEJzN5OQ9VyR0z1VzxU7tDV/rdlYVwRRk+omAaKVTpr/xZ6Q8lGYZX3FHjqMbxwa
	hx2mBNa6hZ31nAgVNduVNwLyJAZQtS71RpZ85lig2pJtuqYMtqP4WYaaEZiECeQKDZDQ7Paa6Ts
	bTzX6D1msDEOuIk4XxeEU1Ygo=
X-Received: by 2002:a05:6000:2407:b0:436:34c0:c9c8 with SMTP id ffacd0b85a97d-4378adc9cbfmr1276817f8f.60.1770847339219;
        Wed, 11 Feb 2026 14:02:19 -0800 (PST)
Received: from localhost ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43783d30f6dsm6859873f8f.3.2026.02.11.14.02.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 14:02:18 -0800 (PST)
Date: Wed, 11 Feb 2026 23:02:17 +0100
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
To: greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org
Message-ID: <aYz8aUyx9W_IZD3F@fedora>
MIME-Version: 1.0
Content-Disposition: inline
X-Spamd-Bar: ---
X-MailFrom: azpijr@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: BV44C3HUVEBEMRMDXKZVQ6SI3HIOKTYK
X-Message-ID-Hash: BV44C3HUVEBEMRMDXKZVQ6SI3HIOKTYK
X-Mailman-Approved-At: Wed, 11 Feb 2026 23:07:44 +0000
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] PATCH 1/1: greybus/usb: handle unspecified lengths in hub_control
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/BV44C3HUVEBEMRMDXKZVQ6SI3HIOKTYK/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.09 / 15.00];
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+mx];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[azpijr@gmail.com,greybus-dev-bounces@lists.linaro.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_RCPT(0.00)[greybus-dev];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 5F5371283B8
X-Rspamd-Action: no action

From 1e099b581fe475905509b9d600015ea2500b8cf8 Mon Sep 17 00:00:00 2001
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
Date: Wed, 11 Feb 2026 22:54:40 +0100
Subject: [PATCH] greybus/usb: handle unspecified lengths in hub_control

Fixes the FIXME in hub_control where response length was not handled correctly.

Signed-off-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
---
 drivers/staging/greybus/usb.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/greybus/usb.c b/drivers/staging/greybus/usb.c
index 475f24f20cd4..f5f5a4863ddc 100644
--- a/drivers/staging/greybus/usb.c
+++ b/drivers/staging/greybus/usb.c
@@ -105,8 +105,10 @@ static int hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue, u16 wIndex,
 	size_t response_size;
 	int ret;
 
-	/* FIXME: handle unspecified lengths */
-	response_size = sizeof(*response) + wLength;
+	/* Calculate expected response size */
+	response_size = sizeof(*response);
+	if (wLength)
+		response_size += wLength;
 
 	operation = gb_operation_create(dev->connection,
 					GB_USB_TYPE_HUB_CONTROL,
@@ -127,9 +129,13 @@ static int hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue, u16 wIndex,
 		goto out;
 
 	if (wLength) {
-		/* Greybus core has verified response size */
-		response = operation->response->payload;
-		memcpy(buf, response->buf, wLength);
+		size_t actual_size = operation->response->payload_size - sizeof(*response);
+		size_t copy_size = min(wLength, actual_size);
+
+		if (copy_size) {
+			response = operation->response->payload;
+			memcpy(buf, response->buf, copy_size);
+		}
 	}
 out:
 	gb_operation_put(operation);
-- 
2.51.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
