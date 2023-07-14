Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E52D754159
	for <lists+greybus-dev@lfdr.de>; Fri, 14 Jul 2023 19:51:10 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 1E5813F503
	for <lists+greybus-dev@lfdr.de>; Fri, 14 Jul 2023 17:51:09 +0000 (UTC)
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com [209.85.166.53])
	by lists.linaro.org (Postfix) with ESMTPS id A56FE3F503
	for <greybus-dev@lists.linaro.org>; Fri, 14 Jul 2023 17:51:02 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=none;
	spf=pass (lists.linaro.org: domain of robherring2@gmail.com designates 209.85.166.53 as permitted sender) smtp.mailfrom=robherring2@gmail.com;
	dmarc=fail reason="SPF not aligned (relaxed), No valid DKIM" header.from=kernel.org (policy=none)
Received: by mail-io1-f53.google.com with SMTP id ca18e2360f4ac-7836164a08aso89279039f.1
        for <greybus-dev@lists.linaro.org>; Fri, 14 Jul 2023 10:51:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689357062; x=1691949062;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dfZt0Y26M5pBCstI8AhRHneftpCtl5efvu3OXJ2yZ/o=;
        b=RT9hdOliy5aU6A97yW4RNvPuzeOaaG2yF0tDNzsi7v4U6kyBdZCjOgZ4wFhqNYhy4H
         H9rKYVZf0OkFe5bEKn8k649SPeCQPWMa64qt1k7RuFBJcpndRqg0nRQwKqvG9taENAY5
         1UKqSwXmFOPq/Bfc0nzd+Xf5/b6wzrPsmKpYhupR880qnJxKx9Ely0xPHUr+9+y2Do3K
         pUtJZmG+UzEOw9Xdr5aoN1QoXn4bgH8C6fPi2gfIjE3Upn283vqJO0Q14l0U6C1jDrdd
         8pvKjWsPJyvCDkP7kwkNLDgPs9gyZHTtJ+SVqcjtpkuMr71wB4im99xf2eAAfVXF2/ms
         Vm5A==
X-Gm-Message-State: ABy/qLaXwm4y426Ml4q+QC1QQrR0i45YOTfgys/EbZCz+8FKC/G1TYXM
	2dVRndeVLz9yulkYob8OaQ==
X-Google-Smtp-Source: APBJJlG4GBp9dJrKCr9W02IYXrOkhCe1wTDrg4ydVMkkkfirpBpwQ5ks/kK/kiwd4gjtEHeHFggP/Q==
X-Received: by 2002:a92:d181:0:b0:341:e2aa:3552 with SMTP id z1-20020a92d181000000b00341e2aa3552mr4865990ilz.4.1689357062084;
        Fri, 14 Jul 2023 10:51:02 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id ee13-20020a056638292d00b0042b1354452csm2789728jab.83.2023.07.14.10.50.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jul 2023 10:51:01 -0700 (PDT)
Received: (nullmailer pid 4064549 invoked by uid 1000);
	Fri, 14 Jul 2023 17:50:06 -0000
From: Rob Herring <robh@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Vaibhav Hiremath <hvaibhav.linux@gmail.com>,
	Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	Steve Longerbeam <slongerbeam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Maxime Ripard <mripard@kernel.org>,
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Parthiban Veerasooran <parthiban.veerasooran@microchip.com>,
	Christian Gromm <christian.gromm@microchip.com>
Date: Fri, 14 Jul 2023 11:50:01 -0600
Message-Id: <20230714175002.4064428-1-robh@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spamd-Result: default: False [-0.40 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	RCVD_IN_DNSWL_HI(-0.50)[64.188.179.250:received];
	R_MISSING_CHARSET(0.50)[];
	FORGED_SENDER(0.30)[robh@kernel.org,robherring2@gmail.com];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17:c];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[kernel.org : SPF not aligned (relaxed), No valid DKIM,none];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[36];
	RCVD_TLS_LAST(0.00)[];
	RCVD_IN_DNSWL_NONE(0.00)[209.85.166.53:from];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.166.53:from];
	RCVD_COUNT_TWO(0.00)[2];
	R_DKIM_NA(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,robherring2@gmail.com];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	FREEMAIL_TO(0.00)[linuxfoundation.org,gmail.com,kernel.org,pengutronix.de,nxp.com,linaro.org,baylibre.com,googlemail.com,bootlin.com,csie.org,sholland.org,nvidia.com,microchip.com];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: A56FE3F503
