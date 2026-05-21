Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8M95ICbBEWpDpgYAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Sat, 23 May 2026 17:00:54 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 19B555BF812
	for <lists+greybus-dev@lfdr.de>; Sat, 23 May 2026 17:00:54 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 2AE2E404DF
	for <lists+greybus-dev@lfdr.de>; Sat, 23 May 2026 14:54:41 +0000 (UTC)
Received: from mta.al2klimov.de (mta.al2klimov.de [162.55.223.79])
	by lists.linaro.org (Postfix) with ESMTPS id 9AEBD3F75B
	for <greybus-dev@lists.linaro.org>; Thu, 21 May 2026 18:24:25 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=al2klimov.de header.s=default header.b=fmjB48nD;
	spf=pass (lists.linaro.org: domain of grandmaster@al2klimov.de designates 162.55.223.79 as permitted sender) smtp.mailfrom=grandmaster@al2klimov.de;
	dmarc=pass (policy=quarantine) header.from=al2klimov.de
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; s=default; bh=+Nd6ZLTQcww3
	JB/AwzYyGZx3hmDFvcqbIMoVq4gakGM=; h=date:subject:cc:to:from;
	d=al2klimov.de; b=fmjB48nDOj5PmL6VO9Yzq+aUFENa+ffCkaC1faosTnLGDT4EbJBQ
	d/YsbHchbi754U9o16hRiliIslJJrXWefF6K4uTdsyYUPydRqiiTYRO5srsjtIIt21Jmag
	bcaZ6O+Cw8NGEFtplrzc5fVCSgaT+FFz4l4FmmlN4cOm3nW2Vc1Yy/smkhE97KaohnqrJh
	SEw9hxlOEeFhtBO14YHFiU7Zzfs7v9zou52F/5RB6ARr3xZtFao5MfCk2wOU1944booL+s
	lfgbzGhfzyqJXczxHGB+5R/DqTk7X5e5yp44yFw205bRyFdLeSwMbNvXEGCmoBnSSLxrk4
	qjbuCkKPuQ==
Received: from cachy-ak (2a02-2455-18e9-e011-4d8a-aad2-c25c-50e5.dyn6.pyur.net [2a02:2455:18e9:e011:4d8a:aad2:c25c:50e5])
	by mta.al2klimov.de (OpenSMTPD) with ESMTPSA id 8b893f2b (TLSv1.3:TLS_CHACHA20_POLY1305_SHA256:256:NO);
	Thu, 21 May 2026 18:24:22 +0000 (UTC)
From: "Alexander A. Klimov" <grandmaster@al2klimov.de>
To: Vaibhav Agarwal <vaibhav.sr@gmail.com>,
	Mark Greer <mgreer@animalcreek.com>,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Pankaj Bharadiya <pankaj.bharadiya@gmail.com>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	greybus-dev@lists.linaro.org (moderated list:GREYBUS SUBSYSTEM),
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Date: Thu, 21 May 2026 20:23:30 +0200
Message-ID: <20260521182331.22685-1-grandmaster@al2klimov.de>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Spamd-Bar: --
X-MailFrom: grandmaster@al2klimov.de
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: 55PNZZ26URQT5QPWKNDKDU7RYZLHGK23
X-Message-ID-Hash: 55PNZZ26URQT5QPWKNDKDU7RYZLHGK23
X-Mailman-Approved-At: Sat, 23 May 2026 14:54:36 +0000
CC: "Alexander A. Klimov" <grandmaster@al2klimov.de>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v4] staging: greybus: audio: correct sscanf() return value check
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/55PNZZ26URQT5QPWKNDKDU7RYZLHGK23/>
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
	DATE_IN_PAST(1.00)[44];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[al2klimov.de:s=default];
	R_SPF_ALLOW(-0.20)[+mx];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	GREYLIST(0.00)[pass,body];
	FREEMAIL_TO(0.00)[gmail.com,animalcreek.com,kernel.org,linuxfoundation.org,linaro.org,lists.linaro.org,lists.linux.dev,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[al2klimov.de:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.476];
	FROM_NEQ_ENVFROM(0.00)[grandmaster@al2klimov.de,greybus-dev-bounces@lists.linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,lists.linaro.org:rdns,lists.linaro.org:helo]
X-Rspamd-Queue-Id: 19B555BF812
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

manager_sysfs_add_store() passes 6 pointers to sscanf(),
but required latter to return 7 which always failed the operation.
I corrected it to 6.

Fixes: 49b9137a6002 ("staging: greybus: audio: remove redundant slot field")
Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>
---
  v2: added "Fixes:" to commit message
  v3: added all these v2/v3 lines here as requested by Greg KH
  v3: while on it, replaced title
  v4: switched my mail client, so that the diff should apply now (fucking Thunderbird fucking trims fucking whitespace from my fucking patches so I had to fucking switch to fucking git-send-email(1))

 drivers/staging/greybus/audio_manager_sysfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/audio_manager_sysfs.c b/drivers/staging/greybus/audio_manager_sysfs.c
index 581791d566e3..3358d0c34f57 100644
--- a/drivers/staging/greybus/audio_manager_sysfs.c
+++ b/drivers/staging/greybus/audio_manager_sysfs.c
@@ -23,7 +23,7 @@ static ssize_t manager_sysfs_add_store(struct kobject *kobj,
 			desc.name, &desc.vid, &desc.pid, &desc.intf_id,
 			&desc.ip_devices, &desc.op_devices);
 
-	if (num != 7)
+	if (num != 6)
 		return -EINVAL;
 
 	num = gb_audio_manager_add(&desc);
-- 
2.54.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
