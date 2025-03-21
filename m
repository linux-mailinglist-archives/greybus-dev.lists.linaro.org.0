Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F7EA6BA8B
	for <lists+greybus-dev@lfdr.de>; Fri, 21 Mar 2025 13:20:19 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 47338446E6
	for <lists+greybus-dev@lfdr.de>; Fri, 21 Mar 2025 12:20:18 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	by lists.linaro.org (Postfix) with ESMTPS id 15F3D44292
	for <greybus-dev@lists.linaro.org>; Fri, 21 Mar 2025 11:55:56 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=ePdE8GPv;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (lists.linaro.org: domain of karanja99erick@gmail.com designates 209.85.128.42 as permitted sender) smtp.mailfrom=karanja99erick@gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43bb6b0b898so16517335e9.1
        for <greybus-dev@lists.linaro.org>; Fri, 21 Mar 2025 04:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742558155; x=1743162955; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=c4sDOHOmH2F/18zOsLI6QpBEwsBgeSty8cc2NNHzyKU=;
        b=ePdE8GPvOU3JIL/q42FFiXd2pPg+HMk8Ho+b1t5tmPXs72BLFPAs1PTy3fYubZ2MKt
         UmuCMjouCWStS/81mk1ygEwGpy5RSvP/ntzk3J5BwelcWwndNfU0zNf7i3a9uPYBoW4W
         Dk98EEf15zBi785hVCHvbUGUD0tiQLTjohSJMnaAIZeWrj8NQ3ybG2i7GHXMIKRPagWG
         PMKafMooeC6zR7kI2I/peD0Ux39faEOeAJNa5g+xRgfRzab8pYI/iywmRE9KJ1bkW7qN
         e1wLuwHsTECtHwKow4tOb1VzDbFMpMhxBjUEORq4gdFMVA5PB690tTWxhfKjjxI2GdAl
         6EOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742558155; x=1743162955;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c4sDOHOmH2F/18zOsLI6QpBEwsBgeSty8cc2NNHzyKU=;
        b=QMzhjrWy0HNyS7H7pytBPkDN6IbPUkMS/1nj7Ytz1C5kGsxdUTrRWJhdMaoKVPgOrK
         ZQjwcX1jZuncjNZXlRG8XJT0rryqtIffaeiXTohRCszbhr7KS0cr9zI+5U/qbsVxItTn
         BHrtAPK9Pk03Ntmsqf1P92hRisnrCHsrlevpMZkY2O2bmMri9B6Q2DuU0+Zy8GSv/+Yf
         lnKrCh3JT+eMW6RHdezmTCkrBGnXTEpr0oIj0AnxZgDyWo4HX2O31HQCMIRyVpdtamWa
         g84TLmmhEIOpHNOGx4w/TvEBV/ww5Qz8cwQPL/Iw7wd0vBi5M4qkBxhDLYxSXkfudwjK
         idlw==
X-Gm-Message-State: AOJu0Yx6DruWW0camD93o1WnMAowbxUzy8GiFZfTAcyJE/x83EFExfbB
	FzNY+et3SdQtj4MVlvJcPpIa6GuJ62CMdKj5jcnladqmQEY7/cvM
X-Gm-Gg: ASbGncuu0ckzn4Z5qtmaViTmkOQge5b/WWXgWROQJwrG8XEgLRF8MLZp5bex49q9ren
	hiFecXYgXV7UVIyS2gx823Rb/UdEKKBspPbd7nYKM7vSkraWqGe4fj2tTPFWmWPbegbFchQHqhO
	HLpPIhaWLQDFRXa/Z0OlTSXwiLV6pTST3oXR+h9potBU6wkr1R9LUtGyuHeRkfTqKcdycZJz9ET
	oXXzWyTwv7UyiBB8AIslaD7GE2QJk1y3IQ3SJmoUlgU8KWTWio3XhCiJA7yGLu3EnUYLcK5SbR2
	jsR2kxgMXRVCBIXBHPf7O1nM6zGSWIVYSEVWLSUdxw==
X-Google-Smtp-Source: AGHT+IEGpQVJLgp09GpEuzAgmZJOX2/jxZFFMYn1wXHIxrgy8GYpeYc/67utxdndf3QlfJj/lUeemg==
X-Received: by 2002:a5d:5f85:0:b0:399:6ad6:34 with SMTP id ffacd0b85a97d-3997f9390bemr3262333f8f.35.1742558154743;
        Fri, 21 Mar 2025 04:55:54 -0700 (PDT)
Received: from pc.. ([197.155.71.138])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9ef23esm2148164f8f.81.2025.03.21.04.55.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 04:55:54 -0700 (PDT)
From: ErickKaranja <karanja99erick@gmail.com>
To: hvaibhav.linux@gmail.com,
	johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org,
	outreachy@lists.linux.dev
Date: Fri, 21 Mar 2025 14:55:45 +0300
Message-ID: <20250321115545.24468-1-karanja99erick@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 15F3D44292
X-Spamd-Bar: /
X-Spamd-Result: default: False [-1.00 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[lists.linaro.org,lists.linux.dev,vger.kernel.org,gmail.com];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,linuxfoundation.org,lists.linux.dev];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	DNSWL_BLOCKED(0.00)[209.85.128.42:from,197.155.71.138:received];
	NEURAL_HAM(-0.00)[-1.000];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.128.42:from];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	TAGGED_RCPT(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RBL_SENDERSCORE_REPUT_BLOCKED(0.00)[209.85.128.42:from]
X-MailFrom: karanja99erick@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: GZIENNYCVIEXKYI6KCYDLJ5IKLIGLS3J
X-Message-ID-Hash: GZIENNYCVIEXKYI6KCYDLJ5IKLIGLS3J
X-Mailman-Approved-At: Fri, 21 Mar 2025 12:20:16 +0000
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, ErickKaranja <karanja99erick@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] staging: greybus: fix line length issue
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/GZIENNYCVIEXKYI6KCYDLJ5IKLIGLS3J/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Fix line length exceeding 100 columns in arche-platform.c. The code now
follows Linux kernel coding style guidelines by keeping lines under the
maximum allowed length of 100 characters.

Reported by checkpatch:

CHECK: line length of 101 exceeds 100 columns

Signed-off-by: ErickKaranja <karanja99erick@gmail.com>
---
 drivers/staging/greybus/arche-platform.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/greybus/arche-platform.c b/drivers/staging/greybus/arche-platform.c
index d48464390f58..1a82a7a3991c 100644
--- a/drivers/staging/greybus/arche-platform.c
+++ b/drivers/staging/greybus/arche-platform.c
@@ -179,8 +179,8 @@ static irqreturn_t arche_platform_wd_irq(int irq, void *devid)
 				 */
 				if (arche_pdata->wake_detect_state !=
 						WD_STATE_COLDBOOT_START) {
-					arche_platform_set_wake_detect_state(arche_pdata,
-									     WD_STATE_COLDBOOT_TRIG);
+					arche_platform_set_wake_detect_state
+						(arche_pdata, WD_STATE_COLDBOOT_TRIG);
 					spin_unlock_irqrestore(&arche_pdata->wake_lock,
 							       flags);
 					return IRQ_WAKE_THREAD;
-- 
2.43.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
