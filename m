Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6HiaLOG8sWmxEwAAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Wed, 11 Mar 2026 20:05:05 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 352E4269041
	for <lists+greybus-dev@lfdr.de>; Wed, 11 Mar 2026 20:05:05 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 0B11A402C9
	for <lists+greybus-dev@lfdr.de>; Wed, 11 Mar 2026 19:05:04 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	by lists.linaro.org (Postfix) with ESMTPS id D67AA401D1
	for <greybus-dev@lists.linaro.org>; Wed, 11 Mar 2026 17:54:05 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b="g/YVuJAB";
	spf=pass (lists.linaro.org: domain of rj5547884@gmail.com designates 209.85.216.46 as permitted sender) smtp.mailfrom=rj5547884@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-35691a231a7so55171a91.3
        for <greybus-dev@lists.linaro.org>; Wed, 11 Mar 2026 10:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773251645; x=1773856445; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eSZEw1oaxRjt1VgILiCFj/G1OOBannvK8EXRAOhSmrs=;
        b=g/YVuJAB3CrtuY2B2K9HFJ9xQHcsM9wz4A01RPzaEUUYNBsCR5ZuRTRi0KanTJWkR5
         KCip9M+QN7hJV8P7sOomzuUBxKFl0LYUO0XVMbsBJB0mJfqZUEMWxJ3D++ctbRKr2a4a
         w7sEdbrmzIoV/xH1oKGjvIWI/WEE3QHsaRoJFZFcdotuq8TKdQXgTO2nm5oa+L6quYjO
         461rBuT5TWU5yDe/c0wrD6/ml4s8zl0mfOVT+FU0p077xaXoVxbZ6SEFN+SWF2E15+av
         /jy9CybrTK5RKTrGt1+aHyCViDGn/seURi+YQCsMxcbXqA69Hi0iD/EOJvUSNKiThFzu
         gFkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773251645; x=1773856445;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eSZEw1oaxRjt1VgILiCFj/G1OOBannvK8EXRAOhSmrs=;
        b=T0rftTKQjCRT9zGWyWMgo7xI0ImRYy1t3tRmigY+wDmwPR556CCV3nKciwN9C77gTl
         ckn00O/K3Xq+I6zfJ6fkF5NNa9dj+cgHjiCssGdjW+QD1Pk6PFUXcAF8a01NufkSxheZ
         KCUoaBe4UD/rplvQisbFBQ/K3GD8xMwRU6xrfwXbpYqjgKu9m9pNQjlomIgk+dSTc8Lu
         szCzedt739p5G86fx2hKyQAVPEcYD/b0dxw/kjlw1EOzBGv4BZ1n4g64qXUx9zHpJUsn
         Crisi58Jct6beYgOjnGnkHr4MVvXKCciNJgfdtguPo9HbBTxTQyVP9HO0FJ/iQTeXoVv
         n8JA==
X-Gm-Message-State: AOJu0Yx6vmgotsf8An6eE3OwelykG6OAQqHA0KwMhdILdX/IAvz1O/78
	MpLGMVEbeGVq3bQNMmkpqw2v/cEBmAkZ7YhF71aImBmDQVlULKlibJ9q
X-Gm-Gg: ATEYQzyyvniD/nZz2qWnuRqNNf44MDpUPiq8kK9J5mwQQkKfe9pPmeqf6R+mGX9HsVA
	Pr3l6Sl1UwdB/yn5ccx3b6FFykTY76PeKqbWcdr4tZSQoLTHdQ1j6Nx5xw0ag0002deSCcxTPIN
	mMs4RuZkdIwPC3qUJ8qsJaY7XHa96FTLVI8RTL7RSrJS9xK1dBIBwqlrt6gP6r09mXNic5Kv5lV
	ot7nYwQxKQJ3NDKfvRSyG2aMN15ZG61Ea/7dRVINHp8WcZgqmZ9po2ja+nmFuKfte28PqlW2/Lp
	BPIQ4T/9CJJDURYK0frAhwovLxRBDxhM1DD5GF6vVCPuymuM8x0tpViYgfiDI66vhVaB5J4LeFl
	2QQEUfi7usVdOwx0MvV8DaRBVan/mgExXZg86BnBu1zYM3NWoMDXUZeBySOcJ+DqtlvAdY47Wvh
	okj6JJEoC3+zK76VJAPHthU9LbYImDZBv9g0Fz7MDb+asy
X-Received: by 2002:a17:90a:d60e:b0:34e:630c:616c with SMTP id 98e67ed59e1d1-35a01a5ae28mr3144333a91.31.1773251644843;
        Wed, 11 Mar 2026 10:54:04 -0700 (PDT)
Received: from hyd-e160-a08-1-06.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35a0bc58b44sm1420658a91.3.2026.03.11.10.54.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 10:54:04 -0700 (PDT)
From: Rahul Joshi <rj5547884@gmail.com>
To: rmfrfs@gmail.com,
	johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org
Date: Wed, 11 Mar 2026 23:23:34 +0530
Message-Id: <20260311175334.464391-1-rj5547884@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Spamd-Bar: --
X-MailFrom: rj5547884@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: RPMIAZWJ35U2ZNBLA2KSGXTGG3YE5KLF
X-Message-ID-Hash: RPMIAZWJ35U2ZNBLA2KSGXTGG3YE5KLF
X-Mailman-Approved-At: Wed, 11 Mar 2026 19:05:02 +0000
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Rahul Joshi <rj5547884@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] staging: greybus: gpio: add comment to mutex definition
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/RPMIAZWJ35U2ZNBLA2KSGXTGG3YE5KLF/>
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
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,linuxfoundation.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[lists.linaro.org,lists.linux.dev,vger.kernel.org,gmail.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	TAGGED_RCPT(0.00)[greybus-dev];
	RCPT_COUNT_SEVEN(0.00)[8];
	FROM_NEQ_ENVFROM(0.00)[rj5547884@gmail.com,greybus-dev-bounces@lists.linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_SPAM(0.00)[0.770];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email]
X-Rspamd-Queue-Id: 352E4269041
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The irq_lock mutex is missing a comment describing what it protects,
which is required by kernel coding style. Add a comment clarifying
that it serializes IRQ bus lock/unlock operations used to defer and
sync pending IRQ type and mask changes to hardware.

Signed-off-by: Rahul Joshi <rj5547884@gmail.com>
---
 drivers/staging/greybus/gpio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/gpio.c b/drivers/staging/greybus/gpio.c
index 12185f7a982c..89c15b804b2a 100644
--- a/drivers/staging/greybus/gpio.c
+++ b/drivers/staging/greybus/gpio.c
@@ -39,7 +39,7 @@ struct gb_gpio_controller {
 
 	struct gpio_chip	chip;
 	struct irq_chip		irqc;
-	struct mutex		irq_lock;
+	struct mutex		irq_lock;	/* protects irq bus operations */
 };
 
 static struct gpio_chip *irq_data_to_gpio_chip(struct irq_data *d)
-- 
2.34.1

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
