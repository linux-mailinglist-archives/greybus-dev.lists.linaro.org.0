Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D749C696E4
	for <lists+greybus-dev@lfdr.de>; Tue, 18 Nov 2025 13:39:32 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 8A5FE3F914
	for <lists+greybus-dev@lfdr.de>; Tue, 18 Nov 2025 12:39:31 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	by lists.linaro.org (Postfix) with ESMTPS id DE6CF3F8F5
	for <greybus-dev@lists.linaro.org>; Mon, 17 Nov 2025 18:20:25 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=ZxTamoUA;
	spf=pass (lists.linaro.org: domain of ayaanmirzabaig85@gmail.com designates 209.85.214.171 as permitted sender) smtp.mailfrom=ayaanmirzabaig85@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2984dfae0acso62190725ad.0
        for <greybus-dev@lists.linaro.org>; Mon, 17 Nov 2025 10:20:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763403625; x=1764008425; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l1mB0CpFd+R5GNJI4Uir4mYrR+aByyYZc5gPF4SEOFw=;
        b=ZxTamoUAFHISO4hbZBVdONmhxbzVOGYWwGiQjUr4TP7q/Q2zrsaKNvrAAHBzW1wI9L
         VJzdyMcG/qwQ6ZFr81BP8oM8P67HOWi3TIX7Y9d2xf9gQYHDwgFqpRska65qsApgh2eR
         WgPl6xtgXPa5CBz80ONsAD1fTsBpLV6d6vqHwcOsAbLqxoYJ8+ed43zTLEfaQf+aCWiE
         Y+HkvpwtMbImqDfr4cEh2eqanT3+t08l+uxhOSJdbct6Ljn1k4YqknK101tg27jblVO0
         CE5wloYopYYk2Mg4X6TfJhpHSWZeIRZZ3JnZ3nqphxTigJZC44HbRSTUAZLcUczwbz62
         zDMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763403625; x=1764008425;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=l1mB0CpFd+R5GNJI4Uir4mYrR+aByyYZc5gPF4SEOFw=;
        b=k7PJY27MQgrtj+lcuThmx31QJxbvicjqhYr+79Bo7CgakquMn1UJKqQGy0CNQFSCKB
         b2y3OQifuJghP/em7zVWG9N3fFWU8MPO214qh/waL7pAsKozSliQ3ZqphQuHUZ3fDTaY
         3AZNw60xEbTkdIKPEhzMW+wGZuyOPXnOhvmo0MtBnzKCWF+g0s4yFQ8rBVWgQX5FRR0O
         U+n7W+YBnepEjqD1N4NPx7GXWyJ7Ju89qZSNlQnTlmwhxhjpQjSqmqniXv8rm4rECFCl
         tdWN1i/WRdjqEakiGuAC3N5ovnbP8lJKS72UM5xD5yPuxRiztEy22WSAjxt5D1umZ02/
         pZ+Q==
X-Forwarded-Encrypted: i=1; AJvYcCU7OWCBWjS+0uRlpjUcaP1n/1mGoJJHH8CLffmuuk0iq7wkxYEmYf1liPXvRzqX3Nj/FP24g1ALJsHnNQ==@lists.linaro.org
X-Gm-Message-State: AOJu0YxMcESQ7q5w6eHn10fZzyWuKu6D1qXrkc/A0OcxrgExz8jK39si
	Q55t6BBfIc76AZ05jXZdWod7fi9zP4CuhFQqwYEeykGIBXQwCaCw0aKYbxcpKw==
X-Gm-Gg: ASbGncs6yiSb1rdcfmytAZ+8mBIFj9ZiMqZoGnhFXn3jjHjhfAj02ifIVLsBoZBdD8y
	Y+Ewz7whLKPGhp3bLEDWl8bkuym9Df+ecNeVTpn4o/BI3P0/Bqbrw26qDstJ+iJXtQ3k4pAg8Pm
	FI346exbrcHwz11RzOpGZlz9MlHtHiXFL83s1LU0x5ew5z08XfqVqy6AbNTs6OhU/o+Pv+La1nk
	00cKNTL+7kAnkE/hx0SX8PG32ZxSs28+t9PYEXSh4uV/Pls6BEymwvRjaQJfAv25KDyUQl8uSQl
	YowRQFYAnaiROTIfcJz6MyI76KytTREPc797PQKV/uNCJ2JrHNrmT8DqB8MRhddKOofW3CalQST
	MhevumVSkO9xGLlfrFEI3GFIZRq4NRDXi+M4uZ9qHk9ZfQ+OxCJlx52ngjHoOP1eizvP6ajuM8B
	sLMoTdUWPBF7bLrxYmszkXrXmPy2Ae71AaMaSKPFMhR2iMNaNc+2yQrNTfwA==
