Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EAl+HgkSOWo/mQcAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Mon, 22 Jun 2026 12:44:25 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id EEE296AECC0
	for <lists+greybus-dev@lfdr.de>; Mon, 22 Jun 2026 12:44:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=gmail.com header.s=20251104 header.b=nGmbSIx6;
	spf=pass (mail.lfdr.de: domain of "greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org" designates 44.210.186.118 as permitted sender) smtp.mailfrom="greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org";
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=gmail.com (policy=none)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id AEACB40966
	for <lists+greybus-dev@lfdr.de>; Mon, 22 Jun 2026 10:44:23 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	by lists.linaro.org (Postfix) with ESMTPS id 0EC823F9BF
	for <greybus-dev@lists.linaro.org>; Mon, 22 Jun 2026 04:27:29 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2bf22d29dabso23340645ad.2
        for <greybus-dev@lists.linaro.org>; Sun, 21 Jun 2026 21:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782102448; x=1782707248; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q6VzAs6AH3TNjyBp93Ecb8QiyKrxhvN/1oDoDDuY4Io=;
        b=nGmbSIx6eIirWQnIXIXAle9LBSPXifGR+X6DYD43pBnh1A3orjCEJLrAYJLUS2SI1N
         ywwSSH/mv68GuSHEnk4o3NNwI+Rv1U27qQ2Ql389e1nXuyHeD1qFJyr9w5wKVa7X3XOW
         U6UwB9M3zLb24NoLbXDUxAR5PCoqmya2AwNS/sFY9PHH6YVZiPoqnSBzU9Nz8mDAHmrx
         mLAwZbfUQwn9VaNFq62kyzhJiHP5UIqtPnwnKDfkkeaIyL/YLkRt19LPIsVAFCbzDOxH
         YAl5lAiPT0G3+u8pL2nSB5xeSdSLHLsVEv8C7NEI9kJ4SH1p7Mhy5O8JuDm+vXiZlAZQ
         FDsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782102448; x=1782707248;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q6VzAs6AH3TNjyBp93Ecb8QiyKrxhvN/1oDoDDuY4Io=;
        b=VWP7pYjCFQuFAIi543HAcnDFGJEIKbLj37rSB1i/zgMULNoegKRr5vIrFw9bIE/ZI6
         AXLu9N9RkpexXlQCGtrtgFUudKJbK38TSFRLynAe3i1IHC88Rhaqymz4/WyrInbfnEbK
         yamQGA12XtEipmsVR9rYFerTUOdlrKsoahV2xgC3Gq1eBtyu9HgDdMHCb1PPppa4whzR
         0K6LbHs8y4JGbHeBercBNTotwLP01dHMU0v0/E2K0pQAgRSYyO3EUURa4l5smVLW8hUI
         QJVqcb82rUJbEqPqI6qLcEPihu4L3QQXARCcfSKO1vbfahRe48cN+Vx4lawtdoJobLYa
         +FwA==
X-Forwarded-Encrypted: i=1; AHgh+RpheQmex/q3c22LxztAD0NGsEBGMVHNANx46HgODlInwHlwqPgxNUfEPg7yXKzr3qfUra4ejdzDv1lzvg==@lists.linaro.org
X-Gm-Message-State: AOJu0YwYjRqwMHzMG0i4n/VfBi9EMCTAxDeix3dd2ZhcFEYZYGoyjElR
	5Q0M345tWm6zXBtoXQve0IU72Po9W+ZBUR2MVfnuPlbjNmWIp3Mp6zAA
X-Gm-Gg: AfdE7cmsUFep1TAHI2TCuaTpFmNXqpGtHMKYrht4LokQEVKzS1MxL1FoyMsNON0DPNV
	GU0ClYgxw3UwTKbDUKRRhB/ZKG651CmMdY6aJn+itZvSg9eAk/MBO4gjPdgL7Fk2A8ZhzstSlFi
	fPheDC0NcLMACYkbf4Kzji9yLr2XlWVSJJfOkeVnX7PQZfktxIOwYg6hmM5Dr/hNUekEZSu3Ojn
	pcR4/oSAg4J5uwmt8SVClZHh5De1pTA9jtrB4bDXGMeMIuaO5zgJQpGs5c3+ziwDdT077iENRSJ
	0+UmzmbD/47VUw9aFwwgNGaWQbUflbsYhnmtxj9Y6kHvPmYm72tubdRhuYvzpt2hOYBNHItwtyJ
	9YpBfVl8n+BT5dNBWpDW/7iYFHeyx2na3TFKdpBHh12+Vyh9f3ysLxWPMLdC7KQVDeIvvDdm7qy
	rSWePs/mTaeT9wrpZ4L2dYbQbSruVU/O+fjTgYS7UHwKcRjjTCwVxu5RxGzhMK7ATihPtUG4W2G
	ak+JimPkYD8hEtzdJjU2M9AhIqsmirY0rA9GTgabAsiWAyahtaU9ZCEEg==
X-Received: by 2002:a17:902:ea0b:b0:2c6:a772:7e43 with SMTP id d9443c01a7336-2c742b1cea8mr97469225ad.18.1782102448080;
        Sun, 21 Jun 2026 21:27:28 -0700 (PDT)
Received: from kapoor.mahindrauniversity.edu.in ([122.184.65.229])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7436f7df4sm68123595ad.31.2026.06.21.21.27.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2026 21:27:27 -0700 (PDT)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Mon, 22 Jun 2026 09:57:21 +0530
Message-ID: <20260622042721.31760-1-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Spamd-Bar: --
X-MailFrom: kapoorarnav43@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: S2HTNKXWIBUWQUGKML7L4CCGNCNZ33TZ
X-Message-ID-Hash: S2HTNKXWIBUWQUGKML7L4CCGNCNZ33TZ
X-Mailman-Approved-At: Mon, 22 Jun 2026 10:44:20 +0000
CC: Johan Hovold <johan@kernel.org>, linux-staging@lists.linux.dev, greybus-dev@lists.linaro.org, Arnav Kapoor <kapoorarnav43@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [staging] staging: greybus: loopback: add missing comment for mutex
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/S2HTNKXWIBUWQUGKML7L4CCGNCNZ33TZ/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.59 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:gregkh@linuxfoundation.org,m:johan@kernel.org,m:linux-staging@lists.linux.dev,m:greybus-dev@lists.linaro.org,m:kapoorarnav43@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[kapoorarnav43@gmail.com,greybus-dev-bounces@lists.linaro.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kapoorarnav43@gmail.com,greybus-dev-bounces@lists.linaro.org];
	FREEMAIL_CC(0.00)[kernel.org,lists.linux.dev,lists.linaro.org,gmail.com];
	TAGGED_RCPT(0.00)[greybus-dev];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EEE296AECC0

Add a comment for the mutex as suggested by checkpatch.

Signed-off-by: Arnav Kapoor <kapoorarnav43@gmail.com>
---
 drivers/staging/greybus/loopback.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/loopback.c b/drivers/staging/greybus/loopback.c
index ea57b1f5d..bf827e672 100644
--- a/drivers/staging/greybus/loopback.c
+++ b/drivers/staging/greybus/loopback.c
@@ -61,7 +61,7 @@ struct gb_loopback {
 
 	struct dentry *file;
 	struct kfifo kfifo_lat;
-	struct mutex mutex;
+	struct mutex mutex;		/* protects the entire structure */
 	struct task_struct *task;
 	struct device *dev;
 	wait_queue_head_t wq;
-- 
2.53.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
