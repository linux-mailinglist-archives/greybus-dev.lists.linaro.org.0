Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UBsxOx5kumklWAIAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Wed, 18 Mar 2026 09:36:46 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id B57CF2B8280
	for <lists+greybus-dev@lfdr.de>; Wed, 18 Mar 2026 09:36:46 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id CD2B0401F6
	for <lists+greybus-dev@lfdr.de>; Wed, 18 Mar 2026 08:36:45 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	by lists.linaro.org (Postfix) with ESMTPS id 6492A3F834
	for <greybus-dev@lists.linaro.org>; Tue, 17 Mar 2026 21:17:14 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=cuqzA9cf;
	spf=pass (lists.linaro.org: domain of rayfraytech@gmail.com designates 209.85.208.176 as permitted sender) smtp.mailfrom=rayfraytech@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-38a3990e87fso42945011fa.3
        for <greybus-dev@lists.linaro.org>; Tue, 17 Mar 2026 14:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773782233; x=1774387033; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=k0fyMktyhZQ4/nntQbVatF5P/jsJ0+yYs8f8wPeGzK8=;
        b=cuqzA9cfXar83h0Mem3wE4ySugNy3YVfsbA5yfpEW3hSKoj4wBZHqmdw7/as8BQv6R
         gG1FRny03rX2nMus2ceXDlIXk+pWtiLN/js2pq0L9a5YYn34Vc7wHI4b50bvkQka4cSL
         k7S4g8Ef30bkuAC0ApbDpycCbIpYbKr2riBqNa3QIlDgoGQmJGtVi1zwaaAgVgPPWCn9
         wwmziy46rVQsgBYDAuaWUmYGQ3MovOEdYFgvFAelpaEM3zR63ndb2C0QmS/gRf+oCwpb
         7GpPi5JAa+gQrmO74SlWismSN7KTw3TTxlnuAc6EpWTw7vMSe++npSOkwSF7Itt4aKot
         3nkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773782233; x=1774387033;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k0fyMktyhZQ4/nntQbVatF5P/jsJ0+yYs8f8wPeGzK8=;
        b=swiGqgrzoBebDCzPaMahGuoBIzDuJjDOnmmLYCH9GLJRozYtawke2yvCAzQqvewZdU
         pGjH3blyk4sbqHSUnC9Ri2e5Wphglr1xy/VzQj3emUi2TLjCatyxIR1hdxlJ6SfXriVK
         RF6imnjKRfJS1Vh4U3lAv0PK1T35Al4GzphfiotCQgi5bC+3PY36SEmJ86DDqi6nKIgC
         TVdnNFDIgQ2k1WJ7D5BBQUsQHkZkhWb9puTjjnU9rK549oNy+nmxdPGtQXczZfPI3mv/
         Y0uwnRMuVoGAi+sUOw/Qx7GeYGq4X7GafWnEUOmd1wLoUasaNcCp3cADuYEmNM28H6R6
         RrsA==
X-Forwarded-Encrypted: i=1; AJvYcCUizGiBPBTspdG2rDa2zjTn3HmbdlROzdrI5f3JYTm2Eol6oJRQRxTp+eAHNcNLEvDHZ5K3XtNOo1XTpQ==@lists.linaro.org
X-Gm-Message-State: AOJu0Yx+7e4CkODmPrOyP1zsKI/stC2kA09CEvirOHLPdxa/HJGPQOuf
	q9dxp6Nblmq5HpkZ4YWl7UYgbDH+ruRnLQDZwQ05evidebtfYlscKMtr
X-Gm-Gg: ATEYQzwC+DxFCLZqhb6gFWcJHj9vJn5EbK/BitgNryFE/GBsHvVh3muN1Em+ssZ17cv
	K73VEHXc3t2xPEqwlEBsQKNpCICIvkdnditBCOIhZCJcGLE+rAIvRRmJc9LFWn9yk/QHKZcTsT9
	9FNeRj9v9sH8ALfmdmCzFkBsa5jcCmR/qM4a0uAH7nE9tihmUKkaMafNoMkM5MnWCve8mouYd6a
	psEa7x5tGNTHaaTQWmbReejVRolOYlF9R5HxhtFy1p3ohiuY9OTz1qdalPI1KiIdtjXk3kseyPJ
	DWxYZNmgOiBOiKgaexBoG1IxjXxBZK3S2/yvKaMkofUtUT6w7TJFLNnOaaIyUmJF2Q10l5s7F/W
	7DX9tyQuIeqJcvcQ4tsklWAboVtbUjhNgp9F9gLNJt+aZYZUV7yYzhkq9AtHo+dMs6ZBjtBJK9F
	vd7cJEzUx4ErFODj6/U2N1GXsh2UDrb5638uh3T7iGldNJKcwPI3IEV/9ed5wWs9s2SIhOOLC36
	Q==
