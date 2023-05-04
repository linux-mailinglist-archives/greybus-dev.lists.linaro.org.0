Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D126FF0FC
	for <lists+greybus-dev@lfdr.de>; Thu, 11 May 2023 14:02:21 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 61BBE44354
	for <lists+greybus-dev@lfdr.de>; Thu, 11 May 2023 12:02:20 +0000 (UTC)
Received: from hust.edu.cn (mail.hust.edu.cn [202.114.0.240])
	by lists.linaro.org (Postfix) with ESMTPS id 313373EF1C
	for <greybus-dev@lists.linaro.org>; Thu,  4 May 2023 14:02:45 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=none;
	spf=pass (lists.linaro.org: domain of dzm91@hust.edu.cn designates 202.114.0.240 as permitted sender) smtp.mailfrom=dzm91@hust.edu.cn;
	dmarc=none
Received: from localhost.localdomain ([172.16.0.254])
	(user=dzm91@hust.edu.cn mech=LOGIN bits=0)
	by mx1.hust.edu.cn  with ESMTP id 344E1fZO011334-344E1fZR011334
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Thu, 4 May 2023 22:01:46 +0800
From: Dongliang Mu <dzm91@hust.edu.cn>
To: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jacopo Mondi <jacopo.mondi@linaro.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Date: Thu,  4 May 2023 21:58:41 +0800
Message-Id: <20230504135841.1566958-1-dzm91@hust.edu.cn>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-FEAS-AUTH-USER: dzm91@hust.edu.cn
X-Spamd-Result: default: False [-2.30 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	RCVD_IN_DNSWL_HI(-0.50)[202.114.0.240:from];
	R_SPF_ALLOW(-0.20)[+ip4:202.114.0.240];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:4538, ipnet:202.114.0.0/19, country:CN];
	FROM_EQ_ENVFROM(0.00)[];
	R_DKIM_NA(0.00)[];
	RCVD_COUNT_ONE(0.00)[1];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_SPAM(0.00)[0.998];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	DMARC_NA(0.00)[hust.edu.cn];
	ARC_NA(0.00)[]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 313373EF1C
X-Spamd-Bar: --
X-MailFrom: dzm91@hust.edu.cn
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: 3JHAJ4PDGRI77NMBLYCJ4JT3VAIHZN4N
X-Message-ID-Hash: 3JHAJ4PDGRI77NMBLYCJ4JT3VAIHZN4N
X-Mailman-Approved-At: Thu, 11 May 2023 12:02:17 +0000
CC: Dongliang Mu <dzm91@hust.edu.cn>, Greg Kroah-Hartman <gregkh@google.com>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] drivers: staging: greybus: fix GPF issue in gb_camera_capture
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/3JHAJ4PDGRI77NMBLYCJ4JT3VAIHZN4N/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

In gb_camera_capture(), it does not check the value of settings
before dereferencing it. And gb_camera_debugfs_capture calls
gb_camera_capture with the 6th parameter settings as NULL.

Fix this by checking the value of setting at the starting of
gb_camera_capture.

Fixes: 3265edaf0d70 ("greybus: Add driver for the camera class protocol")
Signed-off-by: Dongliang Mu <dzm91@hust.edu.cn>
---
 drivers/staging/greybus/camera.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/camera.c b/drivers/staging/greybus/camera.c
index cdbb42cd413b..5a4b26e7f645 100644
--- a/drivers/staging/greybus/camera.c
+++ b/drivers/staging/greybus/camera.c
@@ -659,7 +659,7 @@ static int gb_camera_capture(struct gb_camera *gcam, u32 request_id,
 	size_t req_size;
 	int ret;
 
-	if (settings_size > GB_CAMERA_MAX_SETTINGS_SIZE)
+	if (settings_size > GB_CAMERA_MAX_SETTINGS_SIZE || !settings)
 		return -EINVAL;
 
 	req_size = sizeof(*req) + settings_size;
-- 
2.39.2

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
