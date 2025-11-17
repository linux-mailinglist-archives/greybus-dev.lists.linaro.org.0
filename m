Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DAA8C696CC
	for <lists+greybus-dev@lfdr.de>; Tue, 18 Nov 2025 13:38:57 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 332513F920
	for <lists+greybus-dev@lfdr.de>; Tue, 18 Nov 2025 12:38:56 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	by lists.linaro.org (Postfix) with ESMTPS id 921753F72F
	for <greybus-dev@lists.linaro.org>; Mon, 17 Nov 2025 18:20:01 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=jmYOGb+4;
	spf=pass (lists.linaro.org: domain of ayaanmirzabaig85@gmail.com designates 209.85.214.171 as permitted sender) smtp.mailfrom=ayaanmirzabaig85@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-299d40b0845so28779775ad.3
        for <greybus-dev@lists.linaro.org>; Mon, 17 Nov 2025 10:20:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763403601; x=1764008401; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IhOKXGHNf34PNvs7qGjtpjvt2eZ2RAjiiLCFyoTk/VI=;
        b=jmYOGb+4GArOg4clG6b+Eii6ocEBh751td352pH9KkI0f5UzOd1WD2Xbd2QLn411Xx
         kisrxT1Z3d6gBV79Z49KGqoxkG9yz1lh79e9RYKQ92mx1bpbVl5jhaW4Nx1LtFbEmB3W
         ymqMN4ECmjxw+cNcUtOAWWIPRZyt2qpnq3qi2zDZrocRVnsAurFQQR++5k5T1WoxJBpq
         nMfdFsvWkqLe7FdFoGYxR7k/kzSpyKsKzagfOI5niJEUj5VkWku+Q7mHu2q0xNASLyt1
         U62vhE1UzwEn6KjPkTxuY3dldkUBdloPKz4gLSQieyA4GxUmzW83k4Dvafg2ixjAn4c2
         /PKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763403601; x=1764008401;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IhOKXGHNf34PNvs7qGjtpjvt2eZ2RAjiiLCFyoTk/VI=;
        b=t0xMZl1h1TREY8vXdk2QfnQARVy8LQJOmTirgmyNQ3nvi/jEonvai3nbRCDHrzuvfn
         QG9KWA6yd4jK9/4aaIzS+CFscsQrgRrE+hkHc71FnBzhfL3ZQjwNrMCtXmCj74d8Hajr
         GCCPEOGZ1DpITCE921/DLRM23Wd+ecGaqid/B8txdfndZd7SlT8rDq2rfQptmZOmeI6q
         QaFnMFLUZWQDjsXLhsOEYDULBfnMVe2vJKaAkNjOSMXuyL/Vf6eZeGsDBwjRO3M1K3Vl
         a9MS1lIARMQx5lR9ltBxIoDRl6MhoF7MyR+C/qKXN8HvvQ1A1rhpZ40htUOMBNGINzj5
         j5cA==
X-Forwarded-Encrypted: i=1; AJvYcCWTKHv+XP+FQHawOgvT93HLV5rAIbw1ltBPjfjNPJxWOojSTYFUdFo+L+uVz3dLuUwImnoYCyTw3vyieQ==@lists.linaro.org
X-Gm-Message-State: AOJu0YwKC8ROan/ohb7ijPpW/jEWj7g9cBEBL+mXjk62YFj3SOKW5WzT
	TM1jyHHz45ABj9dZlkl/Hk/LghqAvn11a36P1B6Y4BbTfgnOB9X4EQsG
X-Gm-Gg: ASbGncuozzenXZjkvneRMVxRRAXF0+RlItck0GNTCn4VveF6gF9jwsnMJB0KvdyJrZk
	vtQezjIIm2ERCdj8uSuZydsPUCSifozp3F0nDcASIXEU2NOV97B8t7S+heUBN09OAQT9HQi84Io
	3BDkpCxQHiHSngMGzdE+a+wOV3stNbhASLhm1T5q4PKuRFEI02bi2KGjahKlRtjEevNRCDpmr19
	dFUM4Y78h3QDjx4P0cdP4Ft2qCBtAVuAInNX5AZ2J0Qt99ekrqwlRet6Hi5/O+S/rcXhwATghiN
	45X9yLQO3o2z+F/ubNn4GOp7dfVy3uon1vkfvTf26ZE0tXU7Fpzh+SNS03EprJOwb4tPBOpZ/Zk
	fC97yT1p9s+P6L2hzkPr6CJ8pOUbTpyDOgBUJlDgPQaCLvjf8G+Lo+P8Ma7emEcMrz07RPwGOZt
	v8XbcbmW71uPXJ0Xhe69jeMrIapQld+/DqJy7afsDfdHH6ndA=
