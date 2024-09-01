Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D33968381
	for <lists+greybus-dev@lfdr.de>; Mon,  2 Sep 2024 11:45:37 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id DA2C542530
	for <lists+greybus-dev@lfdr.de>; Mon,  2 Sep 2024 09:45:35 +0000 (UTC)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12olkn2095.outbound.protection.outlook.com [40.92.21.95])
	by lists.linaro.org (Postfix) with ESMTPS id 3231340CEF
	for <greybus-dev@lists.linaro.org>; Sun,  1 Sep 2024 21:19:42 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=outlook.com header.s=selector1 header.b=YxwXFIzS;
	arc=pass ("microsoft.com:s=arcselector10001:i=1");
	spf=pass (lists.linaro.org: domain of goldside000@outlook.com designates 40.92.21.95 as permitted sender) smtp.mailfrom=goldside000@outlook.com;
	dmarc=pass (policy=none) header.from=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qUIG5mtwlBld3ZefQpot0/aSGdkOis81muV+CArFDhiRJwixrQPbq+OyJTaUENode4SKKtO6tF8PXE4sm4ANEiovrkd7qvMT3VedP6lpAndq+kHN+8NHVv4eqk1Pna05yrkGMQymc7aco0sEcjmE8M28tola4yscuC40Re+dwG4hFRj30KxelETAswrKvRsooyZ9f7H+DjyXlKvkuTwBFo5p9IuP/cCwlezMVvelnkT9HmlkrTYksrCyLZlXEyxB6px/Oz76gH3OifL89+59wKHI7htk5BWBS1dO11XUC/pfFRFQAQGAgA+RlakgYBCtjDwOs4XV8z8zx44FGTedfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H3slZWd3VyzAOGQ0A+pRYddhc63NeoGDbURXfnsOG4o=;
 b=OnchPPdTQlFY+MuRXa3tlAUHGagMl8JGP3NjXCDmQPUVg/ZKsx3CL267lg9KSzlaVbn/x/bVH5wkIaCaX3Kq3F9TywUZ6YCzLp17RnThVuZO0ItROz6PMNRSKy7126ICyBuXdTHFk8xR5AGUzozC1xKY8SJGUXN7vgvikVi9cfBJfDrfoeJcg9UYWd8ARSnAssBhQIh6WJ+S5SMgAr8DgZF4YG/94fM++LEeFm2DQqgqASSEImBFpFsIRO0GMlyULMr4KKd47jN67WlTCeHmM9kGo8gjUZ/XSIlJXbvG3WV3P7HK+4oav6GhJ6a00TsXRoBsuGmVevrFLBohE6Jqaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H3slZWd3VyzAOGQ0A+pRYddhc63NeoGDbURXfnsOG4o=;
 b=YxwXFIzSKjQ90kozTOdoCVPsMfF6wjUku+Eh2q9XG/hSwgvds1etYdYbVaQj5fVp8mkUzARsCTPOt6LX630QhqzaLYprNCZTfYzzyPSB8ZELMXu/3FqGSo+Kj2wSwCCHJaKy4c5vvY3Yz6udAkNBLYYV2nAeG67zjDugfHPPSYm9YoJelL1Amn28QEL66FtmXXe2Kqgs1H1WYKoy5Ir8xWOkr/jAXHYq2/yt+AfUb+z3aZ53Xim1inbFv/YP9FUyP10Zw/vjawbq+zxht8le6m6Qh8qupXsymiXHiRae/AJTeG3SzJoeoNQIWjA2OYnuz3v5U0M17Ug9efIBJAve4A==
