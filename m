Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id B75ED671CE3
	for <lists+greybus-dev@lfdr.de>; Wed, 18 Jan 2023 14:05:00 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id C925E3F04D
	for <lists+greybus-dev@lfdr.de>; Wed, 18 Jan 2023 13:04:59 +0000 (UTC)
Received: from MTA-12-4.privateemail.com (mta-12-4.privateemail.com [198.54.127.107])
	by lists.linaro.org (Postfix) with ESMTPS id 8772A3E926
	for <greybus-dev@lists.linaro.org>; Tue, 17 Jan 2023 15:29:12 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=pappasbrent.com header.s=default header.b=bwEbeFA0;
	spf=pass (lists.linaro.org: domain of bpappas@pappasbrent.com designates 198.54.127.107 as permitted sender) smtp.mailfrom=bpappas@pappasbrent.com;
	dmarc=none
Received: from mta-12.privateemail.com (localhost [127.0.0.1])
	by mta-12.privateemail.com (Postfix) with ESMTP id 78BE018007B8;
	Tue, 17 Jan 2023 10:29:11 -0500 (EST)
Received: from bpappas-XPS-13-9310.ucf.edu (050-088-208-136.res.spectrum.com [50.88.208.136])
	by mta-12.privateemail.com (Postfix) with ESMTPA id 914EE18007B2;
	Tue, 17 Jan 2023 10:29:01 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=pappasbrent.com;
	s=default; t=1673969350;
	bh=DcuerZeOumw84rDdMN0oRM675FUBgF4UGDCfY2qoPwI=;
	h=From:To:Cc:Subject:Date:From;
	b=bwEbeFA0cowSHaIAvq/EZXnha1OvxObmQ5G00PLitt4WTMiv36bBVhb4xjIvU1Eqq
	 igZ3/dAkBJnIMnCiXfZGIpi8ITrqMQoDdI5xKvuWUSiZfpoWYYoP+TWc2V3/uHu4gO
	 XkzS21LJ8QW0xAH5oIBeQfh4A7Xx+nXkqcluH4MJGsLH7b0gDDAM1hCVkDpE3uUfgb
	 7e1zgPkz10cFqLXJ3//D0crOTF8TvKo6VcvKBuOf/ECVUSFQViz5WSdi9ULy4u4aHC
	 ycEpBrNjkyUT/RgxjTc8YkcmrNFJySRiw2r08gg9UXlUQp6Yd318rzfmXdhh/g0Ekw
	 +vnKBnkJIQcdg==
From: Brent Pappas <bpappas@pappasbrent.com>
To: rmfrfs@gmail.com
Date: Tue, 17 Jan 2023 10:28:57 -0500
Message-Id: <20230117152857.22141-1-bpappas@pappasbrent.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
X-Spamd-Result: default: False [-4.00 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	RCVD_DKIM_ARC_DNSWL_HI(-1.00)[];
	MID_CONTAINS_FROM(1.00)[];
	RCVD_IN_DNSWL_HI(-1.00)[50.88.208.136:received,198.54.127.107:from];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:198.54.127.96/27];
	R_DKIM_ALLOW(-0.20)[pappasbrent.com:s=default];
	MIME_GOOD(-0.10)[text/plain];
	ASN(0.00)[asn:22612, ipnet:198.54.127.0/24, country:US];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	DKIM_TRACE(0.00)[pappasbrent.com:+];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	DMARC_NA(0.00)[pappasbrent.com];
	RWL_MAILSPIKE_POSSIBLE(0.00)[198.54.127.107:from]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 8772A3E926
X-Spamd-Bar: ----
X-MailFrom: bpappas@pappasbrent.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: ARNLXVN47DEPAXGLQ5NGT7RKPN4QCYC5
X-Message-ID-Hash: ARNLXVN47DEPAXGLQ5NGT7RKPN4QCYC5
X-Mailman-Approved-At: Wed, 18 Jan 2023 13:04:43 +0000
CC: johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Brent Pappas <bpappas@pappasbrent.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v2] staging: greybus: gpio: Replace macro irq_data_to_gpio_chip with function
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/ARNLXVN47DEPAXGLQ5NGT7RKPN4QCYC5/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Replace the macro irq_data_to_gpio_chip with a static inline function to comply
with Linux coding style standards.

Signed-off-by: Brent Pappas <bpappas@pappasbrent.com>
---
Changelog:
V1 -> V2: Change return type of function from void * to struct gpio_chip *.
          Remove the inline keyword from the function definition.

 drivers/staging/greybus/gpio.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/gpio.c b/drivers/staging/greybus/gpio.c
index 8a7cf1d0e968..833162ceb385 100644
--- a/drivers/staging/greybus/gpio.c
+++ b/drivers/staging/greybus/gpio.c
@@ -43,7 +43,11 @@ struct gb_gpio_controller {
 };
 #define gpio_chip_to_gb_gpio_controller(chip) \
 	container_of(chip, struct gb_gpio_controller, chip)
-#define irq_data_to_gpio_chip(d) (d->domain->host_data)
+
+static struct gpio_chip *irq_data_to_gpio_chip(struct irq_data *d)
+{
+	return d->domain->host_data;
+}
 
 static int gb_gpio_line_count_operation(struct gb_gpio_controller *ggc)
 {
-- 
2.34.1

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
