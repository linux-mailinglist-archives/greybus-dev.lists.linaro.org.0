Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 53BF188B3C2
	for <lists+greybus-dev@lfdr.de>; Mon, 25 Mar 2024 23:16:09 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id E63BE43C2E
	for <lists+greybus-dev@lfdr.de>; Mon, 25 Mar 2024 22:16:07 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	by lists.linaro.org (Postfix) with ESMTPS id CE7913F359
	for <greybus-dev@lists.linaro.org>; Mon, 25 Mar 2024 22:16:05 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=Wdpq3zAv;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (lists.linaro.org: domain of rmfrfs@gmail.com designates 209.85.221.43 as permitted sender) smtp.mailfrom=rmfrfs@gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-341cf28e013so818819f8f.3
        for <greybus-dev@lists.linaro.org>; Mon, 25 Mar 2024 15:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711404965; x=1712009765; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2JL31owuATMRfQL/MmwYmGoho7jdRbWpt53ZxEjx8hk=;
        b=Wdpq3zAvGe9bcDIWeIQA8tYe8NDa1Ku9qwpxqIFOsmcZbQOVlC8VCM72qn+WwHEHj9
         ZduWKHB0/FYoP4/RT2tUi0SvQR5cMuAe9/KbfYwyjVSdaNQ461jDCY46l8/1n2IdZoD0
         nSJEwyG3o05CHJohTdFs2k9pheVnmHlDc4II0sQW+Jvr3TsuqtzQ7/25Mex+eaReFSzt
         P1nJBHpqiCzOdG/F7w5qH9jv6emzc8zjMaapZTZDETeK0Dvc/ytwn6ieWU0KOeE2anrp
         nqfuXi2Q6xj8VhOAI1giiAdprecvTkaYFhkulQHHS+2tLdmwkOWjrpc3UuH81+asYT6m
         nDrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711404965; x=1712009765;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2JL31owuATMRfQL/MmwYmGoho7jdRbWpt53ZxEjx8hk=;
        b=WuNunDwSWTYgwaqZ+uILwstxM2ggOwRW0HAg5DGxSEb+djJy6I0fhgYuPSXguHXjxB
         l4X36ogwGg9FyEMTBcUoNFl5VXPzyU37V0WlbNVmUqcdGT0CSblxxOWXXLXqbs2fnSxB
         UCMYiUHXsXvEIQRw9lFH4VuLKO5Fzl6WiGXddAmSVaAtdncSW1KrbLS9I/WAnXpTDJU+
         kmM/4c5HvGfMWy6NZyLQAL8dQ4Fq9FRN8O6Bzyjesrr3Hlxf2TICrtsytlJHLLysTeaF
         tWPBhYx8XJLAn3C+UwI/BNLeLoe6kVrAijsdhacUnuw3eV2bBerHp9dhodkhr6qxC3a+
         2HAQ==
X-Forwarded-Encrypted: i=1; AJvYcCXXBrWHfHg/Z09cAnWLQErPAGp24nmsmLDXnUp98Hdrt4yBYK/KNclFBkTrgw2SsE/se7MAe6Aqaw2cO98+gBpn9ukrJVks98HcaNq5
X-Gm-Message-State: AOJu0YzNkd5MHbWxyNfmrCTQDlPQkcICXLotpae9eJFIkcc52WYVhov+
	AQhEH5FO9ZbyEgll36mqKnepWZ9GHF+ncw2LlIc15zBMmOBI50UQ
X-Google-Smtp-Source: AGHT+IHl4+DIZuskRlIkJYs/YJYY0Wmyi4bl7/wsiQ6fKQh4yPx4UW3w5Y41v4PgFtYQ7SadRYsfDw==
X-Received: by 2002:a05:6000:e52:b0:33e:d229:35a1 with SMTP id dy18-20020a0560000e5200b0033ed22935a1mr5570072wrb.65.1711404964314;
        Mon, 25 Mar 2024 15:16:04 -0700 (PDT)
Received: from arch-thunder.local (a109-49-32-45.cpe.netcabo.pt. [109.49.32.45])
        by smtp.gmail.com with ESMTPSA id i5-20020a5d5585000000b0033ed7181fd1sm10507076wrv.62.2024.03.25.15.16.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 15:16:03 -0700 (PDT)
From: Rui Miguel Silva <rmfrfs@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org
Date: Mon, 25 Mar 2024 22:09:55 +0000
Message-ID: <20240325221549.2185265-1-rmfrfs@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Rspamd-Queue-Id: CE7913F359
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.50 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.221.43:from];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[rosalinux.ru,lists.linux.dev,ieee.org,gmail.com];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	DKIM_TRACE(0.00)[gmail.com:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: PMQCTCMNEGE4OD3VPZMEGLBML4ZUKAED
X-Message-ID-Hash: PMQCTCMNEGE4OD3VPZMEGLBML4ZUKAED
X-MailFrom: rmfrfs@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Mikhail Lobanov <m.lobanov@rosalinux.ru>, linux-staging@lists.linux.dev
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v2] greybus: lights: check return of get_channel_from_mode
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/PMQCTCMNEGE4OD3VPZMEGLBML4ZUKAED/>
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
v1[1] -> v2:
GregKh:
    - remove overkill WARN_ON and replace it for a dev_err

[1]: https://lore.kernel.org/all/20240307094838.688281-1-rmfrfs@gmail.com/

 drivers/staging/greybus/light.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/light.c b/drivers/staging/greybus/light.c
index c6bd86a5335a..9999f8401699 100644
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
@@ -549,7 +552,10 @@ static int gb_lights_light_v4l2_register(struct gb_light *light)
 	}
 
 	channel_flash = get_channel_from_mode(light, GB_CHANNEL_MODE_FLASH);
-	WARN_ON(!channel_flash);
+	if (!channel_flash) {
+		dev_err(dev, "failed to get flash channel from mode\n");
+		return -EINVAL;
+	}
 
 	fled = &channel_flash->fled;
 
-- 
2.44.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
