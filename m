Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rQkZFnNFV2qmIQEAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Wed, 15 Jul 2026 10:31:47 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 2625E75BE6F
	for <lists+greybus-dev@lfdr.de>; Wed, 15 Jul 2026 10:31:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=gmail.com header.s=20251104 header.b=fZcFdChH;
	spf=pass (mail.lfdr.de: domain of "greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org" designates 44.210.186.118 as permitted sender) smtp.mailfrom="greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org";
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=gmail.com (policy=none)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 3E28940A4D
	for <lists+greybus-dev@lfdr.de>; Wed, 15 Jul 2026 08:31:46 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	by lists.linaro.org (Postfix) with ESMTPS id 137803F735
	for <greybus-dev@lists.linaro.org>; Tue, 14 Jul 2026 13:49:28 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-383b4a3755fso941624a91.3
        for <greybus-dev@lists.linaro.org>; Tue, 14 Jul 2026 06:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784036967; x=1784641767; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dnpCUCIhUIUVob1+81rKKkOZhThYfFIyjzh2lJvfSZM=;
        b=fZcFdChHTG5oClE6/l6XQeqVDeTFrrRnLk8kh78inJLBp19bX3DBwuB38tf69PprN9
         yIqR5A61fvfAkD1pt0ibJepckfTzSDUWSLynkJVuiPotEzDPI1bu0UVeqoxoXQottyxS
         nA2/OrPV42CpSKvMLXvk1B4rr7HA/31sTjKRDkvtUp+bdvcJa2J+0YCBOtDie0jJ9jQ6
         Ika6Sdvp5OeWWp+0UHhF6QIqqHXfLAHCrZkzWYvZ71X1IharqfAwh1Uuo7/tLdyqi2sa
         TxDnDT3pXPcncn8VII4tV/+/M3A5FNgebVkodKIWC+xHZgRzX2PKWlJnWji0aoADhvOV
         oLvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784036967; x=1784641767;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dnpCUCIhUIUVob1+81rKKkOZhThYfFIyjzh2lJvfSZM=;
        b=XjCO9noLBmTZ2pT5IirAOaOgajifJTjrrIeEMdNqXFfevsgnK3BeovlsvJMMr7MwRs
         eSOoZ42wL8od9K4kCOrT7+NSSvH1tS00eknjl+MGx0EIEEZmJ+jVK1JQ8TiVJEOVRps4
         qLx1b0yBxgfVXLXfyCUPNUPOZ/RUUsb9m698zaYqkI27OBs3hcjGqPqXITtx3uBkV8uA
         V6bBxIe1qzvQ5ek6Q9xtSmeWgUdDNB07U8nWid82wb4Yaft0AnrcPTbSPt8bSMHRp8BG
         bvRYPfedfZGAA2HEmDOTduinslvFs8HLZL1g16oyGhlZu4zzfXeHt9s06CDGqkY2ska3
         C+Dw==
X-Gm-Message-State: AOJu0YwhpiKwNZJEdmiRGs6qrH90cJ7fxWZC5QqLWYxb44GHQv/KpiKb
	h3Ctl74/w8NW+9+Bl/z/4Z3c0VH0BM41eI4/mU45F3AJ13EJN9EDHVR/
X-Gm-Gg: AfdE7clPA6XikiwJ2pY46X8DISILULgU9iYiZfglLinsqtGKODUElOZkiGkbZ6lvzId
	DK/b83/sYGafUuRXeodd3kF43O3tn0LeXJ3oTt86ky4WnpNB4ujJvNBuv52MnCq2+owB3U5W9+1
	+A16guXc0+OYK093SJ9WPw87R2ysbofD+1SAI714J7gSh2U6PjTxdQbIGkA7yHygjZwR6kmpxoi
	JIUCYJ0Rg2JNJX74OYWerznsBnH/Ojo+k5l/dttsMfOg0ZC7MEBz+xVwA/f8gqpRjHTbMAAtxRG
	pNvsO3/XBMxuq1idIaiLi679/yfkucxnYx83g872tZPccU960Dl1ZsMSbhXePhTnMmGmXjx8Itm
	mzfwmf+LAEWff4rmhMk50fjHL8SEmu4TQkCS0AwVPJlCzZSQwxsJQaCIPaSLWu+7C/tvcpYwuUy
	GjW1JeDd5VFD6rrPZ17P4XlyNWfM11v/uTcleNU84VaOsCC/5FOS4Fbeo4gA3uTPrQ2RuyRdq62
	EqdyF9PL0hnxWTlS2xVxycbslfAxT3im+GHtfbdg8o6WHSKM2E64+EPgw==