Received: from SJ2P223MB1026.NAMP223.PROD.OUTLOOK.COM (2603:10b6:a03:570::8)
 by DM8P223MB0336.NAMP223.PROD.OUTLOOK.COM (2603:10b6:5:316::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.23; Sun, 1 Sep
 2024 21:19:40 +0000
Received: from SJ2P223MB1026.NAMP223.PROD.OUTLOOK.COM
 ([fe80::b5cd:c37a:bd3e:e3fd]) by SJ2P223MB1026.NAMP223.PROD.OUTLOOK.COM
 ([fe80::b5cd:c37a:bd3e:e3fd%2]) with mapi id 15.20.7918.020; Sun, 1 Sep 2024
 21:19:40 +0000
From: Steven Davis <goldside000@outlook.com>
To: gregkh@linuxfoundation.org
Date: Sun,  1 Sep 2024 17:18:59 -0400
Message-ID: 
 <SJ2P223MB102660087EA9382BE5287FDBF7912@SJ2P223MB1026.NAMP223.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.39.2
X-TMN: [YcwGo0AqAq1YVCkBYaFLynUXz+7W6V7P]
X-ClientProxiedBy: CH0P221CA0038.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:610:11d::24) To SJ2P223MB1026.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:a03:570::8)
X-Microsoft-Original-Message-ID: 
 <20240901211859.8051-1-goldside000@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2P223MB1026:EE_|DM8P223MB0336:EE_
X-MS-Office365-Filtering-Correlation-Id: 8df23f96-3c1c-4dde-8bfa-08dccacbc9e6
X-Microsoft-Antispam: 
	BCL:0;ARA:14566002|15080799006|5072599009|19110799003|461199028|8060799006|3412199025|440099028|1710799026;
X-Microsoft-Antispam-Message-Info: 
	t8UBExmBExX8mpLVkWmMsVTdZ6vzn+Mz166qVAZ/+yzh4cRLPvhxykkIGYp//a7cQyZ0R+AyP5+UENBFoNTlJuVKQpGSazNtfcI9EXlaGdqm2JqkJLW9NTzq2lGiiUUDTXVK0+ysFjf2UIpRWkpg0u8/FYq/dJ7zwlJuVFRYw4BW/Y3aT3IbzFob6UhorhFVmGBxM7UqNhiOFUO06pzrayCWrl1FClz0JXgsFANq9HabH0WlrSDKfZ63QOjZvagXR61KKoF7/ZjRnHNRcAK7lSoOIJhECxm1cWu4EWaHikrtwrY50OQUnt+fGBS2oTRKgFRv8jWrt3LPQjOEbJd0rWqdFfpMq3EZ1FONbRAc5K/gebSFyth69conekNm9VlzZpRLboiKk/x+280TCt2KqyrUtLT5Sc07RdqTmcG0zjXiSRseunTWgcy6mBWVIfq6P7o58o4q5Hmtqn3QivN6INlGc6U1Ae+IHWpgpttz5lT4WkC+1XGUUP9PGPJq7OisZdBohEC5K7pCZ1OjIeFOdO9CX396Hcf9onr7Vi1wktTedB5AqAsNUNr4LejnQ8GmB32+tUrNhmCuXIwZ/aew6n/7IB6J5zwsPsCKO/l1B03R11gNkkJ3FHla59f+mqQCJOLnre0JyMxTT301sWpBhN84vT/Eiltay/5HRBMyhLvj3hq1v6+qLJLI/iLpmL+1hraR7swcFAWFUuNsKoDgzigJosY24NNsEClsP2PQ2V8=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?W0qtZfselZ6zY0E2fUrmzCSDAw/PByzcxLZPv5HYXwHllC/ng054hXvnzPRc?=
 =?us-ascii?Q?3wEBhBrmioUrd/7gOJJG+yQIdtFWKDhA3eZ+evfqxXrzCsbgVzS44tt0q/kI?=
 =?us-ascii?Q?+/MVFTv3LMy53qslGZGf8+XhdQAk9csZIkq7ta8/4Jvi+r7cZIXOTKQ1nCoE?=
 =?us-ascii?Q?v4L0pE6uBvlJDr5Jeoy9AQYirku01vo7QxX2fzWHw7vaqZO2iJPxFUD3mfW9?=
 =?us-ascii?Q?whXAFnpcCF6sVNFrKrF/WDH9QD7oxUqUDvblv3xWe5IxzVQtjbTw4SGq7qQM?=
 =?us-ascii?Q?sWwvsXUc69J6FB6BjJePNaI2lJarh5mfFGFkMZwz9iEoy99K2rbodz3ijXTF?=
 =?us-ascii?Q?aQDAnT5W2+ElTYnKwhLx7pahEsTlbtKyxnZfkFuVnkPHUO6myMsa96urjtMz?=
 =?us-ascii?Q?FdXuoQnPXfx4Fo45a8YUuM1yOkELgkc2Zvx0aP28iDETykjDNIHTpJfeoh+Z?=
 =?us-ascii?Q?HtpbQsPiE/8gy1UeN0ocLAgjxXN83DrGdbuBPChwDNxwuEa+Lu+1mTjcZa78?=
 =?us-ascii?Q?ceaKslvkrjtmCVK/C+7u8p4LL+EmvoSg6nyAjBWNSq2vJ3F9YDjtNZu3yaER?=
 =?us-ascii?Q?zskfocA42wmDRgYuF8wbKBomisPJ2O/0E3drxaHu/PyJinNP4g3Wn8aYfKm6?=
 =?us-ascii?Q?mEEev3PE6+C+sGHVLdvfBcOiEu3VkHlkdfO481ghpS88zL9+f2RzG7t/XsMJ?=
 =?us-ascii?Q?xNNWJbm1zfVX8i9I04fJqwzTa54Q+ok0QG7S7sJS3+05W/K8O4Dk0upxnLIm?=
 =?us-ascii?Q?kRVJ9W1Z20Ljv85LSiGRrmk02HiEOsuoX+WbjR8CP9G7etjIjBKsCCSKV5b2?=
 =?us-ascii?Q?Ewjpcj6jPf2I0yMxcOlPfZiDtGi5YBA94CFbAfcnFfPtcH28gYh+4ULLXzB2?=
 =?us-ascii?Q?FkKcp9+ZiuR6HpkeVKgI95fyb4PqCNrGptvKE96iGYAM8XaJVcihMSRVJ4Wi?=
 =?us-ascii?Q?+9Z2F+xD0blXzTiGpj+94tmkpx+1Dt/LWV53Ib3s+Rk4afsz6q96kj/ELSMf?=
 =?us-ascii?Q?Bj8kt4vfXZOS42+PEdMK5hf+9wdizlF//dzshkSChOcge/C7u8yyRaJWQEdn?=
 =?us-ascii?Q?s87kvVJs/RJ2t+advRIx3cIml5sQFBunjKmnn3ojs9xqxyvzoHFy6mR1SfZ3?=
 =?us-ascii?Q?o+oQKs6B/Vt6N5FN7w5PdOc4+JYPMWxEWga7ci9tC1lp0/xZ4LO0MUxJvXqM?=
 =?us-ascii?Q?jdtT9W0ZfF0PzGFRZQwBHWMZrcyYiBlNZ7nKtW52gJ+rj7fDU2k5u2VgkEal?=
 =?us-ascii?Q?/nD643owVkgy/VWdQU/Q?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8df23f96-3c1c-4dde-8bfa-08dccacbc9e6
