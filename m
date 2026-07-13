Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KHT8A2UdVWpukAAAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Mon, 13 Jul 2026 19:16:21 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 838A374DEC8
	for <lists+greybus-dev@lfdr.de>; Mon, 13 Jul 2026 19:16:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=gmail.com header.s=20251104 header.b=feHiilog;
	spf=pass (mail.lfdr.de: domain of "greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org" designates 44.210.186.118 as permitted sender) smtp.mailfrom="greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org";
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=gmail.com (policy=none)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 5B98740A3F
	for <lists+greybus-dev@lfdr.de>; Mon, 13 Jul 2026 17:16:19 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	by lists.linaro.org (Postfix) with ESMTPS id EC4C33F6DA
	for <greybus-dev@lists.linaro.org>; Mon, 13 Jul 2026 17:08:48 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-84a2c90e383so101094b3a.0
        for <greybus-dev@lists.linaro.org>; Mon, 13 Jul 2026 10:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783962528; x=1784567328; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qFgEIJe873D6LcL30QNtzeLHCAWHrsjuemBtpi5imkw=;
        b=feHiilogHBQaXGeoHXyg5fPLiDwXpo1yqIDxSh+WnAkzqzeNblu1Q2gyVxp5svkZfn
         oG704eST8iCzxko06bqWrCeOGgV4kabQe7SJhXYYgHgN0vNkV5n3P0CfMs4Ef3766Jrq
         QlR6T9CumG/OfjEDsT3ADebeD2QScRsJ3clmqWvwlBJiYgQMol67UmHwV1omf2MmXRpY
         5M1OYzT63xChbStmDDn5fcfiXPwnPzZ4NfLQtEeW1us6XJWpkljVgWParW759byDnmw7
         dtUtFebByT5ScLGj6uo50IzC4XbmBDYKgYl+8aI4RipJSt7D3W95VagoPujhh4sZuQ/u
         uEnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783962528; x=1784567328;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qFgEIJe873D6LcL30QNtzeLHCAWHrsjuemBtpi5imkw=;
        b=r1Ky9ezW5wmRTectQRvleYalzhWacXybJ/nrF1o9BZkSOi+psMPEcJI4H7BAq11P0X
         Sia2GJWm9KWBQxZQPKByOvwd5SqNa19vBSYOEmlRfdDnuP7FAKycmOswMiPwXcKmcmY8
         2aS4tid9RZzxUMUDE67ZcXSrwjGsAXxJ8JMxEJH7IBaO72Atuz9kd9vpiYYjGeIdvhuj
         LIz47+vK+NJ+mZJ6yFmx1tl2aBRXep55wiu72tXswR19kLZsWDebk0vuJXy2iUDQOhoz
         aqaK4RYPIjE0b9rh0vD3Gvflc76EkxQmR1M0TKHMbNkZ0oodf4dbpQsjqPvLcleBfKMO
         bnAg==
X-Gm-Message-State: AOJu0YwDGx2Qla/QoprAABV9iNx672Hw6PU4Cag0QKxYI19+wn2Illb8
	r2T6UAujgsDeiWXF6oL0RAu+GFEY0VyMO38i2+REbdoa6GeNLeCTY/IS
X-Gm-Gg: AfdE7cnual4rd9HiXBQxhpmUgzxdUws21ThGwD+37fdZanbFPEja3H9Jna3zE4ijIKc
	fjRlUrUqKNT5vzf5PCG5ZEf5zoQs/nlfg6nh3t7q2mEg0wF9XHrsGayvFbWkXu9CMiVJMT4+TLR
	hg8FUcBQ0rYR1sNdpIYp8G5TRk5rgCiuvZok2S1xs8yLuMmuq25Nz3sQMAs1n+9gai3oQPx2TS1
	4Gsz4MO6AgM5+rZVN6siTFhk/DNZLY/dDYTb4IZUVwzAEsXVtw8OWN9LAVV6YAVlMWuYAJvzkk+
	CD5BpBIs4znbpzQi9WfM6l6Py62lZglvy6jyMwEl9ABIM7s0Xyx+muf/ceVJ6fhOYwhg5ZzpK6y
	86fz4/Hl/t2iRjat8tDwmcTmFLNAOzuyV9gbMgOMrDPtRJw3gKzt1084iySGQ+FfWwl/AudpvA/
	58VSd/QpRFDVHt2SrLGnZLYKAa8wAK0A5mJTRBj+X8ff0MgJaGCe+kpZsuB3Bx0sLJ58t4zO8Ta
	bD83hdf+VbB1nYxz2h3d7Go/M0fbRfZXgmhegcQstUs85nEYAxxYYWIkzxPJGGvvQDd
X-Received: by 2002:a05:6a21:6e43:b0:3bf:b7e8:68ab with SMTP id adf61e73a8af0-3c0f08602bbmr16557584637.2.1783962527926;
        Mon, 13 Jul 2026 10:08:47 -0700 (PDT)
Received: from OMEN ([103.184.238.250])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659d8da9sm123126740c88.14.2026.07.13.10.08.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 10:08:47 -0700 (PDT)
From: Alfie Varghese <alfievarghese22@gmail.com>
To: johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org
Date: Mon, 13 Jul 2026 22:38:45 +0530
Message-ID: <20260713170845.1518-1-alfievarghese22@gmail.com>
X-Mailer: git-send-email 2.54.0.windows.1
MIME-Version: 1.0
X-Spamd-Bar: --
X-MailFrom: alfievarghese22@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: KQOLUJORPJUGCYF3JUK2UXT3FWTKH745
X-Message-ID-Hash: KQOLUJORPJUGCYF3JUK2UXT3FWTKH745
X-Mailman-Approved-At: Mon, 13 Jul 2026 17:16:13 +0000
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Alfie Varghese <alfievarghese22@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] staging: greybus: uart: return tty_alloc_driver() errors
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/KQOLUJORPJUGCYF3JUK2UXT3FWTKH745/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.59 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:johan@kernel.org,m:elder@kernel.org,m:gregkh@linuxfoundation.org,m:greybus-dev@lists.linaro.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:alfievarghese22@gmail.com,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[alfievarghese22@gmail.com,greybus-dev-bounces@lists.linaro.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[lists.linaro.org,lists.linux.dev,vger.kernel.org,gmail.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alfievarghese22@gmail.com,greybus-dev-bounces@lists.linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linaro.org:from_smtp,lists.linaro.org:helo,lists.linaro.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 838A374DEC8

gb_tty_init() maps any tty_alloc_driver() failure to -ENOMEM. This
loses the real errno returned by the driver core and makes failures
harder to diagnose correctly.

Return PTR_ERR(gb_tty_driver) instead so callers receive the actual
failure reason while preserving the existing cleanup path.

Signed-off-by: Alfie Varghese <alfievarghese22@gmail.com>
---
 drivers/staging/greybus/uart.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/uart.c b/drivers/staging/greybus/uart.c
index 7d060b4cd33d..24b4dab069c3 100644
--- a/drivers/staging/greybus/uart.c
+++ b/drivers/staging/greybus/uart.c
@@ -951,7 +951,7 @@ static int gb_tty_init(void)
 					 TTY_DRIVER_DYNAMIC_DEV);
 	if (IS_ERR(gb_tty_driver)) {
 		pr_err("Can not allocate tty driver\n");
-		retval = -ENOMEM;
+		retval = PTR_ERR(gb_tty_driver);
 		goto fail_unregister_dev;
 	}
 
-- 
2.54.0.windows.1

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