X-Spamd-Bar: /
Message-ID-Hash: ONN4OAAOZCXPJPCWZXNCU4T7OWSXBJ6L
X-Message-ID-Hash: ONN4OAAOZCXPJPCWZXNCU4T7OWSXBJ6L
X-MailFrom: robherring2@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: devicetree@vger.kernel.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, greybus-dev@lists.linaro.org, linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] staging: Explicitly include correct DT includes
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/ONN4OAAOZCXPJPCWZXNCU4T7OWSXBJ6L/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The DT of_device.h and of_platform.h date back to the separate
of_platform_bus_type before it as merged into the regular platform bus.
As part of that merge prepping Arm DT support 13 years ago, they
"temporarily" include each other. They also include platform_device.h
and of.h. As a result, there's a pretty much random mix of those include
files used throughout the tree. In order to detangle these headers and
replace the implicit includes with struct declarations, users need to
explicitly include the correct includes.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/staging/axis-fifo/axis-fifo.c             | 6 ++----
 drivers/staging/greybus/arche-platform.c          | 1 +
 drivers/staging/media/imx/imx-media-capture.c     | 1 -
 drivers/staging/media/imx/imx-media-dev-common.c  | 2 --
 drivers/staging/media/imx/imx8mq-mipi-csi2.c      | 1 -
 drivers/staging/media/meson/vdec/esparser.c       | 1 -
 drivers/staging/media/meson/vdec/vdec.c           | 2 +-
 drivers/staging/media/sunxi/cedrus/cedrus_hw.c    | 2 +-
 drivers/staging/media/sunxi/sun6i-isp/sun6i_isp.c | 1 -
 drivers/staging/media/tegra-video/csi.c           | 1 -
 drivers/staging/media/tegra-video/vi.c            | 2 +-
 drivers/staging/media/tegra-video/vip.c           | 1 -
 drivers/staging/most/dim2/dim2.c                  | 2 +-
 drivers/staging/pi433/pi433_if.c                  | 1 -
 14 files changed, 7 insertions(+), 17 deletions(-)

diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
index 98db47cb4fa4..5910fada7075 100644
--- a/drivers/staging/axis-fifo/axis-fifo.c
+++ b/drivers/staging/axis-fifo/axis-fifo.c
@@ -15,6 +15,8 @@
  */
 
 #include <linux/kernel.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
 #include <linux/wait.h>
 #include <linux/mutex.h>
 #include <linux/device.h>
@@ -32,10 +34,6 @@
 #include <linux/jiffies.h>
 #include <linux/miscdevice.h>
 
-#include <linux/of_address.h>
-#include <linux/of_device.h>
-#include <linux/of_platform.h>
-
 /* ----------------------------
  *       driver parameters
  * ----------------------------
diff --git a/drivers/staging/greybus/arche-platform.c b/drivers/staging/greybus/arche-platform.c
index ebe835f25d13..891b75327d7f 100644
--- a/drivers/staging/greybus/arche-platform.c
+++ b/drivers/staging/greybus/arche-platform.c
@@ -20,6 +20,7 @@
 #include <linux/suspend.h>
 #include <linux/time.h>
 #include <linux/greybus.h>
+#include <linux/of.h>
 #include "arche_platform.h"
 
 #if IS_ENABLED(CONFIG_USB_HSIC_USB3613)
diff --git a/drivers/staging/media/imx/imx-media-capture.c b/drivers/staging/media/imx/imx-media-capture.c
index 4364df27c6d2..4846078315ff 100644
--- a/drivers/staging/media/imx/imx-media-capture.c
+++ b/drivers/staging/media/imx/imx-media-capture.c
@@ -7,7 +7,6 @@
 #include <linux/delay.h>
 #include <linux/fs.h>
 #include <linux/module.h>
-#include <linux/of_platform.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/platform_device.h>
 #include <linux/sched.h>
diff --git a/drivers/staging/media/imx/imx-media-dev-common.c b/drivers/staging/media/imx/imx-media-dev-common.c
index 991820a8500f..7b7cbec08326 100644
--- a/drivers/staging/media/imx/imx-media-dev-common.c
+++ b/drivers/staging/media/imx/imx-media-dev-common.c
@@ -6,8 +6,6 @@
  * Copyright (c) 2016 Mentor Graphics Inc.
  */
 
