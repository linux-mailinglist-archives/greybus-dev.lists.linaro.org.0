Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uF+FJkNFn2m5ZgQAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Wed, 25 Feb 2026 19:53:55 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 3857719C794
	for <lists+greybus-dev@lfdr.de>; Wed, 25 Feb 2026 19:53:55 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 4A80C402B2
	for <lists+greybus-dev@lfdr.de>; Wed, 25 Feb 2026 18:53:54 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	by lists.linaro.org (Postfix) with ESMTPS id E08C13ED23
	for <greybus-dev@lists.linaro.org>; Wed, 25 Feb 2026 18:40:46 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=b0PhUCK7;
	spf=pass (lists.linaro.org: domain of chakrabortyshubham66@gmail.com designates 209.85.210.178 as permitted sender) smtp.mailfrom=chakrabortyshubham66@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8249aca0affso30172b3a.3
        for <greybus-dev@lists.linaro.org>; Wed, 25 Feb 2026 10:40:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772044846; x=1772649646; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wKtDVfmPVgPIEBZ9rN4VgM/NHjO9Hae2x87Y+mFQu+Q=;
        b=b0PhUCK79U5MDWnU/SbJemCWfm/jO52YCFZ+us8wIvCLxZKLDy8jFoD5U4qsOVBmvF
         BjQWv0x/aCDZ/P5lL2h9Z8l69BHMZ43FlLepqytfZhSQxgiWYlJft15K1XTMIZPartMh
         hdpmV8sB5SRe+TZEoH/wSOPbPWQRNxiqV1AQyx+vaXyrxLa6juc8KFvJwH2ekHvOBRCI
         +2UEaMFlAh5KhYB7nGAv6skzDoLfHP5BuX/S3KLcnKHi+pvK1sejGkqTxcyifBhHhpw9
         DGlbnvNFCvk9aQJA7O1nY3TAaU2mWBCyROB6SHcMyaIpqXz0zVEN2tadd1u5L21bo8cp
         GBMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772044846; x=1772649646;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wKtDVfmPVgPIEBZ9rN4VgM/NHjO9Hae2x87Y+mFQu+Q=;
        b=SjLs55dL3k2JasJdC18XfaGxeSL851Rm+rqu1iJF3e+ni5wMGNj072A8I0KjhgY+NH
         onfIh6j87CbDHsjgqBmVWAi+LqGyVQSi8vvmhHM1M3pJ+5SCZHiyXT+hGCBcfyzWjdmx
         Abn6BFQgT5P5zzPOTxky2jp71LPGLreukVR+JO4HxfX3cviqSE0l5dBJiD0brD/Njr5m
         riy/HSgknE/1nQZBr0wJ6wGXa1Q2dtP+t0ggArKPUhUz+mpAzi7TBchzsSLWlyTktudP
         ThwpKwiydpUWoLVu8WHpTMXtpTMgDYO56EttxEYP05iwmB9IaOsqN0F8wiLlzgqvXM3C
         47vQ==
X-Gm-Message-State: AOJu0Yxtn3zbF8cE2OtDGPMfjIJvUgsogwZ+NL2OUW8cvZV7oz4gJrhS
	D4XRg9/ekp/n/aX6YMwo621PAkRwQOjYC6a+wb/nExa762fmHsnWot1G
X-Gm-Gg: ATEYQzx0s6L6u2nSsdfRKRSkmimRWYsN9UniieG1zJz6zNO6IG9f7YFt6lHitxpaX37
	GiZ7Fia7f3InaIyHgEDSLQyrA/K0xrH5SgnNLX2eN+bMfnPLLenPOF+/B1b4W6oVEyTOqSit/Tc
	muUfwmopOlGyGFGc35SqCaYbTlDZ49miY8SlTpfs0oyzfKmDhVtYGxVIToygEw7a44sKoVw/R+3
	udrFWfCMZ+xIE0Ac49UPEwnYXngX3jPNpsjo3VMsTo7+3GXqtYvchQb3kfMcmUxbAu3zem0XqXu
	r251aSxKCzVbYenKGX/5CHP69TruW0dTlz5AsGEVNoJEwx+/MJAr1Gc4yWTLcqHDXR4Dsb6TZlM
	e7zL1ugBNElm7ERW0ywoGx/Y4DoSMOoiC2yTrbUwz8MSZMhk/8QpbRwhkgsBH+HoEf0TtxPJNe3
	hmo6xwx1wt0wQw3Q1MBrgbSEqZUZLyPFb0T0s=
