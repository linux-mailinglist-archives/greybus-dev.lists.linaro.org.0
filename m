Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GCe5G3SOy2kuIwYAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Tue, 31 Mar 2026 11:05:56 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BCD6366B13
	for <lists+greybus-dev@lfdr.de>; Tue, 31 Mar 2026 11:05:56 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 1E5C9401F0
	for <lists+greybus-dev@lfdr.de>; Tue, 31 Mar 2026 09:05:55 +0000 (UTC)
Received: from yug-MacBookPro.lan (89-81-10-116.abo.bbox.fr [89.81.10.116])
	by lists.linaro.org (Postfix) with ESMTPS id A595C3F7D0
	for <greybus-dev@lists.linaro.org>; Mon, 30 Mar 2026 19:41:22 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=none;
	dmarc=fail reason="No valid SPF, No valid DKIM" header.from=gmail.com (policy=none);
	spf=softfail (lists.linaro.org: 89.81.10.116 is neither permitted nor denied by domain of yug@yug.be) smtp.mailfrom=yug@yug.be
Received: by yug-MacBookPro.lan (Postfix, from userid 1000)
	id AD52DA8771E; Mon, 30 Mar 2026 21:41:21 +0200 (CEST)
From: Yug Merabtene <yug.merabtene@gmail.com>
To: andy@kernel.org,
	gregkh@linuxfoundation.org,
	hvaibhav.linux@gmail.com,
	johan@kernel.org,
	elder@kernel.org,
	vaibhav.sr@gmail.com,
	mgreer@animalcreek.com,
	rmfrfs@gmail.com,
	pure.logic@nexus-software.ie
Date: Mon, 30 Mar 2026 21:41:20 +0200
Message-Id: <20260330194121.987920-2-yug.merabtene@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260330194121.987920-1-yug.merabtene@gmail.com>
References: <20260329184124.775392-1-yug.merabtene@gmail.com>
 <20260330194121.987920-1-yug.merabtene@gmail.com>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Spam-Level: **
X-MailFrom: yug@yug.be
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: 3AJ762XM67SQA7B4C4C4BMDB6QQADIQB
X-Message-ID-Hash: 3AJ762XM67SQA7B4C4C4BMDB6QQADIQB
X-Mailman-Approved-At: Tue, 31 Mar 2026 09:05:48 +0000
CC: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Yug Merabtene <yug.merabtene@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v3 1/2] staging: fbtft: use scnprintf() for log strings
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/3AJ762XM67SQA7B4C4C4BMDB6QQADIQB/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [1.09 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_SPF_ALLOW(-0.20)[+mx:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,linuxfoundation.org,gmail.com,animalcreek.com,nexus-software.ie];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.985];
	FROM_NEQ_ENVFROM(0.00)[yugmerabtene@gmail.com,greybus-dev-bounces@lists.linaro.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,lists.linaro.org,lists.linux.dev,gmail.com];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,lists.linaro.org:helo,lists.linaro.org:rdns]
X-Rspamd-Queue-Id: 4BCD6366B13
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

fbtft_register_framebuffer() formats board details into fixed-size

stack buffers before printing them.

Use scnprintf() for these writes so output stays bounded by the

destination buffer size while keeping the message format unchanged.

Signed-off-by: Yug Merabtene <yug.merabtene@gmail.com>
---
 drivers/staging/fbtft/fbtft-core.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/fbtft/fbtft-core.c b/drivers/staging/fbtft/fbtft-core.c
index f427c0914907..69bd10ccc7e2 100644
--- a/drivers/staging/fbtft/fbtft-core.c
+++ b/drivers/staging/fbtft/fbtft-core.c
@@ -788,10 +788,12 @@ int fbtft_register_framebuffer(struct fb_info *fb_info)
 	fbtft_sysfs_init(par);
 
 	if (par->txbuf.buf && par->txbuf.len >= 1024)
-		sprintf(text1, ", %zu KiB buffer memory", par->txbuf.len >> 10);
+		scnprintf(text1, sizeof(text1), ", %zu KiB buffer memory",
+			  par->txbuf.len >> 10);
 	if (spi)
-		sprintf(text2, ", spi%d.%d at %d MHz", spi->controller->bus_num,
-			spi_get_chipselect(spi, 0), spi->max_speed_hz / 1000000);
+		scnprintf(text2, sizeof(text2), ", spi%d.%d at %d MHz",
+			  spi->controller->bus_num, spi_get_chipselect(spi, 0),
+			  spi->max_speed_hz / 1000000);
 	fb_dbg(fb_info,
 	       "%s frame buffer, %dx%d, %d KiB video memory%s, fps=%lu%s\n",
 	       fb_info->fix.id, fb_info->var.xres, fb_info->var.yres,
-- 
2.34.1

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
