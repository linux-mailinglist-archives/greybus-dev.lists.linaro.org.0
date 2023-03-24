Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 01F406C96AD
	for <lists+greybus-dev@lfdr.de>; Sun, 26 Mar 2023 18:09:54 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id D87C03E94D
	for <lists+greybus-dev@lfdr.de>; Sun, 26 Mar 2023 16:09:52 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	by lists.linaro.org (Postfix) with ESMTPS id 90E583E96A
	for <greybus-dev@lists.linaro.org>; Fri, 24 Mar 2023 07:31:58 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20210112 header.b=V4OuRY0X;
	spf=pass (lists.linaro.org: domain of sumitraartsy@gmail.com designates 209.85.216.52 as permitted sender) smtp.mailfrom=sumitraartsy@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pj1-f52.google.com with SMTP id om3-20020a17090b3a8300b0023efab0e3bfso4255658pjb.3
        for <greybus-dev@lists.linaro.org>; Fri, 24 Mar 2023 00:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679643118;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BLwbqhkP3x7d9e508XmAAFyMChf+5bvOpcoj8t6arpQ=;
        b=V4OuRY0X0mSGzHnm+klSyWUnsEr8WBD5exIeFu787Enw/u3mEIEtCYmLkDqcMfhhuR
         mtz09DZrMebbCURoMzVJGb7/SuCUmv/7MJz0oCOgyC7z9TvwjkCO3Dnul1fIMC+J/7Dm
         O+jHaVdwMigP7pUOufxcx83PdltzmN9rEb2Ev6cw1AF5QuXUUSADXZP90RmhVERw0cbY
         +0WaRXPpDPiVz0wY3l6xBMglBxFG5Hz1bATZwDeDbJ52U3PAK95QPWNB/OaOKRS6p/tu
         E9eK8q+x0RhijCpTG/xU/5y19bm3A66XK4dxL6PmyXTf5OtMc2NkMoAez3sNr2/lfwG9
         1pqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679643118;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BLwbqhkP3x7d9e508XmAAFyMChf+5bvOpcoj8t6arpQ=;
        b=qopTzteRvpESgD5vOTSUoPQSRuzDr6sfGPc9/8Bdmw0qjrfn5v6i9eaJia+tECdpB3
         PejgMl4Ko8edTeWKPJG7LfzALc2rRinAo2gile9mfeSquX87c732zHfPe7Sau2pDpaex
         ScdftmJWAVbGsUWtfjCj0FpXLjZUcC+1p3o/2e/ZCD+K/DCyunBTHXHRH0dVzXecfAOJ
         2ihEmnT8yqGg4JQxfo5CJCJLsLewtyhf9sMOUX0IshbO/5+Y4Ol5K2aWkKdvshmF+YGJ
         3ZKYsWKq4J+OAGRi+D4Pm/SYSD6sbpk8UVgEiEZRNf99rfoczL8ayNF3UpBQqe9P7TAn
         akXQ==
X-Gm-Message-State: AAQBX9cs7jYyAhgbXEvn9Gj+EvxWXvx0KoHHWnySFmB8J0DF/e2gZ4ni
	ed9CApVkPyRKz2DeYDp+KoY=
X-Google-Smtp-Source: AKy350YV5ki71rAX+GEaClRDCHhl8SLu+UFi2u05G9ndCaFXgdafTTnqC4cipNikC2ZOFxlh9bvTUg==
X-Received: by 2002:a17:902:e812:b0:199:4be8:be48 with SMTP id u18-20020a170902e81200b001994be8be48mr1852380plg.19.1679643117590;
        Fri, 24 Mar 2023 00:31:57 -0700 (PDT)
Received: from ubuntu.localdomain ([59.89.175.90])
        by smtp.gmail.com with ESMTPSA id v12-20020a1709029a0c00b0019a75ea08e5sm13511604plp.33.2023.03.24.00.31.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Mar 2023 00:31:57 -0700 (PDT)
From: Sumitra Sharma <sumitraartsy@gmail.com>
To: outreachy@lists.linux.dev
Date: Fri, 24 Mar 2023 00:29:54 -0700
Message-Id: <215538f49cca6be05f846704e2ca15cd10144207.1679642024.git.sumitraartsy@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1679642024.git.sumitraartsy@gmail.com>
References: <cover.1679642024.git.sumitraartsy@gmail.com>
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 90E583E96A
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.60 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20210112];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.216.52:from];
	MIME_GOOD(-0.10)[text/plain];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,linuxfoundation.org,lists.linaro.org,lists.linux.dev,vger.kernel.org,gmail.com];
	FROM_EQ_ENVFROM(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2]
X-MailFrom: sumitraartsy@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: GJPRSLHWD7JK3EFRI53OGBZ3FTPIW6KJ
X-Message-ID-Hash: GJPRSLHWD7JK3EFRI53OGBZ3FTPIW6KJ
X-Mailman-Approved-At: Sun, 26 Mar 2023 16:09:32 +0000
CC: johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Sumitra Sharma <sumitraartsy@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v2 1/3] Staging: greybus: Use inline function for macro gpio_chip_to_gb_gpio_controller
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/GJPRSLHWD7JK3EFRI53OGBZ3FTPIW6KJ/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Convert 'gpio_chip_to_gb_gpio_controller' from a macro to a static
inline function, to make the relevant types apparent in the
definition and to benefit from the type checking performed by
the compiler at call sites.

Signed-off-by: Sumitra Sharma <sumitraartsy@gmail.com>
---
v2: Change patch subject, noted by Alison Schofield 
<alison.schofield@intel.com>

 drivers/staging/greybus/gpio.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/greybus/gpio.c b/drivers/staging/greybus/gpio.c
index d729b922a750..2a115a8fc263 100644
--- a/drivers/staging/greybus/gpio.c
+++ b/drivers/staging/greybus/gpio.c
@@ -41,8 +41,11 @@ struct gb_gpio_controller {
 	struct irq_chip		irqc;
 	struct mutex		irq_lock;
 };
-#define gpio_chip_to_gb_gpio_controller(chip) \
-	container_of(chip, struct gb_gpio_controller, chip)
+
+static inline struct gb_gpio_controller *gpio_chip_to_gb_gpio_controller(struct gpio_chip *chip)
+{
+	return container_of(chip, struct gb_gpio_controller, chip);
+}
 
 static struct gpio_chip *irq_data_to_gpio_chip(struct irq_data *d)
 {
-- 
2.25.1

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
