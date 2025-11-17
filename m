Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DFEEC696C6
	for <lists+greybus-dev@lfdr.de>; Tue, 18 Nov 2025 13:38:52 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 57B4D3F91E
	for <lists+greybus-dev@lfdr.de>; Tue, 18 Nov 2025 12:38:51 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	by lists.linaro.org (Postfix) with ESMTPS id E26703F72F
	for <greybus-dev@lists.linaro.org>; Mon, 17 Nov 2025 18:19:57 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=g3vyGcil;
	spf=pass (lists.linaro.org: domain of ayaanmirzabaig85@gmail.com designates 209.85.214.172 as permitted sender) smtp.mailfrom=ayaanmirzabaig85@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-297d4ac44fbso41753255ad.0
        for <greybus-dev@lists.linaro.org>; Mon, 17 Nov 2025 10:19:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763403597; x=1764008397; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P+mt7oH0iBZP/o/xZpySfvOUTDFx959ix8tWEjCCAv0=;
        b=g3vyGcilWjiXzB4xi+whmNb2mKJ3jdBXQQt4Y8P/MMZtLsUnssmVBjEZ83FVx2YdKi
         RV+J9G/3Oggu+9r/+Z6pM/a8S+vF2ofUt11KfemJe5JsY+a6wja35uhpZXCNRp+UDmMW
         myFPfHnthlf+R862LyaUuq29eal43c54hV/xGt56SDKanT2HBxMvdbmXV6JHLT5XEqut
         hh1XpBi/u/AOJuwBcWvDolGntYCgSos80QwqjCz6NQEmXyDxLOnC6hrwoQvaFJ9THWId
         KastsgOqWUFEz2pHMvm5uEaAmX1sNdQMPxmvovs/21zFxYy+XJXMrwc6Gi8vP9XLBHsu
         RSaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763403597; x=1764008397;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=P+mt7oH0iBZP/o/xZpySfvOUTDFx959ix8tWEjCCAv0=;
        b=UNH/HZjZTnRhaG/S2yO3HXmz+BIsikqYtyAdij5VnZmwaiXrGaja9mHIHQyX2gV1c3
         NmaVjXE4Q4LivPv66wxtjJm7fFd9MFKC1KZKTsAx9yaNFaD670BoFCm6okwOJJdxPDOp
         AllGeORIm0754SVue3w0Ou7rLtGEVcK3weAXTHjFTQ0DGZLhn2KyydJ7ihMfY3a7u9bk
         v36KU4deHQpSvNG9ML5BB+CGz6t83HV3D4poTTLgjK/XunxuULfXva6MXMR6ziFN4ykf
         azkhM9prQdKMiZ2F/0B5CFKL5RaON0PsxOod3wkERkRfoFbgE+vX3IF+ew9T9dMouE49
         9GgA==
X-Forwarded-Encrypted: i=1; AJvYcCWovW1J4sXMgSHRqsCpZPL+XSz52jQFiTyB9W0P3Jwp5fDHRsLw7i0vkNwzAf62vkja1uvQs7HTUfeXcg==@lists.linaro.org
X-Gm-Message-State: AOJu0Yw/z8ArkpwTK/DPIYHdTKzdz62aN0xWrwvd9wRUmR9EKlniqFMu
	q9ztnv/KAekcIdN3xA21DRsKX3Ntn2Jjav1SYzfWHp44xTPyi2k2Z5h3
X-Gm-Gg: ASbGncuMP802nShjqQ9DEhqCaDB69nU1oLGxjuV49ytA3xNbNKAobr4xUfuibGrnVOo
	UCMem7gOYXaczC6Zwpb6aZVeM+lCBpGafcwnNlpYmZNGZptA1SHPwA1gHgw6e6D6+BfEtsuakqZ
	uQ4Vg/TzEwpVZkHv4l0Vf8XjgHWX3Qs3nTwNt9MQoquAPfWb9XN31y3i4r1dP3D7IPwAU/mgt/2
	6gOIGocvPSZcTIX5Aen9u8fVyLQgmT6keivD95IiLK0GRzvP9NOVayncfXCn5rwQhKZipRwuLb4
	1vIdPugEc3OZ5SBpgM6plxFze8XbPt5Q3xxmcU/yGeXJ+9nmnaMhn2bkHHClTGUGp5CroP9lnlP
	c7sGAqM9TiqMoH83drUgBpzdSsUtrpzy325mxB4+VE+D1hbx3KwypebU0n31gjCcXHiLPLEyrAs
	nylB3WnxecWRFznUwjQN0PayxIZc8ekaaWC0Li7M6zRV1/3RI=
X-Google-Smtp-Source: AGHT+IFQ9LBn3ISEXKKMButpenVNHYhuSfDmCD+Hvolo3FcfK5Fs+q11eciFucVUcwxZWnGAUEwCFg==
X-Received: by 2002:a17:903:37c7:b0:269:b2e5:900d with SMTP id d9443c01a7336-299f54f68a3mr3452835ad.5.1763403596939;
        Mon, 17 Nov 2025 10:19:56 -0800 (PST)
Received: from ideapad.tail50fddd.ts.net ([139.5.199.69])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c245fa1sm148446705ad.36.2025.11.17.10.19.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 10:19:56 -0800 (PST)
From: Ayaan Mirza Baig <ayaanmirzabaig85@gmail.com>
To: gregkh@linuxfoundation.org
Date: Mon, 17 Nov 2025 23:48:06 +0530
Message-ID: <20251117181818.118139-2-ayaanmirzabaig85@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251117181818.118139-1-ayaanmirzabaig85@gmail.com>
References: <20251117181818.118139-1-ayaanmirzabaig85@gmail.com>
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.50 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17:c];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.214.172:from];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,lists.linux.dev,lists.linaro.org,gmail.com];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	DKIM_TRACE(0.00)[gmail.com:+]
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: E26703F72F
X-Spamd-Bar: --
X-MailFrom: ayaanmirzabaig85@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: YI25CC64C4WB7HO5RRGUPQ65PKKYL32X
X-Message-ID-Hash: YI25CC64C4WB7HO5RRGUPQ65PKKYL32X
X-Mailman-Approved-At: Tue, 18 Nov 2025 12:38:34 +0000
CC: johan@kernel.org, elder@kernel.org, linux-staging@lists.linux.dev, greybus-dev@lists.linaro.org, Ayaan Mirza Baig <ayaanmirzabaig85@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH 01/13] staging: greybus: Remove completed GPIO conversion TODO item
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/YI25CC64C4WB7HO5RRGUPQ65PKKYL32X/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Signed-off-by: Ayaan Mirza Baig <ayaanmirzabaig85@gmail.com>
---
 drivers/staging/greybus/TODO | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/greybus/TODO b/drivers/staging/greybus/TODO
index 6461e0132fe3..43fb6dc3dff0 100644
--- a/drivers/staging/greybus/TODO
+++ b/drivers/staging/greybus/TODO
@@ -1,5 +1,2 @@
-* Convert all uses of the old GPIO API from <linux/gpio.h> to the
-  GPIO descriptor API in <linux/gpio/consumer.h> and look up GPIO
-  lines from device tree or ACPI.
 * Make pwm.c use the struct pwm_ops::apply instead of ::config, ::set_polarity,
   ::enable and ::disable.
-- 
2.51.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
