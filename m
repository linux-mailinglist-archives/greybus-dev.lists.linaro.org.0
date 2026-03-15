Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iAFhGoP8tmnvLAEAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Sun, 15 Mar 2026 19:37:55 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 4794B291F30
	for <lists+greybus-dev@lfdr.de>; Sun, 15 Mar 2026 19:37:55 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 59ECE3F907
	for <lists+greybus-dev@lfdr.de>; Sun, 15 Mar 2026 18:37:54 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	by lists.linaro.org (Postfix) with ESMTPS id BB3CC3F6DC
	for <greybus-dev@lists.linaro.org>; Sun, 15 Mar 2026 18:21:21 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=dC5np7s5;
	spf=pass (lists.linaro.org: domain of oaroraetimis@gmail.com designates 209.85.128.51 as permitted sender) smtp.mailfrom=oaroraetimis@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-48541edecf9so41292775e9.1
        for <greybus-dev@lists.linaro.org>; Sun, 15 Mar 2026 11:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773598880; x=1774203680; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NzCLqV+L/stnitiVkEIjw4/HzxboUMGBqtCNLkqpAfI=;
        b=dC5np7s5OnQjIZQRKrpI09jQTR1ORh+Q2LKCTMFqGhYbjwdE54CyW3pigjTrbY4UjT
         yNiKp9bPyfPPRy/QIy3kYVDURopfpTCP6kSTVAvvmwr3mFKekxIpRQ0p+nGK/vBQswAN
         SqYYTU84GXF64t6JTlRtYwDR3sXbQ8N5YzbjpuT+2QXxndV9AM6DXtuftQ+qwPJMWnbr
         AukRb6Yt0aTzBYMULdTFRKx4w+UCOR9rymhBdzVXj8kpDdw0LKUvUr0BRH/pnfxpaBsf
         s6x5NagZI18YnlgTfsFJlCZcYEPY9Dn+iBcYdnlLFghQj/7eLy29iA4CJj51ojUMToR4
         9hjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773598880; x=1774203680;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NzCLqV+L/stnitiVkEIjw4/HzxboUMGBqtCNLkqpAfI=;
        b=sYxRTZ1fjkWQ+lzMpXwTV6n+NfQleHP2jfhnOx+40ezXYDjLu+sdwrVj9vqFGhEgHV
         QKL1manKP6nwRDKJlPd7JlH5dGnZkW+M7STCWm9ivmcA/5YWWUu68G9/VUrnTu7DflsT
         f21kDrLD/Nt5rsOtdZKga3gGZz8OZTEssRQF5QpXsdjDypHRYpQzbPKYREBo+FtjCnI9
         8Vks9xrfRJbSLgDMsJy0ZTIMR9uAtHbp0wxiu789TRzFDvWgxkiIbhDBXji1CfWyn3Wp
         3Ir2fCP5nNqK5DTAc4lESTgvQZVyjTTzIBhLELvSHF8CyNdexRLP5GnCGDpkk8Um/U1H
         LWKw==
X-Forwarded-Encrypted: i=1; AJvYcCVdBRGozN5JzznuUzj9/G1wUslNqRafHTemnEWBHbwvUJTxf/qM6eUE0xNgaQHWWUL+5tf5QwT0nMFjIg==@lists.linaro.org
X-Gm-Message-State: AOJu0YwVY1alE8FDPtCDDJN0vbwVvNufw32lFMVAZ+CxfZlmP9EVbvE8
	ZQcwTL9LqS/4l7qwwKAC8kcNA0e80xNIgJbrH9f+OnTqKLx5HAPqvZFb
