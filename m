Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 106689469BE
	for <lists+greybus-dev@lfdr.de>; Sat,  3 Aug 2024 14:40:36 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id BB80640A53
	for <lists+greybus-dev@lfdr.de>; Sat,  3 Aug 2024 12:40:34 +0000 (UTC)
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
	by lists.linaro.org (Postfix) with ESMTPS id D0DBA40D1E
	for <greybus-dev@lists.linaro.org>; Sat,  3 Aug 2024 07:22:47 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=riseup.net header.s=squak header.b=AZD89qyq;
	spf=pass (lists.linaro.org: domain of thais_ra@riseup.net designates 198.252.153.129 as permitted sender) smtp.mailfrom=thais_ra@riseup.net;
	dmarc=pass (policy=none) header.from=riseup.net
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx1.riseup.net (Postfix) with ESMTPS id 4WbZ0l05VszDqBP;
	Sat,  3 Aug 2024 07:22:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
	t=1722669767; bh=jUmfbzzcP0ZsExSKht7Ae1zzOEoGcNQ0sCLK5bsnQWw=;
	h=From:To:Cc:Subject:Date:From;
	b=AZD89qyq2yqBN2RLDgtudLTXaNs3lG9f1XTqpC7a4WfAV3xIptgQ1qX8cE25xvcku
	 yyUxyLEpd920gy0OCjfUyfznoGAnITQbxUmRnpMpQ6cdDBH7LL9bdIsGX5XoWDZp+w
	 637hvmGN4nPWDbeWXgrwOXFA8vI7opu6l7LoPUcg=
X-Riseup-User-ID: 141302B49154B1764CEAA4EA4310943641D6856302F7CBF382AB8A5167C32E79
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4WbZ0h2w75zJnBL;
	Sat,  3 Aug 2024 07:22:43 +0000 (UTC)
From: Thais-ra <thais_ra@riseup.net>
To: linux-staging@lists.linux.dev
Date: Sat,  3 Aug 2024 07:22:36 +0000
Message-Id: <20240803072236.368-1-thais_ra@riseup.net>
MIME-Version: 1.0
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: D0DBA40D1E
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.60 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[riseup.net,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:mx1.riseup.net];
	R_DKIM_ALLOW(-0.20)[riseup.net:s=squak];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[198.252.153.129:from];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:16652, ipnet:198.252.153.0/24, country:US];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	DKIM_TRACE(0.00)[riseup.net:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_TWO(0.00)[2];
	TO_DN_NONE(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_TLS_ALL(0.00)[]
X-Rspamd-Action: no action
X-MailFrom: thais_ra@riseup.net
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: K4U3FM5Z6SK3O34SK7DCO3OAYDUKUPZ2
X-Message-ID-Hash: K4U3FM5Z6SK3O34SK7DCO3OAYDUKUPZ2
X-Mailman-Approved-At: Sat, 03 Aug 2024 12:40:28 +0000
CC: ~lkcamp/patches@lists.sr.ht, linux-kernel@vger.kernel.org, greybus-dev@lists.linaro.org, elder@kernel.org, johan@kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] greybus: camera-gb: Fix a alignment bug on gb_camera_ops()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/K4U3FM5Z6SK3O34SK7DCO3OAYDUKUPZ2/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Fix checkpatch message "CHECK: Alignment should match open parenthesis".

Signed-off-by: Thais-ra <thais_ra@riseup.net>
---
Hi, this is my first patch.
---
 drivers/staging/greybus/gb-camera.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/greybus/gb-camera.h b/drivers/staging/greybus/gb-camera.h
index 5fc469101..3e0914743 100644
--- a/drivers/staging/greybus/gb-camera.h
+++ b/drivers/staging/greybus/gb-camera.h
@@ -92,8 +92,8 @@ struct gb_camera_ops {
 			unsigned int *flags, struct gb_camera_stream *streams,
 			struct gb_camera_csi_params *csi_params);
 	int (*capture)(void *priv, u32 request_id,
-			unsigned int streams, unsigned int num_frames,
-			size_t settings_size, const void *settings);
+		       unsigned int streams, unsigned int num_frames,
+		       size_t settings_size, const void *settings);
 	int (*flush)(void *priv, u32 *request_id);
 };
 
-- 
2.20.1

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
