Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oPl3OXFX82lfzwEAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Thu, 30 Apr 2026 15:21:53 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id B33314A35F4
	for <lists+greybus-dev@lfdr.de>; Thu, 30 Apr 2026 15:21:53 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 5CF80406EF
	for <lists+greybus-dev@lfdr.de>; Thu, 30 Apr 2026 13:21:52 +0000 (UTC)
Received: from mail-yx1-f68.google.com (mail-yx1-f68.google.com [74.125.224.68])
	by lists.linaro.org (Postfix) with ESMTPS id 69ED53F912
	for <greybus-dev@lists.linaro.org>; Thu, 30 Apr 2026 00:22:24 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=RGrvgHxT;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (lists.linaro.org: domain of sonionwhat@gmail.com designates 74.125.224.68 as permitted sender) smtp.mailfrom=sonionwhat@gmail.com
Received: by mail-yx1-f68.google.com with SMTP id 956f58d0204a3-64eb84d1e37so259666d50.2
        for <greybus-dev@lists.linaro.org>; Wed, 29 Apr 2026 17:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777508544; x=1778113344; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZCJerECtiCXIBCz7zgU9qCjidNXdZcf6eEV/QCLYq+A=;
        b=RGrvgHxT+misZ2oWTuWi+SRTaovGfsWud7Tgv9jaL352dSZL2RzXQX7zYaE1k+qTTd
         Kaq1o6Yfj80Ik4XH2MxqMqV7uyFP5iJrifKn26/ZmkRHsqo/4eXaOch/vfo5zP+aXHn8
         3kJhx49zrFnNoRkHdA501WcEVMVV+QGKYbSqRwv3HkvTnoqFOze7WE/+mc0goNPoTGrC
         5BNhM1OGxcLql2QEUw4w0BImcaWndwMGACUN+eIGy9s10cByHhbJVFU5FMTciH1KJ/K/
         8WBmspAr71gy2KZ9rDOxfV5jDjF3zexTOz8Losji9MYGc1//obTkwhpXirxNzALEv9u9
         cmcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777508544; x=1778113344;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZCJerECtiCXIBCz7zgU9qCjidNXdZcf6eEV/QCLYq+A=;
        b=gz9SHhUy3zLk6Hkb+funzNFGGtknAeT7hvvrqhWRJGVmZSDPXmCeg/CXX6roQ0e9vj
         PUlGJUPJmRgzSze/cbqj3GLVSZ5VUqON2yJWokIrU4m+OS8DX8hFEvioyau4GXdRBlml
         DSiBmjkKUREIiM9ROD+hcjrxaMbWMzQcARriT6M4rKqa0C0XoSeB+dEoDkePHNkC6t02
         taJVQcI21nO3GFCzNd7Tvz2QQy7xX0888Rl87+/CdWUXdNzYLLvklYaIGayfKmfqRcwL
         gCbOqNC+hbXqr4LzBF6x+uXu7nqYHEVA2fktyryc+FWwRreqmGeg1NmqwbzitOalER3V
         9mDg==
X-Forwarded-Encrypted: i=1; AFNElJ/s+4cBqJrnZEnfkeNvtENrq03+UuaDN+LBWvn4Jr4w3147RIJYKUwj4lTIBOoS7BjUDV6Supj+uRhdmA==@lists.linaro.org
X-Gm-Message-State: AOJu0Yx3JUxfFTnpBcxuHeO6vZAFuLOc8V+4C8tVmGM3apx8nocLIOEd
	OjOcWzYq2McMMkxujlutBpGo7ldyqz3RuJUoaaFKnTJVAR8gfV9URkyt
