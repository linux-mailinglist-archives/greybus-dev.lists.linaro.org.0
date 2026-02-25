Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cK1iKg98n2mMcQQAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Wed, 25 Feb 2026 23:47:43 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 35FF919E708
	for <lists+greybus-dev@lfdr.de>; Wed, 25 Feb 2026 23:47:43 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 2B1B9402B4
	for <lists+greybus-dev@lfdr.de>; Wed, 25 Feb 2026 22:47:42 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	by lists.linaro.org (Postfix) with ESMTPS id 537B8400F4
	for <greybus-dev@lists.linaro.org>; Wed, 25 Feb 2026 21:29:58 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=K6z69m0C;
	spf=pass (lists.linaro.org: domain of linuxoid@gmail.com designates 209.85.221.41 as permitted sender) smtp.mailfrom=linuxoid@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4398f8e2837so151382f8f.1
        for <greybus-dev@lists.linaro.org>; Wed, 25 Feb 2026 13:29:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772054997; x=1772659797; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vL2gQfXBf12veR/aTVeOj+fmUJCvNz6gPc20+jAbMl0=;
        b=K6z69m0C+pGiw7EV9qz2sjVH8c8zSgrNpzCXO6JffvNuTjAJAZekcDrOyafKfrixhV
         rkcRPIa5rYrUBNgxJAGD82fjzSA+4KTZr8tvvn3ug9Ukoh+6SP5kmmBDRaFhYibubjsS
         WuT/nB6nYUbC5GSdmQA1/jci7U7OoZn3mmO6UiaF9J9/A4ZJUQ0x533Ww+lBR4xHELl4
         amdrK3OLxz4vJIXtZi4zjAzR8hafeHcucP5Ln0ApzSBy17fLTqeUStse1Fwy3VcnDH4+
         iRlIEJhDsotByspxIP1VVRkVCWMnLjHhYcZD5S/VdaOd89r0DbkR+HUQP6/plsJRDJiY
         c4Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772054997; x=1772659797;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vL2gQfXBf12veR/aTVeOj+fmUJCvNz6gPc20+jAbMl0=;
        b=XfkdNWp7Mo9mNvcfKw+pJDodCzbLo+hh3aa7dXdSxa6v6xjHozNxhTIU1PmHqXaWf4
         zc6nQTOhYUU2XLEajZJHBYvY8ebRW0jbO0ji9Uy3zi43ZBmjjIR+Pc2N7zltGpG9RrBL
         V++prQafUqO5D4CdRu8TnbELmr8pviWftFWGen4dRdTYeNxHAFYC1+bKTgYqR27koGEA
         KS5k0IcPfzAvPNFdKZbs1j9ED3IIkqePuX+a1dTP2USNHb+iyRowaiviWD+D7X7I3N7e
         t412OOMITRNiDGKDL30erzbLwc5EXyMRHj01uCnU+metVF5hLMoj779jK5+Y3I1xpzpx
         JNwg==
X-Gm-Message-State: AOJu0YxboUBvTCWs3lzZTTkydOEIxGemvodl6wGPeRPajZlM8p1elHb3
	kDrRxj+OpUIkUFmOk/IxhkJqluxEDcxHFtvJN16+WzOnB5gtn4g64phu
X-Gm-Gg: ATEYQzzr9QmLWwrwv2M41tliCN6sNRaGAnBOakQgLKkgQj+TaTaNDd+ypjeVUU0a87R
	yH2KECEyDKsB6LdL06+EOpWFtsMoW//mA9RKEKDSMr8ELs4KTlZj/4Kr4RSrG2ilBjjzD5FgcEi
	XB3/NzV/HoRhQRCdahkbGQ3jf+26qlLlZDcCfsA1f0pWrAlNrP4LtTQBvZEfzPZc8Xyz52HVBIH
	NnVi5/GXXy2zR9q8FQqE5jVacxM5HNGk9AVZWDawPi3SDyjYi/4fxLjbCdqoTC0YdjA4PsxfkQk
	NaGjQ9yMAjjVdDN8/IpbRQKSogxFrJYpa+vuDPZXTWdw6s/vnG/WJgLQCtv6okjXpddL7gSTDs9
	dIAWwduBjIom/ZsG4iYdvzo1tgIHeRChVFMvajqnbPnx94j7Bdn+wtJmKTbm+verxbskA7GKzDA
	==
X-Received: by 2002:a5d:5d84:0:b0:437:7177:8f04 with SMTP id ffacd0b85a97d-4396f15b248mr34788029f8f.14.1772054997083;
        Wed, 25 Feb 2026 13:29:57 -0800 (PST)
