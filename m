Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id ECCDA9C05E5
	for <lists+greybus-dev@lfdr.de>; Thu,  7 Nov 2024 13:35:46 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id C80514252D
	for <lists+greybus-dev@lfdr.de>; Thu,  7 Nov 2024 12:35:45 +0000 (UTC)
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
	by lists.linaro.org (Postfix) with ESMTPS id 75D713F395
	for <greybus-dev@lists.linaro.org>; Thu,  7 Nov 2024 11:33:48 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b="KKBiUo/+";
	spf=pass (lists.linaro.org: domain of chenqiuji666@gmail.com designates 209.85.214.195 as permitted sender) smtp.mailfrom=chenqiuji666@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pl1-f195.google.com with SMTP id d9443c01a7336-20c70abba48so8773075ad.0
        for <greybus-dev@lists.linaro.org>; Thu, 07 Nov 2024 03:33:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730979227; x=1731584027; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BzEmUMxVFejxdU/rfXTVlEUY+fR/wUBvx47lSE477/Y=;
        b=KKBiUo/+RnJ/EOivyNb57y4XkP4OB25/aAzvVxyg6UazBNYyC+BzCQeucG44A3z0rT
         WzS7djBqAs3df9ZuJ6uF80Nl137Q4bavH/arihDD0dwDJ6y5tyfxRVlM9qVTISnwVqmj
         MdpjsZGrunsUWjauzbGbBN7+Xsx6qrLPU15VJP07+6dKGIUmAheMe4iSarIdDWR9DhWn
         DSEFTtKQCMxtiVbsASgfu8FIbvp5zO8vn/D1ohFv/8DpUh/R4IjBl0EgaAEphVzTz+f/
         WY9Bv+cz6cP2tAdP2I48TDTalCYGxU8L19wlXDdxL+/wL7zsqMwzJBekmos+nzrX0AcP
         ITEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730979227; x=1731584027;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BzEmUMxVFejxdU/rfXTVlEUY+fR/wUBvx47lSE477/Y=;
        b=Sm02VPX694eLNQ97mZU/3qby5tSGiPHBmoUCybT6Us0iuNes+030d55/j2DaqW+dEM
         MykdFDACdnEnFIPEbk3sbTlmKiUJvmXuHxvf+LIuL6dlAJ6Wyioj3zs/L9AuXL7Sgl1U
         Ph0EBT+qEckvTQgvLpdNQoILANw0q4Zbu4E2rdbFWbrkmo0PqnrTk3OesDOyaAw2pMSv
         0Yl+eZdZCu+lZvKfBWDVcKJXNnvJnGjHdU+0FPtdqiKwqxDtqzZXSFH/PyYqMzKI3JUE
         VJeW/961Q6hPIiyxUoI4z+RLPujzCtk/ylP8aG1yeylUHkZkmufwKzQBfl3nl+U7Hoks
         /HIg==
X-Gm-Message-State: AOJu0YzMHfEQzRNCmu4iOQzTmAjwtz+Sm35pO3jpHxS7Q0lXMsRTra7K
	4++95CF5NGJLIH3a3zzKjf5E41pxZG/xowEMoFbrshPP7BFv70LY
X-Google-Smtp-Source: AGHT+IHq+EF/3DgL31wNjq6ih0Ox4gUqipEMw2wqsuNioKyqFspXsDPknMqVgMaPN9uM1QnRfvNWWQ==
X-Received: by 2002:a17:902:e5c9:b0:20c:79f1:fee9 with SMTP id d9443c01a7336-2111af17177mr309869405ad.11.1730979227482;
        Thu, 07 Nov 2024 03:33:47 -0800 (PST)
Received: from tom-QiTianM540-A739.. ([106.39.42.118])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21177e77ad1sm9983565ad.261.2024.11.07.03.33.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2024 03:33:47 -0800 (PST)
From: Qiu-ji Chen <chenqiuji666@gmail.com>
To: dtwlin@gmail.com,
	johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org
Date: Thu,  7 Nov 2024 19:33:37 +0800
Message-Id: <20241107113337.402042-1-chenqiuji666@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Spamd-Result: default: False [1.90 / 15.00];
	RBL_SENDERSCORE_REPUT_1(3.50)[209.85.214.195:from];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.214.195:from];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,linuxfoundation.org];
	MIME_TRACE(0.00)[0:+];
	R_DKIM_ALLOW(0.00)[gmail.com:s=20230601];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[lists.linaro.org,lists.linux.dev,vger.kernel.org,gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[gmail.com,none];
	NEURAL_HAM(-0.00)[-0.996];
	R_SPF_ALLOW(0.00)[+ip4:209.85.128.0/17];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Spam-Level: *
X-Rspamd-Queue-Id: 75D713F395
X-Spamd-Bar: +
X-MailFrom: chenqiuji666@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: BU4RIQW5BSU6UATFHB5MVRULPCMMYRNF
X-Message-ID-Hash: BU4RIQW5BSU6UATFHB5MVRULPCMMYRNF
X-Mailman-Approved-At: Thu, 07 Nov 2024 12:35:41 +0000
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, baijiaju1990@gmail.com, Qiu-ji Chen <chenqiuji666@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v3] staging: greybus: uart: Fix atomicity violation in get_serial_info()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/BU4RIQW5BSU6UATFHB5MVRULPCMMYRNF/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Our static checker found a bug where set_serial_info() uses a mutex, but 
get_serial_info() does not. Fortunately, the impact of this is relatively 
minor. It doesn't cause a crash or any other serious issues. However, if a 
race condition occurs between set_serial_info() and get_serial_info(), 
there is a chance that the data returned by get_serial_info() will be 
meaningless.

Signed-off-by: Qiu-ji Chen <chenqiuji666@gmail.com>
Fixes: 0aad5ad563c8 ("greybus/uart: switch to ->[sg]et_serial()")
---
V2:
Modified the patch description to make it more concise and easier to understand.
Changed the fix code to ensure the logic is correct.
Thanks to Johan Hovold and Dan Carpenter for helpful suggestion.
V3:
Used the correct patch prefix.
Thanks Johan Hovold, Dan Carpenter, Alex Elder and Greg KH for helpful suggestion.
---
 drivers/staging/greybus/uart.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/staging/greybus/uart.c b/drivers/staging/greybus/uart.c
index cdf4ebb93b10..8eab94cb06fa 100644
--- a/drivers/staging/greybus/uart.c
+++ b/drivers/staging/greybus/uart.c
@@ -596,11 +596,13 @@ static int get_serial_info(struct tty_struct *tty,
 	struct gb_tty *gb_tty = tty->driver_data;
 
 	ss->line = gb_tty->minor;
+	mutex_lock(&gb_tty->port.mutex);
 	ss->close_delay = jiffies_to_msecs(gb_tty->port.close_delay) / 10;
 	ss->closing_wait =
 		gb_tty->port.closing_wait == ASYNC_CLOSING_WAIT_NONE ?
 		ASYNC_CLOSING_WAIT_NONE :
 		jiffies_to_msecs(gb_tty->port.closing_wait) / 10;
+	mutex_unlock(&gb_tty->port.mutex);
 
 	return 0;
 }
-- 
2.34.1

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