X-Gm-Gg: ATEYQzyrGxhJIIBqYhiHbvtpbENF85um6iCfuCsA03RNLBQRFr2uXRZcY7pwUAnWOIH
	JVJfQyKdKYbWqKnvBxqw+iLUXi3KEfks9S670YhTsTGjZ72koVK6OEVg5ZlFncQM0UovRUTh3zR
	t4elFXOYbkFgGeskZUBKn9Jbhq//6fXcYLWtHnEJ4suy4NNmAaFJ8PYwRSLfi6HibCymYAoIlQ6
	x9uiVJHxM2uyb7HJMwqoQqtyajVXBIvF9s1bD+s1m8CmYKGYPNW7QlS5rOmYsWBpEyQ1qkhXdpk
	0pRURR9TKbF+o4t4lBGCjijyPOWSEilhvSkXFKlAeljdLRNsRrq+rgVWElQF8zYbrkor0ePQX7j
	2jogVSwbCZnK4uwfarxEdG0jZlz+w33Uyr9OvHJu7poNmR6Tk2xZ8iB9+854MlxYV0W2hG7xhox
	bDhP0T78umSB2dCOniKcA+xqbaGP1GR27MpzOzxL/KALRfSa0Ufz8EYGY=
X-Received: by 2002:a05:600c:8b72:b0:485:3c2d:d02b with SMTP id 5b1f17b1804b1-485566f7a1bmr159928615e9.22.1773598880173;
        Sun, 15 Mar 2026 11:21:20 -0700 (PDT)
Received: from OaroraEtimis.tail60902c.ts.net ([2408:8956:4c20:952e:71d2:7185:4299:35a7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48557a74266sm69575815e9.17.2026.03.15.11.21.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 11:21:19 -0700 (PDT)
From: Oarora Etimis <oaroraetimis@gmail.com>
X-Google-Original-From: Oarora Etimis <OaroraEtimis@gmail.com>
To: vireshk@kernel.org,
	gregkh@linuxfoundation.org
Date: Mon, 16 Mar 2026 02:20:28 +0800
Message-ID: <20260315182028.133028-1-OaroraEtimis@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: --
X-MailFrom: oaroraetimis@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: 37KS26DXV66RNIDCUGNIGW7KDJXLR2OY
X-Message-ID-Hash: 37KS26DXV66RNIDCUGNIGW7KDJXLR2OY
X-Mailman-Approved-At: Sun, 15 Mar 2026 18:37:49 +0000
CC: johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Oarora Etimis <OaroraEtimis@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] staging: greybus: bootrom: fix potential null pointer dereference
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/37KS26DXV66RNIDCUGNIGW7KDJXLR2OY/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [1.59 / 15.00];
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	MID_CONTAINS_FROM(1.00)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx:c];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,lists.linaro.org,lists.linux.dev,vger.kernel.org,gmail.com];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	FROM_NEQ_ENVFROM(0.00)[oaroraetimis@gmail.com,greybus-dev-bounces@lists.linaro.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_RCPT(0.00)[greybus-dev];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_SPAM(0.00)[0.688];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 4794B291F30
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

In gb_bootrom_get_firmware(), the 'fw' pointer could be NULL if the
function jumps to the 'unlock' label. The execution flow continues
into the 'queue_work' block where 'fw->size' is accessed, leading to
a null pointer dereference.

Fix this by adding a NULL check for 'fw' before accessing its members.

Signed-off-by: Oarora Etimis <OaroraEtimis@gmail.com>
---
 drivers/staging/greybus/bootrom.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/bootrom.c b/drivers/staging/greybus/bootrom.c
index 83921d90c322..50c80475d241 100644
--- a/drivers/staging/greybus/bootrom.c
+++ b/drivers/staging/greybus/bootrom.c
@@ -298,7 +298,7 @@ static int gb_bootrom_get_firmware(struct gb_operation *op)
 
 queue_work:
 	/* Refresh timeout */
-	if (!ret && (offset + size == fw->size))
+	if (!ret && fw && (offset + size == fw->size))
 		next_request = NEXT_REQ_READY_TO_BOOT;
 	else
 		next_request = NEXT_REQ_GET_FIRMWARE;
-- 
2.47.3

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
