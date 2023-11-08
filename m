Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id E76DB7E5A18
	for <lists+greybus-dev@lfdr.de>; Wed,  8 Nov 2023 16:34:41 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id C36783F45A
	for <lists+greybus-dev@lfdr.de>; Wed,  8 Nov 2023 15:34:40 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	by lists.linaro.org (Postfix) with ESMTPS id D36A13F044
	for <greybus-dev@lists.linaro.org>; Wed,  8 Nov 2023 15:34:34 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b="E/f+JtFB";
	dmarc=pass (policy=none) header.from=kernel.org;
	spf=pass (lists.linaro.org: domain of arnd@kernel.org designates 139.178.84.217 as permitted sender) smtp.mailfrom=arnd@kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 66EE5615F6;
	Wed,  8 Nov 2023 15:34:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 678F0C433C9;
	Wed,  8 Nov 2023 15:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699457674;
	bh=Ou7t4lvswhjUNZZwdkd4kF/0Xw+ejygmyUW1LnOTGQw=;
	h=From:To:Cc:Subject:Date:From;
	b=E/f+JtFB3olupuoN9TGVTWDRFuWEVyl3gbLs7WmFyJBpylxVv1/pI9Pj/dCT0E4Be
	 peA0WwVmI68mM1qcPLAdJz8ApbEf2dFCOP6oXz96J5fwl/0zf3R+Z1Xccj2jsh0/28
	 +IqBPV71v3ud0LWL0Pl9Pv96x1bl8nSHEbooskYAJyCZxqMmEz7hkTEm7J1t3IY4jV
	 XTb5U6VkALLFg5kU2x08cEuqoe8MUw+HAzWvJH317uZji8+79szusbWwXm44cYvYkc
	 U4jN7zmoj2TdXFhxbDHRUrrco/40hzH/Rifb/2PEDgXNMS77SlKQf/SnOG1zeMLKDg
	 YCYLtlYmjqwQA==
From: Arnd Bergmann <arnd@kernel.org>
To: Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Wed,  8 Nov 2023 16:34:24 +0100
Message-Id: <20231108153429.1072732-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: D36A13F044
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.50 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:139.178.84.217];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	ASN(0.00)[asn:54825, ipnet:139.178.80.0/21, country:US];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[arndb.de,gmail.com,lists.linaro.org,vger.kernel.org];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+]
X-Rspamd-Action: no action
Message-ID-Hash: ZIH7REX2MXOBGCIKP2MJ72KXGAIMII37
X-Message-ID-Hash: ZIH7REX2MXOBGCIKP2MJ72KXGAIMII37
X-MailFrom: arnd@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Arnd Bergmann <arnd@arndb.de>, Ayush Singh <ayushdevel1325@gmail.com>, greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] greybus: beagleplay: select CONFIG_CRC_CCITT
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/ZIH7REX2MXOBGCIKP2MJ72KXGAIMII37/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Arnd Bergmann <arnd@arndb.de>

Without the CRC_CCITT code, the new greybus driver fails to link:

aarch64-linux-ld: drivers/greybus/gb-beagleplay.o: in function `hdlc_append_tx_u8':
gb-beagleplay.c:(.text+0x158): undefined reference to `crc_ccitt'
aarch64-linux-ld: drivers/greybus/gb-beagleplay.o: in function `gb_tty_receive':
gb-beagleplay.c:(.text+0x5c4): undefined reference to `crc_ccitt'

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/greybus/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/greybus/Kconfig b/drivers/greybus/Kconfig
index 033d31dbf3b8..ab81ceceb337 100644
--- a/drivers/greybus/Kconfig
+++ b/drivers/greybus/Kconfig
@@ -20,6 +20,7 @@ if GREYBUS
 config GREYBUS_BEAGLEPLAY
 	tristate "Greybus BeaglePlay driver"
 	depends on SERIAL_DEV_BUS
+	select CRC_CCITT
 	help
 	  Select this option if you have a BeaglePlay where CC1352
 	  co-processor acts as Greybus SVC.
-- 
2.39.2

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
