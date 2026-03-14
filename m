Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id o+teAVuAtWm21AAAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Sat, 14 Mar 2026 16:35:55 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 806D728DB56
	for <lists+greybus-dev@lfdr.de>; Sat, 14 Mar 2026 16:35:54 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 11D4440448
	for <lists+greybus-dev@lfdr.de>; Sat, 14 Mar 2026 15:35:53 +0000 (UTC)
Received: from mout.web.de (mout.web.de [212.227.17.11])
	by lists.linaro.org (Postfix) with ESMTPS id 772AE3F72C
	for <greybus-dev@lists.linaro.org>; Sat, 14 Mar 2026 14:41:09 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=web.de header.s=s29768273 header.b=NTETp2OY;
	spf=pass (lists.linaro.org: domain of Markus.Elfring@web.de designates 212.227.17.11 as permitted sender) smtp.mailfrom=Markus.Elfring@web.de;
	dmarc=pass (policy=quarantine) header.from=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1773499253; x=1774104053; i=markus.elfring@web.de;
	bh=TUz360hSZrUu54zKcPDS6dTf/PZvtYhWjAtRM+8YPJ8=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=NTETp2OYd7EIJ3+YQ7z+sN7AktQ1j/QbTd7cRgokiEgvdD+lQghEstwx2cCw9aqQ
	 EA/iM6y7i9NMQdP6MjwMNrQSYvwFaPS2jxKTIPDFvOjaiPeQzypmDlUgP8lrEF26F
	 Z38Sv2co6nBCzRYFSJcPv67Hfb9jIMCg/7d2ddRU8yMT4CRbAFlrRtUV4EH1dkujX
	 ZV69UKka5hWM0SRjs1V/xn+U2ShQs16bQPfZNVNcqhHN1puMjQyPd1G1qpMMzM1sm
	 2NWYotDYmbrH1eY952v0QkTJ7oFUysfpRjcwD/8sf8dWlOcNnlu32IOlfmoEZb5sF
	 VVc0HzAcMGIwU4gSSg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MCGSW-1vt8Qo498k-00DhnF; Sat, 14
 Mar 2026 15:40:53 +0100
Message-ID: <ad901a22-7c48-41c4-a69a-2fae9ace6664@web.de>
Date: Sat, 14 Mar 2026 15:40:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-staging@lists.linux.dev, greybus-dev@lists.linaro.org,
 Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Johan Hovold <johan@kernel.org>
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
X-Provags-ID: V03:K1:C1aVNNoTLgxKlb3mo3g+q2ghN53soTuv3AeCY5cDoxIkOqQJzig
 UgDqkld2Jj6nND9Qzn5+h3yi7OBLtOl9Hn4FmdyCEsddlQzI4A3eFC7S1bMggv7r+0wrUyh
 7jNcG1eCbPXt6KPCrcZWFMH+LrOQ5onAdlFow2R8R7TAPNM7ixWbahT/brENc9syDQaKfZO
 HA2APJwNNa4A/aFCVf9+g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:bVNS2M8gnFQ=;C9NqzFmjRdInn/7RKP3RyK3FhJe
 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
 YWOmI4Ed+JzGTSbo2O8iK3E/uel23aU/w==
X-Spamd-Bar: ---
X-MailFrom: Markus.Elfring@web.de
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: XXFPA2PC4WZKKPNSIARC56SMZI2KOILH
X-Message-ID-Hash: XXFPA2PC4WZKKPNSIARC56SMZI2KOILH
X-Mailman-Approved-At: Sat, 14 Mar 2026 15:35:52 +0000
CC: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Felix Gu <ustc.gu@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Sakari Ailus <sakari.ailus@linux.intel.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] staging: greybus: gbphy: Omit a redundant pm_runtime_mark_last_busy() call in gb_gbphy_idle()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/XXFPA2PC4WZKKPNSIARC56SMZI2KOILH/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [3.49 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[web.de : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[web.de:s=s29768273];
	R_SPF_ALLOW(-0.20)[+mx];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_FROM(0.00)[web.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,ideasonboard.com,intel.com,linux.intel.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Markus.Elfring@web.de,greybus-dev-bounces@lists.linaro.org];
	DKIM_TRACE(0.00)[web.de:-];
	TAGGED_RCPT(0.00)[greybus-dev];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_SPAM(0.00)[0.349];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linaro.org:helo,lists.linaro.org:rdns]
X-Rspamd-Queue-Id: 806D728DB56
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 14 Mar 2026 15:35:09 +0100

The device's last busy timestamp was set in a wrapper function since
the commit 18c1fe53d186867243f4cf17f4eef60737a16c4c ("PM: runtime:
Mark last busy stamp in pm_request_autosuspend()").
Thus delete a pm_runtime_mark_last_busy() call before
a pm_request_autosuspend() call.

The source code was transformed by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/staging/greybus/gbphy.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/greybus/gbphy.c b/drivers/staging/greybus/gbphy.c
index bdb0f5164a6f..949656e75e8b 100644
--- a/drivers/staging/greybus/gbphy.c
+++ b/drivers/staging/greybus/gbphy.c
@@ -53,7 +53,6 @@ static void gbphy_dev_release(struct device *dev)
 #ifdef CONFIG_PM
 static int gb_gbphy_idle(struct device *dev)
 {
-	pm_runtime_mark_last_busy(dev);
 	pm_request_autosuspend(dev);
 	return 0;
 }
-- 
2.53.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
