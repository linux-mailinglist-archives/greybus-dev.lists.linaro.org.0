Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 065118251A6
	for <lists+greybus-dev@lfdr.de>; Fri,  5 Jan 2024 11:16:34 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id D9FD040C68
	for <lists+greybus-dev@lfdr.de>; Fri,  5 Jan 2024 10:16:32 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	by lists.linaro.org (Postfix) with ESMTPS id 85EED40BEB
	for <greybus-dev@lists.linaro.org>; Fri,  5 Jan 2024 10:16:29 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=qB194l4N;
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 145.40.73.55 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org;
	dmarc=pass (policy=none) header.from=linuxfoundation.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 59536CE1D22;
	Fri,  5 Jan 2024 10:16:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EE13C433C7;
	Fri,  5 Jan 2024 10:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1704449785;
	bh=wVz/wYYysRMvYjHcfqRSF/XdEwbeiY/IQOOSisoeE6Q=;
	h=From:To:Cc:Subject:Date:From;
	b=qB194l4NAu6JMrdnRQKjdZsb5/G+864DaGMBZOUAjETqng9gWgFFrbM796frZEKGE
	 R3A05PU4zEgapTdDDqnaTJxR6MnFOnRi4uTt7M8DOeFikIBTQZ05fT8D5ZyYNkw4TS
	 eq0NVna+Mr44wzibv8v9MuM3Gjo4In/uukDKLjg8=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: greybus-dev@lists.linaro.org
Date: Fri,  5 Jan 2024 11:16:17 +0100
Message-ID: <2024010517-handgun-scoreless-05e7@gregkh>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Lines: 41
X-Developer-Signature: v=1; a=openpgp-sha256; l=1420; i=gregkh@linuxfoundation.org; h=from:subject:message-id; bh=wVz/wYYysRMvYjHcfqRSF/XdEwbeiY/IQOOSisoeE6Q=; b=owGbwMvMwCRo6H6F97bub03G02pJDKnTr33Mnmz5Oehhg8V9+UNzi1R/L5Bp+Hpa8uGTgtNP5 nI5JH1a0RHLwiDIxCArpsjyZRvP0f0VhxS9DG1Pw8xhZQIZwsDFKQAT4dvOMD/KwWfe32dXs7S/ LGE9zvSP3/2LZRjDgpN+NwSPmyeuCD/YweS7OrZHW0tWFAA=
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp; fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.00 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:145.40.73.55];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	ASN(0.00)[asn:54825, ipnet:145.40.73.0/24, country:US];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[linuxfoundation.org:+]
X-Spam-Level: *
X-Rspamd-Queue-Id: 85EED40BEB
X-Spamd-Bar: +
Message-ID-Hash: MTXC2D7UYMZFUS6RYSRTW6TG34GGUIXK
X-Message-ID-Hash: MTXC2D7UYMZFUS6RYSRTW6TG34GGUIXK
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] greybus: make greybus_bus_type const
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/MTXC2D7UYMZFUS6RYSRTW6TG34GGUIXK/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Now that the driver core can properly handle constant struct bus_type,
move the greybus_bus_type variable to be a constant structure as well,
placing it into read-only memory which can not be modified at runtime.

Cc: Johan Hovold <johan@kernel.org>
Cc: Alex Elder <elder@kernel.org>
Cc: greybus-dev@lists.linaro.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/greybus/core.c  | 2 +-
 include/linux/greybus.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/greybus/core.c b/drivers/greybus/core.c
index 5714be740470..b0aadc1e7bbe 100644
--- a/drivers/greybus/core.c
+++ b/drivers/greybus/core.c
@@ -155,7 +155,7 @@ static void greybus_shutdown(struct device *dev)
 	}
 }
 
-struct bus_type greybus_bus_type = {
+const struct bus_type greybus_bus_type = {
 	.name =		"greybus",
 	.match =	greybus_match_device,
 	.uevent =	greybus_uevent,
diff --git a/include/linux/greybus.h b/include/linux/greybus.h
index 18c0fb958b74..92da9ec4f5f0 100644
--- a/include/linux/greybus.h
+++ b/include/linux/greybus.h
@@ -104,7 +104,7 @@ void gb_debugfs_init(void);
 void gb_debugfs_cleanup(void);
 struct dentry *gb_debugfs_get(void);
 
-extern struct bus_type greybus_bus_type;
+extern const struct bus_type greybus_bus_type;
 
 extern struct device_type greybus_hd_type;
 extern struct device_type greybus_module_type;
-- 
2.43.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
