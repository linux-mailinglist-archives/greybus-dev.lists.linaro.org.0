Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UNgDMweOA2pN7AEAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Tue, 12 May 2026 22:31:03 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A21F529332
	for <lists+greybus-dev@lfdr.de>; Tue, 12 May 2026 22:30:58 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 8060C401DA
	for <lists+greybus-dev@lfdr.de>; Tue, 12 May 2026 20:30:57 +0000 (UTC)
Received: from mta.al2klimov.de (mta.al2klimov.de [162.55.223.79])
	by lists.linaro.org (Postfix) with ESMTPS id BCB543F7EC
	for <greybus-dev@lists.linaro.org>; Tue, 12 May 2026 06:10:40 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=al2klimov.de header.s=default header.b=U0fL8p3b;
	spf=pass (lists.linaro.org: domain of grandmaster@al2klimov.de designates 162.55.223.79 as permitted sender) smtp.mailfrom=grandmaster@al2klimov.de;
	dmarc=pass (policy=quarantine) header.from=al2klimov.de
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; s=default; bh=FXRdHHWXWAEx
	J9s38Z0mRo0D80CrRpHFA3+q6w7KFgE=; h=in-reply-to:references:cc:to:
	subject:from:date; d=al2klimov.de; b=U0fL8p3bJ6YFbigCbPayl9S+GhYo4tmrN
	GoCz4mnKsjotF/T9p504EF1rHPPWbTnac9FrOZWoDBWjut7TSYw6SLop+XkjxIPyAp/lbI
	7bTtbI+Nedy8eq5UwS1drvCs98HujyItfY6bnNB1eTfHzlbPHn050o2nwPnQ+w2Ax8UfGT
	n1brvavkuI1g6azYz7kDUvBbPc4Fmp3nYXZznyG8QuvjHpLgpNIQQXTXLLM7VE7nPMWRJM
	Kk0uNTIkVCbo9lLJVn9xIJEI2+LTD8kxdeZCITSbSQ+gsPJe2kpvEQqurFIotcggh/9wS6
	2rBobnoPOXxLPnlpulPdei0RGdXeg==
Received: from [IPV6:2a02:2455:18e9:e011:4d8a:aad2:c25c:50e5] (2a02-2455-18e9-e011-4d8a-aad2-c25c-50e5.dyn6.pyur.net [2a02:2455:18e9:e011:4d8a:aad2:c25c:50e5])
	by mta.al2klimov.de (OpenSMTPD) with ESMTPSA id 7b2d9e2d (TLSv1.3:TLS_CHACHA20_POLY1305_SHA256:256:NO);
	Mon, 11 May 2026 20:40:55 +0000 (UTC)
Message-ID: <c17dd24c-2bf1-4ef8-a8d3-79014a75242f@al2klimov.de>
Date: Mon, 11 May 2026 22:10:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: "Alexander A. Klimov" <grandmaster@al2klimov.de>
To: Dan Carpenter <error27@gmail.com>
References: <c758029d-186f-4a9f-b953-90121f43d8d8@al2klimov.de>
 <agGdJFofiZYKqqhr@stanley.mountain>
Content-Language: en-US
In-Reply-To: <agGdJFofiZYKqqhr@stanley.mountain>
X-Spamd-Bar: ---
X-MailFrom: grandmaster@al2klimov.de
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: JBB2SPQSZ3RWZIBI3CP6S2CB36Q7FKEG
X-Message-ID-Hash: JBB2SPQSZ3RWZIBI3CP6S2CB36Q7FKEG
X-Mailman-Approved-At: Tue, 12 May 2026 20:30:53 +0000
CC: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Pankaj Bharadiya <pankaj.bharadiya@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v2] Greybus audio protocols drivers: correct sscanf() return value check
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/JBB2SPQSZ3RWZIBI3CP6S2CB36Q7FKEG/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 9A21F529332
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.99 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[al2klimov.de:s=default];
	DATE_IN_PAST(1.00)[24];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[kernel.org,lists.linaro.org,lists.linux.dev,vger.kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DMARC_DNSFAIL(0.00)[al2klimov.de : query timed out];
	FROM_NEQ_ENVFROM(0.00)[grandmaster@al2klimov.de,greybus-dev-bounces@lists.linaro.org];
	DKIM_TRACE(0.00)[al2klimov.de:-];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	NEURAL_HAM(-0.00)[-0.891];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[al2klimov.de:email,al2klimov.de:mid,lists.linaro.org:helo,lists.linaro.org:rdns]
X-Rspamd-Action: no action

manager_sysfs_add_store() passes 6 pointers to sscanf(),
but required latter to return 7 which failed the operation.
I corrected it to 6.

Fixes: 49b9137a6002 ("staging: greybus: audio: remove redundant slot field")
Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>
---
  drivers/staging/greybus/audio_manager_sysfs.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/audio_manager_sysfs.c b/drivers/staging/greybus/audio_manager_sysfs.c
index fcd518f954..ff323ca815 100644
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
