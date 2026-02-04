Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oKRHMmNog2kymgMAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Wed, 04 Feb 2026 16:40:19 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D9C3E9177
	for <lists+greybus-dev@lfdr.de>; Wed, 04 Feb 2026 16:40:19 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id ABDDC3F8EC
	for <lists+greybus-dev@lfdr.de>; Wed,  4 Feb 2026 15:40:18 +0000 (UTC)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	by lists.linaro.org (Postfix) with ESMTPS id 028C53F750
	for <greybus-dev@lists.linaro.org>; Wed,  4 Feb 2026 10:14:03 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=hXiGus64;
	spf=pass (lists.linaro.org: domain of neelb2403@gmail.com designates 209.85.160.177 as permitted sender) smtp.mailfrom=neelb2403@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-50145d27b4cso6835551cf.2
        for <greybus-dev@lists.linaro.org>; Wed, 04 Feb 2026 02:14:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770200042; x=1770804842; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sFFi0szND7oE8w8xJDzQ/XyKXHeShqmhkjNpXUOPUes=;
        b=hXiGus64XCuQs4/4JlYrt4nd7EnTHYjFsb4DunzAJDOksjoZPV8CCrjaZdMDpYR1W3
         gR4GQps36yNEVKSPl+Ya8L+Az0x7BSpVt2t/cHx/jYITtr+PofBsKv/NrLEUkNTHNgBO
         kbaGDZi8oW5oZmhSiKSm1DsAyxwn3bIzG48YOaMk8ZpJtHEgcLax4WM2ehREwoOJoEL/
         EemvyseKZ9/B/C5y3TIXjNJ+6v1ESVsZJj3fUJ19LkKYXvM2uSxrJTIos0ST+uHUFUr+
         e8xuzC52pE2SvxHn8FOj2pqjmbXM2VduhjXYzWeskpXonSRf3K2U9Hci1Fg/4U/XQ7CK
         Y+vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770200042; x=1770804842;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sFFi0szND7oE8w8xJDzQ/XyKXHeShqmhkjNpXUOPUes=;
        b=WHfbfiR2fcS2vSR8T6FOcB6tpWHEjjfBHRN4a295ykv5YkSJYd1LRPQC8gcSdb2q1L
         UB+OX+/4XiBb4Rx0yoCb/t/U2JAOofLEE02k8SKMF1wjSZj5IlJTINRMUmHKLEzDzurZ
         JsMajqqCY3jJxSzVHZqGVsXFVYrzcCLpUoxP4ZZPTyF+yaz4okDlTKzpYWZsrPUsbwip
         kFDBfnukSXhi71nBlgdwzVsT4NZSUY6WNHqDyOOfgihdkXgCS1V8W8qPU7ldatQeXmQ9
         95y48xkPnSYDfQpegcTvJ6wsLtXvi2GPhNLjBswSSPSJt60g4SNorjVGyFmdylqqE6LA
         i0Mg==
X-Forwarded-Encrypted: i=1; AJvYcCWCOgIZ0iwsjQKOc/KgdWZrX7E0ED+4l8Qavru5338kvjHlGh/2io7n1b9KjsVv5IQAP2Jud4NXyQ9FQg==@lists.linaro.org
X-Gm-Message-State: AOJu0YyApfhvpMRByTLozYznra7MdM1QJsR+AXGpqYoDRKW/lWWJp+L1
	/cDWPrNA02vELExYQfxVBTm2I3wiDGG2czBh2s9CNBzWvN09pZBz+Rf2
X-Gm-Gg: AZuq6aLHHtopp4zGClDGqLJyKQQZY9CRYw9BMDGGNASocUvq3Zhcx+lrvPX4l60g5E4
	cOjfhd+f3bHR9PwF9g6Jw0RLM2z2+qaFpCQroyIXr2OT1YJ2CEre1Qjv4sLkMuDUI0zZgDhh2i3
	/pKL54KAtHs8/1DcHa5rFW5SyxwW7hOLjy4DBSvxHnHC5+OAFfzKUta0MalqPOEroqUCrEhL9Aw
	U5hGerDLEv4asIFrGKmW74sQYGPVlEZyZIKYo+TIXjYKIibVRt1KHlIgQZ3jZj1oLXr8IG6cZrg
	+Kp1pGKtOxdozUQ17TZVAOHTKNFcG8zSYCkkdJ3kdYcVq9TBgWdWKYCZdrLHX5WWN+kHcfmC7Ku
	aTKtPKa45wi3h7d0NAExnVw72ccXgTX/tLTZtHK/NZYg+gOFvRc6r+QCECD/Y1hi+0zn1j7x/aF
	V3nsisIi7x8hnCNA==
X-Received: by 2002:ac8:588f:0:b0:502:9b85:a609 with SMTP id d75a77b69052e-5061c151b03mr25198421cf.30.1770200042436;
        Wed, 04 Feb 2026 02:14:02 -0800 (PST)
Received: from Mac.home ([76.64.58.244])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5061c1e9971sm14014141cf.21.2026.02.04.02.14.00
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 04 Feb 2026 02:14:01 -0800 (PST)
From: Neel Bullywon <neelb2403@gmail.com>
To: Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Date: Wed,  4 Feb 2026 05:13:42 -0500
Message-ID: <20260204101342.71267-1-neelb2403@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Spamd-Bar: --
X-MailFrom: neelb2403@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: E7IPQ5K6ZRDRZEM65B3P6DDRZXMROCDT
X-Message-ID-Hash: E7IPQ5K6ZRDRZEM65B3P6DDRZXMROCDT
X-Mailman-Approved-At: Wed, 04 Feb 2026 15:40:10 +0000
CC: Neel Bullywon <neelb2403@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v2] staging: greybus: gbphy: replace sprintf() with sysfs_emit()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/E7IPQ5K6ZRDRZEM65B3P6DDRZXMROCDT/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.59 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx:c];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com];
	DKIM_TRACE(0.00)[gmail.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	FROM_NEQ_ENVFROM(0.00)[neelb2403@gmail.com,greybus-dev-bounces@lists.linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linaro.org:helo,lists.linaro.org:rdns,linaro.org:email]
X-Rspamd-Queue-Id: 9D9C3E9177
X-Rspamd-Action: no action

Replaced sprintf() with sysfs_emit() in the protocol_id_show() sysfs
attribute function. This code is safe, as replacing sprintf() with
sysfs_emit() gets rid of calls to sprintf()
as part of kernel hardening and sysfs_emit() is more appropriate in
this context.

Signed-off-by: Neel Bullywon <neelb2403@gmail.com>
---
This was compile-tested only (no VM/hardware used)
---
 drivers/staging/greybus/gbphy.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/gbphy.c b/drivers/staging/greybus/gbphy.c
index 60cf09a302a7..55f132b09cee 100644
--- a/drivers/staging/greybus/gbphy.c
+++ b/drivers/staging/greybus/gbphy.c
@@ -31,7 +31,7 @@ static ssize_t protocol_id_show(struct device *dev,
 {
 	struct gbphy_device *gbphy_dev = to_gbphy_dev(dev);
 
-	return sprintf(buf, "0x%02x\n", gbphy_dev->cport_desc->protocol_id);
+	return sysfs_emit(buf, "0x%02x\n", gbphy_dev->cport_desc->protocol_id);
 }
 static DEVICE_ATTR_RO(protocol_id);
 
-- 
2.44.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
