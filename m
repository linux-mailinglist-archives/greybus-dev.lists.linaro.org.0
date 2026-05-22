Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id xdx1HifBEWptpgYAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Sat, 23 May 2026 17:00:55 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 587125BF829
	for <lists+greybus-dev@lfdr.de>; Sat, 23 May 2026 17:00:55 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 67370404BB
	for <lists+greybus-dev@lfdr.de>; Sat, 23 May 2026 14:54:52 +0000 (UTC)
Received: from mta.al2klimov.de (mta.al2klimov.de [162.55.223.79])
	by lists.linaro.org (Postfix) with ESMTPS id AC7B840984
	for <greybus-dev@lists.linaro.org>; Fri, 22 May 2026 05:54:38 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=al2klimov.de header.s=default header.b="FYwA+n/R";
	spf=pass (lists.linaro.org: domain of grandmaster@al2klimov.de designates 162.55.223.79 as permitted sender) smtp.mailfrom=grandmaster@al2klimov.de;
	dmarc=pass (policy=quarantine) header.from=al2klimov.de
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; s=default; bh=RyGYgIbRaf+8
	AAtkWZQb9c0/PbJfOf9/YKYDtDcY/ME=; h=date:subject:cc:to:from;
	d=al2klimov.de; b=FYwA+n/RfiLXt4cgGp32n+yj31T9t8ixKwLyz7/M370vliQFpNGh
	rijVv0fN9QNN69Ni4LgL1o9C4XMPOyuq/I5V2B/eVjwM7odoOAGPXjM9GF1/966UGxqjj9
	kddg7fcxgdTIwdpgwwEcdjnoZStoAZX2txsW8kJpINUXCyRYlY3/cXK77M/maHRbPbOx6W
	R+mFkDNcB3qxMj8TgRFDnVM+KXddn2ac0Y9BQ0Gz5CEyMHPeNyTPgq5YB0g37zLYJj6TuR
	8lPLXSXBy1c/IN9FVNo1CmMwcfjAT1xELXvX+qhqdnY0MkJ7/zwLpBYd1E4NCYhU5QX8er
	NilAlvK0Mg==
Received: from cachy-ak (2a02-2455-18e9-e011-4d8a-aad2-c25c-50e5.dyn6.pyur.net [2a02:2455:18e9:e011:4d8a:aad2:c25c:50e5])
	by mta.al2klimov.de (OpenSMTPD) with ESMTPSA id 5341b239 (TLSv1.3:TLS_CHACHA20_POLY1305_SHA256:256:NO);
	Fri, 22 May 2026 05:54:37 +0000 (UTC)
From: "Alexander A. Klimov" <grandmaster@al2klimov.de>
To: Vaibhav Agarwal <vaibhav.sr@gmail.com>,
	Mark Greer <mgreer@animalcreek.com>,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Elise Lennion <elise.lennion@gmail.com>,
	greybus-dev@lists.linaro.org (moderated list:GREYBUS SUBSYSTEM),
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Date: Fri, 22 May 2026 07:53:43 +0200
Message-ID: <20260522055344.38733-1-grandmaster@al2klimov.de>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Spamd-Bar: --
X-MailFrom: grandmaster@al2klimov.de
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: LB5NIF46S7AHA3R5YRIBZIIIIUU7DYOD
X-Message-ID-Hash: LB5NIF46S7AHA3R5YRIBZIIIIUU7DYOD
X-Mailman-Approved-At: Sat, 23 May 2026 14:54:37 +0000
CC: "Alexander A. Klimov" <grandmaster@al2klimov.de>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v2] staging: greybus: audio: expect 0 from kstrtoint(), not 1
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/LB5NIF46S7AHA3R5YRIBZIIIIUU7DYOD/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [5.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_QUARANTINE(1.50)[al2klimov.de : SPF not aligned (relaxed),quarantine];
	DATE_IN_PAST(1.00)[33];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[al2klimov.de:s=default];
	R_SPF_ALLOW(-0.20)[+mx:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	GREYLIST(0.00)[pass,meta];
	FREEMAIL_TO(0.00)[gmail.com,animalcreek.com,kernel.org,linuxfoundation.org,lists.linaro.org,lists.linux.dev,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[al2klimov.de:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.461];
	FROM_NEQ_ENVFROM(0.00)[grandmaster@al2klimov.de,greybus-dev-bounces@lists.linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linaro.org:rdns,lists.linaro.org:helo,linaro.org:email]
X-Rspamd-Queue-Id: 587125BF829
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

kstrtoint() returns "0 on success, -ERANGE on overflow
and -EINVAL on parsing error". In contrast,
manager_sysfs_remove_store() and manager_sysfs_dump_store()
checked for 1 which always failed the operation. I fixed this.

Fixes: f9a21a3f4919 ("staging: greybus: audio_manager_sysfs: Replace sscanf with kstrto* to single variable conversion.")
Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>
---
 v2: style (X,!X instead of X!=0,X==0)

 drivers/staging/greybus/audio_manager_sysfs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/greybus/audio_manager_sysfs.c b/drivers/staging/greybus/audio_manager_sysfs.c
index fcd518f9540c..581791d566e3 100644
--- a/drivers/staging/greybus/audio_manager_sysfs.c
+++ b/drivers/staging/greybus/audio_manager_sysfs.c
@@ -44,7 +44,7 @@ static ssize_t manager_sysfs_remove_store(struct kobject *kobj,
 
 	int num = kstrtoint(buf, 10, &id);
 
-	if (num != 1)
+	if (num)
 		return -EINVAL;
 
 	num = gb_audio_manager_remove(id);
@@ -65,7 +65,7 @@ static ssize_t manager_sysfs_dump_store(struct kobject *kobj,
 
 	int num = kstrtoint(buf, 10, &id);
 
-	if (num == 1) {
+	if (!num) {
 		num = gb_audio_manager_dump_module(id);
 		if (num)
 			return num;
-- 
2.54.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