X-MS-Exchange-CrossTenant-AuthSource: SJ2P223MB1026.NAMP223.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2024 21:19:40.2377
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8P223MB0336
X-Rspamd-Action: no action
X-Spamd-Bar: ---
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 3231340CEF
X-Spamd-Result: default: False [-3.00 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[outlook.com,none];
	R_DKIM_ALLOW(-0.20)[outlook.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:40.92.0.0/15];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_FROM(0.00)[outlook.com];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:8075, ipnet:40.80.0.0/12, country:US];
	RWL_MAILSPIKE_POSSIBLE(0.00)[40.92.21.95:from];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FREEMAIL_ENVFROM(0.00)[outlook.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,lists.linaro.org,lists.linux.dev,vger.kernel.org,outlook.com];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	DKIM_TRACE(0.00)[outlook.com:+]
X-MailFrom: goldside000@outlook.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: 3K3SH6NOPPZ52INA6TVJFKM35BWBUINL
X-Message-ID-Hash: 3K3SH6NOPPZ52INA6TVJFKM35BWBUINL
X-Mailman-Approved-At: Mon, 02 Sep 2024 09:45:32 +0000
CC: hvaibhav.linux@gmail.com, johan@kernel.org, elder@kernel.org, vireshk@kernel.org, dtwlin@gmail.com, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Steven Davis <goldside000@outlook.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] staging: greybus: Fix capitalization and punctuation inconsistencies
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/26AVL4R2BPJXITWQETIK4AUP4F3YO6GE/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

