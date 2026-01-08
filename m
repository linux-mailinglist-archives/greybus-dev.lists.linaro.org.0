Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id A9796D03D0C
	for <lists+greybus-dev@lfdr.de>; Thu, 08 Jan 2026 16:26:13 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id C9C1540149
	for <lists+greybus-dev@lfdr.de>; Thu,  8 Jan 2026 15:26:12 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	by lists.linaro.org (Postfix) with ESMTPS id 430993F776
	for <greybus-dev@lists.linaro.org>; Thu,  8 Jan 2026 15:13:02 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=I10HtMdX;
	spf=pass (lists.linaro.org: domain of chaitanyamishra.ai@gmail.com designates 209.85.215.169 as permitted sender) smtp.mailfrom=chaitanyamishra.ai@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-c1e4a9033abso1822227a12.3
        for <greybus-dev@lists.linaro.org>; Thu, 08 Jan 2026 07:13:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767885181; x=1768489981; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=u9frDM5lhsIsOta1J2dC3heJ0BptFvIr5tuBxk7iS/w=;
        b=I10HtMdXYS2U9EjNgFShCCwB00TJuGpTTY7j+VZu5AaMHJ95xN5X88FI4lW//0V4rZ
         tVGI9jym4CwBZE8GOe8DIJju7OPu/H7D2VOtcXT1Qi6rpuf5ct0Dy/7su5bD7vVBgzPQ
         NcQBzB9L4HHtZZ3oq4deb1NVkMybbC5X8Zog8kqzDn/X4/xPFJQy66Gn1cD4JpbR16nY
         GdSXMfeDAQhp/RO7zzEyiPXFUw4TZtufEX+htF1CCwr9GDiJE/gCxSGaHACxfdNezm6o
         sOjv35K2hugLptzYYNzXmhwTgPTKd3dB1b9FWfB9ZK5cShyaiGPtgU+59ytni+P3iqiO
         9Asg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767885181; x=1768489981;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u9frDM5lhsIsOta1J2dC3heJ0BptFvIr5tuBxk7iS/w=;
        b=iH54BZImEwkvVUKxWJ43P665Mlo2aJ7XKz61HPP0nmLppGJ216f6ucfdPZ32sNUG/R
         ju1d6rHRHBfCI/GM6bIU2/Ecw58JsIUEuUGanxDVYP1F3EYRzC07PEKbS1xhi7LmdCIa
         VxYfB9euf9Y3M6/9xu6O3J6DokNW+pwi/9FQK8RQjigYixldKwCcaa5dkWcUxytLQS2l
         wpiMb8wRJuDxSeJFetEsvE312lS7G+vgbwPlBLLOdooETBWl+dl0SodVk5B+95DxpCnx
         YCFln76M4QHnvTpbAL0CH1w+1Lr+UbxV2fsqeQP6qe4vDzx+kgAC0Zu9OIfTe4lDkXDq
         CdaQ==
X-Gm-Message-State: AOJu0YyTpvt8V+8hgvj05oB7Za7WnRSqI2CZIwat8q54CdEmy5CLPCUf
	1YljHI0WO2vgZVtcawJ528GUnhBSKcgboOpsOQI1+zEP6Jvl8LdbHpOI
X-Gm-Gg: AY/fxX40QpVPNhkc5VDPhIWF+pQ6Rw4d93bO9eaW12KR1E0ZPzPmEs2DJO82kHUdhLx
	OHx00ufYjl9C3B7oeJbovW2DZHBaDaClgUdiT/zBVyvNfaAUAF8foqydurRZkOjQdJ9H5B+Yh6v
	eqvxUDHeiyRwHBuc7FdCTB9DgpSFrbJjvYYLX6YSYs1Dgmj1Li1JADtqGTFWJdy4GrNH3D5++ob
	/bkzKjde/pImKHTBryoSoqJWBfLAuXHKbE6TCe11uMR39p7V603Qf7TEJKfesOes0H0K8GnZjhB
	VvKwpJWV6K8DQFxd19eELOTcEII26Ra0I0F3jduOcgRQ03Cc0Nvr3GeJd8vkFRlUBsPJRGrNydr
	85VHJZvH4h6pjOm1PfjSTy2MEHgh1xdvsmeq5kkV19pADSeyfuxGAxdS7RHmuFnyBexg/+v1Zxi
	wlKWEPB/0H4xzmGl3QnakfD/xSrNzaNUrBtQvVb9Anjo8tV0STd6DGyB4CjMU=
