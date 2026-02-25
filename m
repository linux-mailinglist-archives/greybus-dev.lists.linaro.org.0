Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QHE+JB7ynmnoXwQAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Wed, 25 Feb 2026 13:59:10 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 5856A197B60
	for <lists+greybus-dev@lfdr.de>; Wed, 25 Feb 2026 13:59:10 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 71169404AC
	for <lists+greybus-dev@lfdr.de>; Wed, 25 Feb 2026 12:59:09 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	by lists.linaro.org (Postfix) with ESMTPS id 72F5B40144
	for <greybus-dev@lists.linaro.org>; Wed, 25 Feb 2026 10:30:47 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b="CAg589/b";
	spf=pass (lists.linaro.org: domain of oborotovmatvey@gmail.com designates 209.85.167.53 as permitted sender) smtp.mailfrom=oborotovmatvey@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-59e60b3ccdfso8388243e87.0
        for <greybus-dev@lists.linaro.org>; Wed, 25 Feb 2026 02:30:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772015446; x=1772620246; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qOO5wQwrSmDwfOumxY9P5EzZBIqL1pQdH7RIRo8a33c=;
        b=CAg589/bXOE2rYcUUzQYngcstemP1T68CJouCNzeS5cj4yZ82eOhBJaLORqFo7jDsW
         CoAx3eUy8RteWhnNet7sfg2hNsJ1KThKQ5vfOFG8XEka5pkOaIQZS+WpQKWkRSidEtAG
         /inVugSR3EwMyiCmRPV/fK6aIJ33YjqdScpmavfozVjtM56AqLRFZDGPRs3X3s1LHB1y
         DgGmHuFaNx9kom1gaY7pDcJqMyUA6310y1p8R8CS0Y+Y/6tlBcFwD42h+kB+fpfKTBWw
         LdnueSry/1FkC9Knd1bL1U8lVKlEIAb+I5/afEMeoTKnbxqC/gfQSOuU3ninTxxHFGdV
         9ISQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772015446; x=1772620246;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qOO5wQwrSmDwfOumxY9P5EzZBIqL1pQdH7RIRo8a33c=;
        b=i+LkxSMjzU6AjcxtkQjgvZpCrZbsHTEw7PjKRkLFwfd8huFUuPB35ZnmisepYh1y8s
         Kxv21TJlGNppfp1OfHwKiO45hNtRQ927Zr2yrwgwwom3Ir2Iu47b1edB7PAkrbGXEPD+
         TKE7IpwTpXGaLqLoksTwqtBk5i46UV1h7YCuLToox9Q9bOJ5zrGGR809P7NRZgg+pAq0
         H1tEcxuxp/OeyysC5dJ1BO1MybLQHxoP4SZDMAVsPQCQYp/7Yi0RCBB7MFTad7c/ekmX
         JKFLyPNosaUK8WwslK/zkydCGg6OeMs1qPQ4k4gJzAjkDnk32z9EUWwff2H5mOX9FdAp
         u4YA==
X-Gm-Message-State: AOJu0YyR8csC0KOL2zjHDU0u6NjABt91+dS9Y3s19JFGXYGIytVUwXP0
	LzgmneO0qYkyYqQXea4hp4ZE6oM7ra2S5lfj4WkWTkiCrS0qpUKe7jcA
X-Gm-Gg: ATEYQzwpGUqcZRE+ScX+ukhC5mz1SVgc7rXOLq1Uqntg4jN1l7T5QIV8QrmS5otq8qp
	QYlHDNonfyj4RtbHjRKg4IxPA/ZTMPvKyAaBp6GE2ncRb5usaP5xLOdCiEoCscWN46nHpN+9U2Z
	OsRsrD2ljAzrJwBHSMZrvCkSw1OuNtzgi6soWe/5nru30XTkofQ6N+SsGwe5rRfLsOGuVKcSDzc
	JNrNnODFL/TD67yjMo0187Fh6SGHqoDmVEJ1u6YmJGMX0RafB/CQoRcov3NdENzlWJSOD4dtBUP
	cEREHG8Cd8wq/A7gRuYw43l2V2NhdAxFFuLrK4yCazDlp7tC1hLDrG6Bn7+hwX3OJJoAdt1YX5p
	pt2AF0V0cP1stsmOd1+aLol51BxQ8E7pheCZDE8RUOzsogVUJMUSqojdn3MUnQz70IsrIpz/XQF
	GSDqjU928Rw//5QBEFRm9EKVt76ZgOdNUcCM1LO12OjA==