X-Received: by 2002:a17:90b:5344:b0:381:e74f:8a6a with SMTP id 98e67ed59e1d1-38dc74d5646mr13154372a91.16.1784036967020;
        Tue, 14 Jul 2026 06:49:27 -0700 (PDT)
Received: from OMEN ([103.184.238.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3117462f5c7sm87462212eec.0.2026.07.14.06.49.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 06:49:26 -0700 (PDT)
From: Alfie Varghese <alfievarghese22@gmail.com>
To: johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org
Date: Tue, 14 Jul 2026 19:19:21 +0530
Message-ID: <20260714134921.817-1-alfievarghese22@gmail.com>
X-Mailer: git-send-email 2.54.0.windows.1
MIME-Version: 1.0
X-Spamd-Bar: --
X-MailFrom: alfievarghese22@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: FZR536MHNHAJ7MJFFXJW7KTQ24NUQR6X
X-Message-ID-Hash: FZR536MHNHAJ7MJFFXJW7KTQ24NUQR6X
X-Mailman-Approved-At: Wed, 15 Jul 2026 08:31:34 +0000
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, dan.carpenter@linaro.org, error27@gmail.com, alfievarghese22@gmail.com
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v3] staging: greybus: uart: return tty_alloc_driver() errors
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/FZR536MHNHAJ7MJFFXJW7KTQ24NUQR6X/>
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
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	MID_CONTAINS_FROM(1.00)[];
	R_SPF_ALLOW(-0.20)[+mx:c];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:johan@kernel.org,m:elder@kernel.org,m:gregkh@linuxfoundation.org,m:greybus-dev@lists.linaro.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:dan.carpenter@linaro.org,m:error27@gmail.com,m:alfievarghese22@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[alfievarghese22@gmail.com,greybus-dev-bounces@lists.linaro.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alfievarghese22@gmail.com,greybus-dev-bounces@lists.linaro.org];
	FREEMAIL_CC(0.00)[lists.linaro.org,lists.linux.dev,vger.kernel.org,linaro.org,gmail.com];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[greybus-dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2625E75BE6F

gb_tty_init() maps any tty_alloc_driver() failure to -ENOMEM.
tty_alloc_driver() currently always returns -ENOMEM on failure,
so this does not change behavior in practice. However, returning
PTR_ERR(gb_tty_driver) is more correct and consistent with kernel
conventions, preserving any future error codes the function might
return.

Signed-off-by: Alfie Varghese <alfievarghese22@gmail.com>
---
v3: resend, v2 was corrupted in transit. No code changes.
v2: updated commit message per Dan Carpenter's review to clarify
    that tty_alloc_driver() currently only returns -ENOMEM, making
    this a style fix rather than a behavioral change.
---
 drivers/staging/greybus/uart.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/uart.c b/drivers/staging/greybus/uart.c
index 7d060b4cd33d..24b4dab069c3 100644
--- a/drivers/staging/greybus/uart.c
+++ b/drivers/staging/greybus/uart.c
@@ -951,7 +951,7 @@ static int gb_tty_init(void)
 					 TTY_DRIVER_DYNAMIC_DEV);
 	if (IS_ERR(gb_tty_driver)) {
 		pr_err("Can not allocate tty driver\n");
-		retval = -ENOMEM;
+		retval = PTR_ERR(gb_tty_driver);
 		goto fail_unregister_dev;
 	}
 
-- 
2.54.0.windows.1

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
