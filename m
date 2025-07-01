Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 20A2BAEF61A
	for <lists+greybus-dev@lfdr.de>; Tue,  1 Jul 2025 13:06:29 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 13C9F446DA
	for <lists+greybus-dev@lfdr.de>; Tue,  1 Jul 2025 11:06:22 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	by lists.linaro.org (Postfix) with ESMTPS id CF58E40F7F
	for <greybus-dev@lists.linaro.org>; Tue,  1 Jul 2025 11:06:19 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=FtnDwuQw;
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 147.75.193.91 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org;
	dmarc=pass (policy=none) header.from=linuxfoundation.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 87003A52F2B;
	Tue,  1 Jul 2025 11:06:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B799CC4CEEE;
	Tue,  1 Jul 2025 11:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1751367979;
	bh=CWIRlpgPJRqEG5Un9ajpiNt3bGaNLmXXcKnSn4AJta4=;
	h=From:To:Cc:Subject:Date:From;
	b=FtnDwuQwkMxAT9f1eJ/rE/Zdvsg+3Jr/kyuJ41TpUXVwCDoVvaVig0w+DrNvMWrJt
	 3wVy99Gh7bdfBeNe3uZFBvynE0f1SjF1v86R67C9pBmHaV9gATcL4LG4m+Oj7OMm+p
	 QJlxa6B58hMUyfiot6109412KaKn7qpkXDjluNyQ=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org
Date: Tue,  1 Jul 2025 13:06:16 +0200
Message-ID: <2025070115-reoccupy-showy-e2ad@gregkh>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Lines: 44
X-Developer-Signature: v=1; a=openpgp-sha256; l=1745; i=gregkh@linuxfoundation.org; h=from:subject:message-id; bh=CWIRlpgPJRqEG5Un9ajpiNt3bGaNLmXXcKnSn4AJta4=; b=owGbwMvMwCRo6H6F97bub03G02pJDBnJB9Vfrck+sH3dpot/T2hazL8Vr8CbVVG/V82noZSnR 97PYZNBRywLgyATg6yYIsuXbTxH91ccUvQytD0NM4eVCWQIAxenAEzEx5xhfu3pzcpBjwXatbak 5gmkC1wyZnq/g2GuzOvAmA23z02+5FMUPFdxt3HORw0TAA==
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp; fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: CF58E40F7F
X-Spamd-Bar: +
X-Spamd-Result: default: False [1.00 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:147.75.193.91];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:54825, ipnet:147.75.192.0/21, country:US];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DNSWL_BLOCKED(0.00)[100.75.92.58:received,147.75.193.91:from];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[linuxfoundation.org:+]
X-Rspamd-Action: no action
X-Spam-Level: *
Message-ID-Hash: BNVFGUF4QWH6BY2CGU24NKGKMCL6TUXM
X-Message-ID-Hash: BNVFGUF4QWH6BY2CGU24NKGKMCL6TUXM
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v2] staging: greybus: gbphy: fix up const issue with the match callback
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/BNVFGUF4QWH6BY2CGU24NKGKMCL6TUXM/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

gbphy_dev_match_id() should be taking a const pointer, as the pointer
passed to it from the container_of() call was const to start with (it
was accidentally cast away with the call.)  Fix this all up by correctly
marking the pointer types.

Cc: Johan Hovold <johan@kernel.org>
Cc: Alex Elder <elder@kernel.org>
Cc: greybus-dev@lists.linaro.org
Fixes: d69d80484598 ("driver core: have match() callback in struct bus_type take a const *")
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
v2: - add Fixes: line as pointed out by Johan
    - don't make gbphy_dev const, it's not needed, as pointed out by
      Johan

 drivers/staging/greybus/gbphy.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/greybus/gbphy.c b/drivers/staging/greybus/gbphy.c
index 6adcad286633..60cf09a302a7 100644
--- a/drivers/staging/greybus/gbphy.c
+++ b/drivers/staging/greybus/gbphy.c
@@ -102,8 +102,8 @@ static int gbphy_dev_uevent(const struct device *dev, struct kobj_uevent_env *en
 }
 
 static const struct gbphy_device_id *
-gbphy_dev_match_id(struct gbphy_device *gbphy_dev,
-		   struct gbphy_driver *gbphy_drv)
+gbphy_dev_match_id(const struct gbphy_device *gbphy_dev,
+		   const struct gbphy_driver *gbphy_drv)
 {
 	const struct gbphy_device_id *id = gbphy_drv->id_table;
 
@@ -119,7 +119,7 @@ gbphy_dev_match_id(struct gbphy_device *gbphy_dev,
 
 static int gbphy_dev_match(struct device *dev, const struct device_driver *drv)
 {
-	struct gbphy_driver *gbphy_drv = to_gbphy_driver(drv);
+	const struct gbphy_driver *gbphy_drv = to_gbphy_driver(drv);
 	struct gbphy_device *gbphy_dev = to_gbphy_dev(dev);
 	const struct gbphy_device_id *id;
 
-- 
2.50.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
