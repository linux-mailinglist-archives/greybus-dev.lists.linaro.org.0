Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oNtrJ4WOhGl43QMAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Thu, 05 Feb 2026 13:35:17 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 253B4F299C
	for <lists+greybus-dev@lfdr.de>; Thu, 05 Feb 2026 13:35:17 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id B5E8540175
	for <lists+greybus-dev@lfdr.de>; Thu,  5 Feb 2026 12:35:15 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	by lists.linaro.org (Postfix) with ESMTPS id 4D7733F799
	for <greybus-dev@lists.linaro.org>; Thu,  5 Feb 2026 03:34:15 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=PsuNwvAp;
	spf=pass (lists.linaro.org: domain of neelb2403@gmail.com designates 209.85.160.179 as permitted sender) smtp.mailfrom=neelb2403@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-5013d163e2fso6361321cf.0
        for <greybus-dev@lists.linaro.org>; Wed, 04 Feb 2026 19:34:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770262455; x=1770867255; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=d61n7HxTXPgkp/RcfIbsA3Xy8ZsyJxLiUSY6lHZjydM=;
        b=PsuNwvAp05/+bir2eFKaHagvVoPiVh+/evoAboItnay/0WPeMSf+Y2//aUYZWQW7qC
         u4NDJ3ksPj+fg/VTebNtZBb2uP9HKJUKhfnwhAWypyOIoeNcI2JiHsXYRN84tyh6lRBI
         Sk+rxQJiZfe3kJaK44qekPlh3tT23cDFQVMvQMtvldtARQLsy3YayZlS+H+qHCgj3/yd
         YyTdJKbv7/mPRF2zjZdgV7Gdjp7OP1kDtBzXS6MyqeU96wEjjlkhDYil2qg3+Koslb+d
         kxmbRztJEXBPmejUlJsrxvGoZmxmoBZ7+P1OAFRh2+OfeAZeXOkJczZ0Qr35z3BZ3qLC
         41Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770262455; x=1770867255;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d61n7HxTXPgkp/RcfIbsA3Xy8ZsyJxLiUSY6lHZjydM=;
        b=dPaul/lj29mzkwe/bGJiiU7LFgjlpp70CTf+LjgAKCNZ4SHlQig6vo2bJCz/AMYpQt
         fHduhBtwslYFiWZS2ad4DvplO2/hjGs6s242OoZp2zyWlhmRKZA/7g96PbxSu1f/1PS7
         TjnbZ6DE2uMeCdW3YLkGJL+yO1dzw4epbXJbpDvp3EDRsLZ2nNNwlZFk+b06GWzco1J8
         cIKD5wToa8w8t2ucBdvRPgnLUHwBQBvgmrOewCEi2QMBaHtQkBptE1Urgjvw4N/DvESe
         sXCNhEMEhO3orQyeG7p/Q4Udyoo91WhBVle3GaEzTiokRcXSLRe/WCSqWUxXDQTZGP+F
         QbIw==
X-Forwarded-Encrypted: i=1; AJvYcCV/10xJPBK3Z7A9mxJ6Wj/wAF+KeiW5Amk6MMcAc7umqPTiT8dkWEwvMgv+GBi9eK9uPFbJa+5OJ3yX/A==@lists.linaro.org
X-Gm-Message-State: AOJu0YwoMLtYtv/0s/8laD2IOAFdrUX1bVR0PgTQjPWmbYKh9+EYcb2z
	vuxk5bN1Vmi0TRCUnEfstlbrJoJcwn2ZWLOeg4n7RjQYtNbpRr7hBEI6
X-Gm-Gg: AZuq6aKcq50wvecJ4rTP3H154JMIVXAKEroJpHVb6FEL0pGZxKfRXcS83eotkMFPdwU
	qbBPKzMq79ySKS2bUOlNHvmJKUnBOaeSYoPN2JYJEwVYpdqmKgkBuw2KG4/NR/TwSLphW7ETb8C
	Z+4FuZUOQHc9cYzOjyFVzRvcxpOk69avj85OdzPVxYjgmU3Vdl6Y7d4gv2t/rvwa9dIC4jJUGxD
	xgXxajy4/lUWm6K/6ktFNXfmWakd0+jatTqCXivdZoKTWNFVoa9B98pDDeNiQp6LHCNaWb7kB/n
	6phHzYoueTyy60wXfaSE4g43/HSPz9PovwIcIuQRBd1eQpLIclZx3xZ7Gj53c3exIQA9o+visaB
	UMXlqZLabpdpulgG+K8vVTOrWavXddcqxa9yIGsnz7dfpnuLR+1ez0ciARDcjr7tWeyq36I/x8O
	Enm00jbP11rOryFuST5uw16EfwyzGz1Q==
X-Received: by 2002:ac8:7d92:0:b0:4ee:1dd0:5a47 with SMTP id d75a77b69052e-5061c1d010emr62182591cf.76.1770262454778;
        Wed, 04 Feb 2026 19:34:14 -0800 (PST)
Received: from localhost.localdomain ([50.21.71.60])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5061c147f42sm30275891cf.3.2026.02.04.19.34.12
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 04 Feb 2026 19:34:14 -0800 (PST)
From: Neel Bullywon <neelb2403@gmail.com>
To: Johan Hovold <johan@kernel.org>
Date: Wed,  4 Feb 2026 22:34:08 -0500
Message-ID: <20260205033408.86340-1-neelb2403@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Spamd-Bar: --
X-MailFrom: neelb2403@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: 4Y7OMI6DXTU57YRJVCFD2BSQLBU2UE3H
X-Message-ID-Hash: 4Y7OMI6DXTU57YRJVCFD2BSQLBU2UE3H
X-Mailman-Approved-At: Thu, 05 Feb 2026 12:35:11 +0000
CC: Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Neel Bullywon <neelb2403@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v3] [PATCH v3] staging: greybus: gbphy: Replace sprintf() with sysfs_emit()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/4Y7OMI6DXTU57YRJVCFD2BSQLBU2UE3H/>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linaro.org:helo,lists.linaro.org:rdns,linaro.org:email]
X-Rspamd-Queue-Id: 253B4F299C
X-Rspamd-Action: no action

Replace sprintf() with sysfs_emit() in the protocol_id_show() sysfs
attribute function. This code is safe as-is, but replace
sprintf() with sysfs_emit() because we are trying to get rid of calls
to sprintf() as part of kernel hardening; sysfs_emit() is more
appropriate in this context.

Signed-off-by: Neel Bullywon <neelb2403@gmail.com>
---
This was compile-tested only (no VM/hardware used)

Changes in v2:
- Subject: change to imperative "Replace" (was "Replaced").
- Wording and line breaks adjusted in the commit body for clarity.

Changes in v3:
- Clarify what "safe" means (buffer is PAGE_SIZE) per Dan Carpenter's
  suggestion.
- Reflow lines to avoid awkward breaks.
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
 

base-commit: de0674d9bc69699c497477d45172493393ae9007
-- 
2.44.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
