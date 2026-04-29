Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gHeyALG78Wl1kAEAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Wed, 29 Apr 2026 10:05:05 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 018ED490F2A
	for <lists+greybus-dev@lfdr.de>; Wed, 29 Apr 2026 10:05:02 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 9D9EF4049D
	for <lists+greybus-dev@lfdr.de>; Wed, 29 Apr 2026 08:05:01 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	by lists.linaro.org (Postfix) with ESMTPS id 0DFA43F843
	for <greybus-dev@lists.linaro.org>; Wed, 29 Apr 2026 03:39:23 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="b2xmhb/J";
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (lists.linaro.org: domain of mahamaryamjavaid@gmail.com designates 209.85.222.178 as permitted sender) smtp.mailfrom=mahamaryamjavaid@gmail.com
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-8ee7ffd738dso45309885a.1
        for <greybus-dev@lists.linaro.org>; Tue, 28 Apr 2026 20:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777433962; x=1778038762; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+L1a7jyZYhhK5p542c3awu/J5rGSKpQ5in/Psz4Xqno=;
        b=b2xmhb/JVzaSGt2aOfKN0BonO3+54mV3ha5zzbbrhrzc4Z6CLxkaWdhsnQEgy19uwC
         9aMkWLjckwUrvscqGONhm5vfjRpzkSENp5/W5KRh7RUbYxYK26TLgYxbnPOJ0iZCduLi
         8JF81lkoH0GJHdcZDwGKhGfT4UiU9UyKUvFr+CFRD6nQFFUN6ZpAaa4VFztpr7VjbU6K
         UKMh8YXBRbGdTvv9Odh4iV23DPR5Ot2GyMWIoQsKgLVy5/VEHkBHqpUmmQdmFaBaH7uX
         ZdaZYrG30DJDYvfjN41a9oEOno50b5lt9sj5kllGKfIVHcAM7cwLoKf9ullWmG4BWICE
         2HIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777433962; x=1778038762;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+L1a7jyZYhhK5p542c3awu/J5rGSKpQ5in/Psz4Xqno=;
        b=JtdloZ1d1Fc/xgzE1gn7O2790ANslLMb5gjIB032ZcyCvNcjBg9pZlk2RaeXH3noPO
         VRw5SslcRebhYrblh0SckpPl/8eI226EzO008AKRynRxBSFME23Jg57KfNS2DaAn56Il
         cv2iFs7b/DvMFVVO4Va34puYoEC2tN4CDti3ZvUjoWSJ2gX47EhuBjZXSD+2hZrtDPmv
         sgy8B4vybmGa7LWqXq0+Ss69MtPT8FBXvuDS/S33qRmW1W4llHgJ7WNR9+hmNwh3eLT0
         Z3nlj2201KNuBKgk49gVT2PPqD+qX/XO3xVxI8iIx7lAJOv208kVfaqk3RZscXoFKFhd
         fpvg==
X-Forwarded-Encrypted: i=1; AFNElJ+irH+wQObzLCelqhRldF0KmFISQgl84bF41o1UIR4ubmrj43jD9+0uC0kV4OtcGRRoa/LO3GkYSfGTXQ==@lists.linaro.org
X-Gm-Message-State: AOJu0YyFSxWtsSX/a/WefJ+zBWbFH66gWawHkOf6UWjLQGSVuK7LceF/
	KVngpdrI9K8An8JLLe+wREOmog+jGsK9Dky49ZtQZ4e1uykqAZH8gJ+4
X-Gm-Gg: AeBDieubZGU5Wp4QNALU2NYq70FzhK5Vu1ITl9VWoMKeT+qzEV6EHc+UzpAEorxtuQ8
	hliEWB1RUvCfkwmjHo6Jw19VCZRjHUXq8ak2gyQv4iAb8+IbMTRvPOPoTQor4RtLut8q/Tc7Qgt
	k7Yj2Al2KbVgtBoDT9Ha2phgxE0gfYt0pG2J1tz7OAvmtipg9QDR27xu089+wtKBARYkkvpFfBp
	fdegXL3FdJ3fQ0MNg6Ta2lcOPVxdVgQIjEJj/JYrgo0jQ2uosemhgbKF2XbIvlsndyzMDKyvQGE
	ztlCSBLayJKjVon+jIUJOK0LmhKecssAJ7rpSgUnA4yvLZk/mLd44E3fYM5uA5nbYf4EKTbDXYQ
	9mWQEnMTg/8QMgQSO4F53knlrd9ePnGJjcht1L/VX92Aoj11HdollUgKUXA9b3IrBpK9D9pcKXc
	g1f2qNX75UkoSPBSlIIPZn9nv33lIUDQktrNKYFY3RIHqtKG1wnN3SIQNrS9RFz3zM31mR
X-Received: by 2002:a05:622a:2508:b0:50d:6fd3:421 with SMTP id d75a77b69052e-51019d925abmr21360811cf.6.1777433962516;
        Tue, 28 Apr 2026 20:39:22 -0700 (PDT)
Received: from House.mynetworksettings.com ([2600:4040:2afb:6400:d695:5459:e421:6754])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5101ab30033sm7739901cf.0.2026.04.28.20.39.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 20:39:22 -0700 (PDT)
From: Maha Maryam Javaid <mahamaryamjavaid@gmail.com>
To: johan@kernel.org,
	elder@kernel.org
Date: Tue, 28 Apr 2026 23:38:16 -0400
Message-Id: <20260429033816.11282-1-mahamaryamjavaid@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Spamd-Bar: --
X-MailFrom: mahamaryamjavaid@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: KSYCJSZDSRP7ZQTCP5KLAMI7CM2YSN44
X-Message-ID-Hash: KSYCJSZDSRP7ZQTCP5KLAMI7CM2YSN44
X-Mailman-Approved-At: Wed, 29 Apr 2026 08:02:00 +0000
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Maha Maryam Javaid <mahamaryamjavaid@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] staging: greybus: fix typo in sysfs-bus-greybus
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/KSYCJSZDSRP7ZQTCP5KLAMI7CM2YSN44/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 018ED490F2A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.59 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx:c];
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
	NEURAL_HAM(-0.00)[-0.887];
	FROM_NEQ_ENVFROM(0.00)[mahamaryamjavaid@gmail.com,greybus-dev-bounces@lists.linaro.org];
	FREEMAIL_CC(0.00)[lists.linaro.org,lists.linux.dev,vger.kernel.org,gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	DKIM_TRACE(0.00)[gmail.com:-];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email]

Fix spelling mistake: attibute -> attribute

Signed-off-by: Maha Maryam Javaid <mahamaryamjavaid@gmail.com>
---
 drivers/staging/greybus/Documentation/sysfs-bus-greybus | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/Documentation/sysfs-bus-greybus b/drivers/staging/greybus/Documentation/sysfs-bus-greybus
index 2e998966cbe1..feeffe54a59b 100644
--- a/drivers/staging/greybus/Documentation/sysfs-bus-greybus
+++ b/drivers/staging/greybus/Documentation/sysfs-bus-greybus
@@ -26,7 +26,7 @@ Date:		March 2016
 KernelVersion:	4.XX
 Contact:	Greg Kroah-Hartman <greg@kroah.com>
 Description:
-		Writing a non-zero argument to this attibute disables the
+		Writing a non-zero argument to this attribute disables the
 		module's interfaces before physically ejecting it.
 
 What:		/sys/bus/greybus/devices/N-M/module_id
-- 
2.34.1

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
