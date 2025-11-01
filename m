Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id C3D79C2890A
	for <lists+greybus-dev@lfdr.de>; Sun, 02 Nov 2025 02:20:53 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id EBA533F824
	for <lists+greybus-dev@lfdr.de>; Sun,  2 Nov 2025 01:20:52 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	by lists.linaro.org (Postfix) with ESMTPS id EC3233F7EC
	for <greybus-dev@lists.linaro.org>; Sat,  1 Nov 2025 07:53:04 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=Z1zbOLvE;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (lists.linaro.org: domain of vacacax16@gmail.com designates 209.85.208.179 as permitted sender) smtp.mailfrom=vacacax16@gmail.com
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-378ddb31efaso33770431fa.3
        for <greybus-dev@lists.linaro.org>; Sat, 01 Nov 2025 00:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761983584; x=1762588384; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YV8ILjCLbAd6Rh+u+y5fp6wN9Ns1g2oLwKcbOPZD8ow=;
        b=Z1zbOLvEmFdq40hvnyxc6jr+E9V+arD/vezVQi82q4DlazcsdKFUwXbAgDRwEU2W7S
         eZmJNNkBrqsLfflIAhfbd4XaCdD4CffiV9pZFsYy7WR/4x3QhXBW45B0tcGqRLsmDsmu
         vLZn/eGffstzOXK3tZZQ+dFEJplwQCtJf51VK0qs5pNGzrEE4c8Tjh0xgkdcppEVUQ0t
         UpjiiMFOnYr+zQEoMEiLMcBxQk35NwMA+MXOEswUt13cf6XsTFPOy7o2N9hgmipNtsFi
         bwZhP5tw9f1yHkpS4BQGdNtFj0pU8WE2KudjUj0FjcVRlsUgMXUYwhFLic87hKqHn5LY
         6JVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761983584; x=1762588384;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YV8ILjCLbAd6Rh+u+y5fp6wN9Ns1g2oLwKcbOPZD8ow=;
        b=tFnxzUGMTuChBjarwr9yWu/ScieAFa1u3nWh+6YyMrn3/F+EhX169kQbxXqU6or/l8
         TyWzt6QwQpEvD35EsnVCm+rj/6RaUEVO/pyNJbTHwOhgFuPUPDTyx04vADYq7ILlZSlE
         7XYGsMhOl4fUBTEGj9HSTUwkF8JGc27PuSY/srC5tAATT//QXrIw/DgDBRkYOWpBFxJP
         UbSD1Dog3CEKyZGU6pwobZbWVxrcPHGw+R07uV6sCEit4H9/V4QOUBDcSVnKfNnrLoos
         qId6W4uX93aOFuFShigp2eg+oP1a4JOr/vTRCu6yZnMRLpFlRIWSOTU33CtwaPLO+p33
         BqFQ==
X-Gm-Message-State: AOJu0Yyq0SyFPpQX/P+sDlKYhP6N3M9NFWskyhtgGsR8nCdCZU9sYe6A
	1GlUlZNNO82FRxZ9g4/E7jaT24RgikfCsChlqJ8jhfsUVVGLl7LO9fMv
X-Gm-Gg: ASbGnctW+7ZgkPpZwq9D/1/q+N9AKzmTwUaaoxl3cVSZ1rt0CCai8saXxsZUpaDI9fV
	D2hQnhBSFtlqCRLmsT0y3eEWsjl9rd1lNrHOgxJvcKq8JJGcOPyd2d5sPCHLr9BAh68FMwIwX+m
	ELmHwZyAGEOLXgbdmg5Tt9l4iFM9AB9xUhWiuBgT5pHilAyZZlCbgtoTtrHX611dh1LJhgoEc7x
	6rIM8O2kcsHPk3WK5tigu9JmkjCbCXn7Xip9b33ypSuzsH+rPjxAWKLLTZOaavrIChBY1hGIU6i
	4YwkexDc4pzZYyri+TPSrX4HWwr8rDMfpZJXApd7Dcx7EImQhvsB9o+Jek6TkiqRAQTmhcBCm+S
	FgEk4RSYFCQ5+gAj1p6OX9jZHrrY+P6Fam1+mnE95BNOASkL6i2RhW0wv2Qhc7a5581F0yn9ory
	LWSon/SHM9WL1JKQ==
X-Google-Smtp-Source: AGHT+IE0HcnJGsxbaeCG4AVppHi/hzI1/ydTTSIq4i3fwtlEauPkj+HA5GKPmybObzIqOF+AZJU4Gw==
X-Received: by 2002:a2e:bc19:0:b0:378:e08b:5590 with SMTP id 38308e7fff4ca-37a18d86953mr19329691fa.3.1761983583414;
        Sat, 01 Nov 2025 00:53:03 -0700 (PDT)
Received: from archlinux ([109.234.28.204])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37a1c0e9bb2sm9142051fa.51.2025.11.01.00.53.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Nov 2025 00:53:02 -0700 (PDT)
From: zntsproj <vacacax16@gmail.com>
X-Google-Original-From: zntsproj <vseokaktusah7@gmail.com>
To: linux-kernel@vger.kernel.org
Date: Sat,  1 Nov 2025 10:52:47 +0300
Message-ID: <20251101075247.11415-1-vseokaktusah7@gmail.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: EC3233F7EC
X-Spamd-Bar: ---
X-Spamd-Result: default: False [-3.50 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[lists.linaro.org,gmail.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	URIBL_BLOCKED(0.00)[mail-lj1-f179.google.com:rdns,mail-lj1-f179.google.com:helo];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_THREE(0.00)[3];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.992];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.208.179:from];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action
X-MailFrom: vacacax16@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: TESAGMCW5IFWBRZRDB6EZFMOTIOVKX4G
X-Message-ID-Hash: TESAGMCW5IFWBRZRDB6EZFMOTIOVKX4G
X-Mailman-Approved-At: Sun, 02 Nov 2025 01:20:39 +0000
CC: greybus-dev@lists.linaro.org, zntsproj <vseokaktusah7@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v3] Fix tiny typo in firmware-management docs
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/TESAGMCW5IFWBRZRDB6EZFMOTIOVKX4G/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Signed-off-by: zntsproj <vseokaktusah7@gmail.com>
---
 .../staging/greybus/Documentation/firmware/firmware-management  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/Documentation/firmware/firmware-management b/drivers/staging/greybus/Documentation/firmware/firmware-management
index 7918257e5..393455557 100644
--- a/drivers/staging/greybus/Documentation/firmware/firmware-management
+++ b/drivers/staging/greybus/Documentation/firmware/firmware-management
@@ -193,7 +193,7 @@ Identifying the Character Device
 
 There can be multiple devices present in /dev/ directory with name
 gb-authenticate-N and user first needs to identify the character device used for
-authentication a of particular interface.
+authentication of a particular interface.
 
 The Authentication core creates a device of class 'gb_authenticate', which shall
 be used by the user to identify the right character device for it. The class
-- 
2.51.2

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
