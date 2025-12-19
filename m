Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 963B5CCF808
	for <lists+greybus-dev@lfdr.de>; Fri, 19 Dec 2025 12:00:11 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 60915400FE
	for <lists+greybus-dev@lfdr.de>; Fri, 19 Dec 2025 11:00:10 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by lists.linaro.org (Postfix) with ESMTPS id 42AEA400F5
	for <greybus-dev@lists.linaro.org>; Fri, 19 Dec 2025 11:00:06 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=mWOYjAWW;
	spf=pass (lists.linaro.org: domain of johan@kernel.org designates 172.234.252.31 as permitted sender) smtp.mailfrom=johan@kernel.org;
	dmarc=pass (policy=quarantine) header.from=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A8F8C4437E;
	Fri, 19 Dec 2025 11:00:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C082C116C6;
	Fri, 19 Dec 2025 11:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766142005;
	bh=rF1yPDuyGMfo+9a72fmkdnuoNV1bBA7A6RwbKHhS2Ss=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mWOYjAWWw07MCGCIFhNQyL1gDA/wi0yNnrbIUPLw0ly8jEULMs3/rFjWEatQzKqgd
	 2GhSx+0+lioW708eKxQa0zj94uFLfjauZcTE6sPcagrbmP/WO93KO6lNclQlbnRFQy
	 rQGcRo2PjRNzOSp/Ad3MxYG83MOU9FYykVQEKT/gkAtUrL0rbBeRne2Ka43k4slSSA
	 rI6CdHmxArPv7KfEgntnL9GOp6PwdnW/6NFkzoBG/GoFJjGzY5YEKCNbFK2yq74KM5
	 s6pY5nr8ZRmyFxibLkSsdmcEZexAaFoC0+uoySPS8t2WbTS1S9uB69VsxaL0cz2uro
	 6IbvaqO38ZMzA==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vWYDM-0000000065i-0wjA;
	Fri, 19 Dec 2025 12:00:04 +0100
From: Johan Hovold <johan@kernel.org>
To: Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Vaibhav Hiremath <hvaibhav.linux@gmail.com>
Date: Fri, 19 Dec 2025 11:59:28 +0100
Message-ID: <20251219105928.23329-4-johan@kernel.org>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251219105928.23329-1-johan@kernel.org>
References: <20251219105928.23329-1-johan@kernel.org>
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.50 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.252.31];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,linuxfoundation.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_THREE(0.00)[3];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+]
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 42AEA400F5
X-Spamd-Bar: --
Message-ID-Hash: 5Q4XQBPCWYPFA3EN37YUOHNVILYJGWDI
X-Message-ID-Hash: 5Q4XQBPCWYPFA3EN37YUOHNVILYJGWDI
X-MailFrom: johan@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH 3/3] staging: greybus: arche-platform: fix OF populate on driver rebind
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/5Q4XQBPCWYPFA3EN37YUOHNVILYJGWDI/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Since commit c6e126de43e7 ("of: Keep track of populated platform
devices") child devices will not be created by of_platform_populate()
if the devices had previously been deregistered individually so that the
OF_POPULATED flag is still set in the corresponding OF nodes.

Switch to using of_platform_depopulate() instead of open coding so that
the child devices are created if the driver is rebound.

Fixes: bc142bbb4ceb ("greybus: arche_platform: Remove child's platform device as part of _remove() fn")
Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/staging/greybus/arche-platform.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/staging/greybus/arche-platform.c b/drivers/staging/greybus/arche-platform.c
index 7dcb33a6f2e3..8aaff4e45660 100644
--- a/drivers/staging/greybus/arche-platform.c
+++ b/drivers/staging/greybus/arche-platform.c
@@ -553,22 +553,13 @@ static int arche_platform_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int arche_remove_child(struct device *dev, void *unused)
-{
-	struct platform_device *pdev = to_platform_device(dev);
-
-	platform_device_unregister(pdev);
-
-	return 0;
-}
-
 static void arche_platform_remove(struct platform_device *pdev)
 {
 	struct arche_platform_drvdata *arche_pdata = platform_get_drvdata(pdev);
 
 	unregister_pm_notifier(&arche_pdata->pm_notifier);
 	device_remove_file(&pdev->dev, &dev_attr_state);
-	device_for_each_child(&pdev->dev, NULL, arche_remove_child);
+	of_platform_depopulate(&pdev->dev);
 	arche_platform_poweroff_seq(arche_pdata);
 
 	if (usb3613_hub_mode_ctrl(false))
-- 
2.51.2

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
