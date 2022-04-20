Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B2CE50922B
	for <lists+greybus-dev@lfdr.de>; Wed, 20 Apr 2022 23:39:05 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 7CFA6402D4
	for <lists+greybus-dev@lfdr.de>; Wed, 20 Apr 2022 21:39:04 +0000 (UTC)
Received: from cyan.elm.relay.mailchannels.net (cyan.elm.relay.mailchannels.net [23.83.212.47])
	by lists.linaro.org (Postfix) with ESMTPS id 3D3884030D
	for <greybus-dev@lists.linaro.org>; Wed, 20 Apr 2022 05:38:13 +0000 (UTC)
X-Sender-Id: dreamhost|x-authsender|ian@linux.cowan.aero
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id E62CB121667;
	Wed, 20 Apr 2022 05:38:11 +0000 (UTC)
Received: from pdx1-sub0-mail-a217.dreamhost.com (unknown [127.0.0.6])
	(Authenticated sender: dreamhost)
	by relay.mailchannels.net (Postfix) with ESMTPA id 4BCF9120CEA;
	Wed, 20 Apr 2022 05:38:11 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1650433091; a=rsa-sha256;
	cv=none;
	b=85AuY+1LQjpGEIlT7C1k3SZb4WNxwePOppjOIqb9zwlL5E+R2Sti/uKZauIYTfmSREv0Hy
	9OFgOLP411uhYvrw5VV66P2t21DrSgP88sEJV2/Y2nqATNpxx7pswWm4ujgOa+/t9ZhKlL
	+kD+pNifYeQfYp4XZOE+hRMyfWCZ6XbfElsVGYP6wz+LpG2j3z7B+PG68AzJglg4mP3L/o
	Tfa5cg42ZbLxDaUdS7RgyWF3/AVFeBx5kqw3ogsGj8YgMv8O4iSKKvbOkKQ90vQRNFb/aZ
	GZLiTSKK5yInb1/eA+Hj8SxfS2b3H4XqdBsw+t2nd7cQWXIHgUM0uhYzfNl+bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1650433091;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:dkim-signature;
	bh=4j5q/8s6WD3XxXc1DfuT+A3MrhJqDvKeJCUERHUYZ9A=;
	b=Jzn1ex0xxRwsStoOzxkEUzJq3tgpi2uTaY+ofL7JSYLBJK5lvuTW6V/oDWPnUax1HBpkR6
	lW6SzK/tyi9grrh2MtV5abEu8ZMDNuenXISlyZ+lTHCH5Fk9m5s59anQbh/JvvKKKAWE2g
	KvxMwOAa5+zCQcoSEgTzhmuiSFBM+hw5uY7N/JSFiaQbtoAAu465GEWvRuI4z+qR4/wE5K
	kiG8Stf9GzRSwPElI0PC0NgLjll21OR4RRRPRIsPNRUonFPmN6rmN1TjqPWi3LEuiZ1hpn
	flcVgEYvgyEaN9XZs371+kNp+tWNcVpeT5knqlXDmmv5DFXRmRb/t5NdL2jQmw==
ARC-Authentication-Results: i=1;
	rspamd-5fd5798557-p2kts;
	auth=pass smtp.auth=dreamhost smtp.mailfrom=ian@linux.cowan.aero
X-Sender-Id: dreamhost|x-authsender|ian@linux.cowan.aero
Received: from pdx1-sub0-mail-a217.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.120.38.131 (trex/6.7.1);
	Wed, 20 Apr 2022 05:38:11 +0000
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|ian@linux.cowan.aero
X-MailChannels-Auth-Id: dreamhost
X-Desert-Wipe: 3817108b53f6f177_1650433091709_3846001985
X-MC-Loop-Signature: 1650433091709:2060611678
X-MC-Ingress-Time: 1650433091709
Received: from localhost.localdomain (unknown [69.12.38.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: ian@linux.cowan.aero)
	by pdx1-sub0-mail-a217.dreamhost.com (Postfix) with ESMTPSA id 4KjqFt2CKMz3H;
	Tue, 19 Apr 2022 22:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.cowan.aero;
	s=dreamhost; t=1650433091;
	bh=4j5q/8s6WD3XxXc1DfuT+A3MrhJqDvKeJCUERHUYZ9A=;
	h=From:To:Cc:Subject:Date:Content-Transfer-Encoding;
	b=Az8I7ralvEJTMLNiawVZqp+XwwEoNoa5F/4PPuHpLoh8HTQIyv3xrbPD2BrhNaFOh
	 Nvy0B7NmVj2+7i2IUxMfBTG3o6oYxbfmM8rRWLj4tmyQRITgfmsABdmzYmd6arm5pb
	 k7w07kOKxyraycHHmLTllIyTlmUh71sveYiiMfJI3wJYh3U2WyutQ0MX6NeS2w8gZP
	 SrkuMfwAvOsYZGbug25mGWSdI3qr8kTpOgVopG4mMzcbo544EN5SCxXyBeXjohH7Bt
	 t9mRGjuSsqFCfcd5AvC4+9BzoROkFnWF4x5k+01T6wVU5k3mz6cf4ekEiBbgD+NCS3
	 ao7sNDmEHjpIQ==
From: Ian Cowan <ian@linux.cowan.aero>
To: vaibhav.sr@gmail.com
Date: Wed, 20 Apr 2022 01:37:55 -0400
Message-Id: <20220420053755.48934-1-ian@linux.cowan.aero>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-MailFrom: ian@linux.cowan.aero
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: OT2UV77GQMSDMC4A3GQ4R23SFNIMC7X5
X-Message-ID-Hash: OT2UV77GQMSDMC4A3GQ4R23SFNIMC7X5
X-Mailman-Approved-At: Wed, 20 Apr 2022 21:39:02 +0000
CC: johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, ian@linux.cowan.aero
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] Staging: greybus: audio manager module: make char array const
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/OT2UV77GQMSDMC4A3GQ4R23SFNIMC7X5/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Make the envp char array a const in the send_add_uevent function since
the value will never change. It will remain an array of the pointers to
the various char arrays.

There does exist a warning when running the checkpatch script to
make this a static variable, but there does not appear to be any advantage
to make this change.

Signed-off-by: Ian Cowan <ian@linux.cowan.aero>
---
 drivers/staging/greybus/audio_manager_module.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/audio_manager_module.c b/drivers/staging/greybus/audio_manager_module.c
index 0a0f0a394c84..c9d223b0e541 100644
--- a/drivers/staging/greybus/audio_manager_module.c
+++ b/drivers/staging/greybus/audio_manager_module.c
@@ -159,7 +159,7 @@ static void send_add_uevent(struct gb_audio_manager_module *module)
 	char ip_devices_string[64];
 	char op_devices_string[64];
 
-	char *envp[] = {
+	const char *envp[] = {
 		name_string,
 		vid_string,
 		pid_string,
-- 
2.32.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
