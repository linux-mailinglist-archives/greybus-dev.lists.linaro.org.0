Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 91D8ECF11B3
	for <lists+greybus-dev@lfdr.de>; Sun, 04 Jan 2026 16:30:21 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 25BC340154
	for <lists+greybus-dev@lfdr.de>; Sun,  4 Jan 2026 15:30:20 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	by lists.linaro.org (Postfix) with ESMTPS id 8BE6D3F738
	for <greybus-dev@lists.linaro.org>; Sun,  4 Jan 2026 13:28:50 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=LlH3CgCD;
	spf=pass (lists.linaro.org: domain of gideonadjei.dev@gmail.com designates 209.85.221.42 as permitted sender) smtp.mailfrom=gideonadjei.dev@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-43277900fb4so451989f8f.1
        for <greybus-dev@lists.linaro.org>; Sun, 04 Jan 2026 05:28:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767533329; x=1768138129; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=L1AIJWb3/kCj7L5oXmqEXiTeY73sTXhIcnG/l34jjK4=;
        b=LlH3CgCDsgnvwgCUhk/vGAbOZyJwZh36yyRE++UGbl8+biX/Eg3KaXIrY6TtmgGLWh
         6wEemZNXnM7+G2WBktAyvMPSz4IXKGxoGJKtDvuLtsVqf+Mq4NbtcQJL2jViNrGz3Xs1
         JhUh2hxS+dPGrCDMgcHapOXukfCs2BS2pqAf4RffDBTWmqTZmGyJtygi44c47j7HTg7i
         WE3IP4QywxC8CKhMGEiFvITY5g97WIMwaTmk6l/U8PUCVGWVaeZWBPjaVrmaqlDap6Ta
         L6RjYT34Irfjw8ZU8xeqgI4XvPN70IPWtPwIoUy0CqQtKHnaHDlbfJcYrQ4yEhrj/1gH
         ah8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767533329; x=1768138129;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L1AIJWb3/kCj7L5oXmqEXiTeY73sTXhIcnG/l34jjK4=;
        b=KuD86Qj3C9tEdhPA9YmbjU8ooe0LH+Ji+lf2TJWKEhGFeqWJlBRoKrKSvgdNG/nlf6
         Gt/gbk3fhQuM50Wso5r87ArBUW+VktmddClG3Nf1PZL1YfUCtty46g3bX19f0cWqV1Tf
         9HL27+CoEPLcd3SuSte0Hi59uHpN2AGg8X36LxsjgV5z0KQwJ1R5745WNrbE2UZjZJYN
         hcBg8bI968yasRt0pI2tX3MECccIUpnXqNnMZkrMqO+Jlf71ChQJ2mpbYsPtLuQIqUXc
         rZ1VMKkcGLrlgGGswK1gnepKEq22L/jcWwfnmvTf1R4nkuPnWSGMmXlRcRjcHI5hCs+Z
         Stsg==
X-Forwarded-Encrypted: i=1; AJvYcCUSOCFMwgGGyysvPAgY1aXnr8qIqKLnAl2SZKlc6DQz2QS4c2MURHeguvLEgsKtANLcBA4Z4xQXBvAiLQ==@lists.linaro.org
X-Gm-Message-State: AOJu0Yy8LrFhzcD3vS/HUjl3fSNUujsTKlkD612gWoSvSlMl1g+kFhfo
	qoDZIQt53kEEzoTZikYt0qPHFAjaLQhvy+CYUpiM2Vvd11dMXNel+aGR
X-Gm-Gg: AY/fxX5Rtvwikfn79cGYPS06eJlb6tL4MKrUPEE2gH6F5WxRZv6ykqT27Ax+akU5GZK
	Pb2T8G26NT5R6HjY/mkb2JfXhWZVCF1lxM6u+gzDL08fnkbOpoWkKW+xfSs4Z/bxu5rReTm6ZcF
	Rf+/9sfkpFktFK9iFaYn7TzGVJLcdcwXnF37qpip61Z2Cvh9ct+R2DVVPU1YWaHIlDc+1ZPGwY6
	s/8RjPqpNxPZt9yEKvwKJhcBGEqOeVSotuBbvjsA0czKscsTmL1tpgH94Alp+MU04ZUE68oPlop
	/UabeLS8APrIJsEkzLJJcvL0e5uIvHvWCknFZzNvhjHrcGMsLS/PWa7/13WfaxpkWTIy7T7Oo4Z
	UpXvfqGn72LDAVxNPy5j3E7hNndU1jgwqOY/Cwx8WRU/n/FNvFLHbVYOV1Kj+cwUp7eHRHuL0Oe
	XSB1FK1k6AY44pw9xO1W2iDT7Yn8h0LJWrgRKFuA5qyv9E
