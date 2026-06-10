Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lIx9OBWZKmontQMAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Thu, 11 Jun 2026 13:16:37 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AA2567139C
	for <lists+greybus-dev@lfdr.de>; Thu, 11 Jun 2026 13:16:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=tumelty-co-uk.20251104.gappssmtp.com header.s=20251104 header.b=LDGpw51c;
	spf=pass (mail.lfdr.de: domain of "greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org" designates 44.210.186.118 as permitted sender) smtp.mailfrom="greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org";
	dmarc=none
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 7FC9140A03
	for <lists+greybus-dev@lfdr.de>; Thu, 11 Jun 2026 11:16:36 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	by lists.linaro.org (Postfix) with ESMTPS id B4D9F3F858
	for <greybus-dev@lists.linaro.org>; Wed, 10 Jun 2026 17:30:35 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-45e9f4a3510so3584317f8f.1
        for <greybus-dev@lists.linaro.org>; Wed, 10 Jun 2026 10:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tumelty-co-uk.20251104.gappssmtp.com; s=20251104; t=1781112635; x=1781717435; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qF0nj1DmfNyUCwYCsGwvh7q/89LjA566cDgCp1BFT1o=;
        b=LDGpw51cI5rIQmBQwhOraPU6Z9ABIyzRq4x616xtkz0e3Qfi0dufxPr4S6alrKNyjC
         W0pjz++NXkAdmcxjJrsg+fBRj+y6/+StMMu0RzKgAy/Y2QFhqYXDW3jxx+ffuHFfBYFv
         F/AaF+cWGV3oqqVK9zVFxs+CdwS8oSSCjmb297TAHs4/4AY9gwPN8hav7iX/LSjnzCH6
         K6vsZEECqWU//+R/5oJIbBsOYxPIlDphbThFDY3V5RAySfOPm/x8NiSR9iiwLLVp2jX5
         A7Qz1rqjos5e7LLMKgCys1wsv+0znYpEBHaIgq1GVwiMTVhx5IB80RKLP2ra8V6Zb77L
         gkJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781112635; x=1781717435;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qF0nj1DmfNyUCwYCsGwvh7q/89LjA566cDgCp1BFT1o=;
        b=r0qALSP01NnwAziAhbKRdvXu2kvW9sB0KAYKZgiGLnU+AN9Db+RX6+CSOG31/e4T/e
         8oz/NYlwyqPZbxh4CGJ5LQIicUQE5xIIPRF5zrW1Tx9cvGi6oItrs1620bXAj5mZ0o2F
         a8NfWas0FFJlVpDIm354i1FR13rNMg9tgp11KTQt7RUNzzTnbQpMOq3aZaWkvUkhjgHE
         Ju0BO4wAuylXWKRSFz08N7LB7yrqZxGt+EZ5MwwGihhzQA62/+W7m7tscFlQzYbvyNVu
         OmnP/TIxAussVY6GdTJgmTAODMXX7OOD6/BPikdbTH2MwJLHA8v6lIUTM1BAmjc/QT6Z
         64+g==
X-Gm-Message-State: AOJu0Yxr+kx7lcN/vpE2j5J7U2ACKpuwHgpEpzVKNzfrPHRvimPplfp4
	StXJR9Rl//nwKmKTMVzLX8dle2ublb6IHeZv1jZMSipf0XdsD8qYsbbvmXfah3xtpos=
X-Gm-Gg: Acq92OHgvnpt2wSbUyCCHQiGmnq7fPPLdZktItImJkQ9kNtgJdhrlkheZUABjKNfK3q
	CGDqhUMJ3oxyQoOIKRKQA5h6e7hbjvdzZNEIWyTkckkJXSfJ+D/B3KJ1DgA6Ycl1PWFwTYjmvII
	wMjh5CsPxXSykhthMB07npVBjC6anzCkBv7uB9ss5Pgj3jK1+cSYnrdKaqd/iWtoJhL2fRu4Yb2
	DmPUzBgLrhdM+Q7NmFLkM3ghzgPWdQo2EdOGYyrMCvPPt/dHmqkGXZgox3yibCMhXAvmxL4/raX
	f3pcx1g3K3+JGAVhlOuyhcLWQOf6qSPTQLv8P1Ayd+QFJtAH+Ot8mnvGKiNeXuR2a4ZqgzUruJ5
	qA36Qef4Yl4U3lWfE8zAhN6UgsRZX/1q6/GQAyN9uo25PwxvNCdF4rLaILqD8B1YY+SqolDlvkN
	dmMqqfWhyYoJ7zJvcm3xLG/JHdLcgeeeu1HA==
X-Received: by 2002:adf:fcc6:0:b0:45e:8866:e58d with SMTP id ffacd0b85a97d-460302ed4c7mr28947262f8f.11.1781112634524;
        Wed, 10 Jun 2026 10:30:34 -0700 (PDT)
Received: from nixos ([83.217.168.175])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2f67c6sm70765203f8f.16.2026.06.10.10.30.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 10:30:34 -0700 (PDT)
From: Rhys Tumelty <rhys@tumelty.co.uk>
To: Viresh Kumar <vireshk@kernel.org>,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Wed, 10 Jun 2026 18:30:26 +0100
Message-ID: <20260610173026.1105803-1-rhys@tumelty.co.uk>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Spamd-Bar: -
X-MailFrom: rhys@tumelty.co.uk
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: CUN2MEJTCG3A22MJLOZNRL2HQAPWXCMX
X-Message-ID-Hash: CUN2MEJTCG3A22MJLOZNRL2HQAPWXCMX
X-Mailman-Approved-At: Thu, 11 Jun 2026 11:16:32 +0000
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Rhys Tumelty <rhys@tumelty.co.uk>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] staging: greybus: remove unused macro CAP_TIMEOUT_MS
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/CUN2MEJTCG3A22MJLOZNRL2HQAPWXCMX/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.49 / 15.00];
	R_DKIM_REJECT(1.00)[tumelty-co-uk.20251104.gappssmtp.com:s=20251104];
	MID_CONTAINS_FROM(1.00)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	DMARC_NA(0.00)[tumelty.co.uk];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[rhys@tumelty.co.uk,greybus-dev-bounces@lists.linaro.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:vireshk@kernel.org,m:johan@kernel.org,m:elder@kernel.org,m:gregkh@linuxfoundation.org,m:greybus-dev@lists.linaro.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:rhys@tumelty.co.uk,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[tumelty-co-uk.20251104.gappssmtp.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rhys@tumelty.co.uk,greybus-dev-bounces@lists.linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[greybus-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,lists.linaro.org:helo,lists.linaro.org:rdns,lists.linaro.org:from_smtp,tumelty.co.uk:email,tumelty.co.uk:mid,tumelty.co.uk:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6AA2567139C

The macro CAP_TIMEOUT_MS is defined but never used anywhere
in the kernel tree. Remove it to clean up code.

Signed-off-by: Rhys Tumelty <rhys@tumelty.co.uk>
---
 drivers/staging/greybus/authentication.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/greybus/authentication.c b/drivers/staging/greybus/authentication.c
index 97b9937bbdc1..d8f2cd43201f 100644
--- a/drivers/staging/greybus/authentication.c
+++ b/drivers/staging/greybus/authentication.c
@@ -15,8 +15,6 @@
 #include "greybus_authentication.h"
 #include "firmware.h"
 
-#define CAP_TIMEOUT_MS		1000
-
 /*
  * Number of minor devices this driver supports.
  * There will be exactly one required per Interface.
-- 
2.54.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
