Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SB6lDXk8nmkrUQQAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Wed, 25 Feb 2026 01:04:09 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id F032518E41E
	for <lists+greybus-dev@lfdr.de>; Wed, 25 Feb 2026 01:04:08 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 1AC92404A7
	for <lists+greybus-dev@lfdr.de>; Wed, 25 Feb 2026 00:04:08 +0000 (UTC)
Received: from mail-106121.protonmail.ch (mail-106121.protonmail.ch [79.135.106.121])
	by lists.linaro.org (Postfix) with ESMTPS id 2C50C4048B
	for <greybus-dev@lists.linaro.org>; Tue, 24 Feb 2026 18:55:12 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=pm.me header.s=protonmail3 header.b=dWuZ2AfK;
	spf=pass (lists.linaro.org: domain of hardik.phalet@pm.me designates 79.135.106.121 as permitted sender) smtp.mailfrom=hardik.phalet@pm.me;
	dmarc=pass (policy=quarantine) header.from=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1771959310; x=1772218510;
	bh=Kl8cL99lfSpUtDgg6mYNf0ILtuKuuEtwDU8t89wUAlk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=dWuZ2AfKQmaXikae5oESe0j40qUqHOPM2CvUb01cHe+o5ofU9HmJqGxaansJDVTJE
	 Oia6dJUttjuuMuvHXyNvwVTTfN/xqsXAldwnLTrBTw4pGXYKp8iy1jEN++VWsFtsI6
	 JZ7mSrk3Tqrn8m23xbOUI8YfdlxmHavT44Wq48PTUMMr2gT2twimmQ9jBNDiGhN0Mg
	 VTPYtymUHCHOVZg8X904zWQS5oOH1djI9N4fdXtjIkwNrA7RyjTjDTMN3RRUbN3IB3
	 dutewSYsAcA9J6Q8XyBKeMpU0dwOUlVkxQTkrmRdGzPUnydhpaintxKbwrCn8as7dn
	 wh6alJJW2WFuA==
Date: Tue, 24 Feb 2026 18:55:07 +0000
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Vaibhav Agarwal <vaibhav.sr@gmail.com>
From: Hardik Phalet <hardik.phalet@pm.me>
Message-ID: <20260224185421.824210-3-hardik.phalet@pm.me>
In-Reply-To: <20260224185421.824210-1-hardik.phalet@pm.me>
References: <20260224185421.824210-1-hardik.phalet@pm.me>
Feedback-ID: 166659585:user:proton
X-Pm-Message-ID: 3bceb23eaaa3ac5046980882608cdb28ad275398
MIME-Version: 1.0
X-Spamd-Bar: ---
X-MailFrom: hardik.phalet@pm.me
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: TUCEDVZS6USIAMGAZAYUBQ7CHDGR5GSB
X-Message-ID-Hash: TUCEDVZS6USIAMGAZAYUBQ7CHDGR5GSB
X-Mailman-Approved-At: Wed, 25 Feb 2026 00:03:52 +0000
CC: Dan Carpenter <dan.carpenter@linaro.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Hardik Phalet <hardik.phalet@pm.me>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v3 2/2] staging: greybus: audio: drop stale TODO comment
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/TUCEDVZS6USIAMGAZAYUBQ7CHDGR5GSB/>
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
	NEURAL_HAM(-0.00)[-0.976];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_NEQ_ENVFROM(0.00)[hardik.phalet@pm.me,greybus-dev-bounces@lists.linaro.org];
	DKIM_TRACE(0.00)[pm.me:-];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	TAGGED_RCPT(0.00)[greybus-dev];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,lists.linaro.org:helo,lists.linaro.org:rdns]
X-Rspamd-Queue-Id: F032518E41E
X-Rspamd-Action: no action

Modules are removed from modules_list in gb_audio_manager_remove() and
gb_audio_manager_remove_all() before kobject_put(). The TODO suggesting
list deletion in the kobject release callback is stale and misleading.

Signed-off-by: Hardik Phalet <hardik.phalet@pm.me>
---
 drivers/staging/greybus/audio_manager_module.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/greybus/audio_manager_module.c b/drivers/staging/greybus/audio_manager_module.c
index e87b82ca6d8a..97d67989b181 100644
--- a/drivers/staging/greybus/audio_manager_module.c
+++ b/drivers/staging/greybus/audio_manager_module.c
@@ -69,7 +69,6 @@ static void gb_audio_module_release(struct kobject *kobj)
 	struct gb_audio_manager_module *module = to_gb_audio_module(kobj);
 
 	pr_info("Destroying audio module #%d\n", module->id);
-	/* TODO -> delete from list */
 	kfree(module);
 }
 
-- 
2.53.0


_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
