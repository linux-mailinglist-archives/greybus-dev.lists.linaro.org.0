Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CQapNHYHNWrJmAYAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Fri, 19 Jun 2026 11:10:14 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id AD8D26A4DE6
	for <lists+greybus-dev@lfdr.de>; Fri, 19 Jun 2026 11:10:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=gmail.com header.s=20251104 header.b=jCpoeIP1;
	spf=pass (mail.lfdr.de: domain of "greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org" designates 44.210.186.118 as permitted sender) smtp.mailfrom="greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org";
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=gmail.com (policy=none)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id CAFF940AD5
	for <lists+greybus-dev@lfdr.de>; Fri, 19 Jun 2026 09:10:13 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	by lists.linaro.org (Postfix) with ESMTPS id 4B83440503
	for <greybus-dev@lists.linaro.org>; Thu, 18 Jun 2026 11:52:05 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-36ba706ab46so603607a91.1
        for <greybus-dev@lists.linaro.org>; Thu, 18 Jun 2026 04:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781783524; x=1782388324; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=68gXZfD1gBuTwbquY8yba7YhjUaYXF2kbvv+sF5ZODs=;
        b=jCpoeIP1i3uWjlrKyZeTd5pu/UFMwWzm/d4F1EYAnL2eTiWYSZITTv0hCHtwcS5yMK
         193QhGFUNwLlVuV7jFZKwv2vQpgMqZDOSu+0T1W6lrVsNtgTHY/LGyaCzMqVtssuRV86
         0moznRffj5KdkrGHAb+8mEoppI3xnYmyRg9fJ8b29eSgQw6H5iYSK0KSV+V0PAvvE8wd
         woEfqGZqbg5MxAN8Vx6a4Ol/OzNn6R8/OB9ADFjRDTHezItHANnsq8LY173w/e+XXdN6
         AF10K+Hk62E9635sVxgK01dZH0maxRc6dIAxLhe946WJ6fzZrHFxoUGiYTBg83PLUixf
         bPGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781783524; x=1782388324;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=68gXZfD1gBuTwbquY8yba7YhjUaYXF2kbvv+sF5ZODs=;
        b=LPlpaRpbU9iAPVEAewhBoLUSGzodW/4Rn8m5XjR36rMO9QqEZNcts3da0QHd/wpGtO
         PNnJ5oKVNU4je8TUwgzd8bNwE5QAY8cfwWn0VlyIQBG92KB4pVlwCgScLhLDEKo5l8Q8
         ulomwubo/te3lmbxfAcFOJBYTskwKQ49QUv7G5Vhg9iL6SwTX6XQ+kG6jlRzlv4QfR4t
         mO2T4VBp4YMSJcyLNINp8XvKvZcKAKBpoxtdGQFbhSX4CsN+F8Z52AyRUNjHCMij5aLh
         BXWeO/BFktUw6YXPfxnKq44Vti8U9P0C11wDqKjO6IXS9QsHE3tpIlJZp8X1hluXpa5I
         UyLA==
X-Gm-Message-State: AOJu0YwVMECcdcNhfAK218D0Nd2+B415AINxv/Q8yHGlxVukaVaYe1M7
	7dilGaN2Zhr+xxceXkRUy/A4ZubuF7UNKN7T0z/nRklXJFfOcZzvU8JizbvYKqEkO4k=