X-Google-Smtp-Source: AGHT+IEDbiTgEooYG2BI5Ra1BCVVCVJXcqcqw8wIlUiCWyslCqLIu5etKp2KhxPcE57smjMqIj08kw==
X-Received: by 2002:a17:902:f602:b0:298:5736:de9b with SMTP id d9443c01a7336-2986a7668f6mr146137035ad.50.1763403600711;
        Mon, 17 Nov 2025 10:20:00 -0800 (PST)
Received: from ideapad.tail50fddd.ts.net ([139.5.199.69])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c245fa1sm148446705ad.36.2025.11.17.10.19.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 10:20:00 -0800 (PST)
From: Ayaan Mirza Baig <ayaanmirzabaig85@gmail.com>
To: gregkh@linuxfoundation.org
Date: Mon, 17 Nov 2025 23:48:07 +0530
Message-ID: <20251117181818.118139-3-ayaanmirzabaig85@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251117181818.118139-1-ayaanmirzabaig85@gmail.com>
References: <20251117181818.118139-1-ayaanmirzabaig85@gmail.com>
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.50 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
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
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.214.171:from];
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
X-Rspamd-Queue-Id: 921753F72F
X-Spamd-Bar: --
X-MailFrom: ayaanmirzabaig85@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: 2PRM3BPKTXRJROT6XVF7SH4J7ONBFHKM
X-Message-ID-Hash: 2PRM3BPKTXRJROT6XVF7SH4J7ONBFHKM
X-Mailman-Approved-At: Tue, 18 Nov 2025 12:38:34 +0000
CC: johan@kernel.org, elder@kernel.org, linux-staging@lists.linux.dev, greybus-dev@lists.linaro.org, Ayaan Mirza Baig <ayaanmirzabaig85@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH 02/13] staging: greybus: pwm: move activation into pwm apply and remove request()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/2PRM3BPKTXRJROT6XVF7SH4J7ONBFHKM/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Move PWM activation from the legacy request() callback into
the pwm_ops apply() path. Activation is now performed when
the PWM transitions from disabled to enabled (state.enabled = true),
so request() is no longer required. This aligns the driver
with modern PWM core expectations: activation happens when
the channel is actually enabled, and the device free path
still performs deactivation.

Signed-off-by: Ayaan Mirza Baig <ayaanmirzabaig85@gmail.com>
---
 drivers/staging/greybus/pwm.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/greybus/pwm.c b/drivers/staging/greybus/pwm.c
index 1cb7b9089ead..c80f42100e3b 100644
--- a/drivers/staging/greybus/pwm.c
+++ b/drivers/staging/greybus/pwm.c
@@ -174,10 +174,6 @@ static int gb_pwm_disable_operation(struct pwm_chip *chip, u8 which)
 	return ret;
 }
 
-static int gb_pwm_request(struct pwm_chip *chip, struct pwm_device *pwm)
-{
-	return gb_pwm_activate_operation(chip, pwm->hwpwm);
-};
 
 static void gb_pwm_free(struct pwm_chip *chip, struct pwm_device *pwm)
 {
@@ -206,6 +202,7 @@ static int gb_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 			return err;
 	}
 
+	/* Disable if requested */
 	if (!state->enabled) {
 		if (enabled)
 			gb_pwm_disable_operation(chip, pwm->hwpwm);
@@ -228,15 +225,21 @@ static int gb_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 	if (err)
 		return err;
 
-	/* enable/disable */
-	if (!enabled)
-		return gb_pwm_enable_operation(chip, pwm->hwpwm);
+	/* Activate and enable on transition from disabled to enabled */
+	if (state->enabled && !enabled) {
+		err = gb_pwm_activate_operation(chip, pwm->hwpwm);
+		if (err)
+			return err;
+
+		/* Activate hardware channel before enabling input */
+		err = gb_pwm_enable_operation(chip, pwm->hwpwm);
+		return err;
+	}
 
 	return 0;
 }
 
 static const struct pwm_ops gb_pwm_ops = {
-	.request = gb_pwm_request,
 	.free = gb_pwm_free,
 	.apply = gb_pwm_apply,
 };
-- 
2.51.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
