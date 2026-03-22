Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ECK2CD88wWkZRwQAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Mon, 23 Mar 2026 14:12:31 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D3AC2F2940
	for <lists+greybus-dev@lfdr.de>; Mon, 23 Mar 2026 14:12:30 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 4707C3F76C
	for <lists+greybus-dev@lfdr.de>; Mon, 23 Mar 2026 13:12:29 +0000 (UTC)
Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	by lists.linaro.org (Postfix) with ESMTPS id 61E613F764
	for <greybus-dev@lists.linaro.org>; Sun, 22 Mar 2026 03:19:28 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=none;
	spf=pass (lists.linaro.org: domain of pengpeng@iscas.ac.cn designates 159.226.251.25 as permitted sender) smtp.mailfrom=pengpeng@iscas.ac.cn;
	dmarc=none
Received: from localhost.localdomain (unknown [111.196.245.197])
	by APP-05 (Coremail) with SMTP id zQCowADnfBC7X79p0U8eCw--.33787S2;
	Sun, 22 Mar 2026 11:19:23 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: greybus-dev@lists.linaro.org
Date: Sun, 22 Mar 2026 11:19:23 +0800
Message-ID: <20260322031923.58013-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-CM-TRANSID: zQCowADnfBC7X79p0U8eCw--.33787S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Ww4rZr4fXr17JrWruF43GFg_yoW8Jw1UpF
	ZxKFy8tr1vyanxJanxZ3W3WFyFyas5ZFW5uFW8Zw13ZFs8Xrn2v34DGFW5tayfXr4xJ343
	tFW5KFy8CF4kXr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkC14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVWxJr
	0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AFwI0_
	JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67
	AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIY
	rxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14
	v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8
	JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUOgAwDU
	UUU
X-Originating-IP: [111.196.245.197]
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
X-Spamd-Bar: -
X-MailFrom: pengpeng@iscas.ac.cn
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: RWMJVWJYC5XWYEBW63I2IHL64ZKKBSQ6
X-Message-ID-Hash: RWMJVWJYC5XWYEBW63I2IHL64ZKKBSQ6
X-Mailman-Approved-At: Mon, 23 Mar 2026 13:12:28 +0000
CC: pengpeng@iscas.ac.cn, Ayush Singh <ayushdevel1325@gmail.com>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] greybus: beagleplay: bound bootloader RX buffer copy
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/RWMJVWJYC5XWYEBW63I2IHL64ZKKBSQ6/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [1.49 / 15.00];
	DATE_IN_PAST(1.00)[33];
	MID_CONTAINS_FROM(1.00)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[iscas.ac.cn];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-0.999];
	HAS_XOIP(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pengpeng@iscas.ac.cn,greybus-dev-bounces@lists.linaro.org];
	FREEMAIL_CC(0.00)[iscas.ac.cn,gmail.com,kernel.org,vger.kernel.org];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	TAGGED_RCPT(0.00)[greybus-dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,iscas.ac.cn:email,iscas.ac.cn:mid]
X-Rspamd-Queue-Id: 4D3AC2F2940
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

When `flashing_mode` is set, `gb_tty_receive()` routes incoming bytes to
`cc1352_bootloader_rx()`. That helper appends the new bytes to the shared
`rx_buffer` with `memcpy()` but does not check that the chunk fits in the
remaining space first. The normal HDLC receive path already enforces
`MAX_RX_HDLC`, so do the same here before appending bootloader data.

If a packet would overflow the receive buffer, drop it and reset the
bootloader receive state instead of copying past the end of `rx_buffer`.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 drivers/greybus/gb-beagleplay.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/greybus/gb-beagleplay.c b/drivers/greybus/gb-beagleplay.c
index 87186f891a6a..bca3132adacd 100644
--- a/drivers/greybus/gb-beagleplay.c
+++ b/drivers/greybus/gb-beagleplay.c
@@ -535,6 +535,12 @@ static size_t cc1352_bootloader_rx(struct gb_beagleplay *bg, const u8 *data,
 	int ret;
 	size_t off = 0;
 
+	if (count > sizeof(bg->rx_buffer) - bg->rx_buffer_len) {
+		dev_err_ratelimited(&bg->sd->dev, "Bootloader RX buffer overflow");
+		bg->rx_buffer_len = 0;
+		return count;
+	}
+
 	memcpy(bg->rx_buffer + bg->rx_buffer_len, data, count);
 	bg->rx_buffer_len += count;
 
-- 
2.50.1 (Apple Git-155)

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
