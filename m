Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YJe1NF1og2kbmgMAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Wed, 04 Feb 2026 16:40:13 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 60D24E9161
	for <lists+greybus-dev@lfdr.de>; Wed, 04 Feb 2026 16:40:13 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 369CD3F833
	for <lists+greybus-dev@lfdr.de>; Wed,  4 Feb 2026 15:40:12 +0000 (UTC)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	by lists.linaro.org (Postfix) with ESMTPS id 4230B3F799
	for <greybus-dev@lists.linaro.org>; Wed,  4 Feb 2026 04:38:18 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b="hgfZ5om/";
	spf=pass (lists.linaro.org: domain of neelb2403@gmail.com designates 209.85.222.171 as permitted sender) smtp.mailfrom=neelb2403@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-8c533228383so404296485a.3
        for <greybus-dev@lists.linaro.org>; Tue, 03 Feb 2026 20:38:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770179897; x=1770784697; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bGCt1oGCWGLX++wb2sUIXR3s0HE/K4T4ZaU5gwWu3Ys=;
        b=hgfZ5om/0eB2aW6lFRsg1Hi9lirYEUpLHDCKCmHYQpLyUbWo+uBzD9zkDcNq7Gqr/j
         UOXMSvNuIqEhAhvvpc7AALUms4bBFM5xYPZ0RXTQQSw1Z08mjDAnl/G7CQqd1rW1anVl
         Xi0cOh3X8+XQanWyv/MaumNPni6H/sZLlEbyrr5Ykd8tCjRG1qkJa0XLw1v1gw+j/uww
         v3vyCVL2NaezXylrSsQwlEYMzV6PY/BVYaynvFgjWO0m11CpgWn84AIV9T/i7TalIsSf
         KDXEzKKsnsGPg0Ll39mVue0gwmKS9k2OGRjg8ehUfC+YY+9Milxv+U1TaRDG4GSKN98A
         CfFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770179897; x=1770784697;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bGCt1oGCWGLX++wb2sUIXR3s0HE/K4T4ZaU5gwWu3Ys=;
        b=hklv9VRjvre5iBfkk/QL1xrtge1bagVWgQnVmyoKSmq0ArlplMOxAGZ/cFlXTY6uyc
         DE8EW3pe3f9Hz3CII1KpoXCP7eLICGILp9QPsImflgHf8LA6sVvAaTQjuXBkYbyXr2xP
         DgFSwO70p2vYbKWcw6KZDn+ZeCUSz8cW9uuyJDslLPkd/j7HnIaL90fLZXpTx97djWHh
         FmYeUzcSIIe+n3AgKWNHNpnx9VIATF1Wy7x/U1PglhpzCFQJkwKajZvKJNuI7VwUY45U
         rkae1i3CBXMSd78cAZQjHUE1LJKbCgUj61TFsXfcIz1nxeabr5utlGCZow6CBGL+Btrs
         ONrg==
X-Forwarded-Encrypted: i=1; AJvYcCV2eqiFob6pOox4M0Rju2kZ98FBm3LViQl75v4wGpN/HctNjHu4760uWDNYgGg3IWCugG9C0+JKmpIrQA==@lists.linaro.org
X-Gm-Message-State: AOJu0YwDSBMDiyk5u8hZVGj94lBPhtjX+3hB+vbQagDQD+6wm+cVhsCW
	LsMW8lu6jLUbOe3OFxAyyquBiJr1n8AzUAsPOzjP2t4h38XFLfvr8SpQ
X-Gm-Gg: AZuq6aJSIh0ZgWHqN97qd9wgEmiBjyVslfs3aNxFDmwbUTkzcmBuDoZKxLzR+prNYYs
	yS66oYptuwCUXGLhkR7UnVqkaoyYXsg8z0S+1Q/Jfq0GCfiVbe9CtL9wAPKU9BE+reKuCQ7mBqj
	UDZioCh2z5k8zahC7pOBRHFTMAGujdoeR/GuTOpMD7PoLHJMLVBW3KYkKwvrYorMRFf4819ktUy
	uFICu37n6uZ1c92NMtgvdDWo6A2rGmDTTUxeF9Y4yMd5049ebjVYlcC434LjynbxvcSdm+vBwhB
	wIEC+X2PWWR/dDlFoBIZnXVgZFb+REVPXoh5NsWeJr5YddIVTEAYzVpPPUUOdTkg1ZWsqzqjikZ
	6mCqiI4IzoIfaJMJR0dXZK8jYnlrJ9K91shT/hSK/AWCixhgvAkoxxKRw6vI8oRwnqncqkv3R6i
	q7qFhFiT2ABCL/bw==