X-Google-Smtp-Source: AGHT+IGiEWPxLbEgpjBHVrDGSz/TUvKwXuB+j47KfouqPtMB4OuRPOjWMzWj+ptVTlnSMzy+nKSnOA==
X-Received: by 2002:a17:903:2b10:b0:297:d777:a2d4 with SMTP id d9443c01a7336-2986a752800mr153002665ad.46.1763403625089;
        Mon, 17 Nov 2025 10:20:25 -0800 (PST)
Received: from ideapad.tail50fddd.ts.net ([139.5.199.69])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c245fa1sm148446705ad.36.2025.11.17.10.20.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 10:20:24 -0800 (PST)
From: Ayaan Mirza Baig <ayaanmirzabaig85@gmail.com>
To: gregkh@linuxfoundation.org
Date: Mon, 17 Nov 2025 23:48:15 +0530
Message-ID: <20251117181818.118139-11-ayaanmirzabaig85@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251117181818.118139-1-ayaanmirzabaig85@gmail.com>
References: <20251117181818.118139-1-ayaanmirzabaig85@gmail.com>
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.50 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17:c];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.214.171:from];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,lists.linux.dev,lists.linaro.org,gmail.com];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	DKIM_TRACE(0.00)[gmail.com:+]
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: DE6CF3F8F5
X-Spamd-Bar: --
X-MailFrom: ayaanmirzabaig85@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: 7E3Q5MBMDBS6Q62Z2FMKGFOMVIPPRKY2
X-Message-ID-Hash: 7E3Q5MBMDBS6Q62Z2FMKGFOMVIPPRKY2
X-Mailman-Approved-At: Tue, 18 Nov 2025 12:38:55 +0000
CC: johan@kernel.org, elder@kernel.org, linux-staging@lists.linux.dev, greybus-dev@lists.linaro.org, Ayaan Mirza Baig <ayaanmirzabaig85@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH 10/13] staging: greybus: raw: handle disconnect while chardev is open
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/7E3Q5MBMDBS6Q62Z2FMKGFOMVIPPRKY2/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The raw protocol driver destroyed its character device and freed its
private data even when userspace still had the device node open. This
could cause use-after-free access through active file operations.

Fix this by marking the device as disconnected, returning -ENODEV from
all file operations after disconnect, and disabling the Greybus
connection before destroying the cdev. This provides safe teardown
without redesigning the driver.

Remove the obsolete FIXME

Signed-off-by: Ayaan Mirza Baig <ayaanmirzabaig85@gmail.com>
---
 drivers/staging/greybus/raw.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/greybus/raw.c b/drivers/staging/greybus/raw.c
index 71de6776739c..74818ca829c2 100644
--- a/drivers/staging/greybus/raw.c
+++ b/drivers/staging/greybus/raw.c
@@ -24,6 +24,7 @@ struct gb_raw {
 	dev_t dev;
 	struct cdev cdev;
 	struct device *device;
+	bool disconnected;
 };
 
 struct raw_data {
@@ -231,10 +232,14 @@ static void gb_raw_disconnect(struct gb_bundle *bundle)
 	struct raw_data *raw_data;
 	struct raw_data *temp;
 
-	// FIXME - handle removing a connection when the char device node is open.
+	/* Mark device as disconnected so file operations fail gracefully */
+	raw->disconnected = true;
+
+	/* Disable Greybus connection before destroying the chardev */
+	gb_connection_disable(connection);
+
 	device_destroy(&raw_class, raw->dev);
 	cdev_del(&raw->cdev);
-	gb_connection_disable(connection);
 	ida_free(&minors, MINOR(raw->dev));
 	gb_connection_destroy(connection);
 
@@ -262,6 +267,9 @@ static int raw_open(struct inode *inode, struct file *file)
 	struct cdev *cdev = inode->i_cdev;
 	struct gb_raw *raw = container_of(cdev, struct gb_raw, cdev);
 
+	if (raw->disconnected)
+		return -ENODEV;
+
 	file->private_data = raw;
 	return 0;
 }
@@ -272,6 +280,9 @@ static ssize_t raw_write(struct file *file, const char __user *buf,
 	struct gb_raw *raw = file->private_data;
 	int retval;
 
+	if (raw->disconnected)
+		return -ENODEV;
+
 	if (!count)
 		return 0;
 
@@ -292,6 +303,9 @@ static ssize_t raw_read(struct file *file, char __user *buf, size_t count,
 	int retval = 0;
 	struct raw_data *raw_data;
 
+	if (raw->disconnected)
+		return -ENODEV;
+
 	mutex_lock(&raw->list_lock);
 	if (list_empty(&raw->list))
 		goto exit;
-- 
2.51.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