X-Received: by 2002:a05:6a21:610c:b0:395:151c:4ed5 with SMTP id adf61e73a8af0-395ad1ad008mr1109867637.37.1772044845950;
        Wed, 25 Feb 2026 10:40:45 -0800 (PST)
Received: from fedora ([2409:40e5:105a:d068:a95a:8654:94eb:1089])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c70b724321esm14010380a12.16.2026.02.25.10.40.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 10:40:45 -0800 (PST)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: David Lin <dtwlin@gmail.com>,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Thu, 26 Feb 2026 00:08:36 +0530
Message-ID: <20260225183836.20434-2-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260225183836.20434-1-chakrabortyshubham66@gmail.com>
References: <20260225183836.20434-1-chakrabortyshubham66@gmail.com>
MIME-Version: 1.0
X-Spamd-Bar: --
X-MailFrom: chakrabortyshubham66@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: GJCEJLB3XWZHBVYDRQG4JIPLAPLR7QZB
X-Message-ID-Hash: GJCEJLB3XWZHBVYDRQG4JIPLAPLR7QZB
X-Mailman-Approved-At: Wed, 25 Feb 2026 18:53:38 +0000
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Shubham Chakraborty <chakrabortyshubham66@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH 2/2] staging: greybus: uart: convert to XArray
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/GJCEJLB3XWZHBVYDRQG4JIPLAPLR7QZB/>
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
	R_SPF_ALLOW(-0.20)[+mx:c];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,linuxfoundation.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[lists.linaro.org,lists.linux.dev,vger.kernel.org,gmail.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-0.998];
	FROM_NEQ_ENVFROM(0.00)[chakrabortyshubham66@gmail.com,greybus-dev-bounces@lists.linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,lists.linaro.org:helo,lists.linaro.org:rdns]
X-Rspamd-Queue-Id: 3857719C794
X-Rspamd-Action: no action

Replace the deprecated IDR API with the more modern XArray API.
This simplifies the code and improves efficiency.

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
---
 drivers/staging/greybus/uart.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/greybus/uart.c b/drivers/staging/greybus/uart.c
index 1d2c4ef70865..fe554eba555a 100644
--- a/drivers/staging/greybus/uart.c
+++ b/drivers/staging/greybus/uart.c
@@ -67,7 +67,7 @@ struct gb_tty {
 };
 
 static struct tty_driver *gb_tty_driver;
-static DEFINE_IDR(tty_minors);
+static DEFINE_XARRAY(tty_minors);
 static DEFINE_MUTEX(table_lock);
 
 static int gb_uart_receive_data_handler(struct gb_operation *op)
@@ -342,7 +342,7 @@ static struct gb_tty *get_gb_by_minor(unsigned int minor)
 	struct gb_tty *gb_tty;
 
 	mutex_lock(&table_lock);
-	gb_tty = idr_find(&tty_minors, minor);
+	gb_tty = xa_load(&tty_minors, minor);
 	if (gb_tty) {
 		mutex_lock(&gb_tty->mutex);
 		if (gb_tty->disconnected) {
@@ -359,14 +359,18 @@ static struct gb_tty *get_gb_by_minor(unsigned int minor)
 
 static int alloc_minor(struct gb_tty *gb_tty)
 {
-	int minor;
+	u32 minor;
+	int ret;
 
 	mutex_lock(&table_lock);
-	minor = idr_alloc(&tty_minors, gb_tty, 0, GB_NUM_MINORS, GFP_KERNEL);
+	ret = xa_alloc(&tty_minors, &minor, gb_tty,
+		       XA_LIMIT(0, GB_NUM_MINORS - 1), GFP_KERNEL);
 	mutex_unlock(&table_lock);
-	if (minor >= 0)
+	if (ret >= 0) {
 		gb_tty->minor = minor;
-	return minor;
+		return minor;
+	}
+	return ret;
 }
 
 static void release_minor(struct gb_tty *gb_tty)
@@ -375,7 +379,7 @@ static void release_minor(struct gb_tty *gb_tty)
 
 	gb_tty->minor = 0;	/* Maybe should use an invalid value instead */
 	mutex_lock(&table_lock);
-	idr_remove(&tty_minors, minor);
+	xa_erase(&tty_minors, minor);
 	mutex_unlock(&table_lock);
 }
 
@@ -984,7 +988,7 @@ static void gb_tty_exit(void)
 {
 	tty_unregister_driver(gb_tty_driver);
 	tty_driver_kref_put(gb_tty_driver);
-	idr_destroy(&tty_minors);
+	xa_destroy(&tty_minors);
 }
 
 static const struct gbphy_device_id gb_uart_id_table[] = {
-- 
2.53.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
