Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id BD46AB1C565
	for <lists+greybus-dev@lfdr.de>; Wed,  6 Aug 2025 13:50:35 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 8725145D13
	for <lists+greybus-dev@lfdr.de>; Wed,  6 Aug 2025 11:50:33 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	by lists.linaro.org (Postfix) with ESMTPS id 7FA774419D
	for <greybus-dev@lists.linaro.org>; Wed,  6 Aug 2025 06:27:36 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=nH8uFtJ8;
	spf=pass (lists.linaro.org: domain of bleach1827@gmail.com designates 209.85.215.179 as permitted sender) smtp.mailfrom=bleach1827@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-af51596da56so3862566a12.0
        for <greybus-dev@lists.linaro.org>; Tue, 05 Aug 2025 23:27:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754461655; x=1755066455; darn=lists.linaro.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=v3VgAx1fS6I2c71PvMh+h8E4HzTPn+s88CNs629QlCA=;
        b=nH8uFtJ80zot7j6x2tR45Yv0dC3Xs5ELMf8PRYWq1HNGa084OavhgziwY0IiLie9+q
         5W3xYAWhNRYU5iIW+jz3NJUU81hbP0TbcUDIcDY5vG9FdIWCD2VN7aRi0ddaqHn6TUVb
         fOzaqcpuDS8+oQeysVNL2e2+xpF4kZE1kp49XuRXn3hYD4KAKa4tIyxVi86FrnWNcLiv
         xYXsOBOyhxtHLSxq7Q9a3CWOUZeRCIoTuJzq+ujprmvWHpai9ANSKwKv80plslCY3eqz
         fP8zF/jROwGwoFoELR17oxmjSbmubwdzu/MHJUZv0VWRFxef/1pfOfO1Z5bi6UAPV7EX
         DA0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754461655; x=1755066455;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v3VgAx1fS6I2c71PvMh+h8E4HzTPn+s88CNs629QlCA=;
        b=DDH3G8xiahwAfJaJ3K0VE1CtzuYWtIC1LsrdimGKoCKnR/6wt1K22Y66GkXKQ3mV9K
         DmPSp0clYzQrntS7P0Z+Wgx16B+QLMrsMhSQxRGAQA2qLzPqydFquHUxOLKd1pfk7JSj
         rGECy5xdqcJjhBxiA62G0in85n85P5EW1q2rMtgpjB0hgqGnbPrQrRILlALr78YKhhF3
         1NFji14iTY9Vfxy4TSAYM0M3X6Hj4jAUfccXCprFl9W77jUiRYNLIp6xYrfYyLe3RJK+
         Qf7dV3hsYzPU3DpFJ3iu2i3FV5kVaDJefTKCYG0thdq9VJX3i54X2BGYaQ2cYQl5YK4x
         K/xQ==
X-Gm-Message-State: AOJu0Yz6vISt0iRS46hGvqzJwOWt2FnK++KRLoATC5BeE0NX6mL079ok
	8ALrmbWwq0ostSj4HELhXh6eU0nrKizq+Z1hRuovZkfQGP1VOskMWRvo
X-Gm-Gg: ASbGnctyVD4cwIVT2Y3oOQfHpwLYrjj00K3q8kW7xg0tXp48XKlp5GqIer9egI2iJ0M
	+yrcJ2rD7yVjRlBrtBK/CuIqx330hHMKHeC7u8iBLHweVOHhuGquQTSnFKmLScQUz4Iv9stkNch
	zV17V7SJ0kFSL3g/VyHhFcF6SEyfpPGt9aVQ724xur/3JQqa1eitmJ02Q5OBQj6VQdYciUPeWin
	vTjEllfZMsIBs8rZOI1akvV6uaeoBu3SH5GvXIY4qF6G25DxECUVCCgx/tCLSIMNIvcmJyy5z0P
	0dypr+aO7jrEzgIMwXuTGkRQgqvPaB7Z5xAnf9nJjM5snvdLDNUSwBYHYtMCwJUwHJeIuFIPh5N
	6mMTH2HNrQuFTO+1WLo3/Zg==
X-Google-Smtp-Source: AGHT+IEpNrcd5b5s+6Lh0/TxzBSctjDMFTnSnsB9TlfDEOgYkwSscobfkMZxY34y1QWt3oSEck/+zw==
X-Received: by 2002:a17:903:b86:b0:242:9bbc:3645 with SMTP id d9443c01a7336-242a0bfe727mr15011065ad.55.1754461655477;
        Tue, 05 Aug 2025 23:27:35 -0700 (PDT)
