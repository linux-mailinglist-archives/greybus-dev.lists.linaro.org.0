Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mG6uJ3Q8nmkrUQQAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Wed, 25 Feb 2026 01:04:04 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 7601C18E417
	for <lists+greybus-dev@lfdr.de>; Wed, 25 Feb 2026 01:04:04 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 8C3A8404A3
	for <lists+greybus-dev@lfdr.de>; Wed, 25 Feb 2026 00:04:03 +0000 (UTC)
Received: from mail-244121.protonmail.ch (mail-244121.protonmail.ch [109.224.244.121])
	by lists.linaro.org (Postfix) with ESMTPS id 2FA724048B
	for <greybus-dev@lists.linaro.org>; Tue, 24 Feb 2026 18:55:06 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=pm.me header.s=protonmail3 header.b=dkujm8ee;
	spf=pass (lists.linaro.org: domain of hardik.phalet@pm.me designates 109.224.244.121 as permitted sender) smtp.mailfrom=hardik.phalet@pm.me;
	dmarc=pass (policy=quarantine) header.from=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1771959304; x=1772218504;
	bh=kxiMSX85FR0vHxuxYmk5tZWATlOkxSIi5aOd5/WnLM0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=dkujm8ee7Ata9gtdli/pM7KahdJMlCGjYPVi06KCxD6nx3OrmIuEGmmrBFdp2HhHk
	 ZL1WQzRSqRr3zdHii9Tr6+bz19/qGZM3N9kMBAJX6Yd5eSKYItkyvk6AMHC1qHw3zN
	 XqTKXGoz3XUFSMVMbK6bTEJcGUHCILDl+PBzRAEjQryC4mRAOjepC9n8Bd0t65ROQs
	 87neun0NLkqF0Ir1wrzamYmXKYfVt31362MIyp11X0MbUXQYIc6b4suRE3nkCevziy
	 Grmo3RkAhtp6yGepo11f8kEDY/Yw+g7w8Zz3d4h7QvOIELhj6lHLn2d/O0FVWEY27v
	 AnDMkq4fTpeFA==
Date: Tue, 24 Feb 2026 18:54:59 +0000
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Vaibhav Agarwal <vaibhav.sr@gmail.com>
From: Hardik Phalet <hardik.phalet@pm.me>
Message-ID: <20260224185421.824210-2-hardik.phalet@pm.me>
In-Reply-To: <20260224185421.824210-1-hardik.phalet@pm.me>
References: <20260224185421.824210-1-hardik.phalet@pm.me>
Feedback-ID: 166659585:user:proton
X-Pm-Message-ID: 8bc6976a10a119dab266dad39635e92155bcfb25
MIME-Version: 1.0
X-Spamd-Bar: ---
X-MailFrom: hardik.phalet@pm.me
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: N23ZBZFF4ZSQZ4X2Z7FI672CQ76QB6JX
X-Message-ID-Hash: N23ZBZFF4ZSQZ4X2Z7FI672CQ76QB6JX
X-Mailman-Approved-At: Wed, 25 Feb 2026 00:03:52 +0000
CC: Dan Carpenter <dan.carpenter@linaro.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Hardik Phalet <hardik.phalet@pm.me>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v3 1/2] staging: greybus: audio: remove unused gb_audio_manager_get_module()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/N23ZBZFF4ZSQZ4X2Z7FI672CQ76QB6JX/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.49 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[pm.me : SPF not aligned (strict),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[pm.me:s=protonmail3];
	MID_CONTAINS_FROM(1.00)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	GREYLIST(0.00)[pass,meta];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[linuxfoundation.org,gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.975];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_NEQ_ENVFROM(0.00)[hardik.phalet@pm.me,greybus-dev-bounces@lists.linaro.org];
	DKIM_TRACE(0.00)[pm.me:-];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	TAGGED_RCPT(0.00)[greybus-dev];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linaro.org:helo,lists.linaro.org:rdns,linaro.org:email]
X-Rspamd-Queue-Id: 7601C18E417
X-Rspamd-Action: no action

gb_audio_manager_get_module() has no in-tree callers. The previously
reported NULL dereference is therefore unreachable.

Remove the unused function to avoid carrying dead code.

Signed-off-by: Hardik Phalet <hardik.phalet@pm.me>
---
 drivers/staging/greybus/audio_manager.c | 12 ------------
 drivers/staging/greybus/audio_manager.h |  7 -------
 2 files changed, 19 deletions(-)

diff --git a/drivers/staging/greybus/audio_manager.c b/drivers/staging/greybus/audio_manager.c
index 27ca5f796c5f..118ada9b909b 100644
--- a/drivers/staging/greybus/audio_manager.c
+++ b/drivers/staging/greybus/audio_manager.c
@@ -105,18 +105,6 @@ void gb_audio_manager_remove_all(void)
 }
 EXPORT_SYMBOL_GPL(gb_audio_manager_remove_all);
 
-struct gb_audio_manager_module *gb_audio_manager_get_module(int id)
-{
-	struct gb_audio_manager_module *module;
-
-	down_read(&modules_rwsem);
-	module = gb_audio_manager_get_locked(id);
-	kobject_get(&module->kobj);
-	up_read(&modules_rwsem);
-	return module;
-}
-EXPORT_SYMBOL_GPL(gb_audio_manager_get_module);
-
 void gb_audio_manager_put_module(struct gb_audio_manager_module *module)
 {
 	kobject_put(&module->kobj);
diff --git a/drivers/staging/greybus/audio_manager.h b/drivers/staging/greybus/audio_manager.h
index be605485a8ce..c3ef62ee22c8 100644
--- a/drivers/staging/greybus/audio_manager.h
+++ b/drivers/staging/greybus/audio_manager.h
@@ -54,13 +54,6 @@ int gb_audio_manager_remove(int id);
  */
 void gb_audio_manager_remove_all(void);
 
-/*
- * Retrieves a gb_audio_manager_module_descriptor for the specified id.
- * Returns the gb_audio_manager_module_descriptor structure,
- * or NULL if there is no module with the specified ID.
- */
-struct gb_audio_manager_module *gb_audio_manager_get_module(int id);
-
 /*
  * Decreases the refcount of the module, obtained by the get function.
  * Modules are removed via gb_audio_manager_remove
-- 
2.53.0


_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
