Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4HUBK6QHoGm4fQQAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Thu, 26 Feb 2026 09:43:16 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F7871A2C2E
	for <lists+greybus-dev@lfdr.de>; Thu, 26 Feb 2026 09:43:16 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 78A473F9B5
	for <lists+greybus-dev@lfdr.de>; Thu, 26 Feb 2026 08:43:15 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	by lists.linaro.org (Postfix) with ESMTPS id 37ED03F7E6
	for <greybus-dev@lists.linaro.org>; Thu, 26 Feb 2026 07:49:01 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=j1ytwbPU;
	spf=pass (lists.linaro.org: domain of linuxoid@gmail.com designates 209.85.221.41 as permitted sender) smtp.mailfrom=linuxoid@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-436309f1ad7so386882f8f.3
        for <greybus-dev@lists.linaro.org>; Wed, 25 Feb 2026 23:49:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772092140; x=1772696940; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Obp+jlj4fAJJnC5C1xFGFcA2X3tdhF8x/67LbIKcCNc=;
        b=j1ytwbPUA+NDPzdSQHCE88ibsGmcJqyNH/yK5/ydqZf+U+6UIgYK3qOF6bgwlPr+HY
         JsmK4XcDg8hylp26sPd4ooJBZJ5QFClPUXkDoDi5w5sN4RS48P4w+7af0FLks+skCm5V
         W7KG/5hFk2t3OqAL1vz1u/GU9zpLEQh3YPkvWqZ3r6TaRCmQYzGarJDBVgEDYOJPaOz+
         pf3trWfNBSnI52+N70MsVIQtgUstqywkxYzFNTy+wgaZkmF4VizlC9pOdLTNoE/hZQ0o
         ssgR1zpxwq5OhwZgwUlYROtFSW2ZuB4UulZljbDPGJW8Y78yDanhODZCaexnadoMYkBm
         0tbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772092140; x=1772696940;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Obp+jlj4fAJJnC5C1xFGFcA2X3tdhF8x/67LbIKcCNc=;
        b=CnibdVXs61a+GmOBm+EP9e5dmMvejo9ggo+L+Iz16FsT92Bfu7gzM7dokqowNVpToF
         my3lsxqqavrAVFKVAanaoYSY6xBuio7ml1CyuVJKsMlw7wx0PTqf+/jAUEaJUJBfd7ic
         2RIuv4LhFUjFbtPW0EWDTMVcrHQvc8muSzO65p6/Gh73zyBqADqO26Owv7/whlTCyddG
         nAaajUGZ97lrSErR4U/241AD39pnGUDteBtVksi56oj4ZefBl2BhW1tloPzA8bjuJTEg
         Oj0Bv79fBkaJRNVep5IRk6Y38wGt2YKa2fQIuSwBzhVpT0hU1+XyPVMigfB6OMpCX6OU
         PeoQ==
X-Forwarded-Encrypted: i=1; AJvYcCWCpTOdXSFXdjFVQm4h8qqhI7wZ1VkaEzuOHbUHZk/yHVVdkmvCtsvDA2Pa9CxWwfA0xu9/QgmRoznTXg==@lists.linaro.org
X-Gm-Message-State: AOJu0Yw5Xa8colAEWDdKFSrydpq4CRlPhCT877zi+/YM3HMm6B337Fyu
	UKc39JK8wP8dEjhV9Pz7v84X/ThP8RZmmiUgQ73EidBk0dZR00OIViFA
X-Gm-Gg: ATEYQzyIuqpuYbd3UzJvzLbTl83JM0pJvHwVSwEo82kEL5JxEWhICjrn5nU6jEMkXn+
	1/RadNoIskkbdwtUkWEykqvKSE39KIUepaVrQTjZSKXIV8IsNAsEoqUHvWwzZMsqVjjKvP1/2zM
	7h35eHlhKqVLFVMLrKzM4Xz9NqeO1DIrHzryNDdjGFe6WhvaBum6bwyuCUYHV9GPGecjG3hpdoq
	uhRxVC5tG+9Hq1cp5wvMAVByah9jkPTHLK5EZjwJJqhF4rtvGvBMVZIiBBdUuzHj5YFy9W+e2e3
	yoDfdF7RJ0bWh0BCqVlLDD4ivV9Y7Pq8CAGtkb2b9bwAZuQj1CkuHPDlL6abHiaxj3/xqhNRQdw
	Bf7FFXAx9xCqAzTCZ3TM066+DJ0FcAInEEEXz6KLS7Dug1klk6LZvOlQ6xor5ZfdebobJb/BLKw
	==
X-Received: by 2002:a05:6000:250f:b0:439:881a:656c with SMTP id ffacd0b85a97d-4399429ca55mr5857411f8f.6.1772092139934;
        Wed, 25 Feb 2026 23:48:59 -0800 (PST)
Received: from kimsufi.. ([2001:41d0:303:6f54::1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970bfa015sm39244229f8f.8.2026.02.25.23.48.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 23:48:59 -0800 (PST)
From: Ruslan Valiyev <linuxoid@gmail.com>
To: Vaibhav Hiremath <hvaibhav.linux@gmail.com>,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Thu, 26 Feb 2026 07:48:58 +0000
Message-ID: <20260226074858.67635-1-linuxoid@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260225212955.57102-1-linuxoid@gmail.com>
References: <20260225212955.57102-1-linuxoid@gmail.com>
MIME-Version: 1.0
X-Spamd-Bar: --
X-MailFrom: linuxoid@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: QUAUTWONKXENJ6DD5TFI4AR7VDH22DDC
X-Message-ID-Hash: QUAUTWONKXENJ6DD5TFI4AR7VDH22DDC
X-Mailman-Approved-At: Thu, 26 Feb 2026 08:43:06 +0000
CC: Dan Carpenter <dan.carpenter@linaro.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Ruslan Valiyev <linuxoid@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v2] staging: greybus: arche: use sysfs_emit() instead of sprintf()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/QUAUTWONKXENJ6DD5TFI4AR7VDH22DDC/>
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
	R_SPF_ALLOW(-0.20)[+mx:c];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,linuxfoundation.org];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[linaro.org,lists.linaro.org,lists.linux.dev,vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-0.974];
	FROM_NEQ_ENVFROM(0.00)[linuxoid@gmail.com,greybus-dev-bounces@lists.linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,lists.linaro.org:helo,lists.linaro.org:rdns]
X-Rspamd-Queue-Id: 6F7871A2C2E
X-Rspamd-Action: no action

Replace sprintf() with sysfs_emit() in state_show() sysfs attribute
callbacks in arche-platform.c and arche-apb-ctrl.c.

Checkpatch complains about code using sprintf(). This code here is
obviously safe as-is, but it would be more appropriate to use
sysfs_emit().

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