There were a lot of inconsistencies in outputs and
comments, some were properly formatted and
capitalized, and some weren't. This patch resolves
this by properly formatting the inconsistent comments
and outputs.

Signed-off-by: Steven Davis <goldside000@outlook.com>
---
 drivers/staging/greybus/arche-platform.c | 38 ++++++++++++------------
 drivers/staging/greybus/authentication.c |  6 ++--
 drivers/staging/greybus/bootrom.c        | 16 +++++-----
 drivers/staging/greybus/light.c          | 26 ++++++++--------
 drivers/staging/greybus/log.c            | 10 +++----
 5 files changed, 48 insertions(+), 48 deletions(-)

diff --git a/drivers/staging/greybus/arche-platform.c b/drivers/staging/greybus/arche-platform.c
index b33977ccd527..45c1737817d0 100644
--- a/drivers/staging/greybus/arche-platform.c
+++ b/drivers/staging/greybus/arche-platform.c
@@ -95,7 +95,7 @@ static int apb_cold_boot(struct device *dev, void *data)
 
 	ret = apb_ctrl_coldboot(dev);
 	if (ret)
-		dev_warn(dev, "failed to coldboot\n");
+		dev_warn(dev, "Failed to coldboot\n");
 
 	/*Child nodes are independent, so do not exit coldboot operation */
 	return 0;
@@ -107,7 +107,7 @@ static int apb_poweroff(struct device *dev, void *data)
 
 	/* Enable HUB3613 into HUB mode. */
 	if (usb3613_hub_mode_ctrl(false))
-		dev_warn(dev, "failed to control hub device\n");
+		dev_warn(dev, "Failed to control hub device\n");
 
 	return 0;
 }
@@ -142,7 +142,7 @@ static irqreturn_t arche_platform_wd_irq_thread(int irq, void *devid)
 
 	/* Enable HUB3613 into HUB mode. */
 	if (usb3613_hub_mode_ctrl(true))
-		dev_warn(arche_pdata->dev, "failed to control hub device\n");
+		dev_warn(arche_pdata->dev, "Failed to control hub device\n");
 
 	spin_lock_irqsave(&arche_pdata->wake_lock, flags);
 	arche_platform_set_wake_detect_state(arche_pdata, WD_STATE_IDLE);