X-Gm-Gg: AfdE7cluvV8dIv+r2C3BIX6UteHD44md7cJdl5hlqSeMD+0Jy4qNo3q0RBbqHn1iNoj
	g45suRhtouKzdGfdqqI/CoZldbtfQlhvtpP6AnLPInT0Egxdvc07LwK1gGdNX/3f/c1C2dfbdHG
	gOkXOkr9bjjVBNfBO/R0yBckdfm7N2bv2A9hHM4pDeyNQm4Ac1+1Be3dExK54HR670mZVOPUStv
	D3Y/8SE8xIjocPh87UNo+FELeOrP35aSGZugYK3joMJsUCk2Lk8HtRYc6gAO5KM6ppzqJnDfqh+
	qzsTjdQPUuA1u9Xt9Wwi4pM0T8EkMxC4Uke4eQYK5ptWSapuoVBj6fUQYFov7SQMEeNHkKQWA7h
	0x3YAuUcYzbNyXK1EbtOErmuLN4UpRVts9tWoF8dHLdJhTNyFDQRoyfZuSrrUxzq8/qBz3S7SaV
	z8VexZOlDfv5P1XVFJnMnvjm5Qrj/ToFtsxeEJ+IX+pxDtwOTjFbPJvBueXQTx0DGYAmbwcu/B+
	XVOGDmq9uEdjSkbExG2YcGlb8HltED0PtmV0w==
X-Received: by 2002:a17:90a:d44b:b0:36d:e051:7b6a with SMTP id 98e67ed59e1d1-37c9366d76amr8306915a91.12.1781783524330;
        Thu, 18 Jun 2026 04:52:04 -0700 (PDT)
Received: from localhost ([103.170.55.173])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37c70aa47f0sm6346133a91.13.2026.06.18.04.52.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 04:52:03 -0700 (PDT)
From: Alfie Varghese <alfievarghese22@gmail.com>
To: elder@kernel.org,
	gregkh@linuxfoundation.org,
	johan@kernel.org
Date: Thu, 18 Jun 2026 11:34:39 +0000
Message-ID: <20260618113439.569-1-alfievarghese22@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Spamd-Bar: --
X-MailFrom: alfievarghese22@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: 3F3W7XOOSW7LNCB2UNHVQB56UYYDG2BW
X-Message-ID-Hash: 3F3W7XOOSW7LNCB2UNHVQB56UYYDG2BW
X-Mailman-Approved-At: Fri, 19 Jun 2026 09:10:06 +0000
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Alfie Varghese <alfievarghese22@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v2] staging: greybus: vibrator: return device_create() errors
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/3F3W7XOOSW7LNCB2UNHVQB56UYYDG2BW/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.59 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx:c];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:elder@kernel.org,m:gregkh@linuxfoundation.org,m:johan@kernel.org,m:greybus-dev@lists.linaro.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:alfievarghese22@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[alfievarghese22@gmail.com,greybus-dev-bounces@lists.linaro.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alfievarghese22@gmail.com,greybus-dev-bounces@lists.linaro.org];
	FREEMAIL_CC(0.00)[lists.linaro.org,lists.linux.dev,vger.kernel.org,gmail.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	TAGGED_RCPT(0.00)[greybus-dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AD8D26A4DE6

gb_vibrator_probe() maps any device_create() failure to -EINVAL. This
loses the real errno returned by the driver core, such as -ENOMEM, and
makes probe failures harder to diagnose correctly.

Return PTR_ERR(dev) instead so callers receive the actual failure reason
while preserving the existing cleanup path.

Signed-off-by: Alfie Varghese <alfievarghese22@gmail.com>
---
v2: No code changes, resending as a single properly versioned patch.

 drivers/staging/greybus/vibrator.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/vibrator.c b/drivers/staging/greybus/vibrator.c
index 0ec4d317c9db..763c234fbc03 100644
--- a/drivers/staging/greybus/vibrator.c
+++ b/drivers/staging/greybus/vibrator.c
@@ -161,7 +161,7 @@ static int gb_vibrator_probe(struct gb_bundle *bundle,
 	dev = device_create(&vibrator_class, &bundle->dev,
 			    MKDEV(0, 0), vib, "vibrator%d", vib->minor);
 	if (IS_ERR(dev)) {
-		retval = -EINVAL;
+		retval = PTR_ERR(dev);
 		goto err_ida_remove;
 	}
 	vib->dev = dev;
-- 
2.53.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
