Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id C32FFA9B55D
	for <lists+greybus-dev@lfdr.de>; Thu, 24 Apr 2025 19:36:18 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id A4CC445973
	for <lists+greybus-dev@lfdr.de>; Thu, 24 Apr 2025 17:36:17 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	by lists.linaro.org (Postfix) with ESMTPS id E86B945FF6
	for <greybus-dev@lists.linaro.org>; Thu, 24 Apr 2025 16:46:56 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b="c/+JPhIC";
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (lists.linaro.org: domain of andi.kleinbichler@gmail.com designates 209.85.221.51 as permitted sender) smtp.mailfrom=andi.kleinbichler@gmail.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3913b539aabso696963f8f.2
        for <greybus-dev@lists.linaro.org>; Thu, 24 Apr 2025 09:46:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745513216; x=1746118016; darn=lists.linaro.org;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tX6BYTT8dOmFs+pdX/MFx3gTZUblYOPi9JW4PiTBaik=;
        b=c/+JPhIC/WZjbBE6Ub7zp6/Y1WbAO3h25YLw0lLvPMNe+HcCsv4u7I3yEGe9RN8Ctv
         uwRN1Upj0eFyIKcwtSNvHZ5SjThgi/UGre89iVPR8GPE9c4yMupOwZi8bGdKxiSxJkr1
         Hbz3VJ1Od7DRSfbfqxNhwUkyhZrsMaxPLvnxz0pIsdMFCAbzzPiylI/YgsysnmRx+2Xg
         c63UUQPp+i/CubALa7iHo6E3ySRQrDK/lGk82EUgZyEHENYxwXZPKgMJVR6uw3JOReS4
         9fbYA05r+CE9S+8bIl4SGti9Dmwcrr4EraVxEmDS9gR4XN4S9mJsJNv2cp4E4QEmilO9
         AKOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745513216; x=1746118016;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tX6BYTT8dOmFs+pdX/MFx3gTZUblYOPi9JW4PiTBaik=;
        b=HlOnHAdd6n36lJj4UWLtY8iRtu4X2qZ/Rjr/FNxCEV+xC0E1CNQ0gfXwpxPfrGMyNn
         1AqUjsWGaJwmV0vcRnITuyYAPsPbcxYN94yZiQY9GbD02ANJdikPh1RnS4d+1a9BTtFO
         yCwgxw5MjmB5WfH7L52y9mblEw56IEicBuDnQAV6fTfFXfihAV1x9NMf20ff8+a/rV9N
         ilABOzT2fmYFapZid1IEb0+oJulgDrPDHGIDlLkEciQI1rNzInAGPsEVLxkP75AN54n7
         8YUOBSYVvTv9WflFo1tRufXhBOMKwDqUapHhPb1lR5DKocElly+5uTechIY4cwiubHD8
         mluw==
X-Forwarded-Encrypted: i=1; AJvYcCUDAzpSy9NNF7WzwF2wio3LMS675qdyX8gI3XN8hV208om/PsgWSA5ITE/Vqv7SaO3l2wJHzLEIlJ5kZg==@lists.linaro.org
X-Gm-Message-State: AOJu0YwmmgdH2VSvNwznrgSVB19JbbOyl+yBSDx3a8dXQVZhnXpECOdJ
	gnLPeQY1HAgATvLDpTP5xGqDuGEKgWHQojedCVcbmHWbhZ/7svHp
X-Gm-Gg: ASbGncv3qzIStoyJFMh399+NgNPVUPx2IIrfszAy6tBZ09dmMSlqelV66ZVHM/Ms7aC
	f8mix4/VtygGOisiKyXhS41N51iUmw/16Ia/EbkmKfUKQ19psw60tQ2ANXdTJILA9kECuSjkk96
	1jZyo3WPrOowrmdWinTw3YCxphmv6TDrHu2vO2ldw4jBhJdHKDu61GxYqdbzpmf+Ce4Ass+IYmu
	mpAOzXBSvSNxow+HknHVOYfvnkbmIrnM11fR8p+QmaP4S4wUe9Dc26fcTvC96zfGMR4VIRv+Ru6
	uBhlzLqONuXMVqPqqO5mNA1kXtShtW53taBW53JzdswN5maqQ7zKsaGTpvRR3QzLEuqtYgXPiyR
	1aSvCsH3BAanU5KozUcrMxXqB
X-Google-Smtp-Source: AGHT+IGbtUZ1epAFM71uoldTFr4VYxXQceNxeQpoJpuw+knCHDf5n5FvydE+by/rlcAYTosCU00hYw==
X-Received: by 2002:a05:6000:184d:b0:39c:13fd:ea9c with SMTP id ffacd0b85a97d-3a072bb7529mr36617f8f.47.1745513215697;
        Thu, 24 Apr 2025 09:46:55 -0700 (PDT)
Received: from andreas-VirtualBox (089144201082.atnat0010.highway.a1.net. [89.144.201.82])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a06d4a807bsm2633243f8f.20.2025.04.24.09.46.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 09:46:54 -0700 (PDT)
Date: Thu, 24 Apr 2025 18:46:52 +0200
From: Andreas Kleinbichler <andi.kleinbichler@gmail.com>
To: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Message-ID: <aApq_JPIBhnGqfiR@andreas-VirtualBox>
MIME-Version: 1.0
Content-Disposition: inline
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: E86B945FF6
X-Spamd-Bar: ---
X-Spamd-Result: default: False [-3.50 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	MIME_GOOD(-0.10)[text/plain];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_IN_DNSWL_NONE(0.00)[209.85.221.51:from];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-1.000];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.221.51:from];
	DWL_DNSWL_BLOCKED(0.00)[gmail.com:dkim];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RBL_SENDERSCORE_REPUT_BLOCKED(0.00)[209.85.221.51:from]
X-Rspamd-Action: no action
X-MailFrom: andi.kleinbichler@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: 3YBZYJQ42CSQL3KOT465MDAI63H2ZZD4
X-Message-ID-Hash: 3YBZYJQ42CSQL3KOT465MDAI63H2ZZD4
X-Mailman-Approved-At: Thu, 24 Apr 2025 17:36:13 +0000
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] [Patch]: staging: greybus: camera: fix alignment should match open parentheses
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/3YBZYJQ42CSQL3KOT465MDAI63H2ZZD4/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Correct the alignment of the parameters to match the open parenthesis.

Reported by checkpatch:

        CHECK: Alignment should match open parenthesis

Signed-off-by: Andreas Kleinbichler <andi.kleinbichler@gmail.com>
---
 drivers/staging/greybus/camera.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/greybus/camera.c b/drivers/staging/greybus/camera.c
index ec9fddfc0b14..a1b76df39a8f 100644
--- a/drivers/staging/greybus/camera.c
+++ b/drivers/staging/greybus/camera.c
@@ -263,9 +263,10 @@ static int gb_camera_get_max_pkt_size(struct gb_camera *gcam,
  * Validate the stream configuration response verifying padding is correctly
  * set and the returned number of streams is supported
  */
-static const int gb_camera_configure_streams_validate_response(struct gb_camera *gcam,
-		struct gb_camera_configure_streams_response *resp,
-		unsigned int nstreams)
+static const int gb_camera_configure_streams_validate_response
+	(struct gb_camera *gcam,
+	 struct gb_camera_configure_streams_response *resp,
+	 unsigned int nstreams)
 {
 	unsigned int i;
 
-- 
2.43.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