@@ -228,12 +228,12 @@ arche_platform_coldboot_seq(struct arche_platform_drvdata *arche_pdata)
 
 	ret = clk_prepare_enable(arche_pdata->svc_ref_clk);
 	if (ret) {
-		dev_err(arche_pdata->dev, "failed to enable svc_ref_clk: %d\n",
+		dev_err(arche_pdata->dev, "Failed to enable svc_ref_clk: %d\n",
 			ret);
 		return ret;
 	}
 
-	/* bring SVC out of reset */
+	/* Bring SVC out of reset */
 	svc_reset_onoff(arche_pdata->svc_reset, !arche_pdata->is_reset_act_hi);
 
 	arche_platform_set_state(arche_pdata, ARCHE_PLATFORM_STATE_ACTIVE);
@@ -262,7 +262,7 @@ arche_platform_fw_flashing_seq(struct arche_platform_drvdata *arche_pdata)
 
 	ret = clk_prepare_enable(arche_pdata->svc_ref_clk);
 	if (ret) {
-		dev_err(arche_pdata->dev, "failed to enable svc_ref_clk: %d\n",
+		dev_err(arche_pdata->dev, "Failed to enable svc_ref_clk: %d\n",
 			ret);
 		return ret;
 	}
@@ -340,7 +340,7 @@ static ssize_t state_store(struct device *dev,
 		if (arche_pdata->state == ARCHE_PLATFORM_STATE_STANDBY)
 			goto exit;
 
-		dev_warn(arche_pdata->dev, "standby state not supported\n");
+		dev_warn(arche_pdata->dev, "Standby state not supported\n");
 	} else if (sysfs_streq(buf, "fw_flashing")) {
 		if (arche_pdata->state == ARCHE_PLATFORM_STATE_FW_FLASHING)
 			goto exit;
@@ -358,7 +358,7 @@ static ssize_t state_store(struct device *dev,
 		if (ret)
 			goto exit;
 	} else {
-		dev_err(arche_pdata->dev, "unknown state\n");
+		dev_err(arche_pdata->dev, "Unknown state\n");
 		ret = -EINVAL;
 	}
 
@@ -434,7 +434,7 @@ static int arche_platform_probe(struct platform_device *pdev)
 	if (!arche_pdata)
 		return -ENOMEM;
 
-	/* setup svc reset gpio */
+	/* Setup svc reset gpio */
 	arche_pdata->is_reset_act_hi = of_property_read_bool(np,
 							     "svc,reset-active-high");
 	if (arche_pdata->is_reset_act_hi)
@@ -445,7 +445,7 @@ static int arche_platform_probe(struct platform_device *pdev)
 	arche_pdata->svc_reset = devm_gpiod_get(dev, "svc,reset", flags);
 	if (IS_ERR(arche_pdata->svc_reset)) {
 		ret = PTR_ERR(arche_pdata->svc_reset);
-		dev_err(dev, "failed to request svc-reset GPIO: %d\n", ret);
+		dev_err(dev, "Failed to request svc-reset GPIO: %d\n", ret);
 		return ret;
 	}
 	arche_platform_set_state(arche_pdata, ARCHE_PLATFORM_STATE_OFF);
@@ -454,16 +454,16 @@ static int arche_platform_probe(struct platform_device *pdev)
 						  GPIOD_OUT_LOW);
 	if (IS_ERR(arche_pdata->svc_sysboot)) {
 		ret = PTR_ERR(arche_pdata->svc_sysboot);
-		dev_err(dev, "failed to request sysboot0 GPIO: %d\n", ret);
+		dev_err(dev, "Failed to request sysboot0 GPIO: %d\n", ret);
 		return ret;
 	}
 
-	/* setup the clock request gpio first */
+	/* Setup the clock request gpio first */
 	arche_pdata->svc_refclk_req = devm_gpiod_get(dev, "svc,refclk-req",
 						     GPIOD_IN);
 	if (IS_ERR(arche_pdata->svc_refclk_req)) {
 		ret = PTR_ERR(arche_pdata->svc_refclk_req);
-		dev_err(dev, "failed to request svc-clk-req GPIO: %d\n", ret);
+		dev_err(dev, "Failed to request svc-clk-req GPIO: %d\n", ret);
 		return ret;
 	}
 
@@ -471,7 +471,7 @@ static int arche_platform_probe(struct platform_device *pdev)
 	arche_pdata->svc_ref_clk = devm_clk_get(dev, "svc_ref_clk");
 	if (IS_ERR(arche_pdata->svc_ref_clk)) {
 		ret = PTR_ERR(arche_pdata->svc_ref_clk);
-		dev_err(dev, "failed to get svc_ref_clk: %d\n", ret);
+		dev_err(dev, "Failed to get svc_ref_clk: %d\n", ret);
 		return ret;
 	}
 
@@ -504,20 +504,20 @@ static int arche_platform_probe(struct platform_device *pdev)
 					IRQF_TRIGGER_RISING | IRQF_ONESHOT,
 					dev_name(dev), arche_pdata);
 	if (ret) {
-		dev_err(dev, "failed to request wake detect IRQ %d\n", ret);
+		dev_err(dev, "Failed to request wake detect IRQ %d\n", ret);
 		return ret;
 	}
 	disable_irq(arche_pdata->wake_detect_irq);
 
 	ret = device_create_file(dev, &dev_attr_state);
 	if (ret) {
-		dev_err(dev, "failed to create state file in sysfs\n");
+		dev_err(dev, "Failed to create state file in sysfs\n");
 		return ret;
 	}
 
 	ret = of_platform_populate(np, NULL, NULL, dev);
 	if (ret) {
-		dev_err(dev, "failed to populate child nodes %d\n", ret);
+		dev_err(dev, "Failed to populate child nodes %d\n", ret);
 		goto err_device_remove;
 	}
 
@@ -525,7 +525,7 @@ static int arche_platform_probe(struct platform_device *pdev)
 	ret = register_pm_notifier(&arche_pdata->pm_notifier);
 
 	if (ret) {
-		dev_err(dev, "failed to register pm notifier %d\n", ret);
+		dev_err(dev, "Failed to register pm notifier %d\n", ret);
 		goto err_device_remove;
 	}
 
@@ -570,7 +570,7 @@ static void arche_platform_remove(struct platform_device *pdev)
 	arche_platform_poweroff_seq(arche_pdata);
 
 	if (usb3613_hub_mode_ctrl(false))
-		dev_warn(arche_pdata->dev, "failed to control hub device\n");
+		dev_warn(arche_pdata->dev, "Failed to control hub device\n");
 }
 
 static __maybe_unused int arche_platform_suspend(struct device *dev)
