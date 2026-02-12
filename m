Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wOtwGo4bjmlK/gAAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Thu, 12 Feb 2026 19:27:26 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FB041303EA
	for <lists+greybus-dev@lfdr.de>; Thu, 12 Feb 2026 19:27:26 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 4C27C40160
	for <lists+greybus-dev@lfdr.de>; Thu, 12 Feb 2026 18:27:25 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	by lists.linaro.org (Postfix) with ESMTPS id AAC813F90B
	for <greybus-dev@lists.linaro.org>; Thu, 12 Feb 2026 18:23:12 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=k0FcZnZp;
	spf=pass (lists.linaro.org: domain of azpijr@gmail.com designates 209.85.128.47 as permitted sender) smtp.mailfrom=azpijr@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-47ee07570deso1423285e9.1
        for <greybus-dev@lists.linaro.org>; Thu, 12 Feb 2026 10:23:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770920592; x=1771525392; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=17Xdzme54kplG7FjpS4Eo2pRn6CepEeazU/JbB6exrw=;
        b=k0FcZnZpUmRDHWZwVdA+t1+5u2w146MhXIhDBHQEuAQWD41I/i7/cVVhyXUXRPb6Y7
         AKj7TKP995wgzmbW1ciZrx2q/rOJ6U6QNnX76a1gFr56/rchUZmUitDYgw7TmM5lhErk
         rDJMtfFUPmy5rC68lBEmEAyzsK1y/CMUh7TrUAidoQJVzbgHCnorWI88195nWxxOsXH2
         nsYl6QL0FjIchu/8GjdAPmzNcfQV0bMEaURv4CM5OlNKWEbJw+O3hvgLDOHWMZRwezvB
         4Qkr5JlgJHAo/Oq5WnEP2PVyowZMo+lSvK/HyLeoUqluXFQJVfe87/Sjpp4HXgPwX7I5
         sWAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770920592; x=1771525392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=17Xdzme54kplG7FjpS4Eo2pRn6CepEeazU/JbB6exrw=;
        b=Y6v3+Ho3f5X4uyEszpDHWt165nHKKU2Z79r6WxOfMN1ZaLWneXI4Rnq23l5tE1V5t9
         rUJluWaYihWjkMPQYpSLVKLSRaRgSu2chpra2THuFO4RnDQPnNuSOUPnKTDS+XLbaW06
         oEC2PC+z+P9OE43VuzxGzXeXjA6hisihEaU43qINyzclZ4QRFosqeBv6k5d3PBBWISWj
         Z9C+yYZX70BwWguVxsInHow1PzpyiMuPwrEeBlkQUDp7m8xON0UiHkLMrPfWp5AkW/oZ
         uiFNC+fx2uU6SlLdBN0gCc+GPsiA5AU2c6JA0te3SFpUsIX7+XJQotkOIfIvyyJ9yW4A
         BHmg==
X-Forwarded-Encrypted: i=1; AJvYcCXExMqf3CSQY5sSXIyBaCYOZEJxQ7tsqFysU4P8TOgpyVsrrolALM5zdy/72mxTymAZjBTmUi5PLgzIGQ==@lists.linaro.org
X-Gm-Message-State: AOJu0YwXlVYMdIt0Zmvh9CzZ/GoXsLO6N4mGOSDxm5IC6eJTsq2Dva9n
	1jXbbX0hGOaGzpvDQd7lLd95YI288oXNqe6ovMysXPQ9kPZpFYl1ZvBo
X-Gm-Gg: AZuq6aIAMJHQc/9gohbyXvL3y/gm82UxN50P1eEb8aAig1E9xRZg2TYLL8KLxDoWaw5
	qRv8bv4fPTLj2Im5eunopwb8/OQgtQKSpIkZ53emCzx39k38voxN5MAzG6GFrvcW67DUCFFpacA
	+l2Uwc3qFWPpiliG8kuyzHUVpEp/x9W2eQixKVmH0tPFO33eV1dnD3lRIseX0ysEZdKi3CQDUQ4
	Fbgcy9ZdrJr0QERdL1tsuLQ49qr5cbcp97exMxhgKnVVVyI4CDePE5GXBLFXKV62ngWG703+wYr
	AZIHJjyx3Ux7H4MzAH1W2EibjxVVWZAbMGHC0t1E3FCcIKD+fIR+uW0byhSs6O/Wsnsto7YV9xM
	zrd/d1mtV7AaQwVbCS1q/NazkAXWsughfky4FYIO1omzLdOJU85q9ESQ8QA6kxpbghs8EIC+Vd9
	EERv/mU8t3USH6cZUwlVo=
X-Received: by 2002:a05:600c:3b8b:b0:480:1c10:5633 with SMTP id 5b1f17b1804b1-4837103f4dcmr525325e9.26.1770920591530;
        Thu, 12 Feb 2026 10:23:11 -0800 (PST)
Received: from fedora ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4835dcfafcdsm226953745e9.9.2026.02.12.10.23.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Feb 2026 10:23:10 -0800 (PST)
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
To: gregkh@linuxfoundation.org
Date: Thu, 12 Feb 2026 19:23:06 +0100
Message-ID: <20260212182307.23777-1-azpijr@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <2026021222-fondue-celtic-0e2a@gregkh>
References: <2026021222-fondue-celtic-0e2a@gregkh>
MIME-Version: 1.0
X-Spamd-Bar: --
X-MailFrom: azpijr@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: KBIE7WXFC3OSKD3USLAKAHYNFTSRTSKN
X-Message-ID-Hash: KBIE7WXFC3OSKD3USLAKAHYNFTSRTSKN
X-Mailman-Approved-At: Thu, 12 Feb 2026 18:27:16 +0000
CC: azpijr@gmail.com, greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v2] greybus/usb: handle unspecified lengths in hub_control
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/KBIE7WXFC3OSKD3USLAKAHYNFTSRTSKN/>
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
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx:c];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[gmail.com,lists.linaro.org,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[azpijr@gmail.com,greybus-dev-bounces@lists.linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email]
X-Rspamd-Queue-Id: 3FB041303EA
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