X-Received: by 2002:a05:620a:1728:b0:8b2:e51d:610d with SMTP id af79cd13be357-8ca2f84c6a1mr227680685a.32.1770179897451;
        Tue, 03 Feb 2026 20:38:17 -0800 (PST)
Received: from Mac.home ([76.64.58.244])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8ca2fa81908sm110036485a.19.2026.02.03.20.38.15
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 03 Feb 2026 20:38:17 -0800 (PST)
From: Neel Bullywon <neelb2403@gmail.com>
To: David Lin <dtwlin@gmail.com>
Date: Tue,  3 Feb 2026 23:38:02 -0500
Message-ID: <20260204043802.65430-1-neelb2403@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Spamd-Bar: --
X-MailFrom: neelb2403@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: LLRVXZAVTGIGI5D2VUA4CJTJNZQIC7AI
X-Message-ID-Hash: LLRVXZAVTGIGI5D2VUA4CJTJNZQIC7AI
X-Mailman-Approved-At: Wed, 04 Feb 2026 15:40:09 +0000
CC: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Neel Bullywon <neelb2403@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] staging: greybus: uart: migrated from IDR to XArray API
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/LLRVXZAVTGIGI5D2VUA4CJTJNZQIC7AI/>
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
	R_SPF_ALLOW(-0.20)[+mx];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,lists.linaro.org,lists.linux.dev,vger.kernel.org,gmail.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-0.996];
	FROM_NEQ_ENVFROM(0.00)[neelb2403@gmail.com,greybus-dev-bounces@lists.linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,lists.linaro.org:helo,lists.linaro.org:rdns]
X-Rspamd-Queue-Id: 60D24E9161
X-Rspamd-Action: no action

Replaced the IDR API with the XArray API for managing TTY minor numbers.
This addresses the checkpatch warning about DEFINE_IDR being deprecated.

Following changes include:
- Replaced DEFINE_IDR with DEFINE_XARRAY_ALLOC
- Replace idr_find with xa_load
- Replace idr_alloc with xa_alloc
- Replace idr_remove with xa_erase
- Replace idr_destroy with xa_destroy
- Updated the include to use xarray

No core functional changes, just modernized the code to a new API.

Signed-off-by: Neel Bullywon <neelb2403@gmail.com>
---
 drivers/staging/greybus/uart.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/greybus/uart.c b/drivers/staging/greybus/uart.c
index 5cece0a6606f..8bd6bf0a57a8 100644
--- a/drivers/staging/greybus/uart.c
+++ b/drivers/staging/greybus/uart.c
@@ -22,7 +22,7 @@
 #include <linux/serial.h>
 #include <linux/tty_driver.h>
 #include <linux/tty_flip.h>
-#include <linux/idr.h>
+#include <linux/xarray.h>
 #include <linux/fs.h>
 #include <linux/kdev_t.h>
 #include <linux/kfifo.h>
@@ -67,7 +67,7 @@ struct gb_tty {
 };
 
 static struct tty_driver *gb_tty_driver;
-static DEFINE_IDR(tty_minors);
+static DEFINE_XARRAY_ALLOC(tty_minors);
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
@@ -362,7 +362,7 @@ static int alloc_minor(struct gb_tty *gb_tty)
 	int minor;
 
 	mutex_lock(&table_lock);
-	minor = idr_alloc(&tty_minors, gb_tty, 0, GB_NUM_MINORS, GFP_KERNEL);
+	minor = xa_alloc(&tty_minors, &minor, gb_tty, XA_LIMIT(0, GB_NUM_MINORS - 1), GFP_KERNEL);
 	mutex_unlock(&table_lock);
 	if (minor >= 0)
 		gb_tty->minor = minor;
@@ -375,7 +375,7 @@ static void release_minor(struct gb_tty *gb_tty)
 
 	gb_tty->minor = 0;	/* Maybe should use an invalid value instead */
 	mutex_lock(&table_lock);
-	idr_remove(&tty_minors, minor);
+	xa_erase(&tty_minors, minor);
 	mutex_unlock(&table_lock);
 }
 
@@ -984,7 +984,7 @@ static void gb_tty_exit(void)
 {
 	tty_unregister_driver(gb_tty_driver);
 	tty_driver_kref_put(gb_tty_driver);
-	idr_destroy(&tty_minors);
+	xa_destroy(&tty_minors);
 }
 
 static const struct gbphy_device_id gb_uart_id_table[] = {
-- 
2.44.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
