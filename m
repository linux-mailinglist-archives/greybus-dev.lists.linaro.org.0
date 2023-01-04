Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id C2BE2660F84
	for <lists+greybus-dev@lfdr.de>; Sat,  7 Jan 2023 15:35:23 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 725613EBAF
	for <lists+greybus-dev@lfdr.de>; Sat,  7 Jan 2023 14:35:22 +0000 (UTC)
Received: from msg-1.mailo.com (msg-1.mailo.com [213.182.54.11])
	by lists.linaro.org (Postfix) with ESMTPS id 5896E3E941
	for <greybus-dev@lists.linaro.org>; Wed,  4 Jan 2023 03:57:50 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=mailo.com header.s=mailo header.b=mhmZWRg7;
	spf=pass (lists.linaro.org: domain of drv@mailo.com designates 213.182.54.11 as permitted sender) smtp.mailfrom=drv@mailo.com;
	dmarc=pass (policy=none) header.from=mailo.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
	t=1672804662; bh=g68WjsKLgm0BGTYxv3eXQb4GtGzcoRHUdOjEJjW3wxY=;
	h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:MIME-Version:
	 Content-Type;
	b=mhmZWRg7q9RRn1gaJqCAY8aA9wv7j52nQH+wxTIS3sijktduushce/wrRS2V2pS8d
	 fDt+TJ2PCt4MRbhjE3a5XsNSTWUPxkvi7xJ/v9vhUF+pCZHEklAiE/+uKf/TNTBaZg
	 Gw5kxjUfHUQdURs8gEz0XTDKWko6/iP1MWGyfnZs=
Received: by b-5.in.mailobj.net [192.168.90.15] with ESMTP
	via ip-206.mailobj.net [213.182.55.206]
	Wed,  4 Jan 2023 04:57:42 +0100 (CET)
X-EA-Auth: X/DPdo8+pBhmvVri8YvZq0puHGhoKFIrcwsvZGLQWmFtOckUnZf5FYyOYxYO9PtuPY2gUj2VwJjiahd9mMMg+B4hq+B0mD0m
Date: Wed, 4 Jan 2023 09:27:37 +0530
From: Deepak R Varma <drv@mailo.com>
To: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Message-ID: <Y7T5MYfANf2xVsEx@qemulion>
MIME-Version: 1.0
Content-Disposition: inline
X-Spamd-Result: default: False [-3.50 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	DMARC_POLICY_ALLOW(-0.50)[mailo.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:213.182.54.0/24];
	R_DKIM_ALLOW(-0.20)[mailo.com:s=mailo];
	MIME_GOOD(-0.10)[text/plain];
	FROM_HAS_DN(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:8304, ipnet:213.182.32.0/19, country:FR];
	NEURAL_HAM(-0.00)[-0.986];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_TWO(0.00)[2];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	DKIM_TRACE(0.00)[mailo.com:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 5896E3E941
X-Spamd-Bar: ---
X-MailFrom: drv@mailo.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: Y3QN7JVXOS77YTE3R6Z5HF6RFCSMK6XS
X-Message-ID-Hash: Y3QN7JVXOS77YTE3R6Z5HF6RFCSMK6XS
X-Mailman-Approved-At: Sat, 07 Jan 2023 14:35:16 +0000
CC: Saurabh Singh Sengar <ssengar@microsoft.com>, Praveen Kumar <kumarpraveen@linux.microsoft.com>, Deepak R Varma <drv@mailo.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] staging: greybus: Replace zero-length array by DECLARE_FLEX_ARRAY() helper
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/Y3QN7JVXOS77YTE3R6Z5HF6RFCSMK6XS/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The code currently uses C90 standard extension based zero length array
struct which is now deprecated and the new C99 standard extension of
flexible array declarations are to be used instead. Also, the macro
DECLARE_FLEX_ARRAY() allows to use single flexible array member in a
structure. Refer to these links [1], [2] for details.

[1] https://gcc.gnu.org/onlinedocs/gcc/Zero-Length.html
[2] https://lkml.kernel.org/r/YxKY6O2hmdwNh8r8@work

Issue identified using Coccinelle flexible_array.cocci semantic patch.

Signed-off-by: Deepak R Varma <drv@mailo.com>
---
 drivers/staging/greybus/usb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/usb.c b/drivers/staging/greybus/usb.c
index 8e9d9d59a357..b7badf87a3f0 100644
--- a/drivers/staging/greybus/usb.c
+++ b/drivers/staging/greybus/usb.c
@@ -27,7 +27,7 @@ struct gb_usb_hub_control_request {
 };

 struct gb_usb_hub_control_response {
-	u8 buf[0];
+	DECLARE_FLEX_ARRAY(u8, buf);
 };

 struct gb_usb_device {
--
2.34.1



_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
