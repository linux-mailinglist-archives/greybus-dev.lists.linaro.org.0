Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wLtbCq/c0GniBQcAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Sat, 04 Apr 2026 11:41:03 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A23839A91A
	for <lists+greybus-dev@lfdr.de>; Sat, 04 Apr 2026 11:41:03 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 22BEF40476
	for <lists+greybus-dev@lfdr.de>; Sat,  4 Apr 2026 09:41:02 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	by lists.linaro.org (Postfix) with ESMTPS id A5C6F3F748
	for <greybus-dev@lists.linaro.org>; Sat,  4 Apr 2026 01:00:15 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=ohBTNX2E;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (lists.linaro.org: domain of k.souta0926@gmail.com designates 209.85.210.181 as permitted sender) smtp.mailfrom=k.souta0926@gmail.com
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-82c68339cf0so1995851b3a.0
        for <greybus-dev@lists.linaro.org>; Fri, 03 Apr 2026 18:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775264415; x=1775869215; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SkSU+fXNvPT4U2WmgiIqiveMqmapuCBrs2GeWelNwHg=;
        b=ohBTNX2EGKqVxHQNjZn3HjhtDS8kuv59zXEZa5KWWJZsrniWJVHrvwsfb6x7VwG059
         SvrcTKv1tO1/clLNnzI81qCtaA6+USov00wfJU5Ys/qKVYUY+9ZPOUUumPm+817ZtFe4
         zIrclZNyJlBcZS1PsvD/E79jx5awv6CvhkI1fMbDZLAZC+9XNl8ghd5+GAXUYjDBB75J
         YITkpaCOfUzlAQsADxAAVYDKg1K+FwJbmIrKiBWKy3Uym9IcAjXSobUrsvNOZibr9ji7
         VYJ5TglWwPOLh5BpndsvVsc5hngepU6h+heiXhpECXRwoF1GRdDKVFwJEwaP46coRgD2
         T1kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775264415; x=1775869215;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SkSU+fXNvPT4U2WmgiIqiveMqmapuCBrs2GeWelNwHg=;
        b=FCwzjTpceB3w6Hr6OVckYjsnqaEoDg8+hLd0g+tcp0Y1ODKRpB4JyKjeJcSIbB4SDH
         TFtYOOJf5UMRhqGmORxSU2naJqSwd4vHos1cJ7rxkMhn+HjfJQbACF+lBn1fdYVtOnLh
         DAmOC0e18AHZe/EY8gEz7Y62dC36GVMmFhkyQI2ZqqJEMlv+JW6PUVq0dAT+K5svrZXy
         OdgTrFWNigeAB+zg9Ni04iFW237nn0OyXsGnOJZigE97Y5kuotXArcjDP28hMs09asI+
         mG7S1rtluzH1INpklq5g7YrmvANQNOqNaz93IxfYxIFgEEx7yjXSvnPNdyMH9sMWcLI/
         Yz2A==
X-Gm-Message-State: AOJu0YwYuLVpkqJSjj/Z2ZbXs9/Zuea2elu8Pk/7rZ06GVRCyF1LT/24
	X3ljJBjSpt1DuPH62IppJf7uOgN6mgdn6CF1hbPXusWPjq4ZfuTPzkcD
X-Gm-Gg: AeBDiet9nllpcu4+yvOC0s7m6Z08GX4wZvlOQNqGMeMbZB9XjB8vr2l5dhf/Bp9Pw4W
	QOOdwcXYy24RAkGvGdIL2Kq8TdT+sJeYCYXjgh1xc77IxuNzGTIuMWio1QWRL3YH9/WttNyHYtL
	h/xNqNDdUtx6AiYgeWjcKS/5GkiaBxZR8K8UGreMiuoHyCozv5IkFun6Rj+7CkgHApf7S1+rQWT
	bRaZtBY1NWOw+KWSJUvso/7AFykD0Dctj94T1WcLCswiRxfXjbf0W+KwSvCqtYmTpHx4QSiIcKZ
	/tOZKqFKKD8qYuwz/byASlfXe/f/0eFe6JWQtLBpYMNYG2/iO8RRkdzepWONPuRvLLSUx1ECPkE
	F2ntuty0vBEr+GNycdSH4Olrexbkx62IYrOVALLBvAMuesvLDiIjYvcnwpg9dr8MDdKU63HRaQr
	xyCdHliR1eKKvcEF2yHp6EjpQhU+RiIpCUdMVsLBfQTbVv8JIRx8qYF9jYwhoBkJHW
X-Received: by 2002:a05:6a00:2d88:b0:81f:4e1c:1d3b with SMTP id d2e1a72fcca58-82d0dd043bcmr3841580b3a.23.1775264412522;
        Fri, 03 Apr 2026 18:00:12 -0700 (PDT)
Received: from koskos-Default-string.tail0f993c.ts.net ([2409:11:3cc0:3700:7de6:bf03:20c5:a0a7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b3aaeesm7565306b3a.13.2026.04.03.18.00.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 18:00:11 -0700 (PDT)
From: Kosugi Souta <k.souta0926@gmail.com>
To: gregkh@linuxfoundation.org,
	johan@kernel.org,
	elder@kernel.org
Date: Sat,  4 Apr 2026 09:59:38 +0900
Message-ID: <20260404005939.116701-3-k.souta0926@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260404005939.116701-1-k.souta0926@gmail.com>
References: <2026033032-rethink-jogging-f3b0@gregkh>
 <20260404005939.116701-1-k.souta0926@gmail.com>
MIME-Version: 1.0
X-Spamd-Bar: --
X-MailFrom: k.souta0926@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: UPOX5NUNYJIYDFZEWPTSPHYLM6KKMF4Y
X-Message-ID-Hash: UPOX5NUNYJIYDFZEWPTSPHYLM6KKMF4Y
X-Mailman-Approved-At: Sat, 04 Apr 2026 09:40:36 +0000
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, k.souta0926@gmail.com
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v3 2/2] staging: greybus: fix alignment to match open parenthesis
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/UPOX5NUNYJIYDFZEWPTSPHYLM6KKMF4Y/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [2.09 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+mx:c];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[lists.linaro.org,lists.linux.dev,vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-0.089];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ksouta0926@gmail.com,greybus-dev-bounces@lists.linaro.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 0A23839A91A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Fix the checkpatch.pl check "Alignment should match open parenthesis"
by adjusting the indentation in authenticate.c.

Signed-off-by: Kosugi Souta <k.souta0926@gmail.com>
---
 drivers/staging/greybus/Documentation/firmware/authenticate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/Documentation/firmware/authenticate.c b/drivers/staging/greybus/Documentation/firmware/authenticate.c
index 0ef88b7d24de02..ba4b16b0455717 100644
--- a/drivers/staging/greybus/Documentation/firmware/authenticate.c
+++ b/drivers/staging/greybus/Documentation/firmware/authenticate.c
@@ -85,7 +85,7 @@ int main(int argc, char *argv[])
 	}
 
 	printf("Authenticated, result (%02x), sig-size (%02x)\n",
-		authenticate.result_code, authenticate.signature_size);
+	       authenticate.result_code, authenticate.signature_size);
 
 close_fd:
 	close(fd);
-- 
2.43.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
