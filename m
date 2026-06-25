Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id arp8CxQ9PWqszwgAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Thu, 25 Jun 2026 16:37:08 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id DFC306C6B5F
	for <lists+greybus-dev@lfdr.de>; Thu, 25 Jun 2026 16:37:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=gmail.com header.s=20251104 header.b="Rh09Q/6C";
	spf=pass (mail.lfdr.de: domain of "greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org" designates 44.210.186.118 as permitted sender) smtp.mailfrom="greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org";
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=gmail.com (policy=none)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 02BB240A39
	for <lists+greybus-dev@lfdr.de>; Thu, 25 Jun 2026 14:37:07 +0000 (UTC)
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	by lists.linaro.org (Postfix) with ESMTPS id DDCD73F99D
	for <greybus-dev@lists.linaro.org>; Thu, 25 Jun 2026 08:59:24 +0000 (UTC)
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-13809223fd4so2335082c88.1
        for <greybus-dev@lists.linaro.org>; Thu, 25 Jun 2026 01:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782377964; x=1782982764; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UCM013gVUsehWEh08mLTPsFaPHwwdbfEWMEh5CAkbII=;
        b=Rh09Q/6CC6Vdioy5+RlgLtiT3MlSaWa5sSSQA9ND+i7ZlMtgNWykW/pwg34Xxwm+hW
         Hv630cGRYTuA/lP0kqlwIkNQRzr9P20Wjcz7jmxYXplzt0VmdquLouiUJB7raaRAia01
         RZ6aR8YhA4F2K8JUSJQzUOKWf2KGaFEB2iJ1ha60Y9Kk6RtGTnmVWxGdToArYzYYkUh4
         A9oRhJrt6HDRtlhnxGVC3JQO80URmM8Ri72QFWUTCiIWnc+70daq7MtdaqF+f62rI3oE
         trmX9PTLdeHLkfR2dgrTsFIbIexQq1EgVSlUwJddu/snINoUf+aotXqnBYL1eoJasxh0
         vbXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782377964; x=1782982764;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UCM013gVUsehWEh08mLTPsFaPHwwdbfEWMEh5CAkbII=;
        b=rKlzRXkou/Q0L8S4XVuujD/xK6r8YdWKbrDaVcng/u+ijzPwX0G+1bZeQNLONHMIxp
         tXE6sgK6Pe1EB+yI1pP7BSjzo07MKzo0Yfz3YIzz1o6Ya9h25WwxpN26e+IFVFMUteFf
         ruSauLCvWnMG/PDgq+OaUory2sBacJpsKKqPXtPSbuLdICgo21WNQrSJtLaKZ0AIUNwb
         L7i36Al/QU42Jwp692ApHkfF45+MGmRICHQO3r7BNiajeLiXH2cWmB+z9bjw3WNTSRao
         upYRyh/TY1xodJqpXE0e+GM6SaB+7rWkQVFsb9xlShE9JWoE6414uqMmk97XU1t5sVhd
         jMOA==
X-Forwarded-Encrypted: i=1; AFNElJ/k6sv4fRZk4Ed/A9U7VHgEz4jDqEWUOTk78mZmJyf3JoiszBz0H4wq9DNYLDJVxa6J1l+QXDoJdrocUw==@lists.linaro.org
X-Gm-Message-State: AOJu0YxjjE579kjOfhgn/pR5YzHoZVYgGhIdtSqXFG0zEeCOvXCYTtFf
	6Qliq+eOUTn8zJp7eGi6W5JD3sUBahI5jPI3qF5ShzQD+tSHgI4JltiY
X-Gm-Gg: AfdE7clCeBVme3USO0XfVdY5cdbcCKGu4bglYIUBua0RtBA+ucOKS2l3DHsm705co0b
	yi2mJwIozwQbDdx9viHpL/ogkCdMosvg4WeNLFqvwl52dLepp0jahSH1UecaOqTfayaD8obZODr
	aTRNX5qUjx7SudXzhOynDX1FyYdpt+R+VOOeoWY+zS5LoNxVSpjkrIqB4WxrBqyD0zvYyvZ72XI
	HDYJ/MCfSaOQrBqLBxLzCuLZON2cZqxvRSgXEG2wSAMFzjony/DSKiyGeCdh3LU2FvrWUo9fl/S
	zxxrAmJeD7YnFDbbulgLVH5GU7DqOmdFs4rVV7xWw1acXxCyOxeuAXOgN9Y8ur3f/ukmvLLuzu2
	TzO1duPV4/7w4EXq5bU9hV3vCYcgQit1enBkNgLtyfWnfJqAgCVDBe9yVu97Oe24YAWUGsupJBA
	SCGbeMRLr6zU/fVRSoRCFXZIyr1lSZB4cV5Q==
X-Received: by 2002:a05:7022:62a6:b0:138:22f:9a2c with SMTP id a92af1059eb24-139db9e5923mr1519102c88.5.1782377963766;
        Thu, 25 Jun 2026 01:59:23 -0700 (PDT)
Received: from 10-86-27-11.ban-spse ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139d8f318e7sm6226496c88.3.2026.06.25.01.59.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 01:59:23 -0700 (PDT)
From: suryasaimadhu <suryasaimadhu369@gmail.com>
To: vaibhav.sr@gmail.com,
	mgreer@animalcreek.com
Date: Thu, 25 Jun 2026 16:57:40 +0800
Message-ID: <20260625085740.222486-1-suryasaimadhu369@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: --
X-MailFrom: suryasaimadhu369@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: UBZ63N22VLAS5QKPB57ANREFI4B75UMH
X-Message-ID-Hash: UBZ63N22VLAS5QKPB57ANREFI4B75UMH
X-Mailman-Approved-At: Thu, 25 Jun 2026 14:37:00 +0000
CC: johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, suryasaimadhu <suryasaimadhu369@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] staging: greybus: add comments to mutex declarations
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/UBZ63N22VLAS5QKPB57ANREFI4B75UMH/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [3.09 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx:c];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[gmail.com,animalcreek.com];
	FORGED_RECIPIENTS(0.00)[m:vaibhav.sr@gmail.com,m:mgreer@animalcreek.com,m:johan@kernel.org,m:elder@kernel.org,m:greybus-dev@lists.linaro.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:suryasaimadhu369@gmail.com,m:vaibhavsr@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[kernel.org,lists.linaro.org,lists.linux.dev,vger.kernel.org,gmail.com];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[suryasaimadhu369@gmail.com,greybus-dev-bounces@lists.linaro.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[suryasaimadhu369@gmail.com,greybus-dev-bounces@lists.linaro.org];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	TAGGED_RCPT(0.00)[greybus-dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DFC306C6B5F

Add comments to mutex members in gbaudio_codec_info struct
to describe what each mutex protects, as recommended by checkpatch.

Signed-off-by: suryasaimadhu <suryasaimadhu369@gmail.com>
---
 drivers/staging/greybus/audio_codec.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/greybus/audio_codec.h b/drivers/staging/greybus/audio_codec.h
index f3f7a7ec6..326770b99 100644
--- a/drivers/staging/greybus/audio_codec.h
+++ b/drivers/staging/greybus/audio_codec.h
@@ -70,8 +70,8 @@ struct gbaudio_codec_info {
 	struct list_head module_list;
 	/* to maintain runtime stream params for each DAI */
 	struct list_head dai_list;
-	struct mutex lock;
-	struct mutex register_mutex;
+	struct mutex lock; /* protects module_list and dai_list */
+	struct mutex register_mutex; /* protects module registration */
 };
 
 struct gbaudio_widget {
-- 
2.47.3

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
