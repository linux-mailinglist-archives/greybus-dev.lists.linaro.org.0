Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uIDjC4cbjmlK/gAAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Thu, 12 Feb 2026 19:27:19 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id AD0731303E3
	for <lists+greybus-dev@lfdr.de>; Thu, 12 Feb 2026 19:27:18 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 701823F700
	for <lists+greybus-dev@lfdr.de>; Thu, 12 Feb 2026 18:27:17 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	by lists.linaro.org (Postfix) with ESMTPS id BF3063F85E
	for <greybus-dev@lists.linaro.org>; Thu, 12 Feb 2026 17:53:30 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=JPWyBkMT;
	spf=pass (lists.linaro.org: domain of azpijr@gmail.com designates 209.85.128.50 as permitted sender) smtp.mailfrom=azpijr@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4834826e555so1054875e9.2
        for <greybus-dev@lists.linaro.org>; Thu, 12 Feb 2026 09:53:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770918809; x=1771523609; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=17Xdzme54kplG7FjpS4Eo2pRn6CepEeazU/JbB6exrw=;
        b=JPWyBkMTM1QDi+uFsTez2he5gWHel0BHtWu15U72sYfVeDM6r3yvAXHvE6cO0uTxZF
         f0OKbxNmaDzv98e3yCcAWQ373sS+kRCA9WlFgloRMmUZ6u9JGRck8vsK5r9ATxXWmodQ
         chmEB/4+z8NbV56U1sWg1kstQVDBqnCBDQ8iFdEszWDB77BIJx+++jMWWFb+R1fDYTpd
         uu++tuaT28g5ytHgKImpnXR5UnmJBxCpXwJz8Zq5Dz0CNkZsL8aHOLBYUiXTQb3pItjF
         aqn3NcFSHkX5QRPte+nam30dFmCMzX6JaTcZqXu5O9EklIxMUFs8dVqLtkcrn1ptFMPv
         Vb5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770918809; x=1771523609;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=17Xdzme54kplG7FjpS4Eo2pRn6CepEeazU/JbB6exrw=;
        b=Ju7WQNBljUJCRNIVjtXpZOyBseNTNzf5PcsrRRUFbzak/BRPbWcIH6iaeRZ//13w1H
         xFaFt65QWDnZQNf3LC2apA3fWhUT9CXEQqS1+ivxZRTNxqesYEgEjJlmojS3awHguvnm
         OjIJf1VxpF8tdiWhcMe6a78Arg7Yz0UyzRK4wSQ4pO9rtBeJNjk51yuiJzY7ByoKuB5A
         zXtpDg4A9YpkNt5VI0lpdAmEGCX3K8pGdoQVbufzjEUunAd7ex30mw1akswdgCs4esnU
         QOied37jmzteN1wIyHs74p0cWaqpzMGjdPRZw9FEsLlH0dRrGbTpRFN+kohdr6XLDWB3
         NDVw==
X-Gm-Message-State: AOJu0YzB8GAz44GJZZ/EvYbFEFTjELoOioeQATXI4Qn+Lnp5DYYctDpg
	/C/Nz5yLTZC29aekoUQrITQb/S6MyDjctGM9Ws916pa5MJdVu/5F2M7E+yy8CAF2/+E=
X-Gm-Gg: AZuq6aKdsNe1u4czjpBsqT++XMoH6fDHuEz4NMDly6H9084Ab7iuy/IvfyLea2iBUra
	Im7GAts/rGmOo8K6J14eSfmF86pPg0RuJa+1KoatHx/XpImXUzMSji9e7n2P78LYogLZx/RFto+
	5DsZ7rU7ccEKLnFe14KNB2UEWWgce/6v7kdLRGQaFyoxIWtb42k+UVL09HAI+PXw3Y1HsVqWega
	AX3yrtseNsfAp641K10FxTQfvpzfp8IkodybGUZo/Uwp17J8w+KAfyEmaNqqcudWh8rTAbhLYS0
	JdnWs54W+eHkwAJlCKe7pk1frL3T9UARza4YnFMSTFS84gyp8MpIFSDm680+BP28xf/x2VHBXHt
	BZ9ZDw3jAcR6QpgoqK2VCprYFancddKfs9HRUyQXdlfG+XWPnOu4FxdAnDTEnBEAlLZj9hccOu/
	dVMszev3lHKZ5wYW+C/pw=
X-Received: by 2002:a05:600c:82c3:b0:477:639d:bca2 with SMTP id 5b1f17b1804b1-483656b07efmr51842465e9.4.1770918809090;
        Thu, 12 Feb 2026 09:53:29 -0800 (PST)
Received: from fedora ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4834d5e11f5sm196115015e9.4.2026.02.12.09.53.28
        for <greybus-dev@lists.linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Feb 2026 09:53:28 -0800 (PST)
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
To: greybus-dev@lists.linaro.org
Date: Thu, 12 Feb 2026 18:52:32 +0100
Message-ID: <20260212175252.17960-1-azpijr@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <2026021222-fondue-celtic-0e2a@gregkh>
References: <2026021222-fondue-celtic-0e2a@gregkh>
MIME-Version: 1.0
X-Spamd-Bar: --
X-MailFrom: azpijr@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: YPZWUD5Q6VLUZOYW6MH7IM66LKSDDMQN
X-Message-ID-Hash: YPZWUD5Q6VLUZOYW6MH7IM66LKSDDMQN
X-Mailman-Approved-At: Thu, 12 Feb 2026 18:27:15 +0000
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v2] greybus/usb: handle unspecified lengths in hub_control
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/YPZWUD5Q6VLUZOYW6MH7IM66LKSDDMQN/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.59 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+mx];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FROM_NEQ_ENVFROM(0.00)[azpijr@gmail.com,greybus-dev-bounces@lists.linaro.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	TO_DN_NONE(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email]
X-Rspamd-Queue-Id: AD0731303E3
X-Rspamd-Action: no action

Fixes the FIXME in hub_control where response length was not handled
correctly.

The previous implementation always added wLength to the expected
response size, even when wLength was zero. The code also copied wLength
bytes from the response buffer without validating the actual payload
size returned by the Greybus operation.

Compute the response size starting from the fixed header and only add
wLength when it is non-zero. When copying data back to the caller, clamp
the copy size to the actual payload length reported by the Greybus core.
This avoids copying more data than what was actually returned by the
Greybus operation.

Tested by building the driver and issuing hub control requests with
varying wLength values (including zero) and verifying correct behavior.

Signed-off-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>

---

Changes in v2:
- Document behavior when wLength == 0
- Clamp memcpy() size to actual payload length
- Add testing notes
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
2.53.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
