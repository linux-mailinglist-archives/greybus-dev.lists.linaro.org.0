Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gH9XCCAfmGn0AgMAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Fri, 20 Feb 2026 09:45:20 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id EF1CF165DE9
	for <lists+greybus-dev@lfdr.de>; Fri, 20 Feb 2026 09:45:19 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id F18A2402B0
	for <lists+greybus-dev@lfdr.de>; Fri, 20 Feb 2026 08:45:18 +0000 (UTC)
Received: from mail-244123.protonmail.ch (mail-244123.protonmail.ch [109.224.244.123])
	by lists.linaro.org (Postfix) with ESMTPS id E6CE13F797
	for <greybus-dev@lists.linaro.org>; Fri, 20 Feb 2026 06:30:15 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=pm.me header.s=protonmail3 header.b=VIHBjfHU;
	spf=pass (lists.linaro.org: domain of hardik.phalet@pm.me designates 109.224.244.123 as permitted sender) smtp.mailfrom=hardik.phalet@pm.me;
	dmarc=pass (policy=quarantine) header.from=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1771569014; x=1771828214;
	bh=eF5nEs1EMSo3dkuaqgnwdJ2Hz3g1DhZo/d7U5mts22w=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=VIHBjfHUxk06/LcODi8EJl+2xLZhaMUIKKxY0NYlH/OPK/3twKI118N03+d64SI9U
	 J3JIYYIBi8yon93tIEiMnd1xBD2wjQqhzg8jEohN1HJ6xvlMgDbWIT9M9t19Z3LSFX
	 pGPDUgemuEg7zF3ekOvOH2Y5s0mDEOG5S1D6XEGGmwOc6MMHc5wXbJhoraOdpvW/AN
	 J5HwVN1WyIzrW32m32Dju5PwHuGwzFP6Of7+HfkctsuPkme+YeeJgFLjsAmvdl8bSC
	 onyOU1NEon/5F/KrWcj0PJjLqCCGPtmL8CjVprnEujMzLJJOH9U8CHw8VtfcdeSU5D
	 02s5KY/Gd3tiw==
Date: Fri, 20 Feb 2026 06:30:10 +0000
To: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
From: Hardik Phalet <hardik.phalet@pm.me>
Message-ID: <20260220062741.399677-2-hardik.phalet@pm.me>
In-Reply-To: <20260220062741.399677-1-hardik.phalet@pm.me>
References: <20260220062741.399677-1-hardik.phalet@pm.me>
Feedback-ID: 166659585:user:proton
X-Pm-Message-ID: e38dc48ebd8090398fd7c8b9b6e58d90ee8b98e0
MIME-Version: 1.0
X-Spamd-Bar: ---
X-MailFrom: hardik.phalet@pm.me
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: DP4LNUR6S7MIMQR42R75VBS247CQAD6R
X-Message-ID-Hash: DP4LNUR6S7MIMQR42R75VBS247CQAD6R
X-Mailman-Approved-At: Fri, 20 Feb 2026 08:44:53 +0000
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Hardik Phalet <hardik.phalet@pm.me>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v2 1/2] staging: greybus: audio: fix NULL dereference in gb_audio_manager_get_module()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/DP4LNUR6S7MIMQR42R75VBS247CQAD6R/>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linaro.org:helo,lists.linaro.org:rdns,pm.me:mid,pm.me:email,linaro.org:email]
X-Rspamd-Queue-Id: EF1CF165DE9
X-Rspamd-Action: no action

gb_audio_manager_get_module() calls gb_audio_manager_get_locked(), which
can return NULL when the requested id does not exist. The returned
pointer is dereferenced unconditionally via kobject_get(), leading to a
NULL pointer dereference.

Only take a kobject reference when the module is found.

Signed-off-by: Hardik Phalet <hardik.phalet@pm.me>
---
 drivers/staging/greybus/audio_manager.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/audio_manager.c b/drivers/staging/greybus/audio_manager.c
index 27ca5f796c5f..1da8804e61ca 100644
--- a/drivers/staging/greybus/audio_manager.c
+++ b/drivers/staging/greybus/audio_manager.c
@@ -111,7 +111,8 @@ struct gb_audio_manager_module *gb_audio_manager_get_module(int id)
 
 	down_read(&modules_rwsem);
 	module = gb_audio_manager_get_locked(id);
-	kobject_get(&module->kobj);
+	if (module)
+		kobject_get(&module->kobj);
 	up_read(&modules_rwsem);
 	return module;
 }
-- 
2.53.0


_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