Received: from kimsufi.. ([2001:41d0:303:6f54::1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43995056115sm2452561f8f.14.2026.02.25.13.29.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 13:29:56 -0800 (PST)
From: Ruslan Valiyev <linuxoid@gmail.com>
To: Vaibhav Hiremath <hvaibhav.linux@gmail.com>,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Wed, 25 Feb 2026 21:29:55 +0000
Message-ID: <20260225212955.57102-1-linuxoid@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Spamd-Bar: --
X-MailFrom: linuxoid@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: EVHZHQD2ZWTKEUHMTPIXSBL2KBEQVW2H
X-Message-ID-Hash: EVHZHQD2ZWTKEUHMTPIXSBL2KBEQVW2H
X-Mailman-Approved-At: Wed, 25 Feb 2026 22:47:40 +0000
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Ruslan Valiyev <linuxoid@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] staging: greybus: arche: use sysfs_emit() instead of sprintf()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/EVHZHQD2ZWTKEUHMTPIXSBL2KBEQVW2H/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.09 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,linuxfoundation.org];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[lists.linaro.org,lists.linux.dev,vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-0.974];
	FROM_NEQ_ENVFROM(0.00)[linuxoid@gmail.com,greybus-dev-bounces@lists.linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email]
X-Rspamd-Queue-Id: 35FF919E708
X-Rspamd-Action: no action

Replace sprintf() with sysfs_emit() in state_show() sysfs attribute
callbacks in arche-platform.c and arche-apb-ctrl.c.

sysfs_emit() is preferred over sprintf() in sysfs show functions
because it is aware of the PAGE_SIZE buffer limit, preventing
potential buffer overflows. This addresses checkpatch warnings
about the use of sprintf() in sysfs show callbacks.

Signed-off-by: Ruslan Valiyev <linuxoid@gmail.com>
---
 drivers/staging/greybus/arche-apb-ctrl.c | 10 +++++-----
 drivers/staging/greybus/arche-platform.c | 10 +++++-----
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/greybus/arche-apb-ctrl.c b/drivers/staging/greybus/arche-apb-ctrl.c
index 33f26a65f..19a6e59b6 100644
--- a/drivers/staging/greybus/arche-apb-ctrl.c
+++ b/drivers/staging/greybus/arche-apb-ctrl.c
@@ -300,16 +300,16 @@ static ssize_t state_show(struct device *dev,
 
 	switch (apb->state) {
 	case ARCHE_PLATFORM_STATE_OFF:
-		return sprintf(buf, "off%s\n",
+		return sysfs_emit(buf, "off%s\n",
 				apb->init_disabled ? ",disabled" : "");
 	case ARCHE_PLATFORM_STATE_ACTIVE:
-		return sprintf(buf, "active\n");
+		return sysfs_emit(buf, "active\n");
 	case ARCHE_PLATFORM_STATE_STANDBY:
-		return sprintf(buf, "standby\n");
+		return sysfs_emit(buf, "standby\n");
 	case ARCHE_PLATFORM_STATE_FW_FLASHING:
-		return sprintf(buf, "fw_flashing\n");
+		return sysfs_emit(buf, "fw_flashing\n");
 	default:
-		return sprintf(buf, "unknown state\n");
+		return sysfs_emit(buf, "unknown state\n");
 	}
 }
 
diff --git a/drivers/staging/greybus/arche-platform.c b/drivers/staging/greybus/arche-platform.c
index f669a7e2e..de5de59ea 100644
--- a/drivers/staging/greybus/arche-platform.c
+++ b/drivers/staging/greybus/arche-platform.c
@@ -374,15 +374,15 @@ static ssize_t state_show(struct device *dev,
 
 	switch (arche_pdata->state) {
 	case ARCHE_PLATFORM_STATE_OFF:
-		return sprintf(buf, "off\n");
+		return sysfs_emit(buf, "off\n");
 	case ARCHE_PLATFORM_STATE_ACTIVE:
-		return sprintf(buf, "active\n");
+		return sysfs_emit(buf, "active\n");
 	case ARCHE_PLATFORM_STATE_STANDBY:
-		return sprintf(buf, "standby\n");
+		return sysfs_emit(buf, "standby\n");
 	case ARCHE_PLATFORM_STATE_FW_FLASHING:
-		return sprintf(buf, "fw_flashing\n");
+		return sysfs_emit(buf, "fw_flashing\n");
 	default:
-		return sprintf(buf, "unknown state\n");
+		return sysfs_emit(buf, "unknown state\n");
 	}
 }
 
-- 
2.43.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
