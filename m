Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id EE69B7DC52D
	for <lists+greybus-dev@lfdr.de>; Tue, 31 Oct 2023 05:09:20 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 983703F952
	for <lists+greybus-dev@lfdr.de>; Tue, 31 Oct 2023 04:09:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	by lists.linaro.org (Postfix) with ESMTPS id 621CD3EFD1
	for <greybus-dev@lists.linaro.org>; Tue, 31 Oct 2023 04:09:12 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=infradead.org header.s=bombadil.20210309 header.b=hg4aZ7bZ;
	dmarc=none;
	spf=none (lists.linaro.org: domain of rdunlap@infradead.org has no SPF policy when checking 198.137.202.133) smtp.mailfrom=rdunlap@infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=Cm7wzuH90vimQPyA1MAWxOBXUh0ZmX/mfwrQf/vnoaI=; b=hg4aZ7bZ+P68XcDNuMA+W83Ix7
	IuAPauuIV22ASzDqQeJNucLIVfmEKamSiz7L+lqLsvl7oL4Y0PMkNyngSNGwMF2L6BXXhdDFTnjOY
	Nz3b5/gMioSnLmG45qgOrZ115mb0JeUIYaFfc07OLvm7KfVQqtG7knyGCT4rgRb5gMs/c5kZaSg27
	8VL1hM4gBP/9HIUQBjy6ZqIbomrebipEg6UtZYWVI5BD6tPOlYvJTQmB70c4L3XC6BUyN9o45CLg6
	pB3ir1X7UqaURtJfHB+8PBExDOMaIebnDif1/dpt18R8s/C0K/SIi6NOa2536a7Scwg8YPVF8+HiU
	/9Aw8Igg==;
Received: from [50.53.46.231] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1qxg3x-004VG8-2x;
	Tue, 31 Oct 2023 04:09:09 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Date: Mon, 30 Oct 2023 21:09:09 -0700
Message-ID: <20231031040909.21201-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 621CD3EFD1
X-Spamd-Bar: -
X-Spamd-Result: default: False [-1.70 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=bombadil.20210309];
	ONCE_RECEIVED(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_NA(0.00)[infradead.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:7247, ipnet:198.137.202.0/24, country:US];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_ONE(0.00)[1];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[infradead.org:+];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[infradead.org,gmail.com,linuxfoundation.org,kernel.org,lists.linaro.org];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	R_SPF_NA(0.00)[no SPF record];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Rspamd-Action: no action
Message-ID-Hash: YTKO6Q24TOKG2GJ7B3JYD3AMLWNPYHZP
X-Message-ID-Hash: YTKO6Q24TOKG2GJ7B3JYD3AMLWNPYHZP
X-MailFrom: rdunlap@infradead.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Randy Dunlap <rdunlap@infradead.org>, Ayush Singh <ayushdevel1325@gmail.com>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] greybus: BeaglePlay driver needs CRC_CCITT
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/YTKO6Q24TOKG2GJ7B3JYD3AMLWNPYHZP/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The gb-beagleplay driver uses crc_ccitt(), so it should select
CRC_CCITT to make sure that the function is available.

Fixes these build errors:

s390-linux-ld: drivers/greybus/gb-beagleplay.o: in function `hdlc_append_tx_u8':
gb-beagleplay.c:(.text+0x2c0): undefined reference to `crc_ccitt'
s390-linux-ld: drivers/greybus/gb-beagleplay.o: in function `hdlc_rx_frame':
gb-beagleplay.c:(.text+0x6a0): undefined reference to `crc_ccitt'

Fixes: ec558bbfea67 ("greybus: Add BeaglePlay Linux Driver")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Ayush Singh <ayushdevel1325@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Johan Hovold <johan@kernel.org>
Cc: Alex Elder <elder@kernel.org>
Cc: greybus-dev@lists.linaro.org
---
 drivers/greybus/Kconfig |    1 +
 1 file changed, 1 insertion(+)

diff -- a/drivers/greybus/Kconfig b/drivers/greybus/Kconfig
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
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
