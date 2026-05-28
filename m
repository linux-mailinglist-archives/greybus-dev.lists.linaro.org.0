Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wHWQEUhTGWqYvAgAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Fri, 29 May 2026 10:50:16 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id C41A05FF7C3
	for <lists+greybus-dev@lfdr.de>; Fri, 29 May 2026 10:50:15 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 5EC55406B3
	for <lists+greybus-dev@lfdr.de>; Fri, 29 May 2026 08:50:14 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	by lists.linaro.org (Postfix) with ESMTPS id F1BB9404E0
	for <greybus-dev@lists.linaro.org>; Thu, 28 May 2026 13:51:19 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=UqGy9fqQ;
	spf=pass (lists.linaro.org: domain of alfievarghese22@gmail.com designates 209.85.215.175 as permitted sender) smtp.mailfrom=alfievarghese22@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-c8025aecc40so5837980a12.0
        for <greybus-dev@lists.linaro.org>; Thu, 28 May 2026 06:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779976279; x=1780581079; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=A71OUHyyRe1M+VCs+XKSSgTKfIfoE57tMLNWnn+zSKk=;
        b=UqGy9fqQEE3ec3R4j6glTLQBwJJAZLE/Gf6d/70wX9hhOV3DHDuDqfjbS6+MwcPPzp
         /w27yvRWeSUWmfkUH9OigWtLaM8PubwOSOpIhJuyE/1Mo/p4ytcOF6+tqhLjeJyAKbsC
         X8BtsXTMsqN75gpZ35TV++TXnVTSqEDc7dMffy80vyna/hbpTH4avaBRFpz+J5HFypFJ
         nK9/EsXPCPWBBysY6W/i/0FPC2W1hdlnhPIM7LMXDoMcB58fJS5AQOmQcRX5udJ1XEvl
         oIn1NQVz2Gk/Z5d1kXpwGRfWFCvQ+fdLPfHb/XYq8/s0SWvLPX0P6I3LmQJpFUpaOUAW
         f2sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779976279; x=1780581079;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A71OUHyyRe1M+VCs+XKSSgTKfIfoE57tMLNWnn+zSKk=;
        b=JV/pNSxyolznTNtEONFJ5gghGh1r2nQxfQ9Bjn154qVx49lxglHmA3JCSzmUH0cv21
         RezluB3bV5+65OCWQriTvGBjGG/4x0tM91ADkXUBzYv723vxbN1CGB619Ves2S/ZCnPC
         rjB6BB4roPvI2Y51uxV0aN7LfqYwnSZw35WwIoLMrwwFQCSp5510FDpw2tLK9K3j6r7D
         1S3JvV3xAti6gi/JDochy00JF+OJoGe91HH9AmyocuO5ZZgtyTiQJsXHYS0vtLe+WNZQ
         xRaYwyEw8kQshPzq+RSVs/IbBm7aUNx1wHA/CSlvFXNSpMRxOiNk1Ex3HK0atbb0CpqZ
         GO+w==
X-Gm-Message-State: AOJu0YxHOFGfImhL5qmk5SC4YXjjMTWp6Hhjc1fiqT6PPCRV9jKUIO/S
	Jj8JB81E+uQZdyAFPUSG7zm9f8SpQK5Bwq7Vcypb4YZ7wVLKvrP9P9ed
X-Gm-Gg: Acq92OGx3LdHeGy5iNxwVPvUPhw/OdXCMQdyes+j3T/aW0OE/QvZxWvdPETCYRXDKBx
	4Lv/SRv0YtddOx8/oXuDyPLIXUOyPTogPFSSM/3rMmvCsZS03y1Vq7SeZVbZdLhmIPJQPTbscYj
	q/YwCy43GElvyIl2p4wyUdp7OnA5VWorzYqrns19wuBrEewEY1Ap4wRJLn16jLxRuVh9qf1uJ53
	oX3uXZeY7VsrgvVgAKIGhYtA8w2z6R/Qx6+0ureZaR9sRvDVZ/xmpNDOaykKkWb98bgtvWX8XoG
	VmM68fjpl057Gf4aJtDyPr/ox1BEfbAGTCJdDXmZPg4sP0g90zJc6Q68JuWwnHMGzzUMVHzUffL
	Wb4PrkxU+wm0kqG5q+mzA4Q2iK9bLHFVOSp/j2lC4/T3JIdhuilR6/hV6P5KJIZhCZQ3fG96fQC
	Bo2wb27S73LGkEf07aJysk5zZebo7EG+ab4nHmV41dzl5pgyTBbJSu0tNHFgalKkrifSgVBng6O
	s54U4/BWErFKZP/o8IqfwJT0NYrxBIhrv0meMCyi0TZb9dwQxJw
X-Received: by 2002:a05:6a21:4c13:b0:39c:2d2a:632e with SMTP id adf61e73a8af0-3b3fed32fd4mr1697534637.11.1779976278988;
        Thu, 28 May 2026 06:51:18 -0700 (PDT)
Received: from localhost ([1.39.75.74])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85202a337fsm15256769a12.8.2026.05.28.06.51.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 06:51:18 -0700 (PDT)
From: Alfie Varghese <alfievarghese22@gmail.com>
To: Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Thu, 28 May 2026 13:51:09 +0000
Message-ID: <20260528135111.2791-1-alfievarghese22@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Spamd-Bar: --
X-MailFrom: alfievarghese22@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: ZNGR3XE3MNB7ANXT5QDN3NS2BZPSVP5Z
X-Message-ID-Hash: ZNGR3XE3MNB7ANXT5QDN3NS2BZPSVP5Z
X-Mailman-Approved-At: Fri, 29 May 2026 08:50:11 +0000
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Alfie Varghese <alfievarghese22@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] staging: greybus: vibrator: return device_create() errors
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/ZNGR3XE3MNB7ANXT5QDN3NS2BZPSVP5Z/>
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
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[lists.linaro.org,lists.linux.dev,vger.kernel.org,gmail.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-0.926];
	FROM_NEQ_ENVFROM(0.00)[alfievarghese22@gmail.com,greybus-dev-bounces@lists.linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email]
X-Rspamd-Queue-Id: C41A05FF7C3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

gb_vibrator_probe() maps any device_create() failure to -EINVAL. This
loses the real errno returned by the driver core, such as -ENOMEM, and
makes probe failures harder to diagnose correctly.

Return PTR_ERR(dev) instead so callers receive the actual failure reason
while preserving the existing cleanup path.

Signed-off-by: Alfie Varghese <alfievarghese22@gmail.com>
---
 drivers/staging/greybus/vibrator.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/vibrator.c b/drivers/staging/greybus/vibrator.c
index 0ec4d317c..763c234fb 100644
--- a/drivers/staging/greybus/vibrator.c
+++ b/drivers/staging/greybus/vibrator.c
@@ -161,7 +161,7 @@ static int gb_vibrator_probe(struct gb_bundle *bundle,
 	dev = device_create(&vibrator_class, &bundle->dev,
 			    MKDEV(0, 0), vib, "vibrator%d", vib->minor);
 	if (IS_ERR(dev)) {
-		retval = -EINVAL;
+		retval = PTR_ERR(dev);
 		goto err_ida_remove;
 	}
 	vib->dev = dev;
-- 
2.54.0.windows.1

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
