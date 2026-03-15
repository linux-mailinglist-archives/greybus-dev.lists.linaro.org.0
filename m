Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mASoJDbpt2mzWwEAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Mon, 16 Mar 2026 12:27:50 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FDAD298A86
	for <lists+greybus-dev@lfdr.de>; Mon, 16 Mar 2026 12:27:50 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 19AF63F8E8
	for <lists+greybus-dev@lfdr.de>; Mon, 16 Mar 2026 11:27:49 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	by lists.linaro.org (Postfix) with ESMTPS id 506A43F70C
	for <greybus-dev@lists.linaro.org>; Sun, 15 Mar 2026 23:20:03 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=kR8UZ73y;
	spf=pass (lists.linaro.org: domain of oaroraetimis@gmail.com designates 209.85.128.48 as permitted sender) smtp.mailfrom=oaroraetimis@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4852fdb36a8so47563585e9.2
        for <greybus-dev@lists.linaro.org>; Sun, 15 Mar 2026 16:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773616802; x=1774221602; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Df2cbTHSLjGNi97ps33ixIYcO5hgiRbvTnx5Ikk0MHE=;
        b=kR8UZ73yMqPKTArZvvTtxYdwyfdBFfylKUPX0ygxQi0xUhbFMP3+hcNskeMJCKMaEj
         fdxw6Ynx7iVT5/JrnqUeqmgK5YBp1mAjFZyopqxxJtF9bNedSWUeBjuKS9f9g/3jUsxA
         ma9SfqrtuJ2NsOeW/qavc2JRg+Wh+qakdTgfxixRybfFpupse8yhPehraXLx3tNAx0lj
         4eaNKp7yaCnNKH/39zjRxYthe1KD9edi/+AkRcpUGkMPOVmd01lku4ypllxP8l3K+hPj
         cU7Q0rc64KD8vRG+RYAAaffdR7Qz3GukSaGvLFyF4O+zA51w6kA2PUNgWaLEPmUdXNth
         HU3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773616802; x=1774221602;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Df2cbTHSLjGNi97ps33ixIYcO5hgiRbvTnx5Ikk0MHE=;
        b=p+JJTkNYe8HQ3Iix1qVPPkMBYHxdPa5GHdwUbU+fjlIWo9ZbFPSEHaQrKbLw40+boF
         oUUT9Kc+atdL7VUmUh639osmZHsIqw9xfxQMhK+ejupIcx1rRPrw5KaQBfY0uGYGPKxw
         i9MZzlU38QvmQfOSQIODPnZDOioe/392L0do5jIp69IX+VMij7LkT+MlpfmJwhc/l3wv
         KSjL7/Q44ijfpNmn2HftZ+vH0Yu8OUNYs2biPwfjOpSZFOqLu7Ed9RR3c/k18mUaqEk1
         P9KKnCPmdjzdR1vXO1vloYEUkOgfbkOWZhhs/3kT27If2jtJkv+GN8cGxCnX3E9eQD0U
         pljg==
X-Gm-Message-State: AOJu0YwTGFFrEZpZwYeYjMDn63urwtkQF5TpunsSnbWNicBcX4+PDAXb
	4iITXK4y0Y80bya+qqylFqVgFm1T1+nS+oTNLIvvktfcw9i3tkGOiobK
X-Gm-Gg: ATEYQzzI5Js8F1IPU1sQhKdA8MOGyzqEfkxhAnjd7EtTwCEjYJ2g65bogPTCuf94qSm
	JCqMkWDrjvVWZS9a/5Ob/9D5XESnNiL6gai5zMm5hIN+w4Yuxmmb3UuHwHNaC8mAkJ/6Lxiab9F
	zJKdTbfTVcgDHvhMfFLyVRSixoiIZJPBE8Ykem0PJW6g7R8/22y6AtLbG4C9c6oKCej7cW0X/9x
	eNA6dlMRmfc1gZApIq6ri4EEXI9e2JIwKlyJ5q+toNPzgvABVu76QkYMxXR95RZqhRs8w35VfoJ
	uqbsuWf0DeUrZlKxrOgDzLTczzbOfr6lse5hlR8EN8SbMETnVUaa5ohf2lQESjkNunzwBHkE3KA
	xJaAGabeGX5QTZWg7nKAO7NocXF7dZ0Dg8Wlx8F3eSjfRoBDQ6bnwK+s4rgy3YubHdX5FIUK8ic
	F7fiWoFLDdGA4XNR2GOFXjif/1gNxXDUaAwYVuMX8rQDkTt/KL0AjabqfM3m7AE08=
X-Received: by 2002:a05:600c:8488:b0:480:1d0b:2d32 with SMTP id 5b1f17b1804b1-485566d6fd7mr153183055e9.12.1773616802090;
        Sun, 15 Mar 2026 16:20:02 -0700 (PDT)
Received: from OaroraEtimis.tail60902c.ts.net ([95.179.249.152])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe22529csm37662624f8f.31.2026.03.15.16.19.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 16:20:00 -0700 (PDT)
From: Oarora Etimis <oaroraetimis@gmail.com>
X-Google-Original-From: Oarora Etimis <OaroraEtimis@gmail.com>
To: vireshk@kernel.org,
	johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org
Date: Mon, 16 Mar 2026 07:19:49 +0800
Message-ID: <20260315231949.231320-1-OaroraEtimis@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: --
X-MailFrom: oaroraetimis@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: C5UOSB6BUSLF6OT4723O27FGVE7C7ASJ
X-Message-ID-Hash: C5UOSB6BUSLF6OT4723O27FGVE7C7ASJ
X-Mailman-Approved-At: Mon, 16 Mar 2026 11:27:47 +0000
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Oarora Etimis <OaroraEtimis@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v2 2/2] staging: greybus: bootrom: fix potential null pointer dereference
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/C5UOSB6BUSLF6OT4723O27FGVE7C7ASJ/>
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
	NEURAL_HAM(-0.00)[-0.856];
	FROM_NEQ_ENVFROM(0.00)[oaroraetimis@gmail.com,greybus-dev-bounces@lists.linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email]
X-Rspamd-Queue-Id: 1FDAD298A86
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

In gb_bootrom_get_firmware(), the 'fw' pointer could be NULL if the
function jumps to the 'unlock' label. The execution flow continues
into the 'queue_work' block where 'fw->size' is accessed, leading to
a null pointer dereference.

Fix this by adding a NULL check for 'fw' before accessing its members.

Signed-off-by: Oarora Etimis <OaroraEtimis@gmail.com>
---
Changes in v2:
- Rebased onto the latest staging-next branch to resolve merge conflicts.
- No logical code changes.

 drivers/staging/greybus/bootrom.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/bootrom.c b/drivers/staging/greybus/bootrom.c
index 83921d90c322..50c80475d241 100644
--- a/drivers/staging/greybus/bootrom.c
+++ b/drivers/staging/greybus/bootrom.c
@@ -298,7 +298,7 @@ static int gb_bootrom_get_firmware(struct gb_operation *op)
 
 queue_work:
 	/* Refresh timeout */
-	if (!ret && (offset + size == fw->size))
+	if (!ret && fw && (offset + size == fw->size))
 		next_request = NEXT_REQ_READY_TO_BOOT;
 	else
 		next_request = NEXT_REQ_GET_FIRMWARE;
-- 
2.47.3

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
