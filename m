Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CLIjNu9ogmmETgMAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Tue, 03 Feb 2026 22:30:23 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B8D9DEDD5
	for <lists+greybus-dev@lfdr.de>; Tue, 03 Feb 2026 22:30:23 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id DC304401BA
	for <lists+greybus-dev@lfdr.de>; Tue,  3 Feb 2026 21:30:21 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	by lists.linaro.org (Postfix) with ESMTPS id 81F913F7F0
	for <greybus-dev@lists.linaro.org>; Tue,  3 Feb 2026 21:23:13 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=j6DzfClY;
	spf=pass (lists.linaro.org: domain of neelb2403@gmail.com designates 209.85.219.51 as permitted sender) smtp.mailfrom=neelb2403@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-88a3d2f3299so1323766d6.2
        for <greybus-dev@lists.linaro.org>; Tue, 03 Feb 2026 13:23:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770153793; x=1770758593; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QUndUWbhdIHwanpBhZ12fokUHE7bF12BnIRi6yojFHk=;
        b=j6DzfClYHCn05p9fvlFbM3tEvlOY0iXmHL88RFVtqrP3e8zgXCncnZ8vtgaGJa25Mv
         etVvIU04t1jFK0tuGKhpHtKytqGeh8ADgyNBHadgqcF9tBmOpU7aJeUVlwMrURMz8g1c
         NFhu2uZn6vGrB60mcLbXKDb5loJgwWc9SdD8UwkWAHBNxCJqciUYvVQUQ815JOCMJasO
         DczsSCVXr4lga0TzpFFCW4hXSGgAjIOl7+S0VRuCm5oLRTDkSyPPexkchH37yu1i/kNC
         HqBh/MUWI4aCPAcQBBOsCcuUWr3U2TB/38r+D+gFw/MX3Frp1oCqVnxJTPQ1F+berMVJ
         e2wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770153793; x=1770758593;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QUndUWbhdIHwanpBhZ12fokUHE7bF12BnIRi6yojFHk=;
        b=ZncsSyW613sUzbwj1JFt5rpdDq/rxjbm0S4gWo9PPqjRAI0ChgIxqETCUjqjW4o1OO
         fdfwrUMmlNPo8hPdFPG0pyBT5iVR06CwrTzNSv7J+x5EVULpOC30D3unavb4WgdJWkQQ
         MEYIhmiFa0bvDzeFWOBUAlcJMCHrKc52WdFqJnY8wp5zAbtfm10Dt0kB4zc2njPtIm1D
         +Dus4Pd19J1WHRvIy9qsF//Cz+3y18bjrWDin3adEnsHuB5oqaPiTy7xAS1MoTzl8hfY
         FAMa7NMIeCCh1csOFh/WtFZKh1uor56hSFOps4amyFnImBsssur6UK5XteH+d/8jdB26
         I2KQ==
X-Forwarded-Encrypted: i=1; AJvYcCX3BP/4WJMJyF+L+lCei21AbMI+diTxNF8ohksPPSie2K9HDRsbd5naugzx4MCwLekMC80/6sK+ujeq5A==@lists.linaro.org
X-Gm-Message-State: AOJu0YwEePH2Pg9/9eWzN45ajnyDEzkY74d+cTv7gsWTt4hiFqXSZVeZ
	A1NWv9gIz6xv3Sb+C8D9tMyWUsu0wiov2tXiLlURPFWO1RcEkcO1GK7DuBYNTg==
X-Gm-Gg: AZuq6aLGWmja0d/o+BErHpzeRKOW0LMKDikgDZGp0HTDfdrJSISCVBd0Rx6tB9kHtRf
	1K7ORZBGlQWrBhR/i1IBxrkv+iJiG3lzBRYldYJPxFLYNMbPo06/QOz4tigwgKPOKAdNeXwdUdI
	irGsbAxhR5R5oMnSzJMgqJXzFNjOuIZCK1gYXLBcUpcSZBzwfsQ5U1e3BUhkXgNKGyYTolTj7tZ
	8hZf8sEBe6Kuy23HQq7TgJWL6+zel7UeFYpEUzUFKUgximhIndmXc4gNaofpXwUN4FE8LkauLN/
	+qhBoZuixXTl4TaQFKFpVKptkmdTDahjJVBeR0S/ymTCPKkdmdlJS8f3It6F7AJdXJ5g/RTTxL1
	XI8PmsCVtANaIvrd5XWYmLw9xMIK1DKGp8vEBqHnfkBo7ndDq4feo4Qvzq7H2fFkourlm62dgSs
	KqsGj0zQw7QvgRlw==
X-Received: by 2002:a05:6214:5287:b0:895:3a3:b681 with SMTP id 6a1803df08f44-895221e3beemr12210696d6.68.1770153792875;
        Tue, 03 Feb 2026 13:23:12 -0800 (PST)
Received: from Mac.home ([76.64.58.244])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89521bfe708sm5684216d6.7.2026.02.03.13.23.12
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 03 Feb 2026 13:23:12 -0800 (PST)
From: Neel Bullywon <neelb2403@gmail.com>
To: Johan Hovold <johan@kernel.org>
Date: Tue,  3 Feb 2026 16:22:54 -0500
Message-ID: <20260203212254.90855-1-neelb2403@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Spamd-Bar: --
X-MailFrom: neelb2403@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: Z3USTCINWT2K64DFKYW3AMADV7VHN2S3
X-Message-ID-Hash: Z3USTCINWT2K64DFKYW3AMADV7VHN2S3
X-Mailman-Approved-At: Tue, 03 Feb 2026 21:30:19 +0000
CC: Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Neel Bullywon <neelb2403@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] staging: greybus: gbphy: replaced sprintf() with sysfs_emit()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/Z3USTCINWT2K64DFKYW3AMADV7VHN2S3/>
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
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[greybus-dev];
	NEURAL_HAM(-0.00)[-0.996];
	FROM_NEQ_ENVFROM(0.00)[neelb2403@gmail.com,greybus-dev-bounces@lists.linaro.org];
	FREEMAIL_CC(0.00)[kernel.org,lists.linaro.org,lists.linux.dev,vger.kernel.org,gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	DKIM_TRACE(0.00)[gmail.com:-];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linaro.org:helo,lists.linaro.org:rdns]
X-Rspamd-Queue-Id: 6B8D9DEDD5
X-Rspamd-Action: no action

Replaced sprintf() with sysfs_emit in the protocol_id_show() sysfs
attribute func to prevent any potential buffer overflows

This is to ensure a kernel-wide migration to safer string formatting
functions for sysfs handlers

This was compile-tested only (no VM/hardware used)

Signed-off-by: Neel Bullywon <neelb2403@gmail.com>
---
 drivers/staging/greybus/gbphy.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/gbphy.c b/drivers/staging/greybus/gbphy.c
index 60cf09a302a7..55f132b09cee 100644
--- a/drivers/staging/greybus/gbphy.c
+++ b/drivers/staging/greybus/gbphy.c
@@ -31,7 +31,7 @@ static ssize_t protocol_id_show(struct device *dev,
 {
 	struct gbphy_device *gbphy_dev = to_gbphy_dev(dev);
 
-	return sprintf(buf, "0x%02x\n", gbphy_dev->cport_desc->protocol_id);
+	return sysfs_emit(buf, "0x%02x\n", gbphy_dev->cport_desc->protocol_id);
 }
 static DEVICE_ATTR_RO(protocol_id);
 
-- 
2.44.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
