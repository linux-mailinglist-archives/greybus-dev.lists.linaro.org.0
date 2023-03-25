Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id B75316C96B2
	for <lists+greybus-dev@lfdr.de>; Sun, 26 Mar 2023 18:10:20 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 735423E94D
	for <lists+greybus-dev@lfdr.de>; Sun, 26 Mar 2023 16:10:19 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	by lists.linaro.org (Postfix) with ESMTPS id 095503E948
	for <greybus-dev@lists.linaro.org>; Sat, 25 Mar 2023 08:24:39 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20210112 header.b=iF1D1M7z;
	spf=pass (lists.linaro.org: domain of sumitraartsy@gmail.com designates 209.85.215.169 as permitted sender) smtp.mailfrom=sumitraartsy@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pg1-f169.google.com with SMTP id h14so2388284pgj.7
        for <greybus-dev@lists.linaro.org>; Sat, 25 Mar 2023 01:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679732678;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OjcZplfqBfGxkesm/SQ2YHNMoUVOYWANADhv4EwbVKw=;
        b=iF1D1M7zPujubqAFaRoDsv44WF0fxsPh+P1yv7HPgWO600k7bQcVwJItb47E8USlzk
         pYfsPnJnn3d6sP7fi1fCK0iq6Yc9kQ3G4ypBs1DFbbEi5636oGrpjAlOqks8pTPvTYLE
         cwm3g/Z3XR8D4Feg/FzDiLb2vbZJuAs46S7RNgEyLopWutdgZN4lglRLg6GNkedsMfAR
         P7DYXcUlJTvoKnqlR28y3wH2OvWMHXidjielmmScmUrE8hFPEaH/myZ/2VH8/Aac3rHA
         wzWJBceIfhB7aMPBDqHz1kerasDENE59y8fbjamk6mxhe/41eeHSbjLcrDhSWRSVUtss
         AHqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679732678;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OjcZplfqBfGxkesm/SQ2YHNMoUVOYWANADhv4EwbVKw=;
        b=SPN318ycFSRjbChW+MR4fvP/8JEziu1RM5lPaZByw94WimZgUJziOTC2eVKYtogQ4T
         8YNhq2qpihudSmqHCNIUo1hqleTg8Z8QBKtEFmGZG6qYBu9MzacSAdLrVRtuSbmNlVb3
         b3xsm6xImln/ZoQ+3qtSH+X5EsVZY+lEXVSzwUdfDqxD1pWcerEAF+YEPBh593RGc4iC
         ED9YYUXe/RdS2AIHmbG2LnRsqz5OFtzFg+3+OtnIPm/C9G+YvODSiUmlWZ5FWBckxmWW
         1jXwamoldW5yPrG37zzWzo/RzT5m1ardo/pQI7iBpCcsDrgLm0FD5QnfvXeb7YgViqud
         5Q0w==
X-Gm-Message-State: AAQBX9c03TnmBm5K6GduMlls6CEY5Druwa2uFVGX02PMZ78GpvC6WNdN
	fTLzMhDwAAGpayAqD828ktQ=
X-Google-Smtp-Source: AKy350ZItOW1IWkO8vnKb6jMklJtdNUq0/uX+sYlMWXFYhAR5g+UBO/yaUHVPBtBrs8nlxqvT3t/ZQ==
X-Received: by 2002:aa7:954a:0:b0:625:cb74:9e01 with SMTP id w10-20020aa7954a000000b00625cb749e01mr5601184pfq.25.1679732678056;
        Sat, 25 Mar 2023 01:24:38 -0700 (PDT)
Received: from ubuntu.localdomain ([117.245.251.101])
        by smtp.gmail.com with ESMTPSA id b5-20020aa78105000000b005938f5b7231sm15035875pfi.201.2023.03.25.01.24.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Mar 2023 01:24:37 -0700 (PDT)
From: Sumitra Sharma <sumitraartsy@gmail.com>
To: outreachy@lists.linux.dev
Date: Sat, 25 Mar 2023 01:23:33 -0700
Message-Id: <3fc5d84a99574ac4a76d26427ac544de375adeb4.1679732179.git.sumitraartsy@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1679732179.git.sumitraartsy@gmail.com>
References: <cover.1679732179.git.sumitraartsy@gmail.com>
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 095503E948
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.60 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20210112];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.215.169:from];
	MIME_GOOD(-0.10)[text/plain];
	FROM_EQ_ENVFROM(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	FREEMAIL_CC(0.00)[kernel.org,linuxfoundation.org,lists.linaro.org,lists.linux.dev,vger.kernel.org,gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_TWO(0.00)[2]
X-MailFrom: sumitraartsy@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: NTBVUGDBLOKBL4D2WJJGMG737K7U73I4
X-Message-ID-Hash: NTBVUGDBLOKBL4D2WJJGMG737K7U73I4
X-Mailman-Approved-At: Sun, 26 Mar 2023 16:09:33 +0000
CC: johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Sumitra Sharma <sumitraartsy@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v3 1/3] staging: greybus: Inline gpio_chip_to_gb_gpio_controller()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/NTBVUGDBLOKBL4D2WJJGMG737K7U73I4/>
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