diff --git a/drivers/staging/greybus/authentication.c b/drivers/staging/greybus/authentication.c
index d53e58f92e81..e1a819d1b1c8 100644
--- a/drivers/staging/greybus/authentication.c
+++ b/drivers/staging/greybus/authentication.c
@@ -93,7 +93,7 @@ static int cap_get_endpoint_uid(struct gb_cap *cap, u8 *euid)
 	ret = gb_operation_sync(connection, GB_CAP_TYPE_GET_ENDPOINT_UID, NULL,
 				0, &response, sizeof(response));
 	if (ret) {
-		dev_err(cap->parent, "failed to get endpoint uid (%d)\n", ret);
+		dev_err(cap->parent, "Failed to get endpoint uid (%d)\n", ret);
 		return ret;
 	}
 
@@ -126,7 +126,7 @@ static int cap_get_ims_certificate(struct gb_cap *cap, u32 class, u32 id,
 
 	ret = gb_operation_request_send_sync(op);
 	if (ret) {
-		dev_err(cap->parent, "failed to get certificate (%d)\n", ret);
+		dev_err(cap->parent, "Failed to get certificate (%d)\n", ret);
 		goto done;
 	}
 
@@ -165,7 +165,7 @@ static int cap_authenticate(struct gb_cap *cap, u32 auth_type, u8 *uid,
 
 	ret = gb_operation_request_send_sync(op);
 	if (ret) {
-		dev_err(cap->parent, "failed to authenticate (%d)\n", ret);
+		dev_err(cap->parent, "Failed to authenticate (%d)\n", ret);
 		goto done;
 	}
 
diff --git a/drivers/staging/greybus/bootrom.c b/drivers/staging/greybus/bootrom.c
index d4d86b3898de..8ad763026dea 100644
--- a/drivers/staging/greybus/bootrom.c
+++ b/drivers/staging/greybus/bootrom.c
@@ -179,7 +179,7 @@ static int find_firmware(struct gb_bootrom *bootrom, u8 stage)
 			      &connection->bundle->dev);
 	if (rc) {
 		dev_err(&connection->bundle->dev,
-			"failed to find %s firmware (%d)\n", firmware_name, rc);
+			"Failed to find %s firmware (%d)\n", firmware_name, rc);
 	}
 
 	return rc;
