Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Y18FEhe0SGohswAAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Sat, 04 Jul 2026 09:19:51 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id BBAEE706EAD
	for <lists+greybus-dev@lfdr.de>; Sat, 04 Jul 2026 09:19:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=gmail.com header.s=20251104 header.b=qgELK+lp;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=gmail.com (policy=none);
	spf=pass (mail.lfdr.de: domain of "greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org" designates 44.210.186.118 as permitted sender) smtp.mailfrom="greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org"
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 3914440C30
	for <lists+greybus-dev@lfdr.de>; Sat,  4 Jul 2026 07:19:49 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	by lists.linaro.org (Postfix) with ESMTPS id A797E401F2
	for <greybus-dev@lists.linaro.org>; Sat,  4 Jul 2026 07:19:43 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-381891a9525so1026378a91.3
        for <greybus-dev@lists.linaro.org>; Sat, 04 Jul 2026 00:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783149583; x=1783754383; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qFAcIP7DOWAyvuQhvWswn0mxvtkPsgySjMfSxKhSxwk=;
        b=qgELK+lp/aV3o/r9jnBLirJO3PlgRdVotyrNiA5laozxKFvLzlJXaOJhZFNE9FjFP2
         T0vkaH7peNjYQRtfzCl+tiPnc63dH1bK9q4a4KyS9P8wWvUlUHIE5uQ5WSL0Trll8p6u
         2WCkMGd18YpFUNCn1fGzV7LzN3aIoSse6CQumhB89PEO1QTZsv/Zhnu51+MNaVioChtc
         dfmheMz4RtEHfqAJ1xtwZEIOgobyFbT8aKpsc6VuUdC0Kzry7/NzS90xRf37gBxUkVuK
         3oIf1wTRjiWk6kPKsuYDkhVwSqzbvB2DzwjdPDu20+KIMMRFwv2QNO5sglYt8eoI60GR
         k2Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783149583; x=1783754383;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qFAcIP7DOWAyvuQhvWswn0mxvtkPsgySjMfSxKhSxwk=;
        b=F+78ZrE1NAxre4Ugtir2sjWDcNf912DVHYA9GO4jgx7YPuWRnz8FfHeuLBBTh/pHN+
         0veLas99VCoyjcCHZ1qpMfsSxm1ggMrnfSM25Cewwksb4K2NF4gsNFdPHkZhjcdze7mg
         5MZ2g8NxpYihxiYYmMOG9tPNOfPa+XRvMNi8nQqjQiYdhuGGuF/HS0CbtAEJRGuFkyFz
         MlcQztQXXNKLD8x4HRDkdeDZwU64fRs90g2OT1234MKJb2AcnGV5q/O+enkBoltkiTqu
         i6NTpa5OwfGl69/0ZYLXIefq4gKTr49RdVtz4H9s8loah6b0wMQCZhf9+akO4iWKWhzw
         bYTw==
X-Gm-Message-State: AOJu0Yzq3enaOWq4eawq/7LhrCuF0qpTb5ub/z59awaVWWPg7nvslGhz
	75HyZsm1iVfJfIulNd0gcejg35OQ7JfwgyYTRp2/GIKXe6la1vF1XhUh
X-Gm-Gg: AfdE7cnuTW779Z5crouK4qZT1MtxPnfIrdRtvxTC32a1hB9gAb2Y7u7q9gXDvt2w8lz
	1NncsQQx6GBYvWRo3Q0nIbteufQK4svHs7CkW4Y6JUREaKjR4/9PFy7kFxGtXzAQ1+D4gGOhdoq
	TJWLruRp26Wzu0EcX4A4277WOgZYhLIA+Ehl9y8RVhlJIUTXF1ucgNYBCC/1o2MAkLcBdpNkO0q
	T0lIgLTSBgBEszt9CGUv4akj+Cn/HfKdHNfaLbjf6y+ov6bwFNuNjvysiWRUY/EIGhggxkmutpa
	Oc/0dEIaztAB7hZZBRjyvIqs2lB9DqnXF2gZOQkiChFc+EmIy7llDkKqzg8kbhdl7wLRDlOYPKd
	lc1HXPYQcKkKDGN0WSpMrEW0KMn45XNrXF1KgTgtUopc2qgItj3eXfrZqLPgaomFb5JjNpiEKFy
	lc6SGuN4+M3a0cCokaEy4tJuSPWyl0s08fZkw+mu46u1Cwzm4GOtcrOgI=
