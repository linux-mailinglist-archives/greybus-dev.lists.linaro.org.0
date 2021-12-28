Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id AB0134809C4
	for <lists+greybus-dev@lfdr.de>; Tue, 28 Dec 2021 14:55:55 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 56AC36123A
	for <lists+greybus-dev@lfdr.de>; Tue, 28 Dec 2021 13:55:54 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id EED80611B1; Tue, 28 Dec 2021 13:55:53 +0000 (UTC)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 5D99060FAD;
	Tue, 28 Dec 2021 13:55:51 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id CEF616070A
 for <greybus-dev@lists.linaro.org>; Tue, 28 Dec 2021 13:55:50 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id C3B0960DA3; Tue, 28 Dec 2021 13:55:50 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by lists.linaro.org (Postfix) with ESMTPS id A3AE16070A
 for <greybus-dev@lists.linaro.org>; Tue, 28 Dec 2021 13:55:48 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 12B42B811C3;
 Tue, 28 Dec 2021 13:55:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D690C36AE8;
 Tue, 28 Dec 2021 13:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1640699745;
 bh=o9QG8yiIHBeDVV2wCohop+8PiLu2SkLHqi375SZTvoA=;
 h=From:To:Cc:Subject:Date:From;
 b=c5nmRaRC/Z1At1jCUXPEaiboPu5ZKEDScaD195HtOjN1ehZG09xSSOiOsJYKs4zqG
 9Yw6w3ocGrofjgn+KJ2pf1+bS1bqn7HJvaCT0XUR0bhF7OW31Lv1SenyeRqT/QeLk7
 4MS0N8OaYNJZww+9me6Lon3huPeZe6ecBSQGuv/0=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org
Date: Tue, 28 Dec 2021 14:55:41 +0100
Message-Id: <20211228135541.380275-1-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1625; h=from:subject;
 bh=o9QG8yiIHBeDVV2wCohop+8PiLu2SkLHqi375SZTvoA=;
 b=owGbwMvMwCRo6H6F97bub03G02pJDImnxaNvPfcujbQTT41cuqT6vrByx679Tr09u6f+7Jru+m/7
 BlWGjlgWBkEmBlkxRZYv23iO7q84pOhlaHsaZg4rE8gQBi5OAZjIhkaGBSdD7wt9dplnVX5PQ4Tbdt
 rl2RsmdzAs2DHp/PuTN4O9Jsgbf7/MKp3r1nf7LwA=
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp;
 fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: [greybus-dev] [PATCH] staging: greybus: auto_manager: use
 default_groups in kobj_type
X-BeenThere: greybus-dev@lists.linaro.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
List-Unsubscribe: <https://lists.linaro.org/mailman/options/greybus-dev>,
 <mailto:greybus-dev-request@lists.linaro.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/greybus-dev/>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Subscribe: <https://lists.linaro.org/mailman/listinfo/greybus-dev>,
 <mailto:greybus-dev-request@lists.linaro.org?subject=subscribe>
Cc: Alex Elder <elder@kernel.org>, linux-staging@lists.linux.dev,
 Johan Hovold <johan@kernel.org>, greybus-dev@lists.linaro.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: greybus-dev-bounces@lists.linaro.org
Sender: "greybus-dev" <greybus-dev-bounces@lists.linaro.org>
X-Virus-Scanned: ClamAV using ClamSMTP

There are currently 2 ways to create a set of sysfs files for a
kobj_type, through the default_attrs field, and the default_groups
field.  Move the greybus audio code to use default_groups field which
has been the preferred way since aa30f47cf666 ("kobject: Add support for
default attribute groups to kobj_type") so that we can soon get rid of
the obsolete default_attrs field.

Cc: Vaibhav Agarwal <vaibhav.sr@gmail.com>
Cc: Mark Greer <mgreer@animalcreek.com>
Cc: Johan Hovold <johan@kernel.org>
Cc: Alex Elder <elder@kernel.org>
Cc: greybus-dev@lists.linaro.org
Cc: linux-staging@lists.linux.dev
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/staging/greybus/audio_manager_module.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/audio_manager_module.c b/drivers/staging/greybus/audio_manager_module.c
index 525cf8f8394f..0a0f0a394c84 100644
--- a/drivers/staging/greybus/audio_manager_module.c
+++ b/drivers/staging/greybus/audio_manager_module.c
@@ -142,11 +142,12 @@ static struct attribute *gb_audio_module_default_attrs[] = {
 	&gb_audio_module_op_devices_attribute.attr,
 	NULL,   /* need to NULL terminate the list of attributes */
 };
+ATTRIBUTE_GROUPS(gb_audio_module_default);
 
 static struct kobj_type gb_audio_module_type = {
 	.sysfs_ops = &gb_audio_module_sysfs_ops,
 	.release = gb_audio_module_release,
-	.default_attrs = gb_audio_module_default_attrs,
+	.default_groups = gb_audio_module_default_groups,
 };
 
 static void send_add_uevent(struct gb_audio_manager_module *module)
-- 
2.34.1

_______________________________________________
greybus-dev mailing list
greybus-dev@lists.linaro.org
https://lists.linaro.org/mailman/listinfo/greybus-dev
