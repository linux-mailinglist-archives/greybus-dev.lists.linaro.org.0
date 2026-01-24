Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id FOWyJvxJdWnqDQEAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Sat, 24 Jan 2026 23:38:52 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 12BB07F23B
	for <lists+greybus-dev@lfdr.de>; Sat, 24 Jan 2026 23:38:52 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id A841640171
	for <lists+greybus-dev@lfdr.de>; Sat, 24 Jan 2026 22:38:50 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	by lists.linaro.org (Postfix) with ESMTPS id 27B8A3F734
	for <greybus-dev@lists.linaro.org>; Sat, 24 Jan 2026 17:42:01 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b="hVXyv/H6";
	spf=pass (lists.linaro.org: domain of architanant5@gmail.com designates 209.85.214.169 as permitted sender) smtp.mailfrom=architanant5@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2a102494058so20950635ad.0
        for <greybus-dev@lists.linaro.org>; Sat, 24 Jan 2026 09:42:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769276520; x=1769881320; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Bb5n6sM2fqMcuUW4SQz6w+f0gdChJ7fTob5ZS9rYksg=;
        b=hVXyv/H6V4pgw0BpbAj7pS/uDb3w1HYuelVIximKGOyhffCPhhG9cjHblEw9e2h5K4
         AIqwM/pVmfQa3TYoJSC832sMncOF5zp3eFOQ3XeEhQExm5NEqEIXbteKbJjt49ns1+6X
         AyJWbz7ADT0IIEAu+1SUlw0jvfHq9lqcJLVW9LU0El5st5kCRf6fc0Nrp5E5XWfcbMY2
         7DBvaxH3cfSOoVXjB4WU//dVfD/kP9WGJ4XMcS5B0AJOi9Y3VfUQ10wy9FPmYX/PkRKB
         5ralDuiURV7fq02slFx2Sg7ZBovuI/PQgq7UkwjNuEeQQ/kfnykcUeOZ6VUAq3pDZWxG
         mdsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769276520; x=1769881320;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bb5n6sM2fqMcuUW4SQz6w+f0gdChJ7fTob5ZS9rYksg=;
        b=fxJMWs/1fvIJcAG8Rmc6WIl+Urn2DGU+Qe6C9ytubX3VZrlqmirlsi8fUGdE8w01Jb
         Y/A+ROn097VTSJhYtw9vELDP7qgQBjIAXPiumrhUj6RTcu/NEXjDHQ21TXZEJX3ZGMVv
         qXTyJzCN2OoUVS15+H8J9Gs7Oei5h8P/fki4+hCdYvvxtkMRPFn5DESF5lO1swyx4KNK
         0y64YiEp9mo2GF0fxcrj6C6HmfECTgXcQV0lW0OnMdCymXLPUOXCkMoBv33OwMBS9iWY
         oE9yPq72XXWPJbV29eCTGurPISyEt80xkwIrZnmRbCOf9zGUMRypczoNml2PQ22Kmcnb
         xi6w==
X-Gm-Message-State: AOJu0YxeIG2ZF3a69Kb7hkwHpfvaxgl3yGY8QT4QTtlFlWSAwIvK1gOW
	fv+eEjq8a1dJjUqCY4rIZObaeHV5f1d8jRl3e3VRIDNmTwO8GF39G6Zhd2dRmatAmM0=
X-Gm-Gg: AZuq6aKGgt5XXDWh46N7I2cz5O1fznDT00kdYo1Z97DpOpFc7iK/hp3f4j6kqmMk3pg
	rTLOzWbUvjAjyeyFqh9eSESieOGz6D3deRL1d7/oBPOKaPey9Le1TctyKeru08f2jst/vubWlht
	McPQRgieCTSj2a6ZdQt5mTgQ8Z7fEnJBill7bG0hQNZ1nT94RTTq7zH++r5A6GJrFKG3T4KocxM
	OQzvK94Kx+fpKtN3h2xBY6EJiVoQPinaex2HqpB7rPzCwERf0T19+w2l0Wy/3Rg4wItqv/xPPF1
	QlkxO6Q9/ubUbySsGTDg9fHDbFO4pWF2tkgS/cWfEJB+Kk1njpLeyXrjcqzPeaSAAlU3Y0MXG0O
	sEUSd8CdoeLEy0cb62T0FkpPc9+WnAYUnEmYLyRmLH0cf/ENI14kmMO9ZBV5hY+1yGlek1QumaI
	t8TfD/BNNaq3jMqOGi3N2Fhz5n5vJ2YQ==
X-Received: by 2002:a17:902:cf43:b0:2a7:a3b3:3229 with SMTP id d9443c01a7336-2a7fe73f971mr58217855ad.5.1769276520124;
        Sat, 24 Jan 2026 09:42:00 -0800 (PST)
Received: from debian.ari ([152.58.177.222])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802f97902sm50096855ad.57.2026.01.24.09.41.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jan 2026 09:41:59 -0800 (PST)
From: Archit Anant <architanant5@gmail.com>
To: johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org
Date: Sat, 24 Jan 2026 23:11:49 +0530
Message-Id: <20260124174149.10314-1-architanant5@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: --
X-MailFrom: architanant5@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: 46MJPPOPJCQC6D532ZB4SJY7DCOAPGFE
X-Message-ID-Hash: 46MJPPOPJCQC6D532ZB4SJY7DCOAPGFE
X-Mailman-Approved-At: Sat, 24 Jan 2026 22:38:49 +0000
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Archit Anant <architanant5@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] staging: greybus: remove completed GPIO conversion task from TODO
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/46MJPPOPJCQC6D532ZB4SJY7DCOAPGFE/>
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
	R_SPF_ALLOW(-0.20)[+mx];
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
	NEURAL_HAM(-0.00)[-0.990];
	FROM_NEQ_ENVFROM(0.00)[architanant5@gmail.com,greybus-dev-bounces@lists.linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linaro.org:helo,lists.linaro.org:rdns]
X-Rspamd-Queue-Id: 12BB07F23B
X-Rspamd-Action: no action

The task to convert the Greybus subsystem to the GPIO descriptor
interface has been completed. A grep of the directory confirms that
no consumer drivers include <linux/gpio.h> or use the legacy integer
based GPIO API (gpio_request, gpio_set_value, etc).

Remove the stale entry from the TODO file.

Signed-off-by: Archit Anant <architanant5@gmail.com>
---
 drivers/staging/greybus/TODO | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/greybus/TODO b/drivers/staging/greybus/TODO
index 6461e0132fe3..43fb6dc3dff0 100644
--- a/drivers/staging/greybus/TODO
+++ b/drivers/staging/greybus/TODO
@@ -1,5 +1,2 @@
-* Convert all uses of the old GPIO API from <linux/gpio.h> to the
-  GPIO descriptor API in <linux/gpio/consumer.h> and look up GPIO
-  lines from device tree or ACPI.
 * Make pwm.c use the struct pwm_ops::apply instead of ::config, ::set_polarity,
   ::enable and ::disable.
-- 
2.39.5

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
