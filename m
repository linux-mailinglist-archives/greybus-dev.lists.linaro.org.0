Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qAgREQqOA2pN7AEAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Tue, 12 May 2026 22:31:06 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id C0501529340
	for <lists+greybus-dev@lfdr.de>; Tue, 12 May 2026 22:31:05 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id CA687401B1
	for <lists+greybus-dev@lfdr.de>; Tue, 12 May 2026 20:31:04 +0000 (UTC)
Received: from mta.al2klimov.de (mta.al2klimov.de [162.55.223.79])
	by lists.linaro.org (Postfix) with ESMTPS id 6CD073F77F
	for <greybus-dev@lists.linaro.org>; Tue, 12 May 2026 19:15:57 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=al2klimov.de header.s=default header.b=dF01P+wz;
	spf=pass (lists.linaro.org: domain of grandmaster@al2klimov.de designates 162.55.223.79 as permitted sender) smtp.mailfrom=grandmaster@al2klimov.de;
	dmarc=pass (policy=quarantine) header.from=al2klimov.de
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; s=default; bh=nSrzsEM4v9JY
	jvlMGeLKj765Mq3O901EWWl79pFBeS8=; h=in-reply-to:from:references:cc:to:
	subject:date; d=al2klimov.de; b=dF01P+wz2wQO+ekJj3NFr0nKu4E/KeqyHWUx/V
	1vcL5Dk62yx8Mo7lZ/yMmdHa0UoLybDw64OiNdDrAJzYIJ74XV2hgAa/dW/pQcfBNZ045z
	SoNyhqF8w1z1CG/QchUSKgvkSBdBAgYGzp7fBs/VeCG8fLhk7N7rGAfl3jPPjx3VJoVr7n
	fYk3nSLCarkMf6YGTO+wGY7UC+MB6nO+lV5Qic5+8dJbNx8SlJF79sYawerflUQL7PWB57
	dXMGSRyeLBpAX9ukMsOIxaDZIlr33tN2vPLd7M8yIH+pJV8+iqwtRJe0xmawdxQm6gX/LF
	pJDB4g+zuJNC79Vu6gK6UMhw==
Received: from [IPV6:2a02:2455:18e9:e011:4d8a:aad2:c25c:50e5] (2a02-2455-18e9-e011-4d8a-aad2-c25c-50e5.dyn6.pyur.net [2a02:2455:18e9:e011:4d8a:aad2:c25c:50e5])
	by mta.al2klimov.de (OpenSMTPD) with ESMTPSA id 89055c18 (TLSv1.3:TLS_CHACHA20_POLY1305_SHA256:256:NO);
	Tue, 12 May 2026 19:15:55 +0000 (UTC)
Message-ID: <381ed71b-1db1-45d3-a9be-bf2f8018a611@al2klimov.de>
Date: Tue, 12 May 2026 21:15:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <c758029d-186f-4a9f-b953-90121f43d8d8@al2klimov.de>
 <agGdJFofiZYKqqhr@stanley.mountain>
 <c17dd24c-2bf1-4ef8-a8d3-79014a75242f@al2klimov.de>
 <2026051243-factual-lyricism-6c54@gregkh>
Content-Language: en-US
From: "Alexander A. Klimov" <grandmaster@al2klimov.de>
In-Reply-To: <2026051243-factual-lyricism-6c54@gregkh>
X-Spamd-Bar: ---
X-MailFrom: grandmaster@al2klimov.de
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: SXVLQ7Y3QYIDWOIDFWEW5LSNJGXOAAMC
X-Message-ID-Hash: SXVLQ7Y3QYIDWOIDFWEW5LSNJGXOAAMC
X-Mailman-Approved-At: Tue, 12 May 2026 20:30:54 +0000
CC: Dan Carpenter <error27@gmail.com>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Pankaj Bharadiya <pankaj.bharadiya@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v3] staging: greybus: audio: correct sscanf() return value check
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/SXVLQ7Y3QYIDWOIDFWEW5LSNJGXOAAMC/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: C0501529340
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.49 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[al2klimov.de : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[al2klimov.de:s=default];
	R_SPF_ALLOW(-0.20)[+mx:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,lists.linaro.org,lists.linux.dev,vger.kernel.org];
	NEURAL_SPAM(0.00)[0.477];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[grandmaster@al2klimov.de,greybus-dev-bounces@lists.linaro.org];
	DKIM_TRACE(0.00)[al2klimov.de:-];
	TAGGED_RCPT(0.00)[greybus-dev];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[al2klimov.de:email,al2klimov.de:mid]
X-Rspamd-Action: no action

manager_sysfs_add_store() passes 6 pointers to sscanf(),
but required latter to return 7 which always failed the operation.
I corrected it to 6.

Fixes: 49b9137a6002 ("staging: greybus: audio: remove redundant slot field")
Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>
---
  v2: added "Fixes:" to commit message
  v3: added all these v2/v3 lines here as requested by Greg KH
  v3: while on it, replaced title "Greybus audio protocols drivers:" ...
  v3: ... with "staging: greybus: audio:"

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
