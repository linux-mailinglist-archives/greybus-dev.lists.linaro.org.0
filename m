Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id DC52F874B42
	for <lists+greybus-dev@lfdr.de>; Thu,  7 Mar 2024 10:49:11 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id B899843EDD
	for <lists+greybus-dev@lfdr.de>; Thu,  7 Mar 2024 09:49:10 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	by lists.linaro.org (Postfix) with ESMTPS id 5FF653F2EC
	for <greybus-dev@lists.linaro.org>; Thu,  7 Mar 2024 09:49:05 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linaro.org header.s=google header.b=cU6vfA1N;
	spf=pass (lists.linaro.org: domain of rui.silva@linaro.org designates 209.85.128.50 as permitted sender) smtp.mailfrom=rui.silva@linaro.org;
	dmarc=pass (policy=none) header.from=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-412e6ba32easo5607865e9.0
        for <greybus-dev@lists.linaro.org>; Thu, 07 Mar 2024 01:49:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709804944; x=1710409744; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=E9yoQN2LCSmxbmuEOLxqt9Q4MdSkQpGeWBb6PU8m5tU=;
        b=cU6vfA1NVqRV3xtukFe0La8EdItdBX1EbCm71ZzWgZkauW9Duy5DT1r8xz6xoxsrnm
         UJRuvZBP5WtPfcaXXG8AMOApSS3WC8eF9XamG2hLiLPt0f6TKoe9zYcUNC9Jrt9FRf8z
         2FWWGUAKWEAr+/PJQhSFP3DzvhS8DFW3SCIylf27rX2DBi+cw0vX4N/k3+8LQ/wScIs1
         vjvGinKBG7h+yhU+n43vxU7++sH78L9I3ztoIwoS+6as/a/JuIFnE29jFgRHoE9Vknin
         0lYvPLciN2Gv2EzGXE/zIZEC4rqT6Z4efNV/IGvzzId2Iqi1Na6unGIR9UuJZiUaiHPa
         IbFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709804944; x=1710409744;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E9yoQN2LCSmxbmuEOLxqt9Q4MdSkQpGeWBb6PU8m5tU=;
        b=Q1xDkhiyDj2eRShFFEiQkM7CAgaQ54nF4JN05SFddjJMNWvTQQYCMApGE+/b4xCWm6
         us6USfIxyyKM3NoASkO5z0BXH2znk+qpL/BgjGvDRX05+uJG8vWanLwpv6M9qvBYMM7U
         QhBLbTrYyky8Vdg6QFJOhO+ZsIc8BboNOFCWQsK8G030Kk45gBQSQkyZ5oueqVDqrOg0
         2mj9RugsplAmuOtPZ4u6FCDEci66tqApw+J7ZaRU+xJb1+NKmc/KgWaiqXa6fEI41hUs
         hc7kHzsPcNBTycbAKWeFBVVPNzGqQdLSFDx17vkuWLnNBolu0h3KMmrKMVRZzCcdI3dU
         xuEQ==
X-Forwarded-Encrypted: i=1; AJvYcCV8/ADVt1tBVWxDGjLYkAD0V2ssF71gxYNVgvbcPCdYJ5D6nMCkk9k9OxXiMXc+xdiQynJBqBtF4DzlwRGEQNlTaU3D/S7fNia3LHaZ
X-Gm-Message-State: AOJu0YxUJBX0arUegfXjSLxNv3a1xBvI1C72rkIWSMEGrOdzx/GmR4Tv
	NTUEom4DZU50tliPP6/IZ66sqwkAgAecSKIxAhA/Szx2/IM12Cw7CNA3fE7M/GnxOA==
X-Google-Smtp-Source: AGHT+IFnrmvAtB1ezZQvIcRm6PjS8kaHV8XeFh+b2E1byy8yJYxsb94o7ecvzoWhs+Be2fccPiNCiA==
X-Received: by 2002:a05:600c:3550:b0:412:a141:c01e with SMTP id i16-20020a05600c355000b00412a141c01emr13027365wmq.0.1709804944163;
        Thu, 07 Mar 2024 01:49:04 -0800 (PST)
Received: from arch-thunder.local (a109-49-32-45.cpe.netcabo.pt. [109.49.32.45])
        by smtp.gmail.com with ESMTPSA id hn37-20020a05600ca3a500b00412f478a90bsm2017137wmb.48.2024.03.07.01.49.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 01:49:03 -0800 (PST)
From: Rui Miguel Silva <rui.silva@linaro.org>
X-Google-Original-From: Rui Miguel Silva <rmfrfs@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org
Date: Thu,  7 Mar 2024 09:48:13 +0000
Message-ID: <20240307094838.688281-1-rmfrfs@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 5FF653F2EC
X-Spamd-Bar: ---
X-Spamd-Result: default: False [-3.50 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_COUNT_TWO(0.00)[2];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_CC(0.00)[rosalinux.ru,lists.linux.dev,ieee.org,gmail.com];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.128.50:from];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+]
Message-ID-Hash: 3HAYME5CCDYHMQP55KYVJAZTAO6UHCDD
X-Message-ID-Hash: 3HAYME5CCDYHMQP55KYVJAZTAO6UHCDD
X-MailFrom: rui.silva@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Mikhail Lobanov <m.lobanov@rosalinux.ru>, linux-staging@lists.linux.dev
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] greybus: lights: check return of get_channel_from_mode
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/3HAYME5CCDYHMQP55KYVJAZTAO6UHCDD/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

If channel for the given node is not found we return null from
get_channel_from_mode. Make sure we validate the return pointer
before using it in two of the missing places.

This was originally reported in [0]:
Found by Linux Verification Center (linuxtesting.org) with SVACE.

[0] https://lore.kernel.org/all/20240301190425.120605-1-m.lobanov@rosalinux.ru

Fixes: 2870b52bae4c ("greybus: lights: add lights implementation")
Reported-by: Mikhail Lobanov <m.lobanov@rosalinux.ru>
Suggested-by: Mikhail Lobanov <m.lobanov@rosalinux.ru>
Suggested-by: Alex Elder <elder@ieee.org>
Signed-off-by: Rui Miguel Silva <rmfrfs@gmail.com>
---
 drivers/staging/greybus/light.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/light.c b/drivers/staging/greybus/light.c
index c6bd86a5335a..6f10b9e2c053 100644
--- a/drivers/staging/greybus/light.c
+++ b/drivers/staging/greybus/light.c
@@ -147,6 +147,9 @@ static int __gb_lights_flash_brightness_set(struct gb_channel *channel)
 		channel = get_channel_from_mode(channel->light,
 						GB_CHANNEL_MODE_TORCH);
 
+	if (!channel)
+		return -EINVAL;
+
 	/* For not flash we need to convert brightness to intensity */
 	intensity = channel->intensity_uA.min +
 			(channel->intensity_uA.step * channel->led->brightness);
@@ -549,7 +552,8 @@ static int gb_lights_light_v4l2_register(struct gb_light *light)
 	}
 
 	channel_flash = get_channel_from_mode(light, GB_CHANNEL_MODE_FLASH);
-	WARN_ON(!channel_flash);
+	if (WARN_ON(!channel_flash))
+		return -EINVAL;
 
 	fled = &channel_flash->fled;
 
-- 
2.44.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