X-Google-Smtp-Source: AGHT+IGffU+JSijY0LRNw9f2vpdBTi86ITqmDz41R3hlIyzt3/GBlJ2coTvZzB4BGBrp8UzDBrVE6Q==
X-Received: by 2002:a05:600c:1e1c:b0:471:5c0:94fc with SMTP id 5b1f17b1804b1-47d6ba81c6dmr65059865e9.6.1767533329365;
        Sun, 04 Jan 2026 05:28:49 -0800 (PST)
Received: from ubuntu.localdomain ([129.122.44.54])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d6be6b202sm37356965e9.6.2026.01.04.05.28.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jan 2026 05:28:49 -0800 (PST)
From: Gideon Adjei <gideonadjei.dev@gmail.com>
To: Vaibhav Hiremath <hvaibhav.linux@gmail.com>
Date: Sun,  4 Jan 2026 05:25:41 -0800
Message-Id: <20260104132541.17989-1-gideonadjei.dev@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Rspamd-Queue-Id: 8BE6D3F738
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.50 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DNSWL_BLOCKED(0.00)[129.122.44.54:received];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FREEMAIL_CC(0.00)[kernel.org,linuxfoundation.org,lists.linaro.org,lists.linux.dev,vger.kernel.org,gmail.com];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.221.42:from];
	RCPT_COUNT_SEVEN(0.00)[8];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RCVD_IN_DNSWL_NONE(0.00)[209.85.221.42:from];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-MailFrom: gideonadjei.dev@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: HN4SSF7ONFJ6SOXRRJZ6YWOI255V3GJU
X-Message-ID-Hash: HN4SSF7ONFJ6SOXRRJZ6YWOI255V3GJU
X-Mailman-Approved-At: Sun, 04 Jan 2026 15:30:18 +0000
CC: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Gideon Adjei <gideonadjei.dev@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] staging: greybus: replace WD_STATE_COLDBOOT_TRIG with state
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/HN4SSF7ONFJ6SOXRRJZ6YWOI255V3GJU/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

use state temporary variable to replace WD_STATE_COLDBOOT_TRIG argument
in arche_platform_set_wake_detect_state. This keeps lines under 80
columns and satisfies kernel style guidelines.

Signed-off-by: Gideon Adjei <gideonadjei.dev@gmail.com>
---
 drivers/staging/greybus/arche-platform.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/greybus/arche-platform.c b/drivers/staging/greybus/arche-platform.c
index 8aaff4e45660..bb9b3c3c7a2d 100644
--- a/drivers/staging/greybus/arche-platform.c
+++ b/drivers/staging/greybus/arche-platform.c
@@ -155,6 +155,7 @@ static irqreturn_t arche_platform_wd_irq(int irq, void *devid)
 {
 	struct arche_platform_drvdata *arche_pdata = devid;
 	unsigned long flags;
+	int state;
 
 	spin_lock_irqsave(&arche_pdata->wake_lock, flags);
 
@@ -179,8 +180,8 @@ static irqreturn_t arche_platform_wd_irq(int irq, void *devid)
 				 */
 				if (arche_pdata->wake_detect_state !=
 						WD_STATE_COLDBOOT_START) {
-					arche_platform_set_wake_detect_state(arche_pdata,
-									     WD_STATE_COLDBOOT_TRIG);
+					state = WD_STATE_COLDBOOT_TRIG;
+					arche_platform_set_wake_detect_state(arche_pdata, state);
 					spin_unlock_irqrestore(&arche_pdata->wake_lock,
 							       flags);
 					return IRQ_WAKE_THREAD;
-- 
2.34.1

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