@@ -274,7 +274,7 @@ static int gb_bootrom_get_firmware(struct gb_operation *op)
 	size = le32_to_cpu(firmware_request->size);
 
 	if (offset >= fw->size || size > fw->size - offset) {
-		dev_warn(dev, "bad firmware request (offs = %u, size = %u)\n",
+		dev_warn(dev, "Bad firmware request (offs = %u, size = %u)\n",
 			 offset, size);
 		ret = -EINVAL;
 		goto unlock;
@@ -290,7 +290,7 @@ static int gb_bootrom_get_firmware(struct gb_operation *op)
 	firmware_response = op->response->payload;
 	memcpy(firmware_response, fw->data + offset, size);
 
-	dev_dbg(dev, "responding with firmware (offs = %u, size = %u)\n",
+	dev_dbg(dev, "Responding with firmware (offs = %u, size = %u)\n",
 		offset, size);
 
 unlock:
@@ -340,7 +340,7 @@ static int gb_bootrom_ready_to_boot(struct gb_operation *op)
 	/*
 	 * XXX Should we return error for insecure firmware?
 	 */
-	dev_dbg(dev, "ready to boot: 0x%x, 0\n", status);
+	dev_dbg(dev, "Ready to boot: 0x%x, 0\n", status);
 
 queue_work:
 	/*
@@ -367,7 +367,7 @@ static int gb_bootrom_request_handler(struct gb_operation *op)
 		return gb_bootrom_ready_to_boot(op);
 	default:
 		dev_err(&op->connection->bundle->dev,
-			"unsupported request: %u\n", type);
+			"Unsupported request: %u\n", type);
 		return -EINVAL;
 	}
 }
@@ -388,14 +388,14 @@ static int gb_bootrom_get_version(struct gb_bootrom *bootrom)
 				sizeof(response));
 	if (ret) {
 		dev_err(&bundle->dev,
-			"failed to get protocol version: %d\n",
+			"Failed to get protocol version: %d\n",
 			ret);
 		return ret;
 	}
 
 	if (response.major > request.major) {
 		dev_err(&bundle->dev,
-			"unsupported major protocol version (%u > %u)\n",
+			"Unsupported major protocol version (%u > %u)\n",
 			response.major, request.major);
 		return -ENOTSUPP;
 	}
@@ -467,7 +467,7 @@ static int gb_bootrom_probe(struct gb_bundle *bundle,
 				NULL, 0);
 	if (ret) {
 		dev_err(&connection->bundle->dev,
-			"failed to send AP READY: %d\n", ret);
+			"Failed to send AP READY: %d\n", ret);
 		goto err_cancel_timeout;
 	}
 
diff --git a/drivers/staging/greybus/light.c b/drivers/staging/greybus/light.c
index e509fdc715db..8ee08389d801 100644
--- a/drivers/staging/greybus/light.c
+++ b/drivers/staging/greybus/light.c
@@ -193,7 +193,7 @@ static ssize_t fade_##__dir##_store(struct device *dev,			\
 									\
 	ret = kstrtou8(buf, 0, &fade);					\
 	if (ret < 0) {							\
-		dev_err(dev, "could not parse fade value %d\n", ret);	\
+		dev_err(dev, "Could not parse fade value %d\n", ret);	\
 		goto unlock;						\
 	}								\
 	if (channel->fade_##__dir == fade)				\
@@ -238,7 +238,7 @@ static ssize_t color_store(struct device *dev, struct device_attribute *attr,
 	}
 	ret = kstrtou32(buf, 0, &color);
 	if (ret < 0) {
-		dev_err(dev, "could not parse color value %d\n", ret);
+		dev_err(dev, "Could not parse color value %d\n", ret);
 		goto unlock;
 	}
 
@@ -376,12 +376,12 @@ static int __gb_lights_led_brightness_set(struct gb_channel *channel)
 	else
 		channel->active = false;
 
-	/* we need to keep module alive when turning to active state */
+	/* We need to keep module alive when turning to active state */
 	if (!old_active && channel->active)
 		goto out_unlock;
 
 	/*
-	 * on the other hand if going to inactive we still hold a reference and
+	 * On the other hand if going to inactive we still hold a reference and
 	 * need to put it, so we could go to suspend.
 	 */
 	if (old_active && !channel->active)
@@ -466,12 +466,12 @@ static int gb_blink_set(struct led_classdev *cdev, unsigned long *delay_on,
 	else
 		channel->active = false;
 
-	/* we need to keep module alive when turning to active state */
+	/* We need to keep module alive when turning to active state. */
 	if (!old_active && channel->active)
 		goto out_unlock;
 
 	/*
-	 * on the other hand if going to inactive we still hold a reference and
+	 * On the other hand if going to inactive we still hold a reference and
 	 * need to put it, so we could go to suspend.
 	 */
 	if (old_active && !channel->active)
@@ -532,7 +532,7 @@ static int gb_lights_light_v4l2_register(struct gb_light *light)
 
 	channel_flash = get_channel_from_mode(light, GB_CHANNEL_MODE_FLASH);
 	if (!channel_flash) {
-		dev_err(dev, "failed to get flash channel from mode\n");
+		dev_err(dev, "Failed to get flash channel from mode\n");
 		return -EINVAL;
 	}
 
@@ -576,7 +576,7 @@ static int gb_lights_light_v4l2_register(struct gb_light *light)
 {
 	struct gb_connection *connection = get_conn_from_light(light);
 
-	dev_err(&connection->bundle->dev, "no support for v4l2 subdevices\n");
+	dev_err(&connection->bundle->dev, "No support for v4l2 subdevices\n");
 	return 0;
 }
 
@@ -728,14 +728,14 @@ static int __gb_lights_channel_torch_attach(struct gb_channel *channel,
 {
 	char *name;
 
-	/* we can only attach torch to a flash channel */
+	/* We can only attach torch to a flash channel */
 	if (!(channel->mode & GB_CHANNEL_MODE_FLASH))
 		return 0;
 
 	/* Move torch brightness to the destination */
 	channel->led->max_brightness = channel_torch->led->max_brightness;
 
-	/* append mode name to flash name */
+	/* Append mode name to flash name */
 	name = kasprintf(GFP_KERNEL, "%s_%s", channel->led->name,
 			 channel_torch->mode_name);
 	if (!name)
@@ -777,7 +777,7 @@ static int __gb_lights_flash_led_register(struct gb_channel *channel)
 
 	/*
 	 * If light have torch mode channel, this channel will be the led
-	 * classdev of the registered above flash classdev
+	 * classdev of the registered above flash classdev.
 	 */
 	channel_torch = get_channel_from_mode(channel->light,
 					      GB_CHANNEL_MODE_TORCH);
@@ -838,7 +838,7 @@ static int gb_lights_channel_flash_config(struct gb_channel *channel)
 	 */
 	channel->led->max_brightness = (fset->max - fset->min) / fset->step;
 
-	/* Only the flash mode have the timeout constraints settings */
+	/* Only the flash mode have the timeout constraints settings. */
 	if (channel->mode & GB_CHANNEL_MODE_FLASH) {
 		fset = &channel->timeout_us;
 		fset->min = le32_to_cpu(conf.timeout_min_us);
@@ -853,7 +853,7 @@ static int gb_lights_channel_flash_config(struct gb_channel *channel)
 {
 	struct gb_connection *connection = get_conn_from_channel(channel);
 
-	dev_err(&connection->bundle->dev, "no support for flash devices\n");
+	dev_err(&connection->bundle->dev, "No support for flash devices\n");
 	return 0;
 }
 
diff --git a/drivers/staging/greybus/log.c b/drivers/staging/greybus/log.c
index 57dcf9453bf1..ce47f16a0c5b 100644
--- a/drivers/staging/greybus/log.c
+++ b/drivers/staging/greybus/log.c
@@ -23,30 +23,30 @@ static int gb_log_request_handler(struct gb_operation *op)
 	u16 len;
 
 	if (op->type != GB_LOG_TYPE_SEND_LOG) {
-		dev_err(dev, "unknown request type 0x%02x\n", op->type);
+		dev_err(dev, "Unknown request type 0x%02x\n", op->type);
 		return -EINVAL;
 	}
 
 	/* Verify size of payload */
 	if (op->request->payload_size < sizeof(*receive)) {
-		dev_err(dev, "log request too small (%zu < %zu)\n",
+		dev_err(dev, "Log request too small (%zu < %zu)\n",
 			op->request->payload_size, sizeof(*receive));
 		return -EINVAL;
 	}
 	receive = op->request->payload;
 	len = le16_to_cpu(receive->len);
 	if (len != (op->request->payload_size - sizeof(*receive))) {
-		dev_err(dev, "log request wrong size %d vs %zu\n", len,
+		dev_err(dev, "Log request wrong size %d vs %zu\n", len,
 			(op->request->payload_size - sizeof(*receive)));
 		return -EINVAL;
 	}
 	if (len == 0) {
-		dev_err(dev, "log request of 0 bytes?\n");
+		dev_err(dev, "Log request of 0 bytes?\n");
 		return -EINVAL;
 	}
 
 	if (len > GB_LOG_MAX_LEN) {
-		dev_err(dev, "log request too big: %d\n", len);
+		dev_err(dev, "Log request too big: %d\n", len);
 		return -EINVAL;
 	}
 
-- 
2.39.2

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