Received: from localhost ([106.105.221.248])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-32102acbc56sm8223370a91.2.2025.08.05.23.27.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Aug 2025 23:27:35 -0700 (PDT)
From: Nai-Chen Cheng <bleach1827@gmail.com>
Date: Wed, 06 Aug 2025 14:27:11 +0800
MIME-Version: 1.0
Message-Id: <20250806-greybus-string-choices-v1-1-3e1c91048b62@gmail.com>
X-B4-Tracking: v=1; b=H4sIAL71kmgC/x3MQQ5AMBBA0avIrE1SFY24iljQjppNyQxCxN01l
 m/x/wNKwqTQFQ8Inay8poyqLMAvY4qEHLLBGtuY1jiMQvd0KOounCL6ZWVPiuRCUwdbt3Z0kON
 NaObrH/fD+34t4QiOaAAAAA==
To: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754461650; l=1226;
 i=bleach1827@gmail.com; s=20250730; h=from:subject:message-id;
 bh=ArxsUmBRLlbSgLLVtSCRW2TXy+NtPKUl63JAPtSukp4=;
 b=P45rsFVpVU9VMZHYEQEdptLJC7YPc2z7ZQPoW7edIi9BkJs4M4LOUBYu43c+mYI0vGXbDVG4z
 b0R0MX8eaniBGUB7JAcRFB+nCLiXQC6Wsaaw72giYI/Agx0YVHkLkxx
X-Developer-Key: i=bleach1827@gmail.com; a=ed25519;
 pk=jahFPRplw20Aaim8fIt8SxlFMqkHbJ+s8zYBGbtHH5g=
X-Spamd-Result: default: False [-4.10 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.215.179:from];
	MIME_GOOD(-0.10)[text/plain];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	MIME_TRACE(0.00)[0:+];
	URIBL_BLOCKED(0.00)[mail-pg1-f179.google.com:rdns,mail-pg1-f179.google.com:helo];
	TO_DN_SOME(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[lists.linaro.org,vger.kernel.org,linuxfoundation.org,lists.linux.dev,gmail.com];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	RCVD_COUNT_TWO(0.00)[2];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 7FA774419D
X-Spamd-Bar: ----
X-MailFrom: bleach1827@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: NGGSQQL2KROKI3ISQFQXARBT3I3VW4JJ
X-Message-ID-Hash: NGGSQQL2KROKI3ISQFQXARBT3I3VW4JJ
X-Mailman-Approved-At: Wed, 06 Aug 2025 11:50:29 +0000
CC: greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>, linux-kernel-mentees@lists.linux.dev, Nai-Chen Cheng <bleach1827@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] greybus: svc: use string choice helpers instead of ternary operator
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/NGGSQQL2KROKI3ISQFQXARBT3I3VW4JJ/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Replace ternary operator with str_enabled_disabled() helper to improve
code readability and consistency.

Generated using Coccinelle semantic patch.

Signed-off-by: Nai-Chen Cheng <bleach1827@gmail.com>
---
 drivers/greybus/svc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/greybus/svc.c b/drivers/greybus/svc.c
index 4256467fcd35..35ea7147dca6 100644
--- a/drivers/greybus/svc.c
+++ b/drivers/greybus/svc.c
@@ -10,6 +10,7 @@
 #include <linux/kstrtox.h>
 #include <linux/workqueue.h>
 #include <linux/greybus.h>
+#include <linux/string_choices.h>
 
 #define SVC_INTF_EJECT_TIMEOUT		9000
 #define SVC_INTF_ACTIVATE_TIMEOUT	6000
@@ -73,7 +74,7 @@ static ssize_t watchdog_show(struct device *dev, struct device_attribute *attr,
 	struct gb_svc *svc = to_gb_svc(dev);
 
 	return sprintf(buf, "%s\n",
-		       gb_svc_watchdog_enabled(svc) ? "enabled" : "disabled");
+		       str_enabled_disabled(gb_svc_watchdog_enabled(svc)));
 }
 
 static ssize_t watchdog_store(struct device *dev,

---
base-commit: 7881cd6886a89eda848192d3f5759ce08672e084
change-id: 20250806-greybus-string-choices-e6d53d2382a6

Best regards,
-- 
Nai-Chen Cheng <bleach1827@gmail.com>

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
