Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 208548FD14B
	for <lists+greybus-dev@lfdr.de>; Wed,  5 Jun 2024 16:59:27 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 22C61447B0
	for <lists+greybus-dev@lfdr.de>; Wed,  5 Jun 2024 14:59:26 +0000 (UTC)
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	by lists.linaro.org (Postfix) with ESMTPS id A3B36400D9
	for <greybus-dev@lists.linaro.org>; Wed, 29 May 2024 00:18:11 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=treblig.org header.s=bytemarkmx header.b=cxf8GghL;
	spf=pass (lists.linaro.org: domain of linux@treblig.org designates 46.235.229.95 as permitted sender) smtp.mailfrom=linux@treblig.org;
	dmarc=pass (policy=none) header.from=treblig.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=IJ817xnZCKNz/dtqhIBDZKs2MR8zd1jtPZ+X3nIbEYo=; b=cxf8GghLG6NtRN4Z
	BebRiX7gsuwLjC+Z08V5707jOjcXDDLOOla8Bep6QRfxcEFRoaU0MLR8ID4h0JmUyhzP1LMINZuFI
	aSaegwzUxjUW7k8ckne/I5SRgpyfv5H7nOjpwzZZjIEzUEwaG5EPOj/lOePIyVuHrStdjYapy/1sr
	v7mZ3DBsAOQGdMzn5uHfhJVCN7xggV6Vkvk5e0in1tjfMRXwMxLAEYeT+eAE9Di6KqxQcosZEU95s
	bm5OfMSaXlV5VZa/wYE1wFt2VfYrzju29UexNWV/VJsQajTvoG+F0R1E0Cs3sSK+ZHz/7nxn426qp
	/aSK/vFtIJp2NMcuZA==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1sC717-0034S3-06;
	Wed, 29 May 2024 00:18:09 +0000
From: linux@treblig.org
To: vaibhav.sr@gmail.com,
	johan@kernel.org
Date: Wed, 29 May 2024 01:18:07 +0100
Message-ID: <20240529001807.262955-1-linux@treblig.org>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: A3B36400D9
X-Spamd-Bar: /
X-Spamd-Result: default: False [-0.90 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[treblig.org,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[treblig.org:s=bytemarkmx];
	R_SPF_ALLOW(-0.20)[+mx];
	ONCE_RECEIVED(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	ASN(0.00)[asn:44684, ipnet:46.235.224.0/21, country:GB];
	RCVD_COUNT_ONE(0.00)[1];
	FROM_NO_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	TAGGED_RCPT(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[treblig.org:+]
X-MailFrom: linux@treblig.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: L6FATGBWA3FOHSOLB4EMWZB5HYNESZ22
X-Message-ID-Hash: L6FATGBWA3FOHSOLB4EMWZB5HYNESZ22
X-Mailman-Approved-At: Wed, 05 Jun 2024 14:59:19 +0000
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, "Dr. David Alan Gilbert" <linux@treblig.org>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] greybus: audio: remove unused struct gb_mixer_control
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/L6FATGBWA3FOHSOLB4EMWZB5HYNESZ22/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: "Dr. David Alan Gilbert" <linux@treblig.org>

'gb_mixer_control' is unused since the original
commit 6339d2322c47 ("greybus: audio: Add topology parser for GB
codec").

Remove it.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/staging/greybus/audio_topology.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/staging/greybus/audio_topology.c b/drivers/staging/greybus/audio_topology.c
index 5dc4721105d4..6ca938dca4fd 100644
--- a/drivers/staging/greybus/audio_topology.c
+++ b/drivers/staging/greybus/audio_topology.c
@@ -10,12 +10,6 @@
 
 #define GBAUDIO_INVALID_ID	0xFF
 
-/* mixer control */
-struct gb_mixer_control {
-	int min, max;
-	unsigned int reg, rreg, shift, rshift, invert;
-};
-
 struct gbaudio_ctl_pvt {
 	unsigned int ctl_id;
 	unsigned int data_cport;
-- 
2.45.1

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