X-Received: by 2002:a17:90b:4c4c:b0:37f:9ce1:7366 with SMTP id 98e67ed59e1d1-3829f4f0e14mr2919837a91.28.1783149582517;
        Sat, 04 Jul 2026 00:19:42 -0700 (PDT)
Received: from kernel-dev.multipass ([49.36.101.14])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f3c8b19c7sm9420435eec.4.2026.07.04.00.19.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2026 00:19:41 -0700 (PDT)
From: adi25charis@gmail.com
To: vireshk@kernel.org,
	johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org
Date: Sat,  4 Jul 2026 12:49:26 +0530
Message-ID: <20260704071926.6606-1-adi25charis@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Spamd-Bar: --
Message-ID-Hash: DAWRWEMQYUDQYP2JHCFJDYNCXOVRQWFK
X-Message-ID-Hash: DAWRWEMQYUDQYP2JHCFJDYNCXOVRQWFK
X-MailFrom: adi25charis@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Aditya Chari S <adi25charis@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] staging: greybus: bootrom: power off module on timeout
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/DAWRWEMQYUDQYP2JHCFJDYNCXOVRQWFK/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.59 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+mx];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:vireshk@kernel.org,m:johan@kernel.org,m:elder@kernel.org,m:gregkh@linuxfoundation.org,m:greybus-dev@lists.linaro.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:adi25charis@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[adi25charis@gmail.com,greybus-dev-bounces@lists.linaro.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[lists.linaro.org,lists.linux.dev,vger.kernel.org,gmail.com];
	FROM_NEQ_ENVFROM(0.00)[adi25charis@gmail.com,greybus-dev-bounces@lists.linaro.org];
	DKIM_TRACE(0.00)[gmail.com:-];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,lists.linaro.org:from_smtp,lists.linaro.org:helo,lists.linaro.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BBAEE706EAD

From: Aditya Chari S <adi25charis@gmail.com>

Previously, when a firmware size request, get firmware request, or
ready-to-boot request from a module timed out, the driver would log
an error and free any firmware buffer, but left the module powered
on in a potentially inconsistent state.

Fix this by ejecting the module's interface via the SVC when a
timeout occurs, forcing it to be power-cycled and re-detected rather
than left in limbo.

Signed-off-by: Aditya Chari S <adi25charis@gmail.com>
---
 drivers/staging/greybus/bootrom.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/greybus/bootrom.c b/drivers/staging/greybus/bootrom.c
index 83921d90c..b564d2255 100644
--- a/drivers/staging/greybus/bootrom.c
+++ b/drivers/staging/greybus/bootrom.c
@@ -54,8 +54,12 @@ static void gb_bootrom_timedout(struct work_struct *work)
 	struct delayed_work *dwork = to_delayed_work(work);
 	struct gb_bootrom *bootrom = container_of(dwork,
 						  struct gb_bootrom, dwork);
-	struct device *dev = &bootrom->connection->bundle->dev;
+	struct gb_connection *connection = bootrom->connection;
+	struct device *dev = &connection->bundle->dev;
+	struct gb_interface *intf = connection->bundle->intf;
+	struct gb_svc *svc = connection->hd->svc;
 	const char *reason;
+	int ret;
 
 	switch (bootrom->next_request) {
 	case NEXT_REQ_FIRMWARE_SIZE:
@@ -82,7 +86,11 @@ static void gb_bootrom_timedout(struct work_struct *work)
 	free_firmware(bootrom);
 	mutex_unlock(&bootrom->mutex);
 
-	/* TODO: Power-off Module ? */
+	/* Power-off Module */
+	ret = gb_svc_intf_eject(svc, intf->interface_id);
+	if (ret)
+		dev_err(dev, "failed to eject interface %u (%d)\n",
+			intf->interface_id, ret);
 }
 
 static void gb_bootrom_set_timeout(struct gb_bootrom *bootrom,
-- 
2.53.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
