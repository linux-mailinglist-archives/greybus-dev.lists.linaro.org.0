Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kKxcB0M8wWkZRwQAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Mon, 23 Mar 2026 14:12:35 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id D45962F2948
	for <lists+greybus-dev@lfdr.de>; Mon, 23 Mar 2026 14:12:34 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id F3B7B401BB
	for <lists+greybus-dev@lfdr.de>; Mon, 23 Mar 2026 13:12:33 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	by lists.linaro.org (Postfix) with ESMTPS id D48F23F719
	for <greybus-dev@lists.linaro.org>; Mon, 23 Mar 2026 03:10:42 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b="hcxB/7Ml";
	spf=pass (lists.linaro.org: domain of k.souta0926@gmail.com designates 209.85.210.178 as permitted sender) smtp.mailfrom=k.souta0926@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-82c20b9fb16so793581b3a.0
        for <greybus-dev@lists.linaro.org>; Sun, 22 Mar 2026 20:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774235442; x=1774840242; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/0NMOz25SxriesEm3lplSiISeq9tICGAAYq075smODk=;
        b=hcxB/7MlT0RhZJqorixRY0IJgUb1cGQm/vYUJ76HF4CVqkr71rZu/DsNcimvCxBwK9
         sxNmjTz9cZMaDk0SBmkVITUKMkReNqrKZd0umjfY4n6kVgu6qthuojnAigK8PtTzxKSi
         KUQ36ubOWYYracqjqu5olSIvRtcNE/rbts7vF3EPVPQTfdiy0/Lo/HHJalViiL8AzPUQ
         IM9t0ZM1SE7cov08ITrM4JW2bme6zVFciaecmbTCrZ5L1kyLYJhz66OZCNQeeXsXkyUM
         pRpwaRjCytAbJms3F4Hr1NxcqkLQ1Ze/6WSceHeNAsO40Q2qi66XnkwT5fqvu/igCUgP
         tdyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774235442; x=1774840242;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/0NMOz25SxriesEm3lplSiISeq9tICGAAYq075smODk=;
        b=ee0w2eO8IwdAxfXY0QeLUQ0H2jYxU+CvFuzMYZZLePaHic06N5tm2lMi5xmZFNV+8e
         quQSVcaIducwEt4NziTdixsLHOQqrtxfwyhu7iOj5bxVkB1peJMualVcem7BrjoKB2K1
         SKego1MBzeIw4xWaRPiGlPtaEdsGlRcuP8K94jojPzbbYL9hz7OPWlKOeKYqRJ2oy5OS
         l87ZeCGPSvEfCeWXs/NyvcZ4RqQHI9tIxyko3nXUxJwy8cH+LdnSxrHdIUQRkbnwRo1V
         8ZZ31DE62tWqNgzG6pscPviZaLb6OunufB5bYw+oe2CjeDnar0vldaYQ5HndV7xGcjtZ
         gIrg==
X-Gm-Message-State: AOJu0YzoBeQumVlN/6QjB8geyZeEDc/fJSRZjnLwIfjnvTlHzg9bUcN2
	SYiSmXwEt3QvZkygKL8dNBMsioPK6tc2fJjkqNHYOzITSmJAKuZea1nG
X-Gm-Gg: ATEYQzynDrmnH2GWgJ0OSn1sHxDrUYOf4TdiNUcPX5p6I9g2pS7oseOp7O+mKscSzH4
	obYqv23u4QzwyNHs+GWWv0rtv2sCG8vsAIBRecqfsgS7x6RB9aYC/UTFo5hDVITZgng+sK1MDZo
	JG9UsAwpF+SzSBznuUongp0USrD0jBViP0qgQeguhQdixE/KLDYjNOmWyt3mmLYy6ZXvhR7GOzk
	lMpz1UBhcf21VZ+r9mmN60immES+R6CMU68alK6gKchaT+pHf5L1lzh6AZTjsgOMM/1sUvxwLNF
	u8n5dITDOT8TqdsNMLU7FJt8Y9JbkXjD5Xot/7UfYFNc79P4EemRojTDv4U9SR13DgRHAw7xEZr
	36l7lEWkr8nj+s3znTNs1PmcTLLTjgdtfP7l59zrocBRd14lLv6uMkgwjCetxc2j4+q9/TGM13N
	+1bN5V+9KDUw/k47jYwF8VAyvl8grBQjy/7QcB5q5KE41E5tl3yh5oRmXZKjAk3BIK9vjKJw==
X-Received: by 2002:a05:6a00:bc93:b0:824:98c5:ce77 with SMTP id d2e1a72fcca58-82a8c248173mr7708706b3a.7.1774235441758;
        Sun, 22 Mar 2026 20:10:41 -0700 (PDT)
Received: from study-kernel.. (46.132.178.217.shared.user.transix.jp. [217.178.132.46])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b040debf9sm7947058b3a.47.2026.03.22.20.10.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 20:10:41 -0700 (PDT)
From: Kosugi Souta <k.souta0926@gmail.com>
To: johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org
Date: Mon, 23 Mar 2026 03:10:17 +0000
Message-Id: <20260323031017.3650-1-k.souta0926@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Spamd-Bar: --
X-MailFrom: k.souta0926@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: EVVNUXUX6NQFC3BI3ZE3NPSLWGFWUHKL
X-Message-ID-Hash: EVVNUXUX6NQFC3BI3ZE3NPSLWGFWUHKL
X-Mailman-Approved-At: Mon, 23 Mar 2026 13:12:28 +0000
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, k.souta0926@gmail.com
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] staging: greybus: authenticate: fix alignment and type warning
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/EVVNUXUX6NQFC3BI3ZE3NPSLWGFWUHKL/>
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
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx:c];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[lists.linaro.org,lists.linux.dev,vger.kernel.org,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.993];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ksouta0926@gmail.com,greybus-dev-bounces@lists.linaro.org];
	DKIM_TRACE(0.00)[gmail.com:-];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,checkpatch.pl:url]
X-Rspamd-Queue-Id: D45962F2948
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Fix the following checkpatch.pl warning and check:
- Warning: Prefer 'unsigned long long' over 'unsigned long long int'
- Check: Alignment should match open parenthesis

Signed-off-by: Kosugi Souta <k.souta0926@gmail.com>
---
 drivers/staging/greybus/Documentation/firmware/authenticate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/greybus/Documentation/firmware/authenticate.c b/drivers/staging/greybus/Documentation/firmware/authenticate.c
index 3d2c6f88a138..ba4b16b04557 100644
--- a/drivers/staging/greybus/Documentation/firmware/authenticate.c
+++ b/drivers/staging/greybus/Documentation/firmware/authenticate.c
@@ -58,7 +58,7 @@ int main(int argc, char *argv[])
 		goto close_fd;
 	}
 
-	printf("UID received: 0x%llx\n", *(unsigned long long int *)(uid.uid));
+	printf("UID received: 0x%llx\n", *(unsigned long long *)(uid.uid));
 
 	/* Get certificate */
 	printf("Get IMS certificate\n");
@@ -85,7 +85,7 @@ int main(int argc, char *argv[])
 	}
 
 	printf("Authenticated, result (%02x), sig-size (%02x)\n",
-		authenticate.result_code, authenticate.signature_size);
+	       authenticate.result_code, authenticate.signature_size);
 
 close_fd:
 	close(fd);
-- 
2.34.1

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