X-Google-Smtp-Source: AGHT+IEzA/mL+RgRg1Lb+6pXizfwPfga2Mz5SLJjfBB2pKPQSloH1grWX2Sz4faegTP/rpZLUzZR7g==
X-Received: by 2002:a05:6a20:3ca7:b0:364:1425:8099 with SMTP id adf61e73a8af0-3898f905cccmr6190413637.24.1767885181241;
        Thu, 08 Jan 2026 07:13:01 -0800 (PST)
Received: from localhost.localdomain ([2409:40e3:44:c9c0:8d34:cc3d:a8c9:1a48])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c4cbf28f6cdsm8188087a12.6.2026.01.08.07.12.57
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 08 Jan 2026 07:13:00 -0800 (PST)
From: Chaitanya Mishra <chaitanyamishra.ai@gmail.com>
To: rmfrfs@gmail.com,
	johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org
Date: Thu,  8 Jan 2026 20:42:54 +0530
Message-ID: <20260108151254.81553-1-chaitanyamishra.ai@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Rspamd-Queue-Id: 430993F776
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.60 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.215.169:from];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,linuxfoundation.org];
	ARC_NA(0.00)[];
	DNSWL_BLOCKED(0.00)[209.85.215.169:from,2409:40e3:44:c9c0:8d34:cc3d:a8c9:1a48:received];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FREEMAIL_CC(0.00)[lists.linaro.org,lists.linux.dev,vger.kernel.org,gmail.com,linaro.org];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-MailFrom: chaitanyamishra.ai@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: 54334CC23IES4EGGQNDK26BLDJJB3LNS
X-Message-ID-Hash: 54334CC23IES4EGGQNDK26BLDJJB3LNS
X-Mailman-Approved-At: Thu, 08 Jan 2026 15:26:11 +0000
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Chaitanya Mishra <chaitanyamishra.ai@gmail.com>, Rui Miguel Silva <rui.silva@linaro.org>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v4] staging: greybus: lights: avoid NULL deref
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/54334CC23IES4EGGQNDK26BLDJJB3LNS/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

gb_lights_light_config() stores channel_count before allocating the
channels array. If kcalloc() fails, gb_lights_release() iterates the
non-zero count and dereferences light->channels, which is NULL.

Allocate channels first and only then publish channels_count so the
cleanup path can't walk a NULL pointer.

Fixes: 2870b52bae4c ("greybus: lights: add lights implementation")
Link: https://lore.kernel.org/all/20260108103700.15384-1-chaitanyamishra.ai@gmail.com/
Reviewed-by: Rui Miguel Silva <rui.silva@linaro.org>
Signed-off-by: Chaitanya Mishra <chaitanyamishra.ai@gmail.com>
---
Changes in v4:
- Add Link to v1 and carry Reviewed-by.
- Tested: make defconfig, make modules_prepare, make M=drivers/staging/greybus/ modules (AWS EC2 eu-central-2, Amazon Linux 2023 x86_64).

Changes in v3:
- Add version changelog below the --- line (no code changes).

 drivers/staging/greybus/light.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/greybus/light.c b/drivers/staging/greybus/light.c
index e509fdc715db..38c233a706c4 100644
--- a/drivers/staging/greybus/light.c
+++ b/drivers/staging/greybus/light.c
@@ -1008,14 +1008,18 @@ static int gb_lights_light_config(struct gb_lights *glights, u8 id)
 	if (!strlen(conf.name))
 		return -EINVAL;
 
-	light->channels_count = conf.channel_count;
 	light->name = kstrndup(conf.name, NAMES_MAX, GFP_KERNEL);
 	if (!light->name)
 		return -ENOMEM;
-	light->channels = kcalloc(light->channels_count,
+	light->channels = kcalloc(conf.channel_count,
 				  sizeof(struct gb_channel), GFP_KERNEL);
 	if (!light->channels)
 		return -ENOMEM;
+	/*
+	 * Publish channels_count only after channels allocation so cleanup
+	 * doesn't walk a NULL channels pointer on allocation failure.
+	 */
+	light->channels_count = conf.channel_count;
 
 	/* First we collect all the configurations for all channels */
 	for (i = 0; i < light->channels_count; i++) {
-- 
2.50.1 (Apple Git-155)

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