-#include <linux/of_graph.h>
-#include <linux/of_platform.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-event.h>
 #include <media/v4l2-ioctl.h>
diff --git a/drivers/staging/media/imx/imx8mq-mipi-csi2.c b/drivers/staging/media/imx/imx8mq-mipi-csi2.c
index ca2efcc21efe..c84b6dceece2 100644
--- a/drivers/staging/media/imx/imx8mq-mipi-csi2.c
+++ b/drivers/staging/media/imx/imx8mq-mipi-csi2.c
@@ -17,7 +17,6 @@
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
diff --git a/drivers/staging/media/meson/vdec/esparser.c b/drivers/staging/media/meson/vdec/esparser.c
index 7b15fc54efe4..4632346f04a9 100644
--- a/drivers/staging/media/meson/vdec/esparser.c
+++ b/drivers/staging/media/meson/vdec/esparser.c
@@ -11,7 +11,6 @@
 #include <linux/ioctl.h>
 #include <linux/list.h>
 #include <linux/module.h>
-#include <linux/of_device.h>
 #include <linux/reset.h>
 #include <linux/interrupt.h>
 #include <media/videobuf2-dma-contig.h>
diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index 5ca4b1200831..219185aaa588 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -4,7 +4,7 @@
  * Author: Maxime Jourdan <mjourdan@baylibre.com>
  */
 
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/clk.h>
 #include <linux/io.h>
 #include <linux/module.h>
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_hw.c b/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
index fa86a658fdc6..b696bf884cbd 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
@@ -14,8 +14,8 @@
  */
 
 #include <linux/platform_device.h>
+#include <linux/of.h>
 #include <linux/of_reserved_mem.h>
-#include <linux/of_device.h>
 #include <linux/dma-mapping.h>
 #include <linux/interrupt.h>
 #include <linux/clk.h>
diff --git a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp.c b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp.c
index 0dc75adbd9d8..8337dc487047 100644
--- a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp.c
+++ b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp.c
@@ -10,7 +10,6 @@
 #include <linux/interrupt.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
diff --git a/drivers/staging/media/tegra-video/csi.c b/drivers/staging/media/tegra-video/csi.c
index 052172017b3b..e79657920dc8 100644
--- a/drivers/staging/media/tegra-video/csi.c
+++ b/drivers/staging/media/tegra-video/csi.c
@@ -10,7 +10,6 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_graph.h>
-#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 
diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index 79284c3b6cae..4add037537a2 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -11,8 +11,8 @@
 #include <linux/list.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/of_graph.h>
+#include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/regulator/consumer.h>
 #include <linux/pm_runtime.h>
diff --git a/drivers/staging/media/tegra-video/vip.c b/drivers/staging/media/tegra-video/vip.c
index a1ab886acc18..4cf3fde7e034 100644
--- a/drivers/staging/media/tegra-video/vip.c
+++ b/drivers/staging/media/tegra-video/vip.c
@@ -13,7 +13,6 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_graph.h>
-#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 
diff --git a/drivers/staging/most/dim2/dim2.c b/drivers/staging/most/dim2/dim2.c
index 44d3252d4612..ed6a9cc88541 100644
--- a/drivers/staging/most/dim2/dim2.c
+++ b/drivers/staging/most/dim2/dim2.c
@@ -8,7 +8,6 @@
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
 #include <linux/module.h>
-#include <linux/of_platform.h>
 #include <linux/printk.h>
 #include <linux/kernel.h>
 #include <linux/init.h>
@@ -21,6 +20,7 @@
 #include <linux/sched.h>
 #include <linux/kthread.h>
 #include <linux/most.h>
+#include <linux/of.h>
 #include "hal.h"
 #include "errors.h"
 #include "sysfs.h"
diff --git a/drivers/staging/pi433/pi433_if.c b/drivers/staging/pi433/pi433_if.c
index 220e157d4a5e..58887619b83f 100644
--- a/drivers/staging/pi433/pi433_if.c
+++ b/drivers/staging/pi433/pi433_if.c
@@ -31,7 +31,6 @@
 #include <linux/errno.h>
 #include <linux/mutex.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/interrupt.h>
 #include <linux/irq.h>
 #include <linux/gpio/consumer.h>
-- 
2.40.1

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