X-Received: by 2002:a2e:3218:0:b0:38a:4197:862c with SMTP id 38308e7fff4ca-38bd57ed443mr3342951fa.9.1773782232850;
        Tue, 17 Mar 2026 14:17:12 -0700 (PDT)
Received: from T6NXCV08J99224A.lan (81-237-238-191-no600.tbcn.telia.com. [81.237.238.191])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38bd54bc645sm1716991fa.30.2026.03.17.14.17.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 14:17:11 -0700 (PDT)
From: Oskar Ray-Frayssinet <rayfraytech@gmail.com>
To: dtwlin@gmail.com
Date: Tue, 17 Mar 2026 22:16:51 +0100
Message-ID: <20260317211651.8098-1-rayfraytech@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Spamd-Bar: --
X-MailFrom: rayfraytech@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: XURINS6VJ3WMZYWRTJG2JJPPIWC5BD2T
X-Message-ID-Hash: XURINS6VJ3WMZYWRTJG2JJPPIWC5BD2T
X-Mailman-Approved-At: Wed, 18 Mar 2026 08:36:40 +0000
CC: johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Oskar Ray-Frayssinet <rayfraytech@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] staging: greybus: replace DEFINE_IDR with DEFINE_XARRAY_ALLOC in uart.c
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/XURINS6VJ3WMZYWRTJG2JJPPIWC5BD2T/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
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
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,lists.linaro.org,lists.linux.dev,vger.kernel.org,gmail.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-0.978];
	FROM_NEQ_ENVFROM(0.00)[rayfraytech@gmail.com,greybus-dev-bounces@lists.linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,lists.linaro.org:helo,lists.linaro.org:rdns]
X-Rspamd-Queue-Id: B57CF2B8280
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Replace deprecated DEFINE_IDR and idr_* functions with the modern
DEFINE_XARRAY_ALLOC and xa_* equivalents in the greybus uart driver.

Signed-off-by: Oskar Ray-Frayssinet <rayfraytech@gmail.com>
---
 drivers/staging/greybus/uart.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/greybus/uart.c b/drivers/staging/greybus/uart.c
index 7d060b4cd33d..6af0a3b4d2c4 100644
--- a/drivers/staging/greybus/uart.c
+++ b/drivers/staging/greybus/uart.c
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
@@ -360,12 +360,15 @@ static struct gb_tty *get_gb_by_minor(unsigned int minor)
 static int alloc_minor(struct gb_tty *gb_tty)
 {
 	int minor;
+	int ret;
 
 	mutex_lock(&table_lock);
-	minor = idr_alloc(&tty_minors, gb_tty, 0, GB_NUM_MINORS, GFP_KERNEL);
+	ret = xa_alloc(&tty_minors, &minor, gb_tty,
+		       XA_LIMIT(0, GB_NUM_MINORS - 1), GFP_KERNEL);
 	mutex_unlock(&table_lock);
-	if (minor >= 0)
-		gb_tty->minor = minor;
+	if (ret)
+		return ret;
+	gb_tty->minor = minor;
 	return minor;
 }
 
@@ -375,7 +378,7 @@ static void release_minor(struct gb_tty *gb_tty)
 
 	gb_tty->minor = 0;	/* Maybe should use an invalid value instead */
 	mutex_lock(&table_lock);
-	idr_remove(&tty_minors, minor);
+	xa_erase(&tty_minors, minor);
 	mutex_unlock(&table_lock);
 }
 
@@ -984,7 +987,7 @@ static void gb_tty_exit(void)
 {
 	tty_unregister_driver(gb_tty_driver);
 	tty_driver_kref_put(gb_tty_driver);
-	idr_destroy(&tty_minors);
+	xa_destroy(&tty_minors);
 }
 
 static const struct gbphy_device_id gb_uart_id_table[] = {
-- 
2.43.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
