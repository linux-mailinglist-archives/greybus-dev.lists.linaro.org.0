Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id C972D6004A7
	for <lists+greybus-dev@lfdr.de>; Mon, 17 Oct 2022 03:03:24 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 6722E3EF22
	for <lists+greybus-dev@lfdr.de>; Mon, 17 Oct 2022 01:03:23 +0000 (UTC)
Received: from msg-1.mailo.com (msg-1.mailo.com [213.182.54.11])
	by lists.linaro.org (Postfix) with ESMTPS id E2C963EE76
	for <greybus-dev@lists.linaro.org>; Sun, 16 Oct 2022 14:19:40 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=mailo.com header.s=mailo header.b=Jr7gAm6M;
	spf=pass (lists.linaro.org: domain of drv@mailo.com designates 213.182.54.11 as permitted sender) smtp.mailfrom=drv@mailo.com;
	dmarc=pass (policy=none) header.from=mailo.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
	t=1665929957; bh=eGiDjkHU2H18+UPJbCBnMLwPn0ooEAda11HpwCTW7NE=;
	h=X-EA-Auth:Date:From:To:Subject:Message-ID:MIME-Version:
	 Content-Type;
	b=Jr7gAm6Ms40j66UKi9lALGQDZMf4kYHTU3PElDk+o5p3llOSr+G5X5a+Ubi6+7Y2v
	 wb0sLR1w7WpmjPJdZxHX2Ov+Wcpb8mgAcUK0BqGOaFe0mxx8coqzEgfLiLaQFFtyFI
	 h7fFNPbqcSX5sDcs8XHR4BMkGSYnFvnSCFT9/RLM=
Received: by b-5.in.mailobj.net [192.168.90.15] with ESMTP
	via [213.182.55.206]
	Sun, 16 Oct 2022 16:19:16 +0200 (CEST)
X-EA-Auth: ZlYqw7q+n9bWm0E6M2C4cko2RDVMvIgADjfKHRVLOR30Cm/e+LuD7Xdw2nHPPvVfc+puoJzaiDklCQrDpRBLDd7molkJY2vr
Date: Sun, 16 Oct 2022 10:19:12 -0400
From: Deepak R Varma <drv@mailo.com>
To: outreachy@lists.linux.dev, pure.logic@nexus-software.ie,
	johan@kernel.org, elder@kernel.org, gregkh@linuxfoundation.org,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Message-ID: <Y0wS4HQo9m/W/TrQ@debian-BULLSEYE-live-builder-AMD64>
MIME-Version: 1.0
Content-Disposition: inline
X-Rspamd-Server: lists.linaro.org
X-Spamd-Bar: ---
X-Rspamd-Queue-Id: E2C963EE76
X-Spamd-Result: default: False [-3.50 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	DMARC_POLICY_ALLOW(-0.50)[mailo.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:213.182.54.0/24];
	R_DKIM_ALLOW(-0.20)[mailo.com:s=mailo];
	MIME_GOOD(-0.10)[text/plain];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:8304, ipnet:213.182.32.0/19, country:FR];
	NEURAL_HAM(-0.00)[-0.947];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_TWO(0.00)[2];
	ARC_NA(0.00)[];
	TO_DN_NONE(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	DKIM_TRACE(0.00)[mailo.com:+]
X-MailFrom: drv@mailo.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: HJFSTCYWGKX2HEHF5FCD3YCYKGH3UCF6
X-Message-ID-Hash: HJFSTCYWGKX2HEHF5FCD3YCYKGH3UCF6
X-Mailman-Approved-At: Mon, 17 Oct 2022 01:03:17 +0000
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] staging: greybus: loopback: enclose macro statements in do-while loop
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/HJFSTCYWGKX2HEHF5FCD3YCYKGH3UCF6/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Include multiple statements of macro definition inside do-while{0} loop
to avoid possible partial program execution. Issue reported by
checkpatch script:

ERROR: Macros with multiple statements should be enclosed in a do - while loop

Signed-off-by: Deepak R Varma <drv@mailo.com>
---
 drivers/staging/greybus/loopback.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/loopback.c b/drivers/staging/greybus/loopback.c
index 1a61fce98056..37214cb43937 100644
--- a/drivers/staging/greybus/loopback.c
+++ b/drivers/staging/greybus/loopback.c
@@ -163,9 +163,11 @@ static ssize_t name##_avg_show(struct device *dev,		\
 static DEVICE_ATTR_RO(name##_avg)

 #define gb_loopback_stats_attrs(field)				\
+do {								\
 	gb_loopback_ro_stats_attr(field, min, u);		\
 	gb_loopback_ro_stats_attr(field, max, u);		\
-	gb_loopback_ro_avg_attr(field)
+	gb_loopback_ro_avg_attr(field);				\
+} while (0)

 #define gb_loopback_attr(field, type)					\
 static ssize_t field##_show(struct device *dev,				\
--
2.30.2



_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