X-Received: by 2002:a05:6512:2346:b0:5a0:ff38:2531 with SMTP id 2adb3069b0e04-5a1026b9fe9mr701334e87.14.1772015445884;
        Wed, 25 Feb 2026 02:30:45 -0800 (PST)
Received: from overpm-TM1701 ([176.124.85.73])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a0eeb4c530sm2872999e87.83.2026.02.25.02.30.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 02:30:44 -0800 (PST)
From: Matvey Oborotov <oborotovmatvey@gmail.com>
To: Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Wed, 25 Feb 2026 15:30:06 +0500
Message-ID: <20260225103006.295553-1-oborotovmatvey@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Spamd-Bar: --
X-MailFrom: oborotovmatvey@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: YP24QSFUAWICZW37GFXP5P4SD4HBNAIA
X-Message-ID-Hash: YP24QSFUAWICZW37GFXP5P4SD4HBNAIA
X-Mailman-Approved-At: Wed, 25 Feb 2026 12:59:02 +0000
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Matvey Oborotov <oborotovmatvey@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] staging: greybus: Use guard(mutex) in receive_data()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/YP24QSFUAWICZW37GFXP5P4SD4HBNAIA/>
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
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx:c];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[lists.linaro.org,lists.linux.dev,vger.kernel.org,gmail.com];
	DKIM_TRACE(0.00)[gmail.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	FROM_NEQ_ENVFROM(0.00)[oborotovmatvey@gmail.com,greybus-dev-bounces@lists.linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email]
X-Rspamd-Queue-Id: 5856A197B60
X-Rspamd-Action: no action

Replace manual mutex_lock/unlock with guard(mutex) in raw.c
receive_data(). This automates lock release on function exit, ensures
that lock is released on early returns, and makes the code cleaner.

Signed-off-by: Matvey Oborotov <oborotovmatvey@gmail.com>
---
 drivers/staging/greybus/raw.c | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/greybus/raw.c b/drivers/staging/greybus/raw.c
index 3027a2c25bcd..6c31bae0d8ea 100644
--- a/drivers/staging/greybus/raw.c
+++ b/drivers/staging/greybus/raw.c
@@ -59,34 +59,28 @@ static int receive_data(struct gb_raw *raw, u32 len, u8 *data)
 {
 	struct raw_data *raw_data;
 	struct device *dev = &raw->connection->bundle->dev;
-	int retval = 0;
 
 	if (len > MAX_PACKET_SIZE) {
 		dev_err(dev, "Too big of a data packet, rejected\n");
 		return -EINVAL;
 	}
 
-	mutex_lock(&raw->list_lock);
+	guard(mutex)(&raw->list_lock);
 	if ((raw->list_data + len) > MAX_DATA_SIZE) {
 		dev_err(dev, "Too much data in receive buffer, now dropping packets\n");
-		retval = -EINVAL;
-		goto exit;
+		return -EINVAL;
 	}
 
 	raw_data = kmalloc_flex(*raw_data, data, len);
-	if (!raw_data) {
-		retval = -ENOMEM;
-		goto exit;
-	}
+	if (!raw_data)
+		return -ENOMEM;
 
 	raw->list_data += len;
 	raw_data->len = len;
 	memcpy(&raw_data->data[0], data, len);
 
 	list_add_tail(&raw_data->entry, &raw->list);
-exit:
-	mutex_unlock(&raw->list_lock);
-	return retval;
+	return 0;
 }
 
 static int gb_raw_request_handler(struct gb_operation *op)
-- 
2.43.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
