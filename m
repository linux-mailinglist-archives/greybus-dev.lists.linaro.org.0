Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A6E671CE1
	for <lists+greybus-dev@lfdr.de>; Wed, 18 Jan 2023 14:04:50 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 14EDD3F072
	for <lists+greybus-dev@lfdr.de>; Wed, 18 Jan 2023 13:04:49 +0000 (UTC)
Received: from MTA-11-3.privateemail.com (mta-11-3.privateemail.com [198.54.122.105])
	by lists.linaro.org (Postfix) with ESMTPS id A322A3EF35
	for <greybus-dev@lists.linaro.org>; Mon, 16 Jan 2023 18:48:02 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=pappasbrent.com header.s=default header.b=Bl1SddMe;
	spf=pass (lists.linaro.org: domain of bpappas@pappasbrent.com designates 198.54.122.105 as permitted sender) smtp.mailfrom=bpappas@pappasbrent.com;
	dmarc=none
Received: from mta-11.privateemail.com (localhost [127.0.0.1])
	by mta-11.privateemail.com (Postfix) with ESMTP id AA24918000A5;
	Mon, 16 Jan 2023 13:48:01 -0500 (EST)
Received: from bpappas-XPS-13-9310.ucf.edu (050-088-208-136.res.spectrum.com [50.88.208.136])
	by mta-11.privateemail.com (Postfix) with ESMTPA id 4905418000AA;
	Mon, 16 Jan 2023 13:47:52 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=pappasbrent.com;
	s=default; t=1673894881;
	bh=7eZ35sq7vCUVk3hra9JJfEa8RywzMOV09hPbJgGfvUU=;
	h=From:To:Cc:Subject:Date:From;
	b=Bl1SddMe0MQndGSlzT/1qEvDmy8b2bDbFoRZIITe/g8u3rsWRJKgiuSqnUpIHmCmM
	 LYhvh+0Hn+IBx2jy1ZdBxNl3tC5Fz3Me63rP9J5OkmHytR7E3BhJWEdQ6E/JMfgf92
	 B9H5xbSs5XEK3GRzRZdUHJoqGMG9Lza9pRsI/fXb0sEXzA5t408mK5gSiCMjhwixAZ
	 1oKup3SFLrua+sSGvJ1bgehrwYJqjaM96+MfOsUSWq7Znf1P+fXmiT1AnBq9SjlGeW
	 NzI7F7JtxzznJ7aFeoVKsp8QbCWzQJbRQVbHpTWCuKBoLfX28T6lAvSBQIzgtmvqxt
	 IUBrcJ2cVMWXg==
From: Brent Pappas <bpappas@pappasbrent.com>
To: rmfrfs@gmail.com
Date: Mon, 16 Jan 2023 13:47:06 -0500
Message-Id: <20230116184707.22302-1-bpappas@pappasbrent.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
X-Spamd-Result: default: False [-4.00 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	RCVD_DKIM_ARC_DNSWL_HI(-1.00)[];
	MID_CONTAINS_FROM(1.00)[];
	RCVD_IN_DNSWL_HI(-1.00)[198.54.122.105:from,50.88.208.136:received];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:198.54.122.96/27];
	R_DKIM_ALLOW(-0.20)[pappasbrent.com:s=default];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_TO(0.00)[gmail.com];
	ASN(0.00)[asn:22612, ipnet:198.54.122.0/24, country:US];
	RCVD_TLS_LAST(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[MTA-11-3.privateemail.com:helo,mta-11-3.privateemail.com:rdns];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[pappasbrent.com:+];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	DMARC_NA(0.00)[pappasbrent.com];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[198.54.122.105:from]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: A322A3EF35
X-Spamd-Bar: ----
X-MailFrom: bpappas@pappasbrent.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: L4H6MUF23AD3S7S7KY5AQL4WLDHAHCPI
X-Message-ID-Hash: L4H6MUF23AD3S7S7KY5AQL4WLDHAHCPI
X-Mailman-Approved-At: Wed, 18 Jan 2023 13:04:43 +0000
CC: johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Brent Pappas <bpappas@pappasbrent.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] staging: greybus: gpio: Replace macro irq_data_to_gpio_chip with function
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/L4H6MUF23AD3S7S7KY5AQL4WLDHAHCPI/>
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
+static inline void *irq_data_to_gpio_chip(struct irq_data *d)
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
