Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0CRKIJHc0GniBQcAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Sat, 04 Apr 2026 11:40:33 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C24C39A8C7
	for <lists+greybus-dev@lfdr.de>; Sat, 04 Apr 2026 11:40:33 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 527CC4044F
	for <lists+greybus-dev@lfdr.de>; Sat,  4 Apr 2026 09:40:32 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	by lists.linaro.org (Postfix) with ESMTPS id 64F043F8FE
	for <greybus-dev@lists.linaro.org>; Thu,  2 Apr 2026 05:11:47 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=gpJEXgrr;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (lists.linaro.org: domain of k.souta0926@gmail.com designates 209.85.214.178 as permitted sender) smtp.mailfrom=k.souta0926@gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2b24fcc2b5dso2722655ad.1
        for <greybus-dev@lists.linaro.org>; Wed, 01 Apr 2026 22:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775106706; x=1775711506; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qblWufffu4CarmNyKrjU8dBtzc7CIBINQdO/rvlz4/s=;
        b=gpJEXgrrEuBRQkASQjNB9b3jvVURYjzdiXxjyMzPiU9HDHzlfunuNH2qFkCIGBxeSI
         02pfVTVQ/FANhoE9cBNF0rx4iX7yHTG8oiP0Mi1ZkH9mXi6X2ezpd0pjanoQ3w2lMil1
         cI8ezs3CHvOXEfVffoOJ7Zs/j+B/8g1rO+WDRoKo44TdfNvPoPjAo6oRrR/MkDeUTrzD
         DBgFz77QKKrQ9i58Upzn0OPM2NR6AkCh0Z6WDttECe/aEThDDeEdVdv/TBp0RmcW2w2H
         3ocXa0KsGBy7l3adMeBuwmk8AIa/bugIByTXMk49sIvqHpcMRXLZHvoiZJL10j6MLFJV
         do+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775106706; x=1775711506;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qblWufffu4CarmNyKrjU8dBtzc7CIBINQdO/rvlz4/s=;
        b=IlpJVKzMEN128tIaypDcpjljiddQ8gMmK7V9xw09zBjDvAB9bT7LiJXDW06xLl3/iC
         gArCM/U0Y8kCnqGaFgfv2SNHYe9xn0w9pHK4POzRo1cgzXzvcBvXYb6IxKa3O1s4IZR6
         7kMc0LaPTRx3hssRrJVMphxg7hzewwwMI2b6DUnw/EY41YulURhAIL7X4qHgnj84A2Qu
         gB6CSaL6pYFaIWVnijL9cBStsF3OSgxrYdv0+7FHuEeNCPlUdehVZriye85e/tDwIv9j
         DYJnQT7GCdHm4feEy2jK83fDFpxNlSaTz6hvrKRXWdFBlJWJ5z1uj3y+gmwRjkrIYP//
         +pGQ==
X-Gm-Message-State: AOJu0Yz1+vAfJS251bIm+iMTT6oN/Ae/pZNVld7JIZlBXtMyvWyc5xJX
	e/04OGqwr5XiZCT33p8NzQqQb3jxgSpf4VAyeezhnAHEwr7ZAkNbsdwlgB19MU/lQZc=
X-Gm-Gg: AeBDievVZdEdBoMgxBQ16IFNjLmWN9mINNt8zqFfzzYfUi3YWukaoFBioYlOipbdoLn
	/f/j/ZFkgtRbc+IcBFuuxuTljUINXzUa32Q8o3RfhMtOGyhW1pb7y8qoAPpGys3X47xjkbTIDDj
	9HsVPOeRB4fXdyx8Ah/9950KuVl+/XGdA8YRGXs36AvR8uV/IKb8oN6+jDIWL0uLyd5ACo8HA58
	CbAZWOjb4Z703N+4+8pmFq5dPmJjDwTMwhGAXvatxkWFuc7OZULwvMBNjRNVE4/ahY7ejSX+PHC
	pXwavLlQjx9K6s11Y6Zr7nXAOvdckgnYJa9N9S5JxqYSqhF5gui1roYQXCH4NiPlO2oWhxGf7DS
	9RV3/cyUDdQYB6ShQgekyDec7xjLXvVa+DiuKtwOv+ApXeidWhLbFkstoaQC+4KKL0im4Tt6dzb
	1apfE1AOWU/LfscOCTORHBZZ0Xp0bxw1XoxJ5JyiJZxoSJ1R4jhaFWdqA0TlFhu9r5RmfsT/PMb
	+Q=
X-Received: by 2002:a17:902:ce0a:b0:2ab:230d:2d96 with SMTP id d9443c01a7336-2b2758a1137mr18240395ad.11.1775106706479;
        Wed, 01 Apr 2026 22:11:46 -0700 (PDT)
Received: from koskos-Default-string.tail0f993c.ts.net ([2409:11:3cc0:3700:a459:5c89:eaa2:f305])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27472d54bsm14652405ad.1.2026.04.01.22.11.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 22:11:46 -0700 (PDT)
From: Kosugi Souta <k.souta0926@gmail.com>
To: gregkh@linuxfoundation.org,
	johan@kernel.org,
	elder@kernel.org
Date: Thu,  2 Apr 2026 14:11:23 +0900
Message-ID: <20260402051124.101197-2-k.souta0926@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260402051124.101197-1-k.souta0926@gmail.com>
References: <2026033032-rethink-jogging-f3b0@gregkh>
 <20260402051124.101197-1-k.souta0926@gmail.com>
MIME-Version: 1.0
X-Spamd-Bar: --
X-MailFrom: k.souta0926@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: MHGRRYYKHAGXLETHI3UPSGVIHEOD46HV
X-Message-ID-Hash: MHGRRYYKHAGXLETHI3UPSGVIHEOD46HV
X-Mailman-Approved-At: Sat, 04 Apr 2026 09:40:25 +0000
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, k.souta0926@gmail.com
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v2 1/2] staging: greybus: fix unsigned long long type warning
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/MHGRRYYKHAGXLETHI3UPSGVIHEOD46HV/>
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
	NEURAL_HAM(-0.00)[-0.816];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ksouta0926@gmail.com,greybus-dev-bounces@lists.linaro.org];
	DKIM_TRACE(0.00)[gmail.com:-];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 5C24C39A8C7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Signed-off-by: Kosugi Souta <k.souta0926@gmail.com>
---
 drivers/staging/greybus/Documentation/firmware/authenticate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/Documentation/firmware/authenticate.c b/drivers/staging/greybus/Documentation/firmware/authenticate.c
index 3d2c6f88a138a..0ef88b7d24de0 100644
--- a/drivers/staging/greybus/Documentation/firmware/authenticate.c
+++ b/drivers/staging/greybus/Documentation/firmware/authenticate.c
@@ -58,7 +58,7 @@ int main(int argc, char *argv[])
 		goto close_fd;
 	}
 
-	printf("UID received: 0x%llx\n", *(unsigned long long int *)(uid.uid));
+	printf("UID received: 0x%llx\n", *(unsigned long long *)(uid.uid));
 
 	/* Get certificate */
 	printf("Get IMS certificate\n");
-- 
2.43.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
