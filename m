Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 75017825238
	for <lists+greybus-dev@lfdr.de>; Fri,  5 Jan 2024 11:38:17 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 802FB40C37
	for <lists+greybus-dev@lfdr.de>; Fri,  5 Jan 2024 10:38:16 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	by lists.linaro.org (Postfix) with ESMTPS id 94A4E40C18
	for <greybus-dev@lists.linaro.org>; Fri,  5 Jan 2024 10:38:13 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=Mwgglcc5;
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 145.40.68.75 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org;
	dmarc=pass (policy=none) header.from=linuxfoundation.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 94CA5B81C3D;
	Fri,  5 Jan 2024 10:38:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71E2BC433C8;
	Fri,  5 Jan 2024 10:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1704451092;
	bh=OeNLZYazvQWjMT8s39DgCPZmR0L9HSAfterjuD13S8A=;
	h=From:To:Cc:Subject:Date:From;
	b=Mwgglcc5wKWFQ1eLDBVMmLd6wLzpRqri9fKcqrcQIFzQ99GCfxQdzm5+/KrSFheQs
	 SZwv/gHc0pT6ZPDY1VhxiYV1CYRrsk9jC8O50dPB3ftQizNad+YqJ83ps+SSUNxHiH
	 aR5mEBLVInEg6bX+TjOa9BWqgvTMPBKt/VY3BDpE=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org
Date: Fri,  5 Jan 2024 11:38:08 +0100
Message-ID: <2024010508-fossil-glove-c2c6@gregkh>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Lines: 28
X-Developer-Signature: v=1; a=openpgp-sha256; l=1020; i=gregkh@linuxfoundation.org; h=from:subject:message-id; bh=OeNLZYazvQWjMT8s39DgCPZmR0L9HSAfterjuD13S8A=; b=owGbwMvMwCRo6H6F97bub03G02pJDKnT7wgcmqS52b/j0LyFz2cesDrT7xIfumih1xllJYGp2 yborT5i3BHLwiDIxCArpsjyZRvP0f0VhxS9DG1Pw8xhZQIZwsDFKQATWc7NsGB74BMPFqPUr2Yb ngrsnDzvZOQc01aGOdyvIi+LXn7Ndfeot4XSFJMnV4ycGAE=
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp; fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.00 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:145.40.68.75];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	ASN(0.00)[asn:54825, ipnet:145.40.68.0/24, country:US];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[linuxfoundation.org:+]
X-Spam-Level: *
X-Rspamd-Queue-Id: 94A4E40C18
X-Spamd-Bar: +
Message-ID-Hash: EPDLGNFYH77GG2YLAQTYQEGCA2G7JBZK
X-Message-ID-Hash: EPDLGNFYH77GG2YLAQTYQEGCA2G7JBZK
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] staging: greybus: gbphy: make gbphy_bus_type const
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/EPDLGNFYH77GG2YLAQTYQEGCA2G7JBZK/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Now that the driver core can properly handle constant struct bus_type,
move the gbphy_bus_type variable to be a constant structure as well,
placing it into read-only memory which can not be modified at runtime.

Cc: Johan Hovold <johan@kernel.org>
Cc: Alex Elder <elder@kernel.org>
Cc: greybus-dev@lists.linaro.org
Cc: linux-staging@lists.linux.dev
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/staging/greybus/gbphy.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/gbphy.c b/drivers/staging/greybus/gbphy.c
index 6a7d8cf2a1eb..1c41b008ba39 100644
--- a/drivers/staging/greybus/gbphy.c
+++ b/drivers/staging/greybus/gbphy.c
@@ -182,7 +182,7 @@ static void gbphy_dev_remove(struct device *dev)
 	pm_runtime_dont_use_autosuspend(dev);
 }
 
-static struct bus_type gbphy_bus_type = {
+static const struct bus_type gbphy_bus_type = {
 	.name =		"gbphy",
 	.match =	gbphy_dev_match,
 	.probe =	gbphy_dev_probe,
-- 
2.43.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
