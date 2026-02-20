Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YMGQOSQfmGn0AgMAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Fri, 20 Feb 2026 09:45:24 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 88DFA165DF1
	for <lists+greybus-dev@lfdr.de>; Fri, 20 Feb 2026 09:45:24 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 9B1CD402B4
	for <lists+greybus-dev@lfdr.de>; Fri, 20 Feb 2026 08:45:23 +0000 (UTC)
Received: from mail-106118.protonmail.ch (mail-106118.protonmail.ch [79.135.106.118])
	by lists.linaro.org (Postfix) with ESMTPS id 263933F797
	for <greybus-dev@lists.linaro.org>; Fri, 20 Feb 2026 06:30:25 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=pm.me header.s=protonmail3 header.b=pvUhB9MJ;
	spf=pass (lists.linaro.org: domain of hardik.phalet@pm.me designates 79.135.106.118 as permitted sender) smtp.mailfrom=hardik.phalet@pm.me;
	dmarc=pass (policy=quarantine) header.from=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1771569023; x=1771828223;
	bh=F0mFdNaR5Emio3Yo+Hu3GkUWq/x3e2P48hGEO44QrW0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=pvUhB9MJVV8YPa0LRjR3PDP5ceFl/sP/evZmR7Bagc+UCaekMDFhky65rsMGVkukP
	 eUGpzw1Fxsb7J1rKIMIUVAflY9k4MV3cPCGUsUDNTW6giYQYO4xXwLKAGh8KaddZ+O
	 Gxpimq+/YT8u8qqgcJNkFvBADy9SqrmtfoWvK7nFNdZg7WM+BzL3Mo+Tl5d5or9tXE
	 dkfarUmLWgtHZHbn08wrW74zMw7ZXKsTEuIj+NJPjjFw5tG9G+fbO1PUYt13HHWKqy
	 JHFkzBshG+Yzyk1V1RqcYr1hJuRnhoK27eTSOY0u/UapjOYuyenE7v7NUOMmfnKhHO
	 bcfGGTTpCjIjw==
Date: Fri, 20 Feb 2026 06:30:20 +0000
To: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
From: Hardik Phalet <hardik.phalet@pm.me>
Message-ID: <20260220062741.399677-3-hardik.phalet@pm.me>
In-Reply-To: <20260220062741.399677-1-hardik.phalet@pm.me>
References: <20260220062741.399677-1-hardik.phalet@pm.me>
Feedback-ID: 166659585:user:proton
X-Pm-Message-ID: ecf394c129eea227a6197263e843479041a8442e
MIME-Version: 1.0
X-Spamd-Bar: ---
X-MailFrom: hardik.phalet@pm.me
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: NWBUWXBOVFE6F56FUMZNBVEVDVVDXRIJ
X-Message-ID-Hash: NWBUWXBOVFE6F56FUMZNBVEVDVVDXRIJ
X-Mailman-Approved-At: Fri, 20 Feb 2026 08:44:54 +0000
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Hardik Phalet <hardik.phalet@pm.me>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v2 2/2] staging: greybus: audio: drop stale TODO in module release
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/NWBUWXBOVFE6F56FUMZNBVEVDVVDXRIJ/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.99 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[pm.me : SPF not aligned (strict),quarantine];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[pm.me:s=protonmail3];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[pm.me:-];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_NEQ_ENVFROM(0.00)[hardik.phalet@pm.me,greybus-dev-bounces@lists.linaro.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.994];
	TAGGED_RCPT(0.00)[greybus-dev];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,lists.linaro.org:helo,lists.linaro.org:rdns,pm.me:mid,pm.me:email]
X-Rspamd-Queue-Id: 88DFA165DF1
X-Rspamd-Action: no action

Modules are removed from modules_list in gb_audio_manager_remove() and
gb_audio_manager_remove_all() before kobject_put(). The TODO suggesting
list deletion in the kobject release callback is stale and misleading.

Signed-off-by: Hardik Phalet <hardik.phalet@pm.me>
---
 drivers/staging/greybus/audio_manager_module.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/greybus/audio_manager_module.c b/drivers/staging/greybus/audio_manager_module.c
index 4a4dfb42f50f..b1dd3da9f57c 100644
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