X-Gm-Gg: AeBDievVWH0kwZ7CW/OWA9t/xZ4s8/9p5metIbjVC4dWDQboaZO5vSHx1VzPvTuFouq
	s2hSmx4K317HpDebLsui6PsDWZl/Q4NOzaWI3IyOtGJXzLL7NXEe9AejiklcVPErM81+dV4r9n6
	GkgKjqZ8fEHI0mwRGKVV4flQbWl8zTShxdCzUEqkLLRiEcp2ZbXJ+ApOQLk/Ala0+F8FJNlhd2a
	EtTlQlvPgsuWjuHUIZWIrmmO5i0OiLK5aY/DKF0wcrpSOUErSnuKP++XtKj2MWUFRb5eYlUyZnW
	NIp3L9JZ6drI9DK0RqkKnBZ7LgVphqOT51vE0itw2P70Ut7ZxN7I8RmilqIs4Novli1aFS4V38E
	y01NwGvWpGfD3Nzn0m5kb3181wEK0nMCvnzSox936Yh8ibx/V/4FxgK95S3Q3oQz1r778hlTB5h
	XCsHq3maDwFSPa21T9RDJTzCpl8qUa2heCbnPZ5dIz0AiYKGUff8n6Y7ybC68m/0t+e/ZPKhuQ4
	A==
X-Received: by 2002:a05:690e:128a:b0:65c:1a0f:d89e with SMTP id 956f58d0204a3-65c1a0fe0bamr296688d50.23.1777508543896;
        Wed, 29 Apr 2026 17:22:23 -0700 (PDT)
Received: from localhost ([2600:1700:3420:b5d0::d])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-65bff71d4c1sm1940136d50.14.2026.04.29.17.22.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 17:22:23 -0700 (PDT)
From: kernelcoredev <sonionwhat@gmail.com>
To: gregkh@linuxfoundation.org
Date: Wed, 29 Apr 2026 20:22:20 -0400
Message-ID: <20260430002220.3665-1-sonionwhat@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Spamd-Bar: --
X-MailFrom: sonionwhat@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: E7EM5FMILBGLWAVTL444PSJ4PIAJSH4S
X-Message-ID-Hash: E7EM5FMILBGLWAVTL444PSJ4PIAJSH4S
X-Mailman-Approved-At: Thu, 30 Apr 2026 13:21:40 +0000
CC: vireshk@kernel.org, johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, kernelcoredev <sonionwhat@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v2] staging: greybus: bootrom: replace dev_info with dev_dbg for firmware name
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/E7EM5FMILBGLWAVTL444PSJ4PIAJSH4S/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: B33314A35F4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.59 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx:c];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[kernel.org,lists.linaro.org,lists.linux.dev,vger.kernel.org,gmail.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-0.990];
	FROM_NEQ_ENVFROM(0.00)[sonionwhat@gmail.com,greybus-dev-bounces@lists.linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,lists.linaro.org:helo,lists.linaro.org:rdns]

The original dev_info call was intentionally temporary, with a FIXME
comment noting it should be downgraded to dev_dbg once modules with
valid VID/PID values were common. Project Ara was cancelled in 2016,
so that time has long passed.

Remove the FIXME comment and downgrade to dev_dbg as originally intended.

Tested via code inspection only, as Project Ara hardware is no longer
available.

Signed-off-by: Bentley Blacketer  <sonionwhat@gmail.com>
---
 drivers/staging/greybus/bootrom.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/greybus/bootrom.c b/drivers/staging/greybus/bootrom.c
index 83921d90c..058044ba7 100644
--- a/drivers/staging/greybus/bootrom.c
+++ b/drivers/staging/greybus/bootrom.c
@@ -163,18 +163,13 @@ static int find_firmware(struct gb_bootrom *bootrom, u8 stage)
 	 *
 	 * XXX Name it properly..
 	 */
-	snprintf(firmware_name, sizeof(firmware_name),
+snprintf(firmware_name, sizeof(firmware_name),
 		 FW_NAME_PREFIX "%08x_%08x_%08x_%08x_s2l.tftf",
 		 intf->ddbl1_manufacturer_id, intf->ddbl1_product_id,
 		 intf->vendor_id, intf->product_id);
 
-	// FIXME:
-	// Turn to dev_dbg later after everyone has valid bootloaders with good
-	// ids, but leave this as dev_info for now to make it easier to track
-	// down "empty" vid/pid modules.
-	dev_info(&connection->bundle->dev, "Firmware file '%s' requested\n",
+	dev_dbg(&connection->bundle->dev, "Firmware file '%s' requested\n",
 		 firmware_name);
-
 	rc = request_firmware(&bootrom->fw, firmware_name,
 			      &connection->bundle->dev);
 	if (rc) {
-- 
2.54.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
