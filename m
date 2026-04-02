Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MCaAGpbc0GniBQcAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Sat, 04 Apr 2026 11:40:38 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id E86D839A8CF
	for <lists+greybus-dev@lfdr.de>; Sat, 04 Apr 2026 11:40:37 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id DFD093F8F4
	for <lists+greybus-dev@lfdr.de>; Sat,  4 Apr 2026 09:40:36 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	by lists.linaro.org (Postfix) with ESMTPS id 8327C3F8FE
	for <greybus-dev@lists.linaro.org>; Thu,  2 Apr 2026 05:12:00 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="ddHa/gaZ";
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (lists.linaro.org: domain of k.souta0926@gmail.com designates 209.85.214.178 as permitted sender) smtp.mailfrom=k.souta0926@gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2addb31945aso3284845ad.1
        for <greybus-dev@lists.linaro.org>; Wed, 01 Apr 2026 22:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775106720; x=1775711520; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GGR82kGYzGlH/A5fjJKTpbsPbkO6bEvdVL/ff0kNtwY=;
        b=ddHa/gaZ5SMjvkcgRBIE5UqOyrmG5Sc6/UuF98qxwKFDNgVMeDeKdDoMQzXT8aXp/J
         aKlEc7voLzg91tWgFm/zdQ+WPBJM/zSHFQokbrFcaf/Ya+4ISbGSXSI8xxhAwKz60w22
         6rkdZEC1rpvUykXf9hh0Ss58WeioYr1kv8Oskob9/T+cdHgKNlgA4UJ/+jys9cJdWCHu
         5hroob40Hfc7XZIQEinDgwEJfjVHAjdDbbmth2NDqkN+KxjtVECuR7xSaVIL05zzcdFg
         5yYItDmbBrxcymw02GDEk7QGSjwrPjFmuHn1UFa37CUyxzVKsYq7jg+xfoEb7923JQ2W
         yRVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775106720; x=1775711520;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GGR82kGYzGlH/A5fjJKTpbsPbkO6bEvdVL/ff0kNtwY=;
        b=bn6E1jSGnwiYRRYdY+CoVbqXeFE36hqejOlndVawIIbY1FGeiibyUkQ7AxYIlnL/Xi
         9AwFydb7pviP1xkCMJMQXdjlsRxstLgoHomP1zkwLodyXlYN0DVEAmAJFFHjVDnu9gJf
         n6TftvLekfVXT9iyQJCeqB19nmnYYY1B/NVE6hL+Y6R9vupUMQZUUDQITo0oJibBGIVD
         EuwninzBnAGqrTy3Y7HUOAetbVXgkLWYijlNjLMWctLUqZVUnx8AaKvkBRzuR98mAzWx
         qu8vzWIgebsQhmBi/CjEN9Jh+7JXVNHaLA6++Kflkc9Yb8SUvjz8O6rQ1R4zcio9Wegw
         927Q==
X-Gm-Message-State: AOJu0YxgX24K7p+2qp/VsIpTNpTG0DUOCNe+q619yHjHIqG+3+WjTFqj
	NTEAlAqH1SUOw1AG6jNGme9CPaMIxSfeWUlTk7I3W+ttiQ+TJkdeS6jR
X-Gm-Gg: AeBDieuiY+jWIZG6yOqUx9LPci2+3n56KMnUS+G2/E0Ah+hX12OXd4TEWCFS9ZV45En
	e419mhuOrtQYk+2qR2Rzp3/G0W3zaW/Ve5suiYYxwIjcAyDDTIwLOaeU5kxAg5r9P1ZGx7NBH3N
	2zgvzCzZuRca75+eQExYATVqFlNVyF0+g64WAKAVL30+jNApx2iqsa1+34EkOu9xAk2L2N+NEEz
	U0KTj4+YJbP7c/D8w2ZW92YLgEhruvenldYAJ0oF9TxnPTmByB129lCKCKLQYwdob2keCeeIlqr
	q01hJ4uB0uyQYzrPUYu9zJbpUfzR6NCmb28qhH82A8e81b4pESHstxmyhnwp8H0ZETMqvTnF2Y+
	geLKwe03EInqh7pOkU0Rvn3TgAUahD/kfAa8gB3HHnAyNzmx1ZfaOJSjbJTGV+kyaWMKrzv+TDh
	3OaqDNkFoMStJ4LqT6ZgUpxjBWI+utxHRReUKby5ME6onbsSu93qYghmSYDC0KsQOp0SPohPQNO
	8Y=
X-Received: by 2002:a17:902:f642:b0:2b0:c451:ae8a with SMTP id d9443c01a7336-2b2758933a0mr18884395ad.13.1775106719694;
        Wed, 01 Apr 2026 22:11:59 -0700 (PDT)
Received: from koskos-Default-string.tail0f993c.ts.net ([2409:11:3cc0:3700:a459:5c89:eaa2:f305])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27472d54bsm14652405ad.1.2026.04.01.22.11.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 22:11:59 -0700 (PDT)
From: Kosugi Souta <k.souta0926@gmail.com>
To: gregkh@linuxfoundation.org,
	johan@kernel.org,
	elder@kernel.org
Date: Thu,  2 Apr 2026 14:11:24 +0900
Message-ID: <20260402051124.101197-3-k.souta0926@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260402051124.101197-1-k.souta0926@gmail.com>
References: <2026033032-rethink-jogging-f3b0@gregkh>
 <20260402051124.101197-1-k.souta0926@gmail.com>
MIME-Version: 1.0
X-Spamd-Bar: --
X-MailFrom: k.souta0926@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: 4RWP7TRTUDCXNUC4XZYIMSSAY6R6GLCK
X-Message-ID-Hash: 4RWP7TRTUDCXNUC4XZYIMSSAY6R6GLCK
X-Mailman-Approved-At: Sat, 04 Apr 2026 09:40:25 +0000
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, k.souta0926@gmail.com
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v2 2/2] staging: greybus: fix alignment to match open parenthesis
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/4RWP7TRTUDCXNUC4XZYIMSSAY6R6GLCK/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [3.09 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	DATE_IN_PAST(1.00)[52];
	R_SPF_ALLOW(-0.20)[+mx:c];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	FREEMAIL_CC(0.00)[lists.linaro.org,lists.linux.dev,vger.kernel.org,gmail.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-0.830];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ksouta0926@gmail.com,greybus-dev-bounces@lists.linaro.org];
	DKIM_TRACE(0.00)[gmail.com:-];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: E86D839A8CF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Signed-off-by: Kosugi Souta <k.souta0926@gmail.com>
---
 drivers/staging/greybus/Documentation/firmware/authenticate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/Documentation/firmware/authenticate.c b/drivers/staging/greybus/Documentation/firmware/authenticate.c
index 0ef88b7d24de0..ba4b16b045571 100644
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
